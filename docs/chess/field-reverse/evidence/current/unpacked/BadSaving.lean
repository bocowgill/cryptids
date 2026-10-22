import Cryptids.Semantics.ChessFieldReverse
open Chess.Optimisation Chess.Optimisation.FieldReverse ConjectureMachines.Compilation
example : FieldPacked.generated.states - generated.states = 1837940 := by rw [FieldPacked.generated_states, generated_states]; decide +kernel
