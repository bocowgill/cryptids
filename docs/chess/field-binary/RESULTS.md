# Field-aware binary backend pilot results

The complete remote pilot passed on 2026-10-21. Read, constant-write and movement
routines are ordinary two-symbol machines with universally certified execution,
numeric results, terminal controls and tape behavior. **This is a certified routine
pilot; the accepted chess machine remains at 390,491,642 states.**

Successful run:
[39621322042](https://github.com/bocowgill/cryptids/actions/runs/39621322042),
computation commit `aec53614962607635789060f51c4576bdcdc00b0`, on
`bocowgill/cryptids`, branch `codex/chess-openevolve-pilot`. All five remote phase
receipts bind the same eleven computation inputs and 237 unchanged prior files.
The final [independent advisory review](REVIEW.md) and
[root acceptance record](evidence/root-check.json) are separate from the formal
remote receipts. See [results.json](results.json) for machine-readable measurements.

## Complete standalone state counts

The new cell has four three-bit fields at offsets zero, three, six and nine, with
one marker bit at offset twelve. A valid field has five values; raw bit codes five
through seven have an explicit absence decoder. The routine execution proofs
cover every binary tape and all raw codes, not only valid encoded cells.

| Field offset | Read a three-bit word | Write a fixed three-bit word |
|---:|---:|---:|
| 0 | 39 states | 5 states |
| 3 | 66 states | 11 states |
| 6 | 93 states | 17 states |
| 9 | 120 states | 23 states |

Movement to the adjacent thirteen-bit cell uses **14 states** in either direction.
All these counts include terminal controls. Reads return their three-bit result
through eight charged exits. Writes and movement include one exit each. A fixed
write uses the same count for any of the eight raw words. A dispatcher selecting
among write routines is not included or implemented by this pilot.

A read takes `2 * offset + 6` transitions and returns the exact original tape and
head. A constant write takes `2 * offset + 4` transitions and changes exactly the
three target coordinates, restoring the head to the cell boundary. The last write
also moves left, avoiding two additional moves. Cell movement takes thirteen
transitions and preserves every tape bit, with the expected shift of the head.
The exact universal execution theorem uses the routine's semantic step count;
these closed transition counts are independently observed across all fixtures.

## What is certified

[Routine.lean](../../../Cryptids/Compilation/FieldBinary/Routine.lean) implements
the counted finite routine compiler. `run_execute` proves the exact binary-machine
execution on every starting tape; `result_exit` decodes its numeric terminal
state, and `exit_stops` proves that state stops on either scanned symbol.

[Fields.lean](../../../Cryptids/Compilation/FieldBinary/Fields.lean) proves full
read restoration, exact integer-coordinate writes, preservation outside the target
and thirteen-bit movement. [Codec.lean](../../../Cryptids/Compilation/FieldBinary/Codec.lean)
connects these operations to four five-valued cell coordinates and the marker:
valid reads return the selected value, and valid writes preserve the other fields
and marker. The frame theorem also covers neighbouring cells and arbitrary tape
contents outside the field. [Pilot.lean](../../../Cryptids/Compilation/FieldBinary/Pilot.lean)
assembles the actual-machine contracts and kernel-checked state counts.

## Comparison with the accepted generic allocator

The accepted lowering uses a combined 1,250-symbol cell alphabet and eleven-bit
whole-symbol decoding. Its exact allocation formula has the following differences
when one inventory parameter is reduced while every other parameter is held fixed:

| Generic allocation family | Marginal binary body allocation |
|---|---:|
| One fewer reader-family site | 211,410 states |
| One fewer writer-family site | 82,000 states |
| One fewer movement-family site | 110 states |

These are **allocation sensitivities, not standalone baseline routine counts**.
The read and write-bearing families overlap, and the differences are not additive
replacement costs. A reader family includes whole-symbol decoding and per-symbol
continuation work; the candidate reads one coordinate. A constant candidate writer
is not a complete dynamic writer/dispatcher. Consequently, subtracting the new
routine counts from this table would not establish a per-operation or full-machine
saving. The old body's `10 * nodes + 1` allocation is tied to the existing
CompactPost and terminal-return count formula in `legacyBodyAllocation_eq`.

The counts establish a small certified implementation of the desired local
operations. Real interpreter savings require compiling actual runtime operations
through these routines, including dispatch, returned values and caller controls.
This pilot neither constructs that integration nor predicts its total state count.

## Independent execution tests and trust boundary

The native exporter emitted all rows and decoded exits of **38 actual binary
machines**: four reads, thirty-two constant writes and two movements. An independent
Python sparse-tape simulator ran each on all 8,192 raw cell patterns, including
1,250 valid cells and 6,942 invalid cells, with varied nonblank neighbours on both
sides. All **311,296 machine cases** passed exact result, head, full-tape and step
checks. These finite fixtures supplement the universal proofs; they are not the
basis for extending a finite result to arbitrary tapes.

Six corrupted tables were rejected: wrong state charge, wrong read result,
wrong movement, surrounding-tape corruption, premature stopping and a cycle.
The native dependency audit checked **196 roots and 5,787 dependencies**, permitting
only `propext`, `Classical.choice` and `Quot.sound`. Seven compiler-generated unsafe
recursion artifacts were excluded only after matching their safe owners; none is
a mathematical proof dependency. No generator root enters the safe proof closure.
Three audit negative controls and three false-theorem controls were rejected.
Independent source review caught and prompted repair of a blacklist-control
ordering defect before the final accepted run; that finding remains documented.

## Retained evidence and reproduction

The official artifact has 21 entries, including every exported row, phase receipt,
command transcript, rejected false theorem and fixture report. Artifact SHA-256:
`3b760230b9d449a32293edeaeccbce7a7d6446b568d6467976279f72cfd9d22e`.
Logs SHA-256:
`765b273322ae0246304a04f604ab8ff6b429a84d7057e24e18086e8efdff491c`.
See [evidence/current](evidence/current); earlier failed proof attempts remain under
[evidence/history](evidence/history) and are not relabeled as successful workflows.
The cancelled duplicate at the old source is recorded separately.

Remote reproduction uses `.github/workflows/chess_field_binary.yml`, stage `full`,
which invokes the focused strict build, trust/contract controls, row export,
independent fixtures and count checks. No model search or full chess execution is
part of this pilot. Local-safe replay checks only saved outputs and hashes:

```sh
python3 docs/chess/field-binary/evidence/check_evidence.py
python3 scripts/chess_field_binary/verify.py --metadata
```

The frozen specification, toolchain and accepted machines remain fixed. All
substantive computation ran remotely. Outreach and upstream writes remain on hold.
A next integration task could compile one actual runtime primitive, add its dynamic
control/marker requirements and prove a simulation at the existing interpreter
boundary before attempting an entire new backend. See [RESUME.md](RESUME.md).
