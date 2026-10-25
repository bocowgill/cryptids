import PacketBatch04
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk32 :
    eval 1 (decode packetChars32).reverse = some 1 := by
  decide +kernel

theorem scan_chunk33 :
    eval 0 (decode packetChars33).reverse = some 1 := by
  decide +kernel

theorem scan_chunk34 :
    eval 3 (decode packetChars34).reverse = some 0 := by
  decide +kernel

theorem scan_chunk35 :
    eval 1 (decode packetChars35).reverse = some 3 := by
  decide +kernel

theorem scan_chunk36 :
    eval 0 (decode packetChars36).reverse = some 1 := by
  decide +kernel

theorem scan_chunk37 :
    eval 2 (decode packetChars37).reverse = some 0 := by
  decide +kernel

theorem scan_chunk38 :
    eval 2 (decode packetChars38).reverse = some 2 := by
  decide +kernel

theorem scan_chunk39 :
    eval 0 (decode packetChars39).reverse = some 2 := by
  decide +kernel

attribute [local irreducible] packetChars32 packetChars33 packetChars34 packetChars35
    packetChars36 packetChars37 packetChars38 packetChars39

theorem scan_part4 :
    eval 0 (decode payloadPart4).reverse = some 1 := by
  simp only [payloadPart4, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk39, scan_chunk38, scan_chunk37, scan_chunk36, scan_chunk35,
    scan_chunk34, scan_chunk33, scan_chunk32, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part4
