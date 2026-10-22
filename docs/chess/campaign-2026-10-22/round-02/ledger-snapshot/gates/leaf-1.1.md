# Protected success linker
OWNS: Cryptids/Compilation/SeedLink.lean, .unlazy/chess-goal-20261022-r02/gates/leaf-1.1.md

- [x] G1: Complete generic paid linker source and all requested proof bodies cover the contract after four source passes.
  EVIDENCE: `Cryptids/Compilation/SeedLink.lean`. This is a source-completion gate, not a claim of successful elaboration. Pass 1 matched Machines/Init/FlatInit/ReverseInit.Schedule/LocalCertificate/StateTransition APIs and the exact contract. Pass 2 reviewed dependent numeric ranges and made the bridge exclusion explicit. Pass 3 was an independent read-only agent review of the whole source, covering arbitrary tapes, `done = 0`, other terminal states, and proof API orientation. Pass 4 rechecked complete contract coverage and matched the runtime concatenation proof against the existing FieldReturn certificate, making its zero-addition simplification explicit.
- [x] G2: Strict remote Lean and relevant hostile endpoint/count checks pass on exact source.
  EVIDENCE: root-owned remote run `39788567168`, iteration 2, commit `99836fb4c5bc32854830f2a7a6c7d035ce8f554d`. The retained receipt is `docs/chess/campaign-2026-10-22/round-02/evidence/link-final/unpacked/link.json`, with its command records beside it. `lake --wfail -f lakefile.chess-seed-20261022.toml build Cryptids.Compilation.SeedLink` exited 0 without timeout; Lean reported a 2.1-second target build. Source SHA-256: `485b23939c930a24980b34a63c985af2ac90277968a6536e656feb8f023aef0f`. Output SHA-256: `ccc248dab0f702a8828b12b7d9f0dd179149e53b4923e6de3abf1eee859f1b4f`. Root checked the exact source hash, source, and receipt. The compiled universal theorems cover arbitrary tapes, zero-step success at `done = 0`, preserved other halts, both scanned bits, exact `D + 1 + body.states` allocation, and exact `count + 2` runtime; no separate executed fixture is claimed. No local Lean, Lake, LSP, Probe, native execution, model, fixture, or counter was invoked. This certifies the generic linker only; complete expansion and full seed-machine acceptance remain separate.

The public interface is independent of the expander protocol. `link_states` charges exactly
`D + 1 + body.states`. `transition_old_none` preserves every other missing controller row;
`transition_done` and `transition_bridge` specify the sole patch and paid bridge.
`reaches_lift` and `runFrom_lift` preserve finite original paths because terminality prevents
stepping from `done`. `handoff_run` gives the exact two-step full-tape/head identity, while
`link_runFrom` separates the `count + 2` runtime from the state count. `body_respects` and
`body_halts_iff` preserve both body halting directions. `link_haltsOn` and
`link_haltsOn_of_runFrom` provide the requested arbitrary-input halting equivalence.
`numericRow` and `transition_numericRow` specify and cover every actual numeric table row.

All proof bodies are present with no placeholders or added axioms. Their current status is
strictly remote-checked and parent-accepted for the generic linker, on the source hash above.
Ownership of this source and ledger is released to root for integration.
