/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Chess.Optimisation.M7
public import Cryptids.Optimisation.TerminalBinary

/-! # Terminal-write reduction of the accepted M7 machine -/

@[expose] public section
namespace Chess.Optimisation.OpenEvolve
open Turing ConjectureMachines ConjectureMachines.Compilation
open ConjectureMachines.Optimisation

set_option backward.isDefEq.respectTransparency false
attribute [local irreducible] Compilation.Input.bits

/-- The quotient's single missing-row control, independent of the scanned bit. -/
def terminal := CompactPost.encode Compilation.Image.getter (none, 0)

theorem terminal_row (b : Bool) : M7.post terminal b = none := by
  simp only [M7.post, terminal, CompactPost.machine, CompactPost.decode_encode,
    Option.map_none]

/-- The pinned getter starts at node zero; the quotient exchanged raw halt zero with one. -/
theorem terminal_index : terminal.val = 1 := by
  change (CompactPost.permutation Compilation.Image.getter
    (CompactPost.rawEncode (none, (0 : Fin 5)))).val = 1
  change (Equiv.swap (0 : Fin _) (CompactPost.rawEncode
    (some (Compilation.Image.getter.entry 0), (0 : Fin 5))) 0).val = 1
  rw [Equiv.swap_apply_left]
  rfl

abbrev body : BundledMachine 2 :=
  ⟨CompactPost.stateCount (TemplateGraph.build Compilation.Image.data).raw.count 5 +
    (CompactPost.stateCount (TemplateGraph.build Compilation.Image.data).raw.count 5 - 1),
    TerminalBinary.compile terminal M7.post⟩

theorem body_states : body.states = 388936461 := by
  change _ + (_ - 1) = _
  rw [M7.post_count]

abbrev generated : BundledMachine 2 := FlatInit.initialise Compilation.Input.bits body

instance generated_neZero : NeZero generated.states := generated.neZeroStates

theorem generated_states : generated.states = 392046821 := by
  have count := Compilation.Input.initialise_states body
  rw [body_states] at count
  exact count

def machine : Machine 392046821 2 :=
  Compilation.Image.castMachine generated_states generated.toMachine

/-- Package an arbitrary paid initializer without normalizing any concrete input array. -/
def numericImage {states : Nat} (bits : Array (Fin 2)) (B : BundledMachine 2)
    (count : (FlatInit.initialise bits B).states = states) : Machine states 2 :=
  Compilation.Image.castMachine count (FlatInit.initialise bits B).toMachine

/-- Body equality passes through paid initialization and numeric casts, for arbitrary inputs. -/
theorem numericImage_congr {states : Nat} (bits : Array (Fin 2))
    (B C : BundledMachine 2) (equal : B = C)
    (first : (FlatInit.initialise bits B).states = states)
    (second : (FlatInit.initialise bits C).states = states) :
    numericImage bits B first = numericImage bits C second := by
  cases equal
  rfl

/-- The table-side body consumes only surviving accepted M7 binary rows. -/
def rowBody : BundledMachine 2 :=
  ⟨body.states, TerminalBinary.table terminal M7.body.toMachine⟩

theorem rowBody_eq : rowBody = body := by
  change (⟨body.states, TerminalBinary.table terminal (Binary.compile M7.post)⟩ : BundledMachine 2) =
    ⟨body.states, TerminalBinary.compile terminal M7.post⟩
  rw [TerminalBinary.table_compile]

theorem rowBody_states : rowBody.states = 388936461 :=
  (congrArg BundledMachine.states rowBody_eq).trans body_states

theorem rowGenerated_states : (FlatInit.initialise Compilation.Input.bits rowBody).states =
    392046821 := by
  have count := Compilation.Input.initialise_states rowBody
  rw [rowBody_states] at count
  exact count

/-- Independent table recipe: remove the terminal bounce from M7's body before initialization. -/
def rowMachine : Machine 392046821 2 :=
  numericImage Compilation.Input.bits rowBody rowGenerated_states

theorem rowMachine_eq : rowMachine = machine := by
  exact numericImage_congr Compilation.Input.bits rowBody body rowBody_eq
    rowGenerated_states generated_states

theorem body_halts_input :
    Init.HaltsOn body.toMachine (Tape.mk₁ Compilation.Input.bits.toList) ↔
      ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) := by
  rw [Compilation.Input.bits_toList]
  exact (TerminalBinary.halts_input terminal M7.post terminal_row Compilation.Input.binary).trans
    M7.post_halts_input

theorem generated_halts : generated.Halts ↔ ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) :=
  (FlatInit.initialise_halts Compilation.Input.bits body).trans body_halts_input

theorem halts_iff : Halts machine ↔ ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) :=
  (Compilation.Image.cast_halts generated_states generated.toMachine).trans generated_halts

theorem equivalent : Halts machine ↔ Halts M7.machine := halts_iff.trans M7.halts_iff.symm

theorem strict_reduction : generated.states < M7.generated.states := by
  rw [generated_states, M7.generated_states]
  decide

theorem initialises :
    FlatInit.runFrom machine 3110360 ConjectureMachines.init =
      some (⟨3110360, Tape.mk₁ Compilation.Input.bits.toList⟩ : Cfg 392046821 2) :=
  Compilation.Image.initialise_cast_paid_run Compilation.Input.bits body generated_states
    Compilation.Input.paid_prefix (by decide)

end Chess.Optimisation.OpenEvolve
