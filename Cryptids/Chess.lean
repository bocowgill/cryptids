/-
Copyright 2026 The Formal Conjectures Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Chess.Spec
public import Cryptids.Chess.SpecLemmas

/-!
# Chess reference specification

Definitions-only reference for the chess cryptid campaign. The game-theoretic draw proposition
is stated by the conjunction of `Chess.WhiteCanAvoidLoss` and `Chess.BlackCanAvoidLoss`; no
assertion of that proposition is imported or proved here. Executable refinement is future work.
-/
