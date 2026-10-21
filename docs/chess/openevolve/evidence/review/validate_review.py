#!/usr/bin/env python3
"""Independent saved-evidence inspection; never runs Lean, a model or fixtures."""
import ast
import argparse
import hashlib
import json
from pathlib import Path
import zipfile

ROOT = next(p for p in Path(__file__).resolve().parents
            if (p / 'scripts/chess_openevolve/verify.py').is_file())
HERE = Path(__file__).resolve().parent
CURRENT = ROOT / 'docs/chess/openevolve/evidence/current'
BASELINE = ROOT / 'docs/chess/openevolve/evidence/baseline'
COMMIT = json.loads((HERE / 'construction-binding.json').read_text())['commit']
FRAMEWORK = '59dfe764b5ab4478ac00214432fcac33bbe2bf4b'
MODEL = 'Qwen/Qwen2.5-Coder-0.5B-Instruct'
REVISION = 'ea3f2471cf1b1f0db85067f1ef93848e38e88c25'


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def read(path):
    return json.loads(path.read_text())


def policy(code):
    tree = ast.parse(code)
    statement, = tree.body
    assert isinstance(statement, ast.Assign) and len(statement.targets) == 1
    assert isinstance(statement.targets[0], ast.Name) and statement.targets[0].id == 'POLICY'
    result = ast.literal_eval(statement.value)
    assert type(result) is tuple and len(result) == 2
    assert all(type(v) is int for v in result)
    assert result in {(a, b) for a in range(3) for b in range(2)}
    return result


def proof(record, selected):
    assert record['exit'] == 0
    assert not record['stdout'] and not record['stderr']
    assert hashlib.sha256(record['source'].encode()).hexdigest() == record['source_sha256']
    assert record['argv'][:5] == ['lake', 'env', 'lean', '-M6144', '-DwarningAsError=true']
    assert Path(record['argv'][-1]).stem == record['source_sha256']
    if selected == (1, 0):
        assert 'example {q : Nat} [NeZero q] (h : Fin q)' in record['source']
        assert '(terminal : ∀ b, M h b = none) (input : List Bool)' in record['source']
        assert 'step (TerminalBinary.compile h M)' in record['source']
        assert record['source'].endswith('  TerminalBinary.halts_input h M terminal input\n')
    else:
        assert selected == (0, 0)
        assert 'step (Binary.compile M)' in record['source']
        assert record['source'].endswith('  Binary.compile_halts_input M input\n')


def archive_binding(folder):
    run = read(folder / 'run-api.json')
    retention = read(folder / 'retention.json')
    assert run['status'] == 'completed'
    assert run['head_branch'] == 'codex/chess-openevolve-pilot'
    assert retention['run_id'] == run['id'] and retention['commit'] == run['head_sha']
    assert retention['conclusion'] == run['conclusion']
    artifact, = read(folder / 'artifact-api.json')['artifacts']
    assert artifact['workflow_run']['head_sha'] == run['head_sha']
    assert artifact['workflow_run']['id'] == run['id']
    assert artifact['digest'] == 'sha256:' + sha(folder / 'artifact.zip')
    assert artifact['size_in_bytes'] == (folder / 'artifact.zip').stat().st_size
    assert retention['artifact_sha256'] == sha(folder / 'artifact.zip')
    assert retention['logs_sha256'] == sha(folder / 'logs.zip')
    entries = read(folder / 'archive-entries.json')
    with zipfile.ZipFile(folder / 'artifact.zip') as archive:
        names = [i.filename for i in archive.infolist() if not i.is_dir()]
        assert len(names) == len(set(names)) and set(names) == set(entries)
        for name in names:
            path = folder / 'unpacked' / name
            assert path.stat().st_size == entries[name]['bytes']
            assert sha(path) == entries[name]['sha256']
            # Only the small retained evidence is inspected; no table is generated.
            assert hashlib.sha256(archive.read(name)).hexdigest() == entries[name]['sha256']
    jobs = read(folder / 'jobs-api.json')['jobs']
    return run, {step['name']: step for job in jobs for step in job['steps']}


def check_output(check):
    assert hashlib.sha256(check['output'].encode()).hexdigest() == check['output_sha256']
    assert check['elapsed_seconds'] >= 0 and check['shell'] is False
    assert check['cumulative_children_peak_rss_kib'] >= 0


def main(core_only=False):
    binding = read(HERE / 'construction-binding.json')
    assert binding['commit'] == COMMIT and binding['frozen_inputs'] == 192
    assert read(ROOT / 'docs/chess/openevolve/baseline-pins.json') == binding['frozen_source_sha256']
    for path, digest in dict(binding['frozen_source_sha256'], **binding['source_sha256']).items():
        assert sha(ROOT / path) == digest, 'Changed source: ' + path
    run, steps = archive_binding(CURRENT)
    assert run['conclusion'] == 'failure' and run['head_sha'] == COMMIT
    assert run['id'] == 39542309855 and run['name'] == 'Chess OpenEvolve pilot'
    for name in ('Start fresh pilot evidence after cache restore', 'Check compiler contract remotely',
                 'Check new paid machine, trust closure and artifact', 'Check accepted M7 regression',
                 'Run bounded real OpenEvolve search'):
        assert steps[name]['conclusion'] == 'success'
    assert steps['Check frozen M1 through M5 regression']['conclusion'] == 'failure'
    unpacked = CURRENT / 'unpacked'
    reports = {}
    for phase in ('proofs', 'controls', 'artifact', 'regression', 'search'):
        matches = [p for p in unpacked.rglob(phase + '.json')
                   if 'source_sha256' in read(p)]
        path, = matches
        report = reports[phase] = read(path)
        assert report['phase'] == phase and report['status'] == 'passed'
        assert report['commit'] == COMMIT and int(report['run_id']) == run['id']
        assert report['source_sha256'] == binding['source_sha256']
        assert report['frozen_source_sha256'] == binding['frozen_source_sha256']
        for check in report['checks']:
            if 'output' in check:
                check_output(check)
                assert check['timed_out'] is False
    checks = reports['proofs']['checks']
    assert len(checks) == 6
    assert checks[0]['argv'] == ['lake', '--wfail', '-f', 'lakefile.chess-openevolve.toml',
                                 'build', 'Cryptids.Semantics.ChessOpenEvolve']
    assert checks[0]['exit'] == 0 and 'Build completed successfully' in checks[0]['output']
    assert checks[1]['argv'] == ['lake', '--wfail', '-f', 'lakefile.chess-openevolve.toml',
                                 'build', 'chess_openevolve_audit']
    assert checks[1]['exit'] == 0 and 'Build completed successfully' in checks[1]['output']
    audit_prefix = ['prlimit', '--as=17179869184', '--', 'lake', 'env']
    assert checks[2]['argv'][:5] == audit_prefix
    assert checks[2]['argv'][-1].endswith('/.lake/build/bin/chess_openevolve_audit')
    assert checks[2]['exit'] == 0 and 'Chess OpenEvolve foundation audit passed' in checks[2]['output']
    for check, flag, marker in zip(checks[3:],
            ['--negative-control', '--negative-control-open', '--negative-control-generator'],
            ['Forbidden axiom: sorryAx', 'The open chess conjecture is a dependency',
             'Proof generator is a mathematical dependency:']):
        assert check['argv'][:5] == audit_prefix
        assert check['exit'] == 1 and check['argv'][-1] == flag and marker in check['output']
    assert reports['proofs']['states'] == 392046821
    assert reports['proofs']['previous_states'] == 392046822
    assert reports['proofs']['saved_states'] == 1
    assert reports['proofs']['initializer_states'] == 3110360
    assert reports['proofs']['target'] == 'NOT(WhiteCanAvoidLoss AND BlackCanAvoidLoss)'
    controls = reports['controls']
    assert controls['universal_proof_required'] is True
    assert len(controls['rejections']) == 13
    assert any('Real Lean subprocess timeout rejected' in r for r in controls['rejections'])
    assert sum('Rejected corrupt table/cost binding:' in r for r in controls['rejections']) == 4
    assert sum('Counterexample:' in r for r in controls['rejections']) == 4
    assert len(controls['checks']) == 4
    assert controls['checks'][0]['exit'] == 0 and 'Terminal binary fixtures passed' in controls['checks'][0]['output']
    proof(controls['checks'][1], (0, 0))
    proof(controls['checks'][2], (1, 0))
    assert controls['checks'][3]['exit'] == 1 and 'error:' in controls['checks'][3]['output']
    assert reports['artifact']['recipe'] == read(ROOT / 'artifacts/chess_openevolve/table-map.json')
    assert reports['artifact']['full_table_streamed'] is False
    assert reports['artifact']['checks'][0]['exit'] == 0
    assert reports['artifact']['checks'][0]['argv'][-1] == 'scripts/chess_openevolve/TableCertificate.lean'
    check, = reports['regression']['checks']
    assert check['argv'] == ['python3', 'scripts/verify_chess_m7.py', '--proofs']
    assert check['exit'] == 0 and 'Chess M7 quotient proof verification passed' in check['output']
    baseline_command = ['python3', 'scripts/verify_chess_m6.py', '--baseline']
    timeouts = [read(p) for p in (unpacked / 'commands').glob('*.json')
                if read(p)['argv'] == baseline_command]
    timeout, = timeouts
    check_output(timeout)
    assert timeout['timed_out'] is True and timeout['exit'] == -9
    assert timeout['elapsed_seconds'] >= 3600
    assert 'Chess M5 baseline verification passed' in timeout['output']
    assert 'Chess M6 baseline verification passed' not in timeout['output']
    assert not list(unpacked.rglob('baseline.json'))
    result = reports['search']['result']
    assert result['status'] == 'passed' and result['best_score'] == 1.0
    assert policy(result['best_code']) == (1, 0)
    assert result['metrics']['states'] == 392046821 and result['metrics']['certified'] == 1
    assert result['model'] == MODEL and result['model_revision'] == REVISION
    assert result['openevolve_commit'] == FRAMEWORK
    assert result['installed_openevolve_source']['vcs_info']['commit_id'] == FRAMEWORK
    assert result['paid_api_calls'] == 0
    assert result['maximum_proposals'] == 5 and result['maximum_output_tokens_per_proposal'] == 32
    model_path, = unpacked.rglob('model.jsonl')
    evaluation_path, = unpacked.rglob('evaluations.jsonl')
    model = [json.loads(line) for line in model_path.read_text().splitlines()]
    evaluations = [json.loads(line) for line in evaluation_path.read_text().splitlines()]
    assert len(model) == 5 and len(evaluations) == 6
    assert policy(evaluations[0]['code']) == (0, 0)
    remaining = {f'POLICY = ({a}, {b})\n' for a in range(3) for b in range(2)}
    previous = {'POLICY = (0, 0)\n'}
    for index, request in enumerate(model):
        assert request['model'] == MODEL and request['revision'] == REVISION and request['remote'] is True
        assert set(request['choices']) == remaining - previous
        assert set(request['excluded']) == previous and request['response'] in request['choices']
        assert 0 < request['usage']['prompt_tokens'] <= 3072
        assert 0 < request['usage']['completion_tokens'] <= 32
        assert request['usage']['prompt_tokens'] == len(request['input_token_ids'])
        assert request['usage']['completion_tokens'] == len(request['output_token_ids'])
        assert request['usage']['total_tokens'] == sum(request['usage'][k] for k in ('prompt_tokens', 'completion_tokens'))
        assert request['seconds'] >= 0
        previous.add(request['response'])
    assert previous == remaining
    by_policy = {}
    for evaluation in evaluations:
        chosen = policy(evaluation['code'])
        assert chosen not in by_policy
        by_policy[chosen] = evaluation
        assert hashlib.sha256(evaluation['code'].encode()).hexdigest() == evaluation['code_sha256']
        assert evaluation['seconds'] >= 0
        if chosen in ((0, 0), (1, 0)):
            assert evaluation['certified'] is True
            proof(evaluation['proof'], chosen)
            assert evaluation['states'] == 392046822 - (chosen == (1, 0))
            assert len(evaluation['fixtures']) == 6
        else:
            assert evaluation['certified'] is False and 'Counterexample:' in evaluation['rejection']
    assert len(by_policy) == 6
    assert reports['search']['model_requests'] == 5 and reports['search']['evaluations'] == 6
    assert reports['search']['tokens'] == sum(r['usage']['total_tokens'] for r in model)
    checkpoints = [p for p in unpacked.rglob('checkpoint_*') if p.is_dir()]
    assert sorted(p.name for p in checkpoints) == [f'checkpoint_{i}' for i in range(1, 6)]
    trace_path, = unpacked.rglob('evolution_trace.jsonl')
    trace = [json.loads(line) for line in trace_path.read_text().splitlines()]
    assert len(trace) == 5
    for index, (row, request) in enumerate(zip(trace, model), start=1):
        assert row['iteration'] == index and row['llm_response'] == request['response']
        assert policy(row['child_code']) == policy(request['response'])
        assert row['prompt']['system'] == request['system']
        assert row['prompt']['user'] == request['messages'][0]['content']
        assert row['metadata']['token_usage'] == request['usage']
        evaluation = by_policy[policy(row['child_code'])]
        assert json.loads(row['artifacts']['feedback']) == evaluation
        assert row['child_metrics']['certified'] == int(evaluation['certified'])
        assert row['child_metrics']['combined_score'] == (1 if policy(row['child_code']) == (1, 0) else 0)
    final_checkpoint, = [p for p in checkpoints if p.name == 'checkpoint_5']
    best_info = read(final_checkpoint / 'best_program_info.json')
    metadata = read(final_checkpoint / 'metadata.json')
    best_program = read(final_checkpoint / 'programs' / (best_info['id'] + '.json'))
    assert metadata['last_iteration'] == 5 and metadata['best_program_id'] == best_info['id']
    assert policy((final_checkpoint / 'best_program.py').read_text()) == (1, 0)
    assert policy(best_program['code']) == (1, 0) and best_program['metrics'] == result['metrics']
    assert best_info['metrics'] == result['metrics'] and best_info['iteration'] == 3
    assert json.loads(json.loads(best_program['artifacts_json'])['feedback']) == by_policy[(1, 0)]
    summary = {'status': 'core-passed-baseline-pending', 'scope': 'independent metadata and saved-output review; no local proof/model/native/table execution',
               'commit': COMMIT, 'run_id': run['id'], 'artifact_sha256': sha(CURRENT / 'artifact.zip'),
               'logs_sha256': sha(CURRENT / 'logs.zip'), 'source_sha256': binding['source_sha256'],
               'core_conclusion': run['conclusion'], 'frozen_inputs': 192,
               'phase_reports': 5, 'model_requests': len(model),
               'evaluations': len(evaluations), 'tokens': reports['search']['tokens'],
               'ordered_model_proposals': [list(policy(r['response'])) for r in model],
               'framework_elapsed_seconds': result['elapsed_seconds'],
               'model_generation_seconds': sum(r['seconds'] for r in model),
               'core_baseline_timeout_seconds': timeout['elapsed_seconds'],
               'new_full_table_streamed': False,
               'construction_binding_sha256': sha(HERE / 'construction-binding.json')}
    (HERE / 'core-evidence-check.json').write_text(json.dumps(summary, indent=2) + '\n')
    if not core_only and (BASELINE / 'run-api.json').is_file():
        baseline_run, baseline_steps = archive_binding(BASELINE)
        assert baseline_run['conclusion'] == 'success'
        assert baseline_run['name'] == 'Chess OpenEvolve baseline completion'
        assert baseline_steps['Check frozen M1 through M5 regression']['conclusion'] == 'success'
        assert baseline_steps['Start fresh baseline evidence after cache restore']['conclusion'] == 'success'
        helper_path, = binding['separate_orchestration_sha256']
        helper_digest = binding['separate_orchestration_sha256'][helper_path]
        assert sha(ROOT / helper_path) == helper_digest
        baseline_unpacked = BASELINE / 'unpacked'
        baseline_path, = baseline_unpacked.rglob('baseline.json')
        baseline = read(baseline_path)
        checkout_path, = baseline_unpacked.rglob('helper-checkout.json')
        checkout = read(checkout_path)
        for record in (baseline, checkout):
            assert record['commit'] == baseline_run['head_sha']
            assert int(record['run_id']) == baseline_run['id']
            assert record['source_sha256'] == binding['source_sha256']
            assert record['frozen_source_sha256'] == binding['frozen_source_sha256']
            assert record['orchestration_sha256'] == helper_digest
            assert record['core_run_id'] == run['id']
            assert record['baseline_timeout_seconds'] == 7200
        assert checkout['orchestration_workflow'] == helper_path
        assert baseline['phase'] == 'baseline' and baseline['status'] == 'passed'
        check, = baseline['checks']
        check_output(check)
        assert check['timed_out'] is False and check['exit'] == 0
        assert check['argv'] == baseline_command
        assert 'Chess M6 baseline verification passed' in check['output']
        summary.update(status='passed', phase_reports=6,
            baseline_run_id=baseline_run['id'], baseline_commit=baseline_run['head_sha'],
            baseline_conclusion=baseline_run['conclusion'],
            baseline_artifact_sha256=sha(BASELINE / 'artifact.zip'),
            baseline_logs_sha256=sha(BASELINE / 'logs.zip'),
            separate_orchestration_sha256=binding['separate_orchestration_sha256'])
        (HERE / 'evidence-check.json').write_text(json.dumps(summary, indent=2) + '\n')
    print(json.dumps({k: v for k, v in summary.items() if k != 'source_sha256'}))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--core-only', action='store_true',
                        help='check the completed core components and retained timeout only')
    main(parser.parse_args().core_only)
