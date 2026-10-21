# Independent advisory source review — R1

Reviewer: leaf-1.1 / field_referee. This is source criticism, not replacement
implementation and not a formal-replay certificate. No Lean, LSP, LeanProbe,
Lake, native audit, table generation, fixture replay, model search, outreach or
network message was executed by this reviewer.

Initial source binding: `r1-initial-source-binding.json`. The first inspection
started at `6a1e80d37e43c4242d4a293e18e14ee07cd25682`; the saved binding is at
`e642c7251e1e390b8fd96e05a5eadfe6f8700eb2`, after root's proof-only Fields
repairs. Those four repairs were read as a diff; they do not change definitions,
theorem statements, routines, codecs or counts.

## Disposition at initial review

R1 remains pending because finding R1-S1 affects the required negative-control
acceptance path. R2 is pending: there is no complete successful final archive
bound to final source and final publication claims in this review.

### R1-S1 — generator negative control uses an unavailable declaration

`scripts/chess_field_binary/Audit.lean` appends
`Chess.Compilation.SourceCertificate.Generator.certify` for the generator
negative control (lines 66–67), but imports the environment of only
`Cryptids.Compilation.FieldBinary.Pilot` (line 32). Its dependency imports are
generic compilation/mathlib modules, not the chess source-certificate module.
The traversal performs `env.find?` (line 78) before checking the forbidden
generator namespace (lines 79–80). Consequently that control is set up to fail
with `Missing declaration`, not the generator rejection marker required by
`verify.py` lines 94–97. This is an acceptance-path defect, not evidence that a
generator occurs in a construction proof. The forbidden-name test should be
checked before lookup, or the control should otherwise be made honest in the
actually imported environment. Root acknowledged the finding and owns repair.

### R1-S2 — comparison boundary must survive final presentation

The source currently labels the old figures correctly as allocation marginals.
They are not standalone old routine counts or proven replacement savings:

- The old reader marginal removes an entire generic 11-bit reader family,
  including per-symbol continuation allocation for the 1,250-symbol alphabet.
  The candidate reads one three-bit field and reports its raw word at a charged
  terminal control.
- The old writer marginal holds the overlapping read-bearing-site parameter
  fixed while removing writer-family allocation. In the actual inventory,
  writes also belong to the read-bearing family. These allocations cannot be
  summed as disjoint per-operation replacements.
- The old body includes five store controls per graph node and the paid
  terminal-return allocation. The candidate counts its syntax tree and every
  exit. The candidate has no certified call/return assembly into a complete
  chess backend.

Final docs must retain these distinctions and make no ratio, per-operation
saving, aggregate backend saving, or new full-chess state-total inference. This
is a presentation constraint rather than a defect in the labelled marginal
definitions. Root acknowledged it.

## Construction examined

`Routine.machine` uses ordinary `Machine p.size 2` controls. `exit` costs one;
`next` costs one plus its continuation; `read` costs one plus both subtrees.
Duplicate result values still pay separate exit controls. Branch rows preserve
the scanned bit and make the specified move. `result` labels charged numeric
exits; it is not a mutable/free return register in the transition function.
`run_execute`, `result_exit` and `exit_stops` state the needed link among the
machine run, semantic tape, decoded value and stopping control. This certifies
standalone entry-to-exit execution if the remote Lean replay accepts the proof.
It does not certify an external caller or linking convention.

`readAt` moves to the field, branches on three raw bits, and returns the exact
zipper to its entry position. Its equality contract covers all tape cells, not
just the represented cell. `writeAt` fuses the final write with the first left
move; `written_nth` specifies each changed coordinate and the unchanged value
at every other integer coordinate, establishing alignment as well as a frame.
`moveCell` is thirteen preserving moves. Both movement directions use the same
field boundary in the neighboring cell. No tape-validity assumption appears in
these contracts.

`Codec` states the valid-cell interpretation separately: four little-endian
three-bit fields and marker bit twelve. Values five through seven are raw
executable words, with decoder fallback to absence; reads return those raw words
without coercing them to valid values. Valid writes preserve the marker and all
other fields; the frame theorem also covers neighboring cells. The mathematical
definitions agree with these intended contracts on source inspection.

The candidate sizes `[39,66,93,120]`, `[5,11,17,23]` and `14` per movement are
consistent with the visible syntax-size recurrences and charged terminal
controls. The old `[211410,82000,110]` figures are defined as differences of the
generic graph allocator, not copied into a fake old standalone machine. Their
kernel evaluation and actual row counts still require remote evidence.

The exporter traverses actual `p.machine.transition` rows and `p.result` values.
It emits four reads, eight raw writes per field and both moves. The independent
Python simulator consumes those rows and compares the entire sparse tape,
head, result and elapsed steps over all 8,192 local raw patterns. It includes
nonblank left/right contexts and six targeted mutations. These fixtures are
bounded regression evidence, explicitly not a universal proof. No fixture was
run locally. The source contracts provide the universal arbitrary-tape claim.

`verify.py` binds phase records to the candidate source files and frozen-input
hashes, records command output/exit/timing, and gates heavy subprocesses with
`CHESS_REMOTE=1`. The workflow runs all substantive work in the remote job and
uploads failure artifacts as well. Final authenticity, successful statuses,
all requested phases, output hashes, exported rows and final claims are R2.

No other semantic, state-accounting or pilot acceptance-scope defect was found
in this initial source pass. This statement is limited to the exact bound
source and must be revisited after semantic or acceptance changes.

## R1 completed source disposition

At `aec53614962607635789060f51c4576bdcdc00b0`, independently re-read the complete
diff from the prior binding. `Audit.lean` now checks the forbidden generator
namespace before looking up the declaration, closing R1-S1. `Pilot.lean` and
`DESIGN.md` explicitly state that the read/write allocation families overlap and
that the marginals are not additive per-operation replacement costs, satisfying
R1-S2's presentation constraint. The only other change is an additional
congruence step in the proof of `wordAt_nth`; no mathematical statement or
executable definition changed.

Final R1 source binding: `r1-source-binding.json`. R1 is met within advisory
source/construction scope: no remaining semantic, state-accounting or
acceptance-scope defect was found. R2 is still unmet. This source disposition
does not assert successful proof replay, axiom audit, fixture execution, actual
export counts, frozen-input verification or official-evidence authenticity.
Root's reported successful intermediate module builds were not used as a
substitute for the missing final archive.
