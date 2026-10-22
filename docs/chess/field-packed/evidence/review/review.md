# Independent complete-candidate advisory

Verdict: **correct**, on the exact source and retained remote evidence identified below. No fatal source error or missing acceptance premise was found. The smallest repair hint is therefore none. This is an **independent-model-advisory**, with `formal_verification_by_reviewer: false`, `human_approval: false`, and `local_heavy_computation: false`.

The reviewed claim is the explicit two-symbol blank-tape `ConjectureMachines.Machines.chess_field_packed : Machine 4742562 2` and `ConjectureMachines.Semantics.ChessFieldPacked.halts_iff_not_draw`. Its conclusion is exactly halting iff `¬(Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss)`. It is halting-equivalent to the frozen 45,065,962-state `Chess.Optimisation.FieldAware.machine`. Every actual original source syntax node is preserved, every finite control and the literal input is paid, and the packed graph has no padding nodes. The candidate numeral was checked against the supplied universal source/count proofs and independent saved remote count receipt; it was not used as proof of itself.

The accepted evidence is [official run 39727629533](https://github.com/bocowgill/cryptids/actions/runs/39727629533), [job 119655100195](https://github.com/bocowgill/cryptids/actions/runs/39727629533/job/119655100195), at computation commit `7c43454a01201ea122f9769ec751c0582aacc692`, repository `bocowgill/cryptids`, branch `codex/chess-openevolve-pilot`, workflow `.github/workflows/chess_field_packed.yml`. The saved API run, job, artifact, and required verification-step dispositions all say completed/success. Artifact 12403802854 has SHA-256 `c36d1aab1d497da3a60e9f53b0c4e9d69f708058ff9e505cb1d6bd8f619abb5a` and 10,095,894 bytes. The checker binds the saved API metadata and URLs, ZIP digest/size, every member's CRC/size/digest, all exact unpacked bytes, and the logs. This provenance assessment uses the retained official API packet; the reviewer did not contact a service or rerun a remote job.

## Source fidelity and first nonroutine implication

`FieldPacking.Interface` defines the actual-slot type as the dependent sum over every source label of its syntax-size finite type. `Layout` requires an equivalence with the whole numeric allocation, together with strict within-row order. This supplies total coverage in both directions and injectivity without any reachability or padding alternative.

`FieldPackedLayout.Block.single` allocates exactly the leaf weight. `Block.append` combines row slots and numeric addresses through disjoint finite sums. `ofTree` folds the original frozen `Snapshot.entries`, and its `size`, `nodes`, and `offset` lemmas connect the cached balanced functions to complete source lookup and ordinary prefix sums. `sourceSlots` transports only finite bounds, retaining each row and local numeric value. `layout`, `code_val`, `complete`, and `unique` therefore certify every slot in the exact 106,668-node allocation. `packed_nodes` is kernel reduction of the frozen complete lowered syntax, not a native assertion or generated table accepted without proof.

The first nonroutine semantic implication is `FieldPacking.Graph.graphNode_meaning` followed by `decode_node` (lines 96–145). Global lookup decodes the bijection to one original local node, and `mapNode` renames only syntax-child addresses. Source-label goto tables are retained. The local `nodeAt_meaning` equation is transported through the same equivalence. Child descent follows from local postorder descent and `Layout.ordered`, so well-founded induction proves the exact interpretation at every numeric node. Entry decoding is the original row root. `machine_eq` consequently covers all original source rows, including any unreachable row and all actual subnodes.

This is a preservation argument about complete supplied syntax. It does not rely on the selected fixtures, a finite chess exploration, or a claimed value of the open chess proposition. The generic `graph_stateCount` describes the unquotiented GraphPost representation; the actual final construction explicitly uses the frozen CompactPost quotient and its paid count.

## Complete theorem and state accounting

`FieldPacked.lean:20–35` retains `FieldAware.syntaxRows` verbatim and identifies the new getter with `targetProgram Snapshot.program`. Lines 60–75 compose the frozen CompactPost and LazyGraph equivalences, universal field lowering, literal source-snapshot identity, shared-runtime certificate, and chess-tape equivalence. The conclusion is exactly the original conjunction's negation, with neither a draw assumption nor a one-direction simulation premise.

Lines 48–56 retain the original source input, cell encoding and bit order. Lines 77–110 wrap the actual binary body in `FlatInit.initialise`; `initialises` gives the full paid run from state zero and all-blank tape to the exact bit string at the restored original head. `Machines.lean` defines that initial configuration as state zero with `Tape.mk₁ []`. The frozen FlatInit theorem covers both halting directions after this finite prefix, and the frozen cast theorem transports the exact machine type. `Semantics/ChessFieldPacked.lean` exports the requested machine and theorem names without changing their statement.

The universal arithmetic row equalities `binaryRows_eq`, `paidRows_eq`, and `FieldPacked.rowMachine_eq` include every control and both scanned bits, including missing transitions. Main and bounce states are both paid. A halted CompactPost store is deliberately merged into one observable halt control by the frozen quotient; its binary bounce control remains allocated and has a transition on both bits.

The saved remote count receipt and kernel source agree on the complete allocation:

| Component | States/nodes |
|---|---:|
| Every actual syntax node; zero graph padding | 106,668 |
| Every live node at all five stores | 533,340 |
| Shared halt control | 1 |
| Complete CompactPost controls | 533,341 |
| Binary main controls | 533,341 |
| Binary bounce controls | 533,341 |
| Complete binary body | 1,066,682 |
| Literal input write controls | 1,837,940 |
| Head-restoration controls | 1,837,940 |
| Complete paid initializer | 3,675,880 |
| Blank-tape binary machine | 4,742,562 |
| Saving relative to frozen FieldAware | 40,323,400 |

No dispatch helper, source continuation, hidden stack/store state, input bit, or head-restoration action is omitted from the machine's finite control ranges. Tables are finite transition data, not an external oracle.

## Remote evidence and controls

The official packet contains exactly nine passed phases: graph, layout, machine, contracts, native, fixtures, regressions, counts, and full. Its 30 unique standalone command receipts match their embedded phase receipts, exact argv, working directory, shell mode, expected exit, configured timeout, no-timeout status, output SHA-256, and success or expected-failure token. The strict `lake --wfail` complete target builds the final named theorem, audit executable, and exporter. Focused graph/layout/machine builds repeat on the same source. The computation manifest and all 2,393 frozen file pins match this checkout; the repository import closure is covered by those manifests.

The closure audit reports 9,007 foundation roots and 56,666 dependencies, only `propext`, `Classical.choice`, and `Quot.sound`, no generator roots among safe roots, and only the specifically classified safe-owner compiler recursion artifacts outside those roots. Its three deliberate failures reject `sorryAx`, the open chess conjecture dependency, and a mathematical dependency on the source-certificate generator. The six false kernel contracts all exit 1 with Lean's mathematical `Tactic decide proved that the proposition ... is false` diagnostic. In particular the corrected BadPadding control rejects `106668 = 4139008`; it does not pass by crashing, failing elaboration, or exceeding recursion limits.

The actual native payload is `machine-export.json`; `machine.json` is the focused machine phase receipt. They are distinct files with different schemas and hashes. The exporter reads both scanned bits of **every actual body state**, compares each row to the universally equal arithmetic Lean machine, and streams them in state/bit order. The saved remote Python oracle independently reconstructs the packed syntax/Post/binary rows and checks the entire stream, exact missing transitions, ordering, and completeness. The stream is retained as 57,122,148 exact bytes, SHA-256 `e6a41fd68a3ae6d435273dfd5d489fce140d837159b128c533bd5ca02ba31f89`. Its remote receipt certifies all 1,066,682 body states and 2,133,364 rows. The local checker hashes those bytes without parsing or recounting rows.

The native payload also retains every actual getter node, every original source operation and syntax row, and both main/bounce bits for every source entry/store. Its 80,866 saved sample records have 80,858 unique state/bit pairs. The complete body stream is the coverage evidence; the samples are additional boundary probes. The four explicit shared-halt receipts cover both bits at main state 3,675,881 (missing transition) and bounce state 4,209,222 (preserve symbol, move left, return to 3,675,881).

The actual initializer runs every one of its 3,675,880 paid transitions, comparing the actual machine with the arithmetic Lean rows. Independent remote input encoding and replay agree on all 1,837,940 bits from 141,380 source cells, body-entry state 3,675,880, original head 0, and blank exterior including the extra visited trailing cell. The saved bit-string SHA-256 is `a537828df795044398b0eb71c0f9091da6a3d2e01511bac338b8581b04fda9fa`.

The source fixtures cover exactly 50 cases at each of the 4,042 original labels: all five stores, both markers, and all five active-field values, for 202,100 cases. Positive cases compare the complete sparse tape, head, store and continuation, including nonblank neighboring cells. The remote receipt contains all nine operation families. Eleven exact corruption controls are rejected: dispatch, store, frame, initializer, undercount, packed_offset, body_write, body_bounce, body_missing_halt, body_order, and body_truncation. The frame mutation is rejected at actual getter/local-syntax mismatch 391; this control is not misreported as having reached a later tape/frame test. The positive source tests do check the full tape/frame.

Accepted prior regressions retain their actual outputs: M2 164 rule assertions; M3 55 assertions; M4 21 evaluation/choice assertions; M5 16 assertions; shared fixtures 12 kernel assertions and three paired executions; M7 34 quotient row corners plus universal-input equivalence; and terminal binary fixtures 30 corners, singleton edge, and all-input theorem. The baseline build includes the prior chess semantics and FieldBranch certificate.

## History, checker scope, and four passes

All seven development packets are retained and bound separately: interface-1, graph-1, graph-2, layout-1, machine-1, machine-2, and full-1. Their exact saved metadata, ZIPs, unpacked bytes and command receipts are checked without relabeling earlier source commits as final acceptance. In particular full-1 at `459244342a08b3347ef87604650ddd81957fee30` compiled the complete candidate and passed the safe audit, but failed the BadPadding control with kernel deep recursion. It remains a failed run. The final source changes only that false-contract proof to rewrite `packed_nodes`; the construction files are unchanged between these two full runs.

Review pass 1 read the target, exact allocation interface, graph, balanced layout, full assembly and frozen semantic/numeric dependencies, locating the first nonroutine implication and checking all domains and boundary cases. Pass 2 reviewed the actual exporter and independent Python recipe, complete-body coverage, full initializer, all source cases and corruption semantics against the saved current packet. Pass 3 attacked the metadata checker for stale sources, ambiguous files, missing phases, receipt tampering, payload/phase conflation, history omission, and portability; it requires a seal, whole claim, exact computation inventory, all frozen pins, all bytes, and all nine phases before acceptance. Pass 4 checked the complete final artifacts and reran positive, six evidence-corruption controls, and copied-directory portability with a clean result.

`check_saved_evidence.py --self-test` first validates the positive sealed packet, then makes six in-memory evidence corruptions (source manifest, archive-entry digest, construction claim, command exit, missing phase, and seal) and requires their intended rejection. It finally copies the sealed folder and runs the same metadata-only checker with explicit `--root` and `--evidence`. Every mode requires the same seal and construction/source binding. This checker does not import project evaluators, invoke Lean/Lake/LSP/LeanProbe, compile native code, execute/simulate a machine or fixture, or derive machine/row counts.

The universal mathematical theorem is supported by the inspected source and retained remote Lean kernel build and safe-closure audit. Finite native and fixture results support only their saved encoded computations. The local seal detects changes relative to this reviewed packet; it is not an independent signature of GitHub, a new kernel proof, a human approval, or a proof of the open chess proposition's truth value.
