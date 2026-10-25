#!/usr/bin/env python3
"""Audit finite theorem closure and exercise explicit rejection controls remotely."""
import os

if os.environ.get('RHSHARE_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote Lean checks only')

import hashlib
import json
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / os.environ.get('RHSHARE_OUTPUT_DIR', '.lake/riemann-share')
PREFIX = ['lake', '-f', 'lakefile.riemann-share.toml', 'env', 'lean', '-M6144',
          '-DwarningAsError=true']


def execute(label, args):
    result = subprocess.run(PREFIX + args, cwd=ROOT, capture_output=True, text=True)
    data = result.stdout + result.stderr
    (OUT / (label + '.log')).write_text(data)
    return dict(label=label, argv=PREFIX + args, exit=result.returncode,
                output_sha256=hashlib.sha256(data.encode()).hexdigest(), output=data)


def main():
    subprocess.run(['git', 'diff', '--exit-code',
                    '6c28d8524fa008c6fb5aadb759df74a55ce96423', '--',
                    'Cryptids', 'Cryptids.lean', 'Challenge.lean', 'artifacts',
                    'comparator', 'lean-toolchain', 'lakefile.toml',
                    'lake-manifest.json', 'verify.py'], cwd=ROOT, check=True)
    audit = execute('full-private-audit', ['--run', 'scripts/riemann_share/ReplayAudit.lean'])
    assert audit['exit'] == 0 and 'RHSHARE_FULL_PRIVATE_AUDIT_PASSED' in audit['output']
    forbidden = execute('forbidden-axiom-control',
                        ['--run', 'scripts/riemann_share/ReplayAudit.lean', '--negative-control'])
    assert forbidden['exit'] != 0 and 'Forbidden axiom: sorryAx' in forbidden['output']
    invalid = OUT / 'InvalidControl.lean'
    invalid.write_text('example : False := by\n  exact True.intro\n')
    kernel = execute('kernel-rejection-control', [str(invalid)])
    assert kernel['exit'] != 0 and ('error:' in kernel['output'])
    print_file = OUT / 'PrintAxioms.lean'
    print_file.write_text('import ShareCertificate\n'
                          '#print axioms RhShare.all_aliases_fail\n')
    axioms = execute('print-axioms', [str(print_file)])
    assert axioms['exit'] == 0
    records = [audit, forbidden, kernel, axioms]
    for record in records:
        del record['output']
    result = dict(status='lean-family-counterexamples-checked', commands=records,
                  target='RhShare.all_aliases_fail',
                  source_sha256=hashlib.sha256(
                      (ROOT / 'scripts/riemann_share/ShareCertificate.lean').read_bytes()).hexdigest(),
                  new_certified_rh_reduction=False)
    (OUT / 'lean-verification.json').write_text(json.dumps(result, indent=2) + '\n')
    print('RHSHARE_FAMILY_COUNTEREXAMPLES_LEAN_VERIFIED')


if __name__ == '__main__':
    main()
