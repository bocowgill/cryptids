#!/usr/bin/env python3
"""Remote-only bounded structural counter/insertion proof stages."""
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
import compose
runner = proof.runner
WORK = ROOT / '.lake/chess-parsimony-counter-20261024'
LAKE = 'lakefile.chess-parsimony-counter-20261024.toml'
TARGET = 'Cryptids.Compilation.Parsimony.Counter'
SUMMARY = dict(schema='parsimony-counter-insertion-v1', status='running', commands=[], gates={},
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
    pins_path = 'docs/chess/campaign-2026-10-22/accepted-769344-pins.json'
    pins = json.loads((ROOT / pins_path).read_text())
    for path, expected in pins.items():
        assert runner.sha(ROOT / path) == expected, 'Accepted/frozen source changed: ' + path
    checked_path = 'docs/chess/parsimony-printer-2026-10-24/counter-insertion/' \
                   'checked-routines-pins.json'
    checked = json.loads((ROOT / checked_path).read_text())
    for path, expected in checked.items():
        assert runner.sha(ROOT / path) == expected, 'Checked routine changed: ' + path
    assert runner.sha(proof.SOURCE) == \
        '2317ad63aab9eb6796508ba6e2df1bb33a61816afd77b55ceb363dab2b20d6ac'
    paths = [str(p.relative_to(ROOT)) for p in
             (ROOT / 'Cryptids/Compilation/Parsimony').glob('*.lean')]
    paths += [LAKE, pins_path, checked_path, 'lean-toolchain', 'lake-manifest.json',
        'scripts/chess_parsimony_counter_20261024/verify.py',
        'scripts/chess_parsimony_counter_20261024/compose.py',
        compose.SHARED, compose.TABLE, compose.NAMES,
        'scripts/chess_parsimony_proof_20261024/verify.py',
        'scripts/chess_parsimony_20261024/pilot.py',
        'scripts/chess_parsimony_20261024/printer.py',
        '.github/workflows/chess_parsimony_proof_20261024.yml',
        'docs/chess/parsimony-printer-2026-10-24/counter-insertion/GATES.md']
    runner.save('source-manifest.json', dict(commit=os.environ['GITHUB_SHA'],
        workflow_commit=os.environ['GITHUB_SHA'], run_id=os.environ['GITHUB_RUN_ID'],
        command='python3 scripts/chess_parsimony_counter_20261024/verify.py', cwd=str(ROOT),
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
    instance = compose.generate(WORK)
    proof.source_check(instance['source'])
    runner.save('instance-plan.json', dict(words=instance['words'], states=instance['states'],
        cells=instance['cells'], source_sha256=runner.sha(instance['source']),
        candidate_sha256=instance['candidate_sha256'], fresh_machine_states=0,
        model_boundary_is_existing_decoder=True,
        all_named_controls_are_existing_physical_states=True))
    runner.checkpoint()
    runner.run('mathlib-cache', ['lake', 'exe', 'cache', 'get',
        'Mathlib.Computability.TuringMachine.PostTuringMachine', 'Mathlib.Data.Nat.Prime.Basic',
        'Mathlib.Algebra.GCDMonoid.Finset', 'Mathlib.Order.Interval.Finset.Nat',
        'Mathlib.NumberTheory.LSeries.RiemannZeta', 'Mathlib.SetTheory.ZFC.Basic',
        'Mathlib.Tactic'], 300)
    failures = []
    for name in ['Common', 'Counter', 'Insertion']:
        try:
            output = runner.run('kernel-' + name.lower(), ['lake', '--wfail', '-f', LAKE,
                'build', 'Cryptids.Compilation.Parsimony.' + name], 240)
            assert 'warning:' not in output and 'error:' not in output
        except AssertionError as error:
            failures.append(dict(module=name, error=str(error)))
            if name == 'Common':
                raise
        else:
            built = ROOT / ('.lake/build/lib/lean/Cryptids/Compilation/Parsimony/' + name + '.olean')
            (WORK / (name + '.olean')).write_bytes(built.read_bytes())
            SUMMARY.setdefault('checked_modules', []).append(name)
            runner.checkpoint()
    runner.save('module-failures.json', failures)
    assert not failures, 'Independent proof modules failed; inspect their separate logs'
    output = runner.run('kernel-extractor', ['lake', '--wfail', '-f', LAKE, 'build',
        'Cryptids.Compilation.Parsimony.Extractor'], 240)
    assert 'warning:' not in output and 'error:' not in output
    built = ROOT / '.lake/build/lib/lean/Cryptids/Compilation/Parsimony/Extractor.olean'
    (WORK / 'Extractor.olean').write_bytes(built.read_bytes())
    SUMMARY.setdefault('checked_modules', []).append('Extractor')
    runner.checkpoint()
    for name in ['IndexedInsertion', 'IndexedExtractor']:
        output = runner.run('kernel-' + name.lower(), ['lake', '--wfail', '-f', LAKE, 'build',
            'Cryptids.Compilation.Parsimony.' + name], 240)
        assert 'warning:' not in output and 'error:' not in output
        built = ROOT / ('.lake/build/lib/lean/Cryptids/Compilation/Parsimony/' + name + '.olean')
        (WORK / (name + '.olean')).write_bytes(built.read_bytes())
        SUMMARY.setdefault('checked_modules', []).append(name)
        runner.checkpoint()
    for name in ['Data']:
        built = ROOT / ('.lake/build/lib/lean/Cryptids/Compilation/Parsimony/' + name + '.olean')
        (WORK / (name + '.olean')).write_bytes(built.read_bytes())
    audit = WORK / 'Audit.lean'
    roots = ['plus_length', 'plus_value', 'plus_exists', 'pass', 'run']
    audit.write_text('import ' + TARGET + '\n' + '\n'.join(
        '#print axioms ConjectureMachines.Compilation.Parsimony.Counter.' + root for root in roots))
    proof.source_check(audit)
    proof.foundations(lean('foundations', audit))
    SUMMARY['gates']['C1'] = True
    audit = WORK / 'InsertionAudit.lean'
    audit.write_text('import Cryptids.Compilation.Parsimony.Insertion\n' + '\n'.join(
        '#print axioms ConjectureMachines.Compilation.Parsimony.Insertion.' + root
        for root in ['charZero', 'charPositive', 'charCarry', 'carryRun', 'zeroRun', 'word']))
    proof.source_check(audit)
    proof.foundations(lean('insertion-foundations', audit))
    audit = WORK / 'ExtractorAudit.lean'
    audit.write_text('import Cryptids.Compilation.Parsimony.Extractor\n' + '\n'.join(
        '#print axioms ConjectureMachines.Compilation.Parsimony.Extractor.' + root
        for root in ['addMany_exists', 'cycle', 'terminal', 'convert', 'convert_safe',
                     'query', 'query_extract']))
    proof.source_check(audit)
    proof.foundations(lean('extractor-foundations', audit))
    audit = WORK / 'IndexedAudit.lean'
    audit.write_text('import Cryptids.Compilation.Parsimony.IndexedExtractor\n' + '\n'.join(
        '#print axioms ConjectureMachines.Compilation.Parsimony.' + root for root in
        ['IndexedInsertion.indexBody', 'IndexedInsertion.word', 'IndexedExtractor.cleanRun',
         'IndexedExtractor.cycle', 'IndexedExtractor.terminal', 'IndexedExtractor.convert',
         'IndexedExtractor.convert_safe', 'IndexedExtractor.query_extract']))
    proof.source_check(audit)
    proof.foundations(lean('indexed-foundations', audit))
    SUMMARY['gates']['W1'] = True
    runner.checkpoint()
    output = lean('all-word-composition', instance['source'], run=True)
    proof.foundations(output)
    assert 'PARSIMONY_ALL_WORDS_EXPORTED' in output
    exported = [tuple(map(int, line.split())) for line in
                instance['source'].with_suffix('.rows').read_text().splitlines()]
    assert exported == instance['actual'], 'All-word local rows differ from fixed candidate'
    changed = list(exported)
    w, d, t = changed[0]
    changed[0] = (1 - w, d, t)
    assert changed != instance['actual']
    runner.save('composition.json', dict(words=instance['words'], rows_compared=len(exported),
        operational_theorem='ParsimonyComposed.allWordsIndexed', full_execution_unrolled=False,
        arbitrary_index_run_certified=True, actual_word_index_used=True,
        proof_source_bytes=instance['source'].stat().st_size,
        proof_source_sha256=runner.sha(instance['source']),
        object_bytes=instance['source'].with_suffix('.olean').stat().st_size,
        object_sha256=runner.sha(instance['source'].with_suffix('.olean')),
        export_sha256=runner.sha(instance['source'].with_suffix('.rows')),
        command_receipt=SUMMARY['commands'][-1], transport_corruption_rejected=True,
        external_binding_is_not_kernel_parser_certification=True))
    SUMMARY['gates']['U1'] = True
    runner.checkpoint()
    corrupted = WORK / 'Corrupted.lean'
    original = instance['source'].read_text()
    target = instance['ids']['convert_incr_no_carry_1']
    needle = '  (1, .left, stateOf ' + str(target) + ')'
    assert original.count(needle) == 1
    corrupted.write_text(original.replace(needle, '  (0, .left, stateOf ' + str(target) + ')'))
    proof.source_check(corrupted)
    rejected = lean('changed-counter-row', corrupted, expected_exit=1)
    assert 'error:' in rejected
    assert runner.sha(ROOT / compose.TABLE) == compose.TABLE_SHA
    for path, expected in pins.items():
        assert runner.sha(ROOT / path) == expected
    for path, expected in checked.items():
        assert runner.sha(ROOT / path) == expected
    SUMMARY['gates']['B1'] = True
    SUMMARY.update(status='counter_insertion_phase_passed', complete_requested_composition=True,
        checked_prefix='Counter, insertion, conversion and full-data local query/extraction',
        remaining=['global printer iteration and termination', 'preamble/epilogue and cleanup',
                   'exact frozen packet identity', 'direct full suffix linking and relocation',
                   'both complete halting directions', 'whole-machine final audits'])
    runner.checkpoint()
    print('PARSIMONY_COUNTER_KERNEL_PASSED', flush=True)
    print('PARSIMONY_INSERTION_KERNEL_PASSED', flush=True)
    print('PARSIMONY_COUNTER_COMPOSITION_PASSED', flush=True)
    print('PARSIMONY_COUNTER_BINDING_AUDIT_PASSED', flush=True)


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
