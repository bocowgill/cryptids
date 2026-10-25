import PacketBatch05
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk40 :
    eval 0 (decode packetChars40).reverse = some 0 := by
  decide +kernel

theorem scan_chunk41 :
    eval 0 (decode packetChars41).reverse = some 0 := by
  decide +kernel

theorem scan_chunk42 :
    eval 5 (decode packetChars42).reverse = some 0 := by
  decide +kernel

theorem scan_chunk43 :
    eval 2 (decode packetChars43).reverse = some 5 := by
  decide +kernel

theorem scan_chunk44 :
    eval 2 (decode packetChars44).reverse = some 2 := by
  decide +kernel

theorem scan_chunk45 :
    eval 0 (decode packetChars45).reverse = some 2 := by
  decide +kernel

theorem scan_chunk46 :
    eval 0 (decode packetChars46).reverse = some 0 := by
  decide +kernel

theorem scan_chunk47 :
    eval 0 (decode packetChars47).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars40 packetChars41 packetChars42 packetChars43
    packetChars44 packetChars45 packetChars46 packetChars47

theorem scan_part5 :
    eval 0 (decode payloadPart5).reverse = some 0 := by
  simp only [payloadPart5, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk47, scan_chunk46, scan_chunk45, scan_chunk44, scan_chunk43,
    scan_chunk42, scan_chunk41, scan_chunk40, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part5
