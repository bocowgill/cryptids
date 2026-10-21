# One field-aware interpreter primitive

Integrate the actual return-to-bottom shuttle at `SharedModel.stack0629`, namely
`TM2to1.Λ'.ret RuntimeModel.s000`. The frozen `s000` transfers to normal label2.
On a cell with its bottom marker set, the primitive transfers to that continuation;
otherwise it moves one source cell left and re-enters the same return label.
The five store values are unchanged. This is a real loop from the accepted interpreter.

The binary encoding maps main/rev/aux/stack to offsets0/3/6/9 and the bottom
marker to bit12. Absence/consₗ/cons/bit0/bit1 map to0/1/2/3/4. The representation
relation covers every integer tape coordinate, including arbitrary neighbouring
cells. All binary transitions preserve the scanned bit. A completed return
must preserve the entire tape, shift its head to the bottom cell and retain store.

Each store has a disjoint49-state block:12 seek-right controls (including its
entry dispatch),1 marker branch,24 controls moving to the preceding cell and
re-entering the loop,11 controls restoring the original boundary after finding
its marker, and1 continuation port. Five stores give245 states. Entry and return
controls are ordinary numeric states; the emitted machine has no external store
or return register. The marker branch also dispatches its successors. Ports are
charged terminal states in this capsule and denote normal label2 with the given
store. Linking that continuation to a later compiled body remains a later task.
No state-count saving for the full chess machine is claimed.

Acceptance requires universal Lean statements for the real source step and an
arbitrarily long finite return path, a safe proof-closure audit, native export and
independent replay of the actual numeric transitions, deliberate negative controls,
and matching source/pin hashes in one successful official remote workflow. The
frozen chess reference, accepted compiler and existing field backend remain fixed.
