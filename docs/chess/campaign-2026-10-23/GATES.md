# Certified 310,029-state chess machine

OWNS: scripts/chess_body_20261022/{certificate_pilot,certificate_verify,row_witness_pilot,actual_row_pilot,weight_table_pilot,operation_weights_pilot,diagnostics_pilot,symbolic_transition_pilot,source_table_pilot,source_chunk_pilot,source_complete_pilot,publish_checkpoint_api,review_retained_bytes}.py, docs/chess/campaign-2026-10-23/**

Scope: Resume the existing campaign, certify the measured whole-body quotient,
and accept a complete 310,029-state machine only after end-to-end verification.
All heavy work is remote. Frozen specification, accepted source, historical
evidence and pins stay fixed. No outreach or bulk upstream migration.

- [x] G1: The accepted 769,344-state baseline and all 3,116 file pins are preserved;
  the resumed plan and goal-API discrepancy are recorded in a pushed checkpoint.
  EVIDENCE: pins-resume.json rehashes all3116unchanged accepted files and binds manifest43942091. Source/plan checkpoint7dc9de66d358ff3d85dc3fefaf3aa4c863a58756 pushed to authorized fork. get_goal initially returned null; tracking subsequently restored from the saved objective and explicit user resume request (goal-restored.json), preserving earlier campaign history.
- [x] G2: One bounded remote validity diagnostic retains exact source, durable
  timing markers, build/audit outcomes and limits, identifying progress or an
  exact obstruction without promoting partial results to a new state count.
  EVIDENCE: Official run39980548245 at5b309f5 retained certificate-15, parent-metadata.json checks exact source/log/generated/progress hashes. MapCount42.826s; MapValid stage_wall_budget67.192s,29durable events through896/1024chunks in61.145marker seconds, peak2802655232bytes. Only Prelude/Count complete, no full validity or row credit. All caps unchanged.
- [x] G3: Complete map and quotient count/cache/range/fidelity proofs and their
  full-private audits pass under the established resource limits.
  EVIDENCE: Official run39986731860 at207c7d9, certificate-18 and parent metadata bind exact source/log/data/progress bytes. All8modules freshly Built, union32root audit passed, complete-data flagtrue in92.084s, auditpeak5025153024bytes below6GiB. Actual-row stage then fails only opaque RowAt Decidable synthesis; rowcredit0 and negativeunrun. Original claims/roots/caps unchanged.
- [ ] G4: Every actual accepted body transition is related to the complete quotient,
  preserving missing transitions and both bits; a meaningful false-row control
  fails in the kernel, and both halting directions are proved.
  EVIDENCE: certificate-40 checks original64states/128rows and1271roots/20528dependencies by full-private audit, standard3axioms. Certificate-43 kernel rejects explicit false initial row in4.968s; Rows512 then stops at180.117s below memory cap, before getter/actual proofs. Complete573802state relation and both halting directions remain unproved.
  LATEST: certificates84/87 certify complete source labels0..447,39,240
  original states/78,480rows, including actual source equality, every bit/store,
  return rank, census and full-private audit. Quarter146,200states/292,400rows
  and complete573,802state relation remain unproved. Trial88 proves reusable
  Window/list fidelity and exact World transport (11generic roots) and controlled
  small profiles, without larger-source or machine credit. Trial89stopped on a generated conjunction-constructor API error before the
  substantial tiers. Corrected90run40111992559 adds early4root wiring check,
  then compact family setup plus unchanged180/210s substantial tiers.
- [ ] G5: The complete blank-tape binary machine has exactly 310,029 paid states
  and the original not-draw equivalence; all actual rows, independent fixtures,
  corruption controls, regressions and foundation audits pass remotely.
  EVIDENCE: pending
- [ ] G6: A distinct final review and saved-evidence checks pass; the new accepted
  machine, full cost breakdown, immutable pins and clean handoff are pushed.
  EVIDENCE: pending

Numeric observation cache pilot76 is a dependency experiment only. Even complete
lookup fidelity at65536addresses earns zero G4 source-row or G5/G6 machine credit.
Local-mode1/16and1/4 source assertions and all completion requirements stay fixed.


Latest84: SOURCE16complete39,240states/78,480rows,773root private audit passes.
SOURCE4fails210s before full module/audit; no quarter scaling or full-machine
credit. G4-G6/S8-S9 stay OPEN. See SOURCE-PROFILE-GATES.md for controlled
same-host component diagnosis before structural redesign.
