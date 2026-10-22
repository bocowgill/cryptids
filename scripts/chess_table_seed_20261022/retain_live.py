#!/usr/bin/env python3
"""Retain uploaded diagnostics while run status lags; never final acceptance evidence."""
import argparse
import importlib.util
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--run', type=int, required=True)
    parser.add_argument('--artifact', type=int, required=True)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    spec = importlib.util.spec_from_file_location('retention', ROOT / 'scripts/chess_goal_20261022/retain.py')
    retention = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(retention)
    folder = args.output.resolve()
    assert folder.is_relative_to(ROOT / 'docs/chess/campaign-2026-10-22') and not folder.exists()
    run = retention.api(f'actions/runs/{args.run}')
    artifact = retention.api(f'actions/artifacts/{args.artifact}')
    r, a = json.loads(run), json.loads(artifact)
    assert r['id'] == args.run and a['id'] == args.artifact and not a['expired']
    assert a['workflow_run']['id'] == args.run
    archive = retention.api(f'actions/artifacts/{args.artifact}/zip')
    folder.mkdir(parents=True)
    (folder / 'run-api-pending.json').write_bytes(run)
    (folder / 'artifact-api.json').write_bytes(artifact)
    (folder / 'artifact.zip').write_bytes(archive)
    digest = retention.sha(folder / 'artifact.zip')
    assert a['digest'] == 'sha256:' + digest
    inventory = retention.extract(folder / 'artifact.zip', folder / 'unpacked')
    retention.save_json(folder / 'archive-entries.json', inventory)
    manifest = json.loads((folder / 'unpacked/source-manifest.json').read_text())
    assert str(manifest['run_id']) == str(args.run)
    retention.save_json(folder / 'PENDING.json', dict(
        status='UPLOADED_DIAGNOSTICS_ONLY', run_id=args.run, artifact_id=args.artifact,
        artifact_name=a['name'], artifact_sha256=digest, computation_commit=manifest['commit'],
        observed_run_status=r['status'], final_run_logs_and_provenance_required=True,
        new_accepted_machine=False, local_model_execution=False))
    print('Uploaded remote diagnostics retained; final provenance pending')


if __name__ == '__main__':
    main()
