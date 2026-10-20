/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Compilation.Code
import Cryptids.Chess.Compilation.Updates

/-! Measure a tiny compiler input's construction cost. This is not a chess state count. -/

open ConjectureMachines.Compilation Turing.ToPartrec

def main (args : List String) : IO Unit := do
  if args == ["updates-nodes"] then
    let count := NatCode.nodes Chess.Compilation.Updates.code
    IO.println s!"Unchecked position-update Code nodes: {count}"
    return
  let code : Code ← match args with
    | ["tail"] => pure .tail
    | ["zero"] => pure .zero'
    | _ => throw <| IO.userError "Expected tail, zero or updates-nodes"
  let start ← IO.monoMsNow
  IO.println s!"Tiny-code probe: {args}"
  IO.println s!"Source support labels: {(CodeBackend.codeSuppList code .halt).length}"
  (← IO.getStdout).flush
  let post := CodeBackend.post code
  let count := post.extraStates + 1
  IO.println s!"Post states: {count}"
  IO.println s!"Total binary states including blank initializer: {2 * count + 22}"
  IO.println s!"Construction milliseconds: {(← IO.monoMsNow) - start}"
