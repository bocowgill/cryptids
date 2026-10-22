#!/usr/bin/env python3
"""Source-bound remote finite packet census, never a complete TM certificate."""
import importlib.util
import json
import os
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / '.lake/chess-table-seed-20261022'


def main():
    if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
        raise SystemExit('Remote GitHub Actions execution required')
    spec = importlib.util.spec_from_file_location('accepted_runner', ROOT / 'scripts/chess_field_reverse/verify.py')
    runner = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(runner)
    runner.WORK = WORK
    WORK.mkdir(parents=True, exist_ok=True)
    pin_path = 'docs/chess/campaign-2026-10-22/accepted-998176-pins.json'
    pins = json.loads((ROOT / pin_path).read_text())
    for name, digest in pins.items():
        assert runner.sha(ROOT / name) == digest, 'Accepted source/evidence changed: ' + name
    paths = [pin_path, '.github/workflows/chess_table_seed_20261022.yml',
             'scripts/chess_table_seed_20261022/verify.py',
             'scripts/chess_table_seed_20261022/pilot.py',
             'docs/chess/campaign-2026-10-22/round-04/SEED-ARCHITECTURE.md']
    manifest = dict(commit=os.environ.get('GITHUB_SHA'), run_id=os.environ.get('GITHUB_RUN_ID'),
                    workflow_commit=os.environ.get('GITHUB_SHA'),
                    source_sha256={p: runner.sha(ROOT / p) for p in paths},
                    frozen_source_sha256=pins)
    (WORK / 'source-manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    check = runner.run([sys.executable, 'scripts/chess_table_seed_20261022/pilot.py',
                        '--output', str(WORK), '--seconds', '600', '--memory-gib', '4'],
                       'CHESS_TABLE_SEED_PACKET_CENSUS_PASSED', timeout=630)
    (WORK / 'verification.json').write_text(json.dumps(dict(manifest, status='passed',
        checks=[check], scope='Finite packet census only; decoder allocation and universal proof absent'),
        indent=2) + '\n')
    print('Bounded structured packet verification passed')


if __name__ == '__main__':
    main()
