# Complete seed machine native evidence contract

Status: source drafted and reviewed; remote compilation, execution, independent
checks, and final campaign acceptance remain pending. This document does not
accept a new best machine. The accepted count remains 2,411,743.

The complete candidate pays 424,157 writer controls, 216 expander controls, one
preserving handoff bridge, and the unchanged 573,802-control body: 998,176 in total.
The proposed full saving is 1,413,567. The body includes 533,341 main controls and
40,461 return controls. Every allocated control has both scanned-symbol rows
checked, including unreachable controls, the charged invalid-input loop, the
patched success state, the bridge, and all missing body transitions.

## Remote interfaces

- Build `chess_seed_export` from `scripts.chess_seed_20261022.Export` with the
  round02 Lake configuration and warnings treated as errors.
- Run the executable with `.lake/chess-seed-20261022/machine-export.json` as its
  only argument, under the existing remote resource envelope.
- Run `python3 scripts/chess_seed_20261022/fixtures.py` remotely afterward.
- Success-only banners are `Seed complete native export passed` and
  `Seed complete independent fixtures passed`.

Both entry points require `CHESS_REMOTE=1` and `GITHUB_ACTIONS=true`. No local
execution has been performed. Root owns all remote dispatch and retention.

`machine-export.json` uses schema `chess-seed-complete-v1`. It records typed actual
machine dimensions, all region boundaries, actual seed bits, actual controller
rows, a complete linear writer replay, bounded complete startup fixtures, and
stream metadata. `full-rows.bin` contains 1,996,352 consecutive six-byte records in
state-major, bit-zero-before-bit-one order. Each `<BBI` record is little-endian
`write:u8, direction:u8, destination:u32`; direction zero is left and one is right.
The unique missing-row representation is `(2,0,0)`. Thus every actual transition is
retained in 11,978,112 bytes without implicit states or omitted halt records.

The native exporter compares every actual row against `FieldSeed.rowMachine`
before writing it. The Python checker independently rebuilds the writer, patches
the retained pilot's complete controller at success state214, inserts the paid
bridge, and shifts every row of the pinned accepted body from offset1,837,941 to
424,374. It requires exact byte equality, exact length, canonical missing rows,
binary writes, unit movements, and destinations inside the paid machine.

The accepted body stream is pinned by SHA256
`d2afbf1c0abe1afb0008029680c5bc52b41f2dc21718a88d16b7aecd06becb0a`.
The accepted full-input export is pinned by SHA256
`592ea3c892d0e9d5a6db6ce31e3f590bde7973774bdc9a70cfe46cb6996cd39e`.
Independent static decoding checks every seed symbol and every target bit against
that frozen source. The full quadratic startup is deliberately not simulated.

## Bounded execution and hostile controls

The native exporter executes the complete paid 424,157-step writer only. It checks
the exact physical head, expander entry, finite tape, and blank exterior, and the
Python checker independently replays its actual exported rows.

There are 88 complete generic startup cases: every word of length0–3 over all four
letters, two length8 boundary patterns, and a repeated length5 word. Each uses the
actual generic reverse writer, actual controller, actual paid linker, and a
one-state terminal body. Native and Python execution must agree on every final
nonblank cell, exact physical head, final state, runtime, and visited frame. For
length n these have 235+3n states, terminal body entry234+3n, exact runtime
16n²+86n+81, and final physical head−9−16n. Empty input has a13-bit output cell with
its sole marker at relative offset12. No inference about general correctness is
drawn from these finite fixtures; the separate universal Lean certificate is
required.

The actual exported controller also reruns the pilot's465 valid cases, nine invalid
codes at translated origins, two direct error probes, and14 existing hostile
controls. Twenty new hostile controls cover writer bits/movement/turn, controller
entry, unpatched or corrupt success, bridge direction/destination, body writes and
destinations, missing halt/canonical halt records, stream truncation/extra records,
unpaid states, writer physical head, composed exterior/runtime/bridge, and full
seed corruption. Positive controls run first. Each negative must be rejected.

`fixtures-detail.json` carries the independently checked counts, complete-row
census/hashes, static equality, writer receipt, every composed fixture result,
controller fixture results, and all rejected corruptions. Root's full runner then
requires the separate safe foundation audit, false-count contracts, earlier chess
regressions, fresh complete review, and sealed parent replay before acceptance.

Source review: complete implementation pass, domain/geometry pass, hostile/schema
and resource pass, and polish pass. A separate read-only reviewer completed all
four passes, confirmed the count/runtime/physical-head formulas and empty-input
marker geometry, and found one reserved Lean identifier (`prefix`), which was
renamed to `writerCount`. No unresolved semantic or accounting issue was found at
source level. Remote compilation and execution remain required.
