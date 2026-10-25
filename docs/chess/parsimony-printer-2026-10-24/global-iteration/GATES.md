# Gates: bounded global printer iteration and frozen packet identity

OWNS: Cryptids/Compilation/Parsimony/Global.lean, Cryptids/Compilation/Parsimony/Packet.lean, scripts/chess_parsimony_global_20261024/**, docs/chess/parsimony-printer-2026-10-24/global-iteration/**, lakefile.chess-parsimony-global-20261024.toml, .github/workflows/chess_parsimony_proof_20261024.yml

Scope: Prove complete word iteration and its final data_out one branch using the
unchanged indexed macro, and prove the emitted ordered bits equal the exact
frozen framed packet including width padding. Instantiate at all 13,360 words.
Keep the seven checked sources, accepted/frozen pins and physical machine fixed.
The persistent older goal stays paused; this is separately authorized bounded work.

- [x] I1: Strict remote Lean checks structural iteration with an exact tape/head boundary and the final data_out one branch; its full-data root uses the actual physical indexed contract.
  CHECK: python3 scripts/chess_parsimony_global_20261024/review.py --iteration 8 --partial
  EXPECT: PARSIMONY_GLOBAL_PARTIAL_RETAINED_VERIFIED
  EVIDENCE: Run 40157504256 at 317cb4f2efcb561687af90c979e48323e51b6b78 checked the full operational root in 3.114 seconds, with all 27078 rows bound to the unchanged candidate, strict generic builds and standard foundations. The full workflow failed later at a distinct wrapper. The evidence-only check above exited zero and verified the exact producer, completed kernel commands, row export hash, objects and frozen pins; see partial-review.json. This gate claims the checked iteration only, not whole-phase success.

- [ ] P1: A kernel-checked ordered bit/string identity binds every emitted width-13 word to the frozen packet, its 32-one marker, separator, tail 100 and three padding zeros, with source/file representation binding explicitly distinguished.
  CHECK: python3 scripts/chess_parsimony_global_20261024/verify.py
  EXPECT: PARSIMONY_FROZEN_PACKET_IDENTITY_PASSED
  EVIDENCE: All 53 batch modules and numeric packet/framing roots checked; final operational identity wrapper hits recursion depth at Identity.lean:242. No Identity.olean exported; global_bits_identity depends on automatic sorryAx after that error and is rejected. Eight-attempt bound reached; see RESULTS.md and the complete retained run.

- [ ] B1: All-data composition stays within unchanged time/memory caps, foundations are standard, deliberate identity corruption fails, and previous source/machine pins stay identical.
  CHECK: python3 scripts/chess_parsimony_global_20261024/verify.py
  EXPECT: PARSIMONY_GLOBAL_BINDING_PASSED
  EVIDENCE: Final run stays within all memory/time caps, all successful roots have standard foundations, all earlier pins and rows are fixed. Positive/negative packet controls were not reached because the final wrapper failed; the full binding/audit gate remains incomplete.

- [x] R1: Retain all producer-bound logs/artifacts, measurements, failures, remaining obligations and exact recovery instructions in a pushed checkpoint, with no active pilot left.
  EVIDENCE: Complete recovery payload aefede63cb4d376bd8939a0a5b096781454fbb1d pushed with exit zero; exact fork ref independently matched, working tree clean, and both active/queued Chess-branch run lists empty. All eight archives/logs and final 53 object/source pairs are tracked. RESULTS.md/CHECKPOINT.md record the incomplete wrapper, rejected sorryAx root, unrun controls, unchanged counts, measured full-data scaling and next task. Older goal stays paused; outreach held. Two gates met, two explicitly abandoned as incomplete handoff, zero pending.

At most eight source-bound remote iterations; no unchanged retries, resource
escalation, paid runner or broad CI dispatch. Each driver: 1,200 seconds; cache:
300 seconds; each generic build: 240 seconds; each full-data stage: 180 seconds.
Free ubuntu-24.04 runner; one Lean thread, 5 GiB heap, sampled group+driver 6 GiB,
driver 512 MiB, workflow 25 minutes. Checkpoint after each stage. Use [skip ci]
source commits and dispatch only the scoped manual pilot after a verified push.

All heavy work remains remote; local text/AST/hash/provenance/transport only.
No outreach. Never change theorem statements/pins or hide failed obligations.
Accepted complete size 769,344; experimental size 609,247; potential saving
160,097; new accepted full-machine saving zero until complete blank startup,
cleanup/linking and both halting directions are proved and audited.

ABANDON: P1 Eight source-bound attempts exhausted. Full word certificates and numeric/framing roots are retained, but the operational identity wrapper is not checked. Recover with an abstract size-specialized rendering lemma; do not treat the failed root as proved.
ABANDON: B1 The end-to-end identity wrapper and its deliberate corruption control remain unchecked; no more jobs are launched in this bounded phase.
