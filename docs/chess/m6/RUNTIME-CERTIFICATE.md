# Literal numeric TM2 runtime certificate

`RuntimeModel.lean` is a complete literal snapshot of the fixed runtime's numeric TM2
control. `RuntimeCertificate.lean` proves its exact local decoding to the unchanged
`Runtime.machine`, including ordinary initialization and both termination directions.
No global numbering, hashing, backend traversal, or native construction identity is
assumed by the proof.

The model has 345 numeric rows and 654 shared statement constants. These retain the
explicit default row and all source-list duplicates. The model imports no Runtime module;
its executable dependency closure is independently checked to contain no Runtime
declaration. Its only runtime control type is `Fin 345`. Program rows and evaluation
program counters on tape remain data.

## Literal model

Namespace `ConjectureMachines.Compilation.RuntimeModel` exports:

```lean
abbrev Label := Fin 345
abbrev Store := Option PartrecToTM2.Γ'
abbrev Alphabet (_ : PartrecToTM2.K') := PartrecToTM2.Γ'
abbrev Stmt := TM2.Stmt Alphabet Label Store

rows : Array Stmt
rows_size : rows.size = 345
machine : Label → Stmt
```

Every statement is an explicit TM2 constructor referring only to earlier shared
statement constants. Primitive functions are literal tables over the five possible
store values: absent, frame marker, natural separator, zero bit, and one bit.
Push, load, branch, and goto fields use five entries; peek and pop use all 25 store/head
combinations. Goto entries are numeric labels, not source-label closures. The `table5`
function is a direct constructor match, with no search or source-program operation.

The 345 array entries reference the shared statement constants. `machine` performs
numeric array lookup. Its `.halt` fallback is outside every valid `Fin 345` index,
as checked by `rows_size` and by certification of every actual row. This snapshot
requires no executable Runtime call, source-label equality, source-label hash, or
first-occurrence lookup.

## Complete local row proof

`RuntimeCertificate.decode` maps a numeric row to the corresponding element of the
fixed source list `Runtime.label .start :: Runtime.labels`. This is a local index
decoder, not a search for any label's first occurrence. The decoder need not be injective,
and the proof assumes no inverse numbering or global order identity.

There are 345 separate kernel-checked equalities, `row_000` through `row_344`.
Their complete finite aggregation is:

```lean
RuntimeCertificate.rows (state : RuntimeModel.Label) :
  TM2Number.mapStmt RuntimeCertificate.decode (RuntimeModel.machine state) =
    Runtime.machine (RuntimeCertificate.decode state)
```

Each equality checks all statement constructors and finite function fields. The checked
equality instance uses structural constructor congruence and finite function enumeration;
`decide +kernel` performs these reductions in the Lean kernel. It does not use
`native_decide` or a compiler-trust axiom. `import all Init.Util` makes the logical
definition of Lean's existing safe pointer-equality wrapper available inside module mode.
Kernel reduction uses its logical fallback; no native pointer result is used as evidence.
The dependency audit allows only the standard axioms.

The native emitter proposes finite tables, and the Python generator shares identical
statement descriptions. Their output is input to the kernel checks, not a premise of
the certificate. A deliberately altered first-row goto is independently rejected by
the same kernel checker as a false proposition. Metadata hashes are reproducibility
fingerprints and are not mathematical evidence of row correctness.

## Exact execution and initialization

`decodeCfg` applies the local decoder only to the optional control label. It preserves
the exact store and all four complete stacks. The row proof and the already verified
`TM2Number.stepAux_map` yield:

```lean
RuntimeCertificate.step_decode config :
  (TM2.step RuntimeModel.machine config).map RuntimeCertificate.decodeCfg =
    TM2.step Runtime.machine (RuntimeCertificate.decodeCfg config)
```

This equality includes missing successors after halt. `respects` gives positive-step
simulation, and `dom_cfg` proves both termination directions for every literal numeric
configuration. No source support oracle or coverage assumption is required: every
possible literal row is checked directly.

`decode_zero` proves that numeric state zero decodes to `Runtime.label .start`.
`decode_init` uses ordinary `TM2.init`, with the local source default set to that startup
label, and retains the initial store and every input/empty stack. For every chosen
input stack and finite input, the exported result is:

```lean
RuntimeCertificate.eval_dom (inputStack : PartrecToTM2.K') (input : List PartrecToTM2.Γ') :
  letI : Inhabited PartrecToTM2.Λ' := ⟨Runtime.label .start⟩
  (TM2.eval RuntimeModel.machine inputStack input).Dom ↔
    (TM2.eval Runtime.machine inputStack input).Dom
```

`supports` proves the literal numeric machine is supported on `Finset.univ`, for use
by the later verified stack/tape backend. The statement preserves the actual finite
store/stack semantics on arbitrary data, including malformed interpreter input.

## Verification and scope

The strict focused build is:

```text
env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Compilation.RuntimeCertificate
```

The final certificate build completed in 23 seconds. A separately capped three-row
module-mode experiment completed in 2.244 seconds under a 60-second process cap.
These are bounded measurements on this host, not a general performance claim.

The full audit covers 1021 model/certificate declarations and 4987 transitive dependencies,
with only propext, Classical.choice, and Quot.sound. The model-only audit covers 664
declarations and 973 dependencies, with propext alone, and rejects any Runtime dependency.
There are no unsafe or partial dependencies and no generated recursive artifacts in
these two source namespaces. Negative controls reject an injected axiom, an imported
unsafe compiler artifact, a model-to-Runtime dependency, and an incorrect literal row.

Eight kernel API assertions supplement the 345 checked rows. Three paired native runs
start both literal and source machines from ordinary initialization on small zero,
successor, and tail tables. They match the final store and all four stacks, produce the
expected values, and take exactly 77, 112, and 102 steps respectively. Those experiments
are evidence only for their exact inputs; arbitrary-input equivalence is proved above.

No full chess search or stack/binary backend emission was run for this leaf. This
certificate links the complete literal TM2 runtime to the unchanged source runtime.
The subsequent tape/binary constructors and exact published table identity remain
integration obligations. This result does not complete M6. M7 remains unstarted.

Reproducible generators, finite row proposals, positive and negative checks, four-pass
review, and hashes are in `.unlazy/chess-m6/leaf-1.31/`.
