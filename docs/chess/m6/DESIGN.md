# M6 baseline construction

The target is an ordinary two-symbol Turing machine, started in state zero on an
all-zero tape, that halts exactly when the frozen standard initial position is
**not drawn**. Construction does not evaluate that position's value. The frozen
reference is `chess-reference-v1`; neither M6 nor its proof changes the M1–M5 inputs.

## Mathematical path

`Source.program` is concrete `Turing.ToPartrec.Code`. Its arithmetic, list,
geometry, move validation, updates, history, optional draw claims, adjudication
and evaluator procedures have explicit refinement proofs. `WithoutDead` defers
only dead-position adjudication internally, with a proof that the complete game
value is preserved on every raw game. The runtime keeps the complete history,
halfmove clock and claim choices. It has no heuristic or fuel-exhaustion draw.

`SourceCertificate.program_decode` identifies the exact syntax of the shared
5,952-row program. The full program, initial game and continuation data are tape
data for a fixed four-stack interpreter. `RuntimeProof` proves positive-step
simulation and both directions of termination correspondence. Literal runtime
and normalized primitive control snapshots have complete local-row certificates.

`Templates` retains pure finite primitive rows and arithmetic symbol/store codes.
Its proof records (`WriteSites` and validity certificates) are separate from the
executable data. `TemplateGraph` shares read/write/move suffixes in a finite
acyclic Boolean graph, with arithmetic getters instead of constructing its entire
node vector. `LazyGraph` proves these getters describe the exact finite Post
machine, including missing transitions. All 2,048 words of the 11-bit codec have
the specified decoder behavior; unused words are not assumed unreachable in the
row correspondence theorem.

`Image` instantiates those generic proofs for the actual chess interpreter.
`Binary.compile` replaces each Post state with a main and preserving return
state. `FlatInit.initialise` writes every program/input bit, returns the head to
the start, and enters the body after exactly twice the number of input bits.
The explicit index cast preserves every transition, configuration and halting
condition. `Image.halts_iff` states the unconditional strategic equivalence.

## Complete accounting

| Layer | Count |
|---|---:|
| Primitive normalized rows | 4,042 |
| Graph nodes, including all reserved cells | 38,893,646 |
| Post controls | 194,468,236 |
| Binary body controls | 388,936,472 |
| Program/input bits | 1,555,180 |
| Paid blank initializer controls and steps | 3,110,360 |
| Final binary states | **392,046,832** |

The final count includes unreachable reserved slots, all stores, writer controls,
return states and the entire initializer. It is an initial correctness baseline;
state reduction belongs to M7. Earlier capped hash-based construction experiments
are retained as engineering evidence and do not determine this artifact's count.

The 4,042 primitive rows partition into 1,734 read-bearing rows, 1,188 moves,
1,119 plain jumps and one halt. The read-bearing rows include 1,233 branches,
231 loads and 270 writes; those writes also allocate separate writer suffixes.
Read-site and write-site counts therefore overlap rather than forming a partition.

## Publication and independent checks

The retained canonical table has one LF-terminated row per state, in numeric
order, with columns for scanned zero and one. A cell is `---` for halt or
`0L17`/`1R23` for write, move and destination. Every destination is checked against
the complete state range. The table is retained as ordered lossless gzip parts;
the parts manifest fixes each range, byte length and both compressed and raw
SHA-256 hashes. Part boundaries do not alter machine semantics.

The source exporter reads `Image.machine`. A standalone challenge reconstructs
the target's exact safe declarations using fixed constructor data and kernel
checking, importing only Mathlib/Lean/core and independent snapshot chunks. It
never copies the selected solution theorem's proof. An explicitly labelled
reference-only goal is separate from the source proof. A deep comparator checks
the theorem type and every transitive type, value and inductive/recursor field;
only positional renaming of bound universe parameters is normalized. The source
proof and regenerated runtime aliases receive separate standard-axiom audits.

An independently built exporter imports that standalone target. The full artifact
check must compare every canonical row byte against that executable, rather than
sampling or trusting hashes. Local reproduction also checks deterministic gzip
bytes using the recorded Python/zlib versions; across zlib versions, canonical raw
bytes remain the portable identity. Native printing, gzip and SHA-256 are external
verification tools, not Lean theorems about file I/O. The Lean proof establishes
the finite mathematical transition function, and complete independent byte
comparison connects the retained files to it.

The [final results](RESULTS.md) record successful publication, standalone identity,
full byte comparison, Linux sandbox, regression and independent review checks.
The [acceptance ledger](GATES.md) closes all eight M6 requirements. No bounded run
of this machine is evidence that chess is drawn; the initial value was not computed.
