#!/usr/bin/env python3
"""Remote-only universal window certificate and operation working-set prototype."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')


SOURCE = r'''open ConjectureMachines.Optimisation
open LookupCachePilot LookupWorldPilot
namespace WorkingViewPilot
set_option backward.isDefEq.respectTransparency false

structure Window where
  start : Nat
  finish : Nat
  cache : Balanced.RowTree Cell

noncomputable def checkWindow (w : Window) : Bool :=
  decide (validate w.cache w.start = some w.finish) && decide (w.finish ≤ 573802)

noncomputable def checks (windows : List Window) : Bool := windows.all checkWindow

def Fidelity (w : Window) : Prop :=
  validate w.cache w.start = some w.finish ∧
    w.cache.count = w.finish - w.start ∧ w.finish ≤ 573802 ∧
    (∀ address, cachedClass w.cache w.start w.finish address = mapTree.lookup address 0) ∧
    (∀ address, cachedPair w.cache w.start w.finish address = observedPair address)

theorem window_properties (w : Window) (checked : checkWindow w = true) : Fidelity w := by
  have parts : decide (validate w.cache w.start = some w.finish) = true ∧
      decide (w.finish ≤ 573802) = true := by
    simpa only [checkWindow, Bool.and_eq_true] using checked
  have valid := of_decide_eq_true parts.1
  have extent := validate_extent w.cache w.start w.finish valid
  have exactCount : w.cache.count = w.finish - w.start := by omega
  exact ⟨valid, exactCount, of_decide_eq_true parts.2,
    cachedClass_eq w.cache w.start w.finish valid,
    cachedPair_eq w.cache w.start w.finish valid⟩

theorem all_properties (windows : List Window) (checked : checks windows = true) :
    ∀ w ∈ windows, Fidelity w := by
  intro w member
  have allChecked : windows.all checkWindow = true := checked
  exact window_properties w (List.all_eq_true.mp allChecked w member)

noncomputable def overlay (base : World) (w : Window) : World where
  classAt address := if w.start ≤ address ∧ address < w.finish then
    cachedClass w.cache w.start w.finish address else base.classAt address
  pairAt address := if w.start ≤ address ∧ address < w.finish then
    cachedPair w.cache w.start w.finish address else base.pairAt address

theorem overlay_correct (base : World) (correct : base = actualWorld)
    (w : Window) (checked : checkWindow w = true) : overlay base w = actualWorld := by
  cases correct
  have valid := (window_properties w checked).1
  have classes : (overlay actualWorld w).classAt = actualWorld.classAt := by
    funext address
    change (if w.start ≤ address ∧ address < w.finish then
      cachedClass w.cache w.start w.finish address else mapTree.lookup address 0) =
        mapTree.lookup address 0
    simp only [cachedClass_eq w.cache w.start w.finish valid, ite_self]
  have pairs : (overlay actualWorld w).pairAt = actualWorld.pairAt := by
    funext address
    change (if w.start ≤ address ∧ address < w.finish then
      cachedPair w.cache w.start w.finish address else observedPair address) = observedPair address
    simp only [cachedPair_eq w.cache w.start w.finish valid, ite_self]
  exact congrArg₂ World.mk classes pairs

noncomputable def world : List Window → World
  | [] => actualWorld
  | w :: windows => overlay (world windows) w

theorem world_correct (windows : List Window) (checked : checks windows = true) :
    world windows = actualWorld := by
  induction windows with
  | nil => rfl
  | cons w windows ih =>
    have parts : checkWindow w = true ∧ checks windows = true := by
      simpa only [checks, List.all_cons, Bool.and_eq_true] using checked
    exact overlay_correct (world windows) (ih parts.2) w parts.1

noncomputable def fromRaw (windows : List Window) (checked : checks windows = true)
    (q : Fin 4042) (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe (world windows) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  LookupWorldPilot.fromRaw (world windows) (world_correct windows checked)
    q raw nodes returns truth

end WorkingViewPilot
'''


def generate_core(driver, api):
    names = ['Window', 'checkWindow', 'checks', 'Fidelity', 'window_properties',
             'all_properties', 'overlay', 'overlay_correct', 'world', 'world_correct', 'fromRaw']
    driver.emit('WorkingViews.lean', api.header([api.MODULE + '.LookupWorld',
                api.MODULE + '.LookupCache']) + SOURCE + api.audit_and_end(
                driver, 'WorkingViews', ['WorkingViewPilot.' + n for n in names],
                'Universal window-list fidelity and working-set source transport checked'))


def labels(row):
    tag = row[0]
    if tag in (0, 3):
        return [row[2]]
    if tag in (1, 2):
        return [row[3]]
    if tag == 4:
        return row[1:3]
    if tag in (5, 6):
        return row[2:4]
    if tag == 7:
        return row[1]
    assert tag == 8
    return []


def prepare(driver, api, data, operations, cases, main_views):
    import lookup_cache_pilot
    generate_core(driver, api)
    mapping = api.words(driver.args.input / 'class-map.u32le', api.N)
    path = api.ROOT / api.PREFIX / 'quotient-packed.rows'
    pairs = [tuple(map(int, line.split())) for line in path.read_text().splitlines()]
    parts = [api.header([api.MODULE + '.LookupCacheLoaders'])]
    roots, result, proposed = [], {}, {}
    for q in cases:
        outgoing = labels(operations[q])
        assert all(type(label) is int and 0 <= label < 4042 for label in outgoing)
        own = data['return_offsets'][q]
        own_count = len(data['return_local_targets'][q])
        ranges = [(533342 + 5 * own, 5 * own_count, 'Own')]
        for target in sorted(set(outgoing) - {q}):
            ranges.append((533342 + 5 * data['return_offsets'][target], 5, f'D{target}'))
        ranges.append((533341, 1, 'Halt'))
        main = main_views[q]
        windows = [dict(start=main['start'], finish=main['finish'],
                        cache=main['stem'] + 'Pilot.cache')]
        for start, count, suffix in ranges:
            assert 533341 <= start < start + count <= 573802
            stem = f'Working{q}{suffix}'
            fragment = lookup_cache_pilot.generate_data(driver, api, count,
                start=start, stem=stem, fragments_only=True, observations=(mapping, pairs))
            parts.append(fragment['data'])
            roots += fragment['data_roots']
            windows.append(dict(start=start, finish=start + count,
                                cache=fragment['namespace'] + '.cache',
                                summary_key=fragment['summary_key']))
        result[q] = windows
        proposed[q] = dict(labels=outgoing, window_count=len(windows),
                           own_return_prefix=own, no_fallback_claim=False)
    driver.emit('WorkingCacheData.lean', ''.join(parts) + api.audit_and_end(
        driver, 'WorkingCacheData', roots, 'Working-set return and target data loaded'))
    driver.summary['working_set_proposed'] = dict(cases=proposed, windows=result, generic_roots=11,
        kernel_checked=False, substantial_source_scaling_established=False,
        new_accepted_machine=False)
    return result


def emit_sets(driver, api, cases, windows, main_views):
    imports = [api.MODULE + '.WorkingViews', api.MODULE + '.WorkingCacheData']
    imports += [api.MODULE + '.' + main_views[q]['stem'] for q in cases]
    parts = [api.header(imports), 'namespace WorkingSetsPilot\n']
    roots = []
    for q in cases:
        parts.append(f'noncomputable def windows_{q} : List WorkingViewPilot.Window := [\n')
        parts.append(',\n'.join(f'  ⟨{w["start"]}, {w["finish"]}, {w["cache"]}⟩'
                                  for w in windows[q]))
        parts.append('\n]\n'
                     f'theorem checked_{q} : WorkingViewPilot.checks windows_{q} = true := by\n'
                     '  decide +kernel\n'
                     f'theorem fidelity_{q} : ∀ w ∈ windows_{q}, WorkingViewPilot.Fidelity w :=\n'
                     f'  WorkingViewPilot.all_properties windows_{q} checked_{q}\n')
        roots += ['WorkingSetsPilot.' + name + '_' + str(q) for name in
                  ['windows', 'checked', 'fidelity']]
    parts.append('end WorkingSetsPilot\n')
    driver.emit('WorkingSets.lean', ''.join(parts) + api.audit_and_end(
        driver, 'WorkingSets', roots, 'All proposed working-set windows certified as a family'))


def build(driver):
    driver.run('WorkingViews', 60,
               'Universal window-list fidelity and working-set source transport checked')
    driver.run('WorkingCacheData', 60, 'Working-set return and target data loaded')
    driver.run('WorkingSets', 60, 'All proposed working-set windows certified as a family')
    for q, windows in driver.summary['working_set_proposed']['windows'].items():
        for window in windows:
            if 'summary_key' in window:
                metadata = driver.summary[window['summary_key']]
                metadata['kernel_checked'] = True
                metadata['fidelity_certificate'] = f'WorkingSetsPilot.fidelity_{q}'
    driver.summary['working_set_proposed']['kernel_checked'] = True
    driver.checkpoint()
