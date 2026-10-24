module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.FuelHeights

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open ConjectureMachines.Optimisation
open LookupCachePilot FuelLookupPilot FuelHeightsPilot
namespace FuelObservationPilot
set_option backward.isDefEq.respectTransparency false

noncomputable def checkCell (address : Nat) (cell : Cell) : Bool :=
  decide (lookupFuel 33 mapTree address 0 = cell.classId) &&
    decide (lookupFuel 33 quotientTree cell.classId (0, 0) = (cell.zeroWord, cell.oneWord))

theorem checkCell_eq (address : Nat) (cell : Cell) :
    checkCell address cell = LookupCachePilot.checkCell address cell := by
  have mapEq := lookupFuel_eq 33 mapTree address (0 : Nat) map_fuel
  have rowEq := lookupFuel_eq 33 quotientTree cell.classId (0, 0) quotient_fuel
  simp only [checkCell, LookupCachePilot.checkCell, mapEq, rowEq]

noncomputable def validate : Balanced.RowTree Cell → Nat → Option Nat
  | .empty, start => some start
  | .leaf cell, start => if checkCell start cell then some (start + 1) else none
  | .branch leftCount left right, start =>
      match validate left start with
      | none => none
      | some middle => if middle = start + leftCount then validate right middle else none

theorem validate_eq (tree : Balanced.RowTree Cell) (start : Nat) :
    validate tree start = LookupCachePilot.validate tree start := by
  induction tree generalizing start with
  | empty => rfl
  | leaf cell => simp only [validate, LookupCachePilot.validate, checkCell_eq]
  | branch leftCount left right ihLeft ihRight =>
    simp only [validate, LookupCachePilot.validate, ihLeft, ihRight]

theorem validate_branch (leftCount : Nat) (left right : Balanced.RowTree Cell)
    (start middle finish : Nat) (leftChecked : validate left start = some middle)
    (middleAt : middle = start + leftCount) (rightChecked : validate right middle =
      some finish) : validate (.branch leftCount left right) start = some finish := by
  simpa only [validate, leftChecked, ite_eq_left middleAt] using rightChecked

end FuelObservationPilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Fuel observation checker agrees with original numeric cache checker"
