# Complete chess machine: 2,904,623 states

The full two-symbol, blank-tape machine has **2,904,623 states**, down from
4,742,562: **1,837,939 states saved**, approximately 38.8% of the complete machine.
The initializer falls from 3,675,880 to **1,837,941** states. The entire accepted
1,066,682-state chess body is unchanged.

## Every state

| Actual allocated controls | States |
|---|---:|
| Reverse initializer: one leftward write per frozen input bit | 1,837,940 |
| Initializer: final preserving rightward step | 1 |
| Body main controls: 533,340 node/store pairs plus one shared halt | 533,341 |
| Body binary bounce/return controls | 533,341 |
| **Complete machine** | **2,904,623** |

The body retains all 106,668 meaningful graph nodes, five stores per node, dispatch
and continuation behavior, binary movements and missing halting transitions.
There are zero padding nodes and zero restoration controls in the new initializer.
The shared halt is included in the main-control row; it is not an additional free
state. The bounce controls include the shared halt's bounce. The two saved receipt
fields `initializer_write_controls` and `initializer_reverse_write_controls` are
aliases for the same 1,837,940 controls and must not be added together.

All full-machine state numbers lie in `[0,2904623)`. The initializer occupies
`[0,1837941)`; the body occupies `[1837941,2904623)`. Body entry is state 1,837,941.
The two missing main-halt rows are at state 1,837,942; the corresponding bounce
state is 2,371,283. No preloaded tape or external oracle is used. All dispatch,
return and movement controls are included in the count.

## Certified statement

The new public machine is
`ConjectureMachines.Machines.chess_field_reverse : Machine 2904623 2`.
The Lean theorem
`ConjectureMachines.Semantics.ChessFieldReverse.halts_iff_not_draw` proves:

```text
Halts chess_field_reverse ↔
  ¬(Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss)
```

`Chess.Optimisation.FieldReverse.equivalent` proves halting equivalence with the
complete accepted `FieldPacked.machine`. Both directions hold. `generated_states`,
`saved_states` and `strict_reduction` prove the exact full count and reduction.
`initialises` proves the exact finite startup from state zero on blank tape.
`rowMachine_eq` identifies the actual machine with its numeric row presentation.
The frozen schedule embedding preserves prefix/body transitions and missing rows
universally. Finite fixtures supplement these proofs; they do not replace them.

The input and body are aliases of `FieldPacked.bits` and `FieldPacked.body`.
The reverse schedule uses the already verified `OpenEvolveWide.schedule` and
`ReverseInit.Schedule` machinery. The source program, chess rules, codec, input,
compiler body and toolchain remain fixed under `baseline-pins.json`, which pins
all 2,550 files tracked before this campaign. No chess conjecture or new axiom is
used as a premise. This result does not determine whether chess is drawn or whether
this machine actually halts.

The tape qualification matters: with physical starting head zero and
`n = 1,837,940`, the input is written at `[1-n,0]`. After the paid final right step,
the physical head is **−1,837,939**, not its original coordinate zero. The tape
zipper is nevertheless exactly `Tape.mk₁ bits.toList`, with blank exterior; the
formal tape has no additional distinguished physical origin. This exact equality
is the body theorem's premise. Both native and independent replays also retain
and check the physical coordinate and frame `[-1837940,1]`.

## Remote verification and exact evidence

The complete focused run
[39770155131](https://github.com/bocowgill/cryptids/actions/runs/39770155131)
completed successfully on 2026-10-22 at computation commit
`9d51a19a9a098d17d48a6f37ba1afe96080c80ce`. It used the pinned Lean/mathlib
4.35.0-rc4 toolchain and strict `lake --wfail` builds. The official logs, artifact,
API metadata, 43-member artifact inventory and exact unpacked bytes are retained
in `evidence/current/`. All seven phase receipts passed: machine, contracts,
native, fixtures, regressions, counts and full. There are 26 distinct standalone
command receipts and 39 command entries across the nested phase receipts.

- The native exporter evaluated **both symbols at every actual initializer and
  body state**, comparing the actual machine with its numeric Lean row machine.
  The independent Python recipe checked all **5,809,246** emitted rows: 3,675,882
  prefix rows and 2,133,364 body rows, including exact order, destinations, missing
  transitions, byte counts and hashes.
- The full **1,837,941-step** initializer replay passed. It reproduced all
  1,837,940 frozen bits and all 141,380 source cells, with the exact normalized
  tape, physical endpoint and blank exterior. Six actual generic edge cases
  passed: empty, singleton zero/one, leading zero, trailing zero and mixed input.
- All **202,100 source cases** passed, covering all 4,042 labels, five stores,
  two scanned markers and five active-field values. There were 80,866 native
  probes, representing 80,854 distinct state/symbol pairs, in addition to the
  complete row streams. Both shared-halt paths were checked on both symbols.
- All **16 intentional native corruptions** were rejected after positive
  controls. The frame mutation failed at getter comparison at node 391; it did
  not reach a later source-case check. The physical-head-zero mutation failed
  at initialization. The saved receipts preserve each actual rejection stage.
- The foundation audit passed **9,093 roots and 58,758 dependencies**, permitting
  only `propext`, `Classical.choice` and `Quot.sound`. It rejected each deliberate
  sorry, open-chess-conjecture and proof-generator dependency. Six false kernel
  contracts failed for their intended mathematical reasons, rather than missing
  imports, warnings or timeouts.
- Existing rule, game evaluation, compiler, shared-runtime, M7 quotient and
  terminal-specialization regressions passed remotely. The prior accepted
  packed-machine evidence is replayed separately as saved metadata.

| Retained actual transition stream | Bytes | SHA-256 |
|---|---:|---|
| `prefix-rows.bin` | 22,055,292 | `4bc44375eca63e9ce739f000ccf9bfee4b41fcb138bf3102753fb59cd78511f1` |
| `body-rows.jsonl` | 57,122,148 | `64337bda276a0b178e29318f7d7023b504adee4a1c1438465b416130cb111b65` |

The prefix records use fixed six-byte little-endian `<BBI` encoding: write bit,
direction (`0` left, `1` right), and destination. State/bit are implicit in
state-major, bit-zero-first order. Body JSONL records carry explicit state/bit.
The unchanged body receives new numeric addresses because the prefix is shorter;
its newly exported JSONL therefore has a different hash despite identical body
semantics. `machine-export.json` is the native payload; `machine.json` is a
separate strict-build phase receipt.

The official artifact ZIP SHA-256 is
`af9be877f50483ad27d6b82172853a2cb9a5cd62c9fb378aface0eee54355295`;
the official log ZIP SHA-256 is
`d3b2078b1a62a5c3b099970d1056e86848d3e53576d65bfeafa0df8bc0e3387b`.
The retained history includes the successful initial machine-only proof run and
the first full run's strict line-length failure. That failed run is not acceptance;
the single string-formatting repair was checked by the final successful full run.

## Review and handoff boundary

The independent advisory and exact construction binding are retained in
`evidence/review/`, with a seal covering the checker, report, receipt and binding.
The parent replay in `evidence/parent-replay.json` records a positive check, six
individual tampering controls, self-test, copied-directory portability, prior
packed-evidence replay and frozen-source metadata check. These local checks read
saved metadata and hashes only; they never re-run a proof, model, machine count,
simulation or fixture. A self-seal is an integrity check against the reviewed
snapshot, not a GitHub signature, human approval or independent formal proof.
The review is an independent model advisory; the remote Lean kernel supplies
the formal verification.

All 15 campaign acceptance gates are met: eight integration gates, two source
gates, three native-evidence gates and two independent-review gates. Both work
waves are complete and all leaf ownership leases have been released.

All substantive Lean/Lake/LSP/LeanProbe, native compilation/execution, simulation,
fixtures and machine counting stayed remote. No previously tracked file was
modified. Outreach remains on hold. No subsequent optimization campaign was
started. See `RESUME.md` for the reproducible checkpoint.
