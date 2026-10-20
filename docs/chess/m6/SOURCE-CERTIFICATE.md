# Literal chess program certificate

`SourceCertificate.program_decode` proves in Lean:

```lean
Chess.Compilation.SourceModel.dag.decode = Chess.Compilation.Source.program
```

The left side contains explicit literal instruction rows. The right side is the complete
frozen chess source with its existing unconditional refinement. Equality is exact Code syntax,
so `SourceCertificate.program_eval` transfers its partial-function semantics on every input.
No valid-game, reachable-position, termination, or chess-outcome assumption is required.

`SourceModel.rows` has exactly 5,952 rows; `SourceModel.dag.root` is 5,951. The certificate
proves `dag_valid`, including every child bound, and the canonical serialized length of 17,858
natural words. `serialized_roundtrip` proves that serializing and parsing this actual table
returns the same DAG. The artifact emitter can consume `SourceModel.dag` directly.

The model contains 5,952 explicit shared Code definitions. A separate elaborator compares one
source constructor at a time with a model constructor. It memoizes the closed source expression
and target model name, then emits 7,076 ordinary named congruence theorems. Every theorem is
submitted to `Lean.addDecl` with synchronous kernel checking; no native evaluation result is
accepted as an equality proof. The resulting `source_eq_model` theorem has 7,037 cache hits in
its construction. Generator fuel and node bounds only limit proof generation.

The rows are explicit lists in 186 chunks of 32, joined by a balanced append tree. A balanced
`CodeTree.lookup` selects a model Code in logarithmic depth. Each chunk has a checked structural
certificate stating the exact constructor equation and child bounds for every literal row.
There are 371 ordinary block lemmas. Generic theorems convert that structural certificate into
indexed row certificates and prove `decode_of_model` by strong induction on the row index.
This avoids expanding the complete Code tree or repeatedly traversing large array literals.

The proof generator lives only in `SourceCertificate.Generator`. The 13,826 mathematical/data
roots include every model definition, generated congruence proof, row-block proof, public
theorem, and relevant recursor. A full type/value/recursor audit visits 18,682 dependencies,
rejects unsafe or partial dependencies and any generator dependency, and permits only
`propext`, `Classical.choice`, and `Quot.sound`. Forty-seven generator declarations and two
compiler recursion artifacts are inventoried separately; neither is in that safe closure.
Standard library default-tactic metadata is traversed and receives the same safety checks.
The structural row certificate itself is axiom-free.

The strict focused build passes. Kernel proofs reject changing the first literal opcode from
successor to tail and reject a self reference at row zero. Concrete metadata checks return
`(5952, 5951, 17858, true)` and reject the invalid child mutation. Audit negative controls reject
both an injected `sorryAx` root and an injected generator root.

The retained bounded experiments explain the construction choice. Ordinary Source import alone
exceeds a 2-GiB cap; at the authorized 8-GiB cap it takes 2.76 seconds with 3,327,426,560 bytes
peak RSS. A direct reflexivity experiment then reaches its 60-second cap. Shared source
congruence completes in 4.75 seconds with 1,969,537,024 bytes peak RSS. The initial indexed
array-row approach also reaches 60 seconds; the final structural certificate strict build takes
11.76 seconds with 2,137,964,544 bytes peak RSS. Logs, snapshots, audit inventory, exact commands,
and hashes are retained in `.unlazy/chess-m6/leaf-1.26/`.

The literal-table identity is complete. Wiring this table into the tape program, assembling the
final binary machine, producing the public matrix artifact, and satisfying the remaining M6
integration gates are separate work.
