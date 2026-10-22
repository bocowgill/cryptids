/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.FieldCompiler.Graph

/-! # Exact allocation interface for padding-free field graphs -/

@[expose] public section
namespace ConjectureMachines.Compilation.FieldPacking
open FieldCompiler

/-- Every actual local syntax node, without a padding alternative. -/
abbrev Slot {labels : Nat} (rows : Vector (Syntax labels) labels) :=
  Σ q : Fin labels, Fin (rows.get q).size

/-- A computable bijection pays exactly the actual nodes. Local order certifies descent. -/
structure Layout {labels : Nat} (rows : Vector (Syntax labels) labels) (total : Nat) where
  code : Slot rows ≃ Fin total
  ordered : ∀ (q : Fin labels) (i j : Fin (rows.get q).size), i.val < j.val →
    (code ⟨q, i⟩).val < (code ⟨q, j⟩).val

end ConjectureMachines.Compilation.FieldPacking
