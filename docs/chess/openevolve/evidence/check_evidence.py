#!/usr/bin/env python3
"""Authenticate retained remote results and current hashes. Never executes a model or Lean."""
import hashlib
import json
from pathlib import Path
import zipfile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
CURRENT = HERE / "current"
BASELINE = HERE / "baseline"


def read(path):
    return json.loads(path.read_text())


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def archive(folder, name, conclusion):
    run = read(folder / "run-api.json")
    retention = read(folder / "retention.json")
    assert run["status"] == "completed" and run["conclusion"] == conclusion
    assert run["head_branch"] == "codex/chess-openevolve-pilot" and run["name"] == name
    assert run["id"] == retention["run_id"] and run["head_sha"] == retention["commit"]
    artifact, = read(folder / "artifact-api.json")["artifacts"]
    assert artifact["workflow_run"]["id"] == run["id"] and artifact["workflow_run"]["head_sha"] == run["head_sha"]
    assert artifact["digest"] == "sha256:" + sha(folder / "artifact.zip")
    assert artifact["size_in_bytes"] == (folder / "artifact.zip").stat().st_size
    assert retention["artifact_sha256"] == sha(folder / "artifact.zip")
    assert retention["logs_sha256"] == sha(folder / "logs.zip")
    jobs = read(folder / "jobs-api.json")["jobs"]
    steps = {step["name"]: step for job in jobs for step in job["steps"]}
    entries = read(folder / "archive-entries.json")
    with zipfile.ZipFile(folder / "artifact.zip") as bundle:
        assert bundle.testzip() is None
        names = [i.filename for i in bundle.infolist() if not i.is_dir()]
        assert len(names) == len(set(names)) and set(names) == set(entries)
        for name in names:
            data = bundle.read(name)
            assert len(data) == entries[name]["bytes"]
            assert hashlib.sha256(data).hexdigest() == entries[name]["sha256"]
            assert data == (folder / "unpacked" / name).read_bytes()
    return run, steps


def main():
    run, steps = archive(CURRENT, "Chess OpenEvolve pilot", "failure")
    for name in ("Check compiler contract remotely", "Check new paid machine, trust closure and artifact",
                 "Check accepted M7 regression", "Run bounded real OpenEvolve search"):
        assert steps[name]["conclusion"] == "success", name
    assert steps["Check frozen M1 through M5 regression"]["conclusion"] == "failure"
    unpacked = CURRENT / "unpacked"
    timeouts = [read(p) for p in (unpacked / "commands").glob("*.json")
                if read(p).get("timed_out")]
    timeout, = timeouts
    assert timeout["argv"] == ["python3", "scripts/verify_chess_m6.py", "--baseline"]
    assert timeout["exit"] == -9 and timeout["elapsed_seconds"] >= 3600
    assert "Chess M5 baseline verification passed" in timeout["output"]
    assert "Chess M6 baseline verification passed" not in timeout["output"]
    baseline_run, baseline_steps = archive(BASELINE, "Chess OpenEvolve baseline completion", "success")
    assert baseline_steps["Check frozen M1 through M5 regression"]["conclusion"] == "success"
    reports = {}
    for phase in ("proofs", "controls", "regression", "artifact", "search", "baseline"):
        folder = BASELINE / "unpacked" if phase == "baseline" else unpacked
        expected_run = baseline_run if phase == "baseline" else run
        found = list(folder.rglob(phase + ".json"))
        # Only phase reports contain the current computation map.
        matching = [read(p) for p in found if "source_sha256" in read(p)]
        report, = matching
        assert report["status"] == "passed" and str(report["run_id"]) == str(expected_run["id"])
        assert report["commit"] == expected_run["head_sha"]
        reports[phase] = report
        for check in report["checks"]:
            if "output" in check:
                assert hashlib.sha256(check["output"].encode()).hexdigest() == check["output_sha256"]
    pins = reports["proofs"]["source_sha256"]
    frozen = read(ROOT / "docs/chess/openevolve/baseline-pins.json")
    assert len(frozen) == 192
    for report in reports.values():
        assert report["source_sha256"] == pins and report["frozen_source_sha256"] == frozen
    for path, digest in dict(frozen, **pins).items():
        assert sha(ROOT / path) == digest, "Changed input: " + path
    baseline = reports["baseline"]
    check, = baseline["checks"]
    assert check["argv"] == ["python3", "scripts/verify_chess_m6.py", "--baseline"]
    assert check["exit"] == 0 and not check["timed_out"]
    assert "Chess M6 baseline verification passed" in check["output"]
    assert "Chess M5 executable verification passed" in check["output"]
    assert baseline["baseline_timeout_seconds"] == 7200 and baseline["core_run_id"] == run["id"]
    helper = ".github/workflows/chess_openevolve_baseline.yml"
    assert baseline["orchestration_sha256"] == sha(ROOT / helper)
    checkout, = (BASELINE / "unpacked").rglob("helper-checkout.json")
    checkout = read(checkout)
    assert checkout["orchestration_workflow"] == helper
    assert checkout["orchestration_sha256"] == baseline["orchestration_sha256"]
    assert checkout["source_sha256"] == pins and checkout["frozen_source_sha256"] == frozen
    assert checkout["commit"] == baseline_run["head_sha"] and int(checkout["run_id"]) == baseline_run["id"]
    assert checkout["core_run_id"] == run["id"] and checkout["baseline_timeout_seconds"] == 7200
    assert reports["proofs"]["states"] == 392046821 and reports["proofs"]["saved_states"] == 1
    assert reports["proofs"]["initializer_states"] == 3110360
    assert reports["artifact"]["full_table_streamed"] is False
    model_path, = unpacked.rglob("model.jsonl")
    evaluations_path, = unpacked.rglob("evaluations.jsonl")
    model = [json.loads(line) for line in model_path.read_text().splitlines()]
    evaluations = [json.loads(line) for line in evaluations_path.read_text().splitlines()]
    assert len(model) == 5 and len({m["response"] for m in model}) == 5
    assert all(m["remote"] and m["revision"] == "ea3f2471cf1b1f0db85067f1ef93848e38e88c25" for m in model)
    assert all(m["usage"]["completion_tokens"] <= 32 and m["response"] in m["choices"] for m in model)
    assert all(any(e["code"].strip() == m["response"].strip() for e in evaluations) for m in model)
    assert any(e.get("policy") == [1, 0] and e["certified"] and e["proof"]["exit"] == 0 for e in evaluations)
    assert all(not e["certified"] or e.get("policy") in ([0, 0], [1, 0]) for e in evaluations)
    assert any(not e["certified"] and "rejection" in e for e in evaluations)
    print("Retained OpenEvolve evidence passed: matching current sources, 192 frozen inputs, "
          "six composed phases, five real model proposals; core timeout retained")


if __name__ == "__main__":
    main()
