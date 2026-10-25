import PacketBatch17
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk136 :
    eval 5 (decode packetChars136).reverse = some 1 := by
  decide +kernel

theorem scan_chunk137 :
    eval 0 (decode packetChars137).reverse = some 5 := by
  decide +kernel

theorem scan_chunk138 :
    eval 2 (decode packetChars138).reverse = some 0 := by
  decide +kernel

theorem scan_chunk139 :
    eval 0 (decode packetChars139).reverse = some 2 := by
  decide +kernel

theorem scan_chunk140 :
    eval 1 (decode packetChars140).reverse = some 0 := by
  decide +kernel

theorem scan_chunk141 :
    eval 2 (decode packetChars141).reverse = some 1 := by
  decide +kernel

theorem scan_chunk142 :
    eval 0 (decode packetChars142).reverse = some 2 := by
  decide +kernel

theorem scan_chunk143 :
    eval 0 (decode packetChars143).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars136 packetChars137 packetChars138 packetChars139
    packetChars140 packetChars141 packetChars142 packetChars143

theorem scan_part17 :
    eval 0 (decode payloadPart17).reverse = some 1 := by
  simp only [payloadPart17, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk143, scan_chunk142, scan_chunk141, scan_chunk140,
    scan_chunk139, scan_chunk138, scan_chunk137, scan_chunk136, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part17
