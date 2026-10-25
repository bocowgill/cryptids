/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.Parsimony.Data

/-! # Finite local paths for the unchanged Parsimony routines -/

@[expose] public section
namespace ConjectureMachines.Compilation.Parsimony.Common

open Turing StateTransition Relation

abbrev Bit := Fin 2

/-- Ordinary finite machine reachability, including a zero-step path. -/
abbrev Runs {q : Nat} (M : Machine q 2) := Reaches (step M)

/-- A zipper whose left frame includes the current cell. -/
def atL (left right : ListBlank Bit) : Tape Bit := ⟨left.head, left.tail, right⟩

@[simp] theorem atL_cons (bit : Bit) (left right : ListBlank Bit) :
    atL (left.cons bit) right = Tape.mk' left (right.cons bit) := by
  simp [atL, Tape.mk']

/-- One physical row, moving right and preserving all exterior cells. -/
theorem right {q : Nat} (M : Machine q 2) (s t : Fin q) (read write : Bit)
    (left right : ListBlank Bit)
    (row : M.transition s read = some (write, .right, t)) :
    Runs M ⟨s, Tape.mk' left (right.cons read)⟩
      ⟨t, Tape.mk' (left.cons write) right⟩ :=
  .single (Data.step_cell M s t read write left right row)

/-- The left-moving dual of the single-cell contract. -/
theorem left {q : Nat} (M : Machine q 2) (s t : Fin q) (read write : Bit)
    (left right : ListBlank Bit)
    (row : M.transition s read = some (write, .left, t)) :
    Runs M ⟨s, atL (left.cons read) right⟩
      ⟨t, atL left (right.cons write)⟩ := by
  apply Relation.ReflTransGen.single
  simp [step, row, atL]

/-- Scan a finite run of ones, then consume a zero and move right. -/
theorem scanR {q : Nat} (M : Machine q 2) (s t : Fin q) (write : Bit)
    (one : M.transition s 1 = some (1, .right, s))
    (zero : M.transition s 0 = some (write, .right, t)) (n : Nat)
    (left right : ListBlank Bit) :
    Runs M ⟨s, Tape.mk' left (ListBlank.append (List.replicate n 1) (right.cons 0))⟩
      ⟨t, Tape.mk' (ListBlank.append (write :: List.replicate n 1) left) right⟩ := by
  induction n generalizing left with
  | zero => simpa [ListBlank.append] using Common.right M s t 0 write left right zero
  | succ n ih =>
    have first := Common.right M s s 1 1 left
      (ListBlank.append (List.replicate n 1) (right.cons 0)) one
    simpa [List.replicate_succ', ListBlank.append_assoc, ListBlank.append] using
      first.trans (ih (left.cons 1))

/-- Scan a finite run of ones, then consume a zero and move left. -/
theorem scanL {q : Nat} (M : Machine q 2) (s t : Fin q) (write : Bit)
    (one : M.transition s 1 = some (1, .left, s))
    (zero : M.transition s 0 = some (write, .left, t)) (n : Nat)
    (left right : ListBlank Bit) :
    Runs M ⟨s, atL (ListBlank.append (List.replicate n 1) (left.cons 0)) right⟩
      ⟨t, atL left (ListBlank.append (write :: List.replicate n 1) right)⟩ := by
  induction n generalizing right with
  | zero => simpa [ListBlank.append] using Common.left M s t 0 write left right zero
  | succ n ih =>
    have first := Common.left M s s 1 1
      (ListBlank.append (List.replicate n 1) (left.cons 0)) right one
    simpa [List.replicate_succ', ListBlank.append_assoc, ListBlank.append] using
      first.trans (ih (right.cons 1))

/-- Indexed return controls traverse any finite word, preserving every bit. -/
theorem walkR {q : Nat} (M : Machine q 2) (control : Nat → Fin q)
    (bits : List Bit) (i : Nat) (left right : ListBlank Bit)
    (rows : ∀ j, i ≤ j → j < i + bits.length → ∀ bit,
      M.transition (control j) bit = some (bit, .right, control (j + 1))) :
    Runs M ⟨control i, Tape.mk' left (ListBlank.append bits right)⟩
      ⟨control (i + bits.length), Tape.mk' (ListBlank.append bits.reverse left) right⟩ := by
  induction bits generalizing i left with
  | nil => simpa [ListBlank.append] using
      (Relation.ReflTransGen.refl : Runs M ⟨control i, Tape.mk' left right⟩ _)
  | cons bit bits ih =>
    have first := Common.right M (control i) (control (i + 1)) bit bit left
      (ListBlank.append bits right) (rows i (by omega) (by simp))
    have rest := ih (i + 1) (left.cons bit) (by
      intro j lower upper b
      exact rows j (by omega) (by simp only [List.length_cons]; omega) b)
    simpa [List.length_cons, Nat.add_assoc, List.reverse_cons, ListBlank.append_assoc,
      ListBlank.append] using first.trans rest

end ConjectureMachines.Compilation.Parsimony.Common
