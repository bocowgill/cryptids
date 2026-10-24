module
public import Cryptids.Compilation.FieldPacking.Graph

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open FieldCompiler
namespace ObservedCachePilot
set_option backward.isDefEq.respectTransparency false

abbrev Result (n k : Nat) := GraphPost.Descriptor n k × TM0.Stmt Bool

def observedStep {n k labels : Nat} {α : Type}
    (entry : Fin labels → Fin n) (observe : Bool → Result n k → α)
    (cache : Bool → Fin n → Fin k → α) (bit : Bool)
    (node : BoolGraph.Node n k labels) (value : Fin k) : α :=
  match node with
  | .move dir child => observe bit ((some child, value), .move dir)
  | .write table child => observe bit ((some child, value), .write (table.read bit value))
  | .load table child => cache bit child (table.read bit value)
  | .branch table left right =>
      if table.read bit value then cache bit left value else cache bit right value
  | .goto table => observe bit ((some (entry (table.read bit value)), value), .write bit)
  | .halt => observe bit ((none, value), .write bit)

theorem observed_cache_sound {n k labels : Nat} {α : Type}
    (g : LazyGraph.Graph n k labels) (observe : Bool → Result n k → α)
    (cache : Bool → Fin n → Fin k → α)
    (checked : ∀ bit i value,
      cache bit i value = observedStep g.entry observe cache bit (g.node i) value)
    (bit : Bool) (i : Fin n) (value : Fin k) :
    cache bit i value = observe bit (LazyGraph.trAux g bit i value) := by
  rewrite [checked bit i value]
  cases row : g.node i with
  | move dir child =>
    change observe bit ((some child, value), .move dir) = _
    rewrite [LazyGraph.trAux_move g bit i child value dir row]
    rfl
  | write table child =>
    change observe bit ((some child, value), .write (table.read bit value)) = _
    rewrite [LazyGraph.trAux_write g bit i child value table row]
    rfl
  | load table child =>
    change cache bit child (table.read bit value) = _
    rewrite [LazyGraph.trAux_load g bit i child value table row]
    exact observed_cache_sound g observe cache checked bit child (table.read bit value)
  | branch table left right =>
    change (if table.read bit value then cache bit left value else cache bit right value) = _
    rewrite [LazyGraph.trAux_branch g bit i left right value table row]
    cases table.read bit value <;>
      simp only [Bool.false_eq_true, ↓reduceIte]
    · exact observed_cache_sound g observe cache checked bit right value
    · exact observed_cache_sound g observe cache checked bit left value
  | goto table =>
    change observe bit ((some (g.entry (table.read bit value)), value), .write bit) = _
    rewrite [LazyGraph.trAux_goto g bit i value table row]
    rfl
  | halt =>
    change observe bit ((none, value), .write bit) = _
    rewrite [LazyGraph.trAux_halt g bit i value row]
    rfl
termination_by i.val
decreasing_by all_goals exact g.below i _ (by simp [row, BoolGraph.Node.children])

def sourceIndex {labels total : Nat} (rows : Vector (Syntax labels) labels)
    (layout : FieldPacking.Layout rows total) (q : Fin labels) (p : Syntax labels)
    (same : rows.get q = p) (i : Fin p.size) : Fin total :=
  FieldPacking.graphIndex rows layout q (i.cast (congrArg Syntax.size same).symm)

theorem source_node {labels total : Nat} (rows : Vector (Syntax labels) labels)
    (layout : FieldPacking.Layout rows total) (q : Fin labels) (p : Syntax labels)
    (same : rows.get q = p) (i : Fin p.size) :
    (FieldPacking.graph rows layout).node (sourceIndex rows layout q p same i) =
      TemplateGraph.mapNode (sourceIndex rows layout q p same) (p.fastNodeAt i) := by
  cases same
  change FieldPacking.graphNode rows layout (FieldPacking.graphIndex rows layout q i) =
    TemplateGraph.mapNode (FieldPacking.graphIndex rows layout q) ((rows.get q).fastNodeAt i)
  rewrite [Syntax.fastNodeAt_eq]
  exact FieldPacking.graphNode_index rows layout q i

theorem sourceIndex_surjective {labels total : Nat} (rows : Vector (Syntax labels) labels)
    (layout : FieldPacking.Layout rows total) (sourceSyntax : Fin labels → Syntax labels)
    (same : ∀ q, rows.get q = sourceSyntax q) :
    Function.Surjective (fun slot : (Σ q, Fin (sourceSyntax q).size) ↦
      sourceIndex rows layout slot.1 (sourceSyntax slot.1) (same slot.1) slot.2) := by
  intro i
  obtain ⟨⟨q, slot⟩, rfl⟩ := layout.code.surjective i
  let size_eq := congrArg Syntax.size (same q)
  refine ⟨⟨q, slot.cast size_eq⟩, ?_⟩
  have cancelled : (slot.cast size_eq).cast size_eq.symm = slot := Fin.ext rfl
  change layout.code ⟨q, (slot.cast size_eq).cast size_eq.symm⟩ = layout.code ⟨q, slot⟩
  rewrite [cancelled]
  rfl

theorem source_cache_sound {labels total : Nat} {α : Type}
    (rows : Vector (Syntax labels) labels) (layout : FieldPacking.Layout rows total)
    (sourceSyntax : Fin labels → Syntax labels) (same : ∀ q, rows.get q = sourceSyntax q)
    (observe : Bool → Result total 5 → α) (cache : Bool → Fin total → Fin 5 → α)
    (checked : ∀ q bit slot value,
      cache bit (sourceIndex rows layout q (sourceSyntax q) (same q) slot) value =
        observedStep (FieldPacking.graph rows layout).entry observe cache bit
          (TemplateGraph.mapNode (sourceIndex rows layout q (sourceSyntax q) (same q))
            ((sourceSyntax q).fastNodeAt slot)) value)
    (bit : Bool) (i : Fin total) (value : Fin 5) :
    cache bit i value = observe bit (LazyGraph.trAux (FieldPacking.graph rows layout)
      bit i value) := by
  refine observed_cache_sound (FieldPacking.graph rows layout) observe cache ?_ bit i value
  intro scanned index store
  obtain ⟨⟨q, slot⟩, address⟩ := sourceIndex_surjective rows layout sourceSyntax same index
  rewrite [← address, source_node rows layout q (sourceSyntax q) (same q) slot]
  exact checked q scanned slot store

end ObservedCachePilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Generic observed cache and source-slot coverage checked"
