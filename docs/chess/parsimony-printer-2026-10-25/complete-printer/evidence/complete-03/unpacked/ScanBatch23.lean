import PacketBatch23
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk184 :
    eval 0 (decode packetChars184).reverse = some 0 := by
  decide +kernel

theorem scan_chunk185 :
    eval 1 (decode packetChars185).reverse = some 0 := by
  decide +kernel

theorem scan_chunk186 :
    eval 0 (decode packetChars186).reverse = some 1 := by
  decide +kernel

theorem scan_chunk187 :
    eval 0 (decode packetChars187).reverse = some 0 := by
  decide +kernel

theorem scan_chunk188 :
    eval 1 (decode packetChars188).reverse = some 0 := by
  decide +kernel

theorem scan_chunk189 :
    eval 0 (decode packetChars189).reverse = some 1 := by
  decide +kernel

theorem scan_chunk190 :
    eval 0 (decode packetChars190).reverse = some 0 := by
  decide +kernel

theorem scan_chunk191 :
    eval 0 (decode packetChars191).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars184 packetChars185 packetChars186 packetChars187
    packetChars188 packetChars189 packetChars190 packetChars191

theorem scan_part23 :
    eval 0 (decode payloadPart23).reverse = some 0 := by
  simp only [payloadPart23, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk191, scan_chunk190, scan_chunk189, scan_chunk188,
    scan_chunk187, scan_chunk186, scan_chunk185, scan_chunk184, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part23
