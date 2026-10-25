import PacketBatch25
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk200 :
    eval 0 (decode packetChars200).reverse = some 2 := by
  decide +kernel

theorem scan_chunk201 :
    eval 0 (decode packetChars201).reverse = some 0 := by
  decide +kernel

theorem scan_chunk202 :
    eval 0 (decode packetChars202).reverse = some 0 := by
  decide +kernel

theorem scan_chunk203 :
    eval 5 (decode packetChars203).reverse = some 0 := by
  decide +kernel

theorem scan_chunk204 :
    eval 0 (decode packetChars204).reverse = some 5 := by
  decide +kernel

theorem scan_chunk205 :
    eval 0 (decode packetChars205).reverse = some 0 := by
  decide +kernel

theorem scan_chunk206 :
    eval 2 (decode packetChars206).reverse = some 0 := by
  decide +kernel

theorem scan_chunk207 :
    eval 0 (decode packetChars207).reverse = some 2 := by
  decide +kernel

attribute [local irreducible] packetChars200 packetChars201 packetChars202 packetChars203
    packetChars204 packetChars205 packetChars206 packetChars207

theorem scan_part25 :
    eval 0 (decode payloadPart25).reverse = some 2 := by
  simp only [payloadPart25, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk207, scan_chunk206, scan_chunk205, scan_chunk204,
    scan_chunk203, scan_chunk202, scan_chunk201, scan_chunk200, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part25
