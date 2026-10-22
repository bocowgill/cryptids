/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Chess.Optimisation.FieldPacked

@[expose] public section
namespace ConjectureMachines.Machines

def chess_field_packed : Machine 4742562 2 := _root_.Chess.Optimisation.FieldPacked.machine

end ConjectureMachines.Machines

namespace ConjectureMachines.Semantics.ChessFieldPacked

def statement : Prop :=
  Halts Machines.chess_field_packed ↔
    ¬(_root_.Chess.WhiteCanAvoidLoss ∧ _root_.Chess.BlackCanAvoidLoss)

theorem halts_iff_not_draw : statement := _root_.Chess.Optimisation.FieldPacked.halts_iff

end ConjectureMachines.Semantics.ChessFieldPacked
