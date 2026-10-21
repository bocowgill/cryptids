#!/usr/bin/env python3
"""Replay saved metadata/hashes only; never run Lean, native code, rows, or fixtures.

The default CLI requires the independent review seal. A copied review directory
is portable: pass --root and --evidence when it is outside the repository.
"""
import argparse
import copy
import hashlib
import json
from pathlib import Path, PurePosixPath
import stat
import sys
import zipfile

HERE = Path(__file__).resolve().parent
PHASES = ("probe", "proofs", "contracts", "fixtures", "counts")
REPO = "bocowgill/cryptids"
BRANCH = "codex/chess-openevolve-pilot"
WORKFLOW = ".github/workflows/chess_field_return.yml"
SOURCES = {
    WORKFLOW, "lakefile.chess-field-return.toml",
    "docs/chess/field-return/baseline-pins.json",
    "Cryptids/Compilation/FieldReturn/Certificate.lean",
    "scripts/chess_field_return/Audit.lean", "scripts/chess_field_return/Export.lean",
    "scripts/chess_field_return/fixtures.py", "scripts/chess_field_return/verify.py",
}
CORRUPTIONS = ["write-preservation", "marker-dispatch", "store-dispatch", "loop-return",
               "continuation-port", "uncharged-early-exit"]


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


def safe_name(name):
    p = PurePosixPath(name)
    require(bool(name) and not p.is_absolute() and ".." not in p.parts and
            "." not in p.parts and "\\" not in name and ":" not in name,
            "unsafe relative path: " + name)
    require(p.as_posix() == name, "noncanonical relative path: " + name)
    return name


def archive_files(path):
    result = {}
    with zipfile.ZipFile(path) as archive:
        require(archive.testzip() is None, "archive CRC check failed")
        seen = set()
        for info in archive.infolist():
            name = info.filename.rstrip("/") if info.is_dir() else info.filename
            safe_name(name)
            require(name not in seen, "duplicate archive path: " + name)
            seen.add(name)
            require(not stat.S_ISLNK(info.external_attr >> 16), "archive symlink: " + name)
            if not info.is_dir():
                result[name] = archive.read(info)
    return result


def discover_root():
    for parent in HERE.parents:
        if (parent / "lean-toolchain").is_file() and (parent / "Cryptids").is_dir():
            return parent
    raise ReviewError("pass --root for a copied review directory")


def load_bundle(evidence):
    metadata = ("run-api.json", "jobs-api.json", "artifact-api.json",
                "retention.json", "archive-entries.json")
    files = {name: (evidence / name).read_bytes() for name in metadata}
    payload = archive_files(evidence / "artifact.zip")
    unpacked = {p.relative_to(evidence / "unpacked").as_posix(): p.read_bytes()
                for p in (evidence / "unpacked").rglob("*") if p.is_file()}
    logs = archive_files(evidence / "logs.zip")
    return {
        "metadata_bytes": files, "metadata": {n: parse(v) for n, v in files.items()},
        "payload": payload, "unpacked": unpacked,
        "artifact_sha256": sha(evidence / "artifact.zip"),
        "artifact_bytes": (evidence / "artifact.zip").stat().st_size,
        "logs_sha256": sha(evidence / "logs.zip"),
        "logs_text": "\n".join(v.decode("utf-8", errors="replace") for v in logs.values()),
        "phases": {p: parse(unpacked[p + ".json"]) for p in PHASES},
        "commands": {n: parse(v) for n, v in unpacked.items()
                     if n.startswith("commands/") and n.endswith(".json")},
        "detail": parse(unpacked["fixtures-detail.json"]),
    }


def check_seal(seal, binding_path, negative=None):
    sealed = copy.deepcopy(seal)
    if negative == "seal":
        sealed["review_files_sha256"]["check_saved_evidence.py"] = "0" * 64
    require(sealed["schema"] == 1 and sealed["status"] == "passed", "review seal not passed")
    require(sealed["review_kind"] == "independent-model-advisory", "review label changed")
    require(sealed["formal_verification_by_reviewer"] is False and
            sealed["human_approval"] is False and sealed["local_heavy_computation"] is False,
            "review authority or computation scope changed")
    require(sealed["review_gates"] == {"R1": "passed", "R2": "passed"}, "review gates incomplete")
    require(sealed["review_files_sha256"].get(binding_path.name) == sha(binding_path),
            "construction binding is not sealed")
    for name, expected in sealed["review_files_sha256"].items():
        safe_name(name)
        require(sha(HERE / name) == expected, "review seal mismatch: " + name)


def mutate(bundle, negative):
    """Deterministic in-memory controls exercise the actual validation predicates."""
    if negative == "source":
        bundle["phases"]["proofs"]["source_sha256"][
            "Cryptids/Compilation/FieldReturn/Certificate.lean"] = "0" * 64
    elif negative == "entry":
        entries = bundle["metadata"]["archive-entries.json"]
        entries[sorted(entries)[0]]["sha256"] = "0" * 64
    elif negative == "claim":
        bundle["phases"]["counts"]["full_chess_machine_constructed"] = True
    elif negative == "receipt":
        first = sorted(bundle["commands"])[0]
        bundle["commands"][first]["exit"] = 97
    elif negative == "missing-phase":
        bundle["phases"].pop("proofs")


def validate(root, bundle, binding):
    require(binding["schema"] == 1 and binding["scope"] == "raw-return-continuation-capsule",
            "construction scope changed")
    require(binding["full_chess_machine_constructed"] is False and
            binding["full_chess_state_saving_claimed"] is False, "unsupported comparison claim")
    source = binding["source_sha256"]
    require(set(source) == SOURCES, "computation source inventory changed")
    for name, expected in {**source, **binding["reviewed_extra_source_sha256"]}.items():
        safe_name(name)
        require(sha(root / name) == expected, "local source binding changed: " + name)
    for name, expected in binding["retained_history_sha256"].items():
        safe_name(name)
        require(sha(root / name) == expected, "retained development history changed: " + name)
    pins = read(root / "docs/chess/field-return/baseline-pins.json")
    for name, expected in pins.items():
        safe_name(name)
        require(sha(root / name) == expected, "frozen input changed: " + name)

    m = bundle["metadata"]
    for name, expected in binding["official_metadata_sha256"].items():
        require(digest(bundle["metadata_bytes"][name]) == expected,
                "official metadata binding changed: " + name)
    run, jobs, retention = m["run-api.json"], m["jobs-api.json"], m["retention.json"]
    artifacts = m["artifact-api.json"]["artifacts"]
    require(len(artifacts) == 1, "official artifact inventory changed")
    artifact = artifacts[0]
    require(run["id"] == binding["remote_run_id"] == retention["run_id"] ==
            artifact["workflow_run"]["id"], "run identity mismatch")
    require(run["head_sha"] == binding["computation_commit"] == retention["commit"] ==
            artifact["workflow_run"]["head_sha"], "computation commit mismatch")
    require(run["repository"]["full_name"] == REPO and run["head_branch"] == BRANCH and
            run["path"] == WORKFLOW and run["name"] == "Chess field-aware return integration",
            "official repository/workflow mismatch")
    require(run["event"] == "workflow_dispatch" and run["status"] == "completed" and
            run["conclusion"] == retention["conclusion"] == "success", "official run not successful")
    require(artifact["name"] == "chess-field-return-" + run["head_sha"] and
            artifact["expired"] is False, "unexpected or expired retained artifact")
    require(artifact["digest"] == "sha256:" + bundle["artifact_sha256"] and
            retention["artifact_sha256"] == bundle["artifact_sha256"] == binding["artifact_sha256"] and
            artifact["size_in_bytes"] == bundle["artifact_bytes"], "artifact digest/size mismatch")
    require(retention["logs_sha256"] == bundle["logs_sha256"] == binding["logs_sha256"],
            "logs digest mismatch")
    require(len(jobs["jobs"]) == 1, "unexpected job inventory")
    job = jobs["jobs"][0]
    require(job["run_id"] == run["id"] and job["head_sha"] == run["head_sha"] and
            job["status"] == "completed" and job["conclusion"] == "success", "job/run mismatch")
    for required in ("Fresh evidence", "Probe finite binary compiler", "Full pilot verification"):
        steps = [s for s in job["steps"] if s["name"] == required]
        require(len(steps) == 1 and steps[0]["status"] == "completed" and
                steps[0]["conclusion"] == "success", "required full stage missing: " + required)

    entries = m["archive-entries.json"]
    require(set(entries) == set(bundle["payload"]) == set(bundle["unpacked"]),
            "archive/unpacked inventory mismatch")
    require(retention["entries"] == len(entries), "retained archive inventory mismatch")
    for name, data in bundle["payload"].items():
        require(entries[name] == {"bytes": len(data), "sha256": digest(data)},
                "archive entry binding mismatch: " + name)
        require(bundle["unpacked"][name] == data, "unpacked archive bytes differ: " + name)

    phases = bundle["phases"]
    require(set(phases) == set(PHASES), "missing verification phase")
    expected_checks = {"probe": 1, "proofs": 1, "contracts": 7, "fixtures": 2, "counts": 0}
    all_checks = []
    for name, phase in phases.items():
        require(phase["status"] == "passed" and phase["phase"] == name, "phase not passed: " + name)
        require(phase["source_sha256"] == source, "computation source binding changed: " + name)
        require(phase["frozen_source_sha256"] == pins, "frozen source manifest mismatch: " + name)
        require(phase["commit"] == run["head_sha"] and int(phase["run_id"]) == run["id"],
                "phase/run identity mismatch: " + name)
        require(len(phase["checks"]) == expected_checks[name], "phase checks missing: " + name)
        all_checks.extend(phase["checks"])
    canonical = lambda value: json.dumps(value, sort_keys=True, separators=(",", ":"))
    require(sorted(map(canonical, all_checks)) == sorted(map(canonical, bundle["commands"].values())),
            "command receipt inventory/content mismatch")
    for check in all_checks:
        require(check["cwd"] == binding["remote_root"] and check["shell"] is False and
                check["timed_out"] is False, "command context/timeout mismatch")
        require(digest(check["output"].encode()) == check["output_sha256"], "command output digest mismatch")

    remote = binding["remote_root"]
    build = ["lake", "--wfail", "-f", "lakefile.chess-field-return.toml", "build",
             "Cryptids.Compilation.FieldReturn.Certificate"]
    expected = {
        "probe": [(build, 0, "Build completed successfully")],
        "proofs": [(build + ["chess_field_return_audit", "chess_field_return_export"], 0,
                    "Build completed successfully")],
        "fixtures": [(["lake", "env", remote + "/.lake/build/bin/chess_field_return_export",
                       remote + "/.lake/chess-field-return/machine.json"], 0,
                      "Field return machine export passed"),
                     ([binding["python_executable"], "scripts/chess_field_return/fixtures.py"], 0,
                      "Field return independent fixtures passed")],
    }
    audit = ["lake", "env", remote + "/.lake/build/bin/chess_field_return_audit"]
    expected["contracts"] = [(audit, 0, "FieldReturn foundation audit passed")]
    for flag, marker in [("--negative-control", "Forbidden axiom: sorryAx"),
                         ("--negative-control-open", "The open chess conjecture is a dependency"),
                         ("--negative-control-generator", "Proof generator is a mathematical dependency:")]:
        expected["contracts"].append((audit + [flag], 1, marker))
    bad_sources = {
        "BadCount": "example : (245 : Nat) = 240 := by decide +kernel",
        "BadDispatch": "example : block.transition 12 0 = some (0, Turing.Dir.left, 37) := by decide +kernel",
        "BadCodec": "example : symbolCode (some Turing.PartrecToTM2.Γ'.bit1) = 3 := by decide +kernel",
    }
    for name, text in bad_sources.items():
        expected["contracts"].append((["lake", "env", "lean", "-M6144", "-DwarningAsError=true",
            remote + "/.lake/chess-field-return/" + name + ".lean"], 1, "error:"))
        actual = bundle["unpacked"][name + ".lean"].decode()
        require(actual == "import Cryptids.Compilation.FieldReturn.Certificate\n" +
                "open ConjectureMachines.Compilation.FieldReturn\n" + text + "\n",
                "false-contract input changed: " + name)
    for phase, specs in expected.items():
        for actual, (argv, exit_code, marker) in zip(phases[phase]["checks"], specs):
            require(actual["argv"] == argv and actual["exit"] == exit_code and marker in actual["output"],
                    "command contract changed: " + phase + " / " + marker)
    require(binding["permitted_axioms_line"] in phases["contracts"]["checks"][0]["output"],
            "permitted axiom report changed")
    for check in phases["contracts"]["checks"][4:]:
        require("Tactic `decide` proved that the proposition" in check["output"] and
                "is false" in check["output"] and not any(marker in check["output"] for marker in
                ("Unknown constant", "Unknown identifier", "unknown namespace", "unknown module",
                 "object file", "file not found")), "false-contract failed for an unrelated reason")

    detail, counts = bundle["detail"], phases["counts"]
    require(phases["fixtures"]["detail"] == detail == binding["fixture_detail"],
            "fixture-detail receipt changed")
    require(detail["status"] == "passed" and detail["store_values"] == 5 and
            detail["visited_controls"] == 245 and detail["raw_cell_patterns"] == 8192 and
            detail["valid_unmarked_cell_patterns"] == 625 and
            detail["return_distances"] == [0, 1, 2, 3, 7, 31, 64], "fixture scope changed")
    require(detail["corruption_controls"] == [{"name": n, "rejected": True} for n in CORRUPTIONS],
            "fixture corruption controls incomplete")
    # Compare saved remote scope/size receipts. Do not parse or count transition rows.
    require(counts["states"] == 245 and counts["inventory"] == [60, 5, 120, 55, 5] and
            counts["entries"] == [0, 49, 98, 147, 196], "saved state-scope receipt changed")
    require(counts["full_chess_machine_constructed"] is False and
            counts["accepted_chess_machine_states"] == 390491642, "unsupported comparison claim")
    row_sha = digest(bundle["unpacked"]["machine.json"])
    require(row_sha == phases["fixtures"]["exported_rows_sha256"] ==
            counts["exported_rows_sha256"] == binding["exported_rows_sha256"], "exported row binding mismatch")
    for marker in ("Field return compiler probe passed", "Field return proof verification passed",
                   "Field return contracts passed", "Field return fixtures passed", "Field return counts passed"):
        require(marker in bundle["logs_text"], "workflow log phase marker missing: " + marker)
    return {
        "schema": 1, "status": "passed", "remote_run_id": run["id"],
        "computation_commit": run["head_sha"], "artifact_sha256": bundle["artifact_sha256"],
        "logs_sha256": bundle["logs_sha256"], "source_sha256": source,
        "exported_rows_sha256": row_sha, "phases": list(PHASES),
        "saved_remote_fixture_cases": detail["binary_machine_cases"],
        "scope": binding["scope"], "full_chess_machine_constructed": False,
        "full_chess_state_saving_claimed": False, "local_heavy_computation": False,
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path)
    parser.add_argument("--evidence", type=Path)
    parser.add_argument("--negative-control", choices=("source", "entry", "claim", "receipt",
                                                      "missing-phase", "seal"))
    args = parser.parse_args()
    root = (args.root or discover_root()).resolve()
    evidence = args.evidence or root / "docs/chess/field-return/evidence/current"
    binding_path = HERE / "construction-binding.json"
    seal = read(HERE / "seal.json")
    check_seal(seal, binding_path, args.negative_control)
    binding = read(binding_path)
    require(seal["remote_run_id"] == binding["remote_run_id"] and
            seal["computation_commit"] == binding["computation_commit"],
            "review seal computation identity mismatch")
    bundle = load_bundle(evidence)
    mutate(bundle, args.negative_control)
    receipt = validate(root, bundle, binding)
    require(not args.negative_control, "negative control was accepted")
    require(receipt == read(HERE / "receipt.json"), "deterministic review receipt changed")
    print(json.dumps(receipt, indent=2, sort_keys=True))
    print("Field return independent retained-evidence review passed")


if __name__ == "__main__":
    try:
        main()
    except (ReviewError, KeyError, ValueError, OSError, zipfile.BadZipFile) as error:
        print("Field return independent review rejected: " + str(error))
        sys.exit(1)
