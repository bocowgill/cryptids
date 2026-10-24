# Gates: bounded full-data proof-memory pilot

OWNS: scripts/chess_parsimony_memory_20261024/**, docs/chess/parsimony-printer-2026-10-24/proof-memory/**, .github/workflows/chess_parsimony_proof_20261024.yml

Scope: Compare the retained 13,360-word instance with a shared-bound representation,
preserving Data.lean, its six checked theorem statements, the instance runData
statement, the exact candidate table and all accepted/frozen pins. This pilot adds
zero states and zero accepted savings. It tests an integration prerequisite for
the experimental 160,097-state reduction, without claiming full certification.

- [x] K1: The unchanged generic library and both full-size instances check remotely with standard foundations and warning-free positive logs; the instance theorem statement is identical.
  CHECK: python3 scripts/chess_parsimony_memory_20261024/verify.py
  EXPECT: PARSIMONY_MEMORY_KERNEL_PASSED
  EVIDENCE: Run 40143132066 at 5e978b16ee8269943ef4e9999b6f34cafc965801 exited zero and emitted the kernel token. Data.lean and its 41872-byte object retain their preceding hashes; instance statement/proof text is identical. Strict library build and standard-foundation audits passed with warning-free proof logs. Exact environment and workflow-step output fingerprint in gate-evidence.json; full evidence under evidence/memory-01.

- [x] B1: Both representations export all 26,720 data cells matching the exact candidate, with preserved raw word values and a changed-data negative control rejected by the same comparator.
  CHECK: python3 scripts/chess_parsimony_memory_20261024/verify.py
  EXPECT: PARSIMONY_MEMORY_BINDING_PASSED
  EVIDENCE: Same zero-exit run and binding token. Both complete exports have SHA e4820e2a8ad863cd6d3728b120c67f5a249fac8f9418445fb55f795cfbba6a2c and match the exact unchanged candidate. All words satisfy the constructor identity bound; generic identity kernel-checked. Both positive-tested comparators reject a changed encoded word. RESULTS.md distinguishes external binding from kernel parser/full-machine certification.

- [x] M1: A paired all-word comparison records runtime, peak group RSS, object size, overhead and a decision under the unchanged resource caps, even if the representation fails to improve memory.
  CHECK: python3 scripts/chess_parsimony_memory_20261024/verify.py
  EXPECT: PARSIMONY_MEMORY_COMPARISON_PASSED
  EVIDENCE: Same zero-exit run and comparison token. Paired peak 6064721920 to 5223178240 bytes (802.56 MiB less), elapsed 23.824 to 8.453 seconds, object 16392400 to 11827144 bytes (27.85% smaller), all at 13360 words under unchanged caps. Continue shared representation; whole-composition memory and full correctness remain open. Retained comparison arithmetic and provenance independently rechecked by review.py --iteration 1.

- [x] R1: Exact producer/run, archives, logs, measurements, state breakdown, remaining obligations and restart instructions are retained in a clean pushed checkpoint; no pilot job remains active.
  EVIDENCE: Complete recovery payload 95d47d645fe190ef04d38fcade23176ee8c2fa64 pushed with exit zero and fork ref independently matched. All 23 artifact members are tracked, full archive/log digests and exact producer hashes verified. The sole memory run is terminal success; checkpoint pushes produced no new run. Working tree was clean after payload push. RESULTS.md and CHECKPOINT.md preserve every state category, measured limits, uncertainty, unresolved obligations and next task. Four gates met, zero unmet or abandoned; no automatic continuation.

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
