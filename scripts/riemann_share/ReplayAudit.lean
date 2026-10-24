/-
Copyright (c) 2026 The Cryptids Authors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Lean

/-! Inspect complete private proof dependencies; this audit is not a proof oracle. -/

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
  let env ← importModules #[{module := `ShareCertificate}] {} 0
  let roots := #[`RhShare.family_exact, `RhShare.dense_range,
    `RhShare.witness_count, `RhShare.all_aliases_fail]
  let mut pending := roots
  if args == ["--negative-control"] then pending := pending.push `sorryAx
  else unless args.isEmpty do throw <| IO.userError "Unexpected audit argument"
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
  IO.println s!"Decoder-sharing certificate roots: {roots.size}"
  IO.println s!"Full-private dependencies: {seen.size}"
  IO.println s!"Permitted axioms used: {axioms.toArray.qsort Name.lt}"
  IO.println "RHSHARE_FULL_PRIVATE_AUDIT_PASSED"
