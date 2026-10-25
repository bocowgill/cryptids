import PacketBatch49
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk392 :
    eval 0 (decode packetChars392).reverse = some 1 := by
  decide +kernel

theorem scan_chunk393 :
    eval 2 (decode packetChars393).reverse = some 0 := by
  decide +kernel

theorem scan_chunk394 :
    eval 0 (decode packetChars394).reverse = some 2 := by
  decide +kernel

theorem scan_chunk395 :
    eval 0 (decode packetChars395).reverse = some 0 := by
  decide +kernel

theorem scan_chunk396 :
    eval 0 (decode packetChars396).reverse = some 0 := by
  decide +kernel

theorem scan_chunk397 :
    eval 0 (decode packetChars397).reverse = some 0 := by
  decide +kernel

theorem scan_chunk398 :
    eval 0 (decode packetChars398).reverse = some 0 := by
  decide +kernel

theorem scan_chunk399 :
    eval 2 (decode packetChars399).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars392 packetChars393 packetChars394 packetChars395
    packetChars396 packetChars397 packetChars398 packetChars399

theorem scan_part49 :
    eval 2 (decode payloadPart49).reverse = some 1 := by
  simp only [payloadPart49, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk399, scan_chunk398, scan_chunk397, scan_chunk396,
    scan_chunk395, scan_chunk394, scan_chunk393, scan_chunk392, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part49
