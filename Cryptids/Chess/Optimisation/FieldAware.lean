/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.FieldCompiler.Semantics
public import Cryptids.Compilation.FieldCompiler.Bounds
public import Cryptids.Compilation.FieldCompiler.Graph
public import Cryptids.Compilation.FieldCompiler.Snapshot
public import Cryptids.Compilation.FieldCompiler.Numeric
public import Cryptids.Chess.Optimisation.OpenEvolveWide

/-! # Complete field-aware chess machine with every allocated state paid -/

@[expose] public section
namespace Chess.Optimisation.FieldAware
open Turing PartrecToTM2 ConjectureMachines ConjectureMachines.Compilation
open ConjectureMachines.Optimisation FieldCompiler

set_option backward.isDefEq.respectTransparency false
attribute [local irreducible] Compilation.Input.bits

/-- One complete finite syntax tree for each of the4042frozen normalized source labels. -/
def syntaxRows : Vector (Syntax 4042) 4042 := Vector.ofFn fun q ↦ lower (Snapshot.program q)

theorem syntaxRows_get (q : Fin 4042) : syntaxRows.get q = lower (Snapshot.program q) := by
  simp [syntaxRows, Vector.get, Fin.cast]

theorem fits (q : Fin 4042) : (syntaxRows.get q).size ≤ 1024 := by
  rw [syntaxRows_get]
  exact lower_size _

/-- The getter includes every unused slot; there is no uncharged label or continuation. -/
def getter : LazyGraph.Graph (4042 * 1024) 5 4042 := graph syntaxRows 1024 fits

theorem getter_meaning :
    BoolGraph.machine (LazyGraph.asGraph getter) (Equiv.refl (Fin 5)) =
      targetProgram Snapshot.program := by
  rw [getter, machine_eq]
  funext q
  rw [syntaxRows_get]
  rfl

def post : TM0.Machine Bool (Fin (CompactPost.stateCount (4042 * 1024) 5)) :=
  CompactPost.machine getter

abbrev body : BundledMachine 2 :=
  ⟨CompactPost.stateCount (4042 * 1024) 5 + CompactPost.stateCount (4042 * 1024) 5,
    Compilation.Binary.compile post⟩

theorem body_states : body.states = 41390082 := rfl

def sourceInput : List SharedModel.Symbol := TM2to1.trInit .main Compilation.Input.stack

def binaryInput : List Bool := Codec.input sourceInput

def bits : Array (Fin 2) := (binaryInput.map Compilation.Binary.encodeSymbol).toArray

theorem sourceInput_length : sourceInput.length = 141380 := by
  have length : (TM2to1.trInit (Γ := fun _ : K' ↦ Γ') .main Compilation.Input.stack).length =
      max 1 Compilation.Input.stack.length := by
    simp only [TM2to1.trInit, List.length_cons, List.length_tail, List.length_map,
      List.length_reverse]
    omega
  rw [Compilation.Input.stack_length] at length
  exact length

theorem binaryInput_length : binaryInput.length = 1837940 := by
  rw [binaryInput, Codec.input_length, sourceInput_length]

theorem bits_size : bits.size = 1837940 := by
  simp only [bits, List.size_toArray, List.length_map, binaryInput_length]

theorem bits_toList : bits.toList = binaryInput.map Compilation.Binary.encodeSymbol := by
  simp only [bits, List.toList_toArray]

attribute [local irreducible] bits

theorem post_halts_input :
    (TM0.eval post binaryInput).Dom ↔ ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) := by
  refine (CompactPost.halts_input getter binaryInput).trans ?_
  refine (LazyGraph.halts_iff getter (Equiv.refl (Fin 5)) rfl binaryInput).trans ?_
  rw [getter_meaning]
  refine (halts_input Snapshot.program sourceInput).trans ?_
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

theorem generated_states : generated.states = 45065962 := by
  rw [FlatInit.initialise_states, body_states, bits_size]

/-- Explicit finite two-symbol machine; the initial configuration has entirely blank tape. -/
def machine : Machine 45065962 2 :=
  Compilation.Image.castMachine generated_states generated.toMachine

theorem generated_halts : generated.Halts ↔ ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) :=
  (FlatInit.initialise_halts bits body).trans body_halts_input

/-- The unchanged original chess proposition, with no assumed value or termination premise. -/
theorem halts_iff : Halts machine ↔ ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) :=
  (Compilation.Image.cast_halts generated_states generated.toMachine).trans generated_halts

theorem equivalent : Halts machine ↔ Halts OpenEvolveWide.machine :=
  halts_iff.trans OpenEvolveWide.halts_iff.symm

theorem saved_states : OpenEvolveWide.generated.states - generated.states = 345425680 := by
  rw [OpenEvolveWide.generated_states, generated_states]

theorem strict_reduction : generated.states < OpenEvolveWide.generated.states := by
  rw [generated_states, OpenEvolveWide.generated_states]
  decide

/-- The entire new source/data input is constructed at a paid numeric prefix. -/
theorem initialises :
    FlatInit.runFrom machine 3675880 ConjectureMachines.init =
      some (⟨3675880, Tape.mk₁ bits.toList⟩ : Cfg 45065962 2) :=
  Compilation.Image.initialise_cast_paid_run bits body generated_states prefix_states (by decide)

/-- Independent arithmetic body rows, covering every main and return control. -/
def rowBody : BundledMachine 2 := ⟨body.states, binaryRows post⟩

theorem rowBody_eq : rowBody = body := by
  unfold rowBody body
  rw [binaryRows_eq]

/-- Independent three-range initializer around the independently assembled body. -/
def rowGenerated : BundledMachine 2 :=
  ⟨rowBody.states + 2 * bits.size, paidRows bits rowBody⟩

theorem rowGenerated_eq : rowGenerated = generated := by
  unfold rowGenerated
  rw [paidRows_eq, rowBody_eq]
  rfl

theorem rowGenerated_states : rowGenerated.states = 45065962 :=
  (congrArg BundledMachine.states rowGenerated_eq).trans generated_states

def rowMachine : Machine 45065962 2 :=
  Compilation.Image.castMachine rowGenerated_states rowGenerated.toMachine

theorem cast_congr {states : Nat} (a b : BundledMachine 2) (same : a = b)
    (first : a.states = states) (second : b.states = states) :
    Compilation.Image.castMachine first a.toMachine =
      Compilation.Image.castMachine second b.toMachine := by
  cases same
  rfl

/-- Universal row identity; finite testing is supplementary to this kernel theorem. -/
theorem rowMachine_eq : rowMachine = machine :=
  cast_congr rowGenerated generated rowGenerated_eq rowGenerated_states generated_states

end Chess.Optimisation.FieldAware
