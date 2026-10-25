# Complete-printer attempts (maximum three)

1. [Run 40233914383](https://github.com/bocowgill/cryptids/actions/runs/40233914383),
   producer `4dd1a46617142b843e12cb37849d25cce1bbeaaa`.
   Failed in source-width preflight before any Lean command. Manual phase complete
   after exact fork-ref verification. New generic
   cleanup contracts, actual startup model, all-row census, and 53 new backward
   scan summaries over the reused packet modules. PrinterModel.lean line 143
   exceeded 100 columns due to the absolute output path. Corrective change: split
   the export call across argument lines in the generator. No cap/linter change.
   Full logs and archive retained under evidence/complete-01. Zero new proofs.

2. [Run 40235959402](https://github.com/bocowgill/cryptids/actions/runs/40235959402),
   producer `168ebc597b7b217d177738cf8b07b27cf7ae1455`.
   Failed at structural-cleanup. Generator export width fixed; startup blank
   equalities normalize before transitivity; a zero-step tape equality bridge
   preserves the checked input boundary. All source, model and machine pins fixed.
   Exact source tree published through Git API after repeated Git transport stalls.

   Diagnosis: blank quotient equality is not rfl; omega does not establish the
   Fin bit equality disjunction; ReflTransGen.mono needs explicit endpoint
   arguments; cleanup's atL_cons simp argument is unused. Corrected with the
   existing blank-cons theorem, fin_cases, endpoints and removal of the unused
   argument. No caps or theorem statements changed. Other structural bodies
   elaborate, but the failed module exports no object and failed roots include
   sorryAx, so none is accepted. Driver 72.2 seconds, structural command 10.889
   seconds, peak 4.577 GiB, no resource stop. Evidence retained complete-02.
   Final draft also delays local packet irreducibility until after the bit/string
   conversion, avoiding an unnecessary opaque-definition change obligation.
