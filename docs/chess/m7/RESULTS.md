# M7 first state reduction

Status: **in progress**. The actual chess assembly and generic quotient proofs
have passed the remote kernel. Final fixed-target, exhaustive table and regression
acceptance is still required. No final state-reduction acceptance is claimed here.

The candidate has **392,046,822 states**, ten fewer than the frozen M6 baseline
of **392,046,832**. It retains two symbols, ordinary state 0 on the all-zero
two-sided tape, and missing-transition halting. Its intended, kernel-checked target
is unchanged:

```text
Halts chess_m7 ↔ ¬(Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss)
```

This does not determine the initial position's value. There is no claim of
optimality, substantial compression, or practical runtime improvement.

## What changes

The quotient merges the duplicate initial Post control with the root/default-store
control and merges the five halted-store controls. The Post representation shrinks
by five states; the two binary blocks therefore shrink by ten. Every live node/store
pair remains represented. The program, initial position, all 1,555,180 input bits,
and 3,110,360 paid initializer states and exact startup steps remain unchanged.
See the [design and accounting](DESIGN.md).

The proof chain is the universal, exact step/stop correspondence in
[`CompactPost.lean`](../../../Cryptids/Optimisation/CompactPost.lean), the actual
assembly, unconditional halting equivalence, baseline equivalence and exact paid
startup in [`M7.lean`](../../../Cryptids/Chess/Optimisation/M7.lean), and the actual
strict constructed-state inequality and full mathematical table identity in
[`M7Table.lean`](../../../Cryptids/Chess/Optimisation/M7Table.lean). The public
statement is in [`ChessM7.lean`](../../../Cryptids/Semantics/ChessM7.lean).

## Exact table and independent target

The candidate table is completely encoded by the retained M6 literal payload,
a fixed numeric quotient map and its extraction recipe; see the
[artifact guide](../../../artifacts/chess_m7/README.md). A second near-identical
large gzip payload need not be stored in Git. Final acceptance requires comparing
every extracted candidate row byte with the independently reconstructed standalone
Lean target, and retaining the canonical raw hash and complete ordered part manifest.

The independent comparison must cover all transitive definitions and the target
proposition. The explicit reference-goal bridge in the standalone challenge is
excluded from the actual solution proof closure. All four kernel-valid semantic
mutants, the audit rejection controls and the supported Linux sandbox comparator
must pass their expected checks.

## Reproduction and scope

Run the substantial Lean/native/table checks on remote Linux with the pinned
toolchain and supported bubblewrap configuration used in
[`chess_m7_ci.yml`](../../../.github/workflows/chess_m7_ci.yml):

```sh
python3 scripts/verify_chess_m7.py --proofs
python3 scripts/verify_chess_m7.py --definitions
python3 scripts/verify_chess_m7.py --table
python3 scripts/verify_chess_m7.py --baseline
```

The full committed-target workflow orders those phases. A successful bootstrap
run only proposes artifacts; it does not close the final acceptance gates. Final
reports must share the same current computation pins. Table extraction and native
printing, hashing, file I/O and gzip are the external artifact-verification
boundary; the mathematical Lean halting proof is independent of those tools.

All 172 reviewed M6 inputs are pinned in [baseline-pins.json](baseline-pins.json).
No baseline source, theorem, standalone target, table part, or manifest is edited.
[Research records](RESEARCH.md) retain failed attempts and distinguish build cost
from state count. The [independent review](REVIEW.md) must be updated to the actual
completed verification evidence before acceptance. Heavy computation remains
remote; outreach remains on hold.
