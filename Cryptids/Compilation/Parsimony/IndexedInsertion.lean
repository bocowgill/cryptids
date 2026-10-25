/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.Parsimony.Insertion

/-! # Insertion with both the value and the word-index unary runs -/

@[expose] public section
namespace ConjectureMachines.Compilation.Parsimony.IndexedInsertion

open Turing Common Insertion

set_option backward.isDefEq.respectTransparency false

/-- The value separator, the index run and the index separator. -/
def P (index : Nat) (L : ListBlank Bit) := (O index (L.cons 0)).cons 0

structure Rows {q : Nat} (M : Machine q 2) (c : Insertion.Controls q)
    (width : Nat) (right : Nat → Fin q) : Prop where
  base : Insertion.Rows M c width
  secondOne : ∀ i, i < width → M.transition (c.second i) 1 = some (1, .left, c.second i)
  putOne : ∀ i, i < width → M.transition (c.put i) 1 = some (0, .right, right i)
  rightOne : ∀ i, i < width → M.transition (right i) 1 = some (1, .right, right i)
  rightZero : ∀ i, i < width → M.transition (right i) 0 = some (1, .right, c.middle i)

/-- Leftward search with the actual rightward turn on its terminal zero. -/
theorem scanLR {q : Nat} (M : Machine q 2) (s t : Fin q) (write : Bit)
    (one : M.transition s 1 = some (1, .left, s))
    (zero : M.transition s 0 = some (write, .right, t)) (n : Nat)
    (L R : ListBlank Bit) :
    Common.Runs M ⟨s, atL (O n (L.cons 0)) R⟩
      ⟨t, Tape.mk' (L.cons write) (O n R)⟩ := by
  induction n generalizing R with
  | zero => simpa using Common.right M s t 0 write L R zero
  | succ n ih =>
    have first := Common.left M s s 1 1 (O n (L.cons 0)) R one
    simpa using first.trans (ih (R.cons 1))

/-- Shift the arbitrary index run before touching the value run. -/
theorem indexBody {q : Nat} (M : Machine q 2) (c : Insertion.Controls q)
    (width : Nat) (r : Nat → Fin q) (rows : Rows M c width r)
    (i : Nat) (bound : i < width) (index : Nat) (L R : ListBlank Bit) :
    Common.Runs M ⟨c.second i, atL (O index (L.cons 0)) (R.cons 0)⟩
      ⟨c.middle i, Tape.mk' (O index (Z 2 L)) R⟩ := by
  have first := scanLR M (c.second i) (c.put i) 0 (rows.secondOne i bound)
    (rows.base.second i bound) index L (R.cons 0)
  cases index with
  | zero =>
    have last := Common.right M (c.put i) (c.middle i) 0 0 (L.cons 0) R
      (rows.base.put i bound)
    simpa [O, Z, ListBlank.append] using first.trans last
  | succ index =>
    have put := Common.right M (c.put i) (r i) 1 0 (L.cons 0)
      (O index (R.cons 0)) (rows.putOne i bound)
    have last := Common.scanR M (r i) (c.middle i) 1 (rows.rightOne i bound)
      (rows.rightZero i bound) index (Z 2 L) R
    simp only [O, Z, List.replicate_succ, ListBlank.append, Common.atL_cons] at *
    exact first.trans (put.trans last)

theorem charZero {q : Nat} (M : Machine q 2) (c : Insertion.Controls q)
    (width : Nat) (r : Nat → Fin q) (rows : Rows M c width r)
    (i : Nat) (bound : i < width) (index : Nat) (L R : ListBlank Bit) :
    Common.Runs M ⟨c.a i, Tape.mk' (P index L) (R.cons 0)⟩
      ⟨c.a (i + 1), Tape.mk' (P index (L.cons 0)) R⟩ := by
  have h0 := Common.left M (c.a i) (c.first i) 0 0 (P index L) R (rows.base.a i bound)
  have h1 := Common.left M (c.first i) (c.second i) 0 0 (O index (L.cons 0))
    (R.cons 0) (rows.base.firstZero i bound)
  have h2 := indexBody M c width r rows i bound index L (R.cons 0)
  have h3 := Common.right M (c.middle i) (c.a (i + 1)) 0 0 (O index (Z 2 L)) R
    (rows.base.middleZero i bound)
  simp only [P, O, Z, List.replicate_succ, ListBlank.append, Common.atL_cons] at *
  exact h0.trans (h1.trans (h2.trans h3))

theorem charPositive {q : Nat} (M : Machine q 2) (c : Insertion.Controls q)
    (width : Nat) (r : Nat → Fin q) (rows : Rows M c width r)
    (i : Nat) (bound : i < width) (index v : Nat) (L R : ListBlank Bit) :
    Common.Runs M ⟨c.a i, Tape.mk' (O (v + 1) (P index L)) (R.cons 0)⟩
      ⟨c.b (i + 1), Tape.mk' (P index (L.cons 0)) (O v (R.cons 0))⟩ := by
  have h0 := Common.left M (c.a i) (c.first i) 0 0 (O (v + 1) (P index L)) R
    (rows.base.a i bound)
  have h1 := Common.scanL M (c.first i) (c.second i) 0 (rows.base.firstOne i bound)
    (rows.base.firstZero i bound) (v + 1) (O index (L.cons 0)) (R.cons 0)
  have h2 := indexBody M c width r rows i bound index L (O (v + 1) (R.cons 0))
  have h3 := Common.right M (c.middle i) (c.b (i + 1)) 1 0 (O index (Z 2 L))
    (O v (R.cons 0)) (rows.base.middleOne i bound)
  simp only [P, O, Z, List.replicate_succ, ListBlank.append, Common.atL_cons] at *
  exact h0.trans (h1.trans (h2.trans h3))

theorem charCarry {q : Nat} (M : Machine q 2) (c : Insertion.Controls q)
    (width : Nat) (r : Nat → Fin q) (rows : Rows M c width r)
    (i : Nat) (positive : 1 ≤ i) (bound : i < width) (index v : Nat) (L R : ListBlank Bit) :
    Common.Runs M ⟨c.b i, Tape.mk' (P index L) (O v (R.cons 0))⟩
      ⟨c.b (i + 1), Tape.mk' (P index (L.cons 0)) (O v R)⟩ := by
  have h0 := Common.repeatR M (c.b i) 1 (rows.base.bOne i positive (by omega))
    v (P index L) (R.cons 0)
  have h1 := Common.left M (c.b i) (c.first i) 0 1 (O v (P index L)) R
    (rows.base.bZero i positive bound)
  have h2 := Common.scanL M (c.first i) (c.second i) 0 (rows.base.firstOne i bound)
    (rows.base.firstZero i bound) v (O index (L.cons 0)) (R.cons 1)
  have h3 := indexBody M c width r rows i bound index L (O v (R.cons 1))
  have h4 := Common.right M (c.middle i) (c.b (i + 1)) 1 0 (O index (Z 2 L))
    (O v R) (rows.base.middleOne i bound)
  simp only [P, O, Z, List.replicate_succ, ListBlank.append, Common.replicate_cons,
    Common.atL_cons] at *
  exact h0.trans (h1.trans (h2.trans (h3.trans h4)))

theorem carryRun {q : Nat} (M : Machine q 2) (c : Insertion.Controls q)
    (width : Nat) (r : Nat → Fin q) (rows : Rows M c width r) (index v count : Nat) :
    ∀ i, 1 ≤ i → i + count = width → ∀ L R : ListBlank Bit,
    Common.Runs M ⟨c.b i, Tape.mk' (P index L) (O v (Z (count + 1) R))⟩
      ⟨c.out, Tape.mk' (O (v + 1) (P index (Z count L))) R⟩ := by
  induction count with
  | zero =>
    intro i positive total L R
    have equal : i = width := by omega
    subst i
    simpa [O, ListBlank.append, List.replicate_succ] using
      Common.scanR M (c.b width) c.out 1 (rows.base.bOne width positive (by omega))
        rows.base.finishB v (P index L) R
  | succ count ih =>
    intro i positive total L R
    have first := charCarry M c width r rows i positive (by omega) index v L (Z (count + 1) R)
    have rest := ih (i + 1) (by omega) (by omega) (L.cons 0) R
    simpa using first.trans rest

theorem zeroRun {q : Nat} (M : Machine q 2) (c : Insertion.Controls q)
    (width : Nat) (r : Nat → Fin q) (rows : Rows M c width r) (index count : Nat) :
    ∀ i, i + count = width → ∀ L R : ListBlank Bit,
    Common.Runs M ⟨c.a i, Tape.mk' (P index L) (Z (count + 2) R)⟩
      ⟨c.out, Tape.mk' (P index (Z count L)) (Z 2 R)⟩ := by
  induction count with
  | zero =>
    intro i total L R
    have equal : i = width := by omega
    subst i
    have first := Common.right M (c.a width) c.back 0 0 (P index L) (R.cons 0) rows.base.finishA
    have rest := Common.leftCell M c.back c.out 0 0 0 (P index L) R rows.base.back
    simpa using first.trans rest
  | succ count ih =>
    intro i total L R
    have first := charZero M c width r rows i (by omega) index L (Z (count + 2) R)
    have rest := ih (i + 1) (by omega) (L.cons 0) R
    simpa using first.trans rest

theorem word {q : Nat} (M : Machine q 2) (c : Insertion.Controls q) (width : Nat)
    (r : Nat → Fin q) (rows : Rows M c width r) (positive : 0 < width) (index v : Nat)
    (L R : ListBlank Bit) :
    Common.Runs M ⟨c.a 0, Tape.mk' (O v (P index L)) (Z (width + 2) R)⟩
      ⟨c.out, Tape.mk' (O v (P index (Z width L))) (Z 2 R)⟩ := by
  cases v with
  | zero => simpa using zeroRun M c width r rows index width 0 (by omega) L R
  | succ v =>
    cases width with
    | zero => omega
    | succ width =>
      have first := charPositive M c (width + 1) r rows 0 (by omega) index v L
        (Z (width + 2) R)
      have rest := carryRun M c (width + 1) r rows index v width 1 (by omega) (by omega)
        (L.cons 0) (Z 2 R)
      have rest' : Common.Runs M
          ⟨c.b 1, Tape.mk' (P index (L.cons 0)) (O v (Z (width + 3) R))⟩
          ⟨c.out, Tape.mk' (O (v + 1) (P index (Z (width + 1) L))) (Z 2 R)⟩ := by
        simpa [Nat.add_assoc] using rest
      simpa [Nat.add_assoc] using first.trans rest'

end ConjectureMachines.Compilation.Parsimony.IndexedInsertion
