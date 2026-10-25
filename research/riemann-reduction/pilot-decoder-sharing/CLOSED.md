# Fixed decoder-sharing route closed — 2026-10-24

Disposition: **retired with kernel-checked counterexamples to every fixed alias's
required endpoint contract**. The user requested closure after successful
verification. No rerun, repair search or enlarged alias family is authorized.

## Frozen route

Baseline: `6c28d8524fa008c6fb5aadb759df74a55ce96423`.
Accepted table SHA-256:
`7e9731ed1b7c63d4e67c0f8d646f8498d9645f26e237a8604d4b7f91a6ab398d`.

The family is S = {26,46,50,86,87,94}: all 15 unordered pairs, either original
member retained as representative, for exactly 30 aliases. The removed member
maps to the representative; retained transition targets use that same map and
then dense labeling. The representative's original row supplies the shared row.
Control words, their lengths, tapes and native/return protocol stay fixed.

The required contract equates the alias's read-preserving parser endpoint with
the mapped accepted endpoint for every typed caller. For each alias, a retained
genuine typed caller violates it. `RhShare.all_aliases_fail` checks all 30
failures; `RhShare.family_exact` checks coverage of both orientations of every
pair. The failure predicate also checks that the original typed walk succeeds.

## Evidence and decisive example

For keep 26/remove 46, caller `.local 0 0` has walked word `1111101000`.
The accepted decoder reaches state 58; the alias leaves the read-preserving
parser, failing its required dense endpoint 57. At 10 physical steps from the
retained root frame, the old machine is in state 58 and the alias in state 77,
with two extra ONEs at tape coordinates 8 and 9. These complete finite tapes
were independently replayed in the original pilot.

[verify-02/RESULT.md](verify-02/RESULT.md) retains the successful kernel build,
full-private audit, axiom prints, rejection controls, pins and resources. Run
40145261135, producer `18e8cc2907fbf20b95f52b2cbdfaac5c8991be4b`, passed.
The four-root audit covers 774 dependencies and uses only propext/Quot.sound;
the main batched theorem uses only propext. The witness module's SHA-256 is
`68d218019755897c2fcc67f3ab3594fd4c279ac35240668766e9f1c1791d466e`.
The final evidence checkpoint is `7534bc5b139fe12538e3510a47ad8c4d565c98e7`.

The original Decidable failure, run 40141846969, and the separately authorized
successful verification are preserved separately. Closure changes no evidence,
proof source, runner or theorem. No candidate table was exported by either job.

## Limits and restart rule

This retires this fixed family **with its unchanged-endpoint contract**. It
does not prove blank-run inequivalence, blank reachability of a witness, a global
shortest-witness property, or nonexistence of other 94-state constructions.
A different word/frame relation, changed program, altered rows or larger family
would be a new route requiring a separately reviewed proposal; none is pursued.
Do not retry these false equations under a different name.

The accepted RH baseline remains 95 states; certified savings remain zero.
Chess's older campaign pause is preserved, and separate Parsimony work is
untouched. The [next proof-only proposal](../pilot-41-guard/PROPOSAL.md) awaits
approval. Broader search and every further RH compute job remain on hold.
