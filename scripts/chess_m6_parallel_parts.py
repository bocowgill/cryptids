#!/usr/bin/env python3
"""Bounded range producers for complete canonical tables; artifact identity only."""
from __future__ import annotations

import argparse
from concurrent.futures import FIRST_COMPLETED, ThreadPoolExecutor, wait
from contextlib import closing
import ctypes
import hashlib
import importlib.util
import json
import math
import os
from pathlib import Path
import shutil
import signal
import string
import subprocess
import sys
import threading
import time
import uuid

sys.dont_write_bytecode = True
_PARTS_PATH = Path(__file__).with_name("chess_m6_table_parts.py")
_loader = importlib.util.spec_from_file_location("_chess_m6_table_parts", _PARTS_PATH)
tables = importlib.util.module_from_spec(_loader)
_loader.loader.exec_module(tables)
Error = tables.TablePartsError
SPEC_FORMAT = "chess-m6-range-producer-v1"
RUN_FORMAT = "chess-m6-parallel-table-run-v1"
MAX_RANGE = 2_000_000
MAX_WORKERS = 4
MAX_RSS = 8 * 1024**3
MAX_STDERR = 1024 * 1024


def _check(test, message):
    if not test:
        raise Error(message)


def _canonical(value):
    return (json.dumps(value, sort_keys=True, indent=2) + "\n").encode("utf-8")


def _hash(path):
    return tables._digest_file(Path(path))[1]


def _exclusive_json(path, value):
    with Path(path).open("xb") as output:
        output.write(_canonical(value))


def make_spec(argv, paths=(), *, cwd=None, env=None):
    """Capture an accepted executable plus explicitly declared semantic input files."""
    _check(isinstance(argv, (list, tuple)) and argv, "Producer argv must be nonempty")
    cwd = Path(cwd or Path.cwd()).resolve()
    candidate = Path(argv[0])
    has_separator = os.sep in argv[0] or (os.altsep and os.altsep in argv[0])
    executable = (cwd / candidate).resolve() if candidate.is_absolute() or has_separator else shutil.which(argv[0])
    _check(executable is not None, "Producer executable cannot be resolved")
    executable = Path(executable).resolve()
    pins = {}
    for path in [executable, *paths]:
        path = Path(path)
        path = (cwd / path).resolve() if not path.is_absolute() else path.resolve()
        pins[str(path)] = _hash(path)
    spec = {"format": SPEC_FORMAT, "argv": [str(executable), *argv[1:]],
            "cwd": str(cwd), "env": {"PATH": os.defpath, "LANG": "C", "LC_ALL": "C", **(env or {})},
            "pins": pins}
    _validate_spec(spec)
    return spec


def _validate_spec(spec):
    tables._keys(spec, {"format", "argv", "cwd", "env", "pins"}, "producer specification")
    _check(spec["format"] == SPEC_FORMAT, "Unknown producer specification")
    argv = spec["argv"]
    _check(type(argv) is list and argv and all(type(a) is str and "\x00" not in a for a in argv),
           "Invalid producer argv")
    executable = Path(argv[0])
    _check(executable.is_absolute() and str(executable.resolve()) == str(executable),
           "Executable must have a fixed absolute resolved path")
    _check(type(spec["cwd"]) is str and Path(spec["cwd"]).is_absolute()
           and Path(spec["cwd"]).is_dir(), "Invalid producer working directory")
    _check(type(spec["env"]) is dict and all(type(k) is str and type(v) is str
           and "=" not in k and "\x00" not in k + v for k, v in spec["env"].items()),
           "Invalid explicit producer environment")
    pins = spec["pins"]
    _check(type(pins) is dict and argv[0] in pins and len(pins) <= 1024,
           "Producer executable must be pinned")
    for path, digest in pins.items():
        _check(type(path) is str and Path(path).is_absolute()
               and str(Path(path).resolve()) == path, "Pin paths must be absolute and resolved")
        tables._sha(digest, "pinned input")
    fields = set()
    for argument in argv[1:]:
        try:
            for _, field, format_spec, conversion in string.Formatter().parse(argument):
                if field is not None:
                    _check(field in {"start", "count", "states"} and not format_spec and conversion is None,
                           "Only plain {start}, {count}, {states} placeholders are allowed")
                    fields.add(field)
        except ValueError as error:
            raise Error(f"Invalid argv template: {error}") from error
    _check({"start", "count"} <= fields, "Producer argv must include {start} and {count}")
    _check_pins(spec)


def _check_pins(spec):
    for name, expected in spec["pins"].items():
        path = Path(name)
        _check(path.is_file() and _hash(path) == expected, f"Stale producer identity: {name}")


def load_spec(path):
    with Path(path).open("rb") as source:
        data = source.read(1024 * 1024 + 1)
    _check(len(data) <= 1024 * 1024, "Producer specification exceeds 1 MiB")
    try:
        spec = json.loads(data, object_pairs_hook=tables._no_duplicate_keys)
    except (ValueError, RecursionError) as error:
        raise Error(f"Invalid producer specification: {error}") from error
    _validate_spec(spec)
    return spec


def _argv(spec, start, count, states):
    return [spec["argv"][0], *[a.format(start=start, count=count, states=states)
                              for a in spec["argv"][1:]]]


class _Usage(ctypes.Structure):
    _fields_ = [("uuid", ctypes.c_uint8 * 16)] + [(name, ctypes.c_uint64) for name in [
        "user", "system", "idle", "interrupt", "pageins", "wired", "resident", "physical",
        "started", "exited", "childuser", "childsystem", "childidle", "childinterrupt",
        "childpageins", "childelapsed", "read", "written"]]


def _rss(pid):
    if sys.platform == "darwin":
        library = ctypes.CDLL("/usr/lib/libproc.dylib", use_errno=True)
        library.proc_pid_rusage.argtypes = [ctypes.c_int, ctypes.c_int, ctypes.c_void_p]
        library.proc_pid_rusage.restype = ctypes.c_int
        value = _Usage()
        result = library.proc_pid_rusage(pid, 2, ctypes.byref(value))
        _check(result == 0 or ctypes.get_errno() == 3, "RSS monitor failed for known process")
        return value.resident if result == 0 else 0
    if sys.platform.startswith("linux"):
        try:
            fields = Path(f"/proc/{pid}/statm").read_text().split()
            return int(fields[1]) * os.sysconf("SC_PAGE_SIZE") if len(fields) >= 2 else 0
        except (FileNotFoundError, ProcessLookupError):
            # The child may exit after /proc was opened but before statm was read.
            # Its exit status and complete output are checked by the range worker.
            return 0
    raise Error("Resource-monitored orchestration requires macOS or Linux")


def _kill(process):
    if process.poll() is not None:
        return
    try:
        if os.name == "posix":
            try:
                os.killpg(process.pid, signal.SIGKILL)
            except PermissionError:
                process.kill()
        else:
            process.kill()
    except ProcessLookupError:
        pass


def _part_record(path, index, start, count, raw_size, digest):
    size, compressed = tables._digest_file(path)
    return {"index": index, "file": tables._part_name(index), "start_state": start,
            "end_state_exclusive": start + count, "rows": count,
            "raw_bytes": raw_size, "raw_sha256": digest,
            "gzip_bytes": size, "gzip_sha256": compressed}


def _pack_range(raw, output, states, index, start, count, level):
    import gzip
    digest = hashlib.sha256()
    size = 0
    with Path(raw).open("rb") as source, Path(output).open("xb") as target:
        with gzip.GzipFile(filename="", fileobj=target, mode="wb", compresslevel=level, mtime=0) as zipped:
            buffered = bytearray()
            for state in range(start, start + count):
                row = tables._read_row(source, states, state, "Range producer")
                buffered.extend(row)
                if len(buffered) >= tables.CHUNK:
                    zipped.write(buffered)
                    digest.update(buffered)
                    size += len(buffered)
                    buffered.clear()
            if buffered:
                zipped.write(buffered)
                digest.update(buffered)
                size += len(buffered)
        _check(source.read(1) == b"", "Range producer emitted extra data")
    return _part_record(output, index, start, count, size, digest.hexdigest())


def _part_rows(directory, part, states, level):
    path = Path(directory) / part["file"]
    _check(path.is_file() and not path.is_symlink(), f"Missing/nonregular part: {path.name}")
    _check(path.stat().st_size == part["gzip_bytes"], f"Compressed size changed: {path.name}")
    digest = hashlib.sha256()
    size = rows = 0
    metrics = {}
    with closing(tables._gzip_blocks(path, level, metrics)) as blocks:
        for row in tables._rows_from_blocks(blocks, tables._row_limit(states)):
            _check(rows < part["rows"], "Part has extra rows")
            tables.validate_row(row, states, part["start_state"] + rows)
            digest.update(row)
            size += len(row)
            rows += 1
            yield row
    _check(rows == part["rows"] and size == part["raw_bytes"]
           and digest.hexdigest() == part["raw_sha256"], "Part raw count/hash changed")
    _check(metrics["gzip_bytes"] == part["gzip_bytes"]
           and metrics["gzip_sha256"] == part["gzip_sha256"], "Part compressed bytes changed")


def _compare_range(raw, source_directory, part, states, level):
    digest = hashlib.sha256()
    with Path(raw).open("rb") as reference, closing(_part_rows(source_directory, part, states, level)) as rows:
        for offset, row in enumerate(rows):
            state = part["start_state"] + offset
            expected = tables._read_row(reference, states, state, "Independent range producer")
            _check(row == expected, f"Independent range producer differs at global row {state}")
            digest.update(expected)
        _check(reference.read(1) == b"", "Independent range producer emitted extra data")
    return digest.hexdigest()


def _assemble(directory, records, states, per_part, level):
    whole = hashlib.sha256()
    raw_total = gzip_total = 0
    for record in records:
        digest = hashlib.sha256()
        size = 0
        metrics = {}
        with closing(tables._gzip_blocks(Path(directory) / record["file"], level, metrics)) as blocks:
            for block in blocks:
                whole.update(block)
                digest.update(block)
                size += len(block)
        _check(size == record["raw_bytes"] and digest.hexdigest() == record["raw_sha256"]
               and metrics["gzip_bytes"] == record["gzip_bytes"]
               and metrics["gzip_sha256"] == record["gzip_sha256"], "Part changed before assembly")
        raw_total += size
        gzip_total += metrics["gzip_bytes"]
    return {"format": tables.FORMAT, "states": states, "rows_per_part": per_part,
            "compression": {"format": "gzip", "level": level, "mtime": 0, "filename": ""},
            "raw_bytes": raw_total, "gzip_bytes": gzip_total,
            "raw_sha256": whole.hexdigest(), "parts": records}


def _record_valid(record, states, per_part):
    tables._keys(record, {"index", "file", "start_state", "end_state_exclusive", "rows",
                         "raw_bytes", "raw_sha256", "gzip_bytes", "gzip_sha256"}, "completed part")
    index = tables._integer(record["index"], "completed part index")
    start, stop = index * per_part, min(states, (index + 1) * per_part)
    _check(start < states and record["file"] == tables._part_name(index), "Invalid completed part index/name")
    for key, expected in [("start_state", start), ("end_state_exclusive", stop), ("rows", stop - start)]:
        _check(type(record[key]) is int and record[key] == expected, "Invalid completed part range/count")
    tables._integer(record["raw_bytes"], "completed raw bytes", 1)
    tables._integer(record["gzip_bytes"], "completed gzip bytes", 18)
    tables._sha(record["raw_sha256"], "completed raw")
    tables._sha(record["gzip_sha256"], "completed compressed")


def _save_journal(directory, journal):
    temporary = Path(directory) / "run.json.new"
    _check(not temporary.is_symlink(), "Nonregular journal staging path")
    with temporary.open("wb") as target:
        target.write(_canonical(journal))
    os.replace(temporary, Path(directory) / "run.json")


def _event(directory, event, callback):
    event = {"elapsed_seconds": time.monotonic() - event.pop("started"), **event}
    event_path = Path(directory) / "events.jsonl"
    _check(not event_path.is_symlink(), "Nonregular event log")
    with event_path.open("ab") as target:
        target.write(json.dumps(event, sort_keys=True).encode("utf-8") + b"\n")
    if callback:
        callback(event)


def run(run_directory, *, states, producer, rows_per_part=1_000_000, workers=4,
        compression_level=6, timeout=120.0, rss_limit=MAX_RSS, resume=False,
        compare_directory=None, reproduce=False, progress=None):
    """Generate a new parts artifact, or compare every row from a separate producer.

    `compare_directory` is a sealed parts directory. Comparison always uses a new
    run directory and new producer processes. `reproduce` additionally retains and
    compares fresh deterministic compressed parts. Generation alone can resume
    explicitly, after fixed-identity and full completed-part validation.
    """
    tables._settings(states, rows_per_part, compression_level)
    _check(rows_per_part <= MAX_RANGE, "At most 2,000,000 rows per range")
    _check(type(workers) is int and 1 <= workers <= MAX_WORKERS, "Use 1..4 workers")
    _check(type(timeout) in (int, float) and math.isfinite(timeout) and 0 < timeout <= 3600,
           "Producer timeout must be finite, positive and at most 3600 seconds")
    _check(type(rss_limit) is int and 0 < rss_limit <= MAX_RSS, "RSS cap must be in 1..8 GiB")
    _check(not reproduce or compare_directory is not None, "Reproduction requires independent comparison")
    _check(not resume or compare_directory is None, "Independent comparison always requires a fresh run")
    _validate_spec(producer)
    _rss(os.getpid())  # Fail before launch on an unsupported monitoring platform.
    directory = Path(run_directory)
    source = Path(compare_directory).resolve() if compare_directory is not None else None
    original = tables.load_manifest(source) if source is not None else None
    if original:
        _check(original["states"] == states and original["rows_per_part"] == rows_per_part
               and original["compression"]["level"] == compression_level,
               "Comparison settings must match the complete source manifest")
    plan = {"states": states, "rows_per_part": rows_per_part, "workers": workers,
            "compression_level": compression_level, "timeout": timeout, "rss_limit": rss_limit,
            "producer": producer, "tool_sha256": _hash(__file__),
            "table_parts_sha256": _hash(_PARTS_PATH), "python": sys.version,
            "zlib": tables.zlib.ZLIB_RUNTIME_VERSION, "compare_directory": str(source) if source else None,
            "compare_manifest_sha256": _hash(source / tables.MANIFEST) if source else None,
            "reproduce": reproduce}
    def check_identity():
        _check_pins(producer)
        _check(_hash(__file__) == plan["tool_sha256"]
               and _hash(_PARTS_PATH) == plan["table_parts_sha256"], "Orchestration code identity changed")

    if resume:
        _check(directory.is_dir() and not directory.is_symlink(), "Resume directory does not exist")
        _check(not (directory / "run.json").is_symlink(), "Nonregular resume journal")
        with (directory / "run.json").open("rb") as stream:
            data = stream.read(tables.MAX_MANIFEST_BYTES + 1)
        _check(len(data) <= tables.MAX_MANIFEST_BYTES, "Run journal exceeds metadata bound")
        journal = json.loads(data, object_pairs_hook=tables._no_duplicate_keys)
        resource_fields = {"workers", "timeout", "rss_limit"}
        stored = journal.get("plan")
        _check(type(stored) is dict and journal.get("format") == RUN_FORMAT
               and {k: v for k, v in stored.items() if k not in resource_fields}
               == {k: v for k, v in plan.items() if k not in resource_fields},
               "Stale run identity/settings; start a fresh run")
    else:
        try:
            directory.mkdir()
        except FileExistsError as error:
            raise Error("Run directory already exists; use a new directory or explicit generation resume") from error
        for name in ["parts", "scratch", "logs"]:
            (directory / name).mkdir()
        journal = {"format": RUN_FORMAT, "plan": plan, "status": "incomplete", "completed": []}
    for name in ["parts", "scratch", "logs"]:
        _check((directory / name).is_dir() and not (directory / name).is_symlink(),
               "Missing or nonregular run subdirectory")
    started = time.monotonic()
    completed = {}
    count = (states + rows_per_part - 1) // rows_per_part
    _check(type(journal.get("completed")) is list and len(journal["completed"]) <= count,
           "Invalid completed range inventory")
    previous = -1
    for record in journal["completed"]:
        _record_valid(record, states, rows_per_part)
        _check(record["index"] > previous, "Completed range records are duplicate or reordered")
        previous = record["index"]
        for _ in _part_rows(directory / "parts", record, states, compression_level):
            pass
        completed[record["index"]] = record
        _event(directory, {"started": started, "event": "retained-range-validated",
                           "index": record["index"], "rows": record["rows"]}, progress)
    allowed = {tables._part_name(i): i for i in range(count)}
    for entry in (directory / "parts").iterdir():
        if entry.name == tables.MANIFEST:
            _check(entry.is_file() and not entry.is_symlink(), "Nonregular complete manifest")
            continue
        _check(entry.name in allowed and entry.is_file() and not entry.is_symlink(),
               "Unexpected file in partial parts directory")
        if allowed[entry.name] not in completed:
            orphan = directory / "scratch" / ("uncommitted-" + uuid.uuid4().hex + ".gz")
            entry.rename(orphan)
            _event(directory, {"started": started, "event": "quarantined-uncommitted-part",
                               "file": entry.name, "quarantine": orphan.name}, progress)
    journal["status"] = "incomplete"
    journal.pop("error", None)
    attempt = {"workers": workers, "timeout": timeout, "rss_limit": rss_limit,
               "resume": resume, "started_unix": time.time(), "status": "incomplete"}
    _check(type(journal.setdefault("attempts", [])) is list, "Invalid attempt inventory")
    journal["attempts"].append(attempt)
    _save_journal(directory, journal)
    _event(directory, {"started": started, "event": "attempt-start", **attempt}, progress)
    active, lock = {}, threading.Lock()
    cancelled = threading.Event()
    peak_rss = _rss(os.getpid())
    peak_active_producers = 0

    def job(index):
        start = index * rows_per_part
        amount = min(rows_per_part, states - start)
        token = f"{index:08d}-{uuid.uuid4().hex}"
        raw, stderr = directory / "scratch" / (token + ".raw"), directory / "logs" / (token + ".stderr")
        argv = _argv(producer, start, amount, states)
        try:
            check_identity()
            clock = time.monotonic()
            with raw.open("xb") as output, stderr.open("xb") as errors:
                with lock:
                    _check(not cancelled.is_set(), "Run cancelled before producer launch")
                    process = subprocess.Popen(argv, cwd=producer["cwd"], env=producer["env"],
                                               stdin=subprocess.DEVNULL, stdout=output, stderr=errors,
                                               shell=False, start_new_session=True)
                    state = {"process": process, "start": clock, "raw": raw, "stderr": stderr,
                             "max_bytes": amount * tables._row_limit(states), "index": index, "peak_rss": 0}
                    active[index] = state
                code = process.wait()
                producer_elapsed = time.monotonic() - clock
                with lock:
                    active.pop(index, None)
            _check(code == 0, f"Range {index} producer exited {code}; see {stderr.name}")
            _check(raw.stat().st_size <= state["max_bytes"], "Producer exceeded bounded raw range size")
            _check(stderr.stat().st_size <= MAX_STDERR, "Producer exceeded stderr cap")
            if original:
                digest = _compare_range(raw, source, original["parts"][index], states, compression_level)
            if not original or reproduce:
                record = _pack_range(raw, directory / "parts" / tables._part_name(index), states,
                                     index, start, amount, compression_level)
            else:
                record = dict(original["parts"][index])
                _check(record["raw_sha256"] == digest, "Independent range digest disagrees after byte comparison")
            check_identity()
            return record, {"started": started, "event": "range-complete", "index": index,
                            "start_state": start, "rows": amount, "argv": argv,
                            "producer_seconds": producer_elapsed,
                            "range_seconds": time.monotonic() - clock,
                            "peak_sampled_producer_rss_bytes": state["peak_rss"],
                            "comparison": "every-row-byte" if original else "generation-only"}

        finally:
            raw.unlink(missing_ok=True)

    pending = iter(i for i in range(count) if i not in completed)
    futures = {}
    pool = ThreadPoolExecutor(max_workers=workers)
    try:
        for _ in range(workers):
            index = next(pending, None)
            if index is not None:
                futures[pool.submit(job, index)] = index
        while futures:
            done, _ = wait(futures, timeout=0.05, return_when=FIRST_COMPLETED)
            total = _rss(os.getpid())
            with lock:
                states_active = list(active.values())
            peak_active_producers = max(peak_active_producers, len(states_active))
            for state in states_active:
                rss = _rss(state["process"].pid)
                total += rss
                state["peak_rss"] = max(state["peak_rss"], rss)
                _check(time.monotonic() - state["start"] <= timeout, "Producer range timeout")
                try:
                    _check(state["raw"].stat().st_size <= state["max_bytes"], "Producer raw output cap exceeded")
                    _check(state["stderr"].stat().st_size <= MAX_STDERR, "Producer stderr cap exceeded")
                except FileNotFoundError:
                    _check(state["process"].poll() is not None, "Active producer scratch disappeared")
            peak_rss = max(peak_rss, total)
            _check(total <= rss_limit, "Aggregate parent/producer RSS cap exceeded")
            for future in done:
                futures.pop(future)
                record, event = future.result()
                completed[record["index"]] = record
                journal["completed"] = [completed[i] for i in sorted(completed)]
                _save_journal(directory, journal)
                _event(directory, event, progress)
                index = next(pending, None)
                if index is not None:
                    futures[pool.submit(job, index)] = index
        _check(len(completed) == count, "Partial range set cannot be complete")
        records = [completed[i] for i in range(count)]
        check_identity()
        target = directory / "parts" if not original or reproduce else source
        manifest = _assemble(target, records, states, rows_per_part, compression_level)
        if original:
            _check(_hash(source / tables.MANIFEST) == plan["compare_manifest_sha256"],
                   "Source manifest changed during independent comparison")
            _check(manifest == original, "Full independent comparison metadata differs")
        if not original or reproduce:
            path = directory / "parts" / tables.MANIFEST
            data = tables._manifest_bytes(manifest)
            if path.exists():
                _check(resume and path.read_bytes() == data, "Existing complete manifest differs")
            else:
                with path.open("xb") as target_file:
                    target_file.write(data)
        if reproduce:
            for name in [tables.MANIFEST] + [p["file"] for p in records]:
                tables._compare_files(source / name, directory / "parts" / name)
        check_identity()
        journal.update(status="complete", completed=records, states_completed=states,
                       compared_rows=states if original else 0, peak_sampled_rss_bytes=peak_rss,
                       peak_active_producers=peak_active_producers,
                       elapsed_seconds=time.monotonic() - started,
                       comparison="every-row-byte" if original else "generation-only",
                       compressed_reproduction=bool(reproduce))
        attempt.update(status="complete", elapsed_seconds=time.monotonic() - started)
        _save_journal(directory, journal)
        _event(directory, {"started": started, "event": "complete", "states": states,
                           "compared_rows": journal["compared_rows"]}, progress)
        return journal
    except BaseException as error:
        with lock:
            cancelled.set()
            for state in active.values():
                _kill(state["process"])
        for future in futures:
            future.cancel()
        attempt.update(status="failed", error=str(error), elapsed_seconds=time.monotonic() - started)
        journal.update(status="failed", error=str(error), peak_sampled_rss_bytes=peak_rss)
        _save_journal(directory, journal)
        raise
    finally:
        pool.shutdown(wait=True, cancel_futures=True)


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest="command", required=True)
    capture = sub.add_parser("spec", help="Pin accepted executable and explicitly declared inputs")
    capture.add_argument("--output", required=True)
    capture.add_argument("--pin", action="append", default=[])
    capture.add_argument("--cwd")
    capture.add_argument("argv", nargs=argparse.REMAINDER)
    for name in ["generate", "compare"]:
        command = sub.add_parser(name)
        command.add_argument("run_directory")
        command.add_argument("--producer", required=True)
        command.add_argument("--states", type=int, required=True)
        command.add_argument("--rows-per-part", type=int, default=1_000_000)
        command.add_argument("--workers", type=int, default=4)
        command.add_argument("--compression-level", type=int, default=6)
        command.add_argument("--timeout", type=float, default=120)
        command.add_argument("--rss-limit", type=int, default=MAX_RSS)
        if name == "generate":
            command.add_argument("--resume", action="store_true")
        else:
            command.add_argument("--against", required=True, help="Complete accepted parts directory")
            command.add_argument("--reproduce", action="store_true")
    args = parser.parse_args(argv)
    try:
        if args.command == "spec":
            producer_argv = args.argv[1:] if args.argv[:1] == ["--"] else args.argv
            spec = make_spec(producer_argv, args.pin, cwd=args.cwd)
            _exclusive_json(args.output, spec)
            print(json.dumps({"spec": args.output, "sha256": _hash(args.output)}, sort_keys=True))
        else:
            result = run(args.run_directory, states=args.states, producer=load_spec(args.producer),
                         rows_per_part=args.rows_per_part, workers=args.workers,
                         compression_level=args.compression_level, timeout=args.timeout,
                         rss_limit=args.rss_limit, resume=getattr(args, "resume", False),
                         compare_directory=getattr(args, "against", None),
                         reproduce=getattr(args, "reproduce", False),
                         progress=lambda event: print(json.dumps(event, sort_keys=True), flush=True))
            print(json.dumps({"status": result["status"], "states": result["states_completed"],
                              "compared_rows": result["compared_rows"],
                              "peak_sampled_rss_bytes": result["peak_sampled_rss_bytes"]}, sort_keys=True))
        return 0
    except (Error, OSError, ValueError, RuntimeError) as error:
        print(f"parallel table error: {error}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
