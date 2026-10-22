#!/usr/bin/env python3
"""Independent remote checks of the complete structured-seed chess candidate.

No generator, prior fixture implementation, or Lean executable is imported.
Pinned original inputs, controller tables and body rows are data references.
Full chess startup is never simulated: only the linear writer and bounded toys.
Finite evidence does not establish the universal Lean theorem or acceptance.
"""
import os

if os.environ.get("CHESS_REMOTE") != "1" or os.environ.get("GITHUB_ACTIONS") != "true":
    raise SystemExit("Remote GitHub Actions execution required")

import argparse
import copy
import hashlib
import json
import resource
import struct
import time
import traceback
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / ".lake/chess-table-full-20261022"
CAMPAIGN = ROOT / "docs/chess/campaign-2026-10-22"
PACKET = CAMPAIGN / "round-04/evidence/packet-02/unpacked"
DECODER = CAMPAIGN / "round-04/evidence/controller-01/unpacked"
EXPANDER = CAMPAIGN / "round-02/evidence/pilot-02/unpacked"
ORIGINAL = CAMPAIGN / "round-01/evidence/final/unpacked"
RECORD = struct.Struct("<BBI")
HEADER = "0111100011110"
BODY_STATES = 573802
OLD_BODY_ENTRY = 1837941
MAX_CASE_STEPS = 4000000
MAX_BATCH_STEPS = 50000000
WALL_SECONDS = 540
MEMORY_BYTES = 4 * 1024 ** 3
BANNER = "Table seed complete independent fixtures passed"
OWNED = ("fixtures-detail.json", "fixtures-progress.json", "fixtures-failure.json")
PINS = {
    "source-input.json": (PACKET, "81211018fb63850c544e2ea7c336163215fee1b4e0f2b391ff00304ced258c4c"),
    "source-symbols.u8": (PACKET, "3a148a738a015a5fa45ba469a7e6dc84a14b37b5b215c704cac257d097d8e773"),
    "decoded-seed.bits": (PACKET, "2946c43c229df7c2468d45f72ac385e20188aeafc1a4af74309a5d563d8befe1"),
    "original-machine": (ORIGINAL / "machine-export.json", "592ea3c892d0e9d5a6db6ce31e3f590bde7973774bdc9a70cfe46cb6996cd39e"),
    "body-rows.jsonl": (ORIGINAL, "d2afbf1c0abe1afb0008029680c5bc52b41f2dc21718a88d16b7aecd06becb0a"),
    "decoder": (DECODER / "controller.json", "c812768bac296d8520f64b7df4a33de47e7c067c79594bef48e7b536e359e09f"),
    "expander": (EXPANDER / "controller.json", "c19e270e8c21b2c629413f5977a9b57f4aab018ef61988f405669bb8726691d2"),
}


class Failure(Exception):
    def __init__(self, stage, message):
        super().__init__(message)
        self.stage = stage


class BudgetFailure(Failure):
    pass


def require(condition, stage, message):
    if not condition:
        raise Failure(stage, message)


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def save(path, value):
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    temporary.replace(path)


def object_pairs(pairs):
    result = {}
    for key, value in pairs:
        require(key not in result, "json", "Duplicate JSON key: " + key)
        result[key] = value
    return result


def read_json(raw):
    return json.loads(raw, object_pairs_hook=object_pairs)


def pinned(name):
    path, expected = PINS[name]
    if path.is_dir():
        path = path / name
    raw = path.read_bytes()
    require(sha(raw) == expected, "pin", "Retained bytes changed: " + name)
    return raw


def integer(value, lower, upper, stage, context):
    require(type(value) is int and lower <= value < upper, stage, context + ": invalid integer")


def exact(actual, expected, stage):
    # Recursive comparison also rejects bools supplied in place of integer controls.
    require(type(actual) is type(expected), stage, "Metadata type mismatch")
    if isinstance(expected, dict):
        require(actual.keys() == expected.keys(), stage, "Metadata keys mismatch")
        for key in expected:
            exact(actual[key], expected[key], stage)
    elif isinstance(expected, list):
        require(len(actual) == len(expected), stage, "Metadata list length mismatch")
        for left, right in zip(actual, expected):
            exact(left, right, stage)
    else:
        require(actual == expected, stage, "Metadata value mismatch")


def natural(value):
    integer(value, 0, 1 << 4096, "input", "Natural word")
    letters = []
    while value:
        letters.append(3 + value % 2)
        value //= 2
    return letters + [2]


def inputs(pre, table, post):
    require(isinstance(pre, list) and isinstance(table, list) and isinstance(post, list),
            "input", "Input phases must be lists")
    for symbol in pre + post:
        integer(symbol, 1, 5, "input", "Literal letter")
    letters = list(pre)
    for row in table:
        require(isinstance(row, list) and len(row) == 3, "input", "Source row arity")
        integer(row[0], 0, 7, "input", "Tag")
        integer(row[1], 0, 8192, "input", "Left operand")
        integer(row[2], 0, 8192, "input", "Right operand")
        for value in row:
            letters.extend(natural(value))
    return letters + [1] + post


def code(symbol):
    return "".join(str((symbol >> index) & 1) for index in range(3))


def encode_packet(pre, table, post):
    packet = HEADER + "".join(code(symbol) for symbol in reversed(post)) + "000"
    for tag, left, right in reversed(table):
        packet += code(tag) + format(right, "013b") + format(left, "013b")
    return packet + "111" + "".join(code(symbol) for symbol in reversed(pre)) + "000"


def parse_packet(packet):
    """Ordinary bounded parser, independent of controller state machine and encoder."""
    require(isinstance(packet, str) and set(packet) <= {"0", "1"} and packet.startswith(HEADER),
            "packet_parse", "Invalid packet alphabet or header")
    cursor = len(HEADER)

    def word(width, little=False):
        nonlocal cursor
        require(cursor + width <= len(packet), "packet_parse", "Truncated packet")
        bits = packet[cursor:cursor + width]
        cursor += width
        return int(bits[::-1] if little else bits, 2)

    def literals():
        result = []
        while True:
            symbol = word(3, True)
            if symbol == 0:
                return result
            integer(symbol, 1, 5, "packet_parse", "Decoded literal")
            result.append(symbol)

    reverse_post = literals()
    reverse_table = []
    while True:
        tag = word(3, True)
        if tag == 7:
            break
        right, left = word(13), word(13)
        reverse_table.append([tag, left, right])
    reverse_pre = literals()
    require(cursor == len(packet), "packet_parse", "Unconsumed packet suffix")
    return list(reversed(reverse_pre)), list(reversed(reverse_table)), list(reversed(reverse_post))


def seed_for(letters):
    return HEADER + "".join(code(symbol) for symbol in letters) + "000"


def field_for(letters):
    # The delimiter guarantees nonempty output even when all source phases are empty.
    return "".join(code(symbol) + "0" * 9 + ("1" if index == 0 else "0")
                   for index, symbol in enumerate(reversed(letters)))


def static_input(payload, source, original, saved_symbols, saved_seed):
    pre, table, post = source["pre"], source["rows"], source["post"]
    require(pre == natural(source["root"]) and post == natural(int(source["argument_hex"], 16)),
            "source_words", "Literal root/argument differs from original arithmetic words")
    letters = inputs(pre, table, post)
    require(bytes(letters) == saved_symbols, "source_symbols", "Complete original symbol order changed")
    require(original["schema"] == "chess-field-selective-v1", "source_schema", "Wrong original export")
    cells = original["source_cells"]
    expected_cells = "".join(("1" if i == 0 else "0") + str(symbol) + "000"
                             for i, symbol in enumerate(reversed(letters)))
    require(cells == expected_cells, "source_cells", "Complete frozen interpreter input changed")
    expected_packet = encode_packet(pre, table, post)
    require(payload["packet"] == expected_packet, "input_packet", "Actual packet differs from original source")
    decoded_pre, decoded_table, decoded_post = parse_packet(payload["packet"])
    require((decoded_pre, decoded_table, decoded_post) == (pre, table, post),
            "packet_identity", "Packet does not recover every original row and phase")
    decoded_letters = inputs(decoded_pre, decoded_table, decoded_post)
    seed = seed_for(decoded_letters)
    require(seed == saved_seed, "seed_identity", "Complete old seed differs from retained seed")
    require(field_for(decoded_letters) == original["bits"], "field_identity", "Complete field tape mismatch")
    require(len(table) == 5952 and len(pre) == 14 and len(post) == 323 and len(letters) == 141380,
            "input_counts", "Original full input census changed")
    require(len(expected_packet) == 29 * len(table) + 3 * (len(pre) + len(post)) + 22 == 173641
            and len(seed) == 424156 and len(original["bits"]) == 1837940,
            "input_counts", "Independent full tape lengths changed")
    require(payload["full_quadratic_startup_executed"] is False, "scope", "Forbidden startup claim")
    return expected_packet, {
        "source_rows": len(table), "symbols": len(letters), "packet_bits": len(expected_packet),
        "seed_bits": len(seed), "field_bits": len(original["bits"]),
        "packet_sha256": sha(expected_packet.encode()), "seed_sha256": sha(seed.encode()),
        "symbols_sha256": sha(saved_symbols), "field_sha256": sha(original["bits"].encode()),
        "all_original_rows_and_symbols_equal": True, "all_packet_bits_consumed": True,
        "complete_static_field_tape_equal": True}


def packed(row, bound):
    if row is None:
        return RECORD.pack(2, 0, 0)
    require(isinstance(row, list) and len(row) == 3, "row_encoding", "Transition arity")
    integer(row[0], 0, 2, "row_encoding", "Write")
    require(type(row[1]) is int and row[1] in (-1, 1), "row_encoding", "Nonunit direction")
    integer(row[2], 0, bound, "row_encoding", "Destination")
    return RECORD.pack(row[0], int(row[1] == 1), row[2])


def controller(data, expected_states, expected_done):
    rows = data["rows"]
    require(data["states"] == expected_states == len(rows) and data["entry"] == 0
            and data["done"] == expected_done, "controller_census", "Pinned controller allocation")
    missing = []
    for state, pair in enumerate(rows):
        require(isinstance(pair, list) and len(pair) == 2, "controller_census", "Incomplete symbol pair")
        for bit, row in enumerate(pair):
            packed(row, len(rows))
            if row is None:
                missing.append((state, bit))
    require(missing == [(expected_done, 0), (expected_done, 1)],
            "controller_census", "Unexpected missing control")
    error = data["error"]
    require(rows[error] == [[0, 1, error], [1, 1, error]], "controller_census", "Error loop changed")
    return rows


def allocation(packet, decoder, expander, body_count):
    writer = len(packet) + 1
    decoder_count, expander_count = len(decoder), len(expander)
    new_bridge = writer + decoder_count
    expander_entry = new_bridge + 1
    old_bridge = expander_entry + expander_count
    body_entry = old_bridge + 1
    total = body_entry + body_count
    return dict(machine_states=total, row_machine_states=total, generated_states=total,
                packet_bits=len(packet), writer_states=writer, decoder_states=decoder_count,
                new_bridge_states=1, expander_states=expander_count, old_bridge_states=1,
                linked_states=total - writer, body_states=body_count, decoder_entry=writer,
                decoder_done=writer + 21680, decoder_error=writer + 21681, new_bridge_entry=new_bridge,
                expander_entry=expander_entry, expander_done=expander_entry + 214,
                old_bridge_entry=old_bridge, body_entry=body_entry, previous_states=998176)


def composed(packet, decoder, expander, body, body_count):
    meta = allocation(packet, decoder, expander, body_count)
    for state, bit in enumerate(reversed(packet)):
        yield [int(bit), -1, state + 1]
        yield [int(bit), -1, state + 1]
    for bit in (0, 1):
        yield [bit, 1, meta["decoder_entry"]]
    for rows, start, done, bridge in (
        (decoder, meta["decoder_entry"], 21680, meta["new_bridge_entry"]),
        (expander, meta["expander_entry"], 214, meta["old_bridge_entry"]),
    ):
        for state, pair in enumerate(rows):
            for bit, row in enumerate(pair):
                if state == done:
                    yield [bit, 1, bridge]
                else:
                    yield None if row is None else [row[0], row[1], start + row[2]]
        for bit in (0, 1):
            yield [bit, -1, bridge + 1]
    for row in body:
        yield None if row is None else [row[0], row[1], meta["body_entry"] + row[2]]


def body_rows(raw):
    count = 0
    for index, line in enumerate(raw.splitlines()):
        state, bit, row = read_json(line)
        expected_state, expected_bit = divmod(index, 2)
        require(state == OLD_BODY_ENTRY + expected_state and bit == expected_bit
                and expected_state < BODY_STATES, "body_source", "Retained body order/extent")
        if row is not None:
            row = [row[0], row[1], row[2] - OLD_BODY_ENTRY]
        packed(row, BODY_STATES)
        count += 1
        yield row
    require(count == 2 * BODY_STATES, "body_source", "Retained body truncated")


def complete_rows(raw, expected, meta, receipt):
    total = meta["machine_states"]
    require(len(raw) == len(expected) == 2 * total * RECORD.size, "row_extent", "Complete row extent mismatch")
    missing = 0
    for index, (write, direction, target) in enumerate(RECORD.iter_unpack(raw)):
        if write == 2:
            require(direction == target == 0, "row_encoding", f"Noncanonical halt at {index}")
            missing += 1
        else:
            require(write in (0, 1) and direction in (0, 1) and target < total,
                    "row_encoding", f"Unpaid or invalid transition at {index}")
    require(raw == expected, "row_content", "Complete actual rows differ from independent composition")
    exact(receipt, dict(filename="full-rows.bin", format="<BBI", record_bytes=6,
                       states=total, rows=2 * total, bytes=len(raw), missing_rows=missing,
                       missing_encoding=[2, 0, 0], direction_left=0, direction_right=1,
                       order="state-major,bit-0-before-1", native_machine_rowMachine_equal=True),
          "row_receipt")
    return {"states": total, "rows": 2 * total, "missing_rows": missing,
            "sha256": sha(raw), "every_allocated_row_equal": True}


class Budget:
    def __init__(self):
        self.started = time.monotonic()
        self.steps = 0

    def check(self):
        if time.monotonic() - self.started >= WALL_SECONDS or self.steps > MAX_BATCH_STEPS:
            raise BudgetFailure("budget", "Global time or step bound exhausted")


def transition(raw, state, bit):
    write, direction, target = RECORD.unpack_from(raw, RECORD.size * (2 * state + bit))
    return None if write == 2 else (write, 1 if direction else -1, target)


def step(raw, state, head, ones):
    row = transition(raw, state, int(head in ones))
    require(row is not None, "execution", "Unexpected halt during paid path")
    write, direction, target = row
    if write:
        ones.add(head)
    else:
        ones.discard(head)
    return target, head + direction


def writer(raw, packet, receipt, budget):
    state, head, ones = 0, 0, set()
    for index in range(len(packet) + 1):
        if index % 2048 == 0:
            budget.check()
        state, head = step(raw, state, head, ones)
        budget.steps += 1
    expected_head = 1 - len(packet)
    require(state == len(packet) + 1 and head == expected_head
            and ones == {expected_head + i for i, bit in enumerate(packet) if bit == "1"},
            "writer_endpoint", "Full actual writer has wrong state/head/complete tape")
    exact(receipt, dict(steps=len(packet) + 1, state=len(packet) + 1, head=expected_head,
                       tape=packet, normalized_head=0, frame_min=-len(packet), frame_max=1,
                       both_exteriors_zero=True, actual_and_numeric_replayed=True), "writer_receipt")
    return {"steps": len(packet) + 1, "head": head, "state": state,
            "complete_support_equal": True, "both_exteriors_zero": True}


def toy_inputs():
    cases = [([], [], []), ([1, 2, 3, 4], [], [4, 3, 2, 1]), ([], [[0, 0, 0]], [])]
    cases += [([4], [[tag, 0, 1]], [1, 2]) for tag in range(7)]
    cases += [([4, 1], [[6, 4096, 8191], [5, 1, 0]], [2]),
              ([1, 4], [], []), ([], [], [2, 3]), ([], [[3, 8191, 4096]], [])]
    return cases


def toy_table(case, decoder, expander):
    pre, table, post = case["pre"], case["table"], case["post"]
    letters = inputs(pre, table, post)
    require(len(pre) <= 4 and len(post) <= 4 and len(table) <= 2 and len(letters) <= 100,
            "toy_scope", "Large complete startup simulation forbidden")
    packet = encode_packet(pre, table, post)
    exact(case["packet"], packet, "toy_input")
    exact(case["seed"], seed_for(letters), "toy_input")
    rows = list(composed(packet, decoder, expander, [None, None], 1))
    pairs = [rows[index:index + 2] for index in range(0, len(rows), 2)]
    exact(case["rows"], pairs, "toy_rows")
    meta = allocation(packet, decoder, expander, 1)
    require(case["states"] == len(pairs) == meta["machine_states"] and
            case["body_entry"] == len(pairs) - 1, "toy_allocation", "Toy unpaid state")
    return b"".join(packed(row, len(pairs)) for row in rows), letters, meta


def simulate(raw, meta, cap, budget, progress, origin=0, capture=False):
    integer(cap, 1, MAX_CASE_STEPS + 1, "toy_scope", "Toy step cap")
    progress.update(current_origin=origin, current_cap=cap, current_steps=0)
    state, head, ones, low, high = 0, origin, set(), origin, origin
    boundaries = {meta["writer_states"] - 1: "writer_turn", meta["decoder_done"]: "decoder_success",
                  meta["new_bridge_entry"]: "new_bridge", meta["expander_done"]: "expander_success",
                  meta["old_bridge_entry"]: "old_bridge"}
    snapshots = {}
    for steps in range(cap + 1):
        progress["current_steps"] = steps
        if steps % 2048 == 0:
            budget.check()
        if transition(raw, state, int(head in ones)) is None:
            return {"state": state, "head": head, "steps": steps, "support": sorted(ones),
                    "visited_min": low, "visited_max": high}, snapshots
        if steps == cap:
            raise BudgetFailure("toy_timeout", "Complete startup exhausted per-case cap")
        if capture and state in boundaries:
            snapshots.setdefault(boundaries[state], (state, head, ones.copy()))
        state, head = step(raw, state, head, ones)
        low, high = min(low, head), max(high, head)
        budget.steps += 1
    raise BudgetFailure("toy_timeout", "Unreachable simulation bound")


def toy_endpoint(actual, letters, meta, origin):
    head = origin - meta["packet_bits"] - 16 * len(letters)
    output = field_for(letters)
    require(actual["state"] == meta["body_entry"] and actual["head"] == head,
            "toy_endpoint", "Toy final state/head differs from arithmetic oracle")
    require(actual["support"] == [head + i for i, bit in enumerate(output) if bit == "1"],
            "toy_support", "Toy whole tape or blank exterior differs from original input")
    return output


def decoder_endpoint(snapshot, letters, meta, origin):
    state, head, ones = snapshot
    expected_head = origin - meta["packet_bits"] - 3 * len(letters) - 6
    seed = seed_for(letters)
    require(state == meta["decoder_done"] and head == expected_head,
            "toy_decoder_endpoint", "Decoder success has wrong exact state/head")
    require(ones == {expected_head + index for index, bit in enumerate(seed) if bit == "1"},
            "toy_decoder_support", "Decoder success differs from the complete old seed")


def toy_receipt(case, actual, output):
    for key, value in actual.items():
        exact(case[key], value, "toy_receipt")
    exact(case["output"], output, "toy_output")
    integer(case["frame_min"], -10000000, 1, "toy_frame", "Frame minimum")
    integer(case["frame_max"], 0, 10000001, "toy_frame", "Frame maximum")
    require(case["frame_min"] <= actual["visited_min"] <= actual["visited_max"] <= case["frame_max"],
            "toy_frame", "Native frame does not cover actual visited interval")
    require(case["both_exteriors_zero"] is True and case["actual_native_executed"] is True
            and case["decoder_seed_checked"] is True,
            "toy_scope", "Native fixture execution scope missing")


def rejection(name, action, expected_stage, controls, **detail):
    try:
        action()
    except BudgetFailure:
        raise  # A timeout is never a successful negative control.
    except Failure as error:
        require(error.stage == expected_stage, "negative_stage",
                f"{name}: rejected at {error.stage}, expected {expected_stage}")
        controls.append(dict(name=name, rejected=True, stage=error.stage, reason=str(error),
                             original_positive_passed=True, timeout_counted_as_rejection=False, **detail))
    else:
        raise Failure("negative_escaped", "Deliberate corruption escaped: " + name)


def mutate(raw, state, bit, row):
    changed = bytearray(raw)
    offset = RECORD.size * (2 * state + bit)
    changed[offset:offset + RECORD.size] = RECORD.pack(*row)
    return changed


def controls(payload, raw, expected, packet, meta, decoder_data, inputs_data, toy, budget,
             progress, results, checkpoint):
    receipt = payload["full_rows"]

    def reject(name, action, expected_stage, output, **detail):
        progress.update(current_control=name, current_expected_rejection=expected_stage)
        rejection(name, action, expected_stage, output, **detail)
        checkpoint()

    def row_change(name, state, bit=0, field=0, value=None, stage="row_content"):
        row = list(RECORD.unpack_from(raw, RECORD.size * (2 * state + bit)))
        row[field] = (1 - row[field]) if value is None else value
        changed = mutate(raw, state, bit, row)
        require(changed != raw, "negative_setup", name + ": no actual mutation")
        reject(name, lambda: complete_rows(changed, expected, meta, receipt), stage, results,
                  state=state, bit=bit, replacement=row, scope="all-row exact composition")

    row_change("writer_payload", 0)
    # Swap two different payload states without changing their destinations.
    differing = next(i for i in range(1, len(packet)) if packet[-1 - i] != packet[-1])
    changed = bytearray(raw)
    for state, value in ((0, int(packet[-1 - differing])), (differing, int(packet[-1]))):
        for bit in (0, 1):
            changed = mutate(changed, state, bit, (value, 0, state + 1))
    reject("writer_order", lambda: complete_rows(changed, expected, meta, receipt),
              "row_content", results, scope="all-row exact composition")
    row_change("writer_turn", meta["writer_states"] - 1, field=1)
    for label, kind, field in (("decoder_read", "consume_read", 0),
                               ("decoder_consume", "consume_shift", 1),
                               ("decoder_write", "emit_code", 0)):
        block = next(block for block in decoder_data["blocks"] if block["kind"] == kind)
        row_change(label, meta["decoder_entry"] + block["entry"], field=field)
    state = meta["decoder_entry"]
    old = RECORD.unpack_from(raw, 2 * state * RECORD.size)
    row_change("decoder_dispatch", state, field=2,
               value=meta["decoder_entry"] + (old[2] - meta["decoder_entry"] + 1) % len(decoder_data["rows"]))
    changed = mutate(raw, meta["decoder_done"], 0, (2, 0, 0))
    reject("decoder_success_unpatched", lambda: complete_rows(changed, expected, meta, receipt),
              "row_content", results, scope="all-row exact composition")
    for label, key in (("decoder_success_direction", "decoder_done"),
                       ("new_bridge_direction", "new_bridge_entry"),
                       ("expander_success_direction", "expander_done"),
                       ("old_bridge_direction", "old_bridge_entry")):
        row_change(label, meta[key], field=1)
    row_change("old_expander_write", meta["expander_entry"])
    body_state, body_bit = next(divmod(index, 2) for index, row in enumerate(RECORD.iter_unpack(raw))
                               if index // 2 >= meta["body_entry"] and row[0] < 2)
    row_change("relocated_body_write", body_state, bit=body_bit)
    body_row = RECORD.unpack_from(raw, (2 * body_state + body_bit) * RECORD.size)
    row_change("relocated_body_destination", body_state, bit=body_bit, field=2,
               value=meta["body_entry"] + (body_row[2] - meta["body_entry"] + 1) % BODY_STATES)
    row_change("unpaid_destination", body_state, bit=body_bit, field=2,
               value=meta["machine_states"], stage="row_encoding")
    halt_state, halt_bit = next(divmod(index, 2) for index, row in enumerate(RECORD.iter_unpack(raw))
                               if row[0] == 2)
    changed = mutate(raw, halt_state, halt_bit, (halt_bit, 1, halt_state))
    reject("body_halt_removed", lambda: complete_rows(changed, expected, meta, receipt),
           "row_content", results, scope="all-row exact composition")
    changed = mutate(raw, halt_state, halt_bit, (2, 1, 0))
    reject("noncanonical_halt", lambda: complete_rows(changed, expected, meta, receipt),
           "row_encoding", results)
    row_change("decoder_error_control", meta["decoder_error"], field=1)
    reject("omitted_row", lambda: complete_rows(raw[:-6], expected, meta, receipt), "row_extent", results)
    reject("omitted_state", lambda: complete_rows(raw[:-12], expected, meta, receipt), "row_extent", results)
    reject("extra_row", lambda: complete_rows(raw + raw[:6], expected, meta, receipt), "row_extent", results)
    changed_meta = dict(meta, machine_states=meta["machine_states"] - 1)
    reject("unpaid_count", lambda: exact(changed_meta, meta, "allocation"), "allocation", results)
    bad_writer = dict(payload["writer"], head=payload["writer"]["head"] + 1)
    reject("writer_head_receipt", lambda: writer(raw, packet, bad_writer, budget), "writer_receipt", results)
    source, original, symbols, seed = inputs_data
    bad_payload = dict(payload, packet=packet[:13] + str(1 - int(packet[13])) + packet[14:])
    reject("changed_full_packet", lambda: static_input(bad_payload, source, original, symbols, seed),
              "input_packet", results)
    bad_source = copy.deepcopy(source)
    bad_source["rows"][0][0] = (bad_source["rows"][0][0] + 1) % 7
    reject("changed_original_input", lambda: static_input(payload, bad_source, original, symbols, seed),
              "source_symbols", results)
    case, toy_raw, letters, toy_meta, actual, snapshots = toy
    output = field_for(letters)
    for name, key, value in (("toy_head", "head", actual["head"] + 1),
                             ("toy_far_exterior", "support", actual["support"] + [1000000]),
                             ("toy_runtime", "steps", actual["steps"] + 1)):
        bad_case = dict(case, **{key: value})
        reject(name, lambda bad_case=bad_case: toy_receipt(bad_case, actual, output),
                  "toy_receipt", results, scope="native/Python complete execution receipt")
    bad_case = dict(case, output="1" + output[1:] if output[0] == "0" else "0" + output[1:])
    reject("toy_output", lambda: toy_receipt(bad_case, actual, output), "toy_output", results)
    final_state, final_head, final_ones = snapshots["old_bridge"]
    final_bit = int(final_head in final_ones)
    final_row = list(RECORD.unpack_from(toy_raw, (2 * final_state + final_bit) * RECORD.size))
    for name, field, expected_stage in (("complete_toy_bridge_write", 0, "toy_support"),
                                         ("complete_toy_bridge_head", 1, "toy_endpoint")):
        replacement = list(final_row)
        replacement[field] = 1 - replacement[field]
        changed = mutate(toy_raw, final_state, final_bit, replacement)

        def changed_complete_path():
            endpoint, _ = simulate(changed, toy_meta, actual["steps"] + 1, budget, progress)
            toy_endpoint(endpoint, letters, toy_meta, 0)

        reject(name, changed_complete_path, expected_stage, results,
               scope="complete blank toy execution with a changed final bridge row")
    # Boundary behavior uses reached configurations from a complete passing toy.
    # Each positive one-step oracle checks full support, exact head and control.
    for name, snapshot in snapshots.items():
        state, head, ones = snapshot
        direction = -1 if name in ("new_bridge", "old_bridge") else 1
        destination = {"writer_turn": toy_meta["decoder_entry"],
                       "decoder_success": toy_meta["new_bridge_entry"],
                       "new_bridge": toy_meta["expander_entry"],
                       "expander_success": toy_meta["old_bridge_entry"],
                       "old_bridge": toy_meta["body_entry"]}[name]

        def boundary(candidate):
            tape = ones.copy()
            target, new_head = step(candidate, state, head, tape)
            require(target == destination and new_head == head + direction and tape == ones,
                    "boundary_behavior", "Paid boundary failed exact one-step geometry")

        boundary(toy_raw)
        bit = int(head in ones)
        replacement = list(RECORD.unpack_from(toy_raw, (2 * state + bit) * RECORD.size))
        replacement[1] = 1 - replacement[1]
        changed = mutate(toy_raw, state, bit, replacement)
        reject("behavior_" + name, lambda: boundary(changed), "boundary_behavior", results,
                  scope="reached complete-toy context, exact one-step tape/head/control")
    require(len(snapshots) == 5, "negative_setup", "Did not reach every paid boundary")
    require(len({item["name"] for item in results}) == len(results), "negative_setup", "Duplicate controls")
    return results


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--work", type=Path, default=WORK)
    args = parser.parse_args()
    args.work.mkdir(parents=True, exist_ok=True)
    require(not any((args.work / name).exists() for name in OWNED), "output", "Refusing to overwrite evidence")
    budget, progress = Budget(), {"phase": "load", "status": "running"}
    report = {"status": "running", "new_accepted_machine": False, "universal_proof": False,
              "scope": "Complete actual row equality and bounded finite execution; acceptance is separate",
              "full_quadratic_startup_executed": False, "accepted_states_before_this_run": 998176,
              "pinned_inputs": {name: expected for name, (_, expected) in PINS.items()},
              "run_id": os.environ.get("GITHUB_RUN_ID"), "commit": os.environ.get("GITHUB_SHA"),
              "artifact_sha256": {"checker": sha(Path(__file__).read_bytes())},
              "limits": {"wall_seconds": WALL_SECONDS, "memory_bytes": MEMORY_BYTES,
                         "per_case_steps": MAX_CASE_STEPS, "batch_steps": MAX_BATCH_STEPS}}
    records, mutation_records = [], []
    report["composed_fixtures"] = records
    report["mutation_controls"] = mutation_records

    def checkpoint():
        report.update(completed_fixtures=len(records), completed_controls=len(mutation_records),
                      total_simulated_steps=budget.steps, elapsed_seconds=time.monotonic() - budget.started)
        save(args.work / "fixtures-detail.json", report)
        save(args.work / "fixtures-progress.json", progress)

    try:
        _, hard = resource.getrlimit(resource.RLIMIT_AS)
        limit = MEMORY_BYTES if hard == resource.RLIM_INFINITY else min(hard, MEMORY_BYTES)
        resource.setrlimit(resource.RLIMIT_AS, (limit, limit))
        require((args.work / "machine-export.json").stat().st_size <= 128 * 1024 * 1024,
                "input_size", "Native JSON exceeds explicit memory-safe read bound")
        export_raw = (args.work / "machine-export.json").read_bytes()
        report["artifact_sha256"]["machine-export.json"] = sha(export_raw)
        payload = read_json(export_raw)
        require(payload["schema"] == "chess-table-seed-full-v1", "schema", "Wrong complete export")
        source = read_json(pinned("source-input.json"))
        original = read_json(pinned("original-machine"))
        symbols, seed = pinned("source-symbols.u8"), pinned("decoded-seed.bits").decode("ascii")
        packet, report["static_input"] = static_input(payload, source, original, symbols, seed)
        decoder_data, expander_data = read_json(pinned("decoder")), read_json(pinned("expander"))
        decoder = controller(decoder_data, 21682, 21680)
        expander = controller(expander_data, 216, 214)
        exact(payload["decoder_rows"], decoder, "decoder_identity")
        exact(payload["expander_rows"], expander, "expander_identity")
        meta = allocation(packet, decoder, expander, BODY_STATES)
        exact(payload["metadata"], meta, "allocation")
        require(meta["machine_states"] == 769344, "allocation", "Full target count changed")
        progress.update(phase="all_rows")
        save(args.work / "fixtures-progress.json", progress)
        expected = b"".join(packed(row, meta["machine_states"]) for row in
                            composed(packet, decoder, expander, body_rows(pinned("body-rows.jsonl")), BODY_STATES))
        raw = (args.work / "full-rows.bin").read_bytes()
        report["artifact_sha256"]["full-rows.bin"] = sha(raw)
        report["complete_row_census"] = complete_rows(raw, expected, meta, payload["full_rows"])
        progress.update(phase="full_writer")
        checkpoint()
        report["writer"] = writer(raw, packet, payload["writer"], budget)
        cases = payload["complete_startup_fixtures"]
        inventory = [(case["pre"], case["table"], case["post"]) for case in cases]
        exact(inventory, toy_inputs(), "toy_inventory")
        exact([case["name"] for case in cases], ["empty", "letters", "zero"] +
              [f"tag_{tag}" for tag in range(7)] + ["boundaries", "pre_only", "post_only", "row_only"],
              "toy_inventory")
        first_toy = None
        for index, case in enumerate(cases):
            progress.update(phase="complete_toys", current_case=index, current_steps=0,
                            current_cap=case["step_cap"], completed=len(records))
            save(args.work / "fixtures-progress.json", progress)
            toy_raw, letters, toy_meta = toy_table(case, decoder, expander)
            actual, snapshots = simulate(toy_raw, toy_meta, case["step_cap"], budget, progress, capture=True)
            require("decoder_success" in snapshots, "toy_decoder_endpoint", "Decoder success never reached")
            decoder_endpoint(snapshots["decoder_success"], letters, toy_meta, 0)
            output = toy_endpoint(actual, letters, toy_meta, 0)
            toy_receipt(case, actual, output)
            records.append(dict(index=index, name=case["name"], origin=0, letters=len(letters),
                                states=toy_meta["machine_states"], decoder_seed_verified=True,
                                all_rows_equal=True, complete_support_equal=True, **actual))
            checkpoint()
            if index == 0:
                first_toy = (case, toy_raw, letters, toy_meta, actual, snapshots)
            if index in (0, 2, 10):
                for origin in (-37, 101):
                    moved, _ = simulate(toy_raw, toy_meta, case["step_cap"], budget, progress, origin=origin)
                    toy_endpoint(moved, letters, toy_meta, origin)
                    require(moved["steps"] == actual["steps"] and
                            moved["visited_min"] == actual["visited_min"] + origin and
                            moved["visited_max"] == actual["visited_max"] + origin,
                            "toy_translation", "Translated complete execution mismatch")
                    records.append(dict(index=index, name=case["name"], origin=origin, letters=len(letters),
                                        states=toy_meta["machine_states"], all_rows_equal=True,
                                        complete_support_equal=True, **moved))
                    checkpoint()
        progress.update(phase="mutation_controls", completed=len(records), current_steps=0)
        save(args.work / "fixtures-progress.json", progress)
        controls(payload, raw, expected, packet, meta, decoder_data,
                 (source, original, symbols, seed), first_toy, budget, progress, mutation_records, checkpoint)
        budget.check()
        report.update(status="passed", states=meta["machine_states"], previous_states=998176,
                      saved_states=998176 - meta["machine_states"], allocation=meta,
                      initializer_states=meta["writer_states"], decoder_states=meta["decoder_states"],
                      decoder_bridge_states=meta["new_bridge_states"], seed_controller_states=meta["expander_states"],
                      seed_bridge_states=meta["old_bridge_states"], body_states=meta["body_states"],
                      complete_full_rows_verified=True, complete_full_rows_checked=2 * meta["machine_states"],
                      static_full_input_verified=True, initializer_verified=True, composed_fixtures_verified=True,
                      composed_fixture_count=len(records), native_fixture_count=len(cases),
                      negative_control_count=len(report["mutation_controls"]), positive_controls_ran_first=True,
                      timeouts_counted_as_rejections=0,
                      artifact_sha256={"machine-export.json": sha(export_raw), "full-rows.bin": sha(raw),
                                       "checker": sha(Path(__file__).read_bytes())},
                      pinned_inputs={name: expected for name, (_, expected) in PINS.items()},
                      run_id=os.environ.get("GITHUB_RUN_ID"), commit=os.environ.get("GITHUB_SHA"))
    except BaseException as error:
        report.update(status="failed", first_failure={"stage": getattr(error, "stage", "unexpected"),
                      "reason": str(error), "exception": type(error).__name__, "progress": progress.copy()})
        save(args.work / "fixtures-failure.json", dict(report["first_failure"], traceback=traceback.format_exc()))
        raise
    finally:
        report.update(elapsed_seconds=time.monotonic() - budget.started, total_simulated_steps=budget.steps,
                      maximum_fixture_steps=max((record["steps"] for record in records), default=0),
                      completed_fixtures=len(records), peak_rss_kib=resource.getrusage(resource.RUSAGE_SELF).ru_maxrss)
        save(args.work / "fixtures-progress.json", progress)
        save(args.work / "fixtures-detail.json", report)
    print(BANNER)


if __name__ == "__main__":
    main()
