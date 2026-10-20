/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Compilation.CodeVM
import Cryptids.Compilation.RuntimeSupport
import Cryptids.Compilation.RuntimeDispatch

open Turing.ToPartrec ConjectureMachines.Compilation

private def check (label : String) (test : Bool) : IO Unit := do
  unless test do throw <| IO.userError s!"Code VM fixture failed: {label}"
  IO.println s!"ok: {label}"

private def runPrefix (rows : Array CodeDAG.Node) (fuel : Nat) (start : CodeVM.Config) :
    Option CodeVM.Config :=
  (fun c ↦ c.bind fun
    | final@(.halt _) => some final
    | other => CodeVM.step rows other)^[fuel] (some start)

private def run (code : Code) (input : List Nat) : Option (List Nat) :=
  let dag := CodeDAG.compile code
  match runPrefix dag.rows 200 (CodeVM.init dag input) with
  | some (.halt out) => some out
  | _ => none

example (code : Code) (input out : List Nat) :
    CodeVM.Runs (CodeDAG.compile code).rows (CodeVM.init (CodeDAG.compile code) input) out ↔
      out ∈ code.eval input := CodeVM.runs_compile_iff code input out

example (input : List Nat) :
    (StateTransition.eval (CodeVM.step (CodeDAG.compile .zero').rows)
      (CodeVM.init (CodeDAG.compile .zero') input)).Dom :=
  (CodeVM.halts_compile_iff .zero' input).mpr trivial

example (input : List Nat) :
    ¬ (StateTransition.eval (CodeVM.step (CodeDAG.compile (.fix (.cons .succ .nil))).rows)
      (CodeVM.init (CodeDAG.compile (.fix (.cons .succ .nil))) input)).Dom := by
  intro h
  obtain ⟨out, value⟩ := Part.dom_iff_mem.mp ((CodeVM.halts_compile_iff _ _).mp h)
  rw [Code.fix_eval] at value
  apply PFun.fixInduction' (C := fun _ ↦ False) value
  · intro x hx
    simp [Code.cons_eval, Code.succ_eval, Code.nil_eval, Bind.bind] at hx
  · exact fun _ _ _ _ ih ↦ ih

def main : IO Unit := do
  check "zero" (run .zero' [4, 0] == some [0, 4, 0])
  check "successor" (run .succ [4] == some [5])
  check "empty successor" (run .succ [] == some [1])
  check "tail" (run .tail [3, 0, 4] == some [0, 4])
  check "cons evaluates against saved original input"
    (run (.cons .succ .zero') [4, 9] == some [5, 0, 4, 9])
  check "cons empty left result contributes zero"
    (run (.cons .tail .id) [42] == some [0, 42])
  check "composition evaluates right first" (run (.comp .succ .tail) [3, 8] == some [9])
  check "case zero removes head" (run (.case .zero' .succ) [0, 7] == some [0, 7])
  check "case positive decrements head" (run (.case .zero' .succ) [3, 7] == some [3])
  check "case empty input uses zero branch" (run (.case .zero' .succ) [] == some [0])
  check "fix immediate exit" (run (.fix .zero') [7, 0] == some [7, 0])
  check "fix repeated body evaluation" (run (.fix (.cons .head .pred)) [3] == some [0])
  let shared := CodeDAG.compile (.comp .succ .succ)
  check "equal child codes share one row" (shared.rows.size == 2)
  check "shared row used in two contexts" (run (.comp .succ .succ) [4] == some [6])
  check "compiled table valid" (CodeDAG.check shared)
  check "reject wrong output" (run .succ [4] != some [4])
  check "invalid PC rejects" (CodeVM.step #[] (.eval 0 .halt []) == none)
  check "invalid forward reference rejected"
    (!CodeDAG.check ⟨#[.cons 0 0], 0⟩)
  check "cons1 stores head only"
    (CodeVM.step #[] (.ret (.cons1 7 [4] .halt) []) ==
      some (.eval 7 (.cons2 0 .halt) [4]))
  check "cons2 restores saved head"
    (CodeVM.step #[] (.ret (.cons2 13 .halt) [0, 4]) == some (.ret .halt [13, 0, 4]))
  check "comp returns to runtime PC"
    (CodeVM.step #[] (.ret (.comp 8 .halt) [4]) == some (.eval 8 .halt [4]))
  check "fix zero flag removes flag"
    (CodeVM.step #[] (.ret (.fix 8 .halt) [0, 7]) == some (.ret .halt [7]))
  check "fix positive flag reinstalls same data frame"
    (CodeVM.step #[] (.ret (.fix 8 .halt) [3, 7]) == some (.eval 8 (.fix 8 .halt) [7]))
  check "halt frame gives successful output"
    (CodeVM.step #[] (.ret .halt [7]) == some (.halt [7]))
  check "successful output has no next step" (CodeVM.step #[] (.halt [7]) == none)
  let spin := CodeDAG.compile (.fix (.cons .succ .nil))
  let live := runPrefix spin.rows 200 (CodeVM.init spin [0, 4])
  check "positive fix flag remains live in finite prefix" (live.isSome)
  check "positive fix flag has no prefix output" (match live with
    | some (.halt _) => false
    | _ => true)
  IO.println "Code VM fixtures passed: 27 assertions"
