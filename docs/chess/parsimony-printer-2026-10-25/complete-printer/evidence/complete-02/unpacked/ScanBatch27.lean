import PacketBatch27
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk216 :
    eval 0 (decode packetChars216).reverse = some 0 := by
  decide +kernel

theorem scan_chunk217 :
    eval 1 (decode packetChars217).reverse = some 0 := by
  decide +kernel

theorem scan_chunk218 :
    eval 0 (decode packetChars218).reverse = some 1 := by
  decide +kernel

theorem scan_chunk219 :
    eval 0 (decode packetChars219).reverse = some 0 := by
  decide +kernel

theorem scan_chunk220 :
    eval 0 (decode packetChars220).reverse = some 0 := by
  decide +kernel

theorem scan_chunk221 :
    eval 0 (decode packetChars221).reverse = some 0 := by
  decide +kernel

theorem scan_chunk222 :
    eval 1 (decode packetChars222).reverse = some 0 := by
  decide +kernel

theorem scan_chunk223 :
    eval 1 (decode packetChars223).reverse = some 1 := by
  decide +kernel

attribute [local irreducible] packetChars216 packetChars217 packetChars218 packetChars219
    packetChars220 packetChars221 packetChars222 packetChars223

theorem scan_part27 :
    eval 1 (decode payloadPart27).reverse = some 0 := by
  simp only [payloadPart27, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk223, scan_chunk222, scan_chunk221, scan_chunk220,
    scan_chunk219, scan_chunk218, scan_chunk217, scan_chunk216, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part27
