# Completed broader-search checkpoint

Fork: `bocowgill/cryptids`; branch: `codex/chess-openevolve-pilot`.
Computation source: `5af346f454a32b403a0dfd085160431b8d9cca77`.
Successful full remote run:
[39598997807](https://github.com/bocowgill/cryptids/actions/runs/39598997807).

The bounded campaign is complete. The actual 24-proposal OpenEvolve search found
zero certified saving; all six certified evaluations are the original seed.
The reverse-write optimization supplied before the run is separately certified
at **390,491,642 states**, saving **1,555,179 states** over the completed pilot.
Do not credit that reduction to model discovery or claim that the million-state
search objective was met. Full details: [RESULTS.md](RESULTS.md),
[results.json](results.json), [REVIEW.md](REVIEW.md) and
[root-check.json](evidence/root-check.json).

The proof is unconditional against the frozen non-draw statement. The input and
388,936,461-state binary body are unchanged. The paid initializer now uses exactly
1,555,181 states and transitions by writing in reverse while moving left, then
moving right once. Relative tape equality is proved for all finite bit lists;
absolute return to the original physical cell is not claimed. A universal numeric
row recipe is retained; a new expanded table/full row sweep was not performed.

All five successful phase receipts bind the same 16 new computation inputs and
211 frozen prior inputs. Official artifact/log archives, raw requests, population
checkpoints, failures and certificates are under `evidence/current`; earlier
failed proof/preflight archives are under `evidence/history`. Every earlier
retained failed preflight stopped before inference. These failures remain failures.
The original M7/pilot and M1–M5 accepted evidence remains fixed and authenticated.

The current proof bank recognizes two supplied universal identities. Generation
is unconstrained within a typed schedule-expression language, but certification
does not synthesize arbitrary new proofs. Before spending a larger future budget,
consider widening that proof frontier. No further model run is authorized by this
checkpoint. The static prompt omits the solution; later proof diagnostics can
expose supplied identities. See [RESEARCH.md](RESEARCH.md).

Preserve the frozen chess reference, toolchain and all entries in
`baseline-pins.json`. All Lean, model, fixtures, native audits and table work must
remain remote. Local editing, hashing and saved-evidence inspection are permitted.
Outreach, upstream writes and later milestones remain on hold. Inspect remote
jobs before launching another; do not start duplicate or unattended searches.

Reproduction workflow: `.github/workflows/chess_openevolve_wide.yml`, with stages
`probe`, `search` and `full`. A full rerun means a new experiment, not necessary
acceptance work for this completed run. The original budget was 24 proposals,
4096 input /256 output tokens per request, with a 40-minute search bound. No paid
model API was used; runner billing is unknown.

Lightweight saved-evidence replay:

```sh
python3 docs/chess/openevolve-wide/evidence/check_evidence.py
python3 scripts/chess_openevolve_wide/verify.py --metadata
```

The final acceptance ledger has six root and two independent-review gates at
`.unlazy/chess-openevolve-wide/`; the measured final counts are in the root receipt.
