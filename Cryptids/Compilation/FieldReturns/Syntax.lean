/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.FieldCompiler.Graph
public import Mathlib.Data.List.Nodup

/-! # Structural return slots for a field-syntax row

Every row pays one slot for its root and one for the child of each literal write.
The executable local list follows the syntax tree, without enumerating graph states.
Lookup and decoding are inverse because different tree occurrences have disjoint slots.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.FieldReturns
open Turing FieldCompiler BoolGraph

set_option backward.isDefEq.respectTransparency false

/-- Number of literal write constructors, including both sides of every branch. -/
def writeCount {n : Nat} : Syntax n → Nat
  | .move _ p | .load _ p => writeCount p
  | .write _ p => writeCount p + 1
  | .branch _ p q => writeCount p + writeCount q
  | .go _ | .halt => 0

/-- Local postorder slots that are immediate children of literal writes. -/
def writeTargets {n : Nat} : (p : Syntax n) → List (Fin p.size)
  | .move _ p | .load _ p => (writeTargets p).map Fin.castSucc
  | .write _ p => p.root.castSucc :: (writeTargets p).map Fin.castSucc
  | .branch _ p q =>
      (writeTargets p).map (fun j ↦ (j.castAdd q.size).castSucc) ++
        (writeTargets q).map (fun j ↦ (Fin.natAdd p.size j).castSucc)
  | .go _ | .halt => []

@[simp] theorem writeTargets_length {n : Nat} (p : Syntax n) :
    (writeTargets p).length = writeCount p := by
  induction p <;> simp_all [writeTargets, writeCount, Nat.add_comm]

/-- A write child is always strictly before the containing row root. -/
theorem writeTargets_below {n : Nat} (p : Syntax n) (i : Fin p.size)
    (member : i ∈ writeTargets p) : i.val < p.root.val := by
  cases p with
  | move d p | load d p =>
    simp only [writeTargets, List.mem_map] at member
    obtain ⟨j, _, rfl⟩ := member
    exact j.isLt
  | write t p =>
    simp only [writeTargets, List.mem_cons, List.mem_map] at member
    rcases member with rfl | ⟨j, _, rfl⟩
    · exact p.root.isLt
    · exact j.isLt
  | branch t p q =>
    simp only [writeTargets, List.mem_append, List.mem_map] at member
    rcases member with ⟨j, _, rfl⟩ | ⟨j, _, rfl⟩
    · exact j.isLt.trans_le (Nat.le_add_right _ _)
    · exact Nat.add_lt_add_left j.isLt p.size
  | go t => simp [writeTargets] at member
  | halt => simp [writeTargets] at member

theorem root_notMem_writeTargets {n : Nat} (p : Syntax n) :
    p.root ∉ writeTargets p := fun member ↦ Nat.lt_irrefl _ (writeTargets_below p _ member)

private theorem castSucc_injective (n : Nat) :
    Function.Injective (Fin.castSucc : Fin n → Fin (n + 1)) := by
  intro a b h
  exact Fin.ext (congrArg Fin.val h)

/-- Tree occurrence slots are distinct, even if their syntax subtrees are equal. -/
theorem writeTargets_nodup {n : Nat} (p : Syntax n) : (writeTargets p).Nodup := by
  induction p with
  | move d p ih | load d p ih =>
    exact List.Nodup.map (castSucc_injective _) ih
  | write t p ih =>
    apply List.nodup_cons.mpr
    constructor
    · intro member
      obtain ⟨j, member, same⟩ := List.mem_map.mp member
      have same' : j = p.root := castSucc_injective _ same
      exact root_notMem_writeTargets p (same' ▸ member)
    · exact List.Nodup.map (castSucc_injective _) ih
  | branch t p q ihp ihq =>
    apply List.Nodup.append
    · apply List.Nodup.map _ ihp
      intro a b h
      exact Fin.ext (congrArg Fin.val h)
    · apply List.Nodup.map _ ihq
      intro a b h
      apply Fin.ext
      have equal := congrArg Fin.val h
      change p.size + a.val = p.size + b.val at equal
      omega
    · apply List.disjoint_left.mpr
      intro x left right
      obtain ⟨i, _, hi⟩ := List.mem_map.mp left
      obtain ⟨j, _, hj⟩ := List.mem_map.mp right
      have equal := congrArg Fin.val (hi.trans hj.symm)
      change i.val = p.size + j.val at equal
      have bound := i.isLt
      omega
  | go t => exact List.nodup_nil
  | halt => exact List.nodup_nil

/-- Roots are retained for goto targets; internal slots are retained for writes. -/
def targets {n : Nat} (p : Syntax n) : List (Fin p.size) := p.root :: writeTargets p

@[simp] theorem targets_length {n : Nat} (p : Syntax n) :
    (targets p).length = 1 + writeCount p := by
  simp [targets, Nat.add_comm]

theorem targets_nodup {n : Nat} (p : Syntax n) : (targets p).Nodup :=
  List.nodup_cons.mpr ⟨root_notMem_writeTargets p, writeTargets_nodup p⟩

/-- Decode a paid local return slot to its exact syntax control. -/
def targetAt {n : Nat} (p : Syntax n) (i : Fin (1 + writeCount p)) : Fin p.size :=
  (targets p).get (i.cast (targets_length p).symm)

/-- Partial executable inverse. Missing slots have no assigned return control. -/
def findTarget {n : Nat} (p : Syntax n) (i : Fin p.size) :
    Option (Fin (1 + writeCount p)) :=
  if h : (targets p).idxOf i < 1 + writeCount p then
    some ⟨(targets p).idxOf i, h⟩
  else none

/-- Every retained target is found, and its entire local index is recovered exactly. -/
theorem targetAt_findTarget {n : Nat} (p : Syntax n) (i : Fin p.size)
    (member : i ∈ targets p) : (findTarget p i).map (targetAt p) = some i := by
  have bound : (targets p).idxOf i < 1 + writeCount p := by
    simpa only [targets_length] using List.idxOf_lt_length_iff.mpr member
  simp only [findTarget, dif_pos bound, Option.map_some, targetAt]
  congr 1
  exact List.idxOf_get _

/-- No paid return slot is duplicated or unreachable by its own inverse lookup. -/
theorem findTarget_targetAt {n : Nat} (p : Syntax n) (i : Fin (1 + writeCount p)) :
    findTarget p (targetAt p i) = some i := by
  have index : (targets p).idxOf (targetAt p i) = i.val :=
    List.get_idxOf (targets_nodup p) (i.cast (targets_length p).symm)
  simp only [findTarget, index, i.isLt, ↓reduceDIte]

theorem root_covered {n : Nat} (p : Syntax n) :
    (findTarget p p.root).map (targetAt p) = some p.root :=
  targetAt_findTarget p p.root (List.mem_cons_self ..)

private theorem mapNode_write {a b k labels : Nat} (f : Fin a → Fin b)
    (node : Node a k labels) (table : Table k Bool) (child : Fin b)
    (same : TemplateGraph.mapNode f node = .write table child) :
    ∃ old, node = .write table old ∧ f old = child := by
  cases node <;> cases same
  exact ⟨_, rfl, rfl⟩

/-- Every literal write anywhere in a row points into its structural target list. -/
theorem write_child_mem {n : Nat} (p : Syntax n) (i : Fin p.size)
    (table : Table 5 Bool) (child : Fin p.size)
    (same : p.nodeAt i = .write table child) : child ∈ writeTargets p := by
  induction p generalizing table with
  | move d p ih | load d p ih =>
    revert same
    refine Fin.lastCases ?_ (fun j ↦ ?_) i
    · intro same
      simp only [Syntax.nodeAt, Fin.lastCases_last] at same
      cases same
    · intro same
      simp only [Syntax.nodeAt, Fin.lastCases_castSucc] at same
      obtain ⟨old, same, rfl⟩ := mapNode_write _ _ _ _ same
      exact List.mem_map.mpr ⟨old, ih j _ _ same, rfl⟩
  | write t p ih =>
    revert same
    refine Fin.lastCases ?_ (fun j ↦ ?_) i
    · intro same
      simp only [Syntax.nodeAt, Fin.lastCases_last] at same
      cases same
      exact List.mem_cons_self ..
    · intro same
      simp only [Syntax.nodeAt, Fin.lastCases_castSucc] at same
      obtain ⟨old, same, rfl⟩ := mapNode_write _ _ _ _ same
      exact List.mem_cons_of_mem _ (List.mem_map.mpr ⟨old, ih j _ _ same, rfl⟩)
  | branch t p q ihp ihq =>
    revert same
    refine Fin.lastCases ?_ (fun j ↦ ?_) i
    · intro same
      simp only [Syntax.nodeAt, Fin.lastCases_last] at same
      cases same
    · intro same
      induction j using Fin.addCases with
      | left j =>
        simp only [Syntax.nodeAt, Fin.lastCases_castSucc, Fin.addCases_left] at same
        obtain ⟨old, same, rfl⟩ := mapNode_write _ _ _ _ same
        exact List.mem_append_left _ (List.mem_map.mpr ⟨old, ihp j _ _ same, rfl⟩)
      | right j =>
        simp only [Syntax.nodeAt, Fin.lastCases_castSucc, Fin.addCases_right] at same
        obtain ⟨old, same, rfl⟩ := mapNode_write _ _ _ _ same
        exact List.mem_append_right _ (List.mem_map.mpr ⟨old, ihq j _ _ same, rfl⟩)
  | go t => cases same
  | halt => cases same

/-- Universal write-child lookup equation, independent of source execution or reachability. -/
theorem write_covered {n : Nat} (p : Syntax n) (i : Fin p.size)
    (table : Table 5 Bool) (child : Fin p.size)
    (same : p.nodeAt i = .write table child) :
    (findTarget p child).map (targetAt p) = some child :=
  targetAt_findTarget p child (List.mem_cons_of_mem _ (write_child_mem p i table child same))

end ConjectureMachines.Compilation.FieldReturns
