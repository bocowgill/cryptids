#!/usr/bin/env python3
"""Remote-only finite binary seed-expander pilot; this is not a Lean certificate.

The builder emits a closed transition table before any tape is interpreted. Each
allocated state has two rows. A row is either (write, move +/-1, destination), or
the missing transition of the unique designated success state. There are no
runtime block calls, integer registers, implicit returns, or uncharged controls.

Run only in the root-owned GitHub Actions job. Full chess input is decoded
statically, never subjected to this controller's quadratic startup simulation.
"""

import os

if os.environ.get("CHESS_REMOTE") != "1" or os.environ.get("GITHUB_ACTIONS") != "true":
    raise SystemExit("Remote-only pilot: require CHESS_REMOTE=1 and GITHUB_ACTIONS=true")

import argparse
import copy
import hashlib
import itertools
import json
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / ".lake/chess-seed-20261022"
SOURCE_EXPORT = ROOT / (
    "docs/chess/campaign-2026-10-22/round-01/evidence/final/unpacked/machine-export.json"
)
SOURCE_SHA256 = "592ea3c892d0e9d5a6db6ce31e3f590bde7973774bdc9a70cfe46cb6996cd39e"
TARGET_SHA256 = "a537828df795044398b0eb71c0f9091da6a3d2e01511bac338b8581b04fda9fa"
CELLS_SHA256 = "e0be400450a54b6f44169fbca7e79be157a24bb2bcad3a8ea0f3d9af330af914"
STATUS = "FINITE_UNVERIFIED_PILOT"
MARKER = "011110"
CODES = {1: "100", 2: "010", 3: "110", 4: "001"}
SYMBOL_NAMES = {1: "cons_left", 2: "cons", 3: "bit0", 4: "bit1"}
BODY_STATES = 573802
ACCEPTED_STATES = 2411743
LINK_STATES = 1


def require(condition, message):
    if not condition:
        raise AssertionError(message)


def digest(data):
    return hashlib.sha256(data).hexdigest()


def write_json(path, value):
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")


class Builder:
    """Source-level finite constructors; all operations become paid table rows."""

    def __init__(self):
        self.names = []
        self.symbolic_rows = {}
        self.blocks = []

    def add_block(self, block, kind, names, rows, contract, carry=None, operations=None):
        require(names and len(names) == len(rows), (block, "malformed block"))
        require(not any(name in self.symbolic_rows for name in names), (block, "duplicate state"))
        first = len(self.names)
        self.names.extend(names)
        self.symbolic_rows.update(zip(names, rows))
        self.blocks.append({
            "name": block, "kind": kind, "entry": first, "states": len(names),
            "state_names": names, "carry": carry, "contract": contract,
            "operations": operations,
        })

    def fixed(self, block, operations, target, contract, carry=None):
        """One state per (optional constant write, direction); no zero-step edge."""
        require(operations, (block, "empty fixed blocks are forbidden"))
        names = [f"{block}.{i:02d}" for i in range(len(operations))]
        rows = []
        for i, (write, move) in enumerate(operations):
            require(write is None or type(write) is int and write in (0, 1), "bad write")
            require(type(move) is int and move in (-1, 1), "bad movement")
            destination = names[i + 1] if i + 1 < len(names) else target
            rows.append([(symbol if write is None else write, move, destination)
                         for symbol in (0, 1)])
        self.add_block(block, "fixed", names, rows, contract, carry, operations)

    def scan_four(self, block, direction, target, contract, carry=None):
        """Run-length states 0..3; a fourth one moves once and takes the exit."""
        names = [f"{block}.run{i}" for i in range(4)]
        rows = [[(0, direction, names[0]),
                 (1, direction, names[run + 1] if run < 3 else target)]
                for run in range(4)]
        self.add_block(block, "scan_four", names, rows, contract, carry)

    def parser(self):
        names, rows = [], []
        for depth in range(3):
            for value in range(1 << depth):
                names.append(f"parse.d{depth}.v{value}")
                pair = []
                for symbol in (0, 1):
                    decoded = value + (symbol << depth)
                    if depth < 2:
                        target = f"parse.d{depth + 1}.v{decoded}"
                    elif decoded == 0:
                        target = "finish.to_b_end.00"
                    elif decoded <= 4:
                        target = f"carry{decoded}.shift_b.00"
                    else:
                        target = "error"
                    pair.append((symbol, 1, target))
                rows.append(pair)
        self.add_block("parse", "read_three_lsb", names, rows,
                       "B+6 -> B+9; 000 finishes, codes1..4 carry, codes5..7 error")

    def finish(self):
        self.add_block("done", "success", ["done"], [[None, None]],
                       "Unique terminal success; head at first output bit")
        self.add_block("error", "nonterminal_error", ["error"],
                       [[(0, 1, "error"), (1, 1, "error")]],
                       "Malformed code5..7; preserving right-moving self loop")
        ids = {name: index for index, name in enumerate(self.names)}
        numeric = []
        for name in self.names:
            pair = []
            for row in self.symbolic_rows[name]:
                if row is None:
                    pair.append(None)
                else:
                    write, move, target = row
                    require(target in ids, (name, "unresolved edge", target))
                    pair.append([write, move, ids[target]])
            numeric.append(pair)
        return {
            "schema": "chess-seed-direct-binary-v1", "status": STATUS,
            "states": len(self.names), "entry": 0, "done": ids["done"],
            "error": ids["error"], "names": self.names, "blocks": self.blocks,
            "rows": numeric,
        }


def moves(count, direction):
    return [(None, direction)] * count


def writes(bits, direction):
    return [(int(bit), direction) for bit in bits]


def build_controller():
    b = Builder()
    b.fixed("entry", moves(7, 1), "loop.skip_b.00", "Seed A -> B=A+7")
    b.fixed("loop.skip_b", moves(6, 1), "parse.d0.v0", "B -> first unread code at B+6")
    b.parser()
    for code in range(1, 5):
        c = f"carry{code}"
        # Read is already complete. Write B's overlap from right to left.
        b.fixed(f"{c}.shift_b", moves(1, -1) + writes("000011110"[::-1], -1),
                f"{c}.seek_a.run0", "B+9 -> old B-1; new B=old B+3", code)
        b.scan_four(f"{c}.seek_a", -1, f"{c}.prepend.00",
                    "Old B-1 -> old A; gap/output contain no run of four ones", code)
        # The last cell write consumes the last use of the retained symbol.
        b.fixed(f"{c}.prepend", moves(5, 1) + writes((CODES[code] + "0" * 10)[::-1], -1),
                "common.write_a.00", "Old A -> old A-8; cell installed at old A-7", code)
    b.fixed("common.write_a", writes(MARKER[::-1], -1), "common.skip_a.00",
            "Old A-8 -> old A-14; new A=old A-13")
    b.fixed("common.skip_a", moves(7, 1), "common.seek_b.run0",
            "New A-1 -> new A+6, skipping all of marker A")
    b.scan_four("common.seek_b", 1, "common.back_b.00",
                "First output bit -> B+5 after reading fourth marker one")
    b.fixed("common.back_b", moves(5, -1), "loop.skip_b.00", "B+5 -> B")
    b.fixed("finish.to_b_end", moves(4, -1), "finish.erase_b.00", "B+9 -> B+5")
    b.fixed("finish.erase_b", writes("000000", -1), "finish.seek_a.run0",
            "B+5 -> B-1; erase all six B bits")
    b.scan_four("finish.seek_a", -1, "finish.erase_a.00", "B-1 -> A")
    b.fixed("finish.erase_a", writes("000000", 1), "finish.to_marker.00",
            "A -> A+6, first output bit; erase all six A bits")
    b.fixed("finish.to_marker", moves(12, 1), "finish.set_marker.00",
            "First output bit -> offset12 of first output cell")
    b.fixed("finish.set_marker", [(1, -1)], "finish.back_head.00",
            "Set unique output marker; offset12 -> offset11")
    b.fixed("finish.back_head", moves(11, -1), "done", "Offset11 -> first output bit")
    return b.finish()


def validate_controller(machine):
    """Independent whole-table well-formedness and paid-allocation checker."""
    require(machine["schema"] == "chess-seed-direct-binary-v1", "controller schema")
    require(machine["status"] == STATUS, "controller evidence scope")
    count = machine["states"]
    names, rows = machine["names"], machine["rows"]
    require(type(count) is int and count > 0, "state count")
    require(len(names) == len(rows) == count and len(set(names)) == count, "paid state census")
    require(machine["entry"] == 0 and names[0] == "entry.00", "entry state")
    require(names[machine["done"]] == "done" and names[machine["error"]] == "error",
            "distinguished controls")
    missing = []
    for state, pair in enumerate(rows):
        require(isinstance(pair, list) and len(pair) == 2, (state, "two rows required"))
        for symbol, row in enumerate(pair):
            if row is None:
                missing.append((state, symbol))
                continue
            require(isinstance(row, list) and len(row) == 3, (state, symbol, "row arity"))
            write, move, destination = row
            require(type(write) is int and write in (0, 1), "binary write")
            require(type(move) is int and move in (-1, 1), "unit movement")
            require(type(destination) is int and 0 <= destination < count, "paid destination")
    require(missing == [(machine["done"], 0), (machine["done"], 1)], "only done may halt")
    require(rows[machine["error"]] == [[0, 1, machine["error"]], [1, 1, machine["error"]]],
            "invalid input must have a paid nonterminal loop")
    cursor = 0
    block_names = set()
    for block in machine["blocks"]:
        require(block["name"] not in block_names, "duplicate block")
        block_names.add(block["name"])
        require(block["entry"] == cursor and block["states"] > 0, "block census gap")
        limit = cursor + block["states"]
        require(block["state_names"] == names[cursor:limit], "block/name census")
        cursor = limit
    require(cursor == count, "unaccounted states")
    return {"states": count, "rows": 2 * count, "missing_done_rows": 2,
            "nonterminal_rows": 2 * count - 2, "blocks": len(machine["blocks"])}


def export_and_reload(machine):
    """Fixtures run the numeric rows reloaded from disk, never builder callbacks."""
    write_json(WORK / "controller.json", machine)
    with (WORK / "controller-rows.jsonl").open("w", encoding="utf-8") as stream:
        for state, pair in enumerate(machine["rows"]):
            for symbol, row in enumerate(pair):
                stream.write(json.dumps({"state": state, "name": machine["names"][state],
                                         "symbol": symbol, "transition": row},
                                        separators=(",", ":")) + "\n")
    saved = json.loads((WORK / "controller.json").read_text(encoding="utf-8"))
    require(saved == machine, "controller JSON round trip")
    reconstructed = []
    with (WORK / "controller-rows.jsonl").open(encoding="utf-8") as stream:
        for index, line in enumerate(stream):
            record = json.loads(line)
            state, symbol = divmod(index, 2)
            require(state < saved["states"], "extra exported row")
            require(record["state"] == state and record["symbol"] == symbol and
                    record["name"] == saved["names"][state], "row stream order/name")
            if symbol == 0:
                reconstructed.append([])
            reconstructed[state].append(record["transition"])
    require(reconstructed == saved["rows"], "missing or different exported row")
    saved["rows"] = reconstructed
    validate_controller(saved)
    return saved


def seed_bits(symbols):
    require(all(type(symbol) is int and symbol in CODES for symbol in symbols), "seed alphabet")
    return MARKER + "0" + MARKER + "".join(CODES[symbol] for symbol in symbols) + "000"


def expected_output(symbols):
    """Declarative trInit/codec oracle: reverse stack, four fields, bottom flag.

    Uses arithmetic field encoding, not the controller's literal-code table,
    markers, shuttles, local writes, block definitions, or simulation routine.
    """
    cells = list(reversed(symbols)) or [0]
    bits = []
    for index, main in enumerate(cells):
        for field in (main, 0, 0, 0):
            bits.extend(str((field // (2 ** bit)) % 2) for bit in range(3))
        bits.append("1" if index == 0 else "0")
    return "".join(bits)


def support(bits, origin):
    return {origin + index for index, bit in enumerate(bits) if bit == "1"}


def interpret(machine, initial_ones, head, max_steps, initial_state=None):
    """Ordinary binary TM interpreter: the only machine memory is state/tape/head."""
    ones = set(initial_ones)
    state = machine["entry"] if initial_state is None else initial_state
    low = high = head
    covered = set()
    first_error = None
    for steps in range(max_steps + 1):
        symbol = int(head in ones)
        covered.add((state, symbol))
        if state == machine["error"] and first_error is None:
            first_error = steps
        row = machine["rows"][state][symbol]
        if row is None:
            reason = "halt"
            break
        if steps == max_steps:
            reason = "step_limit"
            break
        write, move, state = row
        if write:
            ones.add(head)
        else:
            ones.discard(head)
        head += move
        low, high = min(low, head), max(high, head)
    return {"reason": reason, "state": state, "head": head, "ones": ones,
            "steps": steps, "visited_min": low, "visited_max": high,
            "covered": covered, "first_error": first_error}


def check_result(machine, symbols, origin, result):
    bits = expected_output(symbols)
    expected_head = origin + 6 - 13 * len(symbols)
    expected_ones = support(bits, expected_head)
    require(result["reason"] == "halt" and result["state"] == machine["done"],
            ("successful done required", result["reason"], result["state"]))
    require(result["head"] == expected_head, ("wrong final head", result["head"], expected_head))
    # Sparse support is the entire tape; equality checks every nonblank cell and
    # establishes zero on both infinite exteriors in this interpreter's model.
    require(result["ones"] == expected_ones,
            ("complete tape mismatch", sorted(result["ones"] ^ expected_ones)[:24]))
    require(all(expected_head <= point < expected_head + len(bits) for point in result["ones"]),
            "nonblank exterior")
    expected_steps = 16 * len(symbols) ** 2 + 83 * len(symbols) + 62
    require(result["steps"] == expected_steps, ("step count", result["steps"], expected_steps))
    return {"input_length": len(symbols), "origin": origin, "steps": result["steps"],
            "head": result["head"], "output_bits": len(bits),
            "output_sha256": digest(bits.encode("ascii")), "nonblank_cells": len(expected_ones),
            "visited_min": result["visited_min"], "visited_max": result["visited_max"],
            "complete_support_equal": True, "both_exteriors_zero": True}


def run_fixture(machine, symbols, origin):
    require(len(symbols) <= 256, "Quadratic full-input replay forbidden; finite fixtures only")
    result = interpret(machine, support(seed_bits(symbols), origin), origin,
                       128 * (len(symbols) + 2) ** 2 + 256)
    return check_result(machine, symbols, origin, result), result


def finite_fixtures(machine, actual_final_symbol):
    cases = [(f"all_length_{length}_{''.join(map(str, values)) or 'empty'}", values)
             for length in range(4) for values in itertools.product(range(1, 5), repeat=length)]
    cases.extend([
        ("repeated_bit1", (4,) * 64), ("repeated_bit0", (3,) * 64),
        ("maximum_boundary_run", (4, 3) * 32), ("reverse_boundary_run", (3, 4) * 32),
        ("zero_ending_codes", (1, 2, 3) * 17),
        ("delimiter_at_both_ends", (1,) + (4, 3, 2) * 17 + (1,)),
        ("actual_final_symbol", (actual_final_symbol,)),
        ("mixed_odd_length", (1, 4, 3, 2, 4, 1, 3) * 9),
    ])
    reports, covered = [], set()
    for name, symbols in cases:
        for origin in (-101, -1, 0, 1, 137):
            report, result = run_fixture(machine, symbols, origin)
            report["name"] = name
            reports.append(report)
            covered.update(result["covered"])
    invalid = []
    for code in (5, 6, 7):
        bad_code = "".join(str((code >> bit) & 1) for bit in range(3))
        raw = MARKER + "0" + MARKER + bad_code + "000"
        for origin in (-29, 0, 31):
            original = support(raw, origin)
            result = interpret(machine, original, origin, 64)
            require(result["reason"] == "step_limit" and result["state"] == machine["error"] and
                    result["first_error"] == 16 and result["ones"] == original,
                    ("invalid code must enter preserving error loop", code, origin))
            covered.update(result["covered"])
            invalid.append({"code": code, "origin": origin, "first_error_step": 16,
                            "nonterminal_at_step": 64, "tape_unchanged": True})
    # Exercise both error rows directly, independently of the blank suffix.
    for bit in (0, 1):
        initial = {0} if bit else set()
        result = interpret(machine, initial, 0, 1, machine["error"])
        require(result["reason"] == "step_limit" and result["state"] == machine["error"] and
                result["head"] == 1 and result["ones"] == initial, "error row semantics")
        covered.update(result["covered"])
    return {"status": STATUS, "positive_cases": reports, "positive_count": len(reports),
            "invalid_code_cases": invalid, "covered_row_pairs": [list(pair) for pair in sorted(covered)],
            "coverage_claim": "Finite execution coverage only; every allocated row is exported separately",
            "step_formula_checked_on_fixtures": "16*n*n + 83*n + 62"}


def static_full_input(source_path):
    raw = source_path.read_bytes()
    require(digest(raw) == SOURCE_SHA256, "Not the accepted round01 native export bytes")
    source = json.loads(raw)
    require(source["schema"] == "chess-field-selective-v1", "accepted source schema")
    meta, cells, frozen_bits = source["metadata"], source["source_cells"], source["bits"]
    require(meta["machine_states"] == ACCEPTED_STATES and meta["body_states"] == BODY_STATES,
            "accepted machine/body changed")
    require(meta["source_cells_count"] == 141380 and meta["bits_count"] == 1837940,
            "accepted source dimensions changed")
    require(isinstance(cells, str) and len(cells) == 5 * 141380 and
            digest(cells.encode("ascii")) == CELLS_SHA256, "frozen source-cell bytes")
    require(isinstance(frozen_bits, str) and len(frozen_bits) == 1837940 and
            set(frozen_bits) <= {"0", "1"} and digest(frozen_bits.encode("ascii")) == TARGET_SHA256,
            "frozen target bits")
    reversed_symbols = []
    direct_encoding = []
    for index in range(141380):
        marker, main, field1, field2, field3 = cells[5 * index:5 * index + 5]
        require(marker == ("1" if index == 0 else "0"), ("source bottom marker", index))
        require(main in "1234" and (field1, field2, field3) == ("0", "0", "0"),
                ("source four-symbol/main-only contract", index))
        reversed_symbols.append(int(main))
        for field in (main, field1, field2, field3):
            direct_encoding.extend(str((int(field) >> bit) & 1) for bit in range(3))
        direct_encoding.append(marker)
    require("".join(direct_encoding) == frozen_bits, "native source cells do not encode frozen bits")
    original_symbols = tuple(reversed(reversed_symbols))
    seed = seed_bits(original_symbols)
    require(len(seed) == 3 * len(original_symbols) + 16 == 424156, "full seed length")
    # A separate static seed reader uses numeric positional weights and framing.
    require(seed[:13] == "0111100011110" and seed[-3:] == "000", "seed frame")
    payload = seed[13:-3]
    require(len(payload) % 3 == 0, "seed record alignment")
    decoded = tuple(sum(int(payload[index + offset]) * weight
                        for offset, weight in enumerate((1, 2, 4)))
                    for index in range(0, len(payload), 3))
    require(all(value in (1, 2, 3, 4) for value in decoded), "static decode alphabet")
    require(decoded == original_symbols, "seed original stack order")
    target = expected_output(decoded)
    require(target == frozen_bits, "full static seed/target equality")
    require("1111" not in payload, "payload creates a false marker")
    require("1111" not in "".join(CODES[value] + "0" * 10 for value in decoded),
            "unmarked output creates a false marker")
    seed_bytes = seed.encode("ascii")
    (WORK / "seed-bits.txt").write_bytes(seed_bytes)
    (WORK / "target-bits.txt").write_bytes(target.encode("ascii"))
    report = {
        "status": STATUS, "source_export": str(source_path.relative_to(ROOT))
        if source_path.is_relative_to(ROOT) else str(source_path),
        "source_export_sha256": digest(raw), "source_cells_sha256": CELLS_SHA256,
        "source_symbols": len(decoded), "symbol_histogram": {
            SYMBOL_NAMES[value]: count for value, count in sorted(Counter(decoded).items())},
        "actual_final_stack_symbol": decoded[-1], "seed_bits": len(seed),
        "seed_bytes_format": "ASCII 0/1, no newline, original stack order, charged trailing 000",
        "seed_bytes": len(seed_bytes), "seed_sha256": digest(seed_bytes),
        "writer_states": len(seed) + 1, "target_bits": len(target),
        "target_sha256": digest(target.encode("ascii")), "all_target_bits_equal": True,
        "source_main_only": True, "source_unique_first_marker": True,
        "payload_has_no_four_ones": True, "unmarked_output_has_no_four_ones": True,
        "full_controller_simulated": False,
        "scope": "Full static codec equality; universal controller correctness remains unproved",
    }
    write_json(WORK / "static-input.json", report)
    return report


def rejection(name, operation):
    try:
        operation()
    except AssertionError as error:
        return {"name": name, "rejected": True, "reason": str(error)}
    raise AssertionError((name, "deliberate corruption was accepted"))


def negative_controls(machine):
    """All mutations follow positive controls on this exact reloaded row table."""
    records = []
    ids = {name: state for state, name in enumerate(machine["names"])}

    def row_mutation(name, state_name, component, replacement, symbols=(1,)):
        changed = copy.deepcopy(machine)
        for row in changed["rows"][ids[state_name]]:
            row[component] = replacement
        validate_controller(changed)
        records.append(rejection(name, lambda: run_fixture(changed, symbols, 0)))

    row_mutation("B_overlap_marker_bit", "carry1.shift_b.02", 0, 0)
    row_mutation("A_shift_direction", "carry1.prepend.00", 1, -1)
    row_mutation("emitted_main_bit", "carry1.prepend.17", 0, 0)
    row_mutation("B_cleanup_residue", "finish.erase_b.01", 0, 1, ())
    row_mutation("A_cleanup_residue", "finish.erase_a.01", 0, 1, ())
    row_mutation("missing_bottom_marker", "finish.set_marker.00", 0, 0, ())
    row_mutation("wrong_final_head", "finish.back_head.10", 1, 1, ())
    changed = copy.deepcopy(machine)
    changed["rows"][ids["carry1.seek_a.run2"]][1][2] = ids["carry1.seek_a.run0"]
    records.append(rejection("scanner_counter_reset", lambda: run_fixture(changed, (1,), 0)))
    changed = copy.deepcopy(machine)
    changed["rows"][ids["parse.d1.v1"]][0][2] = ids["parse.d2.v3"]
    records.append(rejection("parser_counter_bit", lambda: run_fixture(changed, (1,), 0)))
    changed = copy.deepcopy(machine)
    changed["states"] -= 1
    records.append(rejection("unpaid_state_counter", lambda: validate_controller(changed)))
    changed = copy.deepcopy(machine)
    changed["rows"][machine["error"]][0] = None
    records.append(rejection("invalid_code_accidental_halt", lambda: validate_controller(changed)))
    _, good = run_fixture(machine, (4, 3, 1), -17)
    changed_result = copy.deepcopy(good)
    changed_result["ones"].add(1000000)
    records.append(rejection("far_right_exterior_residue",
                             lambda: check_result(machine, (4, 3, 1), -17, changed_result)))
    changed_result = copy.deepcopy(good)
    changed_result["ones"].add(-1000000)
    records.append(rejection("far_left_exterior_residue",
                             lambda: check_result(machine, (4, 3, 1), -17, changed_result)))
    changed_result = copy.deepcopy(good)
    changed_result["steps"] += 1
    records.append(rejection("wrong_step_counter",
                             lambda: check_result(machine, (4, 3, 1), -17, changed_result)))
    return {"status": STATUS, "positive_controls_ran_first": True,
            "controls": records, "rejected": len(records)}


def paid_count(machine, source):
    count = machine["states"]
    total = BODY_STATES + source["writer_states"] + count + LINK_STATES
    require(total == 997959 + count + LINK_STATES, "full paid formula")
    return {
        "status": STATUS, "controller_states_D": count, "controller_rows": 2 * count,
        "seed_bits": source["seed_bits"], "writer_states": source["writer_states"],
        "unchanged_body_states": BODY_STATES, "additional_link_states_H": LINK_STATES,
        "formula": "997959 + D + H", "complete_candidate_states": total,
        "accepted_complete_states": ACCEPTED_STATES, "prospective_saving": ACCEPTED_STATES - total,
        "strict_reduction": total < ACCEPTED_STATES,
        "million_initializer_saving_bound_D_plus_H_lt_413784": count + LINK_STATES < 413784,
        "stretch_D_plus_H_lt_2041": count + LINK_STATES < 2041,
        "all_allocated_states_paid": True,
        "scope": "Measured finite Python controller and symbolic composition only; no new certified full machine",
        "unproved_obligations": ["Universal expansion/cleanup and termination in Lean",
                                 "Exact controller-to-Lean numeric-row identity",
                                 "Instantiation of the protected success linker and paid writer",
                                 "Full chess halting equivalence and complete-machine row export"],
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source-export", type=Path, default=SOURCE_EXPORT)
    args = parser.parse_args()
    WORK.mkdir(parents=True, exist_ok=True)
    machine = build_controller()
    census = validate_controller(machine)
    machine = export_and_reload(machine)
    source = static_full_input(args.source_export.resolve())
    fixtures = finite_fixtures(machine, source["actual_final_stack_symbol"])
    write_json(WORK / "fixtures.json", fixtures)
    negatives = negative_controls(machine)
    write_json(WORK / "negative-controls.json", negatives)
    counts = paid_count(machine, source)
    write_json(WORK / "counts.json", counts)
    artifacts = ["controller.json", "controller-rows.jsonl", "seed-bits.txt", "target-bits.txt",
                 "static-input.json", "fixtures.json", "negative-controls.json", "counts.json"]
    result = {
        "status": STATUS, "passed": True,
        "github_run_id": os.environ.get("GITHUB_RUN_ID"),
        "github_sha": os.environ.get("GITHUB_SHA"),
        "source_sha256": digest(Path(__file__).read_bytes()),
        "census": census, "positive_fixtures": fixtures["positive_count"],
        "negative_controls": negatives["rejected"], "counts": counts,
        "artifact_sha256": {name: digest((WORK / name).read_bytes()) for name in artifacts},
        "full_quadratic_startup_executed": False,
        "claim": "Finite pilot only; accepted Lean-certified best remains 2411743 states",
    }
    write_json(WORK / "pilot-summary.json", result)
    print(json.dumps(result, sort_keys=True))
    print("Three-bit seed pilot passed")


if __name__ == "__main__":
    main()
