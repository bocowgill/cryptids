import PacketBatch30
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk240 :
    eval 1 (decode packetChars240).reverse = some 0 := by
  decide +kernel

theorem scan_chunk241 :
    eval 0 (decode packetChars241).reverse = some 1 := by
  decide +kernel

theorem scan_chunk242 :
    eval 0 (decode packetChars242).reverse = some 0 := by
  decide +kernel

theorem scan_chunk243 :
    eval 1 (decode packetChars243).reverse = some 0 := by
  decide +kernel

theorem scan_chunk244 :
    eval 0 (decode packetChars244).reverse = some 1 := by
  decide +kernel

theorem scan_chunk245 :
    eval 1 (decode packetChars245).reverse = some 0 := by
  decide +kernel

theorem scan_chunk246 :
    eval 1 (decode packetChars246).reverse = some 1 := by
  decide +kernel

theorem scan_chunk247 :
    eval 0 (decode packetChars247).reverse = some 1 := by
  decide +kernel

attribute [local irreducible] packetChars240 packetChars241 packetChars242 packetChars243
    packetChars244 packetChars245 packetChars246 packetChars247

theorem scan_part30 :
    eval 0 (decode payloadPart30).reverse = some 0 := by
  simp only [payloadPart30, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk247, scan_chunk246, scan_chunk245, scan_chunk244,
    scan_chunk243, scan_chunk242, scan_chunk241, scan_chunk240, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part30
