#!/usr/bin/env python3
"""Remote-only first-order node/return checker and exact natural return inverse."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')


SOURCE = r'''open ConjectureMachines.Compilation
open FieldCompiler NumericTreePilot
namespace NumericControlPilot
set_option backward.isDefEq.respectTransparency false

theorem idxOf_values {n : Nat} (values : List (Fin n)) (child : Fin n) :
    (values.map Fin.val).idxOf child.val = values.idxOf child := by
  induction values with
  | nil => rfl
  | cons head tail ih =>
    simpa only [List.map_cons, List.idxOf_cons, beq_iff_eq, Fin.ext_iff] using
      congrArg (fun k : Nat ↦ if head = child then 0 else k + 1) ih

def rankOf (targets : List Nat) (child : Nat) : Option Nat :=
  let index := targets.idxOf child
  if index < targets.length then some index else none

theorem rankOf_bounded (targets : List Nat) (child rank : Nat)
    (found : rankOf targets child = some rank) : rank < targets.length := by
  by_cases good : targets.idxOf child < targets.length <;> simp_all [rankOf]

theorem rankOf_paid (p : Syntax 4042) (child : Fin p.size) :
    rankOf (paidTargets (encode 0 p)) child.val =
      (FieldReturns.findTarget p child).map Fin.val := by
  by_cases good : (FieldReturns.targets p).idxOf child < 1 + FieldReturns.writeCount p <;>
    simp only [paidTargets_correct, Nat.zero_add, rankOf, idxOf_values, List.length_map,
      FieldReturns.targets_length, FieldReturns.findTarget, good, ↓reduceIte,
      ↓reduceDIte, Option.map_some, Option.map_none]

theorem rankOf_targetAt (p : Syntax 4042) (rank : Fin (1 + FieldReturns.writeCount p)) :
    rankOf (paidTargets (encode 0 p)) (FieldReturns.targetAt p rank).val = some rank.val := by
  simpa only [FieldReturns.findTarget_targetAt, Option.map_some] using
    rankOf_paid p (FieldReturns.targetAt p rank)

structure Observation where
  pairAt : Nat → Nat × Nat
  command : Bool → Turing.Dir → Nat → Nat

structure Layout where
  main : Nat → Fin 5 → Nat
  returned : Nat → Fin 5 → Nat
  entry : Fin 4042 → Fin 5 → Nat
  halt : Nat
  targets : List Nat

def rowWord (observation : Observation) (address : Nat) (bit : Bool) : Nat :=
  let row := observation.pairAt address
  if bit then row.2 else row.1

def allBelow : Nat → (Nat → Bool) → Bool
  | 0, _ => true
  | n + 1, f => allBelow n f && f n

theorem allBelow_sound (n : Nat) (f : Nat → Bool) (checked : allBelow n f = true)
    (i : Nat) (bound : i < n) : f i = true := by
  induction n with
  | zero => omega
  | succ n ih =>
    have parts : allBelow n f = true ∧ f n = true := by
      simpa only [allBelow, Bool.and_eq_true] using checked
    by_cases before : i < n
    · exact ih parts.1 before
    · have same : i = n := by omega
      simpa only [same] using parts.2

def allValues (f : Fin 5 → Bool) : Bool :=
  allBelow 5 fun i ↦ if h : i < 5 then f ⟨i, h⟩ else false

theorem allValues_sound (f : Fin 5 → Bool) (checked : allValues f = true)
    (value : Fin 5) : f value = true := by
  have selected := allBelow_sound 5 _ checked value.val value.isLt
  simpa only [value.isLt, ↓reduceDIte] using selected

def checkPair (observation : Observation) (address zeroWord oneWord : Nat) : Bool :=
  match observation.pairAt address with
  | (first, second) => (first == zeroWord) && (second == oneWord)

theorem checkPair_sound (observation : Observation) (address zeroWord oneWord : Nat)
    (checked : checkPair observation address zeroWord oneWord = true) (bit : Bool) :
    rowWord observation address bit = if bit then oneWord else zeroWord := by
  have parts : (observation.pairAt address).1 = zeroWord ∧
      (observation.pairAt address).2 = oneWord := by
    cases row : observation.pairAt address with
    | mk first second =>
      simpa only [checkPair, row, Bool.and_eq_true, beq_iff_eq] using checked
  cases bit
  · exact parts.1
  · exact parts.2

def step (observation : Observation) (layout : Layout) (node : Node)
    (bit : Bool) (value : Fin 5) : Nat :=
  match node with
  | .move dir child => observation.command bit dir (layout.main child value)
  | .write table child =>
      match rankOf layout.targets child with
      | none => 0
      | some rank => observation.command (table.read bit value) .right (layout.returned rank value)
  | .load table child => rowWord observation (layout.main child (table.read bit value)) bit
  | .branch table yes no =>
      if table.read bit value then rowWord observation (layout.main yes value) bit
      else rowWord observation (layout.main no value) bit
  | .go table => observation.command bit .right (layout.entry (table.read bit value) value)
  | .halt => observation.command bit .right layout.halt

def checkNode (observation : Observation) (layout : Layout) (slot : Nat) (node : Node) : Bool :=
  let here := fun value ↦ layout.main slot value
  match node with
  | .move dir child => allValues fun value ↦ checkPair observation (here value)
      (observation.command false dir (layout.main child value))
      (observation.command true dir (layout.main child value))
  | .write table child =>
      match rankOf layout.targets child with
      | none => allValues fun value ↦ checkPair observation (here value) 0 0
      | some rank => allValues fun value ↦ checkPair observation (here value)
          (observation.command (table.read false value) .right (layout.returned rank value))
          (observation.command (table.read true value) .right (layout.returned rank value))
  | .load table child => allValues fun value ↦ checkPair observation (here value)
      (rowWord observation (layout.main child (table.read false value)) false)
      (rowWord observation (layout.main child (table.read true value)) true)
  | .branch table yes no => allValues fun value ↦ checkPair observation (here value)
      (if table.read false value then rowWord observation (layout.main yes value) false
        else rowWord observation (layout.main no value) false)
      (if table.read true value then rowWord observation (layout.main yes value) true
        else rowWord observation (layout.main no value) true)
  | .go table => allValues fun value ↦ checkPair observation (here value)
      (observation.command false .right (layout.entry (table.read false value) value))
      (observation.command true .right (layout.entry (table.read true value) value))
  | .halt => allValues fun value ↦ checkPair observation (here value)
      (observation.command false .right layout.halt) (observation.command true .right layout.halt)

theorem checkNode_sound (observation : Observation) (layout : Layout) (slot : Nat)
    (node : Node) (checked : checkNode observation layout slot node = true)
    (bit : Bool) (value : Fin 5) :
    rowWord observation (layout.main slot value) bit = step observation layout node bit value := by
  cases node with
  | move dir child | load dir child | branch dir child other | go dir | halt =>
    simp only [checkNode] at checked
    have selected := allValues_sound _ checked value
    have word := checkPair_sound observation _ _ _ selected bit
    cases bit <;> simpa only [step, Bool.false_eq_true, ↓reduceIte] using word
  | write table child =>
    cases found : rankOf layout.targets child with
    | none =>
      simp only [checkNode, found] at checked
      have selected := allValues_sound _ checked value
      have word := checkPair_sound observation _ _ _ selected bit
      cases bit <;> simpa only [step, found, Bool.false_eq_true, ↓reduceIte] using word
    | some rank =>
      simp only [checkNode, found] at checked
      have selected := allValues_sound _ checked value
      have word := checkPair_sound observation _ _ _ selected bit
      cases bit <;> simpa only [step, found, Bool.false_eq_true, ↓reduceIte] using word

def checkTrace (observation : Observation) (layout : Layout) : Trace → Bool
  | .leaf slot node => checkNode observation layout slot node
  | .unary slot node rest => checkNode observation layout slot node &&
      checkTrace observation layout rest
  | .branch slot node yes no => checkNode observation layout slot node &&
      (checkTrace observation layout yes && checkTrace observation layout no)

def RowAt (observation : Observation) (layout : Layout) (slot : Nat) (node : Node) : Prop :=
  ∀ (bit : Bool) (value : Fin 5),
    rowWord observation (layout.main slot value) bit = step observation layout node bit value

def TraceRows (observation : Observation) (layout : Layout) : Trace → Prop
  | .leaf slot node => RowAt observation layout slot node
  | .unary slot node rest => RowAt observation layout slot node ∧
      TraceRows observation layout rest
  | .branch slot node yes no => RowAt observation layout slot node ∧
      TraceRows observation layout yes ∧ TraceRows observation layout no

theorem checkTrace_sound (observation : Observation) (layout : Layout) (trace : Trace)
    (checked : checkTrace observation layout trace = true) :
    TraceRows observation layout trace := by
  induction trace with
  | leaf slot node => exact checkNode_sound observation layout slot node checked
  | unary slot node rest ih =>
    have parts : checkNode observation layout slot node = true ∧
        checkTrace observation layout rest = true := by
      simpa only [checkTrace, Bool.and_eq_true] using checked
    exact ⟨checkNode_sound observation layout slot node parts.1, ih parts.2⟩
  | branch slot node yes no ihYes ihNo =>
    have parts : checkNode observation layout slot node = true ∧
        checkTrace observation layout yes = true ∧
        checkTrace observation layout no = true := by
      simpa only [checkTrace, Bool.and_eq_true] using checked
    exact ⟨checkNode_sound observation layout slot node parts.1,
      ihYes parts.2.1, ihNo parts.2.2⟩

def checkReturns (observation : Observation) (layout : Layout) : Bool :=
  allBelow layout.targets.length fun rank ↦
    let target := layout.targets.getD rank 0
    allValues fun value ↦ checkPair observation (layout.returned rank value)
      (observation.command false .left (layout.main target value))
      (observation.command true .left (layout.main target value))

def ReturnRows (observation : Observation) (layout : Layout) : Prop :=
  ∀ (rank : Nat), rank < layout.targets.length → ∀ (bit : Bool) (value : Fin 5),
    rowWord observation (layout.returned rank value) bit =
      observation.command bit .left (layout.main (layout.targets.getD rank 0) value)

theorem checkReturns_sound (observation : Observation) (layout : Layout)
    (checked : checkReturns observation layout = true) : ReturnRows observation layout := by
  intro rank bound bit value
  have selected := allBelow_sound layout.targets.length _ checked rank bound
  have cell := allValues_sound _ selected value
  have word := checkPair_sound observation _ _ _ cell bit
  cases bit <;> exact word

theorem rank_three : rankOf [8, 3] 3 = some 1 := by decide +kernel

theorem rank_absent : rankOf [8, 3] 9 = none := by decide +kernel

def testObservation : Observation := ⟨fun _ ↦ (3, 7), fun _ _ _ ↦ 0⟩

theorem correct_pair : checkPair testObservation 0 3 7 = true := by decide +kernel

theorem wrong_pair_rejected : checkPair testObservation 0 4 7 = false := by decide +kernel

end NumericControlPilot
'''


def generate(driver, api):
    names = ['idxOf_values', 'rankOf', 'rankOf_bounded', 'rankOf_paid', 'rankOf_targetAt',
             'Observation', 'Layout', 'rowWord', 'allBelow', 'allBelow_sound',
             'allValues', 'allValues_sound', 'checkPair', 'checkPair_sound', 'step',
             'checkNode', 'checkNode_sound', 'checkTrace', 'RowAt', 'TraceRows',
             'checkTrace_sound', 'checkReturns', 'ReturnRows', 'checkReturns_sound',
             'rank_three', 'rank_absent', 'testObservation', 'correct_pair', 'wrong_pair_rejected']
    driver.emit('NumericControl.lean', api.header([api.MODULE + '.NumericTree']) + SOURCE +
        api.audit_and_end(driver, 'NumericControl', ['NumericControlPilot.' + n for n in names],
            'Numeric node and paid-return checks preserve all bit and store cases'))
    negative = f'''module
public import {api.MODULE}.NumericControl
public meta import Lean
public meta section
open Lean Elab Term Meta Command
elab "submit_false_numeric_rank" : command => do
  liftTermElabM do
    let name := `{api.NS}.NumericControlPilot.rank_three
    let info ← getConstInfo name
    let equality ← whnf info.type
    unless equality.isAppOfArity ``Eq 3 do throwError "Expected rank equality"
    let args := equality.getAppArgs
    let wrong := mkApp2 (Lean.mkConst ``Option.some [Level.zero])
      (Lean.mkConst ``Nat) (mkNatLit 2)
    let proposition ← mkEq args[1]! wrong
    Lean.addDecl (.thmDecl {{
      name := `{api.NS}.deliberately_false_numeric_rank
      levelParams := []
      type := proposition
      value := Lean.mkConst name
    }}) true
submit_false_numeric_rank
'''
    driver.emit('NumericControlNegative.lean', negative)
    driver.summary['numeric_control_proposed'] = dict(required_roots=len(names),
        kernel_checked=False, actual_source_rows_certified=0, new_accepted_machine=False,
        observation_layout_abstract=True, concrete_source_transport_checked=False)
    driver.checkpoint()


def run(driver, api):
    generate(driver, api)
    driver.run('NumericControl', 60,
               'Numeric node and paid-return checks preserve all bit and store cases')
    driver.summary['numeric_control_proposed']['kernel_checked'] = True
    driver.summary['numeric_control_core_checked'] = True
    driver.run('NumericControlNegative', 45, negative=True)
    driver.summary['numeric_control_kernel_corruption_rejected'] = True
    driver.checkpoint()
