/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.TableSeed.Format

/-! # Exact structured packet for the frozen chess input

The source certificate supplies operand bounds. Converting each constructor preserves its
actual natural-number fields, and the original-word identity is proved before instantiating
the complete source table.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.TableSeed.ChessCodec

open Turing PartrecToTM2

/-- Preserve the canonical tag and both operands of one certified source row. -/
def nodeToRow : (node : CodeDAG.Node) → node.Below 8192 → Row
  | .zero, _ => ⟨0, 0, 0⟩
  | .succ, _ => ⟨1, 0, 0⟩
  | .tail, _ => ⟨2, 0, 0⟩
  | .cons left right, below => ⟨3, ⟨left, below.1⟩, ⟨right, below.2⟩⟩
  | .comp left right, below => ⟨4, ⟨left, below.1⟩, ⟨right, below.2⟩⟩
  | .branch left right, below => ⟨5, ⟨left, below.1⟩, ⟨right, below.2⟩⟩
  | .fix child, below => ⟨6, ⟨child, below⟩, 0⟩

theorem nodeToRow_letters (node : CodeDAG.Node) (below : node.Below 8192) :
    rowLetters (nodeToRow node below) = (trList node.words).map Seed.ofSymbol := by
  rw [rowLetters_eq_trList]
  cases node <;> rfl

/-- Topology and the certified table size bound every operand without inspecting the table. -/
theorem array_below (nodes : Array CodeDAG.Node)
    (topology : ∀ (i : Nat) (node : CodeDAG.Node), nodes[i]? = some node → node.Below i)
    (size : nodes.size ≤ 8192) :
    ∀ node ∈ nodes.toList, node.Below 8192 := by
  intro node member
  obtain ⟨i, found⟩ := List.mem_iff_getElem?.mp member
  rw [Array.getElem?_toList] at found
  have index : i < nodes.size := (Array.getElem?_eq_some_iff.mp found).1
  exact CodeDAG.Node.Below.mono node (topology i node found)
    (Nat.le_trans (Nat.le_of_lt index) size)

/-- The dependent conversion retains the original row order and exact `trList` words. -/
theorem nodes_letters (nodes : List CodeDAG.Node)
    (below : ∀ node ∈ nodes, node.Below 8192) :
    (List.pmap nodeToRow nodes below).flatMap rowLetters =
      (trList (nodes.flatMap CodeDAG.Node.words)).map Seed.ofSymbol := by
  induction nodes with
  | nil => rfl
  | cons node nodes ih =>
    simp only [List.pmap_cons, List.flatMap_cons, nodeToRow_letters,
      Runtime.trList_append, List.map_append, ih]

end ConjectureMachines.Compilation.TableSeed.ChessCodec
