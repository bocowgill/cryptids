import PacketBatch24
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk192 :
    eval 0 (decode packetChars192).reverse = some 0 := by
  decide +kernel

theorem scan_chunk193 :
    eval 0 (decode packetChars193).reverse = some 0 := by
  decide +kernel

theorem scan_chunk194 :
    eval 0 (decode packetChars194).reverse = some 0 := by
  decide +kernel

theorem scan_chunk195 :
    eval 1 (decode packetChars195).reverse = some 0 := by
  decide +kernel

theorem scan_chunk196 :
    eval 2 (decode packetChars196).reverse = some 1 := by
  decide +kernel

theorem scan_chunk197 :
    eval 1 (decode packetChars197).reverse = some 2 := by
  decide +kernel

theorem scan_chunk198 :
    eval 1 (decode packetChars198).reverse = some 1 := by
  decide +kernel

theorem scan_chunk199 :
    eval 2 (decode packetChars199).reverse = some 1 := by
  decide +kernel

attribute [local irreducible] packetChars192 packetChars193 packetChars194 packetChars195
    packetChars196 packetChars197 packetChars198 packetChars199

theorem scan_part24 :
    eval 2 (decode payloadPart24).reverse = some 0 := by
  simp only [payloadPart24, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk199, scan_chunk198, scan_chunk197, scan_chunk196,
    scan_chunk195, scan_chunk194, scan_chunk193, scan_chunk192, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part24
