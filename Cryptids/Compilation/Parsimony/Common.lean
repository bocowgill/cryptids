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

set_option backward.isDefEq.respectTransparency false

abbrev Bit := Fin 2

/-- Ordinary finite machine reachability, including a zero-step path. -/
abbrev Runs {q : Nat} (M : Machine q 2) (a b : Cfg q 2) : Prop :=
  ReflTransGen (fun first second ↦ step M first = some second) a b

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
  simp [step, row, atL, Tape.move]

/-- A finite constant run commutes with one identical terminal cell. -/
theorem replicate_cons (bit : Bit) (n : Nat) (frame : ListBlank Bit) :
    ListBlank.append (List.replicate n bit) (frame.cons bit) =
      (ListBlank.append (List.replicate n bit) frame).cons bit := by
  induction n with
  | zero => rfl
  | succ n ih => simp only [List.replicate_succ, ListBlank.append, ih]

/-- A convenient left step when both the current and preceding cell are exposed. -/
theorem leftCell {q : Nat} (M : Machine q 2) (s t : Fin q) (read write peek : Bit)
    (left right : ListBlank Bit)
    (row : M.transition s read = some (write, .left, t)) :
    Runs M ⟨s, Tape.mk' (left.cons peek) (right.cons read)⟩
      ⟨t, Tape.mk' left ((right.cons write).cons peek)⟩ := by
  simpa only [atL_cons] using Common.left M s t read write (left.cons peek) right row

/-- Preserve a fixed finite run while moving right, without reading the following cell. -/
theorem repeatR {q : Nat} (M : Machine q 2) (s : Fin q) (bit : Bit)
    (row : M.transition s bit = some (bit, .right, s)) (n : Nat)
    (left right : ListBlank Bit) :
    Runs M ⟨s, Tape.mk' left (ListBlank.append (List.replicate n bit) right)⟩
      ⟨s, Tape.mk' (ListBlank.append (List.replicate n bit) left) right⟩ := by
  induction n generalizing left with
  | zero => exact .refl
  | succ n ih =>
    have first := Common.right M s s bit bit left
      (ListBlank.append (List.replicate n bit) right) row
    simpa only [List.replicate_succ, ListBlank.append, replicate_cons] using
      first.trans (ih (left.cons bit))

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
    simpa only [List.replicate_succ, ListBlank.append, replicate_cons] using
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
    simpa only [List.replicate_succ, ListBlank.append, replicate_cons] using
      first.trans (ih (right.cons 1))

/-- Indexed return controls traverse any finite word, preserving every bit. -/
theorem walkR {q : Nat} (M : Machine q 2) (control : Nat → Fin q)
    (bits : List Bit) (i : Nat) (left right : ListBlank Bit)
    (rows : ∀ j, i ≤ j → j < i + bits.length → ∀ bit,
      M.transition (control j) bit = some (bit, .right, control (j + 1))) :
    Runs M ⟨control i, Tape.mk' left (ListBlank.append bits right)⟩
      ⟨control (i + bits.length), Tape.mk' (ListBlank.append bits.reverse left) right⟩ := by
  induction bits generalizing i left with
  | nil => exact .refl
  | cons bit bits ih =>
    have first := Common.right M (control i) (control (i + 1)) bit bit left
      (ListBlank.append bits right) (rows i (by omega) (by simp) bit)
    have rest := ih (i + 1) (left.cons bit) (by
      intro j lower upper b
      exact rows j (by omega) (by simp only [List.length_cons]; omega) b)
    simpa [List.length_cons, Nat.add_assoc, Nat.add_comm 1 bits.length,
      List.reverse_cons, ListBlank.append_assoc,
      ListBlank.append] using first.trans rest

end ConjectureMachines.Compilation.Parsimony.Common
