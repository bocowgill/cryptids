#!/usr/bin/env python3
"""Remote-only untrusted opcode proposal and ordinary-kernel source-chunk checks."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

import copy
import hashlib
import json


PROPOSER = r'''open FieldCompiler
namespace NativeSourceProposal
open Lean

def cells {n : Nat} (values : Vector (Fin n) 5) : Json :=
  .arr (values.toArray.map fun value ↦ toJson value.val)

def encode : TableOp 4042 → Json
  | .move dir next => .arr #[toJson (0 : Nat),
      toJson (if dir = .left then (-1 : Int) else 1), toJson next.val]
  | .write field values next =>
      .arr #[toJson (1 : Nat), toJson field.val, cells values, toJson next.val]
  | .load field values next => .arr #[toJson (2 : Nat), toJson field.val,
      .arr (values.toArray.map cells), toJson next.val]
  | .pureLoad values next => .arr #[toJson (3 : Nat), cells values, toJson next.val]
  | .marker yes no => .arr #[toJson (4 : Nat), toJson yes.val, toJson no.val]
  | .absent field yes no =>
      .arr #[toJson (5 : Nat), toJson field.val, toJson yes.val, toJson no.val]
  | .branch test yes no => .arr #[toJson (6 : Nat),
      .arr (test.toArray.map toJson), toJson yes.val, toJson no.val]
  | .jump targets => .arr #[toJson (7 : Nat), cells targets]
  | .halt => .arr #[toJson (8 : Nat)]

def propose : IO Unit := do
  let operations := Snapshot.entries.flatten.toArray.map fun row ↦ encode (toTableOp row.1)
  let payload := Json.mkObj [
    ("schema", toJson ("finite-source-op-proposal-v1" : String)),
    ("operations", .arr operations)]
  IO.FS.writeFile ".lake/chess-body-certificate-20261022/source-operation-proposal.json"
    payload.compress

#eval propose
end NativeSourceProposal
'''


def generate_proposer(driver, header, module, namespace):
    source = header([module + '.SourceTables', 'Lean.Data.Json']) + PROPOSER
    source += '\nend ' + namespace + '\n'
    source += 'run_cmd Lean.logInfo "Untrusted finite source operations exported"\n'
    driver.emit('SourceTableProposal.lean', source)


def indent(text, spaces=2):
    return '\n'.join(' ' * spaces + line for line in text.splitlines())


def fin(value, bound):
    assert type(value) is int and 0 <= value < bound
    # Fin.mk preserves the raw value; the kernel must prove its exact bound.
    return f'⟨{value}, by decide +kernel⟩'


def vector(values):
    assert len(values) == 5
    return '⟨#[\n' + ',\n'.join(indent(value) for value in values) + '\n], rfl⟩'


def cells(values, bound):
    return vector([fin(value, bound) for value in values])


def render(row):
    assert isinstance(row, list) and row and type(row[0]) is int
    tag = row[0]
    assert tag in range(9) and len(row) == [3, 4, 4, 3, 3, 4, 4, 2, 1][tag]
    if tag == 0:
        assert type(row[1]) is int and row[1] in (-1, 1)
        args = ['Dir.left' if row[1] == -1 else 'Dir.right', fin(row[2], 4042)]
    elif tag == 1:
        args = [fin(row[1], 4), cells(row[2], 5), fin(row[3], 4042)]
    elif tag == 2:
        args = [fin(row[1], 4), vector([cells(xs, 5) for xs in row[2]]), fin(row[3], 4042)]
    elif tag == 3:
        args = [cells(row[1], 5), fin(row[2], 4042)]
    elif tag in (4, 5):
        args = ([fin(row[1], 4)] if tag == 5 else []) + [fin(x, 4042) for x in row[-2:]]
    elif tag == 6:
        assert all(type(value) is bool for value in row[1])
        args = [vector(['true' if value else 'false' for value in row[1]]),
                fin(row[2], 4042), fin(row[3], 4042)]
    elif tag == 7:
        args = [cells(row[1], 4042)]
    else:
        args = []
    constructor = ['move', 'write', 'load', 'pureLoad', 'marker',
                   'absent', 'branch', 'jump', 'halt'][tag]
    return 'TableOp.' + constructor + ''.join('\n' + indent(arg) for arg in args)


def values(row):
    tag = row[0]
    if tag == 2:
        return [x for xs in row[2] for x in xs]
    if tag == 1:
        return row[2]
    return row[1] if tag in (3, 6, 7) else []


def generate_chunk(driver, header, audit_and_end, module):
    path = driver.args.output / 'source-operation-proposal.json'
    raw = path.read_bytes()
    payload = json.loads(raw)
    assert payload['schema'] == 'finite-source-op-proposal-v1'
    operations = payload['operations']
    assert len(operations) == 4042
    for row in operations:
        render(row)
    varying = [i for i, row in enumerate(operations) if len(set(values(row))) > 1]
    loads = [i for i in varying if operations[i][0] == 2]
    assert varying, 'No nonconstant callback observed; this pilot requires one'
    selected = (loads or varying)[0]
    start = selected // 32 * 32
    chunk = operations[start:start + 32]
    local = selected - start
    bad = copy.deepcopy(chunk[local])
    tag = bad[0]
    if tag == 2:
        bad[2][0][0] = (bad[2][0][0] + 1) % 5
    elif tag == 1:
        bad[2][0] = (bad[2][0] + 1) % 5
    elif tag == 6:
        bad[1][0] = not bad[1][0]
    else:
        bad[1][0] = (bad[1][0] + 1) % (4042 if tag == 7 else 5)
    body = ('open FieldCompiler\nnamespace SourceChunkPilot\n'
            f'def sourceOps : List (Op 4042) := Snapshot.chunk{start:04d}.flatten.map Prod.fst\n'
            'def proposedOps : List (TableOp 4042) := [\n' +
            ',\n'.join(indent(render(row)) for row in chunk) + '\n]\n'
            'def corruptOp : TableOp 4042 :=\n' + indent(render(bad)) + '\n'
            f'def corruptOps : List (TableOp 4042) := proposedOps.set {local} corruptOp\n'
            'theorem source_chunk_tables : sourceOps.map toTableOp = proposedOps := by\n'
            '  decide +kernel\n'
            'theorem corrupted_chunk_rejected : sourceOps.map toTableOp ≠ corruptOps := by\n'
            '  decide +kernel\n'
            'theorem source_chunk_restored : proposedOps.map fromTableOp = sourceOps := by\n'
            '  have restore (ops : List (Op 4042)) :\n'
            '      (ops.map toTableOp).map fromTableOp = ops := by\n'
            '    induction ops with\n'
            '    | nil => rfl\n'
            '    | cons op ops ih => simp only [List.map_cons, from_toTableOp, ih]\n'
            '  rewrite [← source_chunk_tables]\n'
            '  exact restore sourceOps\n'
            f'theorem chunk_length : proposedOps.length = {len(chunk)} := by decide +kernel\n'
            'end SourceChunkPilot\n')
    roots = ['SourceChunkPilot.' + name for name in
             ['source_chunk_tables', 'corrupted_chunk_rejected',
              'source_chunk_restored', 'chunk_length']]
    driver.emit('SourceChunk.lean', header([module + '.SourceTables']) + body +
                audit_and_end(driver, 'SourceChunk', roots,
                              'Actual frozen source chunk reconstructed and corruption rejected'))
    driver.summary['source_operation_proposal'] = dict(
        path=path.name, info=dict(bytes=len(raw), sha256=hashlib.sha256(raw).hexdigest()),
        scope='Untrusted native finite opcode proposal; no complete source fidelity claim')
    driver.summary['source_chunk_proposed'] = dict(start=start, length=len(chunk),
                                                  nonconstant_index=selected, tag=tag,
                                                  kernel_checked=False)
    driver.checkpoint()
