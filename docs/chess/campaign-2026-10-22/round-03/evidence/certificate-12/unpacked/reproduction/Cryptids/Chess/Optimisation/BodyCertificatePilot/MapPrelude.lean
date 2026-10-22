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

noncomputable def classMap (s : Fin 573802) : Fin 114487 :=
  Fin.ofNat 114487 (mapTree.lookup s.val 0)

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Body class map prelude checked"
