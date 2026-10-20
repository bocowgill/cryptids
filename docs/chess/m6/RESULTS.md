# M6 results

Status: **complete — all eight acceptance gates met**. The implementation and
complete retained table are on `codex/chess-baseline-m6`, at checked code commit
`256d7e1a91546d4b2289edf2b075ab7ffa2aa0ee`. The local exhaustive byte/gzip comparison,
supported Linux verification and final independent publication review pass.
The [machine-readable evidence](results.json) records the exact reports and pins.

The construction provides an explicit **392,046,832-state, two-symbol** machine
whose Lean theorem is

```lean
Halts ConjectureMachines.Machines.chess_baseline ↔
  ¬(Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss)
```

It starts in ordinary state 0 on the all-zero, two-sided tape. A missing
transition halts. It writes its own complete program and initial chess data.
The frozen reference is `chess-reference-v1`; its original specification and
all M1–M5 mathematical/computational sources remain fixed. Neither construction
nor verification computes the initial position's value. M7 and outreach remain
unstarted.

## Artifact and size

| Item | Count |
|---|---:|
| Shared chess source DAG rows | 5,952 |
| Numeric interpreter controls | 345 |
| Normalized primitive rows | 4,042 |
| Boolean graph nodes, including reserved slots | 38,893,646 |
| Post controls, including every store | 194,468,236 |
| Binary body states, including return controls | 388,936,472 |
| Program and initial-game bits | 1,555,180 |
| Blank initializer states and exact startup steps | 3,110,360 |
| **Final binary states** | **392,046,832** |

The entire transition table is retained in [393 ordered gzip parts](../../../artifacts/chess_baseline/README.md).
Together they contain 392,046,832 canonical rows, two columns per row,
8,979,481,064 raw bytes and 1,762,091,864 compressed bytes. It is possible to
recover every row by decompression alone. No chess search or compiler is needed
to extract the table.

The canonical stream's SHA-256 is
`85254453db2653e6a057307006848fea92c9dc1e1aba74c68f4fbc78cee8421e`.
The [parts manifest](../../../artifacts/chess_baseline/table/manifest.json) has SHA-256
`83e1d7442e5c9fac9ca928d7db2747c0b60b3ecd2612d54a674bfa105c573357`.
The [construction manifest](../../../artifacts/chess_baseline/manifest.json)
records all counts, the frozen source identity, proof roots, exact publication
inputs and the compression runtime. All unreachable/reserved controls are paid.

## Proof and independent identity

[The proof guide](BINARY-COMPILATION.md) follows every link from concrete source
procedures through the literal DAG, fixed stack interpreter, exact numeric
runtime, primitive templates, Boolean graph, Post lowering, binary lowering and
blank initialization. `Image.initialises` proves the exact startup execution.
`Image.halts_iff` proves the unconditional strategic equivalence.

`Matrix.identity`, `row_count` and `column_count` identify the ordinary complete
row-list machine with this indexed transition function. They quantify over every
state and both symbols, including unreachable states. The full exporter avoids
allocating that giant list; this is a representation choice rather than a
restriction of the mathematical theorem.

The standalone target reconstructs literal declarations through kernel checking
and imports only its fixed library dependency graph. It does not import the
solution or copy the selected solution proof. Its explicit reference-only goal
is checked for the exact bridge shape. The source solution proof is audited
separately and never depends on that reference goal. The independent comparator
checks every transitive type, value and inductive/recursor field, with only bound
universe-parameter renaming. The three permitted axioms are `propext`,
`Classical.choice` and `Quot.sound`.

All four actual target mutants pass kernel elaboration and fail comparison for
the intended reason: changed proposition, changed valid transition, changed
frozen initial move clock and changed reference bridge. Generic snapshot tests
also exercise malformed constructor data, generated runtime aliases, copied
proof rejection and unsupported dependencies.

## Verification and reproducibility

```sh
# Prepare native dependencies on a cold checkout.
ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Compilation.Tables
ELAN_NO_UPDATE_CHECK=1 lake --wfail -f lakefile.chess-m6.toml build \
  chess_m6_generate chess_m6_reference
ELAN_NO_UPDATE_CHECK=1 python3 scripts/verify_chess_m6.py
ELAN_NO_UPDATE_CHECK=1 python3 scripts/verify_chess_m6.py --baseline
```

The default command runs strict component builds/audits, initializer and runtime
fixtures, a fresh standalone kernel replay, deep comparison, semantic mutation
controls, the supported Linux sandbox comparator and exhaustive table comparison.
The baseline command reruns M1–M5. Separate `--foundations`, `--definitions` and
`--table-only` modes expose intermediate evidence without claiming the whole
milestone. The toolchain is the pinned `leanprover/lean4:v4.35.0-rc4`. CI gives cold native
compilation its own build phase before running the same bounded individual checks.
Its dependency-cache fetch uses the required pinned module roots and bounded retries.

Native source generation completed all rows in 1,091.55 seconds, using four
producers with aggregate sampled peak RSS of 929,349,632 bytes. The independent
exporter is built from the standalone target. Its full comparison validates each
row's syntax, destination bounds and bytes against the retained parts. It checks
all compressed hashes too. Exact fresh gzip reproduction is claimed only on the
recorded Python 3.9.6/zlib 1.2.12 runtime; canonical raw bytes are the portable
identity on other codec runtimes. Native printing, filesystem I/O, gzip and
hashing remain external verification tools. No Lean theorem about native file
I/O is claimed.

The recorded local independent sweep matched every row byte across all 392,046,832
states and reproduced all 393 gzip parts and their manifest exactly. It completed
in 2,454.86 seconds with sampled aggregate peak RSS of 792,969,216 bytes. The checker
confirmed all 111 publication inputs and the construction manifest were unchanged
throughout that run, before the Linux monitor correction. The byte check's evidence
is exhaustive over this fixed table; it is separate from the symbolic Lean proof
of unbounded execution behavior.

Completed local checks include the 50-check construction suite, audits of 39,379
safe roots and 54,127 dependencies, the exact 13,860-declaration standalone target
comparison and all four actual target mutants. The source proof audit reaches
48,586 dependencies; the 27 standalone runtime aliases reach 6,124. Both use only
the three standard axioms. Complete M1–M5 regression suites pass, including all
four native small-game regenerations, literal exports, independent target
comparison and both semantic mutation controls.

The supported Linux [M6 run](https://github.com/bocowgill/cryptids/actions/runs/39458752058)
passes the strict clean proof/fixture build, cold native exporters, complete default
verifier, normal sandbox comparator, semantic controls and every retained table row.
The Linux comparison completed every row across 393 ranges in 2,897.99 seconds,
with sampled aggregate peak RSS of 844,886,016 bytes. All 111 current publication
inputs remained fixed.

The separate [original regression run](https://github.com/bocowgill/cryptids/actions/runs/39458752023)
at the same checked implementation commit passes M1–M5, the original repository
sandbox comparator and machine/blank-initializer checks.

The earlier complete local byte/gzip report retains its original source pins.
The only later publication-input changes are the Linux process-exit monitoring fix
and its regression fixture. All mathematical definitions, exporter code, retained
table bytes and gzip logic are identical. The complete Linux comparison was repeated
with the current pins; old reports are never relabelled as new executions.

The [final independent publication review](PUBLICATION-REVIEW.md) accepts the
proof chain, exact accounting, standalone identity, full comparison and recorded
native file/codec boundary. The macOS exact gzip reproduction claim remains distinct
from the Linux check of portable raw bytes and retained compressed hashes. Bounded
traces and fixture executions never establish the initial chess value.
