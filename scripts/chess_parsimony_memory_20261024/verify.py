#!/usr/bin/env python3
"""Remote-only paired full-data proof representation experiment."""
import os
if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

import hashlib
import json
from pathlib import Path
import signal
import struct
import sys
import textwrap
import time
import traceback

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / 'scripts/chess_parsimony_proof_20261024'))
import verify as proof

runner = proof.runner
WORK = ROOT / '.lake/chess-parsimony-memory-20261024'
OLD_WORK = ROOT / '.lake/chess-parsimony-proof-20261024'
HISTORY = 'docs/chess/parsimony-printer-2026-10-24/structural/evidence/proof-04/unpacked/'
BASELINE = HISTORY + 'ParsimonyScale13360.lean'
EVIDENCE = proof.EVIDENCE
DATA_SHA = '2317ad63aab9eb6796508ba6e2df1bb33a61816afd77b55ceb363dab2b20d6ac'
ROWS_SHA = 'b9cf384e5470f3c9f5c501bd8c13555f15d4ea134469f5d159cd1bdb363cbf45'
BASELINE_SHA = '32b25d704a13f5c1c729b4db5f0f2f79709806a1f4d39fb26ac6e9595801628c'
SUMMARY = dict(schema='parsimony-full-data-memory-v1', status='running', commands=[], gates={},
    accepted_machine_states=769344, candidate_states=609247, experimental_saving=160097,
    certified_saving=0, complete_printer_certified=False, new_accepted_machine=False,
    limits=dict(total_seconds=900, lean_seconds=240, instance_seconds=120,
                group_plus_driver_rss_bytes=6 << 30, driver_rss_bytes=512 << 20,
                lean_heap_mib=5120, lean_threads=1), representations=[])
runner.WORK, runner.SUMMARY, runner.LIMIT = WORK, SUMMARY, 900
runner.BEGIN = time.monotonic()


def lean(name, path, seconds=120, run=False):
    output = runner.run(name, ['lake', '-f', proof.LAKE, 'env', 'lean', '-M5120',
        '-T2000000', '-o', str(path.with_suffix('.olean')),
        *(['--run'] if run else []), str(path)], seconds)
    assert 'warning:' not in output and 'error:' not in output, name
    return output


def paired_source(original, values):
    """Replace only data definitions; preserve the runData statement/proof verbatim."""
    prefix, suffix = original.split('\nattribute [local irreducible] values', 1)
    assert prefix.startswith('import ' + proof.TARGET)
    lines = prefix.split('private def part0', 1)[0].splitlines()
    parts = []
    for begin in range(0, len(values), 256):
        name = 'part' + str(len(parts))
        parts.append(name)
        chunk = values[begin:begin + 256]
        lines += ['private def ' + name + ' : Array Nat := #[']
        lines += ['  ' + str(v) + (',' if i + 1 < len(chunk) else '')
                  for i, v in enumerate(chunk)]
        lines += [']', '']
    def balanced(names):
        if len(names) == 1:
            return names[0]
        middle = len(names) // 2
        return '(' + balanced(names[:middle]) + ' ++ ' + balanced(names[middle:]) + ')'
    lines += ['def raw : Array Nat :='] + textwrap.wrap(balanced(parts), width=98,
        initial_indent='  ', subsequent_indent='  ', break_long_words=False,
        break_on_hyphens=False)
    lines += ['', '/-- One shared bound proof for every raw word. -/',
        'def boundWord (value : Nat) : Fin 13360 :=',
        '  ⟨value % 13360, Nat.mod_lt value (by decide +kernel)⟩', '',
        '/-- The shared constructor preserves each word under its explicit bound. -/',
        'theorem boundWord_val (value : Nat) (bound : value < 13360) :',
        '    (boundWord value).val = value := Nat.mod_eq_of_lt bound', '',
        'def values : Array (Fin 13360) := raw.map boundWord', '']
    result = '\n'.join(lines) + '\nattribute [local irreducible] values' + suffix
    result = result.replace('.lake/chess-parsimony-proof-20261024/ParsimonyScale13360.rows',
                            '.lake/chess-parsimony-memory-20261024/Shared.rows')
    return result + '\n#print axioms ParsimonyScale13360.boundWord_val\n'


def binding(rows, actual):
    if len(rows) != 26720:
        raise ValueError('Wrong row count')
    if [(w, d, 6 + t) for w, d, t in rows] != actual:
        raise ValueError('Candidate row mismatch')


def prepare():
    assert runner.sha(proof.SOURCE) == DATA_SHA
    assert runner.sha(ROOT / BASELINE) == BASELINE_SHA
    raw = (ROOT / (EVIDENCE + 'full-candidate-rows.bin')).read_bytes()
    assert hashlib.sha256(raw).hexdigest() == ROWS_SHA
    record = struct.Struct('<BBI')
    values, actual = [], []
    for i in range(13360):
        zero = record.unpack_from(raw, (2 * (6 + i)) * record.size)
        one = record.unpack_from(raw, (2 * (6 + i) + 1) * record.size)
        assert zero == (1 if i < 13359 else 0, 1, 6 + i + 1)
        assert one[:2] == (0, 1)
        value = 6 + 13359 - one[2]
        assert 0 <= value < 8192 and value % 13360 == value
        values.append(value)
        actual.extend([zero, one])
    original = (ROOT / BASELINE).read_text()
    shared = paired_source(original, values)
    def contract(text):
        return text.split('/-- One generic proof', 1)[1].split('\nend ParsimonyScale', 1)[0]
    assert contract(original) == contract(shared)
    runner.save('preservation.json', dict(words=len(values), raw_word_bound=8192,
        all_words_preserved_by_shared_constructor=True,
        operational_instance_statement_and_proof_identical=True,
        operational_instance_sha256=hashlib.sha256(contract(original).encode()).hexdigest(),
        generic_source_sha256=DATA_SHA, baseline_source_sha256=BASELINE_SHA,
        candidate_rows_sha256=ROWS_SHA, new_states=0, new_accepted_savings=0))
    (WORK / 'Baseline.lean').write_text(original)
    (WORK / 'Shared.lean').write_text(shared)
    assert runner.sha(WORK / 'Baseline.lean') == BASELINE_SHA
    for path in [proof.SOURCE, WORK / 'Baseline.lean', WORK / 'Shared.lean']:
        proof.source_check(path)
    return actual


def main():
    WORK.mkdir(parents=True, exist_ok=True)
    OLD_WORK.mkdir(parents=True, exist_ok=True)
    signal.alarm(900)
    assert os.environ['GITHUB_REPOSITORY'] == 'bocowgill/cryptids'
    assert os.environ['RUNNER_ENVIRONMENT'] == 'github-hosted'
    pins_path = 'docs/chess/campaign-2026-10-22/accepted-769344-pins.json'
    pins = json.loads((ROOT / pins_path).read_text())
    for path, expected in pins.items():
        assert runner.sha(ROOT / path) == expected, 'Accepted/frozen file changed: ' + path
    paths = [str(proof.SOURCE.relative_to(ROOT)), proof.LAKE, pins_path, 'lean-toolchain',
        'lake-manifest.json', 'scripts/chess_parsimony_memory_20261024/verify.py',
        'scripts/chess_parsimony_proof_20261024/verify.py',
        'scripts/chess_parsimony_20261024/pilot.py',
        'scripts/chess_parsimony_20261024/printer.py',
        '.github/workflows/chess_parsimony_proof_20261024.yml', BASELINE,
        HISTORY + 'scaling.json', EVIDENCE + 'full-candidate-rows.bin',
        EVIDENCE + 'full-candidate-census.json',
        'docs/chess/parsimony-printer-2026-10-24/proof-memory/GATES.md']
    runner.save('source-manifest.json', dict(commit=os.environ['GITHUB_SHA'],
        workflow_commit=os.environ['GITHUB_SHA'], run_id=os.environ['GITHUB_RUN_ID'],
        command='python3 scripts/chess_parsimony_memory_20261024/verify.py', cwd=str(ROOT),
        shell=os.environ.get('SHELL'), path=os.environ.get('PATH'),
        source_sha256={path: runner.sha(ROOT / path) for path in paths},
        frozen_source_sha256=pins))
    runner.save('runner-capacity.json', dict(meminfo=Path('/proc/meminfo').read_text(),
        process_cgroups=Path('/proc/self/cgroup').read_text(),
        memory_files={path: Path(path).read_text() for path in
            ['/sys/fs/cgroup/memory.max', '/sys/fs/cgroup/memory/memory.limit_in_bytes']
            if Path(path).is_file()}))
    actual = prepare()
    runner.checkpoint()
    runner.run('mathlib-cache', ['lake', 'exe', 'cache', 'get',
        'Mathlib.Computability.TuringMachine.PostTuringMachine', 'Mathlib.Data.Nat.Prime.Basic',
        'Mathlib.Algebra.GCDMonoid.Finset', 'Mathlib.Order.Interval.Finset.Nat',
        'Mathlib.NumberTheory.LSeries.RiemannZeta', 'Mathlib.SetTheory.ZFC.Basic',
        'Mathlib.Tactic'], 300)
    output = runner.run('unchanged-kernel', ['lake', '--wfail', '-f', proof.LAKE,
        'build', proof.TARGET], 240)
    assert 'warning:' not in output and 'error:' not in output
    built = ROOT / '.lake/build/lib/lean/Cryptids/Compilation/Parsimony/Data.olean'
    (WORK / 'Data.olean').write_bytes(built.read_bytes())
    runner.save('kernel-object.json', dict(sha256=runner.sha(built), bytes=built.stat().st_size,
        source_sha256=runner.sha(proof.SOURCE), strict_build_passed=True))
    roots = ['step_cell', 'unary_run', 'row_zero_more', 'row_zero_last', 'row_one', 'query_run']
    audit = WORK / 'Audit.lean'
    audit.write_text('import ' + proof.TARGET + '\n' + '\n'.join(
        '#print axioms ConjectureMachines.Compilation.Parsimony.Data.' + root for root in roots))
    proof.source_check(audit)
    proof.foundations(lean('foundations', audit))
    for name, rows_path in [('Baseline', OLD_WORK / 'ParsimonyScale13360.rows'),
                             ('Shared', WORK / 'Shared.rows')]:
        source = WORK / (name + '.lean')
        output = lean(name.lower(), source, run=True)
        proof.foundations(output)
        assert 'PARSIMONY_SCALE_EXPORTED' in output
        data = rows_path.read_bytes()
        (WORK / (name + '.rows')).write_bytes(data)
        rows = [tuple(map(int, line.split())) for line in data.decode().splitlines()]
        binding(rows, actual)
        # Alter one encoded word, preserving its bound and canonical row shape.
        changed = list(rows)
        w, d, t = changed[1]
        assert t > 0
        changed[1] = (w, d, t - 1)
        try:
            binding(changed, actual)
        except ValueError as error:
            assert str(error) == 'Candidate row mismatch'
        else:
            raise AssertionError('Changed word passed the positive-tested comparator')
        runner.save(name + '-negative-control.json', dict(positive_matched=True,
            changed_word_rejected=True, cell=1, original=rows[1], changed=changed[1],
            scope='External row-binding negative control; not a kernel parser theorem'))
        receipt = dict(name=name, words=13360, rows_compared=26720,
            lean_source_bytes=source.stat().st_size, source_sha256=runner.sha(source),
            olean_bytes=source.with_suffix('.olean').stat().st_size,
            olean_sha256=runner.sha(source.with_suffix('.olean')),
            export_sha256=runner.sha(WORK / (name + '.rows')),
            command_receipt=SUMMARY['commands'][-1])
        SUMMARY['representations'].append(receipt)
        runner.save('representations.json', SUMMARY['representations'])
        runner.checkpoint()
    baseline, shared = SUMMARY['representations']
    assert baseline['export_sha256'] == shared['export_sha256']
    old = json.loads((ROOT / (HISTORY + 'scaling.json')).read_text())[-1]
    b, s = baseline['command_receipt'], shared['command_receipt']
    saving = b['peak_group_plus_driver_rss_bytes'] - s['peak_group_plus_driver_rss_bytes']
    object_ratio = shared['olean_bytes'] / baseline['olean_bytes']
    time_ratio = s['elapsed_seconds'] / b['elapsed_seconds']
    useful = saving >= 256 << 20 and object_ratio <= 0.75 and time_ratio <= 2
    comparison = dict(words=13360, paired_baseline=baseline, shared_bound=shared,
        retained_historical_baseline=old, peak_rss_saving_bytes=saving,
        object_saving_bytes=baseline['olean_bytes'] - shared['olean_bytes'],
        object_ratio=object_ratio, runtime_ratio=time_ratio, material_improvement=useful,
        remaining_group_headroom_bytes=(6 << 30) - s['peak_group_plus_driver_rss_bytes'],
        uncertainty='One paired runner measurement; sampled RSS, shared OS page cache; '
                    'does not predict whole-printer proof cost.',
        decision='continue_structural_integration' if useful else 'redesign_before_integration')
    runner.save('comparison.json', comparison)
    assert runner.sha(proof.SOURCE) == DATA_SHA
    assert runner.sha(ROOT / (EVIDENCE + 'full-candidate-rows.bin')) == ROWS_SHA
    for path, expected in pins.items():
        assert runner.sha(ROOT / path) == expected
    SUMMARY['gates'].update(K1=True, B1=True, M1=True)
    SUMMARY.update(status='proof_memory_comparison_passed', comparison=comparison,
        generic_source_unchanged=True, candidate_rows_unchanged=True,
        accepted_and_frozen_pins_unchanged=True,
        native_export_is_not_a_proof_oracle=True,
        remaining=['full printer operational invariants', 'exact frozen packet identity',
                   'direct linking and full suffix relocation', 'both halting directions',
                   'whole-composition memory and strict foundation/regression checks'])
    runner.checkpoint()
    print('PARSIMONY_MEMORY_KERNEL_PASSED', flush=True)
    print('PARSIMONY_MEMORY_BINDING_PASSED', flush=True)
    print('PARSIMONY_MEMORY_COMPARISON_PASSED', flush=True)


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
