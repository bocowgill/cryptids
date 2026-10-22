import Cryptids.Semantics.ChessFieldSelective
open Chess.Optimisation Chess.Optimisation.FieldSelective
example : generated.states = body.states := by rw [generated_states, body_states]; decide +kernel
