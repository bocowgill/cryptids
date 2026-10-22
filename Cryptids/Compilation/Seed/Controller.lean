/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.Seed.Format

/-! # The complete direct binary seed controller

The named controls biject with exactly `Fin 216`. Their numbering is the retained
pilot allocation, including terminal success 214 and the nonterminal error loop 215.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.Seed

open Turing

/-- Every control position is paid; only three families retain the parsed letter. -/
inductive Control where
  | entry (position : Fin 7)
  | skipB (position : Fin 6)
  | parse (position : Fin 7)
  | shiftB (letter : Letter) (position : Fin 10)
  | seekA (letter : Letter) (run : Fin 4)
  | prepend (letter : Letter) (position : Fin 18)
  | writeA (position : Fin 6)
  | skipA (position : Fin 7)
  | seekB (run : Fin 4)
  | backB (position : Fin 5)
  | toBEnd (position : Fin 4)
  | eraseB (position : Fin 6)
  | finishSeekA (run : Fin 4)
  | eraseA (position : Fin 6)
  | toMarker (position : Fin 12)
  | setMarker
  | backHead (position : Fin 11)
  | done
  | error
  deriving DecidableEq, Fintype

/-- Exact pilot numbering; this map adds no states. -/
def encode : Control → Fin 216
  | .entry i => ⟨i.val, by have := i.isLt; omega⟩
  | .skipB i => ⟨7 + i.val, by have := i.isLt; omega⟩
  | .parse i => ⟨13 + i.val, by have := i.isLt; omega⟩
  | .shiftB s i => ⟨20 + 32 * s.val + i.val, by have := s.isLt; have := i.isLt; omega⟩
  | .seekA s i => ⟨30 + 32 * s.val + i.val, by have := s.isLt; have := i.isLt; omega⟩
  | .prepend s i => ⟨34 + 32 * s.val + i.val, by have := s.isLt; have := i.isLt; omega⟩
  | .writeA i => ⟨148 + i.val, by have := i.isLt; omega⟩
  | .skipA i => ⟨154 + i.val, by have := i.isLt; omega⟩
  | .seekB i => ⟨161 + i.val, by have := i.isLt; omega⟩
  | .backB i => ⟨165 + i.val, by have := i.isLt; omega⟩
  | .toBEnd i => ⟨170 + i.val, by have := i.isLt; omega⟩
  | .eraseB i => ⟨174 + i.val, by have := i.isLt; omega⟩
  | .finishSeekA i => ⟨180 + i.val, by have := i.isLt; omega⟩
  | .eraseA i => ⟨184 + i.val, by have := i.isLt; omega⟩
  | .toMarker i => ⟨190 + i.val, by have := i.isLt; omega⟩
  | .setMarker => 202
  | .backHead i => ⟨203 + i.val, by have := i.isLt; omega⟩
  | .done => 214
  | .error => 215

/-- Inverse numeric dispatch across the contiguous retained blocks. -/
def decode (state : Fin 216) : Control :=
  let n := state.val
  if h : n < 7 then .entry ⟨n, h⟩
  else if h : n < 13 then .skipB ⟨n - 7, by omega⟩
  else if h : n < 20 then .parse ⟨n - 13, by omega⟩
  else if h : n < 148 then
    let s : Letter := ⟨(n - 20) / 32, by omega⟩
    let i := (n - 20) % 32
    if h : i < 10 then .shiftB s ⟨i, h⟩
    else if h : i < 14 then .seekA s ⟨i - 10, by omega⟩
    else .prepend s ⟨i - 14, by have := Nat.mod_lt (n - 20) (by decide : 0 < 32); omega⟩
  else if h : n < 154 then .writeA ⟨n - 148, by omega⟩
  else if h : n < 161 then .skipA ⟨n - 154, by omega⟩
  else if h : n < 165 then .seekB ⟨n - 161, by omega⟩
  else if h : n < 170 then .backB ⟨n - 165, by omega⟩
  else if h : n < 174 then .toBEnd ⟨n - 170, by omega⟩
  else if h : n < 180 then .eraseB ⟨n - 174, by omega⟩
  else if h : n < 184 then .finishSeekA ⟨n - 180, by omega⟩
  else if h : n < 190 then .eraseA ⟨n - 184, by omega⟩
  else if h : n < 202 then .toMarker ⟨n - 190, by omega⟩
  else if n = 202 then .setMarker
  else if h : n < 214 then .backHead ⟨n - 203, by omega⟩
  else if n = 214 then .done else .error

@[simp] theorem decode_encode (control : Control) : decode (encode control) = control := by
  cases control with
  | entry i => fin_cases i <;> rfl
  | skipB i => fin_cases i <;> rfl
  | parse i => fin_cases i <;> rfl
  | shiftB s i => fin_cases s <;> fin_cases i <;> rfl
  | seekA s i => fin_cases s <;> fin_cases i <;> rfl
  | prepend s i => fin_cases s <;> fin_cases i <;> rfl
  | writeA i => fin_cases i <;> rfl
  | skipA i => fin_cases i <;> rfl
  | seekB i => fin_cases i <;> rfl
  | backB i => fin_cases i <;> rfl
  | toBEnd i => fin_cases i <;> rfl
  | eraseB i => fin_cases i <;> rfl
  | finishSeekA i => fin_cases i <;> rfl
  | eraseA i => fin_cases i <;> rfl
  | toMarker i => fin_cases i <;> rfl
  | setMarker => rfl
  | backHead i => fin_cases i <;> rfl
  | done => rfl
  | error => rfl

@[simp] theorem encode_decode (state : Fin 216) : encode (decode state) = state := by
  fin_cases state <;> rfl

/-- Exact finite equivalence, useful for the independent paid-state census. -/
def controlEquiv : Control ≃ Fin 216 :=
  ⟨encode, decode, decode_encode, encode_decode⟩

abbrev entry : Fin 216 := encode (.entry 0)
abbrev loop : Fin 216 := encode (.skipB 0)
abbrev done : Fin 216 := encode .done
abbrev error : Fin 216 := encode .error

/-- Move to the next paid position, or take the block's explicit final edge. -/
def nextFixed {n : Nat} (family : Fin n → Control) (position : Fin n)
    (exit : Control) : Control :=
  if h : position.val + 1 < n then family ⟨position.val + 1, h⟩ else exit

def shiftAction (position : Fin 10) : Init.Instruction :=
  if position.val = 0 then (none, .left)
  else (some (([0, 0, 0] ++ marker).reverse.getD (position.val - 1) 0), .left)

def prependAction (letter : Letter) (position : Fin 18) : Init.Instruction :=
  if position.val < 5 then (none, .right)
  else (some ((cell letter).reverse.getD (position.val - 5) 0), .left)

def markerAction (position : Fin 6) : Init.Instruction :=
  (some (marker.reverse.getD position.val 0), .left)

def actionRow (action : Init.Instruction) (next : Control) (bit : Bit) :
    Option (Bit × Dir × Control) := some (action.1.getD bit, action.2, next)

def scanNext (family : Fin 4 → Control) (run : Fin 4) (exit : Control) (bit : Bit) :
    Control :=
  if bit = 0 then family 0 else nextFixed family run exit

/-- The seven parser nodes retain the already read low bits in their control. -/
def parseNext (position : Fin 7) (bit : Bit) : Control :=
  match position.val with
  | 0 => if bit = 0 then .parse 1 else .parse 2
  | 1 => if bit = 0 then .parse 3 else .parse 5
  | 2 => if bit = 0 then .parse 4 else .parse 6
  | 3 => if bit = 0 then .toBEnd 0 else .shiftB 3 0
  | 4 => if bit = 0 then .shiftB 0 0 else .error
  | 5 => if bit = 0 then .shiftB 1 0 else .error
  | _ => if bit = 0 then .shiftB 2 0 else .error

/-- Closed binary rows over the exact named finite control type. -/
def controlRow : Control → Bit → Option (Bit × Dir × Control)
  | .entry i, b => actionRow (none, .right) (nextFixed .entry i (.skipB 0)) b
  | .skipB i, b => actionRow (none, .right) (nextFixed .skipB i (.parse 0)) b
  | .parse i, b => some (b, .right, parseNext i b)
  | .shiftB s i, b => actionRow (shiftAction i) (nextFixed (.shiftB s) i (.seekA s 0)) b
  | .seekA s i, b => some (b, .left, scanNext (.seekA s) i (.prepend s 0) b)
  | .prepend s i, b => actionRow (prependAction s i) (nextFixed (.prepend s) i (.writeA 0)) b
  | .writeA i, b => actionRow (markerAction i) (nextFixed .writeA i (.skipA 0)) b
  | .skipA i, b => actionRow (none, .right) (nextFixed .skipA i (.seekB 0)) b
  | .seekB i, b => some (b, .right, scanNext .seekB i (.backB 0) b)
  | .backB i, b => actionRow (none, .left) (nextFixed .backB i (.skipB 0)) b
  | .toBEnd i, b => actionRow (none, .left) (nextFixed .toBEnd i (.eraseB 0)) b
  | .eraseB i, b => actionRow (some 0, .left) (nextFixed .eraseB i (.finishSeekA 0)) b
  | .finishSeekA i, b => some (b, .left, scanNext .finishSeekA i (.eraseA 0) b)
  | .eraseA i, b => actionRow (some 0, .right) (nextFixed .eraseA i (.toMarker 0)) b
  | .toMarker i, b => actionRow (none, .right) (nextFixed .toMarker i .setMarker) b
  | .setMarker, b => actionRow (some 1, .left) (.backHead 0) b
  | .backHead i, b => actionRow (none, .left) (nextFixed .backHead i .done) b
  | .done, _ => none
  | .error, b => some (b, .right, .error)

/-- The actual ordinary machine, with exactly 216 states and two tape symbols. -/
def machine : Machine 216 2 where
  transition state bit := (controlRow (decode state) bit).map
    (fun (write, dir, next) ↦ (write, dir, encode next))

theorem transition_encode (control : Control) (bit : Bit) :
    machine.transition (encode control) bit = (controlRow control bit).map
      (fun (write, dir, next) ↦ (write, dir, encode next)) := by
  simp only [machine, decode_encode]

@[simp] theorem terminal_done (bit : Bit) : machine.transition done bit = none := rfl

theorem transition_error (bit : Bit) :
    machine.transition error bit = some (bit, .right, error) := rfl

theorem controlRow_none_iff (control : Control) (bit : Bit) :
    controlRow control bit = none ↔ control = .done := by
  cases control <;> simp [controlRow, actionRow]

theorem transition_none_iff (state : Fin 216) (bit : Bit) :
    machine.transition state bit = none ↔ state = done := by
  rw [← encode_decode state, transition_encode]
  simp only [Option.map_eq_none_iff, controlRow_none_iff]
  constructor
  · intro h; rw [h]
  · intro h; simpa using congrArg decode h

end ConjectureMachines.Compilation.Seed
