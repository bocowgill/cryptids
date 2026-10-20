/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Chess.Compilation.Image

/-! The baseline machine's unconditional strategic meaning for chess-reference-v1. -/

@[expose] public section
namespace ConjectureMachines.Machines

/-- The complete paid binary machine, started in state zero on the blank tape. -/
def chess_baseline : Machine 392046832 2 := _root_.Chess.Compilation.Image.machine

end ConjectureMachines.Machines

namespace ConjectureMachines.Semantics.Chess

/-- Both players can avoid defeat exactly when the baseline machine does not halt. -/
def statement : Prop :=
  Halts Machines.chess_baseline ↔
    ¬(_root_.Chess.WhiteCanAvoidLoss ∧ _root_.Chess.BlackCanAvoidLoss)

/-- No assumption of the initial position's value enters this equivalence. -/
theorem halts_chess_baseline_iff_not_draw : statement :=
  _root_.Chess.Compilation.Image.halts_iff

end ConjectureMachines.Semantics.Chess
