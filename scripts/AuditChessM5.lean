/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Compilation
import Lean

/-! Check exact M5 contracts and audit their entire compiled dependency closure. -/

open Lean

open ConjectureMachines ConjectureMachines.Compilation Chess.Compilation

example : ∀ tree : Tree, (Examples.generated tree).Halts ↔ value tree ≠ 1 :=
  Examples.generated_halts
example : ∀ c : Turing.ToPartrec.Code, ∀ C : BlockCode Adequacy.PartrecAlphabet,
    (Adequacy.compileClosedCode c C).Halts ↔ (Turing.ToPartrec.Code.eval c []).Dom :=
  Adequacy.compileClosedCode_halts
example : Halts Examples.whiteMachine := Examples.whiteProof
example : Halts Examples.blackMachine := Examples.blackProof
example : ¬ Halts Examples.drawMachine := Examples.drawProof
example : ¬ Halts Examples.refutationMachine := Examples.refutationProof
example : Examples.whiteStatement ↔ Halts Examples.whiteMachine := Iff.rfl
example : Examples.blackStatement ↔ Halts Examples.blackMachine := Iff.rfl
example : Examples.drawStatement ↔ ¬ Halts Examples.drawMachine := Iff.rfl
example : Examples.refutationStatement ↔ ¬ Halts Examples.refutationMachine := Iff.rfl

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
  let env ← importModules #[{module := `Cryptids.Compilation}] {} 0
  let mut roots := env.constants.toList.foldl (init := #[]) fun acc (name, _) ↦
    if (`ConjectureMachines.Compilation |>.isPrefixOf name) ||
        (`Chess.Compilation |>.isPrefixOf name) then acc.push name else acc
  -- Inventory exact compiler artifacts; none may occur in a mathematical dependency closure.
  let mut helpers := #[]
  for name in roots do
    if let some owner := Compiler.isUnsafeRecName? name then
      let some helperInfo := env.find? name | throw <| IO.userError "Missing recursion artifact"
      let some ownerInfo := env.find? owner | throw <| IO.userError "Missing safe definition"
      unless helperInfo.isPartial && !ownerInfo.isPartial && !ownerInfo.isUnsafe &&
          helperInfo.type == ownerInfo.type do
        throw <| IO.userError s!"Unexpected compiler recursion artifact: {name}"
      helpers := helpers.push name
  roots := roots.filter (fun n ↦ !helpers.contains n)
  if args == ["--negative-control"] then roots := roots.push `sorryAx
  else if args == ["--negative-control-open"] then
    roots := roots.push `Chess.perfect_play_results_in_draw
  else if args == ["--negative-control-rec"] then roots := roots.push helpers[0]!
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
  IO.println s!"Audited {roots.size} M5 declarations and {seen.size} dependency declarations"
  IO.println s!"Inventoried {helpers.size} Lean-generated recursion artifacts outside the safe closure"
  IO.println s!"Recursion artifacts: {helpers.qsort Name.lt}"
  IO.println s!"Permitted axioms used: {axioms.toArray.qsort Name.lt}"
  IO.println "Chess M5 theorem audit passed"
