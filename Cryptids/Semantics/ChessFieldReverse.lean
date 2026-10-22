/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Chess.Optimisation.FieldReverse

@[expose] public section
namespace ConjectureMachines.Machines

def chess_field_reverse : Machine 2904623 2 := _root_.Chess.Optimisation.FieldReverse.machine

end ConjectureMachines.Machines

namespace ConjectureMachines.Semantics.ChessFieldReverse

def statement : Prop :=
  Halts Machines.chess_field_reverse ↔
    ¬(_root_.Chess.WhiteCanAvoidLoss ∧ _root_.Chess.BlackCanAvoidLoss)

theorem halts_iff_not_draw : statement := _root_.Chess.Optimisation.FieldReverse.halts_iff

end ConjectureMachines.Semantics.ChessFieldReverse
