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
| 1 | Certify the complete exact interpreter quotient | 459,315 measured finite states; candidate full 538,861 | Generic LocalCertificate proof exists; concrete kernel scalability is being measured | Bounded full-data and representative-row pilot, then literal or structural certificate | Fifth bounded run39812361401 tests the repaired template and skips unnecessary native compilation of proof-only map witnesses; no actual rows certified yet |
| 2 | Encode structured source-table rows before expanding the exact old input | 228,832 measured prospective full saving; D=21,682; full candidate769,344 | High: complete decoder, exact word reconstruction and tape cleanup; existing SeedLink/expander reusable | Complete packet identity and physical controller pilot passed; universal arithmetic/tape proof pending | Prove original-word recurrence and exact typed control, then framed read/emit/cleanup and full composition; every control paid |
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
