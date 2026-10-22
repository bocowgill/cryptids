/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Chess.Optimisation.FieldSelective

@[expose] public section
namespace ConjectureMachines.Machines

def chess_field_selective : Machine 2411743 2 := _root_.Chess.Optimisation.FieldSelective.machine

end ConjectureMachines.Machines

namespace ConjectureMachines.Semantics.ChessFieldSelective

def statement : Prop :=
  Halts Machines.chess_field_selective ↔
    ¬(_root_.Chess.WhiteCanAvoidLoss ∧ _root_.Chess.BlackCanAvoidLoss)

theorem halts_iff_not_draw : statement := _root_.Chess.Optimisation.FieldSelective.halts_iff

end ConjectureMachines.Semantics.ChessFieldSelective
