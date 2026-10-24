module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.ActualTools

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open ConjectureMachines.Optimisation
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

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Symbolic actual main-write interface checked"
