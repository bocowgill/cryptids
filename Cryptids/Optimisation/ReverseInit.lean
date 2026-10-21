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
  | nil => simp [writes, Init.executeList, Tape.mk₁, ListBlank.mk_cons]
  | cons bit rest ih =>
    simp only [List.reverse_cons, writes, List.map_append, List.map_cons, List.map_nil,
      Init.executeList_append, ih, Init.executeList, Init.execute, Option.getD_some]
    simp [Tape.mk₁, Tape.write_mk', Tape.move_left_mk', ListBlank.tail_mk,
      ListBlank.cons_mk]

/-- A single final right move restores the head onto the first input bit. -/
theorem reverse_correct (bits : List (Fin 2)) :
    Init.executeList (writes bits.reverse .left ++ moves .right 1) (Tape.mk₁ []) =
      Tape.mk₁ bits := by
  rw [Init.executeList_append, writes_reverse_left]
  simp [moves, Init.executeList, Init.execute, Tape.write_self, Tape.mk₁,
    Tape.move_right_mk', ListBlank.tail_mk, ListBlank.head_mk, ListBlank.cons_mk]

end ConjectureMachines.Optimisation.ReverseInit
