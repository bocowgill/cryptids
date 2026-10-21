/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.FieldBinary.Fields

/-! # Explicit valid-cell interpretation

A cell contains four five-valued stack coordinates and a bottom marker. Values five
through seven are executable raw bit patterns, with an explicit fallback decoder.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.FieldBinary
open Turing

set_option backward.isDefEq.respectTransparency false

abbrev Cell := Bool × (Fin 4 → Fin 5)

def encodeWord (value : Fin 5) : Word :=
  (⟨value.val % 2, Nat.mod_lt _ (by decide)⟩,
   ⟨value.val / 2 % 2, Nat.mod_lt _ (by decide)⟩,
   ⟨value.val / 4 % 2, Nat.mod_lt _ (by decide)⟩)

def wordValue (word : Word) : Nat := word.1.val + 2 * word.2.1.val + 4 * word.2.2.val

/-- Unused three-bit codes decode to absence; routines still terminate on them. -/
def decodeWord (word : Word) : Fin 5 :=
  if bound : wordValue word < 5 then ⟨wordValue word, bound⟩ else 0

theorem decode_encodeWord (value : Fin 5) : decodeWord (encodeWord value) = value := by
  fin_cases value <;> rfl

def wordBit (word : Word) (i : Fin 3) : Bit :=
  if i = 0 then word.1 else if i = 1 then word.2.1 else word.2.2

/-- The marker occupies bit twelve; stack coordinates occupy consecutive triples. -/
def encodeCell (cell : Cell) (i : Fin 13) : Bit :=
  if bound : i.val < 12 then
    wordBit (encodeWord (cell.2 ⟨i.val / 3, by omega⟩))
      ⟨i.val % 3, Nat.mod_lt _ (by decide)⟩
  else if cell.1 then 1 else 0

def Represents (cell : Cell) (tape : Tape Bit) : Prop :=
  ∀ i : Fin 13, tape.nth i.val = encodeCell cell i

/-- The entirely blank bit cell represents absent stack symbols and no marker. -/
theorem encode_blank (i : Fin 13) : encodeCell (false, fun _ ↦ 0) i = 0 := by
  fin_cases i <;> rfl

theorem wordAt_nth (offset : Nat) (tape : Tape Bit) :
    wordAt offset tape =
      (tape.nth offset, tape.nth ((offset : Int) + 1), tape.nth ((offset : Int) + 2)) := by
  simp only [wordAt, wordHere]
  have head (t : Tape Bit) : t.head = t.nth 0 := rfl
  simp only [head, shift_right_nth, Tape.move_right_nth, zero_add]
  congr 2 <;> omega

theorem represented_field (cell : Cell) (tape : Tape Bit) (field : Fin 4)
    (rep : Represents cell tape) :
    wordAt (fieldOffset field) tape = encodeWord (cell.2 field) := by
  rw [wordAt_nth]
  have first := rep ⟨fieldOffset field, by have := field_fits field; omega⟩
  have second := rep ⟨fieldOffset field + 1, by have := field_fits field; omega⟩
  have third := rep ⟨fieldOffset field + 2, by have := field_fits field; omega⟩
  fin_cases field <;> simpa [fieldOffset, encodeCell, wordBit] using
    congrArg₂ (fun a b ↦ (a, b)) first (congrArg₂ (fun a b ↦ (a, b)) second third)

theorem read_valid_cell (cell : Cell) (tape : Tape Bit) (field : Fin 4)
    (rep : Represents cell tape) :
    decodeWord ((readAt (fieldOffset field)).execute tape).1 = cell.2 field ∧
      ((readAt (fieldOffset field)).execute tape).2 = tape := by
  rw [readAt_execute, represented_field cell tape field rep, decode_encodeWord]
  exact ⟨rfl, rfl⟩

def updateCell (cell : Cell) (field : Fin 4) (value : Fin 5) : Cell :=
  (cell.1, Function.update cell.2 field value)

/-- Writing one valid coordinate preserves the marker and the other three coordinates. -/
theorem write_valid_cell (cell : Cell) (tape : Tape Bit) (field : Fin 4) (value : Fin 5)
    (rep : Represents cell tape) :
    Represents (updateCell cell field value)
      ((writeAt (fieldOffset field) (encodeWord value)).execute tape).2 := by
  intro i
  rw [writeAt_execute]
  change (written _ _ tape).nth _ = _
  rw [written_nth]
  have old := rep i
  fin_cases field <;> fin_cases i <;>
    simp_all [fieldOffset, encodeCell, updateCell, wordBit, encodeWord]

/-- The write frame theorem also covers neighbouring cells beyond the local cell. -/
theorem write_frame (field : Fin 4) (word : Word) (tape : Tape Bit) (i : Int)
    (outside : i < fieldOffset field ∨ (fieldOffset field : Int) + 3 ≤ i) :
    ((writeAt (fieldOffset field) word).execute tape).2.nth i = tape.nth i := by
  rw [writeAt_execute]
  exact written_outside _ _ _ _ outside

end ConjectureMachines.Compilation.FieldBinary
