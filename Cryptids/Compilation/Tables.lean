/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.Examples
public import Cryptids.Compilation.Literal
public import Cryptids.Compilation.BalancedTable

/-! # Exact published tables and independent kernel execution certificates

The balanced representation has exactly the ordinary flattened-row semantics. Finite traces
prove the two halting claims; closed total bounce states prove both nonhalting claims for
unbounded time. None of these four literal proofs assumes the native generator is correct.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.Examples
open Turing Chess.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false

set_option maxHeartbeats 0 in
-- External data becomes an ordinary constructor term checked by the kernel.
def whiteTree : Balanced.RowTree (List (Option (Fin 2 × Dir × Fin 49910))) :=
  load_balanced_rows% "artifacts/chess_m5/white.txt"


def whiteRows := whiteTree.flatten

def whiteMachine : Machine 49910 2 := Balanced.ofTree whiteTree

set_option maxHeartbeats 0 in
-- Kernel reduction checks the complete literal data or its concrete execution certificate.
theorem whiteTree_valid : whiteTree.WellFormed := by decide +kernel

set_option maxHeartbeats 0 in
-- Kernel reduction checks the complete literal data or its concrete execution certificate.
theorem whiteTree_count : whiteTree.count = 49910 := by decide +kernel

set_option maxHeartbeats 0 in
-- Kernel reduction checks the complete literal data or its concrete execution certificate.
theorem whiteTree_height : whiteTree.height = 16 := by decide +kernel

/-- Literal transitions agree with the published row order, including every unused state. -/
theorem whiteMachine_eq_rows : whiteMachine = Machine.ofRows whiteRows :=
  Balanced.ofTree_eq_ofRows whiteTree whiteTree_valid

set_option maxHeartbeats 0 in
-- External data becomes an ordinary constructor term checked by the kernel.
def blackTree : Balanced.RowTree (List (Option (Fin 2 × Dir × Fin 49910))) :=
  load_balanced_rows% "artifacts/chess_m5/black.txt"


def blackRows := blackTree.flatten

def blackMachine : Machine 49910 2 := Balanced.ofTree blackTree

set_option maxHeartbeats 0 in
-- Kernel reduction checks the complete literal data or its concrete execution certificate.
theorem blackTree_valid : blackTree.WellFormed := by decide +kernel

set_option maxHeartbeats 0 in
-- Kernel reduction checks the complete literal data or its concrete execution certificate.
theorem blackTree_count : blackTree.count = 49910 := by decide +kernel

set_option maxHeartbeats 0 in
-- Kernel reduction checks the complete literal data or its concrete execution certificate.
theorem blackTree_height : blackTree.height = 16 := by decide +kernel

/-- Literal transitions agree with the published row order, including every unused state. -/
theorem blackMachine_eq_rows : blackMachine = Machine.ofRows blackRows :=
  Balanced.ofTree_eq_ofRows blackTree blackTree_valid

set_option maxHeartbeats 0 in
-- External data becomes an ordinary constructor term checked by the kernel.
def drawTree : Balanced.RowTree (List (Option (Fin 2 × Dir × Fin 49910))) :=
  load_balanced_rows% "artifacts/chess_m5/draw.txt"


def drawRows := drawTree.flatten

def drawMachine : Machine 49910 2 := Balanced.ofTree drawTree

set_option maxHeartbeats 0 in
-- Kernel reduction checks the complete literal data or its concrete execution certificate.
theorem drawTree_valid : drawTree.WellFormed := by decide +kernel

set_option maxHeartbeats 0 in
-- Kernel reduction checks the complete literal data or its concrete execution certificate.
theorem drawTree_count : drawTree.count = 49910 := by decide +kernel

set_option maxHeartbeats 0 in
-- Kernel reduction checks the complete literal data or its concrete execution certificate.
theorem drawTree_height : drawTree.height = 16 := by decide +kernel

/-- Literal transitions agree with the published row order, including every unused state. -/
theorem drawMachine_eq_rows : drawMachine = Machine.ofRows drawRows :=
  Balanced.ofTree_eq_ofRows drawTree drawTree_valid

set_option maxHeartbeats 0 in
-- External data becomes an ordinary constructor term checked by the kernel.
def refutationTree : Balanced.RowTree (List (Option (Fin 2 × Dir × Fin 58838))) :=
  load_balanced_rows% "artifacts/chess_m5/refutation.txt"


def refutationRows := refutationTree.flatten

def refutationMachine : Machine 58838 2 := Balanced.ofTree refutationTree

set_option maxHeartbeats 0 in
-- Kernel reduction checks the complete literal data or its concrete execution certificate.
theorem refutationTree_valid : refutationTree.WellFormed := by decide +kernel

set_option maxHeartbeats 0 in
-- Kernel reduction checks the complete literal data or its concrete execution certificate.
theorem refutationTree_count : refutationTree.count = 58838 := by decide +kernel

set_option maxHeartbeats 0 in
-- Kernel reduction checks the complete literal data or its concrete execution certificate.
theorem refutationTree_height : refutationTree.height = 16 := by decide +kernel

/-- Literal transitions agree with the published row order, including every unused state. -/
theorem refutationMachine_eq_rows : refutationMachine = Machine.ofRows refutationRows :=
  Balanced.ofTree_eq_ofRows refutationTree refutationTree_valid

def whiteStatement : Prop := Halts whiteMachine
def blackStatement : Prop := Halts blackMachine
def drawStatement : Prop := ¬ Halts drawMachine
def refutationStatement : Prop := ¬ Halts refutationMachine

set_option maxHeartbeats 0 in
-- Kernel reduction checks the complete literal data or its concrete execution certificate.
theorem whiteProof : whiteStatement :=
  Literal.halts_of_runFrom_isNone (n := 1995) (by decide +kernel)

set_option maxHeartbeats 0 in
-- Kernel reduction checks the complete literal data or its concrete execution certificate.
theorem blackProof : blackStatement :=
  Literal.halts_of_runFrom_isNone (n := 1995) (by decide +kernel)

set_option maxHeartbeats 0 in
-- Kernel reduction checks the complete literal data or its concrete execution certificate.
theorem draw_closed : Literal.ClosedTotal drawMachine {15481, 40430} := by
  apply Literal.closedTotal_bounce
  · intro symbol
    fin_cases symbol <;> decide +kernel
  · intro symbol
    fin_cases symbol <;> decide +kernel

set_option maxHeartbeats 0 in
-- Kernel reduction checks the complete literal data or its concrete execution certificate.
theorem drawProof : drawStatement :=
  Literal.not_halts_of_runFrom_state draw_closed (n := 1991) (state := 40430)
    (by decide +kernel) (by simp)

set_option maxHeartbeats 0 in
-- Kernel reduction checks the complete literal data or its concrete execution certificate.
theorem refutation_closed : Literal.ClosedTotal refutationMachine {25307, 54720} := by
  apply Literal.closedTotal_bounce
  · intro symbol
    fin_cases symbol <;> decide +kernel
  · intro symbol
    fin_cases symbol <;> decide +kernel

set_option maxHeartbeats 0 in
-- Kernel reduction checks the complete literal data or its concrete execution certificate.
theorem refutationProof : refutationStatement :=
  Literal.not_halts_of_runFrom_state refutation_closed (n := 3739) (state := 54720)
    (by decide +kernel) (by simp)

/-- Literal artifact equivalences, proved without assuming native generator correctness. -/
theorem white_literal_correct : Halts whiteMachine ↔ value whiteWin ≠ 1 :=
  iff_of_true whiteProof (by decide)

theorem black_literal_correct : Halts blackMachine ↔ value blackWin ≠ 1 :=
  iff_of_true blackProof (by decide)

theorem draw_literal_correct : Halts drawMachine ↔ value drawGame ≠ 1 :=
  iff_of_false drawProof (by simp [drawGame_value])

theorem refutation_literal_correct : Halts refutationMachine ↔ value favorableLine ≠ 1 :=
  iff_of_false refutationProof (by simp [favorableLine_value])

end ConjectureMachines.Compilation.Examples
