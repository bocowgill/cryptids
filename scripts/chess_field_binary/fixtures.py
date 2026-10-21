"""Remote-only independent sparse-tape replay of the actual emitted transition rows."""
import copy
import json
import os
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / '.lake/chess-field-binary'


def run(table, initial, budget=128):
    tape, head, state = dict(initial), 0, 0
    for steps in range(budget):
        row = table['rows'][state][tape.get(head, 0)]
        if row is None:
            result = table['exits'][state]
            assert result is not None, 'unexpected missing internal transition'
            return result, tape, head, steps
        bit, direction, state = row
        if bit:
            tape[head] = bit
        else:
            tape.pop(head, None)
        head += direction
    raise AssertionError('routine did not terminate within the explicit budget')


def initial_tape(pattern):
    # Nonblank neighbours on both sides, independently varied by the tested word.
    tape = {i: 1 for i in range(-19, 33) if ((i * 17 + pattern * 13) % 11) < 5}
    for i in range(13):
        if (pattern >> i) & 1:
            tape[i] = 1
        else:
            tape.pop(i, None)
    return tape


def check_case(table, pattern):
    before = initial_tape(pattern)
    value, after, head, steps = run(table, before)
    kind, offset = table['kind'], table['offset']
    expected_tape = dict(before)
    if kind == 'read':
        expected_value = (pattern >> offset) & 7
        expected_head, expected_steps = 0, 2 * offset + 6
    elif kind == 'write':
        for i in range(3):
            if (table['value'] >> i) & 1:
                expected_tape[offset + i] = 1
            else:
                expected_tape.pop(offset + i, None)
        expected_value, expected_head, expected_steps = 0, 0, 2 * offset + 4
    else:
        assert kind in ('move_left', 'move_right')
        expected_value, expected_steps = 0, 13
        expected_head = 13 if kind == 'move_right' else -13
    assert value == expected_value, ('result', kind, pattern, value, expected_value)
    assert head == expected_head, ('alignment', kind, pattern, head, expected_head)
    assert after == expected_tape, ('frame/write', kind, pattern)
    assert steps == expected_steps, ('steps', kind, pattern, steps, expected_steps)


def validate_table(table):
    states, rows, exits = table['states'], table['rows'], table['exits']
    assert states == len(rows) == len(exits)
    offset, kind = table['offset'], table['kind']
    expected = 9 * offset + 39 if kind == 'read' else 2 * offset + 5 if kind == 'write' else 14
    assert states == expected
    for source, (pair, exit_value) in enumerate(zip(rows, exits)):
        assert len(pair) == 2
        assert all(row is None for row in pair) == (exit_value is not None)
        for row in pair:
            if row is None:
                continue
            bit, direction, dest = row
            assert bit in (0, 1) and direction in (-1, 1)
            assert source < dest < states, 'finite routine edges must descend in remaining syntax'


def controls(data):
    reports = []
    def reject(name, mutate, structural=False):
        table = copy.deepcopy(data['routines'][0])
        mutate(table)
        try:
            if structural:
                validate_table(table)
            else:
                for pattern in list(range(64)) + [8191]:
                    check_case(table, pattern)
        except (AssertionError, IndexError, TypeError) as exc:
            reports.append({'name': name, 'rejected': True, 'reason': str(exc)})
            return
        raise AssertionError('control escaped rejection: ' + name)
    reject('wrong state charge', lambda t: t.update(states=t['states'] - 1), True)
    reject('wrong read result', lambda t: t['exits'].__setitem__(t['exits'].index(0), 1))
    reject('wrong head movement', lambda t: t['rows'][0][0].__setitem__(1, -1))
    reject('surrounding tape corruption', lambda t: t['rows'][0][0].__setitem__(0, 1))
    reject('premature missing transition', lambda t: t['rows'][0].__setitem__(0, None))
    reject('cycle', lambda t: t['rows'][0][0].__setitem__(2, 0), True)
    return reports


def main():
    assert os.environ.get('CHESS_REMOTE') == '1', 'Fixtures are remote-only'
    data = json.loads((WORK / 'routines.json').read_text())
    assert len(data['routines']) == 38
    assert data['codec'] == [[i, i if i < 5 else 0] for i in range(8)]
    assert data['legacy_allocation_marginals'] == [211410, 82000, 110]
    reports, cases = [], 0
    for table in data['routines']:
        validate_table(table)
        for pattern in range(8192):
            check_case(table, pattern)
            cases += 1
        reports.append({'kind': table['kind'], 'offset': table['offset'],
                        'value': table['value'], 'states': table['states'],
                        'raw_cell_patterns': 8192})
    rejected = controls(data)
    valid = sum(all(((word >> (3 * field)) & 7) < 5 for field in range(4)) for word in range(8192))
    assert valid == 1250
    record = {'status': 'passed', 'routines': reports, 'binary_machine_cases': cases,
              'raw_cell_patterns': 8192, 'valid_encoded_cells': valid,
              'raw_invalid_cells_exercised': 8192 - valid, 'negative_controls': rejected,
              'universal_proof': False, 'surroundings': 'nonblank left and right contexts; full sparse-tape equality'}
    (WORK / 'fixtures-detail.json').write_text(json.dumps(record, indent=2) + '\n')
    print('Field binary independent fixtures passed:', cases, 'machine cases;', len(rejected), 'rejected controls')

if __name__ == '__main__':
    main()
