#!/usr/bin/env python3
"""Unverified remote-only finite source-operation reification pilot producer."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')


SOURCE = r'''open FieldCompiler

inductive TableOp (labels : Nat) where
  | move (dir : Dir) (next : Fin labels)
  | write (field : Fin 4) (value : Vector (Fin 5) 5) (next : Fin labels)
  | load (field : Fin 4) (value : Vector (Vector (Fin 5) 5) 5) (next : Fin labels)
  | pureLoad (value : Vector (Fin 5) 5) (next : Fin labels)
  | marker (yes no : Fin labels)
  | absent (field : Fin 4) (yes no : Fin labels)
  | branch (test : Vector Bool 5) (yes no : Fin labels)
  | jump (target : Vector (Fin labels) 5)
  | halt
  deriving DecidableEq

def toTableOp {n : Nat} : Op n → TableOp n
  | .move dir next => .move dir next
  | .write field value next => .write field (Vector.ofFn value) next
  | .load field value next =>
      .load field (Vector.ofFn fun old ↦ Vector.ofFn (value old)) next
  | .pureLoad value next => .pureLoad (Vector.ofFn value) next
  | .marker yes no => .marker yes no
  | .absent field yes no => .absent field yes no
  | .branch test yes no => .branch (Vector.ofFn test) yes no
  | .jump target => .jump (Vector.ofFn target)
  | .halt => .halt

def fromTableOp {n : Nat} : TableOp n → Op n
  | .move dir next => .move dir next
  | .write field value next => .write field (fun old ↦ value.get old) next
  | .load field value next => .load field (fun old read ↦ (value.get old).get read) next
  | .pureLoad value next => .pureLoad (fun old ↦ value.get old) next
  | .marker yes no => .marker yes no
  | .absent field yes no => .absent field yes no
  | .branch test yes no => .branch (fun old ↦ test.get old) yes no
  | .jump target => .jump (fun old ↦ target.get old)
  | .halt => .halt

theorem from_toTableOp {n : Nat} (op : Op n) : fromTableOp (toTableOp op) = op := by
  cases op <;> simp only [toTableOp, fromTableOp, Vector.get_ofFn]

theorem toTableOp_injective {n : Nat} : Function.Injective (toTableOp (n := n)) := by
  intro a b same
  have restored := congrArg fromTableOp same
  simpa only [from_toTableOp] using restored

theorem lower_from_toTableOp {n : Nat} (op : Op n) :
    lower (fromTableOp (toTableOp op)) = lower op :=
  congrArg lower (from_toTableOp op)

theorem source_from_toTableOp {n : Nat} (op : Op n) :
    FieldCompiler.source (fromTableOp (toTableOp op)) = FieldCompiler.source op :=
  congrArg FieldCompiler.source (from_toTableOp op)

theorem source_jump0 : toTableOp Snapshot.op0000 =
    .jump ⟨#[1, 1, 1, 1, 1], rfl⟩ := by decide +kernel

theorem source_jump1 : toTableOp Snapshot.op0001 =
    .jump ⟨#[289, 289, 289, 289, 289], rfl⟩ := by decide +kernel

theorem source_bad_jump_cell : toTableOp Snapshot.op0000 ≠
    .jump ⟨#[1, 1, 2, 1, 1], rfl⟩ := by decide +kernel

-- This noncommutative table pins outer=old store, inner=read symbol ordering.
def loadFixture : Op 7 := .load 0 (fun old read ↦ old + read + read) 6

def loadTableFixture : TableOp 7 := .load 0 ⟨#[
  ⟨#[0, 2, 4, 1, 3], rfl⟩,
  ⟨#[1, 3, 0, 2, 4], rfl⟩,
  ⟨#[2, 4, 1, 3, 0], rfl⟩,
  ⟨#[3, 0, 2, 4, 1], rfl⟩,
  ⟨#[4, 1, 3, 0, 2], rfl⟩], rfl⟩ 6

def badLoadTableFixture : TableOp 7 := .load 0 ⟨#[
  ⟨#[0, 2, 4, 1, 4], rfl⟩,
  ⟨#[1, 3, 0, 2, 4], rfl⟩,
  ⟨#[2, 4, 1, 3, 0], rfl⟩,
  ⟨#[3, 0, 2, 4, 1], rfl⟩,
  ⟨#[4, 1, 3, 0, 2], rfl⟩], rfl⟩ 6

theorem load_fixture_reifies : toTableOp loadFixture = loadTableFixture := by decide +kernel

theorem load_fixture_bad_cell : toTableOp loadFixture ≠ badLoadTableFixture := by decide +kernel
'''


def generate(driver, header, audit_and_end, module):
    roots = ['TableOp', 'toTableOp', 'fromTableOp', 'from_toTableOp',
             'toTableOp_injective', 'lower_from_toTableOp', 'source_from_toTableOp',
             'source_jump0', 'source_jump1', 'source_bad_jump_cell',
             'load_fixture_reifies', 'load_fixture_bad_cell']
    driver.emit('SourceTables.lean', header([module + '.ActualTools']) + SOURCE +
                audit_and_end(driver, 'SourceTables', roots,
                              'Finite source-operation table reconstruction checked'))
