# R1 repair review — advisory source acceptance, elaboration pending

The repaired candidate states the missing operational assembly. `sourceRun` iterates the actual `TM1.step sourceMachine`; `source_return` concludes exactly `n + 1` source steps reach `(some continuation, v, last)`. Its `ReturnPath` induction follows the same first-marker contract as the binary proof, including the already-marked base case.

`decodeControl` recognizes only the five entry and five continuation boundary controls. `RepresentsCfg` combines that control/store interpretation with the global tape relation. `decode_boundaries` ties the concrete numeric entry/port states to the raw interpreter labels and five store values. `return_certificate` consumes the independent source and binary run lemmas and exposes both initial and final configuration correspondences plus the exact binary head shift. This closes the two R1 statement/assembly gaps without implying execution of the later `.normal 2` body.

The verifier now reads and source-binds `docs/chess/field-return/baseline-pins.json`, closing the pin-manifest gap. The audit also requires `return_certificate`, `source_return`, and `decode_boundaries` by name, in addition to its namespace-wide closure traversal.

**Disposition:** no remaining critical mathematical statement-fidelity or hidden-control issue found in this repair, within the finite return-capsule scope. This is advisory acceptance of the source-level construction, conditional on successful same-source official elaboration, trust audit, export/replay, and count evidence. It is neither formal nor human approval. All R2 evidence gates remain pending. Root is still repairing elaboration-only issues from the retained first remote attempt; final hashes must therefore be rebound and the relevant final source reread during R2.

The earlier R1 critique and hashes remain preserved as the original review record; this addendum supersedes its three repair requests, not its scope limitations. No local Lean, native, machine, fixture, or count computation was performed.
