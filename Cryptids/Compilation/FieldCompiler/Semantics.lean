/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.FieldCompiler.Codec
public import Cryptids.Compilation.FieldCompiler.RoutineSemantics

/-! # Universal field compiler simulation, including exact stopping -/

@[expose] public section
namespace ConjectureMachines.Compilation.FieldCompiler
open Turing FieldBinary StateTransition

set_option backward.isDefEq.respectTransparency false

/-- Every normalized operation has the same complete result at its next TM1 boundary. -/
theorem lower_refines {n : Nat} (op : Op n) (v : Store)
    (tape : Tape Symbol) (bits : Tape Bit) (rep : FieldReturn.RepresentsTape tape bits) :
    let out := TM1.stepAux (source op) v tape
    ∃ finalBits,
      TM1.stepAux (lower op).meaning (FieldReturn.symbolCode v) (bits.map bitMap) =
        ⟨out.l, FieldReturn.symbolCode out.var, finalBits.map bitMap⟩ ∧
      FieldReturn.RepresentsTape out.Tape finalBits := by
  cases op with
  | move dir next =>
    refine ⟨shift dir 13 bits, ?_, Codec.move_rep tape bits rep dir⟩
    simp only [lower, emit_stepAux, moveCell_execute, Prod.fst, Prod.snd, go_stepAux,
      source, TM1.stepAux]
  | write field value next =>
    refine ⟨written (fieldOffset field) (encodeWord (value (FieldReturn.symbolCode v))) bits,
      ?_, Codec.write_rep tape bits rep field (value (FieldReturn.symbolCode v))⟩
    simp only [lower, select5_stepAux, emit_stepAux, writeAt_execute,
      Prod.fst, Prod.snd, go_stepAux, source, TM1.stepAux]
  | load field value next =>
    have read := Codec.read_rep tape bits rep field
    simp only [readAt_execute, Prod.fst, Prod.snd] at read
    refine ⟨bits, ?_, rep⟩
    simp only [lower, emit_stepAux, readAt_execute, Prod.fst, Prod.snd,
      Syntax.meaning, TM1.stepAux, table_read, go_stepAux, source,
      FieldReturn.code_roundtrip, read.1]
  | pureLoad value next =>
    refine ⟨bits, ?_, rep⟩
    simp only [lower, Syntax.meaning, TM1.stepAux, table_read, go_stepAux, source,
      FieldReturn.code_roundtrip]
  | marker yes no =>
    refine ⟨bits, ?_, rep⟩
    simp only [lower, emit_stepAux, FieldContinuation.marker_execute, Prod.fst, Prod.snd,
      Codec.marker_rep tape bits rep, go_stepAux, source, TM1.stepAux]
    cases tape.head.1 <;> rfl
  | absent field yes no =>
    have read := Codec.read_rep tape bits rep field
    simp only [readAt_execute, Prod.fst, Prod.snd] at read
    refine ⟨bits, ?_, rep⟩
    simp only [lower, emit_stepAux, readAt_execute, Prod.fst, Prod.snd, read.1,
      go_stepAux, source, TM1.stepAux]
    cases tape.head.2 (FieldReturn.stackAt field) with
    | none => rfl
    | some symbol => cases symbol <;> rfl
  | branch test yes no =>
    refine ⟨bits, ?_, rep⟩
    simp only [lower, Syntax.meaning, TM1.stepAux, table_read, go_stepAux, source]
    cases test (FieldReturn.symbolCode v) <;> rfl
  | jump target =>
    exact ⟨bits, by simp only [lower, go_stepAux, source, TM1.stepAux], rep⟩
  | halt => exact ⟨bits, rfl, rep⟩

def sourceProgram {n : Nat} (program : Fin n → Op n) := fun q ↦ source (program q)

def targetProgram {n : Nat} (program : Fin n → Op n) := fun q ↦ (lower (program q)).meaning

/-- Boundary controls, store codes and the entire unbounded tape agree. -/
def RepresentsCfg {n : Nat} (a : TM1.Cfg Symbol (Fin n) Store)
    (b : TM1.Cfg Bool (Fin n) (Fin 5)) : Prop :=
  b.l = a.l ∧ b.var = FieldReturn.symbolCode a.var ∧ Codec.RepTape a.Tape b.Tape

/-- A source step produces a nonempty target path; a missing step is reflected exactly. -/
theorem respects {n : Nat} (program : Fin n → Op n) :
    Respects (TM1.step (sourceProgram program)) (TM1.step (targetProgram program))
      RepresentsCfg := by
  rintro ⟨pc, v, tape⟩ ⟨targetPc, targetV, targetTape⟩ ⟨labels, values, rep⟩
  dsimp at labels values rep
  subst targetPc targetV
  cases pc with
  | none => rfl
  | some q =>
    obtain ⟨finalBits, result, represented⟩ :=
      lower_refines (program q) v tape (targetTape.map boolMap) rep
    rw [map_bool_roundtrip] at result
    refine ⟨⟨(TM1.stepAux (source (program q)) v tape).l,
      FieldReturn.symbolCode (TM1.stepAux (source (program q)) v tape).var,
      finalBits.map bitMap⟩, ⟨rfl, rfl, Codec.rep_map _ _ represented⟩, .single ?_⟩
    exact congrArg some result

/-- Both termination directions hold for every actual finite source input. -/
theorem halts_input {n : Nat} [NeZero n] (program : Fin n → Op n) (input : List Symbol) :
    (TM1.eval (targetProgram program) (Codec.input input)).Dom ↔
      (TM1.eval (sourceProgram program) input).Dom := by
  exact tr_eval_dom (respects program)
    (show RepresentsCfg (TM1.init input) (TM1.init (Codec.input input)) from
      ⟨rfl, rfl, Codec.input_rep input⟩)

end ConjectureMachines.Compilation.FieldCompiler
