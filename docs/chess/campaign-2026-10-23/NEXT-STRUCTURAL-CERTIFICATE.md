# Next bounded structural certificate

Current target remains a fully certified310,029-state machine. Accepted769,344;
new accepted full-machine savings0. Strongest aggregate source proof39,240
states/78,480rows. Complete quarter and full-machine obligations remain open.

87passed all11cache batches/controls/private audits, but setup952.079s
consumed the1200s budget. SOURCE4received123.458s, not its nominal210s.
Source16passed117.438+3.050s. Do not attribute the stop to memory or claim
that a complete210s source4attempt failed. No unchanged retry or cap increase.

Measured batch costs: fidelity278.337s, data plus audits123.870s. Small841/
885cell batches with128operations still cost~14s fidelity each, versus
~29-32s for~16kcell batches, indicating nontrivial per-operation proof overhead.
86controlled main-only views save~21-24% over global views but leave main
checking dominant. 85source/count work is only~2-3%; do not prioritize it.

Proposed next pilot, NOT implemented or verified yet:

1. Introduce an unchecked Window record (start,finish,Cell tree), Boolean
   window/list validation, and ONE generic soundness theorem yielding each
   window's validation/count/body-bound/class/word properties. Preserve every
   mathematical fidelity claim through quantified family theorems; eliminate
   thousands of repeated count/word/class declaration wrappers.
2. Define a generic overlay/working-set World over a list of validated windows,
   with exact actualWorld fallback outside the windows. Prove forall-address
   equivalence and exact unchanged SourceCertificate construction.
3. Propose each operation's complete observed working set: local main range,
   own paid-return range, five entry stores per distinct outgoing source label,
   and shared halt-return state533341. Source label extraction must match the
   frozen RawOp schema; kernel-check actual labels and prefix offsets in pilot
   cases. Missing coverage must preserve correctness through exact fallback.
4. Reuse the three actual diagnostic cases445/476/356 and compare original,
   global, main-only and working-set source checks on ONE runner/data set.
   Reverse second-heavy order. Require generic theorem/private audits, closed
   validation of every proposed list, all source/count/bit/store/rank claims,
   actual SourceCertificates, and ordered retained timing markers.
5. Only material measured benefit justifies another substantial SOURCE16/4
   integration. Keep180/210s stage and1200s/6GiB overall limits. If it fails to
   reduce source or setup costs, reject it and investigate syntax/checker
   representation rather than adding more cache variants without evidence.

The working-set design intends to avoid remaining repeated large return-table
lookups. Do NOT claim zero fallback queries without coverage evidence. Window
validation remains ordinary kernel checking; no native proof oracle, extra
axiom, weaker source premise, dropped linter or omitted fidelity obligation.
No credible full-machine cost estimate until increasing substantial coverage
finishes. Full body/shared controls/bidirectional halting/exact paid allocation/
independent regressions/distinct final review remain mandatory.

Rank1still459,315prospective full-machine states, high proof difficulty and
moderate implementation effort. Both proposed changes unlock that same payoff;
no additive state saving. Frozen3116pins and historical evidence fixed, heavy
work remote/free existing runner only, local use low, outreach on hold.
