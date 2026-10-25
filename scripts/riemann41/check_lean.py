#!/usr/bin/env python3
"""Audit only built roots; retain failures and never promote a conditional theorem."""
import os
if os.environ.get('RH41_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote-only Lean audit')

import hashlib
import json
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / '.lake/riemann41'
PREFIX = ['lake', '-f', 'lakefile.riemann41.toml', 'env', 'lean', '-M6144',
          '-DwarningAsError=true']


def execute(label, args):
    result = subprocess.run(PREFIX + args, cwd=ROOT, capture_output=True, text=True)
    text = result.stdout + result.stderr
    (OUT / (label + '.log')).write_text(text)
    return dict(label=label, argv=PREFIX + args, exit=result.returncode,
                output_sha256=hashlib.sha256(text.encode()).hexdigest(), output=text)


def main():
    level = 'none'
    for module, name in [('GuardLiteral', 'literal'), ('GuardCore', 'core'), ('GuardBoot', 'boot')]:
        if (ROOT / f'.lake/build/lib/lean/{module}.olean').exists():
            level = name
    commands = []
    if level != 'none':
        audit = execute('full-private-audit',
                        ['--run', 'scripts/riemann41/ReplayAudit.lean', level])
        commands.append(audit)
        assert audit['exit'] == 0 and 'RH41_FULL_PRIVATE_AUDIT_PASSED' in audit['output']
        forbidden = execute('forbidden-axiom-control',
                            ['--run', 'scripts/riemann41/ReplayAudit.lean', level,
                             '--negative-control'])
        commands.append(forbidden)
        assert forbidden['exit'] != 0 and 'Forbidden axiom: sorryAx' in forbidden['output']
    invalid = OUT / 'InvalidControl.lean'
    invalid.write_text('example : False := by\n  exact True.intro\n')
    kernel = execute('kernel-rejection-control', [str(invalid)])
    commands.append(kernel)
    assert kernel['exit'] != 0 and 'error:' in kernel['output']
    if level != 'none':
        modules = {'literal': 'GuardLiteral', 'core': 'GuardCore', 'boot': 'GuardBoot'}
        roots = ['Rh41.all_cells', 'Rh41.incoming_sources', 'Rh41.selected_effect']
        if level in ['core', 'boot']:
            roots += ['Rh41.step_avoids', 'Rh41.separator_step',
                      'Rh41.isolated_overwrite_of_avoidance']
        if level == 'boot':
            roots += ['Rh41.boot_prefix_safe', 'Rh41.boot_endpoint']
        prints = OUT / 'PrintAxioms.lean'
        prints.write_text('import ' + modules[level] + '\n' +
                          ''.join('#print axioms ' + root + '\n' for root in roots))
        axioms = execute('print-axioms', [str(prints)])
        commands.append(axioms)
        assert axioms['exit'] == 0
    for record in commands:
        del record['output']
    result = dict(status='built-local-roots-audited' if level != 'none' else 'no-built-roots',
                  checked_level=level, commands=commands, global_avoidance_proved=False,
                  isolation_is_conditional=level in ['core', 'boot'],
                  source_hashes={p.name: hashlib.sha256(p.read_bytes()).hexdigest()
                                 for p in (ROOT / 'scripts/riemann41').glob('*.lean')})
    (OUT / 'lean-verification.json').write_text(json.dumps(result, indent=2) + '\n')
    print('RH41_AVAILABLE_PROOF_ROOTS_AUDITED', level)


if __name__ == '__main__':
    main()
