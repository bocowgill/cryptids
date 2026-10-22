/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.Seed.Controller

/-! # The exact paid fixed29 packet controller

The allocation follows the retained pilot's insertion order, including its shared consume
blocks sorted by destination name. A structural sum equivalence accounts for every paid
position, so inverse and coverage proofs never enumerate the 21,682 numeric states.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.TableSeed

open Turing
open Seed (Bit Letter)

/-- Phase zero is post; phase one is pre. Parser positions have breadth-first LSB order. -/
inductive ReadCtx where
  | literal (phase : Fin 2) (parser : Fin 7)
  | tag (parser : Fin 7)
  | operand (tag : Fin 7) (side : Fin 2) (position : Fin 13) (seen : Bool)
  deriving DecidableEq, Fintype

/-- Number of digits in each constant tag's minimal MSB-first binary representation. -/
def tagWidth (tag : Fin 7) : Nat :=
  match tag.val with
  | 0 => 0
  | 1 => 1
  | 2 | 3 => 2
  | _ => 3

/-- A pending emission stores only one letter and its finite source continuation. -/
inductive EmitCtx where
  | literal (phase : Fin 2) (letter : Letter)
  | delimiter
  | operandCons (tag : Fin 7) (side : Fin 2)
  | operandBit (tag : Fin 7) (side : Fin 2) (position : Fin 13) (bit : Bool)
  | tagCons (tag : Fin 7)
  | tagBit (tag : Fin 7) (position : Fin (tagWidth tag))
  deriving DecidableEq

inductive Entry where
  | read (context : ReadCtx)
  | emit (context : EmitCtx)
  | finish
  | error
  deriving DecidableEq

/-- Each tag's contiguous physical region, in increasing tag order. -/
def tagSize (tag : Fin 7) : Nat :=
  match tag.val with
  | 0 => 2289
  | 1 => 2324
  | 2 | 3 => 2359
  | _ => 2394

theorem tagSize_eq (tag : Fin 7) : tagSize tag = 2289 + 35 * tagWidth tag := by
  fin_cases tag <;> rfl

theorem tagSize_lower (tag : Fin 7) : 2289 ≤ tagSize tag := by
  rw [tagSize_eq]
  omega

/-- Physical allocation regions. Literal/read/emission interleaving is decoded inside them. -/
inductive Control where
  | entry (position : Fin 7)
  | literal (phase : Fin 2) (position : Fin 189)
  | delimiter (position : Fin 35)
  | tag (parser : Fin 7) (position : Fin 7)
  | row0 (position : Fin 2289)
  | row1 (position : Fin 2324)
  | row2 (position : Fin 2359)
  | row3 (position : Fin 2359)
  | row4 (position : Fin 2394)
  | row5 (position : Fin 2394)
  | row6 (position : Fin 2394)
  | consume (destination : Fin 583) (position : Fin 8)
  | finish (position : Fin 34)
  | done
  | error
  deriving DecidableEq, Fintype

private abbrev Layout :=
  Fin 7 ⊕ (Fin 2 × Fin 189) ⊕ Fin 35 ⊕ (Fin 7 × Fin 7) ⊕
    Fin 2289 ⊕ Fin 2324 ⊕ Fin 2359 ⊕ Fin 2359 ⊕ Fin 2394 ⊕ Fin 2394 ⊕ Fin 2394 ⊕
    (Fin 583 × Fin 8) ⊕ Fin 34 ⊕ Fin 1 ⊕ Fin 1

private def toLayout : Control → Layout
  | .entry i => .inl i
  | .literal p i => .inr (.inl (p, i))
  | .delimiter i => .inr (.inr (.inl i))
  | .tag p i => .inr (.inr (.inr (.inl (p, i))))
  | .row0 i => .inr (.inr (.inr (.inr (.inl i))))
  | .row1 i => .inr (.inr (.inr (.inr (.inr (.inl i)))))
  | .row2 i => .inr (.inr (.inr (.inr (.inr (.inr (.inl i))))))
  | .row3 i => .inr (.inr (.inr (.inr (.inr (.inr (.inr (.inl i)))))))
  | .row4 i => .inr (.inr (.inr (.inr (.inr (.inr (.inr (.inr (.inl i))))))))
  | .row5 i => .inr (.inr (.inr (.inr (.inr (.inr (.inr (.inr (.inr (.inl i)))))))))
  | .row6 i => .inr (.inr (.inr (.inr (.inr (.inr (.inr (.inr (.inr (.inr (.inl i))))))))))
  | .consume d i =>
    .inr (.inr (.inr (.inr (.inr (.inr (.inr (.inr (.inr (.inr (.inr (.inl (d, i)))))))))))
  | .finish i =>
    .inr (.inr (.inr (.inr (.inr (.inr (.inr (.inr (.inr (.inr (.inr (.inr (.inl i))))))))))))
  | .done =>
    .inr (.inr (.inr (.inr (.inr (.inr (.inr
      (.inr (.inr (.inr (.inr (.inr (.inr (.inl 0)))))))))))))
  | .error =>
    .inr (.inr (.inr (.inr (.inr (.inr (.inr
      (.inr (.inr (.inr (.inr (.inr (.inr (.inr 0)))))))))))))

private def fromLayout : Layout → Control :=
  Sum.elim .entry <| Sum.elim (fun (p, i) ↦ .literal p i) <|
    Sum.elim .delimiter <| Sum.elim (fun (p, i) ↦ .tag p i) <|
    Sum.elim .row0 <| Sum.elim .row1 <| Sum.elim .row2 <| Sum.elim .row3 <|
    Sum.elim .row4 <| Sum.elim .row5 <| Sum.elim .row6 <|
    Sum.elim (fun (d, i) ↦ .consume d i) <| Sum.elim .finish <|
    Sum.elim (fun _ ↦ .done) (fun _ ↦ .error)

private def layoutEquiv : Control ≃ Layout where
  toFun := toLayout
  invFun := fromLayout
  left_inv control := by cases control <;> rfl
  right_inv layout := by
    rcases layout with i | layout
    · rfl
    rcases layout with i | layout
    · rfl
    rcases layout with i | layout
    · rfl
    rcases layout with i | layout
    · rfl
    rcases layout with i | layout
    · rfl
    rcases layout with i | layout
    · rfl
    rcases layout with i | layout
    · rfl
    rcases layout with i | layout
    · rfl
    rcases layout with i | layout
    · rfl
    rcases layout with i | layout
    · rfl
    rcases layout with i | layout
    · rfl
    rcases layout with i | layout
    · rfl
    rcases layout with i | layout
    · rfl
    rcases layout with i | i
    · fin_cases i; rfl
    · fin_cases i; rfl

private def joinCode {α β : Type} {m n : Nat} (a : α ≃ Fin m) (b : β ≃ Fin n) :
    α ⊕ β ≃ Fin (m + n) := (Equiv.sumCongr a b).trans finSumFinEquiv

private def layoutCode : Layout ≃ Fin 21682 :=
  joinCode (Equiv.refl _) <| joinCode finProdFinEquiv <|
    joinCode (Equiv.refl _) <| joinCode finProdFinEquiv <|
    joinCode (Equiv.refl _) <| joinCode (Equiv.refl _) <|
    joinCode (Equiv.refl _) <| joinCode (Equiv.refl _) <|
    joinCode (Equiv.refl _) <| joinCode (Equiv.refl _) <|
    joinCode (Equiv.refl _) <| joinCode finProdFinEquiv <|
    joinCode (Equiv.refl _) <| joinCode (Equiv.refl _) (Equiv.refl _)

/-- Exact paid allocation, proved by finite sum/product equivalences rather than enumeration. -/
def controlEquiv : Control ≃ Fin 21682 := layoutEquiv.trans layoutCode

def encode : Control → Fin 21682 := controlEquiv
def decode : Fin 21682 → Control := controlEquiv.symm

@[simp] theorem decode_encode (control : Control) : decode (encode control) = control :=
  controlEquiv.symm_apply_apply control

@[simp] theorem encode_decode (state : Fin 21682) : encode (decode state) = state :=
  controlEquiv.apply_symm_apply state

theorem control_card : Fintype.card Control = 21682 := by
  simpa using Fintype.card_congr controlEquiv

theorem encode_injective : Function.Injective encode := controlEquiv.injective
theorem encode_surjective : Function.Surjective encode := controlEquiv.surjective

abbrev entry : Fin 21682 := encode (.entry 0)
abbrev done : Fin 21682 := encode .done
abbrev error : Fin 21682 := encode .error

@[simp] theorem entry_eq_zero : entry = 0 := rfl
@[simp] theorem done_val : done.val = 21680 := rfl
@[simp] theorem error_val : error.val = 21681 := rfl

/-- Embed a local offset in its exact tag-specific contiguous allocation region. -/
def tagControl (tag : Fin 7) (index : Nat) (bound : index < tagSize tag) : Control :=
  match h : tag.val with
  | 0 => .row0 ⟨index, by simpa [tagSize, h] using bound⟩
  | 1 => .row1 ⟨index, by simpa [tagSize, h] using bound⟩
  | 2 => .row2 ⟨index, by simpa [tagSize, h] using bound⟩
  | 3 => .row3 ⟨index, by simpa [tagSize, h] using bound⟩
  | 4 => .row4 ⟨index, by simpa [tagSize, h] using bound⟩
  | 5 => .row5 ⟨index, by simpa [tagSize, h] using bound⟩
  | _ => .row6 ⟨index, by simpa [tagSize, h] using bound⟩

def boolIndex (bit : Bool) : Nat := if bit then 1 else 0

theorem boolIndex_le (bit : Bool) : boolIndex bit ≤ 1 := by cases bit <;> decide

/-- Seven physical positions per read context: six seeks followed by one branching row. -/
def readState (context : ReadCtx) (position : Fin 7) : Control :=
  match context with
  | .literal phase parser =>
    .literal phase ⟨7 * parser.val + position.val, by have := parser.isLt; have := position.isLt; omega⟩
  | .tag parser => .tag parser position
  | .operand tag side digit seen =>
    tagControl tag (1127 * side.val + 35 + 84 * digit.val + 7 * boolIndex seen + position.val)
      (by have := side.isLt; have := digit.isLt; have := position.isLt
          have := boolIndex_le seen; have := tagSize_lower tag; omega)

/-- Thirty-five positions implement every emission, with both four-state scanners paid. -/
def emitState (context : EmitCtx) (position : Fin 35) : Control :=
  match context with
  | .literal phase letter =>
    .literal phase ⟨49 + 35 * letter.val + position.val,
      by have := letter.isLt; have := position.isLt; omega⟩
  | .delimiter => .delimiter position
  | .operandCons tag side =>
    tagControl tag (1127 * side.val + position.val)
      (by have := side.isLt; have := position.isLt; have := tagSize_lower tag; omega)
  | .operandBit tag side digit bit =>
    tagControl tag (1127 * side.val + 49 + 84 * digit.val + 35 * boolIndex bit + position.val)
      (by have := side.isLt; have := digit.isLt; have := position.isLt
          have := boolIndex_le bit; have := tagSize_lower tag; omega)
  | .tagCons tag =>
    tagControl tag (2254 + position.val)
      (by have := position.isLt; have := tagSize_lower tag; omega)
  | .tagBit tag digit =>
    tagControl tag (2289 + 35 * digit.val + position.val)
      (by have := digit.isLt; have := position.isLt; rw [tagSize_eq]; omega)

def entryState : Entry → Control
  | .read context => readState context 0
  | .emit context => emitState context 0
  | .finish => .finish 0
  | .error => .error

/-- A rank in the actual string-sorted set of shared read destinations. -/
abbrev ConsumeDest := Fin 583

namespace ConsumeDest

def delimiter : ConsumeDest := 0
def error : ConsumeDest := 1
def finish : ConsumeDest := 2
def postParser (parser : Fin 6) : ConsumeDest := ⟨3 + parser.val, by omega⟩
def postLetter (letter : Letter) : ConsumeDest := ⟨9 + letter.val, by omega⟩
def preParser (parser : Fin 7) : ConsumeDest := ⟨13 + parser.val, by omega⟩
def preLetter (letter : Letter) : ConsumeDest := ⟨20 + letter.val, by omega⟩

/-- Source side order is right/left; sorted names reverse this to left/right. -/
def sideRank (side : Fin 2) : Nat := 1 - side.val

def operandCons (tag : Fin 7) (side : Fin 2) : ConsumeDest :=
  ⟨24 + 79 * tag.val + 39 * sideRank side,
    by have := tag.isLt; have := side.isLt; unfold sideRank; omega⟩

def operandBit (tag : Fin 7) (side : Fin 2) (position : Fin 13) (bit : Bool) : ConsumeDest :=
  ⟨24 + 79 * tag.val + 39 * sideRank side +
    (if position.val = 0 then 1 + boolIndex bit else 3 * position.val + boolIndex bit),
    by have := tag.isLt; have := side.isLt; have := position.isLt; have := boolIndex_le bit
       unfold sideRank; split_ifs <;> omega⟩

/-- Index `p` denotes actual position `p+1`; position-zero unseen reads are not shared targets. -/
def operandZero (tag : Fin 7) (side : Fin 2) (position : Fin 12) : ConsumeDest :=
  ⟨24 + 79 * tag.val + 39 * sideRank side + 5 + 3 * position.val,
    by have := tag.isLt; have := side.isLt; have := position.isLt; unfold sideRank; omega⟩

def tagCons (tag : Fin 7) : ConsumeDest := ⟨24 + 79 * tag.val + 78, by omega⟩
def tagParser (parser : Fin 6) : ConsumeDest := ⟨577 + parser.val, by omega⟩

end ConsumeDest

/-- Decode the exact shared-destination order, rather than constructor or source insertion order. -/
def consumeEntry (destination : ConsumeDest) : Entry :=
  let n := destination.val
  if n = 0 then .emit .delimiter
  else if n = 1 then .error
  else if n = 2 then .finish
  else if h : n < 9 then .read (.literal 0 ⟨n - 2, by omega⟩)
  else if h : n < 13 then .emit (.literal 0 ⟨n - 9, by omega⟩)
  else if h : n < 20 then .read (.literal 1 ⟨n - 13, by omega⟩)
  else if h : n < 24 then .emit (.literal 1 ⟨n - 20, by omega⟩)
  else if h : n < 577 then
    let tag : Fin 7 := ⟨(n - 24) / 79, by omega⟩
    let r := (n - 24) % 79
    if r = 78 then .emit (.tagCons tag)
    else
      let side : Fin 2 := if r < 39 then 1 else 0
      let j := r % 39
      if j = 0 then .emit (.operandCons tag side)
      else if j = 1 then .emit (.operandBit tag side 0 false)
      else if j = 2 then .emit (.operandBit tag side 0 true)
      else
        let position : Fin 13 := ⟨j / 3, by have := Nat.mod_lt r (by decide : 0 < 39); omega⟩
        if j % 3 = 2 then .read (.operand tag side position false)
        else .emit (.operandBit tag side position (decide (j % 3 = 1)))
  else .read (.tag ⟨n - 576, by have := destination.isLt; omega⟩)

def consumeState (destination : ConsumeDest) (position : Fin 8) : Control :=
  .consume destination position

private def literalParserDest (phase : Fin 2) (parser : Fin 6) : ConsumeDest :=
  if phase = 0 then ConsumeDest.postParser parser
  else ConsumeDest.preParser ⟨parser.val + 1, by omega⟩

private def literalLetterDest (phase : Fin 2) (letter : Letter) : ConsumeDest :=
  if phase = 0 then ConsumeDest.postLetter letter else ConsumeDest.preLetter letter

private def literalStopDest (phase : Fin 2) : ConsumeDest :=
  if phase = 0 then ConsumeDest.delimiter else ConsumeDest.finish

/-- Every read branch first selects one of the actual paid shared consume blocks. -/
def readTarget : ReadCtx → Bit → ConsumeDest
  | .literal phase parser, bit =>
    match parser.val with
    | 0 => literalParserDest phase (if bit = 0 then 0 else 1)
    | 1 => literalParserDest phase (if bit = 0 then 2 else 4)
    | 2 => literalParserDest phase (if bit = 0 then 3 else 5)
    | 3 => if bit = 0 then literalStopDest phase else literalLetterDest phase 3
    | 4 => if bit = 0 then literalLetterDest phase 0 else ConsumeDest.error
    | 5 => if bit = 0 then literalLetterDest phase 1 else ConsumeDest.error
    | _ => if bit = 0 then literalLetterDest phase 2 else ConsumeDest.error
  | .tag parser, bit =>
    match parser.val with
    | 0 => ConsumeDest.tagParser (if bit = 0 then 0 else 1)
    | 1 => ConsumeDest.tagParser (if bit = 0 then 2 else 4)
    | 2 => ConsumeDest.tagParser (if bit = 0 then 3 else 5)
    | 3 => ConsumeDest.operandCons (if bit = 0 then 0 else 4) 0
    | 4 => ConsumeDest.operandCons (if bit = 0 then 1 else 5) 0
    | 5 => ConsumeDest.operandCons (if bit = 0 then 2 else 6) 0
    | _ => if bit = 0 then ConsumeDest.operandCons 3 0 else ConsumeDest.preParser 0
  | .operand tag side position seen, bit =>
    if bit = 1 then ConsumeDest.operandBit tag side position true
    else if seen then ConsumeDest.operandBit tag side position false
    else if h : position.val < 12 then ConsumeDest.operandZero tag side ⟨position.val, h⟩
    else if side = 0 then ConsumeDest.operandCons tag 1 else ConsumeDest.tagCons tag

def afterOperand (tag : Fin 7) (side : Fin 2) : Entry :=
  if side = 0 then .emit (.operandCons tag 1) else .emit (.tagCons tag)

def emitTarget : EmitCtx → Entry
  | .literal phase _ => .read (.literal phase 0)
  | .delimiter => .read (.tag 0)
  | .operandCons tag side => .read (.operand tag side 0 false)
  | .operandBit tag side position _ =>
    if h : position.val + 1 < 13 then
      .read (.operand tag side ⟨position.val + 1, h⟩ true)
    else afterOperand tag side
  | .tagCons tag =>
    if h : 0 < tagWidth tag then .emit (.tagBit tag ⟨0, h⟩) else .read (.tag 0)
  | .tagBit tag position =>
    if h : position.val + 1 < tagWidth tag then .emit (.tagBit tag ⟨position.val + 1, h⟩)
    else .read (.tag 0)

/-- Minimal MSB tag digits, explicitly finite and never an operand-sized register. -/
def tagDigit (tag : Fin 7) (position : Fin (tagWidth tag)) : Bool :=
  match tag.val, position.val with
  | 1, _ => true
  | 2, 0 => true
  | 2, _ => false
  | 3, _ => true
  | 4, 0 => true
  | 4, _ => false
  | 5, 1 => false
  | 5, _ => true
  | 6, 2 => false
  | 6, _ => true
  | _, _ => false

def emitLetter : EmitCtx → Letter
  | .literal _ letter => letter
  | .delimiter => 0
  | .operandCons _ _ | .tagCons _ => 1
  | .operandBit _ _ _ bit => if bit then 3 else 2
  | .tagBit tag position => if tagDigit tag position then 3 else 2

def readRow (context : ReadCtx) (position : Fin 7) (bit : Bit) :
    Option (Bit × Dir × Control) :=
  if h : position.val < 6 then
    some (bit, .right, readState context ⟨position.val + 1, by omega⟩)
  else some (0, .left, consumeState (readTarget context bit) 0)

def emitRow (context : EmitCtx) (position : Fin 35) (bit : Bit) :
    Option (Bit × Dir × Control) :=
  let i := position.val
  if i = 0 then some (bit, .left, emitState context 1)
  else if h : i < 5 then
    some (bit, .left, emitState context
      (if bit = 0 then 1 else ⟨i + 1, by omega⟩))
  else if h : i < 10 then some (bit, .right, emitState context ⟨i + 1, by omega⟩)
  else if h : i < 13 then
    some ((Seed.word (emitLetter context)).reverse.getD (i - 10) 0,
      .left, emitState context ⟨i + 1, by omega⟩)
  else if h : i < 19 then
    some (Seed.marker.reverse.getD (i - 13) 0, .left, emitState context ⟨i + 1, by omega⟩)
  else if h : i < 26 then some (bit, .right, emitState context ⟨i + 1, by omega⟩)
  else if h : i < 30 then
    some (bit, .right, emitState context
      (if bit = 0 then 26 else ⟨i + 1, by omega⟩))
  else if h : i < 34 then some (bit, .left, emitState context ⟨i + 1, by omega⟩)
  else some (bit, .left, entryState (emitTarget context))

def consumeRow (destination : ConsumeDest) (position : Fin 8) (bit : Bit) :
    Option (Bit × Dir × Control) :=
  if h : position.val < 6 then
    some (([0, 0, 1, 1, 1, 1] : List Bit).reverse.getD position.val 0,
      .left, consumeState destination ⟨position.val + 1, by omega⟩)
  else if h : position.val < 7 then
    some (bit, .right, consumeState destination ⟨position.val + 1, by omega⟩)
  else some (bit, .right, entryState (consumeEntry destination))

def finishRow (position : Fin 34) (bit : Bit) : Option (Bit × Dir × Control) :=
  let i := position.val
  if h : i < 5 then some (bit, .right, .finish ⟨i + 1, by omega⟩)
  else if h : i < 11 then some (0, .left, .finish ⟨i + 1, by omega⟩)
  else if h : i < 15 then
    some (bit, .left, .finish (if bit = 0 then 11 else ⟨i + 1, by omega⟩))
  else if h : i < 20 then some (bit, .right, .finish ⟨i + 1, by omega⟩)
  else if h : i < 33 then
    some ((Seed.marker ++ [0] ++ Seed.marker).reverse.getD (i - 20) 0,
      .left, .finish ⟨i + 1, by omega⟩)
  else some (bit, .right, .done)

/-- Decode only the local literal-phase offset; read and emit nodes keep insertion order. -/
def literalRow (phase : Fin 2) (position : Fin 189) (bit : Bit) :
    Option (Bit × Dir × Control) :=
  let i := position.val
  if h : i < 49 then
    readRow (.literal phase ⟨i / 7, by omega⟩)
      ⟨i % 7, Nat.mod_lt _ (by decide)⟩ bit
  else
    emitRow (.literal phase ⟨(i - 49) / 35, by have := position.isLt; omega⟩)
      ⟨(i - 49) % 35, Nat.mod_lt _ (by decide)⟩ bit

/-- Within each operand position, reads unseen/seen precede emissions zero/one. -/
def operandRow (tag : Fin 7) (side : Fin 2) (position : Fin 1127) (bit : Bit) :
    Option (Bit × Dir × Control) :=
  let i := position.val
  if h : i < 35 then emitRow (.operandCons tag side) ⟨i, h⟩ bit
  else
    let digit : Fin 13 := ⟨(i - 35) / 84, by have := position.isLt; omega⟩
    let j := (i - 35) % 84
    if h : j < 7 then readRow (.operand tag side digit false) ⟨j, h⟩ bit
    else if h : j < 14 then readRow (.operand tag side digit true) ⟨j - 7, by omega⟩ bit
    else if h : j < 49 then emitRow (.operandBit tag side digit false) ⟨j - 14, by omega⟩ bit
    else emitRow (.operandBit tag side digit true)
      ⟨j - 49, by have := Nat.mod_lt (i - 35) (by decide : 0 < 84); omega⟩ bit

def tagRow (tag : Fin 7) (position : Fin (tagSize tag)) (bit : Bit) :
    Option (Bit × Dir × Control) :=
  let i := position.val
  if h : i < 2254 then
    operandRow tag ⟨i / 1127, by omega⟩ ⟨i % 1127, Nat.mod_lt _ (by decide)⟩ bit
  else if h : i < 2289 then emitRow (.tagCons tag) ⟨i - 2254, by omega⟩ bit
  else
    emitRow (.tagBit tag ⟨(i - 2289) / 35,
      by have bound := position.isLt; rw [tagSize_eq] at bound; omega⟩)
      ⟨(i - 2289) % 35, Nat.mod_lt _ (by decide)⟩ bit

/-- Every paid physical position has both rows; only the designated done rows are absent. -/
def controlRow : Control → Bit → Option (Bit × Dir × Control)
  | .entry i, bit =>
    if h : i.val < 6 then some (bit, .right, .entry ⟨i.val + 1, by omega⟩)
    else some (bit, .right, readState (.literal 0 0) 0)
  | .literal phase i, bit => literalRow phase i bit
  | .delimiter i, bit => emitRow .delimiter i bit
  | .tag parser i, bit => readRow (.tag parser) i bit
  | .row0 i, bit => tagRow 0 i bit
  | .row1 i, bit => tagRow 1 i bit
  | .row2 i, bit => tagRow 2 i bit
  | .row3 i, bit => tagRow 3 i bit
  | .row4 i, bit => tagRow 4 i bit
  | .row5 i, bit => tagRow 5 i bit
  | .row6 i, bit => tagRow 6 i bit
  | .consume destination i, bit => consumeRow destination i bit
  | .finish i, bit => finishRow i bit
  | .done, _ => none
  | .error, bit => some (bit, .right, .error)

def machine : Machine 21682 2 where
  transition state bit := (controlRow (decode state) bit).map
    (fun (write, dir, next) ↦ (write, dir, encode next))

theorem transition_encode (control : Control) (bit : Bit) :
    machine.transition (encode control) bit = (controlRow control bit).map
      (fun (write, dir, next) ↦ (write, dir, encode next)) := by
  simp only [machine, decode_encode]

theorem terminal_done (bit : Bit) : machine.transition done bit = none := by
  rw [transition_encode]
  rfl

theorem transition_error (bit : Bit) :
    machine.transition error bit = some (bit, .right, error) := by
  rw [transition_encode]
  rfl

/-- Numeric rows expose exactly the writes, unit moves, destinations and missing transitions. -/
def numericRow (state : Fin 21682) (bit : Bit) : Option (Bit × Dir × Nat) :=
  (controlRow (decode state) bit).map (fun (write, dir, next) ↦ (write, dir, (encode next).val))

theorem transition_numericRow (state : Fin 21682) (bit : Bit) :
    (machine.transition state bit).map (fun (write, dir, next) ↦ (write, dir, next.val)) =
      numericRow state bit := by
  simp only [machine, numericRow, Option.map_map, Function.comp_def]

end ConjectureMachines.Compilation.TableSeed
