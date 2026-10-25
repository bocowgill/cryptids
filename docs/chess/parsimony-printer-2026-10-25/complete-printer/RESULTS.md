# Bounded result: reusable cleanup checked; complete printer proof unfinished

The requested end-to-end theorem was **not completed** within the authorized
three remote attempts. No fourth attempt is launched or scheduled. Accepted
complete machine stays **769,344 states**; candidate stays **609,247**; new
accepted full-machine saving **zero**.

## What checked and what did not

Final run 40236839275 exported Cleanup.olean (474,664 bytes). Its five audited
roots, extend/startup/workspace/tail/cleanup, use only propext, Classical.choice
and Quot.sound. Source hash and object hash are in checked-cleanup-pins.json.
This is a reusable structural theorem under explicit physical-row and safe-scan
premises. It does not establish those premises for the full candidate by itself.

The next module, PrinterModel.lean, reached standard foundation reports for
model_extension and printer_rows but then failed because its root-level main
collides with the imported AllWords.main. No PrinterModel.olean exists, and the
row exporter did not run. Do not count those printed reports as an exported,
strictly accepted model. No ScanBatch object, Complete.olean, full-printer root
or new output/head corruption control exists. All 53 previously checked packet
batches and the successful output-identity wrapper were reused exactly, with
zero recompilations; their prior acceptance is unchanged.

The desired theorem remains:

```
Parsimony.Common.Runs (printer values) (init : Cfg 13546 2)
  ⟨stateOf 13545, Tape.mk' blank (ListBlank.append packet blank)⟩
```

That interface puts the head on the first packet bit, with blank left exterior
and blank right exterior after the packet. It is a relative tape-zipper position;
a separate absolute-integer head displacement theorem was never claimed. The
boundary address 13545 is the existing decoder entry, not a new paid state.

## Attempts, failures and measurements

| Attempt | Producer / run | Outcome |
| --- | --- | --- |
| 1 | 4dd1a46617142b843e12cb37849d25cce1bbeaaa / 40233914383 | Width preflight rejected a generated absolute-path row-export line before any Lean command. Generator formatting corrected. |
| 2 | 168ebc597b7b217d177738cf8b07b27cf7ae1455 / 40235959402 | Three ordinary proof errors: quotient blank equality, Fin case split, mono endpoint arguments; one unused simp argument. Diagnosed and corrected. Failed roots with automatic sorryAx rejected. |
| 3 | 8356473ef26aa4d9c4180e04b282cfde3d17806f / 40236839275 | Generic structural module checks and exports. Model module fails at main name collision. Later stages not reached. Stop at bound. |

| Attempt / stage | Seconds | Peak sampled group + driver bytes |
| --- | ---: | ---: |
| 1 preflight / total | 8.266 | No child command launched |
| 2 structural failure | 10.889 | 4,914,003,968 |
| 2 whole driver | 72.207 | 4,914,003,968 |
| 3 checked generic cleanup | 10.407 | 4,922,597,376 |
| 3 model failure | 5.639 | 5,318,914,048 |
| 3 whole driver | 71.432 | 5,318,914,048 |

Driver memory peaks were 30,484 / 30,572 / 30,432 KiB. No memory/time cap was hit.
One Lean thread, heap 5 GiB, sampled group+driver 6 GiB and driver 512 MiB stayed
fixed; free ubuntu-24.04 runners only. These times exclude workflow setup/cache
restoration outside the driver. Strict linting and 100-column limits stayed on.
No local Lean, generation, simulation, fixtures or state census ran.

## Prepared correction and unresolved obligations

UNTESTED-FIX.md documents the concrete exporter correction now in the mutable
generator: use uniquely named exportCompletePrinterRows20261025 with #eval,
compile without --run, and leave imported AllWords.main untouched. This change
has not been compiled or executed. It is not an additional successful attempt.
Retained complete-03 remains the exact source actually tested.

The future acceptance sequence must still check:

1. The corrected model/exporter under strict lint, with all 27,090 paid-printer
   cells matching the fixed candidate; failed module output is insufficient.
2. All 53 new finite scan-summary modules over 418 chunks of the actual packet,
   then their complete composition. The packet has 173,641 bits; none of these
   new scan certificates has yet been accepted.
3. Complete.olean exporting complete_printer with standard foundations, exact
   blank startup, output, cleanup and decoder-entry tape, without unmet premises.
4. Positive prefix and deliberate wrong-output/wrong-head controls.

Do not describe the collision as the only remaining proof problem: it prevented
later checks, whose success and cost are unknown. The draft full theorem may
still need correction. Do not increase caps to hide ordinary proof failures.

Full-machine acceptance additionally needs the literal-to-TableSeed.ChessCodec.bits
kernel bridge, suffix relocation/linking, both complete halting directions and
final whole-machine audits. External SHA/export checks do not replace that bridge.

## Counts and ranked opportunities

Accepted complete source: 100ed947d612079dc454070189e506efc2b7a780.
Candidate SHA256 remains
`b9cf384e5470f3c9f5c501bd8c13555f15d4ea134469f5d159cd1bdb363cbf45`.
Frozen packet SHA256 remains
`ab1f8764749765bfb0d44b22a999d7907345d2648bf478092a276cf8df71c2d8`.
No physical row or frozen specification/checked generic source changed. Counts
below are the preserved prior complete census, fixed by the exact table hash;
no fresh state count was needed or claimed in this unsuccessful proof phase.

| Category | Paid candidate states |
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

| Rank | Plausible absolute saving | Proof difficulty / implementation effort / decision |
| --- | --- | --- |
| 1 | Exactly 160,097 if the existing printer candidate and every full-machine obligation close | High overall; current generic cleanup checked, actual composition unfinished. Stop at cap; next authorization must target concrete exporter/full composition. |
| 2 | Potentially hundreds of thousands within the 573,802 interpreter/return states | Very high proof and implementation effort; old quotient scalability remains unresolved. Separate future structural approach, still paused. |
| 3 | Decoder ceiling 21,682; achievable share unknown | High proof/implementation effort; defer. |
| 4 | Target-encoded data ceiling 13,361; achievable share unknown | High proof/implementation effort; defer. |
| 5 | Framing/control changes at most dozens | Defer unless they unlock a specified larger dependency. |

These estimates are not accepted or additive compatible reductions. Generic
cleanup is intermediate proof progress, with no accepted full-machine savings.

## Recovery and decision

All three official logs, API metadata, every unpacked source/object, byte sizes
and SHA256s are retained in evidence/. Original ZIPs stay local and in GitHub
artifacts; each archive member and its checksum is permanently tracked, so proof
recovery does not depend on artifact expiration. The redundant ZIP uploads were
excluded from new phase Git history after repeated SSH/HTTPS transport stalls.
All historical evidence and older reused archives remain unchanged. Exact tree/
commit publication through GitHub Git API verified local and remote hashes; no
force update or workflow write-permission expansion was used.

Evidence-only audit:
`python3 scripts/chess_parsimony_complete_20261025/partial_review.py`.
This validates the partial result and the failures; it does not validate the full
printer. The complete review.py remains a success-only oracle and must fail here.

**Decision: stop and hand off, as required by the three-attempt limit.** The new
generic module demonstrates reusable structural cleanup under its premises, but
this phase supplies no accepted full-packet scan or complete-printer scalability
result. It does not justify an unbounded extension. No automatic continuation,
new proof job or outreach. Older persistent Chess goal remains paused.
