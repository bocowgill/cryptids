#!/usr/bin/env python3
"""Remote-only complete finite source tables; untrusted ordinary-proof producer."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

import json

from source_chunk_pilot import indent, render


TOOLS = r'''open FieldCompiler
namespace CompleteSourcePilot

theorem source_tables_branch (cache : Nat)
    (left right : Balanced.RowTree Snapshot.Entry) (a b : List (TableOp 4042))
    (hl : left.flatten.map (fun row ↦ toTableOp row.1) = a)
    (hr : right.flatten.map (fun row ↦ toTableOp row.1) = b) :
    (Balanced.RowTree.branch cache left right).flatten.map
      (fun row ↦ toTableOp row.1) = a ++ b := by
  simpa only [Balanced.RowTree.flatten, List.map_append] using
    congrArg₂ (fun xs ys : List (TableOp 4042) ↦ xs ++ ys) hl hr

theorem restore_source_tables (ops : List (Op 4042)) :
    (ops.map toTableOp).map fromTableOp = ops := by
  induction ops with
  | nil => rfl
  | cons op ops ih => simp only [List.map_cons, from_toTableOp, ih]
'''


def generate(driver, header, audit_and_end, progress_marker, module):
    # The one-chunk fidelity/corruption gate must be checked in THIS remote run.
    assert driver.summary['source_chunk_proposed']['kernel_checked']
    path = driver.args.output / 'source-operation-proposal.json'
    payload = json.loads(path.read_text())
    assert payload['schema'] == 'finite-source-op-proposal-v1'
    operations = payload['operations']
    assert len(operations) == 4042
    for operation in operations:
        render(operation)
    parts = [header([module + '.SourceChunk', 'Lean']).replace(
        'public import Lean\n', 'public meta import Lean\n'), TOOLS]

    def tree(first, count):
        suffix = f'{first}_{count}'
        source, tables, fact = ('source_' + suffix, 'tables_' + suffix, 'fact_' + suffix)
        if count == 1:
            start, end = first * 32, min((first + 1) * 32, 4042)
            parts.append(f'noncomputable def {source} : Balanced.RowTree Snapshot.Entry :=\n'
                         f'  Snapshot.chunk{start:04d}\n'
                         f'noncomputable def {tables} : List (TableOp 4042) := [\n' +
                         ',\n'.join(indent(render(row)) for row in operations[start:end]) +
                         '\n]\n'
                         f'theorem {fact} : {source}.flatten.map\n'
                         f'    (fun row ↦ toTableOp row.1) = {tables} := by\n'
                         '  decide +kernel\n')
            if first % 8 == 7 or end == 4042:
                parts.append(progress_marker(
                    'complete-source-chunks', first + 1,
                    driver.args.output / 'complete-source-progress.tsv'))
        else:
            half = count // 2
            ls, lt, lf = tree(first, half)
            rs, rt, rf = tree(first + half, count - half)
            cache = 32 * half
            parts.append(f'noncomputable def {source} : Balanced.RowTree Snapshot.Entry :=\n'
                         f'  .branch {cache} {ls} {rs}\n'
                         f'noncomputable def {tables} : List (TableOp 4042) := {lt} ++ {rt}\n'
                         f'theorem {fact} : {source}.flatten.map\n'
                         f'    (fun row ↦ toTableOp row.1) = {tables} :=\n'
                         f'  source_tables_branch {cache} {ls} {rs} {lt} {rt} {lf} {rf}\n')
        return source, tables, fact

    source, tables, fact = tree(0, (4042 + 31) // 32)
    parts.append(f'noncomputable def tableOps : List (TableOp 4042) := {tables}\n'
                 f'theorem source_tree_eq : {source} = Snapshot.entries := by rfl\n'
                 'theorem complete_source_tables : Snapshot.entries.flatten.map\n'
                 '    (fun row ↦ toTableOp row.1) = tableOps := by\n'
                 f'  change Snapshot.entries.flatten.map _ = {tables}\n'
                 '  exact (congrArg\n'
                 '    (fun tree : Balanced.RowTree Snapshot.Entry ↦\n'
                 '      tree.flatten.map (fun row ↦ toTableOp row.1))\n'
                 f'    source_tree_eq.symm).trans {fact}\n')
    parts.append(r'''
theorem complete_source_restored :
    tableOps.map fromTableOp = Snapshot.entries.flatten.map Prod.fst := by
  rewrite [← complete_source_tables]
  have same := restore_source_tables (Snapshot.entries.flatten.map Prod.fst)
  simpa only [List.map_map, Function.comp_def] using same

theorem complete_source_lowered :
    tableOps.map (fun op ↦ lower (fromTableOp op)) =
      Snapshot.entries.flatten.map (fun row ↦ lower row.1) := by
  have same := congrArg (List.map lower) complete_source_restored
  simpa only [List.map_map, Function.comp_def] using same

theorem complete_source_length : tableOps.length = 4042 := by
  have same := congrArg List.length complete_source_tables
  simpa only [List.length_map, ← Balanced.RowTree.count_eq_length,
    Snapshot.entries_count] using same.symm

end CompleteSourcePilot
''')
    roots = ['CompleteSourcePilot.' + name for name in [
        'source_tables_branch', 'restore_source_tables', 'source_tree_eq',
        'complete_source_tables', 'complete_source_restored', 'complete_source_lowered',
        'complete_source_length']]
    parts.append(audit_and_end(driver, 'CompleteSource', roots,
                               'All frozen source-operation tables reconstructed exactly'))
    driver.emit('CompleteSource.lean', ''.join(parts))
    driver.summary['complete_source_proposed'] = dict(
        operations=4042, chunks=127, kernel_checked=False,
        graph_fidelity_checked=False, full_quotient_certified=False,
        new_accepted_machine=False)
    driver.checkpoint()
