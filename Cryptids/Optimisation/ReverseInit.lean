/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.FlatInit

/-! # Flat initialization from a certified instruction schedule

The construction charges one state per instruction. The schedule may place the finite
input at any physical tape location; the resulting zipper must agree exactly.
-/

@[expose] public section
namespace ConjectureMachines.Optimisation.ReverseInit
open Turing StateTransition ConjectureMachines.Compilation

/-- Consecutive leftward writes, with the list determining their execution order. -/
def writes (bits : List (Fin 2)) (dir : Dir) : List Init.Instruction :=
  bits.map (fun bit ↦ (some bit, dir))

/-- A counted sequence of moves preserving every scanned cell. -/
def moves (dir : Dir) (count : Nat) : List Init.Instruction :=
  List.replicate count (none, dir)

/-- Reversed leftward writing leaves a blank cell immediately before the input. -/
theorem writes_reverse_left (bits : List (Fin 2)) :
    Init.executeList (writes bits.reverse .left) (Tape.mk₁ []) =
      Tape.mk₁ (0 :: bits) := by
  induction bits with
  | nil => rfl
  | cons bit rest ih =>
    rw [List.reverse_cons]
    simp only [writes, List.map_append, List.map_cons, List.map_nil]
    change Init.executeList (writes rest.reverse .left ++ [(some bit, .left)]) _ = _
    rw [Init.executeList_append, ih]
    rfl

/-- A single final right move restores the head onto the first input bit. -/
theorem reverse_correct (bits : List (Fin 2)) :
    Init.executeList (writes bits.reverse .left ++ moves .right 1) (Tape.mk₁ []) =
      Tape.mk₁ bits := by
  rw [Init.executeList_append, writes_reverse_left]
  change (Tape.mk₁ (0 :: bits)).move .right = Tape.mk₁ bits
  change (Tape.mk' (ListBlank.mk []) (ListBlank.mk (0 :: bits))).move .right = _
  rw [Tape.move_right_mk']
  have blank : ListBlank.mk [(0 : Fin 2)] = ListBlank.mk [] :=
    ListBlank.cons_head_tail (ListBlank.mk [])
  change Tape.mk' (ListBlank.mk [0]) (ListBlank.mk bits) = Tape.mk₁ bits
  rw [blank]
  rfl

/-- The seed schedule is exactly the accepted forward writer. -/
theorem forward_correct (bits : List (Fin 2)) :
    Init.executeList (writes bits .right ++ moves .left bits.length) (Tape.mk₁ []) =
      Tape.mk₁ bits := by
  change Init.executeList (bits.map (fun bit ↦ (some bit, .right)) ++
    List.replicate bits.length (none, .left)) _ = _
  rw [← FlatInit.writer_eq_actions]
  exact Init.writer_correct bits (ListBlank.mk [])


namespace Schedule

set_option backward.isDefEq.respectTransparency false

instance totalStates_neZero (actions : Array Init.Instruction) (body : BundledMachine 2) :
    NeZero (body.states + actions.size) := ⟨by have := NeZero.ne body.states; omega⟩

/-- Numeric embedding into the body block after all initializer states. -/
def bodyState (actions : Array Init.Instruction) (body : BundledMachine 2)
    (state : Fin body.states) : Fin (body.states + actions.size) :=
  ⟨actions.size + state.val, by have := state.isLt; omega⟩

/-- A prefix index may include the final boundary, which is body state zero. -/
def prefixState (actions : Array Init.Instruction) (body : BundledMachine 2) (i : Nat)
    (bound : i ≤ actions.size) : Fin (body.states + actions.size) :=
  ⟨i, by have := NeZero.ne body.states; omega⟩

/-- Flat transition construction with two numeric ranges and an unchanged body dispatch. -/
def machine (actions : Array Init.Instruction) (body : BundledMachine 2) :
    Machine (body.states + actions.size) 2 where
  transition state bit :=
    if inPrefix : state.val < actions.size then
      let action := actions[state.val]
      some (action.1.getD bit, action.2,
        ⟨state.val + 1, by have := NeZero.ne body.states; omega⟩)
    else
      (body.toMachine.transition
        ⟨state.val - actions.size, by have := state.isLt; omega⟩ bit).map
          (fun (write, dir, next) ↦ (write, dir, bodyState actions body next))

/-- One charged state per schedule instruction, followed by the unchanged body. -/
def initialise (actions : Array Init.Instruction) (body : BundledMachine 2) : BundledMachine 2 :=
  ⟨body.states + actions.size, machine actions body⟩

/-- Shift body states numerically without changing any tape cell. -/
def embed (actions : Array Init.Instruction) (body : BundledMachine 2)
    (cfg : Cfg body.states 2) : Cfg (body.states + actions.size) 2 :=
  ⟨bodyState actions body cfg.state, cfg.tape⟩


@[simp] theorem prefixState_zero (actions : Array Init.Instruction) (body : BundledMachine 2) :
    prefixState actions body 0 (by omega) = 0 := rfl

@[simp] theorem prefixState_final (actions : Array Init.Instruction) (body : BundledMachine 2) :
    prefixState actions body actions.size (by omega) = bodyState actions body 0 := by
  apply Fin.ext
  simp [prefixState, bodyState]

theorem step_prefix (actions : Array Init.Instruction) (body : BundledMachine 2) (i : Nat)
    (bound : i < actions.size) (tape : Tape (Fin 2)) :
    step (machine actions body) ⟨prefixState actions body i (by omega), tape⟩ =
      some ⟨prefixState actions body (i + 1) (by omega), Init.execute actions[i] tape⟩ := by
  simp only [step, machine, prefixState, bound, ↓reduceDIte, Option.map_some, Init.execute]

theorem prefix_run (actions : Array Init.Instruction) (body : BundledMachine 2) (count : Nat) :
    ∀ (i : Nat) (total : i + count = actions.size) (tape : Tape (Fin 2)),
      FlatInit.runFrom (machine actions body) count ⟨prefixState actions body i (by omega), tape⟩ =
        some ⟨bodyState actions body 0, Init.executeList (actions.toList.drop i) tape⟩ := by
  induction count with
  | zero =>
    intro i total tape
    have equal : i = actions.size := by omega
    subst i
    have dropped : actions.toList.drop actions.size = [] := by simp
    simp only [FlatInit.runFrom, dropped, Init.executeList, prefixState_final]
  | succ count ih =>
    intro i total tape
    have bound : i < actions.size := by omega
    have split := List.drop_eq_getElem_cons (l := actions.toList)
      (show i < actions.toList.length by simpa using bound)
    simp only [Array.getElem_toList] at split
    simp only [FlatInit.runFrom, step_prefix actions body i bound, Option.bind_some,
      split, Init.executeList]
    exact ih (i + 1) (by omega) (Init.execute actions[i] tape)

@[simp] theorem initialise_states (actions : Array Init.Instruction) (body : BundledMachine 2) :
    (initialise actions body).states = body.states + actions.size := rfl

theorem step_embed (actions : Array Init.Instruction) (body : BundledMachine 2)
    (cfg : Cfg body.states 2) :
    step (machine actions body) (embed actions body cfg) =
      (step body.toMachine cfg).map (embed actions body) := by
  rcases cfg with ⟨state, tape⟩
  simp only [step, machine, embed, bodyState,
    show ¬actions.size + state.val < actions.size by omega, ↓reduceDIte,
    Nat.add_sub_cancel_left]
  cases body.toMachine.transition state tape.head <;> rfl

theorem respects (actions : Array Init.Instruction) (body : BundledMachine 2) :
    Respects (step body.toMachine) (step (machine actions body))
      (fun first second ↦ embed actions body first = second) := by
  intro cfg target equal
  subst target
  rw [step_embed]
  cases move : step body.toMachine cfg with
  | none => rfl
  | some next => exact ⟨embed actions body next, rfl, .single (by rw [step_embed, move]; rfl)⟩

/-- Exact paid execution, including empty schedules, on any starting tape. -/
theorem initialise_run (actions : Array Init.Instruction) (body : BundledMachine 2)
    (tape : Tape (Fin 2)) :
    FlatInit.runFrom (initialise actions body).toMachine actions.size ⟨0, tape⟩ =
      some (embed actions body ⟨0, Init.executeList actions.toList tape⟩) := by
  simpa only [prefixState_zero, List.drop_zero, initialise, embed] using
    prefix_run actions body actions.size 0 (by omega) tape

theorem initialise_halts (actions : Array Init.Instruction) (body : BundledMachine 2) :
    (initialise actions body).Halts ↔
      Init.HaltsOn body.toMachine (Init.executeList actions.toList (Tape.mk₁ [])) := by
  have reached := FlatInit.runFrom_reaches _ _ _ _
    (initialise_run actions body (Tape.mk₁ []))
  have prefixRun := reaches_eval reached
  have bodyRun := tr_eval_dom (respects actions body)
    (show embed actions body (⟨0, Init.executeList actions.toList (Tape.mk₁ [])⟩ :
      Cfg body.states 2) = _ from rfl)
  exact (Iff.of_eq (congrArg Part.Dom prefixRun)).trans bodyRun

/-- Independent row contract for every prefix index and either scanned symbol. -/
theorem transition_prefix (actions : Array Init.Instruction) (body : BundledMachine 2)
    (i : Nat) (bound : i < actions.size) (bit : Fin 2) :
    (machine actions body).transition (prefixState actions body i (by omega)) bit =
      some (actions[i].1.getD bit, actions[i].2,
        prefixState actions body (i + 1) (by omega)) := by
  simp [machine, prefixState, bound]

/-- Independent row contract for every body index, including missing transitions. -/
theorem transition_body (actions : Array Init.Instruction) (body : BundledMachine 2)
    (state : Fin body.states) (bit : Fin 2) :
    (machine actions body).transition (bodyState actions body state) bit =
      (body.toMachine.transition state bit).map
        (fun (write, dir, next) ↦ (write, dir, bodyState actions body next)) := by
  simp only [machine, bodyState, show ¬actions.size + state.val < actions.size by omega,
    ↓reduceDIte, Nat.add_sub_cancel_left]

end Schedule

end ConjectureMachines.Optimisation.ReverseInit
