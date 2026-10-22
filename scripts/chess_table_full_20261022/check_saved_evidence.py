#!/usr/bin/env python3
"""Replay a sealed packet of remote structured-seed chess evidence using metadata and hashes.

Never imports/runs the compiler, fixtures, a model, Lean, Lake, or subprocesses.
The large full-row stream is streamed only through SHA-256, never parsed or
recounted. The numbers checked here are requirements on SAVED REMOTE receipts,
not independently recomputed machine counts or a new mathematical certificate.
The reviewed seal and saved API responses are trust anchors, not independently
authenticated GitHub attestations.

Use --describe-seal and --describe-review for the two required schemas. A
reviewer supplies the review after checking a successful complete packet; the
coordinator then supplies the separate acceptance seal. There is deliberately
no command that turns the packet's own assertions into an accepted seal.
"""
import argparse
import copy
import hashlib
import json
import math
from pathlib import Path, PurePosixPath
import re
import stat
import sys
import zipfile

HERE = Path(__file__).resolve()
SCHEMA = 'chess-table-full-seal-v1'
REPO = 'bocowgill/cryptids'
BRANCH = 'codex/chess-openevolve-pilot'
WORKFLOW = '.github/workflows/chess_table_full_20261022.yml'
BASELINE = 'docs/chess/campaign-2026-10-22/accepted-998176-pins.json'
CHECKER = 'scripts/chess_table_full_20261022/check_saved_evidence.py'
META = ('run-api.json', 'jobs-api.json', 'artifact-api.json', 'retention.json', 'archive-entries.json')
PHASES = {'build': 1, 'contracts': 10, 'native': 11, 'counts': 12, 'full': 20}
ROWS = {'full-rows.bin'}
CLAIM = {
    'formal_machine': 'ConjectureMachines.Machines.chess_table_seed',
    'formal_theorem': 'ConjectureMachines.Semantics.ChessTableSeed.halts_iff_not_draw',
    'states': 769344, 'previous_states': 998176, 'saved_states': 228832,
    'initializer_states': 173642, 'decoder_states': 21682, 'decoder_bridge_states': 1,
    'seed_controller_states': 216, 'seed_bridge_states': 1,
    'body_states': 573802, 'main_states': 533341, 'return_states': 40461,
    'blank_tape': True, 'symbols': 2,
}
CONTRACTS = {
    'OldCount': 'example : generated.states = 998176 := by rw [generated_states]; decide +kernel',
    'UnpaidDecoder': 'example : generated.states = 747662 := by rw [generated_states]; decide +kernel',
    'UnpaidBridge': 'example : linked.states = 595701 := by rw [linked_states]; decide +kernel',
    'BadSaving': 'example : FieldSeed.generated.states - generated.states = 228833 := by rw [FieldSeed.generated_states, generated_states]; decide +kernel',
    'MissingTurn': 'example : actions.size = bits.size := by rw [prefix_states, bits_size]; decide +kernel',
}
MUTATION_STAGES = (
    ('writer_payload', 'row_content'), ('writer_order', 'row_content'), ('writer_turn', 'row_content'),
    ('decoder_read', 'row_content'), ('decoder_consume', 'row_content'), ('decoder_write', 'row_content'),
    ('decoder_dispatch', 'row_content'), ('decoder_success_unpatched', 'row_content'),
    ('decoder_success_direction', 'row_content'), ('new_bridge_direction', 'row_content'),
    ('expander_success_direction', 'row_content'), ('old_bridge_direction', 'row_content'),
    ('old_expander_write', 'row_content'), ('relocated_body_write', 'row_content'),
    ('relocated_body_destination', 'row_content'), ('unpaid_destination', 'row_encoding'),
    ('body_halt_removed', 'row_content'), ('noncanonical_halt', 'row_encoding'),
    ('decoder_error_control', 'row_content'), ('omitted_row', 'row_extent'),
    ('omitted_state', 'row_extent'), ('extra_row', 'row_extent'), ('unpaid_count', 'allocation'),
    ('writer_head_receipt', 'writer_receipt'), ('changed_full_packet', 'input_packet'),
    ('changed_original_input', 'source_symbols'), ('toy_head', 'toy_receipt'),
    ('toy_far_exterior', 'toy_receipt'), ('toy_runtime', 'toy_receipt'), ('toy_output', 'toy_output'),
    ('complete_toy_bridge_write', 'toy_support'), ('complete_toy_bridge_head', 'toy_endpoint'),
    ('behavior_writer_turn', 'boundary_behavior'), ('behavior_decoder_success', 'boundary_behavior'),
    ('behavior_new_bridge', 'boundary_behavior'), ('behavior_expander_success', 'boundary_behavior'),
    ('behavior_old_bridge', 'boundary_behavior'),
)
MUTATIONS = tuple(name for name, _ in MUTATION_STAGES)
PINNED_INPUTS = {
    'source-input.json': '81211018fb63850c544e2ea7c336163215fee1b4e0f2b391ff00304ced258c4c',
    'source-symbols.u8': '3a148a738a015a5fa45ba469a7e6dc84a14b37b5b215c704cac257d097d8e773',
    'decoded-seed.bits': '2946c43c229df7c2468d45f72ac385e20188aeafc1a4af74309a5d563d8befe1',
    'original-machine': '592ea3c892d0e9d5a6db6ce31e3f590bde7973774bdc9a70cfe46cb6996cd39e',
    'body-rows.jsonl': 'd2afbf1c0abe1afb0008029680c5bc52b41f2dc21718a88d16b7aecd06becb0a',
    'decoder': 'c812768bac296d8520f64b7df4a33de47e7c067c79594bef48e7b536e359e09f',
    'expander': 'c19e270e8c21b2c629413f5977a9b57f4aab018ef61988f405669bb8726691d2',
}
DECODER_ROWS_SHA = '75ce868d2bed8ee161aab7c734e8602daf6bea7f245bf374cfe671735f57bb24'
EXPANDER_ROWS_SHA = '596a56f2045f1a909367b59e0adde9b2937c98e203f65c9040cd7d4a4a11e527'
PACKET_SHA = 'ab1f8764749765bfb0d44b22a999d7907345d2648bf478092a276cf8df71c2d8'
TARGET_SHA = 'a537828df795044398b0eb71c0f9091da6a3d2e01511bac338b8581b04fda9fa'
ALLOCATION = {
    'machine_states': 769344, 'row_machine_states': 769344, 'generated_states': 769344,
    'packet_bits': 173641, 'writer_states': 173642, 'decoder_states': 21682,
    'new_bridge_states': 1, 'expander_states': 216, 'old_bridge_states': 1,
    'linked_states': 595702, 'body_states': 573802, 'decoder_entry': 173642,
    'decoder_done': 195322, 'decoder_error': 195323, 'new_bridge_entry': 195324,
    'expander_entry': 195325, 'expander_done': 195539, 'old_bridge_entry': 195541,
    'body_entry': 195542, 'previous_states': 998176,
}
TOYS = (
    ('empty', [], [], []), ('letters', [1, 2, 3, 4], [], [4, 3, 2, 1]),
    ('zero', [], [[0, 0, 0]], []),
    *((f'tag_{tag}', [4], [[tag, 0, 1]], [1, 2]) for tag in range(7)),
    ('boundaries', [4, 1], [[6, 4096, 8191], [5, 1, 0]], [2]),
    ('pre_only', [1, 4], [], []), ('post_only', [], [], [2, 3]),
    ('row_only', [], [[3, 8191, 4096]], []),
)
SEAL_KEYS = {
    'schema', 'status', 'claim', 'repository', 'run_id', 'artifact_id', 'artifact_name',
    'workflow_commit', 'computation_commit', 'source_manifest_sha256', 'baseline_pins_sha256',
    'checker_sha256', 'artifact_sha256', 'artifact_bytes', 'logs_sha256', 'logs_bytes',
    'metadata_sha256', 'executed_workflow_sha256', 'review',
}


class Rejected(Exception):
    """An evidence requirement was not met; never an accepted partial result."""


def need(condition, message):
    if not condition:
        raise Rejected(message)


def canonical(value):
    return json.dumps(value, sort_keys=True, separators=(',', ':'), allow_nan=False)


def same(left, right):
    # JSON canonical equality distinguishes true/1 and 1/1.0.
    return canonical(left) == canonical(right)


def fields(actual, expected, context):
    need(type(actual) is dict, context + ': expected object')
    for key, value in expected.items():
        need(key in actual and same(actual[key], value), context + ': ' + key)


def digest(data):
    return hashlib.sha256(data).hexdigest()


def file_sha(path):
    hashed = hashlib.sha256()
    with path.open('rb') as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b''):
            hashed.update(block)
    return hashed.hexdigest()


def relative(value):
    need(type(value) is str and bool(value), 'empty/non-string relative path')
    path = PurePosixPath(value)
    need(not path.is_absolute() and path.as_posix() == value and
         not any(part in ('.', '..') for part in path.parts) and
         '\\' not in value and ':' not in value and '\x00' not in value,
         'unsafe relative path: ' + value)
    return value


def regular(path):
    need(not path.is_symlink() and stat.S_ISREG(path.stat().st_mode), 'not a regular file: ' + str(path))
    return path


def scoped_file(root, name):
    path = root
    for part in PurePosixPath(relative(name)).parts:
        path = path / part
        need(not path.is_symlink(), 'symlink in bound file path: ' + str(path))
    return regular(path)


def parse(raw):
    def pairs(items):
        result = {}
        for key, value in items:
            need(key not in result, 'duplicate JSON key: ' + key)
            result[key] = value
        return result
    def invalid(value):
        raise Rejected('non-finite JSON number: ' + value)
    return json.loads(raw, object_pairs_hook=pairs, parse_constant=invalid)


def hex_hash(value, context):
    need(type(value) is str and re.fullmatch('[0-9a-f]{64}', value) is not None, context)


def git_hash(value, context):
    need(type(value) is str and re.fullmatch('[0-9a-f]{40}', value) is not None, context)


def positive_int(value, context):
    need(type(value) is int and value > 0, context)


def zip_inventory(path, logs=False):
    """Hash streams once; retain small JSON/text only, never full machine rows."""
    inventory, contents, names = {}, {}, set()
    with zipfile.ZipFile(regular(path)) as archive:
        for member in archive.infolist():
            name = relative(member.filename[:-1] if member.is_dir() else member.filename)
            need(name not in names, 'duplicate ZIP member: ' + name)
            names.add(name)
            mode = member.external_attr >> 16
            need(not stat.S_ISLNK(mode) and not member.flag_bits & 1,
                 'symlink/encrypted ZIP member: ' + name)
            need(stat.S_IFMT(mode) in (0, stat.S_IFDIR if member.is_dir() else stat.S_IFREG),
                 'special ZIP member: ' + name)
            if member.is_dir():
                continue
            keep = logs or name not in ROWS
            need(not keep or member.file_size <= 128 * 1024 * 1024, 'oversized metadata/log: ' + name)
            hashed, blocks, length = hashlib.sha256(), [], 0
            with archive.open(member) as stream:
                for block in iter(lambda: stream.read(1024 * 1024), b''):
                    hashed.update(block)
                    length += len(block)
                    if keep:
                        blocks.append(block)
            need(length == member.file_size, 'ZIP member size mismatch: ' + name)
            inventory[name] = dict(bytes=length, sha256=hashed.hexdigest(), crc32=member.CRC,
                                   compressed_bytes=member.compress_size, compression=member.compress_type)
            if keep:
                contents[name] = b''.join(blocks)
    return inventory, contents


def load_packet(folder):
    need(folder.is_dir() and not folder.is_symlink(), 'missing/symlink packet directory')
    need({p.name for p in folder.iterdir()} == set(META) | {'artifact.zip', 'logs.zip', 'unpacked'},
         'packet top-level inventory changed')
    raw = {name: scoped_file(folder, name).read_bytes() for name in META}
    inventory, payload = zip_inventory(folder / 'artifact.zip')
    log_inventory, logs = zip_inventory(folder / 'logs.zip', logs=True)
    unpacked = folder / 'unpacked'
    need(unpacked.is_dir() and not unpacked.is_symlink(), 'missing/symlink unpacked directory')
    actual = {}
    for path in unpacked.rglob('*'):
        need(not path.is_symlink(), 'symlink in unpacked artifact')
        if path.is_dir():
            continue
        regular(path)
        name = relative(path.relative_to(unpacked).as_posix())
        actual[name] = dict(bytes=path.stat().st_size, sha256=file_sha(path))
    return dict(raw=raw, meta={k: parse(v) for k, v in raw.items()}, inventory=inventory,
                payload=payload, unpacked_inventory=actual, logs_inventory=log_inventory,
                logs_text='\n'.join(v.decode('utf-8', errors='replace') for v in logs.values()),
                artifact_sha256=file_sha(folder / 'artifact.zip'),
                artifact_bytes=(folder / 'artifact.zip').stat().st_size,
                logs_sha256=file_sha(folder / 'logs.zip'), logs_bytes=(folder / 'logs.zip').stat().st_size)


def source_paths(root):
    paths = {WORKFLOW, BASELINE, 'lakefile.chess-table-full-20261022.toml',
             'Cryptids/Chess/Optimisation/FieldTableSeed.lean', 'Cryptids/Semantics/ChessTableSeed.lean',
             'docs/chess/campaign-2026-10-22/round-04/NATIVE-CONTRACT.md'}
    for directory in ('scripts/chess_table_full_20261022', 'scripts/chess_table_seed_20261022',
                      'Cryptids/Compilation/TableSeed'):
        paths.update(p.relative_to(root).as_posix() for p in (root / directory).glob('*')
                     if p.is_file() and p.suffix in ('.py', '.lean') and p.name != 'check_saved_evidence.py')
    for relative in ('round-04/evidence/packet-02/unpacked', 'round-04/evidence/controller-01/unpacked'):
        folder = root / 'docs/chess/campaign-2026-10-22' / relative
        need(folder.is_dir(), 'required independent oracle packet missing: ' + relative)
        paths.update(p.relative_to(root).as_posix() for p in folder.rglob('*') if p.is_file())
    required = {'scripts/chess_table_full_20261022/' + name for name in
                ('verify.py', 'full.py', 'fixtures.py', 'Export.lean', 'Audit.lean')}
    required |= {'Cryptids/Compilation/TableSeed/' + name for name in
                 ('Controller.lean', 'Format.lean', 'Blocks.lean', 'Correct.lean', 'ChessCodec.lean')}
    need(required <= paths, 'incomplete computation source inventory')
    return paths


def source_snapshot(root):
    source = {name: file_sha(scoped_file(root, name)) for name in sorted(source_paths(root))}
    pins = parse(scoped_file(root, BASELINE).read_bytes())
    need(type(pins) is dict and len(pins) == 2983, 'baseline must contain exactly 2983 frozen files')
    for name, expected in pins.items():
        hex_hash(expected, 'invalid frozen hash: ' + name)
        need(file_sha(scoped_file(root, name)) == expected, 'frozen prior source changed: ' + name)
    # A conservative import-file integrity check supplements, never replaces, the
    # remote kernel/declaration audit. It does not interpret Lean expressions.
    bound, pending, seen = set(source) | set(pins), [n for n in source if n.endswith('.lean')], set()
    while pending:
        name = pending.pop()
        if name in seen:
            continue
        seen.add(name)
        for line in scoped_file(root, name).read_text().splitlines():
            match = re.fullmatch(r'\s*(?:public\s+)?(?:meta\s+)?import\s+([^\n]+)', line.split('--', 1)[0])
            if match:
                for module in match[1].split():
                    if module.split('.', 1)[0] in {'Cryptids', 'Challenge', 'BusyBeaver', 'BusyBeaverChallenge'}:
                        imported = module.replace('.', '/') + '.lean'
                        need(imported in bound, 'unbound repository import: ' + module)
                        pending.append(imported)
    return dict(source=source, pins=pins, baseline_sha256=file_sha(root / BASELINE),
                checker_sha256=file_sha(HERE), import_files=len(seen))


def validate_seal(seal, snapshot, packet):
    need(type(seal) is dict and set(seal) == SEAL_KEYS, 'seal field inventory changed')
    fields(seal, dict(schema=SCHEMA, status='accepted', claim=CLAIM, repository=REPO), 'seal claim/status')
    review = seal['review']
    need(type(review) is dict and set(review) == {'kind', 'status', 'report_path', 'report_sha256',
         'human_approval', 'formal_verification_by_reviewer', 'local_heavy_computation'}, 'review seal inventory')
    fields(review, dict(kind='independent-model-advisory', status='passed', human_approval=False,
                       formal_verification_by_reviewer=False, local_heavy_computation=False), 'review authority')
    relative(review['report_path'])
    hex_hash(review['report_sha256'], 'invalid review report hash')
    need(review['report_sha256'] == snapshot['review_sha256'], 'independent review report hash changed')
    for key in ('workflow_commit', 'computation_commit'):
        git_hash(seal[key], 'invalid sealed commit: ' + key)
    for key in ('checker_sha256', 'source_manifest_sha256', 'baseline_pins_sha256', 'artifact_sha256', 'logs_sha256'):
        hex_hash(seal[key], 'invalid sealed hash: ' + key)
    for key in ('run_id', 'artifact_id', 'artifact_bytes', 'logs_bytes'):
        positive_int(seal[key], 'invalid sealed number: ' + key)
    need(seal['checker_sha256'] == snapshot['checker_sha256'], 'sealed checker hash changed')
    hex_hash(snapshot['review']['checker_sha256'], 'invalid independent review checker hash')
    need(snapshot['review']['checker_sha256'] == snapshot['checker_sha256'] == seal['checker_sha256'],
         'independent review checker hash changed')
    need(seal['baseline_pins_sha256'] == snapshot['baseline_sha256'], 'sealed baseline pin hash changed')
    need(set(seal['metadata_sha256']) == set(META), 'sealed metadata inventory changed')
    for name in META:
        hex_hash(seal['metadata_sha256'][name], 'invalid sealed metadata hash')
        need(digest(packet['raw'][name]) == seal['metadata_sha256'][name], 'sealed metadata hash changed: ' + name)
        need(same(parse(packet['raw'][name]), packet['meta'][name]), 'parsed metadata differs from retained bytes: ' + name)
    for key in ('artifact_sha256', 'artifact_bytes', 'logs_sha256', 'logs_bytes'):
        need(same(packet[key], seal[key]), 'sealed archive identity changed: ' + key)
    need(digest(packet['payload']['source-manifest.json']) == seal['source_manifest_sha256'],
         'sealed source manifest hash changed')
    fields(snapshot['review'], dict(schema='chess-table-full-review-v1', status='passed', verdict='correct',
        review_kind='independent-model-advisory', claim=CLAIM, run_id=seal['run_id'],
        workflow_commit=seal['workflow_commit'], computation_commit=seal['computation_commit'],
        source_manifest_sha256=seal['source_manifest_sha256'], artifact_sha256=seal['artifact_sha256'],
        human_approval=False, formal_verification_by_reviewer=False, local_heavy_computation=False),
        'independent review report identity/authority')
    narrative = snapshot['review']['narrative_path']
    relative(narrative)
    need(narrative == snapshot['narrative_path'], 'independent review narrative path changed')
    hex_hash(snapshot['review']['narrative_sha256'], 'invalid review narrative hash')
    need(snapshot['review']['narrative_sha256'] == snapshot['narrative_sha256'] == digest(snapshot['narrative_raw']),
         'independent review narrative hash changed')


def validate_provenance(packet, seal, manifest):
    meta = packet['meta']
    run, jobs, artifact, retained = (meta[name] for name in META[:4])
    run_id, commit, workflow = seal['run_id'], seal['computation_commit'], seal['workflow_commit']
    run_url = f'https://github.com/{REPO}/actions/runs/{run_id}'
    api_run = f'https://api.github.com/repos/{REPO}/actions/runs/{run_id}'
    fields(run, dict(id=run_id, head_sha=workflow, head_branch=BRANCH, path=WORKFLOW,
                     name='Chess complete structured initializer', event='workflow_dispatch',
                     status='completed', conclusion='success', html_url=run_url, url=api_run), 'remote run identity')
    fields(run['repository'], {'full_name': REPO}, 'remote repository')
    fields(artifact, dict(id=seal['artifact_id'], name=seal['artifact_name'], expired=False,
                         digest='sha256:' + packet['artifact_sha256'], size_in_bytes=packet['artifact_bytes']),
           'artifact API identity')
    artifact_url = f'https://api.github.com/repos/{REPO}/actions/artifacts/{seal["artifact_id"]}'
    fields(artifact, dict(url=artifact_url, archive_download_url=artifact_url + '/zip'), 'artifact API URL')
    fields(artifact['workflow_run'], dict(id=run_id, head_sha=workflow, head_branch=BRANCH), 'artifact run identity')
    fields(retained, dict(schema='chess-goal-retention-v1', repository=REPO, run_id=run_id,
                         run_url=run_url, run_conclusion='success', workflow_commit=workflow,
                         computation_commit=commit, artifact_id=seal['artifact_id'], artifact_name=seal['artifact_name'],
                         artifact_sha256=packet['artifact_sha256'], artifact_bytes=packet['artifact_bytes'],
                         logs_sha256=packet['logs_sha256'], logs_bytes=packet['logs_bytes'],
                         certifies_new_machine=False), 'retention identity/scope')
    fields(manifest, dict(commit=commit, workflow_commit=workflow, run_id=str(run_id)), 'manifest provenance')
    need(same(packet['inventory'], meta['archive-entries.json']), 'archive inventory digest/CRC changed')
    unpacked = {name: {key: entry[key] for key in ('bytes', 'sha256')} for name, entry in packet['inventory'].items()}
    need(same(unpacked, packet['unpacked_inventory']), 'unpacked byte inventory changed')
    need(seal['artifact_name'] == 'chess-table-full-full-' + commit and commit == workflow,
         'direct full artifact identity changed')
    need(seal['executed_workflow_sha256'] is None, 'direct run unexpectedly has a session workflow')
    need(not {'session-binding.json', 'session-result.json', 'executed-workflow.yml'} & set(packet['inventory']),
         'session files in direct artifact')
    active_job = 'verify'
    required_steps = ('Fetch pinned Mathlib cache', 'Complete remote verification')
    need(type(jobs['jobs']) is list and jobs['total_count'] == len(jobs['jobs']) and
         len(jobs['jobs']) == 1, 'job API is incomplete or unexpected')
    selected = [job for job in jobs['jobs'] if job['name'] == active_job]
    need(len(selected) == 1 and len({job['id'] for job in jobs['jobs']}) == len(jobs['jobs']), 'active job inventory changed')
    for job in jobs['jobs']:
        fields(job, dict(run_id=run_id, head_sha=workflow, head_branch=BRANCH, status='completed'), 'job provenance')
        positive_int(job['id'], 'invalid job ID')
        fields(job, dict(url=f'https://api.github.com/repos/{REPO}/actions/jobs/{job["id"]}',
                         html_url=run_url + f'/job/{job["id"]}'), 'job URLs')
        need(job['name'] == 'verify', 'unknown workflow job')
        need(job['conclusion'] == ('success' if job is selected[0] else 'skipped'), 'job conclusion changed')
    for name in required_steps:
        steps = [step for step in selected[0]['steps'] if step['name'] == name]
        need(len(steps) == 1, 'required workflow step missing: ' + name)
        fields(steps[0], dict(status='completed', conclusion='success'), 'required workflow step failed: ' + name)
    return False


def command_specs(remote, python):
    build = ['lake', '--wfail', '-f', 'lakefile.chess-table-full-20261022.toml', 'build']
    specs = [(build + ['Cryptids.Semantics.ChessTableSeed', 'chess_table_full_audit', 'chess_table_full_export'],
              0, 'Build completed successfully', 1800)]
    audit = ['prlimit', '--as=17179869184', '--', 'lake', 'env', remote + '/.lake/build/bin/chess_table_full_audit']
    specs.append((audit, 0, 'Chess table seed foundation audit passed', 600))
    for flag, marker in (('--negative-control', 'Forbidden axiom: sorryAx'),
                         ('--negative-control-open', 'The open chess conjecture is a dependency'),
                         ('--negative-control-generator', 'Proof generator is a mathematical dependency:')):
        specs.append((audit + [flag], 1, marker, 600))
    for name in CONTRACTS:
        specs.append((['lake', 'env', 'lean', '-M6144', '-DwarningAsError=true',
                       remote + '/.lake/chess-table-full-20261022/' + name + '.lean'], 1, 'is false', 300))
    specs.append((['prlimit', '--stack=67108864', '--', 'lake', 'env',
                   remote + '/.lake/build/bin/chess_table_full_export', remote + '/.lake/chess-table-full-20261022/machine-export.json'],
                  0, 'Table seed complete native export passed', 1200))
    specs.append(([python, 'scripts/chess_table_full_20261022/fixtures.py'], 0, 'Table seed complete independent fixtures passed', 1200))
    specs.append((build + ['Cryptids.Chess.Fixtures', 'Cryptids.Chess.Evaluation',
                           'Cryptids.Semantics.ChessFieldSelective', 'Cryptids.Semantics.ChessSeed',
                           'Cryptids.Compilation.FieldBranch.Certificate'],
                  0, 'Build completed successfully', 1200))
    for name, marker, args in (
        ('scripts/RunChessM2.lean', 'Rule fixtures passed:', ['--rules']),
        ('scripts/RunChessM3.lean', 'Chess M3 fixtures passed:', []),
        ('scripts/RunChessM4.lean', 'Chess M4 fixtures passed:', []),
        ('scripts/RunChessM5.lean', '16 assertions', []),
        ('scripts/chess_m6/SharedFixtures.lean', 'Shared fixtures passed:', []),
        ('scripts/chess_m7/Fixtures.lean', 'M7 quotient fixtures passed', []),
        ('scripts/chess_openevolve/Fixtures.lean', 'Terminal binary fixtures passed', [])):
        mode = [] if name == 'scripts/chess_m6/SharedFixtures.lean' else ['--run']
        specs.append((['lake', 'env', 'lean', '-M6144', '-DwarningAsError=true'] + mode + [name] + args,
                      0, marker, 600))
    return specs


def validate_commands(packet, manifest):
    phases = {name: parse(packet['payload'][name + '.json']) for name in PHASES}
    checks = phases['full']['checks']
    need(type(checks) is list and len(checks) == 20, 'full command inventory changed')
    remote = checks[0]['cwd']
    need(type(remote) is str and remote.startswith('/home/runner/work/') and
         PurePosixPath(remote).as_posix() == remote and '..' not in PurePosixPath(remote).parts,
         'unexpected remote working directory')
    python = checks[11]['argv'][0]
    need(type(python) is str and python.startswith('/') and
         re.fullmatch(r'python(?:3(?:\.[0-9]+)?)?', PurePosixPath(python).name) is not None,
         'unexpected remote Python executable')
    specs = command_specs(remote, python)
    for index, (check, (argv, exit_code, marker, timeout)) in enumerate(zip(checks, specs)):
        fields(check, dict(argv=argv, cwd=remote, shell=False, exit=exit_code, timed_out=False,
                           timeout_seconds=timeout), 'command identity/disposition ' + str(index))
        need(type(check['output']) is str and marker in check['output'], 'command success/failure marker: ' + marker)
        need(digest(check['output'].encode()) == check['output_sha256'], 'command output hash changed')
        elapsed = check['elapsed_seconds']
        need(type(elapsed) in (int, float) and math.isfinite(elapsed) and 0 <= elapsed <= timeout + 30,
             'command duration invalid')
        positive_int(check['cumulative_children_peak_rss_kib'], 'command memory receipt invalid')
    for name, length in PHASES.items():
        phase = phases[name]
        fields(phase, dict(manifest, status='passed', phase=name), 'phase source/status: ' + name)
        need(same(phase['checks'], checks[:length]), 'cumulative phase command mismatch: ' + name)
    standalone = {name: parse(raw) for name, raw in packet['payload'].items() if name.startswith('commands/')}
    need(len(standalone) == len(checks) and
         all(re.fullmatch(r'commands/[0-9]+\.json', name) for name in standalone), 'standalone command file inventory')
    recorded = [canonical(value) for value in standalone.values()]
    need(len(set(recorded)) == 20 and set(recorded) == {canonical(value) for value in checks},
         'standalone and phase command receipts differ')
    for name, statement in CONTRACTS.items():
        source = ('import Cryptids.Semantics.ChessTableSeed\n'
                  'open Chess.Optimisation Chess.Optimisation.FieldTableSeed\n' + statement + '\n')
        need(packet['payload'][name + '.lean'].decode() == source, 'false kernel contract source changed: ' + name)
    unrelated = ('unknown constant', 'unknown identifier', 'unknown namespace', 'unknown module',
                 'object file', 'file not found', 'failed to synthesize', 'deep recursion',
                 'maximum recursion', 'timeout', 'unknown tactic', 'unsolved goals')
    for check in checks[2:5]:
        output = check['output']
        need('Chess table seed foundation audit passed' not in output and
             not any(token in output.lower() for token in unrelated),
             'audit control failed for unrelated reason')
    for check in checks[5:10]:
        output = check['output']
        need('Tactic `decide` proved that the proposition' in output and 'is false' in output and
             not any(token in output.lower() for token in unrelated), 'kernel contract failed for unrelated reason')
    audit = checks[1]['output']
    need(re.search(r'Audited [1-9][0-9]* ChessTableSeed foundation roots and [1-9][0-9]* dependencies', audit) is not None and
         'Meta certificate generator roots outside safe roots: 0' in audit and
         'Compiler artifacts outside safe roots:' in audit and
         'Permitted axioms: #[propext, Classical.choice, Quot.sound]' in audit,
         'safe proof closure audit incomplete')
    for marker in ('Forbidden axiom:', 'Unsafe or partial dependency:', 'Required construction proof is missing:',
                   'The open chess conjecture is a dependency', 'Proof generator is a mathematical dependency:'):
        need(marker not in audit, 'safe proof closure audit contains rejection')
    for marker in ('Complete paid table seed chess reduction passed', 'Table seed complete native export passed',
                   'Table seed complete independent fixtures passed', 'Chess table seed foundation audit passed'):
        need(marker in packet['logs_text'], 'workflow log marker missing: ' + marker)
    return phases


def validate_scope(packet, phases):
    """Check retained finite receipts, never decode input, interpret rows, or simulate."""
    detail = parse(packet['payload']['fixtures-detail.json'])
    native = parse(packet['payload']['machine-export.json'])
    fields(detail, dict(status='passed', states=769344, previous_states=998176,
        saved_states=228832, initializer_states=173642, decoder_states=21682,
        decoder_bridge_states=1, seed_controller_states=216, seed_bridge_states=1, body_states=573802,
        complete_full_rows_verified=True, complete_full_rows_checked=1538688,
        static_full_input_verified=True, initializer_verified=True, composed_fixtures_verified=True,
        composed_fixture_count=20, native_fixture_count=14, negative_control_count=37,
        completed_fixtures=20, completed_controls=37, positive_controls_ran_first=True,
        full_quadratic_startup_executed=False, universal_proof=False, new_accepted_machine=False,
        accepted_states_before_this_run=998176, timeouts_counted_as_rejections=0,
        run_id=phases['full']['run_id'], commit=phases['full']['commit']), 'independent remote scope')
    need(set(native) == {'schema', 'metadata', 'packet', 'writer', 'full_rows', 'decoder_rows',
         'expander_rows', 'complete_startup_fixtures', 'full_quadratic_startup_executed'},
         'native payload field inventory changed')
    # Hash canonical JSON values without evaluating transitions or computing a row census.
    # These hashes come from the separately byte-pinned tables.
    need(digest(canonical(native['decoder_rows']).encode()) == DECODER_ROWS_SHA,
         'native decoder table JSON hash changed')
    need(digest(canonical(native['expander_rows']).encode()) == EXPANDER_ROWS_SHA,
         'native expander table JSON hash changed')
    fields(native, dict(schema='chess-table-seed-full-v1', full_quadratic_startup_executed=False),
           'native execution scope')
    need(same(native['metadata'], ALLOCATION), 'native machine allocation')
    need(same(detail['allocation'], ALLOCATION), 'independent machine allocation')
    need(same(detail['pinned_inputs'], PINNED_INPUTS), 'independent input pin inventory')
    hashes = {name: packet['inventory'][name]['sha256'] for name in
              ('machine-export.json', 'full-rows.bin', 'fixtures-detail.json')}
    for name in ('counts', 'full'):
        need(same(phases[name]['detail'], detail), 'phase fixture detail differs')
        need(same(phases[name]['artifact_sha256'], hashes), 'phase artifact hashes changed')
    fixture_hash = phases['full']['source_sha256']['scripts/chess_table_full_20261022/fixtures.py']
    need(same(detail['artifact_sha256'], dict(checker=fixture_hash,
         **{name: hashes[name] for name in ('machine-export.json', 'full-rows.bin')})),
         'fixture artifact or independent checker hashes changed')
    fields(native['full_rows'], dict(filename='full-rows.bin', format='<BBI', record_bytes=6,
        states=769344, rows=1538688, bytes=9232128, missing_rows=2,
        missing_encoding=[2, 0, 0], direction_left=0, direction_right=1,
        order='state-major,bit-0-before-1', native_machine_rowMachine_equal=True), 'native full row inventory')
    need(packet['inventory']['full-rows.bin']['bytes'] == 9232128, 'full row artifact byte census changed')
    fields(detail['complete_row_census'], dict(states=769344, rows=1538688, missing_rows=2,
        sha256=hashes['full-rows.bin'], every_allocated_row_equal=True), 'independent full row census')
    bits = native['packet']
    need(type(bits) is str and len(bits) == 173641 and digest(bits.encode('ascii')) == PACKET_SHA,
         'full packet bytes/hash changed')
    fields(detail['static_input'], dict(source_rows=5952, symbols=141380, packet_bits=173641,
        seed_bits=424156, field_bits=1837940, packet_sha256=PACKET_SHA,
        seed_sha256=PINNED_INPUTS['decoded-seed.bits'], symbols_sha256=PINNED_INPUTS['source-symbols.u8'],
        field_sha256=TARGET_SHA, all_original_rows_and_symbols_equal=True,
        all_packet_bits_consumed=True, complete_static_field_tape_equal=True), 'full static input identity receipt')
    fields(native['writer'], dict(steps=173642, state=173642, head=-173640,
        tape=bits, normalized_head=0, frame_min=-173641, frame_max=1,
        both_exteriors_zero=True, actual_and_numeric_replayed=True), 'native paid writer')
    fields(detail['writer'], dict(steps=173642, state=173642, head=-173640,
        complete_support_equal=True, both_exteriors_zero=True), 'independent paid writer')
    fields(detail['limits'], dict(wall_seconds=540, memory_bytes=4294967296,
        per_case_steps=4000000, batch_steps=50000000), 'independent fixture resource limits')
    elapsed = detail['elapsed_seconds']
    need(type(elapsed) in (int, float) and math.isfinite(elapsed) and 0 <= elapsed <= 545,
         'independent fixture elapsed receipt')
    need(type(detail['total_simulated_steps']) is int and 0 < detail['total_simulated_steps'] <= 50000000,
         'independent fixture batch receipt')
    positive_int(detail['peak_rss_kib'], 'independent fixture memory receipt')
    cases, composed = native['complete_startup_fixtures'], detail['composed_fixtures']
    need(type(cases) is list and len(cases) == 14 and type(composed) is list and len(composed) == 20,
         'complete startup fixture inventory')
    expected_order = [(index, origin) for index in range(14)
                      for origin in ((0, -37, 101) if index in (0, 2, 10) else (0,))]
    need([(record['index'], record['origin']) for record in composed] == expected_order,
         'complete translated fixture inventory')
    by_case = {(record['index'], record['origin']): record for record in composed}
    for index, (actual, (name, pre, table, post)) in enumerate(zip(cases, TOYS)):
        need(set(actual) == {'name', 'pre', 'table', 'post', 'packet', 'seed', 'states', 'body_entry',
             'rows', 'steps', 'step_cap', 'head', 'state', 'support', 'output', 'visited_min', 'visited_max',
             'frame_min', 'frame_max', 'both_exteriors_zero', 'actual_native_executed', 'decoder_seed_checked'},
             'native toy field inventory changed')
        fields(actual, dict(name=name, pre=pre, table=table, post=post, step_cap=4000000,
            both_exteriors_zero=True, actual_native_executed=True, decoder_seed_checked=True), 'native toy identity/scope')
        saved = by_case[index, 0]
        fields(saved, dict(name=name, index=index, origin=0, all_rows_equal=True,
            complete_support_equal=True, decoder_seed_verified=True), 'independent startup scope')
        for key in ('states', 'steps', 'head', 'state', 'support', 'visited_min', 'visited_max'):
            need(same(actual[key], saved[key]), 'startup native/independent receipt differs: ' + key)
        for key in ('states', 'steps', 'body_entry'):
            positive_int(actual[key], 'invalid native toy receipt ' + key)
        need(type(actual['state']) is int and actual['state'] == actual['body_entry'] and
             actual['body_entry'] + 1 == actual['states'] and actual['steps'] < actual['step_cap'],
             'toy endpoint/paid-state receipt')
        need(type(saved['letters']) is int and 1 <= saved['letters'] <= 100, 'toy literal input size receipt')
        need(all(type(actual[key]) is int for key in ('head', 'visited_min', 'visited_max', 'frame_min', 'frame_max')) and
             actual['frame_min'] <= actual['visited_min'] <= actual['visited_max'] <= actual['frame_max'],
             'toy visited-frame receipt')
        need(type(actual['support']) is list and all(type(position) is int for position in actual['support']),
             'toy support metadata malformed')
        for origin in ((-37, 101) if index in (0, 2, 10) else ()):
            translated = by_case[index, origin]
            fields(translated, dict(name=name, index=index, origin=origin, letters=saved['letters'],
                states=saved['states'], state=saved['state'], steps=saved['steps'],
                head=saved['head'] + origin, visited_min=saved['visited_min'] + origin,
                visited_max=saved['visited_max'] + origin, support=[point + origin for point in saved['support']],
                all_rows_equal=True, complete_support_equal=True), 'translated complete startup receipt')
    need(detail['maximum_fixture_steps'] == max(case['steps'] for case in composed),
         'maximum fixture steps receipt changed')
    controls = detail['mutation_controls']
    need(type(controls) is list and [item['name'] for item in controls] == list(MUTATIONS),
         '37 exact corruption controls missing')
    for control, (_, stage) in zip(controls, MUTATION_STAGES):
        fields(control, dict(rejected=True, stage=stage, original_positive_passed=True,
            timeout_counted_as_rejection=False), 'mutation disposition/stage changed')
        need(type(control['reason']) is str and bool(control['reason'].strip()), 'mutation rejection reason missing')
    # Progress records are retained for diagnosis; their producer deliberately
    # leaves status=running even when the authoritative detail receipt passed.
    progress = parse(packet['payload']['fixtures-progress.json'])
    fields(progress, dict(phase='mutation_controls', status='running',
        current_control='behavior_old_bridge', current_expected_rejection='boundary_behavior'),
        'final progress breadcrumb changed')
    return detail


def validate(packet, snapshot, seal):
    """Pure checks of loaded receipts; the same routine is used for hostile controls."""
    validate_seal(seal, snapshot, packet)
    manifest = parse(packet['payload']['source-manifest.json'])
    need(set(manifest) == {'commit', 'run_id', 'workflow_commit', 'source_sha256', 'frozen_source_sha256'},
         'source manifest field inventory changed')
    manifest_sources = dict(manifest['source_sha256'])
    need(CHECKER not in manifest_sources, 'checker must be independently sealed outside computation inventory')
    need(same(manifest_sources, snapshot['source']), 'current computation source binding changed')
    need(same(manifest['frozen_source_sha256'], snapshot['pins']), '2983 frozen-source manifest pins changed')
    validate_provenance(packet, seal, manifest)
    expected = {'source-manifest.json', 'machine-export.json', 'fixtures-detail.json', 'fixtures-progress.json'} | ROWS | {
        name + '.json' for name in PHASES} | {name + '.lean' for name in CONTRACTS}
    command_files = {name for name in packet['inventory'] if re.fullmatch(r'commands/[0-9]+\.json', name)}
    need(set(packet['inventory']) == expected | command_files, 'exact artifact file inventory changed')
    need(set(packet['payload']) == set(packet['inventory']) - ROWS, 'retained metadata payload inventory changed')
    for name, raw in packet['payload'].items():
        entry = packet['inventory'][name]
        need(len(raw) == entry['bytes'] and digest(raw) == entry['sha256'],
             'retained metadata payload hash/bytes changed: ' + name)
    phases = validate_commands(packet, manifest)
    detail = validate_scope(packet, phases)
    return dict(schema='chess-table-full-metadata-receipt-v1', status='passed', claim=CLAIM,
                run_id=seal['run_id'], workflow_commit=seal['workflow_commit'], computation_commit=seal['computation_commit'],
                artifact_id=seal['artifact_id'], artifact_sha256=packet['artifact_sha256'], logs_sha256=packet['logs_sha256'],
                source_manifest_sha256=seal['source_manifest_sha256'], frozen_files_checked=len(snapshot['pins']),
                repository_import_files_checked=snapshot['import_files'], phases=list(PHASES),
                unique_commands=len(phases['full']['checks']),
                cumulative_phase_receipts=sum(len(phase['checks']) for phase in phases.values()),
                saved_composed_fixtures=detail['composed_fixture_count'],
                saved_native_fixtures=detail['native_fixture_count'],
                saved_full_rows=detail['complete_full_rows_checked'], saved_corruption_controls=len(MUTATIONS),
                local_heavy_computation=False, independent_local_recount=False,
                formal_verification_by_reviewer=False, human_approval=False)


def self_test(packet, snapshot, seal):
    """Mutate metadata only after a positive control, without rereading row bytes.

Some controls refresh enclosing hashes in memory deliberately: they test semantic
receipt checks independently of the outer seal. They never write a seal, modify
an evidence file, or grant authority to altered evidence.
"""
    validate(packet, snapshot, seal)
    mutations = []

    def add(name, scope, error, mutate):
        mutations.append((name, scope, error, mutate))

    add('sealed_claim', 'seal', 'seal claim/status', lambda x: x['claim'].__setitem__('states', 769343))
    add('review_hash', 'seal', 'independent review report hash changed', lambda x: x['review'].__setitem__('report_sha256', '0' * 64))
    add('narrative_hash', 'snapshot', 'independent review narrative hash changed', lambda x: x['review'].__setitem__('narrative_sha256', '0' * 64))
    add('narrative_content', 'snapshot', 'independent review narrative hash changed', lambda x: x.__setitem__('narrative_raw', x['narrative_raw'] + b'\ncorrupted advisory narrative\n'))
    add('review_run', 'snapshot', 'independent review report identity/authority', lambda x: x['review'].__setitem__('run_id', 1))
    add('checker_hash', 'seal', 'sealed checker hash changed', lambda x: x.__setitem__('checker_sha256', '0' * 64))
    add('review_checker_hash', 'snapshot', 'independent review checker hash changed', lambda x: x['review'].__setitem__('checker_sha256', '0' * 64))
    add('metadata_hash', 'seal', 'sealed metadata hash changed', lambda x: x['metadata_sha256'].__setitem__('run-api.json', '0' * 64))
    add('artifact_hash', 'seal', 'sealed archive identity changed', lambda x: x.__setitem__('artifact_sha256', '0' * 64))
    add('source_manifest_hash', 'seal', 'sealed source manifest hash changed', lambda x: x.__setitem__('source_manifest_sha256', '0' * 64))
    add('frozen_pin', 'snapshot', '2983 frozen-source manifest pins changed', lambda x: x['pins'].__setitem__(next(iter(x['pins'])), '0' * 64))
    add('source_hash', 'snapshot', 'current computation source binding changed', lambda x: x['source'].__setitem__('scripts/chess_table_full_20261022/fixtures.py', '0' * 64))
    add('api_conclusion', 'meta:run-api.json', 'remote run identity', lambda x: x.__setitem__('conclusion', 'failure'))
    add('workflow_identity', 'meta:run-api.json', 'remote run identity', lambda x: x.__setitem__('head_sha', '0' * 40))
    add('artifact_run_identity', 'meta:artifact-api.json', 'artifact run identity', lambda x: x['workflow_run'].__setitem__('id', 1))
    add('payload_bytes', 'packet', 'retained metadata payload hash/bytes changed', lambda x: x['payload'].__setitem__('full.json', x['payload']['full.json'] + b' '))
    add('unpacked_hash', 'packet', 'unpacked byte inventory changed', lambda x: x['unpacked_inventory']['full-rows.bin'].__setitem__('sha256', '0' * 64))
    add('archive_crc', 'meta:archive-entries.json', 'archive inventory digest/CRC changed', lambda x: x['full-rows.bin'].__setitem__('crc32', -1))
    add('missing_phase', 'packet', 'exact artifact file inventory changed', lambda x: x['inventory'].pop('counts.json'))
    add('command_exit', 'payload:full.json', 'command identity/disposition', lambda x: x['checks'][0].__setitem__('exit', 1))
    add('intentional_failure_exit', 'payload:full.json', 'command identity/disposition', lambda x: x['checks'][2].__setitem__('exit', 0))
    add('command_timeout', 'payload:full.json', 'command identity/disposition', lambda x: x['checks'][0].__setitem__('timed_out', True))
    add('command_output_hash', 'payload:full.json', 'command output hash changed', lambda x: x['checks'][0].__setitem__('output_sha256', '0' * 64))
    add('success_marker', 'command:0', 'command success/failure marker', lambda x: x.__setitem__('output', 'No build result'))
    add('audit_axioms', 'command:1', 'safe proof closure audit incomplete', lambda x: x.__setitem__('output', x['output'].replace('Permitted axioms: #[propext, Classical.choice, Quot.sound]', 'Permitted axioms: #[sorryAx]')))
    add('unrelated_kernel_failure', 'command:5', 'kernel contract failed for unrelated reason', lambda x: x.__setitem__('output', x['output'] + '\nunknown identifier'))
    add('native_decoder_table', 'payload:machine-export.json', 'native decoder table JSON hash changed', lambda x: x.__setitem__('decoder_rows', []))
    add('native_expander_table', 'payload:machine-export.json', 'native expander table JSON hash changed', lambda x: x.__setitem__('expander_rows', []))
    add('native_payload_inventory', 'payload:machine-export.json', 'native payload field inventory changed', lambda x: x.pop('decoder_rows'))
    add('native_toy_inventory', 'payload:machine-export.json', 'native toy field inventory changed', lambda x: x['complete_startup_fixtures'][0].pop('rows'))
    add('native_bridge_allocation', 'payload:machine-export.json', 'native machine allocation', lambda x: x['metadata'].__setitem__('new_bridge_states', 0))
    add('native_old_bridge', 'payload:machine-export.json', 'native machine allocation', lambda x: x['metadata'].__setitem__('old_bridge_states', 0))
    add('phase_inventory', 'payload:contracts.json', 'cumulative phase command mismatch', lambda x: x['checks'].pop())
    add('full_rows', 'detail', 'independent remote scope', lambda x: x.__setitem__('complete_full_rows_checked', 1538687))
    add('full_row_census', 'detail', 'independent full row census', lambda x: x['complete_row_census'].__setitem__('rows', 1538687))
    add('paid_decoder', 'detail', 'independent remote scope', lambda x: x.__setitem__('decoder_states', 21681))
    add('paid_expander', 'detail', 'independent remote scope', lambda x: x.__setitem__('seed_controller_states', 215))
    add('initializer_head', 'detail', 'independent paid writer', lambda x: x['writer'].__setitem__('head', 0))
    add('native_writer_head', 'payload:machine-export.json', 'native paid writer', lambda x: x['writer'].__setitem__('head', 0))
    add('static_packet_hash', 'detail', 'full static input identity receipt', lambda x: x['static_input'].__setitem__('packet_sha256', '0' * 64))
    add('original_input_pin', 'detail', 'independent input pin inventory', lambda x: x['pinned_inputs'].__setitem__('original-machine', '0' * 64))
    add('independent_fixture_hash', 'detail', 'fixture artifact or independent checker hashes changed', lambda x: x['artifact_sha256'].__setitem__('checker', '0' * 64))
    add('full_startup_claim', 'detail', 'independent remote scope', lambda x: x.__setitem__('full_quadratic_startup_executed', True))
    add('composed_inventory', 'detail', 'complete startup fixture inventory', lambda x: x['composed_fixtures'].pop())
    add('composed_exterior', 'detail', 'independent startup scope', lambda x: x['composed_fixtures'][0].__setitem__('complete_support_equal', False))
    add('toy_translation', 'detail', 'translated complete startup receipt', lambda x: x['composed_fixtures'][1].__setitem__('head', 0))
    add('native_decoder_seed', 'payload:machine-export.json', 'native toy identity/scope', lambda x: x['complete_startup_fixtures'][0].__setitem__('decoder_seed_checked', False))
    add('mutation_inventory', 'detail', '37 exact corruption controls missing', lambda x: x['mutation_controls'].pop())
    add('mutation_acceptance', 'detail', 'mutation disposition/stage changed', lambda x: x['mutation_controls'][0].__setitem__('rejected', False))
    add('mutation_stage', 'detail', 'mutation disposition/stage changed', lambda x: x['mutation_controls'][0].__setitem__('stage', 'allocation'))
    add('mutation_timeout', 'detail', 'mutation disposition/stage changed', lambda x: x['mutation_controls'][0].__setitem__('timeout_counted_as_rejection', True))
    add('mutation_positive', 'detail', 'mutation disposition/stage changed', lambda x: x['mutation_controls'][0].__setitem__('original_positive_passed', False))

    for name, scope, expected, mutate in mutations:
        p, s, b = copy.deepcopy(packet), copy.deepcopy(snapshot), copy.deepcopy(seal)
        if scope == 'seal':
            mutate(b)
        elif scope == 'snapshot':
            mutate(s)
        elif scope == 'packet':
            mutate(p)
            if name == 'missing_phase':
                # Keep byte inventories mutually consistent to reach the explicit phase guard.
                p['meta']['archive-entries.json'].pop('counts.json')
                p['unpacked_inventory'].pop('counts.json')
                p['payload'].pop('counts.json')
        else:
            category, _, filename = scope.partition(':')
            if scope == 'detail':
                value = parse(p['payload']['fixtures-detail.json'])
                mutate(value)
                p['payload']['fixtures-detail.json'] = canonical(value).encode()
                for phase in ('counts', 'full'):
                    report = parse(p['payload'][phase + '.json'])
                    report['detail'] = value
                    p['payload'][phase + '.json'] = canonical(report).encode()
            elif category == 'meta':
                mutate(p['meta'][filename])
            elif category == 'command':
                index = int(filename)
                original = parse(p['payload']['full.json'])['checks'][index]
                changed = copy.deepcopy(original)
                mutate(changed)
                changed['output_sha256'] = digest(changed['output'].encode())
                for phase, length in PHASES.items():
                    if index < length:
                        report = parse(p['payload'][phase + '.json'])
                        report['checks'][index] = changed
                        p['payload'][phase + '.json'] = canonical(report).encode()
                for command_name in p['payload']:
                    if command_name.startswith('commands/') and same(parse(p['payload'][command_name]), original):
                        p['payload'][command_name] = canonical(changed).encode()
            else:
                value = parse(p['payload'][filename])
                mutate(value)
                p['payload'][filename] = canonical(value).encode()
        if scope.startswith(('payload:', 'command:')) or scope == 'detail':
            rebind_metadata_for_test(p)
        # Metadata raw hashes are refreshed solely inside this hostile copy.
        if scope.startswith(('meta:', 'payload:', 'command:')) or scope == 'detail' or name == 'missing_phase':
            for filename in META:
                p['raw'][filename] = canonical(p['meta'][filename]).encode()
                b['metadata_sha256'][filename] = digest(p['raw'][filename])
        try:
            validate(p, s, b)
        except Rejected as error:
            need(expected in str(error), f'control {name} rejected at wrong guard: {error}')
        else:
            raise Rejected('evidence corruption escaped: ' + name)
    return [name for name, *_ in mutations]


def rebind_metadata_for_test(packet):
    """Test-only synthetic inner hash bindings; never write or rehash large rows.

    Outer ZIP bytes stay fixed in memory to bypass the already-tested seal layer.
    This is called only by hostile tests, after their original positive control.
    """
    def bind(name):
        raw = packet['payload'][name]
        entry = packet['inventory'][name]
        entry.update(bytes=len(raw), sha256=digest(raw))
        packet['unpacked_inventory'][name] = dict(bytes=len(raw), sha256=entry['sha256'])
    for name in packet['payload']:
        bind(name)
    detail = parse(packet['payload']['fixtures-detail.json'])
    detail['artifact_sha256'].update({name: packet['inventory'][name]['sha256'] for name in
                                      ('machine-export.json', 'full-rows.bin')})
    packet['payload']['fixtures-detail.json'] = canonical(detail).encode()
    bind('fixtures-detail.json')
    hashes = {name: packet['inventory'][name]['sha256'] for name in
              ('machine-export.json', 'full-rows.bin', 'fixtures-detail.json')}
    for name in ('counts.json', 'full.json'):
        report = parse(packet['payload'][name])
        report['artifact_sha256'] = hashes
        report['detail'] = detail
        packet['payload'][name] = canonical(report).encode()
        bind(name)
    packet['meta']['archive-entries.json'] = copy.deepcopy(packet['inventory'])


def describe_review():
    return dict(schema='chess-table-full-review-v1', status='passed', verdict='correct',
        review_kind='independent-model-advisory', claim=CLAIM, run_id='<integer accepted run ID>',
        workflow_commit='<40 hex workflow commit>', computation_commit='<40 hex checked source commit>',
        checker_sha256='<SHA-256 of the exact checker reviewed; must equal the seal and actual checker>',
        source_manifest_sha256='<SHA-256 of exact accepted source-manifest.json>',
        narrative_path='<repository-relative durable advisory REPORT.md>',
        narrative_sha256='<SHA-256 of exact narrative file bytes>',
        artifact_sha256='<SHA-256 of accepted artifact.zip>', human_approval=False,
        formal_verification_by_reviewer=False, local_heavy_computation=False)


def describe_seal():
    return {
        'schema': SCHEMA, 'status': 'accepted', 'claim': CLAIM, 'repository': REPO,
        'run_id': '<integer successful Actions run ID>', 'artifact_id': '<integer artifact ID>',
        'artifact_name': '<chess-table-full-full-COMPUTATION_SHA>',
        'workflow_commit': '<40 hex original run head SHA>', 'computation_commit': '<40 hex actual checked source SHA>',
        'source_manifest_sha256': '<hash of unpacked/source-manifest.json>',
        'baseline_pins_sha256': '<hash of repository ' + BASELINE + '>',
        'checker_sha256': '<hash of this exact checker file>',
        'artifact_sha256': '<hash of artifact.zip>', 'artifact_bytes': '<integer archive bytes>',
        'logs_sha256': '<hash of logs.zip>', 'logs_bytes': '<integer archive bytes>',
        'metadata_sha256': {name: '<hash of exact retained file bytes>' for name in META},
        'executed_workflow_sha256': None,
        'review': {'kind': 'independent-model-advisory', 'status': 'passed',
                   'report_path': '<repository-relative JSON matching --describe-review; extra narrative fields allowed>',
                   'report_sha256': '<hash of that report>', 'human_approval': False,
                   'formal_verification_by_reviewer': False, 'local_heavy_computation': False},
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--root', type=Path, default=HERE.parents[2])
    parser.add_argument('--evidence', type=Path)
    parser.add_argument('--seal', type=Path)
    parser.add_argument('--self-test', action='store_true')
    parser.add_argument('--describe-seal', action='store_true')
    parser.add_argument('--describe-review', action='store_true')
    args = parser.parse_args()
    if args.describe_seal or args.describe_review:
        need(not args.evidence and not args.seal and not args.self_test and
             not (args.describe_seal and args.describe_review), 'schema description must be used alone')
        print(json.dumps(describe_seal() if args.describe_seal else describe_review(), indent=2))
        return
    need(args.evidence is not None and args.seal is not None, '--evidence and --seal are mandatory; no unsealed acceptance')
    root = args.root.resolve()
    seal = parse(regular(args.seal).read_bytes())
    snapshot = source_snapshot(root)
    packet = load_packet(args.evidence)
    # A report hash anchors the external review; this checker does not create it.
    report = scoped_file(root, seal['review']['report_path'])
    review_raw = report.read_bytes()
    snapshot['review_sha256'] = digest(review_raw)
    snapshot['review'] = parse(review_raw)
    snapshot['narrative_path'] = relative(snapshot['review']['narrative_path'])
    snapshot['narrative_raw'] = scoped_file(root, snapshot['narrative_path']).read_bytes()
    snapshot['narrative_sha256'] = digest(snapshot['narrative_raw'])
    receipt = validate(packet, snapshot, seal)
    if args.self_test:
        receipt['evidence_corruption_controls'] = self_test(packet, snapshot, seal)
    print(json.dumps(receipt, sort_keys=True, indent=2))
    print('Table seed sealed evidence controls passed' if args.self_test else 'Table seed sealed evidence review passed')


if __name__ == '__main__':
    try:
        main()
    except (Rejected, KeyError, IndexError, TypeError, ValueError, OSError, UnicodeError, zipfile.BadZipFile) as error:
        print('Table seed sealed evidence rejected: ' + str(error), file=sys.stderr)
        sys.exit(1)
