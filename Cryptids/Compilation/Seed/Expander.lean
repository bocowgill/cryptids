/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.Seed.Blocks
public import Cryptids.Compilation.Seed.Scan

/-! # Universal expansion of the finite three-bit seed

All runs below use the actual 216-state controller. The finite zipper prefixes describe
every tape cell, with arbitrary frames for scanner contracts and blank exteriors only
where the seed format supplies them.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.Seed

open Turing StateTransition Relation FieldBinary

set_option maxRecDepth 4096

/-- Only trailing blanks are quotiented away; an arbitrary frame is never discarded. -/
theorem mk_append_zeros (bits : List Bit) (count : Nat) :
    ListBlank.mk (bits ++ List.replicate count 0) = ListBlank.mk bits :=
  Quotient.sound' (Or.inr ⟨count, rfl⟩)

@[simp] theorem mk_zeros (count : Nat) :
    ListBlank.mk (List.replicate count (0 : Bit)) = ListBlank.mk [] := by
  simpa only [List.nil_append] using mk_append_zeros [] count

theorem seekA_rows (letter : Letter) :
    Scan.Rows machine (fun run ↦ encode (.seekA letter run))
      (encode (.prepend letter 0)) .left := by
  intro run bit
  fin_cases run <;> fin_cases bit <;>
    simp [transition_encode, controlRow, scanNext, nextFixed, Scan.target, Scan.advance]

theorem seekB_rows :
    Scan.Rows machine (fun run ↦ encode (.seekB run)) (encode (.backB 0)) .right := by
  intro run bit
  fin_cases run <;> fin_cases bit <;>
    simp [transition_encode, controlRow, scanNext, nextFixed, Scan.target, Scan.advance]

theorem finishSeekA_rows :
    Scan.Rows machine (fun run ↦ encode (.finishSeekA run)) (encode (.eraseA 0)) .left := by
  intro run bit
  fin_cases run <;> fin_cases bit <;>
    simp [transition_encode, controlRow, scanNext, nextFixed, Scan.target, Scan.advance]

theorem scan_cell (letter : Letter) : Scan.scanWord (cell letter) 0 = some 0 := by
  fin_cases letter <;> simp [cell, word, letterBit, Scan.scanWord, Scan.advance]

theorem scan_output (letters : List Letter) : Scan.scanWord (output letters) 0 = some 0 :=
  Scan.scanWord_flatMap cell letters (fun letter _ ↦ scan_cell letter)

/-- The borrowed following guard gives each reversed cell a zero counter at its boundary. -/
theorem scan_shifted_cell (letter : Letter) :
    Scan.scanWord (List.replicate 9 0 ++ (word letter).reverse ++ [0]) 0 = some 0 := by
  fin_cases letter <;> simp [word, letterBit, Scan.scanWord, Scan.advance]

theorem reverse_output_cons_guard (letter : Letter) (letters : List Letter) :
    (output (letter :: letters)).reverse ++ [0] =
      ((output letters).reverse ++ [0]) ++
        (List.replicate 9 0 ++ (word letter).reverse ++ [0]) := by
  simp [output_cons, cell, List.reverse_append, List.replicate_succ, List.append_assoc]

/-- This induction carries the guard explicitly, including the empty output. -/
theorem scan_reverse_output_guard (letters : List Letter) :
    Scan.scanWord ((output letters).reverse ++ [0]) 0 = some 0 := by
  induction letters with
  | nil => simp [Scan.scanWord, Scan.advance]
  | cons letter letters ih =>
    rw [reverse_output_cons_guard, Scan.scanWord_append, ih, Option.bind_some]
    exact scan_shifted_cell letter

theorem scan_right_gap (letters : List Letter) (gap : Nat) :
    Scan.scanWord (output letters ++ List.replicate gap 0) 0 = some 0 := by
  rw [Scan.scanWord_append, scan_output, Option.bind_some, Scan.scanWord_zeros]

theorem scan_left_gap_guard (letters : List Letter) (gap : Nat) :
    Scan.scanWord ((List.replicate gap 0 ++ (output letters).reverse) ++ [0]) 0 = some 0 := by
  rw [List.append_assoc, Scan.scanWord_append, Scan.scanWord_zeros, Option.bind_some]
  exact scan_reverse_output_guard letters

/-- A left scan stops on the marker's left guard and preserves both arbitrary frames. -/
theorem scan_left_marker (scanner : Fin 4 → Fin 216) (exit : Fin 216)
    (rows : Scan.Rows machine scanner exit .left) (bits : List Bit)
    (safe : Scan.scanWord (bits ++ [0]) 0 = some 0) (left right : ListBlank Bit) :
    FlatInit.runFrom machine (bits.length + 5)
      ⟨scanner 0, (Tape.mk' (ListBlank.append (bits ++ marker.reverse) left) right).move .left⟩ =
      some ⟨exit, Tape.mk' left (ListBlank.append (marker ++ bits.reverse) right)⟩ := by
  let prefix := bits ++ [0, 1, 1, 1, 1]
  have start :
      (Tape.mk' (ListBlank.append (bits ++ marker.reverse) left) right).move .left =
        Scan.mkLeft (ListBlank.append prefix (left.cons 0)) right := by
    simp [prefix, marker, ListBlank.append_assoc, ListBlank.append, Scan.mkLeft, Tape.mk',
      Tape.move]
  have read : Scan.Reads .left (Scan.mkLeft (ListBlank.append prefix (left.cons 0)) right)
      ((bits ++ [0]) ++ [1, 1, 1, 1]) := by
    simpa only [prefix, List.append_assoc, List.cons_append, List.nil_append] using
      Scan.reads_left prefix (left.cons 0) right
  have traversed := Scan.run_safe_fourOnes machine scanner exit .left rows (bits ++ [0])
    (Scan.mkLeft (ListBlank.append prefix (left.cons 0)) right) safe read
  have shifted :
      shift .left ((bits ++ [0]).length + 4)
          (Scan.mkLeft (ListBlank.append prefix (left.cons 0)) right) =
        Tape.mk' left (ListBlank.append (marker ++ bits.reverse) right) := by
    simpa [prefix, marker, List.reverse_append, List.append_assoc, ListBlank.append_assoc,
      ListBlank.append] using Scan.shift_left_prefix prefix (left.cons 0) right
  rw [shifted] at traversed
  simpa only [start, List.length_append, List.length_cons, List.length_nil, Nat.add_zero,
    Nat.add_assoc] using traversed

/-- A right scan plus the five paid return moves stops on B's left guard. -/
theorem scan_right_marker (bits : List Bit) (safe : Scan.scanWord bits 0 = some 0)
    (left right : ListBlank Bit) :
    FlatInit.runFrom machine (bits.length + 10)
      ⟨encode (.seekB 0), Tape.mk' left (ListBlank.append (bits ++ marker) right)⟩ =
      some ⟨loop, Tape.mk' (ListBlank.append bits.reverse left)
        (ListBlank.append marker right)⟩ := by
  let prefix := bits ++ [0, 1, 1, 1, 1]
  have start : Tape.mk' left (ListBlank.append (bits ++ marker) right) =
      Tape.mk' left (ListBlank.append prefix (right.cons 0)) := by
    simp [prefix, marker, ListBlank.append_assoc, ListBlank.append]
  have safeGuard : Scan.scanWord (bits ++ [0]) 0 = some 0 := by
    simp only [Scan.scanWord_append, safe, Option.bind_some, Scan.scanWord,
      Scan.advance_zero]
  have read : Scan.Reads .right (Tape.mk' left (ListBlank.append prefix (right.cons 0)))
      ((bits ++ [0]) ++ [1, 1, 1, 1]) := by
    simpa only [prefix, List.append_assoc, List.cons_append, List.nil_append] using
      Scan.reads_right prefix left (right.cons 0)
  have traversed := Scan.run_safe_fourOnes machine (fun run ↦ encode (.seekB run))
    (encode (.backB 0)) .right seekB_rows (bits ++ [0])
    (Tape.mk' left (ListBlank.append prefix (right.cons 0))) safeGuard read
  have shifted :
      shift .right ((bits ++ [0]).length + 4)
          (Tape.mk' left (ListBlank.append prefix (right.cons 0))) =
        Tape.mk' (ListBlank.append prefix.reverse left) (right.cons 0) := by
    simpa [prefix, Nat.add_assoc] using Scan.shift_right_prefix prefix left (right.cons 0)
  rw [shifted] at traversed
  have returned := run_block .backB
    (Tape.mk' (ListBlank.append prefix.reverse left) (right.cons 0))
  have backGeometry :
      Init.executeList (blockActions .backB)
          (Tape.mk' (ListBlank.append prefix.reverse left) (right.cons 0)) =
        Tape.mk' (ListBlank.append bits.reverse left) (ListBlank.append marker right) := by
    simp [actions_backB, Init.executeList, Init.execute, prefix, List.reverse_append,
      ListBlank.append_assoc, ListBlank.append, marker, List.replicate_succ]
  rw [backGeometry] at returned
  have first : FlatInit.runFrom machine (bits.length + 5)
      ⟨encode (.seekB 0), Tape.mk' left (ListBlank.append (bits ++ marker) right)⟩ =
        some ⟨encode (.backB 0),
          Tape.mk' (ListBlank.append prefix.reverse left) (right.cons 0)⟩ := by
    simpa only [start, List.length_append, List.length_cons, List.length_nil, Nat.add_zero,
      Nat.add_assoc] using traversed
  have last : FlatInit.runFrom machine 5
      ⟨encode (.backB 0), Tape.mk' (ListBlank.append prefix.reverse left) (right.cons 0)⟩ =
        some ⟨loop, Tape.mk' (ListBlank.append bits.reverse left)
          (ListBlank.append marker right)⟩ := returned
  rw [show bits.length + 10 = bits.length + 5 + 5 by omega, run_add, first,
    Option.bind_some, last]

/-- The seven paid entry moves establish the entire canonical loop tape. -/
theorem entry_geometry (letters : List Letter) :
    Init.executeList (blockActions .entry) (Tape.mk₁ (seed letters)) = loopTape [] letters := by
  simp [actions_entry, Init.executeList, Init.execute, Tape.mk₁, Tape.mk₂, seed, loopTape,
    marker, List.replicate_succ]

theorem entry_run (letters : List Letter) :
    FlatInit.runFrom machine 7 ⟨entry, Tape.mk₁ (seed letters)⟩ =
      some ⟨loop, loopTape [] letters⟩ := by
  have result := run_block .entry (Tape.mk₁ (seed letters))
  change FlatInit.runFrom machine 7 ⟨entry, Tape.mk₁ (seed letters)⟩ =
    some ⟨loop, Init.executeList (blockActions .entry) (Tape.mk₁ (seed letters))⟩ at result
  rwa [entry_geometry] at result

/-- A proof-only generalization of the loop tape with an arbitrary finite cleared gap. -/
def frameTape (out todo : List Letter) (gap : Nat) : Tape Bit :=
  Tape.mk'
    (ListBlank.mk (List.replicate gap 0 ++ (output out).reverse ++ marker.reverse))
    (ListBlank.mk (marker ++ payload todo ++ [0, 0, 0]))

theorem frameTape_canonical (out todo : List Letter) :
    frameTape out todo (1 + 3 * out.length) = loopTape out todo := rfl

/-- Skipping B and parsing a valid letter preserves both arbitrary tape frames. -/
theorem read_letter_run (letter : Letter) (left right : ListBlank Bit) :
    FlatInit.runFrom machine 9
      ⟨loop, Tape.mk' left (ListBlank.append (marker ++ word letter) right)⟩ =
      some ⟨encode (.shiftB letter 0),
        Tape.mk' (ListBlank.append (marker ++ word letter).reverse left) right⟩ := by
  have skipped := run_block .skipB
    (Tape.mk' left (ListBlank.append marker (ListBlank.append (word letter) right)))
  change FlatInit.runFrom machine 6 _ =
    some ⟨encode (.parse 0), Init.executeList (blockActions .skipB) _⟩ at skipped
  rw [actions_skipB, execute_moves_shift] at skipped
  rw [show 6 = marker.length by rfl, Scan.shift_right_prefix] at skipped
  have parsed := parse_letter_run letter (ListBlank.append marker.reverse left) right
  have first : FlatInit.runFrom machine 6
      ⟨loop, Tape.mk' left (ListBlank.append (marker ++ word letter) right)⟩ =
      some ⟨encode (.parse 0),
        Tape.mk' (ListBlank.append marker.reverse left)
          (ListBlank.append (word letter) right)⟩ := by
    simpa only [ListBlank.append_assoc] using skipped
  rw [show 9 = 6 + 3 by decide, run_add]
  rw [first, Option.bind_some]
  simpa only [ListBlank.append_assoc, List.reverse_append] using parsed

/-- The end code has the same framed nine-step read, ending at the cleanup control. -/
theorem read_stop_run (left right : ListBlank Bit) :
    FlatInit.runFrom machine 9
      ⟨loop, Tape.mk' left (ListBlank.append (marker ++ [0, 0, 0]) right)⟩ =
      some ⟨encode (.toBEnd 0),
        Tape.mk' (ListBlank.append (marker ++ [0, 0, 0]).reverse left) right⟩ := by
  have skipped := run_block .skipB
    (Tape.mk' left (ListBlank.append marker (ListBlank.append [0, 0, 0] right)))
  change FlatInit.runFrom machine 6 _ =
    some ⟨encode (.parse 0), Init.executeList (blockActions .skipB) _⟩ at skipped
  rw [actions_skipB, execute_moves_shift] at skipped
  rw [show 6 = marker.length by rfl, Scan.shift_right_prefix] at skipped
  have parsed := parse_stop_run (ListBlank.append marker.reverse left) right
  have first : FlatInit.runFrom machine 6
      ⟨loop, Tape.mk' left (ListBlank.append (marker ++ [0, 0, 0]) right)⟩ =
      some ⟨encode (.parse 0),
        Tape.mk' (ListBlank.append marker.reverse left) (ListBlank.append [0, 0, 0] right)⟩ := by
    simpa only [ListBlank.append_assoc] using skipped
  rw [show 9 = 6 + 3 by decide, run_add]
  rw [first, Option.bind_some]
  simpa only [ListBlank.append_assoc, List.reverse_append] using parsed

/-- One letter is consumed, a cell is prepended, and the cleared gap grows by three. -/
theorem loop_once_gap (out : List Letter) (letter : Letter) (todo : List Letter) (gap : Nat) :
    FlatInit.runFrom machine (26 * out.length + 2 * gap + 81)
      ⟨loop, frameTape out (letter :: todo) gap⟩ =
      some ⟨loop, frameTape (letter :: out) todo (gap + 3)⟩ := by
  let left := ListBlank.mk (List.replicate gap 0 ++ (output out).reverse ++ marker.reverse)
  let right := ListBlank.mk (payload todo ++ [0, 0, 0])
  let parsedTape := Tape.mk' (ListBlank.append (marker ++ word letter).reverse left) right
  let shiftedTape :=
    (Tape.mk' left (ListBlank.append (List.replicate 3 0 ++ marker) right)).move .left
  let atA := Tape.mk' (ListBlank.mk [])
    (ListBlank.mk (marker ++ output out ++ List.replicate (gap + 3) 0 ++
      marker ++ payload todo ++ [0, 0, 0]))
  let atOutput := Tape.mk' (ListBlank.mk marker.reverse)
    (ListBlank.mk (output (letter :: out) ++ List.replicate (gap + 3) 0 ++
      marker ++ payload todo ++ [0, 0, 0]))
  have read : FlatInit.runFrom machine 9 ⟨loop, frameTape out (letter :: todo) gap⟩ =
      some ⟨encode (.shiftB letter 0), parsedTape⟩ := by
    simpa [frameTape, left, right, parsedTape, payload_cons, ListBlank.append_mk,
      List.append_assoc] using read_letter_run letter left right
  have shiftB : FlatInit.runFrom machine 10 ⟨encode (.shiftB letter 0), parsedTape⟩ =
      some ⟨encode (.seekA letter 0), shiftedTape⟩ := shiftB_run letter left right
  have seekA : FlatInit.runFrom machine (gap + 13 * out.length + 5)
      ⟨encode (.seekA letter 0), shiftedTape⟩ = some ⟨encode (.prepend letter 0), atA⟩ := by
    have scanned := scan_left_marker (fun run ↦ encode (.seekA letter run))
      (encode (.prepend letter 0)) (seekA_rows letter)
      (List.replicate gap 0 ++ (output out).reverse) (scan_left_gap_guard out gap)
      (ListBlank.mk []) (ListBlank.append (List.replicate 3 0 ++ marker) right)
    simpa [shiftedTape, left, right, atA, ListBlank.append_mk, List.reverse_append,
      List.reverse_replicate, List.replicate_add, List.append_assoc] using scanned
  have prepend : FlatInit.runFrom machine 31 ⟨encode (.prepend letter 0), atA⟩ =
      some ⟨encode (.seekB 0), atOutput⟩ := by
    have written := prepend_run letter (ListBlank.mk [])
      (ListBlank.mk (output out ++ List.replicate (gap + 3) 0 ++
        marker ++ payload todo ++ [0, 0, 0]))
    simpa [atA, atOutput, output_cons, ListBlank.append_mk, List.append_assoc] using written
  have seekB : FlatInit.runFrom machine (13 * (out.length + 1) + (gap + 3) + 10)
      ⟨encode (.seekB 0), atOutput⟩ =
      some ⟨loop, frameTape (letter :: out) todo (gap + 3)⟩ := by
    have scanned := scan_right_marker
      (output (letter :: out) ++ List.replicate (gap + 3) 0)
      (scan_right_gap (letter :: out) (gap + 3)) (ListBlank.mk marker.reverse) right
    simpa [atOutput, frameTape, right, ListBlank.append_mk, List.reverse_append,
      List.reverse_replicate, List.append_assoc] using scanned
  rw [show 26 * out.length + 2 * gap + 81 =
      9 + (10 + ((gap + 13 * out.length + 5) +
        (31 + (13 * (out.length + 1) + (gap + 3) + 10)))) by omega,
    run_add, read, Option.bind_some, run_add, shiftB, Option.bind_some,
    run_add, seekA, Option.bind_some, run_add, prepend, Option.bind_some, seekB]

/-- The canonical loop invariant fixes the source-derived exact cost of each iteration. -/
theorem loop_once (out : List Letter) (letter : Letter) (todo : List Letter) :
    FlatInit.runFrom machine (32 * out.length + 83)
      ⟨loop, loopTape out (letter :: todo)⟩ =
      some ⟨loop, loopTape (letter :: out) todo⟩ := by
  have result := loop_once_gap out letter todo (1 + 3 * out.length)
  simpa only [frameTape_canonical, List.length_cons,
    show 26 * out.length + 2 * (1 + 3 * out.length) + 81 = 32 * out.length + 83 by omega,
    show 1 + 3 * out.length + 3 = 1 + 3 * (out.length + 1) by omega] using result

/-- Erasing A removes its six cells and leaves the output with completely blank exteriors. -/
theorem eraseA_geometry (out : List Letter) (gap : Nat) :
    Init.executeList (blockActions .eraseA)
      (Tape.mk' (ListBlank.mk [])
        (ListBlank.mk (marker ++ output out ++ List.replicate gap 0 ++
          List.replicate 9 0))) = Tape.mk₁ (output out) := by
  have tail : ListBlank.mk (output out ++ List.replicate gap 0 ++ List.replicate 9 0) =
      ListBlank.mk (output out) := by
    rw [mk_append_zeros, mk_append_zeros]
  have written := execute_write_right (List.replicate 6 (0 : Bit)) marker (by decide)
    (ListBlank.mk [])
    (ListBlank.mk (output out ++ List.replicate gap 0 ++ List.replicate 9 0))
  simp only [List.reverse_replicate, ListBlank.append_mk, List.append_nil, mk_zeros, tail]
    at written
  simpa [actions_eraseA, ListBlank.append_mk, List.append_assoc, Tape.mk₁, Tape.mk₂]
    using written

/-- The last three fixed blocks mark offset twelve and return to the same relative head. -/
theorem final_marker_geometry (tape : Tape Bit) :
    Init.executeList (blockActions .backHead)
      (Init.executeList (blockActions .setMarker)
        (Init.executeList (blockActions .toMarker) tape)) =
      shift .left 12 ((shift .right 12 tape).write 1) := by
  simp only [actions_toMarker, actions_setMarker, actions_backHead, execute_moves_shift,
    Init.executeList, Init.execute, Option.getD_some]
  rfl

theorem final_marker_run (tape : Tape Bit) :
    FlatInit.runFrom machine 24 ⟨encode (.toMarker 0), tape⟩ =
      some ⟨done, shift .left 12 ((shift .right 12 tape).write 1)⟩ := by
  let first := Init.executeList (blockActions .toMarker) tape
  let second := Init.executeList (blockActions .setMarker) first
  have h1 := run_block .toMarker tape
  change FlatInit.runFrom machine 12 ⟨encode (.toMarker 0), tape⟩ =
    some ⟨encode .setMarker, first⟩ at h1
  have h2 := run_block .setMarker first
  change FlatInit.runFrom machine 1 ⟨encode .setMarker, first⟩ =
    some ⟨encode (.backHead 0), second⟩ at h2
  have h3 := run_block .backHead second
  change FlatInit.runFrom machine 11 ⟨encode (.backHead 0), second⟩ =
    some ⟨done, Init.executeList (blockActions .backHead) second⟩ at h3
  have geometry : Init.executeList (blockActions .backHead) second =
      shift .left 12 ((shift .right 12 tape).write 1) := final_marker_geometry tape
  rw [geometry] at h3
  rw [show 24 = 12 + (1 + 11) by decide, run_add, h1, Option.bind_some,
    run_add, h2, Option.bind_some, h3]

/-- Empty unread input triggers complete marker erasure, including empty output. -/
theorem finish_gap (out : List Letter) (gap : Nat) :
    FlatInit.runFrom machine (13 * out.length + gap + 54) ⟨loop, frameTape out [] gap⟩ =
      some ⟨done, markedOutput out⟩ := by
  let left := ListBlank.mk (List.replicate gap 0 ++ (output out).reverse ++ marker.reverse)
  let right : ListBlank Bit := ListBlank.mk []
  let parsedTape := Tape.mk' (ListBlank.append (marker ++ [0, 0, 0]).reverse left) right
  let erasedTape := (Tape.mk' left (ListBlank.append (List.replicate 9 0) right)).move .left
  let atA := Tape.mk' (ListBlank.mk [])
    (ListBlank.mk (marker ++ output out ++ List.replicate gap 0 ++ List.replicate 9 0))
  have read : FlatInit.runFrom machine 9 ⟨loop, frameTape out [] gap⟩ =
      some ⟨encode (.toBEnd 0), parsedTape⟩ := by
    simpa [frameTape, left, right, parsedTape, ListBlank.append_mk] using
      read_stop_run left right
  have eraseB : FlatInit.runFrom machine 10 ⟨encode (.toBEnd 0), parsedTape⟩ =
      some ⟨encode (.finishSeekA 0), erasedTape⟩ := eraseB_run left right
  have seekA : FlatInit.runFrom machine (gap + 13 * out.length + 5)
      ⟨encode (.finishSeekA 0), erasedTape⟩ = some ⟨encode (.eraseA 0), atA⟩ := by
    have scanned := scan_left_marker (fun run ↦ encode (.finishSeekA run))
      (encode (.eraseA 0)) finishSeekA_rows
      (List.replicate gap 0 ++ (output out).reverse) (scan_left_gap_guard out gap)
      (ListBlank.mk []) (ListBlank.append (List.replicate 9 0) right)
    simpa [erasedTape, left, right, atA, ListBlank.append_mk, List.reverse_append,
      List.reverse_replicate, List.append_assoc] using scanned
  have eraseA : FlatInit.runFrom machine 6 ⟨encode (.eraseA 0), atA⟩ =
      some ⟨encode (.toMarker 0), Tape.mk₁ (output out)⟩ := by
    have erased := run_block .eraseA atA
    change FlatInit.runFrom machine 6 ⟨encode (.eraseA 0), atA⟩ =
      some ⟨encode (.toMarker 0), Init.executeList (blockActions .eraseA) atA⟩ at erased
    rw [show Init.executeList (blockActions .eraseA) atA = Tape.mk₁ (output out)
      from eraseA_geometry out gap] at erased
    exact erased
  have mark : FlatInit.runFrom machine 24 ⟨encode (.toMarker 0), Tape.mk₁ (output out)⟩ =
      some ⟨done, markedOutput out⟩ := final_marker_run (Tape.mk₁ (output out))
  rw [show 13 * out.length + gap + 54 =
      9 + (10 + ((gap + 13 * out.length + 5) + (6 + 24))) by omega,
    run_add, read, Option.bind_some, run_add, eraseB, Option.bind_some,
    run_add, seekA, Option.bind_some, run_add, eraseA, Option.bind_some, mark]

theorem finish (out : List Letter) :
    FlatInit.runFrom machine (16 * out.length + 55) ⟨loop, loopTape out []⟩ =
      some ⟨done, markedOutput out⟩ := by
  have result := finish_gap out (1 + 3 * out.length)
  simpa only [frameTape_canonical,
    show 13 * out.length + (1 + 3 * out.length) + 54 = 16 * out.length + 55 by omega]
    using result

/-- Finite termination of the actual controller, strengthened by any already emitted output. -/
theorem run_loop (out todo : List Letter) :
    FlatInit.runFrom machine
      (16 * todo.length * todo.length + (32 * out.length + 83) * todo.length +
        16 * out.length + 55) ⟨loop, loopTape out todo⟩ =
      some ⟨done, markedOutput (todo.reverse ++ out)⟩ := by
  induction todo generalizing out with
  | nil => simpa using finish out
  | cons letter todo ih =>
    have time :
        16 * (letter :: todo).length * (letter :: todo).length +
            (32 * out.length + 83) * (letter :: todo).length + 16 * out.length + 55 =
          (32 * out.length + 83) +
            (16 * todo.length * todo.length + (32 * (letter :: out).length + 83) *
              todo.length + 16 * (letter :: out).length + 55) := by
      simp only [List.length_cons]
      ring
    rw [time, run_add, loop_once, Option.bind_some, ih]
    simp only [List.reverse_cons, List.append_assoc, List.singleton_append]

/-- Every finite seed reaches the exact marked reversed output in the stated finite time. -/
theorem run_seed (letters : List Letter) :
    FlatInit.runFrom machine (16 * letters.length * letters.length + 83 * letters.length + 62)
      ⟨entry, Tape.mk₁ (seed letters)⟩ = some ⟨done, markedOutput letters.reverse⟩ := by
  rw [show 16 * letters.length * letters.length + 83 * letters.length + 62 =
      7 + (16 * letters.length * letters.length + (32 * ([] : List Letter).length + 83) *
        letters.length + 16 * ([] : List Letter).length + 55) by simp; omega,
    run_add, entry_run, Option.bind_some, run_loop]
  simp

/-- Reachability for the linker, with no machine-behaviour hypothesis left to discharge. -/
theorem seed_reaches (letters : List Letter) :
    Reaches (step machine) ⟨entry, Tape.mk₁ (seed letters)⟩
      ⟨done, markedOutput letters.reverse⟩ :=
  FlatInit.runFrom_reaches _ _ _ _ (run_seed letters)

end ConjectureMachines.Compilation.Seed
