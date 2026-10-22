/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.FieldCompiler.Syntax

/-! # Complete normalized field operation interface -/

@[expose] public section
namespace ConjectureMachines.Compilation.FieldCompiler
open Turing FieldBinary

/-- Each operation is one normalized source step ending in a head-free goto or halt. -/
inductive Op (labels : Nat) where
  | move (dir : Dir) (next : Fin labels)
  | write (field : Fin 4) (value : Fin 5 → Fin 5) (next : Fin labels)
  | load (field : Fin 4) (value : Fin 5 → Fin 5 → Fin 5) (next : Fin labels)
  | pureLoad (value : Fin 5 → Fin 5) (next : Fin labels)
  | marker (yes no : Fin labels)
  | absent (field : Fin 4) (yes no : Fin labels)
  | branch (test : Fin 5 → Bool) (yes no : Fin labels)
  | jump (target : Fin 5 → Fin labels)
  | halt

/-- Concrete meaning over the exact frozen simultaneous-stack alphabet and store. -/
def source {n : Nat} : Op n → TM1.Stmt Symbol (Fin n) Store
  | .move d next => .move d (.goto fun _ _ ↦ next)
  | .write field value next => .write (fun a v ↦
      (a.1, Function.update a.2 (FieldReturn.stackAt field)
        (FieldReturn.codeSymbol (value (FieldReturn.symbolCode v))))) (.goto fun _ _ ↦ next)
  | .load field value next => .load (fun a v ↦ FieldReturn.codeSymbol
      (value (FieldReturn.symbolCode v) (FieldReturn.symbolCode (a.2 (FieldReturn.stackAt field)))))
      (.goto fun _ _ ↦ next)
  | .pureLoad value next => .load (fun _ v ↦ FieldReturn.codeSymbol
      (value (FieldReturn.symbolCode v))) (.goto fun _ _ ↦ next)
  | .marker yes no => .branch (fun a _ ↦ a.1)
      (.goto fun _ _ ↦ yes) (.goto fun _ _ ↦ no)
  | .absent field yes no => .branch (fun a _ ↦ (a.2 (FieldReturn.stackAt field)).isNone)
      (.goto fun _ _ ↦ yes) (.goto fun _ _ ↦ no)
  | .branch test yes no => .branch (fun _ v ↦ test (FieldReturn.symbolCode v))
      (.goto fun _ _ ↦ yes) (.goto fun _ _ ↦ no)
  | .jump target => .goto fun _ v ↦ target (FieldReturn.symbolCode v)
  | .halt => .halt

/-- Lower all operations using the accepted field routines and finite dispatch. -/
def lower {n : Nat} : Op n → Syntax n
  | .move dir next => emit (moveCell dir) (fun _ ↦ go (fun _ ↦ next))
  | .write field value next => select5 fun v ↦
      emit (writeAt (fieldOffset field) (encodeWord (value v))) (fun _ ↦ go (fun _ ↦ next))
  | .load field value next => emit (readAt (fieldOffset field)) (fun word ↦
      .load (table fun _ v ↦ value v (decodeWord word)) (go (fun _ ↦ next)))
  | .pureLoad value next => .load (table fun _ v ↦ value v) (go (fun _ ↦ next))
  | .marker yes no => emit FieldContinuation.markerRoutine
      (fun marker ↦ go (fun _ ↦ if marker then yes else no))
  | .absent field yes no => emit (readAt (fieldOffset field))
      (fun word ↦ go (fun _ ↦ if (decodeWord word).val = 0 then yes else no))
  | .branch test yes no => .branch (table fun _ v ↦ test v)
      (go (fun _ ↦ yes)) (go (fun _ ↦ no))
  | .jump target => go target
  | .halt => .halt

end ConjectureMachines.Compilation.FieldCompiler
