import PacketBatch18
import Cleanup

open ParsimonyComplete
namespace ParsimonyComposed

theorem scan_chunk144 :
    eval 0 (decode packetChars144).reverse = some 0 := by
  decide +kernel

theorem scan_chunk145 :
    eval 0 (decode packetChars145).reverse = some 0 := by
  decide +kernel

theorem scan_chunk146 :
    eval 0 (decode packetChars146).reverse = some 0 := by
  decide +kernel

theorem scan_chunk147 :
    eval 0 (decode packetChars147).reverse = some 0 := by
  decide +kernel

theorem scan_chunk148 :
    eval 0 (decode packetChars148).reverse = some 0 := by
  decide +kernel

theorem scan_chunk149 :
    eval 0 (decode packetChars149).reverse = some 0 := by
  decide +kernel

theorem scan_chunk150 :
    eval 0 (decode packetChars150).reverse = some 0 := by
  decide +kernel

theorem scan_chunk151 :
    eval 1 (decode packetChars151).reverse = some 0 := by
  decide +kernel

attribute [local irreducible] packetChars144 packetChars145 packetChars146 packetChars147
    packetChars148 packetChars149 packetChars150 packetChars151

theorem scan_part18 :
    eval 1 (decode payloadPart18).reverse = some 0 := by
  simp only [payloadPart18, decode_append, List.reverse_append]
  simp only [eval_append, scan_chunk151, scan_chunk150, scan_chunk149, scan_chunk148,
    scan_chunk147, scan_chunk146, scan_chunk145, scan_chunk144, Option.bind_some]

end ParsimonyComposed

#print axioms ParsimonyComposed.scan_part18
