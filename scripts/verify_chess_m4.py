#!/usr/bin/env python3
"""Verify exact M4 evaluation, trust controls, fixtures, and unchanged prior milestones."""

import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess

ROOT = Path(__file__).resolve().parents[1]
WORK = ROOT / ".lake/chess-m4-check"


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def run(*args, success=True, warnings=False):
    result = subprocess.run(
        args, cwd=ROOT, env=dict(os.environ, ELAN_NO_UPDATE_CHECK="1"),
        stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, timeout=900,
    )
    require((result.returncode == 0) == success,
            f"Unexpected exit {result.returncode}: {args}\n{result.stdout}")
    require(warnings or "warning:" not in result.stdout, f"Lean warning:\n{result.stdout}")
    return result.stdout


def lean(script, *args, success=True):
    return run("lake", "env", "lean", "-DwarningAsError=true", "--run", script, *args,
               success=success)


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def inputs():
    paths = sorted((ROOT / "Cryptids/Chess/Evaluation").glob("*.lean")) + [
        ROOT / name for name in (
            "Cryptids/Chess/Evaluation.lean", "scripts/AuditChessM4.lean",
            "scripts/RunChessM4.lean", "scripts/verify_chess_m4.py",
            "Cryptids.lean", ".github/workflows/lean_action_ci.yml",
            "lean-toolchain", "lakefile.toml", "lake-manifest.json",
        )
    ]
    return {str(path.relative_to(ROOT)): digest(path) for path in paths}


def source_safe(text):
    return not re.search(
        r"\b(sorry|admit|axiom|native_decide|partial|unsafe|implemented_by|_unsafe_rec)\b", text)


def baseline():
    prior = {}
    for milestone in ("m2", "m3"):
        recorded = json.loads((ROOT / f"docs/chess/{milestone}/results.json").read_text())
        for name, expected in recorded["source_sha256"].items():
            require(digest(ROOT / name) == expected, f"{milestone} input changed: {name}")
        prior[milestone] = recorded["source_sha256"]
    outputs = {}
    for name, script, extra in (
        ("reference_and_build", "scripts/verify_chess_m3.py", ["--baseline"]),
        ("m2_regressions", "scripts/verify_chess_m2.py", []),
        ("m3_regressions", "scripts/verify_chess_m3.py", []),
    ):
        output = run("python3", script, *extra, warnings=(name == "reference_and_build"))
        outputs[name] = output
        print(output, end="", flush=True)
    WORK.mkdir(parents=True, exist_ok=True)
    (WORK / "baseline.json").write_text(json.dumps({
        "prior_inputs_verified": prior, **outputs,
    }, indent=2) + "\n")
    print("Chess M4 baseline verification passed")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--baseline", action="store_true")
    args = parser.parse_args()
    if args.baseline:
        baseline()
        return
    before = inputs()
    for control in ("sorry", "admit", "axiom hidden : False", "native_decide", "partial def",
                    "unsafe def", "implemented_by", "_unsafe_rec"):
        require(not source_safe(control), f"Source control unexpectedly accepted: {control}")
    for path in sorted((ROOT / "Cryptids/Chess/Evaluation").glob("*.lean")):
        require(source_safe(path.read_text()), f"Proof shortcut in {path}")
    build = run("lake", "--wfail", "build", "Cryptids.Chess.Evaluation",
                "Cryptids.Chess.Fixtures")
    print(build, end="", flush=True)
    audit = lean("scripts/AuditChessM4.lean")
    require("Chess M4 theorem audit passed" in audit, "Missing audit success")
    print(audit, end="", flush=True)
    for argument, error in (
        ("--negative-control", "Forbidden axiom: sorryAx"),
        ("--negative-control-open", "The open chess conjecture is a dependency"),
        ("--negative-control-rec", "Unsafe or partial dependency:"),
        ("--negative-control-choice", "Unsafe or partial dependency:"),
    ):
        output = lean("scripts/AuditChessM4.lean", argument, success=False)
        require(error in output, f"Negative control failed for wrong reason: {output}")
    print("M4 trust negative controls rejected", flush=True)
    fixtures = lean("scripts/RunChessM4.lean")
    require(re.search(r"\nChess M4 fixtures passed: [1-9][0-9]* assertions\n$", fixtures),
            f"Missing fixture success: {fixtures}")
    print(fixtures, end="", flush=True)
    require(before == inputs(), "M4 source changed during verification; rerun on stable files")
    WORK.mkdir(parents=True, exist_ok=True)
    (WORK / "results.json").write_text(json.dumps({
        "source_sha256": before, "build": build, "audit": audit, "fixtures": fixtures,
        "negative_controls": ["sorryAx rejected", "open conjecture rejected",
                              "evaluator recursion artifact rejected as proof dependency",
                              "selector recursion artifact rejected as proof dependency"],
    }, indent=2) + "\n")
    print("Chess M4 executable verification passed")


if __name__ == "__main__":
    main()
