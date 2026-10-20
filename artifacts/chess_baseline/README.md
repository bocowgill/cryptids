# Chess baseline table

This is the complete canonical transition table for a **392,046,832-state,
two-symbol** machine. It starts in state 0 on an all-zero, two-sided tape.
The target theorem is halting iff the frozen initial position is **not drawn**.
The chess value has not been computed. M7 state reduction is outside this milestone.

The table is retained literally as 393 ordered gzip parts in `table/`. Decompression
and concatenation recover the entire matrix without running a compiler or chess
solver. Each line gives scanned-zero then scanned-one transitions; `---` halts,
and `1R23` writes one, moves right and enters state 23. Indices are zero-based.

| Property | Value |
|---|---:|
| States / canonical rows | 392,046,832 |
| Columns per row | 2 |
| Compressed bytes | 1,762,091,864 |
| Expanded bytes | 8,979,481,064 |
| Full parts of 1,000,000 rows | 392 |
| Final-part rows | 46,832 |

The expanded stream's SHA-256 is
`85254453db2653e6a057307006848fea92c9dc1e1aba74c68f4fbc78cee8421e`.
`table/manifest.json` fixes every range, byte count and compressed/raw hash.
Its own SHA-256 is
`83e1d7442e5c9fac9ca928d7db2747c0b60b3ecd2612d54a674bfa105c573357`.

Validate and extract to a new raw file, from the repository root:

```sh
mkdir -p .lake
python3 scripts/chess_m6_table_parts.py unpack \
  artifacts/chess_baseline/table .lake/chess-baseline.txt
```

The canonical raw bytes are portable. Exact gzip reproduction uses the recorded
Python/zlib versions; a different codec runtime still checks all canonical bytes
and all retained compressed hashes. The final publication verifier additionally
compares every row against an independently compiled standalone Lean target.

M6 acceptance is **complete**. All 392,046,832 rows match the independently compiled
standalone target. Every gzip part and the complete manifest reproduce exactly on
the recorded local codec runtime. Strict builds, Linux sandbox comparison, the full
Linux table check, M1–M5 regressions and independent publication review pass.
See the [results](../../docs/chess/m6/RESULTS.md) and
[proof guide](../../docs/chess/m6/BINARY-COMPILATION.md). Lean proves the finite
mathematical machine and row-list identity; native byte/codec verification binds
the retained files under the documented external I/O boundary.
