# Broader compiler search checkpoint

Work on fork `bocowgill/cryptids`, branch `codex/chess-openevolve-pilot`, with new
modules under `openevolve-wide` and `chess_openevolve_wide`. Existing pilot/M7
computation inputs are frozen by `baseline-pins.json` (211 files). Never change
the frozen chess specification or any of those computation inputs.

User authorizes a broader generative OpenEvolve search and a larger certified
reduction. All Lean, model, fixture, native and table computation remains remote.
Outreach and upstream writes remain on hold. Only local editing, hashes and saved
evidence inspection are permitted. Do not execute remote phase CHECKs locally.

Hypothesis: reverse-order leftward writing plus one right move initializes the
same exact input zipper in n+1 states. At n=1,555,180 this would give 390,491,642
paid states, saving 1,555,179 relative to the completed pilot. This remains a
candidate until strict assembly, audit, artifact and regression checks succeed.

Search proposes new expression trees, rather than selecting finite policy IDs.
The reverse-write idea and proof support were supplied before the run. See
RESEARCH.md for the certification bank's limitations. Do not attribute that idea
to the search model, or conflate supplied preflight plans with model proposals.
Maximum budget: 24 model proposals, 256 output tokens each, 4096 input tokens each,
40-minute search bound. No paid model API; actual runner billing unknown.

Remote workflow: `.github/workflows/chess_openevolve_wide.yml`. Dispatch `stage=probe`
for strict compiler/concrete machine checks, `stage=search` for the model run, and
`stage=full` for complete validation. Inspect any currently running job before
launching another; keep failures and cancelled/superseded attempt provenance.
Workflow setup reuses the existing same-branch cache. The initial separate broad
branch was left unused to avoid losing access to that remote cache.

Probe history:

- 39592429542 at 30ec16d: failed on a nonexistent lemma and unfolding details;
  official archive retained in evidence/history/first-proof-failure.
- 39593192497 at 983d002: only the map-over-append definitional rewrite remained;
  official archive retained in evidence/history/list-map-proof-failure.
- 39593962240 at 75cbd9c: current probe includes the repaired tape identity,
  generic flat schedule compiler and actual 390,491,642-state candidate assembly.
  Await its actual result before claiming any new proof acceptance.

Uncommitted new controls and result/proof driver changes are not yet remotely
verified. Gate ledger: `.unlazy/chess-openevolve-wide/GATES.md`. No model search
has yet spent any of the 24-proposal budget.
