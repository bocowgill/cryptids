# Complete-machine costs and priorities — 2026-10-22

Updated for the user's instruction to prioritize large complete-machine reductions.
This is the live campaign planning record; accepted evidence remains immutable.
No experimental estimate changes the accepted best.

## Counts at this checkpoint

| Component | Goal starting machine, accepted | Round 01, accepted | Round 02, accepted | Round 03, measured quotient plus accepted seed |
|---|---:|---:|---:|---:|
| Paid input writer, including final turn | 1,837,941 | 1,837,941 | 424,157 | 424,157 |
| Complete seed expander | — | — | 216 | 216 |
| Additional expander/body bridge | — | — | 1 | 1 |
| Interpreter main controls | 533,341 | 533,341 | 533,341 | 105,343 main-only classes |
| Interpreter return controls | 533,341 | 40,461 | 40,461 | 7,944 return-only classes |
| Classes shared across main and return controls | — | — | — | 1,200 |
| **Complete machine** | **2,904,623** | **2,411,743** | **998,176** | **538,861 prospective** |

**Accepted full-machine saving during this goal:1,906,447states.** Round01
saved492,880; round02now saves another1,413,567. The accepted best is998,176.
Round02complete verification passed remote run39797909133 iteration4 at780ad59:
all1,996,352actualrows,strict universal/publicLean proofs,safeclosureaudit,
88complete startup cases,465controller cases,34corruptions and prior regressions.
Fresh complete advisory,external seal,45hostilemetadata controls and copied
checker/seal portability all passed. See round02/RESULTS.md and review/.

The seed controller proofs unlocked the large initializer saving. They are now
complete. Do not spend a new round shaving a few controls from its216states.

**Round 03 measured finite opportunity: 459,315 additional body states.** Remote
run39795919458 at8cd145e completed the exact whole-body partition in21.027seconds,
peak287,416KiB, and independently checked all1,147,604old rows against228,974
quotient rows. It retained a114,487-state table, complete map/representatives,
12full-certificate hostile controls and one deliberately overmerged golden.
The certificate data occupy8,397,167bytes. Official completed run/API/log/ZIP
retention is now saved under round-03/evidence/pilot-final; parent metadata/hash
replay passed. Earlier raw diagnostics remain preserved separately.

This is not a Lean certificate or an accepted full-machine saving. With the
accepted writer alone its prospective full count is1,952,428; with the accepted
seed prefix it is538,861. Savings attribution is339,898same-node store sharing,
86,900sharing across main nodes,31,317within returns and1,200cross-family sharing.
These categories are diagnostics of the complete stable partition, not separately
proved optimizations; restricting to one category can break successor closure.

## Ranked next opportunities

The estimates below are explicit research hypotheses, not measured savings.
Their order combines absolute opportunity with the cost of obtaining evidence.

| Priority | Whole-machine mechanism | Absolute opportunity | Proof difficulty | Implementation effort | Next decision test |
|---|---|---|---|---|---|
| 1 | Certify the complete exact interpreter quotient | 459,315 measured finite states; candidate full 538,861 | Generic LocalCertificate proof exists; concrete kernel scalability is being measured | Bounded full-data and representative-row pilot, then literal or structural certificate | Complete map build/audit passed39816362847; QuotientData hit recursion-depth failure before rows. Trial07 stopped only on generated formatting; resumed trial39825520233 passed full map/audit but executable typed quotient hit6GiB RSS before actual rows; raw numeric quotient representation under bounded review |
| 2 | Encode structured source-table rows before expanding the exact old input | 228,832 measured prospective full saving; D=21,682; full candidate769,344 | High: complete decoder, exact word reconstruction and tape cleanup; existing SeedLink/expander reusable | Complete packet identity and physical controller pilot passed; universal arithmetic/tape proof pending | Format, framed Scan, exact typed control/all43,364 rows/28 corruptions and physical geometry passed; Complete paid Blocks, exact chess codec and row/literal semantic induction passed; join final packet path to physical execution, then full-machine acceptance |
| 3 | Structural proof of store/suffix sharing if literal quotient certification scales poorly | Within measured459,315;339,898same-node equivalences are diagnostics, not a closed subquotient | High: successor closure through loads/branches/jumps | High, possibly much smaller proof data | Use actual pilot obstruction; avoid a second literal route with the same scaling problem |
| 4 | Fixed two-bit or pair packing of the seed | Two-bit141,380gross payload states; five-bit-pair70,684seed bits before controller delta | Medium to high: framing, odd inputs, cleanup and exact codec | Moderate if expander contracts transfer | Compare fully paid result against structured-table compression before choosing |
| 5 | Replace the specialized interpreter by program-as-data or apply dictionary/grammar compression | No defensible net count yet; all stored program/dictionary/decoder states must be charged | Very high for a new interpreter; high for a generic decoder | High | Require an explicit whole-machine design and bounded end-to-end pilot |


The quotient opportunity is not a claim that all five store values are equivalent. The source
compiler currently pays 1+106668*5 main controls, while later observations can
make different stores distinguishable. Any quotient must preserve both rows,
exact stopping, writes, directions and successor classes for **every** old state.
The gross bound in priority 3 identifies a cost category; it is not a theorem
that four copies per node can be removed. Existing M7 merged duplicate entry
and terminal controls; it did not perform a complete body partition analysis.

General dictionary/grammar compression of the seed could outperform the fixed
symbol packing above, but it has no measured net savings or proved decoder yet.
Keep it behind a concrete pilot showing that data savings exceed every decoder,
workspace setup and dispatch state. Avoid opening many speculative routes at once.

## Bounded-pilot and continuation policy

- Finish the current high-payoff route while its proof obligations are shrinking.
  Reconsider its representation if the same substantive obstruction recurs without
  improved prospects; retain the exact failure and remaining obligation.
- A whole-body quotient pilot may run independently on the already retained body
table. The finite pilot passed as run39795919458 at8cd145e. The separate certificate
  pilot39800616921 is bounded to1200seconds/6GiB; retain every measured stage and
  stop at the first scaling obstruction.
  Never promote a finite refinement or state-count estimate to a Lean theorem.
- Pursue a small component change only when it closes a named dependency of a
  larger counted full-machine reduction; record that dependency and payoff here.
- At every major checkpoint update this breakdown, accepted saving, candidate
  estimates, ranked opportunities, proof/effort assessments and the next test.
- Preserve the frozen specification, all accepted machine/evidence files, remote-only
  computation, no outreach, periodic usage checks and a complete resumable handoff.

Certificate pilot checkpoint: run39800616921 failed before loader elaboration with
thread-creation failure under the5.5GiBvirtual-address cap, sampledRSS885MB.
This is a harness/resource configuration obstruction, not a measured proof cost.
One bounded rerun will retain RSS/wall watchdogs while removing the virtual cap.

Secondcertificateattempt39802757781: Loaderspassed; MapData stopped at inline
audit/importvisibility and stylelint errors after133.9s/6015852544sampledRSSbytes.
No actual rows reached. Repairingfull-private-importaudit and diagnostic
classification before treating this as a proof-scaling measurement.

Third certificate attempt 39806307575 at 992129b hit the actual 6-GiB map-loading
ceiling: 172.434 seconds, sampled peak 6,447,697,920 bytes, zero audits or row
proofs. The source-reviewed bounded alternative uses a raw-Nat balanced map plus
a complete kernel range certificate and universal conversion-identity theorem.
This removes per-leaf Fin proof terms without changing the actual RowAt target;
its memory effect has not yet been measured. Keep the same resource limits.

## Structured initializer measurement

Remote run 39806575742 at 3a4626e passed the complete finite packet census in
1.585 seconds, peak 74,372 KiB. It checked all 5,952 rows, 141,380 source symbols,
and 424,156 accepted seed bits, plus 136 positive fixtures and 17 corruptions.
Evidence is retained in `round-04/evidence/packet-01`. The hardened replay
39807083846 at 6b2e120 also passed: 1.991 seconds, 74,268 KiB, 136 fixtures and
19 corruptions. `packet-02` and `parent-packet-replay.json` retain exact evidence
and parent source/artifact hash checks. A bounded physical-controller pilot is
now authorized; separate workers own the complete table and independent checker.

| Proposed component | Paid allocation or status |
|---|---:|
| Packet writer, including final turn | 173,642 states by the established writer formula |
| New structured decoder, including terminal/error controls | 21,682 measured states |
| New decoder/expander bridge | 1 |
| Retained seed expander and bridge | 216 + 1 |
| Accepted body | 573,802 |
| **Candidate complete machine** | **769,344** |
| **Candidate with the still-uncertified quotient body** | **310,029** |

Neither candidate is accepted. Physical controller run39810577763 at0afbd2a
passed:21,682states/43,364rows,66complete packets,10corruptions,410,290steps,
maximum47,746percase;checker0.777seconds/43,644KiB. Every paid block and exact
head/tape cleanup is included. Official controller-01 evidence and parent replay
bind exact sources/table/accepted pins. Universal decoder correctness and full
chess integration remain unproved. The new Format and Controller proof leaves
unlock the measured228,832saving; they are not separate state-reduction claims.

Measured optional extensions rank below the main decoder: removing structurally
unused operands saves only 494 data bits. The tested 4/6/8-bit dictionaries save
18,453 / 19,546 / 12,611 data bits after dictionary storage but before lookup
controls. Defer these extensions: they add proof and implementation cost while
the main decoder could unlock over 200,000 full-machine states.


## Current bounded proof decision

Run39812361401 atfabb9f4 is the fifth body certificate trial, with unchanged
1200second/6GiB pilot limits. The tiny TemplateSmoke checks imports, option style,
loader and range-proof APIs before full data. Only proof-only map witnesses skip
native compilation; their transparent kernel-checked bodies and full safe audit
remain. If this still cannot reach actual rows efficiently, stop tuning literal
loading and evaluate the documented structural/local-slot certificate route.

The decoder pilot removes a large category of paid source-table bits. Do not
shave its small paths for their own sake before the complete228,832saving is
certified. Additional dictionary extensions remain deferred until a bounded
net-saving test justifies their lookup and proof overhead.


Checkpoint after body attempt5: run39812361401 atfabb9f4 completed with a
bounded memory obstruction in the external full-private audit of TemplateSmoke.
The tiny kernel module itself passed in8.113seconds, but interpreted `lean --run`
audit reached6,477,537,280bytes after12.100seconds; no large map or actual body
row was checked. Evidence certificate-05 is retained/committed at8500f41.
A separate300second/6GiB compiled-auditor smoke test is being prepared before
any further full-data retry. It retains exact full-private closure and permits
no new proof/saving claim. This targets interpreter overhead, not a larger cap.

Decoder proof source checkpoints: f882aa8 first Format block;8500f41 adds small
complete header geometry and compact-word scan bounds. Remote format run39813062936
and primitives repair session39813644432 are in progress. Typed Controller source
is under construction. Geometry/Scan source leaves are intentionally partial
modules with no placeholders; their complete universal leaf gates remain open.


## Major proof checkpoint:16:43UTC

Accepted998176 and accepted cumulative saving1906447 remain unchanged.
Controller correspondence is now checked: session39814488598iteration4 atfb199ee
strictly built the actual Lean control and compared every43364row against the
pinned pilot;28corruptions rejected. All21682controls remainpaid. Geometry's
consume/prepend/header arbitrary-frame equalities passed9b50904. OriginalW and
fixed-width value proofs passed; finalformat/framedScan checks continue. These are
proof dependencies of the228832fullsaving, not accepted intermediate reductions.

Compiled full-private audit smoke39815643692 passed in27.433seconds; audit itself
7.088seconds,4821213184bytes,9roots700dependencies,propextonly. This removes the
interpreted-audit obstruction under the original6GiBcap. Full bounded body trial
39816362847 now tests rawNat map/typedquotient and increasing actualrow coverage.
It has1200seconds/6GiB; exactkernelnegative after64states; stopatfirstobstruction.
No full map or actual-row proof has yet passed. Uploaded artifacts are retained
with explicit PENDING provenance while GitHub status is delayed; final API/log
retention remains a gate before any accepted machine.

## Major proof checkpoint: 17:03 UTC

Accepted full count **998,176** and cumulative saving **1,906,447** remain fixed.
Full quotient trial 39816362847 now passed complete map loading (25.832 seconds,
3.186 GB) and full-private audit (3.242 seconds, 4.179 GB). QuotientData failed
with maximum recursion depth after 99.602 seconds / 5.940 GB; no RSS stop and
no actual-row certificate. This is a new, narrower obstruction. Preserve the
same 1,200-second / 6-GiB pilot cap and review quotient code-generation structure
before another trial; no accepted saving follows from map success.

Final original-word/packet Format and generic framed Scan proofs passed. The
exact Controller plus first row-view lemmas passed all 43,364 row comparisons
and 28 negatives again. Physical paid-block and source-graph induction modules
are in first remote checks (39818051349 / 39818061113). They unlock the same
**228,832** full-machine opportunity. No new component optimization is being
pursued for its own sake. Ranked priorities remain quotient first by absolute
saving, structured initializer in parallel by shrinking proof obligations, then
structural certificate alternatives if the concrete quotient stalls.


## Major proof checkpoint: 17:28 UTC

The **998,176-state accepted machine** is unchanged. The **769,344-state**
structured-initializer candidate still needs final semantic composition and full
acceptance. Its exact173641packetbits/173642writerstates now pass Lean through
the frozen source's existing certificates. Every paid decoder read/emission/
finish contract and controller correspondence also passes. These verified small
components unlock the already-measured **228,832 full-machine saving**.

The larger **459,315-state quotient opportunity** remains first by absolute
saving. Trial07 failed only on generated formatting before any large-data stage;
trial08 (39822945066) repairs formatting while preserving all terms, paths and
resource limits. No new scalability claim or accepted savings follows. Rank and
candidate totals remain unchanged; final proof difficulty is still higher for
concrete quotient certification than the now-shrinking initializer proof chain.


## User-requested pause: 2026-10-22

**Campaign paused; no jobs may restart without an explicit resume.** All four
remaining remote checks are completed/cancelled, and the final branch inventory
has no active runs. Accepted count and all opportunity rankings above are unchanged.

Trial08 was cancelled with only a source manifest retained; it has no interpretable
scalability outcome. The conditional `Correct` physical-path lift passed its uploaded
strict check before cancellation. The final `Transducer.packet_run` source is saved
but unverified, and full-machine composition/acceptance remains outstanding.
See `RESUME.md` and `pause-2026-10-22/manifest.json` for exact restart state.


## Resumed under deadline

User resumed fromfc16528 and requested wind-down by16:15 Eastern on2026-10-22.
See ACTIVE-RUN.md for current runs and ownership; accepted count and all ranked
full-machine opportunities above remain unchanged. Final decoder proof is in
remote repair; independent full native acceptance components are being authored.


## Major checkpoint: resumed quotient obstruction and complete decoder proof

Accepted machine remains998176; no new full saving. Whole-body quotient still
offers459315 measured finite states, but trial09 hit the original6GiB cap in
QuotientData (142.458s,6,486,990,848bytes). Smoke/full map/audit passed; zero
actual body rows are kernel-certified. A raw numeric quotient proposal is being
reviewed to remove per-row dependent proof data, with unchanged caps.

The initializer now has a verified unconditional exact whole-tape/head decoder
theorem (39827508136 at7c477f3). Complete769344 machine source is in strict remote
checking; native full export/independent fixtures and acceptance checker sources
are ready or under review. Their work unlocks the same228832full saving.


## Major checkpoint: complete theorem passed,18:16UTC

The full769344-state structured machine now passes strict public Lean build
39828692045 at e40aeef. Allocation:173642writer +21682decoder +1newbridge
+216oldexpander +1oldbridge +533341main +40461return. Original two-direction
not-draw equivalence and exact row image are kernel-checked. Accepted best remains
998176 until current full acceptance39829682430, fresh review/seal/replay complete.
Potential228832fullsaving is now awaiting acceptance evidence rather than semantics.

The459315body opportunity remains largest. Packed raw numeric transitions are
authorized for one bounded pilot, targeting measured typed-data memory overhead;
complete range/fidelity proofs prevent modulo aliasing. Caps1200s/6GiB unchanged.
Zero actual-body rows are certified, and combined310029 remains conditional.
