/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.Parsimony.IndexedExtractor
public import Cryptids.Compilation.Parsimony.Packet

/-! # Structural iteration of the physical indexed word contract -/

@[expose] public section
namespace ConjectureMachines.Compilation.Parsimony.Global

open Turing Common Insertion

set_option backward.isDefEq.respectTransparency false

/-- The unchanged infinite blank half-tape. -/
def blank : ListBlank Bit := ListBlank.mk []

@[simp] theorem blank_cons : blank.cons 0 = blank := by
  change ListBlank.mk [0] = ListBlank.mk []
  apply Quotient.sound
  exact Or.inr ⟨1, rfl⟩

/-- The marker advances once per word; the cleared index is immediately before it. -/
def boundary {q : Nat} (data : Nat → Fin q) (index : Nat) (L : ListBlank Bit) : Cfg q 2 :=
  ⟨data 0, Tape.mk' (L.cons 0) (Z index (blank.cons 1))⟩

@[simp] theorem zero_blank (n : Nat) : Z n blank = blank := by
  induction n with
  | zero => rfl
  | succ n ih => simp only [Z_succ, ih, blank_cons]

/-- Scan the cleared index using only the actual data zero rows. -/
theorem scan {q : Nat} (M : Machine q 2) (data : Nat → Fin q) (last : Nat)
    (more : ∀ i, i < last → M.transition (data i) 0 = some (1, .right, data (i + 1)))
    (count : Nat) : ∀ i, i + count ≤ last → ∀ L R : ListBlank Bit,
    Common.Runs M ⟨data i, Tape.mk' L (Z count R)⟩
      ⟨data (i + count), Tape.mk' (O count L) R⟩ := by
  induction count with
  | zero => intro i bound L R; exact .refl
  | succ count ih =>
    intro i bound L R
    have first := Common.right M (data i) (data (i + 1)) 0 1 L (Z count R)
      (more i (by omega))
    have later := ih (i + 1) (by omega) (L.cons 1) R
    simpa [Z, O, List.replicate_succ, ListBlank.append, Common.replicate_cons,
      Nat.add_assoc, Nat.add_left_comm, Nat.add_comm] using first.trans later

/-- The existing indexed macro returns to the exact next global iteration boundary. -/
theorem tick {q : Nat} (M : Machine q 2) (data : Nat → Fin q) (last width : Nat)
    (more : ∀ i, i < last → M.transition (data i) 0 = some (1, .right, data (i + 1)))
    (values : Nat → Nat) (safe : ∀ i, i ≤ last → values i < 2 ^ width)
    (localRun : ∀ i, i ≤ last → ∀ L R : ListBlank Bit,
      ∃ out : List Bit, out.length = width ∧ Counter.value out = values i ∧
      Common.Runs M
        ⟨data i, Tape.mk' (O i (L.cons 0))
          ((Z (values i + 1) (Z (width + 2) R)).cons 1)⟩
        ⟨data 0, Tape.mk' ((ListBlank.append out L).cons 0)
          (Z i (((Z (values i + 2) R).cons 1).cons 0))⟩)
    (i : Nat) (bound : i ≤ last) (L : ListBlank Bit) :
    Common.Runs M (boundary data i L)
      (boundary data (i + 1) (ListBlank.append (Packet.encode width (values i)) L)) := by
  obtain ⟨out, length, value, run⟩ := localRun i bound L blank
  have equal := Packet.encode_unique width (values i) (safe i bound) out length value
  subst out
  simp only [zero_blank] at run
  have first := scan M data last more i 0 (by omega) (L.cons 0) (blank.cons 1)
  simp only [Nat.zero_add] at first
  simpa only [boundary, Z_succ, Z_cons] using first.trans run

/-- Nearest-head-first printed prefix; iteration does not unroll physical machine steps. -/
def written (word : Nat → List Bit) : Nat → List Bit
  | 0 => []
  | n + 1 => word n ++ written word n

theorem iterate {q : Nat} (M : Machine q 2) (data : Nat → Fin q) (last : Nat)
    (word : Nat → List Bit)
    (tick : ∀ i, i ≤ last → ∀ L : ListBlank Bit,
      Common.Runs M (boundary data i L)
        (boundary data (i + 1) (ListBlank.append (word i) L)))
    (count : Nat) (bound : count ≤ last + 1) (L : ListBlank Bit) :
    Common.Runs M (boundary data 0 L)
      (boundary data count (ListBlank.append (written word count) L)) := by
  induction count with
  | zero => exact .refl
  | succ n ih =>
    have first := ih (by omega)
    have later := tick n (by omega) (ListBlank.append (written word n) L)
    simpa only [written, ListBlank.append_assoc] using first.trans later

/-- Include the paid final zero row and the data_out one branch, preserving printed data. -/
theorem finish {q : Nat} (M : Machine q 2) (data : Nat → Fin q) (exit post : Fin q)
    (last : Nat)
    (more : ∀ i, i < last → M.transition (data i) 0 = some (1, .right, data (i + 1)))
    (final : M.transition (data last) 0 = some (0, .right, exit))
    (done : M.transition exit 1 = some (1, .right, post)) (L : ListBlank Bit) :
    Common.Runs M (boundary data (last + 1) L)
      ⟨post, Tape.mk' (((O last (L.cons 0)).cons 0).cons 1) blank⟩ := by
  have first := Common.of_run M (last + 1) _ _
    (Data.unary_run M data exit last more final last 0 (by omega) (L.cons 0) (blank.cons 1))
  have later := Common.right M exit post 1 1 ((O last (L.cons 0)).cons 0) blank done
  simpa only [boundary, Z, O, ListBlank.append, Nat.zero_add] using first.trans later

/-- Ordered output is exactly the chronological word sequence. -/
theorem written_reverse (word : Nat → List Bit) (count : Nat) :
    (written word count).reverse = (List.range count).flatMap (fun i ↦ (word i).reverse) := by
  induction count with
  | zero => rfl
  | succ n ih => simp [written, List.reverse_append, List.range_succ, ih]

end ConjectureMachines.Compilation.Parsimony.Global
