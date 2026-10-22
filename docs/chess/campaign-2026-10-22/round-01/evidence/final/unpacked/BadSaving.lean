import Cryptids.Semantics.ChessFieldSelective
open Chess.Optimisation Chess.Optimisation.FieldSelective
example : FieldReverse.generated.states - generated.states = 492881 := by rw [FieldReverse.generated_states, generated_states]; decide +kernel
