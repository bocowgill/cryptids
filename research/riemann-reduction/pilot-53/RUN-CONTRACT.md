# Authorized execution contract — 2026-10-24

User authorization: proceed with the bounded state-53 pilot under the existing
remote-only limits, preserve the baseline, keep Chess paused, and stop at an
exact obstruction or a certified 94-state result before broader search.

Remote: existing public `bocowgill/cryptids`, ordinary `ubuntu-24.04` GitHub-hosted
runner. Repository public flag, push access, empty destination branch and unchanged
upstream `6c28d8524fa008c6fb5aadb759df74a55ce96423` were inspected before launch.
No new paid service, runner or model is used.

The source transport commit uses `[skip ci]`; a subsequent RH launch file changes
only `scripts/riemann53/**` and triggers the dedicated workflow. This avoids
launching unrelated baseline workflows for inherited upstream changes when the
new remote branch is first created. Neither operation updates the Chess branch.
Only one authorized computational run is permitted; no automatic retry.

See ../PILOT.md for the unchanged acceptance and stage limits. Executable caps:
3180 seconds from the initial job clock including checkout/setup; setup <=900,
generation <=120, finite screening <=180, universal kernel <=600, candidate
checks <=900, audits <=450, packaging <=30. The workflow has a 60-minute outer
timeout. At most one candidate, 128 frames, depth <=3, 2,000,000 TM steps,
6 GiB aggregate child-session-plus-driver RSS and 512 MiB driver address space.
Actual stage caps are the minimum of the nominal cap and the remaining total.

The first tier comprises the actual 97 outside control schemas, sorted by walked
length/lexicographic order. Stop on the first required pop equation that is false.
Two full-frame simulations and independent replay suffice to reject that specific
encoding route; deeper fixtures and Lean proof work are then skipped. No universal
equivalence or nonexistence claim follows from this rejection. A positive screen
never earns certification; its universal proof obligations remain explicit.

All generation, parsing/census, fixtures, simulations and independent replay run
remotely. Local activity is source editing/review and Git/provenance inspection.
New accepted-baseline verification replays: zero. New Lean source: none in the
negative path. No Chess actions, outreach, issues/comments or upstream PRs.
