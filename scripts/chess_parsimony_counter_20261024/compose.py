#!/usr/bin/env python3
"""Remote-only all-word instantiation on an exact local fragment of the fixed machine."""
import os
if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

import hashlib
import json
from pathlib import Path
import struct
import textwrap

ROOT = Path(__file__).resolve().parents[2]
EVIDENCE = 'docs/chess/parsimony-printer-2026-10-24/evidence/validation-04/unpacked/'
SHARED = 'docs/chess/parsimony-printer-2026-10-24/proof-memory/evidence/' \
         'memory-01/unpacked/Shared.lean'
TABLE = EVIDENCE + 'full-candidate-rows.bin'
NAMES = EVIDENCE + 'exact-packet-raw-printer.json'
TABLE_SHA = 'b9cf384e5470f3c9f5c501bd8c13555f15d4ea134469f5d159cd1bdb363cbf45'


def generate(work):
    raw = (ROOT / TABLE).read_bytes()
    assert hashlib.sha256(raw).hexdigest() == TABLE_SHA
    names = json.loads((ROOT / NAMES).read_text())
    ids = {name: i for i, name in enumerate(names['names'])}
    end, error = names['out'], names['error']
    assert names['words'] == 13360 and names['width'] == 13
    assert ids['data_out'] == 13366 and end == 13545 and error == 13544
    record = struct.Struct('<BBI')
    rows = [record.unpack_from(raw, i) for i in range(0, 2 * end * record.size, record.size)]
    assert all(w < 2 and d < 2 and t <= end for w, d, t in rows[2 * 13366:])
    source = (ROOT / SHARED).read_text().split('/-- One shared bound proof', 1)[0]
    source = source.replace('import Cryptids.Compilation.Parsimony.Data',
                            'import Cryptids.Compilation.Parsimony.IndexedExtractor')
    source = source.replace('namespace ParsimonyScale13360', 'namespace ParsimonyComposed')
    source += '''
open Parsimony.Common Parsimony.Insertion

def narrow (value : Nat) : Fin 13360 :=
  ⟨value % 8192, by have := Nat.mod_lt value (by decide +kernel : 0 < 8192); omega⟩

theorem narrow_val (value : Nat) (bound : value < 8192) :
    (narrow value).val = value := Nat.mod_eq_of_lt bound

theorem words_bound (input : Array Nat) (i : Nat) :
    (Parsimony.Data.wordAt 13359 (input.map narrow) i).val < 8192 := by
  simp only [Parsimony.Data.wordAt, Array.getElem?_map]
  cases h : input[i]? with
  | none => simp
  | some value => simpa [h, narrow] using Nat.mod_lt value (by decide +kernel : 0 < 8192)

def values : Array (Fin 13360) := raw.map narrow
attribute [local irreducible] values

def stateOf (i : Nat) : Fin 13546 := ⟨i % 13546, Nat.mod_lt i (by decide +kernel)⟩

def data (i : Nat) : Fin 13546 := ⟨6 + min i 13359, by omega⟩
def exit : Fin 13546 := stateOf 13366

private def staticRows : Array (Fin 2 × Turing.Dir × Fin 13546) := #[
'''
    static = rows[2 * 13366:]
    for i, (w, d, t) in enumerate(static):
        source += f'  ({w}, .{"right" if d else "left"}, stateOf {t})' + \
                  (',' if i + 1 < len(static) else '') + '\n'
    source += ''']

def model (values : Array (Fin 13360)) : Machine 13546 2 where
  transition state bit :=
    if state.val < 6 then none else
    if state.val < 13366 then
      if bit = 0 then
        if state.val < 13365 then some (1, .right, data (state.val - 6 + 1))
        else some (0, .right, exit)
      else some (0, .right, data (13359 - (Parsimony.Data.wordAt 13359 values
        (state.val - 6)).val))
    else staticRows[(state.val - 13366) * 2 + bit.val]?

theorem row_more (values : Array (Fin 13360)) (i : Nat) (bound : i < 13359) :
    (model values).transition (data i) 0 = some (1, .right, data (i + 1)) := by
  have le : i ≤ 13359 := by omega
  have next : i + 1 ≤ 13359 := by omega
  simp [model, data, Nat.min_eq_left le, Nat.min_eq_left next,
    show ¬6 + i < 6 by omega, show 6 + i < 13366 by omega,
    show 6 + i < 13365 by omega]

theorem row_last (values : Array (Fin 13360)) :
    (model values).transition (data 13359) 0 = some (0, .right, exit) := by
  rfl

theorem row_one (values : Array (Fin 13360)) (i : Nat) (bound : i ≤ 13359) :
    (model values).transition (data i) 1 =
      some (0, .right, data (13359 - (Parsimony.Data.wordAt 13359 values i).val)) := by
  simp [model, data, Nat.min_eq_left bound,
    show ¬6 + i < 6 by omega, show 6 + i < 13366 by omega]

theorem static_eq (first second : Array (Fin 13360)) (state : Fin 13546) (bit : Fin 2)
    (bound : 13366 ≤ state.val) :
    (model first).transition state bit = (model second).transition state bit := by
  simp only [model, show ¬state.val < 6 by omega,
    show ¬state.val < 13366 by omega, ↓reduceIte]

private def select (items : Array Nat) (i : Nat) : Fin 13546 :=
  stateOf (items[i]?.getD ''' + str(error) + ''')
'''

    def array(indices):
        return '#[' + ', '.join(str(i) for i in indices) + ']'

    def wrap(text):
        return '\n'.join(textwrap.wrap(text, 98, break_long_words=False,
                        break_on_hyphens=False, subsequent_indent='    ')) + '\n'

    controls = dict(a=[ids['test_negative_continue']] +
        [ids[f'create_blank_char_{i}_out_a'] for i in range(13)],
        b=[error] + [ids[f'create_blank_char_{i}_out_b'] for i in range(13)])
    for field, suffix in [('first', 'find_first_a_left'), ('second', 'find_second_a'),
                          ('put', 'write_blank_char'), ('middle', 'push_middle_a')]:
        controls[field] = [ids[f'create_blank_char_{i}_{suffix}'] for i in range(13)]
    source += '\ndef insert : Parsimony.Insertion.Controls 13546 where\n'
    for field, states in controls.items():
        source += wrap('  ' + field + ' i := select (' + array(states) + ') i')
    source += '  back := stateOf ' + str(ids['create_blank_go_left']) + '\n'
    source += '  out := stateOf ' + str(ids['create_blank_word_out']) + '\n'
    carries = [ids['convert_increment']] + [ids[f'convert_incr_carry_{i}'] for i in range(1, 13)]
    no_carries = [error] + [ids[f'convert_incr_no_carry_{i}'] for i in range(1, 13)]
    backs = [error] + [ids[f'convert_incr_get_out_{i}'] for i in range(1, 13)] + [ids['convert_incrout']]
    source += '\ndef increment (carry : Bool) (i : Nat) : Fin 13546 :=\n'
    source += wrap('  if carry then select (' + array(carries) + ') i')
    source += wrap('  else select (' + array(no_carries) + ') i')
    source += '\n' + wrap('def back (i : Nat) : Fin 13546 := select (' + array(backs) + ') i')
    source += '\ndef convert : Parsimony.Extractor.Controls 13546 where\n  scan := insert.out\n'
    for field, label in [('delete', 'convert_delete_last_b'), ('first', 'convert_get_to_first_a_left'),
        ('second', 'convert_get_to_second_a_left'), ('returnToUnary', 'convert_get_to_second_a_right'),
        ('makeMarker', 'convert_make_new_b'), ('moveLeft', 'convert_move_left'),
        ('clean', 'convert_clean_up_mess')]:
        source += '  ' + field + ' := stateOf ' + str(ids[label]) + '\n'
    source += '  data := data 0\n  counter := increment\n  back := back\n'

    def finite(field, intro, proposition, application):
        prefix, body = proposition.split('(model values).transition ', 1)
        depth, stop = 0, None
        for i, char in enumerate(body):
            depth += int(char == '(') - int(char == ')')
            if i > 0 and depth == 0:
                stop = i + 1
                break
        assert stop is not None
        state, bit = body[:stop], body[stop:].strip().split()[0]
        actual_state = state.replace('j.val', 'i')
        physical = prefix + '13366 ≤ ' + state + '.val'
        lines = '  ' + field + ' := by\n    intro ' + intro + '\n    have physical :\n'
        lines += '\n'.join(textwrap.wrap(physical + ' := by decide +kernel', 98,
            initial_indent='      ', subsequent_indent='      ',
            break_long_words=False, break_on_hyphens=False)) + '\n'
        lines += '    have finite :\n' + \
            '\n'.join(textwrap.wrap(proposition.replace('(model values)', '(model #[])') +
                ' := by decide +kernel', width=98,
                initial_indent='      ', subsequent_indent='      ',
                break_long_words=False, break_on_hyphens=False)) + \
            '\n'
        lines += wrap('    rw [static_eq values #[] ' + actual_state + ' ' + bit +
                      ' (physical ' + application + ')]')
        return lines + '    exact finite ' + application + '\n'

    def closed(field, state, bit):
        return '  ' + field + ' := by\n' + wrap(
            '    rw [static_eq values #[] (' + state + ') ' + str(bit) +
            ' (by decide +kernel)]') + '    decide +kernel\n'

    source += '''
theorem counter_rows (values : Array (Fin 13360)) :
    Parsimony.Counter.Rows (model values) increment back 13 where
'''
    source += finite('more', 'i bound carry bit valid',
        '∀ j : Fin 12, ∀ carry : Bool, ∀ bit : Fin 2, (0 < j.val ∨ carry = true) → '
        '(model values).transition (increment carry j.val) bit = some '
        '(Parsimony.Counter.digit carry bit, .left, '
        'increment (Parsimony.Counter.next carry bit) (j.val + 1))',
        '⟨i, by omega⟩ carry bit valid')
    source += finite('last', 'carry bit clear',
        '∀ carry : Bool, ∀ bit : Fin 2, Parsimony.Counter.next carry bit = false → '
        '(model values).transition (increment carry 12) bit = '
        'some (Parsimony.Counter.digit carry bit, .right, back 1)', 'carry bit clear')
    source += finite('back', 'i lower upper bit',
        '∀ j : Fin 13, 1 ≤ j.val → ∀ bit : Fin 2, '
        '(model values).transition (back j.val) bit = some (bit, .right, back (j.val + 1))',
        '⟨i, upper⟩ lower bit')
    source += '''
theorem insert_rows (values : Array (Fin 13360)) :
    Parsimony.Insertion.Rows (model values) insert 13 where
'''
    fields = [('a', 'a', 0, 0, 'left', 'first', False),
        ('firstOne', 'first', 1, 1, 'left', 'first', False),
        ('firstZero', 'first', 0, 0, 'left', 'second', False),
        ('second', 'second', 0, 0, 'right', 'put', False),
        ('put', 'put', 0, 0, 'right', 'middle', False),
        ('middleZero', 'middle', 0, 0, 'right', 'a', True),
        ('middleOne', 'middle', 1, 0, 'right', 'b', True)]
    for field, start, read, write, direction, target, advance in fields:
        destination = '(j.val + 1)' if advance else 'j.val'
        source += finite(field, 'i upper',
            f'∀ j : Fin 13, (model values).transition (insert.{start} j.val) {read} = '
            f'some ({write}, .{direction}, insert.{target} {destination})', '⟨i, upper⟩')
    source += finite('bOne', 'i lower upper',
        '∀ j : Fin 14, 1 ≤ j.val → (model values).transition (insert.b j.val) 1 = '
        'some (1, .right, insert.b j.val)', '⟨i, by omega⟩ lower')
    source += finite('bZero', 'i lower upper',
        '∀ j : Fin 13, 1 ≤ j.val → (model values).transition (insert.b j.val) 0 = '
        'some (1, .left, insert.first j.val)', '⟨i, upper⟩ lower')
    source += closed('finishA', 'insert.a 13', 0)
    source += closed('back', 'insert.back', 0)
    source += closed('finishB', 'insert.b 13', 0)
    source += '''

theorem convert_rows (values : Array (Fin 13360)) :
    Parsimony.Extractor.Rows (model values) convert 13 where
  counter := counter_rows values
'''
    for field, state, bit in [('scanOne', 'convert.scan', 1), ('scanZero', 'convert.scan', 0),
        ('deleteOne', 'convert.delete', 1), ('firstOne', 'convert.first', 1),
        ('firstZero', 'convert.first', 0), ('second', 'convert.second', 0),
        ('back', 'convert.back 13', 0), ('returnToUnary', 'convert.returnToUnary', 0),
        ('deleteZero', 'convert.delete', 0), ('makeMarker', 'convert.makeMarker', 0),
        ('moveLeft', 'convert.moveLeft', 0), ('clean', 'convert.clean', 0)]:
        source += closed(field, state, bit)
    source += '''
theorem allWords (i : Fin 13360) (L R : ListBlank (Fin 2)) :
    let v := (Parsimony.Data.wordAt 13359 values i.val).val
    ∃ out : List (Fin 2), out.length = 13 ∧ Parsimony.Counter.value out = v ∧
    Parsimony.Common.Runs (model values)
      ⟨data i.val, Tape.mk' (L.cons 0) ((Z (v + 1) (Z 15 R)).cons 1)⟩
      ⟨data 0, Tape.mk' ((ListBlank.append out L).cons 0) (((Z (v + 2) R).cons 1).cons 0)⟩ := by
  exact Parsimony.Extractor.query_extract (model values) data exit 13359 values
    (row_more values) (row_last values) (row_one values) insert convert 13
    (insert_rows values) (convert_rows values) (by decide +kernel) rfl rfl (by omega)
    i.val (by have := i.isLt; omega) (by
      simpa only [values, show (2 : Nat) ^ 13 = 8192 by decide +kernel]
        using words_bound raw i.val) L R

'''
    source += '\ndef insertionRight (i : Nat) : Fin 13546 := select (' + array([
        ids[f'create_blank_char_{i}_find_first_a_right'] for i in range(13)]) + ') i\n'
    # Wrap the entire definition, including its signature and literal state array.
    last = source.rsplit('\ndef insertionRight ', 1)
    source = last[0] + '\n' + wrap('def insertionRight ' + last[1].strip())
    source += '''
theorem indexed_insert_rows (values : Array (Fin 13360)) :
    Parsimony.IndexedInsertion.Rows (model values) insert 13 insertionRight where
  base := insert_rows values
'''
    for field, start, read, write, direction, target in [
        ('secondOne', 'insert.second', 1, 1, 'left', 'insert.second'),
        ('putOne', 'insert.put', 1, 0, 'right', 'insertionRight'),
        ('rightOne', 'insertionRight', 1, 1, 'right', 'insertionRight'),
        ('rightZero', 'insertionRight', 0, 1, 'right', 'insert.middle')]:
        source += finite(field, 'i upper',
            f'∀ j : Fin 13, (model values).transition ({start} j.val) {read} = '
            f'some ({write}, .{direction}, {target} j.val)', '⟨i, upper⟩')
    source += '''
theorem indexed_convert_rows (values : Array (Fin 13360)) :
    Parsimony.IndexedExtractor.Rows (model values) convert 13 where
  base := convert_rows values
'''
    for field, state in [('secondOne', 'convert.second'),
                          ('returnOne', 'convert.returnToUnary'), ('cleanOne', 'convert.clean')]:
        source += closed(field, state, 1)
    source += '''
theorem allWordsIndexed (i : Fin 13360) (L R : ListBlank (Fin 2)) :
    let v := (Parsimony.Data.wordAt 13359 values i.val).val
    ∃ out : List (Fin 2), out.length = 13 ∧ Parsimony.Counter.value out = v ∧
    Parsimony.Common.Runs (model values)
      ⟨data i.val, Tape.mk' (O i.val (L.cons 0)) ((Z (v + 1) (Z 15 R)).cons 1)⟩
      ⟨data 0, Tape.mk' ((ListBlank.append out L).cons 0)
        (Z i.val (((Z (v + 2) R).cons 1).cons 0))⟩ := by
  exact Parsimony.IndexedExtractor.query_extract (model values) data exit 13359 values
    (row_more values) (row_last values) (row_one values) insert convert 13 insertionRight
    (indexed_insert_rows values) (indexed_convert_rows values) (by decide +kernel)
    rfl rfl (by omega) i.val i.val (by have := i.isLt; omega) (by
      simpa only [values, show (2 : Nat) ^ 13 = 8192 by decide +kernel]
        using words_bound raw i.val) L R

end ParsimonyComposed

#print axioms ParsimonyComposed.allWordsIndexed
#print axioms ParsimonyComposed.allWords
#print axioms ParsimonyComposed.words_bound
#print axioms ParsimonyComposed.counter_rows
#print axioms ParsimonyComposed.insert_rows
#print axioms ParsimonyComposed.convert_rows

def main : IO Unit := do
  let file ← IO.FS.Handle.mk ".lake/chess-parsimony-counter-20261024/AllWords.rows" .write
  for i in List.range 13539 do
    let state := ParsimonyComposed.stateOf (i + 6)
    for bit in ([0, 1] : List (Fin 2)) do
      match (ParsimonyComposed.model ParsimonyComposed.values).transition state bit with
      | none => file.putStrLn "halt"
      | some (write, direction, target) =>
        let d := if direction = .right then 1 else 0
        file.putStrLn s!"{write.val} {d} {target.val}"
  IO.println "PARSIMONY_ALL_WORDS_EXPORTED"
'''
    path = work / 'AllWords.lean'
    path.write_text(source)
    return dict(source=path, actual=rows[12:], ids=ids, states=13539, cells=27078,
                words=13360, candidate_sha256=TABLE_SHA)
