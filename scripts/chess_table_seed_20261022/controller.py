#!/usr/bin/env python3
"""Build a closed binary decoder for the fixed29 structured chess packet.

Remote construction only. This file executes no fixtures and proves no theorem.
All finite source constructors expand into paid +/-1 binary transition rows.
The resulting machine has no runtime calls, implicit registers, or stay moves.
"""

import os

if os.environ.get("CHESS_REMOTE") != "1" or os.environ.get("GITHUB_ACTIONS") != "true":
    raise SystemExit("Remote-only construction requires CHESS_REMOTE=1 and GITHUB_ACTIONS=true")

import argparse
import hashlib
import json
from collections import Counter
from pathlib import Path


SCHEMA = "chess-table-seed-direct-binary-v1"
STATUS = "FINITE_UNVERIFIED_CONTROLLER"
MAX_STATES = 50000
MARKER = "011110"
HEADER = "0111100011110"
CODES = {1: "100", 2: "010", 3: "110", 4: "001"}
TAG_MSB_BITS = {0: "", 1: "1", 2: "10", 3: "11", 4: "100", 5: "101", 6: "110"}


def require(condition, message):
    if not condition:
        raise AssertionError(message)


def preserving(count, direction):
    return [(None, direction)] * count


def writing(bits, direction):
    return [(int(bit), direction) for bit in bits]


class Program:
    """Finite source graph; its read/emit nodes are never runtime instructions.

    A read consumes exactly one raw input bit before taking its destination.
    An emit prepends exactly one known letter before taking its destination.
    Every edge is implemented by the final physical transition of such a node.
    No source node denotes a zero-step branch or a free control transfer.
    """

    def __init__(self):
        self.nodes = {}

    def read(self, name, zero, one, context):
        require(name not in self.nodes, ("duplicate parser node", name))
        self.nodes[name] = {"kind": "read", "targets": [zero, one], "context": context}

    def emit(self, name, letter, target, context):
        require(name not in self.nodes, ("duplicate emission node", name))
        require(letter in CODES, ("invalid pending letter", letter))
        self.nodes[name] = {"kind": "emit", "letter": letter, "target": target,
                            "context": context}

    def entry(self, name):
        if name == "finish":
            return "finish.to_b_end.00"
        if name == "error":
            return "error"
        require(name in self.nodes, ("unknown source destination", name))
        kind = self.nodes[name]["kind"]
        return f"read.{name}.seek.00" if kind == "read" else f"emit.{name}.depart.00"


def literal_node(phase, depth=0, value=0):
    return f"literal.{phase}.d{depth}.v{value}"


def tag_node(depth=0, value=0):
    return f"rows.tag.d{depth}.v{value}"


def operand_node(tag, side, position, started):
    return f"row.t{tag}.{side}.p{position:02d}.seen{int(started)}"


def word_cons(tag, side):
    return f"row.t{tag}.{side}.cons"


def operand_emission(tag, side, position, bit):
    return f"row.t{tag}.{side}.p{position:02d}.bit{bit}"


def build_program():
    """Finite packet transducer retaining tag/phase/position, never an operand."""
    p = Program()
    for phase in ("post", "pre"):
        for depth in range(3):
            for value in range(1 << depth):
                targets = []
                for bit in (0, 1):
                    decoded = value + (bit << depth)
                    if depth < 2:
                        target = literal_node(phase, depth + 1, decoded)
                    elif decoded == 0:
                        target = "delimiter" if phase == "post" else "finish"
                    elif decoded <= 4:
                        target = f"literal.{phase}.letter{decoded}"
                    else:
                        target = "error"
                    targets.append(target)
                p.read(literal_node(phase, depth, value), *targets,
                       {"phase": phase, "read_position": depth, "partial_code": value})
        for letter in range(1, 5):
            p.emit(f"literal.{phase}.letter{letter}", letter, literal_node(phase),
                   {"phase": phase, "pending_letter": letter})
    p.emit("delimiter", 1, tag_node(), {"phase": "between_post_and_rows", "pending_letter": 1})

    for depth in range(3):
        for value in range(1 << depth):
            targets = []
            for bit in (0, 1):
                decoded = value + (bit << depth)
                if depth < 2:
                    target = tag_node(depth + 1, decoded)
                elif decoded == 7:
                    target = literal_node("pre")
                else:
                    target = word_cons(decoded, "right")
                targets.append(target)
            p.read(tag_node(depth, value), *targets,
                   {"phase": "tag", "read_position": depth, "partial_code": value})

    for tag in range(7):
        for side in ("right", "left"):
            after_word = word_cons(tag, "left") if side == "right" else word_cons(tag, "tag")
            p.emit(word_cons(tag, side), 2, operand_node(tag, side, 0, False),
                   {"phase": side, "tag": tag, "role": "word_cons_including_zero"})
            for position in range(13):
                after_started = (operand_node(tag, side, position + 1, True)
                                 if position < 12 else after_word)
                after_zero = (operand_node(tag, side, position + 1, False)
                              if position < 12 else after_word)
                for started in (False, True):
                    zero = operand_emission(tag, side, position, 0) if started else after_zero
                    one = operand_emission(tag, side, position, 1)
                    p.read(operand_node(tag, side, position, started), zero, one,
                           {"phase": side, "tag": tag, "read_position": position,
                            "leading_zero": not started})
                for bit in (0, 1):
                    p.emit(operand_emission(tag, side, position, bit), 3 + bit, after_started,
                           {"phase": side, "tag": tag, "read_position": position,
                            "pending_letter": 3 + bit})

        # A tag is one of seven constants. Its short MSB emission chain is
        # explicit finite control, not an accumulated 13-bit word value.
        digits = TAG_MSB_BITS[tag]
        first_digit = f"row.t{tag}.tag.bit0" if digits else tag_node()
        p.emit(word_cons(tag, "tag"), 2, first_digit,
               {"phase": "emit_tag", "tag": tag, "role": "word_cons_including_zero"})
        for index, bit in enumerate(digits):
            target = f"row.t{tag}.tag.bit{index + 1}" if index + 1 < len(digits) else tag_node()
            p.emit(f"row.t{tag}.tag.bit{index}", 3 + int(bit), target,
                   {"phase": "emit_tag", "tag": tag, "read_position": index,
                    "pending_letter": 3 + int(bit)})
    return p


class Builder:
    """Expand every source operation to complete paid binary rows."""

    def __init__(self):
        self.names = []
        self.symbolic_rows = {}
        self.blocks = []

    def block(self, name, kind, names, rows, contract, context=None, operations=None):
        require(names and len(names) == len(rows) and len(set(names)) == len(names),
                (name, "invalid block dimensions"))
        require(not any(state in self.symbolic_rows for state in names), (name, "duplicate control"))
        self.blocks.append({
            "name": name, "kind": kind, "entry": len(self.names), "states": len(names),
            "state_names": names, "contract": contract, "context": context,
            "operations": None if operations is None else [list(operation) for operation in operations],
        })
        self.names.extend(names)
        self.symbolic_rows.update(zip(names, rows))

    def fixed(self, name, kind, operations, destination, contract, context=None):
        require(operations, (name, "zero-step blocks forbidden"))
        names = [f"{name}.{index:02d}" for index in range(len(operations))]
        rows = []
        for index, (write, direction) in enumerate(operations):
            require(write is None or type(write) is int and write in (0, 1), "bad fixed write")
            require(type(direction) is int and direction in (-1, 1), "bad fixed direction")
            target = names[index + 1] if index + 1 < len(names) else destination
            rows.append([(symbol if write is None else write, direction, target)
                         for symbol in (0, 1)])
        self.block(name, kind, names, rows, contract, context, operations)

    def scan(self, name, direction, destination, contract, context=None):
        names = [f"{name}.run{run}" for run in range(4)]
        rows = [[(0, direction, names[0]),
                 (1, direction, names[run + 1] if run < 3 else destination)]
                for run in range(4)]
        self.block(name, "scan_left" if direction == -1 else "scan_right", names, rows,
                   contract, context)

    def read(self, semantic, zero, one, context):
        name = f"read.{semantic}"
        self.fixed(name + ".seek", "consume_seek", preserving(6, 1), name + ".bit",
                   "Head B -> B+6, the first unread raw bit", context)
        # Erasing the raw bit is the first write of B's overlapping update.
        # The read result survives solely in the paid continuation control.
        self.block(name + ".bit", "consume_read", [name + ".bit"],
                   [[(0, -1, f"consume.to.{zero}.00"), (0, -1, f"consume.to.{one}.00")]],
                   "Read then erase old B+6; move L to old B+5; retain branch in control", context)

    def emit(self, semantic, letter, destination, context):
        name = f"emit.{semantic}"
        self.fixed(name + ".depart", "emit_depart", preserving(1, -1), name + ".seek_a.run0",
                   "Head B -> B-1; never scan B itself or unread raw input", context)
        self.scan(name + ".seek_a", -1, name + ".to_output.00",
                  "Scan left through zero gap and compact output; exit at old A", context)
        self.fixed(name + ".to_output", "emit_seek", preserving(5, 1), name + ".code.00",
                   "Old A -> old A+5", context)
        self.fixed(name + ".code", "emit_code", writing(CODES[letter][::-1], -1),
                   name + ".write_a.00", "Write new code at old A+3..A+5; finish old A+2", context)
        self.fixed(name + ".write_a", "emit_marker", writing(MARKER[::-1], -1),
                   name + ".skip_a.00", "Install A at old A-3; finish old A-4=new A-1", context)
        self.fixed(name + ".skip_a", "emit_skip", preserving(7, 1), name + ".seek_b.run0",
                   "New A-1 -> new A+6, first compact-output bit", context)
        self.scan(name + ".seek_b", 1, name + ".back_b.00",
                  "Scan compact output/gap only; fourth marker one exits at B+5", context)
        self.fixed(name + ".back_b", "emit_return", preserving(5, -1), destination,
                   "B+5 -> B left guard; next finite parser/emitter context", context)

    def finish(self):
        self.fixed("finish.to_b_end", "cleanup_seek", preserving(5, 1), "finish.erase_b.00",
                   "All packet bits consumed; B -> B+5")
        self.fixed("finish.erase_b", "cleanup_b", writing("000000", -1), "finish.seek_a.run0",
                   "Erase B entirely; finish at B-1; unread suffix is blank")
        self.scan("finish.seek_a", -1, "finish.to_header_end.00",
                  "Scan zero gap/compact output to A left guard")
        self.fixed("finish.to_header_end", "cleanup_seek", preserving(5, 1), "finish.write_header.00",
                   "Old A -> old A+5; final compact payload starts at old A+6")
        self.fixed("finish.write_header", "cleanup_header", writing(HEADER[::-1], -1),
                   "finish.restore_head.00",
                   "Write exact old-seed header at old A-7..A+5; finish old A-8")
        self.fixed("finish.restore_head", "final_head", preserving(1, 1), "done",
                   "Old A-8 -> old A-7, first bit of exact old Seed.seed")
        self.block("done", "success", ["done"], [[None, None]],
                   "Unique terminal success, exact old seed tape and first-bit head")
        self.block("error", "nonterminal_error", ["error"],
                   [[(0, 1, "error"), (1, 1, "error")]],
                   "Invalid literal code5..7; preserve tape and move right forever")

    def resolve(self):
        ids = {name: index for index, name in enumerate(self.names)}
        rows = []
        for name in self.names:
            pair = []
            for row in self.symbolic_rows[name]:
                if row is None:
                    pair.append(None)
                else:
                    write, direction, destination = row
                    require(destination in ids, (name, "unresolved destination", destination))
                    pair.append([write, direction, ids[destination]])
            rows.append(pair)
        return {"schema": SCHEMA, "status": STATUS, "states": len(self.names), "entry": 0,
                "done": ids["done"], "error": ids["error"], "names": self.names,
                "rows": rows, "blocks": self.blocks}


def construct():
    program = build_program()
    builder = Builder()
    builder.fixed("entry", "entry", preserving(7, 1), program.entry(literal_node("post")),
                  "Packet first bit A -> B left guard; both markers remain intact")
    continuations = set()
    for semantic, node in program.nodes.items():
        if node["kind"] == "read":
            zero, one = node["targets"]
            builder.read(semantic, zero, one, node["context"])
            continuations.update((zero, one))
        else:
            builder.emit(semantic, node["letter"], program.entry(node["target"]), node["context"])
    for destination in sorted(continuations):
        builder.fixed(f"consume.to.{destination}", "consume_shift",
                      writing("001111"[::-1], -1) + preserving(2, 1), program.entry(destination),
                      "Old B+5 -> old B-1 by six writes, then2R to new B=old B+1; old B+6 already0",
                      {"return_context": destination})
    builder.finish()
    return builder.resolve(), program


def validate(machine):
    count = machine["states"]
    names, rows = machine["names"], machine["rows"]
    require(type(count) is int and count > 0 and len(names) == len(rows) == count, "allocation size")
    require(len(set(names)) == count and machine["entry"] == 0 and names[0] == "entry.00",
            "control identity/entry")
    for key in ("done", "error"):
        require(type(machine[key]) is int and 0 <= machine[key] < count, (key, "control bounds"))
        require(names[machine[key]] == key, (key, "control name"))
    missing = []
    for state, pair in enumerate(rows):
        require(isinstance(pair, list) and len(pair) == 2, (state, "two rows required"))
        for symbol, row in enumerate(pair):
            if row is None:
                missing.append((state, symbol))
                continue
            require(isinstance(row, list) and len(row) == 3, (state, symbol, "row arity"))
            write, direction, destination = row
            require(type(write) is int and write in (0, 1), "binary write")
            require(type(direction) is int and direction in (-1, 1), "unit movement")
            require(type(destination) is int and 0 <= destination < count, "paid destination")
    require(missing == [(machine["done"], 0), (machine["done"], 1)], "unique successful terminal")
    require(rows[machine["error"]] == [[0, 1, machine["error"]], [1, 1, machine["error"]]],
            "paid nonterminal error")
    cursor, block_names = 0, set()
    for block in machine["blocks"]:
        require(block["name"] not in block_names, "duplicate block")
        block_names.add(block["name"])
        require(block["entry"] == cursor and block["states"] > 0, "contiguous block allocation")
        end = cursor + block["states"]
        require(block["state_names"] == names[cursor:end], "block controls")
        cursor = end
    require(cursor == count, "unaccounted control state")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    output = args.output.resolve()
    targets = (output / "controller.json", output / "controller-construction.json")
    require(not any(path.exists() for path in targets), "Refusing to overwrite controller evidence")
    output.mkdir(parents=True, exist_ok=True)
    machine, program = construct()
    validate(machine)
    serialized = (json.dumps(machine, sort_keys=True, separators=(",", ":")) + "\n").encode("utf-8")
    require(json.loads(serialized) == machine, "exact JSON serialization round trip")
    with targets[0].open("xb") as stream:
        stream.write(serialized)
    kinds = Counter()
    for block in machine["blocks"]:
        kinds[block["kind"]] += block["states"]
    count = machine["states"]
    report = {
        "schema": "chess-table-seed-controller-construction-v1", "status": STATUS,
        "controller_sha256": hashlib.sha256(serialized).hexdigest(),
        "source_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        "github_run_id": os.environ.get("GITHUB_RUN_ID"), "github_sha": os.environ.get("GITHUB_SHA"),
        "states": count, "rows": 2 * count, "blocks": len(machine["blocks"]),
        "allocated_states_by_kind": dict(sorted(kinds.items())),
        "finite_source_nodes": dict(sorted(Counter(node["kind"] for node in program.nodes.values()).items())),
        "allocation_limit": MAX_STATES, "within_allocation_limit": count <= MAX_STATES,
        "same_body_complete_candidate": 747662 + count,
        "conditional_quotient_complete_candidate": 288347 + count,
        "prospective_same_body_saving": 250514 - count,
        "old_seed_expander_states": 216, "charged_bridge_states": 2,
        "all_destinations_paid": True, "implicit_runtime_operations": False,
        "whole_operand_control_register": False, "fixtures_executed": False,
        "universal_proof": False, "new_accepted_machine": False,
        "claim": "Complete finite row construction only; independent fixtures and universal proof are separate",
    }
    with targets[1].open("x", encoding="utf-8") as stream:
        json.dump(report, stream, indent=2, sort_keys=True)
        stream.write("\n")
    print(json.dumps(report, sort_keys=True))
    if count > MAX_STATES:
        raise SystemExit("Controller allocation exceeds50000; complete evidence retained, stop pilot")
    print("CHESS_TABLE_SEED_CONTROLLER_BUILT")


if __name__ == "__main__":
    main()
