/-
Copyright 2026 The Formal Conjectures Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Chess.Spec

/-!
# Reference sanity check

The original sanity theorem from the pinned chess specification, without conjecture-repository
metadata. This theorem is independent of the open draw conjecture.
-/

@[expose] public section
namespace Chess

/-- The initial position has the standard side to move, kings, and half-move clock. -/
theorem initial_position_sanity :
    initialPosition.turn = .white ∧
      initialPosition.board (kingHome .white) = some ⟨.white, .king⟩ ∧
      initialPosition.board (kingHome .black) = some ⟨.black, .king⟩ ∧
      initialPosition.halfmoveClock = 0 := by
  exact ⟨rfl, rfl, rfl, rfl⟩

end Chess
