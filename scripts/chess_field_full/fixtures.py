#!/usr/bin/env python3
"""Remote-only independent numeric replay of the complete exported field compiler.

The numeric recipe here is ordinary Python, separate from the Lean getters,
CompactPost, Binary, and FlatInit implementations. Finite tests supplement the
universal kernel proofs; they do not establish an unbounded simulation theorem.
"""

import copy
import hashlib
import json
import os
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / ".lake/chess-field-full"
PREVIOUS_STATES = 390491642
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
        require(op[1] in (-1, 1), (label, "source direction"))
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
        require(node[1] in (-1, 1), (label, index, "syntax direction"))
    if tag in (1, 2, 3, 4):
        table(node[1], 10, 5 if tag == 2 else labels if tag == 4 else 2,
              (label, index, "finite observable table"))
    children = node[-2:] if tag == 3 else node[-1:] if tag in (0, 1, 2) else []
    for child in children:
        integer(child, 0, index, (label, index, "postorder child"))


class NumericMachine:
    """A demand-driven recipe; it never constructs the full numeric row table."""

    def __init__(self, data):
        require(data.get("schema") == "chess-field-full-v1", "Unexpected native schema")
        self.data = data
        self.meta = data["metadata"]
        self.labels, self.width, self.stores = 4042, 1024, 5
        require((self.meta["labels"], self.meta["width"], self.meta["stores"],
                 self.meta["cell_bits"]) == (self.labels, self.width, self.stores, 13),
                "Unexpected complete-program dimensions")
        self.ops, self.syntax, self.entries = data["operations"], data["syntax"], data["entries"]
        require(len(self.ops) == len(self.syntax) == len(self.entries) == self.labels,
                "Missing or duplicated source row")
        meaningful = 0
        for label, (op, nodes, entry) in enumerate(zip(self.ops, self.syntax, self.entries)):
            validate_op(op, label, self.labels)
            require(isinstance(nodes, list) and 0 < len(nodes) <= self.width,
                    (label, "source row does not fit its charged block"))
            for index, node in enumerate(nodes):
                validate_node(node, index, label, self.labels)
            require(entry == label * self.width + len(nodes) - 1,
                    (label, "getter entry differs from actual postorder root"))
            meaningful += len(nodes)
        self.bits = data["bits"]
        require(isinstance(self.bits, str) and self.bits and set(self.bits) <= {"0", "1"},
                "Paid input is not a nonempty binary string")
        self.graph_nodes = self.labels * self.width
        self.post_states = 1 + self.graph_nodes * self.stores
        self.body_states = 2 * self.post_states
        self.prefix = 2 * len(self.bits)
        self.states = self.prefix + self.body_states
        self.initial_raw = 1 + self.entries[0] * self.stores
        self.halt_state = self.initial_raw
        expected = {"graph_nodes": self.graph_nodes, "post_states": self.post_states,
                    "body_states": self.body_states, "generated_states": self.states,
                    "machine_states": self.states, "row_machine_states": self.states,
                    "bits_count": len(self.bits), "initial_raw": self.initial_raw,
                    "initial_encoded": 0, "halt_encoded": self.halt_state,
                    "body_entry": self.prefix}
        for name, value in expected.items():
            require(self.meta[name] == value, ("allocation/dispatch", name, self.meta[name], value))
        require(self.states < PREVIOUS_STATES, ("candidate is not strictly smaller", self.states))
        self.counts = {
            "source_labels": self.labels, "slots_per_label": self.width,
            "meaningful_nodes": meaningful, "padding_nodes": self.graph_nodes - meaningful,
            "all_graph_nodes": self.graph_nodes, "stores_per_node": self.stores,
            "live_node_store_controls": self.graph_nodes * self.stores,
            "shared_halt_controls": 1, "post_controls": self.post_states,
            "binary_main_controls": self.post_states, "binary_bounce_controls": self.post_states,
            "body_controls": self.body_states, "initializer_write_controls": len(self.bits),
            "initializer_restore_controls": len(self.bits), "initializer_controls": self.prefix,
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
        label, local = divmod(index, self.width)
        require(0 <= label < self.labels, ("graph node outside allocation", index))
        nodes = self.syntax[label]
        return nodes[local] if local < len(nodes) else [5]

    def global_node(self, index):
        node = self.node(index)
        base = (index // self.width) * self.width
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
            for _ in range(self.width + 1):
                instruction = self.node(node)
                tag = instruction[0]
                base = (node // self.width) * self.width
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
            return [ord(self.bits[state]) - 48, 1, state + 1]
        if state < self.prefix:
            return [bit, -1, state + 1]
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
    for label, nodes in enumerate(model.syntax):
        base = label * model.width
        expected = {base, base + model.width - 1, model.entries[label]}
        if len(nodes) < model.width:
            expected.add(base + len(nodes))
        require(expected <= getter_seen, (label, "missing getter boundary/padding probes"))
    seen = set()
    shared_halt = {}
    halt_controls = {model.prefix + model.halt_state,
                     model.prefix + model.post_states + model.halt_state}
    for state, bit, actual, independently_assembled in data["samples"]:
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
    tape = bytearray(len(bits) + 1)
    state = head = 0
    for tick in range(model.prefix):
        require(0 <= head <= len(bits), ("independent initializer frame", tick, head))
        row = model.row(state, tape[head])
        require(row is not None, ("independent initializer missing transition", tick))
        write, direction, state = row
        tape[head] = write
        head += direction
    result = data["initializer"]
    require((state, head) == (model.prefix, 0), "Independent initializer body entry/head")
    require((result["steps"], result["state"], result["head"], result["trailing_cell"]) ==
            (model.prefix, state, head, 0), "Actual initializer run has wrong endpoint")
    expected_tape = bytes(value + 48 for value in tape[:-1]).decode("ascii")
    require(expected_tape == bits and result["tape"] == expected_tape and tape[-1] == 0,
            "Actual/independent initializer full sparse tape differs from paid input")
    return {"steps": model.prefix, "body_entry": state, "head": head,
            "bits": len(bits), "source_cells": len(source) // 5,
            "bits_sha256": hashlib.sha256(bits.encode("ascii")).hexdigest(),
            "native_machine_and_rowMachine_replayed": True,
            "outside_frame": "Blank, including the extra visited cell at bits_count"}


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


def validate(data):
    model = NumericMachine(data)
    samples, unique_samples, shared_halt = validate_native_samples(model)
    initializer = validate_initializer(model)
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
            "unique_native_sample_pairs": unique_samples, "initializer_verified": True,
            "shared_halt_probes": shared_halt, "shared_halt_probes_verified": True,
            "initializer": initializer, "families": families, "cases_per_label": coverage,
            "stores_per_label": 5, "markers_per_store": 2, "active_field_values": 5,
            "frame": "Complete sparse tape equality; all other fields and nonblank neighboring cells",
            "halt_store": "CompactPost intentionally merges halted stores; exact missing halt checked",
            "universal_proof": False,
            "universal_proof_declarations": ["FieldCompiler.Snapshot.source_program",
                "FieldCompiler.lower_refines", "FieldCompiler.machine_eq",
                "Chess.Optimisation.FieldAware.rowMachine_eq",
                "Chess.Optimisation.FieldAware.halts_iff"]}


def corruption_controls(data):
    controls = []

    def reject(name, broken):
        try:
            validate(broken)
        except (AssertionError, IndexError, KeyError, TypeError, ValueError) as error:
            controls.append({"name": name, "passed": True, "rejected": True,
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

    undercount = dict(data)
    undercount["metadata"] = dict(data["metadata"])
    undercount["metadata"]["generated_states"] -= 1
    reject("undercount", undercount)
    require([control["name"] for control in controls] ==
            ["dispatch", "store", "frame", "initializer", "undercount"],
            "Missing corruption control")
    return controls


def main():
    require(os.environ.get("CHESS_REMOTE") == "1", "Machine execution is remote-only")
    source = WORK / "machine-export.json"
    data = json.loads(source.read_text())
    report = validate(data)
    # The unmodified positive control must pass before the identical oracle tests each mutation.
    report["mutation_controls"] = corruption_controls(data)
    report["status"] = "passed"
    report["machine_json_filename"] = source.name
    report["machine_json_sha256"] = hashlib.sha256(source.read_bytes()).hexdigest()
    (WORK / "fixtures-detail.json").write_text(json.dumps(report, indent=2) + "\n")
    print("Full field independent fixtures passed:", report["cases"], "source cases;",
          report["native_samples_checked"], "actual native rows;",
          len(report["mutation_controls"]), "rejected mutations")


if __name__ == "__main__":
    main()
