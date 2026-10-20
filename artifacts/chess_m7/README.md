# M7 exact candidate table

This directory fixes the candidate table with 392,046,822 states and two symbols.
See the [M7 results](../../docs/chess/m7/RESULTS.md) for its verification status and
completed acceptance evidence. Its accepted predecessor remains intact in
[`../chess_baseline/table`](../chess_baseline/table).

The exact encoding consists of all retained baseline literal gzip parts and their
manifest, the fixed `table-map.json`, and the versioned numeric extraction recipe
[`quotient_table.py`](../../scripts/chess_m7/quotient_table.py). Extraction selects
literal rows and reindexes numeric destinations. It needs Python and the retained
payload; it does not execute a chess solver or Lean compiler. The standalone
[`ChessM7Challenge.lean`](../../Cryptids/ChessM7Challenge.lean) independently fixes
the mathematical target.

After the map is frozen, extract a zero-based interval as follows (complete-table
extraction is substantial work and should run remotely):

```sh
python3 scripts/chess_m7/quotient_table.py \
  --spec artifacts/chess_m7/table-map.json START COUNT > rows.txt
```

Each row has two space-separated cells and a final newline. `---` is a missing
transition; other cells have the form `0L123` or `1R456`, naming the written symbol,
head direction and destination. Concatenating intervals in numeric order recovers
the entire canonical table. The baseline manifest and complete selected raw and
compressed parts are validated during extraction, including rows outside the
requested interval.

The full remote verifier regenerates every candidate row, compares it byte for
byte with a newly built independent standalone exporter, and reproduces all gzip
parts. The canonical hash, part manifest, source pins, journals and evidence provenance
are recorded with the M7 results once that verification is complete. The new
compressed payload can be regenerated from this exact encoding without storing a
second nearly identical 1.76 GB copy in Git.

Native export, file I/O, hashing and gzip are the explicit artifact-verification
boundary. The Lean halting proof does not assume their correctness.
