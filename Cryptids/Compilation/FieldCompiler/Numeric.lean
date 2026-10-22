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
  induction state using Fin.addCases with
  | left i =>
    simp [binaryRows, Binary.compile, Binary.mainState, Binary.bounceState]
  | right i =>
    simp [binaryRows, Binary.compile, Binary.mainState, Binary.bounceState,
      show ¬ q + i.val < q by omega]

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
  by_cases write : state.val < bits.size
  · have inPrefix : state.val < 2 * bits.size := by omega
    simp only [paidRows, write, ↓reduceDIte, FlatInit.initialise, FlatInit.machine,
      inPrefix, FlatInit.actionAt, Option.getD_some]
  · by_cases restore : state.val < 2 * bits.size
    · simp only [paidRows, write, restore, ↓reduceDIte, FlatInit.initialise,
        FlatInit.machine, FlatInit.actionAt, Option.getD_none]
    · simp only [paidRows, write, restore, ↓reduceDIte, FlatInit.initialise,
        FlatInit.machine, FlatInit.bodyState]

end ConjectureMachines.Compilation.FieldCompiler
