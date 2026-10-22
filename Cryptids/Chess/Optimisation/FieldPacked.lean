/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Chess.Optimisation.FieldPackedLayout
public import Cryptids.Compilation.FieldPacking.Graph

/-! # The complete chess machine with all unused syntax padding removed -/

@[expose] public section
namespace Chess.Optimisation.FieldPacked
open Turing ConjectureMachines ConjectureMachines.Compilation
open ConjectureMachines.Optimisation FieldCompiler

set_option backward.isDefEq.respectTransparency false
attribute [local irreducible] Compilation.Input.bits FieldAware.bits

/-- The exact same complete source rows, with no source operation changed. -/
abbrev syntaxRows := FieldAware.syntaxRows

/-- The full actual-slot bijection; both directions are certified for every node. -/
def layout : FieldPacking.Layout syntaxRows 106668 := FieldPackedLayout.layout

/-- All meaningful nodes and no uniform-block padding. -/
def getter : LazyGraph.Graph 106668 5 4042 := FieldPacking.graph syntaxRows layout

theorem getter_meaning :
    BoolGraph.machine (LazyGraph.asGraph getter) (Equiv.refl (Fin 5)) =
      targetProgram Snapshot.program := by
  rw [getter, FieldPacking.machine_eq]
  funext q
  rw [FieldAware.syntaxRows_get]
  rfl

def post : TM0.Machine Bool (Fin (CompactPost.stateCount 106668 5)) :=
  CompactPost.machine getter

theorem post_states : CompactPost.stateCount 106668 5 = 533341 := rfl

abbrev body : BundledMachine 2 :=
  ⟨CompactPost.stateCount 106668 5 + CompactPost.stateCount 106668 5,
    Compilation.Binary.compile post⟩

theorem body_states : body.states = 1066682 := rfl

/-- Actual frozen input, codec and bit order are retained verbatim. -/
abbrev sourceInput := FieldAware.sourceInput
abbrev binaryInput := FieldAware.binaryInput
def bits : Array (Fin 2) := FieldAware.bits

theorem bits_size : bits.size = 1837940 := FieldAware.bits_size

theorem bits_toList : bits.toList = binaryInput.map Compilation.Binary.encodeSymbol :=
  FieldAware.bits_toList

attribute [local irreducible] bits

theorem post_halts_input :
    (TM0.eval post binaryInput).Dom ↔ ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) := by
  refine (CompactPost.halts_input getter binaryInput).trans ?_
  refine (LazyGraph.halts_iff getter (Equiv.refl (Fin 5)) rfl binaryInput).trans ?_
  rw [getter_meaning]
  refine (FieldCompiler.halts_input Snapshot.program sourceInput).trans ?_
  change (TM1.eval (fun q ↦ source (Snapshot.program q)) sourceInput).Dom ↔ _
  rw [Snapshot.program_source]
  exact (SharedCertificate.runtime_eval_dom .main Compilation.Tape.input).trans
    Compilation.Tape.halts_iff

theorem body_halts_input :
    Init.HaltsOn body.toMachine (Tape.mk₁ bits.toList) ↔
      ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) := by
  rw [bits_toList]
  exact (Compilation.Binary.compile_halts_input post binaryInput).trans post_halts_input

abbrev generated : BundledMachine 2 := FlatInit.initialise bits body

instance generated_neZero : NeZero generated.states := generated.neZeroStates

theorem prefix_states : 2 * bits.size = 3675880 := by rw [bits_size]

theorem generated_states : generated.states = 4742562 := by
  rw [FlatInit.initialise_states, body_states, bits_size]

/-- Explicit binary machine, initially at state zero on an entirely blank tape. -/
def machine : Machine 4742562 2 :=
  Compilation.Image.castMachine generated_states generated.toMachine

theorem generated_halts : generated.Halts ↔ ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) :=
  (FlatInit.initialise_halts bits body).trans body_halts_input

theorem halts_iff : Halts machine ↔ ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) :=
  (Compilation.Image.cast_halts generated_states generated.toMachine).trans generated_halts

theorem equivalent : Halts machine ↔ Halts FieldAware.machine :=
  halts_iff.trans FieldAware.halts_iff.symm

theorem saved_states : FieldAware.generated.states - generated.states = 40323400 := by
  rw [FieldAware.generated_states, generated_states]

theorem strict_reduction : generated.states < FieldAware.generated.states := by
  rw [generated_states, FieldAware.generated_states]
  decide

/-- Every initializer transition remains paid and restores the original head position. -/
theorem initialises :
    FlatInit.runFrom machine 3675880 ConjectureMachines.init =
      some (⟨3675880, Tape.mk₁ bits.toList⟩ : Cfg 4742562 2) :=
  Compilation.Image.initialise_cast_paid_run bits body generated_states prefix_states (by decide)

def rowBody : BundledMachine 2 := ⟨body.states, binaryRows post⟩

theorem rowBody_eq : rowBody = body := by
  unfold rowBody body
  rw [binaryRows_eq]

def rowGenerated : BundledMachine 2 := paidBundle bits rowBody

theorem rowGenerated_eq : rowGenerated = generated :=
  (paidBundle_eq bits rowBody).trans (congrArg (FlatInit.initialise bits) rowBody_eq)

theorem rowGenerated_states : rowGenerated.states = 4742562 :=
  (congrArg BundledMachine.states rowGenerated_eq).trans generated_states

def rowMachine : Machine 4742562 2 :=
  Compilation.Image.castMachine rowGenerated_states rowGenerated.toMachine

theorem rowMachine_eq : rowMachine = machine :=
  FieldAware.cast_congr rowGenerated generated rowGenerated_eq rowGenerated_states generated_states

end Chess.Optimisation.FieldPacked
