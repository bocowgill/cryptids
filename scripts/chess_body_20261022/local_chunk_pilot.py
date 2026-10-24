#!/usr/bin/env python3
"""Remote-only complete frozen source-block row certificate proposal."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

import hashlib
import json

from raw_chunk_pilot import raw_op
from source_chunk_pilot import indent


TOOLS = r'''open ConjectureMachines.Optimisation
open Chess.Optimisation FieldCompiler RawLabelPilot RawChunkPilot
open NumericLocalPilot LocalRulePilot PrefixScanPilot
namespace LocalChunkPilot

theorem restored_literal (op : Op 4042) (raw : RawOp)
    (same : erase (toTableOp op) = raw) : (restore 4042 raw).getD .halt = op := by
  have decoded : restore 4042 raw = some op :=
    (congrArg (restore 4042) same.symm).trans (restore_original op)
  exact congrArg (fun value : Option (Op 4042) ↦ value.getD .halt) decoded
'''



def append_operation(parts, q, operations, data):
    parts.append(f'def label_{q} : Fin 4042 := ⟨{q}, by decide +kernel⟩\n'
                 f'noncomputable def raw_{q} : RawOp :=\n' +
                 indent(raw_op(operations[q])) + '\n'
                 f'noncomputable def op_{q} : Op 4042 := (restore 4042 raw_{q}).getD .halt\n'
                 f'noncomputable def syntax_{q} : Syntax 4042 := lower op_{q}\n'
                 f'theorem source_raw_{q} :\n'
                 f'    erase (toTableOp (Snapshot.program label_{q})) = raw_{q} := by\n'
                 '  decide +kernel\n'
                 f'theorem source_op_{q} : op_{q} = Snapshot.program label_{q} :=\n'
                 f'  restored_literal (Snapshot.program label_{q}) raw_{q} source_raw_{q}\n'
                 f'theorem source_syntax_{q} :\n'
                 f'    FieldPacked.syntaxRows.get label_{q} = syntax_{q} :=\n'
                 f'  (FieldAware.syntaxRows_get label_{q}).trans\n'
                 f'    (congrArg lower source_op_{q}).symm\n'
                 f'theorem coherent_{q} : Coherent label_{q} syntax_{q} := by\n'
                 '  decide +kernel\n'
                 f'theorem returned_{q} : ReturnCoherent label_{q} syntax_{q} := by\n'
                 '  decide +kernel\n'
                 f'theorem main_rows_{q} (slot : Fin syntax_{q}.size)\n'
                 '    (bit : Bool) (value : Fin 5) :\n'
                 f'    RowAt (mainIndex (slotIndex label_{q} syntax_{q}\n'
                 f'      source_syntax_{q} slot) value) (Binary.encodeSymbol bit) :=\n'
                 f'  main_rows_local label_{q} syntax_{q} source_syntax_{q}\n'
                 f'    coherent_{q} slot bit value\n'
                 f'theorem return_rows_{q}\n'
                 f'    (rank : Fin (1 + FieldReturns.writeCount syntax_{q}))\n'
                 '    (bit : Bool) (value : Fin 5) :\n'
                 f'    RowAt (bounceIndex label_{q} syntax_{q}\n'
                 f'      source_syntax_{q} rank value) (Binary.encodeSymbol bit) :=\n'
                 f'  return_rows_local label_{q} syntax_{q} source_syntax_{q}\n'
                 f'    returned_{q} rank bit value\n'
                 f'theorem nodes_{q} : syntax_{q}.size = {data["row_sizes"][q]} := by\n'
                 '  decide +kernel\n'
                 f'theorem returns_{q} : 1 + FieldReturns.writeCount syntax_{q} =\n'
                 f'    {len(data["return_local_targets"][q])} := by decide +kernel\n')
    return [prefix + str(q) for prefix in ['source_raw_', 'source_op_', 'source_syntax_',
                                           'coherent_', 'returned_', 'main_rows_',
                                           'return_rows_', 'nodes_', 'returns_']]

def generate(driver, snapshot, expected_sha, header, audit_and_end, progress_marker, module, ns):
    assert driver.summary['source_local_rule_soundness_checked']
    assert driver.summary['raw_source_chunk_checked']
    assert hashlib.sha256(snapshot.read_bytes()).hexdigest() == expected_sha
    data = json.loads(snapshot.read_text())
    payload = json.loads((driver.args.output / 'source-operation-proposal.json').read_text())
    assert payload['schema'] == 'finite-source-op-proposal-v1'
    operations = payload['operations']
    assert len(operations) == 4042
    writes = [i for i, op in enumerate(operations) if op[0] == 1]
    assert writes, 'A real source write and its multiple paid return ranks are required'
    start = writes[0] // 32 * 32
    end = min(start + 32, 4042)
    node_count = sum(data['row_sizes'][start:end])
    return_count = sum(len(ranks) for ranks in data['return_local_targets'][start:end])
    state_count = 5 * (node_count + return_count)
    row_count = 2 * state_count
    parts = [header([module + '.LocalRules', module + '.RawChunk', 'Lean']).replace(
        'public import Lean\n', 'public meta import Lean\n'), TOOLS]
    roots = ['restored_literal']
    for q in range(start, end):
        roots += append_operation(parts, q, operations, data)
        parts.append(progress_marker('complete-local-source-operations', q - start + 1,
                                     driver.args.output / 'local-chunk-progress.tsv'))
    anchor = writes[0]
    for family, expressions, total in [
            ('nodes', [f'syntax_{q}.size' for q in range(start, end)], node_count),
            ('returns', [f'(1 + FieldReturns.writeCount syntax_{q})'
                         for q in range(start, end)], return_count)]:
        parts.append(f'noncomputable def {family}Count : Nat :=\n' +
                     ' +\n'.join('  ' + expression for expression in expressions) + '\n'
                     f'theorem {family}_census : {family}Count = {total} := by\n'
                     f'  unfold {family}Count\n'
                     '  rewrite [\n' +
                     ',\n'.join(f'    {family}_{q}' for q in range(start, end)) + '\n  ]\n'
                     '  rfl\n')
    parts.append('theorem state_domain_census :\n'
                 f'    5 * (nodesCount + returnsCount) = {state_count} := by\n'
                 '  rewrite [nodes_census, returns_census]\n  rfl\n'
                 'theorem row_domain_census :\n'
                 f'    10 * (nodesCount + returnsCount) = {row_count} := by\n'
                 '  rewrite [nodes_census, returns_census]\n  rfl\n')
    roots += ['nodes_census', 'returns_census', 'state_domain_census', 'row_domain_census']
    parts.append(f'def anchorSlot : Fin syntax_{anchor}.size := ⟨0, by decide +kernel⟩\n'
                 'theorem checked_anchor :\n'
                 f'    rowWord (mainAddress (nodePrefixes.lookup label_{anchor}.val 0 +\n'
                 '      anchorSlot.val) 0) false =\n'
                 f'        stepWord label_{anchor} syntax_{anchor}\n'
                 f'          (syntax_{anchor}.fastNodeAt anchorSlot) false 0 :=\n'
                 f'  coherent_{anchor} anchorSlot false 0\n'
                 f'def wrongRank : Fin (1 + FieldReturns.writeCount syntax_{anchor}) :=\n'
                 '  ⟨1, by decide +kernel⟩\n'
                 'theorem wrong_return_rank_rejected :\n'
                 f'    FieldReturns.targetAt syntax_{anchor} 0 ≠\n'
                 f'      FieldReturns.targetAt syntax_{anchor} wrongRank := by decide +kernel\n'
                 'end LocalChunkPilot\n')
    roots += ['checked_anchor', 'wrong_return_rank_rejected']
    banner = 'Complete actual source block main and return rows checked'
    driver.emit('LocalChunk.lean', ''.join(parts) + audit_and_end(
        driver, 'LocalChunk', ['LocalChunkPilot.' + name for name in roots], banner))
    negative = f'''module
public import {module}.LocalChunk
public meta import Lean
public meta section
open Lean Elab Term Meta Command

elab "submit_false_local_word" : command => do
  liftTermElabM do
    let name := `{ns}.LocalChunkPilot.checked_anchor
    let info ← getConstInfo name
    let equality ← whnf info.type
    unless equality.isAppOfArity ``Eq 3 do throwError "Expected checked equality"
    let args := equality.getAppArgs
    unless args[0]!.isConstOf ``Nat do throwError "Expected checked Nat word"
    let changed := mkApp (Lean.mkConst ``Nat.succ) args[2]!
    let proposition ← mkEq args[1]! changed
    Lean.addDecl (.thmDecl {{
      name := `{ns}.deliberately_false_local_word
      levelParams := []
      type := proposition
      value := Lean.mkConst name
    }}) true
submit_false_local_word
'''
    driver.emit('LocalNegative.lean', negative)
    driver.summary['local_chunk_proposed'] = dict(
        first_label=start, end_label=end, operations=end - start,
        main_nodes=node_count, return_ranks=return_count,
        finite_state_domain=state_count, finite_row_domain=row_count,
        every_bit_and_store=True, all_paid_local_returns=True,
        counts_are_proposals_until_required_roots_pass=True,
        kernel_checked=False, full_quotient_certified=False, new_accepted_machine=False)
    driver.checkpoint()
