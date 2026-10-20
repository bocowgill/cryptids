/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Chess.Optimisation.M7
import Cryptids.Chess.Compilation.Matrix

namespace Chess.Optimisation.M7
open ConjectureMachines

/-- The strict improvement is attached to the actual constructed state counts. -/
theorem strict_generated_reduction : generated.states < Compilation.Image.generated.states := by
  rw [generated_states, Compilation.Image.generated_states]
  decide

theorem row_count : machine.expandedRows.length = 392046822 :=
  Machine.expandedRows_length machine

theorem column_count (state : Fin 392046822) :
    (machine.expandedRows.getD state.val []).length = 2 :=
  Machine.expandedRows_row_length _ state

/-- All rows and both symbols form precisely the ordinary finite mathematical machine. -/
theorem table_identity : Machine.ofRows machine.expandedRows = machine :=
  Machine.ofRows_expandedRows _

theorem table_halts_iff : Halts (Machine.ofRows machine.expandedRows) ↔
    ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) := by
  rw [table_identity]
  exact halts_iff

end Chess.Optimisation.M7
