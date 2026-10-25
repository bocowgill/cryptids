/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.Parsimony.Extractor
public import Cryptids.Compilation.Parsimony.IndexedInsertion

/-! # Conversion preserving and finally erasing the actual unary word index -/

@[expose] public section
namespace ConjectureMachines.Compilation.Parsimony.IndexedExtractor

open Turing Common Insertion IndexedInsertion

set_option backward.isDefEq.respectTransparency false

structure Rows {q : Nat} (M : Machine q 2) (c : Extractor.Controls q) (width : Nat) : Prop where
  base : Extractor.Rows M c width
  secondOne : M.transition c.second 1 = some (1, .left, c.second)
  returnOne : M.transition c.returnToUnary 1 = some (1, .right, c.returnToUnary)
  cleanOne : M.transition c.clean 1 = some (0, .left, c.clean)

theorem cleanRun {q : Nat} (M : Machine q 2) (c : Extractor.Controls q) (width : Nat)
    (rows : Rows M c width) (index : Nat) (L R : ListBlank Bit) :
    Common.Runs M ⟨c.clean, atL (O index (L.cons 0)) R⟩
      ⟨c.data, Tape.mk' (L.cons 0) (Z index R)⟩ := by
  induction index generalizing R with
  | zero => simpa using Common.right M c.clean c.data 0 0 L R rows.base.clean
  | succ index ih =>
    have first := Common.left M c.clean c.clean 1 0 (O index (L.cons 0)) R rows.cleanOne
    simpa using first.trans (ih (R.cons 0))

theorem cycle {q : Nat} (M : Machine q 2) (c : Extractor.Controls q) (width : Nat)
    (rows : Rows M c width) (positive : 0 < width) (index n : Nat) (bits out : List Bit)
    (length : bits.length = width) (increment : Counter.plus true bits = some out)
    (L R : ListBlank Bit) :
    Common.Runs M ⟨c.scan, Tape.mk' (O (n + 1) (P index (ListBlank.append bits L))) (R.cons 0)⟩
      ⟨c.scan, Tape.mk' (O n (P index (ListBlank.append out L))) ((R.cons 0).cons 0)⟩ := by
  let B := ListBlank.append bits L
  let A := ListBlank.append out L
  have h0 := Common.left M c.scan c.delete 0 0 (O (n + 1) (P index B)) R rows.base.scanZero
  have h1 := Common.left M c.delete c.first 1 0 (O n (P index B)) (R.cons 0) rows.base.deleteOne
  have h2 := Common.scanL M c.first c.second 0 rows.base.firstOne rows.base.firstZero n
    (O index (B.cons 0)) ((R.cons 0).cons 0)
  have h3 := Common.scanL M c.second (c.counter true 0) 0 rows.secondOne rows.base.second
    index B ((O n ((R.cons 0).cons 0)).cons 0)
  have h4 := Counter.run M c.counter c.back width rows.base.counter positive bits out length
    increment L ((O index ((O n ((R.cons 0).cons 0)).cons 0)).cons 0)
  have h5 := Common.right M (c.back width) c.returnToUnary 0 0 A
    (O index ((O n ((R.cons 0).cons 0)).cons 0)) rows.base.back
  have h6 := Common.scanR M c.returnToUnary c.scan 0 rows.returnOne rows.base.returnToUnary
    index (A.cons 0) (O n ((R.cons 0).cons 0))
  have h7 := Common.repeatR M c.scan 1 rows.base.scanOne n (P index A) ((R.cons 0).cons 0)
  simp only [A, B, P, O, List.replicate_succ, ListBlank.append, Common.atL_cons] at *
  exact h0.trans (h1.trans (h2.trans (h3.trans (h4.trans (h5.trans (h6.trans h7))))))

theorem terminal {q : Nat} (M : Machine q 2) (c : Extractor.Controls q) (width : Nat)
    (rows : Rows M c width) (index : Nat) (bits : List Bit) (L R : ListBlank Bit) :
    Common.Runs M ⟨c.scan, Tape.mk' (P index (ListBlank.append bits L)) (R.cons 0)⟩
      ⟨c.data, Tape.mk' ((ListBlank.append bits L).cons 0) (Z index ((R.cons 1).cons 0))⟩ := by
  let B := ListBlank.append bits L
  have h0 := Common.leftCell M c.scan c.delete 0 0 0 (O index (B.cons 0)) R rows.base.scanZero
  have h1 := Common.right M c.delete c.makeMarker 0 0 (O index (B.cons 0)) (R.cons 0)
    rows.base.deleteZero
  have h2 := Common.leftCell M c.makeMarker c.moveLeft 0 1 0 (O index (B.cons 0)) R
    rows.base.makeMarker
  have h3 := Common.left M c.moveLeft c.clean 0 0 (O index (B.cons 0)) (R.cons 1)
    rows.base.moveLeft
  have h4 := cleanRun M c width rows index B ((R.cons 1).cons 0)
  simp only [B, P, Common.atL_cons] at *
  exact h0.trans (h1.trans (h2.trans (h3.trans h4)))

theorem convert {q : Nat} (M : Machine q 2) (c : Extractor.Controls q) (width : Nat)
    (rows : Rows M c width) (positive : 0 < width) (index n : Nat) :
    ∀ bits out : List Bit, bits.length = width → Extractor.addMany n bits = some out →
    ∀ L R : ListBlank Bit,
    Common.Runs M ⟨c.scan, Tape.mk' (O n (P index (ListBlank.append bits L))) (R.cons 0)⟩
      ⟨c.data, Tape.mk' ((ListBlank.append out L).cons 0)
        (Z index (((Z n R).cons 1).cons 0))⟩ := by
  induction n with
  | zero =>
    intro bits out length result L R
    have equal : bits = out := by simpa [Extractor.addMany] using result
    subst out
    simpa using terminal M c width rows index bits L R
  | succ n ih =>
    intro bits out length result L R
    cases step : Counter.plus true bits with
    | none => simp [Extractor.addMany, step] at result
    | some next =>
      have rest : Extractor.addMany n next = some out := by
        simpa [Extractor.addMany, step] using result
      have size := (Counter.plus_length true bits next step).trans length
      have first := cycle M c width rows positive index n bits next length step L R
      have later := ih next out size rest L (R.cons 0)
      simpa using first.trans later

theorem convert_safe {q : Nat} (M : Machine q 2) (c : Extractor.Controls q) (width : Nat)
    (rows : Rows M c width) (positive : 0 < width) (index n : Nat) (bits : List Bit)
    (length : bits.length = width) (bound : Counter.value bits + n < 2 ^ width)
    (L R : ListBlank Bit) :
    ∃ out : List Bit, out.length = width ∧ Counter.value out = Counter.value bits + n ∧
    Common.Runs M ⟨c.scan, Tape.mk' (O n (P index (ListBlank.append bits L))) (R.cons 0)⟩
      ⟨c.data, Tape.mk' ((ListBlank.append out L).cons 0)
        (Z index (((Z n R).cons 1).cons 0))⟩ := by
  obtain ⟨out, run, size, value⟩ := Extractor.addMany_exists n bits (by simpa [length] using bound)
  exact ⟨out, size.trans length, value,
    convert M c width rows positive index n bits out length run L R⟩

theorem query_extract {q : Nat} (M : Machine q 2) (data : Nat → Fin q) (exit : Fin q)
    (last : Nat) (values : Array (Fin (last + 1)))
    (more : ∀ i, i < last → M.transition (data i) 0 = some (1, .right, data (i + 1)))
    (final : M.transition (data last) 0 = some (0, .right, exit))
    (one : ∀ i, i ≤ last → M.transition (data i) 1 =
      some (0, .right, data (last - (Data.wordAt last values i).val)))
    (ins : Insertion.Controls q) (con : Extractor.Controls q) (width : Nat)
    (r : Nat → Fin q) (insertRows : IndexedInsertion.Rows M ins width r)
    (convertRows : Rows M con width) (branch : M.transition exit 0 = some (0, .left, ins.a 0))
    (connect : ins.out = con.scan) (returnData : con.data = data 0) (positive : 0 < width)
    (i index : Nat) (bound : i ≤ last) (safe : (Data.wordAt last values i).val < 2 ^ width)
    (L R : ListBlank Bit) :
    let v := (Data.wordAt last values i).val
    ∃ out : List Bit, out.length = width ∧ Counter.value out = v ∧
    Common.Runs M
      ⟨data i, Tape.mk' (O index (L.cons 0)) ((Z (v + 1) (Z (width + 2) R)).cons 1)⟩
      ⟨data 0, Tape.mk' ((ListBlank.append out L).cons 0)
        (Z index (((Z (v + 2) R).cons 1).cons 0))⟩ := by
  dsimp only
  let v := (Data.wordAt last values i).val
  have first := Common.of_run M (v + 2) _ _ (Extractor.query M data exit last values
    more final one i bound (O index (L.cons 0)) (Z (width + 2) R))
  have next := Common.leftCell M exit (ins.a 0) 0 0 0 (O v (P index L))
    (Z (width + 1) R) branch
  have insert := IndexedInsertion.word M ins width r insertRows positive index v L (R.cons 0)
  rw [connect] at insert
  obtain ⟨out, size, value, convert⟩ := convert_safe M con width convertRows positive index v
    (List.replicate width 0) (by simp) (by simpa using safe) L (Z 2 R)
  rw [returnData] at convert
  refine ⟨out, size, by simpa using value, ?_⟩
  simp only [P, O, Z, List.replicate_succ, ListBlank.append, Common.replicate_cons] at *
  exact first.trans (next.trans (insert.trans convert))

end ConjectureMachines.Compilation.Parsimony.IndexedExtractor
