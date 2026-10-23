# Conditional return-address proof pilot

Status: proposed, unverified, not yet implemented. Await run35's correctness
outcome first. Certificate-34's largest setup gaps are between return-address
markers: several 5–8 seconds, including 8.007 seconds for q4041/rank0/store4.
It has no full Rows64 credit because later proof errors reject the module.

Hypothesis: the `change`/rewrite sequence unfolds dependent index implementations
while trying to recognize their numeric value. Test an explicit generic value
interface and keep those implementations opaque in the sampled proof module.
This changes elaboration only; no frozen machine definition or theorem changes.

Candidate interface (new proof obligation): for arbitrary q, p, correspondence,
local return index i and store v, prove

    (bounceIndex q p same i v).val =
      533341 + (1 + (FieldSelectiveLayout.offset q + i.val) * 5 + v.val)

by unfolding only bounceIndex and applying SelectiveBinary.bounceState_val and
the already certified returnIndex_val. Preserve parentheses to avoid arithmetic
proof search. Check and audit this generic theorem remotely before actual rows.
Concrete addresses should then use Fin.ext and that interface with the checked
prefix. If rank projections still normalize source syntax, certify rank.val once
and keep the syntax/rank definitions opaque after their local node/target proofs.
Do not mark something opaque before its required computational witnesses exist.

Acceptance: original 64 states/both bits build and every explicit root receives
the full-private standard-foundation audit under the existing120-second cap;
timing markers show whether return setup improves. Then original512/4096 pilots
retain their180/210-second caps. A resource failure gets a recorded obstruction
and a specific representation change. No cap increase or linter suppression.

The dependency/payoff is enabling the measured whole-body quotient:459315
prospective full-machine states, complete target310029. This helper itself
saves no states. If it does not reduce the measured large setup cost, reconsider
it in favor of STRUCTURAL-TABLE-FALLBACK.md rather than polishing small proofs.
