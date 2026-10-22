# Active packed-graph campaign

Goal: remove unused graph padding and certify a complete chess machine below
45,065,962 states. Preserve the exact not-drawn halting target. All previous 2,393
tracked files are pinned; keep frozen specification, ROADMAP, toolchain and prior
machines/evidence unchanged. All substantive computation is remote; no outreach.

Branch `codex/chess-openevolve-pilot`, fork `bocowgill/cryptids`.
New sources only: `Cryptids/Compilation/FieldPacking/`,
`Cryptids/Chess/Optimisation/FieldPacked{Layout,}.lean`,
`Cryptids/Semantics/ChessFieldPacked.lean`, `scripts/chess_field_packed/`,
new Lake/workflow configurations and this documentation directory.

Root contract/gates: `.unlazy/chess-field-packed/`. Generic graph, actual layout
and native validators have disjoint workers. Root handles assembly, audit,
verification dispatch, retained evidence and final integration. A fresh full
candidate referee remains to be dispatched after the complete proof is ready.

Current computation checkpoint459244342a08b3347ef87604650ddd81957fee30.
Interface initial run39724650129 passed. Graph39724652002 failed only two
dependent projection simp rewrites; repaired through congrArg of the complete
dependent Slot, rerun39725164233 passed strictly. Layout39724981625 found
dependent transport/simplification and reserved-keyword errors; these are repaired
in subsequent source checkpoints. Machine39725820189 failed on four remaining
transport proofs; machine39726560849 failed only the two append numeric projection
proofs. Inverse numeric preservation through the transport-free forward map fixed
that obstruction. Full run39727069888 passed the entire layout, complete machine,
named halting theorem, arithmetic row correspondence, exact count, native builds,
focused graph/layout/machine rechecks and safe foundation audit. It then failed
at the deliberately false BadPadding contract because evaluating an address hit
Lean's default recursion limit. The negative contract is repaired to rewrite the
accepted exact node-count theorem before rejecting the old padded count. Native
execution, fixtures, regressions, independent counts and full acceptance remain.
Official development packets are retained under `evidence/history/`.

The first focused graph/interface verifier accidentally read the older570-file
manifest; this was corrected before the layout checkpoint to the new2393-file
manifest. Initial component passes cannot establish the final frozen/full scope.

The complete candidate uses the unchanged1837940-bit input and3675880-state paid
initializer. Lean has checked106668meaningful nodes,533341Post controls,
1066682binary body controls and4742562total controls, together with the original
not-drawn halting equivalence. Full acceptance still requires the independent
complete native checks, regressions and sealed evidence replay.

Native validator streams every actual body row with both symbols to
`body-rows.jsonl`, compares actual/rowMachine, replays the full initializer and
exports actual syntax/slot maps. Python independently reconstructs ordered prefix
packing, checks the entire body and all source cases, and tests11corruptions.
The machine proof phase keeps `machine.json`; native data use `machine-export.json`.

Local-safe metadata only:
```sh
python3 scripts/chess_field_packed/verify.py --metadata
```
Do not run Lean, Lake, LSP, LeanProbe, native code, generators, machine simulations
or counting locally. Root alone pushes/dispatches remote immutable checkpoints.
The user authorized completing this full reduction; do not stop at components.
