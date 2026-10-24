/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.FlatInit

/-! # Structural target-encoded unary extraction

These contracts describe ordinary binary TM steps and arbitrary exterior tape frames.
They certify the data-chain routine, not the complete introspective printer.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.Parsimony.Data

open Turing StateTransition

abbrev Bit := Fin 2

theorem step_cell {q : Nat} (M : Machine q 2) (source target : Fin q)
    (read write : Bit) (left right : ListBlank Bit)
    (row : M.transition source read = some (write, .right, target)) :
    step M ⟨source, Tape.mk' left (right.cons read)⟩ =
      some ⟨target, Tape.mk' (left.cons write) right⟩ := by
  simp [step, row]

/-- A uniform chain writes exactly its unary distance and one zero separator. -/
theorem unary_run {q : Nat} (M : Machine q 2) (control : Nat → Fin q)
    (exit : Fin q) (last : Nat)
    (more : ∀ i, i < last → M.transition (control i) 0 =
      some (1, .right, control (i + 1)))
    (final : M.transition (control last) 0 = some (0, .right, exit))
    (count : Nat) : ∀ (i : Nat), i + count = last → ∀ left right : ListBlank Bit,
    FlatInit.runFrom M (count + 1)
      ⟨control i, Tape.mk' left (ListBlank.append (List.replicate (count + 1) 0) right)⟩ =
      some ⟨exit, Tape.mk' (ListBlank.append (0 :: List.replicate count 1) left) right⟩ := by
  induction count with
  | zero =>
    intro i total left right
    have same : i = last := by omega
    subst i
    simpa [FlatInit.runFrom] using step_cell M (control last) exit 0 0 left right final
  | succ count ih =>
    intro i total left right
    have bound : i < last := by omega
    rw [FlatInit.runFrom]
    change (step M ⟨control i,
      Tape.mk' left ((ListBlank.append (List.replicate (count + 1) 0) right).cons 0)⟩).bind
      (FlatInit.runFrom M (count + 1)) = _
    rw [step_cell M (control i) (control (i + 1)) 0 1 _ _ (more i bound),
      Option.bind_some]
    simpa [List.replicate_succ', ListBlank.append_assoc] using
      ih (i + 1) (by omega) (left.cons 1) right

/-- Canonical relative data controls; only indices at most `last` are used. -/
def control (last i : Nat) : Fin (last + 2) := ⟨min i last, by omega⟩

def exit (last : Nat) : Fin (last + 2) := ⟨last + 1, by omega⟩

def wordAt (last : Nat) (values : Array (Fin (last + 1))) (i : Nat) : Fin (last + 1) :=
  values[i]?.getD 0

/-- The exact relative rows of the data block, stopping before the extractor entry. -/
def machine (last : Nat) (values : Array (Fin (last + 1))) : Machine (last + 2) 2 where
  transition source bit :=
    if inside : source.val < last + 1 then
      if bit = 0 then
        if source.val < last then
          some (1, .right, ⟨source.val + 1, by omega⟩)
        else some (0, .right, exit last)
      else some (0, .right, control last (last - (wordAt last values source.val).val))
    else none

theorem row_zero_more (last : Nat) (values : Array (Fin (last + 1))) (i : Nat)
    (bound : i < last) :
    (machine last values).transition (control last i) 0 =
      some (1, .right, control last (i + 1)) := by
  simp [machine, control, Nat.min_eq_left (by omega : i ≤ last), bound,
    show i < last + 1 by omega, Nat.min_eq_left (by omega : i + 1 ≤ last)]

theorem row_zero_last (last : Nat) (values : Array (Fin (last + 1))) :
    (machine last values).transition (control last last) 0 =
      some (0, .right, exit last) := by
  simp [machine, control]

theorem row_one (last : Nat) (values : Array (Fin (last + 1))) (i : Nat) (bound : i ≤ last) :
    (machine last values).transition (control last i) 1 =
      some (0, .right, control last (last - (wordAt last values i).val)) := by
  simp [machine, control, Nat.min_eq_left bound, show i < last + 1 by omega]

/-- Query the target-encoded word and materialize its unary value in exact finite time. -/
theorem query_run (last : Nat) (values : Array (Fin (last + 1))) (i : Nat) (bound : i ≤ last)
    (left right : ListBlank Bit) :
    let value := (wordAt last values i).val
    FlatInit.runFrom (machine last values) (value + 2)
      ⟨control last i,
        Tape.mk' left ((ListBlank.append (List.replicate (value + 1) 0) right).cons 1)⟩ =
      some ⟨exit last,
        Tape.mk' (ListBlank.append (0 :: List.replicate value 1) (left.cons 0)) right⟩ := by
  dsimp only
  rw [show (wordAt last values i).val + 2 = ((wordAt last values i).val + 1) + 1 by omega,
    FlatInit.runFrom, step_cell _ _ _ 1 0 _ _ (row_one last values i bound),
    Option.bind_some]
  exact unary_run (machine last values) (control last) (exit last) last
    (row_zero_more last values) (row_zero_last last values)
    (wordAt last values i).val (last - (wordAt last values i).val)
    (by have := (wordAt last values i).isLt; omega) (left.cons 0) right

end ConjectureMachines.Compilation.Parsimony.Data
