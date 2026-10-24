# Parsimony printer pilot: count promising, boundary validation failed

Decision: stop before certification. Both predeclared remote runs are terminal
and their complete artifacts and logs are retained. No printer-pilot job remains
active. The existing goal remains paused. The accepted machine remains
**769,344 states**, and this pilot establishes **zero certified savings**.

## Measured allocation and conditional payoff

The second runner generated the complete standalone printer table for the exact
accepted packet. Its emitted table allocates 13,546 controls, including the
diagnostic boundary representing the existing first decoder state. Thus its
replacement writer allocation is **13,545**. That allocation includes every
extraction, cleanup, scan, error and connection control:

| Replacement component | Allocated states |
| --- | ---: |
| Data controls, including data-out | 13,361 |
| Extractor | 140 |
| Preamble and epilogue | 6 |
| Right-sentinel cleanup | 3 |
| Nondestructive marker scanner | 32 |
| Marker erasure and direct decoder connection | 2 |
| Nonhalting error trap | 1 |
| Replacement writer total | **13,545** |

There are no additional uncounted connection controls. The standalone probe's
one diagnostic boundary is excluded from this writer total because it denotes
an already paid decoder state. The framed core itself uses 13,507 states, width
13, 13,360 words, and three zero padding bits. All framed data bits, including the
unchanged 173,641 packet bits, were reconstructed from emitted transition targets.
Both actual data-target and data-chain corruptions were rejected.

The accepted suffix breakdown is unchanged:

| Retained component | Accepted states |
| --- | ---: |
| Table decoder | 21,682 |
| Decoder bridge | 1 |
| Seed expander | 216 |
| Expander bridge | 1 |
| Interpreter main | 533,341 |
| Interpreter returns | 40,461 |
| Retained suffix total | **595,702** |

Combining these allocations would give **609,247 states**, a conditional saving
of **160,097 states**, about 20.8% of the accepted complete machine. This is a
component-sum estimate for an unvalidated design, **not an accepted chess machine**.
The runner stopped before emitting, relocating and independently parsing the
complete concatenated machine, so that full-census obligation remains open.
The older uncertified 310,029-state body-quotient candidate is not combined with
these numbers. No new halting-equivalence theorem has been proved.

## Exact outcomes

1. Raw probe [40136287158](https://github.com/bocowgill/cryptids/actions/runs/40136287158),
   producer `9b37cd3a96d3c64f2cee7d30da513df1e5095edb`: failed its first zero-only
   physical fixture. It measured 13,504 raw source controls, not a complete
   replacement. Pinned source inspection diagnosed the epilogue's dependence on
   a nonzero code marker. Native compilation succeeded; no full probe ran.
2. Corrected pilot [40137052792](https://github.com/bocowgill/cryptids/actions/runs/40137052792),
   producer `7c8ff325d3e9f4900c895e56e15f460b1dfdf984`: exact packet/pin provenance,
   transition reconstruction, allocation and compilation succeeded. The very
   first guarded adapter positive control failed its exact-boundary assertion.
   The run stopped before corruption controls, the 261 physical fixtures, the
   full packet simulation, or full-machine linking and census. A constructed
   adapter is therefore not a validated adapter.

The second run reproduced the raw all-zero obstruction: after 10,000 steps it
was still in epilogue control 4, head -9,864, with an entirely zero tape. That is
bounded evidence for this fixture, not a general nontermination proof.

An avoidable diagnostic omission remains: the guarded positive control was
asserted before its result was saved. Its precise final tape, head and control
are unavailable. Do not infer the failing field from the assertion alone. The
next diagnostic must save these values before testing the boundary contract.

Source-level inspection suggests an indexing error worth testing first:
the initial binary counter appears to begin at absolute cell zero. The adapter
oracle assumes the framed string begins at cell one and expects packet entry
at 34. An actual entry at 33 could explain the failure. This is an **unverified
diagnosis**, not evidence that the emitted printer is otherwise correct. Keep
the produced sources unchanged so the retained failure remains reproducible.

## Resource evidence and provenance

All generation, simulation, compilation and counting happened on the existing
free GitHub-hosted ubuntu-24.04 runner. No Lean build or certification ran.
Both jobs used the unchanged limits: 600 seconds overall, 6 GiB group plus
driver, 512 MiB driver, 60 seconds native compilation, and a prospective full
probe limited to 120 seconds and 500 million ordinary steps. Neither run hit a
resource limit. Both were assertion failures, not memory or timeout failures.

| Measurement | Raw probe | Corrected pilot |
| --- | ---: | ---: |
| Driver elapsed seconds at failure | 4.323 | 5.909 |
| Native compiler seconds | 2.177 | 3.676 |
| Sampled compiler group plus driver peak bytes | 127,000,576 | 127,954,944 |
| Driver peak KiB | See retained summary | 39,000 |
| Completed exact-boundary fixture suite | No | No |
| Full packet printer execution | Not run | Not run |
| Complete full-machine row census | Not run | Not run |

The sampler measures process RSS at intervals; these are sampled peaks, not a
claim about an unsampled instantaneous maximum. Runner capacities, source/pin
hashes, exact commands, compiler logs, failure traces and GitHub job receipts
are in the retained archives. Local activity was limited to text/provenance
inspection, editing and artifact transport. Frozen sources and accepted pins
were checked remotely and not edited.

Corrected artifact SHA-256:
`57c3348f74dbc682dab4d53344299508ddb07781ac6472bcab4be2fb65bf9468`.
Corrected workflow logs SHA-256:
`a434b2f40aa3279a0c3bed11179cfad64e8ede10d93157cf31a207804e56f382`.
Retention independently matched GitHub's artifact digest and producer source
hashes. The full archives, not only summaries, are committed under
`evidence/probe-01/` and `evidence/pilot-02/`.

## Recommended next authorization

Parsimony is worth one narrow boundary-diagnosis phase because the fully paid
writer allocation offers a substantial conditional reduction. Do not begin
Lean certification from this failed pilot.

First record the unmodified guarded fixture's exact boundary result and a short
trace at the raw printer/cleanup handoff, saving before every assertion. Test the
cell-zero/cell-one hypothesis; make a specific correction only after that
diagnosis. Then require the positive control, dirty-exterior and wrong-head
mutations, all 261 independent simulator fixtures, exact packet reconstruction,
and complete emitted-machine census to pass within a new explicitly bounded
remote budget. A change to the expected head alone must not bypass the complete
tape/exterior check. Do not rerun either failed producer unchanged.

If those checks pass with the same allocation, the next certification proposal
should prove the introspective printer structurally: data-target/unary invariant,
word extraction, binary counter correctness and termination, marker cleanup,
zero exterior, exact head, and the absence of premature halting/error entry.
Instantiate that generic theorem on the exact packet, prove suffix relocation
and allocation, then compose with `FieldTableSeed.linked_halts_input` to recover
both directions of blank-tape halting equivalence. Avoid unrolling the enormous
full physical startup in Lean. The formalization effort is currently uncertain;
this pilot supplies no credible runtime or certification-cost estimate for it.

No additional jobs, certification, goal resumption or outreach are launched by
this recommendation. The two-run pilot is closed with a failed validation gate
and a recoverable handoff, not a successful reduction.
