"""Independent saved-output/hash review. Executes no candidate, Lean, model or fixture."""
import collections
import hashlib
import json
from pathlib import Path
import zipfile

ROOT = next(p for p in Path(__file__).resolve().parents
            if (p / "lean-toolchain").is_file() and (p / "Cryptids").is_dir())
REVIEW = Path(__file__).resolve().parent


def read(path):
    return json.loads(path.read_text())


def digest(data):
    return hashlib.sha256(data).hexdigest()


def sha(path):
    return digest(path.read_bytes())


def authenticate(folder, expected_name, expected_conclusion):
    run = read(folder / "run-api.json")
    retention = read(folder / "retention.json")
    artifact, = read(folder / "artifact-api.json")["artifacts"]
    assert run["status"] == "completed" and run["conclusion"] == expected_conclusion
    assert run["name"] == expected_name and run["head_branch"] == "codex/chess-openevolve-pilot"
    assert run["id"] == retention["run_id"] == artifact["workflow_run"]["id"]
    assert run["head_sha"] == retention["commit"] == artifact["workflow_run"]["head_sha"]
    assert artifact["digest"] == "sha256:" + sha(folder / "artifact.zip")
    assert artifact["size_in_bytes"] == (folder / "artifact.zip").stat().st_size
    assert retention["artifact_sha256"] == sha(folder / "artifact.zip")
    assert retention["logs_sha256"] == sha(folder / "logs.zip")
    entries = read(folder / "archive-entries.json")
    with zipfile.ZipFile(folder / "artifact.zip") as archive:
        assert archive.testzip() is None
        names = [i.filename for i in archive.infolist() if not i.is_dir()]
        assert len(names) == len(set(names)) and set(names) == set(entries)
        for name in names:
            assert not Path(name).is_absolute() and ".." not in Path(name).parts
            data = archive.read(name)
            assert entries[name] == {"bytes": len(data), "sha256": digest(data)}
            assert data == (folder / "unpacked" / name).read_bytes()
    with zipfile.ZipFile(folder / "logs.zip") as logs:
        assert logs.testzip() is None
        log_text = {name: logs.read(name).decode(errors="replace") for name in logs.namelist()}
    jobs = read(folder / "jobs-api.json")
    steps = {s["name"]: s for job in jobs["jobs"] for s in job["steps"]}
    return run, steps, entries, log_text


def phases_in(folder, names):
    phases = {}
    for name in names:
        path, = [p for p in folder.rglob(name + ".json") if "source_sha256" in read(p)]
        phases[name] = read(path)
    return phases


def main():
    current = ROOT / "docs/chess/openevolve-wide/evidence/current"
    run, steps, entries, logs = authenticate(current, "Chess OpenEvolve broader search", "success")
    assert run["id"] == 39598997807
    assert run["head_sha"] == "5af346f454a32b403a0dfd085160431b8d9cca77"
    assert len(entries) == 427
    for name in ["Probe compiler proof", "Preflight certificates and rejection controls",
                 "Install pinned search runtime", "Broad model search", "Full acceptance"]:
        assert steps[name]["conclusion"] == "success"
    u = current / "unpacked"
    phases = phases_in(u, ["probe", "controls", "search", "proofs", "results"])
    source = phases["proofs"]["source_sha256"]
    pins = read(ROOT / "docs/chess/openevolve-wide/baseline-pins.json")
    assert len(source) == 16 and len(pins) == 211
    commands = [read(p) for p in (u / "commands").glob("*.json")]
    for name, phase in phases.items():
        assert phase["status"] == "passed" and phase["phase"] == name
        assert phase["commit"] == run["head_sha"] and int(phase["run_id"]) == run["id"]
        assert phase["source_sha256"] == source and phase["frozen_source_sha256"] == pins
        for check in phase["checks"]:
            assert check in commands
            assert digest(check["output"].encode()) == check["output_sha256"]
            assert not check["timed_out"]
            negative = any(a.startswith("--negative-control") for a in check["argv"])
            assert check["exit"] == (1 if negative else 0)
    for path, h in dict(pins, **source).items():
        assert sha(ROOT / path) == h, path
    proof = phases["proofs"]
    assert (proof["states"], proof["previous_states"], proof["saving"], proof["body_states"],
            proof["initializer_states"]) == (390491642, 392046821, 1555179, 388936461, 1555181)
    assert proof["target"] == "NOT(WhiteCanAvoidLoss AND BlackCanAvoidLoss)"
    assert proof["full_table_streamed"] is False
    strict, audit, bad_axiom, bad_open, bad_generator, m7, pilot = proof["checks"]
    assert "--wfail" in strict["argv"] and "Build completed successfully" in strict["output"]
    assert "Audited 69 OpenEvolveWide foundation roots and 48854 dependencies" in audit["output"]
    assert "Permitted axioms: #[propext, Classical.choice, Quot.sound]" in audit["output"]
    assert "Meta certificate generator roots outside safe roots: 0" in audit["output"]
    assert "Forbidden axiom: sorryAx" in bad_axiom["output"]
    assert "The open chess conjecture is a dependency" in bad_open["output"]
    assert "Proof generator is a mathematical dependency:" in bad_generator["output"]
    assert m7["argv"] == ["python3", "scripts/verify_chess_m7.py", "--proofs"]
    assert "Chess M7 quotient proof verification passed" in m7["output"]
    assert pilot["argv"] == ["python3", "scripts/chess_openevolve/verify.py", "--proofs"]
    assert "Chess OpenEvolve proof verification passed" in pilot["output"]
    all_logs = "\n".join(logs.values())
    for marker in ["Build completed successfully (3913 jobs).", "Broader OpenEvolve rejection controls passed",
                   "Broader OpenEvolve search completed", "Audited 69 OpenEvolveWide foundation roots and 48854 dependencies",
                   "Chess M7 quotient proof verification passed", "Chess OpenEvolve proof verification passed"]:
        assert marker in all_logs
    models = [json.loads(line) for line in (u / "search/model.jsonl").read_text().splitlines()]
    evaluations = [json.loads(line) for line in (u / "search/evaluations.jsonl").read_text().splitlines()]
    result = read(u / "search/result.json")
    model_pin = read(ROOT / "docs/chess/openevolve-wide/model-pin.json")
    assert len(models) == 24 and len(evaluations) == 25
    assert len({m["response"] for m in models}) == 18
    assert len({m["system"] for m in models}) == 1
    assert len({m["pid"] for m in models}) == 1
    for m in models:
        assert m["remote"] and m["model"] == model_pin["model"] and m["revision"] == model_pin["revision"]
        assert m["constrained_response_set"] is False and m["explicit_solution_in_system_prompt"] is False
        assert m["feedback_may_expose_supplied_proof_identities"] is True
        assert len(m["input_token_ids"]) == m["usage"]["prompt_tokens"] <= 4096
        assert len(m["output_token_ids"]) == m["usage"]["completion_tokens"] <= 256
        assert m["usage"]["total_tokens"] == len(m["input_token_ids"]) + len(m["output_token_ids"])
        assert not m["prompt_truncated"]
    seed = (ROOT / "scripts/chess_openevolve_wide/seed.py").read_text().strip()
    assert evaluations[0]["code"].strip() == seed
    certified = [e for e in evaluations if e["certified"]]
    assert len(certified) == 6
    for i, e in enumerate(evaluations):
        assert digest(e["code"].encode()) == e["code_sha256"]
        if i:
            assert e["code"].strip() in models[i - 1]["response"]
        if e["certified"]:
            assert e["code"].strip() == seed and e["states"] == 392046821 and e["saving"] == 0
            cert = e["proof"]
            assert cert["exit"] == 0 and not ("warning:" in cert["stdout"] + cert["stderr"])
            assert digest(cert["source"].encode()) == cert["source_sha256"]
            assert "-DwarningAsError=true" in cert["argv"]
            assert (u / "search" / (cert["source_sha256"] + ".lean")).read_text() == cert["source"]
            assert e["states"] == 388936461 + cert["initializer_states"]
    assert result["status"] == "completed" and result["requests"] == 24
    assert result["installed_openevolve_source"]["vcs_info"]["commit_id"] == "59dfe764b5ab4478ac00214432fcac33bbe2bf4b"
    assert result["tokens"] == phases["search"]["tokens"] == sum(m["usage"]["total_tokens"] for m in models) == 20098
    assert result["paid_api_calls"] == 0 and result["billing_amount_measured"] is False
    assert result["autonomous_discovery_claim"] is False
    measured = phases["results"]["measured"]
    assert measured["best_states"] == 392046821 and measured["saving"] == 0
    assert measured["target_met"] is False and measured["selected_plan_equals_actual_initializer"] is False
    assert phases["results"]["checks"] == [] and not list(u.rglob("selected-plan-bridge.lean"))
    assert result["best_code"].strip() == measured["best_code"].strip() == seed
    checkpoints = list(u.rglob("checkpoint_*/metadata.json"))
    assert len(checkpoints) == 24
    controls = read(u / "controls-detail.json")
    assert len(controls["positives"]) == 2 and len(controls["rejections"]) == 14
    stages = collections.Counter(r["stage"] for r in controls["rejections"])
    assert stages == {"syntax": 6, "semantic": 4, "cost": 1, "unproved": 1, "timeout": 1, "corrupt-proof": 1}
    for p in controls["positives"]:
        assert p["fixtures"] == {"binary_inputs": 127, "maximum_length": 6, "proof": False}
        assert p["proof"]["exit"] == 0 and p["proof"]["stdout"] == p["proof"]["stderr"] == ""
        assert digest(p["proof"]["source"].encode()) == p["proof"]["source_sha256"]
    recipe_path = ROOT / "artifacts/chess_openevolve_wide/table-map.json"
    recipe = read(recipe_path)
    assert (recipe["candidate_states"], recipe["source_states"], recipe["saved_states"]) == (390491642, 392046821, 1555179)
    assert recipe["candidate_prefix_states"] == recipe["input_bits"] + 1 == 1555181
    assert recipe["source_prefix_states"] == 2 * recipe["input_bits"] == 3110360
    assert recipe["body_states"] + recipe["candidate_prefix_states"] == recipe["candidate_states"]
    assert recipe["source_prefix_states"] - recipe["candidate_prefix_states"] == recipe["saved_states"]
    assert (recipe["symbols"], recipe["initial_state"], recipe["blank_symbol"]) == (2, 0, 0)
    assert recipe["machine"] == "ConjectureMachines.Machines.chess_openevolve_wide"
    assert recipe["full_table_streamed"] is recipe["new_expanded_payload"] is False
    assert sha(ROOT / recipe["source_recipe"]) == recipe["source_recipe_sha256"]
    # Authenticate the original pilot's retained partial run and separate completed
    # baseline receipt; do not relabel the original timeout as a successful run.
    legacy = ROOT / "docs/chess/openevolve/evidence"
    core_run, core_steps, core_entries, _ = authenticate(legacy / "current", "Chess OpenEvolve pilot", "failure")
    base_run, base_steps, base_entries, _ = authenticate(legacy / "baseline", "Chess OpenEvolve baseline completion", "success")
    assert core_steps["Check frozen M1 through M5 regression"]["conclusion"] == "failure"
    assert base_steps["Check frozen M1 through M5 regression"]["conclusion"] == "success"
    old_phases = phases_in(legacy / "current/unpacked", ["proofs", "controls", "regression", "artifact", "search"])
    old_phases.update(phases_in(legacy / "baseline/unpacked", ["baseline"]))
    old_source = old_phases["proofs"]["source_sha256"]
    old_frozen = read(ROOT / "docs/chess/openevolve/baseline-pins.json")
    assert len(old_frozen) == 192
    for name, phase in old_phases.items():
        expected = base_run if name == "baseline" else core_run
        assert phase["status"] == "passed" and phase["commit"] == expected["head_sha"]
        assert int(phase["run_id"]) == expected["id"]
        assert phase["source_sha256"] == old_source and phase["frozen_source_sha256"] == old_frozen
    for path, h in dict(old_frozen, **old_source).items():
        assert sha(ROOT / path) == h
    baseline_check, = old_phases["baseline"]["checks"]
    assert baseline_check["exit"] == 0 and not baseline_check["timed_out"]
    assert "Chess M5 executable verification passed" in baseline_check["output"]
    assert "Chess M6 baseline verification passed" in baseline_check["output"]
    assert digest(baseline_check["output"].encode()) == baseline_check["output_sha256"]
    assert old_phases["baseline"]["core_run_id"] == core_run["id"]
    histories = []
    for folder in sorted((ROOT / "docs/chess/openevolve-wide/evidence/history").iterdir()):
        if not (folder / "retention.json").is_file():
            continue
        old_run, _, old_entries, old_logs = authenticate(folder, "Chess OpenEvolve broader search", "failure")
        assert not any(name.endswith("model.jsonl") for name in old_entries)
        assert not any("Sampled model:" in text for text in old_logs.values())
        histories.append({"run_id": old_run["id"], "commit": old_run["head_sha"],
                          "conclusion": "failure", "model_request_evidence": False,
                          "artifact_sha256": sha(folder / "artifact.zip")})
    public_path = ROOT / "docs/chess/openevolve-wide/results.json"
    public = read(public_path)
    assert public["status"] == "remote_complete" and public["remote_run_id"] == run["id"]
    assert public["computation_commit"] == run["head_sha"] and public["model_search"] == measured
    assert public["engineered_construction"]["states"] == 390491642
    assert public["engineered_construction"]["model_discovered"] is False
    assert public["engineered_construction"]["optimization_supplied_before_search"] is True
    assert public["engineered_construction"]["table_recipe_sha256"] == sha(recipe_path)
    assert public["evidence"]["source_sha256"] == source and public["evidence"]["frozen_source_sha256"] == pins
    runtime = public["search_runtime"]
    assert runtime["framework_seconds"] == result["elapsed_seconds"]
    assert runtime["model_seconds_sum"] == sum(m["seconds"] for m in models)
    assert runtime["tokens_input"] == sum(m["usage"]["prompt_tokens"] for m in models)
    assert runtime["tokens_output"] == sum(m["usage"]["completion_tokens"] for m in models)
    assert runtime["max_input_tokens"] == max(m["usage"]["prompt_tokens"] for m in models)
    assert runtime["max_output_tokens"] == max(m["usage"]["completion_tokens"] for m in models)
    public_docs = ["docs/chess/openevolve-wide/RESULTS.md", "docs/chess/openevolve-wide/RESUME.md",
                   "docs/chess/openevolve-wide/results.json", "docs/chess/openevolve-wide/RESEARCH.md",
                   "docs/chess/openevolve-wide/DESIGN.md", "ROADMAP.md"]
    receipt = {
        "schema": 1, "status": "passed", "review_type": "independent advisory saved-evidence review",
        "evidence_run_updated_utc": run["updated_at"],
        "local_heavy_computation": False, "live_network_authentication_performed": False,
        "authentication_scope": "retained official API metadata, digest-bound archives, extracted bytes and saved logs",
        "run_id": run["id"], "computation_commit": run["head_sha"], "conclusion": run["conclusion"],
        "artifact_sha256": sha(current / "artifact.zip"), "logs_sha256": sha(current / "logs.zip"),
        "archive_entries_checked": len(entries), "phase_reports_checked": list(phases),
        "computation_source_sha256": source, "frozen_inputs_checked": len(pins), "frozen_mismatches": [],
        "actual_engineered_machine": {"states": 390491642, "saving": 1555179, "model_generated": False,
                                      "formal_evidence": "remote strict build plus safe dependency audit"},
        "search_outcome": {"requests": 24, "evaluations": 25, "distinct_raw_proposals": 18,
                           "certified_evaluations": 6, "all_certified_codes_equal_seed": True,
                           "best_states": 392046821, "saving": 0, "target_met": False,
                           "selected_plan_bridge_invoked": False, "checkpoints": 24,
                           "tokens": 20098, "framework_elapsed_seconds": result["elapsed_seconds"],
                           "model_generation_seconds": sum(m["seconds"] for m in models),
                           "paid_api_calls": 0, "runner_billing_measured": False},
        "controls": {"positive_schedules": 2, "binary_inputs_per_positive": 127, "rejection_stage_counts": dict(stages)},
        "native_audit": {"roots": 69, "dependencies": 48854, "permitted_axioms": ["propext", "Classical.choice", "Quot.sound"], "negative_controls": 3},
        "table_descriptor_sha256": sha(recipe_path), "expanded_table_or_full_sweep": False,
        "legacy_receipts": {"pilot_core_run": core_run["id"], "pilot_core_conclusion": "failure",
                            "pilot_core_archive_entries_checked": len(core_entries),
                            "baseline_completion_run": base_run["id"], "baseline_completion_conclusion": "success",
                            "baseline_archive_entries_checked": len(base_entries), "frozen_legacy_inputs_checked": 192},
        "retained_failed_wide_attempts": histories,
        "reviewed_public_document_sha256": {p: sha(ROOT / p) for p in public_docs},
        "checker_sha256": sha(Path(__file__)),
    }
    (REVIEW / "final-evidence-receipt.json").write_text(json.dumps(receipt, indent=2) + "\n")
    print(json.dumps({"status": "passed", "run_id": run["id"], "archive_entries": len(entries),
                      "source_hashes": len(source), "frozen_hashes": len(pins),
                      "search_best_states": 392046821, "search_saving": 0,
                      "engineered_machine_states": 390491642, "engineered_saving": 1555179}))


if __name__ == "__main__":
    main()
