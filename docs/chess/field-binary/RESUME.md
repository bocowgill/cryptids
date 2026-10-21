# Field-aware binary pilot checkpoint

Work in bocowgill/cryptids on codex/chess-openevolve-pilot. Do not change any file
pinned by baseline-pins.json (237 prior accepted files), the frozen chess reference,
or the default toolchain. All new implementation is separate. Heavy Lean,
fixture, native and count computation stays remote. Outreach stays on hold.

The finite routine compiler is certified by a strict remote build in run39610078320
at6a1e80d. That whole run failed in Fields.lean, so it is not a passed pilot.
Run39610691159 at e642c72 passed strict Fields.lean (all arbitrary-tape read, write,
frame and movement proofs), then failed two coordinate-cast goals in Codec.lean.
The current patch adds the missing congruence step and repairs the audit name test;
inspect the latest run before starting a duplicate. Earlier failed attempts are retained in
evidence/history. The cancelled duplicate39608526061 ran the old e3c6617 source
because a Git-index permission failure prevented a new commit; it is not useful
new proof evidence. Subsequent Git mutations use escalation for the external index.

Uncommitted follow-up repairs may be present: independent review found the audit's
forbidden-generator name test must precede env.find?, and comparison documentation
must explicitly note overlapping old read/write families. These do not change the
field routines. A complete successful run with final source hashes is still needed.

Files: Routine.lean (charged finite binary tree compiler and execution/exit proofs),
Fields.lean (arbitrary-tape read/write/13-bit move contracts), Codec.lean (four
five-valued fields plus marker, invalid-code behavior and cell refinement), Pilot.lean
(exact counts and explicitly scoped old allocation sensitivities). Remote harness
is scripts/chess_field_binary/verify.py and .github/workflows/chess_field_binary.yml.

Candidate standalone counts are39/66/93/120 for reads,5/11/17/23 for constant writes,
14 for movement. These remain proposed until final strict proof replay and actual
emitted-row checks pass. Old generic allocation differences211410/82000/110 are
counterfactual marginals holding other inventory parameters fixed, with overlapping
families; they are not additive per-operation replacement costs. No new full chess
machine, total saving or interpreter integration is claimed.

Native export produces38 complete binary routine tables. Independent Python
fixtures must check all8192 raw cell patterns (including1250 valid cells), arbitrary
sampled nonblank neighbours, exact result/head/tape and six deliberate corruptions.
They supplement universal proofs. Native dependency audit and three false theorem
controls must pass before acceptance. Record all receipts under one exact source map.

Independent referee /root/field_referee owns only .unlazy/chess-field-binary/review/**
and its own ledger. R1 source review is in flight; R2 awaits actual successful final
evidence and final public docs. Root owns all public files. Acceptance ledger:
.unlazy/chess-field-binary/GATES.md, six root gates plus two review gates. Do not run
CHECK commands locally except --metadata. Saved-evidence/hash replay is local-safe.
