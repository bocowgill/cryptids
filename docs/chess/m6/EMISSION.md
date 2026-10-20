# M6 practical emission route

The current direct Code backend is mathematically useful, but the measured
Updates term does not have a demonstrated practical full-table emission path.
Retain the actual Code terms and all their refinements. Use a shared Code DAG as
the next representation, and implement a fixed finite interpreter with program
counter and return frames stored on tape before attempting full chess emission.
This is a recommendation for finishing the first baseline, not a completed VM or
a claim that direct compilation is impossible. Neither route currently supplies
the required literal full-chess table or its kernel identity theorem.

This audit follows PLAN revision 8. The original `LOWERING-AUDIT.md` remains a
frozen earlier snapshot. In particular, the now adopted `WithoutDead` refinement
and explicit `Control` Code supersede open runtime-search/control obligations in
that snapshot. No M1–M5 source was changed. No game-tree search or large Code
backend run was performed for this audit.

Source paths below are relative to the repository; Mathlib paths start beneath
`.lake/packages/mathlib/Mathlib/`. Short compiler filenames refer to
`Cryptids/Compilation/`, short chess filenames to `Cryptids/Chess/Compilation/`.
All cited lines are one-based.

## What was measured

| Quantity | Result | Evidence and exact limitation |
| --- | ---: | --- |
| `.tail` ordered source-support length | 2 | Root's completed native probe; also follows from the count recurrence below. |
| `.tail` numbered Post states | 48,631 | Root's clean native repeat, exit 0. |
| `.tail` total binary states including the 22-state initializer | 97,284 | `2 * 48631 + 22`, using the proved current backend formula. |
| `.tail` probe construction time | 111,615 ms | Root's clean repeat. The earlier `/usr/bin/time` wrapper was permission-denied and is not the successful evidence. |
| Updates output expressions | 71 | This audit's bounded runtime measurement. |
| Updates expanded Scalar Expr occurrences | 29,115 | Tree occurrences across all 71 expressions, not unique nodes. |
| Updates expanded Code occurrences | 6,409,197 | Independently reproduced here, agreeing with root's native probe. Not a state count or heap-object count. |
| Updates source-support traversal length before deduplication | 98,385,948 | Measured by a count-only function with a generic kernel proof of equality to the source list's mathematical length. No label list was built. |
| Updates shared Code DAG rows | 3,281 | Bottom-up interning of exact `(tag, leftID, rightID)` keys, including leaves; entry ID 3,280. |
| DAG flat natural words | 9,843 | Three words per row; excludes header, entry, initial game and interpreter. |
| DAG payload stack symbols | 73,922 | Actual `PartrecToTM2.trList` length of those words, independently matching the binary-length-plus-delimiter count. |
| Static evaluation-context count | Cap reached at 500,000 | Incomplete traversal of distinct `(CodeDAGid, continuationID)` pairs, not a completed cardinality or final state count. |
| Interned continuations when that cap was reached | 307,761 | Includes halt. Payload-containing continuations remain runtime data; these are the data-free static continuation shapes. |

The tiny probe constructs the numbered Post package and reads its count; its
source does not emit rows, force every transition, or check a literal artifact
(`scripts/ProbeChessM6.lean:12–29`). Thus the timing is not a completed artifact
emission or kernel-validation time. Root records the successful native results
in `.unlazy/chess-m6/ROOT-VERIFICATION.md:21–25` and PLAN revision 8.

This audit's measurements use `lake env lean --run` on temporary programs. They
are unchecked Lean runtime evaluations, not kernel certificates of the printed
numerals and not AOT binary benchmarks. Their sources, limits, outputs and strict
typechecking evidence are preserved under `.unlazy/chess-m6/leaf-1.15/`.
No numerical full-chess state count follows from any row in this table.

## Why existing sharing does not settle emission

`Scalar.compile` inserts the arithmetic procedure's Code at each operation
(`Cryptids/Compilation/Scalar.lean:58–77`). Updates compiles 71 expressions into
a tuple (`Updates.lean:220–227`). These source objects can share native heap
subterms, but the mathematical Code datatype is a tree and the backend traverses
it with continuations. `PartrecToTM2.trNormal` contains actual Code and `Cont'`
objects in labels; composition, cons and fix change the continuation context
(`Mathlib/Computability/TuringMachine/ToPartrec.lean:183–208,290–299,330–342`).
Two equal arithmetic bodies with different returns therefore need not have equal
static labels.

The ordered support collector deliberately retains duplicates
(`Cryptids/Compilation/Code.lean:29–98`). Downstream hashing removes exact
duplicate Post labels only after stack lowering, normalization, binary support
and substatement enumeration (`AssemblyFast.lean:74–84`). Hashing resolves
collisions using exact equality (`HashSupport.lean:15–43`). It does not identify
different continuation contexts, and this late deduplication does not prevent
the earlier traversal from having enormous length.

The 98,385,948 figure is a mathematical list-length estimate evaluated at runtime;
it is not a measurement of simultaneously resident allocations, elapsed compiler
time or distinct final labels. Compiler caching and pointer sharing can affect
those operational quantities. Conversely, the 3,281 DAG nodes do not imply 3,281
static labels or a proportional number of binary states.

The fast backend's nominal caches avoid repeated compiled closure construction
(`Memo.lean:15–43,61–75`; `HashNumber.lean:134–155`). Normalization shares immediate
statement continuations (`Normalize.lean:25–32`). These are proved and useful
transformations. They are not a general tape-resident call/return mechanism for
all repeated Code bodies.

## Count-only source-support proof

The temporary experiment defines `N(c)` as normal-entry traversal length and
`S(c)` as `codeSuppList'` traversal length. It proves, for every Code and static
continuation `k`:

```text
length (trStmtsList (trNormal c k)) = N(c)
length (codeSuppList' c k) = S(c)
```

For root continuation `.halt`, `contSuppList` is empty, so the second formula also
gives the complete root support-list length. The exact recurrences are:

| Code | N | S |
| --- | --- | --- |
| `zero'` | 2 | 2 |
| `succ` | 27 | 27 |
| `tail` | 2 | 2 |
| `cons f g` | `3 + N(f)` | `29 + N(f) + N(g) + S(f) + S(g)` |
| `comp f g` | `N(g)` | `N(f) + N(g) + S(f) + S(g)` |
| `case f g` | `2 + N(f) + N(g)` | `2 + N(f) + N(g) + S(f) + S(g)` |
| `fix f` | `N(f)` | `S(f) + 2*N(f) + 2` |

These constants account for all five stores in a `read` node. For example,
`head stack (.ret k)` contributes 17 traversal occurrences; three `move₂`
wrappers contribute nine. This is source-syntax accounting, before all backend
deduplication and alphabet expansion. The generic proofs passed the pinned Lean
toolchain with warnings as errors, using only `propext` and `Quot.sound`.

The source and proof are in `counts-experiment.lean.txt`; exact output is in
`counts-proof-output.txt` and `counts-run-output.txt`. Unlike building the full
support list, the count-only traversal never constructs `Λ'` labels.

## DAG and static-context experiments

The interner traverses the actual Updates Code, visits children first, and uses
only `(opcode, childID, childID)` as the hash-map key. It never hashes an entire
Code recursively as a map key. Leaf tags are 0/1/2 for zero/succ/tail; tags 3/4/5
are cons/comp/case; tag 6 is fix with its second child field zero. Equal keys have
equal tags and exact equal natural child IDs; hash collisions are not identities.

The experiment has hard caps of 8,000,000 constructor visits and 100,000 unique
rows. Updates completed below both caps. It checks every row's tag/arity and that
each used child ID is strictly smaller than the parent ID. Those computational
checks passed. They establish neither a generic reification theorem nor a
kernel-certified equality between this measured DAG and Updates.code; that proof
is a separate production obligation.

To test the smaller static-compiler extension, the second experiment interns
continuations as `(kind, codeID, parentContinuationID)`, with halt ID zero. It
memoizes evaluation-context pairs and expands them by the actual source-support
recursion:

| Code node in context k | Contexts inserted |
| --- | --- |
| leaf | none |
| `cons f g` | `(f, cons₁ g k)`, `(g, cons₂ k)` |
| `comp f g` | `(g, comp f k)`, `(f, k)` |
| `case f g` | `(f, k)`, `(g, k)` |
| `fix f` | `(f, fix f k)` |

There is no `Λ'` construction here. The 500,000 unique-context cap was reached
before completion; the iteration cap was 2,000,000. The last run completed in
9,206 ms by its internal timer, including DAG construction and payload checks.
An earlier 100,000-context cap was also reached. This is a lower bound on the
number of exact pairs encountered by this particular traversal, not a lower
bound on distinct `trNormal` labels or binary states: distinct pairs can still
produce equal normal labels, and lower layers introduce and merge other labels.

A streaming, memoized static-support enumerator remains semantically possible.
It would need an invariant connecting its `(codeID, continuationID)` worklist to
all macro labels and to `codeSupp`, plus finite-function equality and deterministic
ordering proofs. The capped result does not show that this extension would be
small enough to emit full chess. It also does not prove failure of every static
compiler. On present evidence it is a weaker practical bet than moving return
contexts to tape.

## Recommended representation and proof reuse

Keep the seven-op Code language. Reusing the actual Code terms preserves the
existing `Scalar.compile_eval`, raw Updates/Legality refinements, history callee
contracts and `Control.programCode_eval` proofs. A new Expr-only VM would require
bridges for the non-Expr list/history/control fragments as well. Do not replace
finished chess proofs merely to obtain a shorter source notation.

The production DAG interface should have finite literal node data, an entry ID,
checked tags/arity, and backward child references. Its resolver recursively
reconstructs Code by well-founded recursion on node index. Essential theorems are:

```text
resolve (reify c) (entry (reify c)) = c
literalProgram = reify actualChessCode       -- or a checked equivalent relation
```

The interner's invariant must preserve every old row's meaning when rows are
appended and every map entry's exact row identity. Repeated keys may reuse IDs;
different keys cannot alias merely because hashes agree. A verified generic
producer or a kernel-checked certificate can establish the literal-program link.
Native row counts or a successful topology check cannot substitute for it.

Store program triples as a flat list of binary naturals with explicit header
lengths. In particular, do not encode the entire program through
`ListCode.stack`: its `pack x rest = 2^x * (2*rest+1)` encodes a head by a unary
run in the resulting bit representation (`ListCode.lean:93,175–188`). It is not
the compact binary triple representation measured here. The existing packed
initial game remains the exact user input expected by Control; CodeInput lets
its bits be supplied directly instead of expanding a Code literal.

## Fixed interpreter: concrete control and data plan

Define a small-step DAG machine with `run pc input frames`, `return value frames`
and `done value`. IDs and arbitrary natural values are ordinary tape data. Use
the following exact transitions, which preserve the seven-op Code semantics:

| Instruction or return frame | Action |
| --- | --- |
| zero | Return `0 :: input`. |
| succ | Return the singleton successor of input head/default. |
| tail | Return input tail. |
| cons f g | Save `(cons₁, g, original input)`; run f on original input. |
| return to cons₁ | Save `(cons₂, returned head/default)`; run g on saved original input. |
| return to cons₂ | Prepend the saved head to the returned list. |
| comp f g | Save `(comp, f)`; run g on input. |
| return to comp | Run f on the returned list. |
| case f g | Run f on tail for zero head/default; otherwise run g on predecessor head followed by tail. |
| fix f | Save `(fix, f)` and run f on input. |
| return to fix | Zero head exits after stripping the flag; positive head strips the flag and runs f again with the same pending fix frame. |
| return to halt | Enter done with the actual output list. |

This is the dynamic-data counterpart of Mathlib's continuation semantics
(`Mathlib/Computability/TuringMachine/Config.lean:422–438,469–495`). Prove a
finite-execution equivalence against that interpreter, then reuse
`stepNormal_eval` (`:674–697`) to obtain output and domain equivalence with
`Code.eval`. Cover divergence in both directions; a bounded interpreter or a
fallback value does not suffice. Include the already proved `Program.nonDraw`
postlude in the reified Code so that the new VM need not invent a different
chess-result halting convention (`Program.lean:48–79`).

Implement this machine directly in finite TM2 statements. Its labels should be
a fixed enum of dispatcher and microcode stages. Its finite local store should
hold only popped symbols and genuinely bounded flags. **Do not put pc into
`Fin program.length` local storage**, embed Code/Cont in labels, or let an
unproved `lookup program pc` remain in a primitive function field. Those choices
respectively multiply store enumeration, restore the original static expansion,
or hide the compiler obligation.

A universal interpreter implemented as another ToPartrec.Code is a logically
valid alternative, but it must pass its own body-cost and bounded emission gates.
Expanding arithmetic/list kernels inside a large Code dispatcher can reproduce
the present construction problem even when the dispatcher is independent of the
input program. CodeInput supplies data; it does not turn the unchanged full chess
Code into an interpreter or remove that Code from the static label type.

A concrete four-stack layout worth implementing first is:

- main holds the current encoded input/output and temporary numeric registers;
- stack holds a framed immutable program segment and dynamic continuation frames;
- rev and aux are scratch, restored to empty at every public macro boundary.

The program table is not copied into every frame. Length-framed segments separate
program rows, frame metadata and saved lists. Row lookup temporarily saves the
frame prefix, scans rows with a binary countdown PC, fetches tag and child IDs,
then restores the immutable table and suspended data. Tags are decoded by a fixed
finite dispatch tree; child IDs stay on tape. This layout is a proposed
implementation, not an established invariant or a new primitive.

The first hard VM kernel is therefore a **row-lookup macro preserving program,
current data and frames and restoring scratch**. Prove it from pop/push/move
steps, including out-of-range rejection unreachable under well-formed program
invariants. Then implement the seven instruction cases and four return-frame
cases above. Existing Mathlib head/successor/predecessor/copy/move lemmas are proof
templates, not automatic correctness for changed stack suffixes or dynamic
returns (`ToPartrec.lean:696–838`). Each reused macro needs the actual framing
and scratch side conditions proved.

Keeping four stacks preserves the known 1,250-symbol, 11-bit simultaneous
alphabet. Adding a fresh stack for every conceptual register is expensive:
with the same four-symbol stack alphabet, k stacks produce `2*5^k` simultaneous
symbols. A smaller-stack or raw binary tape interpreter is another valid
construction choice, but requires its own finite program, proof and measured
emission. Neither a small fixed TM2 interpreter nor its final binary size has
yet been produced by this audit.

## Program input and exact state accounting

Use one explicit source input such as

```text
[version, nodeCount, entry, userWordCount] ++ flattenedTriples ++ userWords
```

with an unambiguous decoder and a startup macro which moves it into the proved
VM layout. For full chess, `userWords` must be exactly the actual Control input
containing the standard initial game. Every program row, header, entry, input
word and startup convention belongs in the machine/initializer artifact. No
external file or prepopulated source tape remains in the final blank-tape claim.

`CodeInput.lean:27–49` supplies a generic arbitrary-input `fastStack` halting
theorem, and `:55–138` constructs the Code adapter with an exact blank initializer.
For a direct TM2 VM, reuse the generic input theorem with the new fixed program,
then define the analogous binary wrapper. The Code-specific `generatedWithInput`
wrapper is not itself a theorem about an unimplemented VM.

For four stacks with the current block code, account separately for:

```text
P = actual fixed-interpreter numbered Post state count
T = length (PartrecToTM2.trList completeWireInput)
B = 11 * max 1 T
Q = 2*P + 2*B
```

The last term includes all write/return initializer instructions, as proved by
`Init.initialise_states` (`Cryptids/Compilation/Init.lean:148–178`); the actual
input tape and restored head follow from `initialise_reaches` (`:190–198`). The
22-state overhead applies only to the current empty-input Code adapter, not to
an interpreter supplied with its program on tape.

As an illustration of a known payload cost only, the measured Updates triples
alone have T=73,922. Carrying precisely that payload through the current
11-bit block encoding costs 813,142 initializer bits and 1,626,284 writer states.
This excludes its header, entry, initial game and all interpreter states. It is
not an M6 state count, an estimate for the full program, or a proof that this
particular encoding will be selected. It explains why program data is not free
even when control is fixed. Measure the actual complete wire image before fixing
any final count.

## Literal-table identity and next implementation gates

The shared representation changes the source-to-machine proof boundary, not the
requirement to emit an actual finite table. The sequence should be:

1. Finish actual chess callee instantiation and the unchanged Code theorem for
   `nonDraw` composed with Control on the exact initial input. Preserve all raw
   data/rule refinements and the adopted WithoutDead value theorem.
2. Prove Code DAG representation/erasure and its concrete literal-program link.
   Record the complete program-data words and independent hashes/counts.
3. Implement and prove lookup plus dynamic call/return in the fixed TM2 VM.
   Establish output and both-direction halting correspondence for arbitrary
   well-formed DAGs and inputs; prove all microcode labels lie in an explicit
   finite support. Run tiny programs covering all seven ops and nested frames.
4. Compile the **fixed interpreter alone** with M5. Measure its actual support,
   Post count, complete emitted rows, construction time and available resource
   limits before including the larger chess wire image. Alphabet/store/label
   products are measured, not inferred from the tiny tail example.
5. Prove exact startup framing and form the complete blank initializer. Include
   all wire bits in the count and prove entry into the VM with exact program and
   input. The CodeInput adapter is reusable machinery for this stage.
6. Emit and reload every transition of the whole initialized binary machine.
   Prove pointwise equality of the literal body to its generated fixed body.
   For the initializer, a generic row-construction theorem for the verified
   writer plus exact payload-bit equality can avoid repeatedly normalizing
   enormous nested prefixes. It still must identify every published prefix row,
   target offset and body row with the parsed literal artifact. A wrapper
   definition without a theorem about the published rows is insufficient.
7. Compose literal identity, initialization, VM simulation, DAG erasure and the
   existing chess Code/value theorems into the strategic equivalence. The
   challenge/comparator must name the exact literal machine. Independently check
   exported bytes, all state/destination bounds, counts, hashes and dependency
   axioms against the frozen M1–M5 inputs.

Balanced-row well-formedness and row-count proofs alone do not establish
compiler identity (`BalancedTable.lean:116–129`). M5's finite-game traces and
closed-loop certificates do not replace this identity for unknown full chess.
No step above executes the chess game tree during construction, assumes its
value, or treats native emission as a verified compiler.

The decisive recommendation is to stop the unbounded direct full-source backend
attempt, retain it as a semantic reference, and first complete the DAG and fixed
interpreter kernels with small measured emission gates. The present evidence
supports the representation change; it does not yet demonstrate practical
emission of the proposed interpreter or certify M6 completion.
