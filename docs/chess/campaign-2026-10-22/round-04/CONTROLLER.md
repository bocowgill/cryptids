# Fixed29 packet decoder: explicit controller source

Status: **bounded remote controller pilot passed**. This source
implements the fixed29 packet architecture after the complete static packet
identity passed run 39807083846. The accepted complete machine remains 998,176
states. The new artifact is labeled `FINITE_UNVERIFIED_CONTROLLER`; neither its
source nor a future finite fixture pass supplies a universal decoder proof or a
new accepted machine.

[Run 39810577763](https://github.com/bocowgill/cryptids/actions/runs/39810577763)
checked commit `0afbd2a0c921b4bf0ffdcc5dee67b5b89f899eab`. The retained
[runner receipt](evidence/controller-01/unpacked/verification.json) records exit
zero for construction and independent checking, neither timed out, and both exact
success banners. Its complete wrapper elapsed time was 3.350205019 seconds under
the combined 600-second/4-GiB limit. The
[independent summary](evidence/controller-01/unpacked/controller-summary.json)
records **21,682 paid states, 43,364 checked rows, 66 positive fixtures, and 10
rejected corruption controls**. Every state belongs to one of 4,626 declared
blocks; only the two designated success rows are absent. No timeout was counted
as a rejected control.

With the accepted body, the measured finite allocation gives a prospective
complete total of **769,344 states**, saving **228,832** from the accepted
998,176-state machine. The quotient-body total is **310,029**, conditional on its
separate body certificate. Both totals still require the universal decoder and
full composition proofs; this pilot accepted no new machine.

The controller artifact SHA-256 is
`c812768bac296d8520f64b7df4a33de47e7c067c79594bef48e7b536e359e09f`.
The executed generator source SHA-256 is
`60ac31fb4474b225af657e1321f1a848e93d529fb47263cb0cb1f8721558f220`, as recorded in
[controller-construction.json](evidence/controller-01/unpacked/controller-construction.json).
The parent independently checked saved metadata and hashes; its
[replay receipt](evidence/parent-controller-replay.json) binds official archive
SHA-256 `1d90c69c89c3de713310a6d7699b4db5ad1a6c7de6075155437a7b25783f21a5`,
source-manifest SHA-256
`74e5d6500b4602d538f79131da293a03bebc69229565b36c65c10ae1a9ec79c9`, and summary
SHA-256 `87c4885e89eb4e041a255d1e717d7454d389969dbb43fa65e9efb15a77f90637`.
This local replay inspected retained evidence only and did not execute the table,
model, or state-count construction.

[controller.py](../../../../../scripts/chess_table_seed_20261022/controller.py)
owns construction only. It requires `CHESS_REMOTE=1` and `GITHUB_ACTIONS=true`,
including on import, and accepts `--output PATH`. It writes `controller.json`
and `controller-construction.json`, refusing to overwrite either file. The
construction report binds the exact controller bytes and source by SHA-256,
records every allocated state category, and states that fixtures were not run
by the builder. Its exact final banner is
`CHESS_TABLE_SEED_CONTROLLER_BUILT`. The independent checker and root-owned
wrapper own the combined pilot and its success banner.

No local execution, model generation, import, simulation, counting, compilation,
Lean invocation, git mutation, or network request was performed for this leaf.
The root's remote wrapper enforced the agreed 600-second and 4-GiB combined
limit. The builder exports the complete allocation even if it exceeds 50,000
states, records that failure, and exits before any fixture may be counted as a
successful pilot. The successful run remained below that allocation limit.

## Finite control and complete row allocation

The source first declares a finite graph whose operations are `read` and
`emit`. This graph is construction syntax only. Every operation is fully
expanded into ordinary binary rows before export: write zero or one, move left
or right by one cell, and enter a named paid state. There is no stay movement,
zero-step dispatch, runtime Python callback, free call, implicit return, or
unbounded register. Every allocated state has both symbol rows, including
malformed-input controls and unreachable combinations of finite parser flags.

The only absent rows belong to `done`. `error` has two explicit preserving,
right-moving self-loop rows and is used for invalid literal codes 5–7. General
malformed packet validation is outside the valid-packet contract, but its
controls and every transition remain fully defined and paid.

The parser retains only these finite contexts:

| Context | Retained information |
| --- | --- |
| Literal prefix/suffix | Phase, depth 0–2, partial three-bit code |
| Row tag | Depth 0–2 and partial three-bit tag |
| Operand | Tag 0–6, right/left side, position 0–12, started/nonstarted flag |
| Emission | One pending letter and the finite continuation context |
| Tag output | Tag 0–6 and position in its fixed at-most-three-bit expansion |
| Scanner | Consecutive-one run count 0–3 |

No control retains a complete thirteen-bit operand. Natural-word values are
never accumulated. A read node's two edges choose the already-paid continuation
after the bit has been consumed. Continuations with the same target share an
identical B-update block; the target is a fixed transition destination, not a
runtime return address. Each emission has its own fully allocated return
context, so no return mechanism is omitted from the count.

Every exported block includes its name, kind, entry, count, individual state
names, and head/tape contract. Fixed operation metadata is converted to JSON
lists before serialization. The builder checks the complete numeric row range,
two rows at every state, unique success/error controls, contiguous block
coverage, and exact JSON round-trip equality. The independent checker reads the
artifact without importing this source and repeats its own allocation checks.

## Boundary invariant and one-bit consumption

At every parser or emission boundary, the head is on B's left zero guard. With
initial packet origin `o`, `r` raw bits consumed, and `k` letters emitted, the
intended complete tape partition is:

| Region | Coordinates | Content |
| --- | --- | --- |
| Left exterior | Before `o−3k` | Zero |
| A | Starts `o−3k` | `011110` |
| Compact output | Starts `o+6−3k`, ends before `o+6` | Three-bit codes of current output order |
| Cleared gap | Starts `o+6`, length `1+r` | Zero |
| B | Starts `o+7+r` | `011110` |
| Unread packet | Starts `o+13+r` | Exact unconsumed raw suffix |
| Right exterior | After the original finite packet | Zero |

The coordinates, `r`, and `k` are mathematical descriptions of the invariant,
not machine registers. The local operations preserve the arbitrary unread
suffix; their scanners never enter it, even when it contains long runs of ones.

For a source read context named `s`, `read.s.seek` uses six preserving right
moves to reach old B+6. The single `read.s.bit` state reads the raw bit, writes
zero, moves left to old B+5, and chooses a continuation-specific
`consume.to.destination` block. This block writes `111100` while moving left
six times, then moves right twice preserving the tape. The whole seven-cell
window becomes `0011110 = [0] ++ M`. New B is old B+1 and its first unread bit is
old B+7. The complete operation ends on new B's left guard.

Thus reading finishes before the marker overlap overwrites the consumed bit.
Every raw bit, including all three bits of every phase stop, is consumed by this
same operation. The shared consume block starts at old B+5 after old B+6 has
already been erased; its eight transitions end at old B+1.

## Three-bit prepend and marker scans

For an emission context named `s`, the following named blocks are fully paid:

| Block | Kind | Entry and exit |
| --- | --- | --- |
| `emit.s.depart` | `emit_depart` | One left move from B to B−1 |
| `emit.s.seek_a` | `scan_left` | Four run states; exits at old A's left zero |
| `emit.s.to_output` | `emit_seek` | Five right moves to old A+5 |
| `emit.s.code` | `emit_code` | Three left-moving writes of the reversed code; exits old A+2 |
| `emit.s.write_a` | `emit_marker` | Six left-moving writes of reversed M; exits old A−4 |
| `emit.s.skip_a` | `emit_skip` | Seven right moves to new A+6 |
| `emit.s.seek_b` | `scan_right` | Four run states; exits at B+5 |
| `emit.s.back_b` | `emit_return` | Five left moves to B and the continuation |

The code is placed at old A+3 through old A+5. New A occupies old A−3 through
old A+2, so A moves exactly three cells left. The right boundary of output and
the gap length do not change. The pending letter is retained only in explicit
control copies while its shuttle is executing.

The left scan starts strictly left of B and its fourth consecutive one is A's
leftmost one; the mandatory left move exits on A's guard. After skipping A, the
right scan starts on compact output and stops after B's fourth one, on B+5.
Valid compact codes `100/010/110/001` cannot create four consecutive ones across
record boundaries. Both scans therefore stay within the marker-delimited
compact region. This language property and its arbitrary-frame preservation
remain universal proof obligations; finite row execution does not establish
them for unbounded packets.

## Parsing order, zero words, and empty phases

The entry block moves seven cells right from the packet's first bit to B.
`literal.post.*` consumes the reversed literal suffix first. Each nonzero code
emits that letter by prepending it. Its `000` stop is fully consumed, then
`emit.delimiter.*` unconditionally emits letter 1 (`.consₗ`). This also happens
when the suffix is empty.

The tag parser consumes three LSB-first bits. Tags 0–6 select their finite row
context. Tag 7 (`111`) is fully consumed and switches directly to the reversed
literal prefix phase. There is no row counter. Operand bits are read only in
thirteen-position operand contexts, so a long run of ones inside an operand
cannot be mistaken for a tag stop.

Each row first emits the right operand's `.cons` in
`emit.row.tN.right.cons.*`, reads its thirteen bits MSB-first, then processes the
left operand the same way. A false started flag discards zero bits. A one bit
emits `.bit1` and makes the flag true; thereafter every bit emits `.bit0` or
`.bit1`. Because emissions prepend, this produces canonical LSB-first
`trNat(value)` followed by `.cons`. An all-zero operand still emits exactly its
initial `.cons` and no digits.

After both operands, the controller emits the tag's `.cons` and the tag's fixed
canonical MSB-first digits. The only tag constants are the seven strings
`""`, `1`, `10`, `11`, `100`, `101`, and `110`. Right–left–tag emission prepends
the original `[tag,left,right]` natural words; reversed packet row order restores
the original table order. The final literal prefix phase restores its original
letter order and consumes its `000` stop before cleanup. Empty prefix, table,
or suffix phases need no special counter or implicit blank-word convention.

## Exact finish and checker-facing primitive contracts

At finish, all raw packet bits, including the final stop, have been consumed.
`finish.to_b_end` moves five right cells to B+5. `finish.erase_b` writes six zeros
moving left and exits at B−1. A leftward four-one scan finds A. Five right moves
then enter `finish.write_header` at old A+5. Its thirteen left-moving writes of
reversed `0111100011110` install the old seed's complete header in
`[old A−7,old A+6)`, preserving compact output from old A+6 onward. It ends at
old A−8. `finish.restore_head` is exactly one preserving right move, ending at
old A−7 in `done`.

The final relative tape is intended to be precisely
`HEADER ++ payload(original letters) ++ 000`, with zero exterior on both sides.
The trailing three zeros are supplied by the already blank right exterior;
there are no remaining work bits. At packet origin `o`, the final head is
`o−3*letters.length−7`. This includes empty phases: the synthesized delimiter
still contributes one letter. A universal proof must establish exact relative
zipper equality, including implicit zeros; the finite checker additionally
compares the complete sparse support and head.

The independent checker uses the named block kinds `consume_shift`,
`emit_code`, `cleanup_header`, and `final_head` to select real positive execution
snapshots for focused mutation controls. Their contracts above distinguish the
read-before-shift precondition and leftward writes from their final head
positions. The unmutated primitive must satisfy its exact tape contract before
a corrupt write, move, or destination can count as a rejected control. A timeout
or unexpected exception is not successful rejection.

## Count boundary and four source passes

Exact `D=21682` and all `2D=43364` rows were determined by the remote constructor
from the complete allocation, before reachability reduction, and independently
checked. The construction report instantiates `747662+D=769344` with the
accepted body, conditional `288347+D=310029` with the separate quotient body,
and prospective saving `250514−D=228832`. Both one-state bridges and the retained
216-state old expander are charged in these formulas. These are measured finite
allocation and arithmetic composition, not a new accepted saving theorem.

The 66 positive executions covered all seven tags, empty phases, zero words,
operand boundaries and adjacent long one-runs at translated origins −37, 0 and
101. They compared the entire sparse support and exact head. The independent
summary records 410,290 total simulated steps and a maximum of 47,746 steps for
one completed positive fixture. Actual positive snapshots supplied the
`consume_shift`, `zero_word_cons`, `cleanup_header`, and `final_head` primitive
contexts for focused corruptions. The full chess packet was not executed; its
complete static identity remains the separate successful packet run 39807083846.

1. **Complete implementation pass:** expanded every read, write, branch,
   continuation, scanner, emission, error and cleanup operation into paid
   binary rows; supplied the complete export, refusal-to-overwrite behavior,
   budget stop and explicit evidence scope.
2. **Domain pass:** checked consume-before-overlap, B's one-bit movement, A's
   three-bit prepend, no raw-input scans, all phase stops, unconditional
   delimiter, zero words, MSB trimming, row/word reversal, and empty phases.
   Independent read-only geometry review found no off-by-one defect.
3. **Defect pass:** independently reviewed the complete source graph, finite
   parser products, all row destinations, shared continuation head contracts,
   JSON-native metadata and unique terminal/error behavior. The source reviewer
   found no blocking defect; no execution or counting was used for that review.
4. **Polish/interface pass:** aligned the exact builder banner and output schema
   with the root-owned contract, gave the independent checker stable block kinds
   and precise entry/exit geometry, and separated finite source readiness from
   bounded execution and the subsequent universal Lean proof. After the remote
   pass, retained receipts and hash provenance were recorded without changing
   the computational controller source.
