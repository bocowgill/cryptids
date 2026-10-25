import PacketBatch48
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk384 :
    eval 0 (decode packetChars384).reverse = some 0 := by
  decide +kernel

theorem scan_chunk385 :
    eval 0 (decode packetChars385).reverse = some 0 := by
  decide +kernel

theorem scan_chunk386 :
    eval 0 (decode packetChars386).reverse = some 0 := by
  decide +kernel

theorem scan_chunk387 :
    eval 2 (decode packetChars387).reverse = some 0 := by
  decide +kernel

theorem scan_chunk388 :
    eval 0 (decode packetChars388).reverse = some 2 := by
  decide +kernel

theorem scan_chunk389 :
    eval 0 (decode packetChars389).reverse = some 0 := by
  decide +kernel

theorem scan_chunk390 :
    eval 2 (decode packetChars390).reverse = some 0 := by
  decide +kernel

theorem scan_chunk391 :
    eval 1 (decode packetChars391).reverse = some 2 := by
  decide +kernel

attribute [local irreducible] packetChars384 packetChars385 packetChars386 packetChars387
    packetChars388 packetChars389 packetChars390 packetChars391

theorem scan_part48 :
    eval 1 (decode payloadPart48).reverse = some 0 := by
  simp only [payloadPart48, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk391, scan_chunk390, scan_chunk389, scan_chunk388,
    scan_chunk387, scan_chunk386, scan_chunk385, scan_chunk384, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part48
