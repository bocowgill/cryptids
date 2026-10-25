import PacketBatch28
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk224 :
    eval 1 (decode packetChars224).reverse = some 1 := by
  decide +kernel

theorem scan_chunk225 :
    eval 0 (decode packetChars225).reverse = some 1 := by
  decide +kernel

theorem scan_chunk226 :
    eval 0 (decode packetChars226).reverse = some 0 := by
  decide +kernel

theorem scan_chunk227 :
    eval 1 (decode packetChars227).reverse = some 0 := by
  decide +kernel

theorem scan_chunk228 :
    eval 0 (decode packetChars228).reverse = some 1 := by
  decide +kernel

theorem scan_chunk229 :
    eval 0 (decode packetChars229).reverse = some 0 := by
  decide +kernel

theorem scan_chunk230 :
    eval 0 (decode packetChars230).reverse = some 0 := by
  decide +kernel

theorem scan_chunk231 :
    eval 0 (decode packetChars231).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars224 packetChars225 packetChars226 packetChars227
    packetChars228 packetChars229 packetChars230 packetChars231

theorem scan_part28 :
    eval 0 (decode payloadPart28).reverse = some 1 := by
  simp only [payloadPart28, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk231, scan_chunk230, scan_chunk229, scan_chunk228,
    scan_chunk227, scan_chunk226, scan_chunk225, scan_chunk224, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part28
