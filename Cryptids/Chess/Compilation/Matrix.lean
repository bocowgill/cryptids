/-
Copyright 2026 The Cryptids Contributors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Chess.Compilation.Image

/-! The complete finite row-list interpretation of the published arithmetic matrix.

This view fixes every row and both columns mathematically. Exporters query the proved
indexed machine directly; they do not allocate this 392-million-element list.
-/

namespace ConjectureMachines.Machine

/-- Every row and every symbol, in increasing finite-index order. -/
def expandedRows {q symbols : Nat} (M : Machine q symbols) :
    List (List (Option (Fin symbols × Turing.Dir × Fin q))) :=
  List.ofFn fun state : Fin q ↦ List.ofFn fun symbol : Fin symbols ↦
    M.transition state symbol

@[simp] theorem expandedRows_length {q symbols : Nat} (M : Machine q symbols) :
    M.expandedRows.length = q := List.length_ofFn

theorem expandedRows_row_length {q symbols : Nat} (M : Machine q symbols) (state : Fin q) :
    (M.expandedRows.getD state.val []).length = symbols := by
  simp [expandedRows, List.getD_eq_getElem?_getD, state.isLt]

/-- Direct lookup is exactly the ordinary complete row-list machine, on every cell. -/
theorem ofRows_expandedRows {q symbols : Nat} [NeZero q] [NeZero symbols]
    (M : Machine q symbols) : Machine.ofRows M.expandedRows = M := by
  cases M with
  | mk transition =>
    unfold Machine.ofRows
    congr 1
    funext state symbol
    simp [expandedRows, List.getD_eq_getElem?_getD, state.isLt, symbol.isLt]

end ConjectureMachines.Machine

namespace Chess.Compilation.Matrix

open ConjectureMachines

theorem row_count : Image.machine.expandedRows.length = 392046832 :=
  Machine.expandedRows_length Image.machine

theorem column_count (state : Fin 392046832) :
    (Image.machine.expandedRows.getD state.val []).length = 2 :=
  Machine.expandedRows_row_length _ state

theorem identity : Machine.ofRows Image.machine.expandedRows = Image.machine :=
  Machine.ofRows_expandedRows _

theorem halts_iff : Halts (Machine.ofRows Image.machine.expandedRows) ↔
    ¬(Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss) := by
  rw [identity]
  exact Image.halts_iff

end Chess.Compilation.Matrix
