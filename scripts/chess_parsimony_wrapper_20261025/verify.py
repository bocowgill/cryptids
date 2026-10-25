#!/usr/bin/env python3
"""Remote-only bounded wrapper fix; reuse exact previously checked batch objects."""
import os
if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

import hashlib
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
runner = proof.runner
WORK = ROOT / '.lake/chess-parsimony-wrapper-20261024'
LAKE = 'lakefile.chess-parsimony-global-20261024.toml'
DOC = 'docs/chess/parsimony-printer-2026-10-25/output-wrapper'
PRIOR = ROOT / 'docs/chess/parsimony-printer-2026-10-24/global-iteration'
OLD = PRIOR / 'evidence/global-08'
PRODUCER = '317cb4f2efcb561687af90c979e48323e51b6b78'
ARCHIVE = '476eb3a73c5232c8e53808755c22d02db16b9a29e72e838769f86f25190f6ac1'
TABLE = ROOT / ('docs/chess/parsimony-printer-2026-10-24/evidence/validation-04/'
                'unpacked/full-candidate-rows.bin')
PACKET = ROOT / ('docs/chess/campaign-2026-10-22/round-04/evidence/packet-02/'
                 'unpacked/packet.bits')
SUMMARY = dict(schema='parsimony-wrapper-v1', status='running', commands=[], gates={},
    accepted_machine_states=769344, candidate_states=609247, experimental_saving=160097,
    certified_saving=0, complete_printer_certified=False, new_accepted_machine=False,
    limits=dict(total_seconds=1200, generic_seconds=240, composition_seconds=180,
                group_plus_driver_rss_bytes=6 << 30, driver_rss_bytes=512 << 20,
                lean_heap_mib=5120, lean_threads=1))
runner.WORK, runner.SUMMARY, runner.LIMIT = WORK, SUMMARY, 1200
runner.BEGIN = time.monotonic()


def lean(name, path, expected_exit=0):
    output = runner.run(name, ['lake', '-f', LAKE, 'env', 'lean', '-M5120', '-T2000000',
        '-o', str(path.with_suffix('.olean')), str(path)], 180, expected_exit=expected_exit)
    if expected_exit == 0:
        assert 'warning:' not in output and 'error:' not in output
        proof.foundations(output)
    return output


def generate():
    """Proof wrappers only; never regenerate or execute the machine or checked batches."""
    sized = WORK / 'SizedRender.lean'
    sized.write_text('''import Cryptids.Compilation.Parsimony.Packet

namespace ConjectureMachines.Compilation.Parsimony.Packet

/-- Specialize the range while the input array is still abstract. -/
theorem indexed_render_sized (width last count : Nat) (input : Array (Fin (last + 1)))
    (size : input.size = count) :
    (List.range count).flatMap (fun i ↦
      text (encode width (Data.wordAt last input i).val).reverse) =
        render width (input.toList.map Fin.val) := by
  rw [← size]
  exact indexed_render width last input

end ConjectureMachines.Compilation.Parsimony.Packet

#print axioms ConjectureMachines.Compilation.Parsimony.Packet.indexed_render_sized
''')
    original = (OLD / 'unpacked/Identity.lean').read_text()
    prefix, suffix = original.split('theorem global_bits_identity :', 1)
    prefix += ('end ParsimonyComposed\n\n'
        '#print axioms ParsimonyComposed.all_packet_words\n'
        '#print axioms ParsimonyComposed.packet_framing\n')
    frozen = WORK / 'FrozenPacket.lean'
    frozen.write_text(prefix)
    wrapper = WORK / 'Identity.lean'
    body = 'theorem global_bits_identity :' + suffix
    old = 'simpa only [values_size] using Parsimony.Packet.indexed_render 13 13359 values'
    assert body.count(old) == 1
    body = body.replace(old,
        'exact Parsimony.Packet.indexed_render_sized 13 13359 13360 values values_size')
    wrapper.write_text('''import FrozenPacket
import SizedRender

open ConjectureMachines.Compilation
namespace ParsimonyComposed

attribute [local irreducible] raw

''' + body)
    positive = WORK / 'PositiveControl.lean'
    positive.write_text('''import Identity

open ParsimonyComposed
open ConjectureMachines.Compilation

theorem packet_first_control : (Parsimony.Packet.render 13 (numeric sub0)).head? =
    some '1' := by
  rw [packet_chunk0]
  decide +kernel

#print axioms packet_first_control
''')
    corrupted = WORK / 'Corrupted.lean'
    original = positive.read_text()
    assert original.count("'1'") == 1
    corrupted.write_text(original.replace("'1'", "'0'"))
    return [sized, frozen, wrapper, positive, corrupted]


def main():
    WORK.mkdir(parents=True, exist_ok=True)
    signal.alarm(1200)
    assert os.environ['GITHUB_REPOSITORY'] == 'bocowgill/cryptids'
    assert os.environ['RUNNER_ENVIRONMENT'] == 'github-hosted'
    pins = {}
    pinfiles = ['docs/chess/campaign-2026-10-22/accepted-769344-pins.json',
        'docs/chess/parsimony-printer-2026-10-24/global-iteration/checked-routines-pins.json']
    for name in pinfiles:
        pins.update(json.loads((ROOT / name).read_text()))
    for path, expected in pins.items():
        assert runner.sha(ROOT / path) == expected, 'Frozen/checked source changed: ' + path
    assert runner.sha(OLD / 'artifact.zip') == ARCHIVE
    old_manifest = json.loads((OLD / 'unpacked/source-manifest.json').read_text())
    old_review = json.loads((PRIOR / 'partial-review.json').read_text())
    old_plan = json.loads((OLD / 'unpacked/instance-plan.json').read_text())
    assert old_review['producer'] == old_manifest['commit'] == PRODUCER
    assert old_review['run'] == 40157504256
    assert old_review['packet_batches_checked'] == 53
    assert old_review['packet_words_checked'] == 13360
    assert runner.sha(TABLE) == old_plan['candidate_sha256']
    assert runner.sha(PACKET) == old_plan['packet_sha256']
    for name in ['lean-toolchain', 'lake-manifest.json', LAKE]:
        assert runner.sha(ROOT / name) == old_manifest['source_sha256'][name]
    reuse = {}
    names = ['AllWords', 'GlobalInstance', 'PacketCommon'] + [
        'PacketBatch' + str(i).zfill(2) for i in range(53)]
    with zipfile.ZipFile(OLD / 'artifact.zip') as archive:
        for name in names:
            for suffix in ['.lean', '.olean']:
                filename = name + suffix
                source = OLD / 'unpacked' / filename
                digest = runner.sha(source)
                with archive.open(filename) as stream:
                    assert hashlib.file_digest(stream, 'sha256').hexdigest() == digest
                if name.startswith('PacketBatch'):
                    entry = old_review['batch_artifacts'][name + '.lean']
                    assert digest == entry['source_sha256' if suffix == '.lean'
                                           else 'object_sha256']
                reuse[filename] = dict(sha256=digest, bytes=source.stat().st_size)
                shutil.copyfile(source, WORK / filename)
    assert len(old_review['batch_artifacts']) == 53
    runner.save('reuse.json', dict(producer=PRODUCER, run=40157504256,
        archive_sha256=ARCHIVE, checked_batches=53, checked_words=13360,
        files=reuse, checked_batch_recompilations=0,
        no_import_of_failed_identity=True, normal_checked_module_imports=True,
        original_rows_sha256=runner.sha(OLD / 'unpacked/AllWords.rows')))
    paths = [LAKE, *pinfiles, 'lean-toolchain', 'lake-manifest.json',
        'scripts/chess_parsimony_wrapper_20261025/verify.py',
        'scripts/chess_parsimony_wrapper_20261025/review.py',
        'scripts/chess_parsimony_proof_20261024/verify.py',
        'scripts/chess_parsimony_20261024/pilot.py',
        'scripts/chess_parsimony_20261024/printer.py',
        '.github/workflows/chess_parsimony_proof_20261024.yml', DOC + '/GATES.md',
        str(PRIOR.relative_to(ROOT) / 'partial-review.json'),
        str(OLD.relative_to(ROOT) / 'unpacked/source-manifest.json')]
    paths += [str(p.relative_to(ROOT)) for p in
        (ROOT / 'Cryptids/Compilation/Parsimony').glob('*.lean')]
    runner.save('source-manifest.json', dict(commit=os.environ['GITHUB_SHA'],
        workflow_commit=os.environ['GITHUB_SHA'], run_id=os.environ['GITHUB_RUN_ID'],
        command='python3 scripts/chess_parsimony_wrapper_20261025/verify.py', cwd=str(ROOT),
        shell=os.environ.get('SHELL'), path=os.environ.get('PATH'),
        source_sha256={path: runner.sha(ROOT / path) for path in paths},
        frozen_source_sha256=pins, prior_producer=PRODUCER, prior_archive_sha256=ARCHIVE))
    runner.save('runner-capacity.json', dict(meminfo=Path('/proc/meminfo').read_text(),
        process_cgroups=Path('/proc/self/cgroup').read_text(),
        memory_files={path: Path(path).read_text() for path in
            ['/sys/fs/cgroup/memory.max', '/sys/fs/cgroup/memory/memory.limit_in_bytes']
            if Path(path).is_file()}))
    generated = generate()
    for path in [*(ROOT / name for name in paths if name.endswith('.lean')),
                 *WORK.glob('*.lean')]:
        proof.source_check(path)
    runner.save('wrapper-plan.json', dict(generated_sha256={p.name: runner.sha(p)
        for p in generated}, packet_sha256=runner.sha(PACKET), candidate_sha256=runner.sha(TABLE),
        words=13360, chunks=418, framed_bits=173680, packet_offset=33,
        fresh_machine_states=0, no_machine_generation=True))
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
    lean('abstract-sized-render', generated[0])
    lean('packet-framing-prefix', generated[1])
    output = lean('final-output-identity', generated[2])
    assert "'ParsimonyComposed.global_bits_identity' depends on axioms:" in output
    SUMMARY['gates']['W1'] = True
    runner.checkpoint()
    lean('positive-first-bit', generated[3])
    rejected = lean('changed-frozen-packet', generated[4], expected_exit=1)
    assert re.search(r'tactic .decide. proved that the proposition.*is false', rejected, re.S | re.I), rejected
    assert 'unknown' not in rejected and 'maximum recursion depth' not in rejected
    SUMMARY['gates']['C1'] = True
    for path, expected in pins.items():
        assert runner.sha(ROOT / path) == expected, path
    assert runner.sha(TABLE) == old_plan['candidate_sha256']
    assert runner.sha(PACKET) == old_plan['packet_sha256']
    runner.save('composition.json', dict(words=13360, checked_batches_reused=53,
        checked_batches_recompiled=0, fresh_machine_states=0,
        generated={p.name: dict(source_sha256=runner.sha(p), source_bytes=p.stat().st_size,
            object_sha256=runner.sha(p.with_suffix('.olean')),
            object_bytes=p.with_suffix('.olean').stat().st_size) for p in generated[:4]},
        unchanged_identity_statement=True,
        identity_theorem='ParsimonyComposed.global_bits_identity',
        framing_theorem='ParsimonyComposed.packet_framing',
        iteration_theorem='ParsimonyComposed.global_terminated',
        frozen_packet_sha256=runner.sha(PACKET), candidate_sha256=runner.sha(TABLE),
        source_file_binding_external=True, full_execution_unrolled=False,
        complete_printer_certified=False, complete_blank_startup=False,
        artifact_to_TableSeed_ChessCodec_bits_bridge=False))
    SUMMARY.update(status='wrapper_identity_and_control_passed',
        checked_identity_words=13360, checked_identity_batches_reused=53,
        remaining=['preamble and epilogue', 'marker and tail cleanup',
            'artifact to TableSeed.ChessCodec.bits proof bridge',
            'direct suffix linking and relocation', 'both complete halting directions',
            'whole-machine final audits'])
    runner.checkpoint()
    print('PARSIMONY_WRAPPER_IDENTITY_PASSED', flush=True)
    print('PARSIMONY_WRAPPER_CONTROL_PASSED', flush=True)


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
