#!/usr/bin/env python3
"""Remote-only actual-source fidelity and total-cost comparison without caches."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

import copy
import hashlib
import json

from raw_chunk_pilot import raw_op
from source_chunk_pilot import indent
import numeric_trace_literal_pilot as literals


def run(driver, api):
    assert driver.summary['numeric_source_adapter_checked']
    assert driver.summary['complete_typed_candidate_data_checked']
    assert driver.summary['local_chunk_kernel_corruption_rejected']
    assert hashlib.sha256(api.SNAPSHOT.read_bytes()).hexdigest() == api.SNAPSHOT_SHA
    data = json.loads(api.SNAPSHOT.read_text())
    proposal = json.loads((driver.args.output / 'source-operation-proposal.json').read_text())
    assert proposal['schema'] == 'finite-source-op-proposal-v1'
    operations = proposal['operations']
    assert len(operations) == 4042
    cases = [355, 445, 356]
    assert [operations[q][0] for q in cases] == [2, 1, 0]
    namespace = 'NumericActualDataPilot'
    parts = [api.header([api.MODULE + '.NumericSourceAdapter']),
        'open FieldCompiler RawLabelPilot RawChunkPilot\nnamespace ' + namespace + '\n']
    roots = []
    for q in cases:
        parts.append(f'def label_{q} : Fin 4042 := ⟨{q}, by decide +kernel⟩\n'
                     f'noncomputable def raw_{q} : RawOp :=\n' + indent(raw_op(operations[q])) + '\n'
                     f'noncomputable def syntax_{q} : Syntax 4042 :=\n'
                     f'  SourceRecipePilot.syntaxOf raw_{q}\n')
        parts.append(literals.render(q, data['syntax'][q], data['return_local_targets'][q]))
        roots += [namespace + '.' + key + '_' + str(q) for key in
                  ['label', 'raw', 'syntax', 'fragment']]
    bad_raw = copy.deepcopy(operations[355])
    bad_raw[2][0][0] = (bad_raw[2][0][0] + 1) % 5
    parts.append('noncomputable def bad_callback_355 : RawOp :=\n' + indent(raw_op(bad_raw)) + '\n')
    targets = data['return_local_targets'][445][1:]
    assert targets
    bad_targets = [targets[0] + 1] + targets[1:]
    parts.append('noncomputable def bad_targets_445 : NumericTreePilot.Fragment :=\n'
                 '  { fragment_445 with targets :=\n'
                 + '\n'.join(literals.natural_list(bad_targets, 2)) + ' }\n')
    slot, row = next((i, copy.deepcopy(row)) for i, row in enumerate(data['syntax'][445])
                     if row[0] == 1)
    row[1][0] = 1 - row[1][0]
    parts.append('noncomputable def bad_write_445 : NumericTreePilot.Node :=\n' +
                 '\n'.join(literals.node(row, 1)) + '\n')
    roots += [namespace + '.' + n for n in ['bad_callback_355', 'bad_targets_445', 'bad_write_445']]
    parts.append('end ' + namespace + '\n')
    driver.emit('NumericActualData.lean', ''.join(parts) + api.audit_and_end(
        driver, 'NumericActualData', roots, 'Untrusted numeric actual-source literals loaded'))
    profile = [api.header([api.MODULE + '.NumericActualData', 'Lean']).replace(
        'public import Lean\n', 'public meta import Lean\n'),
        'open FieldCompiler RawLabelPilot NumericActualDataPilot\n'
        'namespace NumericActualProfilePilot\n']
    proof_roots, expected = [], []
    parameters = {}
    for index, q in enumerate(cases):
        nodes = data['row_sizes'][q]
        returns = len(data['return_local_targets'][q])
        base, ret = data['prefix_offsets'][q], data['return_offsets'][q]
        parameters[q] = (base, ret, nodes, returns)
        suffix = f'{base} {ret} {nodes} {returns}'
        layout = f'(NumericSourceAdapterPilot.layout {base} {ret}\n' + \
                 f'        (NumericTreePilot.paidTargets fragment_{q}))'
        recipe = (f'NumericSourceAdapterPilot.checkRecipe label_{q} raw_{q}\n'
                  f'      fragment_{q} {suffix}')
        statements = {
            'source': f'erase (toTableOp (Snapshot.program label_{q})) = raw_{q}',
            'fidelity': f'fragment_{q} = NumericTreePilot.encode 0 syntax_{q}',
            'prefix': f'{base} = PrefixScanPilot.nodePrefixes.lookup label_{q}.val 0 ∧\n'
                      f'      {ret} = PrefixScanPilot.returnPrefixes.lookup label_{q}.val 0',
            'counts': f'fragment_{q}.count = {nodes} ∧\n'
                      f'      (NumericTreePilot.paidTargets fragment_{q}).length = {returns}',
            'main_original': f'StructuralCheckPilot.checkMain label_{q} syntax_{q} = true',
            'main_numeric': 'NumericControlPilot.checkTrace NumericSourceAdapterPilot.observation\n'
                            f'      {layout} fragment_{q}.trace = true',
            'return_original': f'DirectCheckPilot.checkReturns label_{q} syntax_{q} = true',
            'return_numeric': 'NumericControlPilot.checkReturns NumericSourceAdapterPilot.observation\n'
                              f'      {layout} = true',
            'whole_original': f'SourceRecipePilot.checkRecipe label_{q} raw_{q}\n'
                              f'      {nodes} {returns} = true',
            'whole_numeric': recipe + ' = true',
        }
        order = ['source', 'fidelity', 'prefix', 'counts']
        for component in ['main', 'return', 'whole']:
            kinds = ['original', 'numeric'] if index != 1 else ['numeric', 'original']
            order += [component + '_' + kind for kind in kinds]
        for component in order:
            for phase in ['before', 'after']:
                event = component + ':' + phase
                profile.append(api.progress_marker(event, q,
                    driver.args.output / 'SourceProfile-times.tsv'))
                expected.append([event, q])
                if phase == 'before':
                    profile.append(f'theorem {component}_{q} :\n'
                                   f'    {statements[component]} := by decide +kernel\n')
                    proof_roots.append('NumericActualProfilePilot.' + component + '_' + str(q))
        profile.append(f'noncomputable def original_certificate_{q} :\n'
            '    SourceScopeToolsPilot.SourceCertificate :=\n'
            f'  SourceRecipePilot.fromRaw label_{q} raw_{q} {nodes} {returns} whole_original_{q}\n'
            f'noncomputable def numeric_certificate_{q} :\n'
            '    SourceScopeToolsPilot.SourceCertificate :=\n'
            f'  NumericSourceAdapterPilot.fromRaw label_{q} raw_{q} fragment_{q}\n'
            f'    {suffix} whole_numeric_{q}\n')
        proof_roots += ['NumericActualProfilePilot.' + name + '_' + str(q) for name in
                        ['original_certificate', 'numeric_certificate']]
    b, r, n, t = parameters[355]
    wb, wr, wn, wt = parameters[445]
    bads = {
        'wrong_callback': 'NumericSourceAdapterPilot.checkRecipe label_355 bad_callback_355\n'
                          f'      fragment_355 {b} {r} {n} {t} = false',
        'wrong_targets': 'NumericSourceAdapterPilot.checkRecipe label_445 raw_445\n'
                         f'      bad_targets_445 {wb} {wr} {wn} {wt} = false',
        'wrong_row': 'NumericControlPilot.checkNode NumericSourceAdapterPilot.observation\n'
                     f'      (NumericSourceAdapterPilot.layout {wb} {wr}\n'
                     '        (NumericTreePilot.paidTargets fragment_445))\n'
                     f'      {slot} bad_write_445 = false',
        'baseline_wrong_callback': 'SourceRecipePilot.checkRecipe label_355 bad_callback_355\n'
                                   f'      {n} {t} = false',
        'wrong_count': 'NumericSourceAdapterPilot.checkRecipe label_355 raw_355\n'
                       f'      fragment_355 {b} {r} {n + 1} {t} = false',
        'wrong_prefix': 'NumericSourceAdapterPilot.checkRecipe label_355 raw_355\n'
                        f'      fragment_355 {b + 1} {r} {n} {t} = false',
    }
    for name, statement in bads.items():
        profile.append(f'theorem {name}_rejected :\n    {statement} := by decide +kernel\n')
        proof_roots.append('NumericActualProfilePilot.' + name + '_rejected')
    profile.append('end NumericActualProfilePilot\n')
    driver.emit('NumericActualProfile.lean', ''.join(profile) + api.audit_and_end(
        driver, 'NumericActualProfile', proof_roots,
        'Actual numeric source fidelity checker and original certificates compared'))
    negative = f'''module
public import {api.MODULE}.NumericActualProfile
public meta import Lean
public meta section
open Lean Elab Term Meta Command
elab "submit_false_numeric_actual_recipe" : command => do
  liftTermElabM do
    let name := `{api.NS}.NumericActualProfilePilot.whole_numeric_445
    let info ← getConstInfo name
    let equality ← whnf info.type
    unless equality.isAppOfArity ``Eq 3 do throwError "Expected checked recipe equality"
    let args := equality.getAppArgs
    unless args[0]!.isConstOf ``Bool do throwError "Expected Bool recipe"
    let proposition ← mkEq args[1]! (Lean.mkConst ``Bool.false)
    Lean.addDecl (.thmDecl {{
      name := `{api.NS}.deliberately_false_numeric_actual_recipe
      levelParams := []
      type := proposition
      value := Lean.mkConst name
    }}) true
submit_false_numeric_actual_recipe
'''
    driver.emit('NumericActualNegative.lean', negative)
    driver.summary['numeric_actual_profile_proposed'] = dict(labels=cases,
        data_roots=len(roots), required_roots=len(proof_roots), expected_events=expected,
        observation_cache_entries=0, old_and_new_exact_source_certificates=True,
        six_real_corruption_controls=True, data_kernel_checked=False, kernel_checked=False,
        substantial_source_scaling_established=False, new_accepted_machine=False)
    driver.checkpoint()
    # All planned concrete data/profile/negative sources already passed width guards.
    driver.run('NumericActualData', 60, 'Untrusted numeric actual-source literals loaded')
    driver.summary['numeric_actual_profile_proposed']['data_kernel_checked'] = True
    driver.run('NumericActualProfile', 120,
               'Actual numeric source fidelity checker and original certificates compared')
    events = [line.split('\t') for line in
              (driver.args.output / 'SourceProfile-times.tsv').read_text().splitlines()]
    assert [[event, int(q)] for event, q, _ in events] == expected
    stamps = [int(stamp) for _, _, stamp in events]
    assert all(a <= b for a, b in zip(stamps, stamps[1:]))
    durations = [dict(label=int(events[i][1]), component=events[i][0].removesuffix(':before'),
                      elapsed_ms=stamps[i + 1] - stamps[i]) for i in range(0, len(events), 2)]
    driver.summary['source_component_profile_durations'] = durations
    driver.summary['numeric_actual_profile_proposed']['kernel_checked'] = True
    driver.summary['numeric_actual_source_profile_checked'] = True
    driver.run('NumericActualNegative', 45, negative=True)
    driver.summary['numeric_actual_kernel_corruption_rejected'] = True
    driver.summary.update(status='source_profile_passed', source_component_profile_checked=True)
    driver.checkpoint()
    print('Controlled source component profile passed', flush=True)
