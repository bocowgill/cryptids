import PacketBatch26
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk208 :
    eval 0 (decode packetChars208).reverse = some 0 := by
  decide +kernel

theorem scan_chunk209 :
    eval 0 (decode packetChars209).reverse = some 0 := by
  decide +kernel

theorem scan_chunk210 :
    eval 3 (decode packetChars210).reverse = some 0 := by
  decide +kernel

theorem scan_chunk211 :
    eval 2 (decode packetChars211).reverse = some 3 := by
  decide +kernel

theorem scan_chunk212 :
    eval 2 (decode packetChars212).reverse = some 2 := by
  decide +kernel

theorem scan_chunk213 :
    eval 1 (decode packetChars213).reverse = some 2 := by
  decide +kernel

theorem scan_chunk214 :
    eval 0 (decode packetChars214).reverse = some 1 := by
  decide +kernel

theorem scan_chunk215 :
    eval 0 (decode packetChars215).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars208 packetChars209 packetChars210 packetChars211
    packetChars212 packetChars213 packetChars214 packetChars215

theorem scan_part26 :
    eval 0 (decode payloadPart26).reverse = some 0 := by
  simp only [payloadPart26, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk215, scan_chunk214, scan_chunk213, scan_chunk212,
    scan_chunk211, scan_chunk210, scan_chunk209, scan_chunk208, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part26
