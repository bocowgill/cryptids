# M6 construction progress

Status: **in progress**. The complete source-refinement criterion is met; seven integration criteria remain open.
The verified Image candidate has 392,046,832 states. Its complete table is being exported;
publication and standalone-reference identity are still open.
The target remains halting exactly when the frozen initial position is **not drawn**.
M7 and outreach remain unstarted; the frozen reference and M1–M5 inputs are unchanged.

## Checked components

- Exact 71-word position and full-history codecs, canonical decoding, malformed-data
  rejection, and literal initial data.
- A first-order evaluator and an explicit sufficient fuel bound, proved equal to unchanged
  M4 on every raw game. A further proved refinement defers dead-position termination while
  preserving the exact value, so the final runtime need not execute the dead-position graph
  search. Repetition still bounds continuation; there is no exhaustion-to-draw fallback.
- Actual `ToPartrec.Code` arithmetic, counted list operations, scalar expressions and
  structured commands, with exact semantics, including genuine loop divergence.
- Concrete geometric attacks and check, and all five fields of unchecked position updates,
  with unconditional raw-data refinement proofs. These are actual `Code.eval` theorems.
- Complete move validation, including raw malformed positions, promotion and king safety,
  and a fuel-free evaluator control compiler with explicit tape-data continuations.
- Constructive ordered Code support and a binary backend with both halting directions,
  genuine blank initialization and an exact initializer-inclusive state formula.
- The explicit draw-divergence postlude and exact repetition simplification for raw
  en-passant targets. Different raw targets are equivalent only if neither position has
  a legal en-passant capture.
- Concrete history, optional current/intended-move claims, automatic adjudication and
  ordered legal actions. `Source.program_initial_dom` proves that the fully instantiated
  source program terminates exactly when the frozen strategic draw proposition is false.
- Executable shared DAG construction and a literal 5,952-row model, with 7,076 checked
  source congruence lemmas and 371 checked row-block lemmas identifying its exact syntax.
- Exact paid input certificates: 141,380 stack symbols, 1,555,180 input bits, and
  3,110,360 initializer states/steps. Four mutation fixtures reject omitted or extra data.
- Literal 345-row numeric interpreter and 4,042-row normalized shared-tape snapshots,
  with exact local-row, initial-state, complete-step and two-direction halting certificates.
  Paired interpreter and normalized-machine fixtures agree step for step and retain final data.
- Generic first-order Boolean syntax graphs, direct numeric Post lowering, and numeric binary
  block templates. The actual 4,042-row source has complete 270-write/1,734-read/1,188-move
  classification certificates. Exact arithmetic getter graphs and their Post transitions are
  proved without allocating the whole graph. The actual Image instantiation now proves the
  exact final count, blank initialization and unconditional frozen strategic equivalence.
- A fixed four-stack interpreter: actual startup, complete instruction lookup/restoration,
  all opcode/continuation paths and positive simulation. `Tape.halts_iff` proves both
  termination directions for the complete chess source on that interpreter.

Run the current checked-component gate with:

```sh
python3 scripts/verify_chess_m6.py --foundations
```

The latest report is in `.lake/chess-m6-check/foundations.json`. It records source hashes,
strict builds, complete dependency/axiom traversal, controls rejecting proof holes, the open
chess conjecture, compiler recursion artifacts and proof-generator dependencies,
plus source, VM, opcode, lookup, initialization, numeric-control and local-certificate fixtures.
The latest checked batch audits 39,372 safe roots and 54,117 dependency declarations and uses
only `propext`, `Classical.choice`, and `Quot.sound`. Exact compiler-generated recursion
artifacts are inventoried outside the root set and are never exempted from dependency checks.

The default verifier deliberately fails while full M6 is unfinished; passing the component
gate certifies the source/refinement components and cannot certify the remaining seven criteria.

## Remaining assembly

The complete generated blank binary machine now has an unconditional halting equivalence,
`Chess.Compilation.Binary.generated_halts`. Numeric TM2 control, the two-stage numbered
backend and a flat array-indexed initializer are proved and composed; exact initialization
and initializer-inclusive state accounting are proved. See [the binary proof guide](BINARY-COMPILATION.md).

The selected arithmetic Image route has 38,893,646 graph nodes and 194,468,236 Post
controls. Its binary body has 388,936,472 states; the paid initializer adds 3,110,360.
`Image.machine` has exactly 392,046,832 states and `Image.halts_iff` proves the target
unconditionally. An independent mathematical review found no defect in this candidate.
Remaining work concerns complete retained table bytes, standalone executable packaging,
full independent comparison and final regression evidence.

After that, M6 still requires the literal transition artifact, complete measured state count,
kernel-checked identity with the compiled program, unconditional strategic equivalence for
that exact table, independent challenge/comparator, reproducibility checks and prior-milestone
regressions. M5's small-game trace certificates do not establish this identity for full chess.

## Emission measurements

The alternate `lakefile.chess-m6.toml` leaves the frozen original Lake configuration intact.
It builds a native construction probe:

```sh
ELAN_NO_UPDATE_CHECK=1 lake -f lakefile.chess-m6.toml --wfail build chess_m6_probe
.lake/build/bin/chess_m6_probe tail
.lake/build/bin/chess_m6_probe updates-nodes
```

The tiny `Code.tail` probe computes 48,631 Post states and 97,284 binary states including
the 22-state blank initializer. The repeated native run exited zero and took 111,615 ms of
construction time. This is a compiler probe, not a full-chess artifact or chess size bound.

The straightforward unchecked position-update source contains 6,409,197 expanded Code
constructor occurrences. This is source syntax size, not a Turing-machine state count; shared
control and compilation costs require separate measurement. Full emission feasibility and
possible use of a shared interpreter must be resolved before promising a literal artifact.

The measured update source reduces to 3,281 shared DAG rows. Its direct support traversal
would contain 98,385,948 occurrences before deduplication, and static continuation memoization
hit a 500,000-context cap before finishing. The selected construction keeps program rows,
the program counter and return frames on tape in a fixed interpreter. Its correctness is
now proved; full emission remains open. The full source has 118,913,842 expanded occurrences
and 5,952 shared rows, with root 5,951. Its canonical serialization has 17,858 words and
141,070 binary/cons symbols. These are native construction measurements, not a binary state
count. Fixed control has a kernel-proved 344 candidate labels. See [EMISSION.md](EMISSION.md)
for the earlier audit's measurement scope.

## Current literal-emission boundary

The complete structural-support traversal for the original numeric/hash route measured
12,261,090 Post labels. Its proved accounting therefore gives 12,261,091 Post controls,
24,522,182 binary body controls and 27,632,542 controls after the paid initializer.
The final lookup packaging then hit its separate 300-second cap at about 6.6 GB observed
RSS. No completed matrix or samples from that package are claimed. This is a measured
construction size, not a frozen baseline artifact or a claim that the current final
publication route has that count.

The selected locally certified route replaces hash-order reduction with explicit numeric
primitive rows and arithmetic binary templates. Its final candidate count is 392,046,832.
All reserved states must be counted, including unreachable template cells. The complete
literal export may be stored in deterministic row-aligned compressed parts, with every
decompressed byte compared against an independent export. Descriptor proofs establish
mathematical row identity; hashes alone cannot establish that correspondence.
