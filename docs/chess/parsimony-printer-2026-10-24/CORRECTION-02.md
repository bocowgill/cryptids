# Diagnosed correction for the second and final bounded run

The first run, 40136287158 at producer
`9b37cd3a96d3c64f2cee7d30da513df1e5095edb`, failed in 4.323 seconds on the first
zero-only physical fixture. Provenance and complete transition reconstruction
passed. The raw packet printer allocated 13,504 source controls, plus one probe
boundary and one error trap. Native compilation passed in 2.177 seconds. This was
a framing/contract failure, not a memory or time limit. No full startup, complete
replacement adapter, net saving, or Lean certificate was established.

Pinned source inspection explains the obstruction: its epilogue scans left for
a nonzero code marker. A raw all-zero bit string supplies no such marker, and a
payload's trailing ones are also unsuitable cleanup delimiters. The first
fixture's exact head/control was not retained; the second run reproduces that
obstruction under a fixed 10,000-step cap instead of inventing missing evidence.

The correction frames the unchanged exact packet as `1^32 ++ 0 ++ packet ++ 100`.
The runner must check that the exact packet contains no 32 consecutive ones.
The unchanged upstream routines print that framed payload with zero padding.
Three paid controls erase the right sentinel; 32 paid nondestructive scan controls
find the left marker; two paid controls erase it and enter decoder zero; one paid
nonhalting error trap handles otherwise unspecified source transitions. Thus the
new writer pays for 38 controls beyond the framed raw printer. The diagnostic
boundary represents the existing first decoder state and is counted only in the
retained suffix. There is no free additional bridge or hidden control.

The intended boundary is the exact original packet starting at absolute cell 34,
head at 34, with every other tape cell zero. Absolute translation does not change
the relative tape required by the existing decoder. This is an experimental
contract to test, not a theorem established by this document.

The second run uses the original budgets unchanged. Before the full packet probe,
it compares two independently implemented step engines on all 256 eight-bit words
and five wider fixtures. Both check every nonblank cell, exact head, control and
step count. A positive adapter control and real transition mutations exercise
rejection of dirty exterior cells and wrong entry heads. Independent data-target
and data-chain corruptions remain required. Fixture progress and the current
failure's exact tape/head/control are checkpointed before assertions.

The full printer probe remains capped at 500,000,000 ordinary steps and 120
seconds. Incompletion is allowed and must be reported. If it reaches the
boundary, the same exact-tape oracle must pass. No chess solver startup is run.
The runner emits and independently parses every full candidate transition,
checks the retained suffix's checksum and absence of returns to the old writer,
relocates its targets, and counts every new and retained state. Only then may it
report experimental net savings against 769,344. Accepted savings remain zero.

No third run, unchanged retry, resource escalation or certification is authorized
by this pilot. Retain the terminal result and stop for a decision, including if
the corrected adapter fails. The old research goal remains paused.
