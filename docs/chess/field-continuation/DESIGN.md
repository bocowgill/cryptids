# Return through the actual main-pop continuation

Connect the frozen FieldReturn primitive (SharedModel.stack0629) through its
actual normal2 body, RuntimeModel.s004: pop the main stack, scanning to its end,
loading its previous symbol, clearing that coordinate, then reaching ret s003.
The boundary includes the pop work. Subsequent execution of ret s003 is outside
this composed path. This remains a module of the interpreter, not a new full
blank-tape chess machine or a full-machine state saving.

Reuse the accepted245-state return loop without editing it. Patch its five
terminal ports into live right-move connectors and one shared left-move dispatch
control. The five incoming store paths merge only after the first return: the
actual pop overwrites the store independently of its old value. All such movement
and dispatch controls are present in the numeric table. No external store or
return register implements a transfer.

The new control uses the frozen field routines: scan read39, advance14,
marker read37, retreat14, previous-symbol read39, and five clear-field instances
of5 states each. Every intermediate terminal port performs an explicit right
move to a charged left-move gate before resuming at the next component. Acyclic
Routine execution and the cyclic return prefix are lifted into the composed
machine with a proof that agrees on every defined source transition; patched
terminal rows are excluded only from that prefix, then explicitly executed.

Construction inventory (to be checked remotely): return245; normal connector1;
scan39+2 gates; advance14+1 gate; marker37+2 gates; retreat14+1 gate;
previous read39+5 store gates; clear instances25 including5 final ports. Total425.
The five output ports denote ret s003 with the loaded store, including absence.
The intermediate return ports are live and cannot terminate the composed path.

Universal contracts cover arbitrary representable symbol tapes, finite return
paths and finite main-stack scans. A pop at a marked absent cell loads absence
without modifying the tape. At an unmarked absent cell, it moves left, loads the
main coordinate and clears exactly that coordinate. All other fields and markers
are preserved, including every cell outside the addressed coordinate. The actual
TM1 operational path and the numeric binary execution must end in corresponding
successor configurations.

Heavy work runs only in the focused remote workflow. Acceptance includes strict
Lean compilation, a native safe-closure audit, false-contract controls, native
row export, independent transition replay including empty and nonempty pops,
all five stores and surrounding fields, complete state accounting, retained
failures, and a fresh-context advisory source/evidence review.
