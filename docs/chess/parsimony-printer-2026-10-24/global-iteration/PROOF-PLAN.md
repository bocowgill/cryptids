# Global iteration and packet identity proof plan

## Exact operational invariant

At the start of iteration i, control is data 0. The left half is a zero
separator followed by the nearest-head-first printed prefix and arbitrary L.
The right half is i zero cells, then marker 1, then infinite blank tape.
Scanning the cleared index uses the existing data zero rows, writing exactly i
ones and reaching data i. IndexedExtractor.query_extract preserves and erases
that actual i-long unary run. Its returned word has length 13 and the numeric
value encoded in data i's one-row target. Fixed-width binary uniqueness makes
that word the canonical little-endian encoding. Returned zero padding collapses
only on the infinite blank right exterior; the printed left exterior is preserved.
The next boundary is i+1 with the new word prepended to the left frame.

Prove the iteration by induction on word count, reusing the macro once in the
inductive step. Do not evaluate 13,360 physical runs or expand their unary work.
After the last word, scan all 13,360 zero index cells: the last data row writes
zero and enters data_out on the next marker 1. Include data_out's one branch (write 0, move left) to
test_positive_end, preserving the exact remaining unary index/work area.
This is finite ordinary reachability, not an exact global step count.

## Ordered identity and independent data binding

The left-frame word order is little endian and most recent word first. Reverse
the entire printed prefix to obtain chronological big-endian output. Prove
index-based rendering agrees with rendering the numeric array's ordered list.
Use 418 certificates of at most 32 words (416 characters), then compose their
identities in 53 separately checked 256-word modules with append lemmas. Keep
the runtime array unchanged and prove each batch partitions its actual original
array. Treat the checked concrete characters as opaque atoms during composition.
The monolithic module accumulated proof memory despite a successful 32-word
check; splitting compilation is the next bounded scalability test. The first attempt at 53 larger string-based
certificates failed to normalize and hit the fixed time cap; keep that evidence. The expected characters come independently from the pinned
packet.bits file, not by reading the candidate's reconstructed output.

Exact expected output: 32 ones, separator 0, the 173,641-bit frozen packet,
tail 100, and 3 width-padding zeros: 173,680 bits in all. Preserve offset 33.
The raw array and all finite-bound proofs remain shared. No per-entry Fin proof
or per-bit physical run is introduced. The numeric array uses the existing
narrow constructor (mod 8192); certificates check its actual values.

Kernel theorems compare logical data and literal characters. SHA-256 binds the
frozen file to those literals externally. The existing binary row export binds
all used physical rows externally. Neither is a kernel binary/file parser.
A theorem connecting this literal packet to TableSeed.ChessCodec.bits is a
separate bridge still needed for full-machine acceptance. State this explicitly.

## Bounded verification

First check reusable Packet/Global modules, then the unchanged all-word physical
model, the full structural operational root, and the complete packet identity.
Audit all roots for standard foundations only. Check all authored/generated Lean
line widths before expensive stages. Mutate one expected packet bit: require the
kernel certificate to fail, while the unmodified full identity passes. Preserve
all logs, generated source/objects, row exports, manifests and cap measurements.
No linter or memory/time cap may be disabled or raised. Failure requires a
specific diagnosed change before a new source-bound run. Eight attempts maximum.

## Full-machine accounting and opportunity ranking

Accepted complete: 769,344. Unchanged candidate: 609,247. Accepted saving this
phase: zero. Completion of the whole printer/link proof would unlock 160,097
states; this bounded phase discharges two specific dependencies of that proof.
No state-saving estimate is a new accepted count.

| Category | Paid candidate states |
| --- | ---: |
| Target-encoded data incl data_out | 13,361 |
| Extractor | 140 |
| Preamble/epilogue | 6 |
| Tail cleanup | 3 |
| Marker scan | 32 |
| Marker erasure/direct decoder connection | 2 |
| Error trap | 1 |
| Decoder | 21,682 |
| Decoder bridge | 1 |
| Seed expander | 216 |
| Expander bridge | 1 |
| Interpreter main | 533,341 |
| Interpreter returns | 40,461 |
| Total | 609,247 |

The local model's address 13,545 is the existing decoder entry, not an extra
paid state. Unmodeled outgoing rows are not claimed as a whole machine.

| Rank / opportunity | Plausible absolute payoff | Proof difficulty | Effort / decision |
| --- | --- | --- | --- |
| 1. Finish complete printer certification | Exactly 160,097 if all remaining obligations close | High, now structurally decomposed | Continue this bounded dependency test; no further machine edits |
| 2. Interpreter/return architecture | Potentially hundreds of thousands within 573,802 paid states | Very high; older quotient scaling unresolved | Independent future bounded structural-certificate pilot; keep older route paused |
| 3. Decoder representation | At most 21,682 here; unknown achievable share | High | Future architecture audit after acceptance; do not add incompatible estimates |
| 4. Target-encoded printer data | At most 13,361 here; unknown achievable share | High | Later, after the existing printer can actually be certified |
| 5. Tiny framing/control changes | At most dozens | Medium | Defer unless needed to unlock a specified full proof |

These are ranked opportunities, not additive savings or authorized next phases.
