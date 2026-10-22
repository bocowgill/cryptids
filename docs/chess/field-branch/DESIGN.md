# ret s003: real return and branch

The accepted return/main-pop path ends at `TM2to1.ret RuntimeModel.s003`.
Its body returns left to the bottom marker, preserving the loaded store and
all tape fields. At the marker, `s003` branches on that store. Values absence,
cons-l and cons dispatch `normal 3`. Bit0 and bit1 dispatch the actual reverse
push `.go .rev (.push (SharedModel.pushFn s002)) s000`. The next push and normal3
bodies are outside this extension. Both outgoing labels are explicit in the
source theorem and final-port decoder, rather than collapsed into one exit.

The new graph retains every one of the old 425 states. Each of its five former
successor ports becomes a right-move connector to a paid left-move gate at
425–429. Gates dispatch the matching store into five return blocks at430–674.
Those blocks copy all245 controls of the accepted return transport. Their five
paid terminal controls encode the actual branch target and unchanged store.
No extra tape register or external dispatch is used. Proposed inventory675;
this is subject to remote kernel/native validation, not an accepted full count.

The same finite ReturnPath predicate already used by the accepted return
supports arbitrary length. Universal source execution, binary return execution
and full tape correspondence are composed with the earlier operational theorem.
The complete path has explicit first-return, main-pop and second-return path
premises. Its source cost is n+m+k+4. Binary cost is the earlier prefix plus two
connector moves and37*k+24. A final relation couples actual successor label,
store, all thirteen field bits at every integer coordinate, and native control.

All substantive builds, proofs, native audits, exports, simulations and counts
run remotely. The frozen specification and accepted source/evidence remain
fixed. Final acceptance also includes an integration assessment identifying what
must change before the full390491642-state machine is actually reduced.
Outreach remains held.
