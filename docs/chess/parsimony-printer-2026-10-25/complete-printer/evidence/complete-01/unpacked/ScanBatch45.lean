import PacketBatch45
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk360 :
    eval 0 (decode packetChars360).reverse = some 1 := by
  decide +kernel

theorem scan_chunk361 :
    eval 0 (decode packetChars361).reverse = some 0 := by
  decide +kernel

theorem scan_chunk362 :
    eval 0 (decode packetChars362).reverse = some 0 := by
  decide +kernel

theorem scan_chunk363 :
    eval 2 (decode packetChars363).reverse = some 0 := by
  decide +kernel

theorem scan_chunk364 :
    eval 2 (decode packetChars364).reverse = some 2 := by
  decide +kernel

theorem scan_chunk365 :
    eval 0 (decode packetChars365).reverse = some 2 := by
  decide +kernel

theorem scan_chunk366 :
    eval 0 (decode packetChars366).reverse = some 0 := by
  decide +kernel

theorem scan_chunk367 :
    eval 1 (decode packetChars367).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars360 packetChars361 packetChars362 packetChars363
    packetChars364 packetChars365 packetChars366 packetChars367

theorem scan_part45 :
    eval 1 (decode payloadPart45).reverse = some 1 := by
  simp only [payloadPart45, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk367, scan_chunk366, scan_chunk365, scan_chunk364,
    scan_chunk363, scan_chunk362, scan_chunk361, scan_chunk360, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part45
