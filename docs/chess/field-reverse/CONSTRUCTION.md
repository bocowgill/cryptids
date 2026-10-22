# A paid reverse initializer for the complete chess machine

The original initializer uses one rightward write state per input bit, followed
by one leftward restoration state per bit. For n bits this costs 2n states.
The existing verified reverse writer instead writes the last bit first, moving
left after each write. After all n writes it pays one final rightward move onto
the first input bit. The cost is n+1, including that final move.

This campaign instantiates that existing generic theorem on exactly the accepted
`FieldPacked.bits` and `FieldPacked.body`. It introduces no new input, body codec,
source operation, graph node, game rule, or chess assumption. All 2,550 previously
tracked files are pinned and unchanged.

## Tape and entry fidelity

After the n writes the head is on a blank cell immediately left of the new input.
The last rightward move enters its first bit. In absolute coordinates measured
from the initially blank head, the input occupies [1-n,0] and the final head is
1-n. The physical head is not restored to its original coordinate.

The formal Turing tape is a zipper of the cells to the head's left and right.
It has no extra distinguished absolute origin. `ReverseInit.reverse_correct`
proves that the resulting zipper is exactly `Tape.mk₁ bits`: the original input
in the original order with blank cells on its left and beyond its end. This is
an equality in the same tape type used by the frozen body theorem, rather than
an unproved translation premise. The native and independent replay retain the
physical coordinate separately and check the same normalized tape and exterior.

The empty-input case still pays the final rightward state. That move changes
physical position on an entirely blank tape but leaves its zipper unchanged.
Singleton, leading-zero and trailing-zero cases follow the same generic theorem.

## Full theorem composition

`OpenEvolveWide.schedule` is an existing array implementation of the reversed
leftward writes followed by one preserving rightward instruction.
`schedule_size` proves n+1; `schedule_correct` proves its exact tape result.
`ReverseInit.Schedule.initialise` embeds the unchanged body after that prefix.
Its universal prefix/body transition theorems account for both scanned symbols,
all body destinations and missing transitions. Its halting theorem proves both
directions after the finite paid startup run.

The new `FieldReverse` module composes those theorems with the accepted
`FieldPacked.body_halts_input`. The state-count cast preserves every transition
and halting. `initialises` states the exact finite run from state zero on blank
tape to the paid body entry with the exact frozen input. `equivalent` connects
the resulting complete machine directly to `FieldPacked.machine`.

The numeric Lean row machine uses the same certified schedule and the accepted
separate arithmetic body recipe. `rowMachine_eq` proves universal equality with
the actual machine. The Python prefix recipe independently derives each reversed
write and the final preserving right move from the literal bits, without reading
an action array. Finite row tests supplement the universal Lean proof.

## Complete accounting and validation

The kernel has checked the complete count of 2,904,623 states:
1,066,682 body controls plus 1,837,940 leftward write controls plus one final
rightward control. The saving from 4,742,562 is 1,837,939 states. The body retains
all five stores, shared halt, binary main controls and binary return controls.
No preloaded tape, dispatch helper or restoration action is free.

Remote independent validation passed on the same source as the strict build.
The native exporter reads every initializer and body state on both symbols and
compares actual and numeric Lean rows before emission. Prefix records are six
bytes each: write u8, direction u8 (left0/right1), destination u32 little-endian.
The state and scanned bit are implicit in state-major, bit0-before-bit1 order.
Body records retain explicit numeric states and bits in JSONL.

Python checks both complete streams against its independent recipe, including
all destination bounds and exact coverage. It re-encodes the actual source cells,
replays every initializer step with negative physical coordinates, verifies six
small actual generic-schedule edge runs, and checks the original 202,100 source
cases. Sixteen mutations target source dispatch/store/frame, input/tape/head,
counts, packed offsets, body rows, prefix writes/directions/final turn and both
stream truncations. Expected failures must identify their actual rejection stage.

All proof checking, compilation, native execution, simulation, fixtures and state
counting run remotely. Local evidence replay reads saved metadata and hashes only.
The exact counts, remote run, evidence boundary and advisory are recorded in
RESULTS.md. Outreach remains on hold.
