import PacketBatch22
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk176 :
    eval 0 (decode packetChars176).reverse = some 2 := by
  decide +kernel

theorem scan_chunk177 :
    eval 0 (decode packetChars177).reverse = some 0 := by
  decide +kernel

theorem scan_chunk178 :
    eval 1 (decode packetChars178).reverse = some 0 := by
  decide +kernel

theorem scan_chunk179 :
    eval 0 (decode packetChars179).reverse = some 1 := by
  decide +kernel

theorem scan_chunk180 :
    eval 0 (decode packetChars180).reverse = some 0 := by
  decide +kernel

theorem scan_chunk181 :
    eval 0 (decode packetChars181).reverse = some 0 := by
  decide +kernel

theorem scan_chunk182 :
    eval 0 (decode packetChars182).reverse = some 0 := by
  decide +kernel

theorem scan_chunk183 :
    eval 0 (decode packetChars183).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars176 packetChars177 packetChars178 packetChars179
    packetChars180 packetChars181 packetChars182 packetChars183

theorem scan_part22 :
    eval 0 (decode payloadPart22).reverse = some 2 := by
  simp only [payloadPart22, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk183, scan_chunk182, scan_chunk181, scan_chunk180,
    scan_chunk179, scan_chunk178, scan_chunk177, scan_chunk176, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part22
