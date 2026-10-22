/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.TableSeed.Format

/-! # Exact structured packet for the frozen chess input

The source certificate supplies operand bounds. Converting each constructor preserves its
actual natural-number fields, and the original-word identity is proved before instantiating
the complete source table.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.TableSeed.ChessCodec

open Turing PartrecToTM2

/-- Preserve the canonical tag and both operands of one certified source row. -/
def nodeToRow : (node : CodeDAG.Node) → node.Below 8192 → Row
  | .zero, _ => ⟨0, 0, 0⟩
  | .succ, _ => ⟨1, 0, 0⟩
  | .tail, _ => ⟨2, 0, 0⟩
  | .cons left right, below => ⟨3, ⟨left, below.1⟩, ⟨right, below.2⟩⟩
  | .comp left right, below => ⟨4, ⟨left, below.1⟩, ⟨right, below.2⟩⟩
  | .branch left right, below => ⟨5, ⟨left, below.1⟩, ⟨right, below.2⟩⟩
  | .fix child, below => ⟨6, ⟨child, below⟩, 0⟩

theorem nodeToRow_letters (node : CodeDAG.Node) (below : node.Below 8192) :
    rowLetters (nodeToRow node below) = (trList node.words).map Seed.ofSymbol := by
  rw [rowLetters_eq_trList]
  cases node <;> rfl

/-- Topology and the certified table size bound every operand without inspecting the table. -/
theorem array_below (nodes : Array CodeDAG.Node)
    (topology : ∀ (i : Nat) (node : CodeDAG.Node), nodes[i]? = some node → node.Below i)
    (size : nodes.size ≤ 8192) :
    ∀ node ∈ nodes.toList, node.Below 8192 := by
  intro node member
  obtain ⟨i, found⟩ := List.mem_iff_getElem?.mp member
  rw [Array.getElem?_toList] at found
  have index : i < nodes.size := (Array.getElem?_eq_some_iff.mp found).1
  exact CodeDAG.Node.Below.mono node (topology i node found)
    (Nat.le_trans (Nat.le_of_lt index) size)

/-- The dependent conversion retains the original row order and exact `trList` words. -/
theorem nodes_letters (nodes : List CodeDAG.Node)
    (below : ∀ node ∈ nodes, node.Below 8192) :
    (List.pmap nodeToRow nodes below).flatMap rowLetters =
      (trList (nodes.flatMap CodeDAG.Node.words)).map Seed.ofSymbol := by
  induction nodes with
  | nil => rfl
  | cons node nodes ih =>
    simp only [List.pmap_cons, List.flatMap_cons, nodeToRow_letters,
      Runtime.trList_append, List.map_append, ih]

/-- The separator is the existing original-stack symbol, in the original position. -/
theorem mapped_input (prefix table suffix : List Γ') :
    prefix.map Seed.ofSymbol ++ table.map Seed.ofSymbol ++ [separatorLetter] ++
        suffix.map Seed.ofSymbol =
      (prefix ++ table ++ Γ'.consₗ :: suffix).map Seed.ofSymbol := by
  simp only [List.map_append, List.map_cons, Seed.ofSymbol, separatorLetter,
    List.append_assoc, List.cons_append, List.nil_append]

open Chess.Compilation

theorem source_below : ∀ node ∈ SourceModel.rows.toList, node.Below 8192 :=
  array_below SourceModel.rows SourceCertificate.dag_valid.2
    (by rw [SourceCertificate.rows_size]; decide)

/-- The bounded row list has exactly the frozen source table's original order. -/
def rows : List Row := List.pmap nodeToRow SourceModel.rows.toList source_below

/-- The root remains an original literal word. -/
def pre : List Letter := (trList [SourceModel.dag.root]).map Seed.ofSymbol

/-- The complete argument remains literal; it is not restricted to an operand field. -/
def post : List Letter := (trList Tape.literalArgument).map Seed.ofSymbol

def letters : List Letter := TableSeed.letters pre rows post

/-- The complete packet installed by the paid blank-tape writer. -/
def bits : Array Bit := (packet pre rows post).toArray

theorem sourceRows_toList : SourceModel.rows.toList = SourceModel.rowBlock0_5952 := by
  simp only [SourceModel.rows, List.toList_toArray]

theorem rows_letters : rows.flatMap rowLetters =
    (trList (SourceModel.rowBlock0_5952.flatMap CodeDAG.Node.words)).map Seed.ofSymbol := by
  rw [rows, nodes_letters, sourceRows_toList]

/-- The expanded packet is the exact already-certified complete chess symbol list. -/
theorem letters_eq : letters = Seed.ChessCodec.letters := by
  calc
    letters =
        (trList [SourceModel.dag.root] ++
          trList (SourceModel.rowBlock0_5952.flatMap CodeDAG.Node.words) ++
            Γ'.consₗ :: trList Tape.literalArgument).map Seed.ofSymbol := by
      rw [letters, TableSeed.letters, rows_letters]
      exact mapped_input (trList [SourceModel.dag.root])
        (trList (SourceModel.rowBlock0_5952.flatMap CodeDAG.Node.words))
        (trList Tape.literalArgument)
    _ = Seed.ChessCodec.letters :=
      (congrArg (List.map Seed.ofSymbol) Input.stack_eq_raw).symm

theorem pre_length : pre.length = 14 := by
  simp only [pre, List.length_map, Input.root_symbols]

theorem post_length : post.length = 323 := by
  simp only [post, List.length_map, Input.argument_symbols]

theorem rows_length : rows.length = 5952 := by
  simp only [rows, List.length_pmap, Array.length_toList, SourceCertificate.rows_size]

theorem packet_length : (packet pre rows post).length = 173641 := by
  rw [TableSeed.packet_length, pre_length, post_length, rows_length]

theorem bits_toList : bits.toList = packet pre rows post := List.toList_toArray

theorem bits_size : bits.size = 173641 := by
  simp only [bits, List.size_toArray, packet_length]

theorem writer_states : bits.size + 1 = 173642 := by
  rw [bits_size]

/-- The actual paid reverse writer includes its final turn control. -/
theorem paid_writer_states :
    (Chess.Optimisation.OpenEvolveWide.schedule bits).size = 173642 :=
  Seed.ChessCodec.counted_schedule bits 173641 bits_size

end ConjectureMachines.Compilation.TableSeed.ChessCodec
