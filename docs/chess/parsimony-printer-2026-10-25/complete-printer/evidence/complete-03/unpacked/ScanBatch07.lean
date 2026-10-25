import PacketBatch07
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk56 :
    eval 1 (decode packetChars56).reverse = some 0 := by
  decide +kernel

theorem scan_chunk57 :
    eval 0 (decode packetChars57).reverse = some 1 := by
  decide +kernel

theorem scan_chunk58 :
    eval 2 (decode packetChars58).reverse = some 0 := by
  decide +kernel

theorem scan_chunk59 :
    eval 0 (decode packetChars59).reverse = some 2 := by
  decide +kernel

theorem scan_chunk60 :
    eval 0 (decode packetChars60).reverse = some 0 := by
  decide +kernel

theorem scan_chunk61 :
    eval 3 (decode packetChars61).reverse = some 0 := by
  decide +kernel

theorem scan_chunk62 :
    eval 0 (decode packetChars62).reverse = some 3 := by
  decide +kernel

theorem scan_chunk63 :
    eval 3 (decode packetChars63).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars56 packetChars57 packetChars58 packetChars59
    packetChars60 packetChars61 packetChars62 packetChars63

theorem scan_part7 :
    eval 3 (decode payloadPart7).reverse = some 0 := by
  simp only [payloadPart7, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk63, scan_chunk62, scan_chunk61, scan_chunk60, scan_chunk59,
    scan_chunk58, scan_chunk57, scan_chunk56, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part7
