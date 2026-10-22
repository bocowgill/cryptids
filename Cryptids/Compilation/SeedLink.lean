/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.FlatInit

/-! # A paid link through one protected success state

The original controller keeps its numeric states. Only its designated terminal success state
is patched: it preserves the scanned bit and moves right into one fresh bridge state. The
bridge preserves its scanned bit and moves left into body state zero. The body occupies the
remaining states, with every transition (including every missing transition) preserved.

The construction uses exactly `D + 1 + body.states` states. The two handoff steps preserve the
complete tape and restore the head. No assumption about the controller's input protocol,
other terminal states, or tape contents is needed.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.SeedLink

open Turing StateTransition Relation

set_option backward.isDefEq.respectTransparency false

variable {D : Nat}

instance totalStates_neZero (D : Nat) (body : BundledMachine 2) :
    NeZero (D + 1 + body.states) := ⟨by omega⟩

/-- The controller retains its original state numbers. -/
def oldState (body : BundledMachine 2) (state : Fin D) : Fin (D + 1 + body.states) :=
  ⟨state.val, by have := state.isLt; omega⟩

/-- The one additional paid state lies between the controller and body blocks. -/
def bridgeState (D : Nat) (body : BundledMachine 2) : Fin (D + 1 + body.states) :=
  ⟨D, by omega⟩

/-- The body starts immediately after the paid bridge. -/
def bodyState (D : Nat) (body : BundledMachine 2) (state : Fin body.states) :
    Fin (D + 1 + body.states) :=
  ⟨D + 1 + state.val, by have := state.isLt; omega⟩

/-- Patch only `done`; other missing controller transitions remain missing. -/
def machine (M : Machine D 2) (done : Fin D) (body : BundledMachine 2) :
    Machine (D + 1 + body.states) 2 where
  transition state bit :=
    if inOld : state.val < D then
      if state.val = done.val then
        some (bit, .right, bridgeState D body)
      else
        (M.transition ⟨state.val, inOld⟩ bit).map
          (fun (write, dir, next) ↦ (write, dir, oldState body next))
    else if atBridge : state.val = D then
      some (bit, .left, bodyState D body 0)
    else
      (body.toMachine.transition
        ⟨state.val - (D + 1), by have := state.isLt; omega⟩ bit).map
          (fun (write, dir, next) ↦ (write, dir, bodyState D body next))

/-- Bundle the controller, paid bridge and unchanged body. -/
def link (M : Machine D 2) (done : Fin D) (body : BundledMachine 2) : BundledMachine 2 :=
  ⟨D + 1 + body.states, machine M done body⟩

@[simp] theorem link_states (M : Machine D 2) (done : Fin D) (body : BundledMachine 2) :
    (link M done body).states = D + 1 + body.states := rfl

/-- Embed a controller configuration without changing any tape cell or the head. -/
def embedOld (body : BundledMachine 2) (cfg : Cfg D 2) : Cfg (D + 1 + body.states) 2 :=
  ⟨oldState body cfg.state, cfg.tape⟩

/-- Embed a body configuration without changing any tape cell or the head. -/
def embedBody (D : Nat) (body : BundledMachine 2) (cfg : Cfg body.states 2) :
    Cfg (D + 1 + body.states) 2 :=
  ⟨bodyState D body cfg.state, cfg.tape⟩

@[simp] theorem oldState_zero [NeZero D] (body : BundledMachine 2) :
    oldState body (0 : Fin D) = 0 := rfl

@[simp] theorem embedOld_tape (body : BundledMachine 2) (cfg : Cfg D 2) :
    (embedOld body cfg).tape = cfg.tape := rfl

@[simp] theorem embedBody_tape (D : Nat) (body : BundledMachine 2)
    (cfg : Cfg body.states 2) : (embedBody D body cfg).tape = cfg.tape := rfl

@[simp] theorem embedOld_state_val (body : BundledMachine 2) (cfg : Cfg D 2) :
    (embedOld body cfg).state.val = cfg.state.val := rfl

@[simp] theorem embedBody_state_val (D : Nat) (body : BundledMachine 2)
    (cfg : Cfg body.states 2) :
    (embedBody D body cfg).state.val = D + 1 + cfg.state.val := rfl

/-- Every original row except the designated success row is preserved exactly. -/
theorem transition_old (M : Machine D 2) (done : Fin D) (body : BundledMachine 2)
    (state : Fin D) (away : state ≠ done) (bit : Fin 2) :
    (machine M done body).transition (oldState body state) bit =
      (M.transition state bit).map
        (fun (write, dir, next) ↦ (write, dir, oldState body next)) := by
  have different : state.val ≠ done.val := fun equal ↦ away (Fin.ext equal)
  simp only [machine, oldState, state.isLt, ↓reduceDIte, different, ↓reduceIte]

/-- Every other halt remains a halt, even when it is reachable on malformed input. -/
theorem transition_old_none (M : Machine D 2) (done : Fin D) (body : BundledMachine 2)
    (state : Fin D) (away : state ≠ done) (bit : Fin 2)
    (halt : M.transition state bit = none) :
    (machine M done body).transition (oldState body state) bit = none := by
  rw [transition_old M done body state away bit, halt]
  rfl

/-- The protected success row preserves either scanned bit and moves right to the bridge. -/
theorem transition_done (M : Machine D 2) (done : Fin D) (body : BundledMachine 2)
    (bit : Fin 2) :
    (machine M done body).transition (oldState body done) bit =
      some (bit, .right, bridgeState D body) := by
  simp [machine, oldState, done.isLt]

/-- The fresh bridge preserves either scanned bit and moves left into body state zero. -/
theorem transition_bridge (M : Machine D 2) (done : Fin D) (body : BundledMachine 2)
    (bit : Fin 2) :
    (machine M done body).transition (bridgeState D body) bit =
      some (bit, .left, bodyState D body 0) := by
  simp [machine, bridgeState]

/-- Every body row preserves writes, directions, destinations, and missing transitions. -/
theorem transition_body (M : Machine D 2) (done : Fin D) (body : BundledMachine 2)
    (state : Fin body.states) (bit : Fin 2) :
    (machine M done body).transition (bodyState D body state) bit =
      (body.toMachine.transition state bit).map
        (fun (write, dir, next) ↦ (write, dir, bodyState D body next)) := by
  simp only [machine, bodyState, show ¬D + 1 + state.val < D by omega, ↓reduceDIte,
    show D + 1 + state.val ≠ D by omega, Nat.add_sub_cancel_left]

/-- Original controller steps commute with embedding away from the patched state. -/
theorem step_embedOld (M : Machine D 2) (done : Fin D) (body : BundledMachine 2)
    (cfg : Cfg D 2) (away : cfg.state ≠ done) :
    step (machine M done body) (embedOld body cfg) =
      (step M cfg).map (embedOld body) := by
  rcases cfg with ⟨state, tape⟩
  simp only [step, embedOld, transition_old M done body state away]
  cases M.transition state tape.head <;> rfl

/-- No successful original step can start at the terminal success state. -/
theorem step_source_ne_done (M : Machine D 2) (done : Fin D)
    (terminal : ∀ bit, M.transition done bit = none) (cfg next : Cfg D 2)
    (move : step M cfg = some next) : cfg.state ≠ done := by
  intro equal
  rcases cfg with ⟨state, tape⟩
  change state = done at equal
  subst state
  simp [step, terminal] at move

/-- A terminal success state cannot be stepped over, so every finite original path lifts. -/
theorem reaches_lift (M : Machine D 2) (done : Fin D) (body : BundledMachine 2)
    (terminal : ∀ bit, M.transition done bit = none) {cfg out : Cfg D 2}
    (path : Reaches (step M) cfg out) :
    Reaches (step (machine M done body)) (embedOld body cfg) (embedOld body out) := by
  apply ReflTransGen.lift (embedOld body) ?_ _ _ path
  intro first next move
  have away := step_source_ne_done M done terminal first next move
  change step (machine M done body) (embedOld body first) = some (embedOld body next)
  rw [step_embedOld M done body first away, show step M first = some next from move]
  rfl

/-- The lifted controller path has the same number of runtime steps. -/
theorem runFrom_lift (M : Machine D 2) (done : Fin D) (body : BundledMachine 2)
    (terminal : ∀ bit, M.transition done bit = none) (count : Nat) :
    ∀ cfg out, FlatInit.runFrom M count cfg = some out →
      FlatInit.runFrom (machine M done body) count (embedOld body cfg) =
        some (embedOld body out) := by
  induction count with
  | zero => intro cfg out result; cases result; rfl
  | succ count ih =>
    intro cfg out result
    cases move : step M cfg with
    | none => simp [FlatInit.runFrom, move] at result
    | some next =>
      have away := step_source_ne_done M done terminal cfg next move
      have rest : FlatInit.runFrom M count next = some out := by
        simpa only [FlatInit.runFrom, move, Option.bind_some] using result
      simp only [FlatInit.runFrom, step_embedOld M done body cfg away, move,
        Option.map_some, Option.bind_some]
      exact ih next out rest

/-- The first preserving handoff step moves the head one cell to the right. -/
theorem step_done (M : Machine D 2) (done : Fin D) (body : BundledMachine 2)
    (tape : Tape (Fin 2)) :
    step (machine M done body) (embedOld body ⟨done, tape⟩) =
      some ⟨bridgeState D body, tape.move .right⟩ := by
  simp only [step, embedOld, transition_done, Option.map_some, Tape.write_self]

/-- The second preserving handoff step restores exactly the original tape and head. -/
theorem step_bridge (M : Machine D 2) (done : Fin D) (body : BundledMachine 2)
    (tape : Tape (Fin 2)) :
    step (machine M done body) ⟨bridgeState D body, tape.move .right⟩ =
      some (embedBody D body ⟨0, tape⟩) := by
  simp only [step, transition_bridge, Option.map_some, Tape.write_self, Tape.move_right_left,
    embedBody]

/-- Exactly two runtime steps perform the handoff, for an arbitrary complete tape. -/
theorem handoff_run (M : Machine D 2) (done : Fin D) (body : BundledMachine 2)
    (tape : Tape (Fin 2)) :
    FlatInit.runFrom (machine M done body) 2 (embedOld body ⟨done, tape⟩) =
      some (embedBody D body ⟨0, tape⟩) := by
  simp only [FlatInit.runFrom, step_done, Option.bind_some, step_bridge]

theorem handoff_reaches (M : Machine D 2) (done : Fin D) (body : BundledMachine 2)
    (tape : Tape (Fin 2)) :
    Reaches (step (machine M done body)) (embedOld body ⟨done, tape⟩)
      (embedBody D body ⟨0, tape⟩) :=
  FlatInit.runFrom_reaches _ _ _ _ (handoff_run M done body tape)

/-- Concatenating finite executions adds runtime lengths, independently of state counts. -/
theorem runFrom_add {q : Nat} (M : Machine q 2) (first second : Nat) (cfg : Cfg q 2) :
    FlatInit.runFrom M (first + second) cfg =
      (FlatInit.runFrom M first cfg).bind (FlatInit.runFrom M second) := by
  induction first generalizing cfg with
  | zero => simp only [Nat.zero_add, FlatInit.runFrom, Option.bind_some]
  | succ first ih =>
    simp only [Nat.succ_add, FlatInit.runFrom, ih, Option.bind_assoc]

/-- A controller run of `count` steps reaches the unchanged body entry in `count + 2` steps. -/
theorem link_runFrom [NeZero D] (M : Machine D 2) (done : Fin D) (body : BundledMachine 2)
    (terminal : ∀ bit, M.transition done bit = none) (S T : Tape (Fin 2)) (count : Nat)
    (result : FlatInit.runFrom M count ⟨0, S⟩ = some ⟨done, T⟩) :
    FlatInit.runFrom (link M done body).toMachine (count + 2) ⟨0, S⟩ =
      some (embedBody D body ⟨0, T⟩) := by
  have lifted := runFrom_lift M done body terminal count ⟨0, S⟩ ⟨done, T⟩ result
  change FlatInit.runFrom (machine M done body) (count + 2)
    (embedOld body ⟨0, S⟩) = _
  rw [runFrom_add, lifted, Option.bind_some, handoff_run]

/-- The offset body embedding preserves both successor steps and exact stopping. -/
theorem step_embedBody (M : Machine D 2) (done : Fin D) (body : BundledMachine 2)
    (cfg : Cfg body.states 2) :
    step (machine M done body) (embedBody D body cfg) =
      (step body.toMachine cfg).map (embedBody D body) := by
  rcases cfg with ⟨state, tape⟩
  simp only [step, embedBody, transition_body]
  cases body.toMachine.transition state tape.head <;> rfl

/-- Refinement is used only for the unchanged body, not for the patched terminal controller. -/
theorem body_respects (M : Machine D 2) (done : Fin D) (body : BundledMachine 2) :
    Respects (step body.toMachine) (step (machine M done body))
      (fun first second ↦ embedBody D body first = second) := by
  intro cfg target equal
  subst target
  rw [step_embedBody]
  cases move : step body.toMachine cfg with
  | none => rfl
  | some next =>
    exact ⟨embedBody D body next, rfl, .single (by rw [step_embedBody, move]; rfl)⟩

/-- Both halting directions hold at every embedded body configuration. -/
theorem body_halts_iff (M : Machine D 2) (done : Fin D) (body : BundledMachine 2)
    (cfg : Cfg body.states 2) :
    (eval (step (machine M done body)) (embedBody D body cfg)).Dom ↔
      (eval (step body.toMachine) cfg).Dom :=
  tr_eval_dom (body_respects M done body) rfl

/-- A successful finite controller path enters the body with the complete final tape unchanged. -/
theorem link_reaches [NeZero D] (M : Machine D 2) (done : Fin D) (body : BundledMachine 2)
    (terminal : ∀ bit, M.transition done bit = none) (S T : Tape (Fin 2))
    (path : Reaches (step M) ⟨0, S⟩ ⟨done, T⟩) :
    Reaches (step (link M done body).toMachine) ⟨0, S⟩ (embedBody D body ⟨0, T⟩) := by
  have lifted := reaches_lift M done body terminal path
  exact lifted.trans (handoff_reaches M done body T)

/-- Conditional on reaching protected success, linking preserves and reflects halting. -/
theorem link_haltsOn [NeZero D] (M : Machine D 2) (done : Fin D) (body : BundledMachine 2)
    (terminal : ∀ bit, M.transition done bit = none) (S T : Tape (Fin 2))
    (path : Reaches (step M) ⟨0, S⟩ ⟨done, T⟩) :
    Init.HaltsOn (link M done body).toMachine S ↔ Init.HaltsOn body.toMachine T := by
  have prefixRun := reaches_eval (link_reaches M done body terminal S T path)
  exact (Iff.of_eq (congrArg Part.Dom prefixRun)).trans
    (body_halts_iff M done body ⟨0, T⟩)

/-- The same halting interface accepts an explicit finite runtime witness. -/
theorem link_haltsOn_of_runFrom [NeZero D] (M : Machine D 2) (done : Fin D)
    (body : BundledMachine 2) (terminal : ∀ bit, M.transition done bit = none)
    (S T : Tape (Fin 2)) (count : Nat)
    (result : FlatInit.runFrom M count ⟨0, S⟩ = some ⟨done, T⟩) :
    Init.HaltsOn (link M done body).toMachine S ↔ Init.HaltsOn body.toMachine T :=
  link_haltsOn M done body terminal S T (FlatInit.runFrom_reaches _ _ _ _ result)

/-- Independent natural-number row specification, with no hidden control states. -/
def numericRow (M : Machine D 2) (done : Fin D) (body : BundledMachine 2)
    (state : Nat) (bit : Fin 2) : Option (Fin 2 × Dir × Nat) :=
  if inOld : state < D then
    if state = done.val then some (bit, .right, D)
    else (M.transition ⟨state, inOld⟩ bit).map
      (fun (write, dir, next) ↦ (write, dir, next.val))
  else if state = D then some (bit, .left, D + 1)
  else if inBody : state - (D + 1) < body.states then
    (body.toMachine.transition ⟨state - (D + 1), inBody⟩ bit).map
      (fun (write, dir, next) ↦ (write, dir, D + 1 + next.val))
  else none

/-- Every actual table row agrees with the independent numeric row specification. -/
theorem transition_numericRow (M : Machine D 2) (done : Fin D) (body : BundledMachine 2)
    (state : Fin (D + 1 + body.states)) (bit : Fin 2) :
    ((machine M done body).transition state bit).map
        (fun (write, dir, next) ↦ (write, dir, next.val)) =
      numericRow M done body state.val bit := by
  by_cases inOld : state.val < D
  · by_cases success : state.val = done.val
    · simp [machine, numericRow, success, bridgeState]
    · simp only [machine, numericRow, inOld, ↓reduceDIte, success, ↓reduceIte]
      cases M.transition ⟨state.val, inOld⟩ bit <;> rfl
  · by_cases bridge : state.val = D
    · simp [machine, numericRow, bridge, bodyState]
    · have inBody : state.val - (D + 1) < body.states := by have := state.isLt; omega
      simp only [machine, numericRow, inOld, ↓reduceDIte, bridge, ↓reduceIte, inBody]
      cases body.toMachine.transition ⟨state.val - (D + 1), inBody⟩ bit <;> rfl

end ConjectureMachines.Compilation.SeedLink
