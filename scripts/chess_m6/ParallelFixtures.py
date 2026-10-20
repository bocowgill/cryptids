#!/usr/bin/env python3
"""Focused range orchestration fixtures; no actual chess evaluator is executed."""
import argparse
import copy
import errno
import hashlib
import importlib.util
import io
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import time
from unittest.mock import patch

sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parents[2]
HERE = Path(__file__).resolve().parent
SCRIPT = ROOT / 'scripts/chess_m6_parallel_parts.py'
SCRATCH = ROOT / '.lake/chess-m6-check/parallel-fixtures'
SCRATCH.mkdir(parents=True, exist_ok=True)
spec = importlib.util.spec_from_file_location('parallel_parts', SCRIPT)
parallel = importlib.util.module_from_spec(spec)
spec.loader.exec_module(parallel)
tables = parallel.tables
ASSERTIONS = 0


def check(value, label):
    global ASSERTIONS
    assert value, label
    ASSERTIONS += 1


def reject(label, function):
    try:
        function()
    except parallel.Error:
        check(True, label)
        print('rejected:', label)
        return
    raise AssertionError('Accepted negative control: ' + label)


def producer(name='a', mode='normal', file=None, marker=None):
    path = HERE / ('producer_' + name + '.py')
    args = [sys.executable, str(path), '--start', '{start}', '--count', '{count}', '--states', '{states}']
    if name == 'a':
        args += ['--mode', mode]
    if file:
        args += ['--file', str(file)]
    if marker:
        args += ['--marker', str(marker)]
    return parallel.make_spec(args, [path] + ([file] if file else []))


def raw_table(path, q):
    with path.open('wb') as out:
        for i in range(q):
            out.write(f'{i % 2}L{(i * 7919 + 1) % q} {(i + 1) % 2}R{(i + 1) % q}\n'.encode())


def same_artifacts(a, b):
    check(sorted(p.name for p in a.iterdir()) == sorted(p.name for p in b.iterdir()), 'same part file set')
    for path in a.iterdir():
        tables._compare_files(path, b / path.name)
        check(True, 'all artifact bytes compared')


def rss_monitor_controls():
    # Exercise the Linux branch on every host without creating a /proc race.
    with patch.object(parallel.sys, 'platform', 'linux'):
        with patch.object(parallel.Path, 'read_text', return_value='19 7 0 0 0 0 0'):
            check(parallel._rss(123) == 7 * os.sysconf('SC_PAGE_SIZE'), 'live Linux RSS retained')
        for error in [FileNotFoundError(errno.ENOENT, 'gone'),
                      ProcessLookupError(errno.ESRCH, 'exited during read')]:
            with patch.object(parallel.Path, 'read_text', side_effect=error):
                check(parallel._rss(123) == 0, 'exited process has zero resident memory')
        for error in [PermissionError(errno.EACCES, 'denied'), OSError(errno.EIO, 'read failed')]:
            with patch.object(parallel.Path, 'read_text', side_effect=error):
                try:
                    parallel._rss(123)
                except OSError as caught:
                    check(caught is error, 'non-exit monitoring error propagated')
                else:
                    raise AssertionError('Non-exit monitoring error was hidden')
    print('Linux RSS exit-race controls passed: 3 accepted, 2 propagated')


def fixtures(base):
    compile(SCRIPT.read_bytes(), str(SCRIPT), 'exec')
    rss_monitor_controls()
    events = []
    q = 43
    result = parallel.run(base / 'parallel', states=q, rows_per_part=7, workers=4,
                          producer=producer(mode='delay'), progress=events.append)
    raw = base / 'raw.txt'
    raw_table(raw, q)
    with raw.open('rb') as source:
        tables.pack(source, base / 'serial', states=q, rows_per_part=7)
    same_artifacts(base / 'parallel/parts', base / 'serial')
    check(result['states_completed'] == q and result['status'] == 'complete', 'all synthetic rows complete')
    order = [e['index'] for e in events if e['event'] == 'range-complete']
    check(order != sorted(order), 'out-of-order process completions actually exercised')
    check(events[-1]['event'] == 'complete', 'success progress emitted only after full artifact')
    check(not list((base / 'parallel/scratch').glob('*.raw')), 'successful raw scratch removed')
    white = ROOT / 'artifacts/chess_m5/white.txt'
    frozen = json.loads((white.parent / 'manifest.json').read_text())['artifacts']['white']
    q = frozen['states']
    result = parallel.run(base / 'm5-parallel', states=q, rows_per_part=4096, workers=3,
                          producer=producer(file=white))
    with white.open('rb') as source:
        tables.pack(source, base / 'm5-serial', states=q, rows_per_part=4096)
    same_artifacts(base / 'm5-parallel/parts', base / 'm5-serial')
    with white.open('rb') as reference:
        verified = tables.verify(base / 'm5-parallel/parts', reference=reference)
    check(verified['raw_sha256'] == frozen['sha256'], 'actual M5 source hash retained')
    check(verified['compared_rows'] == q, 'every actual M5 row compared')
    spec_path = base / 'producer.json'
    parallel._exclusive_json(spec_path, producer())
    loaded = parallel.load_spec(spec_path)
    check(loaded == producer(), 'pinned argv specification roundtrip')
    # A path with spaces and shell metacharacters is an ordinary argv value.
    spaced = base / 'literal path ; no shell.py'
    shutil.copyfile(HERE / 'producer_a.py', spaced)
    literal = parallel.make_spec([sys.executable, str(spaced), '--start', '{start}',
                                 '--count', '{count}', '--states', '{states}'], [spaced])
    parallel.run(base / 'space-path', states=5, rows_per_part=3, workers=2, producer=literal)
    check(True, 'argv path is passed without a shell')
    cli_spec = base / 'cli-producer.json'
    command = [sys.executable, str(SCRIPT), 'spec', '--output', str(cli_spec), '--pin', str(spaced),
               '--', sys.executable, str(spaced), '--start', '{start}', '--count', '{count}',
               '--states', '{states}']
    captured = subprocess.run(command, capture_output=True, timeout=10)
    check(captured.returncode == 0, 'CLI fixed producer specification')
    command = [sys.executable, str(SCRIPT), 'generate', str(base / 'cli-run'), '--producer', str(cli_spec),
               '--states', '5', '--rows-per-part', '3', '--workers', '2']
    generated = subprocess.run(command, capture_output=True, timeout=10)
    check(generated.returncode == 0 and json.loads(generated.stdout.splitlines()[-1])['status'] == 'complete',
          'CLI generation complete status')
    print(json.dumps({'assertions': ASSERTIONS, 'actual_m5_states': q, 'm5_parts': 13}, sort_keys=True))
    print('Parallel table serial equivalence passed')


def comparisons(base):
    q = 101
    source = base / 'source'
    parallel.run(source, states=q, rows_per_part=17, workers=4, producer=producer())
    independent = parallel.run(base / 'comparison', states=q, rows_per_part=17, workers=3,
                               producer=producer('b'), compare_directory=source / 'parts')
    check(independent['compared_rows'] == q, 'every independently exported raw row compared')
    check(independent['comparison'] == 'every-row-byte', 'comparison is not checksum-only')
    check(not (base / 'comparison/parts/manifest.json').exists(), 'comparison-only run makes no artifact')
    reproduced = parallel.run(base / 'reproduction', states=q, rows_per_part=17, workers=2,
                              producer=producer('b'), compare_directory=source / 'parts', reproduce=True)
    check(reproduced['compressed_reproduction'], 'explicit compressed reproduction complete')
    same_artifacts(source / 'parts', base / 'reproduction/parts')
    white = ROOT / 'artifacts/chess_m5/white.txt'
    q = sum(1 for _ in white.open('rb'))
    parallel.run(base / 'm5-source', states=q, rows_per_part=10000, workers=2, producer=producer(file=white))
    compared = parallel.run(base / 'm5-compare', states=q, rows_per_part=10000, workers=4,
                            producer=producer('b', file=white), compare_directory=base / 'm5-source/parts',
                            reproduce=True)
    check(compared['compared_rows'] == q, 'every M5 row read from separate producer implementation')
    same_artifacts(base / 'm5-source/parts', base / 'm5-compare/parts')
    with white.open('rb') as reference:
        tables.pack(reference, base / 'm5-serial-large-parts', states=q, rows_per_part=10000)
    same_artifacts(base / 'm5-source/parts', base / 'm5-serial-large-parts')
    print(json.dumps({'assertions': ASSERTIONS, 'm5_compared_rows': q}, sort_keys=True))
    print('Parallel table independent comparison passed')


def negatives(base):
    ordinal = 0
    def failed(mode, **options):
        nonlocal ordinal
        ordinal += 1
        target = base / f'failure-{ordinal}'
        label = 'aggregate RSS cap' if options.get('rss_limit') == 1 else mode
        reject(label, lambda: parallel.run(target, states=23, rows_per_part=7, workers=3,
                                          producer=producer(mode=mode), timeout=.2 if mode == 'hang' else 10,
                                          **options))
        if (target / 'run.json').exists():
            journal = json.loads((target / 'run.json').read_text())
            check(journal['status'] == 'failed', 'failure remains explicitly failed')
            check(not (target / 'parts/manifest.json').exists(), 'failed range set has no complete manifest')
    for mode in ['truncated', 'extra', 'out-of-range', 'malformed', 'nonzero', 'hang', 'stderr']:
        failed(mode)
    failed('normal', rss_limit=1)
    source = base / 'source'
    parallel.run(source, states=23, rows_per_part=7, producer=producer(), workers=2)
    for mode in ['changed', 'reverse', 'truncated', 'extra', 'nonzero', 'out-of-range']:
        ordinal += 1
        reject('independent ' + mode, lambda m=mode, n=ordinal:
               parallel.run(base / f'compare-{n}', states=23, rows_per_part=7, producer=producer(mode=m),
                            workers=2, compare_directory=source / 'parts'))
    reject('existing run directory', lambda: parallel.run(source, states=23, rows_per_part=7, producer=producer()))
    reject('comparison cannot resume', lambda: parallel.run(base / 'invalid-resume', states=23,
           rows_per_part=7, producer=producer('b'), compare_directory=source / 'parts', resume=True))
    for count in [0, 5]:
        reject('invalid worker count', lambda n=count: parallel.run(base / f'workers-{n}', states=5,
               rows_per_part=3, producer=producer(), workers=n))
    reject('range bound', lambda: parallel.run(base / 'large-range', states=3_000_000,
           rows_per_part=2_000_001, producer=producer()))
    wrong = producer()
    wrong['pins'][wrong['argv'][0]] = '0' * 64
    reject('stale executable fingerprint', lambda: parallel.run(base / 'stale-exe', states=5, producer=wrong))
    wrong = producer()
    wrong['argv'][wrong['argv'].index('{start}')] = '{missing}'
    reject('unknown placeholder', lambda: parallel.run(base / 'unknown-placeholder', states=5, producer=wrong))
    wrong = producer()
    wrong['argv'] = [arg.replace('{count}', '3') for arg in wrong['argv']]
    reject('missing count placeholder', lambda: parallel.run(base / 'missing-placeholder', states=5, producer=wrong))
    # A transient exporter failure is retried under the same pinned source and argv.
    marker = base / 'transient-failure-marker'
    spec = producer(mode='fail-once', marker=marker)
    resumable = base / 'resume'
    reject('transient partial generation', lambda: parallel.run(resumable, states=23, rows_per_part=7,
                                                               workers=1, producer=spec))
    journal = json.loads((resumable / 'run.json').read_text())
    check(len(journal['completed']) == 1, 'successful prefix recorded before transient failure')
    retained = resumable / 'parts/part-00000000.txt.gz'
    identity = retained.read_bytes(), retained.stat().st_mtime_ns
    resumed = parallel.run(resumable, states=23, rows_per_part=7, workers=2, producer=spec, resume=True)
    check(resumed['states_completed'] == 23, 'explicit same-identity resume completes')
    check([a['workers'] for a in resumed['attempts']] == [1, 2], 'resource changes are separately recorded')
    check((retained.read_bytes(), retained.stat().st_mtime_ns) == identity, 'completed part never overwritten')
    reject('stale resume settings', lambda: parallel.run(resumable, states=23, rows_per_part=6,
                                                        workers=1, producer=spec, resume=True))
    duplicated = base / 'duplicate-journal'
    shutil.copytree(resumable, duplicated)
    tampered = json.loads((duplicated / 'run.json').read_text())
    tampered['completed'].reverse()
    (duplicated / 'run.json').write_bytes(parallel._canonical(tampered))
    reject('reordered resume records', lambda: parallel.run(duplicated, states=23, rows_per_part=7,
                                                           workers=1, producer=spec, resume=True))
    missing = base / 'missing-completed'
    shutil.copytree(resumable, missing)
    (missing / 'parts/part-00000000.txt.gz').unlink()
    reject('missing completed range', lambda: parallel.run(missing, states=23, rows_per_part=7,
                                                          workers=1, producer=spec, resume=True))
    copied = base / 'pinned source.py'
    shutil.copyfile(HERE / 'producer_a.py', copied)
    pin = parallel.make_spec([sys.executable, str(copied), '--start', '{start}', '--count', '{count}',
                             '--states', '{states}'], [copied])
    copied.write_text(copied.read_text() + '\n# altered identity\n')
    reject('stale source fingerprint', lambda: parallel.run(base / 'stale-source', states=5, producer=pin))
    corrupt = base / 'corrupt'
    shutil.copytree(source / 'parts', corrupt)
    path = corrupt / 'part-00000000.txt.gz'
    path.write_bytes(path.read_bytes()[:-3])
    reject('malformed original part', lambda: parallel.run(base / 'compare-corrupt', states=23,
           rows_per_part=7, producer=producer('b'), compare_directory=corrupt))
    original = json.loads((source / 'parts/manifest.json').read_text())
    original['parts'].reverse()
    (source / 'parts/manifest.json').write_bytes(tables._manifest_bytes(original))
    reject('reordered original parts', lambda: parallel.run(base / 'compare-reordered', states=23,
           rows_per_part=7, producer=producer('b'), compare_directory=source / 'parts'))
    print(json.dumps({'assertions': ASSERTIONS}, sort_keys=True))
    print('Parallel table rejection controls passed')


def profile_worker(q):
    start = time.monotonic()
    with tempfile.TemporaryDirectory(prefix='parallel-profile-', dir=SCRATCH) as temporary:
        base = Path(temporary)
        per_part = min(250_000, q // 4)
        generated = parallel.run(base / 'generated', states=q, rows_per_part=per_part, workers=4,
                                  producer=producer(), timeout=20)
        middle = time.monotonic()
        compared = parallel.run(base / 'independent', states=q, rows_per_part=per_part, workers=4,
                                 producer=producer('b'), compare_directory=base / 'generated/parts',
                                 reproduce=True, timeout=20)
        compared_at = time.monotonic()
        raw = base / 'serial-reference.txt'
        raw_table(raw, q)
        with raw.open('rb') as reference:
            tables.pack(reference, base / 'serial-parts', states=q, rows_per_part=per_part)
        same_artifacts_silent = [tables._compare_files(path, base / 'serial-parts' / path.name)
                                 for path in (base / 'generated/parts').iterdir()]
        stop = time.monotonic()
        print(json.dumps({'states': q, 'rows_per_range': per_part, 'workers': 4,
                          'generation_seconds': middle - start, 'independent_compare_reproduce_seconds': compared_at - middle,
                          'serial_fixture_seconds': stop - compared_at,
                          'total_seconds': stop - start, 'generation_rows_per_second': q / (middle - start),
                          'peak_sampled_rss_bytes': max(generated['peak_sampled_rss_bytes'], compared['peak_sampled_rss_bytes']),
                          'compared_rows': compared['compared_rows'],
                          'observed_peak_active_producers': max(generated['peak_active_producers'], compared['peak_active_producers']),
                          'source_sha256': parallel._hash(SCRIPT)}, sort_keys=True))


def profiles():
    records = []
    for q in [100_000, 1_000_000]:
        command = [sys.executable, str(Path(__file__).resolve()), '--worker', str(q)]
        result = subprocess.run(command, cwd=ROOT, text=True, capture_output=True, timeout=60)
        print(result.stdout + result.stderr, end='')
        check(result.returncode == 0, 'capped profile subprocess exits zero')
        record = json.loads(result.stdout)
        check(record['total_seconds'] < 60 and record['peak_sampled_rss_bytes'] < parallel.MAX_RSS,
              'profile time and aggregate RSS caps')
        check(record['compared_rows'] == q, 'profile compares every row')
        check(1 <= record['observed_peak_active_producers'] <= 4, 'observed concurrency stays bounded')
        record.update(command=command, exit_status=result.returncode)
        records.append(record)
    (SCRATCH / 'profiles.json').write_text(json.dumps(records, indent=2) + '\n')
    print('Parallel table bounded profiles passed')


def main():
    parser = argparse.ArgumentParser()
    group = parser.add_mutually_exclusive_group(required=True)
    for mode in ['fixtures', 'compare', 'negative', 'profile', 'all']:
        group.add_argument('--' + mode, action='store_true')
    group.add_argument('--worker', type=int)
    args = parser.parse_args()
    if args.worker:
        profile_worker(args.worker)
        return
    if args.profile:
        profiles()
        return
    if args.all:
        for mode in ['fixtures', 'compare', 'negative', 'profile']:
            result = subprocess.run([sys.executable, str(Path(__file__).resolve()), '--' + mode],
                                    cwd=ROOT, timeout=90)
            check(result.returncode == 0, mode)
        print('Parallel table focused verification passed')
        return
    with tempfile.TemporaryDirectory(prefix='parallel-tests-', dir=SCRATCH) as temporary:
        base = Path(temporary)
        if args.fixtures:
            fixtures(base)
        elif args.compare:
            comparisons(base)
        else:
            negatives(base)


if __name__ == '__main__':
    main()
