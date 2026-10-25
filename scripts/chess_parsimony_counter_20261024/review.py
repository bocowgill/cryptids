#!/usr/bin/env python3
"""Retained proof/evidence review only; never execute a local Lean model."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess

ROOT = Path(__file__).resolve().parents[2]
DOC = ROOT / 'docs/chess/parsimony-printer-2026-10-24/counter-insertion'


def sha(path):
    h = hashlib.sha256()
    with path.open('rb') as stream:
        for block in iter(lambda: stream.read(1 << 20), b''):
            h.update(block)
    return h.hexdigest()


def read(path):
    return json.loads(path.read_text())


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--iteration', type=int, required=True)
    args = parser.parse_args()
    assert 1 <= args.iteration <= 8
    folder = DOC / 'evidence' / ('counter-' + str(args.iteration).zfill(2))
    work = folder / 'unpacked'
    retained = read(folder / 'retention.json')
    run = read(folder / 'run-api.json')
    manifest = read(work / 'source-manifest.json')
    assert run['status'] == 'completed' and run['conclusion'] == 'success'
    assert retained['producer_source_verified']
    assert retained['workflow_commit'] == run['head_sha'] == manifest['commit']
    assert retained['artifact_sha256'] == sha(folder / 'artifact.zip')
    assert retained['logs_sha256'] == sha(folder / 'logs.zip')
    for path, expected in manifest['source_sha256'].items():
        raw = subprocess.check_output(['git', 'show', manifest['commit'] + ':' + path], cwd=ROOT)
        assert hashlib.sha256(raw).hexdigest() == expected, path
    summary = read(work / 'pilot-summary.json')
    assert summary['status'] == 'counter_insertion_phase_passed'
    assert summary['gates'] == dict(C1=True, W1=True, U1=True, B1=True)
    assert summary['complete_requested_composition']
    assert summary['certified_saving'] == 0 and not summary['new_accepted_machine']
    assert not summary['complete_printer_certified']
    allowed = {'propext', 'Classical.choice', 'Quot.sound'}
    for command in summary['commands']:
        assert command['exit'] == command['expected_exit'] and command['resource_stop'] is None
        log = work / command['log']
        assert sha(log) == command['log_sha256']
        output = log.read_text()
        if command['expected_exit'] == 0 and command['name'] != 'mathlib-cache':
            assert 'warning:' not in output and 'error:' not in output
            assert 'sorryAx' not in output and 'Lean.ofReduceBool' not in output
            for group in re.findall(r'depends on axioms:\s*\[([^\]]*)\]', output, re.S):
                assert set(group.replace('\n', '').replace(' ', '').split(',')) <= allowed
        if command['name'] == 'changed-counter-row':
            assert command['exit'] == 1 and 'error:' in output
    item = read(work / 'composition.json')
    assert item['words'] == 13360 and item['rows_compared'] == 27078
    assert item['operational_theorem'] == 'ParsimonyComposed.allWordsIndexed'
    assert item['arbitrary_index_run_certified'] and item['actual_word_index_used']
    assert not item['full_execution_unrolled']
    assert item['transport_corruption_rejected']
    assert item['external_binding_is_not_kernel_parser_certification']
    for suffix, key in [('lean', 'proof_source_sha256'), ('olean', 'object_sha256'),
                         ('rows', 'export_sha256')]:
        assert sha(work / ('AllWords.' + suffix)) == item[key]
    assert (work / 'AllWords.olean').stat().st_size == item['object_bytes']
    assert (work / 'AllWords.lean').stat().st_size == item['proof_source_bytes']
    original = (work / 'AllWords.lean').read_text()
    corrupted = (work / 'Corrupted.lean').read_text()
    # A single real counter-write change is the only negative-source difference.
    differences = [(a, b) for a, b in zip(original.splitlines(), corrupted.splitlines()) if a != b]
    assert len(differences) == 1
    a, b = differences[0]
    assert a.startswith('  (1, .left, stateOf ') and b == a.replace('(1,', '(0,', 1)
    assert len(original.splitlines()) == len(corrupted.splitlines())
    for path, expected in read(DOC / 'checked-routines-pins.json').items():
        assert sha(ROOT / path) == expected == manifest['source_sha256'][path]
    log = (work / 'all-word-composition.log').read_text()
    assert "'ParsimonyComposed.allWordsIndexed' depends on axioms:" in log
    assert 'PARSIMONY_ALL_WORDS_EXPORTED' in log
    print('PARSIMONY_COUNTER_RETAINED_VERIFIED')
    print(json.dumps(dict(words=item['words'], rows=item['rows_compared'],
        seconds=item['command_receipt']['elapsed_seconds'],
        peak_group_rss_bytes=item['command_receipt']['peak_group_plus_driver_rss_bytes'],
        object_bytes=item['object_bytes'], accepted_machine_states=summary['accepted_machine_states'],
        candidate_states=summary['candidate_states'], new_accepted_saving=0), indent=2))


if __name__ == '__main__':
    main()
