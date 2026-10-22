# Universal proof plan for the fixed29 table decoder

Source review only. The target below is an obligation, not a new theorem or
accepted machine. Packet census run `39807083846` at `6b2e120` passed and its
retained metadata/artifacts were checked by the parent. The accepted machine is
still **998,176 states**. The direct controller is now specified by
`scripts/chess_table_seed_20261022/controller.py` and
`CONTROLLER-CONTRACT.md`; its independent bounded pilot and exact allocation
are separate work. This plan neither executes that source nor assigns it a
measured state count.

## The theorem to prove first

Use one universal exact-tape reachability theorem. Proposed names in this
document are interfaces to implement, not existing APIs:

```lean
-- Row has a tag : Fin 7 and left/right : Fin 8192.
theorem packet_reaches (pre post : List Seed.Letter) (rows : List Row) :
    Reaches (step TableSeed.machine)
      ⟨0, Tape.mk₁ (packet pre rows post)⟩
      ⟨TableSeed.done, Tape.mk₁ (Seed.seed (letters pre rows post))⟩
```

Here `W n := (PartrecToTM2.trList [n]).map Seed.ofSymbol`, and

```text
letters pre rows post =
  pre ++ rows.flatMap (fun r => W r.tag ++ W r.left ++ W r.right)
      ++ [0 : Seed.Letter] ++ post.
```

Letter zero is `consₗ`; letter one is `cons`; letters two/three are `bit0/bit1`.
The theorem preserves the entire infinite tape and fixes the final head at the
first bit of `Seed.seed`. It supplies termination by finite reachability. An
exact global quadratic runtime formula is unnecessary for linking.

The packet is the frozen format: `M ++ [0] ++ M`, reversed suffix literals and
`000`, reversed rows and `111`, then reversed prefix literals and `000`. Each
row has its three-bit **LSB-first** tag followed by thirteen-bit **MSB-first**
right and left fields. Each literal has the existing three-bit LSB-first code
`letter.val + 1`. The theorem quantifies over bounded triples, not just valid
DAGs; DAG semantics enters only the final chess instantiation.

## Freeze the actual paid control before proving executions

The Python `Program` is a finite source graph, not an extra runtime machine.
Its `read`/`emit` edges must be connected to the physical rows, including the
shared `consume.to.<destination>` blocks. Preserve precisely these source
families:

- Literal phase `pre/post`, depth 0–2 and partial LSB code; row-tag depth and
  partial code; tag 0–6, side `right/left`, position 0–12 and `seen` flag.
- Emission contexts for literal letters, the delimiter, operand cons, operand
  bits, and each finite constant-tag emission. The pending output is a letter,
  not an operand value.
- Each actual read continuation owns the paid eight-instruction consume block
  that shifts B. The two branch rows select that block before its writes occur.
  Reused destinations share exactly the block that the pilot shares.
- Fixed entry/finish paths, the four states of each actual scanner, terminal
  `done`, and the paid nonterminal `error` state all remain in the domain.

Follow the accepted `Seed.Controller` pattern: a finite typed `Control`, an
encoding into `Fin D`, an inverse decoding, a structural `controlRow`, and a
`transition_encode` theorem. Keep read contexts, emit contexts and consume
destinations as finite data, with their actual allocation order frozen after
the pilot. In particular, the consume-destination order comes from the
builder's sorted destination names; do not silently replace it by constructor
order. A file-local block descriptor list with prefix offsets is sufficient
to record this order. No new general compiler is needed.

Prove encoding/inverse and interval coverage once. Count each block's fixed
length, including each scanner's four controls, then prove the resulting sum
is the actual retained `D`. Expose a numeric-row definition by decoding a
numeric control and mapping `controlRow` through the encoding. Its pointwise
transition theorem must cover both input bits, destinations, writes,
directions and missing rows. The retained JSON/table and the Lean export must
agree on all `2D` rows and on entry/done/error IDs. A JSON hash alone does not
prove that the mathematical machine has those rows; the usual certified
numeric export/table correspondence is a separate acceptance premise.

To avoid thousands of unrelated normalized proofs, prove one row/path lemma
per **block kind**, parameterized by its finite context. For example, a read
context gives six preserving right moves, its one branching row, and the
selected consume continuation; an emit context supplies its known letter and
known next entry. The structural `controlRow` equations discharge these
schemas. Their parameters are proof parameters over already allocated
controls, not free generic calls or uncharged return addresses. Only the
small finite code/tag cases need direct case reduction.

Both terminal rows must be absent. Prove this directly as
`∀ bit, machine.transition done bit = none`; prove entry encodes as zero.
Unique terminal status is useful for matching the pilot, though `SeedLink`
needs only this designated terminal and the valid-input reachability theorem.

## One zipper invariant at every read/emit boundary

Write `LB` for `ListBlank.mk`, `Z g` for `List.replicate g 0`, and use the
existing `Seed.marker` and `Seed.payload`. Define the proposed canonical frame:

```text
Frame out raw g :=
  Tape.mk'
    (LB (Z g ++ (Seed.payload out).reverse ++ M.reverse))
    (LB (M ++ raw)).
```

The head is B's left zero. A is left of the compact output, with blank exterior
to its left. B is right of a nonempty blank gap; `g = 1 + consumedRawBits`.
`out` is the reverse of the emitted-letter prefix, hence the current physical
left-to-right output. `raw` is the exact unread packet suffix, including phase
sentinels. The finite semantic context describes the phase/partial field.
The scanned numeric prefix value used below is a proof variable only.

Entry performs the actual seven preserving right moves and establishes
`Frame [] raw 1`. Each complete read increases `g` by one and removes exactly
one bit from `raw`. Each complete emission replaces `out` by `letter :: out`
and leaves `g` and `raw` unchanged. Thus semantic induction never needs an
integer-coordinate case split or a global claim that raw input lacks markers.
Raw operands may contain long runs of ones, including `1111`; the scanners
never enter that region.

The following local statements use `ListBlank.append` for displayed finite
prefixes and arbitrary exterior frames `L`, `R`. They must be proved for the
actual reverse-left-write paths, without changing the controller:

1. **Consume one bit.** From `Tape.mk' L (M ++ b :: R)` at B, the six right
   moves read old B+6. The branch writes zero there, moves left, and selects
   its paid continuation. That continuation writes `reverse(001111)` while
   moving left and then moves right twice. The result is
   `Tape.mk' (L.cons 0) (M ++ R)`, at the new B, in the selected semantic entry.
   The raw bit is read before any overlapping marker write; the new B is old
   B+1 and its last zero is exactly the erased old B+6 cell.
2. **Prepend one compact letter.** At A, the actual `5R`, three reversed code
   writes left, six reversed marker writes left, and `7R` send
   `Tape.mk' (Z 3 ++ L) (M ++ R)` to
   `Tape.mk' (M.reverse ++ L) (Seed.word letter ++ R)`, at the first new output
   bit. This consumes three explicit blanks to A's left. An arbitrary adjacent
   left frame cannot be asserted unchanged without this premise. For the
   global frame those cells exist because the entire exterior is blank.
3. **Install the final header.** At A, the actual `5R`, thirteen reversed
   header writes left, and `1R` send
   `Tape.mk' (Z 7 ++ L) (M ++ R)` to
   `Tape.mk' L (M ++ [0] ++ M ++ R)`. The new head is old A−7, exactly the
   first header bit. This consumes seven explicit blank cells on the left.

These are fixed-window equalities against arbitrary surrounding `ListBlank`
frames. Reduce their short `Init.executeList` actions symbolically; split the
four letters where necessary. The existing tape-only `Seed.execute_moves`,
`Seed.execute_moves_shift` and `Seed.execute_write_right` may simplify action
equalities, but a right-write recipe is not a substitute for proving the
controller's actual left-write path. `ListBlank.append_assoc`, the `Tape.mk'`
move equations, and `Seed.Scan.mkLeft` provide the necessary zipper operations.

## Compact-output scans and complete cleanup

The existing generic `Seed.Scan.Rows`, `Reads`, `run_safe`,
`run_safe_fourOnes`, `reads_left/right`, and `shift_left/right_prefix` work for
the new machine and state count. Discharge `Rows` for each scanner family from
its structural row theorem.

Prove two small pure language lemmas by four-letter case analysis and list
induction. Right traversal of `Seed.word` is safe from counters at most one
and ends at most one. Left traversal of `reverse (Seed.word letter)` is safe
from counters at most two and ends at most two. This handles code boundaries,
including the one-runs crossing adjacent triples. Add the marker's leading
zero to reset the counter before its four ones. For right scans, the nonempty
gap also resets it. For left scans, the initial gap is scanned before the
reversed output. Use `scanWord_append` and `scanWord_zeros_reset` to assemble
the safe prefix; then `run_safe_fourOnes` gives the exact exit position.

Consequently the emission's initial `1L`/left scan reaches old A, and its
right scan exits at B+5; the actual `5L` restores the boundary frame. The
fourth one, not the final zero, triggers a scanner exit. This detail fixes
every subsequent move count.

Finish starts only in `Frame out [] g`. Its `5R` and six leftward zero writes
erase all of B and leave the head at B−1. The left scan reaches A; the header
contract then preserves the whole payload and returns at old A−7. Before
blank-tail simplification, the exact finite right representation is

```text
M ++ [0] ++ M ++ Seed.payload out ++ Z (g + 6).
```

Both exterior tails are blank by the canonical frame, so
`Seed.mk_append_zeros` identifies that tail with the three zeros in
`Seed.seed out`. Use `Seed.mk_zeros` for explicit left blank windows. These
lemmas erase only trailing blank padding in a blank `ListBlank`; they do not
erase a leading zero prefix in front of an arbitrary nonblank exterior.
The resulting equality is `Tape.mk₁ (Seed.seed out)`, with no translation,
leftover marker, consumed packet bit, or off-by-one head correction.

The case `pre = []`, `rows = []`, `post = []` still emits the mandatory
`consₗ` delimiter, so its final letters are `[0]`, not `[]`. The finish lemma
itself can safely quantify over arbitrary `out`, including empty output.

## The hard semantic lemma: MSB prefixes become the original word

Keep natural-word fidelity separate from tape geometry. In the existing
mathlib `TuringMachine/ToPartrec.lean`, `trNat` is defined through `Num`, and
`trList (n :: ns) = trNat n ++ cons :: trList ns`. Do not define a new binary
encoding and leave its equality with `trNat` implicit.

First prove the proposed guarded recurrence

```text
W 0 = [consLetter]
W (Nat.bit b v) = bitLetter b :: W v    when v ≠ 0 or b = true.
```

The omitted case `v = 0`, `b = false` is `W 0` again. Source-backed supporting
APIs are `trNat_zero`, `trNum`, `trPosNum`, `Num.ofNat'_bit`,
`Num.ofNat'_eq`, and `Num.bit0/bit1`; these support a short proof through the
existing binary-number representation. This is a proposed derivation, not a
claim that the recurrence already exists or has compiled.

For an operand, cons is emitted first. At each stable operand-read entry or
completed-word boundary, after any pending emission has completed, let `v`
be the consumed MSB prefix's fold under `v ↦ Nat.bit b v`. Maintain

```text
out = W v ++ base,   seen ↔ v ≠ 0,
raw = unconsumed field bits ++ rest,
g = initial gap + number of consumed field bits.
```

If `v = 0` and the next bit is zero, the controller consumes it and emits
nothing. Otherwise it consumes the bit and prepends `bitLetter b`. The guarded
recurrence establishes the next invariant immediately. This simultaneously
proves leading-zero removal, the canonical zero word, and the reversal from
MSB input to low-bit-first output. The proof variable `v` never becomes an
8,192-way control register. Prove that the fixed thirteen-bit field's fold is
the supplied `Fin 8192` value, then instantiate this prefix lemma for each
actual `(tag, side, position, seen)` control family.

Between the read and its selected emission, the raw suffix and gap have
already advanced but the output has not. The pending-letter entry therefore
needs its own semantic assertion: prepending the stored letter to the current
output gives `W (Nat.bit b v) ++ base`. Compose the read contract with that
emission before re-establishing the stable invariant. Do not claim that a
digit has been physically written merely because it has been read.

The row-tag parser uses LSB order and must not reuse the MSB-field parser
lemma. Its seven stored tags select finite cons-first/MSB emission chains;
prove these seven chains give `W tag`. The eighth three-bit tag is the phase
sentinel, with no numeric-word emission.

For one row, processing right, then left, then stored tag gives
`W tag ++ W left ++ W right ++ base`. Induct over the reversed row list to
recover original row order. Likewise the literal lemma consumes
`Seed.payload todo`, prepends each decoded letter, and gives
`todo.reverse ++ base`; instantiate it with `post.reverse` and `pre.reverse`.
Account for all three consumed bits of each sentinel. The phase order is:
suffix literals → delimiter → rows → prefix literals → finish. This is the
only composition needed above the physical read/emit contracts.

Termination follows by list induction for literals/rows and remaining field
positions for each operand; finite tag emission chains terminate directly.
Each scanner crosses a finite safe word before its marker. Thus there is no
unproved “parser eventually returns” premise and no need to run the full
quadratic chess packet to establish termination.

## Reuse boundaries and the final chess bridge

`Seed.run_path`, `Seed.run_block`, `Seed.parse_run`, `Seed.prepend_run`, and the
expander's `scan_left_marker`/`scan_right_marker` are specialized to the
accepted 216-state machine. The old prepend writes a thirteen-bit cell.
Reuse their short proof pattern, not their execution statement, for the new
three-bit-output controller. A local path lemma derived from the new actual
rows is enough. `Seed.Scan`'s machine-parametric contracts and
`SeedLink.runFrom_add` can be used directly.

Instantiate the universal packet theorem with the actual source triples,
root letters and argument letters. Prove their bounds from
`SourceCertificate` and their original-order equality using
`Input.stack_eq_raw`, `CodeDAG.Node.words`, and `Runtime.trList_append`.
The source root/argument stay literal; the argument is not assumed to fit in
thirteen bits. The packet census is supporting finite evidence; it does not
replace the Lean identity with `Seed.ChessCodec.letters`.

Use the accepted `Chess.Optimisation.FieldSeed.linked` as the body of a new
outer `SeedLink.link`. That existing body already contains the 216-state
expander, its one-state bridge and the unchanged selective body. The new
`packet_reaches` supplies its exact input `Tape.mk₁ (Seed.seed letters)`;
`SeedLink.link_haltsOn` applies with the new terminal theorem. The accepted
`FieldSeed.linked_halts_input` supplies the remaining chess semantics. If a
separate intermediate tape identity is wanted, `Seed.seed_reaches`,
`Seed.markedOutput_input`, and `Seed.ChessCodec.output_eq` already supply it,
including the expander's reversal and original thirteen-bit bottom marker.

Finally use `OpenEvolveWide.schedule_correct/size` and
`ReverseInit.Schedule.initialise_halts/initialise_states` for the paid
packet writer, as in `FieldSeed.lean`. With the retained packet length,
the proposed full allocation is `173642 + D + 1 + 574019 = 747662 + D`.
This includes the writer turn, all new decoder controls, both bridges, the
216-state expander and the complete accepted body. Its same-body saving is
`250514 − D`, at least `200514` if the actual `D ≤ 50000`. These are conditional
bookkeeping identities, not a new full-machine count or acceptance claim.

## Three proof leaves with narrow ownership

All paths here are proposed new files; accepted files stay fixed.

| Leaf | Exclusive proposed files | Deliverable and dependency |
| --- | --- | --- |
| A: format and original-word semantics | `Cryptids/Compilation/TableSeed/Format.lean` | Bounded row/packet definitions, `W`, fixed-field value lemma, guarded `trNat` recurrence, literal/row reversal identities. Starts independently. |
| B: paid controls and physical primitives | `Cryptids/Compilation/TableSeed/Controller.lean`, `Blocks.lean` | Actual finite allocation/encoding/rows and export correspondence; local fixed-path proofs; compact scans; `read`, `emit`, `finish` contracts on `Frame`. Starts after freezing the small shared format interface; does not depend on A's completed word proof. |
| C: universal composition and chess integration | `Cryptids/Compilation/TableSeed/Correct.lean`, `ChessCodec.lean`, proposed `Cryptids/Chess/Optimisation/FieldTableSeed.lean` | Prefix/phase induction, `packet_reaches`, concrete source/packet identity, protected linking and paid writer/count/equivalence. Can draft semantic invariants against A/B interfaces, but final proof waits for both. |

Root retains acceptance, export/table checks and remote verification. The
first proof check should target A's guarded recurrence and one arbitrary-
prefix field step, while B checks the overlapping one-bit consume block and
the thirteen-write final header. These resolve the strongest semantic and
head-position risks before compiling the full composition. Follow with empty
phases, all four letters, zero/one/max-width fields and a two-row reversal
instance as proof/interface checks. Finite fixtures remain evidence for those
instances; the universal inductions carry the theorem.

## Four source-review passes and remaining obstruction

1. **Protocol:** checked the frozen fixed29 contract against actual
   `build_program`: literal and tag LSB parsers, MSB operands, cons-first words,
   tag-last emission, reverse row order and phase sentinels.
2. **Physical rows:** read `Builder.read/emit/finish` and shared continuation
   construction. Checked overlapping B update, exact scanner exits, three
   consumed left blanks for prepend and seven for cleanup. These are manual
   source calculations, not executed fixtures.
3. **Proof APIs and semantics:** read accepted `Seed.Scan`, `Seed.Blocks`,
   `Seed.ChessCodec`, `SeedLink`, `ReverseInit` and `FieldSeed`; separated
   genuinely generic APIs from 216-state execution lemmas. An independent
   source scout examined the `trNat` prefix route.
4. **Adversarial frame review:** an independent read-only scout checked the
   actual local frame endpoints, blank-window premises, raw-marker exclusion,
   empty-phase delimiter and exact final head. Reviewed allocation sharing
   and numeric correspondence in response to the parent's source review.

The remaining obstruction is the universal proof for the exact paid table,
especially the original `trNat` prefix recurrence and the three framed
physical contracts. The architecture gives these small independent targets;
it does not certify them. Controller feasibility, exact `D`, all-row numeric
correspondence, kernel checking, full source instantiation and acceptance
remain explicit downstream gates.
