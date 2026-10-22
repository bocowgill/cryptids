# Bounded finite packet census

Status: implementation and four source-review passes complete. Root reports that first remote run `39806575742` at `3a4626e` passed and is retained in `evidence/packet-01`: 173641 packet bits reconstructed all 424156 accepted seed bits and 141380 symbols, with 136 fixtures and 17 hostile controls passing in 1.5846 seconds at 74372 KiB peak RSS. The measured arity-only gain is 494 data bits; dictionary widths 4/6/8 yield 18453/19546/12611 gross data bits before any added decoder cost. This supports keeping the fixed29 baseline. The follow-up source hardening below adds two multiline parser controls and absolute-deadline repairs; it requires a distinct patched-source rerun. Root owns execution and retention; this leaf performed no execution. The accepted machine is **998,176 states** (`a2110e2`, final 35-gate checkpoint `1fa449d`); the body quotient certificate pilot remains primary work. This packet pilot creates no TM controller and runs no Lean.

Run only remotely:

```sh
CHESS_REMOTE=1 GITHUB_ACTIONS=true python scripts/chess_table_seed_20261022/pilot.py \
  --output .lake/chess-table-seed-20261022 --seconds 600 --memory-gib 4
```

The exact success banner is `CHESS_TABLE_SEED_PACKET_CENSUS_PASSED`. The script rejects execution unless both environment guards hold. It caps address space at 4 GiB, gives work 597 seconds, and keeps a hard 600-second deadline active through final diagnostic writes. A hard timeout exits 124 and writes the preopened `hard-timeout.txt`; the running summary and latest progress remain available. Ordinary failures retain `failure.txt` and a failed `pilot-summary.json`. A fresh output directory is required for all pilot-owned evidence names, including partial runs and temporary JSON files; wrapper manifests and command directories may already exist.

## Independent inputs and identities

The source parser reads the literal `SourceModel.lean` row-block region, follows the actual `rows` append tree, and parses the actual root. It rejects unconsumed syntax, duplicate blocks, wrong constructor arity, missing/cyclic/reused blocks, noncontiguous offsets, unreferenced blocks, wrong table span, and child indices outside their source row. It removes Lean comments explicitly before parsing. `Tape.literalArgument` must have exactly one hexadecimal singleton RHS; trailing expressions are rejected. `Tape.table` and `Tape.input` must have the exact expected bindings across their complete declaration bodies, including multiline continuations. The parser preserves every row, every zero operand, and every original index.

Identity-critical `SourceModel`, `Tape`, `Input`, `CodeDAG`, `RuntimeWire`, `Seed/Format`, and `Seed/ChessCodec` bytes are checked against copied accepted source hashes. The remote manifest records those enforced pins and all input source hashes. The accepted oracle is the raw file:

`docs/chess/campaign-2026-10-22/round-02/evidence/final/unpacked/machine-export.json`

with SHA-256 `16e42308a35d2b68bc2e22870494715652ec106656cb53059a10605ba3fe8c2b`. Its schema is `chess-seed-complete-v1`; the oracle is its **top-level `seed` string**. Original file bytes are hashed before JSON parsing. Duplicate JSON keys, inconsistent accepted allocation metadata, or a disagreement with `writer.tape`/head/exterior metadata fail the run.

The source oracle constructs canonical LSB-first natural digits with an integer low-bit loop and a `.cons` after each number, including zero. It checks all 141,380 source symbols against the accepted 424,156-bit seed before compressing anything. The packet encoder then writes the format in [SEED-ARCHITECTURE.md](SEED-ARCHITECTURE.md): reversed literal argument, reversed fixed 29-bit rows with tag first/right operand/left operand, then reversed literal root. Three aligned terminators and the outer marker frame are included.

The independent decoder reloads the retained packet file. It parses fixed-width fields, emits `.cons` before trimming MSB-first digits, retains each tag until both operands are processed, then reverses the complete emission sequence. It calls neither the source natural encoder nor the packet encoder. It compares every reconstructed prefix/suffix symbol, every row and its order, every original stack symbol, and every accepted seed bit. The binary packed artifact is reloaded too, with an exact byte count and canonical zero padding check.

This is an equality of complete finite seed representations and their declared zero-exterior relative tapes. The decoder is a static emission model. No claimed physical tape execution, marker cleanup, head restoration, controller count, or universal TM theorem follows from this pilot.

## Retained evidence

| File | Content |
| --- | --- |
| `packet-source-manifest.json` | Source hashes, enforced accepted identity pins, commit/run IDs, accepted export identity |
| `source-input.json` | Every literal row, root, full hexadecimal argument, literal prefix/suffix symbols |
| `source-symbols.u8`, `decoded-symbols.u8` | One code byte 1–4 per complete original/reconstructed stack symbol |
| `packet.bits` | Exact ASCII bit string, no newline |
| `packet.bin` | Bits packed most-significant bit first within each byte, zero padding only in the last byte |
| `decoded-seed.bits` | Entire reconstructed accepted seed, including its framing and final zeros |
| `fixtures.json` | Complete finite fixture inputs, packet strings, expected seed strings, and outcomes |
| `hostile-controls.json` | Rejected corruption names/reasons and changed packet hashes where applicable |
| `counts.json` | Full row/tag/operand census, framing, arity, and bounded dictionary scores |
| `artifact-manifest.json` | Byte counts and hashes of the substantive packet artifacts |
| `pilot-summary.json`, `pilot-progress.json` | Final outcome or last reached phase and resource usage |
| `failure.txt`, `hard-timeout.txt` | Failure diagnostics; the latter is preopened and empty on a normal pass |

The expected packet length **173,641** is source-derived until a run records it. The writer formula is packet length plus one. The new decoder size `D`, any new controller count, and net state saving remain `null`/unknown. Summary classification is `FINITE_PACKET_CENSUS_ONLY`; `controller_constructed`, `tm_execution`, `lean_certificate`, and `new_accepted_machine` are false. The only prospective full-count expressions are `747662 + D` with the current body and `288347 + D` with the uncertified quotient body. Same-body saving is `250514 - D`.

Arity measurement reports `13*(2R-activeOperands)` data bits that could be omitted because their operand is structurally zero. Dictionary scores are restricted to index widths 4, 6, and 8, deterministic descending frequency/ascending-value ties. Each dictionary entry costs a presence flag plus thirteen bits, followed by one end flag; each occurrence costs one flag plus either an index or a literal. With `m` entries and `c` hits among `A=2R` operands, data saving is `c*(13-d)-A-(14m+1)`. Lookup and cleanup control remain unknown, so these are never labelled net machine savings.

## Checks and stopping criteria

Positive fixtures cover empty sections/table, all four literal letters, all seven tags, zero operands, powers of two, adjacent width boundaries, 4095/4096, 8191, and adjacent records containing long one-runs. Some fixtures intentionally range over all bounded triples beyond canonical source nodes to exercise the generic packet decoder. Full accepted-input equality and all positive fixtures must pass before negative controls run.

Corruptions cover both marker frames, each section terminator, truncation, extra trailing bits, operand/tag bits, a nonbinary bit, omitted zero-word `.cons`, source row order, wrong relative head, nonzero left/right exteriors, trailing `literalArgument`/`Tape.input` expressions, and a changed table binding. These test parser/equality checks; corrupted packets need not all be rejected by a future TM. Unexpected exceptions and timeouts do not count as successful rejection controls.

Any source identity, exact reconstruction, accounting, hostile-control, or resource failure stops the pilot and retains diagnostics. No controller implementation is authorized by this leaf, even if the packet census passes. Root may use the measured data to authorize a separate controller feasibility leaf; the existing 50,000-state budget remains only a proposed later gate.

## Four source-review passes

1. **Complete implementation:** strict literal-tree parsing, accepted source/export pins, exact packet codec, retained byte artifacts, bounded metrics, resource guards, and failure paths.
2. **Domain pass:** independent review checked LSB/MSB order, zero words, tag-last emission, complete seed framing, the wide argument, all paid packet overhead, and arity/dictionary arithmetic.
3. **Defect pass:** independent reviewers found prefix-only RHS parsing, a cleanup deadline gap, surplus packed zero bytes, and incomplete stale-output protection. Repairs require full RHS consumption, enforce accepted identity hashes, retain the deadline through finalization, require exact packed length, and guard every owned evidence name. Parser hostile controls cover the discovered RHS defects.
4. **Polish/evidence pass:** checked the exact root CLI/banner, manifest/oracle schema, source-versus-measured labels, unknown decoder fields, static-tape limitation, and diagnostic retention. Final independent reread found multiline RHS continuations and an absolute-deadline startup gap; the follow-up matches complete declarations, adds multiline corruptions, arms the timer before initial evidence I/O against the absolute start, and makes hard exit unconditional even if diagnostic writing fails. Source pins protected the original census against the RHS issue; any initial run and patched rerun must retain their distinct source manifests. No Python import, execution, compilation, test, count, Lean, or remote run was performed locally by this leaf.
