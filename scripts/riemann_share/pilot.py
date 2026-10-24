#!/usr/bin/env python3
"""Fixed decoder aliases, symbolic rejection witnesses, remote-only execution."""
import os
if os.environ.get('RHSHARE_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote generation, parser checks and simulation only')

import ast
import hashlib
import itertools
import json
from pathlib import Path
import re
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / '.lake/riemann-share'
BASE = '6c28d8524fa008c6fb5aadb759df74a55ce96423'
TABLE = 'artifacts/riemann_95/machine.txt'
SHA = '7e9731ed1b7c63d4e67c0f8d646f8498d9645f26e237a8604d4b7f91a6ab398d'
SCHEMA = 'Cryptids/ReductionSupport/Riemann95/ControllerSchema95.lean'
MEMBERS = [26, 46, 50, 86, 87, 94]
FUEL = 2_000_000
used = 0


def tick():
    global used
    used += 1
    assert used <= FUEL, 'Combined transition-evaluation budget exceeded'


def save(name, value):
    (OUT / name).write_text(json.dumps(value, indent=2) + '\n')


def sha(data):
    return hashlib.sha256(data).hexdigest()


def original():
    data = (ROOT / TABLE).read_bytes()
    assert sha(data) == SHA
    rows = []
    for line in data.decode().splitlines():
        cells = line.split()
        assert len(cells) == 2
        row = []
        for cell in cells:
            if cell == '---':
                row.append(None)
                continue
            m = re.fullmatch(r'([01])([LR])(0|[1-9][0-9]*)', cell)
            assert m, cell
            row.append([int(m[1]), 1 if m[2] == 'R' else -1, int(m[3])])
        rows.append(row)
    assert len(rows) == 95
    assert all(t is None or 0 <= t[2] < 95 for row in rows for t in row)
    assert [[q, b] for q, row in enumerate(rows) for b, t in enumerate(row)
            if t is None] == [[61, 1]]
    for q, target in zip(MEMBERS, [33, 60, 64, 89, 94, 43]):
        assert rows[q] == [[0, 1, 58], [1, 1, target]]
    return rows


def alias(q, keep, remove):
    return keep if q == remove else q


def dense(q, keep, remove):
    q = alias(q, keep, remove)
    return q - int(remove < q)


def transition(table, q, bit, choice=None):
    if choice:
        keep, remove = choice['keep'], choice['remove']
        t = table[alias(q, keep, remove)][bit]
        return None if t is None else [t[0], t[1], alias(t[2], keep, remove)]
    return table[q][bit]


def walk(table, bits, choice=None):
    q, trace = 15, []
    for index, bit in enumerate(bits):
        tick()
        t = transition(table, q, bit, choice)
        trace.append(dict(index=index, state=q, bit=bit, cell=t))
        if t is None or t[0] != bit or t[1] != 1:
            return None, trace
        q = t[2]
    return q, trace


def source_array(name):
    text = (ROOT / SCHEMA).read_text()
    start = text.index('#[', text.index('def ' + name)) + 1
    level = 0
    for i in range(start, len(text)):
        level += (text[i] == '[') - (text[i] == ']')
        if level == 0:
            data = text[start:i + 1]
            assert re.fullmatch(r'[\[\]01,\s]*', data)
            result = ast.literal_eval(data)
            assert all(type(b) is int and b in [0, 1] for w in result for b in w)
            return result
    raise ValueError('Unclosed source array')


def fixtures():
    words, walks = source_array('outsideWords'), source_array('outsideWalked')
    suffixes, local = source_array('suffixes'), source_array('localWalkSuffixes')
    assert len(words) == len(walks) == 97 and len(local) == len(suffixes) == 22
    cases = [dict(label=['outside', i], word=w, walked=walks[i]) for i, w in enumerate(words)]
    for depth in range(4):
        prefix = [1, 1, 1, 1, 1, 0] + [1, 1, 1, 1, 0] * depth
        cases.append(dict(label=['entry', depth], word=prefix[:-1], walked=prefix + [0]))
        for i in range(22):
            cases.append(dict(label=['local', depth, i], word=prefix + suffixes[i],
                              walked=prefix + local[i]))
    return sorted(cases, key=lambda c: (len(c['walked']), c['walked'], c['label']))


def prepare():
    subprocess.run(['git', 'diff', '--exit-code', BASE, '--', 'Cryptids', 'Cryptids.lean',
                    'Challenge.lean', 'artifacts', 'comparator', 'lean-toolchain',
                    'lakefile.toml', 'lake-manifest.json', 'verify.py'], check=True)
    original()
    choices = []
    for a, b in itertools.combinations(MEMBERS, 2):
        for keep, remove in [(a, b), (b, a)]:
            choices.append(dict(index=len(choices), pair=[a, b], keep=keep, remove=remove))
    assert len(choices) == 30 and len({(c['keep'], c['remove']) for c in choices}) == 30
    save('family.json', choices)
    paths = [TABLE, SCHEMA, 'Cryptids/ReductionSupport/Riemann95/ControlStep95.lean',
             'Cryptids/ReductionSupport/Riemann95/Parser95.lean',
             'lean-toolchain', 'lake-manifest.json', 'lakefile.riemann-share.toml',
             '.github/workflows/riemann_share.yml']
    paths += [str(p.relative_to(ROOT)) for p in sorted((ROOT / 'scripts/riemann_share').glob('*'))
              if p.is_file()]
    save('provenance.json', dict(base=BASE, producer=os.environ['GITHUB_SHA'],
                                hashes={p: sha((ROOT / p).read_bytes()) for p in paths},
                                exported_candidates=0, new_certified_rh_savings=0))
    print('FIXED_30_ALIAS_FAMILY_PINNED')


def frame(case):
    pad, bank = max(22, len(case['walked']) + 3), [0] * 9
    bits = case['word'] + [0] * (pad - len(case['word'])) + [1, 0]
    for value in bank:
        bits += [1] * (value + 1) + [0]
    assert bits[:len(case['walked'])] == case['walked']
    return dict(state=15, head=0, pad=pad, word=case['word'], banks=bank,
                ones=[-1] + [i for i, bit in enumerate(bits) if bit], blank_elsewhere=True)


def physical(table, initial, steps, choice=None):
    q, head, ones, trace = initial['state'], initial['head'], set(initial['ones']), []
    for index in range(steps):
        tick()
        bit = int(head in ones)
        t = transition(table, q, bit, choice)
        trace.append(dict(index=index, state=q, head=head, bit=bit, cell=t))
        if t is None:
            return dict(halted=True, steps=index, state=q, head=head,
                        ones=sorted(ones), trace=trace)
        if t[0]:
            ones.add(head)
        else:
            ones.discard(head)
        head += t[1]
        q = t[2]
    return dict(halted=False, steps=steps, state=q, head=head, ones=sorted(ones), trace=trace)


def lean_control(label):
    if label[0] == 'outside':
        return f'.outside {label[1]}'
    if label[0] == 'entry':
        return f'.entry {label[1]}'
    assert label[0] == 'local'
    return f'.local {label[1]} {label[2]}'


def screen():
    table, cases = original(), fixtures()
    choices = json.loads((OUT / 'family.json').read_text())
    records = []
    for choice in choices:
        record = dict(choice=choice, status='finite-survivor', tested=0)
        for case in cases:
            old, before = walk(table, case['walked'])
            assert old is not None
            actual, after = walk(table, case['walked'], choice)
            k, x = choice['keep'], choice['remove']
            expected = dense(old, k, x)
            observed = None if actual is None else dense(actual, k, x)
            record['tested'] += 1
            if expected != observed:
                first = next((i for i, (a, b) in enumerate(zip(before, after)) if a != b), None)
                record.update(status='endpoint-contract-refuted', witness=case,
                              old_endpoint=old, alias_endpoint=actual,
                              expected_dense=expected, observed_dense=observed,
                              old_trace=before, alias_trace=after, first_divergence=first)
                break
        records.append(record)
    (OUT / 'aliases.jsonl').write_text(''.join(json.dumps(r) + '\n' for r in records))
    survivors = [r for r in records if r['status'] == 'finite-survivor']
    result = dict(status='all-aliases-refuted' if not survivors else 'universal-parser-open',
                  choices=30, fixture_set_size=len(cases), records=records,
                  selected_survivor=survivors[0]['choice'] if survivors else None,
                  exported_candidates=0, total_transition_evaluations=used,
                  fuel_limit=FUEL, new_certified_rh_savings=0)
    if survivors:
        result['open_obligation'] = ('For the first surviving alias, prove the exact parser '
                                     'endpoint equation for all Schema.ControlWord, including '
                                     'arbitrary recursion depth; finite checks do not establish it.')
    else:
        witness = records[0]
        initial = frame(witness['witness'])
        steps = len(witness['witness']['walked'])
        tapes = dict(choice=witness['choice'], label=witness['witness']['label'],
                     input=initial, requested_steps=steps,
                     old=physical(table, initial, steps),
                     aliased=physical(table, initial, steps, witness['choice']),
                     scope='Full finite tapes at the parser length; no blank reachability claim')
        save('tapes.json', tapes)
        controls = ',\n  '.join(lean_control(r['witness']['label']) for r in records)
        header = ('/-\nCopyright (c) 2026 The Cryptids Authors. All rights reserved.\n'
                  'Released under Apache 2.0 license as described in the file LICENSE.\n-/\n'
                  'module\n\npublic import ShareDefinitions\n\n@[expose] public section\n'
                  'namespace RhShare\n\n')
        certificate = header + 'def witnesses : Array ControlWord := #[\n  ' + controls
        certificate += ']\n\ndef witness (i : Fin 30) : ControlWord :=\n'
        certificate += '  witnesses.getD i.val (.outside 0)\n\n'
        certificate += 'theorem witness_count : witnesses.size = 30 := by\n  decide +kernel\n\n'
        certificate += '/-- Each fixed alias violates the unchanged endpoint contract. -/\n'
        certificate += 'theorem all_aliases_fail : ∀ i : Fin 30, failure i (witness i) := by\n'
        certificate += '  decide +kernel\n\nend RhShare\n'
        path = ROOT / 'scripts/riemann_share/ShareCertificate.lean'
        path.write_text(certificate)
        (OUT / 'ShareCertificate.lean').write_text(certificate)
        result['generated_certificate_sha256'] = sha(certificate.encode())
    result['total_transition_evaluations'] = used
    save('screen.json', result)
    print('ALL_FIXED_ALIASES_REFUTED' if not survivors else 'EXACT_UNIVERSAL_PARSER_OBLIGATION_OPEN')


if __name__ == '__main__':
    {'prepare': prepare, 'screen': screen}[sys.argv[1]]()
