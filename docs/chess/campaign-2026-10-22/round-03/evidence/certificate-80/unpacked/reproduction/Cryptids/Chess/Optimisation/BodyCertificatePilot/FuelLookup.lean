module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LookupCache

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open ConjectureMachines.Optimisation
namespace FuelLookupPilot
set_option backward.isDefEq.respectTransparency false

-- Structural recursion is on the short fuel, not on the large table tree.
def lookupFuel {α : Type} : Nat → Balanced.RowTree α → Nat → α → α
  | 0, _, _, fallback => fallback
  | _ + 1, .empty, _, fallback => fallback
  | _ + 1, .leaf row, index, fallback => if index = 0 then row else fallback
  | fuel + 1, .branch leftCount left right, index, fallback =>
      if index < leftCount then lookupFuel fuel left index fallback
      else lookupFuel fuel right (index - leftCount) fallback
termination_by structural fuel => fuel

theorem lookupFuel_eq {α : Type} (fuel : Nat) (tree : Balanced.RowTree α)
    (index : Nat) (fallback : α) (enough : tree.height + 1 ≤ fuel) :
    lookupFuel fuel tree index fallback = tree.lookup index fallback := by
  induction fuel generalizing tree index with
  | zero => omega
  | succ fuel ih =>
    cases tree with
    | empty => rfl
    | leaf row => rfl
    | branch leftCount left right =>
      have leftLe := le_max_left left.height right.height
      have rightLe := le_max_right left.height right.height
      simp only [Balanced.RowTree.height] at enough
      by_cases before : index < leftCount
      · simp only [lookupFuel, Balanced.RowTree.lookup, ite_eq_left before]
        exact ih left index (by omega)
      · simp only [lookupFuel, Balanced.RowTree.lookup, ite_eq_right before]
        exact ih right (index - leftCount) (by omega)

theorem height_branch {α : Type} (leftCount : Nat) (left right : Balanced.RowTree α)
    (leftBound rightBound : Nat) (leftHeight : left.height ≤ leftBound)
    (rightHeight : right.height ≤ rightBound) :
    (Balanced.RowTree.branch leftCount left right).height ≤
      max leftBound rightBound + 1 :=
  Nat.add_le_add_right (max_le_max leftHeight rightHeight) 1

end FuelLookupPilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Fuel-bounded path lookup equals original lookup at every address"
