#!/usr/bin/env python3
"""Remote actual-Lean-row comparison and finite execution against the pilot oracle."""
import os
if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required')
import hashlib
import importlib.util
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / '.lake/chess-seed-20261022'
PILOT = ROOT / 'docs/chess/campaign-2026-10-22/round-02/evidence/pilot-02/unpacked'


def main():
    spec = importlib.util.spec_from_file_location('finite_pilot', ROOT / 'scripts/chess_seed_20261022/pilot.py')
    pilot = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(pilot)
    machine = json.loads((PILOT / 'controller.json').read_text())
    actual_path = WORK / 'controller-lean.json'
    actual = json.loads(actual_path.read_text())
    assert actual['schema'] == 'chess-seed-lean-controller-v1'
    assert actual['states'] == machine['states'] == 216
    assert actual['rows'] == machine['rows'], 'Actual Lean table differs from retained pilot'
    machine['rows'] = actual['rows']
    census = pilot.validate_controller(machine)
    source = json.loads((PILOT / 'static-input.json').read_text())
    fixtures = pilot.finite_fixtures(machine, source['actual_final_stack_symbol'])
    negatives = pilot.negative_controls(machine)
    report = dict(status='passed', scope='Exact actual Lean rows and finite regression evidence only',
                  complete_row_equality=True, census=census, fixtures=fixtures,
                  negative_controls=negatives,
                  actual_sha256=hashlib.sha256(actual_path.read_bytes()).hexdigest(),
                  pilot_sha256=hashlib.sha256((PILOT / 'controller.json').read_bytes()).hexdigest())
    (WORK / 'controller-compare.json').write_text(json.dumps(report, indent=2) + '\n')
    print('Seed actual controller comparison passed')


if __name__ == '__main__':
    main()
