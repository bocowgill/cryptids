#!/usr/bin/env python3
"""Independent metadata/saved-output check. Never runs Lean, a fixture or a machine.

Keep this file beside construction-binding.json, report.md, receipt.json and
seal.json. The directory may be private or published: repository discovery uses
sentinels, not a fixed number of parent directories. --write-receipt is a
bootstrap operation and does not print the final success marker.
"""
import argparse
import hashlib
import json
import re
import sys
import zipfile
from pathlib import Path, PurePosixPath

HERE = Path(__file__).resolve().parent
ROOT = next(p for p in HERE.parents
            if (p / 'lean-toolchain').is_file() and (p / 'Cryptids').is_dir())
BASE = ROOT / 'docs/chess/field-binary'
RUN = 39621322042
COMMIT = 'aec53614962607635789060f51c4576bdcdc00b0'
REPO = 'bocowgill/cryptids'
BRANCH = 'codex/chess-openevolve-pilot'
PHASES = ('probe', 'proofs', 'contracts', 'fixtures', 'counts')
REMOTE = '/home/runner/work/cryptids/cryptids'
EXPECTED_STATES = {'read': [39, 66, 93, 120],
                   'write_constant': [5, 11, 17, 23], 'move': [14, 14]}
EXPECTED_MARGINALS = {'read': 211410, 'write': 82000, 'move': 110}
EXPECTED_FAILURES = {39607907762, 39608668800, 39609387995,
                     39610078320, 39610691159}


class ReviewError(Exception):
    pass


def require(value, message):
    if not value:
        raise ReviewError(message)


def read(path):
    return json.loads(Path(path).read_text())


def digest(data):
    return hashlib.sha256(data).hexdigest()


def sha(path):
    return digest(Path(path).read_bytes())


def encoded(value):
    return json.dumps(value, indent=2) + '\n'


def log_lines(text):
    text = re.sub(r'\x1b\[[0-9;]*[A-Za-z]', '', text.lstrip('\ufeff'))
    return [re.sub(r'^\d{4}-\d\d-\d\dT\S+Z ', '', line)
            for line in text.splitlines()]


def authenticate(folder, control=None):
    run = read(folder / 'run-api.json')
    retention = read(folder / 'retention.json')
    inventory = read(folder / 'artifact-api.json')
    require(run['status'] == 'completed', 'run is incomplete')
    require(run['name'] == 'Chess field-aware binary pilot', 'wrong workflow name')
    require(run['path'] == '.github/workflows/chess_field_binary.yml', 'wrong workflow path')
    require(run['head_branch'] == BRANCH and run['repository']['full_name'] == REPO,
            'wrong repository or branch')
    require(run['head_commit']['id'] == run['head_sha'], 'run commit mismatch')
    require(inventory['total_count'] == len(inventory['artifacts']) == 1,
            'artifact inventory mismatch')
    artifact = inventory['artifacts'][0]
    require(run['id'] == retention['run_id'] == artifact['workflow_run']['id'],
            'artifact/run identity mismatch')
    require(run['head_sha'] == retention['commit'] == artifact['workflow_run']['head_sha'],
            'artifact/source identity mismatch')
    require(run['conclusion'] == retention['conclusion'], 'retention conclusion mismatch')
    require(artifact['name'] == 'chess-field-binary-' + run['head_sha'], 'wrong artifact name')
    require(artifact['size_in_bytes'] == (folder / 'artifact.zip').stat().st_size,
            'artifact size mismatch')
    artifact_hash = sha(folder / 'artifact.zip')
    require(artifact['digest'] == 'sha256:' + artifact_hash ==
            'sha256:' + retention['artifact_sha256'], 'official artifact digest mismatch')
    require(sha(folder / 'logs.zip') == retention['logs_sha256'], 'logs digest mismatch')
    entries = read(folder / 'archive-entries.json')
    if control == 'entry':
        first = sorted(entries)[0]
        entries[first]['sha256'] = '0' * 64
    with zipfile.ZipFile(folder / 'artifact.zip') as archive:
        require(archive.testzip() is None, 'artifact CRC failure')
        names = [i.filename for i in archive.infolist() if not i.is_dir()]
        require(len(names) == len(set(names)) == retention['entries'],
                'duplicate or missing archive entries')
        require(set(names) == set(entries), 'archive manifest inventory mismatch')
        extracted = {str(p.relative_to(folder / 'unpacked'))
                     for p in (folder / 'unpacked').rglob('*') if p.is_file()}
        require(extracted == set(names), 'extracted file inventory mismatch')
        for name in names:
            path = PurePosixPath(name)
            require(not path.is_absolute() and '..' not in path.parts and '\\' not in name,
                    'unsafe archive path')
            data = archive.read(name)
            require(entries[name] == {'bytes': len(data), 'sha256': digest(data)},
                    'archive entry binding mismatch: ' + name)
            require(data == (folder / 'unpacked' / name).read_bytes(),
                    'extracted bytes mismatch: ' + name)
    with zipfile.ZipFile(folder / 'logs.zip') as archive:
        require(archive.testzip() is None, 'logs CRC failure')
        logs = {n: archive.read(n).decode('utf-8-sig') for n in archive.namelist()}
    jobs = read(folder / 'jobs-api.json')
    require(jobs['total_count'] == len(jobs['jobs']) == 1, 'unexpected jobs inventory')
    job = jobs['jobs'][0]
    require(job['run_id'] == run['id'] and job['head_sha'] == run['head_sha'],
            'job/source identity mismatch')
    require(job['status'] == 'completed' and job['conclusion'] == run['conclusion'],
            'job outcome mismatch')
    return run, artifact, entries, logs, job


def verify(control=None):
    binding = read(HERE / 'construction-binding.json')
    folder = BASE / 'evidence/current'
    run, artifact, entries, logs, job = authenticate(folder, control)
    require(run['id'] == RUN and run['head_sha'] == COMMIT and run['conclusion'] == 'success',
            'wrong successful computation')
    require(run['event'] == 'workflow_dispatch' and run['run_attempt'] == 1,
            'unexpected run invocation')
    require(len(entries) == 21 and artifact['id'] == 12354329768, 'wrong accepted artifact')
    require(run['created_at'] <= job['started_at'] <= job['completed_at'] <= run['updated_at'],
            'run/job times disagree')
    steps = {s['name']: s for s in job['steps']}
    for name in ['Fresh evidence', 'Probe finite binary compiler', 'Full pilot verification']:
        require(steps[name]['status'] == 'completed' and steps[name]['conclusion'] == 'success',
                'required job step did not succeed: ' + name)
    require('rm -rf .lake/chess-field-binary' in logs['verify/5_Fresh evidence.txt'],
            'fresh evidence step missing')
    probe_log = logs['verify/7_Probe finite binary compiler.txt']
    full_log = logs['verify/8_Full pilot verification.txt']
    require('python3 scripts/chess_field_binary/verify.py --probe' in probe_log,
            'probe command missing')
    require('python3 scripts/chess_field_binary/verify.py --proofs --contracts --fixtures --counts'
            in full_log, 'full command missing')
    for text in [probe_log, full_log]:
        require('CHESS_REMOTE: 1' in text and 'shell: /usr/bin/bash -e {0}' in text,
                'remote environment missing')
    upload = next(t for n, t in logs.items() if n.startswith('verify/9_'))
    require(artifact['digest'].split(':', 1)[1] in upload and
            'Artifact ID ' + str(artifact['id']) in upload and '21 files uploaded' in upload,
            'upload transcript disagrees with artifact API')
    u = folder / 'unpacked'
    phases = {p: read(u / (p + '.json')) for p in PHASES}
    source = phases['proofs']['source_sha256']
    pins = read(BASE / 'baseline-pins.json')
    require(len(source) == 11 and len(pins) == 237, 'source-map cardinality mismatch')
    if control == 'source':
        binding['computation_source_sha256'][sorted(source)[0]] = '0' * 64
    require(source == binding['computation_source_sha256'], 'computation source binding changed')
    require(pins == binding['frozen_source_sha256'], 'frozen map binding changed')
    for name, expected in {**pins, **source}.items():
        require(sha(ROOT / name) == expected, 'current file differs from remote source: ' + name)
    commands = [read(p) for p in sorted((u / 'commands').glob('*.json'))]
    claimed_commands = []
    for name, phase in phases.items():
        require(phase['phase'] == name and phase['status'] == 'passed', 'phase did not pass: ' + name)
        require(phase['commit'] == COMMIT and int(phase['run_id']) == RUN,
                'phase run binding mismatch: ' + name)
        require(phase['source_sha256'] == source and phase['frozen_source_sha256'] == pins,
                'phase source-map mismatch: ' + name)
        for c in phase['checks']:
            require(c in commands and c['shell'] is False and c['cwd'] == REMOTE,
                    'command transcript binding mismatch')
            require(c['timed_out'] is False and c['elapsed_seconds'] > 0,
                    'command timeout or invalid time')
            require(digest(c['output'].encode()) == c['output_sha256'], 'command output hash mismatch')
            saved = set(log_lines(probe_log if name == 'probe' else full_log))
            require(all(line in saved for line in c['output'].splitlines()),
                    'command output absent from official log')
            claimed_commands.append(c)
    require(len(commands) == len(claimed_commands) == 11 and
            sorted(map(encoded, commands)) == sorted(map(encoded, claimed_commands)),
            'unclaimed or duplicated command transcript')
    build_prefix = ['lake', '--wfail', '-f', 'lakefile.chess-field-binary.toml', 'build']
    targets = ['Cryptids.Compilation.FieldBinary.Pilot']
    for phase, argv in [('probe', build_prefix + targets),
                        ('proofs', build_prefix + targets +
                         ['chess_field_binary_audit', 'chess_field_binary_export'])]:
        checks = phases[phase]['checks']
        require(len(checks) == 1 and checks[0]['argv'] == argv and checks[0]['exit'] == 0,
                'strict build invocation mismatch')
        require('Build completed successfully' in checks[0]['output'], 'strict build did not pass')
    audit = phases['contracts']['checks']
    require(len(audit) == 7, 'wrong contract control count')
    exe = ['lake', 'env', REMOTE + '/.lake/build/bin/chess_field_binary_audit']
    require(audit[0]['argv'] == exe and audit[0]['exit'] == 0, 'audit invocation failed')
    helpers = ['shift'] + ['Routine.' + n for n in
                          ['execute', 'exitState', 'machine', 'result', 'size', 'steps']]
    helper_line = 'Compiler artifacts outside safe roots: #[' + ', '.join(
        'ConjectureMachines.Compilation.FieldBinary.' + n + '._unsafe_rec' for n in helpers) + ']'
    expected_audit = '\n'.join([
        'Audited 196 FieldBinary foundation roots and 5787 dependencies',
        'Meta certificate generator roots outside safe roots: 0', helper_line,
        'Permitted axioms: #[propext, Classical.choice, Quot.sound]',
        'Chess FieldBinary foundation audit passed', ''])
    require(audit[0]['output'] == expected_audit, 'audit closure summary changed')
    controls = [('--negative-control', 'Forbidden axiom: sorryAx'),
                ('--negative-control-open', 'The open chess conjecture is a dependency'),
                ('--negative-control-generator', 'Proof generator is a mathematical dependency: '
                 'Chess.Compilation.SourceCertificate.Generator.certify')]
    for c, (flag, message) in zip(audit[1:4], controls):
        require(c['argv'] == exe + [flag] and c['exit'] == 1 and
                c['output'] == 'uncaught exception: ' + message + '\n',
                'audit negative control did not fail for intended reason')
    for c, name, marker in zip(audit[4:], ['BadCount', 'BadWrite', 'BadCodec'],
                              ['is false', '⊢ False', 'is false']):
        require(c['argv'] == ['lake', 'env', 'lean', '-M6144', '-DwarningAsError=true',
                             REMOTE + '/.lake/chess-field-binary/' + name + '.lean'] and
                c['exit'] == 1 and 'error:' in c['output'] and marker in c['output'],
                'false-theorem control failed for unintended reason: ' + name)
    fixtures = phases['fixtures']['checks']
    require(len(fixtures) == 2 and all(c['exit'] == 0 for c in fixtures), 'fixture phase failed')
    require(fixtures[0]['argv'] == ['lake', 'env', REMOTE + '/.lake/build/bin/chess_field_binary_export',
                                  REMOTE + '/.lake/chess-field-binary/routines.json'],
            'row export invocation mismatch')
    require(fixtures[1]['argv'] == ['/usr/bin/python3', 'scripts/chess_field_binary/fixtures.py'] and
            fixtures[1]['output'] == 'Field binary independent fixtures passed: '
            '311296 machine cases; 6 rejected controls\n', 'independent fixture receipt mismatch')
    detail = read(u / 'fixtures-detail.json')
    tables = read(u / 'routines.json')
    require(detail['status'] == 'passed' and detail['binary_machine_cases'] == 311296 and
            detail['raw_cell_patterns'] == 8192 and detail['valid_encoded_cells'] == 1250 and
            detail['raw_invalid_cells_exercised'] == 6942 and detail['universal_proof'] is False,
            'fixture scope summary mismatch')
    expected_descriptors = []
    for offset, read_size, write_size in zip([0, 3, 6, 9], [39, 66, 93, 120], [5, 11, 17, 23]):
        expected_descriptors.append(('read', offset, 0, read_size))
        expected_descriptors.extend(('write', offset, word, write_size) for word in range(8))
    expected_descriptors.extend((kind, 0, 0, 14) for kind in ['move_left', 'move_right'])
    require(len(tables['routines']) == len(detail['routines']) == 38, 'wrong routine inventory')
    for table, f, descriptor in zip(tables['routines'], detail['routines'], expected_descriptors):
        require(tuple(table[k] for k in ['kind', 'offset', 'value', 'states']) == descriptor and
                tuple(f[k] for k in ['kind', 'offset', 'value', 'states']) == descriptor and
                f['raw_cell_patterns'] == 8192, 'routine descriptor mismatch')
        require(len(table['rows']) == len(table['exits']) == table['states'],
                'saved row-array state charge mismatch')
        # This inspects saved terminal metadata; it does not execute transition rows.
        exits = [x for x in table['exits'] if x is not None]
        require(sorted(exits) == (list(range(8)) if table['kind'] == 'read' else [0]),
                'charged exit metadata mismatch')
    require(tables['codec'] == [[i, i if i < 5 else 0] for i in range(8)], 'raw-code decoder mismatch')
    require(tables['legacy_allocation_marginals'] == [211410, 82000, 110], 'saved marginal mismatch')
    negative = detail['negative_controls']
    require([c['name'] for c in negative] == ['wrong state charge', 'wrong read result',
            'wrong head movement', 'surrounding tape corruption', 'premature missing transition',
            'cycle'] and all(c['rejected'] is True for c in negative), 'table controls mismatch')
    counts = phases['counts']
    require(counts['checks'] == [] and counts['candidate_standalone'] == EXPECTED_STATES and
            counts['legacy_marginal_body_allocation'] == EXPECTED_MARGINALS,
            'state comparison receipt mismatch')
    require(counts['comparison_scopes_differ'] is True and
            counts['full_chess_machine_constructed'] is False and
            counts['accepted_chess_machine_states'] == 390491642, 'count scope changed')
    export_hash = sha(u / 'routines.json')
    require(export_hash == counts['exported_rows_sha256'] == phases['fixtures']['exported_rows_sha256'],
            'row export hash mismatch')
    history = []
    for old in sorted((BASE / 'evidence/history').iterdir()):
        if old.is_dir():
            old_run, _, _, _, _ = authenticate(old)
            require(old_run['conclusion'] == 'failure', 'failed attempt relabeled as success')
            history.append(old_run['id'])
    require(set(history) == EXPECTED_FAILURES, 'retained failure inventory changed')
    claims = read(BASE / 'results.json')
    if control == 'claim':
        claims['comparison']['full_machine_saving_claim'] = True
    require(claims['status'] == 'remote_complete' and claims['computation_commit'] == COMMIT and
            claims['remote_run_id'] == RUN and claims['repository'] == REPO and claims['branch'] == BRANCH,
            'final claims run binding mismatch')
    require(claims['standalone_binary_states'] == EXPECTED_STATES and claims['exits_included'] is True and
            claims['legacy_allocation_marginals'] == EXPECTED_MARGINALS, 'final state claims disagree')
    require(claims['comparison'] == {'scopes_differ': True, 'families_overlap': True,
            'marginals_additive_replacement_costs': False, 'per_operation_saving_claim': False,
            'full_machine_saving_claim': False}, 'unsupported comparison claim')
    require(claims['fixtures'] == {'exported_routines': 38, 'machine_cases': 311296,
            'raw_cell_patterns': 8192, 'valid_cells': 1250, 'invalid_cells': 6942,
            'corruption_controls': 6, 'fixtures_are_universal_proof': False,
            'export_sha256': export_hash}, 'final fixture claims disagree')
    require(claims['trust_audit'] == {'roots': 196, 'dependencies': 5787,
            'permitted_axioms': ['propext', 'Classical.choice', 'Quot.sound'],
            'compiler_artifacts_excluded': 7, 'generator_roots_in_proof_closure': 0,
            'negative_audit_controls': 3, 'false_theorem_controls': 3}, 'final audit claims disagree')
    require(claims['constraints'] == {'frozen_specification_changed': False,
            'all_heavy_computation_remote': True, 'outreach_performed': False,
            'upstream_writes': False, 'model_search_performed': False,
            'full_chess_backend_integration': False, 'accepted_chess_machine_states': 390491642},
            'final scope constraints changed')
    evidence = claims['evidence']
    require(evidence['source_sha256'] == source and evidence['frozen_source_sha256'] == pins and
            evidence['frozen_input_count'] == 237 and
            evidence['phase_status'] == {p: 'passed' for p in PHASES} and
            evidence['artifact_sha256'] == sha(folder / 'artifact.zip') and
            evidence['logs_sha256'] == sha(folder / 'logs.zip') and evidence['archive_entries'] == 21,
            'final evidence claims disagree')
    for path, expected in binding['reviewed_repository_files'].items():
        require(sha(ROOT / path) == expected, 'reviewed source/doc/evidence changed: ' + path)
    return {'schema': 1, 'status': 'passed', 'scope': 'independent saved-evidence and source review',
            'remote_run_id': RUN, 'computation_commit': COMMIT,
            'saved_run_updated_at': run['updated_at'], 'artifact_id': artifact['id'],
            'artifact_sha256': sha(folder / 'artifact.zip'), 'logs_sha256': sha(folder / 'logs.zip'),
            'archive_entries': 21, 'phases': list(PHASES), 'computation_inputs': 11, 'frozen_inputs': 237,
            'machine_cases_observed_remotely': 311296, 'raw_patterns': 8192,
            'valid_cells': 1250, 'invalid_cells': 6942, 'table_controls': 6,
            'audit_roots': 196, 'audit_dependencies': 5787, 'audit_controls': 3,
            'false_theorem_controls': 3, 'retained_failed_runs': sorted(history),
            'standalone_states': EXPECTED_STATES, 'legacy_allocation_marginals': EXPECTED_MARGINALS,
            'comparison_scopes_differ': True, 'marginals_additive_replacement_costs': False,
            'full_chess_backend_integration': False, 'accepted_chess_machine_states': 390491642,
            'local_heavy_computation': False, 'outreach_performed': False,
            'live_job_status_reviewed_here': False, 'root_acceptance_is_separate': True,
            'construction_binding_sha256': sha(HERE / 'construction-binding.json')}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write-receipt', action='store_true')
    parser.add_argument('--negative-control', choices=['source', 'entry', 'claim'])
    args = parser.parse_args()
    require(not (args.write_receipt and args.negative_control), 'incompatible arguments')
    receipt = verify(args.negative_control)
    if args.negative_control:
        raise ReviewError('negative control escaped rejection')
    if args.write_receipt:
        (HERE / 'receipt.json').write_text(encoded(receipt))
        print('Independent review receipt prepared; seal verification still required')
        return
    require((HERE / 'receipt.json').read_text() == encoded(receipt), 'deterministic receipt changed')
    seal = read(HERE / 'seal.json')
    require(seal['status'] == 'passed' and seal['computation_commit'] == COMMIT and
            seal['remote_run_id'] == RUN and seal['saved_run_updated_at'] == receipt['saved_run_updated_at'],
            'review seal identity mismatch')
    for name, expected in seal['review_files_sha256'].items():
        require(Path(name).name == name and sha(HERE / name) == expected,
                'sealed review file changed: ' + name)
    require(set(seal['review_files_sha256']) == {'check_saved_evidence.py', 'construction-binding.json',
            'receipt.json', 'report.md', 'r1-source-review.md', 'r1-source-binding.json',
            'r1-initial-source-binding.json'}, 'review seal inventory changed')
    print('Field binary independent saved-evidence review passed')


if __name__ == '__main__':
    try:
        main()
    except (ReviewError, KeyError, ValueError, OSError, zipfile.BadZipFile) as exc:
        print('Field binary independent review rejected: ' + str(exc), file=sys.stderr)
        sys.exit(1)
