# Gates: bounded full-data proof-memory pilot

OWNS: scripts/chess_parsimony_memory_20261024/**, docs/chess/parsimony-printer-2026-10-24/proof-memory/**, .github/workflows/chess_parsimony_proof_20261024.yml

Scope: Compare the retained 13,360-word instance with a shared-bound representation,
preserving Data.lean, its six checked theorem statements, the instance runData
statement, the exact candidate table and all accepted/frozen pins. This pilot adds
zero states and zero accepted savings. It tests an integration prerequisite for
the experimental 160,097-state reduction, without claiming full certification.

- [ ] K1: The unchanged generic library and both full-size instances check remotely with standard foundations and warning-free positive logs; the instance theorem statement is identical.
  CHECK: python3 scripts/chess_parsimony_memory_20261024/verify.py
  EXPECT: PARSIMONY_MEMORY_KERNEL_PASSED
  EVIDENCE: pending

- [ ] B1: Both representations export all 26,720 data cells matching the exact candidate, with preserved raw word values and a changed-data negative control rejected by the same comparator.
  CHECK: python3 scripts/chess_parsimony_memory_20261024/verify.py
  EXPECT: PARSIMONY_MEMORY_BINDING_PASSED
  EVIDENCE: pending

- [ ] M1: A paired all-word comparison records runtime, peak group RSS, object size, overhead and a decision under the unchanged resource caps, even if the representation fails to improve memory.
  CHECK: python3 scripts/chess_parsimony_memory_20261024/verify.py
  EXPECT: PARSIMONY_MEMORY_COMPARISON_PASSED
  EVIDENCE: pending

- [ ] R1: Exact producer/run, archives, logs, measurements, state breakdown, remaining obligations and restart instructions are retained in a clean pushed checkpoint; no pilot job remains active.
  EVIDENCE: pending

## Bounds and decision rule fixed before execution

Use one free standard ubuntu-24.04 runner per iteration, at most two iterations.
A second iteration requires a diagnosed obstruction and a specific correction;
do not repeat merely to obtain a favorable measurement. Each driver is bounded
by 900 seconds, cache fetch by 300 seconds, strict library build by 240 seconds,
and each full-data check/export by 120 seconds. Workflow setup is bounded by
25 minutes. Lean uses one worker thread, 5 GiB heap; sampled process-group plus
driver RSS is capped at 6 GiB and driver RSS at 512 MiB. No paid resources or
raised caps. Checkpoint after each command and each representation.

Compare the exact historical full-size source once on the same runner against
one full-size shared-bound source. Every value is taken from the unchanged
candidate rows; its original value is less than 8,192, so mapping modulo 13,360
is the identity. Check this finite binding explicitly and kernel-check the generic
constructor identity under its stated bound. Preserve the operational API rather
than replacing it by a correctness assumption. Native exports supply external
representation evidence, never a kernel proof about a binary-file parser.

Call the change materially useful if peak RSS falls by at least 256 MiB and
the object shrinks by at least 25%, without exceeding twice baseline runtime.
One paired measurement has noise; report actual measurements and uncertainty.
If the criterion fails or a resource cap is hit, redesign before integration;
do not raise the cap or claim complete-printer scaling from a data-only result.
The exact retained baseline from run 40141647723 is also reported separately.

All heavy work stays remote. Local work is restricted to text inspection, AST,
hash/provenance checks, editing and Git/artifact transport. Frozen/accepted pins,
historical evidence, Data.lean, candidate rows, outreach and the paused older
goal remain unchanged. New and emitted Lean lines must be at most 100 characters.
Only the manually selected memory workflow phase may be dispatched.
