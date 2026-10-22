#!/usr/bin/env python3
"""Independent, bounded finite checks of a fully expanded binary decoder table.

This file never imports the controller generator or its transition helpers.
The arithmetic input/output oracle and sparse tape executor are independent.
Finite success is not a universal decoder theorem or an accepted chess machine.
"""
import os

if os.environ.get("CHESS_REMOTE") != "1" or os.environ.get("GITHUB_ACTIONS") != "true":
    raise SystemExit("Remote-only checker: CHESS_REMOTE=1 and GITHUB_ACTIONS=true required")

import argparse
import hashlib
import json
import resource
import time
import traceback
from pathlib import Path


HEADER = "0111100011110"
MARKER = "011110"
SCHEMA = "chess-table-seed-direct-binary-v1"
BANNER = "CHESS_TABLE_SEED_CONTROLLER_PILOT_PASSED"
MAX_STATES = 50000
MAX_FILE_BYTES = 64 * 1024 * 1024
MAX_CASE_STEPS = 4000000
MAX_BATCH_STEPS = 50000000
WALL_SECONDS = 540
MEMORY_BYTES = 4 * 1024 ** 3
OWNED = ("controller-summary.json", "controller-fixtures.json", "controller-controls.json",
         "controller-failure.json", "controller-progress.json", "controller-checker-source.json")


class CheckFailure(Exception):
    pass


class TableFailure(CheckFailure):
    pass


class OutputMismatch(CheckFailure):
    pass


class BudgetExceeded(CheckFailure):
    pass


def require(condition, message, error=CheckFailure):
    if not condition:
        raise error(message)


def digest(value):
    return hashlib.sha256(value).hexdigest()


def write_json(path, value):
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    temporary.replace(path)


def no_duplicate_keys(pairs):
    result = {}
    for key, value in pairs:
        require(key not in result, "Duplicate JSON key: " + key, TableFailure)
        result[key] = value
    return result


def integer(value, lower, upper, context):
    require(type(value) is int and lower <= value < upper,
            f"{context}: integer outside [{lower},{upper}): {value!r}", TableFailure)


def check_table(data):
    require(isinstance(data, dict) and data.get("schema") == SCHEMA, "Wrong controller schema", TableFailure)
    require(data.get("status") == "FINITE_UNVERIFIED_CONTROLLER", "Wrong controller classification", TableFailure)
    count = data["states"]
    integer(count, 1, MAX_STATES + 1, "Complete controller state budget")
    require(data["entry"] == 0 and type(data["entry"]) is int, "Entry is not state zero", TableFailure)
    integer(data["done"], 0, count, "Done control")
    integer(data["error"], 0, count, "Error control")
    require(data["done"] != data["error"], "Error control is terminal", TableFailure)
    names, rows, blocks = data["names"], data["rows"], data["blocks"]
    require(isinstance(names, list) and len(names) == count and
            all(isinstance(name, str) and name for name in names) and len(set(names)) == count,
            "Missing, duplicate or empty paid state names", TableFailure)
    require(isinstance(rows, list) and len(rows) == count, "Wrong full row-table length", TableFailure)
    missing = 0
    for state, pair in enumerate(rows):
        require(isinstance(pair, list) and len(pair) == 2, f"State {state} lacks two symbol rows", TableFailure)
        for bit, row in enumerate(pair):
            if row is None:
                require(state == data["done"], f"Undesignated missing row {state}/{bit}", TableFailure)
                missing += 1
                continue
            require(state != data["done"], "Designated done control has a transition", TableFailure)
            require(isinstance(row, list) and len(row) == 3, f"Bad transition arity {state}/{bit}", TableFailure)
            integer(row[0], 0, 2, f"Write at {state}/{bit}")
            require(type(row[1]) is int and row[1] in (-1, 1),
                    f"Implicit stay or nonbinary movement at {state}/{bit}", TableFailure)
            integer(row[2], 0, count, f"Target at {state}/{bit}")
    require(missing == 2, "Exactly the two designated done rows must be absent", TableFailure)
    require(rows[data["error"]] == [[0, 1, data["error"]], [1, 1, data["error"]]],
            "Designated error must preserve each symbol and move right forever", TableFailure)
    require(isinstance(blocks, list) and blocks, "No allocation blocks", TableFailure)
    cursor, block_names, by_state, categories = 0, set(), [], {}
    for block in blocks:
        require(isinstance(block, dict), "Malformed block record", TableFailure)
        name, kind = block["name"], block["kind"]
        require(isinstance(name, str) and name and name not in block_names,
                "Missing or duplicate block name", TableFailure)
        block_names.add(name)
        require(isinstance(kind, str) and kind, "Missing block kind", TableFailure)
        require(isinstance(block["contract"], str) and block["contract"], "Missing block contract", TableFailure)
        integer(block["entry"], 0, count, "Block entry")
        integer(block["states"], 1, count + 1, "Block state count")
        require(block["entry"] == cursor, "Noncontiguous or reordered block allocation", TableFailure)
        end = cursor + block["states"]
        require(end <= count and block["state_names"] == names[cursor:end],
                "Block names omit, duplicate or misidentify controls", TableFailure)
        by_state.extend([block] * block["states"])
        categories[kind] = categories.get(kind, 0) + block["states"]
        cursor = end
    require(cursor == count and len(by_state) == count, "Blocks do not cover every paid state", TableFailure)
    return {"states": count, "symbol_rows": 2 * count, "present_rows": 2 * count - missing,
            "missing_rows": missing, "blocks": len(blocks), "states_by_kind": categories,
            "all_states_paid": True, "all_rows_checked": True, "implicit_stay_moves": 0,
            "unique_terminal_control": data["done"]}, by_state


def natural_letters(value):
    """Arithmetic source-word oracle: LSB first; zero still ends in cons."""
    require(type(value) is int and value >= 0, "Invalid natural fixture")
    letters = []
    while value:
        letters.append(3 + value % 2)
        value //= 2
    return letters + [2]


def oracle(case):
    pre, rows, post = case["pre"], case["rows"], case["post"]
    require(all(type(symbol) is int and 1 <= symbol <= 4 for symbol in pre + post),
            "Invalid literal fixture letter")
    original = list(pre)
    for row in rows:
        require(isinstance(row, list) and len(row) == 3, "Fixture row is not a triple")
        tag, left, right = row
        require(type(tag) is int and 0 <= tag < 7 and
                all(type(x) is int and 0 <= x < 8192 for x in (left, right)), "Fixture row bounds")
        for word in row:
            original.extend(natural_letters(word))
    original.extend([1] + post)
    # Numeric code formation is independent of parser and table construction.
    words = {symbol: "".join(str(symbol // (2 ** bit) % 2) for bit in range(3))
             for symbol in range(1, 5)}
    packet = HEADER + "".join(words[symbol] for symbol in reversed(post)) + "000"
    for tag, left, right in reversed(rows):
        packet += "".join(str(tag // (2 ** bit) % 2) for bit in range(3))
        packet += "".join(str(right // (2 ** bit) % 2) for bit in range(12, -1, -1))
        packet += "".join(str(left // (2 ** bit) % 2) for bit in range(12, -1, -1))
    packet += "111" + "".join(words[symbol] for symbol in reversed(pre)) + "000"
    expected = HEADER + "".join(words[symbol] for symbol in original) + "000"
    require(len(packet) == 29 * len(rows) + 3 * (len(pre) + len(post)) + 22,
            "Independent packet length arithmetic")
    return packet, expected, original


def fixtures():
    cases = [{"name": "empty", "pre": [], "rows": [], "post": []},
             {"name": "zero_words", "pre": [], "rows": [[0, 0, 0]], "post": []},
             {"name": "all_letters", "pre": [1, 2, 3, 4], "rows": [], "post": [4, 3, 2, 1]},
             {"name": "all_tags_multiple_rows", "pre": [4, 1],
              "rows": [[tag, tag, 6 - tag] for tag in range(7)], "post": [2, 3]},
             {"name": "adjacent_maximal_words", "pre": [4, 4],
              "rows": [[6, 8191, 8191], [5, 8191, 8191], [4, 8191, 8191]], "post": [4, 4]}]
    for mask in range(8):
        cases.append({"name": f"phase_mask_{mask}", "pre": [3, 1] if mask & 1 else [],
                      "rows": [[3, 0, 1]] if mask & 2 else [], "post": [2, 4] if mask & 4 else []})
    for tag in range(7):
        cases.append({"name": f"tag_{tag}", "pre": [], "rows": [[tag, 0, 0]], "post": []})
    values = {0, 1, 4095, 4096, 4097, 8190, 8191}
    for exponent in range(13):
        for delta in (-1, 0, 1):
            value = 2 ** exponent + delta
            if 0 <= value < 8192:
                values.add(value)
    for value in sorted(values):
        cases.append({"name": f"operand_{value}", "pre": [1],
                      "rows": [[value % 7, value, 8191 - value]], "post": [4]})
    return cases


class Budget:
    def __init__(self):
        self.start = time.monotonic()
        self.deadline = self.start + WALL_SECONDS
        self.steps = 0

    def check(self):
        require(time.monotonic() < self.deadline, "Checker global deadline exhausted", BudgetExceeded)
        require(self.steps <= MAX_BATCH_STEPS, "Checker global step budget exhausted", BudgetExceeded)


def one_step(rows, state, head, ones):
    bit = int(head in ones)
    row = rows[state][bit]
    require(row is not None, "Unexpected terminal during fixed primitive", OutputMismatch)
    write, movement, target = row
    if write:
        ones.add(head)
    else:
        ones.discard(head)
    return target, head + movement, (state, bit, head, row)


def compare_output(head, ones, expected_head, expected_support, context):
    if head != expected_head:
        raise OutputMismatch(f"{context}: final head {head}, expected {expected_head}")
    relative = {position - head for position in ones}
    if relative != expected_support:
        extra = sorted(relative - expected_support)[:12]
        missing = sorted(expected_support - relative)[:12]
        raise OutputMismatch(f"{context}: complete relative support mismatch; extra={extra}; missing={missing}")


def run_packet(data, by_state, case, origin, budget, rows=None, capture=False, cap=None, progress=None):
    packet, expected, letters = oracle(case)
    rows = data["rows"] if rows is None else rows
    state, head = data["entry"], origin
    ones = {origin + index for index, bit in enumerate(packet) if bit == "1"}
    expected_head = origin - 3 * len(letters) - 7
    expected_support = {index for index, bit in enumerate(expected) if bit == "1"}
    cap = min(MAX_CASE_STEPS, max(20000, 128 * (len(packet) + len(expected) + 32) ** 2)) if cap is None else cap
    if progress is not None:
        progress.update(current_case=case["name"], current_origin=origin,
                        current_step_cap=cap, current_steps=0)
    visited, snapshots, last = set(), {}, None
    for steps in range(cap + 1):
        if progress is not None:
            progress["current_steps"] = steps
        if steps % 2048 == 0:
            budget.check()
        if state == data["done"]:
            compare_output(head, ones, expected_head, expected_support, case["name"])
            return {"name": case["name"], "origin": origin, "steps": steps, "step_cap": cap,
                    "packet_bits": len(packet), "expected_seed_bits": len(expected),
                    "letters": len(letters), "physical_head": head,
                    "all_nonzero_cells": len(ones), "complete_support_equal": True,
                    "exact_head": True, "blank_exteriors": True,
                    "visited_symbol_rows": len(visited), "packet_sha256": digest(packet.encode()),
                    "expected_seed_sha256": digest(expected.encode())}, snapshots, last
        require(steps < cap, f"Fixture {case['name']} exceeded {cap} transitions", BudgetExceeded)
        block = by_state[state]
        if capture and state == block["entry"]:
            kind = block["kind"]
            key = kind if kind in ("consume_shift", "cleanup_header", "final_head") else None
            if kind == "emit_code" and "row.t0.right.cons" in block["name"] and case["name"] == "zero_words":
                key = "zero_word_cons"
            if key is not None and key not in snapshots:
                snapshots[key] = {"state": state, "head": head, "ones": ones.copy(), "block": block,
                                  "case": case, "origin": origin}
        state, head, last = one_step(rows, state, head, ones)
        visited.add(last[:2])
        budget.steps += 1
    raise BudgetExceeded("Unreachable packet simulation bound")


def run_fixed(rows, snapshot, steps, budget, progress=None):
    state, head, ones = snapshot["state"], snapshot["head"], snapshot["ones"].copy()
    trace = []
    for index in range(steps):
        if progress is not None:
            progress["current_steps"] = index
        budget.check()
        state, head, event = one_step(rows, state, head, ones)
        trace.append(event)
        budget.steps += 1
    if progress is not None:
        progress["current_steps"] = steps
    return state, head, ones, trace


def primitive_oracle(key, snapshot):
    head, expected = snapshot["head"], snapshot["ones"].copy()
    if key == "consume_shift":
        start, bits, final_head, steps = head - 5, "0" + MARKER, head - 4, 8
    elif key == "zero_word_cons":
        start, bits, final_head, steps = head - 2, "010", head - 3, 3
    elif key == "cleanup_header":
        start, bits, final_head, steps = head - 12, HEADER, head - 13, 13
    elif key == "final_head":
        return head + 1, expected, 1
    else:
        raise CheckFailure("Unknown primitive oracle")
    for index, bit in enumerate(bits):
        if bit == "1":
            expected.add(start + index)
        else:
            expected.discard(start + index)
    return final_head, expected, steps


def check_primitive(rows, key, snapshot, budget, progress=None):
    expected_head, expected, steps = primitive_oracle(key, snapshot)
    state, head, ones, trace = run_fixed(rows, snapshot, steps, budget, progress)
    compare_output(head, ones, expected_head, {p - expected_head for p in expected}, key)
    require(not snapshot["block"]["entry"] <= state < snapshot["block"]["entry"] + snapshot["block"]["states"],
            f"{key}: primitive did not leave its paid block", OutputMismatch)
    return trace


def changed_row(rows, state, bit, replacement):
    copy_rows = list(rows)
    copy_rows[state] = list(rows[state])
    copy_rows[state][bit] = replacement
    return copy_rows


def negative_controls(data, by_state, cases_by_name, positives, snapshots, budget,
                      controls, output, progress):
    check_table(data)  # Exact unmutated allocation oracle, before structural mutations.
    undercount = dict(data, states=data["states"] - 1)
    omitted_block = dict(data, blocks=data["blocks"][:-1])
    undesignated_halt = dict(data, rows=changed_row(data["rows"], data["entry"], 0, None))
    for name, changed in (("allocation_undercount", undercount),
                          ("allocation_missing_block", omitted_block),
                          ("undesignated_terminal", undesignated_halt)):
        progress.update(control=name)
        write_json(output / "controller-progress.json", progress)
        try:
            check_table(changed)
        except TableFailure as error:
            controls.append({"name": name, "rejected": True, "original_positive_passed": True,
                             "scope": "complete state, row and block allocation",
                             "reason": str(error), "timeout_counted_as_rejection": False})
            write_json(output / "controller-controls.json", controls)
        else:
            raise CheckFailure("Changed allocation escaped complete table oracle: " + name)
    case = cases_by_name["empty"]
    positive, _, last = run_packet(data, by_state, case, 0, budget, progress=progress)
    require(positive["complete_support_equal"], "Missing unmutated full positive control")
    state, bit, _, old = last
    first_bit = int(HEADER[0])
    mutations = []
    replacement = list(old)
    replacement[0] = 1 - replacement[0]
    mutations.append(("table_write", changed_row(data["rows"], state, bit, replacement)))
    replacement = list(old)
    replacement[1] *= -1
    mutations.append(("table_movement", changed_row(data["rows"], state, bit, replacement)))
    replacement = list(data["rows"][data["entry"]][first_bit])
    replacement[2] = data["done"]
    mutations.append(("table_destination", changed_row(data["rows"], data["entry"], first_bit, replacement)))
    for name, rows in mutations:
        progress.update(control=name)
        write_json(output / "controller-progress.json", progress)
        try:
            run_packet(data, by_state, case, 0, budget, rows=rows,
                       cap=min(MAX_CASE_STEPS, positive["steps"] * 2 + 1000), progress=progress)
        except OutputMismatch as error:
            controls.append({"name": name, "rejected": True, "original_positive_passed": True,
                             "scope": "complete valid empty packet", "reason": str(error),
                             "timeout_counted_as_rejection": False})
            write_json(output / "controller-controls.json", controls)
        else:
            raise CheckFailure("Changed complete controller escaped output oracle: " + name)
    for key in ("consume_shift", "zero_word_cons", "cleanup_header", "final_head"):
        progress.update(control=key)
        write_json(output / "controller-progress.json", progress)
        require(key in snapshots, "Missing reached primitive context: " + key)
        snapshot = snapshots[key]
        progress.update(current_case=snapshot["case"]["name"], current_origin=snapshot["origin"],
                        current_step_cap=primitive_oracle(key, snapshot)[2], current_steps=0)
        require((snapshot["case"]["name"], snapshot["origin"]) in positives,
                "Primitive context has no complete successful parent fixture")
        trace = check_primitive(data["rows"], key, snapshot, budget, progress)
        if key == "zero_word_cons":
            rows = data["rows"]
            for state, bit, _, row in trace:
                replacement = list(row)
                replacement[0] = 0
                rows = changed_row(rows, state, bit, replacement)
        else:
            event = trace[1] if key == "cleanup_header" else trace[-1] if key == "final_head" else trace[0]
            state, bit, _, row = event
            replacement = list(row)
            if key == "final_head":
                replacement[1] *= -1
            else:
                replacement[0] = 1 - replacement[0]
            rows = changed_row(data["rows"], state, bit, replacement)
        try:
            check_primitive(rows, key, snapshot, budget, progress)
        except OutputMismatch as error:
            controls.append({"name": key, "rejected": True, "original_positive_passed": True,
                             "complete_parent_fixture": snapshot["case"]["name"],
                             "scope": "complete actual-context primitive, entire tape and exact head",
                             "block": snapshot["block"]["name"], "fixed_steps": len(trace),
                             "reason": str(error), "timeout_counted_as_rejection": False})
            write_json(output / "controller-controls.json", controls)
        else:
            raise CheckFailure("Changed primitive escaped independent geometry oracle: " + key)
    return controls


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--controller", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    require(not any((args.output / name).exists() for name in OWNED), "Refusing to overwrite checker evidence")
    budget, records, controls, progress = Budget(), [], [], {"phase": "load", "status": "running"}
    report = {"status": "running", "classification": "FINITE_CONTROLLER_CHECKS_ONLY",
              "universal_proof": False, "new_accepted_machine": False, "full_chess_packet_executed": False,
              "packet_identity_run": "39807083846", "packet_identity_source": "6b2e1209f7730b8e717ac29c972ce5d170262877",
              "resource_bounds": {"wall_seconds": WALL_SECONDS, "memory_bytes": MEMORY_BYTES,
                                  "per_case_steps_max": MAX_CASE_STEPS, "batch_steps_max": MAX_BATCH_STEPS,
                                  "root_combined_wall_seconds": 600}}
    try:
        soft, hard = resource.getrlimit(resource.RLIMIT_AS)
        limit = MEMORY_BYTES if hard == resource.RLIM_INFINITY else min(MEMORY_BYTES, hard)
        resource.setrlimit(resource.RLIMIT_AS, (limit, limit))
        require(args.controller.stat().st_size <= MAX_FILE_BYTES, "Controller artifact exceeds read bound")
        raw = args.controller.read_bytes()
        report["controller_sha256"] = digest(raw)
        report["controller_bytes"] = len(raw)
        write_json(args.output / "controller-checker-source.json", {
            "checker_sha256": digest(Path(__file__).read_bytes()), "controller_sha256": digest(raw),
            "commit": os.environ.get("GITHUB_SHA"), "run_id": os.environ.get("GITHUB_RUN_ID"),
            "generator_imported": False})
        data = json.loads(raw, object_pairs_hook=no_duplicate_keys)
        progress.update(phase="allocation")
        write_json(args.output / "controller-progress.json", progress)
        census, by_state = check_table(data)
        report["allocation"] = census
        count = census["states"]
        report["controller_states"] = count
        report["transition_rows"] = 2 * count
        report["accounting"] = {"complete_decoder_states": count, "complete_symbol_rows": 2 * count,
            "packet_writer_states": 173642, "new_exact_head_bridge_states": 1,
            "retained_expander_states": 216, "retained_exact_head_bridge_states": 1,
            "full_with_current_573802_body": 747662 + count,
            "conditional_full_with_114487_body": 288347 + count,
            "prospective_same_body_saving": 250514 - count,
            "conditional_body_certificate_required": True, "new_accepted_machine": False}
        cases, positives, snapshots = fixtures(), set(), {}
        for case in cases:
            origins = (0, -37, 101) if case["name"] in ("empty", "zero_words", "all_letters", "adjacent_maximal_words") else (0,)
            for origin in origins:
                progress.update(phase="positives", case=case["name"], fixture=case, origin=origin,
                                completed=len(records), total_steps=budget.steps)
                write_json(args.output / "controller-progress.json", progress)
                record, captured, _ = run_packet(data, by_state, case, origin, budget, capture=True,
                                                progress=progress)
                records.append(dict(record, pre=case["pre"], rows=case["rows"], post=case["post"]))
                positives.add((case["name"], origin))
                for key, snapshot in captured.items():
                    snapshots.setdefault(key, snapshot)
                write_json(args.output / "controller-fixtures.json", records)
        progress.update(phase="negative_controls", completed=len(records), total_steps=budget.steps)
        write_json(args.output / "controller-progress.json", progress)
        controls = negative_controls(data, by_state, {case["name"]: case for case in cases},
                                     positives, snapshots, budget, controls, args.output, progress)
        budget.check()
        write_json(args.output / "controller-controls.json", controls)
        report.update(status="passed", positive_fixtures=len(records), negative_controls=len(controls),
                      all_negative_controls_rejected=all(control["rejected"] for control in controls),
                      maximum_fixture_steps=max(record["steps"] for record in records),
                      complete_support_and_exact_head=True, translated_origins=[-37, 0, 101],
                      primitive_contexts=sorted(snapshots), all_seven_tags=True,
                      cases_recorded=True, timeouts_counted_as_rejections=0)
    except BaseException as error:
        report.update(status="failed", first_failure={"phase": progress.get("phase"),
                      "case": progress.get("case"), "origin": progress.get("origin"),
                      "control": progress.get("control"),
                      "current_case": progress.get("current_case"),
                      "current_steps": progress.get("current_steps"),
                      "current_step_cap": progress.get("current_step_cap"),
                      "exception": type(error).__name__, "reason": str(error)},
                      positive_fixtures=len(records), negative_controls=len(controls))
        write_json(args.output / "controller-failure.json", dict(report["first_failure"], traceback=traceback.format_exc()))
        raise
    finally:
        report.update(elapsed_seconds=time.monotonic() - budget.start, total_simulated_steps=budget.steps,
                      maximum_fixture_steps=max((record["steps"] for record in records), default=0),
                      maximum_fixture_steps_scope="completed positive fixtures",
                      peak_rss_kib=resource.getrusage(resource.RUSAGE_SELF).ru_maxrss)
        write_json(args.output / "controller-progress.json", progress)
        write_json(args.output / "controller-summary.json", report)
    print(BANNER)


if __name__ == "__main__":
    main()
