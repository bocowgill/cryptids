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
N, K, MAIN = 573802, 114487, 533341
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
        self.stage = "input_and_generation"
        self.summary = {
            "status": "running", "classification": "FINITE_PARTIAL_KERNEL_SCALABILITY_PILOT",
            "partial_certificate_only": True, "full_quotient_certified": False,
            "new_accepted_machine": False, "run_id": os.environ.get("GITHUB_RUN_ID"),
            "commit": os.environ.get("GITHUB_SHA"), "driver_source": info(Path(__file__)),
            "limits": {"wall_seconds": args.seconds, "process_group_rss_bytes": args.memory_gib << 30,
                       "driver_rss_bytes": 512 << 20, "rss_sampling_seconds": 0.1,
                       "address_space_limit": None, "memory_enforcement": "sampled resident memory"},
            "source_states": N, "quotient_states": K, "requested_sample_states": [64, 512, 4096],
            "stages": [], "generated_files": {}, "completed_positive_sample_states": 0,
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

    def run(self, stem, seconds, banner=None, negative=False):
        self.stage = stem
        self.checkpoint()
        remaining = self.deadline - time.monotonic() - 4
        if remaining <= 0:
            raise Obstruction("no remaining time for " + stem)
        limit = min(seconds, remaining)
        module = MODULE + "." + stem
        # Only generated build products are removed, so a stage measures fresh
        # kernel checking rather than replay of a prior pilot's cached .olean.
        for folder in ("lib/lean", "ir"):
            base = ROOT / ".lake/build" / folder / PREFIX
            if base.is_dir():
                for path in base.glob(stem + ".*"):
                    if path.is_file():
                        path.unlink()
        command = ["lake", "--wfail", "-f", str(self.args.lakefile), "build", module]
        log_path = self.args.output / (stem + ".log")
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
        receipt = {"module": module, "argv": command, "cwd": str(ROOT), "shell": False,
                   "exit": exit_code, "timeout_seconds": limit, "resource_stop": cause,
                   "elapsed_seconds": time.monotonic() - started, "peak_group_plus_driver_rss_bytes": peak,
                   "log": log_path.name, "log_info": info(log_path), "expected_banner": banner,
                   "expected_banner_found": banner in output if banner else None}
        compiled = ROOT / ".lake/build/lib/lean" / PREFIX / (stem + ".olean")
        if compiled.exists():
            receipt["olean"] = info(compiled)
        self.summary["stages"].append(receipt)
        self.summary.pop("active_command", None)
        self.checkpoint()
        scaling = cause or any(word in lower for word in
                              ("out of memory", "memory exhausted", "maximum memory", "bad_alloc",
                               "resource temporarily unavailable", "timeout", "heartbeats",
                               "recursion depth", "stack overflow"))
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
    lines, cells = [], []
    with (source / "quotient-rows.jsonl").open("rb") as stream:
        for index, raw in enumerate(stream):
            record = json.loads(raw)
            require(index < 2 * K and record[:2] == [index // 2, index % 2] and
                    all(type(x) is int for x in record[:2]), "quotient row order")
            row = record[2]
            if row is None:
                cells.append("---")
            else:
                require(len(row) == 3 and all(type(x) is int for x in row) and row[0] in (0, 1) and
                        row[1] in (-1, 1) and 0 <= row[2] < K, "quotient row domain")
                cells.append(str(row[0]) + ("R" if row[1] == 1 else "L") + str(row[2]))
            if index % 2:
                lines.append(" ".join(cells))
                cells = []
    require(len(lines) == K and not cells, "quotient complete census")
    driver.emit("quotient.rows", "\n".join(lines) + "\n")
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
public import Cryptids.Compilation.BalancedTable

meta section
namespace Chess.Optimisation.BodyCertificatePilot.Generator
open Lean Elab Term Meta Command ConjectureMachines

elab "load_body_map% " path:str : term <= expectedType? => do
  let expected ← instantiateMVars expectedType?
  unless expected.isAppOfArity ``Compilation.Balanced.RowTree 1 do
    throwError "Expected map tree"
  let elemType := expected.getAppArgs[0]!
  unless elemType.isAppOfArity ``Fin 1 do throwError "Expected bounded map values"
  let bound := elemType.getAppArgs[0]!
  let content ← liftM (m := IO) (IO.FS.readFile path.getString)
  let mut entries : Array Expr := #[]
  for raw in content.splitOn "\n" do
    let text := raw.trimAscii.toString
    if !text.isEmpty then
      let some value := text.toNat? | throwError "Malformed map integer"
      entries := entries.push (TableSyntax.boundedFinExpr bound value)
  TableSyntax.balancedRowsExpr elemType entries 0 entries.size

def dependencies (info : ConstantInfo) : Array Name := Id.run do
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

elab "audit_body_roots% " "[" roots:ident,* "]" : command => do
  let env ← getEnv
  let mut pending := roots.getElems.map (fun name ↦ name.getId)
  let mut seen : NameSet := {}
  while let some name := pending.back? do
    pending := pending.pop
    if seen.contains name then continue
    seen := seen.insert name
    let some decl := env.find? name | throwError "Missing audited declaration: {name}"
    if decl.isUnsafe || decl.isPartial then throwError "Unsafe/partial dependency: {name}"
    if (`Chess.Optimisation.BodyCertificatePilot.Generator).isPrefixOf name ||
        (`ConjectureMachines.TableSyntax).isPrefixOf name ||
        name == `Chess.perfect_play_results_in_draw then
      throwError "Forbidden generator/conjecture dependency: {name}"
    if decl matches .axiomInfo _ then
      unless #[`propext, `Classical.choice, `Quot.sound].contains name do
        throwError "Forbidden axiom dependency: {name}"
    pending := pending ++ dependencies decl
  logInfo m!"Body kernel certificate root audit passed: {roots.getElems.size} roots"
end Chess.Optimisation.BodyCertificatePilot.Generator
end
run_cmd Lean.logInfo "Body certificate loaders checked"
'''


def header(imports):
    return ("module\n" + "".join("public import " + item + "\n" for item in imports) +
            "\n@[expose] public section\nnamespace " + NS + "\n" +
            "open Turing ConjectureMachines ConjectureMachines.Compilation\n" +
            "set_option maxHeartbeats 0\nset_option maxRecDepth 1000000\n" +
            "set_option Elab.async false\nset_option compiler.extract_closed false\n")


def audit_and_end(names, banner):
    return ("\naudit_body_roots% [" + ", ".join(NS + "." + name for name in names) + "]\n" +
            "end " + NS + "\nrun_cmd Lean.logInfo " + json.dumps(banner) + "\n")


def generate(driver, selected):
    # Source text is generated only after the import-time remote guard.
    driver.emit("Loaders.lean", LOADERS)
    driver.emit("MapData.lean", header([MODULE + ".Loaders"]) +
                f'def mapTree : Balanced.RowTree (Fin {K}) :=\n' +
                f'  load_body_map% "{PREFIX}/class-map.txt"\n' +
                audit_and_end(["mapTree"], "Complete body class map loaded"))
    driver.emit("QuotientData.lean", header([MODULE + ".Loaders"]) +
                f'def quotientTree : Balanced.RowTree (List (Option (Fin 2 × Dir × Fin {K}))) :=\n' +
                f'  load_balanced_rows% "{PREFIX}/quotient.rows"\n' +
                audit_and_end(["quotientTree"], "Complete body quotient rows loaded"))
    data = header([MODULE + ".MapData", MODULE + ".QuotientData",
                   "Cryptids.Chess.Optimisation.FieldSelective", "Cryptids.Compilation.LocalCertificate"])
    data += f'''def classMap (s : Fin {N}) : Fin {K} := mapTree.lookup s.val 0
def quotient : Machine {K} 2 := Balanced.ofTree quotientTree
theorem map_count : mapTree.count = {N} := by decide +kernel
theorem map_valid : mapTree.WellFormed := by decide +kernel
theorem quotient_count : quotientTree.count = {K} := by decide +kernel
theorem quotient_valid : quotientTree.WellFormed := by decide +kernel
theorem entry : classMap 0 = 0 := by decide +kernel
def RowAt (s : Fin {N}) (b : Fin 2) : Prop :=
  (Chess.Optimisation.FieldSelective.body.toMachine.transition s b).map
    (fun (write, dir, next) ↦ (write, dir, classMap next)) =
  quotient.transition (classMap s) b
'''
    driver.emit("Data.lean", data + audit_and_end(
        ["map_count", "map_valid", "quotient_count", "quotient_valid", "entry", "RowAt"],
        "Complete body certificate data checked"))
    for count in (64, 512, 4096):
        parts, names = [header([MODULE + ".Data"])], []
        for state in selected[:count]:
            for bit in (0, 1):
                name = f"row_{count}_{state}_{bit}"
                names.append(name)
                parts.append(f"theorem {name} : RowAt {state} {bit} := by decide +kernel\n")
        parts.append(audit_and_end(names, f"Body kernel rows checked: {count} states, {2 * count} rows"))
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
    args = parser.parse_args()
    require(sys.platform == "linux" and 10 <= args.seconds <= 1200 and 2 <= args.memory_gib <= 6,
            "Linux and bounded resource settings required")
    args.output.mkdir(parents=True, exist_ok=True)
    require(args.lakefile.is_file(), "root-owned lakefile missing")
    driver = Driver(args)
    try:
        load_candidate(driver)
        selected = select_states(driver)
        generate(driver, selected)
        driver.run("Loaders", 60, "Body certificate loaders checked")
        driver.run("MapData", 240, "Complete body class map loaded")
        driver.run("QuotientData", 180, "Complete body quotient rows loaded")
        driver.run("Data", 120, "Complete body certificate data checked")
        driver.summary["complete_typed_candidate_data_checked"] = True
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
