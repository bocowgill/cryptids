/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.LazyGraph
public import Cryptids.Compilation.FieldContinuation.Certificate

/-! # Finite-table syntax shared by the complete field-aware compiler -/

@[expose] public section
namespace ConjectureMachines.Compilation.FieldCompiler
open Turing FieldBinary

abbrev Store := RuntimeModel.Store
abbrev Symbol := SharedModel.Symbol

def toBool (bit : Bit) : Bool := bit == 1

def fromBool (bit : Bool) : Bit := if bit then 1 else 0

def bitMap : PointedMap Bit Bool := ⟨toBool, rfl⟩

def boolMap : PointedMap Bool Bit := ⟨fromBool, rfl⟩

/-- Ordinary first-order syntax; each observable function is a ten-cell table. -/
inductive Syntax (labels : Nat) where
  | move (dir : Dir) (rest : Syntax labels)
  | write (table : BoolGraph.Table 5 Bool) (rest : Syntax labels)
  | load (table : BoolGraph.Table 5 (Fin 5)) (rest : Syntax labels)
  | branch (table : BoolGraph.Table 5 Bool) (yes no : Syntax labels)
  | go (table : BoolGraph.Table 5 (Fin labels))
  | halt

namespace Syntax

def size {n : Nat} : Syntax n → Nat
  | .move _ p | .write _ p | .load _ p => p.size + 1
  | .branch _ p q => p.size + q.size + 1
  | .go _ | .halt => 1

def meaning {n : Nat} : Syntax n → TM1.Stmt Bool (Fin n) (Fin 5)
  | .move d p => .move d p.meaning
  | .write t p => .write t.read p.meaning
  | .load t p => .load t.read p.meaning
  | .branch t p q => .branch t.read p.meaning q.meaning
  | .go t => .goto t.read
  | .halt => .halt

end Syntax

/-- Sample a finite observable table; this is executable data, never a proof callback. -/
def table {α : Type} (f : Bool → Fin 5 → α) : BoolGraph.Table 5 α :=
  Vector.ofFn fun i ↦ f ((finProdFinEquiv.symm i).1 == (1 : Fin 2)) (finProdFinEquiv.symm i).2

/-- Fin2.toBool means nonzero; all table consumers use only indices0and1. -/
def go {n : Nat} (f : Fin 5 → Fin n) : Syntax n := .go (table (fun _ v ↦ f v))

def emit {α : Type} {n : Nat} : Routine α → (α → Syntax n) → Syntax n
  | .exit value, k => k value
  | .next (write, dir) p, k =>
    match write with
    | none => .move dir (emit p k)
    | some bit => .write (table fun _ _ ↦ toBool bit) (.move dir (emit p k))
  | .read dir zero one, k => .branch (table fun bit _ ↦ bit)
      (.move dir (emit one k)) (.move dir (emit zero k))

/-- All five store cases are represented in the finite syntax. -/
def select5 {n : Nat} (f : Fin 5 → Syntax n) : Syntax n :=
  .branch (table fun _ v ↦ v == 0) (f 0)
    (.branch (table fun _ v ↦ v == 1) (f 1)
      (.branch (table fun _ v ↦ v == 2) (f 2)
        (.branch (table fun _ v ↦ v == 3) (f 3) (f 4))))

end ConjectureMachines.Compilation.FieldCompiler
