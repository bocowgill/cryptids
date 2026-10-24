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

theorem restore_source_entries (entries : List Snapshot.Entry) :
    (entries.map (fun row ↦ toTableOp row.1)).map fromTableOp = entries.map Prod.fst := by
  have restored := restore_source_tables (entries.map Prod.fst)
  simpa only [List.map_map, Function.comp_def] using restored

theorem source_tables_lowering (entries : List Snapshot.Entry) (tables : List (TableOp 4042))
    (same : tables.map fromTableOp = entries.map Prod.fst) :
    tables.map (fun op ↦ lower (fromTableOp op)) = entries.map (fun row ↦ lower row.1) := by
  have lowered := congrArg (List.map lower) same
  simpa only [List.map_map, Function.comp_def] using lowered

theorem source_tables_length (entries : List Snapshot.Entry) (tables : List (TableOp 4042))
    (same : entries.map (fun row ↦ toTableOp row.1) = tables) : tables.length = entries.length := by
  simpa only [List.length_map] using (congrArg List.length same).symm

theorem source_tables_lookup (entries : List Snapshot.Entry) (tables : List (TableOp 4042))
    (same : tables.map fromTableOp = entries.map Prod.fst) (index : Nat) :
    (tables.map fromTableOp).getD index .halt = (entries.getD index (.halt, .halt)).1 := by
  calc
    (tables.map fromTableOp).getD index .halt =
        (entries.map Prod.fst).getD index ((.halt, .halt) : Snapshot.Entry).1 :=
      congrArg (fun ops : List (Op 4042) ↦ ops.getD index .halt) same
    _ = (entries.getD index (.halt, .halt)).1 := List.getD_map Prod.fst
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

    def catalog_fin(value, bound):
        assert type(value) is int and bound in (4, 5, 4042) and 0 <= value < bound
        return f'bounded_{bound}_{value}'

    # Prove each exact small value/label bound once, rather than elaborating
    # a new tactic term at every repeated occurrence in all4042operations.
    for bound in (4, 5, 4042):
        for value in range(bound):
            parts.append(f'noncomputable def {catalog_fin(value, bound)} : Fin {bound} :=\n'
                         f'  ⟨{value}, by decide +kernel⟩\n')
    parts.append(progress_marker('complete-source-bound-catalog', 4051,
                                 driver.args.output / 'complete-source-progress.tsv'))

    def tree(first, count):
        suffix = f'{first}_{count}'
        source, tables, fact = ('source_' + suffix, 'tables_' + suffix, 'fact_' + suffix)
        if count == 1:
            start, end = first * 32, min((first + 1) * 32, 4042)
            parts.append(f'noncomputable def {source} : Balanced.RowTree Snapshot.Entry :=\n'
                         f'  Snapshot.chunk{start:04d}\n'
                         f'noncomputable def {tables} : List (TableOp 4042) := [\n' +
                         ',\n'.join(indent(render(row, catalog_fin))
                                     for row in operations[start:end]) +
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
                         f'  source_tables_branch {cache} {ls} {rs}\n'
                         f'    {lt} {rt} {lf} {rf}\n')
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
  exact (congrArg (List.map fromTableOp) complete_source_tables.symm).trans
    (restore_source_entries Snapshot.entries.flatten)

theorem complete_source_lowered :
    tableOps.map (fun op ↦ lower (fromTableOp op)) =
      Snapshot.entries.flatten.map (fun row ↦ lower row.1) := by
  exact source_tables_lowering Snapshot.entries.flatten tableOps complete_source_restored

theorem complete_source_length : tableOps.length = 4042 := by
  exact (source_tables_length Snapshot.entries.flatten tableOps complete_source_tables).trans
    ((Balanced.RowTree.count_eq_length Snapshot.entries).symm.trans Snapshot.entries_count)

theorem complete_source_at (q : Fin 4042) :
    (tableOps.map fromTableOp).getD q.val .halt = Snapshot.program q := by
  exact (source_tables_lookup Snapshot.entries.flatten tableOps
    complete_source_restored q.val).trans
    (congrArg Prod.fst (Balanced.RowTree.lookup_eq_getD Snapshot.entries
      Snapshot.entries_wellFormed q.val (.halt, .halt))).symm

theorem complete_source_meaning (q : Fin 4042) :
    source ((tableOps.map fromTableOp).getD q.val .halt) = SharedModel.machine q := by
  exact (congrArg FieldCompiler.source (complete_source_at q)).trans (Snapshot.source_program q)

end CompleteSourcePilot
''')
    roots = ['CompleteSourcePilot.' + name for name in [
        'source_tables_branch', 'restore_source_tables', 'restore_source_entries',
        'source_tables_lowering', 'source_tables_length', 'source_tables_lookup', 'source_tree_eq',
        'complete_source_tables', 'complete_source_restored', 'complete_source_lowered',
        'complete_source_length', 'complete_source_at', 'complete_source_meaning']]
    source_text = ''.join(parts)
    final_names = ['source_tree_eq', 'complete_source_tables', 'complete_source_restored',
                   'complete_source_lowered', 'complete_source_length', 'complete_source_at',
                   'complete_source_meaning']
    for index, name in enumerate(final_names):
        needle = 'theorem ' + name
        assert source_text.count(needle) == 1
        marker = progress_marker('complete-source-final', index,
                                 driver.args.output / 'complete-source-final.tsv')
        source_text = source_text.replace(needle, marker + needle)
    source_text = source_text.replace('\nend CompleteSourcePilot\n', '\n' + progress_marker(
        'complete-source-final', 7, driver.args.output / 'complete-source-final.tsv') +
        '\nend CompleteSourcePilot\n')
    driver.emit('CompleteSource.lean', source_text + audit_and_end(
        driver, 'CompleteSource', roots,
        'All frozen source-operation tables reconstructed exactly'))
    driver.summary['complete_source_proposed'] = dict(
        operations=4042, chunks=127, kernel_checked=False,
        graph_fidelity_checked=False, full_quotient_certified=False,
        new_accepted_machine=False)
    driver.checkpoint()
