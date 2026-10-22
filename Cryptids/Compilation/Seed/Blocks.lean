/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.Seed.Controller

/-! # Framed finite-block contracts for the actual seed controller

The finite path checker certifies rows of `Seed.machine`; it does not execute a second
machine. Every resulting contract quantifies over an arbitrary complete tape.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.Seed

open Turing StateTransition Relation

set_option maxRecDepth 4096

theorem step_control (control : Control) (tape : Tape Bit) :
    step machine ⟨encode control, tape⟩ = (controlRow control tape.head).map
      (fun (write, dir, next) ↦ (⟨encode next, (tape.write write).move dir⟩ : Cfg 216 2)) := by
  simp only [step, transition_encode, Option.map_map, Function.comp_def]

theorem step_of_row (control next : Control) (action : Init.Instruction)
    (rows : ∀ bit, controlRow control bit = actionRow action next bit) (tape : Tape Bit) :
    step machine ⟨encode control, tape⟩ = some ⟨encode next, Init.execute action tape⟩ := by
  rw [step_control, rows]
  rfl

/-- The start of a finite row path, including the empty suffix at its exit. -/
def pathStart (path : List (Control × Init.Instruction)) (exit : Control) : Control :=
  match path with
  | [] => exit
  | row :: _ => row.1

/-- A decidable, complete check of both actual binary rows at every finite path position. -/
def validPath : List (Control × Init.Instruction) → Control → Bool
  | [], _ => true
  | (control, action) :: rest, exit =>
    decide (∀ bit, controlRow control bit = actionRow action (pathStart rest exit) bit) &&
      validPath rest exit

/-- A checked path executes all its paid instructions on every complete tape. -/
theorem run_path (path : List (Control × Init.Instruction)) (exit : Control)
    (valid : validPath path exit = true) (tape : Tape Bit) :
    FlatInit.runFrom machine path.length ⟨encode (pathStart path exit), tape⟩ =
      some ⟨encode exit, Init.executeList (path.map Prod.snd) tape⟩ := by
  induction path generalizing tape with
  | nil => rfl
  | cons row rest ih =>
    rcases row with ⟨control, action⟩
    have checked :
        (∀ bit, controlRow control bit = actionRow action (pathStart rest exit) bit) ∧
        validPath rest exit = true := by
      simpa only [validPath, Bool.and_eq_true, decide_eq_true_eq] using valid
    simp only [List.length_cons, FlatInit.runFrom, pathStart,
      step_of_row control (pathStart rest exit) action checked.1, Option.bind_some,
      List.map_cons, Init.executeList]
    exact ih checked.2 (Init.execute action tape)

/-- Fixed block families, excluding the unbounded scanners and branching parser. -/
inductive FixedBlock where
  | entry | skipB
  | shiftB (letter : Letter)
  | prepend (letter : Letter)
  | writeA | skipA | backB | toBEnd | eraseB | eraseA | toMarker | setMarker | backHead
  deriving DecidableEq, Fintype

def fixedList {n : Nat} (family : Fin n → Control) (action : Fin n → Init.Instruction) :
    List (Control × Init.Instruction) := List.ofFn (fun i ↦ (family i, action i))

def blockPath : FixedBlock → List (Control × Init.Instruction)
  | .entry => fixedList .entry (fun _ ↦ (none, .right))
  | .skipB => fixedList .skipB (fun _ ↦ (none, .right))
  | .shiftB s => fixedList (.shiftB s) shiftAction
  | .prepend s => fixedList (.prepend s) (prependAction s)
  | .writeA => fixedList .writeA markerAction
  | .skipA => fixedList .skipA (fun _ ↦ (none, .right))
  | .backB => fixedList .backB (fun _ ↦ (none, .left))
  | .toBEnd => fixedList .toBEnd (fun _ ↦ (none, .left))
  | .eraseB => fixedList .eraseB (fun _ ↦ (some 0, .left))
  | .eraseA => fixedList .eraseA (fun _ ↦ (some 0, .right))
  | .toMarker => fixedList .toMarker (fun _ ↦ (none, .right))
  | .setMarker => [(.setMarker, (some 1, .left))]
  | .backHead => fixedList .backHead (fun _ ↦ (none, .left))

def blockExit : FixedBlock → Control
  | .entry => .skipB 0
  | .skipB => .parse 0
  | .shiftB s => .seekA s 0
  | .prepend _ => .writeA 0
  | .writeA => .skipA 0
  | .skipA => .seekB 0
  | .backB => .skipB 0
  | .toBEnd => .eraseB 0
  | .eraseB => .finishSeekA 0
  | .eraseA => .toMarker 0
  | .toMarker => .setMarker
  | .setMarker => .backHead 0
  | .backHead => .done

def blockEntry (block : FixedBlock) : Control := pathStart (blockPath block) (blockExit block)
def blockSteps (block : FixedBlock) : Nat := (blockPath block).length
def blockActions (block : FixedBlock) : List Init.Instruction := (blockPath block).map Prod.snd

theorem blockPath_valid (block : FixedBlock) :
    validPath (blockPath block) (blockExit block) = true := by
  cases block with
  | entry => decide
  | skipB => decide
  | shiftB s => fin_cases s <;> decide
  | prepend s => fin_cases s <;> decide
  | writeA => decide
  | skipA => decide
  | backB => decide
  | toBEnd => decide
  | eraseB => decide
  | eraseA => decide
  | toMarker => decide
  | setMarker => decide
  | backHead => decide

/-- Every fixed block has its exact finite run on arbitrary, possibly nonblank, tape frames. -/
theorem run_block (block : FixedBlock) (tape : Tape Bit) :
    FlatInit.runFrom machine (blockSteps block) ⟨encode (blockEntry block), tape⟩ =
      some ⟨encode (blockExit block), Init.executeList (blockActions block) tape⟩ :=
  run_path (blockPath block) (blockExit block) (blockPath_valid block) tape

theorem reaches_block (block : FixedBlock) (tape : Tape Bit) :
    Reaches (step machine) ⟨encode (blockEntry block), tape⟩
      ⟨encode (blockExit block), Init.executeList (blockActions block) tape⟩ :=
  FlatInit.runFrom_reaches _ _ _ _ (run_block block tape)

/-- Concatenating ordinary finite executions adds their runtime lengths. -/
theorem run_add (first second : Nat) (cfg : Cfg 216 2) :
    FlatInit.runFrom machine (first + second) cfg =
      (FlatInit.runFrom machine first cfg).bind (FlatInit.runFrom machine second) := by
  induction first generalizing cfg with
  | zero => simp only [Nat.zero_add, FlatInit.runFrom, Option.bind_some]
  | succ first ih =>
    simp only [Nat.succ_add, FlatInit.runFrom, ih, Option.bind_assoc]

@[simp] theorem actions_entry : blockActions .entry = List.replicate 7 (none, .right) := rfl
@[simp] theorem actions_skipB : blockActions .skipB = List.replicate 6 (none, .right) := rfl

@[simp] theorem actions_shiftB (s : Letter) :
    blockActions (.shiftB s) = (none, .left) ::
      ([0, 0, 0] ++ marker).reverse.map (fun bit ↦ (some bit, Dir.left)) := rfl

@[simp] theorem actions_prepend (s : Letter) :
    blockActions (.prepend s) = List.replicate 5 (none, .right) ++
      (cell s).reverse.map (fun bit ↦ (some bit, Dir.left)) := by
  fin_cases s <;> rfl

@[simp] theorem actions_writeA :
    blockActions .writeA = marker.reverse.map (fun bit ↦ (some bit, Dir.left)) := rfl

@[simp] theorem actions_skipA : blockActions .skipA = List.replicate 7 (none, .right) := rfl
@[simp] theorem actions_backB : blockActions .backB = List.replicate 5 (none, .left) := rfl
@[simp] theorem actions_toBEnd : blockActions .toBEnd = List.replicate 4 (none, .left) := rfl
@[simp] theorem actions_eraseB : blockActions .eraseB = List.replicate 6 (some 0, .left) := rfl
@[simp] theorem actions_eraseA : blockActions .eraseA = List.replicate 6 (some 0, .right) := rfl
@[simp] theorem actions_toMarker : blockActions .toMarker = List.replicate 12 (none, .right) := rfl
@[simp] theorem actions_setMarker : blockActions .setMarker = [(some 1, .left)] := rfl
@[simp] theorem actions_backHead : blockActions .backHead = List.replicate 11 (none, .left) := rfl

/-- Three-bit numeric decoding, including the distinct paid error state. -/
def parsedControl (low middle high : Bit) : Control :=
  match low.val + 2 * middle.val + 4 * high.val with
  | 0 => .toBEnd 0
  | 1 => .shiftB 0 0
  | 2 => .shiftB 1 0
  | 3 => .shiftB 2 0
  | 4 => .shiftB 3 0
  | _ => .error

/-- The parser preserves all three bits and both arbitrary tape frames. -/
theorem parse_run (low middle high : Bit) (left right : ListBlank Bit) :
    FlatInit.runFrom machine 3
      ⟨encode (.parse 0), Tape.mk' left (ListBlank.append [low, middle, high] right)⟩ =
      some ⟨encode (parsedControl low middle high),
        Tape.mk' (ListBlank.append [high, middle, low] left) right⟩ := by
  fin_cases low <;> fin_cases middle <;> fin_cases high <;>
    simp [FlatInit.runFrom, step_control, controlRow, parseNext, parsedControl, ListBlank.append]

theorem parse_letter_run (s : Letter) (left right : ListBlank Bit) :
    FlatInit.runFrom machine 3
      ⟨encode (.parse 0), Tape.mk' left (ListBlank.append (word s) right)⟩ =
      some ⟨encode (.shiftB s 0), Tape.mk' (ListBlank.append (word s).reverse left) right⟩ := by
  fin_cases s
  · simpa [parsedControl] using parse_run 1 0 0 left right
  · simpa [parsedControl] using parse_run 0 1 0 left right
  · simpa [parsedControl] using parse_run 1 1 0 left right
  · simpa [parsedControl] using parse_run 0 0 1 left right

theorem parse_stop_run (left right : ListBlank Bit) :
    FlatInit.runFrom machine 3
      ⟨encode (.parse 0), Tape.mk' left (ListBlank.append [0, 0, 0] right)⟩ =
      some ⟨encode (.toBEnd 0), Tape.mk' (ListBlank.append [0, 0, 0] left) right⟩ :=
  parse_run 0 0 0 left right

/-- Repeated preserving moves are the corresponding tape shift, with no frame restriction. -/
theorem execute_moves (count : Nat) (dir : Dir) (tape : Tape Bit) :
    Init.executeList (List.replicate count (none, dir)) tape = (Tape.move dir)^[count] tape := by
  induction count generalizing tape with
  | zero => rfl
  | succ count ih =>
    simp only [List.replicate_succ, Init.executeList, Init.execute, Option.getD_none,
      Tape.write_self, ih, Function.iterate_succ_apply]

theorem execute_moves_shift (count : Nat) (dir : Dir) (tape : Tape Bit) :
    Init.executeList (List.replicate count (none, dir)) tape =
      FieldBinary.shift dir count tape := by
  induction count generalizing tape with
  | zero => rfl
  | succ count ih =>
    simpa only [List.replicate_succ, Init.executeList, Init.execute, Option.getD_none,
      Tape.write_self, FieldBinary.shift] using ih (tape.move dir)

/-- A rightward constant-write block overwrites exactly its finite window. -/
theorem execute_write_right (bits old : List Bit) (sameLength : bits.length = old.length)
    (left right : ListBlank Bit) :
    Init.executeList (bits.map (fun bit ↦ (some bit, Dir.right)))
      (Tape.mk' left (ListBlank.append old right)) =
      Tape.mk' (ListBlank.append bits.reverse left) right := by
  induction bits generalizing old left with
  | nil =>
    have empty : old = [] := List.length_eq_zero_iff.mp sameLength.symm
    subst old
    rfl
  | cons bit bits ih =>
    cases old with
    | nil => simp at sameLength
    | cons oldBit old =>
      have tailLength : bits.length = old.length := Nat.succ.inj sameLength
      simpa [Init.executeList, Init.execute, ListBlank.append, List.reverse_cons,
        ListBlank.append_assoc] using ih old tailLength (left.cons bit)

/-- The overlapping B rewrite preserves arbitrary exterior frames and the unread suffix. -/
theorem shiftB_run (s : Letter) (left right : ListBlank Bit) :
    FlatInit.runFrom machine 10
      ⟨encode (.shiftB s 0),
        Tape.mk' (ListBlank.append (marker ++ word s).reverse left) right⟩ =
      some ⟨encode (.seekA s 0),
        (Tape.mk' left (ListBlank.append (List.replicate 3 0 ++ marker) right)).move .left⟩ := by
  have result := run_block (.shiftB s)
    (Tape.mk' (ListBlank.append (marker ++ word s).reverse left) right)
  change FlatInit.runFrom machine 10 ⟨encode (.shiftB s 0), _⟩ =
    some ⟨encode (.seekA s 0), Init.executeList (blockActions (.shiftB s)) _⟩ at result
  fin_cases s <;>
    simpa [actions_shiftB, marker, Init.executeList, Init.execute, ListBlank.append,
      List.replicate] using result

/-- Prepending a cell and installing A uses the shared suffix and exactly 31 paid steps. -/
theorem prepend_run (s : Letter) (left right : ListBlank Bit) :
    FlatInit.runFrom machine 31
      ⟨encode (.prepend s 0),
        Tape.mk' (ListBlank.append (List.replicate 13 0) left) (ListBlank.append marker right)⟩ =
      some ⟨encode (.seekB 0),
        Tape.mk' (ListBlank.append marker.reverse left) (ListBlank.append (cell s) right)⟩ := by
  let start := Tape.mk' (ListBlank.append (List.replicate 13 0) left)
    (ListBlank.append marker right)
  let first := Init.executeList (blockActions (.prepend s)) start
  let second := Init.executeList (blockActions .writeA) first
  let final := Init.executeList (blockActions .skipA) second
  have firstRun := run_block (.prepend s) start
  change FlatInit.runFrom machine 18 ⟨encode (.prepend s 0), start⟩ =
    some ⟨encode (.writeA 0), first⟩ at firstRun
  have secondRun := run_block .writeA first
  change FlatInit.runFrom machine 6 ⟨encode (.writeA 0), first⟩ =
    some ⟨encode (.skipA 0), second⟩ at secondRun
  have finalRun := run_block .skipA second
  change FlatInit.runFrom machine 7 ⟨encode (.skipA 0), second⟩ =
    some ⟨encode (.seekB 0), final⟩ at finalRun
  have combined : FlatInit.runFrom machine 31 ⟨encode (.prepend s 0), start⟩ =
      some ⟨encode (.seekB 0), final⟩ := by
    rw [show 31 = 18 + (6 + 7) by decide, run_add, firstRun, Option.bind_some,
      run_add, secondRun, Option.bind_some, finalRun]
  fin_cases s <;>
    simpa [final, second, first, start, cell, marker, Init.executeList, Init.execute,
      ListBlank.append, List.replicate] using combined

/-- Finishing erases B and its consumed zero terminator, retaining arbitrary exterior frames. -/
theorem eraseB_run (left right : ListBlank Bit) :
    FlatInit.runFrom machine 10
      ⟨encode (.toBEnd 0),
        Tape.mk' (ListBlank.append (marker ++ [0, 0, 0]).reverse left) right⟩ =
      some ⟨encode (.finishSeekA 0),
        (Tape.mk' left (ListBlank.append (List.replicate 9 0) right)).move .left⟩ := by
  let start := Tape.mk' (ListBlank.append (marker ++ [0, 0, 0]).reverse left) right
  let middle := Init.executeList (blockActions .toBEnd) start
  let final := Init.executeList (blockActions .eraseB) middle
  have firstRun := run_block .toBEnd start
  change FlatInit.runFrom machine 4 ⟨encode (.toBEnd 0), start⟩ =
    some ⟨encode (.eraseB 0), middle⟩ at firstRun
  have finalRun := run_block .eraseB middle
  change FlatInit.runFrom machine 6 ⟨encode (.eraseB 0), middle⟩ =
    some ⟨encode (.finishSeekA 0), final⟩ at finalRun
  have combined : FlatInit.runFrom machine 10 ⟨encode (.toBEnd 0), start⟩ =
      some ⟨encode (.finishSeekA 0), final⟩ := by
    rw [show 10 = 4 + 6 by decide, run_add, firstRun, Option.bind_some, finalRun]
  simpa [final, middle, start, marker, Init.executeList, Init.execute,
    ListBlank.append, List.replicate] using combined

end ConjectureMachines.Compilation.Seed
