import PacketBatch21
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk168 :
    eval 1 (decode packetChars168).reverse = some 2 := by
  decide +kernel

theorem scan_chunk169 :
    eval 1 (decode packetChars169).reverse = some 1 := by
  decide +kernel

theorem scan_chunk170 :
    eval 2 (decode packetChars170).reverse = some 1 := by
  decide +kernel

theorem scan_chunk171 :
    eval 0 (decode packetChars171).reverse = some 2 := by
  decide +kernel

theorem scan_chunk172 :
    eval 0 (decode packetChars172).reverse = some 0 := by
  decide +kernel

theorem scan_chunk173 :
    eval 0 (decode packetChars173).reverse = some 0 := by
  decide +kernel

theorem scan_chunk174 :
    eval 0 (decode packetChars174).reverse = some 0 := by
  decide +kernel

theorem scan_chunk175 :
    eval 2 (decode packetChars175).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars168 packetChars169 packetChars170 packetChars171
    packetChars172 packetChars173 packetChars174 packetChars175

theorem scan_part21 :
    eval 2 (decode payloadPart21).reverse = some 2 := by
  simp only [payloadPart21, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk175, scan_chunk174, scan_chunk173, scan_chunk172,
    scan_chunk171, scan_chunk170, scan_chunk169, scan_chunk168, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part21
