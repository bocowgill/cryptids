/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Lean

/-! Audit the quotient, paid chess image and complete solution proof closures. -/

open Lean

private def prefixes : Array Name := #[`ConjectureMachines.Compilation.FieldBinary]

private def generator (name : Name) : Bool :=
  #[`Chess.Compilation.SourceCertificate.Generator, `Chess.Compilation.Input.Generator].any
    (·.isPrefixOf (privateToUserName name))

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
  let env ← importModules #[{module := `Cryptids.Compilation.FieldBinary.Pilot}] {} 0
  let mut roots := env.constants.toList.foldl (init := #[]) fun acc (name, _) ↦
    if prefixes.any (·.isPrefixOf name) then acc.push name else acc
  let generatorRoots := roots.filter generator
  roots := roots.filter (fun name ↦ !generatorRoots.contains name)
  for required in #[`ConjectureMachines.Compilation.FieldBinary.Routine.run_execute,
      `ConjectureMachines.Compilation.FieldBinary.Routine.result_exit,
      `ConjectureMachines.Compilation.FieldBinary.Routine.exit_stops,
      `ConjectureMachines.Compilation.FieldBinary.readAt_execute,
      `ConjectureMachines.Compilation.FieldBinary.written_nth,
      `ConjectureMachines.Compilation.FieldBinary.read_valid_cell,
      `ConjectureMachines.Compilation.FieldBinary.write_valid_cell,
      `ConjectureMachines.Compilation.FieldBinary.write_frame,
      `ConjectureMachines.Compilation.FieldBinary.moveCell_execute,
      `ConjectureMachines.Compilation.FieldBinary.read_counts,
      `ConjectureMachines.Compilation.FieldBinary.write_counts,
      `ConjectureMachines.Compilation.FieldBinary.legacy_counts,
      `ConjectureMachines.Compilation.FieldBinary.read_machine_contract,
      `ConjectureMachines.Compilation.FieldBinary.write_machine_contract,
      `ConjectureMachines.Compilation.FieldBinary.move_machine_contract] do
    unless roots.contains required do
      throw <| IO.userError s!"Required construction proof is missing: {required}"
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
  else if args == ["--negative-control-generator"] then
    roots := roots.push `Chess.Compilation.SourceCertificate.Generator.certify
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
    if generator name then
      throw <| IO.userError s!"Proof generator is a mathematical dependency: {name}"
    if info.isUnsafe || info.isPartial then
      throw <| IO.userError s!"Unsafe or partial dependency: {name}"
    if info matches .axiomInfo _ then
      unless #[`propext, `Classical.choice, `Quot.sound].contains name do
        throw <| IO.userError s!"Forbidden axiom: {name}"
      axioms := axioms.insert name
    pending := pending ++ dependencies info
  IO.println s!"Audited {roots.size} FieldBinary foundation roots and {seen.size} dependencies"
  IO.println s!"Meta certificate generator roots outside safe roots: {generatorRoots.size}"
  IO.println s!"Compiler artifacts outside safe roots: {helpers.qsort Name.lt}"
  IO.println s!"Permitted axioms: {axioms.toArray.qsort Name.lt}"
  IO.println "Chess FieldBinary foundation audit passed"
