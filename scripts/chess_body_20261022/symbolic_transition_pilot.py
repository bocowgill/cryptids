#!/usr/bin/env python3
"""Remote-only symbolic source-transition interface; no native proof authority."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')


SOURCE = r'''open ConjectureMachines.Optimisation
open Chess.Optimisation FieldCompiler
set_option backward.isDefEq.respectTransparency false

theorem symbolic_main_write
    (pc : Fin 106668) (value : Fin 5) (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p)
    (slot : Fin p.size) (rank : Fin (1 + FieldReturns.writeCount p))
    (nextValue : Fin 5) (bit written : Bool)
    (start finish : Fin 573802) (target : Fin 106668)
    (startAddress : mainIndex pc value = start)
    (targetAddress : slotIndex q p same slot = target)
    (finishAddress : bounceIndex q p same rank nextValue = finish)
    (auxiliary : LazyGraph.trAux FieldPacked.getter bit pc value =
      ((some target, nextValue), .write written))
    (found : FieldReturns.findTarget p slot = some rank) :
    FieldSelective.body.toMachine.transition start (Binary.encodeSymbol bit) =
      some (Binary.encodeSymbol written, Dir.right, finish) := by
  rewrite [← startAddress]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex pc value) (Binary.encodeSymbol bit) = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, Binary.decode_encode, post_live, auxiliary]
  dsimp only [Option.bind]
  rewrite [← targetAddress, findReturn_syntax, found]
  change some (Binary.encodeSymbol written, Dir.right,
    bounceIndex q p same rank nextValue) = _
  exact congrArg (fun next : Fin 573802 ↦
    some (Binary.encodeSymbol written, Dir.right, next)) finishAddress
'''


def generate(driver, header, audit_and_end, module):
    driver.emit('SymbolicTransitions.lean', header([module + '.ActualTools']) +
                SOURCE + audit_and_end(driver, 'SymbolicTransitions', ['symbolic_main_write'],
                                       'Symbolic actual main-write interface checked'))
