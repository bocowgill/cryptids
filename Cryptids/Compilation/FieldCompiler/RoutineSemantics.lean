/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.FieldCompiler.Operations

/-! # Exact TM1 meaning of the previously certified finite routines -/

@[expose] public section
namespace ConjectureMachines.Compilation.FieldCompiler
open Turing FieldBinary

set_option backward.isDefEq.respectTransparency false

theorem table_read {α : Type} (f : Bool → Fin 5 → α) (bit : Bool) (v : Fin 5) :
    (table f).read bit v = f bit v := by
  cases bit <;> simp [table, BoolGraph.Table.read, Vector.get, Fin.cast]

theorem from_to_bool (bit : Bit) : fromBool (toBool bit) = bit := by
  fin_cases bit <;> rfl

theorem to_from_bool (bit : Bool) : toBool (fromBool bit) = bit := by
  cases bit <;> rfl

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

theorem map_bool_roundtrip (tape : Tape Bool) : (tape.map boolMap).map bitMap = tape := by
  rcases tape with ⟨head, left, right⟩
  congr 1
  · exact to_from_bool head
  · apply ListBlank.ext
    intro i
    simpa only [Tape.map, ListBlank.nth_map] using to_from_bool (left.nth i)
  · apply ListBlank.ext
    intro i
    simpa only [Tape.map, ListBlank.nth_map] using to_from_bool (right.nth i)

/-- Emitting a counted field routine gives its exact tape semantics inside one TM1 statement. -/
theorem emit_stepAux {α : Type} {n : Nat} (p : Routine α) (k : α → Syntax n)
    (v : Fin 5) (tape : Tape Bit) :
    TM1.stepAux (emit p k).meaning v (tape.map bitMap) =
      TM1.stepAux (k (p.execute tape).1).meaning v ((p.execute tape).2.map bitMap) := by
  induction p generalizing v tape with
  | exit value => rfl
  | next action rest ih =>
    rcases action with ⟨write, dir⟩
    cases write with
    | none =>
      simpa [emit, Syntax.meaning, TM1.stepAux, Routine.execute, Init.execute,
        Tape.map_move, Tape.write_self] using ih v (tape.move dir)
    | some bit =>
      simpa [emit, Syntax.meaning, TM1.stepAux, table_read, Routine.execute, Init.execute,
        Tape.map_move, Tape.map_write, bitMap] using ih v ((tape.write bit).move dir)
  | read dir zero one iz io =>
    rcases bit_cases tape.head with h | h
    · simpa [emit, Syntax.meaning, TM1.stepAux, table_read, Routine.execute,
        Tape.map_move, Tape.map_fst, bitMap, toBool, h] using iz v (tape.move dir)
    · simpa [emit, Syntax.meaning, TM1.stepAux, table_read, Routine.execute,
        Tape.map_move, Tape.map_fst, bitMap, toBool, h] using io v (tape.move dir)

theorem select5_stepAux {n : Nat} (f : Fin 5 → Syntax n) (v : Fin 5) (tape : Tape Bool) :
    TM1.stepAux (select5 f).meaning v tape = TM1.stepAux (f v).meaning v tape := by
  fin_cases v <;> simp [select5, Syntax.meaning, TM1.stepAux, table_read]

theorem go_stepAux {n : Nat} (f : Fin 5 → Fin n) (v : Fin 5) (tape : Tape Bool) :
    TM1.stepAux (go f).meaning v tape = ⟨some (f v), v, tape⟩ := by
  simp [go, Syntax.meaning, TM1.stepAux, table_read]

end ConjectureMachines.Compilation.FieldCompiler
