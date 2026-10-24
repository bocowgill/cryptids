# Recovery checkpoint: bounded proof-memory pilot prepared

Only this bounded memory experiment is authorized. The older goal stays paused;
heavy work stays remote, accepted/frozen pins stay fixed and outreach stays held.
The workflow is now manual-only with explicit phase `memory`. Launch no automatic
research continuation after this phase. See GATES.md for predeclared caps and
decision criteria. Iteration 1 is dispatched as run **40143132066**, exact producer
`5e978b16ee8269943ef4e9999b6f34cafc965801`, phase `memory`. Its fork push exited
zero and the remote ref was verified before dispatch. Inspect this run before
launching anything else; do not duplicate it. Results are pending.

Accepted machine: **769,344 states** at
`100ed947d612079dc454070189e506efc2b7a780`. Experimental candidate: **609,247**,
potential saving **160,097**, new accepted saving **zero**. This experiment
changes proof-data representation only and cannot itself reduce state count.

Data.lean must retain SHA-256
`2317ad63aab9eb6796508ba6e2df1bb33a61816afd77b55ceb363dab2b20d6ac`.
The complete candidate table must retain SHA-256
`b9cf384e5470f3c9f5c501bd8c13555f15d4ea134469f5d159cd1bdb363cbf45`.
All 3,116 accepted/frozen pins must remain unchanged. The retained full-size
baseline is copied verbatim from structural run 40141647723. Its prior peak was
6,059,950,080 bytes, runtime 26.910 seconds and object size 16,392,352 bytes.

The new representation stores an Array Nat and maps it to Array (Fin 13360)
with one shared bound proof. A generic constructor identity is kernel-checked
under the explicit bound; finite binding verifies all sourced values satisfy it.
The existing runData statement/proof is copied verbatim. Both instances export
all 26,720 data cells for independent comparison with the exact table, with an
encoded-word mutation as negative control. Export comparison remains external
representation evidence rather than a kernel theorem for a binary-file parser.

Remote entry: `scripts/chess_parsimony_memory_20261024/verify.py`.
Retention entry: `scripts/chess_parsimony_memory_20261024/retain.py`.
Push only `git@github.com:bocowgill/cryptids.git`, branch
`codex/chess-openevolve-pilot`; never push origin (which is upstream).
Retain logs and archives before interpreting results. A diagnosed correction is
required before using the second and final allowed iteration.

Full certification remains open: counter and word insertion, data-out branching,
framing/cleanup, full finite blank startup, exact packet identity, whole Lean
printer model, direct linking/suffix relocation, both halting directions and
final strict/foundation/regression checks. Improving memory is a prerequisite
for that experimental reduction, not a replacement for these obligations.
