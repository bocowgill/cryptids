import PacketBatch31
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk248 :
    eval 2 (decode packetChars248).reverse = some 0 := by
  decide +kernel

theorem scan_chunk249 :
    eval 0 (decode packetChars249).reverse = some 2 := by
  decide +kernel

theorem scan_chunk250 :
    eval 0 (decode packetChars250).reverse = some 0 := by
  decide +kernel

theorem scan_chunk251 :
    eval 0 (decode packetChars251).reverse = some 0 := by
  decide +kernel

theorem scan_chunk252 :
    eval 1 (decode packetChars252).reverse = some 0 := by
  decide +kernel

theorem scan_chunk253 :
    eval 0 (decode packetChars253).reverse = some 1 := by
  decide +kernel

theorem scan_chunk254 :
    eval 2 (decode packetChars254).reverse = some 0 := by
  decide +kernel

theorem scan_chunk255 :
    eval 0 (decode packetChars255).reverse = some 2 := by
  decide +kernel

attribute [local irreducible] packetChars248 packetChars249 packetChars250 packetChars251
    packetChars252 packetChars253 packetChars254 packetChars255

theorem scan_part31 :
    eval 0 (decode payloadPart31).reverse = some 0 := by
  simp only [payloadPart31, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk255, scan_chunk254, scan_chunk253, scan_chunk252,
    scan_chunk251, scan_chunk250, scan_chunk249, scan_chunk248, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part31
