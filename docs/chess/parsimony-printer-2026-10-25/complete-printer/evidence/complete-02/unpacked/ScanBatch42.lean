import PacketBatch42
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk336 :
    eval 0 (decode packetChars336).reverse = some 0 := by
  decide +kernel

theorem scan_chunk337 :
    eval 0 (decode packetChars337).reverse = some 0 := by
  decide +kernel

theorem scan_chunk338 :
    eval 0 (decode packetChars338).reverse = some 0 := by
  decide +kernel

theorem scan_chunk339 :
    eval 0 (decode packetChars339).reverse = some 0 := by
  decide +kernel

theorem scan_chunk340 :
    eval 0 (decode packetChars340).reverse = some 0 := by
  decide +kernel

theorem scan_chunk341 :
    eval 2 (decode packetChars341).reverse = some 0 := by
  decide +kernel

theorem scan_chunk342 :
    eval 1 (decode packetChars342).reverse = some 2 := by
  decide +kernel

theorem scan_chunk343 :
    eval 1 (decode packetChars343).reverse = some 1 := by
  decide +kernel

attribute [local irreducible] packetChars336 packetChars337 packetChars338 packetChars339
    packetChars340 packetChars341 packetChars342 packetChars343

theorem scan_part42 :
    eval 1 (decode payloadPart42).reverse = some 0 := by
  simp only [payloadPart42, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk343, scan_chunk342, scan_chunk341, scan_chunk340,
    scan_chunk339, scan_chunk338, scan_chunk337, scan_chunk336, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part42
