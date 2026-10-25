import PacketBatch52
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk416 :
    eval 0 (decode packetChars416).reverse = some 0 := by
  decide +kernel

theorem scan_chunk417 :
    eval 0 (decode packetChars417).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars416 packetChars417

theorem scan_part52 :
    eval 0 (decode payloadPart52).reverse = some 0 := by
  simp only [payloadPart52, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk417, scan_chunk416, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part52
