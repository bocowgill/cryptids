# M6 completed checkpoint

M6 is **complete**, with all eight acceptance gates met on 2026-10-20.
The checked implementation is `256d7e1a91546d4b2289edf2b075ab7ffa2aa0ee` on
`codex/chess-baseline-m6` in [the fork](https://github.com/bocowgill/cryptids).
Subsequent completion commits change documentation only.

The explicit machine has **392,046,832 states and two symbols**. Starting in state
0 on a blank tape, it halts iff the frozen initial chess position is **not drawn**.
The initial position's value was not computed. The frozen reference and all
M1–M5 mathematical and computational inputs remain fixed.

The durable entry points are [results](RESULTS.md), [machine-readable
evidence](results.json), the [proof guide](BINARY-COMPILATION.md), the [acceptance
ledger](GATES.md) and [independent publication review](PUBLICATION-REVIEW.md).
All 393 literal table parts are retained in
[`artifacts/chess_baseline`](../../../artifacts/chess_baseline/README.md).

## Finished verification

- The supported Linux [M6 run](https://github.com/bocowgill/cryptids/actions/runs/39458752058)
  passed strict proofs and native builds, 50 foundation checks, standalone kernel
  replay, deep target comparison, semantic mutants, the normal sandbox comparator
  and all 392,046,832 row bytes across 393 ranges, with current source pins.
- The [original regression run](https://github.com/bocowgill/cryptids/actions/runs/39458752023)
  passed on the same implementation commit, including M1–M5 and the original
  repository comparator and blank-initializer checks.
- The earlier exhaustive local comparison also reproduced every gzip part and
  manifest exactly on Python 3.9.6/zlib 1.2.12. Its original pins are preserved;
  the later Linux process-monitor fix and regression fixture are explicitly
  distinguished from that historical evidence. Linux checks portable raw bytes
  and retained compressed hashes, without claiming identical fresh gzip output
  on a different codec runtime.
- Final independent review passed all three review gates. Root independently
  checked its sealed inputs, actual Linux reports, artifact archive and completed
  comparison journal before closing integration acceptance.

## Resource history and future work

At the user's request, 77 verified task-local processes were terminated around
15:28 UTC to free local resources. The project was then resumed explicitly.
The older `37fc80d` Linux run failed on a `/proc` process-exit race; that failure
is preserved. The narrow monitor fix was regression-tested and the fresh current
Linux run passed in full. No local Lean/LSP server or full native sweep was
restarted after resume; the expensive verification ran remotely and has finished.

Do not repeat expensive sweeps without a relevant source change or a deliberate
reproduction request. M7 state reduction and outreach remain **unstarted** and
require a new instruction. Any later work should preserve this baseline and its
proof, literal table, exact count and verification boundary.

Private working history and failure evidence remain in `.unlazy/chess-m6/`;
the implementation, table and final results are saved on the fork.
