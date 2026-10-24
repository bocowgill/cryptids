module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LookupCache

meta section
namespace Chess.Optimisation.BodyCertificatePilot.LookupCacheGenerator
open Lean Elab Term Meta Command ConjectureMachines

elab "load_observation_cache% " path:str : term <= expectedType? => do
  let expected ← instantiateMVars expectedType?
  unless expected.isAppOfArity ``Compilation.Balanced.RowTree 1 do
    throwError "Expected observation tree"
  let rowType := expected.getAppArgs[0]!
  let cellName := ``Chess.Optimisation.BodyCertificatePilot.LookupCachePilot.Cell
  unless rowType.isConstOf cellName do throwError "Expected observation cells"
  let maker := Lean.mkConst
    ``Chess.Optimisation.BodyCertificatePilot.LookupCachePilot.Cell.mk
  let content ← liftM (m := IO) (IO.FS.readFile path.getString)
  let mut entries : Array Expr := #[]
  for raw in content.splitOn "\n" do
    let line := raw.trimAscii.toString
    if !line.isEmpty then
      match (line.splitOn " ").filter (fun cell ↦ !cell.isEmpty) with
      | [classText, zeroText, oneText] =>
          let some cls := classText.toNat? | throwError "Malformed class"
          let some first := zeroText.toNat? | throwError "Malformed zero word"
          let some second := oneText.toNat? | throwError "Malformed one word"
          entries := entries.push (mkApp3 maker (mkNatLit cls) (mkNatLit first) (mkNatLit second))
      | _ => throwError "Expected exactly three natural fields"
  TableSyntax.balancedRowsExpr rowType entries 0 entries.size
end Chess.Optimisation.BodyCertificatePilot.LookupCacheGenerator
end
set_option pp.proofs false in
#print ConjectureMachines.Compilation.Balanced.RowTree.lookup
run_cmd Lean.logInfo "Typed observation cache loader checked"
