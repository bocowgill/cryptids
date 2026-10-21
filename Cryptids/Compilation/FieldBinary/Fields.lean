/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.FieldBinary.Routine

/-! # Three-bit fields in thirteen-bit simultaneous-stack cells

The geometric contracts hold on every binary tape, including arbitrary neighbouring cells
and unused field codes. A write changes exactly its three addressed bits.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.FieldBinary
open Turing

abbrev Word := Bit × Bit × Bit

def shift (dir : Dir) : Nat → Tape Bit → Tape Bit
  | 0, tape => tape
  | n + 1, tape => shift dir n (tape.move dir)

theorem shift_right_nth (n : Nat) (tape : Tape Bit) (i : Int) :
    (shift .right n tape).nth i = tape.nth (i + n) := by
  induction n generalizing tape with
  | zero => simp [shift]
  | succ n ih =>
    simp only [shift, ih, Tape.move_right_nth, Nat.cast_add, Nat.cast_one]
    congr 1
    omega

theorem shift_left_nth (n : Nat) (tape : Tape Bit) (i : Int) :
    (shift .left n tape).nth i = tape.nth (i - n) := by
  induction n generalizing tape with
  | zero => simp [shift]
  | succ n ih =>
    simp only [shift, ih, Tape.move_left_nth, Nat.cast_add, Nat.cast_one]
    congr 1
    omega

/-- Pointwise integer tape coordinates determine the complete zipper. -/
theorem tape_ext_nth (first second : Tape Bit) (same : ∀ i, first.nth i = second.nth i) :
    first = second := by
  rcases first with ⟨a, left, right⟩
  rcases second with ⟨b, otherLeft, otherRight⟩
  have head : a = b := same 0
  subst b
  congr 1
  · apply ListBlank.ext
    intro n
    exact same (-(n + 1 : Nat) : Int)
  · apply ListBlank.ext
    intro n
    exact same (n + 1 : Nat)

theorem shift_add (dir : Dir) (a b : Nat) (tape : Tape Bit) :
    shift dir (a + b) tape = shift dir b (shift dir a tape) := by
  induction a generalizing tape with
  | zero => simp [shift]
  | succ a ih => simpa only [Nat.succ_add, shift] using ih (tape.move dir)

@[simp] theorem shift_left_right (n : Nat) (tape : Tape Bit) :
    shift .left n (shift .right n tape) = tape := by
  apply tape_ext_nth
  intro i
  simp [shift_left_nth, shift_right_nth]

@[simp] theorem shift_right_left (n : Nat) (tape : Tape Bit) :
    shift .right n (shift .left n tape) = tape := by
  apply tape_ext_nth
  intro i
  simp [shift_left_nth, shift_right_nth]

namespace Routine
variable {α : Type}

def chain (actions : List Init.Instruction) (rest : Routine α) : Routine α :=
  actions.foldr Routine.next rest

@[simp] theorem chain_size (actions : List Init.Instruction) (rest : Routine α) :
    (chain actions rest).size = rest.size + actions.length := by
  induction actions with
  | nil => rfl
  | cons action actions ih =>
    change (chain actions rest).size + 1 = rest.size + (actions.length + 1)
    omega

@[simp] theorem chain_execute (actions : List Init.Instruction) (rest : Routine α)
    (tape : Tape Bit) :
    (chain actions rest).execute tape = rest.execute (Init.executeList actions tape) := by
  induction actions generalizing tape with
  | nil => rfl
  | cons action actions ih => simpa only [chain, List.foldr_cons, execute,
      Init.executeList] using ih (Init.execute action tape)

def moves (dir : Dir) (n : Nat) (rest : Routine α) : Routine α :=
  chain (List.replicate n (none, dir)) rest

@[simp] theorem moves_size (dir : Dir) (n : Nat) (rest : Routine α) :
    (moves dir n rest).size = rest.size + n := by simp [moves]

theorem execute_moves (dir : Dir) (n : Nat) (rest : Routine α) (tape : Tape Bit) :
    (moves dir n rest).execute tape = rest.execute (shift dir n tape) := by
  induction n generalizing tape with
  | zero => rfl
  | succ n ih =>
    simpa only [moves, List.replicate_succ, chain, List.foldr_cons, execute,
      Init.execute, Option.getD_none, Tape.write_self, shift] using ih (tape.move dir)

end Routine

def wordHere (tape : Tape Bit) : Word :=
  (tape.head, (tape.move .right).head, ((tape.move .right).move .right).head)

def wordAt (offset : Nat) (tape : Tape Bit) : Word := wordHere (shift .right offset tape)

/-- Seven read-and-move controls followed by a continuation selected by three bits. -/
def read3 {α : Type} (k : Word → Routine α) : Routine α :=
  .read .right
    (.read .right (.read .right (k (0, 0, 0)) (k (0, 0, 1)))
      (.read .right (k (0, 1, 0)) (k (0, 1, 1))))
    (.read .right (.read .right (k (1, 0, 0)) (k (1, 0, 1)))
      (.read .right (k (1, 1, 0)) (k (1, 1, 1))))

theorem bit_cases (bit : Bit) : bit = 0 ∨ bit = 1 := by
  fin_cases bit <;> simp

theorem read3_execute {α : Type} (k : Word → Routine α) (tape : Tape Bit) :
    (read3 k).execute tape = (k (wordHere tape)).execute (shift .right 3 tape) := by
  rcases bit_cases tape.head with a | a <;>
    rcases bit_cases (tape.move .right).head with b | b <;>
      rcases bit_cases ((tape.move .right).move .right).head with c | c <;>
        simp [read3, Routine.execute, a, b, c, wordHere, shift]

/-- Read a field and restore the exact initial head and all tape cells. -/
def readAt (offset : Nat) : Routine Word :=
  .moves .right offset (read3 fun word ↦ .moves .left (offset + 3) (.exit word))

theorem readAt_execute (offset : Nat) (tape : Tape Bit) :
    (readAt offset).execute tape = (wordAt offset tape, tape) := by
  simp only [readAt, Routine.execute_moves, read3_execute, Routine.execute]
  rw [← shift_add .right offset 3, shift_left_right]
  rfl

theorem readAt_size (offset : Nat) : (readAt offset).size = 9 * offset + 39 := by
  simp [readAt, read3, Routine.size]
  omega

/-- Fused final write-and-left-move saves two movement controls. -/
def writeAt (offset : Nat) (word : Word) : Routine Unit :=
  .moves .right offset (.next (some word.1, .right)
    (.next (some word.2.1, .right) (.next (some word.2.2, .left)
      (.moves .left (offset + 1) (.exit ())))))

def written (offset : Nat) (word : Word) (tape : Tape Bit) : Tape Bit :=
  let first := (shift .right offset tape).write word.1
  let second := (first.move .right).write word.2.1
  let third := (second.move .right).write word.2.2
  shift .left (offset + 1) (third.move .left)

theorem writeAt_execute (offset : Nat) (word : Word) (tape : Tape Bit) :
    (writeAt offset word).execute tape = ((), written offset word tape) := by
  simp only [writeAt, Routine.execute_moves, Routine.execute, Init.execute,
    Option.getD_some, written]

theorem writeAt_size (offset : Nat) (word : Word) :
    (writeAt offset word).size = 2 * offset + 5 := by
  simp [writeAt, Routine.size]
  omega

/-- Exact coordinate contract, including every bit outside the written field. -/
theorem written_nth (offset : Nat) (word : Word) (tape : Tape Bit) (i : Int) :
    (written offset word tape).nth i =
      if i = (offset : Int) + 2 then word.2.2 else
      if i = (offset : Int) + 1 then word.2.1 else
      if i = (offset : Int) then word.1 else tape.nth i := by
  simp only [written, shift_left_nth, shift_right_nth, Tape.move_left_nth,
    Tape.move_right_nth, Tape.write_nth, Nat.cast_add, Nat.cast_one]
  have h2 : i - ((offset : Int) + 1) - 1 = 0 ↔ i = (offset : Int) + 2 := by omega
  have h1 : i - ((offset : Int) + 1) - 1 + 1 = 0 ↔ i = (offset : Int) + 1 := by omega
  have h0 : i - ((offset : Int) + 1) - 1 + 1 + 1 = 0 ↔ i = (offset : Int) := by omega
  have index : i - ((offset : Int) + 1) - 1 + 1 + 1 + offset = i := by omega
  simp only [h2, h1, h0, index]

theorem written_outside (offset : Nat) (word : Word) (tape : Tape Bit) (i : Int)
    (outside : i < offset ∨ (offset : Int) + 3 ≤ i) :
    (written offset word tape).nth i = tape.nth i := by
  have h2 : i ≠ (offset : Int) + 2 := by omega
  have h1 : i ≠ (offset : Int) + 1 := by omega
  have h0 : i ≠ (offset : Int) := by omega
  simp only [written_nth, h2, h1, h0, ↓reduceIte]

/-- Movement enters the same field boundary in the adjacent thirteen-bit cell. -/
def moveCell (dir : Dir) : Routine Unit := .moves dir 13 (.exit ())

theorem moveCell_execute (dir : Dir) (tape : Tape Bit) :
    (moveCell dir).execute tape = ((), shift dir 13 tape) :=
  Routine.execute_moves dir 13 (.exit ()) tape

theorem moveCell_size (dir : Dir) : (moveCell dir).size = 14 := by
  simp [moveCell, Routine.size]

/-- Four fields fit before the marker at coordinate twelve. -/
def fieldOffset (field : Fin 4) : Nat := 3 * field.val

theorem field_fits (field : Fin 4) : fieldOffset field + 3 ≤ 12 := by
  unfold fieldOffset
  omega

end ConjectureMachines.Compilation.FieldBinary
