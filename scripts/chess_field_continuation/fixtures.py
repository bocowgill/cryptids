#!/usr/bin/env python3
"""Independent remote-only replay of composed numeric rows against a source tape oracle."""
import copy
import json
import os
from pathlib import Path
assert os.environ.get('CHESS_REMOTE') == '1', 'Machine execution is remote-only'
ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / '.lake/chess-field-continuation'
data = json.loads((WORK / 'machine.json').read_text())
visited = set()


def put_cell(bits, cell, raw):
    for j in range(13):
        position = 13 * cell + j
        if (raw >> j) & 1:
            bits[position] = 1
        else:
            bits.pop(position, None)


def bits_of(symbols):
    bits = {}
    for position, symbol in symbols.items():
        put_cell(bits, position, symbol)
    return bits


def valid_raw(raw):
    return all(((raw >> (3 * i)) & 7) < 5 for i in range(4))


def source_case(seed, n, m, top=None):
    bottom = -n
    symbols = {}
    for cell in range(-n - 3, max(3, -n + m + 3)):
        fields = [((seed // (5 ** j)) + 3 * cell + j + 17) % 5 for j in range(4)]
        raw = sum(v << (3 * j) for j, v in enumerate(fields))
        symbols[cell] = raw  # All neighbouring coordinates have valid source symbols.
    for offset in range(m):
        cell = bottom + offset
        value = top if top is not None and offset == m - 1 else 1 + (seed + offset) % 4
        symbols[cell] = (symbols.get(cell, 0) & ~7) | value
    gap = bottom + m
    symbols[gap] = symbols.get(gap, 0) & ~7
    for cell in list(symbols):
        symbols[cell] &= ~4096
    symbols[bottom] = symbols.get(bottom, 0) | 4096
    original = symbols.copy()
    # Independent source oracle: return, normal2 dispatch, main scan, pop, ret s003.
    head = 0
    return_steps = 0
    while not (symbols.get(head, 0) & 4096):
        head -= 1
        return_steps += 1
        assert return_steps <= n
    scan_steps = 0
    while symbols.get(head, 0) & 7:
        head += 1
        scan_steps += 1
        assert scan_steps <= m
    empty = bool(symbols.get(head, 0) & 4096)
    if empty:
        value = 0
    else:
        head -= 1
        value = symbols.get(head, 0) & 7
        symbols[head] = symbols.get(head, 0) & ~7
    assert return_steps == n and scan_steps == m and 0 <= value < 5
    return dict(bits=bits_of(original), expected=bits_of(symbols), head=13 * head,
                value=value, steps=37 * n + 26 + 23 * m + (34 if empty else 61),
                source_steps=n + m + 3)


def replay(machine, case, value, entry=None, collect=False):
    tape = case['bits'].copy()
    state = machine['entries'][value] if entry is None else entry
    head = 0
    for tick in range(case['steps'] + 1):
        if collect:
            visited.add(state)
        instruction = machine['rows'][state][tape.get(head, 0)]
        if instruction is None:
            assert tick == case['steps'], ('premature/late exit', tick, case['steps'], state)
            assert machine['ports'][state] == case['value'], ('store', state, case['value'])
            assert state == 404 + 5 * case['value'], ('successor', state)
            assert head == case['head'], ('head', head, case['head'])
            assert tape == case['expected'], 'tape/frame mismatch'
            return
        assert tick < case['steps'], ('no return', state)
        write, direction, state = instruction
        if write:
            tape[head] = write
        else:
            tape.pop(head, None)
        head += direction
    raise AssertionError('Missing final port')


assert data['states'] == len(data['rows']) == len(data['ports']) == 425
for row in data['rows']:
    assert len(row) == 2
    for instruction in row:
        if instruction is not None:
            w, d, q = instruction
            assert w in [0, 1] and d in [-1, 1] and 0 <= q < 425
source_cases = 0
for seed in range(625):
    for n in [0, 1, 7]:
        for m in [0, 1, 2, 7, 31]:
            case = source_case(seed, n, m)
            for store in range(5):
                replay(data, case, store, collect=True)
                source_cases += 1
# Arbitrary raw cells exercise unused bit codes without treating them as source symbols.
raw_cases = 0
for raw in range(8192):
    bits = {}
    put_cell(bits, -1, (raw & ~7) | 4)
    put_cell(bits, 0, raw)
    put_cell(bits, 1, (raw & ~4103))  # unmarked absent next cell
    before = bits.copy()
    if raw & 7:
        value = (raw & 7) if (raw & 7) < 5 else 0
        expected = bits.copy()
        for j in range(3):
            expected.pop(j, None)
        case = dict(bits=before, expected=expected, value=value, head=0, steps=84)
    elif raw & 4096:
        case = dict(bits=before, expected=bits, value=0, head=0, steps=34)
    else:
        expected = bits.copy()
        for j in range(3):
            expected.pop(-13 + j, None)
        case = dict(bits=before, expected=expected, value=4, head=-13, steps=61)
    replay(data, case, 0, entry=data['scan_entry'], collect=True)
    raw_cases += 1
# General valid symbol tapes may have an unmarked gap with an absent previous coordinate.
gap_cases = 0
for value in range(5):
    bits = {}
    put_cell(bits, -1, (1 << 12) | value | (3 << 3) | (4 << 6) | (2 << 9))
    put_cell(bits, 0, (2 << 3) | (1 << 6) | (4 << 9))
    expected = bits.copy()
    for j in range(3):
        expected.pop(-13 + j, None)
    case = dict(bits=bits, expected=expected, value=value, head=-13, steps=61)
    replay(data, case, 0, entry=data['scan_entry'], collect=True)
    gap_cases += 1
assert visited == set(range(425)), ('unvisited controls', sorted(set(range(425)) - visited))


def stop_old_port(m):
    m['rows'][48] = [None, None]


def wrong_write(m):
    m['rows'][420][0][0] = 1


def wrong_return(m):
    for bit in range(2):
        m['rows'][36][bit][2] = 48


mutations = [
    ('former-return-port-stops', stop_old_port, 0),
    ('normal-dispatch-alignment', lambda m: m['rows'][245][0].__setitem__(1, 1), 0),
    ('gap-dispatch', lambda m: m['rows'][285][0].__setitem__(2, 287), 0),
    ('marker-dispatch', lambda m: m['rows'][339][0].__setitem__(2, 404), 0),
    ('loaded-store-gate', lambda m: m['rows'][399][0].__setitem__(2, 400), 0),
    ('main-field-clear', wrong_write, 0),
    ('successor-store-port', lambda m: m['ports'].__setitem__(424, 0), 0),
    ('scan-loop-head', lambda m: m['rows'][301][0].__setitem__(1, 1), 0),
    ('return-prefix-loop', wrong_return, 1),
]
controls = []
for name, mutate, n in mutations:
    broken = copy.deepcopy(data)
    mutate(broken)
    try:
        replay(broken, source_case(0, n, 1, top=4), 0)
    except AssertionError:
        controls.append(dict(name=name, rejected=True))
    else:
        raise AssertionError('Accepted corruption: ' + name)
report = dict(status='passed', composed_source_cases=source_cases, raw_pop_cases=raw_cases,
              arbitrary_valid_gap_cases=gap_cases,
              binary_machine_cases=source_cases + raw_cases + gap_cases,
              source_pattern_seeds=625, raw_cell_patterns=8192, store_values=5,
              return_distances=[0, 1, 7], scan_distances=[0, 1, 2, 7, 31],
              visited_controls=len(visited), corruption_controls=controls,
              source_oracle='return + normal2 + main-pop + ret s003',
              raw_invalid_codes_are_source_evidence=False)
(WORK / 'fixtures-detail.json').write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps(report))
print('Field continuation independent fixtures passed')
