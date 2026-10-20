/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Chess.Adjudication
import Lean

/-! Check exact M3 contracts and audit their entire compiled dependency closure. -/

open Lean Chess Chess.Adjudication

example : ∀ g : Chess.Game, decodeGame (encodeGame g) = g := decode_encodeGame
example : ∀ g : Adjudication.Game, encodeGame (decodeGame g) = g := encode_decodeGame
example : ∀ g m, decodeGame (Adjudication.Game.play g m) = (decodeGame g).play m := decode_play
example : ∀ p n m, IsLegalPly ((project p).position n) m ↔ IsLegalPly p m := legal_position
example : ∀ p n, IsCheckmate ((project p).position n) ↔ IsCheckmate p := checkmate_position
example : ∀ {p q}, Relation.ReflTransGen Chess.Position.Next p q →
    Relation.ReflTransGen Key.Next (project p) (project q) := project_path
example : ∀ {p q}, Relation.ReflTransGen Key.Next (project p) q →
    ∃ next, Relation.ReflTransGen Chess.Position.Next p next ∧ project next = q := lift_path
example : ∀ p, isDead p = true ↔ IsDeadPosition (Exec.decode p) := isDead_iff
example : ∀ p q, samePosition p q = true ↔ SamePosition (Exec.decode p) (Exec.decode q) :=
  samePosition_iff
example : ∀ g n, Chess.Game.RepeatedAtLeast n g ↔ n ≤ occurrences g := repeated_iff_occurrences
example : ∀ g, canClaimThreefold g = true ↔ CanClaimThreefold (decodeGame g) :=
  canClaimThreefold_iff
example : ∀ g, canClaimFiftyMove g = true ↔ CanClaimFiftyMove (decodeGame g) :=
  canClaimFiftyMove_iff
example : ∀ g, canClaimDraw g = true ↔ CanClaimDraw (decodeGame g) := canClaimDraw_iff
example : ∀ g o, automatic g = some o ↔ AutomaticOutcome (decodeGame g) o := automatic_some_iff
example : ∀ g a, a ∈ legalActions g ↔ IsLegalAction (decodeGame g) a := mem_legalActions
example : ∀ g, (legalActions g).Nodup := legalActions_nodup
example : ∀ {g o₁ o₂}, AutomaticOutcome g o₁ → AutomaticOutcome g o₂ → o₁ = o₂ := automatic_unique
example : ∀ {g o}, AutomaticOutcome g o → ∀ a, ¬IsLegalAction g a := no_action_after_automatic
example : ∀ g, (¬∃ o, AutomaticOutcome g o) → ∃ a, IsLegalAction g a := nonterminal_has_action

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
  let env ← importModules #[{module := `Cryptids.Chess.Adjudication}] {} 0
  let mut roots := env.constants.toList.foldl (init := #[]) fun acc (name, _) ↦
    if `Chess.Adjudication |>.isPrefixOf name then acc.push name else acc
  -- Lean generates this compiled recursion implementation for the safe well-founded definition.
  -- Inventory exactly this artifact separately; never exempt it from dependency traversal.
  let helper := `Chess.Adjudication.FiniteSearch.search._unsafe_rec
  let owner := `Chess.Adjudication.FiniteSearch.search
  let some helperInfo := env.find? helper | throw <| IO.userError "Missing recursion artifact"
  let some ownerInfo := env.find? owner | throw <| IO.userError "Missing safe search definition"
  unless Compiler.isUnsafeRecName? helper == some owner && helperInfo.isPartial &&
      !ownerInfo.isPartial && !ownerInfo.isUnsafe && helperInfo.type == ownerInfo.type do
    throw <| IO.userError "Unexpected compiler recursion artifact"
  roots := roots.filter (· != helper)
  if args == ["--negative-control"] then roots := roots.push `sorryAx
  else if args == ["--negative-control-open"] then
    roots := roots.push `Chess.perfect_play_results_in_draw
  else if args == ["--negative-control-rec"] then roots := roots.push helper
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
  IO.println s!"Audited {roots.size} M3 declarations and {seen.size} dependency declarations"
  IO.println "Inventoried 1 Lean-generated recursion artifact outside the safe dependency closure"
  IO.println s!"Permitted axioms used: {axioms.toArray.qsort Name.lt}"
  IO.println "Chess M3 theorem audit passed"
