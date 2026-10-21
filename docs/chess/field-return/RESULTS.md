# Certified field-aware interpreter return

Completed2026-10-21 on fork `bocowgill/cryptids`, branch
`codex/chess-openevolve-pilot`. The actual interpreter return shuttle at
`SharedModel.stack0629` now has a certified field-aware binary implementation.
The complete capsule costs **245 states**, including every entry, marker branch,
loop return and continuation port across all five store values.

| Control family | Per store | All five stores |
|---|---:|---:|
| Seek marker, including entry dispatch |12|60|
| Marker branch and successor dispatch |1|5|
| Move to preceding cell and re-enter |24|120|
| Restore boundary after finding marker |11|55|
| Continuation port |1|5|
| Total |49|245|

Entries are0/49/98/147/196. Each store occupies a disjoint49-state block; its
last state denotes normal source label2 with that store. No external store or
return register implements these controls. The five continuation ports are
counted terminal controls in the exported capsule. Connecting normal label2 to
a complete compiled caller/body is outside this primitive integration.

The universal Lean certificate covers one complete source step and any finite
return path. If the first bottom marker is n source cells to the left, the actual
source machine takes n+1 steps and the binary machine takes37*n+24 steps.
Both reach corresponding continuation configurations. The store and every tape
bit are preserved, and the binary head moves exactly13*n positions left. The
representation relation covers every integer tape coordinate and explicitly maps
the original four stack coordinates and symbols into the frozen field encoding.
The complete assembly is `FieldReturn.return_certificate`.

Official full remote run
[39663260946](https://github.com/bocowgill/cryptids/actions/runs/39663260946)
succeeded at computation commit `a54a0823d7da7461c4b2c44998ff79f251e9b07e`.
All five phase receipts share the same eight computation hashes and326 pinned
accepted inputs. Strict Lean compilation and native export passed. The trust
audit checked79 roots and4986 dependencies, permitting only `propext`,
`Classical.choice` and `Quot.sound`. The compiler-generated `sourceRun._unsafe_rec`
artifact was excluded only after checking its safe owner and identical type;
no unsafe or partial declaration belongs to the mathematical dependency closure.
Three deliberately forbidden dependencies and three false Lean contracts failed
as required.

Independent Python replay of the actual native-exported numeric rows passed
**56585 cases**. This includes all8192 raw cell patterns, all five store values,
625 valid unmarked source-cell patterns and return distances0/1/2/3/7/31/64.
Every one of245 controls was exercised. All six corruptions were rejected:
changed tape write, wrong marker branch, wrong store entry, wrong loop return,
wrong continuation store and early exit. These finite fixtures supplement the
universal Lean certificate.

The official21-entry artifact and logs are retained under [evidence/current](evidence/current).
All three failed proof-development attempts remain under [evidence/history](evidence/history).
The initial generic CI and M6 jobs were cancelled as redundant. No local Lean,
Lake, LSP, LeanProbe, native export, fixture execution or state-count computation
was used. Source editing, hashes and saved-output checks ran locally.

The accepted complete chess machine remains **390491642 states**. This task
constructs and certifies one interpreter capsule; it does not claim a saving for
that complete machine or a new blank-tape chess halting theorem. The frozen
chess specification, prior field backend and accepted compiler remain byte-for-byte
fixed. Outreach remains on hold.

Machine-readable results: [results.json](results.json). Reproduction/checkpoint:
[RESUME.md](RESUME.md). The final advisory review and portable sealed checker are
in [evidence/review](evidence/review); root replay is recorded in
[evidence/root-check.json](evidence/root-check.json). The independent model review
is distinct from Lean verification. `evidence/check_evidence.py` is an additional
saved-output consistency check, not a proof or independent execution replay.
