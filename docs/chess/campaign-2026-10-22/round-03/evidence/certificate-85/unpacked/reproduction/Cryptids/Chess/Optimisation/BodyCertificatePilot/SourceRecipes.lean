module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.SourceScopeTools
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LocalChunk

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open ConjectureMachines.Optimisation
open Chess.Optimisation FieldCompiler RawLabelPilot RawChunkPilot LocalRulePilot
open SourceScopeToolsPilot
namespace SourceRecipePilot
set_option backward.isDefEq.respectTransparency false
attribute [local irreducible] FieldPacked.getter FieldPacked.layout
attribute [local irreducible] FieldAware.syntaxRows FieldSelectiveLayout.code

noncomputable def syntaxOf (raw : RawOp) : Syntax 4042 :=
  lower ((restore 4042 raw).getD .halt)

theorem source_syntax (q : Fin 4042) (raw : RawOp)
    (same : erase (toTableOp (Snapshot.program q)) = raw) :
    FieldPacked.syntaxRows.get q = syntaxOf raw :=
  (FieldAware.syntaxRows_get q).trans
    (congrArg lower (LocalChunkPilot.restored_literal (Snapshot.program q) raw same)).symm

-- No independently elaborated concrete Coherent, ReturnCoherent, source
-- transport, count, or duplicate main_rows/return_rows declarations are needed.
noncomputable def checkRecipe (q : Fin 4042) (raw : RawOp) (nodes returns : Nat) : Bool :=
  let p := syntaxOf raw
  decide (erase (toTableOp (Snapshot.program q)) = raw) &&
    (decide (p.size = nodes) &&
      (decide (1 + FieldReturns.writeCount p = returns) &&
        (StructuralCheckPilot.checkMain q p && DirectCheckPilot.checkReturns q p)))

noncomputable def fromRaw (q : Fin 4042) (raw : RawOp) (nodes returns : Nat)
    (checked : checkRecipe q raw nodes returns = true) : SourceCertificate := by
  have parts : decide (erase (toTableOp (Snapshot.program q)) = raw) = true ∧
      decide ((syntaxOf raw).size = nodes) = true ∧
      decide (1 + FieldReturns.writeCount (syntaxOf raw) = returns) = true ∧
      StructuralCheckPilot.checkMain q (syntaxOf raw) = true ∧
      DirectCheckPilot.checkReturns q (syntaxOf raw) = true := by
    simpa only [checkRecipe, Bool.and_eq_true] using checked
  exact makeCertificate q (syntaxOf raw) (source_syntax q raw (of_decide_eq_true parts.1))
    nodes returns (of_decide_eq_true parts.2.1) (of_decide_eq_true parts.2.2.1)
    (StructuralCheckPilot.checkMain_sound q (syntaxOf raw) parts.2.2.2.1)
    (DirectCheckPilot.checkReturns_sound q (syntaxOf raw) parts.2.2.2.2)

end SourceRecipePilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Compact source recipes preserve every row and census obligation"
