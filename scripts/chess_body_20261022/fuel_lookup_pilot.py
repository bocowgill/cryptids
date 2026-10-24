#!/usr/bin/env python3
"""Remote-only bounded comparison of tree-below and height-bounded path lookup."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

import hashlib
import json


SOURCE = r'''open ConjectureMachines.Optimisation
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
'''


def generate_core(driver, api):
    names = ['lookupFuel', 'lookupFuel_eq', 'height_branch']
    driver.emit('FuelLookup.lean', api.header([api.MODULE + '.LookupCache']) + SOURCE +
                api.audit_and_end(driver, 'FuelLookup',
                    ['FuelLookupPilot.' + name for name in names],
                    'Fuel-bounded path lookup equals original lookup at every address'))


def generate_heights(driver, api):
    parts = [api.header([api.MODULE + '.FuelLookup']),
             'open FuelLookupPilot\nnamespace FuelHeightsPilot\n']
    roots, proposals = [], {}
    for family in ['map', 'quotient']:
        path = api.ROOT / api.PREFIX / (family + '-chunks.json')
        metadata = (driver.summary['map_layouts'] if family == 'map' else
                    driver.summary['quotient_layouts'])[family]['manifest']
        assert hashlib.sha256(path.read_bytes()).hexdigest() == metadata['sha256']
        data = json.loads(path.read_text())
        heights = {}
        for node in data['postorder_nodes']:
            name = node['name']
            root = 'height_' + name
            if node['kind'] == 'chunk':
                limit = (node['states'] - 1).bit_length()
                parts.append(f'theorem {root} : {name}.height ≤ {limit} := by\n'
                             '  decide +kernel\n')
            else:
                left, right = node['left'], node['right']
                lh, rh = heights[left], heights[right]
                limit = max(lh, rh) + 1
                parts.append(f'theorem {root} : {name}.height ≤ {limit} := by\n'
                             f'  exact height_branch {node["left_count"]} {left} {right}\n'
                             f'    {lh} {rh} height_{left} height_{right}\n')
            heights[name] = limit
            roots.append('FuelHeightsPilot.' + root)
        assembled = data['postorder_nodes'][-1]['name']
        limit = heights[assembled]
        assert limit < 33
        parts.append(f'theorem {family}_height : {family}Tree.height ≤ {limit} :=\n'
                     f'  height_{assembled}\n'
                     f'theorem {family}_fuel : {family}Tree.height + 1 ≤ 33 := by\n'
                     f'  have bound := {family}_height\n  omega\n')
        roots += ['FuelHeightsPilot.' + family + suffix for suffix in ['_height', '_fuel']]
        proposals[family] = dict(proposed_height_bound=limit, kernel_checked=False,
                                required_node_height_proofs=len(heights), fuel=33)
    parts.append('end FuelHeightsPilot\n')
    driver.emit('FuelHeights.lean', ''.join(parts) + api.audit_and_end(driver, 'FuelHeights', roots,
                'Actual map and quotient heights certify sufficient lookup fuel'))
    driver.summary['fuel_height_proposals'] = proposals
    driver.checkpoint()


FAST = r'''open ConjectureMachines.Optimisation
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
    rfl

theorem validate_branch (leftCount : Nat) (left right : Balanced.RowTree Cell)
    (start middle finish : Nat) (leftChecked : validate left start = some middle)
    (middleAt : middle = start + leftCount) (rightChecked : validate right middle =
      some finish) : validate (.branch leftCount left right) start = some finish := by
  simpa only [validate, leftChecked, ite_eq_left middleAt] using rightChecked

end FuelObservationPilot
'''


def generate_fast(driver, api):
    names = ['checkCell', 'checkCell_eq', 'validate', 'validate_eq', 'validate_branch']
    driver.emit('FuelObservation.lean', api.header([api.MODULE + '.FuelHeights']) + FAST +
                api.audit_and_end(driver, 'FuelObservation',
                    ['FuelObservationPilot.' + name for name in names],
                    'Fuel observation checker agrees with original numeric cache checker'))


def generate_comparison(driver, api, count=8192):
    path = api.ROOT / api.PREFIX / f'lookup-cache-{count}-nodes.json'
    nodes = json.loads(path.read_text())
    stem, namespace = f'FuelCache{count}', f'FuelCache{count}Pilot'
    data_namespace = f'LookupCache{count}Pilot'
    parts = [api.header([api.MODULE + '.FuelObservation',
                        api.MODULE + f'.LookupCache{count}Data']),
             f'open {data_namespace} FuelObservationPilot\nnamespace {namespace}\n']
    roots = []
    for node in nodes:
        first, size = node['first'], node['size']
        name = f'checked_{first}_{size}'
        parts.append(f'theorem {name} : FuelObservationPilot.validate\n'
                     f'    {data_namespace}.{node["name"]} {first} = some {first + size} := by\n')
        if node['kind'] == 'chunk':
            parts.append('  decide +kernel\n')
        else:
            half, middle = node['half'], first + node['half']
            parts.append(f'  exact FuelObservationPilot.validate_branch {half}\n'
                         f'    {data_namespace}.{node["left"]} {data_namespace}.{node["right"]}\n'
                         f'    {first} {middle} {first + size}\n'
                         f'    checked_{first}_{half} rfl checked_{middle}_{size - half}\n')
        roots.append(namespace + '.' + name)
    parts.append(f'theorem checked : FuelObservationPilot.validate {data_namespace}.cache 0 =\n'
                 f'    some {count} := checked_0_{count}\n'
                 f'theorem original_checked : LookupCachePilot.validate\n'
                 f'    {data_namespace}.cache 0 = some {count} :=\n'
                 f'  (FuelObservationPilot.validate_eq {data_namespace}.cache 0).symm.trans checked\n'
                 f'end {namespace}\n')
    roots += [namespace + '.checked', namespace + '.original_checked']
    driver.emit(stem + '.lean', ''.join(parts) + api.audit_and_end(driver, stem, roots,
                f'Fuel lookup comparison preserves all {count} expected observations'))
    negative = f'''module
public import {api.MODULE}.{stem}
public meta import Lean
public meta section
open Lean Elab Term Meta Command
elab "submit_wrong_fuel_extent" : command => do
  liftTermElabM do
    let name := `{api.NS}.{namespace}.checked
    let info ← getConstInfo name
    let equality ← whnf info.type
    unless equality.isAppOfArity ``Eq 3 do throwError "Expected fuel-check equality"
    let args := equality.getAppArgs
    let wrong := mkApp2 (Lean.mkConst ``Option.some [Level.zero])
      (Lean.mkConst ``Nat) (mkNatLit {count + 1})
    let proposition ← mkEq args[1]! wrong
    Lean.addDecl (.thmDecl {{
      name := `{api.NS}.deliberately_false_fuel_extent
      levelParams := []
      type := proposition
      value := Lean.mkConst name
    }}) true
submit_wrong_fuel_extent
'''
    driver.emit('FuelCacheNegative.lean', negative)
    driver.summary['fuel_comparison_proposed'] = dict(entries=count, chunk_limit=256,
        data_namespace=data_namespace, same_data_as_original=True, kernel_checked=False,
        source_rows_certified=0, new_accepted_machine=False)
    driver.checkpoint()


def run(driver, api):
    generate_core(driver, api)
    driver.run('FuelLookup', 60,
               'Fuel-bounded path lookup equals original lookup at every address')
    generate_heights(driver, api)
    driver.run('FuelHeights', 120, 'Actual map and quotient heights certify sufficient lookup fuel')
    for proposal in driver.summary['fuel_height_proposals'].values():
        proposal['kernel_checked'] = True
    generate_fast(driver, api)
    driver.run('FuelObservation', 60,
               'Fuel observation checker agrees with original numeric cache checker')
    generate_comparison(driver, api)
    driver.run('FuelCache8192', 120,
               'Fuel lookup comparison preserves all 8192 expected observations')
    driver.summary['fuel_comparison_proposed']['kernel_checked'] = True
    driver.run('FuelCacheNegative', 45, negative=True)
    driver.summary['fuel_lookup_kernel_corruption_rejected'] = True
    driver.summary['fuel_lookup_comparison_checked'] = True
    driver.checkpoint()
