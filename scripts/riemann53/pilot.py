#!/usr/bin/env python3
"""One fixed bypass candidate; finite checks reject a canonical frame encoding only."""
import os

if os.environ.get('RH53_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Generation, simulation and state counting are remote-only')

import ast
from collections import Counter
import csv
import hashlib
import json
from pathlib import Path
import re
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / os.environ.get('RH53_OUTPUT_DIR', '.lake/riemann53')
BASE = '6c28d8524fa008c6fb5aadb759df74a55ce96423'
TABLE = 'artifacts/riemann_95/machine.txt'
SHA = '7e9731ed1b7c63d4e67c0f8d646f8498d9645f26e237a8604d4b7f91a6ab398d'
SCHEMA = 'Cryptids/ReductionSupport/Riemann95/ControllerSchema95.lean'
CONTROL = 'Cryptids/ReductionSupport/Riemann95/ControlStep95.lean'
FUEL = 2_000_000
used_steps = 0


def save(name, value):
    (OUT / name).write_text(json.dumps(value, indent=2) + '\n')


def digest(data):
    return hashlib.sha256(data).hexdigest()


def parse_table(data):
    result = []
    for line in data.decode().splitlines():
        cells = line.split()
        assert len(cells) == 2
        row = []
        for cell in cells:
            if cell == '---':
                row.append(None)
            else:
                match = re.fullmatch(r'([01])([LR])(0|[1-9][0-9]*)', cell)
                assert match, cell
                row.append((int(match[1]), -1 if match[2] == 'L' else 1, int(match[3])))
        result.append(row)
    assert result
    assert all(t is None or 0 <= t[2] < len(result) for row in result for t in row)
    return result


def token(t):
    return '---' if t is None else f'{t[0]}{"R" if t[1] == 1 else "L"}{t[2]}'


def relabel(q):
    assert q != 53
    return q if q < 53 else q - 1


def census(table):
    return dict(states=len(table), symbols=2, cells=sum(map(len, table)),
                defined=sum(t is not None for row in table for t in row),
                absent=[[q, a] for q, row in enumerate(table)
                        for a, t in enumerate(row) if t is None])


def generate():
    subprocess.run(['git', 'diff', '--exit-code', BASE, '--', 'Cryptids', 'Cryptids.lean',
                    'Challenge.lean', 'artifacts', 'comparator', 'lean-toolchain',
                    'lake-manifest.json', 'lakefile.toml', 'verify.py'], check=True)
    data = (ROOT / TABLE).read_bytes()
    assert digest(data) == SHA
    table = parse_table(data)
    ledger_path = ROOT / 'research/riemann-reduction/state-ledger.tsv'
    ledger = list(csv.DictReader(ledger_path.open(), delimiter='\t'))
    assert [int(row['state']) for row in ledger] == list(range(len(table)))
    for q, row in enumerate(ledger):
        assert [row['zero'], row['one']] == list(map(token, table[q]))
    incoming = [[q, a] for q, row in enumerate(table)
                for a, t in enumerate(row) if t is not None and t[2] == 53]
    assert incoming == [[40, 1]], incoming
    assert table[53] == [(0, 1, 68), (1, 1, 68)]
    candidate = []
    mapping = []
    for q, row in enumerate(table):
        if q == 53:
            continue
        output = []
        for a, t in enumerate(row):
            if t is None:
                output.append(None)
            else:
                w, d, target = t
                if target == 53:
                    assert (q, a) == (40, 1)
                    target = 68
                output.append((w, d, relabel(target)))
        candidate.append(output)
        mapping.append(dict(old=q, new=relabel(q), charge=ledger[q]['charge']))
    output = ('\n'.join(' '.join(map(token, row)) for row in candidate) + '\n').encode()
    assert parse_table(output) == candidate
    assert census(candidate) == dict(states=94, symbols=2, cells=188,
                                      defined=187, absent=[[60, 1]])
    (OUT / 'machine94.txt').write_bytes(output)
    save('source-map.json', mapping)
    # Independent count is also recomputed in Node before the witness is credited.
    corrupted = output.replace(b'1R67', b'1R66', 1)
    assert corrupted != output and parse_table(corrupted) != candidate
    bad_count = output.splitlines(keepends=True)[:-1]
    try:
        assert census(parse_table(b''.join(bad_count)))['states'] == 94
    except (AssertionError, ValueError):
        wrong_count_rejected = True
    else:
        wrong_count_rejected = False
    assert wrong_count_rejected
    sources = [TABLE, SCHEMA, CONTROL, 'Cryptids/Semantics/Riemann120/Backend.lean',
               'Cryptids/Semantics/Riemann/Gadgets.lean',
               'scripts/riemann53/pilot.py', 'scripts/riemann53/driver.py',
               'scripts/riemann53/replay.mjs', '.github/workflows/riemann53_pilot.yml',
               'scripts/riemann53/Rh53Counterexample.lean',
               'scripts/riemann53/ReplayAudit.lean', 'scripts/riemann53/check_lean.py',
               'scripts/riemann53/setup_replay.py', 'lakefile.riemann53.toml']
    save('provenance.json', dict(base=BASE, producer=os.environ['GITHUB_SHA'],
                                hashes={p: digest((ROOT / p).read_bytes()) for p in sources},
                                machine94_sha256=digest(output),
                                baseline=census(table), candidate=census(candidate),
                                incoming53=incoming,
                                ledger_counts=dict(Counter(r['charge'] for r in ledger)),
                                candidate_counts=dict(Counter(r['charge'] for r in mapping)),
                                controls=dict(wrong_cell_detected=True,
                                              wrong_count_rejected=wrong_count_rejected)))
    print('ONE_FIXED_CANDIDATE_GENERATED')


def array_body(text, name):
    start = text.index('#[', text.index('def ' + name)) + 1
    depth = 0
    for i in range(start, len(text)):
        depth += (text[i] == '[') - (text[i] == ']')
        if depth == 0:
            return text[start:i + 1]
    raise ValueError('Unclosed source array')


def word_array(text, name):
    body = array_body(text, name)
    assert re.fullmatch(r'[\[\]01,\s]*', body)
    words = ast.literal_eval(body)
    assert all(type(b) is int and b in (0, 1) for w in words for b in w)
    return words


def effects(text, name):
    result = []
    for line in array_body(text, name)[1:-1].splitlines():
        line = line.strip().rstrip(',')
        if not line:
            continue
        match = re.fullmatch(r'\.(inc|decnz) ([0-4])|\.jump (true|false) ([0-9]+)|\.halt', line)
        assert match, line
        if line == '.halt':
            result.append(dict(kind='halt'))
        elif match[1]:
            result.append(dict(kind=match[1], reg=int(match[2])))
        else:
            result.append(dict(kind='jump', cont=match[3] == 'true', k=int(match[4])))
    return result


def step_budget():
    global used_steps
    used_steps += 1
    assert used_steps <= FUEL, 'global finite TM-step cap'


def encode(bits, table):
    """E: delete symbols read at old 53 along a read-preserving root walk."""
    q, output, removed = 15, [], []
    for i, b in enumerate(bits):
        step_budget()
        t = table[q][b]
        if t is None or t[0] != b or t[1] != 1:
            output.extend(bits[i:])
            break
        if q == 53:
            removed.append(i)
        else:
            output.append(b)
        q = t[2]
    return output, removed


def walk(bits, table):
    q, trace = 15, []
    for b in bits:
        step_budget()
        trace.append([q, b])
        t = table[q][b]
        assert t is not None and t[0] == b and t[1] == 1, (q, b)
        q = t[2]
    return q, trace


def returned(bits, cont, k):
    target = 1 if cont else 0
    for i in range(len(bits) - 1, -1, -1):
        if bits[i] == target:
            if k == 0:
                return bits[:i] + [1]
            k -= 1
    return []


def root_frame(pad, word, bank):
    assert len(word) <= pad
    bits = word + [0] * (pad - len(word)) + [1, 0]
    for v in bank:
        bits += [1] * (v + 1) + [0]
    return dict(state=15, head=0, pad=pad, word=word, bank=bank,
                ones=[-1] + [i for i, b in enumerate(bits) if b], blank_elsewhere=True)


def run_to_root(table, frame, limit=20000):
    q, h, ones = frame['state'], frame['head'], set(frame['ones'])
    trace = []
    for n in range(1, limit + 1):
        step_budget()
        a = int(h in ones)
        t = table[q][a]
        if t is None:
            return dict(halted=True, steps=n - 1, state=q, head=h,
                        ones=sorted(ones), trace=trace)
        if n <= 32:
            trace.append([q, a, h, list(t)])
        if t[0]:
            ones.add(h)
        else:
            ones.discard(h)
        h += t[1]
        q = t[2]
        if q == 15:
            return dict(halted=False, steps=n, state=q, head=h,
                        ones=sorted(ones), relative_ones=sorted(p - h for p in ones),
                        trace=trace)
    return dict(inconclusive=True, steps=limit, state=q, head=h, ones=sorted(ones))


def screen(fixed44=False):
    table = parse_table((ROOT / TABLE).read_bytes())
    candidate = parse_table((OUT / 'machine94.txt').read_bytes())
    schema = (ROOT / SCHEMA).read_text()
    control = (ROOT / CONTROL).read_text()
    words = word_array(schema, 'outsideWords')
    walks = word_array(schema, 'outsideWalked')
    outs = effects(control, 'outsideEffects')
    assert len(words) == len(walks) == len(outs) == 97
    cases = [dict(label=['outside', i], word=w, walked=walks[i], effect=outs[i])
             for i, w in enumerate(words)]
    # The fixed outside-word tier alone can supply a decisive negative witness.
    # Deeper cases are unnecessary after the first false required equation.
    cases.sort(key=lambda c: (len(c['walked']), c['walked'], c['label']))
    if fixed44:
        cases = [c for c in cases if c['label'] == ['outside', 44]]
        assert len(cases) == 1 and cases[0]['effect'] == dict(kind='decnz', reg=0)
    history, witness = [], None
    for case in cases:
        word, walked, effect = case['word'], case['walked'], case['effect']
        ew, rw = encode(word, table)
        ex, rx = encode(walked, table)
        terminal, old_trace = walk(walked, table)
        newterminal, new_trace = walk(ex, candidate)
        assert newterminal == relabel(terminal)
        base = dict(**case, encoded_word=ew, encoded_walked=ex,
                    removed_word_indices=rw, removed_walked_indices=rx,
                    old_terminal=terminal, new_terminal=newterminal,
                    old_parse=old_trace, new_parse=new_trace)
        options = []
        if effect['kind'] == 'inc':
            options = [(False, 0)]
        elif effect['kind'] == 'decnz':
            options = [(False, 1)] if fixed44 else [(False, 0), (False, 1)]
        elif effect['kind'] == 'jump':
            options = [(effect['cont'], effect['k'])]
        for cont, k in options:
            old_out = returned(walked, cont, k)
            encoded_out, _ = encode(old_out, table)
            actual_out = returned(ex, cont, k)
            check = dict(label=case['label'], cont=cont, k=k,
                         commutes=encoded_out == actual_out)
            history.append(check)
            if encoded_out != actual_out:
                witness = dict(**base, cont=cont, k=k, old_return=old_out,
                               encoded_old_return=encoded_out,
                               return_of_encoded=actual_out)
                break
        if witness:
            break
    if witness:
        effect = witness['effect']
        bank = [0] * 9
        if effect['kind'] == 'decnz' and witness['k'] == 0:
            bank[effect['reg']] = 1
        pad = max(22, len(witness['walked']) + 3)
        old_frame = root_frame(pad, witness['word'], bank)
        new_pad = pad - len(witness['removed_walked_indices'])
        new_frame = root_frame(new_pad, witness['encoded_word'], bank)
        old_run = run_to_root(table, old_frame)
        new_run = run_to_root(candidate, new_frame)
        assert not old_run.get('inconclusive') and not new_run.get('inconclusive')
        assert not old_run['halted'] and not new_run['halted']
        next_bank = bank.copy()
        if effect['kind'] == 'inc':
            next_bank[effect['reg']] += 1
        elif effect['kind'] == 'decnz' and witness['k'] == 0:
            next_bank[effect['reg']] -= 1
            next_bank.append(0)
        extra = int(effect['kind'] != 'jump' and witness['k'] >= witness['walked'].count(0))
        expected_old = root_frame(pad + extra, witness['old_return'], next_bank)
        assert old_run['relative_ones'] == expected_old['ones']
        expected_new_control = root_frame(new_pad + extra, witness['return_of_encoded'], next_bank)
        assert new_run['relative_ones'] == expected_new_control['ones']
        witness['frames'] = dict(old_input=old_frame, new_input=new_frame,
                                  old_next_root=old_run, new_next_root=new_run,
                                  expected_old_next=expected_old,
                                  expected_new_control_next=expected_new_control,
                                  encoding_padding_rule='pad minus deleted walked symbols')
        save('witness.json', witness)
    save('screen.json', dict(status='obstruction' if witness else 'no-finite-obstruction',
                             checked_equations=history, fixed_tier_size=len(cases),
                             witness=bool(witness), total_tm_steps=used_steps,
                             certified=False, fuel_limit=FUEL,
                             scope='canonical skipped-bit encoding; not a global RH refutation'))
    print('EXACT_RETURN_EQUATION_FAILURE' if witness else 'UNIVERSAL_ENCODING_STILL_OPEN')


if __name__ == '__main__':
    {'generate': generate, 'screen': screen, 'fixed44': lambda: screen(True)}[sys.argv[1]]()
