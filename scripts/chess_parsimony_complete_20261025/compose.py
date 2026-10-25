#!/usr/bin/env python3
"""Remote-only complete printer instances and shared-data backward-scan certificates."""
import os
if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

import json
from pathlib import Path
import re
import struct
import textwrap

ROOT = Path(__file__).resolve().parents[2]


def balanced(names):
    if len(names) == 1:
        return names[0]
    mid = len(names) // 2
    return '(' + balanced(names[:mid]) + ' ++ ' + balanced(names[mid:]) + ')'


def wrap(s):
    return '\n'.join(textwrap.wrap(s, width=98, break_long_words=False,
                    break_on_hyphens=False, subsequent_indent='    ')) + '\n'


def generate(work, prior, table):
    record = struct.Struct('<BBI')
    raw = table.read_bytes()
    source = '''import Identity
import Cleanup

open Turing ConjectureMachines
open ConjectureMachines.Compilation
open ParsimonyComplete Parsimony.Common Parsimony.Insertion
namespace ParsimonyComposed

set_option backward.isDefEq.respectTransparency false
attribute [local irreducible] values raw

private def preamble : Array (Fin 2 × Dir × Fin 13546) := #[
'''
    for i in range(12):
        w, d, t = record.unpack_from(raw, i * 6)
        source += f'  ({w}, .{"right" if d else "left"}, stateOf {t})' + (',' if i < 11 else '') + '\n'
    source += ''']

def printer (input : Array (Fin 13360)) : Machine 13546 2 where
  transition state bit := if state.val < 6 then preamble[state.val * 2 + bit.val]?
    else (model input).transition state bit

theorem model_extension (input : Array (Fin 13360)) (s : Fin 13546) (b : Fin 2)
    (out : Fin 2 × Dir × Fin 13546) (row : (model input).transition s b = some out) :
    (printer input).transition s b = some out := by
  by_cases early : s.val < 6
  · simp [model, early] at row
  · simpa only [printer, early, ↓reduceIte] using row

theorem printer_static (first second : Array (Fin 13360)) (s : Fin 13546) (b : Fin 2)
    (static : s.val < 6 ∨ 13366 ≤ s.val) :
    (printer first).transition s b = (printer second).transition s b := by
  by_cases early : s.val < 6
  · simp only [printer, early, ↓reduceIte]
  · simp only [printer, early, ↓reduceIte]
    exact static_eq first second s b (by omega)

def controls : ParsimonyComplete.Controls 13546 where
  initial := stateOf 0
  signal := stateOf 1
  back := stateOf 2
  data := data 0
  positiveEnd := positiveEnd
  clean := stateOf 3
  find := stateOf 4
  found := stateOf 5
  tail0 := stateOf 13507
  tail1 := stateOf 13508
  tail2 := stateOf 13509
  scan i := stateOf (13510 + min i 32)
  clear := stateOf 13543
  out := stateOf 13545

theorem printer_rows (input : Array (Fin 13360)) :
    ParsimonyComplete.Rows (printer input) controls where
'''
    fields = [('initial','initial',0),('signal','signal',0),('back','back',0),
        ('positiveEnd','positiveEnd',0),('cleanOne','clean',1),('cleanZero','clean',0),
        ('findZero','find',0),('findOne','find',1),('found','found',0),
        ('tail0','tail0',0),('tail1','tail1',0),('tail2','tail2',1),
        ('enter','scan 32',0),('clearOne','clear',1),('clearZero','clear',0)]
    for field, state, bit in fields:
        source += f'  {field} := by\n'
        source += wrap(f'    rw [printer_static input #[] (controls.{state}) {bit} (by decide +kernel)]')
        source += '    decide +kernel\n'
    for field in ['scan', 'marker']:
        body = ('∀ i : Fin 32, ∀ bit : Fin 2, ParsimonyComplete.next i.val bit < 32 → '
            '(printer #[]).transition (controls.scan i.val) bit = '
            'some (bit, .left, controls.scan (ParsimonyComplete.next i.val bit))' if field == 'scan' else
            '∀ i : Fin 32, (printer #[]).transition (controls.scan i.val) 1 = '
            'some (1, .left, controls.scan (i.val + 1))')
        source += f'  {field} := by\n'
        source += wrap('    have physical : ∀ i : Fin 32, (controls.scan i.val).val < 6 ∨ '
                       '13366 ≤ (controls.scan i.val).val := by decide +kernel')
        source += wrap('    have finite : ' + body + ' := by decide +kernel')
        source += '    intro i bound' + (' bit valid\n' if field == 'scan' else '\n')
        source += wrap('    rw [printer_static input #[] (controls.scan i) ' +
                       ('bit' if field == 'scan' else '1') + ' (physical ⟨i, bound⟩)]')
        source += '    exact finite ⟨i, bound⟩' + (' bit valid\n' if field == 'scan' else '\n')
    source += '''
end ParsimonyComposed

#print axioms ParsimonyComposed.model_extension
#print axioms ParsimonyComposed.printer_rows

def main : IO Unit := do
  let mut lines : Array String := #[]
  for i in [:13545] do
    for b in [:2] do
      let state : Fin 13546 := ParsimonyComposed.stateOf i
      let bit : Fin 2 := ⟨b % 2, Nat.mod_lt b (by decide +kernel)⟩
      match (ParsimonyComposed.printer ParsimonyComposed.values).transition state bit with
      | none => throw (IO.userError "Missing paid printer row")
      | some (write, direction, target) =>
        let d := if direction = .right then 1 else 0
        lines := lines.push s!"{i} {b} {write.val} {d} {target.val}"
  IO.FS.writeFile
    "''' + str(work / 'PrinterModel.rows') + '''"
    (String.intercalate "\\n" lines.toList)
  IO.println "PARSIMONY_COMPLETE_PRINTER_ROWS_EXPORTED"
'''
    model = work / 'PrinterModel.lean'
    model.write_text(source)
    chunks, group_chunks = {}, {}
    for p in sorted(prior.glob('PacketBatch*.lean')):
        ids = []
        for i, body in re.findall(r'def packetChars(\d+) : List Char :=(.*?)def frozenChunk',
                                  p.read_text(), re.S):
            index = int(i)
            chunks[index] = ''.join('0' if c == 'zeroChar' else '1' for c in
                                   re.findall(r'\b(zeroChar|oneChar)\b', body))
            ids.append(index)
        group_chunks[int(p.stem[-2:])] = ids
    assert len(chunks) == 418
    certificates, count = {}, 0
    for i in reversed(sorted(chunks)):
        start = count
        for bit in reversed(chunks[i]):
            count = count + 1 if bit == '1' else 0
            assert count < 32, 'Packet contains marker'
        certificates[i] = (start, count)
    batches = []
    for part, ids in group_chunks.items():
        p = work / ('ScanBatch' + str(part).zfill(2) + '.lean')
        s = 'import PacketBatch' + str(part).zfill(2) + '\nimport Cleanup\n\n'
        s += 'open ParsimonyComplete\nnamespace ParsimonyComposed\n\n'
        for i in ids:
            start, end = certificates[i]
            s += f'theorem scan_chunk{i} :\n'
            s += f'    eval {start} (decode packetChars{i}).reverse = some {end} := by\n'
            s += '  decide +kernel\n\n'
        s += wrap('attribute [local irreducible] ' + ' '.join('packetChars' + str(i) for i in ids))
        start, end = certificates[ids[-1]][0], certificates[ids[0]][1]
        s += f'\ntheorem scan_part{part} :\n'
        s += f'    eval {start} (decode payloadPart{part}).reverse = some {end} := by\n'
        s += f'  simp only [payloadPart{part}, decode_append, List.reverse_append]\n'
        s += wrap('  simp only [eval_append, ' + ', '.join('scan_chunk' + str(i) for i in reversed(ids)) +
                  ', Option.bind_some]')
        s += '\nend ParsimonyComposed\n\n#print axioms ParsimonyComposed.scan_part' + str(part) + '\n'
        p.write_text(s)
        batches.append(p)
    final = work / 'Complete.lean'
    s = 'import PrinterModel\n' + ''.join('import ScanBatch' + str(i).zfill(2) + '\n' for i in range(53))
    s += '''
open Turing ConjectureMachines
open ConjectureMachines.Compilation
open ParsimonyComplete Parsimony.Common Parsimony.Insertion
namespace ParsimonyComposed

set_option backward.isDefEq.respectTransparency false
attribute [local irreducible] raw values
'''
    s += wrap('attribute [local irreducible] ' + ' '.join('payloadPart' + str(i) for i in range(53)))
    s += '''
def packet : List (Fin 2) := decode frozenPacket

theorem packet_scan : eval 0 packet.reverse = some ''' + str(count) + ''' := by
  simp only [packet, frozenPacket, decode_append, List.reverse_append]
'''
    s += wrap('  simp only [eval_append, ' + ', '.join('scan_part' + str(i) for i in reversed(range(53))) +
              ', Option.bind_some]')
    s += '''
attribute [local irreducible] frozenPacket packet

theorem printed_eq : Parsimony.Global.written word 13360 =
    [0, 0, 0, 0, 0, 1] ++ packet.reverse ++ [0] ++ List.replicate 32 1 := by
  have marker_bits : decode marker = List.replicate 32 1 ++ [0] := by decide +kernel
  have tail_bits : decode tailPadding = [1, 0, 0, 0, 0, 0] := by decide +kernel
  have forward := congrArg decode global_bits_identity
  rw [decode_text, packet_framing, decode_append, decode_append, marker_bits, tail_bits] at forward
  change (Parsimony.Global.written word 13360).reverse =
    (List.replicate 32 1 ++ [0]) ++ packet ++ [1, 0, 0, 0, 0, 0] at forward
  have backward := congrArg List.reverse forward
  simpa only [List.reverse_reverse, List.reverse_append, List.reverse_cons,
    List.reverse_nil, List.nil_append, List.reverse_replicate, List.append_assoc] using backward

/-- Complete physical printer interface: start on blank tape, decoder on first packet bit. -/
theorem complete_printer :
    Parsimony.Common.Runs (printer values) (init : Cfg 13546 2)
      ⟨stateOf 13545, Tape.mk' blank (ListBlank.append packet blank)⟩ := by
  have first : Parsimony.Common.Runs (printer values) (init : Cfg 13546 2)
      (Parsimony.Global.boundary data 0 blank) := by
    simpa only [controls, stateOf, init, Parsimony.Global.boundary,
      Z_zero, Parsimony.Global.blank_cons] using
      startup (printer values) controls (printer_rows values)
  have core := ParsimonyComplete.extend (model values) (printer values)
    (model_extension values) (global_terminated blank)
  let L := ListBlank.append (packet.reverse ++ [0]) (O 32 blank)
  have geometry : ListBlank.append (Parsimony.Global.written word 13360) blank =
      Z 5 (L.cons 1) := by
    rw [printed_eq]
    simp only [L, ListBlank.append_assoc, ListBlank.append, Z, O,
      List.replicate_succ, List.replicate_zero]
  have work := workspace (printer values) controls (printer_rows values) 13359
    (ListBlank.append (Parsimony.Global.written word 13360) blank)
  have finish := tail (printer values) controls (printer_rows values) L
  have bridge : Parsimony.Common.Runs (printer values)
      ⟨controls.find, atL (ListBlank.append (Parsimony.Global.written word 13360) blank) blank⟩
      ⟨controls.find, atL (Z 5 (L.cons 1)) blank⟩ := by
    rw [geometry]
    exact .refl
  have clean := cleanup (printer values) controls (printer_rows values) packet _ packet_scan
  exact first.trans (core.trans (work.trans (bridge.trans (finish.trans clean))))

end ParsimonyComposed

#print axioms ParsimonyComposed.packet_scan
#print axioms ParsimonyComposed.printed_eq
#print axioms ParsimonyComposed.complete_printer
'''
    final.write_text(s)
    return dict(model=model, batches=batches, final=final, chunk_states=certificates,
                chunks=418, words=13360, packet_bits=sum(map(len, chunks.values())), final_scan=count)
