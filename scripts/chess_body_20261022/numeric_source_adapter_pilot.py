#!/usr/bin/env python3
"""Remote-only exact map/Q and original-source binding for numeric certificates."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')


SOURCE = r'''open ConjectureMachines.Optimisation
open Chess.Optimisation FieldCompiler PrefixScanPilot NumericLocalPilot
open RawLabelPilot RawChunkPilot SourceRecipePilot SourceScopeToolsPilot
namespace NumericSourceAdapterPilot
set_option backward.isDefEq.respectTransparency false
attribute [local irreducible] FieldPacked.getter FieldPacked.layout
attribute [local irreducible] FieldAware.syntaxRows FieldSelectiveLayout.code

noncomputable def observation : NumericControlPilot.Observation where
  pairAt address := quotientTree.lookup (mapTree.lookup address 0) (0, 0)
  command := NumericLocalPilot.commandWord

noncomputable def layout (base returned : Nat) (targets : List Nat) :
    NumericControlPilot.Layout where
  main slot value := mainAddress (base + slot) value
  returned rank value := returnAddress returned rank value
  entry label value := returnAddress (returnPrefixes.lookup label.val 0) 0 value
  halt := 533341
  targets := targets

noncomputable def sourceLayout (q : Fin 4042) : NumericControlPilot.Layout :=
  layout (nodePrefixes.lookup q.val 0) (returnPrefixes.lookup q.val 0) []

theorem typedStep_eq (q : Fin 4042) (p : Syntax 4042)
    (node : BoolGraph.Node p.size 5 4042) (bit : Bool) (value : Fin 5) :
    NumericSourceCorePilot.typedStep observation (sourceLayout q) p node bit value =
      LocalRulePilot.stepWord q p node bit value := by
  cases node <;> rfl

theorem coherent_of (q : Fin 4042) (p : Syntax 4042)
    (checked : NumericSourceCorePilot.Coherent observation (sourceLayout q) p) :
    LocalRulePilot.Coherent q p := by
  intro slot bit value
  have word := checked slot bit value
  simpa only [typedStep_eq, Syntax.fastNodeAt_eq, NumericControlPilot.rowWord,
    observation, sourceLayout, layout, NumericLocalPilot.rowWord] using word

theorem returned_of (q : Fin 4042) (p : Syntax 4042)
    (checked : NumericSourceCorePilot.ReturnCoherent observation (sourceLayout q) p) :
    LocalRulePilot.ReturnCoherent q p := by
  intro rank bit value
  exact checked rank bit value

noncomputable def checkRecipe (q : Fin 4042) (raw : RawOp)
    (fragment : NumericTreePilot.Fragment) (base returned nodes returns : Nat) : Bool :=
  decide (erase (toTableOp (Snapshot.program q)) = raw) &&
    (decide (fragment = NumericTreePilot.encode 0 (syntaxOf raw)) &&
      (decide (base = nodePrefixes.lookup q.val 0) &&
        (decide (returned = returnPrefixes.lookup q.val 0) &&
          (decide (fragment.count = nodes) &&
            (decide ((NumericTreePilot.paidTargets fragment).length = returns) &&
              (NumericControlPilot.checkTrace observation
                (layout base returned (NumericTreePilot.paidTargets fragment)) fragment.trace &&
                NumericControlPilot.checkReturns observation
                  (layout base returned (NumericTreePilot.paidTargets fragment))))))))

noncomputable def fromRaw (q : Fin 4042) (raw : RawOp)
    (fragment : NumericTreePilot.Fragment) (base returned nodes returns : Nat)
    (checked : checkRecipe q raw fragment base returned nodes returns = true) :
    SourceCertificate := by
  have parts : erase (toTableOp (Snapshot.program q)) = raw ∧
      fragment = NumericTreePilot.encode 0 (syntaxOf raw) ∧
      base = nodePrefixes.lookup q.val 0 ∧ returned = returnPrefixes.lookup q.val 0 ∧
      fragment.count = nodes ∧ (NumericTreePilot.paidTargets fragment).length = returns ∧
      NumericControlPilot.checkTrace observation
        (layout base returned (NumericTreePilot.paidTargets fragment)) fragment.trace = true ∧
      NumericControlPilot.checkReturns observation
        (layout base returned (NumericTreePilot.paidTargets fragment)) = true := by
    simpa only [checkRecipe, Bool.and_eq_true, decide_eq_true_eq] using checked
  rcases parts with ⟨same, exactFragment, baseEq, returnedEq, nodeEq, returnsEq, main, bounce⟩
  subst fragment
  subst base
  subst returned
  have mainRows := NumericSourceCorePilot.checkMain_sound observation (sourceLayout q)
    (syntaxOf raw) main
  have returnRows := NumericSourceCorePilot.checkReturns_sound observation (sourceLayout q)
    (syntaxOf raw) bounce
  exact makeCertificate q (syntaxOf raw) (source_syntax q raw same) nodes returns
    (by simpa only [NumericTreePilot.encode_count] using nodeEq)
    (by simpa only [NumericTreePilot.paidTargets_length] using returnsEq)
    (coherent_of q (syntaxOf raw) mainRows) (returned_of q (syntaxOf raw) returnRows)

end NumericSourceAdapterPilot
'''


def generate(driver, api):
    names = ['observation', 'layout', 'sourceLayout', 'typedStep_eq', 'coherent_of',
             'returned_of', 'checkRecipe', 'fromRaw']
    driver.emit('NumericSourceAdapter.lean', api.header([api.MODULE + '.NumericSourceCore',
        api.MODULE + '.SourceRecipes']) + SOURCE + api.audit_and_end(driver,
        'NumericSourceAdapter', ['NumericSourceAdapterPilot.' + n for n in names],
        'Numeric checker yields unchanged actual frozen source certificates'))
    driver.summary['numeric_source_adapter_proposed'] = dict(required_roots=len(names),
        kernel_checked=False, no_extra_source_hypothesis=True, no_observation_cache=True,
        raw_fragment_prefix_count_and_all_rows_checked=True, new_accepted_machine=False)
    driver.checkpoint()


def run(driver, api):
    generate(driver, api)
    driver.run('NumericSourceAdapter', 60,
               'Numeric checker yields unchanged actual frozen source certificates')
    driver.summary['numeric_source_adapter_proposed']['kernel_checked'] = True
    driver.summary['numeric_source_adapter_checked'] = True
    driver.checkpoint()
