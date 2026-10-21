# Broader compiler-plan search

The completed pilot at `f400012` established 392,046,821 paid binary states.
This campaign keeps its computation, all 192 M7 frozen inputs and the chess
non-draw target fixed. Only new compiler/search modules are added. Heavy work
runs on remote GitHub Actions; outreach and upstream changes remain on hold.

Target the initializer, which currently uses twice the 1,555,180-bit input length.
Allow the model to generate new expression trees describing write/move schedules,
rather than select a member of a supplied six-policy set. Candidate text is parsed
as data, never executed as Python. A typed translator emits Lean definitions.
Independent finite tape fixtures reject incorrect schedules; admission additionally
requires a universal Lean certificate for all finite binary inputs. Failure to
prove a plan does not establish that the plan is false.

The engineering hypothesis is that writing in a different order can replace the
long return path. A mathematically checked support library may supply identities
for tape operations; supplying that library is not attributed to the search model.
The initial search seed remains the accepted forward-write/long-return algorithm.
Any hints or manually supplied fallback must be recorded separately from model
proposals. No autonomous discovery, minimality or scalability claim is automatic.

Aim for at least 1,000,000 fewer states than the completed pilot. This is a search
objective, not a theorem promised before measurement. Keep every rejected proposal
and report the exact best certified result even if the target is not attained.
Count every initializer instruction/state, and prove exact tape/head restoration
before entering the unchanged body. No expanded 390-million-row table sweep is
required; certify the universal numeric row constructor instead.

Budget: 24 remote model requests, 256 generated and 4096 input tokens per request,
one CPU model process and one proof subprocess at a time, 40-minute search bound.
No paid inference API is used. Runner billing is separate and must not be inferred.
The frozen baseline receipts remain valid only while all pinned bytes match;
new source still needs strict builds, trust audit, controls and assembly proofs.
