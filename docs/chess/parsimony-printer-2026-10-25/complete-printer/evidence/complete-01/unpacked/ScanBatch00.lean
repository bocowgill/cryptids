import PacketBatch00
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk0 :
    eval 0 (decode packetChars0).reverse = some 0 := by
  decide +kernel

theorem scan_chunk1 :
    eval 0 (decode packetChars1).reverse = some 0 := by
  decide +kernel

theorem scan_chunk2 :
    eval 1 (decode packetChars2).reverse = some 0 := by
  decide +kernel

theorem scan_chunk3 :
    eval 0 (decode packetChars3).reverse = some 1 := by
  decide +kernel

theorem scan_chunk4 :
    eval 0 (decode packetChars4).reverse = some 0 := by
  decide +kernel

theorem scan_chunk5 :
    eval 0 (decode packetChars5).reverse = some 0 := by
  decide +kernel

theorem scan_chunk6 :
    eval 5 (decode packetChars6).reverse = some 0 := by
  decide +kernel

theorem scan_chunk7 :
    eval 1 (decode packetChars7).reverse = some 5 := by
  decide +kernel

attribute [local irreducible] packetChars0 packetChars1 packetChars2 packetChars3 packetChars4
    packetChars5 packetChars6 packetChars7

theorem scan_part0 :
    eval 1 (decode payloadPart0).reverse = some 0 := by
  simp only [payloadPart0, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk7, scan_chunk6, scan_chunk5, scan_chunk4, scan_chunk3,
    scan_chunk2, scan_chunk1, scan_chunk0, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part0
