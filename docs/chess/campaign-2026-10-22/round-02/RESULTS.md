# Accepted complete seed chess machine

**Accepted full count:998,176 states**, saving **1,413,567** against the previous
2,411,743-state machine. This goal has now saved **1,906,447** states against its
2,904,623-state starting point. The goal remains active; this is a completed
reduction round, not a claim of global minimality or a solution of chess.

Public machine: `ConjectureMachines.Machines.chess_seed`.
Public theorem: `ConjectureMachines.Semantics.ChessSeed.halts_iff_not_draw`.
It states blank-tape halting iff NOT `(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss)`.
The frozen specification, conjecture and accepted earlier machines are unchanged.

| Complete paid region | States |
|---|---:|
| Reverse seed writer, including final turn |424,157|
| Entire expander, including success and failure controls |216|
| Exact-head bridge |1|
| Interpreter main controls |533,341|
| Interpreter return controls |40,461|
| **Total** |**998,176**|

The writer encodes the same141,380source symbols in three-bit records. A universal
Lean proof shows that the actual216-state expander terminates on every finite
valid seed, reverses the symbols into the exact thirteen-bit cell representation,
clears both markers and all temporary data, and restores the exact relative head
and infinite blank exteriors. The paid bridge then enters the unchanged body.
This removes1,413,784writer states while adding216controller states and1bridge.
All counts include allocated controls, including the error loop and both halting
rows. No free preloaded tape, dispatcher, decoder or return mechanism is assumed.

## Reproducible verification

Successful official remote [run39797909133](https://github.com/bocowgill/cryptids/actions/runs/39797909133),
session iteration4, checked computation
`780ad59e871a47d76726a5c81800af3e48bda188` under workflow
`7e32af8294ca8052c88852518508c0e6ecd5bcf4`.
The official packet is `evidence/final/`, artifact12433769822.

Its20unique commands cover strict Lean builds; the full public theorem and exact
count;9,865audit roots and59,707dependencies with only`propext`,`Classical.choice`
and`Quot.sound`;3audit rejection controls;5false count contracts; complete native
and independent full-row/input checks; andM2–M7/shared/terminal regressions.

All **1,996,352actual rows** were exported and independently reconstructed. The
row stream occupies11,978,112bytes, SHA-256
`95a19bb9e00de6f9efba103966f82971397df4aa1b1874684cb101a13202739d`.
The full424,157-step writer was replayed. All88complete small blank-startup
fixtures,465translated controller fixtures,nineinvalid-code cases and34targeted
corruption controls passed. Full static identity covers every original target bit.

The complete chess seed expansion is quadratic and was deliberately not executed
step by step. Universal Lean termination/tape proofs plus full static input
identity justify that path; small fixtures are supplemental regression evidence.

Fresh complete independent model advisory passed in `review/REPORT.md` and
`review/report.json`. Its one evidence-binding finding was repaired: the advisory
must bind the exact metadata checker bytes, independently of the parent seal.
No unresolved review finding remains. This advisory is not human approval or
formal verification performed independently by its reviewer.

Parent `review/seal.json` binds exact reviewed source, checker, official packet,
APIs and narrative. Positive metadata replay and all **45hostile metadata controls**
passed, as did copied-checker/copied-seal replay from a different directory.
Receipts and outputs are retained under`review/`. The checker only hashes and
checks saved evidence; it does not execute Lean or recount the machine locally.

```sh
python3 scripts/chess_seed_20261022/check_saved_evidence.py --root . --evidence docs/chess/campaign-2026-10-22/round-02/evidence/final --seal docs/chess/campaign-2026-10-22/round-02/review/seal.json --self-test
```

The artifact ZIP SHA is
`1c0319a46228c43590472718fc727a5d43a8d7cee1e749457d0f979c266fc9c1`.
The exact checker SHA is
`5e148cacf6a852cc899eaf1fff3e6fb7ad5d5f4451e1fbe53e982a7461465557`.
Saved APIs and the external seal are provenance trust anchors, not independently
authenticated GitHub attestations. Earlier failed attempts remain retained.

## Next large reduction

The remote finite body quotient has114,487states, a measured prospective saving
of459,315. With this accepted seed, its candidate full total is538,861. It has no
complete Lean quotient certificate yet. The bounded remote certificate pilot
tests full data loading and64/512/4096representative old-state proofs before
committing to all rows. See the live campaign state-count/ranking document.
All further Lean, execution, generation, simulation and counting remain remote.
No outreach has occurred.
