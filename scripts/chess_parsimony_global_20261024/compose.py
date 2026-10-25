#!/usr/bin/env python3
"""Remote-only shared full-word iteration and independently framed packet certificates."""
import os
if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

import hashlib
import importlib.util
from pathlib import Path
import re
import sys
import textwrap

ROOT = Path(__file__).resolve().parents[2]
spec = importlib.util.spec_from_file_location('counter_compose',
    ROOT / 'scripts/chess_parsimony_counter_20261024/compose.py')
counter = importlib.util.module_from_spec(spec)
spec.loader.exec_module(counter)
PACKET = 'docs/chess/campaign-2026-10-22/round-04/evidence/packet-02/unpacked/packet.bits'
PACKET_SHA = 'ab1f8764749765bfb0d44b22a999d7907345d2648bf478092a276cf8df71c2d8'


def balanced(parts, op=' ++ '):
    if len(parts) == 1:
        return parts[0]
    mid = len(parts) // 2
    return '(' + balanced(parts[:mid], op) + op + balanced(parts[mid:], op) + ')'


def wrap(text):
    return '\n'.join(textwrap.wrap(text, width=98, break_long_words=False,
        break_on_hyphens=False, subsequent_indent='    '))


def string_def(name, bits):
    pieces = ['"' + bits[i:i + 76] + '"' for i in range(0, len(bits), 76)]
    return 'def ' + name + ' : String :=\n  ' + balanced(pieces, ' ++\n  ') + '\n\n'


def generate(work):
    item = counter.generate(work)
    path = item['source']
    source = path.read_text().replace('import Cryptids.Compilation.Parsimony.IndexedExtractor',
                                     'import Cryptids.Compilation.Parsimony.Global')
    source = source.replace('private def part', 'def part')
    source = source.replace('chess-parsimony-counter-20261024/AllWords.rows',
                            'chess-parsimony-global-20261024/AllWords.rows')
    parts = re.findall(r'def (part\d+) : Array Nat :=', source)
    assert len(parts) == 53
    source += '\nnamespace ParsimonyComposed\n'
    for i, part in enumerate(parts):
        count = min(256, 13360 - i * 256)
        source += ('theorem size_' + part + ' : ' + part + '.size = ' + str(count) +
                   ' := by decide +kernel\n')
    source += 'theorem raw_size : raw.size = 13360 := by\n'
    source += '  simp only [raw, Array.size_append,\n'
    source += wrap('    ' + ', '.join('size_' + p for p in parts) + ']') + '\n'
    source += '\nend ParsimonyComposed\n'
    path.write_text(source)
    generic = '''import AllWords

open Turing ConjectureMachines
open ConjectureMachines.Compilation
open Parsimony.Common Parsimony.Insertion
namespace ParsimonyComposed

set_option backward.isDefEq.respectTransparency false

def word (i : Nat) : List (Fin 2) :=
  Parsimony.Packet.encode 13 (Parsimony.Data.wordAt 13359 values i).val

theorem global_tick (i : Nat) (bound : i ≤ 13359) (L : ListBlank (Fin 2)) :
    Parsimony.Common.Runs (model values) (Parsimony.Global.boundary data i L)
      (Parsimony.Global.boundary data (i + 1) (ListBlank.append (word i) L)) := by
  apply Parsimony.Global.tick (model values) data 13359 13 (row_more values)
    (fun j ↦ (Parsimony.Data.wordAt 13359 values j).val)
  · intro j upper
    simpa only [values, show (2 : Nat) ^ 13 = 8192 by decide +kernel]
      using words_bound raw j
  · intro j upper left right
    exact allWordsIndexed ⟨j, by omega⟩ left right
  · exact bound

theorem global_iteration (L : ListBlank (Fin 2)) :
    Parsimony.Common.Runs (model values) (Parsimony.Global.boundary data 0 L)
      (Parsimony.Global.boundary data 13360
        (ListBlank.append (Parsimony.Global.written word 13360) L)) :=
  Parsimony.Global.iterate (model values) data 13359 word global_tick 13360 (by omega) L

'''
    post = item['ids']['test_positive_end']
    generic += 'def positiveEnd : Fin 13546 := stateOf ' + str(post) + '\n\n'
    generic += '''theorem values_size : values.size = 13360 := by
  simp only [values, Array.size_map, raw_size]

theorem final_one : (model values).transition exit 1 =
    some (0, .left, positiveEnd) := by
  rw [static_eq values #[] exit 1 (by decide +kernel)]
  decide +kernel

theorem global_terminated (L : ListBlank (Fin 2)) :
    Parsimony.Common.Runs (model values) (Parsimony.Global.boundary data 0 L)
      ⟨positiveEnd, Tape.mk'
        (O 13359 ((ListBlank.append (Parsimony.Global.written word 13360) L).cons 0))
        Parsimony.Global.blank⟩ :=
  (global_iteration L).trans
    (Parsimony.Global.finish_left (model values) data exit positiveEnd 13359
      (row_more values) (row_last values) final_one _)

end ParsimonyComposed

#print axioms ParsimonyComposed.global_iteration
#print axioms ParsimonyComposed.global_terminated
'''
    # Exact tape/head root; no physical run unrolling and no extra paid control.
    global_source = work / 'GlobalInstance.lean'
    global_source.write_text(generic)
    bits = (ROOT / PACKET).read_bytes()
    assert hashlib.sha256(bits).hexdigest() == PACKET_SHA
    packet = bits.decode('ascii')
    assert len(packet) == 173641 and set(packet) <= {'0', '1'}
    framed = '1' * 32 + '0' + packet + '100' + '000'
    assert len(framed) == 13360 * 13
    # Chunk identities read expected characters from the pinned packet, not the table.
    parts = re.findall(r'def (part\d+) : Array Nat :=', source)
    assert len(parts) == 53
    identity = '''import GlobalInstance

open Turing ConjectureMachines
open ConjectureMachines.Compilation
namespace ParsimonyComposed

def numeric (input : Array Nat) : List Nat := (input.map narrow).toList.map Fin.val

@[simp] theorem numeric_append (first second : Array Nat) :
    numeric (first ++ second) = numeric first ++ numeric second := by
  simp [numeric, Array.map_append]

'''
    chunks = []
    for i, part in enumerate(parts):
        begin, end = i * 256 * 13, min((i + 1) * 256 * 13, len(framed))
        name = 'frozenChunk' + str(i)
        chunks.append(name)
        identity += string_def(name, framed[begin:end])
        identity += 'theorem packet_chunk' + str(i) + ' :\n'
        identity += '    Parsimony.Packet.render 13 (numeric ' + part + ') = ' + name + '.toList := by\n'
        identity += '  decide +kernel\n\n'
    identity += 'def frozenFramed : String :=\n' + wrap('  ' + balanced(chunks)) + '\n\n'
    identity += string_def('frozenPacket', packet)
    identity += '''theorem packet_framing : frozenFramed =
    "111111111111111111111111111111110" ++ frozenPacket ++ "100000" := by
  decide +kernel

theorem all_packet_words : Parsimony.Packet.render 13 (numeric raw) = frozenFramed.toList := by
  simp only [raw, numeric_append, Parsimony.Packet.render_append,
'''
    identity += wrap('    ' + ', '.join('packet_chunk' + str(i) for i in range(53)) + ',') + '\n'
    identity += '''    frozenFramed, String.toList_append]

theorem global_bits_identity :
    Parsimony.Packet.text (Parsimony.Global.written word 13360).reverse =
      frozenFramed.toList := by
  calc
    Parsimony.Packet.text (Parsimony.Global.written word 13360).reverse =
        (List.range 13360).flatMap (fun i ↦
          Parsimony.Packet.text (Parsimony.Packet.encode 13
            (Parsimony.Data.wordAt 13359 values i).val).reverse) := by
      rw [Parsimony.Global.written_reverse]
      simp only [Parsimony.Packet.text, List.map_flatMap, word]
    _ = Parsimony.Packet.render 13 (values.toList.map Fin.val) := by
      simpa only [values_size] using Parsimony.Packet.indexed_render 13 13359 values
    _ = frozenFramed.toList := by
      simpa only [values, numeric] using all_packet_words

end ParsimonyComposed

#print axioms ParsimonyComposed.global_bits_identity
#print axioms ParsimonyComposed.all_packet_words
#print axioms ParsimonyComposed.packet_framing
'''
    identity_source = work / 'Identity.lean'
    identity_source.write_text(identity)
    return dict(**item, global_source=global_source, identity_source=identity_source,
        packet_sha256=PACKET_SHA, packet_bits=len(packet), framed_bits=len(framed),
        chunks=len(parts), final_post=post)
