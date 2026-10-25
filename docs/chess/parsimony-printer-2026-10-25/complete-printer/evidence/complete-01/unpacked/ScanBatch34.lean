import PacketBatch34
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk272 :
    eval 0 (decode packetChars272).reverse = some 0 := by
  decide +kernel

theorem scan_chunk273 :
    eval 0 (decode packetChars273).reverse = some 0 := by
  decide +kernel

theorem scan_chunk274 :
    eval 0 (decode packetChars274).reverse = some 0 := by
  decide +kernel

theorem scan_chunk275 :
    eval 0 (decode packetChars275).reverse = some 0 := by
  decide +kernel

theorem scan_chunk276 :
    eval 0 (decode packetChars276).reverse = some 0 := by
  decide +kernel

theorem scan_chunk277 :
    eval 1 (decode packetChars277).reverse = some 0 := by
  decide +kernel

theorem scan_chunk278 :
    eval 0 (decode packetChars278).reverse = some 1 := by
  decide +kernel

theorem scan_chunk279 :
    eval 0 (decode packetChars279).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars272 packetChars273 packetChars274 packetChars275
    packetChars276 packetChars277 packetChars278 packetChars279

theorem scan_part34 :
    eval 0 (decode payloadPart34).reverse = some 0 := by
  simp only [payloadPart34, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk279, scan_chunk278, scan_chunk277, scan_chunk276,
    scan_chunk275, scan_chunk274, scan_chunk273, scan_chunk272, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part34
