#!/usr/bin/env python3
"""Bind the exact prior witnesses and copy their unchanged Lean source remotely."""
import os
if os.environ.get('RHSHARE_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote-only retained-witness verification')

import hashlib
import json
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / os.environ['RHSHARE_OUTPUT_DIR']
PRIOR = ROOT / 'research/riemann-reduction/pilot-decoder-sharing/evidence/unpacked'
BASE = '6c28d8524fa008c6fb5aadb759df74a55ce96423'
PINS = {
    'ShareCertificate.lean': '68d218019755897c2fcc67f3ab3594fd4c279ac35240668766e9f1c1791d466e',
    'family.json': 'ee7ec59f11a59c92815a7800d7964c4aa653a31b2f4fb573eb345a268d35ada0',
    'aliases.jsonl': '8d4e45fc739385345d9990f81659b9f8d1f0e417a45d8c7a8eaa3d0e62843333',
    'screen.json': '5dafe5aff759fdc4b1de979735b0b4fdfc717a7b8da321dba6e9026da92d51ed',
    'independent-replay.json': 'f759eaf099f7a8fc9007c07d77f67849e764bdf0406ac56336844f51641af671',
    'tapes.json': '72020b9ff65f84d71e89e3dcf2e34c4a33027fbeb5eb689394fa8e3eaef24f53',
}


def sha(data):
    return hashlib.sha256(data).hexdigest()


def main():
    subprocess.run(['git', 'diff', '--exit-code', BASE, '--', 'Cryptids', 'Cryptids.lean',
                    'Challenge.lean', 'artifacts', 'comparator', 'lean-toolchain',
                    'lakefile.toml', 'lake-manifest.json', 'verify.py'], check=True)
    for name, expected in PINS.items():
        data = (PRIOR / name).read_bytes()
        assert sha(data) == expected, name
        # Keep the prior independent replay separate from this job's receipt.
        destination = 'prior-independent-replay.json' if name == 'independent-replay.json' else name
        (OUT / destination).write_bytes(data)
    (ROOT / 'scripts/riemann_share/ShareCertificate.lean').write_bytes(
        (PRIOR / 'ShareCertificate.lean').read_bytes())
    definitions = 'scripts/riemann_share/ShareDefinitions.lean'
    previous = subprocess.check_output(['git', 'show',
        '8f3bda3344561fcb2d81987f8dfc48eeac1413ef:' + definitions], text=True)
    repair = ('/-- Use the existing computable comparisons for the named endpoint predicate. -/\n'
              'instance failureDecidable (i : Fin 30) (c : ControlWord) : Decidable (failure i c) :=\n'
              '  inferInstanceAs (Decidable\n'
              '    ((Parser.walkInternal 15 (Control.walked c)).isSome = true ∧\n'
              '      observed i c ≠ expected i c))\n\n')
    current = (ROOT / definitions).read_text()
    assert current.count(repair) == 1 and current.replace(repair, '', 1) == previous
    paths = [definitions, 'lakefile.riemann-share.toml', '.github/workflows/riemann_share.yml',
             'scripts/riemann_share/verify_driver.py', 'scripts/riemann_share/retained.py',
             'scripts/riemann_share/verify-retained.mjs', 'scripts/riemann_share/check_lean.py',
             'scripts/riemann_share/setup.py', 'scripts/riemann_share/ReplayAudit.lean',
             'scripts/riemann_share/launch-verify02.json']
    result = dict(status='retained-witnesses-pinned', baseline=BASE,
                  producer=os.environ['GITHUB_SHA'], prior_producer=
                  '8f3bda3344561fcb2d81987f8dfc48eeac1413ef',
                  retained_sha256=PINS, exact_decidable_only_repair=True,
                  witness_search_executed=False, exported_candidates=0,
                  hashes={p: sha((ROOT / p).read_bytes()) for p in paths})
    (OUT / 'provenance.json').write_text(json.dumps(result, indent=2) + '\n')
    print('EXACT_RETAINED_WITNESSES_AND_DECIDABLE_ONLY_REPAIR_PINNED')


if __name__ == '__main__':
    main()
