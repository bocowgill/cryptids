/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.Seed.Scan
public import Cryptids.Compilation.Seed.Format

/-! # Scanning compact three-bit output words

Compact words preserve a bounded counter across their boundaries. Framed execution lemmas
use the caller's paid scanner rows and leave all exterior tape frames unrestricted.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.TableSeed.Scan

open Turing FieldBinary

/-- Every forward code is safe from counter at most one and ends at counter at most one. -/
theorem word_forward (letter : Seed.Letter) (run : Fin 4) (bound : run.val ≤ 1) :
    ∃ final : Fin 4, Seed.Scan.scanWord (Seed.word letter) run = some final ∧ final.val ≤ 1 := by
  fin_cases letter <;> fin_cases run <;> norm_num at bound
  all_goals decide

/-- Reversed codes preserve the larger bound required by adjacent reversed words. -/
theorem word_reverse (letter : Seed.Letter) (run : Fin 4) (bound : run.val ≤ 2) :
    ∃ final : Fin 4,
      Seed.Scan.scanWord (Seed.word letter).reverse run = some final ∧ final.val ≤ 2 := by
  fin_cases letter <;> fin_cases run <;> norm_num at bound
  all_goals decide

/-- Forward traversal of arbitrarily many compact words preserves the boundary bound. -/
theorem payload_forward (letters : List Seed.Letter) (run : Fin 4) (bound : run.val ≤ 1) :
    ∃ final : Fin 4,
      Seed.Scan.scanWord (Seed.payload letters) run = some final ∧ final.val ≤ 1 := by
  induction letters generalizing run with
  | nil => exact ⟨run, rfl, bound⟩
  | cons letter letters ih =>
    obtain ⟨middle, first, middleBound⟩ := word_forward letter run bound
    obtain ⟨final, rest, finalBound⟩ := ih middle middleBound
    refine ⟨final, ?_, finalBound⟩
    rw [Seed.payload_cons, Seed.Scan.scanWord_append, first, Option.bind_some, rest]

/-- Reversing a complete payload processes its final word first and preserves counter ≤2. -/
theorem payload_reverse (letters : List Seed.Letter) (run : Fin 4) (bound : run.val ≤ 2) :
    ∃ final : Fin 4,
      Seed.Scan.scanWord (Seed.payload letters).reverse run = some final ∧ final.val ≤ 2 := by
  induction letters generalizing run with
  | nil => exact ⟨run, rfl, bound⟩
  | cons letter letters ih =>
    obtain ⟨middle, first, middleBound⟩ := ih run bound
    obtain ⟨final, rest, finalBound⟩ := word_reverse letter middle middleBound
    refine ⟨final, ?_, finalBound⟩
    rw [Seed.payload_cons, List.reverse_append, Seed.Scan.scanWord_append, first,
      Option.bind_some, rest]

/-- A final zero resets every counter produced by a successful finite scan. -/
theorem append_zero (bits : List (Fin 2)) (run final : Fin 4)
    (safe : Seed.Scan.scanWord bits run = some final) :
    Seed.Scan.scanWord (bits ++ [0]) run = some 0 := by
  simp only [Seed.Scan.scanWord_append, safe, Option.bind_some, Seed.Scan.scanWord,
    Seed.Scan.advance_zero]

/-- A right boundary zero resets a compact forward payload. -/
theorem payload_forward_guard (letters : List Seed.Letter) (run : Fin 4)
    (bound : run.val ≤ 1) :
    Seed.Scan.scanWord (Seed.payload letters ++ [0]) run = some 0 := by
  obtain ⟨final, safe, _⟩ := payload_forward letters run bound
  exact append_zero _ run final safe

/-- A left boundary zero resets a compact reversed payload. -/
theorem payload_reverse_guard (letters : List Seed.Letter) (run : Fin 4)
    (bound : run.val ≤ 2) :
    Seed.Scan.scanWord ((Seed.payload letters).reverse ++ [0]) run = some 0 := by
  obtain ⟨final, safe, _⟩ := payload_reverse letters run bound
  exact append_zero _ run final safe

/-- A nonempty gap resets the counter after any compact forward payload. -/
theorem payload_gap_forward (letters : List Seed.Letter) (gap : Nat) (positive : 0 < gap)
    (run : Fin 4) (bound : run.val ≤ 1) :
    Seed.Scan.scanWord (Seed.payload letters ++ List.replicate gap 0) run = some 0 := by
  obtain ⟨final, safe, _⟩ := payload_forward letters run bound
  cases gap with
  | zero => omega
  | succ gap =>
    rw [Seed.Scan.scanWord_append, safe, Option.bind_some]
    exact Seed.Scan.scanWord_zeros_reset gap final

/-- The marker's leading zero also covers an empty gap after a forward payload. -/
theorem payload_gap_guard (letters : List Seed.Letter) (gap : Nat) (run : Fin 4)
    (bound : run.val ≤ 1) :
    Seed.Scan.scanWord ((Seed.payload letters ++ List.replicate gap 0) ++ [0]) run =
      some 0 := by
  obtain ⟨final, safe, _⟩ := payload_forward letters run bound
  rw [List.append_assoc, Seed.Scan.scanWord_append, safe, Option.bind_some,
    ← List.replicate_succ']
  exact Seed.Scan.scanWord_zeros_reset gap final

/-- Starting at zero, any initial gap and reversed compact payload safely reach A's guard. -/
theorem gap_payload_reverse_guard (letters : List Seed.Letter) (gap : Nat) :
    Seed.Scan.scanWord ((List.replicate gap 0 ++ (Seed.payload letters).reverse) ++ [0]) 0 =
      some 0 := by
  rw [List.append_assoc, Seed.Scan.scanWord_append, Seed.Scan.scanWord_zeros, Option.bind_some]
  exact payload_reverse_guard letters 0 (by decide)

/-- A nonempty initial gap permits every initial counter before the reversed payload. -/
theorem nonempty_gap_payload_reverse_guard (letters : List Seed.Letter) (gap : Nat)
    (positive : 0 < gap) (run : Fin 4) :
    Seed.Scan.scanWord ((List.replicate gap 0 ++ (Seed.payload letters).reverse) ++ [0]) run =
      some 0 := by
  cases gap with
  | zero => omega
  | succ gap =>
    rw [List.append_assoc, Seed.Scan.scanWord_append, Seed.Scan.scanWord_zeros_reset,
      Option.bind_some]
    exact payload_reverse_guard letters 0 (by decide)

/-- A left scanner reaches A's left guard in exactly the guarded-prefix length.

The preceding left move belongs to the caller's paid path. Both exterior frames are arbitrary.
-/
theorem left_marker {q : Nat} (M : Machine q 2) (scanner : Fin 4 → Fin q) (exit : Fin q)
    (rows : Seed.Scan.Rows M scanner exit .left) (bits : List (Fin 2))
    (safe : Seed.Scan.scanWord (bits ++ [0]) 0 = some 0)
    (left right : ListBlank (Fin 2)) :
    FlatInit.runFrom M (bits.length + 5)
      ⟨scanner 0,
        (Tape.mk' (ListBlank.append (bits ++ Seed.marker.reverse) left) right).move .left⟩ =
      some ⟨exit, Tape.mk' left (ListBlank.append (Seed.marker ++ bits.reverse) right)⟩ := by
  let scanBits := bits ++ [0, 1, 1, 1, 1]
  have start :
      (Tape.mk' (ListBlank.append (bits ++ Seed.marker.reverse) left) right).move .left =
        Seed.Scan.mkLeft (ListBlank.append scanBits (left.cons 0)) right := by
    simp [scanBits, Seed.marker, ListBlank.append_assoc, ListBlank.append, Seed.Scan.mkLeft,
      Tape.mk', Tape.move]
  have read : Seed.Scan.Reads .left
      (Seed.Scan.mkLeft (ListBlank.append scanBits (left.cons 0)) right)
      ((bits ++ [0]) ++ [1, 1, 1, 1]) := by
    simpa only [scanBits, List.append_assoc, List.cons_append, List.nil_append] using
      Seed.Scan.reads_left scanBits (left.cons 0) right
  have traversed := Seed.Scan.run_safe_fourOnes M scanner exit .left rows (bits ++ [0])
    (Seed.Scan.mkLeft (ListBlank.append scanBits (left.cons 0)) right) safe read
  have shifted :
      shift .left ((bits ++ [0]).length + 4)
          (Seed.Scan.mkLeft (ListBlank.append scanBits (left.cons 0)) right) =
        Tape.mk' left (ListBlank.append (Seed.marker ++ bits.reverse) right) := by
    simpa [scanBits, Seed.marker, List.reverse_append, List.append_assoc, ListBlank.append_assoc,
      ListBlank.append] using Seed.Scan.shift_left_prefix scanBits (left.cons 0) right
  rw [shifted] at traversed
  simpa only [start, List.length_append, List.length_cons, List.length_nil, Nat.add_zero,
    Nat.add_assoc] using traversed

/-- A right scanner exits at B's final zero, after reading its fourth one.

This contract ends at B+5. The five paid return moves belong to the caller's subsequent path.
-/
theorem right_marker {q : Nat} (M : Machine q 2) (scanner : Fin 4 → Fin q) (exit : Fin q)
    (rows : Seed.Scan.Rows M scanner exit .right) (bits : List (Fin 2))
    (safe : Seed.Scan.scanWord (bits ++ [0]) 0 = some 0)
    (left right : ListBlank (Fin 2)) :
    FlatInit.runFrom M (bits.length + 5)
      ⟨scanner 0, Tape.mk' left (ListBlank.append (bits ++ Seed.marker) right)⟩ =
      some ⟨exit,
        Tape.mk' (ListBlank.append (bits ++ [0, 1, 1, 1, 1]).reverse left) (right.cons 0)⟩ := by
  let scanBits := bits ++ [0, 1, 1, 1, 1]
  have start : Tape.mk' left (ListBlank.append (bits ++ Seed.marker) right) =
      Tape.mk' left (ListBlank.append scanBits (right.cons 0)) := by
    simp [scanBits, Seed.marker, ListBlank.append_assoc, ListBlank.append]
  have read : Seed.Scan.Reads .right (Tape.mk' left (ListBlank.append scanBits (right.cons 0)))
      ((bits ++ [0]) ++ [1, 1, 1, 1]) := by
    simpa only [scanBits, List.append_assoc, List.cons_append, List.nil_append] using
      Seed.Scan.reads_right scanBits left (right.cons 0)
  have traversed := Seed.Scan.run_safe_fourOnes M scanner exit .right rows (bits ++ [0])
    (Tape.mk' left (ListBlank.append scanBits (right.cons 0))) safe read
  have shifted :
      shift .right ((bits ++ [0]).length + 4)
          (Tape.mk' left (ListBlank.append scanBits (right.cons 0))) =
        Tape.mk' (ListBlank.append scanBits.reverse left) (right.cons 0) := by
    simpa [scanBits, Nat.add_assoc] using Seed.Scan.shift_right_prefix scanBits left (right.cons 0)
  rw [shifted] at traversed
  simpa only [start, List.length_append, List.length_cons, List.length_nil, Nat.add_zero,
    Nat.add_assoc] using traversed

/-- Compact output and an arbitrary gap can be scanned left without entering unread input. -/
theorem payload_left_marker {q : Nat} (M : Machine q 2) (scanner : Fin 4 → Fin q)
    (exit : Fin q) (rows : Seed.Scan.Rows M scanner exit .left)
    (letters : List Seed.Letter) (gap : Nat) (left right : ListBlank (Fin 2)) :
    FlatInit.runFrom M (gap + 3 * letters.length + 5)
      ⟨scanner 0, (Tape.mk'
        (ListBlank.append
          (List.replicate gap 0 ++ (Seed.payload letters).reverse ++ Seed.marker.reverse) left)
        right).move .left⟩ =
      some ⟨exit, Tape.mk' left (ListBlank.append
        (Seed.marker ++ Seed.payload letters ++ List.replicate gap 0) right)⟩ := by
  have result := left_marker M scanner exit rows
    (List.replicate gap 0 ++ (Seed.payload letters).reverse)
    (gap_payload_reverse_guard letters gap) left right
  simpa [List.reverse_append, List.append_assoc] using result

/-- Compact output and its gap can be scanned right, stopping at B+5 before the paid return. -/
theorem payload_right_marker {q : Nat} (M : Machine q 2) (scanner : Fin 4 → Fin q)
    (exit : Fin q) (rows : Seed.Scan.Rows M scanner exit .right)
    (letters : List Seed.Letter) (gap : Nat) (left right : ListBlank (Fin 2)) :
    FlatInit.runFrom M (3 * letters.length + gap + 5)
      ⟨scanner 0, Tape.mk' left
        (ListBlank.append (Seed.payload letters ++ List.replicate gap 0 ++ Seed.marker) right)⟩ =
      some ⟨exit, Tape.mk'
        (ListBlank.append
          ([1, 1, 1, 1, 0] ++ List.replicate gap 0 ++ (Seed.payload letters).reverse) left)
        (right.cons 0)⟩ := by
  have result := right_marker M scanner exit rows
    (Seed.payload letters ++ List.replicate gap 0)
    (payload_gap_guard letters gap 0 (by decide)) left right
  simpa [List.reverse_append, List.append_assoc] using result

end ConjectureMachines.Compilation.TableSeed.Scan
