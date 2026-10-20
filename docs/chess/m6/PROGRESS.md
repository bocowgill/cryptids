# M6 baseline progress

Status: **in progress**. The complete source, final mathematical matrix, paid blank
initialization and unconditional strategic equivalence are proved. All 393 literal
compressed table parts and their complete manifest are retained. The baseline has
**392,046,832 states** and halts iff the frozen initial position is **not drawn**.
The initial chess value has not been computed. M7 and outreach remain unstarted.

## Completed checks

- Concrete arithmetic, lists, geometric rules, legal moves, updates, full history,
  optional draw claims and evaluator control refine the unchanged M4 operations.
  A proved value-preserving refinement defers dead-position adjudication internally;
  there is no heuristic or exhaustion-to-draw fallback.
- `Source.program_initial_dom` gives the complete concrete Code source's exact
  strategic meaning. The literal 5,952-row DAG has 7,076 congruence lemmas and
  complete row certificates in 186 chunks, identifying its exact source syntax.
- The fixed interpreter, 345-row numeric runtime and 4,042-row normalized primitive
  model have complete local-row, startup, positive-step and two-direction halting
  proofs. Actual source templates have 1,734 read-bearing rows (including 270
  writes) and 1,188 moves. Writer suffixes are counted separately in the graph.
- Arithmetic graph getters are proved equal to the complete finite graph. The
  final construction has 38,893,646 nodes, 194,468,236 Post controls and 388,936,472
  binary body controls. Every reserved slot and bounce state is counted.
- The entire input has 1,555,180 bits. From ordinary state 0 and an all-zero tape,
  `Image.initialises` proves exactly 3,110,360 steps write the input, restore the
  head and enter the body. All initializer states are included in the final count.
- `Image.halts_iff` is unconditional. `Matrix.identity`, `row_count` and
  `column_count` identify the ordinary complete row-list machine, every row and
  both columns, without allocating that giant list in the exporter.
- The component suite passes 39,379 safe roots and 54,127 dependency declarations,
  using only `propext`, `Classical.choice` and `Quot.sound`. Compiler-generated
  recursion auxiliaries are inventoried outside mathematical closures. Controls
  reject new axioms, the open conjecture, unsafe/partial dependencies and generators.
- The standalone target imports fixed library modules and reconstructs literal
  declarations through kernel checking. Its complete 13,860-declaration target
  closure matches the solution, including 12,981 bodies. The source reduction proof
  has 48,586 audited dependencies; 27 standalone runtime aliases/proofs have 6,124.
  All permit only the three standard axioms. The reference goal is never a premise
  of the source solution proof.
- Four actual semantic mutants build successfully and are rejected for the intended
  reason: proposition, valid transition, frozen initial clock and reference bridge.
  Generic constructor/runtime tests and all ten rejection scenarios also pass.
- Native source generation completed all 392,046,832 rows in 1,091.55 seconds.
  The table occupies 8,979,481,064 raw bytes and 1,762,091,864 compressed bytes in
  393 ordered parts. These are retained payloads, not regeneration instructions.
- The final 50-check construction suite and complete M1–M5 regression suites pass.
  Prior-milestone evidence includes all four native small-game regenerations,
  independent literal exports/target comparison and both semantic mutation controls.
- The full independent standalone exporter matches **every row byte** across all
  392,046,832 states and reproduces every compressed part and its manifest exactly.
  The 393-range run completed in 2,454.86 seconds, with sampled aggregate peak RSS
  of 792,969,216 bytes. All 111 publication inputs remained unchanged throughout.

## Remaining acceptance

Linux CI must pass the supported sandbox comparator and complete-table check.
The local exhaustive byte/gzip check and all local proof/regression checks pass.
Final independent publication review, release results and acceptance ledgers remain
to be closed.
The frozen reference and M1–M5 source files remain unchanged.

```sh
python3 scripts/verify_chess_m6.py --foundations
python3 scripts/verify_chess_m6.py --definitions
python3 scripts/verify_chess_m6.py --table-only
python3 scripts/verify_chess_m6.py --baseline
```

On a cold checkout, first build `chess_m6_generate` and `chess_m6_reference` with
`lake --wfail -f lakefile.chess-m6.toml build`; CI has an explicit native build phase.
The default command runs construction, independent definition/mutation checks and
the complete table comparison. Separate modes expose intermediate evidence without
claiming full M6 completion. The baseline mode runs the previous milestone suites.
Reports are written under `.lake/chess-m6-check/`.

See [design](DESIGN.md), [binary proof guide](BINARY-COMPILATION.md),
[Image review](IMAGE-REVIEW.md), [standalone replay](REPLAY-SCALING.md), and
[retained artifact](../../../artifacts/chess_baseline/README.md).
