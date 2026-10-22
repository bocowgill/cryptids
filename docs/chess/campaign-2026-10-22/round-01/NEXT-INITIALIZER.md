# Next initializer route: three-bit seed and a fixed expander

Status: source reconnaissance only, 2026-10-22. Finish acceptance of the selective-return candidate first. This document supplies a proposed protocol, symbolic cost bounds, and the next remote experiment; it does not supply a new machine, a verified decompressor, or a measured state saving. No Lean, Lake, LSP, Probe, native compilation, model, generator, fixture, or remote job was run for this report.

Recommend retaining the accepted chess body and its exact thirteen-bit input contract, while replacing the 1,837,941-state straight-line writer by a reverse writer for a three-bit-per-stack-symbol seed plus a fixed binary expander. The proposed seed has `3 * N + 16` bits. For `N = 141380`, the complete candidate would have

`body.states + 424157 + D + H`

states, where `D` is the entire compiled expander and `H` is additional handoff control. Thus the initializer saves `1413784 - D - H` states. These are arithmetic consequences of the proposed format, not measurements. The strongest immediate obstruction is the missing universal expansion-and-cleanup proof and certified expander/body linker; the existing codec round trip and initializer theorems do not supply either.

## 1. Actual source structure

The relevant chain is `Input.stack = Tape.input`, then `FieldAware.sourceInput = TM2to1.trInit .main Input.stack`, then `FieldCompiler.Codec.input`, then `Binary.encodeSymbol`. See [Input.lean](../../../../Cryptids/Chess/Compilation/Input.lean), [Tape.lean](../../../../Cryptids/Chess/Compilation/Tape.lean), and [FieldAware.lean](../../../../Cryptids/Chess/Optimisation/FieldAware.lean).

`TM2to1.trInit` in Mathlib's `StackTuringMachine.lean:486` reverses the stack, puts every symbol only in `.main`, and sets the bottom marker on the first resulting cell. The other three stacks are absent. Empty input has one marked blank source cell. `FieldAware.sourceInput_length`, `binaryInput_length`, and `bits_size` give the existing nonempty chess counts `N = 141380` and `13 * N = 1837940`.

The full stack contains the root, all table words, one `.consₗ` table delimiter, and the packed initial game. `Input.stack_eq_raw` exposes the order. `RuntimeWire.rawInput` and Mathlib's `trList` show that the natural-word parts use `.cons`, `.bit0`, and `.bit1`; only the inserted delimiter needs `.consₗ`. The full four-symbol alphabet must still be handled. No chess answer, reachable-state assumption, or altered interpreter input is needed.

`FieldReturn.symbolCode` maps these four present symbols to 1, 2, 3, 4. `FieldBinary.encodeWord` uses least-significant bit first:

| Stack symbol | Existing main-field code |
| --- | --- |
| `.consₗ` | `100` |
| `.cons` | `010` |
| `.bit0` | `110` |
| `.bit1` | `001` |

The complete output cell is that triple followed by nine empty-stack bits and one marker bit. The marker bit is one only on the first cell. This is determined by [FieldReturn/Certificate.lean](../../../../Cryptids/Compilation/FieldReturn/Certificate.lean), [FieldBinary/Codec.lean](../../../../Cryptids/Compilation/FieldBinary/Codec.lean), and [FieldCompiler/Codec.lean](../../../../Cryptids/Compilation/FieldCompiler/Codec.lean).

## 2. Concrete candidate tape protocol

Let `C(L)` concatenate the existing three-bit main-field codes in the **original stack order**, and let `E(L)` concatenate thirteen-bit cells with every marker false. Propose the paid seed

```text
011110  0  011110  C(L)  000
   A    gap    B            end
```

Each guarded marker has six bits. The explicit gap has one bit; the aligned end code has three. The seed therefore costs `3 * L.length + 16` bits even though its final three zeros could be omitted from its physical support. Charge them in the first version. The existing reverse writer costs one state per seed bit plus its final rightward turn and enters the expander at the first bit of A.

Source inspection gives the marker argument to formalize: a valid three-bit record has at most two consecutive ones; the only record ending in one is `001`; the longest following initial run is `11` in `110`. Thus concatenated records have at most three consecutive ones. Unmarked expanded cells have ten trailing zeros, so they cannot introduce a run of four either. Zero guards prevent marker/data concatenation from introducing another candidate marker. A directional scan for four consecutive ones can therefore locate A or B without storing a length or inspecting the entire input in finite control. This is a proof obligation, not an existing Lean theorem.

Use mathematical coordinates relative to the original seed start only in the proof. They are not runtime counters. At the loop boundary after `i` symbols, let `L = P ++ R`, with `P.length = i`. Require the following complete tape partition and the head on the left zero guard of B:

| Region | Start coordinate | Contents / length |
| --- | --- | --- |
| Left exterior | below `-13*i` | all zero |
| A | `-13*i` | `011110`, length 6 |
| Output | `6 - 13*i` | `E(P.reverse)`, length `13*i`, ending at coordinate 6 |
| Cleared gap | `6` | zeros, length `1 + 3*i` |
| B | `7 + 3*i` | `011110`, length 6 |
| Unread seed | `13 + 3*i` | `C(R)`, length `3*R.length` |
| End and right exterior | `13 + 3*L.length` onward | all zero, including the three charged end bits |

The proposed iteration is fully finite control:

1. From B, read the following three bits and retain the present stack symbol in finite control. The valid-input invariant permits only codes 1–4 or the aligned `000` end. Reading must finish **before** moving B: the new six-bit marker overlaps both the old marker and the consumed record.
2. For a present symbol, advance B exactly three cells. Erase the old marker's first three cells, then install B in the six-cell interval starting at old `B + 3`; the record just read is overwritten, and the next unread record begins immediately after the new B. These are bounded local writes, including restoration of both zero guards.
3. Depart to the left of B and scan left through the cleared gap and already expanded output to A. The current symbol remains in explicit finite control during the scan. Skip the source marker before starting the scan, so it cannot match itself.
4. If old A starts at `a`, the next output cell belongs in `[a - 7, a + 6)`, immediately before the old output. Install the new A in `[a - 13, a - 7)`. Together these writes replace the old A and use thirteen previously blank cells to its left. Emit the retained three-bit code followed by ten zeros. The new expanded output is `E((P ++ [symbol]).reverse)`; no unread seed is touched.
5. Depart to the right of new A and scan right to B, restoring the loop boundary and head exactly. Only then invoke the next iteration.

The ghost measure `R.length` decreases. Scans are bounded by the two marker positions; local rewrites have fixed length. All temporary configurations inside a local rewrite must have explicit finite contracts; marker uniqueness is required at scan boundaries, not assumed while a marker is partially overwritten.

At `000`, erase B completely, scan left to A, and erase A completely. With the head then at the first output bit, write one at offset 12 and return to that same first bit. For nonempty input, this creates the unique bottom marker. For empty input, the cleared tape becomes the single marked blank source cell required by `trInit []`, so the same finishing operation can cover the empty case. No seed, marker, counter, or work bit may remain elsewhere.

The final target is exactly

`Tape.mk₁ ((Codec.input (TM2to1.trInit .main L)).map Binary.encodeSymbol)`.

The output has moved physically left. This is permitted: `FieldReverse` already specifies the relative zipper and explicitly does not restore a distinguished physical origin. The first output bit, the exterior blankness on both sides, and all thirteen bits of every cell remain mandatory.

## 3. Reusable proof/compiler APIs and missing interface

Use `ReverseInit.Schedule.initialise (OpenEvolveWide.schedule seed) linkedBody` for the paid seed. Its `initialise_run`, `initialise_halts`, `step_embed`, and `transition_body` already expose exact execution and every body row. `Init.executeList_append` composes bounded tape operations.

`FieldBinary.Routine` provides certified fixed read/write/move trees (`run_execute`, `result_exit`, `run_lift`); `Fields` supplies `read3_execute`, `writeAt_execute`, `written_nth`, `written_outside`, `shift_left_nth`, `shift_right_nth`, and `tape_ext_nth`. Use these to prove local marker updates and their frames. A `Routine` is a finite tree and its exits are charged halting controls: it is not an unbounded expander or a free subroutine/return mechanism.

For the loop, use a small Boolean TM1 graph via `BoolGraph`/`LazyGraph`: syntax children descend, while goto entries may cycle. `CompactPost` and ordinary `Binary.compile` provide a conservative existing backend with exact tape-preserving semantics. With `n` graph nodes and `k` store values, its entire allocation is

`D = 2 * (1 + n*k)`.

If the raw `LazyGraph` backend is easier for the first proof, charge `D = 2 * (1 + (n+1)*k)` instead. Every node/store pair, all main and bounce controls, unused raw inputs, success/failure controls, scan states, parser states, repositioning, marker updates, and cleanup are included. Keep the current chess body as a separate unchanged block; do not multiply it by the expander's store count. A direct binary routine can eventually improve D, but no such count is claimed here.

`CompactPost` merges all halted stores into one halt control. Reserve that control for successful completion: give unused parser codes 5–7 an explicit nonterminal error loop, whose states remain in D. Otherwise a halt-to-body linker would also turn a malformed-seed failure halt into body entry. The requested correctness theorem concerns valid seeds; separate failure halts would require a separate success port or a different backend and fresh accounting.

A new linker is needed. Its proposed interface accepts a binary expander `M : Machine D 2`, a designated terminal success control `done`, the proof `∀ bit, M.transition done bit = none`, an exact finite run from the seed to `⟨done, targetTape⟩`, and the existing `body`. Allocate all `D` expander states, one fresh bridge, and all body states. Preserve expander rows except at `done`; replace that row by a preserving right move to the bridge. The bridge preserves its scanned bit and moves left into body state zero. This charges `H = 1` additional state and two runtime transitions, and restores the exact head and tape. The already allocated `done` control is still paid.

Prove a protected-prefix lifting lemma: the original expander run can be copied into the linked machine up to its first arrival at `done`; it does not require agreement at `done` after arrival. Its terminal-row assumption excludes earlier visits on a longer successful run. Separately prove the body embedding commutes with every body transition and missing transition, following `ReverseInit.Schedule.step_embed/respects`. Compose finite reachability with `StateTransition.reaches_eval` and the body simulation to recover both halting directions. `LocalCertificate.Rows` can certify independent numeric rows after a construction exists; it cannot itself prove the new tape-changing algorithm.

The global proof must quantify over all finite `L : List Γ'` and every integer tape coordinate, including negative coordinates and the blank tail. Establish the partition above, prove the scan and rewrite lemmas, then use `Fields.tape_ext_nth` with `Codec.bitInput_getI`, `mk₁_nth_nat`, and `mk₁_nth_neg` to identify the final tape. A finite fixture or a local codec round trip is insufficient.

Runtime steps and state allocation now differ. This shuttle has quadratic startup time in `L.length`; the full chess prefix is unsuitable for naive step-by-step replay. Prove a terminating finite path (or a symbolic step-count theorem) by induction and use it in `initialises`. Do not reuse `runFrom machine prefixStates` merely because it was valid for the old straight-line writer.

## 4. Complete symbolic count and stronger alternatives

For the recommended format:

| Item | Charged states |
| --- | --- |
| Three-bit payload | `3*N` |
| Two guarded markers, gap, and end triple | `16` |
| Reverse-writer turn | `1` |
| Full expander, including all entry/exit/cleanup controls | `D` |
| Additional exact-head bridge | `H` (the proposed linker uses 1) |
| Unchanged complete body | `B` |
| Total | `B + 3*N + 17 + D + H` |

Using the accepted reverse body's `B = 1066682` gives `1490839 + D + H`. Using the selective-return candidate's `B = 573802`, only after its acceptance, gives `997959 + D + H`. Saving more than one million initializer states requires `D + H < 413784`. A complete sub-million-state selective-body machine would require `D + H < 2041`. Neither condition has been established by a census or implementation.

Three bits are not an information-theoretic minimum. The alphabet has four symbols, and the one `.consₗ` delimiter is structurally isolated. For example, three two-bit common-symbol codes plus an escaped delimiter/end can reduce the unframed payload toward two bits per symbol. But arbitrary two-bit data can contain the proposed boundary marker, and zero codes collide with the blank exterior. Its framing and scanner cannot be inherited without a new argument.

A more controlled later option packs pairs into five-bit nonzero words (16 pair values plus zero as end). For this even chess length, its payload is `5*(N/2) = 353450` bits, symbolically 70690 fewer than the three-bit payload. A guarded six-one marker is a plausible replacement: codes 1–16 have at most five consecutive ones across record boundaries. With two eight-bit markers, one gap bit, and one five-bit end word, the seed format would cost `5*(N/2) + 22`; the gain over the recommended seed is 70684 bits before changed D/H. It needs a pair decoder, more stored/control variants, odd-length handling for a universal theorem, and a new marker proof. Count the expanded compiler product before choosing it. Larger batches and dictionary/general-purpose compression add further proof and control costs without a current measurement. They are not the first route.

## 5. Exact next remote census/experiment

No initializer pilot target currently exists in `.github/workflows/chess_goal_20261022.yml`; its census is a body-return census. Do not label that result evidence for this expander. After the current full candidate is accepted, add one explicit remote-only initializer pilot target, pinned to its source commit, rather than execute any of this locally.

The first remote target should do exactly these tasks:

1. Census the frozen `Input.stack`, `TM2to1.trInit .main Input.stack`, and `FieldAware.bits`. Retain the symbol histogram, reversal/marker positions, non-main-field support, exact seed length, seed bytes/hash, and equality of an independently decoded seed with the entire existing 1,837,940-bit target. Expected source-derived predicates are: nonempty length 141380, only main occupied, one bottom marker, and original literal table/root/game preserved. The histogram and hashes are measurements still to obtain.
2. Build only the generic three-bit protocol and linker pilot. Export every transition on both symbols and its graph/store/main/bounce/bridge inventory; compute the exact `D`, `H`, and full formula `B + seedLength + 1 + D + H`. Report a pass/fail against `D + H < 413784` and separately the stretch bound `D + H < 2041`. No padded or unused states may be omitted from that census.
3. Run independent protocol and binary-row models remotely on empty input, all four singleton symbols, all ordered pairs and triples, and longer boundary cases: repeated `.bit1` (`001`), repeated `.bit0` (`110`), alternating `.bit1/.bit0` (the maximum three-one boundary), symbols whose codes end in zero, `.consₗ` at both ends, and the actual final stack symbol. Check every nonblank cell plus both blank exteriors and the head, with translated starting coordinates as well as origin zero. Specifically inspect B's overlapping six-bit rewrite, A's thirteen-cell shift, marker bit 12, and the two-step linker return. These are required fixtures, not executed results.
4. Kernel-check the generic finite-input expansion invariant, exact successful-exit tape, protected-prefix linker, universal body embedding, source-format identity, and final chess halting theorem. Preserve an axiom audit, complete numeric-row comparison, source manifest, negative controls that corrupt a marker shift/output bit/bridge direction, and the unmodified target-bit hash. A deliberately wrong head or one residual marker must fail. Use the universal proof and full static input equality for the large chess input; do not require quadratic runtime replay as the acceptance oracle.

The retained result must distinguish source-derived expected values, measured finite counts, executed fixtures, and kernel-checked theorem claims. Only then decide whether pair packing or a smaller expander backend is worth another round.

## Four review passes

1. **Complete reconnaissance:** traced the actual stack, reversal, marker, four-symbol alphabet, thirteen-bit codec, paid initializer, and unchanged body contract. Proposed a finite seed/expander route and a remote-only follow-up.
2. **Domain review:** replaced a vague “three-bit decompressor” with two guarded movable markers and an explicit coordinate partition. Kept original stack order in the seed so prepending reproduces `trInit`'s reversal. Included the empty-input marked blank cell.
3. **Defect review:** accounted for B's overlapping rewrite, guards, endpoint code, every control and return state, exact-head handoff, cleanup on both infinite sides, and state-count/runtime-count separation. Identified the quadratic replay obstruction and the fact that two-bit compression invalidates the simple marker argument.
4. **Polish and evidence review:** re-read all formulas and source contracts, corrected the routine theorem name to `run_execute`, checked the 16-bit seed overhead and linker accounting symbolically, separated existing theorems from new obligations and remote measurements, and specified the pilot's independent negative controls. Independent source review found no geometry, orientation, empty-case, or bridge-count defect, and identified CompactPost's merged success/failure halt; the report now sends invalid parser codes to a charged nonterminal loop. No remaining source-report defect was identified after this repair; all implementation, kernel verification, and measurement obligations remain future work, as required by this scout's scope.
