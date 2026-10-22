# Protected success linker
OWNS: Cryptids/Compilation/SeedLink.lean, .unlazy/chess-goal-20261022-r02/gates/leaf-1.1.md

- [x] G1: Complete generic paid linker source and all requested proof bodies cover the contract after four source passes.
  EVIDENCE: `Cryptids/Compilation/SeedLink.lean`. This is a source-completion gate, not a claim of successful elaboration. Pass 1 matched Machines/Init/FlatInit/ReverseInit.Schedule/LocalCertificate/StateTransition APIs and the exact contract. Pass 2 reviewed dependent numeric ranges and made the bridge exclusion explicit. Pass 3 was an independent read-only agent review of the whole source, covering arbitrary tapes, `done = 0`, other terminal states, and proof API orientation. Pass 4 rechecked complete contract coverage and matched the runtime concatenation proof against the existing FieldReturn certificate, making its zero-addition simplification explicit.
- [ ] G2: Strict remote Lean and relevant hostile endpoint/count checks pass on exact source.
  EVIDENCE: focused remote compilation requested from root; no local Lean, Lake, LSP, Probe, native execution, model, fixture, or counter was invoked. Remote verification and parent acceptance remain pending.

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
source-reviewed draft until the root-owned remote strict Lean check passes on these bytes.
