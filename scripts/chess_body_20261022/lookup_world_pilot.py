#!/usr/bin/env python3
"""Remote-only coefficient substitution for the unchanged source certificates."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')


PRELUDE = r'''open ConjectureMachines.Optimisation
open Chess.Optimisation FieldCompiler PrefixScanPilot NumericLocalPilot LocalRulePilot
open DirectCheckPilot StructuralCheckPilot SourceScopeToolsPilot SourceRecipePilot
open RawLabelPilot RawChunkPilot
namespace LookupWorldPilot
set_option backward.isDefEq.respectTransparency false

structure World where
  classAt : Nat → Nat
  pairAt : Nat → Nat × Nat

noncomputable def actualWorld : World where
  classAt address := mapTree.lookup address 0
  pairAt address := quotientTree.lookup (mapTree.lookup address 0) (0, 0)

def commandWord (world : World) (written : Bool) (dir : Dir) (address : Nat) : Nat :=
  (4 * world.classAt address + 2 * packedDirCode dir + (if written then 1 else 0)) + 1

def rowWord (world : World) (address : Nat) (bit : Bool) : Nat :=
  let row := world.pairAt address
  if bit then row.2 else row.1

def checkPair (world : World) (address zeroWord oneWord : Nat) : Bool :=
  match world.pairAt address with
  | (first, second) => (first == zeroWord) && (second == oneWord)

theorem commandWord_eq (world : World) (correct : world = actualWorld)
    (written : Bool) (dir : Dir) (address : Nat) :
    commandWord world written dir address = NumericLocalPilot.commandWord written dir address := by
  cases correct
  rfl

theorem rowWord_eq (world : World) (correct : world = actualWorld)
    (address : Nat) (bit : Bool) :
    rowWord world address bit = NumericLocalPilot.rowWord address bit := by
  cases correct
  rfl

theorem checkPair_eq (world : World) (correct : world = actualWorld)
    (address zeroWord oneWord : Nat) :
    checkPair world address zeroWord oneWord =
      DirectCheckPilot.checkPair address zeroWord oneWord := by
  cases correct
  rfl

'''


AGREEMENT = r'''
theorem checkNode_eq (world : World) (correct : world = actualWorld)
    (q : Fin 4042) (p : Syntax 4042) (slot : Fin p.size)
    (node : BoolGraph.Node p.size 5 4042) :
    checkNode world q p slot node = DirectCheckPilot.checkNode q p slot node := by
  cases node <;>
    simp only [checkNode, DirectCheckPilot.checkNode, checkPair_eq world correct,
      commandWord_eq world correct, rowWord_eq world correct]
  all_goals rfl

theorem checkReturns_eq (world : World) (correct : world = actualWorld)
    (q : Fin 4042) (p : Syntax 4042) :
    checkReturns world q p = DirectCheckPilot.checkReturns q p := by
  simp only [checkReturns, DirectCheckPilot.checkReturns, checkPair_eq world correct,
    commandWord_eq world correct]

theorem rootCheck_eq (world : World) (correct : world = actualWorld)
    (q : Fin 4042) (whole : Syntax 4042) (offset : Nat)
    (sub : Syntax 4042) (fits : offset + sub.size ≤ whole.size) :
    rootCheck world q whole offset sub fits =
      StructuralCheckPilot.rootCheck q whole offset sub fits := by
  simp only [rootCheck, StructuralCheckPilot.rootCheck, checkNode_eq world correct]

theorem checkSub_eq (world : World) (correct : world = actualWorld)
    (q : Fin 4042) (whole : Syntax 4042) (offset : Nat)
    (sub : Syntax 4042) (fits : offset + sub.size ≤ whole.size) :
    checkSub world q whole offset sub fits =
      StructuralCheckPilot.checkSub q whole offset sub fits := by
  induction sub generalizing offset with
  | move d rest ih | write d rest ih | load d rest ih =>
    simp only [checkSub, StructuralCheckPilot.checkSub, rootCheck_eq world correct, ih]
  | branch t yes no ihYes ihNo =>
    simp only [checkSub, StructuralCheckPilot.checkSub, rootCheck_eq world correct, ihYes, ihNo]
  | go t | halt =>
    exact rootCheck_eq world correct q whole offset _ fits

theorem checkMain_eq (world : World) (correct : world = actualWorld)
    (q : Fin 4042) (whole : Syntax 4042) :
    checkMain world q whole = StructuralCheckPilot.checkMain q whole := by
  exact checkSub_eq world correct q whole 0 whole _

theorem checkRecipe_eq (world : World) (correct : world = actualWorld)
    (q : Fin 4042) (raw : RawLabelPilot.RawOp) (nodes returns : Nat) :
    checkRecipe world q raw nodes returns = SourceRecipePilot.checkRecipe q raw nodes returns := by
  simp only [checkRecipe, SourceRecipePilot.checkRecipe, checkMain_eq world correct,
    checkReturns_eq world correct]

noncomputable def fromRaw (world : World) (correct : world = actualWorld)
    (q : Fin 4042) (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (checked : checkRecipe world q raw nodes returns = true) : SourceCertificate :=
  SourceRecipePilot.fromRaw q raw nodes returns
    ((checkRecipe_eq world correct q raw nodes returns).symm.trans checked)

end LookupWorldPilot
'''


def _definition(source, first, following):
    """Reuse the exact reviewed checker shape, changing its coefficients only."""
    assert source.count(first) == 1 and source.count(following) == 1
    return source.split(first, 1)[1].split(following, 1)[0]


def _wrap_definitions(source):
    """Whitespace-only wrapping for expression definitions, never tactic blocks."""
    lines = []
    for line in source.splitlines():
        continuation = ' ' * (len(line) - len(line.lstrip()) + 4)
        while len(line) > 100:
            assert '--' not in line and '"' not in line
            split = line.rfind(' ', len(continuation), 96)
            assert split > len(continuation), line
            lines.append(line[:split])
            line = continuation + line[split + 1:]
        lines.append(line)
    return '\n'.join(lines) + '\n'


def generate(driver, api):
    import direct_check_pilot
    import structural_check_pilot
    import source_recipe_pilot
    node = 'noncomputable def checkNode' + _definition(
        direct_check_pilot.SOURCE, 'noncomputable def checkNode', 'theorem checkNode_sound')
    returned = 'noncomputable def checkReturns' + _definition(
        direct_check_pilot.SOURCE, 'noncomputable def checkReturns', 'theorem checkReturns_sound')
    structural = 'noncomputable def rootCheck' + _definition(
        structural_check_pilot.SOURCE, 'noncomputable def rootCheck', 'def SubRows')
    main = 'noncomputable def checkMain' + _definition(
        structural_check_pilot.SOURCE, 'noncomputable def checkMain', 'theorem checkMain_sound')
    recipe = 'noncomputable def checkRecipe' + _definition(
        source_recipe_pilot.SOURCE, 'noncomputable def checkRecipe', 'noncomputable def fromRaw')
    # Definitions and calls receive a World. Prefix/address/syntax computations
    # and all original finite domains are unchanged. No soundness proof is copied.
    for name in ['checkNode', 'checkReturns', 'rootCheck', 'checkSub', 'checkMain', 'checkRecipe']:
        token = 'def ' + name + ' '
        node = node.replace(token, token + '(world : World) ')
        returned = returned.replace(token, token + '(world : World) ')
        structural = structural.replace(token, token + '(world : World) ')
        main = main.replace(token, token + '(world : World) ')
        recipe = recipe.replace(token, token + '(world : World) ')
    node = node.replace('checkPair ', 'checkPair world ').replace(
        'commandWord ', 'commandWord world ').replace('rowWord ', 'rowWord world ')
    returned = returned.replace('checkPair\n', 'checkPair world\n').replace(
        'commandWord ', 'commandWord world ')
    structural = structural.replace('DirectCheckPilot.checkNode ', 'checkNode world ')
    structural = structural.replace('rootCheck q ', 'rootCheck world q ').replace(
        'checkSub q ', 'checkSub world q ')
    main = main.replace('  checkSub ', '  checkSub world ')
    recipe = recipe.replace('StructuralCheckPilot.checkMain ', 'checkMain world ').replace(
        'DirectCheckPilot.checkReturns ', 'checkReturns world ')
    definitions = _wrap_definitions(node + returned + structural + main + recipe)
    source = PRELUDE + definitions + AGREEMENT
    names = ['World', 'actualWorld', 'commandWord', 'rowWord', 'checkPair',
             'commandWord_eq', 'rowWord_eq', 'checkPair_eq', 'checkNode', 'checkReturns',
             'rootCheck', 'checkSub', 'checkMain', 'checkRecipe', 'checkNode_eq',
             'checkReturns_eq', 'rootCheck_eq', 'checkSub_eq', 'checkMain_eq',
             'checkRecipe_eq', 'fromRaw']
    driver.emit('LookupWorld.lean', api.header([api.MODULE + '.SourceRecipes']) + source +
                api.audit_and_end(driver, 'LookupWorld', ['LookupWorldPilot.' + n for n in names],
                    'Coefficient substitution preserves every original source obligation'))


def controls(driver, api, stem='CacheWorld', world_expr='CacheWorldPilot.cacheWorld',
             maker_expr='CacheWorldPilot.fromCachedRaw', imports=None):
    anchor = driver.summary['local_chunk_proposed']['anchor_write_label']
    nodes = driver.summary['recipe_anchor_nodes']
    returns = driver.summary['recipe_anchor_returns']
    namespace = stem + 'ControlsPilot'
    source = f'''open ConjectureMachines.Optimisation
open Chess.Optimisation FieldCompiler LocalChunkPilot
namespace {namespace}

theorem anchor_recipe : LookupWorldPilot.checkRecipe
    {world_expr}
    label_{anchor} raw_{anchor}
    {nodes} {returns} = true := by decide +kernel

noncomputable def anchor_certificate : SourceScopeToolsPilot.SourceCertificate :=
  {maker_expr} label_{anchor} raw_{anchor} {nodes} {returns} anchor_recipe

theorem wrong_node_count_rejected :
    LookupWorldPilot.checkRecipe
      {world_expr}
      label_{anchor} raw_{anchor}
      {nodes + 1} {returns} = false := by decide +kernel

theorem wrong_return_count_rejected :
    LookupWorldPilot.checkRecipe
      {world_expr}
      label_{anchor} raw_{anchor}
      {nodes} {returns + 1} = false := by decide +kernel

end {namespace}
'''
    roots = ['anchor_recipe', 'anchor_certificate', 'wrong_node_count_rejected',
             'wrong_return_count_rejected']
    driver.emit(stem + 'Controls.lean',
                api.header(imports or [api.MODULE + '.CacheWorld']) + source +
                api.audit_and_end(driver, stem + 'Controls',
                    [namespace + '.' + name for name in roots],
                    'Fast coefficients preserve real write and source-count controls'))
    negative = f'''module
public import {api.MODULE}.{stem}Controls
public meta import Lean
public meta section
open Lean Elab Term Meta Command

elab "submit_false_cached_recipe" : command => do
  liftTermElabM do
    let name := `{api.NS}.{namespace}.anchor_recipe
    let info ← getConstInfo name
    let equality ← whnf info.type
    unless equality.isAppOfArity ``Eq 3 do throwError "Expected recipe equality"
    let args := equality.getAppArgs
    unless args[0]!.isConstOf ``Bool do throwError "Expected checked Bool"
    let proposition ← mkEq args[1]! (Lean.mkConst ``Bool.false)
    Lean.addDecl (.thmDecl {{
      name := `{api.NS}.deliberately_false_cached_recipe
      levelParams := []
      type := proposition
      value := Lean.mkConst name
    }}) true
submit_false_cached_recipe
'''
    driver.emit(stem + 'Negative.lean', negative)
