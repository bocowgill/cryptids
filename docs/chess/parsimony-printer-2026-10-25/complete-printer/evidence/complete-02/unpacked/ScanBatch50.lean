import PacketBatch50
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk400 :
    eval 0 (decode packetChars400).reverse = some 2 := by
  decide +kernel

theorem scan_chunk401 :
    eval 1 (decode packetChars401).reverse = some 0 := by
  decide +kernel

theorem scan_chunk402 :
    eval 1 (decode packetChars402).reverse = some 1 := by
  decide +kernel

theorem scan_chunk403 :
    eval 0 (decode packetChars403).reverse = some 1 := by
  decide +kernel

theorem scan_chunk404 :
    eval 0 (decode packetChars404).reverse = some 0 := by
  decide +kernel

theorem scan_chunk405 :
    eval 0 (decode packetChars405).reverse = some 0 := by
  decide +kernel

theorem scan_chunk406 :
    eval 0 (decode packetChars406).reverse = some 0 := by
  decide +kernel

theorem scan_chunk407 :
    eval 0 (decode packetChars407).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars400 packetChars401 packetChars402 packetChars403
    packetChars404 packetChars405 packetChars406 packetChars407

theorem scan_part50 :
    eval 0 (decode payloadPart50).reverse = some 2 := by
  simp only [payloadPart50, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk407, scan_chunk406, scan_chunk405, scan_chunk404,
    scan_chunk403, scan_chunk402, scan_chunk401, scan_chunk400, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part50
