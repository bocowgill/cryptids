/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.FieldCompiler.Syntax
public import Cryptids.Compilation.TemplateGraph

/-! # Uniform finite blocks for the complete field syntax

Each syntax tree is numbered in postorder. Every source label owns one block of exactly
`width` nodes, including its unused halt slots. Executable getters select one row and one
tree node; they never materialize the vector interpretation of the whole graph.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.FieldCompiler
open Turing BoolGraph

set_option backward.isDefEq.respectTransparency false

namespace Syntax

theorem size_pos {n : Nat} (p : Syntax n) : 0 < p.size := by
  cases p <;> simp only [size] <;> omega

/-- The final postorder slot is the root, including for a one-node tree. -/
def root {n : Nat} : (p : Syntax n) → Fin p.size
  | .move _ p | .write _ p | .load _ p => Fin.last p.size
  | .branch _ p q => Fin.last (p.size + q.size)
  | .go _ => ⟨0, by simp [size]⟩
  | .halt => ⟨0, by simp [size]⟩

@[simp] theorem root_val {n : Nat} (p : Syntax n) : p.root.val = p.size - 1 := by
  cases p <;> simp [root, size]

/-- The complete subtree rooted at a postorder slot. -/
def subAt {n : Nat} : (p : Syntax n) → Fin p.size → Syntax n
  | .move d p => Fin.lastCases (.move d p) p.subAt
  | .write t p => Fin.lastCases (.write t p) p.subAt
  | .load t p => Fin.lastCases (.load t p) p.subAt
  | .branch t p q => Fin.lastCases (.branch t p q) (Fin.addCases p.subAt q.subAt)
  | .go t => fun _ ↦ .go t
  | .halt => fun _ ↦ .halt

@[simp] theorem subAt_root {n : Nat} (p : Syntax n) : p.subAt p.root = p := by
  cases p <;> simp [subAt, root]

/-- First-order local tree getter. Only syntax-child indices are renamed. -/
def nodeAt {n : Nat} : (p : Syntax n) → Fin p.size → Node p.size 5 n
  | .move d p => Fin.lastCases (.move d p.root.castSucc)
      (fun i ↦ TemplateGraph.mapNode Fin.castSucc (p.nodeAt i))
  | .write t p => Fin.lastCases (.write t p.root.castSucc)
      (fun i ↦ TemplateGraph.mapNode Fin.castSucc (p.nodeAt i))
  | .load t p => Fin.lastCases (.load t p.root.castSucc)
      (fun i ↦ TemplateGraph.mapNode Fin.castSucc (p.nodeAt i))
  | .branch t p q => Fin.lastCases
      (.branch t (p.root.castAdd q.size).castSucc (Fin.natAdd p.size q.root).castSucc)
      (Fin.addCases
        (fun i ↦ TemplateGraph.mapNode (fun j ↦ (j.castAdd q.size).castSucc) (p.nodeAt i))
        (fun i ↦ TemplateGraph.mapNode (fun j ↦ (Fin.natAdd p.size j).castSucc)
          (q.nodeAt i)))
  | .go t => fun _ ↦ .goto t
  | .halt => fun _ ↦ .halt

/-- Direct indexed lookup avoids the eager reverse induction used by `Fin.lastCases`.
The equation below certifies this executable replacement for every local slot. -/
def fastNodeAt {n : Nat} : (p : Syntax n) → Fin p.size → Node p.size 5 n
  | .move d p, i =>
      if h : i.val < p.size then
        TemplateGraph.mapNode Fin.castSucc (p.fastNodeAt ⟨i.val, h⟩)
      else .move d p.root.castSucc
  | .write t p, i =>
      if h : i.val < p.size then
        TemplateGraph.mapNode Fin.castSucc (p.fastNodeAt ⟨i.val, h⟩)
      else .write t p.root.castSucc
  | .load t p, i =>
      if h : i.val < p.size then
        TemplateGraph.mapNode Fin.castSucc (p.fastNodeAt ⟨i.val, h⟩)
      else .load t p.root.castSucc
  | .branch t p q, i =>
      if h : i.val < p.size + q.size then
        if left : i.val < p.size then
          TemplateGraph.mapNode (fun j ↦ (j.castAdd q.size).castSucc)
            (p.fastNodeAt ⟨i.val, left⟩)
        else
          TemplateGraph.mapNode (fun j ↦ (Fin.natAdd p.size j).castSucc)
            (q.fastNodeAt ⟨i.val - p.size, by omega⟩)
      else .branch t (p.root.castAdd q.size).castSucc (Fin.natAdd p.size q.root).castSucc
  | .go t, _ => .goto t
  | .halt, _ => .halt

theorem fastNodeAt_eq {n : Nat} (p : Syntax n) (i : Fin p.size) :
    p.fastNodeAt i = p.nodeAt i := by
  induction p with
  | move x p ih | write x p ih | load x p ih =>
    refine Fin.lastCases ?_ (fun j ↦ ?_) i
    · simp only [fastNodeAt, nodeAt, Fin.lastCases_last, Fin.val_last,
        Nat.lt_irrefl, ↓reduceDIte]
    · simp only [fastNodeAt, nodeAt, Fin.lastCases_castSucc, Fin.val_castSucc,
        j.isLt, ↓reduceDIte, ih]
  | branch t p q ihp ihq =>
    refine Fin.lastCases ?_ (fun j ↦ ?_) i
    · simp only [fastNodeAt, nodeAt, Fin.lastCases_last, Fin.val_last,
        Nat.lt_irrefl, ↓reduceDIte]
    · induction j using Fin.addCases with
      | left j =>
        simp only [fastNodeAt, nodeAt, Fin.lastCases_castSucc, Fin.addCases_left,
          Fin.val_castSucc, Fin.val_castAdd, j.isLt, ↓reduceDIte,
          show j.val < p.size + q.size by omega, ihp]
      | right j =>
        simp only [fastNodeAt, nodeAt, Fin.lastCases_castSucc, Fin.addCases_right,
          Fin.val_castSucc, Fin.val_natAdd,
          show p.size + j.val < p.size + q.size by omega,
          show ¬p.size + j.val < p.size by omega, ↓reduceDIte,
          Nat.add_sub_cancel_left, ihq]
  | go t => rfl
  | halt => rfl

/-- Native compilation uses only the universally proved faster getter. -/
@[csimp] theorem nodeAt_csimp : @nodeAt = @fastNodeAt := by
  funext n p i
  exact (fastNodeAt_eq p i).symm

/-- Every meaningful local edge points strictly backwards in postorder. -/
theorem nodeAt_below {n : Nat} (p : Syntax n) (i child : Fin p.size)
    (member : child ∈ (p.nodeAt i).children) : child.val < i.val := by
  induction p with
  | move x p ih | write x p ih | load x p ih =>
    revert member
    refine Fin.lastCases ?_ (fun j ↦ ?_) i
    · intro member
      simp only [nodeAt, Fin.lastCases_last, Node.children, List.mem_singleton] at member
      subst child
      exact p.root.isLt
    · intro member
      simp only [nodeAt, Fin.lastCases_castSucc, TemplateGraph.children_mapNode,
        List.mem_map] at member
      obtain ⟨old, member, rfl⟩ := member
      exact ih j old member
  | branch t p q ihp ihq =>
    revert member
    refine Fin.lastCases ?_ (fun j ↦ ?_) i
    · intro member
      simp only [nodeAt, Fin.lastCases_last, Node.children, List.mem_cons,
        List.not_mem_nil, or_false] at member
      rcases member with rfl | rfl
      · exact p.root.isLt.trans_le (Nat.le_add_right _ _)
      · exact Nat.add_lt_add_left q.root.isLt p.size
    · intro member
      induction j using Fin.addCases with
      | left j =>
        simp only [nodeAt, Fin.lastCases_castSucc, Fin.addCases_left,
          TemplateGraph.children_mapNode, List.mem_map] at member
        obtain ⟨old, member, rfl⟩ := member
        exact ihp j old member
      | right j =>
        simp only [nodeAt, Fin.lastCases_castSucc, Fin.addCases_right,
          TemplateGraph.children_mapNode, List.mem_map] at member
        obtain ⟨old, member, rfl⟩ := member
        exact Nat.add_lt_add_left (ihq j old member) p.size
  | go t => simp [nodeAt, Node.children] at member
  | halt => simp [nodeAt, Node.children] at member

/-- One constructor of the getter agrees with the exact subtree at every local slot. -/
theorem nodeAt_meaning {n : Nat} (p : Syntax n) (i : Fin p.size) :
    TemplateGraph.buildNode (Equiv.refl (Fin 5)) (fun j ↦ (p.subAt j).meaning)
      (p.nodeAt i) = (p.subAt i).meaning := by
  induction p with
  | move x p ih | write x p ih | load x p ih =>
    refine Fin.lastCases ?_ (fun j ↦ ?_) i
    · simp only [nodeAt, Fin.lastCases_last, TemplateGraph.buildNode, subAt,
        Fin.lastCases_castSucc, subAt_root, meaning]
      all_goals rfl
    · simpa only [nodeAt, subAt, Fin.lastCases_castSucc, TemplateGraph.buildNode_map,
        Function.comp_def] using ih j
  | branch t p q ihp ihq =>
    refine Fin.lastCases ?_ (fun j ↦ ?_) i
    · simp only [nodeAt, Fin.lastCases_last, TemplateGraph.buildNode, subAt,
        Fin.lastCases_castSucc, Fin.addCases_left, Fin.addCases_right, subAt_root, meaning]
      all_goals rfl
    · induction j using Fin.addCases with
      | left j =>
        simpa only [nodeAt, subAt, Fin.lastCases_castSucc, Fin.addCases_left,
          TemplateGraph.buildNode_map, Function.comp_def] using ihp j
      | right j =>
        simpa only [nodeAt, subAt, Fin.lastCases_castSucc, Fin.addCases_right,
          TemplateGraph.buildNode_map, Function.comp_def] using ihq j
  | go t => rfl
  | halt => rfl

end Syntax

/-- Embed a meaningful local slot into its complete uniform source-label block. -/
def graphIndex {labels : Nat} (rows : Vector (Syntax labels) labels) (width : Nat)
    (fits : ∀ q, (rows.get q).size ≤ width) (q : Fin labels)
    (i : Fin (rows.get q).size) : Fin (labels * width) :=
  finProdFinEquiv (q, i.castLE (fits q))

@[simp] theorem graphIndex_val {labels : Nat} (rows : Vector (Syntax labels) labels)
    (width : Nat) (fits : ∀ q, (rows.get q).size ≤ width) (q : Fin labels)
    (i : Fin (rows.get q).size) :
    (graphIndex rows width fits q i).val = q.val * width + i.val := by
  simp [graphIndex, finProdFinEquiv, Nat.mul_comm, Nat.add_comm]

/-- Inspect one explicitly selected source block and its local slot. -/
def graphNodePair {labels : Nat} (rows : Vector (Syntax labels) labels) (width : Nat)
    (fits : ∀ q, (rows.get q).size ≤ width) (pair : Fin labels × Fin width) :
    Node (labels * width) 5 labels :=
  if inside : pair.2.val < (rows.get pair.1).size then
    TemplateGraph.mapNode (graphIndex rows width fits pair.1)
      ((rows.get pair.1).nodeAt ⟨pair.2.val, inside⟩)
  else .halt

/-- Direct global getter. Unused slots are literal childless halt nodes. -/
def graphNode {labels : Nat} (rows : Vector (Syntax labels) labels) (width : Nat)
    (fits : ∀ q, (rows.get q).size ≤ width) (i : Fin (labels * width)) :
    Node (labels * width) 5 labels :=
  graphNodePair rows width fits (finProdFinEquiv.symm i)

/-- Direct entry getter selects the tree root within its source-label block. -/
def graphEntry {labels : Nat} (rows : Vector (Syntax labels) labels) (width : Nat)
    (fits : ∀ q, (rows.get q).size ≤ width) (q : Fin labels) : Fin (labels * width) :=
  graphIndex rows width fits q (rows.get q).root

/-- Exact syntax in one selected block, with a halt at every unused local slot. -/
def graphSyntaxPair {labels : Nat} (rows : Vector (Syntax labels) labels) (width : Nat)
    (pair : Fin labels × Fin width) : Syntax labels :=
  if inside : pair.2.val < (rows.get pair.1).size then
    (rows.get pair.1).subAt ⟨pair.2.val, inside⟩
  else .halt

/-- Exact syntax of every paid global slot, including all unused padding slots. -/
def graphSyntax {labels : Nat} (rows : Vector (Syntax labels) labels) (width : Nat)
    (i : Fin (labels * width)) : Syntax labels :=
  graphSyntaxPair rows width (finProdFinEquiv.symm i)

@[simp] theorem graphNode_index {labels : Nat} (rows : Vector (Syntax labels) labels)
    (width : Nat) (fits : ∀ q, (rows.get q).size ≤ width) (q : Fin labels)
    (i : Fin (rows.get q).size) :
    graphNode rows width fits (graphIndex rows width fits q i) =
      TemplateGraph.mapNode (graphIndex rows width fits q) ((rows.get q).nodeAt i) := by
  unfold graphNode graphIndex
  rw [Equiv.symm_apply_apply]
  simp only [graphNodePair, Fin.val_castLE, dite_eq_left i.isLt]
  rfl

@[simp] theorem graphSyntax_index {labels : Nat} (rows : Vector (Syntax labels) labels)
    (width : Nat) (fits : ∀ q, (rows.get q).size ≤ width) (q : Fin labels)
    (i : Fin (rows.get q).size) :
    graphSyntax rows width (graphIndex rows width fits q i) = (rows.get q).subAt i := by
  unfold graphSyntax graphIndex
  rw [Equiv.symm_apply_apply]
  simp only [graphSyntaxPair, Fin.val_castLE, dite_eq_left i.isLt]

/-- A paid padding slot has a literal halt row and no possible syntax fallthrough. -/
theorem graphNode_padding {labels : Nat} (rows : Vector (Syntax labels) labels) (width : Nat)
    (fits : ∀ q, (rows.get q).size ≤ width) (q : Fin labels) (slot : Fin width)
    (outside : (rows.get q).size ≤ slot.val) :
    graphNode rows width fits (finProdFinEquiv (q, slot)) = .halt := by
  unfold graphNode
  rw [Equiv.symm_apply_apply]
  simp only [graphNodePair, dite_eq_right (Nat.not_lt_of_ge outside)]

theorem graphNode_below {labels : Nat} (rows : Vector (Syntax labels) labels) (width : Nat)
    (fits : ∀ q, (rows.get q).size ≤ width) (i child : Fin (labels * width))
    (member : child ∈ (graphNode rows width fits i).children) : child.val < i.val := by
  obtain ⟨⟨q, slot⟩, rfl⟩ := finProdFinEquiv.surjective i
  unfold graphNode at member
  rw [Equiv.symm_apply_apply] at member
  unfold graphNodePair at member
  split at member
  next inside =>
    rw [TemplateGraph.children_mapNode, List.mem_map] at member
    obtain ⟨old, member, rfl⟩ := member
    have below : old.val < slot.val :=
      (rows.get q).nodeAt_below ⟨slot.val, inside⟩ old member
    change (graphIndex rows width fits q old).val < slot.val + width * q.val
    rw [graphIndex_val, Nat.mul_comm width q.val, Nat.add_comm slot.val (q.val * width)]
    exact Nat.add_lt_add_left below _
  next => simp [Node.children] at member

/-- The complete getter graph has exactly `labels * width` nodes, with no removed padding. -/
def graph {labels : Nat} (rows : Vector (Syntax labels) labels) (width : Nat)
    (fits : ∀ q, (rows.get q).size ≤ width) : LazyGraph.Graph (labels * width) 5 labels where
  node := graphNode rows width fits
  entry := graphEntry rows width fits
  below := graphNode_below rows width fits

@[simp] theorem graph_node {labels : Nat} (rows : Vector (Syntax labels) labels) (width : Nat)
    (fits : ∀ q, (rows.get q).size ≤ width) (i : Fin (labels * width)) :
    (graph rows width fits).node i = graphNode rows width fits i := rfl

@[simp] theorem graph_entry {labels : Nat} (rows : Vector (Syntax labels) labels) (width : Nat)
    (fits : ∀ q, (rows.get q).size ≤ width) (q : Fin labels) :
    (graph rows width fits).entry q = graphIndex rows width fits q (rows.get q).root := rfl

/-- Entry arithmetic uses the postorder root and includes every preceding padded block. -/
theorem graph_entry_val {labels : Nat} (rows : Vector (Syntax labels) labels) (width : Nat)
    (fits : ∀ q, (rows.get q).size ≤ width) (q : Fin labels) :
    ((graph rows width fits).entry q).val = q.val * width + (rows.get q).size - 1 := by
  rw [graph_entry, graphIndex_val, Syntax.root_val]
  have positive := (rows.get q).size_pos
  omega

/-- The universal one-node interpretation equation includes padding as exact halt syntax. -/
theorem graphNode_meaning {labels : Nat} (rows : Vector (Syntax labels) labels) (width : Nat)
    (fits : ∀ q, (rows.get q).size ≤ width) (i : Fin (labels * width)) :
    TemplateGraph.buildNode (Equiv.refl (Fin 5))
      (fun child ↦ (graphSyntax rows width child).meaning) (graphNode rows width fits i) =
      (graphSyntax rows width i).meaning := by
  obtain ⟨⟨q, slot⟩, rfl⟩ := finProdFinEquiv.surjective i
  unfold graphNode
  rw [Equiv.symm_apply_apply]
  conv_rhs =>
    unfold graphSyntax
    rw [Equiv.symm_apply_apply]
    unfold graphSyntaxPair
  unfold graphNodePair
  by_cases inside : slot.val < (rows.get q).size
  · simpa only [dite_eq_left inside, TemplateGraph.buildNode_map, Function.comp_def,
      graphSyntax_index] using (rows.get q).nodeAt_meaning ⟨slot.val, inside⟩
  · simp only [dite_eq_right inside, TemplateGraph.buildNode, Syntax.meaning]

private theorem decode_build {n k labels : Nat} {σ : Type} (g : LazyGraph.Graph n k labels)
    (store : Fin k ≃ σ) (i : Fin n) :
    BoolGraph.decode (LazyGraph.asGraph g) store i =
      TemplateGraph.buildNode store (BoolGraph.decode (LazyGraph.asGraph g) store) (g.node i) := by
  rw [BoolGraph.decode, LazyGraph.asGraph_node]
  cases g.node i <;> rfl

/-- Every global node decodes to its exact subtree or to the halt in its unused slot. -/
theorem decode_node {labels : Nat} (rows : Vector (Syntax labels) labels) (width : Nat)
    (fits : ∀ q, (rows.get q).size ≤ width) (i : Fin (labels * width)) :
    BoolGraph.decode (LazyGraph.asGraph (graph rows width fits)) (Equiv.refl (Fin 5)) i =
      (graphSyntax rows width i).meaning := by
  rw [decode_build]
  calc
    TemplateGraph.buildNode (Equiv.refl (Fin 5))
        (BoolGraph.decode (LazyGraph.asGraph (graph rows width fits)) (Equiv.refl (Fin 5)))
        ((graph rows width fits).node i) =
        TemplateGraph.buildNode (Equiv.refl (Fin 5))
          (fun child ↦ (graphSyntax rows width child).meaning)
          ((graph rows width fits).node i) := by
      apply TemplateGraph.buildNode_congr
      intro child member
      exact decode_node rows width fits child
    _ = (graphSyntax rows width i).meaning := graphNode_meaning rows width fits i
termination_by i.val
decreasing_by exact (graph rows width fits).below i _ member

/-- The graph machine is extensionally the meaning of every supplied source syntax row. -/
theorem machine_eq {labels : Nat} (rows : Vector (Syntax labels) labels) (width : Nat)
    (fits : ∀ q, (rows.get q).size ≤ width) :
    BoolGraph.machine (LazyGraph.asGraph (graph rows width fits)) (Equiv.refl (Fin 5)) =
      fun q ↦ (rows.get q).meaning := by
  funext q
  simp only [BoolGraph.machine, LazyGraph.asGraph_entry, graph_entry, decode_node,
    graphSyntax_index, Syntax.subAt_root]

/-- All source blocks, padding nodes, initial control, and five halted stores are counted. -/
theorem graph_stateCount (labels width : Nat) :
    GraphPost.stateCount (labels * width) 5 = 1 + (labels * width + 1) * 5 := rfl

theorem graph_nodeCount (labels width : Nat) :
    Fintype.card (Fin (labels * width)) = labels * width := Fintype.card_fin _

end ConjectureMachines.Compilation.FieldCompiler
