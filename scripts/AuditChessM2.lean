/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Chess.Exec
import Lean

/-! Check the public contracts and transitively audit every M2 declaration. -/

open Lean Chess

example : ∀ p : Chess.Position, Exec.decode (Exec.encode p) = p := Exec.decode_encode
example : ∀ p : Exec.Position, Exec.encode (Exec.decode p) = p := Exec.encode_decode
example : Exec.decode Exec.initial = initialPosition := Exec.decode_initial
example : ∀ p m, m ∈ Exec.legalPlies p ↔ IsLegalPly (Exec.decode p) m := Exec.mem_legalPlies
example : ∀ p, (Exec.legalPlies p).Nodup := Exec.legalPlies_nodup
example : ∀ p m, Exec.decodeBoard (Exec.applyBoard p m) = applyBoard (Exec.decode p) m :=
  Exec.decode_applyBoard
example : ∀ p m, Exec.decode (Exec.applyPly p m) = applyPly (Exec.decode p) m :=
  Exec.decode_applyPly
example : ∀ p m, Exec.applyPly (Exec.encode p) m = Exec.encode (applyPly p m) :=
  Exec.applyPly_encode

private def dependencies (info : ConstantInfo) : Array Name := Id.run do
  let mut names := info.type.getUsedConstants
  if let some value := info.value? (allowOpaque := true) then
    names := names ++ value.getUsedConstants
  match info with
  | .inductInfo v => names := names ++ v.ctors.toArray ++ v.all.toArray
  | .recInfo v =>
      names := names ++ v.all.toArray
      for rule in v.rules do
        names := names.push rule.ctor ++ rule.rhs.getUsedConstants
  | _ => pure ()
  return names

def main (args : List String) : IO Unit := do
  initSearchPath (← findSysroot)
  let env ← importModules #[{ module := `Cryptids.Chess.Exec }] {} 0
  let mut roots := env.constants.toList.foldl (init := #[]) fun acc (name, _) ↦
    if `Chess.Exec |>.isPrefixOf name then acc.push name else acc
  if args == ["--negative-control"] then
    roots := roots.push `sorryAx
  else if !args.isEmpty then
    throw <| IO.userError "Unexpected audit argument"
  unless roots.contains `Chess.Exec.mem_legalPlies && roots.contains `Chess.Exec.decode_applyPly do
    throw <| IO.userError "Required refinement theorem is missing"
  let mut pending := roots
  let mut seen : NameSet := {}
  let mut axioms : NameSet := {}
  while let some name := pending.back? do
    pending := pending.pop
    if seen.contains name then continue
    seen := seen.insert name
    if name == `Chess.perfect_play_results_in_draw then
      throw <| IO.userError "The open chess conjecture is a dependency"
    let some info := env.find? name | throw <| IO.userError s!"Missing declaration: {name}"
    if info.isUnsafe then throw <| IO.userError s!"Unsafe dependency: {name}"
    match info with
    | .axiomInfo _ =>
        unless #[`propext, `Classical.choice, `Quot.sound].contains name do
          throw <| IO.userError s!"Forbidden axiom: {name}"
        axioms := axioms.insert name
    | .defnInfo value =>
        if value.safety == .partial then throw <| IO.userError s!"Partial dependency: {name}"
    | _ => pure ()
    pending := pending ++ dependencies info
  IO.println s!"Audited {roots.size} M2 declarations and {seen.size} transitive dependencies"
  IO.println s!"Permitted axioms used: {axioms.toList}"
  IO.println "Chess M2 theorem audit passed"
