# Recovery: bounded counter/insertion phase in progress

This separately authorized bounded phase has at most eight source-bound remote
iterations. The older goal stays paused; frozen/accepted pins and candidate rows
stay fixed, heavy work remote and outreach held. Read GATES.md before dispatch.
No automatic later phase. Push only to `git@github.com:bocowgill/cryptids.git`,
branch `codex/chess-openevolve-pilot`, never origin (upstream).

Accepted complete machine **769,344 states**, source
`100ed947d612079dc454070189e506efc2b7a780`. Experimental **609,247**, potential
saving **160,097**, new accepted saving **zero**. Proof infrastructure does not
change the machine. The full breakdown is retained in ../proof-memory/RESULTS.md.

Round 1 run 40145616663 at 791794fce52335ff6bfc917edaeb148d7c09abd6 failed
in Common: explicit Tape.move reduction was missing, repeat-list normalization
used the append-oriented successor law on the input side, a bit argument was
missing, and an indexed sum needed reassociation. All logs and exact producer
are retained under evidence/counter-01. No memory or time limit was hit.
Round 2 corrects those exact issues, adds a shared repeat/cons normalization
lemma and the counter's paid return sweep. No phase gate is claimed yet.
Round 2 run 40146146317 at 79f6cd2c1a6be35707ae4ba10c27ca7be9d74136 still
failed in Common: simplification produced a reachability relation in a different
normal form from its opaque wrapper. Other earlier shape/index goals were gone.
Logs and receipts are retained in evidence/counter-02; no resource limit hit.
Round 3 uses an explicit equality-based ReflTransGen definition and checks the
independent counter/insertion modules sequentially, retaining both diagnostics
if Common passes. Insertion has exact zero/positive carry and finish contracts.
Round 3 run 40146645212 at a02c5b02861e72c9793d4dd63c130b3ba445701f
kernel-checked Common. Counter/insertion failed at name/structure elaboration:
parent ConjectureMachines.Runs shadowed the opened helper, and grouped structure
field names were parsed as binders. Exact logs/object are retained in counter-03.
Round 4 qualifies Common.Runs, separates structure fields and states the actual
valid entry domains (there is no physical no-carry digit zero or B entry zero).
It also checks the decreasing unary converter and generic query/insertion/
conversion composition. Data and existing checked Common declarations are fixed;
only a new exact-run-to-path helper was appended to Common.
Round 4 run 40147284895 at 13ba1dc8f0e0be4698160001b135e8663b14bc00
stopped in that new helper: an untyped single-edge constructor inferred equality
on Option configurations instead of the machine-step relation. Round 5 supplies
its explicit finite-path type. No old Common theorem was edited; the complete
failure is retained in evidence/counter-04. No resource cap was hit.
Round 5 run **40147646742**, producer
**b32b0642816973b1fed4f7bcc6cafd78a212f68f**, succeeded. Counter, insertion,
unary conversion and generic query/extraction composition kernel-check with
strict builds and standard-only foundations. C1 and W1 are met. The five checked
source files (including unchanged Data) are now pinned in checked-routines-pins.json;
do not edit their declarations in this phase. All sources/objects/audits and
94.070-second driver receipts are retained in evidence/counter-05.

Round 6 will instantiate these exact contracts on all 13,360 retained words,
using a shared modulo-8192 constructor with an explicit original-value identity
lemma and generic per-word capacity proof. It selects only real physical control
numbers, exports all 27,078 local rows (data plus unchanged static printer region),
and compares them against the exact candidate. The local model's decoder boundary
is an existing machine state; its outgoing decoder rows and semantics are outside
this proof. A changed actual counter row must fail kernel certification.
Remaining requested work is
counter return, blank-word insertion, unary conversion, composition with data
at all 13,360 words, physical row binding and final foundation/corruption audit.
Data.lean and the preceding shared-data proof/evidence remain immutable.

Remote entry: scripts/chess_parsimony_counter_20261024/verify.py, manual workflow
phase `counter`. Retain each terminal run with this phase's retain.py into a
fresh evidence/counter-NN folder before diagnosing or retrying. Source-only local
AST/width checks have passed; no local Lean or model execution occurred.

Later full-machine obligations remain preamble/epilogue, marker framing/cleanup,
complete finite blank startup, exact frozen packet identity, whole Lean printer,
direct linking/suffix relocation and both halting directions. Successful local
routine proofs or external row exports do not discharge those obligations.
