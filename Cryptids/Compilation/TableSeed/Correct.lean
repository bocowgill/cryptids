/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.TableSeed.Blocks
public import Cryptids.Compilation.TableSeed.Transducer

/-! # Physical realization of the structured decoder's source paths

Each source edge is realized by the existing paid read or emission block. Finite source paths
therefore give actual-machine reachability between complete framed tapes. Entry and finish
compose only with an explicitly supplied source path; no packet-validity premise is hidden.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.TableSeed.Correct

open Turing StateTransition Relation

/-- Interpret a source boundary using the actual paid control and the complete physical tape. -/
def frameCfg (cfg : Transducer.Config) : Cfg 21682 2 :=
  ⟨encode (entryState cfg.entry), Blocks.frameTape cfg.out cfg.raw cfg.gap⟩

/-- Every source edge is an execution of the corresponding existing paid machine block. -/
theorem step_reaches {first last : Transducer.Config} (edge : Transducer.Step first last) :
    Reaches (step machine) (frameCfg first) (frameCfg last) := by
  cases edge with
  | read context out bit raw gap => exact Blocks.read_reaches context out bit raw gap
  | emit context out raw gap => exact Blocks.emit_reaches context out raw gap

/-- Lift arbitrary finite source paths by concatenating their physical executions. -/
theorem path_reaches {first last : Transducer.Config} (path : Transducer.Path first last) :
    Reaches (step machine) (frameCfg first) (frameCfg last) := by
  induction path with
  | refl => exact .refl
  | tail _ edge ih => exact ih.trans (step_reaches edge)

/-- The actual entry and cleanup blocks compose with an explicit complete source path. -/
theorem source_path_reaches (raw : List Bit) (out : List Letter) (gap : Nat)
    (path : Transducer.Path ⟨.read (.literal 0 0), [], raw, 1⟩ ⟨.finish, out, [], gap⟩) :
    Reaches (step machine)
      ⟨entry, Tape.mk₁ (Seed.marker ++ [0] ++ Seed.marker ++ raw)⟩
      ⟨done, Tape.mk₁ (Seed.seed out)⟩ :=
  (Blocks.entry_reaches raw).trans ((path_reaches path).trans (Blocks.finish_reaches out gap))

/-- A header-prefixed packet is decoded when its exact source-control path is supplied.

The source path is the sole semantic premise. This theorem does not assert that an arbitrary
raw packet has such a path or depend on the separately proved valid-packet source theorem.
-/
theorem packet_reaches_of_path (raw : List Bit) (out : List Letter) (gap : Nat)
    (path : Transducer.Path ⟨.read (.literal 0 0), [], raw, 1⟩ ⟨.finish, out, [], gap⟩) :
    Reaches (step machine) ⟨0, Tape.mk₁ (header ++ raw)⟩
      ⟨done, Tape.mk₁ (Seed.seed out)⟩ := by
  simpa only [header, entry_eq_zero] using source_path_reaches raw out gap path

end ConjectureMachines.Compilation.TableSeed.Correct
