/-
Copyright (c) 2026 The Cryptids Authors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.ReductionSupport.Riemann95.Parser95
public import Cryptids.ReductionSupport.Riemann95.ControlStep95

/-! Exact symbolic aliases for the approved decoder-sharing family. -/

@[expose] public section

namespace RhShare

open Turing ConjectureMachines
open ConjectureMachines.Riemann95

abbrev Word := List (Fin 2)
abbrev ControlWord := Schema.ControlWord

def members : Array (Fin 95) := #[26, 46, 50, 86, 87, 94]

def pairs : Array (Fin 95 × Fin 95) := #[
  (26,46), (26,50), (26,86), (26,87), (26,94),
  (46,50), (46,86), (46,87), (46,94),
  (50,86), (50,87), (50,94), (86,87), (86,94), (87,94)]

def pair (i : Fin 30) : Fin 95 × Fin 95 := pairs.getD (i.val / 2) (26,46)

def keep (i : Fin 30) : Fin 95 := if i.val % 2 = 0 then (pair i).1 else (pair i).2

def remove (i : Fin 30) : Fin 95 := if i.val % 2 = 0 then (pair i).2 else (pair i).1

def reprState (i : Fin 30) (q : Fin 95) : Fin 95 := if q = remove i then keep i else q

/-- Dense label of the representative, as a natural number. -/
def dense (i : Fin 30) (q : Fin 95) : Nat :=
  (reprState i q).val - (if (remove i).val < (reprState i q).val then 1 else 0)

/-- Query a row on demand; no complete 94-state table is generated. -/
def transition (i : Fin 30) (q : Fin 95) (b : Fin 2) :=
  (Riemann95.machine.transition (reprState i q) b).map fun (w, d, next) =>
    (w, d, reprState i next)

def walk (i : Fin 30) (q : Fin 95) : Word → Option (Fin 95)
  | [] => some (reprState i q)
  | b :: bs =>
    match transition i q b with
    | some (w, .right, next) => if w = b then walk i next bs else none
    | _ => none

def expected (i : Fin 30) (c : ControlWord) : Option Nat :=
  (Parser.walkInternal 15 (Control.walked c)).map (dense i)

def observed (i : Fin 30) (c : ControlWord) : Option Nat :=
  (walk i 15 (Control.walked c)).map (dense i)

def failure (i : Fin 30) (c : ControlWord) : Prop :=
  (Parser.walkInternal 15 (Control.walked c)).isSome = true ∧ observed i c ≠ expected i c

/-- Use the existing computable comparisons for the named endpoint predicate. -/
instance failureDecidable (i : Fin 30) (c : ControlWord) : Decidable (failure i c) :=
  inferInstanceAs (Decidable
    ((Parser.walkInternal 15 (Control.walked c)).isSome = true ∧
      observed i c ≠ expected i c))

/-- Every ordered pair of distinct family members occurs among the 30 choices. -/
theorem family_exact : ∀ a b : Fin 6, a ≠ b → ∃ i : Fin 30,
    keep i = members.getD a.val 26 ∧ remove i = members.getD b.val 26 := by
  decide +kernel

/-- Every encoded endpoint is in the dense 94-state range. -/
theorem dense_range : ∀ i : Fin 30, ∀ q : Fin 95, dense i q < 94 := by
  decide +kernel

end RhShare
