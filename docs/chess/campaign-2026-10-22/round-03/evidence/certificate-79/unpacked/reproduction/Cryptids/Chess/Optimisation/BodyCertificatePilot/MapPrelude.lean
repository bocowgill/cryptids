module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.MapData

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
-- Check every raw leaf; no modulo conversion can conceal an out-of-range value.
def mapAllBelow : Balanced.RowTree Nat → Nat → Bool
  | .empty, _ => true
  | .leaf value, bound => decide (value < bound)
  | .branch _ left right, bound => mapAllBelow left bound && mapAllBelow right bound

theorem lookup_lt_of_allBelow (tree : Balanced.RowTree Nat) (bound fallback : Nat)
    (bounded : mapAllBelow tree bound = true) (fallback_lt : fallback < bound)
    (index : Nat) : tree.lookup index fallback < bound := by
  induction tree generalizing index with
  | empty => exact fallback_lt
  | leaf value =>
      have value_lt : value < bound := of_decide_eq_true bounded
      simp only [Balanced.RowTree.lookup]
      split
      · exact value_lt
      · exact fallback_lt
  | branch leftCount left right ihl ihr =>
      have both : mapAllBelow left bound = true ∧ mapAllBelow right bound = true := by
        simpa only [mapAllBelow, Bool.and_eq_true] using bounded
      simp only [Balanced.RowTree.lookup]
      split
      · apply ihl
        exact both.1
      · apply ihr
        exact both.2

theorem map_count_branch (left right : Balanced.RowTree Nat) (nl nr : Nat)
    (hl : left.count = nl) (hr : right.count = nr) :
    (Balanced.RowTree.branch nl left right).count = nl + nr :=
  congrArg₂ Nat.add hl hr

theorem map_valid_branch (left right : Balanced.RowTree Nat) (nl : Nat)
    (hc : left.count = nl) (hl : left.WellFormed) (hr : right.WellFormed) :
    (Balanced.RowTree.branch nl left right).WellFormed :=
  ⟨hc.symm, hl, hr⟩

theorem map_bounded_branch (left right : Balanced.RowTree Nat) (nl bound : Nat)
    (hl : mapAllBelow left bound = true) (hr : mapAllBelow right bound = true) :
    mapAllBelow (Balanced.RowTree.branch nl left right) bound = true :=
  Bool.and_eq_true_iff.mpr ⟨hl, hr⟩

def MapFacts (tree : Balanced.RowTree Nat) (size bound : Nat) : Prop :=
  tree.count = size ∧ tree.WellFormed ∧ mapAllBelow tree bound = true

def checkMap : Balanced.RowTree Nat → Nat → Option Nat
  | .empty, _ => some 0
  | .leaf value, bound => if value < bound then some 1 else none
  | .branch cached left right, bound =>
      match checkMap left bound, checkMap right bound with
      | some nl, some nr => if cached = nl then some (nl + nr) else none
      | _, _ => none

theorem checkMap_sound (tree : Balanced.RowTree Nat) (bound size : Nat)
    (checked : checkMap tree bound = some size) : MapFacts tree size bound := by
  induction tree generalizing size with
  | empty =>
    have eq : 0 = size := Option.some.inj checked
    subst size
    exact ⟨rfl, trivial, rfl⟩
  | leaf value =>
    by_cases h : value < bound
    · have eq : 1 = size := Option.some.inj (by
        simpa only [checkMap, ite_eq_left h] using checked)
      subst size
      refine ⟨rfl, trivial, ?_⟩
      simpa only [mapAllBelow, decide_eq_true_eq] using h
    · simp only [checkMap, ite_eq_right h, reduceCtorEq] at checked
  | branch cached left right ihl ihr =>
    cases hl : checkMap left bound with
    | none => simp only [checkMap, hl, reduceCtorEq] at checked
    | some nl =>
      cases hr : checkMap right bound with
      | none => simp only [checkMap, hl, hr, reduceCtorEq] at checked
      | some nr =>
        by_cases hc : cached = nl
        · have eq : nl + nr = size := Option.some.inj (by
            simpa only [checkMap, hl, hr, ite_eq_left hc] using checked)
          subst size
          obtain ⟨hcl, hvl, hbl⟩ := ihl nl hl
          obtain ⟨hcr, hvr, hbr⟩ := ihr nr hr
          exact ⟨congrArg₂ Nat.add hcl hcr,
            ⟨hc.trans hcl.symm, hvl, hvr⟩, Bool.and_eq_true_iff.mpr ⟨hbl, hbr⟩⟩
        · simp only [checkMap, hl, hr, ite_eq_right hc, reduceCtorEq] at checked

theorem map_facts_branch (left right : Balanced.RowTree Nat) (nl nr bound : Nat)
    (hl : MapFacts left nl bound) (hr : MapFacts right nr bound) :
    MapFacts (.branch nl left right) (nl + nr) bound :=
  ⟨congrArg₂ Nat.add hl.1 hr.1, ⟨hl.1.symm, hl.2.1, hr.2.1⟩,
    Bool.and_eq_true_iff.mpr ⟨hl.2.2, hr.2.2⟩⟩

noncomputable def classMap (s : Fin 573802) : Fin 114487 :=
  Fin.ofNat 114487 (mapTree.lookup s.val 0)

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Body class map prelude checked"
