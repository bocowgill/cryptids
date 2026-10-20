/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Chess.Compilation.Foundations
import Lean

/-! Audit the checked construction components, without claiming the M6 theorem exists. -/

open Lean

private def prefixes : Array Name := #[
  `Chess.Compilation.Data, `Chess.Compilation.Evaluator, `Chess.Compilation.WithoutDead,
  `Chess.Compilation.Geometry, `Chess.Compilation.Updates, `Chess.Compilation.Rules,
  `Chess.Compilation.Legality, `Chess.Compilation.Control,
  `Chess.Compilation.HistoryCode, `Chess.Compilation.Source, `Chess.Compilation.Tape,
  `Chess.Compilation.Program, `Chess.Compilation.History,
  `ConjectureMachines.Compilation.NatCode, `ConjectureMachines.Compilation.ListCode,
  `ConjectureMachines.Compilation.Scalar, `ConjectureMachines.Compilation.Commands,
  `ConjectureMachines.Compilation.CodeBackend, `ConjectureMachines.Compilation.CodeDAG,
  `ConjectureMachines.Compilation.CodeVM, `ConjectureMachines.Compilation.Runtime,
  `ConjectureMachines.Compilation.RuntimeMacros, `ConjectureMachines.Compilation.RuntimeSupport,
  `ConjectureMachines.Compilation.RuntimeLookup, `ConjectureMachines.Compilation.RuntimeWire,
  `ConjectureMachines.Compilation.RuntimeProof]

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
  let env ← importModules #[{module := `Cryptids.Chess.Compilation.Foundations}] {} 0
  let mut roots := env.constants.toList.foldl (init := #[]) fun acc (name, _) ↦
    if prefixes.any (·.isPrefixOf name) then acc.push name else acc
  let mut helpers := #[]
  for name in roots do
    if let some owner := Compiler.isUnsafeRecName? name then
      let some helper := env.find? name | throw <| IO.userError "Missing compiler artifact"
      let some safe := env.find? owner | throw <| IO.userError "Missing safe owner"
      unless helper.isPartial && !safe.isPartial && !safe.isUnsafe && helper.type == safe.type do
        throw <| IO.userError s!"Unexpected compiler artifact: {name}"
      helpers := helpers.push name
  roots := roots.filter (fun n ↦ !helpers.contains n)
  if args == ["--negative-control"] then roots := roots.push `sorryAx
  else if args == ["--negative-control-open"] then
    roots := roots.push `Chess.perfect_play_results_in_draw
  else if args == ["--negative-control-rec"] then roots := roots.push helpers[0]!
  else unless args.isEmpty do throw <| IO.userError "Unexpected audit argument"
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
  IO.println s!"Audited {roots.size} M6 foundation roots and {seen.size} dependencies"
  IO.println s!"Compiler artifacts outside safe roots: {helpers.qsort Name.lt}"
  IO.println s!"Permitted axioms: {axioms.toArray.qsort Name.lt}"
  IO.println "Chess M6 foundation audit passed"
