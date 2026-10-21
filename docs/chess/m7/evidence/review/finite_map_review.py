#!/usr/bin/env python3
"""Light referee checks of the numeric map; never a general semantic proof."""
from pathlib import Path
import hashlib
import importlib.util
import json
import sys

sys.dont_write_bytecode = True
ROOT = next(p for p in Path(__file__).resolve().parents
            if (p / "scripts/verify_chess_m7.py").is_file())
loader = importlib.util.spec_from_file_location("referee_quotient", ROOT / "scripts/chess_m7/quotient_table.py")
tool = importlib.util.module_from_spec(loader)
sys.modules[loader.name] = tool
loader.loader.exec_module(tool)


def swap(q, root):
    return root if q == 0 else 0 if q == root else q


def encode_old(pc, value, stores):
    return 1 + (0 if pc is None else pc + 1) * stores + value


def encode_new(pc, value, stores, initial):
    raw = 0 if pc is None else 1 + pc * stores + value
    return swap(raw, 1 + initial * stores)


def descriptor_old(q, stores, initial):
    if q == 0:
        return initial, 0
    pc, value = divmod(q - 1, stores)
    return (None if pc == 0 else pc - 1), value


def descriptor_new(q, stores, initial):
    raw = swap(q, 1 + initial * stores)
    return (None, 0) if raw == 0 else divmod(raw - 1, stores)


def auxiliary(pc, value, bit, nodes, stores, initial):
    # A finite descending load/branch chain, with freely looping goto targets.
    kind = pc % 7
    if kind == 0:
        return None, value, "write", bit
    if kind == 1:
        return initial if (value + bit) % 2 else 0, value, "write", bit
    if kind == 2:
        return pc - 1, value, "move", "L" if bit else "R"
    if kind == 3:
        return pc - 1, value, "write", (value + bit) % 2
    if kind == 4:
        return auxiliary(pc - 1, (value + 1 + bit) % stores, bit, nodes, stores, initial)
    if kind == 5:
        return auxiliary(pc - (1 if (value + bit) % 2 else 2), value, bit, nodes, stores, initial)
    return pc - 1, value, "write", 1 - bit


def direct_row(state, bit, prefix, nodes, stores, initial, compact):
    post = 1 + (nodes * stores if compact else (nodes + 1) * stores)
    if state < prefix:
        # Includes the last prefix row targeting the ordinary body state zero.
        return ((state + bit) % 2, "R" if state < prefix // 2 else "L", state + 1)
    block, control = divmod(state - prefix, post)
    if block == 1:
        return bit, "L", prefix + control
    decoder = descriptor_new if compact else descriptor_old
    pc, value = decoder(control, stores, initial)
    if pc is None:
        return None
    pc, value, command, operand = auxiliary(pc, value, bit, nodes, stores, initial)
    encoder = encode_new if compact else encode_old
    destination = encoder(pc, value, stores, initial) if compact else encoder(pc, value, stores)
    if command == "move":
        return bit, operand, prefix + destination
    return operand, "R", prefix + post + destination


def serialize(cells):
    return (" ".join("---" if cell is None else f"{cell[0]}{cell[1]}{cell[2]}" for cell in cells) + "\n").encode()


def main():
    counts = dict(parameter_cases=0, mapped_old_controls=0, canonical_new_controls=0,
                  interval_segment_checks=0, synthetic_binary_cells=0)
    for nodes in range(1, 8):
        for stores in range(1, 5):
            for initial in range(nodes):
                for prefix in range(4):
                    q = tool.Quotient(prefix, 1 + (nodes + 1) * stores, stores, initial)
                    counts["parameter_cases"] += 1
                    for old in range(q.post):
                        pc, value = descriptor_old(old, stores, initial)
                        assert q.post_map(old) == encode_new(pc, value, stores, initial)
                        counts["mapped_old_controls"] += 1
                    for new in range(q.after):
                        assert q.state_map(q.section(new)) == new
                        counts["canonical_new_controls"] += 1
                    # Every possible start/end pair, checking the entire segment expansion.
                    for start in range(q.after + 1):
                        for end in range(start, q.after + 1):
                            expanded = [old + offset for _, length, old in q.segments(start, end - start)
                                        for offset in range(length)]
                            assert expanded == [q.section(i) for i in range(start, end)]
                            counts["interval_segment_checks"] += 1
                    for old in range(q.before):
                        mapped = q.state_map(old)
                        converted = []
                        before = []
                        for bit in range(2):
                            actual = direct_row(old, bit, prefix, nodes, stores, initial, False)
                            expected = direct_row(mapped, bit, prefix, nodes, stores, initial, True)
                            renamed = None if actual is None else (*actual[:2], q.state_map(actual[2]))
                            assert renamed == expected
                            before.append(actual)
                            converted.append(expected)
                            counts["synthetic_binary_cells"] += 1
                        assert q.row(serialize(before), old) == serialize(converted)
    pins = json.loads((ROOT / "docs/chess/m7/baseline-pins.json").read_text())
    assert len(pins) == 172
    assert all(hashlib.sha256((ROOT / p).read_bytes()).hexdigest() == h for p, h in pins.items())
    result = {"status": "passed", "scope": "bounded Python arithmetic and synthetic-table checks; no Lean or chess execution", **counts,
              "frozen_baseline_inputs_matching": len(pins),
              "quotient_tool_sha256": hashlib.sha256((ROOT / "scripts/chess_m7/quotient_table.py").read_bytes()).hexdigest()}
    Path(__file__).with_name("finite_map_result.json").write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
