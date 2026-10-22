/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.FieldContinuation.Certificate

/-! # Explicit extended graph: return, main pop, return and actual branch -/

@[expose] public section
namespace ConjectureMachines.Compilation.FieldBranch
open Turing FieldBinary

set_option backward.isDefEq.respectTransparency false

def oldIn (q : Fin 425) : Fin 675 := ⟨q.val, by omega⟩

def returnIn (q : Fin 245) : Fin 675 := ⟨430 + q.val, by omega⟩

def back (v : Fin 5) : Fin 675 := ⟨425 + v.val, by omega⟩

def terminalStore (q : Fin 425) : Fin 5 :=
  ⟨((q.val - 400) / 5) % 5, Nat.mod_lt _ (by decide)⟩

/-- Five former successor ports are live transfers; five gates and all return controls are paid. -/
def machine : Machine 675 2 where
  transition q bit :=
    if h : q.val < 425 then
      let state : Fin 425 := ⟨q.val, h⟩
      match FieldContinuation.machine.transition state bit with
      | some (write, dir, dest) => some (write, dir, oldIn dest)
      | none => some (bit, .right, back (terminalStore state))
    else if h : q.val < 430 then
      some (bit, .left, returnIn (FieldReturn.embed ⟨q.val - 425, by omega⟩ 0))
    else
      Routine.liftRow returnIn
        (FieldReturn.machine.transition ⟨q.val - 430, by have := q.isLt; omega⟩ bit)

theorem old_rows (q : Fin 425) (bit : Bit)
    (present : FieldContinuation.machine.transition q bit ≠ none) :
    machine.transition (oldIn q) bit =
      Routine.liftRow oldIn (FieldContinuation.machine.transition q bit) := by
  have all : ∀ (q : Fin 425) (bit : Bit),
      FieldContinuation.machine.transition q bit ≠ none →
      machine.transition (oldIn q) bit =
        Routine.liftRow oldIn (FieldContinuation.machine.transition q bit) := by decide +kernel
  exact all q bit present

theorem old_ports_live (v : Fin 5) (bit : Bit) :
    machine.transition (oldIn (FieldContinuation.clearIn v 4)) bit =
      some (bit, .right, back v) := by
  have all : ∀ (v : Fin 5) (bit : Bit),
      machine.transition (oldIn (FieldContinuation.clearIn v 4)) bit =
        some (bit, .right, back v) := by decide +kernel
  exact all v bit

theorem back_rows (v : Fin 5) (bit : Bit) :
    machine.transition (back v) bit =
      some (bit, .left, returnIn (FieldReturn.embed v 0)) := by
  have all : ∀ (v : Fin 5) (bit : Bit),
      machine.transition (back v) bit =
        some (bit, .left, returnIn (FieldReturn.embed v 0)) := by decide +kernel
  exact all v bit

theorem return_rows (q : Fin 245) (bit : Bit) :
    machine.transition (returnIn q) bit =
      Routine.liftRow returnIn (FieldReturn.machine.transition q bit) := by
  have all : ∀ (q : Fin 245) (bit : Bit), machine.transition (returnIn q) bit =
      Routine.liftRow returnIn (FieldReturn.machine.transition q bit) := by decide +kernel
  exact all q bit

theorem connector (v : Fin 5) (tape : Tape Bit) :
    FlatInit.runFrom machine 2 ⟨oldIn (FieldContinuation.clearIn v 4), tape⟩ =
      some ⟨returnIn (FieldReturn.embed v 0), tape⟩ := by
  simp [FlatInit.runFrom, step, old_ports_live, back_rows, Tape.write_self]

/-- Every old control, connector gate and five-store return block is included. -/
theorem state_inventory : 425 + 5 + 5 * (12 + 1 + 24 + 11 + 1) = 675 := rfl

end ConjectureMachines.Compilation.FieldBranch
