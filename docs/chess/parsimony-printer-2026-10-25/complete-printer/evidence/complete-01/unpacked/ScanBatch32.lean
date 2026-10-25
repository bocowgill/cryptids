import PacketBatch32
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk256 :
    eval 1 (decode packetChars256).reverse = some 0 := by
  decide +kernel

theorem scan_chunk257 :
    eval 1 (decode packetChars257).reverse = some 1 := by
  decide +kernel

theorem scan_chunk258 :
    eval 0 (decode packetChars258).reverse = some 1 := by
  decide +kernel

theorem scan_chunk259 :
    eval 0 (decode packetChars259).reverse = some 0 := by
  decide +kernel

theorem scan_chunk260 :
    eval 0 (decode packetChars260).reverse = some 0 := by
  decide +kernel

theorem scan_chunk261 :
    eval 0 (decode packetChars261).reverse = some 0 := by
  decide +kernel

theorem scan_chunk262 :
    eval 1 (decode packetChars262).reverse = some 0 := by
  decide +kernel

theorem scan_chunk263 :
    eval 3 (decode packetChars263).reverse = some 1 := by
  decide +kernel

attribute [local irreducible] packetChars256 packetChars257 packetChars258 packetChars259
    packetChars260 packetChars261 packetChars262 packetChars263

theorem scan_part32 :
    eval 3 (decode payloadPart32).reverse = some 0 := by
  simp only [payloadPart32, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk263, scan_chunk262, scan_chunk261, scan_chunk260,
    scan_chunk259, scan_chunk258, scan_chunk257, scan_chunk256, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part32
