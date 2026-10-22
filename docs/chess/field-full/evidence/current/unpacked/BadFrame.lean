import Cryptids.Semantics.ChessFieldAware
open Chess.Optimisation.FieldAware ConjectureMachines.Compilation
example : FieldBinary.updateCell (false, fun _ ↦ 0) 0 4 = (false, fun _ ↦ 4) := by decide +kernel
