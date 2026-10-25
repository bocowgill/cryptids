import PacketBatch51
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk408 :
    eval 3 (decode packetChars408).reverse = some 0 := by
  decide +kernel

theorem scan_chunk409 :
    eval 0 (decode packetChars409).reverse = some 3 := by
  decide +kernel

theorem scan_chunk410 :
    eval 0 (decode packetChars410).reverse = some 0 := by
  decide +kernel

theorem scan_chunk411 :
    eval 0 (decode packetChars411).reverse = some 0 := by
  decide +kernel

theorem scan_chunk412 :
    eval 0 (decode packetChars412).reverse = some 0 := by
  decide +kernel

theorem scan_chunk413 :
    eval 0 (decode packetChars413).reverse = some 0 := by
  decide +kernel

theorem scan_chunk414 :
    eval 0 (decode packetChars414).reverse = some 0 := by
  decide +kernel

theorem scan_chunk415 :
    eval 0 (decode packetChars415).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars408 packetChars409 packetChars410 packetChars411
    packetChars412 packetChars413 packetChars414 packetChars415

theorem scan_part51 :
    eval 0 (decode payloadPart51).reverse = some 0 := by
  simp only [payloadPart51, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk415, scan_chunk414, scan_chunk413, scan_chunk412,
    scan_chunk411, scan_chunk410, scan_chunk409, scan_chunk408, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part51
