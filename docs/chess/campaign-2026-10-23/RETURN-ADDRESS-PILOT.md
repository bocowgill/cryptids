# Conditional return-address proof pilot

Status: implemented for the next bounded remote pilot, not yet verified.
Certificate-38 passes the symbolic interface and initial0/both-bit audits. Certificate-34's largest setup gaps are between return-address
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

Further structural observation from frozen source (unproved proposed lemmas):
writeCount and write-target slot positions depend on the lowering shape, not the
callback table values. OperationWeights already proves the count part uniformly
for every source operation and field. A cheap return-rank representation could
use that checked operation weight as its Fin bound, then cast through the count
equality into the exact syntax rank. This may avoid re-normalizing lowered syntax
just to type-check a concrete return address. Prove val_cast and a generic numeric
bounce value interface once, then instantiate using named numeric rank values.
Keep index implementations opaque only during those concrete address proofs; their
later transition proofs may need explicit unfolding of the public wrappers.

A related, larger obligation for the shared-table route is an exact theorem for
(targets (lower op)).map Fin.val, with formulas per operation/field independent of
callbacks. If true, certify all frozen return lists using the same127 operation
chunks and checked prefix offsets as the weight tables. Do not assume this
identity: write-target order, roots, every literal write child and inverse lookup
must be proved. Start with a bounded constructor/field pilot and a corrupted slot.
This could replace repeated dependent layout reasoning across all paid returns,
and would also supply required return-table fidelity for the full shared checker.


Current implementation adds generic bounceIndex_val to ActualTools/audit roots,
checks rank.val once, and proves concrete addresses through that interface.
Only during the address-proof section, returnIndex/bounceIndex are irreducible;
normal status returns before actual transition proofs. This blocks unintentional
closed index normalization. There is no reducibility override on a frozen/indexed
definition. Same64/512/4096gates and caps. The original initial0/both-bit gate
also reruns with its full-private audit. No machine savings accepted by this step.


Evidence: generic value interface13root audit passes in39. Its first concrete
simpa only failed closed Fin/Nat normalization. Certificate-40 uses explicit
Eq.trans and a closed decide+kernel arithmetic proof; initial both bits and all
64states/128rows pass, with1271root full-private audit. Build59.743s/3.650GB.
No limit increased. The required false-row control still needs its harness fix;
there is no complete quotient or new full-machine saving.
