import PacketBatch19
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk152 :
    eval 1 (decode packetChars152).reverse = some 1 := by
  decide +kernel

theorem scan_chunk153 :
    eval 2 (decode packetChars153).reverse = some 1 := by
  decide +kernel

theorem scan_chunk154 :
    eval 2 (decode packetChars154).reverse = some 2 := by
  decide +kernel

theorem scan_chunk155 :
    eval 0 (decode packetChars155).reverse = some 2 := by
  decide +kernel

theorem scan_chunk156 :
    eval 1 (decode packetChars156).reverse = some 0 := by
  decide +kernel

theorem scan_chunk157 :
    eval 0 (decode packetChars157).reverse = some 1 := by
  decide +kernel

theorem scan_chunk158 :
    eval 0 (decode packetChars158).reverse = some 0 := by
  decide +kernel

theorem scan_chunk159 :
    eval 1 (decode packetChars159).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars152 packetChars153 packetChars154 packetChars155
    packetChars156 packetChars157 packetChars158 packetChars159

theorem scan_part19 :
    eval 1 (decode payloadPart19).reverse = some 1 := by
  simp only [payloadPart19, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk159, scan_chunk158, scan_chunk157, scan_chunk156,
    scan_chunk155, scan_chunk154, scan_chunk153, scan_chunk152, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part19
