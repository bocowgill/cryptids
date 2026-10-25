#!/usr/bin/env python3
"""Provenance-only retained complete-printer review; no local Lean or machine runs."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess

ROOT = Path(__file__).resolve().parents[2]
DOC = ROOT / 'docs/chess/parsimony-printer-2026-10-25/complete-printer'
OLD = ROOT / 'docs/chess/parsimony-printer-2026-10-25/output-wrapper/evidence/wrapper-01'


def sha(path):
    digest = hashlib.sha256()
    with path.open('rb') as stream:
        for block in iter(lambda: stream.read(1 << 20), b''):
            digest.update(block)
    return digest.hexdigest()


def read(path):
    return json.loads(path.read_text())


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--iteration', type=int, required=True)
    args = parser.parse_args()
    assert 1 <= args.iteration <= 3
    folder = DOC / 'evidence' / ('complete-' + str(args.iteration).zfill(2))
    work = folder / 'unpacked'
    retention, run = read(folder / 'retention.json'), read(folder / 'run-api.json')
    assert run['status'] == 'completed' and run['conclusion'] == 'success'
    assert retention['producer_source_verified']
    assert sha(folder / 'artifact.zip') == retention['artifact_sha256']
    assert sha(folder / 'logs.zip') == retention['logs_sha256']
    manifest = read(work / 'source-manifest.json')
    assert manifest['commit'] == run['head_sha'] == retention['workflow_commit']
    for name, expected in manifest['source_sha256'].items():
        data = subprocess.check_output(['git', 'show', manifest['commit'] + ':' + name], cwd=ROOT)
        assert hashlib.sha256(data).hexdigest() == expected, name
    for name, expected in manifest['frozen_source_sha256'].items():
        assert sha(ROOT / name) == expected, name
    summary = read(work / 'pilot-summary.json')
    assert summary['status'] == 'complete_printer_passed'
    assert summary['gates'] == dict(P1=True, B1=True)
    assert summary['complete_printer_certified'] and not summary['new_accepted_machine']
    assert summary['certified_saving'] == 0
    allowed = {'propext', 'Classical.choice', 'Quot.sound'}
    for command in summary['commands']:
        assert command['exit'] == command['expected_exit'] and command['resource_stop'] is None
        assert command['peak_group_plus_driver_rss_bytes'] <= 6 << 30
        output = (work / command['log']).read_text()
        assert sha(work / command['log']) == command['log_sha256']
        if command['expected_exit'] == 0 and command['name'] != 'mathlib-cache':
            assert 'warning:' not in output and 'error:' not in output
            assert 'sorryAx' not in output and 'Lean.ofReduceBool' not in output
            for group in re.findall(r'depends on axioms:\s*\[([^\]]*)\]', output, re.S):
                assert set(group.replace('\n', '').replace(' ', '').split(',')) <= allowed
        if command['name'] in ['wrong-output', 'wrong-head']:
            assert re.search(r'tactic .decide. proved that the proposition.*is false', output, re.S | re.I)
    names = [c['name'] for c in summary['commands']]
    assert names == ['mathlib-cache', 'kernel-frozen-global', 'structural-cleanup',
        'complete-model-rows', *['scan-batch-' + str(i).zfill(2) for i in range(53)],
        'complete-printer', 'positive-output-prefix', 'wrong-output', 'wrong-head']
    reuse = read(work / 'reuse.json')
    assert reuse['archive_sha256'] == sha(OLD / 'artifact.zip') == manifest['prior_archive_sha256']
    assert reuse['producer'] == manifest['prior_producer'] == '13ba1c5e5b2d8810f2d99d8be5185236b46ba54e'
    assert len(reuse['files']) == 120
    assert reuse['packet_batches_reused'] == 53 and reuse['packet_batch_recompilations'] == 0
    for name, entry in reuse['files'].items():
        assert sha(work / name) == sha(OLD / 'unpacked' / name) == entry['sha256']
    item, plan = read(work / 'composition.json'), read(work / 'instance-plan.json')
    assert item['identity'] == 'ParsimonyComposed.complete_printer'
    assert item['words'] == 13360 and item['checked_packet_chunks'] == 418
    assert item['checked_new_scan_batches'] == item['checked_old_batches_reused'] == 53
    assert item['checked_old_batches_recompiled'] == item['fresh_machine_states'] == 0
    assert item['matched_physical_rows'] == 27090 and item['output_state'] == 13545
    assert not item['complete_halting_equivalence'] and not item['codec_bridge_proved']
    assert not item['absolute_integer_displacement_proved']
    for name, entry in item['generated'].items():
        assert sha(work / name) == entry['source_sha256']
        assert sha((work / name).with_suffix('.olean')) == entry['object_sha256']
        if name in plan['generated_sha256']:
            assert entry['source_sha256'] == plan['generated_sha256'][name]
    for name in ['WrongOutput', 'WrongHead']:
        assert not (work / (name + '.olean')).exists()
    original = (work / 'Positive.lean').read_text()
    wrong_output = (work / 'WrongOutput.lean').read_text()
    assert len(original) == len(wrong_output)
    assert len([(a, b) for a, b in zip(original, wrong_output) if a != b]) == 1
    assert (work / 'WrongHead.lean').read_text() == original.replace(
        'packet.take 16', '(packet.drop 1).take 16')
    sources = [(work / ('PacketBatch' + str(i).zfill(2) + '.lean')).read_text()
               for i in range(53)]
    chunks = re.findall(r'def packetChars\d+ : List Char :=(.*?)def frozenChunk',
                        '\n'.join(sources), re.S)
    packet = ''.join(''.join('0' if c == 'zeroChar' else '1' for c in
        re.findall(r'\b(zeroChar|oneChar)\b', chunk)) for chunk in chunks)
    assert len(chunks) == 418 and len(packet) == 173641
    assert hashlib.sha256(packet.encode('ascii')).hexdigest() == item['frozen_packet_sha256']
    table = ROOT / ('docs/chess/parsimony-printer-2026-10-24/evidence/validation-04/'
                    'unpacked/full-candidate-rows.bin')
    assert sha(table) == item['candidate_sha256'] == plan['candidate_sha256']
    for source in work.glob('*.lean'):
        text = source.read_text()
        assert all(len(line) <= 100 for line in text.splitlines()), source
        assert not re.search(r'\b(sorry|axiom|native_decide|unsafe)\b', text), source
    record = dict(schema='parsimony-complete-printer-review-v1', run=run['id'],
        producer=run['head_sha'], reviewer_sha256=sha(Path(__file__).resolve()),
        complete_printer_checked=True, packet_batches_reused=53, scan_batches_checked=53,
        accepted_machine_states=769344, candidate_states=609247, new_accepted_saving=0,
        gates=dict(P1=True, B1=True), commands=summary['commands'])
    (DOC / 'review.json').write_text(json.dumps(record, indent=2, sort_keys=True) + '\n')
    print('PARSIMONY_COMPLETE_PRINTER_VERIFIED')
    print('PARSIMONY_COMPLETE_PRINTER_BINDING_VERIFIED')


if __name__ == '__main__':
    main()
