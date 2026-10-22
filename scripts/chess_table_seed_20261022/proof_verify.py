#!/usr/bin/env python3
"""Source-bound, remote-only focused proofs; never full-machine acceptance."""
import argparse
import importlib.util
import json
import os
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / '.lake/chess-table-proof-20261022'
TARGETS = {
    'primitives': ['Cryptids.Compilation.TableSeed.Format', 'Cryptids.Compilation.TableSeed.Geometry',
                   'Cryptids.Compilation.TableSeed.Scan'],
    'format': 'Cryptids.Compilation.TableSeed.Format',
    'controller': 'Cryptids.Compilation.TableSeed.Controller',
    'geometry': 'Cryptids.Compilation.TableSeed.Geometry',
    'blocks': 'Cryptids.Compilation.TableSeed.Blocks',
    'scan': 'Cryptids.Compilation.TableSeed.Scan',
    'transducer': 'Cryptids.Compilation.TableSeed.Transducer',
    'correct': 'Cryptids.Compilation.TableSeed.Correct',
    'codec': 'Cryptids.Compilation.TableSeed.ChessCodec',
    'machine': 'Cryptids.Semantics.ChessTableSeed',
}


def main():
    if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
        raise SystemExit('Remote GitHub Actions execution required')
    parser = argparse.ArgumentParser()
    parser.add_argument('--target', choices=TARGETS, required=True)
    args = parser.parse_args()
    spec = importlib.util.spec_from_file_location(
        'accepted_runner', ROOT / 'scripts/chess_field_reverse/verify.py')
    runner = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(runner)
    runner.WORK = WORK
    WORK.mkdir(parents=True, exist_ok=True)
    pin_path = 'docs/chess/campaign-2026-10-22/accepted-998176-pins.json'
    pins = json.loads((ROOT / pin_path).read_text())
    for name, digest in pins.items():
        assert runner.sha(ROOT / name) == digest, 'Accepted bytes changed: ' + name
    paths = [pin_path, '.github/workflows/chess_table_proof_20261022.yml',
             'lakefile.chess-table-proof-20261022.toml',
             'docs/chess/campaign-2026-10-22/round-04/evidence/controller-01/unpacked/controller.json']
    for directory in ['scripts/chess_table_seed_20261022', 'Cryptids/Compilation/TableSeed']:
        paths.extend(str(p.relative_to(ROOT)) for p in (ROOT / directory).glob('*')
                     if p.is_file() and p.suffix in ('.py', '.lean'))
    for name in ['Cryptids/Chess/Optimisation/FieldTableSeed.lean',
                 'Cryptids/Semantics/ChessTableSeed.lean']:
        if (ROOT / name).is_file():
            paths.append(name)
    manifest = dict(commit=os.environ.get('GITHUB_SHA'), run_id=os.environ.get('GITHUB_RUN_ID'),
                    workflow_commit=os.environ.get('CHESS_WORKFLOW_SHA', os.environ.get('GITHUB_SHA')),
                    source_sha256={p: runner.sha(ROOT / p) for p in sorted(set(paths))},
                    frozen_source_sha256=pins)
    (WORK / 'source-manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    targets = TARGETS[args.target]
    if isinstance(targets, str):
        targets = [targets]
    if args.target == 'controller':
        targets = targets + ['chess_table_controller_export']
    command = ['lake', '--wfail', '-f', 'lakefile.chess-table-proof-20261022.toml',
               'build'] + targets
    checks = [runner.run(command, 'Build completed successfully', timeout=1200)]
    detail = None
    if args.target == 'controller':
        checks.append(runner.run(['lake', 'env', str(ROOT / '.lake/build/bin/chess_table_controller_export'),
                                  str(WORK / 'controller-lean.json')],
                                 'Table seed actual controller export passed', timeout=300))
        checks.append(runner.run([sys.executable, 'scripts/chess_table_seed_20261022/controller_compare.py'],
                                 'Table seed actual controller comparison passed', timeout=300))
        detail = json.loads((WORK / 'controller-compare.json').read_text())
        assert detail['status'] == 'passed' and detail['complete_row_equality'] is True
        assert detail['universal_proof'] is False and detail['new_accepted_machine'] is False
    report = dict(manifest, status='passed', target=args.target, checks=checks, detail=detail,
                  scope='Focused strict named Lean build only; universal/full-machine gates remain separate',
                  new_accepted_machine=False)
    (WORK / (args.target + '.json')).write_text(json.dumps(report, indent=2) + '\n')
    print('Structured decoder proof target passed')


if __name__ == '__main__':
    main()
