# Complete field-aware chess compiler

This campaign replaces the complete interpreter backend and its paid input encoding.
The acceptance target is a closed binary blank-tape machine with fewer than
390,491,642 states and the unchanged theorem
`Halts machine ↔ ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss)`.
The frozen specification, earlier machines and evidence are pinned in
`baseline-pins.json`. All proof checking, native execution, simulations and counting
run on the fork's remote CI. Outreach remains on hold.

## Construction

`FieldCompiler.Snapshot` supplies one literal operation for each of the 4,042
normalized frozen interpreter labels. Its kernel theorem identifies every source
statement with `SharedModel.machine`; the proposed snapshot generator is outside
the mathematical dependency chain.

`FieldCompiler.Codec` encodes four three-bit stack fields and one marker in each
thirteen-bit cell. Its input theorem derives the representation from the actual
finite initializer. The tape relation covers every integer coordinate, including
the blank tails and all neighboring cells.

`FieldCompiler.lower` compiles moves, field writes, field loads, pure store loads,
marker tests, absence tests, store branches, store-dependent jumps and halt.
The `lower_refines` theorem in `Semantics.lean` preserves the complete next control,
store and tape for every operation. Its `respects` theorem gives a nonempty
simulation path and exact stopping; `halts_input` supplies both termination directions on arbitrary finite
input, without a reachability assumption.

`FieldCompiler.Graph` assigns a fully paid 1,024-node block to every source label.
The universal size bound covers every instance of every operation. Unused slots
are counted halt nodes. Executable row lookup uses getters; it does not allocate
the mathematical vector containing all padded graph slots.

The existing verified `CompactPost` quotient retains every live node/store pair
and one halted control. The binary backend pays both a main control and a write
return control per Post control. `FlatInit` then pays two controls per input bit.
`FieldCompiler.Numeric` independently expresses the binary rows by arithmetic
ranges and the initializer by write/restore/body ranges. Its universal identities
connect those row recipes to the verified compilers, including missing transitions.

`Chess.Optimisation.FieldAware` composes the entire construction with the frozen
runtime and chess source certificates. `Cryptids.Semantics.ChessFieldAware` names
the resulting machine and states the original chess equivalence. The original
open conjecture is not a permitted proof dependency.

## Evidence and acceptance

The focused remote workflow is `.github/workflows/chess_field_full.yml`.
`scripts/chess_field_full/verify.py --target full` checks regeneration, the complete
kernel proof, safe dependency closure, negative controls, independent numeric
fixtures, paid initialization, complete allocation and prior chess regressions.
Local `--metadata` checks hashes only.

Development attempts, including failures, are retained in `evidence/history/`.
Only a completed same-source full verification, independent advisory review and
sealed evidence replay can establish the final accepted count. Component passes
and the candidate's proposed numerical equalities do not by themselves certify
a replacement of the accepted full machine.
