# M6 construction progress

Status: **in progress**. All eight M6 integration acceptance criteria remain open.
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
- Executable shared DAG construction with exact source-syntax reconstruction and canonical
  serialization. This reduces representation size without assuming semantic optimization.

Run the current checked-component gate with:

```sh
python3 scripts/verify_chess_m6.py --foundations
```

The latest report is in `.lake/chess-m6-check/foundations.json`. It records source hashes,
strict builds, complete dependency/axiom traversal, controls rejecting proof holes, the open
chess conjecture and compiler recursion artifacts, and eight low-level execution checks.
The latest checked batch audits 2,039 safe roots and 15,622 dependency declarations and uses
only `propext`, `Classical.choice`, and `Quot.sound`. Exact compiler-generated recursion
artifacts are inventoried outside the root set and are never exempted from dependency checks.

The default verifier deliberately fails while full M6 is unfinished; passing the component
gate cannot certify the eight integration criteria.

## Remaining assembly

All source callees are instantiated and proved correct. The remaining backend work is a
fixed interpreter for the shared program table, including exact instruction lookup and
runtime return frames. The source theorem alone does not prove that interpreter correct.

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
the program counter and return frames on tape in a fixed interpreter. Its correctness and
full emission remain open; see [EMISSION.md](EMISSION.md) for exact measurement scope.
