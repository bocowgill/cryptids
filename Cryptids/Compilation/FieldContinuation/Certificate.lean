/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.FieldContinuation.Graph

/-! # Composed operational certificate from return through the main-pop continuation -/

@[expose] public section
namespace ConjectureMachines.Compilation.FieldContinuation
open Turing PartrecToTM2 FieldBinary

set_option backward.isDefEq.respectTransparency false

abbrev Symbol := FieldReturn.Symbol
abbrev RepTape := FieldReturn.RepresentsTape

def popRead := SharedModel.readFn RuntimeModel.s004

def popLabel : SharedModel.StackLabel := .go .main (.pop popRead) RuntimeModel.s003

def successor : SharedModel.StackLabel := .ret RuntimeModel.s003

def clearMain (symbol : Symbol) : Symbol :=
  (symbol.1, Function.update symbol.2 .main none)

def popTape (tape : Tape Symbol) : Tape Symbol :=
  if tape.head.1 then tape else (tape.move .left).write (clearMain (tape.move .left).head)

def popValue (tape : Tape Symbol) : RuntimeModel.Store :=
  if tape.head.1 then none else (tape.move .left).head.2 .main

theorem continuation_identity : FieldReturn.continuation = SharedModel.stack0002 ∧
    RuntimeModel.machine 2 = RuntimeModel.s004 := ⟨rfl, rfl⟩

theorem popRead_eq (v s : RuntimeModel.Store) : popRead v s = s := by
  have finite : ∀ (v s : Fin 5), popRead (FieldReturn.codeSymbol v)
      (FieldReturn.codeSymbol s) = FieldReturn.codeSymbol s := by decide +kernel
  simpa only [FieldReturn.symbol_roundtrip] using
    finite (FieldReturn.symbolCode v) (FieldReturn.symbolCode s)

theorem normal_dispatch (v : RuntimeModel.Store) (tape : Tape Symbol) :
    TM1.step FieldReturn.sourceMachine ⟨some FieldReturn.continuation, v, tape⟩ =
      some ⟨some popLabel, v, tape⟩ := rfl

theorem source_gap (v : RuntimeModel.Store) (tape : Tape Symbol)
    (gap : tape.head.2 .main = none) :
    TM1.step FieldReturn.sourceMachine ⟨some popLabel, v, tape⟩ =
      some ⟨some successor, popValue tape, popTape tape⟩ := by
  cases marker : tape.head.1 <;>
    simp [TM1.step, FieldReturn.sourceMachine, popLabel, TM2to1.tr,
      TM2to1.trStAct, TM1.stepAux, gap, marker, popRead_eq, popValue, popTape,
      clearMain, successor]

theorem source_present (v : RuntimeModel.Store) (tape : Tape Symbol)
    (present : tape.head.2 .main ≠ none) :
    TM1.step FieldReturn.sourceMachine ⟨some popLabel, v, tape⟩ =
      some ⟨some popLabel, v, tape.move .right⟩ := by
  cases h : tape.head.2 .main with
  | none => exact False.elim (present h)
  | some symbol =>
    simp [TM1.step, FieldReturn.sourceMachine, popLabel, TM2to1.tr, TM1.stepAux, h]

theorem local_rep (source : Tape Symbol) (binary : Tape Bit) (rep : RepTape source binary) :
    Represents (FieldReturn.symbolCell source.head) binary := by
  intro j
  simpa only [Int.mul_zero, zero_add, Tape.nth_zero] using rep 0 j

def sourceWord (source : Tape Symbol) : Word :=
  encodeWord (FieldReturn.symbolCode (source.head.2 .main))

theorem represented_main (source : Tape Symbol) (binary : Tape Bit)
    (rep : RepTape source binary) : wordAt 0 binary = sourceWord source := by
  simpa only [fieldOffset, Fin.val_zero, mul_zero, FieldReturn.symbolCell,
    FieldReturn.stackAt, sourceWord] using
    represented_field (FieldReturn.symbolCell source.head) binary 0 (local_rep source binary rep)

theorem wordValue_encode (v : Fin 5) : wordValue (encodeWord v) = v.val := by
  fin_cases v <;> rfl

theorem main_word_zero (source : Tape Symbol) :
    wordValue (sourceWord source) = 0 ↔ source.head.2 .main = none := by
  rw [sourceWord, wordValue_encode]
  cases h : source.head.2 .main with
  | none => simp [FieldReturn.symbolCode]
  | some symbol => cases symbol <;> simp [FieldReturn.symbolCode]

theorem symbolCell_clear (symbol : Symbol) :
    FieldReturn.symbolCell (clearMain symbol) =
      updateCell (FieldReturn.symbolCell symbol) 0 0 := by
  apply Prod.ext rfl
  funext i
  fin_cases i <;> rfl

/-- Clearing the main coordinate refines the actual source write over the entire tape. -/
theorem clear_rep (source : Tape Symbol) (binary : Tape Bit) (rep : RepTape source binary) :
    RepTape (source.write (clearMain source.head)) (written 0 (0, 0, 0) binary) := by
  have cellWrite := write_valid_cell (FieldReturn.symbolCell source.head) binary 0 0
    (local_rep source binary rep)
  intro i j
  by_cases zero : i = 0
  · subst i
    simpa [Represents, writeAt_execute, symbolCell_clear] using cellWrite j
  · have outside : 13 * i + (j.val : Int) < 0 ∨ 3 ≤ 13 * i + (j.val : Int) := by
      have := j.isLt
      omega
    rw [written_outside 0 (0, 0, 0) binary _ (by simpa using outside),
      Tape.write_nth, if_neg zero]
    exact rep i j

theorem move_right_rep (source : Tape Symbol) (binary : Tape Bit)
    (rep : RepTape source binary) :
    RepTape (source.move .right) (shift .right 13 binary) := by
  intro i j
  rw [shift_right_nth, Tape.move_right_nth]
  convert rep (i + 1) j using 1
  congr 1
  omega

theorem read_cost (tape : Tape Bit) : readRoutine.steps tape = 6 := by
  simp [readRoutine, readAt, read3, Routine.moves, Routine.chain, Routine.steps,
    List.replicate_succ]

theorem move_cost (dir : Dir) (tape : Tape Bit) : (moveCell dir).steps tape = 13 := by
  simp [moveCell, Routine.moves, Routine.chain, Routine.steps, List.replicate_succ]

theorem clear_cost (tape : Tape Bit) : clearRoutine.steps tape = 4 := rfl

theorem clear_exit (tape : Tape Bit) : clearRoutine.exitState tape = 4 := rfl

theorem marker_cost (tape : Tape Bit) : markerRoutine.steps tape = 24 := by
  simp [markerRoutine, Routine.moves, Routine.chain, Routine.steps, List.replicate_succ]

theorem marker_execute (tape : Tape Bit) :
    markerRoutine.execute tape = (decide (tape.nth 12 ≠ 0), tape) := by
  have head : (shift .right 12 tape).head = tape.nth 12 := by
    change (shift .right 12 tape).nth 0 = _
    convert shift_right_nth 12 tape 0 using 1
    norm_num
  have restore : shift .left 11 ((shift .right 12 tape).move .left) = tape := by
    apply tape_ext_nth
    intro i
    simp only [shift_left_nth, shift_right_nth, Tape.move_left_nth]
    congr 1
    omega
  by_cases h : tape.nth 12 = 0 <;>
    simp [markerRoutine, Routine.execute_moves, Routine.execute, head, h, restore]

theorem scan_transfer (tape : Tape Bit) :
    FlatInit.runFrom machine 8 ⟨scanIn 0, tape⟩ = some ⟨scanDest (wordAt 0 tape), tape⟩ := by
  simpa only [read_cost, readAt_execute] using
    routine_transfer readRoutine scanIn scanBack scanDest scan_rows scan_gates tape

theorem advance_transfer (tape : Tape Bit) :
    FlatInit.runFrom machine 15 ⟨advanceIn 0, tape⟩ =
      some ⟨scanIn 0, shift .right 13 tape⟩ := by
  simpa only [move_cost, moveCell_execute] using
    routine_transfer moveRight advanceIn (fun _ ↦ 301) (fun _ ↦ scanIn 0)
      advance_rows (fun _ ↦ advance_gate) tape

theorem retreat_transfer (tape : Tape Bit) :
    FlatInit.runFrom machine 15 ⟨retreatIn 0, tape⟩ =
      some ⟨previousIn 0, shift .left 13 tape⟩ := by
  simpa only [move_cost, moveCell_execute] using
    routine_transfer moveLeft retreatIn (fun _ ↦ 355) (fun _ ↦ previousIn 0)
      retreat_rows (fun _ ↦ retreat_gate) tape

theorem marker_transfer (tape : Tape Bit) :
    FlatInit.runFrom machine 26 ⟨markerIn 0, tape⟩ =
      some ⟨markerDest (decide (tape.nth 12 ≠ 0)), tape⟩ := by
  simpa only [marker_cost, marker_execute] using
    routine_transfer markerRoutine markerIn markerBack markerDest marker_rows marker_gates tape

theorem previous_transfer (tape : Tape Bit) :
    FlatInit.runFrom machine 8 ⟨previousIn 0, tape⟩ =
      some ⟨clearIn (decodeWord (wordAt 0 tape)) 0, tape⟩ := by
  simpa only [read_cost, readAt_execute, previousDest] using
    routine_transfer readRoutine previousIn previousBack previousDest
      previous_rows previous_gates tape

theorem clear_transfer (v : Fin 5) (tape : Tape Bit) :
    FlatInit.runFrom machine 4 ⟨clearIn v 0, tape⟩ =
      some ⟨clearIn v 4, written 0 (0, 0, 0) tape⟩ := by
  have run := Routine.run_lift clearRoutine.machine machine (clearIn v) (clear_rows v)
    4 ⟨0, tape⟩
  have original := Routine.run_execute clearRoutine tape
  simp only [clear_cost, clear_exit, writeAt_execute] at original
  rw [original] at run
  exact run

/-- A finite main-stack scan ending at an absent coordinate; flag is that cell's marker. -/
inductive PopPath : Tape Symbol → Nat → Tape Symbol → RuntimeModel.Store → Bool → Prop
  | done (tape) (gap : tape.head.2 .main = none) :
      PopPath tape 0 (popTape tape) (popValue tape) tape.head.1
  | more (tape) (m) (last) (value) (flag) (present : tape.head.2 .main ≠ none)
      (rest : PopPath (tape.move .right) m last value flag) :
      PopPath tape (m + 1) last value flag

theorem sourceRun_add (a b : Nat) (cfg : FieldReturn.SourceCfg) :
    FieldReturn.sourceRun (a + b) cfg =
      (FieldReturn.sourceRun a cfg).bind (FieldReturn.sourceRun b) := by
  induction a generalizing cfg with
  | zero => simp [FieldReturn.sourceRun]
  | succ a ih => simp only [Nat.succ_add, FieldReturn.sourceRun, ih, Option.bind_assoc]

theorem source_pop (source last : Tape Symbol) (m : Nat) (value : RuntimeModel.Store)
    (flag : Bool) (path : PopPath source m last value flag) (v : RuntimeModel.Store) :
    FieldReturn.sourceRun (m + 1) ⟨some popLabel, v, source⟩ =
      some ⟨some successor, value, last⟩ := by
  induction path with
  | done tape gap => simpa [FieldReturn.sourceRun] using source_gap v tape gap
  | more tape m last value flag present rest ih =>
    change (TM1.step FieldReturn.sourceMachine ⟨some popLabel, v, tape⟩).bind
      (FieldReturn.sourceRun (m + 1)) = _
    rw [source_present v tape present]
    exact ih

/-- All main-pop paths refine actual source updates, store loading and successor control. -/
theorem pop_refines (source last : Tape Symbol) (m : Nat) (value : RuntimeModel.Store)
    (flag : Bool) (path : PopPath source m last value flag) (binary : Tape Bit)
    (rep : RepTape source binary) :
    ∃ finalBits, FlatInit.runFrom machine (23 * m + if flag then 34 else 61)
      ⟨scanIn 0, binary⟩ = some ⟨clearIn (FieldReturn.symbolCode value) 4, finalBits⟩ ∧
      RepTape last finalBits := by
  induction path generalizing binary with
  | done tape gap =>
    have word := (main_word_zero tape).2 gap
    have scan : FlatInit.runFrom machine 8 ⟨scanIn 0, binary⟩ =
        some ⟨markerIn 0, binary⟩ := by
      simpa only [represented_main tape binary rep, scanDest, word, ↓reduceIte] using
        scan_transfer binary
    have marker := FieldReturn.marker_rep tape binary rep
    cases flagEq : tape.head.1
    · have marked : FlatInit.runFrom machine 26 ⟨markerIn 0, binary⟩ =
          some ⟨retreatIn 0, binary⟩ := by
        simpa [marker, flagEq, markerDest] using marker_transfer binary
      have prevRep := FieldReturn.move_rep tape binary rep
      have previous : FlatInit.runFrom machine 8 ⟨previousIn 0, shift .left 13 binary⟩ =
          some ⟨clearIn (FieldReturn.symbolCode ((tape.move .left).head.2 .main)) 0,
            shift .left 13 binary⟩ := by
        simpa only [represented_main (tape.move .left) _ prevRep,
          sourceWord, decode_encodeWord] using previous_transfer (shift .left 13 binary)
      refine ⟨written 0 (0, 0, 0) (shift .left 13 binary), ?_, ?_⟩
      · simp only [Nat.mul_zero, zero_add, popValue, flagEq, Bool.false_eq_true, ↓reduceIte]
        rw [show (61 : Nat) = 8 + (26 + (15 + (8 + 4))) from rfl,
          FieldReturn.run_add, scan, Option.bind_some,
          FieldReturn.run_add, marked, Option.bind_some,
          FieldReturn.run_add, retreat_transfer, Option.bind_some,
          FieldReturn.run_add, previous, Option.bind_some, clear_transfer]
      · simpa [popTape, flagEq] using clear_rep (tape.move .left) _ prevRep
    · have marked : FlatInit.runFrom machine 26 ⟨markerIn 0, binary⟩ =
          some ⟨clearIn 0 4, binary⟩ := by
        simpa [marker, flagEq, markerDest] using marker_transfer binary
      refine ⟨binary, ?_, ?_⟩
      · simpa only [Nat.mul_zero, zero_add, popValue, flagEq, ↓reduceIte,
          FieldReturn.symbolCode] using
          (show FlatInit.runFrom machine 34 ⟨scanIn 0, binary⟩ =
            some ⟨clearIn 0 4, binary⟩ from by
              rw [show (34 : Nat) = 8 + 26 from rfl,
                FieldReturn.run_add, scan, Option.bind_some, marked])
      · simpa [popTape, flagEq] using rep
  | more tape m last value flag present rest ih =>
    have word : wordValue (sourceWord tape) ≠ 0 := by
      intro h
      exact present ((main_word_zero tape).1 h)
    have scan : FlatInit.runFrom machine 8 ⟨scanIn 0, binary⟩ =
        some ⟨advanceIn 0, binary⟩ := by
      simpa only [represented_main tape binary rep, scanDest, word, ↓reduceIte] using
        scan_transfer binary
    obtain ⟨finalBits, run, represents⟩ := ih _ (move_right_rep tape binary rep)
    refine ⟨finalBits, ?_, represents⟩
    rw [show 23 * (m + 1) + (if flag then 34 else 61) =
        8 + (15 + (23 * m + (if flag then 34 else 61))) by omega,
      FieldReturn.run_add, scan, Option.bind_some,
      FieldReturn.run_add, advance_transfer, Option.bind_some]
    exact run

theorem return_prefix (source bottom : Tape Symbol) (n : Nat)
    (path : FieldReturn.ReturnPath source n bottom) (binary : Tape Bit) (v : Fin 5)
    (rep : RepTape source binary) :
    ∃ returnedBits, FlatInit.runFrom machine (37 * n + 24)
      ⟨returnIn (FieldReturn.embed v 0), binary⟩ =
        some ⟨returnIn (FieldReturn.embed v 48), returnedBits⟩ ∧
          RepTape bottom returnedBits := by
  obtain ⟨bits, run, represents, _⟩ := FieldReturn.return_refines source bottom n path binary v rep
  exact ⟨bits, run_partial FieldReturn.machine machine returnIn return_rows _ _ _ run, represents⟩

def RepresentsCfg (source : FieldReturn.SourceCfg) (binary : Cfg 425 2) : Prop :=
  ((∃ v : Fin 5, source.l = some FieldReturn.sourceLabel ∧ source.var = FieldReturn.codeSymbol v ∧
      binary.state = returnIn (FieldReturn.embed v 0)) ∨
    (source.l = some successor ∧ binary.state = clearIn (FieldReturn.symbolCode source.var) 4)) ∧
    RepTape source.Tape binary.tape

/-- The frozen return loop, its real continuation dispatch and complete pop have one certificate. -/
theorem composed_certificate (source bottom last : Tape Symbol) (n m : Nat)
    (value : RuntimeModel.Store) (flag : Bool)
    (returnPath : FieldReturn.ReturnPath source n bottom)
    (popPath : PopPath bottom m last value flag) (binary : Tape Bit) (v : Fin 5)
    (rep : RepTape source binary) :
    RepresentsCfg ⟨some FieldReturn.sourceLabel, FieldReturn.codeSymbol v, source⟩
      ⟨returnIn (FieldReturn.embed v 0), binary⟩ ∧
    ∃ finalBits,
      FieldReturn.sourceRun (n + m + 3)
        ⟨some FieldReturn.sourceLabel, FieldReturn.codeSymbol v, source⟩ =
          some ⟨some successor, value, last⟩ ∧
      FlatInit.runFrom machine (37 * n + 26 + (23 * m + if flag then 34 else 61))
        ⟨returnIn (FieldReturn.embed v 0), binary⟩ =
          some ⟨clearIn (FieldReturn.symbolCode value) 4, finalBits⟩ ∧
      RepresentsCfg ⟨some successor, value, last⟩
        ⟨clearIn (FieldReturn.symbolCode value) 4, finalBits⟩ := by
  obtain ⟨returnedBits, returned, returnedRep⟩ :=
    return_prefix source bottom n returnPath binary v rep
  obtain ⟨finalBits, popped, poppedRep⟩ :=
    pop_refines bottom last m value flag popPath _ returnedRep
  refine ⟨⟨Or.inl ⟨v, rfl, rfl, rfl⟩, rep⟩, finalBits, ?_, ?_, ?_⟩
  · rw [show n + m + 3 = (n + 1) + (1 + (m + 1)) by omega,
      sourceRun_add, FieldReturn.source_return source bottom n returnPath,
      Option.bind_some]
    change (TM1.step FieldReturn.sourceMachine
      ⟨some FieldReturn.continuation, FieldReturn.codeSymbol v, bottom⟩).bind
        (FieldReturn.sourceRun (m + 1)) = _
    rw [normal_dispatch, Option.bind_some]
    exact source_pop bottom last m value flag popPath _
  · rw [show 37 * n + 26 + (23 * m + if flag then 34 else 61) =
        (37 * n + 24) + (2 + (23 * m + if flag then 34 else 61)) by omega,
      FieldReturn.run_add, returned, Option.bind_some,
      FieldReturn.run_add,
      two_hop _ 245 (scanIn 0) (return_gate v) normal_gate, Option.bind_some]
    exact popped
  · exact ⟨Or.inr ⟨rfl, rfl⟩, poppedRep⟩

end ConjectureMachines.Compilation.FieldContinuation
