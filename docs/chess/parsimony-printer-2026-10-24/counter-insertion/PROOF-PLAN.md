# Local operational contracts before whole-printer integration

Existing Data.lean remains fixed. All new kernels quantify over an arbitrary
binary Machine and require only its named transition rows, not a hypothesis of
the routine's correctness. Physical row binding is a separate finite export
comparison. Reachability below means a finite ordinary machine path; existing
Data.query_run retains its stronger exact-step contract.

Counter words are little endian in nearest-head-first left-tape order. Define
`value [] = 0` and `value (b :: bs) = b.val + 2 * value bs`. A pure finite ripple
carry returns none on overflow. Prove length preservation and value increment,
and existence whenever `value bits + carry < 2^length`. The physical left sweep
starts at the least significant cell, processes each bit with carry/no-carry
controls, and exits one cell right of the most significant cell. Indexed return
controls then restore the head to the separator immediately right of the least
significant bit. Both exterior frames are arbitrary and unchanged. The physical
all-ones carry-out row is an error transition; never invent a wrapping behavior.

For insertion, let `O(n)` and `Z(n)` be finite lists of n ones and zeros. Lists
before a left frame are nearest-head-first. The canonical insertion entry has
left `O(v) ++ [0,0] ++ L` and right `Z(width+2) ++ R` including the scanned zero.
The desired exit has left `O(v) ++ Z(width+2) ++ L` and right `Z(2) ++ R`.
The resulting binary word occupies width zeros behind two separator zeros.
The head moves width cells right. L and R are completely arbitrary beyond the
stated finite working area; no assumption of a globally blank tape is made.

The first two input zeros are essential: they stop both leftward searches before
arbitrary exterior data. There are two insertion continuations. An A entry scans
the right separator and moves left. A B entry finishes a carried one by scanning
right through the remaining unary run. Prove each local character path, then
induct over the remaining character controls. The zero-unary path finishes via
the real two-state right/left return; the positive path finishes the last carry.
These finish controls and all scans must be included, even though no new states
are added by certification.

The unary converter maintains the two separators, a fixed-width binary word,
the remaining unary count, and erased temporary cells. Each loop removes the
last unary one, increments the binary word without overflow, and returns to the
remaining run. Its natural variant is the remaining unary count. At zero it
creates the next query marker and returns through the real cleanup control.
Prove a pure repeated-increment invariant and numeric bound; do not ask Lean to
unroll up to 8,191 physical counter executions for each of 13,360 data entries.

Full-data instantiation must use shared bound proofs. The conversion needs the
stronger width-13 value bound, not merely the Fin 13360 index bound used by Data.
Use a shared modulo-8192 word constructor with a generic identity theorem under
its explicit bound, proving every resulting word is below 8192 without evaluating
the entire array. Independent finite comparison must show every actual word and
row is still unchanged. A constructor bound alone does not establish packet
identity or justify wrapping an out-of-range original word.

Compose the data marker query, actual data-out zero branch, insertion and unary
conversion on one canonical local machine. Instantiate the same structural
theorem for every `i : Fin 13360`, preserving arbitrary exterior frames. Export
every relevant local row and compare writes, directions and targets with the
unchanged candidate. This local result still excludes global printer iteration,
preamble/epilogue, framing/marker cleanup, complete blank startup, packet identity,
the full chess suffix link and both final halting directions.

Round 1: run 40145616663, producer
`791794fce52335ff6bfc917edaeb148d7c09abd6`. Targets Common scans plus counter
arithmetic/left sweep only. No phase gate is inferred from a checked prefix.
