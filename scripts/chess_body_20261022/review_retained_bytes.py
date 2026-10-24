#!/usr/bin/env python3
"""Inspect retained bytes/provenance only; never execute Lean or a machine model."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('packet', type=Path)
    parser.add_argument('--preview', type=Path)
    parser.add_argument('--diagnosis', required=True)
    args = parser.parse_args()
    root = Path(__file__).resolve().parents[2]
    packet = args.packet.resolve()
    assert packet.is_relative_to(root / 'docs/chess/campaign-2026-10-22/round-03/evidence')
    output = packet / 'parent-metadata.json'
    assert not output.exists(), 'Retained review already exists; preserve it'
    unpacked = packet / 'unpacked'
    summary = json.loads((unpacked / 'certificate-summary.json').read_text())
    manifest = json.loads((unpacked / 'source-manifest.json').read_text())
    retention = json.loads((packet / 'retention.json').read_text())
    commit = manifest['commit']
    assert retention['workflow_commit'] == retention['computation_commit'] == commit
    for name, expected in manifest['source_sha256'].items():
        source = subprocess.check_output(['git', 'show', f'{commit}:{name}'], cwd=root)
        assert hashlib.sha256(source).hexdigest() == expected, name
    pins = json.loads((root / 'docs/chess/campaign-2026-10-22/accepted-769344-pins.json').read_text())
    assert manifest['frozen_source_sha256'] == pins
    for name, expected in summary['generated_files'].items():
        path = unpacked / 'reproduction' / name
        assert path.stat().st_size == expected['bytes']
        assert digest(path) == expected['sha256'], name
        if path.suffix == '.lean':
            assert all(len(line) <= 100 for line in path.read_text().splitlines()), name
    for stage in summary['stages']:
        path = unpacked / stage['log']
        assert path.stat().st_size == stage['log_info']['bytes']
        assert digest(path) == stage['log_info']['sha256'], path.name
    proposal = summary.get('source_operation_proposal')
    profile = summary.get('source_component_timing')
    if profile:
        path = unpacked / profile['path']
        assert path.stat().st_size == profile['info']['bytes']
        assert digest(path) == profile['info']['sha256']
    if proposal:
        path = unpacked / proposal['path']
        assert path.stat().st_size == proposal['info']['bytes']
        assert digest(path) == proposal['info']['sha256'], path.name
    for divisor in (16, 4):
        for kind in ('progress', 'details'):
            progress = summary.get(f'local_scope_{divisor}_{kind}')
            if progress:
                path = unpacked / progress['path']
                assert path.stat().st_size == progress['info']['bytes']
                assert digest(path) == progress['info']['sha256'], path.name
    if args.preview:
        assert digest(args.preview) == retention['artifact_sha256']
    review = dict(scope='Retained source/generated/log/provenance bytes only; no proof execution',
                  run_id=retention['run_id'], commit=commit,
                  source_generated_log_hashes_match=True, accepted_pin_manifest_matches=True,
                  generated_lean_width_at_most_100=True,
                  preview_hash_matches=True if args.preview else None,
                  complete_candidate_data=summary['complete_typed_candidate_data_checked'],
                  actual_rows=summary['completed_positive_unique_rows'],
                  negative_control=summary['negative_control']['status'],
                  diagnosis=args.diagnosis, new_accepted_machine=False)
    output.write_text(json.dumps(review, indent=2) + '\n')
    print('Retained remote byte/provenance inspection passed; no mathematical credit added')


if __name__ == '__main__':
    main()
