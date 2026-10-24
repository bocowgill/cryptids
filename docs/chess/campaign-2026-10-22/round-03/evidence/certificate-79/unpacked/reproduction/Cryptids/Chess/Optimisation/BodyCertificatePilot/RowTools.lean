module
public import Cryptids.Chess.Optimisation.FieldSelective

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open ConjectureMachines.Optimisation
open Chess.Optimisation FieldCompiler

theorem post_live (pc : Fin 106668) (value : Fin 5) (bit : Bool) :
    FieldPacked.post (CompactPost.encode FieldPacked.getter (some pc, value)) bit =
      let result := LazyGraph.trAux FieldPacked.getter bit pc value
      some (CompactPost.encode FieldPacked.getter result.1, result.2) := by
  simp only [FieldPacked.post, CompactPost.machine, CompactPost.decode_encode,
    Option.map_some]

theorem getter_local (q : Fin 4042) (i : Fin (FieldPacked.syntaxRows.get q).size) :
    FieldPacked.getter.node (FieldSelectiveLayout.nodeIndex q i) =
      TemplateGraph.mapNode (FieldSelectiveLayout.nodeIndex q)
        ((FieldPacked.syntaxRows.get q).fastNodeAt i) := by
  have rename : FieldSelectiveLayout.nodeIndex q =
      FieldPacking.graphIndex FieldPacked.syntaxRows FieldPacked.layout q := by rfl
  rw [rename]
  simpa only [FieldPacked.getter, FieldPacking.graph_node, Syntax.fastNodeAt_eq] using
    FieldPacking.graphNode_index FieldPacked.syntaxRows FieldPacked.layout q i

theorem initial_entry : FieldPacked.getter.entry 0 = 0 := by
  apply Fin.ext
  change (FieldPackedLayout.layout.code
    ⟨0, (FieldAware.syntaxRows.get 0).root⟩).val = 0
  rw [FieldPackedLayout.code_val, FieldPackedLayout.offset_zero, Nat.zero_add,
    Syntax.root_val, FieldAware.syntaxRows_get]
  rfl

theorem permutation_numeric : CompactPost.permutation FieldPacked.getter =
    Equiv.swap (0 : Fin 533341) 1 := by
  simp only [CompactPost.permutation, initial_entry]
  rfl

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Structural body row helpers checked"
