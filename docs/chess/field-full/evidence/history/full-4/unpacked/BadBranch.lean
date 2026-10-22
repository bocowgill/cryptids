import Cryptids.Semantics.ChessFieldAware
open Chess.Optimisation.FieldAware ConjectureMachines.Compilation
example : SharedModel.branchFn RuntimeModel.s003 none = false := by decide +kernel
