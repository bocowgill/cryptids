/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Chess.Optimisation.FieldSelectiveLayout
public import Cryptids.Chess.Optimisation.FieldReverse

/-! # The complete chess machine with only required binary return controls

Every accepted Post main control remains. The structural return allocation retains
the shared halt, every source-label root/store pair, and every literal write-child/store
pair. The frozen input and paid reverse initializer are unchanged. Exact row decoding
preserves both halting directions; no execution or reachability assumption is used.
-/

@[expose] public section
namespace Chess.Optimisation.FieldSelective
open Turing ConjectureMachines ConjectureMachines.Compilation
open ConjectureMachines.Optimisation

set_option backward.isDefEq.respectTransparency false
attribute [local irreducible] Compilation.Input.bits FieldAware.bits FieldPacked.bits

/-- The exact frozen field-packed input, including its original codec and bit order. -/
def bits : Array (Fin 2) := FieldPacked.bits

theorem bits_size : bits.size = 1837940 := FieldPacked.bits_size

/-- All main controls and every structurally allocated return control are paid. -/
abbrev body : BundledMachine 2 :=
  ⟨CompactPost.stateCount 106668 5 + 40461,
    SelectiveBinary.compile FieldPacked.post
      FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn⟩

theorem body_allocation : body.states = 533341 + 40461 := rfl

theorem body_states : body.states = 573802 := rfl

theorem return_states : Fintype.card (Fin 40461) = 40461 := Fintype.card_fin _

/-- The exact compiler certificate applies to the unchanged complete input tape. -/
theorem body_halts_input :
    Init.HaltsOn body.toMachine (Tape.mk₁ bits.toList) ↔
      ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) := by
  exact (SelectiveBinary.haltsOn FieldPacked.post FieldSelectiveLayout.returnAt
    FieldSelectiveLayout.findReturn FieldSelectiveLayout.coverage _).trans
      FieldPacked.body_halts_input

attribute [local irreducible] bits

/-- One leftward write per frozen bit and one final rightward move. -/
def actions : Array Init.Instruction := OpenEvolveWide.schedule bits

abbrev generated : BundledMachine 2 := ReverseInit.Schedule.initialise actions body

instance generated_neZero : NeZero generated.states := generated.neZeroStates

theorem prefix_states : actions.size = 1837941 := by
  rw [actions, OpenEvolveWide.schedule_size, bits_size]

theorem generated_states : generated.states = 2411743 := by
  have count := OpenEvolveWide.schedule_initialise_states bits body
  rw [body_states, bits_size] at count
  exact count

/-- Explicit two-symbol machine, starting at zero on an entirely blank tape. -/
def machine : Machine 2411743 2 :=
  Compilation.Image.castMachine generated_states generated.toMachine

theorem generated_halts : generated.Halts ↔ ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) := by
  change (ReverseInit.Schedule.initialise (OpenEvolveWide.schedule bits) body).Halts ↔ _
  rw [ReverseInit.Schedule.initialise_halts, OpenEvolveWide.schedule_correct]
  exact body_halts_input

theorem halts_iff : Halts machine ↔ ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) :=
  (Compilation.Image.cast_halts generated_states generated.toMachine).trans generated_halts

theorem equivalent : Halts machine ↔ Halts FieldReverse.machine :=
  halts_iff.trans FieldReverse.halts_iff.symm

theorem saved_states : FieldReverse.generated.states - generated.states = 492880 := by
  rw [FieldReverse.generated_states, generated_states]

theorem strict_reduction : generated.states < FieldReverse.generated.states := by
  rw [generated_states, FieldReverse.generated_states]
  decide

/-- The paid prefix installs the complete relative input tape with a blank exterior. -/
theorem initialises :
    FlatInit.runFrom machine 1837941 ConjectureMachines.init =
      some (⟨1837941, Tape.mk₁ bits.toList⟩ : Cfg 2411743 2) :=
  OpenEvolveWide.cast_initialises bits body generated_states prefix_states (by decide)

/-- Independent rows select and reindex the accepted complete numeric binary table. -/
def rowBody : BundledMachine 2 :=
  ⟨body.states, SelectiveBinary.table FieldSelectiveLayout.returnAt
    FieldSelectiveLayout.findReturn FieldPacked.rowBody.toMachine⟩

theorem rowBody_eq : rowBody = body := by
  unfold rowBody FieldPacked.rowBody body
  rw [FieldCompiler.binaryRows_eq, SelectiveBinary.table_compile]

theorem rowGenerated_states :
    (ReverseInit.Schedule.initialise actions rowBody).states = 2411743 := by
  rw [rowBody_eq]
  exact generated_states

/-- Every paid prefix and body control is included in the independent numeric image. -/
def rowMachine : Machine 2411743 2 :=
  OpenEvolveWide.numericImage actions rowBody rowGenerated_states

theorem rowMachine_eq : rowMachine = machine :=
  OpenEvolveWide.numericImage_congr actions rowBody body
    rowBody_eq rowGenerated_states generated_states

end Chess.Optimisation.FieldSelective
