#!/usr/bin/env python3
"""Authored tests for complete table transport; no Lean semantic claim."""
import argparse
import ctypes
import os
import gzip
import hashlib
import importlib.util
import io
import json
from pathlib import Path
import resource
import shutil
import subprocess
import sys
import tempfile
import time

sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parents[2]
HERE = ROOT / ".lake/chess-m6-check/table-parts-fixtures"
HERE.mkdir(parents=True, exist_ok=True)
SCRIPT = ROOT / "scripts/chess_m6_table_parts.py"
spec = importlib.util.spec_from_file_location("table_parts", SCRIPT)
tables = importlib.util.module_from_spec(spec)
spec.loader.exec_module(tables)
WHITE = ROOT / "artifacts/chess_m5/white.txt"
ASSERTIONS = 0


def check(condition, label):
    global ASSERTIONS
    assert condition, label
    ASSERTIONS += 1


def reject(label, action):
    try:
        action()
    except tables.TablePartsError:
        print("rejected:", label)
        check(True, label)
        return
    raise AssertionError("Accepted negative control: " + label)


def equal_files(left, right):
    tables._compare_files(Path(left), Path(right))
    check(True, "full file equality")


def emit_manifest(directory, manifest):
    (directory / tables.MANIFEST).write_bytes(tables._manifest_bytes(manifest))


def read_manifest(directory):
    return json.loads((directory / tables.MANIFEST).read_text())


def gzip_data(data, level=6):
    stream = io.BytesIO()
    with gzip.GzipFile(fileobj=stream, filename="", mode="wb", compresslevel=level, mtime=0) as out:
        out.write(data)
    return stream.getvalue()


def refresh_part_checks(directory, *, refresh_raw=False):
    manifest = read_manifest(directory)
    whole = hashlib.sha256()
    for part in manifest["parts"]:
        path = directory / part["file"]
        part["gzip_bytes"], part["gzip_sha256"] = tables._digest_file(path)
        if refresh_raw:
            data = gzip.decompress(path.read_bytes())
            part["raw_bytes"] = len(data)
            part["raw_sha256"] = hashlib.sha256(data).hexdigest()
            whole.update(data)
    manifest["gzip_bytes"] = sum(p["gzip_bytes"] for p in manifest["parts"])
    if refresh_raw:
        manifest["raw_bytes"] = sum(p["raw_bytes"] for p in manifest["parts"])
        manifest["raw_sha256"] = whole.hexdigest()
    emit_manifest(directory, manifest)


def format_tests(base):
    compile(SCRIPT.read_bytes(), str(SCRIPT), "exec")
    check(True, "production Python syntax")
    with WHITE.open("rb") as source:
        states = sum(1 for _ in source)
    first, second = base / "white-parts-a", base / "white-parts-b"
    with WHITE.open("rb") as source:
        manifest = tables.pack(source, first, states=states, rows_per_part=4096)
    with WHITE.open("rb") as reference, (base / "white-roundtrip.txt").open("xb") as output:
        result = tables.verify(first, reference=reference, output=output)
    check(result["states"] == states and result["compared_rows"] == states, "all actual M5 rows compared")
    check(result["compared"] and result["comparison"] == "full-row-byte-stream", "explicit full-stream mode")
    equal_files(WHITE, base / "white-roundtrip.txt")
    class ShortWriter:
        def __init__(self):
            self.data = bytearray()
        def write(self, block):
            count = max(1, len(block) // 2)
            self.data.extend(block[:count])
            return count
    partial = ShortWriter()
    streamed = tables.verify(first, output=partial)
    check(bytes(partial.data) == WHITE.read_bytes(), "partial writes lose no output bytes")
    check(streamed["states"] == states, "partial-write output still checks every row")
    check(len(manifest["parts"]) > 2, "actual M5 table spans multiple parts")
    actual_size, actual_sha = tables._digest_file(WHITE)
    frozen = json.loads((WHITE.parent / "manifest.json").read_text())["artifacts"]["white"]
    check(states == frozen["states"] and actual_sha == frozen["sha256"],
          "fixture matches existing M5 state/hash record")
    check((actual_size, actual_sha) == (manifest["raw_bytes"], manifest["raw_sha256"]), "whole raw measurements")
    copied = base / "different-source-name.txt"
    shutil.copyfile(WHITE, copied)
    with copied.open("rb") as source:
        repeat = tables.pack(source, second, states=states, rows_per_part=4096)
    check(manifest == repeat, "deterministic manifest metadata")
    for a in first.iterdir():
        equal_files(a, second / a.name)
    check(all(p["start_state"] == i * 4096 and p["rows"] == min(4096, states - i * 4096)
              for i, p in enumerate(manifest["parts"])), "row-aligned exact state ranges")
    reproduced = tables.reproduce(first, WHITE, scratch_parent=base)
    check(reproduced["reproduction"] == "all-manifest-and-gzip-bytes-identical", "fresh scratch reproduction")
    check(reproduced["scratch"] is None and not list(base.glob("chess-m6-table-reproduce-*")), "temporary reproduction cleaned")
    retained = tables.reproduce(first, WHITE, scratch_parent=base, keep_scratch=True)
    check(Path(retained["scratch"]).is_dir() and Path(retained["scratch"]) != first,
          "retained reproduction uses a fresh directory")
    shutil.rmtree(retained["scratch"])
    single = b"0L0 1R0\n"
    for level in [0, 1, 6, 9]:
        target = base / f"single-level-{level}"
        tables.pack(io.BytesIO(single), target, states=1, rows_per_part=1, compression_level=level)
        checked = tables.verify(target, reference=io.BytesIO(single))
        check(checked["states"] == 1, f"one-state table, compression level {level}")
        header = (target / "part-00000000.txt.gz").read_bytes()[:10]
        check(header == tables._gzip_header(level), "fixed zero-mtime empty-filename gzip header")
    cli = base / "stdin-parts"
    packed = subprocess.run([sys.executable, str(SCRIPT), "pack", "-", str(cli), "--states", "1"],
                            input=single, capture_output=True, timeout=10)
    check(packed.returncode == 0, "CLI pack binary stdin")
    compared = subprocess.run([sys.executable, str(SCRIPT), "verify", str(cli), "--reference", "-"],
                              input=single, capture_output=True, timeout=10)
    check(compared.returncode == 0 and json.loads(compared.stdout)["compared_rows"] == 1,
          "CLI verify independent binary stdin")
    extracted = subprocess.run([sys.executable, str(SCRIPT), "unpack", str(cli), "-"],
                              capture_output=True, timeout=10)
    check(extracted.returncode == 0 and extracted.stdout == single, "CLI stdout contains only raw table")
    check(json.loads(extracted.stderr)["states"] == 1, "CLI unpack summary separated on stderr")
    existing = subprocess.run([sys.executable, str(SCRIPT), "pack", "-", str(cli), "--states", "1"],
                              input=single, capture_output=True, timeout=10)
    check(existing.returncode == 1, "CLI existing output rejected")
    occupied_raw = base / "occupied-raw.txt"
    occupied_raw.write_bytes(b"sentinel")
    blocked = subprocess.run([sys.executable, str(SCRIPT), "unpack", str(cli), str(occupied_raw)],
                             capture_output=True, timeout=10)
    check(blocked.returncode == 1 and occupied_raw.read_bytes() == b"sentinel",
          "CLI unpack cannot overwrite existing raw output")
    print(json.dumps({"actual_fixture": str(WHITE.relative_to(ROOT)), "states": states,
                      "raw_bytes": actual_size, "raw_sha256": actual_sha,
                      "parts": len(manifest["parts"]), "assertions": ASSERTIONS}, sort_keys=True))
    print("Table parts format verification passed")


def negative_tests(base):
    controls = [
        ("out-of-range destination", b"0L1 ---\n", 1),
        ("leading-zero decimal", b"0L00 ---\n", 1),
        ("missing final newline", b"--- ---", 1),
        ("too few rows", b"--- ---\n", 2),
        ("extra row", b"--- ---\n--- ---\n", 1),
        ("tab delimiter", b"---\t---\n", 1),
        ("double-space delimiter", b"---  ---\n", 1),
        ("CRLF", b"--- ---\r\n", 1),
        ("nonbinary symbol", b"2L0 ---\n", 1),
        ("wrong direction", b"0X0 ---\n", 1),
        ("negative destination", b"0L-1 ---\n", 1),
        ("plus destination", b"0L+0 ---\n", 1),
        ("trailing raw byte", b"--- ---\nx", 1),
        ("overlong unbroken row", b"0L" + b"9" * 100_000, 1),
        ("invalid halt cell", b"-- ---\n", 1),
        ("empty table", b"", 1),
    ]
    for index, (label, data, states) in enumerate(controls):
        stream = io.BytesIO(data)
        reject(label, lambda s=stream, q=states, i=index:
               tables.pack(s, base / f"bad-source-{i}", states=q))
        if label == "overlong unbroken row":
            check(stream.tell() <= tables._row_limit(states) + 1, "overlong input read is bounded")
    for index, settings in enumerate([{"states": 0}, {"states": 1, "rows_per_part": 0},
                                      {"states": 1, "compression_level": 10}, {"states": True}]):
        reject("invalid settings " + str(index), lambda v=settings, i=index:
               tables.pack(io.BytesIO(b"--- ---\n"), base / f"bad-settings-{i}", **v))
    occupied = base / "occupied"
    occupied.mkdir()
    sentinel = occupied / "keep.txt"
    sentinel.write_bytes(b"keep")
    reject("existing output directory", lambda: tables.pack(io.BytesIO(b"--- ---\n"), occupied, states=1))
    check(sentinel.read_bytes() == b"keep", "existing bytes preserved")
    data = b"0R1 1L2\n--- ---\n0L0 1R1\n"
    seed = base / "seed"
    tables.pack(io.BytesIO(data), seed, states=3, rows_per_part=1)
    ordinal = 0

    def mutation(label, change, reference=None):
        nonlocal ordinal
        ordinal += 1
        target = base / f"mutation-{ordinal}"
        shutil.copytree(seed, target)
        change(target)
        reject(label, lambda: tables.verify(target, reference=reference))

    def manifest_change(target, change):
        manifest = read_manifest(target)
        change(manifest)
        emit_manifest(target, manifest)

    mutation("reordered part records", lambda d: manifest_change(d, lambda m: m["parts"].reverse()))
    mutation("missing part", lambda d: (d / "part-00000001.txt.gz").unlink())
    mutation("duplicate part record", lambda d: manifest_change(d, lambda m: m["parts"].append(m["parts"][0])))
    mutation("wrong filename", lambda d: manifest_change(d, lambda m: m["parts"][0].update(file="../outside.gz")))
    mutation("wrong state range", lambda d: manifest_change(d, lambda m: m["parts"][0].update(start_state=1)))
    mutation("wrong row count", lambda d: manifest_change(d, lambda m: m["parts"][0].update(rows=2)))
    mutation("wrong declared q", lambda d: manifest_change(d, lambda m: m.update(states=4)))
    mutation("wrong total size", lambda d: manifest_change(d, lambda m: m.update(raw_bytes=m["raw_bytes"] + 1)))
    mutation("wrong raw hash", lambda d: manifest_change(d, lambda m: m["parts"][0].update(raw_sha256="0" * 64)))
    mutation("wrong compressed hash", lambda d: manifest_change(d, lambda m: m["parts"][0].update(gzip_sha256="0" * 64)))
    mutation("wrong whole hash", lambda d: manifest_change(d, lambda m: m.update(raw_sha256="0" * 64)))
    mutation("unknown manifest field", lambda d: manifest_change(d, lambda m: m.update(extra="data")))
    mutation("noncanonical manifest encoding", lambda d: (d / tables.MANIFEST).write_text(json.dumps(read_manifest(d))))
    mutation("duplicate JSON key", lambda d: (d / tables.MANIFEST).write_bytes(
        (d / tables.MANIFEST).read_bytes().replace(b'{\n', b'{\n  "states": 3,\n', 1)))
    mutation("truncated manifest", lambda d: (d / tables.MANIFEST).write_bytes(b'{"states":'))
    mutation("excessive JSON nesting", lambda d: (d / tables.MANIFEST).write_bytes(
        b"[" * 2000 + b"0" + b"]" * 2000))
    mutation("extra artifact file", lambda d: (d / "unexpected.gz").write_bytes(b"extra"))
    mutation("missing manifest", lambda d: (d / tables.MANIFEST).unlink())

    def bytes_change(target, transform):
        path = target / "part-00000000.txt.gz"
        path.write_bytes(transform(path.read_bytes()))
        refresh_part_checks(target)

    mutation("truncated gzip with updated digest", lambda d: bytes_change(d, lambda b: b[:-3]))
    mutation("bad gzip CRC with updated digest", lambda d: bytes_change(d, lambda b: b[:-8] + bytes([b[-8] ^ 1]) + b[-7:]))
    mutation("trailing gzip padding with updated digest", lambda d: bytes_change(d, lambda b: b + b"\x00"))
    mutation("extra gzip member with updated digest", lambda d: bytes_change(d, lambda b: b + gzip_data(b"--- ---\n")))
    mutation("nonzero gzip mtime with updated digest", lambda d: bytes_change(d, lambda b: b[:4] + b"\x01" + b[5:]))
    mutation("changed gzip header with updated digest", lambda d: bytes_change(d, lambda b: b[:9] + b"\x03" + b[10:]))

    def raw_change(target, changed):
        path = target / "part-00000000.txt.gz"
        path.write_bytes(gzip_data(changed))
        refresh_part_checks(target, refresh_raw=True)

    mutation("invalid destination despite recomputed digests", lambda d: raw_change(d, b"0L3 ---\n"))
    mutation("noncanonical decimal despite recomputed digests", lambda d: raw_change(d, b"0L00 ---\n"))
    mutation("extra row despite recomputed digests", lambda d: raw_change(d, b"--- ---\n--- ---\n"))
    mutation("missing newline despite recomputed digests", lambda d: raw_change(d, b"--- ---"))
    mutation("overlong decompressed row despite recomputed digests",
             lambda d: raw_change(d, b"9" * 100_000))
    class StalledWriter:
        def write(self, block):
            return 0
    reject("output stream makes no write progress", lambda: tables.verify(seed, output=StalledWriter()))
    changed = base / "valid-but-different"
    shutil.copytree(seed, changed)
    raw_change(changed, b"0L0 1R1\n")
    check(tables.verify(changed)["compared"] is False, "integrity alone makes no external identity claim")
    reject("valid changed bytes despite all recomputed digests",
           lambda: tables.verify(changed, reference=io.BytesIO(data)))
    reject("independent stream truncated", lambda: tables.verify(seed, reference=io.BytesIO(data[:-8])))
    reject("independent stream extra row", lambda: tables.verify(seed, reference=io.BytesIO(data + b"--- ---\n")))
    reject("independent stream malformed", lambda: tables.verify(seed, reference=io.BytesIO(b"0L00 ---\n" + data)))
    link = base / "symlinked-part"
    shutil.copytree(seed, link)
    target = link / "part-00000000.txt.gz"
    target.unlink()
    target.symlink_to(seed / "part-00000000.txt.gz")
    reject("symlinked part", lambda: tables.verify(link))
    check(ASSERTIONS >= 40, "at least forty rejection/positive controls")
    print(json.dumps({"negative_group_assertions": ASSERTIONS}, sort_keys=True))
    print("Table parts negative controls passed")


def profile_worker(states):
    limit = 8 * 1024**3
    start = time.monotonic()
    with tempfile.TemporaryDirectory(prefix="table-parts-profile-", dir=HERE) as scratch:
        scratch = Path(scratch)
        raw = scratch / "independent-export.txt"
        with raw.open("wb") as output:
            for state in range(states):
                left = f"{state % 2}L{(state * 7919 + 1) % states}"
                right = "---" if state % 97 == 0 else f"{(state + 1) % 2}R{(state + 1) % states}"
                output.write(f"{left} {right}\n".encode("ascii"))
        generated = time.monotonic()
        parts = scratch / "parts"
        with raw.open("rb") as source:
            manifest = tables.pack(source, parts, states=states, rows_per_part=100_000)
        packed = time.monotonic()
        with raw.open("rb") as reference, (scratch / "roundtrip.txt").open("xb") as output:
            result = tables.verify(parts, reference=reference, output=output)
        verified = time.monotonic()
        tables._compare_files(raw, scratch / "roundtrip.txt")
        report = tables.reproduce(parts, raw, scratch_parent=scratch)
        stop = time.monotonic()
        peak = resource.getrusage(resource.RUSAGE_SELF).ru_maxrss
        peak_bytes = peak if sys.platform == "darwin" else peak * 1024
        assert result["compared_rows"] == states and report["compared_rows"] == states
        assert peak_bytes < limit and stop - start < 60
        print(json.dumps({"states": states, "parts": len(manifest["parts"]),
                          "raw_bytes": manifest["raw_bytes"], "gzip_bytes": manifest["gzip_bytes"],
                          "generation_seconds": generated - start, "pack_seconds": packed - generated,
                          "verify_compare_unpack_seconds": verified - packed,
                          "fresh_reproduction_seconds": stop - verified, "total_seconds": stop - start,
                          "pack_rows_per_second": states / (packed - generated),
                          "verify_rows_per_second": states / (verified - packed),
                          "peak_rss_bytes": peak_bytes, "live_rss_cap_bytes": limit,
                          "comparison": result["comparison"], "reproduction": report["reproduction"],
                          "python_version": sys.version,
                          "zlib_runtime_version": tables.zlib.ZLIB_RUNTIME_VERSION,
                          "zlib_compile_version": tables.zlib.ZLIB_VERSION}, sort_keys=True))


def child_rss(pid):
    if sys.platform == "darwin":
        # rusage_info_v2 from the installed macOS SDK sys/resource.h; own child only.
        class Usage(ctypes.Structure):
            _fields_ = [("uuid", ctypes.c_uint8 * 16)] + [
                (name, ctypes.c_uint64) for name in [
                    "user", "system", "idle", "interrupt", "pageins", "wired", "resident", "physical",
                    "started", "exited", "childuser", "childsystem", "childidle", "childinterrupt",
                    "childpageins", "childelapsed", "read", "written"]]
        lib = ctypes.CDLL("/usr/lib/libproc.dylib", use_errno=True)
        lib.proc_pid_rusage.argtypes = [ctypes.c_int, ctypes.c_int, ctypes.c_void_p]
        lib.proc_pid_rusage.restype = ctypes.c_int
        value = Usage()
        assert ctypes.sizeof(value) == 160
        return value.resident if lib.proc_pid_rusage(pid, 2, ctypes.byref(value)) == 0 else 0
    if sys.platform.startswith("linux"):
        try:
            pages = int(Path(f"/proc/{pid}/statm").read_text().split()[1])
            return pages * os.sysconf("SC_PAGE_SIZE")
        except FileNotFoundError:
            return 0
    raise AssertionError("Live profile RSS monitor requires macOS or Linux")


def profile_tests():
    records = []
    for states in [100_000, 1_000_000]:
        command = [sys.executable, str(Path(__file__).resolve()), "--worker", str(states)]
        started = time.monotonic()
        child = subprocess.Popen(command, cwd=ROOT, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        cap = 8 * 1024**3
        peak_sampled = 0
        while child.poll() is None:
            elapsed = time.monotonic() - started
            rss = child_rss(child.pid)
            peak_sampled = max(peak_sampled, rss)
            if elapsed >= 60 or rss > cap:
                child.kill()
                stdout, stderr = child.communicate()
                raise AssertionError(f"Profile resource cap: elapsed={elapsed}, RSS={rss}; {stdout}{stderr}")
            time.sleep(0.025)
        stdout, stderr = child.communicate()
        output = stdout + stderr
        print(output, end="")
        assert child.returncode == 0, (child.returncode, output)
        record = json.loads(stdout)
        record.update(command=command, exit_status=child.returncode,
                      wall_seconds=time.monotonic() - started,
                      peak_sampled_rss_bytes=peak_sampled,
                      production_sha256=hashlib.sha256(SCRIPT.read_bytes()).hexdigest())
        assert record["states"] == states and record["peak_rss_bytes"] < 8 * 1024**3
        records.append(record)
    (HERE / "profiles.json").write_text(json.dumps(records, indent=2) + "\n")
    print("Table parts bounded profiles passed")


def main():
    parser = argparse.ArgumentParser()
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument("--format", action="store_true")
    group.add_argument("--negative", action="store_true")
    group.add_argument("--profile", action="store_true")
    group.add_argument("--worker", type=int)
    args = parser.parse_args()
    if args.worker:
        profile_worker(args.worker)
    elif args.profile:
        profile_tests()
    else:
        with tempfile.TemporaryDirectory(prefix="table-parts-tests-", dir=HERE) as scratch:
            if args.format:
                format_tests(Path(scratch))
            else:
                negative_tests(Path(scratch))


if __name__ == "__main__":
    main()
