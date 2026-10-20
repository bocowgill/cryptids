/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.Binary
public import Cryptids.Compilation.Init
public import Cryptids.Compilation.AssemblyFast
public import Cryptids.Compilation.Games

/-! # End-to-end blank-tape compilation of branching games -/

@[expose] public section
namespace ConjectureMachines.Compilation.Examples
open Turing Chess.Compilation

abbrev GameAlphabet := TM2to1.Γ' Bool GameGamma

/-- Construct a complete simultaneous stack symbol, including the bottom marker. -/
def gameSymbol (bottom : Bool) (token : Option (Fin 5)) (value : Option (Fin 3)) : GameAlphabet :=
  (bottom, fun | false => token | true => value)

def options (n : ℕ) : List (Option (Fin n)) := none :: (List.finRange n).map some

@[simp] theorem mem_options {n : ℕ} (value : Option (Fin n)) : value ∈ options n := by
  cases value <;> simp [options, List.mem_finRange]

/-- A deterministic 48-symbol enumeration, with the blank first. -/
def gameSymbols : List GameAlphabet :=
  [false, true].flatMap fun bottom ↦ (options 5).flatMap fun token ↦
    (options 3).map fun value ↦ gameSymbol bottom token value

theorem gameSymbols_cover (symbol : GameAlphabet) : symbol ∈ gameSymbols := by
  obtain ⟨bottom, stackValues⟩ := symbol
  have reconstruct : gameSymbol bottom (stackValues false) (stackValues true) =
      (bottom, stackValues) := by
    change (bottom, fun | false => stackValues false | true => stackValues true) =
      (bottom, stackValues)
    congr 1
    funext k
    cases k <;> rfl
  rw [← reconstruct]
  exact List.mem_flatMap.mpr ⟨bottom, by cases bottom <;> simp,
    List.mem_flatMap.mpr ⟨stackValues false, mem_options _,
      List.mem_map.mpr ⟨stackValues true, mem_options _, rfl⟩⟩⟩

def gameCode : BlockCode GameAlphabet := BlockCode.ofList gameSymbols gameSymbols_cover

instance gameAlphabetHashable : Hashable GameAlphabet :=
  ⟨fun symbol ↦ hash (BlockCode.rank gameSymbols symbol)⟩

/-- The binary Post program, before converting its finite input into counted control states. -/
def post (tree : Tree) : NumberedPost :=
  fastStack (gameProgram tree) gameCode (List.finRange 8) gameSymbols (List.finRange 6) false

theorem post_halts (tree : Tree) : (post tree).Halts ↔ value tree ≠ 1 := by
  have support : TM2.Supports (gameProgram tree) (List.finRange 8).toFinset := by
    simpa only [List.toFinset_finRange] using gameProgram_supports tree
  exact (fastStack_halts (gameProgram tree) gameCode (List.finRange 8) support
    gameSymbols gameSymbols_cover (List.finRange 6) (fun _ ↦ List.mem_finRange _) false).trans
    (gameProgram_halts_iff tree)

def postBody (P : NumberedPost) : BundledMachine 2 :=
  ⟨(P.extraStates + 1) + (P.extraStates + 1), Binary.compile P.machine⟩

def body (tree : Tree) : BundledMachine 2 := postBody (post tree)

def fromPost (P : NumberedPost) : BundledMachine 2 :=
  Init.initialise (P.input.map Binary.encodeSymbol) (postBody P)

/-- All program/data initialization is performed from a genuinely blank binary tape. -/
def generated (tree : Tree) : BundledMachine 2 :=
  fromPost (post tree)

/-- Both directions hold for every finite game, including unconditional draw nonhalting. -/
theorem generated_halts (tree : Tree) : (generated tree).Halts ↔ value tree ≠ 1 :=
  (Init.initialise_halts _ _).trans
    ((Binary.compile_halts_input _ _).trans (post_halts tree))

theorem generated_states (tree : Tree) :
    (generated tree).states = 2 * ((post tree).extraStates + 1) + 2 * (post tree).input.length := by
  simp only [generated, fromPost, Init.initialise_states, postBody, List.length_map]
  omega

end ConjectureMachines.Compilation.Examples
