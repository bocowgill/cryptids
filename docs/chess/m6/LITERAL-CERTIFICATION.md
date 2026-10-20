# Exact literal certification for M6

This is leaf 1.29's design audit and bounded experiment, not certification of the
full chess table. Use staged literal snapshots with exact decoded-row proofs.
Do not ask the kernel to reconstruct the closed hash-numbered compiler output.
The smallest useful kernel has been tested: exact local row equations imply
one-step decoding and halting equivalence, even with duplicate literal states.
Four actual Runtime normalization templates also check locally.

The remaining implementation is substantial: complete snapshots and row proofs,
the exact input bits, the final literal table and its count, and the challenge
theorem still have to be connected. No final state count is supplied here.

## Why local simulation is the practical identity route

For binary machines `L : Machine p 2`, `G : Machine q 2`, and
`decode : Fin p → Fin q`, require

```lean
∀ state bit,
  (L.transition state bit).map
    (fun (write, dir, next) ↦ (write, dir, decode next)) =
      G.transition (decode state) bit
```

Also require `decode 0 = 0`. This gives exact one-step decoding with the same
tape, and hence `Halts L ↔ Halts G`, including from every identical input tape.
Both `none` and `some` must match. A certificate that checks only successors
when the literal has a successor would allow false halting.

The decoder does not need injectivity, an inverse, surjectivity, a support
enumeration, or a proof that a target is its first occurrence. Duplicate states
are harmless. Every state and both scanned symbols do need a row proof. This is
useful for retaining an emitter's existing state order while avoiding a proof
that its hash table iteration agrees with kernel evaluation.

The analogous TM1 interface is

```lean
∀ i, TM1Number.mapStmt decode (Literal.machine i) = Source.machine (decode i)
```

with `decode 0 = default`. `TM1Number.stepAux_map` then gives exact configuration
decoding. For TM2 use `TM2Number.mapStmt` and `stepAux_map`, retaining the store
and all stacks. Those maps rename only jumps; they do not silently alter stack
or tape functions. See `NumberTM1.lean:26–49` and `NumberTM2.lean:19–44`.

These equations are a semantic certificate for the exact literal machine. They
are not an equality between that machine and the hash-numbered `twiceStack`
term. Equality to that particular numbering would additionally require its
count and every numbering decision. The allowed direct simulation route avoids
that unnecessary requirement. A separate theorem can still state the literal's
halting equivalence to the actual abstract `twiceStack` instance by composing
their independently proved equivalences to Runtime.

## Concrete snapshot chain

The numeric Runtime probe reports 345 numeric TM2 rows and 6,505 entries in
`sharedTapeLabels` after that frontend. The subsequent numbering prepends its
default, giving 6,506 candidate shared TM1 rows. The earlier lowering without
the numeric frontend had 6,504 support entries; these two constructions must
not be mixed. These are construction measurements, not local certificates for
every row or Post/final binary state counts.

| Stage | Literal representation and decoder | Exact proof obligation |
| --- | --- | --- |
| Numeric TM2 | Shared statement constants with numeric jump tables; each numeric label has a compact original Runtime macro-label witness. | `mapStmt decode (row i) = Runtime.machine (decode i)`, and label 0 decodes to Runtime's default/start. |
| Stack emulator | Descriptors `normal tm2Label`, `go stack action stmtID`, `ret stmtID`; statement IDs decode through shared TM2 syntax constants. | Generic equations for `TM2to1.tr`, with exact stack action function fields. |
| Normalized shared TM1 | A numeric label points to one shared TM1 statement constant over stack-emulator labels. | `TM1Number.mapStmt decode row = TM1Normalize.tr stackMachine (decode i)` for every row, including default and duplicates. |
| Binary TM1 | Descriptor `normal sharedLabel` or `write symbol stmtID`, plus a shared DAG of Boolean TM1 substatements. | Local equations for `Block.compilerFree`; decoded symbol values use the actual block code. |
| Second numeric TM1 | Numeric label points to a binary TM1 descriptor; all head/store-dependent jump functions are literal finite tables. | `mapStmt decode row = binaryMachine (decode i)`, initial label exact. |
| Post | A numeric row points to `(Option binaryStmtID, storeCode)`. | For each Boolean head, the decoded transition is exactly `TM1to0.tr` on that descriptor. |
| Binary body | Main and bounce blocks over numeric Post states, or a separate emitted order with a decoder. | `Binary.compile_main` and `compile_bounce`, or the binary row certificate above. |
| Blank initializer | Exact bit array and two numeric prefix ranges before the body block. | Literal prefix/body rows equal `FlatInit.machine`, exact bit equality, exact count and offsets. |

The stack descriptors are precisely Mathlib's constructors, not a new virtual
machine: `StackTuringMachine.lean:456–459`. Its `go` action is one of push, peek,
or pop, including the function field; `trStAct` is at lines 475–482 and
`trNormal` at 501–508. A label witness therefore needs the shared *substatement*
constant as well as a macro phase or numeric source label. A phase alone cannot
identify an arbitrary stack continuation.

For normalized labels, the decoder returns syntax, not an entry-label number.
`TM1Normalize.Label M` is `TM1.Stmt Γ Λ σ` (`Normalize.lean:20`). Its transition
contains at most one primitive followed by jumps to its original children;
original gotos jump to `M (f head store)` (`Normalize.lean:25–32`). Emit those
children as named shared constants. This prevents a proof from repeatedly
expanding all continuations. The default is `M default` through the specialized
normalizer instance (`Normalize.lean:22–23`); it must be witnessed explicitly,
not replaced by the generic statement default `.halt`.

The binary decoder has exactly the two families in `Block.lean:204–208`.
`write symbol stmtID` really writes all encoded bits, moves left by the block
width, and resumes the decoded substatement. Normal rows use
`fastNormalFree` (`Block.lean:192–201`). Its goto shortcut is valid only with
the proved `AllHeadFree` invariant, including every continuation
(`Block.lean:185–189,212–215`). Sampling one head does not establish that invariant.

The two Strong numbering passes do not change these shapes:
`cachedSharedProgram` captures the first numbered normalized machine
(`StrongAssembly.lean:373–391`), `cachedBoolProgram` captures the second numbered
Boolean machine (`296–308`), and `binaryPost` builds Post rows (`340–346`).
Literal snapshots can replace each materialized function for subsequent local
certification, after that snapshot's own row theorem has been proved.

## Proof construction without global compiler evaluation

Emit the native machine and, beside it, shared source statement constants and
descriptor witnesses for each emitted state. Native construction proposes the
data; it proves nothing. Use the witnesses only to construct ordinary proof
terms checked by the kernel.

1. Prove generic renaming, constructor-congruence, and compiler-template lemmas.
   TM2 and TM1 already supply the essential `stepAux_map` lemmas. Prove their
   row-certificate-to-configuration/halting corollaries once.
2. Give each distinct source substatement a named shared constant. Primitive
   function fields are either existing template expressions or small finite
   observation tables with complete extensional proofs. Finite label lookups
   are literal constructors, not `idxOf` or a fresh call to `numberLabel`.
3. For each literal row, prove one constructor equation against those named
   constants. SourceCertificate already demonstrates this method for 5952
   CodeDAG rows: `SourceCertificate.lean:21–39,175–220,243–253`.
4. Aggregate checked row proofs in bounded chunks with a balanced append tree.
   The existing CodeDAG certificate uses 32-row chunks and named intermediate
   theorem declarations. Reuse that architecture; do not package the entire
   machine in a single `decide` proposition or a giant recursive proof term.
5. Obtain a pointwise row theorem by a proved structural lookup lemma, then
   use the generic local simulation theorem. Check initial decoding separately.
   For TM1/TM2 this maps an `Option` control label and preserves the store/tapes.
6. Instantiate the existing stack, normalization, block, Post, binary, and
   initializer correctness theorems. Every source step must have a nonempty
   simulated path and stopping must correspond in both directions.

There is no need to run the original closed compiler in these proof terms.
There will still be references to the small generic compiler definitions and
their correctness theorems: a literal row's meaning must be justified somewhere.
The key is to reduce one decoded local template, never the whole support
collector, hash map, `Array.ofFn`, or compiled machine.

For a theorem mentioning the actual `StrongAssembly.twiceStack` instance, its
definition and `twiceStack_halts` remain dependencies in the proof closure.
They need not be evaluated. Instantiate `twiceStack_halts` symbolically, compose
through Runtime and the same input, and do not introduce a cast equating a
literal numeral with `(twiceStack ...).extraStates`. This yields halting
equivalence, not machine equality or identical finite-control numbering.
`twiceStack_halts` and the exact unchanged input equation are at
`StrongAssembly.lean:512–553`.

The store has five values. TM2 push/goto/load functions can be checked by five
cases; peek/pop functions require all 25 store/optional-symbol pairs. The shared
tape has 1250 symbols, so proving arbitrary tape-dependent functions equal by
enumerating every head/store pair can create 6250 cases per function. Use the
generic `trStAct` projection/update equations instead. At the Boolean stage,
complete extensional comparison needs both heads and all five stores, ten
observations per relevant function. Hash samples are never equality proofs.

## Post and final binary rows

Post descriptors must include the store value. An `Option` substatement without
the store loses finite-control state. The local specification is

```lean
∀ i head,
  (LiteralPost.machine i head).map (fun (next, command) ↦ (decode next, command)) =
    TM1to0.tr BinaryTM1.machine (decode i) head
```

Prove the obvious TM0 configuration-map lemma once. Give each literal row two
small proofs, using `trAux` template equations and named substatement constants.
`trAux` executes loads and branches without a TM0 step, but goto and halt each
emit a write of the current head (`PostTuringMachine.lean:506–517`). In particular
`some .halt` must emit that write and enter `(none, store)`; it must not be
certified as an immediate missing transition. All `(none, store)` rows are
missing transitions. Duplicates are allowed, including the explicit default
added by numbering.

If the published body retains ordinary main/bounce order, obtain exact binary
rows directly from the proved equations `Binary.lean:62–72`. Every Post state
has a bounce state, including states whose main row halts or never performs a
write. If a native emitter uses another order, attach main/bounce descriptor
witnesses and use the generic binary row certificate. The latter was tested in
this leaf; it does not require a numbering inverse.

Let the actual emitted Post table have `n` states. Ordinary `Binary.compile`
has `n + n` body states (`Binary.lean:50–55`). `NumberedPost.extraStates` is one
less than its number of states (`Stack.lean:150–155`), so if an emitter reports
`e` extra states, `n = e + 1`. Do not double `e` alone. The final literal `q`
must be measured from the emitted body and proved from its row-tree count.

## Exact initializer and published artifact

The supplied size figures are 141380 stack symbols, 1555180 bits at width 11,
and 3110360 initializer states. Their arithmetic is consistent, but this leaf
does not certify the actual input content or remeasure its serialization. That
work is separate from the generic initializer correctness theorem.

The required statement is exact content, for example

```lean
bits.toList = (blockInput C
  (TM2to1.trInit inputStack exactSerializedSourceAndGame)).map Binary.encodeSymbol
```

with the actual names/types chosen by the input implementation. Avoid a global
reduction of that expression. Use per-row serialization chunks, proved append
and reverse laws, per-symbol 11-bit encoding equations, and balanced chunk
congruence. `SourceCertificate.program_decode` identifies the CodeDAG syntax,
not the complete serialized stack or bit array. Natural-word encoding,
headers/root, game encoding, separators, stack order and bottom marker each
remain independently omittable obligations.

`TM2to1.trInit` reverses the input and puts the bottom marker on the first
symbol; empty input still creates a marked cell
(`StackTuringMachine.lean:486–488`). Thus a length formula alone, or simply
mapping the unreversed input to encoded symbols, is not the required tape.
The exact nonempty-input fact must justify the simple length formula here.

For `m = bits.size`, use FlatInit's exact ranges: `0 ≤ i < m` writes bit `i`
and moves right; `m ≤ i < 2m` preserves the scanned bit and moves left; states
`2m + j` run body row `j`, shifting every destination by `2m`.
`FlatInit.lean:26–54,144–156` gives those definitions and row/embedding facts;
the ready-to-use `transition_write`, `transition_return`, and `transition_body`
equations are at `227–249`. `initialise_run` and `initialise_halts` are at
`197–225`. Its count is
`body.states + 2 * bits.size`, so with the supplied bit length the proposed
final count formula is `2 * n + 3110360`. This is a formula, not a value of `q`.

Do not generate three million independent prefix proofs. Prove generic range
equations, a structural segment-concatenation theorem, and literal bit-chunk
equalities. A repeated left-moving return segment needs one generic segment
lemma. A bit chunk generates its finite write-row chunk with a verified
recurrence and fixed base/length. The final row tree must be proved equal to
these segments followed by the literal body. This identity, not only the
generic `FlatInit.initialise_halts` theorem, connects the emitted prefix.

The final kernel object must be the same full literal binary table that is
published. A balanced row tree can preserve all explicit rows while providing
logarithmic lookup. Prove its count, every row's two columns, valid references,
and equality to the row-lookup machine. `Tables.lean:25–49` illustrates the M5
artifact-to-literal convention; copying its monolithic `decide` checks is not
a measured scalable strategy. `Machine.ofRows` has default missing-transition
fallbacks (`Machines.lean:81–82`), so missing columns must not pass unnoticed.

Keep the published bytes and constructor literal synchronized by a single
exporter and retained row/chunk manifests. A native byte comparison or SHA-256
is useful integrity evidence, not a kernel proof. For a formal claim about
the file's decoded rows, include the file bytes as literal chunks and prove
parsing/row equality in the kernel, or make the checked constructor literal
itself the canonical published artifact and provide the text as its export.
A compact prefix description alone is not the requested actually emitted full
transition table. The native emitter still has to write every published row.

## Bounded experiments and their limits

Evidence is under `.unlazy/chess-m6/leaf-1.29/`. Reproduce with

```text
python3 .unlazy/chess-m6/leaf-1.29/run-probes.py
```

Each probe runs `lake env lean -DwarningAsError=true <own-file>` in a fresh
process with a 60-second cap, not an aggregate build. Peak child RSS is observed;
no memory limit was imposed. Latest measurements on this Darwin host:

| Probe | Result | Wall seconds | Peak RSS bytes |
| --- | --- | ---: | ---: |
| `LocalCertificate.lean` | exit 0, no timeout | 2.701 | 3490775040 |
| `RuntimeRows.lean` | exit 0, no timeout | 2.590 | 3514580992 |

`LocalCertificate.lean` proves exact step decoding, respects, both-direction
halting on blank and arbitrary input tapes, and preservation through FlatInit.
A two-state literal successfully collapses to one source state. A changed row
that falsely halts is proved not to satisfy the certificate. This is a useful
negative control. It is not a test of any full chess table.

`RuntimeRows.lean` proves a generic TM1 local-row step lemma, Runtime's initial
default/start identity, and exact normalized start, evaluate, halt-load and
push-branch rows. These use actual Runtime constructors and literal successor
witnesses; each local source equality is `rfl`. It does not enumerate or certify
all 6505 shared rows, or any full binary/Post snapshot. The measured RSS is
mostly imported-environment cost and is not a per-row memory estimate.

Both files' printed theorem closures contain only `propext`, `Classical.choice`
and `Quot.sound`. No `sorry`, `native_decide`, custom axiom or trusted native
compiler assertion is introduced. The first failed proof attempt and its log
are retained as `first-prototype.*`; final probes are clean. No full Strong
backend, huge prefix, whole table equality, or final `q` was evaluated here.

## Next implementation kernels and acceptance boundary

The next concrete kernel is the complete 345-row TM2 snapshot with original
Runtime decoder and exact entry proof; leaf 1.31 now owns that implementation.
The next stage after it is the complete normalized TM1 snapshot with shared
statement witnesses and template congruence. The tested rows support attempting
that stage; they do not establish its full certification cost. Then implement
binary substatement descriptors, the second numeric snapshot, and the Post
two-head row certificate. Measure bounded chunks before increasing their size.
Fresh-module checking is worth measuring because the current imports already
peak near 3.5 GB; one giant file is not justified by these small checks.

In parallel, finish the exact bit representation and segment theorem for the
initializer. Finally load the emitted literal row tree, check all body and
segment certificates, prove the exact state numeral and machine identity to
those rows, compose all halting equivalences, and instantiate the full chess
challenge. A well-typed abstract compiler theorem, a native table hash, an
unlinked emitted file, and a finite collection of representative row proofs
each leave that final obligation open.

Source basenames above refer to `Cryptids/Compilation/`, except
`SourceCertificate.lean` in `Cryptids/Chess/Compilation/`, `Machines.lean` in
`Cryptids/`, and Mathlib's `StackTuringMachine.lean` and
`PostTuringMachine.lean` in
`.lake/packages/mathlib/Mathlib/Computability/TuringMachine/`.
