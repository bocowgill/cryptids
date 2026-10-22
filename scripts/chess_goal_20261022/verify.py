#!/usr/bin/env python3
"""Focused remote proof checks for the dated compression campaign."""
import argparse
import importlib.util
import json
import os
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / '.lake/chess-goal-20261022'


def full(runner, manifest):
    """Full remote acceptance evidence; final independent review is separate."""
    checks = []
    lakefile = 'lakefile.chess-goal-20261022.toml'

    def run(command, expected='', code=0, timeout=900):
        record = runner.run(command, expected, code=code, timeout=timeout)
        checks.append(record)
        return record

    def save(phase, **extra):
        report = dict(manifest, status='passed', phase=phase, checks=checks[:], **extra)
        (WORK / (phase + '.json')).write_text(json.dumps(report, indent=2) + '\n')

    run(['lake', '--wfail', '-f', lakefile, 'build',
         'Cryptids.Semantics.ChessFieldSelective', 'chess_goal_audit', 'chess_goal_export'],
        'Build completed successfully', timeout=1800)
    save('build')
    audit = ['prlimit', '--as=17179869184', '--', 'lake', 'env',
             str(ROOT / '.lake/build/bin/chess_goal_audit')]
    run(audit, 'Chess FieldSelective foundation audit passed', timeout=600)
    for flag, expected in [('--negative-control', 'Forbidden axiom: sorryAx'),
                           ('--negative-control-open', 'The open chess conjecture is a dependency'),
                           ('--negative-control-generator', 'Proof generator is a mathematical dependency:')]:
        run(audit + [flag], expected, code=1, timeout=600)
    examples = [
        ('OldCount', 'example : generated.states = 2904623 := by rw [generated_states]; decide +kernel'),
        ('UnpaidPrefix', 'example : generated.states = body.states := by rw [generated_states, body_states]; decide +kernel'),
        ('UnpaidReturns', 'example : body.states = 533341 := by rw [body_states]; decide +kernel'),
        ('BadSaving', 'example : FieldReverse.generated.states - generated.states = 492881 := by rw [FieldReverse.generated_states, generated_states]; decide +kernel'),
        ('MissingTurn', 'example : actions.size = bits.size := by rw [prefix_states, bits_size]; decide +kernel'),
    ]
    for name, source in examples:
        path = WORK / (name + '.lean')
        path.write_text('import Cryptids.Semantics.ChessFieldSelective\n'
                        'open Chess.Optimisation Chess.Optimisation.FieldSelective\n' + source + '\n')
        run(['lake', 'env', 'lean', '-M6144', '-DwarningAsError=true', str(path)],
            'is false', code=1, timeout=300)
    save('contracts')
    run(['prlimit', '--stack=67108864', '--', 'lake', 'env',
         str(ROOT / '.lake/build/bin/chess_goal_export'), str(WORK / 'machine-export.json')],
        'Selective native export passed', timeout=1200)
    save('native')
    run([sys.executable, 'scripts/chess_goal_20261022/fixtures.py'],
        'Selective independent fixtures passed', timeout=1200)
    detail = json.loads((WORK / 'fixtures-detail.json').read_text())
    assert detail['status'] == 'passed'
    assert detail['states'] == 2411743
    assert detail['previous_states'] == 2904623
    assert detail['saved_states'] == 492880
    assert detail['body_states'] == 573802 and detail['initializer_states'] == 1837941
    assert detail['labels_covered'] == 4042
    assert detail['cases'] == 202100
    assert detail['return_states'] == 40461 and detail['return_local_slots'] == 8092
    assert detail['syntax_write_nodes'] == 4050
    assert detail['return_layout_verified'] is True and detail['exact_write_support_verified'] is True
    assert detail['complete_body_rows_verified'] is True
    assert detail['complete_prefix_rows_verified'] is True
    assert detail['complete_full_rows_verified'] is True
    assert detail['complete_body_rows_checked'] == 2 * detail['body_states']
    assert detail['complete_prefix_rows_checked'] == 2 * detail['initializer_states']
    assert detail['complete_full_rows_checked'] == 2 * detail['states']
    assert detail['initializer_verified'] is True and detail['initializer_edges_verified'] is True
    expected_controls = {
        'dispatch', 'store', 'frame', 'initializer', 'initializer_physical_head',
        'undercount', 'packed_offset', 'missing_return', 'duplicate_return', 'return_rank',
        'return_raw_encoding', 'return_offset', 'return_local_target', 'unpaid_return',
        'body_write', 'body_bounce', 'body_return_write', 'body_return_destination',
        'body_missing_return', 'body_write_return_rank', 'body_missing_halt', 'body_order',
        'body_truncation', 'prefix_write', 'prefix_direction', 'prefix_final_turn', 'prefix_truncation'}
    assert len(detail['mutation_controls']) == len(expected_controls)
    assert {c['name'] for c in detail['mutation_controls']} == expected_controls
    assert all(c['passed'] is True and c['rejected'] is True for c in detail['mutation_controls'])
    export = json.loads((WORK / 'machine-export.json').read_text())
    assert export['metadata']['return_states'] == 40461
    assert export['metadata']['return_node_slots'] == 8092
    hashes = {name: runner.sha(WORK / name) for name in
              ['machine-export.json', 'body-rows.jsonl', 'prefix-rows.bin', 'fixtures-detail.json']}
    save('counts', detail=detail, artifact_sha256=hashes)
    run(['lake', '--wfail', '-f', lakefile, 'build', 'Cryptids.Chess.Fixtures',
         'Cryptids.Chess.Evaluation', 'Cryptids.Semantics.ChessFieldReverse',
         'Cryptids.Compilation.FieldBranch.Certificate'],
        'Build completed successfully', timeout=1200)
    for name, expected, args in [
        ('scripts/RunChessM2.lean', 'Rule fixtures passed:', ['--rules']),
        ('scripts/RunChessM3.lean', 'Chess M3 fixtures passed:', []),
        ('scripts/RunChessM4.lean', 'Chess M4 fixtures passed:', []),
        ('scripts/RunChessM5.lean', '16 assertions', []),
        ('scripts/chess_m6/SharedFixtures.lean', 'Shared fixtures passed:', []),
        ('scripts/chess_m7/Fixtures.lean', 'M7 quotient fixtures passed', []),
        ('scripts/chess_openevolve/Fixtures.lean', 'Terminal binary fixtures passed', [])]:
        mode = [] if name == 'scripts/chess_m6/SharedFixtures.lean' else ['--run']
        run(['lake', 'env', 'lean', '-M6144', '-DwarningAsError=true'] + mode + [name] + args,
            expected, timeout=600)
    save('full', detail=detail, artifact_sha256=hashes)
    print('Complete selective chess reduction passed')


def main():
    if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
        raise SystemExit('Remote GitHub Actions execution required')
    parser = argparse.ArgumentParser()
    parser.add_argument('--target', required=True, choices=['generic', 'syntax', 'graph', 'machine', 'full'])
    args = parser.parse_args()
    spec = importlib.util.spec_from_file_location('accepted_runner', ROOT / 'scripts/chess_field_reverse/verify.py')
    runner = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(runner)
    runner.WORK = WORK
    WORK.mkdir(parents=True, exist_ok=True)
    pins = json.loads((ROOT / 'docs/chess/campaign-2026-10-22/baseline-pins.json').read_text())
    for name, digest in pins.items():
        assert runner.sha(ROOT / name) == digest, 'Frozen baseline changed: ' + name
    paths = ['.github/workflows/chess_goal_20261022.yml',
             'docs/chess/campaign-2026-10-22/baseline-pins.json']
    if (ROOT / 'lakefile.chess-goal-20261022.toml').is_file():
        paths.append('lakefile.chess-goal-20261022.toml')
    for glob in ['scripts/chess_goal_20261022/*', 'Cryptids/Compilation/FieldReturns/*.lean',
                 'Cryptids/Optimisation/SelectiveBinary.lean',
                 'Cryptids/Chess/Optimisation/FieldSelective*.lean',
                 'Cryptids/Semantics/ChessFieldSelective.lean']:
        paths.extend(str(p.relative_to(ROOT)) for p in ROOT.glob(glob) if p.is_file())
    manifest = dict(commit=os.environ.get('GITHUB_SHA'), run_id=os.environ.get('GITHUB_RUN_ID'),
                    source_sha256={p: runner.sha(ROOT / p) for p in sorted(set(paths))},
                    frozen_source_sha256=pins)
    (WORK / 'source-manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    targets = {
        'generic': ['Cryptids.Optimisation.SelectiveBinary'],
        'syntax': ['Cryptids.Compilation.FieldReturns.Syntax'],
        'graph': ['Cryptids.Compilation.FieldReturns.Graph'],
        'machine': ['Cryptids.Semantics.ChessFieldSelective'],
    }
    if args.target == 'full':
        full(runner, manifest)
        return
    check = runner.run(['lake', '--wfail', '-f', 'lakefile.chess-field-reverse.toml',
                        'build'] + targets[args.target], 'Build completed successfully', timeout=1800)
    report = dict(manifest, status='passed', target=args.target, checks=[check],
                  scope='Focused strict Lean build; full-machine acceptance is separate')
    (WORK / (args.target + '.json')).write_text(json.dumps(report, indent=2) + '\n')
    print('Chess goal ' + args.target + ' passed')


if __name__ == '__main__':
    main()
