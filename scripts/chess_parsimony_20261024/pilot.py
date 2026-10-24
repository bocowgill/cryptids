#!/usr/bin/env python3
"""Bounded remote Parsimony printer census and finite tests; no Lean certificate."""
import os
if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

import argparse
from collections import Counter
import copy
import hashlib
import json
from pathlib import Path
import resource
import signal
import struct
import subprocess
import sys
import time
import traceback

import printer

ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / '.lake/chess-parsimony-printer-20261024'
BASE = 'docs/chess/campaign-2026-10-22/round-04/evidence'
PACKET = BASE + '/packet-02/unpacked/packet.bits'
PACKET_SHA = 'ab1f8764749765bfb0d44b22a999d7907345d2648bf478092a276cf8df71c2d8'
PINS = 'docs/chess/campaign-2026-10-22/accepted-769344-pins.json'
RECORD = struct.Struct('<BBI')
BEGIN = time.monotonic()
LIMIT = 600
ACTIVE_CHILD = None
SUMMARY = dict(schema='chess-parsimony-printer-pilot-v1', status='running',
    accepted_machine_states=769344, old_writer_states=173642, retained_suffix_states=595702,
    new_accepted_machine=False, lean_certificate=False, frozen_source_changed=False,
    parsimony_commit='7c199dbe0c82f0b9cc1adfbdc2b48fee3fef53aa',
    limits=dict(total_seconds=LIMIT, group_plus_driver_rss_bytes=6 << 30,
                driver_rss_bytes=512 << 20, native_compile_seconds=60,
                full_printer_probe_seconds=120, full_printer_probe_steps=500000000),
    commands=[], gates={}, new_certified_saving=0)


def sha(path):
    h = hashlib.sha256()
    with Path(path).open('rb') as stream:
        for block in iter(lambda: stream.read(1 << 20), b''):
            h.update(block)
    return h.hexdigest()


def save(name, value):
    p = WORK / name
    p.parent.mkdir(parents=True, exist_ok=True)
    tmp = p.with_suffix(p.suffix + '.tmp')
    tmp.write_text(json.dumps(value, indent=2, sort_keys=True) + '\n')
    tmp.replace(p)


def checkpoint():
    SUMMARY['elapsed_seconds'] = time.monotonic() - BEGIN
    SUMMARY['driver_peak_rss_kib'] = resource.getrusage(resource.RUSAGE_SELF).ru_maxrss
    save('pilot-summary.json', SUMMARY)


def rss(pid):
    try:
        for line in Path('/proc/' + str(pid) + '/status').read_text().splitlines():
            if line.startswith('VmRSS:'):
                return int(line.split()[1]) * 1024
    except (FileNotFoundError, ProcessLookupError, PermissionError):
        pass
    return 0


def group_rss(pid):
    total = rss(os.getpid())
    for p in Path('/proc').iterdir():
        if p.name.isdigit():
            try:
                stat = (p / 'stat').read_text().rsplit(')', 1)[1].split()
                if int(stat[2]) == pid:
                    total += rss(int(p.name))
            except (FileNotFoundError, ProcessLookupError, PermissionError):
                pass
    return total


def run(name, argv, seconds, expected_exit=0):
    global ACTIVE_CHILD
    remaining = LIMIT - (time.monotonic() - BEGIN) - 5
    budget = min(seconds, remaining)
    assert budget > 0, 'Global pilot deadline reached'
    start = time.monotonic()
    log = WORK / (name + '.log')
    cause, peak = None, 0
    with log.open('wb') as output:
        proc = subprocess.Popen(argv, cwd=ROOT, stdout=output, stderr=subprocess.STDOUT,
                                start_new_session=True)
        ACTIVE_CHILD = proc
        while proc.poll() is None:
            memory = group_rss(proc.pid)
            peak = max(peak, memory)
            if memory > 6 << 30:
                cause = 'group_plus_driver_memory_budget'
            elif rss(os.getpid()) > 512 << 20:
                cause = 'driver_memory_budget'
            elif time.monotonic() - start > budget:
                cause = 'wall_budget'
            if cause:
                os.killpg(proc.pid, signal.SIGKILL)
                break
            time.sleep(0.05)
        code = proc.wait()
        ACTIVE_CHILD = None
    receipt = dict(name=name, argv=argv, cwd=str(ROOT), exit=code, resource_stop=cause,
        expected_exit=expected_exit,
        elapsed_seconds=time.monotonic() - start, effective_budget_seconds=budget,
        peak_group_plus_driver_rss_bytes=peak, log=log.name, log_sha256=sha(log))
    SUMMARY['commands'].append(receipt)
    checkpoint()
    assert code == expected_exit and cause is None, name + ' failed; retained log: ' + str(log)
    return log.read_text()


def emit(name, obj):
    table = b''.join(RECORD.pack(*row) for row in obj['rows'])
    assert len(table) == obj['allocated_probe_states'] * 2 * RECORD.size
    (WORK / (name + '.bin')).write_bytes(table)
    metadata = {k: v for k, v in obj.items() if k not in ('rows', 'framed_payload')}
    save(name + '.json', metadata)
    return WORK / (name + '.bin')


def reference(rows, out, error, cap, trace=None, watch=None):
    ones, head, state = set(), 0, 0
    for step in range(cap + 1):
        if trace is not None and state in watch and len(trace) < 256:
            trace.append(dict(step=step, state=state, head=head, read=int(head in ones),
                              ones=sorted(ones)))
        if state in (out, error):
            return dict(status='boundary' if state == out else 'error', steps=step,
                        state=state, head=head, ones=sorted(ones))
        if step == cap:
            break
        written, direction, target = rows[2 * state + int(head in ones)]
        if written == 2:
            return dict(status='halt', steps=step, state=state, head=head, ones=sorted(ones))
        if written:
            ones.add(head)
        else:
            ones.discard(head)
        head += 1 if direction else -1
        state = target
    return dict(status='step_cap', steps=cap, state=state, head=head, ones=sorted(ones))


def simulate(name, obj, cap, seconds):
    table = emit(name, obj)
    text = run(name, [str(WORK / 'simulate'), str(table), str(obj['allocated_probe_states']),
        str(obj['out']), str(obj['error']), str(cap), str(WORK / name)], seconds)
    result = json.loads(text)
    raw = (WORK / (name + '.tape')).read_bytes()
    assert len(raw) == result['high'] - result['low'] + 1 and set(raw) <= {0, 1}
    result['ones_positions'] = [i + result['low'] for i, bit in enumerate(raw) if bit]
    assert len(result['ones_positions']) == result['ones']
    return result


def exact_boundary(result, obj, bits, positions_key='ones'):
    return (result['status'] == 'boundary' and result['state'] == obj['out'] and
            result['head'] == obj['packet_start'] and result[positions_key] ==
            [obj['packet_start'] + i for i, bit in enumerate(bits) if bit == '1'])


def diagnose_boundary():
    """Observe the existing failed contract before editing any printer control."""
    bits = '01011010'
    obj = printer.guarded(bits, 2)
    # Preserve the old oracle for reproducibility after correcting the metadata.
    obj['packet_start'] = obj['marker_bits'] + 2
    n = obj['raw_parsimony_printer_states']
    trace = []
    result = reference(obj['rows'], obj['out'], obj['error'], 2000000, trace,
                       {3, 4, 5, n, n + 1, n + 2, n + 3, obj['out'] - 3,
                        obj['out'] - 2, obj['out']})
    for event in trace:
        event['name'] = obj['names'][event['state']]
    receipt = dict(bits=bits, declared_packet_start=obj['packet_start'], result=result,
                   trace=trace, old_contract_passed=exact_boundary(result, obj, bits))
    save('boundary-diagnosis.json', receipt)
    native = simulate('boundary-diagnostic-native', obj, 2000000, 15)
    receipt['native_result'] = native
    alternative = dict(obj, packet_start=obj['marker_bits'] + 1)
    receipt['cell_zero_contract_passed'] = exact_boundary(result, alternative, bits)
    receipt['native_cell_zero_contract_passed'] = exact_boundary(
        native, alternative, bits, 'ones_positions')
    receipt['candidate_packet_start'] = alternative['packet_start']
    receipt['measured_offset_from_declared'] = result['head'] - obj['packet_start']
    save('boundary-diagnosis.json', receipt)
    assert all(native[k] == result[k] for k in ['status', 'steps', 'state', 'head'])
    assert native['ones_positions'] == result['ones']
    assert not receipt['old_contract_passed'], 'Original failure not reproduced'
    assert receipt['cell_zero_contract_passed'] and receipt['native_cell_zero_contract_passed']
    assert receipt['measured_offset_from_declared'] == -1
    SUMMARY.update(status='bounded_diagnosis_passed', boundary_diagnosis=receipt,
        next='Correct the observed absolute packet origin, preserving all tape checks; '
             'run the independent fixtures and complete census before certification.')
    checkpoint()
    print('PARSIMONY_BOUNDARY_DIAGNOSED', flush=True)


def adapter_controls():
    bits = '01011010'
    obj = printer.guarded(bits, 2)
    positive = reference(obj['rows'], obj['out'], obj['error'], 2000000)
    records = [dict(name='unmodified_adapter',
                    exact_boundary=exact_boundary(positive, obj, bits), result=positive)]
    save('adapter-controls.json', records)
    assert exact_boundary(positive, obj, bits), 'Adapter positive control failed'
    # Actual emitted transition mutations: a dirty separator, wrong entry head,
    # and an unerased tail sentinel must each fail the same exact-boundary oracle.
    clear_run = obj['out'] - 2
    tail_end = obj['raw_parsimony_printer_states'] + 2
    mutations = [('dirty_separator', 2 * clear_run, (1, 1, obj['out'])),
                 ('wrong_decoder_head', 2 * clear_run, (0, 0, obj['out'])),
                 ('unerased_tail', 2 * tail_end + 1, (1, 0, tail_end + 1))]
    for name, index, row in mutations:
        bad = list(obj['rows'])
        bad[index] = row
        result = reference(bad, obj['out'], obj['error'], 2000000)
        rejected = not exact_boundary(result, obj, bits)
        records.append(dict(name=name, rejected=rejected, mutated_cell=index,
                            mutated_row=row, result=result))
        save('adapter-controls.json', records)
        assert rejected, 'Adapter corruption accepted: ' + name
    return records


def fixtures(guarded=False):
    records = []
    for i, bits in enumerate([format(value, '08b') for value in range(256)] +
        ['0' * 24, '1' * 24, '01' * 12, '10' * 12, '001101011001110100101011']):
        width = 2 if i < 256 else 3
        obj = printer.guarded(bits, width) if guarded else printer.build(bits, width)
        reconstructed = printer.reconstruct(obj['rows'], obj['words'], obj['width'])
        assert reconstructed.startswith(obj['framed_payload'] if guarded else bits)
        expected = reference(obj['rows'], obj['out'], obj['error'], 2000000)
        save('current-fixture.json', dict(index=i, bits=bits, width=width,
            metadata={k: v for k, v in obj.items() if k not in ('rows', 'framed_payload')},
            reference_result=expected))
        assert expected['status'] == 'boundary', 'Small physical fixture did not complete'
        if guarded:
            assert exact_boundary(expected, obj, bits), 'Incorrect packet, exterior or head'
        # Two independently implemented step engines compare every nonblank cell,
        # terminal head, control and exact step count, not merely a digest.
        actual = simulate('fixture-' + str(i), obj, 2000000, 15)
        assert all(actual[k] == expected[k] for k in ['status', 'steps', 'state', 'head'])
        assert actual['ones_positions'] == expected['ones']
        records.append(dict(bits=bits, width=width, words=obj['words'], pad=obj['pad_bits'],
            steps=actual['steps'], head=actual['head'], ones=expected['ones']))
        save('physical-fixtures.json', records)
        if i % 32 == 0:
            SUMMARY['completed_physical_fixtures'] = len(records)
            checkpoint()
    return records


def linked_candidate(obj):
    """Emit every full-machine row, relocating the pinned accepted suffix exactly."""
    path = ROOT / (BASE + '/final/unpacked/full-rows.bin')
    old = path.read_bytes()
    assert hashlib.sha256(old).hexdigest() == \
        '29989c45b9281c91f33349b23610a7e335a9e352f6647f10fedd61cb4497d086'
    assert len(old) == 769344 * 2 * RECORD.size
    p = obj['replacement_states']
    assert obj['out'] == p and obj['boundary_counted_in_retained_suffix']
    rows = list(obj['rows'][:2 * p])
    for written, direction, target in RECORD.iter_unpack(old[173642 * 2 * RECORD.size:]):
        if written == 2:
            assert (written, direction, target) == (2, 0, 0)
            rows.append((written, direction, target))
        else:
            assert written in (0, 1) and direction in (0, 1)
            assert 173642 <= target < 769344, 'Retained suffix returns to old writer'
            rows.append((written, direction, p + target - 173642))
    full = p + 595702
    assert len(rows) == 2 * full
    assert all(w == 2 or (w in (0, 1) and d in (0, 1) and 0 <= t < full)
               for w, d, t in rows)
    raw = b''.join(RECORD.pack(*row) for row in rows)
    (WORK / 'full-candidate-rows.bin').write_bytes(raw)
    # Independently parse the serialized allocation, not the producer's list length.
    parsed, missing, prefix_connections = 0, 0, 0
    suffix_roundtrip = hashlib.sha256()
    for index, (w, d, t) in enumerate(RECORD.iter_unpack(raw)):
        parsed += 1
        if w == 2:
            assert d == t == 0
            missing += 1
        else:
            assert w in (0, 1) and d in (0, 1) and t < full
        if index < 2 * p:
            assert w != 2, 'New printer contains a premature halting transition'
            assert (w, d, t) == obj['rows'][index]
            if t >= p:
                assert t == p, 'Printer bypasses the retained decoder entry'
                prefix_connections += 1
        else:
            inverse = (w, d, 0 if w == 2 else t - p + 173642)
            assert w == 2 or p <= t < full
            offset = (2 * 173642 + index - 2 * p) * RECORD.size
            assert inverse == RECORD.unpack_from(old, offset)
            suffix_roundtrip.update(RECORD.pack(*inverse))
    assert parsed == 2 * full and missing == 2
    assert prefix_connections == 1
    suffix_sha = hashlib.sha256(old[173642 * 2 * RECORD.size:]).hexdigest()
    assert suffix_roundtrip.hexdigest() == suffix_sha
    native = json.loads(run('full-candidate-native-census', [str(WORK / 'simulate'),
        '--census', str(WORK / 'full-candidate-rows.bin')], 30))
    assert native['states'] == full and native['cells'] == parsed
    assert native['missing_cells'] == missing and native['bytes'] == len(raw)
    save('full-candidate-native-census.json', native)
    # Exercise the same native census against corrupted actual serialized tables.
    controls = []
    bad = bytearray(raw)
    struct.pack_into('<I', bad, 2, 0xffffffff)
    (WORK / 'census-invalid-target.bin').write_bytes(bad)
    text = run('census-invalid-target', [str(WORK / 'simulate'), '--census',
        str(WORK / 'census-invalid-target.bin')], 30, expected_exit=1)
    assert 'census invalid target' in text
    controls.append(dict(name='actual_full_table_invalid_target', rejected=True))
    (WORK / 'census-truncated.bin').write_bytes(raw[:-1])
    text = run('census-truncated', [str(WORK / 'simulate'), '--census',
        str(WORK / 'census-truncated.bin')], 30, expected_exit=1)
    assert 'census short record' in text
    controls.append(dict(name='actual_full_table_truncated_record', rejected=True))
    save('full-candidate-census-controls.json', controls)
    census = dict(replacement_states=p, retained_decoder_states=21682,
        new_decoder_bridge=1, retained_seed_expander=216, retained_expander_bridge=1,
        interpreter_main=533341, interpreter_returns=40461,
        retained_suffix_states=595702, full_candidate_states=full,
        full_candidate_cells=parsed, full_candidate_missing_cells=missing,
        full_candidate_sha256=hashlib.sha256(raw).hexdigest(),
        retained_suffix_roundtrip_sha256=suffix_sha,
        all_retained_transition_rows_checked=True,
        printer_edges_into_decoder=prefix_connections, independent_native_census=native,
        old_full_states=769344, experimental_net_saving=769344 - full,
        old_writer_states=173642, new_writer_categories={k: v for k, v in
            obj['categories'].items() if k != 'retained_decoder_boundary'},
        additional_bridge_states_outside_printer=0,
        retained_decoder_boundary_already_paid=True, new_accepted_machine=False,
        certified_saving=0, complete_halting_equivalence_proved=False)
    assert sum(census['new_writer_categories'].values()) == p
    assert p + sum(census[key] for key in ['retained_decoder_states', 'new_decoder_bridge',
        'retained_seed_expander', 'retained_expander_bridge', 'interpreter_main',
        'interpreter_returns']) == full
    save('full-candidate-census.json', census)
    return census


def provenance():
    assert os.environ.get('GITHUB_REPOSITORY') == 'bocowgill/cryptids'
    assert os.environ.get('RUNNER_ENVIRONMENT') == 'github-hosted'
    pins = json.loads((ROOT / PINS).read_text())
    for name, expected in pins.items():
        assert sha(ROOT / name) == expected, 'Accepted/frozen file changed: ' + name
    assert pins[PACKET] == PACKET_SHA and sha(ROOT / PACKET) == PACKET_SHA
    raw = (ROOT / PACKET).read_bytes()
    assert len(raw) == 173641 and set(raw) <= {48, 49}
    final = json.loads((ROOT / (BASE + '/final/unpacked/counts.json')).read_text())
    assert final['source_sha256'][PACKET] == PACKET_SHA
    assert sha(printer.UPSTREAM) == printer.SOURCE_SHA
    paths = ['.github/workflows/chess_parsimony_printer_20261024.yml', PINS,
        'scripts/chess_parsimony_20261024/pilot.py',
        'scripts/chess_parsimony_20261024/printer.py',
        'scripts/chess_parsimony_20261024/simulate.cpp',
        'scripts/chess_parsimony_20261024/upstream/programmer.py',
        'scripts/chess_parsimony_20261024/upstream/LICENSE',
        'docs/chess/parsimony-printer-2026-10-24/evidence/pilot-02/'
            'unpacked/exact-packet-raw-printer.bin',
        'docs/chess/parsimony-printer-2026-10-24/evidence/diagnosis-03/'
            'unpacked/boundary-diagnosis.json']
    save('source-manifest.json', dict(commit=os.environ['GITHUB_SHA'],
        workflow_commit=os.environ['GITHUB_SHA'], run_id=os.environ['GITHUB_RUN_ID'],
        cwd=str(ROOT), shell=os.environ.get('SHELL'), path=os.environ.get('PATH'),
        command='python3 scripts/chess_parsimony_20261024/pilot.py ' + ' '.join(sys.argv[1:]),
        source_sha256={name: sha(ROOT / name) for name in paths},
        frozen_source_sha256=pins, packet_sha256=PACKET_SHA, packet_path=PACKET,
        parsimony_commit=SUMMARY['parsimony_commit']))
    save('runner-capacity.json', dict(meminfo=Path('/proc/meminfo').read_text(),
        memory_max=Path('/sys/fs/cgroup/memory.max').read_text()
        if Path('/sys/fs/cgroup/memory.max').exists() else None,
        rlimit_as=resource.getrlimit(resource.RLIMIT_AS),
        runner_environment=os.environ['RUNNER_ENVIRONMENT']))
    SUMMARY['gates']['G1'] = True
    print('PARSIMONY_PACKET_PROVENANCE_PASSED', flush=True)
    checkpoint()
    return raw.decode()


def main():
    global LIMIT
    parser = argparse.ArgumentParser()
    parser.add_argument('--phase', choices=['probe', 'diagnose', 'pilot'], default='diagnose')
    args = parser.parse_args()
    LIMIT = 60 if args.phase == 'diagnose' else 600
    SUMMARY['limits']['total_seconds'] = LIMIT
    signal.alarm(LIMIT)
    WORK.mkdir(parents=True, exist_ok=True)
    SUMMARY['phase'] = args.phase
    bits = provenance()
    if args.phase == 'diagnose':
        run('compile-simulator', ['g++', '-O3', '-std=c++17', '-Wall', '-Wextra', '-Werror',
            'scripts/chess_parsimony_20261024/simulate.cpp', '-o', str(WORK / 'simulate')], 45)
        diagnose_boundary()
        return
    if args.phase == 'pilot':
        # Retain the raw zero-only failure as a bounded regression control.
        raw_zero = printer.build('00000000', 2)
        raw_failure = reference(raw_zero['rows'], raw_zero['out'], raw_zero['error'], 10000)
        assert raw_failure['status'] != 'boundary'
        save('original-zero-framing-obstruction.json', raw_failure)
    obj = printer.guarded(bits) if args.phase == 'pilot' else printer.build(bits)
    output = printer.reconstruct(obj['rows'], obj['words'], obj['width'])
    payload = obj['framed_payload'] if args.phase == 'pilot' else bits
    assert output == payload + '0' * obj['pad_bits']
    if args.phase == 'pilot':
        marker = obj['marker_bits']
        assert output[:marker + 1] == '1' * marker + '0'
        assert output[marker + 1:marker + 1 + len(bits)] == bits
        assert output[marker + 1 + len(bits):] == '100' + '0' * obj['pad_bits']
    controls = []
    bad = copy.deepcopy(obj['rows'])
    i = 6 + obj['words'] - 1
    written, direction, target = bad[2 * 6 + 1]
    bad[2 * 6 + 1] = (written, direction, target - 1 if target == i else target + 1)
    try:
        changed = printer.reconstruct(bad, obj['words'], obj['width'])
        rejected = changed != output
    except AssertionError:
        rejected = True
    assert rejected
    controls.append(dict(name='wrong_actual_data_target', rejected=True))
    bad = copy.deepcopy(obj['rows'])
    bad[2 * 6] = (0, 1, 6)
    try:
        printer.reconstruct(bad, obj['words'], obj['width'])
        rejected = False
    except AssertionError:
        rejected = True
    assert rejected
    controls.append(dict(name='wrong_actual_data_chain', rejected=True))
    save('corruption-controls.json', controls)
    emit('exact-packet-raw-printer', obj)
    if args.phase == 'pilot':
        # The diagnosis changes the oracle's absolute origin, not the emitted TM.
        old_table = ROOT / ('docs/chess/parsimony-printer-2026-10-24/evidence/'
                            'pilot-02/unpacked/exact-packet-raw-printer.bin')
        assert sha(WORK / 'exact-packet-raw-printer.bin') == sha(old_table)
        SUMMARY['printer_transitions_unchanged_from_failed_pilot'] = True
    SUMMARY['raw_printer_census'] = {key: obj[key] for key in
        ['width', 'words', 'pad_bits', 'categories', 'raw_parsimony_printer_states',
         'allocated_probe_states', 'completed_packet_adapter']}
    SUMMARY['raw_transition_packet_identity'] = dict(packet_sha256=PACKET_SHA,
        all_packet_bits_reconstructed=True, zero_padding_bits=obj['pad_bits'],
        full_physical_startup_checked=False)
    checkpoint()
    run('compile-simulator', ['g++', '-O3', '-std=c++17', '-Wall', '-Wextra', '-Werror',
        'scripts/chess_parsimony_20261024/simulate.cpp', '-o', str(WORK / 'simulate')], 60)
    if args.phase == 'pilot':
        SUMMARY['adapter_corruption_controls'] = adapter_controls()
    records = fixtures(guarded=args.phase == 'pilot')
    full = simulate('exact-packet-probe', obj, 500000000, 120)
    save('exact-packet-probe.json', {k: v for k, v in full.items() if k != 'ones_positions'})
    if args.phase == 'pilot':
        assert full['status'] in ('boundary', 'step_cap'), 'Full printer reached an error/halt'
        if full['status'] == 'boundary':
            assert exact_boundary(full, obj, bits, 'ones_positions')
        SUMMARY['raw_transition_packet_identity']['full_physical_startup_checked'] = \
            full['status'] == 'boundary'
        census = linked_candidate(obj)
        SUMMARY['gates'].update(G2=True, G3=True, G4=True)
        SUMMARY.update(status='bounded_pilot_passed', physical_fixture_count=len(records),
            full_printer_probe={k: v for k, v in full.items() if k != 'ones_positions'},
            full_machine_savings=census['experimental_net_saving'],
            completed_packet_adapter=True, full_machine_census=census,
            full_physical_startup_completed=full['status'] == 'boundary',
            next='Assess measured savings and proof obligations; stop before certification.')
        for banner in ['PARSIMONY_COMPLETE_PRINTER_CENSUS_PASSED',
                       'PARSIMONY_PACKET_AND_FIXTURES_PASSED', 'PARSIMONY_NET_SAVINGS_ASSESSED']:
            print(banner, flush=True)
        checkpoint()
        return
    SUMMARY.update(status='raw_framing_probe_passed', physical_fixture_count=len(records),
        full_printer_probe={k: v for k, v in full.items() if k != 'ones_positions'},
        full_machine_savings=None, completed_packet_adapter=False,
        next='Inspect physical full-tape/head fixture records; construct and count exact '
             'cleanup/connection controls before any net-saving claim or certification.')
    checkpoint()
    print('PARSIMONY_RAW_FRAMING_PROBE_PASSED', flush=True)


def stop(signum, _frame):
    if ACTIVE_CHILD is not None and ACTIVE_CHILD.poll() is None:
        os.killpg(ACTIVE_CHILD.pid, signal.SIGKILL)
    raise TimeoutError('Pilot interrupted by signal ' + str(signum))


if __name__ == '__main__':
    signal.signal(signal.SIGTERM, stop)
    signal.signal(signal.SIGINT, stop)
    signal.signal(signal.SIGALRM, stop)
    try:
        main()
    except BaseException as error:
        WORK.mkdir(parents=True, exist_ok=True)
        SUMMARY.update(status='failed', failure_type=type(error).__name__, failure=str(error))
        (WORK / 'failure.txt').write_text(traceback.format_exc())
        checkpoint()
        raise
