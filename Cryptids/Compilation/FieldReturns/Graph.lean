/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Optimisation.CompactPost

/-! # Structural coverage of graph write destinations

Loads and branches descend through the finite graph without issuing a tape command.
Every resulting write therefore targets a literal write child, a label entry, or the
shared halt. This theorem quantifies over every node, scanned bit and store; it uses
neither a reachability assumption nor enumeration of the compiled transition table.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.FieldReturns
open Turing ConjectureMachines.Optimisation

set_option backward.isDefEq.respectTransparency false

/-- Coverage of primitive write targets propagates through all pure graph recursion. -/
theorem trAux_write_covered {n k labels : Nat} (g : LazyGraph.Graph n k labels)
    (P : GraphPost.Descriptor n k → Prop)
    (write_child : ∀ (i : Fin n) (table : BoolGraph.Table k Bool) (child : Fin n),
      g.node i = .write table child → ∀ value : Fin k, P (some child, value))
    (entry : ∀ (label : Fin labels) (value : Fin k), P (some (g.entry label), value))
    (halt : ∀ value : Fin k, P (none, value))
    (bit : Bool) (i : Fin n) (value : Fin k) (written : Bool)
    (command : (LazyGraph.trAux g bit i value).2 = .write written) :
    P (LazyGraph.trAux g bit i value).1 := by
  cases row : g.node i with
  | move dir child =>
    rw [LazyGraph.trAux_move g bit i child value dir row] at command
    cases command
  | write table child =>
    rw [LazyGraph.trAux_write g bit i child value table row]
    exact write_child i table child row value
  | load table child =>
    rw [LazyGraph.trAux_load g bit i child value table row] at command ⊢
    exact trAux_write_covered g P write_child entry halt bit child
      (table.read bit value) written command
  | branch table left right =>
    rw [LazyGraph.trAux_branch g bit i left right value table row] at command ⊢
    cases test : table.read bit value <;>
      simp only [test, Bool.false_eq_true, ↓reduceIte] at command ⊢
    · exact trAux_write_covered g P write_child entry halt bit right value written command
    · exact trAux_write_covered g P write_child entry halt bit left value written command
  | goto table =>
    rw [LazyGraph.trAux_goto g bit i value table row]
    exact entry (table.read bit value) value
  | halt =>
    rw [LazyGraph.trAux_halt g bit i value row]
    exact halt value
termination_by i.val
decreasing_by all_goals exact g.below i _ (by simp [row, BoolGraph.Node.children])

/-- A predicate on encoded controls covers every actual CompactPost write destination.
The halted control has no row; the live case uses the store after every intervening load. -/
theorem compact_write_covered {n k labels : Nat} [NeZero k] [NeZero labels]
    (g : LazyGraph.Graph n k labels) (P : Fin (CompactPost.stateCount n k) → Prop)
    (write_child : ∀ (i : Fin n) (table : BoolGraph.Table k Bool) (child : Fin n),
      g.node i = .write table child → ∀ value : Fin k,
        P (CompactPost.encode g (some child, value)))
    (entry : ∀ (label : Fin labels) (value : Fin k),
      P (CompactPost.encode g (some (g.entry label), value)))
    (halt : ∀ value : Fin k, P (CompactPost.encode g (none, value)))
    (q : Fin (CompactPost.stateCount n k)) (bit : Bool)
    (destination : Fin (CompactPost.stateCount n k)) (written : Bool)
    (row : CompactPost.machine g q bit = some (destination, .write written)) :
    P destination := by
  cases decoded : CompactPost.decode g q with
  | none => simp only [CompactPost.machine, decoded, reduceCtorEq] at row
  | some state =>
    rcases state with ⟨i, value⟩
    simp only [CompactPost.machine, decoded, Option.some.injEq, Prod.mk.injEq] at row
    rw [← row.1]
    exact trAux_write_covered g (fun d ↦ P (CompactPost.encode g d))
      write_child entry halt bit i value written row.2

end ConjectureMachines.Compilation.FieldReturns
