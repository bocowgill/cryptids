import PacketBatch01
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk8 :
    eval 0 (decode packetChars8).reverse = some 1 := by
  decide +kernel

theorem scan_chunk9 :
    eval 0 (decode packetChars9).reverse = some 0 := by
  decide +kernel

theorem scan_chunk10 :
    eval 0 (decode packetChars10).reverse = some 0 := by
  decide +kernel

theorem scan_chunk11 :
    eval 1 (decode packetChars11).reverse = some 0 := by
  decide +kernel

theorem scan_chunk12 :
    eval 0 (decode packetChars12).reverse = some 1 := by
  decide +kernel

theorem scan_chunk13 :
    eval 1 (decode packetChars13).reverse = some 0 := by
  decide +kernel

theorem scan_chunk14 :
    eval 2 (decode packetChars14).reverse = some 1 := by
  decide +kernel

theorem scan_chunk15 :
    eval 2 (decode packetChars15).reverse = some 2 := by
  decide +kernel

attribute [local irreducible] packetChars8 packetChars9 packetChars10 packetChars11 packetChars12
    packetChars13 packetChars14 packetChars15

theorem scan_part1 :
    eval 2 (decode payloadPart1).reverse = some 1 := by
  simp only [payloadPart1, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk15, scan_chunk14, scan_chunk13, scan_chunk12, scan_chunk11,
    scan_chunk10, scan_chunk9, scan_chunk8, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part1
