/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Chess.Evaluation
import Lean

/-! Check exact M4 contracts and audit their entire compiled dependency closure. -/

open Lean Chess Chess.Adjudication Chess.Evaluation

example : ∀ g : Adjudication.Game, Set.Finite {a | IsLegalAction (decodeGame g) a} :=
  finite_branching
example : ∀ {g finish : Adjudication.Game} {n}, LegalPrefix g n finish →
    n ≤ 8 * Nat.card Key + 1 := uniform_play_bound
example : ∀ {g finish : Adjudication.Game} {n}, LegalPrefix g n finish →
    IsLegalAction (decodeGame finish) .claimDraw → n + 1 ≤ 8 * Nat.card Key + 1 :=
  uniform_claim_bound
example : ∀ g : Adjudication.Game, ∀ m, automatic g = none → rank (g.play m) < rank g :=
  rank_play_lt
example : ∀ g : Adjudication.Game, ∀ o, automatic g = some o → solve g = o := solve_terminal
example : ∀ g : Adjudication.Game, automatic g = none →
    IsLegalAction (decodeGame g) (policy g) := policy_legal
example : ∀ g : Adjudication.Game, automatic g = none →
    solve g = actionValue g (policy g) := solve_policy
example : ∀ g : Adjudication.Game, automatic g = none → ∀ a,
    IsLegalAction (decodeGame g) a → utility g.current.turn (actionValue g a) ≤
      utility g.current.turn (solve g) := optimal
example : ∀ c, IsLegalStrategy c strategy := strategy_legal
example : ∀ w b, IsLegalStrategy .white w → IsLegalStrategy .black b →
    ∃! o, ResultsIn w b Chess.Game.initial o := initial_result_unique
example : ∀ g : Chess.Game, Reachable g → ResultsIn strategy strategy g (value g) :=
  optimal_pair_result
example : ∀ c {w b}, UsesPolicy c w b → ∀ {g o}, ResultsIn w b g o →
    utility c (value g) ≤ utility c o := policy_guarantee
example : solve Adjudication.Game.initial = .draw ↔
    (WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) := solve_initial_draw_iff
example : solve Adjudication.Game.initial = .win .white ↔ CanForceWin .white :=
  solve_initial_white_win_iff
example : solve Adjudication.Game.initial = .win .black ↔ CanForceWin .black :=
  solve_initial_black_win_iff
example : CanForceWin .white ↔ ∃ w, IsLegalStrategy .white w ∧
    ∀ b, IsLegalStrategy .black b →
      ∃ o, ResultsIn w b Chess.Game.initial o ∧ o = .win .white := Iff.rfl
example : CanForceWin .black ↔ ∃ b, IsLegalStrategy .black b ∧
    ∀ w, IsLegalStrategy .white w →
      ∃ o, ResultsIn w b Chess.Game.initial o ∧ o = .win .black := Iff.rfl

private def dependencies (info : ConstantInfo) : Array Name := Id.run do
  let mut names := info.type.getUsedConstants
  if let some value := info.value? (allowOpaque := true) then
    names := names ++ value.getUsedConstants
  match info with
  | .inductInfo v => names := names ++ v.ctors.toArray ++ v.all.toArray
  | .recInfo v =>
      names := names ++ v.all.toArray
      for rule in v.rules do
        names := names.push rule.ctor ++ rule.rhs.getUsedConstants
  | _ => pure ()
  return names

def main (args : List String) : IO Unit := do
  initSearchPath (← findSysroot)
  let env ← importModules #[{module := `Cryptids.Chess.Evaluation}] {} 0
  let mut roots := env.constants.toList.foldl (init := #[]) fun acc (name, _) ↦
    if `Chess.Evaluation |>.isPrefixOf name then acc.push name else acc
  -- Inventory exact compiler artifacts; none may occur in a mathematical dependency closure.
  let owners := #[`Chess.Evaluation.analyse, `Chess.Evaluation.choose]
  let mut helpers := #[]
  for owner in owners do
    let helper := Compiler.mkUnsafeRecName owner
    let some helperInfo := env.find? helper | throw <| IO.userError "Missing recursion artifact"
    let some ownerInfo := env.find? owner | throw <| IO.userError "Missing safe definition"
    unless Compiler.isUnsafeRecName? helper == some owner && helperInfo.isPartial &&
        !ownerInfo.isPartial && !ownerInfo.isUnsafe && helperInfo.type == ownerInfo.type do
      throw <| IO.userError "Unexpected compiler recursion artifact"
    helpers := helpers.push helper
  roots := roots.filter (fun n ↦ !helpers.contains n)
  if args == ["--negative-control"] then roots := roots.push `sorryAx
  else if args == ["--negative-control-open"] then
    roots := roots.push `Chess.perfect_play_results_in_draw
  else if args == ["--negative-control-rec"] then roots := roots.push helpers[0]!
  else if args == ["--negative-control-choice"] then roots := roots.push helpers[1]!
  else if !args.isEmpty then throw <| IO.userError "Unexpected audit argument"
  let mut pending := roots
  let mut seen : NameSet := {}
  let mut axioms : NameSet := {}
  while let some name := pending.back? do
    pending := pending.pop
    if seen.contains name then continue
    seen := seen.insert name
    if name == `Chess.perfect_play_results_in_draw then
      throw <| IO.userError "The open chess conjecture is a dependency"
    let some info := env.find? name | throw <| IO.userError s!"Missing declaration: {name}"
    if info.isUnsafe || info.isPartial then
      throw <| IO.userError s!"Unsafe or partial dependency: {name}"
    if info matches .axiomInfo _ then
      unless #[`propext, `Classical.choice, `Quot.sound].contains name do
        throw <| IO.userError s!"Forbidden axiom: {name}"
      axioms := axioms.insert name
    pending := pending ++ dependencies info
  IO.println s!"Audited {roots.size} M4 declarations and {seen.size} dependency declarations"
  IO.println "Inventoried 2 Lean-generated recursion artifacts outside the safe dependency closure"
  IO.println s!"Permitted axioms used: {axioms.toArray.qsort Name.lt}"
  IO.println "Chess M4 theorem audit passed"
