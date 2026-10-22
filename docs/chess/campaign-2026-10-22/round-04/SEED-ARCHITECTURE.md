# Next paid-seed reduction: pack the literal program table

Status: source-only reconnaissance, 2026-10-22. No new decoder, measured decoder count, or accepted reduction is claimed. The parent reports that the **998,176-state** three-bit seed machine is accepted after full remote verification, fresh advisory,45hostile metadata controls and portable sealed replay; acceptancecheckpointa2110e2 and final35gatecheckpoint1fa449d are pushed. The retained round03 [pilot summary](../round-03/evidence/pilot-final/unpacked/pilot-summary.json) measures a **114,487-state body quotient**, saving **459,315** body states and giving a prospective total of **538,861** with the existing seed prefix; its Lean certificate pilot remains separate work. Finish that larger measured opportunity first. This leaf read source and retained metadata only, with no local or remote computation, Lean, network, git mutation, or outreach.

The recommended next measurement is a **fixed-width table decoder that reconstructs the existing seed**. It exploits a proved representation fact, rather than assuming useful substring repetition. A self-delimiting packet costs **173,641 bits**, symbolically, against the current 424,156 seed bits. With a new decoder of `D` complete states and one new bridge, the net saving would be **250,514 − D**. A **50,000-state decoder budget** leaves at least 200,514 states of saving; that budget is a decision threshold, not a prediction or measured upper bound. Dictionary, run-length, and general grammar machinery should wait for evidence that their additional saving exceeds their additional control and proof cost.

## 1. The exploitable source structure

[Input.stack_eq_raw](../../../../Cryptids/Chess/Compilation/Input.lean) gives the exact original-order stack:

```text
trList [root] ++ trList (rows.flatMap Node.words) ++ [.consₗ] ++ trList argument.
```

Existing source theorems give 5,952 table rows, root 5,951, 141,042 table symbols, 14 root symbols, and 323 argument symbols. `SourceCertificate.dag_valid` supplies `node.Below i` for every row, so all referenced indices are less than 5,952 and fit thirteen bits. [Node.words](../../../../Cryptids/Compilation/CodeDAG.lean:410) is exactly `[tag,left,right]`, with tags 0–6; unused operands are explicitly zero. Thus **every row fits three tag bits plus two thirteen-bit operands**, including zero fields. The table alone costs `29*5952 = 172608` packed bits versus `3*141042 = 423126` current seed bits: a source-derived gross margin of 250,518 bits, before packet and decoder overhead.

The argument is one wide natural, not a thirteen-bit table operand. Preserve its existing literal letters, as well as the short root prefix. `trNat` is canonical LSB-first binary, `trNat 0 = []`, and `trList` appends `.cons` after each word. These details determine the decoder's order and zero handling; `Runtime.trList_append` supplies compositional rewriting. The output remains the complete original root, table, delimiter, and game. No interpreter representation or chess rule changes.

The old [round01 proposal](../round-01/NEXT-INITIALIZER.md) has now become [Seed.run_seed/seed_reaches](../../../../Cryptids/Compilation/Seed/Expander.lean:417), [ChessCodec.output_eq](../../../../Cryptids/Compilation/Seed/ChessCodec.lean), and [FieldSeed](../../../../Cryptids/Chess/Optimisation/FieldSeed.lean). Reuse those contracts by ending the new decoder at the exact existing three-bit seed, not by proving another thirteen-bit chess codec.

## 2. One concrete packet and decoder

Let `M = [0,1,1,1,1,0]`. Let `pre` be the root's existing seed letters and `post` the argument's existing seed letters. The delimiter is the one `Seed.Letter` corresponding to `.consₗ`. Define the packet:

```text
M ++ [0] ++ M
  ++ Seed.payload post.reverse ++ 000
  ++ rows.reverse.flatMap rowPacket ++ 111
  ++ Seed.payload pre.reverse ++ 000.

rowPacket [tag,left,right] :=
  three LSB-first tag bits ++ thirteen MSB-first right bits
                           ++ thirteen MSB-first left bits.
```

Tags 0–6 are rows; aligned tag 7 (`111`) ends the row phase. The literal phases use existing nonzero codes 1–4 and aligned `000` ends. An operand may contain any thirteen bits, including long runs of ones. Fixed record positions make these data, not terminators. There is no paid 5,952-position row counter or length header.

The controller consumes the reversed argument letters first and prepends each decoded letter to its output. It then prepends the delimiter. For each reversed row it remembers the tag in seven-way control, processes right operand then left operand, and emits the stored tag last. To process a natural word, first emit `.cons`; scan its fixed-width bits from most to least significant, discard leading zeros, and then emit `.bit0`/`.bit1` for every remaining bit. Prepending this emission sequence produces `trNat value ++ [.cons]`, in the required LSB-first order. An all-zero field emits exactly `.cons`. The final reversed literal prefix completes the original stack order.

Only the phase, bit position (at most thirteen), a leading-zero flag, the tag, and a small pending emitted letter need control memory. **Do not retain a thirteen-bit operand as one of 8,192 control values.** The parser, scanning return context, every product of these values, malformed-code behavior, finish control, and success state all belong in `D`. No measured count or generic-compiler bound is supplied here. Prefer a direct named finite controller using the existing `Seed.Control`/`Blocks` style; a compiled graph is acceptable only after counting its full graph/store/bounce/exit allocation.

### Physical tape protocol and its limits

Use the existing guarded-marker geometry, with a new three-bit output writer. At an input boundary, require the complete zipper

```text
Tape.mk'
  (LB (Z gap ++ (Seed.payload out).reverse ++ M.reverse))
  (LB (M ++ unreadPacket)),
gap = 1 + number of raw input bits consumed.
```

The head is B's left guard; `out` is emitted output in its current final order. Both implicit exterior regions are blank. A parser phase and pending output context describe the mathematical remainder of the packet transducer. Output emission writes the new code in `[A+3,A+5]` and the new marker in `[A-3,A+2]`; it moves A left by three without changing the output's right boundary or `gap`. At B=`x`, consuming one raw input bit reads `x+6` **before** overwriting `[x,x+6]` by `[0] ++ M`; new B is `x+1`, and unread input starts at `x+7`. Only then may a scan or another parser operation occur. This one-bit primitive avoids buffering entire operands and preserves the unconsumed suffix exactly.

Scanners must never enter unread raw input. A left scan departs from the cell immediately left of B; a right scan exits on B's right guard and backs up to its left guard. Although raw operands may contain `1111`, output letters use `100/010/110/001`, whose concatenations have no four consecutive ones. The small induction invariants are concrete: rightward word traversal safely maps an entering run at most one to a final run at most one; reversed-word traversal maps an entering run at most two to a final run at most two. Four finite letter cases prove each statement. The marker's zero guard resets the final run. The old thirteen-bit `scan_cell` lemma does not apply to compact output. Reuse `Seed.Scan.Rows`, `run_safe`, `run_safe_fourOnes`, and the framed traversal lemmas, with these new three-bit language lemmas.

When all three phases end, the entire packet has been consumed. Erase B, all work cells, and every consumed input cell; scan to A. If A begins at `a`, overwrite `[a-7,a+6)` with `M ++ [0] ++ M`, preserving payload beginning at `a+6`; the final head is `a-7`. Seven blank cells to A's left supply the extra space. The final blank right exterior supplies the target seed's three trailing zeros. Prove the exact zipper equality using `Seed.mk_append_zeros`; an equality of finite support alone is insufficient. This finish also handles empty `pre`, rows, or `post` without treating blank tape as an implicit arbitrary-length word.

No dictionary, counter, return address, scratch bit, old marker, or raw packet may survive. Physical translation is allowed only through equality of the final relative tape at the specified first seed bit.

## 3. Full state accounting and comparison

For `R` rows, `p = pre.length`, and `s = post.length`, packet length is

```text
K = 13 + (3*s+3) + (29*R+3) + (3*p+3)
  = 29*R + 3*(p+s) + 22.
```

With `R=5952`, `p=14`, `s=323`, this is **173641**, including both markers, gap, and all three stops. The synthesized delimiter is charged in decoder control. Do not also charge it as packet data, or omit its output theorem.

| Allocated component | States |
| --- | ---: |
| Full packet and reverse-writer turn | `K+1 = 173642` |
| Complete new decoder, including terminal/error/control products | `D` |
| New exact-head bridge into existing seed expander | `1` |
| Existing seed expander | `216` |
| Existing exact-head bridge into chess body | `1` |
| Complete chess body | `B` |
| Total | `B + 173860 + D` |

With the current 573,802-state body the total is `747662 + D`. With the experimental 114,487-state body it is `288347 + D`; the latter is conditional on that body's certification. Against either same-body baseline, saving is `250514 − D`. A 50,000-state budget would give at least **200,514** saving and, conditionally, a full quotient composition at most **338,347** states. These are algebraic budgets, not measured results.

| Route | Source-derived or measured opportunity | Decision implication |
| --- | --- | --- |
| Body quotient | **459315 measured**; certificate pilot separate | Complete first. Even deleting the entire remaining 424374-state initializer could not match it. |
| Two-bit letters | `141380` gross payload bits before new framing/control | This report's route beats even that optimistic gross benchmark if `D < 109134`. |
| Five-bit pairs from round01 | `70684` gross seed bits including its proposed framing, before changed control | This report's route beats that benchmark if `D < 179830`. |
| Fixed table packet | `250514 − D` after the new bridge | Require `D ≤ 50000` for a comfortable first implementation budget; no positive saving if `D ≥ 250514`. |

Constructor arity is the closest optional improvement within this same packet family. If `A` counts actual child operands, omit the fields whose `Node.words` value is fixed zero, reconstructing their `.cons` from the already-read tag. Replace `29R` by `3R + 13A`, saving `13*(2R-A)` data bits. Its histogram and changed controller census remain unmeasured. Keep fixed29 as the first auditable baseline; choose arity only after a bounded comparison shows that its extra branching/proof work is worthwhile.

An operand dictionary is a later measured decision, not a premise. For `m ≤ 2^d` dictionary entries, a self-delimiting dictionary of records `1 ++ value13`, followed by `0`, costs `14m+1` bits. Each of `A=2R` operand positions uses one flag plus either `d` index bits or thirteen literal bits. If `c` positions hit, additional data saving is exactly

`c*(13-d) - A - (14*m+1)`.

Subtract all added lookup/parser/cleanup controls and any changed framing before calling this net saving. The dictionary must live on tape and be erased; indexed access and persistent dictionary frames are new proofs. One census of `d ∈ {4,6,8}` is enough to rank it. Topological child bounds do not establish useful frequencies or repeated blocks. Whole-row duplication is also not proved by `SourceCertificate.dag_valid`; `CodeDAG.compile_unique_row` concerns a different identified construction unless an equality is supplied.

Run-length coding would need a measured run histogram and charged length delimiters/counters. The thirteen-bit zero padding was already removed by the accepted seed, so it is unavailable as a new saving. General grammar compression additionally pays productions, terminal/reference tags, indices, an expansion stack, stack cleanup, and a well-founded rule-order proof. Rebuilding the literal table from higher-level chess source requires exact compiler/interner output equality. None currently has a simpler source-backed benefit than packing the existing triples.

## 4. Exact reusable proof boundary

The new machine's theorem should quantify over **all finite** literal prefixes/suffixes and finite row lists whose tag fits three bits and operands fit thirteen, not just one measured chess packet. It need not assume table evaluation or chess termination. Let `letters(pre,rows,post)` denote the exact original-order stack letters with each row's three canonical natural words and the delimiter. Required interface:

```text
decode_reaches pre rows post :
  Reaches (step decoder)
    ⟨0, Tape.mk₁ (packet pre rows post)⟩
    ⟨decoderDone, Tape.mk₁ (Seed.seed (letters pre rows post))⟩

decoder_terminal : ∀ bit, decoder.transition decoderDone bit = none.
```

Required proof chain:

1. Prove fixed-width MSB trimming produces `reverse (trNat n)`, including zero, powers of two, and the maximum thirteen-bit value. Prove the seven tag cases. This is an arithmetic/list lemma independent of the TM.
2. Prove packet parsing and emitted-list order, with aligned stops and complete consumption. The mathematical transducer emits `letters.reverse`; physical prepending yields `letters`. Relate each parser/word phase to the full zipper invariant above.
3. Prove arbitrary-frame bit consumption/B overlap, three-bit prepend/A rewrite, guarded payload scans, and exact complete cleanup. A finite input-word measure, bounded phase transitions, and bounded output operations establish termination; each scan is bounded by explicit marker-delimited lists. Reachability is sufficient, so an enormous exact runtime polynomial is unnecessary.
4. Instantiate with `Input.stack_eq_raw`, `SourceCertificate.rows_size/dag_valid`, and `Input.root_symbols/argument_symbols`. Prove the **source-defined** packet decodes to `Seed.ChessCodec.letters`; a JSON reconstruction or hash cannot replace this equality.
5. Set `inner = SeedLink.link Seed.machine Seed.done body` and `outer = SeedLink.link decoder decoderDone inner`. `SeedLink.link_reaches/link_haltsOn`, `Seed.seed_reaches`, `Seed.ChessCodec.output_eq`, and the same-body input theorem compose without modifying the old expander. Each link charges one state and two runtime steps and preserves the exact relative head.
6. Apply `ReverseInit.Schedule.initialise (OpenEvolveWide.schedule packetBits) outer`, reusing `schedule_correct`, `schedule_size`, and `initialise_halts`. Runtime includes packet-writing, decoder work, old expansion, and four bridge steps. Numeric state offsets instead use the two allocated decoder sizes; never identify the two counts.

Export every allocated row, including unreachable parser variants and malformed-input controls. Valid-packet correctness is the theorem; malformed packets need not all reject, but their behavior must be fully defined and paid. Only the designated terminal success state may be patched by the new linker. Existing `SeedLink` protected-prefix and arbitrary-tape body embedding proofs supply this contract.

## 5. Bounded next remote decision test and stops

Root owns all later execution and implementation. The next experiment should be one pinned remote packet census, followed only if useful by one bounded decoder pilot:

1. **Packet census, at most 600 seconds / 4 GiB:** read the frozen source table/root/argument; independently encode and decode the three-phase packet. Retain exact packet bytes, length, original stack/seed identities and hashes, source manifest, row/tag/operand histograms, and all failure output. Expected length is 173641; it is not an observed measurement here. Check byte-for-byte equality with the entire existing `Seed.ChessCodec.bits`, not only final thirteen-bit support. Report arity savings and the three small dictionary scores from the formulas above; do not start a general compressor search.
2. **Controller feasibility, separately at most 600 seconds / 4 GiB:** construct one explicit complete controller only after packet equality passes. Count all `D` states and `2D` rows before any reachability reduction. Report `250514-D`, the complete totals, and every category of parsing/return/scanning/cleanup/error control. Stop if `D>50000`; retain the result for root to reconsider, rather than launch automatic optimizer rounds. A machine that stores full operands in control fails the intended architecture even if a tiny fixture passes.
3. **Independent finite checks:** empty phases and rows; all seven tags; zero operands, 1, powers of two and adjacent values, 4095/4096, and 8191; all four literal letters; consecutive maximal operands containing `1111`; boundaries between literal/row/root phases; translated starts. Check emitted order, all cells, blank exteriors, and exact final head. Inject a wrong stop/tag/field bit, omitted zero-word `.cons`, wrong B shift, leftover marker, and one-cell head error; the independent equality/certificate check must detect the corruption. Do not assume every corrupted packet itself reaches a rejection state.
4. **Proof gate before acceptance:** remotely kernel-check the universal decoder and exact source packet identity, compose both links and the paid writer, audit axioms, and compare every complete-machine row with the independent export. Reuse the old universal expander theorem instead of replaying its quadratic full chess startup. Finite fixtures cannot discharge a blocked universal invariant.

Stop this route if exact input reconstruction needs a changed interpreter/table, if any framing/control is missing from the census, or if the required complete-tape proof cannot be stated without an unproved locality assumption. A timeout is a failed bounded pilot, not a saving. Consider arity/dictionary work only after this baseline is certified or after a concrete baseline obstruction makes another route preferable. Do not displace the already measured body quotient pilot with this unmeasured proposal.

## Four source-review passes

1. **Complete reconnaissance:** reread the fixed round01 proposal, current seed/codec/link contracts, literal input structure, `Node.words`, source table validity, and retained quotient metadata. Identified the table's guaranteed word-width redundancy.
2. **Domain pass:** fixed the LSB/MSB reversal, wide argument exception, all-zero words, delimiter emission, and tag-first stop framing. Independent source review confirmed exact packet length and output order.
3. **Defect pass:** rejected an 8,192-value control register, raw-input marker scans, an implicit row counter, free dictionary data, and uncharged bridges. Fixed B's one-bit overlap, three-bit output language obligations, final thirteen-bit header window/head, and complete blank exteriors. An independent tape scout confirmed the geometry and symbolic count.
4. **Polish/evidence pass:** separated established source counts, retained measured body savings, proposed packet arithmetic, and unknown `D`; compared full net budgets with fixed packing; specified bounded remote decisions and failure criteria. This report earns source-architecture credit only. No new proof, execution, measurement, or accepted machine is claimed.
