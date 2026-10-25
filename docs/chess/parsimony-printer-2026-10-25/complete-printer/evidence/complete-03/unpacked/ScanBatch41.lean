import PacketBatch41
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk328 :
    eval 2 (decode packetChars328).reverse = some 1 := by
  decide +kernel

theorem scan_chunk329 :
    eval 0 (decode packetChars329).reverse = some 2 := by
  decide +kernel

theorem scan_chunk330 :
    eval 1 (decode packetChars330).reverse = some 0 := by
  decide +kernel

theorem scan_chunk331 :
    eval 1 (decode packetChars331).reverse = some 1 := by
  decide +kernel

theorem scan_chunk332 :
    eval 1 (decode packetChars332).reverse = some 1 := by
  decide +kernel

theorem scan_chunk333 :
    eval 1 (decode packetChars333).reverse = some 1 := by
  decide +kernel

theorem scan_chunk334 :
    eval 2 (decode packetChars334).reverse = some 1 := by
  decide +kernel

theorem scan_chunk335 :
    eval 0 (decode packetChars335).reverse = some 2 := by
  decide +kernel

attribute [local irreducible] packetChars328 packetChars329 packetChars330 packetChars331
    packetChars332 packetChars333 packetChars334 packetChars335

theorem scan_part41 :
    eval 0 (decode payloadPart41).reverse = some 1 := by
  simp only [payloadPart41, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk335, scan_chunk334, scan_chunk333, scan_chunk332,
    scan_chunk331, scan_chunk330, scan_chunk329, scan_chunk328, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part41
