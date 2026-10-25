import PacketCommon

open Turing ConjectureMachines
open ConjectureMachines.Compilation
namespace ParsimonyComposed

def sub416 : Array Nat := #[
  2304,
  224,
  272,
  12,
  32,
  19,
  4099,
  6147,
  4352,
  1024,
  288,
  416,
  408,
  16,
  12,
  4101,
  4096,
  512,
  5120,
  3648,
  64,
  200,
  8,
  69,
  7,
  6,
  6144,
  5120,
  3840,
  640,
  272,
  0
]
def packetChars416 : List Char :=
  [zeroChar, oneChar, zeroChar, zeroChar, oneChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    oneChar, oneChar, oneChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, oneChar, zeroChar, zeroChar, zeroChar, oneChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, oneChar, oneChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, oneChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, oneChar, zeroChar, zeroChar, oneChar, oneChar, oneChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, oneChar,
    oneChar, oneChar, oneChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, oneChar, oneChar, oneChar, zeroChar, zeroChar, zeroChar,
    oneChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, oneChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, oneChar,
    zeroChar, zeroChar, oneChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, oneChar, oneChar, zeroChar, oneChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, oneChar, oneChar,
    zeroChar, zeroChar, oneChar, oneChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, oneChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, oneChar, oneChar, zeroChar, zeroChar, oneChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, oneChar, zeroChar,
    oneChar, oneChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, oneChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    oneChar, zeroChar, oneChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, oneChar, oneChar, oneChar, zeroChar,
    zeroChar, oneChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, oneChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, oneChar,
    oneChar, zeroChar, zeroChar, oneChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, oneChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, oneChar,
    zeroChar, zeroChar, zeroChar, oneChar, zeroChar, oneChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, oneChar, oneChar,
    oneChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, oneChar, oneChar, zeroChar, oneChar, oneChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    oneChar, zeroChar, oneChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, oneChar, oneChar, oneChar, oneChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, oneChar, zeroChar, oneChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, oneChar, zeroChar,
    zeroChar, zeroChar, oneChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar]

def frozenChunk416 : List Char := packetChars416

theorem packet_chunk416 :
    Parsimony.Packet.render 13 (numeric sub416) = frozenChunk416 := by
  decide +kernel

def sub417 : Array Nat := #[
  18,
  2,
  2,
  2048,
  4096,
  2048,
  0,
  64,
  0,
  16,
  0,
  3,
  5233,
  1260,
  2340,
  4640
]
def packetChars417 : List Char :=
  [zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, oneChar,
    zeroChar, zeroChar, oneChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, oneChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, oneChar, zeroChar, zeroChar, oneChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, oneChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, oneChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, oneChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, oneChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar,
    zeroChar, oneChar, oneChar, oneChar, zeroChar, oneChar, zeroChar, zeroChar, zeroChar, oneChar,
    oneChar, oneChar, zeroChar, zeroChar, zeroChar, oneChar, zeroChar, zeroChar, oneChar,
    zeroChar, zeroChar, oneChar, oneChar, oneChar, zeroChar, oneChar, oneChar, zeroChar, zeroChar,
    zeroChar, oneChar, zeroChar, zeroChar, oneChar, zeroChar, zeroChar, oneChar, zeroChar,
    zeroChar, oneChar, zeroChar, zeroChar, oneChar, zeroChar, zeroChar, oneChar, zeroChar,
    zeroChar, zeroChar]

def frozenChunk417 : List Char := packetChars417 ++ tailPadding

theorem packet_chunk417 :
    Parsimony.Packet.render 13 (numeric sub417) = frozenChunk417 := by
  decide +kernel

theorem partition_part52 : part52.toList =
  (sub416.toList ++ sub417.toList) := by rfl
theorem packet_part52 : Parsimony.Packet.render 13 (numeric part52) =
  (frozenChunk416 ++ frozenChunk417) := by
  have equal : numeric part52 =
    (numeric sub416 ++ numeric sub417) := by
    simp only [numeric, partition_part52, List.map_append]
  rw [equal]
  simp only [Parsimony.Packet.render_append,
    packet_chunk416, packet_chunk417]

end ParsimonyComposed
#print axioms ParsimonyComposed.partition_part52
#print axioms ParsimonyComposed.packet_part52
#print axioms ParsimonyComposed.packet_chunk416
#print axioms ParsimonyComposed.packet_chunk417
