#!/usr/bin/env python3
"""Remote-only structural binary-row proof generation (untrusted proof producer)."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')


TOOLS = r'''open ConjectureMachines.Optimisation
open Chess.Optimisation FieldCompiler
set_option backward.isDefEq.respectTransparency false

def mainIndex (pc : Fin 106668) (value : Fin 5) : Fin 573802 :=
  SelectiveBinary.mainState (r := 40461)
    (CompactPost.encode FieldPacked.getter (some pc, value))

def haltedMain : Fin 573802 := SelectiveBinary.mainState (r := 40461)
  (CompactPost.encode FieldPacked.getter (none, 0))

def returnIndex (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p)
    (i : Fin (1 + FieldReturns.writeCount p)) (value : Fin 5) : Fin 40461 :=
  FieldSelectiveLayout.liveReturn q
    (i.cast (congrArg (fun p ↦ 1 + FieldReturns.writeCount p) same).symm) value

def bounceIndex (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p)
    (i : Fin (1 + FieldReturns.writeCount p)) (value : Fin 5) : Fin 573802 :=
  SelectiveBinary.bounceState (q := 533341) (returnIndex q p same i value)

theorem returnIndex_val (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p)
    (i : Fin (1 + FieldReturns.writeCount p)) (value : Fin 5) :
    (returnIndex q p same i value).val =
      1 + (FieldSelectiveLayout.offset q + i.val) * 5 + value.val := by
  simpa only [returnIndex, Fin.val_cast] using
    FieldSelectiveLayout.liveReturn_val q
      (i.cast (congrArg (fun p ↦ 1 + FieldReturns.writeCount p) same).symm) value

theorem entry_syntax (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p) :
    FieldPacked.getter.entry q = slotIndex q p same p.root := by
  cases same
  rfl

theorem findReturn_syntax (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p) (i : Fin p.size) (value : Fin 5) :
    FieldSelectiveLayout.findReturn
        (CompactPost.encode FieldPacked.getter (some (slotIndex q p same i), value)) =
      (FieldReturns.findTarget p i).map (fun j ↦ returnIndex q p same j value) := by
  cases same
  exact FieldSelectiveLayout.findReturn_live q i value

theorem returnAt_syntax (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p)
    (i : Fin (1 + FieldReturns.writeCount p)) (value : Fin 5) :
    FieldSelectiveLayout.returnAt (returnIndex q p same i value) =
      CompactPost.encode FieldPacked.getter
        (some (slotIndex q p same (FieldReturns.targetAt p i)), value) := by
  cases same
  exact FieldSelectiveLayout.returnAt_live q i value

theorem post_halted (bit : Bool) :
    FieldPacked.post (CompactPost.encode FieldPacked.getter (none, 0)) bit = none := by
  simp only [FieldPacked.post, CompactPost.machine, CompactPost.decode_encode,
    Option.map_none]

theorem haltedMain_address : haltedMain = 1 := by
  unfold haltedMain
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
'''


def generate_tools(driver, header, audit_and_end, module):
    roots = ['mainIndex', 'haltedMain', 'returnIndex', 'bounceIndex',
             'returnIndex_val', 'entry_syntax', 'findReturn_syntax',
             'returnAt_syntax', 'post_halted', 'haltedMain_address']
    driver.emit('ActualTools.lean', header([module + '.RowWitnesses']) + TOOLS +
                audit_and_end(driver, 'ActualTools', roots,
                              'Structural main and return row transport helpers checked'))
