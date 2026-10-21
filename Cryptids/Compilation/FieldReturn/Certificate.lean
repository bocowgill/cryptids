/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.FieldBinary.Codec
public import Cryptids.Compilation.SharedModel

/-! # A fully counted field-aware interpreter return shuttle

The real shared interpreter label stack0629 returns left to the bottom marker,
then transfers to normal2. Store values live in ordinary binary machine controls.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.FieldReturn
open Turing PartrecToTM2 FieldBinary

set_option backward.isDefEq.respectTransparency false

abbrev Symbol := SharedModel.Symbol
abbrev SourceCfg := TM1.Cfg Symbol SharedModel.StackLabel RuntimeModel.Store

def symbolCode : Option PartrecToTM2.Γ' → Fin 5
  | none => 0 | some .consₗ => 1 | some .cons => 2 | some .bit0 => 3 | some .bit1 => 4

def codeSymbol (code : Fin 5) : Option PartrecToTM2.Γ' :=
  match code.val with
  | 0 => none | 1 => some .consₗ | 2 => some .cons | 3 => some .bit0 | _ => some .bit1

theorem symbol_roundtrip (s : Option PartrecToTM2.Γ') : codeSymbol (symbolCode s) = s := by
  cases s with | none => rfl | some s => cases s <;> rfl

theorem code_roundtrip (v : Fin 5) : symbolCode (codeSymbol v) = v := by
  fin_cases v <;> rfl

def stackIndex : K' → Fin 4
  | .main => 0 | .rev => 1 | .aux => 2 | .stack => 3

def stackAt (i : Fin 4) : K' :=
  match i.val with | 0 => .main | 1 => .rev | 2 => .aux | _ => .stack

def symbolCell (symbol : Symbol) : Cell :=
  (symbol.1, fun i ↦ symbolCode (symbol.2 (stackAt i)))

def RepresentsTape (source : Tape Symbol) (binary : Tape Bit) : Prop :=
  ∀ (i : Int) (j : Fin 13), binary.nth (13 * i + j.val) =
    encodeCell (symbolCell (source.nth i)) j

def sourceLabel : SharedModel.StackLabel := .ret RuntimeModel.s000

def continuation : SharedModel.StackLabel := .normal 2

def sourceMachine := TM2to1.tr RuntimeModel.machine

theorem source_identity : sourceLabel = SharedModel.stack0629 := rfl

theorem source_step (v : RuntimeModel.Store) (tape : Tape Symbol) :
    TM1.step sourceMachine ⟨some sourceLabel, v, tape⟩ =
      some (if tape.head.1 then ⟨some continuation, v, tape⟩ else
        ⟨some sourceLabel, v, tape.move .left⟩) := by
  cases marker : tape.head.1 <;>
    simp [TM1.step, sourceMachine, sourceLabel, TM2to1.tr, TM1.stepAux,
      RuntimeModel.s000, RuntimeModel.table5, TM2to1.trNormal, marker, continuation]

def idx (n : Nat) : Fin 49 := ⟨n % 49, Nat.mod_lt _ (by decide)⟩

/-- Twelve seek states, one marker branch, two complete return paths and a paid port. -/
def block : Machine 49 2 where
  transition state bit :=
    if state.val < 12 then some (bit, .right, idx (state.val + 1))
    else if state.val = 12 then some (bit, .left, if bit = 0 then 13 else 37)
    else if state.val = 36 then some (bit, .left, 0)
    else if state.val < 48 then some (bit, .left, idx (state.val + 1))
    else none

def embed (v : Fin 5) (q : Fin 49) : Fin 245 :=
  ⟨49 * v.val + q.val, by have := v.isLt; have := q.isLt; omega⟩

def control (q : Fin 245) : Fin 49 := ⟨q.val % 49, Nat.mod_lt _ (by decide)⟩

def store (q : Fin 245) : Fin 5 := ⟨q.val / 49, by have := q.isLt; omega⟩

/-- Complete finite control, with five distinct entries and five continuation ports. -/
def machine : Machine 245 2 where
  transition q bit := Routine.liftRow (embed (store q)) (block.transition (control q) bit)

theorem block_rows (v : Fin 5) (q : Fin 49) (bit : Bit) :
    machine.transition (embed v q) bit =
      Routine.liftRow (embed v) (block.transition q bit) := by
  have all : ∀ (v : Fin 5) (q : Fin 49) (bit : Bit),
      machine.transition (embed v q) bit =
        Routine.liftRow (embed v) (block.transition q bit) := by decide +kernel
  exact all v q bit

theorem run_add {q : Nat} (M : Machine q 2) (a b : Nat) (cfg : Cfg q 2) :
    FlatInit.runFrom M (a + b) cfg =
      (FlatInit.runFrom M a cfg).bind (FlatInit.runFrom M b) := by
  induction a generalizing cfg with
  | zero => rfl
  | succ a ih =>
    simp only [Nat.succ_add, FlatInit.runFrom, ih, Option.bind_assoc]

theorem run_chain {q : Nat} [NeZero q] (M : Machine q 2) (dir : Dir)
    (n : Nat) (path : Nat → Fin q)
    (rows : ∀ i, i < n → ∀ bit, M.transition (path i) bit =
      some (bit, dir, path (i + 1))) (tape : Tape Bit) :
    FlatInit.runFrom M n ⟨path 0, tape⟩ = some ⟨path n, shift dir n tape⟩ := by
  induction n generalizing path tape with
  | zero => rfl
  | succ n ih =>
    have first : step M ⟨path 0, tape⟩ = some ⟨path 1, tape.move dir⟩ := by
      simp [step, rows 0 (by omega), Tape.write_self]
    simp only [FlatInit.runFrom, first, Option.bind_some]
    simpa only [shift] using ih (fun i ↦ path (i + 1))
      (fun i h bit ↦ rows (i + 1) (by omega) bit) (tape.move dir)

theorem seek_run (tape : Tape Bit) :
    FlatInit.runFrom block 12 ⟨0, tape⟩ = some ⟨12, shift .right 12 tape⟩ := by
  apply run_chain block .right 12 idx
  intro i bound bit
  interval_cases i <;> rfl

theorem home_run (tape : Tape Bit) :
    FlatInit.runFrom block 11 ⟨37, tape⟩ = some ⟨48, shift .left 11 tape⟩ := by
  apply run_chain block .left 11 (fun i ↦ idx (37 + i))
  intro i bound bit
  interval_cases i <;> rfl

theorem back_run (tape : Tape Bit) :
    FlatInit.runFrom block 24 ⟨13, tape⟩ = some ⟨0, shift .left 24 tape⟩ := by
  apply run_chain block .left 24 (fun i ↦ if i < 24 then idx (13 + i) else 0)
  intro i bound bit
  interval_cases i <;> rfl

theorem marker_run (tape : Tape Bit) :
    FlatInit.runFrom block (if tape.nth 12 = 0 then 37 else 24) ⟨0, tape⟩ =
      some (if tape.nth 12 = 0 then ⟨0, shift .left 13 tape⟩ else ⟨48, tape⟩) := by
  have head : (shift .right 12 tape).head = tape.nth 12 := by
    change (shift .right 12 tape).nth 0 = _
    simp [shift_right_nth]
  by_cases marker : tape.nth 12 = 0
  · simp only [marker, ↓reduceIte]
    rw [show (37 : Nat) = 12 + (1 + 24) from rfl, run_add, seek_run, Option.bind_some]
    have branch : step block ⟨12, shift .right 12 tape⟩ =
        some ⟨13, (shift .right 12 tape).move .left⟩ := by
      simp [step, block, head, marker, Tape.write_self]
    rw [Nat.add_comm 1, FlatInit.runFrom, branch, Option.bind_some, back_run]
    congr 2
    apply tape_ext_nth
    intro i
    simp [shift_left_nth, shift_right_nth, Tape.move_left_nth]
    congr 1
    omega
  · simp only [marker, ↓reduceIte]
    rw [show (24 : Nat) = 12 + (1 + 11) from rfl, run_add, seek_run, Option.bind_some]
    have branch : step block ⟨12, shift .right 12 tape⟩ =
        some ⟨37, (shift .right 12 tape).move .left⟩ := by
      simp [step, block, head, marker, Tape.write_self]
    rw [Nat.add_comm 1, FlatInit.runFrom, branch, Option.bind_some, home_run]
    congr 2
    apply tape_ext_nth
    intro i
    simp [shift_left_nth, shift_right_nth, Tape.move_left_nth]

theorem marker_rep (source : Tape Symbol) (binary : Tape Bit)
    (rep : RepresentsTape source binary) :
    binary.nth 12 = if source.head.1 then 1 else 0 := by
  simpa [encodeCell, symbolCell] using rep 0 12

theorem move_rep (source : Tape Symbol) (binary : Tape Bit)
    (rep : RepresentsTape source binary) :
    RepresentsTape (source.move .left) (shift .left 13 binary) := by
  intro i j
  rw [shift_left_nth, Tape.move_left_nth]
  convert rep (i - 1) j using 1 <;> congr 1 <;> omega

/-- One complete source return step, including finite store dispatch and decoded return control. -/
theorem iteration_refines (source : Tape Symbol) (binary : Tape Bit) (v : Fin 5)
    (rep : RepresentsTape source binary) :
    let target := if source.head.1 then source else source.move .left
    let bits := if source.head.1 then binary else shift .left 13 binary
    let out := if source.head.1 then 48 else (0 : Fin 49)
    FlatInit.runFrom machine (if source.head.1 then 24 else 37) ⟨embed v 0, binary⟩ =
      some ⟨embed v out, bits⟩ ∧ RepresentsTape target bits ∧
      TM1.step sourceMachine ⟨some sourceLabel, codeSymbol v, source⟩ =
        some ⟨some (if source.head.1 then continuation else sourceLabel), codeSymbol v, target⟩ := by
  have lift := Routine.run_lift block machine (embed v) (block_rows v)
    (if binary.nth 12 = 0 then 37 else 24) ⟨0, binary⟩
  rw [marker_run] at lift
  have marker := marker_rep source binary rep
  cases flag : source.head.1 <;>
    simp only [flag, Bool.false_eq_true, ↓reduceIte, Bool.true_eq_true] at *
  · exact ⟨by simpa [Routine.liftCfg, marker] using lift,
      move_rep source binary rep, by simpa [flag] using source_step (codeSymbol v) source⟩
  · exact ⟨by simpa [Routine.liftCfg, marker] using lift,
      rep, by simpa [flag] using source_step (codeSymbol v) source⟩

/-- The source has exactly n unmarked cells before its first marker to the left. -/
inductive ReturnPath : Tape Symbol → Nat → Tape Symbol → Prop
  | here (tape) (marked : tape.head.1 = true) : ReturnPath tape 0 tape
  | left (tape) (n) (last) (unmarked : tape.head.1 = false)
      (rest : ReturnPath (tape.move .left) n last) : ReturnPath tape (n + 1) last

/-- Arbitrarily long source return paths execute in the cyclic binary machine, with no hidden store. -/
theorem return_refines (source last : Tape Symbol) (n : Nat)
    (path : ReturnPath source n last) (binary : Tape Bit) (v : Fin 5)
    (rep : RepresentsTape source binary) :
    ∃ finalBits, FlatInit.runFrom machine (37 * n + 24) ⟨embed v 0, binary⟩ =
      some ⟨embed v 48, finalBits⟩ ∧ RepresentsTape last finalBits ∧
      finalBits = shift .left (13 * n) binary := by
  induction path generalizing binary with
  | here tape marked =>
    refine ⟨binary, ?_, rep, rfl⟩
    simpa [marked] using (iteration_refines tape binary v rep).1
  | left tape n last unmarked rest ih =>
    have first := iteration_refines tape binary v rep
    simp only [unmarked, Bool.false_eq_true, ↓reduceIte] at first
    obtain ⟨finalBits, run, represents, shiftEq⟩ := ih _ first.2.1
    refine ⟨finalBits, ?_, represents, ?_⟩
    · rw [show 37 * (n + 1) + 24 = 37 + (37 * n + 24) by omega,
        run_add, first.1, Option.bind_some]
      exact run
    · rw [shiftEq, ← shift_add]
      congr 1
      omega

/-- All states are paid: seek/entry, marker dispatch, loop return, marked return and exit ports. -/
theorem state_inventory : 5 * (12 + 1 + 24 + 11 + 1) = 245 := rfl

theorem entry_distinct (a b : Fin 5) : embed a 0 = embed b 0 ↔ a = b := by
  constructor
  · intro same
    apply Fin.ext
    have := congrArg Fin.val same
    simp only [embed, Fin.val_zero] at this
    omega
  · rintro rfl
    rfl

theorem ports_stop (v : Fin 5) (bit : Bit) : machine.transition (embed v 48) bit = none := by
  rw [block_rows]
  rfl

end ConjectureMachines.Compilation.FieldReturn
