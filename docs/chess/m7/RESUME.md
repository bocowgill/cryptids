# M7 completed checkpoint

M7's first certified strict reduction is **complete**: 392,046,832 → 392,046,822
states, saving ten. All 9 acceptance gates are met (7 root, 2 independent review),
with 0 unmet and 0 abandoned. The unchanged target is halting iff the frozen
initial position is **not drawn**. Initial chess was not evaluated.

The implementation and fixed standalone target/map are commit
`088988f81248c3b2270d6d4549dd3ab29296c3a9`, branch `codex/chess-m7` in
[the fork](https://github.com/bocowgill/cryptids). Helper-only commit
`1c3be1cb21ae223794c51f569dd53d12f7991cca` repairs regression setup.
Subsequent completion changes contain documentation and evidence. All 192 current
computation hashes match every accepted component report. The 172 frozen M6
inputs, retained literal payload and `chess-reference-v1` remain unchanged.

## Accepted evidence

- [Core run 39506528766](https://github.com/bocowgill/cryptids/actions/runs/39506528766)
  passed source/generic proofs, independent fixed-target/dependency comparison,
  four kernel-valid semantic mutants, supported Linux sandbox comparison and
  every-row/gzip identity. All 392,046,822 candidate rows in 393 ranges matched.
  Its whole workflow concluded **failure** when later regression setup lacked
  umbrella `Mathlib.olean`. The actual failure remains retained; successful
  component checks are not relabeled as an overall green run.
- [Regression completion 39527113752](https://github.com/bocowgill/cryptids/actions/runs/39527113752)
  passed after fetching complete pinned Mathlib, then running the unchanged
  baseline wrapper. All 192 computation inputs match the earlier completed
  components exactly. The helper workflow and its exact checkout are pinned
  separately. No repeated full table sweep was required.
- [Original CI 39506528743](https://github.com/bocowgill/cryptids/actions/runs/39506528743)
  attempt 2 passed every step on the implementation revision. The initial
  Lean-download/TLS failure is retained with the successful retry.
- The [root metadata/hash recheck](evidence/root-check.json) and
  [independent review](REVIEW.md) accepted the actual evidence and current pins.
  The [final seal](evidence/review/seal.json) SHA-256 is
  `c278b3cf7a66d94a6950b315c9402c9f76597ffca9939b30112249824fa192c4`.
  Root independently rechecked the seal's 192 core, 45 durable evidence, four
  reviewer, helper and review-report hashes.

Official ZIPs, saved API digests/metadata, reports, raw logs, producer journals,
manifest, failed attempts and review programs are committed under
[evidence](evidence/README.md); GitHub artifact retention is not required to keep
the result. The fixed table is recoverable from M6 literal parts plus the M7
numeric map/extractor, independently of a chess compiler.

## Picking up later

Read [RESULTS.md](RESULTS.md), [results.json](results.json), [DESIGN.md](DESIGN.md)
and [RESEARCH.md](RESEARCH.md). The baseline remains available separately; do not
edit its source or literal payload for an optimization experiment. The completed
reduction proves universal exact step/stop simulation, both halting directions
and unchanged paid startup. Future reductions require new explicit candidates
and new evidence; no global optimality or practical runtime claim was established.

The retained evidence can be rechecked locally with the lightweight command:

```sh
python3 docs/chess/m7/evidence/check_evidence.py
```

All Lean/Lake/LSP/LeanProbe/native/full-table computation must remain remote.
No local heavy build or sweep was started. No remote verification job remains
pending for this result. Do not repeat expensive completed checks without a
relevant change, failure or deliberate reproduction request. Further research,
new issues/PRs and maintainer outreach remain on hold pending user direction.
