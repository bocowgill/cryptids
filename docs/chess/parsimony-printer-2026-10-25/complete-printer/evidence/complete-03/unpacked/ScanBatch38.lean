import PacketBatch38
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk304 :
    eval 0 (decode packetChars304).reverse = some 0 := by
  decide +kernel

theorem scan_chunk305 :
    eval 0 (decode packetChars305).reverse = some 0 := by
  decide +kernel

theorem scan_chunk306 :
    eval 0 (decode packetChars306).reverse = some 0 := by
  decide +kernel

theorem scan_chunk307 :
    eval 0 (decode packetChars307).reverse = some 0 := by
  decide +kernel

theorem scan_chunk308 :
    eval 0 (decode packetChars308).reverse = some 0 := by
  decide +kernel

theorem scan_chunk309 :
    eval 1 (decode packetChars309).reverse = some 0 := by
  decide +kernel

theorem scan_chunk310 :
    eval 0 (decode packetChars310).reverse = some 1 := by
  decide +kernel

theorem scan_chunk311 :
    eval 2 (decode packetChars311).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars304 packetChars305 packetChars306 packetChars307
    packetChars308 packetChars309 packetChars310 packetChars311

theorem scan_part38 :
    eval 2 (decode payloadPart38).reverse = some 0 := by
  simp only [payloadPart38, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk311, scan_chunk310, scan_chunk309, scan_chunk308,
    scan_chunk307, scan_chunk306, scan_chunk305, scan_chunk304, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part38
