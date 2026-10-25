/-
Copyright (c) 2026 The Cryptids Authors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import GuardBoot
public import Cryptids.ReductionSupport.Riemann95.RootNative95

/-! Bounded proof attempt for the first missing all-intermediate native trace lemma.
This module is a probe until its strict build succeeds; it is not an audited root.
-/

@[expose] public section

namespace Rh41

open Turing ConjectureMachines ConjectureMachines.Riemann95

set_option maxHeartbeats 400000 in
theorem native_trace_safe (c : Schema.ControlWord) (r : Fin 5) (inc : Bool)
    (he : Control.effect c = if inc then .inc r else .decnz r)
    (pad : Nat) (bank : List Nat) (hr : r.val < bank.length)
    (hfill : 3 ≤ pad - (Control.walked c).length) :
    ∃ s ≥ 1, ∃ d, nSteps s (Physical.rootCfg pad (Schema.word c) bank) = some d ∧
      PrefixSafe s (Physical.rootCfg pad (Schema.word c) bank) := by
  obtain ⟨s, hs, hend⟩ := Dispatch.root_native c r inc he pad bank hr hfill
  refine ⟨s, hs, _, hend, ?_⟩
  intro k hk d hd
  simp only [Avoid]
  aesop

end Rh41
