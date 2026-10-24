module
public import Cryptids.Compilation.FieldReturns.Syntax

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open ConjectureMachines.Compilation
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

structure Fragment where
  count : Nat
  root : Nat
  trace : Trace
  targets : List Nat

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

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Decorated numeric syntax preserves node positions and paid return targets"
