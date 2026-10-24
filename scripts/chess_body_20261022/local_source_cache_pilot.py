#!/usr/bin/env python3
"""Remote-only batched local views for the unchanged substantial SOURCE tiers."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

import hashlib
import json


def run(driver, api):
    import lookup_cache_pilot
    import lookup_world_pilot
    import local_view_pilot
    # Keep exact generic checker agreement and all class/word/extent controls.
    lookup_world_pilot.generate(driver, api)
    driver.run('LookupWorld', 60,
               'Coefficient substitution preserves every original source obligation')
    lookup_cache_pilot.generate_tools(driver, api)
    driver.run('LookupCache', 60,
               'Numeric observation cache preserves every lookup including fallback')
    driver.run('LookupCacheLoaders', 60, 'Typed observation cache loader checked')
    lookup_cache_pilot.generate_data(driver, api, 128)
    driver.run('LookupCache128Data', 60, 'Numeric observation cache data loaded: 128')
    driver.run('LookupCache128', 60, 'Numeric observation cache fidelity checked: 128')
    driver.run('LookupCacheControls', 60, 'Cache class and word corruption rejected')
    driver.run('LookupCacheNegative', 45, negative=True)
    assert hashlib.sha256(api.SNAPSHOT.read_bytes()).hexdigest() == api.SNAPSHOT_SHA
    data = json.loads(api.SNAPSHOT.read_text())
    end, covered = 0, 0
    while 4 * covered < 573802:
        assert end < 4042
        covered += 5 * (data['row_sizes'][end] + len(data['return_local_targets'][end]))
        end += 1
    end = min(4042, (end + 31) // 32 * 32)
    # Read proposed numeric observations once, rather than once per operation.
    mapping = api.words(driver.args.input / 'class-map.u32le', api.N)
    rows = api.ROOT / api.PREFIX / 'quotient-packed.rows'
    pairs = [tuple(map(int, line.split())) for line in rows.read_text().splitlines()]
    observations = mapping, pairs
    lookup_cache_pilot.generate_data(driver, api, 40461, start=533341,
                                   stem='SourceReturnCache', observations=observations)
    local_view_pilot.generate_core(driver, api)
    groups, current, cells = [], [], 0
    for q in range(end):
        base, size = data['prefix_offsets'][q], data['row_sizes'][q]
        first, finish = (0 if base == 0 else 1 + 5 * base), 1 + 5 * (base + size)
        count = finish - first
        assert 0 <= first < finish <= 533341 and count <= 16384
        if current and (len(current) >= 128 or cells + count > 16384):
            groups.append(current)
            current, cells = [], 0
        current.append(dict(label=q, start=first, finish=finish, count=count))
        cells += count
    if current:
        groups.append(current)
    makers, modules, windows, batches = {}, {}, {}, []
    for index, group in enumerate(groups):
        stem = f'ScopeViews{index:03d}'
        namespace = stem + 'Pilot'
        data_parts = [api.header([api.MODULE + '.LookupCacheLoaders'])]
        check_parts = [api.header([api.MODULE + '.' + stem + 'Data',
                                   api.MODULE + '.LocalViews'])]
        data_roots, check_roots, maker_parts = [], [], []
        summary_keys = []
        for view in group:
            q, first, finish = view['label'], view['start'], view['finish']
            cache_stem = f'SourceCache{q}'
            fragment = lookup_cache_pilot.generate_data(
                driver, api, view['count'], start=first, stem=cache_stem,
                fragments_only=True, observations=observations)
            cache_namespace = fragment['namespace']
            data_parts.append(fragment['data'])
            check_parts.append(fragment['checks'])
            data_roots += fragment['data_roots']
            check_roots += fragment['check_roots']
            summary_keys.append(fragment['summary_key'])
            maker_parts.append(f'noncomputable def fromRaw_{q} (q : Fin 4042)\n'
                '    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)\n'
                '    (truth : LookupWorldPilot.checkRecipe\n'
                f'      (LocalViewPilot.world {cache_namespace}.cache {first} {finish})\n'
                '      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=\n'
                f'  LocalViewPilot.fromLocalRaw {cache_namespace}.cache\n'
                f'    {first} {finish} {cache_namespace}.checked q raw nodes returns truth\n')
            maker = namespace + '.fromRaw_' + str(q)
            check_roots.append(maker)
            makers[q], modules[q] = maker, api.MODULE + '.' + stem
            windows[q] = dict(view, namespace=cache_namespace)
        check_parts += ['namespace ' + namespace + '\n', ''.join(maker_parts),
                        'end ' + namespace + '\n']
        driver.emit(stem + 'Data.lean', ''.join(data_parts) + api.audit_and_end(
            driver, stem + 'Data', data_roots, 'Batched operation-local cache data loaded'))
        driver.emit(stem + '.lean', ''.join(check_parts) + api.audit_and_end(
            driver, stem, check_roots, 'Batched operation-local cache fidelity checked'))
        batches.append(dict(stem=stem, labels=[v['label'] for v in group],
                            entries=sum(v['count'] for v in group),
                            data_roots=len(data_roots), fidelity_roots=len(check_roots),
                            summary_keys=summary_keys, kernel_checked=False))
        driver.checkpoint()
    anchor = driver.summary['local_chunk_proposed']['anchor_write_label']
    anchor_view = windows[anchor]
    world = ('(LocalViewPilot.world ' + anchor_view['namespace'] + '.cache ' +
             str(anchor_view['start']) + ' ' + str(anchor_view['finish']) + ')')
    lookup_world_pilot.controls(driver, api, stem='LocalView', world_expr=world,
        maker_expr=makers[anchor], imports=[modules[anchor], api.MODULE + '.LocalChunk'])
    driver.summary['local_source_cache_proposed'] = dict(
        end_label=end, batches=batches, maximum_group_labels=128,
        maximum_group_entries=16384, dense_global_main_cache_built=False,
        shared_return_entries=40461, all_individual_fidelity_roots_retained=True,
        native_input_read_once=True, kernel_checked=False, new_accepted_machine=False)
    driver.checkpoint()
    # Every planned module has already passed Driver.emit's width guard.
    driver.run('SourceReturnCacheData', 60, 'Numeric observation cache data loaded: 40461')
    driver.run('SourceReturnCache', 180, 'Numeric observation cache fidelity checked: 40461')
    driver.summary['SourceReturnCache_proposed']['kernel_checked'] = True
    driver.run('LocalViews', 60,
               'Operation-local views globally preserve original lookup coefficients')
    for batch in batches:
        stem = batch['stem']
        driver.run(stem + 'Data', 60, 'Batched operation-local cache data loaded')
        driver.run(stem, 120, 'Batched operation-local cache fidelity checked')
        batch['kernel_checked'] = True
        for key in batch['summary_keys']:
            driver.summary[key]['kernel_checked'] = True
        driver.checkpoint()
    driver.summary['local_source_cache_proposed']['kernel_checked'] = True
    driver.summary['operation_local_source_cache_checked'] = True
    driver.run('LocalViewControls', 60,
               'Fast coefficients preserve real write and source-count controls')
    driver.summary['operation_local_source_controls_checked'] = True
    driver.run('LocalViewNegative', 45, negative=True)
    driver.summary['operation_local_source_kernel_corruption_rejected'] = True
    driver.checkpoint()
    return makers, modules
