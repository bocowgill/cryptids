#!/usr/bin/env python3
"""Remote-only bounded global printer iteration and exact packet identity checks."""
import os
if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

import json
import importlib.util
from pathlib import Path
import signal
import sys
import time
import traceback

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / 'scripts/chess_parsimony_proof_20261024'))
import verify as proof
spec = importlib.util.spec_from_file_location('global_compose',
    ROOT / 'scripts/chess_parsimony_global_20261024/compose.py')
compose = importlib.util.module_from_spec(spec)
spec.loader.exec_module(compose)
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
        'scripts/chess_parsimony_global_20261024/compose.py',
        'scripts/chess_parsimony_counter_20261024/compose.py',
        compose.counter.SHARED, compose.counter.TABLE, compose.counter.NAMES, compose.PACKET,
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
    instance = compose.generate(WORK)
    for key in ['source', 'global_source', 'identity_source', 'common_source']:
        proof.source_check(instance[key])
    for source_batch in instance['batches']:
        proof.source_check(source_batch)
    runner.save('instance-plan.json', dict(words=instance['words'], chunks=instance['chunks'],
        states=instance['states'], cells=instance['cells'], final_post=instance['final_post'],
        packet_bits=instance['packet_bits'], framed_bits=instance['framed_bits'],
        packet_sha256=instance['packet_sha256'], candidate_sha256=instance['candidate_sha256'],
        generated_sha256={key: runner.sha(instance[key]) for key in
            ['source', 'global_source', 'identity_source', 'common_source']},
        batch_source_sha256={p.name: runner.sha(p) for p in instance['batches']},
        fresh_machine_states=0))
    runner.checkpoint()
    runner.run('mathlib-cache', ['lake', 'exe', 'cache', 'get',
        'Mathlib.Computability.TuringMachine.PostTuringMachine', 'Mathlib.Data.Nat.Prime.Basic',
        'Mathlib.Algebra.GCDMonoid.Finset', 'Mathlib.Order.Interval.Finset.Nat',
        'Mathlib.NumberTheory.LSeries.RiemannZeta', 'Mathlib.SetTheory.ZFC.Basic',
        'Mathlib.Tactic'], 300)
    generic_failures = []
    for name in ['Packet', 'Global']:
        try:
            output = runner.run('kernel-' + name.lower(), ['lake', '--wfail', '-f', LAKE,
                'build', 'Cryptids.Compilation.Parsimony.' + name], 240)
            assert 'warning:' not in output and 'error:' not in output
        except AssertionError as error:
            generic_failures.append(dict(module=name, error=str(error)))
        else:
            built = ROOT / ('.lake/build/lib/lean/Cryptids/Compilation/Parsimony/' + name + '.olean')
            (WORK / (name + '.olean')).write_bytes(built.read_bytes())
            SUMMARY.setdefault('checked_modules', []).append(name)
            runner.checkpoint()
    runner.save('generic-failures.json', generic_failures)
    assert not generic_failures, 'Strict generic stages failed; inspect separate retained logs'
    audit = WORK / 'Audit.lean'
    audit.write_text('import Cryptids.Compilation.Parsimony.Global\n' + '\n'.join(
        '#print axioms ConjectureMachines.Compilation.Parsimony.' + root for root in
        ['Packet.encode_value', 'Packet.encode_unique', 'Packet.value_injective',
         'Packet.render_range', 'Packet.indexed_render',
         'Global.scan', 'Global.tick', 'Global.iterate', 'Global.finish', 'Global.finish_left', 'Global.written_reverse']))
    proof.source_check(audit)
    proof.foundations(lean('generic-foundations', audit))
    os.environ['LEAN_PATH'] = str(WORK)
    output = lean('all-word-macros', instance['source'], run=True)
    proof.foundations(output)
    assert 'PARSIMONY_ALL_WORDS_EXPORTED' in output
    exported = [tuple(map(int, line.split())) for line in
                instance['source'].with_suffix('.rows').read_text().splitlines()]
    assert exported == instance['actual'], 'Rows differ from unchanged complete candidate'
    output = lean('global-iteration', instance['global_source'])
    proof.foundations(output)
    assert "'ParsimonyComposed.global_terminated' depends on axioms:" in output
    SUMMARY['gates']['I1'] = True
    runner.checkpoint()
    proof.foundations(lean('packet-common', instance['common_source']))
    for index, source_batch in enumerate(instance['batches']):
        output = lean('identity-batch-' + str(index).zfill(2), source_batch)
        proof.foundations(output)
        SUMMARY['checked_identity_words'] = min((index + 1) * 256, 13360)
        SUMMARY['checked_identity_batches'] = index + 1
        runner.checkpoint()
    output = lean('frozen-packet-identity', instance['identity_source'])
    proof.foundations(output)
    assert "'ParsimonyComposed.global_bits_identity' depends on axioms:" in output
    SUMMARY['gates']['P1'] = True
    runner.checkpoint()
    positive = WORK / 'PositiveControl.lean'
    positive.write_text("""import Identity

open ParsimonyComposed
open ConjectureMachines.Compilation

theorem packet_first_control : (Parsimony.Packet.render 13 (numeric sub0)).head? =
    some '1' := by
  rw [packet_chunk0]
  decide +kernel

#print axioms packet_first_control
""")
    proof.source_check(positive)
    proof.foundations(lean('positive-first-bit', positive))
    corrupted = WORK / 'Corrupted.lean'
    original = positive.read_text()
    assert original.count("'1'") == 1
    corrupted.write_text(original.replace("'1'", "'0'"))
    proof.source_check(corrupted)
    rejected = lean('changed-frozen-packet', corrupted, expected_exit=1)
    assert 'error:' in rejected
    for path, expected in pins.items():
        assert runner.sha(ROOT / path) == expected, path
    assert runner.sha(ROOT / compose.counter.TABLE) == compose.counter.TABLE_SHA
    assert runner.sha(ROOT / compose.PACKET) == compose.PACKET_SHA
    runner.save('composition.json', dict(words=instance['words'], chunks=instance['chunks'],
        rows_compared=len(exported), full_execution_unrolled=False,
        iteration_theorem='ParsimonyComposed.global_terminated',
        identity_theorem='ParsimonyComposed.global_bits_identity',
        framing_theorem='ParsimonyComposed.packet_framing',
        frozen_packet_sha256=compose.PACKET_SHA, frozen_packet_bits=instance['packet_bits'],
        framed_bits=instance['framed_bits'], fresh_machine_states=0,
        output_includes_width_padding_zeros=3, packet_offset=33,
        complete_blank_startup=False, complete_printer_certified=False,
        external_binding_is_not_kernel_file_parser=True,
        artifact_to_TableSeed_ChessCodec_bits_bridge=False,
        generated={key: dict(source_sha256=runner.sha(instance[key]),
            source_bytes=instance[key].stat().st_size,
            object_sha256=runner.sha(instance[key].with_suffix('.olean')),
            object_bytes=instance[key].with_suffix('.olean').stat().st_size)
            for key in ['source', 'global_source', 'identity_source', 'common_source']},
        batches={path.name: dict(source_sha256=runner.sha(path),
            object_sha256=runner.sha(path.with_suffix('.olean')),
            object_bytes=path.with_suffix('.olean').stat().st_size)
            for path in instance['batches']}))
    SUMMARY['gates']['B1'] = True
    SUMMARY.update(status='global_iteration_packet_identity_passed',
        complete_requested_composition=True,
        remaining=['preamble and epilogue', 'marker and tail cleanup',
            'artifact to TableSeed.ChessCodec.bits proof bridge',
            'direct suffix linking and relocation', 'both complete halting directions',
            'whole-machine final audits'])
    runner.checkpoint()
    print('PARSIMONY_GLOBAL_ITERATION_PASSED', flush=True)
    print('PARSIMONY_FROZEN_PACKET_IDENTITY_PASSED', flush=True)
    print('PARSIMONY_GLOBAL_BINDING_PASSED', flush=True)



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
