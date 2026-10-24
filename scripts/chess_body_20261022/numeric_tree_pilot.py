#!/usr/bin/env python3
"""Remote-only decorated numeric syntax; no concrete source-row credit."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')


SOURCE = r'''open ConjectureMachines.Compilation
open Chess.Optimisation FieldCompiler
namespace NumericTreePilot
set_option backward.isDefEq.respectTransparency false

inductive Node where
  | move (dir : Turing.Dir) (child : Nat)
  | write (table : BoolGraph.Table 5 Bool) (child : Nat)
  | load (table : BoolGraph.Table 5 (Fin 5)) (child : Nat)
  | branch (table : BoolGraph.Table 5 Bool) (yes no : Nat)
  | go (table : BoolGraph.Table 5 (Fin 4042))
  | halt
  deriving DecidableEq

def eraseNode {n : Nat} : BoolGraph.Node n 5 4042 → Node
  | .move dir child => .move dir child.val
  | .write table child => .write table child.val
  | .load table child => .load table child.val
  | .branch table yes no => .branch table yes.val no.val
  | .goto table => .go table
  | .halt => .halt

def mapChild (f : Nat → Nat) : Node → Node
  | .move dir child => .move dir (f child)
  | .write table child => .write table (f child)
  | .load table child => .load table (f child)
  | .branch table yes no => .branch table (f yes) (f no)
  | .go table => .go table
  | .halt => .halt

theorem mapChild_id (node : Node) : mapChild id node = node := by
  cases node <;> rfl

theorem mapChild_comp (f g : Nat → Nat) (node : Node) :
    mapChild g (mapChild f node) = mapChild (g ∘ f) node := by
  cases node <;> rfl

theorem eraseNode_map {a b : Nat} (f : Fin a → Fin b) (g : Nat → Nat)
    (same : ∀ i, (f i).val = g i.val) (node : BoolGraph.Node a 5 4042) :
    eraseNode (TemplateGraph.mapNode f node) = mapChild g (eraseNode node) := by
  cases node <;> simp only [TemplateGraph.mapNode, eraseNode, mapChild, same]

inductive Trace where
  | leaf (slot : Nat) (node : Node)
  | unary (slot : Nat) (node : Node) (rest : Trace)
  | branch (slot : Nat) (node : Node) (yes no : Trace)
  deriving DecidableEq

structure Fragment where
  count : Nat
  root : Nat
  trace : Trace
  targets : List Nat
  deriving DecidableEq

def encode (offset : Nat) : Syntax 4042 → Fragment
  | .move dir rest =>
      let next := encode offset rest
      ⟨next.count + 1, offset + next.count,
        .unary (offset + next.count) (.move dir next.root) next.trace, next.targets⟩
  | .write table rest =>
      let next := encode offset rest
      ⟨next.count + 1, offset + next.count,
        .unary (offset + next.count) (.write table next.root) next.trace,
        next.root :: next.targets⟩
  | .load table rest =>
      let next := encode offset rest
      ⟨next.count + 1, offset + next.count,
        .unary (offset + next.count) (.load table next.root) next.trace, next.targets⟩
  | .branch table yes no =>
      let left := encode offset yes
      let right := encode (offset + left.count) no
      let root := offset + left.count + right.count
      ⟨left.count + right.count + 1, root,
        .branch root (.branch table left.root right.root) left.trace right.trace,
        left.targets ++ right.targets⟩
  | .go table => ⟨1, offset, .leaf offset (.go table), []⟩
  | .halt => ⟨1, offset, .leaf offset .halt, []⟩
termination_by structural p => p

theorem encode_count (offset : Nat) (p : Syntax 4042) :
    (encode offset p).count = p.size := by
  induction p generalizing offset <;> simp_all only [encode, Syntax.size]

theorem encode_root (offset : Nat) (p : Syntax 4042) :
    (encode offset p).root = offset + p.root.val := by
  cases p <;> simp only [encode, encode_count, Syntax.root, Fin.val_last, Nat.add_zero,
    Nat.add_assoc]

def rootNode (offset : Nat) : Syntax 4042 → Node
  | .move dir rest => .move dir (offset + rest.root.val)
  | .write table rest => .write table (offset + rest.root.val)
  | .load table rest => .load table (offset + rest.root.val)
  | .branch table yes no => .branch table (offset + yes.root.val)
      (offset + yes.size + no.root.val)
  | .go table => .go table
  | .halt => .halt

def reference (offset : Nat) : Syntax 4042 → Trace
  | .move dir rest => .unary (offset + rest.size) (rootNode offset (.move dir rest))
      (reference offset rest)
  | .write table rest => .unary (offset + rest.size) (rootNode offset (.write table rest))
      (reference offset rest)
  | .load table rest => .unary (offset + rest.size) (rootNode offset (.load table rest))
      (reference offset rest)
  | .branch table yes no => .branch (offset + yes.size + no.size)
      (rootNode offset (.branch table yes no))
      (reference offset yes) (reference (offset + yes.size) no)
  | .go table => .leaf offset (.go table)
  | .halt => .leaf offset .halt

theorem encode_trace (offset : Nat) (p : Syntax 4042) :
    (encode offset p).trace = reference offset p := by
  induction p generalizing offset <;>
    simp_all only [encode, reference, rootNode, encode_count, encode_root]

theorem encode_targets (offset : Nat) (p : Syntax 4042) :
    (encode offset p).targets = (FieldReturns.writeTargets p).map (fun i ↦ offset + i.val) := by
  induction p generalizing offset <;>
    simp_all only [encode, FieldReturns.writeTargets, encode_count, encode_root,
      List.map_map, List.map_cons, List.map_nil, List.map_append, Function.comp_def,
      Fin.val_castSucc, Fin.val_castAdd, Fin.val_natAdd, Nat.add_assoc]

def paidTargets (fragment : Fragment) : List Nat := fragment.root :: fragment.targets

theorem paidTargets_correct (offset : Nat) (p : Syntax 4042) :
    paidTargets (encode offset p) =
      (FieldReturns.targets p).map (fun i ↦ offset + i.val) := by
  simp only [paidTargets, FieldReturns.targets, List.map_cons, encode_root, encode_targets]

theorem paidTargets_length (offset : Nat) (p : Syntax 4042) :
    (paidTargets (encode offset p)).length = 1 + FieldReturns.writeCount p := by
  simp only [paidTargets_correct, List.length_map, FieldReturns.targets_length]

theorem halt_count : (encode 0 (.halt : Syntax 4042)).count = 1 := rfl

theorem wrong_halt_annotation_rejected :
    decide ((encode 0 (.halt : Syntax 4042)).count = 2) = false := by decide +kernel

end NumericTreePilot
'''


def generate(driver, api):
    names = ['Node', 'eraseNode', 'mapChild', 'mapChild_id', 'mapChild_comp',
             'eraseNode_map', 'Trace', 'Fragment', 'encode', 'encode_count', 'encode_root',
             'rootNode', 'reference', 'encode_trace', 'encode_targets', 'paidTargets',
             'paidTargets_correct', 'paidTargets_length', 'halt_count',
             'wrong_halt_annotation_rejected']
    driver.emit('NumericTree.lean', api.header(['Cryptids.Compilation.FieldReturns.Syntax']) +
        SOURCE + api.audit_and_end(driver, 'NumericTree',
            ['NumericTreePilot.' + n for n in names],
            'Decorated numeric syntax preserves node positions and paid return targets'))
    negative = f'''module
public import {api.MODULE}.NumericTree
public meta import Lean
public meta section
open Lean Elab Term Meta Command
elab "submit_false_numeric_annotation" : command => do
  liftTermElabM do
    let name := `{api.NS}.NumericTreePilot.halt_count
    let info ← getConstInfo name
    let equality ← whnf info.type
    unless equality.isAppOfArity ``Eq 3 do throwError "Expected annotation equality"
    let args := equality.getAppArgs
    let proposition ← mkEq args[1]! (mkNatLit 2)
    Lean.addDecl (.thmDecl {{
      name := `{api.NS}.deliberately_false_numeric_annotation
      levelParams := []
      type := proposition
      value := Lean.mkConst name
    }}) true
submit_false_numeric_annotation
'''
    driver.emit('NumericTreeNegative.lean', negative)
    driver.summary['numeric_tree_proposed'] = dict(required_roots=len(names),
        exact_table_cells_preserved=True, exact_source_and_return_fidelity_goal=True,
        kernel_checked=False, actual_source_rows_certified=0, new_accepted_machine=False)
    driver.checkpoint()


def run(driver, api):
    generate(driver, api)
    driver.run('NumericTree', 60,
               'Decorated numeric syntax preserves node positions and paid return targets')
    driver.summary['numeric_tree_proposed']['kernel_checked'] = True
    driver.summary['numeric_tree_core_checked'] = True
    driver.run('NumericTreeNegative', 45, negative=True)
    driver.summary['numeric_tree_kernel_corruption_rejected'] = True
    driver.checkpoint()
