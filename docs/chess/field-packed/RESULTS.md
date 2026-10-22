# Complete padding-free chess machine

The complete machine has **4,742,562 states and two symbols**, starting in state
zero on a blank tape. This removes **40,323,400 states** from the accepted
45,065,962-state machine, about **89.5%**, by eliminating unused graph padding.

The original target is unchanged:

```lean
ConjectureMachines.Machines.chess_field_packed : Machine 4742562 2

ConjectureMachines.Semantics.ChessFieldPacked.halts_iff_not_draw :
  Halts ConjectureMachines.Machines.chess_field_packed ↔
    ¬(Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss)
```

The theorem does not determine chess's value. `FieldPacked.equivalent` also proves
halting equivalence with the previous complete `FieldAware.machine`.

## Every state charged

| Component | States |
|---|---:|
| Every actual graph node at all five stores | 533,340 |
| Shared halt | 1 |
| Complete Post controls | 533,341 |
| Binary main controls | 533,341 |
| Binary return controls | 533,341 |
| Complete binary body | **1,066,682** |
| Initializer writes | 1,837,940 |
| Initializer head restoration | 1,837,940 |
| Complete paid initializer | **3,675,880** |
| Complete binary blank-tape machine | **4,742,562** |

Post controls and binary components are successive representations; the complete
machine total is the binary body plus the initializer. Dispatch lives in the
retained syntax and tables. Every store, shared halt and binary return control is
included. No preloaded tape or external input is free.

The old allocation contained 4,139,008 graph slots: 106,668 actual nodes and
4,032,340 padding slots. The new graph contains exactly the 106,668 actual nodes.
Removing each padding slot saves five store controls in both binary blocks,
giving the certified saving of 40,323,400 states. No source row, meaningful syntax
node or operation was removed.

## Proof and remote validation

Official complete run:
[39727629533](https://github.com/bocowgill/cryptids/actions/runs/39727629533),
computation commit `7c43454a01201ea122f9769ec751c0582aacc692`.
The retained packet is `evidence/current/`. Its nine phases all passed:
graph, layout, machine, contracts, native, fixtures, regressions, counts and full.
It contains 30 exact command receipts and 48 artifact entries.

- Strict Lean builds checked the exact actual-slot bijection, both inverse laws,
  child/entry correspondence, universal syntax meaning, prefix/index arithmetic,
  complete halting theorem, paid initialization, numeric row correspondence and
  exact count. Warnings were fatal on the pinned 4.35.0-rc4 toolchain.
- The foundation audit checked 9,007 roots and 56,666 dependencies. Only
  `propext`, `Classical.choice` and `Quot.sound` were permitted. The open chess
  conjecture, a forbidden axiom and a proof-generator dependency were rejected
  by their deliberate negative controls.
- Six deliberately false kernel contracts failed for their mathematical reasons,
  including the incorrect old padded-node count and an unpaid initializer.
- The native exporter checked every allocated body state on both symbols against
  the arithmetic Lean row machine. Python independently reconstructed addresses
  and transitions and checked all **2,133,364 rows**, including the exact two
  missing shared-halt rows. No body-state sampling substitutes for this coverage.
- Native and independent replay checked all **3,675,880 initializer steps**, the
  restored head, complete input tape and body entry. The unchanged input is
  **1,837,940 bits**, representing **141,380 source cells**.
- All **202,100 source-operation cases** passed, covering every one of 4,042 rows
  at five stores, both marker values and five active-field values. Positive cases
  compare the complete sparse tape, head, store and continuation. There are also
  80,866 actual boundary/native probes, including shared-halt main and return
  controls on both symbols.
- All eleven mutations were rejected: dispatch, store, movement/frame,
  initializer, undercount, packed offset, body write, body return, inserted halt
  transition, row order and truncated stream. The movement/frame mutation was
  rejected by an actual-getter mismatch at node 391; it is not described as an
  observed tape-corruption or head-restoration failure.
- Existing regressions passed unchanged: M2 rules (164 assertions), M3 (55),
  M4 (21), M5 (16), M6 shared/paired, M7 quotient and terminal binary fixtures.

The complete body stream is `evidence/current/unpacked/body-rows.jsonl`:
57,122,148 bytes, SHA-256
`e6a41fd68a3ae6d435273dfd5d489fce140d837159b128c533bd5ca02ba31f89`.
It uses absolute state addresses, ascending state order and bit 0 before bit 1.
`machine-export.json` is the native payload; `machine.json` remains the separate
machine-proof receipt.

Finite implementation checks supplement the universal Lean theorems. They do not
prove an unbounded theorem by themselves. The fresh complete-candidate model
advisory found no fatal error or missing premise. Its sealed report/checker are
in `evidence/review/`; this advisory is neither human approval nor an additional
kernel proof.

The parent promoted those six files byte-for-byte and independently passed the
positive checker, self-test, all six individual evidence-tampering controls,
copied-directory replay, prior accepted checker and frozen-file check. Exact
commands, exits and output hashes are saved in `evidence/parent-replay.json`.
Campaign acceptance: **17 gates met, 0 unmet, 0 abandoned**.

## Preservation and reproduction

All 2,393 previously tracked files are pinned and unchanged, including the frozen
specification, previous machines, prior evidence, ROADMAP and toolchain. The
earlier complete compiler's independent saved-evidence checker also still passes.
All Lean checking, compilation, native execution, simulation and machine counting
ran remotely. No outreach occurred.

Seven development packets remain in `evidence/history/`, with their actual
dispositions. The first complete theorem run passed the construction but stopped
at a false-contract recursion limit; it is retained as failed development evidence.
The final contract uses the accepted node-count theorem and fails because
`106668 = 4139008` is false. Later documentation/evidence commits do not replace
the computation commit above.

See [CONSTRUCTION.md](CONSTRUCTION.md) for the mathematical mechanism. The
metadata-only evidence checker and its seal live under `evidence/review/`.
The remote reproduction command is:

```sh
CHESS_REMOTE=1 python3 scripts/chess_field_packed/verify.py --target full
```

Run that command only on a remote runner with the pinned dependencies. Local
replay uses the sealed saved-evidence checker; it performs no machine evaluation.
