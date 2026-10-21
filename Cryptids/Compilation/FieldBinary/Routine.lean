/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.FlatInit

/-! # Fully counted finite binary routines

A first-order tree has ordinary write/move instructions, binary read/move branches and
charged terminal controls. The compiler uses no tape oracle or uncounted return register.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.FieldBinary
open Turing

set_option backward.isDefEq.respectTransparency false

abbrev Bit := Fin 2

inductive Routine (α : Type) where
  | exit (value : α)
  | next (action : Init.Instruction) (rest : Routine α)
  | read (dir : Dir) (zero one : Routine α)

namespace Routine
variable {α : Type}

def size : Routine α → Nat
  | .exit _ => 1
  | .next _ rest => rest.size + 1
  | .read _ zero one => (zero.size + one.size) + 1

theorem size_pos (p : Routine α) : 0 < p.size := by
  cases p <;> simp [size]

instance (p : Routine α) : NeZero p.size := ⟨Nat.ne_of_gt (size_pos p)⟩

def execute : Routine α → Tape Bit → α × Tape Bit
  | .exit value, tape => (value, tape)
  | .next action rest, tape => rest.execute (Init.execute action tape)
  | .read dir zero one, tape =>
      if tape.head = 0 then zero.execute (tape.move dir) else one.execute (tape.move dir)

def steps : Routine α → Tape Bit → Nat
  | .exit _, _ => 0
  | .next action rest, tape => 1 + rest.steps (Init.execute action tape)
  | .read dir zero one, tape =>
      1 + if tape.head = 0 then zero.steps (tape.move dir) else one.steps (tape.move dir)

def liftRow {q r : Nat} (f : Fin q → Fin r)
    (row : Option (Bit × Dir × Fin q)) : Option (Bit × Dir × Fin r) :=
  row.map (fun (write, dir, dest) ↦ (write, dir, f dest))

def leftState (zero one : Routine α) (q : Fin zero.size) : Fin ((zero.size + one.size) + 1) :=
  (q.castAdd one.size).succ

def rightState (zero one : Routine α) (q : Fin one.size) : Fin ((zero.size + one.size) + 1) :=
  (Fin.natAdd zero.size q).succ

/-- Every exit, including duplicate result values, occupies an ordinary state. -/
def machine : (p : Routine α) → Machine p.size 2
  | .exit _ => ⟨fun _ _ ↦ none⟩
  | .next action rest => Init.prependMachine action rest.machine
  | .read dir zero one => ⟨fun state bit ↦ Init.caseZero
      (some (bit, dir, if bit = 0 then leftState zero one 0 else rightState zero one 0))
      (fun q ↦ Fin.addCases
        (fun i ↦ liftRow (leftState zero one) (zero.machine.transition i bit))
        (fun i ↦ liftRow (rightState zero one) (one.machine.transition i bit)) q) state⟩

/-- Decode the result carried by a charged terminal control; other controls return none. -/
def result : (p : Routine α) → Fin p.size → Option α
  | .exit value, _ => some value
  | .next _ rest, state => Init.caseZero none rest.result state
  | .read _ zero one, state => Init.caseZero none (Fin.addCases zero.result one.result) state

def exitState : (p : Routine α) → Tape Bit → Fin p.size
  | .exit _, _ => 0
  | .next action rest, tape => (rest.exitState (Init.execute action tape)).succ
  | .read dir zero one, tape =>
      if tape.head = 0 then leftState zero one (zero.exitState (tape.move dir))
      else rightState zero one (one.exitState (tape.move dir))

@[simp] theorem next_rows (action : Init.Instruction) (rest : Routine α)
    (q : Fin rest.size) (bit : Bit) :
    (machine (.next action rest)).transition q.succ bit =
      liftRow Fin.succ (rest.machine.transition q bit) := by
  simp only [machine, Init.prependMachine, Init.caseZero_succ, liftRow]

@[simp] theorem left_rows (dir : Dir) (zero one : Routine α) (q : Fin zero.size) (bit : Bit) :
    (machine (.read dir zero one)).transition (leftState zero one q) bit =
      liftRow (leftState zero one) (zero.machine.transition q bit) := by
  simp only [machine, leftState, Init.caseZero_succ, Fin.addCases_left]

@[simp] theorem right_rows (dir : Dir) (zero one : Routine α) (q : Fin one.size) (bit : Bit) :
    (machine (.read dir zero one)).transition (rightState zero one q) bit =
      liftRow (rightState zero one) (one.machine.transition q bit) := by
  simp only [machine, rightState, Init.caseZero_succ, Fin.addCases_right]

def liftCfg {q r : Nat} (f : Fin q → Fin r) (cfg : Cfg q 2) : Cfg r 2 :=
  ⟨f cfg.state, cfg.tape⟩

theorem step_lift {q r : Nat} [NeZero q] [NeZero r]
    (M : Machine q 2) (N : Machine r 2) (f : Fin q → Fin r)
    (rows : ∀ state bit, N.transition (f state) bit = liftRow f (M.transition state bit))
    (cfg : Cfg q 2) : step N (liftCfg f cfg) = (step M cfg).map (liftCfg f) := by
  cases cfg with
  | mk state tape =>
    simp only [step, liftCfg, rows, liftRow]
    cases M.transition state tape.head <;> rfl

theorem run_lift {q r : Nat} [NeZero q] [NeZero r]
    (M : Machine q 2) (N : Machine r 2) (f : Fin q → Fin r)
    (rows : ∀ state bit, N.transition (f state) bit = liftRow f (M.transition state bit))
    (count : Nat) (cfg : Cfg q 2) :
    FlatInit.runFrom N count (liftCfg f cfg) =
      (FlatInit.runFrom M count cfg).map (liftCfg f) := by
  induction count generalizing cfg with
  | zero => rfl
  | succ count ih =>
    simp only [FlatInit.runFrom, step_lift M N f rows]
    cases move : step M cfg with
    | none => rfl
    | some next => simpa only [Option.map_some, Option.bind_some] using ih next

/-- The actual binary machine reaches its decoded result after exactly the semantic steps. -/
theorem run_execute (p : Routine α) (tape : Tape Bit) :
    FlatInit.runFrom p.machine (p.steps tape) ⟨0, tape⟩ =
      some ⟨p.exitState tape, (p.execute tape).2⟩ := by
  induction p generalizing tape with
  | exit value => rfl
  | next action rest ih =>
    change FlatInit.runFrom _ (1 + rest.steps (Init.execute action tape)) _ = _
    rw [Nat.add_comm 1, FlatInit.runFrom]
    change FlatInit.runFrom _ _ (liftCfg Fin.succ ⟨0, Init.execute action tape⟩) = _
    rw [run_lift rest.machine _ Fin.succ (next_rows action rest), ih]
    rfl
  | read dir zero one iz io =>
    by_cases bit : tape.head = 0
    · simp only [steps, bit, ↓reduceIte, exitState, execute]
      rw [Nat.add_comm 1, FlatInit.runFrom]
      have first : step (machine (.read dir zero one)) ⟨0, tape⟩ =
          some (liftCfg (leftState zero one) ⟨0, tape.move dir⟩) := by
        simp [step, machine, bit, liftCfg]
      rw [first, Option.bind_some]
      change FlatInit.runFrom _ _ (liftCfg (leftState zero one) ⟨0, tape.move dir⟩) = _
      rw [run_lift zero.machine _ (leftState zero one) (left_rows dir zero one), iz]
      rfl
    · simp only [steps, bit, ↓reduceIte, exitState, execute]
      rw [Nat.add_comm 1, FlatInit.runFrom]
      have first : step (machine (.read dir zero one)) ⟨0, tape⟩ =
          some (liftCfg (rightState zero one) ⟨0, tape.move dir⟩) := by
        simp [step, machine, bit, liftCfg]
      rw [first, Option.bind_some]
      change FlatInit.runFrom _ _ (liftCfg (rightState zero one) ⟨0, tape.move dir⟩) = _
      rw [run_lift one.machine _ (rightState zero one) (right_rows dir zero one), io]
      rfl

/-- The reached numeric exit carries precisely the specified result. -/
theorem result_exit (p : Routine α) (tape : Tape Bit) :
    p.result (p.exitState tape) = some (p.execute tape).1 := by
  induction p generalizing tape with
  | exit value => rfl
  | next action rest ih => simpa only [result, exitState, execute, Init.caseZero_succ] using ih _
  | read dir zero one iz io =>
    by_cases bit : tape.head = 0
    · simpa only [exitState, execute, bit, ↓reduceIte, leftState, result,
        Init.caseZero_succ, Fin.addCases_left] using iz (tape.move dir)
    · simpa only [exitState, execute, bit, ↓reduceIte, rightState, result,
        Init.caseZero_succ, Fin.addCases_right] using io (tape.move dir)

/-- Terminal controls have missing transitions on both symbols. -/
theorem exit_stops (p : Routine α) (tape : Tape Bit) (bit : Bit) :
    p.machine.transition (p.exitState tape) bit = none := by
  induction p generalizing tape with
  | exit value => rfl
  | next action rest ih => simp only [exitState, next_rows, liftRow, ih, Option.map_none]
  | read dir zero one iz io =>
    by_cases head : tape.head = 0
    · simp only [exitState, head, ↓reduceIte, left_rows, liftRow, iz, Option.map_none]
    · simp only [exitState, head, ↓reduceIte, right_rows, liftRow, io, Option.map_none]

end Routine
end ConjectureMachines.Compilation.FieldBinary
