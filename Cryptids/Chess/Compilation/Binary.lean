/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Chess.Compilation.Tape
public import Cryptids.Chess.Compilation.Input
public import Cryptids.Compilation.NumberTM2
public import Cryptids.Compilation.StrongAssembly
public import Cryptids.Compilation.FlatInit

/-! # Blank binary compilation of the complete chess program

This construction includes every bit of the explicit shared source and initial game.
The separate table certificate identifies the published literal transition matrix.
-/

@[expose] public section
namespace Chess.Compilation.Binary
open Turing PartrecToTM2 K' ConjectureMachines ConjectureMachines.Compilation

set_option maxSynthPendingDepth 128
set_option backward.isDefEq.respectTransparency false

local instance : Inhabited PartrecToTM2.Λ' := ⟨Runtime.label .start⟩

/-- Materialized numeric control before lowering the four stacks. -/
def frontend := TM2Number.cachedNumberProgram CodeBackend.stores Runtime.machine Runtime.labels

/-- All numeric frontend rows, including duplicate candidate rows. -/
def labels : List (Fin (Runtime.labels.length + 1)) := List.finRange _

theorem frontend_supports : TM2.Supports frontend.get labels.toFinset := by
  simpa only [frontend, labels, List.toFinset_finRange] using
    TM2Number.cachedNumberProgram_supports CodeBackend.stores CodeBackend.mem_stores
      Runtime.machine Runtime.labels

/-- Hashes affect construction order only; full equality still decides every collision. -/
@[instance_reducible] def sourceHash : Hashable (TM1Normalize.Label (TM2to1.tr frontend.get)) :=
  StrongAssembly.sharedLabelHasher [main, rev, aux, stack]
    (fun _ ↦ [Γ'.consₗ, Γ'.cons, Γ'.bit0, Γ'.bit1]) CodeBackend.stores

/-- The complete finite binary Post program and all paid input data. -/
def post : NumberedPost :=
  StrongAssembly.twiceStack frontend.get CodeBackend.blockCode labels sourceHash
    CodeBackend.symbols CodeBackend.stores main Tape.input

/-- Concrete write-and-move body, one main and one return state per Post state. -/
def body : BundledMachine 2 := CodeBackend.body post

/-- The full finite binary input is written by the machine itself from the blank tape. -/
def bits : Array (Fin 2) := (post.input.map Compilation.Binary.encodeSymbol).toArray

theorem post_input_eq : post.input = Input.binary :=
  StrongAssembly.twiceStack_input frontend.get CodeBackend.blockCode labels sourceHash
    CodeBackend.symbols CodeBackend.stores main Tape.input

theorem bits_eq : bits = Input.bits := by
  rw [bits, post_input_eq]
  rfl

theorem bits_size : bits.size = 1555180 := by
  rw [bits_eq]
  exact Input.bits_size

theorem initializer_states : 2 * bits.size = 3110360 := by rw [bits_size]

/-- This is a closed binary machine, with the complete initializer included in its states. -/
def generated : BundledMachine 2 := FlatInit.initialise bits body

theorem post_halts : post.Halts ↔ ¬ (WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) :=
  (StrongAssembly.twiceStack_halts frontend.get CodeBackend.blockCode labels sourceHash
    frontend_supports CodeBackend.symbols CodeBackend.symbols_cover
    CodeBackend.stores CodeBackend.mem_stores main Tape.input).trans
    ((TM2Number.cachedNumberProgram_dom_of_support CodeBackend.stores CodeBackend.mem_stores
      Runtime.machine Runtime.labels RuntimeSupport.supports main Tape.input).trans Tape.halts_iff)

/-- Both halting directions for the closed generated binary machine. -/
theorem generated_halts : generated.Halts ↔ ¬ (WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) := by
  refine (FlatInit.initialise_halts bits body).trans ?_
  change (StateTransition.eval (ConjectureMachines.step (Compilation.Binary.compile post.machine))
    ⟨0, Turing.Tape.mk₁ bits.toList⟩).Dom ↔ _
  rw [bits, List.toList_toArray]
  exact (Compilation.Binary.compile_halts_input post.machine post.input).trans post_halts

/-- Every binary input bit contributes exactly two paid states. -/
theorem generated_states :
    generated.states = 2 * (post.extraStates + 1) + 2 * bits.size := by
  change (post.extraStates + 1) + (post.extraStates + 1) + 2 * bits.size = _
  omega

theorem generated_states_paid :
    generated.states = 2 * (post.extraStates + 1) + 3110360 := by
  rw [generated_states, initializer_states]

/-- The exact initializer path restores the head and enters the unchanged binary body. -/
theorem generated_initializes :
    FlatInit.runFrom generated.toMachine (2 * bits.size) ConjectureMachines.init =
      some (FlatInit.embed bits body ⟨0, Turing.Tape.mk₁ bits.toList⟩) :=
  FlatInit.initialise_run bits body

end Chess.Compilation.Binary
