#!/usr/bin/env python3
"""Literal small-table oracle and corruption controls for M7 quotient extraction."""
from pathlib import Path
import hashlib
import importlib.util
import io
import json
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
loader = importlib.util.spec_from_file_location("_m7_fixture_quotient", Path(__file__).with_name("quotient_table.py"))
tool = importlib.util.module_from_spec(loader)
sys.modules[loader.name] = tool
loader.loader.exec_module(tool)


def rejected(action):
    try:
        action()
    except (ValueError, tool.tables.TablePartsError, OSError):
        return
    raise AssertionError("Invalid quotient/table was accepted")


def main():
    q = tool.Quotient(4, 7, 2, 1)
    old = (b"0R1 0R1\n1R2 1R2\n0L3 1L3\n0L4 1L4\n"
           b"0L7 1L7\n--- ---\n--- ---\n0R12 1R12\n0R13 1R13\n0L7 1L7\n0L8 1L8\n"
           b"0L4 1L4\n0L5 1L5\n0L6 1L6\n0L7 1L7\n0L8 1L8\n0L9 1L9\n0L10 1L10\n")
    expected = (b"0R1 0R1\n1R2 1R2\n0L3 1L3\n0L4 1L4\n"
                b"0L5 1L5\n0R12 1R12\n0R12 1R12\n--- ---\n0L6 1L6\n"
                b"0L4 1L4\n0L5 1L5\n0L6 1L6\n0L7 1L7\n0L8 1L8\n")
    before, after = old.splitlines(keepends=True), expected.splitlines(keepends=True)
    assert len(before) == q.before == 18 and len(after) == q.after == 14
    assert q.before - q.after == 4
    for i, row in enumerate(before):
        assert q.row(row, i) == after[q.state_map(i)], (i, row)
    for i in range(q.after):
        assert q.state_map(q.section(i)) == i
    WORK = ROOT / ".lake/chess-m7-check"
    WORK.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix="table-fixtures-", dir=WORK) as temporary:
        directory = Path(temporary) / "baseline"
        tool.tables.pack(io.BytesIO(old), directory, states=q.before, rows_per_part=3)
        manifest = tool.tables.load_manifest(directory)
        ranges = 0
        for start in range(q.after + 1):
            for count in range(q.after - start + 1):
                output = io.BytesIO()
                tool.extract_range(q, directory, manifest, start, count, output)
                assert output.getvalue() == b"".join(after[start:start + count])
                ranges += 1
        part = directory / manifest["parts"][0]["file"]
        original = part.read_bytes()
        for changed in (original[:-1], original + b"extra", bytes([original[0] ^ 1]) + original[1:]):
            part.write_bytes(changed)
            rejected(lambda: tool.extract_range(q, directory, manifest, 0, q.after, io.BytesIO()))
        part.write_bytes(original)
        # A valid changed baseline with newly computed digests must still differ from the literal oracle.
        changed_dir = Path(temporary) / "changed"
        changed = old.replace(b"0R1 0R1", b"1R1 1R1", 1)
        tool.tables.pack(io.BytesIO(changed), changed_dir, states=q.before, rows_per_part=3)
        output = io.BytesIO()
        tool.extract_range(q, changed_dir, tool.tables.load_manifest(changed_dir), 0, q.after, output)
        assert output.getvalue() != expected
        wrong = io.BytesIO()
        tool.extract_range(tool.Quotient(4, 7, 2, 0), directory, manifest, 0, q.after, wrong)
        assert wrong.getvalue() != expected
    for arguments in ((True, 7, 2, 1), (-1, 7, 2, 1), (4, 7, 0, 1), (4, 8, 2, 1),
                      (4, 7, 2, -1), (4, 7, 2, 2)):
        rejected(lambda: tool.Quotient(*arguments))
    for start, count in ((-1, 1), (0, -1), (0, 15), (14, 1), (True, 1)):
        rejected(lambda: q.segments(start, count))
    rejected(lambda: q.row(b"0R18 0R18\n", 0))
    rejected(lambda: q.row(b"0R1 0R1", 0))
    spec = {"format": tool.FORMAT, "baseline_directory": "artifacts/chess_baseline/table",
            "baseline_manifest_sha256": hashlib.sha256((ROOT / "artifacts/chess_baseline/table/manifest.json").read_bytes()).hexdigest(),
            "prefix_states": 3110360, "post_states": 194468236, "stores": 5,
            "initial_node": 0, "baseline_states": 392046832, "candidate_states": 392046822}
    with tempfile.TemporaryDirectory(prefix="map-fixtures-", dir=WORK) as temporary:
        path = Path(temporary) / "map.json"
        path.write_text(json.dumps(spec))
        tool.load_spec(path)
        for key, value in (("format", "bad"), ("candidate_states", 392046823),
                           ("initial_node", -1), ("baseline_manifest_sha256", "0" * 64),
                           ("baseline_directory", "../outside")):
            path.write_text(json.dumps({**spec, key: value}))
            rejected(lambda: tool.load_spec(path))
    print(f"M7 quotient table fixtures passed: literal oracle, all {ranges} intervals, corruption/map/count controls")


if __name__ == "__main__":
    main()
