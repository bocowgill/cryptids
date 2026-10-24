module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.BodyRelation
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.ActualTools
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.PrefixScan
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.BinaryObservation

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open ConjectureMachines.Optimisation
open Chess.Optimisation FieldCompiler PrefixScanPilot
namespace NumericLocalPilot
set_option backward.isDefEq.respectTransparency false
attribute [local irreducible] FieldPacked.getter FieldPacked.layout
attribute [local irreducible] FieldAware.syntaxRows FieldSelectiveLayout.code

def mainAddress (node : Nat) (value : Fin 5) : Nat :=
  let raw := 1 + 5 * node + value.val
  if raw = 1 then 0 else raw

def returnAddress (base rank : Nat) (value : Fin 5) : Nat :=
  533341 + (1 + (base + rank) * 5 + value.val)

noncomputable def rowWord (address : Nat) (bit : Bool) : Nat :=
  let row := quotientTree.lookup (mapTree.lookup address 0) (0, 0)
  if bit then row.2 else row.1

noncomputable def commandWord (written : Bool) (dir : Dir) (address : Nat) : Nat :=
  (4 * mapTree.lookup address 0 + 2 * packedDirCode dir + (if written then 1 else 0)) + 1

theorem packed_injective : Function.Injective (packedEncode (q := 114487)) := by
  intro first second same
  have restored := congrArg (packedDecode 114487) same
  simpa only [packed_decode_encode] using restored

theorem encoded_main_val (pc : Fin 106668) (value : Fin 5) :
    (CompactPost.encode FieldPacked.getter (some pc, value)).val =
      mainAddress pc.val value := by
  have rawval : (CompactPost.rawEncode (some pc, value)).val =
      1 + 5 * pc.val + value.val := by
    change 1 + (value.val + 5 * pc.val) = _
    omega
  have nonzero : CompactPost.rawEncode (some pc, value) ≠ (0 : Fin 533341) := by
    intro same
    have numeric := congrArg Fin.val same
    change (CompactPost.rawEncode (some pc, value)).val = 0 at numeric
    rewrite [rawval] at numeric
    omega
  rewrite [CompactPost.encode, permutation_numeric, Equiv.swap_apply_def, if_neg nonzero]
  by_cases same : CompactPost.rawEncode (some pc, value) = (1 : Fin 533341)
  · rewrite [if_pos same]
    have numeric := congrArg Fin.val same
    change (CompactPost.rawEncode (some pc, value)).val = 1 at numeric
    rewrite [rawval] at numeric
    unfold mainAddress
    rewrite [if_pos numeric]
    rfl
  · rewrite [if_neg same]
    have numeric : 1 + 5 * pc.val + value.val ≠ 1 := by
      intro equal
      apply same
      apply Fin.ext
      exact rawval.trans equal
    unfold mainAddress
    rewrite [if_neg numeric]
    exact rawval

theorem mainIndex_val (pc : Fin 106668) (value : Fin 5) :
    (mainIndex pc value).val = mainAddress pc.val value := encoded_main_val pc value

theorem slot_main_address (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p) (slot : Fin p.size) (value : Fin 5) :
    (mainIndex (slotIndex q p same slot) value).val =
      mainAddress (nodePrefixes.lookup q.val 0 + slot.val) value := by
  rewrite [mainIndex_val, slotIndex_val, node_offset_lookup]
  rfl

theorem bounce_address (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p)
    (rank : Fin (1 + FieldReturns.writeCount p)) (value : Fin 5) :
    (bounceIndex q p same rank value).val =
      returnAddress (returnPrefixes.lookup q.val 0) rank.val value := by
  rewrite [bounceIndex_val, return_offset_lookup]
  rfl

theorem expected_word (state : Fin 573802) (bit : Bool) :
    packedEncode (quotient.transition (classMap state) (Binary.encodeSymbol bit)) =
      rowWord state.val bit := by
  rewrite [quotient_fidelity]
  unfold packedCodeAt rowWord
  rewrite [classMap_val]
  cases bit <;> rfl

theorem command_word (written : Bool) (dir : Dir) (state : Fin 573802) :
    packedEncode (some (Binary.encodeSymbol written, dir, classMap state)) =
      commandWord written dir state.val := by
  unfold packedEncode commandWord
  rewrite [classMap_val]
  cases written <;> rfl

theorem expected_slot_word (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p) (slot : Fin p.size)
    (bit : Bool) (value : Fin 5) :
    packedEncode (BinaryObservationPilot.expected FieldPacked.getter classMap quotient bit
      (slotIndex q p same slot) value) =
      rowWord (mainAddress (nodePrefixes.lookup q.val 0 + slot.val) value) bit := by
  change packedEncode (quotient.transition
    (classMap (mainIndex (slotIndex q p same slot) value)) (Binary.encodeSymbol bit)) = _
  rewrite [expected_word, slot_main_address]
  rfl

theorem move_result_word (pc : Fin 106668) (value : Fin 5) (bit : Bool) (dir : Dir) :
    packedEncode (BinaryObservationPilot.observe FieldPacked.getter
      FieldSelectiveLayout.findReturn classMap bit ((some pc, value), .move dir)) =
        commandWord bit dir (mainAddress pc.val value) := by
  change packedEncode (some (Binary.encodeSymbol bit, dir, classMap (mainIndex pc value))) = _
  rewrite [command_word, mainIndex_val]
  rfl

theorem write_result_word (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p) (slot : Fin p.size)
    (value : Fin 5) (bit written : Bool) :
    packedEncode (BinaryObservationPilot.observe FieldPacked.getter
      FieldSelectiveLayout.findReturn classMap bit
        ((some (slotIndex q p same slot), value), .write written)) =
      match FieldReturns.findTarget p slot with
      | none => 0
      | some rank => commandWord written .right
          (returnAddress (returnPrefixes.lookup q.val 0) rank.val value) := by
  change packedEncode ((FieldSelectiveLayout.findReturn
    (CompactPost.encode FieldPacked.getter (some (slotIndex q p same slot), value))).map
      (fun r ↦ (Binary.encodeSymbol written, Dir.right,
        classMap (SelectiveBinary.bounceState r)))) = _
  rewrite [findReturn_syntax]
  cases found : FieldReturns.findTarget p slot with
  | none => rfl
  | some rank =>
    change packedEncode (some (Binary.encodeSymbol written, Dir.right,
      classMap (bounceIndex q p same rank value))) = _
    rewrite [command_word, bounce_address]
    rfl

theorem halt_result_word (value : Fin 5) (bit : Bool) :
    packedEncode (BinaryObservationPilot.observe FieldPacked.getter
      FieldSelectiveLayout.findReturn classMap bit ((none, value), .write bit)) =
        commandWord bit .right 533341 := by
  change packedEncode ((FieldSelectiveLayout.findReturn
    (CompactPost.encode FieldPacked.getter (none, value))).map
      (fun r ↦ (Binary.encodeSymbol bit, Dir.right,
        classMap (SelectiveBinary.bounceState r)))) = _
  rewrite [FieldSelectiveLayout.findReturn_halt, Option.map_some, command_word]
  rfl

theorem root_target_rank (p : Syntax 4042) : FieldReturns.findTarget p p.root = some 0 := by
  rewrite [← FieldReturns.targetAt_zero p, FieldReturns.findTarget_targetAt]
  rfl

theorem entry_result_word (label : Fin 4042) (value : Fin 5) (bit : Bool) :
    packedEncode (BinaryObservationPilot.observe FieldPacked.getter
      FieldSelectiveLayout.findReturn classMap bit
        ((some (FieldPacked.getter.entry label), value), .write bit)) =
      commandWord bit .right (returnAddress (returnPrefixes.lookup label.val 0) 0 value) := by
  rewrite [entry_syntax label (FieldPacked.syntaxRows.get label) rfl]
  have result := write_result_word label (FieldPacked.syntaxRows.get label) rfl
    (FieldPacked.syntaxRows.get label).root value bit bit
  simpa only [root_target_rank] using result

end NumericLocalPilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Numeric local projections preserve actual source observations"
