#!/usr/bin/env python3
"""Retain remote artifacts and provenance; never run a compiler/model or recount rows."""
import argparse
import hashlib
import json
from pathlib import Path, PurePosixPath
import stat
import subprocess
import zipfile

ROOT = Path(__file__).resolve().parents[2]
REPO = 'bocowgill/cryptids'


def sha(path):
    digest = hashlib.sha256()
    with Path(path).open('rb') as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b''):
            digest.update(block)
    return digest.hexdigest()


def api(endpoint):
    return subprocess.check_output(['gh', 'api', 'repos/' + REPO + '/' + endpoint], cwd=ROOT)


def save_json(path, data):
    path.write_text(json.dumps(data, indent=2) + '\n')


def extract(archive_path, destination):
    inventory, seen = {}, set()
    with zipfile.ZipFile(archive_path) as archive:
        for member in archive.infolist():
            name = member.filename.rstrip('/')
            relative = PurePosixPath(name)
            assert name and not relative.is_absolute() and relative.as_posix() == name
            assert '..' not in relative.parts and '.' not in relative.parts
            assert '\\' not in name and ':' not in name and name not in seen
            assert not stat.S_ISLNK(member.external_attr >> 16) and not member.flag_bits & 1
            seen.add(name)
            if member.is_dir():
                continue
            path = destination / name
            path.parent.mkdir(parents=True, exist_ok=True)
            with archive.open(member) as source, path.open('wb') as target:
                for block in iter(lambda: source.read(1024 * 1024), b''):
                    target.write(block)
            assert path.stat().st_size == member.file_size
            inventory[name] = dict(bytes=member.file_size, sha256=sha(path), crc32=member.CRC,
                                   compressed_bytes=member.compress_size, compression=member.compress_type)
    return inventory


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--run', type=int, required=True)
    parser.add_argument('--artifact', required=True)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    folder = args.output.resolve()
    scope = ROOT / 'docs/chess/campaign-2026-10-22'
    assert folder.is_relative_to(scope) and not folder.exists(), 'Use a fresh campaign evidence directory'
    folder.mkdir(parents=True)
    run_raw = api(f'actions/runs/{args.run}')
    run = json.loads(run_raw)
    assert run['id'] == args.run and run['status'] == 'completed', 'Retain final packet after run completes'
    (folder / 'run-api.json').write_bytes(run_raw)
    (folder / 'jobs-api.json').write_bytes(api(f'actions/runs/{args.run}/jobs?per_page=100'))
    listing = json.loads(api(f'actions/runs/{args.run}/artifacts?per_page=100'))
    selected = [a for a in listing['artifacts'] if a['name'] == args.artifact]
    assert len(selected) == 1 and not selected[0]['expired'], 'Expected one unexpired artifact'
    artifact = json.loads(api(f'actions/artifacts/{selected[0]["id"]}'))
    assert artifact['id'] == selected[0]['id'] and artifact['name'] == args.artifact
    save_json(folder / 'artifact-api.json', artifact)
    (folder / 'artifact.zip').write_bytes(api(f'actions/artifacts/{artifact["id"]}/zip'))
    (folder / 'logs.zip').write_bytes(api(f'actions/runs/{args.run}/logs'))
    digest = sha(folder / 'artifact.zip')
    if artifact.get('digest'):
        assert artifact['digest'] == 'sha256:' + digest, 'GitHub artifact digest mismatch'
    inventory = extract(folder / 'artifact.zip', folder / 'unpacked')
    save_json(folder / 'archive-entries.json', inventory)
    manifest = json.loads((folder / 'unpacked/source-manifest.json').read_text())
    assert str(manifest['run_id']) == str(args.run)
    retention = dict(schema='chess-goal-retention-v1', repository=REPO, run_id=args.run,
                     run_url=run['html_url'], run_conclusion=run['conclusion'],
                     workflow_commit=run['head_sha'], computation_commit=manifest['commit'],
                     artifact_id=artifact['id'], artifact_name=artifact['name'],
                     artifact_sha256=digest, artifact_bytes=(folder / 'artifact.zip').stat().st_size,
                     logs_sha256=sha(folder / 'logs.zip'), logs_bytes=(folder / 'logs.zip').stat().st_size,
                     evidence_scope='Retained remote provenance and byte hashes only; no local model execution',
                     certifies_new_machine=False)
    save_json(folder / 'retention.json', retention)
    print('Remote chess evidence retained: ' + str(folder))


if __name__ == '__main__':
    main()
