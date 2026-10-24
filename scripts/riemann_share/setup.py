#!/usr/bin/env python3
"""Remote toolchain wrapper: serialize real Lean processes and fetch pinned cache."""
import os

if os.environ.get('RHSHARE_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote-only setup')

import hashlib
import json
from pathlib import Path
import shlex
import subprocess

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / '.lake/riemann-share'


def main():
    lean = Path(subprocess.check_output(['elan', 'which', 'lean'], text=True).strip())
    real = lean.with_name('lean.rh-share-real')
    assert lean.is_file() and not real.exists()
    lock = Path(os.environ['RUNNER_TEMP']) / 'rh-share-lean.lock'
    invocation_log = OUT / 'lean-invocations.txt'
    original_sha = hashlib.sha256(lean.read_bytes()).hexdigest()
    lean.rename(real)
    lean.write_text('#!/usr/bin/env bash\nset -euo pipefail\n'
                    f'exec 9>{shlex.quote(str(lock))}\n'
                    'flock -x 9\n'
                    f'printf "invocation\\n" >> {shlex.quote(str(invocation_log))}\n'
                    f'exec {shlex.quote(str(real))} -M6144 "$@"\n')
    lean.chmod(0o755)
    details = dict(lean_real=str(real), original_binary_sha256=original_sha,
                   serialized_by=str(lock), allocator_mib=6144,
                   version=subprocess.check_output(['lean', '--version'], text=True).strip())
    (OUT / 'toolchain.json').write_text(json.dumps(details, indent=2) + '\n')
    for name in ['ShareDefinitions.lean', 'ShareCertificate.lean', 'ReplayAudit.lean']:
        lines = (ROOT / 'scripts/riemann_share' / name).read_text().splitlines()
        assert all(len(line) <= 100 for line in lines), name
        if name != 'ReplayAudit.lean':
            assert all('sorry' not in line for line in lines), name
    subprocess.run(['lake', '-f', 'lakefile.riemann-share.toml', 'exe', 'cache', 'get', 'Mathlib'],
                   check=True, cwd=ROOT)


if __name__ == '__main__':
    main()
