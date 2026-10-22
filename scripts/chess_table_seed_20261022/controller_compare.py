#!/usr/bin/env python3
"""Remote exact actual-Lean/pinned-pilot controller correspondence, not a proof of expansion."""
import os
if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required')

import copy
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / '.lake/chess-table-proof-20261022'
PILOT = ROOT / 'docs/chess/campaign-2026-10-22/round-04/evidence/controller-01/unpacked/controller.json'
PILOT_SHA256 = 'c812768bac296d8520f64b7df4a33de47e7c067c79594bef48e7b536e359e09f'
STATES = 21682
DONE = 21680
ERROR = 21681
SCOPE = 'Complete actual Lean controller table; universal expansion is separate'


def require(condition, message):
    if not condition:
        raise AssertionError(message)


def sha(data):
    return hashlib.sha256(data).hexdigest()


def no_duplicates(pairs):
    result = {}
    for key, value in pairs:
        require(key not in result, ('Duplicate JSON object key', key))
        result[key] = value
    return result


def read_json(raw):
    return json.loads(raw, object_pairs_hook=no_duplicates)


def transition(row, states):
    if row is None:
        return
    require(type(row) is list and len(row) == 3, 'Transition triple required')
    write, direction, target = row
    require(type(write) is int and write in (0, 1), 'Binary write required')
    require(type(direction) is int and direction in (-1, 1), 'Unit direction required')
    require(type(target) is int and 0 <= target < states, 'Destination outside paid controls')


def validate_pilot(pilot):
    require(type(pilot) is dict and set(pilot) ==
            {'schema', 'status', 'states', 'entry', 'done', 'error', 'names', 'rows', 'blocks'},
            'Pinned pilot exact header inventory')
    require(pilot['schema'] == 'chess-table-seed-direct-binary-v1' and
            pilot['status'] == 'FINITE_UNVERIFIED_CONTROLLER', 'Pinned pilot schema/scope')
    require(type(pilot['states']) is int and pilot['states'] == STATES, 'Pinned pilot state count')
    for key, expected in [('entry', 0), ('done', DONE), ('error', ERROR)]:
        require(type(pilot[key]) is int and pilot[key] == expected, ('Pinned pilot control', key))
    names, rows = pilot['names'], pilot['rows']
    require(type(names) is list and len(names) == STATES and all(type(n) is str for n in names)
            and len(set(names)) == STATES, 'Pilot unique complete control names')
    require(names[0] == 'entry.00' and names[DONE] == 'done' and names[ERROR] == 'error',
            'Pilot distinguished control names')
    require(type(rows) is list and len(rows) == STATES, 'Pilot all state pairs required')
    missing = []
    for state, pair in enumerate(rows):
        require(type(pair) is list and len(pair) == 2, 'Pilot both symbol rows required')
        for bit, row in enumerate(pair):
            transition(row, STATES)
            if row is None:
                missing.append((state, bit))
    require(missing == [(DONE, 0), (DONE, 1)], 'Pilot unique terminal control')
    require(rows[ERROR] == [[0, 1, ERROR], [1, 1, ERROR]], 'Pilot paid preserving error loop')
    cursor, block_names = 0, set()
    require(type(pilot['blocks']) is list, 'Pilot block inventory')
    for block in pilot['blocks']:
        require(type(block['entry']) is int and block['entry'] == cursor,
                'Pilot contiguous block order')
        require(type(block['states']) is int and block['states'] > 0, 'Pilot paid block count')
        require(block['name'] not in block_names, 'Pilot duplicate block')
        block_names.add(block['name'])
        next_cursor = cursor + block['states']
        require(block['state_names'] == names[cursor:next_cursor], 'Pilot block allocation names')
        cursor = next_cursor
    require(cursor == STATES, 'Pilot uncovered allocated controls')
    return dict(states=STATES, rows=2 * STATES, blocks=len(block_names), missing_rows=2,
                entry=0, done=DONE, error=ERROR, all_states_paid=True)


def compare(actual, pilot):
    expected = dict(schema='chess-table-seed-lean-controller-v1', states=STATES,
                    allocated_states=STATES, entry=0, done=DONE, error=ERROR,
                    rows_count=2 * STATES, missing_rows=2,
                    order='state-major,bit-0-before-1', actual_numeric_rows_equal=True,
                    scope=SCOPE)
    require(type(actual) is dict and set(actual) == set(expected) | {'rows'},
            'Actual controller exact header inventory')
    for key, value in expected.items():
        require(type(actual[key]) is type(value) and actual[key] == value,
                ('Actual controller header mismatch', key))
    records = actual['rows']
    require(type(records) is list and len(records) == 2 * STATES,
            'Actual controller complete row count')
    missing = []
    for index, record in enumerate(records):
        require(type(record) is list and len(record) == 3, 'Explicit state/bit/row required')
        state, bit, row = record
        wanted_state, wanted_bit = divmod(index, 2)
        require(type(state) is int and type(bit) is int and
                state == wanted_state and bit == wanted_bit,
                ('Actual row order/uniqueness mismatch', index))
        transition(row, STATES)
        require(row == pilot['rows'][state][bit], ('Actual/pilot row mismatch', state, bit))
        if row is None:
            missing.append((state, bit))
    require(missing == [(DONE, 0), (DONE, 1)], 'Actual unique terminal control')
    return dict(states=STATES, rows=2 * STATES, missing_rows=len(missing),
                all_rows_equal=True, unique_state_symbol_order=True,
                entry=0, done=DONE, error=ERROR)


def rejection(name, operation):
    try:
        operation()
    except AssertionError as error:
        return dict(name=name, rejected=True, reason=str(error))
    raise AssertionError(('Deliberate controller corruption accepted', name))


def negative_controls(actual, pilot):
    controls = []

    def mutation(name, change):
        candidate = copy.deepcopy(actual)
        change(candidate)
        controls.append(rejection(name, lambda: compare(candidate, pilot)))

    for key, value in [('states', STATES - 1), ('allocated_states', STATES - 1),
                       ('rows_count', 2 * STATES - 1), ('entry', 1), ('done', ERROR),
                       ('error', DONE), ('missing_rows', 1), ('entry', False),
                       ('actual_numeric_rows_equal', 1)]:
        label = key + ('_type' if type(value) is bool or key == 'actual_numeric_rows_equal' else '')
        mutation('header_' + label, lambda candidate, k=key, v=value: candidate.__setitem__(k, v))
    mutation('truncated_row', lambda candidate: candidate['rows'].pop())
    mutation('extra_row', lambda candidate: candidate['rows'].append(candidate['rows'][-1]))
    mutation('duplicate_row', lambda candidate: candidate['rows'].__setitem__(1, candidate['rows'][0]))
    mutation('wrong_state_id', lambda candidate: candidate['rows'][0].__setitem__(0, 1))
    mutation('wrong_bit_id', lambda candidate: candidate['rows'][0].__setitem__(1, 1))
    mutation('boolean_state_id', lambda candidate: candidate['rows'][0].__setitem__(0, False))
    mutation('write_bit', lambda candidate: candidate['rows'][0][2].__setitem__(0, 1))
    mutation('direction', lambda candidate: candidate['rows'][0][2].__setitem__(1, -1))
    mutation('destination', lambda candidate: candidate['rows'][0][2].__setitem__(2, 2))
    mutation('unpaid_destination', lambda candidate: candidate['rows'][0][2].__setitem__(2, STATES))
    mutation('nonbinary_write', lambda candidate: candidate['rows'][0][2].__setitem__(0, 2))
    mutation('boolean_write', lambda candidate: candidate['rows'][0][2].__setitem__(0, False))
    mutation('stay_move', lambda candidate: candidate['rows'][0][2].__setitem__(1, 0))
    mutation('early_halt', lambda candidate: candidate['rows'][0].__setitem__(2, None))
    mutation('done_has_transition', lambda candidate:
             candidate['rows'][2 * DONE].__setitem__(2, [0, 1, DONE]))
    mutation('error_accidental_halt', lambda candidate:
             candidate['rows'][2 * ERROR].__setitem__(2, None))
    mutation('error_wrong_direction', lambda candidate:
             candidate['rows'][2 * ERROR + 1][2].__setitem__(1, -1))
    mutation('wrong_scope', lambda candidate: candidate.__setitem__('scope', 'universal proof'))
    controls.append(rejection('duplicate_json_key', lambda: read_json('{"states":1,"states":2}')))
    require(len({control['name'] for control in controls}) == len(controls), 'Duplicate control names')
    return controls


def main():
    raw_pilot = PILOT.read_bytes()
    require(sha(raw_pilot) == PILOT_SHA256, 'Pinned pilot controller byte digest differs')
    pilot = read_json(raw_pilot)
    allocation = validate_pilot(pilot)
    actual_path = WORK / 'controller-lean.json'
    raw_actual = actual_path.read_bytes()
    actual = read_json(raw_actual)
    comparison = compare(actual, pilot)
    controls = negative_controls(actual, pilot)
    report = dict(status='passed', complete_row_equality=True,
                  classification='FINITE_EXACT_CONTROLLER_CORRESPONDENCE_ONLY',
                  universal_proof=False, new_accepted_machine=False,
                  actual_sha256=sha(raw_actual), pilot_sha256=sha(raw_pilot),
                  pilot_file=str(PILOT.relative_to(ROOT)), actual_file=actual_path.name,
                  allocation=allocation, comparison=comparison,
                  positive_controls_ran_first=True, negative_controls=controls,
                  negative_control_count=len(controls), all_negative_controls_rejected=True,
                  source_sha256={
                      str(Path(__file__).relative_to(ROOT)): sha(Path(__file__).read_bytes()),
                      'scripts/chess_table_seed_20261022/ControllerExport.lean':
                          sha((ROOT / 'scripts/chess_table_seed_20261022/ControllerExport.lean').read_bytes()),
                      'Cryptids/Compilation/TableSeed/Controller.lean':
                          sha((ROOT / 'Cryptids/Compilation/TableSeed/Controller.lean').read_bytes())},
                  scope='Every actual Lean row agrees with the exact retained pilot; no universal run claim')
    (WORK / 'controller-compare.json').write_text(json.dumps(report, indent=2) + '\n')
    print('Table seed actual controller comparison passed')


if __name__ == '__main__':
    main()
