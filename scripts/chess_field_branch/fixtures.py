#!/usr/bin/env python3
"""Remote-only independent sparse-tape replay of exported extended rows."""
import copy
import json
import os
import re
from pathlib import Path
assert os.environ.get('CHESS_REMOTE') == '1', 'Machine execution is remote-only'
ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / '.lake/chess-field-branch'
data = json.loads((WORK / 'machine.json').read_text())
visited = set()


def put_cell(bits, cell, raw):
    for j in range(13):
        pos = 13 * cell + j
        if (raw >> j) & 1:
            bits[pos] = 1
        else:
            bits.pop(pos, None)


def bits_of(symbols):
    bits = {}
    for pos, raw in symbols.items():
        put_cell(bits, pos, raw)
    return bits


def return_to_marker(bits, head):
    distance = 0
    while not bits.get(head + 12, 0):
        head -= 13
        distance += 1
        assert distance <= 128, 'fixture lacks a return marker'
    return head, distance


def finish(case):
    case['head'], distance = return_to_marker(case['expected'], case['head'])
    case['steps'] += 2 + 37 * distance + 24
    case['source_steps'] += distance + 1
    case['branch_distance'] = distance
    case['successor'] = 'normal3' if case['value'] in [0, 1, 2] else 'reverse_push_s000'
    return case


def source_case(seed, n, m, top=None):
    bottom = -n
    symbols = {}
    for cell in range(-n - 3, max(3, -n + m + 3)):
        fields = [((seed // (5 ** j)) + 3 * cell + j + 17) % 5 for j in range(4)]
        symbols[cell] = sum(v << (3 * j) for j, v in enumerate(fields))
    for offset in range(m):
        cell = bottom + offset
        value = top if top is not None and offset == m - 1 else 1 + (seed + offset) % 4
        symbols[cell] = (symbols.get(cell, 0) & ~7) | value
    gap = bottom + m
    symbols[gap] = symbols.get(gap, 0) & ~7
    for cell in symbols:
        symbols[cell] &= ~4096
    symbols[bottom] |= 4096
    original = symbols.copy()
    head = 0
    first_return = 0
    while not (symbols.get(head, 0) & 4096):
        head -= 1
        first_return += 1
        assert first_return <= n
    scan = 0
    while symbols.get(head, 0) & 7:
        head += 1
        scan += 1
        assert scan <= m
    empty = bool(symbols.get(head, 0) & 4096)
    if empty:
        value = 0
    else:
        head -= 1
        value = symbols.get(head, 0) & 7
        symbols[head] &= ~7
    assert first_return == n and scan == m and 0 <= value < 5
    return finish(dict(bits=bits_of(original), expected=bits_of(symbols), head=13 * head,
                       value=value, steps=37*n+26+23*m+(34 if empty else 61),
                       source_steps=n+m+3))


def replay(machine, case, value, entry=None, collect=False):
    tape = case['bits'].copy()
    state = machine['entries'][value] if entry is None else entry
    head = 0
    for tick in range(case['steps'] + 1):
        if collect:
            visited.add(state)
        instruction = machine['rows'][state][tape.get(head, 0)]
        if instruction is None:
            assert tick == case['steps'], ('execution length', tick, case['steps'])
            assert machine['ports'][state] == dict(store=case['value'], successor=case['successor'])
            assert state == 478 + 49*case['value'], ('wrong final control', state)
            assert head == case['head'], ('head', head, case['head'])
            assert tape == case['expected'], 'tape/frame mismatch'
            return
        assert tick < case['steps'], ('no successor', state)
        write, direction, state = instruction
        if write:
            tape[head] = write
        else:
            tape.pop(head, None)
        head += direction
    raise AssertionError('Missing final port')


assert data['states'] == len(data['rows']) == len(data['ports']) == 675
for row in data['rows']:
    assert len(row) == 2
    for instruction in row:
        if instruction is not None:
            w, d, q = instruction
            assert w in [0, 1] and d in [-1, 1] and 0 <= q < 675
composed = 0
successors = set()
for seed in range(625):
    for n in [0, 1, 7]:
        for m in [0, 1, 2, 7, 31]:
            case = source_case(seed, n, m)
            for value in range(5):
                replay(data, case, value, collect=True)
                successors.add(case['successor'])
                composed += 1
# Independent arbitrary second-return paths, all stores and every valid field pattern.
branch_cases = 0
for seed in range(625):
    for distance in [0, 1, 2, 7, 31, 64]:
        symbols = {}
        for cell in range(-distance - 2, 3):
            fields = [((seed // (5 ** j)) + 2*cell + j + 13) % 5 for j in range(4)]
            symbols[cell] = sum(v << (3*j) for j, v in enumerate(fields))
        symbols[-distance] |= 4096
        bits = bits_of(symbols)
        for value in range(5):
            case = dict(bits=bits, expected=bits, value=value, head=-13*distance,
                        steps=37*distance+24,
                        successor='normal3' if value in [0, 1, 2] else 'reverse_push_s000')
            replay(data, case, value, entry=data['return_entries'][value], collect=True)
            branch_cases += 1
# Raw codes are robustness evidence only; the decoder is independent of old incoming store.
raw_cases = 0
for raw in range(8192):
    bits = {}
    put_cell(bits, -1, (raw & ~7) | 4 | 4096)
    put_cell(bits, 0, raw)
    put_cell(bits, 1, raw & ~4103)
    expected = bits.copy()
    if raw & 7:
        value = (raw & 7) if (raw & 7) < 5 else 0
        for j in range(3):
            expected.pop(j, None)
        case = dict(bits=bits, expected=expected, value=value, head=0, steps=84, source_steps=3)
    elif raw & 4096:
        case = dict(bits=bits, expected=expected, value=0, head=0, steps=34, source_steps=1)
    else:
        for j in range(3):
            expected.pop(-13+j, None)
        case = dict(bits=bits, expected=expected, value=4, head=-13, steps=61, source_steps=1)
    replay(data, finish(case), 0, entry=data['scan_entry'], collect=True)
    raw_cases += 1
# Arbitrary valid unmarked gaps also permit an absent previous main coordinate.
gap_cases = 0
for value in range(5):
    bits = {}
    put_cell(bits, -1, 4096 | value | (3 << 3) | (4 << 6) | (2 << 9))
    put_cell(bits, 0, (2 << 3) | (1 << 6) | (4 << 9))
    expected = bits.copy()
    for j in range(3):
        expected.pop(-13+j, None)
    case = finish(dict(bits=bits, expected=expected, value=value, head=-13, steps=61, source_steps=1))
    replay(data, case, 0, entry=data['scan_entry'], collect=True)
    gap_cases += 1
assert visited == set(range(675)), ('unvisited controls', sorted(set(range(675)) - visited))
assert successors == {'normal3', 'reverse_push_s000'}


def wrong_write(m):
    m['rows'][420][0][0] = 1


def wrong_return(m):
    for bit in range(2):
        m['rows'][36][bit][2] = 48


mutations = [
    ('former-return-port-stops', lambda m: m['rows'].__setitem__(48, [None, None]), 0, 4),
    ('normal-dispatch-alignment', lambda m: m['rows'][245][0].__setitem__(1, 1), 0, 4),
    ('gap-dispatch', lambda m: m['rows'][285][0].__setitem__(2, 287), 0, 4),
    ('marker-dispatch', lambda m: m['rows'][339][0].__setitem__(2, 404), 0, 4),
    ('loaded-store-gate', lambda m: m['rows'][399][0].__setitem__(2, 400), 0, 4),
    ('main-field-clear', wrong_write, 0, 4),
    ('successor-store-port', lambda m: m['ports'][674].__setitem__('store', 0), 0, 4),
    ('scan-loop-head', lambda m: m['rows'][301][0].__setitem__(1, 1), 0, 4),
    ('return-prefix-loop', wrong_return, 1, 4),
    ('former-successor-stops', lambda m: m['rows'].__setitem__(424, [None, None]), 0, 4),
    ('second-return-store', lambda m: m['rows'][429][0].__setitem__(2, 577), 0, 4),
    ('actual-branch-target', lambda m: m['ports'][674].__setitem__('successor', 'normal3'), 0, 4),
    ('separator-branch-target', lambda m: m['ports'][576].__setitem__('successor', 'reverse_push_s000'), 0, 2),
    ('second-return-loop', lambda m: m['rows'][662][0].__setitem__(2, 674), 0, 4),
]
controls = []
for name, mutate, n, top in mutations:
    broken = copy.deepcopy(data)
    mutate(broken)
    try:
        replay(broken, source_case(0, n, 2, top=top), 0)
    except AssertionError:
        controls.append(dict(name=name, rejected=True))
    else:
        raise AssertionError('Accepted corruption: ' + name)
# This inventory measures literal frozen source constructors, not compiler coverage or savings.
runtime = (ROOT/'Cryptids/Compilation/RuntimeModel.lean').read_text()
shared = (ROOT/'Cryptids/Compilation/SharedModel.lean').read_text()
family_counts = {kind: len(re.findall(r'^def s\d+ : Stmt := \.'+kind+r'\b', runtime, re.M))
                 for kind in ['push', 'peek', 'pop', 'load', 'branch', 'goto', 'halt']}
labels = {kind: len(re.findall(r'^def stack\d+ : StackLabel := \.'+kind+r'\b', shared, re.M))
          for kind in ['normal', 'go', 'ret']}
report = dict(status='passed', composed_source_cases=composed, branch_source_cases=branch_cases,
              raw_pop_cases=raw_cases, arbitrary_valid_gap_cases=gap_cases,
              binary_machine_cases=composed+branch_cases+raw_cases+gap_cases,
              source_pattern_seeds=625, raw_cell_patterns=8192, store_values=5,
              return_distances=[0, 1, 7], scan_distances=[0, 1, 2, 7, 31],
              second_return_distances=[0, 1, 2, 7, 31, 64],
              visited_controls=len(visited), corruption_controls=controls,
              source_oracle='return + normal2 + main-pop + ret s003 + actual branch',
              raw_invalid_codes_are_source_evidence=False, successors=sorted(successors),
              literal_runtime_statement_families=family_counts, literal_shared_label_families=labels,
              inventory_is_coverage_certificate=False)
(WORK/'fixtures-detail.json').write_text(json.dumps(report, indent=2)+'\n')
print(json.dumps(report))
print('Field branch independent fixtures passed')
