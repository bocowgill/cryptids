#!/usr/bin/env python3
"""Bounded remote-only packet census; no TM controller or Lean certificate."""
import os

if os.environ.get("CHESS_REMOTE") != "1" or os.environ.get("GITHUB_ACTIONS") != "true":
    raise SystemExit("Remote-only census: require CHESS_REMOTE=1 and GITHUB_ACTIONS=true")

import argparse
import hashlib
import json
import re
import resource
import signal
import sys
import time
import traceback
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
ORACLE = "docs/chess/campaign-2026-10-22/round-02/evidence/final/unpacked/machine-export.json"
ORACLE_SHA = "16e42308a35d2b68bc2e22870494715652ec106656cb53059a10605ba3fe8c2b"
MODEL = "Cryptids/Chess/Compilation/SourceModel.lean"
TAPE = "Cryptids/Chess/Compilation/Tape.lean"
CLASSIFICATION = "FINITE_PACKET_CENSUS_ONLY"
BANNER = "CHESS_TABLE_SEED_PACKET_CENSUS_PASSED"
HEADER = "0111100011110"
CODES = {1: "100", 2: "010", 3: "110", 4: "001"}
SOURCE_PATHS = [MODEL, TAPE, "Cryptids/Chess/Compilation/Input.lean",
                "Cryptids/Chess/Compilation/SourceCertificate.lean",
                "Cryptids/Compilation/CodeDAG.lean", "Cryptids/Compilation/RuntimeWire.lean",
                "Cryptids/Compilation/Seed/Format.lean", "Cryptids/Compilation/Seed/ChessCodec.lean",
                "scripts/chess_seed_20261022/Export.lean",
                "scripts/chess_table_seed_20261022/pilot.py"]
# Copied from accepted round02 baseline pins and final source manifest, not measured here.
IDENTITY_PINS = {
    MODEL: "077268682267b94fae672c7b1bad726a4baa201fa3eb46c553bd4ba016d55202",
    TAPE: "7dfc07955ae460efb1e37fb1bb212b7feccfb7b5aa4ea5758f199c6893383fea",
    "Cryptids/Chess/Compilation/Input.lean": "5ace349af5d55572f80dc653c208ec6047d39ff77c6ab5b177b793eab3541f18",
    "Cryptids/Compilation/CodeDAG.lean": "89750a8d709f5e90b8b61c8b44b394b0b57be8f443092a632b0190d0c632a80f",
    "Cryptids/Compilation/RuntimeWire.lean": "feb92be30f18c80c3d4351d31a68e416393dbb50f056936b450c5437b58384b6",
    "Cryptids/Compilation/Seed/Format.lean": "d2cce4c27619af93d7aa158e60f8e573e26486a8769bf056c8963821f1ca7aea",
    "Cryptids/Compilation/Seed/ChessCodec.lean": "5eba1992db784c5994b75af068c6f90aa1a941ca4fc06e0e6618e7dff4ea1116",
}
OWNED_ARTIFACTS = (
    "packet-source-manifest.json", "source-input.json", "source-symbols.u8", "packet.bits",
    "packet.bin", "decoded-seed.bits", "decoded-symbols.u8", "fixtures.json",
    "hostile-controls.json", "counts.json", "artifact-manifest.json", "pilot-summary.json",
    "pilot-progress.json", "failure.txt", "hard-timeout.txt",
)


class CensusError(Exception):
    pass


def require(condition, message):
    if not condition:
        raise CensusError(message)


def sha(data):
    return hashlib.sha256(data).hexdigest()


def write_json(path, value):
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    temporary.replace(path)


def bounded_read(path, limit=128 * 1024 * 1024):
    require(path.stat().st_size <= limit, f"Oversized input: {path.name}")
    return path.read_bytes()


def no_duplicate_keys(pairs):
    result = {}
    for key, value in pairs:
        require(key not in result, f"Duplicate JSON key: {key}")
        result[key] = value
    return result


def strip_comments(text):
    """Nested Lean block/line comments; preserve all noncomment source verbatim."""
    result, i, depth = [], 0, 0
    while i < len(text):
        pair = text[i:i + 2]
        if pair == "/-":
            depth += 1
            result.append("  ")
            i += 2
        elif depth and pair == "-/":
            depth -= 1
            result.append("  ")
            i += 2
        elif depth:
            result.append("\n" if text[i] == "\n" else " ")
            i += 1
        elif pair == "--":
            end = text.find("\n", i)
            end = len(text) if end < 0 else end
            result.append(" " * (end - i))
            i = end
        else:
            result.append(text[i])
            i += 1
    require(depth == 0, "Unterminated Lean block comment")
    return "".join(result)


def parse_sources(model_text, tape_text):
    """Restricted literal grammar, not a Lean interpreter or regex row sampler."""
    model = strip_comments(model_text)
    start = re.search(r"^def rowBlock\d+_\d+\b", model, re.M)
    require(start is not None, "Missing literal row blocks")
    tail = model[start.start():]
    block_re = re.compile(
        r"def (rowBlock(\d+)_(\d+)) : List CodeDAG\.Node :=\s*"
        r"(\[[^\]]*\]|rowBlock\d+_\d+\s*\+\+\s*rowBlock\d+_\d+)\s*")
    tags = {"zero": (0, 0), "succ": (1, 0), "tail": (2, 0),
            "cons": (3, 2), "comp": (4, 2), "branch": (5, 2), "fix": (6, 1)}
    blocks, cursor = {}, 0
    while True:
        match = block_re.match(tail, cursor)
        if match is None:
            break
        name, offset, count, body = match.groups()
        require(name not in blocks, f"Duplicate block {name}")
        offset, count = int(offset), int(count)
        if body.startswith("["):
            entries = body[1:-1].split(",")
            require(count == 32 and len(entries) == 32, f"Leaf census {name}")
            rows = []
            for entry in entries:
                node = re.fullmatch(r"\s*\.(zero|succ|tail|cons|comp|branch|fix)((?:\s+\d+)*)\s*", entry)
                require(node is not None, f"Unsupported node in {name}: {entry[:80]}")
                constructor, operands = node.groups()
                values = [int(value) for value in operands.split()]
                tag, arity = tags[constructor]
                require(len(values) == arity, f"Constructor arity in {name}")
                rows.append((tag, *(values + [0] * (2 - arity))))
            blocks[name] = (offset, count, rows)
        else:
            blocks[name] = (offset, count, tuple(re.split(r"\s*\+\+\s*", body)))
        cursor = match.end()
    end = re.fullmatch(
        r"def rows : Array CodeDAG\.Node := (rowBlock\d+_\d+)\.toArray\s*"
        r"def dag : CodeDAG\.DAG := ⟨rows, (\d+)⟩\s*end Chess\.Compilation\.SourceModel\s*",
        tail[cursor:])
    require(end is not None, "Unconsumed or unsupported row/rows/dag declaration")
    root_block, root_text = end.groups()
    visited, active = set(), set()

    def resolve(name):
        require(name in blocks, f"Missing block {name}")
        require(name not in active and name not in visited, f"Cyclic/reused block {name}")
        active.add(name)
        offset, count, body = blocks[name]
        if isinstance(body, list):
            result = body
        else:
            left, right = body
            require(left in blocks and right in blocks, f"Missing append child {name}")
            lo, lc, _ = blocks[left]
            ro, rc, _ = blocks[right]
            require(lo == offset and ro == lo + lc and count == lc + rc,
                    f"Noncontiguous append {name}")
            result = resolve(left) + resolve(right)
        require(len(result) == count, f"Resolved block count {name}")
        active.remove(name)
        visited.add(name)
        return result

    rows = resolve(root_block)
    require(visited == set(blocks), "Unreferenced literal row blocks")
    require(blocks[root_block][:2] == (0, 5952) and len(rows) == 5952, "Frozen table span")
    root = int(root_text)
    require(root == 5951 and root < len(rows), "Frozen root identity")
    for i, (tag, left, right) in enumerate(rows):
        operands = (left, right) if tag in (3, 4, 5) else (left,) if tag == 6 else ()
        require(all(0 <= child < i for child in operands), f"Source child bound at row {i}")
        require(left < 8192 and right < 8192, f"Thirteen-bit bound at row {i}")
    tape = strip_comments(tape_text)
    declarations = re.findall(r"\bdef literalArgument\b", tape)
    bodies = re.findall(r"^def literalArgument : List Nat :=(.*?)^theorem argument_eq\b", tape, re.M | re.S)
    require(len(declarations) == len(bodies) == 1, "Exact literalArgument declaration boundary")
    argument = re.fullmatch(r"\s*\[(0x[0-9a-fA-F]+)\]\s*", bodies[0])
    require(argument is not None, "LiteralArgument RHS is not exactly one hexadecimal natural")
    require(len(argument[1]) <= 4096, "Oversized argument literal")
    for name, declaration, next_declaration, rhs in (
        ("table", r"def table : CodeDAG\.DAG :=", r"def argument\b", r"SourceModel\.dag"),
        ("input", r"def input : List Γ' :=", r"theorem table_valid\b",
         r"RuntimeWire\.input table literalArgument"),
    ):
        bodies = re.findall(r"^" + declaration + r"(.*?)^" + next_declaration, tape, re.M | re.S)
        require(len(re.findall(r"^def " + name + r"\b", tape, re.M)) == 1
                and len(bodies) == 1 and re.fullmatch(r"\s*" + rhs + r"\s*", bodies[0]) is not None,
                f"Exact Tape.{name} source binding changed")
    return rows, root, int(argument[1], 16), {"blocks": len(blocks), "root_block": root_block}


def natural_symbols(values):
    """Source oracle: canonical low-bit first digits, then cons, including zero."""
    result = []
    for value in values:
        require(type(value) is int and value >= 0, "Invalid natural")
        while value:
            result.append(3 + (value & 1))
            value >>= 1
        result.append(2)
    return result


def original_symbols(pre, rows, post):
    return pre + natural_symbols([value for row in rows for value in row]) + [1] + post


def original_seed(symbols):
    return HEADER + "".join(CODES[code] for code in symbols) + "000"


def encode_packet(pre, rows, post):
    pieces = [HEADER, "".join(CODES[code] for code in reversed(post)), "000"]
    for tag, left, right in reversed(rows):
        require(0 <= tag < 7 and 0 <= left < 8192 and 0 <= right < 8192, "Packet field range")
        pieces.extend((format(tag, "03b")[::-1], format(right, "013b"), format(left, "013b")))
    pieces.extend(("111", "".join(CODES[code] for code in reversed(pre)), "000"))
    return "".join(pieces)


def decode_packet(packet):
    """Independent online emission model: no natural_symbols/original_seed/encoder call."""
    require(isinstance(packet, str) and set(packet) <= {"0", "1"}, "Nonbinary packet")
    require(packet[:13] == "0111100011110", "Packet marker/gap framing")
    position, emissions, backwards_rows = 13, [], []
    literal_codes = {"100": 1, "010": 2, "110": 3, "001": 4}

    def take(width):
        nonlocal position
        require(position + width <= len(packet), f"Truncated field at bit {position}")
        bits = packet[position:position + width]
        position += width
        return bits

    def literal_phase():
        decoded = []
        while True:
            code = take(3)
            if code == "000":
                return decoded
            require(code in literal_codes, f"Invalid literal code at bit {position - 3}")
            decoded.append(literal_codes[code])
            emissions.append(literal_codes[code])

    def emit_msb(bits):
        emissions.append(2)  # Every word, even zero, ends in cons after reversal.
        significant = False
        value = 0
        for bit in bits:
            value = 2 * value + (bit == "1")
            significant = significant or bit == "1"
            if significant:
                emissions.append(4 if bit == "1" else 3)
        return value

    reverse_post = literal_phase()
    emissions.append(1)
    while True:
        bits = take(3)
        tag = (bits[0] == "1") + 2 * (bits[1] == "1") + 4 * (bits[2] == "1")
        if tag == 7:
            break
        right = emit_msb(take(13))
        left = emit_msb(take(13))
        emit_msb(bits[::-1])
        backwards_rows.append((tag, left, right))
    reverse_pre = literal_phase()
    require(position == len(packet), f"Unconsumed packet suffix at bit {position}")
    symbols = list(reversed(emissions))
    # Reconstruct words arithmetically, independently of encoder's CODES table.
    payload = "".join("".join(str((code >> i) & 1) for i in range(3)) for code in symbols)
    return {"symbols": symbols, "rows": list(reversed(backwards_rows)),
            "pre": list(reversed(reverse_pre)), "post": list(reversed(reverse_post)),
            "seed": "011110" + "0" + "011110" + payload + "000", "consumed_bits": position}


def check_static_tape(bits, expected, head=0, extra_ones=()):
    """Finite-support equality only, with declared zero exterior; no TM execution."""
    require(head == 0, "Relative seed head is not zero")
    require(bits == expected, "Complete finite seed bits differ")
    actual_support = {i for i, bit in enumerate(bits) if bit == "1"} | set(extra_ones)
    expected_support = {i for i, bit in enumerate(expected) if bit == "1"}
    require(actual_support == expected_support, "Nonzero exterior or tape support differs")


def check_packet(packet, pre, rows, post, expected):
    decoded = decode_packet(packet)
    require(decoded["pre"] == pre and decoded["post"] == post, "Literal phase order/content")
    require(decoded["rows"] == rows, "Complete row order/content")
    check_static_tape(decoded["seed"], expected)
    return decoded


def packed_bytes(bits):
    padding = (-len(bits)) % 8
    padded = bits + "0" * padding
    return bytes(int(padded[i:i + 8], 2) for i in range(0, len(padded), 8))


def fixture_checks():
    edges = [0, 1, 2, 3, 4095, 4096, 4097, 8190, 8191]
    edges += [1 << i for i in range(13)]
    cases = [("empty_sections", [], [], []),
             ("all_literal_letters", [1, 2, 3, 4], [], [4, 3, 2, 1]),
             ("record_boundaries", [4], [(3, 8191, 8191), (6, 0, 0), (0, 0, 0)], [3])]
    for tag in range(7):
        for value in sorted(set(edges)):
            row = (tag, value, 8191 - value)
            cases.append((f"tag{tag}_operand{value}", [], [row], []))
    results = []
    for name, pre, rows, post in cases:
        packet = encode_packet(pre, rows, post)
        expected = original_seed(original_symbols(pre, rows, post))
        decoded = check_packet(packet, pre, rows, post, expected)
        results.append({"name": name, "pre": pre, "rows": rows, "post": post,
                        "packet": packet, "expected_seed": expected,
                        "consumed_bits": decoded["consumed_bits"], "status": "passed"})
    return results


def measurements(rows, root, argument, pre, post, packet, seed, parsed):
    tags = Counter(row[0] for row in rows)
    operands = Counter(value for row in rows for value in row[1:])
    count = 2 * len(rows)
    active = 2 * sum(tags[tag] for tag in (3, 4, 5)) + tags[6]
    dictionaries = []
    ordered = sorted(operands, key=lambda value: (-operands[value], value))
    for width in (4, 6, 8):
        values = ordered[:1 << width]
        hits = sum(operands[value] for value in values)
        dictionary_bits = 14 * len(values) + 1
        token_bits = hits * (1 + width) + (count - hits) * 14
        saving = 13 * count - dictionary_bits - token_bits
        require(saving == hits * (13 - width) - count - dictionary_bits, "Dictionary accounting")
        dictionaries.append({"index_bits": width, "entries": values, "entry_count": len(values),
                             "hits": hits, "misses": count - hits,
                             "dictionary_bits": dictionary_bits, "operand_token_bits": token_bits,
                             "data_saving_bits": saving, "additional_decoder_states": None,
                             "net_saving_states": None, "lookup_machine_constructed": False})
    return {"measurement_kind": "executed_finite_packet_data", "row_count": len(rows),
            "root": root, "argument_hex": hex(argument), "source_parser": parsed,
            "pre_symbols": len(pre), "post_symbols": len(post), "table_symbols":
                len(natural_symbols([value for row in rows for value in row])),
            "stack_symbols": (len(seed) - 16) // 3, "accepted_seed_bits": len(seed),
            "packet_bits": len(packet), "packet_writer_states_formula": len(packet) + 1,
            "framing_bits": 22, "table_record_bits": 29 * len(rows),
            "literal_bits": 3 * (len(pre) + len(post)), "synthesized_delimiter_symbols": 1,
            "gross_writer_saving_formula": 424157 - (len(packet) + 1),
            "tag_histogram": dict(sorted(tags.items())),
            "operand_histogram": {str(k): v for k, v in sorted(operands.items())},
            "active_operands": active, "padded_operands": count - active,
            "arity_data_saving_bits": 13 * (count - active),
            "arity_packet_bits_formula": len(packet) - 13 * (count - active),
            "arity_decoder_states": None, "dictionary_scores": dictionaries}


def hostile_checks(packet, pre, rows, post, expected, decoded, model_text, tape_text):
    row_start = 13 + 3 * len(post) + 3
    row_stop = row_start + 29 * len(rows)

    def flip(index):
        return packet[:index] + ("1" if packet[index] == "0" else "0") + packet[index + 1:]

    mutations = [
        ("first_marker", flip(1)), ("second_marker", flip(8)),
        ("argument_stop", packet[:row_start - 3] + "100" + packet[row_start:]),
        ("row_stop", packet[:row_stop] + "000" + packet[row_stop + 3:]),
        ("truncated_final_stop", packet[:-1]), ("extra_trailing_zero", packet + "0"),
        ("operand_bit", flip(row_start + 3)), ("tag_bit", flip(row_start)),
        ("nonbinary_bit", packet[:row_start + 4] + "x" + packet[row_start + 5:]),
    ]
    results = []

    def reject(name, callback, mutation_sha=None):
        try:
            callback()
        except CensusError as exc:
            results.append({"name": name, "status": "rejected", "reason": str(exc),
                            "mutated_packet_sha256": mutation_sha})
        else:
            raise CensusError(f"Hostile control accepted: {name}")

    for name, changed in mutations:
        require(changed != packet, f"Vacuous mutation: {name}")
        reject(name, lambda changed=changed: check_packet(changed, pre, rows, post, expected),
               sha(changed.encode("ascii")))
    reject("relative_head_plus_one", lambda: check_static_tape(decoded["seed"], expected, head=1))
    reject("left_exterior_one", lambda: check_static_tape(decoded["seed"], expected, extra_ones=(-1,)))
    reject("right_exterior_one", lambda: check_static_tape(
        decoded["seed"], expected, extra_ones=(len(expected) + 17,)))
    require(rows[0][1] == 0, "Zero-word hostile fixture requires the first row's zero left operand")
    zero_cons = len(pre) + len(natural_symbols([rows[0][0]]))
    require(decoded["symbols"][zero_cons] == 2, "Zero-word cons fixture position")
    missing_cons = decoded["symbols"][:zero_cons] + decoded["symbols"][zero_cons + 1:]
    reject("omitted_zero_word_cons", lambda: check_static_tape(original_seed(missing_cons), expected))
    swapped = list(rows)
    other = next(i for i, row in enumerate(rows) if row != rows[0])
    swapped[0], swapped[other] = swapped[other], swapped[0]
    reject("source_row_order", lambda: check_static_tape(
        original_seed(original_symbols(pre, swapped, post)), expected))
    extended_argument, replacements = re.subn(
        r"(^def literalArgument : List Nat :=\s*\[0x[0-9a-fA-F]+\])", r"\1 ++ [1]",
        tape_text, count=1, flags=re.M)
    require(replacements == 1, "Literal RHS hostile fixture not found")
    reject("literal_rhs_extension", lambda: parse_sources(model_text, extended_argument))
    extended_input = tape_text.replace(
        "def input : List Γ' := RuntimeWire.input table literalArgument",
        "def input : List Γ' := RuntimeWire.input table literalArgument ++ []", 1)
    require(extended_input != tape_text, "Input RHS hostile fixture not found")
    reject("input_rhs_extension", lambda: parse_sources(model_text, extended_input))
    multiline_input = tape_text.replace(
        "def input : List Γ' := RuntimeWire.input table literalArgument",
        "def input : List Γ' := RuntimeWire.input table literalArgument\n  ++ []", 1)
    reject("input_multiline_rhs_extension", lambda: parse_sources(model_text, multiline_input))
    changed_table = tape_text.replace("def table : CodeDAG.DAG := SourceModel.dag",
                                      "def table : CodeDAG.DAG := otherDag", 1)
    require(changed_table != tape_text, "Table binding hostile fixture not found")
    reject("table_source_binding", lambda: parse_sources(model_text, changed_table))
    multiline_table = tape_text.replace("def table : CodeDAG.DAG := SourceModel.dag",
                                        "def table : CodeDAG.DAG := SourceModel.dag\n  |> id", 1)
    reject("table_multiline_rhs_extension", lambda: parse_sources(model_text, multiline_table))
    return results


def run(output, progress):
    progress("source_oracle")
    source_bytes = {name: bounded_read(ROOT / name) for name in SOURCE_PATHS}
    for name, digest in IDENTITY_PINS.items():
        require(sha(source_bytes[name]) == digest, f"Accepted serialization source changed: {name}")
    oracle_bytes = bounded_read(ROOT / ORACLE)
    require(sha(oracle_bytes) == ORACLE_SHA, "Accepted export SHA-256 differs")
    oracle = json.loads(oracle_bytes, object_pairs_hook=no_duplicate_keys)
    require(oracle["schema"] == "chess-seed-complete-v1", "Accepted export schema")
    expected = oracle["seed"]
    require(isinstance(expected, str) and len(expected) == 424156 and set(expected) <= {"0", "1"},
            "Accepted seed shape")
    for key, value in {"seed_bits": 424156, "writer_states": 424157, "controller_states": 216,
                       "bridge_states": 1, "machine_states": 998176}.items():
        require(oracle["metadata"][key] == value, f"Accepted metadata {key}")
    require(oracle["writer"]["tape"] == expected and oracle["writer"]["normalized_head"] == 0
            and oracle["writer"]["both_exteriors_zero"] is True, "Accepted writer tape contract")
    require(oracle["full_quadratic_startup_executed"] is False, "Unexpected accepted evidence scope")
    manifest = {"commit": os.environ.get("GITHUB_SHA"), "run_id": os.environ.get("GITHUB_RUN_ID"),
                "source_sha256": {name: sha(data) for name, data in source_bytes.items()},
                "enforced_identity_pins": IDENTITY_PINS,
                "accepted_export": {"path": ORACLE, "sha256": sha(oracle_bytes)},
                "scope": CLASSIFICATION}
    write_json(output / "packet-source-manifest.json", manifest)
    rows, root, argument, parsed = parse_sources(source_bytes[MODEL].decode("utf-8"),
                                                source_bytes[TAPE].decode("utf-8"))
    pre, post = natural_symbols([root]), natural_symbols([argument])
    symbols = original_symbols(pre, rows, post)
    require(len(pre) == 14 and len(post) == 323 and len(symbols) == 141380, "Source symbol census")
    require(original_seed(symbols) == expected, "Source parser disagrees with accepted seed oracle")
    write_json(output / "source-input.json", {"root": root, "argument_hex": hex(argument),
                                              "rows": rows, "pre": pre, "post": post})
    (output / "source-symbols.u8").write_bytes(bytes(symbols))
    progress("encode_decode")
    packet = encode_packet(pre, rows, post)
    require(len(packet) == 173641, "Source-derived packet length differs")
    (output / "packet.bits").write_bytes(packet.encode("ascii"))
    (output / "packet.bin").write_bytes(packed_bytes(packet))
    # Decode bytes reloaded from the retained artifact, not the encoder's return value.
    reloaded = (output / "packet.bits").read_bytes().decode("ascii")
    decoded = check_packet(reloaded, pre, rows, post, expected)
    require(decoded["symbols"] == symbols, "Every original symbol must agree")
    (output / "decoded-seed.bits").write_bytes(decoded["seed"].encode("ascii"))
    (output / "decoded-symbols.u8").write_bytes(bytes(decoded["symbols"]))
    packed = (output / "packet.bin").read_bytes()
    require(len(packed) == (len(packet) + 7) // 8, "Noncanonical packed byte length")
    unpacked = "".join(format(value, "08b") for value in packed)
    require(unpacked[:len(packet)] == packet and set(unpacked[len(packet):]) <= {"0"},
            "Retained packed-bit round trip")
    progress("positive_fixtures")
    fixtures = fixture_checks()
    write_json(output / "fixtures.json", fixtures)
    # Negative controls run only after full independent positive equality and all fixtures.
    progress("hostile_controls")
    hostiles = hostile_checks(packet, pre, rows, post, expected, decoded,
                              source_bytes[MODEL].decode("utf-8"), source_bytes[TAPE].decode("utf-8"))
    write_json(output / "hostile-controls.json", hostiles)
    progress("counts")
    counts = measurements(rows, root, argument, pre, post, packet, expected, parsed)
    write_json(output / "counts.json", counts)
    inventory = {}
    for name in ("packet-source-manifest.json", "source-input.json", "source-symbols.u8",
                 "packet.bits", "packet.bin", "decoded-seed.bits", "decoded-symbols.u8",
                 "fixtures.json", "hostile-controls.json", "counts.json"):
        data = bounded_read(output / name)
        inventory[name] = {"bytes": len(data), "sha256": sha(data)}
    write_json(output / "artifact-manifest.json", inventory)
    return {"status": "passed", "classification": CLASSIFICATION,
            "source_derived_expected": {"rows": 5952, "packet_bits": 173641,
                                         "accepted_seed_bits": 424156},
            "measured": {"packet_bits": len(packet), "source_symbols": len(symbols),
                         "decoded_seed_bits": len(decoded["seed"]), "positive_fixtures": len(fixtures),
                         "hostile_controls_rejected": len(hostiles)},
            "identity": {"all_source_rows_and_order": True, "all_source_symbols": True,
                         "all_accepted_seed_bits": True, "consumed_entire_packet": True,
                         "static_relative_head": 0, "static_blank_exteriors": True,
                         "accepted_seed_sha256": sha(expected.encode("ascii")),
                         "packet_sha256": sha(packet.encode("ascii")),
                         "source_symbols_sha256": sha(bytes(symbols))},
            "accounting": {"packet_writer_states_formula": len(packet) + 1,
                           "decoder_states": None, "controller_states": None,
                           "new_bridge_states": 1, "retained_expander_states": 216,
                           "retained_bridge_states": 1,
                           "same_body_saving_expression": "250514 - D",
                           "full_with_573802_body_expression": "747662 + D",
                           "full_with_114487_body_expression": "288347 + D",
                           "net_saving_states": None},
            "controller_constructed": False, "tm_execution": False, "lean_certificate": False,
            "new_accepted_machine": False, "artifacts": inventory,
            "limits_of_evidence": "Static finite packet equality only; no physical controller, cleanup or universal proof"}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=Path(".lake/chess-table-seed-20261022"))
    parser.add_argument("--seconds", type=int, default=600)
    parser.add_argument("--memory-gib", type=int, default=4)
    args = parser.parse_args()
    require(10 <= args.seconds <= 600, "Wall bound must be between 10 and 600 seconds")
    require(1 <= args.memory_gib <= 4, "Memory bound must be between 1 and 4 GiB")
    output = args.output if args.output.is_absolute() else ROOT / args.output
    output.mkdir(parents=True, exist_ok=True)
    require(not any((output / name).exists() or (output / (name + ".tmp")).exists()
                    for name in OWNED_ARTIFACTS),
            "Refuse to overwrite prior census evidence; retain it and use a fresh output directory")
    started = time.monotonic()
    phase = "startup"
    reserve = None
    summary = {"status": "running", "classification": CLASSIFICATION}
    hard_timeout_fd = None

    def progress(next_phase):
        nonlocal phase
        phase = next_phase
        write_json(output / "pilot-progress.json", {"phase": phase, "elapsed_seconds": time.monotonic() - started})
        print(f"packet census: {phase}", flush=True)

    def hard_timeout(_signum, _frame):
        # The preopened file and existing progress/summary survive even an exhausted cleanup budget.
        try:
            os.write(hard_timeout_fd if hard_timeout_fd is not None else 2,
                     b"Hard wall deadline reached; no success claim. Retain all partial evidence.\n")
        finally:
            os._exit(124)

    def arm_hard_deadline():
        remaining = args.seconds - (time.monotonic() - started)
        if remaining <= 0:
            hard_timeout(None, None)
        signal.signal(signal.SIGALRM, hard_timeout)
        signal.setitimer(signal.ITIMER_REAL, remaining)

    def timeout(_signum, _frame):
        arm_hard_deadline()
        raise TimeoutError(f"Remote packet census exhausted {args.seconds - 3}s work budget")

    exit_code = 1
    try:
        signal.signal(signal.SIGALRM, timeout)
        work_remaining = args.seconds - 3 - (time.monotonic() - started)
        if work_remaining <= 0:
            timeout(None, None)
        signal.setitimer(signal.ITIMER_REAL, work_remaining)
        resource.setrlimit(resource.RLIMIT_AS, (args.memory_gib * 1024 ** 3,) * 2)
        reserve = bytearray(1024 * 1024)
        hard_timeout_fd = os.open(output / "hard-timeout.txt", os.O_WRONLY | os.O_CREAT | os.O_EXCL, 0o644)
        write_json(output / "pilot-summary.json", summary)
        summary = run(output, progress)
        exit_code = 0
    except (Exception, KeyboardInterrupt) as exc:
        reserve = None
        arm_hard_deadline()
        summary = {"status": "failed", "classification": CLASSIFICATION, "phase": phase,
                   "error_type": type(exc).__name__, "error": str(exc),
                   "controller_states": None, "new_accepted_machine": False}
        (output / "failure.txt").write_text(traceback.format_exc(), encoding="utf-8")
    finally:
        arm_hard_deadline()
        reserve = None
        summary.update({"phase": phase, "elapsed_seconds": time.monotonic() - started,
                        "peak_rss_kib": resource.getrusage(resource.RUSAGE_SELF).ru_maxrss,
                        "limits": {"wall_seconds": args.seconds, "memory_gib": args.memory_gib,
                                   "cleanup_reserve_seconds": 3},
                        "commit": os.environ.get("GITHUB_SHA"), "run_id": os.environ.get("GITHUB_RUN_ID")})
        write_json(output / "pilot-summary.json", summary)
    if exit_code == 0:
        print(BANNER, flush=True)
    else:
        print(f"Packet census failed in {phase}; retained pilot-summary.json and failure.txt", file=sys.stderr)
    signal.setitimer(signal.ITIMER_REAL, 0)
    if hard_timeout_fd is not None:
        os.close(hard_timeout_fd)
    return exit_code


if __name__ == "__main__":
    sys.exit(main())
