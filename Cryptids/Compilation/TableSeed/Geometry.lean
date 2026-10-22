/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.Seed.Blocks

/-! # Exact tape geometry of the fixed29 decoder's local operations

These equalities use the physical action lists of the retained explicit controller.
They quantify over arbitrary complete exterior frames and do not depend on the new
controller's control type or rows. Connecting these actions to those rows is separate.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.TableSeed.Geometry

open Turing

set_option maxRecDepth 4096

/-- The final header operation: five right moves, thirteen left writes, one right move. -/
def headerActions : List Init.Instruction :=
  List.replicate 5 (none, .right) ++
    (Seed.marker ++ [0] ++ Seed.marker).reverse.map (fun bit ↦ (some bit, Dir.left)) ++
    [(none, .right)]

/-- Seven explicit blank cells supply exactly the extra space for the old seed header. -/
theorem install_header (left right : ListBlank Seed.Bit) :
    Init.executeList headerActions
      (Tape.mk' (ListBlank.append (List.replicate 7 0) left)
        (ListBlank.append Seed.marker right)) =
      Tape.mk' left (ListBlank.append (Seed.marker ++ [0] ++ Seed.marker) right) := by
  simp [headerActions, Seed.marker, Init.executeList, Init.execute, ListBlank.append,
    List.replicate]

end ConjectureMachines.Compilation.TableSeed.Geometry
