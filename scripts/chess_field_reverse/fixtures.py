#!/usr/bin/env python3
"""Remote-only independent replay of every actual reverse initializer and body row.

The numeric recipe here is ordinary Python, separate from the Lean getters,
CompactPost, Binary, and ReverseInit implementations. Finite tests supplement the
universal kernel proofs; they do not establish an unbounded simulation theorem.
"""

import copy
import bisect
import hashlib
import json
import os
from pathlib import Path
import struct
import tempfile


ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / ".lake/chess-field-reverse"
PREVIOUS_STATES = 4742562
PREFIX_RECORD = struct.Struct("<BBI")
PREFIX_FORMAT = "binary:<BBI(write:u8,direction:u8,next:u32le)"
OP_NAMES = ("move", "write", "load", "pure_load", "marker", "absent", "branch", "jump", "halt")


def require(condition, message):
    if not condition:
        raise AssertionError(message)


def integer(value, lower, upper, context):
    require(type(value) is int and lower <= value < upper, (context, value, lower, upper))


def table(values, size, bound, context):
    require(isinstance(values, list) and len(values) == size, (context, "table size"))
    for value in values:
        integer(value, 0, bound, context)


def validate_op(op, label, labels):
    require(isinstance(op, list) and op, (label, "empty source operation"))
    tag = op[0]
    integer(tag, 0, 9, (label, "source tag"))
    lengths = (3, 4, 4, 3, 3, 4, 4, 2, 1)
    require(len(op) == lengths[tag], (label, "source arity", tag))
    if tag == 0:
        require(type(op[1]) is int and op[1] in (-1, 1), (label, "source direction"))
    if tag in (1, 2, 5):
        integer(op[1], 0, 4, (label, "source field"))
    if tag in (1, 2):
        table(op[2], 25 if tag == 2 else 5, 5, (label, "source value"))
    elif tag == 3:
        table(op[1], 5, 5, (label, "source pure load"))
    elif tag == 6:
        table(op[1], 5, 2, (label, "source test"))
    elif tag == 7:
        table(op[1], 5, labels, (label, "source dispatch"))
    if tag in (0, 1, 2, 3):
        integer(op[-1], 0, labels, (label, "source continuation"))
    elif tag in (4, 5, 6):
        for target in op[-2:]:
            integer(target, 0, labels, (label, "source branch continuation"))


def validate_node(node, index, label, labels):
    require(isinstance(node, list) and node, (label, index, "empty syntax node"))
    tag = node[0]
    integer(tag, 0, 6, (label, index, "syntax tag"))
    require(len(node) == (3, 3, 3, 4, 2, 1)[tag], (label, index, "syntax arity"))
    if tag == 0:
        require(type(node[1]) is int and node[1] in (-1, 1), (label, index, "syntax direction"))
    if tag in (1, 2, 3, 4):
        table(node[1], 10, 5 if tag == 2 else labels if tag == 4 else 2,
              (label, index, "finite observable table"))
    children = node[-2:] if tag == 3 else node[-1:] if tag in (0, 1, 2) else []
    for child in children:
        integer(child, 0, index, (label, index, "postorder child"))


class NumericMachine:
    """Prefix packing, Post and Binary rebuilt independently from exported local syntax."""

    def __init__(self, data):
        require(data.get("schema") == "chess-field-reverse-v1", "Unexpected native schema")
        self.data = data
        self.meta = data["metadata"]
        self.labels, self.stores = 4042, 5
        require((self.meta["labels"], self.meta["stores"],
                 self.meta["cell_bits"]) == (self.labels, self.stores, 13),
                "Unexpected complete-program dimensions")
        self.ops, self.syntax, self.entries = data["operations"], data["syntax"], data["entries"]
        require(len(self.ops) == len(self.syntax) == len(self.entries) == self.labels,
                "Missing or duplicated source row")
        self.offsets = [0]
        self.row_sizes = []
        for label, (op, nodes, entry) in enumerate(zip(self.ops, self.syntax, self.entries)):
            validate_op(op, label, self.labels)
            require(isinstance(nodes, list) and 0 < len(nodes), (label, "empty actual source row"))
            for index, node in enumerate(nodes):
                validate_node(node, index, label, self.labels)
            self.offsets.append(self.offsets[-1] + len(nodes))
            self.row_sizes.append(len(nodes))
            require(type(entry) is int and entry == self.offsets[-1] - 1,
                    (label, "getter entry differs from actual postorder root"))
        require(data["row_sizes"] == self.row_sizes and
                all(type(value) is int for value in data["row_sizes"]),
                "Native row sizes differ from actual syntax")
        require(data["prefix_offsets"] == self.offsets and
                all(type(value) is int for value in data["prefix_offsets"]),
                "Native prefix offsets differ from independent prefix sum")
        self.bits = data["bits"]
        require(isinstance(self.bits, str) and self.bits and set(self.bits) <= {"0", "1"},
                "Paid input is not a nonempty binary string")
        self.graph_nodes = self.offsets[-1]
        self.max_row_size = max(self.row_sizes)
        self.post_states = 1 + self.graph_nodes * self.stores
        self.body_states = 2 * self.post_states
        self.prefix = len(self.bits) + 1
        self.states = self.prefix + self.body_states
        self.initial_raw = 1 + self.entries[0] * self.stores
        self.halt_state = self.initial_raw
        expected = {"graph_nodes": self.graph_nodes, "post_states": self.post_states,
                    "body_states": self.body_states, "generated_states": self.states,
                    "machine_states": self.states, "row_machine_states": self.states,
                    "bits_count": len(self.bits), "initial_raw": self.initial_raw,
                    "initial_encoded": 0, "halt_encoded": self.halt_state,
                    "body_entry": self.prefix, "actions_count": self.prefix}
        for name, value in expected.items():
            require(type(self.meta[name]) is int and self.meta[name] == value,
                    ("allocation/dispatch", name, self.meta[name], value))
        require(self.states < PREVIOUS_STATES, ("candidate is not strictly smaller", self.states))
        self.counts = {
            "source_labels": self.labels, "slots_per_label": "actual syntax row size",
            "meaningful_nodes": self.graph_nodes, "padding_nodes": 0,
            "all_graph_nodes": self.graph_nodes, "stores_per_node": self.stores,
            "live_node_store_controls": self.graph_nodes * self.stores,
            "shared_halt_controls": 1, "post_controls": self.post_states,
            "binary_main_controls": self.post_states, "binary_bounce_controls": self.post_states,
            "body_controls": self.body_states, "initializer_write_controls": len(self.bits),
            "initializer_reverse_write_controls": len(self.bits),
            "initializer_final_right_controls": 1, "initializer_restore_controls": 0,
            "initializer_controls": self.prefix,
            "total_controls": self.states,
        }
        self.boundaries = {}
        for label, entry in enumerate(self.entries):
            for store in range(self.stores):
                state = self.prefix + self.encode(entry, store)
                require(state not in self.boundaries, "Source entry/store controls collided")
                self.boundaries[state] = (label, store)
        self.post_cache = {}

    def swap(self, value):
        return self.initial_raw if value == 0 else 0 if value == self.initial_raw else value

    def encode(self, node, store):
        return self.swap(0 if node is None else 1 + node * self.stores + store)

    def node(self, index):
        label, local = self.local(index)
        return self.syntax[label][local]

    def local(self, index):
        integer(index, 0, self.graph_nodes, "graph node outside exact allocation")
        label = bisect.bisect_right(self.offsets, index) - 1
        return label, index - self.offsets[label]

    def global_node(self, index):
        node = self.node(index)
        label, _ = self.local(index)
        base = self.offsets[label]
        if node[0] in (0, 1, 2):
            return node[:-1] + [base + node[-1]]
        if node[0] == 3:
            return node[:-2] + [base + node[-2], base + node[-1]]
        return node

    def post_row(self, state, bit):
        key = state, bit
        if key in self.post_cache:
            return self.post_cache[key]
        raw = self.swap(state)
        if raw == 0:
            result = None
        else:
            node, store = divmod(raw - 1, self.stores)
            for _ in range(self.max_row_size + 1):
                instruction = self.node(node)
                tag = instruction[0]
                label, _ = self.local(node)
                base = self.offsets[label]
                if tag == 0:
                    result = (self.encode(base + instruction[2], store), "move", instruction[1])
                    break
                if tag == 1:
                    result = (self.encode(base + instruction[2], store), "write",
                              instruction[1][bit * self.stores + store])
                    break
                if tag == 2:
                    store = instruction[1][bit * self.stores + store]
                    node = base + instruction[2]
                elif tag == 3:
                    branch = instruction[1][bit * self.stores + store]
                    node = base + instruction[2 if branch else 3]
                elif tag == 4:
                    target = instruction[1][bit * self.stores + store]
                    result = (self.encode(self.entries[target], store), "write", bit)
                    break
                elif tag == 5:
                    result = (self.encode(None, store), "write", bit)
                    break
                else:
                    raise AssertionError("Unrecognized numeric syntax instruction")
            else:
                raise AssertionError("Pure dispatch did not descend in postorder")
        self.post_cache[key] = result
        return result

    def row(self, state, bit):
        require(0 <= state < self.states and bit in (0, 1), ("numeric row bounds", state, bit))
        count = len(self.bits)
        if state < count:
            return [ord(self.bits[count - 1 - state]) - 48, -1, state + 1]
        if state < self.prefix:
            return [bit, 1, state + 1]
        body = state - self.prefix
        if body >= self.post_states:
            return [bit, -1, self.prefix + body - self.post_states]
        post = self.post_row(body, bit)
        if post is None:
            return None
        target, kind, value = post
        if kind == "move":
            return [bit, value, self.prefix + target]
        return [value, 1, self.prefix + self.post_states + target]


def validate_native_samples(model):
    data = model.data
    getter_seen = set()
    for index, actual in data["getter_samples"]:
        integer(index, 0, model.graph_nodes, "native getter probe")
        require(actual == model.global_node(index), ("actual getter/local syntax mismatch", index))
        getter_seen.add(index)
    require(len(data["getter_samples"]) == model.graph_nodes and
            getter_seen == set(range(model.graph_nodes)),
            "Native getter export omits or duplicates an actual packed node")
    seen = set()
    shared_halt = {}
    halt_controls = {model.prefix + model.halt_state,
                     model.prefix + model.post_states + model.halt_state}
    for state, bit, actual, independently_assembled in data["samples"]:
        integer(state, 0, model.states, "native sample state")
        integer(bit, 0, 2, "native sample bit")
        expected = model.row(state, bit)
        require(actual == independently_assembled, ("actual machine/rowMachine mismatch", state, bit))
        require(actual == expected, ("actual native numeric row/independent recipe", state, bit,
                                     actual, expected))
        seen.add((state, bit))
        if state in halt_controls:
            shared_halt[state, bit] = {"state": state, "bit": bit, "actual": actual,
                                       "rowMachine": independently_assembled,
                                       "independent_recipe": expected}
    for state in model.boundaries:
        require((state, 0) in seen and (state, 1) in seen,
                ("missing all-label/all-store entry sample", state))
        bounce = state + model.post_states
        require((bounce, 0) in seen and (bounce, 1) in seen,
                ("missing all-label/all-store bounce sample", bounce))
    count = len(model.bits)
    for state in (0, 1, count // 2, count - 1, count, count + 1, model.prefix - 1,
                  model.prefix, model.prefix + model.post_states - 1,
                  model.prefix + model.post_states, model.prefix + model.halt_state,
                  model.prefix + model.post_states + model.halt_state, model.states - 1):
        require((state, 0) in seen and (state, 1) in seen,
                ("missing numeric boundary/initializer probes", state))
    require(set(shared_halt) == {(state, bit) for state in halt_controls for bit in (0, 1)},
            "Missing explicit shared-halt main/bounce evidence")
    return len(data["samples"]), len(seen), [shared_halt[key] for key in sorted(shared_halt)]


def check_body_record(model, record, line_index):
    """One unchanged row oracle, also used by native artifact corruption controls."""
    state, bit = model.prefix + line_index // 2, line_index % 2
    require(isinstance(record, list) and len(record) == 3, (line_index, "body JSONL arity"))
    actual_state, actual_bit, actual = record
    require(type(actual_state) is int and type(actual_bit) is int and
            (actual_state, actual_bit) == (state, bit),
            (line_index, "body ordering/duplicate/omission", actual_state, actual_bit, state, bit))
    if actual is not None:
        require(isinstance(actual, list) and len(actual) == 3, (state, bit, "body row arity"))
        integer(actual[0], 0, 2, (state, bit, "body write"))
        require(type(actual[1]) is int and actual[1] in (-1, 1), (state, bit, "body direction"))
        integer(actual[2], model.prefix, model.states, (state, bit, "body target"))
    expected = model.row(state, bit)
    require(actual == expected, ("complete native body/independent recipe", state, bit,
                                 actual, expected))
    return actual


def check_prefix_record(model, raw_record, record_index):
    """The same raw-record oracle checks the full stream and hostile actual records."""
    integer(record_index, 0, 2 * model.prefix, "prefix implicit record index")
    require(isinstance(raw_record, bytes) and len(raw_record) == PREFIX_RECORD.size,
            (record_index, "prefix record size"))
    state, bit = divmod(record_index, 2)
    write, direction, target = PREFIX_RECORD.unpack(raw_record)
    integer(write, 0, 2, (state, bit, "prefix write"))
    integer(direction, 0, 2, (state, bit, "prefix direction byte"))
    integer(target, 0, model.states, (state, bit, "prefix target"))
    actual = [write, 1 if direction else -1, target]
    # This recipe uses the literal input bits, never an exported action array.
    expected = model.row(state, bit)
    require(actual == expected, ("complete native prefix/independent reverse recipe",
                                 state, bit, actual, expected))
    return actual


def validate_prefix_rows(model, prefix_path):
    declared = model.data["prefix_rows"]
    expected = {
        "filename": "prefix-rows.bin", "format": PREFIX_FORMAT, "record_bytes": 6,
        "direction_left": 0, "direction_right": 1,
        "target_bound_exclusive": 4294967296,
        "order": "state-major,bit-0-before-1", "first_state": 0,
        "state_limit": model.prefix, "states": model.prefix, "rows": 2 * model.prefix,
        "bits_per_state": 2, "missing_rows": 0, "bytes": 12 * model.prefix,
        "native_machine_rowMachine_equal": True,
    }
    for key, value in expected.items():
        require(declared[key] == value and type(declared[key]) is type(value),
                ("complete prefix native coverage", key, declared[key], value))
    digest, byte_count, rows, control_records = hashlib.sha256(), 0, 0, {}
    with prefix_path.open("rb") as stream:
        while True:
            block = stream.read(PREFIX_RECORD.size * 65536)
            if not block:
                break
            digest.update(block)
            byte_count += len(block)
            require(len(block) % PREFIX_RECORD.size == 0,
                    ("Complete native prefix has partial record", byte_count))
            for offset in range(0, len(block), PREFIX_RECORD.size):
                require(rows < 2 * model.prefix, "Complete native prefix has extra rows")
                raw_record = block[offset:offset + PREFIX_RECORD.size]
                check_prefix_record(model, raw_record, rows)
                if rows == 0:
                    control_records["write"] = (rows, raw_record)
                    control_records["direction"] = (rows, raw_record)
                if rows == 2 * len(model.bits) + 1:
                    control_records["final_turn"] = (rows, raw_record)
                rows += 1
    require(rows == 2 * model.prefix, ("Complete native prefix truncated", rows))
    require(byte_count == 12 * model.prefix, ("Complete native prefix byte count", byte_count))
    return {
        "filename": prefix_path.name, "format": PREFIX_FORMAT, "record_bytes": 6,
        "target_bound_exclusive": 4294967296,
        "sha256": digest.hexdigest(), "bytes": byte_count, "first_state": 0,
        "state_limit": model.prefix, "states_checked": model.prefix,
        "rows_checked": rows, "bits_per_state": 2,
        "order": "state-major,bit-0-before-1", "missing_rows": 0,
        "all_actual_prefix_states_and_bits_checked": True,
        "native_machine_rowMachine_equal": True, "independent_python_recipe_equal": True,
        "retained_artifact": True,
    }, control_records


def validate_body_rows(model, body_path):
    declared = model.data["body_rows"]
    expected = {
        "filename": "body-rows.jsonl",
        "format": "jsonl:[absolute_state,bit,null-or-[write,direction,absolute_next]]",
        "order": "state-major,bit-0-before-1", "first_state": model.prefix,
        "state_limit": model.states, "states": model.body_states,
        "rows": 2 * model.body_states, "bits_per_state": 2,
        "native_machine_rowMachine_equal": True,
    }
    for key, value in expected.items():
        require(declared[key] == value and type(declared[key]) is type(value),
                ("complete body native coverage", key, declared[key], value))
    digest, byte_count, rows, missing = hashlib.sha256(), 0, 0, 0
    missing_records, control_records = [], {}
    with body_path.open("rb") as stream:
        for line_index, line in enumerate(stream):
            require(line_index < 2 * model.body_states, "Complete native body has extra rows")
            require(line.endswith(b"\n"), (line_index, "body line lacks final newline"))
            digest.update(line)
            byte_count += len(line)
            record = json.loads(line)
            actual = check_body_record(model, record, line_index)
            rows += 1
            if actual is None:
                missing += 1
                missing_records.append(record)
            # Retain representative actual records solely for targeted hostile controls.
            if actual is not None and "transition" not in control_records:
                control_records["transition"] = (line_index, record)
            if record[0] >= model.prefix + model.post_states and "bounce" not in control_records:
                control_records["bounce"] = (line_index, record)
    require(rows == 2 * model.body_states, ("Complete native body truncated", rows))
    require(type(declared["missing_rows"]) is int and declared["missing_rows"] == missing,
            "Native missing-row coverage differs")
    require(missing_records == [[model.prefix + model.halt_state, bit, None] for bit in (0, 1)],
            ("Exactly the two shared-halt main rows must be missing", missing_records))
    report = {
        "filename": body_path.name, "sha256": digest.hexdigest(), "bytes": byte_count,
        "first_state": model.prefix, "state_limit": model.states,
        "states_checked": model.body_states, "rows_checked": rows, "bits_per_state": 2,
        "order": "state-major,bit-0-before-1", "missing_rows": missing_records,
        "all_actual_body_states_and_bits_checked": True,
        "native_machine_rowMachine_equal": True,
        "independent_python_recipe_equal": True,
        "retained_artifact": True,
    }
    control_records["missing"] = (2 * model.halt_state, missing_records[0])
    return report, control_records


def replay_initializer(bits):
    """Literal-bit schedule on a physical frame that includes negative coordinates."""
    count = len(bits)
    tape = bytearray(count + 2)  # Physical [-count,1]; array offset is count.
    state = head = 0
    for tick in range(count + 1):
        require(-count <= head <= 1, ("independent initializer frame", tick, head))
        index = head + count
        if state < count:
            write, direction, state = ord(bits[count - 1 - state]) - 48, -1, state + 1
        else:
            require(state == count, ("independent final turn state", tick, state))
            write, direction, state = tape[index], 1, state + 1
        tape[index] = write
        head += direction
    normalized = bytes(value + 48 for value in tape[1:count + 1]).decode("ascii")
    require((state, head) == (count + 1, 1 - count),
            "Independent initializer body entry/physical head")
    require(normalized == bits and tape[0] == tape[-1] == 0,
            "Independent initializer normalized tape/blank exterior")
    return {"steps": count + 1, "state": state, "head": head, "normalized_head": 0,
            "tape": normalized, "left_blank": tape[0], "right_blank": tape[-1],
            "frame_min": -count, "frame_max": 1}


def check_initializer_result(bits, result, context):
    require(result["native_machine_and_rowMachine_replayed"] is True,
            (context, "Actual initializer lacks native machine/rowMachine comparison"))
    expected = replay_initializer(bits)
    for key, value in expected.items():
        require(type(result[key]) is type(value) and result[key] == value,
                (context, "actual/independent initializer", key, result[key], value))
    return expected


def validate_initializer(model):
    data, bits = model.data, model.bits
    source = data["source_cells"]
    require(isinstance(source, str) and len(source) % 5 == 0, "Malformed native source cells")
    require(len(source) // 5 == model.meta["source_cells_count"], "Source cell count mismatch")
    words = ["".join(str((value >> bit) & 1) for bit in range(3)) for value in range(5)]
    pieces = []
    for index in range(0, len(source), 5):
        marker, fields = source[index], source[index + 1:index + 5]
        require(marker in "01" and all(value in "01234" for value in fields),
                ("invalid source cell", index // 5))
        pieces.append("".join(words[ord(value) - 48] for value in fields) + marker)
    require("".join(pieces) == bits, "Actual paid bits differ from independent source-cell encoding")
    result = check_initializer_result(bits, data["initializer"], "full frozen initializer")
    return {"steps": model.prefix, "body_entry": result["state"], "head": result["head"],
            "physical_head": result["head"], "normalized_head": 0,
            "frame_min": -len(bits), "frame_max": 1,
            "bits": len(bits), "source_cells": len(source) // 5,
            "bits_sha256": hashlib.sha256(bits.encode("ascii")).hexdigest(),
            "source_cells_sha256": hashlib.sha256(source.encode("ascii")).hexdigest(),
            "normalized_tape_sha256": hashlib.sha256(result["tape"].encode("ascii")).hexdigest(),
            "left_blank": 0, "right_blank": 0,
            "native_machine_and_rowMachine_replayed": True,
            "independent_all_steps_replayed": True,
            "outside_frame": "Blank outside physical [-bits_count,1]; both frame endpoints blank"}


def validate_initializer_edges(data):
    literal = [("empty", ""), ("singleton_zero", "0"), ("singleton_one", "1"),
               ("leading_zero", "011"), ("trailing_zero", "110"), ("mixed", "010110")]
    edges = data["initializer_edges"]
    require(isinstance(edges, list) and len(edges) == len(literal), "Missing initializer edges")
    checked = []
    for edge, (name, bits) in zip(edges, literal):
        require((edge["name"], edge["bits"]) == (name, bits), "Initializer literal edge mismatch")
        require(type(edge["machine_states"]) is int and edge["machine_states"] == len(bits) + 2,
                (name, "Actual toy initializer allocation"))
        require(edge["generic_schedule_actual_machine"] is True, "Missing actual generic edge run")
        result = check_initializer_result(bits, edge["initializer"], name)
        checked.append({"name": name, "bits": bits, "steps": result["steps"],
                        "physical_head": result["head"], "normalized_tape": result["tape"],
                        "actual_generic_machine": True, "independent_replay": True})
    return checked


def put_cell(tape, cell, marker, fields):
    base = 13 * cell
    for field, value in enumerate(fields):
        for bit in range(3):
            position = base + 3 * field + bit
            if (value >> bit) & 1:
                tape[position] = 1
            else:
                tape.pop(position, None)
    if marker:
        tape[base + 12] = 1
    else:
        tape.pop(base + 12, None)


def input_tape(label, store, marker, active, value):
    tape = {-79: 1, 97: 1, 173: 1}
    for cell in (-3, -2, -1, 1, 2, 3):
        fields = [1 + (label + 3 * store + cell * cell + field * 3) % 4 for field in range(4)]
        put_cell(tape, cell, (label + cell + store) % 2, fields)
    fields = [1 + (label + store + 2 * field + marker) % 4 for field in range(4)]
    fields[active] = value
    put_cell(tape, 0, marker, fields)
    return tape, fields


def source_result(op, tape, fields, store, marker):
    """One source Op, with no reference to lower, local nodes, or numeric states."""
    tag, expected, head, next_label, result_store = op[0], tape.copy(), 0, None, store
    if tag == 0:
        head, next_label = 13 * op[1], op[2]
    elif tag == 1:
        field, values, next_label = op[1:]
        updated = fields.copy()
        updated[field] = values[store]
        put_cell(expected, 0, marker, updated)
    elif tag == 2:
        field, values, next_label = op[1:]
        result_store = values[5 * store + fields[field]]
    elif tag == 3:
        result_store, next_label = op[1][store], op[2]
    elif tag == 4:
        next_label = op[1] if marker else op[2]
    elif tag == 5:
        next_label = op[2] if fields[op[1]] == 0 else op[3]
    elif tag == 6:
        next_label = op[2] if op[1][store] else op[3]
    elif tag == 7:
        next_label = op[1][store]
    else:
        require(tag == 8, "Unsupported independent source semantics")
    return expected, head, next_label, result_store


def run_case(model, label, store, marker, value):
    op = model.ops[label]
    active = op[1] if op[0] in (1, 2, 5) else label % 4
    before, fields = input_tape(label, store, marker, active, value)
    expected_tape, expected_head, expected_label, expected_store = source_result(
        op, before, fields, store, marker)
    tape, state, head = before.copy(), model.prefix + model.encode(model.entries[label], store), 0
    budget = 4 * len(model.syntax[label]) + 8
    for ticks in range(budget + 1):
        if ticks > 0 and state in model.boundaries:
            actual_label, actual_store = model.boundaries[state]
            require(expected_label is not None and
                    (actual_label, actual_store, head) == (expected_label, expected_store, expected_head),
                    ("source continuation/store/head", label, store, marker, value, ticks,
                     (actual_label, actual_store, head), (expected_label, expected_store, expected_head)))
            require(tape == expected_tape, ("complete source tape/frame mismatch", label, store,
                                            marker, value, ticks))
            return ticks
        instruction = model.row(state, tape.get(head, 0))
        if instruction is None:
            require(expected_label is None and ticks > 0 and
                    state == model.prefix + model.halt_state and head == expected_head and
                    tape == expected_tape,
                    ("exact missing halt/tape/head", label, store, marker, value, ticks, state, head))
            return ticks
        require(ticks < budget, ("source boundary not reached", label, store, marker, value, budget))
        write, direction, state = instruction
        if write:
            tape[head] = 1
        else:
            tape.pop(head, None)
        head += direction
    raise AssertionError("Numeric source step exhausted its explicit finite syntax budget")


def validate(data, body_path, prefix_path, trace=None):
    trace = [] if trace is None else trace
    trace.append("allocation")
    model = NumericMachine(data)
    trace.append("native_samples_and_getter")
    samples, unique_samples, shared_halt = validate_native_samples(model)
    trace.append("initializer")
    initializer = validate_initializer(model)
    trace.append("initializer_edges")
    initializer_edges = validate_initializer_edges(data)
    trace.append("complete_prefix_rows")
    prefix_rows, prefix_controls = validate_prefix_rows(model, prefix_path)
    trace.append("complete_body_rows")
    body_rows, control_records = validate_body_rows(model, body_path)
    trace.append("source_cases")
    cases = 0
    coverage = []
    families = {name: {"labels": 0, "cases": 0, "max_binary_steps": 0} for name in OP_NAMES}
    for label, op in enumerate(model.ops):
        family = families[OP_NAMES[op[0]]]
        family["labels"] += 1
        label_cases = 0
        for store in range(5):
            for marker in (0, 1):
                for value in range(5):
                    steps = run_case(model, label, store, marker, value)
                    family["max_binary_steps"] = max(family["max_binary_steps"], steps)
                    label_cases += 1
        coverage.append(label_cases)
        family["cases"] += label_cases
        cases += label_cases
    require(coverage == [50] * model.labels, "Incomplete per-row/store/marker/active-field coverage")
    return {"states": model.states, "previous_states": PREVIOUS_STATES,
            "saved_states": PREVIOUS_STATES - model.states, "body_states": model.body_states,
            "initializer_states": model.prefix, "labels_covered": model.labels, "cases": cases,
            "counts": model.counts, "native_samples_checked": samples,
            "complete_prefix_rows_verified": True,
            "complete_prefix_rows_checked": prefix_rows["rows_checked"],
            "complete_body_rows_verified": True,
            "complete_body_rows_checked": body_rows["rows_checked"],
            "complete_full_rows_verified": True,
            "complete_full_rows_checked": prefix_rows["rows_checked"] + body_rows["rows_checked"],
            "prefix_rows": prefix_rows, "body_rows": body_rows,
            "unique_native_sample_pairs": unique_samples, "initializer_verified": True,
            "shared_halt_probes": shared_halt, "shared_halt_probes_verified": True,
            "initializer": initializer, "initializer_edges": initializer_edges,
            "initializer_edges_verified": True, "families": families, "cases_per_label": coverage,
            "stores_per_label": 5, "markers_per_store": 2, "active_field_values": 5,
            "frame": "Complete sparse tape equality; all other fields and nonblank neighboring cells",
            "halt_store": "CompactPost intentionally merges halted stores; exact missing halt checked",
            "universal_proof": False,
            "universal_proof_declarations": ["FieldCompiler.Snapshot.source_program",
                "FieldCompiler.lower_refines", "FieldCompiler.machine_eq",
                "FieldPacking.machine_eq", "Chess.Optimisation.FieldPackedLayout.layout",
                "Chess.Optimisation.FieldReverse.rowMachine_eq",
                "Chess.Optimisation.OpenEvolveWide.schedule_correct",
                "ConjectureMachines.Optimisation.ReverseInit.Schedule.initialise_run",
                "Chess.Optimisation.FieldReverse.initialises",
                "Chess.Optimisation.FieldReverse.halts_iff"]}, {
                    "body": control_records, "prefix": prefix_controls}


def corruption_controls(data, body_path, prefix_path, control_records):
    controls = []

    def reject(name, broken):
        trace = []
        try:
            validate(broken, body_path, prefix_path, trace)
        except (AssertionError, IndexError, KeyError, TypeError, ValueError) as error:
            controls.append({"name": name, "passed": True, "rejected": True,
                             "original_full_artifacts_positive": True,
                             "rejection_stage": trace[-1], "validation_stages_attempted": trace,
                             "reason": str(error)[:1200]})
        else:
            raise AssertionError("Corruption escaped the unchanged complete oracle: " + name)

    # Mutate only the affected branch of the payload, retaining actual native rows as controls.
    dispatch = dict(data)
    dispatch["syntax"] = list(data["syntax"])
    label, index = next((q, i) for q, nodes in enumerate(data["syntax"])
                        for i, node in enumerate(nodes) if node[0] == 4)
    dispatch["syntax"][label] = copy.deepcopy(data["syntax"][label])
    targets = dispatch["syntax"][label][index][1]
    targets[0] = (targets[0] + 1) % 4042
    reject("dispatch", dispatch)

    store = dict(data)
    store["operations"] = list(data["operations"])
    label = next(q for q, op in enumerate(data["operations"]) if op[0] == 3)
    store["operations"][label] = copy.deepcopy(data["operations"][label])
    values = store["operations"][label][1]
    values[0] = (values[0] + 1) % 5
    reject("store", store)

    frame = dict(data)
    frame["syntax"] = list(data["syntax"])
    label = next(q for q, op in enumerate(data["operations"]) if op[0] == 1)
    frame["syntax"][label] = copy.deepcopy(data["syntax"][label])
    movement = next(node for node in frame["syntax"][label] if node[0] == 0)
    movement[1] *= -1
    reject("frame", frame)

    initializer = dict(data)
    initializer["initializer"] = dict(data["initializer"])
    before = initializer["initializer"]["tape"]
    initializer["initializer"]["tape"] = ("1" if before[0] == "0" else "0") + before[1:]
    reject("initializer", initializer)

    initializer_head = dict(data)
    initializer_head["initializer"] = dict(data["initializer"])
    initializer_head["initializer"]["head"] = 0
    require(data["initializer"]["head"] != 0,
            "Physical-head corruption must differ from the actual initializer endpoint")
    reject("initializer_physical_head", initializer_head)

    undercount = dict(data)
    undercount["metadata"] = dict(data["metadata"])
    undercount["metadata"]["generated_states"] -= 1
    reject("undercount", undercount)

    packed_offset = dict(data)
    packed_offset["prefix_offsets"] = list(data["prefix_offsets"])
    packed_offset["prefix_offsets"][1] += 1
    reject("packed_offset", packed_offset)

    # The very same row predicate used on every streamed actual row rejects these changes.
    model = NumericMachine(data)

    def reject_record(name, line_index, record, original):
        check_body_record(model, original, line_index)
        try:
            check_body_record(model, record, line_index)
        except (AssertionError, IndexError, KeyError, TypeError, ValueError) as error:
            controls.append({"name": name, "passed": True, "rejected": True,
                             "oracle": "unchanged complete-body record predicate",
                             "original_record_positive": True,
                             "reason": str(error)[:1200]})
        else:
            raise AssertionError("Corrupted actual body record escaped its oracle: " + name)

    body_controls = control_records["body"]
    line_index, record = body_controls["transition"]
    transition = copy.deepcopy(record)
    transition[2][0] = 1 - transition[2][0]
    reject_record("body_write", line_index, transition, record)

    line_index, record = body_controls["bounce"]
    bounce = copy.deepcopy(record)
    bounce[2][1] = 1
    reject_record("body_bounce", line_index, bounce, record)

    line_index, record = body_controls["missing"]
    missing = copy.deepcopy(record)
    missing[2] = [record[1], 1, model.prefix]
    reject_record("body_missing_halt", line_index, missing, record)

    line_index, record = body_controls["transition"]
    reordered = copy.deepcopy(record)
    reordered[1] = 1 - reordered[1]
    reject_record("body_order", line_index, reordered, record)

    # A real shortened JSONL file exercises final line-count completeness, not just one row.
    with tempfile.TemporaryDirectory(prefix="chess-reverse-body-control-") as temporary:
        truncated = Path(temporary) / "body-rows.jsonl"
        with body_path.open("rb") as original:
            truncated.write_bytes(original.readline())
        try:
            validate_body_rows(model, truncated)
        except (AssertionError, IndexError, KeyError, TypeError, ValueError) as error:
            controls.append({"name": "body_truncation", "passed": True, "rejected": True,
                             "oracle": "unchanged complete-body artifact validator",
                             "original_full_artifact_positive": True,
                             "reason": str(error)[:1200]})
        else:
            raise AssertionError("Truncated actual body file escaped complete coverage checking")
    def reject_prefix_record(name, record_index, raw_record, original):
        check_prefix_record(model, original, record_index)
        try:
            check_prefix_record(model, raw_record, record_index)
        except (AssertionError, IndexError, KeyError, TypeError, ValueError) as error:
            controls.append({"name": name, "passed": True, "rejected": True,
                             "oracle": "unchanged complete-prefix raw-record predicate",
                             "original_record_positive": True,
                             "record_index": record_index,
                             "original_hex": original.hex(), "corrupted_hex": raw_record.hex(),
                             "reason": str(error)[:1200]})
        else:
            raise AssertionError("Corrupted actual prefix record escaped its oracle: " + name)

    prefix_controls = control_records["prefix"]
    for name, control, field in [("prefix_write", "write", 0),
                                 ("prefix_direction", "direction", 1),
                                 ("prefix_final_turn", "final_turn", 1)]:
        record_index, original = prefix_controls[control]
        changed = bytearray(original)
        changed[field] = 1 - changed[field]
        reject_prefix_record(name, record_index, bytes(changed), original)

    with tempfile.TemporaryDirectory(prefix="chess-reverse-prefix-control-") as temporary:
        truncated = Path(temporary) / "prefix-rows.bin"
        with prefix_path.open("rb") as original:
            truncated.write_bytes(original.read(PREFIX_RECORD.size))
        try:
            validate_prefix_rows(model, truncated)
        except (AssertionError, IndexError, KeyError, TypeError, ValueError) as error:
            controls.append({"name": "prefix_truncation", "passed": True, "rejected": True,
                             "oracle": "unchanged complete-prefix artifact validator",
                             "original_full_artifact_positive": True,
                             "reason": str(error)[:1200]})
        else:
            raise AssertionError("Truncated actual prefix file escaped complete coverage checking")
    require([control["name"] for control in controls] ==
            ["dispatch", "store", "frame", "initializer", "initializer_physical_head",
             "undercount", "packed_offset", "body_write", "body_bounce", "body_missing_halt",
             "body_order", "body_truncation", "prefix_write", "prefix_direction",
             "prefix_final_turn", "prefix_truncation"],
            "Missing corruption control")
    return controls


def main():
    require(os.environ.get("CHESS_REMOTE") == "1", "Machine execution is remote-only")
    source = WORK / "machine-export.json"
    data = json.loads(source.read_text())
    body_path = WORK / "body-rows.jsonl"
    prefix_path = WORK / "prefix-rows.bin"
    report, control_records = validate(data, body_path, prefix_path)
    require(report["complete_full_rows_checked"] == 2 * report["states"],
            "Complete full-machine row coverage differs from independent allocation")
    # The unmodified positive control must pass before the identical oracle tests each mutation.
    report["mutation_controls"] = corruption_controls(data, body_path, prefix_path, control_records)
    report["status"] = "passed"
    report["machine_json_filename"] = source.name
    report["machine_json_sha256"] = hashlib.sha256(source.read_bytes()).hexdigest()
    report["machine_json_bytes"] = source.stat().st_size
    report["machine_export_filename"] = source.name
    report["machine_export_sha256"] = report["machine_json_sha256"]
    report["machine_export_bytes"] = report["machine_json_bytes"]
    (WORK / "fixtures-detail.json").write_text(json.dumps(report, indent=2) + "\n")
    print("Reverse independent fixtures passed:", report["cases"], "source cases;",
          report["complete_prefix_rows_checked"], "complete actual prefix rows;",
          report["complete_body_rows_checked"], "complete actual body rows;",
          report["native_samples_checked"], "actual native rows;",
          len(report["mutation_controls"]), "rejected mutations")


if __name__ == "__main__":
    main()
