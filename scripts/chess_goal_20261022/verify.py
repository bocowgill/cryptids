#!/usr/bin/env python3
"""Focused remote proof checks for the dated compression campaign."""
import argparse
import importlib.util
import json
import os
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / '.lake/chess-goal-20261022'


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
        raise SystemExit('Full acceptance runner not implemented; no certification claimed')
    check = runner.run(['lake', '--wfail', '-f', 'lakefile.chess-field-reverse.toml',
                        'build'] + targets[args.target], 'Build completed successfully', timeout=1800)
    report = dict(manifest, status='passed', target=args.target, checks=[check],
                  scope='Focused strict Lean build; full-machine acceptance is separate')
    (WORK / (args.target + '.json')).write_text(json.dumps(report, indent=2) + '\n')
    print('Chess goal ' + args.target + ' passed')


if __name__ == '__main__':
    main()
