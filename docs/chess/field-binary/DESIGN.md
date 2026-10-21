# Field-aware binary backend pilot

User scope: certify read, write and movement routines and compare state counts.
The chess specification, source program, accepted machines and toolchain remain
fixed by baseline-pins.json. Implementation is separate. All Lean, fixture,
compiler/count evaluation and native audit work runs remotely; only edits,
hashes and saved-output inspection occur locally. Outreach remains on hold.

The candidate cell has four three-bit fields followed by one marker bit. Valid
field values are zero through four; unused three-bit codes must have explicit
behavior. Read/write routines begin and end at the cell boundary. Movement goes
to the adjacent thirteen-bit cell without changing any tape bit. Universal tape
contracts, rather than bounded fixtures alone, establish preservation of the
surroundings. The fixed chess source is not compiled through the new backend in
this pilot, and no new chess machine/state total is claimed.

A finite first-order routine tree compiles to an ordinary two-symbol binary
machine. Each instruction, branch and exit is charged. Execution and numeric exit
decoding are certified independently of concrete field operations. All operations
must return after a finite number of steps; no free stay-put transition or
unpaid caller/return state is used.

Comparison separates standalone candidate machine states from the current
TemplateGraph allocator's charged family contributions. Any baseline capsule
must identify its store/result and exit conventions. Different encodings are
compared at equivalent decoded cell operations, not by equating their bitstrings.
Complete backend savings require later integration, which this pilot does not do.

Acceptance is recorded in .unlazy/chess-field-binary/GATES.md. Failed remote
attempts and exact source hashes are retained; no local Lean/LSP/LeanProbe build.

The legacy count differences hold every other inventory parameter fixed. Read and
write-bearing families overlap in the accepted source classification. Those
counterfactual allocation differences are not additive replacement costs for
individual field operations. In particular, a constant three-bit write routine
is not a complete dynamic writer/dispatcher. Do not report a per-operation saved
state count or a full-machine saving ratio from this comparison.
