# Bounded lookup implementation comparison

Objective remains the full certified310,029-state machine. Accepted769,344;
new accepted savings0. Same prospective459,315-state quotient opportunity.
This experiment changes proof computation, not the mathematical transition
table, source specification, or machine state allocation.

## Evidence motivating the comparison

Lookup78 passes all128/8192/65536 numeric-cache fidelity/count/range/fallback
proofs and private audits. Typed input reduces65536loading to9.219s; composed
validation finishes100.196s plus3.652s audit at3,341,131,776bytes. 8192checker
peak falls from5,614,432,256 to3,284,226,048bytes with essentially unchanged
validation time17.113s. The retained #print confirms original balanced lookup
uses RowTree.brecOn with motive Nat→α→α. This establishes an indexing mechanism
to test; it does NOT establish that replacing it will improve throughput.

## Required proof and experiment

- Define lookupFuel by structural recursion on short Nat fuel, not the large
  table tree. Prove equality with original lookup at EVERY index and fallback
  when tree.height+1≤fuel. No well-formed-cache premise is needed for equality.
- Prove actual mapTree/quotientTree height bounds from every named data chunk
  and branch. Native bit lengths only propose bounds; kernel proofs must
  check each chunk and compose every branch. Fuel33must be justified.
- Prove the fuel-based cell checker and validator equal the original cache
  checker and validator. Keep original class/both-word/count obligations.
- Compare the SAME8192expected cells and SAME256-cell proof chunks. The current
  lookup run already freshly measures the original checker, so the appended
  test is controlled for runner variation and fixed import overhead.
- Audit all generated node-height and cell-check proofs, root types/bodies
  and private dependencies. Require fresh explicit kernel wrong-extent
  rejection for the fuel validator as well as existing cache corruptions.

Same6GiB group+driver, Lean-M6144/driver512MiB/global1200s. Generic60s, actual
heights120s, checker-agreement60s, comparison120s (all include required audits),
negative45s. Existing cache128/8192/65536 tiers and assertions remain intact.
No new workflow permissions, local heavy computation, paid resources or outreach.

Continue only if the getter is proved AND its measured benefit is material.
A positive result could eliminate materialized observation-cache categories
by using exact fast lookup coefficients directly in source checks. Source
checker agreement/integration, complete1/16and1/4 SOURCE certificates, all-source
coverage, shared controls, unchanged decoder linkage and final review are still
required. Zero actual SourceRows/new machine/state-saving credit from this test.
No credible full-machine cost estimate exists before integrated SOURCE scaling.


Pilot81 PASS retained/reviewed at8165f8b, run40089492268. Correctness and
fresh kernel false-extent rejection pass, but fuel getter is SLOWER: same8192
validation18.727s vs original16.099s; peak3,330,084,864 vs3,292,389,376bytes.
Height setup61.936+3.447s; total driver645.071s. Decision: ABANDON fuel as
throughput remedy. Its proved correctness is retained, no source integration.

Next bounded pilot82 integrates the already verified observation cache into
the unchanged source checker via generic World equality. Checks are identical
SourceRows/census obligations; only class/pair lookup coefficients change.
Plan exact quarter main-address prefix in <=3windows of <=65536entries plus
full high return range533341..573801. Each data60s/fidelity180s with all roots
audited. Generic agreement60s runs before expensive cache generation. Retain
old block/source/count/range/callback/class/word/order controls and add fresh
explicit kernel false-cached-recipe rejection. Source tiers180/210s, global
1200s/6GiB, Lean-M6144, driver512MiB all fixed. No paid resources/outreach.

Need complete1/16and1/4 SOURCE modules/audits before claiming scalability;
cache/helper progress is not source coverage. If reuse still fails, diagnose
source vs validation/assembly cost and redesign repeated proof computation.
Accepted769,344/target310,029/new savings0. Rank1:459,315 prospective states,
high proof difficulty/moderate effort; cache integration unlocks same payoff,
no additive saving. No credible full cost yet. GoalACTIVE, last usage12%.
