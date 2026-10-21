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
- 39593962240 at 75cbd9c: strict generic ReverseInit proof passed; concrete
  state-count conversion reached the 6144-MiB cap, with a reserved binder name.
  Official archive: evidence/history/concrete-count-memory-failure.
- 39594768893 at 5058c59: symbolic count repair passed; generic cast initializer
  needed explicit normalization of the blank init configuration. No search ran.
  Official archive: evidence/history/blank-cast-rewrite-failure.
- 39595465200 at 2d9987b: strict full concrete machine/semantics build passed in
  10 seconds. Search preflight failed while simplifying the concrete million-bit
  cost, before ANY model request. Official archive: evidence/history/search-preflight-failure.
- Current full run 39596779016 at 4124781639ff63a5573da0e923cd7fca865d72e3 proves
  schedule length symbolically before substituting the concrete length. It reuses
  the same verified mathematical construction; inspect its actual outcome.

No model search had spent any of the 24-proposal budget as of the preceding
retained preflight failure. Do not launch a duplicate run before checking the
current run. Final native audit, controls, model search, regressions and root
acceptance are still pending; no overall completion claim is authorized.
Gate ledger: `.unlazy/chess-openevolve-wide/GATES.md` (6 root gates +2 review gates).
The independent source review R1 found no construction defect; R2 still waits
for actual final evidence. Supplied proof identities may be exposed in later
certificate feedback, even though the static system prompt omits the solution.
