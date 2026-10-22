#!/usr/bin/env python3
"""Remote-only, source-bound checks for the compressed-seed research round."""
import argparse
import importlib.util
import json
import os
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / '.lake/chess-seed-20261022'


def main():
    if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
        raise SystemExit('Remote GitHub Actions execution required')
    parser = argparse.ArgumentParser()
    parser.add_argument('--target', required=True, choices=['pilot', 'link', 'format', 'controller', 'blocks', 'scan'])
    args = parser.parse_args()
    spec = importlib.util.spec_from_file_location('accepted_runner', ROOT / 'scripts/chess_field_reverse/verify.py')
    runner = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(runner)
    runner.WORK = WORK
    WORK.mkdir(parents=True, exist_ok=True)
    pin_path = 'docs/chess/campaign-2026-10-22/round-02/baseline-pins.json'
    pins = json.loads((ROOT / pin_path).read_text())
    for name, digest in pins.items():
        assert runner.sha(ROOT / name) == digest, 'Accepted source/evidence changed: ' + name
    paths = ['.github/workflows/chess_seed_20261022.yml', pin_path,
             'lakefile.chess-seed-20261022.toml', 'Cryptids/Compilation/SeedLink.lean']
    paths.extend(str(p.relative_to(ROOT)) for p in (ROOT / 'scripts/chess_seed_20261022').rglob('*')
                 if p.is_file() and p.suffix in ('.py', '.lean'))
    paths.extend(str(p.relative_to(ROOT)) for p in (ROOT / 'Cryptids/Compilation/Seed').glob('*.lean'))
    manifest = dict(commit=os.environ.get('GITHUB_SHA'), run_id=os.environ.get('GITHUB_RUN_ID'),
                    workflow_commit=os.environ.get('CHESS_WORKFLOW_SHA', os.environ.get('GITHUB_SHA')),
                    source_sha256={p: runner.sha(ROOT / p) for p in sorted(set(paths))},
                    frozen_source_sha256=pins)
    (WORK / 'source-manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    checks = []
    if args.target == 'pilot':
        check = runner.run([sys.executable, 'scripts/chess_seed_20261022/pilot.py'],
                           'Three-bit seed pilot passed', timeout=900)
        summary = json.loads((WORK / 'pilot-summary.json').read_text())
        assert summary['status'] == 'FINITE_UNVERIFIED_PILOT' and summary['passed'] is True
        report_name = 'pilot-run.json'
        scope = 'Finite controller pilot only; universal Lean proof and full acceptance remain open'
        checks.append(check)
    elif args.target == 'controller':
        checks.append(runner.run(['lake', '--wfail', '-f', 'lakefile.chess-seed-20261022.toml',
                                  'build', 'Cryptids.Compilation.Seed.Controller',
                                  'chess_seed_controller_export'],
                                 'Build completed successfully', timeout=1800))
        checks.append(runner.run(['lake', 'env', str(ROOT / '.lake/build/bin/chess_seed_controller_export'),
                                  str(WORK / 'controller-lean.json')],
                                 'Seed actual controller export passed', timeout=300))
        checks.append(runner.run([sys.executable, 'scripts/chess_seed_20261022/controller_compare.py'],
                                 'Seed actual controller comparison passed', timeout=900))
        summary = json.loads((WORK / 'controller-compare.json').read_text())
        assert summary['status'] == 'passed' and summary['complete_row_equality'] is True
        report_name = 'controller.json'
        scope = 'Exact Lean controller definition and finite regression evidence; universal expansion remains open'
    else:
        target = {'link': 'Cryptids.Compilation.SeedLink',
                  'format': 'Cryptids.Compilation.Seed.Format',
                  'blocks': 'Cryptids.Compilation.Seed.Blocks',
                  'scan': 'Cryptids.Compilation.Seed.Scan'}[args.target]
        check = runner.run(['lake', '--wfail', '-f', 'lakefile.chess-seed-20261022.toml',
                            'build', target],
                           'Build completed successfully', timeout=1800)
        summary = None
        report_name = args.target + '.json'
        scope = 'Focused strict Lean build; complete expander and full machine acceptance are separate'
        checks.append(check)
    report = dict(manifest, status='passed', target=args.target, checks=checks,
                  scope=scope, detail=summary)
    (WORK / report_name).write_text(json.dumps(report, indent=2) + '\n')
    print('Chess seed ' + args.target + ' passed')


if __name__ == '__main__':
    main()
