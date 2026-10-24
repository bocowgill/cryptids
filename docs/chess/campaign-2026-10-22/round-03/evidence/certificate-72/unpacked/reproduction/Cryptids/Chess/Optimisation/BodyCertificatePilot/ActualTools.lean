module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.RowWitnesses

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open ConjectureMachines.Optimisation
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

theorem bounceIndex_val (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p)
    (i : Fin (1 + FieldReturns.writeCount p)) (value : Fin 5) :
    (bounceIndex q p same i value).val =
      533341 + (1 + (FieldSelectiveLayout.offset q + i.val) * 5 + value.val) := by
  unfold bounceIndex
  rewrite [SelectiveBinary.bounceState_val, returnIndex_val]
  rfl

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

theorem decode_bit_0 : Binary.decodeSymbol 0 = false := rfl

theorem decode_bit_1 : Binary.decodeSymbol 1 = true := rfl

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Structural main and return row transport helpers checked"
