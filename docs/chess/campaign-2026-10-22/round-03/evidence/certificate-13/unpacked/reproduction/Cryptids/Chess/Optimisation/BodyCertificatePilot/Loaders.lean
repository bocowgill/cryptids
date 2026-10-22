module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.Packed

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

elab "load_packed_rows% " path:str : term <= expectedType? => do
  let expected ← instantiateMVars expectedType?
  unless expected.isAppOfArity ``Compilation.Balanced.RowTree 1 do
    throwError "Expected packed row tree"
  let rowType := expected.getAppArgs[0]!
  unless rowType.isAppOfArity ``Prod 2 &&
      rowType.getAppArgs[0]!.isConstOf ``Nat && rowType.getAppArgs[1]!.isConstOf ``Nat do
    throwError "Expected pairs of literal natural codes"
  let natType := Lean.mkConst ``Nat
  let pair := mkApp2 (Lean.mkConst ``Prod.mk [Level.zero, Level.zero]) natType natType
  let content ← liftM (m := IO) (IO.FS.readFile path.getString)
  let mut entries : Array Expr := #[]
  for raw in content.splitOn "\n" do
    let line := raw.trimAscii.toString
    if !line.isEmpty then
      match (line.splitOn " ").filter (fun cell ↦ !cell.isEmpty) with
      | [first, second] =>
          let some a := first.toNat? | throwError "Malformed first packed code"
          let some b := second.toNat? | throwError "Malformed second packed code"
          entries := entries.push (mkApp2 pair (mkNatLit a) (mkNatLit b))
      | _ => throwError "Expected exactly two packed natural codes"
  TableSyntax.balancedRowsExpr rowType entries 0 entries.size
end Chess.Optimisation.BodyCertificatePilot.Generator
end
run_cmd Lean.logInfo "Body certificate loaders checked"
