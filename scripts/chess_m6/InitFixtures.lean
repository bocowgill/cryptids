import Cryptids.Compilation.FlatInit

namespace ConjectureMachines.Compilation.FlatInit.Fixtures

open Turing StateTransition

def haltBody : BundledMachine 2 := ⟨1, ⟨fun _ _ ↦ none⟩⟩
def oneStepBody : BundledMachine 2 :=
  ⟨2, ⟨fun state _ ↦ if state.val = 0 then some (1, .right, 1) else none⟩⟩
def bits : Array (Fin 2) := #[1, 0, 1]

example : (initialise bits haltBody).states = 7 := rfl
example : (initialise #[] haltBody).states = 1 := rfl

example : (machine bits haltBody).transition 0 0 = some (1, .right, 1) := by decide +kernel
example : (machine bits haltBody).transition 1 1 = some (0, .right, 2) := by decide +kernel
example : (machine bits haltBody).transition 2 0 = some (1, .right, 3) := by decide +kernel
example : (machine bits haltBody).transition 3 0 = some (0, .left, 4) := by decide +kernel
example : (machine bits haltBody).transition 3 1 = some (1, .left, 4) := by decide +kernel
example : (machine bits haltBody).transition 5 1 = some (1, .left, 6) := by decide +kernel
example : (machine bits haltBody).transition 6 1 = none := by decide +kernel

-- Body destination 1 is offset to state 7, without changing the original body command.
example : (machine bits oneStepBody).transition 6 0 = some (1, .right, 7) := by decide +kernel
example : (machine bits oneStepBody).transition 7 1 = none := by decide +kernel

-- Observe current state and tape cells -1, 0, 1, 2, 3 relative to the restored head.
def snapshot {q : Nat} (cfg : Cfg q 2) : List Nat :=
  cfg.state.val :: ([-1, 0, 1, 2, 3] : List Int).map (fun i ↦ (cfg.tape.nth i).val)

example : (runFrom (machine bits haltBody) 6 ConjectureMachines.init).map snapshot =
    some [6, 0, 1, 0, 1, 0] := by decide +kernel
example : runFrom (machine bits haltBody) 7 ConjectureMachines.init = none := by
  decide +kernel
example : (runFrom (machine bits oneStepBody) 7 ConjectureMachines.init).map snapshot =
    some [7, 1, 0, 1, 0, 0] := by decide +kernel
example : (runFrom (machine #[] haltBody) 0 ConjectureMachines.init).map snapshot =
    some [0, 0, 0, 0, 0, 0] := by decide +kernel
example : runFrom (machine #[] haltBody) 1 ConjectureMachines.init = none := by
  decide +kernel

-- The universal exact-tape and both-direction halting facts cover every raw array/body.
example (input : Array (Fin 2)) (body : BundledMachine 2) :
    runFrom (initialise input body).toMachine (2 * input.size) ConjectureMachines.init =
      some (embed input body ⟨0, Tape.mk₁ input.toList⟩) := initialise_run input body
example (input : Array (Fin 2)) (body : BundledMachine 2) :
    (initialise input body).Halts ↔ Init.HaltsOn body.toMachine (Tape.mk₁ input.toList) :=
  initialise_halts input body

end ConjectureMachines.Compilation.FlatInit.Fixtures

#eval IO.println "Flat initializer fixtures passed"
