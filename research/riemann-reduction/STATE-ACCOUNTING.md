# Physical-state accounting

Baseline and exact table hash: see `BASELINE.md`. IDs below are zero-based actual
physical states. Each is charged exactly once by the primary role in this table;
secondary uses are recorded in prose. Counts were derived by manual enumeration
and review, not local executable state counting. They remain an audit ledger,
not a machine-checked partition certificate. The future remote pilot must check
the TSV against the pinned literal table before using it.

| Code | Primary physical role | State IDs | Count |
| --- | --- | --- | ---: |
| D | Root / rightward control decoder | 15-17, 20-21, 24, 26-27, 30, 33-35, 39-40, 44-47, 50-53, 57, 60, 65-68, 75-76, 79-83, 85-94 | 45 |
| L | Arithmetic leaves: fill padding and choose an operation/bank | 1, 18, 23, 29, 31-32, 55-56, 58, 77 | 10 |
| I | Increment bank selection and right-shift core | 3-4, 6, 36-38, 70 | 7 |
| C | Decrement bank selection, test and shift core | 0, 22, 28, 41-42, 49, 54, 63, 72, 78, 84 | 11 |
| R | Shared register returns / branch fence | 8-9, 48, 62 | 4 |
| P | Padding erasure and continuation-pop control | 2, 11 | 2 |
| S | Guarded left scanner and right root recovery | 5, 7, 10, 12 | 4 |
| J | Jump rewrites, entry bounces and return bridges | 13-14, 19, 25, 43, 59, 64, 69, 71, 73-74 | 11 |
| H | HALT terminal, also a decoder extension on ZERO | 61 | 1 |
| | Total, including initialization and all shared controls | | **95** |

The disjoint sum is 45 + 10 + 7 + 11 + 4 + 2 + 4 + 11 + 1 = 95.
`state-ledger.tsv` lists IDs 0 through 94 individually, both literal cells and
their unique charge. No entry for an implicit halt state is added: absent cells
halt directly. There are 190 cells, with 61/ONE the sole absent cell.

## What the attribution means

The leaf mapping follows `Physical95` and `Auxiliary95Physical`:

| Physical bank | Logical register under `ReferenceProgram.perm` | INC leaf | DEC leaf |
| --- | --- | ---: | ---: |
| 0 | x | 1 | 18 |
| 1 | v | 29 | 32 |
| 2 | f | 77 | 56 |
| 3 | m | 23 | 31 |
| 4 | j | 55 | 58 |

INC selection follows the raw proof's chain, transported to actual IDs:
36, 4, 3, 38, 37, 70. State 6 shifts the suffix right. DEC selection uses
0, 28, 22, 42, 54, 41; states 49, 63, 72, 78, 84 test/scan/shift.
These identifications come from `Auxiliary95RawPhysical.unary98_inc`,
`unary98_dec_pos`, `unary98_dec_zero` and `decScanShift98`, with the two label
maps applied. Raw state 0 is actual 36; raw 36 is actual 0.

States 8/9 return INC and positive DEC through register words; 48/62 handle
zero-DEC returns. States 9 and 62 also distinguish the continuation branch and
enter padding/stack popping. States 2/11 implement `popBreakRev` and erase the
temporarily filled padding. The 5/7/10 scanner tracks zero streak lengths 0/1/2;
12 recovers the root after the blank fence. `NoThreeZeros` is a real premise,
not a statement that all tape regions avoid three zeros.

Jump classification follows literal left-turn cells and `RootJump`'s contracts.
It is deliberately a shared pool, not an invented allocation among high-level
arithmetic routines. In particular, 70/ONE also implements a jump; it remains
charged to I because 70/ZERO is part of the INC selection chain. State 61/ZERO
continues decoding toward DEC-f, while 61/ONE halts. State 41 is both the top
DEC selector and a rightward control bridge; its ONE cell is not visited by the
retained initializer check. None of these secondary uses earns another state.

## Initializer accounting and limits

There is no separately supplied initializer table or free preloaded input.
Execution begins at actual state 0, whose ZERO cell writes ONE, moves left and
enters 48. The first straight-line path on blank cells is
0 -> 48 -> 62 -> 2 -> 11 -> 5; all six states are already charged above.
The complete initializer is the same literal machine for all 3,634 steps.
Its complete final tape is covered by `BootCertificate.boot_reaches_initialRoot`.
Thus no initializer states are omitted from the total.

The count of states used *exclusively* before initialization has not been
established by this text audit. No such exclusivity/reachability theorem is
claimed, and no exclusive initializer saving is booked. A runtime visit census
would be remote finite evidence only; proving later unreachability is separate.
Likewise, D is a structural charge, not a claim that every D cell is reached
from every typed control word.

## Three distinct notions of label

1. `ReferenceLogical95.rows` indexes 121 logical rows, 0..120. These are
   register instructions and word encodings. Their Move/Fold/Product/Transform/
   width computations share the physical decoder and five unary leaf pairs.
   Removing a logical instruction does not automatically save a physical state.
2. The typed frontier is `.outside (Fin 97)`, `.entry d`, and `.local d (Fin 22)`
   for arbitrary natural depth d. It describes unbounded caller words, not
   97 + 22 physical states or a finite bound on recursion.
3. `Auxiliary95.machine` has 98 proof-presentation labels. Auxiliary 61, 72, 95
   duplicate actual 0. Canonical actual-to-auxiliary lifting is q, q+1, q+2,
   q+3 on ranges 0..60, 61..70, 71..92, 93..94. `stateMap` sends them back.
   `Auxiliary95Raw` additionally swaps auxiliary 0 and 36. These are derived
   presentations of the literal table, not three removable physical states.

There is no evidence-backed additive split of the 45 decoder states among FOLD,
PRODUCT or WIDTH. The ledger uses the shared pool explicitly instead of assigning
fictional per-routine savings.
