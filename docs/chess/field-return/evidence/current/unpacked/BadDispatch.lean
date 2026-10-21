import Cryptids.Compilation.FieldReturn.Certificate
open ConjectureMachines.Compilation.FieldReturn
example : block.transition 12 0 = some (0, Turing.Dir.left, 37) := by decide +kernel
