#!/usr/bin/env python3
"""Independent final M7 seal: metadata, hashes and saved logs only.

Print a seal only after all actual remote component and regression reports exist.
This script never invokes Lean, a native exporter or a table extraction.
"""
from contextlib import redirect_stdout
from pathlib import Path
import hashlib
import io
import json
import runpy
import sys

sys.dont_write_bytecode = True
ROOT = next(p for p in Path(__file__).resolve().parents
            if (p / "scripts/verify_chess_m7.py").is_file())
EVIDENCE = ROOT / "docs/chess/m7/evidence"
CORE = EVIDENCE / "current"
REGRESSION = EVIDENCE / "regressions"
RAW = "47a9730ccdcbdf0983951be91993ce1470b0109e75a347696786b70eda011c81"
IMPLEMENTATION = "088988f81248c3b2270d6d4549dd3ab29296c3a9"
RECOVERY = "1c3be1cb21ae223794c51f569dd53d12f7991cca"


def read(path):
    return json.loads(path.read_text())


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    required = ("baseline.json", "regression-checkout.json", "run.json", "run-api.json",
                "artifact.zip", "artifact-api.json", "archive-entries.json", "freeze.json")
    missing = [name for name in required if not (REGRESSION / name).is_file()]
    if missing:
        raise SystemExit("R2 pending actual retained regression evidence: " + ", ".join(missing))
    # This public checker is independently source-reviewed. It inspects only
    # saved JSON/archives/hashes and explicitly preserves the failed core run.
    captured = io.StringIO()
    with redirect_stdout(captured):
        runpy.run_path(str(EVIDENCE / "check_evidence.py"))
    checked = json.loads(captured.getvalue())
    assert checked["status"] == "passed"
    verifier = runpy.run_path(str(ROOT / "scripts/verify_chess_m7.py"))
    pins = verifier["pins"]()
    assert len(pins) == 192 and pins == checked["source_sha256"]
    reports = {name: read(CORE / (name + ".json")) for name in ("proofs", "definitions", "table")}
    reports["baseline"] = read(REGRESSION / "baseline.json")
    assert all(report["source_sha256"] == pins for report in reports.values())
    assert reports["baseline"]["checks"][0]["argv"] == ["python3", "scripts/verify_chess_m6.py", "--baseline"]
    assert reports["baseline"]["checks"][0]["exit"] == 0
    assert "Chess M6 baseline verification passed" in reports["baseline"]["checks"][0]["output"]
    frozen = read(ROOT / "docs/chess/m7/baseline-pins.json")
    assert len(frozen) == 172 and all(pins[p] == h for p, h in frozen.items())
    table = reports["table"]
    manifest = read(CORE / "candidate-table-manifest.json")
    canonical_manifest = (json.dumps(manifest, sort_keys=True, indent=2) + "\n").encode()
    manifest_hash = hashlib.sha256(canonical_manifest).hexdigest()
    assert manifest_hash == sha(CORE / "candidate-table-manifest.json")
    assert manifest_hash == table["comparison"]["plan"]["compare_manifest_sha256"]
    assert manifest["raw_sha256"] == RAW
    for index, part in enumerate(manifest["parts"]):
        assert part["start_state"] == 1000000 * index
        assert part["rows"] == min(1000000, 392046822 - part["start_state"])
    for mode in ("pack", "comparison"):
        journal = table[mode]
        assert not journal["attempts"][0]["resume"]
        assert len(journal["plan"]["producer"]["pins"]) == len(pins) + 1
    assert table["pack"]["plan"]["producer"]["argv"][1].endswith("scripts/chess_m7/quotient_table.py")
    assert table["comparison"]["plan"]["producer"]["argv"][0].endswith("/.lake/build/bin/chess_m7_reference")
    controls = read(CORE / "controls.json")
    expected = {
        "M7BadProposition": "Compiled declaration mismatch: ConjectureMachines.Semantics.ChessM7.statement",
        "M7BadTransition": "Compiled declaration mismatch: Chess.Compilation.Templates.writeDataChunk0000",
        "M7BadFrozenInitial": "Compiled declaration mismatch: Chess.initialPosition",
        "M7BadReferenceBridge": "Unexpected standalone reference-goal bridge",
    }
    by_label = {c["label"]: c for c in controls["checks"]}
    assert len(by_label) == 8
    for label, marker in expected.items():
        assert by_label[label + "-kernel-build"]["exit"] == 0
        comparison = by_label[label + "-exact-comparison"]
        assert comparison["exit"] == 1 and comparison["expected_marker"] == marker
    mapping = read(ROOT / "artifacts/chess_m7/table-map.json")
    assert mapping["initial_node"] == 0 and mapping["stores"] == 5
    assert mapping["prefix_states"] == 3110360 and mapping["post_states"] == 194468236
    assert mapping["baseline_states"] == 392046832 and mapping["candidate_states"] == 392046822
    helper = ".github/workflows/chess_m7_regressions.yml"
    assert sha(ROOT / helper) == checked["regression_workflow_sha256"]
    assert checked["implementation_commit"] == IMPLEMENTATION and checked["regression_commit"] == RECOVERY
    assert checked["core_workflow_conclusion"] == "failure"
    assert checked["regression_workflow_conclusion"] == "success"
    # Seal every retained evidence file already present, excluding this seal
    # itself and the reviewer copies that are supplied below under fixed names.
    evidence_files = {str(p.relative_to(ROOT)): sha(p) for p in sorted(EVIDENCE.rglob("*"))
                      if p.is_file() and "review" not in p.relative_to(EVIDENCE).parts}
    private = Path(__file__).resolve().parent
    reviewer_files = {}
    for name in ("validate_review.py", "current-components.json",
                 "finite_map_review.py", "finite_map_result.json"):
        path = private / name
        assert path.is_file()
        reviewer_files["docs/chess/m7/evidence/review/" + name] = sha(path)
    seal = {
        "format": "chess-m7-independent-review-seal-v1",
        "disposition": "correct; R1 and R2 accepted for the pinned construction and evidence",
        "review_scope": "independent adversarial mathematical/source review and light validation of actual remote reports; no local Lean/native/full-table execution",
        "target": "Halts chess_m7 iff NOT (Chess.WhiteCanAvoidLoss AND Chess.BlackCanAvoidLoss)",
        "baseline_states": 392046832, "candidate_states": 392046822, "saved_states": 10,
        "symbols": 2, "ordinary_initial_state": 0, "blank_symbol": 0,
        "halting": "missing transition", "paid_initializer_states_and_steps": 3110360,
        "implementation_commit": IMPLEMENTATION, "regression_commit": RECOVERY,
        "core_source_sha256": pins, "frozen_baseline_input_count": 172,
        "separate_orchestration_sha256": {helper: sha(ROOT / helper)},
        "core_workflow": {"run": 39506528766, "overall_conclusion": "failure",
                          "accepted_components": ["proofs", "definitions", "table"],
                          "later_baseline_setup_failure_retained": True},
        "regression_workflow": {"run": 39527113752, "overall_conclusion": "success",
                                "accepted_component": "unchanged baseline wrapper"},
        "original_ci": {"run": 39506528743, "attempt": 2, "overall_conclusion": "success"},
        "official_core_archive_sha256": checked["core_artifact_sha256"],
        "official_regression_archive_sha256": checked["regression_artifact_sha256"],
        "candidate_table": {"states": 392046822, "ranges": 393, "raw_sha256": RAW,
                            "manifest_sha256": manifest_hash, "comparison": "every-row-byte",
                            "fresh_gzip_reproduction": True,
                            "encoding": "retained literal M6 payload plus fixed numeric quotient map"},
        "semantic_mutants": 4, "cached_bootstrap_excluded_from_acceptance": True,
        "review_report_sha256": sha(ROOT / "docs/chess/m7/REVIEW.md"),
        "durable_evidence_sha256": evidence_files, "reviewer_evidence_sha256": reviewer_files,
        "limitations": ["native printing, file I/O, hashes and gzip are the artifact-verification boundary",
                        "bounded referee checks are not the universal proof",
                        "no initial chess value, minimality or practical runtime improvement is claimed"],
    }
    print(json.dumps(seal, indent=2) + "\n", end="")


if __name__ == "__main__":
    main()
