#!/usr/bin/env python3
"""Light saved-evidence verification only: never runs a proof, model, fixture or table sweep."""
import hashlib
import json
from pathlib import Path
import subprocess
import sys
import zipfile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]


def read(path):
    return json.loads(path.read_text())


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def archive(folder):
    run = read(folder / "run-api.json")
    retained = read(folder / "retention.json")
    assert run["status"] == "completed" and run["conclusion"] == "success"
    assert run["name"] == "Chess OpenEvolve broader search"
    assert run["head_branch"] == "codex/chess-openevolve-pilot"
    assert run["id"] == retained["run_id"] and run["head_sha"] == retained["commit"]
    artifact, = read(folder / "artifact-api.json")["artifacts"]
    assert artifact["workflow_run"]["id"] == run["id"]
    assert artifact["workflow_run"]["head_sha"] == run["head_sha"]
    assert artifact["digest"] == "sha256:" + sha(folder / "artifact.zip")
    assert artifact["size_in_bytes"] == (folder / "artifact.zip").stat().st_size
    assert retained["artifact_sha256"] == sha(folder / "artifact.zip")
    assert retained["logs_sha256"] == sha(folder / "logs.zip")
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
    steps = {s["name"]: s for j in read(folder / "jobs-api.json")["jobs"] for s in j["steps"]}
    for name in ["Probe compiler proof", "Install pinned search runtime", "Broad model search", "Full acceptance"]:
        assert steps[name]["conclusion"] == "success", name
    return run


def main():
    # This checker only authenticates already completed frozen regression evidence.
    subprocess.run([sys.executable, str(ROOT / "docs/chess/openevolve/evidence/check_evidence.py")],
                   cwd=ROOT, check=True)
    folder = HERE / "current"
    run = archive(folder)
    unpacked = folder / "unpacked"
    phases = {}
    for phase in ["probe", "search", "controls", "proofs", "results"]:
        paths = [p for p in unpacked.rglob(phase + ".json") if "source_sha256" in read(p)]
        path, = paths
        report = read(path)
        assert report["status"] == "passed" and report["phase"] == phase
        assert int(report["run_id"]) == run["id"] and report["commit"] == run["head_sha"]
        for check in report["checks"]:
            assert hashlib.sha256(check["output"].encode()).hexdigest() == check["output_sha256"]
            assert not check["timed_out"]
            assert check["exit"] == (1 if any(a.startswith("--negative-control") for a in check["argv"]) else 0)
        phases[phase] = report
    pins = read(ROOT / "docs/chess/openevolve-wide/baseline-pins.json")
    assert len(pins) == 211
    source = phases["proofs"]["source_sha256"]
    for phase in phases.values():
        assert phase["source_sha256"] == source and phase["frozen_source_sha256"] == pins
    for path, digest in dict(pins, **source).items():
        assert sha(ROOT / path) == digest, "Changed reviewed input: " + path
    assert phases["proofs"]["states"] == 390491642
    assert phases["proofs"]["saving"] == 1555179
    assert phases["proofs"]["initializer_states"] == 1555181
    assert phases["proofs"]["body_states"] + 1555181 == 390491642
    assert phases["proofs"]["full_table_streamed"] is False
    model_path, = unpacked.rglob("model.jsonl")
    evaluations_path, = unpacked.rglob("evaluations.jsonl")
    model = [json.loads(line) for line in model_path.read_text().splitlines()]
    evaluations = [json.loads(line) for line in evaluations_path.read_text().splitlines()]
    assert len(model) == 24 and len(evaluations) >= 1
    pin = read(ROOT / "docs/chess/openevolve-wide/model-pin.json")
    for m in model:
        assert m["remote"] and m["model"] == pin["model"] and m["revision"] == pin["revision"]
        assert m["constrained_response_set"] is False
        assert len(m["input_token_ids"]) == m["usage"]["prompt_tokens"] <= 4096
        assert len(m["output_token_ids"]) == m["usage"]["completion_tokens"] <= 256
        assert m["usage"]["total_tokens"] == len(m["input_token_ids"]) + len(m["output_token_ids"])
    certified = [e for e in evaluations if e["certified"]]
    assert certified
    for e in certified:
        proof = e["proof"]
        assert proof["exit"] == 0 and not ("warning:" in proof["stdout"] + proof["stderr"])
        assert hashlib.sha256(proof["source"].encode()).hexdigest() == proof["source_sha256"]
        assert e["states"] == 388936461 + proof["initializer_states"]
        assert e["saving"] == 392046821 - e["states"]
    for e in evaluations:
        assert hashlib.sha256(e["code"].encode()).hexdigest() == e["code_sha256"]
    seed = (ROOT / "scripts/chess_openevolve_wide/seed.py").read_text().strip()
    assert evaluations[0]["code"].strip() == seed and evaluations[0]["certified"]
    assert all(e["code"].strip() == seed or any(e["code"].strip() in m["response"] for m in model)
               for e in evaluations)
    results_path, = [p for p in unpacked.rglob("result.json") if "installed_openevolve_source" in read(p)]
    result = read(results_path)
    assert result["status"] == "completed" and result["requests"] == 24
    assert result["installed_openevolve_source"]["vcs_info"]["commit_id"] == "59dfe764b5ab4478ac00214432fcac33bbe2bf4b"
    assert result["tokens"] == phases["search"]["tokens"] == sum(m["usage"]["total_tokens"] for m in model)
    assert result["paid_api_calls"] == 0 and result["autonomous_discovery_claim"] is False
    measured = phases["results"]["measured"]
    assert measured["best_states"] == min(e["states"] for e in certified)
    assert measured["target_met"] == (392046821 - measured["best_states"] >= 1000000)
    if measured["target_met"]:
        bridge, = unpacked.rglob("selected-plan-bridge.lean")
        assert sha(bridge) == measured["selected_plan_bridge_sha256"]
        assert measured["selected_plan_equals_actual_initializer"] is True
        assert phases["results"]["checks"][0]["exit"] == 0
    checkpoints = sorted(unpacked.rglob("checkpoint_*/metadata.json"))
    assert len(checkpoints) == 24
    controls, = unpacked.rglob("controls-detail.json")
    controls = read(controls)
    assert len(controls["positives"]) == 2 and len(controls["rejections"]) == 14
    assert {r["stage"] for r in controls["rejections"]} == {
        "syntax", "semantic", "cost", "unproved", "timeout", "corrupt-proof"}
    recipe = read(ROOT / "artifacts/chess_openevolve_wide/table-map.json")
    assert recipe["candidate_states"] == phases["proofs"]["states"]
    assert recipe["source_states"] - recipe["candidate_states"] == recipe["saved_states"] == 1555179
    assert recipe["candidate_prefix_states"] == recipe["input_bits"] + 1 == 1555181
    assert recipe["source_prefix_states"] == 2 * recipe["input_bits"]
    assert recipe["body_states"] + recipe["candidate_prefix_states"] == recipe["candidate_states"]
    assert sha(ROOT / recipe["source_recipe"]) == recipe["source_recipe_sha256"]
    summary = dict(status="passed", run_id=run["id"], commit=run["head_sha"],
        artifact_sha256=sha(folder / "artifact.zip"), source_sha256=source,
        frozen_inputs=211, phases=5, model_requests=24, tokens=result["tokens"],
        actual_machine_states=390491642, saving=1555179, model_search=measured,
        table_recipe_sha256=sha(ROOT / "artifacts/chess_openevolve_wide/table-map.json"),
        full_table_streamed=False, supplied_optimization_and_proof_support=True,
        autonomous_discovery_claim=False)
    (HERE / "evidence-check.json").write_text(json.dumps(summary, indent=2) + "\n")
    print("Broader OpenEvolve retained evidence passed")


if __name__ == "__main__":
    main()
