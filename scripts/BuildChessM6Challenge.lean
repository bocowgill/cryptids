/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Lean

/-! Exact standalone declaration snapshots for independent challenge targets.

This is native export tooling, not a logical dependency of any target or solution.
Generated files contain fixed Expr/Declaration constructor data and kernel-checked addDecl calls.
Selected goal theorem bodies are never copied. They become explicitly labelled reference goals.
-/

open Lean

namespace ChessM6ChallengeExport

structure Config where
  source : Name := .anonymous
  output : System.FilePath := ""
  roots : Array Name := #[]
  goals : Array (Name × Name) := #[]
  bases : Array Name := #[]
  search : Array System.FilePath := #[]
  forbidden : Array Name := #[]
  autoBase : Bool := false
  traceFile : Option System.FilePath := none

private def permittedBase (name : Name) : Bool :=
  #[`Mathlib, `Lean, `Init, `Std].any (·.isPrefixOf name)

private def parse (args : List String) : Except String Config := do
  let rec go (args : List String) (cfg : Config) : Except String Config := do
    match args with
    | [] => return cfg
    | "--source" :: value :: rest => go rest {cfg with source := value.toName}
    | "--output" :: value :: rest => go rest {cfg with output := value}
    | "--root" :: value :: rest => go rest {cfg with roots := cfg.roots.push value.toName}
    | "--goal" :: value :: rest =>
      let goal ← match value.splitOn "=" with
        | [source] => pure (source.toName, source.toName)
        | [source, target] => pure (source.toName, target.toName)
        | _ => throw "--goal expects Source.theorem or Source.theorem=Reference.goal"
      go rest {cfg with goals := cfg.goals.push goal}
    | "--base" :: value :: rest =>
      unless permittedBase value.toName do throw "Base imports must be core/Lean/Std/Mathlib"
      go rest {cfg with bases := cfg.bases.push value.toName}
    | "--search" :: value :: rest => go rest {cfg with search := cfg.search.push value}
    | "--forbid" :: value :: rest => go rest {cfg with forbidden := cfg.forbidden.push value.toName}
    | "--auto-base" :: rest => go rest {cfg with autoBase := true}
    | "--trace-file" :: value :: rest => go rest {cfg with traceFile := some value}
    | _ => throw ("Expected --source, --output, --root, --goal, --base, --search, " ++
        "--forbid, --auto-base or --trace-file")
  let cfg ← go args {}
  if cfg.source.isAnonymous || cfg.output.toString.isEmpty ||
      (cfg.roots.isEmpty && cfg.goals.isEmpty) then
    throw "Require --source MODULE --output FILE and at least one --root or --goal"
  let bases := if cfg.bases.isEmpty then #[`Mathlib.Computability.TuringMachine.PostTuringMachine]
    else cfg.bases
  return {cfg with bases := #[`Lean] ++ bases}

private def dependencies (info : ConstantInfo) : Array Name := Id.run do
  let mut result := info.type.getUsedConstants
  if let some value := info.value? (allowOpaque := true) then
    result := result ++ value.getUsedConstants
  match info with
  | .inductInfo v => result := result ++ v.all.toArray ++ v.ctors.toArray
  | .ctorInfo v => result := result.push v.induct
  | .recInfo v =>
    result := result ++ v.all.toArray
    for rule in v.rules do result := result.push rule.ctor ++ rule.rhs.getUsedConstants
  | _ => pure ()
  return result

structure RuntimeEquation where
  levelParams : List Name
  type : Expr
  value : Expr
  declNames : Array Name
  wellFounded : Bool

private def runtimeEquation? (env : Environment) (name : Name) : Option RuntimeEquation := do
  if let some e := Elab.Structural.eqnInfoExt.find? env name then
    return {e with wellFounded := false}
  let e ← Elab.WF.eqnInfoExt.find? env name
  return {e with wellFounded := true}

private def wfUnfoldName (env : Environment) (name : Name) : IO Name := do
  let ordinary := name.str "eq_def"
  if let some (.thmInfo _) := env.find? ordinary then return ordinary
  throw <| IO.userError s!"Missing checked WF unfolding theorem: {ordinary}"

private def standardAxioms : Array Name := #[`propext, `Classical.choice, `Quot.sound]

private def hasSyntaxData (e : Expr) : Bool :=
  (e.find? fun sub ↦ match sub with
    | .mdata data _ => data.entries.any (fun item ↦ match item.2 with
        | .ofSyntax _ => true
        | _ => false)
    | _ => false).isSome

structure Inventory where
  names : NameSet := {}
  localNames : NameSet := {}
  mathematical : NameSet := {}

/-- Imported module provenance is selection only; the independent comparator checks identity. -/
private def baseModules (env : Environment) (cfg : Config) : IO NameSet := do
  let mut pending := cfg.bases
  let mut seen : NameSet := {}
  let modules := env.header.moduleNames
  while let some moduleName := pending.back? do
    pending := pending.pop
    if seen.contains moduleName then continue
    let some index := modules.idxOf? moduleName
      | throw <| IO.userError s!"Missing configured base module: {moduleName}"
    seen := seen.insert moduleName
    pending := pending ++ env.header.moduleData[index]!.imports.map (·.module)
  return seen

private def inBase (env : Environment) (modules : NameSet) (name : Name) : Bool :=
  match env.getModuleIdxFor? name with
  | some index => modules.contains env.header.moduleNames[index]!
  | none => false

private def collect (source : Environment) (base : NameSet) (cfg : Config) (runtime := true) :
    IO Inventory := do
  let goalNames := cfg.goals.map Prod.fst
  let mut pending := cfg.roots
  for (name, _) in cfg.goals do
    let some info := source.find? name | throw <| IO.userError s!"Missing goal {name}"
    unless info matches .thmInfo _ do
      throw <| IO.userError
        s!"Goal source must be a proved theorem (only its TYPE is exported): {name}"
    pending := pending ++ info.type.getUsedConstants
  let mut result : Inventory := {}
  while let some name := pending.back? do
    pending := pending.pop
    if result.names.contains name then continue
    if goalNames.contains name || cfg.forbidden.any (·.isPrefixOf name) then
      throw <| IO.userError s!"Forbidden solution/goal dependency in target data: {name}"
    let some info := source.find? name | throw <| IO.userError s!"Missing source dependency: {name}"
    if info.isUnsafe || info.isPartial ||
        ((info matches .opaqueInfo _) && source.contains (Compiler.mkUnsafeRecName name)) then
      throw <| IO.userError s!"Unsafe or partial target dependency: {name}"
    if info matches .axiomInfo _ then
      unless standardAxioms.contains name do
        throw <| IO.userError s!"Forbidden target axiom: {name}"
    result := {result with names := result.names.insert name}
    if !inBase source base name then
      if (Compiler.getImplementedBy? source name).isSome then
        throw <| IO.userError s!"Forbidden local implemented_by override: {name}"
      if info matches .axiomInfo _ then
        throw <| IO.userError s!"Axiom not provided by the fixed base imports: {name}"
      result := {result with localNames := result.localNames.insert name}
    pending := pending ++ dependencies info
    if runtime && !inBase source base name then
      if let some equation := runtimeEquation? source name then
        pending := pending ++ equation.value.getUsedConstants ++ equation.declNames
        if equation.wellFounded && (IR.findEnvDecl source name).isSome then
          pending := pending.push (← wfUnfoldName source name)
  return result

/-- Fixed imported library owners may replace literal copies; never select source owners. -/
private def automaticBases (env : Environment) (cfg : Config) : IO Config := do
  if !cfg.autoBase then return cfg
  let initial ← collect env (← baseModules env cfg) cfg
  let mut selected : NameSet := {}
  for base in cfg.bases do selected := selected.insert base
  for name in initial.names.toArray do
    if let some index := env.getModuleIdxFor? name then
      let owner := env.header.moduleNames[index]!
      if permittedBase owner then selected := selected.insert owner
  let mut redundant : NameSet := {}
  for root in selected.toArray do
    let some index := env.header.moduleNames.idxOf? root
      | throw <| IO.userError s!"Missing library owner: {root}"
    let mut pending := env.header.moduleData[index]!.imports.map (·.module)
    let mut seen : NameSet := {}
    while let some name := pending.back? do
      pending := pending.pop
      if seen.contains name then continue
      seen := seen.insert name
      if selected.contains name then redundant := redundant.insert name
      if let some i := env.header.moduleNames.idxOf? name then
        pending := pending ++ env.header.moduleData[i]!.imports.map (·.module)
  let bases := selected.toArray.filter fun name ↦ !redundant.contains name
  return {cfg with bases := bases.qsort Name.lt}

private def nameText : Name → String
  | .anonymous => ".anonymous"
  | .str parent value => s!"(.str {nameText parent} {reprStr value})"
  | .num parent value => s!"(.num {nameText parent} {value})"

private def listText (items : List String) : String :=
  "[" ++ String.intercalate ", " items ++ "]"

private def namesText (items : List Name) : String := listText (items.map nameText)

private def levelText : Level → Except String String
  | .zero => pure ".zero"
  | .succ u => return s!"(.succ {← levelText u})"
  | .max u v => return s!"(.max {← levelText u} {← levelText v})"
  | .imax u v => return s!"(.imax {← levelText u} {← levelText v})"
  | .param name => pure s!"(.param {nameText name})"
  | .mvar _ => throw "Universe metavariable in stored declaration"

private def binderText : BinderInfo → String
  | .default => ".default"
  | .implicit => ".implicit"
  | .strictImplicit => ".strictImplicit"
  | .instImplicit => ".instImplicit"

private def substringText (text : Substring.Raw) : String :=
  s!"(Substring.Raw.mk {reprStr text.str} ⟨{text.startPos.byteIdx}⟩ ⟨{text.stopPos.byteIdx}⟩)"

private def sourceInfoText : SourceInfo → String
  | .none => ".none"
  | .synthetic pos finish canonical =>
    s!"(.synthetic ⟨{pos.byteIdx}⟩ ⟨{finish.byteIdx}⟩ {canonical})"
  | .original leading pos trailing finish =>
    s!"(.original {substringText leading} ⟨{pos.byteIdx}⟩ " ++
      s!"{substringText trailing} ⟨{finish.byteIdx}⟩)"

private def preresolvedText : Syntax.Preresolved → String
  | .namespace ns => s!"(.namespace {nameText ns})"
  | .decl name fields => s!"(.decl {nameText name} {listText (fields.map reprStr)})"

private partial def syntaxText : Syntax → String
  | .missing => ".missing"
  | .node info kind args =>
    s!"(.node {sourceInfoText info} {nameText kind} #{listText (args.toList.map syntaxText)})"
  | .atom info value => s!"(.atom {sourceInfoText info} {reprStr value})"
  | .ident info raw name resolutions =>
    s!"(.ident {sourceInfoText info} {substringText raw} {nameText name} " ++
      s!"{listText (resolutions.map preresolvedText)})"

private def metadataText (data : MData) : Except String String := do
  let items ← data.entries.mapM fun (key, value) => do
    let value ← match value with
      | .ofString s => pure s!".ofString {reprStr s}"
      | .ofBool b => pure s!".ofBool {b}"
      | .ofName n => pure s!".ofName {nameText n}"
      | .ofNat n => pure s!".ofNat {n}"
      | .ofInt n => pure s!".ofInt ({n})"
      | .ofSyntax stx => pure s!".ofSyntax {syntaxText stx}"
    return s!"({nameText key}, ({value}))"
  return "{ entries := " ++ listText items ++ " }"

private def jsonArray (items : List Json) : Json := .arr items.toArray
private def tagged (tag : Nat) (fields : List Json := []) : Json :=
  jsonArray (toJson tag :: fields)

private def nameJson : Name → Json
  | .anonymous => tagged 0
  | .str parent text => tagged 1 [nameJson parent, toJson text]
  | .num parent n => tagged 2 [nameJson parent, toJson n]

private def levelJson : Level → Json
  | .zero => tagged 0
  | .succ u => tagged 1 [levelJson u]
  | .max u v => tagged 2 [levelJson u, levelJson v]
  | .imax u v => tagged 3 [levelJson u, levelJson v]
  | .param n => tagged 4 [nameJson n]
  | .mvar _ => tagged 999

private def substringJson (s : Substring.Raw) : Json :=
  jsonArray [toJson s.str, toJson s.startPos.byteIdx, toJson s.stopPos.byteIdx]

private def sourceInfoJson : SourceInfo → Json
  | .none => tagged 0
  | .synthetic p e c => tagged 1 [toJson p.byteIdx, toJson e.byteIdx, toJson c]
  | .original a p b e => tagged 2
      [substringJson a, toJson p.byteIdx, substringJson b, toJson e.byteIdx]

private def resolutionJson : Syntax.Preresolved → Json
  | .namespace n => tagged 0 [nameJson n]
  | .decl n fields => tagged 1 [nameJson n, toJson fields]

private partial def syntaxJson : Syntax → Json
  | .missing => tagged 0
  | .node i k a => tagged 1 [sourceInfoJson i, nameJson k, .arr (a.map syntaxJson)]
  | .atom i s => tagged 2 [sourceInfoJson i, toJson s]
  | .ident i r n p => tagged 3
      [sourceInfoJson i, substringJson r, nameJson n, jsonArray (p.map resolutionJson)]

private def dataValueJson : DataValue → Json
  | .ofString s => tagged 0 [toJson s]
  | .ofBool b => tagged 1 [toJson b]
  | .ofName n => tagged 2 [nameJson n]
  | .ofNat n => tagged 3 [toJson n]
  | .ofInt n => tagged 4 [toJson n]
  | .ofSyntax stx => tagged 5 [syntaxJson stx]

private def metadataJson (data : MData) : Json :=
  jsonArray (data.entries.map fun (n,v) ↦ jsonArray [nameJson n, dataValueJson v])

private def binderNat : BinderInfo → Nat
  | .default => 0 | .implicit => 1 | .strictImplicit => 2 | .instImplicit => 3

private def nodeJson (e : Expr) (child : Expr → Json) : Json :=
  match e with
  | .bvar n => tagged 0 [toJson n]
  | .sort u => tagged 1 [levelJson u]
  | .const n us => tagged 2 [nameJson n, jsonArray (us.map levelJson)]
  | .app f a => tagged 3 [child f, child a]
  | .lam n t b bi => tagged 4 [nameJson n, child t, child b, toJson (binderNat bi)]
  | .forallE n t b bi => tagged 5 [nameJson n, child t, child b, toJson (binderNat bi)]
  | .letE n t v b nd => tagged 6 [nameJson n, child t, child v, child b, toJson nd]
  | .lit (.natVal n) => tagged 7 [toJson n]
  | .lit (.strVal s) => tagged 8 [toJson s]
  | .proj n i e => tagged 9 [nameJson n, toJson i, child e]
  | .mdata d b => tagged 10 [metadataJson d, child b]
  | _ => tagged 999

structure EmitState where
  expressions : Std.HashMap ExprStructEq Nat := {}
  nodes : Array String := #[]
  encodedNodes : Array Json := #[]
  declarations : Array String := #[]
  declarationNames : Array (Array Name) := #[]
  predefOwners : Array Name := #[]
  checks : Array String := #[]
  metadata : Array String := #[]
  predefs : Array String := #[]
  runtime : Array String := #[]
  runtimeDone : NameSet := {}
  runtimeActive : NameSet := {}
  done : NameSet := {}
  active : NameSet := {}

abbrev EmitM := StateRefT EmitState IO

private def getInfo (env : Environment) (name : Name) : IO ConstantInfo := do
  let some info := env.find? name | throw <| IO.userError s!"Missing declaration: {name}"
  return info

private def fromExcept (result : Except String α) : IO α :=
  match result with
  | .ok value => pure value
  | .error message => throw <| IO.userError message

private partial def exprText (expr : Expr) : EmitM String := do
  if let some i := (← get).expressions[(⟨expr⟩ : ExprStructEq)]? then return s!"(pool[{i}]!)"
  let term ← match expr with
    | .bvar i => pure s!".bvar {i}"
    | .sort u => pure s!".sort {← fromExcept (levelText u)}"
    | .const name levels =>
      pure s!".const {nameText name} {listText (← fromExcept (levels.mapM levelText))}"
    | .app f a => pure s!".app {← exprText f} {← exprText a}"
    | .lam name type body binder =>
      pure s!".lam {nameText name} {← exprText type} {← exprText body} {binderText binder}"
    | .forallE name type body binder =>
      pure s!".forallE {nameText name} {← exprText type} {← exprText body} {binderText binder}"
    | .letE name type value body nondep =>
      pure s!".letE {nameText name} {← exprText type} {← exprText value} {← exprText body} {nondep}"
    | .lit (.natVal value) => pure s!".lit (.natVal {value})"
    | .lit (.strVal value) => pure s!".lit (.strVal {reprStr value})"
    | .proj name i value => pure s!".proj {nameText name} {i} {← exprText value}"
    | .mdata data body => pure s!".mdata ({← fromExcept (metadataText data)}) {← exprText body}"
    | .fvar _ => throw <| IO.userError "Free variable in stored declaration"
    | .mvar _ => throw <| IO.userError "Expression metavariable in stored declaration"
  let i := (← get).nodes.size
  let state ← get
  let encoded := nodeJson expr fun child ↦
    toJson (state.expressions[(⟨child⟩ : ExprStructEq)]!)
  modify fun s => {s with
    expressions := s.expressions.insert ⟨expr⟩ i
    nodes := s.nodes.push term
    encodedNodes := s.encodedNodes.push encoded}
  return s!"(pool[{i}]!)"

private def constantFields (info : ConstantInfo) : EmitM String := do
  return s!"name := {nameText info.name}, levelParams := {namesText info.levelParams}, " ++
    s!"type := {← exprText info.type}"

private def generatedInfoText (info : ConstantInfo) : EmitM String := do
  let fields ← constantFields info
  match info with
  | .inductInfo v =>
    return ".inductInfo { " ++ fields ++
      s!", numParams := {v.numParams}, numIndices := {v.numIndices}, " ++
      s!"all := {namesText v.all}, ctors := {namesText v.ctors}, numNested := {v.numNested}, " ++
      s!"isRec := {v.isRec}, isUnsafe := false, isReflexive := {v.isReflexive}" ++ " }"
  | .ctorInfo v =>
    return ".ctorInfo { " ++ fields ++
      s!", induct := {nameText v.induct}, cidx := {v.cidx}, numParams := {v.numParams}, " ++
      s!"numFields := {v.numFields}, isUnsafe := false" ++ " }"
  | .recInfo v =>
    let rules ← v.rules.mapM fun rule => do
      return "{ " ++ s!"ctor := {nameText rule.ctor}, nfields := {rule.nfields}, " ++
        s!"rhs := {← exprText rule.rhs}" ++ " }"
    return ".recInfo { " ++ fields ++
      s!", all := {namesText v.all}, numParams := {v.numParams}, numIndices := {v.numIndices}, " ++
      s!"numMotives := {v.numMotives}, numMinors := {v.numMinors}, rules := {listText rules}, " ++
      s!"k := {v.k}, isUnsafe := false" ++ " }"
  | _ => throw <| IO.userError s!"Not kernel-generated inductive data: {info.name}"

private def pushDeclaration (text : String) (names : Array Name := #[]) : EmitM Unit :=
  modify fun s => {s with
    declarations := s.declarations.push text
    declarationNames := s.declarationNames.push names}

private def inductiveParent (info : ConstantInfo) : Option Name :=
  match info with
  | .inductInfo v => v.all.head?
  | .ctorInfo v => some v.induct
  | .recInfo v => v.all.head?
  | _ => none

/-- Erase only Lean's diagnostic recursion annotations, never mathematical target syntax. -/
private partial def eraseDiagnosticRecApp (e : Expr) : Expr :=
  e.replace fun sub ↦ match sub with
    | .mdata data body => if data.isRecApp then some (eraseDiagnosticRecApp body) else none
    | _ => none

private def cleanExtraCertificate (info : ConstantInfo) : ConstantInfo :=
  match info with
  | .thmInfo v => .thmInfo {v with value := eraseDiagnosticRecApp v.value}
  | other => other

private partial def emitConstant (env : Environment) (inventory : Inventory) (name : Name) :
    EmitM Unit := do
  if !inventory.localNames.contains name || (← get).done.contains name then return
  let original ← getInfo env name
  let info := if inventory.mathematical.contains name then original
    else cleanExtraCertificate original
  if let some parent := inductiveParent info then
    let .inductInfo parentInfo ← getInfo env parent
      | throw <| IO.userError s!"Unsupported inductive parent of {name}: {parent}"
    let group := parentInfo.all.toArray
    let state ← get
    if group.any state.active.contains then return
    if group.all state.done.contains then
      -- Nested recursors are generated by the same inductDecl; checked below.
      modify fun s => {s with done := s.done.insert name}
      return
    modify fun s => {s with active := group.foldl (fun set n ↦ set.insert n) s.active}
    let mut types : Array String := #[]
    let mut generated := group
    for typeName in group do
      let .inductInfo typeInfo ← getInfo env typeName
        | throw <| IO.userError s!"Invalid inductive group member: {typeName}"
      for dep in typeInfo.type.getUsedConstants do emitConstant env inventory dep
      let mut constructors : Array String := #[]
      for ctor in typeInfo.ctors do
        let ctorInfo ← getInfo env ctor
        for dep in ctorInfo.type.getUsedConstants do emitConstant env inventory dep
        constructors := constructors.push
          ("{ " ++ s!"name := {nameText ctor}, type := {← exprText ctorInfo.type}" ++ " }")
        generated := generated.push ctor
      types := types.push ("{ " ++
        s!"name := {nameText typeName}, type := {← exprText typeInfo.type}, " ++
        s!"ctors := {listText constructors.toList}" ++ " }")
      generated := generated.push (typeName ++ `rec)
    pushDeclaration (s!".inductDecl {namesText parentInfo.levelParams} {parentInfo.numParams} " ++
      s!"{listText types.toList} false") group
    modify fun s => {s with
      done := generated.foldl (fun set n ↦ set.insert n) s.done
      active := group.foldl (fun set n ↦ set.erase n) s.active}
    return
  if (← get).active.contains name then
    throw <| IO.userError s!"Unsupported non-inductive dependency cycle: {name}"
  modify fun s => {s with active := s.active.insert name}
  for dep in dependencies info do emitConstant env inventory dep
  let fields ← constantFields info
  let text ← match info with
    | .defnInfo v =>
      let hints := match v.hints with
        | .opaque => ".opaque" | .abbrev => ".abbrev"
        | .regular height => s!".regular {height.toNat}"
      pure (".defnDecl { " ++ s!"{fields}, value := {← exprText v.value}, hints := {hints}, " ++
        s!"safety := .safe, all := {namesText v.all}" ++ " }")
    | .thmInfo v => pure (".thmDecl { " ++ s!"{fields}, value := {← exprText v.value}, " ++
        s!"all := {namesText v.all}" ++ " }")
    | .opaqueInfo v => pure (".opaqueDecl { " ++ s!"{fields}, value := {← exprText v.value}, " ++
        s!"isUnsafe := false, all := {namesText v.all}" ++ " }")
    | _ => throw <| IO.userError s!"Unsupported stored declaration kind: {name}"
  pushDeclaration text #[name]
  modify fun s => {s with done := s.done.insert name, active := s.active.erase name}

private def runtimeAlias (name : Name) : Name :=
  .str `M6SnapshotRuntime name.toString

private def inlineKindText : Compiler.InlineAttributeKind → String
  | .inline => ".inline"
  | .noinline => ".noinline"
  | .macroInline => ".macroInline"
  | .inlineIfReduce => ".inlineIfReduce"
  | .alwaysInline => ".alwaysInline"

private def reducibilityText : ReducibilityStatus → String
  | .reducible => ".reducible"
  | .instanceReducible => ".instanceReducible"
  | .implicitReducible => ".implicitReducible"
  | .semireducible => ".semireducible"
  | .irreducible => ".irreducible"

private def matcherInfoText (info : Meta.MatcherInfo) : String := Id.run do
  let alternatives := info.altInfos.toList.map fun a ↦
    "{ " ++ s!"numFields := {a.numFields}, numOverlaps := {a.numOverlaps}, " ++
      s!"hasUnitThunk := {a.hasUnitThunk}" ++ " }"
  let discriminants := info.discrInfos.toList.map fun d ↦
    "{ hName? := " ++ (d.hName?.map (fun n ↦ s!"some {nameText n}") |>.getD "none") ++ " }"
  let overlaps := info.overlaps.map.toList.map fun (key, set) ↦
    s!"({key}, Std.TreeSet.ofList {listText (set.toList.map toString)})"
  let universePosition := info.uElimPos?.map (fun n ↦ s!"some {n}") |>.getD "none"
  return "{ " ++ s!"numParams := {info.numParams}, numDiscrs := {info.numDiscrs}, " ++
    s!"altInfos := #{listText alternatives}, uElimPos? := {universePosition}, " ++
    s!"discrInfos := #{listText discriminants}, " ++
    "overlaps := { map := Std.HashMap.ofList " ++ listText overlaps ++ " } }"

private def emitMetadata (env : Environment) (name : Name) : EmitM Unit := do
  let mut command := "run_elab do\n"
  if let some matcher := Meta.getMatcherInfoCore? env name then
    command := command ++
      s!"  Meta.Match.addMatcherInfo {nameText name} ({matcherInfoText matcher})\n"
  if let some projection := env.getProjectionFnInfo? name then
    command := command ++ s!"  modifyEnv (addProjectionFnInfo · {nameText name} " ++
      s!"{nameText projection.ctorName} {projection.numParams} {projection.i} " ++
      s!"{projection.fromClass})\n"
  if let some projection := env.getAuxParentProjectionInfo? name then
    command := command ++ s!"  modifyEnv (addAuxParentProjectionInfo · {nameText name} " ++
      s!"{projection.numParams} {projection.fromClass})\n"
  if isAuxRecursor env name then
    command := command ++ s!"  modifyEnv (markAuxRecursor · {nameText name})\n"
  if isSparseCasesOn env name then
    command := command ++ s!"  modifyEnv (markSparseCasesOn · {nameText name})\n"
  if let some kind := Compiler.getInlineAttribute? env name then
    command := command ++
      s!"  match Compiler.setInlineAttribute (← getEnv) {nameText name} " ++
      s!"{inlineKindText kind} with\n" ++
      "  | .ok env => setEnv env\n  | .error message => throwError message\n"
  if (env.find? name).any (· matches .defnInfo _) then
    command := command ++
      s!"  setReducibilityStatus {nameText name} " ++
      s!"{reducibilityText (getReducibilityStatusCore env name)}\n"
  if command != "run_elab do\n" then
    modify fun state => {state with metadata := state.metadata.push command}

private partial def emitRuntime (env : Environment) (inventory : Inventory) (name : Name) :
    EmitM Unit := do
  if !inventory.localNames.contains name || (← get).runtimeDone.contains name then return
  if (IR.findEnvDecl env name).isNone then return
  let info ← getInfo env name
  if let some equation := runtimeEquation? env name then
    let group := equation.declNames
    let state ← get
    if group.any state.runtimeActive.contains then return
    modify fun state => {state with
      runtimeActive := group.foldl (fun set name ↦ set.insert name) state.runtimeActive}
    for member in group do
      let some eqn := runtimeEquation? env member
        | throw <| IO.userError s!"Missing structural source form: {member}"
      for dep in eqn.value.getUsedConstants do emitRuntime env inventory dep
    let mut ids : Array String := #[]
    for member in group do
      let some eqn := runtimeEquation? env member
        | throw <| IO.userError s!"Missing structural source form: {member}"
      let id := (← get).predefs.size
      let data := "{ ref := .missing, kind := .def, modifiers := default, " ++
        s!"declName := {nameText (runtimeAlias member)}, " ++
        s!"levelParams := {namesText eqn.levelParams}, " ++
        s!"type := {← exprText eqn.type}, " ++
        s!"value := {← exprText (eraseDiagnosticRecApp eqn.value)}, " ++
        "binders := .missing, termination := default }"
      modify fun state => {state with
        predefs := state.predefs.push data
        predefOwners := state.predefOwners.push member}
      ids := ids.push s!"p{id}"
    let originals := "#" ++ namesText group.toList
    let aliases := "#" ++ namesText (group.toList.map runtimeAlias)
    let mut command := "run_elab withOptions (fun opts => " ++
      "opts.setBool `backward.privateInPublic true) do\n" ++
      s!"  let oldNames : Array Name := {originals}\n" ++
      s!"  let newNames : Array Name := {aliases}\n" ++
      s!"  let predefs : Array Elab.PreDefinition := #{listText ids.toList}\n"
    if equation.wellFounded then
      command := command ++ "  let pool := expressions\n"
      for i in [:group.size] do
        let member := group[i]!
        let memberInfo ← getInfo env member
        let sourceForm := (runtimeAlias member).str "source_equation"
        let unfolding ← wfUnfoldName env member
        command := command ++ s!"  let sourceForm := predefs[{i}]!\n" ++
          s!"  let original := mkConst {nameText member} " ++
          s!"({namesText memberInfo.levelParams}.map Level.param)\n" ++
          "  let expected ← Meta.lambdaTelescope sourceForm.value fun xs rhs => do\n" ++
          "    Meta.mkForallFVars xs (← Meta.mkEq (mkAppN original xs) rhs)\n" ++
          "  Lean.addDecl (.thmDecl { " ++ s!"name := {nameText sourceForm}, " ++
          s!"levelParams := {namesText memberInfo.levelParams}, type := expected, " ++
          s!"value := mkConst {nameText unfolding} " ++
          s!"({namesText memberInfo.levelParams}.map Level.param)" ++
          " }) (forceExpose := true)\n"
        let .defnInfo definition := memberInfo
          | throw <| IO.userError s!"WF source is not a safe definition: {member}"
        let fields ← constantFields memberInfo
        let value ← exprText definition.value
        -- The alias's safe mathematical body is the exact original kernel body.
        let aliasFields := fields.replace
          ("name := " ++ nameText member ++ ",")
          ("name := " ++ nameText (runtimeAlias member) ++ ",")
        command := command ++ "  Lean.addDecl (.defnDecl { " ++ aliasFields ++
          s!", value := (let pool := expressions; {value}), hints := .opaque, safety := .safe" ++
          " }) (forceExpose := true)\n"
    command := command ++
      "  let predefs := predefs.map fun p => {p with value := p.value.replace fun e =>\n" ++
      "    match e with\n" ++
      "    | .const name levels =>\n" ++
      "      (oldNames.idxOf? name).map fun i => .const newNames[i]! levels\n" ++
      "    | _ => none }\n"
    if equation.wellFounded then
      command := command ++ "  Elab.addAndCompilePartialRec (default, default) predefs\n"
    else
      command := command ++
        "  Elab.Structural.structuralRecursion (default, default) predefs " ++
        "(Array.replicate predefs.size none)\n"
    for member in group do
      let memberInfo ← getInfo env member
      let proof := (runtimeAlias member).str "eq_original"
      command := command ++
        s!"  let original := mkConst {nameText member} " ++
        s!"({namesText memberInfo.levelParams}.map Level.param)\n" ++
        s!"  let replacement := mkConst {nameText (runtimeAlias member)} " ++
        s!"({namesText memberInfo.levelParams}.map Level.param)\n" ++
        "  let equality ← Meta.mkEq original replacement\n" ++
        "  let reflexivity ← Meta.mkEqRefl original\n" ++
        "  Lean.addDecl (.thmDecl { " ++ s!"name := {nameText proof}, " ++
        s!"levelParams := {namesText memberInfo.levelParams}, " ++
        "type := equality, value := reflexivity" ++
        " }) (forceExpose := true)\n" ++
        s!"  Compiler.CSimp.add {nameText proof} .global\n"
    modify fun state => {state with
      runtime := state.runtime.push command
      runtimeDone := group.foldl (fun set name ↦ set.insert name) state.runtimeDone
      runtimeActive := group.foldl (fun set name ↦ set.erase name) state.runtimeActive}
  else
    if (← get).runtimeActive.contains name then
      throw <| IO.userError s!"Unsupported executable recursion (no structural source form): {name}"
    if (env.find? (Compiler.mkUnsafeRecName name)).isSome then
      throw <| IO.userError s!"Unsupported executable recursion (no structural source form): {name}"
    modify fun state => {state with runtimeActive := state.runtimeActive.insert name}
    for dep in dependencies info do emitRuntime env inventory dep
    modify fun state => {state with
      runtime := state.runtime.push s!"run_elab Lean.compileDecls #[{nameText name}]\n"
      runtimeDone := state.runtimeDone.insert name
      runtimeActive := state.runtimeActive.erase name}

private def decoderSource : String := r#"
private def jsonAt (j : Json) (i : Nat) : Except String Json := j.getArrVal? i
private def natAt (j : Json) (i : Nat) : Except String Nat := (jsonAt j i).bind Json.getNat?
private def strAt (j : Json) (i : Nat) : Except String String := (jsonAt j i).bind Json.getStr?
private def boolAt (j : Json) (i : Nat) : Except String Bool := (jsonAt j i).bind Json.getBool?
private def arrAt (j : Json) (i : Nat) : Except String (Array Json) :=
  (jsonAt j i).bind Json.getArr?

private partial def nameFromJson (j : Json) : Except String Name := do
  match ← natAt j 0 with
  | 0 => return .anonymous
  | 1 => return .str (← nameFromJson (← jsonAt j 1)) (← strAt j 2)
  | 2 => return .num (← nameFromJson (← jsonAt j 1)) (← natAt j 2)
  | _ => throw "Invalid fixed Name tag"

private partial def levelFromJson (j : Json) : Except String Level := do
  match ← natAt j 0 with
  | 0 => return .zero
  | 1 => return .succ (← levelFromJson (← jsonAt j 1))
  | 2 => return .max (← levelFromJson (← jsonAt j 1)) (← levelFromJson (← jsonAt j 2))
  | 3 => return .imax (← levelFromJson (← jsonAt j 1)) (← levelFromJson (← jsonAt j 2))
  | 4 => return .param (← nameFromJson (← jsonAt j 1))
  | _ => throw "Invalid fixed Level tag"

private def substringFromJson (j : Json) : Except String Substring.Raw := do
  return ⟨← strAt j 0, ⟨← natAt j 1⟩, ⟨← natAt j 2⟩⟩

private def sourceInfoFromJson (j : Json) : Except String SourceInfo := do
  match ← natAt j 0 with
  | 0 => return .none
  | 1 => return .synthetic ⟨← natAt j 1⟩ ⟨← natAt j 2⟩ (← boolAt j 3)
  | 2 => return .original (← substringFromJson (← jsonAt j 1)) ⟨← natAt j 2⟩
          (← substringFromJson (← jsonAt j 3)) ⟨← natAt j 4⟩
  | _ => throw "Invalid fixed SourceInfo tag"

private def resolutionFromJson (j : Json) : Except String Syntax.Preresolved := do
  match ← natAt j 0 with
  | 0 => return .namespace (← nameFromJson (← jsonAt j 1))
  | 1 => return .decl (← nameFromJson (← jsonAt j 1))
          (← (← arrAt j 2).toList.mapM Json.getStr?)
  | _ => throw "Invalid fixed Preresolved tag"

private partial def syntaxFromJson (j : Json) : Except String Syntax := do
  match ← natAt j 0 with
  | 0 => return .missing
  | 1 => return .node (← sourceInfoFromJson (← jsonAt j 1))
          (← nameFromJson (← jsonAt j 2)) (← (← arrAt j 3).mapM syntaxFromJson)
  | 2 => return .atom (← sourceInfoFromJson (← jsonAt j 1)) (← strAt j 2)
  | 3 => return .ident (← sourceInfoFromJson (← jsonAt j 1))
          (← substringFromJson (← jsonAt j 2)) (← nameFromJson (← jsonAt j 3))
          (← (← arrAt j 4).toList.mapM resolutionFromJson)
  | _ => throw "Invalid fixed Syntax tag"

private def valueFromJson (j : Json) : Except String DataValue := do
  match ← natAt j 0 with
  | 0 => return .ofString (← strAt j 1)
  | 1 => return .ofBool (← boolAt j 1)
  | 2 => return .ofName (← nameFromJson (← jsonAt j 1))
  | 3 => return .ofNat (← natAt j 1)
  | 4 => return .ofInt (← (← jsonAt j 1).getInt?)
  | 5 => return .ofSyntax (← syntaxFromJson (← jsonAt j 1))
  | _ => throw "Invalid fixed DataValue tag"

private def metadataFromJson (j : Json) : Except String MData := do
  let entries ← (← j.getArr?).toList.mapM fun item => do
    return (← nameFromJson (← jsonAt item 0), ← valueFromJson (← jsonAt item 1))
  return {entries}

private def binderFromNat : Nat → Except String BinderInfo
  | 0 => .ok .default
  | 1 => .ok .implicit
  | 2 => .ok .strictImplicit
  | 3 => .ok .instImplicit
  | _ => .error "Invalid fixed BinderInfo tag"

private def exprFromJson (pool : Array Expr) (j : Json) : Except String Expr := do
  let child (i : Nat) : Except String Expr := do
    let index ← natAt j i
    let some e := pool[index]? | throw "Fixed Expr DAG has a forward/out-of-range reference"
    return e
  match ← natAt j 0 with
  | 0 => return .bvar (← natAt j 1)
  | 1 => return .sort (← levelFromJson (← jsonAt j 1))
  | 2 => return .const (← nameFromJson (← jsonAt j 1))
          (← (← arrAt j 2).toList.mapM levelFromJson)
  | 3 => return .app (← child 1) (← child 2)
  | 4 => return .lam (← nameFromJson (← jsonAt j 1)) (← child 2) (← child 3)
          (← binderFromNat (← natAt j 4))
  | 5 => return .forallE (← nameFromJson (← jsonAt j 1)) (← child 2) (← child 3)
          (← binderFromNat (← natAt j 4))
  | 6 => return .letE (← nameFromJson (← jsonAt j 1)) (← child 2) (← child 3)
          (← child 4) (← boolAt j 5)
  | 7 => return .lit (.natVal (← natAt j 1))
  | 8 => return .lit (.strVal (← strAt j 1))
  | 9 => return .proj (← nameFromJson (← jsonAt j 1)) (← natAt j 2) (← child 3)
  | 10 => return .mdata (← metadataFromJson (← jsonAt j 1)) (← child 2)
  | _ => throw "Invalid fixed Expr tag"

private def decodeExpressions (chunks : Array String) : Except String (Array Expr) := do
  let mut pool := #[]
  for text in chunks do
    let rows ← (← Json.parse text).getArr?
    for row in rows do pool := pool.push (← exprFromJson pool row)
  return pool
"#

private def snapshotText (cfg : Config) (state : EmitState) : String := Id.run do
  let mut text := "/- Fixed standalone target snapshot. No source/solution imports. -/\nmodule\n"
  for base in cfg.bases do
    text := text ++ s!"public import {base}\nimport all {base}\n"
  text := text ++ "public meta import Lean.Elab.PreDefinition.Structural.Main\n" ++
    "public meta import Lean.Elab.PreDefinition.Basic\n"
  text := text ++ "\nopen Lean\nset_option Elab.async false\nset_option maxRecDepth 32768\n"
  text := text ++ "set_option linter.style.longLine false\n"
  text := text ++ "\nnamespace M6SnapshotConstructorData\nmeta section\n"
  text := text ++ "private def reportPhase (message : String) : CoreM Unit := do\n" ++
    "  let now ← IO.monoMsNow\n"
  if let some path := cfg.traceFile then
    text := text ++ s!"  IO.FS.withFile {reprStr path.toString} .append fun handle => do\n" ++
      "    handle.putStrLn s!\"{now}: {message}\"\n    handle.flush\n"
  text := text ++ "  let stream ← IO.getStderr\n" ++
    "  stream.putStrLn s!\"{now}: {message}\"\n  stream.flush\n" ++
    "run_elab reportPhase \"M6 snapshot phase: imports ready\"\n" ++
    decoderSource ++ "\n" ++
    "run_elab reportPhase \"M6 snapshot phase: fixed decoder ready\"\n"
  let mut chunks : Array String := #[]
  for start in [: (state.encodedNodes.size + 255) / 256] do
    let chunk := state.encodedNodes.extract (start * 256) ((start + 1) * 256)
    chunks := chunks.push (reprStr (Json.arr chunk).compress)
  text := text ++ "private def expressionData : Array String := #[\n" ++
    String.intercalate ",\n" chunks.toList ++ "\n]\n"
  text := text ++
    "run_elab reportPhase \"M6 snapshot phase: literal data ready\"\n" ++
    "private def expressionResult := decodeExpressions expressionData\n" ++
    "private def expressions : Array Expr := expressionResult.toOption.getD #[]\n" ++
    "run_elab do\n  reportPhase \"M6 snapshot phase: decode Expr pool\"\n" ++
    "  match expressionResult with\n" ++
    "  | .ok pool => reportPhase s!\"M6 snapshot Expr pool: {pool.size} nodes\"\n" ++
    "  | .error message => throwError message\n"
  -- Compile constructor payloads as bounded functions of the already decoded pool.
  -- Every payload is replayed in its original dependency order through the kernel.
  for batch in [:(state.declarations.size + 63) / 64] do
    let start := batch * 64
    let stop := min (start + 64) state.declarations.size
    let payloads := state.declarations.extract start stop
    text := text ++ s!"private def declarations{batch} (pool : Array Expr) : " ++
      "Array Declaration := #[\n  " ++ String.intercalate ",\n  " payloads.toList ++ "\n]\n"
    text := text ++ "run_elab withOptions " ++
      "(fun opts => opts.setBool `backward.privateInPublic true) do\n" ++
      s!"  reportPhase \"M6 snapshot phase: logical d{start}; helper batch {batch} ready\"\n" ++
      s!"  for declaration in declarations{batch} expressions do\n" ++
      "    Lean.addDecl declaration (forceExpose := true)\n" ++
      "    match declaration with\n" ++
      "    | .inductDecl _ _ types _ => Lean.compileDecls (types.toArray.map (·.name))\n" ++
      "    | _ => pure ()\n" ++
      s!"  reportPhase \"M6 snapshot phase: kernel complete through d{stop - 1}\"\n"
  for i in [:state.predefs.size] do
    text := text ++ s!"private def p{i} : Elab.PreDefinition :=\n" ++
      s!"  let pool := expressions\n  {state.predefs[i]!}\n"
  text := text ++ "\n-- Assert exact kernel-generated inductive metadata and reduction rules.\n"
  text := text ++ "private def sameGenerated (a b : ConstantInfo) : Bool :=\n" ++
    "  match a, b with\n" ++
    "  | .inductInfo a, .inductInfo b => a == b\n" ++
    "  | .ctorInfo a, .ctorInfo b => a == b\n" ++
    "  | .recInfo a, .recInfo b => a == b\n" ++
    "  | _, _ => false\n"
  for batch in [:(state.checks.size + 63) / 64] do
    let start := batch * 64
    let stop := min (start + 64) state.checks.size
    let payloads := state.checks.extract start stop
    text := text ++ s!"private def checks{batch} (pool : Array Expr) : " ++
      "Array ConstantInfo := #[\n  " ++ String.intercalate ",\n  " payloads.toList ++ "\n]\n"
    text := text ++ s!"run_elab do\n  reportPhase \"M6 snapshot phase: checks {start}\"\n" ++
      s!"  for expected in checks{batch} expressions do\n" ++
      "    let some actual := (← getEnv).find? expected.name\n" ++
      "      | throwError m!\"Missing generated declaration: {expected.name}\"\n" ++
      "    unless sameGenerated actual expected do\n" ++
      "      throwError m!\"Changed generated metadata: {expected.name}\"\n"
  text := text ++ "\n-- Runtime metadata and checked equalities; no imported runtime code.\n"
  text := text ++ "run_elab reportPhase \"M6 snapshot phase: runtime metadata\"\n"
  for batch in [:(state.metadata.size + 63) / 64] do
    text := text ++ "run_elab do\n" ++
      s!"  reportPhase \"M6 snapshot phase: metadata batch {batch}\"\n"
    for command in state.metadata.extract (batch * 64) ((batch + 1) * 64) do
      -- Keep every original action and its do-block scope, changing only JIT granularity.
      let body := (command.drop "run_elab ".length).toString
      text := text ++ String.intercalate "\n" (body.splitOn "\n" |>.map ("  " ++ ·)) ++ "\n"
  let mut pending : Array String := #[]
  let mut runtimeBatch := 0
  for command in state.runtime do
    if command.startsWith "run_elab Lean.compileDecls " then
      pending := pending.push (command.drop "run_elab ".length).toString
      if pending.size == 64 then
        text := text ++ "run_elab do\n" ++
          s!"  reportPhase \"M6 snapshot phase: runtime batch {runtimeBatch}\"\n" ++
          String.intercalate "" (pending.toList.map ("  " ++ ·))
        pending := #[]
        runtimeBatch := runtimeBatch + 1
    else
      if !pending.isEmpty then
        text := text ++ "run_elab do\n" ++
          s!"  reportPhase \"M6 snapshot phase: runtime batch {runtimeBatch}\"\n" ++
          String.intercalate "" (pending.toList.map ("  " ++ ·))
        pending := #[]
        runtimeBatch := runtimeBatch + 1
      text := text ++ command
  if !pending.isEmpty then
    text := text ++ "run_elab do\n" ++
      s!"  reportPhase \"M6 snapshot phase: runtime batch {runtimeBatch}\"\n" ++
      String.intercalate "" (pending.toList.map ("  " ++ ·))
  text := text ++ "run_elab reportPhase \"M6 snapshot phase: complete\"\n"
  return text ++ "\nend\nend M6SnapshotConstructorData\n"

private unsafe def execute (cfg : Config) : IO Unit := do
  enableInitializersExecution
  initSearchPath (← findSysroot) cfg.search.toList
  let imports := #[{module := cfg.source, importAll := true}] ++
    cfg.bases.map fun name ↦ {module := name, importAll := true}
  let source ← importModules imports {} (trustLevel := 0) (loadExts := true)
  let cfg ← automaticBases source cfg
  let base ← baseModules source cfg
  let mathematical ← collect source base cfg (runtime := false)
  let inventory ← collect source base cfg
  let inventory := {inventory with mathematical := mathematical.names}
  let (_, state) ← (do
    for name in inventory.localNames.toArray.qsort Name.lt do emitConstant source inventory name
    for name in inventory.localNames.toArray.qsort Name.lt do
      let info ← getInfo source name
      if (inductiveParent info).isSome then
        let check ← generatedInfoText info
        modify fun (s : EmitState) => {s with checks := s.checks.push check}
    for name in inventory.localNames.toArray.qsort Name.lt do emitMetadata source name
    for name in inventory.localNames.toArray.qsort Name.lt do emitRuntime source inventory name
    for (sourceName, targetName) in cfg.goals do
      if inventory.names.contains targetName || inBase source base targetName then
        throw <| IO.userError s!"Reference goal name collides with target data: {targetName}"
      let info ← getInfo source sourceName
      let reference := `M6SnapshotReferenceGoals ++ targetName
      if inventory.names.contains reference || source.contains reference then
        throw <| IO.userError s!"Reference goal name collision: {reference}"
      let type ← exprText info.type
      pushDeclaration (".axiomDecl { " ++ s!"name := {nameText reference}, " ++
        s!"levelParams := {namesText info.levelParams}, type := {type}, " ++
        "isUnsafe := false }") #[reference]
      pushDeclaration (".thmDecl { " ++ s!"name := {nameText targetName}, " ++
        s!"levelParams := {namesText info.levelParams}, type := {type}, " ++
        s!"value := .const {nameText reference} " ++
        s!"{listText (info.levelParams.map (fun n ↦ s!"(.param {nameText n})"))}" ++
        " }") #[targetName]
    ).run {}
  let mut mathematicalSyntax : Array Name := #[]
  for name in mathematical.localNames.toArray.qsort Name.lt do
    let info ← getInfo source name
    if hasSyntaxData info.type || (info.value? (allowOpaque := true)).any hasSyntaxData then
      mathematicalSyntax := mathematicalSyntax.push name
  let text := snapshotText cfg state
  let temporary := cfg.output.toString ++ ".tmp"
  IO.FS.writeFile temporary text
  IO.FS.rename temporary cfg.output
  let manifest := Json.mkObj [
    ("source_module", toJson cfg.source.toString), ("roots", toJson (cfg.roots.map toString)),
    ("goals", toJson (cfg.goals.map fun (a,b) ↦ (a.toString,b.toString))),
    ("base_imports", toJson (cfg.bases.map toString)),
    ("closure_declarations", toJson inventory.names.size),
    ("mathematical_declarations", toJson mathematical.names.size),
    ("mathematical_syntax_declarations", toJson (mathematicalSyntax.map toString)),
    ("runtime_diagnostic_normalization", toJson "erase _recApp only outside exact target closure"),
    ("copied_declarations", toJson inventory.localNames.size),
    ("expression_nodes", toJson state.nodes.size),
    ("kernel_commands", toJson state.declarations.size),
    ("declaration_index", toJson (state.declarationNames.mapIdx fun i names ↦
      Json.mkObj [("index", toJson i), ("label", toJson s!"d{i}"),
        ("definition", toJson s!"declarations{i / 64}"), ("offset", toJson (i % 64)),
        ("names", toJson (names.map toString))])),
    ("runtime_alias_owners", toJson (state.predefOwners.mapIdx fun i owner ↦
      Json.mkObj [("predefinition", toJson s!"p{i}"), ("source", toJson owner.toString),
        ("alias", toJson (runtimeAlias owner).toString)])),
    ("generated_metadata_checks", toJson state.checks.size),
    ("regenerated_recursion_aliases", toJson state.predefs.size),
    ("runtime_commands", toJson state.runtime.size),
    ("copied_names", toJson (inventory.localNames.toArray.qsort Name.lt |>.map toString)),
    ("copied_owners", toJson (inventory.localNames.toArray.qsort Name.lt |>.map fun name ↦
      Json.mkObj [("name", toJson name.toString), ("module", toJson
        ((source.getModuleIdxFor? name).map (fun i ↦ source.header.moduleNames[i]!)
          |>.getD Name.anonymous).toString)]))]
  IO.FS.writeFile (cfg.output.toString ++ ".json") (manifest.pretty ++ "\n")
  IO.println (s!"Snapshot proposed: {inventory.localNames.size} local declarations, " ++
    s!"{state.nodes.size} Expr nodes, {state.declarations.size} kernel commands")
  IO.println "Snapshot still requires independent kernel build and exact environment comparison"

end ChessM6ChallengeExport

unsafe def main (args : List String) : IO UInt32 := do
  match ChessM6ChallengeExport.parse args with
  | .error message => throw <| IO.userError message
  | .ok cfg => ChessM6ChallengeExport.execute cfg; return 0
