import Cryptids.Compilation.Parsimony.Packet

namespace ConjectureMachines.Compilation.Parsimony.Packet

/-- Specialize the range while the input array is still abstract. -/
theorem indexed_render_sized (width last count : Nat) (input : Array (Fin (last + 1)))
    (size : input.size = count) :
    (List.range count).flatMap (fun i ↦
      text (encode width (Data.wordAt last input i).val).reverse) =
        render width (input.toList.map Fin.val) := by
  rw [← size]
  exact indexed_render width last input

end ConjectureMachines.Compilation.Parsimony.Packet

#print axioms ConjectureMachines.Compilation.Parsimony.Packet.indexed_render_sized
