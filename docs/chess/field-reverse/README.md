# Shorter paid initializer

The complete binary blank-tape chess machine now has **2,904,623 states**, saving
**1,837,939** from the accepted 4,742,562-state machine. Its initializer costs
1,837,941 states rather than 3,675,880; the complete 1,066,682-state body is fixed.
The original halting equivalence is proved in Lean. This does not decide chess.

The initializer writes the frozen bits in reverse order while moving left, then
pays one final rightward step. Its resulting relative tape is exactly the frozen
body's input, including the blank exterior. The physical head moves to a new
coordinate on the initially blank tape; no original-coordinate restoration is
claimed or required by the formal tape model.

[RESULTS.md](RESULTS.md) records every state, exact proof names and remote checks.
[CONSTRUCTION.md](CONSTRUCTION.md) explains the tape and proof composition.
[RESUME.md](RESUME.md) gives the reproducible handoff.

Remote run [39770155131](https://github.com/bocowgill/cryptids/actions/runs/39770155131)
passed the strict Lean build, foundation audit, complete actual transition export,
independent fixtures, complete initializer replay, negative controls and prior
regressions. The official packet is retained in `evidence/current/` with its exact
computation commit and all command receipts. All 2,550 previous tracked files,
including the frozen specification, body, input and toolchain, remain pinned and
unchanged. Heavy computation stayed remote. Outreach remains on hold.
