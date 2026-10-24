module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.NumericLocal

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open ConjectureMachines.Optimisation
open Chess.Optimisation NumericLocalPilot
namespace LookupCachePilot
set_option backward.isDefEq.respectTransparency false

structure Cell where
  classId : Nat
  zeroWord : Nat
  oneWord : Nat

noncomputable def checkCell (address : Nat) (cell : Cell) : Bool :=
  decide (mapTree.lookup address 0 = cell.classId) &&
    decide (quotientTree.lookup cell.classId (0, 0) = (cell.zeroWord, cell.oneWord))

theorem checkCell_sound (address : Nat) (cell : Cell)
    (checked : checkCell address cell = true) :
    mapTree.lookup address 0 = cell.classId ∧
      quotientTree.lookup (mapTree.lookup address 0) (0, 0) = (cell.zeroWord, cell.oneWord) := by
  have parts : decide (mapTree.lookup address 0 = cell.classId) = true ∧
      decide (quotientTree.lookup cell.classId (0, 0) =
        (cell.zeroWord, cell.oneWord)) = true := by
    simpa only [checkCell, Bool.and_eq_true] using checked
  have classes := of_decide_eq_true parts.1
  refine ⟨classes, ?_⟩
  rewrite [classes]
  exact of_decide_eq_true parts.2

noncomputable def validate : Balanced.RowTree Cell → Nat → Option Nat
  | .empty, start => some start
  | .leaf cell, start => if checkCell start cell then some (start + 1) else none
  | .branch leftCount left right, start =>
      match validate left start with
      | none => none
      | some middle => if middle = start + leftCount then validate right middle else none

theorem leaf_checked (cell : Cell) (start finish : Nat)
    (checked : validate (.leaf cell) start = some finish) :
    checkCell start cell = true ∧ finish = start + 1 := by
  by_cases good : checkCell start cell = true
  · have same : start + 1 = finish :=
      Option.some.inj (by simpa only [validate, ite_eq_left good] using checked)
    exact ⟨good, same.symm⟩
  · simp only [validate, ite_eq_right good, reduceCtorEq] at checked

theorem branch_checked (leftCount : Nat) (left right : Balanced.RowTree Cell)
    (start finish : Nat) (checked : validate (.branch leftCount left right) start =
      some finish) :
    ∃ middle, validate left start = some middle ∧ middle = start + leftCount ∧
      validate right middle = some finish := by
  cases leftScan : validate left start with
  | none => simp only [validate, leftScan, reduceCtorEq] at checked
  | some middle =>
    by_cases splitAt : middle = start + leftCount
    · exact ⟨middle, rfl, splitAt,
        by simpa only [validate, leftScan, ite_eq_left splitAt] using checked⟩
    · simp only [validate, leftScan, ite_eq_right splitAt, reduceCtorEq] at checked

theorem validate_extent (tree : Balanced.RowTree Cell) (start finish : Nat)
    (checked : validate tree start = some finish) : finish = start + tree.count := by
  induction tree generalizing start finish with
  | empty =>
    have same : start = finish := Option.some.inj checked
    simpa only [Balanced.RowTree.count, Nat.add_zero] using same.symm
  | leaf cell =>
    simpa only [Balanced.RowTree.count] using (leaf_checked cell start finish checked).2
  | branch leftCount left right ihLeft ihRight =>
    obtain ⟨middle, leftScan, _splitAt, rightScan⟩ :=
      branch_checked leftCount left right start finish checked
    have first := ihLeft start middle leftScan
    have last := ihRight middle finish rightScan
    simpa only [Balanced.RowTree.count, Nat.add_assoc] using last.trans
      (congrArg (fun n ↦ n + right.count) first)

theorem lookup_sound (tree : Balanced.RowTree Cell) (start finish : Nat)
    (checked : validate tree start = some finish) (i : Nat) (bound : i < finish - start)
    (fallback : Cell) : checkCell (start + i) (tree.lookup i fallback) = true := by
  induction tree generalizing start finish i with
  | empty =>
    have same : start = finish := Option.some.inj checked
    omega
  | leaf cell =>
    have parts := leaf_checked cell start finish checked
    have endAt := parts.2
    have zeroIndex : i = 0 := by omega
    subst i
    simpa only [Balanced.RowTree.lookup, ↓reduceIte, Nat.add_zero] using parts.1
  | branch leftCount left right ihLeft ihRight =>
    obtain ⟨middle, leftScan, splitAt, rightScan⟩ :=
      branch_checked leftCount left right start finish checked
    by_cases before : i < leftCount
    · have word := ihLeft start middle leftScan i (by omega)
      simpa only [Balanced.RowTree.lookup, ite_eq_left before] using word
    · have word := ihRight middle finish rightScan (i - leftCount) (by omega)
      have address : middle + (i - leftCount) = start + i := by omega
      simpa only [Balanced.RowTree.lookup, ite_eq_right before, address] using word

def zeroCell : Cell := ⟨0, 0, 0⟩

noncomputable def observedPair (address : Nat) : Nat × Nat :=
  quotientTree.lookup (mapTree.lookup address 0) (0, 0)

noncomputable def cachedClass (tree : Balanced.RowTree Cell) (start finish address : Nat) : Nat :=
  if start ≤ address ∧ address < finish then (tree.lookup (address - start) zeroCell).classId
  else mapTree.lookup address 0

noncomputable def cachedPair (tree : Balanced.RowTree Cell) (start finish address : Nat) :
    Nat × Nat :=
  if start ≤ address ∧ address < finish then
    let cell := tree.lookup (address - start) zeroCell
    (cell.zeroWord, cell.oneWord)
  else observedPair address

theorem cachedClass_eq (tree : Balanced.RowTree Cell) (start finish : Nat)
    (checked : validate tree start = some finish) (address : Nat) :
    cachedClass tree start finish address = mapTree.lookup address 0 := by
  by_cases inside : start ≤ address ∧ address < finish
  · have selected := lookup_sound tree start finish checked (address - start) (by omega) zeroCell
    have actual := checkCell_sound _ _ selected
    have position : start + (address - start) = address := by omega
    simpa only [cachedClass, ite_eq_left inside, position] using actual.1.symm
  · simp only [cachedClass, ite_eq_right inside]

theorem cachedPair_eq (tree : Balanced.RowTree Cell) (start finish : Nat)
    (checked : validate tree start = some finish) (address : Nat) :
    cachedPair tree start finish address = observedPair address := by
  by_cases inside : start ≤ address ∧ address < finish
  · have selected := lookup_sound tree start finish checked (address - start) (by omega) zeroCell
    have actual := checkCell_sound _ _ selected
    have position : start + (address - start) = address := by omega
    simpa only [cachedPair, ite_eq_left inside, observedPair, position] using actual.2.symm
  · simp only [cachedPair, ite_eq_right inside]

end LookupCachePilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Numeric observation cache preserves every lookup including fallback"
