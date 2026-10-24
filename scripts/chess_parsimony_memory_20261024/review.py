#!/usr/bin/env python3
"""Lightweight retained-evidence/provenance review; never execute a Lean model."""
import argparse
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]


def sha(path):
    h = hashlib.sha256()
    with path.open('rb') as stream:
        for block in iter(lambda: stream.read(1 << 20), b''):
            h.update(block)
    return h.hexdigest()


def load(path):
    return json.loads(path.read_text())


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--iteration', type=int, required=True)
    args = parser.parse_args()
    assert args.iteration in (1, 2)
    folder = ROOT / 'docs/chess/parsimony-printer-2026-10-24/proof-memory/evidence' / (
        'memory-' + str(args.iteration).zfill(2))
    work = folder / 'unpacked'
    retained = load(folder / 'retention.json')
    run = load(folder / 'run-api.json')
    manifest = load(work / 'source-manifest.json')
    assert retained['producer_source_verified'] and run['conclusion'] == 'success'
    assert run['status'] == 'completed'
    assert retained['workflow_commit'] == run['head_sha'] == manifest['commit']
    assert retained['artifact_sha256'] == sha(folder / 'artifact.zip')
    assert retained['logs_sha256'] == sha(folder / 'logs.zip')
    summary = load(work / 'pilot-summary.json')
    assert summary['status'] == 'proof_memory_comparison_passed'
    assert summary['gates'] == dict(K1=True, B1=True, M1=True)
    assert summary['certified_saving'] == 0 and not summary['new_accepted_machine']
    assert not summary['complete_printer_certified']
    assert summary['generic_source_unchanged'] and summary['candidate_rows_unchanged']
    assert summary['accepted_and_frozen_pins_unchanged']
    positive = {'unchanged-kernel', 'foundations', 'baseline', 'shared'}
    for command in summary['commands']:
        assert command['exit'] == command['expected_exit'] == 0
        assert command['resource_stop'] is None
        log = work / command['log']
        assert command['log_sha256'] == sha(log)
        if command['name'] in positive:
            assert 'warning:' not in log.read_text() and 'error:' not in log.read_text()
    comparison = load(work / 'comparison.json')
    baseline, shared = comparison['paired_baseline'], comparison['shared_bound']
    assert baseline['export_sha256'] == shared['export_sha256']
    for item in [baseline, shared]:
        name = item['name']
        assert item['words'] == 13360 and item['rows_compared'] == 26720
        assert item['source_sha256'] == sha(work / (name + '.lean'))
        assert item['olean_sha256'] == sha(work / (name + '.olean'))
        assert item['olean_bytes'] == (work / (name + '.olean')).stat().st_size
        assert item['export_sha256'] == sha(work / (name + '.rows'))
        control = load(work / (name + '-negative-control.json'))
        assert control['positive_matched'] and control['changed_word_rejected']
        assert control['original'] != control['changed']
    b, s = baseline['command_receipt'], shared['command_receipt']
    saving = b['peak_group_plus_driver_rss_bytes'] - s['peak_group_plus_driver_rss_bytes']
    assert saving == comparison['peak_rss_saving_bytes']
    assert comparison['object_saving_bytes'] == baseline['olean_bytes'] - shared['olean_bytes']
    assert comparison['object_ratio'] == shared['olean_bytes'] / baseline['olean_bytes']
    assert comparison['runtime_ratio'] == s['elapsed_seconds'] / b['elapsed_seconds']
    useful = saving >= (256 << 20) and comparison['object_ratio'] <= 0.75 \
        and comparison['runtime_ratio'] <= 2
    assert comparison['material_improvement'] == useful
    expected = 'continue_structural_integration' if useful else 'redesign_before_integration'
    assert comparison['decision'] == expected
    preservation = load(work / 'preservation.json')
    assert preservation['operational_instance_statement_and_proof_identical']
    generic = ROOT / 'Cryptids/Compilation/Parsimony/Data.lean'
    assert preservation['generic_source_sha256'] == sha(generic)
    assert preservation['baseline_source_sha256'] == sha(work / 'Baseline.lean')
    print('PARSIMONY_MEMORY_RETAINED_VERIFIED')
    print(json.dumps(dict(decision=expected, peak_rss_saving_bytes=saving,
        baseline_seconds=b['elapsed_seconds'], shared_seconds=s['elapsed_seconds'],
        baseline_object_bytes=baseline['olean_bytes'], shared_object_bytes=shared['olean_bytes'],
        accepted_machine_states=summary['accepted_machine_states'],
        experimental_candidate_states=summary['candidate_states'], certified_saving=0), indent=2))


if __name__ == '__main__':
    main()
