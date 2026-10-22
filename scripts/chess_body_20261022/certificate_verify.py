#!/usr/bin/env python3
"""Remote source-bound orchestration for a bounded quotient-proof experiment."""
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
    spec = importlib.util.spec_from_file_location('accepted_runner', ROOT / 'scripts/chess_field_reverse/verify.py')
    runner = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(runner)
    runner.WORK = WORK
    WORK.mkdir(parents=True, exist_ok=True)
    pin_path = 'docs/chess/campaign-2026-10-22/round-02/baseline-pins.json'
    pins = json.loads((ROOT / pin_path).read_text())
    for name, digest in pins.items():
        assert runner.sha(ROOT / name) == digest, 'Accepted source/evidence changed: ' + name
    paths = ['.github/workflows/chess_body_certificate_20261022.yml', pin_path,
             'lakefile.chess-body-certificate-20261022.toml',
             'scripts/chess_body_20261022/certificate_pilot.py',
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
    checks.append(runner.run([sys.executable, 'scripts/chess_body_20261022/certificate_pilot.py',
                              '--lakefile', lakefile, '--output', str(WORK),
                              '--seconds', '1200', '--memory-gib', '6'],
                             'Bounded body kernel certificate pilot passed', timeout=1260))
    (WORK / 'verification.json').write_text(json.dumps(dict(manifest, status='passed', checks=checks,
        scope='Bounded concrete certificate pilot only; no complete quotient proof or accepted machine'),
        indent=2) + '\n')
    print('Bounded quotient certificate verification passed')


if __name__ == '__main__':
    main()
