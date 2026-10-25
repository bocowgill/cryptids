#!/usr/bin/env python3
"""Serialize every real Lean invocation, including pinned dependency/cache builds."""
import os
if os.environ.get('RH41_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote-only setup')

import hashlib
import json
from pathlib import Path
import shlex
import subprocess

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / '.lake/riemann41'


def main():
    lean = Path(subprocess.check_output(['elan', 'which', 'lean'], text=True).strip())
    real = lean.with_name('lean.rh41-real')
    assert lean.is_file() and not real.exists()
    lock = Path(os.environ['RUNNER_TEMP']) / 'rh41-lean.lock'
    invocation_log = OUT / 'lean-invocations.txt'
    original_sha = hashlib.sha256(lean.read_bytes()).hexdigest()
    lean.rename(real)
    lean.write_text('#!/usr/bin/env bash\nset -euo pipefail\n'
                    f'exec 9>{shlex.quote(str(lock))}\nflock -x 9\n'
                    f'printf "invocation\\n" >> {shlex.quote(str(invocation_log))}\n'
                    f'exec {shlex.quote(str(real))} -M6144 "$@"\n')
    lean.chmod(0o755)
    version = subprocess.check_output(['lean', '--version'], text=True).strip()
    assert '4.35.0-rc4' in version and 'c29b6dda4f7c' in version, version
    manifest = json.loads((ROOT / 'lake-manifest.json').read_text())
    assert next(p['rev'] for p in manifest['packages'] if p['name'] == 'mathlib') == (
        '1f414401f69059aa7eead47b53ee40bd38455eeb')
    details = dict(lean_real=str(real), original_binary_sha256=original_sha,
                   serialized_by=str(lock), allocator_mib=6144, version=version)
    (OUT / 'toolchain.json').write_text(json.dumps(details, indent=2) + '\n')
    for module in ['GuardLiteral', 'GuardCore', 'GuardBoot', 'AssemblyProbe']:
        assert not (ROOT / f'.lake/build/lib/lean/{module}.olean').exists(), module
    for path in (ROOT / 'scripts/riemann41').glob('*.lean'):
        lines = path.read_text().splitlines()
        assert all(len(line) <= 100 for line in lines), path
        if path.name != 'ReplayAudit.lean':
            assert all('sorry' not in line for line in lines), path
    subprocess.run(['lake', '-f', 'lakefile.riemann41.toml', 'exe', 'cache', 'get', 'Mathlib'],
                   check=True, cwd=ROOT)


if __name__ == '__main__':
    main()
