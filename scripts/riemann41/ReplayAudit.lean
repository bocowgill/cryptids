/-
Copyright (c) 2026 The Cryptids Authors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Lean

/-! Full-private dependency audit; this executable is not a proof oracle. -/

open Lean

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
  let some level := args.head? | throw <| IO.userError "Missing checked module level"
  let moduleName := match level with
    | "literal" => `GuardLiteral | "core" => `GuardCore | "boot" => `GuardBoot
    | _ => `GuardLiteral
  unless ["literal", "core", "boot"].contains level do
    throw <| IO.userError "Invalid checked module level"
  let env ← importModules #[{module := moduleName}] {} 0
  let mut roots := #[`Rh41.all_cells, `Rh41.incoming_sources, `Rh41.incoming_only,
    `Rh41.selected_effect]
  if level != "literal" then
    roots := roots ++ #[`Rh41.step_avoids, `Rh41.separator_step, `Rh41.separator_avoids,
      `Rh41.step_overwrite, `Rh41.isolated_overwrite_of_avoidance]
  if level == "boot" then
    roots := roots ++ #[`Rh41.safeFast_sound, `Rh41.boot_safe_fast,
      `Rh41.boot_prefix_safe, `Rh41.boot_endpoint]
  let mut pending := roots
  if args.tail == ["--negative-control"] then pending := pending.push `sorryAx
  else unless args.tail.isEmpty do throw <| IO.userError "Unexpected audit arguments"
  let mut seen : NameSet := {}
  let mut axioms : NameSet := {}
  while let some name := pending.back? do
    pending := pending.pop
    if seen.contains name then continue
    seen := seen.insert name
    let some info := env.find? name | throw <| IO.userError s!"Missing declaration: {name}"
    if info.isUnsafe || info.isPartial then
      throw <| IO.userError s!"Unsafe or partial dependency: {name}"
    if info matches .axiomInfo _ then
      unless #[`propext, `Classical.choice, `Quot.sound].contains name do
        throw <| IO.userError s!"Forbidden axiom: {name}"
      axioms := axioms.insert name
    pending := pending ++ dependencies info
  IO.println s!"Checked module level: {level}"
  IO.println s!"Proof roots: {roots.size}"
  IO.println s!"Full-private dependencies: {seen.size}"
  IO.println s!"Permitted axioms used: {axioms.toArray.qsort Name.lt}"
  IO.println "RH41_FULL_PRIVATE_AUDIT_PASSED"
