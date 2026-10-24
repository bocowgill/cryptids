#!/usr/bin/env python3
"""Retain finished proof artifacts when workflow metadata remains nonterminal.

This is transport/provenance work only. It does not execute Lean or a machine.
The immutable accepted retainer supplies the same streaming archive validation.
Workflow-final metadata must be appended separately, never substituted for the
status observed here. No proof or machine is accepted by this program.
"""
import argparse
import importlib.util
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--run', type=int, required=True)
    parser.add_argument('--artifact', required=True)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    path = ROOT / 'scripts/chess_goal_20261022/retain.py'
    spec = importlib.util.spec_from_file_location('accepted_evidence_transport', path)
    transport = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(transport)
    folder = args.output.resolve()
    scope = ROOT / 'docs/chess/campaign-2026-10-22/round-03/evidence'
    assert folder.is_relative_to(scope) and not folder.exists(), 'Use a fresh evidence directory'
    # Discover and verify the exact artifact before creating the destination.
    run_raw = transport.api(f'actions/runs/{args.run}')
    run = json.loads(run_raw)
    assert run['id'] == args.run
    listing = json.loads(transport.api(f'actions/runs/{args.run}/artifacts?per_page=100'))
    selected = [a for a in listing['artifacts'] if a['name'] == args.artifact]
    assert len(selected) == 1 and not selected[0]['expired']
    artifact = json.loads(transport.api(f'actions/artifacts/{selected[0]["id"]}'))
    assert artifact['id'] == selected[0]['id'] and artifact['name'] == args.artifact
    folder.mkdir(parents=True)
    (folder / 'run-api.json').write_bytes(run_raw)
    transport.save_json(folder / 'artifact-api.json', artifact)
    (folder / 'artifact.zip').write_bytes(
        transport.api(f'actions/artifacts/{artifact["id"]}/zip'))
    digest = transport.sha(folder / 'artifact.zip')
    assert artifact.get('digest') == 'sha256:' + digest, 'Artifact digest is required and must match'
    inventory = transport.extract(folder / 'artifact.zip', folder / 'unpacked')
    transport.save_json(folder / 'archive-entries.json', inventory)
    unpacked = folder / 'unpacked'
    manifest = json.loads((unpacked / 'source-manifest.json').read_text())
    summary = json.loads((unpacked / 'certificate-summary.json').read_text())
    assert str(manifest['run_id']) == str(args.run)
    assert manifest['commit'] == manifest['workflow_commit'] == run['head_sha']
    assert summary['status'] in ('bounded_obstruction', 'failed', 'numeric_local_passed',
                                 'source_profile_passed', 'lookup_cache_passed')
    retention = dict(schema='chess-proof-artifact-retention-v1',
        repository=transport.REPO, run_id=args.run, run_url=run['html_url'],
        workflow_status_at_retention=run['status'], run_conclusion=run['conclusion'],
        workflow_commit=run['head_sha'], computation_commit=manifest['commit'],
        artifact_id=artifact['id'], artifact_name=artifact['name'],
        artifact_sha256=digest, artifact_bytes=(folder / 'artifact.zip').stat().st_size,
        proof_stage_status=summary['status'], proof_artifact_only=True,
        workflow_final_metadata_pending=True,
        workflow_logs_missing_reason='Retain exact proof-stage logs now; append terminal workflow metadata later',
        evidence_scope='Transport and byte provenance only; no local proof/model execution',
        certifies_new_machine=False)
    transport.save_json(folder / 'retention.json', retention)
    print('Proof-stage artifact retained; final workflow metadata pending: ' + str(folder))


if __name__ == '__main__':
    main()
