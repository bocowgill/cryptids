#!/usr/bin/env python3
"""Remote-only raw-label source-chunk certificate proposal."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

import copy
import hashlib
import json

from source_chunk_pilot import indent, render, values


def raw_fin(value, bound):
    assert type(value) is int and value >= 0
    if bound == 4042:
        # The kernel must check this bound; no Python truncation or Fin coercion.
        return str(value)
    assert bound in (4, 5) and value < bound
    return f'bounded_{bound}_{value}'


def raw_op(row):
    return render(row, raw_fin).replace('TableOp.', 'RawOp.', 1)


def generate(driver, header, audit_and_end, module):
    assert driver.summary['raw_label_decoder_checked']
    path = driver.args.output / 'source-operation-proposal.json'
    raw = path.read_bytes()
    payload = json.loads(raw)
    assert payload['schema'] == 'finite-source-op-proposal-v1'
    operations = payload['operations']
    assert len(operations) == 4042
    for operation in operations:
        raw_op(operation)
    loads = [i for i, operation in enumerate(operations)
             if operation[0] == 2 and len(set(values(operation))) > 1]
    assert loads, 'Actual nonconstant load required for this pilot'
    selected = loads[0]
    start = selected // 32 * 32
    chunk, offset = operations[start:start + 32], selected - start
    corrupt = copy.deepcopy(chunk[offset])
    corrupt[2][0][0] = (corrupt[2][0][0] + 1) % 5
    bad_target = copy.deepcopy(chunk[offset])
    bad_target[3] = 4042
    parts = [header([module + '.RawLabels']),
             'open FieldCompiler RawLabelPilot\nnamespace RawChunkPilot\n']
    for bound in (4, 5):
        for value in range(bound):
            parts.append(f'noncomputable def {raw_fin(value, bound)} : Fin {bound} :=\n'
                         f'  ⟨{value}, by decide +kernel⟩\n')
    parts.append('def sourceOps : List (Op 4042) :=\n'
                 f'  Snapshot.chunk{start:04d}.flatten.map Prod.fst\n'
                 'noncomputable def rawOps : List RawOp := [\n' +
                 ',\n'.join(indent(raw_op(row)) for row in chunk) + '\n]\n'
                 'noncomputable def corruptOp : RawOp :=\n' + indent(raw_op(corrupt)) + '\n'
                 f'noncomputable def corruptOps : List RawOp := rawOps.set {offset} corruptOp\n'
                 'noncomputable def badTarget : RawOp :=\n' + indent(raw_op(bad_target)) + '\n')
    parts.append(r'''
theorem raw_labels_bounded : rawOps.all (labelsBounded 4042) = true := by decide +kernel

theorem raw_labels_safe :
    ∀ op ∈ rawOps, ∀ value ∈ labelValues op, value < 4042 := by
  intro op member value found
  exact labels_bound_sound 4042 op
    (List.all_eq_true.mp raw_labels_bounded op member) value found

theorem source_raw_tables :
    sourceOps.map (fun op ↦ erase (toTableOp op)) = rawOps := by decide +kernel

theorem source_restored : rawOps.map (restore 4042) = sourceOps.map some := by
  exact (congrArg (List.map (restore 4042)) source_raw_tables.symm).trans
    (restore_source_list sourceOps)

theorem corrupted_callback_rejected :
    sourceOps.map (fun op ↦ erase (toTableOp op)) ≠ corruptOps := by decide +kernel

theorem invalid_target_bounded_false : labelsBounded 4042 badTarget = false := by decide +kernel

theorem invalid_target_rejected : restore 4042 badTarget = none := by decide +kernel
''')
    parts.append(f'theorem chunk_length : rawOps.length = {len(chunk)} := by decide +kernel\n'
                 'end RawChunkPilot\n')
    roots = ['RawChunkPilot.' + name for name in ['raw_labels_bounded', 'raw_labels_safe',
             'source_raw_tables', 'source_restored', 'corrupted_callback_rejected',
             'invalid_target_bounded_false', 'invalid_target_rejected', 'chunk_length']]
    parts.append(audit_and_end(driver, 'RawChunk', roots,
                               'Raw source chunk bounds and restoration checked'))
    driver.emit('RawChunk.lean', ''.join(parts))
    driver.summary['source_operation_proposal'] = dict(
        path=path.name, info=dict(bytes=len(raw), sha256=hashlib.sha256(raw).hexdigest()),
        scope='Untrusted finite opcode proposal; only checked chunk receives fidelity credit')
    driver.summary['raw_chunk_proposed'] = dict(start=start, length=len(chunk),
                                               nonconstant_load=selected, small_bound_defs=9,
                                               label_bound_declarations=0, kernel_checked=False)
    driver.checkpoint()
