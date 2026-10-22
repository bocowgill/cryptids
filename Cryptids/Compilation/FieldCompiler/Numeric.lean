/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.Binary
public import Cryptids.Compilation.FlatInit

/-! # Independent arithmetic recipes for all binary and paid prefix rows -/

@[expose] public section
namespace ConjectureMachines.Compilation.FieldCompiler
open Turing

set_option backward.isDefEq.respectTransparency false

/-- Range-based recipe, independently defined from the sum-indexed binary compiler. -/
def binaryRows {q : Nat} [NeZero q] (M : TM0.Machine Bool (Fin q)) : Machine (q + q) 2 where
  transition state bit :=
    if main : state.val < q then
      (M ⟨state.val, main⟩ (Binary.decodeSymbol bit)).map fun (next, action) ↦
        match action with
        | .move dir => (bit, dir, ⟨next.val, by have := next.isLt; omega⟩)
        | .write value =>
            (Binary.encodeSymbol value, .right, ⟨q + next.val, by have := next.isLt; omega⟩)
    else some (bit, .left, ⟨state.val - q, by have := state.isLt; omega⟩)

/-- Every binary row, including all bounce controls and missing rows, agrees universally. -/
theorem binaryRows_eq {q : Nat} [NeZero q] (M : TM0.Machine Bool (Fin q)) :
    binaryRows M = Binary.compile M := by
  apply congrArg (fun rows ↦ (⟨rows⟩ : Machine (q + q) 2))
  funext state bit
  change (binaryRows M).transition state bit = (Binary.compile M).transition state bit
  by_cases main : state.val < q
  · let i : Fin q := ⟨state.val, main⟩
    have same : Binary.mainState i = state := Fin.ext rfl
    rw [← same, Binary.compile_main]
    simp only [binaryRows, Binary.mainState, Fin.val_castAdd, i.isLt, ↓reduceDIte]
    congr 1
  · let i : Fin q := ⟨state.val - q, by have := state.isLt; omega⟩
    have same : Binary.bounceState i = state := by
      apply Fin.ext
      change q + (state.val - q) = state.val
      omega
    rw [← same, Binary.compile_bounce]
    simp only [binaryRows, Binary.bounceState, Fin.val_natAdd,
      show ¬ q + i.val < q by omega, ↓reduceDIte, Nat.add_sub_cancel_left]
    rfl

/-- Three direct numeric ranges: write, restore the head, and offset every body row. -/
def paidRows (bits : Array (Fin 2)) (body : BundledMachine 2) :
    Machine (body.states + 2 * bits.size) 2 where
  transition state bit :=
    if write : state.val < bits.size then
      some (bits[state.val], .right,
        ⟨state.val + 1, by have := NeZero.ne body.states; omega⟩)
    else if restore : state.val < 2 * bits.size then
      some (bit, .left, ⟨state.val + 1, by have := NeZero.ne body.states; omega⟩)
    else
      (body.toMachine.transition
        ⟨state.val - 2 * bits.size, by have := state.isLt; omega⟩ bit).map
          fun (write, dir, next) ↦
            (write, dir, ⟨2 * bits.size + next.val, by have := next.isLt; omega⟩)

/-- The paid recipe agrees for every state and both symbols, including empty input. -/
theorem paidRows_eq (bits : Array (Fin 2)) (body : BundledMachine 2) :
    paidRows bits body = (FlatInit.initialise bits body).toMachine := by
  apply congrArg (fun rows ↦ (⟨rows⟩ : Machine (body.states + 2 * bits.size) 2))
  funext state bit
  dsimp only [paidRows, FlatInit.initialise, FlatInit.machine]
  by_cases write : state.val < bits.size
  · have inPrefix : state.val < 2 * bits.size := by omega
    simp only [write, ↓reduceDIte, inPrefix, FlatInit.actionAt, Option.getD_some]
  · by_cases restore : state.val < 2 * bits.size
    · simp only [write, restore, ↓reduceDIte, FlatInit.actionAt, Option.getD_none]
    · simp only [write, restore, ↓reduceDIte, FlatInit.bodyState]

def paidBundle (bits : Array (Fin 2)) (body : BundledMachine 2) : BundledMachine 2 :=
  ⟨body.states + 2 * bits.size, paidRows bits body⟩

/-- Prove the dependent bundle equality before instantiating a large concrete input. -/
theorem paidBundle_eq (bits : Array (Fin 2)) (body : BundledMachine 2) :
    paidBundle bits body = FlatInit.initialise bits body := by
  unfold paidBundle
  rw [paidRows_eq]
  rfl

end ConjectureMachines.Compilation.FieldCompiler
