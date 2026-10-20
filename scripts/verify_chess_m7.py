#!/usr/bin/env python3
"""Verify the first strict chess reduction. Heavy phases are intended for remote Linux CI."""
from pathlib import Path
import argparse
import hashlib
import importlib.util
import json
import os
import shutil
import subprocess
import sys
import tempfile
import time

ROOT = Path(__file__).resolve().parents[1]
WORK = ROOT / ".lake/chess-m7-check"
ENV = dict(os.environ, ELAN_NO_UPDATE_CHECK="1")


def require(test, message):
    if not test:
        raise RuntimeError(message)


def digest(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def load_tool(name, path):
    spec = importlib.util.spec_from_file_location(name, ROOT / path)
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def save(name, value):
    WORK.mkdir(parents=True, exist_ok=True)
    (WORK / name).write_text(json.dumps(value, indent=2) + "\n")


def run(argv, expected, code=0, timeout=2400, baseline=False):
    begin = time.monotonic()
    result = subprocess.run(argv, cwd=ROOT, env=ENV, text=True,
                            stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=timeout)
    print(result.stdout, end="", flush=True)
    require(result.returncode == code and expected in result.stdout,
            f"Wrong result for {argv}: exit={result.returncode}")
    diagnostic = result.stdout
    if baseline:
        require(argv == ["python3", "scripts/verify_chess_m6.py", "--baseline"],
                "Unexpected baseline warning exception")
        previous = load_tool("_m7_m6_verifier", "scripts/verify_chess_m6.py")
        diagnostic = previous.baseline_diagnostic(diagnostic)
    require("warning:" not in diagnostic, f"Unexpected warning for {argv}")
    return {"argv": argv, "exit": result.returncode, "expected": expected,
            "elapsed_seconds": time.monotonic() - begin,
            "output_sha256": hashlib.sha256(result.stdout.encode()).hexdigest(),
            "output": result.stdout}


def pins():
    old = json.loads((ROOT / "docs/chess/m7/baseline-pins.json").read_text())
    names = set(old)
    for pattern in ("Cryptids/Optimisation/*.lean", "Cryptids/Chess/Optimisation/*.lean",
                    "scripts/*ChessM7*.lean", "scripts/chess_m7/*.lean", "scripts/chess_m7/*.py"):
        names.update(str(p.relative_to(ROOT)) for p in ROOT.glob(pattern))
    names.update(("Cryptids/Semantics/ChessM7.lean", "scripts/verify_chess_m7.py",
                  "lakefile.chess-m7.toml", "comparator/chess_m7.json",
                  ".github/workflows/chess_m7_ci.yml", "docs/chess/m7/baseline-pins.json"))
    names.update(name for name in ("Cryptids/ChessM7Challenge.lean",
                                  "artifacts/chess_m7/challenge.json",
                                  "artifacts/chess_m7/table-map.json") if (ROOT / name).exists())
    return {name: digest(ROOT / name) for name in sorted(names)}


def freeze():
    baseline = json.loads((ROOT / "docs/chess/m7/baseline-pins.json").read_text())
    require(len(baseline) == 172, "Missing reviewed M6 baseline inputs")
    for name, wanted in baseline.items():
        require(digest(ROOT / name) == wanted, "Frozen M6 input changed: " + name)
    previous = json.loads((ROOT / "docs/chess/m6/results.json").read_text())
    require(previous["status"] == "complete" and previous["acceptance_gates_met"] == 8,
            "M6 baseline is not accepted")
    require(previous["implementation_commit"] == "256d7e1a91546d4b2289edf2b075ab7ffa2aa0ee",
            "Unexpected M6 implementation")
    safe = load_tool("_m7_source_verifier", "scripts/verify_chess_m6.py").source_safe
    for name in ("Cryptids/Optimisation/CompactPost.lean", "Cryptids/Chess/Optimisation/M7.lean",
                 "Cryptids/Semantics/ChessM7.lean"):
        require(safe((ROOT / name).read_text()), "Proof escape in " + name)
    save("freeze.json", {"status": "passed", "baseline_source_sha256": baseline})
    print("Chess M7 frozen baseline verification passed", flush=True)


def proofs():
    freeze()
    before = pins()
    checks = [run(["lake", "--wfail", "build", "Cryptids.Semantics.ChessM7",
                   "Cryptids.Chess.Optimisation.M7Table"],
                  "Build completed successfully")]
    audit = ["lake", "env", "lean", "-DwarningAsError=true", "--run", "scripts/AuditChessM7.lean"]
    checks.append(run(audit, "Chess M7 foundation audit passed"))
    for flag, expected in (("--negative-control", "Forbidden axiom: sorryAx"),
                           ("--negative-control-open", "The open chess conjecture is a dependency"),
                           ("--negative-control-generator", "Proof generator is a mathematical dependency:")):
        checks.append(run(audit + [flag], expected, 1))
    checks.append(run(["lake", "env", "lean", "-DwarningAsError=true", "--run",
                       "scripts/chess_m7/Fixtures.lean"], "M7 quotient fixtures passed"))
    checks.append(run(["python3", "scripts/chess_m7/TableFixtures.py"],
                      "M7 quotient table fixtures passed"))
    require(pins() == before, "M7 proof input changed during checking")
    save("proofs.json", {"status": "passed", "source_sha256": before, "checks": checks})
    print("Chess M7 quotient proof verification passed", flush=True)


def bootstrap():
    """Propose fixed artifacts remotely; this does not grant publication acceptance."""
    freeze()
    artifact = ROOT / "artifacts/chess_m7"
    artifact.mkdir(parents=True, exist_ok=True)
    checks = [run(["lake", "--wfail", "-f", "lakefile.chess-m7.toml", "build", "chess_m7_generate"],
                  "Build completed successfully", timeout=3600)]
    metadata = subprocess.check_output([str(ROOT / ".lake/build/bin/chess_m7_generate"),
                                        "--metadata"], cwd=ROOT, env=ENV, text=True, timeout=120)
    data = json.loads(metadata)
    require(data["baseline_states"] == 392046832 and data["candidate_states"] == 392046822,
            "Native state count differs from proved fixed types")
    table_map = {"format": "chess-m7-literal-table-quotient-v1",
                 "baseline_directory": "artifacts/chess_baseline/table",
                 "baseline_manifest_sha256": digest(ROOT / "artifacts/chess_baseline/table/manifest.json"),
                 **data}
    (artifact / "table-map.json").write_text(json.dumps(table_map, indent=2) + "\n")
    command = ["lake", "env", "lean", "--run", "scripts/BuildChessM6Challenge.lean",
               "--source", "Cryptids.Semantics.ChessM7", "--output", "Cryptids/ChessM7Challenge.lean",
               "--goal", "ConjectureMachines.Semantics.ChessM7.halts_chess_m7_iff_not_draw", "--auto-base"]
    for forbidden in ("Chess.Optimisation.M7.halts_iff", "Chess.Optimisation.M7.equivalent",
                      "Chess.Compilation.Image.halts_iff", "Chess.Compilation.Source.program_initial_dom",
                      "ConjectureMachines.Optimisation.CompactPost.halts_input"):
        command += ["--forbid", forbidden]
    checks.append(run(command, "Snapshot still requires independent kernel build and exact environment comparison"))
    shutil.copyfile(ROOT / "Cryptids/ChessM7Challenge.lean.json", artifact / "challenge.json")
    save("bootstrap.json", {"status": "proposed_only", "checks": checks,
                            "target_sha256": digest(ROOT / "Cryptids/ChessM7Challenge.lean"),
                            "table_map": table_map})
    print("Chess M7 artifacts proposed; full verification remains required", flush=True)


def definitions():
    before = pins()
    target = ROOT / ".lake/build/lib/lean/Cryptids/ChessM7Challenge.olean"
    target.unlink(missing_ok=True)
    checks = [run(["lake", "--wfail", "build", "Cryptids.Semantics.ChessM7", "Cryptids.ChessM7Challenge"],
                  "Build completed successfully")]
    checks.append(run(["lake", "env", "lean", "-DwarningAsError=true", "--run",
                       "scripts/CompareChessM7.lean", "Cryptids.ChessM7Challenge",
                       str(ROOT / ".lake/build/lib/lean")],
                      "Independent M7 target declarations and dependencies match"))
    checks.append(run(["python3", "scripts/chess_m7/SnapshotControls.py"],
                      "Actual M7 target mutation controls passed", timeout=7200))
    require(sys.platform.startswith("linux"), "Supported Linux sandbox verification is required")
    checks.append(run(["lake", "comparator", "--config", "comparator/chess_m7.json"],
                      "Your solution is okay!", timeout=3600))
    require(pins() == before, "M7 definition input changed during checking")
    save("definitions.json", {"status": "passed", "source_sha256": before, "checks": checks})
    print("Chess M7 definition verification passed", flush=True)


def table():
    before = pins()
    native = run(["lake", "--wfail", "-f", "lakefile.chess-m7.toml", "build",
                  "chess_m7_generate", "chess_m7_reference"], "Build completed successfully", timeout=3600)
    quotient = load_tool("_m7_quotient", "scripts/chess_m7/quotient_table.py")
    q, _, _ = quotient.load_spec(ROOT / "artifacts/chess_m7/table-map.json")
    require(q.before == 392046832 and q.after == 392046822, "Unexpected candidate state count")
    parallel = load_tool("_m7_parallel", "scripts/chess_m6_parallel_parts.py")
    WORK.mkdir(parents=True, exist_ok=True)
    work = Path(tempfile.mkdtemp(prefix="full-table-", dir=WORK))
    semantic = [ROOT / name for name in before]
    recipe = parallel.make_spec([sys.executable, str(ROOT / "scripts/chess_m7/quotient_table.py"),
                                 "--spec", str(ROOT / "artifacts/chess_m7/table-map.json"),
                                 "{start}", "{count}"], paths=semantic, cwd=ROOT)
    progress = lambda event: print(json.dumps(event, sort_keys=True), flush=True)
    packed = parallel.run(work / "extract", states=q.after, producer=recipe,
                          rows_per_part=1_000_000, workers=4, timeout=120, progress=progress)
    require(packed["status"] == "complete" and packed["states_completed"] == q.after,
            "Incomplete candidate extraction")
    directory = work / "extract" / "parts"
    reference = parallel.make_spec([str(ROOT / ".lake/build/bin/chess_m7_reference"),
                                    "{start}", "{count}"], paths=semantic, cwd=ROOT)
    compared = parallel.run(work / "independent", states=q.after, producer=reference,
                            rows_per_part=1_000_000, workers=4, timeout=120,
                            compare_directory=directory, reproduce=True, progress=progress)
    require(compared["status"] == "complete" and compared["compared_rows"] == q.after and
            compared["comparison"] == "every-row-byte", "Incomplete candidate byte comparison")
    require(pins() == before, "M7 publication input changed during checking")
    manifest = json.loads((directory / "manifest.json").read_text())
    save("candidate-table-manifest.json", manifest)
    save("table.json", {"status": "complete", "source_sha256": before,
                        "states": q.after, "compared_rows": compared["compared_rows"],
                        "canonical_raw_sha256": manifest["raw_sha256"], "native_build": native,
                        "pack": packed, "comparison": compared, "work_directory": str(work),
                        "encoding": "complete retained baseline literal rows plus fixed quotient map"})
    print("Chess M7 complete table verification passed", flush=True)


def baseline():
    freeze()
    before = pins()
    checks = [run(["python3", "scripts/verify_chess_m6.py", "--baseline"],
                  "Chess M6 baseline verification passed", timeout=10800, baseline=True)]
    require(pins() == before, "M7 baseline input changed during checking")
    save("baseline.json", {"status": "passed", "source_sha256": before, "checks": checks})
    print("Chess M7 baseline verification passed", flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    modes = parser.add_mutually_exclusive_group()
    for name in ("freeze", "proofs", "bootstrap", "definitions", "table", "baseline"):
        modes.add_argument("--" + name, action="store_true")
    args = parser.parse_args()
    for name in ("freeze", "proofs", "bootstrap", "definitions", "table", "baseline"):
        if getattr(args, name):
            globals()[name]()
            return
    proofs()
    definitions()
    table()
    print("Chess M7 executable verification passed", flush=True)


if __name__ == "__main__":
    main()
