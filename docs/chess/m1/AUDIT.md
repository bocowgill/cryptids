# M1 audit: chess specification in FormalConjectures PR #5216

## Verdict

**PASS WITH CAVEATS for the source-level specification review. Not a completed
Lean verification or an executable chess implementation.**

No concrete rule defect affecting games reachable from the standard initial
position was established in this audit. Retain the candidate's chess definitions
and strategic proposition; no semantic rewrite is presently justified. The
findings below concern the trusted import boundary, domains, missing supporting
proofs, executable refinement, compatibility, and documentation.

The requested audit and packaging recommendation are complete. The whole M1
milestone remains incomplete: a definitions-only port has not been implemented,
built, or formally compared with its source. The current instruction explicitly
holds implementation and outreach.

## Scope and pinned inputs

- Review date: 2026-10-19, America/New_York.
- PR: [google-deepmind/formal-conjectures#5216][pr], open when checked. Head:
  `03536100b3d15e928f45649e7935f8c2b785337b`, unchanged from the roadmap.
- File: [`FormalConjectures/Books/Chess.lean`][source], 640 lines, 25,395 UTF-8 bytes.
  Git blob: `8018d10a3bfcd375a17c76599cfd3ceafe3e930d`.
- SHA-256: `ad43e6cfa086ff692daf57b8ee2444faa34f318ff43e05e44b53b27a53e10348`.
  The [archived text](source/Chess.lean.txt) matches that Git blob byte for byte.
- Rules: [FIDE Laws effective 1 January 2023][fide]. This fixed edition, rather
  than an unspecified future edition, is the comparison baseline.
- Cryptids code inspected at `388491d195cda26e07cff5a8d2229c8ddc69a8bf`:
  machine semantics, library imports, Lake configuration, challenge/comparator
  conventions, and Linux verification workflow.
- The PR discussion contains an earlier author/AI review reporting no semantic
  issues and a resolved obsolete-link comment. Neither is independent proof.
  The pinned source already has the corrected handbook URL.

Method: read all definitions and both theorems; compare the intended abstract
rules; follow update and result dependencies; then challenge boundary cases and
quantifiers. One exhaustive finite arithmetic replay checks sliding-piece segment
geometry. Its encoding, output, and limitations are in [EVIDENCE.md](EVIDENCE.md).
No Lean proofs, engine comparison, full move-generator tests, or port builds were
performed. Historical attribution and the truth of the draw conjecture are outside
this audit.

## Exact target and dependency chain

Let `D := Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss`. The campaign target
remains `ConjectureMachines.Halts M_chess ↔ ¬D`, not a proof of `D` or `¬D`.

The source defines each player's avoid-loss claim with one globally legal
history-dependent strategy against every globally legal opposing strategy, and
requires an actual finite result. It does not equate one winning line with a
forced win. The relevant dependency chain is:

```text
board geometry and attacks
  → pseudo-legal ply → board update → king-safe legal ply
  → position update → history and repetition
  → automatic outcomes and optional claims → legal actions
  → Reachable / IsLegalStrategy / ResultsIn
  → WhiteCanAvoidLoss / BlackCanAvoidLoss
```

`Position.Next` is a separate legal-ply relation used for dead-position
reachability. It deliberately does not require game-level nontermination.

## Findings and proposed corrections

Severity describes the effect on a future verified Cryptids contribution. These
are not six newly discovered chess-rule bugs. `GAP` denotes a future proof or
integration obligation; `UNCLEAR` denotes a documentation/API boundary.

### F1 — Isolate the open conjecture from trusted solution imports

**Severity: blocking integration issue. Classification: GAP, not a source bug.**
Location: source lines 636–638, `perfect_play_results_in_draw`.

The conjecture is deliberately proved with `sorry` in its conjecture repository.
That is appropriate there. Using it in a machine/evaluator correctness proof
would introduce `sorryAx` and could make an unrelated looping machine appear to
encode chess. Merely importing a module containing the theorem does **not**
automatically make every subsequent theorem depend on it; transitive dependency
inspection, not a blanket import accusation, determines contamination.

Proposed correction in Cryptids: create a definitions-only module excluding this
theorem, and audit every public correctness theorem's axioms and assumptions.
Retain the original source as noncompiled evidence. Do not remove or prove the
open conjecture upstream as part of this task. The only other theorem in the
source, `initial_position_sanity`, is a small `rfl` sanity check, not a proof of
rule fidelity or determinacy.

### F2 — State the reachable-position boundary at the API

**Severity: major API obligation. Classification: UNCLEAR; no reachable-game
counterexample found.** Location: lines 133–138, 250–253, 354–375, 380–381,
440–446, and 573–576.

`Position` permits arbitrary boards and metadata. `IsLegalPly` does not enforce
the presence of kings or that an en-passant target arose on the previous move.
`applyBoard`, `applyPly`, and `Game.play` are expressly unchecked updates. Their
behavior on malformed inputs must not be advertised as chess validation.

Two concrete domain witnesses, evaluated by unfolding the source definitions:

1. Put only a White rook on a1 and a Black king on h8, White to move, no rights
   or en-passant target. The source accepts a1–a2: it has the rook's movement
   pattern and `InCheck` is false because there is no White king. This is an
   invalid position, not a counterexample to play from `Game.initial`.
2. Put White king a1, Black king h8, White pawn d4, Black pawn e4, White to move,
   no rights, and fabricate `enPassantTarget = e5`. The source accepts d4xe5
   en passant and removes e4. Its shape predicate trusts the fabricated metadata.
   Legal play creates no such target: White targets have rank 2 internally and
   Black targets rank 5 internally, as set by `nextEnPassantTarget`.

Proposed correction: retain the reference's raw predicates, document their
domain, and prove invariants for `Reachable`. A future external-position loader
needs validation or a stated well-formedness precondition. Do not silently add
new guards to `IsLegalPly` and call that a definition-preserving port. The
examples above are specification-level calculations, not Lean-checked tests.

### F3 — Supply result-totality and strategy bridge theorems

**Severity: major proof obligation. Classification: GAP, not an established
quantifier error.** Location: lines 552–615.

The file states `ResultsIn` inductively but does not prove legal strategies
exist, legal strategy pairs have results, results are unique, or minimax agrees
with the avoid-loss propositions. Thus compilation alone would not certify the
game-theoretic interpretation. The source does not assert that these supporting
facts have already been proved.

The mathematical checks below support the definitions rather than refute them:

- A nonterminal game has a legal ply: if it had none, excluded middle on
  `InCheck` would give checkmate or stalemate, hence an automatic result.
- A globally legal strategy can therefore choose a legal action at every
  eligible game and use an arbitrary default elsewhere. Classical choice is
  sufficient for this existence argument. Global legality is not evidently
  vacuous; it still needs a Lean theorem.
- Automatic outcomes cannot disagree. Checkmate excludes stalemate; it excludes
  deadness by reflexivity of `ReflTransGen`; the other draw constructors require
  non-checkmate. Multiple draw constructors produce the same `Outcome.draw`.
- A fixed strategy pair cannot choose both a claim and a play. With unique
  automatic outcomes and induction on result derivations, this gives result
  uniqueness. Bounded play, described below, supplies result existence.

Proposed correction: add named supporting theorems in a separate lemma layer;
keep the strategy quantifiers unchanged. Classify the result/termination/minimax
lemmas as future M3–M4 proof work, not as completed M1 formal verification.

### F4 — Preserve exact dead-position reachability

**Severity: major executable-refinement obligation. Classification: GAP, not an
established rule mismatch.** Location: lines 489–494; compare 568–576.

`IsDeadPosition` quantifies over arbitrary finite legal-ply continuations to
either player's checkmate. It neither asks for forced mate nor merely tests
material. `Position.Next` continues independently of automatic game draws; using
`IsLegalAction` in its place would change the specified reachability problem.

The full `Position` type is infinite because of the natural-number clock. That
does not make this reachability undecidable: legal-ply acceptance and checkmate
do not inspect that clock. Projecting to board, turn, rights, and en-passant data
therefore suggests a finite graph. Edge projection and path lifting must be
proved; counting full positions without this argument is invalid.

Proposed correction: preserve the reference definition and later prove an exact
finite-graph decision procedure agrees with it. If a different dead-position
policy is chosen for evaluation, require a separately stated game-value theorem.
No insufficient-material substitution or rule deletion is justified by this audit.

### F5 — Port the specification without importing conjecture infrastructure

**Severity: major integration obligation. Classification: GAP.** Location:
source line 17, five `noncomputable` definitions at 280, 354, 416, 440, 520, and
the two repositories' pinned toolchains and Lake files.

The source imports `FormalConjecturesUtil`, which in turn imports all of Mathlib,
`FormalConjecturesForMathlib`, answer support, and repository-specific linters.
Its category/AMS attributes are metadata, not chess semantics. The source uses
Lean/mathlib v4.33.1; Cryptids pins v4.35.0-rc4. A direct dependency would introduce
compatibility and build-scope questions without supplying the executable code.

Proposed correction: an attributed local definitions-only port with Mathlib
imports, source namespace and propositions preserved, and explicit documentation
of metadata/import changes. Keep executable counterparts separate. Neither
compatibility nor definitional correspondence has been checked in Lean yet.
The detailed recommendation is in [PACKAGING.md](PACKAGING.md).

### F6 — Fix the edition and abstraction in the documentation

**Severity: minor documentation correction. Classification: UNCLEAR.** Location:
lines 22–32, 531–539, and 636–638.

The prose says current rules, while its concrete source is the 2023 handbook.
The atomic claim action suppresses claim paperwork and invalid-claim penalties.
It checks the existence of a valid announced move without storing that witness
in `Action.claimDraw`. A valid claim ends immediately, so this omission does not
by itself change outcomes in the intended abstract game.

Proposed correction: explicitly name the 2023 edition and explain that decisions
occur before physical move procedures and only valid claims are modeled. Keep
the current action type for the reference; a future executable claim operation
can return a witness/certificate internally and prove that forgetting it yields
the same action semantics. These are proposed prose changes, not source edits.

## Rule and definition coverage

`OK` means no discrepancy found in this source review, not a Lean proof of
equivalence to the English rules. FIDE article references are an index to the
fixed handbook; the explanations are principally analysis of the pinned code.

| Source lines | Definition group | External comparison | Audit outcome |
| --- | --- | --- | --- |
| 45–138 | Colors, pieces, squares, rights, plies, positions | Board/move state | OK; finite fields, with an unbounded clock and unvalidated metadata (F2) |
| 141–163 | Distances, open segment, path clearance | Sliding geometry, Art. 3.2–3.5 | OK; all 262,144 square triples replayed against an independent ray construction |
| 166–198 | Attacks and check | Art. 3.1.3, 3.9 | OK; attack detection intentionally ignores the attacker's own king safety |
| 201–244, 300–309 | Castling coordinates and preconditions | Art. 3.8 | OK on the intended domain; transit checked on old board, destination via final board |
| 247–289, 312–341 | Pawn moves, captures, promotion, pseudo-legality | Art. 3.6–3.7 | OK; all four promotion kinds allowed, null plies excluded by outer predicate |
| 294–297, 354–381 | Destination and board update, legal ply | Art. 1.4.1, 3.9 | OK; no king capture, final king-safety check includes special-move board effects |
| 384–446 | Rights, en-passant metadata, captures, clock | Historical move state | OK on legal histories; rights only decrease, target expires, pawn/capture resets clock |
| 451–474 | Initial board and position | Art. 2 | OK by direct inspection; queens on d-files, kings on e-files, White starts |
| 477–494 | Mate, stalemate, position reachability, deadness | Art. 5.1–5.2 | OK as a reference; deadness remains a global decision problem (F4) |
| 497–527 | Repetition equality, history, occurrence witnesses | Art. 9.2.3 | OK; compares legal en-passant possibilities rather than the raw target; injective indices prevent double-counting |
| 532–543 | Current/announced draw claims | Art. 9.2–9.3 | OK as atomic valid claims; optionality preserved at the action layer (F6) |
| 546–576 | Outcomes, legal actions, reachability | Art. 5, 9.6 | OK; automatic outcomes prohibit further actions, claims do not extend play |
| 579–615 | Strategies, finite results, avoid-loss statements | Perfect-play interpretation | Quantifier structure OK; supporting existence/determinacy lemmas missing (F3) |
| 619–638 | Sanity theorem and open conjecture | Proof/trust boundary | Sanity check is narrow; conjecture must be excluded from trusted solution imports (F1) |

## Hostile pass: objections checked and rejected

1. **“Pinned pieces must not attack.”** Incorrect for the intended attack
   relation. The source separates attacks from legal moves; keep that distinction.
2. **“Castling forgets the destination check.”** False: `IsLegalPly` tests
   `InCheck` after `applyBoard` relocates both king and rook. For transit, a new
   sliding attack exposed solely by vacating the king's origin would also attack
   that origin on the clear home-rank route, already prohibited. A general
   equivalence lemma remains appropriate for the later refinement proof.
3. **“Every recorded en-passant target must distinguish repetitions.”** False:
   `SamePosition` compares actual legal en-passant opportunities. An unavailable
   capture, including one forbidden by king safety, contributes no difference.
4. **“Deadness and checkmate allow contradictory automatic outcomes.”** False:
   the zero-step `ReflTransGen` witness makes a checkmated position non-dead.
5. **“The source forces claims at three repetitions or 100 halfmoves.”** False:
   claim predicates enable `claimDraw`; continuing with a legal ply remains an
   option before an automatic outcome.
6. **“The announced ply must execute before a successful claim.”** Not in this
   abstraction: the claim ends the game. The source checks the hypothetical next
   state and stops at the current one.
7. **“A claim is possible after checkmate.”** Not through `IsLegalAction`, which
   excludes all automatic outcomes. `CanClaimDraw` alone is only an eligibility
   predicate and is not the full legal-action test.
8. **“Finite board means a finite `Game` or finite strategy type.”** False: clocks
   and histories are unbounded as types, and strategies are functions on all
   games. Bounded reachable play, rather than finite raw strategies, is the route.
9. **“Ignoring the clock in dead-position search permits ignoring it in the game
   evaluator.”** False: the clock does not affect `Position.Next`, but does affect
   claims and automatic outcomes. The required preservation statements differ.
10. **“The extra non-checkmate guard on fivefold repetition changes initial play.”**
    No counterexample found. Earlier repetition-equivalent positions have the
    same available moves/check status, so a terminal checkmate cannot first be
    reached as a fifth occurrence along a continuing legal history. A formal
    repetition-invariance lemma would certify this observation.
11. **“Pawns need a separate has-moved bit to forbid a later double advance.”**
    Not on reachable histories: unpromoted pawns move only forward and cannot
    return to their initial rank. The source restricts double advances to that
    rank; the preservation lemma remains future work.
12. **“Fivefold detection must scan every past position, not just the current one.”**
    Not on a history respecting automatic termination: the game stops on the
    arrival that creates the fifth occurrence. A fabricated history may already
    have passed that event, which is another reason to expose `Reachable`.

## Supporting mathematical analysis and remaining obligations

The following are source-level arguments, not new Lean theorems or a blanket
verification certificate.

### Bounded play and nonvacuity

Take a key containing the board, side to move, four rights bits, and raw
en-passant target. There are at most

```text
N = 13^64 * 2 * 16 * 65
```

keys: each square is empty or contains one of twelve colored piece kinds.
This is an overcount; reachable legality restrictions are unnecessary for it.
Equal keys imply `SamePosition`: move legality and en-passant availability do
not depend on `halfmoveClock`. At any nonterminal visit there can be at most
four occurrences of that key in the game's recorded positions; a fifth implies
the automatic repetition draw because nonterminality excludes checkmate.

Consequently a legal continuing prefix contains at most `4*N` nonterminal
positions. Starting at the initial game, a run cannot take more than `4*N`
play transitions before reaching an automatic result, unless an optional claim
ends it earlier. The terminal endpoint may be an additional recorded position;
it need not satisfy the nonterminal occurrence limit. Every next action is legal
under globally legal strategies, so the nonterminal legal-action argument in F3
then gives a finite result. Formalizing this counting and recursion is M4 work.

### Why the two avoid-loss propositions express a draw

For a finite legal game tree, order outcomes as Black win < draw < White win;
White chooses a maximum and Black a minimum. A value of draw supplies each
player an avoid-loss strategy. Conversely, a White-win value contradicts Black's
avoid-loss claim, and a Black-win value contradicts White's. Extend the strategies
to unrelated reachable histories by legal default choices. This checks the
quantifier direction without assuming which value the initial position has.
The precise game-tree/strategy bridge and all recursive constructions remain
future Lean obligations, not premises supplied by this audit.

### Invariants to expose rather than silently assume

The proposed API should distinguish arbitrary raw positions, locally coherent
positions, and histories actually reachable from `Game.initial`. Useful proved
consequences of reachability include:

- Exactly one king of each color, distinct nonadjacent kings, no captured king,
  and the nonmoving player's king safe after each legal ply.
- No unpromoted pawn on a last rank; pawn/capture updates and promotions preserve
  the relevant material and square properties.
- A retained castling right implies the required king/rook at their home squares;
  rights never reappear after movement or rook capture.
- En-passant metadata is absent or justified by the immediately preceding double
  pawn advance; it expires on the next ply. Its existence does not imply a legal
  en-passant capture.
- The clock and complete reverse-chronological history agree with the actual
  sequence of legal plies. Histories do not continue after an automatic outcome.

Do not define a cheap local validator as equivalent to historical reachability.
For dead-position analysis, use legal-ply reachability separately from game-level
reachability; there is no justification for adding automatic-draw guards there.

## Proposed disposition and status

Preserve all chess-rule and strategic definitions. Make the documentation and
packaging corrections F1, F2, F5, F6 when implementation is authorized, and track
F3/F4 as proof/refinement obligations. An upstream source correction is not
currently warranted by a demonstrated reachable-game rule error.

The recommended port should retain `namespace Chess` so the intended public
strategic names remain stable. Its exact namespace, import, visibility, and
attribute changes must be recorded as port changes and checked on the Cryptids
toolchain. See [PACKAGING.md](PACKAGING.md) for the proposed boundaries and gates.

M1 status: audit/documentation portion complete; candidate source identified and
archived; packaging recommended; reference module, build, formal correspondence,
and final freeze pending. M2–M7 remain unstarted. No source correction, executable
refinement, proof implementation, issue, PR, or outreach was made by this task.

[pr]: https://github.com/google-deepmind/formal-conjectures/pull/5216
[source]: https://github.com/bocowgill/formal-conjectures/blob/03536100b3d15e928f45649e7935f8c2b785337b/FormalConjectures/Books/Chess.lean
[fide]: https://handbook.fide.com/chapter/E012023
