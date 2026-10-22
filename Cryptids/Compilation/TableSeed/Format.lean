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
    | zero =>
      rcases guard with nonzero | one
      · exact (nonzero rfl).elim
      · cases one
    | pos value => rfl
  | true => cases value <;> rfl

theorem numCast_bit (bit : Bool) (value : Nat) :
    ((Nat.bit bit value : Nat) : Num) = cond bit Num.bit1 Num.bit0 (value : Num) := by
  simpa only [Num.ofNat'_eq] using Num.ofNat'_bit bit value

/-- Extending an MSB-read prefix prepends its new low bit to the original word. -/
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

/-- The stable output invariant after a consumed operand bit and its optional emission. -/
theorem W_prefix_step (value : Nat) (bit : Bool) (base : List Letter) :
    W (Nat.bit bit value) ++ base =
      if value = 0 ∧ bit = false then W value ++ base
      else bitLetter bit :: (W value ++ base) := by
  by_cases skip : value = 0 ∧ bit = false
  · rcases skip with ⟨rfl, rfl⟩
    rfl
  · have guard : value ≠ 0 ∨ bit = true := by
      cases bit <;> simp_all
    rw [if_neg skip, W_bit bit value guard, List.cons_append]

/-- A Boolean digit as a physical binary symbol. -/
def bitValue (bit : Bool) : Bit := if bit then 1 else 0

/-- Exactly `width` bits in most-significant-first order, including leading zeros. -/
def fixedBits : Nat → Nat → List Bit
  | 0, _ => []
  | width + 1, value => fixedBits width (value / 2) ++ [bitValue (Nat.bodd value)]

def readValue (initial : Nat) (bits : List Bit) : Nat :=
  bits.foldl (fun value bit ↦ Nat.bit (decide (bit = 1)) value) initial

@[simp] theorem bitValue_decide (bit : Bool) : decide (bitValue bit = 1) = bit := by
  cases bit <;> rfl

@[simp] theorem fixedBits_length (width value : Nat) : (fixedBits width value).length = width := by
  induction width generalizing value with
  | zero => rfl
  | succ width ih =>
    simp only [fixedBits, List.length_append, List.length_cons, List.length_nil, ih]

theorem readValue_append (initial : Nat) (first second : List Bit) :
    readValue initial (first ++ second) = readValue (readValue initial first) second := by
  simp only [readValue, List.foldl_append]

/-- Fixed-width digits recover their supplied value whenever it fits in the field. -/
theorem fixedBits_value (width value : Nat) (bound : value < 2 ^ width) :
    readValue 0 (fixedBits width value) = value := by
  induction width generalizing value with
  | zero =>
    simp only [pow_zero] at bound
    have zero : value = 0 := by omega
    subst value
    rfl
  | succ width ih =>
    have halfBound : value / 2 < 2 ^ width := by
      rw [pow_succ] at bound
      omega
    rw [fixedBits, readValue_append, ih (value / 2) halfBound]
    simp only [readValue, List.foldl_cons, List.foldl_nil, bitValue_decide]
    exact Nat.bit_bodd_div2 value

theorem half_testBit (value position : Nat) :
    (value / 2).testBit position = value.testBit (position + 1) := by
  cases value using Nat.bitCasesOn with
  | bit bit value => simp only [Nat.bit_div_two, Nat.testBit_bit_succ]

/-- The next physical bit has the highest remaining significance. -/
theorem fixedBits_head (width value : Nat) :
    fixedBits (width + 1) value = bitValue (value.testBit width) :: fixedBits width value := by
  induction width generalizing value with
  | zero => rfl
  | succ width ih =>
    change (fixedBits (width + 1) (value / 2) ++ [bitValue (Nat.bodd value)]) =
      bitValue (value.testBit (width + 1)) ::
        (fixedBits width (value / 2) ++ [bitValue (Nat.bodd value)])
    rw [ih, List.cons_append, half_testBit]

/-- Row tags use the opposite order from the fixed-width operands. -/
def tagBits (tag : Fin 7) : List Bit := (fixedBits 3 tag.val).reverse

def fieldBits (value : Fin 8192) : List Bit := fixedBits 13 value.val

theorem fieldBits_value (value : Fin 8192) : readValue 0 (fieldBits value) = value.val :=
  fixedBits_value 13 value.val value.isLt

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

theorem rowLetters_eq_trList (row : Row) :
    rowLetters row = (trList [row.tag.val, row.left.val, row.right.val]).map Seed.ofSymbol := by
  simp only [rowLetters, W, trList, List.map_append, List.map_cons, List.map_nil,
    List.append_nil, List.append_assoc, List.cons_append]

/-- Prepending blocks while reading reversed rows restores their original order. -/
theorem prepend_blocks_reverse {α : Type} (values : List α) (block : α → List Letter)
    (base : List Letter) :
    values.reverse.foldl (fun out value ↦ block value ++ out) base =
      values.flatMap block ++ base := by
  induction values with
  | nil => rfl
  | cons value values ih =>
    simp only [List.reverse_cons, List.foldl_append, List.foldl_cons, List.foldl_nil, ih,
      List.flatMap_cons, List.append_assoc]

theorem rows_reverse (rows : List Row) (base : List Letter) :
    rows.reverse.foldl (fun out row ↦ rowLetters row ++ out) base =
      rows.flatMap rowLetters ++ base :=
  prepend_blocks_reverse rows rowLetters base

/-- Prepending reversed literal phases restores their original order. -/
theorem literals_reverse (values base : List Letter) :
    values.reverse.foldl (fun out letter ↦ letter :: out) base = values ++ base := by
  induction values with
  | nil => rfl
  | cons value values ih =>
    simp only [List.reverse_cons, List.foldl_append, List.foldl_cons, List.foldl_nil, ih,
      List.cons_append]

@[simp] theorem tagBits_length (tag : Fin 7) : (tagBits tag).length = 3 := by
  simp only [tagBits, List.length_reverse, fixedBits_length]

@[simp] theorem fieldBits_length (value : Fin 8192) : (fieldBits value).length = 13 :=
  fixedBits_length 13 value.val

@[simp] theorem rowBits_length (row : Row) : (rowBits row).length = 29 := by
  simp only [rowBits, List.length_append, tagBits_length, fieldBits_length]

@[simp] theorem header_length : header.length = 13 := rfl

theorem rowsBits_length (rows : List Row) : (rows.flatMap rowBits).length = 29 * rows.length := by
  induction rows with
  | nil => rfl
  | cons row rows ih =>
    simp only [List.flatMap_cons, List.length_append, rowBits_length, ih, List.length_cons]
    omega

theorem packet_length (pre : List Letter) (rows : List Row) (post : List Letter) :
    (packet pre rows post).length = 22 + 3 * (pre.length + post.length) + 29 * rows.length := by
  simp only [packet, List.length_append, header_length, Seed.payload_length,
    List.length_reverse, List.length_cons, List.length_nil, rowsBits_length]
  omega

@[simp] theorem letters_empty : letters [] [] [] = [separatorLetter] := rfl

end ConjectureMachines.Compilation.TableSeed
