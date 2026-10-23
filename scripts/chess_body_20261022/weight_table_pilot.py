#!/usr/bin/env python3
"""Remote-only exact source-weight tables shared by all numeric address proofs."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

import hashlib
import json


def generate(driver, snapshot, expected_sha, header, audit_and_end):
    assert hashlib.sha256(snapshot.read_bytes()).hexdigest() == expected_sha
    data = json.loads(snapshot.read_text())
    node_weights = data['row_sizes']
    return_weights = [len(targets) for targets in data['return_local_targets']]
    assert len(node_weights) == len(return_weights) == 4042
    assert all(type(x) is int and 1 <= x <= 1024 for x in node_weights)
    assert all(1 <= r <= n for n, r in zip(node_weights, return_weights))
    parts = [header(['Cryptids.Chess.Optimisation.FieldSelective'])]
    for name, values in (('nodeWeights', node_weights), ('returnWeights', return_weights)):
        parts.append(f'noncomputable def {name} : List Nat := [\n')
        for start in range(0, len(values), 12):
            cells = ', '.join(str(x) for x in values[start:start + 12])
            parts.append('  ' + cells + (',' if start + 12 < len(values) else '') + '\n')
        parts.append(']\n')
    parts.append(r'''open Chess.Optimisation

theorem node_weights_eq : FieldPackedLayout.weights = nodeWeights := by rfl

theorem return_weights_eq : FieldSelectiveLayout.weights = returnWeights := by rfl

theorem node_offset_fast (q : Fin 4042) :
    FieldPackedLayout.offset q = (nodeWeights.take q.val).sum := by
  rw [FieldPackedLayout.offset_eq_prefix, FieldPackedLayout.prefixSum, node_weights_eq]

theorem return_offset_fast (q : Fin 4042) :
    FieldSelectiveLayout.offset q = (returnWeights.take q.val).sum := by
  rw [FieldSelectiveLayout.offset_eq_prefix, FieldSelectiveLayout.prefixSum, return_weights_eq]
''')
    roots = ['nodeWeights', 'returnWeights', 'node_weights_eq', 'return_weights_eq',
             'node_offset_fast', 'return_offset_fast']
    parts.append(audit_and_end(driver, 'WeightTables', roots,
                               'Complete source weights and shared prefix correspondence checked'))
    driver.emit('WeightTables.lean', ''.join(parts))
