import Identity

open ParsimonyComposed
open ConjectureMachines.Compilation

theorem packet_first_control : (Parsimony.Packet.render 13 (numeric sub0)).head? =
    some '0' := by
  rw [packet_chunk0]
  decide +kernel

#print axioms packet_first_control
