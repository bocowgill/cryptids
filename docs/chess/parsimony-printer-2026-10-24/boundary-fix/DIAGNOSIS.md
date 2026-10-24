# Confirmed cause and targeted correction

Remote diagnosis [40138030294](https://github.com/bocowgill/cryptids/actions/runs/40138030294),
producer `d72ac3da4dbf747d35e598a92d165ebc64d09105`, completed successfully in
5.352 driver seconds. The unchanged failing printer was run by independent
Python and native C++ ordinary-step engines. Both returned after exactly 3,725
steps in boundary control 97, head 33, with ones exactly at 34, 36, 37 and 39.
That is precisely payload `01011010` relative to the head, with a blank exterior.

The retained trace locates the framing bits at absolute cells 0 through 31 and
the separator at 32. Cleanup reached `clear-init` at -1, erased the left marker,
then entered the decoder at 33. The original oracle incorrectly placed the first
frame bit at cell 1 and expected head 34. The observed one-cell discrepancy is
therefore a test/metadata origin error for this fixture. No payload damage or
leftover marker was observed. Full fixture coverage remains required.

Correct `packet_start` from `marker_bits + 2` to `marker_bits + 1`. Keep every
emitted transition unchanged. The validation runner will compare its complete
packet-printer table byte for byte by checksum with the retained failed pilot's
table, and retain the same full-tape/exterior/head oracle. Mutated wrong-head and
dirty-exterior controls must still be rejected. The diagnostic continues to
reproduce the historical wrong origin explicitly, so it remains useful after
the metadata correction.

The preceding producer's diagnostic omission is also fixed: the adapter positive
result is now saved before its assertion. Diagnosis retained the complete handoff
trace before every decisive assertion and independently checked the exact native
tape against Python. The frozen chess specification and accepted source pins
passed their remote checks unchanged. Native compilation used sampled peak group
plus driver RSS 114,720,768 bytes; driver peak was 24,144 KiB. No resource limit
was reached or raised.

The next validation has the predeclared 600-second limit. It must pass all
261 physical fixtures and actual transition-corruption controls, reconstruct the
entire exact packet, relocate the retained suffix, check every inverse-relocated
row and suffix checksum, and independently census the full emitted table in both
Python and C++. The native census must reject an invalid target and a truncated
record in actual serialized full tables. The bounded full packet simulation may
remain incomplete; report that explicitly. No Lean certification starts here.
