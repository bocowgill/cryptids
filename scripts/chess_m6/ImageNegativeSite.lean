import Cryptids.Chess.Compilation.Image
open Chess.Compilation
-- Mutating the first literal write site's saved identity is rejected.
example : Templates.writeIndex (Templates.writePC 0) = some 1 := by decide
