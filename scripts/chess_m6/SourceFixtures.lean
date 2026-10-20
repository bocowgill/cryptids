import Cryptids.Chess.Compilation.SourceCertificate

set_option maxRecDepth 32768

namespace SourceCertificateFixtures
open Turing.ToPartrec ConjectureMachines.Compilation
open Chess.Compilation SourceCertificate

/-- A well-formed change of the first opcode is rejected by the exact model certificate. -/
theorem changed_opcode_rejected :
    ¬ RowCertificate (SourceModel.rows.set 0 .tail) model 0 := by
  rintro ⟨node, found, _, meaning⟩
  have lookup : (SourceModel.rows.set 0 .tail)[0]? = some .tail :=
    Array.getElem?_set_self (by rw [rows_size]; decide)
  have equal : node = .tail := Option.some.inj (found.symm.trans lookup)
  subst node
  have zero : model 0 = Code.succ := rfl
  rw [zero] at meaning
  change Code.succ = Code.tail at meaning
  cases meaning

/-- A forward/self reference at row zero also fails the actual table validity condition. -/
theorem changed_child_rejected :
    ¬ (⟨SourceModel.rows.set 0 (.fix 0), 5951⟩ : CodeDAG.DAG).Valid := by
  intro valid
  have lookup : (SourceModel.rows.set 0 (.fix 0))[0]? = some (.fix 0) :=
    Array.getElem?_set_self (by rw [rows_size]; decide)
  have impossible := valid.2 0 (.fix 0) lookup
  change 0 < 0 at impossible
  omega

example : Source.program = SourceModel.code5951 := source_eq_model
example : SourceModel.dag.decode = Source.program := program_decode
example : SourceModel.dag.Valid := dag_valid
example : CodeDAG.deserialize (CodeDAG.serialize SourceModel.dag) = some SourceModel.dag :=
  serialized_roundtrip

#eval (SourceModel.rows.size, SourceModel.dag.root,
  (CodeDAG.serialize SourceModel.dag).length, CodeDAG.check SourceModel.dag)
#eval CodeDAG.check (⟨SourceModel.rows.set 0 (.fix 0), 5951⟩ : CodeDAG.DAG)
#print axioms changed_opcode_rejected
#print axioms changed_child_rejected

end SourceCertificateFixtures

#eval IO.println "Literal source fixtures passed: exact identity and two mutation controls"
