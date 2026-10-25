/-
Copyright (c) 2026 The Cryptids Authors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import GuardCore
public import Cryptids.ReductionSupport.Riemann95.Bootstrap95

/-! A finite initializer certificate; it does not prove unbounded avoidance. -/

@[expose] public section

namespace Rh41

open ConjectureMachines ConjectureMachines.Riemann95

def safeFast : Nat → Fin 95 → List (Fin 2) → Fin 2 → List (Fin 2) → Bool
  | 0, q, _, h, _ => !(q == 41 && h == 1)
  | n + 1, q, L, h, R =>
    !(q == 41 && h == 1) &&
      match Zf380.stepFast machine q L h R with
      | none => true
      | some (q', L', h', R') => safeFast n q' L' h' R'

/-- All prefixes, including the final configuration, are checked. -/
theorem safeFast_sound (n : Nat) (q : Fin 95) (L : List (Fin 2))
    (h : Fin 2) (R : List (Fin 2)) (hc : safeFast n q L h R = true) :
    PrefixSafe n (Zf380.cfgOfFast q L h R) := by
  induction n generalizing q L h R with
  | zero =>
    intro k hk d hd
    have hk0 : k = 0 := by omega
    subst k
    simp only [nSteps, Option.some.injEq] at hd
    subst d
    have hh : ¬ (q = 41 ∧ h = 1) := by
      rintro ⟨rfl, rfl⟩
      simp [safeFast] at hc
    simpa [Avoid, Zf380.cfgOfFast, Tape.mk'] using hh
  | succ n ih =>
    have hparts := Bool.and_eq_true_iff.mp hc
    have hh : ¬ (q = 41 ∧ h = 1) := by
      rintro ⟨rfl, rfl⟩
      simpa using hparts.1
    intro k hk d hd
    cases k with
    | zero =>
      simp only [nSteps, Option.some.injEq] at hd
      subst d
      simpa [Avoid, Zf380.cfgOfFast, Tape.mk'] using hh
    | succ k =>
      rw [nSteps, Zf380.step_cfgOfFast] at hd
      cases ht : Zf380.stepFast machine q L h R with
      | none => simp only [ht, Option.map_none, Option.bind_none] at hd; cases hd
      | some value =>
        rcases value with ⟨q', L', h', R'⟩
        have hnext : safeFast n q' L' h' R' = true := by
          simpa only [ht] using hparts.2
        simp only [ht, Option.map_some, Option.bind_some] at hd
        exact ih q' L' h' R' hnext k (by omega) d hd

set_option maxRecDepth 200000 in
theorem boot_safe_fast : safeFast 3634 0 [] 0 [] = true := by
  decide +kernel

theorem boot_prefix_safe : PrefixSafe 3634 (init : Cfg 95 2) := by
  rw [Zf380.init_eq_cfgOfFast]
  exact safeFast_sound 3634 0 [] 0 [] boot_safe_fast

theorem boot_endpoint : nSteps 3634 (init : Cfg 95 2) = some initialRoot :=
  BootCertificate.boot_reaches_initialRoot

end Rh41
