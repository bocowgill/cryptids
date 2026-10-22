/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.FieldCompiler.Operations

/-! # Global thirteen-bit field tape representation and finite input encoding -/

@[expose] public section
namespace ConjectureMachines.Compilation.FieldCompiler.Codec
open Turing FieldBinary

set_option backward.isDefEq.respectTransparency false

/-- The Bool alphabet used by the finite compiler represents the same complete tape. -/
def RepTape (source : Tape Symbol) (binary : Tape Bool) : Prop :=
  FieldReturn.RepresentsTape source (binary.map boolMap)

theorem from_to_bool (bit : Bit) : fromBool (toBool bit) = bit := by
  fin_cases bit <;> rfl

theorem map_bit_roundtrip (tape : Tape Bit) : (tape.map bitMap).map boolMap = tape := by
  rcases tape with ⟨head, left, right⟩
  congr 1
  · exact from_to_bool head
  · apply ListBlank.ext
    intro i
    simpa only [Tape.map, ListBlank.nth_map] using from_to_bool (left.nth i)
  · apply ListBlank.ext
    intro i
    simpa only [Tape.map, ListBlank.nth_map] using from_to_bool (right.nth i)

theorem rep_map (source : Tape Symbol) (bits : Tape Bit)
    (rep : FieldReturn.RepresentsTape source bits) : RepTape source (bits.map bitMap) := by
  simpa only [RepTape, map_bit_roundtrip] using rep

theorem symbolCell_blank :
    FieldReturn.symbolCell (default : Symbol) = (false, fun _ ↦ 0) := rfl

/-- Main, rev, aux, stack occupy bits zero through eleven; bit twelve is the marker. -/
def cellBits (symbol : Symbol) : List Bit :=
  List.ofFn (encodeCell (FieldReturn.symbolCell symbol))

@[simp] theorem cellBits_length (symbol : Symbol) : (cellBits symbol).length = 13 := by
  simp [cellBits]

theorem cellBits_getI (symbol : Symbol) (j : Fin 13) :
    (cellBits symbol).getI j.val = encodeCell (FieldReturn.symbolCell symbol) j := by
  rw [List.getI_eq_getElem (by simpa using j.isLt)]
  simp [cellBits]

/-- The finite binary initializer emits exactly one complete block per source symbol. -/
def bitInput : List Symbol → List Bit
  | [] => []
  | symbol :: rest => cellBits symbol ++ bitInput rest

def input (values : List Symbol) : List Bool := (bitInput values).map toBool

theorem bitInput_length (values : List Symbol) : (bitInput values).length = 13 * values.length := by
  induction values with
  | nil => rfl
  | cons symbol rest ih =>
    simp only [bitInput, List.length_append, cellBits_length, ih, List.length_cons]
    omega

theorem input_length (values : List Symbol) : (input values).length = 13 * values.length := by
  simpa only [input, List.length_map] using bitInput_length values

/-- This includes all coordinates beyond the finite list: both sides then encode blanks. -/
theorem bitInput_getI (values : List Symbol) (n : Nat) (j : Fin 13) :
    (bitInput values).getI (13 * n + j.val) =
      encodeCell (FieldReturn.symbolCell (values.getI n)) j := by
  induction values generalizing n with
  | nil =>
    simp only [bitInput, List.getI_nil]
    change (0 : Bit) = encodeCell (FieldReturn.symbolCell (default : Symbol)) j
    rw [symbolCell_blank, encode_blank]
  | cons symbol rest ih =>
    cases n with
    | zero =>
      simp only [bitInput, Nat.mul_zero, zero_add, List.getI_cons_zero]
      rw [List.getI_append _ _ _ (by simpa using j.isLt)]
      exact cellBits_getI symbol j
    | succ n =>
      rw [bitInput, List.getI_append_right _ _ _ (by simp only [cellBits_length]; omega)]
      have index : 13 * (n + 1) + j.val - (cellBits symbol).length = 13 * n + j.val := by
        rw [cellBits_length]
        omega
      rw [index, List.getI_cons_succ]
      exact ih n

theorem mk₁_nth_nat {Γ : Type} [Inhabited Γ] (values : List Γ) (n : Nat) :
    (Tape.mk₁ values).nth (n : Int) = values.getI n := by
  simp only [Tape.mk₁, Tape.mk₂, Tape.mk'_nth_nat, ListBlank.nth_mk]

theorem mk₁_nth_neg {Γ : Type} [Inhabited Γ] (values : List Γ) (i : Int) (neg : i < 0) :
    (Tape.mk₁ values).nth i = default := by
  cases i with
  | ofNat n => omega
  | negSucc n => rfl

/-- Every integer tape coordinate is derived from the actual finite initializer. -/
theorem bitInput_rep (values : List Symbol) :
    FieldReturn.RepresentsTape (Tape.mk₁ values) (Tape.mk₁ (bitInput values)) := by
  intro i j
  cases i with
  | ofNat n =>
    have index : 13 * (n : Int) + (j.val : Int) = ((13 * n + j.val : Nat) : Int) := by
      omega
    rw [index, mk₁_nth_nat, mk₁_nth_nat, bitInput_getI]
  | negSucc n =>
    have bitNeg : 13 * Int.negSucc n + (j.val : Int) < 0 := by
      have := j.isLt
      omega
    rw [mk₁_nth_neg _ _ bitNeg, mk₁_nth_neg _ _ (by omega), symbolCell_blank, encode_blank]

theorem input_map (values : List Symbol) :
    (Tape.mk₁ (input values)).map boolMap = Tape.mk₁ (bitInput values) := by
  have encoded : Tape.mk₁ (input values) = (Tape.mk₁ (bitInput values)).map bitMap := by
    rw [Tape.map_mk₁]
    rfl
  rw [encoded, map_bit_roundtrip]

/-- The compiler's real finite encoded input needs no representation assumption. -/
theorem input_rep (values : List Symbol) :
    RepTape (Tape.mk₁ values) (Tape.mk₁ (input values)) := by
  unfold RepTape
  rw [input_map]
  exact bitInput_rep values

theorem local_rep (source : Tape Symbol) (bits : Tape Bit)
    (rep : FieldReturn.RepresentsTape source bits) :
    Represents (FieldReturn.symbolCell source.head) bits :=
  FieldContinuation.local_rep source bits rep

/-- Updating any source coordinate agrees with the corresponding finite cell update. -/
theorem symbolCell_update (symbol : Symbol) (field : Fin 4) (value : Fin 5) :
    FieldReturn.symbolCell
      (symbol.1, Function.update symbol.2 (FieldReturn.stackAt field) (FieldReturn.codeSymbol value)) =
    updateCell (FieldReturn.symbolCell symbol) field value := by
  apply Prod.ext
  · rfl
  · funext i
    fin_cases field <;> fin_cases i <;>
      simp [FieldReturn.symbolCell, FieldReturn.stackAt, updateCell, FieldReturn.code_roundtrip]

/-- A field write preserves the global encoding, including both infinite neighbouring halves. -/
theorem write_rep (source : Tape Symbol) (bits : Tape Bit)
    (rep : FieldReturn.RepresentsTape source bits) (field : Fin 4) (value : Fin 5) :
    FieldReturn.RepresentsTape
      (source.write (source.head.1, Function.update source.head.2 (FieldReturn.stackAt field)
        (FieldReturn.codeSymbol value)))
      (written (fieldOffset field) (encodeWord value) bits) := by
  have cellWrite := write_valid_cell (FieldReturn.symbolCell source.head) bits field value
    (local_rep source bits rep)
  intro i j
  by_cases zero : i = 0
  · subst i
    simp only [Int.mul_zero, zero_add, Tape.nth_zero, Tape.write]
    change (written (fieldOffset field) (encodeWord value) bits).nth (j.val : Int) =
      encodeCell (FieldReturn.symbolCell
        (source.head.1, Function.update source.head.2 (FieldReturn.stackAt field)
          (FieldReturn.codeSymbol value))) j
    rw [symbolCell_update]
    simpa only [writeAt_execute] using cellWrite j
  · have fits := field_fits field
    have outside : 13 * i + (j.val : Int) < fieldOffset field ∨
        (fieldOffset field : Int) + 3 ≤ 13 * i + (j.val : Int) := by
      have := j.isLt
      omega
    rw [written_outside _ _ bits _ outside, Tape.write_nth]
    simp only [zero, ↓reduceIte]
    exact rep i j

theorem move_rep (source : Tape Symbol) (bits : Tape Bit)
    (rep : FieldReturn.RepresentsTape source bits) (dir : Dir) :
    FieldReturn.RepresentsTape (source.move dir) (shift dir 13 bits) := by
  cases dir with
  | left => exact FieldReturn.move_rep source bits rep
  | right => exact FieldContinuation.move_right_rep source bits rep

theorem read_rep (source : Tape Symbol) (bits : Tape Bit)
    (rep : FieldReturn.RepresentsTape source bits) (field : Fin 4) :
    decodeWord ((readAt (fieldOffset field)).execute bits).1 =
      FieldReturn.symbolCode (source.head.2 (FieldReturn.stackAt field)) ∧
      ((readAt (fieldOffset field)).execute bits).2 = bits :=
  read_valid_cell (FieldReturn.symbolCell source.head) bits field (local_rep source bits rep)

theorem marker_rep (source : Tape Symbol) (bits : Tape Bit)
    (rep : FieldReturn.RepresentsTape source bits) :
    (decide (bits.nth 12 ≠ 0)) = source.head.1 := by
  rw [FieldReturn.marker_rep source bits rep]
  cases source.head.1 <;> rfl

end ConjectureMachines.Compilation.FieldCompiler.Codec
