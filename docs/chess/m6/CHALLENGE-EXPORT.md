# Independent M6 challenge export

`scripts/BuildChessM6Challenge.lean` proposes a standalone dependency snapshot for named
safe data definitions and the **types** of named source theorems. It is export tooling,
not a dependency or proof of the chess reduction. The final chess challenge, comparison
program, full table export and byte agreement are root integration obligations.

The command accepts `--source MODULE`, `--output FILE`, repeated `--root NAME`, and
`--goal SOURCE[=TARGET]`. Optional `--search DIR` supplies fixture object files;
`--base MODULE` selects fixed Lean/core/Std/Mathlib imports, and `--forbid PREFIX`
rejects an additional dependency namespace. Without `--base`, the fixed bases are Lean
and Mathlib's PostTuringMachine module. The production output path can be
`Cryptids/ChessM6Challenge.lean`; that path does not import the solution.

## Exact mathematical boundary

The generated file imports only the configured fixed library modules and Lean's normal
elaboration APIs. It neither imports the source module nor reads it at replay time.
Names, levels, expressions and declarations are fixed constructor data. Expressions
form a topologically ordered DAG, encoded in bounded JSON chunks and decoded by a
fixed, self-contained metaprogram. Unknown tags and forward/out-of-range child indices
are errors. Each proposed logical declaration is submitted to `Lean.addDecl` with the
ordinary kernel check enabled. Local inductive groups are replayed through
`Declaration.inductDecl`, and their generated constructor/recursor metadata and rules
are checked against fixed expected values.

Kernel acceptance establishes well-typedness, not agreement with the intended target.
The independent comparison must load source and snapshot in different environments and
compare every transitive target type/value, including opaque values, proof fields,
inductive groups, constructors and recursor rules. Bound universe parameters may be
renamed by position as in CompareChessM5. The generator does not normalize mathematical
target expressions. Private names, binder names, metadata, literals and definition
bodies remain fixed. Its manifest maps each `dN` payload to the declaration names it
adds; this supports precise valid-definition mutation controls.

The inventory rejects nonstandard axioms, local axioms, unsafe/partial mathematical
dependencies, local `implemented_by`, forbidden prefixes and any dependency on a
selected source theorem. Module ownership determines which declarations already come
from fixed base imports; this is only a selection optimization. Deep independent
comparison remains authoritative. Mathematical syntax-bearing declarations are listed
in the manifest, rather than silently normalized.

Each selected theorem becomes a reference-only axiom named
`M6SnapshotReferenceGoals.<target>`, followed by a theorem at the exact target name whose
body is precisely that axiom constant. This preserves the theorem/theorem declaration
kind expected by the ordinary comparator without copying the source proof. A dedicated
comparison must check the reference name, axiom type and exact bridge body. The source
solution proof is separately audited for the three standard axioms, and neither the
reference assumption nor its bridge may appear in its dependencies or any machine-data
or runtime-equality proof closure. This reference goal is an open specification, not a
premise in the source reduction theorem.

## Independent execution

Adding a checked `ConstantInfo` does not register executable IR. The snapshot therefore
regenerates its own executable definitions through Lean's ordinary compiler APIs.
Inductive layouts are registered with `compileDecls`; source matcher, projection,
auxiliary recursor, sparse-cases, inline and reducibility metadata are fixed replay data.
No source IR or hand-authored unsafe implementation is copied.

For structural recursive groups, fixed `EqnInfo` source expressions become ordinary
`PreDefinition`s under separate `M6SnapshotRuntime` names. Normal structural recursion
elaboration generates their safe definitions and compiler auxiliaries. Before any
compiler simplification replacement is registered, a kernel-checked `Eq.refl` theorem
must identify the entire original safe definition with its regenerated safe alias.

For well-founded recursion, the original safe definition remains byte-for-byte fixed.
The generator requires the normal source `f.eq_def` theorem and kernel-checks a new
unfolding theorem against the fixed recursive source expression. Only then does the
ordinary partial-recursion compiler regenerate an executable auxiliary from exactly
that expression, with recursive calls renamed to the aliases. The safe alias has the
original checked kernel body and a kernel-checked equality to the original function.
Missing unfolding metadata or unsupported recursion fails closed.

Lean's `_recApp` annotation can contain a `Syntax.SourceInfo` substring backed by the
entire original source file. Such an annotation could include unrelated solution proof
text as inert data. The exporter erases only this diagnostic annotation from the extra
runtime source forms and extra runtime-certificate theorem proof values. It preserves
all expressions in the actual mathematical target closure. The source-equation kernel
check uses precisely that diagnostically erased expression. If a required mathematical
declaration contains such source text, it must be reviewed before changing the exact
comparison boundary; the exporter does not erase it.

Compiler-generated partial/unsafe helpers are permitted only outside every logical
target, safe-alias and equality-proof dependency closure. The prototype audit prints
these helpers separately and follows all safe alias/proof dependencies. Native code
execution has the same compiler boundary as ordinary Lean elaboration; exact logical
comparison and an independent exported-byte check are both still required. A native
hash, successful runtime example or copied compiler metadata alone is insufficient.

The prototype exercises an independently imported recursive inductive function, a
proof-field structure, private data, mutual recursion, an indexed inductive, an opaque
constant and well-founded recursion. It also executes the actual `LazyGraph.trAux` on
a two-node load-to-halt graph using only its snapshot. Source record-construction syntax
is not promised: use explicit constructors, since kernel constructor/projection data
are reproduced without all source elaborator convenience metadata.

## Evidence and pending integration

Reproducible commands, resource caps, exact comparison, execution and mutation controls
are retained under `.unlazy/chess-m6/leaf-1.42/`. Every process records its command,
working directory, exit status, wall-clock cap and sampled process-tree RSS. The runner
is macOS-specific; replay and comparison Lean sources do not depend on libproc.
Old measurements whose method lacks `proc_listchildpids returns PID count` monitored
only part of the process tree and must not be used for peak-memory claims.

The evidence includes valid kernel-building changes to a private numeral, the frozen
proposition and the reference bridge namespace; each must fail independent comparison.
It also changes matcher metadata and the structural/WF recursive source expressions;
these must fail alias construction or kernel certificates before a byte comparison.
Forbidden local axioms, unsafe functions, partial functions and source-proof data
contamination must be rejected by inventory.

The final Image challenge must still be generated, kernel-built, compared against the
actual frozen machine and chess proposition, compiled into an independent exporter and
used to reproduce the complete table bytes. This document does not certify that table
or claim completion of M6.

Use `--auto-base` for the actual target. It selects only permitted library owners from
the audited dependency closure and removes redundant transitive imports. For Input this
reduces literal copies from 668 to 440 project declarations; its generated bases are
exactly Lean and `Mathlib.Computability.TuringMachine.ToPartrec`. The original 71,146-node
pool becomes 63,473 nodes. This does not change the 4,486-declaration mathematical closure.

The final focused suite passes exact comparison of 1,506 fixture declarations and 1,824
actual LazyGraph declarations, independently executes both, and passes all ten negative
scenarios. Input replay completes in 56.508 seconds with 2.539 GB sampled process-tree
RSS; independent execution constructs exactly 1,555,180 input bits in 6.926 seconds.
Its direct comparison matches 4,486 declarations and 3,977 bodies in 6.142 seconds. That
comparison retains two environments and needs 9.149 GB, so the root explicitly allowed
a 16 GiB/120-second comparison cap after retaining the 8 GiB failure. Per-producer
experiments retain the default 8 GiB cap. Figures use decimal GB; the caps use GiB.
The runner samples every 0.15 seconds and may observe a small overshoot before killing.

The first-command filesystem probe reaches the import-complete marker in 2.772 seconds;
this and explicit flushed phase output distinguish startup from later replay work.
Earlier empty `logInfo` traces alone do not locate the stalled phase. Unreduced single
and chunked JSON variants exceeded 60 seconds; a data-only extracted payload compiled
in 1.693 seconds. The successful library-owner reduction made further module splitting
unnecessary for the measured Input target. Larger targets should use observed decoder,
logical `dN` and runtime phase progress before extending a cap or splitting replay into
independent modules. No particular full-Image replay cost is inferred from these tests.

The actual built target inventory was exported successfully under the 8 GiB/120-second
producer cap: 30.902 seconds, 6.911 GB, 6,613 copied declarations, 210,777 Expr nodes,
6,539 kernel commands and seven runtime recursive aliases. It has 13,860 mathematical
closure declarations and no syntax-bearing mathematical declarations. The proposed
snapshot is 11,686,651 bytes. Its built source theorem name is
`ConjectureMachines.Semantics.Chess.halts_chess_baseline_iff_not_draw`, and its machine
root is `ConjectureMachines.Machines.chess_baseline`. This is an export inventory only;
root must still replay, compare and execute the actual final challenge.
