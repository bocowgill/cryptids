# Complete finite shared-tape certificate

`SharedModel.lean` supplies a complete numeric normalized TM1 machine with 4042
states. `SharedCertificate.lean` proves every decoded local row equals
`TM1Normalize.tr (TM2to1.tr RuntimeModel.machine)`, proves initial decoding, and
transfers both termination directions through the literal Runtime snapshot to
the unchanged Runtime. This is a source-lowering stage of M6; it is not the
final binary table, its state count, or the chess challenge certificate.

## Model and numbering

The construction reads the independently certified RuntimeModel's 345 numeric
rows and 654 shared TM2 statement constants. It proposes 1283 explicit stack
label witnesses: 345 `normal` labels, one `go` label for each of the 284
push/peek/pop statement constants, and 654 `ret` labels. Keeping extra return
roots is intentional and harmless. No claim of minimum support is made.

Their raw TM1 syntax is shared as 4042 named constants. These become normalized
numeric rows with the following constructor counts:

| Kind | Count |
| --- | ---: |
| branch | 1233 |
| move | 1188 |
| goto | 1119 |
| write | 270 |
| load | 231 |
| halt | 1 |

Each state stores a pair of its numeric normalized statement and its raw source
statement witness. A balanced tree contains all 4042 pairs in 127 named chunks
of at most 32 leaves. `entries_count` and `entries_wellFormed` check the exact
leaf count and cached branch sizes. Machine and decoder project the same leaf:

```lean
SharedModel.machine : Fin 4042 → SharedModel.Stmt
SharedModel.decode : Fin 4042 → SharedModel.RawStmt
```

Numeric jumps are literal five-store tables and ignore the tape head. Primitive
fields retain exact small template expressions, using projections of the
literal RuntimeModel statements. They include the real coordinate updates,
stack reads and marker tests. No 1250-head-by-five-store matrix is introduced.
`SharedModel` has no dependency on the original Runtime or a control compiler
in its declaration closure. Its raw syntax witnesses are finite data.

This numbering does not match StrongAssembly's order or support count. It
directly describes a complete supported machine. The native proposal generator
does not decide function equality or compute a first-occurrence hash index.
Its metadata is not an assumption of any theorem: a wrong proposal must fail a
local kernel equation, initial equation or structural table check.

## Complete checked interface

Let `stackMachine := TM2to1.tr RuntimeModel.machine`, and let `SourceLabel` be
`TM1Normalize.Label stackMachine`, whose values are raw TM1 statements. The main
row theorem is

```lean
SharedCertificate.rows :
  LocalCertificate.TM1Rows SharedModel.machine
    (TM1Normalize.tr stackMachine) SharedCertificate.decode
```

It holds for every numeric state and preserves every primitive function field
and successor. `initial` proves that state zero decodes to the normalizer's
actual specialized default, `stackMachine default`.

`step_decode` preserves complete configurations, including store, tape and
missing successor; `dom_cfg` gives both termination directions from every
numeric configuration. `eval_dom` composes the local certificate with
normalization on every shared-tape input. The exact stack-input theorem is

```lean
SharedCertificate.stack_eval_dom (k : K') (input : List Γ') :
  (TM1.eval SharedModel.machine (TM2to1.trInit k input)).Dom ↔
    (TM2.eval RuntimeModel.machine k input).Dom
```

`runtime_eval_dom` composes that result with `RuntimeCertificate.eval_dom` for
every stack and finite input, using Runtime's start label. The stack initializer
is the actual Mathlib `trInit`, including input reversal and the bottom marker.
No chess input, initial game value or halting result is evaluated by these
theorems.

The next block compiler also receives `supports` on `Finset.univ`,
`allHeadFree` for every row and continuation, and `onePrimitive` for every row.
No support enumeration oracle is needed for the numeric machine.

## Proof architecture and measured failure

Each literal pair has a `Row` certificate with three fields: exact statement
meaning, `Block.AllHeadFree`, and `TM1Normalize.OnePrimitive`. The certificate
checks every leaf, including unreachable or duplicate witnesses. `AllRows` is a
structural predicate on the balanced tree; `allRows_lookup` proves that any
lookup returns a certified row. The out-of-range fallback is separately
certified as halt. The table's count and cache validity remain checked even
though lookup certification itself needs no numbering bijection.

The first implementation compared every row to the closed source with repeated
`rfl` reduction. Its complete build hit a 240-second cap. Selected local rows
were sound, but that was insufficient for a complete artifact. The final proof
checks 4042 decoder lookup equations and 1117 used source-root equations once,
then reuses them with primitive constructor congruence. Goto functions are
proved extensionally over the five stores; the scanned head is arbitrary.
Checking every source array lookup again in every store case is avoided.

This is proof reuse in the kernel, not native reflection or a hash certificate.
There is no `idxOf`, global support collector, `numberLabel`, `native_decide`,
new axiom or trusted compiled compiler assertion in the implementation.

The completed strict focused build took 25.9 seconds with an observed child peak
RSS of 3716022272 bytes on the recorded Darwin host. The first full timeout's
RSS measurement does not cover unreaped grandchildren and is not a reliable
Lean peak. Each final verification command has a recorded cap; no memory cap
was imposed. No aggregate build or full binary backend was run by this leaf.

## Independent verification and provenance

Evidence, executable proposals, tests and measurements are in
`.unlazy/chess-m6/leaf-1.33/`. `generate.py --check` reproduces both production
files from leaf 1.31's frozen snapshot metadata and checks exact generated text.
The generator proposes data and proof terms; the strict Lean build checks all
resulting equations against the actual RuntimeModel definitions.

The full declaration dependency audit checks 18886 safe model/certificate
declarations and 25335 dependencies. Its only axioms are `propext`,
`Classical.choice` and `Quot.sound`. The separately identified compiler artifact
`AllRows._unsafe_rec` is outside the logical roots and has a checked safe total
owner with the same type. Unsafe/partial dependencies in the actual closure are
rejected. The model-only audit checks 9523 declarations and 10681 dependencies,
finds only `propext`, and confirms no original Runtime, normalization compiler,
stack compiler or StrongAssembly dependency.

The retained negative controls inject a forbidden axiom, a partial recursion
artifact, a forbidden original-Runtime model dependency, and an incorrect first
numeric jump; all are rejected. A separate kernel proof establishes that the
mutated row cannot satisfy `Row`, by observing the incompatible normal/go
destination constructors. It uses only `propext`.

Twelve API assertions and three paired normalized-source executions pass. Zero
takes 2307 exact normalized steps, successor 3856 and tail 5564. Each pair has
the same final tape and store. Tape comparison uses a checked injective
canonicalization of the full half-tapes. These are bounded execution fixtures;
the universal semantic claims come from the row and domain theorems above.

Reproduction commands include:

```text
python3 .unlazy/chess-m6/leaf-1.33/generate.py --check
env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Compilation.SharedCertificate
env ELAN_NO_UPDATE_CHECK=1 lake env lean --run .unlazy/chess-m6/leaf-1.33/Audit.lean
env ELAN_NO_UPDATE_CHECK=1 lake env lean --run .unlazy/chess-m6/leaf-1.33/Audit.lean --model-only
env ELAN_NO_UPDATE_CHECK=1 lake env lean -DwarningAsError=true .unlazy/chess-m6/leaf-1.33/Fixtures.lean
```

The next M6 stage must still emit and certify Boolean TM1 and Post rows, connect
the exact program/input bits and initializer, publish the full binary table with
its exact numeral, and establish the challenge theorem for that literal object.
The count 4042 belongs only to this shared TM1 snapshot.
