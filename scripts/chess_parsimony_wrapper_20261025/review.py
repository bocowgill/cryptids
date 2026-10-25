#!/usr/bin/env python3
"""Local lightweight provenance/source review; no Lean, generation or simulation."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess

ROOT = Path(__file__).resolve().parents[2]
DOC = ROOT / 'docs/chess/parsimony-printer-2026-10-25/output-wrapper'
PRIOR = ROOT / 'docs/chess/parsimony-printer-2026-10-24/global-iteration'
OLD = PRIOR / 'evidence/global-08'


def sha(path):
    with path.open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest()


def read(path):
    return json.loads(path.read_text())


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--iteration', type=int, required=True)
    args = parser.parse_args()
    assert 1 <= args.iteration <= 3
    folder = DOC / 'evidence' / ('wrapper-' + str(args.iteration).zfill(2))
    work = folder / 'unpacked'
    retained, run = read(folder / 'retention.json'), read(folder / 'run-api.json')
    manifest = read(work / 'source-manifest.json')
    assert run['status'] == 'completed' and run['conclusion'] == 'success'
    assert retained['producer_source_verified']
    assert retained['workflow_commit'] == run['head_sha'] == manifest['commit']
    assert retained['artifact_sha256'] == sha(folder / 'artifact.zip')
    assert retained['logs_sha256'] == sha(folder / 'logs.zip')
    for path, expected in manifest['source_sha256'].items():
        raw = subprocess.check_output(['git', 'show', manifest['commit'] + ':' + path], cwd=ROOT)
        assert hashlib.sha256(raw).hexdigest() == expected, path
    for path, expected in manifest['frozen_source_sha256'].items():
        assert sha(ROOT / path) == expected, path
    summary = read(work / 'pilot-summary.json')
    assert summary['status'] == 'wrapper_identity_and_control_passed'
    assert summary['gates'] == dict(W1=True, C1=True)
    assert summary['certified_saving'] == 0 and not summary['new_accepted_machine']
    assert not summary['complete_printer_certified']
    expected_names = ['mathlib-cache', 'kernel-frozen-global', 'abstract-sized-render',
        'packet-framing-prefix', 'final-output-identity', 'positive-first-bit',
        'changed-frozen-packet']
    assert [c['name'] for c in summary['commands']] == expected_names
    allowed = {'propext', 'Classical.choice', 'Quot.sound'}
    for command in summary['commands']:
        assert command['exit'] == command['expected_exit'] and command['resource_stop'] is None
        assert command['peak_group_plus_driver_rss_bytes'] <= 6 << 30
        log = work / command['log']
        assert sha(log) == command['log_sha256']
        output = log.read_text()
        if command['expected_exit'] == 0 and command['name'] != 'mathlib-cache':
            assert 'warning:' not in output and 'error:' not in output
            assert 'sorryAx' not in output and 'Lean.ofReduceBool' not in output
            groups = re.findall(r'depends on axioms:\s*\[([^\]]*)\]', output, re.S)
            for group in groups:
                assert set(group.replace('\n', '').replace(' ', '').split(',')) <= allowed
        if command['name'] == 'changed-frozen-packet':
            assert command['exit'] == 1
            assert re.search(r'tactic .decide. proved that the proposition.*is false',
                             output, re.S | re.I), output
    reuse = read(work / 'reuse.json')
    old_review = read(PRIOR / 'partial-review.json')
    assert reuse['producer'] == old_review['producer'] == manifest['prior_producer']
    assert reuse['run'] == old_review['run'] == 40157504256
    assert reuse['archive_sha256'] == manifest['prior_archive_sha256'] == sha(OLD / 'artifact.zip')
    assert reuse['checked_batches'] == 53 and reuse['checked_words'] == 13360
    assert reuse['checked_batch_recompilations'] == 0
    assert reuse['normal_checked_module_imports'] and reuse['no_import_of_failed_identity']
    assert len(reuse['files']) == 112
    for name, entry in reuse['files'].items():
        assert sha(work / name) == sha(OLD / 'unpacked' / name) == entry['sha256']
        assert (work / name).stat().st_size == entry['bytes']
        if name.startswith('PacketBatch'):
            key = Path(name).with_suffix('.lean').name
            field = 'source_sha256' if name.endswith('.lean') else 'object_sha256'
            assert entry['sha256'] == old_review['batch_artifacts'][key][field]
    assert reuse['original_rows_sha256'] == sha(OLD / 'unpacked/AllWords.rows')
    item = read(work / 'composition.json')
    assert item['words'] == 13360 and item['checked_batches_reused'] == 53
    assert item['checked_batches_recompiled'] == item['fresh_machine_states'] == 0
    assert item['unchanged_identity_statement'] and item['source_file_binding_external']
    assert not item['complete_printer_certified'] and not item['full_execution_unrolled']
    assert not item['artifact_to_TableSeed_ChessCodec_bits_bridge']
    plan = read(work / 'wrapper-plan.json')
    for name, entry in item['generated'].items():
        assert sha(work / name) == entry['source_sha256'] == plan['generated_sha256'][name]
        assert sha((work / name).with_suffix('.olean')) == entry['object_sha256']
    original = (work / 'PositiveControl.lean').read_text()
    corrupted = (work / 'Corrupted.lean').read_text()
    assert len(original) == len(corrupted)
    assert [(a, b) for a, b in zip(original, corrupted) if a != b] == [('1', '0')]
    assert not (work / 'Corrupted.olean').exists()
    old_identity = (OLD / 'unpacked/Identity.lean').read_text()
    new_identity = (work / 'Identity.lean').read_text()
    statement = lambda text: text.split('theorem global_bits_identity :', 1)[1].split(':= by', 1)[0]
    assert statement(old_identity) == statement(new_identity)
    # Independent representation check from retained literal sources, not a machine run.
    sources = [(work / ('PacketBatch' + str(i).zfill(2) + '.lean')).read_text()
               for i in range(53)]
    chunks = re.findall(r'def packetChars\d+ : List Char :=(.*?)def frozenChunk',
                        '\n'.join(sources), re.S)
    decode = lambda text: ''.join('0' if c == 'zeroChar' else '1' for c in
                                 re.findall(r'\b(zeroChar|oneChar)\b', text))
    packet = ''.join(map(decode, chunks))
    assert len(chunks) == 418 and len(packet) == 173641
    assert hashlib.sha256(packet.encode('ascii')).hexdigest() == item['frozen_packet_sha256']
    common = (work / 'PacketCommon.lean').read_text()
    assert "def zeroChar : Char := '0'" in common and "def oneChar : Char := '1'" in common
    marker = common.split('def marker : List Char :=', 1)[1].split('def tailPadding', 1)[0]
    tail = common.split('def tailPadding : List Char :=', 1)[1].split('end ParsimonyComposed', 1)[0]
    assert decode(marker) == '1' * 32 + '0' and decode(tail) == '100000'
    assert len(decode(marker) + packet + decode(tail)) == plan['framed_bits'] == 173680
    table = ROOT / ('docs/chess/parsimony-printer-2026-10-24/evidence/validation-04/'
                    'unpacked/full-candidate-rows.bin')
    frozen_packet = ROOT / ('docs/chess/campaign-2026-10-22/round-04/evidence/packet-02/'
                            'unpacked/packet.bits')
    assert sha(table) == item['candidate_sha256'] == plan['candidate_sha256']
    assert sha(frozen_packet) == item['frozen_packet_sha256'] == plan['packet_sha256']
    for source in work.glob('*.lean'):
        text = source.read_text()
        assert all(len(line) <= 100 for line in text.splitlines()), source
        assert not re.search(r'\b(sorry|axiom|native_decide|unsafe)\b', text), source
    record = dict(schema='parsimony-wrapper-review-v1', run=run['id'], producer=run['head_sha'],
        prior_run=reuse['run'], prior_producer=reuse['producer'], checked_batches_reused=53,
        checked_words=13360, final_identity_checked=True, corruption_control_checked=True,
        accepted_machine_states=769344, candidate_states=609247, new_full_machine_saving=0,
        standard_foundations_only=True, frozen_and_checked_pins_unchanged=True,
        commands=summary['commands'], elapsed_seconds=summary['elapsed_seconds'])
    (DOC / 'review.json').write_text(json.dumps(record, indent=2, sort_keys=True) + '\n')
    print('PARSIMONY_WRAPPER_IDENTITY_VERIFIED')
    print('PARSIMONY_WRAPPER_CONTROL_VERIFIED')


if __name__ == '__main__':
    main()
