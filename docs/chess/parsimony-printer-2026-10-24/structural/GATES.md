# Gates: first bounded structural printer certification phase

OWNS: Cryptids/Compilation/Parsimony/**, scripts/chess_parsimony_proof_20261024/**, docs/chess/parsimony-printer-2026-10-24/structural/**, .github/workflows/chess_parsimony_proof_20261024.yml, lakefile.chess-parsimony-proof-20261024.toml

Scope: Start certification of the exact 609,247-state experimental candidate.
First certify the reusable target-encoded data/unary routine with arbitrary tape
frames and exact ordinary-step counts. Test structural scaling on real width-13
data blocks, then decide whether this route supports the remaining printer proof.
Do not substitute a whole-printer correctness hypothesis for an operational proof.
Keep accepted pins, frozen specification, prior evidence and outreach unchanged.

- [x] K1: Lean kernel-checks generic data-chain and marker-query execution theorems, including termination, exact tape/head and preserved arbitrary exterior frames.
  CHECK: python3 scripts/chess_parsimony_proof_20261024/verify.py
  EXPECT: PARSIMONY_STRUCTURAL_KERNEL_PASSED
  EVIDENCE: Run 40141647723 at ce6afbdda2650a792b2fb3ff11479f31abc9a5ce exited zero and emitted the kernel token; strict --wfail library build passed. Six operational/row roots audited with standard axioms only. Generic object 41872 bytes. Exact environment/output fingerprint in gate-evidence.json and full logs in evidence/proof-04.

- [x] S1: The same generic proof instantiates on increasing substantial width-13 blocks, including all 13,360 actual words, without unrolling full printer execution; timing, memory and object sizes are retained.
  CHECK: python3 scripts/chess_parsimony_proof_20261024/verify.py
  EXPECT: PARSIMONY_STRUCTURAL_SCALING_PASSED
  EVIDENCE: Same zero-exit command and scaling token; 512/8192/13360 sourced words passed in 4.941/18.813/26.910 seconds. Sampled full peak 6059950080 bytes, below the unchanged 6 GiB cap; full object 16392352 bytes. See retained scaling.json, generated sources/objects and RESULTS.md for remaining memory risk.

- [x] B1: Lean exports every canonical data transition for the exact packet block and independent comparison matches all corresponding actual candidate rows; kernel/transport obligations are distinguished.
  CHECK: python3 scripts/chess_parsimony_proof_20261024/verify.py
  EXPECT: PARSIMONY_STRUCTURAL_BINDING_PASSED
  EVIDENCE: Same zero-exit command and binding token; all 26720 data cells match the exact candidate after offset six, with a transport mutation rejected at every point. Full candidate input hash b9cf384e5470f3c9f5c501bd8c13555f15d4ea134469f5d159cd1bdb363cbf45. RESULTS.md explicitly distinguishes external representation evidence from full-machine/kernel parser certification.

- [x] A1: Strict remote Lean checks, transitive foundation inspection and a real changed-row corruption test pass; no sorry, custom axioms or native proof oracle enter the result.
  CHECK: python3 scripts/chess_parsimony_proof_20261024/verify.py
  EXPECT: PARSIMONY_STRUCTURAL_AUDIT_PASSED
  EVIDENCE: Same zero-exit command and audit token; all six roots and three instances depend only on propext/Classical.choice/Quot.sound. All positive logs warning-free; changed real write row fails with False (expected exit one). New source widths checked before proof stages; native execution used only for export, never as a proof oracle. See foundations.log, scale logs and changed-row-corruption.log.

- [x] R1: A clean pushed checkpoint retains exact producer/run, complete artifacts/logs, state breakdown, proof coverage, unresolved printer/link obligations and a continue/redesign decision.
  EVIDENCE: Complete recovery payload pushed in d4f8d54c014f38047f3b97906836a081d5fc9fe8; push exited zero and fork ref matched. All four jobs terminal. Archive/log digests, exact committed producers, proof/scaling objects and exports independently verified; accepted pins unchanged. RESULTS.md/CHECKPOINT.md distinguish component proofs, transport evidence and zero accepted savings, rank next tasks and retain the 5.64 GiB integration risk. Manual provenance review only.

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
