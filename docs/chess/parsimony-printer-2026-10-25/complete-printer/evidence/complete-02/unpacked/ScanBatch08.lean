import PacketBatch08
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk64 :
    eval 0 (decode packetChars64).reverse = some 3 := by
  decide +kernel

theorem scan_chunk65 :
    eval 0 (decode packetChars65).reverse = some 0 := by
  decide +kernel

theorem scan_chunk66 :
    eval 2 (decode packetChars66).reverse = some 0 := by
  decide +kernel

theorem scan_chunk67 :
    eval 0 (decode packetChars67).reverse = some 2 := by
  decide +kernel

theorem scan_chunk68 :
    eval 1 (decode packetChars68).reverse = some 0 := by
  decide +kernel

theorem scan_chunk69 :
    eval 1 (decode packetChars69).reverse = some 1 := by
  decide +kernel

theorem scan_chunk70 :
    eval 0 (decode packetChars70).reverse = some 1 := by
  decide +kernel

theorem scan_chunk71 :
    eval 0 (decode packetChars71).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars64 packetChars65 packetChars66 packetChars67
    packetChars68 packetChars69 packetChars70 packetChars71

theorem scan_part8 :
    eval 0 (decode payloadPart8).reverse = some 3 := by
  simp only [payloadPart8, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk71, scan_chunk70, scan_chunk69, scan_chunk68, scan_chunk67,
    scan_chunk66, scan_chunk65, scan_chunk64, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part8
