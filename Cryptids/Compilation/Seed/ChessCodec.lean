/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.Seed.Format
public import Cryptids.Chess.Optimisation.FieldSelective

/-! # Exact identity with the frozen chess field codec

The four seed letters retain the original stack symbols and their order. The universal tape
identity includes the initial bottom marker, the head position, and both blank exterior regions.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.Seed

open Turing PartrecToTM2

set_option backward.isDefEq.respectTransparency false

/-- The existing field codec's nonzero codes, with their common offset removed. -/
def ofSymbol : Γ' → Letter
  | .consₗ => 0
  | .cons => 1
  | .bit0 => 2
  | .bit1 => 3

/-- A symbol in the initial main stack, with all other fields absent. -/
def unmarkedSymbol (symbol : Γ') : FieldReturn.Symbol :=
  (false, Function.update (fun _ ↦ none) K'.main (some symbol))

theorem cell_eq (symbol : Γ') :
    FieldCompiler.Codec.cellBits (unmarkedSymbol symbol) = cell (ofSymbol symbol) := by
  cases symbol <;> rfl

theorem bitInput_map (values : List Γ') :
    FieldCompiler.Codec.bitInput (values.map unmarkedSymbol) =
      output (values.map ofSymbol) := by
  induction values with
  | nil => rfl
  | cons symbol values ih =>
    simp only [List.map_cons, FieldCompiler.Codec.bitInput, output_cons, cell_eq, ih]

theorem markedOutput_nil :
    markedOutput [] = Tape.mk₁
      (FieldCompiler.Codec.cellBits (true, fun _ ↦ none)) := by
  rfl

theorem markedOutput_cons (symbol : Γ') (letters : List Letter) :
    markedOutput (ofSymbol symbol :: letters) = Tape.mk₁
      (FieldCompiler.Codec.cellBits (true, (unmarkedSymbol symbol).2) ++ output letters) := by
  cases symbol <;> rfl

theorem markedOutput_reversed (values : List Γ') :
    markedOutput (values.map ofSymbol) = Tape.mk₁
      (FieldCompiler.Codec.bitInput
        ((true, (values.map unmarkedSymbol).headI.2) ::
          (values.map unmarkedSymbol).tail)) := by
  cases values with
  | nil => exact markedOutput_nil
  | cons symbol values =>
    simp only [List.map_cons, List.headI_cons, List.tail_cons, FieldCompiler.Codec.bitInput,
      bitInput_map]
    exact markedOutput_cons symbol (values.map ofSymbol)

/-- Every original stack yields exactly the existing complete thirteen-bit input tape. -/
theorem markedOutput_bitInput (values : List Γ') :
    markedOutput ((values.map ofSymbol).reverse) = Tape.mk₁
      (FieldCompiler.Codec.bitInput (TM2to1.trInit K'.main values)) := by
  simpa only [List.map_reverse, TM2to1.trInit, unmarkedSymbol] using
    markedOutput_reversed values.reverse

theorem encode_toBool (bit : Bit) : Binary.encodeSymbol (FieldCompiler.toBool bit) = bit := by
  fin_cases bit <;> rfl

theorem input_map_encode (values : List FieldReturn.Symbol) :
    (FieldCompiler.Codec.input values).map Binary.encodeSymbol =
      FieldCompiler.Codec.bitInput values := by
  simp only [FieldCompiler.Codec.input, List.map_map, Function.comp_def, encode_toBool,
    List.map_id_fun', id_eq]

/-- The ordinary binary symbols agree after the existing Bool codec conversion. -/
theorem markedOutput_input (values : List Γ') :
    markedOutput ((values.map ofSymbol).reverse) = Tape.mk₁
      ((FieldCompiler.Codec.input (TM2to1.trInit K'.main values)).map Binary.encodeSymbol) := by
  rw [input_map_encode]
  exact markedOutput_bitInput values

namespace ChessCodec

/-- The frozen complete chess stack, in the order consumed by the seed controller. -/
def letters : List Letter := Chess.Compilation.Input.stack.map ofSymbol

/-- The full finite seed installed by a paid blank-tape writer. -/
def bits : Array Bit := (seed letters).toArray

theorem letters_length : letters.length = 141380 := by
  simp only [letters, List.length_map, Chess.Compilation.Input.stack_length]

theorem bits_toList : bits.toList = seed letters := List.toList_toArray

theorem bits_size : bits.size = 424156 := by
  simp only [bits, List.size_toArray, seed_length, letters_length]

/-- One state per seed bit and the final move are all included in the writer. -/
theorem writer_states : bits.size + 1 = 424157 := by
  rw [bits_size]

/-- The existing paid reverse writer has exactly the stated number of controls. -/
theorem paid_writer_states :
    (Chess.Optimisation.OpenEvolveWide.schedule bits).size = 424157 := by
  rw [Chess.Optimisation.OpenEvolveWide.schedule_size]
  exact writer_states

/-- The exact tape expected by the accepted complete selective chess body. -/
theorem output_eq :
    markedOutput letters.reverse = Tape.mk₁ Chess.Optimisation.FieldSelective.bits.toList := by
  change markedOutput ((Chess.Compilation.Input.stack.map ofSymbol).reverse) =
    Tape.mk₁ Chess.Optimisation.FieldPacked.bits.toList
  rw [Chess.Optimisation.FieldPacked.bits_toList]
  exact markedOutput_input Chess.Compilation.Input.stack

end ChessCodec
end ConjectureMachines.Compilation.Seed
