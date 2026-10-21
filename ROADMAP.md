# Chess Cryptid Campaign

Planning date: 2026-10-19. Status: M1 complete; `chess-reference-v1` is built,
source-checked, and frozen. M2 is complete with executable rules, unrestricted
refinement proofs, and regression fixtures. M3 is complete with exact history,
claims, terminal outcomes, and finite-graph dead-position detection. M4 is complete
with bounded play, total evaluation, and exact strategic correspondence (2026-10-20).
M5 is complete with a verified binary backend and four literal blank-tape small-game
machines (2026-10-20). M6 is complete with the verified 392,046,832-state baseline
and retained literal table (2026-10-20). M7's first certified reduction is complete:
392,046,822 states, ten fewer than M6, with the same halting equivalence (2026-10-20).
The OpenEvolve compiler pilot is complete: a further certified reduction to
392,046,821 states, with verified search integration and passing regressions
(2026-10-21).
Heavy computation remains remote; outreach remains on hold.

## 1. Agreed objective and scope

Construct an explicit deterministic, two-symbol, blank-tape Turing machine
`M_chess` and a Lean proof of

```text
ConjectureMachines.Halts M_chess ↔
  ¬ (Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss).
```

The strategic propositions must refer to the reviewed chess specification,
standard initial position, and the rule edition fixed below. The theorem must
hold without assuming either the draw conjecture or its negation.

Primary success is a concrete machine and the complete checked equivalence.
Computing the perfect-play value of the initial position is outside this
campaign's completion criteria. Running an exhaustive evaluator to completion
from the initial position is unnecessary. Reducing the machine's state count is
a subsequent research phase; a small numerical bound is not promised in advance.

The intended construction is a total, verified evaluator followed by a wrapper:

```text
evaluate the standard initial game
if the value is WhiteWin or BlackWin: halt
if the value is Draw: enter a proved infinite loop
```

This wrapper describes the intended behavior. M6 supplies concrete source,
verified compilation, paid blank initialization and the exact table theorem,
without running the initial-position evaluator to completion.

### Rules and permitted changes

- Model standard chess's abstract game under the [2023 FIDE Laws][fide], the
  edition cited by the source specification. Include legal moves, castling,
  en passant, promotion, checkmate, stalemate, dead positions, optional threefold
  and 50-move claims, and automatic fivefold and 75-move draws.
- Exclude clocks, resignation, agreed draws, physical move procedures, and
  administrative penalties. Record the abstraction of valid claims explicitly.
- Audit the reference before designating a reviewed version. Corrections are
  permitted, but must have a rationale, source reference, regression example,
  and an explicit account of their effect on the target proposition.
- Preserve the original source and its provenance. A correction that changes
  semantics must be identified as such; do not claim equivalence to an erroneous
  older model unless that equivalence is separately proved.
- Any implementation simplification must have an applicable correctness or
  game-value-preservation theorem. No rule may disappear silently.

### Current authorization

The initial tasks authorized the fork, roadmap, source audit, packaging recommendation,
and the completed definitions-only reference port and freeze. M2–M6 were subsequently
authorized and completed. M7's first certified strict improvement is complete.
The current instruction authorizes an OpenEvolve pilot using M7 as a regression
case and targeting one compiler routine for a further certified reduction.
Heavy computation remains
remote and the frozen reference stays fixed. The historical
audit is recorded in
[docs/chess/m1/AUDIT.md](docs/chess/m1/AUDIT.md), with the proposed module boundaries
in [PACKAGING.md](docs/chess/m1/PACKAGING.md). The completed M1 reference is recorded
in [FREEZE.md](docs/chess/m1/FREEZE.md). New issues or PRs and maintainer
messages remain outside the authorized scope.

## 2. Repository and source baseline

Develop in [bocowgill/cryptids][fork], a fork of
[google-deepmind/cryptids][upstream], with incremental upstream contributions as
the intended integration route. Keep `main` available for upstream synchronization
and use `codex/` branches for campaign work. The planning branch is
`codex/chess-roadmap`. This checkout's existing upstream remote remains intact.

The versions below identify the inputs; the source-audit result is recorded
separately and does not establish a compiled or formally verified port:

| Input | Recorded version | Role |
| --- | --- | --- |
| Cryptids starting point | `a0c1f56af53a76e985a656032b48015f7e48921b` | Existing machine model, proof architecture, artifact and comparator conventions |
| Cryptids Lean toolchain | `leanprover/lean4:v4.35.0-rc4` | Campaign starting toolchain; preserve its pinned dependencies |
| Chess proposal | [FormalConjectures PR #5216][chess-pr], open when checked | Audited source for the completed definitions-only port |
| Chess candidate source | [`FormalConjectures/Books/Chess.lean`][chess-source] at `03536100b3d15e928f45649e7935f8c2b785337b` | Precise source snapshot for the audit |
| Chess candidate Git blob | `8018d10a3bfcd375a17c76599cfd3ceafe3e930d` | Matches the archived audit input byte for byte |
| Chess source SHA-256 | `ad43e6cfa086ff692daf57b8ee2444faa34f318ff43e05e44b53b27a53e10348` | Identity of `docs/chess/m1/source/Chess.lean.txt`; not a proof certificate |
| Candidate's Lean toolchain | `leanprover/lean4:v4.33.1` | Porting obligation; source build reports do not establish compatibility here |
| Strategic statement | [FormalConjectures issue #5154][chess-issue] | Statement and scope provenance |
| Frozen Cryptids reference | [chess-reference-v1](docs/chess/m1/reference-v1.json) | Exact module/checker/pin hashes; 385 matched Chess declarations and 2,728 declarations in their dependency closure |

Avoid a floating dependency on an entire research repository. Prefer a minimal,
attributed definitions-only reference snapshot with the necessary support adapted
to this project's toolchain, plus a documented correspondence to the pinned
source. Decide the exact packaging during M1. In particular, the source ends in
the open theorem `perfect_play_results_in_draw`, whose proof contains `sorry`;
the campaign's trusted reference module should omit that theorem.

Candidate module layout, to be settled before implementation:

```text
Cryptids/Chess/              reviewed reference, executable rules, game proofs
Cryptids/Compilation/        reusable backend components, only where justified
Cryptids/Semantics/Chess.lean    end-to-end machine/strategy theorem
artifacts/chess_baseline/    literal transition table and construction provenance
comparator/chess*.json       independent statement and axiom audits
```

M1 implements `Cryptids/Chess/Spec.lean`, `SpecLemmas.lean`, and the
`Cryptids/Chess.lean` aggregate. The remaining paths are proposals. Reuse
`Cryptids/Machines.lean` for later machine execution semantics; keep the eventual
initializer, table format, and counting conventions compatible with the repository.

## 3. Completion standards

Every completed milestone must identify its source commit, theorem names, exact
validation commands, and observed results. Mark an obligation complete only when
the evidence exists. A planned theorem, source comment, successful example, or
bounded simulation is not a completed proof.

For accepted implementation and proofs:

1. Build with the pinned Lean/mathlib versions, with no new warnings in the
   changed modules. Keep existing library targets building.
2. Audit the transitive axioms of every public correctness theorem. Permit only
   the repository's standard axioms: `propext`, `Quot.sound`, and
   `Classical.choice`. Reject `sorryAx`, added axioms, the open draw theorem, or
   a hypothesis that assumes the desired halting equivalence or game value.
3. Make runtime paths executable without noncomputable choices or external
   oracles. Classical reasoning in proofs is acceptable; it does not itself
   produce executable code.
4. State domains and invariants explicitly. If correctness is restricted to
   reachable or well-formed positions, prove the initial state satisfies the
   restriction and all relevant transitions preserve it. Do not silently narrow
   a theorem to avoid a chess-rule case.
5. Use tests to check encodings and detect shared specification mistakes; use
   proofs to establish universal claims. Retain test fixtures and provenance.
6. Keep a durable list of open obligations, failed approaches, and decisions
   once implementation begins. Preserve counterexamples and tool encodings.

An independent challenge specification may contain placeholder statements in
the repository's comparator style. Such files must not supply proofs to solution
modules, and the checked solution theorems must have no placeholder dependency.

## 4. Milestones and acceptance criteria

| ID | Goal | Depends on | Status |
| --- | --- | --- | --- |
| M0 | Establish fork and campaign contract | User's scope decisions | Complete |
| M1 | Audit, correct as needed, and freeze a usable reference | M0; authorized definitions-only port | Complete: chess-reference-v1 |
| M2 | Verify executable move generation and position updates | M1 | Complete: implementation `3fe6082` |
| M3 | Verify history, claims, and terminal outcomes | M2 | Complete: implementation `9115a21` |
| M4 | Prove bounded play and evaluator/strategy equivalence | M3 | Complete: implementation `0e62d56` |
| M5 | Validate the compilation route on small finite games | M1; can proceed alongside M2–M4 | Complete: implementation `b3f5e29` |
| M6 | Construct and verify the baseline chess machine | M4, M5 | Complete; 392,046,832 states |
| M7 | Reduce states while preserving the target theorem | M6 | Complete; first strict reduction to 392,046,822 states |

### M0 — Fork and planning contract

Goal: establish a reviewable campaign without starting implementation.

Acceptance criteria:

- [x] Create `bocowgill/cryptids` and verify its parent is `google-deepmind/cryptids`.
- [x] Record the agreed target, reference-audit policy, incremental contribution
  strategy, dependencies, and objective completion criteria in `ROADMAP.md`.
- [x] During the initial planning task, limit campaign file changes to this
  document; open no issue or PR and send no outreach. Leave later milestones
  unstarted at that point.

### M1 — Audited and pinned chess reference

Goal: make the mathematical target precise and suitable for subsequent proofs.

Audit outcome: no confirmed reachable-game rule defect. The port preserves the
reference bodies and strategy quantifiers. Its open-conjecture/import boundaries,
domain contract, rule-edition documentation, toolchain build, compiled correspondence,
and reference freeze are complete. M3's terminal refinement and M4's bounded-play
and strategy proofs are complete. M2's move/update refinement is recorded
separately. The archive remains noncompiled
evidence. See the historical
[audit](docs/chess/m1/AUDIT.md), [audit evidence](docs/chess/m1/EVIDENCE.md), and
completed [freeze record](docs/chess/m1/FREEZE.md).

Deliverables: a rule-to-definition audit, source/provenance record, a minimal
reference module, an invariant specification, and a log of corrections or unresolved
questions. Review both rule fidelity and the strategic statement's meaning.

Acceptance criteria:

- [x] Trace modeled rules to the fixed edition; cover king safety and attacks,
  castling transit/destination safety and lost rights, en-passant eligibility,
  all promotion choices, history, draw claims, and automatic-result precedence.
- [x] Audit `SamePosition`, especially legal en-passant availability, and the
  treatment of claims based on an announced move. Distinguish piece-move legality
  from permission to continue a game after an automatic result.
- [x] Audit `Reachable`, `IsLegalStrategy`, and `ResultsIn` for vacuous strategy
  quantification or missing results. Record the required existence, legality,
  termination, and uniqueness lemmas for M3–M4.
- [x] Define the exact well-formedness/reachability assumptions needed downstream,
  including kings, castling/en-passant consistency, counters, and legal histories.
  [DOMAIN.md](docs/chess/m1/DOMAIN.md) fixes the domain using the compiled reference's
  `Reachable` predicate and raw-refinement contract. Precise invariant conclusions
  are recorded; their preservation proofs remain later work and are not assumptions
  added to the target.
- [x] Resolve target-affecting audit findings before declaring the reference
  frozen. Retain the original and document each change. A semantic correction
  requires a newly identified reviewed target, not an unexplained replacement.
- [x] Build the minimal reference on the Cryptids toolchain. Record commit,
  file hash, licensing, porting changes, and the correspondence to the original
  definitions. Do not import the open draw theorem into the proof dependency chain.

Exit condition: the reviewed target and executable refinement domains are fixed;
any remaining question has an explicit owner and does not undermine that target.

### M2 — Executable move generator and state transition

Goal: implement a complete executable refinement of the reviewed move rules.

Deliverables: finite encodings, `legalPlies`, executable board/position updates,
refinement proofs, and rule-focused regression fixtures. Public names below are
schematic; adapt them to the final representation and namespace.

Acceptance criteria:

- [x] Give executable equality, finite move enumeration, and encoding/decoding
  functions with round-trip theorems. A function-valued reference board must have
  a proved correspondence to its concrete executable representation.
- [x] Prove soundness and completeness on the declared domain:
  `m ∈ legalPlies p ↔ Reference.IsLegalPly (decode p) (decodePly m)`.
  Enumerate every promotion option and specify duplicate behavior.
- [x] Prove executable updates agree with `applyBoard` and `applyPly`, including
  board contents, turn, rights, en-passant state, and the halfmove clock.
- [x] Prove initial encoding correctness and preservation of the invariants
  needed by later milestones under legal moves.
- [x] Run regression cases for both castling sides and colors, prohibited
  castling through check, rook move/capture rights loss, pinned en passant,
  en-passant expiry, promotion/underpromotion, check evasion, checkmate, and
  stalemate. Include initial-position move counts and a modest, reproducible
  legal-move-tree count suite with independently documented expectations.
- [x] Build and axiom-audit the refinement theorems; execute the runtime
  implementation on the fixtures without noncomputable definitions.

Exit condition: every legal move and its full position update are covered by
checked refinement theorems. Terminal adjudication is addressed separately in M3.

Completed in implementation commit `3fe6082385cdbf5136a02af43ea61aaab8e5de13`.
The unrestricted domain needs no additional chess-state invariant. Vector sizes
are intrinsic; `decode_initial`, `invariant_applyPly`, and `reachable_applyPly`
establish initial correctness, reference invariant transport, and exact legal
history closure. This does not claim all desired reachable-game consequences in
M1's `DOMAIN.md` have been proved. All 164 rule assertions and 22 sourced perft
counts passed. See [M2 results](docs/chess/m2/RESULTS.md) for commands and trust
audit results.

### M3 — Exact history, draw claims, and terminal outcomes

Goal: connect executable game actions and adjudication to the reviewed game model.

Acceptance criteria:

- [x] Implement and prove exact correspondence for repetition equality,
  occurrence counting, game-history extension, and valid claims, including claims
  based on an intended legal move. Claims remain optional actions.
- [x] Implement checkmate, stalemate, automatic draws, and the complete legal
  action set. Prove correspondence to `AutomaticOutcome` and `IsLegalAction`.
- [x] Prove automatic outcomes are unique on the relevant domain, no action is
  legal after one, and every reachable nonterminal game has an available action.
  Cover checkmate at an automatic-draw threshold explicitly.
- [x] Resolve dead positions exactly. The baseline route is finite-graph
  reachability for `Position.Next` after projecting away the halfmove clock;
  prove move-edge correspondence, path lifting/projection, and preservation of
  checkmate before using this projection to decide `IsDeadPosition`.
- [x] Respect the source's unrestricted legal-ply reachability in that definition;
  do not replace it with an insufficient-material heuristic or stop that search
  at other game-level draw rules without a proof.
- [x] If deferring dead-position termination is chosen instead, replace the exact
  terminal-refinement requirement with an explicit, proved preservation theorem
  connecting the modified game to the reviewed strategic proposition. Record
  this design change before using it; local material tests are insufficient.
  Not applicable here: the exact finite-graph route was completed; no modified
  game or alternative preservation theorem is used.
- [x] Test repetition with changing rights/en-passant possibilities, immediate
  and intended-move claims, reset/threshold counters, terminal precedence, and
  dead/non-dead examples. Preserve full history until a proved compression
  theorem justifies discarding it.

Exit condition: terminal behavior and legal actions are executable and justified
against the reference, or a documented alternative has its full preservation proof.

Completed in implementation revision `9115a213a1203fde1e9b4725e1b0b0eee6b3426d`.
The exact proof chain removes only the clock, preserves legal edges and checkmate,
lifts/projects paths, and proves a terminating finite-graph search correct.
Outcome uniqueness and nonterminal action existence hold on all raw games.
The safe declaration audit covers 174 M3 roots and 8,279 dependencies, with only
standard axioms; one compiler-generated recursion implementation is separately
inventoried and excluded from the mathematical dependency closure. All 55 runtime
assertions passed. See [design](docs/chess/m3/DESIGN.md) and
[results](docs/chess/m3/RESULTS.md). The exact search can be astronomically slow.

### M4 — Bounded play, backward induction, and strategic correctness

Goal: prove a total executable evaluator returns the value expressed by the
reference's history-dependent strategy definitions.

Acceptance criteria:

- [x] Prove finite branching using the legal-action enumeration.
- [x] Prove a uniform finite bound on legal play from the initial game. Prefer a
  coarse pigeonhole argument: finitely many encodings of board, turn, castling
  rights, and en-passant data; equality implies repetition equivalence; fivefold
  repetition bounds a continuing prefix. Prove the counting and endpoint details,
  including terminal moves and claims. Do not assume the full `Position` or `Game`
  type is finite: they contain an unbounded clock and history.
- [x] Distinguish the finite key used to prove termination from a replacement
  for the full game state. Keeping only that key does not justify dropping
  repetition history, the halfmove clock, or draw-claim choices in evaluation.
- [x] Construct a total evaluator by backward induction over the bounded legal
  tree, with proved fuel sufficiency if a fuel-based implementation is used.
  Fuel exhaustion must not be interpreted as a draw without that theorem.
- [x] Prove legal strategies exist, every legal strategy pair from the initial
  game produces a unique result, and the evaluator constructs/characterizes
  optimal legal strategies. Address global strategy legality on reachable
  histories outside a chosen play; do not enumerate `Strategy := Game → Action`
  as though this function type were a finite list.
- [x] Prove
  `solve initial = draw ↔ (WhiteCanAvoidLoss ∧ BlackCanAvoidLoss)`
  and the corresponding White-win and Black-win characterizations. A winning
  line is not a proof of a winning strategy against every legal response.
- [x] Test the evaluator on bounded games/positions of known outcomes, including
  a claim that improves a player's outcome to a draw. Audit all public theorem
  dependencies independently of `perfect_play_results_in_draw`.

Exit condition: a computable, total evaluator is linked to the strategic
proposition. No initial-position exhaustive run or sharp maximum game length is
required. Literature bounds, if later used, need their own applicability proof.

Completed in implementation revision `0e62d56fdb5971900250949fa82affb5734c68b9`.
A proof-only finite-key capacity bounds played prefixes and claims by `8*N+1`,
where `N` is the finite key cardinality, even on arbitrary input histories.
The executable recursion keeps full state and has no fuel cutoff. Globally legal
pointwise policies, unique results for legal strategy pairs, optimality against
all legal opponents, and all three initial-value characterizations are proved.
The audit covers 111 safe M4 declarations and 8,713 dependencies using only standard
axioms; two compiler-generated recursion artifacts are separately inventoried and
excluded from the mathematical closure. All 21 M4 assertions and prior regression
suites passed. See [design](docs/chess/m4/DESIGN.md) and
[results](docs/chess/m4/RESULTS.md). The initial value was not computed.

### M5 — Verified compilation route on small games

Goal: remove backend uncertainty before compiling full chess.

Deliverables: a documented compilation/simulation design, a suitable small
intermediate language, and explicit binary machines for test games.

Acceptance criteria:

- [x] Inspect existing register-machine and tape proofs for reuse. Choose the
  smallest backend sufficient for recursive finite-game evaluation and its data
  encoding. Record language semantics, arithmetic/storage operations, stack
  invariants, and the program-to-machine relation.
- [x] Prove simulation for the actual supported language/program. Arbitrary Lean
  evaluation is not assumed to have an existing verified compiler. An executable
  Lean prototype alone does not discharge compilation correctness.
- [x] Establish both directions of the required halting correspondence; prevent
  unintended machine halts and prove the draw wrapper loops forever. Account for
  initialization, malformed encodings on reachable executions, and memory growth.
- [x] Compile small branching games with White-win, Black-win, and draw outcomes.
  Include a game where one favorable line does not imply a forced win.
- [x] Produce literal two-symbol transition tables that start on blank tape and
  construct their own game/program data. Prove their end-to-end equivalences;
  use bounded simulation as additional evidence, not as a nonhalting proof.
- [x] Demonstrate reproducible table generation, canonical serialization, state
  counting, and an independent checker/audit of a small-game target statement.

Exit condition: a concrete backend works end to end and is adequate for the
operations required by chess. This milestone can inform M2–M4's representations.

Completed implementation: `b3f5e29eebcb96ebdebf08ebf746a0dbae01a140`, based on M4
`62d8f4df9d1c4fcd0613ca7b4c994fae4df0f501`. See
[M5 design](docs/chess/m5/DESIGN.md), [results](docs/chess/m5/RESULTS.md),
[acceptance ledger](docs/chess/m5/GATES.md), and
[construction manifest](artifacts/chess_m5/manifest.json).

`Examples.generated_halts` proves both directions from blank binary tape for every finite
tree. The White-win, Black-win and draw fixtures each have 49,910 states; the favorable-line
refutation has 58,838. Each exact table has an independent kernel halting/nonhalting certificate,
row-semantics identity, canonical regeneration and literal export check. The standalone target
checker compares all four statement bodies and their dependencies and rejects proposition and
valid-transition mutations. The audit excludes proof holes, the open chess conjecture and
nonstandard axioms. The complete M1–M4 regression baseline passes.

The original M1 Lake configuration remains frozen; the checked additional generator target
uses `lakefile.chess-m5.toml`. At M5, full-chess translation and published table
identity remained for M6; that subsequent milestone is completed below.

### M6 — Explicit baseline chess cryptid

Goal: compose the verified chess evaluator and backend into the primary artifact.

Status: complete. The primary goal is achieved by the explicit 392,046,832-state,
two-symbol blank-tape machine. All eight acceptance gates pass, including the
unconditional Lean theorem, complete retained transition payload, independent
standalone target, exhaustive byte comparison and supported Linux sandbox checks.
See [M6 results](docs/chess/m6/RESULTS.md), the [proof guide](docs/chess/m6/BINARY-COMPILATION.md)
and [final review](docs/chess/m6/PUBLICATION-REVIEW.md). The initial chess value was not computed.

Acceptance criteria:

- [x] Translate the actual evaluator, rule procedures, and initial data into the
  supported backend. Prove this program refines the evaluator from M4; prove
  adequacy for any representation change made to suit the compiler.
- [x] Emit an explicit finite `Machine q 2` with `q > 0`, a literal transition
  table, and a reproducible construction manifest. Identify and count all
  interpreter, chess-program, data-initializer, wrapper, and control states.
- [x] Use the repository's state-0, all-zero blank-tape initialization and
  missing-transition halting convention. All initial board/program data must be
  produced by the machine itself. No prewritten tape, external oracle, or assumed
  chess value may be hidden in the size claim.
- [x] Prove the exact initializer reaches the evaluator's encoded initial
  configuration, and that all subsequent machine execution satisfies the
  required invariants. Prove halting iff the evaluator returns a non-draw.
- [x] Prove the unconditional end-to-end equivalence stated in section 1 for the
  exact published transition table. This theorem must exclude `sorryAx`, added
  axioms, and the open draw theorem from its dependency closure.
- [x] Add a self-contained challenge target and comparator configuration that
  independently fix the machine, chess definitions, and proposition. Audit
  transitive definitions as well as theorem names.
- [x] Verify the artifact/table/Lean definition agree, record hashes and state
  count, and retain reproducible small-game and initializer checks. Clearly
  label bounded traces as such; a full initial chess search is not required.
- [x] Complete applicable clean-checkout builds, comparator audits, and artifact
  verification using the commands in section 6. Publish a proof guide showing
  each link from blank tape to the strategic proposition.

Exit condition: the primary campaign goal is achieved. Upstream merge and
state-count improvement are tracked separately from this mathematical result.

### M7 — Certified state reduction

Goal: improve the established bound without weakening the target proposition.

Status: complete for the first strict improvement, **392,046,832 → 392,046,822
states**. Quotienting duplicate initial and halted-store Post controls saves ten
binary states while retaining the complete paid initializer and unchanged frozen
non-draw target. Kernel, independent target/axiom controls, every-row comparison,
regressions and final adversarial review passed remotely. All 9 acceptance gates
are met; none remain unmet or abandoned. See [M7 results](docs/chess/m7/RESULTS.md),
[gate evidence](docs/chess/m7/GATES.md), [research records](docs/chess/m7/RESEARCH.md)
and [independent review](docs/chess/m7/REVIEW.md). This is one certified strict
reduction, without a minimality or runtime-speed claim.

Acceptance criteria for each accepted improvement:

- [x] Freeze and retain the M6 baseline table and proof. Record the candidate's
  exact table, generator changes, and before/after state counts under the same
  conventions.
- [x] Prove `Halts candidate ↔ Halts baseline`, or prove the same end-to-end chess
  equivalence directly. Audit all representation and initializer changes.
- [x] Prove a strict state-count reduction. Runtime speedup alone does not meet
  this milestone; report runtime and proof/build costs separately.
- [x] Re-run the applicable build, independent statement/axiom audit, artifact
  identity checks, and regression suite. Keep unsuccessful searches and their
  counterexamples as research records.

The initial optimization goal is one certified strict reduction, with no invented
numerical target or claim of minimality. Set further budgets and targets after
measuring the baseline. SAT/SMT searches must retain their exact encodings and
instances; bounded failures do not imply global optimality. For consequential
SAT nonexistence results, retain a checkable UNSAT certificate when practical.

#### OpenEvolve compiler pilot

Goal: connect the real pinned OpenEvolve framework to semantic rejection filters
and mandatory Lean certificates, using accepted M7 as the fixed regression case.
Target one compiler routine: binary lowering of writes into a terminal Post
control. The certified saving is one return state, including the full paid input
initializer in the 392,046,821-state total. The model orders a supplied finite
policy family; this pilot makes no autonomous-discovery or scalability claim.

Status: complete. New proof, audit, controls, table certificate, M7 regression,
actual model-backed search and full frozen M1–M5 baseline passed remotely.
Independent review accepted matching source-bound component evidence, retaining
the first baseline timeout and its successful separate recovery. All 9 gates are
met; none remain unmet or abandoned. See
[pilot results and scope](docs/chess/openevolve/RESULTS.md).

Acceptance criteria:

- [x] Keep all 192 accepted M7 computation inputs and the frozen reference fixed;
  pass the actual M7 regression.
- [x] Execute a bounded model-backed OpenEvolve run remotely; retain
  raw proposals, feedback, checkpoints, exact versions and measured costs.
- [x] Reject malformed and semantically incorrect policies, corrupt costs and
  certificates, and actual proof timeouts.
- [x] Certify the actual smaller blank machine's unconditional frozen non-draw
  equivalence, paid initialization and universally justified table recipe.
- [x] Pass applicable regressions and independent review of authentic, current
  source-bound evidence. Preserve unsuccessful attempts and honest limits.

All substantial computation remains remote. Outreach and later milestones remain
on hold. A new expanded table sweep is outside this integration pilot; the fixed
recipe is justified universally against the accepted M7 representation.

## 5. Incremental upstream contribution strategy

Use the fork for research and propose coherent, verified contributions upstream
when useful. The [contribution guidelines][contributing] welcome new conjecture
machines and require PR review; they do not guarantee acceptance of a large
standalone chess library. Recent [PR #7][riemann-pr] demonstrates a contribution
from a fork with proofs, artifacts, and independent verification.

Proposed review units, adjustable after future maintainer feedback:

| Contribution | Minimum evidence before offering it |
| --- | --- |
| Reviewed reference and executable moves | M1–M2; precise scope, provenance, executable fixtures, complete refinement proofs |
| History, terminal rules, finite-game evaluator | M3–M4; dead-position resolution, termination, strategy/evaluator equivalence |
| Reusable backend with small-game examples | M5; a concrete verified compilation route and all outcome branches |
| Baseline chess cryptid | M6; literal machine, unconditional strategic equivalence, independent audit |
| State reductions | M7; strict count improvement and preserved halting behavior |

Keep the first upstream proposal narrow and independently useful. If maintainers
prefer a complete machine before accepting foundations, continue research in the
fork and reorganize the contribution sequence; do not weaken correctness gates.
Any FormalConjectures corrections should be separately reviewable and traceable
to its original PR. Preserve authorship and licensing when sharing definitions.

Outreach, draft PRs, review requests, and submissions are deferred by the current
user instruction. A future scope inquiry may be prepared after authorization;
upstream feedback is not permission required to perform research in the fork.

## 6. Validation and evidence plan

During implementation, run focused Lean builds and regression checks at each
milestone. At integration and release, use the repository's existing commands:

```sh
lake exe cache get
lake build
lake comparator --config comparator/all.json
python3 verify.py
```

The cache command is environment preparation. Existing commands cover only the
targets actually registered with them: extend build imports, comparator entries,
and the verifier (or add a dedicated chess verifier) before claiming chess
coverage. The final chess-specific command names will be fixed in M5–M6 rather
than presented here as commands that already exist.

The comparator currently requires `bwrap`; arrange a compatible validation
environment, such as Linux CI, if it cannot run on the development host. Record
unavailable checks as pending, never as passed. Preserve existing verification
behavior and use the project's review and CLA process for future submissions.

For each milestone, retain the commit and toolchain, command transcript/results,
public theorem and axiom inventory, fixture sources, and unresolved obligations.
For machines, also retain program/generator versions, table hashes, state counts,
initializer proofs/traces, and the independent specification audit. Mark generated
artifacts distinctly from trusted checked statements.

The initial planning task checked fork identity/parent and document completeness.
The later M1 audit adds source-level mathematical review, a byte-identified source
archive, and a finite geometry replay. The subsequent M1 port passes its focused
and default builds plus `python3 scripts/verify_chess_reference.py`, which checks
exact retained bodies, independent compiled declarations/dependencies, permitted
axioms, a semantic negative control, and the frozen manifest. M2 adds unrestricted
move/update refinement, an audit of 152 new declarations and their dependencies,
164 rule assertions, and 22 independently sourced perft counts. M3 adds exact
history and adjudication with a proved finite-graph deadness decision, 55 runtime
assertions, and a safe declaration/axiom audit. The full default build passes.
M4 adds a uniform play bound, a total evaluator, and exact strategic correspondence,
with 21 runtime assertions and a complete safe-declaration audit. These establish
M2–M4. M5 adds the actual supported stack language, verified binary lowering, blank
initialization and four literal branching-game tables. Its commands are:

```sh
python3 scripts/verify_chess_m5.py
python3 scripts/verify_chess_m5.py --baseline
```

M6 completes the primary goal with the actual full-chess source translation, paid
blank initialization and explicit 392,046,832-state table. Reproduction commands
and the exact native I/O/codec verification boundary are in [M6 results](docs/chess/m6/RESULTS.md).

## 7. Principal risks and decision points

| Risk or unresolved obligation | Planned resolution | Required by |
| --- | --- | --- |
| Reference proves the wrong abstract game or has vacuous strategy conditions | Rule audit, correction log, legality/existence/uniqueness proofs, reviewed target | M1–M4 |
| Source/toolchain incompatibility | Minimal attributed port and explicit definition correspondence | M1 |
| Local move correctness hides history or terminal errors | Separate complete history/action/outcome refinement | M3 |
| Dead positions require global reachability | Exact finite-graph decision with projection/path proof, or proved value-preserving alternative | M3 |
| A finite board is mistaken for a finite history/clock state | Explicit finite key and bounded legal-prefix proof | M4 |
| Fuel, heuristics, or favorable lines are mistaken for game value | Total backward induction, fuel adequacy, full strategy equivalence | M4 |
| Backend cannot compile the actual evaluator | Small-game experiment and explicit language/simulation contract before full compilation | M5–M6 |
| Table generation or blank initialization hides assumptions | Literal table identity, full initializer proof, independent challenge | M6 |
| Open conjecture or placeholder contaminates a theorem | Definitions-only reference and transitive axiom/dependency audit | Every proof milestone |
| State target or upstream acceptance delays primary result | Freeze verified baseline first; measure optimization and upstream status separately | M6–M7 |

## 8. Next authorized work

M1 is complete and `chess-reference-v1` remains fixed. M2's implementation,
refinement theorems, fixture provenance, and reproduction commands are recorded in
[docs/chess/m2/README.md](docs/chess/m2/README.md). M2 is complete; its evidence is
in [M2 results](docs/chess/m2/RESULTS.md). M3's exact history, claims, terminal
outcomes, and finite-graph dead-position decision are complete and documented in
[M3 design](docs/chess/m3/DESIGN.md) and [M3 results](docs/chess/m3/RESULTS.md).
M4's bounded play, total evaluator, globally legal optimal strategies, and exact
correspondence with the frozen strategy propositions are complete; see
[M4 design](docs/chess/m4/DESIGN.md) and [M4 results](docs/chess/m4/RESULTS.md).
M5 is complete: the verified compilation route and four literal branching-game machines are
recorded in [M5 results](docs/chess/m5/RESULTS.md). M6 is complete: actual source
refinement, paid blank initialization, an explicit 392,046,832-state machine and its
unconditional frozen non-draw equivalence, full table retention and independent
verification are recorded in [M6 results](docs/chess/m6/RESULTS.md).
M7's first strict reduction is complete, with the same halting equivalence and
392,046,822 states. Its authenticated remote component reports share exactly the
same 192 computation inputs; the successful regression setup helper is pinned
separately, and the earlier whole-run setup failure is retained honestly. All
heavy computation ran remotely. The frozen M6 baseline remains fixed and outreach
remains on hold.

The additional OpenEvolve compiler pilot is complete at 392,046,821 states.
It exhausts a supplied finite policy family, with five actual model proposals,
mandatory Lean certificates and a one-state strict reduction. The successful
baseline recovery shares all 17 pilot computation hashes and 192 frozen inputs
with the accepted core components; its orchestration hash is sealed separately.
The original core failure remains recorded. See
[pilot results](docs/chess/openevolve/RESULTS.md).

[fork]: https://github.com/bocowgill/cryptids
[upstream]: https://github.com/google-deepmind/cryptids
[contributing]: https://github.com/google-deepmind/cryptids/blob/a0c1f56af53a76e985a656032b48015f7e48921b/CONTRIBUTING.md
[chess-pr]: https://github.com/google-deepmind/formal-conjectures/pull/5216
[chess-source]: https://github.com/bocowgill/formal-conjectures/blob/03536100b3d15e928f45649e7935f8c2b785337b/FormalConjectures/Books/Chess.lean
[chess-issue]: https://github.com/google-deepmind/formal-conjectures/issues/5154
[fide]: https://handbook.fide.com/chapter/E012023
[riemann-pr]: https://github.com/google-deepmind/cryptids/pull/7
