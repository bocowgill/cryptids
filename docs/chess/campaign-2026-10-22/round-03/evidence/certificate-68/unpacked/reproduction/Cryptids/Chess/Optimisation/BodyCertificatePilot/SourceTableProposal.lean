module
public meta import Cryptids.Chess.Optimisation.BodyCertificatePilot.SourceTables
public meta import Lean

public meta section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open FieldCompiler
namespace NativeSourceProposal
open Lean

def cells {n : Nat} (values : Vector (Fin n) 5) : Json :=
  .arr (values.toArray.map fun value ↦ toJson value.val)

def encode : TableOp 4042 → Json
  | .move dir next => .arr #[toJson (0 : Nat),
      toJson (if dir = .left then (-1 : Int) else 1), toJson next.val]
  | .write field values next =>
      .arr #[toJson (1 : Nat), toJson field.val, cells values, toJson next.val]
  | .load field values next => .arr #[toJson (2 : Nat), toJson field.val,
      .arr (values.toArray.map cells), toJson next.val]
  | .pureLoad values next => .arr #[toJson (3 : Nat), cells values, toJson next.val]
  | .marker yes no => .arr #[toJson (4 : Nat), toJson yes.val, toJson no.val]
  | .absent field yes no =>
      .arr #[toJson (5 : Nat), toJson field.val, toJson yes.val, toJson no.val]
  | .branch test yes no => .arr #[toJson (6 : Nat),
      .arr (test.toArray.map toJson), toJson yes.val, toJson no.val]
  | .jump targets => .arr #[toJson (7 : Nat), cells targets]
  | .halt => .arr #[toJson (8 : Nat)]

def propose : IO Unit := do
  let operations := Snapshot.entries.flatten.toArray.map fun row ↦ encode (toTableOp row.1)
  let payload := Json.mkObj [
    ("schema", toJson ("finite-source-op-proposal-v1" : String)),
    ("operations", .arr operations)]
  IO.FS.writeFile ".lake/chess-body-certificate-20261022/source-operation-proposal.json"
    payload.compress

run_cmd Lean.Elab.Command.liftIO propose
end NativeSourceProposal

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Untrusted finite source operations exported"
