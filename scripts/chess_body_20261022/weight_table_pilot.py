#!/usr/bin/env python3
"""Remote-only exact source-weight tables shared by all numeric address proofs."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

import hashlib
import json


def generate(driver, snapshot, expected_sha, header, audit_and_end, progress_marker):
    assert hashlib.sha256(snapshot.read_bytes()).hexdigest() == expected_sha
    data = json.loads(snapshot.read_text())
    node_weights = data['row_sizes']
    return_weights = [len(targets) for targets in data['return_local_targets']]
    assert len(node_weights) == len(return_weights) == 4042
    assert all(type(x) is int and 1 <= x <= 1024 for x in node_weights)
    assert all(1 <= r <= n for n, r in zip(node_weights, return_weights))
    parts = [header(['Cryptids.Chess.Optimisation.BodyCertificatePilot.OperationWeights']),
             r'''open Chess.Optimisation
open FieldCompiler
set_option backward.isDefEq.respectTransparency false

def WeightFacts {α : Type} (weight : α → Nat)
    (tree : Balanced.RowTree α) (values : List Nat) : Prop :=
  tree.flatten.map weight = values

theorem weight_map_branch {α : Type} (weight : α → Nat) (cache : Nat)
    (left right : Balanced.RowTree α) (a b : List Nat)
    (hl : WeightFacts weight left a) (hr : WeightFacts weight right b) :
    WeightFacts weight (Balanced.RowTree.branch cache left right) (a ++ b) := by
  have left_eq : left.flatten.map weight = a := hl
  have right_eq : right.flatten.map weight = b := hr
  simpa only [WeightFacts, Balanced.RowTree.flatten, List.map_append] using
    congrArg₂ (fun xs ys : List Nat ↦ xs ++ ys) left_eq right_eq
''']
    node_weight = '(fun row : Snapshot.Entry ↦ (lower row.1).size)'
    return_weight = '(fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))'

    def literal(name, values):
        parts.append(f'noncomputable def {name} : List Nat := [\n')
        for start in range(0, len(values), 12):
            cells = ', '.join(str(x) for x in values[start:start + 12])
            parts.append('  ' + cells + (',' if start + 12 < len(values) else '') + '\n')
        parts.append(']\n')

    def tree(start, length):
        suffix = f'{start}_{length}'
        source = f'weight_source_{suffix}'
        node, ret = f'node_w_{suffix}', f'return_w_{suffix}'
        np, rp = f'node_spec_{suffix}', f'return_spec_{suffix}'
        if length == 1:
            first, end = 32 * start, min(32 * start + 32, 4042)
            parts.append(f'noncomputable def {source} : Balanced.RowTree Snapshot.Entry :=\n'
                         f'  Snapshot.chunk{first:04d}\n')
            literal(node, node_weights[first:end])
            literal(ret, return_weights[first:end])
            for proof, weight, values, rewrite in (
                    (np, node_weight, node, 'node_weight_function'),
                    (rp, return_weight, ret, 'return_weight_function')):
                parts.append(f'theorem {proof} : WeightFacts\n'
                             f'    {weight}\n    {source} {values} := by\n'
                             f'  rw [{rewrite}]\n  rfl\n')
            if start % 16 == 15 or end == 4042:
                parts.append(progress_marker('weight-chunk', start + 1,
                                              driver.args.output / 'weight-chunks-progress.tsv'))
        else:
            half = length // 2
            ls, ln, lr, lnp, lrp = tree(start, half)
            rs, rn, rr, rnp, rrp = tree(start + half, length - half)
            cache = 32 * half
            parts.append(f'noncomputable def {source} : Balanced.RowTree Snapshot.Entry :=\n'
                         f'  .branch {cache} {ls} {rs}\n')
            for name, left, right in ((node, ln, rn), (ret, lr, rr)):
                parts.append(f'noncomputable def {name} : List Nat := {left} ++ {right}\n')
            for proof, weight, name, left, right, hl, hr in (
                    (np, node_weight, node, ln, rn, lnp, rnp),
                    (rp, return_weight, ret, lr, rr, lrp, rrp)):
                parts.append(f'theorem {proof} : WeightFacts\n'
                             f'    {weight}\n    {source} {name} :=\n'
                             f'  weight_map_branch\n    {weight}\n'
                             f'    {cache} {ls} {rs} {left} {right}\n'
                             f'    {hl} {hr}\n')
        return source, node, ret, np, rp

    source, node, ret, np, rp = tree(0, (4042 + 31) // 32)
    parts.append(f'noncomputable def nodeWeights : List Nat := {node}\n'
                 f'noncomputable def returnWeights : List Nat := {ret}\n'
                 f'theorem weight_source_eq : {source} = Snapshot.entries := by rfl\n')
    for prefix, frozen, weight, values, proof in (
            ('node', 'FieldPackedLayout', node_weight, node, np),
            ('return', 'FieldSelectiveLayout', return_weight, ret, rp)):
        parts.append(f'theorem {prefix}_weights_eq : {frozen}.weights = {prefix}Weights := by\n'
                     f'  change Snapshot.entries.flatten.map\n    {weight} =\n      {values}\n'
                     '  exact (congrArg\n'
                     '    (fun tree : Balanced.RowTree Snapshot.Entry ↦\n'
                     f'      tree.flatten.map {weight})\n'
                     f'    weight_source_eq.symm).trans {proof}\n')
    parts.append(r'''

theorem node_offset_fast (q : Fin 4042) :
    FieldPackedLayout.offset q = (nodeWeights.take q.val).sum := by
  rw [FieldPackedLayout.offset_eq_prefix, FieldPackedLayout.prefixSum, node_weights_eq]

theorem return_offset_fast (q : Fin 4042) :
    FieldSelectiveLayout.offset q = (returnWeights.take q.val).sum := by
  rw [FieldSelectiveLayout.offset_eq_prefix, FieldSelectiveLayout.prefixSum, return_weights_eq]
''')
    roots = ['WeightFacts', 'weight_map_branch', 'weight_source_eq', 'nodeWeights', 'returnWeights',
             'node_weights_eq', 'return_weights_eq', 'node_offset_fast', 'return_offset_fast']
    parts.append(audit_and_end(driver, 'WeightTables', roots,
                               'Complete source weights and shared prefix correspondence checked'))
    driver.emit('WeightTables.lean', ''.join(parts))
