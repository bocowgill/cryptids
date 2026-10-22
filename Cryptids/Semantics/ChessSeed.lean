/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Chess.Optimisation.FieldSeed

@[expose] public section
namespace ConjectureMachines.Machines

def chess_seed : Machine 998176 2 := _root_.Chess.Optimisation.FieldSeed.machine

end ConjectureMachines.Machines

namespace ConjectureMachines.Semantics.ChessSeed

def statement : Prop :=
  Halts Machines.chess_seed ↔
    ¬(_root_.Chess.WhiteCanAvoidLoss ∧ _root_.Chess.BlackCanAvoidLoss)

theorem halts_iff_not_draw : statement := _root_.Chess.Optimisation.FieldSeed.halts_iff

end ConjectureMachines.Semantics.ChessSeed
