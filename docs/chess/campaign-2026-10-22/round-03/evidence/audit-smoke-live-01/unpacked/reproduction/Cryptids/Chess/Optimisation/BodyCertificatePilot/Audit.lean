import Lean

-- Intentionally not a `module`: importModules loads the full private proof
-- closure. A module's public environment can expose private proofs as axioms.
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
  -- Preserve the Lean CLI's former -M6144 allocator limit in this native driver.
  Lean.Internal.setMaxMemory (6144 * 1024 * 1024 : USize)
  let [moduleText, rootsPath, expectedText] := args
    | throw <| IO.userError "Expected module, roots file and exact root count"
  let some expected := expectedText.toNat?
    | throw <| IO.userError "Malformed expected root count"
  let mut roots : Array Name := #[]
  for raw in (← IO.FS.readFile rootsPath).splitOn "\n" do
    let text := raw.trimAscii.toString
    if !text.isEmpty then
      let name := text.toName
      unless (`Chess.Optimisation.BodyCertificatePilot).isPrefixOf name do
        throw <| IO.userError s!"Unexpected root namespace: {name}"
      if roots.contains name then throw <| IO.userError s!"Duplicate root: {name}"
      roots := roots.push name
  unless expected > 0 && roots.size == expected do
    throw <| IO.userError "Required root census mismatch"
  initSearchPath (← findSysroot)
  let env ← importModules #[{module := moduleText.toName}] {} 0
  let mut pending := roots
  let mut seen : NameSet := {}
  let mut axioms : NameSet := {}
  while let some name := pending.back? do
    pending := pending.pop
    if seen.contains name then continue
    seen := seen.insert name
    let some decl := env.find? name
      | throw <| IO.userError s!"Missing audited declaration: {name}"
    if decl.isUnsafe || decl.isPartial then
      throw <| IO.userError s!"Unsafe/partial dependency: {name}"
    let userName := privateToUserName name
    if (`Chess.Optimisation.BodyCertificatePilot.Generator).isPrefixOf userName ||
        (`ConjectureMachines.TableSyntax).isPrefixOf userName ||
        (`Chess.Compilation.SourceCertificate.Generator).isPrefixOf userName ||
        (`Chess.Compilation.Input.Generator).isPrefixOf userName ||
        userName == `Chess.perfect_play_results_in_draw then
      throw <| IO.userError s!"Forbidden generator/conjecture dependency: {name}"
    if decl matches .axiomInfo _ then
      unless #[`propext, `Classical.choice, `Quot.sound].contains name do
        throw <| IO.userError s!"Forbidden axiom dependency: {name}"
      axioms := axioms.insert name
    pending := pending ++ dependencies decl
  IO.println s!"Audited {roots.size} required roots and {seen.size} dependencies from {moduleText}"
  IO.println s!"Permitted axioms: {axioms.toArray.qsort Name.lt}"
  IO.println "Body full-private kernel root audit passed"
