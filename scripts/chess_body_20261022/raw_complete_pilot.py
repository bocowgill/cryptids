#!/usr/bin/env python3
"""Remote-only complete raw source certificate proposal; no native proof authority."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

import json

from raw_chunk_pilot import raw_op
from source_chunk_pilot import indent


TOOLS = r'''open FieldCompiler RawLabelPilot RawChunkPilot
namespace CompleteRawSourcePilot

def rawSource (op : Op 4042) : RawOp := erase (toTableOp op)

theorem source_branch (cache : Nat)
    (left right : Balanced.RowTree Snapshot.Entry) (a b : List RawOp)
    (hl : left.flatten.map (fun row ↦ rawSource row.1) = a)
    (hr : right.flatten.map (fun row ↦ rawSource row.1) = b) :
    (Balanced.RowTree.branch cache left right).flatten.map
      (fun row ↦ rawSource row.1) = a ++ b := by
  simpa only [Balanced.RowTree.flatten, List.map_append] using
    congrArg₂ (fun xs ys : List RawOp ↦ xs ++ ys) hl hr

theorem bounds_append (a b : List RawOp)
    (ha : a.all (labelsBounded 4042) = true)
    (hb : b.all (labelsBounded 4042) = true) :
    (a ++ b).all (labelsBounded 4042) = true := by
  simp only [List.all_append, ha, hb, Bool.and_self]

theorem restore_entries (entries : List Snapshot.Entry) :
    (entries.map (fun row ↦ rawSource row.1)).map (restore 4042) =
      entries.map (fun row ↦ some row.1) := by
  have restored := restore_source_list (entries.map Prod.fst)
  simpa only [List.map_map, Function.comp_def, rawSource] using restored

theorem raw_lookup (entries : List Snapshot.Entry) (raws : List RawOp)
    (same : entries.map (fun row ↦ rawSource row.1) = raws) (index : Nat) :
    raws.getD index .halt = rawSource (entries.getD index (.halt, .halt)).1 := by
  calc
    raws.getD index .halt =
        (entries.map (fun row ↦ rawSource row.1)).getD index
          ((fun row : Snapshot.Entry ↦ rawSource row.1) (.halt, .halt)) :=
      congrArg (fun ops : List RawOp ↦ ops.getD index .halt) same.symm
    _ = rawSource (entries.getD index (.halt, .halt)).1 :=
      List.getD_map (fun row : Snapshot.Entry ↦ rawSource row.1)
'''


def generate(driver, header, audit_and_end, progress_marker, module):
    assert driver.summary['raw_source_chunk_checked']
    path = driver.args.output / 'source-operation-proposal.json'
    payload = json.loads(path.read_text())
    assert payload['schema'] == 'finite-source-op-proposal-v1'
    operations = payload['operations']
    assert len(operations) == 4042
    parts = [header([module + '.RawChunk', 'Lean']).replace(
        'public import Lean\n', 'public meta import Lean\n'), TOOLS]
    # Reuse only the nine field/store constants in RawChunk. Labels stay Nat.
    def tree(first, count):
        suffix = f'{first}_{count}'
        source, raws = 'source_' + suffix, 'raws_' + suffix
        fact, bounds = 'fact_' + suffix, 'bounds_' + suffix
        if count == 1:
            start, end = first * 32, min((first + 1) * 32, 4042)
            parts.append(f'noncomputable def {source} : Balanced.RowTree Snapshot.Entry :=\n'
                         f'  Snapshot.chunk{start:04d}\n'
                         f'noncomputable def {raws} : List RawOp := [\n' +
                         ',\n'.join(indent(raw_op(row)) for row in operations[start:end]) +
                         '\n]\n'
                         f'theorem {fact} : {source}.flatten.map\n'
                         f'    (fun row ↦ rawSource row.1) = {raws} := by decide +kernel\n'
                         f'theorem {bounds} : {raws}.all (labelsBounded 4042) = true := by\n'
                         '  decide +kernel\n')
            if first % 8 == 7 or end == 4042:
                parts.append(progress_marker('complete-raw-source-chunks', first + 1,
                                             driver.args.output / 'raw-source-progress.tsv'))
        else:
            half = count // 2
            ls, lr, lf, lb = tree(first, half)
            rs, rr, rf, rb = tree(first + half, count - half)
            cache = 32 * half
            parts.append(f'noncomputable def {source} : Balanced.RowTree Snapshot.Entry :=\n'
                         f'  .branch {cache} {ls} {rs}\n'
                         f'noncomputable def {raws} : List RawOp := {lr} ++ {rr}\n'
                         f'theorem {fact} : {source}.flatten.map\n'
                         f'    (fun row ↦ rawSource row.1) = {raws} :=\n'
                         f'  source_branch {cache} {ls} {rs} {lr} {rr} {lf} {rf}\n'
                         f'theorem {bounds} : {raws}.all (labelsBounded 4042) = true :=\n'
                         f'  bounds_append {lr} {rr} {lb} {rb}\n')
        return source, raws, fact, bounds

    source, raws, fact, bounds = tree(0, (4042 + 31) // 32)
    parts.append(f'noncomputable def rawOps : List RawOp := {raws}\n'
                 f'theorem source_tree_eq : {source} = Snapshot.entries := by rfl\n'
                 'theorem complete_raw_source : Snapshot.entries.flatten.map\n'
                 '    (fun row ↦ rawSource row.1) = rawOps := by\n'
                 f'  change Snapshot.entries.flatten.map _ = {raws}\n'
                 '  exact (congrArg\n'
                 '    (fun tree : Balanced.RowTree Snapshot.Entry ↦\n'
                 '      tree.flatten.map (fun row ↦ rawSource row.1))\n'
                 f'    source_tree_eq.symm).trans {fact}\n'
                 'theorem complete_raw_bounds : rawOps.all (labelsBounded 4042) = true :=\n'
                 f'  {bounds}\n')
    parts.append(r'''
theorem complete_raw_labels_safe :
    ∀ op ∈ rawOps, ∀ value ∈ labelValues op, value < 4042 := by
  intro op member value found
  exact labels_bound_sound 4042 op
    (List.all_eq_true.mp complete_raw_bounds op member) value found

theorem complete_raw_restored :
    rawOps.map (restore 4042) = Snapshot.entries.flatten.map (fun row ↦ some row.1) := by
  exact (congrArg (List.map (restore 4042)) complete_raw_source.symm).trans
    (restore_entries Snapshot.entries.flatten)

theorem complete_raw_length : rawOps.length = 4042 := by
  have same := (congrArg List.length complete_raw_source).symm
  simp only [List.length_map] at same
  exact same.trans
    ((Balanced.RowTree.count_eq_length Snapshot.entries).symm.trans Snapshot.entries_count)

theorem complete_raw_at (q : Fin 4042) :
    rawOps.getD q.val .halt = rawSource (Snapshot.program q) := by
  exact (raw_lookup Snapshot.entries.flatten rawOps complete_raw_source q.val).trans
    (congrArg (fun row : Snapshot.Entry ↦ rawSource row.1)
      (Balanced.RowTree.lookup_eq_getD Snapshot.entries
        Snapshot.entries_wellFormed q.val (.halt, .halt))).symm

theorem complete_decoded_at (q : Fin 4042) :
    restore 4042 (rawOps.getD q.val .halt) = some (Snapshot.program q) := by
  rewrite [complete_raw_at]
  exact restore_original (Snapshot.program q)

noncomputable def decodedOp (q : Fin 4042) : Op 4042 :=
  (restore 4042 (rawOps.getD q.val .halt)).getD .halt

theorem decodedOp_eq (q : Fin 4042) : decodedOp q = Snapshot.program q := by
  unfold decodedOp
  rewrite [complete_decoded_at]
  rfl

theorem complete_source_lowered (q : Fin 4042) :
    lower (decodedOp q) = lower (Snapshot.program q) := congrArg lower (decodedOp_eq q)

theorem complete_source_meaning (q : Fin 4042) :
    source (decodedOp q) = SharedModel.machine q :=
  (congrArg FieldCompiler.source (decodedOp_eq q)).trans (Snapshot.source_program q)

end CompleteRawSourcePilot
''')
    names = ['rawSource', 'source_branch', 'bounds_append', 'restore_entries', 'raw_lookup',
             'source_tree_eq', 'complete_raw_source', 'complete_raw_bounds',
             'complete_raw_labels_safe', 'complete_raw_restored', 'complete_raw_length',
             'complete_raw_at', 'complete_decoded_at', 'decodedOp', 'decodedOp_eq',
             'complete_source_lowered', 'complete_source_meaning']
    source_text = ''.join(parts)
    final_names = names[5:]
    for index, name in enumerate(final_names):
        needle = ('noncomputable def ' if name == 'decodedOp' else 'theorem ') + name
        assert source_text.count(needle) == 1
        source_text = source_text.replace(needle, progress_marker(
            'complete-raw-source-final', index, driver.args.output / 'raw-source-final.tsv') +
            needle)
    source_text = source_text.replace('\nend CompleteRawSourcePilot\n', '\n' + progress_marker(
        'complete-raw-source-final', len(final_names),
        driver.args.output / 'raw-source-final.tsv') +
        '\nend CompleteRawSourcePilot\n')
    driver.emit('CompleteRawSource.lean', source_text + audit_and_end(
        driver, 'CompleteRawSource', ['CompleteRawSourcePilot.' + name for name in names],
        'All frozen raw source operations reconstructed with exact bounds'))
    driver.summary['complete_raw_source_proposed'] = dict(
        operations=4042, chunks=127, label_bound_declarations=0, kernel_checked=False,
        full_quotient_certified=False, new_accepted_machine=False)
    driver.checkpoint()
