# M6 runtime lowering audit

This is a read-only audit of the frozen M1–M5 mathematical definitions and backend,
with a proposed constructive M6 implementation route. It is **not** a certification
of M6, of a chess program, of a literal table, or of the initial chess value.
The observations below do not assume Lean's native compiler is a verified compiler.
Source locations use one-based lines in the inspected files. `Exec/`,
`Adjudication/`, and `Evaluation/` are under `Cryptids/Chess/`; shorter chess
filenames refer to their already named subtree. Compiler filenames are under
`Cryptids/Compilation/`, script filenames under `scripts/`, and Mathlib references
under `.lake/packages/mathlib/Mathlib/`.
The concurrently developed M6 codec, arithmetic, and evaluator modules are not
claimed correct by this document.

The next useful kernel is the encoded board-read theorem. A small generic dynamic
lookup program was checked separately during this audit and is recorded below;
it is not yet an integrated chess procedure. A position round trip and a total
first-order Lean evaluator do not provide board-read lowering. After board access,
the expensive but finite rule/search/evaluation procedures can be assembled as
explicit syntax with compositional semantic proofs. There is no demonstrated mathematical impossibility
of this route. There is a substantial unimplemented translation boundary.

## 1. Executed call graph

The following graph concerns the mathematical definitions being refined. It is not
a native compiler call-count or optimization claim. A refinement may eliminate
repeated computation after proving its result equal.

1. `Chess.Evaluation.solve game` projects the first component of `analyse game`
   (`Evaluation/Solver.lean:28–43`). `analyse` tests `automatic game = none`.
   At a terminal game it returns the actual `automatic` outcome, with an unused
   `.claimDraw` action. At a live game it takes the first legal action and calls
   `choose` over the attached legal-action list. The local value function returns
   draw for a claim and recursively evaluates `game.play ply` for a played move.
2. `choose` recursively chooses from the rest, computes utilities of the selected
   candidate and the incumbent, and retains the incumbent on ties
   (`Evaluation/Choice.lean:15–26`). It receives a function-valued argument and
   subtype-valued actions. These are real data/control abstractions to eliminate
   by refinement; only the membership evidence in each subtype is erased. The
   first action also appears in the attached rest list. A value-only replacement
   must justify removal of that duplicate and repeated child evaluations.
3. `automatic` checks checkmate first, then `DrawCondition`
   (`Adjudication/Outcomes.lean:30–36,53–56`). Its constructive decision checks
   stalemate, fivefold repetition, `150 ≤ halfmoveClock`, and exact dead position.
   The stated order permits short circuiting; an equivalent Boolean procedure
   must preserve the result and checkmate priority. It cannot substitute a
   heuristic insufficient-material rule for the dead-position decision.
4. Checkmate/stalemate call `InCheck` and `HasLegalPly` through the constructive
   instances (`Adjudication/DeadPosition.lean:22–29`). In this executed branch,
   `HasLegalPly` is a finite existential over **all** `Ply`, not a direct call to
   `Exec.legalPlies`. `IsLegalPly` uses the M2 constructive instance
   (`Exec/Rules.lean:140–142`). A new implementation may instead use an `any`
   loop over candidates, with a completeness proof.
5. Fivefold repetition calls the custom `RepeatedAtLeast` decision
   (`Adjudication/History.lean:82–107`). This computes
   `Fintype.card {i : Fin positions.length // SamePosition (positions.get i) current}`.
   That particular cardinality is **executed**, and cannot be discarded merely
   because the rank proof also mentions cardinality. `positions` includes the
   current position and every previous position, newest first
   (`Spec.lean:531–545`).
6. `SamePosition` first tries raw projected-key equality, then the full reference
   predicate (`Adjudication/History.lean:67–76`). The full predicate compares every
   board cell, turn, rights, and legal en-passant capture possibilities over all
   plies (`Spec.lean:515–522`). Clock is ignored; an inert raw en-passant target
   does not by itself make positions different. Raw `Key` equality is sufficient,
   not necessary, for repetition equality.
7. Exact dead position calls `isDead -> canReachMate -> reachableTarget -> search`
   (`Adjudication/DeadPosition.lean:31–46,65–75`, `Adjudication/Search.lean:59–81`).
   The projected key drops only the halfmove clock; it retains the full board,
   turn, four rights, and **raw** en-passant target
   (`Adjudication/Projection.lean:23–48`). `search` tests for a target in the seen
   set, tests closure of an expansion, and otherwise repeats on the expansion.
   `expand` performs a union, a finite-set union over every seen key, and a
   successor-list-to-set conversion (`Adjudication/Search.lean:30–32`).
8. Each dead-graph successor enumerates raw legal plies on clock zero, applies the
   unchecked M2 update, then projects the result
   (`Adjudication/DeadPosition.lean:32–34`). Edges continue past **all game-level
   draw rules**. Applying `automatic` to trim this graph changes the predicate.
   The target test is actual checkmate on clock-zero projected data (`:43`).
9. `legalActions` rechecks `automatic`, maps raw legal plies to `.play`, then
   appends one optional `.claimDraw` if eligible
   (`Adjudication/Outcomes.lean:95–99`). Claims use current or announced-next
   threefold repetition and current or announced-next clock ≥100
   (`Adjudication/Claims.lean:19–39`). Announced moves are tested for raw legality;
   claiming does not play a move or create an extra history entry.
10. `Game.play` calls `Exec.applyPly` and conses the entire old current position
    onto history (`Adjudication/History.lean:45–47`). It is an unchecked update.
    `Exec.applyPly` decodes vectors to a square-indexed function, applies
    `positionAfter`, then re-encodes the whole board
    (`Exec/Rules.lean:166–185`, `Exec/Encoding.lean:23–65`).
11. `legalPlies` filters 28,672 candidates (`Exec/Moves.lean:21–63`): source square
    outer, destination square middle, seven promotion options inner. Square
    enumeration is file then rank. The candidate order differs from the proposed
    rank-major serialized board order and must not be confused with it.
12. Every legality test runs pseudo-legality and checks that the moving side is
    not in check after `boardAfter`. M2 decidable instances expand the rule
    predicates through finite quantifiers (`Exec/Rules.lean:27–108,140–142`).
    All of their concrete suboperations are in the inventories below.

No strategy function is enumerated by this computation. Strategy existence,
optimality, reference correspondence and the final strategic proposition belong
to the proof closure, not to the runtime input language.

## 2. Erasure boundary

| Dependency | Treatment and source evidence |
| --- | --- |
| `capacity`, `rank`, `Nat.card Key`, `Fintype.ofFinite Key` used for the M4 rank | Proof-only; no enumeration of keys is needed by the executed evaluator. `Evaluation/Bound.lean:64–118`; `Solver.lean:39–40`. |
| `Nat.card α - seen.card` and the growth proof in finite graph search | Termination-only measure. The target test, successor expansion and closure test immediately above it remain executed. `Adjudication/Search.lean:59–77`. |
| `Finite Key` proof | Establishes finiteness for termination; it is not a materialized list of all boards. `Adjudication/Projection.lean:30–40`. |
| Action membership, subtype correctness, list-head nonempty argument | Proof fields erase, but `attach` values, list traversal, head selection and value comparison need an explicit representation/refinement. `Solver.lean:21–40`. |
| `decidable_of_iff` equivalence proofs | Proofs erase; the supplied `Decidable` Boolean branch still executes. `Exec/Rules.lean:85–90,140–142`; `History.lean:101–102`; `DeadPosition.lean:73–75`. |
| `Fintype.card` in `occurrences` | Executed count over finite history indices, not rank erasure. Replace with a proven Boolean count over the actual list, preserving multiplicities. `History.lean:82–107`. |
| Finite `∀`/`∃` instances and equality of finite-domain functions | Executed loops. They do not disappear because their original types are propositions. Examples: `Rules.lean:34–53`; `History.lean:67–73`. |
| Reference `noncomputable` updates and promotion predicate | Used propositionally and in proof equalities, not as executable oracles. M2 supplies constructive counterparts: `Rules.lean:76–90,111–159,166–199`. |
| Native implementations of well-founded recursion, arrays, arithmetic, pointer equality or hash maps | Not the mathematical compiler theorem. Explicit `Code.eval` refinement is required even when `#eval` gives plausible answers. |

An executable fuel may be derived without computing the noncomputable rank:
each raw board has 13 possible values per cell; turn has 2 values; rights have 16;
raw en-passant metadata has 65. A concrete mixed-radix injection gives the bound
`Nat.card Key ≤ keyBound := 2080 * 13^64`. Prove the injection and this inequality
in the kernel. Then `8 * keyBound + 2` is strictly above every M4 rank by
`Evaluation/Bound.lean:98–101`. The program must emit that natural through a
binary-size literal constructor, not `keyBound` successor syntax nodes. Exact
cardinality equality is unnecessary. This is a proposed bound proof, not a proof
already supplied by this audit. Dead search may instead use an unbounded `fix`
loop whose termination is proved by the existing finite-set argument.

## 3. Data and primitive obligations

Every row below is independently necessary unless explicitly removed by a proved
replacement. Merely proving the named Lean function computable does not produce
its executable code. Use a consistent list ABI and state whether each procedure
returns a singleton, a flat list, a tagged result, or preserves an environment.

| ID | Operation to lower and required contract |
| --- | --- |
| D01 | Exact position serialization: 71 words; turn, four rights, raw EP, arbitrary Nat clock, 64 cells. Strict rejection of missing/extra/invalid words at exposed decoder boundaries. `Exec/Encoding.lean:42–65`; shared M6 PLAN ABI. |
| D02 | Exact game serialization: history length, current block, previous blocks newest first. Arbitrary history length and clock; no clipping or normalization. `History.lean:23–32,45–47`. |
| D03 | Fin 8 values and bounds, square pair construction, file/rank projection; proof bounds erase but integer checks must guard any external decoding. `Spec.lean:89–96`. |
| D04 | `Option Piece` empty/present tag, color 0/1, six distinct kind tags, piece equality and constructors. Cell code `0` or `1+6*color+kind`; reject codes >12. `Spec.lean:63–87`. |
| D05 | Bool 0/1 validation and conversion, four independently writable castling bits; `CastleSide` two tags and `Color.other`. `Spec.lean:69–71,102–139`. |
| D06 | `Option Square`: absent 0, present `1+file+8*rank`; decode by bounded quotient/remainder; preserve raw EP even when inert. `Projection.lean:23–48`; PLAN ABI. |
| D07 | Move representation with two squares and **seven** raw promotion alternatives, including illegal king/pawn requests. Action play/claim tags and Outcome tags. `Exec/Moves.lean:33–47`; `Spec.lean:564–583`. |
| D08 | Vector reads and tabulation replace both levels of `Vector`/`Array`, `Vector.ofFn`, Fin-valued indexing and square-indexed board closures. Rank-major board offset is `7+file+8*rank`. `Exec/Encoding.lean:23–31`. |
| D09 | Board extensional equality as 64 cell comparisons; raw key equality also compares turn/rights/EP, never clock. No function identity or native closure equality. `Projection.lean:23–28`; `History.lean:71–73`. |
| D10 | List length, head/head-default, tail, drop/take, append, indexing, cons, map, filter, product/flatMap, any/all, count/fold, membership, reverse when used by the chosen ABI. Each used combinator needs a code or expansion into proven loops. `Moves.lean:22–63`; `History.lean:28–32,82–107`; `Search.lean:31`. |
| D11 | Nested variable data (history, action lists, seen keys, evaluation frames) must have explicit boundaries. Fixed 71-word blocks simplify positions but do not delimit arbitrary stacks/frames by themselves. |
| P01 | `Code` basis semantics: `zero'` **prepends** zero; `succ` returns only a singleton; `cons` keeps only the first word of its left result; `case` consumes or decrements the first word; `fix` consumes a control flag and executes its body at least once. Mathlib `TuringMachine/Config.lean:76–123`. |
| P02 | Constants, including huge fuel: binary-size syntax construction; no choice-based code extraction and no unary literal expansion. |
| P03 | Fixed field projections and tuples. Prove exact output lengths/tails as well as numeric head values; empty output defaults to zero in `cons`. `Config.lean:112–121,162–196`. |
| P04 | Dynamic lookup, with explicit bounds/default behavior and preservation of its source list/environment. Fixed `nth i` code alone does not implement an input-dependent square or history index. |
| P05 | Nat successor, predecessor, addition, truncated subtraction, multiplication and fixed powers/constants. Natural subtraction saturates at zero. Distances are `Nat.dist`, not signed displacement. `Spec.lean:159–177,185–207`. |
| P06 | Nat equality, inequality, `≤`, `<`, min, max, distance, quotient/remainder for coordinate decoding; equality/ordering results must be canonical Bool words. |
| P07 | Bool negation, conjunction, disjunction, implication, equivalence, short-circuit conditionals, pattern matching and finite tag cases. Prove semantic result even if evaluation order is changed. |
| P08 | Constructive decisions for True/False, equality, finite bounded `∀`/`∃`, and Boolean reflection. Do not translate a Prop-valued expression by leaving an unspecified `Decidable` oracle. `Exec/Rules.lean:27–108`. |
| P09 | Code composition with environment reuse, list-producing loops, accumulators and stack manipulation. `Code.prec` is scalar-result primitive recursion, not a ready-made fold returning an arbitrary list (`Config.lean:213–242`). |
| P10 | `Code.fix` loop simulation, exit flag stripping, loop invariants, finite iteration reachability, and nontermination of the deliberate draw loop. A statement of computability does not discharge these. |

## 4. Every rule-level lowering obligation

The following operations must agree on **all raw encoded positions and requests**
where their individual M2 contracts are used. Reachable-board intuition cannot
justify silently strengthening the hypotheses of `decode_applyPly` or `isLegal`.

| ID | Required operation | Frozen definition / executed implementation |
| --- | --- | --- |
| R01 | File/rank distance and strict-between predicate | `Spec.lean:159–177`; `Rules.lean:27–32`. |
| R02 | Horizontal, vertical and diagonal open-segment membership, including strict endpoints | `Spec.lean:169–177`. |
| R03 | Path-clear universal scan over 64 squares; implication only constrains segment members | `Spec.lean:180–181`; `Rules.lean:34–35`. |
| R04 | Color-dependent pawn attacks | `Spec.lean:184–188`; `Rules.lean:37–39`. |
| R05 | All six attack branches, including nonzero-distance conditions for sliding/king attacks | `Spec.lean:191–207`; `Rules.lean:41–44`. |
| R06 | Attacked-square existential over square and piece; check existential over **every** king of the given color on a raw board | `Spec.lean:210–216`; `Rules.lean:46–53`. |
| R07 | King/rook home squares, king destination/transit and rook destination for both colors/sides | `Spec.lean:219–249`. |
| R08 | Castling-shaped request detector, separate from legal castling | `Spec.lean:252–262`. |
| R09 | En-passant captured square and full EP shape test, including empty destination and opponent pawn | `Spec.lean:265–271`; `Rules.lean:55–58`. |
| R10 | Single pawn advance with empty destination | `Spec.lean:274–278`; `Rules.lean:60–63`. |
| R11 | Double pawn advance, starting/ending ranks, empty destination and path | `Spec.lean:281–285`; `Rules.lean:65–68`. |
| R12 | Ordinary pawn capture, opponent color and no king capture | `Spec.lean:288–291`; `Rules.lean:70–73`. |
| R13 | Promotion-needed condition for each color; exactly valid promotion kind or exactly none | `Rules.lean:76–90` refines `Spec.lean:298–307`. |
| R14 | Destination permission for empty/nonempty destination, opponent color and non-king kind | `Spec.lean:312–315`; `Rules.lean:92–94`. |
| R15 | Legal castling exists-side test: rights, actual rook, rook path, source safety, transit safety | `Spec.lean:318–327`; `Rules.lean:96–99`. Final destination safety is checked later on the updated board. |
| R16 | All six movement branches; pawn disjunction; normal king move or castling | `Spec.lean:330–352`; `Rules.lean:101–104`. Attack and movement predicates are not interchangeable. |
| R17 | Pseudo-legal existential source piece, own turn, unequal squares, destination, promotion, movement | `Spec.lean:355–359`; `Rules.lean:106–108`. |
| R18 | Moved piece promotion on **unchecked** requests, even king/pawn promotion tags | `Spec.lean:362–365`; `Rules.lean:115–116`. |
| R19 | Board update when source empty: preserve board | `Rules.lean:111–114`. |
| R20 | Board update priority: destination, source, castling rook destination, rook home, EP captured square, old cell | `Rules.lean:114–132`. Order matters for malformed/illegal requests with overlapping squares. |
| R21 | Final own-king safety on `boardAfter`, together with pseudo-legality | `Rules.lean:140–142`; `Spec.lean:398–399`. |
| R22 | Remove kingside/queenside/both rights; remove rook right at either home | `Spec.lean:127–139,402–409`. |
| R23 | Next rights after king/rook move and after captured rook, including unchecked raw metadata | `Spec.lean:412–427`. |
| R24 | New EP target after a double pawn advance; cleared otherwise; own color controls rank 2/5 | `Rules.lean:145–154`. |
| R25 | Pawn-source existential and capture predicate (occupied destination or EP) | `Rules.lean:161–172`; `Spec.lean:449–451`. |
| R26 | Halfmove clock reset versus arbitrary-precision successor; turn toggle; exact assembly of all position fields | `Rules.lean:166–185`. |
| R27 | Generate 64 squares, seven promotions, all source/destination/promotion products in the specified order | `Moves.lean:21–47`. No truth table over boards. |
| R28 | Filter candidates using the translated legality test; return exactly the legal-ply list | `Moves.lean:57–68`; `Rules.lean:223–227`. |
| R29 | Exists-legal-ply Boolean and checkmate/stalemate tests, replacing finite existential instances with proven candidate scans | `DeadPosition.lean:22–29`; `Spec.lean:495–504`. |
| R30 | Initial board, side, four rights, absent EP, zero clock; emit all data in the program/initializer | `Spec.lean:469–492`; `Exec/Encoding.lean:67–68`; `History.lean:40`. |

## 5. History, graph and evaluator obligations

| ID | Required operation and precise refinement |
| --- | --- |
| H01 | Construct/project raw `Key` by deleting only the clock, restore clock zero, encode/decode its board function extensionally. `Projection.lean:23–48`. A canonical 71-word position with clock zero is one possible key encoding; a distinct 70-word encoding also needs its own proof. |
| H02 | Raw key equality fast path, comparing all 64 cells and metadata. `History.lean:71–73`. |
| H03 | Full `SamePosition`: 64 board equalities, turn/rights equalities, and iff of legal-EP tests for every candidate ply, including the existential source piece. `Spec.lean:515–522`. Neither raw EP equality nor raw key equality alone is an exact replacement. |
| H04 | Occurrence count over current plus complete previous list, with repeated equal entries counted separately; prove equal to `Fintype.card` of matching indices, then thresholds 3 and 5. `History.lean:82–107`. Never deduplicate history. |
| H05 | Full `Game.play`: apply raw position update, increment history length, retain old current plus every old previous block unchanged. `History.lean:45–51`. |
| H06 | Threefold claim now or after **some legal intended move**; fifty-move claim now or after some legal intended move; optional claim disjunction. `Claims.lean:19–39`. No new game is actually selected/played when claiming. |
| G01 | Enumerate successors by legal plies, raw update, projection; set equality may ignore successor order/duplicates, but must not remove draw-terminal edges. `DeadPosition.lean:31–40`. |
| G02 | `isMate` exact Boolean, including raw-board check logic with absent or multiple kings. `DeadPosition.lean:42–43`. |
| G03 | Seen-set representation, singleton start, key membership, insert, duplicate removal, union, iteration of successor union. A list representation needs an abstraction relation to a `Finset`; do not call noncomputable `Finset.toList`. `Search.lean:30–32,79–81`. |
| G04 | Target-any scan over the current seen set, before the closure test; immediate target must succeed. `Search.lean:62–63`. |
| G05 | Exact closure test `expand seen ⊆ seen`, not list structural equality or mere equal lengths without invariants. `Search.lean:64–69`. |
| G06 | Repeated expansion/worklist loop; invariant relating its stored keys to the original finite graph, termination, and answer equality with `canReachMate`. `Search.lean:59–87`; `DeadPosition.lean:46–71`. |
| G07 | Deadness is the negation of reachability of a mate for either side, with no cooperative/adversarial strategy quantifier in this subproblem. `DeadPosition.lean:54–71`. |
| A01 | Automatic result priority: checkmate win for the opposite turn; else stalemate/repetition≥5/clock≥150/dead draw; else live. `Outcomes.lean:30–56`. |
| A02 | Legal action list: live test, ordered mapped plays, optional claim appended last; terminal list empty. `Outcomes.lean:95–103`. |
| E01 | Color-relative utilities 2/1/0, selecting maximal utility and earlier value on a tie; consistent Outcome/tag conversion. `Choice.lean:15–26`. Existing M5 ordered scores are Black=0, draw=1, White=2 (`Compilation/Games.lean:29–43`); do not silently reverse them. |
| E02 | Eliminate `choose`'s function argument and attached subtype into explicit action/value folds; prove equality to `solve`, not just that output is one legal outcome. `Solver.lean:28–43`. |
| E03 | Evaluate claim as immediate draw and played child using the exact updated full game; maintain caller game/turn/action tail on an explicit data stack. No recursive function-valued closure can remain as an unspecified primitive. |
| E04 | Fuelled evaluator with separate exhaustion tag; empty action list at a live game must be excluded by the nonempty theorem, not assigned fallback draw. Strict enough-fuel theorem and numerical bound proof. `Solver.lean:21–25`; `Bound.lean:98–118`. |
| E05 | Defunctionalized control frames and a finite dispatcher for evaluator/children/fold return; stack encode/decode, frame push/pop, branch state preservation and simulation invariant. Source recursion in Lean is not already a `Code.fix` program. |
| E06 | Closed program constructs exact initial game and enough fuel by finite syntax construction, without evaluating any part of the initial minimax game tree during compilation. |
| E07 | A separate postlude diverges exactly for draw and terminates for either win. Merely compiling a **total** outcome-returning evaluator yields halting in all three cases. Fuel exhaustion must be proved absent before this postlude is used. |

The list-set implementation is a refinement opportunity, not a requirement to
imitate `Finset`'s internal quotient representation. Prove set membership and
transition equivalence; the existing `search` correctness identifies its Boolean
answer. Likewise, a direct Boolean count refines the history-cardinality
definition without constructing finite subtype values at runtime.

## 6. A constructive route producing actual syntax

Prioritize explicit list-Nat state transformations over attempting to verify all
of Lean's compiler. Package syntax **in Type** with its semantic theorem:

```lean
-- Proposed interface; not a declaration certified by this audit.
structure Realizes (f : List Nat → List Nat) where
  code : Turing.ToPartrec.Code
  correct : ∀ input, code.eval input = pure (f input)
```

Use an analogous package for partial functions when divergence is intentional.
Composition, environment projections/duplication, finite case trees and `fix`
invariants construct the `code` field directly. The proof field can erase without
losing syntax. A small first-order expression/statement AST may automate this:
provide a structural `compile : AST → Code`, a mathematical interpreter, and a
generic simulation theorem. Every primitive in that AST must already have an
explicit implementation; placing `isLegal` or `automatic` in an opaque AST atom
only renames the missing obligation. Source-to-AST quotation is a syntax producer,
not trusted evidence: prove each quoted term's semantics against the frozen source.

Recommended stages, each with a concrete theorem rather than an existence claim:

1. `dynamicAt : Code` consumes `index :: words` and returns
   `[words[index]?.getD 0]`. Prove the equation for **all** indices and lists by a
   countdown loop. If the program needs the original `words` afterward, duplicate
   or retain it explicitly before consuming a scan copy.
2. `boardGet : Code` consumes `squareCode :: encodePosition position`, with
   `squareCode = file + 8*rank`, and returns exactly the encoded board cell at
   `7 + squareCode`. Establish a field-access theorem connecting vector indexing,
   serialization order and reference `decodeBoard`. Do not infer this theorem
   merely from a codec round trip. Invalid input behavior needs a separate stated
   contract if the procedure is exposed on arbitrary words.
3. Build Boolean expressions from these reads and proven arithmetic; implement
   bounded `any`/`all` loops for 64 squares, 12 pieces, two castle sides and all
   28,672 candidates. For example, propose the actual data value `isLegalCode` and
   the theorem `isLegalCode.eval (encodePly ply ++ encodePosition p) =
   pure [encodeBool (Exec.isLegal p ply)]`. Use M2's existing soundness theorem to
   connect to the reference. Build `applyPlyCode` with its exact full-position
   output equation on every raw position/ply.
4. Produce `legalPliesCode`, `samePositionCode`, `occurrencesCode`, `claimsCode`,
   `successorsCode`, `reachMateCode`, `automaticCode`, and `legalActionsCode` with
   the equations in the inventories. Finite-loop proofs should use bounded-list
   completeness; graph loops should use list-set abstraction. The native
   `Decidable` instances are specifications of the returned Boolean, not oracles.
5. Give the first-order fuelled evaluator an explicit frame-stack machine. Compile
   its single-step state transformer, then use `Code.fix` for the outer driver.
   Prove each source transition and termination/answer equality under enough fuel.
   This avoids recursively expanding a program per node of the chess game tree.
6. Construct a closed initial-data prefix and the draw-divergence postlude. The
   desired theorem is about the actual syntax, for example
   `(chessCode.eval []).Dom ↔ Evaluation.solve Adjudication.Game.initial ≠ .draw`.
   An intermediate total result theorem should state the exact output list.

Step 1 has a successful small experiment in
`/private/tmp/chess-m6-audit-dynamic-at.lean`, checked with the pinned Lean toolchain
and warnings as errors. Its explicit syntax is:

```lean
def one : Code := .comp .succ .zero
def atBody : Code :=
  .case (.comp .zero' .head)
    (.cons one (.cons .head (.comp .tail .tail)))
def dynamicAt : Code := .fix atBody
```

The zero branch returns the exit flag followed by the head/default. The successor
branch returns a continue flag, the decremented index, and the remaining scan
list. Induction on the input index and `PFun.mem_fix_iff` proves
`dynamicAt.eval (n :: v) = pure [v[n]?.getD 0]` for arbitrary `n` and `v`. The
captured axiom output contains only `propext`, `Classical.choice`, and `Quot.sound`;
the focused Lean command exited zero. Durable text copies and diagnostics are in
the leaf evidence directory. This is an isolated generic lookup proof, not an
integration theorem for the in-progress M6 modules.

The first genuinely missing kernel in this chosen route is therefore step 2's
**encoded-board refinement of input-dependent lookup**. Fixed-index tuple
projections and the generic lookup theorem do not supply this theorem. No existing
M1–M5 theorem inspected supplies `isLegalCode`, `applyPlyCode`, or these evaluation
equalities. This is a localizable implementation gap, not evidence that a general
extraction theorem is impossible. Subsequent graph and evaluator simulations
remain independent obligations even after board access is solved.

### Why the existing computability library is not direct extraction

`Nat.Primrec` and `Nat.Partrec` are inductives in `Prop`
(`Mathlib/Computability/Primrec/Basic.lean:56–67`,
`Mathlib/Computability/Partrec.lean:156–167`). The list combinator library supplies
useful **theorems**, including list folds/maps and indexing
(`Primrec/List.lean:151–187,219–241`), and generic finite-domain computability
(`Primrec/Basic.lean:678`). These can guide proofs and implementations; they are
not a code-bearing derivation tree in `Type`.

`Nat.Partrec.Code.exists_code` returns an existential in `Prop`
(`PartrecCode.lean:529–550`). The list-program bridge similarly proves
`∃ c : ToPartrec.Code, ...` from `Nat.Partrec'`
(`TuringMachine/Config.lean:247–290`), while `Nat.Partrec'.of_part` itself obtains
a code existential (`PartrecBasis.lean:131–146`). None is a computable extraction
function accepting a proof and returning syntax. `Classical.choose` would create
a noncomputable program definition; it would not supply inspectable constructor
data or a table-generation algorithm within the M6 contract.

There are useful constructive reification opportunities, with distinct limits:

- `Nat.Partrec.Code` itself is actual inductive data
  (`PartrecCode.lean:75–87`). A new structural translator from that syntax to
  `ToPartrec.Code`, with a kernel simulation theorem, is a valid alternative.
  It still needs explicit pairing/unpairing and list/Nat encoding procedures;
  `exists_code` is not already such a translator returning executable data.
- `ToPartrec.Code.prec` and `.rfind` already construct syntax
  (`TuringMachine/Config.lean:210–242`). Their implementation is a template for
  more verified loops. The local dynamic-lookup experiment demonstrates that a
  direct list operation can have a very small explicit `fix` implementation.
- An elaborator can inspect a restricted constructive derivation or a source AST
  and emit a literal code term plus its proof. The ordinary kernel must check the
  emitted semantics theorem. It must reject unsupported/opaque atoms, handle
  equality transports, and never treat success of native quotation as correctness.
  This is a metaprogram implementing syntax generation, not a mathematical
  function eliminating arbitrary Prop proofs into Type.
- `Primrec.dom_finite` obtains a universe list and builds a lookup proof for an
  arbitrary finite-domain function (`Primrec/Basic.lean:678–684`). Reifying this
  proof on whole positions would expand a table of function results over boards;
  it does not recover the rule algorithm and does not meet the M6 route.

A focused local Lean negative control confirms the exact failure: destructuring
`h : Nat.Partrec f` to return `Code` requests a recursor with a `Type` motive where
`Prop` is required; destructuring `h : ∃ c : Code, c = c` reports that
`Exists.casesOn` can eliminate only into `Prop`. The source was
`/private/tmp/chess-m6-audit-prop-extraction.lean`; the captured diagnostics are
`.unlazy/chess-m6/leaf-1.4/prop-extraction-negative.txt`. This negative check proves
only that those two attempted definitions are rejected. It says nothing against
an explicit, independently defined syntax tree with a subsequent correctness proof.

One could reimplement a code-bearing primitive/partial-recursive derivation in
`Type` and a constructive interpreter-to-`Code` compiler. That is valid in
principle, but still requires code-bearing implementations for list encodings,
all rules, finite graph search and evaluator frames. The direct route above is
smaller than duplicating the whole general computability library. A finite truth
table over all 13^64 boards fails the stated construction route and does not even
cover arbitrary clocks and histories without further work.

## 7. Backend support and exact artifact obligations

The proved M5 backend is useful once an actual `Code` exists:
`Adequacy.compileClosedCode_halts` connects `Code.eval c []` to supported stack
compilation (`Compilation/Stack.lean:269–298`). It does not translate chess rules,
construct a numbered final machine, or identify a published literal table.

| ID | Independently required backend/artifact step |
| --- | --- |
| B01 | Fix the four stack keys, four-symbol `Γ'`, five-value store `Option Γ'`, their explicit enumerations and coverage. Mathlib `ToPartrec.lean:160–179,231–237`. |
| B02 | Construct the simultaneous stack alphabet `Bool × (K' → Option Γ')`, enumerate every symbol (two bottom flags and every four-tuple of five values), and prove coverage extensionally. Do not enumerate an infinite label type. `Stack.lean:269–279`; analogous finite-function reconstruction in `Examples.lean:20–48`. |
| B03 | Supply `BlockCode` with blank and round-trip proofs; select fixed-width code and correct input bit order. `Stack.lean:17–23,30–108,117–134`. |
| B04 | Construct an **ordered list** of source `PartrecToTM2.Λ'` labels covering `codeSupp chessCode .halt`, with initial label `trNormal chessCode .halt` as the actual default. The Finset support theorem does not materialize that ordered list. |
| B05 | Implement source-label equality for `move/clear` finite predicates, `push` finite functions, `read` functions over five stores, recursive labels and continuations. Mathlib supplies a constructive instance (`ToPartrec.lean:200–228`), but its evaluation/cost still matters during generation. |
| B06 | Prove TM2 source support for the exact list; then all downstream support collectors and numbering coverage, symbols and store covers. Existing ordered collectors are in `Finite.lean:313–392`; `numberedStack_halts` in `Stack.lean:236–263`; optional fast pipeline in `AssemblyFast.lean:86–145`. |
| B07 | If using the fast pipeline, supply all actual finite hashing/equality instances and respect their proved equality semantics. Hashes are accelerators, never collision-free assumptions. `HashSupport.lean:10–43`; `AssemblyFast.lean:23,62–84,124–145`. |
| B08 | Numbered Post transition data, exact initial state zero and exact finite state count; do not replace an absent label by zero without proving it unreachable under source support. `Finite.lean:399–430`. |
| B09 | Binary write/move lowering, preserving both halting directions and tape/head relation. Existing theorem is `Binary.compile_halts_input/blank` (`Binary.lean:154–172`). It doubles source states. |
| B10 | Blank initializer writes the **actual compiled input** and restores the head before entering the body, with state-count, reachability and halting transfer. `Init.lean:148–198`; `Examples.lean:64–83`. Even a closed empty-list `Code` interpreter has a concrete stack-simulator input encoding to initialize. |
| B11 | Emit exactly two transition cells per state with bounded destinations, correct direction/symbol syntax, defined halt convention and all rows including unreachable states. `GenerateChessM5.lean:12–39` is an emitter, not a correctness proof. |
| B12 | Reparse the published artifact as ordinary kernel data, validate every cached tree count/row count/bound, and prove **pointwise transition equality to the generated initialized machine**, with a proved numeric state-count cast if needed. |
| B13 | Kernel identity from balanced tree to ordinary row semantics, followed by compiled-machine identity. `BalancedTable.lean:116–129` proves only the first identity. Cache validity says nothing about whether a transition is the one produced by the compiler. |
| B14 | Byte-for-byte artifact/export agreement and an independently recorded hash/count manifest; comparator/challenge references the exact literal definition. External hashes or native regenerated bytes are reproducibility evidence, not the mathematical source-to-table bridge. |
| B15 | Final theorem combines actual source refinement, draw gate, support/backend, initializer, and exact literal identity into the strategic equivalence, without assuming the initial value. Audit all dependency closures and frozen inputs separately. |

For B04, **do not use `Finset.toList`**: Mathlib explicitly defines it
noncomputably using choice (`Data/Finset/Dedup.lean:169–171`). Instead mirror
`PartrecToTM2.trStmts₁`, `codeSupp'`, and `contSupp` with duplicate-preserving list
collectors (`ToPartrec.lean:959–1044`). A `read` node enumerates its five store
arguments; all other cases concatenate or cons the recursive lists. Prove
`q ∈ codeSuppList c k ↔ q ∈ codeSupp c k`, then derive source support using
`tr_supports` (`:1270–1276`). This enumerates finite **program syntax**, not the
executed chess game graph. It is an independent implementation kernel after source
code exists. Retaining duplicates is permitted by the current numbering API;
deduplication may be added with a proved membership-preserving routine.

M5's current literal tables use finite execution certificates for white/black
halting and finite reachability into closed total states for draw/refutation
nonhalting (`Compilation/Tables.lean:134–171`). The example equivalences then
combine those certificates with already known finite-game values (`:174–185`).
They do **not** prove that an arbitrary exported compiler table equals its source
compiler result. Repeating that certification strategy for full chess would
require deciding the very initial outcome whose conditional behavior the machine
is meant to encode. M6 must instead prove exact literal/generated identity or a
fully checked transition simulation independent of the eventual chess result.

Checking the finite compiler's transition data can require extensive kernel
normalization, but it evaluates finite syntax construction and finite store/alphabet
functions, not the initial minimax search. This distinction must be maintained in
every literal-equality certificate. A native generator plus SHA-256 alone is not
an acceptable replacement for that certificate.

## 8. Audit result and limits

The audit identifies a constructive implementation path and its missing kernels;
apart from the isolated generic lookup experiment, it does not implement or verify
those kernels. The two exact extraction attempts above fail at the Prop-to-Type
boundary. In the selected constructive route, the first open source-to-code
theorem is the board-read serialization/refinement equation; all rules, history,
dead search, evaluator frames, support lists and literal identity remain explicit
subsequent obligations. No finite-game M5 theorem, codec round trip, native test,
or computability-existence result closes those gaps by itself.

Manual source-review evidence and the four-pass record are in
`.unlazy/chess-m6/leaf-1.4/LEDGER.md` and `evidence.json`. A passed audit leaf means
that this inventory and proposed interfaces were reviewed against the cited source;
it does not make any M6 implementation gate pass.
