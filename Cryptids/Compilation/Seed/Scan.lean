/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.FlatInit
public import Cryptids.Compilation.FieldBinary.Fields

/-! # Exact finite traversal by a four-one scanner

The hypotheses name only the caller's actual transition rows. Safe finite words move the head
without changing any tape cell. The zipper contracts permit arbitrary exterior tape frames.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.Seed.Scan

open Turing FieldBinary

/-- The counter resets at zero; a fourth consecutive one exits the scanner. -/
def advance (run : Fin 4) (bit : Fin 2) : Option (Fin 4) :=
  if bit = 0 then some 0 else
    if bound : run.val < 3 then some ⟨run.val + 1, by omega⟩ else none

/-- Pure finite-word traversal; `none` means the word encounters the exit marker. -/
def scanWord : List (Fin 2) → Fin 4 → Option (Fin 4)
  | [], run => some run
  | bit :: bits, run => (advance run bit).bind (scanWord bits)

/-- A caller's scanner states and exit interpreted through the counter transition. -/
def target {q : Nat} (scanner : Fin 4 → Fin q) (exit : Fin q)
    (run : Fin 4) (bit : Fin 2) : Fin q :=
  ((advance run bit).map scanner).getD exit

/-- Only the eight scanning rows are prescribed; all other machine rows are unrestricted. -/
def Rows {q : Nat} (M : Machine q 2) (scanner : Fin 4 → Fin q)
    (exit : Fin q) (dir : Dir) : Prop :=
  ∀ run bit, M.transition (scanner run) bit = some (bit, dir, target scanner exit run bit)

/-- Read the given finite word while moving in one fixed direction. -/
def Reads (dir : Dir) : Tape (Fin 2) → List (Fin 2) → Prop
  | _, [] => True
  | tape, bit :: bits => tape.head = bit ∧ Reads dir (tape.move dir) bits

@[simp] theorem scanWord_nil (run : Fin 4) : scanWord [] run = some run := rfl

@[simp] theorem advance_zero (run : Fin 4) : advance run 0 = some 0 := by
  simp [advance]

/-- Word concatenation composes the exact counter computations. -/
theorem scanWord_append (first second : List (Fin 2)) (run : Fin 4) :
    scanWord (first ++ second) run = (scanWord first run).bind (scanWord second) := by
  induction first generalizing run with
  | nil => rfl
  | cons bit bits ih => simp only [List.cons_append, scanWord, ih, Option.bind_assoc]

/-- A run of blanks preserves counter zero, including the empty word. -/
@[simp] theorem scanWord_zeros (n : Nat) :
    scanWord (List.replicate n 0) 0 = some 0 := by
  induction n with
  | zero => rfl
  | succ n ih => simp only [List.replicate_succ, scanWord, advance_zero, Option.bind_some, ih]

/-- A nonempty run of blanks resets every initial counter. -/
@[simp] theorem scanWord_zeros_reset (n : Nat) (run : Fin 4) :
    scanWord (List.replicate (n + 1) 0) run = some 0 := by
  simp only [List.replicate_succ, scanWord, advance_zero, Option.bind_some, scanWord_zeros]

/-- Any three bits followed by a zero form a safe group and reset the scanner. -/
theorem scanWord_three_zero (a b c : Fin 2) : scanWord [a, b, c, 0] 0 = some 0 := by
  fin_cases a <;> fin_cases b <;> fin_cases c <;> simp [scanWord, advance]

/-- A list of groups that each start and end at counter zero is itself safe. -/
theorem scanWord_flatMap {α : Type} (group : α → List (Fin 2)) (items : List α)
    (safe : ∀ item ∈ items, scanWord (group item) 0 = some 0) :
    scanWord (items.flatMap group) 0 = some 0 := by
  induction items with
  | nil => rfl
  | cons item items ih =>
    rw [List.flatMap_cons, scanWord_append, safe item (by simp), Option.bind_some]
    exact ih (fun other member ↦ safe other (by simp [member]))

@[simp] theorem scanWord_fourOnes : scanWord [1, 1, 1, 1] 0 = none := by
  simp [scanWord, advance]

/-- Reading a concatenation exposes the tape position between its two words. -/
theorem reads_append (dir : Dir) (tape : Tape (Fin 2)) (first second : List (Fin 2)) :
    Reads dir tape (first ++ second) ↔
      Reads dir tape first ∧ Reads dir (shift dir first.length tape) second := by
  induction first generalizing tape with
  | nil => simp [Reads, shift]
  | cons bit bits ih => simp [Reads, shift, ih, and_assoc]

/-- A left-inclusive zipper, dual to `Tape.mk'`. -/
def mkLeft (left right : ListBlank (Fin 2)) : Tape (Fin 2) :=
  ⟨left.head, left.tail, right⟩

@[simp] theorem mkLeft_cons (bit : Fin 2) (left right : ListBlank (Fin 2)) :
    mkLeft (left.cons bit) right = Tape.mk' left (right.cons bit) := by
  simp [mkLeft, Tape.mk']

@[simp] theorem move_left_mkLeft (left right : ListBlank (Fin 2)) :
    (mkLeft left right).move .left = mkLeft left.tail (right.cons left.head) := by
  simp [mkLeft, Tape.move]

/-- Every finite right prefix can be read, regardless of either infinite exterior frame. -/
theorem reads_right (bits : List (Fin 2)) (left right : ListBlank (Fin 2)) :
    Reads .right (Tape.mk' left (ListBlank.append bits right)) bits := by
  induction bits generalizing left with
  | nil => trivial
  | cons bit bits ih =>
    simpa only [Reads, ListBlank.append, Tape.mk'_head, ListBlank.head_cons,
      Tape.move_right_mk', ListBlank.tail_cons, eq_self_iff_true, true_and] using ih (left.cons bit)

/-- Exact right traversal transfers the reversed prefix to the left frame. -/
theorem shift_right_prefix (bits : List (Fin 2)) (left right : ListBlank (Fin 2)) :
    shift .right bits.length (Tape.mk' left (ListBlank.append bits right)) =
      Tape.mk' (ListBlank.append bits.reverse left) right := by
  induction bits generalizing left with
  | nil => rfl
  | cons bit bits ih =>
    simp only [List.length_cons, shift, ListBlank.append, Tape.move_right_mk',
      ListBlank.head_cons, ListBlank.tail_cons, ih]
    simp only [List.reverse_cons, ListBlank.append_assoc, ListBlank.append]

/-- Every finite left prefix can be read, regardless of either infinite exterior frame. -/
theorem reads_left (bits : List (Fin 2)) (left right : ListBlank (Fin 2)) :
    Reads .left (mkLeft (ListBlank.append bits left) right) bits := by
  induction bits generalizing right with
  | nil => trivial
  | cons bit bits ih =>
    simpa only [Reads, ListBlank.append, mkLeft, ListBlank.head_cons, ListBlank.tail_cons,
      Tape.move, eq_self_iff_true, true_and] using ih (right.cons bit)

/-- Exact left traversal transfers the reversed prefix to the right frame. -/
theorem shift_left_prefix (bits : List (Fin 2)) (left right : ListBlank (Fin 2)) :
    shift .left bits.length (mkLeft (ListBlank.append bits left) right) =
      mkLeft left (ListBlank.append bits.reverse right) := by
  induction bits generalizing right with
  | nil => rfl
  | cons bit bits ih =>
    simp only [List.length_cons, shift, ListBlank.append, move_left_mkLeft,
      ListBlank.head_cons, ListBlank.tail_cons, ih]
    simp only [List.reverse_cons, ListBlank.append_assoc, ListBlank.append]

/-- One scanner row preserves the scanned symbol before moving. -/
theorem step_row {q : Nat} (M : Machine q 2) (scanner : Fin 4 → Fin q) (exit : Fin q)
    (dir : Dir) (rows : Rows M scanner exit dir) (run : Fin 4) (tape : Tape (Fin 2)) :
    step M ⟨scanner run, tape⟩ =
      some ⟨target scanner exit run tape.head, tape.move dir⟩ := by
  simp only [step, rows run tape.head, Option.map_some, Tape.write_self]

/-- Safe words execute in exactly one machine step per bit and preserve the complete tape. -/
theorem run_safe {q : Nat} (M : Machine q 2) (scanner : Fin 4 → Fin q) (exit : Fin q)
    (dir : Dir) (rows : Rows M scanner exit dir) (bits : List (Fin 2))
    (run final : Fin 4) (tape : Tape (Fin 2))
    (safe : scanWord bits run = some final) (read : Reads dir tape bits) :
    FlatInit.runFrom M bits.length ⟨scanner run, tape⟩ =
      some ⟨scanner final, shift dir bits.length tape⟩ := by
  induction bits generalizing run final tape with
  | nil =>
    have same : run = final := Option.some.inj safe
    subst final
    rfl
  | cons bit bits ih =>
    rcases read with ⟨head, tail⟩
    cases next : advance run bit with
    | none => simp [scanWord, next] at safe
    | some middle =>
      have rest : scanWord bits middle = some final := by
        simpa only [scanWord, next, Option.bind_some] using safe
      simpa only [List.length_cons, FlatInit.runFrom, step_row M scanner exit dir rows,
        head, target, next, Option.map_some, Option.getD_some, Option.bind_some, shift]
        using ih middle final (tape.move dir) rest tail

/-- From counter zero, four consecutive ones reach the exit in exactly four steps. -/
theorem run_fourOnes {q : Nat} (M : Machine q 2) (scanner : Fin 4 → Fin q) (exit : Fin q)
    (dir : Dir) (rows : Rows M scanner exit dir) (tape : Tape (Fin 2))
    (read : Reads dir tape [1, 1, 1, 1]) :
    FlatInit.runFrom M 4 ⟨scanner 0, tape⟩ = some ⟨exit, shift dir 4 tape⟩ := by
  rcases read with ⟨h0, h1, h2, h3, _⟩
  simp [FlatInit.runFrom, step_row M scanner exit dir rows, h0, h1, h2, h3,
    target, advance, shift]

/-- Safe arbitrary content followed by four ones reaches the exit with an exact step count. -/
theorem run_safe_fourOnes {q : Nat} (M : Machine q 2) (scanner : Fin 4 → Fin q)
    (exit : Fin q) (dir : Dir) (rows : Rows M scanner exit dir)
    (bits : List (Fin 2)) (tape : Tape (Fin 2))
    (safe : scanWord bits 0 = some 0) (read : Reads dir tape (bits ++ [1, 1, 1, 1])) :
    FlatInit.runFrom M (bits.length + 4) ⟨scanner 0, tape⟩ =
      some ⟨exit, shift dir (bits.length + 4) tape⟩ := by
  have compose : ∀ (n m : Nat) (cfg : Cfg q 2),
      FlatInit.runFrom M (n + m) cfg =
        (FlatInit.runFrom M n cfg).bind (FlatInit.runFrom M m) := by
    intro n m cfg
    induction n generalizing cfg with
    | zero => simp only [Nat.zero_add, FlatInit.runFrom, Option.bind_some]
    | succ n ih => simp only [Nat.succ_add, FlatInit.runFrom, ih, Option.bind_assoc]
  obtain ⟨first, last⟩ := (reads_append dir tape bits [1, 1, 1, 1]).mp read
  rw [compose, run_safe M scanner exit dir rows bits 0 0 tape safe first,
    Option.bind_some, run_fourOnes M scanner exit dir rows _ last, shift_add]

end ConjectureMachines.Compilation.Seed.Scan
