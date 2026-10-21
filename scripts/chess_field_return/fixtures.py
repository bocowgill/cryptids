#!/usr/bin/env python3
"""Independent, remote-only simulation of the native-exported return machine."""
import copy
import json
import os
from pathlib import Path
assert os.environ.get('CHESS_REMOTE') == '1', 'Machine execution is remote-only'
ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / '.lake/chess-field-return'
data = json.loads((WORK / 'machine.json').read_text())


def validate(machine):
    assert machine['states'] == len(machine['rows']) == len(machine['ports'])
    for row in machine['rows']:
        assert len(row) == 2
        for instruction in row:
            if instruction is not None:
                w, direction, target = instruction
                assert w in [0, 1] and direction in [-1, 1]
                assert 0 <= target < machine['states']


def cell(tape, position, raw):
    for j in range(13):
        if (raw >> j) & 1:
            tape[position * 13 + j] = 1
        else:
            tape.pop(position * 13 + j, None)


def tape_for(raw, n):
    tape = {}
    # Distinct nonblank neighbours and extra markers behind the first target.
    for p in range(-n - 3, 4):
        pattern = (raw * 73 + (p + n + 5) * 541) % 8192
        cell(tape, p, pattern)
    cell(tape, 0, raw)
    for p in range(-1, -n, -1):
        tape.pop(13 * p + 12, None)
    if n:
        tape.pop(12, None)
    tape[12 - 13 * n] = 1
    return tape


visited = set()


def check(machine, raw, n, value, collect=False):
    original = tape_for(raw, n)
    tape = original.copy()
    state = machine['entries'][value]
    head = 0
    limit = 37 * n + 24
    for tick in range(limit + 1):
        if collect:
            visited.add(state)
        instruction = machine['rows'][state][tape.get(head, 0)]
        if instruction is None:
            assert tick == limit, ('steps', raw, n, value, tick)
            assert head == -13 * n, ('alignment', raw, n, value, head)
            assert tape == original, ('tape changed', raw, n, value)
            assert machine['ports'][state] == value, ('store/port', raw, n, value, state)
            assert state == 49 * value + 48, ('continuation', state)
            return
        assert tick < limit, ('did not return', raw, n, value)
        write, direction, state = instruction
        if write:
            tape[head] = write
        else:
            tape.pop(head, None)
        head += direction
    raise AssertionError('No return')


validate(data)
cases = 0
for raw in range(8192):
    n = 0 if raw & 4096 else 1
    for value in range(5):
        check(data, raw, n, value, True)
        cases += 1
# Valid source cells, independently decoded; repeated returns and every stack coordinate.
valid_cells = 0
for raw in range(4096):
    if all(((raw >> (3 * i)) & 7) < 5 for i in range(4)):
        valid_cells += 1
        for n in [2, 3, 7, 31, 64]:
            for value in range(5):
                check(data, raw, n, value, True)
                cases += 1
assert valid_cells == 625
assert visited == set(range(data['states'])), ('unexercised controls', sorted(set(range(245))-visited))
controls = []
for name, mutate, raw, n, value in [
    ('write-preservation', lambda m: m['rows'][0][0].__setitem__(0, 1), 0, 1, 0),
    ('marker-dispatch', lambda m: m['rows'][12][0].__setitem__(2, 37), 0, 1, 0),
    ('store-dispatch', lambda m: m['entries'].__setitem__(1, 0), 4096, 0, 1),
    ('loop-return', lambda m: m['rows'][36][0].__setitem__(2, 48), 0, 1, 0),
    ('continuation-port', lambda m: m['ports'].__setitem__(48, 1), 4096, 0, 0),
    ('uncharged-early-exit', lambda m: m['rows'].__setitem__(47, [None, None]), 4096, 0, 0),
]:
    broken = copy.deepcopy(data)
    mutate(broken)
    try:
        check(broken, raw, n, value)
    except AssertionError:
        controls.append({'name': name, 'rejected': True})
    else:
        raise AssertionError('Accepted corruption: ' + name)
report = {'status': 'passed', 'binary_machine_cases': cases, 'raw_cell_patterns': 8192,
          'valid_unmarked_cell_patterns': valid_cells, 'store_values': 5,
          'return_distances': [0, 1, 2, 3, 7, 31, 64], 'visited_controls': len(visited),
          'corruption_controls': controls}
(WORK / 'fixtures-detail.json').write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps(report))
print('Field return independent fixtures passed')
