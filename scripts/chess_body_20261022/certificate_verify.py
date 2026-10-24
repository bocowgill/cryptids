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
    parser.add_argument('--mode', choices=['smoke', 'full', 'source', 'cache', 'raw'], default='smoke')
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
             'scripts/chess_body_20261022/weight_table_pilot.py',
             'scripts/chess_body_20261022/operation_weights_pilot.py',
             'scripts/chess_body_20261022/diagnostics_pilot.py',
             'scripts/chess_body_20261022/symbolic_transition_pilot.py',
             'scripts/chess_body_20261022/certificate_verify.py']
    if args.mode == 'source':
        paths += ['scripts/chess_body_20261022/source_table_pilot.py',
                  'scripts/chess_body_20261022/source_chunk_pilot.py',
                  'scripts/chess_body_20261022/source_complete_pilot.py']
    if args.mode == 'cache':
        paths += ['scripts/chess_body_20261022/observed_cache_pilot.py',
                  'scripts/chess_body_20261022/binary_observation_pilot.py']
    if args.mode == 'raw':
        paths += ['scripts/chess_body_20261022/source_table_pilot.py',
                  'scripts/chess_body_20261022/raw_label_pilot.py',
                  'scripts/chess_body_20261022/source_chunk_pilot.py',
                  'scripts/chess_body_20261022/raw_chunk_pilot.py',
                  'scripts/chess_body_20261022/raw_complete_pilot.py']
    manifest = dict(commit=os.environ.get('GITHUB_SHA'), run_id=os.environ.get('GITHUB_RUN_ID'),
                    workflow_commit=os.environ.get('GITHUB_SHA'),
                    source_sha256={p: runner.sha(ROOT / p) for p in paths},
                    frozen_source_sha256=pins)
    (WORK / 'source-manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    lakefile = 'lakefile.chess-body-certificate-20261022.toml'
    targets = (['Cryptids.Compilation.FieldPacking.Graph'] if args.mode == 'cache' else
               ['Cryptids.Compilation.FieldCompiler.Snapshot'] if args.mode in ('source', 'raw') else
               ['Cryptids.Chess.Optimisation.FieldSelective',
                'Cryptids.Compilation.BalancedTable', 'Cryptids.Compilation.LocalCertificate'])
    checks = [runner.run(['lake', '--wfail', '-f', lakefile, 'build', *targets],
                        'Build completed successfully', timeout=900)]
    smoke = args.mode == 'smoke'
    source = args.mode == 'source'
    cache = args.mode == 'cache'
    raw = args.mode == 'raw'
    seconds = '180' if source or cache or raw else '300' if smoke else '1200'
    expected = ('Raw label pilot passed' if raw else 'Generic observed cache pilot passed' if cache else
                'Finite source table pilot passed' if source else
                'Body certificate compiled-audit smoke passed' if smoke else
                'Bounded body kernel certificate pilot passed')
    options = (['--raw-labels-only'] if raw else ['--observed-cache-only'] if cache else
               ['--source-tables-only'] if source else
               ['--smoke-only'] if smoke else [])
    checks.append(runner.run([sys.executable, 'scripts/chess_body_20261022/certificate_pilot.py',
                              '--lakefile', lakefile, '--output', str(WORK),
                              '--seconds', seconds, '--memory-gib', '6'] +
                             options, expected,
                             timeout=int(seconds) + 60))
    detail = json.loads((WORK / 'certificate-summary.json').read_text())
    assert detail['status'] == ('raw_labels_passed' if raw else 'observed_cache_passed' if cache else
                                'source_tables_passed' if source else
                                'smoke_passed' if smoke else 'passed')
    assert detail['full_quotient_certified'] is False
    if source:
        assert detail['complete_opcode_snapshot_checked'] is True
        assert detail['complete_source_proposed']['kernel_checked'] is True
        assert detail['actual_frozen_source_operations_checked'] == 4042
    if cache:
        assert detail['generic_observed_cache_interface_checked'] is True
        assert detail['generic_all_paid_controls_checked'] is True
        assert detail['completed_positive_unique_rows'] == 0
    if raw:
        assert detail['raw_label_decoder_checked'] is True
        assert detail['raw_source_chunk_checked'] is True
        assert detail['raw_chunk_proposed']['kernel_checked'] is True
        assert detail['complete_opcode_snapshot_checked'] is True
        assert detail['complete_raw_source_proposed']['kernel_checked'] is True
        assert detail['actual_frozen_source_operations_checked'] == 4042
        assert detail['completed_positive_unique_rows'] == 0
    (WORK / 'verification.json').write_text(json.dumps(dict(manifest, status='passed', checks=checks,
        mode=args.mode, detail=detail,
        scope=('Complete raw source reconstruction, bounds and meaning; no quotient or new machine'
               if raw else
               'Generic local equations to all paid controls; no actual quotient rows or machine'
               if cache else
               'Complete frozen source-operation reconstruction and format/corruption fixtures; '
               'no graph fidelity, quotient relation or accepted machine' if source else
               'Bounded concrete certificate pilot only; no complete quotient proof or accepted machine')),
        indent=2) + '\n')
    print('Raw label verification passed' if raw else
          'Generic observed cache verification passed' if cache else
          'Finite source table verification passed' if source else
          'Bounded quotient certificate verification passed')


if __name__ == '__main__':
    main()
