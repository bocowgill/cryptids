/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Chess.Optimisation.OpenEvolve

@[expose] public section
namespace ConjectureMachines.Machines

def chess_openevolve : Machine 392046821 2 := _root_.Chess.Optimisation.OpenEvolve.machine

end ConjectureMachines.Machines

namespace ConjectureMachines.Semantics.ChessOpenEvolve

def statement : Prop :=
  Halts Machines.chess_openevolve ↔
    ¬(_root_.Chess.WhiteCanAvoidLoss ∧ _root_.Chess.BlackCanAvoidLoss)

theorem halts_iff_not_draw : statement := _root_.Chess.Optimisation.OpenEvolve.halts_iff

end ConjectureMachines.Semantics.ChessOpenEvolve
