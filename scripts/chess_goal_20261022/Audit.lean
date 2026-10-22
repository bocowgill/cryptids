/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Lean

/-! Audit the complete selective returns, reverse initializer and frozen chess proof closures. -/

open Lean

private def prefixes : Array Name := #[
  `ConjectureMachines.Optimisation.SelectiveBinary, `ConjectureMachines.Compilation.FieldReturns,
  `Chess.Optimisation.FieldSelectiveLayout, `Chess.Optimisation.FieldSelective,
  `ConjectureMachines.Semantics.ChessFieldSelective, `ConjectureMachines.Machines.chess_field_selective,
  `ConjectureMachines.Compilation.FieldCompiler, `ConjectureMachines.Compilation.FieldPacking,
  `Chess.Optimisation.FieldPackedLayout, `Chess.Optimisation.FieldPacked, `Chess.Optimisation.FieldReverse,
  `Chess.Optimisation.OpenEvolveWide, `ConjectureMachines.Optimisation.ReverseInit,
  `ConjectureMachines.Semantics.ChessFieldReverse, `ConjectureMachines.Machines.chess_field_reverse]

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
  let env ← importModules #[{module := `Cryptids.Semantics.ChessFieldSelective},
    {module := `Cryptids.Semantics.ChessFieldReverse}] {} 0
  let mut roots := env.constants.toList.foldl (init := #[]) fun acc (name, _) ↦
    if prefixes.any (·.isPrefixOf name) then acc.push name else acc
  let generatorRoots := roots.filter generator
  roots := roots.filter (fun name ↦ !generatorRoots.contains name)
  for required in #[`ConjectureMachines.Optimisation.SelectiveBinary.rows,
      `ConjectureMachines.Optimisation.SelectiveBinary.haltsFrom,
      `ConjectureMachines.Optimisation.SelectiveBinary.haltsOn,
      `ConjectureMachines.Optimisation.SelectiveBinary.table_compile,
      `ConjectureMachines.Compilation.FieldReturns.write_covered,
      `ConjectureMachines.Compilation.FieldReturns.findTarget_targetAt,
      `ConjectureMachines.Compilation.FieldReturns.compact_write_covered,
      `Chess.Optimisation.FieldSelectiveLayout.coverage,
      `Chess.Optimisation.FieldSelective.generated_states,
      `Chess.Optimisation.FieldSelective.halts_iff,
      `Chess.Optimisation.FieldSelective.initialises,
      `Chess.Optimisation.FieldSelective.rowMachine_eq,
      `ConjectureMachines.Semantics.ChessFieldSelective.halts_iff_not_draw,
      `ConjectureMachines.Compilation.FieldCompiler.Codec.input_rep,
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
      `Chess.Optimisation.OpenEvolveWide.schedule_correct,
      `Chess.Optimisation.OpenEvolveWide.schedule_size,
      `Chess.Optimisation.OpenEvolveWide.cast_initialises,
      `ConjectureMachines.Optimisation.ReverseInit.Schedule.transition_prefix,
      `ConjectureMachines.Optimisation.ReverseInit.Schedule.transition_body,
      `ConjectureMachines.Optimisation.ReverseInit.Schedule.initialise_halts,
      `Chess.Optimisation.FieldReverse.prefix_states,
      `Chess.Optimisation.FieldReverse.generated_states,
      `Chess.Optimisation.FieldReverse.halts_iff,
      `Chess.Optimisation.FieldReverse.initialises,
      `Chess.Optimisation.FieldReverse.equivalent,
      `Chess.Optimisation.FieldReverse.strict_reduction,
      `Chess.Optimisation.FieldReverse.rowMachine_eq,
      `ConjectureMachines.Semantics.ChessFieldReverse.halts_iff_not_draw] do
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
  IO.println s!"Audited {roots.size} FieldSelective foundation roots and {seen.size} dependencies"
  IO.println s!"Meta certificate generator roots outside safe roots: {generatorRoots.size}"
  IO.println s!"Compiler artifacts outside safe roots: {helpers.qsort Name.lt}"
  IO.println s!"Permitted axioms: {axioms.toArray.qsort Name.lt}"
  IO.println "Chess FieldSelective foundation audit passed"
