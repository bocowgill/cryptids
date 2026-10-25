import PacketBatch37
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk296 :
    eval 0 (decode packetChars296).reverse = some 0 := by
  decide +kernel

theorem scan_chunk297 :
    eval 1 (decode packetChars297).reverse = some 0 := by
  decide +kernel

theorem scan_chunk298 :
    eval 2 (decode packetChars298).reverse = some 1 := by
  decide +kernel

theorem scan_chunk299 :
    eval 0 (decode packetChars299).reverse = some 2 := by
  decide +kernel

theorem scan_chunk300 :
    eval 0 (decode packetChars300).reverse = some 0 := by
  decide +kernel

theorem scan_chunk301 :
    eval 1 (decode packetChars301).reverse = some 0 := by
  decide +kernel

theorem scan_chunk302 :
    eval 0 (decode packetChars302).reverse = some 1 := by
  decide +kernel

theorem scan_chunk303 :
    eval 0 (decode packetChars303).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars296 packetChars297 packetChars298 packetChars299
    packetChars300 packetChars301 packetChars302 packetChars303

theorem scan_part37 :
    eval 0 (decode payloadPart37).reverse = some 0 := by
  simp only [payloadPart37, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk303, scan_chunk302, scan_chunk301, scan_chunk300,
    scan_chunk299, scan_chunk298, scan_chunk297, scan_chunk296, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part37
