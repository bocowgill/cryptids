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
    for name in ("Encoding", "Evaluator", "WithoutDead", "Rules", "Program", "History", "Geometry", "Updates", "Legality", "Control", "HistoryCode", "Source", "SourceModel", "SourceCertificate", "Tape", "Input", "Templates", "Image", "Binary", "Foundations")
] + ["Cryptids/Semantics/Chess.lean", "Cryptids/Chess/Compilation.lean"] + [
    "Cryptids/Compilation/" + name + ".lean"
    for name in ("NatCode", "ListCode", "Scalar", "Commands", "Code", "CodeInput", "CodeDAG",
                 "CodeVM", "Runtime", "RuntimeMacros", "RuntimeSupport", "RuntimeData", "RuntimeDispatch",
                 "RuntimeEval", "RuntimeReturn", "RuntimeLookup", "RuntimeWire", "RuntimeProof",
                 "NumberTM2", "StrongAssembly", "FlatInit", "LocalCertificate",
                 "RuntimeModel", "RuntimeCertificate", "ListEquality", "ListAssembly",
                 "UniqueSupport", "UniqueAssembly", "BoolGraph", "GraphPost", "SharedModel", "SharedCertificate", "BinaryTemplates", "LazyGraph", "TemplateGraph")
]


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def run(args, expected, status=0, *, native_link=False):
    result = subprocess.run(args, cwd=ROOT, env=dict(os.environ, ELAN_NO_UPDATE_CHECK="1"),
                            text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                            timeout=600, check=False)
    require(result.returncode == status, f"Unexpected exit: {args}\n{result.stdout}")
    require(expected in result.stdout, f"Missing success/control token: {args}\n{result.stdout}")
    diagnostic = result.stdout
    if native_link:
        diagnostic = diagnostic.replace(
            "ld64.lld: warning: directory not found for option -L/usr/local/lib\n", "")
    require("warning:" not in diagnostic, f"Unexpected warning: {result.stdout}")
    print(result.stdout, end="", flush=True)
    return {"argv": args, "exit": result.returncode,
            "output_sha256": hashlib.sha256(result.stdout.encode()).hexdigest(),
            "output": result.stdout}


def source_code(text):
    """Remove nested Lean comments while retaining code and quoted strings."""
    out, index, depth, quoted = [], 0, 0, False
    while index < len(text):
        pair = text[index:index + 2]
        if depth:
            if pair == "/-":
                depth += 1
                index += 2
            elif pair == "-/":
                depth -= 1
                index += 2
                out.append(" ")
            else:
                if text[index] == "\n":
                    out.append("\n")
                index += 1
        elif quoted:
            out.append(text[index])
            if text[index] == "\\" and index + 1 < len(text):
                index += 1
                out.append(text[index])
            elif text[index] == '"':
                quoted = False
            index += 1
        elif pair == "/-":
            depth = 1
            index += 2
            out.append(" ")
        elif pair == "--":
            end = text.find("\n", index)
            index = len(text) if end < 0 else end
        else:
            out.append(text[index])
            quoted = text[index] == '"'
            index += 1
    require(depth == 0, "Unterminated Lean block comment")
    return "".join(out)


def source_safe(text):
    return not re.search(r"\b(?:sorry|admit|axiom|native_decide|unsafe|implemented_by|_unsafe_rec)\b|"
                         r"\bpartial\s+def\b", source_code(text))


def inputs():
    paths = [ROOT / name for name in COMPONENTS] + sorted((ROOT / "scripts/chess_m6").glob("*.lean")) + sorted((ROOT / "scripts/chess_m6").glob("*.py"))
    paths += [ROOT / name for name in (
        "scripts/verify_chess_m6.py", "scripts/AuditChessM6.lean", "scripts/chess_m6_table_parts.py",
        "scripts/chess_m6_parallel_parts.py",
        "scripts/RunChessM6.lean", "scripts/RunChessM6VM.lean", "scripts/ProbeChessM6.lean",
        "lean-toolchain", "lakefile.toml", "lakefile.chess-m6.toml", "lake-manifest.json",
        ".github/workflows/chess_m6_ci.yml",
    )]
    return {str(path.relative_to(ROOT)): digest(path) for path in paths}


def foundations():
    before = inputs()
    for bad in ("by sorry", "axiom hidden : False", "unsafe def", "native_decide",
                "partial def", "implemented_by", "_unsafe_rec",
                "/- outer /- inner -/ end -/ by sorry", 'def s := "/-"\nby sorry'):
        require(not source_safe(bad), f"Source control accepted: {bad}")
    require(source_safe("/- proofs admit /- nested -/ this word -/ def x := 1"),
            "Comment scanner rejected ordinary prose")
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
    extra += '\n[[lean_lib]]\nname = "ChessM6Tools"\nroots = ["scripts.chess_m6.Export"]\n'
    extra += '\n[[lean_exe]]\nname = "chess_m6_generate"\nroot = "scripts.GenerateChessM6"\n\n[[lean_exe]]\nname = "chess_m6_reference"\nroot = "scripts.ExportChessM6Challenge"\n'
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
        ("--negative-control-input-generator", "Proof generator is a mathematical dependency:"),
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
        ("CertificateFixtures", "Local certificate fixtures passed: 11 kernel assertions"),
        ("SourceFixtures", "Literal source fixtures passed: exact identity and two mutation controls"),
        ("InputFixtures", "Chess input fixtures passed: exact counts and four mutation controls"),
        ("RuntimeFixtures", "Literal runtime fixtures passed: 8 kernel assertions, 3 paired executions"),
        ("ListAssemblyFixtures", "Explicit list assembly fixtures passed: 20 assertions"),
        ("UniqueFixtures", "Unique support fixtures passed: 14 assertions"),
        ("GraphFixtures", "Boolean graph kernel fixtures passed"),
        ("TemplateGraphFixtures", ""),
        ("LazyFixtures", "Lazy graph kernel fixtures passed"),
        ("ActualTemplateFixtures", ""),
        ("ActualTemplateNative", "Actual template execution fixtures passed; no chess program evaluated"),
        ("LazyNative", "nodes=1000000000001 paidStates=5000000000011 queries=340000 checksum=1540000"),
        ("SharedFixtures", "Shared fixtures passed: 12 kernel assertions, 3 paired executions"),
        ("GraphNative", "states=50011; cells=100022; checksum=3550210"),
        ("BinaryTemplateFixtures", "BinaryTemplates native fixtures passed: 96 finite corners + 4 execution checks"),
    ):
        mode = ["--run"] if name in ("AssemblyFixtures", "ListAssemblyFixtures", "UniqueFixtures", "GraphNative", "BinaryTemplateFixtures", "LazyNative", "ActualTemplateNative") else []
        results.append(run(["lake", "env", "lean", "-DwarningAsError=true"] + mode +
                           [f"scripts/chess_m6/{name}.lean"] +
                           (["1000000000000"] if name == "LazyNative" else []), token))
    results.append(run(["lake", "--wfail", "-f", "lakefile.chess-m6.toml", "build", "ChessM6Tools"],
                       "Build completed successfully"))
    results.append(run(["lake", "env", "lean", "-DwarningAsError=true", "--run",
                        "scripts/chess_m6/ExportFixtures.lean"],
                       "Streaming export fixtures passed: complete M5 bytes, suffix, two rejection controls"))
    for mode, token in (("format", "Table parts format verification passed"),
                        ("negative", "Table parts negative controls passed"),
                        ("profile", "Table parts bounded profiles passed")):
        results.append(run(["python3", "scripts/chess_m6/TablePartsFixtures.py", "--" + mode], token))
    results.append(run(["python3", "scripts/chess_m6/ParallelFixtures.py", "--all"],
                       "Parallel table focused verification passed"))
    results.append(run(["lake", "env", "lean", "-DwarningAsError=true",
                        "scripts/chess_m6/ImageFixtures.lean"], ""))
    image_audit = ["lake", "env", "lean", "-DwarningAsError=true", "--run",
                   "scripts/chess_m6/ImageAudit.lean"]
    results.append(run(image_audit, "Image axiom audit passed"))
    results.append(run(image_audit + ["--image-only"],
                       "Executable image conservatively excludes semantic/materialized dependencies"))
    for argument, expected in (
        ("--negative-control", "Forbidden axiom: sorryAx"),
        ("--unsafe-control", "Unsafe or partial dependency:"),
        ("--negative-image-control", "compiler: ConjectureMachines.Compilation.SharedModel.entries"),
        ("--negative-record-control", "compiler: Chess.Compilation.Templates.writeSites"),
        ("--negative-valid-control", "compiler: Chess.Compilation.Image.valid"),
    ):
        results.append(run(image_audit + [argument], expected, 1))
    for name in ("ImageNegativeCount", "ImageNegativeTransition", "ImageNegativeSite"):
        results.append(run(["lake", "env", "lean", "-DwarningAsError=true",
                            f"scripts/chess_m6/{name}.lean"], "is false", 1))
    work = ROOT / ".lake/chess-m6-check"
    work.mkdir(parents=True, exist_ok=True)
    image_config = work / "lakefile-image.toml"
    image_config.write_text((ROOT / "lakefile.toml").read_text() +
        '\n[[lean_exe]]\nname = "chess_m6_image_fixtures"\n'
        'root = "scripts.chess_m6.ImageNative"\n')
    results.append(run(["lake", "--wfail", "-f", str(image_config), "build",
                        "chess_m6_image_fixtures"], "Build completed successfully", native_link=True))
    results.append(run([".lake/build/bin/chess_m6_image_fixtures"],
                       "Image native checks passed; initial chess program not evaluated"))
    require(before == inputs(),
            "A checked source changed during verification")
    report = {"milestone": "M6", "status": "in_progress",
              "generated_machine": "Chess.Compilation.Image.machine",
              "generated_halting_theorem": "Chess.Compilation.Image.halts_iff",
              "published_literal_machine": None,
              "full_chess_state_count": 392046832, "integration_gates_met": 1,
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
