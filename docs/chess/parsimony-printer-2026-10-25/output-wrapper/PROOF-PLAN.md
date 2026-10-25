# Output wrapper proof plan

The prior failure was recursion during a concrete `simpa` in Identity.lean:242,
not an invalid packet batch, heap failure or timeout. All 53 independent batch
objects cover 418 chunks and all 13,360 words. They must not be rebuilt.

1. Verify the exact retained global-08 archive digest, object/source pairs,
   original producer, toolchain, manifest and all nine generic source pins.
   Copy the already checked AllWords, GlobalInstance, PacketCommon and 53 batch
   modules into the fresh remote import directory. Do not import failed Identity.
2. Compile `SizedRender.indexed_render_sized`: for an arbitrary array with size
   `count`, rewrite the finite range to its size before applying indexed_render.
   No concrete array is present in this proof.
3. Compile the old successful numeric packet/framing prefix as FrozenPacket.
   Preserve its definitions and theorem statements, with its existing local
   abstraction boundaries. Then compile the unchanged global_bits_identity
   statement, replacing only the problematic `simpa` by the abstract helper.
4. Audit foundation sets, successful object export and exact source provenance.
5. Compile the planned first-framed-bit positive control using packet_chunk0;
   replace its single expected character `1` by `0` and require a false-proposition
   proof failure. The negative artifact is a test, never an accepted proof root.

Every generated file is width/banned-feature checked remotely before cache/build.
No machine, packet, checked batch statement or frozen generic source changes.
The literal-to-file digest check remains an external representation check, not a
kernel parser or a bridge to TableSeed.ChessCodec.bits. No later milestone is
included. The accepted complete-machine count therefore stays 769,344 even if
this wrapper succeeds; 609,247 remains a candidate until the remaining whole
printer/startup/cleanup/linking and both halting directions are certified.
