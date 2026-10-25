/-
Copyright (c) 2026 The Cryptids Authors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import GuardLiteral

/-! Local separator safety and the conditional one-cell isolation theorem. -/

@[expose] public section

namespace Rh41

open Turing ConjectureMachines ConjectureMachines.Riemann95

def Avoid (c : Cfg 95 2) : Prop := ¬ (c.state = 41 ∧ c.tape.head = 1)

def Guard58 (c : Cfg 95 2) : Prop :=
  c.state = 58 → c.tape.head = 1 → c.tape.right.head = 0

def PrefixSafe (n : Nat) (c : Cfg 95 2) : Prop :=
  ∀ k ≤ n, ∀ d, nSteps k c = some d → Avoid d

/-- Any actual step entering 41 is safe when its source satisfies the separator guard. -/
theorem step_avoids (c d : Cfg 95 2) (hg : Guard58 c)
    (hs : step machine c = some d) : Avoid d := by
  rcases c with ⟨q, t⟩
  simp only [step, Option.map_eq_some_iff] at hs
  rcases hs with ⟨⟨w, dir, next⟩, ht, rfl⟩
  rintro ⟨hq, hb⟩
  obtain ⟨hq58, hbit, _, hdir⟩ := incoming_only q t.head w dir next ht hq
  have hz := hg hq58 hbit
  have hb' : t.right.head = 1 := by simpa only [hdir, Tape.write, Tape.move] using hb
  exact (by decide : (0 : Fin 2) ≠ 1) (hz.symm.trans hb')

/-- The DEC-j separator step is safe for arbitrary complete half-tapes. -/
theorem separator_step (L R : ListBlank (Fin 2)) :
    step machine ⟨58, Tape.mk' L (ListBlank.cons 1 (ListBlank.cons 0 R))⟩ =
      some ⟨41, Tape.mk' (ListBlank.cons 0 L) (ListBlank.cons 0 R)⟩ := by
  have ht : machine.transition 58 1 = some (0, .right, 41) := rfl
  simp [step, ht, Tape.mk', Tape.write, Tape.move]

theorem separator_avoids (L R : ListBlank (Fin 2)) :
    Avoid ⟨41, Tape.mk' (ListBlank.cons 0 L) (ListBlank.cons 0 R)⟩ := by
  simp [Avoid, Tape.mk']

/-- This is a symbolic isolated overwrite, not an exported candidate table. -/
def overwrite (replacement : Option (Fin 2 × Dir × Fin 95)) : Machine 95 2 :=
  ⟨fun q b ↦ if q = 41 ∧ b = 1 then replacement else machine.transition q b⟩

theorem step_overwrite (replacement : Option (Fin 2 × Dir × Fin 95))
    (c : Cfg 95 2) (ha : Avoid c) : step (overwrite replacement) c = step machine c := by
  rcases c with ⟨q, t⟩
  simp only [Avoid] at ha
  simp only [step, overwrite, if_neg ha]

def run (m : Machine 95 2) : Nat → Cfg 95 2 → Option (Cfg 95 2)
  | 0, c => some c
  | n + 1, c => (step m c).bind (run m n)

/-- Conditional only: the global avoidance premise must still be established. -/
theorem isolated_overwrite_of_avoidance
    (replacement : Option (Fin 2 × Dir × Fin 95)) (c : Cfg 95 2)
    (ha : ∀ k d, nSteps k c = some d → Avoid d) (n : Nat) :
    run (overwrite replacement) n c = nSteps n c := by
  induction n generalizing c with
  | zero => rfl
  | succ n ih =>
    rw [run, nSteps, step_overwrite replacement c (ha 0 c rfl)]
    cases hs : step machine c with
    | none => rfl
    | some d =>
      simp only [Option.bind_some]
      apply ih d
      intro k e he
      apply ha (k + 1) e
      simpa only [nSteps, hs, Option.bind_some] using he

end Rh41
