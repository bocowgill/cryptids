# Recovery checkpoint: full-word proof-memory pilot passed

The separately authorized bounded pilot is complete. One remote iteration was
used and is terminal. No subsequent job is launched automatically. The persistent
older goal remains PAUSED. Keep heavy computation remote, local resources low,
accepted/frozen pins fixed and outreach on hold. Never push origin (upstream).

Branch: `codex/chess-openevolve-pilot`.
Workspace: `/Users/bocowgill/.codex/worktrees/6ba9/cryptids`.
Fork push: `git@github.com:bocowgill/cryptids.git`.
Recovery payload push/ref verification: pending final retention commit.
Three runnable gates are met; R1 remains pending that final push and status check.

## Results to preserve

- **Accepted complete chess machine: 769,344 states**, source
  `100ed947d612079dc454070189e506efc2b7a780`.
- **Unchanged experimental candidate: 609,247 states**, potential saving
  **160,097**; **new accepted saving: zero**. No transition/control was changed.
- Shared proof data at **all 13,360 words / 26,720 cells** reduced sampled
  group-plus-driver peak from 6,064,721,920 to **5,223,178,240 bytes**, a saving
  of **802.56 MiB**. Headroom under the unchanged 6 GiB cap is **1.1355 GiB**.
- Check/export elapsed time fell **23.824 to 8.453 seconds**. Object size fell
  **16,392,400 to 11,827,144 bytes**, **27.85%**. Source 440,192 to 106,200 bytes.
- Data.lean, its six theorem statements and its generic object stayed identical.
  Full-size instance runData statement and proof text stayed identical. Standard
  foundations, strict build, width and warning checks passed. All 3,116 pins were
  checked before and after. Both row exports match and reject changed data.

Read [RESULTS.md](RESULTS.md), [GATES.md](GATES.md) and gate-evidence.json.
The result meets the usefulness criterion; continue with the shared-bound
representation in a future authorized structural stage. One paired sample has
measurement noise. Whole-printer memory and proof difficulty are still unresolved.

## Exact recovery evidence

Run: **40143132066**, successful manual phase `memory`.
Producer: **5e978b16ee8269943ef4e9999b6f34cafc965801**.
Entry: `scripts/chess_parsimony_memory_20261024/verify.py`.
The workflow is manual-only; checkpoint pushes do not dispatch it.
All work was on the existing free GitHub-hosted runner, with unchanged limits:
900-second driver, 120-second instance, 5 GiB Lean heap, 6 GiB sampled group RSS,
512 MiB driver and one Lean thread. Driver finished in 80.855 seconds. No resource
limit or failed approach occurred in this phase; no second iteration is needed.

Complete archive, logs, generated sources/objects/exports, manifest, capacity,
preservation, negative controls and command receipts are under
`evidence/memory-01`. Exact producer hashes and GitHub digest were verified.
Lightweight local re-review (provenance only, no model execution):
`python3 scripts/chess_parsimony_memory_20261024/review.py --iteration 1`.

Archive SHA-256:
`119a62a2751dfe51964da5806ccd19e7d8cfa153890d104fb00cc20eb81765ae`.
Logs SHA-256:
`32c68e268e0d97531893cce4e4cc980eda7f6e314dcc5e754c0f5e65ac3c159c`.
Unchanged generic Data.lean SHA-256:
`2317ad63aab9eb6796508ba6e2df1bb33a61816afd77b55ceb363dab2b20d6ac`.
Unchanged complete candidate table SHA-256:
`b9cf384e5470f3c9f5c501bd8c13555f15d4ea134469f5d159cd1bdb363cbf45`.
Both complete data exports SHA-256:
`e4820e2a8ad863cd6d3728b120c67f5a249fac8f9418445fb55f795cfbba6a2c`.

## Next concrete task after fresh authorization

Use the shared Nat-array/map representation. Prove a reusable unary-to-binary
counter and word-insertion contract, including exact tape geometry and data-out
branching. Test the generic proof, then compose it with query_run and check the
composition at the same full data size under unchanged caps. Avoid per-step full
printer unrolling, per-literal proofs and unnecessary retries. Keep exports and
kernel packet-identity obligations distinct; derive words structurally from
framed packet bits during later full instantiation.

Remaining full certification: preamble/epilogue, framing/marker cleanup, full
finite blank startup and exact relative head/tape, exact frozen packet identity,
whole Lean printer model, direct linking and full suffix relocation, both
halting directions and final strict/foundation/regression checks. Native row
comparison is external binding evidence, not a kernel binary-parser theorem.
Do not accept 609,247 or claim a full runtime estimate before these are complete.

RESULTS.md retains every full-machine state category and ranks opportunities.
Finishing the current printer proof enables 160,097 experimental states of
savings. The older interpreter quotient has a larger 459,315 experimental
saving on its own baseline, with unresolved scaling; it remains paused and its
saving must not be combined with this one without a complete new composition.
Historical failed runs remain preserved under structural/evidence/proof-01..03;
they were setup/arithmetic/lint obstructions, not memory-limit failures. All
prior successful evidence, frozen source and accepted machine are untouched.
