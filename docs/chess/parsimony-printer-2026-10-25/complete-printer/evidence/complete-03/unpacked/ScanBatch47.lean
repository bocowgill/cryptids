import PacketBatch47
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk376 :
    eval 0 (decode packetChars376).reverse = some 0 := by
  decide +kernel

theorem scan_chunk377 :
    eval 0 (decode packetChars377).reverse = some 0 := by
  decide +kernel

theorem scan_chunk378 :
    eval 0 (decode packetChars378).reverse = some 0 := by
  decide +kernel

theorem scan_chunk379 :
    eval 2 (decode packetChars379).reverse = some 0 := by
  decide +kernel

theorem scan_chunk380 :
    eval 0 (decode packetChars380).reverse = some 2 := by
  decide +kernel

theorem scan_chunk381 :
    eval 0 (decode packetChars381).reverse = some 0 := by
  decide +kernel

theorem scan_chunk382 :
    eval 0 (decode packetChars382).reverse = some 0 := by
  decide +kernel

theorem scan_chunk383 :
    eval 0 (decode packetChars383).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars376 packetChars377 packetChars378 packetChars379
    packetChars380 packetChars381 packetChars382 packetChars383

theorem scan_part47 :
    eval 0 (decode payloadPart47).reverse = some 0 := by
  simp only [payloadPart47, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk383, scan_chunk382, scan_chunk381, scan_chunk380,
    scan_chunk379, scan_chunk378, scan_chunk377, scan_chunk376, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part47
