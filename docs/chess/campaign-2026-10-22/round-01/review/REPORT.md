# Independent complete-candidate advisory review

Verdict: **correct**, within the explicitly stated review authority and trust limits below. No outstanding correctness, state-accounting, frozen-source, or retained-evidence defect was found in the complete selective-return candidate reviewed on 2026-10-22. This is an independent model advisory, not human approval or formal verification performed by the reviewer.

The reviewed public claim is exactly

```text
Halts ConjectureMachines.Machines.chess_field_selective
  ↔ ¬(Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss)
```

The machine has 2,411,743 states and two symbols. It starts in state zero on an entirely blank tape. The reduction saves 492,880 states against the accepted 2,904,623-state FieldReverse machine. It does not establish whether perfect chess is a draw, and it makes no minimality claim.

## Exact identity and review method

The reviewed computation commit is `2dfa3a7656de3f15a0bbda387d6f0642328e6d08`. The original workflow commit is `965a568c124b28a48d6a1926d99a0f8496e30718`. These intentionally differ: one bounded remote session selected later source checkpoints. The successful packet is iteration 4 of [Actions run 39780889172](https://github.com/bocowgill/cryptids/actions/runs/39780889172), artifact ID `12427716840`, named `chess-goal-session-4-2dfa3a7656de3f15a0bbda387d6f0642328e6d08`.

The retained packet is `docs/chess/campaign-2026-10-22/round-01/evidence/final`. Its artifact ZIP has 9,949,872 bytes and SHA-256 `a493ccbc794bdbfce0b879d1e0cb0767f53ccba3e39bf98bfd453357f8344c10`. The logs ZIP has 53,250 bytes and SHA-256 `add1273208ccbc7c58a9da2482db34fc5a70fbb5613f63e756643b334b160cab`. The source-manifest SHA-256 is `a2864bbaf8b9f444c51f454e470ed879bea93d842154a01bbce0cc835553582f`. The executed-workflow SHA-256 is `84a7e899becfa0bebfd9cfd3404f7ada29e6f338c2e8948ca6a15e3caac7028d`.

The reviewer inspected source, saved JSON receipts and official retained logs, and locally hashed bytes. All 38 archive members match the retained CRC/size/hash inventory, unpacked files, and earlier downloaded iteration-4 files. All 16 computation-source hashes and all 2,638 frozen-file hashes match the workspace. The executed workflow also matches the original workflow commit's exact bytes. No Lean, Lake, LSP, LeanProbe, native generator, machine model, fixture, simulation, or machine recount was run by this review. Two read-only advisory subreviews independently examined the proof chain and native evidence design.

## Pass 1 — Complete semantics and proof chain

`Cryptids/Semantics/ChessFieldSelective.lean` states the original conjunction-negation directly, with no extra premise. In the frozen specification, each avoid-loss proposition quantifies a legal strategy against every legal opposing strategy and requires an actual result from the initial game. `Cryptids/Machines.lean` defines `Halts` using state zero and `Tape.mk₁ []`. Thus neither a supplied input tape nor a weakened finite-run predicate replaces the requested blank-machine claim.

`SelectiveBinary.WriteCoverage` quantifies over every Post state, scanned symbol, and actual write destination. Its coverage certificate is not a reachability or sampled-execution assumption. In `rows`, a missing return lookup contradicts the certificate; a successful lookup decodes to the precise original destination. Both present and absent transitions are preserved, as are the written symbol, direction, complete tape, and head. `haltsFrom` and `haltsOn` carry both halting directions through the exact local row certificate. The concrete public theorem discharges coverage rather than exposing it as an assumption.

`FieldReturns/Syntax.lean` retains each syntax root and each literal write child. `FieldReturns/Graph.lean` propagates coverage through both branch arms and through loads using the updated store, with structural descent. Gotos and halt are explicitly covered. `FieldSelectiveLayout.coverage` composes this with the frozen packed layout and CompactPost encoding. `FieldSelective.body_halts_input` then composes the new compiler theorem with the frozen FieldPacked theorem. The paid reverse initializer installs the exact frozen input and the final theorem transports the complete blank machine through the numeric cast. No new assumption of the open chess conjecture enters this chain.

## Pass 2 — All controls and independent transition evidence

The declared allocation and the saved independently derived allocation agree:

| Paid component | States |
| --- | ---: |
| Post main controls: 106,668 graph nodes × 5 stores + shared halt | 533,341 |
| Return controls: (4,042 roots + 4,050 write children) × 5 stores + shared halt | 40,461 |
| Complete body | 573,802 |
| Initializer bit writes | 1,837,940 |
| Initializer final rightward turn | 1 |
| Complete blank binary machine | 2,411,743 |

The layout has 8,092 structural return slots, with proved inverse and injectivity properties. Every retained return is a paid binary state. The prefix includes its final turn; no external dispatcher, restoration state, or supplied input is free. The arithmetic saving is 2,904,623 − 2,411,743 = 492,880. These figures are observations from definitions, theorem types, and saved remote receipts; this review did not rerun the allocation model.

`Export.lean` enumerates both symbols of every actual machine control, compares each with `rowMachine`, and retains all rows. Python independently reconstructs the syntax allocation, return ordering and encoded targets, Post transitions, selected binary returns, and initializer recipe. It verifies row order, destination bounds, omissions and extras. The saved receipts cover 3,675,882 prefix rows and 1,147,604 body rows, totaling 4,823,486 rows, exactly twice the full state count. The only missing rows are both symbols of the shared halt main state; its return state remains paid and has both transitions. Exact write-destination support is separately checked.

The initializer evidence replays every paid step and checks the complete normalized input, physical endpoint, blank exterior, and six edge inputs including empty, singleton zero, and boundary zeros. The source-operation fixtures cover all 4,042 labels × 5 stores × 2 marker values × 5 active-field values, giving 202,100 cases. They compare complete sparse-tape outcomes and store/dispatch behavior. Their `universal_proof: false` flag correctly limits their authority; the Lean proofs establish the universal semantic claim.

## Pass 3 — Adversarial proof, control, and regression review

The saved strict build uses `lake --wfail`, with false-contract Lean checks using `-DwarningAsError=true`. The foundation audit reports 9,259 roots and 58,974 dependencies, including opaque values and declaration types. It permits only `propext`, `Classical.choice`, and `Quot.sound`; it rejects unsafe/partial mathematical dependencies, the open conjecture, and proof generators. Compiler recursion helpers omitted as roots are checked against safe owners and remain subject to rejection if reached from a safe dependency. All three injected audit failures reject for their intended reasons.

Five false kernel contracts reject the old full count, an unpaid prefix, unpaid returns, an off-by-one saving, and a missing initializer turn. Their retained diagnostics explicitly prove the proposed equality false; they are not import, identifier, timeout, or incomplete-proof failures.

All 27 native corruption controls use unchanged validators after a passing original. They attack allocation, encoded return ranks and targets, actual writes and bounce rows, missing halt/return transitions, ordering, truncation, initializer endpoint, and prefix write/direction/final turn. Actual row mutations explicitly recheck the original record, and truncation controls use the complete-file validators. A limitation is retained honestly: the controls named `dispatch` and `frame` reject at getter consistency before the end-to-end source-case stage. They establish sensitivity of the complete validation pipeline, not isolated sensitivity of every semantic sub-oracle.

The full remote receipt includes a strict regression build of the prior fixtures, evaluation, FieldReverse semantics, and FieldBranch certificate, followed by all seven M2–M7/terminal commands. Saved results include 164 rule assertions, 55 M3 assertions, 21 M4 assertions, 16 M5 assertions, 12 M6 kernel assertions and three paired executions, 34 M7 corners with universal input equivalence, and 30 terminal corners with singleton/all-input checks. The five phase receipts have exact cumulative command lengths 1, 10, 11, 12, and 20; standalone command records and output hashes agree with them.

## Pass 4 — Provenance, review integrity, and clean final pass

`session.py` preserves the executed initial workflow, records each selected source SHA, clears the disposable evidence directory between iterations, and stops after success. Its final result records target `full`, computation commit `2dfa3a7…`, and exit zero. The official run and active session job are completed successfully; the unused direct-verification job is skipped. The checkpoint-4 selection log, complete verification log, upload digest and artifact ID, and final result all agree. Earlier iterations failed and remain visible in the session logs; their existence does not provide acceptance evidence for iteration 4. GitHub's success label on a continued-error step is not used alone as proof of a successful compiler command.

The retained toolchain log identifies Lean 4.35.0-rc4, compiler commit `c29b6dda4f7c20e3eeaa717c4e565663c5cfa364`, on Linux. Frozen `lean-toolchain` and `lake-manifest.json` match their pins; the latter pins Mathlib to `1f414401f69059aa7eead47b53ee40bd38455eeb`. The workflow fetches the pinned Mathlib cache before verification. `retain.py` retains the completed run APIs, logs, artifact bytes and inventory without executing a model or compiler.

The metadata checker is source-reviewed at SHA-256 `260552c1fcc84034cee703dff1f5b5a1405d429d843cea09cbc4696ac2a866a5`. It checks exact source and frozen hashes, archive/unpacked byte identity, run/job/session identity, command dispositions and output hashes, phase consistency, saved allocation and coverage receipts, controls, review authority, and an externally supplied seal. It hashes large row streams without parsing or recounting them. Its in-memory hostile tests first validate the unmodified packet and test inner semantic receipt guards as well as outer hash guards.

One review-integrity issue was found and repaired during this review: `report.json` could carry a narrative hash without the checker checking actual `REPORT.md` bytes. The final checker loads a safe relative narrative path, compares its actual file hash with the report, and includes distinct expected-hash and actual-content hostile controls. The report JSON binds this exact narrative. The final source/provenance pass found no remaining defect. The parent independently owns creation of the external seal and replay of the metadata and hostile-control gates; this advisory does not claim that subsequent replay has already occurred.

## Limits and authority

This verdict concerns the complete specified machine and the reviewed evidence, using the established frozen chess specification. It does not settle chess, prove state minimality, validate every possible implementation mutation, or convert finite fixtures into universal proof. The Lean numeric row recipe shares the selected return maps; numerical independence additionally comes from the separate Python reconstruction and complete actual-row comparison.

The reviewer did not independently rerun the kernel or native verification. Formal evidence is the remote build and dependency audit, while this review is adversarial source and receipt inspection. Saved API responses and an external seal are provenance trust anchors, not independently authenticated cryptographic GitHub attestations. The usual Lean kernel, native runtime, pinned dependencies, remote runner, and artifact-retention trust boundaries remain. Human approval, formal verification by the reviewer, and local heavy computation are all explicitly false.
