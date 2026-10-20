import Cryptids.Chess.Compilation.Image

open Turing ConjectureMachines ConjectureMachines.Compilation
open Chess.Compilation

set_option backward.isDefEq.respectTransparency false

example : (TemplateGraph.build Image.data).raw.count = 38893646 := Image.node_count
example : GraphPost.stateCount (TemplateGraph.build Image.data).raw.count 5 = 194468236 :=
  Image.post_count
example : Image.body.states = 388936472 := Image.body_states
example : 2 * Input.bits.size = 3110360 := Image.prefix_states
example : Image.generated.states = 392046832 := Image.generated_states
example : Halts Image.machine ↔ ¬(Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss) :=
  Image.halts_iff
example : FlatInit.runFrom Image.machine 3110360 ConjectureMachines.init =
    some (Image.bodyEntry (Tape.mk₁ Input.bits.toList)) := Image.initialises
example (tape : Tape (Fin 2)) : (Image.bodyEntry tape).state.val = 3110360 := rfl
example (tape : Tape (Fin 2)) : (Image.bodyEntry tape).tape = tape := rfl
example (q : Fin Image.generated.states) (a : Fin 2) :
    Image.machine.transition (Fin.cast Image.generated_states q) a =
      (Image.generated.toMachine.transition q a).map (fun (w, d, r) ↦
        (w, d, Fin.cast Image.generated_states r)) := Image.rows q a

-- These index-only observations cannot accidentally evaluate the chess source program.
def tag : TemplateGraph.Class 1734 1188 → Nat
  | .plain => 0 | .read _ => 1 | .move _ => 2

example : tag (Image.classify (Templates.readPC 0)) = 1 := by decide
example : tag (Image.classify (Templates.readPC 1733)) = 1 := by decide
example : tag (Image.classify (Templates.movePC 0)) = 2 := by decide
example : tag (Image.classify (Templates.movePC 1187)) = 2 := by decide
example : Templates.writeIndex (Templates.writePC 0) = some 0 := by decide
example : Templates.writeIndex (Templates.writePC 269) = some 269 := by decide

-- A concrete tiny paid backend independently exercises exact write/return/head restoration.
def stop : BundledMachine 2 := ⟨1, ⟨fun _ _ ↦ none⟩⟩
def paid : BundledMachine 2 := FlatInit.initialise #[1, 0, 1] stop
example : paid.states = 7 := rfl
example : FlatInit.runFrom paid.toMachine 6 ConjectureMachines.init =
    some ⟨6, Tape.mk₁ [1, 0, 1]⟩ := FlatInit.initialise_run #[1, 0, 1] stop
example : step paid.toMachine ⟨6, Tape.mk₁ [1, 0, 1]⟩ = none := by decide
example : paid.Halts := by
  change (FlatInit.initialise #[1, 0, 1] stop).Halts
  rw [FlatInit.initialise_halts]
  apply Part.dom_iff_mem.mpr
  exact ⟨_, StateTransition.mem_eval.mpr ⟨.refl, rfl⟩⟩
