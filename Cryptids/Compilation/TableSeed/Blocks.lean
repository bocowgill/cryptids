/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.TableSeed.Controller
public import Cryptids.Compilation.TableSeed.Geometry
public import Cryptids.Compilation.TableSeed.Scan
public import Cryptids.Compilation.Seed.Expander
public import Cryptids.Compilation.SeedLink

/-! # Actual paid paths of the structured seed decoder

Finite paths below use the actual `TableSeed.machine` rows. The source parameters
index already-paid controls; they do not add runtime calls, registers or transitions.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.TableSeed.Blocks

open Turing StateTransition Relation
open Seed (Bit Letter)

set_option maxRecDepth 4096

/-- Canonical boundary tape: compact output and cleared gap lie strictly between A and B. -/
def frameTape (out : List Letter) (raw : List Bit) (gap : Nat) : Tape Bit :=
  Tape.mk'
    (ListBlank.mk (List.replicate gap 0 ++ (Seed.payload out).reverse ++ Seed.marker.reverse))
    (ListBlank.mk (Seed.marker ++ raw))

def actionRow (action : Init.Instruction) (next : Control) (bit : Bit) :
    Option (Bit × Dir × Control) :=
  some (action.1.getD bit, action.2, next)

theorem step_control (control : Control) (tape : Tape Bit) :
    step machine ⟨encode control, tape⟩ = (controlRow control tape.head).map
      (fun (write, dir, next) ↦ (⟨encode next, (tape.write write).move dir⟩ : Cfg 21682 2)) := by
  simp only [step, transition_encode, Option.map_map, Function.comp_def]

theorem step_of_row (control next : Control) (action : Init.Instruction)
    (rows : ∀ bit, controlRow control bit = actionRow action next bit) (tape : Tape Bit) :
    step machine ⟨encode control, tape⟩ = some ⟨encode next, Init.execute action tape⟩ := by
  rw [step_control, rows]
  rfl

def pathStart (path : List (Control × Init.Instruction)) (exit : Control) : Control :=
  match path with
  | [] => exit
  | row :: _ => row.1

/-- Both actual symbol rows are checked at every paid finite-path position. -/
def ValidPath : List (Control × Init.Instruction) → Control → Prop
  | [], _ => True
  | (control, action) :: rest, exit =>
    (∀ bit, controlRow control bit = actionRow action (pathStart rest exit) bit) ∧
      ValidPath rest exit

theorem run_path (path : List (Control × Init.Instruction)) (exit : Control)
    (valid : ValidPath path exit) (tape : Tape Bit) :
    FlatInit.runFrom machine path.length ⟨encode (pathStart path exit), tape⟩ =
      some ⟨encode exit, Init.executeList (path.map Prod.snd) tape⟩ := by
  induction path generalizing tape with
  | nil => rfl
  | cons row rest ih =>
    rcases row with ⟨control, action⟩
    have checked :
        (∀ bit, controlRow control bit = actionRow action (pathStart rest exit) bit) ∧
        ValidPath rest exit := valid
    simp only [List.length_cons, FlatInit.runFrom, pathStart,
      step_of_row control (pathStart rest exit) action checked.1, Option.bind_some,
      List.map_cons, Init.executeList]
    exact ih checked.2 (Init.execute action tape)

theorem run_add (first second : Nat) (cfg : Cfg 21682 2) :
    FlatInit.runFrom machine (first + second) cfg =
      (FlatInit.runFrom machine first cfg).bind (FlatInit.runFrom machine second) :=
  SeedLink.runFrom_add machine first second cfg

def consumePath (destination : ConsumeDest) : List (Control × Init.Instruction) :=
  [(.consume destination 0, (some 1, .left)),
   (.consume destination 1, (some 1, .left)),
   (.consume destination 2, (some 1, .left)),
   (.consume destination 3, (some 1, .left)),
   (.consume destination 4, (some 0, .left)),
   (.consume destination 5, (some 0, .left)),
   (.consume destination 6, (none, .right)),
   (.consume destination 7, (none, .right))]

theorem consumePath_valid (destination : ConsumeDest) :
    ValidPath (consumePath destination) (entryState (consumeEntry destination)) := by
  simp [consumePath, ValidPath, pathStart, controlRow, consumeRow, consumeState, actionRow]

/-- All eight paid continuation rows perform exactly the verified overlapping B rewrite. -/
theorem consume_run (destination : ConsumeDest) (tape : Tape Bit) :
    FlatInit.runFrom machine 8 ⟨encode (consumeState destination 0), tape⟩ =
      some ⟨encode (entryState (consumeEntry destination)),
        Init.executeList Geometry.consumeShiftActions tape⟩ :=
  run_path (consumePath destination) (entryState (consumeEntry destination))
    (consumePath_valid destination) tape

def readSeekPath (context : ReadCtx) : List (Control × Init.Instruction) :=
  [(readState context 0, (none, .right)),
   (readState context 1, (none, .right)),
   (readState context 2, (none, .right)),
   (readState context 3, (none, .right)),
   (readState context 4, (none, .right)),
   (readState context 5, (none, .right))]

theorem readSeekPath_valid (context : ReadCtx)
    (rows : ∀ position bit, controlRow (readState context position) bit =
      readRow context position bit) :
    ValidPath (readSeekPath context) (readState context 6) := by
  simp [readSeekPath, ValidPath, pathStart, rows, readRow, actionRow]

theorem read_seek_run (context : ReadCtx)
    (rows : ∀ position bit, controlRow (readState context position) bit =
      readRow context position bit) (tape : Tape Bit) :
    FlatInit.runFrom machine 6 ⟨encode (readState context 0), tape⟩ =
      some ⟨encode (readState context 6), Init.executeList Geometry.consumeSeekActions tape⟩ :=
  run_path (readSeekPath context) (readState context 6) (readSeekPath_valid context rows) tape

/-- The common physical read action observes the raw bit before selecting its paid continuation. -/
theorem read_run_of_rows (context : ReadCtx)
    (rows : ∀ position bit, controlRow (readState context position) bit =
      readRow context position bit) (bit : Bit) (left right : ListBlank Bit) :
    FlatInit.runFrom machine 15
      ⟨encode (readState context 0),
        Tape.mk' left (ListBlank.append Seed.marker (right.cons bit))⟩ =
      some ⟨encode (entryState (consumeEntry (readTarget context bit))),
        Tape.mk' (left.cons 0) (ListBlank.append Seed.marker right)⟩ := by
  let atBit := Tape.mk' (ListBlank.append Seed.marker.reverse left) (right.cons bit)
  have seek := read_seek_run context rows
    (Tape.mk' left (ListBlank.append Seed.marker (right.cons bit)))
  rw [Geometry.consume_seek] at seek
  have branch : FlatInit.runFrom machine 1 ⟨encode (readState context 6), atBit⟩ =
      some ⟨encode (consumeState (readTarget context bit) 0),
        Init.execute Geometry.consumeReadAction atBit⟩ := by
    simp [FlatInit.runFrom, step_control, rows, readRow, atBit, Geometry.consumeReadAction,
      Init.execute]
  have shifted := consume_run (readTarget context bit)
    (Init.execute Geometry.consumeReadAction atBit)
  have geometry :
      Init.executeList Geometry.consumeShiftActions
        (Init.execute Geometry.consumeReadAction atBit) =
        Tape.mk' (left.cons 0) (ListBlank.append Seed.marker right) := by
    simpa only [Geometry.consumeActions, Init.executeList_append, Geometry.consume_seek,
      Init.executeList, atBit] using Geometry.consume_bit bit left right
  rw [geometry] at shifted
  rw [show 15 = 6 + (1 + 8) by decide, run_add, seek, Option.bind_some,
    run_add, branch, Option.bind_some, shifted]

/-- Framing the local read preserves the compact output and grows the cleared gap by one. -/
theorem read_frame_of_rows (context : ReadCtx)
    (rows : ∀ position bit, controlRow (readState context position) bit =
      readRow context position bit) (out : List Letter) (bit : Bit) (raw : List Bit)
    (gap : Nat) :
    FlatInit.runFrom machine 15
      ⟨encode (entryState (.read context)), frameTape out (bit :: raw) gap⟩ =
      some ⟨encode (entryState (consumeEntry (readTarget context bit))),
        frameTape out raw (gap + 1)⟩ := by
  have result := read_run_of_rows context rows bit
    (ListBlank.mk (List.replicate gap 0 ++ (Seed.payload out).reverse ++ Seed.marker.reverse))
    (ListBlank.mk raw)
  simpa [frameTape, entryState, ListBlank.append_mk, List.replicate_succ,
    List.cons_append, Nat.add_comm] using result

def entryPath : List (Control × Init.Instruction) :=
  [(.entry 0, (none, .right)), (.entry 1, (none, .right)),
   (.entry 2, (none, .right)), (.entry 3, (none, .right)),
   (.entry 4, (none, .right)), (.entry 5, (none, .right)),
   (.entry 6, (none, .right))]

theorem entryPath_valid : ValidPath entryPath (readState (.literal 0 0) 0) := by
  simp [entryPath, ValidPath, pathStart, controlRow, actionRow]

/-- The initial seven moves are actual paid entry states. -/
theorem entry_run (raw : List Bit) :
    FlatInit.runFrom machine 7
      ⟨entry, Tape.mk₁ (Seed.marker ++ [0] ++ Seed.marker ++ raw)⟩ =
      some ⟨encode (entryState (.read (.literal 0 0))), frameTape [] raw 1⟩ := by
  have result := run_path entryPath (readState (.literal 0 0) 0) entryPath_valid
    (Tape.mk₁ (Seed.marker ++ [0] ++ Seed.marker ++ raw))
  simpa [entryPath, pathStart, entry, entryState, frameTape, Seed.marker, Seed.payload,
    Init.executeList, Init.execute, Tape.mk₁, Tape.mk₂, ListBlank.cons_mk,
    ListBlank.append, ListBlank.append_mk] using result

def emitMiddlePath (context : EmitCtx) : List (Control × Init.Instruction) :=
  [(emitState context 5, (none, .right)),
   (emitState context 6, (none, .right)),
   (emitState context 7, (none, .right)),
   (emitState context 8, (none, .right)),
   (emitState context 9, (none, .right)),
   (emitState context 10, (some ((Seed.word (emitLetter context)).reverse.getD 0 0), .left)),
   (emitState context 11, (some ((Seed.word (emitLetter context)).reverse.getD 1 0), .left)),
   (emitState context 12, (some ((Seed.word (emitLetter context)).reverse.getD 2 0), .left)),
   (emitState context 13, (some 0, .left)),
   (emitState context 14, (some 1, .left)),
   (emitState context 15, (some 1, .left)),
   (emitState context 16, (some 1, .left)),
   (emitState context 17, (some 1, .left)),
   (emitState context 18, (some 0, .left)),
   (emitState context 19, (none, .right)),
   (emitState context 20, (none, .right)),
   (emitState context 21, (none, .right)),
   (emitState context 22, (none, .right)),
   (emitState context 23, (none, .right)),
   (emitState context 24, (none, .right)),
   (emitState context 25, (none, .right))]

theorem emitMiddlePath_valid (context : EmitCtx)
    (rows : ∀ position bit, controlRow (emitState context position) bit =
      emitRow context position bit) :
    ValidPath (emitMiddlePath context) (emitState context 26) := by
  simp [emitMiddlePath, ValidPath, pathStart, rows, emitRow, actionRow, Seed.marker]

theorem emitMiddle_actions (context : EmitCtx) :
    (emitMiddlePath context).map Prod.snd = Geometry.prependActions (emitLetter context) := by
  simp only [emitMiddlePath, List.map_cons, List.map_nil]
  generalize emitLetter context = letter
  fin_cases letter <;> rfl

theorem emit_middle_run_of_rows (context : EmitCtx)
    (rows : ∀ position bit, controlRow (emitState context position) bit =
      emitRow context position bit) (left right : ListBlank Bit) :
    FlatInit.runFrom machine 21
      ⟨encode (emitState context 5),
        Tape.mk' (ListBlank.append (List.replicate 3 0) left)
          (ListBlank.append Seed.marker right)⟩ =
      some ⟨encode (emitState context 26),
        Tape.mk' (ListBlank.append Seed.marker.reverse left)
          (ListBlank.append (Seed.word (emitLetter context)) right)⟩ := by
  have result := run_path (emitMiddlePath context) (emitState context 26)
    (emitMiddlePath_valid context rows)
    (Tape.mk' (ListBlank.append (List.replicate 3 0) left)
      (ListBlank.append Seed.marker right))
  rw [emitMiddle_actions, Geometry.prepend_word] at result
  exact result

def emitBackPath (context : EmitCtx) : List (Control × Init.Instruction) :=
  [(emitState context 30, (none, .left)),
   (emitState context 31, (none, .left)),
   (emitState context 32, (none, .left)),
   (emitState context 33, (none, .left)),
   (emitState context 34, (none, .left))]

theorem emitBackPath_valid (context : EmitCtx)
    (rows : ∀ position bit, controlRow (emitState context position) bit =
      emitRow context position bit) :
    ValidPath (emitBackPath context) (entryState (emitTarget context)) := by
  simp [emitBackPath, ValidPath, pathStart, rows, emitRow, actionRow]

/-- Returning from the right scanner's B+5 endpoint costs five more paid transitions. -/
theorem emit_back_run_of_rows (context : EmitCtx)
    (rows : ∀ position bit, controlRow (emitState context position) bit =
      emitRow context position bit) (left right : ListBlank Bit) :
    FlatInit.runFrom machine 5
      ⟨encode (emitState context 30),
        Tape.mk' (ListBlank.append [1, 1, 1, 1, 0] left) (right.cons 0)⟩ =
      some ⟨encode (entryState (emitTarget context)),
        Tape.mk' left (ListBlank.append Seed.marker right)⟩ := by
  have result := run_path (emitBackPath context) (entryState (emitTarget context))
    (emitBackPath_valid context rows)
    (Tape.mk' (ListBlank.append [1, 1, 1, 1, 0] left) (right.cons 0))
  simpa [emitBackPath, pathStart, Init.executeList, Init.execute,
    ListBlank.append, Seed.marker] using result

def emitLeftScanner (context : EmitCtx) (run : Fin 4) : Fin 21682 :=
  encode (emitState context ⟨run.val + 1, by omega⟩)

def emitRightScanner (context : EmitCtx) (run : Fin 4) : Fin 21682 :=
  encode (emitState context ⟨run.val + 26, by omega⟩)

theorem emit_left_rows (context : EmitCtx)
    (rows : ∀ position bit, controlRow (emitState context position) bit =
      emitRow context position bit) :
    Seed.Scan.Rows machine (emitLeftScanner context) (encode (emitState context 5)) .left := by
  intro run bit
  fin_cases run <;> fin_cases bit <;>
    simp [emitLeftScanner, transition_encode, rows, emitRow, Seed.Scan.target,
      Seed.Scan.advance]

theorem emit_right_rows (context : EmitCtx)
    (rows : ∀ position bit, controlRow (emitState context position) bit =
      emitRow context position bit) :
    Seed.Scan.Rows machine (emitRightScanner context) (encode (emitState context 30)) .right := by
  intro run bit
  fin_cases run <;> fin_cases bit <;>
    simp [emitRightScanner, transition_encode, rows, emitRow, Seed.Scan.target,
      Seed.Scan.advance]

def finishErasePath : List (Control × Init.Instruction) :=
  [(.finish 0, (none, .right)), (.finish 1, (none, .right)),
   (.finish 2, (none, .right)), (.finish 3, (none, .right)),
   (.finish 4, (none, .right)), (.finish 5, (some 0, .left)),
   (.finish 6, (some 0, .left)), (.finish 7, (some 0, .left)),
   (.finish 8, (some 0, .left)), (.finish 9, (some 0, .left)),
   (.finish 10, (some 0, .left))]

theorem finishErasePath_valid : ValidPath finishErasePath (.finish 11) := by
  simp [finishErasePath, ValidPath, pathStart, controlRow, finishRow, actionRow]

/-- The final six-cell B erasure includes its five paid moves to B's end. -/
theorem finish_erase_run (left right : ListBlank Bit) :
    FlatInit.runFrom machine 11
      ⟨encode (.finish 0), Tape.mk' left (ListBlank.append Seed.marker right)⟩ =
      some ⟨encode (.finish 11),
        (Tape.mk' left (ListBlank.append (List.replicate 6 0) right)).move .left⟩ := by
  have result := run_path finishErasePath (.finish 11) finishErasePath_valid
    (Tape.mk' left (ListBlank.append Seed.marker right))
  simpa [finishErasePath, pathStart, Seed.marker, Init.executeList, Init.execute,
    ListBlank.append, List.replicate] using result

def finishScanner (run : Fin 4) : Fin 21682 :=
  encode (.finish ⟨run.val + 11, by omega⟩)

theorem finish_rows :
    Seed.Scan.Rows machine finishScanner (encode (.finish 15)) .left := by
  intro run bit
  fin_cases run <;> fin_cases bit <;>
    simp [finishScanner, transition_encode, controlRow, finishRow, Seed.Scan.target,
      Seed.Scan.advance]

def finishHeaderPath : List (Control × Init.Instruction) :=
  [(.finish 15, (none, .right)), (.finish 16, (none, .right)),
   (.finish 17, (none, .right)), (.finish 18, (none, .right)),
   (.finish 19, (none, .right)), (.finish 20, (some 0, .left)),
   (.finish 21, (some 1, .left)), (.finish 22, (some 1, .left)),
   (.finish 23, (some 1, .left)), (.finish 24, (some 1, .left)),
   (.finish 25, (some 0, .left)), (.finish 26, (some 0, .left)),
   (.finish 27, (some 0, .left)), (.finish 28, (some 1, .left)),
   (.finish 29, (some 1, .left)), (.finish 30, (some 1, .left)),
   (.finish 31, (some 1, .left)), (.finish 32, (some 0, .left)),
   (.finish 33, (none, .right))]

theorem finishHeaderPath_valid : ValidPath finishHeaderPath .done := by
  simp [finishHeaderPath, ValidPath, pathStart, controlRow, finishRow, actionRow, Seed.marker]

/-- Every header-writing transition belongs to a verified paid finish control. -/
theorem finish_header_run (left right : ListBlank Bit) :
    FlatInit.runFrom machine 19
      ⟨encode (.finish 15),
        Tape.mk' (ListBlank.append (List.replicate 7 0) left)
          (ListBlank.append Seed.marker right)⟩ =
      some ⟨done, Tape.mk' left
        (ListBlank.append (Seed.marker ++ [0] ++ Seed.marker) right)⟩ := by
  have result := run_path finishHeaderPath .done finishHeaderPath_valid
    (Tape.mk' (ListBlank.append (List.replicate 7 0) left)
      (ListBlank.append Seed.marker right))
  change FlatInit.runFrom machine 19 _ =
    some ⟨done, Init.executeList Geometry.headerActions _⟩ at result
  rw [Geometry.install_header] at result
  exact result

/-- Finalization produces the entire old seed, with its first bit under the head. -/
theorem finish_frame (out : List Letter) (gap : Nat) :
    FlatInit.runFrom machine (3 * out.length + gap + 35)
      ⟨encode (entryState .finish), frameTape out [] gap⟩ =
      some ⟨done, Tape.mk₁ (Seed.seed out)⟩ := by
  let left := ListBlank.mk
    (List.replicate gap 0 ++ (Seed.payload out).reverse ++ Seed.marker.reverse)
  let right : ListBlank Bit := ListBlank.mk []
  let erasedTape :=
    (Tape.mk' left (ListBlank.append (List.replicate 6 0) right)).move .left
  let atA := Tape.mk' (ListBlank.mk [])
    (ListBlank.mk (Seed.marker ++ Seed.payload out ++ List.replicate gap 0 ++
      List.replicate 6 0))
  have erase : FlatInit.runFrom machine 11
      ⟨encode (entryState .finish), frameTape out [] gap⟩ =
      some ⟨encode (.finish 11), erasedTape⟩ := by
    simpa [entryState, frameTape, left, right, erasedTape, ListBlank.append_mk] using
      finish_erase_run left right
  have seek : FlatInit.runFrom machine (gap + 3 * out.length + 5)
      ⟨encode (.finish 11), erasedTape⟩ = some ⟨encode (.finish 15), atA⟩ := by
    have scanned := Scan.payload_left_marker machine finishScanner (encode (.finish 15))
      finish_rows out gap (ListBlank.mk [])
      (ListBlank.append (List.replicate 6 0) right)
    simpa [finishScanner, erasedTape, left, right, atA, ListBlank.append_mk,
      List.append_assoc] using scanned
  have header : FlatInit.runFrom machine 19 ⟨encode (.finish 15), atA⟩ =
      some ⟨done, Tape.mk₁ (Seed.seed out)⟩ := by
    have written := finish_header_run (ListBlank.mk [])
      (ListBlank.mk (Seed.payload out ++ List.replicate gap 0 ++ List.replicate 6 0))
    have blank : ListBlank.append (List.replicate 7 (0 : Bit)) (ListBlank.mk []) =
        ListBlank.mk [] := by
      rw [ListBlank.append_mk, List.append_nil, Seed.mk_zeros]
    rw [blank] at written
    have tails : ListBlank.mk ((Seed.marker ++ [0] ++ Seed.marker) ++
        (Seed.payload out ++ List.replicate gap 0 ++ List.replicate 6 0)) =
        ListBlank.mk (Seed.seed out) := by
      rw [← List.append_assoc, ← List.append_assoc,
        Seed.mk_append_zeros, Seed.mk_append_zeros]
      exact (Seed.mk_append_zeros
        (Seed.marker ++ [0] ++ Seed.marker ++ Seed.payload out) 3).symm
    have finalTape : Tape.mk' (ListBlank.mk [])
        (ListBlank.append (Seed.marker ++ [0] ++ Seed.marker)
          (ListBlank.mk (Seed.payload out ++ List.replicate gap 0 ++ List.replicate 6 0))) =
        Tape.mk₁ (Seed.seed out) := by
      rw [ListBlank.append_mk, tails]
      rfl
    rw [finalTape] at written
    simpa only [atA, ListBlank.append_mk, List.append_assoc] using written
  rw [show 3 * out.length + gap + 35 = 11 + ((gap + 3 * out.length + 5) + 19) by omega,
    run_add, erase, Option.bind_some, run_add, seek, Option.bind_some, header]

/-- Unconditional arbitrary-frame read contract for the actual allocated controller. -/
theorem read_run (context : ReadCtx) (bit : Bit) (left right : ListBlank Bit) :
    FlatInit.runFrom machine 15
      ⟨encode (readState context 0),
        Tape.mk' left (ListBlank.append Seed.marker (right.cons bit))⟩ =
      some ⟨encode (entryState (consumeEntry (readTarget context bit))),
        Tape.mk' (left.cons 0) (ListBlank.append Seed.marker right)⟩ :=
  read_run_of_rows context (controlRow_readState context) bit left right

/-- One actual read preserves all output, consumes exactly one bit, and advances B. -/
theorem read_frame (context : ReadCtx) (out : List Letter) (bit : Bit) (raw : List Bit)
    (gap : Nat) :
    FlatInit.runFrom machine 15
      ⟨encode (entryState (.read context)), frameTape out (bit :: raw) gap⟩ =
      some ⟨encode (entryState (consumeEntry (readTarget context bit))),
        frameTape out raw (gap + 1)⟩ :=
  read_frame_of_rows context (controlRow_readState context) out bit raw gap

/-- One actual emission prepends its compact code and returns to B with the unread suffix intact. -/
theorem emit_frame (context : EmitCtx) (out : List Letter) (raw : List Bit) (gap : Nat) :
    FlatInit.runFrom machine (6 * out.length + 2 * gap + 40)
      ⟨encode (entryState (.emit context)), frameTape out raw gap⟩ =
      some ⟨encode (entryState (emitTarget context)),
        frameTape (emitLetter context :: out) raw gap⟩ := by
  let letter := emitLetter context
  let atA := Tape.mk' (ListBlank.mk [])
    (ListBlank.mk (Seed.marker ++ Seed.payload out ++ List.replicate gap 0 ++
      Seed.marker ++ raw))
  let atOutput := Tape.mk' (ListBlank.mk Seed.marker.reverse)
    (ListBlank.mk (Seed.payload (letter :: out) ++ List.replicate gap 0 ++
      Seed.marker ++ raw))
  let finalLeft := ListBlank.mk
    (List.replicate gap 0 ++ (Seed.payload (letter :: out)).reverse ++ Seed.marker.reverse)
  let atBEnd := Tape.mk' (ListBlank.append [1, 1, 1, 1, 0] finalLeft)
    ((ListBlank.mk raw).cons 0)
  have depart : FlatInit.runFrom machine 1
      ⟨encode (entryState (.emit context)), frameTape out raw gap⟩ =
      some ⟨encode (emitState context 1), (frameTape out raw gap).move .left⟩ := by
    simp [FlatInit.runFrom, entryState, step_control, controlRow_emitState, emitRow]
  have seekA : FlatInit.runFrom machine (gap + 3 * out.length + 5)
      ⟨encode (emitState context 1), (frameTape out raw gap).move .left⟩ =
      some ⟨encode (emitState context 5), atA⟩ := by
    have scanned := Scan.payload_left_marker machine (emitLeftScanner context)
      (encode (emitState context 5)) (emit_left_rows context (controlRow_emitState context))
      out gap (ListBlank.mk []) (ListBlank.mk (Seed.marker ++ raw))
    simpa [emitLeftScanner, frameTape, atA, ListBlank.append_mk,
      List.append_assoc] using scanned
  have prepend : FlatInit.runFrom machine 21 ⟨encode (emitState context 5), atA⟩ =
      some ⟨encode (emitState context 26), atOutput⟩ := by
    have written := emit_middle_run_of_rows context (controlRow_emitState context)
      (ListBlank.mk [])
      (ListBlank.mk (Seed.payload out ++ List.replicate gap 0 ++ Seed.marker ++ raw))
    have blank : ListBlank.append (List.replicate 3 (0 : Bit)) (ListBlank.mk []) =
        ListBlank.mk [] := by
      rw [ListBlank.append_mk, List.append_nil, Seed.mk_zeros]
    rw [blank] at written
    simpa [atA, atOutput, letter, Seed.payload_cons, ListBlank.append_mk,
      List.append_assoc] using written
  have seekB : FlatInit.runFrom machine (3 * (out.length + 1) + gap + 5)
      ⟨encode (emitState context 26), atOutput⟩ =
      some ⟨encode (emitState context 30), atBEnd⟩ := by
    have scanned := Scan.payload_right_marker machine (emitRightScanner context)
      (encode (emitState context 30)) (emit_right_rows context (controlRow_emitState context))
      (letter :: out) gap (ListBlank.mk Seed.marker.reverse) (ListBlank.mk raw)
    simpa [emitRightScanner, atOutput, atBEnd, finalLeft, ListBlank.append_mk,
      List.append_assoc] using scanned
  have back : FlatInit.runFrom machine 5 ⟨encode (emitState context 30), atBEnd⟩ =
      some ⟨encode (entryState (emitTarget context)),
        frameTape (emitLetter context :: out) raw gap⟩ := by
    simpa [atBEnd, finalLeft, frameTape, letter, ListBlank.append_mk] using
      emit_back_run_of_rows context (controlRow_emitState context) finalLeft (ListBlank.mk raw)
  rw [show 6 * out.length + 2 * gap + 40 =
      1 + ((gap + 3 * out.length + 5) + (21 + ((3 * (out.length + 1) + gap + 5) + 5)))
      by omega,
    run_add, depart, Option.bind_some, run_add, seekA, Option.bind_some,
    run_add, prepend, Option.bind_some, run_add, seekB, Option.bind_some, back]

theorem entry_reaches (raw : List Bit) :
    Reaches (step machine) ⟨entry, Tape.mk₁ (Seed.marker ++ [0] ++ Seed.marker ++ raw)⟩
      ⟨encode (entryState (.read (.literal 0 0))), frameTape [] raw 1⟩ :=
  FlatInit.runFrom_reaches _ _ _ _ (entry_run raw)

theorem read_reaches (context : ReadCtx) (out : List Letter) (bit : Bit) (raw : List Bit)
    (gap : Nat) :
    Reaches (step machine)
      ⟨encode (entryState (.read context)), frameTape out (bit :: raw) gap⟩
      ⟨encode (entryState (consumeEntry (readTarget context bit))), frameTape out raw (gap + 1)⟩ :=
  FlatInit.runFrom_reaches _ _ _ _ (read_frame context out bit raw gap)

theorem emit_reaches (context : EmitCtx) (out : List Letter) (raw : List Bit) (gap : Nat) :
    Reaches (step machine) ⟨encode (entryState (.emit context)), frameTape out raw gap⟩
      ⟨encode (entryState (emitTarget context)), frameTape (emitLetter context :: out) raw gap⟩ :=
  FlatInit.runFrom_reaches _ _ _ _ (emit_frame context out raw gap)

theorem finish_reaches (out : List Letter) (gap : Nat) :
    Reaches (step machine) ⟨encode (entryState .finish), frameTape out [] gap⟩
      ⟨done, Tape.mk₁ (Seed.seed out)⟩ :=
  FlatInit.runFrom_reaches _ _ _ _ (finish_frame out gap)

end ConjectureMachines.Compilation.TableSeed.Blocks
