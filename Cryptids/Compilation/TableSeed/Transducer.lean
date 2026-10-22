/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.TableSeed.Format
public import Cryptids.Compilation.TableSeed.Controller

/-! # Valid packets follow the actual source-control graph

This relation records the boundary effects of the controller's paid read and emission blocks.
Its edges use `readTarget`, `consumeEntry`, `emitTarget`, and `emitLetter` directly. It is a
proof abstraction; physical execution and the finishing tape contract are separate obligations.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.TableSeed.Transducer

open Relation

structure Config where
  entry : Entry
  out : List Letter
  raw : List Bit
  gap : Nat

/-- The two boundary effects of the existing paid blocks, without any new runtime operation. -/
inductive Step : Config → Config → Prop where
  | read (context : ReadCtx) (out : List Letter) (bit : Bit) (raw : List Bit) (gap : Nat) :
      Step ⟨.read context, out, bit :: raw, gap⟩
        ⟨consumeEntry (readTarget context bit), out, raw, gap + 1⟩
  | emit (context : EmitCtx) (out : List Letter) (raw : List Bit) (gap : Nat) :
      Step ⟨.emit context, out, raw, gap⟩
        ⟨emitTarget context, emitLetter context :: out, raw, gap⟩

abbrev Path := ReflTransGen Step

theorem read_path (context : ReadCtx) (out : List Letter) (bit : Bit)
    (raw : List Bit) (gap : Nat) :
    Path ⟨.read context, out, bit :: raw, gap⟩
      ⟨consumeEntry (readTarget context bit), out, raw, gap + 1⟩ :=
  .single (.read context out bit raw gap)

theorem emit_path (context : EmitCtx) (out : List Letter) (raw : List Bit) (gap : Nat) :
    Path ⟨.emit context, out, raw, gap⟩
      ⟨emitTarget context, emitLetter context :: out, raw, gap⟩ :=
  .single (.emit context out raw gap)

/-- Position thirteen is the existing continuation after a complete operand. -/
def operandBoundary (tag : Fin 7) (side : Fin 2) (position : Nat) (seen : Bool) : Entry :=
  if bound : position < 13 then .read (.operand tag side ⟨position, bound⟩ seen)
  else afterOperand tag side

theorem operand_zero_unseen (tag : Fin 7) (side : Fin 2) (position : Fin 13) :
    consumeEntry (readTarget (.operand tag side position false) 0) =
      operandBoundary tag side (position.val + 1) false := by
  fin_cases tag <;> fin_cases side <;> fin_cases position <;> rfl

theorem operand_zero_seen (tag : Fin 7) (side : Fin 2) (position : Fin 13) :
    consumeEntry (readTarget (.operand tag side position true) 0) =
      .emit (.operandBit tag side position false) := by
  fin_cases tag <;> fin_cases side <;> fin_cases position <;> rfl

theorem operand_one (tag : Fin 7) (side : Fin 2) (position : Fin 13) (seen : Bool) :
    consumeEntry (readTarget (.operand tag side position seen) 1) =
      .emit (.operandBit tag side position true) := by
  fin_cases tag <;> fin_cases side <;> fin_cases position <;> cases seen <;> rfl

theorem operand_emit_target (tag : Fin 7) (side : Fin 2) (position : Fin 13) (bit : Bool) :
    emitTarget (.operandBit tag side position bit) =
      operandBoundary tag side (position.val + 1) true := rfl

/-- After the optional pending emission, the output is the original word for the new prefix. -/
theorem operand_prefix_step (tag : Fin 7) (side : Fin 2) (position : Fin 13)
    (value : Nat) (bit : Bit) (base : List Letter) (raw : List Bit) (gap : Nat) :
    Path ⟨.read (.operand tag side position (decide (value ≠ 0))),
        W value ++ base, bit :: raw, gap⟩
      ⟨operandBoundary tag side (position.val + 1)
          (decide (Nat.bit (decide (bit = 1)) value ≠ 0)),
        W (Nat.bit (decide (bit = 1)) value) ++ base, raw, gap + 1⟩ := by
  fin_cases bit
  · by_cases zero : value = 0
    · subst value
      simpa only [decide_false, Nat.bit_false_zero, operand_zero_unseen] using
        read_path (.operand tag side position false) (W 0 ++ base) 0 raw gap
    · have read := read_path (.operand tag side position true) (W value ++ base) 0 raw gap
      rw [operand_zero_seen] at read
      have emitted := emit_path (.operandBit tag side position false)
        (W value ++ base) raw (gap + 1)
      rw [operand_emit_target] at emitted
      have nonzero : Nat.bit false value ≠ 0 := by
        simpa only [Nat.bit_eq_zero_iff, and_true] using zero
      simpa [zero, nonzero, emitLetter, bitLetter,
        W_bit false value (Or.inl zero)] using read.trans emitted
  · have read := read_path (.operand tag side position (decide (value ≠ 0)))
      (W value ++ base) 1 raw gap
    rw [operand_one] at read
    have emitted := emit_path (.operandBit tag side position true)
      (W value ++ base) raw (gap + 1)
    rw [operand_emit_target] at emitted
    have nonzero : Nat.bit true value ≠ 0 := by simp [Nat.bit_eq_zero_iff]
    simpa [nonzero, emitLetter, bitLetter, W_bit true value (Or.inr rfl)] using
      read.trans emitted

/-- A suffix of the thirteen-bit field completes the prefix invariant for every bit pattern. -/
theorem operand_suffix (tag : Fin 7) (side : Fin 2) (bits : List Bit)
    (position value : Nat) (base : List Letter) (raw : List Bit) (gap : Nat)
    (width : position + bits.length = 13) :
    Path ⟨operandBoundary tag side position (decide (value ≠ 0)),
        W value ++ base, bits ++ raw, gap⟩
      ⟨afterOperand tag side, W (readValue value bits) ++ base, raw, gap + bits.length⟩ := by
  induction bits generalizing position value gap with
  | nil =>
    have final : position = 13 := by simpa only [List.length_nil, Nat.add_zero] using width
    subst position
    simp only [operandBoundary, Nat.lt_irrefl, ↓reduceDIte, readValue, List.foldl_nil,
      List.nil_append, List.length_nil, Nat.add_zero]
    exact .refl
  | cons bit bits ih =>
    have before : position < 13 := by simp only [List.length_cons] at width; omega
    have nextWidth : position + 1 + bits.length = 13 := by
      simp only [List.length_cons] at width
      omega
    have first := operand_prefix_step tag side ⟨position, before⟩ value bit base (bits ++ raw) gap
    have rest := ih (position + 1) (Nat.bit (decide (bit = 1)) value) (gap + 1) nextWidth
    have combined := first.trans rest
    simpa only [operandBoundary, before, ↓reduceDIte, List.cons_append, readValue,
      List.foldl_cons, List.length_cons, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
      combined

/-- Cons is emitted first; thirteen MSB digits then produce exactly the original natural word. -/
theorem operand_run (tag : Fin 7) (side : Fin 2) (value : Fin 8192)
    (out : List Letter) (raw : List Bit) (gap : Nat) :
    Path ⟨.emit (.operandCons tag side), out, fieldBits value ++ raw, gap⟩
      ⟨afterOperand tag side, W value.val ++ out, raw, gap + 13⟩ := by
  have first := emit_path (.operandCons tag side) out (fieldBits value ++ raw) gap
  have rest := operand_suffix tag side (fieldBits value) 0 0 out raw gap (by simp)
  have ready : Path ⟨emitTarget (.operandCons tag side),
      emitLetter (.operandCons tag side) :: out, fieldBits value ++ raw, gap⟩
      ⟨afterOperand tag side, W value.val ++ out, raw, gap + 13⟩ := by
    simpa only [emitTarget, emitLetter, operandBoundary, Nat.zero_lt_succ, ↓reduceDIte,
      decide_false, W_zero, consLetter, List.singleton_append, fieldBits_value,
      fieldBits_length] using rest
  exact first.trans ready

/-- A finite read trace computes only the existing source graph's read continuations. -/
def readTrace : List Bit → Entry → Option Entry
  | [], entry => some entry
  | bit :: bits, .read context => readTrace bits (consumeEntry (readTarget context bit))
  | _ :: _, _ => none

theorem readTrace_path (bits : List Bit) (initial final : Entry)
    (checked : readTrace bits initial = some final)
    (out : List Letter) (raw : List Bit) (gap : Nat) :
    Path ⟨initial, out, bits ++ raw, gap⟩ ⟨final, out, raw, gap + bits.length⟩ := by
  induction bits generalizing initial gap with
  | nil =>
    have same : initial = final := Option.some.inj checked
    subst initial
    simpa only [List.nil_append, List.length_nil, Nat.add_zero] using
      (ReflTransGen.refl : Path ⟨final, out, raw, gap⟩ ⟨final, out, raw, gap⟩)
  | cons bit bits ih =>
    cases initial with
    | read context =>
      have rest := ih (consumeEntry (readTarget context bit)) checked (gap + 1)
      simpa only [List.cons_append, List.length_cons, Nat.add_assoc, Nat.add_comm,
        Nat.add_left_comm] using (read_path context out bit (bits ++ raw) gap).trans rest
    | emit context => simp only [readTrace, reduceCtorEq] at checked
    | finish => simp only [readTrace, reduceCtorEq] at checked
    | error => simp only [readTrace, reduceCtorEq] at checked

theorem literal_decode (phase : Fin 2) (letter : Letter) :
    readTrace (Seed.word letter) (.read (.literal phase 0)) =
      some (.emit (.literal phase letter)) := by
  fin_cases phase <;> fin_cases letter <;> rfl

theorem literal_stop_decode (phase : Fin 2) :
    readTrace [0, 0, 0] (.read (.literal phase 0)) =
      some (if phase = 0 then .emit .delimiter else .finish) := by
  fin_cases phase <;> rfl

theorem tag_decode (tag : Fin 7) :
    readTrace (tagBits tag) (.read (.tag 0)) = some (.emit (.operandCons tag 0)) := by
  fin_cases tag <;> rfl

theorem tag_stop_decode :
    readTrace [1, 1, 1] (.read (.tag 0)) = some (.read (.literal 1 0)) := rfl

/-- The returned list is in prepend order, and every edge is an actual emission continuation. -/
def emitTrace : Nat → Entry → Option (List Letter × Entry)
  | 0, entry => some ([], entry)
  | count + 1, .emit context =>
      (emitTrace count (emitTarget context)).map
        (fun (word, entry) ↦ (word ++ [emitLetter context], entry))
  | _ + 1, _ => none

theorem emitTrace_path (count : Nat) (initial final : Entry) (word : List Letter)
    (checked : emitTrace count initial = some (word, final))
    (out : List Letter) (raw : List Bit) (gap : Nat) :
    Path ⟨initial, out, raw, gap⟩ ⟨final, word ++ out, raw, gap⟩ := by
  induction count generalizing initial word out with
  | zero =>
    have same : ([], initial) = (word, final) := Option.some.inj checked
    cases same
    exact .refl
  | succ count ih =>
    cases initial with
    | emit context =>
      cases tail : emitTrace count (emitTarget context) with
      | none => simp only [emitTrace, tail, Option.map_none, reduceCtorEq] at checked
      | some result =>
        rcases result with ⟨tailWord, tailEntry⟩
        have same : (tailWord ++ [emitLetter context], tailEntry) = (word, final) := by
          simpa only [emitTrace, tail, Option.map_some, Option.some.injEq] using checked
        cases same
        have rest := ih (emitTarget context) tailWord tail (emitLetter context :: out)
        simpa only [List.append_assoc, List.singleton_append] using
          (emit_path context out raw gap).trans rest
    | read context => simp only [emitTrace, reduceCtorEq] at checked
    | finish => simp only [emitTrace, reduceCtorEq] at checked
    | error => simp only [emitTrace, reduceCtorEq] at checked

theorem tag_emit_trace (tag : Fin 7) :
    emitTrace (tagWidth tag + 1) (.emit (.tagCons tag)) =
      some (W tag.val, .read (.tag 0)) := by
  fin_cases tag <;> rfl

end ConjectureMachines.Compilation.TableSeed.Transducer
