import Cryptids.Semantics.ChessFieldPacked
open Chess.Optimisation Chess.Optimisation.FieldPacked ConjectureMachines.Compilation
example : (FlatInit.initialise #[0, 1] (⟨1, {transition := fun _ _ ↦ none}⟩ : ConjectureMachines.BundledMachine 2)).states = 1 := by decide +kernel
