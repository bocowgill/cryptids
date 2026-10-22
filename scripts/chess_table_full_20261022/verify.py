#!/usr/bin/env python3
"""Source-bound remote verification of the complete two-stage chess initializer."""
import argparse
import importlib.util
import json
import os
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / '.lake/chess-table-full-20261022'


def main():
    if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
        raise SystemExit('Remote GitHub Actions execution required')
    parser = argparse.ArgumentParser()
    parser.add_argument('--target', choices=['machine', 'full'], required=True)
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
    paths = [pin_path, '.github/workflows/chess_table_full_20261022.yml',
             'lakefile.chess-table-full-20261022.toml',
             'Cryptids/Chess/Optimisation/FieldTableSeed.lean',
             'Cryptids/Semantics/ChessTableSeed.lean',
             'docs/chess/campaign-2026-10-22/round-04/NATIVE-CONTRACT.md']
    for directory in ['scripts/chess_table_full_20261022', 'scripts/chess_table_seed_20261022',
                      'Cryptids/Compilation/TableSeed']:
        paths.extend(str(p.relative_to(ROOT)) for p in (ROOT / directory).glob('*')
                     if p.is_file() and p.suffix in ('.py', '.lean')
                     and p.name != 'check_saved_evidence.py')
    # Bind independent experimental oracle bytes as well as all accepted pins.
    oracle_roots = ['round-04/evidence/packet-02/unpacked',
                    'round-04/evidence/controller-01/unpacked']
    for relative in oracle_roots:
        folder = ROOT / 'docs/chess/campaign-2026-10-22' / relative
        if folder.exists():
            paths.extend(str(p.relative_to(ROOT)) for p in folder.rglob('*') if p.is_file())
    manifest = dict(commit=os.environ.get('GITHUB_SHA'), run_id=os.environ.get('GITHUB_RUN_ID'),
                    workflow_commit=os.environ.get('CHESS_WORKFLOW_SHA', os.environ.get('GITHUB_SHA')),
                    source_sha256={p: runner.sha(ROOT / p) for p in sorted(set(paths))},
                    frozen_source_sha256=pins)
    (WORK / 'source-manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    if args.target == 'full':
        import full
        full.verify(runner, manifest)
        return
    command = ['lake', '--wfail', '-f', 'lakefile.chess-table-full-20261022.toml',
               'build', 'Cryptids.Semantics.ChessTableSeed']
    checks = [runner.run(command, 'Build completed successfully', timeout=1200)]
    report = dict(manifest, status='passed', target='machine', checks=checks,
                  scope='Strict complete-machine theorem build; full acceptance gates remain separate',
                  new_accepted_machine=False)
    (WORK / 'machine.json').write_text(json.dumps(report, indent=2) + '\n')
    print('Table seed complete-machine proof passed')


if __name__ == '__main__':
    main()
