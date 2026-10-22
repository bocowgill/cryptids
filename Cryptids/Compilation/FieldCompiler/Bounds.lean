/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.FieldCompiler.Operations

/-! # Uniform paid allocation for every normalized field operation -/

@[expose] public section
namespace ConjectureMachines.Compilation.FieldCompiler
open Turing FieldBinary

set_option backward.isDefEq.respectTransparency false

theorem emit_size_le {α : Type} {n : Nat} (p : Routine α) (k : α → Syntax n)
    (cost : Nat) (positive : 1 ≤ cost) (bound : ∀ a, (k a).size ≤ cost) :
    (emit p k).size ≤ (cost + 2) * p.size := by
  induction p with
  | exit value => simpa [emit, Routine.size] using (bound value).trans (by omega)
  | next action rest ih =>
    rcases action with ⟨write, dir⟩
    cases write <;> simp only [emit, Syntax.size, Routine.size] at * <;> omega
  | read dir zero one iz io =>
    simp only [emit, Syntax.size, Routine.size]
    nlinarith

theorem select5_size {n : Nat} (f : Fin 5 → Syntax n) :
    (select5 f).size = (f 0).size + (f 1).size + (f 2).size +
      (f 3).size + (f 4).size + 4 := by
  simp [select5, Syntax.size]
  omega

/-- A uniform1024-node block covers every operation, regardless of all finite table contents. -/
theorem lower_size {n : Nat} (op : Op n) : (lower op).size ≤ 1024 := by
  cases op with
  | move dir next =>
    have h := emit_size_le (moveCell dir) (fun _ ↦ go (fun _ ↦ next)) 1 (by omega)
      (fun _ ↦ by rfl)
    simpa only [lower, moveCell_size] using h.trans (by decide : 3 * 14 ≤ 1024)
  | write field value next =>
    have fieldBound : fieldOffset field ≤ 9 := by
      have := field.isLt
      simp only [fieldOffset]
      omega
    have each (v : Fin 5) :
        (emit (writeAt (fieldOffset field) (encodeWord (value v)))
          (fun _ ↦ go (fun _ ↦ next))).size ≤ 69 := by
      have h := emit_size_le (writeAt (fieldOffset field) (encodeWord (value v)))
        (fun _ ↦ go (fun _ ↦ next)) 1 (by omega) (fun _ ↦ by rfl)
      rw [writeAt_size] at h
      omega
    simp only [lower, select5_size]
    have h0 := each 0
    have h1 := each 1
    have h2 := each 2
    have h3 := each 3
    have h4 := each 4
    omega
  | load field value next =>
    have fieldBound : fieldOffset field ≤ 9 := by
      have := field.isLt
      simp only [fieldOffset]
      omega
    have h := emit_size_le (readAt (fieldOffset field))
      (fun word ↦ .load (table fun _ v ↦ value v (decodeWord word))
        (go (fun _ ↦ next))) 2 (by omega) (fun _ ↦ by rfl)
    rw [readAt_size] at h
    change _ ≤ 1024
    omega
  | pureLoad value next => change 2 ≤ 1024; decide
  | marker yes no =>
    have h := emit_size_le FieldContinuation.markerRoutine
      (fun marker ↦ go (fun _ ↦ if marker then yes else no)) 1 (by omega)
      (fun _ ↦ by rfl)
    have size : FieldContinuation.markerRoutine.size = 37 := rfl
    rw [size] at h
    exact h.trans (by decide)
  | absent field yes no =>
    have fieldBound : fieldOffset field ≤ 9 := by
      have := field.isLt
      simp only [fieldOffset]
      omega
    have h := emit_size_le (readAt (fieldOffset field))
      (fun word ↦ go (fun _ ↦ if (decodeWord word).val = 0 then yes else no))
      1 (by omega) (fun _ ↦ by rfl)
    rw [readAt_size] at h
    change _ ≤ 1024
    omega
  | branch test yes no => change 3 ≤ 1024; decide
  | jump target => change 1 ≤ 1024; decide
  | halt => change 1 ≤ 1024; decide

end ConjectureMachines.Compilation.FieldCompiler
