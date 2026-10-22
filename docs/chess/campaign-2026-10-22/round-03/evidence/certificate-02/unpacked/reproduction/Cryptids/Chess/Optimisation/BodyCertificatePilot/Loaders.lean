module
public import Cryptids.Compilation.BalancedTable

meta section
namespace Chess.Optimisation.BodyCertificatePilot.Generator
open Lean Elab Term Meta Command ConjectureMachines

elab "load_body_map% " path:str : term <= expectedType? => do
  let expected ← instantiateMVars expectedType?
  unless expected.isAppOfArity ``Compilation.Balanced.RowTree 1 do
    throwError "Expected map tree"
  let elemType := expected.getAppArgs[0]!
  unless elemType.isAppOfArity ``Fin 1 do throwError "Expected bounded map values"
  let bound := elemType.getAppArgs[0]!
  let content ← liftM (m := IO) (IO.FS.readFile path.getString)
  let mut entries : Array Expr := #[]
  for raw in content.splitOn "\n" do
    let text := raw.trimAscii.toString
    if !text.isEmpty then
      let some value := text.toNat? | throwError "Malformed map integer"
      entries := entries.push (TableSyntax.boundedFinExpr bound value)
  TableSyntax.balancedRowsExpr elemType entries 0 entries.size

def dependencies (info : ConstantInfo) : Array Name := Id.run do
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

elab "audit_body_roots% " "[" roots:ident,* "]" : command => do
  let env ← getEnv
  let mut pending := roots.getElems.map (fun name ↦ name.getId)
  let mut seen : NameSet := {}
  while let some name := pending.back? do
    pending := pending.pop
    if seen.contains name then continue
    seen := seen.insert name
    let some decl := env.find? name | throwError "Missing audited declaration: {name}"
    if decl.isUnsafe || decl.isPartial then throwError "Unsafe/partial dependency: {name}"
    if (`Chess.Optimisation.BodyCertificatePilot.Generator).isPrefixOf name ||
        (`ConjectureMachines.TableSyntax).isPrefixOf name ||
        name == `Chess.perfect_play_results_in_draw then
      throwError "Forbidden generator/conjecture dependency: {name}"
    if decl matches .axiomInfo _ then
      unless #[`propext, `Classical.choice, `Quot.sound].contains name do
        throwError "Forbidden axiom dependency: {name}"
    pending := pending ++ dependencies decl
  logInfo m!"Body kernel certificate root audit passed: {roots.getElems.size} roots"
end Chess.Optimisation.BodyCertificatePilot.Generator
end
run_cmd Lean.logInfo "Body certificate loaders checked"
