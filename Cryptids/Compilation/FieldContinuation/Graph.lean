/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.FieldReturn.Certificate

/-! # Explicit counted graph connecting return to the main-pop continuation -/

@[expose] public section
namespace ConjectureMachines.Compilation.FieldContinuation
open Turing FieldBinary

set_option backward.isDefEq.respectTransparency false

abbrev readRoutine := readAt 0
abbrev moveRight := moveCell Dir.right
abbrev moveLeft := moveCell Dir.left
abbrev clearRoutine := writeAt 0 (0, 0, 0)

def markerRoutine : Routine Bool :=
  .moves .right 12 (.read .left
    (.moves .left 11 (.exit false)) (.moves .left 11 (.exit true)))

def put {n : Nat} (base : Nat) (bound : base + n ≤ 425) (q : Fin n) : Fin 425 :=
  ⟨base + q.val, by have := q.isLt; omega⟩

def take (q : Fin 425) (base n : Nat) (lo : base ≤ q.val)
    (hi : q.val < base + n) : Fin n := ⟨q.val - base, by omega⟩

def returnIn : Fin 245 → Fin 425 := put 0 (by decide)
def scanIn : Fin 39 → Fin 425 := put 246 (by decide)
def advanceIn : Fin 14 → Fin 425 := put 287 (by decide)
def markerIn : Fin 37 → Fin 425 := put 302 (by decide)
def retreatIn : Fin 14 → Fin 425 := put 341 (by decide)
def previousIn : Fin 39 → Fin 425 := put 356 (by decide)
def clearIn (v : Fin 5) : Fin 5 → Fin 425 :=
  put (400 + 5 * v.val) (by have := v.isLt; omega)

def scanBack (w : Word) : Fin 425 := if wordValue w = 0 then 285 else 286
def scanDest (w : Word) : Fin 425 := if wordValue w = 0 then markerIn 0 else advanceIn 0
def markerBack (b : Bool) : Fin 425 := if b then 340 else 339
def markerDest (b : Bool) : Fin 425 := if b then clearIn 0 4 else retreatIn 0
def previousBack (w : Word) : Fin 425 := ⟨395 + (decodeWord w).val, by omega⟩
def previousDest (w : Word) : Fin 425 := clearIn (decodeWord w) 0

/-- Defined component rows are lifted; every terminal jump consumes a real right-move row. -/
def plugged {n : Nat} {α : Type} (M : Machine n 2) (result : Fin n → Option α)
    (back : α → Fin 425) (encode : Fin n → Fin 425) (q : Fin n) (bit : Bit) :
    Option (Bit × Dir × Fin 425) :=
  match M.transition q bit with
  | some (write, dir, dest) => some (write, dir, encode dest)
  | none => (result q).map (fun value ↦ (bit, .right, back value))

/-- All controls, including intermediate exits, dispatch gates and final ports, are numeric. -/
def machine : Machine 425 2 where
  transition q bit :=
    if h : q.val < 245 then
      match FieldReturn.machine.transition ⟨q.val, h⟩ bit with
      | some (write, dir, dest) => some (write, dir, returnIn dest)
      | none => some (bit, .right, 245)
    else if at245 : q.val = 245 then some (bit, .left, scanIn 0)
    else if h : q.val < 285 then
      plugged readRoutine.machine readRoutine.result scanBack scanIn
        (take q 246 39 (by omega) h) bit
    else if at285 : q.val = 285 then some (bit, .left, markerIn 0)
    else if at286 : q.val = 286 then some (bit, .left, advanceIn 0)
    else if h : q.val < 301 then
      plugged moveRight.machine moveRight.result (fun _ ↦ 301) advanceIn
        (take q 287 14 (by omega) h) bit
    else if at301 : q.val = 301 then some (bit, .left, scanIn 0)
    else if h : q.val < 339 then
      plugged markerRoutine.machine markerRoutine.result markerBack markerIn
        (take q 302 37 (by omega) h) bit
    else if at339 : q.val = 339 then some (bit, .left, retreatIn 0)
    else if at340 : q.val = 340 then some (bit, .left, clearIn 0 4)
    else if h : q.val < 355 then
      plugged moveLeft.machine moveLeft.result (fun _ ↦ 355) retreatIn
        (take q 341 14 (by omega) h) bit
    else if at355 : q.val = 355 then some (bit, .left, previousIn 0)
    else if h : q.val < 395 then
      plugged readRoutine.machine readRoutine.result previousBack previousIn
        (take q 356 39 (by omega) h) bit
    else if h : q.val < 400 then
      some (bit, .left, clearIn ⟨q.val - 395, by omega⟩ 0)
    else
      let v : Fin 5 := ⟨(q.val - 400) / 5, by have := q.isLt; omega⟩
      let state : Fin 5 := ⟨(q.val - 400) % 5, Nat.mod_lt _ (by decide)⟩
      Routine.liftRow (clearIn v) (clearRoutine.machine.transition state bit)

/-- Lifting a finite execution only needs agreement on rows it can execute. -/
theorem run_partial {n m : Nat} [NeZero n] [NeZero m]
    (M : Machine n 2) (N : Machine m 2) (encode : Fin n → Fin m)
    (rows : ∀ q bit, M.transition q bit ≠ none →
      N.transition (encode q) bit = Routine.liftRow encode (M.transition q bit))
    (count : Nat) (cfg out : Cfg n 2) (run : FlatInit.runFrom M count cfg = some out) :
    FlatInit.runFrom N count (Routine.liftCfg encode cfg) =
      some (Routine.liftCfg encode out) := by
  induction count generalizing cfg with
  | zero =>
    have same : cfg = out := Option.some.inj run
    subst out
    rfl
  | succ count ih =>
    cases oldStep : step M cfg with
    | none => simp [FlatInit.runFrom, oldStep] at run
    | some next =>
      have newStep : step N (Routine.liftCfg encode cfg) =
          some (Routine.liftCfg encode next) := by
        rcases cfg with ⟨q, tape⟩
        cases oldRow : M.transition q tape.head with
        | none => simp [step, oldRow] at oldStep
        | some row =>
          have present : M.transition q tape.head ≠ none := by rw [oldRow]; simp
          have transferred := rows q tape.head present
          rw [oldRow] at transferred
          simpa only [step, Routine.liftCfg, transferred, Routine.liftRow,
            oldRow, Option.map_some] using congrArg (Option.map (Routine.liftCfg encode)) oldStep
      rw [FlatInit.runFrom, newStep, Option.bind_some]
      exact ih _ (by simpa only [FlatInit.runFrom, oldStep, Option.bind_some] using run)

theorem two_hop (start middle dest : Fin 425)
    (first : ∀ b, machine.transition start b = some (b, .right, middle))
    (second : ∀ b, machine.transition middle b = some (b, .left, dest)) (tape : Tape Bit) :
    FlatInit.runFrom machine 2 ⟨start, tape⟩ = some ⟨dest, tape⟩ := by
  simp [FlatInit.runFrom, step, first, second, Tape.write_self]

theorem routine_transfer {α : Type} (p : Routine α) (encode : Fin p.size → Fin 425)
    (back dest : α → Fin 425)
    (rows : ∀ q b, machine.transition (encode q) b =
      plugged p.machine p.result back encode q b)
    (gates : ∀ x b, machine.transition (back x) b = some (b, .left, dest x))
    (tape : Tape Bit) :
    FlatInit.runFrom machine (p.steps tape + 2) ⟨encode 0, tape⟩ =
      some ⟨dest (p.execute tape).1, (p.execute tape).2⟩ := by
  have compatible q bit (present : p.machine.transition q bit ≠ none) :
      machine.transition (encode q) bit =
        Routine.liftRow encode (p.machine.transition q bit) := by
    rw [rows]
    cases h : p.machine.transition q bit with
    | none => exact False.elim (present h)
    | some row => simp only [plugged, h, Routine.liftRow, Option.map_some]
  have lifted := run_partial p.machine machine encode compatible _ _ _
    (Routine.run_execute p tape)
  simp only [Routine.liftCfg] at lifted
  rw [FieldReturn.run_add, lifted, Option.bind_some]
  apply two_hop _ (back (p.execute tape).1) _ _ (gates (p.execute tape).1)
  intro b
  rw [rows]
  simp only [plugged, p.exit_stops, p.result_exit, Option.map_some]

theorem return_rows (q : Fin 245) (b : Bit) (present :
    FieldReturn.machine.transition q b ≠ none) :
    machine.transition (returnIn q) b =
      Routine.liftRow returnIn (FieldReturn.machine.transition q b) := by
  have all : ∀ (q : Fin 245) (b : Bit), FieldReturn.machine.transition q b ≠ none →
      machine.transition (returnIn q) b =
        Routine.liftRow returnIn (FieldReturn.machine.transition q b) := by decide +kernel
  exact all q b present

theorem return_gate (v : Fin 5) (b : Bit) :
    machine.transition (returnIn (FieldReturn.embed v 48)) b = some (b, .right, 245) := by
  have all : ∀ (v : Fin 5) (b : Bit),
      machine.transition (returnIn (FieldReturn.embed v 48)) b =
        some (b, .right, 245) := by decide +kernel
  exact all v b

theorem normal_gate (b : Bit) : machine.transition 245 b = some (b, .left, scanIn 0) := rfl

theorem scan_rows (q : Fin 39) (b : Bit) : machine.transition (scanIn q) b =
    plugged readRoutine.machine readRoutine.result scanBack scanIn q b := by
  have all : ∀ (q : Fin 39) (b : Bit), machine.transition (scanIn q) b =
      plugged readRoutine.machine readRoutine.result scanBack scanIn q b := by decide +kernel
  exact all q b

theorem scan_gates (w : Word) (b : Bit) :
    machine.transition (scanBack w) b = some (b, .left, scanDest w) := by
  have all : ∀ (w : Word) (b : Bit),
      machine.transition (scanBack w) b = some (b, .left, scanDest w) := by decide +kernel
  exact all w b

theorem advance_rows (q : Fin 14) (b : Bit) : machine.transition (advanceIn q) b =
    plugged moveRight.machine moveRight.result (fun _ ↦ 301) advanceIn q b := by
  have all : ∀ (q : Fin 14) (b : Bit), machine.transition (advanceIn q) b =
      plugged moveRight.machine moveRight.result (fun _ ↦ 301) advanceIn q b := by decide +kernel
  exact all q b

theorem advance_gate (b : Bit) : machine.transition 301 b = some (b, .left, scanIn 0) := rfl

theorem marker_rows (q : Fin 37) (b : Bit) : machine.transition (markerIn q) b =
    plugged markerRoutine.machine markerRoutine.result markerBack markerIn q b := by
  have all : ∀ (q : Fin 37) (b : Bit), machine.transition (markerIn q) b =
      plugged markerRoutine.machine markerRoutine.result markerBack markerIn q b := by
    decide +kernel
  exact all q b

theorem marker_gates (flag : Bool) (b : Bit) :
    machine.transition (markerBack flag) b = some (b, .left, markerDest flag) := by
  cases flag <;> rfl

theorem retreat_rows (q : Fin 14) (b : Bit) : machine.transition (retreatIn q) b =
    plugged moveLeft.machine moveLeft.result (fun _ ↦ 355) retreatIn q b := by
  have all : ∀ (q : Fin 14) (b : Bit), machine.transition (retreatIn q) b =
      plugged moveLeft.machine moveLeft.result (fun _ ↦ 355) retreatIn q b := by decide +kernel
  exact all q b

theorem retreat_gate (b : Bit) : machine.transition 355 b =
    some (b, .left, previousIn 0) := rfl

theorem previous_rows (q : Fin 39) (b : Bit) : machine.transition (previousIn q) b =
    plugged readRoutine.machine readRoutine.result previousBack previousIn q b := by
  have all : ∀ (q : Fin 39) (b : Bit), machine.transition (previousIn q) b =
      plugged readRoutine.machine readRoutine.result previousBack previousIn q b := by
    decide +kernel
  exact all q b

theorem previous_gates (w : Word) (b : Bit) :
    machine.transition (previousBack w) b = some (b, .left, previousDest w) := by
  have all : ∀ (w : Word) (b : Bit),
      machine.transition (previousBack w) b = some (b, .left, previousDest w) := by decide +kernel
  exact all w b

theorem clear_rows (v : Fin 5) (q : Fin 5) (b : Bit) :
    machine.transition (clearIn v q) b =
      Routine.liftRow (clearIn v) (clearRoutine.machine.transition q b) := by
  have all : ∀ (v : Fin 5) (q : Fin 5) (b : Bit),
      machine.transition (clearIn v q) b =
        Routine.liftRow (clearIn v) (clearRoutine.machine.transition q b) := by decide +kernel
  exact all v q b

/-- The type counts all retained and added controls; final ports are included in the last block. -/
theorem state_inventory : 245 + 1 + 39 + 2 + 14 + 1 + 37 + 2 + 14 + 1 + 39 + 5 + 25 = 425 := rfl

end ConjectureMachines.Compilation.FieldContinuation
