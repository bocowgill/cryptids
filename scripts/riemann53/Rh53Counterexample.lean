/-
Copyright (c) 2026 The Cryptids Authors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Riemann95Definition
public import Cryptids.ReductionSupport.Riemann95.ControlStep95

/-! A finite counterexample to the proposed state-53 skipped-bit return encoding. -/

@[expose] public section

namespace Rh53Counterexample

open Turing ConjectureMachines
open ConjectureMachines.Riemann95

/-- Delete precisely the bit read at old state 53 along the literal preserving decoder. -/
def skipFrom (q : Fin 95) : List (Fin 2) → List (Fin 2)
  | [] => []
  | b :: bs =>
    match Riemann95.machine.transition q b with
    | some (w, .right, next) =>
      if w = b then
        if q = 53 then skipFrom next bs else b :: skipFrom next bs
      else b :: bs
    | _ => b :: bs

/-- The proposed control-word encoding starts at the actual root state. -/
def E (word : Schema.Word) : Schema.Word := skipFrom 15 word

/-- The actual zero-DEC return operation, using the accepted implementation. -/
def B (word : Schema.Word) : Schema.Word :=
  (Riemann120.Layer2.popBreakRev 1 word.reverse).reverse

theorem actual_word : Schema.word (.outside 44) = [1,0,0,1,1,1,0,1,1] := by
  decide +kernel

theorem actual_walked : Control.walked (.outside 44) = [1,0,0,1,1,1,0,1,1,0] := by
  decide +kernel

theorem actual_instruction :
    Control.instruction (.outside 44) = .decnz 0 (.outside 45) (.outside 47) := by
  decide +kernel

theorem state53_zero : Riemann95.machine.transition 53 0 = some (0, .right, 68) := by
  decide +kernel

theorem state53_one : Riemann95.machine.transition 53 1 = some (1, .right, 68) := by
  decide +kernel

theorem encoded_walked : E (Control.walked (.outside 44)) = [1,0,0,1,1,1,1,1,0] := by
  decide +kernel

theorem old_return : B (Control.walked (.outside 44)) = Schema.word (.outside 47) := by
  decide +kernel

theorem left_exact : E (B (Control.walked (.outside 44))) = [1,0,0,1,1,1] := by
  decide +kernel

theorem right_exact : B (E (Control.walked (.outside 44))) = [1,0,1] := by
  decide +kernel

/-- The proposed encoding fails to commute with the genuine zero-DEC return. -/
theorem counterexample :
    E (B (Control.walked (.outside 44))) ≠ B (E (Control.walked (.outside 44))) := by
  decide +kernel

end Rh53Counterexample
