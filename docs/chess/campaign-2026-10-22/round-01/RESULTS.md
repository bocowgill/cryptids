# Selective return controls: 2,411,743 states

Status: **accepted**. The complete remote proof and validation, fresh independent
advisory, sealed parent replay and evidence corruption controls passed. The best
certified complete chess machine is now **2,411,743 states**.

The candidate saves **492,880** states by retaining a binary return control only
for a possible Post write destination. Every main control remains. The proof covers
every retained state and arbitrary tape, without a reachability assumption.

| Paid allocation | States |
| --- | ---: |
| Reverse initializer writes | 1,837,940 |
| Initializer final rightward turn | 1 |
| Main controls, including shared halt | 533,341 |
| Return controls: shared halt plus 8,092 slots × five stores | 40,461 |
| **Complete machine** | **2,411,743** |

The 8,092 slots are the 4,042 source-label roots and 4,050 literal write children.
The complete body is 573,802 states; the paid prefix remains 1,837,941 states.
There is no free dispatch, bootstrap, return, halt or tape data. The state range is
`[0,2411743)`, with body entry 1,837,941. Main halt is 1,837,942 and its retained
return is 2,371,282. Both missing halt rows are included in the full row evidence.

## Certified declarations

`ConjectureMachines.Machines.chess_field_selective : Machine 2411743 2` starts at
state zero on a completely blank tape. The theorem
`ConjectureMachines.Semantics.ChessFieldSelective.halts_iff_not_draw` proves

```text
Halts chess_field_selective ↔
  ¬(Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss).
```

`SelectiveBinary.rows` establishes exact one-step decoding to the accepted binary
compiler. `FieldReturns.Syntax` identifies roots and write children, and
`FieldReturns.Graph` covers every graph write, including pure load/branch descent,
goto and terminal writes. `FieldSelectiveLayout.coverage` composes these proofs
with the complete frozen allocation. `FieldSelective.generated_states`,
`strict_reduction`, `initialises`, `rowMachine_eq` and `halts_iff` certify the full
count, paid startup, numeric transition image and both halting directions.

The frozen input, source program, chess rules and earlier evidence remain fixed.
All 2,638 pre-campaign files match `../baseline-pins.json`. The input still contains
1,837,940 bits and 141,380 source cells. Startup ends at physical coordinate
−1,837,939; its relative tape is exactly `Tape.mk₁ bits.toList`, with blank exterior.
No distinguished physical origin is restored or required. This construction does
not determine chess's value or whether the machine halts.

## Complete remote verification

[Run 39780889172](https://github.com/bocowgill/cryptids/actions/runs/39780889172)
completed successfully. Iteration 4 checked computation commit
`2dfa3a7656de3f15a0bbda387d6f0642328e6d08`; the executed workflow began at
`965a568c124b28a48d6a1926d99a0f8496e30718`. The session binding retains both
identities. The pinned Lean/mathlib toolchain is 4.35.0-rc4.

All 20 command receipts passed their required exit conditions across five phases:
build, contracts, native, counts and full. Expected failures are intentional
negative controls, each rejected for its stated mathematical or dependency reason.

- Strict Lean builds passed the full public theorem, native exporter and audit.
- The foundation audit checked **9,259 roots and 58,974 dependencies**, allowing
  only `propext`, `Classical.choice` and `Quot.sound`. All three deliberate forbidden
  dependency controls failed as intended; all five false state-count contracts
  were rejected by the kernel.
- The native exporter compared both symbols at every actual machine state with
  the proved numeric image. The independent Python recipe checked all **4,823,486
  rows**: 3,675,882 prefix rows and 1,147,604 body rows.
- The complete 1,837,941-step initializer replay, exact tape and blank frame,
  six generic edge cases, all **202,100 source cases**, and all 40,461 return
  inverse checks passed. Native probes numbered 80,866, covering 80,854 distinct
  state/symbol pairs in addition to the full transition streams.
- All **27 deliberate corruptions** were rejected after positive controls,
  including missing/duplicated/misranked returns, wrong return writes and targets,
  omitted states, initializer/head errors, missing halt, ordering and truncation.
- Prior M2–M7, shared-runtime and terminal-specialization regressions passed.

## Retained artifacts

The official artifact, logs, API metadata, archive inventory and exact unpacked
files are in `evidence/final/`. Earlier failed proof/export checks remain in their
dated iteration directories; they are not successful machine evidence.

| Complete actual stream | Bytes | SHA-256 |
| --- | ---: | --- |
| `prefix-rows.bin` | 22,055,292 | `4bc44375eca63e9ce739f000ccf9bfee4b41fcb138bf3102753fb59cd78511f1` |
| `body-rows.jsonl` | 30,506,628 | `d2afbf1c0abe1afb0008029680c5bc52b41f2dc21718a88d16b7aecd06becb0a` |

The prefix keeps six-byte little-endian records `<BBI>`: write bit, direction
(`0` left, `1` right), destination; state/symbol order is implicit. Body JSONL
records carry their state and scanned symbol explicitly. The official artifact
ZIP SHA-256 is `a493ccbc794bdbfce0b879d1e0cb0767f53ccba3e39bf98bfd453357f8344c10`;
the log ZIP SHA-256 is
`add1273208ccbc7c58a9da2482db34fc5a70fbb5613f63e756643b334b160cab`.

The independent model advisory is retained in `review/REPORT.md` and `report.json`.
The external `review/seal.json` binds that narrative, report, checker, exact source,
official APIs, archive and logs. Parent replay passed **41 metadata corruption
controls**, followed by a copied-checker/changed-working-directory portability
check. Actual command receipts are `evidence/parent-replay.json` and
`parent-portability.json`. The prior accepted baseline's sealed replay also passed.
This seal is an integrity boundary for reviewed evidence, not a GitHub signature,
human approval or separate formal proof. Formal verification is the remote kernel.

All substantive computation ran remotely. Local evidence retention and replay
inspect saved metadata and hashes only. Outreach remains on hold. The active goal
continues after this round; see `NEXT-INITIALIZER.md` for the next source-backed
route, which has not yet been implemented or certified.
