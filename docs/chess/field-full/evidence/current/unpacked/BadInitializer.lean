import Cryptids.Semantics.ChessFieldAware
open Chess.Optimisation.FieldAware ConjectureMachines.Compilation
example : (FlatInit.initialise #[0, 1] (⟨1, {transition := fun _ _ ↦ none}⟩ : ConjectureMachines.BundledMachine 2)).states = 1 := by decide +kernel
