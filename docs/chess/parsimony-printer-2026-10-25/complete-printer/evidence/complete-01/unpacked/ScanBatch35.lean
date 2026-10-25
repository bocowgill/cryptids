import PacketBatch35
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk280 :
    eval 0 (decode packetChars280).reverse = some 0 := by
  decide +kernel

theorem scan_chunk281 :
    eval 0 (decode packetChars281).reverse = some 0 := by
  decide +kernel

theorem scan_chunk282 :
    eval 1 (decode packetChars282).reverse = some 0 := by
  decide +kernel

theorem scan_chunk283 :
    eval 1 (decode packetChars283).reverse = some 1 := by
  decide +kernel

theorem scan_chunk284 :
    eval 3 (decode packetChars284).reverse = some 1 := by
  decide +kernel

theorem scan_chunk285 :
    eval 1 (decode packetChars285).reverse = some 3 := by
  decide +kernel

theorem scan_chunk286 :
    eval 1 (decode packetChars286).reverse = some 1 := by
  decide +kernel

theorem scan_chunk287 :
    eval 2 (decode packetChars287).reverse = some 1 := by
  decide +kernel

attribute [local irreducible] packetChars280 packetChars281 packetChars282 packetChars283
    packetChars284 packetChars285 packetChars286 packetChars287

theorem scan_part35 :
    eval 2 (decode payloadPart35).reverse = some 0 := by
  simp only [payloadPart35, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk287, scan_chunk286, scan_chunk285, scan_chunk284,
    scan_chunk283, scan_chunk282, scan_chunk281, scan_chunk280, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part35
