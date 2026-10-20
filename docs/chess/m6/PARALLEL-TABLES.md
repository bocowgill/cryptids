# Parallel complete-table generation and independent comparison

`scripts/chess_m6_parallel_parts.py` runs accepted **range exporters** as argv
processes without a shell. It generates the complete expanded table in the
unchanged [table-parts format](TABLE-PARTS.md), and can compare every raw row byte
against a separate range exporter. This orchestrates artifact transport. It does
not run the initial chess evaluator, determine chess's value, or prove the Lean
source/table correspondence. No final Chess table or manifest is supplied by
this generic tooling.

## Producer contract and fixed identities

A producer receives `{start}` and `{count}` substitutions and writes exactly that
many canonical rows for consecutive **global** state numbers. `{states}` is an
optional substitution for the full state count. The two cells per row use global
destinations in `[0, states)`. No headers or progress messages belong on stdout;
stderr is retained separately with a 1-MiB cap per range. The producer must be a
deterministic, single-process exporter. The caller supplies the accepted exporter
and independently implemented comparison exporter; invoking a process does not
itself establish algorithmic independence.

`make_spec(argv, paths=..., cwd=..., env=...)` captures a fixed executable path,
SHA-256 of that executable and every explicitly declared source/data input,
working directory and explicit environment. Pin every semantic input used by the
exporter. The default environment contains only a fixed system `PATH` and C
locale. Source/executable pins are checked before and after each range, and before
completion. The orchestration module and accepted table-parts module are also
fingerprinted and checked. Both argv and fingerprints are recorded in the run.
Templates allow only plain `{start}`, `{count}`, and `{states}` fields; no shell
interpolation, formatting expressions, or command strings are executed.

The CLI can capture a specification after the actual producer has been accepted:

```text
python3 scripts/chess_m6_parallel_parts.py spec --output /tmp/exporter.json --pin /path/to/accepted-source.c -- /path/to/exporter --start '{start}' --count '{count}'
```

The output specification must be new. This command records current accepted input
bytes; it does not decide which source version should be accepted.

## API and CLI

Generation uses a **new run directory**, containing `parts/`, `scratch/`, `logs/`,
`run.json`, and `events.jsonl`:

```text
python3 scripts/chess_m6_parallel_parts.py generate /tmp/new-export-run --producer /tmp/exporter.json --states STATE_COUNT --rows-per-part 1000000 --workers 4 --timeout 120
```

`run.json` records the fixed plan, fingerprints, attempts, completed ranges and
status. `events.jsonl` records range completions, actual argv, timings and sampled
RSS; the CLI also prints progress as JSON lines. Parts are committed to the
completed inventory only after successful exit, canonical global-bound validation,
exact row count/EOF, compression and identity checks. The complete parts manifest
is published only after all ranges exist and their whole raw hash has been
computed in numeric part order. Completion order never controls row order.

The matching Python call is:

```python
spec = make_spec([exporter, "--start", "{start}", "--count", "{count}"],
                 paths=[accepted_source])
result = run(new_run_directory, states=q, producer=spec,
             rows_per_part=1_000_000, workers=4, timeout=120)
```

For a full independent comparison, supply a separate accepted producer
specification and a new comparison run directory:

```text
python3 scripts/chess_m6_parallel_parts.py compare /tmp/new-comparison-run --producer /tmp/independent-exporter.json --states STATE_COUNT --rows-per-part 1000000 --workers 4 --against /tmp/new-export-run/parts --reproduce
```

The API uses `run(..., compare_directory=parts_directory, reproduce=True)`.
Every range is exported anew. Every decompressed source row is compared directly
to the independent row, including all cell bytes, separators and LF, and both
streams must end at the exact range boundary. Checksums alone never establish
comparison success. `compared_rows` becomes the full state count only after every
range succeeds. Omitting `--reproduce` retains full raw comparison while avoiding
a second compressed artifact. With `--reproduce`, fresh gzip parts and a fresh
manifest are also compared byte for byte to the original. Use the same
Python/zlib implementation for compressed-byte reproduction.

The parts directory can subsequently be promoted to another basename, such as
`artifacts/chess_baseline/table`; its format does not depend on the basename.
Keep run/progress/provenance metadata outside it. Promotion and publication are
caller operations, performed only after successful completion and the separate
mathematical acceptance checks.

## Bounds, failures, and resume

There are at most four workers and two million rows per range; one million rows
and four workers are the default. Raw stdout goes to a separate temporary file
per active range, never one full-table allocation. After producer exit, canonical
rows are validated and compressed using bounded buffers. Successful and failed
raw scratch files are removed. A live monitor checks aggregate parent/known-child
RSS against a configurable limit of at most 8 GiB, producer wall deadlines,
range-size bounds and stderr limits. Monitoring occurs approximately every
50 ms, so file limits can briefly overshoot between samples. Resource monitoring
supports macOS and Linux. The generic tool and fixtures use Python's standard
library only.

A failed producer, timeout, nonzero exit, invalid row, changed pin or comparison
mismatch marks the run failed and terminates active producers. Unix process-group
termination is used when permitted, with direct child termination as a fallback.
A cancellation guard prevents late launches during failure cleanup. Partial
parts and progress never constitute a complete accepted export.

Generation can explicitly resume with `generate RUN ... --resume`. It requires
identical source/executable/code/runtime identities, state count, range boundaries
and compression settings. Every retained completed part is fully revalidated
before reuse. Worker count, deadline and RSS limit may change within the stated
bounds; each attempt records those resource settings separately. Verified parts
are never overwritten. Uncommitted part files from an interrupted attempt are
quarantined with a progress event before their ranges are regenerated. Unexpected
entries, missing completed parts, duplicate/reordered inventory, or stale pins
fail closed. Comparison always requires a fresh run and fresh producer output;
it does not resume by treating stored checksums as an independent comparison.

Normal generation and comparison do **not** add another serial per-row pass at
the end. Workers have already checked every row, count and global destination.
The final whole raw SHA-256 streams decompressed chunks in numeric part order and
checks every part's stored raw/compressed size and digest. This preserves exact
all-byte acceptance without serially reparsing hundreds of millions of rows.

## Verification

Run the focused verification independently with:

```text
python3 .unlazy/chess-m6/leaf-1.44/verify.py --all
```

The fixtures compare parallel artifacts with accepted serial `pack` byte for byte,
including the actual 49,910-row M5 white table. They exercise out-of-order process
completion, paths containing spaces and shell metacharacters, CLI operation,
separate producer implementations, full comparison and fresh reproduction.
Rejection controls cover truncated/extra/malformed/out-of-range rows, nonzero and
hanging producers, resource limits, changed/reversed independent output, stale
identities/settings, missing or reordered parts and explicit resume behavior.
Separate 100,000-row and 1,000,000-row profiles use at most four processes, enforce
60-second outer caps and the live RSS limit, and retain throughput, source hashes,
observed concurrency and resource measurements under the leaf evidence directory.
The large fixture also compares every compressed byte to serial packing. These
bounded tests make no claim that the actual full Chess export has occurred.
