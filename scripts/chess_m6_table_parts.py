#!/usr/bin/env python3
"""Lossless, bounded-memory transport of complete canonical binary TM tables.

This module checks artifact bytes and canonical row syntax, not Lean semantics.
Every input/output stream is binary. State ranges are zero-based, end-exclusive.
"""
from __future__ import annotations

import argparse
from contextlib import ExitStack, closing
import gzip
import hashlib
import json
from pathlib import Path
import re
import shutil
import sys
import tempfile
from typing import BinaryIO, Iterable, Iterator
import zlib

FORMAT = "chess-m6-canonical-binary-table-parts-v1"
MANIFEST = "manifest.json"
CHUNK = 64 * 1024
MAX_MANIFEST_BYTES = 64 * 1024 * 1024
MAX_PARTS = 100_000
ROW = re.compile(rb"(---|[01][LR](?:0|[1-9][0-9]*)) (---|[01][LR](?:0|[1-9][0-9]*))\n")
SHA256 = re.compile(r"[0-9a-f]{64}")


class TablePartsError(ValueError):
    """A table, manifest, part, or independent byte comparison failed validation."""


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise TablePartsError(message)


def _integer(value: object, name: str, minimum: int = 0) -> int:
    _require(type(value) is int and value >= minimum, f"Invalid {name}")
    return value


def _settings(states: int, rows_per_part: int, compression_level: int) -> None:
    _integer(states, "state count", 1)
    _integer(rows_per_part, "rows per part", 1)
    _integer(compression_level, "compression level")
    _require(compression_level <= 9, "Compression level must be in 0..9")
    _require((states + rows_per_part - 1) // rows_per_part <= MAX_PARTS,
             f"Manifest exceeds the {MAX_PARTS}-part bound")


def _row_limit(states: int) -> int:
    return 2 * max(3, 2 + len(str(states - 1))) + 2


def validate_row(row: bytes, states: int, index: int) -> None:
    """Reject every noncanonical cell, delimiter, decimal, destination or newline."""
    _require(isinstance(row, bytes), "Table streams must return bytes")
    _require(len(row) <= _row_limit(states), f"Row {index}: overlong row")
    match = ROW.fullmatch(row)
    _require(match is not None, f"Row {index}: malformed or noncanonical row")
    for cell in match.groups():
        if cell != b"---":
            _require(int(cell[2:]) < states, f"Row {index}: destination outside state range")


def _read_row(stream: BinaryIO, states: int, index: int, label: str) -> bytes:
    row = stream.readline(_row_limit(states) + 1)
    _require(bool(row), f"{label}: truncated at row {index}")
    try:
        validate_row(row, states, index)
    except TablePartsError as error:
        raise TablePartsError(f"{label}: {error}") from error
    return row


def _digest_file(path: Path) -> tuple[int, str]:
    digest = hashlib.sha256()
    size = 0
    with path.open("rb") as stream:
        while data := stream.read(CHUNK):
            digest.update(data)
            size += len(data)
    return size, digest.hexdigest()


def _manifest_bytes(manifest: dict) -> bytes:
    text = json.dumps(manifest, sort_keys=True, indent=2, ensure_ascii=True) + "\n"
    data = text.encode("ascii")
    _require(len(data) <= MAX_MANIFEST_BYTES, "Manifest exceeds the 64-MiB bound")
    return data


def _part_name(index: int) -> str:
    return f"part-{index:08d}.txt.gz"


def pack(source: BinaryIO, destination: Path | str, *, states: int,
         rows_per_part: int = 1_000_000, compression_level: int = 6) -> dict:
    """Consume exactly `states` canonical rows into a NEW directory.

    No existing directory/file is replaced. Failure may leave incomplete parts;
    a manifest is written only after the complete input has been validated.
    Memory is bounded by fixed stream buffers plus at most MAX_PARTS records.
    """
    _settings(states, rows_per_part, compression_level)
    destination = Path(destination)
    try:
        destination.mkdir()
    except FileExistsError as error:
        raise TablePartsError(f"Destination already exists: {destination}") from error
    parts = []
    whole = hashlib.sha256()
    raw_total = gzip_total = 0
    for index, start in enumerate(range(0, states, rows_per_part)):
        stop = min(states, start + rows_per_part)
        path = destination / _part_name(index)
        digest = hashlib.sha256()
        raw_size = 0
        with path.open("xb") as output:
            with gzip.GzipFile(filename="", mode="wb", fileobj=output,
                               compresslevel=compression_level, mtime=0) as compressed:
                for state in range(start, stop):
                    row = _read_row(source, states, state, "Input")
                    compressed.write(row)
                    digest.update(row)
                    whole.update(row)
                    raw_size += len(row)
        gzip_size, gzip_sha = _digest_file(path)
        parts.append({"index": index, "file": path.name,
                      "start_state": start, "end_state_exclusive": stop,
                      "rows": stop - start, "raw_bytes": raw_size,
                      "raw_sha256": digest.hexdigest(),
                      "gzip_bytes": gzip_size, "gzip_sha256": gzip_sha})
        raw_total += raw_size
        gzip_total += gzip_size
    _require(source.read(1) == b"", "Input: extra data after the declared state count")
    manifest = {"format": FORMAT, "states": states, "rows_per_part": rows_per_part,
                "compression": {"format": "gzip", "level": compression_level,
                                "mtime": 0, "filename": ""},
                "raw_bytes": raw_total, "gzip_bytes": gzip_total,
                "raw_sha256": whole.hexdigest(), "parts": parts}
    data = _manifest_bytes(manifest)
    with (destination / MANIFEST).open("xb") as output:
        output.write(data)
    return manifest


def _no_duplicate_keys(pairs: list[tuple[str, object]]) -> dict:
    result = {}
    for key, value in pairs:
        _require(key not in result, f"Duplicate manifest key: {key}")
        result[key] = value
    return result


def _invalid_constant(value: str) -> None:
    raise TablePartsError(f"Invalid JSON constant: {value}")


def _keys(value: object, expected: set[str], label: str) -> None:
    _require(type(value) is dict and set(value) == expected, f"Invalid {label} fields")


def _sha(value: object, label: str) -> None:
    _require(isinstance(value, str) and SHA256.fullmatch(value) is not None,
             f"Invalid {label} SHA256")


def load_manifest(directory: Path | str) -> dict:
    """Load bounded metadata, validating exact names, order, ranges and totals."""
    directory = Path(directory)
    path = directory / MANIFEST
    _require(path.is_file() and not path.is_symlink(), "Missing or nonregular manifest")
    with path.open("rb") as source:
        data = source.read(MAX_MANIFEST_BYTES + 1)
    _require(len(data) <= MAX_MANIFEST_BYTES, "Manifest exceeds the 64-MiB bound")
    try:
        manifest = json.loads(data, object_pairs_hook=_no_duplicate_keys,
                              parse_constant=_invalid_constant)
    except (ValueError, UnicodeError, RecursionError) as error:
        raise TablePartsError(f"Invalid manifest JSON: {error}") from error
    _keys(manifest, {"format", "states", "rows_per_part", "compression", "raw_bytes",
                     "gzip_bytes", "raw_sha256", "parts"}, "manifest")
    _require(manifest["format"] == FORMAT, "Unknown table parts format")
    compression = manifest["compression"]
    _keys(compression, {"format", "level", "mtime", "filename"}, "compression")
    _require(compression["format"] == "gzip" and type(compression["mtime"]) is int
             and compression["mtime"] == 0 and compression["filename"] == "",
             "Noncanonical gzip settings")
    states, per_part = manifest["states"], manifest["rows_per_part"]
    _settings(states, per_part, compression["level"])
    _integer(manifest["raw_bytes"], "total raw size", 1)
    _integer(manifest["gzip_bytes"], "total gzip size", 1)
    _sha(manifest["raw_sha256"], "whole raw")
    parts = manifest["parts"]
    _require(type(parts) is list and len(parts) == (states + per_part - 1) // per_part,
             "Wrong number of parts")
    names = {MANIFEST}
    raw_total = gzip_total = 0
    for index, part in enumerate(parts):
        _keys(part, {"index", "file", "start_state", "end_state_exclusive", "rows",
                     "raw_bytes", "raw_sha256", "gzip_bytes", "gzip_sha256"}, "part")
        start, stop = index * per_part, min(states, (index + 1) * per_part)
        for key, expected in [("index", index), ("start_state", start),
                              ("end_state_exclusive", stop), ("rows", stop - start)]:
            _integer(part[key], f"part {index} {key}")
            _require(part[key] == expected, f"Part {index}: wrong {key} or order")
        _require(part["file"] == _part_name(index), f"Part {index}: wrong filename or order")
        names.add(part["file"])
        _integer(part["raw_bytes"], f"part {index} raw size", 1)
        _integer(part["gzip_bytes"], f"part {index} gzip size", 18)
        _sha(part["raw_sha256"], f"part {index} raw")
        _sha(part["gzip_sha256"], f"part {index} gzip")
        raw_total += part["raw_bytes"]
        gzip_total += part["gzip_bytes"]
    _require(raw_total == manifest["raw_bytes"] and gzip_total == manifest["gzip_bytes"],
             "Inconsistent whole/part byte counts")
    _require(data == _manifest_bytes(manifest), "Noncanonical manifest encoding")
    actual_names = set()
    for entry in directory.iterdir():
        _require(entry.name in names, f"Unexpected artifact entry: {entry.name}")
        _require(entry.is_file() and not entry.is_symlink(),
                 f"Nonregular artifact entry: {entry.name}")
        actual_names.add(entry.name)
    _require(actual_names == names, "Missing, duplicate, or unexpected part files")
    return manifest


def _gzip_header(level: int) -> bytes:
    extra_flags = 2 if level == 9 else 4 if level == 1 else 0
    return b"\x1f\x8b\x08\x00\x00\x00\x00\x00" + bytes([extra_flags, 255])


def _gzip_blocks(path: Path, level: int, metrics: dict) -> Iterator[bytes]:
    """Decompress ONE member with fixed-size output; reject padding and extra members."""
    decoder = zlib.decompressobj(31)
    digest = hashlib.sha256()
    size = 0
    ended = False
    try:
        with path.open("rb") as source:
            first = True
            while incoming := source.read(CHUNK):
                if first:
                    _require(incoming[:10] == _gzip_header(level),
                             f"{path.name}: noncanonical gzip header")
                    first = False
                _require(not ended, f"{path.name}: extra compressed data or member")
                digest.update(incoming)
                size += len(incoming)
                pending = incoming
                while True:
                    block = decoder.decompress(pending, CHUNK)
                    pending = decoder.unconsumed_tail
                    if block:
                        yield block
                    if decoder.eof:
                        _require(not decoder.unused_data and not pending,
                                 f"{path.name}: extra compressed data or member")
                        ended = True
                        break
                    if not pending and len(block) < CHUNK:
                        break
        _require(ended, f"{path.name}: truncated gzip stream")
    except zlib.error as error:
        raise TablePartsError(f"{path.name}: invalid gzip stream: {error}") from error
    metrics.update(gzip_bytes=size, gzip_sha256=digest.hexdigest())


def _rows_from_blocks(blocks: Iterable[bytes], limit: int) -> Iterator[bytes]:
    pending = b""
    for block in blocks:
        segments = (pending + block).split(b"\n")
        pending = segments.pop()
        for segment in segments:
            _require(len(segment) + 1 <= limit, "Overlong decompressed row")
            yield segment + b"\n"
        _require(len(pending) < limit, "Overlong decompressed row")
    _require(not pending, "Table lacks final newline")


def _write_all(output: BinaryIO, data: bytes) -> None:
    pending = memoryview(data)
    while pending:
        written = output.write(pending)
        _require(type(written) is int and 0 < written <= len(pending),
                 "Output stream did not accept the requested bytes")
        pending = pending[written:]


def verify(directory: Path | str, *, reference: BinaryIO | None = None,
           output: BinaryIO | None = None) -> dict:
    """Read every compressed and raw byte, validate every row and optionally compare.

    With `reference`, each decompressed row is compared directly to the provided
    independently exported stream. Hash agreement alone never sets compared=True.
    With `output`, validated rows are also written to the caller's binary stream;
    output can be partial if a later integrity check fails.
    """
    directory = Path(directory)
    manifest = load_manifest(directory)
    states, level = manifest["states"], manifest["compression"]["level"]
    whole = hashlib.sha256()
    raw_total = rows_total = 0
    for part in manifest["parts"]:
        path = directory / part["file"]
        _require(path.stat().st_size == part["gzip_bytes"],
                 f"{path.name}: compressed size mismatch")
        digest = hashlib.sha256()
        raw_size = rows = 0
        metrics = {}
        with closing(_gzip_blocks(path, level, metrics)) as blocks:
            for row in _rows_from_blocks(blocks, _row_limit(states)):
                _require(rows < part["rows"], f"{path.name}: extra row data")
                state = part["start_state"] + rows
                validate_row(row, states, state)
                if reference is not None:
                    expected = _read_row(reference, states, state, "Independent reference")
                    _require(row == expected, f"Independent reference differs at row {state}")
                digest.update(row)
                whole.update(row)
                raw_size += len(row)
                _require(raw_size <= part["raw_bytes"], f"{path.name}: extra raw bytes")
                if output is not None:
                    _write_all(output, row)
                rows += 1
        _require(rows == part["rows"], f"{path.name}: truncated row count")
        _require(raw_size == part["raw_bytes"] and digest.hexdigest() == part["raw_sha256"],
                 f"{path.name}: raw size/hash mismatch")
        _require(metrics["gzip_bytes"] == part["gzip_bytes"]
                 and metrics["gzip_sha256"] == part["gzip_sha256"],
                 f"{path.name}: compressed size/hash mismatch")
        raw_total += raw_size
        rows_total += rows
    _require(rows_total == states and raw_total == manifest["raw_bytes"],
             "Whole row/byte count mismatch")
    _require(whole.hexdigest() == manifest["raw_sha256"], "Whole raw hash mismatch")
    if reference is not None:
        _require(reference.read(1) == b"", "Independent reference has extra data")
    return {"states": rows_total, "parts": len(manifest["parts"]), "raw_bytes": raw_total,
            "gzip_bytes": manifest["gzip_bytes"], "raw_sha256": whole.hexdigest(),
            "compared": reference is not None,
            "compared_rows": rows_total if reference is not None else 0,
            "comparison": ("full-row-byte-stream" if reference is not None
                           else "artifact-integrity-only")}


def _compare_files(left: Path, right: Path) -> None:
    with left.open("rb") as a, right.open("rb") as b:
        while True:
            block = a.read(CHUNK)
            other = b.read(CHUNK)
            _require(block == other, f"Reproduction differs: {left.name}")
            if not block:
                return


def reproduce(directory: Path | str, reference_path: Path | str, *,
              scratch_parent: Path | str | None = None, keep_scratch: bool = False) -> dict:
    """Full independent raw comparison, then fresh deterministic byte reproduction."""
    directory, reference_path = Path(directory), Path(reference_path)
    with reference_path.open("rb") as reference:
        result = verify(directory, reference=reference)
    manifest = load_manifest(directory)
    scratch = Path(tempfile.mkdtemp(prefix="chess-m6-table-reproduce-", dir=scratch_parent))
    try:
        fresh = scratch / "parts"
        with reference_path.open("rb") as source:
            pack(source, fresh, states=manifest["states"], rows_per_part=manifest["rows_per_part"],
                 compression_level=manifest["compression"]["level"])
        for name in [MANIFEST] + [part["file"] for part in manifest["parts"]]:
            _compare_files(directory / name, fresh / name)
        result.update(reproduction="all-manifest-and-gzip-bytes-identical",
                      scratch=str(scratch) if keep_scratch else None)
        return result
    finally:
        if not keep_scratch:
            shutil.rmtree(scratch)


def _binary_input(stack: ExitStack, path: str) -> BinaryIO:
    return sys.stdin.buffer if path == "-" else stack.enter_context(Path(path).open("rb"))


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest="command", required=True)
    create = sub.add_parser("pack", help="Pack a complete canonical table into a new directory")
    create.add_argument("source", help="Canonical raw path, or - for binary stdin")
    create.add_argument("destination", help="New output directory; must not exist")
    create.add_argument("--states", required=True, type=int)
    create.add_argument("--rows-per-part", type=int, default=1_000_000)
    create.add_argument("--compression-level", type=int, default=6)
    inspect = sub.add_parser("verify",
                             help="Validate every part/row and optionally compare raw bytes")
    inspect.add_argument("directory")
    inspect.add_argument("--reference", help="Independent canonical export path, or - for stdin")
    extract = sub.add_parser("unpack", help="Verify while writing all canonical rows")
    extract.add_argument("directory")
    extract.add_argument("output", help="New raw output path, or - for binary stdout")
    repeat = sub.add_parser("reproduce", help="Compare raw bytes and reproduce into fresh scratch")
    repeat.add_argument("directory")
    repeat.add_argument("--reference", required=True, help="Independent export path (not stdin)")
    repeat.add_argument("--scratch-parent")
    repeat.add_argument("--keep-scratch", action="store_true")
    args = parser.parse_args(argv)
    try:
        with ExitStack() as stack:
            if args.command == "pack":
                manifest = pack(_binary_input(stack, args.source), args.destination,
                                states=args.states, rows_per_part=args.rows_per_part,
                                compression_level=args.compression_level)
                result = {"states": manifest["states"], "parts": len(manifest["parts"]),
                          "raw_sha256": manifest["raw_sha256"], "destination": args.destination}
            elif args.command == "verify":
                reference = (_binary_input(stack, args.reference)
                             if args.reference is not None else None)
                result = verify(args.directory, reference=reference)
            elif args.command == "unpack":
                output = (sys.stdout.buffer if args.output == "-"
                          else stack.enter_context(Path(args.output).open("xb")))
                result = verify(args.directory, output=output)
            else:
                _require(args.reference != "-", "Reproduction requires a reopenable reference path")
                result = reproduce(args.directory, args.reference,
                                   scratch_parent=args.scratch_parent,
                                   keep_scratch=args.keep_scratch)
        target = sys.stderr if args.command == "unpack" and args.output == "-" else sys.stdout
        print(json.dumps(result, sort_keys=True), file=target)
        return 0
    except (OSError, TablePartsError) as error:
        print(f"table parts error: {error}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
