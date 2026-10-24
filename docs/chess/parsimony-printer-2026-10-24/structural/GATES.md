# Gates: first bounded structural printer certification phase

OWNS: Cryptids/Compilation/Parsimony/**, scripts/chess_parsimony_proof_20261024/**, docs/chess/parsimony-printer-2026-10-24/structural/**, .github/workflows/chess_parsimony_proof_20261024.yml, lakefile.chess-parsimony-proof-20261024.toml

Scope: Start certification of the exact 609,247-state experimental candidate.
First certify the reusable target-encoded data/unary routine with arbitrary tape
frames and exact ordinary-step counts. Test structural scaling on real width-13
data blocks, then decide whether this route supports the remaining printer proof.
Do not substitute a whole-printer correctness hypothesis for an operational proof.
Keep accepted pins, frozen specification, prior evidence and outreach unchanged.

- [ ] K1: Lean kernel-checks generic data-chain and marker-query execution theorems, including termination, exact tape/head and preserved arbitrary exterior frames.
  CHECK: python3 scripts/chess_parsimony_proof_20261024/verify.py
  EXPECT: PARSIMONY_STRUCTURAL_KERNEL_PASSED
  EVIDENCE: pending

- [ ] S1: The same generic proof instantiates on increasing substantial width-13 blocks, including all 13,360 actual words, without unrolling full printer execution; timing, memory and object sizes are retained.
  CHECK: python3 scripts/chess_parsimony_proof_20261024/verify.py
  EXPECT: PARSIMONY_STRUCTURAL_SCALING_PASSED
  EVIDENCE: pending

- [ ] B1: Lean exports every canonical data transition for the exact packet block and independent comparison matches all corresponding actual candidate rows; kernel/transport obligations are distinguished.
  CHECK: python3 scripts/chess_parsimony_proof_20261024/verify.py
  EXPECT: PARSIMONY_STRUCTURAL_BINDING_PASSED
  EVIDENCE: pending

- [ ] A1: Strict remote Lean checks, transitive foundation inspection and a real changed-row corruption test pass; no sorry, custom axioms or native proof oracle enter the result.
  CHECK: python3 scripts/chess_parsimony_proof_20261024/verify.py
  EXPECT: PARSIMONY_STRUCTURAL_AUDIT_PASSED
  EVIDENCE: pending

- [ ] R1: A clean pushed checkpoint retains exact producer/run, complete artifacts/logs, state breakdown, proof coverage, unresolved printer/link obligations and a continue/redesign decision.
  EVIDENCE: pending; manual provenance and fork-ref review after terminal execution

## Bounds and limits of this phase

At most four source-bound remote proof iterations, with a diagnosed corrective
change before any failed-stage retry. Each driver is capped at 900 seconds;
individual Lean stages at 240 seconds, scaling points at 120 seconds, and dependency
cache fetch at 300 seconds. Existing free ubuntu-24.04 GitHub-hosted runners only.
Use one Lean worker thread, Lean heap cap 5 GiB, process-group-plus-driver RSS cap
6 GiB, and driver RSS cap 512 MiB. No paid resources or resource escalation.
Keep setup bounded by a 25-minute workflow timeout. Retain partial stage results
on failure. No local Lean/Lake/LSP/LeanProbe, compilation, generation or counting.
The initial workflow-file-only push registers the new workflow and launches the
first iteration once; subsequent source-only iterations are manually dispatched.
Do not send a duplicate manual dispatch for the initial registration event.

Targeted proof coverage is the actual data routine, not yet every printer phase.
The 140-state extractor, framing/cleanup, complete blank-tape startup and direct
link/relocation still need proofs before accepting a new chess machine. Export
comparison is executable representation evidence, not a kernel theorem about a
binary-file parser. The accepted size remains 769,344 until full certification;
609,247 and the 160,097 saving remain experimental throughout this first phase.
