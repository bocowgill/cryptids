/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Chess.Optimisation.OpenEvolveWide

@[expose] public section
namespace ConjectureMachines.Machines

def chess_openevolve_wide : Machine 390491642 2 := _root_.Chess.Optimisation.OpenEvolveWide.machine

end ConjectureMachines.Machines

namespace ConjectureMachines.Semantics.ChessOpenEvolveWide

def statement : Prop :=
  Halts Machines.chess_openevolve_wide ↔
    ¬(_root_.Chess.WhiteCanAvoidLoss ∧ _root_.Chess.BlackCanAvoidLoss)

theorem halts_iff_not_draw : statement := _root_.Chess.Optimisation.OpenEvolveWide.halts_iff

end ConjectureMachines.Semantics.ChessOpenEvolveWide
