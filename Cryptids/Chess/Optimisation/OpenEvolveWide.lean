/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Chess.Optimisation.OpenEvolve
public import Cryptids.Optimisation.ReverseInit

/-! # A shorter paid initializer for the frozen chess body

The body and serialized input are unchanged. Reverse-order leftward writing pays
one state per input bit, followed by one rightward step onto the first input bit.
-/

@[expose] public section
namespace Chess.Optimisation.OpenEvolveWide
open Turing ConjectureMachines ConjectureMachines.Compilation
open ConjectureMachines.Optimisation

set_option backward.isDefEq.respectTransparency false
attribute [local irreducible] Compilation.Input.bits

def schedule (bits : Array (Fin 2)) : Array Init.Instruction :=
  (bits.reverse.map (fun bit ↦ (some bit, Dir.left))).push (none, .right)

theorem schedule_size (bits : Array (Fin 2)) : (schedule bits).size = bits.size + 1 := by
  simp [schedule]

theorem schedule_list (bits : Array (Fin 2)) :
    (schedule bits).toList =
      ReverseInit.writes bits.toList.reverse .left ++ ReverseInit.moves .right 1 := by
  simp [schedule, ReverseInit.writes, ReverseInit.moves]

theorem schedule_correct (bits : Array (Fin 2)) :
    Init.executeList (schedule bits).toList (Tape.mk₁ []) = Tape.mk₁ bits.toList := by
  rw [schedule_list]
  exact ReverseInit.reverse_correct bits.toList

/-- Count symbolically before instantiating the frozen million-bit input. -/
theorem schedule_initialise_states (bits : Array (Fin 2)) (body : BundledMachine 2) :
    (ReverseInit.Schedule.initialise (schedule bits) body).states =
      body.states + (bits.size + 1) := by
  rw [ReverseInit.Schedule.initialise_states, schedule_size]

abbrev generated : BundledMachine 2 :=
  ReverseInit.Schedule.initialise (schedule Compilation.Input.bits) OpenEvolve.body

instance generated_neZero : NeZero generated.states := generated.neZeroStates

theorem prefix_states : (schedule Compilation.Input.bits).size = 1555181 := by
  rw [schedule_size, Compilation.Input.bits_size]

theorem generated_states : generated.states = 390491642 := by
  have count := schedule_initialise_states Compilation.Input.bits OpenEvolve.body
  rw [OpenEvolve.body_states, Compilation.Input.bits_size] at count
  exact count

def machine : Machine 390491642 2 :=
  Compilation.Image.castMachine generated_states generated.toMachine

theorem generated_halts : generated.Halts ↔ ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) := by
  rw [ReverseInit.Schedule.initialise_halts, schedule_correct]
  exact OpenEvolve.body_halts_input

theorem halts_iff : Halts machine ↔ ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) :=
  (Compilation.Image.cast_halts generated_states generated.toMachine).trans generated_halts

theorem equivalent : Halts machine ↔ Halts OpenEvolve.machine :=
  halts_iff.trans OpenEvolve.halts_iff.symm

theorem saved_states : OpenEvolve.generated.states - generated.states = 1555179 := by
  rw [OpenEvolve.generated_states, generated_states]

theorem strict_reduction : generated.states < OpenEvolve.generated.states := by
  rw [generated_states, OpenEvolve.generated_states]
  decide

/-- Symbolic transport avoids reducing the million-bit input during proof elaboration. -/
theorem cast_initialises {states offset : Nat} [NeZero states]
    (bits : Array (Fin 2)) (body : BundledMachine 2)
    (count : (ReverseInit.Schedule.initialise (schedule bits) body).states = states)
    (paid : (schedule bits).size = offset) (bound : offset < states) :
    FlatInit.runFrom (Compilation.Image.castMachine count
        (ReverseInit.Schedule.initialise (schedule bits) body).toMachine)
        offset ConjectureMachines.init =
      some (⟨⟨offset, bound⟩, Tape.mk₁ bits.toList⟩ : Cfg states 2) := by
  have result := ReverseInit.Schedule.initialise_run (schedule bits) body (Tape.mk₁ [])
  rw [schedule_correct] at result
  have lifted := Compilation.Image.cast_run count
    (ReverseInit.Schedule.initialise (schedule bits) body).toMachine
    (schedule bits).size ConjectureMachines.init
  rw [Compilation.Image.cast_init, result, Option.map_some, paid] at lifted
  refine lifted.trans (congrArg some ?_)
  apply congrArg (fun state ↦ (⟨state, Tape.mk₁ bits.toList⟩ : Cfg states 2))
  apply Fin.ext
  change (schedule bits).size + 0 = offset
  omega

theorem initialises :
    FlatInit.runFrom machine 1555181 ConjectureMachines.init =
      some (⟨1555181, Tape.mk₁ Compilation.Input.bits.toList⟩ : Cfg 390491642 2) :=
  cast_initialises Compilation.Input.bits OpenEvolve.body generated_states prefix_states (by decide)

/-- Independent body-row assembly consumes the already certified accepted M7 row recipe. -/
def numericImage {states : Nat} (actions : Array Init.Instruction) (body : BundledMachine 2)
    (count : (ReverseInit.Schedule.initialise actions body).states = states) : Machine states 2 :=
  Compilation.Image.castMachine count (ReverseInit.Schedule.initialise actions body).toMachine

theorem numericImage_congr {states : Nat} (actions : Array Init.Instruction)
    (body other : BundledMachine 2) (equal : body = other)
    (first : (ReverseInit.Schedule.initialise actions body).states = states)
    (second : (ReverseInit.Schedule.initialise actions other).states = states) :
    numericImage actions body first = numericImage actions other second := by
  cases equal
  rfl

theorem rowGenerated_states :
    (ReverseInit.Schedule.initialise (schedule Compilation.Input.bits)
      OpenEvolve.rowBody).states = 390491642 := by
  have count := schedule_initialise_states Compilation.Input.bits OpenEvolve.rowBody
  rw [OpenEvolve.rowBody_states, Compilation.Input.bits_size] at count
  exact count

def rowMachine : Machine 390491642 2 :=
  numericImage (schedule Compilation.Input.bits) OpenEvolve.rowBody rowGenerated_states

theorem rowMachine_eq : rowMachine = machine :=
  numericImage_congr (schedule Compilation.Input.bits) OpenEvolve.rowBody OpenEvolve.body
    OpenEvolve.rowBody_eq rowGenerated_states generated_states

end Chess.Optimisation.OpenEvolveWide
