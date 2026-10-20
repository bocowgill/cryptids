# M7 remote verification checkpoint

M7 is in progress. The generic quotient, actual chess assembly, strict count,
unconditional non-draw equivalence and paid initializer proofs pass remotely.
The candidate has 392,046,822 states, ten fewer than frozen M6. Final artifact,
regression and review acceptance is still open. Do not report M7 complete yet.

The fixed implementation and standalone target/map are commit
`088988f81248c3b2270d6d4549dd3ab29296c3a9` on `codex/chess-m7` in
[the fork](https://github.com/bocowgill/cryptids). Later checkpoint changes are
documentation and evidence only. The frozen M6 source/proof/table and
`chess-reference-v1` remain unchanged.

Active remote work:

- [Full committed-target M7 verification](https://github.com/bocowgill/cryptids/actions/runs/39506528766):
  proof suite passed again; independent definitions/mutants/Linux sandbox and
  complete candidate-table verification are running. The M1–M5 wrapper follows.
- [Original Cryptids CI](https://github.com/bocowgill/cryptids/actions/runs/39506528743):
  the first attempt failed during Lean download with a TLS error; a same-source
  retry passed setup and frozen-reference comparison and entered regressions.
- [Completed proof/bootstrap run](https://github.com/bocowgill/cryptids/actions/runs/39503052097):
  its official archive and proof/export reports are retained in
  [evidence/bootstrap](evidence/bootstrap/bootstrap-artifact-api.json).
  This was explicitly a proposal-only run, not final acceptance.

To resume, inspect the two active runs before starting anything new. Download the
completed M7 evidence and official artifact ZIP; verify GitHub's digest and every
extracted entry, all current source pins, every critical step and all 393 complete
range records. Keep the raw full reports, source/executable pins and table manifest
under `docs/chess/m7/evidence/`. Final independent review and a separate root
recheck must close all acceptance gates before updating the results and roadmap.
The preliminary review currently withholds final acceptance.

All Lean/Lake/LSP/LeanProbe/native/full-table computation must remain remote.
No local heavy build or sweep was started. Do not repeat completed expensive
checks without a relevant change, failure or deliberate reproduction request.
Outreach, new issues/PRs and maintainer messages remain on hold. No initial chess
value was computed and no minimum-state claim is made.

See [design](DESIGN.md), [results and reproduction](RESULTS.md),
[failed-attempt history](RESEARCH.md) and [independent review](REVIEW.md).
