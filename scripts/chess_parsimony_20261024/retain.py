#!/usr/bin/env python3
"""Transport/provenance only; never generate, count or simulate a machine locally."""
import argparse
import importlib.util
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--run', type=int, required=True)
    parser.add_argument('--source', required=True)
    parser.add_argument('--name', required=True)
    args = parser.parse_args()
    assert args.name in ('probe-01', 'pilot-02', 'diagnosis-03', 'validation-04',
                         'correction-05')
    path = ROOT / 'scripts/chess_goal_20261022/retain.py'
    spec = importlib.util.spec_from_file_location('pinned_transport', path)
    api = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(api)
    folder = ROOT / 'docs/chess/parsimony-printer-2026-10-24/evidence' / args.name
    assert not folder.exists(), 'Preserve old retention; use a fresh destination'
    run = json.loads(api.api(f'actions/runs/{args.run}'))
    assert run['status'] == 'completed' and run['head_sha'] == args.source
    listing = json.loads(api.api(f'actions/runs/{args.run}/artifacts?per_page=100'))
    matches = [a for a in listing['artifacts'] if
               a['name'] == 'chess-parsimony-printer-' + args.source]
    assert len(matches) == 1 and not matches[0]['expired']
    artifact = json.loads(api.api(f'actions/artifacts/{matches[0]["id"]}'))
    folder.mkdir(parents=True)
    api.save_json(folder / 'run-api.json', run)
    api.save_json(folder / 'artifact-api.json', artifact)
    (folder / 'jobs-api.json').write_bytes(api.api(f'actions/runs/{args.run}/jobs?per_page=100'))
    (folder / 'artifact.zip').write_bytes(api.api(f'actions/artifacts/{artifact["id"]}/zip'))
    assert artifact['digest'] == 'sha256:' + api.sha(folder / 'artifact.zip')
    (folder / 'logs.zip').write_bytes(api.api(f'actions/runs/{args.run}/logs'))
    inventory = api.extract(folder / 'artifact.zip', folder / 'unpacked')
    api.save_json(folder / 'archive-entries.json', inventory)
    summary = json.loads((folder / 'unpacked/pilot-summary.json').read_text())
    manifest = json.loads((folder / 'unpacked/source-manifest.json').read_text())
    assert manifest['commit'] == manifest['workflow_commit'] == args.source
    assert str(manifest['run_id']) == str(args.run)
    for name, expected in manifest['source_sha256'].items():
        assert api.sha(ROOT / name) == expected, 'Producer source differs: ' + name
    api.save_json(folder / 'retention.json', dict(run_id=args.run,
        workflow_commit=args.source, conclusion=run['conclusion'],
        artifact_sha256=api.sha(folder / 'artifact.zip'),
        logs_sha256=api.sha(folder / 'logs.zip'), pilot_status=summary['status'],
        no_local_machine_execution=True, new_accepted_machine=False))
    print('Parsimony remote artifact retained with source and GitHub digest provenance')


if __name__ == '__main__':
    main()
