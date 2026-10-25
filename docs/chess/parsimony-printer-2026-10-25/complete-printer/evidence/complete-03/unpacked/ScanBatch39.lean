import PacketBatch39
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk312 :
    eval 2 (decode packetChars312).reverse = some 2 := by
  decide +kernel

theorem scan_chunk313 :
    eval 0 (decode packetChars313).reverse = some 2 := by
  decide +kernel

theorem scan_chunk314 :
    eval 1 (decode packetChars314).reverse = some 0 := by
  decide +kernel

theorem scan_chunk315 :
    eval 2 (decode packetChars315).reverse = some 1 := by
  decide +kernel

theorem scan_chunk316 :
    eval 0 (decode packetChars316).reverse = some 2 := by
  decide +kernel

theorem scan_chunk317 :
    eval 0 (decode packetChars317).reverse = some 0 := by
  decide +kernel

theorem scan_chunk318 :
    eval 0 (decode packetChars318).reverse = some 0 := by
  decide +kernel

theorem scan_chunk319 :
    eval 1 (decode packetChars319).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars312 packetChars313 packetChars314 packetChars315
    packetChars316 packetChars317 packetChars318 packetChars319

theorem scan_part39 :
    eval 1 (decode payloadPart39).reverse = some 2 := by
  simp only [payloadPart39, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk319, scan_chunk318, scan_chunk317, scan_chunk316,
    scan_chunk315, scan_chunk314, scan_chunk313, scan_chunk312, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part39
