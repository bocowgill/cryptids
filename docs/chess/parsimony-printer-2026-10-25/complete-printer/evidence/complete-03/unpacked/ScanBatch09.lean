import PacketBatch09
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk72 :
    eval 0 (decode packetChars72).reverse = some 0 := by
  decide +kernel

theorem scan_chunk73 :
    eval 4 (decode packetChars73).reverse = some 0 := by
  decide +kernel

theorem scan_chunk74 :
    eval 0 (decode packetChars74).reverse = some 4 := by
  decide +kernel

theorem scan_chunk75 :
    eval 0 (decode packetChars75).reverse = some 0 := by
  decide +kernel

theorem scan_chunk76 :
    eval 1 (decode packetChars76).reverse = some 0 := by
  decide +kernel

theorem scan_chunk77 :
    eval 0 (decode packetChars77).reverse = some 1 := by
  decide +kernel

theorem scan_chunk78 :
    eval 0 (decode packetChars78).reverse = some 0 := by
  decide +kernel

theorem scan_chunk79 :
    eval 1 (decode packetChars79).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars72 packetChars73 packetChars74 packetChars75
    packetChars76 packetChars77 packetChars78 packetChars79

theorem scan_part9 :
    eval 1 (decode payloadPart9).reverse = some 0 := by
  simp only [payloadPart9, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk79, scan_chunk78, scan_chunk77, scan_chunk76, scan_chunk75,
    scan_chunk74, scan_chunk73, scan_chunk72, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part9
