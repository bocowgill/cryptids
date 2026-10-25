import PacketBatch14
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk112 :
    eval 1 (decode packetChars112).reverse = some 1 := by
  decide +kernel

theorem scan_chunk113 :
    eval 0 (decode packetChars113).reverse = some 1 := by
  decide +kernel

theorem scan_chunk114 :
    eval 1 (decode packetChars114).reverse = some 0 := by
  decide +kernel

theorem scan_chunk115 :
    eval 0 (decode packetChars115).reverse = some 1 := by
  decide +kernel

theorem scan_chunk116 :
    eval 0 (decode packetChars116).reverse = some 0 := by
  decide +kernel

theorem scan_chunk117 :
    eval 0 (decode packetChars117).reverse = some 0 := by
  decide +kernel

theorem scan_chunk118 :
    eval 2 (decode packetChars118).reverse = some 0 := by
  decide +kernel

theorem scan_chunk119 :
    eval 1 (decode packetChars119).reverse = some 2 := by
  decide +kernel

attribute [local irreducible] packetChars112 packetChars113 packetChars114 packetChars115
    packetChars116 packetChars117 packetChars118 packetChars119

theorem scan_part14 :
    eval 1 (decode payloadPart14).reverse = some 1 := by
  simp only [payloadPart14, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk119, scan_chunk118, scan_chunk117, scan_chunk116,
    scan_chunk115, scan_chunk114, scan_chunk113, scan_chunk112, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part14
