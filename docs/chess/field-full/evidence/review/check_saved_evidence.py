#!/usr/bin/env python3
"""Validate retained complete-compiler evidence using metadata and hashes only.

This program never imports a project evaluator, executes Lean, compiles native
code, simulates a machine, or recomputes a machine count. A copied review folder
works with --root REPO --evidence PACKET. The seal is mandatory.
"""
import argparse
import hashlib
import json
from pathlib import Path, PurePosixPath
import re
import stat
import sys
import zipfile

HERE = Path(__file__).resolve().parent
SCHEMA = "chess-field-full-review-v1"
REPO = "bocowgill/cryptids"
BRANCH = "codex/chess-openevolve-pilot"
WORKFLOW = ".github/workflows/chess_field_full.yml"
PHASES = ("semantics", "coverage", "machine", "contracts", "fixtures", "regressions", "counts", "full")
META = ("run-api.json", "jobs-api.json", "artifact-api.json", "retention.json", "archive-entries.json")
SOURCE_FILES = {
    WORKFLOW, "lakefile.chess-field-full.toml", "docs/chess/field-full/baseline-pins.json",
    "Cryptids/Compilation/FieldCompiler/Bounds.lean", "Cryptids/Compilation/FieldCompiler/Codec.lean",
    "Cryptids/Compilation/FieldCompiler/Graph.lean", "Cryptids/Compilation/FieldCompiler/Numeric.lean",
    "Cryptids/Compilation/FieldCompiler/Operations.lean", "Cryptids/Compilation/FieldCompiler/RoutineSemantics.lean",
    "Cryptids/Compilation/FieldCompiler/Semantics.lean", "Cryptids/Compilation/FieldCompiler/Snapshot.lean",
    "Cryptids/Compilation/FieldCompiler/Syntax.lean", "Cryptids/Chess/Optimisation/FieldAware.lean",
    "Cryptids/Semantics/ChessFieldAware.lean", "scripts/chess_field_full/Audit.lean",
    "scripts/chess_field_full/Export.lean", "scripts/chess_field_full/fixtures.py",
    "scripts/chess_field_full/generate_snapshot.py", "scripts/chess_field_full/verify.py",
}
CLAIM = {
    "formal_machine": "ConjectureMachines.Machines.chess_field_aware",
    "formal_theorem": "ConjectureMachines.Semantics.ChessFieldAware.halts_iff_not_draw",
    "statement": "Halts chess_field_aware iff NOT (WhiteCanAvoidLoss AND BlackCanAvoidLoss)",
    "blank_tape": True, "symbols": 2, "states": 45065962, "body_states": 41390082,
    "initializer_states": 3675880, "input_bits": 1837940, "source_cells": 141380,
    "previous_states": 390491642, "saved_states": 345425680,
    "full_chess_machine_constructed": True, "unconditional_chess_equivalence": True,
}
FALSE_CONTRACTS = {
    "BadCount": "example : generated.states = 390491642 := by rw [generated_states]; decide +kernel",
    "Unpaid": "example : generated.states = body.states := by rw [generated_states, body_states]; decide +kernel",
    "BadStore": "example : FieldReturn.symbolCode (some Turing.PartrecToTM2.Γ'.bit1) = 3 := by decide +kernel",
    "BadFrame": "example : FieldBinary.updateCell (false, fun _ ↦ 0) 0 4 = (false, fun _ ↦ 4) := by decide +kernel",
    "BadBranch": "example : SharedModel.branchFn RuntimeModel.s003 none = false := by decide +kernel",
    "BadInitializer": "example : (FlatInit.initialise #[0, 1] (⟨1, {transition := fun _ _ ↦ none}⟩ : ConjectureMachines.BundledMachine 2)).states = 1 := by decide +kernel",
}


class ReviewError(Exception):
    pass


def require(condition, message):
    if not condition:
        raise ReviewError(message)


def digest(data):
    return hashlib.sha256(data).hexdigest()


def sha(path):
    return digest(Path(path).read_bytes())


def unique_object(pairs):
    result = {}
    for key, value in pairs:
        require(key not in result, "duplicate JSON key: " + key)
        result[key] = value
    return result


def parse(data):
    return json.loads(data, object_pairs_hook=unique_object)


def read(path):
    return parse(Path(path).read_bytes())


def canonical(value):
    return json.dumps(value, sort_keys=True, separators=(",", ":"))


def safe_name(name):
    p = PurePosixPath(name)
    require(bool(name) and not p.is_absolute() and ".." not in p.parts and
            "." not in p.parts and "\\" not in name and ":" not in name and
            p.as_posix() == name, "unsafe/noncanonical relative path: " + name)
    return name


def zip_files(path):
    result, seen = {}, set()
    with zipfile.ZipFile(path) as archive:
        require(archive.testzip() is None, "archive CRC failure: " + str(path))
        for info in archive.infolist():
            name = safe_name(info.filename.rstrip("/") if info.is_dir() else info.filename)
            require(name not in seen, "duplicate archive path: " + name)
            seen.add(name)
            require(not stat.S_ISLNK(info.external_attr >> 16), "archive symlink: " + name)
            if not info.is_dir():
                result[name] = archive.read(info)
    return result


def unpacked_files(folder):
    result = {}
    for path in folder.rglob("*"):
        require(not path.is_symlink(), "unpacked symlink: " + str(path))
        if path.is_file():
            result[safe_name(path.relative_to(folder).as_posix())] = path.read_bytes()
    return result


def load_packet(folder):
    raw = {n: (folder / n).read_bytes() for n in META}
    payload, unpacked = zip_files(folder / "artifact.zip"), unpacked_files(folder / "unpacked")
    logs = zip_files(folder / "logs.zip")
    return {"folder": folder, "raw": raw, "meta": {n: parse(v) for n, v in raw.items()},
            "payload": payload, "unpacked": unpacked,
            "artifact_sha256": sha(folder / "artifact.zip"),
            "artifact_bytes": (folder / "artifact.zip").stat().st_size,
            "logs_sha256": sha(folder / "logs.zip"),
            "logs_bytes": (folder / "logs.zip").stat().st_size,
            "logs_text": "\n".join(v.decode("utf-8", errors="replace") for v in logs.values())}


def validate_packet(packet, bound, official=False):
    m = packet["meta"]
    require(set(bound["metadata_sha256"]) == set(META), "incomplete metadata binding")
    for name, expected in bound["metadata_sha256"].items():
        require(digest(packet["raw"][name]) == expected, "official metadata hash changed: " + name)
    run, jobs, retention = m["run-api.json"], m["jobs-api.json"], m["retention.json"]
    inventory = m["artifact-api.json"]
    require(inventory["total_count"] == len(inventory["artifacts"]) == 1,
            "artifact inventory changed")
    artifact = inventory["artifacts"][0]
    require(run["id"] == bound["run_id"] == retention["run_id"] == artifact["workflow_run"]["id"],
            "run identity changed")
    require(run["head_sha"] == bound["commit"] == retention["commit"] == artifact["workflow_run"]["head_sha"],
            "computation source commit changed")
    require(run["repository"]["full_name"] == REPO and run["head_branch"] == BRANCH and
            run["path"] == WORKFLOW and run["status"] == "completed" and
            run["conclusion"] == retention["conclusion"] == bound["conclusion"],
            "repository/workflow/disposition changed")
    require(run["html_url"] == f"https://github.com/{REPO}/actions/runs/{run['id']}" and
            run["url"] == f"https://api.github.com/repos/{REPO}/actions/runs/{run['id']}",
            "run URL changed")
    require(artifact["url"] == f"https://api.github.com/repos/{REPO}/actions/artifacts/{artifact['id']}" and
            artifact["archive_download_url"] == artifact["url"] + "/zip" and
            artifact["name"] == bound["artifact_name"] and artifact["expired"] is False and
            artifact["workflow_run"]["head_branch"] == BRANCH, "artifact provenance changed")
    require(artifact["digest"] == "sha256:" + packet["artifact_sha256"] and
            retention["artifact_sha256"] == packet["artifact_sha256"] == bound["artifact_sha256"] and
            artifact["size_in_bytes"] == packet["artifact_bytes"] == bound["artifact_bytes"],
            "artifact hash/size changed")
    require(retention["logs_sha256"] == packet["logs_sha256"] == bound["logs_sha256"] and
            packet["logs_bytes"] == bound["logs_bytes"], "logs hash/size changed")
    require(jobs["total_count"] == len(jobs["jobs"]) == 1, "job inventory changed")
    job = jobs["jobs"][0]
    require(job["run_id"] == run["id"] and job["head_sha"] == run["head_sha"] and
            job["head_branch"] == BRANCH and job["status"] == "completed" and
            job["conclusion"] == bound["conclusion"] and job["name"] == "verify",
            "job identity/disposition changed")
    require(job["url"] == f"https://api.github.com/repos/{REPO}/actions/jobs/{job['id']}" and
            job["html_url"] == run["html_url"] + f"/job/{job['id']}", "job URL changed")
    entries = m["archive-entries.json"]
    require(set(entries) == set(packet["payload"]) == set(packet["unpacked"]) and
            retention["entries"] == len(entries), "archive/unpacked inventory changed")
    for name, data in packet["payload"].items():
        require(entries[name] == {"bytes": len(data), "sha256": digest(data)} and
                packet["unpacked"][name] == data, "archive entry mismatch: " + name)
    if official:
        require(bound["conclusion"] == "success" and run["event"] == "workflow_dispatch" and
                run["name"] == "Complete field-aware chess compiler" and
                artifact["name"] == "chess-field-full-full-" + run["head_sha"],
                "complete official run is not successful")
        for name in ("Fresh evidence", "Fetch pinned Mathlib cache", "Remote compiler verification"):
            selected = [s for s in job["steps"] if s["name"] == name]
            require(len(selected) == 1 and selected[0]["status"] == "completed" and
                    selected[0]["conclusion"] == "success", "required workflow step failed/missing: " + name)
    return run


def computation_sources(root):
    names = set(SOURCE_FILES)
    actual = {p.relative_to(root).as_posix()
              for base in ("Cryptids/Compilation/FieldCompiler", "scripts/chess_field_full")
              for p in (root / base).rglob("*") if p.is_file() and p.suffix in (".lean", ".py")}
    expected_dirs = {p for p in names if p.startswith("Cryptids/Compilation/FieldCompiler/") or
                     p.startswith("scripts/chess_field_full/")}
    require(actual == expected_dirs, "computation directory source inventory changed")
    optional = "Cryptids/Machines/ChessFieldAware.lean"
    require(not (root / optional).exists(), "unreviewed optional machine module appeared")
    return {p: sha(root / p) for p in sorted(names)}


def check_local_import_closure(root, source, pins, extra):
    """Source inventory fidelity only; this is not a Lean parser or proof checker."""
    bound = set(source) | set(pins) | set(extra)
    pending = [name for name in source if name.endswith(".lean")]
    seen = set()
    while pending:
        name = pending.pop()
        if name in seen:
            continue
        seen.add(name)
        for line in (root / name).read_text().splitlines():
            match = re.fullmatch(r"\s*(?:public\s+)?(?:meta\s+)?import\s+([^\n]+)",
                                 line.split("--", 1)[0])
            if not match:
                continue
            for module in match[1].split():
                target = module.replace(".", "/") + ".lean"
                if module.split(".", 1)[0] in {"Cryptids", "Challenge", "BusyBeaver", "BusyBeaverChallenge"}:
                    require((root / target).is_file() and target in bound,
                            "unbound repository theorem dependency source: " + module)
                    pending.append(target)


def check_command(actual, argv, exit_code, marker, timeout, binding):
    require(actual["argv"] == argv and actual["exit"] == exit_code and marker in actual["output"],
            "command argv/exit/success-token changed: " + marker)
    require(actual["cwd"] == binding["remote_root"] and actual["shell"] is False and
            actual["timed_out"] is False and actual["timeout_seconds"] == timeout,
            "command cwd/shell/configured timeout changed: " + marker)
    require(type(actual["elapsed_seconds"]) in (int, float) and
            0 <= actual["elapsed_seconds"] <= timeout + 15 and
            digest(actual["output"].encode()) == actual["output_sha256"],
            "command output hash/elapsed time changed: " + marker)


def expected_commands(binding):
    r, py = binding["remote_root"], binding["python_executable"]
    build = ["lake", "--wfail", "-f", "lakefile.chess-field-full.toml", "build"]
    regenerate = ([py, "scripts/chess_field_full/generate_snapshot.py", "--output",
                   r + "/.lake/chess-field-full/generated/Snapshot.lean"], 0, "", 120)
    audit = ["prlimit", "--as=17179869184", "--", "lake", "env",
             r + "/.lake/build/bin/chess_field_full_audit"]
    contracts = [(audit, 0, "Chess FieldAware foundation audit passed", 600)]
    for flag, marker in (("--negative-control", "Forbidden axiom: sorryAx"),
                         ("--negative-control-open", "The open chess conjecture is a dependency"),
                         ("--negative-control-generator", "Proof generator is a mathematical dependency:")):
        contracts.append((audit + [flag], 1, marker, 600))
    for name in FALSE_CONTRACTS:
        contracts.append((["lake", "env", "lean", "-M6144", "-DwarningAsError=true",
                           r + "/.lake/chess-field-full/" + name + ".lean"], 1, "is false", 300))
    fixtures = [(["prlimit", "--stack=67108864", "--", "lake", "env",
                  r + "/.lake/build/bin/chess_field_full_export",
                  r + "/.lake/chess-field-full/machine-export.json"], 0, "Full field machine export passed", 900),
                ([py, "scripts/chess_field_full/fixtures.py"], 0, "Full field independent fixtures passed", 900)]
    regressions = [(build + ["Cryptids.Chess.Fixtures", "Cryptids.Chess.Evaluation",
                    "Cryptids.Semantics.ChessM7", "Cryptids.Compilation.FieldBranch.Certificate"],
                    0, "Build completed successfully", 1200)]
    for name, marker, args in (
            ("scripts/RunChessM2.lean", "Rule fixtures passed:", ["--rules"]),
            ("scripts/RunChessM3.lean", "Chess M3 fixtures passed:", []),
            ("scripts/RunChessM4.lean", "Chess M4 fixtures passed:", []),
            ("scripts/RunChessM5.lean", "16 assertions", []),
            ("scripts/chess_m6/SharedFixtures.lean", "Shared fixtures passed:", []),
            ("scripts/chess_m7/Fixtures.lean", "M7 quotient fixtures passed", []),
            ("scripts/chess_openevolve/Fixtures.lean", "Terminal binary fixtures passed", [])):
        run_mode = [] if name == "scripts/chess_m6/SharedFixtures.lean" else ["--run"]
        regressions.append((["lake", "env", "lean", "-M6144", "-DwarningAsError=true"] + run_mode + [name] + args,
                            0, marker, 600))
    result = {
        "semantics": [(build + ["Cryptids.Compilation.FieldCompiler.Semantics",
                         "Cryptids.Compilation.FieldCompiler.Numeric"], 0, "Build completed successfully", 1800)],
        "coverage": [regenerate, (build + ["Cryptids.Compilation.FieldCompiler.Snapshot",
                         "Cryptids.Compilation.FieldCompiler.Graph"], 0, "Build completed successfully", 1800)],
        "machine": [(build + ["Cryptids.Semantics.ChessFieldAware"], 0, "Build completed successfully", 1800)],
        "contracts": contracts, "fixtures": fixtures,
        "regressions": contracts + fixtures + regressions, "counts": [],
        "full": [regenerate, (build + ["Cryptids.Semantics.ChessFieldAware", "chess_field_full_audit",
                         "chess_field_full_export"], 0, "Build completed successfully", 1800)],
    }
    for phase, marker, timeout in (("semantics", "Full field compiler semantics passed", 1800),
                                   ("coverage", "Full field compiler coverage passed", 1800),
                                   ("machine", "Full field chess machine passed", 1800),
                                   ("regressions", "Full field chess regressions passed", 1800),
                                   ("counts", "Full field chess reduction passed", 120)):
        result["full"].append(([py, "scripts/chess_field_full/verify.py", "--" + phase], 0, marker, timeout))
    return result


def validate_phases(packet, binding, source, pins, negative):
    unpacked = packet["unpacked"]
    phases = {p: parse(unpacked[p + ".json"]) for p in PHASES}
    commands = {n: parse(v) for n, v in unpacked.items() if n.startswith("commands/") and n.endswith(".json")}
    expected_files = {p + ".json" for p in PHASES} | set(commands) | {
        name + ".lean" for name in FALSE_CONTRACTS} | {
        "generated/Snapshot.lean", "machine-export.json", "fixtures-detail.json"}
    require(set(unpacked) == expected_files, "complete artifact file inventory changed")
    if negative == "source":
        phases["semantics"]["source_sha256"]["Cryptids/Compilation/FieldCompiler/Semantics.lean"] = "0" * 64
    elif negative == "claim":
        phases["counts"]["detail"]["states"] -= 1
    elif negative == "receipt":
        commands[sorted(commands)[0]]["exit"] = 97
    elif negative == "missing-phase":
        phases.pop("machine")
    require(set(phases) == set(PHASES), "missing verification phase")
    expected = expected_commands(binding)
    all_checks = []
    for name, phase in phases.items():
        require(phase["status"] == "passed" and phase["phase"] == name, "phase is not passed: " + name)
        require(phase["source_sha256"] == source and phase["frozen_source_sha256"] == pins,
                "phase computation/frozen source binding changed: " + name)
        require(phase["commit"] == binding["official"]["commit"] and
                int(phase["run_id"]) == binding["official"]["run_id"], "phase run identity changed: " + name)
        require(len(phase["checks"]) == len(expected[name]), "phase command receipt missing: " + name)
        for check, spec in zip(phase["checks"], expected[name]):
            check_command(check, *spec, binding)
        all_checks.extend(phase["checks"])
    # Contracts/fixtures are also included in regressions: compare the unique receipts,
    # while preserving the two separate snapshot regenerations with different timings.
    unique = {canonical(c) for c in all_checks}
    recorded = [canonical(c) for c in commands.values()]
    require(len(recorded) == len(set(recorded)) == 31 and set(recorded) == unique,
            "standalone/phase command receipt inventory or content changed")
    for name, text in FALSE_CONTRACTS.items():
        require(unpacked[name + ".lean"].decode() == "import Cryptids.Semantics.ChessFieldAware\n" +
                "open Chess.Optimisation.FieldAware ConjectureMachines.Compilation\n" + text + "\n",
                "false-contract source changed: " + name)
    for check in phases["contracts"]["checks"][4:]:
        output = check["output"]
        require("Tactic `decide` proved that the proposition" in output and "is false" in output and
                not any(s in output for s in ("Unknown constant", "Unknown identifier", "unknown namespace",
                        "unknown module", "object file", "file not found", "failed to synthesize")),
                "false-contract failed for an unrelated reason")
    audit = phases["contracts"]["checks"][0]["output"]
    require(binding["permitted_axioms_line"] in audit and "FieldAware foundation roots" in audit and
            "Meta certificate generator roots outside safe roots:" in audit and
            "Compiler artifacts outside safe roots:" in audit, "foundation audit scope changed")
    require(unpacked["generated/Snapshot.lean"] == (binding["root_path"] / 
            "Cryptids/Compilation/FieldCompiler/Snapshot.lean").read_bytes(), "regenerated snapshot differs")
    detail = parse(unpacked["fixtures-detail.json"])
    require(phases["fixtures"]["detail"] == phases["counts"]["detail"] == detail == binding["fixture_detail"],
            "saved fixture/count claim changed")
    for key, value in (("states", 45065962), ("previous_states", 390491642), ("saved_states", 345425680),
                       ("body_states", 41390082), ("initializer_states", 3675880),
                       ("labels_covered", 4042), ("cases", 202100), ("stores_per_label", 5),
                       ("markers_per_store", 2), ("active_field_values", 5),
                       ("native_samples_checked", 202126), ("unique_native_sample_pairs", 190920),
                       ("machine_json_filename", "machine-export.json"),
                       ("initializer_verified", True), ("universal_proof", False), ("status", "passed")):
        require(detail[key] == value, "saved remote fixture scope/count changed: " + key)
    require(detail["cases_per_label"] == [50] * 4042, "per-label coverage is incomplete")
    require(detail["shared_halt_probes_verified"] is True, "explicit shared-halt probes not verified")
    halt_probes = detail["shared_halt_probes"]
    require(len(halt_probes) == 4 and {(p["state"], p["bit"]) for p in halt_probes} ==
            {(3675881, 0), (3675881, 1), (24370922, 0), (24370922, 1)},
            "both-symbol shared-halt main/bounce probe coverage changed")
    for probe in halt_probes:
        # Validate four explicit saved remote receipts, never evaluate a machine row.
        expected_row = None if probe["state"] == 3675881 else [probe["bit"], -1, 3675881]
        require(probe["actual"] == probe["rowMachine"] == probe["independent_recipe"] == expected_row,
                "saved shared-halt main/bounce receipt changed")
    allocation = detail["counts"]
    expected_allocation = {"source_labels": 4042, "slots_per_label": 1024,
        "meaningful_nodes": 106668, "padding_nodes": 4032340,
        "all_graph_nodes": 4139008, "stores_per_node": 5, "live_node_store_controls": 20695040,
        "shared_halt_controls": 1, "post_controls": 20695041, "binary_main_controls": 20695041,
        "binary_bounce_controls": 20695041, "body_controls": 41390082,
        "initializer_write_controls": 1837940, "initializer_restore_controls": 1837940,
        "initializer_controls": 3675880, "total_controls": 45065962}
    for key, value in expected_allocation.items():
        require(allocation[key] == value, "saved complete allocation changed: " + key)
    require(set(allocation) == set(expected_allocation),
            "saved allocation inventory changed")
    # No numeric row traversal occurs here: these are the sealed saved remote receipt values.
    require(allocation == binding["fixture_detail"]["counts"], "padding/meaningful receipt changed")
    initial = detail["initializer"]
    require(initial["steps"] == initial["body_entry"] == 3675880 and initial["head"] == 0 and
            initial["bits"] == 1837940 and initial["source_cells"] == 141380 and
            initial["native_machine_and_rowMachine_replayed"] is True,
            "actual paid initializer receipt changed")
    require([c["name"] for c in detail["mutation_controls"]] ==
            ["dispatch", "store", "frame", "initializer", "undercount"] and
            all(c["passed"] is True and c["rejected"] is True and c["reason"]
                for c in detail["mutation_controls"]), "native mutation controls incomplete")
    exported = digest(unpacked["machine-export.json"])
    require(exported == detail["machine_json_sha256"] == phases["fixtures"]["export_sha256"] ==
            phases["counts"]["export_sha256"] == binding["machine_json_sha256"],
            "actual native export binding changed")
    for marker in ("Complete field-aware chess compiler passed", "Full field compiler semantics passed",
                   "Full field compiler coverage passed", "Full field chess machine passed",
                   "Full field chess regressions passed", "Full field chess reduction passed",
                   "Full field machine export passed", "Full field independent fixtures passed"):
        require(marker in packet["logs_text"], "workflow success marker missing: " + marker)
    return {"phases": list(PHASES), "unique_command_receipts": len(commands),
            "machine_json_sha256": exported, "saved_remote_fixture_cases": 202100}


def validate(root, packet, binding, negative):
    require(binding["schema"] == SCHEMA and binding["claim"] == CLAIM,
            "review construction claim changed")
    report = read(HERE / "review.json")
    require(report["schema"] == SCHEMA and report["status"] == "passed" and
            report["review_kind"] == "independent-model-advisory" and
            report["review_gates"] == {"R1": "passed", "R2": "passed"} and
            report["formal_verification_by_reviewer"] is False and
            report["human_approval"] is False and report["local_heavy_computation"] is False,
            "advisory report is pending or authority/scope changed")
    require(report["run_id"] == binding["official"]["run_id"] and
            report["computation_commit"] == binding["official"]["commit"] and
            report["claim"] == CLAIM, "advisory report construction identity changed")
    source = computation_sources(root)
    require(source == binding["source_sha256"], "current computation source binding changed")
    require(report["source_sha256"] == source, "advisory report source manifest changed")
    for name, expected in binding["reviewed_extra_source_sha256"].items():
        require(sha(root / safe_name(name)) == expected, "reviewed dependency source changed: " + name)
    pins = read(root / "docs/chess/field-full/baseline-pins.json")
    require(pins == binding["frozen_source_sha256"], "frozen pin inventory changed")
    for name, expected in pins.items():
        require(sha(root / safe_name(name)) == expected, "frozen source changed: " + name)
    check_local_import_closure(root, source, pins, binding["reviewed_extra_source_sha256"])
    run = validate_packet(packet, binding["official"], official=True)
    if negative == "entry":
        entries = packet["meta"]["archive-entries.json"]
        entries[sorted(entries)[0]]["sha256"] = "0" * 64
        validate_packet(packet, binding["official"], official=True)
    history_root = root / "docs/chess/field-full/evidence/history"
    actual_history = {p.name for p in history_root.iterdir() if p.is_dir()}
    require(actual_history == set(binding["development_runs"]), "development history inventory changed")
    for name, old in binding["development_runs"].items():
        safe_name(name)
        validate_packet(load_packet(history_root / name), old)
    bound = dict(binding, root_path=root)
    receipt = validate_phases(packet, bound, source, pins, negative)
    return {"schema": SCHEMA, "status": "passed", "review_kind": "independent-model-advisory",
            "run_id": run["id"], "computation_commit": run["head_sha"], "claim": CLAIM,
            "artifact_sha256": packet["artifact_sha256"], "logs_sha256": packet["logs_sha256"],
            "source_sha256": source, "development_runs_checked": len(binding["development_runs"]),
            "formal_verification_by_reviewer": False, "human_approval": False,
            "local_heavy_computation": False, **receipt}


def check_seal(negative):
    seal = read(HERE / "seal.json")
    if negative == "seal":
        seal["review_files_sha256"]["check_saved_evidence.py"] = "0" * 64
    require(seal["schema"] == SCHEMA and seal["status"] == "passed" and
            seal["review_kind"] == "independent-model-advisory" and
            seal["review_gates"] == {"R1": "passed", "R2": "passed"}, "review seal is pending/changed")
    require(seal["formal_verification_by_reviewer"] is False and seal["human_approval"] is False and
            seal["local_heavy_computation"] is False, "review authority/scope changed")
    required = {"check_saved_evidence.py", "construction-binding.json", "review.md", "review.json", "receipt.json"}
    require(set(seal["review_files_sha256"]) == required, "review seal file inventory changed")
    for name, expected in seal["review_files_sha256"].items():
        require(sha(HERE / safe_name(name)) == expected, "review seal mismatch: " + name)
    return seal


def discover_root():
    for parent in HERE.parents:
        if (parent / "lean-toolchain").is_file() and (parent / "Cryptids").is_dir():
            return parent
    raise ReviewError("copied review directory requires --root REPO")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path)
    parser.add_argument("--evidence", type=Path)
    parser.add_argument("--negative", "--negative-control", dest="negative",
                        choices=("source", "entry", "claim", "receipt", "missing-phase", "seal"))
    args = parser.parse_args()
    root = (args.root or discover_root()).resolve()
    evidence = (args.evidence or root / "docs/chess/field-full/evidence/current").resolve()
    seal = check_seal(args.negative)
    binding = read(HERE / "construction-binding.json")
    require(seal["run_id"] == binding["official"]["run_id"] and
            seal["computation_commit"] == binding["official"]["commit"], "seal computation identity changed")
    receipt = validate(root, load_packet(evidence), binding, args.negative)
    require(not args.negative, "negative control was accepted")
    require(receipt == read(HERE / "receipt.json"), "deterministic reviewer receipt changed")
    print(json.dumps(receipt, indent=2, sort_keys=True))
    print("Complete field compiler independent retained-evidence review passed")


if __name__ == "__main__":
    try:
        main()
    except (ReviewError, KeyError, TypeError, ValueError, OSError, zipfile.BadZipFile) as error:
        print("Complete field compiler independent review rejected: " + str(error))
        sys.exit(1)
