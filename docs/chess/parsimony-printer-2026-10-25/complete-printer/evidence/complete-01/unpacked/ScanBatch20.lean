import PacketBatch20
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk160 :
    eval 2 (decode packetChars160).reverse = some 1 := by
  decide +kernel

theorem scan_chunk161 :
    eval 1 (decode packetChars161).reverse = some 2 := by
  decide +kernel

theorem scan_chunk162 :
    eval 0 (decode packetChars162).reverse = some 1 := by
  decide +kernel

theorem scan_chunk163 :
    eval 0 (decode packetChars163).reverse = some 0 := by
  decide +kernel

theorem scan_chunk164 :
    eval 0 (decode packetChars164).reverse = some 0 := by
  decide +kernel

theorem scan_chunk165 :
    eval 3 (decode packetChars165).reverse = some 0 := by
  decide +kernel

theorem scan_chunk166 :
    eval 1 (decode packetChars166).reverse = some 3 := by
  decide +kernel

theorem scan_chunk167 :
    eval 2 (decode packetChars167).reverse = some 1 := by
  decide +kernel

attribute [local irreducible] packetChars160 packetChars161 packetChars162 packetChars163
    packetChars164 packetChars165 packetChars166 packetChars167

theorem scan_part20 :
    eval 2 (decode payloadPart20).reverse = some 1 := by
  simp only [payloadPart20, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk167, scan_chunk166, scan_chunk165, scan_chunk164,
    scan_chunk163, scan_chunk162, scan_chunk161, scan_chunk160, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part20
