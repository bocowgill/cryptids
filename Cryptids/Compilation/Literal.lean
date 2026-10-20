/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Machines

/-! # Independent literal transition-table certificates

These utilities reason directly about `ConjectureMachines.Machine` transition tables. They have
no compiler dependency: finite execution certifies halting/reachability, and a total closed state
set certifies unbounded divergence on every tape.
-/

@[expose] public section

namespace ConjectureMachines.Compilation.Literal

open Turing StateTransition

variable {q : ℕ}

/-- Execute at most `n` transitions from an arbitrary configuration. `none` records that a missing
transition has been encountered; it remains `none` after every additional step. -/
def runFrom (M : Machine q 2) : ℕ → Cfg q 2 → Option (Cfg q 2)
  | 0, cfg => some cfg
  | n + 1, cfg => (runFrom M n cfg).bind (ConjectureMachines.step M)

/-- An exact finite-run result is an actual reachable configuration of the literal machine. -/
theorem runFrom_reaches {M : Machine q 2} {n : ℕ} {start stop : Cfg q 2}
    (run : runFrom M n start = some stop) : Reaches (ConjectureMachines.step M) start stop := by
  induction n generalizing stop with
  | zero =>
      have eq : start = stop := Option.some.inj run
      cases eq
      exact .refl
  | succ n ih =>
      cases previous : runFrom M n start with
      | none => simp [runFrom, previous] at run
      | some middle =>
          exact (ih previous).tail (by simpa [runFrom, previous] using run)

/-- A finite execution that encounters a missing transition proves unbounded evaluation halts. -/
theorem haltsFrom_of_runFrom_none {M : Machine q 2} {n : ℕ} {start : Cfg q 2}
    (run : runFrom M n start = none) : (eval (ConjectureMachines.step M) start).Dom := by
  induction n with
  | zero => simp [runFrom] at run
  | succ n ih =>
      cases previous : runFrom M n start with
      | none => exact ih previous
      | some middle =>
          have terminal : ConjectureMachines.step M middle = none := by
            simpa [runFrom, previous] using run
          exact Part.dom_iff_mem.mpr
            ⟨middle, mem_eval.mpr ⟨runFrom_reaches previous, terminal⟩⟩

/-- Blank-tape halting from a checked finite literal-table execution. -/
theorem halts_of_runFrom_none [NeZero q] {M : Machine q 2} {n : ℕ}
    (run : runFrom M n init = none) : Halts M :=
  haltsFrom_of_runFrom_none run

/-- A boolean finite-run certificate avoids asking for equality of arbitrary tapes. -/
theorem haltsFrom_of_runFrom_isNone {M : Machine q 2} {n : ℕ} {start : Cfg q 2}
    (run : (runFrom M n start).isNone = true) :
    (eval (ConjectureMachines.step M) start).Dom :=
  haltsFrom_of_runFrom_none (Option.isNone_iff_eq_none.mp run)

theorem halts_of_runFrom_isNone [NeZero q] {M : Machine q 2} {n : ℕ}
    (run : (runFrom M n init).isNone = true) : Halts M :=
  haltsFrom_of_runFrom_isNone run

/-- Every symbol in every state of `states` has a transition back into `states`. -/
def ClosedTotal (M : Machine q 2) (states : Finset (Fin q)) : Prop :=
  ∀ state ∈ states, ∀ symbol, ∃ write direction next,
    M.transition state symbol = some (write, direction, next) ∧ next ∈ states

/-- Closed total state sets have an actual successor inside the set on every tape. -/
theorem ClosedTotal.step {M : Machine q 2} {states : Finset (Fin q)}
    (closed : ClosedTotal M states) {cfg : Cfg q 2} (inside : cfg.state ∈ states) :
    ∃ next, ConjectureMachines.step M cfg = some next ∧ next.state ∈ states := by
  obtain ⟨write, direction, next, transition, member⟩ := closed cfg.state inside cfg.tape.head
  exact ⟨⟨next, (cfg.tape.write write).move direction⟩,
    by simp [ConjectureMachines.step, transition], member⟩

theorem ClosedTotal.reaches {M : Machine q 2} {states : Finset (Fin q)}
    (closed : ClosedTotal M states) {start stop : Cfg q 2} (inside : start.state ∈ states)
    (reach : Reaches (ConjectureMachines.step M) start stop) : stop.state ∈ states := by
  induction reach with
  | refl => exact inside
  | @tail middle stop _ next ih =>
      obtain ⟨actual, transition, member⟩ := closed.step ih
      have eq := Option.some.inj (transition.symm.trans next)
      cases eq
      exact member

/-- Total closed state sets rule out halting for arbitrary tapes and unbounded running time. -/
theorem not_haltsFrom_of_closedTotal {M : Machine q 2} {states : Finset (Fin q)}
    (closed : ClosedTotal M states) {start : Cfg q 2} (inside : start.state ∈ states) :
    ¬ (eval (ConjectureMachines.step M) start).Dom := by
  intro halts
  obtain ⟨stop, result⟩ := Part.dom_iff_mem.mp halts
  obtain ⟨reach, terminal⟩ := mem_eval.mp result
  obtain ⟨next, transition, _⟩ := closed.step (closed.reaches inside reach)
  rw [transition] at terminal
  cases terminal

/-- A checked finite prefix entering a total closed state set proves divergence from its start. -/
theorem not_haltsFrom_of_runFrom_some {M : Machine q 2} {states : Finset (Fin q)}
    (closed : ClosedTotal M states) {n : ℕ} {start stop : Cfg q 2}
    (run : runFrom M n start = some stop) (inside : stop.state ∈ states) :
    ¬ (eval (ConjectureMachines.step M) start).Dom := by
  rw [reaches_eval (runFrom_reaches run)]
  exact not_haltsFrom_of_closedTotal closed inside

/-- Blank-tape divergence from a finite prefix and a closed total state set. -/
theorem not_halts_of_runFrom_some [NeZero q] {M : Machine q 2} {states : Finset (Fin q)}
    (closed : ClosedTotal M states) {n : ℕ} {stop : Cfg q 2}
    (run : runFrom M n init = some stop) (inside : stop.state ∈ states) : ¬ Halts M :=
  not_haltsFrom_of_runFrom_some closed run inside

/-- A prefix certificate may expose only its finite control state; no tape equality is required. -/
theorem not_halts_of_runFrom_state [NeZero q] {M : Machine q 2} {states : Finset (Fin q)}
    (closed : ClosedTotal M states) {n : ℕ} {state : Fin q}
    (run : (runFrom M n init).map Cfg.state = some state) (inside : state ∈ states) :
    ¬ Halts M := by
  cases previous : runFrom M n init with
  | none => simp [previous] at run
  | some cfg =>
      have eq : cfg.state = state := by simpa [previous] using run
      exact not_halts_of_runFrom_some closed previous (eq ▸ inside)

/-- A boolean prefix certificate can test membership directly without revealing the reached tape. -/
theorem not_halts_of_runFrom_inSet [NeZero q] {M : Machine q 2} {states : Finset (Fin q)}
    (closed : ClosedTotal M states) {n : ℕ}
    (run : (runFrom M n init).any (fun cfg ↦ decide (cfg.state ∈ states)) = true) :
    ¬ Halts M := by
  cases previous : runFrom M n init with
  | none => simp [previous] at run
  | some cfg =>
      have inside : cfg.state ∈ states := by simpa [previous] using run
      exact not_halts_of_runFrom_some closed previous inside

/-- Two control states form a total closed set whenever both complete rows jump to each other. -/
theorem closedTotal_pair (M : Machine q 2) (left right : Fin q)
    (leftRow : ∀ symbol, ∃ write direction,
      M.transition left symbol = some (write, direction, right))
    (rightRow : ∀ symbol, ∃ write direction,
      M.transition right symbol = some (write, direction, left)) :
    ClosedTotal M {left, right} := by
  intro state member symbol
  rcases Finset.mem_insert.mp member with rfl | member
  · obtain ⟨write, direction, transition⟩ := leftRow symbol
    exact ⟨write, direction, right, transition, Finset.mem_insert_of_mem (by simp)⟩
  · have eq := Finset.mem_singleton.mp member
    subst state
    obtain ⟨write, direction, transition⟩ := rightRow symbol
    exact ⟨write, direction, left, transition, Finset.mem_insert_self _ _⟩

/-- The common right/left bounce loop is a total closed state set on arbitrary tapes. -/
theorem closedTotal_bounce (M : Machine q 2) (rightward leftward : Fin q)
    (rightRow : ∀ symbol,
      M.transition rightward symbol = some (symbol, .right, leftward))
    (leftRow : ∀ symbol,
      M.transition leftward symbol = some (symbol, .left, rightward)) :
    ClosedTotal M {rightward, leftward} :=
  closedTotal_pair M rightward leftward
    (fun symbol ↦ ⟨symbol, .right, rightRow symbol⟩)
    (fun symbol ↦ ⟨symbol, .left, leftRow symbol⟩)

end ConjectureMachines.Compilation.Literal
