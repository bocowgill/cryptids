# Output identity wrapper and corruption control: passed

The requested bounded phase completed on its first remote attempt. The unchanged
`ParsimonyComposed.global_bits_identity` statement now has a successful
Identity.olean, with foundations `[propext, Quot.sound]`. The numeric packet and
framing roots also export successfully. All 53 previously checked packet batches
were imported with exact source/object hashes; none was rebuilt. Coverage is all
13,360 words and 418 literal chunks, not an extrapolation from a sample.

## Fix and exact scope

The previous failure occurred when `simpa only [values_size]` specialized
indexed_render to the concrete array, hitting elaborator recursion depth. A new
abstract helper rewrites `input.size = count` before applying indexed_render;
its final use is an exact application. FrozenPacket separately exports the prior
successful numeric/framing prefix. The original checked data arrays, batch
statements, nine frozen generic sources, physical rows and frozen chess
specification remain identical. No recursion, time or memory cap was increased.

The ordered output identity is:

```
Parsimony.Packet.text (Parsimony.Global.written word 13360).reverse = frozenFramed
```

The framing root identifies `frozenFramed` as 32 ones, a zero separator, the
173,641-bit frozen packet, tail 100 and three width-padding zeros. Total ordered
length is 173,680 bits; the packet offset is 33. Literal/file hash binding remains
an external representation check, not a kernel file parser or the still-needed
TableSeed.ChessCodec.bits bridge. No whole blank-tape machine claim is added.

## Paired corruption control

PositiveControl imports the successful Identity module and proves the first
framed bit is `1`, using the checked packet_chunk0 theorem and kernel decision.
It exports with foundation `[propext]`. Corrupted.lean differs by exactly one
character, expecting `0`. Under identical imports and budgets, Lean exits 1:

```
Tactic `decide` proved that the proposition
  frozenChunk0.head? = some '0'
is false
```

This is a false-proposition rejection, not a missing import, timeout, recursion
failure or memory kill. No Corrupted.olean exists. Its diagnostic prints an
automatic sorryAx dependency after the error; that deliberately failed root is
never accepted or imported. Every accepted root excludes sorryAx/native oracles.

## Measured full-data result

Source producer `13ba1c5e5b2d8810f2d99d8be5185236b46ba54e`;
[run 40198826275](https://github.com/bocowgill/cryptids/actions/runs/40198826275),
manual phase wrapper, free ubuntu-24.04. One Lean thread, 5 GiB heap, sampled
process-group plus driver cap 6 GiB and driver cap 512 MiB stayed fixed.

| Stage | Seconds | Peak group + driver MiB |
| --- | ---: | ---: |
| Cache retrieval | 18.667 | 1,058.2 |
| Strict frozen generic build | 29.054 | 2,601.4 |
| Abstract sized rendering helper | 11.692 | 4,671.2 |
| Export numeric packet/framing prefix | 3.511 | 4,796.9 |
| Final output identity | 3.368 | 4,734.7 |
| Positive first-bit control | 3.353 | 4,724.1 |
| One-bit negative control, expected exit 1 | 3.346 | 4,737.6 |

Driver total 87.056 seconds; peak approximately 4.6845 GiB; driver peak 25,768 KiB.
These measurements exclude Actions setup/cache restoration outside the driver.
No resource stop occurred. Reuse avoids the previous 217.366-second batch rebuild.
No exact physical runtime, later-link cost or whole-machine scaling bound is claimed.

## Recovery and audit

The official retained archive is checksum verified against GitHub metadata and
all generated sources and objects are tracked under evidence/wrapper-01. The
source manifest is checked against exact producer Git blobs. reuse.json records
the old producer, archive and every imported source/object pair; wrapper-plan.json,
composition.json and pilot-summary.json bind new wrappers and command receipts.

Artifact SHA256:
`c60f67dad955c4506bcefa400d7b56b3e2531d9b835f5f2bb3edef2ff1c48118`.
Workflow log archive SHA256:
`6d68a880c4fae78b52053f8e56aad9cf606614ddc94f4180ecbfa3151e8cbdd4`.
Original reused producer `317cb4f2efcb561687af90c979e48323e51b6b78`,
run 40157504256, archive
`476eb3a73c5232c8e53808755c22d02db16b9a29e72e838769f86f25190f6ac1`.
The older failed Identity module was not reused.

Local review needed one compatibility correction: the Mac's older Python lacks
hashlib.file_digest. The provenance-only reviewer now uses a streaming SHA256
loop and records its own source hash. No proof rerun or second remote attempt
was needed. Local inspection/retention did not execute Lean or a machine.

Reproduce the evidence-only audit locally:
`python3 scripts/chess_parsimony_wrapper_20261025/review.py --iteration 1`.
All width/banned-feature/foundation/source checks pass; strict linting is retained.
The prior global phase's failed gates remain historical records, not rewritten.

## Machine count and ranked opportunities

Accepted complete machine stays **769,344 states** at
`100ed947d612079dc454070189e506efc2b7a780`.
Experimental complete candidate stays **609,247**; potential saving **160,097**.
**New accepted full-machine saving: zero.** This is intermediate certification.
No machine generation, state-count census or physical machine edit was needed.
The existing complete census is preserved by the exact machine SHA256:
`b9cf384e5470f3c9f5c501bd8c13555f15d4ea134469f5d159cd1bdb363cbf45`.

| Category | Candidate paid states |
| --- | ---: |
| Data including data_out | 13,361 |
| Extractor | 140 |
| Preamble/epilogue | 6 |
| Tail cleanup | 3 |
| Marker scan | 32 |
| Marker erasure/decoder connection | 2 |
| Error trap | 1 |
| Decoder + bridge | 21,683 |
| Seed expander + bridge | 217 |
| Interpreter main | 533,341 |
| Interpreter returns | 40,461 |
| Total | 609,247 |

| Rank | Opportunity / plausible absolute saving | Proof difficulty | Implementation effort / decision |
| --- | --- | --- | --- |
| 1 | Certify existing printer/link candidate: exactly 160,097 if all obligations close | High overall; wrapper blocker now closed | Medium/high; next bounded operational cleanup proof. Continue only on later authorization. |
| 2 | Interpreter/return architecture within 573,802 states: potentially hundreds of thousands | Very high; earlier quotient scalability unresolved | High; separate future structural-certificate pilot; remains paused. |
| 3 | Decoder representation: ceiling 21,682, achievable share unknown | High | High; defer architecture audit until candidate acceptance. |
| 4 | Target-encoded data: ceiling 13,361, achievable share unknown | High | High; defer until current candidate is certified. |
| 5 | Framing/control compression: at most dozens | Variable | Defer unless necessary to unlock a defined larger dependency. |

These are bounds/estimates, not additive compatible or accepted reductions.
The small wrapper fix was justified by its dependency on the known 160,097-state
candidate saving, rather than a claim of directly saving machine states.

## Decision and next bounded task

Retain the modular structural route: complete-data batch certificates and the
previously blocked wrapper now fit the unchanged caps. This evidence supports
this printer-identity route; it does not establish feasibility of every later link.

Next, only after authorization: certify preamble/epilogue and marker/tail cleanup
with exact head and tape boundaries, composing with global_terminated and this
identity. Still required after that: blank startup, literal-to-ChessCodec bridge,
direct suffix linking/relocation, both complete halting directions and final
whole-machine audit. Only then may 609,247 become the accepted size.

No further pilot or outreach is scheduled. Older persistent Chess goal stays
paused. A new instruction is required to proceed beyond this bounded phase.
