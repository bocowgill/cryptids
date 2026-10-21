/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.FieldBinary.Codec
public import Cryptids.Compilation.TemplateGraph
public import Cryptids.Optimisation.CompactPost

/-! # Field routine inventory and scoped allocation comparison

Candidate counts are complete standalone machines, including terminal controls. The
legacy figures are marginal contributions of the accepted generic allocator, not counts
for separately extracted standalone machines or a claimed full-chess improvement. Read/write
families overlap; holding other inventory parameters fixed does not give additive replacement costs.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.FieldBinary
open Turing

def readField (field : Fin 4) : Routine Word := readAt (fieldOffset field)
def writeField (field : Fin 4) (value : Fin 5) : Routine Unit :=
  writeAt (fieldOffset field) (encodeWord value)

theorem read_counts : (List.finRange 4).map (fun i ↦ (readField i).size) =
    [39, 66, 93, 120] := by decide +kernel

theorem write_counts (value : Fin 5) :
    (List.finRange 4).map (fun i ↦ (writeField i value).size) = [5, 11, 17, 23] := by
  simp only [writeField, writeAt_size]
  decide +kernel

theorem move_counts (dir : Dir) : (moveCell dir).size = 14 := moveCell_size dir

/-- Full binary body allocation has ten controls per graph node and one final halt. -/
def legacyBodyAllocation (nodes : Nat) : Nat := 10 * nodes + 1

/-- The formula is exactly the paid CompactPost plus terminal-return allocation. -/
theorem legacyBodyAllocation_eq (nodes : Nat) :
    legacyBodyAllocation nodes =
      ConjectureMachines.Optimisation.CompactPost.stateCount nodes 5 +
        (ConjectureMachines.Optimisation.CompactPost.stateCount nodes 5 - 1) := by
  simp [legacyBodyAllocation, ConjectureMachines.Optimisation.CompactPost.stateCount]
  omega

def legacyReadContribution : Nat :=
  legacyBodyAllocation (TemplateGraph.nodeCount 4042 270 1250 1734 1188 11) -
    legacyBodyAllocation (TemplateGraph.nodeCount 4042 270 1250 1733 1188 11)

def legacyWriteContribution : Nat :=
  legacyBodyAllocation (TemplateGraph.nodeCount 4042 270 1250 1734 1188 11) -
    legacyBodyAllocation (TemplateGraph.nodeCount 4042 269 1250 1734 1188 11)

def legacyMoveContribution : Nat :=
  legacyBodyAllocation (TemplateGraph.nodeCount 4042 270 1250 1734 1188 11) -
    legacyBodyAllocation (TemplateGraph.nodeCount 4042 270 1250 1734 1187 11)

theorem legacy_counts :
    legacyReadContribution = 211410 ∧ legacyWriteContribution = 82000 ∧
      legacyMoveContribution = 110 := by decide +kernel

/-- Standalone routines preserve exactly the certified semantic tape, at a decoded exit. -/
theorem read_machine_contract (field : Fin 4) (tape : Tape Bit) :
    FlatInit.runFrom (readField field).machine ((readField field).steps tape) ⟨0, tape⟩ =
      some ⟨(readField field).exitState tape, tape⟩ ∧
    (readField field).result ((readField field).exitState tape) =
      some (wordAt (fieldOffset field) tape) := by
  constructor
  · simpa only [readField, readAt_execute] using (readField field).run_execute tape
  · simpa only [readField, readAt_execute] using (readField field).result_exit tape

theorem write_machine_contract (field : Fin 4) (value : Fin 5) (tape : Tape Bit) :
    FlatInit.runFrom (writeField field value).machine ((writeField field value).steps tape)
      ⟨0, tape⟩ = some ⟨(writeField field value).exitState tape,
        written (fieldOffset field) (encodeWord value) tape⟩ := by
  simpa only [writeField, writeAt_execute] using (writeField field value).run_execute tape

theorem move_machine_contract (dir : Dir) (tape : Tape Bit) :
    FlatInit.runFrom (moveCell dir).machine ((moveCell dir).steps tape) ⟨0, tape⟩ =
      some ⟨(moveCell dir).exitState tape, shift dir 13 tape⟩ := by
  simpa only [moveCell_execute] using (moveCell dir).run_execute tape

end ConjectureMachines.Compilation.FieldBinary
