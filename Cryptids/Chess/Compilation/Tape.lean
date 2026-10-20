/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Chess.Compilation.Source
public import Cryptids.Compilation.RuntimeProof
public import Cryptids.Compilation.RuntimeSupport

/-! # Full chess on the fixed four-stack interpreter

The complete concrete program and initial game are finite tape data. The fixed machine
contains no rule oracle, source-dependent finite control, or assumed initial chess value.
The final binary machine additionally has to construct this finite input from blank tape.
-/

@[expose] public section
namespace Chess.Compilation.Tape
open Turing PartrecToTM2 K' ConjectureMachines.Compilation

def table : CodeDAG.DAG := CodeDAG.compile Source.program

def argument : List Nat := [Control.gameWord Adjudication.Game.initial]

def input : List Γ' := RuntimeWire.input table argument

theorem table_valid : table.Valid := CodeDAG.compile_valid Source.program

/-- The fixed four-stack chess program terminates exactly when the draw proposition is false. -/
theorem halts_iff :
    letI : Inhabited Λ' := ⟨Runtime.label .start⟩
    (TM2.eval Runtime.machine main input).Dom ↔ ¬ (WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) :=
  (RuntimeProof.tm2_halts_compiled Source.program argument).trans Source.program_initial_dom

end Chess.Compilation.Tape
