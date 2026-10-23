#!/usr/bin/env python3
"""Remote-only durable command diagnostics, with no change to proof checking."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')


SOURCE = r'''module
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
'''


def generate(driver, header, audit_and_end, module):
    driver.emit('Diagnostics.lean', SOURCE)
    # This observer smoke needs only Lean, not the mathematical header's namespaces.
    prelude = header([module + '.Diagnostics']).replace(
        'open Turing ConjectureMachines ConjectureMachines.Compilation\n', '')
    smoke = prelude + '''capture_cert in
theorem diagnostic_capture_smoke : True := True.intro
capture_cert in
run_cmd Lean.logInfo "Chess command diagnostics probe"
'''
    driver.emit('DiagnosticsSmoke.lean', smoke + audit_and_end(
        driver, 'DiagnosticsSmoke', ['diagnostic_capture_smoke'],
        'Diagnostic command capture smoke checked'))
