# Actual numeric binary templates

`Cryptids/Chess/Compilation/Templates.lean` instantiates the verified direct block
compiler for every row of the independently verified 4,042-state shared Runtime
snapshot. Public names are in `Chess.Compilation.Templates`.

The module provides actual executable finite control and all-input proofs. It does not
evaluate the chess program, construct the final Post graph, or complete the M6 export
and challenge gates.

## Executable data

`primitiveRows` is an explicit balanced tree of only `SharedModel.rowNNNN` primitive
statements. It contains no paired raw source witnesses. `primitiveMachine` performs a
balanced numeric lookup. The proof-only `projectRows`, `primitiveRows_project`, and
`primitiveMachine_eq` connect this independent literal table to `SharedModel.machine`.
The executable table is not defined by projecting `SharedModel.entries`.

The literal numeric classification data is separate from proof records:

| Family | Count | Ordered PC getter | PC-to-index getter |
| --- | ---: | --- | --- |
| Write | 270 | `writePC` | `writeIndex` |
| Read: write/load/branch | 1,734 | `readPC` | `readIndex` |
| Move | 1,188 | `movePC` | `moveIndex` |

Each order is ascending source PC. `writeTarget` and `writeNext` retain the exact saved
continuation of each write. In this normalized snapshot all write continuations are
constant gotos. Site zero is PC 278 with target 277; site 269 is PC 2059 with target
2057. Read endpoints are 4 and 4041; move endpoints are 277 and 4040.

`writeData`, `readData`, `moveData` and their `*IndexRows` trees contain bounded numeric
data only. `readPCs`, `readIndexes`, `movePCs`, and `moveIndexes` expose the small
`Vector.ofFn` views needed by the first-order graph interface. Their `*_get` lemmas
identify every vector element with the certified getter.

The common structural predicate `AllAt` and theorem `allAt_lookup` certify indexed
literal trees. Shared bounded block proofs check the complete data, rather than run a
global hash or first-occurrence computation. In particular:

- `write_lookup`, `read_lookup`, and `move_lookup` check PC/index roundtrips;
- each `*_inverse` checks a successful index points to that exact source PC;
- each `*_classified` checks its class on every source row, including absence;
- `write_row` checks the exact primitive function and saved continuation;
- `write_covers` checks every write is represented;
- `read_covers` / `move_covers` and `read_member` / `move_member` provide both directions
  for the explicit constructor predicates `IsRead` / `IsMove`.

`writeSites : BinaryTemplates.WriteSites primitiveMachine 270` wraps these independent
data definitions with the proved classification fields. The executable machine does
not refer to that proof record.

## Codecs and target control

`alphabet : Fin 1250 ≃ Symbol` uses the frozen `CodeBackend.symbolRank` and
`symbolUnrank`. The reverse mixed-radix direction is proved arithmetically in
`symbolRank_unrank`; the other direction reuses `symbolUnrank_rank`.

`stores : Fin 5 ≃ Store` uses the frozen store digits: absent, marker, separator, zero,
one. `stores_zero` and `stores_symm_default` prove that digit zero is exactly the
default store. `alphabet_zero` and `alphabet_symm_default` do the same for tape blank.
No function-valued symbol comparison is used by the rank/unrank codec.

`Label := Fin (4042 + 270*1250)` has exactly 341,542 labels (`state_count` and
`state_bound`). It retains all normal PCs and all 337,500 site/glyph writer labels,
including unreachable glyphs. Its arithmetic layout is the verified `BinaryTemplates`
layout: normal PC `q` has numeric value `q`; writer `(i,a)` has value
`4042 + a + 1250*i`.

`normalRow`, `machine`, and `decode` are direct executable templates over the literal
row and numeric codec/site data. `normalRow_template`, `machine_template`, and
`decode_template` separately prove equality with the generic verified compiler.
The normal-row equality checks constructor cases and the optional site classification;
it does not assume an unchecked compiler or inspect a global label index.

`rows` proves the exact statement identity at every target label:

```lean
TM1Number.mapStmt decode (machine q) =
  Block.compilerFree CodeBackend.blockCode primitiveMachine (decode q)
```

`initial` proves label zero decodes to normal source zero. `supports` supplies the full
finite support. `onePrimitive`, `allHeadFree`, and `target_allHeadFree` prove the frozen
source/target control requirements.

## Input and semantics

`eval_dom input` proves both termination directions for every finite shared-symbol input:

```lean
(TM1.eval machine (blockInput CodeBackend.blockCode input)).Dom ↔
  (TM1.eval SharedModel.machine input).Dom
```

`input k values` is exactly
`blockInput CodeBackend.blockCode (TM2to1.trInit k values)`. The final theorem connects
this actual binary machine to the original Runtime for every stack and finite input:

```lean
runtime_eval_dom k values :
  letI : Inhabited PartrecToTM2.Λ' := ⟨Runtime.label .start⟩
  (TM1.eval machine (input k values)).Dom ↔
    (TM2.eval Runtime.machine k values).Dom
```

This composes the generic binary-template theorem, the literal primitive-row identity,
and `SharedCertificate.runtime_eval_dom`. No legality, reachability, termination, or
chess-evaluation premise is added.

## Verification

From the repository root, validate the retained seal and all check results with:

```text
python3 .unlazy/chess-m6/leaf-1.40/verify.py
```

Add `--recheck` to rerun the focused strict build, 25 kernel fixtures, complete native
fixture suite, all-label construction probe, both closure audits, and ten negative
controls. Every subprocess has a 60-second cap; direct Lean checks use `-M8192`.
Completed-process RSS is recorded in bytes and must stay below 8 GiB. The checker
verifies source hashes and exact generator reproducibility before and after checks.
It performs no aggregate build, gate approval, git action, or chess evaluation.

The full module audit covers all 1,286 safe declarations and 27,231 transitive
dependencies, including types, values, inductive declarations, and recursor rules.
Only `propext`, `Classical.choice`, and `Quot.sound` occur. There are no proof generators
in the Lean module. Two Lean-generated recursion artifacts for `AllAt` and
`projectRows` are inventoried after checking their safe owners and matching types;
neither appears in a safe mathematical root's closure.

A separate image audit checks 16 computational roots and 8,144 dependencies. It rejects
raw decoder witnesses, the paired `SharedModel.entries`, old control compilers,
`SharedCertificate`, `RuntimeCertificate`, Runtime control, closed chess Source modules,
`projectRows`, and the `writeSites` proof wrapper. All computational roots pass, with
no excluded compiler artifacts. Standard library meta metadata receives the same
safety and axiom checks, without exemptions.

Kernel fixtures cover every public correspondence API, table endpoints, blank/default
and symbol digits 624/625/1249, and a formal impossibility proof for a corrupted saved
continuation. Native checks inspect all 4,042 source constructors, all 3,192 PC/index
roundtrips, all 1,350 site/store targets, and all 1,255 codec digits. Three paired small
opcode executions compare exact final tape and store using a proved sound Boolean
canonicalization of blank-extended tapes:

| Opcode | Shared steps | Binary steps |
| --- | ---: | ---: |
| 0 | 2,307 | 2,362 |
| 1 | 3,856 | 3,967 |
| 2 | 5,564 | 5,658 |

The initial fixture run completed in 51.71 seconds with 3.61 GB peak RSS. It evaluates
these small opcode packets only.

The construction probe streams all 341,542 target rows, retaining one body at a time.
It reports 58,802,110 normal-row constructors plus 11,475,000 writer-row constructors,
70,277,110 total. Its initial run completed in 35.73 seconds total (31.89 seconds in the
native construction loop), with 3.58 GB peak RSS. This is a measurement of actual
statement construction, not a kernel-certified first-order graph count.

Negative controls reject false write/read/move indices, a shifted codec digit, and a
wrong saved continuation. A full source copy with writeData's first saved target
changed from 277 to 278 is rejected at its local row certificate. Audit controls reject
`sorryAx`, a partial compiler artifact, a raw witness table, and the site proof record.

The batch build checks the complete source with warnings treated as failures. LSP was
also queried; its asynchronous elaboration remained pending with no reported diagnostic.
The final build and closure audit provide the complete verification evidence.
