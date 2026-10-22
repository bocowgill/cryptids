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

/-- The preserving seek from B's left guard to its first unread raw bit. -/
def consumeSeekActions : List Init.Instruction := List.replicate 6 (none, .right)

/-- The branching read row erases the consumed bit and moves left before shifting B. -/
def consumeReadAction : Init.Instruction := (some 0, .left)

/-- Complete the overlapping B rewrite, then restore the head at its new left guard. -/
def consumeShiftActions : List Init.Instruction :=
  ([0, 0, 1, 1, 1, 1] : List Seed.Bit).reverse.map (fun bit ↦ (some bit, Dir.left)) ++
    List.replicate 2 (none, .right)

/-- All physical actions of one read; its bit-dependent control destination is separate. -/
def consumeActions : List Init.Instruction :=
  consumeSeekActions ++ [consumeReadAction] ++ consumeShiftActions

/-- The unread bit is at the head before either the read row or overlapping writes occur. -/
theorem consume_seek (bit : Seed.Bit) (left right : ListBlank Seed.Bit) :
    Init.executeList consumeSeekActions
      (Tape.mk' left (ListBlank.append Seed.marker (right.cons bit))) =
      Tape.mk' (ListBlank.append Seed.marker.reverse left) (right.cons bit) := by
  simp [consumeSeekActions, Seed.marker, Init.executeList, Init.execute, ListBlank.append,
    List.replicate]

/-- The actual branching row observes the original raw bit. -/
theorem consume_seek_head (bit : Seed.Bit) (left right : ListBlank Seed.Bit) :
    (Init.executeList consumeSeekActions
      (Tape.mk' left (ListBlank.append Seed.marker (right.cons bit)))).head = bit := by
  simp [consume_seek]

/-- Consuming one raw bit advances B by one and preserves both arbitrary exterior frames. -/
theorem consume_bit (bit : Seed.Bit) (left right : ListBlank Seed.Bit) :
    Init.executeList consumeActions
      (Tape.mk' left (ListBlank.append Seed.marker (right.cons bit))) =
      Tape.mk' (left.cons 0) (ListBlank.append Seed.marker right) := by
  simp [consumeActions, consumeSeekActions, consumeReadAction, consumeShiftActions,
    Seed.marker, Init.executeList, Init.execute, ListBlank.append, List.replicate]

/-- Write the reversed compact code, move A left by three, and skip the new marker. -/
def prependActions (letter : Seed.Letter) : List Init.Instruction :=
  List.replicate 5 (none, .right) ++
    (Seed.word letter).reverse.map (fun bit ↦ (some bit, Dir.left)) ++
    Seed.marker.reverse.map (fun bit ↦ (some bit, Dir.left)) ++
    List.replicate 7 (none, .right)

/-- Three explicit left blanks suffice to prepend one compact word with exact exterior frames. -/
theorem prepend_word (letter : Seed.Letter) (left right : ListBlank Seed.Bit) :
    Init.executeList (prependActions letter)
      (Tape.mk' (ListBlank.append (List.replicate 3 0) left)
        (ListBlank.append Seed.marker right)) =
      Tape.mk' (ListBlank.append Seed.marker.reverse left)
        (ListBlank.append (Seed.word letter) right) := by
  fin_cases letter <;>
    simp [prependActions, Seed.marker, Init.executeList, Init.execute, ListBlank.append,
      List.replicate]

end ConjectureMachines.Compilation.TableSeed.Geometry
