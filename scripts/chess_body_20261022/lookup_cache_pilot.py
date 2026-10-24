#!/usr/bin/env python3
"""Remote-only numerical observation cache; this does not certify source rows."""
import os
import json

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')


SOURCE = r'''open ConjectureMachines.Optimisation
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

theorem validate_branch (leftCount : Nat) (left right : Balanced.RowTree Cell)
    (start middle finish : Nat) (leftChecked : validate left start = some middle)
    (middleAt : middle = start + leftCount) (rightChecked : validate right middle =
      some finish) : validate (.branch leftCount left right) start = some finish := by
  simpa only [validate, leftChecked, ite_eq_left middleAt] using rightChecked

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
'''


def generate_tools(driver, api):
    names = ['Cell', 'checkCell', 'checkCell_sound', 'validate', 'leaf_checked',
             'branch_checked', 'validate_branch', 'validate_extent', 'lookup_sound', 'zeroCell',
             'observedPair', 'cachedClass', 'cachedPair', 'cachedClass_eq', 'cachedPair_eq']
    driver.emit('LookupCache.lean', api.header([api.MODULE + '.NumericLocal']) + SOURCE +
                api.audit_and_end(driver, 'LookupCache',
                    ['LookupCachePilot.' + name for name in names],
                    'Numeric observation cache preserves every lookup including fallback'))
    loaders = f'''module
public import {api.MODULE}.LookupCache

meta section
namespace {api.NS}.LookupCacheGenerator
open Lean Elab Term Meta Command ConjectureMachines

elab "load_observation_cache% " path:str : term <= expectedType? => do
  let expected ← instantiateMVars expectedType?
  unless expected.isAppOfArity ``Compilation.Balanced.RowTree 1 do
    throwError "Expected observation tree"
  let rowType := expected.getAppArgs[0]!
  let cellName := ``{api.NS}.LookupCachePilot.Cell
  unless rowType.isConstOf cellName do throwError "Expected observation cells"
  let maker := Lean.mkConst
    ``{api.NS}.LookupCachePilot.Cell.mk
  let content ← liftM (m := IO) (IO.FS.readFile path.getString)
  let mut entries : Array Expr := #[]
  for raw in content.splitOn "\\n" do
    let line := raw.trimAscii.toString
    if !line.isEmpty then
      match (line.splitOn " ").filter (fun cell ↦ !cell.isEmpty) with
      | [classText, zeroText, oneText] =>
          let some cls := classText.toNat? | throwError "Malformed class"
          let some first := zeroText.toNat? | throwError "Malformed zero word"
          let some second := oneText.toNat? | throwError "Malformed one word"
          entries := entries.push (mkApp3 maker (mkNatLit cls) (mkNatLit first) (mkNatLit second))
      | _ => throwError "Expected exactly three natural fields"
  TableSyntax.balancedRowsExpr rowType entries 0 entries.size
end {api.NS}.LookupCacheGenerator
end
set_option pp.proofs false in
#print ConjectureMachines.Compilation.Balanced.RowTree.lookup
run_cmd Lean.logInfo "Typed observation cache loader checked"
'''
    driver.emit('LookupCacheLoaders.lean', loaders)


def generate_data(driver, api, count, start=0, stem=None, fragments_only=False,
                  observations=None):
    if observations is None:
        mapping = api.words(driver.args.input / 'class-map.u32le', api.N)
        path = api.ROOT / api.PREFIX / 'quotient-packed.rows'
        pairs = [tuple(map(int, line.split())) for line in path.read_text().splitlines()]
    else:
        mapping, pairs = observations
    assert len(pairs) == api.K and 0 < count and 0 <= start < start + count <= api.N
    stem = stem or f'LookupCache{count}'
    namespace = stem + 'Pilot'
    cache_id = str(count) if start == 0 and stem == f'LookupCache{count}' else f'{start}-{count}'
    parts = [api.header([api.MODULE + '.LookupCacheLoaders']),
             'open LookupCachePilot\n' + f'namespace {namespace}\n']
    nodes = []

    def tree(first, size):
        name = f'cache_{first}_{size}'
        if size <= 256:
            filename = f'lc-{cache_id}/{first:06d}-{size:04d}.cache'
            rows = []
            for address in range(first, first + size):
                cls = mapping[address]
                a, b = pairs[cls]
                rows.append(f'{cls} {a} {b}')
            driver.emit(filename, '\n'.join(rows) + '\n')
            body = f'  load_observation_cache%\n    "{api.PREFIX}/{filename}"'
            nodes.append(dict(name=name, first=first, size=size, kind='chunk'))
        else:
            half = size // 2
            left, right = tree(first, half), tree(first + half, size - half)
            body = f'  .branch {half} {left} {right}'
            nodes.append(dict(name=name, first=first, size=size, kind='branch',
                              half=half, left=left, right=right))
        parts.append(f'noncomputable def {name} : Balanced.RowTree Cell :=\n{body}\n')
        return name

    root = tree(start, count)
    driver.emit(f'lookup-cache-{cache_id}-nodes.json', json.dumps(nodes, indent=2) + '\n')
    parts.append(f'noncomputable def cache : Balanced.RowTree Cell := {root}\n'
                 f'end {namespace}\n')
    data_roots = [namespace + '.cache']
    if not fragments_only:
        driver.emit(stem + 'Data.lean', ''.join(parts) + api.audit_and_end(driver, stem + 'Data',
                    data_roots, f'Numeric observation cache data loaded: {count}'))
    proofs = []
    for node in nodes:
        first, size = node['first'], node['size']
        declaration = f'checked_{first}_{size}'
        proofs.append(f'theorem {declaration} : validate {node["name"]} {first} =\n'
                      f'    some {first + size} := by\n')
        if node['kind'] == 'chunk':
            proofs.append('  decide +kernel\n')
        else:
            half, middle = node['half'], first + node['half']
            proofs.append(f'  exact validate_branch {half} {node["left"]} {node["right"]}\n'
                          f'    {first} {middle} {first + size}\n'
                          f'    checked_{first}_{half} rfl checked_{middle}_{size - half}\n')
    check_header = api.header([api.MODULE + '.' + stem + 'Data'])
    checked = (check_header +
               'open LookupCachePilot\n' + f'namespace {namespace}\n' + ''.join(proofs) + f'''
theorem checked : validate cache {start} = some {start + count} := checked_{start}_{count}

theorem count_exact : cache.count = {count} := by
  have extent := validate_extent cache {start} {start + count} checked
  omega

theorem within_body : {start + count} ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache {start} {start + count} address = mapTree.lookup address 0 :=
  cachedClass_eq cache {start} {start + count} checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache {start} {start + count} address = observedPair address :=
  cachedPair_eq cache {start} {start + count} checked address

end {namespace}
''')
    check_roots = ([namespace + '.checked_' + str(node['first']) + '_' + str(node['size'])
                    for node in nodes] +
                   [namespace + '.' + name for name in ['checked', 'count_exact',
                    'within_body', 'all_cached_classes', 'all_cached_words']])
    if not fragments_only:
        driver.emit(stem + '.lean', checked + api.audit_and_end(driver, stem,
                    check_roots, f'Numeric observation cache fidelity checked: {count}'))
    cls, (a, b) = mapping[0], pairs[mapping[0]]
    if not fragments_only and start == 0 and count == 128:
        controls = api.header([api.MODULE + '.' + stem]) + f'''open LookupCachePilot
namespace LookupCacheControlsPilot
theorem bad_class_rejected : checkCell 0 ⟨{cls + 1}, {a}, {b}⟩ = false := by
  decide +kernel
theorem bad_word_rejected : checkCell 0 ⟨{cls}, {a + 1}, {b}⟩ = false := by
  decide +kernel
end LookupCacheControlsPilot
'''
        driver.emit('LookupCacheControls.lean', controls + api.audit_and_end(driver,
            'LookupCacheControls', ['LookupCacheControlsPilot.bad_class_rejected',
             'LookupCacheControlsPilot.bad_word_rejected'], 'Cache class and word corruption rejected'))
        negative = f'''module
public import {api.MODULE}.{stem}
public meta import Lean
public meta section
open Lean Elab Term Meta Command
elab "submit_wrong_cache_extent" : command => do
  liftTermElabM do
    let name := `{api.NS}.{namespace}.checked
    let info ← getConstInfo name
    let equality ← whnf info.type
    unless equality.isAppOfArity ``Eq 3 do throwError "Expected cache equality"
    let args := equality.getAppArgs
    let wrong := mkApp2 (Lean.mkConst ``Option.some [Level.zero])
      (Lean.mkConst ``Nat) (mkNatLit {count + 1})
    let proposition ← mkEq args[1]! wrong
    Lean.addDecl (.thmDecl {{
      name := `{api.NS}.deliberately_false_cache_extent
      levelParams := []
      type := proposition
      value := Lean.mkConst name
    }}) true
submit_wrong_cache_extent
'''
        driver.emit('LookupCacheNegative.lean', negative)
    key = f'lookup_cache_{count}_proposed' if cache_id == str(count) else stem + '_proposed'
    driver.summary[key] = dict(
        first_address=start, end_address=start + count, entries=count, fields_per_entry=3,
        data_representation='typed expression loader, ordinary Cell/RowTree constructors',
        validation_representation='composed independently checked chunks of at most 256 cells',
        chunk_limit=256, required_chunk_and_branch_proofs=len(nodes),
        kernel_checked=False, source_rows_certified=0, new_accepted_machine=False)
    if fragments_only:
        return dict(data=''.join(parts[1:]), checks=checked[len(check_header):],
                    validation=('open LookupCachePilot\nnamespace ' + namespace + '\n' +
                        ''.join(proofs) +
                        f'theorem checked : validate cache {start} = some {start + count} :=\n'
                        f'  checked_{start}_{count}\nend {namespace}\n'),
                    validation_roots=check_roots[:len(nodes)] + [namespace + '.checked'],
                    data_roots=data_roots, check_roots=check_roots,
                    summary_key=key, namespace=namespace)
    driver.checkpoint()


def run(driver, api):
    driver.summary.update(classification='NUMERIC_OBSERVATION_CACHE_FIDELITY_PILOT',
                          numeric_lookup_cache_only=True,
                          completed_numeric_observation_entries=0)
    generate_tools(driver, api)
    driver.run('LookupCache', 60,
               'Numeric observation cache preserves every lookup including fallback')
    driver.summary['numeric_observation_cache_soundness_checked'] = True
    driver.checkpoint()
    driver.run('LookupCacheLoaders', 60, 'Typed observation cache loader checked')
    driver.summary['numeric_observation_cache_loader_checked'] = True
    for count, seconds in [(128, 60), (8192, 120), (65536, 180)]:
        generate_data(driver, api, count)
        stem = f'LookupCache{count}'
        driver.run(stem + 'Data', 60, f'Numeric observation cache data loaded: {count}')
        driver.run(stem, seconds, f'Numeric observation cache fidelity checked: {count}')
        driver.summary[f'lookup_cache_{count}_proposed']['kernel_checked'] = True
        driver.summary['completed_numeric_observation_entries'] = count
        driver.checkpoint()
        if count == 128:
            driver.run('LookupCacheControls', 60, 'Cache class and word corruption rejected')
            driver.run('LookupCacheNegative', 45, negative=True)
            driver.summary['numeric_lookup_cache_corruption_controls_checked'] = True
        if count == 8192:
            # Fail fast on the new generic/comparison proof before replaying
            # the already established larger numeric-cache dependency.
            import fuel_lookup_pilot
            fuel_lookup_pilot.run(driver, api)
    driver.summary.update(status='lookup_cache_passed')
    driver.checkpoint()
    print('Numeric observation cache fidelity pilot passed', flush=True)
