/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Chess.Optimisation.M7Table

@[expose] public section
namespace ConjectureMachines.Machines

/-- The first certified strict reduction of the frozen chess baseline. -/
def chess_m7 : Machine 392046822 2 := _root_.Chess.Optimisation.M7.machine

end ConjectureMachines.Machines

namespace ConjectureMachines.Semantics.ChessM7

def statement : Prop :=
  Halts Machines.chess_m7 ↔ ¬(_root_.Chess.WhiteCanAvoidLoss ∧ _root_.Chess.BlackCanAvoidLoss)

theorem halts_chess_m7_iff_not_draw : statement := _root_.Chess.Optimisation.M7.halts_iff

theorem equivalent_to_baseline :
    Halts Machines.chess_m7 ↔ Halts _root_.Chess.Compilation.Image.machine :=
  _root_.Chess.Optimisation.M7.equivalent

end ConjectureMachines.Semantics.ChessM7
