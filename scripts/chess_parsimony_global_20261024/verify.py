#!/usr/bin/env python3
"""Remote-only bounded global printer iteration and exact packet identity checks."""
import os
if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

import json
from pathlib import Path
import signal
import sys
import time
import traceback

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / 'scripts/chess_parsimony_proof_20261024'))
import verify as proof
runner = proof.runner
WORK = ROOT / '.lake/chess-parsimony-global-20261024'
LAKE = 'lakefile.chess-parsimony-global-20261024.toml'
SUMMARY = dict(schema='parsimony-global-v1', status='running', commands=[], gates={},
    accepted_machine_states=769344, candidate_states=609247, experimental_saving=160097,
    certified_saving=0, complete_printer_certified=False, new_accepted_machine=False,
    limits=dict(total_seconds=1200, generic_seconds=240, composition_seconds=180,
                group_plus_driver_rss_bytes=6 << 30, driver_rss_bytes=512 << 20,
                lean_heap_mib=5120, lean_threads=1))
runner.WORK, runner.SUMMARY, runner.LIMIT = WORK, SUMMARY, 1200
runner.BEGIN = time.monotonic()


def lean(name, path, expected_exit=0, run=False):
    output = runner.run(name, ['lake', '-f', LAKE, 'env', 'lean', '-M5120', '-T2000000',
        '-o', str(path.with_suffix('.olean')), *(['--run'] if run else []), str(path)],
        180, expected_exit=expected_exit)
    if expected_exit == 0:
        assert 'warning:' not in output and 'error:' not in output
    return output


def main():
    WORK.mkdir(parents=True, exist_ok=True)
    signal.alarm(1200)
    assert os.environ['GITHUB_REPOSITORY'] == 'bocowgill/cryptids'
    assert os.environ['RUNNER_ENVIRONMENT'] == 'github-hosted'
    pinfiles = ['docs/chess/campaign-2026-10-22/accepted-769344-pins.json',
        'docs/chess/parsimony-printer-2026-10-24/counter-insertion/checked-routines-pins.json']
    pins = {}
    for name in pinfiles:
        pins.update(json.loads((ROOT / name).read_text()))
    for path, expected in pins.items():
        assert runner.sha(ROOT / path) == expected, 'Frozen/checked source changed: ' + path
    paths = [str(p.relative_to(ROOT)) for p in
             (ROOT / 'Cryptids/Compilation/Parsimony').glob('*.lean')]
    paths += [LAKE, *pinfiles, 'lean-toolchain', 'lake-manifest.json',
        'scripts/chess_parsimony_global_20261024/verify.py',
        'scripts/chess_parsimony_proof_20261024/verify.py',
        'scripts/chess_parsimony_20261024/pilot.py',
        'scripts/chess_parsimony_20261024/printer.py',
        '.github/workflows/chess_parsimony_proof_20261024.yml',
        'docs/chess/parsimony-printer-2026-10-24/global-iteration/GATES.md']
    runner.save('source-manifest.json', dict(commit=os.environ['GITHUB_SHA'],
        workflow_commit=os.environ['GITHUB_SHA'], run_id=os.environ['GITHUB_RUN_ID'],
        command='python3 scripts/chess_parsimony_global_20261024/verify.py', cwd=str(ROOT),
        shell=os.environ.get('SHELL'), path=os.environ.get('PATH'),
        source_sha256={path: runner.sha(ROOT / path) for path in paths},
        frozen_source_sha256=pins))
    runner.save('runner-capacity.json', dict(meminfo=Path('/proc/meminfo').read_text(),
        process_cgroups=Path('/proc/self/cgroup').read_text(),
        memory_files={path: Path(path).read_text() for path in
            ['/sys/fs/cgroup/memory.max', '/sys/fs/cgroup/memory/memory.limit_in_bytes']
            if Path(path).is_file()}))
    for path in paths:
        if path.endswith('.lean'):
            proof.source_check(ROOT / path)
    runner.checkpoint()
    runner.run('mathlib-cache', ['lake', 'exe', 'cache', 'get',
        'Mathlib.Computability.TuringMachine.PostTuringMachine', 'Mathlib.Data.Nat.Prime.Basic',
        'Mathlib.Algebra.GCDMonoid.Finset', 'Mathlib.Order.Interval.Finset.Nat',
        'Mathlib.NumberTheory.LSeries.RiemannZeta', 'Mathlib.SetTheory.ZFC.Basic',
        'Mathlib.Tactic'], 300)
    for name in ['Packet', 'Global']:
        output = runner.run('kernel-' + name.lower(), ['lake', '--wfail', '-f', LAKE,
            'build', 'Cryptids.Compilation.Parsimony.' + name], 240)
        assert 'warning:' not in output and 'error:' not in output
        built = ROOT / ('.lake/build/lib/lean/Cryptids/Compilation/Parsimony/' + name + '.olean')
        (WORK / (name + '.olean')).write_bytes(built.read_bytes())
        SUMMARY.setdefault('checked_modules', []).append(name)
        runner.checkpoint()
    audit = WORK / 'Audit.lean'
    audit.write_text('import Cryptids.Compilation.Parsimony.Global\n' + '\n'.join(
        '#print axioms ConjectureMachines.Compilation.Parsimony.' + root for root in
        ['Packet.encode_value', 'Packet.encode_unique', 'Packet.value_injective',
         'Global.scan', 'Global.tick', 'Global.iterate', 'Global.finish', 'Global.written_reverse']))
    proof.source_check(audit)
    proof.foundations(lean('generic-foundations', audit))
    # The next source-bound checkpoint supplies full-data instantiation after generic checks.
    SUMMARY.update(status='generic_checked_full_data_pending')
    runner.checkpoint()
    print('PARSIMONY_GLOBAL_GENERIC_PASSED', flush=True)


if __name__ == '__main__':
    for sig in (signal.SIGTERM, signal.SIGINT, signal.SIGALRM):
        signal.signal(sig, runner.stop)
    try:
        main()
    except BaseException as error:
        WORK.mkdir(parents=True, exist_ok=True)
        SUMMARY.update(status='failed', failure_type=type(error).__name__, failure=str(error))
        (WORK / 'failure.txt').write_text(traceback.format_exc())
        runner.checkpoint()
        raise
