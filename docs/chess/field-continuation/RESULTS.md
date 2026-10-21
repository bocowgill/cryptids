# Certified return through its interpreter continuation

Completed 2026-10-21 in `bocowgill/cryptids` on
`codex/chess-openevolve-pilot`. The certified return at `SharedModel.stack0629`
now connects through the actual `normal 2` dispatch and its main-stack pop,
ending on arrival at `ret RuntimeModel.s003`. The composed binary module has
**425 states: 245 retained return states and 180 additional states**.

| Control family | States | Numeric range |
|---|---:|---|
| Retained return, with its five former exits made live | 245 | 0–244 |
| Shared normal dispatch gate | 1 | 245 |
| Main-field scan read | 39 | 246–284 |
| Scan handoff gates | 2 | 285–286 |
| Advance one source cell | 14 | 287–300 |
| Advance handoff gate | 1 | 301 |
| Gap-marker read | 37 | 302–338 |
| Marker handoff gates | 2 | 339–340 |
| Retreat one source cell | 14 | 341–354 |
| Retreat handoff gate | 1 | 355 |
| Previous main-symbol read | 39 | 356–394 |
| Loaded-store handoff gates | 5 | 395–399 |
| Five clear-field instances, including five final ports | 25 | 400–424 |
| **Total** | **425** | **0–424** |

Entries are 0/49/98/147/196. The old return ports 48/97/146/195/244 now execute
real transitions into the shared dispatch. Each handoff executes a right move
and a charged left-move gate. Final ports 404/409/414/419/424 encode `ret s003`
and the five possible loaded stores. All ports are included in the inventory;
no external store or return register performs a transfer.

The actual frozen `normal 2` body is `RuntimeModel.s004`, which pops the main
stack and overwrites the incoming store. This justifies merging the five
incoming paths after return. The pop scans present main coordinates to a gap.
A marked gap loads absence and preserves the tape. At an unmarked gap, it moves
left, loads the previous main symbol and clears exactly that main coordinate.
Other stack fields, markers and every other tape cell are preserved.

`ConjectureMachines.Compilation.FieldContinuation.composed_certificate` proves
corresponding source and binary execution from the original return entry to
`ret s003`, including the loaded store and the entire represented tape. Its
premises explicitly require a finite return path of length `n` and a finite
pop scan of length `m`; the theorem applies to arbitrary represented tapes
satisfying those premises. The source takes `n + m + 3` steps. The binary takes
`37*n + 26 + 23*m + 34` steps for a marked empty gap, or
`37*n + 26 + 23*m + 61` otherwise. Executing the successor `ret s003` is outside
this module's boundary.

Official full remote run
[39677074188](https://github.com/bocowgill/cryptids/actions/runs/39677074188)
succeeded at computation commit `4ee97f0289f7400f822022e67b6399a69715e949`.
All five phase receipts bind the same nine computation files and 406 frozen
inputs. Strict Lean compilation, native audit and native numeric export passed.
The audit checked 132 roots and 6,909 dependencies, allowing only `propext`,
`Classical.choice` and `Quot.sound`. No compiler helpers or meta generators were
excluded from this safe closure. Three forbidden-dependency controls and three
false Lean contracts were rejected for their intended reasons.

Independent remote replay of the exported binary rows passed **55,072 cases**:
46,875 composed source cases, 8,192 raw pop cases and five arbitrary valid-gap
cases. The composed cases cover all five initial stores, 625 valid source-cell
patterns, return distances 0/1/7 and scan distances 0/1/2/7/31. The raw cases
include unused encodings and are explicitly excluded from source-correctness
evidence. Across the suites, every one of the 425 controls was visited. All
nine deliberate corruptions were rejected. Each replay checks tape contents,
absolute head position, loaded store, final control and exact execution length.
These finite tests supplement the universal Lean certificate.

The official 21-entry artifact and logs are retained in [evidence/current](evidence/current).
All five unsuccessful proof-development runs remain in [evidence/history](evidence/history).
Two redundant initial CI jobs were cancelled. All task jobs have stopped.
Lean, Lake, native export, dependency auditing, fixture execution and state
counting ran remotely; local work was limited to editing and saved-evidence
inspection. The fresh-context advisory review and its portable metadata-only
checker are in [evidence/review](evidence/review). Root replay is recorded in
[evidence/root-check.json](evidence/root-check.json). Model review is separate
from Lean verification.

This is a certified interpreter module. The accepted complete chess machine
remains **390,491,642 states**; no full-machine saving or new blank-tape halting
theorem is claimed here. The frozen chess specification, accepted return
primitive, field backend and toolchain remain fixed. Outreach remains on hold.

Machine-readable results: [results.json](results.json). Resume instructions and
the next integration boundary: [RESUME.md](RESUME.md).
