# Complete-machine costs and priorities — 2026-10-22

Updated for the user's instruction to prioritize large complete-machine reductions.
This is the live campaign planning record; accepted evidence remains immutable.
No experimental estimate changes the accepted best.

## Counts at this checkpoint

| Component | Goal starting machine, accepted | Round 01, accepted | Round 02, experimental composition |
|---|---:|---:|---:|
| Paid input writer, including final turn | 1,837,941 | 1,837,941 | 424,157 |
| Complete seed expander | — | — | 216 |
| Additional expander/body bridge | — | — | 1 |
| Interpreter main controls | 533,341 | 533,341 | 533,341 |
| Interpreter return controls | 533,341 | 40,461 | 40,461 |
| **Complete machine** | **2,904,623** | **2,411,743** | **998,176** |

**Accepted full-machine saving during this goal: 492,880 states.** Round 01 is
sealed at `d79ae92`, with its completed ledger checkpoint `18e8474`.

**Round 02 prospective additional saving: 1,413,567 states.** The 216-state
controller, all 432 rows, 465 execution fixtures, 14 rejected mutations, and full
static input equality passed remote run39788561190. The generic D+1+B linker
passed strict Lean in run39788567168. Actual Lean controller row identity and the same finite fixtures passed
run39790380235 at4fa54a4. Universal expansion, full composition, audit and final
acceptance remain open. The
998,176 total is a measured component composition, not a certified full machine.

The current scanner, parser, fixed-block, cleanup and codec proofs unlock that
same 1,413,567-state reduction. Their payoff is not a small local saving. Do not
start shaving a few states from the 216-state controller while this larger
certificate is unfinished.

## Ranked next opportunities

The estimates below are explicit research hypotheses, not measured savings.
Their order combines absolute opportunity with the cost of obtaining evidence.

| Priority | Whole-machine mechanism | Absolute opportunity | Proof difficulty | Implementation effort | Next decision test |
|---|---|---|---|---|---|
| 1 | Finish three-bit seed expansion and exact paid composition | 1,413,567 additional states at the measured current design | High: universal marker/cleanup/termination; linker already checked | Existing implementation; focused proof integration remains | Complete strict remote component proofs, then full machine/table/audit/review |
| 2 | Share equivalent interpreter controls, including store-independent copies and repeated graph suffixes | Unmeasured; investigate tens to hundreds of thousands within the 573,802-state body | Medium if an exact row quotient is compactly certifiable; higher if the map needs a structural compiler proof | Bounded table pilot first, then one structural implementation | Minimize the entire retained body under exact write/direction/halting-preserving equivalence; report actual class count and certificate size |
| 3 | Eliminate most five-store control duplication architecturally | Gross main-control opportunity up to 426,672 before paying replacement memory/dispatch costs; no net estimate yet | High: change interpreter representation and refine all instructions | High | Use the body pilot to identify dead-store blocks; prefer a structural proof over adding a new memory mechanism if it captures comparable savings |
| 4 | Further compress the paid seed | Two-bit payload would save 141,380 gross payload states before framing/controller changes; a concrete five-bit-pair proposal saves 70,684 seed bits before the controller delta | Medium to high: framing, odd inputs, decoder, cleanup and codec identity | Moderate if existing expander contracts transfer | Bounded protocol/table pilot with all extra controls charged; do not count seed bytes alone |
| 5 | Replace the large specialized interpreter with a smaller program-as-data interpreter | Could remove a substantial fraction of 573,802 body states, but added program data/initializer may offset it; no defensible net number yet | Very high: new complete interpreter and compiler refinement | Very high | Require an explicit counted whole-machine design and a small end-to-end pilot before committing a campaign round |

Priority 2 is not a claim that all five store values are equivalent. The source
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
  table. Bound time/memory, retain its partition and an independent full-row
  certificate check, and label a nonconverged partition as incomplete evidence.
  Never promote a finite refinement or state-count estimate to a Lean theorem.
- Pursue a small component change only when it closes a named dependency of a
  larger counted full-machine reduction; record that dependency and payoff here.
- At every major checkpoint update this breakdown, accepted saving, candidate
  estimates, ranked opportunities, proof/effort assessments and the next test.
- Preserve the frozen specification, all accepted machine/evidence files, remote-only
  computation, no outreach, periodic usage checks and a complete resumable handoff.
