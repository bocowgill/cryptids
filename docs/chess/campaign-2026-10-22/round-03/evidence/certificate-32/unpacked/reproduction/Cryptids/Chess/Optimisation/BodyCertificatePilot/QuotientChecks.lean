module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.QuotientData
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.MapChecks

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/quotient-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t0\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_000000_facts :
    QuotientFacts quotientChunk_000000 894 457948 :=
  checkQuotient_sound quotientChunk_000000 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_000894_facts :
    QuotientFacts quotientChunk_000894 894 457948 :=
  checkQuotient_sound quotientChunk_000894 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_000000_001788_facts :
    QuotientFacts quotientNode_000000_001788 1788 457948 :=
  quotient_facts_branch
    quotientChunk_000000
    quotientChunk_000894
    894 894 457948
    quotientChunk_000000_facts
    quotientChunk_000894_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_001788_facts :
    QuotientFacts quotientChunk_001788 894 457948 :=
  checkQuotient_sound quotientChunk_001788 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_002682_facts :
    QuotientFacts quotientChunk_002682 895 457948 :=
  checkQuotient_sound quotientChunk_002682 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_001788_001789_facts :
    QuotientFacts quotientNode_001788_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_001788
    quotientChunk_002682
    894 895 457948
    quotientChunk_001788_facts
    quotientChunk_002682_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_000000_003577_facts :
    QuotientFacts quotientNode_000000_003577 3577 457948 :=
  quotient_facts_branch
    quotientNode_000000_001788
    quotientNode_001788_001789
    1788 1789 457948
    quotientNode_000000_001788_facts
    quotientNode_001788_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_003577_facts :
    QuotientFacts quotientChunk_003577 894 457948 :=
  checkQuotient_sound quotientChunk_003577 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_004471_facts :
    QuotientFacts quotientChunk_004471 895 457948 :=
  checkQuotient_sound quotientChunk_004471 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_003577_001789_facts :
    QuotientFacts quotientNode_003577_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_003577
    quotientChunk_004471
    894 895 457948
    quotientChunk_003577_facts
    quotientChunk_004471_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_005366_facts :
    QuotientFacts quotientChunk_005366 894 457948 :=
  checkQuotient_sound quotientChunk_005366 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_006260_facts :
    QuotientFacts quotientChunk_006260 895 457948 :=
  checkQuotient_sound quotientChunk_006260 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_005366_001789_facts :
    QuotientFacts quotientNode_005366_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_005366
    quotientChunk_006260
    894 895 457948
    quotientChunk_005366_facts
    quotientChunk_006260_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_003577_003578_facts :
    QuotientFacts quotientNode_003577_003578 3578 457948 :=
  quotient_facts_branch
    quotientNode_003577_001789
    quotientNode_005366_001789
    1789 1789 457948
    quotientNode_003577_001789_facts
    quotientNode_005366_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_000000_007155_facts :
    QuotientFacts quotientNode_000000_007155 7155 457948 :=
  quotient_facts_branch
    quotientNode_000000_003577
    quotientNode_003577_003578
    3577 3578 457948
    quotientNode_000000_003577_facts
    quotientNode_003577_003578_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_007155_facts :
    QuotientFacts quotientChunk_007155 894 457948 :=
  checkQuotient_sound quotientChunk_007155 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_008049_facts :
    QuotientFacts quotientChunk_008049 894 457948 :=
  checkQuotient_sound quotientChunk_008049 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_007155_001788_facts :
    QuotientFacts quotientNode_007155_001788 1788 457948 :=
  quotient_facts_branch
    quotientChunk_007155
    quotientChunk_008049
    894 894 457948
    quotientChunk_007155_facts
    quotientChunk_008049_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_008943_facts :
    QuotientFacts quotientChunk_008943 894 457948 :=
  checkQuotient_sound quotientChunk_008943 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_009837_facts :
    QuotientFacts quotientChunk_009837 895 457948 :=
  checkQuotient_sound quotientChunk_009837 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_008943_001789_facts :
    QuotientFacts quotientNode_008943_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_008943
    quotientChunk_009837
    894 895 457948
    quotientChunk_008943_facts
    quotientChunk_009837_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_007155_003577_facts :
    QuotientFacts quotientNode_007155_003577 3577 457948 :=
  quotient_facts_branch
    quotientNode_007155_001788
    quotientNode_008943_001789
    1788 1789 457948
    quotientNode_007155_001788_facts
    quotientNode_008943_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_010732_facts :
    QuotientFacts quotientChunk_010732 894 457948 :=
  checkQuotient_sound quotientChunk_010732 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_011626_facts :
    QuotientFacts quotientChunk_011626 895 457948 :=
  checkQuotient_sound quotientChunk_011626 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_010732_001789_facts :
    QuotientFacts quotientNode_010732_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_010732
    quotientChunk_011626
    894 895 457948
    quotientChunk_010732_facts
    quotientChunk_011626_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_012521_facts :
    QuotientFacts quotientChunk_012521 894 457948 :=
  checkQuotient_sound quotientChunk_012521 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_013415_facts :
    QuotientFacts quotientChunk_013415 895 457948 :=
  checkQuotient_sound quotientChunk_013415 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_012521_001789_facts :
    QuotientFacts quotientNode_012521_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_012521
    quotientChunk_013415
    894 895 457948
    quotientChunk_012521_facts
    quotientChunk_013415_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_010732_003578_facts :
    QuotientFacts quotientNode_010732_003578 3578 457948 :=
  quotient_facts_branch
    quotientNode_010732_001789
    quotientNode_012521_001789
    1789 1789 457948
    quotientNode_010732_001789_facts
    quotientNode_012521_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_007155_007155_facts :
    QuotientFacts quotientNode_007155_007155 7155 457948 :=
  quotient_facts_branch
    quotientNode_007155_003577
    quotientNode_010732_003578
    3577 3578 457948
    quotientNode_007155_003577_facts
    quotientNode_010732_003578_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_000000_014310_facts :
    QuotientFacts quotientNode_000000_014310 14310 457948 :=
  quotient_facts_branch
    quotientNode_000000_007155
    quotientNode_007155_007155
    7155 7155 457948
    quotientNode_000000_007155_facts
    quotientNode_007155_007155_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_014310_facts :
    QuotientFacts quotientChunk_014310 894 457948 :=
  checkQuotient_sound quotientChunk_014310 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_015204_facts :
    QuotientFacts quotientChunk_015204 894 457948 :=
  checkQuotient_sound quotientChunk_015204 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_014310_001788_facts :
    QuotientFacts quotientNode_014310_001788 1788 457948 :=
  quotient_facts_branch
    quotientChunk_014310
    quotientChunk_015204
    894 894 457948
    quotientChunk_014310_facts
    quotientChunk_015204_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_016098_facts :
    QuotientFacts quotientChunk_016098 894 457948 :=
  checkQuotient_sound quotientChunk_016098 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_016992_facts :
    QuotientFacts quotientChunk_016992 895 457948 :=
  checkQuotient_sound quotientChunk_016992 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_016098_001789_facts :
    QuotientFacts quotientNode_016098_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_016098
    quotientChunk_016992
    894 895 457948
    quotientChunk_016098_facts
    quotientChunk_016992_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_014310_003577_facts :
    QuotientFacts quotientNode_014310_003577 3577 457948 :=
  quotient_facts_branch
    quotientNode_014310_001788
    quotientNode_016098_001789
    1788 1789 457948
    quotientNode_014310_001788_facts
    quotientNode_016098_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_017887_facts :
    QuotientFacts quotientChunk_017887 894 457948 :=
  checkQuotient_sound quotientChunk_017887 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_018781_facts :
    QuotientFacts quotientChunk_018781 895 457948 :=
  checkQuotient_sound quotientChunk_018781 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_017887_001789_facts :
    QuotientFacts quotientNode_017887_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_017887
    quotientChunk_018781
    894 895 457948
    quotientChunk_017887_facts
    quotientChunk_018781_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_019676_facts :
    QuotientFacts quotientChunk_019676 894 457948 :=
  checkQuotient_sound quotientChunk_019676 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_020570_facts :
    QuotientFacts quotientChunk_020570 895 457948 :=
  checkQuotient_sound quotientChunk_020570 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_019676_001789_facts :
    QuotientFacts quotientNode_019676_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_019676
    quotientChunk_020570
    894 895 457948
    quotientChunk_019676_facts
    quotientChunk_020570_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_017887_003578_facts :
    QuotientFacts quotientNode_017887_003578 3578 457948 :=
  quotient_facts_branch
    quotientNode_017887_001789
    quotientNode_019676_001789
    1789 1789 457948
    quotientNode_017887_001789_facts
    quotientNode_019676_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_014310_007155_facts :
    QuotientFacts quotientNode_014310_007155 7155 457948 :=
  quotient_facts_branch
    quotientNode_014310_003577
    quotientNode_017887_003578
    3577 3578 457948
    quotientNode_014310_003577_facts
    quotientNode_017887_003578_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_021465_facts :
    QuotientFacts quotientChunk_021465 894 457948 :=
  checkQuotient_sound quotientChunk_021465 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_022359_facts :
    QuotientFacts quotientChunk_022359 895 457948 :=
  checkQuotient_sound quotientChunk_022359 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_021465_001789_facts :
    QuotientFacts quotientNode_021465_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_021465
    quotientChunk_022359
    894 895 457948
    quotientChunk_021465_facts
    quotientChunk_022359_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_023254_facts :
    QuotientFacts quotientChunk_023254 894 457948 :=
  checkQuotient_sound quotientChunk_023254 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_024148_facts :
    QuotientFacts quotientChunk_024148 895 457948 :=
  checkQuotient_sound quotientChunk_024148 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_023254_001789_facts :
    QuotientFacts quotientNode_023254_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_023254
    quotientChunk_024148
    894 895 457948
    quotientChunk_023254_facts
    quotientChunk_024148_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_021465_003578_facts :
    QuotientFacts quotientNode_021465_003578 3578 457948 :=
  quotient_facts_branch
    quotientNode_021465_001789
    quotientNode_023254_001789
    1789 1789 457948
    quotientNode_021465_001789_facts
    quotientNode_023254_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_025043_facts :
    QuotientFacts quotientChunk_025043 894 457948 :=
  checkQuotient_sound quotientChunk_025043 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_025937_facts :
    QuotientFacts quotientChunk_025937 895 457948 :=
  checkQuotient_sound quotientChunk_025937 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_025043_001789_facts :
    QuotientFacts quotientNode_025043_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_025043
    quotientChunk_025937
    894 895 457948
    quotientChunk_025043_facts
    quotientChunk_025937_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_026832_facts :
    QuotientFacts quotientChunk_026832 894 457948 :=
  checkQuotient_sound quotientChunk_026832 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_027726_facts :
    QuotientFacts quotientChunk_027726 895 457948 :=
  checkQuotient_sound quotientChunk_027726 457948 895 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/quotient-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t32\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_026832_001789_facts :
    QuotientFacts quotientNode_026832_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_026832
    quotientChunk_027726
    894 895 457948
    quotientChunk_026832_facts
    quotientChunk_027726_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_025043_003578_facts :
    QuotientFacts quotientNode_025043_003578 3578 457948 :=
  quotient_facts_branch
    quotientNode_025043_001789
    quotientNode_026832_001789
    1789 1789 457948
    quotientNode_025043_001789_facts
    quotientNode_026832_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_021465_007156_facts :
    QuotientFacts quotientNode_021465_007156 7156 457948 :=
  quotient_facts_branch
    quotientNode_021465_003578
    quotientNode_025043_003578
    3578 3578 457948
    quotientNode_021465_003578_facts
    quotientNode_025043_003578_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_014310_014311_facts :
    QuotientFacts quotientNode_014310_014311 14311 457948 :=
  quotient_facts_branch
    quotientNode_014310_007155
    quotientNode_021465_007156
    7155 7156 457948
    quotientNode_014310_007155_facts
    quotientNode_021465_007156_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_000000_028621_facts :
    QuotientFacts quotientNode_000000_028621 28621 457948 :=
  quotient_facts_branch
    quotientNode_000000_014310
    quotientNode_014310_014311
    14310 14311 457948
    quotientNode_000000_014310_facts
    quotientNode_014310_014311_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_028621_facts :
    QuotientFacts quotientChunk_028621 894 457948 :=
  checkQuotient_sound quotientChunk_028621 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_029515_facts :
    QuotientFacts quotientChunk_029515 894 457948 :=
  checkQuotient_sound quotientChunk_029515 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_028621_001788_facts :
    QuotientFacts quotientNode_028621_001788 1788 457948 :=
  quotient_facts_branch
    quotientChunk_028621
    quotientChunk_029515
    894 894 457948
    quotientChunk_028621_facts
    quotientChunk_029515_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_030409_facts :
    QuotientFacts quotientChunk_030409 894 457948 :=
  checkQuotient_sound quotientChunk_030409 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_031303_facts :
    QuotientFacts quotientChunk_031303 895 457948 :=
  checkQuotient_sound quotientChunk_031303 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_030409_001789_facts :
    QuotientFacts quotientNode_030409_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_030409
    quotientChunk_031303
    894 895 457948
    quotientChunk_030409_facts
    quotientChunk_031303_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_028621_003577_facts :
    QuotientFacts quotientNode_028621_003577 3577 457948 :=
  quotient_facts_branch
    quotientNode_028621_001788
    quotientNode_030409_001789
    1788 1789 457948
    quotientNode_028621_001788_facts
    quotientNode_030409_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_032198_facts :
    QuotientFacts quotientChunk_032198 894 457948 :=
  checkQuotient_sound quotientChunk_032198 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_033092_facts :
    QuotientFacts quotientChunk_033092 895 457948 :=
  checkQuotient_sound quotientChunk_033092 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_032198_001789_facts :
    QuotientFacts quotientNode_032198_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_032198
    quotientChunk_033092
    894 895 457948
    quotientChunk_032198_facts
    quotientChunk_033092_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_033987_facts :
    QuotientFacts quotientChunk_033987 894 457948 :=
  checkQuotient_sound quotientChunk_033987 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_034881_facts :
    QuotientFacts quotientChunk_034881 895 457948 :=
  checkQuotient_sound quotientChunk_034881 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_033987_001789_facts :
    QuotientFacts quotientNode_033987_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_033987
    quotientChunk_034881
    894 895 457948
    quotientChunk_033987_facts
    quotientChunk_034881_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_032198_003578_facts :
    QuotientFacts quotientNode_032198_003578 3578 457948 :=
  quotient_facts_branch
    quotientNode_032198_001789
    quotientNode_033987_001789
    1789 1789 457948
    quotientNode_032198_001789_facts
    quotientNode_033987_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_028621_007155_facts :
    QuotientFacts quotientNode_028621_007155 7155 457948 :=
  quotient_facts_branch
    quotientNode_028621_003577
    quotientNode_032198_003578
    3577 3578 457948
    quotientNode_028621_003577_facts
    quotientNode_032198_003578_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_035776_facts :
    QuotientFacts quotientChunk_035776 894 457948 :=
  checkQuotient_sound quotientChunk_035776 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_036670_facts :
    QuotientFacts quotientChunk_036670 895 457948 :=
  checkQuotient_sound quotientChunk_036670 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_035776_001789_facts :
    QuotientFacts quotientNode_035776_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_035776
    quotientChunk_036670
    894 895 457948
    quotientChunk_035776_facts
    quotientChunk_036670_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_037565_facts :
    QuotientFacts quotientChunk_037565 894 457948 :=
  checkQuotient_sound quotientChunk_037565 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_038459_facts :
    QuotientFacts quotientChunk_038459 895 457948 :=
  checkQuotient_sound quotientChunk_038459 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_037565_001789_facts :
    QuotientFacts quotientNode_037565_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_037565
    quotientChunk_038459
    894 895 457948
    quotientChunk_037565_facts
    quotientChunk_038459_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_035776_003578_facts :
    QuotientFacts quotientNode_035776_003578 3578 457948 :=
  quotient_facts_branch
    quotientNode_035776_001789
    quotientNode_037565_001789
    1789 1789 457948
    quotientNode_035776_001789_facts
    quotientNode_037565_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_039354_facts :
    QuotientFacts quotientChunk_039354 894 457948 :=
  checkQuotient_sound quotientChunk_039354 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_040248_facts :
    QuotientFacts quotientChunk_040248 895 457948 :=
  checkQuotient_sound quotientChunk_040248 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_039354_001789_facts :
    QuotientFacts quotientNode_039354_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_039354
    quotientChunk_040248
    894 895 457948
    quotientChunk_039354_facts
    quotientChunk_040248_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_041143_facts :
    QuotientFacts quotientChunk_041143 894 457948 :=
  checkQuotient_sound quotientChunk_041143 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_042037_facts :
    QuotientFacts quotientChunk_042037 895 457948 :=
  checkQuotient_sound quotientChunk_042037 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_041143_001789_facts :
    QuotientFacts quotientNode_041143_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_041143
    quotientChunk_042037
    894 895 457948
    quotientChunk_041143_facts
    quotientChunk_042037_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_039354_003578_facts :
    QuotientFacts quotientNode_039354_003578 3578 457948 :=
  quotient_facts_branch
    quotientNode_039354_001789
    quotientNode_041143_001789
    1789 1789 457948
    quotientNode_039354_001789_facts
    quotientNode_041143_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_035776_007156_facts :
    QuotientFacts quotientNode_035776_007156 7156 457948 :=
  quotient_facts_branch
    quotientNode_035776_003578
    quotientNode_039354_003578
    3578 3578 457948
    quotientNode_035776_003578_facts
    quotientNode_039354_003578_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_028621_014311_facts :
    QuotientFacts quotientNode_028621_014311 14311 457948 :=
  quotient_facts_branch
    quotientNode_028621_007155
    quotientNode_035776_007156
    7155 7156 457948
    quotientNode_028621_007155_facts
    quotientNode_035776_007156_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_042932_facts :
    QuotientFacts quotientChunk_042932 894 457948 :=
  checkQuotient_sound quotientChunk_042932 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_043826_facts :
    QuotientFacts quotientChunk_043826 894 457948 :=
  checkQuotient_sound quotientChunk_043826 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_042932_001788_facts :
    QuotientFacts quotientNode_042932_001788 1788 457948 :=
  quotient_facts_branch
    quotientChunk_042932
    quotientChunk_043826
    894 894 457948
    quotientChunk_042932_facts
    quotientChunk_043826_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_044720_facts :
    QuotientFacts quotientChunk_044720 894 457948 :=
  checkQuotient_sound quotientChunk_044720 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_045614_facts :
    QuotientFacts quotientChunk_045614 895 457948 :=
  checkQuotient_sound quotientChunk_045614 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_044720_001789_facts :
    QuotientFacts quotientNode_044720_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_044720
    quotientChunk_045614
    894 895 457948
    quotientChunk_044720_facts
    quotientChunk_045614_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_042932_003577_facts :
    QuotientFacts quotientNode_042932_003577 3577 457948 :=
  quotient_facts_branch
    quotientNode_042932_001788
    quotientNode_044720_001789
    1788 1789 457948
    quotientNode_042932_001788_facts
    quotientNode_044720_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_046509_facts :
    QuotientFacts quotientChunk_046509 894 457948 :=
  checkQuotient_sound quotientChunk_046509 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_047403_facts :
    QuotientFacts quotientChunk_047403 895 457948 :=
  checkQuotient_sound quotientChunk_047403 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_046509_001789_facts :
    QuotientFacts quotientNode_046509_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_046509
    quotientChunk_047403
    894 895 457948
    quotientChunk_046509_facts
    quotientChunk_047403_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_048298_facts :
    QuotientFacts quotientChunk_048298 894 457948 :=
  checkQuotient_sound quotientChunk_048298 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_049192_facts :
    QuotientFacts quotientChunk_049192 895 457948 :=
  checkQuotient_sound quotientChunk_049192 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_048298_001789_facts :
    QuotientFacts quotientNode_048298_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_048298
    quotientChunk_049192
    894 895 457948
    quotientChunk_048298_facts
    quotientChunk_049192_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_046509_003578_facts :
    QuotientFacts quotientNode_046509_003578 3578 457948 :=
  quotient_facts_branch
    quotientNode_046509_001789
    quotientNode_048298_001789
    1789 1789 457948
    quotientNode_046509_001789_facts
    quotientNode_048298_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_042932_007155_facts :
    QuotientFacts quotientNode_042932_007155 7155 457948 :=
  quotient_facts_branch
    quotientNode_042932_003577
    quotientNode_046509_003578
    3577 3578 457948
    quotientNode_042932_003577_facts
    quotientNode_046509_003578_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_050087_facts :
    QuotientFacts quotientChunk_050087 894 457948 :=
  checkQuotient_sound quotientChunk_050087 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_050981_facts :
    QuotientFacts quotientChunk_050981 895 457948 :=
  checkQuotient_sound quotientChunk_050981 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_050087_001789_facts :
    QuotientFacts quotientNode_050087_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_050087
    quotientChunk_050981
    894 895 457948
    quotientChunk_050087_facts
    quotientChunk_050981_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_051876_facts :
    QuotientFacts quotientChunk_051876 894 457948 :=
  checkQuotient_sound quotientChunk_051876 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_052770_facts :
    QuotientFacts quotientChunk_052770 895 457948 :=
  checkQuotient_sound quotientChunk_052770 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_051876_001789_facts :
    QuotientFacts quotientNode_051876_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_051876
    quotientChunk_052770
    894 895 457948
    quotientChunk_051876_facts
    quotientChunk_052770_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_050087_003578_facts :
    QuotientFacts quotientNode_050087_003578 3578 457948 :=
  quotient_facts_branch
    quotientNode_050087_001789
    quotientNode_051876_001789
    1789 1789 457948
    quotientNode_050087_001789_facts
    quotientNode_051876_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_053665_facts :
    QuotientFacts quotientChunk_053665 894 457948 :=
  checkQuotient_sound quotientChunk_053665 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_054559_facts :
    QuotientFacts quotientChunk_054559 895 457948 :=
  checkQuotient_sound quotientChunk_054559 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_053665_001789_facts :
    QuotientFacts quotientNode_053665_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_053665
    quotientChunk_054559
    894 895 457948
    quotientChunk_053665_facts
    quotientChunk_054559_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_055454_facts :
    QuotientFacts quotientChunk_055454 894 457948 :=
  checkQuotient_sound quotientChunk_055454 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_056348_facts :
    QuotientFacts quotientChunk_056348 895 457948 :=
  checkQuotient_sound quotientChunk_056348 457948 895 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/quotient-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t64\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_055454_001789_facts :
    QuotientFacts quotientNode_055454_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_055454
    quotientChunk_056348
    894 895 457948
    quotientChunk_055454_facts
    quotientChunk_056348_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_053665_003578_facts :
    QuotientFacts quotientNode_053665_003578 3578 457948 :=
  quotient_facts_branch
    quotientNode_053665_001789
    quotientNode_055454_001789
    1789 1789 457948
    quotientNode_053665_001789_facts
    quotientNode_055454_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_050087_007156_facts :
    QuotientFacts quotientNode_050087_007156 7156 457948 :=
  quotient_facts_branch
    quotientNode_050087_003578
    quotientNode_053665_003578
    3578 3578 457948
    quotientNode_050087_003578_facts
    quotientNode_053665_003578_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_042932_014311_facts :
    QuotientFacts quotientNode_042932_014311 14311 457948 :=
  quotient_facts_branch
    quotientNode_042932_007155
    quotientNode_050087_007156
    7155 7156 457948
    quotientNode_042932_007155_facts
    quotientNode_050087_007156_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_028621_028622_facts :
    QuotientFacts quotientNode_028621_028622 28622 457948 :=
  quotient_facts_branch
    quotientNode_028621_014311
    quotientNode_042932_014311
    14311 14311 457948
    quotientNode_028621_014311_facts
    quotientNode_042932_014311_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_000000_057243_facts :
    QuotientFacts quotientNode_000000_057243 57243 457948 :=
  quotient_facts_branch
    quotientNode_000000_028621
    quotientNode_028621_028622
    28621 28622 457948
    quotientNode_000000_028621_facts
    quotientNode_028621_028622_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_057243_facts :
    QuotientFacts quotientChunk_057243 894 457948 :=
  checkQuotient_sound quotientChunk_057243 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_058137_facts :
    QuotientFacts quotientChunk_058137 894 457948 :=
  checkQuotient_sound quotientChunk_058137 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_057243_001788_facts :
    QuotientFacts quotientNode_057243_001788 1788 457948 :=
  quotient_facts_branch
    quotientChunk_057243
    quotientChunk_058137
    894 894 457948
    quotientChunk_057243_facts
    quotientChunk_058137_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_059031_facts :
    QuotientFacts quotientChunk_059031 894 457948 :=
  checkQuotient_sound quotientChunk_059031 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_059925_facts :
    QuotientFacts quotientChunk_059925 895 457948 :=
  checkQuotient_sound quotientChunk_059925 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_059031_001789_facts :
    QuotientFacts quotientNode_059031_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_059031
    quotientChunk_059925
    894 895 457948
    quotientChunk_059031_facts
    quotientChunk_059925_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_057243_003577_facts :
    QuotientFacts quotientNode_057243_003577 3577 457948 :=
  quotient_facts_branch
    quotientNode_057243_001788
    quotientNode_059031_001789
    1788 1789 457948
    quotientNode_057243_001788_facts
    quotientNode_059031_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_060820_facts :
    QuotientFacts quotientChunk_060820 894 457948 :=
  checkQuotient_sound quotientChunk_060820 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_061714_facts :
    QuotientFacts quotientChunk_061714 895 457948 :=
  checkQuotient_sound quotientChunk_061714 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_060820_001789_facts :
    QuotientFacts quotientNode_060820_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_060820
    quotientChunk_061714
    894 895 457948
    quotientChunk_060820_facts
    quotientChunk_061714_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_062609_facts :
    QuotientFacts quotientChunk_062609 894 457948 :=
  checkQuotient_sound quotientChunk_062609 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_063503_facts :
    QuotientFacts quotientChunk_063503 895 457948 :=
  checkQuotient_sound quotientChunk_063503 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_062609_001789_facts :
    QuotientFacts quotientNode_062609_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_062609
    quotientChunk_063503
    894 895 457948
    quotientChunk_062609_facts
    quotientChunk_063503_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_060820_003578_facts :
    QuotientFacts quotientNode_060820_003578 3578 457948 :=
  quotient_facts_branch
    quotientNode_060820_001789
    quotientNode_062609_001789
    1789 1789 457948
    quotientNode_060820_001789_facts
    quotientNode_062609_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_057243_007155_facts :
    QuotientFacts quotientNode_057243_007155 7155 457948 :=
  quotient_facts_branch
    quotientNode_057243_003577
    quotientNode_060820_003578
    3577 3578 457948
    quotientNode_057243_003577_facts
    quotientNode_060820_003578_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_064398_facts :
    QuotientFacts quotientChunk_064398 894 457948 :=
  checkQuotient_sound quotientChunk_064398 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_065292_facts :
    QuotientFacts quotientChunk_065292 895 457948 :=
  checkQuotient_sound quotientChunk_065292 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_064398_001789_facts :
    QuotientFacts quotientNode_064398_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_064398
    quotientChunk_065292
    894 895 457948
    quotientChunk_064398_facts
    quotientChunk_065292_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_066187_facts :
    QuotientFacts quotientChunk_066187 894 457948 :=
  checkQuotient_sound quotientChunk_066187 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_067081_facts :
    QuotientFacts quotientChunk_067081 895 457948 :=
  checkQuotient_sound quotientChunk_067081 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_066187_001789_facts :
    QuotientFacts quotientNode_066187_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_066187
    quotientChunk_067081
    894 895 457948
    quotientChunk_066187_facts
    quotientChunk_067081_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_064398_003578_facts :
    QuotientFacts quotientNode_064398_003578 3578 457948 :=
  quotient_facts_branch
    quotientNode_064398_001789
    quotientNode_066187_001789
    1789 1789 457948
    quotientNode_064398_001789_facts
    quotientNode_066187_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_067976_facts :
    QuotientFacts quotientChunk_067976 894 457948 :=
  checkQuotient_sound quotientChunk_067976 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_068870_facts :
    QuotientFacts quotientChunk_068870 895 457948 :=
  checkQuotient_sound quotientChunk_068870 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_067976_001789_facts :
    QuotientFacts quotientNode_067976_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_067976
    quotientChunk_068870
    894 895 457948
    quotientChunk_067976_facts
    quotientChunk_068870_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_069765_facts :
    QuotientFacts quotientChunk_069765 894 457948 :=
  checkQuotient_sound quotientChunk_069765 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_070659_facts :
    QuotientFacts quotientChunk_070659 895 457948 :=
  checkQuotient_sound quotientChunk_070659 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_069765_001789_facts :
    QuotientFacts quotientNode_069765_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_069765
    quotientChunk_070659
    894 895 457948
    quotientChunk_069765_facts
    quotientChunk_070659_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_067976_003578_facts :
    QuotientFacts quotientNode_067976_003578 3578 457948 :=
  quotient_facts_branch
    quotientNode_067976_001789
    quotientNode_069765_001789
    1789 1789 457948
    quotientNode_067976_001789_facts
    quotientNode_069765_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_064398_007156_facts :
    QuotientFacts quotientNode_064398_007156 7156 457948 :=
  quotient_facts_branch
    quotientNode_064398_003578
    quotientNode_067976_003578
    3578 3578 457948
    quotientNode_064398_003578_facts
    quotientNode_067976_003578_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_057243_014311_facts :
    QuotientFacts quotientNode_057243_014311 14311 457948 :=
  quotient_facts_branch
    quotientNode_057243_007155
    quotientNode_064398_007156
    7155 7156 457948
    quotientNode_057243_007155_facts
    quotientNode_064398_007156_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_071554_facts :
    QuotientFacts quotientChunk_071554 894 457948 :=
  checkQuotient_sound quotientChunk_071554 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_072448_facts :
    QuotientFacts quotientChunk_072448 894 457948 :=
  checkQuotient_sound quotientChunk_072448 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_071554_001788_facts :
    QuotientFacts quotientNode_071554_001788 1788 457948 :=
  quotient_facts_branch
    quotientChunk_071554
    quotientChunk_072448
    894 894 457948
    quotientChunk_071554_facts
    quotientChunk_072448_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_073342_facts :
    QuotientFacts quotientChunk_073342 894 457948 :=
  checkQuotient_sound quotientChunk_073342 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_074236_facts :
    QuotientFacts quotientChunk_074236 895 457948 :=
  checkQuotient_sound quotientChunk_074236 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_073342_001789_facts :
    QuotientFacts quotientNode_073342_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_073342
    quotientChunk_074236
    894 895 457948
    quotientChunk_073342_facts
    quotientChunk_074236_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_071554_003577_facts :
    QuotientFacts quotientNode_071554_003577 3577 457948 :=
  quotient_facts_branch
    quotientNode_071554_001788
    quotientNode_073342_001789
    1788 1789 457948
    quotientNode_071554_001788_facts
    quotientNode_073342_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_075131_facts :
    QuotientFacts quotientChunk_075131 894 457948 :=
  checkQuotient_sound quotientChunk_075131 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_076025_facts :
    QuotientFacts quotientChunk_076025 895 457948 :=
  checkQuotient_sound quotientChunk_076025 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_075131_001789_facts :
    QuotientFacts quotientNode_075131_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_075131
    quotientChunk_076025
    894 895 457948
    quotientChunk_075131_facts
    quotientChunk_076025_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_076920_facts :
    QuotientFacts quotientChunk_076920 894 457948 :=
  checkQuotient_sound quotientChunk_076920 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_077814_facts :
    QuotientFacts quotientChunk_077814 895 457948 :=
  checkQuotient_sound quotientChunk_077814 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_076920_001789_facts :
    QuotientFacts quotientNode_076920_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_076920
    quotientChunk_077814
    894 895 457948
    quotientChunk_076920_facts
    quotientChunk_077814_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_075131_003578_facts :
    QuotientFacts quotientNode_075131_003578 3578 457948 :=
  quotient_facts_branch
    quotientNode_075131_001789
    quotientNode_076920_001789
    1789 1789 457948
    quotientNode_075131_001789_facts
    quotientNode_076920_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_071554_007155_facts :
    QuotientFacts quotientNode_071554_007155 7155 457948 :=
  quotient_facts_branch
    quotientNode_071554_003577
    quotientNode_075131_003578
    3577 3578 457948
    quotientNode_071554_003577_facts
    quotientNode_075131_003578_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_078709_facts :
    QuotientFacts quotientChunk_078709 894 457948 :=
  checkQuotient_sound quotientChunk_078709 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_079603_facts :
    QuotientFacts quotientChunk_079603 895 457948 :=
  checkQuotient_sound quotientChunk_079603 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_078709_001789_facts :
    QuotientFacts quotientNode_078709_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_078709
    quotientChunk_079603
    894 895 457948
    quotientChunk_078709_facts
    quotientChunk_079603_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_080498_facts :
    QuotientFacts quotientChunk_080498 894 457948 :=
  checkQuotient_sound quotientChunk_080498 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_081392_facts :
    QuotientFacts quotientChunk_081392 895 457948 :=
  checkQuotient_sound quotientChunk_081392 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_080498_001789_facts :
    QuotientFacts quotientNode_080498_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_080498
    quotientChunk_081392
    894 895 457948
    quotientChunk_080498_facts
    quotientChunk_081392_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_078709_003578_facts :
    QuotientFacts quotientNode_078709_003578 3578 457948 :=
  quotient_facts_branch
    quotientNode_078709_001789
    quotientNode_080498_001789
    1789 1789 457948
    quotientNode_078709_001789_facts
    quotientNode_080498_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_082287_facts :
    QuotientFacts quotientChunk_082287 894 457948 :=
  checkQuotient_sound quotientChunk_082287 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_083181_facts :
    QuotientFacts quotientChunk_083181 895 457948 :=
  checkQuotient_sound quotientChunk_083181 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_082287_001789_facts :
    QuotientFacts quotientNode_082287_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_082287
    quotientChunk_083181
    894 895 457948
    quotientChunk_082287_facts
    quotientChunk_083181_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_084076_facts :
    QuotientFacts quotientChunk_084076 894 457948 :=
  checkQuotient_sound quotientChunk_084076 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_084970_facts :
    QuotientFacts quotientChunk_084970 895 457948 :=
  checkQuotient_sound quotientChunk_084970 457948 895 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/quotient-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t96\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_084076_001789_facts :
    QuotientFacts quotientNode_084076_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_084076
    quotientChunk_084970
    894 895 457948
    quotientChunk_084076_facts
    quotientChunk_084970_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_082287_003578_facts :
    QuotientFacts quotientNode_082287_003578 3578 457948 :=
  quotient_facts_branch
    quotientNode_082287_001789
    quotientNode_084076_001789
    1789 1789 457948
    quotientNode_082287_001789_facts
    quotientNode_084076_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_078709_007156_facts :
    QuotientFacts quotientNode_078709_007156 7156 457948 :=
  quotient_facts_branch
    quotientNode_078709_003578
    quotientNode_082287_003578
    3578 3578 457948
    quotientNode_078709_003578_facts
    quotientNode_082287_003578_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_071554_014311_facts :
    QuotientFacts quotientNode_071554_014311 14311 457948 :=
  quotient_facts_branch
    quotientNode_071554_007155
    quotientNode_078709_007156
    7155 7156 457948
    quotientNode_071554_007155_facts
    quotientNode_078709_007156_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_057243_028622_facts :
    QuotientFacts quotientNode_057243_028622 28622 457948 :=
  quotient_facts_branch
    quotientNode_057243_014311
    quotientNode_071554_014311
    14311 14311 457948
    quotientNode_057243_014311_facts
    quotientNode_071554_014311_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_085865_facts :
    QuotientFacts quotientChunk_085865 894 457948 :=
  checkQuotient_sound quotientChunk_085865 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_086759_facts :
    QuotientFacts quotientChunk_086759 894 457948 :=
  checkQuotient_sound quotientChunk_086759 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_085865_001788_facts :
    QuotientFacts quotientNode_085865_001788 1788 457948 :=
  quotient_facts_branch
    quotientChunk_085865
    quotientChunk_086759
    894 894 457948
    quotientChunk_085865_facts
    quotientChunk_086759_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_087653_facts :
    QuotientFacts quotientChunk_087653 894 457948 :=
  checkQuotient_sound quotientChunk_087653 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_088547_facts :
    QuotientFacts quotientChunk_088547 895 457948 :=
  checkQuotient_sound quotientChunk_088547 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_087653_001789_facts :
    QuotientFacts quotientNode_087653_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_087653
    quotientChunk_088547
    894 895 457948
    quotientChunk_087653_facts
    quotientChunk_088547_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_085865_003577_facts :
    QuotientFacts quotientNode_085865_003577 3577 457948 :=
  quotient_facts_branch
    quotientNode_085865_001788
    quotientNode_087653_001789
    1788 1789 457948
    quotientNode_085865_001788_facts
    quotientNode_087653_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_089442_facts :
    QuotientFacts quotientChunk_089442 894 457948 :=
  checkQuotient_sound quotientChunk_089442 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_090336_facts :
    QuotientFacts quotientChunk_090336 895 457948 :=
  checkQuotient_sound quotientChunk_090336 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_089442_001789_facts :
    QuotientFacts quotientNode_089442_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_089442
    quotientChunk_090336
    894 895 457948
    quotientChunk_089442_facts
    quotientChunk_090336_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_091231_facts :
    QuotientFacts quotientChunk_091231 894 457948 :=
  checkQuotient_sound quotientChunk_091231 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_092125_facts :
    QuotientFacts quotientChunk_092125 895 457948 :=
  checkQuotient_sound quotientChunk_092125 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_091231_001789_facts :
    QuotientFacts quotientNode_091231_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_091231
    quotientChunk_092125
    894 895 457948
    quotientChunk_091231_facts
    quotientChunk_092125_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_089442_003578_facts :
    QuotientFacts quotientNode_089442_003578 3578 457948 :=
  quotient_facts_branch
    quotientNode_089442_001789
    quotientNode_091231_001789
    1789 1789 457948
    quotientNode_089442_001789_facts
    quotientNode_091231_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_085865_007155_facts :
    QuotientFacts quotientNode_085865_007155 7155 457948 :=
  quotient_facts_branch
    quotientNode_085865_003577
    quotientNode_089442_003578
    3577 3578 457948
    quotientNode_085865_003577_facts
    quotientNode_089442_003578_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_093020_facts :
    QuotientFacts quotientChunk_093020 894 457948 :=
  checkQuotient_sound quotientChunk_093020 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_093914_facts :
    QuotientFacts quotientChunk_093914 895 457948 :=
  checkQuotient_sound quotientChunk_093914 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_093020_001789_facts :
    QuotientFacts quotientNode_093020_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_093020
    quotientChunk_093914
    894 895 457948
    quotientChunk_093020_facts
    quotientChunk_093914_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_094809_facts :
    QuotientFacts quotientChunk_094809 894 457948 :=
  checkQuotient_sound quotientChunk_094809 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_095703_facts :
    QuotientFacts quotientChunk_095703 895 457948 :=
  checkQuotient_sound quotientChunk_095703 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_094809_001789_facts :
    QuotientFacts quotientNode_094809_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_094809
    quotientChunk_095703
    894 895 457948
    quotientChunk_094809_facts
    quotientChunk_095703_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_093020_003578_facts :
    QuotientFacts quotientNode_093020_003578 3578 457948 :=
  quotient_facts_branch
    quotientNode_093020_001789
    quotientNode_094809_001789
    1789 1789 457948
    quotientNode_093020_001789_facts
    quotientNode_094809_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_096598_facts :
    QuotientFacts quotientChunk_096598 894 457948 :=
  checkQuotient_sound quotientChunk_096598 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_097492_facts :
    QuotientFacts quotientChunk_097492 895 457948 :=
  checkQuotient_sound quotientChunk_097492 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_096598_001789_facts :
    QuotientFacts quotientNode_096598_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_096598
    quotientChunk_097492
    894 895 457948
    quotientChunk_096598_facts
    quotientChunk_097492_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_098387_facts :
    QuotientFacts quotientChunk_098387 894 457948 :=
  checkQuotient_sound quotientChunk_098387 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_099281_facts :
    QuotientFacts quotientChunk_099281 895 457948 :=
  checkQuotient_sound quotientChunk_099281 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_098387_001789_facts :
    QuotientFacts quotientNode_098387_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_098387
    quotientChunk_099281
    894 895 457948
    quotientChunk_098387_facts
    quotientChunk_099281_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_096598_003578_facts :
    QuotientFacts quotientNode_096598_003578 3578 457948 :=
  quotient_facts_branch
    quotientNode_096598_001789
    quotientNode_098387_001789
    1789 1789 457948
    quotientNode_096598_001789_facts
    quotientNode_098387_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_093020_007156_facts :
    QuotientFacts quotientNode_093020_007156 7156 457948 :=
  quotient_facts_branch
    quotientNode_093020_003578
    quotientNode_096598_003578
    3578 3578 457948
    quotientNode_093020_003578_facts
    quotientNode_096598_003578_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_085865_014311_facts :
    QuotientFacts quotientNode_085865_014311 14311 457948 :=
  quotient_facts_branch
    quotientNode_085865_007155
    quotientNode_093020_007156
    7155 7156 457948
    quotientNode_085865_007155_facts
    quotientNode_093020_007156_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_100176_facts :
    QuotientFacts quotientChunk_100176 894 457948 :=
  checkQuotient_sound quotientChunk_100176 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_101070_facts :
    QuotientFacts quotientChunk_101070 894 457948 :=
  checkQuotient_sound quotientChunk_101070 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_100176_001788_facts :
    QuotientFacts quotientNode_100176_001788 1788 457948 :=
  quotient_facts_branch
    quotientChunk_100176
    quotientChunk_101070
    894 894 457948
    quotientChunk_100176_facts
    quotientChunk_101070_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_101964_facts :
    QuotientFacts quotientChunk_101964 894 457948 :=
  checkQuotient_sound quotientChunk_101964 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_102858_facts :
    QuotientFacts quotientChunk_102858 895 457948 :=
  checkQuotient_sound quotientChunk_102858 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_101964_001789_facts :
    QuotientFacts quotientNode_101964_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_101964
    quotientChunk_102858
    894 895 457948
    quotientChunk_101964_facts
    quotientChunk_102858_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_100176_003577_facts :
    QuotientFacts quotientNode_100176_003577 3577 457948 :=
  quotient_facts_branch
    quotientNode_100176_001788
    quotientNode_101964_001789
    1788 1789 457948
    quotientNode_100176_001788_facts
    quotientNode_101964_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_103753_facts :
    QuotientFacts quotientChunk_103753 894 457948 :=
  checkQuotient_sound quotientChunk_103753 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_104647_facts :
    QuotientFacts quotientChunk_104647 895 457948 :=
  checkQuotient_sound quotientChunk_104647 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_103753_001789_facts :
    QuotientFacts quotientNode_103753_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_103753
    quotientChunk_104647
    894 895 457948
    quotientChunk_103753_facts
    quotientChunk_104647_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_105542_facts :
    QuotientFacts quotientChunk_105542 894 457948 :=
  checkQuotient_sound quotientChunk_105542 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_106436_facts :
    QuotientFacts quotientChunk_106436 895 457948 :=
  checkQuotient_sound quotientChunk_106436 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_105542_001789_facts :
    QuotientFacts quotientNode_105542_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_105542
    quotientChunk_106436
    894 895 457948
    quotientChunk_105542_facts
    quotientChunk_106436_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_103753_003578_facts :
    QuotientFacts quotientNode_103753_003578 3578 457948 :=
  quotient_facts_branch
    quotientNode_103753_001789
    quotientNode_105542_001789
    1789 1789 457948
    quotientNode_103753_001789_facts
    quotientNode_105542_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_100176_007155_facts :
    QuotientFacts quotientNode_100176_007155 7155 457948 :=
  quotient_facts_branch
    quotientNode_100176_003577
    quotientNode_103753_003578
    3577 3578 457948
    quotientNode_100176_003577_facts
    quotientNode_103753_003578_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_107331_facts :
    QuotientFacts quotientChunk_107331 894 457948 :=
  checkQuotient_sound quotientChunk_107331 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_108225_facts :
    QuotientFacts quotientChunk_108225 895 457948 :=
  checkQuotient_sound quotientChunk_108225 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_107331_001789_facts :
    QuotientFacts quotientNode_107331_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_107331
    quotientChunk_108225
    894 895 457948
    quotientChunk_107331_facts
    quotientChunk_108225_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_109120_facts :
    QuotientFacts quotientChunk_109120 894 457948 :=
  checkQuotient_sound quotientChunk_109120 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_110014_facts :
    QuotientFacts quotientChunk_110014 895 457948 :=
  checkQuotient_sound quotientChunk_110014 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_109120_001789_facts :
    QuotientFacts quotientNode_109120_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_109120
    quotientChunk_110014
    894 895 457948
    quotientChunk_109120_facts
    quotientChunk_110014_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_107331_003578_facts :
    QuotientFacts quotientNode_107331_003578 3578 457948 :=
  quotient_facts_branch
    quotientNode_107331_001789
    quotientNode_109120_001789
    1789 1789 457948
    quotientNode_107331_001789_facts
    quotientNode_109120_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_110909_facts :
    QuotientFacts quotientChunk_110909 894 457948 :=
  checkQuotient_sound quotientChunk_110909 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_111803_facts :
    QuotientFacts quotientChunk_111803 895 457948 :=
  checkQuotient_sound quotientChunk_111803 457948 895 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_110909_001789_facts :
    QuotientFacts quotientNode_110909_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_110909
    quotientChunk_111803
    894 895 457948
    quotientChunk_110909_facts
    quotientChunk_111803_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_112698_facts :
    QuotientFacts quotientChunk_112698 894 457948 :=
  checkQuotient_sound quotientChunk_112698 457948 894 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientChunk_113592_facts :
    QuotientFacts quotientChunk_113592 895 457948 :=
  checkQuotient_sound quotientChunk_113592 457948 895 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/quotient-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t128\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_112698_001789_facts :
    QuotientFacts quotientNode_112698_001789 1789 457948 :=
  quotient_facts_branch
    quotientChunk_112698
    quotientChunk_113592
    894 895 457948
    quotientChunk_112698_facts
    quotientChunk_113592_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_110909_003578_facts :
    QuotientFacts quotientNode_110909_003578 3578 457948 :=
  quotient_facts_branch
    quotientNode_110909_001789
    quotientNode_112698_001789
    1789 1789 457948
    quotientNode_110909_001789_facts
    quotientNode_112698_001789_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_107331_007156_facts :
    QuotientFacts quotientNode_107331_007156 7156 457948 :=
  quotient_facts_branch
    quotientNode_107331_003578
    quotientNode_110909_003578
    3578 3578 457948
    quotientNode_107331_003578_facts
    quotientNode_110909_003578_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_100176_014311_facts :
    QuotientFacts quotientNode_100176_014311 14311 457948 :=
  quotient_facts_branch
    quotientNode_100176_007155
    quotientNode_107331_007156
    7155 7156 457948
    quotientNode_100176_007155_facts
    quotientNode_107331_007156_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_085865_028622_facts :
    QuotientFacts quotientNode_085865_028622 28622 457948 :=
  quotient_facts_branch
    quotientNode_085865_014311
    quotientNode_100176_014311
    14311 14311 457948
    quotientNode_085865_014311_facts
    quotientNode_100176_014311_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_057243_057244_facts :
    QuotientFacts quotientNode_057243_057244 57244 457948 :=
  quotient_facts_branch
    quotientNode_057243_028622
    quotientNode_085865_028622
    28622 28622 457948
    quotientNode_057243_028622_facts
    quotientNode_085865_028622_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotientNode_000000_114487_facts :
    QuotientFacts quotientNode_000000_114487 114487 457948 :=
  quotient_facts_branch
    quotientNode_000000_057243
    quotientNode_057243_057244
    57243 57244 457948
    quotientNode_000000_057243_facts
    quotientNode_057243_057244_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotient_facts :
    QuotientFacts quotientTree 114487 457948 :=
  quotientNode_000000_114487_facts
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/quotient-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t128\t{now}"
      handle.flush
def quotient : Machine 114487 2 := packedMachine 114487 quotientTree
theorem quotient_count : quotientTree.count = 114487 := quotient_facts.1
theorem quotient_valid : quotientTree.WellFormed := quotient_facts.2.1
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotient_bounded :
    packedAllBounded quotientTree (4 * 114487) = true := quotient_facts.2.2
theorem quotient_code_bound (state : Fin 114487) (bit : Fin 2) :
    packedCodeAt quotientTree state bit ≤ 4 * 114487 :=
  packed_code_bound quotientTree (4 * 114487) quotient_bounded state bit
theorem quotient_fidelity (state : Fin 114487) (bit : Fin 2) :
    packedEncode (quotient.transition state bit) = packedCodeAt quotientTree state bit :=
  packed_transition_fidelity 114487 quotientTree quotient_bounded state bit

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Complete packed quotient checks passed"
