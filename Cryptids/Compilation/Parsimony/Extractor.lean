/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.Parsimony.Counter
public import Cryptids.Compilation.Parsimony.Insertion

/-! # Unary conversion by a decreasing ordinary-execution invariant -/

@[expose] public section
namespace ConjectureMachines.Compilation.Parsimony.Extractor

open Turing Common Insertion

set_option backward.isDefEq.respectTransparency false

/-- Pure repeated finite increment; this is not a machine-execution assumption. -/
def addMany : Nat → List Bit → Option (List Bit)
  | 0, bits => some bits
  | n + 1, bits => (Counter.plus true bits).bind (addMany n)

theorem addMany_exists (n : Nat) (bits : List Bit)
    (bound : Counter.value bits + n < 2 ^ bits.length) :
    ∃ out, addMany n bits = some out ∧ out.length = bits.length ∧
      Counter.value out = Counter.value bits + n := by
  induction n generalizing bits with
  | zero => exact ⟨bits, rfl, rfl, by omega⟩
  | succ n ih =>
    obtain ⟨next, step⟩ := Counter.plus_exists true bits (by simp; omega)
    have length := Counter.plus_length true bits next step
    have value := Counter.plus_value true bits next step
    obtain ⟨out, run, finalLength, finalValue⟩ := ih next (by simp_all; omega)
    exact ⟨out, by simp [addMany, step, run], finalLength.trans length, by simp_all; omega⟩

@[simp] theorem value_zeros (n : Nat) : Counter.value (List.replicate n 0) = 0 := by
  induction n with
  | zero => rfl
  | succ n ih => simp [List.replicate_succ, Counter.value, ih]

structure Controls (q : Nat) where
  scan : Fin q
  delete : Fin q
  first : Fin q
  second : Fin q
  returnToUnary : Fin q
  makeMarker : Fin q
  moveLeft : Fin q
  clean : Fin q
  data : Fin q
  counter : Bool → Nat → Fin q
  back : Nat → Fin q

/-- Only the actual loop and terminal rows under the two-separator invariant. -/
structure Rows {q : Nat} (M : Machine q 2) (c : Controls q) (width : Nat) : Prop where
  counter : Counter.Rows M c.counter c.back width
  scanOne : M.transition c.scan 1 = some (1, .right, c.scan)
  scanZero : M.transition c.scan 0 = some (0, .left, c.delete)
  deleteOne : M.transition c.delete 1 = some (0, .left, c.first)
  firstOne : M.transition c.first 1 = some (1, .left, c.first)
  firstZero : M.transition c.first 0 = some (0, .left, c.second)
  second : M.transition c.second 0 = some (0, .left, c.counter true 0)
  back : M.transition (c.back width) 0 = some (0, .right, c.returnToUnary)
  returnToUnary : M.transition c.returnToUnary 0 = some (0, .right, c.scan)
  deleteZero : M.transition c.delete 0 = some (0, .right, c.makeMarker)
  makeMarker : M.transition c.makeMarker 0 = some (1, .left, c.moveLeft)
  moveLeft : M.transition c.moveLeft 0 = some (0, .left, c.clean)
  clean : M.transition c.clean 0 = some (0, .right, c.data)

/-- One loop removes one unary mark and pays for the whole counter return path. -/
theorem cycle {q : Nat} (M : Machine q 2) (c : Controls q) (width : Nat)
    (rows : Rows M c width) (positive : 0 < width) (n : Nat) (bits out : List Bit)
    (length : bits.length = width) (increment : Counter.plus true bits = some out)
    (L R : ListBlank Bit) :
    Common.Runs M ⟨c.scan, Tape.mk' (O (n + 1) (Z 2 (ListBlank.append bits L))) (R.cons 0)⟩
      ⟨c.scan, Tape.mk' (O n (Z 2 (ListBlank.append out L))) ((R.cons 0).cons 0)⟩ := by
  let B := ListBlank.append bits L
  let A := ListBlank.append out L
  have h0 := Common.left M c.scan c.delete 0 0 (O (n + 1) (Z 2 B)) R rows.scanZero
  have h1 := Common.left M c.delete c.first 1 0 (O n (Z 2 B)) (R.cons 0) rows.deleteOne
  have h2 := Common.scanL M c.first c.second 0 rows.firstOne rows.firstZero n
    (B.cons 0) ((R.cons 0).cons 0)
  have h3 := Common.left M c.second (c.counter true 0) 0 0 B
    ((O n ((R.cons 0).cons 0)).cons 0) rows.second
  have h4 := Counter.run M c.counter c.back width rows.counter positive bits out length
    increment L (((O n ((R.cons 0).cons 0)).cons 0).cons 0)
  have h5 := Common.right M (c.back width) c.returnToUnary 0 0 A
    ((O n ((R.cons 0).cons 0)).cons 0) rows.back
  have h6 := Common.right M c.returnToUnary c.scan 0 0 (A.cons 0)
    (O n ((R.cons 0).cons 0)) rows.returnToUnary
  have h7 := Common.repeatR M c.scan 1 rows.scanOne n (Z 2 A) ((R.cons 0).cons 0)
  simp only [A, B, O, Z, List.replicate_succ, ListBlank.append, Common.atL_cons] at *
  exact h0.trans (h1.trans (h2.trans (h3.trans (h4.trans (h5.trans (h6.trans h7))))))

/-- The zero-unary branch writes the new marker and includes both cleanup controls. -/
theorem terminal {q : Nat} (M : Machine q 2) (c : Controls q) (width : Nat)
    (rows : Rows M c width) (bits : List Bit) (L R : ListBlank Bit) :
    Common.Runs M ⟨c.scan, Tape.mk' (Z 2 (ListBlank.append bits L)) (R.cons 0)⟩
      ⟨c.data, Tape.mk' ((ListBlank.append bits L).cons 0) ((R.cons 1).cons 0)⟩ := by
  let B := ListBlank.append bits L
  have h0 := Common.leftCell M c.scan c.delete 0 0 0 (B.cons 0) R rows.scanZero
  have h1 := Common.right M c.delete c.makeMarker 0 0 (B.cons 0) (R.cons 0) rows.deleteZero
  have h2 := Common.leftCell M c.makeMarker c.moveLeft 0 1 0 (B.cons 0) R rows.makeMarker
  have h3 := Common.leftCell M c.moveLeft c.clean 0 0 0 B (R.cons 1) rows.moveLeft
  have h4 := Common.right M c.clean c.data 0 0 B ((R.cons 1).cons 0) rows.clean
  simpa using h0.trans (h1.trans (h2.trans (h3.trans h4)))

/-- Repeated conversion is a structural induction on remaining unary marks. -/
theorem convert {q : Nat} (M : Machine q 2) (c : Controls q) (width : Nat)
    (rows : Rows M c width) (positive : 0 < width) (n : Nat) :
    ∀ bits out : List Bit, bits.length = width → addMany n bits = some out →
    ∀ L R : ListBlank Bit,
    Common.Runs M ⟨c.scan, Tape.mk' (O n (Z 2 (ListBlank.append bits L))) (R.cons 0)⟩
      ⟨c.data, Tape.mk' ((ListBlank.append out L).cons 0) (((Z n R).cons 1).cons 0)⟩ := by
  induction n with
  | zero =>
    intro bits out length result L R
    have equal : bits = out := by simpa [addMany] using result
    subst out
    simpa using terminal M c width rows bits L R
  | succ n ih =>
    intro bits out length result L R
    cases step : Counter.plus true bits with
    | none => simp [addMany, step] at result
    | some next =>
      have rest : addMany n next = some out := by simpa [addMany, step] using result
      have nextLength := (Counter.plus_length true bits next step).trans length
      have first := cycle M c width rows positive n bits next length step L R
      have later := ih next out nextLength rest L (R.cons 0)
      simpa using first.trans later

/-- The capacity inequality proves the repeated-increment premise, not the caller. -/
theorem convert_safe {q : Nat} (M : Machine q 2) (c : Controls q) (width : Nat)
    (rows : Rows M c width) (positive : 0 < width) (n : Nat) (bits : List Bit)
    (length : bits.length = width) (bound : Counter.value bits + n < 2 ^ width)
    (L R : ListBlank Bit) :
    ∃ out : List Bit, out.length = width ∧ Counter.value out = Counter.value bits + n ∧
    Common.Runs M ⟨c.scan, Tape.mk' (O n (Z 2 (ListBlank.append bits L))) (R.cons 0)⟩
      ⟨c.data, Tape.mk' ((ListBlank.append out L).cons 0) (((Z n R).cons 1).cons 0)⟩ := by
  obtain ⟨out, run, size, value⟩ := addMany_exists n bits (by simpa [length] using bound)
  exact ⟨out, size.trans length, value, convert M c width rows positive n bits out length run L R⟩

/-- Reuse the checked unary-chain induction on any caller with the exact local data rows. -/
theorem query {q : Nat} (M : Machine q 2) (data : Nat → Fin q) (exit : Fin q)
    (last : Nat) (values : Array (Fin (last + 1)))
    (more : ∀ i, i < last → M.transition (data i) 0 = some (1, .right, data (i + 1)))
    (final : M.transition (data last) 0 = some (0, .right, exit))
    (one : ∀ i, i ≤ last → M.transition (data i) 1 =
      some (0, .right, data (last - (Data.wordAt last values i).val)))
    (i : Nat) (bound : i ≤ last) (L R : ListBlank Bit) :
    let v := (Data.wordAt last values i).val
    FlatInit.runFrom M (v + 2)
      ⟨data i, Tape.mk' L ((Z (v + 1) R).cons 1)⟩ =
      some ⟨exit, Tape.mk' ((O v (L.cons 0)).cons 0) R⟩ := by
  dsimp only
  rw [show (Data.wordAt last values i).val + 2 =
    ((Data.wordAt last values i).val + 1) + 1 by omega, FlatInit.runFrom,
    Data.step_cell _ _ _ 1 0 _ _ (one i bound), Option.bind_some]
  exact Data.unary_run M data exit last more final (Data.wordAt last values i).val
    (last - (Data.wordAt last values i).val)
    (by have := (Data.wordAt last values i).isLt; omega) (L.cons 0) R

/-- One whole local query/extraction, with width-bounded value and arbitrary exterior frames. -/
theorem query_extract {q : Nat} (M : Machine q 2) (data : Nat → Fin q) (exit : Fin q)
    (last : Nat) (values : Array (Fin (last + 1)))
    (more : ∀ i, i < last → M.transition (data i) 0 = some (1, .right, data (i + 1)))
    (final : M.transition (data last) 0 = some (0, .right, exit))
    (one : ∀ i, i ≤ last → M.transition (data i) 1 =
      some (0, .right, data (last - (Data.wordAt last values i).val)))
    (ins : Insertion.Controls q) (con : Controls q) (width : Nat)
    (insertRows : Insertion.Rows M ins width) (convertRows : Rows M con width)
    (branch : M.transition exit 0 = some (0, .left, ins.a 0))
    (connect : ins.out = con.scan) (returnData : con.data = data 0) (positive : 0 < width)
    (i : Nat) (index : i ≤ last) (safe : (Data.wordAt last values i).val < 2 ^ width)
    (L R : ListBlank Bit) :
    let v := (Data.wordAt last values i).val
    ∃ out : List Bit, out.length = width ∧ Counter.value out = v ∧
    Common.Runs M
      ⟨data i, Tape.mk' (L.cons 0) ((Z (v + 1) (Z (width + 2) R)).cons 1)⟩
      ⟨data 0, Tape.mk' ((ListBlank.append out L).cons 0) (((Z (v + 2) R).cons 1).cons 0)⟩ := by
  dsimp only
  let v := (Data.wordAt last values i).val
  have first := Common.of_run M (v + 2) _ _
    (query M data exit last values more final one i index (L.cons 0) (Z (width + 2) R))
  have next := Common.leftCell M exit (ins.a 0) 0 0 0 (O v (Z 2 L))
    (Z (width + 1) R) branch
  have insert := Insertion.word M ins width insertRows positive v L (R.cons 0)
  rw [connect] at insert
  obtain ⟨out, size, value, convert⟩ := convert_safe M con width convertRows positive v
    (List.replicate width 0) (by simp) (by simpa using safe) L (Z 2 R)
  rw [returnData] at convert
  refine ⟨out, size, by simpa using value, ?_⟩
  simp only [O, Z, List.replicate_succ, ListBlank.append, Common.replicate_cons] at *
  exact first.trans (next.trans (insert.trans convert))

end ConjectureMachines.Compilation.Parsimony.Extractor
