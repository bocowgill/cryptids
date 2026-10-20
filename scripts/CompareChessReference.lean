/-
Copyright 2026 The Cryptids Contributors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Lean

/-!
# Compiled chess reference correspondence check

Load the port and independently extracted source into separate environments. Compare every
`Chess` declaration, including generated constructors and recursors, and recursively compare
their dependencies. This is a verification tool, not an axiom or a chess implementation.
-/

open Lean

private def canonicalUniverses (info : ConstantInfo) : ConstantInfo := Id.run do
  -- Generated universe parameter names contain the input module's hygiene context.
  -- Rename bound parameters by position; preserve all types, bodies, and rule fields.
  let names := (List.range info.levelParams.length).map fun i ↦ Name.mkSimple s!"u{i}"
  let normalize (e : Expr) := e.instantiateLevelParams info.levelParams (names.map Level.param)
  let base := { info.toConstantVal with levelParams := names, type := normalize info.type }
  return match info with
  | .axiomInfo v => .axiomInfo { v with toConstantVal := base }
  | .defnInfo v => .defnInfo { v with toConstantVal := base, value := normalize v.value }
  | .thmInfo v => .thmInfo { v with toConstantVal := base, value := normalize v.value }
  | .opaqueInfo v => .opaqueInfo { v with toConstantVal := base, value := normalize v.value }
  | .quotInfo v => .quotInfo { v with toConstantVal := base }
  | .inductInfo v => .inductInfo { v with toConstantVal := base }
  | .ctorInfo v => .ctorInfo { v with toConstantVal := base }
  | .recInfo v => .recInfo { v with
      toConstantVal := base
      rules := v.rules.map fun r ↦ { r with rhs := normalize r.rhs } }

private def sameInfo (a b : ConstantInfo) : Bool :=
  let a := canonicalUniverses a
  let b := canonicalUniverses b
  match a, b with
  | .axiomInfo a, .axiomInfo b => a == b
  | .defnInfo a, .defnInfo b => a == b
  | .thmInfo a, .thmInfo b => a == b
  | .opaqueInfo a, .opaqueInfo b => a == b
  | .ctorInfo a, .ctorInfo b => a == b
  | .recInfo a, .recInfo b => a == b
  | .inductInfo a, .inductInfo b =>
      a.toConstantVal == b.toConstantVal && a.numParams == b.numParams &&
      a.numIndices == b.numIndices && a.all == b.all && a.ctors == b.ctors &&
      a.numNested == b.numNested && a.isRec == b.isRec &&
      a.isUnsafe == b.isUnsafe && a.isReflexive == b.isReflexive
  | .quotInfo a, .quotInfo b =>
      a.toConstantVal == b.toConstantVal && match a.kind, b.kind with
      | .type, .type | .ctor, .ctor | .lift, .lift | .ind, .ind => true
      | _, _ => false
  | _, _ => false

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

private def chessNames (env : Environment) : Array Name :=
  env.constants.toList.foldl (init := #[]) fun names (name, _) ↦
    if Name.isPrefixOf `Chess name then names.push name else names

private def compare (port source : Environment) : IO Unit := do
  let portNames := (chessNames port).qsort Name.lt
  let sourceNames := (chessNames source).qsort Name.lt
  unless portNames == sourceNames do
    throw <| IO.userError "Chess declaration inventories differ"
  unless portNames.contains `Chess.WhiteCanAvoidLoss &&
      portNames.contains `Chess.BlackCanAvoidLoss do
    throw <| IO.userError "Missing strategic target declarations"
  if port.find? `Chess.perfect_play_results_in_draw |>.isSome then
    throw <| IO.userError "Open draw theorem is present in the reference environment"
  let permitted : Array Name := #[`propext, `Quot.sound, `Classical.choice]
  let mut pending := sourceNames
  let mut seen : NameSet := {}
  let mut axioms : NameSet := {}
  while let some name := pending.back? do
    pending := pending.pop
    if seen.contains name then continue
    seen := seen.insert name
    let some a := port.find? name
      | throw <| IO.userError s!"Port dependency missing: {name}"
    let some b := source.find? name
      | throw <| IO.userError s!"Source dependency missing: {name}"
    unless sameInfo a b do
      let detail := match a, b with
        | .defnInfo a, .defnInfo b =>
            s!" (type={a.type == b.type}, value={a.value == b.value}, " ++
            s!"hints={a.hints == b.hints}, levels={a.levelParams == b.levelParams}, " ++
            s!"safety={a.safety == b.safety}, mutual={a.all == b.all}, " ++
            s!"portLevels={a.levelParams}, sourceLevels={b.levelParams})"
        | _, _ => ""
      throw <| IO.userError s!"Compiled declaration mismatch: {name}{detail}"
    if a.isUnsafe || a.isPartial then
      throw <| IO.userError s!"Unsafe or partial reference dependency: {name}"
    if a matches .axiomInfo _ then
      unless permitted.contains name do
        throw <| IO.userError s!"Forbidden reference axiom: {name}"
      axioms := axioms.insert name
    pending := pending ++ dependencies a
  IO.println s!"Matched {portNames.size} Chess declarations; {seen.size} dependency declarations"
  IO.println s!"Permitted axioms used: {axioms.toArray.qsort Name.lt}"
  IO.println "Compiled chess declarations and dependencies match"

def main (args : List String) : IO UInt32 := do
  let [sourceModule, searchDir] := args
    | throw <| IO.userError "Expected source module name and artifact search directory"
  initSearchPath (← findSysroot) [System.FilePath.mk searchDir]
  let port ← importModules #[{ module := `Cryptids.Chess }] {} (trustLevel := 0)
  let source ← importModules #[{ module := sourceModule.toName }] {} (trustLevel := 0)
  compare port source
  return 0
