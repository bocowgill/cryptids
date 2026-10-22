/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Lean

/-! Audit the quotient, paid chess image and complete solution proof closures. -/

open Lean

private def prefixes : Array Name := #[
  `ConjectureMachines.Compilation.FieldCompiler, `ConjectureMachines.Compilation.FieldPacking,
  `Chess.Optimisation.FieldPackedLayout, `Chess.Optimisation.FieldPacked,
  `ConjectureMachines.Semantics.ChessFieldPacked, `ConjectureMachines.Machines.chess_field_packed]

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
  let env ← importModules #[{module := `Cryptids.Semantics.ChessFieldPacked}] {} 0
  let mut roots := env.constants.toList.foldl (init := #[]) fun acc (name, _) ↦
    if prefixes.any (·.isPrefixOf name) then acc.push name else acc
  let generatorRoots := roots.filter generator
  roots := roots.filter (fun name ↦ !generatorRoots.contains name)
  for required in #[`ConjectureMachines.Compilation.FieldCompiler.Codec.input_rep,
      `ConjectureMachines.Compilation.FieldCompiler.Codec.write_rep,
      `ConjectureMachines.Compilation.FieldCompiler.lower_refines,
      `ConjectureMachines.Compilation.FieldCompiler.respects,
      `ConjectureMachines.Compilation.FieldCompiler.halts_input,
      `ConjectureMachines.Compilation.FieldCompiler.Snapshot.source_program,
      `ConjectureMachines.Compilation.FieldCompiler.machine_eq,
      `ConjectureMachines.Compilation.FieldPacking.machine_eq,
      `Chess.Optimisation.FieldPackedLayout.packed_nodes,
      `Chess.Optimisation.FieldPackedLayout.layout,
      `Chess.Optimisation.FieldPackedLayout.code_val,
      `Chess.Optimisation.FieldPackedLayout.complete,
      `Chess.Optimisation.FieldPackedLayout.unique,
      `ConjectureMachines.Compilation.FieldCompiler.Syntax.fastNodeAt_eq,
      `ConjectureMachines.Compilation.FieldCompiler.Syntax.nodeAt_csimp,
      `ConjectureMachines.Compilation.FieldCompiler.binaryRows_eq,
      `ConjectureMachines.Compilation.FieldCompiler.paidRows_eq,
      `Chess.Optimisation.FieldPacked.generated_states,
      `Chess.Optimisation.FieldPacked.halts_iff,
      `Chess.Optimisation.FieldPacked.initialises,
      `Chess.Optimisation.FieldPacked.equivalent,
      `Chess.Optimisation.FieldPacked.strict_reduction,
      `Chess.Optimisation.FieldPacked.rowMachine_eq,
      `ConjectureMachines.Semantics.ChessFieldPacked.halts_iff_not_draw] do
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
  IO.println s!"Audited {roots.size} FieldPacked foundation roots and {seen.size} dependencies"
  IO.println s!"Meta certificate generator roots outside safe roots: {generatorRoots.size}"
  IO.println s!"Compiler artifacts outside safe roots: {helpers.qsort Name.lt}"
  IO.println s!"Permitted axioms: {axioms.toArray.qsort Name.lt}"
  IO.println "Chess FieldPacked foundation audit passed"
