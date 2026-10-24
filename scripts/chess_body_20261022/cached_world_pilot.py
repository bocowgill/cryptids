#!/usr/bin/env python3
"""Remote-only reuse of certified observations in substantial source coverage."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

import hashlib
import json


def generate_world(driver, api, windows):
    imports = [api.MODULE + '.LookupWorld'] + [api.MODULE + '.' + w['stem'] for w in windows]
    parts = [api.header(imports), 'open ConjectureMachines.Optimisation\n'
             'open LookupCachePilot LookupWorldPilot\nnamespace CacheWorldPilot\n']
    for kind, cell_function, fallback in [
            ('classes', 'cachedClass', 'mapTree.lookup address 0'),
            ('pairs', 'cachedPair', 'observedPair address')]:
        result_type = 'Nat' if kind == 'classes' else 'Nat × Nat'
        parts.append(f'noncomputable def {kind} (address : Nat) : {result_type} :=\n')
        for w in windows:
            start, finish, namespace = w['start'], w['finish'], w['stem'] + 'Pilot'
            parts.append(f'  if {start} ≤ address ∧ address < {finish} then\n'
                         f'    {cell_function} {namespace}.cache {start} {finish} address else\n')
        parts.append('  ' + fallback + '\n')
        target = fallback
        theorem = 'all_cached_classes' if kind == 'classes' else 'all_cached_words'
        parts.append(f'theorem {kind}_eq (address : Nat) : {kind} address = {target} := by\n'
                     f'  simp only [{kind},\n')
        for w in windows:
            parts.append(f'    {w["stem"]}Pilot.{theorem},\n')
        parts.append('    ite_self]\n')
    parts.append('''
noncomputable def cacheWorld : World := ⟨classes, pairs⟩

theorem cacheWorld_correct : cacheWorld = actualWorld := by
  have classFunctions := funext classes_eq
  have pairFunctions := funext pairs_eq
  exact congrArg₂ World.mk classFunctions pairFunctions

noncomputable def fromCachedRaw (q : Fin 4042) (raw : RawLabelPilot.RawOp)
    (nodes returns : Nat) (checked :
      LookupWorldPilot.checkRecipe cacheWorld q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  LookupWorldPilot.fromRaw cacheWorld cacheWorld_correct q raw nodes returns checked

end CacheWorldPilot
''')
    roots = ['classes', 'pairs', 'classes_eq', 'pairs_eq', 'cacheWorld',
             'cacheWorld_correct', 'fromCachedRaw']
    driver.emit('CacheWorld.lean', ''.join(parts) + api.audit_and_end(driver, 'CacheWorld',
                ['CacheWorldPilot.' + n for n in roots],
                'Validated cache coefficients yield unchanged source certificates'))


def run(driver, api):
    import lookup_cache_pilot
    import lookup_world_pilot
    lookup_world_pilot.generate(driver, api)
    driver.run('LookupWorld', 60,
               'Coefficient substitution preserves every original source obligation')
    lookup_cache_pilot.generate_tools(driver, api)
    driver.run('LookupCache', 60,
               'Numeric observation cache preserves every lookup including fallback')
    driver.run('LookupCacheLoaders', 60, 'Typed observation cache loader checked')
    # Keep the established class/word corruption and kernel extent controls.
    lookup_cache_pilot.generate_data(driver, api, 128)
    driver.run('LookupCache128Data', 60, 'Numeric observation cache data loaded: 128')
    driver.run('LookupCache128', 60, 'Numeric observation cache fidelity checked: 128')
    driver.run('LookupCacheControls', 60, 'Cache class and word corruption rejected')
    driver.run('LookupCacheNegative', 45, negative=True)
    # Plan exactly the main-address prefix required by the unchanged quarter
    # source census. Shared high return addresses cover arbitrary goto targets.
    assert hashlib.sha256(api.SNAPSHOT.read_bytes()).hexdigest() == api.SNAPSHOT_SHA
    data = json.loads(api.SNAPSHOT.read_text())
    end, covered = 0, 0
    while 4 * covered < 573802:
        assert end < 4042
        covered += 5 * (data['row_sizes'][end] + len(data['return_local_targets'][end]))
        end += 1
    end = min(4042, (end + 31) // 32 * 32)
    main_end = 1 + 5 * sum(data['row_sizes'][:end])
    assert main_end <= 196608, 'Bounded pilot requires at most three main cache windows'
    windows = []
    for start in range(0, main_end, 65536):
        windows.append(dict(start=start, finish=min(start + 65536, main_end),
                            stem=f'SourceMainCache{start}'))
    windows.append(dict(start=533341, finish=573802, stem='SourceReturnCache'))
    driver.summary['cached_world_planned'] = dict(
        windows=windows, quarter_source_end=end, main_address_end=main_end,
        source_rows_certified=0, accepted_full_machine_saving=0)
    driver.checkpoint()
    for w in windows:
        count, stem = w['finish'] - w['start'], w['stem']
        lookup_cache_pilot.generate_data(driver, api, count, start=w['start'], stem=stem)
        driver.run(stem + 'Data', 60, f'Numeric observation cache data loaded: {count}')
        driver.run(stem, 180, f'Numeric observation cache fidelity checked: {count}')
        driver.summary[stem + '_proposed']['kernel_checked'] = True
        driver.checkpoint()
    generate_world(driver, api, windows)
    driver.run('CacheWorld', 60,
               'Validated cache coefficients yield unchanged source certificates')
    driver.summary['cache_world_source_checker_agreement_checked'] = True
    lookup_world_pilot.controls(driver, api)
    driver.run('CacheWorldControls', 60,
               'Fast coefficients preserve real write and source-count controls')
    driver.summary['cache_world_actual_source_controls_checked'] = True
    driver.run('CacheWorldNegative', 45, negative=True)
    driver.summary['cache_world_kernel_corruption_rejected'] = True
    driver.checkpoint()
