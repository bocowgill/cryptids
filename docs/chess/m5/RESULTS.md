# M5 results

M5 completes the verified compilation backend and four explicit finite-game machines.
The implementation is `b3f5e29eebcb96ebdebf08ebf746a0dbae01a140`, based on completed M4
`62d8f4df9d1c4fcd0613ca7b4c994fae4df0f501`. The toolchain remains
`leanprover/lean4:v4.35.0-rc4` with the original dependency manifest.

## Delivered artifacts

| Game | Minimax value | Post states | Binary states | Independent trace |
|---|---|---:|---:|---|
| White chooses between Black win and White win | White win | 24,949 | 49,910 | Halts after 1,994 transitions |
| Black chooses between White win and Black win | Black win | 24,949 | 49,910 | Halts after 1,994 transitions |
| White chooses between Black win and draw | Draw | 24,949 | 49,910 | Bounce loop reached after 1,991 transitions |
| White-winning leaf refuted by Black choosing draw | Draw | 29,413 | 58,838 | Bounce loop reached after 3,739 transitions |

Tables and canonical hashes are in [the construction manifest](../../../artifacts/chess_m5/manifest.json).
Each table starts in state zero on an all-zero tape. A missing transition halts, without
an extra halt state. Counts include the interpreter, game-data initialization, wrapper,
Post write bounce states and six-bit bottom-marker initializer. The count is
`2 * Post states + 2 * input bits`; every input bit contributes two states.

These are small-game counts. They are not an estimate or a bound for the full chess machine.

## Proof guide

The finite-control multi-stack source language has unbounded stacks and a finite store.
The arithmetic/list/fixpoint adequacy theorem is `Adequacy.compileClosedCode_halts`.
Except for `Chess.Compilation`, names below lie under `ConjectureMachines.Compilation`.
The actual game interpreter has these proof links:

1. `Chess.Compilation.gameProgram_halts_iff` proves halting iff non-draw for every finite tree;
   `serialize_stack_effect` handles arbitrary residual input, stack and store.
2. `fastStack_halts` lowers supported stack programs to finite binary Post control, including the stack/tape simulation, normalization, block encoding and numbering.
3. `Binary.compile_halts_input` converts Post actions to binary write/move transitions.
4. `Init.initialise_reaches` and `initialise_halts` discharge all blank-tape initialization.
5. `Examples.generated_halts` composes both directions for every finite tree.
6. `Examples.{white,black,draw,refutation}_literal_correct` proves the equivalence for
   each exact published table independently of native generator correctness.

`Tables` kernel-checks every literal tree's cache validity, row count and height 16.
`Balanced.ofTree_eq_ofRows` proves exact equality with the ordinary flattened row-list
machine at every state and symbol. Halting certificates use finite kernel executions;
the two nonhalting certificates use checked prefixes and total closed state sets,
valid for unbounded time and arbitrary tapes. Bounded Python traces supplement those proofs.
Malformed source data loops, and `unbounded_live_value_stack` exhibits arbitrarily large
reachable value stacks. Neither a fixed tape bound nor a favorable winning line is assumed.

The generic compilation theorem is formal. Native regeneration and exact byte comparisons
establish artifact provenance; the native compiler's execution is not assumed correct in a
Lean proof. The literal fixture claims have independent kernel certificates. M6 must prove
the actual M4-to-source translation and its full linkage to the published chess table.

## Verification

```sh
ELAN_NO_UPDATE_CHECK=1 python3 scripts/verify_chess_m5.py
ELAN_NO_UPDATE_CHECK=1 python3 scripts/verify_chess_m5.py --baseline
```

The native generator can also be built with
`lake -f lakefile.chess-m5.toml build chess_m5_generate`. This separate configuration is
checked to be the pinned standard Lake file plus exactly the generator executable stanza.
The original `lakefile.toml` remains byte-identical to the M1 freeze.

Observed results:

- Focused compilation: no warnings; all four literal proof certificates freshly elaborated.
- M5 audit: 68,567 safe declarations, 78,005 dependencies, only `propext`,
  `Quot.sound`, and `Classical.choice`. 33 compiler recursion artifacts are
  inventoried outside the safe roots; none is exempted from dependency traversal.
- Four independently elaborated standalone targets match 70,415 transitive declarations
  in separate environments. The challenge imports Mathlib only.
- All four native regenerations and independent literal-row exports match the canonical bytes.
- Sixteen source runtime assertions and all four independent literal traces pass.
- Negative controls reject eight proof-escape tokens, three forbidden audit dependencies,
  five malformed serializations, one out-of-range destination in the kernel, and both an
  altered target proposition and a valid changed transition behind the original target names.
- M1's 385 retained declarations and 2,728 dependencies still match the pinned archive, including
  the semantic mutation rejection. M2's 164 assertions and 22 perft counts across 7 positions,
  M3's 55 assertions and M4's 21 assertions pass with their original audits and controls.
- The default build passes with only the 22 existing `Challenge.lean` placeholder warnings.
  M1–M4 mathematical/computational inputs are unchanged. Only the root aggregate and CI
  workflow have reviewed additive integration changes; exact removal recovers M4's hashes.

The existing `python3 verify.py` repository checks also pass. The older
`lake comparator --config comparator/all.json` cannot run on macOS because it requires
`bwrap` and Linux namespaces; it is not reported as locally passed. The fork's
[Linux CI run](https://github.com/bocowgill/cryptids/actions/runs/39380457555) is running
against the implementation commit. Its broader sandbox-comparator result is pending,
separate from the completed M5 standalone target comparison above.

[results.json](results.json) retains verification inputs, artifact hashes, observed outputs,
negative-control inventory and baseline outputs. [GATES.md](GATES.md) maps them to acceptance
criteria. [DESIGN.md](DESIGN.md) and component notes explain the implementation and tradeoffs.

M6/M7 and outreach remain unstarted. The next milestone is translating the actual M4 chess
evaluator, rule procedures and initial data into this backend, proving refinement and
producing the first full-chess table. M5 does not determine the value of chess.
