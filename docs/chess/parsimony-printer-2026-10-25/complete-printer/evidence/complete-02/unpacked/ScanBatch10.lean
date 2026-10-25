import PacketBatch10
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk80 :
    eval 1 (decode packetChars80).reverse = some 1 := by
  decide +kernel

theorem scan_chunk81 :
    eval 0 (decode packetChars81).reverse = some 1 := by
  decide +kernel

theorem scan_chunk82 :
    eval 0 (decode packetChars82).reverse = some 0 := by
  decide +kernel

theorem scan_chunk83 :
    eval 1 (decode packetChars83).reverse = some 0 := by
  decide +kernel

theorem scan_chunk84 :
    eval 1 (decode packetChars84).reverse = some 1 := by
  decide +kernel

theorem scan_chunk85 :
    eval 0 (decode packetChars85).reverse = some 1 := by
  decide +kernel

theorem scan_chunk86 :
    eval 0 (decode packetChars86).reverse = some 0 := by
  decide +kernel

theorem scan_chunk87 :
    eval 0 (decode packetChars87).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars80 packetChars81 packetChars82 packetChars83
    packetChars84 packetChars85 packetChars86 packetChars87

theorem scan_part10 :
    eval 0 (decode payloadPart10).reverse = some 1 := by
  simp only [payloadPart10, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk87, scan_chunk86, scan_chunk85, scan_chunk84, scan_chunk83,
    scan_chunk82, scan_chunk81, scan_chunk80, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part10
