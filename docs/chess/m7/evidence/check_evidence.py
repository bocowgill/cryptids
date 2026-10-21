#!/usr/bin/env python3
"""Recheck retained M7 provenance/JSON; no Lean, native code or table sweep."""
from pathlib import Path
import hashlib
import json
import zipfile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
STATES = 392_046_822
RAW = '47a9730ccdcbdf0983951be91993ce1470b0109e75a347696786b70eda011c81'
IMPLEMENTATION = '088988f81248c3b2270d6d4549dd3ab29296c3a9'
REGRESSION = '1c3be1cb21ae223794c51f569dd53d12f7991cca'


def read(path):
    return json.loads(path.read_text())


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def need(condition, message):
    if not condition:
        raise SystemExit(message)


def steps(run):
    return {s['name']: s for job in run['jobs'] for s in job['steps']}


def log_markers(folder, markers):
    with zipfile.ZipFile(folder / 'logs.zip') as archive:
        need(archive.testzip() is None, 'Remote log archive damaged')
        lines = [line for name in archive.namelist()
                 for line in archive.read(name).decode('utf-8', errors='replace').splitlines()]
        for marker in markers:
            need(any(line.endswith(marker) for line in lines), 'Missing remote completion token: ' + marker)


def checked_archive(folder, run_id, commit, conclusion, required):
    run, api = read(folder / 'run.json'), read(folder / 'run-api.json')
    need(run['status'] == api['status'] == 'completed', 'Run incomplete')
    need(run['conclusion'] == api['conclusion'] == conclusion, 'Wrong run conclusion')
    need(api['id'] == run_id and run['headSha'] == api['head_sha'] == commit,
         'Wrong source run/revision')
    need(run['attempt'] == api['run_attempt'] and api['head_branch'] == 'codex/chess-m7',
         'Wrong run attempt/branch')
    for name in required:
        need(steps(run).get(name, {}).get('conclusion') == 'success', 'Missing step: ' + name)
    artifacts = read(folder / 'artifact-api.json')['artifacts']
    need(len(artifacts) == 1, 'Unexpected artifact inventory')
    artifact = artifacts[0]
    need(artifact['workflow_run']['id'] == run_id and
         artifact['workflow_run']['head_sha'] == commit and
         artifact['workflow_run']['head_branch'] == 'codex/chess-m7', 'Wrong artifact revision')
    need(artifact['size_in_bytes'] == (folder / 'artifact.zip').stat().st_size and
         artifact['digest'] == 'sha256:' + sha(folder / 'artifact.zip'), 'Official ZIP digest mismatch')
    entries = read(folder / 'archive-entries.json')
    with zipfile.ZipFile(folder / 'artifact.zip') as archive:
        names = [i.filename for i in archive.infolist() if not i.is_dir()]
        need(len(names) == len(set(names)) and set(names) == set(entries), 'Archive inventory mismatch')
        for name in names:
            data, record = archive.read(name), entries[name]
            need(len(data) == record['bytes'] and hashlib.sha256(data).hexdigest() == record['sha256'],
                 'Archive entry digest: ' + name)
            if 'retained_file' in record:
                need(data == (folder / record['retained_file']).read_bytes(), 'Retained report differs: ' + name)
            elif 'repository_file' in record:
                need(data == (ROOT / record['repository_file']).read_bytes(), 'Fixed output differs: ' + name)
            else:
                need(name.endswith('/bootstrap.json') and record.get('acceptance', '').startswith('excluded:'),
                     'Unclassified archive entry: ' + name)
    return run, artifact


core = HERE / 'current'
regression = HERE / 'regressions'
core_run, core_artifact = checked_archive(core, 39506528766, IMPLEMENTATION, 'failure', (
    'Check generic quotient proof strictly',
    'Verify quotient proofs, exact stopping and corruption controls',
    'Verify fixed target and complete candidate table',
    'Retain M7 artifacts and verification evidence'))
need(steps(core_run)['Propose initial fixed target and lossless table map']['conclusion'] == 'skipped',
     'Core evidence was proposal-only')
need(steps(core_run)['Verify unchanged M1–M5 regression baseline']['conclusion'] == 'failure',
     'Earlier baseline setup failure hidden')
log_markers(core, ('Chess M7 frozen baseline verification passed',
                  'Chess M7 quotient proof verification passed',
                  'Chess M7 definition verification passed',
                  'Chess M7 complete table verification passed'))
failure = HERE / 'failures/fixed-baseline-mathlib-cache.log'
need('Mathlib.olean' in failure.read_text() and 'does not exist' in failure.read_text(),
     'Missing retained setup diagnosis')
regression_run, regression_artifact = checked_archive(regression, 39527113752, REGRESSION, 'success', (
    'Fetch complete pinned Mathlib for original reference imports',
    'Record exact checkout and unchanged computation inputs',
    'Verify unchanged M1–M5 regression baseline',
    'Retain exact M7 regression completion evidence'))
log_markers(regression, ('Chess M7 frozen baseline verification passed',
                        'Chess M7 baseline verification passed'))

reports = {name: read(core / (name + '.json')) for name in ('proofs', 'definitions', 'table')}
reports['baseline'] = read(regression / 'baseline.json')
pins = reports['proofs']['source_sha256']
need(len(pins) == 192, 'Wrong complete core pin set')
for name, report in reports.items():
    need(report['status'] == ('complete' if name == 'table' else 'passed'), name + ': status')
    need(report['source_sha256'] == pins, name + ': different computation pins')
    checks = report.get('checks', [])
    if name == 'table':
        checks = [report['native_build']]
    for check in checks:
        negative = any(str(x).startswith('--negative-control') for x in check['argv'])
        need(check['exit'] == (1 if negative else 0), name + ': unexpected exit')
        need(check['expected'] in check['output'], name + ': missing expected output')
        need(hashlib.sha256(check['output'].encode()).hexdigest() == check['output_sha256'],
             name + ': output digest')
need(len(reports['proofs']['checks']) == 7 and len(reports['definitions']['checks']) == 4 and
     len(reports['baseline']['checks']) == 1, 'Incomplete proof/definition/regression checks')
for name, expected in pins.items():
    need(sha(ROOT / name) == expected, 'Current computation input changed: ' + name)
old = read(ROOT / 'docs/chess/m7/baseline-pins.json')
need(len(old) == 172 and all(pins.get(n) == h for n, h in old.items()), 'Frozen M6 pin set changed')
names = set(old)
for pattern in ('Cryptids/Optimisation/*.lean', 'Cryptids/Chess/Optimisation/*.lean',
                'scripts/*ChessM7*.lean', 'scripts/chess_m7/*.lean', 'scripts/chess_m7/*.py'):
    names.update(str(path.relative_to(ROOT)) for path in ROOT.glob(pattern))
names.update(('Cryptids/Semantics/ChessM7.lean', 'scripts/verify_chess_m7.py',
              'lakefile.chess-m7.toml', 'comparator/chess_m7.json',
              '.github/workflows/chess_m7_ci.yml', 'docs/chess/m7/baseline-pins.json',
              'Cryptids/ChessM7Challenge.lean', 'artifacts/chess_m7/challenge.json',
              'artifacts/chess_m7/table-map.json'))
need(set(pins) == names, 'Current computation inventory changed')
for folder in (core, regression):
    freeze = read(folder / 'freeze.json')
    need(freeze['status'] == 'passed' and freeze['baseline_source_sha256'] == old, 'Wrong freeze evidence')
checkout = read(regression / 'regression-checkout.json')
helper = '.github/workflows/chess_m7_regressions.yml'
need(checkout['source_commit'] == REGRESSION and checkout['source_sha256'] == pins,
     'Recovery checkout/core input mismatch')
need(checkout['regression_workflow_sha256'] == sha(ROOT / helper), 'Recovery orchestration changed')
need('4.35.0-rc4' in checkout['toolchain'], 'Wrong regression toolchain')

mutants = read(core / 'controls.json')
need(mutants['source_sha256'] == pins['Cryptids/ChessM7Challenge.lean'], 'Stale target controls')
need(mutants['valid_kernel_mutants'] == 4 and len(mutants['checks']) == 8, 'Incomplete semantic controls')
for check in mutants['checks']:
    kernel_build = check['label'].endswith('-kernel-build')
    need(check['exit'] == (0 if kernel_build else 1), 'Bad semantic-control exit')
    need((kernel_build or check['expected_marker']) and len(check['output_sha256']) == 64,
         'Incomplete semantic-control record')
manifest, table = read(core / 'candidate-table-manifest.json'), reports['table']
need(table['states'] == table['compared_rows'] == manifest['states'] == STATES, 'Wrong actual candidate count')
need(table['canonical_raw_sha256'] == manifest['raw_sha256'] == RAW, 'Wrong canonical stream')
need(len(manifest['parts']) == 393, 'Incomplete part inventory')
for key, kind, mode in (('pack', 'extract', 'generation-only'), ('comparison', 'independent', 'every-row-byte')):
    journal = table[key]
    need(journal == read(core / (kind + '-run.json')), 'Missing original producer journal')
    need(journal['status'] == 'complete' and journal['states_completed'] == STATES and
         journal['completed'] == manifest['parts'] and journal['comparison'] == mode, 'Partial or different table')
    need(journal['peak_active_producers'] <= 4 and journal['peak_sampled_rss_bytes'] <= 8 * 1024**3,
         'Remote resource cap exceeded')
    need(len(journal['attempts']) == 1 and journal['attempts'][0]['status'] == 'complete',
         'Incomplete producer attempt')
    plan = journal['plan']
    need(plan['tool_sha256'] == pins['scripts/chess_m6_parallel_parts.py'] and
         plan['table_parts_sha256'] == pins['scripts/chess_m6_table_parts.py'], 'Stale table orchestrator')
    source_root = plan['producer']['cwd'].rstrip('/') + '/'
    for name, expected in pins.items():
        need(plan['producer']['pins'].get(source_root + name) == expected, 'Stale producer input: ' + name)
need(table['comparison']['compared_rows'] == STATES and table['comparison']['compressed_reproduction'],
     'Independent byte comparison/gzip reproduction incomplete')
stop, raw_bytes, gzip_bytes = 0, 0, 0
for index, part in enumerate(manifest['parts']):
    need(part['index'] == index and part['start_state'] == stop and 0 < part['rows'] <= 1_000_000,
         'Overlapping/missing/invalid part')
    stop += part['rows']
    need(part['end_state_exclusive'] == stop, 'Incorrect endpoint')
    raw_bytes += part['raw_bytes']
    gzip_bytes += part['gzip_bytes']
need(stop == STATES and raw_bytes == manifest['raw_bytes'] and gzip_bytes == manifest['gzip_bytes'],
     'Incomplete canonical table')

original = HERE / 'original-ci'
original_run, original_api = read(original / 'run.json'), read(original / 'run-api.json')
need(original_run['conclusion'] == original_api['conclusion'] == 'success' and
     original_run['headSha'] == original_api['head_sha'] == IMPLEMENTATION and
     original_api['id'] == 39506528743 and original_run['attempt'] == original_api['run_attempt'] == 2,
     'Original CI provenance mismatch')
need(all(s['conclusion'] == 'success' for s in steps(original_run).values()), 'Original CI did not pass all steps')
for name, expected in read(original / 'manifest.json').items():
    need(sha(original / name) == expected, 'Original CI evidence changed')
with zipfile.ZipFile(original / 'logs.zip') as archive:
    need(archive.testzip() is None and len(archive.infolist()) == 15, 'Original CI log archive damaged')
for item in read(HERE / 'failures/manifest.json'):
    path = HERE / 'failures' / item['file']
    need(path.stat().st_size == item['bytes'] and sha(path) == item['sha256'], 'Failure log changed')

print(json.dumps({
    'status': 'passed', 'method': 'light metadata/hash recheck of retained remote evidence',
    'script_sha256': sha(Path(__file__)), 'current_source_files': len(pins), 'frozen_files': len(old),
    'source_sha256': pins, 'regression_workflow_sha256': checkout['regression_workflow_sha256'],
    'implementation_commit': IMPLEMENTATION, 'regression_commit': REGRESSION,
    'core_workflow_conclusion': core_run['conclusion'],
    'regression_workflow_conclusion': regression_run['conclusion'],
    'core_artifact_sha256': core_artifact['digest'], 'regression_artifact_sha256': regression_artifact['digest'],
    'states': stop, 'parts': len(manifest['parts']), 'raw_sha256': RAW,
    'manifest_sha256': sha(core / 'candidate-table-manifest.json'),
    'valid_kernel_mutants': mutants['valid_kernel_mutants'],
    'original_ci_attempt': 2, 'failed_core_baseline_setup_retained': True,
    'excluded_cached_bootstrap': True
}, indent=2))
