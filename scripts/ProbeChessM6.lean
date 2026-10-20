/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Compilation.Code
import Cryptids.Chess.Compilation.Updates
import Cryptids.Chess.Compilation.Source
import Cryptids.Compilation.CodeDAG
import Cryptids.Compilation.Runtime
import Cryptids.Chess.Compilation.Tape

/-! Measure a tiny compiler input's construction cost. This is not a chess state count. -/

open ConjectureMachines.Compilation Turing.ToPartrec

def main (args : List String) : IO Unit := do
  if args.head? == some "emit-code-model" then
    let some (path : String) := args[1]? | throw <| IO.userError "Expected output path"
    let dag := CodeDAG.compile Chess.Compilation.Source.program
    let mut lines := #["import Cryptids.Chess.Compilation.Source", "open Turing.ToPartrec",
      "set_option maxRecDepth 32768", "set_option maxHeartbeats 1000000"]
    for i in [:dag.rows.size] do
      let some node := dag.rows[i]? | throw <| IO.userError "Missing generated row"
      let rhs := match node with
        | .zero => ".zero'" | .succ => ".succ" | .tail => ".tail"
        | .cons l r => s!".cons code{l} code{r}"
        | .comp l r => s!".comp code{l} code{r}"
        | .branch l r => s!".case code{l} code{r}"
        | .fix child => s!".fix code{child}"
      lines := lines.push s!"def code{i} : Code := {rhs}"
    lines := lines.push
      s!"example : Chess.Compilation.Source.program = code{dag.root} := by rfl"
    IO.FS.writeFile path (String.intercalate "\n" lines.toList ++ "\n")
    IO.println s!"Wrote {dag.rows.size} explicit Code model nodes to {path}"
    return
  if args == ["source-dag"] then
    let start ← IO.monoMsNow
    let code := Chess.Compilation.Source.program
    let occurrences := NatCode.nodes code
    IO.println s!"Full source Code occurrences: {occurrences}"
    (← IO.getStdout).flush
    let dag := CodeDAG.compile code
    let words := CodeDAG.serialize dag
    IO.println s!"Shared source rows: {dag.rows.size}; root: {dag.root}; valid: {CodeDAG.check dag}"
    let symbols := (Turing.PartrecToTM2.trList words).length
    IO.println s!"Serialized words: {words.length}; stack symbols: {symbols}"
    IO.println s!"Construction milliseconds: {(← IO.monoMsNow) - start}"
    return
  if args == ["runtime-labels"] then
    IO.println s!"Fixed runtime source labels: {Runtime.labels.length}"
    return
  if args == ["source-wire"] then
    let wire := Chess.Compilation.Tape.input
    let bits := blockInput CodeBackend.blockCode
      (Turing.TM2to1.trInit Turing.PartrecToTM2.K'.main wire)
    IO.println s!"Actual chess input stack symbols: {wire.length}"
    IO.println s!"Actual chess input binary bits: {bits.length}"
    IO.println s!"Paid blank-writer states: {2 * bits.length}"
    IO.println s!"Initial packed game argument: {Chess.Compilation.Tape.argument}"
    return
  if args == ["runtime-backend"] then
    let _ : Inhabited Turing.PartrecToTM2.Λ' := ⟨Runtime.label .start⟩
    let start ← IO.monoMsNow
    IO.println s!"Fixed runtime source labels: {Runtime.labels.length}"
    (← IO.getStdout).flush
    let post := fastStack Runtime.machine CodeBackend.blockCode Runtime.labels
      CodeBackend.symbols CodeBackend.stores Turing.PartrecToTM2.K'.main
    IO.println s!"Fixed interpreter Post states: {post.extraStates + 1}"
    IO.println s!"Fixed interpreter binary body states: {2 * (post.extraStates + 1)}"
    IO.println s!"Construction milliseconds: {(← IO.monoMsNow) - start}"
    return
  if args == ["updates-nodes"] then
    let count := NatCode.nodes Chess.Compilation.Updates.code
    IO.println s!"Unchecked position-update Code nodes: {count}"
    return
  let code : Code ← match args with
    | ["tail"] => pure .tail
    | ["zero"] => pure .zero'
    | _ => throw <| IO.userError "Expected tail, zero, updates-nodes, source-dag or runtime-labels"
  let start ← IO.monoMsNow
  IO.println s!"Tiny-code probe: {args}"
  IO.println s!"Source support labels: {(CodeBackend.codeSuppList code .halt).length}"
  (← IO.getStdout).flush
  let post := CodeBackend.post code
  let count := post.extraStates + 1
  IO.println s!"Post states: {count}"
  IO.println s!"Total binary states including blank initializer: {2 * count + 22}"
  IO.println s!"Construction milliseconds: {(← IO.monoMsNow) - start}"
