module
public meta import Lean

public meta section
namespace Chess.Optimisation.BodyCertificatePilot.Generator
open Lean Elab Command

elab "capture_cert" " in" declaration:command : command => do
  Lean.Elab.Command.elabCommand declaration
  let messages := (← getThe Lean.Elab.Command.State).messages.reportedPlusUnreported.toArray
  for message in messages do
    let rendered ← Lean.Elab.Command.liftIO message.toString.toIO
    Lean.Elab.Command.liftIO <| IO.FS.withFile
      ".lake/chess-body-certificate-20261022/command-diagnostics.log" .append fun handle ↦ do
        handle.putStrLn rendered
        handle.flush

end Chess.Optimisation.BodyCertificatePilot.Generator
