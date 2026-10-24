#!/usr/bin/env python3
"""Remote-only structural data-routine proof and exact candidate scaling pilot."""
import os
if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

import hashlib
import json
from pathlib import Path
import re
import signal
import struct
import sys
import time
import traceback

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / 'scripts/chess_parsimony_20261024'))
import pilot as runner

WORK = ROOT / '.lake/chess-parsimony-proof-20261024'
LAKE = 'lakefile.chess-parsimony-proof-20261024.toml'
TARGET = 'Cryptids.Compilation.Parsimony.Data'
SOURCE = ROOT / 'Cryptids/Compilation/Parsimony/Data.lean'
EVIDENCE = 'docs/chess/parsimony-printer-2026-10-24/evidence/validation-04/unpacked/'
SUMMARY = dict(schema='parsimony-structural-data-v1', status='running', commands=[], gates={},
    accepted_machine_states=769344, candidate_states=609247, experimental_saving=160097,
    certified_saving=0, complete_printer_certified=False, new_accepted_machine=False,
    limits=dict(total_seconds=900, lean_seconds=240, scaling_seconds=120,
                group_plus_driver_rss_bytes=6 << 30, driver_rss_bytes=512 << 20,
                lean_heap_mib=5120, lean_threads=1), scaling=[])
runner.WORK, runner.SUMMARY, runner.LIMIT = WORK, SUMMARY, 900
runner.BEGIN = time.monotonic()
RECORD = struct.Struct('<BBI')


def source_check(path):
    text = path.read_text()
    wide = [i for i, line in enumerate(text.splitlines(), 1) if len(line) > 100]
    assert not wide, 'Lean width exceeded: ' + str(path) + ' ' + str(wide[:10])
    assert not re.search(r'\b(sorry|axiom|native_decide|unsafe)\b', text)


def lean(name, path, seconds=120, extra=None, expected_exit=0):
    return runner.run(name, ['lake', '-f', LAKE, 'env', 'lean', '-M5120',
        '-T2000000', '-o', str(path.with_suffix('.olean')), *(extra or []), str(path)],
        seconds, expected_exit=expected_exit)


def foundations(output):
    assert 'sorryAx' not in output and 'Lean.ofReduceBool' not in output
    groups = re.findall(r'depends on axioms:\s*\[([^\]]*)\]', output, re.S)
    allowed = {'propext', 'Classical.choice', 'Quot.sound'}
    for group in groups:
        assert set(group.replace('\n', '').replace(' ', '').split(',')) <= allowed
    assert groups or 'does not depend on any axioms' in output


def scale_source(count, values):
    name = 'ParsimonyScale' + str(count)
    lines = ['import ' + TARGET, '', 'open Turing ConjectureMachines',
        'open ConjectureMachines.Compilation', 'namespace ' + name,
        'def values : Array (Fin 13360) := #[']
    lines += ['  ⟨' + str(value) + ', by decide⟩' + (',' if i + 1 < count else '')
              for i, value in enumerate(values[:count])]
    lines += [']', '', 'attribute [local irreducible] values', '',
        '/-- One generic proof, without unfolding the data array or the physical run. -/',
        'theorem runData (i : Fin ' + str(count) + ') (left right : ListBlank (Fin 2)) :',
        '    let value := (Parsimony.Data.wordAt 13359 values i.val).val',
        '    FlatInit.runFrom (Parsimony.Data.machine 13359 values) (value + 2)',
        '      ⟨Parsimony.Data.control 13359 i.val,',
        "        Tape.mk' left ((ListBlank.append (List.replicate (value + 1) 0) right).cons 1)⟩ =",
        '      some ⟨Parsimony.Data.exit 13359,',
        "        Tape.mk' (ListBlank.append (0 :: List.replicate value 1) (left.cons 0)) right⟩ :=",
        '  Parsimony.Data.query_run 13359 values i.val (by have := i.isLt; omega) left right',
        '', 'end ' + name, '', '#print axioms ' + name + '.runData', '',
        'def main : IO Unit := do',
        '  let file ← IO.FS.Handle.mk "' + str(WORK / (name + '.rows')) + '" .write',
        '  for i in List.range ' + str(count) + ' do',
        '    let state : Fin 13361 := ⟨i % 13361, Nat.mod_lt i (by decide)⟩',
        '    for bit in ([0, 1] : List (Fin 2)) do',
        '      match (Parsimony.Data.machine 13359 ' + name + '.values).transition state bit with',
        '      | none => file.putStrLn "halt"',
        '      | some (write, direction, target) =>',
        '        let d := if direction = .right then 1 else 0',
        '        file.putStrLn s!"{write.val} {d} {target.val}"',
        '  IO.println "PARSIMONY_SCALE_EXPORTED"', '']
    # Keep generated source portable and within Lean's mandatory line width.
    lines = [line.replace('"' + str(WORK / (name + '.rows')) + '"',
                          '".lake/chess-parsimony-proof-20261024/' + name + '.rows"')
             for line in lines]
    return '\n'.join(lines)


def prepare_data():
    raw = (ROOT / (EVIDENCE + 'full-candidate-rows.bin')).read_bytes()
    assert hashlib.sha256(raw).hexdigest() == \
        'b9cf384e5470f3c9f5c501bd8c13555f15d4ea134469f5d159cd1bdb363cbf45'
    values, actual = [], []
    for i in range(13360):
        zero = RECORD.unpack_from(raw, (2 * (6 + i)) * RECORD.size)
        one = RECORD.unpack_from(raw, (2 * (6 + i) + 1) * RECORD.size)
        assert zero == (1 if i + 1 < 13360 else 0, 1, 6 + i + 1)
        assert one[0:2] == (0, 1)
        value = 6 + 13360 - 1 - one[2]
        assert 0 <= value < 8192
        values.append(value)
        actual.extend([zero, one])
    for count in [512, 8192, 13360]:
        path = WORK / ('ParsimonyScale' + str(count) + '.lean')
        path.write_text(scale_source(count, values))
        source_check(path)
    return actual


def main():
    WORK.mkdir(parents=True, exist_ok=True)
    signal.alarm(900)
    assert os.environ['GITHUB_REPOSITORY'] == 'bocowgill/cryptids'
    assert os.environ['RUNNER_ENVIRONMENT'] == 'github-hosted'
    pins_path = 'docs/chess/campaign-2026-10-22/accepted-769344-pins.json'
    pins = json.loads((ROOT / pins_path).read_text())
    for path, expected in pins.items():
        assert runner.sha(ROOT / path) == expected, 'Accepted/frozen file changed: ' + path
    paths = [str(SOURCE.relative_to(ROOT)), LAKE, pins_path, 'lean-toolchain',
        'lake-manifest.json', 'scripts/chess_parsimony_proof_20261024/verify.py',
        'scripts/chess_parsimony_20261024/pilot.py',
        'scripts/chess_parsimony_20261024/printer.py',
        '.github/workflows/chess_parsimony_proof_20261024.yml',
        EVIDENCE + 'full-candidate-rows.bin', EVIDENCE + 'full-candidate-census.json']
    runner.save('source-manifest.json', dict(commit=os.environ['GITHUB_SHA'],
        workflow_commit=os.environ['GITHUB_SHA'], run_id=os.environ['GITHUB_RUN_ID'],
        command='python3 scripts/chess_parsimony_proof_20261024/verify.py', cwd=str(ROOT),
        shell=os.environ.get('SHELL'), path=os.environ.get('PATH'),
        source_sha256={path: runner.sha(ROOT / path) for path in paths},
        frozen_source_sha256=pins))
    runner.save('runner-capacity.json', dict(meminfo=Path('/proc/meminfo').read_text(),
        process_cgroups=Path('/proc/self/cgroup').read_text(),
        memory_files={path: Path(path).read_text() for path in
            ['/sys/fs/cgroup/memory.max', '/sys/fs/cgroup/memory/memory.limit_in_bytes']
            if Path(path).is_file()},
        absent_cgroup_file_is_not_a_proof_failure=True))
    source_check(SOURCE)
    actual = prepare_data()
    runner.checkpoint()
    runner.run('mathlib-cache', ['lake', 'exe', 'cache', 'get',
        'Mathlib.Computability.TuringMachine.PostTuringMachine', 'Mathlib.Data.Nat.Prime.Basic',
        'Mathlib.Algebra.GCDMonoid.Finset', 'Mathlib.Order.Interval.Finset.Nat',
        'Mathlib.NumberTheory.LSeries.RiemannZeta', 'Mathlib.SetTheory.ZFC.Basic',
        'Mathlib.Tactic'], 300)
    runner.run('structural-kernel', ['lake', '--wfail', '-f', LAKE, 'build', TARGET], 240)
    SUMMARY['gates']['K1'] = True
    print('PARSIMONY_STRUCTURAL_KERNEL_PASSED', flush=True)
    runner.checkpoint()
    roots = ['step_cell', 'unary_run', 'row_zero_more', 'row_zero_last', 'row_one', 'query_run']
    audit = WORK / 'Audit.lean'
    audit.write_text('import ' + TARGET + '\n' + '\n'.join(
        '#print axioms ConjectureMachines.Compilation.Parsimony.Data.' + root for root in roots))
    foundations(lean('foundations', audit))
    for count in [512, 8192, 13360]:
        path = WORK / ('ParsimonyScale' + str(count) + '.lean')
        output = lean('scale-' + str(count), path, extra=['--run'])
        foundations(output)
        assert 'PARSIMONY_SCALE_EXPORTED' in output
        exported = [tuple(map(int, line.split())) for line in path.with_suffix('.rows').read_text()
                    .splitlines()]
        relocated = [(w, d, 6 + t) for w, d, t in exported]
        assert relocated == actual[:2 * count]
        changed = list(relocated)
        w, d, t = changed[0]
        changed[0] = (1 - w, d, t)
        assert changed != actual[:2 * count]
        receipt = dict(words=count, actual_data_states=count, actual_rows_compared=2 * count,
            layout_words=13360, word_width=13, complete_data_block=count == 13360,
            proof_application_not_execution_unrolling=True,
            lean_source_bytes=path.stat().st_size, olean_bytes=path.with_suffix('.olean').stat().st_size,
            source_sha256=runner.sha(path), export_sha256=runner.sha(path.with_suffix('.rows')),
            transport_mutation_rejected=True, command_receipt=SUMMARY['commands'][-1])
        SUMMARY['scaling'].append(receipt)
        runner.save('scaling.json', SUMMARY['scaling'])
        runner.checkpoint()
    SUMMARY['gates'].update(S1=True, B1=True)
    print('PARSIMONY_STRUCTURAL_SCALING_PASSED', flush=True)
    print('PARSIMONY_STRUCTURAL_BINDING_PASSED', flush=True)
    corrupt = WORK / 'CorruptedData.lean'
    original = SOURCE.read_text()
    needle = 'some (1, .right, ⟨source.val + 1,'
    assert original.count(needle) == 1
    corrupt.write_text(original.replace('Parsimony.Data', 'Parsimony.CorruptedData')
                       .replace(needle, 'some (0, .right, ⟨source.val + 1,'))
    source_check(corrupt)
    rejected = lean('changed-row-corruption', corrupt, expected_exit=1)
    assert 'error:' in rejected
    SUMMARY['gates']['A1'] = True
    SUMMARY.update(status='structural_data_phase_passed', certified_saving=0,
        complete_data_block_export_compared=True, complete_printer_certified=False,
        native_export_is_not_a_proof_oracle=True,
        remaining=['unary-to-binary counter and word insertion', 'full printer termination',
                   'framing and marker cleanup', 'direct link and full suffix relocation proof',
                   'both complete halting directions', 'strict final/foundation regressions'])
    runner.checkpoint()
    print('PARSIMONY_STRUCTURAL_AUDIT_PASSED', flush=True)


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
