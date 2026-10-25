import PacketBatch06
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk48 :
    eval 1 (decode packetChars48).reverse = some 0 := by
  decide +kernel

theorem scan_chunk49 :
    eval 0 (decode packetChars49).reverse = some 1 := by
  decide +kernel

theorem scan_chunk50 :
    eval 0 (decode packetChars50).reverse = some 0 := by
  decide +kernel

theorem scan_chunk51 :
    eval 1 (decode packetChars51).reverse = some 0 := by
  decide +kernel

theorem scan_chunk52 :
    eval 1 (decode packetChars52).reverse = some 1 := by
  decide +kernel

theorem scan_chunk53 :
    eval 1 (decode packetChars53).reverse = some 1 := by
  decide +kernel

theorem scan_chunk54 :
    eval 1 (decode packetChars54).reverse = some 1 := by
  decide +kernel

theorem scan_chunk55 :
    eval 0 (decode packetChars55).reverse = some 1 := by
  decide +kernel

attribute [local irreducible] packetChars48 packetChars49 packetChars50 packetChars51
    packetChars52 packetChars53 packetChars54 packetChars55

theorem scan_part6 :
    eval 0 (decode payloadPart6).reverse = some 0 := by
  simp only [payloadPart6, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk55, scan_chunk54, scan_chunk53, scan_chunk52, scan_chunk51,
    scan_chunk50, scan_chunk49, scan_chunk48, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part6
