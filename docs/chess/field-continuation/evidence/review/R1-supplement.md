# R1 fixture and export supplement — advisory pass

The final fixture source and changed export were inspected after the initial R1 snapshot. Their exact bytes are in `r1-supplement-source-sha256.json`. No fixture, machine, native export, count, or Lean computation was run locally.

The independent Python oracle constructs valid four-field source cells and directly implements the return, normal2 dispatch, scan to the main gap, marked-empty or previous-cell pop, and successor boundary. Replay consumes the actual exported numeric rows. It checks the whole sparse tape, physical head, loaded store, exact final state, and exact number of transitions. All five incoming stores are exercised. The return and scan distances are separate, including zero. Surrounding fields are populated, so clearing an entire cell or damaging a neighbouring field is observable. An additional valid-tape family includes an unmarked gap whose previous main coordinate is absent; this matches the general theorem rather than imposing a canonical-stack assumption not present there.

The raw-cell loop tests all thirteen-bit patterns at the pop entry, including invalid three-bit codes, but explicitly records that those invalid codes are not source-simulation evidence. Its fallback value matches the frozen field decoder. This is a robustness test only.

The nine corruption controls each modify a connector, return path, loaded-store gate, clear write, or successor port exercised by the selected case. The complete-visited-control check is a remote fixture obligation, not a local minimality claim. The source count routine separately includes every declared control and checks exactly the final ports halt; both outcomes remain to be confirmed in official evidence.

The export change uses a propositional conjunction for the same final-port criterion (`q >= 400` and offset modulo five equals four). It still obtains every transition from the actual `machine.transition`; the fixed inventory and port annotations are checked separately by remote count/replay. No material semantic or fixture-independence issue was found. R1 remains passed as independent model source review. R2 remains pending successful official same-source evidence.

The source repairs through commit `bf6223a` were inspected: named branch hypotheses for arithmetic bounds, the reserved local identifier replacement, explicit row/lift unfolding, a finite gate proof, whitespace, and an increased heartbeat budget. No graph row, theorem statement, representation, or premise was weakened or changed. The supplement hash manifest now also records both repaired Lean files.

The further repairs in `caf8bc6` were also inspected. They normalize represented-main fields, expand product extensionality, make the addressed-cell and outside-cell frame simplifications explicit, raise the certificate recursion limit, and remove unnecessary Graph proof commands/budget. The complete graph and all theorem statements are unchanged. The supplementary hashes bind these repaired sources.

The final normalization repairs in `a541566` were inspected: an explicit `stackAt 0 = main` fact, zero-coordinate/head/write reduction in the existing addressed-cell frame proof, and `Nat.one_add` for the source-run composition. No graph row, theorem statement, premise, or representation changed. The supplementary hashes bind these sources.

The repair in `4ee97f0` replaces only `represented_main` tactic normalization with a direct calculation from `represented_field` followed by reflexivity. Its statement is unchanged, as are all graph rows and premises. The supplementary source manifest binds this candidate.
