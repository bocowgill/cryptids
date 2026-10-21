/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.FlatInit

/-! # Flat initialization from a certified instruction schedule

The construction charges one state per instruction. The schedule may place the finite
input at any physical tape location; the resulting zipper must agree exactly.
-/

@[expose] public section
namespace ConjectureMachines.Optimisation.ReverseInit
open Turing StateTransition ConjectureMachines.Compilation

/-- Consecutive leftward writes, with the list determining their execution order. -/
def writes (bits : List (Fin 2)) (dir : Dir) : List Init.Instruction :=
  bits.map (fun bit ↦ (some bit, dir))

/-- A counted sequence of moves preserving every scanned cell. -/
def moves (dir : Dir) (count : Nat) : List Init.Instruction :=
  List.replicate count (none, dir)

/-- Reversed leftward writing leaves a blank cell immediately before the input. -/
theorem writes_reverse_left (bits : List (Fin 2)) :
    Init.executeList (writes bits.reverse .left) (Tape.mk₁ []) =
      Tape.mk₁ (0 :: bits) := by
  induction bits with
  | nil => rfl
  | cons bit rest ih =>
    rw [List.reverse_cons]
    change Init.executeList (writes rest.reverse .left ++ [(some bit, .left)]) _ = _
    rw [Init.executeList_append, ih]
    rfl

/-- A single final right move restores the head onto the first input bit. -/
theorem reverse_correct (bits : List (Fin 2)) :
    Init.executeList (writes bits.reverse .left ++ moves .right 1) (Tape.mk₁ []) =
      Tape.mk₁ bits := by
  rw [Init.executeList_append, writes_reverse_left]
  change (Tape.mk₁ (0 :: bits)).move .right = Tape.mk₁ bits
  change (Tape.mk' (ListBlank.mk []) (ListBlank.mk (0 :: bits))).move .right = _
  rw [Tape.move_right_mk']
  have blank : ListBlank.mk [(0 : Fin 2)] = ListBlank.mk [] :=
    ListBlank.cons_head_tail (ListBlank.mk [])
  change Tape.mk' (ListBlank.mk [0]) (ListBlank.mk bits) = Tape.mk₁ bits
  rw [blank]
  rfl

/-- The seed schedule is exactly the accepted forward writer. -/
theorem forward_correct (bits : List (Fin 2)) :
    Init.executeList (writes bits .right ++ moves .left bits.length) (Tape.mk₁ []) =
      Tape.mk₁ bits := by
  change Init.executeList (bits.map (fun bit ↦ (some bit, .right)) ++
    List.replicate bits.length (none, .left)) _ = _
  rw [← FlatInit.writer_eq_actions]
  exact Init.writer_correct bits (ListBlank.mk [])

end ConjectureMachines.Optimisation.ReverseInit
