/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.Seed.ChessCodec
public import Mathlib.Data.Num.Lemmas

/-! # The structured table packet and the original natural-word encoding

Natural words use the existing `trList` translation. The binary-prefix recurrence is guarded
because a leading zero is omitted from the canonical representation of zero.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.TableSeed

open Turing PartrecToTM2

abbrev Letter := Seed.Letter
abbrev Bit := Seed.Bit

structure Row where
  tag : Fin 7
  left : Fin 8192
  right : Fin 8192
  deriving DecidableEq

def consLetter : Letter := 1
def separatorLetter : Letter := 0
def bitLetter (bit : Bool) : Letter := if bit then 3 else 2

/-- The original natural word, including its terminating `cons` symbol. -/
def W (value : Nat) : List Letter := (trList [value]).map Seed.ofSymbol

def numWord (value : Num) : List Letter := (trNum value ++ [Γ'.cons]).map Seed.ofSymbol

theorem W_eq_numWord (value : Nat) : W value = numWord (value : Num) := rfl

@[simp] theorem W_zero : W 0 = [consLetter] := rfl

theorem numWord_bit (bit : Bool) (value : Num) (guard : value ≠ 0 ∨ bit = true) :
    numWord (cond bit Num.bit1 Num.bit0 value) = bitLetter bit :: numWord value := by
  cases bit with
  | false =>
    cases value with
    | zero => simp at guard
    | pos value => rfl
  | true => cases value <;> rfl

theorem numCast_bit (bit : Bool) (value : Nat) :
    ((Nat.bit bit value : Nat) : Num) = cond bit Num.bit1 Num.bit0 (value : Num) := by
  simpa only [Num.ofNat'_eq] using Num.ofNat'_bit bit value

/-- A new most-significant prefix bit is prepended to the original low-bit-first word. -/
theorem W_bit (bit : Bool) (value : Nat) (guard : value ≠ 0 ∨ bit = true) :
    W (Nat.bit bit value) = bitLetter bit :: W value := by
  have numGuard : (value : Num) ≠ 0 ∨ bit = true := by
    rcases guard with nonzero | one
    · left
      intro zero
      apply nonzero
      have natural := congrArg (fun n : Num ↦ (n : Nat)) zero
      simpa only [Num.to_of_nat, Num.cast_zero] using natural
    · exact Or.inr one
  rw [W_eq_numWord, numCast_bit, numWord_bit bit (value : Num) numGuard, W_eq_numWord]

/-- Reading a leading zero retains the canonical zero word. -/
theorem W_leading_zero : W (Nat.bit false 0) = W 0 := rfl

/-- A Boolean digit as a physical binary symbol. -/
def bitValue (bit : Bool) : Bit := if bit then 1 else 0

/-- Exactly `width` bits in most-significant-first order, including leading zeros. -/
def fixedBits : Nat → Nat → List Bit
  | 0, _ => []
  | width + 1, value => fixedBits width (value / 2) ++ [bitValue (Nat.bodd value)]

def readValue (initial : Nat) (bits : List Bit) : Nat :=
  bits.foldl (fun value bit ↦ Nat.bit (decide (bit = 1)) value) initial

/-- Row tags use the opposite order from the fixed-width operands. -/
def tagBits (tag : Fin 7) : List Bit := (fixedBits 3 tag.val).reverse

def fieldBits (value : Fin 8192) : List Bit := fixedBits 13 value.val

def rowBits (row : Row) : List Bit :=
  tagBits row.tag ++ fieldBits row.right ++ fieldBits row.left

def rowLetters (row : Row) : List Letter :=
  W row.tag.val ++ W row.left.val ++ W row.right.val

def header : List Bit := Seed.marker ++ [0] ++ Seed.marker

/-- The suffix, rows, and prefix are consumed in the order that supports prepending. -/
def packet (pre : List Letter) (rows : List Row) (post : List Letter) : List Bit :=
  header ++ Seed.payload post.reverse ++ [0, 0, 0] ++ rows.reverse.flatMap rowBits ++
    [1, 1, 1] ++ Seed.payload pre.reverse ++ [0, 0, 0]

/-- Original row order and the original mandatory table/argument separator. -/
def letters (pre : List Letter) (rows : List Row) (post : List Letter) : List Letter :=
  pre ++ rows.flatMap rowLetters ++ [separatorLetter] ++ post

end ConjectureMachines.Compilation.TableSeed
