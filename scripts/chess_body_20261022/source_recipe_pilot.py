#!/usr/bin/env python3
"""Remote-only compact source recipes; each truth proof covers every obligation."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')


SOURCE = r'''open ConjectureMachines.Optimisation
open Chess.Optimisation FieldCompiler RawLabelPilot RawChunkPilot LocalRulePilot
open SourceScopeToolsPilot
namespace SourceRecipePilot
set_option backward.isDefEq.respectTransparency false
attribute [local irreducible] FieldPacked.getter FieldPacked.layout
attribute [local irreducible] FieldAware.syntaxRows FieldSelectiveLayout.code

noncomputable def syntaxOf (raw : RawOp) : Syntax 4042 :=
  lower ((restore 4042 raw).getD .halt)

theorem source_syntax (q : Fin 4042) (raw : RawOp)
    (same : erase (toTableOp (Snapshot.program q)) = raw) :
    FieldPacked.syntaxRows.get q = syntaxOf raw :=
  (FieldAware.syntaxRows_get q).trans
    (congrArg lower (LocalChunkPilot.restored_literal (Snapshot.program q) raw same)).symm

-- No independently elaborated concrete Coherent, ReturnCoherent, source
-- transport, count, or duplicate main_rows/return_rows declarations are needed.
noncomputable def checkRecipe (q : Fin 4042) (raw : RawOp) (nodes returns : Nat) : Bool :=
  let p := syntaxOf raw
  decide (erase (toTableOp (Snapshot.program q)) = raw) &&
    (decide (p.size = nodes) &&
      (decide (1 + FieldReturns.writeCount p = returns) &&
        (StructuralCheckPilot.checkMain q p && DirectCheckPilot.checkReturns q p)))

noncomputable def fromRaw (q : Fin 4042) (raw : RawOp) (nodes returns : Nat)
    (checked : checkRecipe q raw nodes returns = true) : SourceCertificate := by
  have parts : decide (erase (toTableOp (Snapshot.program q)) = raw) = true ∧
      decide ((syntaxOf raw).size = nodes) = true ∧
      decide (1 + FieldReturns.writeCount (syntaxOf raw) = returns) = true ∧
      StructuralCheckPilot.checkMain q (syntaxOf raw) = true ∧
      DirectCheckPilot.checkReturns q (syntaxOf raw) = true := by
    simpa only [checkRecipe, Bool.and_eq_true] using checked
  exact makeCertificate q (syntaxOf raw) (source_syntax q raw (of_decide_eq_true parts.1))
    nodes returns (of_decide_eq_true parts.2.1) (of_decide_eq_true parts.2.2.1)
    (StructuralCheckPilot.checkMain_sound q (syntaxOf raw) parts.2.2.2.1)
    (DirectCheckPilot.checkReturns_sound q (syntaxOf raw) parts.2.2.2.2)

end SourceRecipePilot
'''


def generate(driver, header, audit_and_end, module):
    names = ['syntaxOf', 'source_syntax', 'checkRecipe', 'fromRaw']
    driver.emit('SourceRecipes.lean', header([module + '.SourceScopeTools',
                module + '.LocalChunk']) + SOURCE + audit_and_end(driver, 'SourceRecipes',
                    ['SourceRecipePilot.' + name for name in names],
                    'Compact source recipes preserve every row and census obligation'))


def controls(driver, header, audit_and_end, module, ns):
    anchor = driver.summary['local_chunk_proposed']['anchor_write_label']
    # Exercise a real source write with multiple paid return ranks.
    source = f'''open ConjectureMachines.Optimisation
open Chess.Optimisation FieldCompiler LocalChunkPilot SourceRecipePilot
namespace RecipeControlsPilot

theorem anchor_recipe : checkRecipe label_{anchor} raw_{anchor}
    {driver.summary['recipe_anchor_nodes']} {driver.summary['recipe_anchor_returns']} = true := by
  decide +kernel

noncomputable def anchor_certificate : SourceScopeToolsPilot.SourceCertificate :=
  fromRaw label_{anchor} raw_{anchor}
    {driver.summary['recipe_anchor_nodes']} {driver.summary['recipe_anchor_returns']} anchor_recipe

theorem wrong_node_count_rejected : checkRecipe label_{anchor} raw_{anchor}
    {driver.summary['recipe_anchor_nodes'] + 1}
    {driver.summary['recipe_anchor_returns']} = false := by decide +kernel

theorem wrong_return_count_rejected : checkRecipe label_{anchor} raw_{anchor}
    {driver.summary['recipe_anchor_nodes']}
    {driver.summary['recipe_anchor_returns'] + 1} = false := by decide +kernel

end RecipeControlsPilot
'''
    driver.emit('RecipeControls.lean', header([module + '.SourceRecipes']) + source + audit_and_end(
        driver, 'RecipeControls', ['RecipeControlsPilot.' + name for name in
        ['anchor_recipe', 'anchor_certificate', 'wrong_node_count_rejected',
         'wrong_return_count_rejected']], 'Compact recipe actual source and count controls checked'))
    negative = f'''module
public import {module}.RecipeControls
public meta import Lean
public meta section
open Lean Elab Term Meta Command

elab "submit_false_recipe" : command => do
  liftTermElabM do
    let name := `{ns}.RecipeControlsPilot.anchor_recipe
    let info ← getConstInfo name
    let equality ← whnf info.type
    unless equality.isAppOfArity ``Eq 3 do throwError "Expected recipe equality"
    let args := equality.getAppArgs
    unless args[0]!.isConstOf ``Bool do throwError "Expected checked Bool"
    let proposition ← mkEq args[1]! (Lean.mkConst ``Bool.false)
    Lean.addDecl (.thmDecl {{
      name := `{ns}.deliberately_false_recipe
      levelParams := []
      type := proposition
      value := Lean.mkConst name
    }}) true
submit_false_recipe
'''
    driver.emit('RecipeNegative.lean', negative)
