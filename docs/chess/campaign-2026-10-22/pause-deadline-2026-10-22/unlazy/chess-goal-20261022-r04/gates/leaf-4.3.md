# Complete chess machine with both paid decoders
OWNS: Cryptids/Chess/Optimisation/FieldTableSeed.lean, Cryptids/Semantics/ChessTableSeed.lean

- [x] G1: New full machine links the universal structured decoder into the unchanged FieldSeed.linked body, with exact old seed tape and both halting directions from blank; original conjecture/frozen sources unchanged.
  EVIDENCE: The kernel-verified complete source instantiates the verified unconditional
  `TableSeed.Correct.packet_reaches` and rewrites `ChessCodec.letters_eq` plus both
  named `bits_toList` identities to the exact `FieldSeed.bits` tape. `linked` uses
  `SeedLink.link TableSeed.machine TableSeed.done FieldSeed.linked`; terminal success,
  whole-tape/head preservation and both halting directions follow through the existing
  `SeedLink.link_haltsOn` and `FieldSeed.linked_halts_input`. The actual paid schedule
  and `ReverseInit.Schedule.initialise_halts` supply blank-start equivalence. The public
  statement preserves the original chess proposition. The strict public-module receipt
  under G3 verifies these exact current sources.
- [x] G2: All writer, decoder, old expander, both bridges and body controls are charged; exact769344 states and228832 saving versus accepted998176, strict reduction and rowMachine equality proved.
  EVIDENCE: Source proofs use certified packet size173641 and generic `counted_schedule`
  for prefix173642; `linked_states` retains the accepted574019-state inner machine and
  adds21682 decoder controls plus one bridge. `generated_states` combines prefix173642
  and linked595702 to769344. `complete_allocation` displays writer173642 +decoder21682
  +bridge1 +oldexpander216 +oldbridge1 +mains533341 +returns40461. Saving228832 and strict
  reduction use the accepted `FieldSeed.generated_states`. `rowLinked` uses
  `FieldSeed.rowLinked`; its equality and `numericImage_congr` give exact `rowMachine_eq`.
  All these declarations passed the strict kernel check recorded under G3. Broader
  full-machine acceptance remains separate.
- [x] G3: Strict remote public module build passes, source hashes and receipts retained; four source review passes complete with no placeholders or new axioms.
  CHECK: CHESS_REMOTE=1 GITHUB_ACTIONS=true python3 scripts/chess_table_seed_20261022/proof_verify.py --target machine
  EXPECT: Structured decoder proof target passed
  EVIDENCE: Source passes1–3 cover exact codec/input fidelity, linker/blank-start halting,
  and complete paid allocation/public row interfaces. Independent fourth source pass
  on both exact files found no actionable defect: the complete tape/head are preserved,
  both halting directions include the blank writer and cast, every listed control is paid,
  and accepted numeric-row equality is retained. It found no hidden semantic premise,
  placeholder, new axiom, or concrete-data normalization route.
  Official remote run `39828692045`, iteration 1 at
  `e40aeef1e377910e1f86fd31c717c18b1729458c`, passed the exact public-module command
  `lake --wfail -f lakefile.chess-table-proof-20261022.toml build Cryptids.Semantics.ChessTableSeed`.
  The command returned exit 0 in 15.027049800999976 seconds, without warnings or timeout;
  FieldTableSeed built in 7.4 seconds and ChessTableSeed in 2.3 seconds.
  Inspected receipt:
  `docs/chess/campaign-2026-10-22/round-04/evidence/machine-proof-final/unpacked/commands/1792692639229806801.json`.
  Output SHA256: `1480eec415471fb8e358ccce40165c14404dc90353204aa0e526524fdd4a0f7b`.
  Current source hashes match the retained `source-manifest.json` exactly:
  `Cryptids/Chess/Optimisation/FieldTableSeed.lean`:
  `4fab85087a2f96f37c82e2356e4048eaf2ac66d5f30ccda686ee679a78fea075`;
  `Cryptids/Semantics/ChessTableSeed.lean`:
  `d3e7553c61d170f7422da47315e252eff4134d51f83970c45716e1bfa3d03b88`.
  The retained `session-result.json` independently records target `machine` and exit 0;
  `machine.json` reports status `passed` and `new_accepted_machine: false`.
  Both Lean sources remain fixed after this metadata check. No local Lean, LSP, Probe,
  build, generator, model, count or tests were executed. The parent's broader axiom
  audit, native verification and full acceptance gates remain separate.

Leaf ledger: 3 met, 0 unmet, 0 abandoned. The complete construction, exact allocation,
row equality and public chess equivalence are kernel-verified; broader acceptance remains
pending the parent's remaining gates.
