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
    parser.add_argument('--mode', choices=['smoke', 'full', 'source', 'cache', 'raw', 'local',
                                         'lookup', 'profile'],
                        default='smoke')
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
             'scripts/chess_body_20261022/numeric_tree_pilot.py',
             'scripts/chess_body_20261022/numeric_control_pilot.py',
             'scripts/chess_body_20261022/numeric_source_core_pilot.py',
             'scripts/chess_body_20261022/certificate_verify.py']
    if args.mode == 'source':
        paths += ['scripts/chess_body_20261022/source_table_pilot.py',
                  'scripts/chess_body_20261022/source_chunk_pilot.py',
                  'scripts/chess_body_20261022/source_complete_pilot.py']
    if args.mode == 'cache':
        paths += ['scripts/chess_body_20261022/observed_cache_pilot.py',
                  'scripts/chess_body_20261022/binary_observation_pilot.py',
                  'scripts/chess_body_20261022/prefix_scan_pilot.py']
    if args.mode == 'raw':
        paths += ['scripts/chess_body_20261022/source_table_pilot.py',
                  'scripts/chess_body_20261022/raw_label_pilot.py',
                  'scripts/chess_body_20261022/source_chunk_pilot.py',
                  'scripts/chess_body_20261022/raw_chunk_pilot.py',
                  'scripts/chess_body_20261022/raw_complete_pilot.py']
    if args.mode in ('local', 'lookup', 'profile'):
        paths += ['scripts/chess_body_20261022/observed_cache_pilot.py',
                  'scripts/chess_body_20261022/binary_observation_pilot.py',
                  'scripts/chess_body_20261022/prefix_scan_pilot.py',
                  'scripts/chess_body_20261022/numeric_local_pilot.py',
                  'scripts/chess_body_20261022/numeric_phase_pilot.py',
                  'scripts/chess_body_20261022/local_rule_pilot.py',
                  'scripts/chess_body_20261022/direct_check_pilot.py',
                  'scripts/chess_body_20261022/literal_syntax_pilot.py',
                  'scripts/chess_body_20261022/structural_check_pilot.py',
                  'scripts/chess_body_20261022/source_recipe_pilot.py',
                  'scripts/chess_body_20261022/lookup_cache_pilot.py',
                  'scripts/chess_body_20261022/fuel_lookup_pilot.py',
                  'scripts/chess_body_20261022/lookup_world_pilot.py',
                  'scripts/chess_body_20261022/cached_world_pilot.py',
                  'scripts/chess_body_20261022/source_profile_pilot.py',
                  'scripts/chess_body_20261022/local_view_pilot.py',
                  'scripts/chess_body_20261022/local_source_cache_pilot.py',
                  'scripts/chess_body_20261022/compact_family_pilot.py',
                  'scripts/chess_body_20261022/working_view_pilot.py',
                  'scripts/chess_body_20261022/local_chunk_pilot.py',
                  'scripts/chess_body_20261022/source_scope_tools_pilot.py',
                  'scripts/chess_body_20261022/source_scope_pilot.py',
                  'scripts/chess_body_20261022/source_table_pilot.py',
                  'scripts/chess_body_20261022/source_chunk_pilot.py',
                  'scripts/chess_body_20261022/raw_label_pilot.py',
                  'scripts/chess_body_20261022/raw_chunk_pilot.py']
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
    local = args.mode == 'local'
    lookup = args.mode == 'lookup'
    profile = args.mode == 'profile'
    seconds = '180' if source or cache or raw else '300' if smoke else '1200'
    expected = ('Controlled source component profile passed' if profile else
                'Numeric observation cache fidelity pilot passed' if lookup else
                'Numeric source-local projection pilot passed' if local else
                'Raw label pilot passed' if raw else 'Generic observed cache pilot passed' if cache else
                'Finite source table pilot passed' if source else
                'Body certificate compiled-audit smoke passed' if smoke else
                'Bounded body kernel certificate pilot passed')
    options = (['--numeric-source-profile-only'] if profile else
               ['--lookup-cache-only'] if lookup else
               ['--numeric-local-only'] if local else
               ['--raw-labels-only'] if raw else ['--observed-cache-only'] if cache else
               ['--source-tables-only'] if source else
               ['--smoke-only'] if smoke else [])
    checks.append(runner.run([sys.executable, 'scripts/chess_body_20261022/certificate_pilot.py',
                              '--lakefile', lakefile, '--output', str(WORK),
                              '--seconds', seconds, '--memory-gib', '6'] +
                             options, expected,
                             timeout=int(seconds) + 60))
    detail = json.loads((WORK / 'certificate-summary.json').read_text())
    assert detail['status'] == ('source_profile_passed' if profile else
                                'lookup_cache_passed' if lookup else
                                'numeric_local_passed' if local else
                                'raw_labels_passed' if raw else 'observed_cache_passed' if cache else
                                'source_tables_passed' if source else
                                'smoke_passed' if smoke else 'passed')
    assert detail['full_quotient_certified'] is False
    if smoke:
        assert detail['numeric_tree_core_checked'] is True
        assert detail['numeric_tree_proposed']['required_roots'] == 20
        assert detail['numeric_tree_proposed']['kernel_checked'] is True
        assert detail['numeric_tree_kernel_corruption_rejected'] is True
        assert detail['numeric_tree_proposed']['actual_source_rows_certified'] == 0
        assert detail['numeric_control_core_checked'] is True
        assert detail['numeric_control_proposed']['required_roots'] == 29
        assert detail['numeric_control_proposed']['kernel_checked'] is True
        assert detail['numeric_control_kernel_corruption_rejected'] is True
        assert detail['numeric_control_proposed']['actual_source_rows_certified'] == 0
        assert detail['numeric_control_proposed']['concrete_source_transport_checked'] is False
        assert detail['numeric_source_core_checked'] is True
        assert detail['numeric_source_core_proposed']['required_roots'] == 17
        assert detail['numeric_source_core_proposed']['kernel_checked'] is True
        assert detail['numeric_source_core_kernel_corruption_rejected'] is True
        assert detail['numeric_source_core_proposed']['actual_source_rows_certified'] == 0
        assert detail['numeric_source_core_proposed']['concrete_map_q_binding_checked'] is False
    if profile:
        assert detail['source_component_profile_checked'] is True
        assert detail['source_component_profile_proposed']['kernel_checked'] is True
        assert detail['source_component_profile_proposed']['required_roots'] == 63
        assert detail['operation_local_view_proposed']['kernel_checked'] is True
        assert detail['working_set_proposed']['kernel_checked'] is True
        assert detail['working_set_proposed']['generic_roots'] == 11
        assert detail['source_component_profile_proposed'][
            'substantial_source_scaling_established'] is False
        assert detail['cache_world_source_checker_agreement_checked'] is True
        assert detail['cache_world_actual_source_controls_checked'] is True
        assert detail['cache_world_kernel_corruption_rejected'] is True
        assert detail['source_component_timing']['events'] == 102
        assert detail['new_accepted_machine'] is False
    if lookup:
        assert detail['complete_typed_candidate_data_checked'] is True
        assert detail['numeric_observation_cache_soundness_checked'] is True
        assert detail['numeric_observation_cache_loader_checked'] is True
        assert detail['numeric_lookup_cache_corruption_controls_checked'] is True
        assert detail['fuel_lookup_comparison_checked'] is True
        assert detail['fuel_lookup_kernel_corruption_rejected'] is True
        assert detail['fuel_comparison_proposed']['kernel_checked'] is True
        assert detail['fuel_comparison_proposed']['same_data_as_original'] is True
        assert detail['fuel_comparison_proposed']['source_rows_certified'] == 0
        for entries in (128, 8192, 65536):
            cache_scope = detail[f'lookup_cache_{entries}_proposed']
            assert cache_scope['kernel_checked'] is True
            assert cache_scope['entries'] == entries
            assert cache_scope['source_rows_certified'] == 0
        assert detail['completed_numeric_observation_entries'] == 65536
        assert detail['completed_positive_unique_rows'] == 0
        assert detail['new_accepted_machine'] is False
    if source:
        assert detail['complete_opcode_snapshot_checked'] is True
        assert detail['complete_source_proposed']['kernel_checked'] is True
        assert detail['actual_frozen_source_operations_checked'] == 4042
    if cache:
        assert detail['generic_observed_cache_interface_checked'] is True
        assert detail['generic_all_paid_controls_checked'] is True
        assert detail['complete_prefix_scan_checked'] is True
        assert detail['completed_positive_unique_rows'] == 0
    if local:
        assert detail['compact_family_wiring_checked'] is True
        assert detail['compact_family_wiring_roots'] == 6
        assert detail['operation_local_source_cache_checked'] is True
        assert detail['operation_local_source_controls_checked'] is True
        assert detail['operation_local_source_kernel_corruption_rejected'] is True
        assert detail['local_source_cache_proposed']['kernel_checked'] is True
        assert detail['local_source_cache_proposed'][
            'universal_fidelity_claims_preserved'] is True
        assert detail['local_source_cache_proposed']['generic_working_roots'] == 11
        for batch in detail['local_source_cache_proposed']['batches']:
            assert batch['kernel_checked'] is True
            assert batch['entries'] <= 16384
            assert len(batch['labels']) <= 128
        assert detail['numeric_local_interface_checked'] is True
        assert detail['source_local_rule_soundness_checked'] is True
        assert detail['complete_prefix_scan_checked'] is True
        assert detail['complete_typed_candidate_data_checked'] is True
        assert detail['local_chunk_proposed']['kernel_checked'] is True
        assert detail['local_chunk_kernel_corruption_rejected'] is True
        assert detail['negative_control']['status'] == 'kernel_rejected'
        assert detail['source_scope_collection_soundness_checked'] is True
        for divisor in (16, 4):
            scope = detail[f'local_scope_{divisor}_proposed']
            assert scope['kernel_checked'] is True
            assert divisor * scope['finite_state_domain'] >= 573802
        assert detail['local_scope_4_proposed']['finite_state_domain'] > detail[
            'local_scope_16_proposed']['finite_state_domain']
        assert detail['completed_positive_unique_rows'] == detail['local_scope_4_proposed'][
            'finite_row_domain']
        assert detail['completed_positive_unique_rows'] > 0
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
        scope=('Numerical cache lookup fidelity only; zero source row or new machine credit'
               if lookup else
               'At least 1/16 and 1/4 of actual paid body; no full quotient or new machine'
               if local else
               'Complete raw source reconstruction, bounds and meaning; no quotient or new machine'
               if raw else
               'Generic local equations to all paid controls; no actual quotient rows or machine'
               if cache else
               'Complete frozen source-operation reconstruction and format/corruption fixtures; '
               'no graph fidelity, quotient relation or accepted machine' if source else
               'Bounded concrete certificate pilot only; no complete quotient proof or accepted machine')),
        indent=2) + '\n')
    print('Numeric observation cache verification passed' if lookup else
          'Raw label verification passed' if raw else
          'Generic observed cache verification passed' if cache else
          'Finite source table verification passed' if source else
          'Bounded quotient certificate verification passed')


if __name__ == '__main__':
    main()
