#!/usr/bin/env python3
"""Run M2's checked Lean contracts, trust controls, rule fixtures, and sourced perft suite."""

import hashlib
import json
import os
from pathlib import Path
import re
import subprocess

ROOT = Path(__file__).resolve().parents[1]


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def run(*args, expected_success=True):
    result = subprocess.run(
        args, cwd=ROOT, env=dict(os.environ, ELAN_NO_UPDATE_CHECK="1"),
        text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, check=False, timeout=300,
    )
    require((result.returncode == 0) == expected_success,
            f"Unexpected exit {result.returncode}: {args}\n{result.stdout}")
    require("warning:" not in result.stdout, f"Lean warning: {result.stdout}")
    return result.stdout.strip()


def lean(script, *args, expected_success=True):
    return run("lake", "env", "lean", "-DwarningAsError=true", "--run", script, *args,
               expected_success=expected_success)


def source_check(text):
    return not re.search(r"\b(sorry|admit|axiom|native_decide)\b", text)


def inputs():
    paths = sorted((ROOT / "Cryptids/Chess/Exec").glob("*.lean")) + [
        ROOT / path for path in (
            "Cryptids/Chess/Exec.lean", "Cryptids/Chess/Fixtures.lean",
            "scripts/AuditChessM2.lean", "scripts/RunChessM2.lean",
            "scripts/verify_chess_m2.py", "docs/chess/m2/perft.json",
            "lean-toolchain", "lakefile.toml", "lake-manifest.json",
        )
    ]
    return {str(path.relative_to(ROOT)): hashlib.sha256(path.read_bytes()).hexdigest()
            for path in paths}


def main():
    started_with = inputs()
    for forbidden in ("sorry", "admit", "axiom hidden : False", "native_decide"):
        require(not source_check(forbidden), "Source-scan negative control failed")
    for path in sorted((ROOT / "Cryptids/Chess/Exec").glob("*.lean")):
        require(source_check(path.read_text()), f"Forbidden trust shortcut in {path}")
    print(run("lake", "--wfail", "build", "Cryptids.Chess.Exec", "Cryptids.Chess.Fixtures"),
          flush=True)
    audit = lean("scripts/AuditChessM2.lean")
    require("Chess M2 theorem audit passed" in audit, "Missing theorem audit result")
    print(audit, flush=True)
    negative = lean("scripts/AuditChessM2.lean", "--negative-control", expected_success=False)
    require("Forbidden axiom: sorryAx" in negative, "Trust audit did not reject sorryAx")
    print("Trust-audit negative control rejected sorryAx", flush=True)
    rules = lean("scripts/RunChessM2.lean", "--rules")
    require(re.fullmatch(r"Rule fixtures passed: [1-9][0-9]* assertions", rules),
            f"Unexpected fixture result: {rules}")
    print(rules, flush=True)
    suite_path = ROOT / "docs/chess/m2/perft.json"
    suite = json.loads(suite_path.read_text())
    require({p["name"] for p in suite["positions"]} == {
        "initial", "kiwipete", "position-3", "position-4", "position-4-mirror",
        "position-5", "position-6",
    }, "Missing or unexpected standard perft position")
    require(len(suite["positions"]) == 7, "Duplicate perft position")
    observed = []
    for position in suite["positions"]:
        require(len(position["counts"]) >= (4 if position["name"] == "initial" else 3),
                f"Insufficient perft depth: {position['name']}")
        for depth, expected in enumerate(position["counts"]):
            output = lean("scripts/RunChessM2.lean", position["fen"], str(depth))
            require(output.isdecimal(), f"Invalid perft output: {output}")
            actual = int(output)
            require(actual == expected,
                    f"Perft mismatch: {position['name']} depth {depth}: {actual} != {expected}")
            print(f"Perft {position['name']} depth {depth}: {actual}", flush=True)
            observed.append(dict(name=position["name"], depth=depth, nodes=actual))
    require(inputs() == started_with, "M2 source changed during verification; rerun on stable files")
    work = ROOT / ".lake/chess-m2-check"
    work.mkdir(exist_ok=True)
    (work / "results.json").write_text(json.dumps({
        "suite_sha256": hashlib.sha256(suite_path.read_bytes()).hexdigest(),
        "source_sha256": started_with,
        "audit": audit, "rules": rules, "observed": observed,
    }, indent=2) + "\n")
    print(f"Matched {len(observed)} perft counts across {len(suite['positions'])} positions")
    print("Chess M2 executable verification passed")


if __name__ == "__main__":
    main()
