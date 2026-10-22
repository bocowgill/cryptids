/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.FlatInit

/-! # The three-bit seed and the thirteen-bit output cell

These definitions describe finite strings and complete tapes independently of chess.
The output argument is already in target order; consuming a seed letter prepends it.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.Seed

open Turing

abbrev Letter := Fin 4
abbrev Bit := Fin 2

/-- A bit of the nonzero code, with least-significant bit first. -/
def letterBit (letter : Letter) (position : Nat) : Bit :=
  ⟨((letter.val + 1) / 2 ^ position) % 2, Nat.mod_lt _ (by decide)⟩

def word (letter : Letter) : List Bit :=
  [letterBit letter 0, letterBit letter 1, letterBit letter 2]

def cell (letter : Letter) : List Bit := word letter ++ List.replicate 10 0

def payload (letters : List Letter) : List Bit := letters.flatMap word

def output (letters : List Letter) : List Bit := letters.flatMap cell

def marker : List Bit := [0, 1, 1, 1, 1, 0]

def seed (letters : List Letter) : List Bit :=
  marker ++ [0] ++ marker ++ payload letters ++ [0, 0, 0]

/-- Head at B's left guard; both infinite exterior regions are blank. -/
def loopTape (out todo : List Letter) : Tape Bit :=
  Tape.mk'
    (ListBlank.mk (List.replicate (1 + 3 * out.length) 0 ++ (output out).reverse ++
      marker.reverse))
    (ListBlank.mk (marker ++ payload todo ++ [0, 0, 0]))

@[simp] theorem word_zero : word 0 = [1, 0, 0] := rfl
@[simp] theorem word_one : word 1 = [0, 1, 0] := rfl
@[simp] theorem word_two : word 2 = [1, 1, 0] := rfl
@[simp] theorem word_three : word 3 = [0, 0, 1] := rfl

@[simp] theorem word_length (letter : Letter) : (word letter).length = 3 := rfl

@[simp] theorem cell_length (letter : Letter) : (cell letter).length = 13 := by
  simp [cell]

@[simp] theorem marker_length : marker.length = 6 := rfl
@[simp] theorem marker_reverse : marker.reverse = marker := rfl
@[simp] theorem payload_nil : payload [] = [] := rfl
@[simp] theorem output_nil : output [] = [] := rfl

@[simp] theorem payload_cons (letter : Letter) (letters : List Letter) :
    payload (letter :: letters) = word letter ++ payload letters := rfl

@[simp] theorem output_cons (letter : Letter) (letters : List Letter) :
    output (letter :: letters) = cell letter ++ output letters := rfl

@[simp] theorem payload_length (letters : List Letter) :
    (payload letters).length = 3 * letters.length := by
  induction letters with
  | nil => rfl
  | cons letter letters ih => simp [ih, Nat.mul_add, Nat.add_comm]

@[simp] theorem output_length (letters : List Letter) :
    (output letters).length = 13 * letters.length := by
  induction letters with
  | nil => rfl
  | cons letter letters ih => simp [ih, Nat.mul_add, Nat.add_comm]

@[simp] theorem seed_length (letters : List Letter) :
    (seed letters).length = 16 + 3 * letters.length := by
  simp [seed, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

@[simp] theorem payload_append (first second : List Letter) :
    payload (first ++ second) = payload first ++ payload second := by
  simp [payload]

@[simp] theorem output_append (first second : List Letter) :
    output (first ++ second) = output first ++ output second := by
  simp [output]

end ConjectureMachines.Compilation.Seed
