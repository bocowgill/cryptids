/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Chess.Optimisation.FieldAware

@[expose] public section
namespace ConjectureMachines.Machines

def chess_field_aware : Machine 45065962 2 := _root_.Chess.Optimisation.FieldAware.machine

end ConjectureMachines.Machines

namespace ConjectureMachines.Semantics.ChessFieldAware

def statement : Prop :=
  Halts Machines.chess_field_aware ↔
    ¬(_root_.Chess.WhiteCanAvoidLoss ∧ _root_.Chess.BlackCanAvoidLoss)

theorem halts_iff_not_draw : statement := _root_.Chess.Optimisation.FieldAware.halts_iff

end ConjectureMachines.Semantics.ChessFieldAware
