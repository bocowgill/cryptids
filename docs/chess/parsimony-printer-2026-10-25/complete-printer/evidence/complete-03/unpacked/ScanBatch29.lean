import PacketBatch29
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk232 :
    eval 0 (decode packetChars232).reverse = some 0 := by
  decide +kernel

theorem scan_chunk233 :
    eval 0 (decode packetChars233).reverse = some 0 := by
  decide +kernel

theorem scan_chunk234 :
    eval 2 (decode packetChars234).reverse = some 0 := by
  decide +kernel

theorem scan_chunk235 :
    eval 0 (decode packetChars235).reverse = some 2 := by
  decide +kernel

theorem scan_chunk236 :
    eval 0 (decode packetChars236).reverse = some 0 := by
  decide +kernel

theorem scan_chunk237 :
    eval 0 (decode packetChars237).reverse = some 0 := by
  decide +kernel

theorem scan_chunk238 :
    eval 0 (decode packetChars238).reverse = some 0 := by
  decide +kernel

theorem scan_chunk239 :
    eval 0 (decode packetChars239).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars232 packetChars233 packetChars234 packetChars235
    packetChars236 packetChars237 packetChars238 packetChars239

theorem scan_part29 :
    eval 0 (decode payloadPart29).reverse = some 0 := by
  simp only [payloadPart29, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk239, scan_chunk238, scan_chunk237, scan_chunk236,
    scan_chunk235, scan_chunk234, scan_chunk233, scan_chunk232, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part29
