# Accepted complete structured-initializer chess machine

The accepted binary blank-tape machine now has **769,344 states**, saving
**228,832 states** from the previous 998,176-state machine. The public machine is
`ConjectureMachines.Machines.chess_table_seed`; its Lean theorem
`ConjectureMachines.Semantics.ChessTableSeed.halts_iff_not_draw` proves

`Halts M ↔ ¬(Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss)`.

This does not determine chess's value or establish minimality. The frozen chess
specification and every accepted predecessor remain unchanged.

## Complete paid allocation

| Component | States |
|---|---:|
| Structured packet writer, including final turn | 173,642 |
| Complete structured decoder | 21,682 |
| New decoder bridge | 1 |
| Retained seed expander | 216 |
| Retained expander bridge | 1 |
| Interpreter main controls | 533,341 |
| Interpreter return controls | 40,461 |
| **Full machine** | **769,344** |

The packet contains 173,641 bits. The decoder reconstructs the exact accepted
424,156-bit seed, which reconstructs the exact original 1,837,940-bit field input.
Universal Lean proofs preserve the entire tape and head, both halting directions,
and every paid control. Exact source correspondence covers all 5,952 original rows
and 141,380 symbols. No complete quadratic chess startup was simulated.

## Verification and retained evidence

The final official remote run is 39830779431, computation/workflow commit
`1c8334adb8fa63f9f8450b2d8ea08bb5f01eeb85`, artifact 12447959670. Its complete
provenance, archives and unpacked receipts are retained in `evidence/final/`.

All 20 commands and five cumulative phases passed their intended outcomes:
strict public/native build; safe foundation audit of 10,773 roots and 60,793 dependencies
using only `propext`, `Classical.choice` and `Quot.sound`; three intended forbidden
foundation failures and five false kernel count/saving failures; all 1,538,688
actual state/symbol rows, including two missing transitions; independent full
input and row reconstruction; paid writer; 14 native and 20 independent complete startup
executions; 37 targeted corruption controls; and prior M2–M7/terminal regressions.
The corrected fixture counter records 555,567 simulated steps. Timeouts never count
as successful corruption rejection. The row stream occupies 9,232,128 bytes with
SHA-256 `29989c45b9281c91f33349b23610a7e335a9e352f6647f10fedd61cb4497d086`.

Fresh independent review passed with no unresolved findings. Its sole source
finding—ten omitted boundary-step budget charges—was repaired before the final
run. The earlier successful diagnostic full01 remains retained separately.
The reviewed advisory/narrative, coordinator seal and parent replay receipts are
in `evidence/review/`. Positive replay, **52 hostile metadata controls**, and a
fresh-directory portability replay all passed. These local checks inspected only
saved metadata and hashes; all proofs, native generation, mathematical counting,
fixtures and simulation ran remotely.

The checker SHA-256 is
`86e414ccf7b9931fdccd1b8417fc2e5b27154c6faa5557b5dceb16b11e196a82`;
seal SHA-256 is
`29579084f3691e6ab8dd9c6447df7fb70abcb858994b7c9c23b04687c3d6d8c4`.
All 57 computation source hashes and 2,983 previously frozen files matched.
Saved GitHub APIs and the external reviewed seal are explicit provenance trust
anchors; local replay is not independent authentication of GitHub.

## Campaign progress and remaining opportunity

Accepted cumulative saving during this goal is **2,135,279 states** from 2,904,623.
Round 01 saved 492,880; round 02 saved 1,413,567; this round saves 228,832.

The body quotient remains a separate experimental 459,315-state opportunity.
If completely certified and linked to this accepted initializer, its prospective
full count is 310,029. No actual-body quotient row has yet been kernel-certified;
the packed-Nat pilot is still running. Its estimates are not accepted savings.
The live `../RESUME.md` records that work and the user's 20:15 UTC wind-down deadline.
