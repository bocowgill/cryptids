import PacketBatch33
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk264 :
    eval 0 (decode packetChars264).reverse = some 3 := by
  decide +kernel

theorem scan_chunk265 :
    eval 0 (decode packetChars265).reverse = some 0 := by
  decide +kernel

theorem scan_chunk266 :
    eval 0 (decode packetChars266).reverse = some 0 := by
  decide +kernel

theorem scan_chunk267 :
    eval 1 (decode packetChars267).reverse = some 0 := by
  decide +kernel

theorem scan_chunk268 :
    eval 0 (decode packetChars268).reverse = some 1 := by
  decide +kernel

theorem scan_chunk269 :
    eval 2 (decode packetChars269).reverse = some 0 := by
  decide +kernel

theorem scan_chunk270 :
    eval 2 (decode packetChars270).reverse = some 2 := by
  decide +kernel

theorem scan_chunk271 :
    eval 0 (decode packetChars271).reverse = some 2 := by
  decide +kernel

attribute [local irreducible] packetChars264 packetChars265 packetChars266 packetChars267
    packetChars268 packetChars269 packetChars270 packetChars271

theorem scan_part33 :
    eval 0 (decode payloadPart33).reverse = some 3 := by
  simp only [payloadPart33, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk271, scan_chunk270, scan_chunk269, scan_chunk268,
    scan_chunk267, scan_chunk266, scan_chunk265, scan_chunk264, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part33
