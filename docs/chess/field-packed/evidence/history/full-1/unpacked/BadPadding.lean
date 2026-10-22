import Cryptids.Semantics.ChessFieldPacked
open Chess.Optimisation Chess.Optimisation.FieldPacked ConjectureMachines.Compilation
example : (FieldPackedLayout.layout.code ⟨0, (FieldAware.syntaxRows.get 0).root⟩).val = 106668 := by decide +kernel
