#!/usr/bin/env python3
"""Remote-only raw-label decoder pilot; exact fallible Fin conversion, unverified."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')


SOURCE = r'''open FieldCompiler
namespace RawLabelPilot

inductive RawOp where
  | move (dir : Dir) (next : Nat)
  | write (field : Fin 4) (value : Vector (Fin 5) 5) (next : Nat)
  | load (field : Fin 4) (value : Vector (Vector (Fin 5) 5) 5) (next : Nat)
  | pureLoad (value : Vector (Fin 5) 5) (next : Nat)
  | marker (yes no : Nat)
  | absent (field : Fin 4) (yes no : Nat)
  | branch (test : Vector Bool 5) (yes no : Nat)
  | jump (target : Vector Nat 5)
  | halt
  deriving DecidableEq

def erase {n : Nat} : TableOp n → RawOp
  | .move dir next => .move dir next.val
  | .write field value next => .write field value next.val
  | .load field value next => .load field value next.val
  | .pureLoad value next => .pureLoad value next.val
  | .marker yes no => .marker yes.val no.val
  | .absent field yes no => .absent field yes.val no.val
  | .branch test yes no => .branch test yes.val no.val
  | .jump target => .jump (Vector.ofFn fun i ↦ (target.get i).val)
  | .halt => .halt

def narrow (n value : Nat) : Option (Fin n) :=
  if bound : value < n then some ⟨value, bound⟩ else none

theorem narrow_val {n : Nat} (value : Fin n) : narrow n value.val = some value := by
  unfold narrow
  rewrite [dite_eq_left value.isLt]
  rfl

theorem narrow_preserves_value {n value : Nat} (result : Fin n)
    (found : narrow n value = some result) : result.val = value := by
  unfold narrow at found
  split at found
  · cases found
    rfl
  · cases found

theorem vector5_eta {α : Type} (values : Vector α 5) :
    (⟨#[values.get 0, values.get 1, values.get 2, values.get 3, values.get 4], rfl⟩ :
      Vector α 5) = values := by
  apply Vector.ext
  intro i bound
  interval_cases i <;> rfl

def narrow5 (n : Nat) (values : Vector Nat 5) : Option (Vector (Fin n) 5) := do
  let a ← narrow n (values.get 0)
  let b ← narrow n (values.get 1)
  let c ← narrow n (values.get 2)
  let d ← narrow n (values.get 3)
  let e ← narrow n (values.get 4)
  return ⟨#[a, b, c, d, e], rfl⟩

theorem narrow5_erase {n : Nat} (values : Vector (Fin n) 5) :
    narrow5 n (Vector.ofFn fun i ↦ (values.get i).val) = some values := by
  simp only [narrow5, table_vector_get_ofFn, narrow_val]
  exact congrArg some (vector5_eta values)

def decode (n : Nat) : RawOp → Option (TableOp n)
  | .move dir next => do return .move dir (← narrow n next)
  | .write field value next => do return .write field value (← narrow n next)
  | .load field value next => do return .load field value (← narrow n next)
  | .pureLoad value next => do return .pureLoad value (← narrow n next)
  | .marker yes no => do return .marker (← narrow n yes) (← narrow n no)
  | .absent field yes no => do return .absent field (← narrow n yes) (← narrow n no)
  | .branch test yes no => do return .branch test (← narrow n yes) (← narrow n no)
  | .jump target => do return .jump (← narrow5 n target)
  | .halt => some .halt

theorem decode_erase {n : Nat} (op : TableOp n) : decode n (erase op) = some op := by
  cases op <;> simp only [decode, erase, narrow_val, narrow5_erase] <;> rfl

theorem erase_injective {n : Nat} : Function.Injective (erase (n := n)) := by
  intro first second same
  have restored := congrArg (decode n) same
  simpa only [decode_erase, Option.some.injEq] using restored

def restore (n : Nat) (raw : RawOp) : Option (Op n) := (decode n raw).map fromTableOp

theorem restore_original {n : Nat} (op : Op n) :
    restore n (erase (toTableOp op)) = some op := by
  simp only [restore, decode_erase, Option.map_some, from_toTableOp]

theorem restore_source_list {n : Nat} (ops : List (Op n)) :
    (ops.map (fun op ↦ erase (toTableOp op))).map (restore n) = ops.map some := by
  induction ops with
  | nil => rfl
  | cons op ops ih => simp only [List.map_cons, restore_original, ih]

theorem restore_source {n : Nat} (op : Op n) :
    (restore n (erase (toTableOp op))).map FieldCompiler.source =
      some (FieldCompiler.source op) := by
  rewrite [restore_original]
  rfl

def labelValues : RawOp → List Nat
  | .move _ next | .write _ _ next | .load _ _ next | .pureLoad _ next => [next]
  | .marker yes no | .absent _ yes no | .branch _ yes no => [yes, no]
  | .jump target => target.toList
  | .halt => []

def labelsBounded (n : Nat) (raw : RawOp) : Bool :=
  (labelValues raw).all fun value ↦ decide (value < n)

theorem labels_bound_sound (n : Nat) (raw : RawOp) (checked : labelsBounded n raw = true) :
    ∀ value ∈ labelValues raw, value < n := by
  intro value member
  change (labelValues raw).all (fun value ↦ decide (value < n)) = true at checked
  exact of_decide_eq_true (List.all_eq_true.mp checked value member)

theorem source_jump0 : erase (toTableOp Snapshot.op0000) =
    .jump ⟨#[1, 1, 1, 1, 1], rfl⟩ := by decide +kernel

theorem source_jump1 : erase (toTableOp Snapshot.op0001) =
    .jump ⟨#[289, 289, 289, 289, 289], rfl⟩ := by decide +kernel

theorem wrong_source_jump : erase (toTableOp Snapshot.op0000) ≠
    .jump ⟨#[1, 1, 2, 1, 1], rfl⟩ := by decide +kernel

theorem bad_move_label : decode 4042 (.move .left 4042) = none := by decide +kernel

theorem bad_jump_label : decode 4042 (.jump ⟨#[1, 1, 4042, 1, 1], rfl⟩) = none := by
  decide +kernel

theorem bad_large_label : decode 4042 (.move .right 4294967295) = none := by decide +kernel

end RawLabelPilot
'''


def generate(driver, header, audit_and_end, module):
    names = ['RawOp', 'erase', 'narrow', 'narrow_val', 'narrow_preserves_value',
             'vector5_eta', 'narrow5', 'narrow5_erase', 'decode', 'decode_erase',
             'erase_injective', 'restore', 'restore_original', 'restore_source_list',
             'restore_source',
             'labelValues', 'labelsBounded', 'labels_bound_sound',
             'source_jump0', 'source_jump1', 'wrong_source_jump', 'bad_move_label',
             'bad_jump_label', 'bad_large_label']
    driver.emit('RawLabels.lean', header([module + '.SourceTables',
                                        'Mathlib.Tactic.IntervalCases']) + SOURCE +
                audit_and_end(driver, 'RawLabels', ['RawLabelPilot.' + name for name in names],
                              'Raw labels decode exactly and reject out-of-range targets'))
