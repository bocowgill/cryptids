#!/usr/bin/env python3
"""Replay a sealed packet of remote seed-chess evidence using metadata and hashes.

Never imports/runs the compiler, fixtures, a model, Lean, Lake, or subprocesses.
The large full-row stream are streamed only through SHA-256, never parsed or
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
SCHEMA = 'chess-seed-seal-v1'
REPO = 'bocowgill/cryptids'
BRANCH = 'codex/chess-openevolve-pilot'
WORKFLOW = '.github/workflows/chess_seed_20261022.yml'
BASELINE = 'docs/chess/campaign-2026-10-22/round-02/baseline-pins.json'
CHECKER = 'scripts/chess_seed_20261022/check_saved_evidence.py'
META = ('run-api.json', 'jobs-api.json', 'artifact-api.json', 'retention.json', 'archive-entries.json')
PHASES = {'build': 1, 'contracts': 10, 'native': 11, 'counts': 12, 'full': 20}
ROWS = {'full-rows.bin'}
CLAIM = {
    'formal_machine': 'ConjectureMachines.Machines.chess_seed',
    'formal_theorem': 'ConjectureMachines.Semantics.ChessSeed.halts_iff_not_draw',
    'states': 998176, 'previous_states': 2411743, 'saved_states': 1413567,
    'initializer_states': 424157, 'controller_states': 216, 'bridge_states': 1,
    'body_states': 573802, 'main_states': 533341, 'return_states': 40461,
    'blank_tape': True, 'symbols': 2,
}
CONTRACTS = {
    'OldCount': 'example : generated.states = 2411743 := by rw [generated_states]; decide +kernel',
    'UnpaidController': 'example : generated.states = 997960 := by rw [generated_states]; decide +kernel',
    'UnpaidBridge': 'example : linked.states = 574018 := by rw [linked_states]; decide +kernel',
    'BadSaving': 'example : FieldSelective.generated.states - generated.states = 1413568 := by rw [FieldSelective.generated_states, generated_states]; decide +kernel',
    'MissingTurn': 'example : actions.size = bits.size := by rw [prefix_states, bits_size]; decide +kernel',
}
MUTATIONS = (
    'writer_bit', 'writer_direction', 'final_turn', 'controller_entry',
    'success_unpatched', 'success_wrong_bit', 'bridge_direction', 'bridge_destination',
    'body_write', 'body_destination', 'body_halt_removed', 'noncanonical_halt',
    'full_truncation', 'full_extra_row', 'unpaid_state', 'writer_physical_head',
    'fixture_far_exterior', 'fixture_runtime', 'fixture_paid_bridge', 'full_seed_changed',
    'controller_B_overlap_marker_bit', 'controller_A_shift_direction',
    'controller_emitted_main_bit', 'controller_B_cleanup_residue', 'controller_A_cleanup_residue',
    'controller_missing_bottom_marker', 'controller_wrong_final_head', 'controller_scanner_counter_reset',
    'controller_parser_counter_bit', 'controller_unpaid_state_counter',
    'controller_invalid_code_accidental_halt', 'controller_far_right_exterior_residue',
    'controller_far_left_exterior_residue', 'controller_wrong_step_counter',
)
SOURCE_EXPORT_SHA = '592ea3c892d0e9d5a6db6ce31e3f590bde7973774bdc9a70cfe46cb6996cd39e'
SOURCE_BODY_SHA = 'd2afbf1c0abe1afb0008029680c5bc52b41f2dc21718a88d16b7aecd06becb0a'
SEED_SHA = '2946c43c229df7c2468d45f72ac385e20188aeafc1a4af74309a5d563d8befe1'
TARGET_SHA = 'a537828df795044398b0eb71c0f9091da6a3d2e01511bac338b8581b04fda9fa'
ALLOCATION = {
    'machine_states': 998176, 'row_machine_states': 998176, 'generated_states': 998176,
    'seed_bits': 424156, 'writer_states': 424157, 'controller_states': 216,
    'bridge_states': 1, 'linked_states': 574019, 'body_states': 573802,
    'controller_entry': 424157, 'controller_done': 424371, 'bridge_entry': 424373,
    'body_entry': 424374, 'previous_states': 2411743,
}
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
    paths = {WORKFLOW, BASELINE, 'lakefile.chess-seed-20261022.toml',
             'Cryptids/Compilation/SeedLink.lean', 'Cryptids/Chess/Optimisation/FieldSeed.lean',
             'Cryptids/Semantics/ChessSeed.lean'}
    paths.update(p.relative_to(root).as_posix()
                 for p in (root / 'scripts/chess_seed_20261022').rglob('*')
                 if p.is_file() and p.suffix in ('.py', '.lean'))
    paths.update(p.relative_to(root).as_posix()
                 for p in (root / 'Cryptids/Compilation/Seed').glob('*.lean') if p.is_file())
    # A checker may be finalized after computation. Its external seal always binds
    # its bytes; an included remote checker hash must additionally agree.
    paths.discard(CHECKER)
    required = {
        'scripts/chess_seed_20261022/verify.py', 'scripts/chess_seed_20261022/session.py',
        'scripts/chess_seed_20261022/full.py', 'scripts/chess_seed_20261022/fixtures.py',
        'scripts/chess_seed_20261022/Export.lean', 'scripts/chess_seed_20261022/Audit.lean',
        'scripts/chess_seed_20261022/pilot.py', 'scripts/chess_seed_20261022/ControllerExport.lean',
        'scripts/chess_seed_20261022/controller_compare.py',
        'Cryptids/Compilation/Seed/Format.lean', 'Cryptids/Compilation/Seed/Controller.lean',
        'Cryptids/Compilation/Seed/Blocks.lean', 'Cryptids/Compilation/Seed/Scan.lean',
        'Cryptids/Compilation/Seed/Expander.lean', 'Cryptids/Compilation/Seed/ChessCodec.lean',
    }
    need(required <= paths, 'incomplete computation source inventory')
    return paths


def source_snapshot(root):
    source = {name: file_sha(scoped_file(root, name)) for name in sorted(source_paths(root))}
    pins = parse(scoped_file(root, BASELINE).read_bytes())
    need(type(pins) is dict and len(pins) == 2762, 'baseline must contain exactly 2762 frozen files')
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
    fields(snapshot['review'], dict(schema='chess-seed-review-v1', status='passed', verdict='correct',
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
                     name='Chess compressed seed research', event='workflow_dispatch',
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
    session = re.fullmatch(r'chess-seed-session-([1-8])-([0-9a-f]{40})', seal['artifact_name'])
    if session:
        need(session[2] == commit, 'session artifact computation SHA changed')
        binding = parse(packet['payload']['session-binding.json'])
        fields(binding, dict(commit=commit, initial_workflow_commit=workflow, run_id=str(run_id),
                             branch='refs/heads/' + BRANCH, target='full'), 'session binding')
        git_hash(binding['prior_commit'], 'invalid prior session commit')
        expected_hash = digest(packet['payload']['executed-workflow.yml'])
        need(binding['executed_workflow_sha256'] == seal['executed_workflow_sha256'] == expected_hash,
             'executed workflow hash changed')
        hex_hash(expected_hash, 'invalid executed workflow hash')
        fields(parse(packet['payload']['session-result.json']),
               dict(commit=commit, run_id=str(run_id), target='full', exit=0), 'session result')
        if session[1] == '1':
            need(commit == workflow == binding['prior_commit'], 'initial session checkpoint changed')
        if commit == workflow:
            need(expected_hash == manifest['source_sha256'][WORKFLOW], 'initial executed/source workflow differ')
        active_job = 'session'
        required_steps = ('Fetch pinned Mathlib cache', 'Select source checkpoint ' + session[1],
                          'Verify source checkpoint ' + session[1], 'Last source result')
    else:
        need(seal['artifact_name'] == 'chess-seed-full-' + commit and commit == workflow,
             'direct full artifact identity changed')
        need(seal['executed_workflow_sha256'] is None, 'direct run unexpectedly has a session workflow')
        need(not {'session-binding.json', 'session-result.json', 'executed-workflow.yml'} & set(packet['inventory']),
             'session files in direct artifact')
        active_job = 'verify'
        required_steps = ('Fetch pinned Mathlib cache', 'Remote compiler verification')
    need(type(jobs['jobs']) is list and jobs['total_count'] == len(jobs['jobs']) and
         1 <= len(jobs['jobs']) <= 2, 'job API is incomplete or unexpected')
    selected = [job for job in jobs['jobs'] if job['name'] == active_job]
    need(len(selected) == 1 and len({job['id'] for job in jobs['jobs']}) == len(jobs['jobs']), 'active job inventory changed')
    for job in jobs['jobs']:
        fields(job, dict(run_id=run_id, head_sha=workflow, head_branch=BRANCH, status='completed'), 'job provenance')
        positive_int(job['id'], 'invalid job ID')
        fields(job, dict(url=f'https://api.github.com/repos/{REPO}/actions/jobs/{job["id"]}',
                         html_url=run_url + f'/job/{job["id"]}'), 'job URLs')
        need(job['name'] in ('verify', 'session'), 'unknown workflow job')
        need(job['conclusion'] == ('success' if job is selected[0] else 'skipped'), 'job conclusion changed')
    for name in required_steps:
        steps = [step for step in selected[0]['steps'] if step['name'] == name]
        need(len(steps) == 1, 'required workflow step missing: ' + name)
        fields(steps[0], dict(status='completed', conclusion='success'), 'required workflow step failed: ' + name)
    return bool(session)


def command_specs(remote, python):
    build = ['lake', '--wfail', '-f', 'lakefile.chess-seed-20261022.toml', 'build']
    specs = [(build + ['Cryptids.Semantics.ChessSeed', 'chess_seed_audit', 'chess_seed_export'],
              0, 'Build completed successfully', 1800)]
    audit = ['prlimit', '--as=17179869184', '--', 'lake', 'env', remote + '/.lake/build/bin/chess_seed_audit']
    specs.append((audit, 0, 'Chess seed foundation audit passed', 600))
    for flag, marker in (('--negative-control', 'Forbidden axiom: sorryAx'),
                         ('--negative-control-open', 'The open chess conjecture is a dependency'),
                         ('--negative-control-generator', 'Proof generator is a mathematical dependency:')):
        specs.append((audit + [flag], 1, marker, 600))
    for name in CONTRACTS:
        specs.append((['lake', 'env', 'lean', '-M6144', '-DwarningAsError=true',
                       remote + '/.lake/chess-seed-20261022/' + name + '.lean'], 1, 'is false', 300))
    specs.append((['prlimit', '--stack=67108864', '--', 'lake', 'env',
                   remote + '/.lake/build/bin/chess_seed_export', remote + '/.lake/chess-seed-20261022/machine-export.json'],
                  0, 'Seed complete native export passed', 1200))
    specs.append(([python, 'scripts/chess_seed_20261022/fixtures.py'], 0, 'Seed complete independent fixtures passed', 1200))
    specs.append((build + ['Cryptids.Chess.Fixtures', 'Cryptids.Chess.Evaluation',
                           'Cryptids.Semantics.ChessFieldSelective', 'Cryptids.Compilation.FieldBranch.Certificate'],
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
        source = ('import Cryptids.Semantics.ChessSeed\n'
                  'open Chess.Optimisation Chess.Optimisation.FieldSeed\n' + statement + '\n')
        need(packet['payload'][name + '.lean'].decode() == source, 'false kernel contract source changed: ' + name)
    unrelated = ('unknown constant', 'unknown identifier', 'unknown namespace', 'unknown module',
                 'object file', 'file not found', 'failed to synthesize', 'deep recursion',
                 'maximum recursion', 'timeout', 'unknown tactic', 'unsolved goals')
    for check in checks[2:5]:
        output = check['output']
        need('Chess seed foundation audit passed' not in output and
             not any(token in output.lower() for token in unrelated),
             'audit control failed for unrelated reason')
    for check in checks[5:10]:
        output = check['output']
        need('Tactic `decide` proved that the proposition' in output and 'is false' in output and
             not any(token in output.lower() for token in unrelated), 'kernel contract failed for unrelated reason')
    audit = checks[1]['output']
    need(re.search(r'Audited [1-9][0-9]* ChessSeed foundation roots and [1-9][0-9]* dependencies', audit) is not None and
         'Meta certificate generator roots outside safe roots: 0' in audit and
         'Compiler artifacts outside safe roots:' in audit and
         'Permitted axioms: #[propext, Classical.choice, Quot.sound]' in audit,
         'safe proof closure audit incomplete')
    for marker in ('Forbidden axiom:', 'Unsafe or partial dependency:', 'Required construction proof is missing:',
                   'The open chess conjecture is a dependency', 'Proof generator is a mathematical dependency:'):
        need(marker not in audit, 'safe proof closure audit contains rejection')
    for marker in ('Complete paid seed chess reduction passed', 'Seed complete native export passed',
                   'Seed complete independent fixtures passed', 'Chess seed foundation audit passed'):
        need(marker in packet['logs_text'], 'workflow log marker missing: ' + marker)
    return phases


def validate_scope(packet, phases):
    """Validate saved remote receipts only; do not decode or execute a machine."""
    detail = parse(packet['payload']['fixtures-detail.json'])
    native = parse(packet['payload']['machine-export.json'])
    fields(detail, dict(status='passed', states=998176, previous_states=2411743,
        saved_states=1413567, initializer_states=424157, controller_states=216,
        bridge_states=1, body_states=573802, complete_full_rows_verified=True,
        complete_full_rows_checked=1996352, static_full_input_verified=True,
        initializer_verified=True, composed_fixtures_verified=True,
        composed_fixture_count=88, controller_fixture_count=465, negative_control_count=34,
        positive_controls_ran_first=True, full_quadratic_startup_executed=False),
        'independent remote scope')
    fields(native, dict(schema='chess-seed-complete-v1', full_quadratic_startup_executed=False),
           'native execution scope')
    need(same(native['metadata'], ALLOCATION), 'native machine allocation')
    hashes = {name: packet['inventory'][name]['sha256'] for name in
              ('machine-export.json', 'full-rows.bin', 'fixtures-detail.json')}
    for name in ('counts', 'full'):
        need(same(phases[name]['detail'], detail), 'phase fixture detail differs')
        need(same(phases[name]['artifact_sha256'], hashes), 'phase artifact hashes changed')
    need(same(detail['artifact_sha256'], {name: hashes[name] for name in
              ('machine-export.json', 'full-rows.bin')}), 'fixture artifact hashes changed')
    fields(native['full_rows'], dict(filename='full-rows.bin', format='<BBI', record_bytes=6,
        states=998176, rows=1996352, bytes=11978112, missing_rows=2,
        missing_encoding=[2, 0, 0], direction_left=0, direction_right=1,
        order='state-major,bit-0-before-1', native_machine_rowMachine_equal=True),
        'native full row inventory')
    need(packet['inventory']['full-rows.bin']['bytes'] == 11978112, 'full row artifact byte census changed')
    fields(detail['complete_row_census'], dict(rows=1996352, missing_rows=2,
        sha256=hashes['full-rows.bin'], source_body_sha256=SOURCE_BODY_SHA,
        independent_complete_equality=True), 'independent full row census')
    seed = native['seed']
    need(type(seed) is str and len(seed) == 424156 and
         digest(seed.encode('ascii')) == SEED_SHA, 'full seed bytes/hash changed')
    fields(detail['static_input'], dict(source_sha256=SOURCE_EXPORT_SHA, symbols=141380,
        seed_sha256=SEED_SHA, target_sha256=TARGET_SHA, full_static_input_equal=True,
        full_quadratic_startup_executed=False), 'full static input identity receipt')
    fields(native['writer'], dict(steps=424157, state=424157, head=-424155,
        tape=seed, normalized_head=0, frame_min=-424156, frame_max=1,
        both_exteriors_zero=True, actual_and_numeric_replayed=True), 'native paid writer')
    fields(detail['writer'], dict(steps=424157, state=424157, head=-424155,
        complete_support_equal=True, both_exteriors_zero=True), 'independent paid writer')
    # These are small receipt inventories, not a local replay or state recount.
    cases = native['complete_startup_fixtures']
    composed = detail['composed_fixtures']
    need(type(cases) is list and type(composed) is list and len(cases) == len(composed) == 88,
         'complete startup fixture inventory')
    seen = set()
    for actual, saved in zip(cases, composed):
        symbols = actual['symbols']
        need(type(symbols) is list and len(symbols) <= 8 and
             all(type(x) is int and 1 <= x <= 4 for x in symbols), 'startup fixture symbol metadata')
        identity = tuple(symbols)
        need(identity not in seen and same(saved['symbols'], symbols), 'startup fixture identity mismatch')
        seen.add(identity)
        for key in ('states', 'steps', 'head', 'state', 'support', 'visited_min', 'visited_max'):
            need(same(actual[key], saved[key]), 'startup native/independent receipt differs: ' + key)
        fields(actual, dict(both_exteriors_zero=True, actual_native_executed=True), 'native startup scope')
        fields(saved, dict(both_exteriors_zero=True), 'independent startup exterior')
        for key in ('states', 'steps'):
            positive_int(saved[key], 'invalid startup receipt ' + key)
        need(type(saved['head']) is int and type(saved['state']) is int,
             'invalid startup head/state receipt')
    # Expected symbolic cases copied from the declared fixture contract, not
    # generated by the compiler, simulator, or machine data.
    expected = {()}
    for first in range(1, 5):
        expected.add((first,))
        for second in range(1, 5):
            expected.add((first, second))
            for third in range(1, 5):
                expected.add((first, second, third))
    expected |= {(1, 4, 2, 3, 1, 4, 2, 3), (4, 3, 4, 3, 4, 3, 4, 3), (2, 2, 2, 2, 2)}
    need(seen == expected, 'startup fixture coverage incomplete')
    fields(cases[0], dict(symbols=[], states=235, body_entry=234, steps=81,
        head=-9, state=234, support=[3], output='0000000000001'), 'empty startup receipt')
    controller = detail['controller_fixtures']
    fields(controller, dict(status='FINITE_UNVERIFIED_PILOT', positive_count=465,
        step_formula_checked_on_fixtures='16*n*n + 83*n + 62'), 'controller fixture scope')
    positives, invalid = controller['positive_cases'], controller['invalid_code_cases']
    need(type(positives) is list and len(positives) == 465 and
         type(invalid) is list and len(invalid) == 9, 'controller fixture inventory')
    names = {'all_length_0_empty'}
    for first in range(1, 5):
        names.add('all_length_1_' + str(first))
        for second in range(1, 5):
            names.add('all_length_2_' + str(first) + str(second))
            for third in range(1, 5):
                names.add('all_length_3_' + str(first) + str(second) + str(third))
    names |= {'repeated_bit1', 'repeated_bit0', 'maximum_boundary_run', 'reverse_boundary_run',
              'zero_ending_codes', 'delimiter_at_both_ends', 'actual_final_symbol', 'mixed_odd_length'}
    need(all(type(case['name']) is str and type(case['origin']) is int for case in positives),
         'controller fixture identity types')
    identities = {(case['name'], case['origin']) for case in positives}
    need(identities == {(name, origin) for name in names for origin in (-101, -1, 0, 1, 137)},
         'controller translated fixture coverage')
    for case in positives:
        fields(case, dict(complete_support_equal=True, both_exteriors_zero=True), 'controller fixture exterior')
        positive_int(case['steps'], 'controller runtime receipt')
        hex_hash(case['output_sha256'], 'controller output hash')
    need({(case['code'], case['origin']) for case in invalid} ==
         {(code, origin) for code in (5, 6, 7) for origin in (-29, 0, 31)},
         'invalid code fixture coverage')
    for case in invalid:
        fields(case, dict(first_error_step=16, nonterminal_at_step=64, tape_unchanged=True),
               'invalid code error loop receipt')
    controls = detail['mutation_controls']
    need(type(controls) is list and [case['name'] for case in controls] == list(MUTATIONS),
         '34 exact corruption controls missing')
    for control in controls:
        fields(control, dict(rejected=True), 'mutation rejection missing')
        need(type(control['reason']) is str and bool(control['reason'].strip()),
             'mutation rejection reason missing')
    return detail


def validate(packet, snapshot, seal):
    """Pure checks of loaded receipts; the same routine is used for hostile controls."""
    validate_seal(seal, snapshot, packet)
    manifest = parse(packet['payload']['source-manifest.json'])
    need(set(manifest) == {'commit', 'run_id', 'workflow_commit', 'source_sha256', 'frozen_source_sha256'},
         'source manifest field inventory changed')
    manifest_sources = dict(manifest['source_sha256'])
    if CHECKER in manifest_sources:
        need(manifest_sources.pop(CHECKER) == snapshot['checker_sha256'], 'remote checker hash changed')
    need(same(manifest_sources, snapshot['source']), 'current computation source binding changed')
    need(same(manifest['frozen_source_sha256'], snapshot['pins']), '2762 frozen-source manifest pins changed')
    session = validate_provenance(packet, seal, manifest)
    expected = {'source-manifest.json', 'machine-export.json', 'fixtures-detail.json'} | ROWS | {
        name + '.json' for name in PHASES} | {name + '.lean' for name in CONTRACTS}
    if session:
        expected |= {'session-binding.json', 'session-result.json', 'executed-workflow.yml'}
    command_files = {name for name in packet['inventory'] if re.fullmatch(r'commands/[0-9]+\.json', name)}
    need(set(packet['inventory']) == expected | command_files, 'exact artifact file inventory changed')
    need(set(packet['payload']) == set(packet['inventory']) - ROWS, 'retained metadata payload inventory changed')
    for name, raw in packet['payload'].items():
        entry = packet['inventory'][name]
        need(len(raw) == entry['bytes'] and digest(raw) == entry['sha256'],
             'retained metadata payload hash/bytes changed: ' + name)
    phases = validate_commands(packet, manifest)
    detail = validate_scope(packet, phases)
    return dict(schema='chess-seed-metadata-receipt-v1', status='passed', claim=CLAIM,
                run_id=seal['run_id'], workflow_commit=seal['workflow_commit'], computation_commit=seal['computation_commit'],
                artifact_id=seal['artifact_id'], artifact_sha256=packet['artifact_sha256'], logs_sha256=packet['logs_sha256'],
                source_manifest_sha256=seal['source_manifest_sha256'], frozen_files_checked=len(snapshot['pins']),
                repository_import_files_checked=snapshot['import_files'], phases=list(PHASES),
                unique_commands=len(phases['full']['checks']),
                cumulative_phase_receipts=sum(len(phase['checks']) for phase in phases.values()),
                saved_composed_fixtures=detail['composed_fixture_count'],
                saved_controller_fixtures=detail['controller_fixture_count'],
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

    add('sealed_claim', 'seal', 'seal claim/status', lambda x: x['claim'].__setitem__('states', 998175))
    add('review_hash', 'seal', 'independent review report hash changed', lambda x: x['review'].__setitem__('report_sha256', '0' * 64))
    add('narrative_hash', 'snapshot', 'independent review narrative hash changed', lambda x: x['review'].__setitem__('narrative_sha256', '0' * 64))
    add('narrative_content', 'snapshot', 'independent review narrative hash changed', lambda x: x.__setitem__('narrative_raw', x['narrative_raw'] + b'\ncorrupted advisory narrative\n'))
    add('review_run', 'snapshot', 'independent review report identity/authority', lambda x: x['review'].__setitem__('run_id', 1))
    add('checker_hash', 'seal', 'sealed checker hash changed', lambda x: x.__setitem__('checker_sha256', '0' * 64))
    add('metadata_hash', 'seal', 'sealed metadata hash changed', lambda x: x['metadata_sha256'].__setitem__('run-api.json', '0' * 64))
    add('artifact_hash', 'seal', 'sealed archive identity changed', lambda x: x.__setitem__('artifact_sha256', '0' * 64))
    add('source_manifest_hash', 'seal', 'sealed source manifest hash changed', lambda x: x.__setitem__('source_manifest_sha256', '0' * 64))
    add('frozen_pin', 'snapshot', '2762 frozen-source manifest pins changed', lambda x: x['pins'].__setitem__(next(iter(x['pins'])), '0' * 64))
    add('source_hash', 'snapshot', 'current computation source binding changed', lambda x: x['source'].__setitem__('scripts/chess_seed_20261022/fixtures.py', '0' * 64))
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
    add('native_bridge_allocation', 'payload:machine-export.json', 'native machine allocation', lambda x: x['metadata'].__setitem__('bridge_states', 0))
    add('phase_inventory', 'payload:contracts.json', 'cumulative phase command mismatch', lambda x: x['checks'].pop())
    add('full_rows', 'detail', 'independent remote scope', lambda x: x.__setitem__('complete_full_rows_checked', 1996351))
    add('full_row_census', 'detail', 'independent full row census', lambda x: x['complete_row_census'].__setitem__('rows', 1996351))
    add('paid_controller', 'detail', 'independent remote scope', lambda x: x.__setitem__('controller_states', 215))
    add('initializer_head', 'detail', 'independent paid writer', lambda x: x['writer'].__setitem__('head', 0))
    add('native_writer_head', 'payload:machine-export.json', 'native paid writer', lambda x: x['writer'].__setitem__('head', 0))
    add('seed_hash', 'detail', 'full static input identity receipt', lambda x: x['static_input'].__setitem__('seed_sha256', '0' * 64))
    add('full_startup_claim', 'detail', 'independent remote scope', lambda x: x.__setitem__('full_quadratic_startup_executed', True))
    add('composed_inventory', 'detail', 'complete startup fixture inventory', lambda x: x['composed_fixtures'].pop())
    add('composed_exterior', 'detail', 'independent startup exterior', lambda x: x['composed_fixtures'][0].__setitem__('both_exteriors_zero', False))
    add('controller_inventory', 'detail', 'controller fixture inventory', lambda x: x['controller_fixtures']['positive_cases'].pop())
    add('invalid_code_halt', 'detail', 'invalid code error loop receipt', lambda x: x['controller_fixtures']['invalid_code_cases'][0].__setitem__('nonterminal_at_step', 0))
    add('mutation_inventory', 'detail', '34 exact corruption controls missing', lambda x: x['mutation_controls'].pop())
    add('mutation_acceptance', 'detail', 'mutation rejection missing', lambda x: x['mutation_controls'][0].__setitem__('rejected', False))
    add('mutation_positive', 'detail', 'independent remote scope', lambda x: x.__setitem__('positive_controls_ran_first', False))
    if 'session-binding.json' in packet['payload']:
        add('session_source', 'payload:session-binding.json', 'session binding', lambda x: x.__setitem__('commit', '0' * 40))
        add('session_result', 'payload:session-result.json', 'session result', lambda x: x.__setitem__('exit', 1))
        add('executed_workflow', 'payload:session-binding.json', 'executed workflow hash changed', lambda x: x.__setitem__('executed_workflow_sha256', '0' * 64))

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
    detail['artifact_sha256'] = {name: packet['inventory'][name]['sha256'] for name in
                                 ('machine-export.json', 'full-rows.bin')}
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
    return dict(schema='chess-seed-review-v1', status='passed', verdict='correct',
        review_kind='independent-model-advisory', claim=CLAIM, run_id='<integer accepted run ID>',
        workflow_commit='<40 hex workflow commit>', computation_commit='<40 hex checked source commit>',
        source_manifest_sha256='<SHA-256 of exact accepted source-manifest.json>',
        narrative_path='<repository-relative durable advisory REPORT.md>',
        narrative_sha256='<SHA-256 of exact narrative file bytes>',
        artifact_sha256='<SHA-256 of accepted artifact.zip>', human_approval=False,
        formal_verification_by_reviewer=False, local_heavy_computation=False)


def describe_seal():
    return {
        'schema': SCHEMA, 'status': 'accepted', 'claim': CLAIM, 'repository': REPO,
        'run_id': '<integer successful Actions run ID>', 'artifact_id': '<integer artifact ID>',
        'artifact_name': '<chess-seed-session-N-COMPUTATION_SHA or chess-seed-full-SHA>',
        'workflow_commit': '<40 hex original run head SHA>', 'computation_commit': '<40 hex actual checked source SHA>',
        'source_manifest_sha256': '<hash of unpacked/source-manifest.json>',
        'baseline_pins_sha256': '<hash of repository ' + BASELINE + '>',
        'checker_sha256': '<hash of this exact checker file>',
        'artifact_sha256': '<hash of artifact.zip>', 'artifact_bytes': '<integer archive bytes>',
        'logs_sha256': '<hash of logs.zip>', 'logs_bytes': '<integer archive bytes>',
        'metadata_sha256': {name: '<hash of exact retained file bytes>' for name in META},
        'executed_workflow_sha256': '<hash of unpacked/executed-workflow.yml; JSON null for direct full run>',
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
    print('Seed sealed evidence controls passed' if args.self_test else 'Seed sealed evidence review passed')


if __name__ == '__main__':
    try:
        main()
    except (Rejected, KeyError, IndexError, TypeError, ValueError, OSError, UnicodeError, zipfile.BadZipFile) as error:
        print('Seed sealed evidence rejected: ' + str(error), file=sys.stderr)
        sys.exit(1)
