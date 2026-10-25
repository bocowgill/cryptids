# Gates: bounded counter and word-insertion certification

OWNS: Cryptids/Compilation/Parsimony/Common.lean, Cryptids/Compilation/Parsimony/Counter.lean, Cryptids/Compilation/Parsimony/Insertion.lean, Cryptids/Compilation/Parsimony/Extractor.lean, scripts/chess_parsimony_counter_20261024/**, docs/chess/parsimony-printer-2026-10-24/counter-insertion/**, lakefile.chess-parsimony-counter-20261024.toml, .github/workflows/chess_parsimony_proof_20261024.yml

Scope: Certify the existing physical counter and blank-word insertion, including
their unary-conversion composition with the data routine at all 13,360 words.
Use shared proof data and structural induction, exact head/tape contracts and
arbitrary exterior frames. Preserve Data.lean, historical evidence, accepted
sources, complete candidate rows and frozen pins. No machine reduction is
accepted until the later complete printer/link/halting proof is finished.

- [x] C1: Remote Lean checks a reusable nonoverflowing ripple-carry counter contract with exact tape/head and a binary-value successor guarantee.
  CHECK: python3 scripts/chess_parsimony_counter_20261024/verify.py
  EXPECT: PARSIMONY_COUNTER_KERNEL_PASSED
  EVIDENCE: Run 40147646742 at b32b0642816973b1fed4f7bcc6cafd78a212f68f exited zero and emitted PARSIMONY_COUNTER_KERNEL_PASSED. Strict counter build and foundations passed; plus_length/value/exists, pass and complete paid return run audited with standard axioms only. Checked declarations are now pinned in checked-routines-pins.json; all-word physical instantiation remains U1/B1.

- [x] W1: Remote Lean checks blank-word insertion for arbitrary unary length and exterior frames, including both carry paths and the real finish controls.
  CHECK: python3 scripts/chess_parsimony_counter_20261024/verify.py
  EXPECT: PARSIMONY_INSERTION_KERNEL_PASSED
  EVIDENCE: Same zero-exit run emitted PARSIMONY_INSERTION_KERNEL_PASSED. Strict insertion build and foundations passed for charZero, charPositive, charCarry, carryRun, zeroRun and word. Exact arbitrary-frame word contract includes both separators, paid finish controls and all carry entries. No statement was weakened after checking; the source is pinned. Full-data binding remains U1/B1.

- [ ] U1: The data query, branching, insertion and conversion contracts compose without full-execution unrolling, and instantiate with shared data at all 13,360 actual words under fixed caps.
  CHECK: python3 scripts/chess_parsimony_counter_20261024/verify.py
  EXPECT: PARSIMONY_COUNTER_COMPOSITION_PASSED
  EVIDENCE: pending

- [ ] B1: All used canonical rows match the unchanged candidate, strict positive proof logs and foundation audits pass, and positive-tested corruption controls reject changed transitions.
  CHECK: python3 scripts/chess_parsimony_counter_20261024/verify.py
  EXPECT: PARSIMONY_COUNTER_BINDING_AUDIT_PASSED
  EVIDENCE: pending

- [ ] R1: Complete producer-bound artifacts/logs, measurements, state breakdown, unresolved obligations, diagnosed failures and next task are retained in a clean pushed checkpoint; no pilot job remains active.
  EVIDENCE: pending

## Bounded execution and honest stopping

At most eight source-bound remote iterations. Diagnose the command log and make
a specific correction before retrying a failed stage. No unchanged retries or
resource escalation. Each driver is bounded by 1,200 seconds, dependency fetch
by 300 seconds, each generic proof build by 240 seconds and each all-word
composition/export by 180 seconds, within a 25-minute workflow timeout. Free
ubuntu-24.04 runner only; one Lean thread, 5 GiB Lean heap, 6 GiB sampled
group-plus-driver RSS, 512 MiB driver. Checkpoint after each bounded command.

If the phase cannot close a required proof within its bounds, retain the exact
obstruction and checked prefix and mark the gate as an explicit incomplete
handoff. Never replace a routine proof by a hypothesis of its own correctness.
Finite native checks and exported rows remain external representation evidence,
not kernel proofs of a binary parser. Record accepted full-machine savings
separately from component proofs and experimental counts.

All heavy work, including Lean/LSP/LeanProbe, generation, simulations, fixtures
and counting, stays remote. Local work is text, AST, provenance, editing and
Git/artifact transport only. Authored/generated Lean lines must be at most 100
characters. The older goal remains paused; this is a separately authorized
bounded phase. Outreach stays held, with no automatic subsequent phase.
