# M5 compilation design

The target remains `Halts M ↔ ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss)` for the frozen
chess reference. M5 establishes a concrete backend on smaller games. Translating the actual
M4 evaluator and its rule procedures is M6; no full-chess machine or state count is claimed here.

## Reuse and actual source language

The existing Cryptids register/tape proofs specialize to Goldbach, RH and ZF programs; they
are not a verified compiler for arbitrary Lean. Mathlib's `TM2`, `TM2to1`, `TM1to1`,
`TM1to0`, and `PartrecToTM2` provide reusable semantics and nonempty-step simulation.
We choose finite-control TM2: finitely many stacks, finite stack alphabets and store,
push/peek/pop, store load, branch, goto and halt. Each stack is an unbounded list.
A finite explicit support closes control flow; source label types themselves may be infinite.

The reused partial-recursive interpreter encodes naturals as binary digits, separates list
entries with constructor symbols and stores continuation frames on its auxiliary stacks.
Stack operations implement successor, predecessor, zero testing and traversal. Mathlib's
`ToPartrec.Code` interpreter adds composition, primitive recursion and unbounded search.
`Adequacy.compileClosedCode_halts` formally connects every closed partial-recursive list
program to this binary backend. This is an adequacy theorem for the supported language,
not a translation theorem for M4's Lean functions. M6 must supply that translation and
prove its refinement, including all chess data and arithmetic operations.

## Simulation chain

1. `TM2to1.tr` interleaves all stacks on one tape. A bottom-marker bit and an option-valued
   cell per stack record the representation. Mathlib proves the stack/tape simulation and
   handles arbitrarily growing stacks; there is no fixed tape allocation.
2. `TM1Normalize.tr` shares instruction continuations as labels. It preserves the tape and
   store and simulates each original step by a nonempty finite execution. Ordered support
   collectors avoid a noncomputable enumeration choice.
3. `BlockCode` gives a fixed-width binary code, blank-to-zero and decode/encode laws.
   `Block` translates tape operations into block operations. Independent continuation labels
   prevent a sequence of reads from copying the remainder of a program exponentially.
4. `TM1to0.tr` exposes single Post actions, with finite store values incorporated in control.
   Constructive support restriction/numbering supplies `Fin q` control and initial state zero.
5. `Binary.compile` translates a Post move into one write/move transition. A Post write uses
   a write/right transition and a preserve/left bounce. It has exactly `2*q` states, including
   all bounce states. Missing transitions mean halt; there is no extra halt state.
6. `Init.initialise` constructs the finite block input from a genuinely all-zero tape, then
   returns the head to its original location and enters the body. Each bit costs two states.
   Both actual reachability and both-direction termination equivalences are proved.

Every link uses the repository's tape and halting definitions. Simulation theorems account
for nonempty progress, so a nonterminating source cannot become a halting target or get
stuck in an unproved finite stutter. No native Lean evaluation correctness assumption is
used in a mathematical proof.

## Branching game interpreter

`Games.Tree` has terminal White-win/draw/Black-win outcomes and White/Black binary choices.
The score order is Black-win < draw < White-win; White maximizes and Black minimizes.
Trees are serialized in postfix form with five tokens. A two-stack TM2 interpreter reads
tokens and pushes scores, reduces White choices with max and Black choices with min, then
halts exactly for a single non-draw result. The draw wrapper is a proved self-loop.
Only the serialized tree initializer varies; evaluator control is shared across games.

The central `serialize_stack_effect` theorem quantifies over every tree, remaining token
stream, score stack and store. The reachable-state invariant tracks residual evaluation
and valid operands. Empty input, underflow, surplus results and malformed token streams
loop rather than accidentally halt. `unbounded_live_value_stack` exhibits arbitrarily deep
reachable stacks, ruling out a hidden fixed memory bound.

The four fixtures are a White win, a Black win, a draw, and a tree with a White-winning leaf
where Black can choose a draw. The latter evaluates to a draw and its machine diverges.
A favorable line is therefore distinguished from a forced win at the interpreter boundary.

## Trust and artifact checks

The theorem audit follows declaration types, bodies, inductive constructors and recursor
rules. It permits only the standard `propext`, `Quot.sound`, and `Classical.choice` axioms.
Compiler-generated recursion artifacts are explicitly inventoried outside the mathematical
roots; any appearance inside their dependency closure is rejected. The open chess conjecture
is forbidden. Source checks reject proof holes and added unsafe or partial definitions.
Independent target comparison checks definition bodies transitively in separate environments.

Canonical tables have one state per line and exactly two cells, for read zero and read one.
A cell is `---` or a write bit, `L`/`R`, and decimal target state. State zero starts on blank
tape. Counts include program, game data, bottom-marker initializer, wrapper and bounce states.
The independent parser checks symbols, directions, target ranges, row counts and serialization;
bounded traces provide additional execution evidence, never a proof of nonhalting.

## Construction performance and exact equality

The initial shared but uncompressed route counted 676,310 states for each three-token game
and 750,806 for the five-token refutation. These experimental counts include redundant rows;
they are not full-chess estimates or the delivered table counts.

`TM1Number` replaces syntax-valued control with numeric control before reducing the alphabet.
`HashSupport` removes support duplicates using full extensional decidable equality. A hash
collision never identifies two distinct instructions. `HashNumber` proves decoding/numbering
and both halting directions, and supplies a nominal packed machine so its forward map and
inverse array are constructed once.

Native profiling exposed a compiler detail: a definition returning a function is eta-expanded,
which can rebuild a let-bound lookup table at every call. `Memo` therefore returns nominal
cached data before constructing instruction closures; its program-equality theorem states
that the tables represent exactly the same functions. The packed numbering API follows the
same discipline. These runtime details are validated by generated C inspection and actual
artifact generation, not inferred from the placement of a Lean `let`.

## Literal table proofs

`Tables` embeds the four published files as balanced constructor trees. `Balanced.ofTree_eq_ofRows`
proves that validated cached lookup has exactly `Machine.ofRows tree.flatten` transitions, at
all states and both symbols. The cache-validity and row counts are kernel-checked on each literal.
The loader constructs syntax only; finite destinations have explicit checked bounds. Independent
export of the elaborated rows must reproduce every original byte, and a separate strict parser
checks the canonical files.

Both winning tables have checked finite executions ending at a missing transition. The draw and
favorable-line tables have checked prefixes reaching two-state loops whose rows are proved total
and closed for both possible scanned bits. The latter argument proves unbounded nonhalting on any
tape reached there. This is separate from the independent Python cycle observations.

The generic `generated_halts` theorem proves compilation correctness for every finite tree. The
literal fixture equivalences are proved independently of native generation, using the above kernel
certificates. Reproducible native generation and exact byte comparisons establish artifact provenance;
they are not presented as a Lean proof of pointwise identity between a native compiler run and its
serialized output. No native correctness axiom enters a literal theorem. For M6, the actual chess
program translation and the exact published chess table must receive their own full formal linkage.

`ChessM5Challenge.lean` is a saved standalone target importing Mathlib only. It fixes the core machine
semantics, balanced lookup and literal data independently of all game/compiler/solution imports.
`CompareChessM5` compares all four statement definitions and their entire transitive declaration
closures in separate environments, including constructor/recursor fields. It rejects both a target
changed to `True` and an otherwise valid changed transition hidden behind the original target names.

## Frozen build configuration

M1 also pins `lakefile.toml`, so it remains byte-for-byte unchanged. The additional native
generator target lives in `lakefile.chess-m5.toml`; verification requires that file to equal
the pinned standard configuration plus exactly one executable stanza. All dependency and
compiler options therefore stay fixed. Build it with
`lake -f lakefile.chess-m5.toml build chess_m5_generate`. The standard `lake build` and the
original frozen-reference verifier continue to use their original configuration.
