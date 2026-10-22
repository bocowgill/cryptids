import Cryptids.Semantics.ChessFieldSelective
open Chess.Optimisation Chess.Optimisation.FieldSelective
example : generated.states = 2904623 := by rw [generated_states]; decide +kernel
