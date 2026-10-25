# Gates: bounded output identity wrapper and corruption control

OWNS: scripts/chess_parsimony_wrapper_20261025/**, docs/chess/parsimony-printer-2026-10-25/output-wrapper/**, .github/workflows/chess_parsimony_proof_20261024.yml

Scope: Close the final output identity using an abstract size-specialization lemma;
reuse the exact 53 checked batches, then run paired positive and one-bit corruption
controls. The nine pinned generic modules, frozen specification, packet, physical
machine and checked theorem statements stay fixed. The older goal stays paused.

- [x] W1: A successful remote kernel export proves the unchanged global_bits_identity statement, all_packet_words and packet_framing, with standard foundations and all 13,360 words covered by the 53 reused checked batches.
  CHECK: python3 scripts/chess_parsimony_wrapper_20261025/review.py --iteration 1
  EXPECT: PARSIMONY_WRAPPER_IDENTITY_VERIFIED
  EVIDENCE: exit=0; shell=/bin/sh; cwd=/Users/bocowgill/.codex/worktrees/6ba9/cryptids; path=984dc1d7a649/31 entries; EXPECT=matched; output-sha256=34d27e1a112d57eeb0e8be5037d6df477f0d80ee6ffc29655d40d2b630c8f754; output-bytes=71

- [x] C1: The positive first-bit identity compiles; its exact one-character corruption fails because the proposition is false, under the same imports, limits and producer. Frozen pins and the complete candidate stay fixed.
  CHECK: python3 scripts/chess_parsimony_wrapper_20261025/review.py --iteration 1
  EXPECT: PARSIMONY_WRAPPER_CONTROL_VERIFIED
  EVIDENCE: exit=0; shell=/bin/sh; cwd=/Users/bocowgill/.codex/worktrees/6ba9/cryptids; path=984dc1d7a649/31 entries; EXPECT=matched; output-sha256=34d27e1a112d57eeb0e8be5037d6df477f0d80ee6ffc29655d40d2b630c8f754; output-bytes=71

- [ ] R1: Push a complete recovery checkpoint with producer-bound logs and objects, resource measurements, remaining obligations and no active pilot.
  EVIDENCE: pending

At most three new source-bound remote attempts; diagnose and correct before retry.
No rebuilding the 53 batches, no later startup/cleanup/linking milestone, no paid
runners, no outreach. Heavy work stays remote; local text/AST/hash/provenance and
transport only. Each driver 1,200 seconds; cache 300 seconds; generic build 240
seconds; generated Lean stages 180 seconds. One Lean thread, heap 5 GiB,
process group plus driver 6 GiB, driver 512 MiB; free ubuntu-24.04, workflow 25 min.
Source commits use [skip ci]; only explicit scoped manual dispatch after verified push.

Accepted complete machine: 769,344 states; experimental candidate: 609,247 states;
potential reduction: 160,097 states; new accepted full-machine saving: zero.
Success here certifies the output identity, not a complete blank-tape halting theorem.
