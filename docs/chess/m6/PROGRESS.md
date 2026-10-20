# M6 construction progress

Status: **in progress**. The complete source-refinement criterion is met; seven integration criteria remain open.
There is no published full-chess transition table or full-chess state count yet.
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
The latest checked batch audits 16,717 safe roots and 30,543 dependency declarations and uses
only `propext`, `Classical.choice`, and `Quot.sound`. Exact compiler-generated recursion
artifacts are inventoried outside the root set and are never exempted from dependency checks.

The default verifier deliberately fails while full M6 is unfinished; passing the component
gate certifies the source/refinement components and cannot certify the remaining seven criteria.

## Remaining assembly

The complete generated blank binary machine now has an unconditional halting equivalence,
`Chess.Compilation.Binary.generated_halts`. Numeric TM2 control, the two-stage numbered
backend and a flat array-indexed initializer are proved and composed; exact initialization
and initializer-inclusive state accounting are proved. See [the binary proof guide](BINARY-COMPILATION.md).

Remaining work concerns a measured numerical state count, scalable native emission, and
kernel certification of the exact published literal matrix.

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
