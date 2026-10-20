import Lean

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
  let env ← importModules #[{module := `Cryptids.Chess.Compilation.Image}] {} 0
  let some moduleId := env.getModuleIdx? `Cryptids.Chess.Compilation.Image
    | throw <| IO.userError "Image module was not imported"
  let mut roots := env.constants.toList.foldl (init := #[]) fun acc (name, _) ↦
    if env.getModuleIdxFor? name == some moduleId
      then acc.push name else acc
  unless roots.size ≥ 40 do throw <| IO.userError "Image root inventory is incomplete"
  let imageOnly := args == ["--image-only"] || args == ["--negative-image-control"] ||
    args == ["--negative-record-control"] || args == ["--negative-valid-control"]
  if imageOnly then
    roots := #[`Chess.Compilation.Image.classify, `Chess.Compilation.Image.data,
      `Chess.Compilation.Image.getter, `Chess.Compilation.Image.post,
      `Chess.Compilation.Image.body, `Chess.Compilation.Image.generated,
      `Chess.Compilation.Image.castMachine, `Chess.Compilation.Image.machine]
  let generatorRoots : Array Name := #[]
  let mut helpers := #[]
  for name in roots do
    if let some owner := Compiler.isUnsafeRecName? name then
      let some helperInfo := env.find? name | throw <| IO.userError "Missing recursion artifact"
      let some ownerInfo := env.find? owner | throw <| IO.userError "Missing safe definition"
      unless helperInfo.isPartial && !ownerInfo.isPartial && !ownerInfo.isUnsafe &&
          helperInfo.type == ownerInfo.type do
        throw <| IO.userError s!"Unexpected compiler artifact: {name}"
      helpers := helpers.push name
  roots := roots.filter (fun n ↦ !helpers.contains n)
  IO.FS.writeFile (if imageOnly then ".lake/chess-m6-check/image-inventory.json" else
    ".lake/chess-m6-check/inventory.json") <| Json.pretty <| Json.mkObj
    [("math_roots", toJson (roots.map toString)),
     ("generator_roots", toJson (generatorRoots.map toString)),
     ("compiler_recursion_artifacts", toJson (helpers.map toString))]
  if args == ["--negative-control"] then roots := roots.push `sorryAx
  else if args == ["--unsafe-control"] then
    roots := roots.push `ConjectureMachines.Compilation.BinaryTemplates.readAux._unsafe_rec
  else if args == ["--negative-image-control"] then
    roots := roots.push `ConjectureMachines.Compilation.SharedModel.entries
  else if args == ["--negative-record-control"] then
    roots := roots.push `Chess.Compilation.Templates.writeSites
  else if args == ["--negative-valid-control"] then
    roots := roots.push `Chess.Compilation.Image.valid
  else if !args.isEmpty && !imageOnly then
    throw <| IO.userError "Unexpected audit argument"
  let mut pending := roots
  let mut seen : NameSet := {}
  let mut axioms : NameSet := {}
  let mut metaMetadata : NameSet := {}
  while let some name := pending.back? do
    pending := pending.pop
    if seen.contains name then continue
    seen := seen.insert name
    if imageOnly &&
        (#[`ConjectureMachines.Compilation.TemplateGraph.Valid,
          `ConjectureMachines.Compilation.TemplateGraph.Raw.decode,
          `ConjectureMachines.Compilation.TemplateGraph.graph,
          `ConjectureMachines.Compilation.BoolGraph.decode,
          `ConjectureMachines.Compilation.LazyGraph.asGraph,
          `ConjectureMachines.Compilation.BinaryTemplates.WriteSites,
          `Chess.Compilation.Image.valid,
          `Chess.Compilation.Templates.machine, `Chess.Compilation.Templates.decode,
          `Chess.Compilation.Image.post_runtime_dom, `Chess.Compilation.Image.post_halts_input,
          `Chess.Compilation.Image.body_halts_input, `Chess.Compilation.Image.generated_halts,
          `Chess.Compilation.Image.halts_iff].contains name ||
        (`ConjectureMachines.Compilation.RuntimeProof).isPrefixOf name ||
        (`Chess.Compilation.Binary).isPrefixOf name ||
        name == `ConjectureMachines.Compilation.SharedModel.entries ||
        name == `ConjectureMachines.Compilation.SharedModel.entry ||
        name == `ConjectureMachines.Compilation.SharedModel.machine ||
        name == `ConjectureMachines.Compilation.SharedModel.decode ||
        name == `Chess.Compilation.Templates.writeSites ||
        name == `Chess.Compilation.Templates.projectRows ||
        (`ConjectureMachines.Compilation.SharedCertificate).isPrefixOf name ||
        (`ConjectureMachines.Compilation.RuntimeCertificate).isPrefixOf name ||
        ((`ConjectureMachines.Compilation.Runtime).isPrefixOf name &&
          name != `ConjectureMachines.Compilation.Runtime.trList_append) ||
        (`Chess.Compilation.Source).isPrefixOf name ||
        (`Chess.Compilation.SourceCertificate).isPrefixOf name ||
        (name.toString.startsWith "ConjectureMachines.Compilation.SharedModel.raw") ||
        (name.toString.startsWith "ConjectureMachines.Compilation.SharedModel.stack") ||
        name == `Turing.TM2to1.tr || name == `Turing.TM2to1.trNormal ||
        (`ConjectureMachines.Compilation.TM1Normalize).isPrefixOf name) then
      throw <| IO.userError s!"Image depends on a raw witness, proof record, or control compiler: {name}"
    if name == `Chess.perfect_play_results_in_draw then
      throw <| IO.userError "Open chess conjecture is a dependency"
    let some info := env.find? name | throw <| IO.userError s!"Missing declaration: {name}"
    if (`Chess.Compilation.Templates.Generator).isPrefixOf (privateToUserName name) then
      throw <| IO.userError s!"Proof generator is a mathematical dependency: {name}"
    if isMarkedMeta env name then
      if (`Chess.Compilation.Templates).isPrefixOf (privateToUserName name) then
        throw <| IO.userError s!"Own meta dependency in mathematical closure: {name}"
      metaMetadata := metaMetadata.insert name
    if info.isUnsafe || info.isPartial then
      throw <| IO.userError s!"Unsafe or partial dependency: {name}"
    if info matches .axiomInfo _ then
      unless #[`propext, `Classical.choice, `Quot.sound].contains name do
        throw <| IO.userError s!"Forbidden axiom: {name}"
      axioms := axioms.insert name
    pending := pending ++ dependencies info
  if imageOnly then IO.println "Executable image conservatively excludes semantic/materialized dependencies even through types and proofs"
  IO.println s!"Audited {roots.size} Image roots and {seen.size} dependency declarations"
  IO.println s!"Inventoried {generatorRoots.size} meta generator roots outside the safe closure"
  IO.println s!"Inventoried {helpers.size} compiler recursion artifacts outside the safe closure"
  IO.println s!"Standard meta metadata visited without safety exemptions: {metaMetadata.toArray.qsort Name.lt}"
  IO.println s!"Permitted axioms: {axioms.toArray.qsort Name.lt}"
  IO.println "Image axiom audit passed"
