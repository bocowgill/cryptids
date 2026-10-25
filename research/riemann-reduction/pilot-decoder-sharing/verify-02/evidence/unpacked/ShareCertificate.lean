/-
Copyright (c) 2026 The Cryptids Authors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import ShareDefinitions

@[expose] public section
namespace RhShare

def witnesses : Array ControlWord := #[
  .local 0 0,
  .outside 63,
  .outside 6,
  .outside 63,
  .outside 89,
  .outside 63,
  .local 0 1,
  .outside 63,
  .local 0 3,
  .outside 63,
  .outside 6,
  .local 0 0,
  .outside 89,
  .local 0 0,
  .local 0 1,
  .local 0 0,
  .local 0 3,
  .local 0 0,
  .outside 89,
  .outside 6,
  .local 0 1,
  .outside 6,
  .local 0 3,
  .outside 6,
  .local 0 1,
  .outside 89,
  .local 0 3,
  .outside 89,
  .local 0 3,
  .local 0 1]

def witness (i : Fin 30) : ControlWord :=
  witnesses.getD i.val (.outside 0)

theorem witness_count : witnesses.size = 30 := by
  decide +kernel

/-- Each fixed alias violates the unchanged endpoint contract. -/
theorem all_aliases_fail : ∀ i : Fin 30, failure i (witness i) := by
  decide +kernel

end RhShare
