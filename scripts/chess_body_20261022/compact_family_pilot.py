#!/usr/bin/env python3
"""Remote-only quantified working-set certificates for substantial source tiers."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

import hashlib
import json


def window_truth(window):
    """Use one abstract proved constructor, with no per-window tactic wrapper."""
    first, finish, namespace = window['start'], window['finish'], window['namespace']
    return ('(FamilyConstructorsPilot.window_checked\n'
            f'      {first} {finish} {namespace}.cache\n'
            f'      {namespace}.checked (by decide +kernel))')


def list_truth(windows):
    result = 'rfl'
    suffix = '[]'
    for window in reversed(windows):
        literal = (f'⟨{window["start"]}, {window["finish"]}, '
                   f'{window["namespace"]}.cache⟩')
        result = ('FamilyConstructorsPilot.cons_checked\n'
                  '    ' + literal + '\n'
                  '    (' + suffix + ')\n'
                  '    ' + window_truth(window) + '\n'
                  '    (' + result + ')')
        suffix = literal + ' ::\n      ' + suffix
    return result


def wiring_preflight(driver, api):
    windows = [dict(start=0, finish=128, namespace='LookupCache128Pilot')] * 2
    source = r'''open ConjectureMachines.Optimisation LookupCachePilot WorkingViewPilot
namespace FamilyConstructorsPilot
set_option backward.isDefEq.respectTransparency false

theorem window_checked (start finish : Nat) (cache : Balanced.RowTree Cell)
    (valid : validate cache start = some finish) (bound : finish ≤ 573802) :
    checkWindow ⟨start, finish, cache⟩ = true := by
  have parts : validate cache start = some finish ∧ finish ≤ 573802 := ⟨valid, bound⟩
  simpa only [checkWindow, Bool.and_eq_true, decide_eq_true_eq] using parts

theorem cons_checked (w : Window) (windows : List Window)
    (head : checkWindow w = true) (tail : checks windows = true) :
    checks (w :: windows) = true := by
  have parts : checkWindow w = true ∧ checks windows = true := ⟨head, tail⟩
  simpa only [checks, List.all_cons, Bool.and_eq_true] using parts

end FamilyConstructorsPilot
namespace FamilyWiringPilot
noncomputable def windows : List WorkingViewPilot.Window := [
  ⟨0, 128, LookupCache128Pilot.cache⟩,
  ⟨0, 128, LookupCache128Pilot.cache⟩
]
theorem checked : WorkingViewPilot.checks windows = true :=
''' + '  ' + list_truth(windows) + '''
theorem fidelity : ∀ w ∈ windows, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows checked
theorem world_exact : WorkingViewPilot.world windows = LookupWorldPilot.actualWorld :=
  WorkingViewPilot.world_correct windows checked
end FamilyWiringPilot
'''
    roots = ['FamilyConstructorsPilot.window_checked', 'FamilyConstructorsPilot.cons_checked']
    roots += ['FamilyWiringPilot.' + n for n in ['windows', 'checked', 'fidelity', 'world_exact']]
    driver.emit('FamilyWiring.lean', api.header([api.MODULE + '.WorkingViews',
        api.MODULE + '.LookupCache128']) + source + api.audit_and_end(driver, 'FamilyWiring',
        roots, 'Compact family proof wiring checked before large batch preparation'))


def run(driver, api):
    import lookup_cache_pilot
    import lookup_world_pilot
    import working_view_pilot
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
    working_view_pilot.generate_core(driver, api)
    wiring_preflight(driver, api)
    driver.run('WorkingViews', 60,
               'Universal window-list fidelity and working-set source transport checked')
    driver.run('FamilyWiring', 60,
               'Compact family proof wiring checked before large batch preparation')
    driver.summary['compact_family_wiring_checked'] = True
    driver.summary['compact_family_wiring_roots'] = 6
    assert hashlib.sha256(api.SNAPSHOT.read_bytes()).hexdigest() == api.SNAPSHOT_SHA
    data = json.loads(api.SNAPSHOT.read_text())
    end, covered = 0, 0
    while 4 * covered < 573802:
        assert end < 4042
        covered += 5 * (data['row_sizes'][end] + len(data['return_local_targets'][end]))
        end += 1
    end = min(4042, (end + 31) // 32 * 32)
    mapping = api.words(driver.args.input / 'class-map.u32le', api.N)
    rows = api.ROOT / api.PREFIX / 'quotient-packed.rows'
    pairs = [tuple(map(int, line.split())) for line in rows.read_text().splitlines()]
    observations = mapping, pairs
    # Keep one shared return table: duplicating tiny outgoing/own/halt windows
    # saved only4-7% runtime in88 and would add thousands of data declarations.
    shared = lookup_cache_pilot.generate_data(driver, api, 40461, start=533341,
        stem='FamilyReturns', fragments_only=True, observations=observations)
    driver.emit('FamilyReturnsData.lean', api.header([api.MODULE + '.LookupCacheLoaders']) +
        shared['data'] + api.audit_and_end(driver, 'FamilyReturnsData', shared['data_roots'],
            'Shared return observation data loaded'))
    driver.emit('FamilyReturns.lean', api.header([api.MODULE + '.FamilyReturnsData']) +
        shared['validation'] + api.audit_and_end(driver, 'FamilyReturns',
            shared['validation_roots'], 'Shared return bounded validation checked'))
    shared_window = dict(start=533341, finish=573802, namespace=shared['namespace'])
    groups, current, cells = [], [], 0
    for q in range(end):
        base, size = data['prefix_offsets'][q], data['row_sizes'][q]
        first, finish = (0 if base == 0 else 1 + 5 * base), 1 + 5 * (base + size)
        ranges = [(first, finish - first, 'Main')]
        total = sum(count for _, count, _ in ranges)
        assert total <= 16384
        if current and (len(current) >= 128 or cells + total > 16384):
            groups.append(current)
            current, cells = [], 0
        current.append(dict(label=q, ranges=ranges, entries=total))
        cells += total
    if current:
        groups.append(current)
    makers, modules, operation_windows, batches = {}, {}, {}, []
    for index, group in enumerate(groups):
        stem = f'FamilyViews{index:03d}'
        namespace = stem + 'Pilot'
        data_parts = [api.header([api.MODULE + '.LookupCacheLoaders'])]
        checks = [api.header([api.MODULE + '.' + stem + 'Data',
                             api.MODULE + '.FamilyWiring', api.MODULE + '.FamilyReturns'])]
        data_roots, check_roots, definitions, keys = [], [], [], []
        for operation in group:
            q, windows = operation['label'], []
            for first, count, suffix in operation['ranges']:
                fragment = lookup_cache_pilot.generate_data(driver, api, count, start=first,
                    stem=f'Family{q}{suffix}', fragments_only=True, observations=observations)
                data_parts.append(fragment['data'])
                checks.append(fragment['validation'])
                data_roots += fragment['data_roots']
                check_roots += fragment['validation_roots']
                keys.append(fragment['summary_key'])
                windows.append(dict(start=first, finish=first + count,
                                    namespace=fragment['namespace']))
            windows.append(shared_window)
            operation_windows[q] = windows
            definitions.append(f'noncomputable def windows_{q} : List WorkingViewPilot.Window := [\n')
            definitions.append(',\n'.join(
                f'  ⟨{w["start"]}, {w["finish"]}, {w["namespace"]}.cache⟩' for w in windows))
            definitions.append('\n]\n'
                f'theorem checked_{q} : WorkingViewPilot.checks windows_{q} = true :=\n'
                f'  {list_truth(windows)}\n'
                f'theorem fidelity_{q} : ∀ w ∈ windows_{q}, WorkingViewPilot.Fidelity w :=\n'
                f'  WorkingViewPilot.all_properties windows_{q} checked_{q}\n'
                f'noncomputable def fromRaw_{q} (q : Fin 4042)\n'
                '    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)\n'
                '    (truth : LookupWorldPilot.checkRecipe\n'
                f'      (WorkingViewPilot.world windows_{q}) q raw nodes returns = true) :\n'
                '    SourceScopeToolsPilot.SourceCertificate :=\n'
                f'  WorkingViewPilot.fromRaw windows_{q} checked_{q} q raw nodes returns truth\n')
            check_roots += [namespace + '.' + name + '_' + str(q) for name in
                            ['windows', 'checked', 'fidelity', 'fromRaw']]
            makers[q], modules[q] = namespace + '.fromRaw_' + str(q), api.MODULE + '.' + stem
        checks += ['namespace ' + namespace + '\n', ''.join(definitions),
                   'end ' + namespace + '\n']
        driver.emit(stem + 'Data.lean', ''.join(data_parts) + api.audit_and_end(
            driver, stem + 'Data', data_roots, 'Compact working-set batch data loaded'))
        driver.emit(stem + '.lean', ''.join(checks) + api.audit_and_end(
            driver, stem, check_roots, 'Quantified working-set batch fidelity checked'))
        batches.append(dict(stem=stem, labels=[o['label'] for o in group],
            entries=sum(o['entries'] for o in group), data_roots=len(data_roots),
            fidelity_roots=len(check_roots), summary_keys=keys, kernel_checked=False))
    anchor = driver.summary['local_chunk_proposed']['anchor_write_label']
    anchor_index = next(i for i, batch in enumerate(batches) if anchor in batch['labels'])
    owner = f'FamilyViews{anchor_index:03d}Pilot'
    lookup_world_pilot.controls(driver, api, stem='LocalView',
        world_expr=f'(WorkingViewPilot.world {owner}.windows_{anchor})',
        maker_expr=makers[anchor], imports=[modules[anchor], api.MODULE + '.LocalChunk'])
    driver.summary['local_source_cache_proposed'] = dict(
        end_label=end, batches=batches, maximum_group_labels=128, maximum_group_entries=16384,
        dense_global_main_cache_built=False, shared_return_entries=40461,
        all_individual_fidelity_roots_retained=False,
        universal_fidelity_claims_preserved=True,
        fidelity_representation='quantified Window/list Fidelity; all chunk proofs retained',
        native_input_read_once=True, generic_working_roots=11,
        operation_windows=operation_windows, zero_fallback_claim=False,
        kernel_checked=False, new_accepted_machine=False)
    driver.checkpoint()
    # All planned data, batch, control and negative sources passed width guards.
    driver.run('FamilyReturnsData', 60, 'Shared return observation data loaded')
    driver.run('FamilyReturns', 180, 'Shared return bounded validation checked')
    driver.summary[shared['summary_key']]['kernel_checked'] = True
    for batch in batches:
        stem = batch['stem']
        driver.run(stem + 'Data', 60, 'Compact working-set batch data loaded')
        driver.run(stem, 120, 'Quantified working-set batch fidelity checked')
        batch['kernel_checked'] = True
        for key in batch['summary_keys']:
            driver.summary[key]['kernel_checked'] = True
            driver.summary[key]['fidelity_certificate'] = 'quantified WorkingViewPilot.Fidelity'
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
