# Boundary corrected; full candidate counted at 609,247 states

The diagnosis and corrected validation both passed on the existing free remote
runner. The full emitted candidate contains **609,247 states**, **160,097 fewer**
than the accepted 769,344-state machine, a 20.8% experimental reduction. All new
controls are paid. This is a fully counted, finite-tested candidate, **not a new
certified chess cryptid**. The accepted machine remains 769,344, and accepted
savings from Parsimony remain zero. No Lean certification or outreach began.

## Diagnosis and correction

[Diagnosis run 40138030294](https://github.com/bocowgill/cryptids/actions/runs/40138030294)
used producer `d72ac3da4dbf747d35e598a92d165ebc64d09105`. Both independent engines
reproduced the prior fixture, with head 33 after 3,725 steps, exact payload and
blank exterior. The original oracle assumed head 34. The saved trace confirmed
that the upstream output begins at absolute cell zero. See [DIAGNOSIS.md](DIAGNOSIS.md).

The targeted fix changes the expected packet origin from `marker_bits + 2` to
`marker_bits + 1`. It changes no emitted transition. Validation checksum-compared
the complete packet-printer table against the retained failed producer and
confirmed byte identity. The tape, exterior and head requirements remain intact;
the correction is supported by the independently measured boundary. Positive
control results are now saved before assertions to prevent another lost diagnosis.

## Completed executable checks

[Validation run 40138445160](https://github.com/bocowgill/cryptids/actions/runs/40138445160)
used producer `367b2fbebbd8b86a9e4a4b03e83832d680c0255a` and completed with exit
zero and all required success tokens. It established:

- Every accepted/frozen pin and the exact 173,641-bit packet remained unchanged.
- All 256 eight-bit payloads and five wider fixtures passed independent Python
  and native C++ step engines. They agreed on every nonblank cell, blank exterior,
  entry head, boundary control, and exact step count.
- A valid adapter positive control passed. Actual transition mutations introducing
  a dirty separator, wrong entry head and unerased sentinel were rejected by the
  same exact-boundary oracle. Actual data-chain and data-target corruptions were
  independently rejected.
- The entire framed packet, including all exact original packet bits and three
  zero padding bits, was reconstructed from the emitted transition targets.
  The exact packet satisfies the required absence of 32 consecutive ones.
- The complete candidate transition table was emitted. Every retained transition
  was checked after inverse relocation; a roundtrip suffix checksum matched.
  No retained target returns to the removed writer. The new prefix has exactly
  one edge into retained decoder state zero and no premature halting transition.
- Independent Python and C++ readers counted all **1,218,494 transition cells**
  in **7,310,964 bytes**, with **609,247 states**, maximum target 609,246, and two
  retained missing transition cells. The native census rejected actual full-table
  files with an invalid target and a truncated record.

These checks do not prove arbitrary-size printer correctness or full chess
halting equivalence. The full packet ordinary-step probe hit its predeclared
**500,000,000-step cap** after 3.001 seconds, without reaching the decoder. Its
retained state was 13,462, head 518, and it had 4,075 nonblank cells. This is an
**incomplete startup**, not an error or a successful full execution. No full-game
startup was simulated. No full-startup runtime estimate is justified by this pilot.

## Complete allocation

| Component | States |
| --- | ---: |
| Parsimony data controls, including data-out | 13,361 |
| Extractor | 140 |
| Preamble and epilogue | 6 |
| Right-sentinel cleanup | 3 |
| Nondestructive marker scanner | 32 |
| Marker erasure and direct decoder connection | 2 |
| Nonhalting error trap | 1 |
| **Replacement printer subtotal** | **13,545** |
| Retained table decoder | 21,682 |
| Retained decoder bridge | 1 |
| Retained seed expander | 216 |
| Retained expander bridge | 1 |
| Retained interpreter main | 533,341 |
| Retained interpreter returns | 40,461 |
| **Retained suffix subtotal** | **595,702** |
| **Complete emitted candidate** | **609,247** |

The standalone test table's boundary represents the already counted first
decoder state. It is excluded from the new printer subtotal. There is no other
unpaid dispatch, return, error or bridge state. No graph padding was added.
The old writer used 173,642 states, so its replacement saves 160,097 states.
The old uncertified 310,029-state body-quotient design is not combined with this
candidate or treated as accepted evidence.

Full candidate SHA-256:
`b9cf384e5470f3c9f5c501bd8c13555f15d4ea134469f5d159cd1bdb363cbf45`.
Inverse-relocated retained suffix SHA-256:
`ea1f58425d93f3fb1ce5aa17d6a5f62fb78f70e6291b33b177fd72ec668ccb31`.
The actual full table is retained in
`../evidence/validation-04/unpacked/full-candidate-rows.bin`.

## Resource use and recovery

The diagnosis took 5.352 driver seconds; corrected validation took **27.746**.
Both remained within the fixed budgets. Validation driver peak RSS was 329,804
KiB (about 322 MiB), below its 512 MiB cap. Its largest sampled group-plus-driver
RSS during a child stage was 187,932,672 bytes; this sample does not cover the
temporary pure-Python serialization peak. Neither run hit a memory/time limit;
no limits were raised. Compilation, simulation, generation and counting stayed
remote. Local work was text/provenance inspection, editing and artifact transport.

All artifacts, including full and corrupted row files, fixture tapes, exact
commands, source manifests and logs, are retained under `../evidence/diagnosis-03`
and `../evidence/validation-04`. GitHub artifact digests and exact committed
producer sources were verified. Validation artifact SHA-256 is
`f170d146c3cefb89a2a8337197048ee5f117d14ceb786f60d43c336b541b4779`;
workflow logs SHA-256 is
`84116034824ffcb36f2c6cdaaab785e683e3189863a1e67b41496969c8c259a7`.
The optional third corrective run was unnecessary and was not launched.

## Decision before certification

**Continue to a separately authorized structural certification phase.** The
boundary failure is diagnosed and corrected, the finite tests pass, the full
allocation is concrete, and a 160,097-state reduction is large enough to pursue.
Passing this phase removes the executable validation obstruction; it does not
establish the mathematical printer theorem.

That phase should prove a generic introspective-printer invariant and termination
argument: target-encoded words, unary extraction, binary counter, framing and
marker erasure, exact relative tape/head, and exclusion of error or premature
halting. Instantiate it on the exact packet. Prove relocation and direct linking
for this actual emitted table, preserving the paid 13,545 + 595,702 allocation,
then compose with the pinned `FieldTableSeed.linked_halts_input` theorem to obtain
both directions of `Halts(M) iff NOT(WhiteCanAvoidLoss AND BlackCanAvoidLoss)`.
Any extra state introduced by formal packaging must be counted again. Run strict
remote Lean checks and the existing foundation/regression audits before accepting
a new size. Do not replace those obligations by enormous full-startup evaluation.

Certification cost is still uncertain. First test a reusable structural proof
kernel on a small instance, then demonstrate scaling to the exact data layout;
avoid repeated full-table normalization, the obstruction in the earlier body
quotient campaign. No certification work is launched in this checkpoint.

All five gates for this bounded follow-up are met: diagnosis, fixtures, full
census, honest resource/proof-status accounting, and pushed recovery checkpoint.
There are zero unmet or abandoned follow-up gates. The original failed pilot's
separate ledger and historical failures remain retained unchanged.
