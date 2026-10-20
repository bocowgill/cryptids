# Complete canonical table parts

`scripts/chess_m6_table_parts.py` packs and checks the **entire expanded binary
transition table**. Every state contributes one row and every row has two cells,
separated by one ASCII space and terminated by one LF. A cell is `---`, or a
binary write symbol followed by `L`/`R` and a canonical decimal destination.
Destinations must lie in `[0, states)`. Leading zeros, CRLF, missing final
newlines, extra rows, and truncated input are rejected.

This is an artifact transport and byte-identity tool. It does **not** establish
that a table implements chess, agrees with a Lean definition, has a particular
halting behavior, or satisfies the Chess Cryptid theorem. Those statements need
the separate Lean source/table correspondence and halting proofs. In particular,
an internally consistent manifest can describe a different valid machine.

## Commands

Python 3.9 or later and its standard library suffice. `pack` consumes a raw path
or binary stdin and requires an exact state count. Its output directory must be
new; it never overwrites existing parts. For example, after an independent native
export has written a canonical raw file:

```text
python3 scripts/chess_m6_table_parts.py pack /tmp/export.txt /tmp/new-table-parts --states STATE_COUNT --rows-per-part 1000000 --compression-level 6
python3 scripts/chess_m6_table_parts.py verify /tmp/new-table-parts --reference /tmp/independent-export.txt
python3 scripts/chess_m6_table_parts.py reproduce /tmp/new-table-parts --reference /tmp/independent-export.txt
```

Replace `STATE_COUNT` with the actual expanded binary state count. No final Chess
table, state count, or manifest is supplied by this generic tooling.

`verify --reference -` accepts an independent canonical stream on stdin. It
compares **every decompressed row byte for byte**, including delimiters and LF,
and requires EOF on both streams after the declared number of states. Hash
agreement alone never marks the comparison successful. Without `--reference`,
`verify` reports `artifact-integrity-only` and `compared: false`.

`unpack DIRECTORY OUTPUT` validates all parts while writing their complete raw
rows to a new file. `OUTPUT` may be `-`; then raw bytes go to stdout and the JSON
summary goes to stderr. A failed check may leave partial output, so success must
be determined by the exit status. Generic binary output streams that perform
short writes are handled explicitly; a stream making no progress is rejected.

`reproduce` first performs the full independent raw comparison, then packs that
reference into a **fresh temporary directory** using the manifest's settings. It
compares all manifest and compressed part bytes directly, rather than comparing
checksums alone. The original artifact stays untouched. `--scratch-parent PATH`
chooses the scratch location and `--keep-scratch` retains the fresh reproduction;
otherwise it is removed. Reproduction requires a reopenable reference path.
A failed `pack` may leave incomplete parts, but publishes no manifest until the
entire input has passed validation. Retrying requires a new output directory.

## Python interface

Load the module normally and pass binary streams:

- `pack(source, new_directory, states=..., rows_per_part=..., compression_level=...)`
  returns the measured manifest.
- `verify(directory, reference=None, output=None)` returns validated counts,
  hashes, and an explicit full-stream-comparison flag. The caller owns streams.
- `reproduce(directory, reference_path, scratch_parent=None, keep_scratch=False)`
  performs independent comparison and deterministic fresh reproduction.

Validation failures raise `TablePartsError`; filesystem failures raise `OSError`.
The CLI reports either on stderr and exits nonzero.

## Artifact format

The directory contains `manifest.json` and only the listed
`part-00000000.txt.gz`, `part-00000001.txt.gz`, … files. Parts split on a fixed
number of whole rows; only the final part may contain fewer rows. Filenames,
indices and zero-based end-exclusive state ranges must match their exact order.
Missing, duplicate, reordered, unexpected, and symlinked entries are rejected.

The versioned manifest records the total states, fixed rows per part, compression
settings, total raw/compressed sizes and whole raw SHA-256. Every part records its
index, filename, state range, row count, raw/compressed byte counts, and both
SHA-256 digests. Verification reads all compressed and decompressed bytes, checks
every row and destination, and checks all totals. JSON has one canonical encoding;
duplicate fields, unknown fields, invalid types and inconsistent metadata fail.

Each part is one gzip member with `mtime=0`, an empty embedded filename, explicit
compression level `0..9`, and fixed header fields. Extra members, trailing padding,
CRC failures and noncanonical headers fail. There is no timestamp or source path
in the artifact. Identical input and settings produce identical output with the
same Python/zlib implementation; use the same versions for compressed-byte
reproduction. Full raw byte comparison does not depend on matching compression.

## Memory bounds and verification evidence

Compression/decompression and file comparison use 64-KiB blocks. Row reads are
bounded by the maximum canonical row length implied by the state count. Gzip
output is explicitly bounded per decode call, so an overlong compressed row does
not cause an unbounded read. Metadata is capped at 100,000 parts and a 64-MiB
manifest; table rows are never accumulated. At the default one million rows per
part, the part limit permits tables with up to 100 billion rows. Large raw scratch
files need not be retained after successful independent comparison.

The own-evidence runner is `.unlazy/chess-m6/leaf-1.41/verify.py`. Its format group
uses the actual M5 `artifacts/chess_m5/white.txt`: 49,910 states, 759,985 bytes,
whole raw SHA-256
`013d20c86e63a4da69bed35d162356ba9f2364e332b79a5e3c578b8cfecaf430`,
and 13 row-aligned parts. It checks lossless roundtrip, deterministic multipart
bytes, fresh reproduction, all gzip header variants, binary stdin/stdout, and
short-write handling. Negative controls cover malformed rows, range/count errors,
metadata mutations, truncated streams, extra gzip members, changed bytes, and
valid modified rows with all checksums recomputed; only the full independent
stream comparison rejects that last internally consistent change.

Separate 100,000-row and 1,000,000-row subprocess profiles perform generation,
packing, independent comparison/unpacking and fresh deterministic reproduction.
Each has a 60-second wall cap and a live 8-GiB RSS cap. Source hashes, measured
throughput and RSS are retained in the leaf evidence. These synthetic profiles
exercise transport at their stated sizes and establish no unmeasured final Chess
artifact size, runtime, or mathematical property.
