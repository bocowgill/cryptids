import PacketBatch46
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk368 :
    eval 0 (decode packetChars368).reverse = some 1 := by
  decide +kernel

theorem scan_chunk369 :
    eval 0 (decode packetChars369).reverse = some 0 := by
  decide +kernel

theorem scan_chunk370 :
    eval 0 (decode packetChars370).reverse = some 0 := by
  decide +kernel

theorem scan_chunk371 :
    eval 0 (decode packetChars371).reverse = some 0 := by
  decide +kernel

theorem scan_chunk372 :
    eval 1 (decode packetChars372).reverse = some 0 := by
  decide +kernel

theorem scan_chunk373 :
    eval 2 (decode packetChars373).reverse = some 1 := by
  decide +kernel

theorem scan_chunk374 :
    eval 0 (decode packetChars374).reverse = some 2 := by
  decide +kernel

theorem scan_chunk375 :
    eval 0 (decode packetChars375).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars368 packetChars369 packetChars370 packetChars371
    packetChars372 packetChars373 packetChars374 packetChars375

theorem scan_part46 :
    eval 0 (decode payloadPart46).reverse = some 1 := by
  simp only [payloadPart46, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk375, scan_chunk374, scan_chunk373, scan_chunk372,
    scan_chunk371, scan_chunk370, scan_chunk369, scan_chunk368, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part46
