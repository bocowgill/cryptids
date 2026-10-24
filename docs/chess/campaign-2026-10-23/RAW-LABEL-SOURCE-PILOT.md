# Replace per-label bound proofs with raw data and one checked decoder

Status: raw_label_pilot.py is now wired in moderaw, but UNEXECUTED. It proposes
24explicit roots. Accepted769344, target310029, prospective saving459315.
No new full-machine saving or complete source certificate is accepted.

Source54's4051label/field/store-bound declarations consume enough setup that
only88/127chunk markers occur before60s. Chunk cadence improved but whole-stage
completion worsened. Abandon that variant; do not raise the time or memory cap.

RawOp retains only the nine small Fin4/Fin5 field/store values; every target label
is Nat, including jump-vector cells. narrow n x explicitly checks x<n before
constructing Fin.mk, otherwise returning none. No Fin.ofNat/modulo conversion.
The proposed universal proofs show successful narrowing preserves the raw value,
decode(erase typed)=some typed, injectivity, exact restoration of every original
operation and its source meaning. This removes thousands of generated label-bound
tactics/declarations. A separate labelsBounded checker has a universal soundness
theorem. Positive full data must prove its raw labels bounded before conversion.

- [ ] L1: Universal scalar/vector/operation decoder and restoration proofs build
  and pass a full-private24root audit under60s/6GiB. Vector5eta uses the pinned
  Vector.ext API (Nat index and bound), with an explicit IntervalCases import.
- [ ] L2: Two actual frozen source jumps equal raw tables. A changed valid label
  is rejected as source data; label4042in scalar/jump positions and a large
 4294967295label decode to none, preventing silent wrapping into a valid target.
- [ ] L3: One COMPLETE frozen32operation chunk, including nonconstant load285,
  proves raw-source equality, raw-label boundedness and original restoration,
  and rejects a corrupted callback. Reuse only9small exact-bound constants.
- [ ] L4: All127chunks combine through named balanced-parent facts. Preserve the
  same full source reconstruction/lowering/length/all-label meaning conclusions
  and raw range certificate. No individual label-bound catalog remains. Retain
  timing markers for every major phase and every required root/audit/source hash.

No full source credit follows from L1/L2or one chunk. This representation is a
prerequisite for the complete local quotient checker, not a new interpreter.
Use original60scomponent/180sorchestration/6GiB limits. A failed pilot requires a
specific diagnosed obstruction before retrying. Actual-body scaling still needs
complete chunk checks, corruption controls, then1/16and1/4paid-state coverage,
all-state relation, both halting directions, exact310029allocation and final review.

The independent observed-cache/source-slot theorem pilot proceeds separately.
Raw source reconstruction is required before its actual decoded-source application.

Pilot57 failed a residual definitional bind reduction and strict warnings;
certificate57 retains the exact log. Correct those issues without changing caps
or obligations. RawChunk is now wired after the decoder's successful audit and
checks L3 in the same bounded remote trial. L1-L4 remain unchecked until evidence.

Trial59 run40063451158 at fb4cdccaed7dcfa85e3ed90df3583590fa11b7ea finishes
SUCCESS, including required SourceTables/RawLabels/RawChunk fresh builds and
full-private audits. Exact retention/review follows; L1-L3 now have successful
remote command evidence. Next wire L4: all127balanced chunk fidelity and bound
facts, plus universal source lookup/restoration/lowering/meaning, within the same
60scomponent/180sorchestration/6GiB limits. No label-bound catalog, no changed
frozen source, no dropped all-label theorem or strict linting. Source operation
coverage is not quotient-state coverage. New accepted full-machine savings0.

Final raw source gate63 PASSES: all4042operations/127chunks;17required roots,
24790dependencies, standard3axioms only.46.202s build +3.250s full-private audit,
peak4760358912bytes under6GiB. Certificate63 exact bytes/provenance reviewed.
L1-L4are now met. This removes a measured source-format overhead category; it
adds0actual quotient rows and0accepted full-machine savings. Proceed to local
rule checking. Do not rerun the abandoned typed catalog54or monolithic51/52route.
