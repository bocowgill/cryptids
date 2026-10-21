#!/usr/bin/env python3
"""Remote-only broad search checks; --metadata performs file hashing only."""
import argparse
import hashlib
import json
import os
import resource
import selectors
import signal
import subprocess
import sys
import time
from pathlib import Path
ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / ".lake/chess-openevolve-wide"
sys.path.insert(0, str(ROOT))
def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()
def metadata():
    pins = json.loads((ROOT / "docs/chess/openevolve-wide/baseline-pins.json").read_text())
    for name, digest in pins.items():
        assert sha(ROOT / name) == digest, "Frozen input changed: " + name
    print("Broader OpenEvolve frozen inputs passed")
    return pins
def sources():
    paths = ["Cryptids/Optimisation/ReverseInit.lean", "lakefile.chess-openevolve-wide.toml",
             ".github/workflows/chess_openevolve_wide.yml", "docs/chess/openevolve-wide/baseline-pins.json",
             "docs/chess/openevolve-wide/model-pin.json"]
    paths += [str(p.relative_to(ROOT)) for p in (ROOT / "scripts/chess_openevolve_wide").glob("*")
              if p.is_file() and p.suffix in (".py", ".lean", ".txt")]
    paths += [str(p.relative_to(ROOT)) for name in ["Cryptids/Chess/Optimisation/OpenEvolveWide.lean",
              "Cryptids/Semantics/ChessOpenEvolveWide.lean"] if (p := ROOT / name).is_file()]
    return {p: sha(ROOT / p) for p in sorted(paths)}
def save(phase, checks, **extra):
    WORK.mkdir(parents=True, exist_ok=True)
    (WORK / (phase + ".json")).write_text(json.dumps(dict(status="passed", phase=phase,
        source_sha256=sources(), frozen_source_sha256=metadata(), checks=checks,
        commit=os.environ.get("GITHUB_SHA"), run_id=os.environ.get("GITHUB_RUN_ID"), **extra), indent=2) + "\n")

def run(command, expected="", code=0, timeout=900):
    assert os.environ.get("CHESS_REMOTE") == "1", "Heavy verification is remote-only"
    begin = time.monotonic()
    chunks = []
    timed_out = False
    with subprocess.Popen(command, cwd=ROOT, stdout=subprocess.PIPE,
                          stderr=subprocess.STDOUT, start_new_session=True) as process:
        selector = selectors.DefaultSelector()
        selector.register(process.stdout, selectors.EVENT_READ)
        while selector.get_map():
            if not timed_out and time.monotonic() - begin > timeout:
                try:
                    os.killpg(process.pid, signal.SIGKILL)
                except ProcessLookupError:
                    pass
                timed_out = True
            for key, _ in selector.select(1):
                data = os.read(key.fd, 65536)
                if data:
                    chunks.append(data)
                    sys.stdout.buffer.write(data)
                    sys.stdout.buffer.flush()
                else:
                    selector.unregister(key.fileobj)
        exit_code = process.wait()
        selector.close()
    output = b"".join(chunks).decode("utf-8", errors="replace")
    record = {"argv": command, "cwd": str(ROOT), "shell": False, "exit": exit_code,
              "output": output, "output_sha256": hashlib.sha256(output.encode()).hexdigest(),
              "timed_out": timed_out,
              "elapsed_seconds": time.monotonic() - begin,
              "cumulative_children_peak_rss_kib": resource.getrusage(resource.RUSAGE_CHILDREN).ru_maxrss}
    logs = WORK / "commands"
    logs.mkdir(parents=True, exist_ok=True)
    (logs / (str(time.time_ns()) + ".json")).write_text(json.dumps(record, indent=2) + "\n")
    assert not timed_out and exit_code == code and expected in output, json.dumps(record)
    return record


def probe():
    checks = [run(["lake", "--wfail", "-f", "lakefile.chess-openevolve-wide.toml", "build",
        "Cryptids.Semantics.ChessOpenEvolveWide"], "Build completed successfully", timeout=1200)]
    save("probe", checks)
    print("Broader OpenEvolve compiler probe passed")

def search():
    from scripts.chess_openevolve_wide.evaluator import certificate
    from scripts.chess_openevolve_wide.plans import Plan
    # Preflight supplied proof support before spending the model budget. These are
    # engineering controls, never counted as model proposals or search discoveries.
    preflight = [certificate(Plan(code)) for code in [
        'PLAN = writes(bits, "R") + moves("L", len(bits))',
        'PLAN = writes(reverse(bits), "L") + moves("R", 1)']]
    checks = [run([sys.executable, "scripts/chess_openevolve_wide/search.py"],
                  '\"status\": \"completed\"', timeout=2400)]
    search_work = WORK / "search"
    model = [json.loads(x) for x in (search_work / "model.jsonl").read_text().splitlines()]
    evaluations = [json.loads(x) for x in (search_work / "evaluations.jsonl").read_text().splitlines()]
    assert len(model) == 24 and 1 <= len(evaluations) <= 25
    assert all(m["remote"] and not m["constrained_response_set"] for m in model)
    assert all(m["usage"]["completion_tokens"] <= 256 and m["usage"]["prompt_tokens"] <= 4096 for m in model)
    save("search", checks, preflight=preflight, requests=len(model), evaluations=len(evaluations),
         tokens=sum(m["usage"]["total_tokens"] for m in model))
    print("Broader OpenEvolve search completed")

def controls():
    checks = [run([sys.executable, "scripts/chess_openevolve_wide/controls.py"],
                  "Broader OpenEvolve rejection controls passed", timeout=600)]
    save("controls", checks)
    print("Broader OpenEvolve controls passed")

def proofs():
    checks = [run(["lake", "--wfail", "-f", "lakefile.chess-openevolve-wide.toml", "build",
                  "Cryptids.Semantics.ChessOpenEvolveWide", "chess_openevolve_wide_audit"],
                  "Build completed successfully", timeout=1800)]
    audit = ["prlimit", "--as=17179869184", "--", "lake", "env",
             str(ROOT / ".lake/build/bin/chess_openevolve_wide_audit")]
    checks += [run(audit, "Chess OpenEvolveWide foundation audit passed")]
    for flag, expected in [("--negative-control", "Forbidden axiom: sorryAx"),
                           ("--negative-control-open", "The open chess conjecture is a dependency"),
                           ("--negative-control-generator", "Proof generator is a mathematical dependency:")]:
        checks += [run(audit + [flag], expected, code=1)]
    # Actual prior regressions on the same frozen files. Legacy M1--M5 receipts are
    # also authenticated separately by the final retained-evidence checker.
    checks += [run(["python3", "scripts/verify_chess_m7.py", "--proofs"],
                   "Chess M7 quotient proof verification passed", timeout=2400)]
    checks += [run(["python3", "scripts/chess_openevolve/verify.py", "--proofs"],
                   "Chess OpenEvolve proof verification passed", timeout=1800)]
    save("proofs", checks, states=390491642, previous_states=392046821, saving=1555179,
         initializer_states=1555181, body_states=388936461,
         target="NOT(WhiteCanAvoidLoss AND BlackCanAvoidLoss)", full_table_streamed=False)
    print("Broader OpenEvolve proof verification passed")

def results():
    search_work = WORK / "search"
    result = json.loads((search_work / "result.json").read_text())
    proposals = [json.loads(x) for x in (search_work / "model.jsonl").read_text().splitlines()]
    evaluations = [json.loads(x) for x in (search_work / "evaluations.jsonl").read_text().splitlines()]
    certified = [e for e in evaluations if e["certified"]]
    assert certified and all(e["proof"]["exit"] == 0 for e in certified)
    best = min(certified, key=lambda e:e["states"])
    assert result["best_code"] == best["code"] or result["metrics"]["states"] == best["states"]
    measured = dict(requests=len(proposals), evaluations=len(evaluations),
        certified_evaluations=len(certified), distinct_proposals=len({m["response"] for m in proposals}),
        best_states=best["states"], saving=392046821-best["states"], best_code=best["code"],
        best_source_sha256=best["code_sha256"], model_generated=any(
            best["code"].strip() in m["response"] for m in proposals), target_saving=1000000,
        target_met=392046821-best["states"] >= 1000000,
        proof_support_supplied=True, autonomous_invention_claim=False)
    checks = []
    if measured["target_met"]:
        from scripts.chess_openevolve_wide.plans import Plan
        plan = Plan(best["code"])
        bridge = WORK / "selected-plan-bridge.lean"
        bridge.write_text("import Cryptids.Chess.Optimisation.OpenEvolveWide\n"
            "open Turing ConjectureMachines.Compilation ConjectureMachines.Optimisation\n"
            "def selected (bits : List (Fin 2)) : List Init.Instruction := " +
            plan.lean.replace("R.", "ReverseInit.") + "\n"
            "example (bits : Array (Fin 2)) : selected bits.toList =\n"
            "    (Chess.Optimisation.OpenEvolveWide.schedule bits).toList := by\n"
            "  rw [Chess.Optimisation.OpenEvolveWide.schedule_list]\n"
            "  simp [selected]\n")
        checks = [run(["lake", "env", "lean", "-M6144", "-DwarningAsError=true", str(bridge)],
                      timeout=120)]
        measured["selected_plan_bridge_sha256"] = sha(bridge)
        measured["selected_plan_equals_actual_initializer"] = True
    else:
        measured["selected_plan_equals_actual_initializer"] = False
    save("results", checks, measured=measured)
    print(json.dumps(measured))
    print("Broader OpenEvolve result record passed")

if __name__ == "__main__":
    parser=argparse.ArgumentParser()
    for phase in ["metadata", "probe", "search", "controls", "proofs", "results"]:
        parser.add_argument("--"+phase, action="store_true")
    for phase, selected in vars(parser.parse_args()).items():
        if selected: globals()[phase]()
