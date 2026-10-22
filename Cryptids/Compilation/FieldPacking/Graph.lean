/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.FieldPacking.Interface

/-! # Complete syntax graphs with exact node allocation

A layout assigns one numeric node to every actual local syntax slot. The getter decodes
that bijection and renames only syntax-child indices, so no unused node is allocated.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.FieldPacking
open Turing BoolGraph FieldCompiler

set_option backward.isDefEq.respectTransparency false

/-- Encode an actual local syntax slot as its unique allocated numeric node. -/
def graphIndex {labels total : Nat} (rows : Vector (Syntax labels) labels)
    (layout : Layout rows total) (q : Fin labels) (i : Fin (rows.get q).size) : Fin total :=
  layout.code ⟨q, i⟩

/-- Decoding a local slot's numeric address recovers the complete dependent slot. -/
@[simp] theorem decode_graphIndex {labels total : Nat} (rows : Vector (Syntax labels) labels)
    (layout : Layout rows total) (q : Fin labels) (i : Fin (rows.get q).size) :
    layout.code.symm (graphIndex rows layout q i) = ⟨q, i⟩ :=
  layout.code.symm_apply_apply _

/-- Every allocated numeric node is the encoding of its unique decoded local slot. -/
@[simp] theorem graphIndex_decode {labels total : Nat} (rows : Vector (Syntax labels) labels)
    (layout : Layout rows total) (i : Fin total) :
    graphIndex rows layout (layout.code.symm i).1 (layout.code.symm i).2 = i :=
  layout.code.apply_symm_apply _

/-- Direct lookup at a decoded local slot, renaming only syntax-child addresses. -/
def graphNodeSlot {labels total : Nat} (rows : Vector (Syntax labels) labels)
    (layout : Layout rows total) (slot : Slot rows) : Node total 5 labels :=
  TemplateGraph.mapNode (graphIndex rows layout slot.1) ((rows.get slot.1).nodeAt slot.2)

/-- Direct global lookup decodes exactly one actual local syntax slot. -/
def graphNode {labels total : Nat} (rows : Vector (Syntax labels) labels)
    (layout : Layout rows total) (i : Fin total) : Node total 5 labels :=
  graphNodeSlot rows layout (layout.code.symm i)

/-- Entry lookup encodes the source row's actual postorder root. -/
def graphEntry {labels total : Nat} (rows : Vector (Syntax labels) labels)
    (layout : Layout rows total) (q : Fin labels) : Fin total :=
  graphIndex rows layout q (rows.get q).root

/-- Exact source subtree associated with every allocated numeric node. -/
def graphSyntax {labels total : Nat} (rows : Vector (Syntax labels) labels)
    (layout : Layout rows total) (i : Fin total) : Syntax labels :=
  let slot := layout.code.symm i
  (rows.get slot.1).subAt slot.2

@[simp] theorem graphNode_index {labels total : Nat} (rows : Vector (Syntax labels) labels)
    (layout : Layout rows total) (q : Fin labels) (i : Fin (rows.get q).size) :
    graphNode rows layout (graphIndex rows layout q i) =
      TemplateGraph.mapNode (graphIndex rows layout q) ((rows.get q).nodeAt i) := by
  exact congrArg (graphNodeSlot rows layout) (decode_graphIndex rows layout q i)

@[simp] theorem graphSyntax_index {labels total : Nat} (rows : Vector (Syntax labels) labels)
    (layout : Layout rows total) (q : Fin labels) (i : Fin (rows.get q).size) :
    graphSyntax rows layout (graphIndex rows layout q i) = (rows.get q).subAt i := by
  exact congrArg (fun slot : Slot rows ↦ (rows.get slot.1).subAt slot.2)
    (decode_graphIndex rows layout q i)

/-- Local postorder descent remains strict after encoding in any ordered layout. -/
theorem graphNode_below {labels total : Nat} (rows : Vector (Syntax labels) labels)
    (layout : Layout rows total) (i child : Fin total)
    (member : child ∈ (graphNode rows layout i).children) : child.val < i.val := by
  obtain ⟨⟨q, slot⟩, rfl⟩ := layout.code.surjective i
  change child ∈ (graphNode rows layout (graphIndex rows layout q slot)).children at member
  rw [graphNode_index, TemplateGraph.children_mapNode, List.mem_map] at member
  obtain ⟨old, member, rfl⟩ := member
  exact layout.ordered q old slot ((rows.get q).nodeAt_below slot old member)

/-- The complete getter graph allocates exactly the layout's actual local syntax slots. -/
def graph {labels total : Nat} (rows : Vector (Syntax labels) labels)
    (layout : Layout rows total) : LazyGraph.Graph total 5 labels where
  node := graphNode rows layout
  entry := graphEntry rows layout
  below := graphNode_below rows layout

@[simp] theorem graph_node {labels total : Nat} (rows : Vector (Syntax labels) labels)
    (layout : Layout rows total) (i : Fin total) :
    (graph rows layout).node i = graphNode rows layout i := rfl

@[simp] theorem graph_entry {labels total : Nat} (rows : Vector (Syntax labels) labels)
    (layout : Layout rows total) (q : Fin labels) :
    (graph rows layout).entry q = graphIndex rows layout q (rows.get q).root := rfl

/-- Every node's one-constructor interpretation agrees with its exact local source subtree. -/
theorem graphNode_meaning {labels total : Nat} (rows : Vector (Syntax labels) labels)
    (layout : Layout rows total) (i : Fin total) :
    TemplateGraph.buildNode (Equiv.refl (Fin 5))
      (fun child ↦ (graphSyntax rows layout child).meaning) (graphNode rows layout i) =
      (graphSyntax rows layout i).meaning := by
  obtain ⟨⟨q, slot⟩, rfl⟩ := layout.code.surjective i
  change TemplateGraph.buildNode (Equiv.refl (Fin 5))
      (fun child ↦ (graphSyntax rows layout child).meaning)
      (graphNode rows layout (graphIndex rows layout q slot)) =
    (graphSyntax rows layout (graphIndex rows layout q slot)).meaning
  simpa only [graphNode_index, TemplateGraph.buildNode_map, Function.comp_def,
    graphSyntax_index] using (rows.get q).nodeAt_meaning slot

private theorem decode_build {n k labels : Nat} {σ : Type} (g : LazyGraph.Graph n k labels)
    (store : Fin k ≃ σ) (i : Fin n) :
    BoolGraph.decode (LazyGraph.asGraph g) store i =
      TemplateGraph.buildNode store (BoolGraph.decode (LazyGraph.asGraph g) store)
        (g.node i) := by
  rw [BoolGraph.decode, LazyGraph.asGraph_node]
  cases g.node i <;> rfl

/-- Every allocated node decodes to its exact source subtree, without reachability premises. -/
theorem decode_node {labels total : Nat} (rows : Vector (Syntax labels) labels)
    (layout : Layout rows total) (i : Fin total) :
    BoolGraph.decode (LazyGraph.asGraph (graph rows layout)) (Equiv.refl (Fin 5)) i =
      (graphSyntax rows layout i).meaning := by
  rw [decode_build]
  calc
    TemplateGraph.buildNode (Equiv.refl (Fin 5))
        (BoolGraph.decode (LazyGraph.asGraph (graph rows layout)) (Equiv.refl (Fin 5)))
        ((graph rows layout).node i) =
        TemplateGraph.buildNode (Equiv.refl (Fin 5))
          (fun child ↦ (graphSyntax rows layout child).meaning)
          ((graph rows layout).node i) := by
      apply TemplateGraph.buildNode_congr
      intro child member
      exact decode_node rows layout child
    _ = (graphSyntax rows layout i).meaning := graphNode_meaning rows layout i
termination_by i.val
decreasing_by exact (graph rows layout).below i _ member

/-- The graph machine is the meaning of every complete supplied source syntax row. -/
theorem machine_eq {labels total : Nat} (rows : Vector (Syntax labels) labels)
    (layout : Layout rows total) :
    BoolGraph.machine (LazyGraph.asGraph (graph rows layout)) (Equiv.refl (Fin 5)) =
      fun q ↦ (rows.get q).meaning := by
  funext q
  simp only [BoolGraph.machine, LazyGraph.asGraph_entry, graph_entry, decode_node,
    graphSyntax_index, Syntax.subAt_root]

/-- Initial control, every running node/store pair, and every halted store are paid. -/
theorem graph_stateCount (total : Nat) :
    GraphPost.stateCount total 5 = 1 + (total + 1) * 5 := rfl

theorem graph_nodeCount (total : Nat) : Fintype.card (Fin total) = total :=
  Fintype.card_fin _

end ConjectureMachines.Compilation.FieldPacking
