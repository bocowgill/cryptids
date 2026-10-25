#!/usr/bin/env python3
"""Remote-only complete printer proof, bounded to one source-bound run."""
import os
if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

import hashlib
import importlib.util
import json
from pathlib import Path
import re
import shutil
import signal
import sys
import time
import traceback
import zipfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / 'scripts/chess_parsimony_proof_20261024'))
import verify as proof
spec = importlib.util.spec_from_file_location('complete_compose', Path(__file__).with_name('compose.py'))
compose = importlib.util.module_from_spec(spec)
spec.loader.exec_module(compose)
runner = proof.runner
WORK = ROOT / '.lake/chess-parsimony-complete-20261024'
LAKE = 'lakefile.chess-parsimony-global-20261024.toml'
DOC = 'docs/chess/parsimony-printer-2026-10-25/complete-printer'
OLD = ROOT / 'docs/chess/parsimony-printer-2026-10-25/output-wrapper/evidence/wrapper-01'
ARCHIVE = 'c60f67dad955c4506bcefa400d7b56b3e2531d9b835f5f2bb3edef2ff1c48118'
PRODUCER = '13ba1c5e5b2d8810f2d99d8be5185236b46ba54e'
TABLE = ROOT / ('docs/chess/parsimony-printer-2026-10-24/evidence/validation-04/'
                'unpacked/full-candidate-rows.bin')
PACKET = ROOT / ('docs/chess/campaign-2026-10-22/round-04/evidence/packet-02/'
                 'unpacked/packet.bits')
SUMMARY = dict(schema='parsimony-complete-printer-v1', status='running', commands=[], gates={},
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
        proof.foundations(output)
    return output


def main():
    WORK.mkdir(parents=True, exist_ok=True)
    signal.alarm(1200)
    assert os.environ['GITHUB_REPOSITORY'] == 'bocowgill/cryptids'
    assert os.environ['RUNNER_ENVIRONMENT'] == 'github-hosted'
    pins, pinfiles = {}, ['docs/chess/campaign-2026-10-22/accepted-769344-pins.json',
        'docs/chess/parsimony-printer-2026-10-24/global-iteration/checked-routines-pins.json']
    for name in pinfiles:
        pins.update(json.loads((ROOT / name).read_text()))
    for path, expected in pins.items():
        assert runner.sha(ROOT / path) == expected, 'Frozen/checked source changed: ' + path
    assert runner.sha(OLD / 'artifact.zip') == ARCHIVE
    previous = json.loads((OLD / 'unpacked/source-manifest.json').read_text())
    prior_summary = json.loads((OLD / 'unpacked/pilot-summary.json').read_text())
    assert previous['commit'] == PRODUCER and str(previous['run_id']) == '40198826275'
    assert prior_summary['status'] == 'wrapper_identity_and_control_passed'
    previous_plan = json.loads((OLD / 'unpacked/wrapper-plan.json').read_text())
    assert runner.sha(TABLE) == previous_plan['candidate_sha256']
    assert runner.sha(PACKET) == previous_plan['packet_sha256']
    for name in ['lean-toolchain', 'lake-manifest.json', LAKE]:
        assert runner.sha(ROOT / name) == previous['source_sha256'][name]
    files = {}
    with zipfile.ZipFile(OLD / 'artifact.zip') as archive:
        for obj in sorted((OLD / 'unpacked').glob('*.olean')):
            for source in [obj.with_suffix('.lean'), obj]:
                with archive.open(source.name) as stream:
                    assert hashlib.file_digest(stream, 'sha256').hexdigest() == runner.sha(source)
                files[source.name] = dict(sha256=runner.sha(source), bytes=source.stat().st_size)
                shutil.copyfile(source, WORK / source.name)
    assert len(files) == 120
    runner.save('reuse.json', dict(producer=PRODUCER, run=40198826275,
        archive_sha256=ARCHIVE, files=files, packet_batches_reused=53, packet_words=13360,
        packet_batch_recompilations=0, normal_checked_module_imports=True))
    shutil.copyfile(Path(__file__).with_name('Cleanup.lean'), WORK / 'Cleanup.lean')
    instance = compose.generate(WORK, OLD / 'unpacked', TABLE)
    paths = [LAKE, *pinfiles, 'lean-toolchain', 'lake-manifest.json',
        'scripts/chess_parsimony_complete_20261025/verify.py',
        'scripts/chess_parsimony_complete_20261025/compose.py',
        'scripts/chess_parsimony_complete_20261025/Cleanup.lean',
        'scripts/chess_parsimony_complete_20261025/review.py',
        'scripts/chess_parsimony_proof_20261024/verify.py',
        'scripts/chess_parsimony_20261024/pilot.py',
        'scripts/chess_parsimony_20261024/printer.py',
        '.github/workflows/chess_parsimony_proof_20261024.yml', DOC + '/GATES.md']
    paths += [str(p.relative_to(ROOT)) for p in
        (ROOT / 'Cryptids/Compilation/Parsimony').glob('*.lean')]
    runner.save('source-manifest.json', dict(commit=os.environ['GITHUB_SHA'],
        workflow_commit=os.environ['GITHUB_SHA'], run_id=os.environ['GITHUB_RUN_ID'],
        command='python3 scripts/chess_parsimony_complete_20261025/verify.py', cwd=str(ROOT),
        shell=os.environ.get('SHELL'), path=os.environ.get('PATH'),
        source_sha256={path: runner.sha(ROOT / path) for path in paths},
        frozen_source_sha256=pins, prior_producer=PRODUCER, prior_archive_sha256=ARCHIVE))
    runner.save('runner-capacity.json', dict(meminfo=Path('/proc/meminfo').read_text(),
        process_cgroups=Path('/proc/self/cgroup').read_text(),
        memory_files={p: Path(p).read_text() for p in
            ['/sys/fs/cgroup/memory.max', '/sys/fs/cgroup/memory/memory.limit_in_bytes']
            if Path(p).is_file()}))
    for path in WORK.glob('*.lean'):
        proof.source_check(path)
    runner.save('instance-plan.json', dict(words=13360, chunks=instance['chunks'],
        packet_bits=instance['packet_bits'], final_scan=instance['final_scan'],
        chunk_scan_counts=instance['chunk_states'], candidate_sha256=runner.sha(TABLE),
        packet_sha256=runner.sha(PACKET), fresh_states=0, paid_printer_states=13545,
        existing_decoder_boundary=13545, generated_sha256={p.name: runner.sha(p)
            for p in [WORK / 'Cleanup.lean', instance['model'], *instance['batches'], instance['final']]}))
    runner.checkpoint()
    runner.run('mathlib-cache', ['lake', 'exe', 'cache', 'get',
        'Mathlib.Computability.TuringMachine.PostTuringMachine', 'Mathlib.Data.Nat.Prime.Basic',
        'Mathlib.Algebra.GCDMonoid.Finset', 'Mathlib.Order.Interval.Finset.Nat',
        'Mathlib.NumberTheory.LSeries.RiemannZeta', 'Mathlib.SetTheory.ZFC.Basic',
        'Mathlib.Tactic'], 300)
    output = runner.run('kernel-frozen-global', ['lake', '--wfail', '-f', LAKE, 'build',
        'Cryptids.Compilation.Parsimony.Global'], 240)
    assert 'warning:' not in output and 'error:' not in output
    os.environ['LEAN_PATH'] = str(WORK)
    lean('structural-cleanup', WORK / 'Cleanup.lean')
    output = lean('complete-model-rows', instance['model'])
    assert 'PARSIMONY_COMPLETE_PRINTER_ROWS_EXPORTED' in output
    import struct
    record = struct.Struct('<BBI')
    raw = TABLE.read_bytes()
    actual = [tuple(map(int, line.split())) for line in (WORK / 'PrinterModel.rows').read_text().splitlines()]
    expected = [(i, b, *record.unpack_from(raw, (2 * i + b) * 6))
                for i in range(13545) for b in range(2)]
    assert actual == expected
    SUMMARY['matched_rows'] = len(actual)
    runner.checkpoint()
    for i, batch in enumerate(instance['batches']):
        lean('scan-batch-' + str(i).zfill(2), batch)
        SUMMARY['checked_scan_batches'] = i + 1
        runner.checkpoint()
    lean('complete-printer', instance['final'])
    SUMMARY['gates']['P1'] = True
    SUMMARY['complete_printer_certified'] = True
    runner.checkpoint()
    bits = PACKET.read_text()[:17]
    assert bits[:16] != bits[1:17]
    expected_prefix = '[' + ', '.join(bits[:16]) + ']'
    positive = WORK / 'Positive.lean'
    positive.write_text('''import Complete
open ParsimonyComposed

theorem decoder_prefix_control : packet.take 16 = ''' + expected_prefix + ''' := by
  decide +kernel

#print axioms decoder_prefix_control
''')
    wrong_output = WORK / 'WrongOutput.lean'
    replacement = '[' + ('1' if bits[0] == '0' else '0') + expected_prefix[2:]
    wrong_output.write_text(positive.read_text().replace(expected_prefix, replacement))
    wrong_head = WORK / 'WrongHead.lean'
    wrong_head.write_text(positive.read_text().replace('packet.take 16', '(packet.drop 1).take 16'))
    for path in [positive, wrong_output, wrong_head]:
        proof.source_check(path)
    lean('positive-output-prefix', positive)
    for name, path in [('wrong-output', wrong_output), ('wrong-head', wrong_head)]:
        rejected = lean(name, path, expected_exit=1)
        assert re.search(r'tactic .decide. proved that the proposition.*is false', rejected, re.S | re.I)
    for path, expected_hash in pins.items():
        assert runner.sha(ROOT / path) == expected_hash, path
    assert runner.sha(TABLE) == previous_plan['candidate_sha256']
    assert runner.sha(PACKET) == previous_plan['packet_sha256']
    runner.save('composition.json', dict(identity='ParsimonyComposed.complete_printer',
        words=13360, checked_old_batches_reused=53, checked_old_batches_recompiled=0,
        checked_new_scan_batches=53, checked_packet_chunks=418, matched_physical_rows=len(actual),
        input='init : Cfg 13546 2', output_state=13545,
        output_tape="Tape.mk' blank (ListBlank.append packet blank)",
        relative_head='first frozen packet bit', absolute_integer_displacement_proved=False,
        frozen_packet_sha256=runner.sha(PACKET), candidate_sha256=runner.sha(TABLE),
        fresh_machine_states=0, complete_printer_certified=True, new_accepted_machine=False,
        complete_halting_equivalence=False, codec_bridge_proved=False,
        generated={p.name: dict(source_sha256=runner.sha(p),
            object_sha256=runner.sha(p.with_suffix('.olean')))
            for p in [WORK / 'Cleanup.lean', instance['model'], *instance['batches'],
                      instance['final'], positive]}))
    SUMMARY['gates']['B1'] = True
    SUMMARY.update(status='complete_printer_passed', remaining=['literal-to-ChessCodec bridge',
        'suffix relocation/link', 'both full-machine halting directions', 'whole-machine audit'])
    runner.checkpoint()
    print('PARSIMONY_COMPLETE_PRINTER_PASSED', flush=True)
    print('PARSIMONY_COMPLETE_PRINTER_BINDING_PASSED', flush=True)


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
