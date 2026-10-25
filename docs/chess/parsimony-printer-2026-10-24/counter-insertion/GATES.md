# Gates: bounded counter and word-insertion certification

OWNS: Cryptids/Compilation/Parsimony/Common.lean, Cryptids/Compilation/Parsimony/Counter.lean, Cryptids/Compilation/Parsimony/Insertion.lean, Cryptids/Compilation/Parsimony/Extractor.lean, Cryptids/Compilation/Parsimony/IndexedInsertion.lean, Cryptids/Compilation/Parsimony/IndexedExtractor.lean, scripts/chess_parsimony_counter_20261024/**, docs/chess/parsimony-printer-2026-10-24/counter-insertion/**, lakefile.chess-parsimony-counter-20261024.toml, .github/workflows/chess_parsimony_proof_20261024.yml

Scope: Certify the existing physical counter and blank-word insertion, including
their unary-conversion composition with the data routine at all 13,360 words.
Use shared proof data and structural induction, exact head/tape contracts and
arbitrary exterior frames. Preserve Data.lean, historical evidence, accepted
sources, complete candidate rows and frozen pins. No machine reduction is
accepted until the later complete printer/link/halting proof is finished.

- [x] C1: Remote Lean checks a reusable nonoverflowing ripple-carry counter contract with exact tape/head and a binary-value successor guarantee.
  CHECK: python3 scripts/chess_parsimony_counter_20261024/verify.py
  EXPECT: PARSIMONY_COUNTER_KERNEL_PASSED
  EVIDENCE: Final run 40149380578 at 86439e752fc3b2f0fb296d02781e026fca76e655 exited zero and emitted the counter token. Strict counter build and foundations passed; length/value/existence, pass and paid return audited with standard axioms only. Earlier checked source pins stayed identical and the final physical rows are bound. Full logs, shell/cwd/output fingerprint and exact producer are in evidence/counter-07 and gate-evidence.json.

- [x] W1: Remote Lean checks blank-word insertion for arbitrary unary value and word-index lengths and exterior frames, including both carry paths and the real finish controls.
  CHECK: python3 scripts/chess_parsimony_counter_20261024/verify.py
  EXPECT: PARSIMONY_INSERTION_KERNEL_PASSED
  EVIDENCE: Same final zero-exit run emitted the insertion token. IndexedInsertion.word covers arbitrary value/index runs, both index-shift branches, carries and real finish controls; IndexedExtractor crosses and finally erases the index. The earlier zero-index specialization is pinned unchanged. Strict builds and standard-foundation audits of all indexed roots passed. Every used control is a real emitted address; no ghost or extra paid states.

- [x] U1: The data query, branching, insertion and conversion contracts compose for actual unary word-index entries without full-execution unrolling, and instantiate with shared data at all 13,360 actual words under fixed caps.
  CHECK: python3 scripts/chess_parsimony_counter_20261024/verify.py
  EXPECT: PARSIMONY_COUNTER_COMPOSITION_PASSED
  EVIDENCE: Same final zero-exit run emitted the composition token. ParsimonyComposed.allWordsIndexed sets the real index run to i.val for every i : Fin 13360, proves a width-13 word of the actual value and the exact tape/head/erased-index/new-marker boundary. Shared proof data and generic capacity proof avoid full execution unrolling. All-word compile/export 14.678 seconds, sampled peak 5364101120 bytes, object 13456080 bytes, below unchanged caps. Whole-machine global proofs remain outside this gate.

- [x] B1: All used canonical rows match the unchanged candidate, strict positive proof logs and foundation audits pass, and positive-tested corruption controls reject changed transitions.
  CHECK: python3 scripts/chess_parsimony_counter_20261024/verify.py
  EXPECT: PARSIMONY_COUNTER_BINDING_AUDIT_PASSED
  EVIDENCE: Same final zero-exit run emitted the binding/audit token. All 27078 cells at addresses 6..13544 match the unchanged candidate. Changed exported data and a single actual increment write are rejected; negative kernel command exits one as expected. Every positive log is warning-free, all roots standard-only, all accepted/frozen and checked-source pins preserved. review.py --iteration 7 independently verified retained provenance, producer blobs, hashes and the single corruption difference. External binary binding is distinguished from a kernel parser/full-machine theorem in RESULTS.md.

- [x] R1: Complete producer-bound artifacts/logs, measurements, state breakdown, unresolved obligations, diagnosed failures and next task are retained in a clean pushed checkpoint; no pilot job remains active.
  EVIDENCE: Complete recovery payload 56158fe52c7915e7f827c573215a9a75bda531cd pushed with exit zero and fork ref independently matched. All 38 final artifact members, seven run archives and twelve incidental CI logs are tracked; exact producer blobs and hashes reviewed. Entire Chess branch has zero active runs after wind-down, with four incidental CI successes and eight cancellations retained. Working tree was clean. RESULTS.md/CHECKPOINT.md retain all state categories, actual indexed contract, measured caps/uncertainty, failed approaches and next global proof. Five gates met, zero unmet or abandoned; no automatic continuation.

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
