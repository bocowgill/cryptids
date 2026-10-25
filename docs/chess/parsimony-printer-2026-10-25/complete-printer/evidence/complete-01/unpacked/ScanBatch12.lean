import PacketBatch12
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk96 :
    eval 0 (decode packetChars96).reverse = some 1 := by
  decide +kernel

theorem scan_chunk97 :
    eval 4 (decode packetChars97).reverse = some 0 := by
  decide +kernel

theorem scan_chunk98 :
    eval 1 (decode packetChars98).reverse = some 4 := by
  decide +kernel

theorem scan_chunk99 :
    eval 0 (decode packetChars99).reverse = some 1 := by
  decide +kernel

theorem scan_chunk100 :
    eval 1 (decode packetChars100).reverse = some 0 := by
  decide +kernel

theorem scan_chunk101 :
    eval 0 (decode packetChars101).reverse = some 1 := by
  decide +kernel

theorem scan_chunk102 :
    eval 0 (decode packetChars102).reverse = some 0 := by
  decide +kernel

theorem scan_chunk103 :
    eval 0 (decode packetChars103).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars96 packetChars97 packetChars98 packetChars99
    packetChars100 packetChars101 packetChars102 packetChars103

theorem scan_part12 :
    eval 0 (decode payloadPart12).reverse = some 1 := by
  simp only [payloadPart12, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk103, scan_chunk102, scan_chunk101, scan_chunk100,
    scan_chunk99, scan_chunk98, scan_chunk97, scan_chunk96, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part12
