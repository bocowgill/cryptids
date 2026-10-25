import PacketBatch40
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk320 :
    eval 0 (decode packetChars320).reverse = some 1 := by
  decide +kernel

theorem scan_chunk321 :
    eval 2 (decode packetChars321).reverse = some 0 := by
  decide +kernel

theorem scan_chunk322 :
    eval 0 (decode packetChars322).reverse = some 2 := by
  decide +kernel

theorem scan_chunk323 :
    eval 1 (decode packetChars323).reverse = some 0 := by
  decide +kernel

theorem scan_chunk324 :
    eval 0 (decode packetChars324).reverse = some 1 := by
  decide +kernel

theorem scan_chunk325 :
    eval 1 (decode packetChars325).reverse = some 0 := by
  decide +kernel

theorem scan_chunk326 :
    eval 0 (decode packetChars326).reverse = some 1 := by
  decide +kernel

theorem scan_chunk327 :
    eval 1 (decode packetChars327).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars320 packetChars321 packetChars322 packetChars323
    packetChars324 packetChars325 packetChars326 packetChars327

theorem scan_part40 :
    eval 1 (decode payloadPart40).reverse = some 1 := by
  simp only [payloadPart40, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk327, scan_chunk326, scan_chunk325, scan_chunk324,
    scan_chunk323, scan_chunk322, scan_chunk321, scan_chunk320, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part40
