# Indexed runtime lookup with full restoration

`Cryptids/Compilation/RuntimeLookup.lean` proves positive reachability for the actual
fixed `Runtime.machine`, from evaluation through indexed lookup, three-word read,
and complete table restoration to dispatch. No machine instruction or runtime AST was
changed. The main theorem is `RuntimeLookup.lookup_node`:

```lean
lookup_node (rows : Array CodeDAG.Node) (index : Nat) (node : CodeDAG.Node)
  (row : rows[index]? = some node) (tag left right : Nat)
  (words : node.words = [tag, left, right]) (store : Option Γ')
  (values : List Nat) (frames : List Γ') :
  Reaches₁ (TM2.step Runtime.machine)
    (Runtime.dataCfg .evaluate store (index :: values)
      (rows.toList.flatMap CodeDAG.Node.words) frames)
    (Runtime.dataCfg .dispatch none (tag :: values)
      (rows.toList.flatMap CodeDAG.Node.words)
      (trList [left, right] ++ frames))
```

The lookup hypothesis supplies the index bound. No topological validity assumption is
needed for reading a row. The final store is exactly `none`, which is stronger than
merely asserting an unspecified final store. Reverse scratch is empty at both boundaries,
as specified by `dataCfg`. The entire serialized row table is identical at both boundaries.
Values and the arbitrary older frame-symbol suffix are preserved; older frames may themselves
contain markers or malformed data.

## Raw triple theorem

`lookup_triple` is independent of CodeDAG and accepts arbitrary natural words:

```text
index = i, prefixWords.length = 3*i
table = prefixWords ++ [tag, left, right] ++ suffix

evaluate: main = i :: values,   aux = whole table, stack = frames
dispatch: main = tag :: values, aux = whole table, stack = trList [left,right] ++ frames
```

Both the selected triple and every preceding or following table word are retained.
The raw theorem does not restrict tags, operand bounds, values, initial store, or older
frames. The array corollary decomposes `rows.toList` at the selected index and uses the
proved width of three natural words per `Node.words`. The table here is the row-word
payload; startup/header handling is a separate boundary proof.

## Concrete proof path

`evaluate_start` executes the phase jump and marker push. The fresh marker isolates
all temporary lookup data from arbitrary older frame symbols.

`lookup_zero` executes the actual predecessor macro, removes index zero from `main`,
and enters `readRow`. `lookup_successor` decrements a positive index and executes
three `moveWord aux stack` operations before returning to lookup. The words are saved
in reverse word order. `lookup_prefix` inducts on the index, with an exact prefix-length
invariant, to account for every skipped triple.

`read_row` executes the three actual `copyWord aux` operations. Immediately afterward,
`main` contains `right :: left :: tag :: values`; `stack` contains the same three
encoded words above the saved reverse prefix, fresh marker, and older frames. The
remaining table suffix stays on `aux`.

`restore_probe` proves that the `.move true` and `.read` instructions inspect exactly
one stack symbol. For an ordinary encoded word, `restore_word` proves the first symbol
cannot be a marker, restores that symbol with the actual `.push stack id`, and executes
`moveWord stack aux` to put back the whole word. The argument includes zero, whose word
starts with the ordinary natural separator. It uses the proved absence of frame markers
from every `trList` encoding.

`restore_prefix` inducts on all saved words. At the fresh marker, `restore_marker`
consumes that marker and executes the two `moveWord main stack` operations. These save
the operands in the required left/right order and leave only the tag above the old
values. The reverse of the saved row-plus-prefix is exactly the original prefix and
selected row, so appending the untouched suffix reconstructs the whole table.

Every exported execution theorem uses `Reaches₁`, a positive number of actual TM2 steps.
No abstract lookup procedure, replacement transition system, or execution assumption is
used. The specialized word-boundary lemmas instantiate the already verified RuntimeData
and RuntimeMacros procedures.

## Verification and scope

The strict focused build is:

```text
env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Compilation.RuntimeLookup
```

The transitive audit covers RuntimeLookup, Runtime, and RuntimeMacros declarations,
including declaration types and values. Its safe closure contains 201 declarations and
3168 dependencies, with only propext, Classical.choice, and Quot.sound. Three generated
recursion artifacts have checked safe owners and are inventoried outside the safe roots;
dependency traversal still rejects them if encountered. Injected axiom and recursion-artifact
controls test the rejection paths.

Four kernel fixture assertions check the generic raw boundary, a skipped prefix with
trailing suffix, an array containing forward/out-of-range operand IDs, and the requested
existential-store form. Four bounded native fixtures independently execute the actual
TM2 machine and compare every boundary component. They finish in 47, 182, 211, and 105
steps. These computations establish evidence only for those exact test inputs; arbitrary
raw inputs are covered by the kernel-checked induction proofs.

No full backend emission or chess-game-tree evaluation was run. The opcode paths,
continuation paths, VM simulation, startup, blank initialization, and final binary-table
identity remain separate integration obligations. This leaf proves lookup preservation,
not M6 completion. M7 remains unstarted.

Evidence is in `.unlazy/chess-m6/leaf-1.23/`.
