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
  · change Path ⟨.read (.operand tag side position (decide (value ≠ 0))),
        W value ++ base, 0 :: raw, gap⟩
      ⟨operandBoundary tag side (position.val + 1) (decide (Nat.bit false value ≠ 0)),
        W (Nat.bit false value) ++ base, raw, gap + 1⟩
    by_cases zero : value = 0
    · subst value
      change Path ⟨.read (.operand tag side position false), W 0 ++ base, 0 :: raw, gap⟩
        ⟨operandBoundary tag side (position.val + 1) false, W 0 ++ base, raw, gap + 1⟩
      have read := read_path (.operand tag side position false) (W 0 ++ base) 0 raw gap
      rwa [operand_zero_unseen] at read
    · have read := read_path (.operand tag side position true) (W value ++ base) 0 raw gap
      rw [operand_zero_seen] at read
      have emitted := emit_path (.operandBit tag side position false)
        (W value ++ base) raw (gap + 1)
      rw [operand_emit_target] at emitted
      have nonzero : Nat.bit false value ≠ 0 := by
        intro equal
        exact zero (Nat.bit_eq_zero_iff.mp equal).1
      have seen : decide (value ≠ 0) = true := decide_eq_true_eq.mpr zero
      have newSeen : decide (Nat.bit false value ≠ 0) = true := decide_eq_true_eq.mpr nonzero
      rw [seen, newSeen, W_bit false value (Or.inl zero)]
      exact read.trans emitted
  · change Path ⟨.read (.operand tag side position (decide (value ≠ 0))),
        W value ++ base, 1 :: raw, gap⟩
      ⟨operandBoundary tag side (position.val + 1) (decide (Nat.bit true value ≠ 0)),
        W (Nat.bit true value) ++ base, raw, gap + 1⟩
    have read := read_path (.operand tag side position (decide (value ≠ 0)))
      (W value ++ base) 1 raw gap
    rw [operand_one] at read
    have emitted := emit_path (.operandBit tag side position true)
      (W value ++ base) raw (gap + 1)
    rw [operand_emit_target] at emitted
    have nonzero : Nat.bit true value ≠ 0 := by
      intro equal
      cases (Nat.bit_eq_zero_iff.mp equal).2
    have newSeen : decide (Nat.bit true value ≠ 0) = true := decide_eq_true_eq.mpr nonzero
    rw [newSeen, W_bit true value (Or.inr rfl)]
    exact read.trans emitted

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
    have unseen : decide ((0 : Nat) ≠ 0) = false := rfl
    have zeroPosition (bound : (0 : Nat) < 13) : (⟨0, bound⟩ : Fin 13) = 0 :=
      Fin.ext rfl
    simpa only [emitTarget, emitLetter, operandBoundary, Nat.zero_lt_succ, ↓reduceDIte,
      unseen, zeroPosition, W_zero, consLetter, List.singleton_append, fieldBits_value,
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

set_option maxRecDepth 4096 in
theorem literal_decode (phase : Fin 2) (letter : Letter) :
    readTrace (Seed.word letter) (.read (.literal phase 0)) =
      some (.emit (.literal phase letter)) := by
  fin_cases phase <;> fin_cases letter <;> rfl

set_option maxRecDepth 4096 in
theorem literal_stop_decode (phase : Fin 2) :
    readTrace [0, 0, 0] (.read (.literal phase 0)) =
      some (if phase = 0 then .emit .delimiter else .finish) := by
  fin_cases phase <;> rfl

set_option maxRecDepth 4096 in
theorem tag_decode (tag : Fin 7) :
    readTrace (tagBits tag) (.read (.tag 0)) = some (.emit (.operandCons tag 0)) := by
  fin_cases tag <;> rfl

set_option maxRecDepth 4096 in
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

set_option maxRecDepth 4096 in
theorem tag_emit_trace (tag : Fin 7) :
    emitTrace (tagWidth tag + 1) (.emit (.tagCons tag)) =
      some (W tag.val, .read (.tag 0)) := by
  fin_cases tag <;> rfl

theorem literal_run (phase : Fin 2) (letter : Letter)
    (out : List Letter) (raw : List Bit) (gap : Nat) :
    Path ⟨.read (.literal phase 0), out, Seed.word letter ++ raw, gap⟩
      ⟨.read (.literal phase 0), letter :: out, raw, gap + (Seed.word letter).length⟩ := by
  have read := readTrace_path (Seed.word letter) _ _ (literal_decode phase letter) out raw gap
  exact read.trans (emit_path (.literal phase letter) out raw
    (gap + (Seed.word letter).length))

/-- Literal phases consume every supplied code and prepend their letters in read order. -/
theorem literals_run (phase : Fin 2) (values : List Letter)
    (out : List Letter) (raw : List Bit) (gap : Nat) :
    Path ⟨.read (.literal phase 0), out, Seed.payload values ++ raw, gap⟩
      ⟨.read (.literal phase 0), values.foldl (fun acc letter ↦ letter :: acc) out,
        raw, gap + (Seed.payload values).length⟩ := by
  induction values generalizing out gap with
  | nil =>
    simpa only [Seed.payload_nil, List.nil_append, List.foldl_nil,
      List.length_nil, Nat.add_zero] using
      (ReflTransGen.refl : Path ⟨.read (.literal phase 0), out, raw, gap⟩
        ⟨.read (.literal phase 0), out, raw, gap⟩)
  | cons letter values ih =>
    have first := literal_run phase letter out (Seed.payload values ++ raw) gap
    have rest := ih (out := letter :: out) (gap := gap + (Seed.word letter).length)
    simpa only [Seed.payload_cons, List.append_assoc, List.foldl_cons,
      List.length_append, Nat.add_assoc] using first.trans rest

theorem reversed_literals_run (phase : Fin 2) (values : List Letter)
    (out : List Letter) (raw : List Bit) (gap : Nat) :
    Path ⟨.read (.literal phase 0), out, Seed.payload values.reverse ++ raw, gap⟩
      ⟨.read (.literal phase 0), values ++ out,
        raw, gap + (Seed.payload values.reverse).length⟩ := by
  simpa only [literals_reverse] using literals_run phase values.reverse out raw gap

/-- Every bounded triple is processed right, left, then tag, producing its original word order. -/
theorem row_run (row : Row) (out : List Letter) (raw : List Bit) (gap : Nat) :
    Path ⟨.read (.tag 0), out, rowBits row ++ raw, gap⟩
      ⟨.read (.tag 0), rowLetters row ++ out, raw, gap + (rowBits row).length⟩ := by
  have parsed := readTrace_path (tagBits row.tag) _ _ (tag_decode row.tag)
    out (fieldBits row.right ++ (fieldBits row.left ++ raw)) gap
  simp only [tagBits_length] at parsed
  have rightRun := operand_run row.tag 0 row.right out
    (fieldBits row.left ++ raw) (gap + 3)
  have leftRun := operand_run row.tag 1 row.left (W row.right.val ++ out)
    raw (gap + 3 + 13)
  have tagged := emitTrace_path (tagWidth row.tag + 1) _ _ (W row.tag.val)
    (tag_emit_trace row.tag) (W row.left.val ++ (W row.right.val ++ out))
    raw (gap + 3 + 13 + 13)
  have combined := ((parsed.trans rightRun).trans leftRun).trans tagged
  simpa only [rowBits, rowLetters, List.append_assoc, List.length_append,
    tagBits_length, fieldBits_length, Nat.add_assoc] using combined

theorem rows_run (rows : List Row) (out : List Letter) (raw : List Bit) (gap : Nat) :
    Path ⟨.read (.tag 0), out, rows.flatMap rowBits ++ raw, gap⟩
      ⟨.read (.tag 0), rows.foldl (fun acc row ↦ rowLetters row ++ acc) out,
        raw, gap + (rows.flatMap rowBits).length⟩ := by
  induction rows generalizing out gap with
  | nil => exact .refl
  | cons row rows ih =>
    have first := row_run row out (rows.flatMap rowBits ++ raw) gap
    have rest := ih (out := rowLetters row ++ out) (gap := gap + (rowBits row).length)
    simpa only [List.flatMap_cons, List.append_assoc, List.foldl_cons,
      List.length_append, Nat.add_assoc] using first.trans rest

theorem reversed_rows_run (rows : List Row) (out : List Letter) (raw : List Bit) (gap : Nat) :
    Path ⟨.read (.tag 0), out, rows.reverse.flatMap rowBits ++ raw, gap⟩
      ⟨.read (.tag 0), rows.flatMap rowLetters ++ out,
        raw, gap + (rows.reverse.flatMap rowBits).length⟩ := by
  simpa only [rows_reverse] using rows_run rows.reverse out raw gap

end ConjectureMachines.Compilation.TableSeed.Transducer
