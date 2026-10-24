#!/usr/bin/env python3
"""Remote-only reusable correctness certificate for operation-local cache views."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')


SOURCE = r'''open ConjectureMachines.Optimisation
open LookupCachePilot LookupWorldPilot
namespace LocalViewPilot
set_option backward.isDefEq.respectTransparency false

noncomputable def world (main : Balanced.RowTree Cell) (start finish : Nat) : World where
  classAt address := if start ≤ address ∧ address < finish then
    cachedClass main start finish address else
    cachedClass SourceReturnCachePilot.cache 533341 573802 address
  pairAt address := if start ≤ address ∧ address < finish then
    cachedPair main start finish address else
    cachedPair SourceReturnCachePilot.cache 533341 573802 address

theorem world_correct (main : Balanced.RowTree Cell) (start finish : Nat)
    (checked : validate main start = some finish) : world main start finish = actualWorld := by
  have classes : (world main start finish).classAt = actualWorld.classAt := by
    funext address
    change (if start ≤ address ∧ address < finish then cachedClass main start finish address
      else cachedClass SourceReturnCachePilot.cache 533341 573802 address) =
        mapTree.lookup address 0
    simp only [cachedClass_eq main start finish checked,
      SourceReturnCachePilot.all_cached_classes, ite_self]
  have pairs : (world main start finish).pairAt = actualWorld.pairAt := by
    funext address
    change (if start ≤ address ∧ address < finish then cachedPair main start finish address
      else cachedPair SourceReturnCachePilot.cache 533341 573802 address) = observedPair address
    simp only [cachedPair_eq main start finish checked,
      SourceReturnCachePilot.all_cached_words, ite_self]
  exact congrArg₂ World.mk classes pairs

noncomputable def fromLocalRaw (main : Balanced.RowTree Cell) (start finish : Nat)
    (checked : validate main start = some finish) (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe (world main start finish) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  LookupWorldPilot.fromRaw (world main start finish) (world_correct main start finish checked)
    q raw nodes returns truth

end LocalViewPilot
'''


def generate_core(driver, api):
    driver.emit('LocalViews.lean', api.header([api.MODULE + '.LookupWorld',
                api.MODULE + '.SourceReturnCache']) + SOURCE + api.audit_and_end(
                driver, 'LocalViews', ['LocalViewPilot.' + n for n in
                ['world', 'world_correct', 'fromLocalRaw']],
                'Operation-local views globally preserve original lookup coefficients'))


def prepare(driver, api, data, labels):
    import lookup_cache_pilot
    generate_core(driver, api)
    views = {}
    for q in labels:
        base, nodes = data['prefix_offsets'][q], data['row_sizes'][q]
        start, count = 1 + 5 * base, 5 * nodes
        assert 1 < start < start + count <= 533341
        stem = f'ProfileCache{q}'
        lookup_cache_pilot.generate_data(driver, api, count, start=start, stem=stem)
        views[q] = dict(stem=stem, start=start, finish=start + count, base=base,
                        entries=count, kernel_checked=False)
    driver.summary['operation_local_view_proposed'] = dict(
        cases=views, generic_roots=3, kernel_checked=False,
        substantial_source_scaling_established=False, new_accepted_machine=False)
    return views


def build(driver, views):
    driver.run('LocalViews', 60,
               'Operation-local views globally preserve original lookup coefficients')
    for q, view in views.items():
        stem, count = view['stem'], view['entries']
        driver.run(stem + 'Data', 60, f'Numeric observation cache data loaded: {count}')
        driver.run(stem, 60, f'Numeric observation cache fidelity checked: {count}')
        view['kernel_checked'] = True
        driver.summary[stem + '_proposed']['kernel_checked'] = True
        driver.checkpoint()
    driver.summary['operation_local_view_proposed']['kernel_checked'] = True
    driver.checkpoint()
