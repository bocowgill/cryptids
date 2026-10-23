#!/usr/bin/env python3
"""Remote-only proposed local syntax witnesses; Lean must prove every equation."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

from bisect import bisect_right
import hashlib
import json


PRELUDE = r'''open ConjectureMachines.Optimisation
open Chess.Optimisation FieldCompiler
set_option backward.isDefEq.respectTransparency false

def slotIndex (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p) (i : Fin p.size) : Fin 106668 :=
  FieldSelectiveLayout.nodeIndex q (i.cast (congrArg Syntax.size same).symm)

theorem slotIndex_val (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p) (i : Fin p.size) :
    (slotIndex q p same i).val = FieldPackedLayout.offset q + i.val := by
  simpa only [slotIndex, Fin.val_cast] using
    FieldPackedLayout.code_val q (i.cast (congrArg Syntax.size same).symm)

theorem getter_syntax (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p) (i : Fin p.size) :
    FieldPacked.getter.node (slotIndex q p same i) =
      TemplateGraph.mapNode (slotIndex q p same) (p.fastNodeAt i) := by
  cases same
  exact getter_local q i
'''


def generate(driver, snapshot, expected_sha, header, audit_and_end, progress_marker, module):
    assert hashlib.sha256(snapshot.read_bytes()).hexdigest() == expected_sha
    data = json.loads(snapshot.read_text())
    records = data['getter_samples']
    offsets, sizes = data['prefix_offsets'], data['row_sizes']
    # Endpoints deliberately test both the first and far-end layout addresses.
    nodes = [0, 106667]
    slots = set(nodes)
    for node in nodes:
        record = records[node]
        assert record[0] == node
        instruction = record[1]
        if instruction[0] in (0, 1, 2):
            slots.add(instruction[2])
        elif instruction[0] == 3:
            slots.update(instruction[2:4])
    labels = sorted({bisect_right(offsets, node) - 1 for node in slots})
    parts = [header([module + '.RowTools']), PRELUDE]
    roots = ['slotIndex', 'slotIndex_val', 'getter_syntax']

    def marker(kind, value):
        return progress_marker(kind, value, driver.args.output / 'row-witness-progress.tsv')

    for q in labels:
        parts.append(f'def syntax_{q} : Syntax 4042 := lower (Snapshot.program {q})\n')
        parts.append(f'theorem syntax_eq_{q} : FieldPacked.syntaxRows.get {q} = syntax_{q} :=\n'
                     f'  FieldAware.syntaxRows_get {q}\n')
        proof = 'exact FieldPackedLayout.offset_zero' if q == 0 else 'decide +kernel'
        parts.append(f'theorem offset_{q} : FieldPackedLayout.offset {q} = {offsets[q]} := by\n'
                     f'  {proof}\n')
        parts.append(marker('offset', q))
        roots.extend([f'syntax_eq_{q}', f'offset_{q}'])
    for node in sorted(slots):
        q = bisect_right(offsets, node) - 1
        local = node - offsets[q]
        assert 0 <= local < sizes[q]
        parts.append(f'def slot_{node} : Fin syntax_{q}.size :=\n'
                     f'  ⟨{local}, by decide +kernel⟩\n')
        parts.append(f'theorem address_{node} :\n'
                     f'    slotIndex {q} syntax_{q} syntax_eq_{q} slot_{node} = {node} := by\n'
                     f'  apply Fin.ext\n  rw [slotIndex_val, offset_{q}]\n  rfl\n')
        roots.append(f'address_{node}')
        parts.append(marker('address', node))
    for node in nodes:
        q = bisect_right(offsets, node) - 1
        tag, *args = records[node][1]
        children = []
        if tag == 0:
            assert args[0] in (-1, 1)
            direction = 'right' if args[0] == 1 else 'left'
            children = [args[1]]
            body = f'.move .{direction} slot_{args[1]}'
        elif tag in (1, 2, 3, 4):
            values = args[0]
            assert len(values) == 10
            bound = 2 if tag in (1, 3) else 5 if tag == 2 else 4042
            assert all(type(v) is int and 0 <= v < bound for v in values)
            cells = [('true' if v else 'false') if bound == 2 else
                     f'⟨{v}, by decide⟩' for v in values]
            table = '⟨#[\n' + ',\n'.join('      ' + cell for cell in cells) + '], rfl⟩'
            constructor = {1: 'write', 2: 'load', 3: 'branch', 4: 'goto'}[tag]
            children = args[1:] if tag in (1, 2, 3) else []
            body = f'.{constructor}\n    {table}'
            if children:
                body += '\n    ' + ' '.join(f'slot_{child}' for child in children)
        else:
            assert tag == 5
            body = '.halt'
        assert all(bisect_right(offsets, child) - 1 == q for child in children)
        parts.append(f'def localNode_{node} : BoolGraph.Node syntax_{q}.size 5 4042 :=\n'
                     f'  {body}\n')
        parts.append(f'theorem local_eq_{node} :\n'
                     f'    syntax_{q}.fastNodeAt slot_{node} = localNode_{node} := by rfl\n')
        parts.append(f'theorem getter_witness_{node} :\n'
                     f'    FieldPacked.getter.node {node} =\n'
                     f'      TemplateGraph.mapNode (slotIndex {q} syntax_{q} syntax_eq_{q})\n'
                     f'        localNode_{node} := by\n'
                     f'  rw [← address_{node}, getter_syntax, local_eq_{node}]\n')
        roots.extend([f'local_eq_{node}', f'getter_witness_{node}'])
        parts.append(marker('getter', node))
    parts.append(audit_and_end(driver, 'RowWitnesses', roots,
                               'Actual local syntax and far-end address witnesses checked'))
    driver.emit('RowWitnesses.lean', ''.join(parts))
    driver.summary['local_witness_preflight'] = dict(nodes=nodes, labels=labels,
                                                    universal_rows_proved=False)
