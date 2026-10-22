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
            "requested_scope": "compiled_audit_smoke_only" if args.smoke_only else "full_bounded_pilot",
            "requested_sample_states": [] if args.smoke_only else [64, 512, 4096],
            "audit_execution": "compiled_lean_executable",
            "map_representation": "literal_nat_balanced_tree_with_kernel_range_certificate",
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
        save(self.args.output / "certificate-summary.json", self.summary)

    def emit(self, name, text):
        path = ROOT / PREFIX / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding="utf-8")
        retained = self.args.output / "reproduction" / PREFIX / name
        retained.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(path, retained)
        self.summary["generated_files"][str(PREFIX / name)] = info(path)

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
            for folder in ("lib/lean", "ir"):
                base = ROOT / ".lake/build" / folder / PREFIX
                if base.is_dir():
                    for path in base.glob(stem + ".*"):
                        if path.is_file():
                            path.unlink()
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
            # addDecl(..., true) must reach the kernel and reject its false term.
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
        # Splitting imports is not an expanded allowance: every build, audit and
        # intervening receipt in this group shares the original Data deadline.
        started = time.monotonic()
        group = self.summary["data_stage_group"]
        group["started_after_seconds"] = started - self.start
        self.checkpoint()
        stages = (
            ("MapPrelude", "Body class map prelude checked"),
            ("MapCount", "Complete body class map count checked"),
            ("MapValid", "Complete body class map caches checked"),
            ("MapBounded", "Complete body class map range checked"),
            ("MapChecks", "Complete body class map checks passed"),
            ("QuotientChecks", "Complete packed quotient checks passed"),
            ("Data", "Complete body certificate data assembled"),
            ("BodyRelation", "Actual body row predicate checked"),
        )
        for stem, banner in stages:
            remaining = group["wall_seconds"] - (time.monotonic() - started)
            if remaining <= 0:
                raise Obstruction("shared Data wall budget exhausted before " + stem)
            try:
                self.run(stem, remaining, banner)
            finally:
                group["elapsed_seconds"] = time.monotonic() - started
            group["completed_stages"].append(stem)
            self.checkpoint()
        if time.monotonic() - started > group["wall_seconds"]:
            raise Obstruction("shared Data wall budget exhausted after required audits")
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

'''


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
    declarations, chunks = [], []

    def subtree(start, length):
        if length <= chunk_limit:
            name = f"{stem}Chunk_{start:06d}"
            filename = f"{stem}-chunks/{start:06d}-{length:04d}.rows"
            driver.emit(filename, "".join(lines[start:start + length]))
            chunks.append({"definition": NS + "." + name, "start": start, "states": length,
                           "binary_rows": 2 * length, "path": str(PREFIX / filename),
                           "info": info(ROOT / PREFIX / filename)})
            declarations.append(HEARTBEATS + f"@[noinline] def {name} :\n    {row_tree} :=\n" +
                                f'  load_packed_rows%\n    "{PREFIX}/{filename}"\n')
            return name
        # This is exactly balancedRowsExpr's split, including odd lengths.
        left_count = length // 2
        left = subtree(start, left_count)
        right = subtree(start + left_count, length - left_count)
        return (f"(Balanced.RowTree.branch {left_count}\n  " +
                left.replace("\n", "\n  ") + "\n  " + right.replace("\n", "\n  ") + ")")

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
                "concatenated_sha256": hashlib.sha256(concatenated).hexdigest(), "chunks": chunks}
    manifest_name = stem + "-chunks.json"
    driver.emit(manifest_name, json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    driver.summary.setdefault("quotient_layouts", {})[stem] = {
        key: value for key, value in manifest.items() if key != "chunks"}
    driver.summary["quotient_layouts"][stem]["manifest"] = info(ROOT / PREFIX / manifest_name)
    declarations.append(HEARTBEATS + f"@[noinline] def {stem}Tree :\n    {row_tree} :=\n  " +
                        assembled.replace("\n", "\n  ") + "\n")
    return "".join(declarations)


def generate_smoke(driver):
    # Reuse the production loaders, generic proof and scoped-option prefix.
    # These small literals check templates only and count as no actual-body rows.
    driver.emit("smoke-map.txt", "0\n1\n0\n1\n")
    driver.emit("smoke-quotient.rows", "0R1 ---\n--- 1L0\n")
    driver.emit("smoke-packed.rows", "7 0\n0 2\n")
    smoke = header([MODULE + ".Loaders", "Cryptids.Chess.Optimisation.FieldSelective",
                    "Cryptids.Compilation.LocalCertificate"]) + MAP_BOUNDS
    smoke += HEARTBEATS + f'''noncomputable def smokeMapTree : Balanced.RowTree Nat :=
  load_body_map% "{PREFIX}/smoke-map.txt"
'''
    # Force two separate executable chunks even for this two-state table.
    smoke += quotient_declarations(driver, "smokeQuotient", "smoke-packed.rows", 2, 2, 1)
    for name, proposition in (
            ("smoke_map_count", "smokeMapTree.count = 4"),
            ("smoke_map_valid", "smokeMapTree.WellFormed"),
            ("smoke_map_bounded", "mapAllBelow smokeMapTree 2 = true"),
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
    roots = ["smoke_map_count", "smoke_map_valid", "smoke_map_bounded", "smoke_lookup_lt",
             "smokeClassMap_val", "smoke_quotient_count", "smoke_quotient_valid",
             "smoke_quotient_bounded", "smoke_quotient_fidelity", "smoke_codec_boundaries",
             "smoke_entry", "smoke_row"] + PACKED_ROOTS
    driver.emit("TemplateSmoke.lean", smoke + audit_and_end(
        driver, "TemplateSmoke", roots, "Body certificate template smoke checked"))


def generate_setup(driver):
    driver.emit("Packed.lean", header(["Cryptids.Compilation.BalancedTable"]) + PACKED +
                "\nend " + NS + "\n")
    driver.emit("Loaders.lean", LOADERS)
    driver.emit("Audit.lean", AUDIT)
    generate_smoke(driver)


def generate(driver, selected):
    # Source text is generated only after the import-time remote guard.
    generate_setup(driver)
    driver.emit("MapData.lean", header([MODULE + ".Loaders"]) +
                HEARTBEATS +
                'noncomputable def mapTree : Balanced.RowTree Nat :=\n' +
                f'  load_body_map% "{PREFIX}/class-map.txt"\n' +
                audit_and_end(driver, "MapData", ["mapTree"], "Complete body class map loaded"))
    driver.emit("QuotientData.lean", header([MODULE + ".Loaders"]) +
                quotient_declarations(driver, "quotient", "quotient-packed.rows", K, K,
                                      QUOTIENT_CHUNK_STATES) +
                audit_and_end(driver, "QuotientData", ["quotientTree"], "Complete body quotient rows loaded"))
    map_prelude = header([MODULE + ".MapData"]) + MAP_BOUNDS
    map_prelude += f'''noncomputable def classMap (s : Fin {N}) : Fin {K} :=
  Fin.ofNat {K} (mapTree.lookup s.val 0)
'''
    driver.emit("MapPrelude.lean", map_prelude + audit_and_end(
        driver, "MapPrelude", ["mapAllBelow", "lookup_lt_of_allBelow", "classMap"],
        "Body class map prelude checked"))
    # Independent modules isolate the first count/cache/range reduction. None
    # imports another concrete map proof, and every one is separately audited.
    for stem, name, proposition, banner in (
            ("MapCount", "map_count", f"mapTree.count = {N}",
             "Complete body class map count checked"),
            ("MapValid", "map_valid", "mapTree.WellFormed",
             "Complete body class map caches checked"),
            ("MapBounded", "map_bounded", f"mapAllBelow mapTree {K} = true",
             "Complete body class map range checked")):
        source = header([MODULE + ".MapPrelude"]) + HEARTBEATS
        source += f"theorem {name} : {proposition} := by decide +kernel\n"
        driver.emit(stem + ".lean", source + audit_and_end(driver, stem, [name], banner))
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
    quotient_checks = header([MODULE + ".QuotientData"])
    quotient_checks += f'''def quotient : Machine {K} 2 := packedMachine {K} quotientTree
{HEARTBEATS}theorem quotient_count : quotientTree.count = {K} := by decide +kernel
{HEARTBEATS}theorem quotient_valid : quotientTree.WellFormed := by decide +kernel
{HEARTBEATS}theorem quotient_bounded :
    packedAllBounded quotientTree (4 * {K}) = true := by decide +kernel
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
        driver, "QuotientChecks", quotient_roots, "Complete packed quotient checks passed"))
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
    for count in (64, 512, 4096):
        parts, names = [header([MODULE + ".BodyRelation"])], []
        for state in selected[:count]:
            for bit in (0, 1):
                name = f"row_{count}_{state}_{bit}"
                names.append(name)
                parts.append(HEARTBEATS +
                             f"theorem {name} : RowAt {state} {bit} := by decide +kernel\n")
        parts.append(audit_and_end(driver, f"Rows{count}", names,
                                   f"Body kernel rows checked: {count} states, {2 * count} rows"))
        driver.emit(f"Rows{count}.lean", "".join(parts))
    negative = f'''module
import {MODULE}.Rows64
open Lean Elab Term Meta Command Turing ConjectureMachines
-- Deliberately false: the accepted entry's symbol-zero row is defined.
-- A reflexivity term at the actual row cannot prove it equals none.
elab "submit_false_body_row" : command => do
  liftTermElabM do
    let lhs ← elabTerm (← `(term|
      Chess.Optimisation.FieldSelective.body.toMachine.transition
        (0 : Fin {N}) (0 : Fin 2))) none
    let rhs ← elabTerm (← `(term| (none : Option (Fin 2 × Dir × Fin {N})))) none
    let proposition ← mkEq lhs rhs
    let falseProof ← mkEqRefl lhs
    addDecl (.thmDecl {{name := `{NS}.deliberately_false_row,
      levelParams := [], type := proposition, value := falseProof}}) true
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
    args = parser.parse_args()
    require(sys.platform == "linux" and 10 <= args.seconds <= 1200 and 2 <= args.memory_gib <= 6,
            "Linux and bounded resource settings required")
    args.output.mkdir(parents=True, exist_ok=True)
    require(args.lakefile.is_file(), "root-owned lakefile missing")
    driver = Driver(args)
    try:
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
        for count, seconds in ((64, 120), (512, 180), (4096, 210)):
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
