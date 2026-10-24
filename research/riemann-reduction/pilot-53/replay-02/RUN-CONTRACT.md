# One additional verification job — 2026-10-24

User explicitly authorizes one additional free remote job under the same limits
to independently replay and Lean-check the state-53 counterexample using the
repaired capacity probe. This supersedes the no-retry boundary only for this
single additional job. No further retry, broader search or Chess work is authorized.

Pin: `6c28d8524fa008c6fb5aadb759df74a55ce96423`; accepted files stay unchanged.
Repository: existing public `bocowgill/cryptids`; ubuntu-24.04, ordinary free
GitHub-hosted runner, read-only workflow token. Public status and branch identity
were rechecked before launch. Transport source with CI skipped, then launch once
through a change confined to the existing RH-only script path.

The fixed witness is outside44, zero DEC bank0, walked word 1001110110. There is
no candidate search. The original fixed 94-state table recipe is materialized
only to replay the two tapes and independently check all its cells and count.

The new Lean module imports the actual accepted machine and control/pop definitions.
Ten finite theorems, using only `decide +kernel`, bind the typed word/instruction,
the state53 cells, the two return values and their inequality. No baseline theorem,
RH statement or hypothesis is changed. No new solution placeholder or oracle.
All new/generated Lean lines <=100; strict warnings and linting remain enabled.

Resource ceiling: 3180 seconds from the job clock, 6 GiB child-session plus driver
RSS, driver <=512 MiB address space, -M6144, LEAN_NUM_THREADS=1. A per-host lock
serializes real Lean executable invocations, including Lake dependency compilation.
The wrapper changes only this ephemeral remote runner's toolchain, logs invocations,
and retains its original binary hash. No local Lean, counting, generation or tests.

Stage ceilings are unchanged or smaller: setup including checkout/toolchain/cache
<=900s, generation <=120s, fixed replay <=180s, Lean kernel build <=600s. Independent
Node replay and full-private audit/controls share the 450s audit allowance (60+390).
The optional 900s candidate stage is unused. All stages also consume the same
3180s whole-job budget; setup cannot steal a fresh full allowance later. The outer
workflow timeout remains 60 minutes. No larger runner, paid model/API or purchase.

The full-private audit walks types and all available opaque/private values, rejects
unsafe/partial dependencies and axioms outside propext/Classical.choice/Quot.sound.
It must reject a fresh injected sorryAx audit root. A fresh invalid proof must
fail Lean checking; separate wrong-cell/count controls must fail independent replay.
Retain sources, pins, commands, outputs, complete tapes and actual resource use.

Success certifies only the local encoding counterexample. It does not certify a
94-state RH reduction, prove blank-tape inequivalence, or resume broader search.
