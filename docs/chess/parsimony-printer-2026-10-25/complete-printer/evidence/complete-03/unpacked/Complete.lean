import PrinterModel
import ScanBatch00
import ScanBatch01
import ScanBatch02
import ScanBatch03
import ScanBatch04
import ScanBatch05
import ScanBatch06
import ScanBatch07
import ScanBatch08
import ScanBatch09
import ScanBatch10
import ScanBatch11
import ScanBatch12
import ScanBatch13
import ScanBatch14
import ScanBatch15
import ScanBatch16
import ScanBatch17
import ScanBatch18
import ScanBatch19
import ScanBatch20
import ScanBatch21
import ScanBatch22
import ScanBatch23
import ScanBatch24
import ScanBatch25
import ScanBatch26
import ScanBatch27
import ScanBatch28
import ScanBatch29
import ScanBatch30
import ScanBatch31
import ScanBatch32
import ScanBatch33
import ScanBatch34
import ScanBatch35
import ScanBatch36
import ScanBatch37
import ScanBatch38
import ScanBatch39
import ScanBatch40
import ScanBatch41
import ScanBatch42
import ScanBatch43
import ScanBatch44
import ScanBatch45
import ScanBatch46
import ScanBatch47
import ScanBatch48
import ScanBatch49
import ScanBatch50
import ScanBatch51
import ScanBatch52

open Turing ConjectureMachines
open ConjectureMachines.Compilation
open ParsimonyComplete Parsimony.Common Parsimony.Insertion
namespace ParsimonyComposed

set_option backward.isDefEq.respectTransparency false
attribute [local irreducible] raw values
attribute [local irreducible] payloadPart0 payloadPart1 payloadPart2 payloadPart3 payloadPart4
    payloadPart5 payloadPart6 payloadPart7 payloadPart8 payloadPart9 payloadPart10 payloadPart11
    payloadPart12 payloadPart13 payloadPart14 payloadPart15 payloadPart16 payloadPart17
    payloadPart18 payloadPart19 payloadPart20 payloadPart21 payloadPart22 payloadPart23
    payloadPart24 payloadPart25 payloadPart26 payloadPart27 payloadPart28 payloadPart29
    payloadPart30 payloadPart31 payloadPart32 payloadPart33 payloadPart34 payloadPart35
    payloadPart36 payloadPart37 payloadPart38 payloadPart39 payloadPart40 payloadPart41
    payloadPart42 payloadPart43 payloadPart44 payloadPart45 payloadPart46 payloadPart47
    payloadPart48 payloadPart49 payloadPart50 payloadPart51 payloadPart52

def packet : List (Fin 2) := decode frozenPacket

theorem packet_scan : eval 0 packet.reverse = some 0 := by
  simp only [packet, frozenPacket, decode_append, List.reverse_append]
  simp only [eval_append, scan_part52, scan_part51, scan_part50, scan_part49, scan_part48,
    scan_part47, scan_part46, scan_part45, scan_part44, scan_part43, scan_part42, scan_part41,
    scan_part40, scan_part39, scan_part38, scan_part37, scan_part36, scan_part35, scan_part34,
    scan_part33, scan_part32, scan_part31, scan_part30, scan_part29, scan_part28, scan_part27,
    scan_part26, scan_part25, scan_part24, scan_part23, scan_part22, scan_part21, scan_part20,
    scan_part19, scan_part18, scan_part17, scan_part16, scan_part15, scan_part14, scan_part13,
    scan_part12, scan_part11, scan_part10, scan_part9, scan_part8, scan_part7, scan_part6,
    scan_part5, scan_part4, scan_part3, scan_part2, scan_part1, scan_part0, Option.bind_some]

attribute [local irreducible] frozenPacket

theorem printed_eq : Parsimony.Global.written word 13360 =
    [0, 0, 0, 0, 0, 1] ++ packet.reverse ++ [0] ++ List.replicate 32 1 := by
  have marker_bits : decode marker = List.replicate 32 1 ++ [0] := by decide +kernel
  have tail_bits : decode tailPadding = [1, 0, 0, 0, 0, 0] := by decide +kernel
  have forward := congrArg decode global_bits_identity
  rw [decode_text, packet_framing, decode_append, decode_append, marker_bits, tail_bits] at forward
  change (Parsimony.Global.written word 13360).reverse =
    (List.replicate 32 1 ++ [0]) ++ packet ++ [1, 0, 0, 0, 0, 0] at forward
  have backward := congrArg List.reverse forward
  simpa only [List.reverse_reverse, List.reverse_append, List.reverse_cons,
    List.reverse_nil, List.nil_append, List.reverse_replicate, List.append_assoc] using backward

attribute [local irreducible] packet

/-- Complete physical printer interface: start on blank tape, decoder on first packet bit. -/
theorem complete_printer :
    Parsimony.Common.Runs (printer values) (init : Cfg 13546 2)
      ⟨stateOf 13545, Tape.mk' blank (ListBlank.append packet blank)⟩ := by
  have first : Parsimony.Common.Runs (printer values) (init : Cfg 13546 2)
      (Parsimony.Global.boundary data 0 blank) := by
    simpa only [controls, stateOf, init, Parsimony.Global.boundary,
      Z_zero, Parsimony.Global.blank_cons] using
      startup (printer values) controls (printer_rows values)
  have core := ParsimonyComplete.extend (model values) (printer values)
    (model_extension values) (global_terminated blank)
  let L := ListBlank.append (packet.reverse ++ [0]) (O 32 blank)
  have geometry : ListBlank.append (Parsimony.Global.written word 13360) blank =
      Z 5 (L.cons 1) := by
    rw [printed_eq]
    simp only [L, ListBlank.append_assoc, ListBlank.append, Z, O,
      List.replicate_succ, List.replicate_zero]
  have work := workspace (printer values) controls (printer_rows values) 13359
    (ListBlank.append (Parsimony.Global.written word 13360) blank)
  have finish := tail (printer values) controls (printer_rows values) L
  have bridge : Parsimony.Common.Runs (printer values)
      ⟨controls.find, atL (ListBlank.append (Parsimony.Global.written word 13360) blank) blank⟩
      ⟨controls.find, atL (Z 5 (L.cons 1)) blank⟩ := by
    rw [geometry]
    exact .refl
  have clean := cleanup (printer values) controls (printer_rows values) packet _ packet_scan
  exact first.trans (core.trans (work.trans (bridge.trans (finish.trans clean))))

end ParsimonyComposed

#print axioms ParsimonyComposed.packet_scan
#print axioms ParsimonyComposed.printed_eq
#print axioms ParsimonyComposed.complete_printer
