#!/usr/bin/env python3
"""Verify checked M6 construction components; fail closed for the unfinished full milestone."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess

ROOT = Path(__file__).resolve().parents[1]
COMPONENTS = [
    "Cryptids/Chess/Compilation/" + name + ".lean"
    for name in ("Encoding", "Evaluator", "WithoutDead", "Rules", "Program", "History", "Geometry", "Updates", "Legality", "Control", "HistoryCode", "Source", "SourceModel", "SourceCertificate", "Tape", "Binary", "Foundations")
] + [
    "Cryptids/Compilation/" + name + ".lean"
    for name in ("NatCode", "ListCode", "Scalar", "Commands", "Code", "CodeInput", "CodeDAG",
                 "CodeVM", "Runtime", "RuntimeMacros", "RuntimeSupport", "RuntimeData", "RuntimeDispatch",
                 "RuntimeEval", "RuntimeReturn", "RuntimeLookup", "RuntimeWire", "RuntimeProof",
                 "NumberTM2", "StrongAssembly", "FlatInit", "LocalCertificate")
]


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def run(args, expected, status=0):
    result = subprocess.run(args, cwd=ROOT, env=dict(os.environ, ELAN_NO_UPDATE_CHECK="1"),
                            text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                            timeout=600, check=False)
    require(result.returncode == status, f"Unexpected exit: {args}\n{result.stdout}")
    require(expected in result.stdout, f"Missing success/control token: {args}\n{result.stdout}")
    require("warning:" not in result.stdout, f"Unexpected warning: {result.stdout}")
    print(result.stdout, end="", flush=True)
    return {"argv": args, "exit": result.returncode,
            "output_sha256": hashlib.sha256(result.stdout.encode()).hexdigest(),
            "output": result.stdout}


def source_safe(text):
    return not re.search(r"\b(?:sorry|admit|axiom|native_decide|unsafe|implemented_by|_unsafe_rec)\b|"
                         r"\bpartial\s+def\b", text)


def foundations():
    before = {name: digest(ROOT / name) for name in COMPONENTS}
    for bad in ("by sorry", "axiom hidden : False", "unsafe def", "native_decide",
                "partial def", "implemented_by", "_unsafe_rec"):
        require(not source_safe(bad), f"Source control accepted: {bad}")
    for name in COMPONENTS:
        source = (ROOT / name).read_text()
        require(source_safe(source), f"Proof escape in {name}")
        noncomputable = re.findall(r"\bnoncomputable\s+def\s+(\w+)", source)
        require(noncomputable == (["rankNoDead"] if name.endswith("WithoutDead.lean") else []),
                f"Unexpected noncomputable definition in {name}")
    # All pinned M5 inputs remain byte-identical, including the frozen M1 Lake configuration.
    m5_inputs = json.loads((ROOT / "docs/chess/m5/results.json").read_text())["verification"]["source_sha256"]
    for name, expected in m5_inputs.items():
        require(digest(ROOT / name) == expected, f"Frozen M5 input changed: {name}")
    extra = '\n[[lean_exe]]\nname = "chess_m6_probe"\nroot = "scripts.ProbeChessM6"\n'
    require((ROOT / "lakefile.chess-m6.toml").read_text() ==
            (ROOT / "lakefile.toml").read_text() + extra, "Unreviewed alternate Lake configuration")
    results = [run(["lake", "--wfail", "build", "Cryptids.Chess.Compilation.Foundations"],
                   "Build completed successfully")]
    audit = ["lake", "env", "lean", "-DwarningAsError=true", "--run", "scripts/AuditChessM6.lean"]
    results.append(run(audit, "Chess M6 foundation audit passed"))
    for argument, expected in (
        ("--negative-control", "Forbidden axiom: sorryAx"),
        ("--negative-control-open", "The open chess conjecture is a dependency"),
        ("--negative-control-rec", "Unsafe or partial dependency:"),
        ("--negative-control-generator", "Proof generator is a mathematical dependency:"),
    ):
        results.append(run(audit + [argument], expected, 1))
    results.append(run(["lake", "env", "lean", "-DwarningAsError=true", "--run",
                        "scripts/RunChessM6.lean"], "Chess M6 component fixtures passed: 8 checks"))
    results.append(run(["lake", "env", "lean", "-DwarningAsError=true", "--run",
                        "scripts/RunChessM6VM.lean"], "Code VM fixtures passed: 27 assertions"))
    for name, token in (
        ("WireFixtures", "Runtime startup fixtures passed"),
        ("OpcodeFixtures", "Runtime opcode fixtures passed"),
        ("LookupFixtures", "Runtime lookup fixtures passed"),
        ("AssemblyFixtures", "Strong assembly fixtures passed: 16 assertions"),
        ("NumberFixtures", "NumberTM2 fixtures passed: 8 kernel assertions, 2 actual-machine runs"),
        ("InitFixtures", "Flat initializer fixtures passed"),
        ("CertificateFixtures", "Local certificate fixtures passed: 8 kernel assertions"),
        ("SourceFixtures", "Literal source fixtures passed: exact identity and two mutation controls"),
    ):
        mode = ["--run"] if name == "AssemblyFixtures" else []
        results.append(run(["lake", "env", "lean", "-DwarningAsError=true"] + mode +
                           [f"scripts/chess_m6/{name}.lean"], token))
    require(before == {name: digest(ROOT / name) for name in COMPONENTS},
            "A checked source changed during verification")
    report = {"milestone": "M6", "status": "in_progress",
              "generated_machine": "Chess.Compilation.Binary.generated",
              "generated_halting_theorem": "Chess.Compilation.Binary.generated_halts",
              "published_literal_machine": None,
              "full_chess_state_count": None, "integration_gates_met": 1,
              "integration_gates_total": 8, "source_sha256": before, "checks": results}
    work = ROOT / ".lake/chess-m6-check"
    work.mkdir(parents=True, exist_ok=True)
    (work / "foundations.json").write_text(json.dumps(report, indent=2) + "\n")
    print("Chess M6 foundation verification passed")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--foundations", action="store_true")
    parser.add_argument("--baseline", action="store_true")
    args = parser.parse_args()
    if args.foundations:
        require(not args.baseline, "Choose one verification mode")
        foundations()
        return
    raise RuntimeError("M6 remains incomplete: the exact literal "
                       "table, numerical state count, exact table theorem and independent comparator are open. "
                       "Use --foundations only to check completed construction components.")


if __name__ == "__main__":
    main()
