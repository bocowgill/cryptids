/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Chess.Evaluation.Correspondence

/-!
# Total chess evaluation and strategic correspondence

Backward induction retains the frozen reference's entire game state. A finite-key capacity
proves termination. Pointwise optimal policies are globally legal, all legal strategy pairs
have unique results, and the three computed values have exact strategic characterizations.
No value of the standard initial position is asserted or computed here.
-/
