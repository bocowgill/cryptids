/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Chess.Compilation.Image
public import Cryptids.Optimisation.CompactPost

/-! # The first strictly smaller chess machine

Only duplicate Post controls are quotiented. The frozen graph, binary compiler,
entire input and fully paid blank initializer are unchanged.
-/

@[expose] public section
namespace Chess.Optimisation.M7
open Turing ConjectureMachines ConjectureMachines.Compilation

set_option backward.isDefEq.respectTransparency false
attribute [local irreducible] Compilation.Input.bits

def post := ConjectureMachines.Optimisation.CompactPost.machine Compilation.Image.getter

theorem post_count :
    ConjectureMachines.Optimisation.CompactPost.stateCount
      (TemplateGraph.build Compilation.Image.data).raw.count 5 = 194468231 := by
  rw [ConjectureMachines.Optimisation.CompactPost.stateCount, Compilation.Image.node_count]

abbrev body : BundledMachine 2 :=
  ⟨ConjectureMachines.Optimisation.CompactPost.stateCount
      (TemplateGraph.build Compilation.Image.data).raw.count 5 +
    ConjectureMachines.Optimisation.CompactPost.stateCount
      (TemplateGraph.build Compilation.Image.data).raw.count 5, Binary.compile post⟩

theorem body_states : body.states = 388936462 := by
  change _ + _ = _
  rw [post_count]

abbrev generated : BundledMachine 2 := FlatInit.initialise Compilation.Input.bits body

theorem generated_states : generated.states = 392046822 := by
  change body.states + 2 * Compilation.Input.bits.size = _
  rw [body_states, Compilation.Input.paid_prefix]

/-- The fixed numeric candidate, with every binary and initializer control counted. -/
def machine : Machine 392046822 2 :=
  Compilation.Image.castMachine generated_states generated.toMachine

theorem post_halts_input :
    (TM0.eval post Compilation.Input.binary).Dom ↔
      ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) :=
  (ConjectureMachines.Optimisation.CompactPost.halts_input
    Compilation.Image.getter Compilation.Input.binary).trans Compilation.Image.post_halts_input

theorem body_halts_input :
    Init.HaltsOn body.toMachine (Tape.mk₁ Compilation.Input.bits.toList) ↔
      ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) := by
  rw [Compilation.Input.bits_toList]
  exact (Binary.compile_halts_input post Compilation.Input.binary).trans post_halts_input

theorem generated_halts : generated.Halts ↔ ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) :=
  (FlatInit.initialise_halts Compilation.Input.bits body).trans body_halts_input

/-- Unconditional equivalence with the unchanged frozen strategic proposition. -/
theorem halts_iff : Halts machine ↔ ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) :=
  (Compilation.Image.cast_halts generated_states generated.toMachine).trans generated_halts

/-- The accepted baseline and candidate halt in exactly the same cases. -/
theorem equivalent : Halts machine ↔ Halts Compilation.Image.machine :=
  halts_iff.trans Compilation.Image.halts_iff.symm

theorem strict_reduction : 392046822 < 392046832 := by decide

theorem saved_states : 392046832 - 392046822 = 10 := by decide

/-- The exact same bit stream is still produced by ordinary execution from blank state zero. -/
theorem initialises :
    FlatInit.runFrom machine 3110360 ConjectureMachines.init =
      some (⟨3110360, Tape.mk₁ Compilation.Input.bits.toList⟩ : Cfg 392046822 2) :=
  Compilation.Image.initialise_cast_paid_run Compilation.Input.bits body generated_states
    Compilation.Input.paid_prefix (by decide)

end Chess.Optimisation.M7
