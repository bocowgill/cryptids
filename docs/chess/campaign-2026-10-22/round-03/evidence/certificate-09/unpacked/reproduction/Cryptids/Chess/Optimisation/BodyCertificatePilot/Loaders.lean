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
  unless elemType.isConstOf ``Nat do throwError "Expected literal Nat map values"
  let content ← liftM (m := IO) (IO.FS.readFile path.getString)
  let mut entries : Array Expr := #[]
  for raw in content.splitOn "\n" do
    let text := raw.trimAscii.toString
    if !text.isEmpty then
      let some value := text.toNat? | throwError "Malformed map integer"
      entries := entries.push (mkNatLit value)
  TableSyntax.balancedRowsExpr elemType entries 0 entries.size
end Chess.Optimisation.BodyCertificatePilot.Generator
end
run_cmd Lean.logInfo "Body certificate loaders checked"
