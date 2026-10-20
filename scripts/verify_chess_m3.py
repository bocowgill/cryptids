#!/usr/bin/env python3
"""Verify exact M3 adjudication, trust controls, fixtures, and unchanged prior milestones."""

import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess

ROOT = Path(__file__).resolve().parents[1]
WORK = ROOT / ".lake/chess-m3-check"


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def run(*args, success=True, warnings=False):
    result = subprocess.run(
        args, cwd=ROOT, env=dict(os.environ, ELAN_NO_UPDATE_CHECK="1"),
        stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, timeout=300,
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
    paths = sorted((ROOT / "Cryptids/Chess/Adjudication").glob("*.lean")) + [
        ROOT / name for name in (
            "Cryptids/Chess/Adjudication.lean", "scripts/AuditChessM3.lean",
            "scripts/RunChessM3.lean", "scripts/verify_chess_m3.py",
        )
    ]
    return {str(path.relative_to(ROOT)): digest(path) for path in paths}


def source_safe(text):
    return not re.search(
        r"\b(sorry|admit|axiom|native_decide|partial|unsafe|implemented_by|_unsafe_rec)\b", text)


def baseline():
    m2 = json.loads((ROOT / "docs/chess/m2/results.json").read_text())
    for name, expected in m2["source_sha256"].items():
        require(digest(ROOT / name) == expected, f"M2 input changed: {name}")
    build = run("lake", "build", warnings=True)
    require("Build completed successfully" in build, "Default build incomplete")
    print(build, end="", flush=True)
    reference = run("python3", "scripts/verify_chess_reference.py")
    require("Chess reference correspondence verified" in reference, "M1 verification incomplete")
    print(reference, end="", flush=True)
    audit = lean("scripts/AuditChessM2.lean")
    require("Chess M2 theorem audit passed" in audit, "M2 audit incomplete")
    print(audit, end="", flush=True)
    WORK.mkdir(parents=True, exist_ok=True)
    (WORK / "baseline.json").write_text(json.dumps({
        "m2_inputs_verified": m2["source_sha256"], "reference": reference,
        "m2_audit": audit, "default_build": build,
    }, indent=2) + "\n")
    print("Chess M3 baseline verification passed")


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
    for path in sorted((ROOT / "Cryptids/Chess/Adjudication").glob("*.lean")):
        require(source_safe(path.read_text()), f"Proof shortcut in {path}")
    build = run("lake", "--wfail", "build", "Cryptids.Chess.Adjudication",
                "Cryptids.Chess.Fixtures")
    print(build, end="", flush=True)
    audit = lean("scripts/AuditChessM3.lean")
    require("Chess M3 theorem audit passed" in audit, "Missing audit success")
    print(audit, end="", flush=True)
    for argument, error in (
        ("--negative-control", "Forbidden axiom: sorryAx"),
        ("--negative-control-open", "The open chess conjecture is a dependency"),
        ("--negative-control-rec", "Unsafe or partial dependency:"),
    ):
        output = lean("scripts/AuditChessM3.lean", argument, success=False)
        require(error in output, f"Negative control failed for wrong reason: {output}")
    print("M3 trust negative controls rejected", flush=True)
    fixtures = lean("scripts/RunChessM3.lean")
    require(re.fullmatch(r"Chess M3 fixtures passed: [1-9][0-9]* assertions\n", fixtures),
            f"Missing fixture success: {fixtures}")
    print(fixtures, end="", flush=True)
    require(before == inputs(), "M3 source changed during verification; rerun on stable files")
    WORK.mkdir(parents=True, exist_ok=True)
    (WORK / "results.json").write_text(json.dumps({
        "source_sha256": before, "build": build, "audit": audit, "fixtures": fixtures,
        "negative_controls": ["sorryAx rejected", "open conjecture rejected",
                              "compiler recursion artifact rejected as proof dependency"],
    }, indent=2) + "\n")
    print("Chess M3 executable verification passed")


if __name__ == "__main__":
    main()
