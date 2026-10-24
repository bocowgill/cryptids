#!/usr/bin/env python3
"""Remote-only, bounded ordinary-kernel certificate scalability experiment.

Generate complete typed candidate data, then prove representative actual-body
rows. Partial success NEVER proves the complete quotient or a new chess bound.
"""
import os

if os.environ.get("CHESS_REMOTE") != "1" or os.environ.get("GITHUB_ACTIONS") != "true":
    raise SystemExit("Require CHESS_REMOTE=1 and GITHUB_ACTIONS=true before import")

import argparse
from array import array
import hashlib
import heapq
import json
from pathlib import Path
import resource
import shutil
import signal
import subprocess
import sys
import threading
import time

ROOT = Path(__file__).resolve().parents[2]
PREFIX = Path("Cryptids/Chess/Optimisation/BodyCertificatePilot")
MODULE = "Cryptids.Chess.Optimisation.BodyCertificatePilot"
NS = "Chess.Optimisation.BodyCertificatePilot"
AUDIT_TARGET = "chess_body_certificate_audit"
AUDIT_EXE = ROOT / ".lake/build/bin" / AUDIT_TARGET
N, K, MAIN = 573802, 114487, 533341
MAP_CHUNK_STATES = 1024
QUOTIENT_CHUNK_STATES = 1024
INPUT = ROOT / "docs/chess/campaign-2026-10-22/round-03/evidence/pilot-final/unpacked"
SNAPSHOT = ROOT / "docs/chess/campaign-2026-10-22/round-01/evidence/final/unpacked/machine-export.json"
SNAPSHOT_SHA = "592ea3c892d0e9d5a6db6ce31e3f590bde7973774bdc9a70cfe46cb6996cd39e"
PINS = {
    "class-map.u32le": "1602a0791ca45ba104952058c361f7296c62b7d6e4e599c98f197875a915f022",
    "representatives.u32le": "da1ad64b6e8df18884e4439955d8a0ce870513cc1b6eab146fef4ad5e3325142",
    "class-sizes.u32le": "243d372e90acaad65f77added63d658e686b66978c5ad52cd21fd1f44f24acf0",
    "quotient-rows.jsonl": "f41436a39c7aa35e74f3266c697d78b39e7bdf2e6d2810719d801e9d5e588531",
}


def require(condition, message):
    if not condition:
        raise AssertionError(message)


def info(path):
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1 << 20), b""):
            digest.update(chunk)
    return {"bytes": path.stat().st_size, "sha256": digest.hexdigest()}


def save(path, data):
    tmp = path.with_suffix(path.suffix + ".tmp")
    tmp.write_text(json.dumps(data, indent=2, sort_keys=True) + "\n")
    tmp.replace(path)


class Obstruction(RuntimeError):
    pass


def kill_group(process):
    if process is not None and process.poll() is None:
        try:
            os.killpg(process.pid, signal.SIGKILL)
        except ProcessLookupError:
            pass


class Driver:
    def __init__(self, args):
        self.args, self.start = args, time.monotonic()
        self.deadline = self.start + args.seconds
        self.child = None
        self.audit_roots = {}
        self.stage = "input_and_generation"
        source_only = getattr(args, "source_tables_only", False)
        self.summary = {
            "status": "running", "classification": "FINITE_PARTIAL_KERNEL_SCALABILITY_PILOT",
            "partial_certificate_only": True, "full_quotient_certified": False,
            "new_accepted_machine": False, "run_id": os.environ.get("GITHUB_RUN_ID"),
            "commit": os.environ.get("GITHUB_SHA"), "driver_source": info(Path(__file__)),
            "limits": {"wall_seconds": args.seconds, "process_group_rss_bytes": args.memory_gib << 30,
                       "driver_rss_bytes": 512 << 20, "rss_sampling_seconds": 0.1,
                       "audit_allocator_limit_bytes": None,
                       "address_space_limit": None, "memory_enforcement": "sampled resident memory"},
            "source_states": N, "quotient_states": K,
            "requested_scope": ("finite_source_operation_tables_only" if source_only else
                                "compiled_audit_smoke_only" if args.smoke_only else
                                "full_bounded_pilot"),
            "requested_sample_states": [] if source_only or args.smoke_only else [64, 512, 4096],
            "audit_execution": "compiled_lean_executable",
            "map_representation": "named_literal_nat_midpoint_subtrees_with_composed_kernel_proofs",
            "map_invariant_proof": "single_pass_checked_count_cache_range",
            "map_native_code_generation": False,
            "quotient_representation": "packed_nat_pairs_executable_noinline_midpoint_subtrees",
            "stages": [], "generated_files": {}, "completed_positive_sample_states": 0,
            "completed_positive_unique_rows": 0, "complete_typed_candidate_data_checked": False,
            "template_smoke_checked": False,
            "data_stage_group": {"wall_seconds": 120,
                                 "required_stages": ["MapPrelude", "MapCount", "MapValid",
                                                     "MapBounded", "MapChecks", "QuotientChecks",
                                                     "Data", "BodyRelation"],
                                 "completed_stages": []},
            "audited_modules": [],
            "negative_control": {"status": "not_run"},
        }
        signal.signal(signal.SIGALRM, self.expire)
        signal.setitimer(signal.ITIMER_REAL, args.seconds - 3)
        self.memory_reserve = bytearray(4 << 20)
        self.monitor_stop = threading.Event()
        signal.signal(signal.SIGUSR1, self.driver_memory_exceeded)
        threading.Thread(target=self.watch_driver, daemon=True).start()
        self.checkpoint()

    def watch_driver(self):
        # Cover JSON loading and source generation as well as child execution.
        # No driver address-space cap prevents writing the obstruction receipt.
        while not self.monitor_stop.wait(0.1):
            if current_rss(os.getpid()) > 512 << 20:
                os.kill(os.getpid(), signal.SIGUSR1)
                return

    def driver_memory_exceeded(self, *_):
        self.memory_reserve = None
        kill_group(self.child)
        raise Obstruction("driver resident-memory budget exceeded")

    def expire(self, *_):
        kill_group(self.child)
        signal.signal(signal.SIGALRM, lambda *_: os._exit(124))
        signal.setitimer(signal.ITIMER_REAL, 3)
        raise Obstruction("global wall budget exhausted")

    def checkpoint(self):
        self.summary.update(stage=self.stage, elapsed_seconds=time.monotonic() - self.start,
                            driver_peak_rss_kib=resource.getrusage(resource.RUSAGE_SELF).ru_maxrss)
        for filename, key in (("map-valid-progress.tsv", "validity_diagnostic"),
                              ("map-facts-progress.tsv", "map_facts_diagnostic"),
                              ("quotient-facts-progress.tsv", "quotient_facts_diagnostic"),
                              ("row-witness-progress.tsv", "row_witness_diagnostic"),
                              ("weight-chunks-progress.tsv", "weight_chunks_diagnostic"),
                              ("rows-1-progress.tsv", "rows1_diagnostic"),
                              ("rows-64-progress.tsv", "rows64_diagnostic"),
                              ("rows-512-progress.tsv", "rows512_diagnostic"),
                              ("rows-4096-progress.tsv", "rows4096_diagnostic")):
            progress = self.args.output / filename
            if progress.exists():
                events = progress.read_text().splitlines()
                self.summary[key] = {
                    "path": progress.name, "info": info(progress), "events": len(events),
                    "last_event": events[-1] if events else None, "proof_credit": False}
        diagnostics = self.args.output / "command-diagnostics.log"
        if diagnostics.exists():
            self.summary["durable_command_diagnostics"] = {
                "path": diagnostics.name, "info": info(diagnostics), "proof_credit": False}
        save(self.args.output / "certificate-summary.json", self.summary)

    def emit(self, name, text):
        if name.endswith(".lean"):
            wide = [(i, len(line)) for i, line in enumerate(text.splitlines(), 1)
                    if len(line) > 100]
            require(not wide, name + ": generated Lean exceeds 100 characters: " + str(wide[:5]))
        path = ROOT / PREFIX / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding="utf-8")
        retained = self.args.output / "reproduction" / PREFIX / name
        retained.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(path, retained)
        self.summary["generated_files"][str(PREFIX / name)] = info(path)

    def clear_build_products(self, stem):
        for folder in ("lib/lean", "ir"):
            base = ROOT / ".lake/build" / folder / PREFIX
            if base.is_dir():
                for path in base.glob(stem + ".*"):
                    if path.is_file():
                        path.unlink()

    def run(self, stem, seconds, banner=None, negative=False, audit=False, audit_build=False):
        require(sum((negative, audit, audit_build)) <= 1, "conflicting stage kinds")
        stage_started = time.monotonic()
        self.stage = "AuditExecutable" if audit_build else stem + "Audit" if audit else stem
        self.checkpoint()
        remaining = self.deadline - time.monotonic() - 4
        if remaining <= 0:
            raise Obstruction("no remaining time for " + stem)
        limit = min(seconds, remaining)
        module = MODULE + "." + stem
        # Only generated build products are removed, so a stage measures fresh
        # kernel checking rather than replay of a prior pilot's cached .olean.
        if not audit:
            self.clear_build_products(stem)
            if audit_build and AUDIT_EXE.exists():
                AUDIT_EXE.unlink()
        command = ["lake", "--wfail", "-f", str(self.args.lakefile)]
        if audit:
            require(AUDIT_EXE.is_file() and "auditor_executable" in self.summary,
                    "compiled auditor has not completed its required build")
            require(info(AUDIT_EXE) == self.summary["auditor_executable"]["info"],
                    "compiled auditor identity changed")
            command += ["env", str(AUDIT_EXE), module,
                        str(PREFIX / (stem + ".roots")), str(len(self.audit_roots[stem]))]
        else:
            command += ["build", AUDIT_TARGET if audit_build else module]
        log_path = self.args.output / (self.stage + ".log")
        started, peak, cause = time.monotonic(), 0, None
        self.summary["active_command"] = {"argv": command, "cwd": str(ROOT), "shell": False,
                                          "timeout_seconds": limit, "log": log_path.name,
                                          "started_after_seconds": started - self.start}
        self.checkpoint()

        with log_path.open("wb") as log:
            self.child = subprocess.Popen(command, cwd=ROOT, stdout=log, stderr=subprocess.STDOUT,
                                          start_new_session=True)
            while self.child.poll() is None:
                rss = process_group_rss(self.child.pid) + current_rss(os.getpid())
                peak = max(peak, rss)
                if rss > self.args.memory_gib << 30:
                    cause = "process_group_memory_budget"
                elif time.monotonic() - started > limit:
                    cause = "stage_wall_budget"
                if cause:
                    kill_group(self.child)
                    break
                time.sleep(0.1)
            exit_code = self.child.wait()
        self.child = None
        output = log_path.read_text(errors="replace")
        lower = output.lower()
        if exit_code != 0 and ("failed to create thread" in lower or "pthread_create" in lower):
            cause = cause or "runtime_thread_resource"
        kind = "auditor_build" if audit_build else "full_private_audit" if audit else "kernel_build"
        receipt = {"module": module, "kind": kind,
                   "argv": command, "cwd": str(ROOT), "shell": False,
                   "exit": exit_code, "timeout_seconds": limit, "resource_stop": cause,
                   "elapsed_seconds": time.monotonic() - started, "peak_group_plus_driver_rss_bytes": peak,
                   "log": log_path.name, "log_info": info(log_path), "expected_banner": banner,
                   "expected_banner_found": banner in output if banner else None}
        compiled = ROOT / ".lake/build/lib/lean" / PREFIX / (stem + ".olean")
        if compiled.exists() and not audit:
            receipt["olean"] = info(compiled)
        if audit_build and AUDIT_EXE.exists():
            receipt["executable"] = {"path": str(AUDIT_EXE), "info": info(AUDIT_EXE)}
        elif audit:
            receipt["executable"] = self.summary["auditor_executable"]
        self.summary["stages"].append(receipt)
        self.summary.pop("active_command", None)
        self.checkpoint()
        error_text = "\n".join(line.lower() for line in output.splitlines()
                               if "error:" in line.lower() or line.lower().startswith(
                                   ("libc++abi:", "fatal error:", "terminate called", "runtime error:",
                                    "uncaught exception:")))
        scaling = cause or any(pattern in error_text for pattern in
                               ("out of memory", "memory allocation failed", "memory exhausted",
                                "maximum memory", "bad_alloc", "resource temporarily unavailable",
                                "(deterministic) timeout", "maximum number of heartbeats",
                                "heartbeat limit exceeded", "maximum recursion depth", "stack overflow"))
        if (cause or exit_code != 0) and scaling:
            # A runtime resource failure is never a successful negative control.
            raise Obstruction(stem + ": " + str(cause or "Lean resource/scaling failure"))
        if negative:
            # Lean.addDecl invokes kernel checking; true controls module exposure.
            # The false term must reach that kernel check and be rejected.
            # Timeout, missing imports and tactic failures do not count.
            explicit_kernel_rejection = "(kernel)" in output and "type mismatch" in output.lower()
            require(cause is None and exit_code != 0 and explicit_kernel_rejection,
                    "negative control did not produce the required kernel type mismatch")
            self.summary["negative_control"] = {"status": "kernel_rejected", "receipt": stem}
        elif cause or exit_code != 0:
            raise RuntimeError(stem + ": Lean source/proof failure; inspect retained log")
        else:
            require(banner and banner in output, stem + ": success banner missing")
        if audit_build:
            require(AUDIT_EXE.is_file(), "successful auditor build produced no executable")
            self.summary["auditor_executable"] = {"path": str(AUDIT_EXE), "info": info(AUDIT_EXE),
                                                  "source": self.summary["generated_files"][str(PREFIX / "Audit.lean")]}
        if audit:
            self.summary.setdefault("audited_modules", []).append(
                {"module": module, "required_roots": len(self.audit_roots[stem]),
                 "full_private_environment": True})
        self.checkpoint()
        if not audit and not negative and stem in self.audit_roots:
            remaining_stage = seconds - (time.monotonic() - stage_started)
            if remaining_stage <= 0:
                raise Obstruction(stem + ": no remaining stage time for required full-private audit")
            self.run(stem, remaining_stage, "Body full-private kernel root audit passed", audit=True)

    def run_data_group(self):
        # One fresh dependency-chain build removes repeated compiler startup.
        # The final full-private audit covers every original explicit root.
        started = time.monotonic()
        group = self.summary["data_stage_group"]
        group["started_after_seconds"] = started - self.start
        group["strategy"] = "fresh_dependency_chain_and_union_audit"
        stems = group["required_stages"]
        expected_census = {"MapPrelude": 10, "MapCount": 2, "MapValid": 1,
                           "MapBounded": 1, "MapChecks": 6, "QuotientChecks": 14,
                           "Data": 19, "BodyRelation": 1}
        require({stem: len(self.audit_roots[stem]) for stem in stems} == expected_census,
                "data component audit coverage changed")
        roots = list(dict.fromkeys(root for stem in stems for root in self.audit_roots[stem]))
        require(len(roots) == 32, "complete data audit union census changed")
        group["component_roots"] = {stem: self.audit_roots[stem] for stem in stems}
        self.audit_roots["BodyRelation"] = roots
        self.emit("BodyRelation.roots", "\n".join(roots) + "\n")
        group["required_union_roots"] = len(roots)
        # Every generated proof module is removed before this one build. Lake
        # must freshly check all eight, not replay earlier cached certificates.
        for stem in stems:
            self.clear_build_products(stem)
        self.checkpoint()
        remaining = group["wall_seconds"] - (time.monotonic() - started)
        if remaining <= 0:
            raise Obstruction("shared Data budget exhausted before fresh dependency build")
        try:
            self.run("BodyRelation", remaining, "Actual body row predicate checked")
        finally:
            group["elapsed_seconds"] = time.monotonic() - started
        if time.monotonic() - started > group["wall_seconds"]:
            raise Obstruction("shared Data wall budget exhausted after required audits")
        output = (self.args.output / "BodyRelation.log").read_text()
        require(all("Built " + MODULE + "." + stem in output for stem in stems),
                "data dependency build did not freshly check every required module")
        group["elapsed_seconds"] = time.monotonic() - started
        if group["elapsed_seconds"] > group["wall_seconds"]:
            raise Obstruction("shared Data budget exhausted during fresh-build receipt check")
        group["completed_stages"] = list(stems)
        self.summary["complete_typed_candidate_data_checked"] = True
        self.checkpoint()


def current_rss(pid):
    try:
        for line in Path(f"/proc/{pid}/status").read_text().splitlines():
            if line.startswith("VmRSS:"):
                return int(line.split()[1]) * 1024
    except (FileNotFoundError, ProcessLookupError):
        pass
    return 0


def process_group_rss(group):
    total = 0
    for path in Path("/proc").iterdir():
        if path.name.isdecimal():
            try:
                if os.getpgid(int(path.name)) == group:
                    total += current_rss(int(path.name))
            except (ProcessLookupError, PermissionError):
                pass
    return total


def words(path, count):
    require(path.stat().st_size == count * 4, "binary input length")
    result = array("I")
    with path.open("rb") as stream:
        result.fromfile(stream, count)
    require(result.itemsize == 4, "u32 array platform")
    if sys.byteorder != "little":
        result.byteswap()
    return result


def load_candidate(driver):
    source = driver.args.input
    metadata = {}
    for name, expected in PINS.items():
        metadata[name] = info(source / name)
        require(metadata[name]["sha256"] == expected, name + ": candidate pin mismatch")
    mapping = words(source / "class-map.u32le", N)
    reps, sizes = words(source / "representatives.u32le", K), words(source / "class-sizes.u32le", K)
    counts, minima = array("I", [0]) * K, array("I", [N]) * K
    for old, new in enumerate(mapping):
        require(new < K, "class map bound")
        counts[new] += 1
        minima[new] = min(minima[new], old)
    require(counts == sizes and minima == reps and all(counts) and mapping[0] == 0,
            "class surjection/census/representative/entry")
    driver.emit("class-map.txt", "\n".join(map(str, mapping)) + "\n")
    lines, cells, packed_lines, packed_cells = [], [], [], []
    with (source / "quotient-rows.jsonl").open("rb") as stream:
        for index, raw in enumerate(stream):
            record = json.loads(raw)
            require(index < 2 * K and record[:2] == [index // 2, index % 2] and
                    all(type(x) is int for x in record[:2]), "quotient row order")
            row = record[2]
            if row is None:
                cells.append("---")
                packed_cells.append("0")
            else:
                require(len(row) == 3 and all(type(x) is int for x in row) and row[0] in (0, 1) and
                        row[1] in (-1, 1) and 0 <= row[2] < K, "quotient row domain")
                cells.append(str(row[0]) + ("R" if row[1] == 1 else "L") + str(row[2]))
                packed_cells.append(str(1 + 4 * row[2] + 2 * int(row[1] == 1) + row[0]))
            if index % 2:
                lines.append(" ".join(cells))
                packed_lines.append(" ".join(packed_cells))
                cells = []
                packed_cells = []
    require(len(lines) == K and not cells, "quotient complete census")
    driver.emit("quotient.rows", "\n".join(lines) + "\n")
    driver.emit("quotient-packed.rows", "\n".join(packed_lines) + "\n")
    # Independently reread the emitted numeric file and invert each code against
    # the pinned JSON, rather than comparing two views of the encoding loop.
    checked = 0
    with (ROOT / PREFIX / "quotient-packed.rows").open() as packed, \
            (source / "quotient-rows.jsonl").open() as original:
        for state, line in enumerate(packed):
            pair = line.split()
            require(state < K and len(pair) == 2, "packed state/column census")
            for bit, token in enumerate(pair):
                require(token.isascii() and token.isdecimal(), "packed natural literal")
                code = int(token)
                require(0 <= code <= 4 * K, "packed transition bound")
                if code == 0:
                    decoded = None
                else:
                    destination, flags = divmod(code - 1, 4)
                    decoded = [flags % 2, 1 if flags >= 2 else -1, destination]
                record = json.loads(next(original))
                require(record == [state, bit, decoded], "packed row differs from pinned JSON")
                checked += 1
        require(checked == 2 * K and next(original, None) is None, "packed complete row census")
    driver.summary["quotient_packing"] = {
        "encoding": "0=halt; 1+4*destination+2*direction+write; left=0,right=1",
        "maximum_code": 4 * K, "independent_inverse_rows_checked": checked,
        "source": metadata["quotient-rows.jsonl"],
        "packed": info(ROOT / PREFIX / "quotient-packed.rows"),
        "human_readable": info(ROOT / PREFIX / "quotient.rows"),
    }
    driver.summary["candidate_input"] = metadata


def select_states(driver):
    source_info = info(SNAPSHOT)
    require(source_info["sha256"] == SNAPSHOT_SHA, "accepted syntax export pin mismatch")
    data = json.loads(SNAPSHOT.read_text())
    records = data["getter_samples"]
    require(len(records) == 106668 and data["metadata"]["initial_raw"] == 1,
            "accepted source layout")
    depths = [array("I", [0]) * 106668 for _ in range(10)]
    first_tags = {}
    for node, record in enumerate(records):
        require(record[0] == node, "exhaustive getter order")
        instruction = record[1]
        tag = instruction[0]
        first_tags.setdefault(tag, node)
        if tag in (2, 3):
            for bit in (0, 1):
                for store in range(5):
                    lane = 5 * bit + store
                    value = instruction[1][lane]
                    child = instruction[2] if tag == 2 else instruction[2 if value else 3]
                    require(0 <= child < node, "decreasing pure syntax child")
                    next_lane = 5 * bit + value if tag == 2 else lane
                    depths[lane][node] = 1 + depths[next_lane][child]
    deep = heapq.nlargest(32, ((max(depths[s][n], depths[5 + s][n]), n, s)
                              for n in range(106668) for s in range(5)))
    selected, reasons = [], {}

    def add(state, reason):
        if state not in reasons:
            selected.append(state)
            reasons[state] = reason

    def encode(node, store):
        raw = 1 + 5 * node + store
        return 0 if raw == 1 else raw

    for state in (0, 1, MAIN - 1, MAIN, MAIN + 1, N - 1):
        add(state, "entry_halt_or_family_boundary")
    for tag, node in sorted(first_tags.items()):
        for store in range(5):
            add(encode(node, store), "primitive_tag_" + str(tag) + "_store_" + str(store))
    for depth, node, store in deep[:16]:
        add(encode(node, store), "deep_actual_pure_path_" + str(depth))
    require(len(selected) <= 64 and deep[0][0] > 0, "representative anchor capacity/depth")
    # Bit-reversed positions spread every prefix across both complete families.
    for i in range(8192):
        reversed_index = int(f"{i // 2:012b}"[::-1], 2)
        if i % 2:
            add(MAIN + reversed_index * (N - MAIN - 1) // 4095, "spread_return")
        else:
            add(reversed_index * (MAIN - 1) // 4095, "spread_main")
        if len(selected) >= 4096:
            break
    require(len(selected) == 4096, "representative sample count")
    details = []
    for state in selected:
        detail = {"state": state, "reason": reasons[state], "both_bits": True,
                  "family": "main" if state < MAIN else "return"}
        if state < MAIN and state != 1:
            node, store = divmod((1 if state == 0 else state) - 1, 5)
            detail.update(node=node, store=store, tag=records[node][1][0],
                          pure_depth_by_bit=[depths[store][node], depths[5 + store][node]])
        details.append(detail)
    selection = {"snapshot": source_info, "maximum_actual_pure_depth": deep[0][0],
                 "nested_sizes": [64, 512, 4096], "states": details,
                 "sampling_is_not_universal_coverage": True}
    save(driver.args.output / "selection.json", selection)
    driver.summary["selection"] = {key: value for key, value in selection.items() if key != "states"}
    return selected


LOADERS = r'''module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.Packed

meta section
namespace Chess.Optimisation.BodyCertificatePilot.Generator
open Lean Elab Term Meta Command ConjectureMachines

elab "load_body_map% " path:str : term <= expectedType? => do
  let expected ← instantiateMVars expectedType?
  unless expected.isAppOfArity ``Compilation.Balanced.RowTree 1 do
    throwError "Expected map tree"
  let elemType := expected.getAppArgs[0]!
  unless elemType.isConstOf ``Nat do throwError "Expected literal Nat map values"
  let content ← liftM (m := IO) (IO.FS.readFile path.getString)
  let mut entries : Array Expr := #[]
  for raw in content.splitOn "\n" do
    let text := raw.trimAscii.toString
    if !text.isEmpty then
      let some value := text.toNat? | throwError "Malformed map integer"
      entries := entries.push (mkNatLit value)
  TableSyntax.balancedRowsExpr elemType entries 0 entries.size

elab "load_packed_rows% " path:str : term <= expectedType? => do
  let expected ← instantiateMVars expectedType?
  unless expected.isAppOfArity ``Compilation.Balanced.RowTree 1 do
    throwError "Expected packed row tree"
  let rowType := expected.getAppArgs[0]!
  unless rowType.isAppOfArity ``Prod 2 &&
      rowType.getAppArgs[0]!.isConstOf ``Nat && rowType.getAppArgs[1]!.isConstOf ``Nat do
    throwError "Expected pairs of literal natural codes"
  let natType := Lean.mkConst ``Nat
  let pair := mkApp2 (Lean.mkConst ``Prod.mk [Level.zero, Level.zero]) natType natType
  let content ← liftM (m := IO) (IO.FS.readFile path.getString)
  let mut entries : Array Expr := #[]
  for raw in content.splitOn "\n" do
    let line := raw.trimAscii.toString
    if !line.isEmpty then
      match (line.splitOn " ").filter (fun cell ↦ !cell.isEmpty) with
      | [first, second] =>
          let some a := first.toNat? | throwError "Malformed first packed code"
          let some b := second.toNat? | throwError "Malformed second packed code"
          entries := entries.push (mkApp2 pair (mkNatLit a) (mkNatLit b))
      | _ => throwError "Expected exactly two packed natural codes"
  TableSyntax.balancedRowsExpr rowType entries 0 entries.size
end Chess.Optimisation.BodyCertificatePilot.Generator
end
run_cmd Lean.logInfo "Body certificate loaders checked"
'''


AUDIT = r'''import Lean

-- Intentionally not a `module`: importModules loads the full private proof
-- closure. A module's public environment can expose private proofs as axioms.
open Lean

private def dependencies (info : ConstantInfo) : Array Name := Id.run do
  let mut names := info.type.getUsedConstants
  if let some value := info.value? (allowOpaque := true) then
    names := names ++ value.getUsedConstants
  match info with
  | .inductInfo v => names := names ++ v.ctors.toArray ++ v.all.toArray
  | .recInfo v =>
      names := names ++ v.all.toArray
      for rule in v.rules do
        names := names.push rule.ctor ++ rule.rhs.getUsedConstants
  | _ => pure ()
  return names

def main (args : List String) : IO Unit := do
  let [moduleText, rootsPath, expectedText] := args
    | throw <| IO.userError "Expected module, roots file and exact root count"
  let some expected := expectedText.toNat?
    | throw <| IO.userError "Malformed expected root count"
  let mut roots : Array Name := #[]
  for raw in (← IO.FS.readFile rootsPath).splitOn "\n" do
    let text := raw.trimAscii.toString
    if !text.isEmpty then
      let name := text.toName
      unless (`Chess.Optimisation.BodyCertificatePilot).isPrefixOf name do
        throw <| IO.userError s!"Unexpected root namespace: {name}"
      if roots.contains name then throw <| IO.userError s!"Duplicate root: {name}"
      roots := roots.push name
  unless expected > 0 && roots.size == expected do
    throw <| IO.userError "Required root census mismatch"
  initSearchPath (← findSysroot)
  let env ← importModules #[{module := moduleText.toName}] {} 0
  let mut pending := roots
  let mut seen : NameSet := {}
  let mut axioms : NameSet := {}
  while let some name := pending.back? do
    pending := pending.pop
    if seen.contains name then continue
    seen := seen.insert name
    let some decl := env.find? name
      | throw <| IO.userError s!"Missing audited declaration: {name}"
    if decl.isUnsafe || decl.isPartial then
      throw <| IO.userError s!"Unsafe/partial dependency: {name}"
    let userName := privateToUserName name
    if (`Chess.Optimisation.BodyCertificatePilot.Generator).isPrefixOf userName ||
        (`ConjectureMachines.TableSyntax).isPrefixOf userName ||
        (`Chess.Compilation.SourceCertificate.Generator).isPrefixOf userName ||
        (`Chess.Compilation.Input.Generator).isPrefixOf userName ||
        userName == `Chess.perfect_play_results_in_draw then
      throw <| IO.userError s!"Forbidden generator/conjecture dependency: {name}"
    if decl matches .axiomInfo _ then
      unless #[`propext, `Classical.choice, `Quot.sound].contains name do
        throw <| IO.userError s!"Forbidden axiom dependency: {name}"
      axioms := axioms.insert name
    pending := pending ++ dependencies decl
  IO.println s!"Audited {roots.size} required roots and {seen.size} dependencies from {moduleText}"
  IO.println s!"Permitted axioms: {axioms.toArray.qsort Name.lt}"
  IO.println "Body full-private kernel root audit passed"
'''


def header(imports):
    return ("module\n" + "".join("public import " + item + "\n" for item in imports) +
            "\n@[expose] public section\nnamespace " + NS + "\n" +
            "open Turing ConjectureMachines ConjectureMachines.Compilation\n" +
            "set_option maxRecDepth 1000000\n" +
            "set_option Elab.async false\nset_option compiler.extract_closed false\n")


def audit_and_end(driver, stem, names, banner):
    # The successful build and its separate full-private audit share one stage
    # budget. Every explicit mathematical root is retained, not sampled.
    roots = [NS + "." + name for name in names]
    driver.audit_roots[stem] = roots
    driver.emit(stem + ".roots", "\n".join(roots) + "\n")
    return ("\nend " + NS + "\nrun_cmd Lean.logInfo " + json.dumps(banner) + "\n")


MAP_BOUNDS = r'''-- Check every raw leaf; no modulo conversion can conceal an out-of-range value.
def mapAllBelow : Balanced.RowTree Nat → Nat → Bool
  | .empty, _ => true
  | .leaf value, bound => decide (value < bound)
  | .branch _ left right, bound => mapAllBelow left bound && mapAllBelow right bound

theorem lookup_lt_of_allBelow (tree : Balanced.RowTree Nat) (bound fallback : Nat)
    (bounded : mapAllBelow tree bound = true) (fallback_lt : fallback < bound)
    (index : Nat) : tree.lookup index fallback < bound := by
  induction tree generalizing index with
  | empty => exact fallback_lt
  | leaf value =>
      have value_lt : value < bound := of_decide_eq_true bounded
      simp only [Balanced.RowTree.lookup]
      split
      · exact value_lt
      · exact fallback_lt
  | branch leftCount left right ihl ihr =>
      have both : mapAllBelow left bound = true ∧ mapAllBelow right bound = true := by
        simpa only [mapAllBelow, Bool.and_eq_true] using bounded
      simp only [Balanced.RowTree.lookup]
      split
      · apply ihl
        exact both.1
      · apply ihr
        exact both.2

theorem map_count_branch (left right : Balanced.RowTree Nat) (nl nr : Nat)
    (hl : left.count = nl) (hr : right.count = nr) :
    (Balanced.RowTree.branch nl left right).count = nl + nr :=
  congrArg₂ Nat.add hl hr

theorem map_valid_branch (left right : Balanced.RowTree Nat) (nl : Nat)
    (hc : left.count = nl) (hl : left.WellFormed) (hr : right.WellFormed) :
    (Balanced.RowTree.branch nl left right).WellFormed :=
  ⟨hc.symm, hl, hr⟩

theorem map_bounded_branch (left right : Balanced.RowTree Nat) (nl bound : Nat)
    (hl : mapAllBelow left bound = true) (hr : mapAllBelow right bound = true) :
    mapAllBelow (Balanced.RowTree.branch nl left right) bound = true :=
  Bool.and_eq_true_iff.mpr ⟨hl, hr⟩

'''

MAP_BRANCH_ROOTS = ["map_count_branch", "map_valid_branch", "map_bounded_branch"]


MAP_CHECKER = r'''def MapFacts (tree : Balanced.RowTree Nat) (size bound : Nat) : Prop :=
  tree.count = size ∧ tree.WellFormed ∧ mapAllBelow tree bound = true

def checkMap : Balanced.RowTree Nat → Nat → Option Nat
  | .empty, _ => some 0
  | .leaf value, bound => if value < bound then some 1 else none
  | .branch cached left right, bound =>
      match checkMap left bound, checkMap right bound with
      | some nl, some nr => if cached = nl then some (nl + nr) else none
      | _, _ => none

theorem checkMap_sound (tree : Balanced.RowTree Nat) (bound size : Nat)
    (checked : checkMap tree bound = some size) : MapFacts tree size bound := by
  induction tree generalizing size with
  | empty =>
    have eq : 0 = size := Option.some.inj checked
    subst size
    exact ⟨rfl, trivial, rfl⟩
  | leaf value =>
    by_cases h : value < bound
    · have eq : 1 = size := Option.some.inj (by
        simpa only [checkMap, ite_eq_left h] using checked)
      subst size
      refine ⟨rfl, trivial, ?_⟩
      simpa only [mapAllBelow, decide_eq_true_eq] using h
    · simp only [checkMap, ite_eq_right h, reduceCtorEq] at checked
  | branch cached left right ihl ihr =>
    cases hl : checkMap left bound with
    | none => simp only [checkMap, hl, reduceCtorEq] at checked
    | some nl =>
      cases hr : checkMap right bound with
      | none => simp only [checkMap, hl, hr, reduceCtorEq] at checked
      | some nr =>
        by_cases hc : cached = nl
        · have eq : nl + nr = size := Option.some.inj (by
            simpa only [checkMap, hl, hr, ite_eq_left hc] using checked)
          subst size
          obtain ⟨hcl, hvl, hbl⟩ := ihl nl hl
          obtain ⟨hcr, hvr, hbr⟩ := ihr nr hr
          exact ⟨congrArg₂ Nat.add hcl hcr,
            ⟨hc.trans hcl.symm, hvl, hvr⟩, Bool.and_eq_true_iff.mpr ⟨hbl, hbr⟩⟩
        · simp only [checkMap, hl, hr, ite_eq_right hc, reduceCtorEq] at checked

theorem map_facts_branch (left right : Balanced.RowTree Nat) (nl nr bound : Nat)
    (hl : MapFacts left nl bound) (hr : MapFacts right nr bound) :
    MapFacts (.branch nl left right) (nl + nr) bound :=
  ⟨congrArg₂ Nat.add hl.1 hr.1, ⟨hl.1.symm, hl.2.1, hr.2.1⟩,
    Bool.and_eq_true_iff.mpr ⟨hl.2.2, hr.2.2⟩⟩

'''

MAP_CHECKER_ROOTS = ["MapFacts", "checkMap", "checkMap_sound", "map_facts_branch"]


HEARTBEATS = ("set_option maxHeartbeats 0 in\n"
              "-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.\n")


PACKED = r'''def packedDirCode : Dir → Nat
  | .left => 0
  | .right => 1

def packedEncode {q : Nat} : Option (Fin 2 × Dir × Fin q) → Nat
  | none => 0
  | some (write, direction, next) =>
      (4 * next.val + 2 * packedDirCode direction + write.val) + 1

def packedDecode (q : Nat) [NeZero q] : Nat → Option (Fin 2 × Dir × Fin q)
  | 0 => none
  | payload + 1 =>
      some (Fin.ofNat 2 payload,
        if (payload / 2) % 2 = 0 then Dir.left else Dir.right,
        Fin.ofNat q (payload / 4))

theorem packed_decode_none_iff (q : Nat) [NeZero q] (code : Nat) :
    packedDecode q code = none ↔ code = 0 := by
  cases code <;> simp [packedDecode]

theorem packed_payload_lt (q payload : Nat) (bounded : payload + 1 ≤ 4 * q) :
    payload / 4 < q := by
  omega

theorem packed_destination_val (q : Nat) [NeZero q] (payload : Nat)
    (bounded : payload + 1 ≤ 4 * q) :
    (Fin.ofNat q (payload / 4)).val = payload / 4 := by
  exact Nat.mod_eq_of_lt (packed_payload_lt q payload bounded)

theorem packed_encode_decode (q : Nat) [NeZero q] (code : Nat)
    (bounded : code ≤ 4 * q) : packedEncode (packedDecode q code) = code := by
  cases code with
  | zero => rfl
  | succ payload =>
      have destination := packed_payload_lt q payload bounded
      by_cases direction : (payload / 2) % 2 = 0
      · simp only [packedDecode, ite_eq_left direction, packedEncode, packedDirCode]
        change (4 * ((payload / 4) % q) + 2 * 0 + payload % 2) + 1 = payload + 1
        rw [Nat.mod_eq_of_lt destination]
        omega
      · simp only [packedDecode, ite_eq_right direction, packedEncode, packedDirCode]
        change (4 * ((payload / 4) % q) + 2 * 1 + payload % 2) + 1 = payload + 1
        rw [Nat.mod_eq_of_lt destination]
        omega

theorem packed_decode_encode (q : Nat) [NeZero q]
    (instruction : Option (Fin 2 × Dir × Fin q)) :
    packedDecode q (packedEncode instruction) = instruction := by
  cases instruction with
  | none => rfl
  | some instruction =>
      rcases instruction with ⟨write, direction, next⟩
      let payload := 4 * next.val + 2 * packedDirCode direction + write.val
      have write_bound := write.isLt
      have direction_bound : packedDirCode direction < 2 := by
        cases direction <;> decide
      have write_value : payload % 2 = write.val := by
        dsimp only [payload]
        omega
      have direction_value : (payload / 2) % 2 = packedDirCode direction := by
        dsimp only [payload]
        omega
      have destination_value : payload / 4 = next.val := by
        dsimp only [payload]
        omega
      have write_equal : Fin.ofNat 2 payload = write := by
        apply Fin.ext
        exact write_value
      have destination_equal : Fin.ofNat q (payload / 4) = next := by
        apply Fin.ext
        change (payload / 4) % q = next.val
        rw [destination_value, Nat.mod_eq_of_lt next.isLt]
      have direction_equal :
          (if (payload / 2) % 2 = 0 then Dir.left else Dir.right) = direction := by
        rw [direction_value]
        cases direction <;> rfl
      change some (Fin.ofNat 2 payload,
        if (payload / 2) % 2 = 0 then Dir.left else Dir.right,
        Fin.ofNat q (payload / 4)) = some (write, direction, next)
      rw [write_equal, direction_equal, destination_equal]

def packedAllBounded : Balanced.RowTree (Nat × Nat) → Nat → Bool
  | .empty, _ => true
  | .leaf row, bound => decide (row.1 ≤ bound) && decide (row.2 ≤ bound)
  | .branch _ left right, bound =>
      packedAllBounded left bound && packedAllBounded right bound

theorem packed_lookup_bound (tree : Balanced.RowTree (Nat × Nat)) (bound : Nat)
    (bounded : packedAllBounded tree bound = true) (index : Nat) :
    (tree.lookup index (0, 0)).1 ≤ bound ∧ (tree.lookup index (0, 0)).2 ≤ bound := by
  induction tree generalizing index with
  | empty => exact ⟨Nat.zero_le _, Nat.zero_le _⟩
  | leaf row =>
      have both : decide (row.1 ≤ bound) = true ∧ decide (row.2 ≤ bound) = true := by
        simpa only [packedAllBounded, Bool.and_eq_true] using bounded
      simp only [Balanced.RowTree.lookup]
      split
      · exact ⟨of_decide_eq_true both.1, of_decide_eq_true both.2⟩
      · exact ⟨Nat.zero_le _, Nat.zero_le _⟩
  | branch leftCount left right ihl ihr =>
      have both : packedAllBounded left bound = true ∧
          packedAllBounded right bound = true := by
        simpa only [packedAllBounded, Bool.and_eq_true] using bounded
      simp only [Balanced.RowTree.lookup]
      split
      · apply ihl
        exact both.1
      · apply ihr
        exact both.2

def packedCodeAt {q : Nat} (tree : Balanced.RowTree (Nat × Nat))
    (state : Fin q) (bit : Fin 2) : Nat :=
  let row := tree.lookup state.val (0, 0)
  if bit.val = 0 then row.1 else row.2

def packedMachine (q : Nat) [NeZero q] (tree : Balanced.RowTree (Nat × Nat)) :
    Machine q 2 := ⟨fun state bit ↦ packedDecode q (packedCodeAt tree state bit)⟩

theorem packed_code_bound {q : Nat} (tree : Balanced.RowTree (Nat × Nat)) (bound : Nat)
    (bounded : packedAllBounded tree bound = true) (state : Fin q) (bit : Fin 2) :
    packedCodeAt tree state bit ≤ bound := by
  have both := packed_lookup_bound tree bound bounded state.val
  unfold packedCodeAt
  split
  · exact both.1
  · exact both.2

theorem packed_transition_fidelity (q : Nat) [NeZero q]
    (tree : Balanced.RowTree (Nat × Nat)) (bounded : packedAllBounded tree (4 * q) = true)
    (state : Fin q) (bit : Fin 2) :
    packedEncode ((packedMachine q tree).transition state bit) =
      packedCodeAt tree state bit :=
  packed_encode_decode q _ (packed_code_bound tree (4 * q) bounded state bit)
'''

PACKED_ROOTS = ["packed_decode_none_iff", "packed_payload_lt", "packed_destination_val",
                "packed_encode_decode", "packed_decode_encode", "packed_lookup_bound",
                "packed_code_bound", "packed_transition_fidelity"]


QUOTIENT_CHECKER = r'''def QuotientFacts
    (tree : Balanced.RowTree (Nat × Nat)) (size bound : Nat) : Prop :=
  tree.count = size ∧ tree.WellFormed ∧ packedAllBounded tree bound = true

def checkQuotient : Balanced.RowTree (Nat × Nat) → Nat → Option Nat
  | .empty, _ => some 0
  | .leaf value, bound =>
      if value.1 ≤ bound ∧ value.2 ≤ bound then some 1 else none
  | .branch cached left right, bound =>
      match checkQuotient left bound, checkQuotient right bound with
      | some nl, some nr => if cached = nl then some (nl + nr) else none
      | _, _ => none

theorem checkQuotient_sound (tree : Balanced.RowTree (Nat × Nat)) (bound size : Nat)
    (checked : checkQuotient tree bound = some size) : QuotientFacts tree size bound := by
  induction tree generalizing size with
  | empty =>
    have eq : 0 = size := Option.some.inj checked
    subst size
    exact ⟨rfl, trivial, rfl⟩
  | leaf value =>
    by_cases h : value.1 ≤ bound ∧ value.2 ≤ bound
    · have eq : 1 = size := Option.some.inj (by
        simpa only [checkQuotient, ite_eq_left h] using checked)
      subst size
      refine ⟨rfl, trivial, ?_⟩
      simpa only [packedAllBounded, Bool.and_eq_true_iff, decide_eq_true_eq] using h
    · simp only [checkQuotient, ite_eq_right h, reduceCtorEq] at checked
  | branch cached left right ihl ihr =>
    cases hl : checkQuotient left bound with
    | none => simp only [checkQuotient, hl, reduceCtorEq] at checked
    | some nl =>
      cases hr : checkQuotient right bound with
      | none => simp only [checkQuotient, hl, hr, reduceCtorEq] at checked
      | some nr =>
        by_cases hc : cached = nl
        · have eq : nl + nr = size := Option.some.inj (by
            simpa only [checkQuotient, hl, hr, ite_eq_left hc] using checked)
          subst size
          obtain ⟨hcl, hvl, hbl⟩ := ihl nl hl
          obtain ⟨hcr, hvr, hbr⟩ := ihr nr hr
          exact ⟨congrArg₂ Nat.add hcl hcr,
            ⟨hc.trans hcl.symm, hvl, hvr⟩, Bool.and_eq_true_iff.mpr ⟨hbl, hbr⟩⟩
        · simp only [checkQuotient, hl, hr, ite_eq_right hc, reduceCtorEq] at checked

theorem quotient_facts_branch (left right : Balanced.RowTree (Nat × Nat)) (nl nr bound : Nat)
    (hl : QuotientFacts left nl bound) (hr : QuotientFacts right nr bound) :
    QuotientFacts (.branch nl left right) (nl + nr) bound :=
  ⟨congrArg₂ Nat.add hl.1 hr.1, ⟨hl.1.symm, hl.2.1, hr.2.1⟩,
    Bool.and_eq_true_iff.mpr ⟨hl.2.2, hr.2.2⟩⟩

'''

QUOTIENT_CHECKER_ROOTS = ["QuotientFacts", "checkQuotient", "checkQuotient_sound",
                          "quotient_facts_branch"]


def map_declarations(driver, stem, rows_name, states, bound, chunk_limit):
    """Name exact midpoint subtrees so later proofs can compose checked children.

    The map remains a noncomputable proof witness. Every raw leaf is retained;
    no projection of a giant tree or global tree-equality proof is introduced.
    """
    source_path = ROOT / PREFIX / rows_name
    source_bytes = source_path.read_bytes()
    lines = source_bytes.decode("utf-8").splitlines(keepends=True)
    require(states > 0 and len(lines) == states and 1 <= chunk_limit <= MAP_CHUNK_STATES,
            "map chunk input census or limit")
    require(all(line.endswith("\n") for line in lines), "map chunk line termination")
    declarations, chunks, nodes = [], [], []

    def subtree(start, length):
        node = {"start": start, "states": length}
        if length <= chunk_limit:
            name = f"{stem}Chunk_{start:06d}"
            filename = f"{stem}-chunks/{start:06d}-{length:04d}.map"
            driver.emit(filename, "".join(lines[start:start + length]))
            chunks.append({"definition": NS + "." + name, "start": start, "states": length,
                           "path": str(PREFIX / filename), "info": info(ROOT / PREFIX / filename)})
            declarations.append(HEARTBEATS + f"noncomputable def {name} :\n" +
                                "    Balanced.RowTree Nat :=\n" +
                                f'  load_body_map%\n    "{PREFIX}/{filename}"\n')
            node.update(name=name, kind="chunk")
        else:
            # Exactly balancedRowsExpr's midpoint, including every odd length.
            left_count = length // 2
            left = subtree(start, left_count)
            right = subtree(start + left_count, length - left_count)
            name = f"{stem}Node_{start:06d}_{length:06d}"
            declarations.append(HEARTBEATS + f"noncomputable def {name} :\n" +
                                "    Balanced.RowTree Nat :=\n" +
                                f"  .branch {left_count}\n    {left}\n    {right}\n")
            node.update(name=name, kind="branch", left=left, right=right,
                        left_count=left_count, right_count=length - left_count)
        nodes.append(node)
        return name

    root = subtree(0, states)
    next_start = 0
    for chunk in chunks:
        require(chunk["start"] == next_start and 0 < chunk["states"] <= chunk_limit,
                "map chunk interval gap, overlap or bound")
        next_start += chunk["states"]
    concatenated = b"".join((ROOT / chunk["path"]).read_bytes() for chunk in chunks)
    require(next_start == states and concatenated == source_bytes,
            "map chunk concatenation differs from complete source")
    manifest = {"source": {"path": str(PREFIX / rows_name), "info": info(source_path)},
                "states": states, "raw_value_bound": bound, "representation": "literal_nat",
                "chunk_limit_states": chunk_limit, "chunk_count": len(chunks),
                "node_count": len(nodes), "root_definition": NS + "." + root,
                "split_rule": "left_count = floor(subtree_state_count / 2)",
                "exact_concatenation_checked": True,
                "concatenated_sha256": hashlib.sha256(concatenated).hexdigest(),
                "chunks": chunks, "postorder_nodes": nodes}
    manifest_name = stem + "-chunks.json"
    driver.emit(manifest_name, json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    driver.summary.setdefault("map_layouts", {})[stem] = {
        key: value for key, value in manifest.items() if key not in ("chunks", "postorder_nodes")}
    driver.summary["map_layouts"][stem]["manifest"] = info(ROOT / PREFIX / manifest_name)
    declarations.append(HEARTBEATS + f"noncomputable def {stem}Tree :\n" +
                        f"    Balanced.RowTree Nat :=\n  {root}\n")
    return "".join(declarations), nodes


def progress_marker(kind, chunks, progress_path):
    if progress_path is None:
        return ""
    path = json.dumps(str(progress_path.relative_to(ROOT)))
    return ("run_cmd do\n" +
            "  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO\n" +
            "  Lean.Elab.Command.liftIO <| IO.FS.withFile\n" +
            f"    {path} .append fun handle ↦ do\n" +
            f'      handle.putStrLn s!"{kind}\\t{chunks}\\t{{now}}"\n' +
            "      handle.flush\n")


def map_proofs(nodes, tree_name, kind, bound, root_theorem, progress_path=None):
    """Only chunk leaves normalize; every internal proof names child theorems."""
    require(kind in ("count", "valid", "bounded") and nodes, "map proof kind or empty nodes")

    def proposition(name, states):
        if kind == "count":
            return f"{name}.count = {states}"
        if kind == "valid":
            return f"{name}.WellFormed"
        return f"mapAllBelow {name} {bound} = true"

    def marker(chunks):
        return progress_marker(kind, chunks, progress_path)

    proofs, chunks = [marker(0)], 0
    for node in nodes:
        name = node["name"]
        declaration = HEARTBEATS + f"theorem {name}_{kind} :\n"
        declaration += "    " + proposition(name, node["states"]) + " :=\n"
        if node["kind"] == "chunk":
            declaration += "  by decide +kernel\n"
        else:
            left, right = node["left"], node["right"]
            nl, nr = node["left_count"], node["right_count"]
            declaration += f"  map_{kind}_branch\n    {left}\n    {right}\n"
            if kind == "count":
                declaration += f"    {nl} {nr}\n    {left}_count\n    {right}_count\n"
            elif kind == "valid":
                declaration += f"    {nl}\n    {left}_count\n    {left}_valid\n    {right}_valid\n"
            else:
                declaration += f"    {nl} {bound}\n    {left}_bounded\n    {right}_bounded\n"
        proofs.append(declaration)
        if node["kind"] == "chunk":
            chunks += 1
            if chunks % 32 == 0:
                proofs.append(marker(chunks))
    root = nodes[-1]
    proofs.append(HEARTBEATS + f"theorem {root_theorem} :\n    " +
                  proposition(tree_name, root["states"]) + f" :=\n  {root['name']}_{kind}\n")
    proofs.append(marker(chunks))
    return "".join(proofs)


def map_facts_proofs(nodes, tree_name, bound, root_theorem, progress_path=None, family="map"):
    """One linear chunk check recovers all three unchanged map invariants."""
    require(nodes, "empty facts nodes")
    require(family in ("map", "quotient"), "invalid facts family")
    predicate = "MapFacts" if family == "map" else "QuotientFacts"
    checker = "checkMap_sound" if family == "map" else "checkQuotient_sound"
    proofs, chunks = [progress_marker("facts", 0, progress_path)], 0
    for node in nodes:
        name, size = node["name"], node["states"]
        declaration = HEARTBEATS + f"theorem {name}_facts :\n"
        declaration += f"    {predicate} {name} {size} {bound} :=\n"
        if node["kind"] == "chunk":
            declaration += f"  {checker} {name} {bound} {size} (by decide +kernel)\n"
        else:
            left, right = node["left"], node["right"]
            nl, nr = node["left_count"], node["right_count"]
            declaration += f"  {family}_facts_branch\n    {left}\n    {right}\n"
            declaration += f"    {nl} {nr} {bound}\n    {left}_facts\n    {right}_facts\n"
        proofs.append(declaration)
        if node["kind"] == "chunk":
            chunks += 1
            if chunks % 32 == 0:
                proofs.append(progress_marker("facts", chunks, progress_path))
    proofs.append(HEARTBEATS + f"theorem {root_theorem} :\n" +
                  f"    {predicate} {tree_name} {nodes[-1]['states']} {bound} :=\n" +
                  f"  {nodes[-1]['name']}_facts\n")
    proofs.append(progress_marker("facts", chunks, progress_path))
    return "".join(proofs)


def quotient_declarations(driver, stem, rows_name, states, state_bound, chunk_limit):
    """Preserve the loader's midpoint tree while bounding each executable definition.

    Global destination bounds are never replaced by a chunk's row count. Kernel
    transparency is unchanged: noinline affects only native compiler sharing.
    """
    source_path = ROOT / PREFIX / rows_name
    source_bytes = source_path.read_bytes()
    lines = source_bytes.decode("utf-8").splitlines(keepends=True)
    require(states > 0 and len(lines) == states and 1 <= chunk_limit <= QUOTIENT_CHUNK_STATES,
            "quotient chunk input census or limit")
    require(all(line.endswith("\n") for line in lines), "quotient chunk line termination")
    row_tree = "Balanced.RowTree (Nat × Nat)"
    declarations, chunks, nodes = [], [], []

    def subtree(start, length):
        node = {"start": start, "states": length}
        if length <= chunk_limit:
            name = f"{stem}Chunk_{start:06d}"
            filename = f"{stem}-chunks/{start:06d}-{length:04d}.rows"
            driver.emit(filename, "".join(lines[start:start + length]))
            chunks.append({"definition": NS + "." + name, "start": start, "states": length,
                           "binary_rows": 2 * length, "path": str(PREFIX / filename),
                           "info": info(ROOT / PREFIX / filename)})
            declarations.append(HEARTBEATS + f"@[noinline] def {name} :\n    {row_tree} :=\n" +
                                f'  load_packed_rows%\n    "{PREFIX}/{filename}"\n')
            node.update(name=name, kind="chunk")
        else:
            # This is exactly balancedRowsExpr's split, including odd lengths.
            left_count = length // 2
            left = subtree(start, left_count)
            right = subtree(start + left_count, length - left_count)
            name = f"{stem}Node_{start:06d}_{length:06d}"
            declarations.append(HEARTBEATS + f"@[noinline] def {name} :\n    {row_tree} :=\n" +
                                f"  .branch {left_count}\n    {left}\n    {right}\n")
            node.update(name=name, kind="branch", left=left, right=right,
                        left_count=left_count, right_count=length-left_count)
        nodes.append(node)
        return name

    assembled = subtree(0, states)
    # Independently reread every emitted shard in recorded order: exact byte
    # equality binds all rows, symbols and global destinations, without sampling.
    next_start = 0
    for chunk in chunks:
        require(chunk["start"] == next_start and 0 < chunk["states"] <= chunk_limit,
                "quotient chunk interval gap, overlap or bound")
        next_start += chunk["states"]
    concatenated = b"".join((ROOT / chunk["path"]).read_bytes() for chunk in chunks)
    require(next_start == states and concatenated == source_bytes,
            "quotient chunk concatenation differs from complete source")
    manifest = {"source": {"path": str(PREFIX / rows_name), "info": info(source_path)},
                "states": states, "binary_rows": 2 * states, "destination_bound": state_bound,
                "representation": "packed_nat_pairs", "maximum_code": 4 * state_bound,
                "chunk_limit_states": chunk_limit, "chunk_count": len(chunks),
                "split_rule": "left_count = floor(subtree_state_count / 2)",
                "exact_concatenation_checked": True,
                "concatenated_sha256": hashlib.sha256(concatenated).hexdigest(), "chunks": chunks,
                "postorder_nodes": nodes}
    manifest_name = stem + "-chunks.json"
    driver.emit(manifest_name, json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    driver.summary.setdefault("quotient_layouts", {})[stem] = {
        key: value for key, value in manifest.items() if key not in ("chunks", "postorder_nodes")}
    driver.summary["quotient_layouts"][stem]["manifest"] = info(ROOT / PREFIX / manifest_name)
    declarations.append(HEARTBEATS + f"@[noinline] def {stem}Tree :\n    {row_tree} :=\n  " +
                        assembled.replace("\n", "\n  ") + "\n")
    return "".join(declarations), nodes


def generate_smoke(driver):
    # Reuse the production loaders, generic proof and scoped-option prefix.
    # These small literals check templates only and count as no actual-body rows.
    driver.emit("smoke-map.txt", "0\n1\n0\n1\n")
    driver.emit("smoke-quotient.rows", "0R1 ---\n--- 1L0\n")
    driver.emit("smoke-packed.rows", "7 0\n0 2\n")
    smoke = header([MODULE + ".Loaders", "Cryptids.Chess.Optimisation.FieldSelective",
                    "Cryptids.Compilation.LocalCertificate"]) + MAP_BOUNDS + MAP_CHECKER
    # Force four leaf chunks and three named internal nodes through the exact
    # production map/proof helpers; these are still zero actual-body rows.
    map_source, map_nodes = map_declarations(driver, "smokeMap", "smoke-map.txt", 4, 2, 1)
    smoke += map_source
    for kind in ("count", "valid", "bounded"):
        progress = driver.args.output / "smoke-map-valid-progress.tsv" if kind == "valid" else None
        smoke += map_proofs(map_nodes, "smokeMapTree", kind, 2, "smoke_map_" + kind, progress)
    smoke += map_facts_proofs(map_nodes, "smokeMapTree", 2, "smoke_map_facts",
                              driver.args.output / "smoke-map-facts-progress.tsv")
    # Force two separate executable chunks even for this two-state table.
    quotient_source, quotient_nodes = quotient_declarations(
        driver, "smokeQuotient", "smoke-packed.rows", 2, 2, 1)
    smoke += quotient_source
    smoke += map_facts_proofs(quotient_nodes, "smokeQuotientTree", 8, "smoke_quotient_facts",
                              family="quotient")
    for name, proposition in (
            ("smoke_quotient_count", "smokeQuotientTree.count = 2"),
            ("smoke_quotient_valid", "smokeQuotientTree.WellFormed"),
            ("smoke_quotient_bounded", "packedAllBounded smokeQuotientTree 8 = true")):
        smoke += HEARTBEATS + f"theorem {name} : {proposition} := by decide +kernel\n"
    smoke += '''theorem smoke_lookup_lt (index : Nat) : smokeMapTree.lookup index 0 < 2 :=
  lookup_lt_of_allBelow smokeMapTree 2 0 smoke_map_bounded (by decide) index
noncomputable def smokeClassMap (s : Fin 4) : Fin 2 := Fin.ofNat 2 (smokeMapTree.lookup s.val 0)
theorem smokeClassMap_val (s : Fin 4) :
    (smokeClassMap s).val = smokeMapTree.lookup s.val 0 := by
  change (smokeMapTree.lookup s.val 0) % 2 = smokeMapTree.lookup s.val 0
  exact Nat.mod_eq_of_lt (smoke_lookup_lt s.val)
def smokeQuotient : Machine 2 2 := packedMachine 2 smokeQuotientTree
theorem smoke_quotient_fidelity (state : Fin 2) (bit : Fin 2) :
    packedEncode (smokeQuotient.transition state bit) =
      packedCodeAt smokeQuotientTree state bit :=
  packed_transition_fidelity 2 smokeQuotientTree smoke_quotient_bounded state bit
'''
    smoke += HEARTBEATS + "theorem smoke_entry : smokeClassMap 0 = 0 := by decide +kernel\n"
    smoke += HEARTBEATS + '''theorem smoke_row :
    smokeQuotient.transition (smokeClassMap 0) 0 = some (0, Dir.right, 1) ∧
    smokeQuotient.transition (smokeClassMap 1) 1 = some (1, Dir.left, 0) := by decide +kernel
'''
    smoke += HEARTBEATS + '''theorem smoke_codec_boundaries :
    packedDecode 2 0 = none ∧
    packedDecode 2 1 = some (0, Dir.left, 0) ∧
    packedDecode 2 8 = some (1, Dir.right, 1) ∧
    packedAllBounded (.leaf (8, 0)) 8 = true ∧
    packedAllBounded (.leaf (9, 0)) 8 = false := by decide +kernel
'''
    smoke += HEARTBEATS + '''theorem smoke_map_controls :
    mapAllBelow (.leaf 2) 2 = false ∧
    ¬ (Balanced.RowTree.branch 2 (.leaf (0 : Nat)) (.leaf 1)).WellFormed :=
  by decide +kernel
'''
    smoke += HEARTBEATS + '''theorem smoke_map_checker_controls :
    checkMap .empty 0 = some 0 ∧
    checkMap (.leaf 0) 1 = some 1 ∧
    checkMap (.leaf 1) 1 = none ∧
    checkMap (.branch 2 (.leaf 0) (.leaf 0)) 1 = none ∧
    checkMap (.branch 1 (.leaf 0) (.leaf 0)) 1 = some 2 := by decide +kernel
'''
    smoke += HEARTBEATS + '''theorem smoke_quotient_checker_controls :
    checkQuotient .empty 0 = some 0 ∧
    checkQuotient (.leaf (8, 0)) 8 = some 1 ∧
    checkQuotient (.leaf (9, 0)) 8 = none ∧
    checkQuotient (.leaf (0, 9)) 8 = none ∧
    checkQuotient (.branch 2 (.leaf (0, 0)) (.leaf (0, 0))) 8 = none := by decide +kernel
'''
    roots = ["smoke_map_count", "smoke_map_valid", "smoke_map_bounded", "smoke_lookup_lt",
             "smokeClassMap_val", "smoke_quotient_count", "smoke_quotient_valid",
             "smoke_quotient_bounded", "smoke_quotient_fidelity", "smoke_codec_boundaries",
             "smoke_entry", "smoke_row", "smoke_map_controls", "smoke_map_facts",
             "smoke_map_checker_controls", "smoke_quotient_facts",
             "smoke_quotient_checker_controls"] + PACKED_ROOTS + MAP_BRANCH_ROOTS + \
            MAP_CHECKER_ROOTS + QUOTIENT_CHECKER_ROOTS
    driver.emit("TemplateSmoke.lean", smoke + audit_and_end(
        driver, "TemplateSmoke", roots, "Body certificate template smoke checked"))


def generate_setup(driver):
    driver.emit("Packed.lean", header(["Cryptids.Compilation.BalancedTable"]) +
                PACKED + QUOTIENT_CHECKER +
                "\nend " + NS + "\n")
    driver.emit("Loaders.lean", LOADERS)
    driver.emit("Audit.lean", AUDIT)
    generate_smoke(driver)
    import diagnostics_pilot
    driver.summary["diagnostics_generator_source"] = info(Path(diagnostics_pilot.__file__))
    diagnostics_pilot.generate(driver, header, audit_and_end, MODULE)
    import symbolic_transition_pilot
    driver.summary["symbolic_generator_source"] = info(Path(symbolic_transition_pilot.__file__))
    symbolic_transition_pilot.generate(driver, header, audit_and_end, MODULE)
    import operation_weights_pilot
    driver.summary["operation_weight_generator_source"] = info(Path(operation_weights_pilot.__file__))
    operation_weights_pilot.generate(driver, header, audit_and_end)
    import weight_table_pilot
    driver.summary["weight_generator_source"] = info(Path(weight_table_pilot.__file__))
    weight_table_pilot.generate(driver, SNAPSHOT, SNAPSHOT_SHA, header, audit_and_end,
                                progress_marker)
    tools = header(["Cryptids.Chess.Optimisation.FieldSelective"])
    tools += r'''open ConjectureMachines.Optimisation
open Chess.Optimisation FieldCompiler

theorem post_live (pc : Fin 106668) (value : Fin 5) (bit : Bool) :
    FieldPacked.post (CompactPost.encode FieldPacked.getter (some pc, value)) bit =
      let result := LazyGraph.trAux FieldPacked.getter bit pc value
      some (CompactPost.encode FieldPacked.getter result.1, result.2) := by
  simp only [FieldPacked.post, CompactPost.machine, CompactPost.decode_encode,
    Option.map_some]

theorem getter_local (q : Fin 4042) (i : Fin (FieldPacked.syntaxRows.get q).size) :
    FieldPacked.getter.node (FieldSelectiveLayout.nodeIndex q i) =
      TemplateGraph.mapNode (FieldSelectiveLayout.nodeIndex q)
        ((FieldPacked.syntaxRows.get q).fastNodeAt i) := by
  have rename : FieldSelectiveLayout.nodeIndex q =
      FieldPacking.graphIndex FieldPacked.syntaxRows FieldPacked.layout q := by rfl
  rw [rename]
  simpa only [FieldPacked.getter, FieldPacking.graph_node, Syntax.fastNodeAt_eq] using
    FieldPacking.graphNode_index FieldPacked.syntaxRows FieldPacked.layout q i

theorem initial_entry : FieldPacked.getter.entry 0 = 0 := by
  apply Fin.ext
  change (FieldPackedLayout.layout.code
    ⟨0, (FieldAware.syntaxRows.get 0).root⟩).val = 0
  rw [FieldPackedLayout.code_val, FieldPackedLayout.offset_zero, Nat.zero_add,
    Syntax.root_val, FieldAware.syntaxRows_get]
  rfl

theorem permutation_numeric : CompactPost.permutation FieldPacked.getter =
    Equiv.swap (0 : Fin 533341) 1 := by
  simp only [CompactPost.permutation, initial_entry]
  rfl
'''
    driver.emit("RowTools.lean", tools + audit_and_end(
        driver, "RowTools", ["post_live", "getter_local", "initial_entry",
                             "permutation_numeric"], "Structural body row helpers checked"))
    import row_witness_pilot
    driver.summary["row_witness_generator_source"] = info(Path(row_witness_pilot.__file__))
    row_witness_pilot.generate(driver, SNAPSHOT, SNAPSHOT_SHA, header, audit_and_end,
                               progress_marker, MODULE)
    import actual_row_pilot
    driver.summary["actual_row_generator_source"] = info(Path(actual_row_pilot.__file__))
    actual_row_pilot.generate_tools(driver, header, audit_and_end, MODULE)


def generate(driver, selected):
    # Source text is generated only after the import-time remote guard.
    generate_setup(driver)
    map_source, map_nodes = map_declarations(driver, "map", "class-map.txt", N, K, MAP_CHUNK_STATES)
    driver.emit("MapData.lean", header([MODULE + ".Loaders"]) +
                map_source +
                audit_and_end(driver, "MapData", ["mapTree"], "Complete body class map loaded"))
    quotient_source, quotient_nodes = quotient_declarations(
        driver, "quotient", "quotient-packed.rows", K, K, QUOTIENT_CHUNK_STATES)
    driver.emit("QuotientData.lean", header([MODULE + ".Loaders"]) + quotient_source +
                audit_and_end(driver, "QuotientData", ["quotientTree"], "Complete body quotient rows loaded"))
    map_prelude = header([MODULE + ".MapData"]) + MAP_BOUNDS + MAP_CHECKER
    map_prelude += f'''noncomputable def classMap (s : Fin {N}) : Fin {K} :=
  Fin.ofNat {K} (mapTree.lookup s.val 0)
'''
    driver.emit("MapPrelude.lean", map_prelude + audit_and_end(
        driver, "MapPrelude", ["mapAllBelow", "lookup_lt_of_allBelow", "classMap"] +
        MAP_BRANCH_ROOTS + MAP_CHECKER_ROOTS,
        "Body class map prelude checked"))
    # Each original root projects from the complete combined facts. Count/cache/
    # range are checked together once, and all original stage audits remain.
    for stem, kind, banner in (
            ("MapCount", "count",
             "Complete body class map count checked"),
            ("MapValid", "valid",
             "Complete body class map caches checked"),
            ("MapBounded", "bounded",
             "Complete body class map range checked")):
        imports = [MODULE + (".MapPrelude" if kind == "count" else ".MapCount")]
        name = "map_" + kind
        source, roots = header(imports), [name]
        if kind == "count":
            source += map_facts_proofs(map_nodes, "mapTree", K, "map_facts",
                                       driver.args.output / "map-facts-progress.tsv")
            source += f"theorem map_count : mapTree.count = {N} := map_facts.1\n"
            roots.append("map_facts")
        elif kind == "valid":
            source += "theorem map_valid : mapTree.WellFormed := map_facts.2.1\n"
        else:
            source += f"theorem map_bounded : mapAllBelow mapTree {K} = true := map_facts.2.2\n"
        driver.emit(stem + ".lean", source + audit_and_end(driver, stem, roots, banner))
    map_checks = header([MODULE + ".MapCount", MODULE + ".MapValid", MODULE + ".MapBounded"])
    map_checks += f'''theorem map_lookup_lt (index : Nat) : mapTree.lookup index 0 < {K} :=
  lookup_lt_of_allBelow mapTree {K} 0 map_bounded (by decide) index
theorem classMap_val (s : Fin {N}) : (classMap s).val = mapTree.lookup s.val 0 := by
  change (mapTree.lookup s.val 0) % {K} = mapTree.lookup s.val 0
  exact Nat.mod_eq_of_lt (map_lookup_lt s.val)
{HEARTBEATS}theorem entry : classMap 0 = 0 := by decide +kernel
'''
    map_roots = ["map_count", "map_valid", "map_bounded", "map_lookup_lt", "classMap_val", "entry"]
    driver.emit("MapChecks.lean", map_checks + audit_and_end(
        driver, "MapChecks", map_roots, "Complete body class map checks passed"))
    # The dependency on MapChecks serializes the two large facts builds. It
    # prevents Lake from checking both large literal families concurrently.
    quotient_checks = header([MODULE + ".QuotientData", MODULE + ".MapChecks"])
    quotient_checks += map_facts_proofs(quotient_nodes, "quotientTree", 4 * K, "quotient_facts",
                                        driver.args.output / "quotient-facts-progress.tsv",
                                        family="quotient")
    quotient_checks += f'''def quotient : Machine {K} 2 := packedMachine {K} quotientTree
theorem quotient_count : quotientTree.count = {K} := quotient_facts.1
theorem quotient_valid : quotientTree.WellFormed := quotient_facts.2.1
{HEARTBEATS}theorem quotient_bounded :
    packedAllBounded quotientTree (4 * {K}) = true := quotient_facts.2.2
theorem quotient_code_bound (state : Fin {K}) (bit : Fin 2) :
    packedCodeAt quotientTree state bit ≤ 4 * {K} :=
  packed_code_bound quotientTree (4 * {K}) quotient_bounded state bit
theorem quotient_fidelity (state : Fin {K}) (bit : Fin 2) :
    packedEncode (quotient.transition state bit) = packedCodeAt quotientTree state bit :=
  packed_transition_fidelity {K} quotientTree quotient_bounded state bit
'''
    quotient_roots = ["quotient_count", "quotient_valid", "quotient_bounded", "quotient_code_bound",
                      "quotient_fidelity"] + PACKED_ROOTS
    driver.emit("QuotientChecks.lean", quotient_checks + audit_and_end(
        driver, "QuotientChecks", quotient_roots + ["quotient_facts"],
        "Complete packed quotient checks passed"))
    # The assembly has no chess import and repeats no large kernel reduction.
    # Its full-private audit deliberately rechecks the complete combined roots.
    driver.emit("Data.lean", header([MODULE + ".MapChecks", MODULE + ".QuotientChecks"]) +
                audit_and_end(driver, "Data", map_roots + quotient_roots,
                              "Complete body certificate data assembled"))
    relation = header([MODULE + ".Data", "Cryptids.Chess.Optimisation.FieldSelective",
                       "Cryptids.Compilation.LocalCertificate"])
    relation += f'''def RowAt (s : Fin {N}) (b : Fin 2) : Prop :=
  (Chess.Optimisation.FieldSelective.body.toMachine.transition s b).map
    (fun (write, dir, next) ↦ (write, dir, classMap next)) =
  quotient.transition (classMap s) b
'''
    driver.emit("BodyRelation.lean", relation + audit_and_end(
        driver, "BodyRelation", ["RowAt"], "Actual body row predicate checked"))
    # Generate each structural sample only after the preceding stage passes.
    # This avoids paying for4096state witnesses before measuring64states.
    negative = f'''module
public import {MODULE}.Rows64
public meta import Lean

public meta section
open Lean Elab Term Meta Command Turing ConjectureMachines
set_option Elab.async false
-- Deliberately false: the accepted entry's symbol-zero row is defined.
-- A checked actual-row theorem with an explicit some RHS cannot prove none.
elab "submit_false_body_row" : command => do
  liftTermElabM do
    let lhs ← elabTerm (← `(term|
      Chess.Optimisation.FieldSelective.body.toMachine.transition
        (0 : Fin {N}) (0 : Fin 2))) none
    let rhs ← elabTerm (← `(term| (none : Option (Fin 2 × Dir × Fin {N})))) none
    synthesizeSyntheticMVarsNoPostponing
    let proposition ← instantiateMVars (← mkEq lhs rhs)
    let falseProof :=
      Lean.mkConst `{NS}.Sample64.actual_0_0
    Lean.addDecl (.thmDecl {{
      name := `{NS}.deliberately_false_row
      levelParams := []
      type := proposition
      value := falseProof
    }}) true
submit_false_body_row
'''
    driver.emit("Negative.lean", negative)
    driver.checkpoint()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", type=Path, default=INPUT)
    parser.add_argument("--output", type=Path, default=ROOT / ".lake/chess-body-certificate-20261022")
    parser.add_argument("--lakefile", type=Path, default=ROOT / "lakefile.chess-body-certificate-20261022.toml")
    parser.add_argument("--seconds", type=int, default=1200)
    parser.add_argument("--memory-gib", type=int, default=6)
    parser.add_argument("--smoke-only", action="store_true",
                        help="Stop after compiled auditor and complete packed-codec template smoke audit")
    parser.add_argument("--source-tables-only", action="store_true",
                        help="Check finite source-operation reconstruction and format fixtures only")
    args = parser.parse_args()
    require(sys.platform == "linux" and 10 <= args.seconds <= 1200 and 2 <= args.memory_gib <= 6,
            "Linux and bounded resource settings required")
    require(not (args.smoke_only and args.source_tables_only), "Choose one bounded pilot scope")
    args.output.mkdir(parents=True, exist_ok=True)
    require(args.lakefile.is_file(), "root-owned lakefile missing")
    driver = Driver(args)
    try:
        if args.source_tables_only:
            driver.summary.update(classification="FINITE_SOURCE_OPERATION_TABLE_PILOT",
                                  complete_opcode_snapshot_checked=False,
                                  graph_fidelity_checked=False)
            driver.emit("Audit.lean", AUDIT)
            import source_table_pilot
            driver.summary["source_table_generator_source"] = info(Path(source_table_pilot.__file__))
            source_table_pilot.generate(driver, header, audit_and_end, MODULE)
            driver.run("Audit", 120, "Build completed successfully", audit_build=True)
            driver.run("SourceTables", 60,
                       "Finite source-operation table reconstruction checked")
            driver.summary["finite_source_reconstruction_checked"] = True
            driver.summary["source_format_fixtures_checked"] = True
            driver.summary["actual_frozen_source_operations_checked"] = 2
            driver.checkpoint()
            import source_chunk_pilot
            driver.summary["source_chunk_generator_source"] = info(Path(source_chunk_pilot.__file__))
            source_chunk_pilot.generate_proposer(driver, header, MODULE, NS)
            driver.run("SourceTableProposal", 60, "Untrusted finite source operations exported")
            source_chunk_pilot.generate_chunk(driver, header, audit_and_end, MODULE)
            driver.run("SourceChunk", 60,
                       "Actual frozen source chunk reconstructed and corruption rejected")
            driver.summary["source_chunk_proposed"]["kernel_checked"] = True
            driver.checkpoint()
            import source_complete_pilot
            driver.summary["complete_source_generator_source"] = info(
                Path(source_complete_pilot.__file__))
            source_complete_pilot.generate(driver, header, audit_and_end, progress_marker, MODULE)
            driver.run("CompleteSource", 60,
                       "All frozen source-operation tables reconstructed exactly")
            driver.summary["complete_source_proposed"]["kernel_checked"] = True
            driver.summary["complete_opcode_snapshot_checked"] = True
            driver.summary["actual_frozen_source_operations_checked"] = 4042
            driver.summary["status"] = "source_tables_passed"
            driver.checkpoint()
            driver.monitor_stop.set()
            signal.setitimer(signal.ITIMER_REAL, 0)
            print("Finite source table pilot passed", flush=True)
            return 0
        if args.smoke_only:
            generate_setup(driver)
        else:
            load_candidate(driver)
            selected = select_states(driver)
            generate(driver, selected)
        driver.run("Audit", 120, "Build completed successfully", audit_build=True)
        driver.run("Loaders", 60, "Body certificate loaders checked")
        driver.run("TemplateSmoke", 60, "Body certificate template smoke checked")
        driver.summary["template_smoke_checked"] = True
        driver.run("DiagnosticsSmoke", 60, "Diagnostic command capture smoke checked")
        require("Chess command diagnostics probe" in
                (driver.args.output / "command-diagnostics.log").read_text(),
                "durable command diagnostic observer did not capture its probe")
        driver.run("RowTools", 60, "Structural body row helpers checked")
        driver.run("OperationWeights", 60, "Universal frozen operation weight summaries checked")
        driver.run("WeightTables", 60,
                   "Complete source weights and shared prefix correspondence checked")
        driver.run("RowWitnesses", 60, "Actual local syntax and far-end address witnesses checked")
        driver.run("ActualTools", 60, "Structural main and return row transport helpers checked")
        driver.run("SymbolicTransitions", 60, "Symbolic actual main-write interface checked")
        if args.smoke_only:
            driver.summary["status"] = "smoke_passed"
            driver.checkpoint()
            driver.monitor_stop.set()
            signal.setitimer(signal.ITIMER_REAL, 0)
            print("Body certificate compiled-audit smoke passed", flush=True)
            return 0
        driver.run("MapData", 240, "Complete body class map loaded")
        driver.run("QuotientData", 180, "Complete body quotient rows loaded")
        driver.run_data_group()
        import actual_row_pilot
        actual_row_pilot.generate_rows(driver, [0], SNAPSHOT, SNAPSHOT_SHA,
                                       header, audit_and_end, progress_marker, MODULE)
        driver.run("Rows1", 60, "Body kernel rows checked: 1 states, 2 rows")
        driver.summary["symbolic_entry_pilot_checked"] = True
        driver.checkpoint()
        for count, seconds in ((64, 120), (512, 180), (4096, 210)):
            import actual_row_pilot
            driver.stage = f"Rows{count}Generation"
            driver.checkpoint()
            actual_row_pilot.generate_rows(driver, selected[:count], SNAPSHOT, SNAPSHOT_SHA,
                                           header, audit_and_end, progress_marker, MODULE)
            driver.run("Rows" + str(count), seconds,
                       f"Body kernel rows checked: {count} states, {2 * count} rows")
            driver.summary["completed_positive_sample_states"] = count
            driver.summary["completed_positive_unique_rows"] = 2 * count
            if count == 64:
                driver.run("Negative", 45, negative=True)
        driver.summary["status"] = "passed"
        driver.checkpoint()
        driver.monitor_stop.set()
        signal.setitimer(signal.ITIMER_REAL, 0)
        print("Bounded body kernel certificate pilot passed", flush=True)
        return 0
    except Exception as error:
        driver.monitor_stop.set()
        driver.memory_reserve = None
        if driver.child is not None and driver.child.poll() is None:
            kill_group(driver.child)
            driver.child.wait()
        driver.summary["status"] = "bounded_obstruction" if isinstance(error, (Obstruction, MemoryError)) else "failed"
        driver.summary["obstruction"] = {"stage": driver.stage, "type": type(error).__name__,
                                         "message": str(error), "later_stages_not_attempted": True}
        driver.checkpoint()
        signal.setitimer(signal.ITIMER_REAL, 0)
        print("Bounded body kernel certificate pilot stopped: " + str(error), file=sys.stderr, flush=True)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
