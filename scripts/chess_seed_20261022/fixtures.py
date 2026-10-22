#!/usr/bin/env python3
"""Remote independent checks of all paid rows and bounded complete startup paths.

The full chess expander is never simulated. Its full seed is checked statically;
the universal Lean theorem supplies termination and exact tape identity.
"""
import os
if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required')

import copy
import hashlib
import importlib.util
import itertools
import json
import struct
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / '.lake/chess-seed-20261022'
ACCEPTED = ROOT / 'docs/chess/campaign-2026-10-22/round-01/evidence/final/unpacked'
PILOT = ROOT / 'docs/chess/campaign-2026-10-22/round-02/evidence/pilot-02/unpacked'
SOURCE_SHA = '592ea3c892d0e9d5a6db6ce31e3f590bde7973774bdc9a70cfe46cb6996cd39e'
BODY_SHA = 'd2afbf1c0abe1afb0008029680c5bc52b41f2dc21718a88d16b7aecd06becb0a'
RECORD = struct.Struct('<BBI')
STATES = 998176
WRITER = 424157
CONTROLLER = 216
BODY_ENTRY = 424374
BODY_STATES = 573802
OLD_BODY_ENTRY = 1837941


def require(condition, message):
    if not condition:
        raise AssertionError(message)


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def file_sha(path):
    h = hashlib.sha256()
    with path.open('rb') as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b''):
            h.update(block)
    return h.hexdigest()


def load_pilot():
    spec = importlib.util.spec_from_file_location('seed_finite_oracle',
                                               ROOT / 'scripts/chess_seed_20261022/pilot.py')
    pilot = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(pilot)
    return pilot


def seed_for(symbols):
    # Arithmetic encoding, separate from both the Lean finite-word function and
    # the pilot's literal code table.
    return '0111100011110' + ''.join(str((value >> bit) & 1)
                                    for value in symbols for bit in range(3)) + '000'


def output_for(symbols):
    result = []
    for index, value in enumerate(list(reversed(symbols)) or [0]):
        result.extend(str((value >> bit) & 1) for bit in range(3))
        result.extend('0' * 9)
        result.append('1' if index == 0 else '0')
    return ''.join(result)


def static_input(payload):
    source_path = ACCEPTED / 'machine-export.json'
    require(file_sha(source_path) == SOURCE_SHA, 'Accepted native source bytes changed')
    source = json.loads(source_path.read_text())
    require(source['schema'] == 'chess-field-selective-v1', 'Accepted source schema')
    cells = source['source_cells']
    require(len(cells) == 5 * 141380, 'Complete source cell count')
    reversed_symbols = []
    for index in range(141380):
        marker, main, a, b, c = cells[5 * index:5 * index + 5]
        require(marker == ('1' if index == 0 else '0'), 'Source marker placement')
        require(main in '1234' and a == b == c == '0', 'Source main-stack alphabet')
        reversed_symbols.append(int(main))
    symbols = list(reversed(reversed_symbols))
    expected_seed = seed_for(symbols)
    require(payload['seed'] == expected_seed, 'Actual full seed differs from frozen source')
    require(len(expected_seed) == 424156, 'Actual full seed size')
    require(output_for(symbols) == source['bits'], 'Complete static expanded tape identity')
    require(len(source['bits']) == 1837940, 'Complete frozen target bit count')
    require(payload['full_quadratic_startup_executed'] is False, 'Forbidden startup claim')
    return expected_seed, symbols[-1], {
        'source_sha256': SOURCE_SHA, 'symbols': len(symbols),
        'seed_sha256': sha(expected_seed.encode()),
        'target_sha256': sha(source['bits'].encode()),
        'full_static_input_equal': True, 'full_quadratic_startup_executed': False}


def check_metadata(meta, seed):
    expected = dict(machine_states=STATES, row_machine_states=STATES,
                    generated_states=STATES, seed_bits=len(seed), writer_states=WRITER,
                    controller_states=CONTROLLER, bridge_states=1, linked_states=574019,
                    body_states=BODY_STATES, controller_entry=WRITER,
                    controller_done=WRITER + 214, bridge_entry=WRITER + CONTROLLER,
                    body_entry=BODY_ENTRY, previous_states=2411743)
    require(meta == expected and all(type(meta[key]) is type(value)
                                    for key, value in expected.items()),
            ('Full paid allocation mismatch', meta, expected))
    require(WRITER + CONTROLLER + 1 + BODY_STATES == STATES, 'Unpaid state region')


def pack(row, target_bound):
    if row is None:
        return RECORD.pack(2, 0, 0)
    require(isinstance(row, list) and len(row) == 3, 'Row shape')
    write, direction, next_state = row
    require(type(write) is int and write in (0, 1), 'Binary write')
    require(type(direction) is int and direction in (-1, 1), 'Unit movement')
    require(type(next_state) is int and 0 <= next_state < target_bound, 'Paid destination')
    return RECORD.pack(write, int(direction == 1), next_state)


def composed_rows(seed, controller, body_rows):
    """Independent ordinary row assembly, used for full table and toy fixtures."""
    prefix = len(seed) + 1
    body_entry = prefix + len(controller) + 1
    for state, bit_value in enumerate(reversed(seed)):
        row = [int(bit_value), -1, state + 1]
        yield row
        yield row
    for bit in (0, 1):
        yield [bit, 1, prefix]
    for state, pair in enumerate(controller):
        require(len(pair) == 2, 'Controller pair missing')
        for bit, row in enumerate(pair):
            if state == 214:
                yield [bit, 1, prefix + len(controller)]
            elif row is None:
                yield None
            else:
                yield [row[0], row[1], prefix + row[2]]
    for bit in (0, 1):
        yield [bit, -1, body_entry]
    for row in body_rows:
        yield None if row is None else [row[0], row[1], body_entry + row[2]]


def accepted_body():
    path = ACCEPTED / 'body-rows.jsonl'
    require(file_sha(path) == BODY_SHA, 'Accepted complete body rows changed')
    count = 0
    with path.open() as stream:
        for index, line in enumerate(stream):
            state, bit, row = json.loads(line)
            expected_state, expected_bit = divmod(index, 2)
            require(expected_state < BODY_STATES and state == OLD_BODY_ENTRY + expected_state
                    and bit == expected_bit, 'Accepted body row order/count')
            if row is not None:
                row = [row[0], row[1], row[2] - OLD_BODY_ENTRY]
                pack(row, BODY_STATES)
            count += 1
            yield row
    require(count == 2 * BODY_STATES, 'Accepted body rows truncated')


def expected_full(seed, controller):
    result = bytearray()
    for row in composed_rows(seed, controller, accepted_body()):
        result.extend(pack(row, STATES))
    require(len(result) == 2 * STATES * RECORD.size, 'Independent full table census')
    return result


def check_full_rows(raw, expected, meta):
    require(raw == expected, 'Actual complete rows differ from independent reconstruction')
    require(len(raw) == 2 * STATES * RECORD.size, 'Complete full row length')
    missing = 0
    for index, (write, direction, target) in enumerate(RECORD.iter_unpack(raw)):
        if write == 2:
            require(direction == target == 0, ('Noncanonical missing row', index))
            missing += 1
        else:
            require(write in (0, 1) and direction in (0, 1) and target < STATES,
                    ('Invalid paid full row', index))
    expected_meta = dict(filename='full-rows.bin', format='<BBI', record_bytes=6,
                         states=STATES, rows=2 * STATES, bytes=len(raw), missing_rows=missing,
                         missing_encoding=[2, 0, 0], direction_left=0, direction_right=1,
                         order='state-major,bit-0-before-1', native_machine_rowMachine_equal=True)
    require(meta == expected_meta and all(type(meta[key]) is type(value)
                                         for key, value in expected_meta.items()),
            'Full stream metadata mismatch')
    return {'rows': 2 * STATES, 'missing_rows': missing, 'sha256': sha(raw),
            'source_body_sha256': BODY_SHA, 'independent_complete_equality': True}


def full_writer(raw, seed, native):
    ones, head, state = set(), 0, 0
    for _ in range(len(seed) + 1):
        bit = int(head in ones)
        write, direction, state = RECORD.unpack_from(raw, (2 * state + bit) * RECORD.size)
        require(write < 2, 'Writer unexpectedly halted')
        if write:
            ones.add(head)
        else:
            ones.discard(head)
        head += 1 if direction else -1
    expected_head = 1 - len(seed)
    expected_ones = {expected_head + index for index, bit in enumerate(seed) if bit == '1'}
    require(state == WRITER and head == expected_head and ones == expected_ones,
            'Independent actual full writer endpoint mismatch')
    require(native == dict(steps=WRITER, state=WRITER, head=expected_head, tape=seed,
                           normalized_head=0, frame_min=-len(seed), frame_max=1,
                           both_exteriors_zero=True, actual_and_numeric_replayed=True),
            'Native writer receipt mismatch')
    return {'steps': WRITER, 'head': head, 'state': state,
            'complete_support_equal': True, 'both_exteriors_zero': True}


def simulate(rows, max_steps):
    ones, state, head = set(), 0, 0
    low = high = 0
    for steps in range(max_steps + 1):
        require(0 <= state < len(rows), 'Fixture control out of range')
        row = rows[state][int(head in ones)]
        if row is None:
            return dict(state=state, head=head, steps=steps, support=sorted(ones),
                        visited_min=low, visited_max=high)
        require(steps < max_steps, 'Fixture exceeded exact certified runtime')
        write, direction, state = row
        if write:
            ones.add(head)
        else:
            ones.discard(head)
        head += direction
        low, high = min(low, head), max(high, head)
    raise AssertionError('Unreachable simulation exit')


def check_fixture(case, controller):
    symbols = case['symbols']
    require(len(symbols) <= 8 and all(type(s) is int and 1 <= s <= 4 for s in symbols),
            'Bounded fixture alphabet')
    seed = seed_for(symbols)
    flat = list(composed_rows(seed, controller, [None, None]))
    rows = [flat[i:i + 2] for i in range(0, len(flat), 2)]
    require(case['seed'] == seed and case['rows'] == rows, 'Actual small construction rows')
    count = len(rows)
    require(case['states'] == count == 235 + 3 * len(symbols), 'Small paid count')
    for pair in rows:
        for row in pair:
            pack(row, count)
    steps = 16 * len(symbols) ** 2 + 86 * len(symbols) + 81
    actual = simulate(case['rows'], steps)
    expected_head = -9 - 16 * len(symbols)
    output = output_for(symbols)
    support = [expected_head + index for index, bit in enumerate(output) if bit == '1']
    require(actual['steps'] == steps and actual['state'] == count - 1
            and actual['head'] == expected_head and actual['support'] == support,
            'Actual composed blank startup mismatch')
    require(case['body_entry'] == count - 1 and case['output'] == output,
            'Native output/body metadata mismatch')
    for key, value in actual.items():
        require(case[key] == value, ('Native/Python execution mismatch', key))
    radius = 128 + 32 * len(symbols)
    require(case['frame_min'] == -radius and case['frame_max'] == radius
            and actual['visited_min'] >= -radius and actual['visited_max'] <= radius,
            'Visited finite frame/exterior mismatch')
    require(case['both_exteriors_zero'] is True and case['actual_native_executed'] is True,
            'Native execution scope')
    return dict(symbols=symbols, states=count, **actual, both_exteriors_zero=True)


def rejection(name, fn, **detail):
    try:
        fn()
    except AssertionError as error:
        return dict(name=name, rejected=True, reason=str(error), **detail)
    raise AssertionError(('Deliberate corruption accepted', name))


def negatives(payload, raw, expected, seed, controller):
    results = []

    def changed_row(name, state, bit, replacement):
        changed = bytearray(raw)
        offset = RECORD.size * (2 * state + bit)
        changed[offset:offset + RECORD.size] = RECORD.pack(*replacement)
        results.append(rejection(name, lambda: check_full_rows(changed, expected, payload['full_rows']),
                                 state=state, bit=bit, replacement=list(replacement)))

    first = RECORD.unpack_from(raw, 0)
    changed_row('writer_bit', 0, 0, (1 - first[0], first[1], first[2]))
    changed_row('writer_direction', 0, 1, (first[0], 1, first[2]))
    changed_row('final_turn', WRITER - 1, 1, (1, 0, WRITER))
    changed_row('controller_entry', WRITER, 0, (0, 0, WRITER + 1))
    changed_row('success_unpatched', WRITER + 214, 0, (2, 0, 0))
    changed_row('success_wrong_bit', WRITER + 214, 1, (0, 1, WRITER + 216))
    changed_row('bridge_direction', WRITER + 216, 0, (0, 1, BODY_ENTRY))
    changed_row('bridge_destination', WRITER + 216, 1, (1, 0, BODY_ENTRY + 1))
    first_body = RECORD.unpack_from(raw, RECORD.size * 2 * BODY_ENTRY)
    require(first_body[0] < 2, 'Positive first body control')
    changed_row('body_write', BODY_ENTRY, 0,
                (1 - first_body[0], first_body[1], first_body[2]))
    changed_row('body_destination', BODY_ENTRY, 0,
                (first_body[0], first_body[1], STATES))
    halt_index = next(index for index, row in enumerate(RECORD.iter_unpack(raw)) if row[0] == 2)
    halt_state, halt_bit = divmod(halt_index, 2)
    changed_row('body_halt_removed', halt_state, halt_bit, (halt_bit, 1, halt_state))
    changed_row('noncanonical_halt', halt_state, halt_bit, (2, 1, 0))
    results.append(rejection('full_truncation', lambda: check_full_rows(raw[:-6], expected,
                                                                      payload['full_rows'])))
    results.append(rejection('full_extra_row', lambda: check_full_rows(raw + raw[:6], expected,
                                                                     payload['full_rows'])))
    changed_meta = dict(payload['metadata'], machine_states=STATES - 1)
    results.append(rejection('unpaid_state', lambda: check_metadata(changed_meta, seed)))
    changed = copy.deepcopy(payload['writer'])
    changed['head'] += 1
    results.append(rejection('writer_physical_head', lambda: full_writer(raw, seed, changed)))
    fixture = copy.deepcopy(payload['complete_startup_fixtures'][0])
    fixture['support'].append(1000000)
    results.append(rejection('fixture_far_exterior', lambda: check_fixture(fixture, controller)))
    fixture = copy.deepcopy(payload['complete_startup_fixtures'][0])
    fixture['steps'] += 1
    results.append(rejection('fixture_runtime', lambda: check_fixture(fixture, controller)))
    fixture = copy.deepcopy(payload['complete_startup_fixtures'][0])
    fixture['rows'][len(fixture['seed']) + 1 + 216][0][1] = 1
    results.append(rejection('fixture_paid_bridge', lambda: check_fixture(fixture, controller)))
    changed = dict(payload, seed='1' + payload['seed'][1:])
    results.append(rejection('full_seed_changed', lambda: static_input(changed)))
    return results


def main():
    payload_path = WORK / 'machine-export.json'
    payload = json.loads(payload_path.read_text())
    require(payload['schema'] == 'chess-seed-complete-v1', 'Actual full export schema')
    seed, final_symbol, static = static_input(payload)
    check_metadata(payload['metadata'], seed)
    pilot = load_pilot()
    retained = json.loads((PILOT / 'controller.json').read_text())
    built = pilot.build_controller()
    require(retained == built, 'Retained independent controller changed')
    require(payload['controller_rows'] == retained['rows'], 'Actual Lean controller differs')
    controller = payload['controller_rows']
    retained['rows'] = controller
    pilot.validate_controller(retained)
    raw = (WORK / 'full-rows.bin').read_bytes()
    expected = expected_full(seed, controller)
    census = check_full_rows(raw, expected, payload['full_rows'])
    writer = full_writer(raw, seed, payload['writer'])
    cases = payload['complete_startup_fixtures']
    expected_cases = {tuple(values) for n in range(4)
                      for values in itertools.product(range(1, 5), repeat=n)}
    expected_cases.update({(1, 4, 2, 3, 1, 4, 2, 3), (4, 3, 4, 3, 4, 3, 4, 3), (2,) * 5})
    require(len(cases) == len(expected_cases) and {tuple(c['symbols']) for c in cases} == expected_cases,
            'Complete native fixture inventory')
    composed = [check_fixture(case, controller) for case in cases]
    finite = pilot.finite_fixtures(retained, final_symbol)
    pilot_negative = pilot.negative_controls(retained)
    controls = negatives(payload, raw, expected, seed, controller)
    controls.extend(dict(c, name='controller_' + c['name']) for c in pilot_negative['controls'])
    require(len({c['name'] for c in controls}) == len(controls), 'Duplicate negative controls')
    report = dict(status='passed', states=STATES, previous_states=2411743, saved_states=1413567,
                  initializer_states=WRITER, controller_states=CONTROLLER, bridge_states=1,
                  body_states=BODY_STATES, complete_full_rows_verified=True,
                  complete_full_rows_checked=2 * STATES, static_full_input_verified=True,
                  initializer_verified=True, composed_fixtures_verified=True,
                  complete_row_census=census, static_input=static, writer=writer,
                  composed_fixtures=composed, composed_fixture_count=len(composed),
                  controller_fixtures=finite, controller_fixture_count=finite['positive_count'],
                  mutation_controls=controls, negative_control_count=len(controls),
                  positive_controls_ran_first=True, full_quadratic_startup_executed=False,
                  artifact_sha256={'machine-export.json': file_sha(payload_path),
                                   'full-rows.bin': sha(raw)},
                  scope='Full actual table and finite evidence; Lean proof/review acceptance is separate')
    (WORK / 'fixtures-detail.json').write_text(json.dumps(report, indent=2) + '\n')
    print('Seed complete independent fixtures passed')


if __name__ == '__main__':
    main()
