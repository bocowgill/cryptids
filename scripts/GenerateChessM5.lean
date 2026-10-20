/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Compilation.Examples

open Turing ConjectureMachines ConjectureMachines.Compilation
open ConjectureMachines.Compilation.Examples Chess.Compilation

set_option maxRecDepth 100000

private def cell {q : ℕ} : Option (Fin 2 × Dir × Fin q) → String
  | none => "---"
  | some (a, d, next) => s!"{a.val}{if d = Dir.left then "L" else "R"}{next.val}"

private def emit (dir : System.FilePath) (name : String) (tree : Tree)
    (counts : Bool) : IO Unit := do
  let stdout ← IO.getStdout
  if counts then
    stdout.putStrLn s!"collecting {name}"
    stdout.flush
    let qs := fastLabels (gameProgram tree) gameCode (List.finRange 8)
      gameSymbols (List.finRange 6)
    stdout.putStrLn s!"{name}: {2 * (qs.length + 1) + 12} states; Post {qs.length + 1}; input 6"
    stdout.flush
    return
  let p := post tree
  let machine := fromPost p
  stdout.putStrLn (s!"{name}: {machine.states} states; Post {p.extraStates + 1}; " ++
    s!"input {p.input.length}")
  stdout.flush
  unless counts do
    let mut lines := #[]
    for q in List.finRange machine.states do
      let zero := cell (machine.toMachine.transition q 0)
      let one := cell (machine.toMachine.transition q 1)
      lines := lines.push s!"{zero} {one}"
    IO.FS.createDirAll dir
    IO.FS.writeFile (dir / s!"{name}.txt") (String.intercalate "\n" lines.toList ++ "\n")

def main (args : List String) : IO Unit := do
  let counts := args == ["--counts"]
  let output := match args with
    | ["--output", dir] => System.FilePath.mk dir
    | ["--counts"] => System.FilePath.mk ".lake/chess-m5-check/generated"
    | _ => System.FilePath.mk "artifacts/chess_m5"
  emit output "white" whiteWin counts
  emit output "black" blackWin counts
  emit output "draw" drawGame counts
  emit output "refutation" favorableLine counts
