/-
Copyright 2026 The Cryptids Contributors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Lean

/-!
# Independent M7 target correspondence

Import solution and standalone literal-machine challenge in separate environments. Compare
the target type and its entire transitive declaration closure, without importing
any source module or solution proof into the challenge environment.
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

/-- Proof and regenerated runtime-alias closures are checked separately from target identity. -/
private def audit (label : String) (env : Environment) (roots : Array Name) : IO Unit := do
  let mut pending := roots
  let mut seen : NameSet := {}
  let mut axioms : NameSet := {}
  while let some name := pending.back? do
    pending := pending.pop
    if seen.contains name then continue
    seen := seen.insert name
    let some info := env.find? name | throw <| IO.userError s!"Missing {label} dependency: {name}"
    if info.isUnsafe || info.isPartial then
      throw <| IO.userError s!"Unsafe or partial {label} dependency: {name}"
    if info matches .axiomInfo _ then
      unless #[`propext, `Quot.sound, `Classical.choice].contains name do
        throw <| IO.userError s!"Forbidden {label} axiom: {name}"
      axioms := axioms.insert name
    pending := pending ++ dependencies info
  IO.println <| s!"Audited {label}: {roots.size} roots; {seen.size} declarations; " ++
    s!"axioms {axioms.toArray.qsort Name.lt}"

private def compare (port source : Environment) (referenceModule : Name) : IO Unit := do
  let goal := `ConjectureMachines.Semantics.ChessM7.halts_chess_m7_iff_not_draw
  let some proved := port.find? goal | throw <| IO.userError "Missing solution theorem"
  let some proposed := source.find? goal | throw <| IO.userError "Missing standalone goal"
  unless proved matches .thmInfo _ do throw <| IO.userError "Solution is not a theorem"
  let .thmInfo reference := proposed
    | throw <| IO.userError "Standalone goal must be an explicit reference bridge theorem"
  let .const referenceName referenceLevels := reference.value
    | throw <| IO.userError "Standalone bridge body is not a reference-goal constant"
  unless (`M6SnapshotReferenceGoals).isPrefixOf referenceName &&
      referenceLevels == reference.levelParams.map Level.param do
    throw <| IO.userError "Unexpected standalone reference-goal bridge"
  let some referenceAxiom := source.find? referenceName
    | throw <| IO.userError "Missing explicit reference-goal declaration"
  unless referenceAxiom matches .axiomInfo _ do
    throw <| IO.userError "Standalone reference goal is not an explicit axiom"
  unless (canonicalUniverses referenceAxiom).type == (canonicalUniverses proposed).type do
    throw <| IO.userError "Standalone reference-goal type differs from its bridge"
  unless (canonicalUniverses proved).type == (canonicalUniverses proposed).type do
    throw <| IO.userError "Compiled target type mismatch"
  let targets := proved.type.getUsedConstants
  let some referenceIndex := source.getModuleIdx? referenceModule
    | throw <| IO.userError "Standalone module header is missing"
  let direct := source.header.moduleData[referenceIndex]!.imports.map (·.module)
  for imported in direct do
    unless #[`Mathlib, `Lean, `Init, `Std].any (·.isPrefixOf imported) do
      throw <| IO.userError s!"Unexpected standalone direct import: {imported}"
  -- Mathlib's genuine dependencies include Aesop/Batteries/Qq. Follow the exact
  -- permitted library import graph, while excluding repository modules throughout.
  let mut libraryPending := direct
  let mut libraryModules : NameSet := {}
  while let some imported := libraryPending.back? do
    libraryPending := libraryPending.pop
    if libraryModules.contains imported then continue
    if (`Cryptids).isPrefixOf imported ||
        #[`Challenge, `ChessM5Challenge, `BusyBeaver, `BusyBeaverChallenge].contains imported then
      throw <| IO.userError s!"Repository module in standalone library imports: {imported}"
    libraryModules := libraryModules.insert imported
    let some index := source.getModuleIdx? imported
      | throw <| IO.userError s!"Missing library import header: {imported}"
    libraryPending := libraryPending ++ source.header.moduleData[index]!.imports.map (·.module)
  for imported in source.header.moduleNames do
    unless imported == referenceModule || libraryModules.contains imported do
      throw <| IO.userError s!"Unexpected standalone import: {imported}"
  let permitted : Array Name := #[`propext, `Quot.sound, `Classical.choice]
  let mut pending := targets
  let mut seen : NameSet := {}
  let mut axioms : NameSet := {}
  while let some name := pending.back? do
    pending := pending.pop
    if seen.contains name then continue
    seen := seen.insert name
    if name == goal || (`M6SnapshotReferenceGoals).isPrefixOf name ||
        name == `Chess.perfect_play_results_in_draw then
      throw <| IO.userError s!"Reference goal or open conjecture is a target dependency: {name}"
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
      throw <| IO.userError s!"Unsafe or partial target dependency: {name}"
    if a matches .axiomInfo _ then
      unless permitted.contains name do
        throw <| IO.userError s!"Forbidden target axiom: {name}"
      axioms := axioms.insert name
    pending := pending ++ dependencies a
  audit "solution proof" port #[goal]
  let mut aliases := #[]
  for (name, info) in source.constants.toList do
    if (`M6SnapshotRuntime).isPrefixOf name then
      if let some owner := Compiler.isUnsafeRecName? name then
        let some safe := source.find? owner | throw <| IO.userError "Missing runtime helper owner"
        unless info.isPartial && !safe.isPartial && !safe.isUnsafe && info.type == safe.type do
          throw <| IO.userError s!"Unexpected runtime compiler helper: {name}"
        continue
      if info.isUnsafe || info.isPartial then
        throw <| IO.userError s!"Unsafe or partial standalone runtime alias: {name}"
      aliases := aliases.push name
  audit "standalone runtime aliases" source aliases
  IO.println <| s!"Matched M7 theorem type; {targets.size} target roots; " ++
    s!"{seen.size} dependency declarations"
  IO.println s!"Permitted axioms used: {axioms.toArray.qsort Name.lt}"
  IO.println "Independent M7 target declarations and dependencies match"

def main (args : List String) : IO UInt32 := do
  let [sourceModule, searchDir] := args
    | throw <| IO.userError "Expected source module name and artifact search directory"
  initSearchPath (← findSysroot) [System.FilePath.mk searchDir]
  let port ← importModules #[{ module := `Cryptids.Semantics.ChessM7 }] {} (trustLevel := 0)
  let source ← importModules #[{ module := sourceModule.toName }] {} (trustLevel := 0)
  compare port source sourceModule.toName
  return 0
