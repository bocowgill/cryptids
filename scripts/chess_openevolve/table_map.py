"""Lossless fixed row recipe over the accepted M7 table. Full streaming is remote-only."""
import hashlib
import json
import os
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
PREFIX, POST, TERMINAL = 3110360, 194468231, 1
REMOVED = PREFIX + POST + TERMINAL
BEFORE, AFTER = 392046822, 392046821


def validate(spec):
    assert set(spec) == {"format", "source_map", "source_map_sha256", "source_states",
                         "candidate_states", "prefix_states", "post_states", "terminal",
                         "removed_state", "construction", "certificate"}
    expected = {"format": "chess-openevolve-terminal-return-v1",
                "source_map": "artifacts/chess_m7/table-map.json",
                "source_states": BEFORE, "candidate_states": AFTER,
                "prefix_states": PREFIX, "post_states": POST, "terminal": TERMINAL,
                "removed_state": REMOVED, "certificate": "Chess.Optimisation.OpenEvolve.rowMachine_eq",
                "construction": "delete source row; redirect incoming destinations to main terminal; decrement greater indices"}
    assert all(spec[k] == v and type(spec[k]) is type(v) for k, v in expected.items())
    assert spec["source_map_sha256"] == hashlib.sha256((ROOT / spec["source_map"]).read_bytes()).hexdigest()
    assert REMOVED == 197578592 and AFTER == BEFORE - 1


def old_state(new):
    assert type(new) is int and 0 <= new < AFTER
    return new + int(new >= REMOVED)


def destination(old):
    assert type(old) is int and 0 <= old < BEFORE
    return PREFIX + TERMINAL if old == REMOVED else old - int(old > REMOVED)


def row(data):
    assert data.endswith(b"\n") and data.count(b" ") == 1
    result = []
    for cell in data[:-1].split(b" "):
        if cell == b"---":
            result.append(cell)
        else:
            assert re.fullmatch(rb"[01][LR](0|[1-9][0-9]*)", cell)
            result.append(cell[:2] + str(destination(int(cell[2:]))).encode("ascii"))
    return b" ".join(result) + b"\n"


def stream(source, target):
    assert os.environ.get("CHESS_REMOTE") == "1", "Full table streaming is remote-only"
    spec = json.loads((ROOT / "artifacts/chess_openevolve/table-map.json").read_text())
    validate(spec)
    count = 0
    for state, data in enumerate(source):
        assert state < BEFORE, "Extra M7 row"
        converted = row(data)
        if state == REMOVED:
            assert data == f"0L{PREFIX + TERMINAL} 1L{PREFIX + TERMINAL}\n".encode()
        else:
            target.write(converted)
            count += 1
    assert count == AFTER, "Incomplete source table"


if __name__ == "__main__":
    stream(sys.stdin.buffer, sys.stdout.buffer)
