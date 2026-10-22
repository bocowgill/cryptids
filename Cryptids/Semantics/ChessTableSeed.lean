/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Chess.Optimisation.FieldTableSeed

@[expose] public section
namespace ConjectureMachines.Machines

def chess_table_seed : Machine 769344 2 := _root_.Chess.Optimisation.FieldTableSeed.machine

end ConjectureMachines.Machines

namespace ConjectureMachines.Semantics.ChessTableSeed

def statement : Prop :=
  Halts Machines.chess_table_seed ↔
    ¬(_root_.Chess.WhiteCanAvoidLoss ∧ _root_.Chess.BlackCanAvoidLoss)

theorem halts_iff_not_draw : statement := _root_.Chess.Optimisation.FieldTableSeed.halts_iff

end ConjectureMachines.Semantics.ChessTableSeed
