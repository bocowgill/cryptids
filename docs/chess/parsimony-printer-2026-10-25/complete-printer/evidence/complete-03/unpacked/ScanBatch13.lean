import PacketBatch13
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk104 :
    eval 0 (decode packetChars104).reverse = some 0 := by
  decide +kernel

theorem scan_chunk105 :
    eval 1 (decode packetChars105).reverse = some 0 := by
  decide +kernel

theorem scan_chunk106 :
    eval 1 (decode packetChars106).reverse = some 1 := by
  decide +kernel

theorem scan_chunk107 :
    eval 0 (decode packetChars107).reverse = some 1 := by
  decide +kernel

theorem scan_chunk108 :
    eval 0 (decode packetChars108).reverse = some 0 := by
  decide +kernel

theorem scan_chunk109 :
    eval 0 (decode packetChars109).reverse = some 0 := by
  decide +kernel

theorem scan_chunk110 :
    eval 0 (decode packetChars110).reverse = some 0 := by
  decide +kernel

theorem scan_chunk111 :
    eval 1 (decode packetChars111).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars104 packetChars105 packetChars106 packetChars107
    packetChars108 packetChars109 packetChars110 packetChars111

theorem scan_part13 :
    eval 1 (decode payloadPart13).reverse = some 0 := by
  simp only [payloadPart13, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk111, scan_chunk110, scan_chunk109, scan_chunk108,
    scan_chunk107, scan_chunk106, scan_chunk105, scan_chunk104, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part13
