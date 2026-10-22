/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.Seed.Expander
public import Cryptids.Compilation.Seed.ChessCodec
public import Cryptids.Compilation.SeedLink

/-! # A complete chess machine with a paid compressed seed

The writer installs the original chess data in a three-bit seed. The complete finite
controller expands it to the unchanged field codec, removes every temporary marker, and
hands the exact tape to the accepted selective body. All controls, including the bridge
and terminal success state, are included in the full machine count.
-/

@[expose] public section
namespace Chess.Optimisation.FieldSeed

open Turing StateTransition Relation ConjectureMachines ConjectureMachines.Compilation
open ConjectureMachines.Optimisation

set_option backward.isDefEq.respectTransparency false
attribute [local irreducible] Compilation.Input.bits FieldAware.bits FieldPacked.bits
  FieldSelective.bits

def bits : Array (Fin 2) := Seed.ChessCodec.bits

theorem bits_size : bits.size = 424156 := Seed.ChessCodec.bits_size

/-- All 216 controller states, one bridge, and the entire accepted body are paid. -/
abbrev linked : BundledMachine 2 :=
  SeedLink.link Seed.machine Seed.done FieldSelective.body

theorem linked_states : linked.states = 574019 := rfl

theorem complete_allocation : linked.states = 216 + 1 + 533341 + 40461 := rfl

/-- The actual universal controller installs the exact frozen body input. -/
theorem expander_reaches :
    Reaches (step Seed.machine) ⟨0, Tape.mk₁ bits.toList⟩
      ⟨Seed.done, Tape.mk₁ FieldSelective.bits.toList⟩ := by
  have result := Seed.seed_reaches Seed.ChessCodec.letters
  rw [Seed.ChessCodec.output_eq] at result
  simpa only [bits, Seed.ChessCodec.bits_toList, Seed.entry, Seed.encode] using result

theorem linked_halts_input :
    Init.HaltsOn linked.toMachine (Tape.mk₁ bits.toList) ↔
      ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) := by
  exact (SeedLink.link_haltsOn Seed.machine Seed.done FieldSelective.body
    Seed.terminal_done _ _ expander_reaches).trans FieldSelective.body_halts_input

attribute [local irreducible] bits

def actions : Array Init.Instruction := OpenEvolveWide.schedule bits

theorem prefix_states : actions.size = 424157 := by
  rw [actions, OpenEvolveWide.schedule_size, bits_size]

abbrev generated : BundledMachine 2 := ReverseInit.Schedule.initialise actions linked

instance generated_neZero : NeZero generated.states := generated.neZeroStates

theorem generated_states : generated.states = 998176 := by
  rw [ReverseInit.Schedule.initialise_states, linked_states, prefix_states]

/-- Ordinary two-symbol control, with state zero and an entirely blank starting tape. -/
def machine : Machine 998176 2 :=
  Compilation.Image.castMachine generated_states generated.toMachine

theorem generated_halts : generated.Halts ↔ ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) := by
  rw [ReverseInit.Schedule.initialise_halts]
  change Init.HaltsOn linked.toMachine
    (Init.executeList (OpenEvolveWide.schedule bits).toList (Tape.mk₁ [])) ↔ _
  rw [OpenEvolveWide.schedule_correct]
  exact linked_halts_input

theorem halts_iff : Halts machine ↔ ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) :=
  (Compilation.Image.cast_halts generated_states generated.toMachine).trans generated_halts

theorem equivalent : Halts machine ↔ Halts FieldSelective.machine :=
  halts_iff.trans FieldSelective.halts_iff.symm

theorem saved_states : FieldSelective.generated.states - generated.states = 1413567 := by
  rw [FieldSelective.generated_states, generated_states]

theorem strict_reduction : generated.states < FieldSelective.generated.states := by
  rw [generated_states, FieldSelective.generated_states]
  decide

/-- The independent accepted body rows are connected through the same paid success port. -/
def rowLinked : BundledMachine 2 :=
  SeedLink.link Seed.machine Seed.done FieldSelective.rowBody

theorem rowLinked_eq : rowLinked = linked := by
  unfold rowLinked linked
  rw [FieldSelective.rowBody_eq]

theorem rowGenerated_states :
    (ReverseInit.Schedule.initialise actions rowLinked).states = 998176 := by
  rw [rowLinked_eq]
  exact generated_states

/-- Numeric prefix rows include every seed bit, the turn, the controller and the whole body. -/
def rowMachine : Machine 998176 2 :=
  OpenEvolveWide.numericImage actions rowLinked rowGenerated_states

theorem rowMachine_eq : rowMachine = machine :=
  OpenEvolveWide.numericImage_congr actions rowLinked linked
    rowLinked_eq rowGenerated_states generated_states

end Chess.Optimisation.FieldSeed
