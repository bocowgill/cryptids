#!/usr/bin/env python3
"""Verify M6 proofs, the exact standalone target, and every retained binary-table row."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
COMPONENTS = [
    "Cryptids/Chess/Compilation/" + name + ".lean"
    for name in ("Encoding", "Evaluator", "WithoutDead", "Rules", "Program", "History", "Geometry", "Updates", "Legality", "Control", "HistoryCode", "Source", "SourceModel", "SourceCertificate", "Tape", "Input", "Templates", "Image", "Matrix", "Binary", "Foundations")
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


def baseline_diagnostic(output):
    """Permit only the complete warning set retained by the pinned M5 baseline."""
    recorded = json.loads((ROOT / "docs/chess/m5/results.json").read_text())
    previous = recorded["baseline"]["outputs"]["default_build"]
    known = [line for line in previous.splitlines() if "warning:" in line]
    require(len(known) == 22 and all(line.startswith("warning: Challenge.lean:")
                                   for line in known), "Unexpected pinned baseline warning set")
    found = [line for line in output.splitlines() if "warning:" in line]
    require(not found or found == known, "Baseline warning set differs from the pinned M5 output")
    return "\n".join(line for line in output.splitlines() if line not in known)


def run(args, expected, status=0, *, native_link=False, baseline_warnings=False, timeout=600):
    result = subprocess.run(args, cwd=ROOT, env=dict(os.environ, ELAN_NO_UPDATE_CHECK="1"),
                            text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                            timeout=timeout, check=False)
    require(result.returncode == status, f"Unexpected exit: {args}\n{result.stdout}")
    require(expected in result.stdout, f"Missing success/control token: {args}\n{result.stdout}")
    diagnostic = result.stdout
    if baseline_warnings:
        require(args == ["python3", "scripts/verify_chess_m5.py", "--baseline"],
                "Baseline warnings are permitted only for the pinned M5 baseline command")
        diagnostic = baseline_diagnostic(diagnostic)
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
        "docs/chess/m5/results.json", "Challenge.lean",
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
    results = [run(["lake", "--wfail", "build", "Cryptids.Chess.Compilation.Foundations",
                    "Cryptids.Chess.Compilation.Matrix"],
                   "Build completed successfully")]
    results.append(run(["python3", "scripts/chess_m6/BaselineWarningsFixtures.py"],
                       "M6 baseline warning controls passed: 2 accepted, 6 rejected"))
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



def release_inputs():
    paths = {ROOT / name for name in COMPONENTS}
    paths.update((ROOT / "scripts/chess_m6").glob("*.lean"))
    paths.update((ROOT / "scripts/chess_m6").glob("*.py"))
    paths.update((ROOT / "Cryptids").glob("ChessM6*.lean"))
    paths.update(ROOT / name for name in (
        "scripts/verify_chess_m6.py", "scripts/AuditChessM6.lean",
        "scripts/BuildChessM6Challenge.lean", "scripts/CompareChessM6.lean",
        "scripts/GenerateChessM6.lean", "scripts/ExportChessM6Challenge.lean",
        "scripts/chess_m6_table_parts.py", "scripts/chess_m6_parallel_parts.py",
        "lean-toolchain", "lakefile.toml", "lakefile.chess-m6.toml", "lake-manifest.json",
        "docs/chess/m5/results.json", "Challenge.lean",
        "comparator/chess_m6.json", "artifacts/chess_baseline/challenge.json",
        "artifacts/chess_baseline/table/manifest.json",
    ))
    return {str(path.relative_to(ROOT)): digest(path) for path in sorted(paths)}


def definitions():
    """Fresh kernel replay, exact target closure, and actual target mutation controls."""
    # All snapshot payloads are in the source. Remove its derived output so this
    # strict Lake build is a fresh replay, rather than elaborating it twice.
    target_source = ROOT / "Cryptids/ChessM6Challenge.lean"
    target_hash = digest(target_source)
    target_object = ROOT / ".lake/build/lib/lean/Cryptids/ChessM6Challenge.olean"
    target_object.unlink(missing_ok=True)
    results = [run(["lake", "--wfail", "build", "Cryptids.Chess.Compilation.Matrix",
                    "Cryptids.ChessM6Challenge"], "Build completed successfully", timeout=2400)]
    work = ROOT / ".lake/chess-m6-check"
    work.mkdir(parents=True, exist_ok=True)
    results.append(run(["lake", "env", "lean", "-DwarningAsError=true", "--run",
                        "scripts/CompareChessM6.lean", "Cryptids.ChessM6Challenge",
                        str(ROOT / ".lake/build/lib/lean")],
                       "Independent M6 target declarations and dependencies match"))
    results.append(run(["python3", "scripts/chess_m6/SnapshotControls.py"],
                       "Actual M6 target mutation controls passed", timeout=2400))
    if sys.platform.startswith("linux"):
        results.append(run(["lake", "comparator", "--config", "comparator/chess_m6.json"],
                           "", timeout=2400))
        print("M6 sandbox comparator passed", flush=True)
    else:
        print("Sandbox comparator requires the supported Linux host; checked in fork CI", flush=True)
    require(digest(target_source) == target_hash, "Standalone source changed during checking")
    (work / "definitions.json").write_text(json.dumps({"checks": results}, indent=2) + "\n")
    print("Chess M6 definition verification passed", flush=True)
    return results


def table_check():
    """Compare all retained row bytes with the independently compiled standalone target."""
    import importlib.util
    import tempfile
    import zlib
    manifest_path = ROOT / "artifacts/chess_baseline/manifest.json"
    manifest_bytes = manifest_path.read_bytes()
    manifest_hash = hashlib.sha256(manifest_bytes).hexdigest()
    manifest = json.loads(manifest_bytes)
    table_path = ROOT / "artifacts/chess_baseline/table/manifest.json"
    table_manifest = json.loads(table_path.read_text())
    for key in ("states", "raw_bytes", "gzip_bytes", "raw_sha256", "rows_per_part"):
        require(manifest["table"][key] == table_manifest[key], f"Table manifest mismatch: {key}")
    require(manifest["table"]["manifest_sha256"] == digest(table_path),
            "Table manifest hash mismatch")
    require(manifest["table"]["part_count"] == len(table_manifest["parts"]),
            "Table part count mismatch")
    frozen = json.loads((ROOT / "docs/chess/m1/reference-v1.json").read_text())
    require(manifest["frozen_reference"] == frozen, "Frozen reference metadata mismatch")
    require(manifest["format"] == "chess-m6-baseline-v1", "Unknown baseline manifest")
    require(manifest["machine"]["states"] == 392046832 and
            manifest["machine"]["symbols"] == 2 and
            manifest["machine"]["initial_state"] == 0 and
            manifest["machine"]["blank_symbol"] == 0, "Wrong startup/state convention")
    before = release_inputs()
    require(before == manifest["source_sha256"], "Release source/hash identity mismatch")
    build = run(["lake", "--wfail", "-f", "lakefile.chess-m6.toml", "build",
                 "chess_m6_generate", "chess_m6_reference"],
                "Build completed successfully", native_link=True, timeout=2400)
    require(before == release_inputs(), "A publication input changed during native build")
    loader = importlib.util.spec_from_file_location("_m6_parallel", ROOT / "scripts/chess_m6_parallel_parts.py")
    parallel = importlib.util.module_from_spec(loader)
    loader.loader.exec_module(parallel)
    semantic_paths = [ROOT / name for name in before
                      if not name.startswith("artifacts/")]
    producer = parallel.make_spec(
        [str(ROOT / ".lake/build/bin/chess_m6_reference"), "{start}", "{count}"],
        paths=semantic_paths, cwd=ROOT)
    parent = ROOT / ".lake/chess-m6-check"
    parent.mkdir(parents=True, exist_ok=True)
    workspace = Path(tempfile.mkdtemp(prefix="full-independent-", dir=parent))
    # Compressed bytes are claimed reproducible only on the recorded codec runtime.
    recorded = manifest["compression_runtime"]
    reproduce = (zlib.ZLIB_RUNTIME_VERSION == recorded["zlib"] and
                 list(sys.version_info[:3]) == recorded["python"])
    if not reproduce:
        print("Different codec runtime: checking every canonical raw byte; retained gzip hashes remain checked", flush=True)
    result = parallel.run(workspace / "run", states=392046832, producer=producer,
                          rows_per_part=1_000_000, workers=4, timeout=120,
                          compare_directory=ROOT / "artifacts/chess_baseline/table",
                          reproduce=reproduce,
                          progress=lambda event: print(json.dumps(event, sort_keys=True), flush=True))
    require(result["status"] == "complete" and result["states_completed"] == 392046832 and
            result["compared_rows"] == 392046832 and result["comparison"] == "every-row-byte",
            "Incomplete independent table comparison")
    require(before == release_inputs(), "A publication input changed during full table comparison")
    require(digest(manifest_path) == manifest_hash, "Baseline manifest changed during comparison")
    report = {"status": "complete", "states": 392046832, "compared_rows": 392046832,
              "canonical_raw_sha256": manifest["table"]["raw_sha256"],
              "compressed_reproduction": reproduce, "run_directory": str(workspace / "run"),
              "source_sha256": before, "build": build,
              "elapsed_seconds": result["elapsed_seconds"],
              "peak_sampled_rss_bytes": result["peak_sampled_rss_bytes"]}
    (parent / "table.json").write_text(json.dumps(report, indent=2) + "\n")
    print("Chess M6 complete table verification passed", flush=True)
    return report


def baseline():
    results = [run(["python3", "scripts/verify_chess_m5.py", "--baseline"],
                   "Chess M5 baseline verification passed", baseline_warnings=True, timeout=7200),
               run(["python3", "scripts/verify_chess_m5.py"],
                   "Chess M5 executable verification passed", timeout=7200)]
    work = ROOT / ".lake/chess-m6-check"
    work.mkdir(parents=True, exist_ok=True)
    (work / "baseline.json").write_text(json.dumps({"checks": results}, indent=2) + "\n")
    print("Chess M6 baseline verification passed", flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    group = parser.add_mutually_exclusive_group()
    for flag in ("foundations", "baseline", "definitions", "table-only"):
        group.add_argument("--" + flag, action="store_true")
    args = parser.parse_args()
    if args.foundations:
        foundations()
    elif args.baseline:
        baseline()
    elif args.definitions:
        definitions()
    elif args.table_only:
        table_check()
    else:
        foundations()
        definitions()
        table_check()
        print("Chess M6 executable verification passed", flush=True)


if __name__ == "__main__":
    main()
