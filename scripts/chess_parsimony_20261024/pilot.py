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


def run(name, argv, seconds):
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
        elapsed_seconds=time.monotonic() - start, effective_budget_seconds=budget,
        peak_group_plus_driver_rss_bytes=peak, log=log.name, log_sha256=sha(log))
    SUMMARY['commands'].append(receipt)
    checkpoint()
    assert code == 0 and cause is None, name + ' failed; retained log: ' + str(log)
    return log.read_text()


def emit(name, obj):
    table = b''.join(RECORD.pack(*row) for row in obj['rows'])
    assert len(table) == obj['allocated_probe_states'] * 2 * RECORD.size
    (WORK / (name + '.bin')).write_bytes(table)
    metadata = {k: v for k, v in obj.items() if k != 'rows'}
    save(name + '.json', metadata)
    return WORK / (name + '.bin')


def reference(rows, out, error, cap):
    ones, head, state = set(), 0, 0
    for step in range(cap + 1):
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


def fixtures():
    records = []
    for i, bits in enumerate([format(value, '08b') for value in range(256)] +
        ['0' * 24, '1' * 24, '01' * 12, '10' * 12, '001101011001110100101011']):
        width = 2 if i < 256 else 3
        obj = printer.build(bits, width)
        assert printer.reconstruct(obj['rows'], obj['words'], obj['width']).startswith(bits)
        expected = reference(obj['rows'], obj['out'], obj['error'], 2000000)
        assert expected['status'] == 'boundary', 'Small physical fixture did not complete'
        # Two independently implemented step engines compare every nonblank cell,
        # terminal head, control and exact step count, not merely a digest.
        actual = simulate('fixture-' + str(i), obj, 2000000, 15)
        assert all(actual[k] == expected[k] for k in ['status', 'steps', 'state', 'head'])
        assert actual['ones_positions'] == expected['ones']
        records.append(dict(bits=bits, width=width, words=obj['words'], pad=obj['pad_bits'],
            steps=actual['steps'], head=actual['head'], ones=expected['ones']))
    save('physical-fixtures.json', records)
    return records


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
        'scripts/chess_parsimony_20261024/upstream/LICENSE']
    save('source-manifest.json', dict(commit=os.environ['GITHUB_SHA'],
        workflow_commit=os.environ['GITHUB_SHA'], run_id=os.environ['GITHUB_RUN_ID'],
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
    parser = argparse.ArgumentParser()
    parser.add_argument('--phase', choices=['probe'], default='probe')
    args = parser.parse_args()
    WORK.mkdir(parents=True, exist_ok=True)
    SUMMARY['phase'] = args.phase
    bits = provenance()
    obj = printer.build(bits)
    output = printer.reconstruct(obj['rows'], obj['words'], obj['width'])
    assert output == bits + '0' * obj['pad_bits']
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
    SUMMARY['raw_printer_census'] = {key: obj[key] for key in
        ['width', 'words', 'pad_bits', 'categories', 'raw_parsimony_printer_states',
         'allocated_probe_states', 'completed_packet_adapter']}
    SUMMARY['raw_transition_packet_identity'] = dict(packet_sha256=PACKET_SHA,
        all_packet_bits_reconstructed=True, zero_padding_bits=obj['pad_bits'],
        full_physical_startup_checked=False)
    checkpoint()
    run('compile-simulator', ['g++', '-O3', '-std=c++17', '-Wall', '-Wextra', '-Werror',
        'scripts/chess_parsimony_20261024/simulate.cpp', '-o', str(WORK / 'simulate')], 60)
    records = fixtures()
    full = simulate('exact-packet-probe', obj, 500000000, 120)
    save('exact-packet-probe.json', {k: v for k, v in full.items() if k != 'ones_positions'})
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
    try:
        main()
    except BaseException as error:
        WORK.mkdir(parents=True, exist_ok=True)
        SUMMARY.update(status='failed', failure_type=type(error).__name__, failure=str(error))
        (WORK / 'failure.txt').write_text(traceback.format_exc())
        checkpoint()
        raise
