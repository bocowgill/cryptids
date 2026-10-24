#!/usr/bin/env python3
"""Remote-only bounded application of local interfaces to exact quotient data."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')


def run(driver, api, lookup_only=False, profile_only=False):
    driver.summary.update(classification=('CONTROLLED_SOURCE_COMPONENT_COST_PROFILE' if
                                         profile_only else 'NUMERIC_SOURCE_LOCAL_INTERFACE_PILOT'),
                          numeric_local_interface_checked=False,
                          generic_all_paid_controls_checked=False,
                          complete_prefix_scan_checked=False)
    api.load_candidate(driver)
    # This emits declarations only. No old sampled-row pilot is run.
    api.generate(driver, [])
    driver.run('Audit', 120, 'Build completed successfully', audit_build=True)
    driver.run('Loaders', 60, 'Body certificate loaders checked')
    driver.run('TemplateSmoke', 60, 'Body certificate template smoke checked')
    driver.summary['template_smoke_checked'] = True
    driver.run('RowTools', 60, 'Structural body row helpers checked')
    driver.run('OperationWeights', 60, 'Universal frozen operation weight summaries checked')
    driver.run('WeightTables', 60,
               'Complete source weights and shared prefix correspondence checked')
    driver.run('RowWitnesses', 60, 'Actual local syntax and far-end address witnesses checked')
    driver.run('ActualTools', 60, 'Structural main and return row transport helpers checked')
    import observed_cache_pilot
    observed_cache_pilot.generate(driver, api.header, api.audit_and_end)
    driver.run('ObservedCache', 60, 'Generic observed cache and source-slot coverage checked')
    driver.summary['generic_observed_cache_interface_checked'] = True
    import binary_observation_pilot
    binary_observation_pilot.generate(driver, api.header, api.audit_and_end, api.MODULE)
    driver.run('BinaryObservation', 60, 'Local equations cover every paid binary control')
    driver.summary['generic_all_paid_controls_checked'] = True
    driver.checkpoint()
    import prefix_scan_pilot
    prefix_scan_pilot.generate(driver, api.SNAPSHOT, api.SNAPSHOT_SHA,
                               api.header, api.audit_and_end, api.MODULE)
    driver.run('PrefixScan', 60, 'Complete linear prefix certificates agree with frozen offsets')
    driver.summary['prefix_scan_proposed']['kernel_checked'] = True
    driver.summary['complete_prefix_scan_checked'] = True
    driver.checkpoint()
    driver.run('MapData', 240, 'Complete body class map loaded')
    driver.run('QuotientData', 180, 'Complete body quotient rows loaded')
    driver.run_data_group()
    import numeric_local_pilot
    numeric_local_pilot.generate(driver, api.header, api.audit_and_end, api.MODULE)
    driver.run('NumericLocal', 60, 'Numeric local projections preserve actual source observations')
    driver.summary['numeric_local_interface_checked'] = True
    driver.checkpoint()
    if lookup_only:
        import lookup_cache_pilot
        lookup_cache_pilot.run(driver, api)
        return
    import local_rule_pilot
    local_rule_pilot.generate(driver, api.header, api.audit_and_end, api.MODULE)
    driver.run('LocalRules', 60,
               'Finite numeric local checks imply exact main and paid-return equations')
    driver.summary['source_local_rule_soundness_checked'] = True
    driver.checkpoint()
    import direct_check_pilot
    direct_check_pilot.generate(driver, api.header, api.audit_and_end, api.MODULE)
    driver.run('DirectChecks', 60, 'Direct Boolean checker preserves all local row obligations')
    driver.summary['direct_boolean_row_checker_soundness_checked'] = True
    driver.checkpoint()
    import structural_check_pilot
    structural_check_pilot.generate(driver, api.header, api.audit_and_end, api.MODULE)
    driver.run('StructuralChecks', 60, 'Structural syntax traversal covers every original slot')
    driver.summary['structural_syntax_traversal_soundness_checked'] = True
    driver.checkpoint()
    import source_table_pilot
    source_table_pilot.generate(driver, api.header, api.audit_and_end, api.MODULE)
    driver.run('SourceTables', 60, 'Finite source-operation table reconstruction checked')
    import raw_label_pilot
    raw_label_pilot.generate(driver, api.header, api.audit_and_end, api.MODULE)
    driver.run('RawLabels', 60, 'Raw labels decode exactly and reject out-of-range targets')
    driver.summary['raw_label_decoder_checked'] = True
    import source_chunk_pilot
    source_chunk_pilot.generate_proposer(driver, api.header, api.MODULE, api.NS)
    driver.run('SourceTableProposal', 60, 'Untrusted finite source operations exported')
    import raw_chunk_pilot
    raw_chunk_pilot.generate(driver, api.header, api.audit_and_end, api.MODULE)
    driver.run('RawChunk', 60, 'Raw source chunk bounds and restoration checked')
    driver.summary['raw_chunk_proposed']['kernel_checked'] = True
    driver.summary['raw_source_chunk_checked'] = True
    driver.checkpoint()
    import local_chunk_pilot
    local_chunk_pilot.generate(driver, api.SNAPSHOT, api.SNAPSHOT_SHA,
                               api.header, api.audit_and_end, api.progress_marker,
                               api.MODULE, api.NS)
    driver.run('LocalChunk', 120, 'Complete actual source block main and return rows checked')
    coverage = driver.summary['local_chunk_proposed']
    coverage['kernel_checked'] = True
    coverage['domain_census_kernel_checked'] = True
    driver.summary.update(completed_positive_source_blocks=1,
                          completed_positive_sample_states=coverage['finite_state_domain'],
                          completed_positive_unique_rows=coverage['finite_row_domain'])
    driver.checkpoint()
    driver.run('LocalNegative', 45, negative=True)
    driver.summary['local_chunk_kernel_corruption_rejected'] = True
    driver.checkpoint()
    import source_scope_tools_pilot
    source_scope_tools_pilot.generate(driver, api.header, api.audit_and_end, api.MODULE)
    driver.run('SourceScopeTools', 60,
               'Checked source certificate collection covers every claimed source label')
    driver.summary['source_scope_collection_soundness_checked'] = True
    driver.checkpoint()
    import source_recipe_pilot
    source_recipe_pilot.generate(driver, api.header, api.audit_and_end, api.MODULE)
    driver.run('SourceRecipes', 60,
               'Compact source recipes preserve every row and census obligation')
    driver.summary['compact_source_recipe_soundness_checked'] = True
    import hashlib
    import json
    assert hashlib.sha256(api.SNAPSHOT.read_bytes()).hexdigest() == api.SNAPSHOT_SHA
    recipe_data = json.loads(api.SNAPSHOT.read_text())
    recipe_anchor = coverage['anchor_write_label']
    driver.summary['recipe_anchor_nodes'] = recipe_data['row_sizes'][recipe_anchor]
    driver.summary['recipe_anchor_returns'] = len(
        recipe_data['return_local_targets'][recipe_anchor])
    source_recipe_pilot.controls(driver, api.header, api.audit_and_end, api.MODULE, api.NS)
    driver.run('RecipeControls', 60, 'Compact recipe actual source and count controls checked')
    driver.summary['compact_recipe_actual_source_and_counts_checked'] = True
    driver.run('RecipeNegative', 45, negative=True)
    driver.summary['compact_recipe_kernel_corruption_rejected'] = True
    driver.checkpoint()
    if profile_only:
        import numeric_tree_pilot
        import numeric_control_pilot
        import numeric_source_core_pilot
        import numeric_source_adapter_pilot
        import numeric_actual_profile_pilot
        numeric_tree_pilot.run(driver, api)
        numeric_control_pilot.run(driver, api)
        numeric_source_core_pilot.run(driver, api)
        numeric_source_adapter_pilot.run(driver, api)
        numeric_actual_profile_pilot.run(driver, api)
        return
    import compact_family_pilot
    makers, modules = compact_family_pilot.run(driver, api)
    inherited = {q: 'LocalChunk' for q in range(coverage['first_label'], coverage['end_label'])}
    import source_scope_pilot
    for divisor, seconds in [(16, 180), (4, 210)]:
        owners = source_scope_pilot.generate(driver, api.SNAPSHOT, api.SNAPSHOT_SHA,
            api.header, api.audit_and_end, api.progress_marker, api.MODULE, divisor, inherited,
            recipe_constructors=makers, recipe_modules=modules)
        driver.run(f'LocalScope{divisor}', seconds,
                   f'Actual paid body coverage checked: at least 1/{divisor}')
        scope = driver.summary[f'local_scope_{divisor}_proposed']
        scope['kernel_checked'] = True
        scope['domain_census_kernel_checked'] = True
        inherited.update(owners)
        driver.summary.update(
            completed_positive_sample_states=scope['finite_state_domain'],
            completed_positive_unique_rows=scope['finite_row_domain'],
            coverage_counter_scope='Largest certified source prefix; off-prefix block not added')
        driver.checkpoint()
    driver.summary.update(status='numeric_local_passed', numeric_local_interface_checked=True)
    driver.checkpoint()
    print('Numeric source-local projection pilot passed', flush=True)
