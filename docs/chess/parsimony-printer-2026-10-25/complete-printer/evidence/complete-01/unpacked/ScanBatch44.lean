import PacketBatch44
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk352 :
    eval 0 (decode packetChars352).reverse = some 0 := by
  decide +kernel

theorem scan_chunk353 :
    eval 0 (decode packetChars353).reverse = some 0 := by
  decide +kernel

theorem scan_chunk354 :
    eval 5 (decode packetChars354).reverse = some 0 := by
  decide +kernel

theorem scan_chunk355 :
    eval 2 (decode packetChars355).reverse = some 5 := by
  decide +kernel

theorem scan_chunk356 :
    eval 2 (decode packetChars356).reverse = some 2 := by
  decide +kernel

theorem scan_chunk357 :
    eval 0 (decode packetChars357).reverse = some 2 := by
  decide +kernel

theorem scan_chunk358 :
    eval 1 (decode packetChars358).reverse = some 0 := by
  decide +kernel

theorem scan_chunk359 :
    eval 1 (decode packetChars359).reverse = some 1 := by
  decide +kernel

attribute [local irreducible] packetChars352 packetChars353 packetChars354 packetChars355
    packetChars356 packetChars357 packetChars358 packetChars359

theorem scan_part44 :
    eval 1 (decode payloadPart44).reverse = some 0 := by
  simp only [payloadPart44, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk359, scan_chunk358, scan_chunk357, scan_chunk356,
    scan_chunk355, scan_chunk354, scan_chunk353, scan_chunk352, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part44
