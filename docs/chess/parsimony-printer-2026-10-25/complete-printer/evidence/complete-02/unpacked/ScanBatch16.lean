import PacketBatch16
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk128 :
    eval 3 (decode packetChars128).reverse = some 0 := by
  decide +kernel

theorem scan_chunk129 :
    eval 0 (decode packetChars129).reverse = some 3 := by
  decide +kernel

theorem scan_chunk130 :
    eval 1 (decode packetChars130).reverse = some 0 := by
  decide +kernel

theorem scan_chunk131 :
    eval 2 (decode packetChars131).reverse = some 1 := by
  decide +kernel

theorem scan_chunk132 :
    eval 2 (decode packetChars132).reverse = some 2 := by
  decide +kernel

theorem scan_chunk133 :
    eval 0 (decode packetChars133).reverse = some 2 := by
  decide +kernel

theorem scan_chunk134 :
    eval 0 (decode packetChars134).reverse = some 0 := by
  decide +kernel

theorem scan_chunk135 :
    eval 1 (decode packetChars135).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars128 packetChars129 packetChars130 packetChars131
    packetChars132 packetChars133 packetChars134 packetChars135

theorem scan_part16 :
    eval 1 (decode payloadPart16).reverse = some 0 := by
  simp only [payloadPart16, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk135, scan_chunk134, scan_chunk133, scan_chunk132,
    scan_chunk131, scan_chunk130, scan_chunk129, scan_chunk128, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part16
