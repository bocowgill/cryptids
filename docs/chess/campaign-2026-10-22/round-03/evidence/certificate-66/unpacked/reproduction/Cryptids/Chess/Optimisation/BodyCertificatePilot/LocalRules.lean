module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.NumericLocal

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open ConjectureMachines.Optimisation
open Chess.Optimisation FieldCompiler PrefixScanPilot NumericLocalPilot
namespace LocalRulePilot
set_option backward.isDefEq.respectTransparency false
attribute [local irreducible] FieldPacked.getter FieldPacked.layout
attribute [local irreducible] FieldAware.syntaxRows FieldSelectiveLayout.code

noncomputable def stepWord (q : Fin 4042) (p : Syntax 4042)
    (node : BoolGraph.Node p.size 5 4042) (bit : Bool) (value : Fin 5) : Nat :=
  let base := nodePrefixes.lookup q.val 0
  match node with
  | .move dir child => commandWord bit dir (mainAddress (base + child.val) value)
  | .write table child =>
      match FieldReturns.findTarget p child with
      | none => 0
      | some rank => commandWord (table.read bit value) .right
          (returnAddress (returnPrefixes.lookup q.val 0) rank.val value)
  | .load table child => rowWord (mainAddress (base + child.val) (table.read bit value)) bit
  | .branch table left right =>
      if table.read bit value then rowWord (mainAddress (base + left.val) value) bit
      else rowWord (mainAddress (base + right.val) value) bit
  | .goto table => commandWord bit .right
      (returnAddress (returnPrefixes.lookup (table.read bit value).val 0) 0 value)
  | .halt => commandWord bit .right 533341

def Coherent (q : Fin 4042) (p : Syntax 4042) : Prop :=
  ∀ (slot : Fin p.size) (bit : Bool) (value : Fin 5),
    rowWord (mainAddress (nodePrefixes.lookup q.val 0 + slot.val) value) bit =
      stepWord q p (p.fastNodeAt slot) bit value

noncomputable instance coherentDecidable (q : Fin 4042) (p : Syntax 4042) :
    Decidable (Coherent q p) :=
  inferInstanceAs (Decidable (∀ (slot : Fin p.size) (bit : Bool) (value : Fin 5),
    rowWord (mainAddress (nodePrefixes.lookup q.val 0 + slot.val) value) bit =
      stepWord q p (p.fastNodeAt slot) bit value))

theorem step_word_sound (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p)
    (node : BoolGraph.Node p.size 5 4042) (bit : Bool) (value : Fin 5) :
    packedEncode (ObservedCachePilot.observedStep FieldPacked.getter.entry
      (BinaryObservationPilot.observe FieldPacked.getter FieldSelectiveLayout.findReturn classMap)
      (BinaryObservationPilot.expected (returns := 40461) FieldPacked.getter classMap quotient) bit
      (TemplateGraph.mapNode (slotIndex q p same) node) value) =
        stepWord q p node bit value := by
  cases node with
  | move dir child =>
    change packedEncode (BinaryObservationPilot.observe FieldPacked.getter
      FieldSelectiveLayout.findReturn classMap bit
        ((some (slotIndex q p same child), value), .move dir)) = _
    rewrite [move_result_word, slotIndex_val, node_offset_lookup]
    rfl
  | write table child =>
    exact write_result_word q p same child value bit (table.read bit value)
  | load table child =>
    exact expected_slot_word q p same child bit (table.read bit value)
  | branch table left right =>
    change packedEncode (if table.read bit value then
      BinaryObservationPilot.expected (returns := 40461) FieldPacked.getter classMap quotient bit
        (slotIndex q p same left) value
      else BinaryObservationPilot.expected (returns := 40461)
        FieldPacked.getter classMap quotient bit
        (slotIndex q p same right) value) = _
    cases table.read bit value
    · exact expected_slot_word q p same right bit value
    · exact expected_slot_word q p same left bit value
  | goto table => exact entry_result_word (table.read bit value) value bit
  | halt => exact halt_result_word value bit

theorem coherent_sound (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p) (checked : Coherent q p)
    (slot : Fin p.size) (bit : Bool) (value : Fin 5) :
    BinaryObservationPilot.expected (returns := 40461) FieldPacked.getter classMap quotient bit
      (slotIndex q p same slot) value =
        ObservedCachePilot.observedStep FieldPacked.getter.entry
          (BinaryObservationPilot.observe FieldPacked.getter
            FieldSelectiveLayout.findReturn classMap)
          (BinaryObservationPilot.expected (returns := 40461)
            FieldPacked.getter classMap quotient) bit
          (TemplateGraph.mapNode (slotIndex q p same) (p.fastNodeAt slot)) value := by
  apply packed_injective
  exact (expected_slot_word q p same slot bit value).trans
    ((checked slot bit value).trans
      (step_word_sound q p same (p.fastNodeAt slot) bit value).symm)

def ReturnCoherent (q : Fin 4042) (p : Syntax 4042) : Prop :=
  ∀ (rank : Fin (1 + FieldReturns.writeCount p)) (bit : Bool) (value : Fin 5),
    rowWord (returnAddress (returnPrefixes.lookup q.val 0) rank.val value) bit =
      commandWord bit .left (mainAddress
        (nodePrefixes.lookup q.val 0 + (FieldReturns.targetAt p rank).val) value)

noncomputable instance returnCoherentDecidable (q : Fin 4042) (p : Syntax 4042) :
    Decidable (ReturnCoherent q p) :=
  inferInstanceAs (Decidable
    (∀ (rank : Fin (1 + FieldReturns.writeCount p)) (bit : Bool) (value : Fin 5),
      rowWord (returnAddress (returnPrefixes.lookup q.val 0) rank.val value) bit =
        commandWord bit .left (mainAddress
          (nodePrefixes.lookup q.val 0 + (FieldReturns.targetAt p rank).val) value)))

theorem return_coherent_sound (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p) (checked : ReturnCoherent q p)
    (rank : Fin (1 + FieldReturns.writeCount p)) (bit : Bool) (value : Fin 5) :
    quotient.transition (classMap (bounceIndex q p same rank value)) (Binary.encodeSymbol bit) =
      some (Binary.encodeSymbol bit, .left,
        classMap (mainIndex (slotIndex q p same (FieldReturns.targetAt p rank)) value)) := by
  apply packed_injective
  rewrite [expected_word, bounce_address, command_word, slot_main_address]
  exact checked rank bit value

theorem local_cache_sound (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p) (checked : Coherent q p)
    (bit : Bool) (slot : Fin p.size) (value : Fin 5) :
    BinaryObservationPilot.expected (returns := 40461) FieldPacked.getter classMap quotient bit
      (slotIndex q p same slot) value =
        BinaryObservationPilot.observe FieldPacked.getter FieldSelectiveLayout.findReturn
          classMap bit
            (LazyGraph.trAux FieldPacked.getter bit (slotIndex q p same slot) value) := by
  rewrite [coherent_sound q p same checked slot bit value]
  have node_eq := getter_syntax q p same slot
  cases row : p.fastNodeAt slot with
  | move dir child =>
    change BinaryObservationPilot.observe FieldPacked.getter
      FieldSelectiveLayout.findReturn classMap bit
        ((some (slotIndex q p same child), value), .move dir) = _
    rewrite [LazyGraph.trAux_move FieldPacked.getter bit (slotIndex q p same slot)
      (slotIndex q p same child) value dir
        (by simpa only [row, TemplateGraph.mapNode] using node_eq)]
    rfl
  | write table child =>
    change BinaryObservationPilot.observe FieldPacked.getter
      FieldSelectiveLayout.findReturn classMap bit
        ((some (slotIndex q p same child), value), .write (table.read bit value)) = _
    rewrite [LazyGraph.trAux_write FieldPacked.getter bit (slotIndex q p same slot)
      (slotIndex q p same child) value table
        (by simpa only [row, TemplateGraph.mapNode] using node_eq)]
    rfl
  | load table child =>
    change BinaryObservationPilot.expected (returns := 40461)
      FieldPacked.getter classMap quotient bit
      (slotIndex q p same child) (table.read bit value) = _
    rewrite [LazyGraph.trAux_load FieldPacked.getter bit (slotIndex q p same slot)
      (slotIndex q p same child) value table
        (by simpa only [row, TemplateGraph.mapNode] using node_eq)]
    exact local_cache_sound q p same checked bit child (table.read bit value)
  | branch table left right =>
    change (if table.read bit value then
      BinaryObservationPilot.expected (returns := 40461) FieldPacked.getter classMap quotient bit
        (slotIndex q p same left) value
      else BinaryObservationPilot.expected (returns := 40461)
        FieldPacked.getter classMap quotient bit
        (slotIndex q p same right) value) = _
    rewrite [LazyGraph.trAux_branch FieldPacked.getter bit (slotIndex q p same slot)
      (slotIndex q p same left) (slotIndex q p same right) value table
        (by simpa only [row, TemplateGraph.mapNode] using node_eq)]
    cases table.read bit value <;> simp only [Bool.false_eq_true, ↓reduceIte]
    · exact local_cache_sound q p same checked bit right value
    · exact local_cache_sound q p same checked bit left value
  | goto table =>
    change BinaryObservationPilot.observe FieldPacked.getter
      FieldSelectiveLayout.findReturn classMap bit
        ((some (FieldPacked.getter.entry (table.read bit value)), value), .write bit) = _
    rewrite [LazyGraph.trAux_goto FieldPacked.getter bit (slotIndex q p same slot)
      value table (by simpa only [row, TemplateGraph.mapNode] using node_eq)]
    rfl
  | halt =>
    change BinaryObservationPilot.observe FieldPacked.getter
      FieldSelectiveLayout.findReturn classMap bit ((none, value), .write bit) = _
    rewrite [LazyGraph.trAux_halt FieldPacked.getter bit (slotIndex q p same slot)
      value (by simpa only [row, TemplateGraph.mapNode] using node_eq)]
    rfl
termination_by slot.val
decreasing_by
  all_goals
    apply p.nodeAt_below slot _
    rewrite [← Syntax.fastNodeAt_eq, row]
    simp [BoolGraph.Node.children]

theorem main_rows_local (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p) (checked : Coherent q p)
    (slot : Fin p.size) (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex q p same slot) value) (Binary.encodeSymbol bit) := by
  change ((SelectiveBinary.compile (CompactPost.machine FieldPacked.getter)
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
      (SelectiveBinary.mainState
        (CompactPost.encode FieldPacked.getter (some (slotIndex q p same slot), value)))
      (Binary.encodeSymbol bit)).map (fun (b, d, next) ↦ (b, d, classMap next)) = _
  exact (BinaryObservationPilot.main_observed FieldPacked.getter FieldSelectiveLayout.returnAt
    FieldSelectiveLayout.findReturn classMap bit (slotIndex q p same slot) value).trans
      (local_cache_sound q p same checked bit slot value).symm

theorem return_rows_local (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p) (checked : ReturnCoherent q p)
    (rank : Fin (1 + FieldReturns.writeCount p)) (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex q p same rank value) (Binary.encodeSymbol bit) := by
  change ((SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
      (SelectiveBinary.bounceState (returnIndex q p same rank value))
      (Binary.encodeSymbol bit)).map (fun (b, d, next) ↦ (b, d, classMap next)) = _
  rewrite [SelectiveBinary.compile_bounce, Option.map_some, returnAt_syntax]
  exact (return_coherent_sound q p same checked rank bit value).symm

end LocalRulePilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Finite numeric local checks imply exact main and paid-return equations"
