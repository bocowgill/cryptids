#!/usr/bin/env python3
"""Remote-only bounded application of local interfaces to exact quotient data."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')


def run(driver, api):
    driver.summary.update(classification='NUMERIC_SOURCE_LOCAL_INTERFACE_PILOT',
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
    import local_rule_pilot
    local_rule_pilot.generate(driver, api.header, api.audit_and_end, api.MODULE)
    driver.run('LocalRules', 60,
               'Finite numeric local checks imply exact main and paid-return equations')
    driver.summary['source_local_rule_soundness_checked'] = True
    driver.summary.update(status='numeric_local_passed', numeric_local_interface_checked=True)
    driver.checkpoint()
    print('Numeric source-local projection pilot passed', flush=True)
