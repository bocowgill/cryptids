import PacketBatch03
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk24 :
    eval 1 (decode packetChars24).reverse = some 0 := by
  decide +kernel

theorem scan_chunk25 :
    eval 1 (decode packetChars25).reverse = some 1 := by
  decide +kernel

theorem scan_chunk26 :
    eval 0 (decode packetChars26).reverse = some 1 := by
  decide +kernel

theorem scan_chunk27 :
    eval 1 (decode packetChars27).reverse = some 0 := by
  decide +kernel

theorem scan_chunk28 :
    eval 2 (decode packetChars28).reverse = some 1 := by
  decide +kernel

theorem scan_chunk29 :
    eval 2 (decode packetChars29).reverse = some 2 := by
  decide +kernel

theorem scan_chunk30 :
    eval 0 (decode packetChars30).reverse = some 2 := by
  decide +kernel

theorem scan_chunk31 :
    eval 1 (decode packetChars31).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars24 packetChars25 packetChars26 packetChars27
    packetChars28 packetChars29 packetChars30 packetChars31

theorem scan_part3 :
    eval 1 (decode payloadPart3).reverse = some 0 := by
  simp only [payloadPart3, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk31, scan_chunk30, scan_chunk29, scan_chunk28, scan_chunk27,
    scan_chunk26, scan_chunk25, scan_chunk24, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part3
