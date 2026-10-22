# Three-bit seed expander: finite binary pilot

Status: **source complete; corrected remote run pending**. This is a
`FINITE_UNVERIFIED_PILOT`, not a new Lean-certified chess machine. The accepted
complete machine remains 2,411,743 states and its unchanged body has 573,802
states. No model, Python import, prototype execution, Lean invocation, or fixture
was run locally while preparing this source.

The implementation is [pilot.py](../../../../../scripts/chess_seed_20261022/pilot.py).
Its runtime guard requires both `CHESS_REMOTE=1` and `GITHUB_ACTIONS=true`, including
when imported. All output goes to `.lake/chess-seed-20261022`. The root-owned
workflow supplies execution and retained evidence; this document makes no claim
that the proposed fixtures have passed before that receipt exists.

The first remote attempt, run `39787968426` at commit `b1dc8ea`, stopped before
simulation because fixed-block operation tuples became lists during JSON
serialization and failed the exact export round-trip check. The source now
normalizes operation metadata to JSON lists before export, preserving that
strict check. The failed attempt supplies no successful fixture evidence.

## Closed binary controller

The generated object is a finite table with state zero as entry. Every allocated
state has a row for zero and for one. Each nonterminal row writes one bit, moves
exactly one cell left or right, and names a paid destination state. Only the two
rows of `done` are missing. Invalid three-bit codes 5, 6, and 7 enter a separate
paid `error` state, whose two rows preserve the current bit and move right back
to `error`.

There is no runtime subroutine, external register, zero-step transfer, free
return, or implicit macro instruction. `Builder.fixed` expands each fixed
operation to one state. `Builder.scan_four` expands to four states carrying a
run count in `{0,1,2,3}`. The parser allocates its full binary tree of seven
states for three least-significant-bit-first reads. A retained symbol is
represented by choosing one of four disjoint control branches; no symbol store
is multiplied into control blocks that do not use it.

The numeric table is serialized to `controller.json` and to a separate JSONL
stream carrying every state number, control name, scanned symbol and transition.
The independent checker verifies complete allocation, row order and uniqueness,
numeric destinations, both symbol rows, and the unique successful terminal.
The simulator uses the reloaded JSONL rows, not block constructors or callbacks.

The complete source allocation is exposed by the following finite blocks.
These are source-derived dimensions; `counts.json` will record the measured
allocation after remote execution.

| Block family | Copies | States per copy | Runtime head contract |
| --- | ---: | ---: | --- |
| `entry` | 1 | 7 | Seed start A to B |
| `loop.skip_b` | 1 | 6 | B to first unread bit |
| `parse` | 1 | 7 | Read three bits, finish at B+9 |
| `carry*.shift_b` | 4 | 10 | Advance B by three; finish at old B−1 |
| `carry*.seek_a` | 4 | 4 | Scan left; finish on A's left zero |
| `carry*.prepend` | 4 | 18 | Emit thirteen bits; finish at old A−8 |
| `common.write_a` | 1 | 6 | Install A thirteen cells left; finish at old A−14 |
| `common.skip_a` | 1 | 7 | Skip the new A; finish at first output bit |
| `common.seek_b` | 1 | 4 | Scan right; finish at B+5 |
| `common.back_b` | 1 | 5 | Restore head at B |
| `finish.to_b_end` | 1 | 4 | B+9 to B+5 |
| `finish.erase_b` | 1 | 6 | Erase B; finish at B−1 |
| `finish.seek_a` | 1 | 4 | Scan left to A |
| `finish.erase_a` | 1 | 6 | Erase A; finish at first output bit |
| `finish.to_marker` | 1 | 12 | First output bit to offset 12 |
| `finish.set_marker` | 1 | 1 | Set bottom marker; move to offset 11 |
| `finish.back_head` | 1 | 11 | Restore first output bit |
| `done`, `error` | 1 each | 1 each | Paid success and nonterminal failure |

This direct layout is suitable for a Lean finite sum of named block families:
fixed-block positions can be `Fin n`, scanner positions can be `Fin 4`, and the
four carry variants occur only in the three carry-dependent block families.
Migration must prove that the Lean numeric rows agree with the complete exported
table. The Python constructor itself is not a formal definition or certificate.

## Geometry and cleanup

The paid seed is `011110 0 011110 C(L) 000`, with codes `100`, `010`, `110`,
`001` for values 1 through 4 in the original stack order. The target is the
thirteen-bit field encoding of the reversed stack, with its sole bottom marker
at offset 12 of the first cell. Empty input produces one marked blank cell.

After `i` consumed symbols, the intended loop boundary has A at `−13i`, output
starting at `6−13i` and ending before coordinate 6, a cleared gap starting at 6,
B at `7+3i`, and unread records starting at `13+3i`. Both exterior regions are
zero. The head is on B's left zero. These coordinates are mathematical
descriptions and fixture oracles; the machine has no position counter.

The parser finishes its complete read before changing B. From old B+9, the
carry branch moves left once, then writes the reverse of `000011110` while
moving left nine times. This erases the old first three cells, installs the new
guarded B at old B+3, and finishes at old B−1. The leftward scan therefore cannot
mistake B for A. A fourth consecutive one is A's leftmost one; the scan's
mandatory left move lands on A's left zero.

The prepend branch moves right five times to old A+5, writes the thirteen-bit
unmarked output cell in reverse while moving left, and ends at old A−8. The
shared marker block writes `011110` in reverse and ends at old A−14. This puts
new A at old A−13 and the new output cell at old A−7. The carry is no longer
used after the last output bit, so marker construction and the rightward return
are shared. Seven right moves skip new A completely. The rightward scan exits
at B+5, and five left moves restore the loop boundary.

On `000`, four left moves reach B+5, six zero writes erase B, and a leftward
scan finds A. Six rightward zero writes erase A and leave the head on the first
output bit. Twelve right moves reach the bottom-marker position. A write-one
left move followed by eleven preserving left moves returns the head exactly.
For empty input, the same operations leave only one bit set at offset 12 of a
thirteen-bit blank cell. No original seed or marker support may remain.

Markerless valid records have no run of four ones: only `001` ends in one, and
the longest initial run of the following code is the two ones of `110`.
Unmarked expanded cells have ten trailing zeros. This explains the scanner
invariant, but its universal preservation and finite termination still require
Lean proofs. The source-derived transition count to first `done` is
`16*n*n + 83*n + 62`; the pilot checks it only on finite fixtures. Runtime steps
are not states and are never used as the paid allocation count.

## Independent checks prepared for the remote run

The frozen native input is pinned to the accepted round01 export SHA-256
`592ea3c892d0e9d5a6db6ce31e3f590bde7973774bdc9a70cfe46cb6996cd39e`.
The source-cell and target-bit hashes are separately pinned. The static checker
reads all 141,380 source cells, verifies that only the main field is populated
and only the first cell is marked, then recovers the original stack order.
It writes the complete 424,156-bit seed, decodes every three-bit record with
numeric positional weights, and compares the entire reconstructed 1,837,940-bit
target to the accepted native bit string. The seed is saved as ASCII zero/one
bytes without a newline, including all three charged trailing zeros. The seed
byte count and SHA-256 are reported explicitly.

The expected output function independently reverses the input stack, constructs
four fields per cell, encodes each field arithmetically, and adds the bottom
flag. It contains no marker protocol, shuttle algorithm, or block schedule.
The row interpreter has only the ordinary machine state, sparse binary tape,
and head as machine memory. Its step and coverage counters are testing
instrumentation and do not affect transitions. Equality of complete sparse
support checks every nonblank cell and both infinite zero exteriors, as well as
the exact physical head.

The prepared positive cases include empty input, all four singletons, all
ordered pairs and triples, and longer cases for repeated `001`, repeated `110`,
both alternating orders, zero-ending codes, delimiters at both ends, an odd
mixed length, and the actual final stack symbol. Each case runs at origins
−101, −1, 0, 1 and 137. Invalid codes 5–7 are tested separately at three
origins, and both error-state rows are checked directly. Full chess startup is
never simulated: `run_fixture` rejects inputs longer than 256 symbols.

Fourteen focused negative controls run after all positive fixtures. They corrupt
B's overlapping marker rewrite, A's shift direction, an emitted main-field bit,
B cleanup, A cleanup, the bottom flag, final head restoration, the scanner
counter, parser accumulation, state accounting, and invalid-code termination.
The remaining controls add far-left and far-right residue and corrupt the
recorded step count. Each must fail the same applicable checker that accepted
the positive construction.

Remote artifacts are `controller.json`, `controller-rows.jsonl`, `seed-bits.txt`,
`target-bits.txt`, `static-input.json`, `fixtures.json`, `negative-controls.json`,
`counts.json`, and `pilot-summary.json`. The summary binds artifact hashes, the
pilot source hash and available GitHub run identities. The exact final success
banner is `Three-bit seed pilot passed`. The root's runner owns its separate
`pilot-run.json` receipt.

## Paid count and remaining certificate boundary

The candidate formula is `997959 + D + H`: the unchanged 573,802-state body,
424,156 seed writes, one paid reverse-writer turn, every controller state `D`,
and one additional bridge state `H=1`. The already allocated `done` state is
still charged. The prospective bridge patches only the two success rows, moves
right preserving the bit, then moves left preserving the bit into body state
zero. Neither the seed fixture nor the arithmetic formula is a certified
blank-tape initialization theorem.

The remote census must compute D from the actual allocation rather than trusting
a hand total. `counts.json` reports exact finite-controller allocation and the
symbolic complete candidate, including the strict-reduction and optional
sub-million bounds. Every such output is labeled `FINITE_UNVERIFIED_PILOT`.
Required subsequent work remains universal expansion and cleanup in Lean,
termination, exact numeric controller rows, the paid writer and protected
success linker, full-machine export, and the chess halting equivalence.

## Four source passes

1. **Complete source pass:** implemented every fixed operation, parser branch,
   directional scanner, terminal and error row; pinned the accepted input and
   retained complete export and fixture outputs.
2. **Domain pass:** checked read-before-overwrite B geometry, A's thirteen-cell
   shift, original-stack reversal, both directional scanner endpoints, empty
   input, zero exteriors, and exact final head. A separate source reviewer found
   no off-by-one defect and derived the transition-count formula independently.
3. **Defect pass:** reviewed every deliberate mutation for a real change and a
   rejecting oracle; separated fixture instrumentation from controller memory;
   checked source schema/hash pins, all two-symbol rows, paid blocks and invalid
   input's nonterminal behavior. Independent adversarial source review found no
   blocking defect. This is not an executed-test result.
4. **Polish and scope pass:** aligned artifact names and success banner with the
   root-owned runner, documented ASCII seed bytes and charged trailing zeros,
   distinguished static full-input equality from quadratic startup replay, and
   kept every prospective count and correctness statement within the finite
   pilot boundary.
