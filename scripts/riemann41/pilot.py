#!/usr/bin/env python3
"""Fixed, remote-only table fidelity and finite rejection filters; no candidates."""
import os
if os.environ.get('RH41_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote-only mathematical execution')

import ast
import hashlib
import json
from pathlib import Path
import re
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / os.environ.get('RH41_OUTPUT_DIR', '.lake/riemann41')
BASE = '6c28d8524fa008c6fb5aadb759df74a55ce96423'
TABLE = 'artifacts/riemann_95/machine.txt'
SHA = '7e9731ed1b7c63d4e67c0f8d646f8498d9645f26e237a8604d4b7f91a6ab398d'
SCHEMA = 'Cryptids/ReductionSupport/Riemann95/ControllerSchema95.lean'
used = 0


def save(name, value):
    (OUT / name).write_text(json.dumps(value, indent=2) + '\n')


def tick():
    global used
    used += 1
    assert 2 * used <= 2_000_000, 'Independent replay reserve exhausted'


def table():
    data = (ROOT / TABLE).read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    rows = []
    for line in data.decode().splitlines():
        cells = line.split()
        assert len(cells) == 2
        row = []
        for cell in cells:
            if cell == '---':
                row.append(None)
            else:
                m = re.fullmatch(r'([01])([LR])(0|[1-9][0-9]*)', cell)
                assert m, cell
                row.append([int(m[1]), 1 if m[2] == 'R' else -1, int(m[3])])
        rows.append(row)
    assert len(rows) == 95
    assert all(t is None or 0 <= t[2] < 95 for row in rows for t in row)
    assert [(q, b) for q, row in enumerate(rows) for b, t in enumerate(row)
            if t is None] == [(61, 1)]
    assert [(q, b) for q, row in enumerate(rows) for b, t in enumerate(row)
            if t is not None and t[2] == 41] == [(58, 1)]
    assert rows[41] == [[0, 1, 54], [1, 1, 80]]
    assert rows[58] == [[1, 1, 58], [0, 1, 41]]
    return rows


def source_array(name):
    text = (ROOT / SCHEMA).read_text()
    start = text.index('#[', text.index('def ' + name)) + 1
    depth = 0
    for i in range(start, len(text)):
        depth += (text[i] == '[') - (text[i] == ']')
        if depth == 0:
            literal = text[start:i + 1]
            assert re.fullmatch(r'[\[\]01,\s]*', literal)
            return ast.literal_eval(literal)
    raise ValueError('Unclosed schema array')


def cases():
    words, walks = source_array('outsideWords'), source_array('outsideWalked')
    suffix, local = source_array('suffixes'), source_array('localWalkSuffixes')
    assert len(words) == len(walks) == 97 and len(suffix) == len(local) == 22
    result = [dict(label=['outside', i], word=w, walked=walks[i])
              for i, w in enumerate(words)]
    for d in range(4):
        p = [1, 1, 1, 1, 1, 0] + [1, 1, 1, 1, 0] * d
        result.append(dict(label=['entry', d], word=p[:-1], walked=p + [0]))
        for i in range(22):
            result.append(dict(label=['local', d, i], word=p + suffix[i], walked=p + local[i]))
    return sorted(result, key=lambda c: (len(c['walked']), c['walked'], c['label']))


def walk(rows, bits):
    q = 15
    for b in bits:
        tick()
        t = rows[q][b]
        assert t is not None and t[0] == b and t[1] == 1
        q = t[2]
    return q


def frame(case, active, extra):
    pad = max(22, len(case['walked']) + 3)
    bank = active + extra
    bits = case['word'] + [0] * (pad - len(case['word'])) + [1, 0]
    for value in bank:
        bits += [1] * (value + 1) + [0]
    assert bits[:len(case['walked'])] == case['walked']
    return dict(state=15, head=0, ones=[-1] + [i for i, b in enumerate(bits) if b],
                blank_elsewhere=True, pad=pad, active=active, extra=extra, case=case)


def simulate(rows, initial, bound, boot=False, target=(41, 1)):
    q, head, ones = initial['state'], initial['head'], set(initial['ones'])
    trace = []
    outcome = 'bound'
    for index in range(bound + 1):
        bit = int(head in ones)
        if (q, bit) == target:
            outcome = 'target-hit'
            break
        if q == 58 and bit == 1 and head + 1 in ones:
            outcome = 'separator-guard-failed'
            break
        if index and q == 15 and (not boot or index == 3634):
            outcome = 'initial-root' if boot else 'next-root'
            break
        if index == bound:
            break
        tick()
        t = rows[q][bit]
        trace.append(dict(index=index, state=q, head=head, bit=bit, cell=t))
        if t is None:
            outcome = 'halt'
            break
        if t[0]:
            ones.add(head)
        else:
            ones.discard(head)
        head += t[1]
        q = t[2]
    return dict(outcome=outcome, transitions=len(trace), state=q, head=head,
                ones=sorted(ones), trace=trace)


def prepare():
    subprocess.run(['git', 'diff', '--exit-code', BASE, '--', 'Cryptids', 'Cryptids.lean',
                    'Challenge.lean', 'artifacts', 'comparator', 'lean-toolchain',
                    'lakefile.toml', 'lake-manifest.json', 'verify.py'], check=True)
    rows = table()
    if os.environ.get('RH41_VERIFY02') == '1':
        failed = '06e9245fe2675f1c2e94ba1477982c2d2a8b4816'
        repairs = {}
        for name in ['GuardCore.lean', 'GuardBoot.lean', 'AssemblyProbe.lean']:
            path = 'scripts/riemann41/' + name
            old = subprocess.check_output(['git', 'show', failed + ':' + path], text=True)
            expected = old
            if name != 'AssemblyProbe.lean':
                expected = expected.replace(
                    'open Turing ConjectureMachines ConjectureMachines.Riemann95',
                    'open ConjectureMachines ConjectureMachines.Riemann95')
            if name == 'GuardCore.lean':
                expected = expected.replace('if_neg ha', 'ite_eq_right ha')
            if name == 'GuardBoot.lean':
                expected = expected.replace('Bool.and_eq_true.mp hc',
                                            'Bool.and_eq_true_iff.mp hc')
            actual = (ROOT / path).read_text()
            assert actual == expected, 'Exact proof-compatibility repair: ' + name
            repairs[path] = dict(before=hashlib.sha256(old.encode()).hexdigest(),
                                 after=hashlib.sha256(actual.encode()).hexdigest())
        save('repair-binding.json', dict(status='exact-proof-compatibility-repair-bound',
             failed_producer=failed, proofs=repairs, statements_and_hypotheses_unchanged=True))
    paths = [TABLE, SCHEMA, 'lean-toolchain', 'lake-manifest.json', 'lakefile.riemann41.toml',
             '.github/workflows/riemann41.yml']
    paths += [str(p.relative_to(ROOT)) for p in sorted((ROOT / 'scripts/riemann41').glob('*'))
              if p.is_file()]
    save('provenance.json', dict(base=BASE, producer=os.environ['GITHUB_SHA'],
         table_sha256=SHA, hashes={p: hashlib.sha256((ROOT / p).read_bytes()).hexdigest()
                                 for p in paths}, exported_candidates=0, savings=0))
    save('literal-cells.json', rows)
    print('RH41_PINNED_LITERAL_FIDELITY_PASSED')


def filters():
    rows = table()
    records = [dict(case=c, endpoint=walk(rows, c['walked'])) for c in cases()]
    selected = [r['case'] for r in records if r['endpoint'] == 58][:16]
    assert selected
    save('decoder-cases.json', records)
    save('selected-callers.json', selected)
    blank = dict(state=0, head=0, ones=[], blank_elsewhere=True)
    control = simulate(rows, blank, 0, target=(0, 0))
    assert control['outcome'] == 'target-hit' and control['transitions'] == 0
    boot = simulate(rows, blank, 3634, boot=True)
    save('boot.json', dict(input=blank, result=boot))
    expected_bits = [0] * 22 + [1, 0] + [1, 0] * 9
    expected_ones = sorted([boot['head'] - 1] + [boot['head'] + i
                                             for i, b in enumerate(expected_bits) if b])
    assert boot['outcome'] == 'initial-root' and boot['transitions'] == 3634
    assert boot['state'] == 15 and boot['head'] == -4 and boot['ones'] == expected_ones
    count = 0
    outcome = 'finite-filters-passed'
    active_vectors = [[0, 0, 0, 0, 0], [1, 1, 1, 1, 1], [0, 1, 2, 3, 4], [4, 3, 2, 1, 0]]
    with (OUT / 'frames.jsonl').open('w') as stream:
        for case in selected:
            for active in active_vectors:
                for extra in [[], [0, 1, 0, 2]]:
                    if 2 * (used + 20000) > 2_000_000:
                        outcome = 'transition-budget-obstruction'
                        break
                    initial = frame(case, active, extra)
                    result = simulate(rows, initial, 20000)
                    stream.write(json.dumps(dict(input=initial, result=result)) + '\n')
                    count += 1
                    if result['outcome'] not in ['next-root', 'halt']:
                        outcome = result['outcome']
                        break
                if outcome != 'finite-filters-passed':
                    break
            if outcome != 'finite-filters-passed':
                break
    save('finite-summary.json', dict(status=outcome, selected_callers=len(selected),
         frame_count=count, primary_transition_evaluations=used, combined_limit=2_000_000,
         independent_replay_reserved=used, known_hit_control=control,
         global_avoidance_proved=False, exported_candidates=0))
    generate_literal(rows, selected)
    print('RH41_FINITE_FILTERS_RECORDED', outcome, count)


def generate_literal(rows, selected):
    def cell(t):
        return 'none' if t is None else f'some ({t[0]}, .{"right" if t[1] == 1 else "left"}, {t[2]})'
    lines = ['/-', 'Copyright (c) 2026 The Cryptids Authors. All rights reserved.',
             'Released under Apache 2.0 license as described in the file LICENSE.', '-/',
             'module', '', 'public import Cryptids.Riemann95Definition',
             'public import Cryptids.ReductionSupport.Riemann95.ControlStep95', '',
             '@[expose] public section', 'namespace Rh41',
             'open Turing ConjectureMachines ConjectureMachines.Riemann95', '',
             'def literalRows : List (List (Option (Fin 2 × Dir × Fin 95))) := [']
    lines += ['  [' + ', '.join(map(cell, row)) + ']' + (',' if i < 94 else ']')
              for i, row in enumerate(rows)]
    lines += ['', 'theorem all_cells : ∀ q b, machine.transition q b =',
              '    (literalRows.getD q.val []).getD b.val none := by', '  decide +kernel', '',
              'theorem incoming_sources : ∀ (q : Fin 95) (b : Fin 2),',
              '    (machine.transition q b).any (fun t ↦ t.2.2 == 41) = true ↔',
              '      q = 58 ∧ b = 1 := by', '  decide +kernel', '',
              'theorem incoming_only (q : Fin 95) (b w : Fin 2) (dir : Dir) (next : Fin 95)',
              '    (ht : machine.transition q b = some (w, dir, next)) (hn : next = 41) :',
              '    q = 58 ∧ b = 1 ∧ w = 0 ∧ dir = .right := by',
              '  have hsrc : q = 58 ∧ b = 1 := (incoming_sources q b).mp (by',
              '    simp [ht, hn])',
              '  obtain ⟨rfl, rfl⟩ := hsrc',
              '  have hcell : some (0, Dir.right, (41 : Fin 95)) = some (w, dir, next) := ht',
              '  cases hcell', '  exact ⟨rfl, rfl, rfl, rfl⟩', '',
              'def selected : Array Schema.ControlWord := #[']
    lines += ['  .' + ' '.join(map(str, c['label'])) + (',' if i + 1 < len(selected) else ']')
              for i, c in enumerate(selected)]
    lines += [f'theorem selected_effect : ∀ i : Fin {len(selected)},',
              '    Control.effect (selected.getD i.val (.entry 0)) = .decnz 4 := by',
              '  decide +kernel', '', 'end Rh41', '']
    text = '\n'.join(lines)
    assert all(len(line) <= 100 for line in lines)
    (ROOT / 'scripts/riemann41/GuardLiteral.lean').write_text(text)
    (OUT / 'GuardLiteral.lean').write_text(text)


if __name__ == '__main__':
    {'prepare': prepare, 'filters': filters}[sys.argv[1]]()
