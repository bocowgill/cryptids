#!/usr/bin/env python3
"""Retain official remote evidence; no proofs, models, fixtures or table computations."""
import hashlib
import json
from pathlib import Path
import subprocess
import sys
import zipfile

HERE = Path(__file__).resolve().parent
REPO = 'bocowgill/cryptids'

def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()

def api(endpoint, path):
    with path.open('wb') as output:
        subprocess.run(['gh', 'api', 'repos/' + REPO + endpoint], stdout=output, check=True)
    return json.loads(path.read_text()) if path.suffix == '.json' else None

if __name__ == '__main__':
    run_id = int(sys.argv[1])
    folder = HERE / (sys.argv[2] if len(sys.argv) > 2 else 'current')
    folder.mkdir(parents=True, exist_ok=True)
    run = api(f'/actions/runs/{run_id}', folder / 'run-api.json')
    assert run['status'] == 'completed' and run['head_branch'] == 'codex/chess-openevolve-pilot'
    inventory = api(f'/actions/runs/{run_id}/artifacts', folder / 'artifact-api.json')
    artifacts = inventory['artifacts']
    assert len(artifacts) == 1
    artifact = artifacts[0]
    assert artifact['workflow_run']['head_sha'] == run['head_sha']
    api(f'/actions/artifacts/{artifact["id"]}/zip', folder / 'artifact.zip')
    assert artifact['digest'] == 'sha256:' + sha(folder / 'artifact.zip')
    assert artifact['size_in_bytes'] == (folder / 'artifact.zip').stat().st_size
    api(f'/actions/runs/{run_id}/logs', folder / 'logs.zip')
    entries = {}
    with zipfile.ZipFile(folder / 'artifact.zip') as archive:
        assert archive.testzip() is None
        names = [i.filename for i in archive.infolist() if not i.is_dir()]
        assert len(names) == len(set(names))
        for name in names:
            parts = Path(name).parts
            assert not Path(name).is_absolute() and '..' not in parts
            data = archive.read(name)
            entries[name] = {'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()}
            target = folder / 'unpacked' / name
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_bytes(data)
    (folder / 'archive-entries.json').write_text(json.dumps(entries, indent=2) + '\n')
    (folder / 'retention.json').write_text(json.dumps({
        'run_id': run_id, 'commit': run['head_sha'], 'conclusion': run['conclusion'],
        'artifact_sha256': sha(folder / 'artifact.zip'), 'logs_sha256': sha(folder / 'logs.zip'),
        'entries': len(entries)}, indent=2) + '\n')
    print(json.dumps({'run': run_id, 'commit': run['head_sha'], 'entries': len(entries),
                      'conclusion': run['conclusion']}))
