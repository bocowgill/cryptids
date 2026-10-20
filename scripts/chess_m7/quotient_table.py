#!/usr/bin/env python3
"""Lossless extraction of the M7 numeric table from the retained literal M6 table.

This is file-format tooling, not a logical premise. Complete independent native
comparison is required before the extracted table is accepted as the Lean machine.
"""
from __future__ import annotations

import argparse
from contextlib import closing
from dataclasses import dataclass
import hashlib
import importlib.util
import json
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[2]
loader = importlib.util.spec_from_file_location(
    "_m7_table_parts", ROOT / "scripts/chess_m6_table_parts.py")
tables = importlib.util.module_from_spec(loader)
loader.loader.exec_module(tables)
FORMAT = "chess-m7-literal-table-quotient-v1"


def require(condition, message):
    if not condition:
        raise ValueError(message)


@dataclass(frozen=True)
class Quotient:
    prefix: int
    post: int
    stores: int
    initial_node: int

    def __post_init__(self):
        require(all(type(x) is int for x in
                    (self.prefix, self.post, self.stores, self.initial_node)),
                "Control counts must be integers")
        require(self.prefix >= 0 and self.stores > 0 and self.post > self.stores,
                "Invalid control counts")
        require((self.post - 1) % self.stores == 0, "Invalid descriptor count")
        require(0 <= self.initial_node < (self.post - 1) // self.stores - 1,
                "Initial node outside live graph")

    @property
    def compact(self):
        return self.post - self.stores

    @property
    def root(self):
        return 1 + self.initial_node * self.stores

    @property
    def before(self):
        return self.prefix + 2 * self.post

    @property
    def after(self):
        return self.prefix + 2 * self.compact

    def post_map(self, old):
        require(0 <= old < self.post, "Old Post control out of range")
        if old == 0:
            return 0
        if old <= self.stores:
            return self.root
        raw = old - self.stores
        return 0 if raw == self.root else raw

    def state_map(self, old):
        require(type(old) is int and 0 <= old < self.before, "Old state out of range")
        if old < self.prefix:
            return old
        block, pc = divmod(old - self.prefix, self.post)
        return self.prefix + block * self.compact + self.post_map(pc)

    def section(self, new):
        require(type(new) is int and 0 <= new < self.after, "New state out of range")
        if new < self.prefix:
            return new
        block, pc = divmod(new - self.prefix, self.compact)
        raw = self.root if pc == 0 else 0 if pc == self.root else pc
        old = 1 if raw == 0 else raw + self.stores
        return self.prefix + block * self.post + old

    def segments(self, start, count):
        require(type(start) is int and type(count) is int and
                0 <= start and 0 <= count and start + count <= self.after,
                "Invalid candidate interval")
        breaks = {start, start + count}
        for base in (self.prefix, self.prefix + self.compact):
            breaks.update(x for x in (base, base + 1, base + self.root,
                                      base + self.root + 1)
                          if start < x < start + count)
        points = sorted(breaks)
        return [(a, b - a, self.section(a)) for a, b in zip(points, points[1:])]

    def row(self, row, old):
        tables.validate_row(row, self.before, old)
        converted = []
        for cell in row.rstrip(b"\n").split(b" "):
            converted.append(cell if cell == b"---" else
                             cell[:2] + str(self.state_map(int(cell[2:]))).encode("ascii"))
        return b" ".join(converted) + b"\n"


def load_spec(path):
    spec = json.loads(Path(path).read_text(), object_pairs_hook=tables._no_duplicate_keys)
    tables._keys(spec, {"format", "baseline_directory", "baseline_manifest_sha256",
                       "prefix_states", "post_states", "stores", "initial_node",
                       "baseline_states", "candidate_states"}, "M7 table quotient")
    require(spec["format"] == FORMAT, "Unknown quotient format")
    q = Quotient(spec["prefix_states"], spec["post_states"], spec["stores"],
                 spec["initial_node"])
    require(q.before == spec["baseline_states"] and q.after == spec["candidate_states"],
            "Quotient state-count mismatch")
    directory = ROOT / spec["baseline_directory"]
    require(directory.resolve() == (ROOT / "artifacts/chess_baseline/table").resolve(),
            "Unexpected baseline table directory")
    require(hashlib.sha256((directory / "manifest.json").read_bytes()).hexdigest() ==
            spec["baseline_manifest_sha256"], "Changed retained baseline manifest")
    manifest = tables.load_manifest(directory)
    require(manifest["states"] == q.before, "Baseline table state-count mismatch")
    return q, directory, manifest


def baseline_range(directory, manifest, start, count):
    """Validate complete selected parts, including rows outside the selected interval."""
    end = start + count
    emitted = 0
    for part in manifest["parts"]:
        if part["start_state"] >= end or part["start_state"] + part["rows"] <= start:
            continue
        path = directory / part["file"]
        require(path.stat().st_size == part["gzip_bytes"], "Changed compressed size")
        metrics, digest, size, rows = {}, hashlib.sha256(), 0, 0
        with closing(tables._gzip_blocks(path, manifest["compression"]["level"], metrics)) as blocks:
            for row in tables._rows_from_blocks(blocks, tables._row_limit(manifest["states"])):
                require(rows < part["rows"], "Extra baseline row")
                state = part["start_state"] + rows
                tables.validate_row(row, manifest["states"], state)
                digest.update(row)
                size += len(row)
                require(size <= part["raw_bytes"], "Extra baseline bytes")
                if start <= state < end:
                    emitted += 1
                    yield state, row
                rows += 1
        require(rows == part["rows"] and size == part["raw_bytes"] and
                digest.hexdigest() == part["raw_sha256"], "Baseline raw integrity mismatch")
        require(metrics["gzip_bytes"] == part["gzip_bytes"] and
                metrics["gzip_sha256"] == part["gzip_sha256"],
                "Baseline compressed integrity mismatch")
    require(emitted == count, "Baseline interval is incomplete")


def extract_range(q, directory, manifest, start, count, output):
    emitted = 0
    buffered = []
    for candidate_start, length, old_start in q.segments(start, count):
        for old, row in baseline_range(directory, manifest, old_start, length):
            candidate = candidate_start + old - old_start
            require(q.section(candidate) == old and q.state_map(old) == candidate,
                    "Invalid quotient section")
            converted = q.row(row, old)
            tables.validate_row(converted, q.after, candidate)
            buffered.append(converted)
            emitted += 1
            if len(buffered) == 4096:
                tables._write_all(output, b"".join(buffered))
                buffered = []
    if buffered:
        tables._write_all(output, b"".join(buffered))
    require(emitted == count, "Candidate interval is incomplete")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--spec", type=Path, required=True)
    parser.add_argument("start", type=int)
    parser.add_argument("count", type=int)
    args = parser.parse_args()
    q, directory, manifest = load_spec(args.spec)
    extract_range(q, directory, manifest, args.start, args.count, sys.stdout.buffer)


if __name__ == "__main__":
    main()
