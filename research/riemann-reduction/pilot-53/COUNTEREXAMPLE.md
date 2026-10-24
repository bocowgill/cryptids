# Exact obstruction: skipped-bit encoding does not commute with zero DEC

The direct proof below was initially derived manually after the first job failed
before generation. A separately authorized additional job has now independently
replayed both complete tapes and Lean-checked the exact local counterexample using
the accepted definitions. See [replay-02/RESULT.md](replay-02/RESULT.md) for the
certificate, dependency audit and retained evidence. The original failed run is
preserved separately. This establishes a false local equation, not a new RH theorem
or a nonexistence bound.

## Claim being tested

Write a finite binary word without commas, with the leftmost bit first. Let
B_k(w) mean `(popBreakRev k w.reverse).reverse` from
`Cryptids/Semantics/Riemann120/Backend.lean:2062`. It scans from right to left,
skips the first k zero bits, then replaces the next zero by ONE and discards
everything to its right. When no required zero exists, it returns the empty word.

Let E(w) be the proposed encoding: follow the literal RH95 read-preserving
rightward decoder from state 15 and delete the bit read whenever the old state
is 53. Preserve the other bits in order. A non-parser suffix is left unchanged.
On the concrete words below every inspected transition preserves the bit and
moves right, so that suffix convention is not used.

The pilot requires at least

```text
E(B_1(walked c)) = B_1(E(walked c))
```

for a zero-DEC instruction c. This follows from the proposed reuse of the old
native/return routines with E-encoded control words. We disprove that equation
at the genuine typed control c = `.outside 44`.

## 1. Bind the witness to the accepted typed program

At base `6c28d8524fa008c6fb5aadb759df74a55ce96423`:

| Definition | Value | Source |
| --- | --- | --- |
| `Schema.word (.outside 44)` | `100111011` | ControllerSchema95.lean:89 |
| `Control.walked (.outside 44)` | `1001110110` | ControllerSchema95.lean:210 |
| `Control.instruction (.outside 44)` | `.decnz 0 (.outside 45) (.outside 47)` | ControlStep95.lean:205 |
| `Schema.word (.outside 47)` | `1001111` | ControllerSchema95.lean:92 |

The arrays' first entries are on lines 45 and 166 of ControllerSchema95, and
161 of ControlStep95, respectively; the stated entries are their zero-based
index 44 (or 47). The zero-branch witness uses bank 0 = 0, so k = 1 as in
`Dispatch.root_native`. It is a required typed-frame case, not an invented
invalid caller word. Reachability of this frame from the blank run is not claimed.

## 2. Compute E from actual transition cells

Put P = `100111` and W = `1001110110` = P ++ `0110`.
Reading W from state 15 follows exactly this trace:

| Bit index | State before read | Bit | Literal transition | Next state |
| ---: | ---: | ---: | --- | ---: |
| 0 | 15 | 1 | 1R17 | 17 |
| 1 | 17 | 0 | 0R20 | 20 |
| 2 | 20 | 0 | 0R24 | 24 |
| 3 | 24 | 1 | 1R30 | 30 |
| 4 | 30 | 1 | 1R40 | 40 |
| 5 | 40 | 1 | 1R53 | 53 |
| 6 | 53 | 0 | 0R68 | 68 |
| 7 | 68 | 1 | 1R75 | 75 |
| 8 | 75 | 1 | 1R81 | 81 |
| 9 | 81 | 0 | 0R18 | 18 |

Thus E removes exactly the ZERO at index 6:

```text
E(W) = P ++ 110 = 100111110.
E(Schema.word (.outside 44)) = P ++ 11 = 10011111.
```

State 18 is the native DEC leaf for physical bank 0, by
`Auxiliary95Physical.decLeaf98` and `Physical95.decLeaf` (the projection fixes 18).
After the permitted bypass, the same shortened parser path goes from 40 to old
68 directly, ending at 18; deleting and relabeling 53 changes no branch here.

## 3. Evaluate the two required return words

First calculate the correct old return. W has zeros at indices 1, 2, 6 and 9.
B_1 skips the last zero (index 9), passes the two ONE bits at 8 and 7, and
replaces the zero at 6. It discards indices 7..9. Consequently:

```text
B_1(W) = P ++ 1 = 1001111.
```

When encoding this result, the first six bits P again reach state 53. Its last
bit is now ONE; `53/ONE = 1R68` preserves that bit but E deletes it. Therefore:

```text
E(B_1(W)) = E(P ++ 1) = P = 100111.
```

Now calculate the return after encoding the input. E(W) = `100111110` has zeros
only at indices 1, 2 and 8. B_1 skips the last zero at 8. The next zero is at 2,
so it changes that zero to ONE and discards indices 3..8:

```text
B_1(E(W)) = 101.
```

The words differ: the left side has six bits and the right side has three.
Thus **E(B_1(W)) = 100111 != 101 = B_1(E(W))**. This is an exact refutation of
the required commutation equation. A second way to check the arithmetic is to
take the prefix ending at the second zero from the right and flip its final bit;
the prefixes are `1001110` for W and `100` for E(W), giving the same results.

## 4. Full-frame interpretation and its limits

To specify complete tapes, let F(p,w,b) be `Physical.rootCfg p w b`: root state
15, head at relative coordinate 0, ONE sentinel at -1, control word w, zeros
through position p-1, separator `10` at p,p+1, then unary registers `1^(v+1)0`.
All remaining cells on both sides are ZERO. Choose p = 22 and nine zero banks
b = [0,0,0,0,0,0,0,0,0]. These meet `root_native`'s bank, fill and zero-branch
conditions: 0 < 9 and 3 <= 22 - 10 = 12.

The proposed full-frame encoding removes the one decoder bit and reduces p by
one. Its input is F(21,`10011111`,b). The existing zero-DEC0 scan/pop path uses
states 18,28,0,49,48,62,2,11,5,7,10,12 before returning to 15. None is deleted,
and none is 40, whose ONE edge is the only edited edge. Each of these used cells
is unchanged under dense relabeling. In the zero branch the bank stays b and
the fill is 21 - 9 = 12. There is no exhausted-root padding increment because
k = 1 is below the number of zeros in each walked word (4 old, 3 encoded).
The scanner guards hold: the returned words `1001111` and `101`, with their
single-one sentinel, have no three consecutive zeros in either orientation.

Accordingly the retained native/pop contracts predict these *different* root
frames under this proposed relation:

| Role | Complete root frame |
| --- | --- |
| Old input | F(22,`100111011`,b) |
| E-encoded input | F(21,`10011111`,b) |
| Old zero-DEC result, by the accepted contract | F(22,`1001111`,b) |
| Required E-image of that result | F(21,`100111`,b) |
| Encoded-word return from the unchanged pop routine | F(21,`101`,b) |

For an explicit complete tape description, the old input's ONE support is
{-1,0,3,4,5,7,8,22,24,26,28,30,32,34,36,38,40}.
The encoded input's support is
{-1,0,3,4,5,6,7,21,23,25,27,29,31,33,35,37,39}.
The required encoded output has support
{-1,0,3,4,5,21,23,25,27,29,31,33,35,37,39}; the incompatible return word gives
{-1,0,2,21,23,25,27,29,31,33,35,37,39}. State and relative head are 15 and 0.
These sets were initially manual expansions of F; the additional authorized replay
has now independently confirmed the corresponding full finite tapes.

The disproved equation alone is enough to reject this canonical encoding route.
The word-level counterexample is now Lean-checked; the full-frame discussion is
also supported by the independent finite replay. It does not prove either blank run's
halting behavior, show this frame is blank-reachable, or exclude a more elaborate
encoding. Such alternatives would need a new bounded proposal and proof contract.

## Verdict

The deleted bit is irrelevant to forward dispatch but carries a return delimiter.
Recovering the certified stage proof would require preserving that delimiter's
role in another encoding or changing the return protocol. The fixed pilot allows
neither an additional transition edit nor an extra repair state. Stop this route
at this false equation; do not claim a certified 94-state reduction.
