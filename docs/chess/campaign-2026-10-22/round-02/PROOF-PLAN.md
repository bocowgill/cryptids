# Proof plan for the exact 216-state direct seed controller

Status: source-only architecture, 2026-10-22. This is not a Lean proof or a new accepted chess machine. The accepted complete machine remains **2,411,743 states**. The retained remote pilot [summary](evidence/pilot-02/unpacked/pilot-summary.json), run `39788561190` at `619a4cde330b15ea16bc1cdbdea7f581b4658629`, reports 216 controller states, 432 rows, 465 positive fixtures, and 14 rejecting negative controls. Its complete symbolic composition is 998,176 states, including the proposed one-state bridge. The successful finite pilot does not establish the universal theorem below. All computation and Lean verification for this plan remain remote; this leaf only read sources/retained metadata and wrote its two owned Markdown files.

Use the direct controller in [pilot.py](../../../../scripts/chess_seed_20261022/pilot.py), with the exact state allocation and actions described in [CONTROLLER.md](CONTROLLER.md). Prove its operation on `Tape.mk'`/`ListBlank` zippers. The moving head is already the zipper origin, so global integer coordinates are unnecessary for the loop proof. Keep the coordinate description as an independent diagnostic model, not a second invariant to maintain. The central obligations are a single iteration theorem, a finishing theorem, and their induction over unread symbols.

## 1. Freeze the definition and public interfaces first

The agreed alphabet and format are:

```text
Letter       := Fin 4                 -- represented value is letter.val + 1
Bit          := Fin 2
word s       := the existing LSB-first code for s.val + 1, length 3
Z n          := List.replicate n 0
cell s       := word s ++ Z 10
payload xs   := xs.flatMap word
output xs    := xs.flatMap cell
marker       := [0,1,1,1,1,0]
seed xs      := marker ++ [0] ++ marker ++ payload xs ++ Z 3
```

Thus `word 0/1/2/3` is respectively `100/010/110/001`. The current draft [Seed/Format.lean](../../../../Cryptids/Compilation/Seed/Format.lean) defines words arithmetically through `letterBit` and exposes the four concrete equations and word/cell/payload/output lengths. It also freezes `loopTape` and `markedOutput`, the latter the offset-twelve write defined below. Generic controller and scanner proofs depend only on the small tape/field modules; import `SharedModel`, the complete field compiler, and the chess input only in the final codec/assembly layer.

Use the current [Seed/Controller.lean](../../../../Cryptids/Compilation/Seed/Controller.lean) draft unchanged as the controller interface: `Control` has one constructor per fixed/scanner family, four carry values only in `shiftB`, `seekA`, and `prepend`, and `parse (position : Fin 7)` names the seven parser nodes. `encode : Control → Fin 216` and `decode : Fin 216 → Control` follow the Python allocation order; `controlEquiv` packages their inverse laws. `controlRow` defines named binary rows, and `machine : Machine 216 2` decodes its control and encodes its destination. The proof-facing row lemma is `transition_encode`; `terminal_done`, `transition_error`, and `transition_none_iff` expose the exits. These are draft source declarations, not a claim of remote verification. This is a finite row definition, not a new compiler or a runtime block interpreter.

The numeric ranges to match are source-derived and must be kernel-checked against the retained table:

| Family | Numeric range / formula |
| --- | --- |
| entry | `0..6` |
| loop.skip_b | `7..12` |
| parser | `13..19`, ordered by depth, then partial value |
| carry `s : Fin 4` shift / seek / prepend | base `20 + 32*s.val`; lengths `10,4,18` in that order |
| common.write_a / skip_a / seek_b / back_b | starts `148,154,161,165`; lengths `6,7,4,5` |
| finish.to_b_end / erase_b / seek_a / erase_a | starts `170,174,180,184`; lengths `4,6,4,6` |
| finish.to_marker / set_marker / back_head | starts `190,202,203`; lengths `12,1,11` |
| done / error | `214 / 215` |

Publish `entry = 0`, `loop = 7`, `done = 214`, both missing rows at `done`, and the preserving rightward self-loop at `error`. No unused or malformed-input rows disappear. The root's independent numeric export must compare every state and both symbols with `controller-rows.jsonl`; a generated literal reference vector may additionally be compared by a kernel theorem. An export/hash match is supplemental to the theorem that these are the rows used in the semantic proof.

Do not instantiate a separate `FieldBinary.Routine.machine` for each block: its paid terminal controls and tree allocation do not match this shared 216-state controller. Instead prove block contracts directly against the global machine's row equations. The current [Seed/Blocks.lean](../../../../Cryptids/Compilation/Seed/Blocks.lean) draft does this with `validPath`, `run_path`, `FixedBlock`, and `run_block`: a checked finite action list and its path of existing controls conclude

```text
runFrom controller actions.length (entry, tape)
  = some (target, Init.executeList actions tape).
```

The target is the already allocated next state, with no extra transition. `run_path` is an induction on the action list; `run_block` specializes it to `blockPath`, `blockEntry`, `blockExit`, and `blockActions`. The scanner draft already has an internal run-composition proof; a shared `run_add` lemma can expose that elementary fact without importing all shared-interpreter declarations solely for `FieldReturn.run_add`. `parse_run`, `parse_letter_run`, and `parse_stop_run` are the draft three-step contracts, with arbitrary `ListBlank` frames and preserved bits. Invalid codes enter `error`; the parser preserves tape contents but moves the relative head by three. All finite reduction/kernel decisions run remotely.

## 2. The exact loop invariant

Write `LB xs = ListBlank.mk xs` and `xs ▷ T = ListBlank.append xs T`. These are document abbreviations for existing APIs. Let `out` be symbols already emitted **in target order**, and `todo` the unconsumed original-order stack. Set `g(out) = 1 + 3*out.length`. The canonical invariant fixed with the root is

```text
loopTape out todo :=
  Tape.mk'
    (LB (Z (g out) ++ (output out).reverse ++ marker.reverse))
    (LB (marker ++ payload todo ++ Z 3)).
```

The machine control is `loop.skip_b.00` and its head is B's left zero. `Tape.mk'`'s left list is nearest-cell first; its right list includes the current cell. Consequently this expression records the whole tape, both markers, every cleared cell, all output, and the complete unread suffix. The implicit exterior beyond each `LB` list is blank. It is stronger than a bounded support check.

For the invariant connecting to the original input `L`, retain the purely mathematical equation `out.reverse ++ todo = L`. The update is

```text
(out, s :: rest)  -->  (s :: out, rest).
```

There is no runtime counter or list. `out` and `todo` describe the actual tape; their lengths occur only in the proof. Below, `LoopTape` is a display alias for the frozen declaration `Seed.loopTape`. A private helper `I out todo gap` replacing `g out` by arbitrary `gap : Nat` is useful for framed local statements; keep `loopTape` as the public specialization. The helper update changes `gap` to `gap+3`.

Seven entry moves establish `LoopTape [] L` from `Tape.mk₁ (seed L)`. The left side after those seven moves is `LB ([0] ++ marker.reverse)`, and the right side starts at the second marker. This is a direct zipper calculation, including empty `L`.

## 3. Scanner lemmas without global marker uniqueness

Parameterize a scanner theorem by the **four existing state IDs**, direction `d`, exit ID, and the exact row equations:

```text
scan r, bit 0  -> preserve 0, move d, scan 0
scan r, bit 1  -> preserve 1, move d, scan (r+1), if r<3
scan 3, bit 1  -> preserve 1, move d, exit.
```

This one theorem serves the four carry left scanners, the finishing left scanner, and the common right scanner. It adds no machine or states. The current [Seed/Scan.lean](../../../../Cryptids/Compilation/Seed/Scan.lean) draft uses exactly this interface through `Rows`, `scanWord`, `Reads`, `run_safe`, and `run_safe_fourOnes`. Prove local segment contracts with arbitrary surrounding `ListBlank` frames and combine them by list induction. The scanners traverse only the output, the blank gap, and the relevant marker; they never scan the unread compressed payload. A theorem about marker uniqueness over all integer coordinates is therefore unnecessary.

The scanner draft uses ordinary `Tape.mk'` for the right-inclusive view and `mkLeft front back = ⟨front.head, front.tail, back⟩` for the left-inclusive view. In either direction a preserving step transfers `front.head` to `back` and takes `front.tail`. `reads_right`/`reads_left` and `shift_right_prefix`/`shift_left_prefix` give the finite-word contracts from the tape APIs. Traversing a finite front word `w` transfers `w.reverse` to the back frame. These views are proof notation only; the actual machine remains unchanged.

For the right scanner, prove that `cell s = word s ++ Z 10` takes exactly thirteen steps from `run0` to `run0`, on arbitrary frames. Four finite letter cases suffice. Prove the zero-run lemma, then the terminal four-ones lemma: from `run0`, exactly four preserving moves reach the exit. In the real tape B's left guard zero comes immediately before those four ones. Starting at output, the scanner therefore exits on B's **right guard** after

`13*out.length + gap + 5`

steps. The existing `common.back_b` block takes another five steps to B's left guard. Its combined zipper contract is

```text
Tape.mk' leftFrame ((output out ++ Z gap ++ marker) ▷ rightFrame)
  -->
Tape.mk' ((Z gap ++ (output out).reverse) ▷ leftFrame)
         (marker ▷ rightFrame),
```

with total time `13*out.length + gap + 10` and final control `loop`.

**Leftward reset is the delicate point.** A reversed whole cell is `Z 10 ++ (word s).reverse`. It does not always finish in `run0`: `100` leaves a trailing run of one, and `110` leaves two. Do not assert a false per-cell reset lemma. Prove this finite-list regrouping instead:

```text
Z gap ++ (output out).reverse ++ [0]
 = Z (gap+1)
   ++ out.reverse.flatMap (fun s => Z 9 ++ (word s).reverse ++ [0]).
```

Each shifted thirteen-bit block starts and ends in zero and returns `run0` to `run0`. The last borrowed zero is A's right guard; the intermediate borrowed zeros belong to the next cell's zero padding. Prove the identity once by list induction and `reverse_append`/`replicate_add`, and prove the four finite shifted-cell contracts on arbitrary frames. Then append the same four-ones exit lemma. This fixes the boundary issue without adding a second scanner invariant for residual run counts.

The useful framed left-scan statement is:

```text
start = (Tape.mk'
          ((Z gap ++ (output out).reverse ++ marker.reverse) ▷ leftFrame)
          rightFrame).move left

after gap + 13*out.length + 5 preserving scanner steps:

Tape.mk' leftFrame ((marker ++ output out ++ Z gap) ▷ rightFrame).
```

The final head is A's **left guard**, and the chosen exit is the carry prepend block or finishing erase block. The arbitrary frames establish that scans preserve all cells, including everything beyond the finite tape segment.

## 4. Fixed rewrites, iteration, and complete cleanup

Use `Init.executeList` together with `Tape.write_mk'`, `Tape.move_left_mk'`, `Tape.move_right_mk'`, `ListBlank.head_cons`, `tail_cons`, `cons_mk`, `append_mk`, and `append_assoc`. Reduce only the bounded explicit word under arbitrary frames. Keep `payload todo` and `output out` opaque unless a list induction intentionally exposes one cell. This avoids simplifying the complete chess input or generating global integer case splits.

Three representative fixed-block contracts remove the geometric uncertainty:

* **B after parsing:** the parser has read all three bits and stands at old B+9. From `Tape.mk' (((marker ++ word s).reverse) ▷ leftFrame) rightFrame`, the ten-state `carry.shift_b` block ends at `(Tape.mk' leftFrame ((Z 3 ++ marker) ▷ rightFrame)).move left`. The first three old B cells are erased and its six-bit replacement overlaps the consumed word. No unread bit is overwritten. The word is retained by the carry branch before this rewrite begins.
* **Prepend and shared A construction:** at A's left guard, start from `Tape.mk' (Z 13 ▷ leftFrame) (marker ▷ rightFrame)`. The carry prepend, common marker writer, and common skip take `18+6+7 = 31` steps and end at `Tape.mk' (marker.reverse ▷ leftFrame) (cell s ▷ rightFrame)`, control `common.seek_b.run0`. The finite thirteen blank cells are supplied by the blank left exterior in the global invariant. This includes A's replacement and the exact first-output-bit head.
* **Finishing B removal:** after reading `000`, the four left moves and six zero writes end at `(Tape.mk' leftFrame (Z 9 ▷ rightFrame)).move left`. Here the three end bits were already zero. At the global finishing boundary `rightFrame` is blank; all B/end cells can therefore be absorbed into a blank tail after the left scan.

The complete iteration combines skip-B (6), parser (3), B rewrite (10), left scan, prepend/A construction (31), right scan, and back-B. For `I out (s::rest) gap` its exact source-derived step count is

`26*out.length + 2*gap + 81`,

and it reaches `I (s::out) rest (gap+3)`. With the canonical gap, publish:

```text
loop_once:
  runFrom controller (32*out.length + 83) (loop, LoopTape out (s::rest))
    = some (loop, LoopTape (s::out) rest).
```

Finish at `I out [] gap` by parsing the end code, erasing B, scanning left, and erasing A in six rightward writes. Before the marker-setting block, the tape must simplify to **exactly** `Tape.mk₁ (output out)`. Prove the small quotient lemmas `LB (xs ++ Z n) = LB xs`, `LB (Z n) = LB []`, and their `append` consequences using `BlankExtends`/`Quotient.sound`, or `ListBlank.ext` with `nth_mk`. These remove only blank tails: never rewrite `Z n ▷ arbitraryFrame` as `arbitraryFrame`. Thus the complete exteriors are checked by the zipper equality, rather than inferred from a finite visited interval.

The frozen `Seed.markedOutput out` is the mathematical finishing operation

```text
markAt12 T := shift left 12 ((shift right 12 T).write 1)
markedOutput out := markAt12 (Tape.mk₁ (output out)).
```

The actual final blocks implement it in 24 transitions: twelve right moves, one write-one/left move, eleven preserving left moves. The full finishing contract takes `13*out.length + gap + 54` transitions; with the canonical gap:

```text
finish:
  runFrom controller (16*out.length + 55) (loop, LoopTape out [])
    = some (done, markAt12 (Tape.mk₁ (output out))).
```

For the final finite-list identity define the auxiliary list `markedOut [] = Z 12 ++ [1]`, and `markedOut (s::rest) = word s ++ Z 9 ++ [1] ++ output rest`. Prove `markedOutput out = Tape.mk₁ (markedOut out)` by cases on `out`, four letter cases in the nonempty branch, and fixed zipper simplification. Keep the public run theorem's target as the frozen `markedOutput`; derive the finite-list corollary through this identity. Empty input uses the **same controller path**: both markers disappear, the tape is blank, and the single write sets offset 12 of the one marked blank source cell. There is no omitted empty branch or leftover sentinel.

## 5. Universal termination and exact original-codec target

Induct on `todo`, generalizing `out`. Let `m = out.length`, `n = todo.length`. A useful strengthening is

```text
run_loop out todo:
  runFrom controller
    (16*n*n + (32*m+83)*n + 16*m+55)
    (loop, LoopTape out todo)
  = some (done, markedOutput (todo.reverse ++ out)).
```

The base is `finish`. The successor uses `loop_once`, `run_add`, the induction hypothesis at `s::out`, and the list identity moving `s` into the reversed processed output. The time identity is polynomial arithmetic (`ring` after expanding lengths); do not ask `omega` to solve an unrestricted nonlinear identity. This induction proves finite termination for every finite input, without executing the large instance or assuming a chess result.

The seven-step entry and `out=[]` give the intended theorem:

```text
runFrom controller (16*L.length*L.length + 83*L.length + 62)
  (0, Tape.mk₁ (seed L))
 = some (done, markedOutput L.reverse).
```

These step formulas were derived from the source and independently checked in source review; their Lean proofs remain required. State count stays 216 regardless of the step count. `FlatInit.runFrom_reaches` turns the theorem into the finite path needed by the linker.

The codec owner supplies `letterSymbol : Letter → PartrecToTM2.Γ'`, mapping 0–3 to `.consₗ/.cons/.bit0/.bit1`, and its inverse on the four symbols. First prove the per-letter thirteen-bit cell identity using `FieldReturn.symbolCode/symbolCell` and `FieldBinary.encodeWord/encodeCell`. Then unfold `TM2to1.trInit`: it reverses the stack, puts symbols only on `.main`, and marks the first source cell; on empty input it creates one marked blank cell. Induct through `Codec.bitInput` and use the bit/Bool round-trip to obtain

```text
markedOut L.reverse
 = (FieldCompiler.Codec.input
      (TM2to1.trInit .main (L.map letterSymbol))).map Binary.encodeSymbol.
```

This is an identity of complete finite lists, including trailing zeros, before conversion to `Tape.mk₁`. It is preferable to a second global coordinate proof. Existing `Codec.input_map`, `bitInput_getI`, `mk₁_nth_nat/neg`, and `FieldBinary.tape_ext_nth` remain available for a small final transport if the existing pointed maps make list rewriting awkward; they are not the main loop invariant.

Instantiate `L` as `Input.stack.map symbolLetter`, prove `L.map letterSymbol = Input.stack` and `L.length = 141380`, and identify the target with `FieldSelective.bits.toList` using the existing codec definitions. No reconstruction from the JSON fixture may replace this kernel source identity.

## 6. Linker and whole-machine boundary

The independently owned generic `SeedLink` needs exactly the following inputs: `M : Machine D 2`, `done : Fin D`, `∀ b, M.transition done b = none`, the unchanged `body`, and a finite run from `(0, seedTape)` to `(done, targetTape)`. It allocates `D + 1 + body.states`, changes only the two `done` rows to preserving right moves into the one new bridge, and makes the bridge preserve and move left into body state zero. All original expander states, including `done` and `error`, remain paid. The error self-loop is not patched.

Its prefix-lifting proof must use the original finite run only up to `done`; agreement at `done` after arrival is neither true nor necessary. For a positive remaining run, the terminal-row premise excludes having already reached `done`. The handoff then takes exactly two transitions, preserving every cell and restoring the same relative head. Prove arbitrary-tape body embedding for every row, including missing transitions. Compose the finite path and body simulation with `StateTransition.reaches_eval`/`tr_eval_dom` to obtain both halting directions.

Wrap the linked block with `ReverseInit.Schedule.initialise (OpenEvolveWide.schedule seedBits)`, retaining all `seedBits.size+1` writer states. For this format the intended full state count is

`424157 + 216 + 1 + 573802 = 998176`.

The actual runtime to body entry is `seedBits.size + 1 + expansionSteps + 2`, while the numeric body-entry offset is `seedBits.size + 1 + 216 + 1`. They must not be conflated. The final `initialises` theorem must give the exact body-entry state and `Tape.mk₁ FieldSelective.bits.toList`, with an appropriate symbolic runtime or reachability statement. Then reuse `FieldSelective.body_halts_input` for the original chess proposition. Include every controller, bridge, writer, body, return, and halt state in the independent complete-machine export and row theorem.

## 7. Three coherent ownership units and verification order

| Owner | Exclusive proposed modules / responsibility | Contract handed to the next owner |
| --- | --- | --- |
| Controller/format | Existing draft paths `Seed/Format.lean`, `Seed/Controller.lean`, `Seed/Blocks.lean`; exact format, named control/Fin216 equivalence, every row, terminal/error facts, `run_block`, three-step parser | Frozen `loopTape`/`markedOutput` vocabulary and global-machine fixed/parser row contracts; no scanner or chess proof |
| Universal tape proof | Existing draft `Seed/Scan.lean`, then root-assigned expansion module; directional framed scanners, left regrouping identity, fixed geometric rewrites, loop/finish induction | The universal exact `run_seed` theorem with `done` and the complete `markedOutput L.reverse` tape |
| Linker/codec/assembly | Existing separately owned `SeedLink.lean`, then codec glue and the chess wrapper; generic protected success link can proceed independently | Exact target-codec identity, blank-tape `initialises`, original halting equivalence, full state count; root owns remote export/comparison/audit |

The named existing draft paths were source-read for this plan; later paths follow the root's actual assignments. None of these source declarations is counted here as a verified proof. Only the controller/format owner changes the frozen shared definitions. The scan owner consumes them and owns all expansion lemmas, avoiding duplicate geometry implementations. The generic linker owner can work before the expander proof; codec/assembly waits for format and then consumes the universal theorem. The root integrates and runs all remote checks.

The practical remote proof order is: (1) compile the small format/controller and compare all 432 rows; (2) prove one framed right-cell and shifted-left-cell scanner contract, the terminal four-ones endpoint, and the left list regrouping identity; (3) prove B's overlapping write and the 31-step prepend/A block; (4) close generic `loop_once` and `finish`, with empty and singleton statements as smoke checks; (5) close universal induction, source codec identity, linker assembly, and final machine theorem; (6) export every complete-machine row, audit axioms, replay the independent fixtures/negative controls against the Lean-defined rows, and compare the complete seed/target bytes. All six stages are remote. Do not replace a blocked general proof by checking more finite fixture lengths.

The next concrete remote check is therefore the small-module compile and a complete 432-row comparison against the retained controller table, before importing chess. The first scanner proof checks should quantify over arbitrary exterior frames, with all four singleton letters (especially letter `3`, code `001`) and the two-cell boundary `[0,2]`/`[2,0]`. The latter expose residual one-runs and output reversal. The finishing proof should specialize to empty input and each singleton, checking offset twelve and both blank exteriors; parser obligations include `000` and invalid codes `101`, `011`, `111`. These are proposed proof/debug obligations, not additional executed measurements or substitutes for universal statements.

## Four source review passes

1. **Complete architecture:** read the actual builder, parser, scanners, fixed operations, retained successful pilot metadata, existing Init/FlatInit/ReverseInit and tape APIs; chose one direct-controller zipper route and a three-owner contract.
2. **Domain pass:** fixed output-order orientation, the canonical whole-tape invariant, exact scanner endpoints, overlapping B rewrite, shared A blocks, empty output, and the original `trInit`/codec connection. An independent source scout confirmed the generalized loop/finish formulas and found the false reversed-cell reset shortcut.
3. **Defect pass:** replaced that shortcut with shifted cells and a finite-list regrouping identity; distinguished arbitrary frames from blank tails, state allocation from runtime, exact success linking from modifying terminal semantics, and kernel input identity from a JSON oracle. Kept all error states and exterior tape content explicit.
4. **Polish/evidence pass:** aligned the alphabet, public invariant, `markedOutput`, actual `Control`/`encode`/`controlEquiv` representation, and `run_block`/scanner interfaces with the current source drafts; isolated heavy chess imports to final glue, checked every step-count decomposition symbolically, and separated measured finite-pilot facts from all unproved universal statements. The independent source scout reviewed the shifted identity, both scanner endpoints, fixed blocks, cleanup, timing recurrence, and codec identity and reported no remaining source-level contract defect. No local compilation, model execution, tests, counts, network, git mutation, or outreach was performed. The report is ready for parent review; it earns no mathematical proof credit.
