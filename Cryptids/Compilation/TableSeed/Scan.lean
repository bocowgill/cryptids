/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.Seed.Scan
public import Cryptids.Compilation.Seed.Format

/-! # Scanning compact three-bit output words

Compact words preserve a bounded counter across their boundaries. Framed execution lemmas
use the caller's paid scanner rows and leave all exterior tape frames unrestricted.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.TableSeed.Scan

open Turing FieldBinary

/-- Every forward code is safe from counter at most one and ends at counter at most one. -/
theorem word_forward (letter : Seed.Letter) (run : Fin 4) (bound : run.val ≤ 1) :
    ∃ final : Fin 4, Seed.Scan.scanWord (Seed.word letter) run = some final ∧ final.val ≤ 1 := by
  fin_cases letter <;> fin_cases run <;> norm_num at bound
  all_goals decide

/-- Reversed codes preserve the larger bound required by adjacent reversed words. -/
theorem word_reverse (letter : Seed.Letter) (run : Fin 4) (bound : run.val ≤ 2) :
    ∃ final : Fin 4,
      Seed.Scan.scanWord (Seed.word letter).reverse run = some final ∧ final.val ≤ 2 := by
  fin_cases letter <;> fin_cases run <;> norm_num at bound
  all_goals decide

end ConjectureMachines.Compilation.TableSeed.Scan
