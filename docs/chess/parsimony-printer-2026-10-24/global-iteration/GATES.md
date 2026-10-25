# Gates: bounded global printer iteration and frozen packet identity

OWNS: Cryptids/Compilation/Parsimony/Global.lean, Cryptids/Compilation/Parsimony/Packet.lean, scripts/chess_parsimony_global_20261024/**, docs/chess/parsimony-printer-2026-10-24/global-iteration/**, lakefile.chess-parsimony-global-20261024.toml, .github/workflows/chess_parsimony_proof_20261024.yml

Scope: Prove complete word iteration and its final data_out one branch using the
unchanged indexed macro, and prove the emitted ordered bits equal the exact
frozen framed packet including width padding. Instantiate at all 13,360 words.
Keep the seven checked sources, accepted/frozen pins and physical machine fixed.
The persistent older goal stays paused; this is separately authorized bounded work.

- [ ] I1: Strict remote Lean checks structural iteration with an exact tape/head boundary and the final data_out one branch; its full-data root uses the actual physical indexed contract.
  CHECK: python3 scripts/chess_parsimony_global_20261024/verify.py
  EXPECT: PARSIMONY_GLOBAL_ITERATION_PASSED
  EVIDENCE: pending

- [ ] P1: A kernel-checked ordered bit/string identity binds every emitted width-13 word to the frozen packet, its 32-one marker, separator, tail 100 and three padding zeros, with source/file representation binding explicitly distinguished.
  CHECK: python3 scripts/chess_parsimony_global_20261024/verify.py
  EXPECT: PARSIMONY_FROZEN_PACKET_IDENTITY_PASSED
  EVIDENCE: pending

- [ ] B1: All-data composition stays within unchanged time/memory caps, foundations are standard, deliberate identity corruption fails, and previous source/machine pins stay identical.
  CHECK: python3 scripts/chess_parsimony_global_20261024/verify.py
  EXPECT: PARSIMONY_GLOBAL_BINDING_PASSED
  EVIDENCE: pending

- [ ] R1: Retain all producer-bound logs/artifacts, measurements, failures, remaining obligations and exact recovery instructions in a pushed checkpoint, with no active pilot left.
  EVIDENCE: pending

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
