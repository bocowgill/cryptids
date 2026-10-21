#!/usr/bin/env python3
"""Authenticate retained remote results and current hashes. Never executes a model or Lean."""
import hashlib
import json
from pathlib import Path
import zipfile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
CURRENT = HERE / "current"


def read(path):
    return json.loads(path.read_text())


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    run = read(CURRENT / "run-api.json")
    retention = read(CURRENT / "retention.json")
    assert run["status"] == "completed" and run["conclusion"] == "success"
    assert run["head_branch"] == "codex/chess-openevolve-pilot" and run["name"] == "Chess OpenEvolve pilot"
    assert run["id"] == retention["run_id"] and run["head_sha"] == retention["commit"]
    artifact, = read(CURRENT / "artifact-api.json")["artifacts"]
    assert artifact["workflow_run"]["id"] == run["id"] and artifact["workflow_run"]["head_sha"] == run["head_sha"]
    assert artifact["digest"] == "sha256:" + sha(CURRENT / "artifact.zip")
    assert artifact["size_in_bytes"] == (CURRENT / "artifact.zip").stat().st_size
    assert retention["artifact_sha256"] == sha(CURRENT / "artifact.zip")
    assert retention["logs_sha256"] == sha(CURRENT / "logs.zip")
    jobs = read(CURRENT / "jobs-api.json")["jobs"]
    steps = {step["name"]: step for job in jobs for step in job["steps"]}
    for name in ("Check compiler contract remotely", "Check new paid machine, trust closure and artifact",
                 "Check accepted M7 regression", "Run bounded real OpenEvolve search",
                 "Check frozen M1 through M5 regression"):
        assert steps[name]["conclusion"] == "success", name
    entries = read(CURRENT / "archive-entries.json")
    with zipfile.ZipFile(CURRENT / "artifact.zip") as archive:
        assert archive.testzip() is None
        names = [i.filename for i in archive.infolist() if not i.is_dir()]
        assert len(names) == len(set(names)) and set(names) == set(entries)
        for name in names:
            data = archive.read(name)
            assert len(data) == entries[name]["bytes"]
            assert hashlib.sha256(data).hexdigest() == entries[name]["sha256"]
            assert data == (CURRENT / "unpacked" / name).read_bytes()
    unpacked = CURRENT / "unpacked"
    reports = {}
    for phase in ("proofs", "controls", "regression", "artifact", "search", "baseline"):
        found = list(unpacked.rglob(phase + ".json"))
        # Only phase reports contain the current computation map.
        matching = [read(p) for p in found if "source_sha256" in read(p)]
        report, = matching
        assert report["status"] == "passed" and str(report["run_id"]) == str(run["id"])
        assert report["commit"] == run["head_sha"]
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
    print("Retained OpenEvolve evidence passed: current sources, 192 frozen inputs, six phases, five real model proposals")


if __name__ == "__main__":
    main()
