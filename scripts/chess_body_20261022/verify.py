#!/usr/bin/env python3
"""Remote-only bounded measurement of exact full-body state sharing."""
import importlib.util
import json
import os
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / '.lake/chess-body-20261022'


def main():
    if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
        raise SystemExit('Remote GitHub Actions execution required')
    spec = importlib.util.spec_from_file_location('accepted_runner', ROOT / 'scripts/chess_field_reverse/verify.py')
    runner = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(runner)
    runner.WORK = WORK
    WORK.mkdir(parents=True, exist_ok=True)
    pin_path = 'docs/chess/campaign-2026-10-22/round-02/baseline-pins.json'
    pins = json.loads((ROOT / pin_path).read_text())
    for name, digest in pins.items():
        assert runner.sha(ROOT / name) == digest, 'Accepted source/evidence changed: ' + name
    paths = ['.github/workflows/chess_body_20261022.yml', pin_path,
             'scripts/chess_body_20261022/pilot.py', 'scripts/chess_body_20261022/verify.py']
    manifest = dict(commit=os.environ.get('GITHUB_SHA'), run_id=os.environ.get('GITHUB_RUN_ID'),
                    workflow_commit=os.environ.get('GITHUB_SHA'),
                    source_sha256={p: runner.sha(ROOT / p) for p in paths},
                    frozen_source_sha256=pins)
    (WORK / 'source-manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    check = runner.run([sys.executable, 'scripts/chess_body_20261022/pilot.py',
                        '--output', str(WORK), '--seconds', '600', '--memory-gib', '6'],
                       'Whole-body exact quotient pilot passed', timeout=660)
    summary = json.loads((WORK / 'pilot-summary.json').read_text())
    report = dict(manifest, status='passed', checks=[check], detail=summary,
                  scope='Finite exact quotient measurement only; no Lean quotient or accepted full machine')
    (WORK / 'pilot-run.json').write_text(json.dumps(report, indent=2) + '\n')
    print('Bounded whole-body pilot verification passed')


if __name__ == '__main__':
    main()
