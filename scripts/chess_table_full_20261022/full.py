#!/usr/bin/env python3
"""Full remote evidence collection; fresh review and sealed replay are separate."""
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / '.lake/chess-table-full-20261022'


def verify(runner, manifest):
    checks = []
    lakefile = 'lakefile.chess-table-full-20261022.toml'

    def run(command, expected='', code=0, timeout=900):
        record = runner.run(command, expected, code=code, timeout=timeout)
        checks.append(record)
        return record

    def save(phase, **extra):
        report = dict(manifest, status='passed', phase=phase, checks=checks[:], **extra)
        (WORK / (phase + '.json')).write_text(json.dumps(report, indent=2) + '\n')

    run(['lake', '--wfail', '-f', lakefile, 'build', 'Cryptids.Semantics.ChessTableSeed',
         'chess_table_full_audit', 'chess_table_full_export'], 'Build completed successfully', timeout=1800)
    save('build')
    audit = ['prlimit', '--as=17179869184', '--', 'lake', 'env',
             str(ROOT / '.lake/build/bin/chess_table_full_audit')]
    run(audit, 'Chess table seed foundation audit passed', timeout=600)
    for flag, expected in [('--negative-control', 'Forbidden axiom: sorryAx'),
                           ('--negative-control-open', 'The open chess conjecture is a dependency'),
                           ('--negative-control-generator', 'Proof generator is a mathematical dependency:')]:
        run(audit + [flag], expected, code=1, timeout=600)
    examples = [
        ('OldCount', 'example : generated.states = 998176 := by rw [generated_states]; decide +kernel'),
        ('UnpaidDecoder', 'example : generated.states = 747662 := by rw [generated_states]; decide +kernel'),
        ('UnpaidBridge', 'example : linked.states = 595701 := by rw [linked_states]; decide +kernel'),
        ('BadSaving', 'example : FieldSeed.generated.states - generated.states = 228833 := by rw [FieldSeed.generated_states, generated_states]; decide +kernel'),
        ('MissingTurn', 'example : actions.size = bits.size := by rw [prefix_states, bits_size]; decide +kernel'),
    ]
    for name, source in examples:
        path = WORK / (name + '.lean')
        path.write_text('import Cryptids.Semantics.ChessTableSeed\n'
                        'open Chess.Optimisation Chess.Optimisation.FieldTableSeed\n' + source + '\n')
        run(['lake', 'env', 'lean', '-M6144', '-DwarningAsError=true', str(path)],
            'is false', code=1, timeout=300)
    save('contracts')
    run(['prlimit', '--stack=67108864', '--', 'lake', 'env',
         str(ROOT / '.lake/build/bin/chess_table_full_export'), str(WORK / 'machine-export.json')],
        'Table seed complete native export passed', timeout=1200)
    save('native')
    run([sys.executable, 'scripts/chess_table_full_20261022/fixtures.py'],
        'Table seed complete independent fixtures passed', timeout=1200)
    detail = json.loads((WORK / 'fixtures-detail.json').read_text())
    assert detail['status'] == 'passed'
    # The independent checker owns its detailed schema. These are the fixed root
    # acceptance boundaries, not figures inferred from a component estimate.
    assert detail['states'] == 769344
    assert detail['previous_states'] == 998176
    assert detail['saved_states'] == 228832
    assert detail['initializer_states'] == 173642
    assert detail['decoder_states'] == 21682
    assert detail['decoder_bridge_states'] == 1
    assert detail['seed_controller_states'] == 216
    assert detail['seed_bridge_states'] == 1
    assert detail['body_states'] == 573802
    assert detail['complete_full_rows_verified'] is True
    assert detail['complete_full_rows_checked'] == 1538688
    assert detail['static_full_input_verified'] is True
    assert detail['initializer_verified'] is True
    assert detail['composed_fixtures_verified'] is True
    assert detail['mutation_controls'] and all(c['rejected'] is True for c in detail['mutation_controls'])
    hashes = {name: runner.sha(WORK / name) for name in
              ['machine-export.json', 'full-rows.bin', 'fixtures-detail.json']}
    save('counts', detail=detail, artifact_sha256=hashes)
    run(['lake', '--wfail', '-f', lakefile, 'build', 'Cryptids.Chess.Fixtures',
         'Cryptids.Chess.Evaluation', 'Cryptids.Semantics.ChessFieldSelective', 'Cryptids.Semantics.ChessSeed',
         'Cryptids.Compilation.FieldBranch.Certificate'],
        'Build completed successfully', timeout=1200)
    for name, expected, args in [
        ('scripts/RunChessM2.lean', 'Rule fixtures passed:', ['--rules']),
        ('scripts/RunChessM3.lean', 'Chess M3 fixtures passed:', []),
        ('scripts/RunChessM4.lean', 'Chess M4 fixtures passed:', []),
        ('scripts/RunChessM5.lean', '16 assertions', []),
        ('scripts/chess_m6/SharedFixtures.lean', 'Shared fixtures passed:', []),
        ('scripts/chess_m7/Fixtures.lean', 'M7 quotient fixtures passed', []),
        ('scripts/chess_openevolve/Fixtures.lean', 'Terminal binary fixtures passed', [])]:
        mode = [] if name == 'scripts/chess_m6/SharedFixtures.lean' else ['--run']
        run(['lake', 'env', 'lean', '-M6144', '-DwarningAsError=true'] + mode + [name] + args,
            expected, timeout=600)
    save('full', detail=detail, artifact_sha256=hashes)
    print('Complete paid table seed chess reduction passed')
