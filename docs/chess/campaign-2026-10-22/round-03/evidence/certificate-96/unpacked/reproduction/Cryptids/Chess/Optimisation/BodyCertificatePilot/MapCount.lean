module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.MapPrelude

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t0\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_000000_facts :
    MapFacts mapChunk_000000 560 114487 :=
  checkMap_sound mapChunk_000000 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_000560_facts :
    MapFacts mapChunk_000560 560 114487 :=
  checkMap_sound mapChunk_000560 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_000000_001120_facts :
    MapFacts mapNode_000000_001120 1120 114487 :=
  map_facts_branch
    mapChunk_000000
    mapChunk_000560
    560 560 114487
    mapChunk_000000_facts
    mapChunk_000560_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_001120_facts :
    MapFacts mapChunk_001120 560 114487 :=
  checkMap_sound mapChunk_001120 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_001680_facts :
    MapFacts mapChunk_001680 561 114487 :=
  checkMap_sound mapChunk_001680 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_001120_001121_facts :
    MapFacts mapNode_001120_001121 1121 114487 :=
  map_facts_branch
    mapChunk_001120
    mapChunk_001680
    560 561 114487
    mapChunk_001120_facts
    mapChunk_001680_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_000000_002241_facts :
    MapFacts mapNode_000000_002241 2241 114487 :=
  map_facts_branch
    mapNode_000000_001120
    mapNode_001120_001121
    1120 1121 114487
    mapNode_000000_001120_facts
    mapNode_001120_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_002241_facts :
    MapFacts mapChunk_002241 560 114487 :=
  checkMap_sound mapChunk_002241 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_002801_facts :
    MapFacts mapChunk_002801 560 114487 :=
  checkMap_sound mapChunk_002801 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_002241_001120_facts :
    MapFacts mapNode_002241_001120 1120 114487 :=
  map_facts_branch
    mapChunk_002241
    mapChunk_002801
    560 560 114487
    mapChunk_002241_facts
    mapChunk_002801_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_003361_facts :
    MapFacts mapChunk_003361 560 114487 :=
  checkMap_sound mapChunk_003361 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_003921_facts :
    MapFacts mapChunk_003921 561 114487 :=
  checkMap_sound mapChunk_003921 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_003361_001121_facts :
    MapFacts mapNode_003361_001121 1121 114487 :=
  map_facts_branch
    mapChunk_003361
    mapChunk_003921
    560 561 114487
    mapChunk_003361_facts
    mapChunk_003921_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_002241_002241_facts :
    MapFacts mapNode_002241_002241 2241 114487 :=
  map_facts_branch
    mapNode_002241_001120
    mapNode_003361_001121
    1120 1121 114487
    mapNode_002241_001120_facts
    mapNode_003361_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_000000_004482_facts :
    MapFacts mapNode_000000_004482 4482 114487 :=
  map_facts_branch
    mapNode_000000_002241
    mapNode_002241_002241
    2241 2241 114487
    mapNode_000000_002241_facts
    mapNode_002241_002241_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_004482_facts :
    MapFacts mapChunk_004482 560 114487 :=
  checkMap_sound mapChunk_004482 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_005042_facts :
    MapFacts mapChunk_005042 560 114487 :=
  checkMap_sound mapChunk_005042 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_004482_001120_facts :
    MapFacts mapNode_004482_001120 1120 114487 :=
  map_facts_branch
    mapChunk_004482
    mapChunk_005042
    560 560 114487
    mapChunk_004482_facts
    mapChunk_005042_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_005602_facts :
    MapFacts mapChunk_005602 560 114487 :=
  checkMap_sound mapChunk_005602 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_006162_facts :
    MapFacts mapChunk_006162 561 114487 :=
  checkMap_sound mapChunk_006162 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_005602_001121_facts :
    MapFacts mapNode_005602_001121 1121 114487 :=
  map_facts_branch
    mapChunk_005602
    mapChunk_006162
    560 561 114487
    mapChunk_005602_facts
    mapChunk_006162_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_004482_002241_facts :
    MapFacts mapNode_004482_002241 2241 114487 :=
  map_facts_branch
    mapNode_004482_001120
    mapNode_005602_001121
    1120 1121 114487
    mapNode_004482_001120_facts
    mapNode_005602_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_006723_facts :
    MapFacts mapChunk_006723 560 114487 :=
  checkMap_sound mapChunk_006723 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_007283_facts :
    MapFacts mapChunk_007283 561 114487 :=
  checkMap_sound mapChunk_007283 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_006723_001121_facts :
    MapFacts mapNode_006723_001121 1121 114487 :=
  map_facts_branch
    mapChunk_006723
    mapChunk_007283
    560 561 114487
    mapChunk_006723_facts
    mapChunk_007283_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_007844_facts :
    MapFacts mapChunk_007844 560 114487 :=
  checkMap_sound mapChunk_007844 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_008404_facts :
    MapFacts mapChunk_008404 561 114487 :=
  checkMap_sound mapChunk_008404 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_007844_001121_facts :
    MapFacts mapNode_007844_001121 1121 114487 :=
  map_facts_branch
    mapChunk_007844
    mapChunk_008404
    560 561 114487
    mapChunk_007844_facts
    mapChunk_008404_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_006723_002242_facts :
    MapFacts mapNode_006723_002242 2242 114487 :=
  map_facts_branch
    mapNode_006723_001121
    mapNode_007844_001121
    1121 1121 114487
    mapNode_006723_001121_facts
    mapNode_007844_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_004482_004483_facts :
    MapFacts mapNode_004482_004483 4483 114487 :=
  map_facts_branch
    mapNode_004482_002241
    mapNode_006723_002242
    2241 2242 114487
    mapNode_004482_002241_facts
    mapNode_006723_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_000000_008965_facts :
    MapFacts mapNode_000000_008965 8965 114487 :=
  map_facts_branch
    mapNode_000000_004482
    mapNode_004482_004483
    4482 4483 114487
    mapNode_000000_004482_facts
    mapNode_004482_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_008965_facts :
    MapFacts mapChunk_008965 560 114487 :=
  checkMap_sound mapChunk_008965 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_009525_facts :
    MapFacts mapChunk_009525 560 114487 :=
  checkMap_sound mapChunk_009525 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_008965_001120_facts :
    MapFacts mapNode_008965_001120 1120 114487 :=
  map_facts_branch
    mapChunk_008965
    mapChunk_009525
    560 560 114487
    mapChunk_008965_facts
    mapChunk_009525_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_010085_facts :
    MapFacts mapChunk_010085 560 114487 :=
  checkMap_sound mapChunk_010085 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_010645_facts :
    MapFacts mapChunk_010645 561 114487 :=
  checkMap_sound mapChunk_010645 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_010085_001121_facts :
    MapFacts mapNode_010085_001121 1121 114487 :=
  map_facts_branch
    mapChunk_010085
    mapChunk_010645
    560 561 114487
    mapChunk_010085_facts
    mapChunk_010645_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_008965_002241_facts :
    MapFacts mapNode_008965_002241 2241 114487 :=
  map_facts_branch
    mapNode_008965_001120
    mapNode_010085_001121
    1120 1121 114487
    mapNode_008965_001120_facts
    mapNode_010085_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_011206_facts :
    MapFacts mapChunk_011206 560 114487 :=
  checkMap_sound mapChunk_011206 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_011766_facts :
    MapFacts mapChunk_011766 561 114487 :=
  checkMap_sound mapChunk_011766 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_011206_001121_facts :
    MapFacts mapNode_011206_001121 1121 114487 :=
  map_facts_branch
    mapChunk_011206
    mapChunk_011766
    560 561 114487
    mapChunk_011206_facts
    mapChunk_011766_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_012327_facts :
    MapFacts mapChunk_012327 560 114487 :=
  checkMap_sound mapChunk_012327 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_012887_facts :
    MapFacts mapChunk_012887 561 114487 :=
  checkMap_sound mapChunk_012887 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_012327_001121_facts :
    MapFacts mapNode_012327_001121 1121 114487 :=
  map_facts_branch
    mapChunk_012327
    mapChunk_012887
    560 561 114487
    mapChunk_012327_facts
    mapChunk_012887_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_011206_002242_facts :
    MapFacts mapNode_011206_002242 2242 114487 :=
  map_facts_branch
    mapNode_011206_001121
    mapNode_012327_001121
    1121 1121 114487
    mapNode_011206_001121_facts
    mapNode_012327_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_008965_004483_facts :
    MapFacts mapNode_008965_004483 4483 114487 :=
  map_facts_branch
    mapNode_008965_002241
    mapNode_011206_002242
    2241 2242 114487
    mapNode_008965_002241_facts
    mapNode_011206_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_013448_facts :
    MapFacts mapChunk_013448 560 114487 :=
  checkMap_sound mapChunk_013448 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_014008_facts :
    MapFacts mapChunk_014008 560 114487 :=
  checkMap_sound mapChunk_014008 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_013448_001120_facts :
    MapFacts mapNode_013448_001120 1120 114487 :=
  map_facts_branch
    mapChunk_013448
    mapChunk_014008
    560 560 114487
    mapChunk_013448_facts
    mapChunk_014008_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_014568_facts :
    MapFacts mapChunk_014568 560 114487 :=
  checkMap_sound mapChunk_014568 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_015128_facts :
    MapFacts mapChunk_015128 561 114487 :=
  checkMap_sound mapChunk_015128 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_014568_001121_facts :
    MapFacts mapNode_014568_001121 1121 114487 :=
  map_facts_branch
    mapChunk_014568
    mapChunk_015128
    560 561 114487
    mapChunk_014568_facts
    mapChunk_015128_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_013448_002241_facts :
    MapFacts mapNode_013448_002241 2241 114487 :=
  map_facts_branch
    mapNode_013448_001120
    mapNode_014568_001121
    1120 1121 114487
    mapNode_013448_001120_facts
    mapNode_014568_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_015689_facts :
    MapFacts mapChunk_015689 560 114487 :=
  checkMap_sound mapChunk_015689 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_016249_facts :
    MapFacts mapChunk_016249 561 114487 :=
  checkMap_sound mapChunk_016249 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_015689_001121_facts :
    MapFacts mapNode_015689_001121 1121 114487 :=
  map_facts_branch
    mapChunk_015689
    mapChunk_016249
    560 561 114487
    mapChunk_015689_facts
    mapChunk_016249_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_016810_facts :
    MapFacts mapChunk_016810 560 114487 :=
  checkMap_sound mapChunk_016810 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_017370_facts :
    MapFacts mapChunk_017370 561 114487 :=
  checkMap_sound mapChunk_017370 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t32\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_016810_001121_facts :
    MapFacts mapNode_016810_001121 1121 114487 :=
  map_facts_branch
    mapChunk_016810
    mapChunk_017370
    560 561 114487
    mapChunk_016810_facts
    mapChunk_017370_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_015689_002242_facts :
    MapFacts mapNode_015689_002242 2242 114487 :=
  map_facts_branch
    mapNode_015689_001121
    mapNode_016810_001121
    1121 1121 114487
    mapNode_015689_001121_facts
    mapNode_016810_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_013448_004483_facts :
    MapFacts mapNode_013448_004483 4483 114487 :=
  map_facts_branch
    mapNode_013448_002241
    mapNode_015689_002242
    2241 2242 114487
    mapNode_013448_002241_facts
    mapNode_015689_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_008965_008966_facts :
    MapFacts mapNode_008965_008966 8966 114487 :=
  map_facts_branch
    mapNode_008965_004483
    mapNode_013448_004483
    4483 4483 114487
    mapNode_008965_004483_facts
    mapNode_013448_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_000000_017931_facts :
    MapFacts mapNode_000000_017931 17931 114487 :=
  map_facts_branch
    mapNode_000000_008965
    mapNode_008965_008966
    8965 8966 114487
    mapNode_000000_008965_facts
    mapNode_008965_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_017931_facts :
    MapFacts mapChunk_017931 560 114487 :=
  checkMap_sound mapChunk_017931 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_018491_facts :
    MapFacts mapChunk_018491 560 114487 :=
  checkMap_sound mapChunk_018491 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_017931_001120_facts :
    MapFacts mapNode_017931_001120 1120 114487 :=
  map_facts_branch
    mapChunk_017931
    mapChunk_018491
    560 560 114487
    mapChunk_017931_facts
    mapChunk_018491_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_019051_facts :
    MapFacts mapChunk_019051 560 114487 :=
  checkMap_sound mapChunk_019051 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_019611_facts :
    MapFacts mapChunk_019611 561 114487 :=
  checkMap_sound mapChunk_019611 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_019051_001121_facts :
    MapFacts mapNode_019051_001121 1121 114487 :=
  map_facts_branch
    mapChunk_019051
    mapChunk_019611
    560 561 114487
    mapChunk_019051_facts
    mapChunk_019611_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_017931_002241_facts :
    MapFacts mapNode_017931_002241 2241 114487 :=
  map_facts_branch
    mapNode_017931_001120
    mapNode_019051_001121
    1120 1121 114487
    mapNode_017931_001120_facts
    mapNode_019051_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_020172_facts :
    MapFacts mapChunk_020172 560 114487 :=
  checkMap_sound mapChunk_020172 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_020732_facts :
    MapFacts mapChunk_020732 560 114487 :=
  checkMap_sound mapChunk_020732 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_020172_001120_facts :
    MapFacts mapNode_020172_001120 1120 114487 :=
  map_facts_branch
    mapChunk_020172
    mapChunk_020732
    560 560 114487
    mapChunk_020172_facts
    mapChunk_020732_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_021292_facts :
    MapFacts mapChunk_021292 560 114487 :=
  checkMap_sound mapChunk_021292 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_021852_facts :
    MapFacts mapChunk_021852 561 114487 :=
  checkMap_sound mapChunk_021852 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_021292_001121_facts :
    MapFacts mapNode_021292_001121 1121 114487 :=
  map_facts_branch
    mapChunk_021292
    mapChunk_021852
    560 561 114487
    mapChunk_021292_facts
    mapChunk_021852_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_020172_002241_facts :
    MapFacts mapNode_020172_002241 2241 114487 :=
  map_facts_branch
    mapNode_020172_001120
    mapNode_021292_001121
    1120 1121 114487
    mapNode_020172_001120_facts
    mapNode_021292_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_017931_004482_facts :
    MapFacts mapNode_017931_004482 4482 114487 :=
  map_facts_branch
    mapNode_017931_002241
    mapNode_020172_002241
    2241 2241 114487
    mapNode_017931_002241_facts
    mapNode_020172_002241_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_022413_facts :
    MapFacts mapChunk_022413 560 114487 :=
  checkMap_sound mapChunk_022413 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_022973_facts :
    MapFacts mapChunk_022973 560 114487 :=
  checkMap_sound mapChunk_022973 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_022413_001120_facts :
    MapFacts mapNode_022413_001120 1120 114487 :=
  map_facts_branch
    mapChunk_022413
    mapChunk_022973
    560 560 114487
    mapChunk_022413_facts
    mapChunk_022973_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_023533_facts :
    MapFacts mapChunk_023533 560 114487 :=
  checkMap_sound mapChunk_023533 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_024093_facts :
    MapFacts mapChunk_024093 561 114487 :=
  checkMap_sound mapChunk_024093 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_023533_001121_facts :
    MapFacts mapNode_023533_001121 1121 114487 :=
  map_facts_branch
    mapChunk_023533
    mapChunk_024093
    560 561 114487
    mapChunk_023533_facts
    mapChunk_024093_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_022413_002241_facts :
    MapFacts mapNode_022413_002241 2241 114487 :=
  map_facts_branch
    mapNode_022413_001120
    mapNode_023533_001121
    1120 1121 114487
    mapNode_022413_001120_facts
    mapNode_023533_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_024654_facts :
    MapFacts mapChunk_024654 560 114487 :=
  checkMap_sound mapChunk_024654 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_025214_facts :
    MapFacts mapChunk_025214 561 114487 :=
  checkMap_sound mapChunk_025214 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_024654_001121_facts :
    MapFacts mapNode_024654_001121 1121 114487 :=
  map_facts_branch
    mapChunk_024654
    mapChunk_025214
    560 561 114487
    mapChunk_024654_facts
    mapChunk_025214_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_025775_facts :
    MapFacts mapChunk_025775 560 114487 :=
  checkMap_sound mapChunk_025775 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_026335_facts :
    MapFacts mapChunk_026335 561 114487 :=
  checkMap_sound mapChunk_026335 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_025775_001121_facts :
    MapFacts mapNode_025775_001121 1121 114487 :=
  map_facts_branch
    mapChunk_025775
    mapChunk_026335
    560 561 114487
    mapChunk_025775_facts
    mapChunk_026335_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_024654_002242_facts :
    MapFacts mapNode_024654_002242 2242 114487 :=
  map_facts_branch
    mapNode_024654_001121
    mapNode_025775_001121
    1121 1121 114487
    mapNode_024654_001121_facts
    mapNode_025775_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_022413_004483_facts :
    MapFacts mapNode_022413_004483 4483 114487 :=
  map_facts_branch
    mapNode_022413_002241
    mapNode_024654_002242
    2241 2242 114487
    mapNode_022413_002241_facts
    mapNode_024654_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_017931_008965_facts :
    MapFacts mapNode_017931_008965 8965 114487 :=
  map_facts_branch
    mapNode_017931_004482
    mapNode_022413_004483
    4482 4483 114487
    mapNode_017931_004482_facts
    mapNode_022413_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_026896_facts :
    MapFacts mapChunk_026896 560 114487 :=
  checkMap_sound mapChunk_026896 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_027456_facts :
    MapFacts mapChunk_027456 560 114487 :=
  checkMap_sound mapChunk_027456 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_026896_001120_facts :
    MapFacts mapNode_026896_001120 1120 114487 :=
  map_facts_branch
    mapChunk_026896
    mapChunk_027456
    560 560 114487
    mapChunk_026896_facts
    mapChunk_027456_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_028016_facts :
    MapFacts mapChunk_028016 560 114487 :=
  checkMap_sound mapChunk_028016 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_028576_facts :
    MapFacts mapChunk_028576 561 114487 :=
  checkMap_sound mapChunk_028576 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_028016_001121_facts :
    MapFacts mapNode_028016_001121 1121 114487 :=
  map_facts_branch
    mapChunk_028016
    mapChunk_028576
    560 561 114487
    mapChunk_028016_facts
    mapChunk_028576_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_026896_002241_facts :
    MapFacts mapNode_026896_002241 2241 114487 :=
  map_facts_branch
    mapNode_026896_001120
    mapNode_028016_001121
    1120 1121 114487
    mapNode_026896_001120_facts
    mapNode_028016_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_029137_facts :
    MapFacts mapChunk_029137 560 114487 :=
  checkMap_sound mapChunk_029137 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_029697_facts :
    MapFacts mapChunk_029697 561 114487 :=
  checkMap_sound mapChunk_029697 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_029137_001121_facts :
    MapFacts mapNode_029137_001121 1121 114487 :=
  map_facts_branch
    mapChunk_029137
    mapChunk_029697
    560 561 114487
    mapChunk_029137_facts
    mapChunk_029697_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_030258_facts :
    MapFacts mapChunk_030258 560 114487 :=
  checkMap_sound mapChunk_030258 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_030818_facts :
    MapFacts mapChunk_030818 561 114487 :=
  checkMap_sound mapChunk_030818 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_030258_001121_facts :
    MapFacts mapNode_030258_001121 1121 114487 :=
  map_facts_branch
    mapChunk_030258
    mapChunk_030818
    560 561 114487
    mapChunk_030258_facts
    mapChunk_030818_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_029137_002242_facts :
    MapFacts mapNode_029137_002242 2242 114487 :=
  map_facts_branch
    mapNode_029137_001121
    mapNode_030258_001121
    1121 1121 114487
    mapNode_029137_001121_facts
    mapNode_030258_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_026896_004483_facts :
    MapFacts mapNode_026896_004483 4483 114487 :=
  map_facts_branch
    mapNode_026896_002241
    mapNode_029137_002242
    2241 2242 114487
    mapNode_026896_002241_facts
    mapNode_029137_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_031379_facts :
    MapFacts mapChunk_031379 560 114487 :=
  checkMap_sound mapChunk_031379 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_031939_facts :
    MapFacts mapChunk_031939 560 114487 :=
  checkMap_sound mapChunk_031939 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_031379_001120_facts :
    MapFacts mapNode_031379_001120 1120 114487 :=
  map_facts_branch
    mapChunk_031379
    mapChunk_031939
    560 560 114487
    mapChunk_031379_facts
    mapChunk_031939_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_032499_facts :
    MapFacts mapChunk_032499 560 114487 :=
  checkMap_sound mapChunk_032499 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_033059_facts :
    MapFacts mapChunk_033059 561 114487 :=
  checkMap_sound mapChunk_033059 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_032499_001121_facts :
    MapFacts mapNode_032499_001121 1121 114487 :=
  map_facts_branch
    mapChunk_032499
    mapChunk_033059
    560 561 114487
    mapChunk_032499_facts
    mapChunk_033059_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_031379_002241_facts :
    MapFacts mapNode_031379_002241 2241 114487 :=
  map_facts_branch
    mapNode_031379_001120
    mapNode_032499_001121
    1120 1121 114487
    mapNode_031379_001120_facts
    mapNode_032499_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_033620_facts :
    MapFacts mapChunk_033620 560 114487 :=
  checkMap_sound mapChunk_033620 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_034180_facts :
    MapFacts mapChunk_034180 561 114487 :=
  checkMap_sound mapChunk_034180 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_033620_001121_facts :
    MapFacts mapNode_033620_001121 1121 114487 :=
  map_facts_branch
    mapChunk_033620
    mapChunk_034180
    560 561 114487
    mapChunk_033620_facts
    mapChunk_034180_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_034741_facts :
    MapFacts mapChunk_034741 560 114487 :=
  checkMap_sound mapChunk_034741 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_035301_facts :
    MapFacts mapChunk_035301 561 114487 :=
  checkMap_sound mapChunk_035301 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t64\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_034741_001121_facts :
    MapFacts mapNode_034741_001121 1121 114487 :=
  map_facts_branch
    mapChunk_034741
    mapChunk_035301
    560 561 114487
    mapChunk_034741_facts
    mapChunk_035301_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_033620_002242_facts :
    MapFacts mapNode_033620_002242 2242 114487 :=
  map_facts_branch
    mapNode_033620_001121
    mapNode_034741_001121
    1121 1121 114487
    mapNode_033620_001121_facts
    mapNode_034741_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_031379_004483_facts :
    MapFacts mapNode_031379_004483 4483 114487 :=
  map_facts_branch
    mapNode_031379_002241
    mapNode_033620_002242
    2241 2242 114487
    mapNode_031379_002241_facts
    mapNode_033620_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_026896_008966_facts :
    MapFacts mapNode_026896_008966 8966 114487 :=
  map_facts_branch
    mapNode_026896_004483
    mapNode_031379_004483
    4483 4483 114487
    mapNode_026896_004483_facts
    mapNode_031379_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_017931_017931_facts :
    MapFacts mapNode_017931_017931 17931 114487 :=
  map_facts_branch
    mapNode_017931_008965
    mapNode_026896_008966
    8965 8966 114487
    mapNode_017931_008965_facts
    mapNode_026896_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_000000_035862_facts :
    MapFacts mapNode_000000_035862 35862 114487 :=
  map_facts_branch
    mapNode_000000_017931
    mapNode_017931_017931
    17931 17931 114487
    mapNode_000000_017931_facts
    mapNode_017931_017931_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_035862_facts :
    MapFacts mapChunk_035862 560 114487 :=
  checkMap_sound mapChunk_035862 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_036422_facts :
    MapFacts mapChunk_036422 560 114487 :=
  checkMap_sound mapChunk_036422 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_035862_001120_facts :
    MapFacts mapNode_035862_001120 1120 114487 :=
  map_facts_branch
    mapChunk_035862
    mapChunk_036422
    560 560 114487
    mapChunk_035862_facts
    mapChunk_036422_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_036982_facts :
    MapFacts mapChunk_036982 560 114487 :=
  checkMap_sound mapChunk_036982 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_037542_facts :
    MapFacts mapChunk_037542 561 114487 :=
  checkMap_sound mapChunk_037542 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_036982_001121_facts :
    MapFacts mapNode_036982_001121 1121 114487 :=
  map_facts_branch
    mapChunk_036982
    mapChunk_037542
    560 561 114487
    mapChunk_036982_facts
    mapChunk_037542_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_035862_002241_facts :
    MapFacts mapNode_035862_002241 2241 114487 :=
  map_facts_branch
    mapNode_035862_001120
    mapNode_036982_001121
    1120 1121 114487
    mapNode_035862_001120_facts
    mapNode_036982_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_038103_facts :
    MapFacts mapChunk_038103 560 114487 :=
  checkMap_sound mapChunk_038103 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_038663_facts :
    MapFacts mapChunk_038663 560 114487 :=
  checkMap_sound mapChunk_038663 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_038103_001120_facts :
    MapFacts mapNode_038103_001120 1120 114487 :=
  map_facts_branch
    mapChunk_038103
    mapChunk_038663
    560 560 114487
    mapChunk_038103_facts
    mapChunk_038663_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_039223_facts :
    MapFacts mapChunk_039223 560 114487 :=
  checkMap_sound mapChunk_039223 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_039783_facts :
    MapFacts mapChunk_039783 561 114487 :=
  checkMap_sound mapChunk_039783 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_039223_001121_facts :
    MapFacts mapNode_039223_001121 1121 114487 :=
  map_facts_branch
    mapChunk_039223
    mapChunk_039783
    560 561 114487
    mapChunk_039223_facts
    mapChunk_039783_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_038103_002241_facts :
    MapFacts mapNode_038103_002241 2241 114487 :=
  map_facts_branch
    mapNode_038103_001120
    mapNode_039223_001121
    1120 1121 114487
    mapNode_038103_001120_facts
    mapNode_039223_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_035862_004482_facts :
    MapFacts mapNode_035862_004482 4482 114487 :=
  map_facts_branch
    mapNode_035862_002241
    mapNode_038103_002241
    2241 2241 114487
    mapNode_035862_002241_facts
    mapNode_038103_002241_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_040344_facts :
    MapFacts mapChunk_040344 560 114487 :=
  checkMap_sound mapChunk_040344 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_040904_facts :
    MapFacts mapChunk_040904 560 114487 :=
  checkMap_sound mapChunk_040904 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_040344_001120_facts :
    MapFacts mapNode_040344_001120 1120 114487 :=
  map_facts_branch
    mapChunk_040344
    mapChunk_040904
    560 560 114487
    mapChunk_040344_facts
    mapChunk_040904_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_041464_facts :
    MapFacts mapChunk_041464 560 114487 :=
  checkMap_sound mapChunk_041464 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_042024_facts :
    MapFacts mapChunk_042024 561 114487 :=
  checkMap_sound mapChunk_042024 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_041464_001121_facts :
    MapFacts mapNode_041464_001121 1121 114487 :=
  map_facts_branch
    mapChunk_041464
    mapChunk_042024
    560 561 114487
    mapChunk_041464_facts
    mapChunk_042024_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_040344_002241_facts :
    MapFacts mapNode_040344_002241 2241 114487 :=
  map_facts_branch
    mapNode_040344_001120
    mapNode_041464_001121
    1120 1121 114487
    mapNode_040344_001120_facts
    mapNode_041464_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_042585_facts :
    MapFacts mapChunk_042585 560 114487 :=
  checkMap_sound mapChunk_042585 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_043145_facts :
    MapFacts mapChunk_043145 561 114487 :=
  checkMap_sound mapChunk_043145 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_042585_001121_facts :
    MapFacts mapNode_042585_001121 1121 114487 :=
  map_facts_branch
    mapChunk_042585
    mapChunk_043145
    560 561 114487
    mapChunk_042585_facts
    mapChunk_043145_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_043706_facts :
    MapFacts mapChunk_043706 560 114487 :=
  checkMap_sound mapChunk_043706 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_044266_facts :
    MapFacts mapChunk_044266 561 114487 :=
  checkMap_sound mapChunk_044266 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_043706_001121_facts :
    MapFacts mapNode_043706_001121 1121 114487 :=
  map_facts_branch
    mapChunk_043706
    mapChunk_044266
    560 561 114487
    mapChunk_043706_facts
    mapChunk_044266_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_042585_002242_facts :
    MapFacts mapNode_042585_002242 2242 114487 :=
  map_facts_branch
    mapNode_042585_001121
    mapNode_043706_001121
    1121 1121 114487
    mapNode_042585_001121_facts
    mapNode_043706_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_040344_004483_facts :
    MapFacts mapNode_040344_004483 4483 114487 :=
  map_facts_branch
    mapNode_040344_002241
    mapNode_042585_002242
    2241 2242 114487
    mapNode_040344_002241_facts
    mapNode_042585_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_035862_008965_facts :
    MapFacts mapNode_035862_008965 8965 114487 :=
  map_facts_branch
    mapNode_035862_004482
    mapNode_040344_004483
    4482 4483 114487
    mapNode_035862_004482_facts
    mapNode_040344_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_044827_facts :
    MapFacts mapChunk_044827 560 114487 :=
  checkMap_sound mapChunk_044827 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_045387_facts :
    MapFacts mapChunk_045387 560 114487 :=
  checkMap_sound mapChunk_045387 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_044827_001120_facts :
    MapFacts mapNode_044827_001120 1120 114487 :=
  map_facts_branch
    mapChunk_044827
    mapChunk_045387
    560 560 114487
    mapChunk_044827_facts
    mapChunk_045387_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_045947_facts :
    MapFacts mapChunk_045947 560 114487 :=
  checkMap_sound mapChunk_045947 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_046507_facts :
    MapFacts mapChunk_046507 561 114487 :=
  checkMap_sound mapChunk_046507 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_045947_001121_facts :
    MapFacts mapNode_045947_001121 1121 114487 :=
  map_facts_branch
    mapChunk_045947
    mapChunk_046507
    560 561 114487
    mapChunk_045947_facts
    mapChunk_046507_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_044827_002241_facts :
    MapFacts mapNode_044827_002241 2241 114487 :=
  map_facts_branch
    mapNode_044827_001120
    mapNode_045947_001121
    1120 1121 114487
    mapNode_044827_001120_facts
    mapNode_045947_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_047068_facts :
    MapFacts mapChunk_047068 560 114487 :=
  checkMap_sound mapChunk_047068 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_047628_facts :
    MapFacts mapChunk_047628 561 114487 :=
  checkMap_sound mapChunk_047628 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_047068_001121_facts :
    MapFacts mapNode_047068_001121 1121 114487 :=
  map_facts_branch
    mapChunk_047068
    mapChunk_047628
    560 561 114487
    mapChunk_047068_facts
    mapChunk_047628_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_048189_facts :
    MapFacts mapChunk_048189 560 114487 :=
  checkMap_sound mapChunk_048189 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_048749_facts :
    MapFacts mapChunk_048749 561 114487 :=
  checkMap_sound mapChunk_048749 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_048189_001121_facts :
    MapFacts mapNode_048189_001121 1121 114487 :=
  map_facts_branch
    mapChunk_048189
    mapChunk_048749
    560 561 114487
    mapChunk_048189_facts
    mapChunk_048749_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_047068_002242_facts :
    MapFacts mapNode_047068_002242 2242 114487 :=
  map_facts_branch
    mapNode_047068_001121
    mapNode_048189_001121
    1121 1121 114487
    mapNode_047068_001121_facts
    mapNode_048189_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_044827_004483_facts :
    MapFacts mapNode_044827_004483 4483 114487 :=
  map_facts_branch
    mapNode_044827_002241
    mapNode_047068_002242
    2241 2242 114487
    mapNode_044827_002241_facts
    mapNode_047068_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_049310_facts :
    MapFacts mapChunk_049310 560 114487 :=
  checkMap_sound mapChunk_049310 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_049870_facts :
    MapFacts mapChunk_049870 560 114487 :=
  checkMap_sound mapChunk_049870 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_049310_001120_facts :
    MapFacts mapNode_049310_001120 1120 114487 :=
  map_facts_branch
    mapChunk_049310
    mapChunk_049870
    560 560 114487
    mapChunk_049310_facts
    mapChunk_049870_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_050430_facts :
    MapFacts mapChunk_050430 560 114487 :=
  checkMap_sound mapChunk_050430 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_050990_facts :
    MapFacts mapChunk_050990 561 114487 :=
  checkMap_sound mapChunk_050990 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_050430_001121_facts :
    MapFacts mapNode_050430_001121 1121 114487 :=
  map_facts_branch
    mapChunk_050430
    mapChunk_050990
    560 561 114487
    mapChunk_050430_facts
    mapChunk_050990_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_049310_002241_facts :
    MapFacts mapNode_049310_002241 2241 114487 :=
  map_facts_branch
    mapNode_049310_001120
    mapNode_050430_001121
    1120 1121 114487
    mapNode_049310_001120_facts
    mapNode_050430_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_051551_facts :
    MapFacts mapChunk_051551 560 114487 :=
  checkMap_sound mapChunk_051551 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_052111_facts :
    MapFacts mapChunk_052111 561 114487 :=
  checkMap_sound mapChunk_052111 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_051551_001121_facts :
    MapFacts mapNode_051551_001121 1121 114487 :=
  map_facts_branch
    mapChunk_051551
    mapChunk_052111
    560 561 114487
    mapChunk_051551_facts
    mapChunk_052111_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_052672_facts :
    MapFacts mapChunk_052672 560 114487 :=
  checkMap_sound mapChunk_052672 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_053232_facts :
    MapFacts mapChunk_053232 561 114487 :=
  checkMap_sound mapChunk_053232 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t96\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_052672_001121_facts :
    MapFacts mapNode_052672_001121 1121 114487 :=
  map_facts_branch
    mapChunk_052672
    mapChunk_053232
    560 561 114487
    mapChunk_052672_facts
    mapChunk_053232_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_051551_002242_facts :
    MapFacts mapNode_051551_002242 2242 114487 :=
  map_facts_branch
    mapNode_051551_001121
    mapNode_052672_001121
    1121 1121 114487
    mapNode_051551_001121_facts
    mapNode_052672_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_049310_004483_facts :
    MapFacts mapNode_049310_004483 4483 114487 :=
  map_facts_branch
    mapNode_049310_002241
    mapNode_051551_002242
    2241 2242 114487
    mapNode_049310_002241_facts
    mapNode_051551_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_044827_008966_facts :
    MapFacts mapNode_044827_008966 8966 114487 :=
  map_facts_branch
    mapNode_044827_004483
    mapNode_049310_004483
    4483 4483 114487
    mapNode_044827_004483_facts
    mapNode_049310_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_035862_017931_facts :
    MapFacts mapNode_035862_017931 17931 114487 :=
  map_facts_branch
    mapNode_035862_008965
    mapNode_044827_008966
    8965 8966 114487
    mapNode_035862_008965_facts
    mapNode_044827_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_053793_facts :
    MapFacts mapChunk_053793 560 114487 :=
  checkMap_sound mapChunk_053793 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_054353_facts :
    MapFacts mapChunk_054353 560 114487 :=
  checkMap_sound mapChunk_054353 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_053793_001120_facts :
    MapFacts mapNode_053793_001120 1120 114487 :=
  map_facts_branch
    mapChunk_053793
    mapChunk_054353
    560 560 114487
    mapChunk_053793_facts
    mapChunk_054353_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_054913_facts :
    MapFacts mapChunk_054913 560 114487 :=
  checkMap_sound mapChunk_054913 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_055473_facts :
    MapFacts mapChunk_055473 561 114487 :=
  checkMap_sound mapChunk_055473 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_054913_001121_facts :
    MapFacts mapNode_054913_001121 1121 114487 :=
  map_facts_branch
    mapChunk_054913
    mapChunk_055473
    560 561 114487
    mapChunk_054913_facts
    mapChunk_055473_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_053793_002241_facts :
    MapFacts mapNode_053793_002241 2241 114487 :=
  map_facts_branch
    mapNode_053793_001120
    mapNode_054913_001121
    1120 1121 114487
    mapNode_053793_001120_facts
    mapNode_054913_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_056034_facts :
    MapFacts mapChunk_056034 560 114487 :=
  checkMap_sound mapChunk_056034 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_056594_facts :
    MapFacts mapChunk_056594 561 114487 :=
  checkMap_sound mapChunk_056594 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_056034_001121_facts :
    MapFacts mapNode_056034_001121 1121 114487 :=
  map_facts_branch
    mapChunk_056034
    mapChunk_056594
    560 561 114487
    mapChunk_056034_facts
    mapChunk_056594_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_057155_facts :
    MapFacts mapChunk_057155 560 114487 :=
  checkMap_sound mapChunk_057155 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_057715_facts :
    MapFacts mapChunk_057715 561 114487 :=
  checkMap_sound mapChunk_057715 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_057155_001121_facts :
    MapFacts mapNode_057155_001121 1121 114487 :=
  map_facts_branch
    mapChunk_057155
    mapChunk_057715
    560 561 114487
    mapChunk_057155_facts
    mapChunk_057715_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_056034_002242_facts :
    MapFacts mapNode_056034_002242 2242 114487 :=
  map_facts_branch
    mapNode_056034_001121
    mapNode_057155_001121
    1121 1121 114487
    mapNode_056034_001121_facts
    mapNode_057155_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_053793_004483_facts :
    MapFacts mapNode_053793_004483 4483 114487 :=
  map_facts_branch
    mapNode_053793_002241
    mapNode_056034_002242
    2241 2242 114487
    mapNode_053793_002241_facts
    mapNode_056034_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_058276_facts :
    MapFacts mapChunk_058276 560 114487 :=
  checkMap_sound mapChunk_058276 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_058836_facts :
    MapFacts mapChunk_058836 560 114487 :=
  checkMap_sound mapChunk_058836 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_058276_001120_facts :
    MapFacts mapNode_058276_001120 1120 114487 :=
  map_facts_branch
    mapChunk_058276
    mapChunk_058836
    560 560 114487
    mapChunk_058276_facts
    mapChunk_058836_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_059396_facts :
    MapFacts mapChunk_059396 560 114487 :=
  checkMap_sound mapChunk_059396 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_059956_facts :
    MapFacts mapChunk_059956 561 114487 :=
  checkMap_sound mapChunk_059956 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_059396_001121_facts :
    MapFacts mapNode_059396_001121 1121 114487 :=
  map_facts_branch
    mapChunk_059396
    mapChunk_059956
    560 561 114487
    mapChunk_059396_facts
    mapChunk_059956_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_058276_002241_facts :
    MapFacts mapNode_058276_002241 2241 114487 :=
  map_facts_branch
    mapNode_058276_001120
    mapNode_059396_001121
    1120 1121 114487
    mapNode_058276_001120_facts
    mapNode_059396_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_060517_facts :
    MapFacts mapChunk_060517 560 114487 :=
  checkMap_sound mapChunk_060517 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_061077_facts :
    MapFacts mapChunk_061077 561 114487 :=
  checkMap_sound mapChunk_061077 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_060517_001121_facts :
    MapFacts mapNode_060517_001121 1121 114487 :=
  map_facts_branch
    mapChunk_060517
    mapChunk_061077
    560 561 114487
    mapChunk_060517_facts
    mapChunk_061077_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_061638_facts :
    MapFacts mapChunk_061638 560 114487 :=
  checkMap_sound mapChunk_061638 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_062198_facts :
    MapFacts mapChunk_062198 561 114487 :=
  checkMap_sound mapChunk_062198 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_061638_001121_facts :
    MapFacts mapNode_061638_001121 1121 114487 :=
  map_facts_branch
    mapChunk_061638
    mapChunk_062198
    560 561 114487
    mapChunk_061638_facts
    mapChunk_062198_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_060517_002242_facts :
    MapFacts mapNode_060517_002242 2242 114487 :=
  map_facts_branch
    mapNode_060517_001121
    mapNode_061638_001121
    1121 1121 114487
    mapNode_060517_001121_facts
    mapNode_061638_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_058276_004483_facts :
    MapFacts mapNode_058276_004483 4483 114487 :=
  map_facts_branch
    mapNode_058276_002241
    mapNode_060517_002242
    2241 2242 114487
    mapNode_058276_002241_facts
    mapNode_060517_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_053793_008966_facts :
    MapFacts mapNode_053793_008966 8966 114487 :=
  map_facts_branch
    mapNode_053793_004483
    mapNode_058276_004483
    4483 4483 114487
    mapNode_053793_004483_facts
    mapNode_058276_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_062759_facts :
    MapFacts mapChunk_062759 560 114487 :=
  checkMap_sound mapChunk_062759 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_063319_facts :
    MapFacts mapChunk_063319 560 114487 :=
  checkMap_sound mapChunk_063319 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_062759_001120_facts :
    MapFacts mapNode_062759_001120 1120 114487 :=
  map_facts_branch
    mapChunk_062759
    mapChunk_063319
    560 560 114487
    mapChunk_062759_facts
    mapChunk_063319_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_063879_facts :
    MapFacts mapChunk_063879 560 114487 :=
  checkMap_sound mapChunk_063879 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_064439_facts :
    MapFacts mapChunk_064439 561 114487 :=
  checkMap_sound mapChunk_064439 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_063879_001121_facts :
    MapFacts mapNode_063879_001121 1121 114487 :=
  map_facts_branch
    mapChunk_063879
    mapChunk_064439
    560 561 114487
    mapChunk_063879_facts
    mapChunk_064439_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_062759_002241_facts :
    MapFacts mapNode_062759_002241 2241 114487 :=
  map_facts_branch
    mapNode_062759_001120
    mapNode_063879_001121
    1120 1121 114487
    mapNode_062759_001120_facts
    mapNode_063879_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_065000_facts :
    MapFacts mapChunk_065000 560 114487 :=
  checkMap_sound mapChunk_065000 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_065560_facts :
    MapFacts mapChunk_065560 561 114487 :=
  checkMap_sound mapChunk_065560 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_065000_001121_facts :
    MapFacts mapNode_065000_001121 1121 114487 :=
  map_facts_branch
    mapChunk_065000
    mapChunk_065560
    560 561 114487
    mapChunk_065000_facts
    mapChunk_065560_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_066121_facts :
    MapFacts mapChunk_066121 560 114487 :=
  checkMap_sound mapChunk_066121 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_066681_facts :
    MapFacts mapChunk_066681 561 114487 :=
  checkMap_sound mapChunk_066681 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_066121_001121_facts :
    MapFacts mapNode_066121_001121 1121 114487 :=
  map_facts_branch
    mapChunk_066121
    mapChunk_066681
    560 561 114487
    mapChunk_066121_facts
    mapChunk_066681_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_065000_002242_facts :
    MapFacts mapNode_065000_002242 2242 114487 :=
  map_facts_branch
    mapNode_065000_001121
    mapNode_066121_001121
    1121 1121 114487
    mapNode_065000_001121_facts
    mapNode_066121_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_062759_004483_facts :
    MapFacts mapNode_062759_004483 4483 114487 :=
  map_facts_branch
    mapNode_062759_002241
    mapNode_065000_002242
    2241 2242 114487
    mapNode_062759_002241_facts
    mapNode_065000_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_067242_facts :
    MapFacts mapChunk_067242 560 114487 :=
  checkMap_sound mapChunk_067242 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_067802_facts :
    MapFacts mapChunk_067802 560 114487 :=
  checkMap_sound mapChunk_067802 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_067242_001120_facts :
    MapFacts mapNode_067242_001120 1120 114487 :=
  map_facts_branch
    mapChunk_067242
    mapChunk_067802
    560 560 114487
    mapChunk_067242_facts
    mapChunk_067802_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_068362_facts :
    MapFacts mapChunk_068362 560 114487 :=
  checkMap_sound mapChunk_068362 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_068922_facts :
    MapFacts mapChunk_068922 561 114487 :=
  checkMap_sound mapChunk_068922 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_068362_001121_facts :
    MapFacts mapNode_068362_001121 1121 114487 :=
  map_facts_branch
    mapChunk_068362
    mapChunk_068922
    560 561 114487
    mapChunk_068362_facts
    mapChunk_068922_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_067242_002241_facts :
    MapFacts mapNode_067242_002241 2241 114487 :=
  map_facts_branch
    mapNode_067242_001120
    mapNode_068362_001121
    1120 1121 114487
    mapNode_067242_001120_facts
    mapNode_068362_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_069483_facts :
    MapFacts mapChunk_069483 560 114487 :=
  checkMap_sound mapChunk_069483 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_070043_facts :
    MapFacts mapChunk_070043 561 114487 :=
  checkMap_sound mapChunk_070043 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_069483_001121_facts :
    MapFacts mapNode_069483_001121 1121 114487 :=
  map_facts_branch
    mapChunk_069483
    mapChunk_070043
    560 561 114487
    mapChunk_069483_facts
    mapChunk_070043_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_070604_facts :
    MapFacts mapChunk_070604 560 114487 :=
  checkMap_sound mapChunk_070604 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_071164_facts :
    MapFacts mapChunk_071164 561 114487 :=
  checkMap_sound mapChunk_071164 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t128\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_070604_001121_facts :
    MapFacts mapNode_070604_001121 1121 114487 :=
  map_facts_branch
    mapChunk_070604
    mapChunk_071164
    560 561 114487
    mapChunk_070604_facts
    mapChunk_071164_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_069483_002242_facts :
    MapFacts mapNode_069483_002242 2242 114487 :=
  map_facts_branch
    mapNode_069483_001121
    mapNode_070604_001121
    1121 1121 114487
    mapNode_069483_001121_facts
    mapNode_070604_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_067242_004483_facts :
    MapFacts mapNode_067242_004483 4483 114487 :=
  map_facts_branch
    mapNode_067242_002241
    mapNode_069483_002242
    2241 2242 114487
    mapNode_067242_002241_facts
    mapNode_069483_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_062759_008966_facts :
    MapFacts mapNode_062759_008966 8966 114487 :=
  map_facts_branch
    mapNode_062759_004483
    mapNode_067242_004483
    4483 4483 114487
    mapNode_062759_004483_facts
    mapNode_067242_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_053793_017932_facts :
    MapFacts mapNode_053793_017932 17932 114487 :=
  map_facts_branch
    mapNode_053793_008966
    mapNode_062759_008966
    8966 8966 114487
    mapNode_053793_008966_facts
    mapNode_062759_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_035862_035863_facts :
    MapFacts mapNode_035862_035863 35863 114487 :=
  map_facts_branch
    mapNode_035862_017931
    mapNode_053793_017932
    17931 17932 114487
    mapNode_035862_017931_facts
    mapNode_053793_017932_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_000000_071725_facts :
    MapFacts mapNode_000000_071725 71725 114487 :=
  map_facts_branch
    mapNode_000000_035862
    mapNode_035862_035863
    35862 35863 114487
    mapNode_000000_035862_facts
    mapNode_035862_035863_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_071725_facts :
    MapFacts mapChunk_071725 560 114487 :=
  checkMap_sound mapChunk_071725 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_072285_facts :
    MapFacts mapChunk_072285 560 114487 :=
  checkMap_sound mapChunk_072285 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_071725_001120_facts :
    MapFacts mapNode_071725_001120 1120 114487 :=
  map_facts_branch
    mapChunk_071725
    mapChunk_072285
    560 560 114487
    mapChunk_071725_facts
    mapChunk_072285_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_072845_facts :
    MapFacts mapChunk_072845 560 114487 :=
  checkMap_sound mapChunk_072845 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_073405_facts :
    MapFacts mapChunk_073405 561 114487 :=
  checkMap_sound mapChunk_073405 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_072845_001121_facts :
    MapFacts mapNode_072845_001121 1121 114487 :=
  map_facts_branch
    mapChunk_072845
    mapChunk_073405
    560 561 114487
    mapChunk_072845_facts
    mapChunk_073405_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_071725_002241_facts :
    MapFacts mapNode_071725_002241 2241 114487 :=
  map_facts_branch
    mapNode_071725_001120
    mapNode_072845_001121
    1120 1121 114487
    mapNode_071725_001120_facts
    mapNode_072845_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_073966_facts :
    MapFacts mapChunk_073966 560 114487 :=
  checkMap_sound mapChunk_073966 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_074526_facts :
    MapFacts mapChunk_074526 560 114487 :=
  checkMap_sound mapChunk_074526 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_073966_001120_facts :
    MapFacts mapNode_073966_001120 1120 114487 :=
  map_facts_branch
    mapChunk_073966
    mapChunk_074526
    560 560 114487
    mapChunk_073966_facts
    mapChunk_074526_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_075086_facts :
    MapFacts mapChunk_075086 560 114487 :=
  checkMap_sound mapChunk_075086 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_075646_facts :
    MapFacts mapChunk_075646 561 114487 :=
  checkMap_sound mapChunk_075646 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_075086_001121_facts :
    MapFacts mapNode_075086_001121 1121 114487 :=
  map_facts_branch
    mapChunk_075086
    mapChunk_075646
    560 561 114487
    mapChunk_075086_facts
    mapChunk_075646_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_073966_002241_facts :
    MapFacts mapNode_073966_002241 2241 114487 :=
  map_facts_branch
    mapNode_073966_001120
    mapNode_075086_001121
    1120 1121 114487
    mapNode_073966_001120_facts
    mapNode_075086_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_071725_004482_facts :
    MapFacts mapNode_071725_004482 4482 114487 :=
  map_facts_branch
    mapNode_071725_002241
    mapNode_073966_002241
    2241 2241 114487
    mapNode_071725_002241_facts
    mapNode_073966_002241_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_076207_facts :
    MapFacts mapChunk_076207 560 114487 :=
  checkMap_sound mapChunk_076207 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_076767_facts :
    MapFacts mapChunk_076767 560 114487 :=
  checkMap_sound mapChunk_076767 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_076207_001120_facts :
    MapFacts mapNode_076207_001120 1120 114487 :=
  map_facts_branch
    mapChunk_076207
    mapChunk_076767
    560 560 114487
    mapChunk_076207_facts
    mapChunk_076767_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_077327_facts :
    MapFacts mapChunk_077327 560 114487 :=
  checkMap_sound mapChunk_077327 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_077887_facts :
    MapFacts mapChunk_077887 561 114487 :=
  checkMap_sound mapChunk_077887 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_077327_001121_facts :
    MapFacts mapNode_077327_001121 1121 114487 :=
  map_facts_branch
    mapChunk_077327
    mapChunk_077887
    560 561 114487
    mapChunk_077327_facts
    mapChunk_077887_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_076207_002241_facts :
    MapFacts mapNode_076207_002241 2241 114487 :=
  map_facts_branch
    mapNode_076207_001120
    mapNode_077327_001121
    1120 1121 114487
    mapNode_076207_001120_facts
    mapNode_077327_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_078448_facts :
    MapFacts mapChunk_078448 560 114487 :=
  checkMap_sound mapChunk_078448 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_079008_facts :
    MapFacts mapChunk_079008 561 114487 :=
  checkMap_sound mapChunk_079008 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_078448_001121_facts :
    MapFacts mapNode_078448_001121 1121 114487 :=
  map_facts_branch
    mapChunk_078448
    mapChunk_079008
    560 561 114487
    mapChunk_078448_facts
    mapChunk_079008_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_079569_facts :
    MapFacts mapChunk_079569 560 114487 :=
  checkMap_sound mapChunk_079569 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_080129_facts :
    MapFacts mapChunk_080129 561 114487 :=
  checkMap_sound mapChunk_080129 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_079569_001121_facts :
    MapFacts mapNode_079569_001121 1121 114487 :=
  map_facts_branch
    mapChunk_079569
    mapChunk_080129
    560 561 114487
    mapChunk_079569_facts
    mapChunk_080129_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_078448_002242_facts :
    MapFacts mapNode_078448_002242 2242 114487 :=
  map_facts_branch
    mapNode_078448_001121
    mapNode_079569_001121
    1121 1121 114487
    mapNode_078448_001121_facts
    mapNode_079569_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_076207_004483_facts :
    MapFacts mapNode_076207_004483 4483 114487 :=
  map_facts_branch
    mapNode_076207_002241
    mapNode_078448_002242
    2241 2242 114487
    mapNode_076207_002241_facts
    mapNode_078448_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_071725_008965_facts :
    MapFacts mapNode_071725_008965 8965 114487 :=
  map_facts_branch
    mapNode_071725_004482
    mapNode_076207_004483
    4482 4483 114487
    mapNode_071725_004482_facts
    mapNode_076207_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_080690_facts :
    MapFacts mapChunk_080690 560 114487 :=
  checkMap_sound mapChunk_080690 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_081250_facts :
    MapFacts mapChunk_081250 560 114487 :=
  checkMap_sound mapChunk_081250 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_080690_001120_facts :
    MapFacts mapNode_080690_001120 1120 114487 :=
  map_facts_branch
    mapChunk_080690
    mapChunk_081250
    560 560 114487
    mapChunk_080690_facts
    mapChunk_081250_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_081810_facts :
    MapFacts mapChunk_081810 560 114487 :=
  checkMap_sound mapChunk_081810 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_082370_facts :
    MapFacts mapChunk_082370 561 114487 :=
  checkMap_sound mapChunk_082370 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_081810_001121_facts :
    MapFacts mapNode_081810_001121 1121 114487 :=
  map_facts_branch
    mapChunk_081810
    mapChunk_082370
    560 561 114487
    mapChunk_081810_facts
    mapChunk_082370_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_080690_002241_facts :
    MapFacts mapNode_080690_002241 2241 114487 :=
  map_facts_branch
    mapNode_080690_001120
    mapNode_081810_001121
    1120 1121 114487
    mapNode_080690_001120_facts
    mapNode_081810_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_082931_facts :
    MapFacts mapChunk_082931 560 114487 :=
  checkMap_sound mapChunk_082931 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_083491_facts :
    MapFacts mapChunk_083491 561 114487 :=
  checkMap_sound mapChunk_083491 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_082931_001121_facts :
    MapFacts mapNode_082931_001121 1121 114487 :=
  map_facts_branch
    mapChunk_082931
    mapChunk_083491
    560 561 114487
    mapChunk_082931_facts
    mapChunk_083491_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_084052_facts :
    MapFacts mapChunk_084052 560 114487 :=
  checkMap_sound mapChunk_084052 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_084612_facts :
    MapFacts mapChunk_084612 561 114487 :=
  checkMap_sound mapChunk_084612 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_084052_001121_facts :
    MapFacts mapNode_084052_001121 1121 114487 :=
  map_facts_branch
    mapChunk_084052
    mapChunk_084612
    560 561 114487
    mapChunk_084052_facts
    mapChunk_084612_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_082931_002242_facts :
    MapFacts mapNode_082931_002242 2242 114487 :=
  map_facts_branch
    mapNode_082931_001121
    mapNode_084052_001121
    1121 1121 114487
    mapNode_082931_001121_facts
    mapNode_084052_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_080690_004483_facts :
    MapFacts mapNode_080690_004483 4483 114487 :=
  map_facts_branch
    mapNode_080690_002241
    mapNode_082931_002242
    2241 2242 114487
    mapNode_080690_002241_facts
    mapNode_082931_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_085173_facts :
    MapFacts mapChunk_085173 560 114487 :=
  checkMap_sound mapChunk_085173 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_085733_facts :
    MapFacts mapChunk_085733 560 114487 :=
  checkMap_sound mapChunk_085733 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_085173_001120_facts :
    MapFacts mapNode_085173_001120 1120 114487 :=
  map_facts_branch
    mapChunk_085173
    mapChunk_085733
    560 560 114487
    mapChunk_085173_facts
    mapChunk_085733_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_086293_facts :
    MapFacts mapChunk_086293 560 114487 :=
  checkMap_sound mapChunk_086293 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_086853_facts :
    MapFacts mapChunk_086853 561 114487 :=
  checkMap_sound mapChunk_086853 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_086293_001121_facts :
    MapFacts mapNode_086293_001121 1121 114487 :=
  map_facts_branch
    mapChunk_086293
    mapChunk_086853
    560 561 114487
    mapChunk_086293_facts
    mapChunk_086853_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_085173_002241_facts :
    MapFacts mapNode_085173_002241 2241 114487 :=
  map_facts_branch
    mapNode_085173_001120
    mapNode_086293_001121
    1120 1121 114487
    mapNode_085173_001120_facts
    mapNode_086293_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_087414_facts :
    MapFacts mapChunk_087414 560 114487 :=
  checkMap_sound mapChunk_087414 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_087974_facts :
    MapFacts mapChunk_087974 561 114487 :=
  checkMap_sound mapChunk_087974 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_087414_001121_facts :
    MapFacts mapNode_087414_001121 1121 114487 :=
  map_facts_branch
    mapChunk_087414
    mapChunk_087974
    560 561 114487
    mapChunk_087414_facts
    mapChunk_087974_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_088535_facts :
    MapFacts mapChunk_088535 560 114487 :=
  checkMap_sound mapChunk_088535 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_089095_facts :
    MapFacts mapChunk_089095 561 114487 :=
  checkMap_sound mapChunk_089095 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t160\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_088535_001121_facts :
    MapFacts mapNode_088535_001121 1121 114487 :=
  map_facts_branch
    mapChunk_088535
    mapChunk_089095
    560 561 114487
    mapChunk_088535_facts
    mapChunk_089095_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_087414_002242_facts :
    MapFacts mapNode_087414_002242 2242 114487 :=
  map_facts_branch
    mapNode_087414_001121
    mapNode_088535_001121
    1121 1121 114487
    mapNode_087414_001121_facts
    mapNode_088535_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_085173_004483_facts :
    MapFacts mapNode_085173_004483 4483 114487 :=
  map_facts_branch
    mapNode_085173_002241
    mapNode_087414_002242
    2241 2242 114487
    mapNode_085173_002241_facts
    mapNode_087414_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_080690_008966_facts :
    MapFacts mapNode_080690_008966 8966 114487 :=
  map_facts_branch
    mapNode_080690_004483
    mapNode_085173_004483
    4483 4483 114487
    mapNode_080690_004483_facts
    mapNode_085173_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_071725_017931_facts :
    MapFacts mapNode_071725_017931 17931 114487 :=
  map_facts_branch
    mapNode_071725_008965
    mapNode_080690_008966
    8965 8966 114487
    mapNode_071725_008965_facts
    mapNode_080690_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_089656_facts :
    MapFacts mapChunk_089656 560 114487 :=
  checkMap_sound mapChunk_089656 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_090216_facts :
    MapFacts mapChunk_090216 560 114487 :=
  checkMap_sound mapChunk_090216 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_089656_001120_facts :
    MapFacts mapNode_089656_001120 1120 114487 :=
  map_facts_branch
    mapChunk_089656
    mapChunk_090216
    560 560 114487
    mapChunk_089656_facts
    mapChunk_090216_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_090776_facts :
    MapFacts mapChunk_090776 560 114487 :=
  checkMap_sound mapChunk_090776 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_091336_facts :
    MapFacts mapChunk_091336 561 114487 :=
  checkMap_sound mapChunk_091336 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_090776_001121_facts :
    MapFacts mapNode_090776_001121 1121 114487 :=
  map_facts_branch
    mapChunk_090776
    mapChunk_091336
    560 561 114487
    mapChunk_090776_facts
    mapChunk_091336_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_089656_002241_facts :
    MapFacts mapNode_089656_002241 2241 114487 :=
  map_facts_branch
    mapNode_089656_001120
    mapNode_090776_001121
    1120 1121 114487
    mapNode_089656_001120_facts
    mapNode_090776_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_091897_facts :
    MapFacts mapChunk_091897 560 114487 :=
  checkMap_sound mapChunk_091897 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_092457_facts :
    MapFacts mapChunk_092457 560 114487 :=
  checkMap_sound mapChunk_092457 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_091897_001120_facts :
    MapFacts mapNode_091897_001120 1120 114487 :=
  map_facts_branch
    mapChunk_091897
    mapChunk_092457
    560 560 114487
    mapChunk_091897_facts
    mapChunk_092457_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_093017_facts :
    MapFacts mapChunk_093017 560 114487 :=
  checkMap_sound mapChunk_093017 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_093577_facts :
    MapFacts mapChunk_093577 561 114487 :=
  checkMap_sound mapChunk_093577 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_093017_001121_facts :
    MapFacts mapNode_093017_001121 1121 114487 :=
  map_facts_branch
    mapChunk_093017
    mapChunk_093577
    560 561 114487
    mapChunk_093017_facts
    mapChunk_093577_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_091897_002241_facts :
    MapFacts mapNode_091897_002241 2241 114487 :=
  map_facts_branch
    mapNode_091897_001120
    mapNode_093017_001121
    1120 1121 114487
    mapNode_091897_001120_facts
    mapNode_093017_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_089656_004482_facts :
    MapFacts mapNode_089656_004482 4482 114487 :=
  map_facts_branch
    mapNode_089656_002241
    mapNode_091897_002241
    2241 2241 114487
    mapNode_089656_002241_facts
    mapNode_091897_002241_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_094138_facts :
    MapFacts mapChunk_094138 560 114487 :=
  checkMap_sound mapChunk_094138 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_094698_facts :
    MapFacts mapChunk_094698 560 114487 :=
  checkMap_sound mapChunk_094698 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_094138_001120_facts :
    MapFacts mapNode_094138_001120 1120 114487 :=
  map_facts_branch
    mapChunk_094138
    mapChunk_094698
    560 560 114487
    mapChunk_094138_facts
    mapChunk_094698_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_095258_facts :
    MapFacts mapChunk_095258 560 114487 :=
  checkMap_sound mapChunk_095258 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_095818_facts :
    MapFacts mapChunk_095818 561 114487 :=
  checkMap_sound mapChunk_095818 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_095258_001121_facts :
    MapFacts mapNode_095258_001121 1121 114487 :=
  map_facts_branch
    mapChunk_095258
    mapChunk_095818
    560 561 114487
    mapChunk_095258_facts
    mapChunk_095818_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_094138_002241_facts :
    MapFacts mapNode_094138_002241 2241 114487 :=
  map_facts_branch
    mapNode_094138_001120
    mapNode_095258_001121
    1120 1121 114487
    mapNode_094138_001120_facts
    mapNode_095258_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_096379_facts :
    MapFacts mapChunk_096379 560 114487 :=
  checkMap_sound mapChunk_096379 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_096939_facts :
    MapFacts mapChunk_096939 561 114487 :=
  checkMap_sound mapChunk_096939 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_096379_001121_facts :
    MapFacts mapNode_096379_001121 1121 114487 :=
  map_facts_branch
    mapChunk_096379
    mapChunk_096939
    560 561 114487
    mapChunk_096379_facts
    mapChunk_096939_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_097500_facts :
    MapFacts mapChunk_097500 560 114487 :=
  checkMap_sound mapChunk_097500 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_098060_facts :
    MapFacts mapChunk_098060 561 114487 :=
  checkMap_sound mapChunk_098060 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_097500_001121_facts :
    MapFacts mapNode_097500_001121 1121 114487 :=
  map_facts_branch
    mapChunk_097500
    mapChunk_098060
    560 561 114487
    mapChunk_097500_facts
    mapChunk_098060_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_096379_002242_facts :
    MapFacts mapNode_096379_002242 2242 114487 :=
  map_facts_branch
    mapNode_096379_001121
    mapNode_097500_001121
    1121 1121 114487
    mapNode_096379_001121_facts
    mapNode_097500_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_094138_004483_facts :
    MapFacts mapNode_094138_004483 4483 114487 :=
  map_facts_branch
    mapNode_094138_002241
    mapNode_096379_002242
    2241 2242 114487
    mapNode_094138_002241_facts
    mapNode_096379_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_089656_008965_facts :
    MapFacts mapNode_089656_008965 8965 114487 :=
  map_facts_branch
    mapNode_089656_004482
    mapNode_094138_004483
    4482 4483 114487
    mapNode_089656_004482_facts
    mapNode_094138_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_098621_facts :
    MapFacts mapChunk_098621 560 114487 :=
  checkMap_sound mapChunk_098621 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_099181_facts :
    MapFacts mapChunk_099181 560 114487 :=
  checkMap_sound mapChunk_099181 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_098621_001120_facts :
    MapFacts mapNode_098621_001120 1120 114487 :=
  map_facts_branch
    mapChunk_098621
    mapChunk_099181
    560 560 114487
    mapChunk_098621_facts
    mapChunk_099181_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_099741_facts :
    MapFacts mapChunk_099741 560 114487 :=
  checkMap_sound mapChunk_099741 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_100301_facts :
    MapFacts mapChunk_100301 561 114487 :=
  checkMap_sound mapChunk_100301 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_099741_001121_facts :
    MapFacts mapNode_099741_001121 1121 114487 :=
  map_facts_branch
    mapChunk_099741
    mapChunk_100301
    560 561 114487
    mapChunk_099741_facts
    mapChunk_100301_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_098621_002241_facts :
    MapFacts mapNode_098621_002241 2241 114487 :=
  map_facts_branch
    mapNode_098621_001120
    mapNode_099741_001121
    1120 1121 114487
    mapNode_098621_001120_facts
    mapNode_099741_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_100862_facts :
    MapFacts mapChunk_100862 560 114487 :=
  checkMap_sound mapChunk_100862 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_101422_facts :
    MapFacts mapChunk_101422 561 114487 :=
  checkMap_sound mapChunk_101422 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_100862_001121_facts :
    MapFacts mapNode_100862_001121 1121 114487 :=
  map_facts_branch
    mapChunk_100862
    mapChunk_101422
    560 561 114487
    mapChunk_100862_facts
    mapChunk_101422_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_101983_facts :
    MapFacts mapChunk_101983 560 114487 :=
  checkMap_sound mapChunk_101983 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_102543_facts :
    MapFacts mapChunk_102543 561 114487 :=
  checkMap_sound mapChunk_102543 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_101983_001121_facts :
    MapFacts mapNode_101983_001121 1121 114487 :=
  map_facts_branch
    mapChunk_101983
    mapChunk_102543
    560 561 114487
    mapChunk_101983_facts
    mapChunk_102543_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_100862_002242_facts :
    MapFacts mapNode_100862_002242 2242 114487 :=
  map_facts_branch
    mapNode_100862_001121
    mapNode_101983_001121
    1121 1121 114487
    mapNode_100862_001121_facts
    mapNode_101983_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_098621_004483_facts :
    MapFacts mapNode_098621_004483 4483 114487 :=
  map_facts_branch
    mapNode_098621_002241
    mapNode_100862_002242
    2241 2242 114487
    mapNode_098621_002241_facts
    mapNode_100862_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_103104_facts :
    MapFacts mapChunk_103104 560 114487 :=
  checkMap_sound mapChunk_103104 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_103664_facts :
    MapFacts mapChunk_103664 560 114487 :=
  checkMap_sound mapChunk_103664 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_103104_001120_facts :
    MapFacts mapNode_103104_001120 1120 114487 :=
  map_facts_branch
    mapChunk_103104
    mapChunk_103664
    560 560 114487
    mapChunk_103104_facts
    mapChunk_103664_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_104224_facts :
    MapFacts mapChunk_104224 560 114487 :=
  checkMap_sound mapChunk_104224 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_104784_facts :
    MapFacts mapChunk_104784 561 114487 :=
  checkMap_sound mapChunk_104784 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_104224_001121_facts :
    MapFacts mapNode_104224_001121 1121 114487 :=
  map_facts_branch
    mapChunk_104224
    mapChunk_104784
    560 561 114487
    mapChunk_104224_facts
    mapChunk_104784_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_103104_002241_facts :
    MapFacts mapNode_103104_002241 2241 114487 :=
  map_facts_branch
    mapNode_103104_001120
    mapNode_104224_001121
    1120 1121 114487
    mapNode_103104_001120_facts
    mapNode_104224_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_105345_facts :
    MapFacts mapChunk_105345 560 114487 :=
  checkMap_sound mapChunk_105345 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_105905_facts :
    MapFacts mapChunk_105905 561 114487 :=
  checkMap_sound mapChunk_105905 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_105345_001121_facts :
    MapFacts mapNode_105345_001121 1121 114487 :=
  map_facts_branch
    mapChunk_105345
    mapChunk_105905
    560 561 114487
    mapChunk_105345_facts
    mapChunk_105905_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_106466_facts :
    MapFacts mapChunk_106466 560 114487 :=
  checkMap_sound mapChunk_106466 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_107026_facts :
    MapFacts mapChunk_107026 561 114487 :=
  checkMap_sound mapChunk_107026 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t192\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_106466_001121_facts :
    MapFacts mapNode_106466_001121 1121 114487 :=
  map_facts_branch
    mapChunk_106466
    mapChunk_107026
    560 561 114487
    mapChunk_106466_facts
    mapChunk_107026_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_105345_002242_facts :
    MapFacts mapNode_105345_002242 2242 114487 :=
  map_facts_branch
    mapNode_105345_001121
    mapNode_106466_001121
    1121 1121 114487
    mapNode_105345_001121_facts
    mapNode_106466_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_103104_004483_facts :
    MapFacts mapNode_103104_004483 4483 114487 :=
  map_facts_branch
    mapNode_103104_002241
    mapNode_105345_002242
    2241 2242 114487
    mapNode_103104_002241_facts
    mapNode_105345_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_098621_008966_facts :
    MapFacts mapNode_098621_008966 8966 114487 :=
  map_facts_branch
    mapNode_098621_004483
    mapNode_103104_004483
    4483 4483 114487
    mapNode_098621_004483_facts
    mapNode_103104_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_089656_017931_facts :
    MapFacts mapNode_089656_017931 17931 114487 :=
  map_facts_branch
    mapNode_089656_008965
    mapNode_098621_008966
    8965 8966 114487
    mapNode_089656_008965_facts
    mapNode_098621_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_071725_035862_facts :
    MapFacts mapNode_071725_035862 35862 114487 :=
  map_facts_branch
    mapNode_071725_017931
    mapNode_089656_017931
    17931 17931 114487
    mapNode_071725_017931_facts
    mapNode_089656_017931_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_107587_facts :
    MapFacts mapChunk_107587 560 114487 :=
  checkMap_sound mapChunk_107587 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_108147_facts :
    MapFacts mapChunk_108147 560 114487 :=
  checkMap_sound mapChunk_108147 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_107587_001120_facts :
    MapFacts mapNode_107587_001120 1120 114487 :=
  map_facts_branch
    mapChunk_107587
    mapChunk_108147
    560 560 114487
    mapChunk_107587_facts
    mapChunk_108147_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_108707_facts :
    MapFacts mapChunk_108707 560 114487 :=
  checkMap_sound mapChunk_108707 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_109267_facts :
    MapFacts mapChunk_109267 561 114487 :=
  checkMap_sound mapChunk_109267 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_108707_001121_facts :
    MapFacts mapNode_108707_001121 1121 114487 :=
  map_facts_branch
    mapChunk_108707
    mapChunk_109267
    560 561 114487
    mapChunk_108707_facts
    mapChunk_109267_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_107587_002241_facts :
    MapFacts mapNode_107587_002241 2241 114487 :=
  map_facts_branch
    mapNode_107587_001120
    mapNode_108707_001121
    1120 1121 114487
    mapNode_107587_001120_facts
    mapNode_108707_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_109828_facts :
    MapFacts mapChunk_109828 560 114487 :=
  checkMap_sound mapChunk_109828 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_110388_facts :
    MapFacts mapChunk_110388 560 114487 :=
  checkMap_sound mapChunk_110388 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_109828_001120_facts :
    MapFacts mapNode_109828_001120 1120 114487 :=
  map_facts_branch
    mapChunk_109828
    mapChunk_110388
    560 560 114487
    mapChunk_109828_facts
    mapChunk_110388_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_110948_facts :
    MapFacts mapChunk_110948 560 114487 :=
  checkMap_sound mapChunk_110948 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_111508_facts :
    MapFacts mapChunk_111508 561 114487 :=
  checkMap_sound mapChunk_111508 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_110948_001121_facts :
    MapFacts mapNode_110948_001121 1121 114487 :=
  map_facts_branch
    mapChunk_110948
    mapChunk_111508
    560 561 114487
    mapChunk_110948_facts
    mapChunk_111508_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_109828_002241_facts :
    MapFacts mapNode_109828_002241 2241 114487 :=
  map_facts_branch
    mapNode_109828_001120
    mapNode_110948_001121
    1120 1121 114487
    mapNode_109828_001120_facts
    mapNode_110948_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_107587_004482_facts :
    MapFacts mapNode_107587_004482 4482 114487 :=
  map_facts_branch
    mapNode_107587_002241
    mapNode_109828_002241
    2241 2241 114487
    mapNode_107587_002241_facts
    mapNode_109828_002241_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_112069_facts :
    MapFacts mapChunk_112069 560 114487 :=
  checkMap_sound mapChunk_112069 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_112629_facts :
    MapFacts mapChunk_112629 560 114487 :=
  checkMap_sound mapChunk_112629 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_112069_001120_facts :
    MapFacts mapNode_112069_001120 1120 114487 :=
  map_facts_branch
    mapChunk_112069
    mapChunk_112629
    560 560 114487
    mapChunk_112069_facts
    mapChunk_112629_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_113189_facts :
    MapFacts mapChunk_113189 560 114487 :=
  checkMap_sound mapChunk_113189 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_113749_facts :
    MapFacts mapChunk_113749 561 114487 :=
  checkMap_sound mapChunk_113749 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_113189_001121_facts :
    MapFacts mapNode_113189_001121 1121 114487 :=
  map_facts_branch
    mapChunk_113189
    mapChunk_113749
    560 561 114487
    mapChunk_113189_facts
    mapChunk_113749_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_112069_002241_facts :
    MapFacts mapNode_112069_002241 2241 114487 :=
  map_facts_branch
    mapNode_112069_001120
    mapNode_113189_001121
    1120 1121 114487
    mapNode_112069_001120_facts
    mapNode_113189_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_114310_facts :
    MapFacts mapChunk_114310 560 114487 :=
  checkMap_sound mapChunk_114310 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_114870_facts :
    MapFacts mapChunk_114870 561 114487 :=
  checkMap_sound mapChunk_114870 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_114310_001121_facts :
    MapFacts mapNode_114310_001121 1121 114487 :=
  map_facts_branch
    mapChunk_114310
    mapChunk_114870
    560 561 114487
    mapChunk_114310_facts
    mapChunk_114870_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_115431_facts :
    MapFacts mapChunk_115431 560 114487 :=
  checkMap_sound mapChunk_115431 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_115991_facts :
    MapFacts mapChunk_115991 561 114487 :=
  checkMap_sound mapChunk_115991 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_115431_001121_facts :
    MapFacts mapNode_115431_001121 1121 114487 :=
  map_facts_branch
    mapChunk_115431
    mapChunk_115991
    560 561 114487
    mapChunk_115431_facts
    mapChunk_115991_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_114310_002242_facts :
    MapFacts mapNode_114310_002242 2242 114487 :=
  map_facts_branch
    mapNode_114310_001121
    mapNode_115431_001121
    1121 1121 114487
    mapNode_114310_001121_facts
    mapNode_115431_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_112069_004483_facts :
    MapFacts mapNode_112069_004483 4483 114487 :=
  map_facts_branch
    mapNode_112069_002241
    mapNode_114310_002242
    2241 2242 114487
    mapNode_112069_002241_facts
    mapNode_114310_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_107587_008965_facts :
    MapFacts mapNode_107587_008965 8965 114487 :=
  map_facts_branch
    mapNode_107587_004482
    mapNode_112069_004483
    4482 4483 114487
    mapNode_107587_004482_facts
    mapNode_112069_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_116552_facts :
    MapFacts mapChunk_116552 560 114487 :=
  checkMap_sound mapChunk_116552 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_117112_facts :
    MapFacts mapChunk_117112 560 114487 :=
  checkMap_sound mapChunk_117112 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_116552_001120_facts :
    MapFacts mapNode_116552_001120 1120 114487 :=
  map_facts_branch
    mapChunk_116552
    mapChunk_117112
    560 560 114487
    mapChunk_116552_facts
    mapChunk_117112_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_117672_facts :
    MapFacts mapChunk_117672 560 114487 :=
  checkMap_sound mapChunk_117672 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_118232_facts :
    MapFacts mapChunk_118232 561 114487 :=
  checkMap_sound mapChunk_118232 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_117672_001121_facts :
    MapFacts mapNode_117672_001121 1121 114487 :=
  map_facts_branch
    mapChunk_117672
    mapChunk_118232
    560 561 114487
    mapChunk_117672_facts
    mapChunk_118232_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_116552_002241_facts :
    MapFacts mapNode_116552_002241 2241 114487 :=
  map_facts_branch
    mapNode_116552_001120
    mapNode_117672_001121
    1120 1121 114487
    mapNode_116552_001120_facts
    mapNode_117672_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_118793_facts :
    MapFacts mapChunk_118793 560 114487 :=
  checkMap_sound mapChunk_118793 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_119353_facts :
    MapFacts mapChunk_119353 561 114487 :=
  checkMap_sound mapChunk_119353 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_118793_001121_facts :
    MapFacts mapNode_118793_001121 1121 114487 :=
  map_facts_branch
    mapChunk_118793
    mapChunk_119353
    560 561 114487
    mapChunk_118793_facts
    mapChunk_119353_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_119914_facts :
    MapFacts mapChunk_119914 560 114487 :=
  checkMap_sound mapChunk_119914 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_120474_facts :
    MapFacts mapChunk_120474 561 114487 :=
  checkMap_sound mapChunk_120474 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_119914_001121_facts :
    MapFacts mapNode_119914_001121 1121 114487 :=
  map_facts_branch
    mapChunk_119914
    mapChunk_120474
    560 561 114487
    mapChunk_119914_facts
    mapChunk_120474_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_118793_002242_facts :
    MapFacts mapNode_118793_002242 2242 114487 :=
  map_facts_branch
    mapNode_118793_001121
    mapNode_119914_001121
    1121 1121 114487
    mapNode_118793_001121_facts
    mapNode_119914_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_116552_004483_facts :
    MapFacts mapNode_116552_004483 4483 114487 :=
  map_facts_branch
    mapNode_116552_002241
    mapNode_118793_002242
    2241 2242 114487
    mapNode_116552_002241_facts
    mapNode_118793_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_121035_facts :
    MapFacts mapChunk_121035 560 114487 :=
  checkMap_sound mapChunk_121035 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_121595_facts :
    MapFacts mapChunk_121595 560 114487 :=
  checkMap_sound mapChunk_121595 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_121035_001120_facts :
    MapFacts mapNode_121035_001120 1120 114487 :=
  map_facts_branch
    mapChunk_121035
    mapChunk_121595
    560 560 114487
    mapChunk_121035_facts
    mapChunk_121595_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_122155_facts :
    MapFacts mapChunk_122155 560 114487 :=
  checkMap_sound mapChunk_122155 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_122715_facts :
    MapFacts mapChunk_122715 561 114487 :=
  checkMap_sound mapChunk_122715 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_122155_001121_facts :
    MapFacts mapNode_122155_001121 1121 114487 :=
  map_facts_branch
    mapChunk_122155
    mapChunk_122715
    560 561 114487
    mapChunk_122155_facts
    mapChunk_122715_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_121035_002241_facts :
    MapFacts mapNode_121035_002241 2241 114487 :=
  map_facts_branch
    mapNode_121035_001120
    mapNode_122155_001121
    1120 1121 114487
    mapNode_121035_001120_facts
    mapNode_122155_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_123276_facts :
    MapFacts mapChunk_123276 560 114487 :=
  checkMap_sound mapChunk_123276 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_123836_facts :
    MapFacts mapChunk_123836 561 114487 :=
  checkMap_sound mapChunk_123836 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_123276_001121_facts :
    MapFacts mapNode_123276_001121 1121 114487 :=
  map_facts_branch
    mapChunk_123276
    mapChunk_123836
    560 561 114487
    mapChunk_123276_facts
    mapChunk_123836_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_124397_facts :
    MapFacts mapChunk_124397 560 114487 :=
  checkMap_sound mapChunk_124397 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_124957_facts :
    MapFacts mapChunk_124957 561 114487 :=
  checkMap_sound mapChunk_124957 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t224\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_124397_001121_facts :
    MapFacts mapNode_124397_001121 1121 114487 :=
  map_facts_branch
    mapChunk_124397
    mapChunk_124957
    560 561 114487
    mapChunk_124397_facts
    mapChunk_124957_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_123276_002242_facts :
    MapFacts mapNode_123276_002242 2242 114487 :=
  map_facts_branch
    mapNode_123276_001121
    mapNode_124397_001121
    1121 1121 114487
    mapNode_123276_001121_facts
    mapNode_124397_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_121035_004483_facts :
    MapFacts mapNode_121035_004483 4483 114487 :=
  map_facts_branch
    mapNode_121035_002241
    mapNode_123276_002242
    2241 2242 114487
    mapNode_121035_002241_facts
    mapNode_123276_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_116552_008966_facts :
    MapFacts mapNode_116552_008966 8966 114487 :=
  map_facts_branch
    mapNode_116552_004483
    mapNode_121035_004483
    4483 4483 114487
    mapNode_116552_004483_facts
    mapNode_121035_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_107587_017931_facts :
    MapFacts mapNode_107587_017931 17931 114487 :=
  map_facts_branch
    mapNode_107587_008965
    mapNode_116552_008966
    8965 8966 114487
    mapNode_107587_008965_facts
    mapNode_116552_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_125518_facts :
    MapFacts mapChunk_125518 560 114487 :=
  checkMap_sound mapChunk_125518 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_126078_facts :
    MapFacts mapChunk_126078 560 114487 :=
  checkMap_sound mapChunk_126078 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_125518_001120_facts :
    MapFacts mapNode_125518_001120 1120 114487 :=
  map_facts_branch
    mapChunk_125518
    mapChunk_126078
    560 560 114487
    mapChunk_125518_facts
    mapChunk_126078_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_126638_facts :
    MapFacts mapChunk_126638 560 114487 :=
  checkMap_sound mapChunk_126638 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_127198_facts :
    MapFacts mapChunk_127198 561 114487 :=
  checkMap_sound mapChunk_127198 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_126638_001121_facts :
    MapFacts mapNode_126638_001121 1121 114487 :=
  map_facts_branch
    mapChunk_126638
    mapChunk_127198
    560 561 114487
    mapChunk_126638_facts
    mapChunk_127198_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_125518_002241_facts :
    MapFacts mapNode_125518_002241 2241 114487 :=
  map_facts_branch
    mapNode_125518_001120
    mapNode_126638_001121
    1120 1121 114487
    mapNode_125518_001120_facts
    mapNode_126638_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_127759_facts :
    MapFacts mapChunk_127759 560 114487 :=
  checkMap_sound mapChunk_127759 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_128319_facts :
    MapFacts mapChunk_128319 561 114487 :=
  checkMap_sound mapChunk_128319 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_127759_001121_facts :
    MapFacts mapNode_127759_001121 1121 114487 :=
  map_facts_branch
    mapChunk_127759
    mapChunk_128319
    560 561 114487
    mapChunk_127759_facts
    mapChunk_128319_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_128880_facts :
    MapFacts mapChunk_128880 560 114487 :=
  checkMap_sound mapChunk_128880 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_129440_facts :
    MapFacts mapChunk_129440 561 114487 :=
  checkMap_sound mapChunk_129440 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_128880_001121_facts :
    MapFacts mapNode_128880_001121 1121 114487 :=
  map_facts_branch
    mapChunk_128880
    mapChunk_129440
    560 561 114487
    mapChunk_128880_facts
    mapChunk_129440_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_127759_002242_facts :
    MapFacts mapNode_127759_002242 2242 114487 :=
  map_facts_branch
    mapNode_127759_001121
    mapNode_128880_001121
    1121 1121 114487
    mapNode_127759_001121_facts
    mapNode_128880_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_125518_004483_facts :
    MapFacts mapNode_125518_004483 4483 114487 :=
  map_facts_branch
    mapNode_125518_002241
    mapNode_127759_002242
    2241 2242 114487
    mapNode_125518_002241_facts
    mapNode_127759_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_130001_facts :
    MapFacts mapChunk_130001 560 114487 :=
  checkMap_sound mapChunk_130001 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_130561_facts :
    MapFacts mapChunk_130561 560 114487 :=
  checkMap_sound mapChunk_130561 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_130001_001120_facts :
    MapFacts mapNode_130001_001120 1120 114487 :=
  map_facts_branch
    mapChunk_130001
    mapChunk_130561
    560 560 114487
    mapChunk_130001_facts
    mapChunk_130561_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_131121_facts :
    MapFacts mapChunk_131121 560 114487 :=
  checkMap_sound mapChunk_131121 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_131681_facts :
    MapFacts mapChunk_131681 561 114487 :=
  checkMap_sound mapChunk_131681 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_131121_001121_facts :
    MapFacts mapNode_131121_001121 1121 114487 :=
  map_facts_branch
    mapChunk_131121
    mapChunk_131681
    560 561 114487
    mapChunk_131121_facts
    mapChunk_131681_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_130001_002241_facts :
    MapFacts mapNode_130001_002241 2241 114487 :=
  map_facts_branch
    mapNode_130001_001120
    mapNode_131121_001121
    1120 1121 114487
    mapNode_130001_001120_facts
    mapNode_131121_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_132242_facts :
    MapFacts mapChunk_132242 560 114487 :=
  checkMap_sound mapChunk_132242 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_132802_facts :
    MapFacts mapChunk_132802 561 114487 :=
  checkMap_sound mapChunk_132802 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_132242_001121_facts :
    MapFacts mapNode_132242_001121 1121 114487 :=
  map_facts_branch
    mapChunk_132242
    mapChunk_132802
    560 561 114487
    mapChunk_132242_facts
    mapChunk_132802_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_133363_facts :
    MapFacts mapChunk_133363 560 114487 :=
  checkMap_sound mapChunk_133363 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_133923_facts :
    MapFacts mapChunk_133923 561 114487 :=
  checkMap_sound mapChunk_133923 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_133363_001121_facts :
    MapFacts mapNode_133363_001121 1121 114487 :=
  map_facts_branch
    mapChunk_133363
    mapChunk_133923
    560 561 114487
    mapChunk_133363_facts
    mapChunk_133923_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_132242_002242_facts :
    MapFacts mapNode_132242_002242 2242 114487 :=
  map_facts_branch
    mapNode_132242_001121
    mapNode_133363_001121
    1121 1121 114487
    mapNode_132242_001121_facts
    mapNode_133363_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_130001_004483_facts :
    MapFacts mapNode_130001_004483 4483 114487 :=
  map_facts_branch
    mapNode_130001_002241
    mapNode_132242_002242
    2241 2242 114487
    mapNode_130001_002241_facts
    mapNode_132242_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_125518_008966_facts :
    MapFacts mapNode_125518_008966 8966 114487 :=
  map_facts_branch
    mapNode_125518_004483
    mapNode_130001_004483
    4483 4483 114487
    mapNode_125518_004483_facts
    mapNode_130001_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_134484_facts :
    MapFacts mapChunk_134484 560 114487 :=
  checkMap_sound mapChunk_134484 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_135044_facts :
    MapFacts mapChunk_135044 560 114487 :=
  checkMap_sound mapChunk_135044 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_134484_001120_facts :
    MapFacts mapNode_134484_001120 1120 114487 :=
  map_facts_branch
    mapChunk_134484
    mapChunk_135044
    560 560 114487
    mapChunk_134484_facts
    mapChunk_135044_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_135604_facts :
    MapFacts mapChunk_135604 560 114487 :=
  checkMap_sound mapChunk_135604 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_136164_facts :
    MapFacts mapChunk_136164 561 114487 :=
  checkMap_sound mapChunk_136164 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_135604_001121_facts :
    MapFacts mapNode_135604_001121 1121 114487 :=
  map_facts_branch
    mapChunk_135604
    mapChunk_136164
    560 561 114487
    mapChunk_135604_facts
    mapChunk_136164_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_134484_002241_facts :
    MapFacts mapNode_134484_002241 2241 114487 :=
  map_facts_branch
    mapNode_134484_001120
    mapNode_135604_001121
    1120 1121 114487
    mapNode_134484_001120_facts
    mapNode_135604_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_136725_facts :
    MapFacts mapChunk_136725 560 114487 :=
  checkMap_sound mapChunk_136725 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_137285_facts :
    MapFacts mapChunk_137285 561 114487 :=
  checkMap_sound mapChunk_137285 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_136725_001121_facts :
    MapFacts mapNode_136725_001121 1121 114487 :=
  map_facts_branch
    mapChunk_136725
    mapChunk_137285
    560 561 114487
    mapChunk_136725_facts
    mapChunk_137285_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_137846_facts :
    MapFacts mapChunk_137846 560 114487 :=
  checkMap_sound mapChunk_137846 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_138406_facts :
    MapFacts mapChunk_138406 561 114487 :=
  checkMap_sound mapChunk_138406 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_137846_001121_facts :
    MapFacts mapNode_137846_001121 1121 114487 :=
  map_facts_branch
    mapChunk_137846
    mapChunk_138406
    560 561 114487
    mapChunk_137846_facts
    mapChunk_138406_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_136725_002242_facts :
    MapFacts mapNode_136725_002242 2242 114487 :=
  map_facts_branch
    mapNode_136725_001121
    mapNode_137846_001121
    1121 1121 114487
    mapNode_136725_001121_facts
    mapNode_137846_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_134484_004483_facts :
    MapFacts mapNode_134484_004483 4483 114487 :=
  map_facts_branch
    mapNode_134484_002241
    mapNode_136725_002242
    2241 2242 114487
    mapNode_134484_002241_facts
    mapNode_136725_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_138967_facts :
    MapFacts mapChunk_138967 560 114487 :=
  checkMap_sound mapChunk_138967 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_139527_facts :
    MapFacts mapChunk_139527 560 114487 :=
  checkMap_sound mapChunk_139527 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_138967_001120_facts :
    MapFacts mapNode_138967_001120 1120 114487 :=
  map_facts_branch
    mapChunk_138967
    mapChunk_139527
    560 560 114487
    mapChunk_138967_facts
    mapChunk_139527_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_140087_facts :
    MapFacts mapChunk_140087 560 114487 :=
  checkMap_sound mapChunk_140087 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_140647_facts :
    MapFacts mapChunk_140647 561 114487 :=
  checkMap_sound mapChunk_140647 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_140087_001121_facts :
    MapFacts mapNode_140087_001121 1121 114487 :=
  map_facts_branch
    mapChunk_140087
    mapChunk_140647
    560 561 114487
    mapChunk_140087_facts
    mapChunk_140647_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_138967_002241_facts :
    MapFacts mapNode_138967_002241 2241 114487 :=
  map_facts_branch
    mapNode_138967_001120
    mapNode_140087_001121
    1120 1121 114487
    mapNode_138967_001120_facts
    mapNode_140087_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_141208_facts :
    MapFacts mapChunk_141208 560 114487 :=
  checkMap_sound mapChunk_141208 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_141768_facts :
    MapFacts mapChunk_141768 561 114487 :=
  checkMap_sound mapChunk_141768 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_141208_001121_facts :
    MapFacts mapNode_141208_001121 1121 114487 :=
  map_facts_branch
    mapChunk_141208
    mapChunk_141768
    560 561 114487
    mapChunk_141208_facts
    mapChunk_141768_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_142329_facts :
    MapFacts mapChunk_142329 560 114487 :=
  checkMap_sound mapChunk_142329 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_142889_facts :
    MapFacts mapChunk_142889 561 114487 :=
  checkMap_sound mapChunk_142889 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t256\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_142329_001121_facts :
    MapFacts mapNode_142329_001121 1121 114487 :=
  map_facts_branch
    mapChunk_142329
    mapChunk_142889
    560 561 114487
    mapChunk_142329_facts
    mapChunk_142889_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_141208_002242_facts :
    MapFacts mapNode_141208_002242 2242 114487 :=
  map_facts_branch
    mapNode_141208_001121
    mapNode_142329_001121
    1121 1121 114487
    mapNode_141208_001121_facts
    mapNode_142329_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_138967_004483_facts :
    MapFacts mapNode_138967_004483 4483 114487 :=
  map_facts_branch
    mapNode_138967_002241
    mapNode_141208_002242
    2241 2242 114487
    mapNode_138967_002241_facts
    mapNode_141208_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_134484_008966_facts :
    MapFacts mapNode_134484_008966 8966 114487 :=
  map_facts_branch
    mapNode_134484_004483
    mapNode_138967_004483
    4483 4483 114487
    mapNode_134484_004483_facts
    mapNode_138967_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_125518_017932_facts :
    MapFacts mapNode_125518_017932 17932 114487 :=
  map_facts_branch
    mapNode_125518_008966
    mapNode_134484_008966
    8966 8966 114487
    mapNode_125518_008966_facts
    mapNode_134484_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_107587_035863_facts :
    MapFacts mapNode_107587_035863 35863 114487 :=
  map_facts_branch
    mapNode_107587_017931
    mapNode_125518_017932
    17931 17932 114487
    mapNode_107587_017931_facts
    mapNode_125518_017932_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_071725_071725_facts :
    MapFacts mapNode_071725_071725 71725 114487 :=
  map_facts_branch
    mapNode_071725_035862
    mapNode_107587_035863
    35862 35863 114487
    mapNode_071725_035862_facts
    mapNode_107587_035863_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_000000_143450_facts :
    MapFacts mapNode_000000_143450 143450 114487 :=
  map_facts_branch
    mapNode_000000_071725
    mapNode_071725_071725
    71725 71725 114487
    mapNode_000000_071725_facts
    mapNode_071725_071725_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_143450_facts :
    MapFacts mapChunk_143450 560 114487 :=
  checkMap_sound mapChunk_143450 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_144010_facts :
    MapFacts mapChunk_144010 560 114487 :=
  checkMap_sound mapChunk_144010 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_143450_001120_facts :
    MapFacts mapNode_143450_001120 1120 114487 :=
  map_facts_branch
    mapChunk_143450
    mapChunk_144010
    560 560 114487
    mapChunk_143450_facts
    mapChunk_144010_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_144570_facts :
    MapFacts mapChunk_144570 560 114487 :=
  checkMap_sound mapChunk_144570 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_145130_facts :
    MapFacts mapChunk_145130 561 114487 :=
  checkMap_sound mapChunk_145130 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_144570_001121_facts :
    MapFacts mapNode_144570_001121 1121 114487 :=
  map_facts_branch
    mapChunk_144570
    mapChunk_145130
    560 561 114487
    mapChunk_144570_facts
    mapChunk_145130_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_143450_002241_facts :
    MapFacts mapNode_143450_002241 2241 114487 :=
  map_facts_branch
    mapNode_143450_001120
    mapNode_144570_001121
    1120 1121 114487
    mapNode_143450_001120_facts
    mapNode_144570_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_145691_facts :
    MapFacts mapChunk_145691 560 114487 :=
  checkMap_sound mapChunk_145691 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_146251_facts :
    MapFacts mapChunk_146251 560 114487 :=
  checkMap_sound mapChunk_146251 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_145691_001120_facts :
    MapFacts mapNode_145691_001120 1120 114487 :=
  map_facts_branch
    mapChunk_145691
    mapChunk_146251
    560 560 114487
    mapChunk_145691_facts
    mapChunk_146251_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_146811_facts :
    MapFacts mapChunk_146811 560 114487 :=
  checkMap_sound mapChunk_146811 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_147371_facts :
    MapFacts mapChunk_147371 561 114487 :=
  checkMap_sound mapChunk_147371 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_146811_001121_facts :
    MapFacts mapNode_146811_001121 1121 114487 :=
  map_facts_branch
    mapChunk_146811
    mapChunk_147371
    560 561 114487
    mapChunk_146811_facts
    mapChunk_147371_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_145691_002241_facts :
    MapFacts mapNode_145691_002241 2241 114487 :=
  map_facts_branch
    mapNode_145691_001120
    mapNode_146811_001121
    1120 1121 114487
    mapNode_145691_001120_facts
    mapNode_146811_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_143450_004482_facts :
    MapFacts mapNode_143450_004482 4482 114487 :=
  map_facts_branch
    mapNode_143450_002241
    mapNode_145691_002241
    2241 2241 114487
    mapNode_143450_002241_facts
    mapNode_145691_002241_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_147932_facts :
    MapFacts mapChunk_147932 560 114487 :=
  checkMap_sound mapChunk_147932 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_148492_facts :
    MapFacts mapChunk_148492 560 114487 :=
  checkMap_sound mapChunk_148492 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_147932_001120_facts :
    MapFacts mapNode_147932_001120 1120 114487 :=
  map_facts_branch
    mapChunk_147932
    mapChunk_148492
    560 560 114487
    mapChunk_147932_facts
    mapChunk_148492_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_149052_facts :
    MapFacts mapChunk_149052 560 114487 :=
  checkMap_sound mapChunk_149052 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_149612_facts :
    MapFacts mapChunk_149612 561 114487 :=
  checkMap_sound mapChunk_149612 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_149052_001121_facts :
    MapFacts mapNode_149052_001121 1121 114487 :=
  map_facts_branch
    mapChunk_149052
    mapChunk_149612
    560 561 114487
    mapChunk_149052_facts
    mapChunk_149612_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_147932_002241_facts :
    MapFacts mapNode_147932_002241 2241 114487 :=
  map_facts_branch
    mapNode_147932_001120
    mapNode_149052_001121
    1120 1121 114487
    mapNode_147932_001120_facts
    mapNode_149052_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_150173_facts :
    MapFacts mapChunk_150173 560 114487 :=
  checkMap_sound mapChunk_150173 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_150733_facts :
    MapFacts mapChunk_150733 561 114487 :=
  checkMap_sound mapChunk_150733 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_150173_001121_facts :
    MapFacts mapNode_150173_001121 1121 114487 :=
  map_facts_branch
    mapChunk_150173
    mapChunk_150733
    560 561 114487
    mapChunk_150173_facts
    mapChunk_150733_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_151294_facts :
    MapFacts mapChunk_151294 560 114487 :=
  checkMap_sound mapChunk_151294 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_151854_facts :
    MapFacts mapChunk_151854 561 114487 :=
  checkMap_sound mapChunk_151854 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_151294_001121_facts :
    MapFacts mapNode_151294_001121 1121 114487 :=
  map_facts_branch
    mapChunk_151294
    mapChunk_151854
    560 561 114487
    mapChunk_151294_facts
    mapChunk_151854_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_150173_002242_facts :
    MapFacts mapNode_150173_002242 2242 114487 :=
  map_facts_branch
    mapNode_150173_001121
    mapNode_151294_001121
    1121 1121 114487
    mapNode_150173_001121_facts
    mapNode_151294_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_147932_004483_facts :
    MapFacts mapNode_147932_004483 4483 114487 :=
  map_facts_branch
    mapNode_147932_002241
    mapNode_150173_002242
    2241 2242 114487
    mapNode_147932_002241_facts
    mapNode_150173_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_143450_008965_facts :
    MapFacts mapNode_143450_008965 8965 114487 :=
  map_facts_branch
    mapNode_143450_004482
    mapNode_147932_004483
    4482 4483 114487
    mapNode_143450_004482_facts
    mapNode_147932_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_152415_facts :
    MapFacts mapChunk_152415 560 114487 :=
  checkMap_sound mapChunk_152415 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_152975_facts :
    MapFacts mapChunk_152975 560 114487 :=
  checkMap_sound mapChunk_152975 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_152415_001120_facts :
    MapFacts mapNode_152415_001120 1120 114487 :=
  map_facts_branch
    mapChunk_152415
    mapChunk_152975
    560 560 114487
    mapChunk_152415_facts
    mapChunk_152975_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_153535_facts :
    MapFacts mapChunk_153535 560 114487 :=
  checkMap_sound mapChunk_153535 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_154095_facts :
    MapFacts mapChunk_154095 561 114487 :=
  checkMap_sound mapChunk_154095 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_153535_001121_facts :
    MapFacts mapNode_153535_001121 1121 114487 :=
  map_facts_branch
    mapChunk_153535
    mapChunk_154095
    560 561 114487
    mapChunk_153535_facts
    mapChunk_154095_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_152415_002241_facts :
    MapFacts mapNode_152415_002241 2241 114487 :=
  map_facts_branch
    mapNode_152415_001120
    mapNode_153535_001121
    1120 1121 114487
    mapNode_152415_001120_facts
    mapNode_153535_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_154656_facts :
    MapFacts mapChunk_154656 560 114487 :=
  checkMap_sound mapChunk_154656 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_155216_facts :
    MapFacts mapChunk_155216 561 114487 :=
  checkMap_sound mapChunk_155216 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_154656_001121_facts :
    MapFacts mapNode_154656_001121 1121 114487 :=
  map_facts_branch
    mapChunk_154656
    mapChunk_155216
    560 561 114487
    mapChunk_154656_facts
    mapChunk_155216_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_155777_facts :
    MapFacts mapChunk_155777 560 114487 :=
  checkMap_sound mapChunk_155777 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_156337_facts :
    MapFacts mapChunk_156337 561 114487 :=
  checkMap_sound mapChunk_156337 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_155777_001121_facts :
    MapFacts mapNode_155777_001121 1121 114487 :=
  map_facts_branch
    mapChunk_155777
    mapChunk_156337
    560 561 114487
    mapChunk_155777_facts
    mapChunk_156337_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_154656_002242_facts :
    MapFacts mapNode_154656_002242 2242 114487 :=
  map_facts_branch
    mapNode_154656_001121
    mapNode_155777_001121
    1121 1121 114487
    mapNode_154656_001121_facts
    mapNode_155777_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_152415_004483_facts :
    MapFacts mapNode_152415_004483 4483 114487 :=
  map_facts_branch
    mapNode_152415_002241
    mapNode_154656_002242
    2241 2242 114487
    mapNode_152415_002241_facts
    mapNode_154656_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_156898_facts :
    MapFacts mapChunk_156898 560 114487 :=
  checkMap_sound mapChunk_156898 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_157458_facts :
    MapFacts mapChunk_157458 560 114487 :=
  checkMap_sound mapChunk_157458 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_156898_001120_facts :
    MapFacts mapNode_156898_001120 1120 114487 :=
  map_facts_branch
    mapChunk_156898
    mapChunk_157458
    560 560 114487
    mapChunk_156898_facts
    mapChunk_157458_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_158018_facts :
    MapFacts mapChunk_158018 560 114487 :=
  checkMap_sound mapChunk_158018 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_158578_facts :
    MapFacts mapChunk_158578 561 114487 :=
  checkMap_sound mapChunk_158578 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_158018_001121_facts :
    MapFacts mapNode_158018_001121 1121 114487 :=
  map_facts_branch
    mapChunk_158018
    mapChunk_158578
    560 561 114487
    mapChunk_158018_facts
    mapChunk_158578_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_156898_002241_facts :
    MapFacts mapNode_156898_002241 2241 114487 :=
  map_facts_branch
    mapNode_156898_001120
    mapNode_158018_001121
    1120 1121 114487
    mapNode_156898_001120_facts
    mapNode_158018_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_159139_facts :
    MapFacts mapChunk_159139 560 114487 :=
  checkMap_sound mapChunk_159139 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_159699_facts :
    MapFacts mapChunk_159699 561 114487 :=
  checkMap_sound mapChunk_159699 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_159139_001121_facts :
    MapFacts mapNode_159139_001121 1121 114487 :=
  map_facts_branch
    mapChunk_159139
    mapChunk_159699
    560 561 114487
    mapChunk_159139_facts
    mapChunk_159699_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_160260_facts :
    MapFacts mapChunk_160260 560 114487 :=
  checkMap_sound mapChunk_160260 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_160820_facts :
    MapFacts mapChunk_160820 561 114487 :=
  checkMap_sound mapChunk_160820 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t288\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_160260_001121_facts :
    MapFacts mapNode_160260_001121 1121 114487 :=
  map_facts_branch
    mapChunk_160260
    mapChunk_160820
    560 561 114487
    mapChunk_160260_facts
    mapChunk_160820_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_159139_002242_facts :
    MapFacts mapNode_159139_002242 2242 114487 :=
  map_facts_branch
    mapNode_159139_001121
    mapNode_160260_001121
    1121 1121 114487
    mapNode_159139_001121_facts
    mapNode_160260_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_156898_004483_facts :
    MapFacts mapNode_156898_004483 4483 114487 :=
  map_facts_branch
    mapNode_156898_002241
    mapNode_159139_002242
    2241 2242 114487
    mapNode_156898_002241_facts
    mapNode_159139_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_152415_008966_facts :
    MapFacts mapNode_152415_008966 8966 114487 :=
  map_facts_branch
    mapNode_152415_004483
    mapNode_156898_004483
    4483 4483 114487
    mapNode_152415_004483_facts
    mapNode_156898_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_143450_017931_facts :
    MapFacts mapNode_143450_017931 17931 114487 :=
  map_facts_branch
    mapNode_143450_008965
    mapNode_152415_008966
    8965 8966 114487
    mapNode_143450_008965_facts
    mapNode_152415_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_161381_facts :
    MapFacts mapChunk_161381 560 114487 :=
  checkMap_sound mapChunk_161381 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_161941_facts :
    MapFacts mapChunk_161941 560 114487 :=
  checkMap_sound mapChunk_161941 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_161381_001120_facts :
    MapFacts mapNode_161381_001120 1120 114487 :=
  map_facts_branch
    mapChunk_161381
    mapChunk_161941
    560 560 114487
    mapChunk_161381_facts
    mapChunk_161941_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_162501_facts :
    MapFacts mapChunk_162501 560 114487 :=
  checkMap_sound mapChunk_162501 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_163061_facts :
    MapFacts mapChunk_163061 561 114487 :=
  checkMap_sound mapChunk_163061 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_162501_001121_facts :
    MapFacts mapNode_162501_001121 1121 114487 :=
  map_facts_branch
    mapChunk_162501
    mapChunk_163061
    560 561 114487
    mapChunk_162501_facts
    mapChunk_163061_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_161381_002241_facts :
    MapFacts mapNode_161381_002241 2241 114487 :=
  map_facts_branch
    mapNode_161381_001120
    mapNode_162501_001121
    1120 1121 114487
    mapNode_161381_001120_facts
    mapNode_162501_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_163622_facts :
    MapFacts mapChunk_163622 560 114487 :=
  checkMap_sound mapChunk_163622 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_164182_facts :
    MapFacts mapChunk_164182 560 114487 :=
  checkMap_sound mapChunk_164182 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_163622_001120_facts :
    MapFacts mapNode_163622_001120 1120 114487 :=
  map_facts_branch
    mapChunk_163622
    mapChunk_164182
    560 560 114487
    mapChunk_163622_facts
    mapChunk_164182_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_164742_facts :
    MapFacts mapChunk_164742 560 114487 :=
  checkMap_sound mapChunk_164742 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_165302_facts :
    MapFacts mapChunk_165302 561 114487 :=
  checkMap_sound mapChunk_165302 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_164742_001121_facts :
    MapFacts mapNode_164742_001121 1121 114487 :=
  map_facts_branch
    mapChunk_164742
    mapChunk_165302
    560 561 114487
    mapChunk_164742_facts
    mapChunk_165302_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_163622_002241_facts :
    MapFacts mapNode_163622_002241 2241 114487 :=
  map_facts_branch
    mapNode_163622_001120
    mapNode_164742_001121
    1120 1121 114487
    mapNode_163622_001120_facts
    mapNode_164742_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_161381_004482_facts :
    MapFacts mapNode_161381_004482 4482 114487 :=
  map_facts_branch
    mapNode_161381_002241
    mapNode_163622_002241
    2241 2241 114487
    mapNode_161381_002241_facts
    mapNode_163622_002241_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_165863_facts :
    MapFacts mapChunk_165863 560 114487 :=
  checkMap_sound mapChunk_165863 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_166423_facts :
    MapFacts mapChunk_166423 560 114487 :=
  checkMap_sound mapChunk_166423 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_165863_001120_facts :
    MapFacts mapNode_165863_001120 1120 114487 :=
  map_facts_branch
    mapChunk_165863
    mapChunk_166423
    560 560 114487
    mapChunk_165863_facts
    mapChunk_166423_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_166983_facts :
    MapFacts mapChunk_166983 560 114487 :=
  checkMap_sound mapChunk_166983 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_167543_facts :
    MapFacts mapChunk_167543 561 114487 :=
  checkMap_sound mapChunk_167543 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_166983_001121_facts :
    MapFacts mapNode_166983_001121 1121 114487 :=
  map_facts_branch
    mapChunk_166983
    mapChunk_167543
    560 561 114487
    mapChunk_166983_facts
    mapChunk_167543_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_165863_002241_facts :
    MapFacts mapNode_165863_002241 2241 114487 :=
  map_facts_branch
    mapNode_165863_001120
    mapNode_166983_001121
    1120 1121 114487
    mapNode_165863_001120_facts
    mapNode_166983_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_168104_facts :
    MapFacts mapChunk_168104 560 114487 :=
  checkMap_sound mapChunk_168104 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_168664_facts :
    MapFacts mapChunk_168664 561 114487 :=
  checkMap_sound mapChunk_168664 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_168104_001121_facts :
    MapFacts mapNode_168104_001121 1121 114487 :=
  map_facts_branch
    mapChunk_168104
    mapChunk_168664
    560 561 114487
    mapChunk_168104_facts
    mapChunk_168664_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_169225_facts :
    MapFacts mapChunk_169225 560 114487 :=
  checkMap_sound mapChunk_169225 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_169785_facts :
    MapFacts mapChunk_169785 561 114487 :=
  checkMap_sound mapChunk_169785 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_169225_001121_facts :
    MapFacts mapNode_169225_001121 1121 114487 :=
  map_facts_branch
    mapChunk_169225
    mapChunk_169785
    560 561 114487
    mapChunk_169225_facts
    mapChunk_169785_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_168104_002242_facts :
    MapFacts mapNode_168104_002242 2242 114487 :=
  map_facts_branch
    mapNode_168104_001121
    mapNode_169225_001121
    1121 1121 114487
    mapNode_168104_001121_facts
    mapNode_169225_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_165863_004483_facts :
    MapFacts mapNode_165863_004483 4483 114487 :=
  map_facts_branch
    mapNode_165863_002241
    mapNode_168104_002242
    2241 2242 114487
    mapNode_165863_002241_facts
    mapNode_168104_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_161381_008965_facts :
    MapFacts mapNode_161381_008965 8965 114487 :=
  map_facts_branch
    mapNode_161381_004482
    mapNode_165863_004483
    4482 4483 114487
    mapNode_161381_004482_facts
    mapNode_165863_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_170346_facts :
    MapFacts mapChunk_170346 560 114487 :=
  checkMap_sound mapChunk_170346 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_170906_facts :
    MapFacts mapChunk_170906 560 114487 :=
  checkMap_sound mapChunk_170906 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_170346_001120_facts :
    MapFacts mapNode_170346_001120 1120 114487 :=
  map_facts_branch
    mapChunk_170346
    mapChunk_170906
    560 560 114487
    mapChunk_170346_facts
    mapChunk_170906_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_171466_facts :
    MapFacts mapChunk_171466 560 114487 :=
  checkMap_sound mapChunk_171466 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_172026_facts :
    MapFacts mapChunk_172026 561 114487 :=
  checkMap_sound mapChunk_172026 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_171466_001121_facts :
    MapFacts mapNode_171466_001121 1121 114487 :=
  map_facts_branch
    mapChunk_171466
    mapChunk_172026
    560 561 114487
    mapChunk_171466_facts
    mapChunk_172026_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_170346_002241_facts :
    MapFacts mapNode_170346_002241 2241 114487 :=
  map_facts_branch
    mapNode_170346_001120
    mapNode_171466_001121
    1120 1121 114487
    mapNode_170346_001120_facts
    mapNode_171466_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_172587_facts :
    MapFacts mapChunk_172587 560 114487 :=
  checkMap_sound mapChunk_172587 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_173147_facts :
    MapFacts mapChunk_173147 561 114487 :=
  checkMap_sound mapChunk_173147 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_172587_001121_facts :
    MapFacts mapNode_172587_001121 1121 114487 :=
  map_facts_branch
    mapChunk_172587
    mapChunk_173147
    560 561 114487
    mapChunk_172587_facts
    mapChunk_173147_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_173708_facts :
    MapFacts mapChunk_173708 560 114487 :=
  checkMap_sound mapChunk_173708 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_174268_facts :
    MapFacts mapChunk_174268 561 114487 :=
  checkMap_sound mapChunk_174268 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_173708_001121_facts :
    MapFacts mapNode_173708_001121 1121 114487 :=
  map_facts_branch
    mapChunk_173708
    mapChunk_174268
    560 561 114487
    mapChunk_173708_facts
    mapChunk_174268_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_172587_002242_facts :
    MapFacts mapNode_172587_002242 2242 114487 :=
  map_facts_branch
    mapNode_172587_001121
    mapNode_173708_001121
    1121 1121 114487
    mapNode_172587_001121_facts
    mapNode_173708_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_170346_004483_facts :
    MapFacts mapNode_170346_004483 4483 114487 :=
  map_facts_branch
    mapNode_170346_002241
    mapNode_172587_002242
    2241 2242 114487
    mapNode_170346_002241_facts
    mapNode_172587_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_174829_facts :
    MapFacts mapChunk_174829 560 114487 :=
  checkMap_sound mapChunk_174829 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_175389_facts :
    MapFacts mapChunk_175389 560 114487 :=
  checkMap_sound mapChunk_175389 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_174829_001120_facts :
    MapFacts mapNode_174829_001120 1120 114487 :=
  map_facts_branch
    mapChunk_174829
    mapChunk_175389
    560 560 114487
    mapChunk_174829_facts
    mapChunk_175389_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_175949_facts :
    MapFacts mapChunk_175949 560 114487 :=
  checkMap_sound mapChunk_175949 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_176509_facts :
    MapFacts mapChunk_176509 561 114487 :=
  checkMap_sound mapChunk_176509 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_175949_001121_facts :
    MapFacts mapNode_175949_001121 1121 114487 :=
  map_facts_branch
    mapChunk_175949
    mapChunk_176509
    560 561 114487
    mapChunk_175949_facts
    mapChunk_176509_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_174829_002241_facts :
    MapFacts mapNode_174829_002241 2241 114487 :=
  map_facts_branch
    mapNode_174829_001120
    mapNode_175949_001121
    1120 1121 114487
    mapNode_174829_001120_facts
    mapNode_175949_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_177070_facts :
    MapFacts mapChunk_177070 560 114487 :=
  checkMap_sound mapChunk_177070 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_177630_facts :
    MapFacts mapChunk_177630 561 114487 :=
  checkMap_sound mapChunk_177630 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_177070_001121_facts :
    MapFacts mapNode_177070_001121 1121 114487 :=
  map_facts_branch
    mapChunk_177070
    mapChunk_177630
    560 561 114487
    mapChunk_177070_facts
    mapChunk_177630_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_178191_facts :
    MapFacts mapChunk_178191 560 114487 :=
  checkMap_sound mapChunk_178191 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_178751_facts :
    MapFacts mapChunk_178751 561 114487 :=
  checkMap_sound mapChunk_178751 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t320\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_178191_001121_facts :
    MapFacts mapNode_178191_001121 1121 114487 :=
  map_facts_branch
    mapChunk_178191
    mapChunk_178751
    560 561 114487
    mapChunk_178191_facts
    mapChunk_178751_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_177070_002242_facts :
    MapFacts mapNode_177070_002242 2242 114487 :=
  map_facts_branch
    mapNode_177070_001121
    mapNode_178191_001121
    1121 1121 114487
    mapNode_177070_001121_facts
    mapNode_178191_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_174829_004483_facts :
    MapFacts mapNode_174829_004483 4483 114487 :=
  map_facts_branch
    mapNode_174829_002241
    mapNode_177070_002242
    2241 2242 114487
    mapNode_174829_002241_facts
    mapNode_177070_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_170346_008966_facts :
    MapFacts mapNode_170346_008966 8966 114487 :=
  map_facts_branch
    mapNode_170346_004483
    mapNode_174829_004483
    4483 4483 114487
    mapNode_170346_004483_facts
    mapNode_174829_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_161381_017931_facts :
    MapFacts mapNode_161381_017931 17931 114487 :=
  map_facts_branch
    mapNode_161381_008965
    mapNode_170346_008966
    8965 8966 114487
    mapNode_161381_008965_facts
    mapNode_170346_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_143450_035862_facts :
    MapFacts mapNode_143450_035862 35862 114487 :=
  map_facts_branch
    mapNode_143450_017931
    mapNode_161381_017931
    17931 17931 114487
    mapNode_143450_017931_facts
    mapNode_161381_017931_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_179312_facts :
    MapFacts mapChunk_179312 560 114487 :=
  checkMap_sound mapChunk_179312 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_179872_facts :
    MapFacts mapChunk_179872 560 114487 :=
  checkMap_sound mapChunk_179872 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_179312_001120_facts :
    MapFacts mapNode_179312_001120 1120 114487 :=
  map_facts_branch
    mapChunk_179312
    mapChunk_179872
    560 560 114487
    mapChunk_179312_facts
    mapChunk_179872_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_180432_facts :
    MapFacts mapChunk_180432 560 114487 :=
  checkMap_sound mapChunk_180432 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_180992_facts :
    MapFacts mapChunk_180992 561 114487 :=
  checkMap_sound mapChunk_180992 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_180432_001121_facts :
    MapFacts mapNode_180432_001121 1121 114487 :=
  map_facts_branch
    mapChunk_180432
    mapChunk_180992
    560 561 114487
    mapChunk_180432_facts
    mapChunk_180992_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_179312_002241_facts :
    MapFacts mapNode_179312_002241 2241 114487 :=
  map_facts_branch
    mapNode_179312_001120
    mapNode_180432_001121
    1120 1121 114487
    mapNode_179312_001120_facts
    mapNode_180432_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_181553_facts :
    MapFacts mapChunk_181553 560 114487 :=
  checkMap_sound mapChunk_181553 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_182113_facts :
    MapFacts mapChunk_182113 560 114487 :=
  checkMap_sound mapChunk_182113 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_181553_001120_facts :
    MapFacts mapNode_181553_001120 1120 114487 :=
  map_facts_branch
    mapChunk_181553
    mapChunk_182113
    560 560 114487
    mapChunk_181553_facts
    mapChunk_182113_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_182673_facts :
    MapFacts mapChunk_182673 560 114487 :=
  checkMap_sound mapChunk_182673 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_183233_facts :
    MapFacts mapChunk_183233 561 114487 :=
  checkMap_sound mapChunk_183233 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_182673_001121_facts :
    MapFacts mapNode_182673_001121 1121 114487 :=
  map_facts_branch
    mapChunk_182673
    mapChunk_183233
    560 561 114487
    mapChunk_182673_facts
    mapChunk_183233_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_181553_002241_facts :
    MapFacts mapNode_181553_002241 2241 114487 :=
  map_facts_branch
    mapNode_181553_001120
    mapNode_182673_001121
    1120 1121 114487
    mapNode_181553_001120_facts
    mapNode_182673_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_179312_004482_facts :
    MapFacts mapNode_179312_004482 4482 114487 :=
  map_facts_branch
    mapNode_179312_002241
    mapNode_181553_002241
    2241 2241 114487
    mapNode_179312_002241_facts
    mapNode_181553_002241_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_183794_facts :
    MapFacts mapChunk_183794 560 114487 :=
  checkMap_sound mapChunk_183794 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_184354_facts :
    MapFacts mapChunk_184354 560 114487 :=
  checkMap_sound mapChunk_184354 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_183794_001120_facts :
    MapFacts mapNode_183794_001120 1120 114487 :=
  map_facts_branch
    mapChunk_183794
    mapChunk_184354
    560 560 114487
    mapChunk_183794_facts
    mapChunk_184354_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_184914_facts :
    MapFacts mapChunk_184914 560 114487 :=
  checkMap_sound mapChunk_184914 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_185474_facts :
    MapFacts mapChunk_185474 561 114487 :=
  checkMap_sound mapChunk_185474 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_184914_001121_facts :
    MapFacts mapNode_184914_001121 1121 114487 :=
  map_facts_branch
    mapChunk_184914
    mapChunk_185474
    560 561 114487
    mapChunk_184914_facts
    mapChunk_185474_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_183794_002241_facts :
    MapFacts mapNode_183794_002241 2241 114487 :=
  map_facts_branch
    mapNode_183794_001120
    mapNode_184914_001121
    1120 1121 114487
    mapNode_183794_001120_facts
    mapNode_184914_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_186035_facts :
    MapFacts mapChunk_186035 560 114487 :=
  checkMap_sound mapChunk_186035 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_186595_facts :
    MapFacts mapChunk_186595 561 114487 :=
  checkMap_sound mapChunk_186595 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_186035_001121_facts :
    MapFacts mapNode_186035_001121 1121 114487 :=
  map_facts_branch
    mapChunk_186035
    mapChunk_186595
    560 561 114487
    mapChunk_186035_facts
    mapChunk_186595_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_187156_facts :
    MapFacts mapChunk_187156 560 114487 :=
  checkMap_sound mapChunk_187156 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_187716_facts :
    MapFacts mapChunk_187716 561 114487 :=
  checkMap_sound mapChunk_187716 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_187156_001121_facts :
    MapFacts mapNode_187156_001121 1121 114487 :=
  map_facts_branch
    mapChunk_187156
    mapChunk_187716
    560 561 114487
    mapChunk_187156_facts
    mapChunk_187716_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_186035_002242_facts :
    MapFacts mapNode_186035_002242 2242 114487 :=
  map_facts_branch
    mapNode_186035_001121
    mapNode_187156_001121
    1121 1121 114487
    mapNode_186035_001121_facts
    mapNode_187156_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_183794_004483_facts :
    MapFacts mapNode_183794_004483 4483 114487 :=
  map_facts_branch
    mapNode_183794_002241
    mapNode_186035_002242
    2241 2242 114487
    mapNode_183794_002241_facts
    mapNode_186035_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_179312_008965_facts :
    MapFacts mapNode_179312_008965 8965 114487 :=
  map_facts_branch
    mapNode_179312_004482
    mapNode_183794_004483
    4482 4483 114487
    mapNode_179312_004482_facts
    mapNode_183794_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_188277_facts :
    MapFacts mapChunk_188277 560 114487 :=
  checkMap_sound mapChunk_188277 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_188837_facts :
    MapFacts mapChunk_188837 560 114487 :=
  checkMap_sound mapChunk_188837 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_188277_001120_facts :
    MapFacts mapNode_188277_001120 1120 114487 :=
  map_facts_branch
    mapChunk_188277
    mapChunk_188837
    560 560 114487
    mapChunk_188277_facts
    mapChunk_188837_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_189397_facts :
    MapFacts mapChunk_189397 560 114487 :=
  checkMap_sound mapChunk_189397 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_189957_facts :
    MapFacts mapChunk_189957 561 114487 :=
  checkMap_sound mapChunk_189957 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_189397_001121_facts :
    MapFacts mapNode_189397_001121 1121 114487 :=
  map_facts_branch
    mapChunk_189397
    mapChunk_189957
    560 561 114487
    mapChunk_189397_facts
    mapChunk_189957_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_188277_002241_facts :
    MapFacts mapNode_188277_002241 2241 114487 :=
  map_facts_branch
    mapNode_188277_001120
    mapNode_189397_001121
    1120 1121 114487
    mapNode_188277_001120_facts
    mapNode_189397_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_190518_facts :
    MapFacts mapChunk_190518 560 114487 :=
  checkMap_sound mapChunk_190518 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_191078_facts :
    MapFacts mapChunk_191078 561 114487 :=
  checkMap_sound mapChunk_191078 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_190518_001121_facts :
    MapFacts mapNode_190518_001121 1121 114487 :=
  map_facts_branch
    mapChunk_190518
    mapChunk_191078
    560 561 114487
    mapChunk_190518_facts
    mapChunk_191078_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_191639_facts :
    MapFacts mapChunk_191639 560 114487 :=
  checkMap_sound mapChunk_191639 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_192199_facts :
    MapFacts mapChunk_192199 561 114487 :=
  checkMap_sound mapChunk_192199 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_191639_001121_facts :
    MapFacts mapNode_191639_001121 1121 114487 :=
  map_facts_branch
    mapChunk_191639
    mapChunk_192199
    560 561 114487
    mapChunk_191639_facts
    mapChunk_192199_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_190518_002242_facts :
    MapFacts mapNode_190518_002242 2242 114487 :=
  map_facts_branch
    mapNode_190518_001121
    mapNode_191639_001121
    1121 1121 114487
    mapNode_190518_001121_facts
    mapNode_191639_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_188277_004483_facts :
    MapFacts mapNode_188277_004483 4483 114487 :=
  map_facts_branch
    mapNode_188277_002241
    mapNode_190518_002242
    2241 2242 114487
    mapNode_188277_002241_facts
    mapNode_190518_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_192760_facts :
    MapFacts mapChunk_192760 560 114487 :=
  checkMap_sound mapChunk_192760 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_193320_facts :
    MapFacts mapChunk_193320 560 114487 :=
  checkMap_sound mapChunk_193320 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_192760_001120_facts :
    MapFacts mapNode_192760_001120 1120 114487 :=
  map_facts_branch
    mapChunk_192760
    mapChunk_193320
    560 560 114487
    mapChunk_192760_facts
    mapChunk_193320_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_193880_facts :
    MapFacts mapChunk_193880 560 114487 :=
  checkMap_sound mapChunk_193880 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_194440_facts :
    MapFacts mapChunk_194440 561 114487 :=
  checkMap_sound mapChunk_194440 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_193880_001121_facts :
    MapFacts mapNode_193880_001121 1121 114487 :=
  map_facts_branch
    mapChunk_193880
    mapChunk_194440
    560 561 114487
    mapChunk_193880_facts
    mapChunk_194440_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_192760_002241_facts :
    MapFacts mapNode_192760_002241 2241 114487 :=
  map_facts_branch
    mapNode_192760_001120
    mapNode_193880_001121
    1120 1121 114487
    mapNode_192760_001120_facts
    mapNode_193880_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_195001_facts :
    MapFacts mapChunk_195001 560 114487 :=
  checkMap_sound mapChunk_195001 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_195561_facts :
    MapFacts mapChunk_195561 561 114487 :=
  checkMap_sound mapChunk_195561 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_195001_001121_facts :
    MapFacts mapNode_195001_001121 1121 114487 :=
  map_facts_branch
    mapChunk_195001
    mapChunk_195561
    560 561 114487
    mapChunk_195001_facts
    mapChunk_195561_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_196122_facts :
    MapFacts mapChunk_196122 560 114487 :=
  checkMap_sound mapChunk_196122 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_196682_facts :
    MapFacts mapChunk_196682 561 114487 :=
  checkMap_sound mapChunk_196682 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t352\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_196122_001121_facts :
    MapFacts mapNode_196122_001121 1121 114487 :=
  map_facts_branch
    mapChunk_196122
    mapChunk_196682
    560 561 114487
    mapChunk_196122_facts
    mapChunk_196682_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_195001_002242_facts :
    MapFacts mapNode_195001_002242 2242 114487 :=
  map_facts_branch
    mapNode_195001_001121
    mapNode_196122_001121
    1121 1121 114487
    mapNode_195001_001121_facts
    mapNode_196122_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_192760_004483_facts :
    MapFacts mapNode_192760_004483 4483 114487 :=
  map_facts_branch
    mapNode_192760_002241
    mapNode_195001_002242
    2241 2242 114487
    mapNode_192760_002241_facts
    mapNode_195001_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_188277_008966_facts :
    MapFacts mapNode_188277_008966 8966 114487 :=
  map_facts_branch
    mapNode_188277_004483
    mapNode_192760_004483
    4483 4483 114487
    mapNode_188277_004483_facts
    mapNode_192760_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_179312_017931_facts :
    MapFacts mapNode_179312_017931 17931 114487 :=
  map_facts_branch
    mapNode_179312_008965
    mapNode_188277_008966
    8965 8966 114487
    mapNode_179312_008965_facts
    mapNode_188277_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_197243_facts :
    MapFacts mapChunk_197243 560 114487 :=
  checkMap_sound mapChunk_197243 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_197803_facts :
    MapFacts mapChunk_197803 560 114487 :=
  checkMap_sound mapChunk_197803 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_197243_001120_facts :
    MapFacts mapNode_197243_001120 1120 114487 :=
  map_facts_branch
    mapChunk_197243
    mapChunk_197803
    560 560 114487
    mapChunk_197243_facts
    mapChunk_197803_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_198363_facts :
    MapFacts mapChunk_198363 560 114487 :=
  checkMap_sound mapChunk_198363 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_198923_facts :
    MapFacts mapChunk_198923 561 114487 :=
  checkMap_sound mapChunk_198923 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_198363_001121_facts :
    MapFacts mapNode_198363_001121 1121 114487 :=
  map_facts_branch
    mapChunk_198363
    mapChunk_198923
    560 561 114487
    mapChunk_198363_facts
    mapChunk_198923_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_197243_002241_facts :
    MapFacts mapNode_197243_002241 2241 114487 :=
  map_facts_branch
    mapNode_197243_001120
    mapNode_198363_001121
    1120 1121 114487
    mapNode_197243_001120_facts
    mapNode_198363_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_199484_facts :
    MapFacts mapChunk_199484 560 114487 :=
  checkMap_sound mapChunk_199484 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_200044_facts :
    MapFacts mapChunk_200044 561 114487 :=
  checkMap_sound mapChunk_200044 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_199484_001121_facts :
    MapFacts mapNode_199484_001121 1121 114487 :=
  map_facts_branch
    mapChunk_199484
    mapChunk_200044
    560 561 114487
    mapChunk_199484_facts
    mapChunk_200044_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_200605_facts :
    MapFacts mapChunk_200605 560 114487 :=
  checkMap_sound mapChunk_200605 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_201165_facts :
    MapFacts mapChunk_201165 561 114487 :=
  checkMap_sound mapChunk_201165 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_200605_001121_facts :
    MapFacts mapNode_200605_001121 1121 114487 :=
  map_facts_branch
    mapChunk_200605
    mapChunk_201165
    560 561 114487
    mapChunk_200605_facts
    mapChunk_201165_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_199484_002242_facts :
    MapFacts mapNode_199484_002242 2242 114487 :=
  map_facts_branch
    mapNode_199484_001121
    mapNode_200605_001121
    1121 1121 114487
    mapNode_199484_001121_facts
    mapNode_200605_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_197243_004483_facts :
    MapFacts mapNode_197243_004483 4483 114487 :=
  map_facts_branch
    mapNode_197243_002241
    mapNode_199484_002242
    2241 2242 114487
    mapNode_197243_002241_facts
    mapNode_199484_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_201726_facts :
    MapFacts mapChunk_201726 560 114487 :=
  checkMap_sound mapChunk_201726 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_202286_facts :
    MapFacts mapChunk_202286 560 114487 :=
  checkMap_sound mapChunk_202286 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_201726_001120_facts :
    MapFacts mapNode_201726_001120 1120 114487 :=
  map_facts_branch
    mapChunk_201726
    mapChunk_202286
    560 560 114487
    mapChunk_201726_facts
    mapChunk_202286_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_202846_facts :
    MapFacts mapChunk_202846 560 114487 :=
  checkMap_sound mapChunk_202846 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_203406_facts :
    MapFacts mapChunk_203406 561 114487 :=
  checkMap_sound mapChunk_203406 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_202846_001121_facts :
    MapFacts mapNode_202846_001121 1121 114487 :=
  map_facts_branch
    mapChunk_202846
    mapChunk_203406
    560 561 114487
    mapChunk_202846_facts
    mapChunk_203406_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_201726_002241_facts :
    MapFacts mapNode_201726_002241 2241 114487 :=
  map_facts_branch
    mapNode_201726_001120
    mapNode_202846_001121
    1120 1121 114487
    mapNode_201726_001120_facts
    mapNode_202846_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_203967_facts :
    MapFacts mapChunk_203967 560 114487 :=
  checkMap_sound mapChunk_203967 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_204527_facts :
    MapFacts mapChunk_204527 561 114487 :=
  checkMap_sound mapChunk_204527 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_203967_001121_facts :
    MapFacts mapNode_203967_001121 1121 114487 :=
  map_facts_branch
    mapChunk_203967
    mapChunk_204527
    560 561 114487
    mapChunk_203967_facts
    mapChunk_204527_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_205088_facts :
    MapFacts mapChunk_205088 560 114487 :=
  checkMap_sound mapChunk_205088 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_205648_facts :
    MapFacts mapChunk_205648 561 114487 :=
  checkMap_sound mapChunk_205648 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_205088_001121_facts :
    MapFacts mapNode_205088_001121 1121 114487 :=
  map_facts_branch
    mapChunk_205088
    mapChunk_205648
    560 561 114487
    mapChunk_205088_facts
    mapChunk_205648_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_203967_002242_facts :
    MapFacts mapNode_203967_002242 2242 114487 :=
  map_facts_branch
    mapNode_203967_001121
    mapNode_205088_001121
    1121 1121 114487
    mapNode_203967_001121_facts
    mapNode_205088_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_201726_004483_facts :
    MapFacts mapNode_201726_004483 4483 114487 :=
  map_facts_branch
    mapNode_201726_002241
    mapNode_203967_002242
    2241 2242 114487
    mapNode_201726_002241_facts
    mapNode_203967_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_197243_008966_facts :
    MapFacts mapNode_197243_008966 8966 114487 :=
  map_facts_branch
    mapNode_197243_004483
    mapNode_201726_004483
    4483 4483 114487
    mapNode_197243_004483_facts
    mapNode_201726_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_206209_facts :
    MapFacts mapChunk_206209 560 114487 :=
  checkMap_sound mapChunk_206209 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_206769_facts :
    MapFacts mapChunk_206769 560 114487 :=
  checkMap_sound mapChunk_206769 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_206209_001120_facts :
    MapFacts mapNode_206209_001120 1120 114487 :=
  map_facts_branch
    mapChunk_206209
    mapChunk_206769
    560 560 114487
    mapChunk_206209_facts
    mapChunk_206769_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_207329_facts :
    MapFacts mapChunk_207329 560 114487 :=
  checkMap_sound mapChunk_207329 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_207889_facts :
    MapFacts mapChunk_207889 561 114487 :=
  checkMap_sound mapChunk_207889 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_207329_001121_facts :
    MapFacts mapNode_207329_001121 1121 114487 :=
  map_facts_branch
    mapChunk_207329
    mapChunk_207889
    560 561 114487
    mapChunk_207329_facts
    mapChunk_207889_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_206209_002241_facts :
    MapFacts mapNode_206209_002241 2241 114487 :=
  map_facts_branch
    mapNode_206209_001120
    mapNode_207329_001121
    1120 1121 114487
    mapNode_206209_001120_facts
    mapNode_207329_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_208450_facts :
    MapFacts mapChunk_208450 560 114487 :=
  checkMap_sound mapChunk_208450 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_209010_facts :
    MapFacts mapChunk_209010 561 114487 :=
  checkMap_sound mapChunk_209010 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_208450_001121_facts :
    MapFacts mapNode_208450_001121 1121 114487 :=
  map_facts_branch
    mapChunk_208450
    mapChunk_209010
    560 561 114487
    mapChunk_208450_facts
    mapChunk_209010_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_209571_facts :
    MapFacts mapChunk_209571 560 114487 :=
  checkMap_sound mapChunk_209571 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_210131_facts :
    MapFacts mapChunk_210131 561 114487 :=
  checkMap_sound mapChunk_210131 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_209571_001121_facts :
    MapFacts mapNode_209571_001121 1121 114487 :=
  map_facts_branch
    mapChunk_209571
    mapChunk_210131
    560 561 114487
    mapChunk_209571_facts
    mapChunk_210131_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_208450_002242_facts :
    MapFacts mapNode_208450_002242 2242 114487 :=
  map_facts_branch
    mapNode_208450_001121
    mapNode_209571_001121
    1121 1121 114487
    mapNode_208450_001121_facts
    mapNode_209571_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_206209_004483_facts :
    MapFacts mapNode_206209_004483 4483 114487 :=
  map_facts_branch
    mapNode_206209_002241
    mapNode_208450_002242
    2241 2242 114487
    mapNode_206209_002241_facts
    mapNode_208450_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_210692_facts :
    MapFacts mapChunk_210692 560 114487 :=
  checkMap_sound mapChunk_210692 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_211252_facts :
    MapFacts mapChunk_211252 560 114487 :=
  checkMap_sound mapChunk_211252 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_210692_001120_facts :
    MapFacts mapNode_210692_001120 1120 114487 :=
  map_facts_branch
    mapChunk_210692
    mapChunk_211252
    560 560 114487
    mapChunk_210692_facts
    mapChunk_211252_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_211812_facts :
    MapFacts mapChunk_211812 560 114487 :=
  checkMap_sound mapChunk_211812 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_212372_facts :
    MapFacts mapChunk_212372 561 114487 :=
  checkMap_sound mapChunk_212372 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_211812_001121_facts :
    MapFacts mapNode_211812_001121 1121 114487 :=
  map_facts_branch
    mapChunk_211812
    mapChunk_212372
    560 561 114487
    mapChunk_211812_facts
    mapChunk_212372_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_210692_002241_facts :
    MapFacts mapNode_210692_002241 2241 114487 :=
  map_facts_branch
    mapNode_210692_001120
    mapNode_211812_001121
    1120 1121 114487
    mapNode_210692_001120_facts
    mapNode_211812_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_212933_facts :
    MapFacts mapChunk_212933 560 114487 :=
  checkMap_sound mapChunk_212933 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_213493_facts :
    MapFacts mapChunk_213493 561 114487 :=
  checkMap_sound mapChunk_213493 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_212933_001121_facts :
    MapFacts mapNode_212933_001121 1121 114487 :=
  map_facts_branch
    mapChunk_212933
    mapChunk_213493
    560 561 114487
    mapChunk_212933_facts
    mapChunk_213493_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_214054_facts :
    MapFacts mapChunk_214054 560 114487 :=
  checkMap_sound mapChunk_214054 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_214614_facts :
    MapFacts mapChunk_214614 561 114487 :=
  checkMap_sound mapChunk_214614 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t384\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_214054_001121_facts :
    MapFacts mapNode_214054_001121 1121 114487 :=
  map_facts_branch
    mapChunk_214054
    mapChunk_214614
    560 561 114487
    mapChunk_214054_facts
    mapChunk_214614_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_212933_002242_facts :
    MapFacts mapNode_212933_002242 2242 114487 :=
  map_facts_branch
    mapNode_212933_001121
    mapNode_214054_001121
    1121 1121 114487
    mapNode_212933_001121_facts
    mapNode_214054_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_210692_004483_facts :
    MapFacts mapNode_210692_004483 4483 114487 :=
  map_facts_branch
    mapNode_210692_002241
    mapNode_212933_002242
    2241 2242 114487
    mapNode_210692_002241_facts
    mapNode_212933_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_206209_008966_facts :
    MapFacts mapNode_206209_008966 8966 114487 :=
  map_facts_branch
    mapNode_206209_004483
    mapNode_210692_004483
    4483 4483 114487
    mapNode_206209_004483_facts
    mapNode_210692_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_197243_017932_facts :
    MapFacts mapNode_197243_017932 17932 114487 :=
  map_facts_branch
    mapNode_197243_008966
    mapNode_206209_008966
    8966 8966 114487
    mapNode_197243_008966_facts
    mapNode_206209_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_179312_035863_facts :
    MapFacts mapNode_179312_035863 35863 114487 :=
  map_facts_branch
    mapNode_179312_017931
    mapNode_197243_017932
    17931 17932 114487
    mapNode_179312_017931_facts
    mapNode_197243_017932_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_143450_071725_facts :
    MapFacts mapNode_143450_071725 71725 114487 :=
  map_facts_branch
    mapNode_143450_035862
    mapNode_179312_035863
    35862 35863 114487
    mapNode_143450_035862_facts
    mapNode_179312_035863_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_215175_facts :
    MapFacts mapChunk_215175 560 114487 :=
  checkMap_sound mapChunk_215175 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_215735_facts :
    MapFacts mapChunk_215735 560 114487 :=
  checkMap_sound mapChunk_215735 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_215175_001120_facts :
    MapFacts mapNode_215175_001120 1120 114487 :=
  map_facts_branch
    mapChunk_215175
    mapChunk_215735
    560 560 114487
    mapChunk_215175_facts
    mapChunk_215735_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_216295_facts :
    MapFacts mapChunk_216295 560 114487 :=
  checkMap_sound mapChunk_216295 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_216855_facts :
    MapFacts mapChunk_216855 561 114487 :=
  checkMap_sound mapChunk_216855 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_216295_001121_facts :
    MapFacts mapNode_216295_001121 1121 114487 :=
  map_facts_branch
    mapChunk_216295
    mapChunk_216855
    560 561 114487
    mapChunk_216295_facts
    mapChunk_216855_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_215175_002241_facts :
    MapFacts mapNode_215175_002241 2241 114487 :=
  map_facts_branch
    mapNode_215175_001120
    mapNode_216295_001121
    1120 1121 114487
    mapNode_215175_001120_facts
    mapNode_216295_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_217416_facts :
    MapFacts mapChunk_217416 560 114487 :=
  checkMap_sound mapChunk_217416 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_217976_facts :
    MapFacts mapChunk_217976 560 114487 :=
  checkMap_sound mapChunk_217976 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_217416_001120_facts :
    MapFacts mapNode_217416_001120 1120 114487 :=
  map_facts_branch
    mapChunk_217416
    mapChunk_217976
    560 560 114487
    mapChunk_217416_facts
    mapChunk_217976_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_218536_facts :
    MapFacts mapChunk_218536 560 114487 :=
  checkMap_sound mapChunk_218536 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_219096_facts :
    MapFacts mapChunk_219096 561 114487 :=
  checkMap_sound mapChunk_219096 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_218536_001121_facts :
    MapFacts mapNode_218536_001121 1121 114487 :=
  map_facts_branch
    mapChunk_218536
    mapChunk_219096
    560 561 114487
    mapChunk_218536_facts
    mapChunk_219096_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_217416_002241_facts :
    MapFacts mapNode_217416_002241 2241 114487 :=
  map_facts_branch
    mapNode_217416_001120
    mapNode_218536_001121
    1120 1121 114487
    mapNode_217416_001120_facts
    mapNode_218536_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_215175_004482_facts :
    MapFacts mapNode_215175_004482 4482 114487 :=
  map_facts_branch
    mapNode_215175_002241
    mapNode_217416_002241
    2241 2241 114487
    mapNode_215175_002241_facts
    mapNode_217416_002241_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_219657_facts :
    MapFacts mapChunk_219657 560 114487 :=
  checkMap_sound mapChunk_219657 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_220217_facts :
    MapFacts mapChunk_220217 560 114487 :=
  checkMap_sound mapChunk_220217 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_219657_001120_facts :
    MapFacts mapNode_219657_001120 1120 114487 :=
  map_facts_branch
    mapChunk_219657
    mapChunk_220217
    560 560 114487
    mapChunk_219657_facts
    mapChunk_220217_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_220777_facts :
    MapFacts mapChunk_220777 560 114487 :=
  checkMap_sound mapChunk_220777 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_221337_facts :
    MapFacts mapChunk_221337 561 114487 :=
  checkMap_sound mapChunk_221337 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_220777_001121_facts :
    MapFacts mapNode_220777_001121 1121 114487 :=
  map_facts_branch
    mapChunk_220777
    mapChunk_221337
    560 561 114487
    mapChunk_220777_facts
    mapChunk_221337_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_219657_002241_facts :
    MapFacts mapNode_219657_002241 2241 114487 :=
  map_facts_branch
    mapNode_219657_001120
    mapNode_220777_001121
    1120 1121 114487
    mapNode_219657_001120_facts
    mapNode_220777_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_221898_facts :
    MapFacts mapChunk_221898 560 114487 :=
  checkMap_sound mapChunk_221898 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_222458_facts :
    MapFacts mapChunk_222458 561 114487 :=
  checkMap_sound mapChunk_222458 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_221898_001121_facts :
    MapFacts mapNode_221898_001121 1121 114487 :=
  map_facts_branch
    mapChunk_221898
    mapChunk_222458
    560 561 114487
    mapChunk_221898_facts
    mapChunk_222458_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_223019_facts :
    MapFacts mapChunk_223019 560 114487 :=
  checkMap_sound mapChunk_223019 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_223579_facts :
    MapFacts mapChunk_223579 561 114487 :=
  checkMap_sound mapChunk_223579 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_223019_001121_facts :
    MapFacts mapNode_223019_001121 1121 114487 :=
  map_facts_branch
    mapChunk_223019
    mapChunk_223579
    560 561 114487
    mapChunk_223019_facts
    mapChunk_223579_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_221898_002242_facts :
    MapFacts mapNode_221898_002242 2242 114487 :=
  map_facts_branch
    mapNode_221898_001121
    mapNode_223019_001121
    1121 1121 114487
    mapNode_221898_001121_facts
    mapNode_223019_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_219657_004483_facts :
    MapFacts mapNode_219657_004483 4483 114487 :=
  map_facts_branch
    mapNode_219657_002241
    mapNode_221898_002242
    2241 2242 114487
    mapNode_219657_002241_facts
    mapNode_221898_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_215175_008965_facts :
    MapFacts mapNode_215175_008965 8965 114487 :=
  map_facts_branch
    mapNode_215175_004482
    mapNode_219657_004483
    4482 4483 114487
    mapNode_215175_004482_facts
    mapNode_219657_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_224140_facts :
    MapFacts mapChunk_224140 560 114487 :=
  checkMap_sound mapChunk_224140 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_224700_facts :
    MapFacts mapChunk_224700 560 114487 :=
  checkMap_sound mapChunk_224700 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_224140_001120_facts :
    MapFacts mapNode_224140_001120 1120 114487 :=
  map_facts_branch
    mapChunk_224140
    mapChunk_224700
    560 560 114487
    mapChunk_224140_facts
    mapChunk_224700_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_225260_facts :
    MapFacts mapChunk_225260 560 114487 :=
  checkMap_sound mapChunk_225260 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_225820_facts :
    MapFacts mapChunk_225820 561 114487 :=
  checkMap_sound mapChunk_225820 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_225260_001121_facts :
    MapFacts mapNode_225260_001121 1121 114487 :=
  map_facts_branch
    mapChunk_225260
    mapChunk_225820
    560 561 114487
    mapChunk_225260_facts
    mapChunk_225820_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_224140_002241_facts :
    MapFacts mapNode_224140_002241 2241 114487 :=
  map_facts_branch
    mapNode_224140_001120
    mapNode_225260_001121
    1120 1121 114487
    mapNode_224140_001120_facts
    mapNode_225260_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_226381_facts :
    MapFacts mapChunk_226381 560 114487 :=
  checkMap_sound mapChunk_226381 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_226941_facts :
    MapFacts mapChunk_226941 561 114487 :=
  checkMap_sound mapChunk_226941 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_226381_001121_facts :
    MapFacts mapNode_226381_001121 1121 114487 :=
  map_facts_branch
    mapChunk_226381
    mapChunk_226941
    560 561 114487
    mapChunk_226381_facts
    mapChunk_226941_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_227502_facts :
    MapFacts mapChunk_227502 560 114487 :=
  checkMap_sound mapChunk_227502 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_228062_facts :
    MapFacts mapChunk_228062 561 114487 :=
  checkMap_sound mapChunk_228062 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_227502_001121_facts :
    MapFacts mapNode_227502_001121 1121 114487 :=
  map_facts_branch
    mapChunk_227502
    mapChunk_228062
    560 561 114487
    mapChunk_227502_facts
    mapChunk_228062_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_226381_002242_facts :
    MapFacts mapNode_226381_002242 2242 114487 :=
  map_facts_branch
    mapNode_226381_001121
    mapNode_227502_001121
    1121 1121 114487
    mapNode_226381_001121_facts
    mapNode_227502_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_224140_004483_facts :
    MapFacts mapNode_224140_004483 4483 114487 :=
  map_facts_branch
    mapNode_224140_002241
    mapNode_226381_002242
    2241 2242 114487
    mapNode_224140_002241_facts
    mapNode_226381_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_228623_facts :
    MapFacts mapChunk_228623 560 114487 :=
  checkMap_sound mapChunk_228623 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_229183_facts :
    MapFacts mapChunk_229183 560 114487 :=
  checkMap_sound mapChunk_229183 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_228623_001120_facts :
    MapFacts mapNode_228623_001120 1120 114487 :=
  map_facts_branch
    mapChunk_228623
    mapChunk_229183
    560 560 114487
    mapChunk_228623_facts
    mapChunk_229183_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_229743_facts :
    MapFacts mapChunk_229743 560 114487 :=
  checkMap_sound mapChunk_229743 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_230303_facts :
    MapFacts mapChunk_230303 561 114487 :=
  checkMap_sound mapChunk_230303 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_229743_001121_facts :
    MapFacts mapNode_229743_001121 1121 114487 :=
  map_facts_branch
    mapChunk_229743
    mapChunk_230303
    560 561 114487
    mapChunk_229743_facts
    mapChunk_230303_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_228623_002241_facts :
    MapFacts mapNode_228623_002241 2241 114487 :=
  map_facts_branch
    mapNode_228623_001120
    mapNode_229743_001121
    1120 1121 114487
    mapNode_228623_001120_facts
    mapNode_229743_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_230864_facts :
    MapFacts mapChunk_230864 560 114487 :=
  checkMap_sound mapChunk_230864 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_231424_facts :
    MapFacts mapChunk_231424 561 114487 :=
  checkMap_sound mapChunk_231424 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_230864_001121_facts :
    MapFacts mapNode_230864_001121 1121 114487 :=
  map_facts_branch
    mapChunk_230864
    mapChunk_231424
    560 561 114487
    mapChunk_230864_facts
    mapChunk_231424_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_231985_facts :
    MapFacts mapChunk_231985 560 114487 :=
  checkMap_sound mapChunk_231985 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_232545_facts :
    MapFacts mapChunk_232545 561 114487 :=
  checkMap_sound mapChunk_232545 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t416\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_231985_001121_facts :
    MapFacts mapNode_231985_001121 1121 114487 :=
  map_facts_branch
    mapChunk_231985
    mapChunk_232545
    560 561 114487
    mapChunk_231985_facts
    mapChunk_232545_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_230864_002242_facts :
    MapFacts mapNode_230864_002242 2242 114487 :=
  map_facts_branch
    mapNode_230864_001121
    mapNode_231985_001121
    1121 1121 114487
    mapNode_230864_001121_facts
    mapNode_231985_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_228623_004483_facts :
    MapFacts mapNode_228623_004483 4483 114487 :=
  map_facts_branch
    mapNode_228623_002241
    mapNode_230864_002242
    2241 2242 114487
    mapNode_228623_002241_facts
    mapNode_230864_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_224140_008966_facts :
    MapFacts mapNode_224140_008966 8966 114487 :=
  map_facts_branch
    mapNode_224140_004483
    mapNode_228623_004483
    4483 4483 114487
    mapNode_224140_004483_facts
    mapNode_228623_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_215175_017931_facts :
    MapFacts mapNode_215175_017931 17931 114487 :=
  map_facts_branch
    mapNode_215175_008965
    mapNode_224140_008966
    8965 8966 114487
    mapNode_215175_008965_facts
    mapNode_224140_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_233106_facts :
    MapFacts mapChunk_233106 560 114487 :=
  checkMap_sound mapChunk_233106 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_233666_facts :
    MapFacts mapChunk_233666 560 114487 :=
  checkMap_sound mapChunk_233666 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_233106_001120_facts :
    MapFacts mapNode_233106_001120 1120 114487 :=
  map_facts_branch
    mapChunk_233106
    mapChunk_233666
    560 560 114487
    mapChunk_233106_facts
    mapChunk_233666_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_234226_facts :
    MapFacts mapChunk_234226 560 114487 :=
  checkMap_sound mapChunk_234226 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_234786_facts :
    MapFacts mapChunk_234786 561 114487 :=
  checkMap_sound mapChunk_234786 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_234226_001121_facts :
    MapFacts mapNode_234226_001121 1121 114487 :=
  map_facts_branch
    mapChunk_234226
    mapChunk_234786
    560 561 114487
    mapChunk_234226_facts
    mapChunk_234786_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_233106_002241_facts :
    MapFacts mapNode_233106_002241 2241 114487 :=
  map_facts_branch
    mapNode_233106_001120
    mapNode_234226_001121
    1120 1121 114487
    mapNode_233106_001120_facts
    mapNode_234226_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_235347_facts :
    MapFacts mapChunk_235347 560 114487 :=
  checkMap_sound mapChunk_235347 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_235907_facts :
    MapFacts mapChunk_235907 561 114487 :=
  checkMap_sound mapChunk_235907 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_235347_001121_facts :
    MapFacts mapNode_235347_001121 1121 114487 :=
  map_facts_branch
    mapChunk_235347
    mapChunk_235907
    560 561 114487
    mapChunk_235347_facts
    mapChunk_235907_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_236468_facts :
    MapFacts mapChunk_236468 560 114487 :=
  checkMap_sound mapChunk_236468 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_237028_facts :
    MapFacts mapChunk_237028 561 114487 :=
  checkMap_sound mapChunk_237028 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_236468_001121_facts :
    MapFacts mapNode_236468_001121 1121 114487 :=
  map_facts_branch
    mapChunk_236468
    mapChunk_237028
    560 561 114487
    mapChunk_236468_facts
    mapChunk_237028_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_235347_002242_facts :
    MapFacts mapNode_235347_002242 2242 114487 :=
  map_facts_branch
    mapNode_235347_001121
    mapNode_236468_001121
    1121 1121 114487
    mapNode_235347_001121_facts
    mapNode_236468_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_233106_004483_facts :
    MapFacts mapNode_233106_004483 4483 114487 :=
  map_facts_branch
    mapNode_233106_002241
    mapNode_235347_002242
    2241 2242 114487
    mapNode_233106_002241_facts
    mapNode_235347_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_237589_facts :
    MapFacts mapChunk_237589 560 114487 :=
  checkMap_sound mapChunk_237589 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_238149_facts :
    MapFacts mapChunk_238149 560 114487 :=
  checkMap_sound mapChunk_238149 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_237589_001120_facts :
    MapFacts mapNode_237589_001120 1120 114487 :=
  map_facts_branch
    mapChunk_237589
    mapChunk_238149
    560 560 114487
    mapChunk_237589_facts
    mapChunk_238149_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_238709_facts :
    MapFacts mapChunk_238709 560 114487 :=
  checkMap_sound mapChunk_238709 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_239269_facts :
    MapFacts mapChunk_239269 561 114487 :=
  checkMap_sound mapChunk_239269 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_238709_001121_facts :
    MapFacts mapNode_238709_001121 1121 114487 :=
  map_facts_branch
    mapChunk_238709
    mapChunk_239269
    560 561 114487
    mapChunk_238709_facts
    mapChunk_239269_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_237589_002241_facts :
    MapFacts mapNode_237589_002241 2241 114487 :=
  map_facts_branch
    mapNode_237589_001120
    mapNode_238709_001121
    1120 1121 114487
    mapNode_237589_001120_facts
    mapNode_238709_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_239830_facts :
    MapFacts mapChunk_239830 560 114487 :=
  checkMap_sound mapChunk_239830 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_240390_facts :
    MapFacts mapChunk_240390 561 114487 :=
  checkMap_sound mapChunk_240390 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_239830_001121_facts :
    MapFacts mapNode_239830_001121 1121 114487 :=
  map_facts_branch
    mapChunk_239830
    mapChunk_240390
    560 561 114487
    mapChunk_239830_facts
    mapChunk_240390_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_240951_facts :
    MapFacts mapChunk_240951 560 114487 :=
  checkMap_sound mapChunk_240951 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_241511_facts :
    MapFacts mapChunk_241511 561 114487 :=
  checkMap_sound mapChunk_241511 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_240951_001121_facts :
    MapFacts mapNode_240951_001121 1121 114487 :=
  map_facts_branch
    mapChunk_240951
    mapChunk_241511
    560 561 114487
    mapChunk_240951_facts
    mapChunk_241511_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_239830_002242_facts :
    MapFacts mapNode_239830_002242 2242 114487 :=
  map_facts_branch
    mapNode_239830_001121
    mapNode_240951_001121
    1121 1121 114487
    mapNode_239830_001121_facts
    mapNode_240951_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_237589_004483_facts :
    MapFacts mapNode_237589_004483 4483 114487 :=
  map_facts_branch
    mapNode_237589_002241
    mapNode_239830_002242
    2241 2242 114487
    mapNode_237589_002241_facts
    mapNode_239830_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_233106_008966_facts :
    MapFacts mapNode_233106_008966 8966 114487 :=
  map_facts_branch
    mapNode_233106_004483
    mapNode_237589_004483
    4483 4483 114487
    mapNode_233106_004483_facts
    mapNode_237589_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_242072_facts :
    MapFacts mapChunk_242072 560 114487 :=
  checkMap_sound mapChunk_242072 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_242632_facts :
    MapFacts mapChunk_242632 560 114487 :=
  checkMap_sound mapChunk_242632 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_242072_001120_facts :
    MapFacts mapNode_242072_001120 1120 114487 :=
  map_facts_branch
    mapChunk_242072
    mapChunk_242632
    560 560 114487
    mapChunk_242072_facts
    mapChunk_242632_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_243192_facts :
    MapFacts mapChunk_243192 560 114487 :=
  checkMap_sound mapChunk_243192 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_243752_facts :
    MapFacts mapChunk_243752 561 114487 :=
  checkMap_sound mapChunk_243752 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_243192_001121_facts :
    MapFacts mapNode_243192_001121 1121 114487 :=
  map_facts_branch
    mapChunk_243192
    mapChunk_243752
    560 561 114487
    mapChunk_243192_facts
    mapChunk_243752_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_242072_002241_facts :
    MapFacts mapNode_242072_002241 2241 114487 :=
  map_facts_branch
    mapNode_242072_001120
    mapNode_243192_001121
    1120 1121 114487
    mapNode_242072_001120_facts
    mapNode_243192_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_244313_facts :
    MapFacts mapChunk_244313 560 114487 :=
  checkMap_sound mapChunk_244313 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_244873_facts :
    MapFacts mapChunk_244873 561 114487 :=
  checkMap_sound mapChunk_244873 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_244313_001121_facts :
    MapFacts mapNode_244313_001121 1121 114487 :=
  map_facts_branch
    mapChunk_244313
    mapChunk_244873
    560 561 114487
    mapChunk_244313_facts
    mapChunk_244873_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_245434_facts :
    MapFacts mapChunk_245434 560 114487 :=
  checkMap_sound mapChunk_245434 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_245994_facts :
    MapFacts mapChunk_245994 561 114487 :=
  checkMap_sound mapChunk_245994 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_245434_001121_facts :
    MapFacts mapNode_245434_001121 1121 114487 :=
  map_facts_branch
    mapChunk_245434
    mapChunk_245994
    560 561 114487
    mapChunk_245434_facts
    mapChunk_245994_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_244313_002242_facts :
    MapFacts mapNode_244313_002242 2242 114487 :=
  map_facts_branch
    mapNode_244313_001121
    mapNode_245434_001121
    1121 1121 114487
    mapNode_244313_001121_facts
    mapNode_245434_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_242072_004483_facts :
    MapFacts mapNode_242072_004483 4483 114487 :=
  map_facts_branch
    mapNode_242072_002241
    mapNode_244313_002242
    2241 2242 114487
    mapNode_242072_002241_facts
    mapNode_244313_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_246555_facts :
    MapFacts mapChunk_246555 560 114487 :=
  checkMap_sound mapChunk_246555 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_247115_facts :
    MapFacts mapChunk_247115 560 114487 :=
  checkMap_sound mapChunk_247115 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_246555_001120_facts :
    MapFacts mapNode_246555_001120 1120 114487 :=
  map_facts_branch
    mapChunk_246555
    mapChunk_247115
    560 560 114487
    mapChunk_246555_facts
    mapChunk_247115_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_247675_facts :
    MapFacts mapChunk_247675 560 114487 :=
  checkMap_sound mapChunk_247675 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_248235_facts :
    MapFacts mapChunk_248235 561 114487 :=
  checkMap_sound mapChunk_248235 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_247675_001121_facts :
    MapFacts mapNode_247675_001121 1121 114487 :=
  map_facts_branch
    mapChunk_247675
    mapChunk_248235
    560 561 114487
    mapChunk_247675_facts
    mapChunk_248235_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_246555_002241_facts :
    MapFacts mapNode_246555_002241 2241 114487 :=
  map_facts_branch
    mapNode_246555_001120
    mapNode_247675_001121
    1120 1121 114487
    mapNode_246555_001120_facts
    mapNode_247675_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_248796_facts :
    MapFacts mapChunk_248796 560 114487 :=
  checkMap_sound mapChunk_248796 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_249356_facts :
    MapFacts mapChunk_249356 561 114487 :=
  checkMap_sound mapChunk_249356 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_248796_001121_facts :
    MapFacts mapNode_248796_001121 1121 114487 :=
  map_facts_branch
    mapChunk_248796
    mapChunk_249356
    560 561 114487
    mapChunk_248796_facts
    mapChunk_249356_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_249917_facts :
    MapFacts mapChunk_249917 560 114487 :=
  checkMap_sound mapChunk_249917 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_250477_facts :
    MapFacts mapChunk_250477 561 114487 :=
  checkMap_sound mapChunk_250477 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t448\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_249917_001121_facts :
    MapFacts mapNode_249917_001121 1121 114487 :=
  map_facts_branch
    mapChunk_249917
    mapChunk_250477
    560 561 114487
    mapChunk_249917_facts
    mapChunk_250477_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_248796_002242_facts :
    MapFacts mapNode_248796_002242 2242 114487 :=
  map_facts_branch
    mapNode_248796_001121
    mapNode_249917_001121
    1121 1121 114487
    mapNode_248796_001121_facts
    mapNode_249917_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_246555_004483_facts :
    MapFacts mapNode_246555_004483 4483 114487 :=
  map_facts_branch
    mapNode_246555_002241
    mapNode_248796_002242
    2241 2242 114487
    mapNode_246555_002241_facts
    mapNode_248796_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_242072_008966_facts :
    MapFacts mapNode_242072_008966 8966 114487 :=
  map_facts_branch
    mapNode_242072_004483
    mapNode_246555_004483
    4483 4483 114487
    mapNode_242072_004483_facts
    mapNode_246555_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_233106_017932_facts :
    MapFacts mapNode_233106_017932 17932 114487 :=
  map_facts_branch
    mapNode_233106_008966
    mapNode_242072_008966
    8966 8966 114487
    mapNode_233106_008966_facts
    mapNode_242072_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_215175_035863_facts :
    MapFacts mapNode_215175_035863 35863 114487 :=
  map_facts_branch
    mapNode_215175_017931
    mapNode_233106_017932
    17931 17932 114487
    mapNode_215175_017931_facts
    mapNode_233106_017932_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_251038_facts :
    MapFacts mapChunk_251038 560 114487 :=
  checkMap_sound mapChunk_251038 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_251598_facts :
    MapFacts mapChunk_251598 560 114487 :=
  checkMap_sound mapChunk_251598 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_251038_001120_facts :
    MapFacts mapNode_251038_001120 1120 114487 :=
  map_facts_branch
    mapChunk_251038
    mapChunk_251598
    560 560 114487
    mapChunk_251038_facts
    mapChunk_251598_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_252158_facts :
    MapFacts mapChunk_252158 560 114487 :=
  checkMap_sound mapChunk_252158 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_252718_facts :
    MapFacts mapChunk_252718 561 114487 :=
  checkMap_sound mapChunk_252718 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_252158_001121_facts :
    MapFacts mapNode_252158_001121 1121 114487 :=
  map_facts_branch
    mapChunk_252158
    mapChunk_252718
    560 561 114487
    mapChunk_252158_facts
    mapChunk_252718_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_251038_002241_facts :
    MapFacts mapNode_251038_002241 2241 114487 :=
  map_facts_branch
    mapNode_251038_001120
    mapNode_252158_001121
    1120 1121 114487
    mapNode_251038_001120_facts
    mapNode_252158_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_253279_facts :
    MapFacts mapChunk_253279 560 114487 :=
  checkMap_sound mapChunk_253279 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_253839_facts :
    MapFacts mapChunk_253839 560 114487 :=
  checkMap_sound mapChunk_253839 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_253279_001120_facts :
    MapFacts mapNode_253279_001120 1120 114487 :=
  map_facts_branch
    mapChunk_253279
    mapChunk_253839
    560 560 114487
    mapChunk_253279_facts
    mapChunk_253839_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_254399_facts :
    MapFacts mapChunk_254399 560 114487 :=
  checkMap_sound mapChunk_254399 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_254959_facts :
    MapFacts mapChunk_254959 561 114487 :=
  checkMap_sound mapChunk_254959 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_254399_001121_facts :
    MapFacts mapNode_254399_001121 1121 114487 :=
  map_facts_branch
    mapChunk_254399
    mapChunk_254959
    560 561 114487
    mapChunk_254399_facts
    mapChunk_254959_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_253279_002241_facts :
    MapFacts mapNode_253279_002241 2241 114487 :=
  map_facts_branch
    mapNode_253279_001120
    mapNode_254399_001121
    1120 1121 114487
    mapNode_253279_001120_facts
    mapNode_254399_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_251038_004482_facts :
    MapFacts mapNode_251038_004482 4482 114487 :=
  map_facts_branch
    mapNode_251038_002241
    mapNode_253279_002241
    2241 2241 114487
    mapNode_251038_002241_facts
    mapNode_253279_002241_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_255520_facts :
    MapFacts mapChunk_255520 560 114487 :=
  checkMap_sound mapChunk_255520 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_256080_facts :
    MapFacts mapChunk_256080 560 114487 :=
  checkMap_sound mapChunk_256080 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_255520_001120_facts :
    MapFacts mapNode_255520_001120 1120 114487 :=
  map_facts_branch
    mapChunk_255520
    mapChunk_256080
    560 560 114487
    mapChunk_255520_facts
    mapChunk_256080_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_256640_facts :
    MapFacts mapChunk_256640 560 114487 :=
  checkMap_sound mapChunk_256640 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_257200_facts :
    MapFacts mapChunk_257200 561 114487 :=
  checkMap_sound mapChunk_257200 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_256640_001121_facts :
    MapFacts mapNode_256640_001121 1121 114487 :=
  map_facts_branch
    mapChunk_256640
    mapChunk_257200
    560 561 114487
    mapChunk_256640_facts
    mapChunk_257200_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_255520_002241_facts :
    MapFacts mapNode_255520_002241 2241 114487 :=
  map_facts_branch
    mapNode_255520_001120
    mapNode_256640_001121
    1120 1121 114487
    mapNode_255520_001120_facts
    mapNode_256640_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_257761_facts :
    MapFacts mapChunk_257761 560 114487 :=
  checkMap_sound mapChunk_257761 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_258321_facts :
    MapFacts mapChunk_258321 561 114487 :=
  checkMap_sound mapChunk_258321 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_257761_001121_facts :
    MapFacts mapNode_257761_001121 1121 114487 :=
  map_facts_branch
    mapChunk_257761
    mapChunk_258321
    560 561 114487
    mapChunk_257761_facts
    mapChunk_258321_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_258882_facts :
    MapFacts mapChunk_258882 560 114487 :=
  checkMap_sound mapChunk_258882 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_259442_facts :
    MapFacts mapChunk_259442 561 114487 :=
  checkMap_sound mapChunk_259442 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_258882_001121_facts :
    MapFacts mapNode_258882_001121 1121 114487 :=
  map_facts_branch
    mapChunk_258882
    mapChunk_259442
    560 561 114487
    mapChunk_258882_facts
    mapChunk_259442_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_257761_002242_facts :
    MapFacts mapNode_257761_002242 2242 114487 :=
  map_facts_branch
    mapNode_257761_001121
    mapNode_258882_001121
    1121 1121 114487
    mapNode_257761_001121_facts
    mapNode_258882_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_255520_004483_facts :
    MapFacts mapNode_255520_004483 4483 114487 :=
  map_facts_branch
    mapNode_255520_002241
    mapNode_257761_002242
    2241 2242 114487
    mapNode_255520_002241_facts
    mapNode_257761_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_251038_008965_facts :
    MapFacts mapNode_251038_008965 8965 114487 :=
  map_facts_branch
    mapNode_251038_004482
    mapNode_255520_004483
    4482 4483 114487
    mapNode_251038_004482_facts
    mapNode_255520_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_260003_facts :
    MapFacts mapChunk_260003 560 114487 :=
  checkMap_sound mapChunk_260003 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_260563_facts :
    MapFacts mapChunk_260563 560 114487 :=
  checkMap_sound mapChunk_260563 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_260003_001120_facts :
    MapFacts mapNode_260003_001120 1120 114487 :=
  map_facts_branch
    mapChunk_260003
    mapChunk_260563
    560 560 114487
    mapChunk_260003_facts
    mapChunk_260563_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_261123_facts :
    MapFacts mapChunk_261123 560 114487 :=
  checkMap_sound mapChunk_261123 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_261683_facts :
    MapFacts mapChunk_261683 561 114487 :=
  checkMap_sound mapChunk_261683 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_261123_001121_facts :
    MapFacts mapNode_261123_001121 1121 114487 :=
  map_facts_branch
    mapChunk_261123
    mapChunk_261683
    560 561 114487
    mapChunk_261123_facts
    mapChunk_261683_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_260003_002241_facts :
    MapFacts mapNode_260003_002241 2241 114487 :=
  map_facts_branch
    mapNode_260003_001120
    mapNode_261123_001121
    1120 1121 114487
    mapNode_260003_001120_facts
    mapNode_261123_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_262244_facts :
    MapFacts mapChunk_262244 560 114487 :=
  checkMap_sound mapChunk_262244 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_262804_facts :
    MapFacts mapChunk_262804 561 114487 :=
  checkMap_sound mapChunk_262804 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_262244_001121_facts :
    MapFacts mapNode_262244_001121 1121 114487 :=
  map_facts_branch
    mapChunk_262244
    mapChunk_262804
    560 561 114487
    mapChunk_262244_facts
    mapChunk_262804_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_263365_facts :
    MapFacts mapChunk_263365 560 114487 :=
  checkMap_sound mapChunk_263365 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_263925_facts :
    MapFacts mapChunk_263925 561 114487 :=
  checkMap_sound mapChunk_263925 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_263365_001121_facts :
    MapFacts mapNode_263365_001121 1121 114487 :=
  map_facts_branch
    mapChunk_263365
    mapChunk_263925
    560 561 114487
    mapChunk_263365_facts
    mapChunk_263925_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_262244_002242_facts :
    MapFacts mapNode_262244_002242 2242 114487 :=
  map_facts_branch
    mapNode_262244_001121
    mapNode_263365_001121
    1121 1121 114487
    mapNode_262244_001121_facts
    mapNode_263365_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_260003_004483_facts :
    MapFacts mapNode_260003_004483 4483 114487 :=
  map_facts_branch
    mapNode_260003_002241
    mapNode_262244_002242
    2241 2242 114487
    mapNode_260003_002241_facts
    mapNode_262244_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_264486_facts :
    MapFacts mapChunk_264486 560 114487 :=
  checkMap_sound mapChunk_264486 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_265046_facts :
    MapFacts mapChunk_265046 560 114487 :=
  checkMap_sound mapChunk_265046 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_264486_001120_facts :
    MapFacts mapNode_264486_001120 1120 114487 :=
  map_facts_branch
    mapChunk_264486
    mapChunk_265046
    560 560 114487
    mapChunk_264486_facts
    mapChunk_265046_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_265606_facts :
    MapFacts mapChunk_265606 560 114487 :=
  checkMap_sound mapChunk_265606 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_266166_facts :
    MapFacts mapChunk_266166 561 114487 :=
  checkMap_sound mapChunk_266166 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_265606_001121_facts :
    MapFacts mapNode_265606_001121 1121 114487 :=
  map_facts_branch
    mapChunk_265606
    mapChunk_266166
    560 561 114487
    mapChunk_265606_facts
    mapChunk_266166_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_264486_002241_facts :
    MapFacts mapNode_264486_002241 2241 114487 :=
  map_facts_branch
    mapNode_264486_001120
    mapNode_265606_001121
    1120 1121 114487
    mapNode_264486_001120_facts
    mapNode_265606_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_266727_facts :
    MapFacts mapChunk_266727 560 114487 :=
  checkMap_sound mapChunk_266727 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_267287_facts :
    MapFacts mapChunk_267287 561 114487 :=
  checkMap_sound mapChunk_267287 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_266727_001121_facts :
    MapFacts mapNode_266727_001121 1121 114487 :=
  map_facts_branch
    mapChunk_266727
    mapChunk_267287
    560 561 114487
    mapChunk_266727_facts
    mapChunk_267287_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_267848_facts :
    MapFacts mapChunk_267848 560 114487 :=
  checkMap_sound mapChunk_267848 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_268408_facts :
    MapFacts mapChunk_268408 561 114487 :=
  checkMap_sound mapChunk_268408 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t480\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_267848_001121_facts :
    MapFacts mapNode_267848_001121 1121 114487 :=
  map_facts_branch
    mapChunk_267848
    mapChunk_268408
    560 561 114487
    mapChunk_267848_facts
    mapChunk_268408_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_266727_002242_facts :
    MapFacts mapNode_266727_002242 2242 114487 :=
  map_facts_branch
    mapNode_266727_001121
    mapNode_267848_001121
    1121 1121 114487
    mapNode_266727_001121_facts
    mapNode_267848_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_264486_004483_facts :
    MapFacts mapNode_264486_004483 4483 114487 :=
  map_facts_branch
    mapNode_264486_002241
    mapNode_266727_002242
    2241 2242 114487
    mapNode_264486_002241_facts
    mapNode_266727_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_260003_008966_facts :
    MapFacts mapNode_260003_008966 8966 114487 :=
  map_facts_branch
    mapNode_260003_004483
    mapNode_264486_004483
    4483 4483 114487
    mapNode_260003_004483_facts
    mapNode_264486_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_251038_017931_facts :
    MapFacts mapNode_251038_017931 17931 114487 :=
  map_facts_branch
    mapNode_251038_008965
    mapNode_260003_008966
    8965 8966 114487
    mapNode_251038_008965_facts
    mapNode_260003_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_268969_facts :
    MapFacts mapChunk_268969 560 114487 :=
  checkMap_sound mapChunk_268969 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_269529_facts :
    MapFacts mapChunk_269529 560 114487 :=
  checkMap_sound mapChunk_269529 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_268969_001120_facts :
    MapFacts mapNode_268969_001120 1120 114487 :=
  map_facts_branch
    mapChunk_268969
    mapChunk_269529
    560 560 114487
    mapChunk_268969_facts
    mapChunk_269529_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_270089_facts :
    MapFacts mapChunk_270089 560 114487 :=
  checkMap_sound mapChunk_270089 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_270649_facts :
    MapFacts mapChunk_270649 561 114487 :=
  checkMap_sound mapChunk_270649 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_270089_001121_facts :
    MapFacts mapNode_270089_001121 1121 114487 :=
  map_facts_branch
    mapChunk_270089
    mapChunk_270649
    560 561 114487
    mapChunk_270089_facts
    mapChunk_270649_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_268969_002241_facts :
    MapFacts mapNode_268969_002241 2241 114487 :=
  map_facts_branch
    mapNode_268969_001120
    mapNode_270089_001121
    1120 1121 114487
    mapNode_268969_001120_facts
    mapNode_270089_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_271210_facts :
    MapFacts mapChunk_271210 560 114487 :=
  checkMap_sound mapChunk_271210 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_271770_facts :
    MapFacts mapChunk_271770 561 114487 :=
  checkMap_sound mapChunk_271770 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_271210_001121_facts :
    MapFacts mapNode_271210_001121 1121 114487 :=
  map_facts_branch
    mapChunk_271210
    mapChunk_271770
    560 561 114487
    mapChunk_271210_facts
    mapChunk_271770_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_272331_facts :
    MapFacts mapChunk_272331 560 114487 :=
  checkMap_sound mapChunk_272331 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_272891_facts :
    MapFacts mapChunk_272891 561 114487 :=
  checkMap_sound mapChunk_272891 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_272331_001121_facts :
    MapFacts mapNode_272331_001121 1121 114487 :=
  map_facts_branch
    mapChunk_272331
    mapChunk_272891
    560 561 114487
    mapChunk_272331_facts
    mapChunk_272891_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_271210_002242_facts :
    MapFacts mapNode_271210_002242 2242 114487 :=
  map_facts_branch
    mapNode_271210_001121
    mapNode_272331_001121
    1121 1121 114487
    mapNode_271210_001121_facts
    mapNode_272331_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_268969_004483_facts :
    MapFacts mapNode_268969_004483 4483 114487 :=
  map_facts_branch
    mapNode_268969_002241
    mapNode_271210_002242
    2241 2242 114487
    mapNode_268969_002241_facts
    mapNode_271210_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_273452_facts :
    MapFacts mapChunk_273452 560 114487 :=
  checkMap_sound mapChunk_273452 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_274012_facts :
    MapFacts mapChunk_274012 560 114487 :=
  checkMap_sound mapChunk_274012 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_273452_001120_facts :
    MapFacts mapNode_273452_001120 1120 114487 :=
  map_facts_branch
    mapChunk_273452
    mapChunk_274012
    560 560 114487
    mapChunk_273452_facts
    mapChunk_274012_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_274572_facts :
    MapFacts mapChunk_274572 560 114487 :=
  checkMap_sound mapChunk_274572 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_275132_facts :
    MapFacts mapChunk_275132 561 114487 :=
  checkMap_sound mapChunk_275132 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_274572_001121_facts :
    MapFacts mapNode_274572_001121 1121 114487 :=
  map_facts_branch
    mapChunk_274572
    mapChunk_275132
    560 561 114487
    mapChunk_274572_facts
    mapChunk_275132_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_273452_002241_facts :
    MapFacts mapNode_273452_002241 2241 114487 :=
  map_facts_branch
    mapNode_273452_001120
    mapNode_274572_001121
    1120 1121 114487
    mapNode_273452_001120_facts
    mapNode_274572_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_275693_facts :
    MapFacts mapChunk_275693 560 114487 :=
  checkMap_sound mapChunk_275693 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_276253_facts :
    MapFacts mapChunk_276253 561 114487 :=
  checkMap_sound mapChunk_276253 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_275693_001121_facts :
    MapFacts mapNode_275693_001121 1121 114487 :=
  map_facts_branch
    mapChunk_275693
    mapChunk_276253
    560 561 114487
    mapChunk_275693_facts
    mapChunk_276253_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_276814_facts :
    MapFacts mapChunk_276814 560 114487 :=
  checkMap_sound mapChunk_276814 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_277374_facts :
    MapFacts mapChunk_277374 561 114487 :=
  checkMap_sound mapChunk_277374 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_276814_001121_facts :
    MapFacts mapNode_276814_001121 1121 114487 :=
  map_facts_branch
    mapChunk_276814
    mapChunk_277374
    560 561 114487
    mapChunk_276814_facts
    mapChunk_277374_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_275693_002242_facts :
    MapFacts mapNode_275693_002242 2242 114487 :=
  map_facts_branch
    mapNode_275693_001121
    mapNode_276814_001121
    1121 1121 114487
    mapNode_275693_001121_facts
    mapNode_276814_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_273452_004483_facts :
    MapFacts mapNode_273452_004483 4483 114487 :=
  map_facts_branch
    mapNode_273452_002241
    mapNode_275693_002242
    2241 2242 114487
    mapNode_273452_002241_facts
    mapNode_275693_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_268969_008966_facts :
    MapFacts mapNode_268969_008966 8966 114487 :=
  map_facts_branch
    mapNode_268969_004483
    mapNode_273452_004483
    4483 4483 114487
    mapNode_268969_004483_facts
    mapNode_273452_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_277935_facts :
    MapFacts mapChunk_277935 560 114487 :=
  checkMap_sound mapChunk_277935 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_278495_facts :
    MapFacts mapChunk_278495 560 114487 :=
  checkMap_sound mapChunk_278495 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_277935_001120_facts :
    MapFacts mapNode_277935_001120 1120 114487 :=
  map_facts_branch
    mapChunk_277935
    mapChunk_278495
    560 560 114487
    mapChunk_277935_facts
    mapChunk_278495_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_279055_facts :
    MapFacts mapChunk_279055 560 114487 :=
  checkMap_sound mapChunk_279055 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_279615_facts :
    MapFacts mapChunk_279615 561 114487 :=
  checkMap_sound mapChunk_279615 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_279055_001121_facts :
    MapFacts mapNode_279055_001121 1121 114487 :=
  map_facts_branch
    mapChunk_279055
    mapChunk_279615
    560 561 114487
    mapChunk_279055_facts
    mapChunk_279615_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_277935_002241_facts :
    MapFacts mapNode_277935_002241 2241 114487 :=
  map_facts_branch
    mapNode_277935_001120
    mapNode_279055_001121
    1120 1121 114487
    mapNode_277935_001120_facts
    mapNode_279055_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_280176_facts :
    MapFacts mapChunk_280176 560 114487 :=
  checkMap_sound mapChunk_280176 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_280736_facts :
    MapFacts mapChunk_280736 561 114487 :=
  checkMap_sound mapChunk_280736 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_280176_001121_facts :
    MapFacts mapNode_280176_001121 1121 114487 :=
  map_facts_branch
    mapChunk_280176
    mapChunk_280736
    560 561 114487
    mapChunk_280176_facts
    mapChunk_280736_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_281297_facts :
    MapFacts mapChunk_281297 560 114487 :=
  checkMap_sound mapChunk_281297 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_281857_facts :
    MapFacts mapChunk_281857 561 114487 :=
  checkMap_sound mapChunk_281857 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_281297_001121_facts :
    MapFacts mapNode_281297_001121 1121 114487 :=
  map_facts_branch
    mapChunk_281297
    mapChunk_281857
    560 561 114487
    mapChunk_281297_facts
    mapChunk_281857_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_280176_002242_facts :
    MapFacts mapNode_280176_002242 2242 114487 :=
  map_facts_branch
    mapNode_280176_001121
    mapNode_281297_001121
    1121 1121 114487
    mapNode_280176_001121_facts
    mapNode_281297_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_277935_004483_facts :
    MapFacts mapNode_277935_004483 4483 114487 :=
  map_facts_branch
    mapNode_277935_002241
    mapNode_280176_002242
    2241 2242 114487
    mapNode_277935_002241_facts
    mapNode_280176_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_282418_facts :
    MapFacts mapChunk_282418 560 114487 :=
  checkMap_sound mapChunk_282418 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_282978_facts :
    MapFacts mapChunk_282978 560 114487 :=
  checkMap_sound mapChunk_282978 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_282418_001120_facts :
    MapFacts mapNode_282418_001120 1120 114487 :=
  map_facts_branch
    mapChunk_282418
    mapChunk_282978
    560 560 114487
    mapChunk_282418_facts
    mapChunk_282978_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_283538_facts :
    MapFacts mapChunk_283538 560 114487 :=
  checkMap_sound mapChunk_283538 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_284098_facts :
    MapFacts mapChunk_284098 561 114487 :=
  checkMap_sound mapChunk_284098 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_283538_001121_facts :
    MapFacts mapNode_283538_001121 1121 114487 :=
  map_facts_branch
    mapChunk_283538
    mapChunk_284098
    560 561 114487
    mapChunk_283538_facts
    mapChunk_284098_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_282418_002241_facts :
    MapFacts mapNode_282418_002241 2241 114487 :=
  map_facts_branch
    mapNode_282418_001120
    mapNode_283538_001121
    1120 1121 114487
    mapNode_282418_001120_facts
    mapNode_283538_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_284659_facts :
    MapFacts mapChunk_284659 560 114487 :=
  checkMap_sound mapChunk_284659 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_285219_facts :
    MapFacts mapChunk_285219 561 114487 :=
  checkMap_sound mapChunk_285219 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_284659_001121_facts :
    MapFacts mapNode_284659_001121 1121 114487 :=
  map_facts_branch
    mapChunk_284659
    mapChunk_285219
    560 561 114487
    mapChunk_284659_facts
    mapChunk_285219_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_285780_facts :
    MapFacts mapChunk_285780 560 114487 :=
  checkMap_sound mapChunk_285780 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_286340_facts :
    MapFacts mapChunk_286340 561 114487 :=
  checkMap_sound mapChunk_286340 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t512\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_285780_001121_facts :
    MapFacts mapNode_285780_001121 1121 114487 :=
  map_facts_branch
    mapChunk_285780
    mapChunk_286340
    560 561 114487
    mapChunk_285780_facts
    mapChunk_286340_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_284659_002242_facts :
    MapFacts mapNode_284659_002242 2242 114487 :=
  map_facts_branch
    mapNode_284659_001121
    mapNode_285780_001121
    1121 1121 114487
    mapNode_284659_001121_facts
    mapNode_285780_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_282418_004483_facts :
    MapFacts mapNode_282418_004483 4483 114487 :=
  map_facts_branch
    mapNode_282418_002241
    mapNode_284659_002242
    2241 2242 114487
    mapNode_282418_002241_facts
    mapNode_284659_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_277935_008966_facts :
    MapFacts mapNode_277935_008966 8966 114487 :=
  map_facts_branch
    mapNode_277935_004483
    mapNode_282418_004483
    4483 4483 114487
    mapNode_277935_004483_facts
    mapNode_282418_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_268969_017932_facts :
    MapFacts mapNode_268969_017932 17932 114487 :=
  map_facts_branch
    mapNode_268969_008966
    mapNode_277935_008966
    8966 8966 114487
    mapNode_268969_008966_facts
    mapNode_277935_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_251038_035863_facts :
    MapFacts mapNode_251038_035863 35863 114487 :=
  map_facts_branch
    mapNode_251038_017931
    mapNode_268969_017932
    17931 17932 114487
    mapNode_251038_017931_facts
    mapNode_268969_017932_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_215175_071726_facts :
    MapFacts mapNode_215175_071726 71726 114487 :=
  map_facts_branch
    mapNode_215175_035863
    mapNode_251038_035863
    35863 35863 114487
    mapNode_215175_035863_facts
    mapNode_251038_035863_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_143450_143451_facts :
    MapFacts mapNode_143450_143451 143451 114487 :=
  map_facts_branch
    mapNode_143450_071725
    mapNode_215175_071726
    71725 71726 114487
    mapNode_143450_071725_facts
    mapNode_215175_071726_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_000000_286901_facts :
    MapFacts mapNode_000000_286901 286901 114487 :=
  map_facts_branch
    mapNode_000000_143450
    mapNode_143450_143451
    143450 143451 114487
    mapNode_000000_143450_facts
    mapNode_143450_143451_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_286901_facts :
    MapFacts mapChunk_286901 560 114487 :=
  checkMap_sound mapChunk_286901 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_287461_facts :
    MapFacts mapChunk_287461 560 114487 :=
  checkMap_sound mapChunk_287461 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_286901_001120_facts :
    MapFacts mapNode_286901_001120 1120 114487 :=
  map_facts_branch
    mapChunk_286901
    mapChunk_287461
    560 560 114487
    mapChunk_286901_facts
    mapChunk_287461_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_288021_facts :
    MapFacts mapChunk_288021 560 114487 :=
  checkMap_sound mapChunk_288021 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_288581_facts :
    MapFacts mapChunk_288581 561 114487 :=
  checkMap_sound mapChunk_288581 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_288021_001121_facts :
    MapFacts mapNode_288021_001121 1121 114487 :=
  map_facts_branch
    mapChunk_288021
    mapChunk_288581
    560 561 114487
    mapChunk_288021_facts
    mapChunk_288581_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_286901_002241_facts :
    MapFacts mapNode_286901_002241 2241 114487 :=
  map_facts_branch
    mapNode_286901_001120
    mapNode_288021_001121
    1120 1121 114487
    mapNode_286901_001120_facts
    mapNode_288021_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_289142_facts :
    MapFacts mapChunk_289142 560 114487 :=
  checkMap_sound mapChunk_289142 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_289702_facts :
    MapFacts mapChunk_289702 560 114487 :=
  checkMap_sound mapChunk_289702 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_289142_001120_facts :
    MapFacts mapNode_289142_001120 1120 114487 :=
  map_facts_branch
    mapChunk_289142
    mapChunk_289702
    560 560 114487
    mapChunk_289142_facts
    mapChunk_289702_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_290262_facts :
    MapFacts mapChunk_290262 560 114487 :=
  checkMap_sound mapChunk_290262 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_290822_facts :
    MapFacts mapChunk_290822 561 114487 :=
  checkMap_sound mapChunk_290822 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_290262_001121_facts :
    MapFacts mapNode_290262_001121 1121 114487 :=
  map_facts_branch
    mapChunk_290262
    mapChunk_290822
    560 561 114487
    mapChunk_290262_facts
    mapChunk_290822_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_289142_002241_facts :
    MapFacts mapNode_289142_002241 2241 114487 :=
  map_facts_branch
    mapNode_289142_001120
    mapNode_290262_001121
    1120 1121 114487
    mapNode_289142_001120_facts
    mapNode_290262_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_286901_004482_facts :
    MapFacts mapNode_286901_004482 4482 114487 :=
  map_facts_branch
    mapNode_286901_002241
    mapNode_289142_002241
    2241 2241 114487
    mapNode_286901_002241_facts
    mapNode_289142_002241_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_291383_facts :
    MapFacts mapChunk_291383 560 114487 :=
  checkMap_sound mapChunk_291383 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_291943_facts :
    MapFacts mapChunk_291943 560 114487 :=
  checkMap_sound mapChunk_291943 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_291383_001120_facts :
    MapFacts mapNode_291383_001120 1120 114487 :=
  map_facts_branch
    mapChunk_291383
    mapChunk_291943
    560 560 114487
    mapChunk_291383_facts
    mapChunk_291943_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_292503_facts :
    MapFacts mapChunk_292503 560 114487 :=
  checkMap_sound mapChunk_292503 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_293063_facts :
    MapFacts mapChunk_293063 561 114487 :=
  checkMap_sound mapChunk_293063 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_292503_001121_facts :
    MapFacts mapNode_292503_001121 1121 114487 :=
  map_facts_branch
    mapChunk_292503
    mapChunk_293063
    560 561 114487
    mapChunk_292503_facts
    mapChunk_293063_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_291383_002241_facts :
    MapFacts mapNode_291383_002241 2241 114487 :=
  map_facts_branch
    mapNode_291383_001120
    mapNode_292503_001121
    1120 1121 114487
    mapNode_291383_001120_facts
    mapNode_292503_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_293624_facts :
    MapFacts mapChunk_293624 560 114487 :=
  checkMap_sound mapChunk_293624 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_294184_facts :
    MapFacts mapChunk_294184 561 114487 :=
  checkMap_sound mapChunk_294184 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_293624_001121_facts :
    MapFacts mapNode_293624_001121 1121 114487 :=
  map_facts_branch
    mapChunk_293624
    mapChunk_294184
    560 561 114487
    mapChunk_293624_facts
    mapChunk_294184_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_294745_facts :
    MapFacts mapChunk_294745 560 114487 :=
  checkMap_sound mapChunk_294745 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_295305_facts :
    MapFacts mapChunk_295305 561 114487 :=
  checkMap_sound mapChunk_295305 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_294745_001121_facts :
    MapFacts mapNode_294745_001121 1121 114487 :=
  map_facts_branch
    mapChunk_294745
    mapChunk_295305
    560 561 114487
    mapChunk_294745_facts
    mapChunk_295305_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_293624_002242_facts :
    MapFacts mapNode_293624_002242 2242 114487 :=
  map_facts_branch
    mapNode_293624_001121
    mapNode_294745_001121
    1121 1121 114487
    mapNode_293624_001121_facts
    mapNode_294745_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_291383_004483_facts :
    MapFacts mapNode_291383_004483 4483 114487 :=
  map_facts_branch
    mapNode_291383_002241
    mapNode_293624_002242
    2241 2242 114487
    mapNode_291383_002241_facts
    mapNode_293624_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_286901_008965_facts :
    MapFacts mapNode_286901_008965 8965 114487 :=
  map_facts_branch
    mapNode_286901_004482
    mapNode_291383_004483
    4482 4483 114487
    mapNode_286901_004482_facts
    mapNode_291383_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_295866_facts :
    MapFacts mapChunk_295866 560 114487 :=
  checkMap_sound mapChunk_295866 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_296426_facts :
    MapFacts mapChunk_296426 560 114487 :=
  checkMap_sound mapChunk_296426 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_295866_001120_facts :
    MapFacts mapNode_295866_001120 1120 114487 :=
  map_facts_branch
    mapChunk_295866
    mapChunk_296426
    560 560 114487
    mapChunk_295866_facts
    mapChunk_296426_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_296986_facts :
    MapFacts mapChunk_296986 560 114487 :=
  checkMap_sound mapChunk_296986 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_297546_facts :
    MapFacts mapChunk_297546 561 114487 :=
  checkMap_sound mapChunk_297546 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_296986_001121_facts :
    MapFacts mapNode_296986_001121 1121 114487 :=
  map_facts_branch
    mapChunk_296986
    mapChunk_297546
    560 561 114487
    mapChunk_296986_facts
    mapChunk_297546_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_295866_002241_facts :
    MapFacts mapNode_295866_002241 2241 114487 :=
  map_facts_branch
    mapNode_295866_001120
    mapNode_296986_001121
    1120 1121 114487
    mapNode_295866_001120_facts
    mapNode_296986_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_298107_facts :
    MapFacts mapChunk_298107 560 114487 :=
  checkMap_sound mapChunk_298107 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_298667_facts :
    MapFacts mapChunk_298667 561 114487 :=
  checkMap_sound mapChunk_298667 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_298107_001121_facts :
    MapFacts mapNode_298107_001121 1121 114487 :=
  map_facts_branch
    mapChunk_298107
    mapChunk_298667
    560 561 114487
    mapChunk_298107_facts
    mapChunk_298667_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_299228_facts :
    MapFacts mapChunk_299228 560 114487 :=
  checkMap_sound mapChunk_299228 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_299788_facts :
    MapFacts mapChunk_299788 561 114487 :=
  checkMap_sound mapChunk_299788 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_299228_001121_facts :
    MapFacts mapNode_299228_001121 1121 114487 :=
  map_facts_branch
    mapChunk_299228
    mapChunk_299788
    560 561 114487
    mapChunk_299228_facts
    mapChunk_299788_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_298107_002242_facts :
    MapFacts mapNode_298107_002242 2242 114487 :=
  map_facts_branch
    mapNode_298107_001121
    mapNode_299228_001121
    1121 1121 114487
    mapNode_298107_001121_facts
    mapNode_299228_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_295866_004483_facts :
    MapFacts mapNode_295866_004483 4483 114487 :=
  map_facts_branch
    mapNode_295866_002241
    mapNode_298107_002242
    2241 2242 114487
    mapNode_295866_002241_facts
    mapNode_298107_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_300349_facts :
    MapFacts mapChunk_300349 560 114487 :=
  checkMap_sound mapChunk_300349 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_300909_facts :
    MapFacts mapChunk_300909 560 114487 :=
  checkMap_sound mapChunk_300909 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_300349_001120_facts :
    MapFacts mapNode_300349_001120 1120 114487 :=
  map_facts_branch
    mapChunk_300349
    mapChunk_300909
    560 560 114487
    mapChunk_300349_facts
    mapChunk_300909_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_301469_facts :
    MapFacts mapChunk_301469 560 114487 :=
  checkMap_sound mapChunk_301469 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_302029_facts :
    MapFacts mapChunk_302029 561 114487 :=
  checkMap_sound mapChunk_302029 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_301469_001121_facts :
    MapFacts mapNode_301469_001121 1121 114487 :=
  map_facts_branch
    mapChunk_301469
    mapChunk_302029
    560 561 114487
    mapChunk_301469_facts
    mapChunk_302029_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_300349_002241_facts :
    MapFacts mapNode_300349_002241 2241 114487 :=
  map_facts_branch
    mapNode_300349_001120
    mapNode_301469_001121
    1120 1121 114487
    mapNode_300349_001120_facts
    mapNode_301469_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_302590_facts :
    MapFacts mapChunk_302590 560 114487 :=
  checkMap_sound mapChunk_302590 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_303150_facts :
    MapFacts mapChunk_303150 561 114487 :=
  checkMap_sound mapChunk_303150 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_302590_001121_facts :
    MapFacts mapNode_302590_001121 1121 114487 :=
  map_facts_branch
    mapChunk_302590
    mapChunk_303150
    560 561 114487
    mapChunk_302590_facts
    mapChunk_303150_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_303711_facts :
    MapFacts mapChunk_303711 560 114487 :=
  checkMap_sound mapChunk_303711 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_304271_facts :
    MapFacts mapChunk_304271 561 114487 :=
  checkMap_sound mapChunk_304271 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t544\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_303711_001121_facts :
    MapFacts mapNode_303711_001121 1121 114487 :=
  map_facts_branch
    mapChunk_303711
    mapChunk_304271
    560 561 114487
    mapChunk_303711_facts
    mapChunk_304271_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_302590_002242_facts :
    MapFacts mapNode_302590_002242 2242 114487 :=
  map_facts_branch
    mapNode_302590_001121
    mapNode_303711_001121
    1121 1121 114487
    mapNode_302590_001121_facts
    mapNode_303711_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_300349_004483_facts :
    MapFacts mapNode_300349_004483 4483 114487 :=
  map_facts_branch
    mapNode_300349_002241
    mapNode_302590_002242
    2241 2242 114487
    mapNode_300349_002241_facts
    mapNode_302590_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_295866_008966_facts :
    MapFacts mapNode_295866_008966 8966 114487 :=
  map_facts_branch
    mapNode_295866_004483
    mapNode_300349_004483
    4483 4483 114487
    mapNode_295866_004483_facts
    mapNode_300349_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_286901_017931_facts :
    MapFacts mapNode_286901_017931 17931 114487 :=
  map_facts_branch
    mapNode_286901_008965
    mapNode_295866_008966
    8965 8966 114487
    mapNode_286901_008965_facts
    mapNode_295866_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_304832_facts :
    MapFacts mapChunk_304832 560 114487 :=
  checkMap_sound mapChunk_304832 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_305392_facts :
    MapFacts mapChunk_305392 560 114487 :=
  checkMap_sound mapChunk_305392 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_304832_001120_facts :
    MapFacts mapNode_304832_001120 1120 114487 :=
  map_facts_branch
    mapChunk_304832
    mapChunk_305392
    560 560 114487
    mapChunk_304832_facts
    mapChunk_305392_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_305952_facts :
    MapFacts mapChunk_305952 560 114487 :=
  checkMap_sound mapChunk_305952 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_306512_facts :
    MapFacts mapChunk_306512 561 114487 :=
  checkMap_sound mapChunk_306512 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_305952_001121_facts :
    MapFacts mapNode_305952_001121 1121 114487 :=
  map_facts_branch
    mapChunk_305952
    mapChunk_306512
    560 561 114487
    mapChunk_305952_facts
    mapChunk_306512_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_304832_002241_facts :
    MapFacts mapNode_304832_002241 2241 114487 :=
  map_facts_branch
    mapNode_304832_001120
    mapNode_305952_001121
    1120 1121 114487
    mapNode_304832_001120_facts
    mapNode_305952_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_307073_facts :
    MapFacts mapChunk_307073 560 114487 :=
  checkMap_sound mapChunk_307073 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_307633_facts :
    MapFacts mapChunk_307633 560 114487 :=
  checkMap_sound mapChunk_307633 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_307073_001120_facts :
    MapFacts mapNode_307073_001120 1120 114487 :=
  map_facts_branch
    mapChunk_307073
    mapChunk_307633
    560 560 114487
    mapChunk_307073_facts
    mapChunk_307633_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_308193_facts :
    MapFacts mapChunk_308193 560 114487 :=
  checkMap_sound mapChunk_308193 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_308753_facts :
    MapFacts mapChunk_308753 561 114487 :=
  checkMap_sound mapChunk_308753 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_308193_001121_facts :
    MapFacts mapNode_308193_001121 1121 114487 :=
  map_facts_branch
    mapChunk_308193
    mapChunk_308753
    560 561 114487
    mapChunk_308193_facts
    mapChunk_308753_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_307073_002241_facts :
    MapFacts mapNode_307073_002241 2241 114487 :=
  map_facts_branch
    mapNode_307073_001120
    mapNode_308193_001121
    1120 1121 114487
    mapNode_307073_001120_facts
    mapNode_308193_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_304832_004482_facts :
    MapFacts mapNode_304832_004482 4482 114487 :=
  map_facts_branch
    mapNode_304832_002241
    mapNode_307073_002241
    2241 2241 114487
    mapNode_304832_002241_facts
    mapNode_307073_002241_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_309314_facts :
    MapFacts mapChunk_309314 560 114487 :=
  checkMap_sound mapChunk_309314 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_309874_facts :
    MapFacts mapChunk_309874 560 114487 :=
  checkMap_sound mapChunk_309874 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_309314_001120_facts :
    MapFacts mapNode_309314_001120 1120 114487 :=
  map_facts_branch
    mapChunk_309314
    mapChunk_309874
    560 560 114487
    mapChunk_309314_facts
    mapChunk_309874_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_310434_facts :
    MapFacts mapChunk_310434 560 114487 :=
  checkMap_sound mapChunk_310434 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_310994_facts :
    MapFacts mapChunk_310994 561 114487 :=
  checkMap_sound mapChunk_310994 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_310434_001121_facts :
    MapFacts mapNode_310434_001121 1121 114487 :=
  map_facts_branch
    mapChunk_310434
    mapChunk_310994
    560 561 114487
    mapChunk_310434_facts
    mapChunk_310994_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_309314_002241_facts :
    MapFacts mapNode_309314_002241 2241 114487 :=
  map_facts_branch
    mapNode_309314_001120
    mapNode_310434_001121
    1120 1121 114487
    mapNode_309314_001120_facts
    mapNode_310434_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_311555_facts :
    MapFacts mapChunk_311555 560 114487 :=
  checkMap_sound mapChunk_311555 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_312115_facts :
    MapFacts mapChunk_312115 561 114487 :=
  checkMap_sound mapChunk_312115 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_311555_001121_facts :
    MapFacts mapNode_311555_001121 1121 114487 :=
  map_facts_branch
    mapChunk_311555
    mapChunk_312115
    560 561 114487
    mapChunk_311555_facts
    mapChunk_312115_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_312676_facts :
    MapFacts mapChunk_312676 560 114487 :=
  checkMap_sound mapChunk_312676 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_313236_facts :
    MapFacts mapChunk_313236 561 114487 :=
  checkMap_sound mapChunk_313236 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_312676_001121_facts :
    MapFacts mapNode_312676_001121 1121 114487 :=
  map_facts_branch
    mapChunk_312676
    mapChunk_313236
    560 561 114487
    mapChunk_312676_facts
    mapChunk_313236_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_311555_002242_facts :
    MapFacts mapNode_311555_002242 2242 114487 :=
  map_facts_branch
    mapNode_311555_001121
    mapNode_312676_001121
    1121 1121 114487
    mapNode_311555_001121_facts
    mapNode_312676_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_309314_004483_facts :
    MapFacts mapNode_309314_004483 4483 114487 :=
  map_facts_branch
    mapNode_309314_002241
    mapNode_311555_002242
    2241 2242 114487
    mapNode_309314_002241_facts
    mapNode_311555_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_304832_008965_facts :
    MapFacts mapNode_304832_008965 8965 114487 :=
  map_facts_branch
    mapNode_304832_004482
    mapNode_309314_004483
    4482 4483 114487
    mapNode_304832_004482_facts
    mapNode_309314_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_313797_facts :
    MapFacts mapChunk_313797 560 114487 :=
  checkMap_sound mapChunk_313797 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_314357_facts :
    MapFacts mapChunk_314357 560 114487 :=
  checkMap_sound mapChunk_314357 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_313797_001120_facts :
    MapFacts mapNode_313797_001120 1120 114487 :=
  map_facts_branch
    mapChunk_313797
    mapChunk_314357
    560 560 114487
    mapChunk_313797_facts
    mapChunk_314357_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_314917_facts :
    MapFacts mapChunk_314917 560 114487 :=
  checkMap_sound mapChunk_314917 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_315477_facts :
    MapFacts mapChunk_315477 561 114487 :=
  checkMap_sound mapChunk_315477 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_314917_001121_facts :
    MapFacts mapNode_314917_001121 1121 114487 :=
  map_facts_branch
    mapChunk_314917
    mapChunk_315477
    560 561 114487
    mapChunk_314917_facts
    mapChunk_315477_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_313797_002241_facts :
    MapFacts mapNode_313797_002241 2241 114487 :=
  map_facts_branch
    mapNode_313797_001120
    mapNode_314917_001121
    1120 1121 114487
    mapNode_313797_001120_facts
    mapNode_314917_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_316038_facts :
    MapFacts mapChunk_316038 560 114487 :=
  checkMap_sound mapChunk_316038 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_316598_facts :
    MapFacts mapChunk_316598 561 114487 :=
  checkMap_sound mapChunk_316598 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_316038_001121_facts :
    MapFacts mapNode_316038_001121 1121 114487 :=
  map_facts_branch
    mapChunk_316038
    mapChunk_316598
    560 561 114487
    mapChunk_316038_facts
    mapChunk_316598_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_317159_facts :
    MapFacts mapChunk_317159 560 114487 :=
  checkMap_sound mapChunk_317159 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_317719_facts :
    MapFacts mapChunk_317719 561 114487 :=
  checkMap_sound mapChunk_317719 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_317159_001121_facts :
    MapFacts mapNode_317159_001121 1121 114487 :=
  map_facts_branch
    mapChunk_317159
    mapChunk_317719
    560 561 114487
    mapChunk_317159_facts
    mapChunk_317719_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_316038_002242_facts :
    MapFacts mapNode_316038_002242 2242 114487 :=
  map_facts_branch
    mapNode_316038_001121
    mapNode_317159_001121
    1121 1121 114487
    mapNode_316038_001121_facts
    mapNode_317159_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_313797_004483_facts :
    MapFacts mapNode_313797_004483 4483 114487 :=
  map_facts_branch
    mapNode_313797_002241
    mapNode_316038_002242
    2241 2242 114487
    mapNode_313797_002241_facts
    mapNode_316038_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_318280_facts :
    MapFacts mapChunk_318280 560 114487 :=
  checkMap_sound mapChunk_318280 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_318840_facts :
    MapFacts mapChunk_318840 560 114487 :=
  checkMap_sound mapChunk_318840 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_318280_001120_facts :
    MapFacts mapNode_318280_001120 1120 114487 :=
  map_facts_branch
    mapChunk_318280
    mapChunk_318840
    560 560 114487
    mapChunk_318280_facts
    mapChunk_318840_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_319400_facts :
    MapFacts mapChunk_319400 560 114487 :=
  checkMap_sound mapChunk_319400 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_319960_facts :
    MapFacts mapChunk_319960 561 114487 :=
  checkMap_sound mapChunk_319960 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_319400_001121_facts :
    MapFacts mapNode_319400_001121 1121 114487 :=
  map_facts_branch
    mapChunk_319400
    mapChunk_319960
    560 561 114487
    mapChunk_319400_facts
    mapChunk_319960_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_318280_002241_facts :
    MapFacts mapNode_318280_002241 2241 114487 :=
  map_facts_branch
    mapNode_318280_001120
    mapNode_319400_001121
    1120 1121 114487
    mapNode_318280_001120_facts
    mapNode_319400_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_320521_facts :
    MapFacts mapChunk_320521 560 114487 :=
  checkMap_sound mapChunk_320521 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_321081_facts :
    MapFacts mapChunk_321081 561 114487 :=
  checkMap_sound mapChunk_321081 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_320521_001121_facts :
    MapFacts mapNode_320521_001121 1121 114487 :=
  map_facts_branch
    mapChunk_320521
    mapChunk_321081
    560 561 114487
    mapChunk_320521_facts
    mapChunk_321081_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_321642_facts :
    MapFacts mapChunk_321642 560 114487 :=
  checkMap_sound mapChunk_321642 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_322202_facts :
    MapFacts mapChunk_322202 561 114487 :=
  checkMap_sound mapChunk_322202 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t576\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_321642_001121_facts :
    MapFacts mapNode_321642_001121 1121 114487 :=
  map_facts_branch
    mapChunk_321642
    mapChunk_322202
    560 561 114487
    mapChunk_321642_facts
    mapChunk_322202_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_320521_002242_facts :
    MapFacts mapNode_320521_002242 2242 114487 :=
  map_facts_branch
    mapNode_320521_001121
    mapNode_321642_001121
    1121 1121 114487
    mapNode_320521_001121_facts
    mapNode_321642_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_318280_004483_facts :
    MapFacts mapNode_318280_004483 4483 114487 :=
  map_facts_branch
    mapNode_318280_002241
    mapNode_320521_002242
    2241 2242 114487
    mapNode_318280_002241_facts
    mapNode_320521_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_313797_008966_facts :
    MapFacts mapNode_313797_008966 8966 114487 :=
  map_facts_branch
    mapNode_313797_004483
    mapNode_318280_004483
    4483 4483 114487
    mapNode_313797_004483_facts
    mapNode_318280_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_304832_017931_facts :
    MapFacts mapNode_304832_017931 17931 114487 :=
  map_facts_branch
    mapNode_304832_008965
    mapNode_313797_008966
    8965 8966 114487
    mapNode_304832_008965_facts
    mapNode_313797_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_286901_035862_facts :
    MapFacts mapNode_286901_035862 35862 114487 :=
  map_facts_branch
    mapNode_286901_017931
    mapNode_304832_017931
    17931 17931 114487
    mapNode_286901_017931_facts
    mapNode_304832_017931_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_322763_facts :
    MapFacts mapChunk_322763 560 114487 :=
  checkMap_sound mapChunk_322763 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_323323_facts :
    MapFacts mapChunk_323323 560 114487 :=
  checkMap_sound mapChunk_323323 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_322763_001120_facts :
    MapFacts mapNode_322763_001120 1120 114487 :=
  map_facts_branch
    mapChunk_322763
    mapChunk_323323
    560 560 114487
    mapChunk_322763_facts
    mapChunk_323323_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_323883_facts :
    MapFacts mapChunk_323883 560 114487 :=
  checkMap_sound mapChunk_323883 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_324443_facts :
    MapFacts mapChunk_324443 561 114487 :=
  checkMap_sound mapChunk_324443 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_323883_001121_facts :
    MapFacts mapNode_323883_001121 1121 114487 :=
  map_facts_branch
    mapChunk_323883
    mapChunk_324443
    560 561 114487
    mapChunk_323883_facts
    mapChunk_324443_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_322763_002241_facts :
    MapFacts mapNode_322763_002241 2241 114487 :=
  map_facts_branch
    mapNode_322763_001120
    mapNode_323883_001121
    1120 1121 114487
    mapNode_322763_001120_facts
    mapNode_323883_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_325004_facts :
    MapFacts mapChunk_325004 560 114487 :=
  checkMap_sound mapChunk_325004 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_325564_facts :
    MapFacts mapChunk_325564 560 114487 :=
  checkMap_sound mapChunk_325564 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_325004_001120_facts :
    MapFacts mapNode_325004_001120 1120 114487 :=
  map_facts_branch
    mapChunk_325004
    mapChunk_325564
    560 560 114487
    mapChunk_325004_facts
    mapChunk_325564_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_326124_facts :
    MapFacts mapChunk_326124 560 114487 :=
  checkMap_sound mapChunk_326124 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_326684_facts :
    MapFacts mapChunk_326684 561 114487 :=
  checkMap_sound mapChunk_326684 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_326124_001121_facts :
    MapFacts mapNode_326124_001121 1121 114487 :=
  map_facts_branch
    mapChunk_326124
    mapChunk_326684
    560 561 114487
    mapChunk_326124_facts
    mapChunk_326684_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_325004_002241_facts :
    MapFacts mapNode_325004_002241 2241 114487 :=
  map_facts_branch
    mapNode_325004_001120
    mapNode_326124_001121
    1120 1121 114487
    mapNode_325004_001120_facts
    mapNode_326124_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_322763_004482_facts :
    MapFacts mapNode_322763_004482 4482 114487 :=
  map_facts_branch
    mapNode_322763_002241
    mapNode_325004_002241
    2241 2241 114487
    mapNode_322763_002241_facts
    mapNode_325004_002241_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_327245_facts :
    MapFacts mapChunk_327245 560 114487 :=
  checkMap_sound mapChunk_327245 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_327805_facts :
    MapFacts mapChunk_327805 560 114487 :=
  checkMap_sound mapChunk_327805 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_327245_001120_facts :
    MapFacts mapNode_327245_001120 1120 114487 :=
  map_facts_branch
    mapChunk_327245
    mapChunk_327805
    560 560 114487
    mapChunk_327245_facts
    mapChunk_327805_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_328365_facts :
    MapFacts mapChunk_328365 560 114487 :=
  checkMap_sound mapChunk_328365 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_328925_facts :
    MapFacts mapChunk_328925 561 114487 :=
  checkMap_sound mapChunk_328925 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_328365_001121_facts :
    MapFacts mapNode_328365_001121 1121 114487 :=
  map_facts_branch
    mapChunk_328365
    mapChunk_328925
    560 561 114487
    mapChunk_328365_facts
    mapChunk_328925_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_327245_002241_facts :
    MapFacts mapNode_327245_002241 2241 114487 :=
  map_facts_branch
    mapNode_327245_001120
    mapNode_328365_001121
    1120 1121 114487
    mapNode_327245_001120_facts
    mapNode_328365_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_329486_facts :
    MapFacts mapChunk_329486 560 114487 :=
  checkMap_sound mapChunk_329486 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_330046_facts :
    MapFacts mapChunk_330046 561 114487 :=
  checkMap_sound mapChunk_330046 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_329486_001121_facts :
    MapFacts mapNode_329486_001121 1121 114487 :=
  map_facts_branch
    mapChunk_329486
    mapChunk_330046
    560 561 114487
    mapChunk_329486_facts
    mapChunk_330046_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_330607_facts :
    MapFacts mapChunk_330607 560 114487 :=
  checkMap_sound mapChunk_330607 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_331167_facts :
    MapFacts mapChunk_331167 561 114487 :=
  checkMap_sound mapChunk_331167 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_330607_001121_facts :
    MapFacts mapNode_330607_001121 1121 114487 :=
  map_facts_branch
    mapChunk_330607
    mapChunk_331167
    560 561 114487
    mapChunk_330607_facts
    mapChunk_331167_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_329486_002242_facts :
    MapFacts mapNode_329486_002242 2242 114487 :=
  map_facts_branch
    mapNode_329486_001121
    mapNode_330607_001121
    1121 1121 114487
    mapNode_329486_001121_facts
    mapNode_330607_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_327245_004483_facts :
    MapFacts mapNode_327245_004483 4483 114487 :=
  map_facts_branch
    mapNode_327245_002241
    mapNode_329486_002242
    2241 2242 114487
    mapNode_327245_002241_facts
    mapNode_329486_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_322763_008965_facts :
    MapFacts mapNode_322763_008965 8965 114487 :=
  map_facts_branch
    mapNode_322763_004482
    mapNode_327245_004483
    4482 4483 114487
    mapNode_322763_004482_facts
    mapNode_327245_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_331728_facts :
    MapFacts mapChunk_331728 560 114487 :=
  checkMap_sound mapChunk_331728 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_332288_facts :
    MapFacts mapChunk_332288 560 114487 :=
  checkMap_sound mapChunk_332288 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_331728_001120_facts :
    MapFacts mapNode_331728_001120 1120 114487 :=
  map_facts_branch
    mapChunk_331728
    mapChunk_332288
    560 560 114487
    mapChunk_331728_facts
    mapChunk_332288_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_332848_facts :
    MapFacts mapChunk_332848 560 114487 :=
  checkMap_sound mapChunk_332848 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_333408_facts :
    MapFacts mapChunk_333408 561 114487 :=
  checkMap_sound mapChunk_333408 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_332848_001121_facts :
    MapFacts mapNode_332848_001121 1121 114487 :=
  map_facts_branch
    mapChunk_332848
    mapChunk_333408
    560 561 114487
    mapChunk_332848_facts
    mapChunk_333408_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_331728_002241_facts :
    MapFacts mapNode_331728_002241 2241 114487 :=
  map_facts_branch
    mapNode_331728_001120
    mapNode_332848_001121
    1120 1121 114487
    mapNode_331728_001120_facts
    mapNode_332848_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_333969_facts :
    MapFacts mapChunk_333969 560 114487 :=
  checkMap_sound mapChunk_333969 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_334529_facts :
    MapFacts mapChunk_334529 561 114487 :=
  checkMap_sound mapChunk_334529 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_333969_001121_facts :
    MapFacts mapNode_333969_001121 1121 114487 :=
  map_facts_branch
    mapChunk_333969
    mapChunk_334529
    560 561 114487
    mapChunk_333969_facts
    mapChunk_334529_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_335090_facts :
    MapFacts mapChunk_335090 560 114487 :=
  checkMap_sound mapChunk_335090 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_335650_facts :
    MapFacts mapChunk_335650 561 114487 :=
  checkMap_sound mapChunk_335650 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_335090_001121_facts :
    MapFacts mapNode_335090_001121 1121 114487 :=
  map_facts_branch
    mapChunk_335090
    mapChunk_335650
    560 561 114487
    mapChunk_335090_facts
    mapChunk_335650_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_333969_002242_facts :
    MapFacts mapNode_333969_002242 2242 114487 :=
  map_facts_branch
    mapNode_333969_001121
    mapNode_335090_001121
    1121 1121 114487
    mapNode_333969_001121_facts
    mapNode_335090_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_331728_004483_facts :
    MapFacts mapNode_331728_004483 4483 114487 :=
  map_facts_branch
    mapNode_331728_002241
    mapNode_333969_002242
    2241 2242 114487
    mapNode_331728_002241_facts
    mapNode_333969_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_336211_facts :
    MapFacts mapChunk_336211 560 114487 :=
  checkMap_sound mapChunk_336211 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_336771_facts :
    MapFacts mapChunk_336771 560 114487 :=
  checkMap_sound mapChunk_336771 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_336211_001120_facts :
    MapFacts mapNode_336211_001120 1120 114487 :=
  map_facts_branch
    mapChunk_336211
    mapChunk_336771
    560 560 114487
    mapChunk_336211_facts
    mapChunk_336771_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_337331_facts :
    MapFacts mapChunk_337331 560 114487 :=
  checkMap_sound mapChunk_337331 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_337891_facts :
    MapFacts mapChunk_337891 561 114487 :=
  checkMap_sound mapChunk_337891 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_337331_001121_facts :
    MapFacts mapNode_337331_001121 1121 114487 :=
  map_facts_branch
    mapChunk_337331
    mapChunk_337891
    560 561 114487
    mapChunk_337331_facts
    mapChunk_337891_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_336211_002241_facts :
    MapFacts mapNode_336211_002241 2241 114487 :=
  map_facts_branch
    mapNode_336211_001120
    mapNode_337331_001121
    1120 1121 114487
    mapNode_336211_001120_facts
    mapNode_337331_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_338452_facts :
    MapFacts mapChunk_338452 560 114487 :=
  checkMap_sound mapChunk_338452 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_339012_facts :
    MapFacts mapChunk_339012 561 114487 :=
  checkMap_sound mapChunk_339012 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_338452_001121_facts :
    MapFacts mapNode_338452_001121 1121 114487 :=
  map_facts_branch
    mapChunk_338452
    mapChunk_339012
    560 561 114487
    mapChunk_338452_facts
    mapChunk_339012_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_339573_facts :
    MapFacts mapChunk_339573 560 114487 :=
  checkMap_sound mapChunk_339573 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_340133_facts :
    MapFacts mapChunk_340133 561 114487 :=
  checkMap_sound mapChunk_340133 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t608\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_339573_001121_facts :
    MapFacts mapNode_339573_001121 1121 114487 :=
  map_facts_branch
    mapChunk_339573
    mapChunk_340133
    560 561 114487
    mapChunk_339573_facts
    mapChunk_340133_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_338452_002242_facts :
    MapFacts mapNode_338452_002242 2242 114487 :=
  map_facts_branch
    mapNode_338452_001121
    mapNode_339573_001121
    1121 1121 114487
    mapNode_338452_001121_facts
    mapNode_339573_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_336211_004483_facts :
    MapFacts mapNode_336211_004483 4483 114487 :=
  map_facts_branch
    mapNode_336211_002241
    mapNode_338452_002242
    2241 2242 114487
    mapNode_336211_002241_facts
    mapNode_338452_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_331728_008966_facts :
    MapFacts mapNode_331728_008966 8966 114487 :=
  map_facts_branch
    mapNode_331728_004483
    mapNode_336211_004483
    4483 4483 114487
    mapNode_331728_004483_facts
    mapNode_336211_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_322763_017931_facts :
    MapFacts mapNode_322763_017931 17931 114487 :=
  map_facts_branch
    mapNode_322763_008965
    mapNode_331728_008966
    8965 8966 114487
    mapNode_322763_008965_facts
    mapNode_331728_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_340694_facts :
    MapFacts mapChunk_340694 560 114487 :=
  checkMap_sound mapChunk_340694 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_341254_facts :
    MapFacts mapChunk_341254 560 114487 :=
  checkMap_sound mapChunk_341254 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_340694_001120_facts :
    MapFacts mapNode_340694_001120 1120 114487 :=
  map_facts_branch
    mapChunk_340694
    mapChunk_341254
    560 560 114487
    mapChunk_340694_facts
    mapChunk_341254_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_341814_facts :
    MapFacts mapChunk_341814 560 114487 :=
  checkMap_sound mapChunk_341814 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_342374_facts :
    MapFacts mapChunk_342374 561 114487 :=
  checkMap_sound mapChunk_342374 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_341814_001121_facts :
    MapFacts mapNode_341814_001121 1121 114487 :=
  map_facts_branch
    mapChunk_341814
    mapChunk_342374
    560 561 114487
    mapChunk_341814_facts
    mapChunk_342374_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_340694_002241_facts :
    MapFacts mapNode_340694_002241 2241 114487 :=
  map_facts_branch
    mapNode_340694_001120
    mapNode_341814_001121
    1120 1121 114487
    mapNode_340694_001120_facts
    mapNode_341814_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_342935_facts :
    MapFacts mapChunk_342935 560 114487 :=
  checkMap_sound mapChunk_342935 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_343495_facts :
    MapFacts mapChunk_343495 561 114487 :=
  checkMap_sound mapChunk_343495 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_342935_001121_facts :
    MapFacts mapNode_342935_001121 1121 114487 :=
  map_facts_branch
    mapChunk_342935
    mapChunk_343495
    560 561 114487
    mapChunk_342935_facts
    mapChunk_343495_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_344056_facts :
    MapFacts mapChunk_344056 560 114487 :=
  checkMap_sound mapChunk_344056 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_344616_facts :
    MapFacts mapChunk_344616 561 114487 :=
  checkMap_sound mapChunk_344616 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_344056_001121_facts :
    MapFacts mapNode_344056_001121 1121 114487 :=
  map_facts_branch
    mapChunk_344056
    mapChunk_344616
    560 561 114487
    mapChunk_344056_facts
    mapChunk_344616_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_342935_002242_facts :
    MapFacts mapNode_342935_002242 2242 114487 :=
  map_facts_branch
    mapNode_342935_001121
    mapNode_344056_001121
    1121 1121 114487
    mapNode_342935_001121_facts
    mapNode_344056_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_340694_004483_facts :
    MapFacts mapNode_340694_004483 4483 114487 :=
  map_facts_branch
    mapNode_340694_002241
    mapNode_342935_002242
    2241 2242 114487
    mapNode_340694_002241_facts
    mapNode_342935_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_345177_facts :
    MapFacts mapChunk_345177 560 114487 :=
  checkMap_sound mapChunk_345177 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_345737_facts :
    MapFacts mapChunk_345737 560 114487 :=
  checkMap_sound mapChunk_345737 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_345177_001120_facts :
    MapFacts mapNode_345177_001120 1120 114487 :=
  map_facts_branch
    mapChunk_345177
    mapChunk_345737
    560 560 114487
    mapChunk_345177_facts
    mapChunk_345737_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_346297_facts :
    MapFacts mapChunk_346297 560 114487 :=
  checkMap_sound mapChunk_346297 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_346857_facts :
    MapFacts mapChunk_346857 561 114487 :=
  checkMap_sound mapChunk_346857 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_346297_001121_facts :
    MapFacts mapNode_346297_001121 1121 114487 :=
  map_facts_branch
    mapChunk_346297
    mapChunk_346857
    560 561 114487
    mapChunk_346297_facts
    mapChunk_346857_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_345177_002241_facts :
    MapFacts mapNode_345177_002241 2241 114487 :=
  map_facts_branch
    mapNode_345177_001120
    mapNode_346297_001121
    1120 1121 114487
    mapNode_345177_001120_facts
    mapNode_346297_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_347418_facts :
    MapFacts mapChunk_347418 560 114487 :=
  checkMap_sound mapChunk_347418 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_347978_facts :
    MapFacts mapChunk_347978 561 114487 :=
  checkMap_sound mapChunk_347978 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_347418_001121_facts :
    MapFacts mapNode_347418_001121 1121 114487 :=
  map_facts_branch
    mapChunk_347418
    mapChunk_347978
    560 561 114487
    mapChunk_347418_facts
    mapChunk_347978_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_348539_facts :
    MapFacts mapChunk_348539 560 114487 :=
  checkMap_sound mapChunk_348539 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_349099_facts :
    MapFacts mapChunk_349099 561 114487 :=
  checkMap_sound mapChunk_349099 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_348539_001121_facts :
    MapFacts mapNode_348539_001121 1121 114487 :=
  map_facts_branch
    mapChunk_348539
    mapChunk_349099
    560 561 114487
    mapChunk_348539_facts
    mapChunk_349099_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_347418_002242_facts :
    MapFacts mapNode_347418_002242 2242 114487 :=
  map_facts_branch
    mapNode_347418_001121
    mapNode_348539_001121
    1121 1121 114487
    mapNode_347418_001121_facts
    mapNode_348539_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_345177_004483_facts :
    MapFacts mapNode_345177_004483 4483 114487 :=
  map_facts_branch
    mapNode_345177_002241
    mapNode_347418_002242
    2241 2242 114487
    mapNode_345177_002241_facts
    mapNode_347418_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_340694_008966_facts :
    MapFacts mapNode_340694_008966 8966 114487 :=
  map_facts_branch
    mapNode_340694_004483
    mapNode_345177_004483
    4483 4483 114487
    mapNode_340694_004483_facts
    mapNode_345177_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_349660_facts :
    MapFacts mapChunk_349660 560 114487 :=
  checkMap_sound mapChunk_349660 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_350220_facts :
    MapFacts mapChunk_350220 560 114487 :=
  checkMap_sound mapChunk_350220 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_349660_001120_facts :
    MapFacts mapNode_349660_001120 1120 114487 :=
  map_facts_branch
    mapChunk_349660
    mapChunk_350220
    560 560 114487
    mapChunk_349660_facts
    mapChunk_350220_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_350780_facts :
    MapFacts mapChunk_350780 560 114487 :=
  checkMap_sound mapChunk_350780 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_351340_facts :
    MapFacts mapChunk_351340 561 114487 :=
  checkMap_sound mapChunk_351340 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_350780_001121_facts :
    MapFacts mapNode_350780_001121 1121 114487 :=
  map_facts_branch
    mapChunk_350780
    mapChunk_351340
    560 561 114487
    mapChunk_350780_facts
    mapChunk_351340_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_349660_002241_facts :
    MapFacts mapNode_349660_002241 2241 114487 :=
  map_facts_branch
    mapNode_349660_001120
    mapNode_350780_001121
    1120 1121 114487
    mapNode_349660_001120_facts
    mapNode_350780_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_351901_facts :
    MapFacts mapChunk_351901 560 114487 :=
  checkMap_sound mapChunk_351901 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_352461_facts :
    MapFacts mapChunk_352461 561 114487 :=
  checkMap_sound mapChunk_352461 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_351901_001121_facts :
    MapFacts mapNode_351901_001121 1121 114487 :=
  map_facts_branch
    mapChunk_351901
    mapChunk_352461
    560 561 114487
    mapChunk_351901_facts
    mapChunk_352461_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_353022_facts :
    MapFacts mapChunk_353022 560 114487 :=
  checkMap_sound mapChunk_353022 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_353582_facts :
    MapFacts mapChunk_353582 561 114487 :=
  checkMap_sound mapChunk_353582 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_353022_001121_facts :
    MapFacts mapNode_353022_001121 1121 114487 :=
  map_facts_branch
    mapChunk_353022
    mapChunk_353582
    560 561 114487
    mapChunk_353022_facts
    mapChunk_353582_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_351901_002242_facts :
    MapFacts mapNode_351901_002242 2242 114487 :=
  map_facts_branch
    mapNode_351901_001121
    mapNode_353022_001121
    1121 1121 114487
    mapNode_351901_001121_facts
    mapNode_353022_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_349660_004483_facts :
    MapFacts mapNode_349660_004483 4483 114487 :=
  map_facts_branch
    mapNode_349660_002241
    mapNode_351901_002242
    2241 2242 114487
    mapNode_349660_002241_facts
    mapNode_351901_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_354143_facts :
    MapFacts mapChunk_354143 560 114487 :=
  checkMap_sound mapChunk_354143 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_354703_facts :
    MapFacts mapChunk_354703 560 114487 :=
  checkMap_sound mapChunk_354703 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_354143_001120_facts :
    MapFacts mapNode_354143_001120 1120 114487 :=
  map_facts_branch
    mapChunk_354143
    mapChunk_354703
    560 560 114487
    mapChunk_354143_facts
    mapChunk_354703_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_355263_facts :
    MapFacts mapChunk_355263 560 114487 :=
  checkMap_sound mapChunk_355263 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_355823_facts :
    MapFacts mapChunk_355823 561 114487 :=
  checkMap_sound mapChunk_355823 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_355263_001121_facts :
    MapFacts mapNode_355263_001121 1121 114487 :=
  map_facts_branch
    mapChunk_355263
    mapChunk_355823
    560 561 114487
    mapChunk_355263_facts
    mapChunk_355823_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_354143_002241_facts :
    MapFacts mapNode_354143_002241 2241 114487 :=
  map_facts_branch
    mapNode_354143_001120
    mapNode_355263_001121
    1120 1121 114487
    mapNode_354143_001120_facts
    mapNode_355263_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_356384_facts :
    MapFacts mapChunk_356384 560 114487 :=
  checkMap_sound mapChunk_356384 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_356944_facts :
    MapFacts mapChunk_356944 561 114487 :=
  checkMap_sound mapChunk_356944 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_356384_001121_facts :
    MapFacts mapNode_356384_001121 1121 114487 :=
  map_facts_branch
    mapChunk_356384
    mapChunk_356944
    560 561 114487
    mapChunk_356384_facts
    mapChunk_356944_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_357505_facts :
    MapFacts mapChunk_357505 560 114487 :=
  checkMap_sound mapChunk_357505 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_358065_facts :
    MapFacts mapChunk_358065 561 114487 :=
  checkMap_sound mapChunk_358065 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t640\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_357505_001121_facts :
    MapFacts mapNode_357505_001121 1121 114487 :=
  map_facts_branch
    mapChunk_357505
    mapChunk_358065
    560 561 114487
    mapChunk_357505_facts
    mapChunk_358065_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_356384_002242_facts :
    MapFacts mapNode_356384_002242 2242 114487 :=
  map_facts_branch
    mapNode_356384_001121
    mapNode_357505_001121
    1121 1121 114487
    mapNode_356384_001121_facts
    mapNode_357505_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_354143_004483_facts :
    MapFacts mapNode_354143_004483 4483 114487 :=
  map_facts_branch
    mapNode_354143_002241
    mapNode_356384_002242
    2241 2242 114487
    mapNode_354143_002241_facts
    mapNode_356384_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_349660_008966_facts :
    MapFacts mapNode_349660_008966 8966 114487 :=
  map_facts_branch
    mapNode_349660_004483
    mapNode_354143_004483
    4483 4483 114487
    mapNode_349660_004483_facts
    mapNode_354143_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_340694_017932_facts :
    MapFacts mapNode_340694_017932 17932 114487 :=
  map_facts_branch
    mapNode_340694_008966
    mapNode_349660_008966
    8966 8966 114487
    mapNode_340694_008966_facts
    mapNode_349660_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_322763_035863_facts :
    MapFacts mapNode_322763_035863 35863 114487 :=
  map_facts_branch
    mapNode_322763_017931
    mapNode_340694_017932
    17931 17932 114487
    mapNode_322763_017931_facts
    mapNode_340694_017932_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_286901_071725_facts :
    MapFacts mapNode_286901_071725 71725 114487 :=
  map_facts_branch
    mapNode_286901_035862
    mapNode_322763_035863
    35862 35863 114487
    mapNode_286901_035862_facts
    mapNode_322763_035863_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_358626_facts :
    MapFacts mapChunk_358626 560 114487 :=
  checkMap_sound mapChunk_358626 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_359186_facts :
    MapFacts mapChunk_359186 560 114487 :=
  checkMap_sound mapChunk_359186 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_358626_001120_facts :
    MapFacts mapNode_358626_001120 1120 114487 :=
  map_facts_branch
    mapChunk_358626
    mapChunk_359186
    560 560 114487
    mapChunk_358626_facts
    mapChunk_359186_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_359746_facts :
    MapFacts mapChunk_359746 560 114487 :=
  checkMap_sound mapChunk_359746 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_360306_facts :
    MapFacts mapChunk_360306 561 114487 :=
  checkMap_sound mapChunk_360306 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_359746_001121_facts :
    MapFacts mapNode_359746_001121 1121 114487 :=
  map_facts_branch
    mapChunk_359746
    mapChunk_360306
    560 561 114487
    mapChunk_359746_facts
    mapChunk_360306_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_358626_002241_facts :
    MapFacts mapNode_358626_002241 2241 114487 :=
  map_facts_branch
    mapNode_358626_001120
    mapNode_359746_001121
    1120 1121 114487
    mapNode_358626_001120_facts
    mapNode_359746_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_360867_facts :
    MapFacts mapChunk_360867 560 114487 :=
  checkMap_sound mapChunk_360867 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_361427_facts :
    MapFacts mapChunk_361427 560 114487 :=
  checkMap_sound mapChunk_361427 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_360867_001120_facts :
    MapFacts mapNode_360867_001120 1120 114487 :=
  map_facts_branch
    mapChunk_360867
    mapChunk_361427
    560 560 114487
    mapChunk_360867_facts
    mapChunk_361427_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_361987_facts :
    MapFacts mapChunk_361987 560 114487 :=
  checkMap_sound mapChunk_361987 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_362547_facts :
    MapFacts mapChunk_362547 561 114487 :=
  checkMap_sound mapChunk_362547 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_361987_001121_facts :
    MapFacts mapNode_361987_001121 1121 114487 :=
  map_facts_branch
    mapChunk_361987
    mapChunk_362547
    560 561 114487
    mapChunk_361987_facts
    mapChunk_362547_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_360867_002241_facts :
    MapFacts mapNode_360867_002241 2241 114487 :=
  map_facts_branch
    mapNode_360867_001120
    mapNode_361987_001121
    1120 1121 114487
    mapNode_360867_001120_facts
    mapNode_361987_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_358626_004482_facts :
    MapFacts mapNode_358626_004482 4482 114487 :=
  map_facts_branch
    mapNode_358626_002241
    mapNode_360867_002241
    2241 2241 114487
    mapNode_358626_002241_facts
    mapNode_360867_002241_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_363108_facts :
    MapFacts mapChunk_363108 560 114487 :=
  checkMap_sound mapChunk_363108 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_363668_facts :
    MapFacts mapChunk_363668 560 114487 :=
  checkMap_sound mapChunk_363668 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_363108_001120_facts :
    MapFacts mapNode_363108_001120 1120 114487 :=
  map_facts_branch
    mapChunk_363108
    mapChunk_363668
    560 560 114487
    mapChunk_363108_facts
    mapChunk_363668_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_364228_facts :
    MapFacts mapChunk_364228 560 114487 :=
  checkMap_sound mapChunk_364228 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_364788_facts :
    MapFacts mapChunk_364788 561 114487 :=
  checkMap_sound mapChunk_364788 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_364228_001121_facts :
    MapFacts mapNode_364228_001121 1121 114487 :=
  map_facts_branch
    mapChunk_364228
    mapChunk_364788
    560 561 114487
    mapChunk_364228_facts
    mapChunk_364788_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_363108_002241_facts :
    MapFacts mapNode_363108_002241 2241 114487 :=
  map_facts_branch
    mapNode_363108_001120
    mapNode_364228_001121
    1120 1121 114487
    mapNode_363108_001120_facts
    mapNode_364228_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_365349_facts :
    MapFacts mapChunk_365349 560 114487 :=
  checkMap_sound mapChunk_365349 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_365909_facts :
    MapFacts mapChunk_365909 561 114487 :=
  checkMap_sound mapChunk_365909 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_365349_001121_facts :
    MapFacts mapNode_365349_001121 1121 114487 :=
  map_facts_branch
    mapChunk_365349
    mapChunk_365909
    560 561 114487
    mapChunk_365349_facts
    mapChunk_365909_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_366470_facts :
    MapFacts mapChunk_366470 560 114487 :=
  checkMap_sound mapChunk_366470 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_367030_facts :
    MapFacts mapChunk_367030 561 114487 :=
  checkMap_sound mapChunk_367030 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_366470_001121_facts :
    MapFacts mapNode_366470_001121 1121 114487 :=
  map_facts_branch
    mapChunk_366470
    mapChunk_367030
    560 561 114487
    mapChunk_366470_facts
    mapChunk_367030_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_365349_002242_facts :
    MapFacts mapNode_365349_002242 2242 114487 :=
  map_facts_branch
    mapNode_365349_001121
    mapNode_366470_001121
    1121 1121 114487
    mapNode_365349_001121_facts
    mapNode_366470_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_363108_004483_facts :
    MapFacts mapNode_363108_004483 4483 114487 :=
  map_facts_branch
    mapNode_363108_002241
    mapNode_365349_002242
    2241 2242 114487
    mapNode_363108_002241_facts
    mapNode_365349_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_358626_008965_facts :
    MapFacts mapNode_358626_008965 8965 114487 :=
  map_facts_branch
    mapNode_358626_004482
    mapNode_363108_004483
    4482 4483 114487
    mapNode_358626_004482_facts
    mapNode_363108_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_367591_facts :
    MapFacts mapChunk_367591 560 114487 :=
  checkMap_sound mapChunk_367591 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_368151_facts :
    MapFacts mapChunk_368151 560 114487 :=
  checkMap_sound mapChunk_368151 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_367591_001120_facts :
    MapFacts mapNode_367591_001120 1120 114487 :=
  map_facts_branch
    mapChunk_367591
    mapChunk_368151
    560 560 114487
    mapChunk_367591_facts
    mapChunk_368151_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_368711_facts :
    MapFacts mapChunk_368711 560 114487 :=
  checkMap_sound mapChunk_368711 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_369271_facts :
    MapFacts mapChunk_369271 561 114487 :=
  checkMap_sound mapChunk_369271 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_368711_001121_facts :
    MapFacts mapNode_368711_001121 1121 114487 :=
  map_facts_branch
    mapChunk_368711
    mapChunk_369271
    560 561 114487
    mapChunk_368711_facts
    mapChunk_369271_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_367591_002241_facts :
    MapFacts mapNode_367591_002241 2241 114487 :=
  map_facts_branch
    mapNode_367591_001120
    mapNode_368711_001121
    1120 1121 114487
    mapNode_367591_001120_facts
    mapNode_368711_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_369832_facts :
    MapFacts mapChunk_369832 560 114487 :=
  checkMap_sound mapChunk_369832 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_370392_facts :
    MapFacts mapChunk_370392 561 114487 :=
  checkMap_sound mapChunk_370392 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_369832_001121_facts :
    MapFacts mapNode_369832_001121 1121 114487 :=
  map_facts_branch
    mapChunk_369832
    mapChunk_370392
    560 561 114487
    mapChunk_369832_facts
    mapChunk_370392_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_370953_facts :
    MapFacts mapChunk_370953 560 114487 :=
  checkMap_sound mapChunk_370953 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_371513_facts :
    MapFacts mapChunk_371513 561 114487 :=
  checkMap_sound mapChunk_371513 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_370953_001121_facts :
    MapFacts mapNode_370953_001121 1121 114487 :=
  map_facts_branch
    mapChunk_370953
    mapChunk_371513
    560 561 114487
    mapChunk_370953_facts
    mapChunk_371513_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_369832_002242_facts :
    MapFacts mapNode_369832_002242 2242 114487 :=
  map_facts_branch
    mapNode_369832_001121
    mapNode_370953_001121
    1121 1121 114487
    mapNode_369832_001121_facts
    mapNode_370953_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_367591_004483_facts :
    MapFacts mapNode_367591_004483 4483 114487 :=
  map_facts_branch
    mapNode_367591_002241
    mapNode_369832_002242
    2241 2242 114487
    mapNode_367591_002241_facts
    mapNode_369832_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_372074_facts :
    MapFacts mapChunk_372074 560 114487 :=
  checkMap_sound mapChunk_372074 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_372634_facts :
    MapFacts mapChunk_372634 560 114487 :=
  checkMap_sound mapChunk_372634 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_372074_001120_facts :
    MapFacts mapNode_372074_001120 1120 114487 :=
  map_facts_branch
    mapChunk_372074
    mapChunk_372634
    560 560 114487
    mapChunk_372074_facts
    mapChunk_372634_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_373194_facts :
    MapFacts mapChunk_373194 560 114487 :=
  checkMap_sound mapChunk_373194 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_373754_facts :
    MapFacts mapChunk_373754 561 114487 :=
  checkMap_sound mapChunk_373754 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_373194_001121_facts :
    MapFacts mapNode_373194_001121 1121 114487 :=
  map_facts_branch
    mapChunk_373194
    mapChunk_373754
    560 561 114487
    mapChunk_373194_facts
    mapChunk_373754_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_372074_002241_facts :
    MapFacts mapNode_372074_002241 2241 114487 :=
  map_facts_branch
    mapNode_372074_001120
    mapNode_373194_001121
    1120 1121 114487
    mapNode_372074_001120_facts
    mapNode_373194_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_374315_facts :
    MapFacts mapChunk_374315 560 114487 :=
  checkMap_sound mapChunk_374315 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_374875_facts :
    MapFacts mapChunk_374875 561 114487 :=
  checkMap_sound mapChunk_374875 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_374315_001121_facts :
    MapFacts mapNode_374315_001121 1121 114487 :=
  map_facts_branch
    mapChunk_374315
    mapChunk_374875
    560 561 114487
    mapChunk_374315_facts
    mapChunk_374875_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_375436_facts :
    MapFacts mapChunk_375436 560 114487 :=
  checkMap_sound mapChunk_375436 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_375996_facts :
    MapFacts mapChunk_375996 561 114487 :=
  checkMap_sound mapChunk_375996 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t672\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_375436_001121_facts :
    MapFacts mapNode_375436_001121 1121 114487 :=
  map_facts_branch
    mapChunk_375436
    mapChunk_375996
    560 561 114487
    mapChunk_375436_facts
    mapChunk_375996_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_374315_002242_facts :
    MapFacts mapNode_374315_002242 2242 114487 :=
  map_facts_branch
    mapNode_374315_001121
    mapNode_375436_001121
    1121 1121 114487
    mapNode_374315_001121_facts
    mapNode_375436_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_372074_004483_facts :
    MapFacts mapNode_372074_004483 4483 114487 :=
  map_facts_branch
    mapNode_372074_002241
    mapNode_374315_002242
    2241 2242 114487
    mapNode_372074_002241_facts
    mapNode_374315_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_367591_008966_facts :
    MapFacts mapNode_367591_008966 8966 114487 :=
  map_facts_branch
    mapNode_367591_004483
    mapNode_372074_004483
    4483 4483 114487
    mapNode_367591_004483_facts
    mapNode_372074_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_358626_017931_facts :
    MapFacts mapNode_358626_017931 17931 114487 :=
  map_facts_branch
    mapNode_358626_008965
    mapNode_367591_008966
    8965 8966 114487
    mapNode_358626_008965_facts
    mapNode_367591_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_376557_facts :
    MapFacts mapChunk_376557 560 114487 :=
  checkMap_sound mapChunk_376557 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_377117_facts :
    MapFacts mapChunk_377117 560 114487 :=
  checkMap_sound mapChunk_377117 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_376557_001120_facts :
    MapFacts mapNode_376557_001120 1120 114487 :=
  map_facts_branch
    mapChunk_376557
    mapChunk_377117
    560 560 114487
    mapChunk_376557_facts
    mapChunk_377117_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_377677_facts :
    MapFacts mapChunk_377677 560 114487 :=
  checkMap_sound mapChunk_377677 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_378237_facts :
    MapFacts mapChunk_378237 561 114487 :=
  checkMap_sound mapChunk_378237 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_377677_001121_facts :
    MapFacts mapNode_377677_001121 1121 114487 :=
  map_facts_branch
    mapChunk_377677
    mapChunk_378237
    560 561 114487
    mapChunk_377677_facts
    mapChunk_378237_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_376557_002241_facts :
    MapFacts mapNode_376557_002241 2241 114487 :=
  map_facts_branch
    mapNode_376557_001120
    mapNode_377677_001121
    1120 1121 114487
    mapNode_376557_001120_facts
    mapNode_377677_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_378798_facts :
    MapFacts mapChunk_378798 560 114487 :=
  checkMap_sound mapChunk_378798 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_379358_facts :
    MapFacts mapChunk_379358 560 114487 :=
  checkMap_sound mapChunk_379358 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_378798_001120_facts :
    MapFacts mapNode_378798_001120 1120 114487 :=
  map_facts_branch
    mapChunk_378798
    mapChunk_379358
    560 560 114487
    mapChunk_378798_facts
    mapChunk_379358_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_379918_facts :
    MapFacts mapChunk_379918 560 114487 :=
  checkMap_sound mapChunk_379918 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_380478_facts :
    MapFacts mapChunk_380478 561 114487 :=
  checkMap_sound mapChunk_380478 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_379918_001121_facts :
    MapFacts mapNode_379918_001121 1121 114487 :=
  map_facts_branch
    mapChunk_379918
    mapChunk_380478
    560 561 114487
    mapChunk_379918_facts
    mapChunk_380478_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_378798_002241_facts :
    MapFacts mapNode_378798_002241 2241 114487 :=
  map_facts_branch
    mapNode_378798_001120
    mapNode_379918_001121
    1120 1121 114487
    mapNode_378798_001120_facts
    mapNode_379918_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_376557_004482_facts :
    MapFacts mapNode_376557_004482 4482 114487 :=
  map_facts_branch
    mapNode_376557_002241
    mapNode_378798_002241
    2241 2241 114487
    mapNode_376557_002241_facts
    mapNode_378798_002241_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_381039_facts :
    MapFacts mapChunk_381039 560 114487 :=
  checkMap_sound mapChunk_381039 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_381599_facts :
    MapFacts mapChunk_381599 560 114487 :=
  checkMap_sound mapChunk_381599 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_381039_001120_facts :
    MapFacts mapNode_381039_001120 1120 114487 :=
  map_facts_branch
    mapChunk_381039
    mapChunk_381599
    560 560 114487
    mapChunk_381039_facts
    mapChunk_381599_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_382159_facts :
    MapFacts mapChunk_382159 560 114487 :=
  checkMap_sound mapChunk_382159 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_382719_facts :
    MapFacts mapChunk_382719 561 114487 :=
  checkMap_sound mapChunk_382719 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_382159_001121_facts :
    MapFacts mapNode_382159_001121 1121 114487 :=
  map_facts_branch
    mapChunk_382159
    mapChunk_382719
    560 561 114487
    mapChunk_382159_facts
    mapChunk_382719_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_381039_002241_facts :
    MapFacts mapNode_381039_002241 2241 114487 :=
  map_facts_branch
    mapNode_381039_001120
    mapNode_382159_001121
    1120 1121 114487
    mapNode_381039_001120_facts
    mapNode_382159_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_383280_facts :
    MapFacts mapChunk_383280 560 114487 :=
  checkMap_sound mapChunk_383280 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_383840_facts :
    MapFacts mapChunk_383840 561 114487 :=
  checkMap_sound mapChunk_383840 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_383280_001121_facts :
    MapFacts mapNode_383280_001121 1121 114487 :=
  map_facts_branch
    mapChunk_383280
    mapChunk_383840
    560 561 114487
    mapChunk_383280_facts
    mapChunk_383840_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_384401_facts :
    MapFacts mapChunk_384401 560 114487 :=
  checkMap_sound mapChunk_384401 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_384961_facts :
    MapFacts mapChunk_384961 561 114487 :=
  checkMap_sound mapChunk_384961 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_384401_001121_facts :
    MapFacts mapNode_384401_001121 1121 114487 :=
  map_facts_branch
    mapChunk_384401
    mapChunk_384961
    560 561 114487
    mapChunk_384401_facts
    mapChunk_384961_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_383280_002242_facts :
    MapFacts mapNode_383280_002242 2242 114487 :=
  map_facts_branch
    mapNode_383280_001121
    mapNode_384401_001121
    1121 1121 114487
    mapNode_383280_001121_facts
    mapNode_384401_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_381039_004483_facts :
    MapFacts mapNode_381039_004483 4483 114487 :=
  map_facts_branch
    mapNode_381039_002241
    mapNode_383280_002242
    2241 2242 114487
    mapNode_381039_002241_facts
    mapNode_383280_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_376557_008965_facts :
    MapFacts mapNode_376557_008965 8965 114487 :=
  map_facts_branch
    mapNode_376557_004482
    mapNode_381039_004483
    4482 4483 114487
    mapNode_376557_004482_facts
    mapNode_381039_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_385522_facts :
    MapFacts mapChunk_385522 560 114487 :=
  checkMap_sound mapChunk_385522 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_386082_facts :
    MapFacts mapChunk_386082 560 114487 :=
  checkMap_sound mapChunk_386082 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_385522_001120_facts :
    MapFacts mapNode_385522_001120 1120 114487 :=
  map_facts_branch
    mapChunk_385522
    mapChunk_386082
    560 560 114487
    mapChunk_385522_facts
    mapChunk_386082_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_386642_facts :
    MapFacts mapChunk_386642 560 114487 :=
  checkMap_sound mapChunk_386642 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_387202_facts :
    MapFacts mapChunk_387202 561 114487 :=
  checkMap_sound mapChunk_387202 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_386642_001121_facts :
    MapFacts mapNode_386642_001121 1121 114487 :=
  map_facts_branch
    mapChunk_386642
    mapChunk_387202
    560 561 114487
    mapChunk_386642_facts
    mapChunk_387202_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_385522_002241_facts :
    MapFacts mapNode_385522_002241 2241 114487 :=
  map_facts_branch
    mapNode_385522_001120
    mapNode_386642_001121
    1120 1121 114487
    mapNode_385522_001120_facts
    mapNode_386642_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_387763_facts :
    MapFacts mapChunk_387763 560 114487 :=
  checkMap_sound mapChunk_387763 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_388323_facts :
    MapFacts mapChunk_388323 561 114487 :=
  checkMap_sound mapChunk_388323 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_387763_001121_facts :
    MapFacts mapNode_387763_001121 1121 114487 :=
  map_facts_branch
    mapChunk_387763
    mapChunk_388323
    560 561 114487
    mapChunk_387763_facts
    mapChunk_388323_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_388884_facts :
    MapFacts mapChunk_388884 560 114487 :=
  checkMap_sound mapChunk_388884 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_389444_facts :
    MapFacts mapChunk_389444 561 114487 :=
  checkMap_sound mapChunk_389444 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_388884_001121_facts :
    MapFacts mapNode_388884_001121 1121 114487 :=
  map_facts_branch
    mapChunk_388884
    mapChunk_389444
    560 561 114487
    mapChunk_388884_facts
    mapChunk_389444_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_387763_002242_facts :
    MapFacts mapNode_387763_002242 2242 114487 :=
  map_facts_branch
    mapNode_387763_001121
    mapNode_388884_001121
    1121 1121 114487
    mapNode_387763_001121_facts
    mapNode_388884_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_385522_004483_facts :
    MapFacts mapNode_385522_004483 4483 114487 :=
  map_facts_branch
    mapNode_385522_002241
    mapNode_387763_002242
    2241 2242 114487
    mapNode_385522_002241_facts
    mapNode_387763_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_390005_facts :
    MapFacts mapChunk_390005 560 114487 :=
  checkMap_sound mapChunk_390005 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_390565_facts :
    MapFacts mapChunk_390565 560 114487 :=
  checkMap_sound mapChunk_390565 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_390005_001120_facts :
    MapFacts mapNode_390005_001120 1120 114487 :=
  map_facts_branch
    mapChunk_390005
    mapChunk_390565
    560 560 114487
    mapChunk_390005_facts
    mapChunk_390565_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_391125_facts :
    MapFacts mapChunk_391125 560 114487 :=
  checkMap_sound mapChunk_391125 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_391685_facts :
    MapFacts mapChunk_391685 561 114487 :=
  checkMap_sound mapChunk_391685 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_391125_001121_facts :
    MapFacts mapNode_391125_001121 1121 114487 :=
  map_facts_branch
    mapChunk_391125
    mapChunk_391685
    560 561 114487
    mapChunk_391125_facts
    mapChunk_391685_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_390005_002241_facts :
    MapFacts mapNode_390005_002241 2241 114487 :=
  map_facts_branch
    mapNode_390005_001120
    mapNode_391125_001121
    1120 1121 114487
    mapNode_390005_001120_facts
    mapNode_391125_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_392246_facts :
    MapFacts mapChunk_392246 560 114487 :=
  checkMap_sound mapChunk_392246 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_392806_facts :
    MapFacts mapChunk_392806 561 114487 :=
  checkMap_sound mapChunk_392806 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_392246_001121_facts :
    MapFacts mapNode_392246_001121 1121 114487 :=
  map_facts_branch
    mapChunk_392246
    mapChunk_392806
    560 561 114487
    mapChunk_392246_facts
    mapChunk_392806_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_393367_facts :
    MapFacts mapChunk_393367 560 114487 :=
  checkMap_sound mapChunk_393367 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_393927_facts :
    MapFacts mapChunk_393927 561 114487 :=
  checkMap_sound mapChunk_393927 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t704\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_393367_001121_facts :
    MapFacts mapNode_393367_001121 1121 114487 :=
  map_facts_branch
    mapChunk_393367
    mapChunk_393927
    560 561 114487
    mapChunk_393367_facts
    mapChunk_393927_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_392246_002242_facts :
    MapFacts mapNode_392246_002242 2242 114487 :=
  map_facts_branch
    mapNode_392246_001121
    mapNode_393367_001121
    1121 1121 114487
    mapNode_392246_001121_facts
    mapNode_393367_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_390005_004483_facts :
    MapFacts mapNode_390005_004483 4483 114487 :=
  map_facts_branch
    mapNode_390005_002241
    mapNode_392246_002242
    2241 2242 114487
    mapNode_390005_002241_facts
    mapNode_392246_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_385522_008966_facts :
    MapFacts mapNode_385522_008966 8966 114487 :=
  map_facts_branch
    mapNode_385522_004483
    mapNode_390005_004483
    4483 4483 114487
    mapNode_385522_004483_facts
    mapNode_390005_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_376557_017931_facts :
    MapFacts mapNode_376557_017931 17931 114487 :=
  map_facts_branch
    mapNode_376557_008965
    mapNode_385522_008966
    8965 8966 114487
    mapNode_376557_008965_facts
    mapNode_385522_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_358626_035862_facts :
    MapFacts mapNode_358626_035862 35862 114487 :=
  map_facts_branch
    mapNode_358626_017931
    mapNode_376557_017931
    17931 17931 114487
    mapNode_358626_017931_facts
    mapNode_376557_017931_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_394488_facts :
    MapFacts mapChunk_394488 560 114487 :=
  checkMap_sound mapChunk_394488 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_395048_facts :
    MapFacts mapChunk_395048 560 114487 :=
  checkMap_sound mapChunk_395048 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_394488_001120_facts :
    MapFacts mapNode_394488_001120 1120 114487 :=
  map_facts_branch
    mapChunk_394488
    mapChunk_395048
    560 560 114487
    mapChunk_394488_facts
    mapChunk_395048_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_395608_facts :
    MapFacts mapChunk_395608 560 114487 :=
  checkMap_sound mapChunk_395608 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_396168_facts :
    MapFacts mapChunk_396168 561 114487 :=
  checkMap_sound mapChunk_396168 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_395608_001121_facts :
    MapFacts mapNode_395608_001121 1121 114487 :=
  map_facts_branch
    mapChunk_395608
    mapChunk_396168
    560 561 114487
    mapChunk_395608_facts
    mapChunk_396168_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_394488_002241_facts :
    MapFacts mapNode_394488_002241 2241 114487 :=
  map_facts_branch
    mapNode_394488_001120
    mapNode_395608_001121
    1120 1121 114487
    mapNode_394488_001120_facts
    mapNode_395608_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_396729_facts :
    MapFacts mapChunk_396729 560 114487 :=
  checkMap_sound mapChunk_396729 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_397289_facts :
    MapFacts mapChunk_397289 560 114487 :=
  checkMap_sound mapChunk_397289 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_396729_001120_facts :
    MapFacts mapNode_396729_001120 1120 114487 :=
  map_facts_branch
    mapChunk_396729
    mapChunk_397289
    560 560 114487
    mapChunk_396729_facts
    mapChunk_397289_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_397849_facts :
    MapFacts mapChunk_397849 560 114487 :=
  checkMap_sound mapChunk_397849 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_398409_facts :
    MapFacts mapChunk_398409 561 114487 :=
  checkMap_sound mapChunk_398409 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_397849_001121_facts :
    MapFacts mapNode_397849_001121 1121 114487 :=
  map_facts_branch
    mapChunk_397849
    mapChunk_398409
    560 561 114487
    mapChunk_397849_facts
    mapChunk_398409_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_396729_002241_facts :
    MapFacts mapNode_396729_002241 2241 114487 :=
  map_facts_branch
    mapNode_396729_001120
    mapNode_397849_001121
    1120 1121 114487
    mapNode_396729_001120_facts
    mapNode_397849_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_394488_004482_facts :
    MapFacts mapNode_394488_004482 4482 114487 :=
  map_facts_branch
    mapNode_394488_002241
    mapNode_396729_002241
    2241 2241 114487
    mapNode_394488_002241_facts
    mapNode_396729_002241_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_398970_facts :
    MapFacts mapChunk_398970 560 114487 :=
  checkMap_sound mapChunk_398970 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_399530_facts :
    MapFacts mapChunk_399530 560 114487 :=
  checkMap_sound mapChunk_399530 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_398970_001120_facts :
    MapFacts mapNode_398970_001120 1120 114487 :=
  map_facts_branch
    mapChunk_398970
    mapChunk_399530
    560 560 114487
    mapChunk_398970_facts
    mapChunk_399530_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_400090_facts :
    MapFacts mapChunk_400090 560 114487 :=
  checkMap_sound mapChunk_400090 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_400650_facts :
    MapFacts mapChunk_400650 561 114487 :=
  checkMap_sound mapChunk_400650 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_400090_001121_facts :
    MapFacts mapNode_400090_001121 1121 114487 :=
  map_facts_branch
    mapChunk_400090
    mapChunk_400650
    560 561 114487
    mapChunk_400090_facts
    mapChunk_400650_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_398970_002241_facts :
    MapFacts mapNode_398970_002241 2241 114487 :=
  map_facts_branch
    mapNode_398970_001120
    mapNode_400090_001121
    1120 1121 114487
    mapNode_398970_001120_facts
    mapNode_400090_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_401211_facts :
    MapFacts mapChunk_401211 560 114487 :=
  checkMap_sound mapChunk_401211 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_401771_facts :
    MapFacts mapChunk_401771 561 114487 :=
  checkMap_sound mapChunk_401771 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_401211_001121_facts :
    MapFacts mapNode_401211_001121 1121 114487 :=
  map_facts_branch
    mapChunk_401211
    mapChunk_401771
    560 561 114487
    mapChunk_401211_facts
    mapChunk_401771_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_402332_facts :
    MapFacts mapChunk_402332 560 114487 :=
  checkMap_sound mapChunk_402332 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_402892_facts :
    MapFacts mapChunk_402892 561 114487 :=
  checkMap_sound mapChunk_402892 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_402332_001121_facts :
    MapFacts mapNode_402332_001121 1121 114487 :=
  map_facts_branch
    mapChunk_402332
    mapChunk_402892
    560 561 114487
    mapChunk_402332_facts
    mapChunk_402892_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_401211_002242_facts :
    MapFacts mapNode_401211_002242 2242 114487 :=
  map_facts_branch
    mapNode_401211_001121
    mapNode_402332_001121
    1121 1121 114487
    mapNode_401211_001121_facts
    mapNode_402332_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_398970_004483_facts :
    MapFacts mapNode_398970_004483 4483 114487 :=
  map_facts_branch
    mapNode_398970_002241
    mapNode_401211_002242
    2241 2242 114487
    mapNode_398970_002241_facts
    mapNode_401211_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_394488_008965_facts :
    MapFacts mapNode_394488_008965 8965 114487 :=
  map_facts_branch
    mapNode_394488_004482
    mapNode_398970_004483
    4482 4483 114487
    mapNode_394488_004482_facts
    mapNode_398970_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_403453_facts :
    MapFacts mapChunk_403453 560 114487 :=
  checkMap_sound mapChunk_403453 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_404013_facts :
    MapFacts mapChunk_404013 560 114487 :=
  checkMap_sound mapChunk_404013 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_403453_001120_facts :
    MapFacts mapNode_403453_001120 1120 114487 :=
  map_facts_branch
    mapChunk_403453
    mapChunk_404013
    560 560 114487
    mapChunk_403453_facts
    mapChunk_404013_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_404573_facts :
    MapFacts mapChunk_404573 560 114487 :=
  checkMap_sound mapChunk_404573 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_405133_facts :
    MapFacts mapChunk_405133 561 114487 :=
  checkMap_sound mapChunk_405133 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_404573_001121_facts :
    MapFacts mapNode_404573_001121 1121 114487 :=
  map_facts_branch
    mapChunk_404573
    mapChunk_405133
    560 561 114487
    mapChunk_404573_facts
    mapChunk_405133_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_403453_002241_facts :
    MapFacts mapNode_403453_002241 2241 114487 :=
  map_facts_branch
    mapNode_403453_001120
    mapNode_404573_001121
    1120 1121 114487
    mapNode_403453_001120_facts
    mapNode_404573_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_405694_facts :
    MapFacts mapChunk_405694 560 114487 :=
  checkMap_sound mapChunk_405694 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_406254_facts :
    MapFacts mapChunk_406254 561 114487 :=
  checkMap_sound mapChunk_406254 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_405694_001121_facts :
    MapFacts mapNode_405694_001121 1121 114487 :=
  map_facts_branch
    mapChunk_405694
    mapChunk_406254
    560 561 114487
    mapChunk_405694_facts
    mapChunk_406254_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_406815_facts :
    MapFacts mapChunk_406815 560 114487 :=
  checkMap_sound mapChunk_406815 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_407375_facts :
    MapFacts mapChunk_407375 561 114487 :=
  checkMap_sound mapChunk_407375 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_406815_001121_facts :
    MapFacts mapNode_406815_001121 1121 114487 :=
  map_facts_branch
    mapChunk_406815
    mapChunk_407375
    560 561 114487
    mapChunk_406815_facts
    mapChunk_407375_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_405694_002242_facts :
    MapFacts mapNode_405694_002242 2242 114487 :=
  map_facts_branch
    mapNode_405694_001121
    mapNode_406815_001121
    1121 1121 114487
    mapNode_405694_001121_facts
    mapNode_406815_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_403453_004483_facts :
    MapFacts mapNode_403453_004483 4483 114487 :=
  map_facts_branch
    mapNode_403453_002241
    mapNode_405694_002242
    2241 2242 114487
    mapNode_403453_002241_facts
    mapNode_405694_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_407936_facts :
    MapFacts mapChunk_407936 560 114487 :=
  checkMap_sound mapChunk_407936 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_408496_facts :
    MapFacts mapChunk_408496 560 114487 :=
  checkMap_sound mapChunk_408496 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_407936_001120_facts :
    MapFacts mapNode_407936_001120 1120 114487 :=
  map_facts_branch
    mapChunk_407936
    mapChunk_408496
    560 560 114487
    mapChunk_407936_facts
    mapChunk_408496_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_409056_facts :
    MapFacts mapChunk_409056 560 114487 :=
  checkMap_sound mapChunk_409056 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_409616_facts :
    MapFacts mapChunk_409616 561 114487 :=
  checkMap_sound mapChunk_409616 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_409056_001121_facts :
    MapFacts mapNode_409056_001121 1121 114487 :=
  map_facts_branch
    mapChunk_409056
    mapChunk_409616
    560 561 114487
    mapChunk_409056_facts
    mapChunk_409616_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_407936_002241_facts :
    MapFacts mapNode_407936_002241 2241 114487 :=
  map_facts_branch
    mapNode_407936_001120
    mapNode_409056_001121
    1120 1121 114487
    mapNode_407936_001120_facts
    mapNode_409056_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_410177_facts :
    MapFacts mapChunk_410177 560 114487 :=
  checkMap_sound mapChunk_410177 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_410737_facts :
    MapFacts mapChunk_410737 561 114487 :=
  checkMap_sound mapChunk_410737 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_410177_001121_facts :
    MapFacts mapNode_410177_001121 1121 114487 :=
  map_facts_branch
    mapChunk_410177
    mapChunk_410737
    560 561 114487
    mapChunk_410177_facts
    mapChunk_410737_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_411298_facts :
    MapFacts mapChunk_411298 560 114487 :=
  checkMap_sound mapChunk_411298 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_411858_facts :
    MapFacts mapChunk_411858 561 114487 :=
  checkMap_sound mapChunk_411858 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t736\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_411298_001121_facts :
    MapFacts mapNode_411298_001121 1121 114487 :=
  map_facts_branch
    mapChunk_411298
    mapChunk_411858
    560 561 114487
    mapChunk_411298_facts
    mapChunk_411858_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_410177_002242_facts :
    MapFacts mapNode_410177_002242 2242 114487 :=
  map_facts_branch
    mapNode_410177_001121
    mapNode_411298_001121
    1121 1121 114487
    mapNode_410177_001121_facts
    mapNode_411298_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_407936_004483_facts :
    MapFacts mapNode_407936_004483 4483 114487 :=
  map_facts_branch
    mapNode_407936_002241
    mapNode_410177_002242
    2241 2242 114487
    mapNode_407936_002241_facts
    mapNode_410177_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_403453_008966_facts :
    MapFacts mapNode_403453_008966 8966 114487 :=
  map_facts_branch
    mapNode_403453_004483
    mapNode_407936_004483
    4483 4483 114487
    mapNode_403453_004483_facts
    mapNode_407936_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_394488_017931_facts :
    MapFacts mapNode_394488_017931 17931 114487 :=
  map_facts_branch
    mapNode_394488_008965
    mapNode_403453_008966
    8965 8966 114487
    mapNode_394488_008965_facts
    mapNode_403453_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_412419_facts :
    MapFacts mapChunk_412419 560 114487 :=
  checkMap_sound mapChunk_412419 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_412979_facts :
    MapFacts mapChunk_412979 560 114487 :=
  checkMap_sound mapChunk_412979 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_412419_001120_facts :
    MapFacts mapNode_412419_001120 1120 114487 :=
  map_facts_branch
    mapChunk_412419
    mapChunk_412979
    560 560 114487
    mapChunk_412419_facts
    mapChunk_412979_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_413539_facts :
    MapFacts mapChunk_413539 560 114487 :=
  checkMap_sound mapChunk_413539 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_414099_facts :
    MapFacts mapChunk_414099 561 114487 :=
  checkMap_sound mapChunk_414099 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_413539_001121_facts :
    MapFacts mapNode_413539_001121 1121 114487 :=
  map_facts_branch
    mapChunk_413539
    mapChunk_414099
    560 561 114487
    mapChunk_413539_facts
    mapChunk_414099_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_412419_002241_facts :
    MapFacts mapNode_412419_002241 2241 114487 :=
  map_facts_branch
    mapNode_412419_001120
    mapNode_413539_001121
    1120 1121 114487
    mapNode_412419_001120_facts
    mapNode_413539_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_414660_facts :
    MapFacts mapChunk_414660 560 114487 :=
  checkMap_sound mapChunk_414660 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_415220_facts :
    MapFacts mapChunk_415220 561 114487 :=
  checkMap_sound mapChunk_415220 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_414660_001121_facts :
    MapFacts mapNode_414660_001121 1121 114487 :=
  map_facts_branch
    mapChunk_414660
    mapChunk_415220
    560 561 114487
    mapChunk_414660_facts
    mapChunk_415220_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_415781_facts :
    MapFacts mapChunk_415781 560 114487 :=
  checkMap_sound mapChunk_415781 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_416341_facts :
    MapFacts mapChunk_416341 561 114487 :=
  checkMap_sound mapChunk_416341 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_415781_001121_facts :
    MapFacts mapNode_415781_001121 1121 114487 :=
  map_facts_branch
    mapChunk_415781
    mapChunk_416341
    560 561 114487
    mapChunk_415781_facts
    mapChunk_416341_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_414660_002242_facts :
    MapFacts mapNode_414660_002242 2242 114487 :=
  map_facts_branch
    mapNode_414660_001121
    mapNode_415781_001121
    1121 1121 114487
    mapNode_414660_001121_facts
    mapNode_415781_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_412419_004483_facts :
    MapFacts mapNode_412419_004483 4483 114487 :=
  map_facts_branch
    mapNode_412419_002241
    mapNode_414660_002242
    2241 2242 114487
    mapNode_412419_002241_facts
    mapNode_414660_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_416902_facts :
    MapFacts mapChunk_416902 560 114487 :=
  checkMap_sound mapChunk_416902 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_417462_facts :
    MapFacts mapChunk_417462 560 114487 :=
  checkMap_sound mapChunk_417462 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_416902_001120_facts :
    MapFacts mapNode_416902_001120 1120 114487 :=
  map_facts_branch
    mapChunk_416902
    mapChunk_417462
    560 560 114487
    mapChunk_416902_facts
    mapChunk_417462_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_418022_facts :
    MapFacts mapChunk_418022 560 114487 :=
  checkMap_sound mapChunk_418022 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_418582_facts :
    MapFacts mapChunk_418582 561 114487 :=
  checkMap_sound mapChunk_418582 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_418022_001121_facts :
    MapFacts mapNode_418022_001121 1121 114487 :=
  map_facts_branch
    mapChunk_418022
    mapChunk_418582
    560 561 114487
    mapChunk_418022_facts
    mapChunk_418582_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_416902_002241_facts :
    MapFacts mapNode_416902_002241 2241 114487 :=
  map_facts_branch
    mapNode_416902_001120
    mapNode_418022_001121
    1120 1121 114487
    mapNode_416902_001120_facts
    mapNode_418022_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_419143_facts :
    MapFacts mapChunk_419143 560 114487 :=
  checkMap_sound mapChunk_419143 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_419703_facts :
    MapFacts mapChunk_419703 561 114487 :=
  checkMap_sound mapChunk_419703 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_419143_001121_facts :
    MapFacts mapNode_419143_001121 1121 114487 :=
  map_facts_branch
    mapChunk_419143
    mapChunk_419703
    560 561 114487
    mapChunk_419143_facts
    mapChunk_419703_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_420264_facts :
    MapFacts mapChunk_420264 560 114487 :=
  checkMap_sound mapChunk_420264 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_420824_facts :
    MapFacts mapChunk_420824 561 114487 :=
  checkMap_sound mapChunk_420824 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_420264_001121_facts :
    MapFacts mapNode_420264_001121 1121 114487 :=
  map_facts_branch
    mapChunk_420264
    mapChunk_420824
    560 561 114487
    mapChunk_420264_facts
    mapChunk_420824_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_419143_002242_facts :
    MapFacts mapNode_419143_002242 2242 114487 :=
  map_facts_branch
    mapNode_419143_001121
    mapNode_420264_001121
    1121 1121 114487
    mapNode_419143_001121_facts
    mapNode_420264_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_416902_004483_facts :
    MapFacts mapNode_416902_004483 4483 114487 :=
  map_facts_branch
    mapNode_416902_002241
    mapNode_419143_002242
    2241 2242 114487
    mapNode_416902_002241_facts
    mapNode_419143_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_412419_008966_facts :
    MapFacts mapNode_412419_008966 8966 114487 :=
  map_facts_branch
    mapNode_412419_004483
    mapNode_416902_004483
    4483 4483 114487
    mapNode_412419_004483_facts
    mapNode_416902_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_421385_facts :
    MapFacts mapChunk_421385 560 114487 :=
  checkMap_sound mapChunk_421385 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_421945_facts :
    MapFacts mapChunk_421945 560 114487 :=
  checkMap_sound mapChunk_421945 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_421385_001120_facts :
    MapFacts mapNode_421385_001120 1120 114487 :=
  map_facts_branch
    mapChunk_421385
    mapChunk_421945
    560 560 114487
    mapChunk_421385_facts
    mapChunk_421945_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_422505_facts :
    MapFacts mapChunk_422505 560 114487 :=
  checkMap_sound mapChunk_422505 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_423065_facts :
    MapFacts mapChunk_423065 561 114487 :=
  checkMap_sound mapChunk_423065 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_422505_001121_facts :
    MapFacts mapNode_422505_001121 1121 114487 :=
  map_facts_branch
    mapChunk_422505
    mapChunk_423065
    560 561 114487
    mapChunk_422505_facts
    mapChunk_423065_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_421385_002241_facts :
    MapFacts mapNode_421385_002241 2241 114487 :=
  map_facts_branch
    mapNode_421385_001120
    mapNode_422505_001121
    1120 1121 114487
    mapNode_421385_001120_facts
    mapNode_422505_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_423626_facts :
    MapFacts mapChunk_423626 560 114487 :=
  checkMap_sound mapChunk_423626 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_424186_facts :
    MapFacts mapChunk_424186 561 114487 :=
  checkMap_sound mapChunk_424186 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_423626_001121_facts :
    MapFacts mapNode_423626_001121 1121 114487 :=
  map_facts_branch
    mapChunk_423626
    mapChunk_424186
    560 561 114487
    mapChunk_423626_facts
    mapChunk_424186_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_424747_facts :
    MapFacts mapChunk_424747 560 114487 :=
  checkMap_sound mapChunk_424747 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_425307_facts :
    MapFacts mapChunk_425307 561 114487 :=
  checkMap_sound mapChunk_425307 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_424747_001121_facts :
    MapFacts mapNode_424747_001121 1121 114487 :=
  map_facts_branch
    mapChunk_424747
    mapChunk_425307
    560 561 114487
    mapChunk_424747_facts
    mapChunk_425307_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_423626_002242_facts :
    MapFacts mapNode_423626_002242 2242 114487 :=
  map_facts_branch
    mapNode_423626_001121
    mapNode_424747_001121
    1121 1121 114487
    mapNode_423626_001121_facts
    mapNode_424747_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_421385_004483_facts :
    MapFacts mapNode_421385_004483 4483 114487 :=
  map_facts_branch
    mapNode_421385_002241
    mapNode_423626_002242
    2241 2242 114487
    mapNode_421385_002241_facts
    mapNode_423626_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_425868_facts :
    MapFacts mapChunk_425868 560 114487 :=
  checkMap_sound mapChunk_425868 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_426428_facts :
    MapFacts mapChunk_426428 560 114487 :=
  checkMap_sound mapChunk_426428 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_425868_001120_facts :
    MapFacts mapNode_425868_001120 1120 114487 :=
  map_facts_branch
    mapChunk_425868
    mapChunk_426428
    560 560 114487
    mapChunk_425868_facts
    mapChunk_426428_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_426988_facts :
    MapFacts mapChunk_426988 560 114487 :=
  checkMap_sound mapChunk_426988 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_427548_facts :
    MapFacts mapChunk_427548 561 114487 :=
  checkMap_sound mapChunk_427548 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_426988_001121_facts :
    MapFacts mapNode_426988_001121 1121 114487 :=
  map_facts_branch
    mapChunk_426988
    mapChunk_427548
    560 561 114487
    mapChunk_426988_facts
    mapChunk_427548_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_425868_002241_facts :
    MapFacts mapNode_425868_002241 2241 114487 :=
  map_facts_branch
    mapNode_425868_001120
    mapNode_426988_001121
    1120 1121 114487
    mapNode_425868_001120_facts
    mapNode_426988_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_428109_facts :
    MapFacts mapChunk_428109 560 114487 :=
  checkMap_sound mapChunk_428109 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_428669_facts :
    MapFacts mapChunk_428669 561 114487 :=
  checkMap_sound mapChunk_428669 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_428109_001121_facts :
    MapFacts mapNode_428109_001121 1121 114487 :=
  map_facts_branch
    mapChunk_428109
    mapChunk_428669
    560 561 114487
    mapChunk_428109_facts
    mapChunk_428669_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_429230_facts :
    MapFacts mapChunk_429230 560 114487 :=
  checkMap_sound mapChunk_429230 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_429790_facts :
    MapFacts mapChunk_429790 561 114487 :=
  checkMap_sound mapChunk_429790 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t768\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_429230_001121_facts :
    MapFacts mapNode_429230_001121 1121 114487 :=
  map_facts_branch
    mapChunk_429230
    mapChunk_429790
    560 561 114487
    mapChunk_429230_facts
    mapChunk_429790_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_428109_002242_facts :
    MapFacts mapNode_428109_002242 2242 114487 :=
  map_facts_branch
    mapNode_428109_001121
    mapNode_429230_001121
    1121 1121 114487
    mapNode_428109_001121_facts
    mapNode_429230_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_425868_004483_facts :
    MapFacts mapNode_425868_004483 4483 114487 :=
  map_facts_branch
    mapNode_425868_002241
    mapNode_428109_002242
    2241 2242 114487
    mapNode_425868_002241_facts
    mapNode_428109_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_421385_008966_facts :
    MapFacts mapNode_421385_008966 8966 114487 :=
  map_facts_branch
    mapNode_421385_004483
    mapNode_425868_004483
    4483 4483 114487
    mapNode_421385_004483_facts
    mapNode_425868_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_412419_017932_facts :
    MapFacts mapNode_412419_017932 17932 114487 :=
  map_facts_branch
    mapNode_412419_008966
    mapNode_421385_008966
    8966 8966 114487
    mapNode_412419_008966_facts
    mapNode_421385_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_394488_035863_facts :
    MapFacts mapNode_394488_035863 35863 114487 :=
  map_facts_branch
    mapNode_394488_017931
    mapNode_412419_017932
    17931 17932 114487
    mapNode_394488_017931_facts
    mapNode_412419_017932_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_358626_071725_facts :
    MapFacts mapNode_358626_071725 71725 114487 :=
  map_facts_branch
    mapNode_358626_035862
    mapNode_394488_035863
    35862 35863 114487
    mapNode_358626_035862_facts
    mapNode_394488_035863_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_286901_143450_facts :
    MapFacts mapNode_286901_143450 143450 114487 :=
  map_facts_branch
    mapNode_286901_071725
    mapNode_358626_071725
    71725 71725 114487
    mapNode_286901_071725_facts
    mapNode_358626_071725_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_430351_facts :
    MapFacts mapChunk_430351 560 114487 :=
  checkMap_sound mapChunk_430351 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_430911_facts :
    MapFacts mapChunk_430911 560 114487 :=
  checkMap_sound mapChunk_430911 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_430351_001120_facts :
    MapFacts mapNode_430351_001120 1120 114487 :=
  map_facts_branch
    mapChunk_430351
    mapChunk_430911
    560 560 114487
    mapChunk_430351_facts
    mapChunk_430911_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_431471_facts :
    MapFacts mapChunk_431471 560 114487 :=
  checkMap_sound mapChunk_431471 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_432031_facts :
    MapFacts mapChunk_432031 561 114487 :=
  checkMap_sound mapChunk_432031 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_431471_001121_facts :
    MapFacts mapNode_431471_001121 1121 114487 :=
  map_facts_branch
    mapChunk_431471
    mapChunk_432031
    560 561 114487
    mapChunk_431471_facts
    mapChunk_432031_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_430351_002241_facts :
    MapFacts mapNode_430351_002241 2241 114487 :=
  map_facts_branch
    mapNode_430351_001120
    mapNode_431471_001121
    1120 1121 114487
    mapNode_430351_001120_facts
    mapNode_431471_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_432592_facts :
    MapFacts mapChunk_432592 560 114487 :=
  checkMap_sound mapChunk_432592 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_433152_facts :
    MapFacts mapChunk_433152 560 114487 :=
  checkMap_sound mapChunk_433152 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_432592_001120_facts :
    MapFacts mapNode_432592_001120 1120 114487 :=
  map_facts_branch
    mapChunk_432592
    mapChunk_433152
    560 560 114487
    mapChunk_432592_facts
    mapChunk_433152_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_433712_facts :
    MapFacts mapChunk_433712 560 114487 :=
  checkMap_sound mapChunk_433712 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_434272_facts :
    MapFacts mapChunk_434272 561 114487 :=
  checkMap_sound mapChunk_434272 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_433712_001121_facts :
    MapFacts mapNode_433712_001121 1121 114487 :=
  map_facts_branch
    mapChunk_433712
    mapChunk_434272
    560 561 114487
    mapChunk_433712_facts
    mapChunk_434272_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_432592_002241_facts :
    MapFacts mapNode_432592_002241 2241 114487 :=
  map_facts_branch
    mapNode_432592_001120
    mapNode_433712_001121
    1120 1121 114487
    mapNode_432592_001120_facts
    mapNode_433712_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_430351_004482_facts :
    MapFacts mapNode_430351_004482 4482 114487 :=
  map_facts_branch
    mapNode_430351_002241
    mapNode_432592_002241
    2241 2241 114487
    mapNode_430351_002241_facts
    mapNode_432592_002241_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_434833_facts :
    MapFacts mapChunk_434833 560 114487 :=
  checkMap_sound mapChunk_434833 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_435393_facts :
    MapFacts mapChunk_435393 560 114487 :=
  checkMap_sound mapChunk_435393 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_434833_001120_facts :
    MapFacts mapNode_434833_001120 1120 114487 :=
  map_facts_branch
    mapChunk_434833
    mapChunk_435393
    560 560 114487
    mapChunk_434833_facts
    mapChunk_435393_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_435953_facts :
    MapFacts mapChunk_435953 560 114487 :=
  checkMap_sound mapChunk_435953 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_436513_facts :
    MapFacts mapChunk_436513 561 114487 :=
  checkMap_sound mapChunk_436513 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_435953_001121_facts :
    MapFacts mapNode_435953_001121 1121 114487 :=
  map_facts_branch
    mapChunk_435953
    mapChunk_436513
    560 561 114487
    mapChunk_435953_facts
    mapChunk_436513_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_434833_002241_facts :
    MapFacts mapNode_434833_002241 2241 114487 :=
  map_facts_branch
    mapNode_434833_001120
    mapNode_435953_001121
    1120 1121 114487
    mapNode_434833_001120_facts
    mapNode_435953_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_437074_facts :
    MapFacts mapChunk_437074 560 114487 :=
  checkMap_sound mapChunk_437074 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_437634_facts :
    MapFacts mapChunk_437634 561 114487 :=
  checkMap_sound mapChunk_437634 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_437074_001121_facts :
    MapFacts mapNode_437074_001121 1121 114487 :=
  map_facts_branch
    mapChunk_437074
    mapChunk_437634
    560 561 114487
    mapChunk_437074_facts
    mapChunk_437634_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_438195_facts :
    MapFacts mapChunk_438195 560 114487 :=
  checkMap_sound mapChunk_438195 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_438755_facts :
    MapFacts mapChunk_438755 561 114487 :=
  checkMap_sound mapChunk_438755 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_438195_001121_facts :
    MapFacts mapNode_438195_001121 1121 114487 :=
  map_facts_branch
    mapChunk_438195
    mapChunk_438755
    560 561 114487
    mapChunk_438195_facts
    mapChunk_438755_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_437074_002242_facts :
    MapFacts mapNode_437074_002242 2242 114487 :=
  map_facts_branch
    mapNode_437074_001121
    mapNode_438195_001121
    1121 1121 114487
    mapNode_437074_001121_facts
    mapNode_438195_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_434833_004483_facts :
    MapFacts mapNode_434833_004483 4483 114487 :=
  map_facts_branch
    mapNode_434833_002241
    mapNode_437074_002242
    2241 2242 114487
    mapNode_434833_002241_facts
    mapNode_437074_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_430351_008965_facts :
    MapFacts mapNode_430351_008965 8965 114487 :=
  map_facts_branch
    mapNode_430351_004482
    mapNode_434833_004483
    4482 4483 114487
    mapNode_430351_004482_facts
    mapNode_434833_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_439316_facts :
    MapFacts mapChunk_439316 560 114487 :=
  checkMap_sound mapChunk_439316 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_439876_facts :
    MapFacts mapChunk_439876 560 114487 :=
  checkMap_sound mapChunk_439876 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_439316_001120_facts :
    MapFacts mapNode_439316_001120 1120 114487 :=
  map_facts_branch
    mapChunk_439316
    mapChunk_439876
    560 560 114487
    mapChunk_439316_facts
    mapChunk_439876_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_440436_facts :
    MapFacts mapChunk_440436 560 114487 :=
  checkMap_sound mapChunk_440436 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_440996_facts :
    MapFacts mapChunk_440996 561 114487 :=
  checkMap_sound mapChunk_440996 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_440436_001121_facts :
    MapFacts mapNode_440436_001121 1121 114487 :=
  map_facts_branch
    mapChunk_440436
    mapChunk_440996
    560 561 114487
    mapChunk_440436_facts
    mapChunk_440996_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_439316_002241_facts :
    MapFacts mapNode_439316_002241 2241 114487 :=
  map_facts_branch
    mapNode_439316_001120
    mapNode_440436_001121
    1120 1121 114487
    mapNode_439316_001120_facts
    mapNode_440436_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_441557_facts :
    MapFacts mapChunk_441557 560 114487 :=
  checkMap_sound mapChunk_441557 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_442117_facts :
    MapFacts mapChunk_442117 561 114487 :=
  checkMap_sound mapChunk_442117 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_441557_001121_facts :
    MapFacts mapNode_441557_001121 1121 114487 :=
  map_facts_branch
    mapChunk_441557
    mapChunk_442117
    560 561 114487
    mapChunk_441557_facts
    mapChunk_442117_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_442678_facts :
    MapFacts mapChunk_442678 560 114487 :=
  checkMap_sound mapChunk_442678 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_443238_facts :
    MapFacts mapChunk_443238 561 114487 :=
  checkMap_sound mapChunk_443238 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_442678_001121_facts :
    MapFacts mapNode_442678_001121 1121 114487 :=
  map_facts_branch
    mapChunk_442678
    mapChunk_443238
    560 561 114487
    mapChunk_442678_facts
    mapChunk_443238_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_441557_002242_facts :
    MapFacts mapNode_441557_002242 2242 114487 :=
  map_facts_branch
    mapNode_441557_001121
    mapNode_442678_001121
    1121 1121 114487
    mapNode_441557_001121_facts
    mapNode_442678_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_439316_004483_facts :
    MapFacts mapNode_439316_004483 4483 114487 :=
  map_facts_branch
    mapNode_439316_002241
    mapNode_441557_002242
    2241 2242 114487
    mapNode_439316_002241_facts
    mapNode_441557_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_443799_facts :
    MapFacts mapChunk_443799 560 114487 :=
  checkMap_sound mapChunk_443799 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_444359_facts :
    MapFacts mapChunk_444359 560 114487 :=
  checkMap_sound mapChunk_444359 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_443799_001120_facts :
    MapFacts mapNode_443799_001120 1120 114487 :=
  map_facts_branch
    mapChunk_443799
    mapChunk_444359
    560 560 114487
    mapChunk_443799_facts
    mapChunk_444359_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_444919_facts :
    MapFacts mapChunk_444919 560 114487 :=
  checkMap_sound mapChunk_444919 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_445479_facts :
    MapFacts mapChunk_445479 561 114487 :=
  checkMap_sound mapChunk_445479 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_444919_001121_facts :
    MapFacts mapNode_444919_001121 1121 114487 :=
  map_facts_branch
    mapChunk_444919
    mapChunk_445479
    560 561 114487
    mapChunk_444919_facts
    mapChunk_445479_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_443799_002241_facts :
    MapFacts mapNode_443799_002241 2241 114487 :=
  map_facts_branch
    mapNode_443799_001120
    mapNode_444919_001121
    1120 1121 114487
    mapNode_443799_001120_facts
    mapNode_444919_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_446040_facts :
    MapFacts mapChunk_446040 560 114487 :=
  checkMap_sound mapChunk_446040 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_446600_facts :
    MapFacts mapChunk_446600 561 114487 :=
  checkMap_sound mapChunk_446600 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_446040_001121_facts :
    MapFacts mapNode_446040_001121 1121 114487 :=
  map_facts_branch
    mapChunk_446040
    mapChunk_446600
    560 561 114487
    mapChunk_446040_facts
    mapChunk_446600_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_447161_facts :
    MapFacts mapChunk_447161 560 114487 :=
  checkMap_sound mapChunk_447161 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_447721_facts :
    MapFacts mapChunk_447721 561 114487 :=
  checkMap_sound mapChunk_447721 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t800\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_447161_001121_facts :
    MapFacts mapNode_447161_001121 1121 114487 :=
  map_facts_branch
    mapChunk_447161
    mapChunk_447721
    560 561 114487
    mapChunk_447161_facts
    mapChunk_447721_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_446040_002242_facts :
    MapFacts mapNode_446040_002242 2242 114487 :=
  map_facts_branch
    mapNode_446040_001121
    mapNode_447161_001121
    1121 1121 114487
    mapNode_446040_001121_facts
    mapNode_447161_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_443799_004483_facts :
    MapFacts mapNode_443799_004483 4483 114487 :=
  map_facts_branch
    mapNode_443799_002241
    mapNode_446040_002242
    2241 2242 114487
    mapNode_443799_002241_facts
    mapNode_446040_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_439316_008966_facts :
    MapFacts mapNode_439316_008966 8966 114487 :=
  map_facts_branch
    mapNode_439316_004483
    mapNode_443799_004483
    4483 4483 114487
    mapNode_439316_004483_facts
    mapNode_443799_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_430351_017931_facts :
    MapFacts mapNode_430351_017931 17931 114487 :=
  map_facts_branch
    mapNode_430351_008965
    mapNode_439316_008966
    8965 8966 114487
    mapNode_430351_008965_facts
    mapNode_439316_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_448282_facts :
    MapFacts mapChunk_448282 560 114487 :=
  checkMap_sound mapChunk_448282 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_448842_facts :
    MapFacts mapChunk_448842 560 114487 :=
  checkMap_sound mapChunk_448842 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_448282_001120_facts :
    MapFacts mapNode_448282_001120 1120 114487 :=
  map_facts_branch
    mapChunk_448282
    mapChunk_448842
    560 560 114487
    mapChunk_448282_facts
    mapChunk_448842_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_449402_facts :
    MapFacts mapChunk_449402 560 114487 :=
  checkMap_sound mapChunk_449402 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_449962_facts :
    MapFacts mapChunk_449962 561 114487 :=
  checkMap_sound mapChunk_449962 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_449402_001121_facts :
    MapFacts mapNode_449402_001121 1121 114487 :=
  map_facts_branch
    mapChunk_449402
    mapChunk_449962
    560 561 114487
    mapChunk_449402_facts
    mapChunk_449962_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_448282_002241_facts :
    MapFacts mapNode_448282_002241 2241 114487 :=
  map_facts_branch
    mapNode_448282_001120
    mapNode_449402_001121
    1120 1121 114487
    mapNode_448282_001120_facts
    mapNode_449402_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_450523_facts :
    MapFacts mapChunk_450523 560 114487 :=
  checkMap_sound mapChunk_450523 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_451083_facts :
    MapFacts mapChunk_451083 560 114487 :=
  checkMap_sound mapChunk_451083 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_450523_001120_facts :
    MapFacts mapNode_450523_001120 1120 114487 :=
  map_facts_branch
    mapChunk_450523
    mapChunk_451083
    560 560 114487
    mapChunk_450523_facts
    mapChunk_451083_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_451643_facts :
    MapFacts mapChunk_451643 560 114487 :=
  checkMap_sound mapChunk_451643 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_452203_facts :
    MapFacts mapChunk_452203 561 114487 :=
  checkMap_sound mapChunk_452203 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_451643_001121_facts :
    MapFacts mapNode_451643_001121 1121 114487 :=
  map_facts_branch
    mapChunk_451643
    mapChunk_452203
    560 561 114487
    mapChunk_451643_facts
    mapChunk_452203_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_450523_002241_facts :
    MapFacts mapNode_450523_002241 2241 114487 :=
  map_facts_branch
    mapNode_450523_001120
    mapNode_451643_001121
    1120 1121 114487
    mapNode_450523_001120_facts
    mapNode_451643_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_448282_004482_facts :
    MapFacts mapNode_448282_004482 4482 114487 :=
  map_facts_branch
    mapNode_448282_002241
    mapNode_450523_002241
    2241 2241 114487
    mapNode_448282_002241_facts
    mapNode_450523_002241_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_452764_facts :
    MapFacts mapChunk_452764 560 114487 :=
  checkMap_sound mapChunk_452764 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_453324_facts :
    MapFacts mapChunk_453324 560 114487 :=
  checkMap_sound mapChunk_453324 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_452764_001120_facts :
    MapFacts mapNode_452764_001120 1120 114487 :=
  map_facts_branch
    mapChunk_452764
    mapChunk_453324
    560 560 114487
    mapChunk_452764_facts
    mapChunk_453324_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_453884_facts :
    MapFacts mapChunk_453884 560 114487 :=
  checkMap_sound mapChunk_453884 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_454444_facts :
    MapFacts mapChunk_454444 561 114487 :=
  checkMap_sound mapChunk_454444 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_453884_001121_facts :
    MapFacts mapNode_453884_001121 1121 114487 :=
  map_facts_branch
    mapChunk_453884
    mapChunk_454444
    560 561 114487
    mapChunk_453884_facts
    mapChunk_454444_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_452764_002241_facts :
    MapFacts mapNode_452764_002241 2241 114487 :=
  map_facts_branch
    mapNode_452764_001120
    mapNode_453884_001121
    1120 1121 114487
    mapNode_452764_001120_facts
    mapNode_453884_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_455005_facts :
    MapFacts mapChunk_455005 560 114487 :=
  checkMap_sound mapChunk_455005 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_455565_facts :
    MapFacts mapChunk_455565 561 114487 :=
  checkMap_sound mapChunk_455565 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_455005_001121_facts :
    MapFacts mapNode_455005_001121 1121 114487 :=
  map_facts_branch
    mapChunk_455005
    mapChunk_455565
    560 561 114487
    mapChunk_455005_facts
    mapChunk_455565_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_456126_facts :
    MapFacts mapChunk_456126 560 114487 :=
  checkMap_sound mapChunk_456126 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_456686_facts :
    MapFacts mapChunk_456686 561 114487 :=
  checkMap_sound mapChunk_456686 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_456126_001121_facts :
    MapFacts mapNode_456126_001121 1121 114487 :=
  map_facts_branch
    mapChunk_456126
    mapChunk_456686
    560 561 114487
    mapChunk_456126_facts
    mapChunk_456686_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_455005_002242_facts :
    MapFacts mapNode_455005_002242 2242 114487 :=
  map_facts_branch
    mapNode_455005_001121
    mapNode_456126_001121
    1121 1121 114487
    mapNode_455005_001121_facts
    mapNode_456126_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_452764_004483_facts :
    MapFacts mapNode_452764_004483 4483 114487 :=
  map_facts_branch
    mapNode_452764_002241
    mapNode_455005_002242
    2241 2242 114487
    mapNode_452764_002241_facts
    mapNode_455005_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_448282_008965_facts :
    MapFacts mapNode_448282_008965 8965 114487 :=
  map_facts_branch
    mapNode_448282_004482
    mapNode_452764_004483
    4482 4483 114487
    mapNode_448282_004482_facts
    mapNode_452764_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_457247_facts :
    MapFacts mapChunk_457247 560 114487 :=
  checkMap_sound mapChunk_457247 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_457807_facts :
    MapFacts mapChunk_457807 560 114487 :=
  checkMap_sound mapChunk_457807 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_457247_001120_facts :
    MapFacts mapNode_457247_001120 1120 114487 :=
  map_facts_branch
    mapChunk_457247
    mapChunk_457807
    560 560 114487
    mapChunk_457247_facts
    mapChunk_457807_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_458367_facts :
    MapFacts mapChunk_458367 560 114487 :=
  checkMap_sound mapChunk_458367 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_458927_facts :
    MapFacts mapChunk_458927 561 114487 :=
  checkMap_sound mapChunk_458927 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_458367_001121_facts :
    MapFacts mapNode_458367_001121 1121 114487 :=
  map_facts_branch
    mapChunk_458367
    mapChunk_458927
    560 561 114487
    mapChunk_458367_facts
    mapChunk_458927_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_457247_002241_facts :
    MapFacts mapNode_457247_002241 2241 114487 :=
  map_facts_branch
    mapNode_457247_001120
    mapNode_458367_001121
    1120 1121 114487
    mapNode_457247_001120_facts
    mapNode_458367_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_459488_facts :
    MapFacts mapChunk_459488 560 114487 :=
  checkMap_sound mapChunk_459488 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_460048_facts :
    MapFacts mapChunk_460048 561 114487 :=
  checkMap_sound mapChunk_460048 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_459488_001121_facts :
    MapFacts mapNode_459488_001121 1121 114487 :=
  map_facts_branch
    mapChunk_459488
    mapChunk_460048
    560 561 114487
    mapChunk_459488_facts
    mapChunk_460048_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_460609_facts :
    MapFacts mapChunk_460609 560 114487 :=
  checkMap_sound mapChunk_460609 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_461169_facts :
    MapFacts mapChunk_461169 561 114487 :=
  checkMap_sound mapChunk_461169 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_460609_001121_facts :
    MapFacts mapNode_460609_001121 1121 114487 :=
  map_facts_branch
    mapChunk_460609
    mapChunk_461169
    560 561 114487
    mapChunk_460609_facts
    mapChunk_461169_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_459488_002242_facts :
    MapFacts mapNode_459488_002242 2242 114487 :=
  map_facts_branch
    mapNode_459488_001121
    mapNode_460609_001121
    1121 1121 114487
    mapNode_459488_001121_facts
    mapNode_460609_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_457247_004483_facts :
    MapFacts mapNode_457247_004483 4483 114487 :=
  map_facts_branch
    mapNode_457247_002241
    mapNode_459488_002242
    2241 2242 114487
    mapNode_457247_002241_facts
    mapNode_459488_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_461730_facts :
    MapFacts mapChunk_461730 560 114487 :=
  checkMap_sound mapChunk_461730 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_462290_facts :
    MapFacts mapChunk_462290 560 114487 :=
  checkMap_sound mapChunk_462290 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_461730_001120_facts :
    MapFacts mapNode_461730_001120 1120 114487 :=
  map_facts_branch
    mapChunk_461730
    mapChunk_462290
    560 560 114487
    mapChunk_461730_facts
    mapChunk_462290_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_462850_facts :
    MapFacts mapChunk_462850 560 114487 :=
  checkMap_sound mapChunk_462850 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_463410_facts :
    MapFacts mapChunk_463410 561 114487 :=
  checkMap_sound mapChunk_463410 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_462850_001121_facts :
    MapFacts mapNode_462850_001121 1121 114487 :=
  map_facts_branch
    mapChunk_462850
    mapChunk_463410
    560 561 114487
    mapChunk_462850_facts
    mapChunk_463410_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_461730_002241_facts :
    MapFacts mapNode_461730_002241 2241 114487 :=
  map_facts_branch
    mapNode_461730_001120
    mapNode_462850_001121
    1120 1121 114487
    mapNode_461730_001120_facts
    mapNode_462850_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_463971_facts :
    MapFacts mapChunk_463971 560 114487 :=
  checkMap_sound mapChunk_463971 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_464531_facts :
    MapFacts mapChunk_464531 561 114487 :=
  checkMap_sound mapChunk_464531 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_463971_001121_facts :
    MapFacts mapNode_463971_001121 1121 114487 :=
  map_facts_branch
    mapChunk_463971
    mapChunk_464531
    560 561 114487
    mapChunk_463971_facts
    mapChunk_464531_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_465092_facts :
    MapFacts mapChunk_465092 560 114487 :=
  checkMap_sound mapChunk_465092 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_465652_facts :
    MapFacts mapChunk_465652 561 114487 :=
  checkMap_sound mapChunk_465652 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t832\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_465092_001121_facts :
    MapFacts mapNode_465092_001121 1121 114487 :=
  map_facts_branch
    mapChunk_465092
    mapChunk_465652
    560 561 114487
    mapChunk_465092_facts
    mapChunk_465652_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_463971_002242_facts :
    MapFacts mapNode_463971_002242 2242 114487 :=
  map_facts_branch
    mapNode_463971_001121
    mapNode_465092_001121
    1121 1121 114487
    mapNode_463971_001121_facts
    mapNode_465092_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_461730_004483_facts :
    MapFacts mapNode_461730_004483 4483 114487 :=
  map_facts_branch
    mapNode_461730_002241
    mapNode_463971_002242
    2241 2242 114487
    mapNode_461730_002241_facts
    mapNode_463971_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_457247_008966_facts :
    MapFacts mapNode_457247_008966 8966 114487 :=
  map_facts_branch
    mapNode_457247_004483
    mapNode_461730_004483
    4483 4483 114487
    mapNode_457247_004483_facts
    mapNode_461730_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_448282_017931_facts :
    MapFacts mapNode_448282_017931 17931 114487 :=
  map_facts_branch
    mapNode_448282_008965
    mapNode_457247_008966
    8965 8966 114487
    mapNode_448282_008965_facts
    mapNode_457247_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_430351_035862_facts :
    MapFacts mapNode_430351_035862 35862 114487 :=
  map_facts_branch
    mapNode_430351_017931
    mapNode_448282_017931
    17931 17931 114487
    mapNode_430351_017931_facts
    mapNode_448282_017931_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_466213_facts :
    MapFacts mapChunk_466213 560 114487 :=
  checkMap_sound mapChunk_466213 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_466773_facts :
    MapFacts mapChunk_466773 560 114487 :=
  checkMap_sound mapChunk_466773 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_466213_001120_facts :
    MapFacts mapNode_466213_001120 1120 114487 :=
  map_facts_branch
    mapChunk_466213
    mapChunk_466773
    560 560 114487
    mapChunk_466213_facts
    mapChunk_466773_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_467333_facts :
    MapFacts mapChunk_467333 560 114487 :=
  checkMap_sound mapChunk_467333 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_467893_facts :
    MapFacts mapChunk_467893 561 114487 :=
  checkMap_sound mapChunk_467893 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_467333_001121_facts :
    MapFacts mapNode_467333_001121 1121 114487 :=
  map_facts_branch
    mapChunk_467333
    mapChunk_467893
    560 561 114487
    mapChunk_467333_facts
    mapChunk_467893_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_466213_002241_facts :
    MapFacts mapNode_466213_002241 2241 114487 :=
  map_facts_branch
    mapNode_466213_001120
    mapNode_467333_001121
    1120 1121 114487
    mapNode_466213_001120_facts
    mapNode_467333_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_468454_facts :
    MapFacts mapChunk_468454 560 114487 :=
  checkMap_sound mapChunk_468454 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_469014_facts :
    MapFacts mapChunk_469014 560 114487 :=
  checkMap_sound mapChunk_469014 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_468454_001120_facts :
    MapFacts mapNode_468454_001120 1120 114487 :=
  map_facts_branch
    mapChunk_468454
    mapChunk_469014
    560 560 114487
    mapChunk_468454_facts
    mapChunk_469014_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_469574_facts :
    MapFacts mapChunk_469574 560 114487 :=
  checkMap_sound mapChunk_469574 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_470134_facts :
    MapFacts mapChunk_470134 561 114487 :=
  checkMap_sound mapChunk_470134 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_469574_001121_facts :
    MapFacts mapNode_469574_001121 1121 114487 :=
  map_facts_branch
    mapChunk_469574
    mapChunk_470134
    560 561 114487
    mapChunk_469574_facts
    mapChunk_470134_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_468454_002241_facts :
    MapFacts mapNode_468454_002241 2241 114487 :=
  map_facts_branch
    mapNode_468454_001120
    mapNode_469574_001121
    1120 1121 114487
    mapNode_468454_001120_facts
    mapNode_469574_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_466213_004482_facts :
    MapFacts mapNode_466213_004482 4482 114487 :=
  map_facts_branch
    mapNode_466213_002241
    mapNode_468454_002241
    2241 2241 114487
    mapNode_466213_002241_facts
    mapNode_468454_002241_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_470695_facts :
    MapFacts mapChunk_470695 560 114487 :=
  checkMap_sound mapChunk_470695 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_471255_facts :
    MapFacts mapChunk_471255 560 114487 :=
  checkMap_sound mapChunk_471255 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_470695_001120_facts :
    MapFacts mapNode_470695_001120 1120 114487 :=
  map_facts_branch
    mapChunk_470695
    mapChunk_471255
    560 560 114487
    mapChunk_470695_facts
    mapChunk_471255_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_471815_facts :
    MapFacts mapChunk_471815 560 114487 :=
  checkMap_sound mapChunk_471815 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_472375_facts :
    MapFacts mapChunk_472375 561 114487 :=
  checkMap_sound mapChunk_472375 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_471815_001121_facts :
    MapFacts mapNode_471815_001121 1121 114487 :=
  map_facts_branch
    mapChunk_471815
    mapChunk_472375
    560 561 114487
    mapChunk_471815_facts
    mapChunk_472375_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_470695_002241_facts :
    MapFacts mapNode_470695_002241 2241 114487 :=
  map_facts_branch
    mapNode_470695_001120
    mapNode_471815_001121
    1120 1121 114487
    mapNode_470695_001120_facts
    mapNode_471815_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_472936_facts :
    MapFacts mapChunk_472936 560 114487 :=
  checkMap_sound mapChunk_472936 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_473496_facts :
    MapFacts mapChunk_473496 561 114487 :=
  checkMap_sound mapChunk_473496 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_472936_001121_facts :
    MapFacts mapNode_472936_001121 1121 114487 :=
  map_facts_branch
    mapChunk_472936
    mapChunk_473496
    560 561 114487
    mapChunk_472936_facts
    mapChunk_473496_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_474057_facts :
    MapFacts mapChunk_474057 560 114487 :=
  checkMap_sound mapChunk_474057 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_474617_facts :
    MapFacts mapChunk_474617 561 114487 :=
  checkMap_sound mapChunk_474617 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_474057_001121_facts :
    MapFacts mapNode_474057_001121 1121 114487 :=
  map_facts_branch
    mapChunk_474057
    mapChunk_474617
    560 561 114487
    mapChunk_474057_facts
    mapChunk_474617_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_472936_002242_facts :
    MapFacts mapNode_472936_002242 2242 114487 :=
  map_facts_branch
    mapNode_472936_001121
    mapNode_474057_001121
    1121 1121 114487
    mapNode_472936_001121_facts
    mapNode_474057_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_470695_004483_facts :
    MapFacts mapNode_470695_004483 4483 114487 :=
  map_facts_branch
    mapNode_470695_002241
    mapNode_472936_002242
    2241 2242 114487
    mapNode_470695_002241_facts
    mapNode_472936_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_466213_008965_facts :
    MapFacts mapNode_466213_008965 8965 114487 :=
  map_facts_branch
    mapNode_466213_004482
    mapNode_470695_004483
    4482 4483 114487
    mapNode_466213_004482_facts
    mapNode_470695_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_475178_facts :
    MapFacts mapChunk_475178 560 114487 :=
  checkMap_sound mapChunk_475178 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_475738_facts :
    MapFacts mapChunk_475738 560 114487 :=
  checkMap_sound mapChunk_475738 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_475178_001120_facts :
    MapFacts mapNode_475178_001120 1120 114487 :=
  map_facts_branch
    mapChunk_475178
    mapChunk_475738
    560 560 114487
    mapChunk_475178_facts
    mapChunk_475738_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_476298_facts :
    MapFacts mapChunk_476298 560 114487 :=
  checkMap_sound mapChunk_476298 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_476858_facts :
    MapFacts mapChunk_476858 561 114487 :=
  checkMap_sound mapChunk_476858 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_476298_001121_facts :
    MapFacts mapNode_476298_001121 1121 114487 :=
  map_facts_branch
    mapChunk_476298
    mapChunk_476858
    560 561 114487
    mapChunk_476298_facts
    mapChunk_476858_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_475178_002241_facts :
    MapFacts mapNode_475178_002241 2241 114487 :=
  map_facts_branch
    mapNode_475178_001120
    mapNode_476298_001121
    1120 1121 114487
    mapNode_475178_001120_facts
    mapNode_476298_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_477419_facts :
    MapFacts mapChunk_477419 560 114487 :=
  checkMap_sound mapChunk_477419 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_477979_facts :
    MapFacts mapChunk_477979 561 114487 :=
  checkMap_sound mapChunk_477979 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_477419_001121_facts :
    MapFacts mapNode_477419_001121 1121 114487 :=
  map_facts_branch
    mapChunk_477419
    mapChunk_477979
    560 561 114487
    mapChunk_477419_facts
    mapChunk_477979_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_478540_facts :
    MapFacts mapChunk_478540 560 114487 :=
  checkMap_sound mapChunk_478540 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_479100_facts :
    MapFacts mapChunk_479100 561 114487 :=
  checkMap_sound mapChunk_479100 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_478540_001121_facts :
    MapFacts mapNode_478540_001121 1121 114487 :=
  map_facts_branch
    mapChunk_478540
    mapChunk_479100
    560 561 114487
    mapChunk_478540_facts
    mapChunk_479100_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_477419_002242_facts :
    MapFacts mapNode_477419_002242 2242 114487 :=
  map_facts_branch
    mapNode_477419_001121
    mapNode_478540_001121
    1121 1121 114487
    mapNode_477419_001121_facts
    mapNode_478540_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_475178_004483_facts :
    MapFacts mapNode_475178_004483 4483 114487 :=
  map_facts_branch
    mapNode_475178_002241
    mapNode_477419_002242
    2241 2242 114487
    mapNode_475178_002241_facts
    mapNode_477419_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_479661_facts :
    MapFacts mapChunk_479661 560 114487 :=
  checkMap_sound mapChunk_479661 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_480221_facts :
    MapFacts mapChunk_480221 560 114487 :=
  checkMap_sound mapChunk_480221 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_479661_001120_facts :
    MapFacts mapNode_479661_001120 1120 114487 :=
  map_facts_branch
    mapChunk_479661
    mapChunk_480221
    560 560 114487
    mapChunk_479661_facts
    mapChunk_480221_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_480781_facts :
    MapFacts mapChunk_480781 560 114487 :=
  checkMap_sound mapChunk_480781 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_481341_facts :
    MapFacts mapChunk_481341 561 114487 :=
  checkMap_sound mapChunk_481341 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_480781_001121_facts :
    MapFacts mapNode_480781_001121 1121 114487 :=
  map_facts_branch
    mapChunk_480781
    mapChunk_481341
    560 561 114487
    mapChunk_480781_facts
    mapChunk_481341_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_479661_002241_facts :
    MapFacts mapNode_479661_002241 2241 114487 :=
  map_facts_branch
    mapNode_479661_001120
    mapNode_480781_001121
    1120 1121 114487
    mapNode_479661_001120_facts
    mapNode_480781_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_481902_facts :
    MapFacts mapChunk_481902 560 114487 :=
  checkMap_sound mapChunk_481902 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_482462_facts :
    MapFacts mapChunk_482462 561 114487 :=
  checkMap_sound mapChunk_482462 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_481902_001121_facts :
    MapFacts mapNode_481902_001121 1121 114487 :=
  map_facts_branch
    mapChunk_481902
    mapChunk_482462
    560 561 114487
    mapChunk_481902_facts
    mapChunk_482462_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_483023_facts :
    MapFacts mapChunk_483023 560 114487 :=
  checkMap_sound mapChunk_483023 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_483583_facts :
    MapFacts mapChunk_483583 561 114487 :=
  checkMap_sound mapChunk_483583 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t864\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_483023_001121_facts :
    MapFacts mapNode_483023_001121 1121 114487 :=
  map_facts_branch
    mapChunk_483023
    mapChunk_483583
    560 561 114487
    mapChunk_483023_facts
    mapChunk_483583_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_481902_002242_facts :
    MapFacts mapNode_481902_002242 2242 114487 :=
  map_facts_branch
    mapNode_481902_001121
    mapNode_483023_001121
    1121 1121 114487
    mapNode_481902_001121_facts
    mapNode_483023_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_479661_004483_facts :
    MapFacts mapNode_479661_004483 4483 114487 :=
  map_facts_branch
    mapNode_479661_002241
    mapNode_481902_002242
    2241 2242 114487
    mapNode_479661_002241_facts
    mapNode_481902_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_475178_008966_facts :
    MapFacts mapNode_475178_008966 8966 114487 :=
  map_facts_branch
    mapNode_475178_004483
    mapNode_479661_004483
    4483 4483 114487
    mapNode_475178_004483_facts
    mapNode_479661_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_466213_017931_facts :
    MapFacts mapNode_466213_017931 17931 114487 :=
  map_facts_branch
    mapNode_466213_008965
    mapNode_475178_008966
    8965 8966 114487
    mapNode_466213_008965_facts
    mapNode_475178_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_484144_facts :
    MapFacts mapChunk_484144 560 114487 :=
  checkMap_sound mapChunk_484144 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_484704_facts :
    MapFacts mapChunk_484704 560 114487 :=
  checkMap_sound mapChunk_484704 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_484144_001120_facts :
    MapFacts mapNode_484144_001120 1120 114487 :=
  map_facts_branch
    mapChunk_484144
    mapChunk_484704
    560 560 114487
    mapChunk_484144_facts
    mapChunk_484704_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_485264_facts :
    MapFacts mapChunk_485264 560 114487 :=
  checkMap_sound mapChunk_485264 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_485824_facts :
    MapFacts mapChunk_485824 561 114487 :=
  checkMap_sound mapChunk_485824 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_485264_001121_facts :
    MapFacts mapNode_485264_001121 1121 114487 :=
  map_facts_branch
    mapChunk_485264
    mapChunk_485824
    560 561 114487
    mapChunk_485264_facts
    mapChunk_485824_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_484144_002241_facts :
    MapFacts mapNode_484144_002241 2241 114487 :=
  map_facts_branch
    mapNode_484144_001120
    mapNode_485264_001121
    1120 1121 114487
    mapNode_484144_001120_facts
    mapNode_485264_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_486385_facts :
    MapFacts mapChunk_486385 560 114487 :=
  checkMap_sound mapChunk_486385 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_486945_facts :
    MapFacts mapChunk_486945 561 114487 :=
  checkMap_sound mapChunk_486945 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_486385_001121_facts :
    MapFacts mapNode_486385_001121 1121 114487 :=
  map_facts_branch
    mapChunk_486385
    mapChunk_486945
    560 561 114487
    mapChunk_486385_facts
    mapChunk_486945_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_487506_facts :
    MapFacts mapChunk_487506 560 114487 :=
  checkMap_sound mapChunk_487506 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_488066_facts :
    MapFacts mapChunk_488066 561 114487 :=
  checkMap_sound mapChunk_488066 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_487506_001121_facts :
    MapFacts mapNode_487506_001121 1121 114487 :=
  map_facts_branch
    mapChunk_487506
    mapChunk_488066
    560 561 114487
    mapChunk_487506_facts
    mapChunk_488066_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_486385_002242_facts :
    MapFacts mapNode_486385_002242 2242 114487 :=
  map_facts_branch
    mapNode_486385_001121
    mapNode_487506_001121
    1121 1121 114487
    mapNode_486385_001121_facts
    mapNode_487506_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_484144_004483_facts :
    MapFacts mapNode_484144_004483 4483 114487 :=
  map_facts_branch
    mapNode_484144_002241
    mapNode_486385_002242
    2241 2242 114487
    mapNode_484144_002241_facts
    mapNode_486385_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_488627_facts :
    MapFacts mapChunk_488627 560 114487 :=
  checkMap_sound mapChunk_488627 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_489187_facts :
    MapFacts mapChunk_489187 560 114487 :=
  checkMap_sound mapChunk_489187 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_488627_001120_facts :
    MapFacts mapNode_488627_001120 1120 114487 :=
  map_facts_branch
    mapChunk_488627
    mapChunk_489187
    560 560 114487
    mapChunk_488627_facts
    mapChunk_489187_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_489747_facts :
    MapFacts mapChunk_489747 560 114487 :=
  checkMap_sound mapChunk_489747 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_490307_facts :
    MapFacts mapChunk_490307 561 114487 :=
  checkMap_sound mapChunk_490307 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_489747_001121_facts :
    MapFacts mapNode_489747_001121 1121 114487 :=
  map_facts_branch
    mapChunk_489747
    mapChunk_490307
    560 561 114487
    mapChunk_489747_facts
    mapChunk_490307_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_488627_002241_facts :
    MapFacts mapNode_488627_002241 2241 114487 :=
  map_facts_branch
    mapNode_488627_001120
    mapNode_489747_001121
    1120 1121 114487
    mapNode_488627_001120_facts
    mapNode_489747_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_490868_facts :
    MapFacts mapChunk_490868 560 114487 :=
  checkMap_sound mapChunk_490868 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_491428_facts :
    MapFacts mapChunk_491428 561 114487 :=
  checkMap_sound mapChunk_491428 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_490868_001121_facts :
    MapFacts mapNode_490868_001121 1121 114487 :=
  map_facts_branch
    mapChunk_490868
    mapChunk_491428
    560 561 114487
    mapChunk_490868_facts
    mapChunk_491428_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_491989_facts :
    MapFacts mapChunk_491989 560 114487 :=
  checkMap_sound mapChunk_491989 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_492549_facts :
    MapFacts mapChunk_492549 561 114487 :=
  checkMap_sound mapChunk_492549 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_491989_001121_facts :
    MapFacts mapNode_491989_001121 1121 114487 :=
  map_facts_branch
    mapChunk_491989
    mapChunk_492549
    560 561 114487
    mapChunk_491989_facts
    mapChunk_492549_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_490868_002242_facts :
    MapFacts mapNode_490868_002242 2242 114487 :=
  map_facts_branch
    mapNode_490868_001121
    mapNode_491989_001121
    1121 1121 114487
    mapNode_490868_001121_facts
    mapNode_491989_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_488627_004483_facts :
    MapFacts mapNode_488627_004483 4483 114487 :=
  map_facts_branch
    mapNode_488627_002241
    mapNode_490868_002242
    2241 2242 114487
    mapNode_488627_002241_facts
    mapNode_490868_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_484144_008966_facts :
    MapFacts mapNode_484144_008966 8966 114487 :=
  map_facts_branch
    mapNode_484144_004483
    mapNode_488627_004483
    4483 4483 114487
    mapNode_484144_004483_facts
    mapNode_488627_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_493110_facts :
    MapFacts mapChunk_493110 560 114487 :=
  checkMap_sound mapChunk_493110 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_493670_facts :
    MapFacts mapChunk_493670 560 114487 :=
  checkMap_sound mapChunk_493670 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_493110_001120_facts :
    MapFacts mapNode_493110_001120 1120 114487 :=
  map_facts_branch
    mapChunk_493110
    mapChunk_493670
    560 560 114487
    mapChunk_493110_facts
    mapChunk_493670_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_494230_facts :
    MapFacts mapChunk_494230 560 114487 :=
  checkMap_sound mapChunk_494230 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_494790_facts :
    MapFacts mapChunk_494790 561 114487 :=
  checkMap_sound mapChunk_494790 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_494230_001121_facts :
    MapFacts mapNode_494230_001121 1121 114487 :=
  map_facts_branch
    mapChunk_494230
    mapChunk_494790
    560 561 114487
    mapChunk_494230_facts
    mapChunk_494790_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_493110_002241_facts :
    MapFacts mapNode_493110_002241 2241 114487 :=
  map_facts_branch
    mapNode_493110_001120
    mapNode_494230_001121
    1120 1121 114487
    mapNode_493110_001120_facts
    mapNode_494230_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_495351_facts :
    MapFacts mapChunk_495351 560 114487 :=
  checkMap_sound mapChunk_495351 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_495911_facts :
    MapFacts mapChunk_495911 561 114487 :=
  checkMap_sound mapChunk_495911 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_495351_001121_facts :
    MapFacts mapNode_495351_001121 1121 114487 :=
  map_facts_branch
    mapChunk_495351
    mapChunk_495911
    560 561 114487
    mapChunk_495351_facts
    mapChunk_495911_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_496472_facts :
    MapFacts mapChunk_496472 560 114487 :=
  checkMap_sound mapChunk_496472 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_497032_facts :
    MapFacts mapChunk_497032 561 114487 :=
  checkMap_sound mapChunk_497032 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_496472_001121_facts :
    MapFacts mapNode_496472_001121 1121 114487 :=
  map_facts_branch
    mapChunk_496472
    mapChunk_497032
    560 561 114487
    mapChunk_496472_facts
    mapChunk_497032_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_495351_002242_facts :
    MapFacts mapNode_495351_002242 2242 114487 :=
  map_facts_branch
    mapNode_495351_001121
    mapNode_496472_001121
    1121 1121 114487
    mapNode_495351_001121_facts
    mapNode_496472_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_493110_004483_facts :
    MapFacts mapNode_493110_004483 4483 114487 :=
  map_facts_branch
    mapNode_493110_002241
    mapNode_495351_002242
    2241 2242 114487
    mapNode_493110_002241_facts
    mapNode_495351_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_497593_facts :
    MapFacts mapChunk_497593 560 114487 :=
  checkMap_sound mapChunk_497593 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_498153_facts :
    MapFacts mapChunk_498153 560 114487 :=
  checkMap_sound mapChunk_498153 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_497593_001120_facts :
    MapFacts mapNode_497593_001120 1120 114487 :=
  map_facts_branch
    mapChunk_497593
    mapChunk_498153
    560 560 114487
    mapChunk_497593_facts
    mapChunk_498153_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_498713_facts :
    MapFacts mapChunk_498713 560 114487 :=
  checkMap_sound mapChunk_498713 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_499273_facts :
    MapFacts mapChunk_499273 561 114487 :=
  checkMap_sound mapChunk_499273 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_498713_001121_facts :
    MapFacts mapNode_498713_001121 1121 114487 :=
  map_facts_branch
    mapChunk_498713
    mapChunk_499273
    560 561 114487
    mapChunk_498713_facts
    mapChunk_499273_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_497593_002241_facts :
    MapFacts mapNode_497593_002241 2241 114487 :=
  map_facts_branch
    mapNode_497593_001120
    mapNode_498713_001121
    1120 1121 114487
    mapNode_497593_001120_facts
    mapNode_498713_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_499834_facts :
    MapFacts mapChunk_499834 560 114487 :=
  checkMap_sound mapChunk_499834 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_500394_facts :
    MapFacts mapChunk_500394 561 114487 :=
  checkMap_sound mapChunk_500394 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_499834_001121_facts :
    MapFacts mapNode_499834_001121 1121 114487 :=
  map_facts_branch
    mapChunk_499834
    mapChunk_500394
    560 561 114487
    mapChunk_499834_facts
    mapChunk_500394_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_500955_facts :
    MapFacts mapChunk_500955 560 114487 :=
  checkMap_sound mapChunk_500955 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_501515_facts :
    MapFacts mapChunk_501515 561 114487 :=
  checkMap_sound mapChunk_501515 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t896\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_500955_001121_facts :
    MapFacts mapNode_500955_001121 1121 114487 :=
  map_facts_branch
    mapChunk_500955
    mapChunk_501515
    560 561 114487
    mapChunk_500955_facts
    mapChunk_501515_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_499834_002242_facts :
    MapFacts mapNode_499834_002242 2242 114487 :=
  map_facts_branch
    mapNode_499834_001121
    mapNode_500955_001121
    1121 1121 114487
    mapNode_499834_001121_facts
    mapNode_500955_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_497593_004483_facts :
    MapFacts mapNode_497593_004483 4483 114487 :=
  map_facts_branch
    mapNode_497593_002241
    mapNode_499834_002242
    2241 2242 114487
    mapNode_497593_002241_facts
    mapNode_499834_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_493110_008966_facts :
    MapFacts mapNode_493110_008966 8966 114487 :=
  map_facts_branch
    mapNode_493110_004483
    mapNode_497593_004483
    4483 4483 114487
    mapNode_493110_004483_facts
    mapNode_497593_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_484144_017932_facts :
    MapFacts mapNode_484144_017932 17932 114487 :=
  map_facts_branch
    mapNode_484144_008966
    mapNode_493110_008966
    8966 8966 114487
    mapNode_484144_008966_facts
    mapNode_493110_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_466213_035863_facts :
    MapFacts mapNode_466213_035863 35863 114487 :=
  map_facts_branch
    mapNode_466213_017931
    mapNode_484144_017932
    17931 17932 114487
    mapNode_466213_017931_facts
    mapNode_484144_017932_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_430351_071725_facts :
    MapFacts mapNode_430351_071725 71725 114487 :=
  map_facts_branch
    mapNode_430351_035862
    mapNode_466213_035863
    35862 35863 114487
    mapNode_430351_035862_facts
    mapNode_466213_035863_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_502076_facts :
    MapFacts mapChunk_502076 560 114487 :=
  checkMap_sound mapChunk_502076 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_502636_facts :
    MapFacts mapChunk_502636 560 114487 :=
  checkMap_sound mapChunk_502636 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_502076_001120_facts :
    MapFacts mapNode_502076_001120 1120 114487 :=
  map_facts_branch
    mapChunk_502076
    mapChunk_502636
    560 560 114487
    mapChunk_502076_facts
    mapChunk_502636_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_503196_facts :
    MapFacts mapChunk_503196 560 114487 :=
  checkMap_sound mapChunk_503196 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_503756_facts :
    MapFacts mapChunk_503756 561 114487 :=
  checkMap_sound mapChunk_503756 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_503196_001121_facts :
    MapFacts mapNode_503196_001121 1121 114487 :=
  map_facts_branch
    mapChunk_503196
    mapChunk_503756
    560 561 114487
    mapChunk_503196_facts
    mapChunk_503756_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_502076_002241_facts :
    MapFacts mapNode_502076_002241 2241 114487 :=
  map_facts_branch
    mapNode_502076_001120
    mapNode_503196_001121
    1120 1121 114487
    mapNode_502076_001120_facts
    mapNode_503196_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_504317_facts :
    MapFacts mapChunk_504317 560 114487 :=
  checkMap_sound mapChunk_504317 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_504877_facts :
    MapFacts mapChunk_504877 560 114487 :=
  checkMap_sound mapChunk_504877 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_504317_001120_facts :
    MapFacts mapNode_504317_001120 1120 114487 :=
  map_facts_branch
    mapChunk_504317
    mapChunk_504877
    560 560 114487
    mapChunk_504317_facts
    mapChunk_504877_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_505437_facts :
    MapFacts mapChunk_505437 560 114487 :=
  checkMap_sound mapChunk_505437 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_505997_facts :
    MapFacts mapChunk_505997 561 114487 :=
  checkMap_sound mapChunk_505997 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_505437_001121_facts :
    MapFacts mapNode_505437_001121 1121 114487 :=
  map_facts_branch
    mapChunk_505437
    mapChunk_505997
    560 561 114487
    mapChunk_505437_facts
    mapChunk_505997_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_504317_002241_facts :
    MapFacts mapNode_504317_002241 2241 114487 :=
  map_facts_branch
    mapNode_504317_001120
    mapNode_505437_001121
    1120 1121 114487
    mapNode_504317_001120_facts
    mapNode_505437_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_502076_004482_facts :
    MapFacts mapNode_502076_004482 4482 114487 :=
  map_facts_branch
    mapNode_502076_002241
    mapNode_504317_002241
    2241 2241 114487
    mapNode_502076_002241_facts
    mapNode_504317_002241_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_506558_facts :
    MapFacts mapChunk_506558 560 114487 :=
  checkMap_sound mapChunk_506558 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_507118_facts :
    MapFacts mapChunk_507118 560 114487 :=
  checkMap_sound mapChunk_507118 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_506558_001120_facts :
    MapFacts mapNode_506558_001120 1120 114487 :=
  map_facts_branch
    mapChunk_506558
    mapChunk_507118
    560 560 114487
    mapChunk_506558_facts
    mapChunk_507118_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_507678_facts :
    MapFacts mapChunk_507678 560 114487 :=
  checkMap_sound mapChunk_507678 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_508238_facts :
    MapFacts mapChunk_508238 561 114487 :=
  checkMap_sound mapChunk_508238 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_507678_001121_facts :
    MapFacts mapNode_507678_001121 1121 114487 :=
  map_facts_branch
    mapChunk_507678
    mapChunk_508238
    560 561 114487
    mapChunk_507678_facts
    mapChunk_508238_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_506558_002241_facts :
    MapFacts mapNode_506558_002241 2241 114487 :=
  map_facts_branch
    mapNode_506558_001120
    mapNode_507678_001121
    1120 1121 114487
    mapNode_506558_001120_facts
    mapNode_507678_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_508799_facts :
    MapFacts mapChunk_508799 560 114487 :=
  checkMap_sound mapChunk_508799 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_509359_facts :
    MapFacts mapChunk_509359 561 114487 :=
  checkMap_sound mapChunk_509359 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_508799_001121_facts :
    MapFacts mapNode_508799_001121 1121 114487 :=
  map_facts_branch
    mapChunk_508799
    mapChunk_509359
    560 561 114487
    mapChunk_508799_facts
    mapChunk_509359_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_509920_facts :
    MapFacts mapChunk_509920 560 114487 :=
  checkMap_sound mapChunk_509920 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_510480_facts :
    MapFacts mapChunk_510480 561 114487 :=
  checkMap_sound mapChunk_510480 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_509920_001121_facts :
    MapFacts mapNode_509920_001121 1121 114487 :=
  map_facts_branch
    mapChunk_509920
    mapChunk_510480
    560 561 114487
    mapChunk_509920_facts
    mapChunk_510480_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_508799_002242_facts :
    MapFacts mapNode_508799_002242 2242 114487 :=
  map_facts_branch
    mapNode_508799_001121
    mapNode_509920_001121
    1121 1121 114487
    mapNode_508799_001121_facts
    mapNode_509920_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_506558_004483_facts :
    MapFacts mapNode_506558_004483 4483 114487 :=
  map_facts_branch
    mapNode_506558_002241
    mapNode_508799_002242
    2241 2242 114487
    mapNode_506558_002241_facts
    mapNode_508799_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_502076_008965_facts :
    MapFacts mapNode_502076_008965 8965 114487 :=
  map_facts_branch
    mapNode_502076_004482
    mapNode_506558_004483
    4482 4483 114487
    mapNode_502076_004482_facts
    mapNode_506558_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_511041_facts :
    MapFacts mapChunk_511041 560 114487 :=
  checkMap_sound mapChunk_511041 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_511601_facts :
    MapFacts mapChunk_511601 560 114487 :=
  checkMap_sound mapChunk_511601 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_511041_001120_facts :
    MapFacts mapNode_511041_001120 1120 114487 :=
  map_facts_branch
    mapChunk_511041
    mapChunk_511601
    560 560 114487
    mapChunk_511041_facts
    mapChunk_511601_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_512161_facts :
    MapFacts mapChunk_512161 560 114487 :=
  checkMap_sound mapChunk_512161 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_512721_facts :
    MapFacts mapChunk_512721 561 114487 :=
  checkMap_sound mapChunk_512721 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_512161_001121_facts :
    MapFacts mapNode_512161_001121 1121 114487 :=
  map_facts_branch
    mapChunk_512161
    mapChunk_512721
    560 561 114487
    mapChunk_512161_facts
    mapChunk_512721_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_511041_002241_facts :
    MapFacts mapNode_511041_002241 2241 114487 :=
  map_facts_branch
    mapNode_511041_001120
    mapNode_512161_001121
    1120 1121 114487
    mapNode_511041_001120_facts
    mapNode_512161_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_513282_facts :
    MapFacts mapChunk_513282 560 114487 :=
  checkMap_sound mapChunk_513282 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_513842_facts :
    MapFacts mapChunk_513842 561 114487 :=
  checkMap_sound mapChunk_513842 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_513282_001121_facts :
    MapFacts mapNode_513282_001121 1121 114487 :=
  map_facts_branch
    mapChunk_513282
    mapChunk_513842
    560 561 114487
    mapChunk_513282_facts
    mapChunk_513842_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_514403_facts :
    MapFacts mapChunk_514403 560 114487 :=
  checkMap_sound mapChunk_514403 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_514963_facts :
    MapFacts mapChunk_514963 561 114487 :=
  checkMap_sound mapChunk_514963 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_514403_001121_facts :
    MapFacts mapNode_514403_001121 1121 114487 :=
  map_facts_branch
    mapChunk_514403
    mapChunk_514963
    560 561 114487
    mapChunk_514403_facts
    mapChunk_514963_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_513282_002242_facts :
    MapFacts mapNode_513282_002242 2242 114487 :=
  map_facts_branch
    mapNode_513282_001121
    mapNode_514403_001121
    1121 1121 114487
    mapNode_513282_001121_facts
    mapNode_514403_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_511041_004483_facts :
    MapFacts mapNode_511041_004483 4483 114487 :=
  map_facts_branch
    mapNode_511041_002241
    mapNode_513282_002242
    2241 2242 114487
    mapNode_511041_002241_facts
    mapNode_513282_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_515524_facts :
    MapFacts mapChunk_515524 560 114487 :=
  checkMap_sound mapChunk_515524 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_516084_facts :
    MapFacts mapChunk_516084 560 114487 :=
  checkMap_sound mapChunk_516084 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_515524_001120_facts :
    MapFacts mapNode_515524_001120 1120 114487 :=
  map_facts_branch
    mapChunk_515524
    mapChunk_516084
    560 560 114487
    mapChunk_515524_facts
    mapChunk_516084_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_516644_facts :
    MapFacts mapChunk_516644 560 114487 :=
  checkMap_sound mapChunk_516644 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_517204_facts :
    MapFacts mapChunk_517204 561 114487 :=
  checkMap_sound mapChunk_517204 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_516644_001121_facts :
    MapFacts mapNode_516644_001121 1121 114487 :=
  map_facts_branch
    mapChunk_516644
    mapChunk_517204
    560 561 114487
    mapChunk_516644_facts
    mapChunk_517204_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_515524_002241_facts :
    MapFacts mapNode_515524_002241 2241 114487 :=
  map_facts_branch
    mapNode_515524_001120
    mapNode_516644_001121
    1120 1121 114487
    mapNode_515524_001120_facts
    mapNode_516644_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_517765_facts :
    MapFacts mapChunk_517765 560 114487 :=
  checkMap_sound mapChunk_517765 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_518325_facts :
    MapFacts mapChunk_518325 561 114487 :=
  checkMap_sound mapChunk_518325 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_517765_001121_facts :
    MapFacts mapNode_517765_001121 1121 114487 :=
  map_facts_branch
    mapChunk_517765
    mapChunk_518325
    560 561 114487
    mapChunk_517765_facts
    mapChunk_518325_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_518886_facts :
    MapFacts mapChunk_518886 560 114487 :=
  checkMap_sound mapChunk_518886 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_519446_facts :
    MapFacts mapChunk_519446 561 114487 :=
  checkMap_sound mapChunk_519446 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t928\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_518886_001121_facts :
    MapFacts mapNode_518886_001121 1121 114487 :=
  map_facts_branch
    mapChunk_518886
    mapChunk_519446
    560 561 114487
    mapChunk_518886_facts
    mapChunk_519446_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_517765_002242_facts :
    MapFacts mapNode_517765_002242 2242 114487 :=
  map_facts_branch
    mapNode_517765_001121
    mapNode_518886_001121
    1121 1121 114487
    mapNode_517765_001121_facts
    mapNode_518886_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_515524_004483_facts :
    MapFacts mapNode_515524_004483 4483 114487 :=
  map_facts_branch
    mapNode_515524_002241
    mapNode_517765_002242
    2241 2242 114487
    mapNode_515524_002241_facts
    mapNode_517765_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_511041_008966_facts :
    MapFacts mapNode_511041_008966 8966 114487 :=
  map_facts_branch
    mapNode_511041_004483
    mapNode_515524_004483
    4483 4483 114487
    mapNode_511041_004483_facts
    mapNode_515524_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_502076_017931_facts :
    MapFacts mapNode_502076_017931 17931 114487 :=
  map_facts_branch
    mapNode_502076_008965
    mapNode_511041_008966
    8965 8966 114487
    mapNode_502076_008965_facts
    mapNode_511041_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_520007_facts :
    MapFacts mapChunk_520007 560 114487 :=
  checkMap_sound mapChunk_520007 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_520567_facts :
    MapFacts mapChunk_520567 560 114487 :=
  checkMap_sound mapChunk_520567 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_520007_001120_facts :
    MapFacts mapNode_520007_001120 1120 114487 :=
  map_facts_branch
    mapChunk_520007
    mapChunk_520567
    560 560 114487
    mapChunk_520007_facts
    mapChunk_520567_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_521127_facts :
    MapFacts mapChunk_521127 560 114487 :=
  checkMap_sound mapChunk_521127 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_521687_facts :
    MapFacts mapChunk_521687 561 114487 :=
  checkMap_sound mapChunk_521687 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_521127_001121_facts :
    MapFacts mapNode_521127_001121 1121 114487 :=
  map_facts_branch
    mapChunk_521127
    mapChunk_521687
    560 561 114487
    mapChunk_521127_facts
    mapChunk_521687_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_520007_002241_facts :
    MapFacts mapNode_520007_002241 2241 114487 :=
  map_facts_branch
    mapNode_520007_001120
    mapNode_521127_001121
    1120 1121 114487
    mapNode_520007_001120_facts
    mapNode_521127_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_522248_facts :
    MapFacts mapChunk_522248 560 114487 :=
  checkMap_sound mapChunk_522248 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_522808_facts :
    MapFacts mapChunk_522808 561 114487 :=
  checkMap_sound mapChunk_522808 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_522248_001121_facts :
    MapFacts mapNode_522248_001121 1121 114487 :=
  map_facts_branch
    mapChunk_522248
    mapChunk_522808
    560 561 114487
    mapChunk_522248_facts
    mapChunk_522808_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_523369_facts :
    MapFacts mapChunk_523369 560 114487 :=
  checkMap_sound mapChunk_523369 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_523929_facts :
    MapFacts mapChunk_523929 561 114487 :=
  checkMap_sound mapChunk_523929 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_523369_001121_facts :
    MapFacts mapNode_523369_001121 1121 114487 :=
  map_facts_branch
    mapChunk_523369
    mapChunk_523929
    560 561 114487
    mapChunk_523369_facts
    mapChunk_523929_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_522248_002242_facts :
    MapFacts mapNode_522248_002242 2242 114487 :=
  map_facts_branch
    mapNode_522248_001121
    mapNode_523369_001121
    1121 1121 114487
    mapNode_522248_001121_facts
    mapNode_523369_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_520007_004483_facts :
    MapFacts mapNode_520007_004483 4483 114487 :=
  map_facts_branch
    mapNode_520007_002241
    mapNode_522248_002242
    2241 2242 114487
    mapNode_520007_002241_facts
    mapNode_522248_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_524490_facts :
    MapFacts mapChunk_524490 560 114487 :=
  checkMap_sound mapChunk_524490 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_525050_facts :
    MapFacts mapChunk_525050 560 114487 :=
  checkMap_sound mapChunk_525050 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_524490_001120_facts :
    MapFacts mapNode_524490_001120 1120 114487 :=
  map_facts_branch
    mapChunk_524490
    mapChunk_525050
    560 560 114487
    mapChunk_524490_facts
    mapChunk_525050_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_525610_facts :
    MapFacts mapChunk_525610 560 114487 :=
  checkMap_sound mapChunk_525610 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_526170_facts :
    MapFacts mapChunk_526170 561 114487 :=
  checkMap_sound mapChunk_526170 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_525610_001121_facts :
    MapFacts mapNode_525610_001121 1121 114487 :=
  map_facts_branch
    mapChunk_525610
    mapChunk_526170
    560 561 114487
    mapChunk_525610_facts
    mapChunk_526170_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_524490_002241_facts :
    MapFacts mapNode_524490_002241 2241 114487 :=
  map_facts_branch
    mapNode_524490_001120
    mapNode_525610_001121
    1120 1121 114487
    mapNode_524490_001120_facts
    mapNode_525610_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_526731_facts :
    MapFacts mapChunk_526731 560 114487 :=
  checkMap_sound mapChunk_526731 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_527291_facts :
    MapFacts mapChunk_527291 561 114487 :=
  checkMap_sound mapChunk_527291 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_526731_001121_facts :
    MapFacts mapNode_526731_001121 1121 114487 :=
  map_facts_branch
    mapChunk_526731
    mapChunk_527291
    560 561 114487
    mapChunk_526731_facts
    mapChunk_527291_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_527852_facts :
    MapFacts mapChunk_527852 560 114487 :=
  checkMap_sound mapChunk_527852 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_528412_facts :
    MapFacts mapChunk_528412 561 114487 :=
  checkMap_sound mapChunk_528412 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_527852_001121_facts :
    MapFacts mapNode_527852_001121 1121 114487 :=
  map_facts_branch
    mapChunk_527852
    mapChunk_528412
    560 561 114487
    mapChunk_527852_facts
    mapChunk_528412_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_526731_002242_facts :
    MapFacts mapNode_526731_002242 2242 114487 :=
  map_facts_branch
    mapNode_526731_001121
    mapNode_527852_001121
    1121 1121 114487
    mapNode_526731_001121_facts
    mapNode_527852_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_524490_004483_facts :
    MapFacts mapNode_524490_004483 4483 114487 :=
  map_facts_branch
    mapNode_524490_002241
    mapNode_526731_002242
    2241 2242 114487
    mapNode_524490_002241_facts
    mapNode_526731_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_520007_008966_facts :
    MapFacts mapNode_520007_008966 8966 114487 :=
  map_facts_branch
    mapNode_520007_004483
    mapNode_524490_004483
    4483 4483 114487
    mapNode_520007_004483_facts
    mapNode_524490_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_528973_facts :
    MapFacts mapChunk_528973 560 114487 :=
  checkMap_sound mapChunk_528973 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_529533_facts :
    MapFacts mapChunk_529533 560 114487 :=
  checkMap_sound mapChunk_529533 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_528973_001120_facts :
    MapFacts mapNode_528973_001120 1120 114487 :=
  map_facts_branch
    mapChunk_528973
    mapChunk_529533
    560 560 114487
    mapChunk_528973_facts
    mapChunk_529533_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_530093_facts :
    MapFacts mapChunk_530093 560 114487 :=
  checkMap_sound mapChunk_530093 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_530653_facts :
    MapFacts mapChunk_530653 561 114487 :=
  checkMap_sound mapChunk_530653 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_530093_001121_facts :
    MapFacts mapNode_530093_001121 1121 114487 :=
  map_facts_branch
    mapChunk_530093
    mapChunk_530653
    560 561 114487
    mapChunk_530093_facts
    mapChunk_530653_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_528973_002241_facts :
    MapFacts mapNode_528973_002241 2241 114487 :=
  map_facts_branch
    mapNode_528973_001120
    mapNode_530093_001121
    1120 1121 114487
    mapNode_528973_001120_facts
    mapNode_530093_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_531214_facts :
    MapFacts mapChunk_531214 560 114487 :=
  checkMap_sound mapChunk_531214 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_531774_facts :
    MapFacts mapChunk_531774 561 114487 :=
  checkMap_sound mapChunk_531774 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_531214_001121_facts :
    MapFacts mapNode_531214_001121 1121 114487 :=
  map_facts_branch
    mapChunk_531214
    mapChunk_531774
    560 561 114487
    mapChunk_531214_facts
    mapChunk_531774_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_532335_facts :
    MapFacts mapChunk_532335 560 114487 :=
  checkMap_sound mapChunk_532335 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_532895_facts :
    MapFacts mapChunk_532895 561 114487 :=
  checkMap_sound mapChunk_532895 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_532335_001121_facts :
    MapFacts mapNode_532335_001121 1121 114487 :=
  map_facts_branch
    mapChunk_532335
    mapChunk_532895
    560 561 114487
    mapChunk_532335_facts
    mapChunk_532895_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_531214_002242_facts :
    MapFacts mapNode_531214_002242 2242 114487 :=
  map_facts_branch
    mapNode_531214_001121
    mapNode_532335_001121
    1121 1121 114487
    mapNode_531214_001121_facts
    mapNode_532335_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_528973_004483_facts :
    MapFacts mapNode_528973_004483 4483 114487 :=
  map_facts_branch
    mapNode_528973_002241
    mapNode_531214_002242
    2241 2242 114487
    mapNode_528973_002241_facts
    mapNode_531214_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_533456_facts :
    MapFacts mapChunk_533456 560 114487 :=
  checkMap_sound mapChunk_533456 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_534016_facts :
    MapFacts mapChunk_534016 560 114487 :=
  checkMap_sound mapChunk_534016 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_533456_001120_facts :
    MapFacts mapNode_533456_001120 1120 114487 :=
  map_facts_branch
    mapChunk_533456
    mapChunk_534016
    560 560 114487
    mapChunk_533456_facts
    mapChunk_534016_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_534576_facts :
    MapFacts mapChunk_534576 560 114487 :=
  checkMap_sound mapChunk_534576 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_535136_facts :
    MapFacts mapChunk_535136 561 114487 :=
  checkMap_sound mapChunk_535136 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_534576_001121_facts :
    MapFacts mapNode_534576_001121 1121 114487 :=
  map_facts_branch
    mapChunk_534576
    mapChunk_535136
    560 561 114487
    mapChunk_534576_facts
    mapChunk_535136_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_533456_002241_facts :
    MapFacts mapNode_533456_002241 2241 114487 :=
  map_facts_branch
    mapNode_533456_001120
    mapNode_534576_001121
    1120 1121 114487
    mapNode_533456_001120_facts
    mapNode_534576_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_535697_facts :
    MapFacts mapChunk_535697 560 114487 :=
  checkMap_sound mapChunk_535697 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_536257_facts :
    MapFacts mapChunk_536257 561 114487 :=
  checkMap_sound mapChunk_536257 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_535697_001121_facts :
    MapFacts mapNode_535697_001121 1121 114487 :=
  map_facts_branch
    mapChunk_535697
    mapChunk_536257
    560 561 114487
    mapChunk_535697_facts
    mapChunk_536257_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_536818_facts :
    MapFacts mapChunk_536818 560 114487 :=
  checkMap_sound mapChunk_536818 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_537378_facts :
    MapFacts mapChunk_537378 561 114487 :=
  checkMap_sound mapChunk_537378 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t960\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_536818_001121_facts :
    MapFacts mapNode_536818_001121 1121 114487 :=
  map_facts_branch
    mapChunk_536818
    mapChunk_537378
    560 561 114487
    mapChunk_536818_facts
    mapChunk_537378_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_535697_002242_facts :
    MapFacts mapNode_535697_002242 2242 114487 :=
  map_facts_branch
    mapNode_535697_001121
    mapNode_536818_001121
    1121 1121 114487
    mapNode_535697_001121_facts
    mapNode_536818_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_533456_004483_facts :
    MapFacts mapNode_533456_004483 4483 114487 :=
  map_facts_branch
    mapNode_533456_002241
    mapNode_535697_002242
    2241 2242 114487
    mapNode_533456_002241_facts
    mapNode_535697_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_528973_008966_facts :
    MapFacts mapNode_528973_008966 8966 114487 :=
  map_facts_branch
    mapNode_528973_004483
    mapNode_533456_004483
    4483 4483 114487
    mapNode_528973_004483_facts
    mapNode_533456_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_520007_017932_facts :
    MapFacts mapNode_520007_017932 17932 114487 :=
  map_facts_branch
    mapNode_520007_008966
    mapNode_528973_008966
    8966 8966 114487
    mapNode_520007_008966_facts
    mapNode_528973_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_502076_035863_facts :
    MapFacts mapNode_502076_035863 35863 114487 :=
  map_facts_branch
    mapNode_502076_017931
    mapNode_520007_017932
    17931 17932 114487
    mapNode_502076_017931_facts
    mapNode_520007_017932_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_537939_facts :
    MapFacts mapChunk_537939 560 114487 :=
  checkMap_sound mapChunk_537939 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_538499_facts :
    MapFacts mapChunk_538499 560 114487 :=
  checkMap_sound mapChunk_538499 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_537939_001120_facts :
    MapFacts mapNode_537939_001120 1120 114487 :=
  map_facts_branch
    mapChunk_537939
    mapChunk_538499
    560 560 114487
    mapChunk_537939_facts
    mapChunk_538499_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_539059_facts :
    MapFacts mapChunk_539059 560 114487 :=
  checkMap_sound mapChunk_539059 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_539619_facts :
    MapFacts mapChunk_539619 561 114487 :=
  checkMap_sound mapChunk_539619 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_539059_001121_facts :
    MapFacts mapNode_539059_001121 1121 114487 :=
  map_facts_branch
    mapChunk_539059
    mapChunk_539619
    560 561 114487
    mapChunk_539059_facts
    mapChunk_539619_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_537939_002241_facts :
    MapFacts mapNode_537939_002241 2241 114487 :=
  map_facts_branch
    mapNode_537939_001120
    mapNode_539059_001121
    1120 1121 114487
    mapNode_537939_001120_facts
    mapNode_539059_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_540180_facts :
    MapFacts mapChunk_540180 560 114487 :=
  checkMap_sound mapChunk_540180 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_540740_facts :
    MapFacts mapChunk_540740 560 114487 :=
  checkMap_sound mapChunk_540740 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_540180_001120_facts :
    MapFacts mapNode_540180_001120 1120 114487 :=
  map_facts_branch
    mapChunk_540180
    mapChunk_540740
    560 560 114487
    mapChunk_540180_facts
    mapChunk_540740_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_541300_facts :
    MapFacts mapChunk_541300 560 114487 :=
  checkMap_sound mapChunk_541300 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_541860_facts :
    MapFacts mapChunk_541860 561 114487 :=
  checkMap_sound mapChunk_541860 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_541300_001121_facts :
    MapFacts mapNode_541300_001121 1121 114487 :=
  map_facts_branch
    mapChunk_541300
    mapChunk_541860
    560 561 114487
    mapChunk_541300_facts
    mapChunk_541860_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_540180_002241_facts :
    MapFacts mapNode_540180_002241 2241 114487 :=
  map_facts_branch
    mapNode_540180_001120
    mapNode_541300_001121
    1120 1121 114487
    mapNode_540180_001120_facts
    mapNode_541300_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_537939_004482_facts :
    MapFacts mapNode_537939_004482 4482 114487 :=
  map_facts_branch
    mapNode_537939_002241
    mapNode_540180_002241
    2241 2241 114487
    mapNode_537939_002241_facts
    mapNode_540180_002241_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_542421_facts :
    MapFacts mapChunk_542421 560 114487 :=
  checkMap_sound mapChunk_542421 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_542981_facts :
    MapFacts mapChunk_542981 560 114487 :=
  checkMap_sound mapChunk_542981 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_542421_001120_facts :
    MapFacts mapNode_542421_001120 1120 114487 :=
  map_facts_branch
    mapChunk_542421
    mapChunk_542981
    560 560 114487
    mapChunk_542421_facts
    mapChunk_542981_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_543541_facts :
    MapFacts mapChunk_543541 560 114487 :=
  checkMap_sound mapChunk_543541 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_544101_facts :
    MapFacts mapChunk_544101 561 114487 :=
  checkMap_sound mapChunk_544101 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_543541_001121_facts :
    MapFacts mapNode_543541_001121 1121 114487 :=
  map_facts_branch
    mapChunk_543541
    mapChunk_544101
    560 561 114487
    mapChunk_543541_facts
    mapChunk_544101_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_542421_002241_facts :
    MapFacts mapNode_542421_002241 2241 114487 :=
  map_facts_branch
    mapNode_542421_001120
    mapNode_543541_001121
    1120 1121 114487
    mapNode_542421_001120_facts
    mapNode_543541_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_544662_facts :
    MapFacts mapChunk_544662 560 114487 :=
  checkMap_sound mapChunk_544662 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_545222_facts :
    MapFacts mapChunk_545222 561 114487 :=
  checkMap_sound mapChunk_545222 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_544662_001121_facts :
    MapFacts mapNode_544662_001121 1121 114487 :=
  map_facts_branch
    mapChunk_544662
    mapChunk_545222
    560 561 114487
    mapChunk_544662_facts
    mapChunk_545222_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_545783_facts :
    MapFacts mapChunk_545783 560 114487 :=
  checkMap_sound mapChunk_545783 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_546343_facts :
    MapFacts mapChunk_546343 561 114487 :=
  checkMap_sound mapChunk_546343 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_545783_001121_facts :
    MapFacts mapNode_545783_001121 1121 114487 :=
  map_facts_branch
    mapChunk_545783
    mapChunk_546343
    560 561 114487
    mapChunk_545783_facts
    mapChunk_546343_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_544662_002242_facts :
    MapFacts mapNode_544662_002242 2242 114487 :=
  map_facts_branch
    mapNode_544662_001121
    mapNode_545783_001121
    1121 1121 114487
    mapNode_544662_001121_facts
    mapNode_545783_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_542421_004483_facts :
    MapFacts mapNode_542421_004483 4483 114487 :=
  map_facts_branch
    mapNode_542421_002241
    mapNode_544662_002242
    2241 2242 114487
    mapNode_542421_002241_facts
    mapNode_544662_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_537939_008965_facts :
    MapFacts mapNode_537939_008965 8965 114487 :=
  map_facts_branch
    mapNode_537939_004482
    mapNode_542421_004483
    4482 4483 114487
    mapNode_537939_004482_facts
    mapNode_542421_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_546904_facts :
    MapFacts mapChunk_546904 560 114487 :=
  checkMap_sound mapChunk_546904 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_547464_facts :
    MapFacts mapChunk_547464 560 114487 :=
  checkMap_sound mapChunk_547464 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_546904_001120_facts :
    MapFacts mapNode_546904_001120 1120 114487 :=
  map_facts_branch
    mapChunk_546904
    mapChunk_547464
    560 560 114487
    mapChunk_546904_facts
    mapChunk_547464_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_548024_facts :
    MapFacts mapChunk_548024 560 114487 :=
  checkMap_sound mapChunk_548024 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_548584_facts :
    MapFacts mapChunk_548584 561 114487 :=
  checkMap_sound mapChunk_548584 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_548024_001121_facts :
    MapFacts mapNode_548024_001121 1121 114487 :=
  map_facts_branch
    mapChunk_548024
    mapChunk_548584
    560 561 114487
    mapChunk_548024_facts
    mapChunk_548584_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_546904_002241_facts :
    MapFacts mapNode_546904_002241 2241 114487 :=
  map_facts_branch
    mapNode_546904_001120
    mapNode_548024_001121
    1120 1121 114487
    mapNode_546904_001120_facts
    mapNode_548024_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_549145_facts :
    MapFacts mapChunk_549145 560 114487 :=
  checkMap_sound mapChunk_549145 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_549705_facts :
    MapFacts mapChunk_549705 561 114487 :=
  checkMap_sound mapChunk_549705 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_549145_001121_facts :
    MapFacts mapNode_549145_001121 1121 114487 :=
  map_facts_branch
    mapChunk_549145
    mapChunk_549705
    560 561 114487
    mapChunk_549145_facts
    mapChunk_549705_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_550266_facts :
    MapFacts mapChunk_550266 560 114487 :=
  checkMap_sound mapChunk_550266 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_550826_facts :
    MapFacts mapChunk_550826 561 114487 :=
  checkMap_sound mapChunk_550826 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_550266_001121_facts :
    MapFacts mapNode_550266_001121 1121 114487 :=
  map_facts_branch
    mapChunk_550266
    mapChunk_550826
    560 561 114487
    mapChunk_550266_facts
    mapChunk_550826_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_549145_002242_facts :
    MapFacts mapNode_549145_002242 2242 114487 :=
  map_facts_branch
    mapNode_549145_001121
    mapNode_550266_001121
    1121 1121 114487
    mapNode_549145_001121_facts
    mapNode_550266_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_546904_004483_facts :
    MapFacts mapNode_546904_004483 4483 114487 :=
  map_facts_branch
    mapNode_546904_002241
    mapNode_549145_002242
    2241 2242 114487
    mapNode_546904_002241_facts
    mapNode_549145_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_551387_facts :
    MapFacts mapChunk_551387 560 114487 :=
  checkMap_sound mapChunk_551387 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_551947_facts :
    MapFacts mapChunk_551947 560 114487 :=
  checkMap_sound mapChunk_551947 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_551387_001120_facts :
    MapFacts mapNode_551387_001120 1120 114487 :=
  map_facts_branch
    mapChunk_551387
    mapChunk_551947
    560 560 114487
    mapChunk_551387_facts
    mapChunk_551947_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_552507_facts :
    MapFacts mapChunk_552507 560 114487 :=
  checkMap_sound mapChunk_552507 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_553067_facts :
    MapFacts mapChunk_553067 561 114487 :=
  checkMap_sound mapChunk_553067 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_552507_001121_facts :
    MapFacts mapNode_552507_001121 1121 114487 :=
  map_facts_branch
    mapChunk_552507
    mapChunk_553067
    560 561 114487
    mapChunk_552507_facts
    mapChunk_553067_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_551387_002241_facts :
    MapFacts mapNode_551387_002241 2241 114487 :=
  map_facts_branch
    mapNode_551387_001120
    mapNode_552507_001121
    1120 1121 114487
    mapNode_551387_001120_facts
    mapNode_552507_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_553628_facts :
    MapFacts mapChunk_553628 560 114487 :=
  checkMap_sound mapChunk_553628 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_554188_facts :
    MapFacts mapChunk_554188 561 114487 :=
  checkMap_sound mapChunk_554188 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_553628_001121_facts :
    MapFacts mapNode_553628_001121 1121 114487 :=
  map_facts_branch
    mapChunk_553628
    mapChunk_554188
    560 561 114487
    mapChunk_553628_facts
    mapChunk_554188_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_554749_facts :
    MapFacts mapChunk_554749 560 114487 :=
  checkMap_sound mapChunk_554749 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_555309_facts :
    MapFacts mapChunk_555309 561 114487 :=
  checkMap_sound mapChunk_555309 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t992\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_554749_001121_facts :
    MapFacts mapNode_554749_001121 1121 114487 :=
  map_facts_branch
    mapChunk_554749
    mapChunk_555309
    560 561 114487
    mapChunk_554749_facts
    mapChunk_555309_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_553628_002242_facts :
    MapFacts mapNode_553628_002242 2242 114487 :=
  map_facts_branch
    mapNode_553628_001121
    mapNode_554749_001121
    1121 1121 114487
    mapNode_553628_001121_facts
    mapNode_554749_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_551387_004483_facts :
    MapFacts mapNode_551387_004483 4483 114487 :=
  map_facts_branch
    mapNode_551387_002241
    mapNode_553628_002242
    2241 2242 114487
    mapNode_551387_002241_facts
    mapNode_553628_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_546904_008966_facts :
    MapFacts mapNode_546904_008966 8966 114487 :=
  map_facts_branch
    mapNode_546904_004483
    mapNode_551387_004483
    4483 4483 114487
    mapNode_546904_004483_facts
    mapNode_551387_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_537939_017931_facts :
    MapFacts mapNode_537939_017931 17931 114487 :=
  map_facts_branch
    mapNode_537939_008965
    mapNode_546904_008966
    8965 8966 114487
    mapNode_537939_008965_facts
    mapNode_546904_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_555870_facts :
    MapFacts mapChunk_555870 560 114487 :=
  checkMap_sound mapChunk_555870 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_556430_facts :
    MapFacts mapChunk_556430 560 114487 :=
  checkMap_sound mapChunk_556430 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_555870_001120_facts :
    MapFacts mapNode_555870_001120 1120 114487 :=
  map_facts_branch
    mapChunk_555870
    mapChunk_556430
    560 560 114487
    mapChunk_555870_facts
    mapChunk_556430_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_556990_facts :
    MapFacts mapChunk_556990 560 114487 :=
  checkMap_sound mapChunk_556990 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_557550_facts :
    MapFacts mapChunk_557550 561 114487 :=
  checkMap_sound mapChunk_557550 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_556990_001121_facts :
    MapFacts mapNode_556990_001121 1121 114487 :=
  map_facts_branch
    mapChunk_556990
    mapChunk_557550
    560 561 114487
    mapChunk_556990_facts
    mapChunk_557550_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_555870_002241_facts :
    MapFacts mapNode_555870_002241 2241 114487 :=
  map_facts_branch
    mapNode_555870_001120
    mapNode_556990_001121
    1120 1121 114487
    mapNode_555870_001120_facts
    mapNode_556990_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_558111_facts :
    MapFacts mapChunk_558111 560 114487 :=
  checkMap_sound mapChunk_558111 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_558671_facts :
    MapFacts mapChunk_558671 561 114487 :=
  checkMap_sound mapChunk_558671 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_558111_001121_facts :
    MapFacts mapNode_558111_001121 1121 114487 :=
  map_facts_branch
    mapChunk_558111
    mapChunk_558671
    560 561 114487
    mapChunk_558111_facts
    mapChunk_558671_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_559232_facts :
    MapFacts mapChunk_559232 560 114487 :=
  checkMap_sound mapChunk_559232 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_559792_facts :
    MapFacts mapChunk_559792 561 114487 :=
  checkMap_sound mapChunk_559792 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_559232_001121_facts :
    MapFacts mapNode_559232_001121 1121 114487 :=
  map_facts_branch
    mapChunk_559232
    mapChunk_559792
    560 561 114487
    mapChunk_559232_facts
    mapChunk_559792_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_558111_002242_facts :
    MapFacts mapNode_558111_002242 2242 114487 :=
  map_facts_branch
    mapNode_558111_001121
    mapNode_559232_001121
    1121 1121 114487
    mapNode_558111_001121_facts
    mapNode_559232_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_555870_004483_facts :
    MapFacts mapNode_555870_004483 4483 114487 :=
  map_facts_branch
    mapNode_555870_002241
    mapNode_558111_002242
    2241 2242 114487
    mapNode_555870_002241_facts
    mapNode_558111_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_560353_facts :
    MapFacts mapChunk_560353 560 114487 :=
  checkMap_sound mapChunk_560353 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_560913_facts :
    MapFacts mapChunk_560913 560 114487 :=
  checkMap_sound mapChunk_560913 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_560353_001120_facts :
    MapFacts mapNode_560353_001120 1120 114487 :=
  map_facts_branch
    mapChunk_560353
    mapChunk_560913
    560 560 114487
    mapChunk_560353_facts
    mapChunk_560913_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_561473_facts :
    MapFacts mapChunk_561473 560 114487 :=
  checkMap_sound mapChunk_561473 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_562033_facts :
    MapFacts mapChunk_562033 561 114487 :=
  checkMap_sound mapChunk_562033 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_561473_001121_facts :
    MapFacts mapNode_561473_001121 1121 114487 :=
  map_facts_branch
    mapChunk_561473
    mapChunk_562033
    560 561 114487
    mapChunk_561473_facts
    mapChunk_562033_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_560353_002241_facts :
    MapFacts mapNode_560353_002241 2241 114487 :=
  map_facts_branch
    mapNode_560353_001120
    mapNode_561473_001121
    1120 1121 114487
    mapNode_560353_001120_facts
    mapNode_561473_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_562594_facts :
    MapFacts mapChunk_562594 560 114487 :=
  checkMap_sound mapChunk_562594 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_563154_facts :
    MapFacts mapChunk_563154 561 114487 :=
  checkMap_sound mapChunk_563154 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_562594_001121_facts :
    MapFacts mapNode_562594_001121 1121 114487 :=
  map_facts_branch
    mapChunk_562594
    mapChunk_563154
    560 561 114487
    mapChunk_562594_facts
    mapChunk_563154_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_563715_facts :
    MapFacts mapChunk_563715 560 114487 :=
  checkMap_sound mapChunk_563715 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_564275_facts :
    MapFacts mapChunk_564275 561 114487 :=
  checkMap_sound mapChunk_564275 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_563715_001121_facts :
    MapFacts mapNode_563715_001121 1121 114487 :=
  map_facts_branch
    mapChunk_563715
    mapChunk_564275
    560 561 114487
    mapChunk_563715_facts
    mapChunk_564275_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_562594_002242_facts :
    MapFacts mapNode_562594_002242 2242 114487 :=
  map_facts_branch
    mapNode_562594_001121
    mapNode_563715_001121
    1121 1121 114487
    mapNode_562594_001121_facts
    mapNode_563715_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_560353_004483_facts :
    MapFacts mapNode_560353_004483 4483 114487 :=
  map_facts_branch
    mapNode_560353_002241
    mapNode_562594_002242
    2241 2242 114487
    mapNode_560353_002241_facts
    mapNode_562594_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_555870_008966_facts :
    MapFacts mapNode_555870_008966 8966 114487 :=
  map_facts_branch
    mapNode_555870_004483
    mapNode_560353_004483
    4483 4483 114487
    mapNode_555870_004483_facts
    mapNode_560353_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_564836_facts :
    MapFacts mapChunk_564836 560 114487 :=
  checkMap_sound mapChunk_564836 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_565396_facts :
    MapFacts mapChunk_565396 560 114487 :=
  checkMap_sound mapChunk_565396 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_564836_001120_facts :
    MapFacts mapNode_564836_001120 1120 114487 :=
  map_facts_branch
    mapChunk_564836
    mapChunk_565396
    560 560 114487
    mapChunk_564836_facts
    mapChunk_565396_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_565956_facts :
    MapFacts mapChunk_565956 560 114487 :=
  checkMap_sound mapChunk_565956 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_566516_facts :
    MapFacts mapChunk_566516 561 114487 :=
  checkMap_sound mapChunk_566516 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_565956_001121_facts :
    MapFacts mapNode_565956_001121 1121 114487 :=
  map_facts_branch
    mapChunk_565956
    mapChunk_566516
    560 561 114487
    mapChunk_565956_facts
    mapChunk_566516_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_564836_002241_facts :
    MapFacts mapNode_564836_002241 2241 114487 :=
  map_facts_branch
    mapNode_564836_001120
    mapNode_565956_001121
    1120 1121 114487
    mapNode_564836_001120_facts
    mapNode_565956_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_567077_facts :
    MapFacts mapChunk_567077 560 114487 :=
  checkMap_sound mapChunk_567077 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_567637_facts :
    MapFacts mapChunk_567637 561 114487 :=
  checkMap_sound mapChunk_567637 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_567077_001121_facts :
    MapFacts mapNode_567077_001121 1121 114487 :=
  map_facts_branch
    mapChunk_567077
    mapChunk_567637
    560 561 114487
    mapChunk_567077_facts
    mapChunk_567637_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_568198_facts :
    MapFacts mapChunk_568198 560 114487 :=
  checkMap_sound mapChunk_568198 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_568758_facts :
    MapFacts mapChunk_568758 561 114487 :=
  checkMap_sound mapChunk_568758 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_568198_001121_facts :
    MapFacts mapNode_568198_001121 1121 114487 :=
  map_facts_branch
    mapChunk_568198
    mapChunk_568758
    560 561 114487
    mapChunk_568198_facts
    mapChunk_568758_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_567077_002242_facts :
    MapFacts mapNode_567077_002242 2242 114487 :=
  map_facts_branch
    mapNode_567077_001121
    mapNode_568198_001121
    1121 1121 114487
    mapNode_567077_001121_facts
    mapNode_568198_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_564836_004483_facts :
    MapFacts mapNode_564836_004483 4483 114487 :=
  map_facts_branch
    mapNode_564836_002241
    mapNode_567077_002242
    2241 2242 114487
    mapNode_564836_002241_facts
    mapNode_567077_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_569319_facts :
    MapFacts mapChunk_569319 560 114487 :=
  checkMap_sound mapChunk_569319 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_569879_facts :
    MapFacts mapChunk_569879 560 114487 :=
  checkMap_sound mapChunk_569879 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_569319_001120_facts :
    MapFacts mapNode_569319_001120 1120 114487 :=
  map_facts_branch
    mapChunk_569319
    mapChunk_569879
    560 560 114487
    mapChunk_569319_facts
    mapChunk_569879_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_570439_facts :
    MapFacts mapChunk_570439 560 114487 :=
  checkMap_sound mapChunk_570439 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_570999_facts :
    MapFacts mapChunk_570999 561 114487 :=
  checkMap_sound mapChunk_570999 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_570439_001121_facts :
    MapFacts mapNode_570439_001121 1121 114487 :=
  map_facts_branch
    mapChunk_570439
    mapChunk_570999
    560 561 114487
    mapChunk_570439_facts
    mapChunk_570999_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_569319_002241_facts :
    MapFacts mapNode_569319_002241 2241 114487 :=
  map_facts_branch
    mapNode_569319_001120
    mapNode_570439_001121
    1120 1121 114487
    mapNode_569319_001120_facts
    mapNode_570439_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_571560_facts :
    MapFacts mapChunk_571560 560 114487 :=
  checkMap_sound mapChunk_571560 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_572120_facts :
    MapFacts mapChunk_572120 561 114487 :=
  checkMap_sound mapChunk_572120 114487 561 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_571560_001121_facts :
    MapFacts mapNode_571560_001121 1121 114487 :=
  map_facts_branch
    mapChunk_571560
    mapChunk_572120
    560 561 114487
    mapChunk_571560_facts
    mapChunk_572120_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_572681_facts :
    MapFacts mapChunk_572681 560 114487 :=
  checkMap_sound mapChunk_572681 114487 560 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_573241_facts :
    MapFacts mapChunk_573241 561 114487 :=
  checkMap_sound mapChunk_573241 114487 561 (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t1024\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_572681_001121_facts :
    MapFacts mapNode_572681_001121 1121 114487 :=
  map_facts_branch
    mapChunk_572681
    mapChunk_573241
    560 561 114487
    mapChunk_572681_facts
    mapChunk_573241_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_571560_002242_facts :
    MapFacts mapNode_571560_002242 2242 114487 :=
  map_facts_branch
    mapNode_571560_001121
    mapNode_572681_001121
    1121 1121 114487
    mapNode_571560_001121_facts
    mapNode_572681_001121_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_569319_004483_facts :
    MapFacts mapNode_569319_004483 4483 114487 :=
  map_facts_branch
    mapNode_569319_002241
    mapNode_571560_002242
    2241 2242 114487
    mapNode_569319_002241_facts
    mapNode_571560_002242_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_564836_008966_facts :
    MapFacts mapNode_564836_008966 8966 114487 :=
  map_facts_branch
    mapNode_564836_004483
    mapNode_569319_004483
    4483 4483 114487
    mapNode_564836_004483_facts
    mapNode_569319_004483_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_555870_017932_facts :
    MapFacts mapNode_555870_017932 17932 114487 :=
  map_facts_branch
    mapNode_555870_008966
    mapNode_564836_008966
    8966 8966 114487
    mapNode_555870_008966_facts
    mapNode_564836_008966_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_537939_035863_facts :
    MapFacts mapNode_537939_035863 35863 114487 :=
  map_facts_branch
    mapNode_537939_017931
    mapNode_555870_017932
    17931 17932 114487
    mapNode_537939_017931_facts
    mapNode_555870_017932_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_502076_071726_facts :
    MapFacts mapNode_502076_071726 71726 114487 :=
  map_facts_branch
    mapNode_502076_035863
    mapNode_537939_035863
    35863 35863 114487
    mapNode_502076_035863_facts
    mapNode_537939_035863_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_430351_143451_facts :
    MapFacts mapNode_430351_143451 143451 114487 :=
  map_facts_branch
    mapNode_430351_071725
    mapNode_502076_071726
    71725 71726 114487
    mapNode_430351_071725_facts
    mapNode_502076_071726_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_286901_286901_facts :
    MapFacts mapNode_286901_286901 286901 114487 :=
  map_facts_branch
    mapNode_286901_143450
    mapNode_430351_143451
    143450 143451 114487
    mapNode_286901_143450_facts
    mapNode_430351_143451_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_000000_573802_facts :
    MapFacts mapNode_000000_573802 573802 114487 :=
  map_facts_branch
    mapNode_000000_286901
    mapNode_286901_286901
    286901 286901 114487
    mapNode_000000_286901_facts
    mapNode_286901_286901_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem map_facts :
    MapFacts mapTree 573802 114487 :=
  mapNode_000000_573802_facts
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t1024\t{now}"
      handle.flush
theorem map_count : mapTree.count = 573802 := map_facts.1

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Complete body class map count checked"
