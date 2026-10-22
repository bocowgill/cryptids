/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Chess.Optimisation.FieldPacked
public import Cryptids.Chess.Optimisation.OpenEvolveWide

/-! # The complete field-packed chess machine with a shorter paid initializer

The frozen input bits and body are unchanged. The initializer writes the input in
reverse order while moving left, then moves right onto its first bit. Its resulting
relative tape is exactly `Tape.mk₁ bits.toList`; this does not restore a distinguished
physical origin. Every write and the final turn remain charged as states.
-/

@[expose] public section
namespace Chess.Optimisation.FieldReverse
open Turing ConjectureMachines ConjectureMachines.Compilation
open ConjectureMachines.Optimisation

set_option backward.isDefEq.respectTransparency false
attribute [local irreducible] Compilation.Input.bits FieldAware.bits FieldPacked.bits

/-- The exact frozen field-packed input, with its original codec and bit order. -/
def bits : Array (Fin 2) := FieldPacked.bits

theorem bits_size : bits.size = 1837940 := FieldPacked.bits_size

/-- The complete accepted body, including all control, return, and halting states. -/
abbrev body : BundledMachine 2 := FieldPacked.body

theorem body_states : body.states = 1066682 := FieldPacked.body_states

theorem body_halts_input :
    Init.HaltsOn body.toMachine (Tape.mk₁ bits.toList) ↔
      ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) := by
  simpa only [bits] using FieldPacked.body_halts_input

attribute [local irreducible] bits

/-- One leftward write per bit, followed by one rightward move, including empty input. -/
def actions : Array Init.Instruction := OpenEvolveWide.schedule bits

abbrev generated : BundledMachine 2 := ReverseInit.Schedule.initialise actions body

instance generated_neZero : NeZero generated.states := generated.neZeroStates

theorem prefix_states : actions.size = 1837941 := by
  rw [actions, OpenEvolveWide.schedule_size, bits_size]

theorem generated_states : generated.states = 2904623 := by
  have count := OpenEvolveWide.schedule_initialise_states bits body
  rw [body_states, bits_size] at count
  exact count

/-- Explicit binary machine, initially at state zero on an entirely blank tape. -/
def machine : Machine 2904623 2 :=
  Compilation.Image.castMachine generated_states generated.toMachine

theorem generated_halts : generated.Halts ↔ ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) := by
  change (ReverseInit.Schedule.initialise (OpenEvolveWide.schedule bits) body).Halts ↔ _
  rw [ReverseInit.Schedule.initialise_halts, OpenEvolveWide.schedule_correct]
  exact body_halts_input

theorem halts_iff : Halts machine ↔ ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) :=
  (Compilation.Image.cast_halts generated_states generated.toMachine).trans generated_halts

theorem equivalent : Halts machine ↔ Halts FieldPacked.machine :=
  halts_iff.trans FieldPacked.halts_iff.symm

theorem saved_states : FieldPacked.generated.states - generated.states = 1837939 := by
  rw [FieldPacked.generated_states, generated_states]

theorem strict_reduction : generated.states < FieldPacked.generated.states := by
  rw [generated_states, FieldPacked.generated_states]
  decide

/-- Exact paid body entry with the complete input and blank tape exterior. -/
theorem initialises :
    FlatInit.runFrom machine 1837941 ConjectureMachines.init =
      some (⟨1837941, Tape.mk₁ bits.toList⟩ : Cfg 2904623 2) :=
  OpenEvolveWide.cast_initialises bits body generated_states prefix_states (by decide)

theorem rowGenerated_states :
    (ReverseInit.Schedule.initialise actions FieldPacked.rowBody).states = 2904623 := by
  rw [FieldPacked.rowBody_eq]
  exact generated_states

/-- Independent body rows use the same frozen row recipe and paid reverse prefix. -/
def rowMachine : Machine 2904623 2 :=
  OpenEvolveWide.numericImage actions FieldPacked.rowBody rowGenerated_states

theorem rowMachine_eq : rowMachine = machine :=
  OpenEvolveWide.numericImage_congr actions FieldPacked.rowBody body
    FieldPacked.rowBody_eq rowGenerated_states generated_states

end Chess.Optimisation.FieldReverse
