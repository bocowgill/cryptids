# M7 first state reduction

Status: **complete: first certified strict reduction**. All 9 acceptance gates
are met (7 integration, 2 independent review); 0 unmet and 0 abandoned. The kernel,
independent fixed target, every-row artifact identity and regressions passed
remotely. The final provenance seal and current source hashes were independently
rechecked. See [gate evidence](GATES.md) and [machine-readable results](results.json).

The candidate has **392,046,822 states**, ten fewer than the frozen M6 baseline
of **392,046,832**. It retains two symbols, ordinary state 0 on the all-zero
two-sided tape, and missing-transition halting. Its kernel-checked target is
unchanged:

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
large gzip payload need not be stored in Git. Every extracted candidate row byte
was compared with the independently reconstructed standalone Lean target. Both
producers completed all **392,046,822 rows in 393 ordered ranges**, and fresh gzip
reproduction matched every canonical part. The complete
[manifest](evidence/current/candidate-table-manifest.json) records 8,979,480,868 raw
bytes and 1,762,068,063 compressed bytes. The raw stream SHA-256 is:

```text
47a9730ccdcbdf0983951be91993ce1470b0109e75a347696786b70eda011c81
```

The independent comparison covers all transitive definitions and the target
proposition. The explicit reference-goal bridge in the standalone challenge is
excluded from the actual solution proof closure. All four kernel-valid semantic
mutants, the audit rejection controls and the supported Linux sandbox comparator
passed their expected checks. The source foundation audit covers 65 roots and
48,674 declarations with only `propext`, `Classical.choice` and `Quot.sound`.

## Evidence and separate verification costs

Implementation and fixed artifacts are commit
`088988f81248c3b2270d6d4549dd3ab29296c3a9`. All 192 computation input hashes
are retained in the reports, including all 172 frozen M6 pins. The separate
regression setup workflow at `1c3be1cb21ae223794c51f569dd53d12f7991cca` is
hashed independently; it leaves every computation input unchanged.

- [Core run 39506528766](https://github.com/bocowgill/cryptids/actions/runs/39506528766)
  passed proofs, independent definitions/semantic controls/Linux sandbox and the
  full table check. Its **overall conclusion is failure**: the subsequent baseline
  wrapper could not find umbrella `Mathlib.olean` after a partial library-cache
  fetch. The actual failure and all successful earlier reports are
  [retained](evidence/current/run.json).
- [Regression completion 39527113752](https://github.com/bocowgill/cryptids/actions/runs/39527113752)
  fetches complete pinned Mathlib and runs the unchanged baseline wrapper with
  exactly the same 192 computation hashes. The whole recovery run passed, and its
  authenticated archive and all three report entries are
  [retained](evidence/regressions/run.json).
- [Original Cryptids CI 39506528743](https://github.com/bocowgill/cryptids/actions/runs/39506528743)
  passed every step on the implementation revision in attempt 2. Its first
  attempt failed while downloading Lean; both outcomes are preserved.

The accepted result composes successful component checks with matching current
inputs; it does not turn the failed whole core workflow into a green run. Official
artifact ZIPs, GitHub digest metadata, actual reports, complete ordered journals,
logs and negative controls are retained [with the evidence](evidence/README.md).
The cached proposal-only bootstrap report inside the core archive is explicitly
excluded from final acceptance.

| Remote operation | Wall time | Peak sampled producer RSS |
| --- | ---: | ---: |
| First cold native generator build (bootstrap) | 1,223.32 s | Not measured |
| Snapshot proposal export | 78.47 s | Not measured |
| Standalone strict kernel build (fixed target) | 344.29 s | Not measured |
| Deep independent declaration comparison | 12.48 s | Not measured |
| Four semantic-mutant controls | 1,039.50 s | Not measured |
| Supported Linux sandbox comparator | 203.02 s | Not measured |
| Incremental native table exporter build | 92.89 s | Not measured |
| Complete extraction and baseline-part validation | 3,063.87 s | 134,033,408 bytes |
| Independent every-row comparison and gzip reproduction | 4,173.74 s | 851,042,304 bytes |
| Unchanged M1–M5 baseline wrapper after setup recovery | 2,287.08 s | Not measured |

The table producers used at most four workers under an 8-GiB sampled-RSS limit.
These are construction and verification costs, not the machine's runtime for
evaluating initial chess. Initial chess was not evaluated. The reduction counts
states only; no runtime speedup is claimed.

## Reproduction and scope

Run substantial Lean/native/table checks on remote Linux with the pinned toolchain
(`leanprover/lean4:v4.35.0-rc4`) and supported bubblewrap configuration used in
[`chess_m7_ci.yml`](../../../.github/workflows/chess_m7_ci.yml). The original
reference imports umbrella `Mathlib`, so fetch the complete pinned cache before
the baseline phase, as in the
[regression completion workflow](../../../.github/workflows/chess_m7_regressions.yml):

```sh
python3 scripts/verify_chess_m7.py --proofs
python3 scripts/verify_chess_m7.py --definitions
python3 scripts/verify_chess_m7.py --table
lake exe cache get Mathlib
python3 scripts/verify_chess_m7.py --baseline
```

The full committed-target workflow orders those phases; its partial-cache setup
alone was insufficient for the last one, hence the separate completion workflow.
A successful bootstrap only proposes artifacts; it does not close final acceptance
gates. Final reports share the same current computation pins. Table extraction,
native printing, hashing, file I/O and gzip are the external artifact-verification
boundary; the mathematical Lean halting proof is independent of those tools.

All 172 reviewed M6 inputs are pinned in [baseline-pins.json](baseline-pins.json).
No baseline source, theorem, standalone target, table part, or manifest is edited.
[Research records](RESEARCH.md) retain failed attempts and distinguish build cost
from state count. Heavy computation remains remote; outreach remains on hold.
The lightweight [`check_evidence.py`](evidence/check_evidence.py) rechecks retained
reports and current hashes without Lean or a table sweep. Its complete result is
[root-check.json](evidence/root-check.json). The [independent review](REVIEW.md) accepts R1 and R2, bound to the
[final seal](evidence/review/seal.json). Root rechecking confirms all 192 current
computation hashes, the separate helper, all 45 sealed evidence files, four
reviewer files and the review report. The seal SHA-256 is
`c278b3cf7a66d94a6950b315c9402c9f76597ffca9939b30112249824fa192c4`.
