/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Chess.Compilation.Foundations

/-! Regressions for the checked construction components; no initial chess search is run. -/

open Chess Chess.Compilation ConjectureMachines.Compilation Turing Turing.ToPartrec

set_option backward.isDefEq.respectTransparency false

namespace M6Fixtures

/-- The bound counts actual continuation-machine steps, not chess plies. -/
def run : Nat → Cfg → Option (List Nat)
  | _, .halt v => some v
  | 0, .ret _ _ => none
  | n + 1, .ret k v => run n (stepRet k v)

theorem run_reaches {fuel : Nat} {cfg : Cfg} {out : List Nat}
    (h : run fuel cfg = some out) : StateTransition.Reaches step cfg (.halt out) := by
  induction fuel generalizing cfg with
  | zero =>
    cases cfg with
    | halt v => cases Option.some.inj h; exact .refl
    | ret k v => simp [run] at h
  | succ n ih =>
    cases cfg with
    | halt v => cases Option.some.inj h; exact .refl
    | ret k v =>
      have one : StateTransition.Reaches step (.ret k v) (stepRet k v) :=
        Relation.ReflTransGen.single rfl
      exact one.trans (ih h)

/-- A successful bounded run is evidence about the exact `Code.eval` semantics. -/
theorem run_sound {fuel : Nat} {code : Code} {input out : List Nat}
    (h : run fuel (stepNormal code .halt input) = some out) : out ∈ code.eval input := by
  have hr : Cfg.halt out ∈ StateTransition.eval step (stepNormal code .halt input) :=
    StateTransition.mem_eval.mpr ⟨run_reaches h, rfl⟩
  rw [stepNormal_eval] at hr
  change Cfg.halt out ∈ (code.eval input).map Cfg.halt at hr
  obtain ⟨w, hw, he⟩ := (Part.mem_map_iff _).mp hr
  cases Cfg.halt.inj he
  exact hw

def execute (fuel : Nat) (code : Code) (input : List Nat) : Option (List Nat) :=
  run fuel (stepNormal code .halt input)

def sumWithResidual : Scalar.Expr :=
  .fold (.literal 4) (.literal 0) (.add (.input 0) (.add (.input 1) (.input 2)))

example : (Scalar.compile sumWithResidual).eval [5] = pure [26] := by
  rw [Scalar.compile_eval]
  rfl

example (v : List Nat) : Program.initialData.eval v =
    pure (Data.encodeGame Adjudication.Game.initial) := Program.initialData_eval v

example (v : List Nat) : Program.spin.eval v = Part.none := Program.spin_eval v

example : Program.nonDraw.eval [0] = Part.none := Program.nonDraw_eval .draw
example : Program.nonDraw.eval [1] = pure [] := Program.nonDraw_eval (.win .white)
example : Program.nonDraw.eval [2] = pure [] := Program.nonDraw_eval (.win .black)

def checks : List (String × Bool) :=
  [("scalar fold retains residual input", execute 20000 (Scalar.compile sumWithResidual) [5] == some [26]),
   ("dynamic first-square board read", execute 10000 Rules.boardGet
      (0 :: Data.initialPositionWords) == some [3]),
   ("dynamic final-square board read", execute 10000 Rules.boardGet
      (63 :: Data.initialPositionWords) == some [9]),
   ("empty board square", execute 10000 Rules.boardGet
      (32 :: Data.initialPositionWords) == some [0]),
   ("draw postlude bounded nontermination prefix", execute 1000 Program.nonDraw [0] == none),
   ("white win postlude returns", execute 1000 Program.nonDraw [1] == some []),
   ("black win postlude returns", execute 1000 Program.nonDraw [2] == some []),
   ("wrong board value rejected", !(execute 10000 Rules.boardGet
      (63 :: Data.initialPositionWords) == some [3]))]

end M6Fixtures

def main : IO Unit := do
  for (name, result) in M6Fixtures.checks do
    unless result do throw <| IO.userError s!"Failed M6 component fixture: {name}"
  IO.println s!"Chess M6 component fixtures passed: {M6Fixtures.checks.length} checks"
