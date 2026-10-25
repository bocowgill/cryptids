#!/usr/bin/env python3
"""Lightweight retained-source/provenance review; no Lean or machine execution."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess

ROOT = Path(__file__).resolve().parents[2]
DOC = ROOT / 'docs/chess/parsimony-printer-2026-10-24/global-iteration'


def sha(path):
    h = hashlib.sha256()
    with path.open('rb') as stream:
        for block in iter(lambda: stream.read(1 << 20), b''):
            h.update(block)
    return h.hexdigest()


def read(path):
    return json.loads(path.read_text())


def review_partial(work, run, manifest):
    """Validate the exact checked prefix without certifying the failed wrapper."""
    summary = read(work / 'pilot-summary.json')
    assert run['conclusion'] == 'failure' and summary['status'] == 'failed'
    assert summary['gates'] == dict(I1=True)
    assert summary['checked_identity_words'] == 13360
    assert summary['checked_identity_batches'] == 53
    assert summary['certified_saving'] == 0 and not summary['new_accepted_machine']
    assert not summary['complete_printer_certified']
    allowed = {'propext', 'Classical.choice', 'Quot.sound'}
    for command in summary['commands']:
        log = work / command['log']
        assert sha(log) == command['log_sha256'] and command['resource_stop'] is None
        text = log.read_text()
        if command['name'] == 'frozen-packet-identity':
            assert command['exit'] == 1 and 'maximum recursion depth' in text
            assert "'ParsimonyComposed.global_bits_identity' depends on axioms:" in text
            assert 'sorryAx' in text  # Explicitly reject the final failed root.
            for root in ['all_packet_words', 'packet_framing']:
                groups = re.findall("'ParsimonyComposed." + root +
                    "' depends on axioms:\s*\[([^\]]*)\]", text, re.S)
                assert len(groups) == 1
                assert set(groups[0].replace(' ', '').replace('\n', '').split(',')) <= allowed
        else:
            assert command['exit'] == command['expected_exit'] == 0
            if command['name'] != 'mathlib-cache':
                assert 'warning:' not in text and 'error:' not in text
                assert 'sorryAx' not in text and 'Lean.ofReduceBool' not in text
                for group in re.findall(r'depends on axioms:\s*\[([^\]]*)\]', text, re.S):
                    assert set(group.replace(' ', '').replace('\n', '').split(',')) <= allowed
    assert not (work / 'Identity.olean').exists()
    assert (work / 'GlobalInstance.olean').is_file()
    plan = read(work / 'instance-plan.json')
    sources, objects, payloads = [], {}, []
    for path in sorted(work.glob('PacketBatch*.lean')):
        assert sha(path) == plan['batch_source_sha256'][path.name]
        obj = path.with_suffix('.olean')
        assert obj.is_file()
        objects[path.name] = dict(source_sha256=sha(path), object_sha256=sha(obj),
                                  object_bytes=obj.stat().st_size)
        sources.append(path.read_text())
    assert len(sources) == 53
    for chunk in re.findall(r'def packetChars\d+ : List Char :=(.*?)def frozenChunk',
                            '\n'.join(sources), re.S):
        payloads.append(''.join('0' if c == 'zeroChar' else '1' for c in
            re.findall(r'\b(zeroChar|oneChar)\b', chunk)))
    assert len(payloads) == 418
    assert hashlib.sha256(''.join(payloads).encode('ascii')).hexdigest() == plan['packet_sha256']
    common = (work / 'PacketCommon.lean').read_text()
    assert "def zeroChar : Char := '0'" in common and "def oneChar : Char := '1'" in common
    marker = common.split('def marker : List Char :=', 1)[1].split('def tailPadding', 1)[0]
    tail = common.split('def tailPadding : List Char :=', 1)[1].split('end ParsimonyComposed', 1)[0]
    decode = lambda text: ''.join('0' if c == 'zeroChar' else '1' for c in
        re.findall(r'\b(zeroChar|oneChar)\b', text))
    assert decode(marker) == '1' * 32 + '0' and decode(tail) == '100000'
    assert sha(work / 'AllWords.rows') == \
        '00c969fe4433fdacb6a5cccee583b1872305a8f3c5a7820c8186078a47942e41'
    for path, expected in manifest['frozen_source_sha256'].items():
        assert sha(ROOT / path) == expected, path
    record = dict(schema='parsimony-global-partial-review-v1', run=run['id'],
        producer=run['head_sha'], operational_root_checked=True, packet_batches_checked=53,
        packet_words_checked=13360, numeric_packet_and_framing_roots_checked=True,
        final_operational_identity_wrapper_checked=False, corruption_control_checked=False,
        final_failed_module_exportable=False, accepted_machine_states=769344,
        candidate_states=609247, new_accepted_full_machine_saving=0, batch_artifacts=objects)
    (DOC / 'partial-review.json').write_text(json.dumps(record, indent=2, sort_keys=True) + '\n')
    print('PARSIMONY_GLOBAL_PARTIAL_RETAINED_VERIFIED')
    print('Operational root and full packet batches checked; final wrapper remains unverified')


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--iteration', type=int, required=True)
    parser.add_argument('--partial', action='store_true')
    args = parser.parse_args()
    assert 1 <= args.iteration <= 8
    folder = DOC / 'evidence' / ('global-' + str(args.iteration).zfill(2))
    work = folder / 'unpacked'
    retained, run = read(folder / 'retention.json'), read(folder / 'run-api.json')
    manifest = read(work / 'source-manifest.json')
    assert run['status'] == 'completed' and (args.partial or run['conclusion'] == 'success')
    assert retained['producer_source_verified']
    assert retained['workflow_commit'] == run['head_sha'] == manifest['commit']
    assert retained['artifact_sha256'] == sha(folder / 'artifact.zip')
    assert retained['logs_sha256'] == sha(folder / 'logs.zip')
    for path, expected in manifest['source_sha256'].items():
        raw = subprocess.check_output(['git', 'show', manifest['commit'] + ':' + path], cwd=ROOT)
        assert hashlib.sha256(raw).hexdigest() == expected, path
    if args.partial:
        review_partial(work, run, manifest)
        return
    summary = read(work / 'pilot-summary.json')
    assert summary['status'] == 'global_iteration_packet_identity_passed'
    assert summary['gates'] == dict(I1=True, P1=True, B1=True)
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
        if command['name'] == 'changed-frozen-packet':
            assert command['exit'] == 1 and 'error:' in output
    item = read(work / 'composition.json')
    assert item['words'] == 13360 and item['rows_compared'] == 27078 and item['chunks'] == 418
    assert item['iteration_theorem'] == 'ParsimonyComposed.global_terminated'
    assert item['identity_theorem'] == 'ParsimonyComposed.global_bits_identity'
    assert not item['full_execution_unrolled'] and item['fresh_machine_states'] == 0
    assert item['external_binding_is_not_kernel_file_parser']
    assert not item['artifact_to_TableSeed_ChessCodec_bits_bridge']
    for key, name in [('source', 'AllWords'), ('global_source', 'GlobalInstance'),
                      ('identity_source', 'Identity'), ('common_source', 'PacketCommon')]:
        saved = item['generated'][key]
        assert sha(work / (name + '.lean')) == saved['source_sha256']
        assert sha(work / (name + '.olean')) == saved['object_sha256']
        assert (work / (name + '.lean')).stat().st_size == saved['source_bytes']
        assert (work / (name + '.olean')).stat().st_size == saved['object_bytes']
    original = (work / 'PositiveControl.lean').read_text()
    corrupted = (work / 'Corrupted.lean').read_text()
    assert len(original) == len(corrupted)
    differences = [(a, b) for a, b in zip(original, corrupted) if a != b]
    assert differences == [('1', '0')]
    # Independent literal/file binding; no generator or machine execution.
    batch_sources = []
    for name, metadata in item['batches'].items():
        path = work / name
        assert sha(path) == metadata['source_sha256']
        assert sha(path.with_suffix('.olean')) == metadata['object_sha256']
        batch_sources.append(path.read_text())
    assert len(batch_sources) == 53
    definitions = re.findall(r'def packetChars\d+ : List Char :=(.*?)def frozenChunk',
                             '\n'.join(batch_sources), re.S)
    packet = ''.join(''.join('0' if c == 'zeroChar' else '1' for c in
        re.findall(r'\b(zeroChar|oneChar)\b', chunk)) for chunk in definitions)
    assert len(definitions) == item['chunks']
    assert hashlib.sha256(packet.encode('ascii')).hexdigest() == item['frozen_packet_sha256']
    common = (work / 'PacketCommon.lean').read_text()
    assert "def zeroChar : Char := '0'" in common
    assert "def oneChar : Char := '1'" in common
    marker = common.split('def marker : List Char :=', 1)[1].split('def tailPadding', 1)[0]
    tail = common.split('def tailPadding : List Char :=', 1)[1].split('end ParsimonyComposed', 1)[0]
    assert ''.join('0' if c == 'zeroChar' else '1' for c in
        re.findall(r'\b(zeroChar|oneChar)\b', marker)) == '1' * 32 + '0'
    assert ''.join('0' if c == 'zeroChar' else '1' for c in
        re.findall(r'\b(zeroChar|oneChar)\b', tail)) == '100000'
    for path, expected in manifest['frozen_source_sha256'].items():
        assert sha(ROOT / path) == expected, path
    for logfile, root in [('global-iteration.log', 'global_terminated'),
                          ('frozen-packet-identity.log', 'global_bits_identity')]:
        assert "'ParsimonyComposed." + root + "' depends on axioms:" in (work / logfile).read_text()
    print('PARSIMONY_GLOBAL_RETAINED_VERIFIED')
    print(json.dumps(dict(run=run['id'], producer=run['head_sha'], words=item['words'],
        framed_bits=item['framed_bits'], accepted_machine_states=summary['accepted_machine_states'],
        candidate_states=summary['candidate_states'], new_accepted_saving=0,
        commands=[dict(name=c['name'], seconds=c['elapsed_seconds'],
            peak_group_rss_bytes=c['peak_group_plus_driver_rss_bytes'])
            for c in summary['commands']]), indent=2))


if __name__ == '__main__':
    main()
