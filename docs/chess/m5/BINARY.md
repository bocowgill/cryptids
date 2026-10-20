# Finite Bool Post-machine bridge

The checked implementation is `Cryptids/Compilation/Binary.lean`, in namespace
`ConjectureMachines.Compilation.Binary`. Its input is any
`Turing.TM0.Machine Bool (Fin q)` with `[NeZero q]`; its output is
`ConjectureMachines.Machine (q + q) 2`. The source uses the canonical `Fin q`
inhabitant, state `0`. The compiler is an ordinary executable Lean definition.

## State and symbol conventions

There are exactly `2 * q` states, proved by `compile_state_count`. The target type is
literally `Fin (q + q)`, including any unused return states. No additional halting
state is required: a missing transition is the halting condition in both models.

| Source/control purpose | Target state value |
| --- | --- |
| Source state `i`, at a source-step boundary | `mainState i`, value `i.val` |
| Return from a write whose destination is `j` | `bounceState j`, value `q + j.val` |

`mainState` uses `Fin.castAdd`; `bounceState` uses `Fin.natAdd`. `Fin.addCases`
dispatches over these two exhaustive blocks. `mainState_zero` identifies the
target's initial state with numeric state `0`.

`encodeSymbol : PointedMap Bool (Fin 2)` sends `false` to `0` and `true` to `1`.
`decodeSymbol` is its inverse. `decode_encode` and `encode_decode` prove both
inverse identities. The pointed-map property states that blanks map to blanks.

## Step semantics and tape correspondence

`encodeTape T = T.map encodeSymbol` changes only the cell alphabet. The head,
left/right geometry, and every cell position are preserved. `trCfg` pairs this
tape with the corresponding main state. It is defined for arbitrary source tapes,
including tapes containing data on both sides of the head.

| Source instruction | Target execution |
| --- | --- |
| Missing transition | Missing transition immediately |
| Move left or right to `j` | Preserve the current symbol, move in that direction, enter `mainState j` |
| Write `b` and enter `j` | Write `encodeSymbol b`, move right, enter `bounceState j`; preserve the symbol there, move left, enter `mainState j` |

`compile_step_move` proves the exact one-step move equation.
`compile_step_write` proves the first write step, and `compile_write_return`
proves its exact second step. The return trip neither changes the neighbouring
cell nor loses the newly written symbol. It also works when the written symbol
equals the old symbol, and when the neighbour is blank.

`compile_bounce` gives the transition for every symbol in every return state.
`compile_step_bounce` proves that on every target tape the next configuration is
`some` main-state configuration with the tape moved left. Consequently a return
state cannot halt. `compile_step_main_eq_none_iff` proves that a main state can
halt only on the corresponding missing source transition, even for arbitrary
target tapes.

## Simulation and halting API

`compile_respects` proves Mathlib's actual `StateTransition.Respects` relation
from `TM0.step M` to `step (compile M)`, with correspondence `trCfg a = b`.
A source move has a nonempty target path of length one; a source write has a
nonempty path of length two; a missing source step gives a missing target step.

The proof uses `StateTransition.fun_respects`, then the three instruction cases.
The write case explicitly constructs both target transitions. In particular,
there is no zero-step stuttering case that could hide source divergence.

`compile_eval` is the exact result equation:

```lean
StateTransition.eval (step (compile M)) (trCfg c) =
  trCfg <$> StateTransition.eval (TM0.step M) c
```

`compile_haltsFrom M c` proves both halting directions for every source
configuration `c`:

```lean
(StateTransition.eval (step (compile M)) (trCfg c)).Dom ↔
  (StateTransition.eval (TM0.step M) c).Dom
```

These follow from Mathlib's `tr_eval'` and `tr_eval_dom`, respectively. The latter
includes the reverse simulation argument for deterministic transition systems;
the bridge does not merely infer reverse halting from a one-directional trace.

For a finite Bool input `l`, the target starts from
`⟨0, Tape.mk₁ (l.map encodeSymbol)⟩`.

- `trCfg_init l` proves this initial-configuration equality.
- `compile_halts_init M l` compares the raw configuration evaluation domains.
- `compile_halts_input M l` compares the target domain with `(TM0.eval M l).Dom`.
- `trCfg_blank` identifies the empty-input source configuration with the target
  all-blank `ConjectureMachines.init`.
- `compile_halts_blank M` proves
  `ConjectureMachines.Halts (compile M) ↔ (TM0.eval M []).Dom`.

The arbitrary-input theorem does not itself initialize a nonempty input from an
all-blank machine. A separate verified initializer may use it compositionally.

## Review and verification

The implementation was reread against both underlying `step` definitions and
Mathlib's `Respects`, `tr_eval'`, and `tr_eval_dom` proofs. The defect hunt checked
the two state-block boundaries, default state zero, symbol inverse identities,
the no-write move case, unchanged neighbours during writes, immediate missing
transitions, and the nonempty paths needed for reverse halting preservation.

The focused gate is:

```sh
env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Compilation.Binary
```

LSP axiom checks of `compile`, `compile_eval`, and `compile_haltsFrom` report only
`propext`, `Classical.choice`, and `Quot.sound`, with no suspicious source patterns.
The reproducible environment audit enumerates the module's public and private
declarations, including `compile.match_1`, `compile.match_3`, and generated equation
and splitter helpers, and checks every enumerated declaration's axiom dependencies.
The compiler has no noncomputable runtime path. There are no proof placeholders,
custom axioms, `native_decide`, `unsafe`, `partial`, or external runtime oracles.
Gate output and file fingerprints are recorded under
`.unlazy/chess-m5/leaf-1.1/`.
