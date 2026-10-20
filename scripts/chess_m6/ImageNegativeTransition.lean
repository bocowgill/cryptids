import Cryptids.Chess.Compilation.Image
open Turing ConjectureMachines ConjectureMachines.Compilation
def stop : BundledMachine 2 := ⟨1, ⟨fun _ _ ↦ none⟩⟩
-- A corrupted initializer must not preserve zero when its paid input bit is one.
example : (FlatInit.initialise #[1] stop).toMachine.transition 0 0 = some (0, .right, 1) := by
  decide
