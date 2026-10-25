import PacketBatch43
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk344 :
    eval 2 (decode packetChars344).reverse = some 1 := by
  decide +kernel

theorem scan_chunk345 :
    eval 0 (decode packetChars345).reverse = some 2 := by
  decide +kernel

theorem scan_chunk346 :
    eval 0 (decode packetChars346).reverse = some 0 := by
  decide +kernel

theorem scan_chunk347 :
    eval 2 (decode packetChars347).reverse = some 0 := by
  decide +kernel

theorem scan_chunk348 :
    eval 3 (decode packetChars348).reverse = some 2 := by
  decide +kernel

theorem scan_chunk349 :
    eval 0 (decode packetChars349).reverse = some 3 := by
  decide +kernel

theorem scan_chunk350 :
    eval 3 (decode packetChars350).reverse = some 0 := by
  decide +kernel

theorem scan_chunk351 :
    eval 0 (decode packetChars351).reverse = some 3 := by
  decide +kernel

attribute [local irreducible] packetChars344 packetChars345 packetChars346 packetChars347
    packetChars348 packetChars349 packetChars350 packetChars351

theorem scan_part43 :
    eval 0 (decode payloadPart43).reverse = some 1 := by
  simp only [payloadPart43, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk351, scan_chunk350, scan_chunk349, scan_chunk348,
    scan_chunk347, scan_chunk346, scan_chunk345, scan_chunk344, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part43
