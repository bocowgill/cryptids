#!/usr/bin/env python3
"""Remote source-bound orchestration for a bounded quotient-proof experiment."""
import argparse
import importlib.util
import json
import os
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / '.lake/chess-body-certificate-20261022'


def main():
    if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
        raise SystemExit('Remote GitHub Actions execution required')
    parser = argparse.ArgumentParser()
    parser.add_argument('--mode', choices=['smoke', 'full'], default='smoke')
    args = parser.parse_args()
    spec = importlib.util.spec_from_file_location('accepted_runner', ROOT / 'scripts/chess_field_reverse/verify.py')
    runner = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(runner)
    runner.WORK = WORK
    WORK.mkdir(parents=True, exist_ok=True)
    pin_path = 'docs/chess/campaign-2026-10-22/accepted-769344-pins.json'
    pins = json.loads((ROOT / pin_path).read_text())
    for name, digest in pins.items():
        assert runner.sha(ROOT / name) == digest, 'Accepted source/evidence changed: ' + name
    paths = ['.github/workflows/chess_body_certificate_20261022.yml', pin_path,
             'lakefile.chess-body-certificate-20261022.toml',
             'scripts/chess_body_20261022/certificate_pilot.py',
             'scripts/chess_body_20261022/row_witness_pilot.py',
             'scripts/chess_body_20261022/actual_row_pilot.py',
             'scripts/chess_body_20261022/certificate_verify.py']
    manifest = dict(commit=os.environ.get('GITHUB_SHA'), run_id=os.environ.get('GITHUB_RUN_ID'),
                    workflow_commit=os.environ.get('GITHUB_SHA'),
                    source_sha256={p: runner.sha(ROOT / p) for p in paths},
                    frozen_source_sha256=pins)
    (WORK / 'source-manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    lakefile = 'lakefile.chess-body-certificate-20261022.toml'
    checks = [runner.run(['lake', '--wfail', '-f', lakefile, 'build',
                         'Cryptids.Chess.Optimisation.FieldSelective',
                         'Cryptids.Compilation.BalancedTable',
                         'Cryptids.Compilation.LocalCertificate'],
                        'Build completed successfully', timeout=900)]
    smoke = args.mode == 'smoke'
    seconds = '300' if smoke else '1200'
    expected = ('Body certificate compiled-audit smoke passed' if smoke else
                'Bounded body kernel certificate pilot passed')
    checks.append(runner.run([sys.executable, 'scripts/chess_body_20261022/certificate_pilot.py',
                              '--lakefile', lakefile, '--output', str(WORK),
                              '--seconds', seconds, '--memory-gib', '6'] +
                             (['--smoke-only'] if smoke else []), expected,
                             timeout=int(seconds) + 60))
    detail = json.loads((WORK / 'certificate-summary.json').read_text())
    assert detail['status'] == ('smoke_passed' if smoke else 'passed')
    assert detail['full_quotient_certified'] is False
    (WORK / 'verification.json').write_text(json.dumps(dict(manifest, status='passed', checks=checks,
        mode=args.mode, detail=detail,
        scope='Bounded concrete certificate pilot only; no complete quotient proof or accepted machine'),
        indent=2) + '\n')
    print('Bounded quotient certificate verification passed')


if __name__ == '__main__':
    main()
