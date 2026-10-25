import PacketBatch15
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk120 :
    eval 0 (decode packetChars120).reverse = some 1 := by
  decide +kernel

theorem scan_chunk121 :
    eval 0 (decode packetChars121).reverse = some 0 := by
  decide +kernel

theorem scan_chunk122 :
    eval 0 (decode packetChars122).reverse = some 0 := by
  decide +kernel

theorem scan_chunk123 :
    eval 0 (decode packetChars123).reverse = some 0 := by
  decide +kernel

theorem scan_chunk124 :
    eval 0 (decode packetChars124).reverse = some 0 := by
  decide +kernel

theorem scan_chunk125 :
    eval 0 (decode packetChars125).reverse = some 0 := by
  decide +kernel

theorem scan_chunk126 :
    eval 0 (decode packetChars126).reverse = some 0 := by
  decide +kernel

theorem scan_chunk127 :
    eval 0 (decode packetChars127).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars120 packetChars121 packetChars122 packetChars123
    packetChars124 packetChars125 packetChars126 packetChars127

theorem scan_part15 :
    eval 0 (decode payloadPart15).reverse = some 1 := by
  simp only [payloadPart15, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk127, scan_chunk126, scan_chunk125, scan_chunk124,
    scan_chunk123, scan_chunk122, scan_chunk121, scan_chunk120, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part15
