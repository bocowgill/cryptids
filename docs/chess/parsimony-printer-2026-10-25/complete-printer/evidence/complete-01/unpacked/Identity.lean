import FrozenPacket
import SizedRender

open ConjectureMachines.Compilation
namespace ParsimonyComposed

attribute [local irreducible] raw

theorem global_bits_identity :
    Parsimony.Packet.text (Parsimony.Global.written word 13360).reverse = frozenFramed := by
  calc
    Parsimony.Packet.text (Parsimony.Global.written word 13360).reverse =
        (List.range 13360).flatMap (fun i ↦
          Parsimony.Packet.text (Parsimony.Packet.encode 13
            (Parsimony.Data.wordAt 13359 values i).val).reverse) := by
      rw [Parsimony.Global.written_reverse]
      simp only [Parsimony.Packet.text, List.map_flatMap, word]
    _ = Parsimony.Packet.render 13 (values.toList.map Fin.val) := by
      exact Parsimony.Packet.indexed_render_sized 13 13359 13360 values values_size
    _ = frozenFramed := by
      change Parsimony.Packet.render 13 ((raw.map narrow).toList.map Fin.val) = frozenFramed
      rw [← numeric_eq]
      exact all_packet_words

end ParsimonyComposed

#print axioms ParsimonyComposed.global_bits_identity
#print axioms ParsimonyComposed.all_packet_words
#print axioms ParsimonyComposed.packet_framing
