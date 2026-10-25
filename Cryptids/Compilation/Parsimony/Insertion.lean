/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.Parsimony.Common

/-! # Blank-word insertion without unrolling the unary working area -/

@[expose] public section
namespace ConjectureMachines.Compilation.Parsimony.Insertion

open Turing Common

set_option backward.isDefEq.respectTransparency false

abbrev Z (n : Nat) (frame : ListBlank Bit) := ListBlank.append (List.replicate n 0) frame
abbrev O (n : Nat) (frame : ListBlank Bit) := ListBlank.append (List.replicate n 1) frame

@[simp] theorem Z_zero (frame : ListBlank Bit) : Z 0 frame = frame := rfl
@[simp] theorem O_zero (frame : ListBlank Bit) : O 0 frame = frame := rfl
@[simp] theorem Z_succ (n : Nat) (frame : ListBlank Bit) :
    Z (n + 1) frame = (Z n frame).cons 0 := by
  simp only [Z, List.replicate_succ, ListBlank.append]
@[simp] theorem O_succ (n : Nat) (frame : ListBlank Bit) :
    O (n + 1) frame = (O n frame).cons 1 := by
  simp only [O, List.replicate_succ, ListBlank.append]
@[simp] theorem Z_cons (n : Nat) (frame : ListBlank Bit) :
    Z n (frame.cons 0) = (Z n frame).cons 0 := Common.replicate_cons 0 n frame
@[simp] theorem O_cons (n : Nat) (frame : ListBlank Bit) :
    O n (frame.cons 1) = (O n frame).cons 1 := Common.replicate_cons 1 n frame
@[simp] theorem Z_add (n m : Nat) (frame : ListBlank Bit) :
    Z n (Z m frame) = Z (n + m) frame := by
  simp only [Z, ← ListBlank.append_assoc, ← List.replicate_add]

structure Controls (q : Nat) where
  a : Nat → Fin q
  b : Nat → Fin q
  first : Nat → Fin q
  second : Nat → Fin q
  put : Nat → Fin q
  middle : Nat → Fin q
  back : Fin q
  out : Fin q

/-- Only rows reached under the two-separator invariant are required. -/
structure Rows {q : Nat} (M : Machine q 2) (c : Controls q) (width : Nat) : Prop where
  a : ∀ i, i < width → M.transition (c.a i) 0 = some (0, .left, c.first i)
  bOne : ∀ i, 1 ≤ i → i ≤ width → M.transition (c.b i) 1 = some (1, .right, c.b i)
  bZero : ∀ i, 1 ≤ i → i < width → M.transition (c.b i) 0 = some (1, .left, c.first i)
  firstOne : ∀ i, i < width → M.transition (c.first i) 1 = some (1, .left, c.first i)
  firstZero : ∀ i, i < width → M.transition (c.first i) 0 = some (0, .left, c.second i)
  second : ∀ i, i < width → M.transition (c.second i) 0 = some (0, .right, c.put i)
  put : ∀ i, i < width → M.transition (c.put i) 0 = some (0, .right, c.middle i)
  middleZero : ∀ i, i < width → M.transition (c.middle i) 0 = some (0, .right, c.a (i + 1))
  middleOne : ∀ i, i < width → M.transition (c.middle i) 1 = some (0, .right, c.b (i + 1))
  finishA : M.transition (c.a width) 0 = some (0, .right, c.back)
  back : M.transition c.back 0 = some (0, .left, c.out)
  finishB : M.transition (c.b width) 0 = some (1, .right, c.out)

/-- A zero-unary character uses the two zero delimiters and advances one cell. -/
theorem charZero {q : Nat} (M : Machine q 2) (c : Controls q) (width : Nat)
    (rows : Rows M c width) (i : Nat) (bound : i < width) (L R : ListBlank Bit) :
    Common.Runs M ⟨c.a i, Tape.mk' (Z 2 L) (R.cons 0)⟩
      ⟨c.a (i + 1), Tape.mk' (Z 3 L) R⟩ := by
  have h0 := Common.leftCell M (c.a i) (c.first i) 0 0 0 (L.cons 0) R (rows.a i bound)
  have h1 := Common.leftCell M (c.first i) (c.second i) 0 0 0 L (R.cons 0)
    (rows.firstZero i bound)
  have h2 := Common.right M (c.second i) (c.put i) 0 0 L ((R.cons 0).cons 0)
    (rows.second i bound)
  have h3 := Common.right M (c.put i) (c.middle i) 0 0 (L.cons 0) (R.cons 0)
    (rows.put i bound)
  have h4 := Common.right M (c.middle i) (c.a (i + 1)) 0 0 ((L.cons 0).cons 0) R
    (rows.middleZero i bound)
  simpa using h0.trans (h1.trans (h2.trans (h3.trans h4)))

/-- A positive first character hands the remaining unary run to the carry entry. -/
theorem charPositive {q : Nat} (M : Machine q 2) (c : Controls q) (width : Nat)
    (rows : Rows M c width) (i : Nat) (bound : i < width) (v : Nat)
    (L R : ListBlank Bit) :
    Common.Runs M ⟨c.a i, Tape.mk' (O (v + 1) (Z 2 L)) (R.cons 0)⟩
      ⟨c.b (i + 1), Tape.mk' (Z 3 L) (O v (R.cons 0))⟩ := by
  have h0 := Common.left M (c.a i) (c.first i) 0 0 (O (v + 1) (Z 2 L)) R (rows.a i bound)
  have h1 := Common.scanL M (c.first i) (c.second i) 0 (rows.firstOne i bound)
    (rows.firstZero i bound) (v + 1) (L.cons 0) (R.cons 0)
  have h2 := Common.right M (c.second i) (c.put i) 0 0 L ((O (v + 1) (R.cons 0)).cons 0)
    (rows.second i bound)
  have h3 := Common.right M (c.put i) (c.middle i) 0 0 (L.cons 0) (O (v + 1) (R.cons 0))
    (rows.put i bound)
  have h4 := Common.right M (c.middle i) (c.b (i + 1)) 1 0 (Z 2 L) (O v (R.cons 0))
    (rows.middleOne i bound)
  simp only [O, Z, List.replicate_succ, ListBlank.append, Common.atL_cons] at *
  exact h0.trans (h1.trans (h2.trans (h3.trans h4)))

/-- One carried character shifts the finite unary run, retaining both delimiters. -/
theorem charCarry {q : Nat} (M : Machine q 2) (c : Controls q) (width : Nat)
    (rows : Rows M c width) (i : Nat) (positive : 1 ≤ i) (bound : i < width) (v : Nat)
    (L R : ListBlank Bit) :
    Common.Runs M ⟨c.b i, Tape.mk' (Z 2 L) (O v (R.cons 0))⟩
      ⟨c.b (i + 1), Tape.mk' (Z 3 L) (O v R)⟩ := by
  have h0 := Common.repeatR M (c.b i) 1 (rows.bOne i positive (by omega)) v (Z 2 L) (R.cons 0)
  have h1 := Common.left M (c.b i) (c.first i) 0 1 (O v (Z 2 L)) R
    (rows.bZero i positive bound)
  have h2 := Common.scanL M (c.first i) (c.second i) 0 (rows.firstOne i bound)
    (rows.firstZero i bound) v (L.cons 0) (R.cons 1)
  have h3 := Common.right M (c.second i) (c.put i) 0 0 L ((O v (R.cons 1)).cons 0)
    (rows.second i bound)
  have h4 := Common.right M (c.put i) (c.middle i) 0 0 (L.cons 0) (O v (R.cons 1))
    (rows.put i bound)
  have h5 := Common.right M (c.middle i) (c.b (i + 1)) 1 0 (Z 2 L) (O v R)
    (rows.middleOne i bound)
  simp only [O, Z, List.replicate_succ, ListBlank.append, Common.replicate_cons,
    Common.atL_cons] at *
  exact h0.trans (h1.trans (h2.trans (h3.trans (h4.trans h5))))

/-- Remaining carried characters terminate through the actual final push control. -/
theorem carryRun {q : Nat} (M : Machine q 2) (c : Controls q) (width : Nat)
    (rows : Rows M c width) (v count : Nat) : ∀ i, 1 ≤ i → i + count = width →
    ∀ L R : ListBlank Bit,
    Common.Runs M ⟨c.b i, Tape.mk' (Z 2 L) (O v (Z (count + 1) R))⟩
      ⟨c.out, Tape.mk' (O (v + 1) (Z (count + 2) L)) R⟩ := by
  induction count with
  | zero =>
    intro i positive total L R
    have equal : i = width := by omega
    subst i
    simpa [O, Z, ListBlank.append, List.replicate_succ] using
      Common.scanR M (c.b width) c.out 1 (rows.bOne width positive (by omega)) rows.finishB
        v (Z 2 L) R
  | succ count ih =>
    intro i positive total L R
    have first := charCarry M c width rows i positive (by omega) v L (Z (count + 1) R)
    have rest := ih (i + 1) (by omega) (by omega) (L.cons 0) R
    simpa [Nat.add_assoc] using first.trans rest

/-- The all-zero unary case uses the actual right/left finish controls. -/
theorem zeroRun {q : Nat} (M : Machine q 2) (c : Controls q) (width : Nat)
    (rows : Rows M c width) (count : Nat) : ∀ i, i + count = width →
    ∀ L R : ListBlank Bit,
    Common.Runs M ⟨c.a i, Tape.mk' (Z 2 L) (Z (count + 2) R)⟩
      ⟨c.out, Tape.mk' (Z (count + 2) L) (Z 2 R)⟩ := by
  induction count with
  | zero =>
    intro i total L R
    have equal : i = width := by omega
    subst i
    have first := Common.right M (c.a width) c.back 0 0 (Z 2 L) (R.cons 0) rows.finishA
    have rest := Common.leftCell M c.back c.out 0 0 0 (Z 2 L) R rows.back
    simpa using first.trans rest
  | succ count ih =>
    intro i total L R
    have first := charZero M c width rows i (by omega) L (Z (count + 2) R)
    have rest := ih (i + 1) (by omega) (L.cons 0) R
    simpa [Nat.add_assoc] using first.trans rest

/-- Insert exactly width blank bits while preserving every exterior cell. -/
theorem word {q : Nat} (M : Machine q 2) (c : Controls q) (width : Nat)
    (rows : Rows M c width) (positive : 0 < width) (v : Nat) (L R : ListBlank Bit) :
    Common.Runs M ⟨c.a 0, Tape.mk' (O v (Z 2 L)) (Z (width + 2) R)⟩
      ⟨c.out, Tape.mk' (O v (Z (width + 2) L)) (Z 2 R)⟩ := by
  cases v with
  | zero => simpa using zeroRun M c width rows width 0 (by omega) L R
  | succ v =>
    cases width with
    | zero => omega
    | succ width =>
      have first := charPositive M c (width + 1) rows 0 (by omega) v L (Z (width + 2) R)
      have rest := carryRun M c (width + 1) rows v width 1 (by omega) (by omega)
        (L.cons 0) (Z 2 R)
      have rest' : Common.Runs M
          ⟨c.b 1, Tape.mk' (Z 3 L) (O v (Z (width + 3) R))⟩
          ⟨c.out, Tape.mk' (O (v + 1) (Z (width + 3) L)) (Z 2 R)⟩ := by
        simpa [Nat.add_assoc] using rest
      simpa [Nat.add_assoc] using first.trans rest'

end ConjectureMachines.Compilation.Parsimony.Insertion
