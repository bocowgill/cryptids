/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Chess.Optimisation.FieldPacked
public import Cryptids.Compilation.FieldReturns.Syntax
public import Cryptids.Compilation.FieldReturns.Graph
public import Cryptids.Optimisation.SelectiveBinary

/-! # Exact return allocation for the complete frozen chess body

Each source row contributes its root and every literal write child. These local
slots are packed in the existing balanced source order, paired with all five stores,
and augmented by one shared halt return. Every actual Post write is covered by a
structural proof; no execution or reachability oracle chooses this allocation.
-/

@[expose] public section
namespace Chess.Optimisation.FieldSelectiveLayout
open Turing ConjectureMachines ConjectureMachines.Compilation
open ConjectureMachines.Optimisation FieldCompiler FieldPackedLayout

set_option backward.isDefEq.respectTransparency false
set_option maxRecDepth 16384
attribute [local irreducible] FieldPacked.layout

abbrev localSize (q : Fin 4042) : Nat :=
  1 + FieldReturns.writeCount (FieldPacked.syntaxRows.get q)

/-- The balanced source tree fixes every paid local return slot. -/
def packed : Block := Block.ofTree
  (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1)) Snapshot.entries

theorem packed_rows : packed.rows = 4042 :=
  (Block.ofTree_rows _ Snapshot.entries).trans Snapshot.entries_count

/-- Kernel reduction of the complete frozen syntax weights. -/
theorem packed_nodes : packed.nodes = 8092 := by rfl

def row (q : Fin 4042) : Fin packed.rows := q.cast packed_rows.symm

theorem packed_size (q : Fin 4042) : packed.size (row q) = localSize q := by
  rw [localSize, FieldAware.syntaxRows_get]
  exact Block.ofTree_size _ Snapshot.entries Snapshot.entries_wellFormed (.halt, .halt) (row q)

/-- Transport retains both numeric source labels and local return ranks. -/
def sourceSlots : (Σ q : Fin 4042, Fin (localSize q)) ≃
    (Σ q : Fin packed.rows, Fin (packed.size q)) :=
  Equiv.sigmaCongr (finCongr packed_rows.symm) (fun q ↦ finCongr (packed_size q).symm)

theorem sourceSlots_fst (q : Fin 4042) (i : Fin (localSize q)) :
    (sourceSlots ⟨q, i⟩).1 = row q := by
  apply Fin.ext
  simp only [sourceSlots, Equiv.sigmaCongr, Equiv.trans_apply,
    Equiv.sigmaCongrRight_apply, Equiv.sigmaCongrLeft_apply, finCongr_apply, Fin.val_cast, row]

theorem sourceSlots_snd_val (q : Fin 4042) (i : Fin (localSize q)) :
    (sourceSlots ⟨q, i⟩).2.val = i.val := by
  change ((finCongr (packed_size q).symm) i).val = i.val
  simp only [finCongr_apply, Fin.val_cast]

/-- Every local return is allocated exactly once in a contiguous global block. -/
def code : (Σ q : Fin 4042, Fin (localSize q)) ≃ Fin 8092 :=
  (sourceSlots.trans packed.code).trans (finCongr packed_nodes)

def offset (q : Fin 4042) : Nat := packed.offset (row q)

theorem code_val (q : Fin 4042) (i : Fin (localSize q)) :
    (code ⟨q, i⟩).val = offset q + i.val := by
  change ((finCongr packed_nodes) (packed.code (sourceSlots ⟨q, i⟩))).val = _
  simp only [finCongr_apply, Fin.val_cast]
  change (packed.code ⟨(sourceSlots ⟨q, i⟩).1, (sourceSlots ⟨q, i⟩).2⟩).val = _
  rw [packed.code_val]
  exact congrArg₂ (· + ·) (congrArg packed.offset (sourceSlots_fst q i))
    (sourceSlots_snd_val q i)

/-- The independent numeric allocation is the ordinary prefix sum of local sizes. -/
def weights : List Nat := Snapshot.entries.flatten.map
  (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))

def prefixSum (count : Nat) : Nat := (weights.take count).sum

theorem offset_eq_prefix (q : Fin 4042) : offset q = prefixSum q.val :=
  Block.ofTree_offset _ Snapshot.entries (row q)

theorem weights_length : weights.length = 4042 := by
  simpa only [weights, List.length_map, ← Balanced.RowTree.count_eq_length]
    using Snapshot.entries_count

theorem prefix_end : prefixSum 4042 = 8092 := by
  change (weights.take 4042).sum = _
  rw [← weights_length, List.take_length]
  exact (Block.ofTree_nodes _ Snapshot.entries).symm.trans packed_nodes

/-- The original packed graph index is retained unchanged. -/
def nodeIndex (q : Fin 4042) (i : Fin (FieldPacked.syntaxRows.get q).size) : Fin 106668 :=
  FieldPacked.layout.code ⟨q, i⟩

/-- Return zero is reserved for the single shared halt. -/
def haltReturn : Fin 40461 := Fin.castAdd (8092 * 5) (0 : Fin 1)

/-- Each live return has its local rank and its exact store value. -/
def liveReturn (q : Fin 4042) (i : Fin (localSize q)) (value : Fin 5) : Fin 40461 :=
  Fin.natAdd 1 (finProdFinEquiv (code ⟨q, i⟩, value))

theorem liveReturn_val (q : Fin 4042) (i : Fin (localSize q)) (value : Fin 5) :
    (liveReturn q i value).val = 1 + (offset q + i.val) * 5 + value.val := by
  change 1 + (value.val + 5 * (code ⟨q, i⟩).val) = _
  rw [code_val]
  omega

def returnAtSlot (slot : Σ q : Fin 4042, Fin (localSize q)) (value : Fin 5) :
    Fin (CompactPost.stateCount 106668 5) :=
  CompactPost.encode FieldPacked.getter
    (some (nodeIndex slot.1 (FieldReturns.targetAt _ slot.2)), value)

def returnAtPair (state : Fin 8092 × Fin 5) : Fin (CompactPost.stateCount 106668 5) :=
  returnAtSlot (code.symm state.1) state.2

/-- Decode each paid return into the original, permuted CompactPost control. -/
def returnAt (r : Fin 40461) : Fin (CompactPost.stateCount 106668 5) :=
  match (finSumFinEquiv.symm r : Fin 1 ⊕ Fin (8092 * 5)) with
  | .inl _ => CompactPost.encode FieldPacked.getter (none, 0)
  | .inr pair => returnAtPair (finProdFinEquiv.symm pair)

def findReturnSlot (slot : FieldPacking.Slot FieldPacked.syntaxRows) (value : Fin 5) :
    Option (Fin 40461) :=
  (FieldReturns.findTarget (FieldPacked.syntaxRows.get slot.1) slot.2).map
    (fun i ↦ liveReturn slot.1 i value)

/-- Partial lookup only examines the decoded row's structural local target list. -/
def findReturn (q : Fin (CompactPost.stateCount 106668 5)) : Option (Fin 40461) :=
  match CompactPost.decode FieldPacked.getter q with
  | none => some haltReturn
  | some (pc, value) => findReturnSlot (FieldPacked.layout.code.symm pc) value

attribute [local irreducible] code

theorem returnAt_halt (value : Fin 5) :
    returnAt haltReturn = CompactPost.encode FieldPacked.getter (none, value) := rfl

theorem returnAt_live (q : Fin 4042) (i : Fin (localSize q)) (value : Fin 5) :
    returnAt (liveReturn q i value) = CompactPost.encode FieldPacked.getter
      (some (nodeIndex q (FieldReturns.targetAt _ i)), value) := by
  simp only [returnAt, liveReturn, finSumFinEquiv_symm_apply_natAdd]
  rw [finProdFinEquiv.symm_apply_apply]
  change returnAtSlot (code.symm (code ⟨q, i⟩)) value = returnAtSlot ⟨q, i⟩ value
  exact congrArg (fun slot ↦ returnAtSlot slot value) (code.symm_apply_apply ⟨q, i⟩)

theorem findReturn_halt (value : Fin 5) :
    findReturn (CompactPost.encode FieldPacked.getter (none, value)) = some haltReturn := by
  simp only [findReturn, CompactPost.decode_encode, Option.map_none]

theorem findReturn_live (q : Fin 4042) (i : Fin (FieldPacked.syntaxRows.get q).size)
    (value : Fin 5) :
    findReturn (CompactPost.encode FieldPacked.getter (some (nodeIndex q i), value)) =
      (FieldReturns.findTarget (FieldPacked.syntaxRows.get q) i).map
        (fun r ↦ liveReturn q r value) := by
  simp only [findReturn, CompactPost.decode_encode, Option.map_some, nodeIndex]
  exact congrArg (fun slot ↦ findReturnSlot slot value)
    (FieldPacked.layout.code.symm_apply_apply ⟨q, i⟩)

/-- Local coverage transports through both certified finite allocations and the store pair. -/
theorem covered_live (q : Fin 4042) (i : Fin (FieldPacked.syntaxRows.get q).size)
    (value : Fin 5)
    (covered : (FieldReturns.findTarget (FieldPacked.syntaxRows.get q) i).map
      (FieldReturns.targetAt (FieldPacked.syntaxRows.get q)) = some i) :
    (findReturn (CompactPost.encode FieldPacked.getter (some (nodeIndex q i), value))).map
      returnAt = some (CompactPost.encode FieldPacked.getter (some (nodeIndex q i), value)) := by
  rw [findReturn_live]
  cases found : FieldReturns.findTarget (FieldPacked.syntaxRows.get q) i with
  | none => simp only [found, Option.map_none, reduceCtorEq] at covered
  | some r =>
    have target : FieldReturns.targetAt (FieldPacked.syntaxRows.get q) r = i := by
      simpa only [found, Option.map_some, Option.some.injEq] using covered
    simp only [Option.map_some, returnAt_live, target]

theorem covered_halt (value : Fin 5) :
    (findReturn (CompactPost.encode FieldPacked.getter (none, value))).map returnAt =
      some (CompactPost.encode FieldPacked.getter (none, value)) := by
  rw [findReturn_halt, Option.map_some, returnAt_halt value]

theorem covered_entry (label : Fin 4042) (value : Fin 5) :
    (findReturn (CompactPost.encode FieldPacked.getter
      (some (FieldPacked.getter.entry label), value))).map returnAt =
      some (CompactPost.encode FieldPacked.getter
        (some (FieldPacked.getter.entry label), value)) := by
  exact covered_live label (FieldPacked.syntaxRows.get label).root value
    (FieldReturns.root_covered _)

private theorem mapNode_write {a b k labels : Nat} (f : Fin a → Fin b)
    (node : BoolGraph.Node a k labels) (table : BoolGraph.Table k Bool) (child : Fin b)
    (same : TemplateGraph.mapNode f node = .write table child) :
    ∃ old, node = .write table old ∧ f old = child := by
  cases node <;> cases same
  exact ⟨_, rfl, rfl⟩

theorem covered_write_child (i : Fin 106668) (table : BoolGraph.Table 5 Bool)
    (child : Fin 106668) (same : FieldPacked.getter.node i = .write table child)
    (value : Fin 5) :
    (findReturn (CompactPost.encode FieldPacked.getter (some child, value))).map returnAt =
      some (CompactPost.encode FieldPacked.getter (some child, value)) := by
  rw [FieldPacked.getter, FieldPacking.graph_node] at same
  obtain ⟨⟨label, slot⟩, rfl⟩ := FieldPacked.layout.code.surjective i
  change FieldPacking.graphNode FieldPacked.syntaxRows FieldPacked.layout
    (FieldPacking.graphIndex FieldPacked.syntaxRows FieldPacked.layout label slot) = _ at same
  rw [FieldPacking.graphNode_index] at same
  obtain ⟨old, primitive, rfl⟩ := mapNode_write _ _ _ _ same
  exact covered_live label old value
    (FieldReturns.write_covered (FieldPacked.syntaxRows.get label) slot table old primitive)

/-- Every actual Post write has an exactly decoded return, on both bits and all stores. -/
theorem coverage : SelectiveBinary.WriteCoverage FieldPacked.post returnAt findReturn := by
  intro q bit destination written row
  exact FieldReturns.compact_write_covered FieldPacked.getter
    (fun target ↦ (findReturn target).map returnAt = some target)
    covered_write_child covered_entry covered_halt q bit destination written row

/-- The inverse is exact on every allocated return; duplicate returns are not hidden. -/
theorem findReturn_returnAt (r : Fin 40461) : findReturn (returnAt r) = some r := by
  revert r
  change ∀ r : Fin (1 + 8092 * 5), findReturn (returnAt r) = some r
  intro r
  refine Fin.addCases (fun h ↦ ?_) (fun pair ↦ ?_) r
  · have zero : h = 0 := Subsingleton.elim _ _
    subst h
    change findReturn (returnAt haltReturn) = some haltReturn
    rw [returnAt_halt (0 : Fin 5), findReturn_halt]
  · obtain ⟨⟨index, value⟩, rfl⟩ := finProdFinEquiv.surjective pair
    obtain ⟨⟨label, slot⟩, rfl⟩ := code.surjective index
    change findReturn (returnAt (liveReturn label slot value)) = some (liveReturn label slot value)
    rw [returnAt_live, findReturn_live, FieldReturns.findTarget_targetAt, Option.map_some]

theorem returnAt_injective : Function.Injective returnAt := by
  intro a b same
  have equal := congrArg findReturn same
  simpa only [findReturn_returnAt, Option.some.injEq] using equal

end Chess.Optimisation.FieldSelectiveLayout
