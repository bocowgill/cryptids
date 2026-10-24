#!/usr/bin/env python3
"""Transport/provenance only; no local proof, model generation or counting."""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[2]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--run', required=True, type=int)
    parser.add_argument('--source', required=True)
    parser.add_argument('--iteration', required=True, type=int)
    args = parser.parse_args()
    assert 1 <= args.iteration <= 2
    spec = importlib.util.spec_from_file_location('pinned_transport',
        ROOT / 'scripts/chess_goal_20261022/retain.py')
    api = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(api)
    folder = ROOT / 'docs/chess/parsimony-printer-2026-10-24/proof-memory/evidence' / (
        'memory-' + str(args.iteration).zfill(2))
    assert not folder.exists(), 'Preserve old retention; choose a fresh iteration'
    run = json.loads(api.api(f'actions/runs/{args.run}'))
    assert run['status'] == 'completed' and run['head_sha'] == args.source
    folder.mkdir(parents=True)
    api.save_json(folder / 'run-api.json', run)
    (folder / 'jobs-api.json').write_bytes(api.api(f'actions/runs/{args.run}/jobs?per_page=100'))
    (folder / 'logs.zip').write_bytes(api.api(f'actions/runs/{args.run}/logs'))
    listing = json.loads(api.api(f'actions/runs/{args.run}/artifacts?per_page=100'))
    api.save_json(folder / 'artifact-list-api.json', listing)
    matches = [a for a in listing['artifacts'] if
               a['name'] == 'chess-parsimony-memory-' + args.source]
    record = dict(run_id=args.run, workflow_commit=args.source, conclusion=run['conclusion'],
                  logs_sha256=api.sha(folder / 'logs.zip'), no_local_machine_execution=True)
    if matches:
        assert len(matches) == 1 and not matches[0]['expired']
        artifact = json.loads(api.api(f'actions/artifacts/{matches[0]["id"]}'))
        api.save_json(folder / 'artifact-api.json', artifact)
        (folder / 'artifact.zip').write_bytes(api.api(f'actions/artifacts/{artifact["id"]}/zip'))
        assert artifact['digest'] == 'sha256:' + api.sha(folder / 'artifact.zip')
        api.save_json(folder / 'archive-entries.json',
                      api.extract(folder / 'artifact.zip', folder / 'unpacked'))
        manifest_path = folder / 'unpacked/source-manifest.json'
        if manifest_path.exists():
            manifest = json.loads(manifest_path.read_text())
            assert manifest['commit'] == manifest['workflow_commit'] == args.source
            assert str(manifest['run_id']) == str(args.run)
            for name, expected in manifest['source_sha256'].items():
                raw = subprocess.check_output(['git', 'show', args.source + ':' + name], cwd=ROOT)
                assert hashlib.sha256(raw).hexdigest() == expected, name
            record['producer_source_verified'] = True
        record['artifact_sha256'] = api.sha(folder / 'artifact.zip')
    else:
        record['artifact_missing'] = True
    api.save_json(folder / 'retention.json', record)
    print('Proof-memory logs/artifacts retained with exact producer provenance')


if __name__ == '__main__':
    main()
