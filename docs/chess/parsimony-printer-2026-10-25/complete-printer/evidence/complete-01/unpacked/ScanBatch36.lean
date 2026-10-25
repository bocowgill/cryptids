import PacketBatch36
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk288 :
    eval 0 (decode packetChars288).reverse = some 2 := by
  decide +kernel

theorem scan_chunk289 :
    eval 0 (decode packetChars289).reverse = some 0 := by
  decide +kernel

theorem scan_chunk290 :
    eval 0 (decode packetChars290).reverse = some 0 := by
  decide +kernel

theorem scan_chunk291 :
    eval 0 (decode packetChars291).reverse = some 0 := by
  decide +kernel

theorem scan_chunk292 :
    eval 0 (decode packetChars292).reverse = some 0 := by
  decide +kernel

theorem scan_chunk293 :
    eval 2 (decode packetChars293).reverse = some 0 := by
  decide +kernel

theorem scan_chunk294 :
    eval 0 (decode packetChars294).reverse = some 2 := by
  decide +kernel

theorem scan_chunk295 :
    eval 0 (decode packetChars295).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars288 packetChars289 packetChars290 packetChars291
    packetChars292 packetChars293 packetChars294 packetChars295

theorem scan_part36 :
    eval 0 (decode payloadPart36).reverse = some 2 := by
  simp only [payloadPart36, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk295, scan_chunk294, scan_chunk293, scan_chunk292,
    scan_chunk291, scan_chunk290, scan_chunk289, scan_chunk288, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part36
