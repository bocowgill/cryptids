#!/usr/bin/env python3
"""Remote-only checked collection of source row/census certificates."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')


SOURCE = r'''open ConjectureMachines.Optimisation
open Chess.Optimisation FieldCompiler LocalRulePilot
namespace SourceScopeToolsPilot
set_option backward.isDefEq.respectTransparency false
attribute [local irreducible] FieldPacked.getter FieldPacked.layout
attribute [local irreducible] FieldAware.syntaxRows FieldSelectiveLayout.code

def SourceRows (q : Fin 4042) : Prop :=
  (∀ (slot : Fin (FieldPacked.syntaxRows.get q).size) (bit : Bool) (value : Fin 5),
    RowAt (mainIndex (FieldSelectiveLayout.nodeIndex q slot) value) (Binary.encodeSymbol bit)) ∧
  (∀ (rank : Fin (FieldSelectiveLayout.localSize q)) (bit : Bool) (value : Fin 5),
    RowAt (SelectiveBinary.bounceState (FieldSelectiveLayout.liveReturn q rank value))
      (Binary.encodeSymbol bit))

theorem source_rows_of_local (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p)
    (main : Coherent q p) (returned : ReturnCoherent q p) : SourceRows q := by
  cases same
  constructor
  · intro slot bit value
    change RowAt (mainIndex
      (slotIndex q (FieldPacked.syntaxRows.get q) rfl slot) value) (Binary.encodeSymbol bit)
    exact main_rows_local q (FieldPacked.syntaxRows.get q) rfl main slot bit value
  · intro rank bit value
    change RowAt (bounceIndex q (FieldPacked.syntaxRows.get q) rfl rank value)
      (Binary.encodeSymbol bit)
    exact return_rows_local q (FieldPacked.syntaxRows.get q) rfl returned rank bit value

structure SourceCertificate where
  label : Fin 4042
  nodes : Nat
  returns : Nat
  nodes_eq : (FieldPacked.syntaxRows.get label).size = nodes
  returns_eq : FieldSelectiveLayout.localSize label = returns
  rows : SourceRows label

-- The branch cache is unused: this proof collection is scanned, never indexed.
def scan : Balanced.RowTree SourceCertificate → Nat → Option (Nat × Nat × Nat)
  | .empty, start => some (start, 0, 0)
  | .leaf record, start =>
      if record.label.val = start then some (start + 1, record.nodes, record.returns) else none
  | .branch _ left right, start =>
      match scan left start with
      | none => none
      | some (middle, leftNodes, leftReturns) =>
          match scan right middle with
          | none => none
          | some (finish, rightNodes, rightReturns) =>
              some (finish, leftNodes + rightNodes, leftReturns + rightReturns)

theorem scan_covers (tree : Balanced.RowTree SourceCertificate)
    (start finish nodes returns : Nat) (checked : scan tree start = some (finish, nodes, returns)) :
    ∀ q : Fin 4042, start ≤ q.val → q.val < finish → SourceRows q := by
  induction tree generalizing start finish nodes returns with
  | empty =>
    intro q lo hi
    have totals : (start, 0, 0) = (finish, nodes, returns) := Option.some.inj checked
    have endpoints := congrArg Prod.fst totals
    omega
  | leaf record =>
    intro q lo hi
    by_cases correct : record.label.val = start
    · have totals : (start + 1, record.nodes, record.returns) = (finish, nodes, returns) :=
        Option.some.inj (by simpa only [scan, ite_eq_left correct] using checked)
      have endpoints := congrArg Prod.fst totals
      have same : q = record.label := Fin.ext (by omega)
      exact same.symm ▸ record.rows
    · simp only [scan, ite_eq_right correct, reduceCtorEq] at checked
  | branch _cache left right ihl ihr =>
    intro q lo hi
    cases leftScan : scan left start with
    | none => simp only [scan, leftScan, reduceCtorEq] at checked
    | some first =>
      rcases first with ⟨middle, leftNodes, leftReturns⟩
      cases rightScan : scan right middle with
      | none => simp only [scan, leftScan, rightScan, reduceCtorEq] at checked
      | some last =>
        rcases last with ⟨finishAt, rightNodes, rightReturns⟩
        have totals : (finishAt, leftNodes + rightNodes, leftReturns + rightReturns) =
            (finish, nodes, returns) :=
          Option.some.inj (by simpa only [scan, leftScan, rightScan] using checked)
        have endpoints : finishAt = finish := congrArg Prod.fst totals
        rewrite [← endpoints] at hi
        by_cases before : q.val < middle
        · exact ihl start middle leftNodes leftReturns leftScan q lo before
        · exact ihr middle finishAt rightNodes rightReturns rightScan q (by omega) hi

theorem scan_sizes (tree : Balanced.RowTree SourceCertificate)
    (start finish nodes returns : Nat) (checked : scan tree start = some (finish, nodes, returns)) :
    (tree.flatten.map (fun r ↦ (FieldPacked.syntaxRows.get r.label).size)).sum = nodes ∧
      (tree.flatten.map (fun r ↦ FieldSelectiveLayout.localSize r.label)).sum = returns := by
  induction tree generalizing start finish nodes returns with
  | empty =>
    have totals : (start, 0, 0) = (finish, nodes, returns) := Option.some.inj checked
    exact ⟨congrArg (fun value : Nat × Nat × Nat ↦ value.2.1) totals,
      congrArg (fun value : Nat × Nat × Nat ↦ value.2.2) totals⟩
  | leaf record =>
    by_cases correct : record.label.val = start
    · have totals : (start + 1, record.nodes, record.returns) = (finish, nodes, returns) :=
        Option.some.inj (by simpa only [scan, ite_eq_left correct] using checked)
      constructor
      · change (FieldPacked.syntaxRows.get record.label).size + 0 = nodes
        exact (Nat.add_zero _).trans (record.nodes_eq.trans
          (congrArg (fun value : Nat × Nat × Nat ↦ value.2.1) totals))
      · change FieldSelectiveLayout.localSize record.label + 0 = returns
        exact (Nat.add_zero _).trans (record.returns_eq.trans
          (congrArg (fun value : Nat × Nat × Nat ↦ value.2.2) totals))
    · simp only [scan, ite_eq_right correct, reduceCtorEq] at checked
  | branch _cache left right ihl ihr =>
    cases leftScan : scan left start with
    | none => simp only [scan, leftScan, reduceCtorEq] at checked
    | some first =>
      rcases first with ⟨middle, leftNodes, leftReturns⟩
      cases rightScan : scan right middle with
      | none => simp only [scan, leftScan, rightScan, reduceCtorEq] at checked
      | some last =>
        rcases last with ⟨finishAt, rightNodes, rightReturns⟩
        have totals : (finishAt, leftNodes + rightNodes, leftReturns + rightReturns) =
            (finish, nodes, returns) :=
          Option.some.inj (by simpa only [scan, leftScan, rightScan] using checked)
        have leftSizes := ihl start middle leftNodes leftReturns leftScan
        have rightSizes := ihr middle finishAt rightNodes rightReturns rightScan
        have nodeTotal : leftNodes + rightNodes = nodes :=
          congrArg (fun value : Nat × Nat × Nat ↦ value.2.1) totals
        have returnTotal : leftReturns + rightReturns = returns :=
          congrArg (fun value : Nat × Nat × Nat ↦ value.2.2) totals
        constructor
        · have combined := congrArg₂ (· + ·) leftSizes.1 rightSizes.1
          simpa only [Balanced.RowTree.flatten, List.map_append, List.sum_append] using
            combined.trans nodeTotal
        · have combined := congrArg₂ (· + ·) leftSizes.2 rightSizes.2
          simpa only [Balanced.RowTree.flatten, List.map_append, List.sum_append] using
            combined.trans returnTotal

end SourceScopeToolsPilot
'''


def generate(driver, header, audit_and_end, module):
    names = ['SourceRows', 'source_rows_of_local', 'SourceCertificate', 'scan', 'scan_covers',
             'scan_sizes']
    driver.emit('SourceScopeTools.lean', header([module + '.LocalRules']) + SOURCE + audit_and_end(
        driver, 'SourceScopeTools', ['SourceScopeToolsPilot.' + name for name in names],
        'Checked source certificate collection covers every claimed source label'))
