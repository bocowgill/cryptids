#!/usr/bin/env python3
"""Remote acceptance phases. Local --metadata checks hashes only, without Lean or search."""
import argparse
import hashlib
import importlib.util
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
WORK = ROOT / ".lake/chess-openevolve"
sys.path.insert(0, str(ROOT))


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def metadata():
    pins = json.loads((ROOT / "docs/chess/openevolve/baseline-pins.json").read_text())
    assert len(pins) == 192
    for name, digest in pins.items():
        assert sha(ROOT / name) == digest, "Frozen M7 input changed: " + name
    seal = ROOT / "docs/chess/m7/evidence/review/seal.json"
    assert sha(seal) == "c278b3cf7a66d94a6950b315c9402c9f76597ffca9939b30112249824fa192c4"
    return pins


def sources():
    paths = ["Cryptids/Optimisation/TerminalBinary.lean", "Cryptids/Chess/Optimisation/OpenEvolve.lean",
             "Cryptids/Semantics/ChessOpenEvolve.lean", ".github/workflows/chess_openevolve_ci.yml",
             "lakefile.chess-openevolve.toml",
             "artifacts/chess_openevolve/table-map.json", "docs/chess/openevolve/baseline-pins.json"]
    paths += [str(p.relative_to(ROOT)) for p in (ROOT / "scripts/chess_openevolve").glob("*")
              if p.is_file() and p.suffix in (".py", ".lean", ".txt")]
    return {p: sha(ROOT / p) for p in sorted(paths)}


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


def save(phase, checks, **more):
    WORK.mkdir(parents=True, exist_ok=True)
    (WORK / (phase + ".json")).write_text(json.dumps({"status": "passed", "phase": phase,
        "source_sha256": sources(), "frozen_source_sha256": metadata(), "checks": checks,
        "commit": os.environ.get("GITHUB_SHA"), "run_id": os.environ.get("GITHUB_RUN_ID"),
        **more}, indent=2) + "\n")


def regression():
    metadata()
    checks = [run(["python3", "scripts/verify_chess_m7.py", "--proofs"],
                  "Chess M7 quotient proof verification passed", timeout=2400)]
    save("regression", checks)
    print("Chess OpenEvolve M7 regression passed")


def proofs():
    checks = [run(["lake", "--wfail", "-f", "lakefile.chess-openevolve.toml", "build", "Cryptids.Semantics.ChessOpenEvolve"],
                  "Build completed successfully", timeout=1800)]
    checks += [run(["lake", "--wfail", "-f", "lakefile.chess-openevolve.toml", "build",
                    "chess_openevolve_audit"], "Build completed successfully")]
    audit = [str(ROOT / ".lake/build/bin/chess_openevolve_audit")]
    checks += [run(audit, "Chess OpenEvolve foundation audit passed")]
    checks += [run(audit + [flag], expected, 1) for flag, expected in [
        ("--negative-control", "Forbidden axiom: sorryAx"),
        ("--negative-control-open", "The open chess conjecture is a dependency"),
        ("--negative-control-generator", "Proof generator is a mathematical dependency:")]]
    save("proofs", checks, states=392046821, previous_states=392046822, saved_states=1,
         target="NOT(WhiteCanAvoidLoss AND BlackCanAvoidLoss)", initializer_states=3110360)
    print("Chess OpenEvolve proof verification passed")


def controls():
    from scripts.chess_openevolve.evaluator import parse, fixtures, certificate
    from scripts.chess_openevolve.table_map import validate
    checks = [run(["lake", "env", "lean", "-M6144", "-DwarningAsError=true", "--run",
                   "scripts/chess_openevolve/Fixtures.lean"], "Terminal binary fixtures passed")]
    rejections = []
    for code in ["import os\nPOLICY=(1,0)", "POLICY=(True,0)", "POLICY=(1,0)\nx=1", "POLICY=(8,8)"]:
        try:
            parse(code)
        except (ValueError, SyntaxError):
            rejections.append(code)
        else:
            raise AssertionError("Malformed candidate accepted")
    for policy in [(0, 1), (1, 1), (2, 0), (2, 1)]:
        try:
            fixtures(policy)
        except ValueError as error:
            rejections.append(str(error))
        else:
            raise AssertionError("Semantic corruption escaped fixtures: " + str(policy))
    for policy in [(0, 0), (1, 0)]:
        fixtures(policy)
        proof = certificate(policy)
        checks.append(proof)
    try:
        certificate((1, 0), timeout=0.000001)
    except subprocess.TimeoutExpired:
        rejections.append("Real Lean subprocess timeout rejected; no certificate returned")
    else:
        raise AssertionError("Timeout control did not trigger")
    # Corrupt the actual proof term of the selected policy, not just its metadata.
    proof = certificate((1, 0))
    bad = WORK / "corrupt-certificate.lean"
    bad.write_text(proof["source"].replace("  TerminalBinary.halts_input h M terminal input", "  by rfl"))
    checks.append(run(["lake", "env", "lean", "-DwarningAsError=true", str(bad)], "error:", 1))
    spec = json.loads((ROOT / "artifacts/chess_openevolve/table-map.json").read_text())
    for key, value in [("candidate_states", 392046822), ("terminal", 0), ("prefix_states", 0),
                       ("source_map_sha256", "0" * 64)]:
        corrupt = dict(spec, **{key: value})
        try:
            validate(corrupt)
        except AssertionError:
            rejections.append("Rejected corrupt table/cost binding: " + key)
        else:
            raise AssertionError("Corrupt artifact accepted")
    save("controls", checks, rejections=rejections, universal_proof_required=True)
    print("Chess OpenEvolve controls passed")


def search():
    checks = [run([sys.executable, "scripts/chess_openevolve/search.py"],
                  '"status": "passed"', timeout=1800)]
    result = json.loads((WORK / "search/result.json").read_text())
    model = [json.loads(s) for s in (WORK / "search/model.jsonl").read_text().splitlines()]
    evaluations = [json.loads(s) for s in (WORK / "search/evaluations.jsonl").read_text().splitlines()]
    assert 1 <= len(model) <= 5
    assert any(m["response"] == "POLICY = (1, 0)\n" for m in model)
    assert any(e.get("policy") == [1, 0] and e["certified"] and e["proof"]["exit"] == 0 for e in evaluations)
    assert result["metrics"]["certified"] == 1 and result["metrics"]["states"] == 392046821
    assert list((WORK / "search/openevolve/checkpoints").glob("*")), "Missing framework checkpoints"
    save("search", checks, result=result, model_requests=len(model), evaluations=len(evaluations),
         tokens=sum(m["usage"]["total_tokens"] for m in model))
    print("Chess OpenEvolve search passed")


def artifact():
    from scripts.chess_openevolve.table_map import validate, old_state, destination
    spec = json.loads((ROOT / "artifacts/chess_openevolve/table-map.json").read_text())
    validate(spec)
    removed = spec["removed_state"]
    assert old_state(removed - 1) == removed - 1 and old_state(removed) == removed + 1
    assert destination(removed) == spec["prefix_states"] + spec["terminal"]
    assert destination(392046821) == 392046820
    assert destination(0) == 0
    checks = [run(["lake", "env", "lean", "-M6144", "-DwarningAsError=true",
                   "scripts/chess_openevolve/TableCertificate.lean"], "")]
    save("artifact", checks, recipe=spec, coverage="universal Lean row correspondence; numeric boundary fixtures",
         full_table_streamed=False)
    print("Chess OpenEvolve artifact verification passed")


def baseline():
    checks = [run(["python3", "scripts/verify_chess_m6.py", "--baseline"],
                  "Chess M6 baseline verification passed", timeout=3600)]
    save("baseline", checks)
    print("Chess OpenEvolve baseline passed")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    for phase in ["metadata", "regression", "proofs", "controls", "search", "artifact", "baseline"]:
        parser.add_argument("--" + phase, action="store_true")
    args = parser.parse_args()
    for phase, selected in vars(args).items():
        if selected:
            globals()[phase]()
