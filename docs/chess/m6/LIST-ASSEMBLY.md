# Exact finite equality and certified construction

`ListEquality.lean` and `ListAssembly.lean` address construction cost in the
numeric Runtime backend. They preserve the frozen compiler semantics. They do
not change the chess source, its input, or the proposition represented by halting.

## Exact decisions

Finite function equality traverses supplied observation lists whose coverage is
proved. Dependent functions, curried tables, TM2 statements/actions/labels, the
shared tape alphabet, and TM1 statements all have constructive equality
procedures. Duplicated observations are allowed. Hash collisions still invoke
complete equality; a hash is never used as evidence of mathematical equality.

Most normalized TM1 jumps ignore the tape head. `HeadFree.Label` is a subtype
carrying the actual `Block.AllHeadFree` proof. Its comparison checks all stores
for a goto; the certificate proves this is equivalent to comparing every
head/store combination. Writes, loads, and branches still compare all head/store
observations. The certificates are transported from the actual TM2 compiler
through subterm normalization. They erase at runtime; no executable test or
assumption of head-freedom is introduced.

Binary write-emulator labels contain source continuations. `BinaryLabelFree` and
`binaryFreeLabelDecEq` apply the same certified comparison to these continuations.
Their written symbol and control constructor remain part of equality.

## Construction interface and proofs

`cachedFreeSharedProgram` materializes the first numeric program once and proves
its getter equals the established `fastTM1` program exactly. Its compatibility
wrapper `freeStack` equals the sealed `StrongAssembly.twiceStack` package,
including state order and input, and has the same two-way halting theorem.

`BinaryIndex.program` constructs the second numeric control index using certified
binary keys. It retains the complete ordered control bound, including duplicate
positions required by the old numbering. Its inverse array and first-occurrence
hash map are captured once. The getter creates only the requested numeric
procedure and caches that procedure's Boolean-head/store goto table; it does not
retain a matrix of all expanded binary procedures.

`BinaryIndex.program_eq` proves the getter equals
`TM1Number.numberProgram (Block.compilerFree C source) labels` exactly.
`program_dom` proves termination equivalence in both directions on every finite
Boolean input. `program_supports` supplies complete finite support. All key
certificates are obtained from actual finite-support and head-freedom proofs.
The generic `Certified.indexedBoolProgram` also supports other proved key
properties without executable property checks.

## Measured construction evidence

The retained native probes use the actual 344-label Runtime, first lowered to
345 numeric TM2 procedures. All runs used a 300-second construction-phase limit
and an 8-GiB RSS limit after the explicitly recorded earlier overall-cap probes.

| Probe | Measured result |
| --- | --- |
| General explicit-list equality | First 6,506 TM1 procedures materialized at 226,049 ms; subsequent binary materialization exceeded the earlier overall cap. |
| Certified source equality | First 6,506 TM1 procedures materialized at 20,277 ms; old second-pass materialization exceeded its phase cap. |
| Certified lazy binary index | Source procedures at 20,528 ms; 587,756 ordered binary labels at 20,540 ms; index completed at 21,166 ms. |

The completed binary index has **284,006 distinct key entries** and a
**587,757-element intermediate binary TM1 control type**. Its native run completed
in 22.783 seconds with peak RSS 176,291,840 bytes. These figures are construction
measurements, not the final Post-machine state count. Neither capped run supplies
such a count. The final Post support collector and source/table certificate are
separate integration work.

The duplicate and collision probes also retain 100 completed comparisons for
both the existing equality and the explicit-list equality. The important speedup
comes from proved head-independent jumps and avoiding eager full binary
materialization, rather than from assuming that sampled hashes decide equality.

## Verification

The focused strict builds pass for both modules. Twenty executable assertions
cover nondefault head/store differences, dependent function domains, repeated
observations, certified and ordinary equality, constant-hash collisions,
first-occurrence binary indexing, all small-program numeric rows, preserved
finite input, and terminating compiled push/halt execution. Kernel examples
instantiate the arbitrary-input halting and support theorems.

The dependency audit inventories every declaration owned by both modules:
259 safe roots and 8,278 declarations in their full dependency closure. Four
compiler-generated recursion artifacts are inventoried separately and are absent
from that safe closure. The only axioms are `propext`, `Classical.choice`, and
`Quot.sound`; an explicit `sorryAx` negative control is rejected. All 18 frozen
M5 compiler source hashes still match. Reproducible probes, timestamps, RSS
samples, archived source, and verification output fingerprints are retained under
`.unlazy/chess-m6/leaf-1.32/`.

A later compatibility correction replaced one word in a documentation comment so
that the unchanged frozen M5 source scanner accepts this module. The exact
pre-correction source is archived with its original measurement hash. Verification
checks that the archive matches the historical launch fingerprints and that the
current file differs only by that single comment replacement; declarations and
bodies are unchanged. Historical probe logs and launch hashes are preserved.
