import Cryptids.Semantics.ChessFieldReverse
open Chess.Optimisation Chess.Optimisation.FieldReverse ConjectureMachines.Compilation
example : generated.states = body.states := by rw [generated_states, body_states]; decide +kernel
