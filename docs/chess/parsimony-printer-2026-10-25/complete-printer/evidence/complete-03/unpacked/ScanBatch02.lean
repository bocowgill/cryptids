import PacketBatch02
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk16 :
    eval 2 (decode packetChars16).reverse = some 2 := by
  decide +kernel

theorem scan_chunk17 :
    eval 1 (decode packetChars17).reverse = some 2 := by
  decide +kernel

theorem scan_chunk18 :
    eval 0 (decode packetChars18).reverse = some 1 := by
  decide +kernel

theorem scan_chunk19 :
    eval 0 (decode packetChars19).reverse = some 0 := by
  decide +kernel

theorem scan_chunk20 :
    eval 0 (decode packetChars20).reverse = some 0 := by
  decide +kernel

theorem scan_chunk21 :
    eval 0 (decode packetChars21).reverse = some 0 := by
  decide +kernel

theorem scan_chunk22 :
    eval 2 (decode packetChars22).reverse = some 0 := by
  decide +kernel

theorem scan_chunk23 :
    eval 0 (decode packetChars23).reverse = some 2 := by
  decide +kernel

attribute [local irreducible] packetChars16 packetChars17 packetChars18 packetChars19
    packetChars20 packetChars21 packetChars22 packetChars23

theorem scan_part2 :
    eval 0 (decode payloadPart2).reverse = some 2 := by
  simp only [payloadPart2, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk23, scan_chunk22, scan_chunk21, scan_chunk20, scan_chunk19,
    scan_chunk18, scan_chunk17, scan_chunk16, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part2
