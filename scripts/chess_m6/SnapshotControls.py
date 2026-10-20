#!/usr/bin/env python3
"""Kernel-building semantic mutations of the actual independent M6 target."""
from pathlib import Path
import hashlib
import json
import os
import subprocess

ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / '.lake/chess-m6-check/target-controls'
ENV = dict(os.environ, ELAN_NO_UPDATE_CHECK='1')


def check(test, message):
    if not test:
        raise RuntimeError(message)


def run(label, argv, expected, marker=''):
    result = subprocess.run(argv, cwd=ROOT, env=ENV, stdout=subprocess.PIPE,
                            stderr=subprocess.STDOUT, text=True, timeout=2400)
    (WORK / (label + '.log')).write_text(result.stdout)
    check(result.returncode == expected and marker in result.stdout,
          f'{label}: wrong result {result.returncode}\n{result.stdout[-5000:]}')
    check('warning:' not in result.stdout, f'{label}: unexpected warning')
    print(label + ' passed', flush=True)
    return {'label': label, 'argv': argv, 'exit': result.returncode,
            'expected_marker': marker, 'output_sha256': hashlib.sha256(result.stdout.encode()).hexdigest()}


def changed_declaration(source, name, expression):
    # Only extra export tooling is changed. The kernel checks all resulting target declarations.
    wrapper = '''
private def changedForControl (decl : Declaration) (forceExpose := false) : CoreM Unit := do
  let decl := match decl with
    | .defnDecl value =>
        if value.name == NAME then
          .defnDecl {value with value := CHANGE}
        else decl
    | _ => decl
  Lean.addDecl decl forceExpose

'''.replace('NAME', '`' + name).replace('CHANGE', expression)
    marker = 'namespace M6SnapshotConstructorData\nmeta section\n'
    check(source.count(marker) == 1, 'Snapshot constructor namespace changed')
    calls = source.count('Lean.addDecl ')
    check(calls > 0, 'No checked declaration replay calls found')
    mutated = source.replace('Lean.addDecl ', 'changedForControl ')
    return mutated.replace(marker, marker + wrapper)


def main():
    WORK.mkdir(parents=True, exist_ok=True)
    path = ROOT / 'Cryptids/ChessM6Challenge.lean'
    source = path.read_text()
    original_hash = hashlib.sha256(path.read_bytes()).hexdigest()
    metadata = json.loads((ROOT / 'artifacts/chess_baseline/challenge.json').read_text())
    names = set(metadata['copied_names'])
    targets = ['ConjectureMachines.Semantics.Chess.statement',
               'Chess.Compilation.Templates.writeDataChunk0000', 'Chess.initialPosition']
    check(set(targets) <= names, 'Actual mutation target missing from exact closure')
    replace_nat = lambda before, after: (
        'value.value.replace fun e => match e with '
        f'| .lit (.natVal {before}) => some (.lit (.natVal {after})) | _ => none')
    cases = [
        ('M6BadProposition', changed_declaration(source, targets[0], 'mkConst `True'),
         'Compiled declaration mismatch: ConjectureMachines.Semantics.Chess.statement'),
        ('M6BadTransition', changed_declaration(source, targets[1], replace_nat(277, 278)),
         'Compiled declaration mismatch: Chess.Compilation.Templates.writeDataChunk0000'),
        ('M6BadFrozenInitial', changed_declaration(source, targets[2], replace_nat(0, 1)),
         'Compiled declaration mismatch: Chess.initialPosition'),
        ('M6BadReferenceBridge', source.replace('"M6SnapshotReferenceGoals"', '"M6WrongReferenceGoals"'),
         'Unexpected standalone reference-goal bridge'),
    ]
    results = []
    for name, changed, rejection in cases:
        check(changed != source, 'Mutation did not change source: ' + name)
        mutant = WORK / (name + '.lean')
        mutant.write_text(changed)
        results.append(run(name + '-kernel-build',
            ['lake', 'env', 'lean', '-DwarningAsError=true', '--root=' + str(WORK),
             '-o', str(WORK / (name + '.olean')), str(mutant)], 0))
        results.append(run(name + '-exact-comparison',
            ['lake', 'env', 'lean', '-DwarningAsError=true', '--run',
             'scripts/CompareChessM6.lean', name, str(WORK)], 1, rejection))
    check(hashlib.sha256(path.read_bytes()).hexdigest() == original_hash,
          'Controls changed the production target')
    (WORK / 'results.json').write_text(json.dumps({'checks': results,
        'source_sha256': original_hash, 'valid_kernel_mutants': len(cases)}, indent=2) + '\n')
    print('Actual M6 target mutation controls passed', flush=True)


if __name__ == '__main__':
    main()
