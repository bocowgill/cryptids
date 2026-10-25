import PacketBatch11
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk88 :
    eval 0 (decode packetChars88).reverse = some 0 := by
  decide +kernel

theorem scan_chunk89 :
    eval 0 (decode packetChars89).reverse = some 0 := by
  decide +kernel

theorem scan_chunk90 :
    eval 0 (decode packetChars90).reverse = some 0 := by
  decide +kernel

theorem scan_chunk91 :
    eval 0 (decode packetChars91).reverse = some 0 := by
  decide +kernel

theorem scan_chunk92 :
    eval 0 (decode packetChars92).reverse = some 0 := by
  decide +kernel

theorem scan_chunk93 :
    eval 0 (decode packetChars93).reverse = some 0 := by
  decide +kernel

theorem scan_chunk94 :
    eval 1 (decode packetChars94).reverse = some 0 := by
  decide +kernel

theorem scan_chunk95 :
    eval 1 (decode packetChars95).reverse = some 1 := by
  decide +kernel

attribute [local irreducible] packetChars88 packetChars89 packetChars90 packetChars91
    packetChars92 packetChars93 packetChars94 packetChars95

theorem scan_part11 :
    eval 1 (decode payloadPart11).reverse = some 0 := by
  simp only [payloadPart11, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk95, scan_chunk94, scan_chunk93, scan_chunk92, scan_chunk91,
    scan_chunk90, scan_chunk89, scan_chunk88, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part11
