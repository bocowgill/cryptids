/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import scripts.chess_m6.Export
import Cryptids.Compilation.Tables

open ConjectureMachines.Compilation.Examples

def main : IO Unit := do
  let directory : System.FilePath := ".lake/chess-m6-check/export-fixtures"
  IO.FS.createDirAll directory
  let target := directory / "white.txt"
  IO.FS.withFile target .write fun handle ↦
    ChessM6Export.emitRange (IO.FS.Stream.ofHandle handle) whiteMachine 0 49910 37
  unless (← IO.FS.readFile target) == (← IO.FS.readFile "artifacts/chess_m5/white.txt") do
    throw <| IO.userError "Streaming export disagrees with the complete M5 literal artifact"
  let suffix := directory / "suffix.txt"
  IO.FS.withFile suffix .write fun handle ↦
    ChessM6Export.emitRange (IO.FS.Stream.ofHandle handle) whiteMachine 49900 10 3
  let expected := String.join
    (((← IO.FS.readFile target).splitOn "\n").drop 49900 |>.take 10 |>.map (· ++ "\n"))
  unless (← IO.FS.readFile suffix) == expected do
    throw <| IO.userError "Streaming suffix interval changed row order"
  let output ← IO.getStdout
  for (start, count, batch) in [(49910, 1, 3), (0, 1, 0)] do
    let rejected ← try
      ChessM6Export.emitRange output whiteMachine start count batch
      pure false
    catch _ => pure true
    unless rejected do throw <| IO.userError "Invalid export request was accepted"
  IO.println "Streaming export fixtures passed: complete M5 bytes, suffix, two rejection controls"
