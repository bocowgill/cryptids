module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.MapPrelude

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_000000_count :
    mapChunk_000000.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_000560_count :
    mapChunk_000560.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_000000_001120_count :
    mapNode_000000_001120.count = 1120 :=
  map_count_branch
    mapChunk_000000
    mapChunk_000560
    560 560
    mapChunk_000000_count
    mapChunk_000560_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_001120_count :
    mapChunk_001120.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_001680_count :
    mapChunk_001680.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_001120_001121_count :
    mapNode_001120_001121.count = 1121 :=
  map_count_branch
    mapChunk_001120
    mapChunk_001680
    560 561
    mapChunk_001120_count
    mapChunk_001680_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_000000_002241_count :
    mapNode_000000_002241.count = 2241 :=
  map_count_branch
    mapNode_000000_001120
    mapNode_001120_001121
    1120 1121
    mapNode_000000_001120_count
    mapNode_001120_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_002241_count :
    mapChunk_002241.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_002801_count :
    mapChunk_002801.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_002241_001120_count :
    mapNode_002241_001120.count = 1120 :=
  map_count_branch
    mapChunk_002241
    mapChunk_002801
    560 560
    mapChunk_002241_count
    mapChunk_002801_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_003361_count :
    mapChunk_003361.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_003921_count :
    mapChunk_003921.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_003361_001121_count :
    mapNode_003361_001121.count = 1121 :=
  map_count_branch
    mapChunk_003361
    mapChunk_003921
    560 561
    mapChunk_003361_count
    mapChunk_003921_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_002241_002241_count :
    mapNode_002241_002241.count = 2241 :=
  map_count_branch
    mapNode_002241_001120
    mapNode_003361_001121
    1120 1121
    mapNode_002241_001120_count
    mapNode_003361_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_000000_004482_count :
    mapNode_000000_004482.count = 4482 :=
  map_count_branch
    mapNode_000000_002241
    mapNode_002241_002241
    2241 2241
    mapNode_000000_002241_count
    mapNode_002241_002241_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_004482_count :
    mapChunk_004482.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_005042_count :
    mapChunk_005042.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_004482_001120_count :
    mapNode_004482_001120.count = 1120 :=
  map_count_branch
    mapChunk_004482
    mapChunk_005042
    560 560
    mapChunk_004482_count
    mapChunk_005042_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_005602_count :
    mapChunk_005602.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_006162_count :
    mapChunk_006162.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_005602_001121_count :
    mapNode_005602_001121.count = 1121 :=
  map_count_branch
    mapChunk_005602
    mapChunk_006162
    560 561
    mapChunk_005602_count
    mapChunk_006162_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_004482_002241_count :
    mapNode_004482_002241.count = 2241 :=
  map_count_branch
    mapNode_004482_001120
    mapNode_005602_001121
    1120 1121
    mapNode_004482_001120_count
    mapNode_005602_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_006723_count :
    mapChunk_006723.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_007283_count :
    mapChunk_007283.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_006723_001121_count :
    mapNode_006723_001121.count = 1121 :=
  map_count_branch
    mapChunk_006723
    mapChunk_007283
    560 561
    mapChunk_006723_count
    mapChunk_007283_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_007844_count :
    mapChunk_007844.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_008404_count :
    mapChunk_008404.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_007844_001121_count :
    mapNode_007844_001121.count = 1121 :=
  map_count_branch
    mapChunk_007844
    mapChunk_008404
    560 561
    mapChunk_007844_count
    mapChunk_008404_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_006723_002242_count :
    mapNode_006723_002242.count = 2242 :=
  map_count_branch
    mapNode_006723_001121
    mapNode_007844_001121
    1121 1121
    mapNode_006723_001121_count
    mapNode_007844_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_004482_004483_count :
    mapNode_004482_004483.count = 4483 :=
  map_count_branch
    mapNode_004482_002241
    mapNode_006723_002242
    2241 2242
    mapNode_004482_002241_count
    mapNode_006723_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_000000_008965_count :
    mapNode_000000_008965.count = 8965 :=
  map_count_branch
    mapNode_000000_004482
    mapNode_004482_004483
    4482 4483
    mapNode_000000_004482_count
    mapNode_004482_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_008965_count :
    mapChunk_008965.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_009525_count :
    mapChunk_009525.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_008965_001120_count :
    mapNode_008965_001120.count = 1120 :=
  map_count_branch
    mapChunk_008965
    mapChunk_009525
    560 560
    mapChunk_008965_count
    mapChunk_009525_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_010085_count :
    mapChunk_010085.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_010645_count :
    mapChunk_010645.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_010085_001121_count :
    mapNode_010085_001121.count = 1121 :=
  map_count_branch
    mapChunk_010085
    mapChunk_010645
    560 561
    mapChunk_010085_count
    mapChunk_010645_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_008965_002241_count :
    mapNode_008965_002241.count = 2241 :=
  map_count_branch
    mapNode_008965_001120
    mapNode_010085_001121
    1120 1121
    mapNode_008965_001120_count
    mapNode_010085_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_011206_count :
    mapChunk_011206.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_011766_count :
    mapChunk_011766.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_011206_001121_count :
    mapNode_011206_001121.count = 1121 :=
  map_count_branch
    mapChunk_011206
    mapChunk_011766
    560 561
    mapChunk_011206_count
    mapChunk_011766_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_012327_count :
    mapChunk_012327.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_012887_count :
    mapChunk_012887.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_012327_001121_count :
    mapNode_012327_001121.count = 1121 :=
  map_count_branch
    mapChunk_012327
    mapChunk_012887
    560 561
    mapChunk_012327_count
    mapChunk_012887_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_011206_002242_count :
    mapNode_011206_002242.count = 2242 :=
  map_count_branch
    mapNode_011206_001121
    mapNode_012327_001121
    1121 1121
    mapNode_011206_001121_count
    mapNode_012327_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_008965_004483_count :
    mapNode_008965_004483.count = 4483 :=
  map_count_branch
    mapNode_008965_002241
    mapNode_011206_002242
    2241 2242
    mapNode_008965_002241_count
    mapNode_011206_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_013448_count :
    mapChunk_013448.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_014008_count :
    mapChunk_014008.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_013448_001120_count :
    mapNode_013448_001120.count = 1120 :=
  map_count_branch
    mapChunk_013448
    mapChunk_014008
    560 560
    mapChunk_013448_count
    mapChunk_014008_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_014568_count :
    mapChunk_014568.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_015128_count :
    mapChunk_015128.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_014568_001121_count :
    mapNode_014568_001121.count = 1121 :=
  map_count_branch
    mapChunk_014568
    mapChunk_015128
    560 561
    mapChunk_014568_count
    mapChunk_015128_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_013448_002241_count :
    mapNode_013448_002241.count = 2241 :=
  map_count_branch
    mapNode_013448_001120
    mapNode_014568_001121
    1120 1121
    mapNode_013448_001120_count
    mapNode_014568_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_015689_count :
    mapChunk_015689.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_016249_count :
    mapChunk_016249.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_015689_001121_count :
    mapNode_015689_001121.count = 1121 :=
  map_count_branch
    mapChunk_015689
    mapChunk_016249
    560 561
    mapChunk_015689_count
    mapChunk_016249_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_016810_count :
    mapChunk_016810.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_017370_count :
    mapChunk_017370.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_016810_001121_count :
    mapNode_016810_001121.count = 1121 :=
  map_count_branch
    mapChunk_016810
    mapChunk_017370
    560 561
    mapChunk_016810_count
    mapChunk_017370_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_015689_002242_count :
    mapNode_015689_002242.count = 2242 :=
  map_count_branch
    mapNode_015689_001121
    mapNode_016810_001121
    1121 1121
    mapNode_015689_001121_count
    mapNode_016810_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_013448_004483_count :
    mapNode_013448_004483.count = 4483 :=
  map_count_branch
    mapNode_013448_002241
    mapNode_015689_002242
    2241 2242
    mapNode_013448_002241_count
    mapNode_015689_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_008965_008966_count :
    mapNode_008965_008966.count = 8966 :=
  map_count_branch
    mapNode_008965_004483
    mapNode_013448_004483
    4483 4483
    mapNode_008965_004483_count
    mapNode_013448_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_000000_017931_count :
    mapNode_000000_017931.count = 17931 :=
  map_count_branch
    mapNode_000000_008965
    mapNode_008965_008966
    8965 8966
    mapNode_000000_008965_count
    mapNode_008965_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_017931_count :
    mapChunk_017931.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_018491_count :
    mapChunk_018491.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_017931_001120_count :
    mapNode_017931_001120.count = 1120 :=
  map_count_branch
    mapChunk_017931
    mapChunk_018491
    560 560
    mapChunk_017931_count
    mapChunk_018491_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_019051_count :
    mapChunk_019051.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_019611_count :
    mapChunk_019611.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_019051_001121_count :
    mapNode_019051_001121.count = 1121 :=
  map_count_branch
    mapChunk_019051
    mapChunk_019611
    560 561
    mapChunk_019051_count
    mapChunk_019611_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_017931_002241_count :
    mapNode_017931_002241.count = 2241 :=
  map_count_branch
    mapNode_017931_001120
    mapNode_019051_001121
    1120 1121
    mapNode_017931_001120_count
    mapNode_019051_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_020172_count :
    mapChunk_020172.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_020732_count :
    mapChunk_020732.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_020172_001120_count :
    mapNode_020172_001120.count = 1120 :=
  map_count_branch
    mapChunk_020172
    mapChunk_020732
    560 560
    mapChunk_020172_count
    mapChunk_020732_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_021292_count :
    mapChunk_021292.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_021852_count :
    mapChunk_021852.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_021292_001121_count :
    mapNode_021292_001121.count = 1121 :=
  map_count_branch
    mapChunk_021292
    mapChunk_021852
    560 561
    mapChunk_021292_count
    mapChunk_021852_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_020172_002241_count :
    mapNode_020172_002241.count = 2241 :=
  map_count_branch
    mapNode_020172_001120
    mapNode_021292_001121
    1120 1121
    mapNode_020172_001120_count
    mapNode_021292_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_017931_004482_count :
    mapNode_017931_004482.count = 4482 :=
  map_count_branch
    mapNode_017931_002241
    mapNode_020172_002241
    2241 2241
    mapNode_017931_002241_count
    mapNode_020172_002241_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_022413_count :
    mapChunk_022413.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_022973_count :
    mapChunk_022973.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_022413_001120_count :
    mapNode_022413_001120.count = 1120 :=
  map_count_branch
    mapChunk_022413
    mapChunk_022973
    560 560
    mapChunk_022413_count
    mapChunk_022973_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_023533_count :
    mapChunk_023533.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_024093_count :
    mapChunk_024093.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_023533_001121_count :
    mapNode_023533_001121.count = 1121 :=
  map_count_branch
    mapChunk_023533
    mapChunk_024093
    560 561
    mapChunk_023533_count
    mapChunk_024093_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_022413_002241_count :
    mapNode_022413_002241.count = 2241 :=
  map_count_branch
    mapNode_022413_001120
    mapNode_023533_001121
    1120 1121
    mapNode_022413_001120_count
    mapNode_023533_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_024654_count :
    mapChunk_024654.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_025214_count :
    mapChunk_025214.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_024654_001121_count :
    mapNode_024654_001121.count = 1121 :=
  map_count_branch
    mapChunk_024654
    mapChunk_025214
    560 561
    mapChunk_024654_count
    mapChunk_025214_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_025775_count :
    mapChunk_025775.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_026335_count :
    mapChunk_026335.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_025775_001121_count :
    mapNode_025775_001121.count = 1121 :=
  map_count_branch
    mapChunk_025775
    mapChunk_026335
    560 561
    mapChunk_025775_count
    mapChunk_026335_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_024654_002242_count :
    mapNode_024654_002242.count = 2242 :=
  map_count_branch
    mapNode_024654_001121
    mapNode_025775_001121
    1121 1121
    mapNode_024654_001121_count
    mapNode_025775_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_022413_004483_count :
    mapNode_022413_004483.count = 4483 :=
  map_count_branch
    mapNode_022413_002241
    mapNode_024654_002242
    2241 2242
    mapNode_022413_002241_count
    mapNode_024654_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_017931_008965_count :
    mapNode_017931_008965.count = 8965 :=
  map_count_branch
    mapNode_017931_004482
    mapNode_022413_004483
    4482 4483
    mapNode_017931_004482_count
    mapNode_022413_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_026896_count :
    mapChunk_026896.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_027456_count :
    mapChunk_027456.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_026896_001120_count :
    mapNode_026896_001120.count = 1120 :=
  map_count_branch
    mapChunk_026896
    mapChunk_027456
    560 560
    mapChunk_026896_count
    mapChunk_027456_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_028016_count :
    mapChunk_028016.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_028576_count :
    mapChunk_028576.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_028016_001121_count :
    mapNode_028016_001121.count = 1121 :=
  map_count_branch
    mapChunk_028016
    mapChunk_028576
    560 561
    mapChunk_028016_count
    mapChunk_028576_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_026896_002241_count :
    mapNode_026896_002241.count = 2241 :=
  map_count_branch
    mapNode_026896_001120
    mapNode_028016_001121
    1120 1121
    mapNode_026896_001120_count
    mapNode_028016_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_029137_count :
    mapChunk_029137.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_029697_count :
    mapChunk_029697.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_029137_001121_count :
    mapNode_029137_001121.count = 1121 :=
  map_count_branch
    mapChunk_029137
    mapChunk_029697
    560 561
    mapChunk_029137_count
    mapChunk_029697_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_030258_count :
    mapChunk_030258.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_030818_count :
    mapChunk_030818.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_030258_001121_count :
    mapNode_030258_001121.count = 1121 :=
  map_count_branch
    mapChunk_030258
    mapChunk_030818
    560 561
    mapChunk_030258_count
    mapChunk_030818_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_029137_002242_count :
    mapNode_029137_002242.count = 2242 :=
  map_count_branch
    mapNode_029137_001121
    mapNode_030258_001121
    1121 1121
    mapNode_029137_001121_count
    mapNode_030258_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_026896_004483_count :
    mapNode_026896_004483.count = 4483 :=
  map_count_branch
    mapNode_026896_002241
    mapNode_029137_002242
    2241 2242
    mapNode_026896_002241_count
    mapNode_029137_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_031379_count :
    mapChunk_031379.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_031939_count :
    mapChunk_031939.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_031379_001120_count :
    mapNode_031379_001120.count = 1120 :=
  map_count_branch
    mapChunk_031379
    mapChunk_031939
    560 560
    mapChunk_031379_count
    mapChunk_031939_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_032499_count :
    mapChunk_032499.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_033059_count :
    mapChunk_033059.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_032499_001121_count :
    mapNode_032499_001121.count = 1121 :=
  map_count_branch
    mapChunk_032499
    mapChunk_033059
    560 561
    mapChunk_032499_count
    mapChunk_033059_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_031379_002241_count :
    mapNode_031379_002241.count = 2241 :=
  map_count_branch
    mapNode_031379_001120
    mapNode_032499_001121
    1120 1121
    mapNode_031379_001120_count
    mapNode_032499_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_033620_count :
    mapChunk_033620.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_034180_count :
    mapChunk_034180.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_033620_001121_count :
    mapNode_033620_001121.count = 1121 :=
  map_count_branch
    mapChunk_033620
    mapChunk_034180
    560 561
    mapChunk_033620_count
    mapChunk_034180_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_034741_count :
    mapChunk_034741.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_035301_count :
    mapChunk_035301.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_034741_001121_count :
    mapNode_034741_001121.count = 1121 :=
  map_count_branch
    mapChunk_034741
    mapChunk_035301
    560 561
    mapChunk_034741_count
    mapChunk_035301_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_033620_002242_count :
    mapNode_033620_002242.count = 2242 :=
  map_count_branch
    mapNode_033620_001121
    mapNode_034741_001121
    1121 1121
    mapNode_033620_001121_count
    mapNode_034741_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_031379_004483_count :
    mapNode_031379_004483.count = 4483 :=
  map_count_branch
    mapNode_031379_002241
    mapNode_033620_002242
    2241 2242
    mapNode_031379_002241_count
    mapNode_033620_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_026896_008966_count :
    mapNode_026896_008966.count = 8966 :=
  map_count_branch
    mapNode_026896_004483
    mapNode_031379_004483
    4483 4483
    mapNode_026896_004483_count
    mapNode_031379_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_017931_017931_count :
    mapNode_017931_017931.count = 17931 :=
  map_count_branch
    mapNode_017931_008965
    mapNode_026896_008966
    8965 8966
    mapNode_017931_008965_count
    mapNode_026896_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_000000_035862_count :
    mapNode_000000_035862.count = 35862 :=
  map_count_branch
    mapNode_000000_017931
    mapNode_017931_017931
    17931 17931
    mapNode_000000_017931_count
    mapNode_017931_017931_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_035862_count :
    mapChunk_035862.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_036422_count :
    mapChunk_036422.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_035862_001120_count :
    mapNode_035862_001120.count = 1120 :=
  map_count_branch
    mapChunk_035862
    mapChunk_036422
    560 560
    mapChunk_035862_count
    mapChunk_036422_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_036982_count :
    mapChunk_036982.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_037542_count :
    mapChunk_037542.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_036982_001121_count :
    mapNode_036982_001121.count = 1121 :=
  map_count_branch
    mapChunk_036982
    mapChunk_037542
    560 561
    mapChunk_036982_count
    mapChunk_037542_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_035862_002241_count :
    mapNode_035862_002241.count = 2241 :=
  map_count_branch
    mapNode_035862_001120
    mapNode_036982_001121
    1120 1121
    mapNode_035862_001120_count
    mapNode_036982_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_038103_count :
    mapChunk_038103.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_038663_count :
    mapChunk_038663.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_038103_001120_count :
    mapNode_038103_001120.count = 1120 :=
  map_count_branch
    mapChunk_038103
    mapChunk_038663
    560 560
    mapChunk_038103_count
    mapChunk_038663_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_039223_count :
    mapChunk_039223.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_039783_count :
    mapChunk_039783.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_039223_001121_count :
    mapNode_039223_001121.count = 1121 :=
  map_count_branch
    mapChunk_039223
    mapChunk_039783
    560 561
    mapChunk_039223_count
    mapChunk_039783_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_038103_002241_count :
    mapNode_038103_002241.count = 2241 :=
  map_count_branch
    mapNode_038103_001120
    mapNode_039223_001121
    1120 1121
    mapNode_038103_001120_count
    mapNode_039223_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_035862_004482_count :
    mapNode_035862_004482.count = 4482 :=
  map_count_branch
    mapNode_035862_002241
    mapNode_038103_002241
    2241 2241
    mapNode_035862_002241_count
    mapNode_038103_002241_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_040344_count :
    mapChunk_040344.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_040904_count :
    mapChunk_040904.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_040344_001120_count :
    mapNode_040344_001120.count = 1120 :=
  map_count_branch
    mapChunk_040344
    mapChunk_040904
    560 560
    mapChunk_040344_count
    mapChunk_040904_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_041464_count :
    mapChunk_041464.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_042024_count :
    mapChunk_042024.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_041464_001121_count :
    mapNode_041464_001121.count = 1121 :=
  map_count_branch
    mapChunk_041464
    mapChunk_042024
    560 561
    mapChunk_041464_count
    mapChunk_042024_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_040344_002241_count :
    mapNode_040344_002241.count = 2241 :=
  map_count_branch
    mapNode_040344_001120
    mapNode_041464_001121
    1120 1121
    mapNode_040344_001120_count
    mapNode_041464_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_042585_count :
    mapChunk_042585.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_043145_count :
    mapChunk_043145.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_042585_001121_count :
    mapNode_042585_001121.count = 1121 :=
  map_count_branch
    mapChunk_042585
    mapChunk_043145
    560 561
    mapChunk_042585_count
    mapChunk_043145_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_043706_count :
    mapChunk_043706.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_044266_count :
    mapChunk_044266.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_043706_001121_count :
    mapNode_043706_001121.count = 1121 :=
  map_count_branch
    mapChunk_043706
    mapChunk_044266
    560 561
    mapChunk_043706_count
    mapChunk_044266_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_042585_002242_count :
    mapNode_042585_002242.count = 2242 :=
  map_count_branch
    mapNode_042585_001121
    mapNode_043706_001121
    1121 1121
    mapNode_042585_001121_count
    mapNode_043706_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_040344_004483_count :
    mapNode_040344_004483.count = 4483 :=
  map_count_branch
    mapNode_040344_002241
    mapNode_042585_002242
    2241 2242
    mapNode_040344_002241_count
    mapNode_042585_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_035862_008965_count :
    mapNode_035862_008965.count = 8965 :=
  map_count_branch
    mapNode_035862_004482
    mapNode_040344_004483
    4482 4483
    mapNode_035862_004482_count
    mapNode_040344_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_044827_count :
    mapChunk_044827.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_045387_count :
    mapChunk_045387.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_044827_001120_count :
    mapNode_044827_001120.count = 1120 :=
  map_count_branch
    mapChunk_044827
    mapChunk_045387
    560 560
    mapChunk_044827_count
    mapChunk_045387_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_045947_count :
    mapChunk_045947.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_046507_count :
    mapChunk_046507.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_045947_001121_count :
    mapNode_045947_001121.count = 1121 :=
  map_count_branch
    mapChunk_045947
    mapChunk_046507
    560 561
    mapChunk_045947_count
    mapChunk_046507_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_044827_002241_count :
    mapNode_044827_002241.count = 2241 :=
  map_count_branch
    mapNode_044827_001120
    mapNode_045947_001121
    1120 1121
    mapNode_044827_001120_count
    mapNode_045947_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_047068_count :
    mapChunk_047068.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_047628_count :
    mapChunk_047628.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_047068_001121_count :
    mapNode_047068_001121.count = 1121 :=
  map_count_branch
    mapChunk_047068
    mapChunk_047628
    560 561
    mapChunk_047068_count
    mapChunk_047628_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_048189_count :
    mapChunk_048189.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_048749_count :
    mapChunk_048749.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_048189_001121_count :
    mapNode_048189_001121.count = 1121 :=
  map_count_branch
    mapChunk_048189
    mapChunk_048749
    560 561
    mapChunk_048189_count
    mapChunk_048749_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_047068_002242_count :
    mapNode_047068_002242.count = 2242 :=
  map_count_branch
    mapNode_047068_001121
    mapNode_048189_001121
    1121 1121
    mapNode_047068_001121_count
    mapNode_048189_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_044827_004483_count :
    mapNode_044827_004483.count = 4483 :=
  map_count_branch
    mapNode_044827_002241
    mapNode_047068_002242
    2241 2242
    mapNode_044827_002241_count
    mapNode_047068_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_049310_count :
    mapChunk_049310.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_049870_count :
    mapChunk_049870.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_049310_001120_count :
    mapNode_049310_001120.count = 1120 :=
  map_count_branch
    mapChunk_049310
    mapChunk_049870
    560 560
    mapChunk_049310_count
    mapChunk_049870_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_050430_count :
    mapChunk_050430.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_050990_count :
    mapChunk_050990.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_050430_001121_count :
    mapNode_050430_001121.count = 1121 :=
  map_count_branch
    mapChunk_050430
    mapChunk_050990
    560 561
    mapChunk_050430_count
    mapChunk_050990_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_049310_002241_count :
    mapNode_049310_002241.count = 2241 :=
  map_count_branch
    mapNode_049310_001120
    mapNode_050430_001121
    1120 1121
    mapNode_049310_001120_count
    mapNode_050430_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_051551_count :
    mapChunk_051551.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_052111_count :
    mapChunk_052111.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_051551_001121_count :
    mapNode_051551_001121.count = 1121 :=
  map_count_branch
    mapChunk_051551
    mapChunk_052111
    560 561
    mapChunk_051551_count
    mapChunk_052111_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_052672_count :
    mapChunk_052672.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_053232_count :
    mapChunk_053232.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_052672_001121_count :
    mapNode_052672_001121.count = 1121 :=
  map_count_branch
    mapChunk_052672
    mapChunk_053232
    560 561
    mapChunk_052672_count
    mapChunk_053232_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_051551_002242_count :
    mapNode_051551_002242.count = 2242 :=
  map_count_branch
    mapNode_051551_001121
    mapNode_052672_001121
    1121 1121
    mapNode_051551_001121_count
    mapNode_052672_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_049310_004483_count :
    mapNode_049310_004483.count = 4483 :=
  map_count_branch
    mapNode_049310_002241
    mapNode_051551_002242
    2241 2242
    mapNode_049310_002241_count
    mapNode_051551_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_044827_008966_count :
    mapNode_044827_008966.count = 8966 :=
  map_count_branch
    mapNode_044827_004483
    mapNode_049310_004483
    4483 4483
    mapNode_044827_004483_count
    mapNode_049310_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_035862_017931_count :
    mapNode_035862_017931.count = 17931 :=
  map_count_branch
    mapNode_035862_008965
    mapNode_044827_008966
    8965 8966
    mapNode_035862_008965_count
    mapNode_044827_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_053793_count :
    mapChunk_053793.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_054353_count :
    mapChunk_054353.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_053793_001120_count :
    mapNode_053793_001120.count = 1120 :=
  map_count_branch
    mapChunk_053793
    mapChunk_054353
    560 560
    mapChunk_053793_count
    mapChunk_054353_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_054913_count :
    mapChunk_054913.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_055473_count :
    mapChunk_055473.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_054913_001121_count :
    mapNode_054913_001121.count = 1121 :=
  map_count_branch
    mapChunk_054913
    mapChunk_055473
    560 561
    mapChunk_054913_count
    mapChunk_055473_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_053793_002241_count :
    mapNode_053793_002241.count = 2241 :=
  map_count_branch
    mapNode_053793_001120
    mapNode_054913_001121
    1120 1121
    mapNode_053793_001120_count
    mapNode_054913_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_056034_count :
    mapChunk_056034.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_056594_count :
    mapChunk_056594.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_056034_001121_count :
    mapNode_056034_001121.count = 1121 :=
  map_count_branch
    mapChunk_056034
    mapChunk_056594
    560 561
    mapChunk_056034_count
    mapChunk_056594_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_057155_count :
    mapChunk_057155.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_057715_count :
    mapChunk_057715.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_057155_001121_count :
    mapNode_057155_001121.count = 1121 :=
  map_count_branch
    mapChunk_057155
    mapChunk_057715
    560 561
    mapChunk_057155_count
    mapChunk_057715_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_056034_002242_count :
    mapNode_056034_002242.count = 2242 :=
  map_count_branch
    mapNode_056034_001121
    mapNode_057155_001121
    1121 1121
    mapNode_056034_001121_count
    mapNode_057155_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_053793_004483_count :
    mapNode_053793_004483.count = 4483 :=
  map_count_branch
    mapNode_053793_002241
    mapNode_056034_002242
    2241 2242
    mapNode_053793_002241_count
    mapNode_056034_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_058276_count :
    mapChunk_058276.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_058836_count :
    mapChunk_058836.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_058276_001120_count :
    mapNode_058276_001120.count = 1120 :=
  map_count_branch
    mapChunk_058276
    mapChunk_058836
    560 560
    mapChunk_058276_count
    mapChunk_058836_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_059396_count :
    mapChunk_059396.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_059956_count :
    mapChunk_059956.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_059396_001121_count :
    mapNode_059396_001121.count = 1121 :=
  map_count_branch
    mapChunk_059396
    mapChunk_059956
    560 561
    mapChunk_059396_count
    mapChunk_059956_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_058276_002241_count :
    mapNode_058276_002241.count = 2241 :=
  map_count_branch
    mapNode_058276_001120
    mapNode_059396_001121
    1120 1121
    mapNode_058276_001120_count
    mapNode_059396_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_060517_count :
    mapChunk_060517.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_061077_count :
    mapChunk_061077.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_060517_001121_count :
    mapNode_060517_001121.count = 1121 :=
  map_count_branch
    mapChunk_060517
    mapChunk_061077
    560 561
    mapChunk_060517_count
    mapChunk_061077_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_061638_count :
    mapChunk_061638.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_062198_count :
    mapChunk_062198.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_061638_001121_count :
    mapNode_061638_001121.count = 1121 :=
  map_count_branch
    mapChunk_061638
    mapChunk_062198
    560 561
    mapChunk_061638_count
    mapChunk_062198_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_060517_002242_count :
    mapNode_060517_002242.count = 2242 :=
  map_count_branch
    mapNode_060517_001121
    mapNode_061638_001121
    1121 1121
    mapNode_060517_001121_count
    mapNode_061638_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_058276_004483_count :
    mapNode_058276_004483.count = 4483 :=
  map_count_branch
    mapNode_058276_002241
    mapNode_060517_002242
    2241 2242
    mapNode_058276_002241_count
    mapNode_060517_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_053793_008966_count :
    mapNode_053793_008966.count = 8966 :=
  map_count_branch
    mapNode_053793_004483
    mapNode_058276_004483
    4483 4483
    mapNode_053793_004483_count
    mapNode_058276_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_062759_count :
    mapChunk_062759.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_063319_count :
    mapChunk_063319.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_062759_001120_count :
    mapNode_062759_001120.count = 1120 :=
  map_count_branch
    mapChunk_062759
    mapChunk_063319
    560 560
    mapChunk_062759_count
    mapChunk_063319_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_063879_count :
    mapChunk_063879.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_064439_count :
    mapChunk_064439.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_063879_001121_count :
    mapNode_063879_001121.count = 1121 :=
  map_count_branch
    mapChunk_063879
    mapChunk_064439
    560 561
    mapChunk_063879_count
    mapChunk_064439_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_062759_002241_count :
    mapNode_062759_002241.count = 2241 :=
  map_count_branch
    mapNode_062759_001120
    mapNode_063879_001121
    1120 1121
    mapNode_062759_001120_count
    mapNode_063879_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_065000_count :
    mapChunk_065000.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_065560_count :
    mapChunk_065560.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_065000_001121_count :
    mapNode_065000_001121.count = 1121 :=
  map_count_branch
    mapChunk_065000
    mapChunk_065560
    560 561
    mapChunk_065000_count
    mapChunk_065560_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_066121_count :
    mapChunk_066121.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_066681_count :
    mapChunk_066681.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_066121_001121_count :
    mapNode_066121_001121.count = 1121 :=
  map_count_branch
    mapChunk_066121
    mapChunk_066681
    560 561
    mapChunk_066121_count
    mapChunk_066681_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_065000_002242_count :
    mapNode_065000_002242.count = 2242 :=
  map_count_branch
    mapNode_065000_001121
    mapNode_066121_001121
    1121 1121
    mapNode_065000_001121_count
    mapNode_066121_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_062759_004483_count :
    mapNode_062759_004483.count = 4483 :=
  map_count_branch
    mapNode_062759_002241
    mapNode_065000_002242
    2241 2242
    mapNode_062759_002241_count
    mapNode_065000_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_067242_count :
    mapChunk_067242.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_067802_count :
    mapChunk_067802.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_067242_001120_count :
    mapNode_067242_001120.count = 1120 :=
  map_count_branch
    mapChunk_067242
    mapChunk_067802
    560 560
    mapChunk_067242_count
    mapChunk_067802_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_068362_count :
    mapChunk_068362.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_068922_count :
    mapChunk_068922.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_068362_001121_count :
    mapNode_068362_001121.count = 1121 :=
  map_count_branch
    mapChunk_068362
    mapChunk_068922
    560 561
    mapChunk_068362_count
    mapChunk_068922_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_067242_002241_count :
    mapNode_067242_002241.count = 2241 :=
  map_count_branch
    mapNode_067242_001120
    mapNode_068362_001121
    1120 1121
    mapNode_067242_001120_count
    mapNode_068362_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_069483_count :
    mapChunk_069483.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_070043_count :
    mapChunk_070043.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_069483_001121_count :
    mapNode_069483_001121.count = 1121 :=
  map_count_branch
    mapChunk_069483
    mapChunk_070043
    560 561
    mapChunk_069483_count
    mapChunk_070043_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_070604_count :
    mapChunk_070604.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_071164_count :
    mapChunk_071164.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_070604_001121_count :
    mapNode_070604_001121.count = 1121 :=
  map_count_branch
    mapChunk_070604
    mapChunk_071164
    560 561
    mapChunk_070604_count
    mapChunk_071164_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_069483_002242_count :
    mapNode_069483_002242.count = 2242 :=
  map_count_branch
    mapNode_069483_001121
    mapNode_070604_001121
    1121 1121
    mapNode_069483_001121_count
    mapNode_070604_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_067242_004483_count :
    mapNode_067242_004483.count = 4483 :=
  map_count_branch
    mapNode_067242_002241
    mapNode_069483_002242
    2241 2242
    mapNode_067242_002241_count
    mapNode_069483_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_062759_008966_count :
    mapNode_062759_008966.count = 8966 :=
  map_count_branch
    mapNode_062759_004483
    mapNode_067242_004483
    4483 4483
    mapNode_062759_004483_count
    mapNode_067242_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_053793_017932_count :
    mapNode_053793_017932.count = 17932 :=
  map_count_branch
    mapNode_053793_008966
    mapNode_062759_008966
    8966 8966
    mapNode_053793_008966_count
    mapNode_062759_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_035862_035863_count :
    mapNode_035862_035863.count = 35863 :=
  map_count_branch
    mapNode_035862_017931
    mapNode_053793_017932
    17931 17932
    mapNode_035862_017931_count
    mapNode_053793_017932_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_000000_071725_count :
    mapNode_000000_071725.count = 71725 :=
  map_count_branch
    mapNode_000000_035862
    mapNode_035862_035863
    35862 35863
    mapNode_000000_035862_count
    mapNode_035862_035863_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_071725_count :
    mapChunk_071725.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_072285_count :
    mapChunk_072285.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_071725_001120_count :
    mapNode_071725_001120.count = 1120 :=
  map_count_branch
    mapChunk_071725
    mapChunk_072285
    560 560
    mapChunk_071725_count
    mapChunk_072285_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_072845_count :
    mapChunk_072845.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_073405_count :
    mapChunk_073405.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_072845_001121_count :
    mapNode_072845_001121.count = 1121 :=
  map_count_branch
    mapChunk_072845
    mapChunk_073405
    560 561
    mapChunk_072845_count
    mapChunk_073405_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_071725_002241_count :
    mapNode_071725_002241.count = 2241 :=
  map_count_branch
    mapNode_071725_001120
    mapNode_072845_001121
    1120 1121
    mapNode_071725_001120_count
    mapNode_072845_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_073966_count :
    mapChunk_073966.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_074526_count :
    mapChunk_074526.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_073966_001120_count :
    mapNode_073966_001120.count = 1120 :=
  map_count_branch
    mapChunk_073966
    mapChunk_074526
    560 560
    mapChunk_073966_count
    mapChunk_074526_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_075086_count :
    mapChunk_075086.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_075646_count :
    mapChunk_075646.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_075086_001121_count :
    mapNode_075086_001121.count = 1121 :=
  map_count_branch
    mapChunk_075086
    mapChunk_075646
    560 561
    mapChunk_075086_count
    mapChunk_075646_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_073966_002241_count :
    mapNode_073966_002241.count = 2241 :=
  map_count_branch
    mapNode_073966_001120
    mapNode_075086_001121
    1120 1121
    mapNode_073966_001120_count
    mapNode_075086_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_071725_004482_count :
    mapNode_071725_004482.count = 4482 :=
  map_count_branch
    mapNode_071725_002241
    mapNode_073966_002241
    2241 2241
    mapNode_071725_002241_count
    mapNode_073966_002241_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_076207_count :
    mapChunk_076207.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_076767_count :
    mapChunk_076767.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_076207_001120_count :
    mapNode_076207_001120.count = 1120 :=
  map_count_branch
    mapChunk_076207
    mapChunk_076767
    560 560
    mapChunk_076207_count
    mapChunk_076767_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_077327_count :
    mapChunk_077327.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_077887_count :
    mapChunk_077887.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_077327_001121_count :
    mapNode_077327_001121.count = 1121 :=
  map_count_branch
    mapChunk_077327
    mapChunk_077887
    560 561
    mapChunk_077327_count
    mapChunk_077887_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_076207_002241_count :
    mapNode_076207_002241.count = 2241 :=
  map_count_branch
    mapNode_076207_001120
    mapNode_077327_001121
    1120 1121
    mapNode_076207_001120_count
    mapNode_077327_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_078448_count :
    mapChunk_078448.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_079008_count :
    mapChunk_079008.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_078448_001121_count :
    mapNode_078448_001121.count = 1121 :=
  map_count_branch
    mapChunk_078448
    mapChunk_079008
    560 561
    mapChunk_078448_count
    mapChunk_079008_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_079569_count :
    mapChunk_079569.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_080129_count :
    mapChunk_080129.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_079569_001121_count :
    mapNode_079569_001121.count = 1121 :=
  map_count_branch
    mapChunk_079569
    mapChunk_080129
    560 561
    mapChunk_079569_count
    mapChunk_080129_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_078448_002242_count :
    mapNode_078448_002242.count = 2242 :=
  map_count_branch
    mapNode_078448_001121
    mapNode_079569_001121
    1121 1121
    mapNode_078448_001121_count
    mapNode_079569_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_076207_004483_count :
    mapNode_076207_004483.count = 4483 :=
  map_count_branch
    mapNode_076207_002241
    mapNode_078448_002242
    2241 2242
    mapNode_076207_002241_count
    mapNode_078448_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_071725_008965_count :
    mapNode_071725_008965.count = 8965 :=
  map_count_branch
    mapNode_071725_004482
    mapNode_076207_004483
    4482 4483
    mapNode_071725_004482_count
    mapNode_076207_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_080690_count :
    mapChunk_080690.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_081250_count :
    mapChunk_081250.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_080690_001120_count :
    mapNode_080690_001120.count = 1120 :=
  map_count_branch
    mapChunk_080690
    mapChunk_081250
    560 560
    mapChunk_080690_count
    mapChunk_081250_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_081810_count :
    mapChunk_081810.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_082370_count :
    mapChunk_082370.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_081810_001121_count :
    mapNode_081810_001121.count = 1121 :=
  map_count_branch
    mapChunk_081810
    mapChunk_082370
    560 561
    mapChunk_081810_count
    mapChunk_082370_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_080690_002241_count :
    mapNode_080690_002241.count = 2241 :=
  map_count_branch
    mapNode_080690_001120
    mapNode_081810_001121
    1120 1121
    mapNode_080690_001120_count
    mapNode_081810_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_082931_count :
    mapChunk_082931.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_083491_count :
    mapChunk_083491.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_082931_001121_count :
    mapNode_082931_001121.count = 1121 :=
  map_count_branch
    mapChunk_082931
    mapChunk_083491
    560 561
    mapChunk_082931_count
    mapChunk_083491_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_084052_count :
    mapChunk_084052.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_084612_count :
    mapChunk_084612.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_084052_001121_count :
    mapNode_084052_001121.count = 1121 :=
  map_count_branch
    mapChunk_084052
    mapChunk_084612
    560 561
    mapChunk_084052_count
    mapChunk_084612_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_082931_002242_count :
    mapNode_082931_002242.count = 2242 :=
  map_count_branch
    mapNode_082931_001121
    mapNode_084052_001121
    1121 1121
    mapNode_082931_001121_count
    mapNode_084052_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_080690_004483_count :
    mapNode_080690_004483.count = 4483 :=
  map_count_branch
    mapNode_080690_002241
    mapNode_082931_002242
    2241 2242
    mapNode_080690_002241_count
    mapNode_082931_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_085173_count :
    mapChunk_085173.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_085733_count :
    mapChunk_085733.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_085173_001120_count :
    mapNode_085173_001120.count = 1120 :=
  map_count_branch
    mapChunk_085173
    mapChunk_085733
    560 560
    mapChunk_085173_count
    mapChunk_085733_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_086293_count :
    mapChunk_086293.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_086853_count :
    mapChunk_086853.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_086293_001121_count :
    mapNode_086293_001121.count = 1121 :=
  map_count_branch
    mapChunk_086293
    mapChunk_086853
    560 561
    mapChunk_086293_count
    mapChunk_086853_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_085173_002241_count :
    mapNode_085173_002241.count = 2241 :=
  map_count_branch
    mapNode_085173_001120
    mapNode_086293_001121
    1120 1121
    mapNode_085173_001120_count
    mapNode_086293_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_087414_count :
    mapChunk_087414.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_087974_count :
    mapChunk_087974.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_087414_001121_count :
    mapNode_087414_001121.count = 1121 :=
  map_count_branch
    mapChunk_087414
    mapChunk_087974
    560 561
    mapChunk_087414_count
    mapChunk_087974_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_088535_count :
    mapChunk_088535.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_089095_count :
    mapChunk_089095.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_088535_001121_count :
    mapNode_088535_001121.count = 1121 :=
  map_count_branch
    mapChunk_088535
    mapChunk_089095
    560 561
    mapChunk_088535_count
    mapChunk_089095_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_087414_002242_count :
    mapNode_087414_002242.count = 2242 :=
  map_count_branch
    mapNode_087414_001121
    mapNode_088535_001121
    1121 1121
    mapNode_087414_001121_count
    mapNode_088535_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_085173_004483_count :
    mapNode_085173_004483.count = 4483 :=
  map_count_branch
    mapNode_085173_002241
    mapNode_087414_002242
    2241 2242
    mapNode_085173_002241_count
    mapNode_087414_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_080690_008966_count :
    mapNode_080690_008966.count = 8966 :=
  map_count_branch
    mapNode_080690_004483
    mapNode_085173_004483
    4483 4483
    mapNode_080690_004483_count
    mapNode_085173_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_071725_017931_count :
    mapNode_071725_017931.count = 17931 :=
  map_count_branch
    mapNode_071725_008965
    mapNode_080690_008966
    8965 8966
    mapNode_071725_008965_count
    mapNode_080690_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_089656_count :
    mapChunk_089656.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_090216_count :
    mapChunk_090216.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_089656_001120_count :
    mapNode_089656_001120.count = 1120 :=
  map_count_branch
    mapChunk_089656
    mapChunk_090216
    560 560
    mapChunk_089656_count
    mapChunk_090216_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_090776_count :
    mapChunk_090776.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_091336_count :
    mapChunk_091336.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_090776_001121_count :
    mapNode_090776_001121.count = 1121 :=
  map_count_branch
    mapChunk_090776
    mapChunk_091336
    560 561
    mapChunk_090776_count
    mapChunk_091336_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_089656_002241_count :
    mapNode_089656_002241.count = 2241 :=
  map_count_branch
    mapNode_089656_001120
    mapNode_090776_001121
    1120 1121
    mapNode_089656_001120_count
    mapNode_090776_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_091897_count :
    mapChunk_091897.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_092457_count :
    mapChunk_092457.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_091897_001120_count :
    mapNode_091897_001120.count = 1120 :=
  map_count_branch
    mapChunk_091897
    mapChunk_092457
    560 560
    mapChunk_091897_count
    mapChunk_092457_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_093017_count :
    mapChunk_093017.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_093577_count :
    mapChunk_093577.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_093017_001121_count :
    mapNode_093017_001121.count = 1121 :=
  map_count_branch
    mapChunk_093017
    mapChunk_093577
    560 561
    mapChunk_093017_count
    mapChunk_093577_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_091897_002241_count :
    mapNode_091897_002241.count = 2241 :=
  map_count_branch
    mapNode_091897_001120
    mapNode_093017_001121
    1120 1121
    mapNode_091897_001120_count
    mapNode_093017_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_089656_004482_count :
    mapNode_089656_004482.count = 4482 :=
  map_count_branch
    mapNode_089656_002241
    mapNode_091897_002241
    2241 2241
    mapNode_089656_002241_count
    mapNode_091897_002241_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_094138_count :
    mapChunk_094138.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_094698_count :
    mapChunk_094698.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_094138_001120_count :
    mapNode_094138_001120.count = 1120 :=
  map_count_branch
    mapChunk_094138
    mapChunk_094698
    560 560
    mapChunk_094138_count
    mapChunk_094698_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_095258_count :
    mapChunk_095258.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_095818_count :
    mapChunk_095818.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_095258_001121_count :
    mapNode_095258_001121.count = 1121 :=
  map_count_branch
    mapChunk_095258
    mapChunk_095818
    560 561
    mapChunk_095258_count
    mapChunk_095818_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_094138_002241_count :
    mapNode_094138_002241.count = 2241 :=
  map_count_branch
    mapNode_094138_001120
    mapNode_095258_001121
    1120 1121
    mapNode_094138_001120_count
    mapNode_095258_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_096379_count :
    mapChunk_096379.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_096939_count :
    mapChunk_096939.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_096379_001121_count :
    mapNode_096379_001121.count = 1121 :=
  map_count_branch
    mapChunk_096379
    mapChunk_096939
    560 561
    mapChunk_096379_count
    mapChunk_096939_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_097500_count :
    mapChunk_097500.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_098060_count :
    mapChunk_098060.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_097500_001121_count :
    mapNode_097500_001121.count = 1121 :=
  map_count_branch
    mapChunk_097500
    mapChunk_098060
    560 561
    mapChunk_097500_count
    mapChunk_098060_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_096379_002242_count :
    mapNode_096379_002242.count = 2242 :=
  map_count_branch
    mapNode_096379_001121
    mapNode_097500_001121
    1121 1121
    mapNode_096379_001121_count
    mapNode_097500_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_094138_004483_count :
    mapNode_094138_004483.count = 4483 :=
  map_count_branch
    mapNode_094138_002241
    mapNode_096379_002242
    2241 2242
    mapNode_094138_002241_count
    mapNode_096379_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_089656_008965_count :
    mapNode_089656_008965.count = 8965 :=
  map_count_branch
    mapNode_089656_004482
    mapNode_094138_004483
    4482 4483
    mapNode_089656_004482_count
    mapNode_094138_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_098621_count :
    mapChunk_098621.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_099181_count :
    mapChunk_099181.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_098621_001120_count :
    mapNode_098621_001120.count = 1120 :=
  map_count_branch
    mapChunk_098621
    mapChunk_099181
    560 560
    mapChunk_098621_count
    mapChunk_099181_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_099741_count :
    mapChunk_099741.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_100301_count :
    mapChunk_100301.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_099741_001121_count :
    mapNode_099741_001121.count = 1121 :=
  map_count_branch
    mapChunk_099741
    mapChunk_100301
    560 561
    mapChunk_099741_count
    mapChunk_100301_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_098621_002241_count :
    mapNode_098621_002241.count = 2241 :=
  map_count_branch
    mapNode_098621_001120
    mapNode_099741_001121
    1120 1121
    mapNode_098621_001120_count
    mapNode_099741_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_100862_count :
    mapChunk_100862.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_101422_count :
    mapChunk_101422.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_100862_001121_count :
    mapNode_100862_001121.count = 1121 :=
  map_count_branch
    mapChunk_100862
    mapChunk_101422
    560 561
    mapChunk_100862_count
    mapChunk_101422_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_101983_count :
    mapChunk_101983.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_102543_count :
    mapChunk_102543.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_101983_001121_count :
    mapNode_101983_001121.count = 1121 :=
  map_count_branch
    mapChunk_101983
    mapChunk_102543
    560 561
    mapChunk_101983_count
    mapChunk_102543_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_100862_002242_count :
    mapNode_100862_002242.count = 2242 :=
  map_count_branch
    mapNode_100862_001121
    mapNode_101983_001121
    1121 1121
    mapNode_100862_001121_count
    mapNode_101983_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_098621_004483_count :
    mapNode_098621_004483.count = 4483 :=
  map_count_branch
    mapNode_098621_002241
    mapNode_100862_002242
    2241 2242
    mapNode_098621_002241_count
    mapNode_100862_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_103104_count :
    mapChunk_103104.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_103664_count :
    mapChunk_103664.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_103104_001120_count :
    mapNode_103104_001120.count = 1120 :=
  map_count_branch
    mapChunk_103104
    mapChunk_103664
    560 560
    mapChunk_103104_count
    mapChunk_103664_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_104224_count :
    mapChunk_104224.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_104784_count :
    mapChunk_104784.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_104224_001121_count :
    mapNode_104224_001121.count = 1121 :=
  map_count_branch
    mapChunk_104224
    mapChunk_104784
    560 561
    mapChunk_104224_count
    mapChunk_104784_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_103104_002241_count :
    mapNode_103104_002241.count = 2241 :=
  map_count_branch
    mapNode_103104_001120
    mapNode_104224_001121
    1120 1121
    mapNode_103104_001120_count
    mapNode_104224_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_105345_count :
    mapChunk_105345.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_105905_count :
    mapChunk_105905.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_105345_001121_count :
    mapNode_105345_001121.count = 1121 :=
  map_count_branch
    mapChunk_105345
    mapChunk_105905
    560 561
    mapChunk_105345_count
    mapChunk_105905_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_106466_count :
    mapChunk_106466.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_107026_count :
    mapChunk_107026.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_106466_001121_count :
    mapNode_106466_001121.count = 1121 :=
  map_count_branch
    mapChunk_106466
    mapChunk_107026
    560 561
    mapChunk_106466_count
    mapChunk_107026_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_105345_002242_count :
    mapNode_105345_002242.count = 2242 :=
  map_count_branch
    mapNode_105345_001121
    mapNode_106466_001121
    1121 1121
    mapNode_105345_001121_count
    mapNode_106466_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_103104_004483_count :
    mapNode_103104_004483.count = 4483 :=
  map_count_branch
    mapNode_103104_002241
    mapNode_105345_002242
    2241 2242
    mapNode_103104_002241_count
    mapNode_105345_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_098621_008966_count :
    mapNode_098621_008966.count = 8966 :=
  map_count_branch
    mapNode_098621_004483
    mapNode_103104_004483
    4483 4483
    mapNode_098621_004483_count
    mapNode_103104_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_089656_017931_count :
    mapNode_089656_017931.count = 17931 :=
  map_count_branch
    mapNode_089656_008965
    mapNode_098621_008966
    8965 8966
    mapNode_089656_008965_count
    mapNode_098621_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_071725_035862_count :
    mapNode_071725_035862.count = 35862 :=
  map_count_branch
    mapNode_071725_017931
    mapNode_089656_017931
    17931 17931
    mapNode_071725_017931_count
    mapNode_089656_017931_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_107587_count :
    mapChunk_107587.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_108147_count :
    mapChunk_108147.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_107587_001120_count :
    mapNode_107587_001120.count = 1120 :=
  map_count_branch
    mapChunk_107587
    mapChunk_108147
    560 560
    mapChunk_107587_count
    mapChunk_108147_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_108707_count :
    mapChunk_108707.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_109267_count :
    mapChunk_109267.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_108707_001121_count :
    mapNode_108707_001121.count = 1121 :=
  map_count_branch
    mapChunk_108707
    mapChunk_109267
    560 561
    mapChunk_108707_count
    mapChunk_109267_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_107587_002241_count :
    mapNode_107587_002241.count = 2241 :=
  map_count_branch
    mapNode_107587_001120
    mapNode_108707_001121
    1120 1121
    mapNode_107587_001120_count
    mapNode_108707_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_109828_count :
    mapChunk_109828.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_110388_count :
    mapChunk_110388.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_109828_001120_count :
    mapNode_109828_001120.count = 1120 :=
  map_count_branch
    mapChunk_109828
    mapChunk_110388
    560 560
    mapChunk_109828_count
    mapChunk_110388_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_110948_count :
    mapChunk_110948.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_111508_count :
    mapChunk_111508.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_110948_001121_count :
    mapNode_110948_001121.count = 1121 :=
  map_count_branch
    mapChunk_110948
    mapChunk_111508
    560 561
    mapChunk_110948_count
    mapChunk_111508_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_109828_002241_count :
    mapNode_109828_002241.count = 2241 :=
  map_count_branch
    mapNode_109828_001120
    mapNode_110948_001121
    1120 1121
    mapNode_109828_001120_count
    mapNode_110948_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_107587_004482_count :
    mapNode_107587_004482.count = 4482 :=
  map_count_branch
    mapNode_107587_002241
    mapNode_109828_002241
    2241 2241
    mapNode_107587_002241_count
    mapNode_109828_002241_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_112069_count :
    mapChunk_112069.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_112629_count :
    mapChunk_112629.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_112069_001120_count :
    mapNode_112069_001120.count = 1120 :=
  map_count_branch
    mapChunk_112069
    mapChunk_112629
    560 560
    mapChunk_112069_count
    mapChunk_112629_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_113189_count :
    mapChunk_113189.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_113749_count :
    mapChunk_113749.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_113189_001121_count :
    mapNode_113189_001121.count = 1121 :=
  map_count_branch
    mapChunk_113189
    mapChunk_113749
    560 561
    mapChunk_113189_count
    mapChunk_113749_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_112069_002241_count :
    mapNode_112069_002241.count = 2241 :=
  map_count_branch
    mapNode_112069_001120
    mapNode_113189_001121
    1120 1121
    mapNode_112069_001120_count
    mapNode_113189_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_114310_count :
    mapChunk_114310.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_114870_count :
    mapChunk_114870.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_114310_001121_count :
    mapNode_114310_001121.count = 1121 :=
  map_count_branch
    mapChunk_114310
    mapChunk_114870
    560 561
    mapChunk_114310_count
    mapChunk_114870_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_115431_count :
    mapChunk_115431.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_115991_count :
    mapChunk_115991.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_115431_001121_count :
    mapNode_115431_001121.count = 1121 :=
  map_count_branch
    mapChunk_115431
    mapChunk_115991
    560 561
    mapChunk_115431_count
    mapChunk_115991_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_114310_002242_count :
    mapNode_114310_002242.count = 2242 :=
  map_count_branch
    mapNode_114310_001121
    mapNode_115431_001121
    1121 1121
    mapNode_114310_001121_count
    mapNode_115431_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_112069_004483_count :
    mapNode_112069_004483.count = 4483 :=
  map_count_branch
    mapNode_112069_002241
    mapNode_114310_002242
    2241 2242
    mapNode_112069_002241_count
    mapNode_114310_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_107587_008965_count :
    mapNode_107587_008965.count = 8965 :=
  map_count_branch
    mapNode_107587_004482
    mapNode_112069_004483
    4482 4483
    mapNode_107587_004482_count
    mapNode_112069_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_116552_count :
    mapChunk_116552.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_117112_count :
    mapChunk_117112.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_116552_001120_count :
    mapNode_116552_001120.count = 1120 :=
  map_count_branch
    mapChunk_116552
    mapChunk_117112
    560 560
    mapChunk_116552_count
    mapChunk_117112_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_117672_count :
    mapChunk_117672.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_118232_count :
    mapChunk_118232.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_117672_001121_count :
    mapNode_117672_001121.count = 1121 :=
  map_count_branch
    mapChunk_117672
    mapChunk_118232
    560 561
    mapChunk_117672_count
    mapChunk_118232_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_116552_002241_count :
    mapNode_116552_002241.count = 2241 :=
  map_count_branch
    mapNode_116552_001120
    mapNode_117672_001121
    1120 1121
    mapNode_116552_001120_count
    mapNode_117672_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_118793_count :
    mapChunk_118793.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_119353_count :
    mapChunk_119353.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_118793_001121_count :
    mapNode_118793_001121.count = 1121 :=
  map_count_branch
    mapChunk_118793
    mapChunk_119353
    560 561
    mapChunk_118793_count
    mapChunk_119353_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_119914_count :
    mapChunk_119914.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_120474_count :
    mapChunk_120474.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_119914_001121_count :
    mapNode_119914_001121.count = 1121 :=
  map_count_branch
    mapChunk_119914
    mapChunk_120474
    560 561
    mapChunk_119914_count
    mapChunk_120474_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_118793_002242_count :
    mapNode_118793_002242.count = 2242 :=
  map_count_branch
    mapNode_118793_001121
    mapNode_119914_001121
    1121 1121
    mapNode_118793_001121_count
    mapNode_119914_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_116552_004483_count :
    mapNode_116552_004483.count = 4483 :=
  map_count_branch
    mapNode_116552_002241
    mapNode_118793_002242
    2241 2242
    mapNode_116552_002241_count
    mapNode_118793_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_121035_count :
    mapChunk_121035.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_121595_count :
    mapChunk_121595.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_121035_001120_count :
    mapNode_121035_001120.count = 1120 :=
  map_count_branch
    mapChunk_121035
    mapChunk_121595
    560 560
    mapChunk_121035_count
    mapChunk_121595_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_122155_count :
    mapChunk_122155.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_122715_count :
    mapChunk_122715.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_122155_001121_count :
    mapNode_122155_001121.count = 1121 :=
  map_count_branch
    mapChunk_122155
    mapChunk_122715
    560 561
    mapChunk_122155_count
    mapChunk_122715_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_121035_002241_count :
    mapNode_121035_002241.count = 2241 :=
  map_count_branch
    mapNode_121035_001120
    mapNode_122155_001121
    1120 1121
    mapNode_121035_001120_count
    mapNode_122155_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_123276_count :
    mapChunk_123276.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_123836_count :
    mapChunk_123836.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_123276_001121_count :
    mapNode_123276_001121.count = 1121 :=
  map_count_branch
    mapChunk_123276
    mapChunk_123836
    560 561
    mapChunk_123276_count
    mapChunk_123836_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_124397_count :
    mapChunk_124397.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_124957_count :
    mapChunk_124957.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_124397_001121_count :
    mapNode_124397_001121.count = 1121 :=
  map_count_branch
    mapChunk_124397
    mapChunk_124957
    560 561
    mapChunk_124397_count
    mapChunk_124957_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_123276_002242_count :
    mapNode_123276_002242.count = 2242 :=
  map_count_branch
    mapNode_123276_001121
    mapNode_124397_001121
    1121 1121
    mapNode_123276_001121_count
    mapNode_124397_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_121035_004483_count :
    mapNode_121035_004483.count = 4483 :=
  map_count_branch
    mapNode_121035_002241
    mapNode_123276_002242
    2241 2242
    mapNode_121035_002241_count
    mapNode_123276_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_116552_008966_count :
    mapNode_116552_008966.count = 8966 :=
  map_count_branch
    mapNode_116552_004483
    mapNode_121035_004483
    4483 4483
    mapNode_116552_004483_count
    mapNode_121035_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_107587_017931_count :
    mapNode_107587_017931.count = 17931 :=
  map_count_branch
    mapNode_107587_008965
    mapNode_116552_008966
    8965 8966
    mapNode_107587_008965_count
    mapNode_116552_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_125518_count :
    mapChunk_125518.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_126078_count :
    mapChunk_126078.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_125518_001120_count :
    mapNode_125518_001120.count = 1120 :=
  map_count_branch
    mapChunk_125518
    mapChunk_126078
    560 560
    mapChunk_125518_count
    mapChunk_126078_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_126638_count :
    mapChunk_126638.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_127198_count :
    mapChunk_127198.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_126638_001121_count :
    mapNode_126638_001121.count = 1121 :=
  map_count_branch
    mapChunk_126638
    mapChunk_127198
    560 561
    mapChunk_126638_count
    mapChunk_127198_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_125518_002241_count :
    mapNode_125518_002241.count = 2241 :=
  map_count_branch
    mapNode_125518_001120
    mapNode_126638_001121
    1120 1121
    mapNode_125518_001120_count
    mapNode_126638_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_127759_count :
    mapChunk_127759.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_128319_count :
    mapChunk_128319.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_127759_001121_count :
    mapNode_127759_001121.count = 1121 :=
  map_count_branch
    mapChunk_127759
    mapChunk_128319
    560 561
    mapChunk_127759_count
    mapChunk_128319_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_128880_count :
    mapChunk_128880.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_129440_count :
    mapChunk_129440.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_128880_001121_count :
    mapNode_128880_001121.count = 1121 :=
  map_count_branch
    mapChunk_128880
    mapChunk_129440
    560 561
    mapChunk_128880_count
    mapChunk_129440_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_127759_002242_count :
    mapNode_127759_002242.count = 2242 :=
  map_count_branch
    mapNode_127759_001121
    mapNode_128880_001121
    1121 1121
    mapNode_127759_001121_count
    mapNode_128880_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_125518_004483_count :
    mapNode_125518_004483.count = 4483 :=
  map_count_branch
    mapNode_125518_002241
    mapNode_127759_002242
    2241 2242
    mapNode_125518_002241_count
    mapNode_127759_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_130001_count :
    mapChunk_130001.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_130561_count :
    mapChunk_130561.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_130001_001120_count :
    mapNode_130001_001120.count = 1120 :=
  map_count_branch
    mapChunk_130001
    mapChunk_130561
    560 560
    mapChunk_130001_count
    mapChunk_130561_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_131121_count :
    mapChunk_131121.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_131681_count :
    mapChunk_131681.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_131121_001121_count :
    mapNode_131121_001121.count = 1121 :=
  map_count_branch
    mapChunk_131121
    mapChunk_131681
    560 561
    mapChunk_131121_count
    mapChunk_131681_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_130001_002241_count :
    mapNode_130001_002241.count = 2241 :=
  map_count_branch
    mapNode_130001_001120
    mapNode_131121_001121
    1120 1121
    mapNode_130001_001120_count
    mapNode_131121_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_132242_count :
    mapChunk_132242.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_132802_count :
    mapChunk_132802.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_132242_001121_count :
    mapNode_132242_001121.count = 1121 :=
  map_count_branch
    mapChunk_132242
    mapChunk_132802
    560 561
    mapChunk_132242_count
    mapChunk_132802_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_133363_count :
    mapChunk_133363.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_133923_count :
    mapChunk_133923.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_133363_001121_count :
    mapNode_133363_001121.count = 1121 :=
  map_count_branch
    mapChunk_133363
    mapChunk_133923
    560 561
    mapChunk_133363_count
    mapChunk_133923_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_132242_002242_count :
    mapNode_132242_002242.count = 2242 :=
  map_count_branch
    mapNode_132242_001121
    mapNode_133363_001121
    1121 1121
    mapNode_132242_001121_count
    mapNode_133363_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_130001_004483_count :
    mapNode_130001_004483.count = 4483 :=
  map_count_branch
    mapNode_130001_002241
    mapNode_132242_002242
    2241 2242
    mapNode_130001_002241_count
    mapNode_132242_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_125518_008966_count :
    mapNode_125518_008966.count = 8966 :=
  map_count_branch
    mapNode_125518_004483
    mapNode_130001_004483
    4483 4483
    mapNode_125518_004483_count
    mapNode_130001_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_134484_count :
    mapChunk_134484.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_135044_count :
    mapChunk_135044.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_134484_001120_count :
    mapNode_134484_001120.count = 1120 :=
  map_count_branch
    mapChunk_134484
    mapChunk_135044
    560 560
    mapChunk_134484_count
    mapChunk_135044_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_135604_count :
    mapChunk_135604.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_136164_count :
    mapChunk_136164.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_135604_001121_count :
    mapNode_135604_001121.count = 1121 :=
  map_count_branch
    mapChunk_135604
    mapChunk_136164
    560 561
    mapChunk_135604_count
    mapChunk_136164_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_134484_002241_count :
    mapNode_134484_002241.count = 2241 :=
  map_count_branch
    mapNode_134484_001120
    mapNode_135604_001121
    1120 1121
    mapNode_134484_001120_count
    mapNode_135604_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_136725_count :
    mapChunk_136725.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_137285_count :
    mapChunk_137285.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_136725_001121_count :
    mapNode_136725_001121.count = 1121 :=
  map_count_branch
    mapChunk_136725
    mapChunk_137285
    560 561
    mapChunk_136725_count
    mapChunk_137285_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_137846_count :
    mapChunk_137846.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_138406_count :
    mapChunk_138406.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_137846_001121_count :
    mapNode_137846_001121.count = 1121 :=
  map_count_branch
    mapChunk_137846
    mapChunk_138406
    560 561
    mapChunk_137846_count
    mapChunk_138406_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_136725_002242_count :
    mapNode_136725_002242.count = 2242 :=
  map_count_branch
    mapNode_136725_001121
    mapNode_137846_001121
    1121 1121
    mapNode_136725_001121_count
    mapNode_137846_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_134484_004483_count :
    mapNode_134484_004483.count = 4483 :=
  map_count_branch
    mapNode_134484_002241
    mapNode_136725_002242
    2241 2242
    mapNode_134484_002241_count
    mapNode_136725_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_138967_count :
    mapChunk_138967.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_139527_count :
    mapChunk_139527.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_138967_001120_count :
    mapNode_138967_001120.count = 1120 :=
  map_count_branch
    mapChunk_138967
    mapChunk_139527
    560 560
    mapChunk_138967_count
    mapChunk_139527_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_140087_count :
    mapChunk_140087.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_140647_count :
    mapChunk_140647.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_140087_001121_count :
    mapNode_140087_001121.count = 1121 :=
  map_count_branch
    mapChunk_140087
    mapChunk_140647
    560 561
    mapChunk_140087_count
    mapChunk_140647_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_138967_002241_count :
    mapNode_138967_002241.count = 2241 :=
  map_count_branch
    mapNode_138967_001120
    mapNode_140087_001121
    1120 1121
    mapNode_138967_001120_count
    mapNode_140087_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_141208_count :
    mapChunk_141208.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_141768_count :
    mapChunk_141768.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_141208_001121_count :
    mapNode_141208_001121.count = 1121 :=
  map_count_branch
    mapChunk_141208
    mapChunk_141768
    560 561
    mapChunk_141208_count
    mapChunk_141768_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_142329_count :
    mapChunk_142329.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_142889_count :
    mapChunk_142889.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_142329_001121_count :
    mapNode_142329_001121.count = 1121 :=
  map_count_branch
    mapChunk_142329
    mapChunk_142889
    560 561
    mapChunk_142329_count
    mapChunk_142889_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_141208_002242_count :
    mapNode_141208_002242.count = 2242 :=
  map_count_branch
    mapNode_141208_001121
    mapNode_142329_001121
    1121 1121
    mapNode_141208_001121_count
    mapNode_142329_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_138967_004483_count :
    mapNode_138967_004483.count = 4483 :=
  map_count_branch
    mapNode_138967_002241
    mapNode_141208_002242
    2241 2242
    mapNode_138967_002241_count
    mapNode_141208_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_134484_008966_count :
    mapNode_134484_008966.count = 8966 :=
  map_count_branch
    mapNode_134484_004483
    mapNode_138967_004483
    4483 4483
    mapNode_134484_004483_count
    mapNode_138967_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_125518_017932_count :
    mapNode_125518_017932.count = 17932 :=
  map_count_branch
    mapNode_125518_008966
    mapNode_134484_008966
    8966 8966
    mapNode_125518_008966_count
    mapNode_134484_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_107587_035863_count :
    mapNode_107587_035863.count = 35863 :=
  map_count_branch
    mapNode_107587_017931
    mapNode_125518_017932
    17931 17932
    mapNode_107587_017931_count
    mapNode_125518_017932_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_071725_071725_count :
    mapNode_071725_071725.count = 71725 :=
  map_count_branch
    mapNode_071725_035862
    mapNode_107587_035863
    35862 35863
    mapNode_071725_035862_count
    mapNode_107587_035863_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_000000_143450_count :
    mapNode_000000_143450.count = 143450 :=
  map_count_branch
    mapNode_000000_071725
    mapNode_071725_071725
    71725 71725
    mapNode_000000_071725_count
    mapNode_071725_071725_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_143450_count :
    mapChunk_143450.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_144010_count :
    mapChunk_144010.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_143450_001120_count :
    mapNode_143450_001120.count = 1120 :=
  map_count_branch
    mapChunk_143450
    mapChunk_144010
    560 560
    mapChunk_143450_count
    mapChunk_144010_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_144570_count :
    mapChunk_144570.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_145130_count :
    mapChunk_145130.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_144570_001121_count :
    mapNode_144570_001121.count = 1121 :=
  map_count_branch
    mapChunk_144570
    mapChunk_145130
    560 561
    mapChunk_144570_count
    mapChunk_145130_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_143450_002241_count :
    mapNode_143450_002241.count = 2241 :=
  map_count_branch
    mapNode_143450_001120
    mapNode_144570_001121
    1120 1121
    mapNode_143450_001120_count
    mapNode_144570_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_145691_count :
    mapChunk_145691.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_146251_count :
    mapChunk_146251.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_145691_001120_count :
    mapNode_145691_001120.count = 1120 :=
  map_count_branch
    mapChunk_145691
    mapChunk_146251
    560 560
    mapChunk_145691_count
    mapChunk_146251_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_146811_count :
    mapChunk_146811.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_147371_count :
    mapChunk_147371.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_146811_001121_count :
    mapNode_146811_001121.count = 1121 :=
  map_count_branch
    mapChunk_146811
    mapChunk_147371
    560 561
    mapChunk_146811_count
    mapChunk_147371_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_145691_002241_count :
    mapNode_145691_002241.count = 2241 :=
  map_count_branch
    mapNode_145691_001120
    mapNode_146811_001121
    1120 1121
    mapNode_145691_001120_count
    mapNode_146811_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_143450_004482_count :
    mapNode_143450_004482.count = 4482 :=
  map_count_branch
    mapNode_143450_002241
    mapNode_145691_002241
    2241 2241
    mapNode_143450_002241_count
    mapNode_145691_002241_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_147932_count :
    mapChunk_147932.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_148492_count :
    mapChunk_148492.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_147932_001120_count :
    mapNode_147932_001120.count = 1120 :=
  map_count_branch
    mapChunk_147932
    mapChunk_148492
    560 560
    mapChunk_147932_count
    mapChunk_148492_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_149052_count :
    mapChunk_149052.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_149612_count :
    mapChunk_149612.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_149052_001121_count :
    mapNode_149052_001121.count = 1121 :=
  map_count_branch
    mapChunk_149052
    mapChunk_149612
    560 561
    mapChunk_149052_count
    mapChunk_149612_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_147932_002241_count :
    mapNode_147932_002241.count = 2241 :=
  map_count_branch
    mapNode_147932_001120
    mapNode_149052_001121
    1120 1121
    mapNode_147932_001120_count
    mapNode_149052_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_150173_count :
    mapChunk_150173.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_150733_count :
    mapChunk_150733.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_150173_001121_count :
    mapNode_150173_001121.count = 1121 :=
  map_count_branch
    mapChunk_150173
    mapChunk_150733
    560 561
    mapChunk_150173_count
    mapChunk_150733_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_151294_count :
    mapChunk_151294.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_151854_count :
    mapChunk_151854.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_151294_001121_count :
    mapNode_151294_001121.count = 1121 :=
  map_count_branch
    mapChunk_151294
    mapChunk_151854
    560 561
    mapChunk_151294_count
    mapChunk_151854_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_150173_002242_count :
    mapNode_150173_002242.count = 2242 :=
  map_count_branch
    mapNode_150173_001121
    mapNode_151294_001121
    1121 1121
    mapNode_150173_001121_count
    mapNode_151294_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_147932_004483_count :
    mapNode_147932_004483.count = 4483 :=
  map_count_branch
    mapNode_147932_002241
    mapNode_150173_002242
    2241 2242
    mapNode_147932_002241_count
    mapNode_150173_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_143450_008965_count :
    mapNode_143450_008965.count = 8965 :=
  map_count_branch
    mapNode_143450_004482
    mapNode_147932_004483
    4482 4483
    mapNode_143450_004482_count
    mapNode_147932_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_152415_count :
    mapChunk_152415.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_152975_count :
    mapChunk_152975.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_152415_001120_count :
    mapNode_152415_001120.count = 1120 :=
  map_count_branch
    mapChunk_152415
    mapChunk_152975
    560 560
    mapChunk_152415_count
    mapChunk_152975_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_153535_count :
    mapChunk_153535.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_154095_count :
    mapChunk_154095.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_153535_001121_count :
    mapNode_153535_001121.count = 1121 :=
  map_count_branch
    mapChunk_153535
    mapChunk_154095
    560 561
    mapChunk_153535_count
    mapChunk_154095_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_152415_002241_count :
    mapNode_152415_002241.count = 2241 :=
  map_count_branch
    mapNode_152415_001120
    mapNode_153535_001121
    1120 1121
    mapNode_152415_001120_count
    mapNode_153535_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_154656_count :
    mapChunk_154656.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_155216_count :
    mapChunk_155216.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_154656_001121_count :
    mapNode_154656_001121.count = 1121 :=
  map_count_branch
    mapChunk_154656
    mapChunk_155216
    560 561
    mapChunk_154656_count
    mapChunk_155216_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_155777_count :
    mapChunk_155777.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_156337_count :
    mapChunk_156337.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_155777_001121_count :
    mapNode_155777_001121.count = 1121 :=
  map_count_branch
    mapChunk_155777
    mapChunk_156337
    560 561
    mapChunk_155777_count
    mapChunk_156337_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_154656_002242_count :
    mapNode_154656_002242.count = 2242 :=
  map_count_branch
    mapNode_154656_001121
    mapNode_155777_001121
    1121 1121
    mapNode_154656_001121_count
    mapNode_155777_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_152415_004483_count :
    mapNode_152415_004483.count = 4483 :=
  map_count_branch
    mapNode_152415_002241
    mapNode_154656_002242
    2241 2242
    mapNode_152415_002241_count
    mapNode_154656_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_156898_count :
    mapChunk_156898.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_157458_count :
    mapChunk_157458.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_156898_001120_count :
    mapNode_156898_001120.count = 1120 :=
  map_count_branch
    mapChunk_156898
    mapChunk_157458
    560 560
    mapChunk_156898_count
    mapChunk_157458_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_158018_count :
    mapChunk_158018.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_158578_count :
    mapChunk_158578.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_158018_001121_count :
    mapNode_158018_001121.count = 1121 :=
  map_count_branch
    mapChunk_158018
    mapChunk_158578
    560 561
    mapChunk_158018_count
    mapChunk_158578_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_156898_002241_count :
    mapNode_156898_002241.count = 2241 :=
  map_count_branch
    mapNode_156898_001120
    mapNode_158018_001121
    1120 1121
    mapNode_156898_001120_count
    mapNode_158018_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_159139_count :
    mapChunk_159139.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_159699_count :
    mapChunk_159699.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_159139_001121_count :
    mapNode_159139_001121.count = 1121 :=
  map_count_branch
    mapChunk_159139
    mapChunk_159699
    560 561
    mapChunk_159139_count
    mapChunk_159699_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_160260_count :
    mapChunk_160260.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_160820_count :
    mapChunk_160820.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_160260_001121_count :
    mapNode_160260_001121.count = 1121 :=
  map_count_branch
    mapChunk_160260
    mapChunk_160820
    560 561
    mapChunk_160260_count
    mapChunk_160820_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_159139_002242_count :
    mapNode_159139_002242.count = 2242 :=
  map_count_branch
    mapNode_159139_001121
    mapNode_160260_001121
    1121 1121
    mapNode_159139_001121_count
    mapNode_160260_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_156898_004483_count :
    mapNode_156898_004483.count = 4483 :=
  map_count_branch
    mapNode_156898_002241
    mapNode_159139_002242
    2241 2242
    mapNode_156898_002241_count
    mapNode_159139_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_152415_008966_count :
    mapNode_152415_008966.count = 8966 :=
  map_count_branch
    mapNode_152415_004483
    mapNode_156898_004483
    4483 4483
    mapNode_152415_004483_count
    mapNode_156898_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_143450_017931_count :
    mapNode_143450_017931.count = 17931 :=
  map_count_branch
    mapNode_143450_008965
    mapNode_152415_008966
    8965 8966
    mapNode_143450_008965_count
    mapNode_152415_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_161381_count :
    mapChunk_161381.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_161941_count :
    mapChunk_161941.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_161381_001120_count :
    mapNode_161381_001120.count = 1120 :=
  map_count_branch
    mapChunk_161381
    mapChunk_161941
    560 560
    mapChunk_161381_count
    mapChunk_161941_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_162501_count :
    mapChunk_162501.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_163061_count :
    mapChunk_163061.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_162501_001121_count :
    mapNode_162501_001121.count = 1121 :=
  map_count_branch
    mapChunk_162501
    mapChunk_163061
    560 561
    mapChunk_162501_count
    mapChunk_163061_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_161381_002241_count :
    mapNode_161381_002241.count = 2241 :=
  map_count_branch
    mapNode_161381_001120
    mapNode_162501_001121
    1120 1121
    mapNode_161381_001120_count
    mapNode_162501_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_163622_count :
    mapChunk_163622.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_164182_count :
    mapChunk_164182.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_163622_001120_count :
    mapNode_163622_001120.count = 1120 :=
  map_count_branch
    mapChunk_163622
    mapChunk_164182
    560 560
    mapChunk_163622_count
    mapChunk_164182_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_164742_count :
    mapChunk_164742.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_165302_count :
    mapChunk_165302.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_164742_001121_count :
    mapNode_164742_001121.count = 1121 :=
  map_count_branch
    mapChunk_164742
    mapChunk_165302
    560 561
    mapChunk_164742_count
    mapChunk_165302_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_163622_002241_count :
    mapNode_163622_002241.count = 2241 :=
  map_count_branch
    mapNode_163622_001120
    mapNode_164742_001121
    1120 1121
    mapNode_163622_001120_count
    mapNode_164742_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_161381_004482_count :
    mapNode_161381_004482.count = 4482 :=
  map_count_branch
    mapNode_161381_002241
    mapNode_163622_002241
    2241 2241
    mapNode_161381_002241_count
    mapNode_163622_002241_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_165863_count :
    mapChunk_165863.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_166423_count :
    mapChunk_166423.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_165863_001120_count :
    mapNode_165863_001120.count = 1120 :=
  map_count_branch
    mapChunk_165863
    mapChunk_166423
    560 560
    mapChunk_165863_count
    mapChunk_166423_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_166983_count :
    mapChunk_166983.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_167543_count :
    mapChunk_167543.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_166983_001121_count :
    mapNode_166983_001121.count = 1121 :=
  map_count_branch
    mapChunk_166983
    mapChunk_167543
    560 561
    mapChunk_166983_count
    mapChunk_167543_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_165863_002241_count :
    mapNode_165863_002241.count = 2241 :=
  map_count_branch
    mapNode_165863_001120
    mapNode_166983_001121
    1120 1121
    mapNode_165863_001120_count
    mapNode_166983_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_168104_count :
    mapChunk_168104.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_168664_count :
    mapChunk_168664.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_168104_001121_count :
    mapNode_168104_001121.count = 1121 :=
  map_count_branch
    mapChunk_168104
    mapChunk_168664
    560 561
    mapChunk_168104_count
    mapChunk_168664_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_169225_count :
    mapChunk_169225.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_169785_count :
    mapChunk_169785.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_169225_001121_count :
    mapNode_169225_001121.count = 1121 :=
  map_count_branch
    mapChunk_169225
    mapChunk_169785
    560 561
    mapChunk_169225_count
    mapChunk_169785_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_168104_002242_count :
    mapNode_168104_002242.count = 2242 :=
  map_count_branch
    mapNode_168104_001121
    mapNode_169225_001121
    1121 1121
    mapNode_168104_001121_count
    mapNode_169225_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_165863_004483_count :
    mapNode_165863_004483.count = 4483 :=
  map_count_branch
    mapNode_165863_002241
    mapNode_168104_002242
    2241 2242
    mapNode_165863_002241_count
    mapNode_168104_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_161381_008965_count :
    mapNode_161381_008965.count = 8965 :=
  map_count_branch
    mapNode_161381_004482
    mapNode_165863_004483
    4482 4483
    mapNode_161381_004482_count
    mapNode_165863_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_170346_count :
    mapChunk_170346.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_170906_count :
    mapChunk_170906.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_170346_001120_count :
    mapNode_170346_001120.count = 1120 :=
  map_count_branch
    mapChunk_170346
    mapChunk_170906
    560 560
    mapChunk_170346_count
    mapChunk_170906_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_171466_count :
    mapChunk_171466.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_172026_count :
    mapChunk_172026.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_171466_001121_count :
    mapNode_171466_001121.count = 1121 :=
  map_count_branch
    mapChunk_171466
    mapChunk_172026
    560 561
    mapChunk_171466_count
    mapChunk_172026_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_170346_002241_count :
    mapNode_170346_002241.count = 2241 :=
  map_count_branch
    mapNode_170346_001120
    mapNode_171466_001121
    1120 1121
    mapNode_170346_001120_count
    mapNode_171466_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_172587_count :
    mapChunk_172587.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_173147_count :
    mapChunk_173147.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_172587_001121_count :
    mapNode_172587_001121.count = 1121 :=
  map_count_branch
    mapChunk_172587
    mapChunk_173147
    560 561
    mapChunk_172587_count
    mapChunk_173147_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_173708_count :
    mapChunk_173708.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_174268_count :
    mapChunk_174268.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_173708_001121_count :
    mapNode_173708_001121.count = 1121 :=
  map_count_branch
    mapChunk_173708
    mapChunk_174268
    560 561
    mapChunk_173708_count
    mapChunk_174268_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_172587_002242_count :
    mapNode_172587_002242.count = 2242 :=
  map_count_branch
    mapNode_172587_001121
    mapNode_173708_001121
    1121 1121
    mapNode_172587_001121_count
    mapNode_173708_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_170346_004483_count :
    mapNode_170346_004483.count = 4483 :=
  map_count_branch
    mapNode_170346_002241
    mapNode_172587_002242
    2241 2242
    mapNode_170346_002241_count
    mapNode_172587_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_174829_count :
    mapChunk_174829.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_175389_count :
    mapChunk_175389.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_174829_001120_count :
    mapNode_174829_001120.count = 1120 :=
  map_count_branch
    mapChunk_174829
    mapChunk_175389
    560 560
    mapChunk_174829_count
    mapChunk_175389_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_175949_count :
    mapChunk_175949.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_176509_count :
    mapChunk_176509.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_175949_001121_count :
    mapNode_175949_001121.count = 1121 :=
  map_count_branch
    mapChunk_175949
    mapChunk_176509
    560 561
    mapChunk_175949_count
    mapChunk_176509_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_174829_002241_count :
    mapNode_174829_002241.count = 2241 :=
  map_count_branch
    mapNode_174829_001120
    mapNode_175949_001121
    1120 1121
    mapNode_174829_001120_count
    mapNode_175949_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_177070_count :
    mapChunk_177070.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_177630_count :
    mapChunk_177630.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_177070_001121_count :
    mapNode_177070_001121.count = 1121 :=
  map_count_branch
    mapChunk_177070
    mapChunk_177630
    560 561
    mapChunk_177070_count
    mapChunk_177630_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_178191_count :
    mapChunk_178191.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_178751_count :
    mapChunk_178751.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_178191_001121_count :
    mapNode_178191_001121.count = 1121 :=
  map_count_branch
    mapChunk_178191
    mapChunk_178751
    560 561
    mapChunk_178191_count
    mapChunk_178751_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_177070_002242_count :
    mapNode_177070_002242.count = 2242 :=
  map_count_branch
    mapNode_177070_001121
    mapNode_178191_001121
    1121 1121
    mapNode_177070_001121_count
    mapNode_178191_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_174829_004483_count :
    mapNode_174829_004483.count = 4483 :=
  map_count_branch
    mapNode_174829_002241
    mapNode_177070_002242
    2241 2242
    mapNode_174829_002241_count
    mapNode_177070_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_170346_008966_count :
    mapNode_170346_008966.count = 8966 :=
  map_count_branch
    mapNode_170346_004483
    mapNode_174829_004483
    4483 4483
    mapNode_170346_004483_count
    mapNode_174829_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_161381_017931_count :
    mapNode_161381_017931.count = 17931 :=
  map_count_branch
    mapNode_161381_008965
    mapNode_170346_008966
    8965 8966
    mapNode_161381_008965_count
    mapNode_170346_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_143450_035862_count :
    mapNode_143450_035862.count = 35862 :=
  map_count_branch
    mapNode_143450_017931
    mapNode_161381_017931
    17931 17931
    mapNode_143450_017931_count
    mapNode_161381_017931_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_179312_count :
    mapChunk_179312.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_179872_count :
    mapChunk_179872.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_179312_001120_count :
    mapNode_179312_001120.count = 1120 :=
  map_count_branch
    mapChunk_179312
    mapChunk_179872
    560 560
    mapChunk_179312_count
    mapChunk_179872_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_180432_count :
    mapChunk_180432.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_180992_count :
    mapChunk_180992.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_180432_001121_count :
    mapNode_180432_001121.count = 1121 :=
  map_count_branch
    mapChunk_180432
    mapChunk_180992
    560 561
    mapChunk_180432_count
    mapChunk_180992_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_179312_002241_count :
    mapNode_179312_002241.count = 2241 :=
  map_count_branch
    mapNode_179312_001120
    mapNode_180432_001121
    1120 1121
    mapNode_179312_001120_count
    mapNode_180432_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_181553_count :
    mapChunk_181553.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_182113_count :
    mapChunk_182113.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_181553_001120_count :
    mapNode_181553_001120.count = 1120 :=
  map_count_branch
    mapChunk_181553
    mapChunk_182113
    560 560
    mapChunk_181553_count
    mapChunk_182113_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_182673_count :
    mapChunk_182673.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_183233_count :
    mapChunk_183233.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_182673_001121_count :
    mapNode_182673_001121.count = 1121 :=
  map_count_branch
    mapChunk_182673
    mapChunk_183233
    560 561
    mapChunk_182673_count
    mapChunk_183233_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_181553_002241_count :
    mapNode_181553_002241.count = 2241 :=
  map_count_branch
    mapNode_181553_001120
    mapNode_182673_001121
    1120 1121
    mapNode_181553_001120_count
    mapNode_182673_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_179312_004482_count :
    mapNode_179312_004482.count = 4482 :=
  map_count_branch
    mapNode_179312_002241
    mapNode_181553_002241
    2241 2241
    mapNode_179312_002241_count
    mapNode_181553_002241_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_183794_count :
    mapChunk_183794.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_184354_count :
    mapChunk_184354.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_183794_001120_count :
    mapNode_183794_001120.count = 1120 :=
  map_count_branch
    mapChunk_183794
    mapChunk_184354
    560 560
    mapChunk_183794_count
    mapChunk_184354_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_184914_count :
    mapChunk_184914.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_185474_count :
    mapChunk_185474.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_184914_001121_count :
    mapNode_184914_001121.count = 1121 :=
  map_count_branch
    mapChunk_184914
    mapChunk_185474
    560 561
    mapChunk_184914_count
    mapChunk_185474_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_183794_002241_count :
    mapNode_183794_002241.count = 2241 :=
  map_count_branch
    mapNode_183794_001120
    mapNode_184914_001121
    1120 1121
    mapNode_183794_001120_count
    mapNode_184914_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_186035_count :
    mapChunk_186035.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_186595_count :
    mapChunk_186595.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_186035_001121_count :
    mapNode_186035_001121.count = 1121 :=
  map_count_branch
    mapChunk_186035
    mapChunk_186595
    560 561
    mapChunk_186035_count
    mapChunk_186595_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_187156_count :
    mapChunk_187156.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_187716_count :
    mapChunk_187716.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_187156_001121_count :
    mapNode_187156_001121.count = 1121 :=
  map_count_branch
    mapChunk_187156
    mapChunk_187716
    560 561
    mapChunk_187156_count
    mapChunk_187716_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_186035_002242_count :
    mapNode_186035_002242.count = 2242 :=
  map_count_branch
    mapNode_186035_001121
    mapNode_187156_001121
    1121 1121
    mapNode_186035_001121_count
    mapNode_187156_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_183794_004483_count :
    mapNode_183794_004483.count = 4483 :=
  map_count_branch
    mapNode_183794_002241
    mapNode_186035_002242
    2241 2242
    mapNode_183794_002241_count
    mapNode_186035_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_179312_008965_count :
    mapNode_179312_008965.count = 8965 :=
  map_count_branch
    mapNode_179312_004482
    mapNode_183794_004483
    4482 4483
    mapNode_179312_004482_count
    mapNode_183794_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_188277_count :
    mapChunk_188277.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_188837_count :
    mapChunk_188837.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_188277_001120_count :
    mapNode_188277_001120.count = 1120 :=
  map_count_branch
    mapChunk_188277
    mapChunk_188837
    560 560
    mapChunk_188277_count
    mapChunk_188837_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_189397_count :
    mapChunk_189397.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_189957_count :
    mapChunk_189957.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_189397_001121_count :
    mapNode_189397_001121.count = 1121 :=
  map_count_branch
    mapChunk_189397
    mapChunk_189957
    560 561
    mapChunk_189397_count
    mapChunk_189957_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_188277_002241_count :
    mapNode_188277_002241.count = 2241 :=
  map_count_branch
    mapNode_188277_001120
    mapNode_189397_001121
    1120 1121
    mapNode_188277_001120_count
    mapNode_189397_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_190518_count :
    mapChunk_190518.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_191078_count :
    mapChunk_191078.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_190518_001121_count :
    mapNode_190518_001121.count = 1121 :=
  map_count_branch
    mapChunk_190518
    mapChunk_191078
    560 561
    mapChunk_190518_count
    mapChunk_191078_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_191639_count :
    mapChunk_191639.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_192199_count :
    mapChunk_192199.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_191639_001121_count :
    mapNode_191639_001121.count = 1121 :=
  map_count_branch
    mapChunk_191639
    mapChunk_192199
    560 561
    mapChunk_191639_count
    mapChunk_192199_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_190518_002242_count :
    mapNode_190518_002242.count = 2242 :=
  map_count_branch
    mapNode_190518_001121
    mapNode_191639_001121
    1121 1121
    mapNode_190518_001121_count
    mapNode_191639_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_188277_004483_count :
    mapNode_188277_004483.count = 4483 :=
  map_count_branch
    mapNode_188277_002241
    mapNode_190518_002242
    2241 2242
    mapNode_188277_002241_count
    mapNode_190518_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_192760_count :
    mapChunk_192760.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_193320_count :
    mapChunk_193320.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_192760_001120_count :
    mapNode_192760_001120.count = 1120 :=
  map_count_branch
    mapChunk_192760
    mapChunk_193320
    560 560
    mapChunk_192760_count
    mapChunk_193320_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_193880_count :
    mapChunk_193880.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_194440_count :
    mapChunk_194440.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_193880_001121_count :
    mapNode_193880_001121.count = 1121 :=
  map_count_branch
    mapChunk_193880
    mapChunk_194440
    560 561
    mapChunk_193880_count
    mapChunk_194440_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_192760_002241_count :
    mapNode_192760_002241.count = 2241 :=
  map_count_branch
    mapNode_192760_001120
    mapNode_193880_001121
    1120 1121
    mapNode_192760_001120_count
    mapNode_193880_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_195001_count :
    mapChunk_195001.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_195561_count :
    mapChunk_195561.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_195001_001121_count :
    mapNode_195001_001121.count = 1121 :=
  map_count_branch
    mapChunk_195001
    mapChunk_195561
    560 561
    mapChunk_195001_count
    mapChunk_195561_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_196122_count :
    mapChunk_196122.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_196682_count :
    mapChunk_196682.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_196122_001121_count :
    mapNode_196122_001121.count = 1121 :=
  map_count_branch
    mapChunk_196122
    mapChunk_196682
    560 561
    mapChunk_196122_count
    mapChunk_196682_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_195001_002242_count :
    mapNode_195001_002242.count = 2242 :=
  map_count_branch
    mapNode_195001_001121
    mapNode_196122_001121
    1121 1121
    mapNode_195001_001121_count
    mapNode_196122_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_192760_004483_count :
    mapNode_192760_004483.count = 4483 :=
  map_count_branch
    mapNode_192760_002241
    mapNode_195001_002242
    2241 2242
    mapNode_192760_002241_count
    mapNode_195001_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_188277_008966_count :
    mapNode_188277_008966.count = 8966 :=
  map_count_branch
    mapNode_188277_004483
    mapNode_192760_004483
    4483 4483
    mapNode_188277_004483_count
    mapNode_192760_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_179312_017931_count :
    mapNode_179312_017931.count = 17931 :=
  map_count_branch
    mapNode_179312_008965
    mapNode_188277_008966
    8965 8966
    mapNode_179312_008965_count
    mapNode_188277_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_197243_count :
    mapChunk_197243.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_197803_count :
    mapChunk_197803.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_197243_001120_count :
    mapNode_197243_001120.count = 1120 :=
  map_count_branch
    mapChunk_197243
    mapChunk_197803
    560 560
    mapChunk_197243_count
    mapChunk_197803_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_198363_count :
    mapChunk_198363.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_198923_count :
    mapChunk_198923.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_198363_001121_count :
    mapNode_198363_001121.count = 1121 :=
  map_count_branch
    mapChunk_198363
    mapChunk_198923
    560 561
    mapChunk_198363_count
    mapChunk_198923_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_197243_002241_count :
    mapNode_197243_002241.count = 2241 :=
  map_count_branch
    mapNode_197243_001120
    mapNode_198363_001121
    1120 1121
    mapNode_197243_001120_count
    mapNode_198363_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_199484_count :
    mapChunk_199484.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_200044_count :
    mapChunk_200044.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_199484_001121_count :
    mapNode_199484_001121.count = 1121 :=
  map_count_branch
    mapChunk_199484
    mapChunk_200044
    560 561
    mapChunk_199484_count
    mapChunk_200044_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_200605_count :
    mapChunk_200605.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_201165_count :
    mapChunk_201165.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_200605_001121_count :
    mapNode_200605_001121.count = 1121 :=
  map_count_branch
    mapChunk_200605
    mapChunk_201165
    560 561
    mapChunk_200605_count
    mapChunk_201165_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_199484_002242_count :
    mapNode_199484_002242.count = 2242 :=
  map_count_branch
    mapNode_199484_001121
    mapNode_200605_001121
    1121 1121
    mapNode_199484_001121_count
    mapNode_200605_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_197243_004483_count :
    mapNode_197243_004483.count = 4483 :=
  map_count_branch
    mapNode_197243_002241
    mapNode_199484_002242
    2241 2242
    mapNode_197243_002241_count
    mapNode_199484_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_201726_count :
    mapChunk_201726.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_202286_count :
    mapChunk_202286.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_201726_001120_count :
    mapNode_201726_001120.count = 1120 :=
  map_count_branch
    mapChunk_201726
    mapChunk_202286
    560 560
    mapChunk_201726_count
    mapChunk_202286_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_202846_count :
    mapChunk_202846.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_203406_count :
    mapChunk_203406.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_202846_001121_count :
    mapNode_202846_001121.count = 1121 :=
  map_count_branch
    mapChunk_202846
    mapChunk_203406
    560 561
    mapChunk_202846_count
    mapChunk_203406_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_201726_002241_count :
    mapNode_201726_002241.count = 2241 :=
  map_count_branch
    mapNode_201726_001120
    mapNode_202846_001121
    1120 1121
    mapNode_201726_001120_count
    mapNode_202846_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_203967_count :
    mapChunk_203967.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_204527_count :
    mapChunk_204527.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_203967_001121_count :
    mapNode_203967_001121.count = 1121 :=
  map_count_branch
    mapChunk_203967
    mapChunk_204527
    560 561
    mapChunk_203967_count
    mapChunk_204527_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_205088_count :
    mapChunk_205088.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_205648_count :
    mapChunk_205648.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_205088_001121_count :
    mapNode_205088_001121.count = 1121 :=
  map_count_branch
    mapChunk_205088
    mapChunk_205648
    560 561
    mapChunk_205088_count
    mapChunk_205648_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_203967_002242_count :
    mapNode_203967_002242.count = 2242 :=
  map_count_branch
    mapNode_203967_001121
    mapNode_205088_001121
    1121 1121
    mapNode_203967_001121_count
    mapNode_205088_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_201726_004483_count :
    mapNode_201726_004483.count = 4483 :=
  map_count_branch
    mapNode_201726_002241
    mapNode_203967_002242
    2241 2242
    mapNode_201726_002241_count
    mapNode_203967_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_197243_008966_count :
    mapNode_197243_008966.count = 8966 :=
  map_count_branch
    mapNode_197243_004483
    mapNode_201726_004483
    4483 4483
    mapNode_197243_004483_count
    mapNode_201726_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_206209_count :
    mapChunk_206209.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_206769_count :
    mapChunk_206769.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_206209_001120_count :
    mapNode_206209_001120.count = 1120 :=
  map_count_branch
    mapChunk_206209
    mapChunk_206769
    560 560
    mapChunk_206209_count
    mapChunk_206769_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_207329_count :
    mapChunk_207329.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_207889_count :
    mapChunk_207889.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_207329_001121_count :
    mapNode_207329_001121.count = 1121 :=
  map_count_branch
    mapChunk_207329
    mapChunk_207889
    560 561
    mapChunk_207329_count
    mapChunk_207889_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_206209_002241_count :
    mapNode_206209_002241.count = 2241 :=
  map_count_branch
    mapNode_206209_001120
    mapNode_207329_001121
    1120 1121
    mapNode_206209_001120_count
    mapNode_207329_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_208450_count :
    mapChunk_208450.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_209010_count :
    mapChunk_209010.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_208450_001121_count :
    mapNode_208450_001121.count = 1121 :=
  map_count_branch
    mapChunk_208450
    mapChunk_209010
    560 561
    mapChunk_208450_count
    mapChunk_209010_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_209571_count :
    mapChunk_209571.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_210131_count :
    mapChunk_210131.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_209571_001121_count :
    mapNode_209571_001121.count = 1121 :=
  map_count_branch
    mapChunk_209571
    mapChunk_210131
    560 561
    mapChunk_209571_count
    mapChunk_210131_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_208450_002242_count :
    mapNode_208450_002242.count = 2242 :=
  map_count_branch
    mapNode_208450_001121
    mapNode_209571_001121
    1121 1121
    mapNode_208450_001121_count
    mapNode_209571_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_206209_004483_count :
    mapNode_206209_004483.count = 4483 :=
  map_count_branch
    mapNode_206209_002241
    mapNode_208450_002242
    2241 2242
    mapNode_206209_002241_count
    mapNode_208450_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_210692_count :
    mapChunk_210692.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_211252_count :
    mapChunk_211252.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_210692_001120_count :
    mapNode_210692_001120.count = 1120 :=
  map_count_branch
    mapChunk_210692
    mapChunk_211252
    560 560
    mapChunk_210692_count
    mapChunk_211252_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_211812_count :
    mapChunk_211812.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_212372_count :
    mapChunk_212372.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_211812_001121_count :
    mapNode_211812_001121.count = 1121 :=
  map_count_branch
    mapChunk_211812
    mapChunk_212372
    560 561
    mapChunk_211812_count
    mapChunk_212372_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_210692_002241_count :
    mapNode_210692_002241.count = 2241 :=
  map_count_branch
    mapNode_210692_001120
    mapNode_211812_001121
    1120 1121
    mapNode_210692_001120_count
    mapNode_211812_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_212933_count :
    mapChunk_212933.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_213493_count :
    mapChunk_213493.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_212933_001121_count :
    mapNode_212933_001121.count = 1121 :=
  map_count_branch
    mapChunk_212933
    mapChunk_213493
    560 561
    mapChunk_212933_count
    mapChunk_213493_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_214054_count :
    mapChunk_214054.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_214614_count :
    mapChunk_214614.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_214054_001121_count :
    mapNode_214054_001121.count = 1121 :=
  map_count_branch
    mapChunk_214054
    mapChunk_214614
    560 561
    mapChunk_214054_count
    mapChunk_214614_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_212933_002242_count :
    mapNode_212933_002242.count = 2242 :=
  map_count_branch
    mapNode_212933_001121
    mapNode_214054_001121
    1121 1121
    mapNode_212933_001121_count
    mapNode_214054_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_210692_004483_count :
    mapNode_210692_004483.count = 4483 :=
  map_count_branch
    mapNode_210692_002241
    mapNode_212933_002242
    2241 2242
    mapNode_210692_002241_count
    mapNode_212933_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_206209_008966_count :
    mapNode_206209_008966.count = 8966 :=
  map_count_branch
    mapNode_206209_004483
    mapNode_210692_004483
    4483 4483
    mapNode_206209_004483_count
    mapNode_210692_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_197243_017932_count :
    mapNode_197243_017932.count = 17932 :=
  map_count_branch
    mapNode_197243_008966
    mapNode_206209_008966
    8966 8966
    mapNode_197243_008966_count
    mapNode_206209_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_179312_035863_count :
    mapNode_179312_035863.count = 35863 :=
  map_count_branch
    mapNode_179312_017931
    mapNode_197243_017932
    17931 17932
    mapNode_179312_017931_count
    mapNode_197243_017932_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_143450_071725_count :
    mapNode_143450_071725.count = 71725 :=
  map_count_branch
    mapNode_143450_035862
    mapNode_179312_035863
    35862 35863
    mapNode_143450_035862_count
    mapNode_179312_035863_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_215175_count :
    mapChunk_215175.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_215735_count :
    mapChunk_215735.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_215175_001120_count :
    mapNode_215175_001120.count = 1120 :=
  map_count_branch
    mapChunk_215175
    mapChunk_215735
    560 560
    mapChunk_215175_count
    mapChunk_215735_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_216295_count :
    mapChunk_216295.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_216855_count :
    mapChunk_216855.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_216295_001121_count :
    mapNode_216295_001121.count = 1121 :=
  map_count_branch
    mapChunk_216295
    mapChunk_216855
    560 561
    mapChunk_216295_count
    mapChunk_216855_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_215175_002241_count :
    mapNode_215175_002241.count = 2241 :=
  map_count_branch
    mapNode_215175_001120
    mapNode_216295_001121
    1120 1121
    mapNode_215175_001120_count
    mapNode_216295_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_217416_count :
    mapChunk_217416.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_217976_count :
    mapChunk_217976.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_217416_001120_count :
    mapNode_217416_001120.count = 1120 :=
  map_count_branch
    mapChunk_217416
    mapChunk_217976
    560 560
    mapChunk_217416_count
    mapChunk_217976_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_218536_count :
    mapChunk_218536.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_219096_count :
    mapChunk_219096.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_218536_001121_count :
    mapNode_218536_001121.count = 1121 :=
  map_count_branch
    mapChunk_218536
    mapChunk_219096
    560 561
    mapChunk_218536_count
    mapChunk_219096_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_217416_002241_count :
    mapNode_217416_002241.count = 2241 :=
  map_count_branch
    mapNode_217416_001120
    mapNode_218536_001121
    1120 1121
    mapNode_217416_001120_count
    mapNode_218536_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_215175_004482_count :
    mapNode_215175_004482.count = 4482 :=
  map_count_branch
    mapNode_215175_002241
    mapNode_217416_002241
    2241 2241
    mapNode_215175_002241_count
    mapNode_217416_002241_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_219657_count :
    mapChunk_219657.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_220217_count :
    mapChunk_220217.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_219657_001120_count :
    mapNode_219657_001120.count = 1120 :=
  map_count_branch
    mapChunk_219657
    mapChunk_220217
    560 560
    mapChunk_219657_count
    mapChunk_220217_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_220777_count :
    mapChunk_220777.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_221337_count :
    mapChunk_221337.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_220777_001121_count :
    mapNode_220777_001121.count = 1121 :=
  map_count_branch
    mapChunk_220777
    mapChunk_221337
    560 561
    mapChunk_220777_count
    mapChunk_221337_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_219657_002241_count :
    mapNode_219657_002241.count = 2241 :=
  map_count_branch
    mapNode_219657_001120
    mapNode_220777_001121
    1120 1121
    mapNode_219657_001120_count
    mapNode_220777_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_221898_count :
    mapChunk_221898.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_222458_count :
    mapChunk_222458.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_221898_001121_count :
    mapNode_221898_001121.count = 1121 :=
  map_count_branch
    mapChunk_221898
    mapChunk_222458
    560 561
    mapChunk_221898_count
    mapChunk_222458_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_223019_count :
    mapChunk_223019.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_223579_count :
    mapChunk_223579.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_223019_001121_count :
    mapNode_223019_001121.count = 1121 :=
  map_count_branch
    mapChunk_223019
    mapChunk_223579
    560 561
    mapChunk_223019_count
    mapChunk_223579_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_221898_002242_count :
    mapNode_221898_002242.count = 2242 :=
  map_count_branch
    mapNode_221898_001121
    mapNode_223019_001121
    1121 1121
    mapNode_221898_001121_count
    mapNode_223019_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_219657_004483_count :
    mapNode_219657_004483.count = 4483 :=
  map_count_branch
    mapNode_219657_002241
    mapNode_221898_002242
    2241 2242
    mapNode_219657_002241_count
    mapNode_221898_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_215175_008965_count :
    mapNode_215175_008965.count = 8965 :=
  map_count_branch
    mapNode_215175_004482
    mapNode_219657_004483
    4482 4483
    mapNode_215175_004482_count
    mapNode_219657_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_224140_count :
    mapChunk_224140.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_224700_count :
    mapChunk_224700.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_224140_001120_count :
    mapNode_224140_001120.count = 1120 :=
  map_count_branch
    mapChunk_224140
    mapChunk_224700
    560 560
    mapChunk_224140_count
    mapChunk_224700_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_225260_count :
    mapChunk_225260.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_225820_count :
    mapChunk_225820.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_225260_001121_count :
    mapNode_225260_001121.count = 1121 :=
  map_count_branch
    mapChunk_225260
    mapChunk_225820
    560 561
    mapChunk_225260_count
    mapChunk_225820_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_224140_002241_count :
    mapNode_224140_002241.count = 2241 :=
  map_count_branch
    mapNode_224140_001120
    mapNode_225260_001121
    1120 1121
    mapNode_224140_001120_count
    mapNode_225260_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_226381_count :
    mapChunk_226381.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_226941_count :
    mapChunk_226941.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_226381_001121_count :
    mapNode_226381_001121.count = 1121 :=
  map_count_branch
    mapChunk_226381
    mapChunk_226941
    560 561
    mapChunk_226381_count
    mapChunk_226941_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_227502_count :
    mapChunk_227502.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_228062_count :
    mapChunk_228062.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_227502_001121_count :
    mapNode_227502_001121.count = 1121 :=
  map_count_branch
    mapChunk_227502
    mapChunk_228062
    560 561
    mapChunk_227502_count
    mapChunk_228062_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_226381_002242_count :
    mapNode_226381_002242.count = 2242 :=
  map_count_branch
    mapNode_226381_001121
    mapNode_227502_001121
    1121 1121
    mapNode_226381_001121_count
    mapNode_227502_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_224140_004483_count :
    mapNode_224140_004483.count = 4483 :=
  map_count_branch
    mapNode_224140_002241
    mapNode_226381_002242
    2241 2242
    mapNode_224140_002241_count
    mapNode_226381_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_228623_count :
    mapChunk_228623.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_229183_count :
    mapChunk_229183.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_228623_001120_count :
    mapNode_228623_001120.count = 1120 :=
  map_count_branch
    mapChunk_228623
    mapChunk_229183
    560 560
    mapChunk_228623_count
    mapChunk_229183_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_229743_count :
    mapChunk_229743.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_230303_count :
    mapChunk_230303.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_229743_001121_count :
    mapNode_229743_001121.count = 1121 :=
  map_count_branch
    mapChunk_229743
    mapChunk_230303
    560 561
    mapChunk_229743_count
    mapChunk_230303_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_228623_002241_count :
    mapNode_228623_002241.count = 2241 :=
  map_count_branch
    mapNode_228623_001120
    mapNode_229743_001121
    1120 1121
    mapNode_228623_001120_count
    mapNode_229743_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_230864_count :
    mapChunk_230864.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_231424_count :
    mapChunk_231424.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_230864_001121_count :
    mapNode_230864_001121.count = 1121 :=
  map_count_branch
    mapChunk_230864
    mapChunk_231424
    560 561
    mapChunk_230864_count
    mapChunk_231424_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_231985_count :
    mapChunk_231985.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_232545_count :
    mapChunk_232545.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_231985_001121_count :
    mapNode_231985_001121.count = 1121 :=
  map_count_branch
    mapChunk_231985
    mapChunk_232545
    560 561
    mapChunk_231985_count
    mapChunk_232545_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_230864_002242_count :
    mapNode_230864_002242.count = 2242 :=
  map_count_branch
    mapNode_230864_001121
    mapNode_231985_001121
    1121 1121
    mapNode_230864_001121_count
    mapNode_231985_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_228623_004483_count :
    mapNode_228623_004483.count = 4483 :=
  map_count_branch
    mapNode_228623_002241
    mapNode_230864_002242
    2241 2242
    mapNode_228623_002241_count
    mapNode_230864_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_224140_008966_count :
    mapNode_224140_008966.count = 8966 :=
  map_count_branch
    mapNode_224140_004483
    mapNode_228623_004483
    4483 4483
    mapNode_224140_004483_count
    mapNode_228623_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_215175_017931_count :
    mapNode_215175_017931.count = 17931 :=
  map_count_branch
    mapNode_215175_008965
    mapNode_224140_008966
    8965 8966
    mapNode_215175_008965_count
    mapNode_224140_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_233106_count :
    mapChunk_233106.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_233666_count :
    mapChunk_233666.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_233106_001120_count :
    mapNode_233106_001120.count = 1120 :=
  map_count_branch
    mapChunk_233106
    mapChunk_233666
    560 560
    mapChunk_233106_count
    mapChunk_233666_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_234226_count :
    mapChunk_234226.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_234786_count :
    mapChunk_234786.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_234226_001121_count :
    mapNode_234226_001121.count = 1121 :=
  map_count_branch
    mapChunk_234226
    mapChunk_234786
    560 561
    mapChunk_234226_count
    mapChunk_234786_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_233106_002241_count :
    mapNode_233106_002241.count = 2241 :=
  map_count_branch
    mapNode_233106_001120
    mapNode_234226_001121
    1120 1121
    mapNode_233106_001120_count
    mapNode_234226_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_235347_count :
    mapChunk_235347.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_235907_count :
    mapChunk_235907.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_235347_001121_count :
    mapNode_235347_001121.count = 1121 :=
  map_count_branch
    mapChunk_235347
    mapChunk_235907
    560 561
    mapChunk_235347_count
    mapChunk_235907_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_236468_count :
    mapChunk_236468.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_237028_count :
    mapChunk_237028.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_236468_001121_count :
    mapNode_236468_001121.count = 1121 :=
  map_count_branch
    mapChunk_236468
    mapChunk_237028
    560 561
    mapChunk_236468_count
    mapChunk_237028_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_235347_002242_count :
    mapNode_235347_002242.count = 2242 :=
  map_count_branch
    mapNode_235347_001121
    mapNode_236468_001121
    1121 1121
    mapNode_235347_001121_count
    mapNode_236468_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_233106_004483_count :
    mapNode_233106_004483.count = 4483 :=
  map_count_branch
    mapNode_233106_002241
    mapNode_235347_002242
    2241 2242
    mapNode_233106_002241_count
    mapNode_235347_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_237589_count :
    mapChunk_237589.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_238149_count :
    mapChunk_238149.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_237589_001120_count :
    mapNode_237589_001120.count = 1120 :=
  map_count_branch
    mapChunk_237589
    mapChunk_238149
    560 560
    mapChunk_237589_count
    mapChunk_238149_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_238709_count :
    mapChunk_238709.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_239269_count :
    mapChunk_239269.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_238709_001121_count :
    mapNode_238709_001121.count = 1121 :=
  map_count_branch
    mapChunk_238709
    mapChunk_239269
    560 561
    mapChunk_238709_count
    mapChunk_239269_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_237589_002241_count :
    mapNode_237589_002241.count = 2241 :=
  map_count_branch
    mapNode_237589_001120
    mapNode_238709_001121
    1120 1121
    mapNode_237589_001120_count
    mapNode_238709_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_239830_count :
    mapChunk_239830.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_240390_count :
    mapChunk_240390.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_239830_001121_count :
    mapNode_239830_001121.count = 1121 :=
  map_count_branch
    mapChunk_239830
    mapChunk_240390
    560 561
    mapChunk_239830_count
    mapChunk_240390_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_240951_count :
    mapChunk_240951.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_241511_count :
    mapChunk_241511.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_240951_001121_count :
    mapNode_240951_001121.count = 1121 :=
  map_count_branch
    mapChunk_240951
    mapChunk_241511
    560 561
    mapChunk_240951_count
    mapChunk_241511_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_239830_002242_count :
    mapNode_239830_002242.count = 2242 :=
  map_count_branch
    mapNode_239830_001121
    mapNode_240951_001121
    1121 1121
    mapNode_239830_001121_count
    mapNode_240951_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_237589_004483_count :
    mapNode_237589_004483.count = 4483 :=
  map_count_branch
    mapNode_237589_002241
    mapNode_239830_002242
    2241 2242
    mapNode_237589_002241_count
    mapNode_239830_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_233106_008966_count :
    mapNode_233106_008966.count = 8966 :=
  map_count_branch
    mapNode_233106_004483
    mapNode_237589_004483
    4483 4483
    mapNode_233106_004483_count
    mapNode_237589_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_242072_count :
    mapChunk_242072.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_242632_count :
    mapChunk_242632.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_242072_001120_count :
    mapNode_242072_001120.count = 1120 :=
  map_count_branch
    mapChunk_242072
    mapChunk_242632
    560 560
    mapChunk_242072_count
    mapChunk_242632_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_243192_count :
    mapChunk_243192.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_243752_count :
    mapChunk_243752.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_243192_001121_count :
    mapNode_243192_001121.count = 1121 :=
  map_count_branch
    mapChunk_243192
    mapChunk_243752
    560 561
    mapChunk_243192_count
    mapChunk_243752_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_242072_002241_count :
    mapNode_242072_002241.count = 2241 :=
  map_count_branch
    mapNode_242072_001120
    mapNode_243192_001121
    1120 1121
    mapNode_242072_001120_count
    mapNode_243192_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_244313_count :
    mapChunk_244313.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_244873_count :
    mapChunk_244873.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_244313_001121_count :
    mapNode_244313_001121.count = 1121 :=
  map_count_branch
    mapChunk_244313
    mapChunk_244873
    560 561
    mapChunk_244313_count
    mapChunk_244873_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_245434_count :
    mapChunk_245434.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_245994_count :
    mapChunk_245994.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_245434_001121_count :
    mapNode_245434_001121.count = 1121 :=
  map_count_branch
    mapChunk_245434
    mapChunk_245994
    560 561
    mapChunk_245434_count
    mapChunk_245994_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_244313_002242_count :
    mapNode_244313_002242.count = 2242 :=
  map_count_branch
    mapNode_244313_001121
    mapNode_245434_001121
    1121 1121
    mapNode_244313_001121_count
    mapNode_245434_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_242072_004483_count :
    mapNode_242072_004483.count = 4483 :=
  map_count_branch
    mapNode_242072_002241
    mapNode_244313_002242
    2241 2242
    mapNode_242072_002241_count
    mapNode_244313_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_246555_count :
    mapChunk_246555.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_247115_count :
    mapChunk_247115.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_246555_001120_count :
    mapNode_246555_001120.count = 1120 :=
  map_count_branch
    mapChunk_246555
    mapChunk_247115
    560 560
    mapChunk_246555_count
    mapChunk_247115_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_247675_count :
    mapChunk_247675.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_248235_count :
    mapChunk_248235.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_247675_001121_count :
    mapNode_247675_001121.count = 1121 :=
  map_count_branch
    mapChunk_247675
    mapChunk_248235
    560 561
    mapChunk_247675_count
    mapChunk_248235_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_246555_002241_count :
    mapNode_246555_002241.count = 2241 :=
  map_count_branch
    mapNode_246555_001120
    mapNode_247675_001121
    1120 1121
    mapNode_246555_001120_count
    mapNode_247675_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_248796_count :
    mapChunk_248796.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_249356_count :
    mapChunk_249356.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_248796_001121_count :
    mapNode_248796_001121.count = 1121 :=
  map_count_branch
    mapChunk_248796
    mapChunk_249356
    560 561
    mapChunk_248796_count
    mapChunk_249356_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_249917_count :
    mapChunk_249917.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_250477_count :
    mapChunk_250477.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_249917_001121_count :
    mapNode_249917_001121.count = 1121 :=
  map_count_branch
    mapChunk_249917
    mapChunk_250477
    560 561
    mapChunk_249917_count
    mapChunk_250477_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_248796_002242_count :
    mapNode_248796_002242.count = 2242 :=
  map_count_branch
    mapNode_248796_001121
    mapNode_249917_001121
    1121 1121
    mapNode_248796_001121_count
    mapNode_249917_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_246555_004483_count :
    mapNode_246555_004483.count = 4483 :=
  map_count_branch
    mapNode_246555_002241
    mapNode_248796_002242
    2241 2242
    mapNode_246555_002241_count
    mapNode_248796_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_242072_008966_count :
    mapNode_242072_008966.count = 8966 :=
  map_count_branch
    mapNode_242072_004483
    mapNode_246555_004483
    4483 4483
    mapNode_242072_004483_count
    mapNode_246555_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_233106_017932_count :
    mapNode_233106_017932.count = 17932 :=
  map_count_branch
    mapNode_233106_008966
    mapNode_242072_008966
    8966 8966
    mapNode_233106_008966_count
    mapNode_242072_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_215175_035863_count :
    mapNode_215175_035863.count = 35863 :=
  map_count_branch
    mapNode_215175_017931
    mapNode_233106_017932
    17931 17932
    mapNode_215175_017931_count
    mapNode_233106_017932_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_251038_count :
    mapChunk_251038.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_251598_count :
    mapChunk_251598.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_251038_001120_count :
    mapNode_251038_001120.count = 1120 :=
  map_count_branch
    mapChunk_251038
    mapChunk_251598
    560 560
    mapChunk_251038_count
    mapChunk_251598_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_252158_count :
    mapChunk_252158.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_252718_count :
    mapChunk_252718.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_252158_001121_count :
    mapNode_252158_001121.count = 1121 :=
  map_count_branch
    mapChunk_252158
    mapChunk_252718
    560 561
    mapChunk_252158_count
    mapChunk_252718_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_251038_002241_count :
    mapNode_251038_002241.count = 2241 :=
  map_count_branch
    mapNode_251038_001120
    mapNode_252158_001121
    1120 1121
    mapNode_251038_001120_count
    mapNode_252158_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_253279_count :
    mapChunk_253279.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_253839_count :
    mapChunk_253839.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_253279_001120_count :
    mapNode_253279_001120.count = 1120 :=
  map_count_branch
    mapChunk_253279
    mapChunk_253839
    560 560
    mapChunk_253279_count
    mapChunk_253839_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_254399_count :
    mapChunk_254399.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_254959_count :
    mapChunk_254959.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_254399_001121_count :
    mapNode_254399_001121.count = 1121 :=
  map_count_branch
    mapChunk_254399
    mapChunk_254959
    560 561
    mapChunk_254399_count
    mapChunk_254959_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_253279_002241_count :
    mapNode_253279_002241.count = 2241 :=
  map_count_branch
    mapNode_253279_001120
    mapNode_254399_001121
    1120 1121
    mapNode_253279_001120_count
    mapNode_254399_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_251038_004482_count :
    mapNode_251038_004482.count = 4482 :=
  map_count_branch
    mapNode_251038_002241
    mapNode_253279_002241
    2241 2241
    mapNode_251038_002241_count
    mapNode_253279_002241_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_255520_count :
    mapChunk_255520.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_256080_count :
    mapChunk_256080.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_255520_001120_count :
    mapNode_255520_001120.count = 1120 :=
  map_count_branch
    mapChunk_255520
    mapChunk_256080
    560 560
    mapChunk_255520_count
    mapChunk_256080_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_256640_count :
    mapChunk_256640.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_257200_count :
    mapChunk_257200.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_256640_001121_count :
    mapNode_256640_001121.count = 1121 :=
  map_count_branch
    mapChunk_256640
    mapChunk_257200
    560 561
    mapChunk_256640_count
    mapChunk_257200_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_255520_002241_count :
    mapNode_255520_002241.count = 2241 :=
  map_count_branch
    mapNode_255520_001120
    mapNode_256640_001121
    1120 1121
    mapNode_255520_001120_count
    mapNode_256640_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_257761_count :
    mapChunk_257761.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_258321_count :
    mapChunk_258321.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_257761_001121_count :
    mapNode_257761_001121.count = 1121 :=
  map_count_branch
    mapChunk_257761
    mapChunk_258321
    560 561
    mapChunk_257761_count
    mapChunk_258321_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_258882_count :
    mapChunk_258882.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_259442_count :
    mapChunk_259442.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_258882_001121_count :
    mapNode_258882_001121.count = 1121 :=
  map_count_branch
    mapChunk_258882
    mapChunk_259442
    560 561
    mapChunk_258882_count
    mapChunk_259442_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_257761_002242_count :
    mapNode_257761_002242.count = 2242 :=
  map_count_branch
    mapNode_257761_001121
    mapNode_258882_001121
    1121 1121
    mapNode_257761_001121_count
    mapNode_258882_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_255520_004483_count :
    mapNode_255520_004483.count = 4483 :=
  map_count_branch
    mapNode_255520_002241
    mapNode_257761_002242
    2241 2242
    mapNode_255520_002241_count
    mapNode_257761_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_251038_008965_count :
    mapNode_251038_008965.count = 8965 :=
  map_count_branch
    mapNode_251038_004482
    mapNode_255520_004483
    4482 4483
    mapNode_251038_004482_count
    mapNode_255520_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_260003_count :
    mapChunk_260003.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_260563_count :
    mapChunk_260563.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_260003_001120_count :
    mapNode_260003_001120.count = 1120 :=
  map_count_branch
    mapChunk_260003
    mapChunk_260563
    560 560
    mapChunk_260003_count
    mapChunk_260563_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_261123_count :
    mapChunk_261123.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_261683_count :
    mapChunk_261683.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_261123_001121_count :
    mapNode_261123_001121.count = 1121 :=
  map_count_branch
    mapChunk_261123
    mapChunk_261683
    560 561
    mapChunk_261123_count
    mapChunk_261683_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_260003_002241_count :
    mapNode_260003_002241.count = 2241 :=
  map_count_branch
    mapNode_260003_001120
    mapNode_261123_001121
    1120 1121
    mapNode_260003_001120_count
    mapNode_261123_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_262244_count :
    mapChunk_262244.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_262804_count :
    mapChunk_262804.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_262244_001121_count :
    mapNode_262244_001121.count = 1121 :=
  map_count_branch
    mapChunk_262244
    mapChunk_262804
    560 561
    mapChunk_262244_count
    mapChunk_262804_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_263365_count :
    mapChunk_263365.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_263925_count :
    mapChunk_263925.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_263365_001121_count :
    mapNode_263365_001121.count = 1121 :=
  map_count_branch
    mapChunk_263365
    mapChunk_263925
    560 561
    mapChunk_263365_count
    mapChunk_263925_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_262244_002242_count :
    mapNode_262244_002242.count = 2242 :=
  map_count_branch
    mapNode_262244_001121
    mapNode_263365_001121
    1121 1121
    mapNode_262244_001121_count
    mapNode_263365_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_260003_004483_count :
    mapNode_260003_004483.count = 4483 :=
  map_count_branch
    mapNode_260003_002241
    mapNode_262244_002242
    2241 2242
    mapNode_260003_002241_count
    mapNode_262244_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_264486_count :
    mapChunk_264486.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_265046_count :
    mapChunk_265046.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_264486_001120_count :
    mapNode_264486_001120.count = 1120 :=
  map_count_branch
    mapChunk_264486
    mapChunk_265046
    560 560
    mapChunk_264486_count
    mapChunk_265046_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_265606_count :
    mapChunk_265606.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_266166_count :
    mapChunk_266166.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_265606_001121_count :
    mapNode_265606_001121.count = 1121 :=
  map_count_branch
    mapChunk_265606
    mapChunk_266166
    560 561
    mapChunk_265606_count
    mapChunk_266166_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_264486_002241_count :
    mapNode_264486_002241.count = 2241 :=
  map_count_branch
    mapNode_264486_001120
    mapNode_265606_001121
    1120 1121
    mapNode_264486_001120_count
    mapNode_265606_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_266727_count :
    mapChunk_266727.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_267287_count :
    mapChunk_267287.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_266727_001121_count :
    mapNode_266727_001121.count = 1121 :=
  map_count_branch
    mapChunk_266727
    mapChunk_267287
    560 561
    mapChunk_266727_count
    mapChunk_267287_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_267848_count :
    mapChunk_267848.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_268408_count :
    mapChunk_268408.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_267848_001121_count :
    mapNode_267848_001121.count = 1121 :=
  map_count_branch
    mapChunk_267848
    mapChunk_268408
    560 561
    mapChunk_267848_count
    mapChunk_268408_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_266727_002242_count :
    mapNode_266727_002242.count = 2242 :=
  map_count_branch
    mapNode_266727_001121
    mapNode_267848_001121
    1121 1121
    mapNode_266727_001121_count
    mapNode_267848_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_264486_004483_count :
    mapNode_264486_004483.count = 4483 :=
  map_count_branch
    mapNode_264486_002241
    mapNode_266727_002242
    2241 2242
    mapNode_264486_002241_count
    mapNode_266727_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_260003_008966_count :
    mapNode_260003_008966.count = 8966 :=
  map_count_branch
    mapNode_260003_004483
    mapNode_264486_004483
    4483 4483
    mapNode_260003_004483_count
    mapNode_264486_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_251038_017931_count :
    mapNode_251038_017931.count = 17931 :=
  map_count_branch
    mapNode_251038_008965
    mapNode_260003_008966
    8965 8966
    mapNode_251038_008965_count
    mapNode_260003_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_268969_count :
    mapChunk_268969.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_269529_count :
    mapChunk_269529.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_268969_001120_count :
    mapNode_268969_001120.count = 1120 :=
  map_count_branch
    mapChunk_268969
    mapChunk_269529
    560 560
    mapChunk_268969_count
    mapChunk_269529_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_270089_count :
    mapChunk_270089.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_270649_count :
    mapChunk_270649.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_270089_001121_count :
    mapNode_270089_001121.count = 1121 :=
  map_count_branch
    mapChunk_270089
    mapChunk_270649
    560 561
    mapChunk_270089_count
    mapChunk_270649_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_268969_002241_count :
    mapNode_268969_002241.count = 2241 :=
  map_count_branch
    mapNode_268969_001120
    mapNode_270089_001121
    1120 1121
    mapNode_268969_001120_count
    mapNode_270089_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_271210_count :
    mapChunk_271210.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_271770_count :
    mapChunk_271770.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_271210_001121_count :
    mapNode_271210_001121.count = 1121 :=
  map_count_branch
    mapChunk_271210
    mapChunk_271770
    560 561
    mapChunk_271210_count
    mapChunk_271770_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_272331_count :
    mapChunk_272331.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_272891_count :
    mapChunk_272891.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_272331_001121_count :
    mapNode_272331_001121.count = 1121 :=
  map_count_branch
    mapChunk_272331
    mapChunk_272891
    560 561
    mapChunk_272331_count
    mapChunk_272891_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_271210_002242_count :
    mapNode_271210_002242.count = 2242 :=
  map_count_branch
    mapNode_271210_001121
    mapNode_272331_001121
    1121 1121
    mapNode_271210_001121_count
    mapNode_272331_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_268969_004483_count :
    mapNode_268969_004483.count = 4483 :=
  map_count_branch
    mapNode_268969_002241
    mapNode_271210_002242
    2241 2242
    mapNode_268969_002241_count
    mapNode_271210_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_273452_count :
    mapChunk_273452.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_274012_count :
    mapChunk_274012.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_273452_001120_count :
    mapNode_273452_001120.count = 1120 :=
  map_count_branch
    mapChunk_273452
    mapChunk_274012
    560 560
    mapChunk_273452_count
    mapChunk_274012_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_274572_count :
    mapChunk_274572.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_275132_count :
    mapChunk_275132.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_274572_001121_count :
    mapNode_274572_001121.count = 1121 :=
  map_count_branch
    mapChunk_274572
    mapChunk_275132
    560 561
    mapChunk_274572_count
    mapChunk_275132_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_273452_002241_count :
    mapNode_273452_002241.count = 2241 :=
  map_count_branch
    mapNode_273452_001120
    mapNode_274572_001121
    1120 1121
    mapNode_273452_001120_count
    mapNode_274572_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_275693_count :
    mapChunk_275693.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_276253_count :
    mapChunk_276253.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_275693_001121_count :
    mapNode_275693_001121.count = 1121 :=
  map_count_branch
    mapChunk_275693
    mapChunk_276253
    560 561
    mapChunk_275693_count
    mapChunk_276253_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_276814_count :
    mapChunk_276814.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_277374_count :
    mapChunk_277374.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_276814_001121_count :
    mapNode_276814_001121.count = 1121 :=
  map_count_branch
    mapChunk_276814
    mapChunk_277374
    560 561
    mapChunk_276814_count
    mapChunk_277374_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_275693_002242_count :
    mapNode_275693_002242.count = 2242 :=
  map_count_branch
    mapNode_275693_001121
    mapNode_276814_001121
    1121 1121
    mapNode_275693_001121_count
    mapNode_276814_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_273452_004483_count :
    mapNode_273452_004483.count = 4483 :=
  map_count_branch
    mapNode_273452_002241
    mapNode_275693_002242
    2241 2242
    mapNode_273452_002241_count
    mapNode_275693_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_268969_008966_count :
    mapNode_268969_008966.count = 8966 :=
  map_count_branch
    mapNode_268969_004483
    mapNode_273452_004483
    4483 4483
    mapNode_268969_004483_count
    mapNode_273452_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_277935_count :
    mapChunk_277935.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_278495_count :
    mapChunk_278495.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_277935_001120_count :
    mapNode_277935_001120.count = 1120 :=
  map_count_branch
    mapChunk_277935
    mapChunk_278495
    560 560
    mapChunk_277935_count
    mapChunk_278495_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_279055_count :
    mapChunk_279055.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_279615_count :
    mapChunk_279615.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_279055_001121_count :
    mapNode_279055_001121.count = 1121 :=
  map_count_branch
    mapChunk_279055
    mapChunk_279615
    560 561
    mapChunk_279055_count
    mapChunk_279615_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_277935_002241_count :
    mapNode_277935_002241.count = 2241 :=
  map_count_branch
    mapNode_277935_001120
    mapNode_279055_001121
    1120 1121
    mapNode_277935_001120_count
    mapNode_279055_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_280176_count :
    mapChunk_280176.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_280736_count :
    mapChunk_280736.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_280176_001121_count :
    mapNode_280176_001121.count = 1121 :=
  map_count_branch
    mapChunk_280176
    mapChunk_280736
    560 561
    mapChunk_280176_count
    mapChunk_280736_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_281297_count :
    mapChunk_281297.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_281857_count :
    mapChunk_281857.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_281297_001121_count :
    mapNode_281297_001121.count = 1121 :=
  map_count_branch
    mapChunk_281297
    mapChunk_281857
    560 561
    mapChunk_281297_count
    mapChunk_281857_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_280176_002242_count :
    mapNode_280176_002242.count = 2242 :=
  map_count_branch
    mapNode_280176_001121
    mapNode_281297_001121
    1121 1121
    mapNode_280176_001121_count
    mapNode_281297_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_277935_004483_count :
    mapNode_277935_004483.count = 4483 :=
  map_count_branch
    mapNode_277935_002241
    mapNode_280176_002242
    2241 2242
    mapNode_277935_002241_count
    mapNode_280176_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_282418_count :
    mapChunk_282418.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_282978_count :
    mapChunk_282978.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_282418_001120_count :
    mapNode_282418_001120.count = 1120 :=
  map_count_branch
    mapChunk_282418
    mapChunk_282978
    560 560
    mapChunk_282418_count
    mapChunk_282978_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_283538_count :
    mapChunk_283538.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_284098_count :
    mapChunk_284098.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_283538_001121_count :
    mapNode_283538_001121.count = 1121 :=
  map_count_branch
    mapChunk_283538
    mapChunk_284098
    560 561
    mapChunk_283538_count
    mapChunk_284098_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_282418_002241_count :
    mapNode_282418_002241.count = 2241 :=
  map_count_branch
    mapNode_282418_001120
    mapNode_283538_001121
    1120 1121
    mapNode_282418_001120_count
    mapNode_283538_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_284659_count :
    mapChunk_284659.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_285219_count :
    mapChunk_285219.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_284659_001121_count :
    mapNode_284659_001121.count = 1121 :=
  map_count_branch
    mapChunk_284659
    mapChunk_285219
    560 561
    mapChunk_284659_count
    mapChunk_285219_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_285780_count :
    mapChunk_285780.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_286340_count :
    mapChunk_286340.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_285780_001121_count :
    mapNode_285780_001121.count = 1121 :=
  map_count_branch
    mapChunk_285780
    mapChunk_286340
    560 561
    mapChunk_285780_count
    mapChunk_286340_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_284659_002242_count :
    mapNode_284659_002242.count = 2242 :=
  map_count_branch
    mapNode_284659_001121
    mapNode_285780_001121
    1121 1121
    mapNode_284659_001121_count
    mapNode_285780_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_282418_004483_count :
    mapNode_282418_004483.count = 4483 :=
  map_count_branch
    mapNode_282418_002241
    mapNode_284659_002242
    2241 2242
    mapNode_282418_002241_count
    mapNode_284659_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_277935_008966_count :
    mapNode_277935_008966.count = 8966 :=
  map_count_branch
    mapNode_277935_004483
    mapNode_282418_004483
    4483 4483
    mapNode_277935_004483_count
    mapNode_282418_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_268969_017932_count :
    mapNode_268969_017932.count = 17932 :=
  map_count_branch
    mapNode_268969_008966
    mapNode_277935_008966
    8966 8966
    mapNode_268969_008966_count
    mapNode_277935_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_251038_035863_count :
    mapNode_251038_035863.count = 35863 :=
  map_count_branch
    mapNode_251038_017931
    mapNode_268969_017932
    17931 17932
    mapNode_251038_017931_count
    mapNode_268969_017932_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_215175_071726_count :
    mapNode_215175_071726.count = 71726 :=
  map_count_branch
    mapNode_215175_035863
    mapNode_251038_035863
    35863 35863
    mapNode_215175_035863_count
    mapNode_251038_035863_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_143450_143451_count :
    mapNode_143450_143451.count = 143451 :=
  map_count_branch
    mapNode_143450_071725
    mapNode_215175_071726
    71725 71726
    mapNode_143450_071725_count
    mapNode_215175_071726_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_000000_286901_count :
    mapNode_000000_286901.count = 286901 :=
  map_count_branch
    mapNode_000000_143450
    mapNode_143450_143451
    143450 143451
    mapNode_000000_143450_count
    mapNode_143450_143451_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_286901_count :
    mapChunk_286901.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_287461_count :
    mapChunk_287461.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_286901_001120_count :
    mapNode_286901_001120.count = 1120 :=
  map_count_branch
    mapChunk_286901
    mapChunk_287461
    560 560
    mapChunk_286901_count
    mapChunk_287461_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_288021_count :
    mapChunk_288021.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_288581_count :
    mapChunk_288581.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_288021_001121_count :
    mapNode_288021_001121.count = 1121 :=
  map_count_branch
    mapChunk_288021
    mapChunk_288581
    560 561
    mapChunk_288021_count
    mapChunk_288581_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_286901_002241_count :
    mapNode_286901_002241.count = 2241 :=
  map_count_branch
    mapNode_286901_001120
    mapNode_288021_001121
    1120 1121
    mapNode_286901_001120_count
    mapNode_288021_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_289142_count :
    mapChunk_289142.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_289702_count :
    mapChunk_289702.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_289142_001120_count :
    mapNode_289142_001120.count = 1120 :=
  map_count_branch
    mapChunk_289142
    mapChunk_289702
    560 560
    mapChunk_289142_count
    mapChunk_289702_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_290262_count :
    mapChunk_290262.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_290822_count :
    mapChunk_290822.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_290262_001121_count :
    mapNode_290262_001121.count = 1121 :=
  map_count_branch
    mapChunk_290262
    mapChunk_290822
    560 561
    mapChunk_290262_count
    mapChunk_290822_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_289142_002241_count :
    mapNode_289142_002241.count = 2241 :=
  map_count_branch
    mapNode_289142_001120
    mapNode_290262_001121
    1120 1121
    mapNode_289142_001120_count
    mapNode_290262_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_286901_004482_count :
    mapNode_286901_004482.count = 4482 :=
  map_count_branch
    mapNode_286901_002241
    mapNode_289142_002241
    2241 2241
    mapNode_286901_002241_count
    mapNode_289142_002241_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_291383_count :
    mapChunk_291383.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_291943_count :
    mapChunk_291943.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_291383_001120_count :
    mapNode_291383_001120.count = 1120 :=
  map_count_branch
    mapChunk_291383
    mapChunk_291943
    560 560
    mapChunk_291383_count
    mapChunk_291943_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_292503_count :
    mapChunk_292503.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_293063_count :
    mapChunk_293063.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_292503_001121_count :
    mapNode_292503_001121.count = 1121 :=
  map_count_branch
    mapChunk_292503
    mapChunk_293063
    560 561
    mapChunk_292503_count
    mapChunk_293063_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_291383_002241_count :
    mapNode_291383_002241.count = 2241 :=
  map_count_branch
    mapNode_291383_001120
    mapNode_292503_001121
    1120 1121
    mapNode_291383_001120_count
    mapNode_292503_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_293624_count :
    mapChunk_293624.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_294184_count :
    mapChunk_294184.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_293624_001121_count :
    mapNode_293624_001121.count = 1121 :=
  map_count_branch
    mapChunk_293624
    mapChunk_294184
    560 561
    mapChunk_293624_count
    mapChunk_294184_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_294745_count :
    mapChunk_294745.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_295305_count :
    mapChunk_295305.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_294745_001121_count :
    mapNode_294745_001121.count = 1121 :=
  map_count_branch
    mapChunk_294745
    mapChunk_295305
    560 561
    mapChunk_294745_count
    mapChunk_295305_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_293624_002242_count :
    mapNode_293624_002242.count = 2242 :=
  map_count_branch
    mapNode_293624_001121
    mapNode_294745_001121
    1121 1121
    mapNode_293624_001121_count
    mapNode_294745_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_291383_004483_count :
    mapNode_291383_004483.count = 4483 :=
  map_count_branch
    mapNode_291383_002241
    mapNode_293624_002242
    2241 2242
    mapNode_291383_002241_count
    mapNode_293624_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_286901_008965_count :
    mapNode_286901_008965.count = 8965 :=
  map_count_branch
    mapNode_286901_004482
    mapNode_291383_004483
    4482 4483
    mapNode_286901_004482_count
    mapNode_291383_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_295866_count :
    mapChunk_295866.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_296426_count :
    mapChunk_296426.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_295866_001120_count :
    mapNode_295866_001120.count = 1120 :=
  map_count_branch
    mapChunk_295866
    mapChunk_296426
    560 560
    mapChunk_295866_count
    mapChunk_296426_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_296986_count :
    mapChunk_296986.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_297546_count :
    mapChunk_297546.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_296986_001121_count :
    mapNode_296986_001121.count = 1121 :=
  map_count_branch
    mapChunk_296986
    mapChunk_297546
    560 561
    mapChunk_296986_count
    mapChunk_297546_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_295866_002241_count :
    mapNode_295866_002241.count = 2241 :=
  map_count_branch
    mapNode_295866_001120
    mapNode_296986_001121
    1120 1121
    mapNode_295866_001120_count
    mapNode_296986_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_298107_count :
    mapChunk_298107.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_298667_count :
    mapChunk_298667.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_298107_001121_count :
    mapNode_298107_001121.count = 1121 :=
  map_count_branch
    mapChunk_298107
    mapChunk_298667
    560 561
    mapChunk_298107_count
    mapChunk_298667_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_299228_count :
    mapChunk_299228.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_299788_count :
    mapChunk_299788.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_299228_001121_count :
    mapNode_299228_001121.count = 1121 :=
  map_count_branch
    mapChunk_299228
    mapChunk_299788
    560 561
    mapChunk_299228_count
    mapChunk_299788_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_298107_002242_count :
    mapNode_298107_002242.count = 2242 :=
  map_count_branch
    mapNode_298107_001121
    mapNode_299228_001121
    1121 1121
    mapNode_298107_001121_count
    mapNode_299228_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_295866_004483_count :
    mapNode_295866_004483.count = 4483 :=
  map_count_branch
    mapNode_295866_002241
    mapNode_298107_002242
    2241 2242
    mapNode_295866_002241_count
    mapNode_298107_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_300349_count :
    mapChunk_300349.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_300909_count :
    mapChunk_300909.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_300349_001120_count :
    mapNode_300349_001120.count = 1120 :=
  map_count_branch
    mapChunk_300349
    mapChunk_300909
    560 560
    mapChunk_300349_count
    mapChunk_300909_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_301469_count :
    mapChunk_301469.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_302029_count :
    mapChunk_302029.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_301469_001121_count :
    mapNode_301469_001121.count = 1121 :=
  map_count_branch
    mapChunk_301469
    mapChunk_302029
    560 561
    mapChunk_301469_count
    mapChunk_302029_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_300349_002241_count :
    mapNode_300349_002241.count = 2241 :=
  map_count_branch
    mapNode_300349_001120
    mapNode_301469_001121
    1120 1121
    mapNode_300349_001120_count
    mapNode_301469_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_302590_count :
    mapChunk_302590.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_303150_count :
    mapChunk_303150.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_302590_001121_count :
    mapNode_302590_001121.count = 1121 :=
  map_count_branch
    mapChunk_302590
    mapChunk_303150
    560 561
    mapChunk_302590_count
    mapChunk_303150_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_303711_count :
    mapChunk_303711.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_304271_count :
    mapChunk_304271.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_303711_001121_count :
    mapNode_303711_001121.count = 1121 :=
  map_count_branch
    mapChunk_303711
    mapChunk_304271
    560 561
    mapChunk_303711_count
    mapChunk_304271_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_302590_002242_count :
    mapNode_302590_002242.count = 2242 :=
  map_count_branch
    mapNode_302590_001121
    mapNode_303711_001121
    1121 1121
    mapNode_302590_001121_count
    mapNode_303711_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_300349_004483_count :
    mapNode_300349_004483.count = 4483 :=
  map_count_branch
    mapNode_300349_002241
    mapNode_302590_002242
    2241 2242
    mapNode_300349_002241_count
    mapNode_302590_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_295866_008966_count :
    mapNode_295866_008966.count = 8966 :=
  map_count_branch
    mapNode_295866_004483
    mapNode_300349_004483
    4483 4483
    mapNode_295866_004483_count
    mapNode_300349_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_286901_017931_count :
    mapNode_286901_017931.count = 17931 :=
  map_count_branch
    mapNode_286901_008965
    mapNode_295866_008966
    8965 8966
    mapNode_286901_008965_count
    mapNode_295866_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_304832_count :
    mapChunk_304832.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_305392_count :
    mapChunk_305392.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_304832_001120_count :
    mapNode_304832_001120.count = 1120 :=
  map_count_branch
    mapChunk_304832
    mapChunk_305392
    560 560
    mapChunk_304832_count
    mapChunk_305392_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_305952_count :
    mapChunk_305952.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_306512_count :
    mapChunk_306512.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_305952_001121_count :
    mapNode_305952_001121.count = 1121 :=
  map_count_branch
    mapChunk_305952
    mapChunk_306512
    560 561
    mapChunk_305952_count
    mapChunk_306512_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_304832_002241_count :
    mapNode_304832_002241.count = 2241 :=
  map_count_branch
    mapNode_304832_001120
    mapNode_305952_001121
    1120 1121
    mapNode_304832_001120_count
    mapNode_305952_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_307073_count :
    mapChunk_307073.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_307633_count :
    mapChunk_307633.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_307073_001120_count :
    mapNode_307073_001120.count = 1120 :=
  map_count_branch
    mapChunk_307073
    mapChunk_307633
    560 560
    mapChunk_307073_count
    mapChunk_307633_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_308193_count :
    mapChunk_308193.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_308753_count :
    mapChunk_308753.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_308193_001121_count :
    mapNode_308193_001121.count = 1121 :=
  map_count_branch
    mapChunk_308193
    mapChunk_308753
    560 561
    mapChunk_308193_count
    mapChunk_308753_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_307073_002241_count :
    mapNode_307073_002241.count = 2241 :=
  map_count_branch
    mapNode_307073_001120
    mapNode_308193_001121
    1120 1121
    mapNode_307073_001120_count
    mapNode_308193_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_304832_004482_count :
    mapNode_304832_004482.count = 4482 :=
  map_count_branch
    mapNode_304832_002241
    mapNode_307073_002241
    2241 2241
    mapNode_304832_002241_count
    mapNode_307073_002241_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_309314_count :
    mapChunk_309314.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_309874_count :
    mapChunk_309874.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_309314_001120_count :
    mapNode_309314_001120.count = 1120 :=
  map_count_branch
    mapChunk_309314
    mapChunk_309874
    560 560
    mapChunk_309314_count
    mapChunk_309874_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_310434_count :
    mapChunk_310434.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_310994_count :
    mapChunk_310994.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_310434_001121_count :
    mapNode_310434_001121.count = 1121 :=
  map_count_branch
    mapChunk_310434
    mapChunk_310994
    560 561
    mapChunk_310434_count
    mapChunk_310994_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_309314_002241_count :
    mapNode_309314_002241.count = 2241 :=
  map_count_branch
    mapNode_309314_001120
    mapNode_310434_001121
    1120 1121
    mapNode_309314_001120_count
    mapNode_310434_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_311555_count :
    mapChunk_311555.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_312115_count :
    mapChunk_312115.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_311555_001121_count :
    mapNode_311555_001121.count = 1121 :=
  map_count_branch
    mapChunk_311555
    mapChunk_312115
    560 561
    mapChunk_311555_count
    mapChunk_312115_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_312676_count :
    mapChunk_312676.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_313236_count :
    mapChunk_313236.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_312676_001121_count :
    mapNode_312676_001121.count = 1121 :=
  map_count_branch
    mapChunk_312676
    mapChunk_313236
    560 561
    mapChunk_312676_count
    mapChunk_313236_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_311555_002242_count :
    mapNode_311555_002242.count = 2242 :=
  map_count_branch
    mapNode_311555_001121
    mapNode_312676_001121
    1121 1121
    mapNode_311555_001121_count
    mapNode_312676_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_309314_004483_count :
    mapNode_309314_004483.count = 4483 :=
  map_count_branch
    mapNode_309314_002241
    mapNode_311555_002242
    2241 2242
    mapNode_309314_002241_count
    mapNode_311555_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_304832_008965_count :
    mapNode_304832_008965.count = 8965 :=
  map_count_branch
    mapNode_304832_004482
    mapNode_309314_004483
    4482 4483
    mapNode_304832_004482_count
    mapNode_309314_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_313797_count :
    mapChunk_313797.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_314357_count :
    mapChunk_314357.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_313797_001120_count :
    mapNode_313797_001120.count = 1120 :=
  map_count_branch
    mapChunk_313797
    mapChunk_314357
    560 560
    mapChunk_313797_count
    mapChunk_314357_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_314917_count :
    mapChunk_314917.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_315477_count :
    mapChunk_315477.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_314917_001121_count :
    mapNode_314917_001121.count = 1121 :=
  map_count_branch
    mapChunk_314917
    mapChunk_315477
    560 561
    mapChunk_314917_count
    mapChunk_315477_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_313797_002241_count :
    mapNode_313797_002241.count = 2241 :=
  map_count_branch
    mapNode_313797_001120
    mapNode_314917_001121
    1120 1121
    mapNode_313797_001120_count
    mapNode_314917_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_316038_count :
    mapChunk_316038.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_316598_count :
    mapChunk_316598.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_316038_001121_count :
    mapNode_316038_001121.count = 1121 :=
  map_count_branch
    mapChunk_316038
    mapChunk_316598
    560 561
    mapChunk_316038_count
    mapChunk_316598_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_317159_count :
    mapChunk_317159.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_317719_count :
    mapChunk_317719.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_317159_001121_count :
    mapNode_317159_001121.count = 1121 :=
  map_count_branch
    mapChunk_317159
    mapChunk_317719
    560 561
    mapChunk_317159_count
    mapChunk_317719_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_316038_002242_count :
    mapNode_316038_002242.count = 2242 :=
  map_count_branch
    mapNode_316038_001121
    mapNode_317159_001121
    1121 1121
    mapNode_316038_001121_count
    mapNode_317159_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_313797_004483_count :
    mapNode_313797_004483.count = 4483 :=
  map_count_branch
    mapNode_313797_002241
    mapNode_316038_002242
    2241 2242
    mapNode_313797_002241_count
    mapNode_316038_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_318280_count :
    mapChunk_318280.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_318840_count :
    mapChunk_318840.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_318280_001120_count :
    mapNode_318280_001120.count = 1120 :=
  map_count_branch
    mapChunk_318280
    mapChunk_318840
    560 560
    mapChunk_318280_count
    mapChunk_318840_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_319400_count :
    mapChunk_319400.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_319960_count :
    mapChunk_319960.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_319400_001121_count :
    mapNode_319400_001121.count = 1121 :=
  map_count_branch
    mapChunk_319400
    mapChunk_319960
    560 561
    mapChunk_319400_count
    mapChunk_319960_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_318280_002241_count :
    mapNode_318280_002241.count = 2241 :=
  map_count_branch
    mapNode_318280_001120
    mapNode_319400_001121
    1120 1121
    mapNode_318280_001120_count
    mapNode_319400_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_320521_count :
    mapChunk_320521.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_321081_count :
    mapChunk_321081.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_320521_001121_count :
    mapNode_320521_001121.count = 1121 :=
  map_count_branch
    mapChunk_320521
    mapChunk_321081
    560 561
    mapChunk_320521_count
    mapChunk_321081_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_321642_count :
    mapChunk_321642.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_322202_count :
    mapChunk_322202.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_321642_001121_count :
    mapNode_321642_001121.count = 1121 :=
  map_count_branch
    mapChunk_321642
    mapChunk_322202
    560 561
    mapChunk_321642_count
    mapChunk_322202_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_320521_002242_count :
    mapNode_320521_002242.count = 2242 :=
  map_count_branch
    mapNode_320521_001121
    mapNode_321642_001121
    1121 1121
    mapNode_320521_001121_count
    mapNode_321642_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_318280_004483_count :
    mapNode_318280_004483.count = 4483 :=
  map_count_branch
    mapNode_318280_002241
    mapNode_320521_002242
    2241 2242
    mapNode_318280_002241_count
    mapNode_320521_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_313797_008966_count :
    mapNode_313797_008966.count = 8966 :=
  map_count_branch
    mapNode_313797_004483
    mapNode_318280_004483
    4483 4483
    mapNode_313797_004483_count
    mapNode_318280_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_304832_017931_count :
    mapNode_304832_017931.count = 17931 :=
  map_count_branch
    mapNode_304832_008965
    mapNode_313797_008966
    8965 8966
    mapNode_304832_008965_count
    mapNode_313797_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_286901_035862_count :
    mapNode_286901_035862.count = 35862 :=
  map_count_branch
    mapNode_286901_017931
    mapNode_304832_017931
    17931 17931
    mapNode_286901_017931_count
    mapNode_304832_017931_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_322763_count :
    mapChunk_322763.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_323323_count :
    mapChunk_323323.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_322763_001120_count :
    mapNode_322763_001120.count = 1120 :=
  map_count_branch
    mapChunk_322763
    mapChunk_323323
    560 560
    mapChunk_322763_count
    mapChunk_323323_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_323883_count :
    mapChunk_323883.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_324443_count :
    mapChunk_324443.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_323883_001121_count :
    mapNode_323883_001121.count = 1121 :=
  map_count_branch
    mapChunk_323883
    mapChunk_324443
    560 561
    mapChunk_323883_count
    mapChunk_324443_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_322763_002241_count :
    mapNode_322763_002241.count = 2241 :=
  map_count_branch
    mapNode_322763_001120
    mapNode_323883_001121
    1120 1121
    mapNode_322763_001120_count
    mapNode_323883_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_325004_count :
    mapChunk_325004.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_325564_count :
    mapChunk_325564.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_325004_001120_count :
    mapNode_325004_001120.count = 1120 :=
  map_count_branch
    mapChunk_325004
    mapChunk_325564
    560 560
    mapChunk_325004_count
    mapChunk_325564_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_326124_count :
    mapChunk_326124.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_326684_count :
    mapChunk_326684.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_326124_001121_count :
    mapNode_326124_001121.count = 1121 :=
  map_count_branch
    mapChunk_326124
    mapChunk_326684
    560 561
    mapChunk_326124_count
    mapChunk_326684_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_325004_002241_count :
    mapNode_325004_002241.count = 2241 :=
  map_count_branch
    mapNode_325004_001120
    mapNode_326124_001121
    1120 1121
    mapNode_325004_001120_count
    mapNode_326124_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_322763_004482_count :
    mapNode_322763_004482.count = 4482 :=
  map_count_branch
    mapNode_322763_002241
    mapNode_325004_002241
    2241 2241
    mapNode_322763_002241_count
    mapNode_325004_002241_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_327245_count :
    mapChunk_327245.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_327805_count :
    mapChunk_327805.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_327245_001120_count :
    mapNode_327245_001120.count = 1120 :=
  map_count_branch
    mapChunk_327245
    mapChunk_327805
    560 560
    mapChunk_327245_count
    mapChunk_327805_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_328365_count :
    mapChunk_328365.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_328925_count :
    mapChunk_328925.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_328365_001121_count :
    mapNode_328365_001121.count = 1121 :=
  map_count_branch
    mapChunk_328365
    mapChunk_328925
    560 561
    mapChunk_328365_count
    mapChunk_328925_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_327245_002241_count :
    mapNode_327245_002241.count = 2241 :=
  map_count_branch
    mapNode_327245_001120
    mapNode_328365_001121
    1120 1121
    mapNode_327245_001120_count
    mapNode_328365_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_329486_count :
    mapChunk_329486.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_330046_count :
    mapChunk_330046.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_329486_001121_count :
    mapNode_329486_001121.count = 1121 :=
  map_count_branch
    mapChunk_329486
    mapChunk_330046
    560 561
    mapChunk_329486_count
    mapChunk_330046_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_330607_count :
    mapChunk_330607.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_331167_count :
    mapChunk_331167.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_330607_001121_count :
    mapNode_330607_001121.count = 1121 :=
  map_count_branch
    mapChunk_330607
    mapChunk_331167
    560 561
    mapChunk_330607_count
    mapChunk_331167_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_329486_002242_count :
    mapNode_329486_002242.count = 2242 :=
  map_count_branch
    mapNode_329486_001121
    mapNode_330607_001121
    1121 1121
    mapNode_329486_001121_count
    mapNode_330607_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_327245_004483_count :
    mapNode_327245_004483.count = 4483 :=
  map_count_branch
    mapNode_327245_002241
    mapNode_329486_002242
    2241 2242
    mapNode_327245_002241_count
    mapNode_329486_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_322763_008965_count :
    mapNode_322763_008965.count = 8965 :=
  map_count_branch
    mapNode_322763_004482
    mapNode_327245_004483
    4482 4483
    mapNode_322763_004482_count
    mapNode_327245_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_331728_count :
    mapChunk_331728.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_332288_count :
    mapChunk_332288.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_331728_001120_count :
    mapNode_331728_001120.count = 1120 :=
  map_count_branch
    mapChunk_331728
    mapChunk_332288
    560 560
    mapChunk_331728_count
    mapChunk_332288_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_332848_count :
    mapChunk_332848.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_333408_count :
    mapChunk_333408.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_332848_001121_count :
    mapNode_332848_001121.count = 1121 :=
  map_count_branch
    mapChunk_332848
    mapChunk_333408
    560 561
    mapChunk_332848_count
    mapChunk_333408_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_331728_002241_count :
    mapNode_331728_002241.count = 2241 :=
  map_count_branch
    mapNode_331728_001120
    mapNode_332848_001121
    1120 1121
    mapNode_331728_001120_count
    mapNode_332848_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_333969_count :
    mapChunk_333969.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_334529_count :
    mapChunk_334529.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_333969_001121_count :
    mapNode_333969_001121.count = 1121 :=
  map_count_branch
    mapChunk_333969
    mapChunk_334529
    560 561
    mapChunk_333969_count
    mapChunk_334529_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_335090_count :
    mapChunk_335090.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_335650_count :
    mapChunk_335650.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_335090_001121_count :
    mapNode_335090_001121.count = 1121 :=
  map_count_branch
    mapChunk_335090
    mapChunk_335650
    560 561
    mapChunk_335090_count
    mapChunk_335650_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_333969_002242_count :
    mapNode_333969_002242.count = 2242 :=
  map_count_branch
    mapNode_333969_001121
    mapNode_335090_001121
    1121 1121
    mapNode_333969_001121_count
    mapNode_335090_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_331728_004483_count :
    mapNode_331728_004483.count = 4483 :=
  map_count_branch
    mapNode_331728_002241
    mapNode_333969_002242
    2241 2242
    mapNode_331728_002241_count
    mapNode_333969_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_336211_count :
    mapChunk_336211.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_336771_count :
    mapChunk_336771.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_336211_001120_count :
    mapNode_336211_001120.count = 1120 :=
  map_count_branch
    mapChunk_336211
    mapChunk_336771
    560 560
    mapChunk_336211_count
    mapChunk_336771_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_337331_count :
    mapChunk_337331.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_337891_count :
    mapChunk_337891.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_337331_001121_count :
    mapNode_337331_001121.count = 1121 :=
  map_count_branch
    mapChunk_337331
    mapChunk_337891
    560 561
    mapChunk_337331_count
    mapChunk_337891_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_336211_002241_count :
    mapNode_336211_002241.count = 2241 :=
  map_count_branch
    mapNode_336211_001120
    mapNode_337331_001121
    1120 1121
    mapNode_336211_001120_count
    mapNode_337331_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_338452_count :
    mapChunk_338452.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_339012_count :
    mapChunk_339012.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_338452_001121_count :
    mapNode_338452_001121.count = 1121 :=
  map_count_branch
    mapChunk_338452
    mapChunk_339012
    560 561
    mapChunk_338452_count
    mapChunk_339012_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_339573_count :
    mapChunk_339573.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_340133_count :
    mapChunk_340133.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_339573_001121_count :
    mapNode_339573_001121.count = 1121 :=
  map_count_branch
    mapChunk_339573
    mapChunk_340133
    560 561
    mapChunk_339573_count
    mapChunk_340133_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_338452_002242_count :
    mapNode_338452_002242.count = 2242 :=
  map_count_branch
    mapNode_338452_001121
    mapNode_339573_001121
    1121 1121
    mapNode_338452_001121_count
    mapNode_339573_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_336211_004483_count :
    mapNode_336211_004483.count = 4483 :=
  map_count_branch
    mapNode_336211_002241
    mapNode_338452_002242
    2241 2242
    mapNode_336211_002241_count
    mapNode_338452_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_331728_008966_count :
    mapNode_331728_008966.count = 8966 :=
  map_count_branch
    mapNode_331728_004483
    mapNode_336211_004483
    4483 4483
    mapNode_331728_004483_count
    mapNode_336211_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_322763_017931_count :
    mapNode_322763_017931.count = 17931 :=
  map_count_branch
    mapNode_322763_008965
    mapNode_331728_008966
    8965 8966
    mapNode_322763_008965_count
    mapNode_331728_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_340694_count :
    mapChunk_340694.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_341254_count :
    mapChunk_341254.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_340694_001120_count :
    mapNode_340694_001120.count = 1120 :=
  map_count_branch
    mapChunk_340694
    mapChunk_341254
    560 560
    mapChunk_340694_count
    mapChunk_341254_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_341814_count :
    mapChunk_341814.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_342374_count :
    mapChunk_342374.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_341814_001121_count :
    mapNode_341814_001121.count = 1121 :=
  map_count_branch
    mapChunk_341814
    mapChunk_342374
    560 561
    mapChunk_341814_count
    mapChunk_342374_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_340694_002241_count :
    mapNode_340694_002241.count = 2241 :=
  map_count_branch
    mapNode_340694_001120
    mapNode_341814_001121
    1120 1121
    mapNode_340694_001120_count
    mapNode_341814_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_342935_count :
    mapChunk_342935.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_343495_count :
    mapChunk_343495.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_342935_001121_count :
    mapNode_342935_001121.count = 1121 :=
  map_count_branch
    mapChunk_342935
    mapChunk_343495
    560 561
    mapChunk_342935_count
    mapChunk_343495_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_344056_count :
    mapChunk_344056.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_344616_count :
    mapChunk_344616.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_344056_001121_count :
    mapNode_344056_001121.count = 1121 :=
  map_count_branch
    mapChunk_344056
    mapChunk_344616
    560 561
    mapChunk_344056_count
    mapChunk_344616_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_342935_002242_count :
    mapNode_342935_002242.count = 2242 :=
  map_count_branch
    mapNode_342935_001121
    mapNode_344056_001121
    1121 1121
    mapNode_342935_001121_count
    mapNode_344056_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_340694_004483_count :
    mapNode_340694_004483.count = 4483 :=
  map_count_branch
    mapNode_340694_002241
    mapNode_342935_002242
    2241 2242
    mapNode_340694_002241_count
    mapNode_342935_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_345177_count :
    mapChunk_345177.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_345737_count :
    mapChunk_345737.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_345177_001120_count :
    mapNode_345177_001120.count = 1120 :=
  map_count_branch
    mapChunk_345177
    mapChunk_345737
    560 560
    mapChunk_345177_count
    mapChunk_345737_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_346297_count :
    mapChunk_346297.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_346857_count :
    mapChunk_346857.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_346297_001121_count :
    mapNode_346297_001121.count = 1121 :=
  map_count_branch
    mapChunk_346297
    mapChunk_346857
    560 561
    mapChunk_346297_count
    mapChunk_346857_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_345177_002241_count :
    mapNode_345177_002241.count = 2241 :=
  map_count_branch
    mapNode_345177_001120
    mapNode_346297_001121
    1120 1121
    mapNode_345177_001120_count
    mapNode_346297_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_347418_count :
    mapChunk_347418.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_347978_count :
    mapChunk_347978.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_347418_001121_count :
    mapNode_347418_001121.count = 1121 :=
  map_count_branch
    mapChunk_347418
    mapChunk_347978
    560 561
    mapChunk_347418_count
    mapChunk_347978_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_348539_count :
    mapChunk_348539.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_349099_count :
    mapChunk_349099.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_348539_001121_count :
    mapNode_348539_001121.count = 1121 :=
  map_count_branch
    mapChunk_348539
    mapChunk_349099
    560 561
    mapChunk_348539_count
    mapChunk_349099_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_347418_002242_count :
    mapNode_347418_002242.count = 2242 :=
  map_count_branch
    mapNode_347418_001121
    mapNode_348539_001121
    1121 1121
    mapNode_347418_001121_count
    mapNode_348539_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_345177_004483_count :
    mapNode_345177_004483.count = 4483 :=
  map_count_branch
    mapNode_345177_002241
    mapNode_347418_002242
    2241 2242
    mapNode_345177_002241_count
    mapNode_347418_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_340694_008966_count :
    mapNode_340694_008966.count = 8966 :=
  map_count_branch
    mapNode_340694_004483
    mapNode_345177_004483
    4483 4483
    mapNode_340694_004483_count
    mapNode_345177_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_349660_count :
    mapChunk_349660.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_350220_count :
    mapChunk_350220.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_349660_001120_count :
    mapNode_349660_001120.count = 1120 :=
  map_count_branch
    mapChunk_349660
    mapChunk_350220
    560 560
    mapChunk_349660_count
    mapChunk_350220_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_350780_count :
    mapChunk_350780.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_351340_count :
    mapChunk_351340.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_350780_001121_count :
    mapNode_350780_001121.count = 1121 :=
  map_count_branch
    mapChunk_350780
    mapChunk_351340
    560 561
    mapChunk_350780_count
    mapChunk_351340_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_349660_002241_count :
    mapNode_349660_002241.count = 2241 :=
  map_count_branch
    mapNode_349660_001120
    mapNode_350780_001121
    1120 1121
    mapNode_349660_001120_count
    mapNode_350780_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_351901_count :
    mapChunk_351901.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_352461_count :
    mapChunk_352461.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_351901_001121_count :
    mapNode_351901_001121.count = 1121 :=
  map_count_branch
    mapChunk_351901
    mapChunk_352461
    560 561
    mapChunk_351901_count
    mapChunk_352461_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_353022_count :
    mapChunk_353022.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_353582_count :
    mapChunk_353582.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_353022_001121_count :
    mapNode_353022_001121.count = 1121 :=
  map_count_branch
    mapChunk_353022
    mapChunk_353582
    560 561
    mapChunk_353022_count
    mapChunk_353582_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_351901_002242_count :
    mapNode_351901_002242.count = 2242 :=
  map_count_branch
    mapNode_351901_001121
    mapNode_353022_001121
    1121 1121
    mapNode_351901_001121_count
    mapNode_353022_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_349660_004483_count :
    mapNode_349660_004483.count = 4483 :=
  map_count_branch
    mapNode_349660_002241
    mapNode_351901_002242
    2241 2242
    mapNode_349660_002241_count
    mapNode_351901_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_354143_count :
    mapChunk_354143.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_354703_count :
    mapChunk_354703.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_354143_001120_count :
    mapNode_354143_001120.count = 1120 :=
  map_count_branch
    mapChunk_354143
    mapChunk_354703
    560 560
    mapChunk_354143_count
    mapChunk_354703_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_355263_count :
    mapChunk_355263.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_355823_count :
    mapChunk_355823.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_355263_001121_count :
    mapNode_355263_001121.count = 1121 :=
  map_count_branch
    mapChunk_355263
    mapChunk_355823
    560 561
    mapChunk_355263_count
    mapChunk_355823_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_354143_002241_count :
    mapNode_354143_002241.count = 2241 :=
  map_count_branch
    mapNode_354143_001120
    mapNode_355263_001121
    1120 1121
    mapNode_354143_001120_count
    mapNode_355263_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_356384_count :
    mapChunk_356384.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_356944_count :
    mapChunk_356944.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_356384_001121_count :
    mapNode_356384_001121.count = 1121 :=
  map_count_branch
    mapChunk_356384
    mapChunk_356944
    560 561
    mapChunk_356384_count
    mapChunk_356944_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_357505_count :
    mapChunk_357505.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_358065_count :
    mapChunk_358065.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_357505_001121_count :
    mapNode_357505_001121.count = 1121 :=
  map_count_branch
    mapChunk_357505
    mapChunk_358065
    560 561
    mapChunk_357505_count
    mapChunk_358065_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_356384_002242_count :
    mapNode_356384_002242.count = 2242 :=
  map_count_branch
    mapNode_356384_001121
    mapNode_357505_001121
    1121 1121
    mapNode_356384_001121_count
    mapNode_357505_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_354143_004483_count :
    mapNode_354143_004483.count = 4483 :=
  map_count_branch
    mapNode_354143_002241
    mapNode_356384_002242
    2241 2242
    mapNode_354143_002241_count
    mapNode_356384_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_349660_008966_count :
    mapNode_349660_008966.count = 8966 :=
  map_count_branch
    mapNode_349660_004483
    mapNode_354143_004483
    4483 4483
    mapNode_349660_004483_count
    mapNode_354143_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_340694_017932_count :
    mapNode_340694_017932.count = 17932 :=
  map_count_branch
    mapNode_340694_008966
    mapNode_349660_008966
    8966 8966
    mapNode_340694_008966_count
    mapNode_349660_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_322763_035863_count :
    mapNode_322763_035863.count = 35863 :=
  map_count_branch
    mapNode_322763_017931
    mapNode_340694_017932
    17931 17932
    mapNode_322763_017931_count
    mapNode_340694_017932_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_286901_071725_count :
    mapNode_286901_071725.count = 71725 :=
  map_count_branch
    mapNode_286901_035862
    mapNode_322763_035863
    35862 35863
    mapNode_286901_035862_count
    mapNode_322763_035863_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_358626_count :
    mapChunk_358626.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_359186_count :
    mapChunk_359186.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_358626_001120_count :
    mapNode_358626_001120.count = 1120 :=
  map_count_branch
    mapChunk_358626
    mapChunk_359186
    560 560
    mapChunk_358626_count
    mapChunk_359186_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_359746_count :
    mapChunk_359746.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_360306_count :
    mapChunk_360306.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_359746_001121_count :
    mapNode_359746_001121.count = 1121 :=
  map_count_branch
    mapChunk_359746
    mapChunk_360306
    560 561
    mapChunk_359746_count
    mapChunk_360306_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_358626_002241_count :
    mapNode_358626_002241.count = 2241 :=
  map_count_branch
    mapNode_358626_001120
    mapNode_359746_001121
    1120 1121
    mapNode_358626_001120_count
    mapNode_359746_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_360867_count :
    mapChunk_360867.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_361427_count :
    mapChunk_361427.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_360867_001120_count :
    mapNode_360867_001120.count = 1120 :=
  map_count_branch
    mapChunk_360867
    mapChunk_361427
    560 560
    mapChunk_360867_count
    mapChunk_361427_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_361987_count :
    mapChunk_361987.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_362547_count :
    mapChunk_362547.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_361987_001121_count :
    mapNode_361987_001121.count = 1121 :=
  map_count_branch
    mapChunk_361987
    mapChunk_362547
    560 561
    mapChunk_361987_count
    mapChunk_362547_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_360867_002241_count :
    mapNode_360867_002241.count = 2241 :=
  map_count_branch
    mapNode_360867_001120
    mapNode_361987_001121
    1120 1121
    mapNode_360867_001120_count
    mapNode_361987_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_358626_004482_count :
    mapNode_358626_004482.count = 4482 :=
  map_count_branch
    mapNode_358626_002241
    mapNode_360867_002241
    2241 2241
    mapNode_358626_002241_count
    mapNode_360867_002241_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_363108_count :
    mapChunk_363108.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_363668_count :
    mapChunk_363668.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_363108_001120_count :
    mapNode_363108_001120.count = 1120 :=
  map_count_branch
    mapChunk_363108
    mapChunk_363668
    560 560
    mapChunk_363108_count
    mapChunk_363668_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_364228_count :
    mapChunk_364228.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_364788_count :
    mapChunk_364788.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_364228_001121_count :
    mapNode_364228_001121.count = 1121 :=
  map_count_branch
    mapChunk_364228
    mapChunk_364788
    560 561
    mapChunk_364228_count
    mapChunk_364788_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_363108_002241_count :
    mapNode_363108_002241.count = 2241 :=
  map_count_branch
    mapNode_363108_001120
    mapNode_364228_001121
    1120 1121
    mapNode_363108_001120_count
    mapNode_364228_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_365349_count :
    mapChunk_365349.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_365909_count :
    mapChunk_365909.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_365349_001121_count :
    mapNode_365349_001121.count = 1121 :=
  map_count_branch
    mapChunk_365349
    mapChunk_365909
    560 561
    mapChunk_365349_count
    mapChunk_365909_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_366470_count :
    mapChunk_366470.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_367030_count :
    mapChunk_367030.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_366470_001121_count :
    mapNode_366470_001121.count = 1121 :=
  map_count_branch
    mapChunk_366470
    mapChunk_367030
    560 561
    mapChunk_366470_count
    mapChunk_367030_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_365349_002242_count :
    mapNode_365349_002242.count = 2242 :=
  map_count_branch
    mapNode_365349_001121
    mapNode_366470_001121
    1121 1121
    mapNode_365349_001121_count
    mapNode_366470_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_363108_004483_count :
    mapNode_363108_004483.count = 4483 :=
  map_count_branch
    mapNode_363108_002241
    mapNode_365349_002242
    2241 2242
    mapNode_363108_002241_count
    mapNode_365349_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_358626_008965_count :
    mapNode_358626_008965.count = 8965 :=
  map_count_branch
    mapNode_358626_004482
    mapNode_363108_004483
    4482 4483
    mapNode_358626_004482_count
    mapNode_363108_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_367591_count :
    mapChunk_367591.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_368151_count :
    mapChunk_368151.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_367591_001120_count :
    mapNode_367591_001120.count = 1120 :=
  map_count_branch
    mapChunk_367591
    mapChunk_368151
    560 560
    mapChunk_367591_count
    mapChunk_368151_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_368711_count :
    mapChunk_368711.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_369271_count :
    mapChunk_369271.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_368711_001121_count :
    mapNode_368711_001121.count = 1121 :=
  map_count_branch
    mapChunk_368711
    mapChunk_369271
    560 561
    mapChunk_368711_count
    mapChunk_369271_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_367591_002241_count :
    mapNode_367591_002241.count = 2241 :=
  map_count_branch
    mapNode_367591_001120
    mapNode_368711_001121
    1120 1121
    mapNode_367591_001120_count
    mapNode_368711_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_369832_count :
    mapChunk_369832.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_370392_count :
    mapChunk_370392.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_369832_001121_count :
    mapNode_369832_001121.count = 1121 :=
  map_count_branch
    mapChunk_369832
    mapChunk_370392
    560 561
    mapChunk_369832_count
    mapChunk_370392_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_370953_count :
    mapChunk_370953.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_371513_count :
    mapChunk_371513.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_370953_001121_count :
    mapNode_370953_001121.count = 1121 :=
  map_count_branch
    mapChunk_370953
    mapChunk_371513
    560 561
    mapChunk_370953_count
    mapChunk_371513_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_369832_002242_count :
    mapNode_369832_002242.count = 2242 :=
  map_count_branch
    mapNode_369832_001121
    mapNode_370953_001121
    1121 1121
    mapNode_369832_001121_count
    mapNode_370953_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_367591_004483_count :
    mapNode_367591_004483.count = 4483 :=
  map_count_branch
    mapNode_367591_002241
    mapNode_369832_002242
    2241 2242
    mapNode_367591_002241_count
    mapNode_369832_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_372074_count :
    mapChunk_372074.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_372634_count :
    mapChunk_372634.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_372074_001120_count :
    mapNode_372074_001120.count = 1120 :=
  map_count_branch
    mapChunk_372074
    mapChunk_372634
    560 560
    mapChunk_372074_count
    mapChunk_372634_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_373194_count :
    mapChunk_373194.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_373754_count :
    mapChunk_373754.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_373194_001121_count :
    mapNode_373194_001121.count = 1121 :=
  map_count_branch
    mapChunk_373194
    mapChunk_373754
    560 561
    mapChunk_373194_count
    mapChunk_373754_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_372074_002241_count :
    mapNode_372074_002241.count = 2241 :=
  map_count_branch
    mapNode_372074_001120
    mapNode_373194_001121
    1120 1121
    mapNode_372074_001120_count
    mapNode_373194_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_374315_count :
    mapChunk_374315.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_374875_count :
    mapChunk_374875.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_374315_001121_count :
    mapNode_374315_001121.count = 1121 :=
  map_count_branch
    mapChunk_374315
    mapChunk_374875
    560 561
    mapChunk_374315_count
    mapChunk_374875_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_375436_count :
    mapChunk_375436.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_375996_count :
    mapChunk_375996.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_375436_001121_count :
    mapNode_375436_001121.count = 1121 :=
  map_count_branch
    mapChunk_375436
    mapChunk_375996
    560 561
    mapChunk_375436_count
    mapChunk_375996_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_374315_002242_count :
    mapNode_374315_002242.count = 2242 :=
  map_count_branch
    mapNode_374315_001121
    mapNode_375436_001121
    1121 1121
    mapNode_374315_001121_count
    mapNode_375436_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_372074_004483_count :
    mapNode_372074_004483.count = 4483 :=
  map_count_branch
    mapNode_372074_002241
    mapNode_374315_002242
    2241 2242
    mapNode_372074_002241_count
    mapNode_374315_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_367591_008966_count :
    mapNode_367591_008966.count = 8966 :=
  map_count_branch
    mapNode_367591_004483
    mapNode_372074_004483
    4483 4483
    mapNode_367591_004483_count
    mapNode_372074_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_358626_017931_count :
    mapNode_358626_017931.count = 17931 :=
  map_count_branch
    mapNode_358626_008965
    mapNode_367591_008966
    8965 8966
    mapNode_358626_008965_count
    mapNode_367591_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_376557_count :
    mapChunk_376557.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_377117_count :
    mapChunk_377117.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_376557_001120_count :
    mapNode_376557_001120.count = 1120 :=
  map_count_branch
    mapChunk_376557
    mapChunk_377117
    560 560
    mapChunk_376557_count
    mapChunk_377117_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_377677_count :
    mapChunk_377677.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_378237_count :
    mapChunk_378237.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_377677_001121_count :
    mapNode_377677_001121.count = 1121 :=
  map_count_branch
    mapChunk_377677
    mapChunk_378237
    560 561
    mapChunk_377677_count
    mapChunk_378237_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_376557_002241_count :
    mapNode_376557_002241.count = 2241 :=
  map_count_branch
    mapNode_376557_001120
    mapNode_377677_001121
    1120 1121
    mapNode_376557_001120_count
    mapNode_377677_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_378798_count :
    mapChunk_378798.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_379358_count :
    mapChunk_379358.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_378798_001120_count :
    mapNode_378798_001120.count = 1120 :=
  map_count_branch
    mapChunk_378798
    mapChunk_379358
    560 560
    mapChunk_378798_count
    mapChunk_379358_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_379918_count :
    mapChunk_379918.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_380478_count :
    mapChunk_380478.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_379918_001121_count :
    mapNode_379918_001121.count = 1121 :=
  map_count_branch
    mapChunk_379918
    mapChunk_380478
    560 561
    mapChunk_379918_count
    mapChunk_380478_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_378798_002241_count :
    mapNode_378798_002241.count = 2241 :=
  map_count_branch
    mapNode_378798_001120
    mapNode_379918_001121
    1120 1121
    mapNode_378798_001120_count
    mapNode_379918_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_376557_004482_count :
    mapNode_376557_004482.count = 4482 :=
  map_count_branch
    mapNode_376557_002241
    mapNode_378798_002241
    2241 2241
    mapNode_376557_002241_count
    mapNode_378798_002241_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_381039_count :
    mapChunk_381039.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_381599_count :
    mapChunk_381599.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_381039_001120_count :
    mapNode_381039_001120.count = 1120 :=
  map_count_branch
    mapChunk_381039
    mapChunk_381599
    560 560
    mapChunk_381039_count
    mapChunk_381599_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_382159_count :
    mapChunk_382159.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_382719_count :
    mapChunk_382719.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_382159_001121_count :
    mapNode_382159_001121.count = 1121 :=
  map_count_branch
    mapChunk_382159
    mapChunk_382719
    560 561
    mapChunk_382159_count
    mapChunk_382719_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_381039_002241_count :
    mapNode_381039_002241.count = 2241 :=
  map_count_branch
    mapNode_381039_001120
    mapNode_382159_001121
    1120 1121
    mapNode_381039_001120_count
    mapNode_382159_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_383280_count :
    mapChunk_383280.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_383840_count :
    mapChunk_383840.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_383280_001121_count :
    mapNode_383280_001121.count = 1121 :=
  map_count_branch
    mapChunk_383280
    mapChunk_383840
    560 561
    mapChunk_383280_count
    mapChunk_383840_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_384401_count :
    mapChunk_384401.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_384961_count :
    mapChunk_384961.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_384401_001121_count :
    mapNode_384401_001121.count = 1121 :=
  map_count_branch
    mapChunk_384401
    mapChunk_384961
    560 561
    mapChunk_384401_count
    mapChunk_384961_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_383280_002242_count :
    mapNode_383280_002242.count = 2242 :=
  map_count_branch
    mapNode_383280_001121
    mapNode_384401_001121
    1121 1121
    mapNode_383280_001121_count
    mapNode_384401_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_381039_004483_count :
    mapNode_381039_004483.count = 4483 :=
  map_count_branch
    mapNode_381039_002241
    mapNode_383280_002242
    2241 2242
    mapNode_381039_002241_count
    mapNode_383280_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_376557_008965_count :
    mapNode_376557_008965.count = 8965 :=
  map_count_branch
    mapNode_376557_004482
    mapNode_381039_004483
    4482 4483
    mapNode_376557_004482_count
    mapNode_381039_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_385522_count :
    mapChunk_385522.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_386082_count :
    mapChunk_386082.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_385522_001120_count :
    mapNode_385522_001120.count = 1120 :=
  map_count_branch
    mapChunk_385522
    mapChunk_386082
    560 560
    mapChunk_385522_count
    mapChunk_386082_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_386642_count :
    mapChunk_386642.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_387202_count :
    mapChunk_387202.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_386642_001121_count :
    mapNode_386642_001121.count = 1121 :=
  map_count_branch
    mapChunk_386642
    mapChunk_387202
    560 561
    mapChunk_386642_count
    mapChunk_387202_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_385522_002241_count :
    mapNode_385522_002241.count = 2241 :=
  map_count_branch
    mapNode_385522_001120
    mapNode_386642_001121
    1120 1121
    mapNode_385522_001120_count
    mapNode_386642_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_387763_count :
    mapChunk_387763.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_388323_count :
    mapChunk_388323.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_387763_001121_count :
    mapNode_387763_001121.count = 1121 :=
  map_count_branch
    mapChunk_387763
    mapChunk_388323
    560 561
    mapChunk_387763_count
    mapChunk_388323_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_388884_count :
    mapChunk_388884.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_389444_count :
    mapChunk_389444.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_388884_001121_count :
    mapNode_388884_001121.count = 1121 :=
  map_count_branch
    mapChunk_388884
    mapChunk_389444
    560 561
    mapChunk_388884_count
    mapChunk_389444_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_387763_002242_count :
    mapNode_387763_002242.count = 2242 :=
  map_count_branch
    mapNode_387763_001121
    mapNode_388884_001121
    1121 1121
    mapNode_387763_001121_count
    mapNode_388884_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_385522_004483_count :
    mapNode_385522_004483.count = 4483 :=
  map_count_branch
    mapNode_385522_002241
    mapNode_387763_002242
    2241 2242
    mapNode_385522_002241_count
    mapNode_387763_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_390005_count :
    mapChunk_390005.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_390565_count :
    mapChunk_390565.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_390005_001120_count :
    mapNode_390005_001120.count = 1120 :=
  map_count_branch
    mapChunk_390005
    mapChunk_390565
    560 560
    mapChunk_390005_count
    mapChunk_390565_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_391125_count :
    mapChunk_391125.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_391685_count :
    mapChunk_391685.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_391125_001121_count :
    mapNode_391125_001121.count = 1121 :=
  map_count_branch
    mapChunk_391125
    mapChunk_391685
    560 561
    mapChunk_391125_count
    mapChunk_391685_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_390005_002241_count :
    mapNode_390005_002241.count = 2241 :=
  map_count_branch
    mapNode_390005_001120
    mapNode_391125_001121
    1120 1121
    mapNode_390005_001120_count
    mapNode_391125_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_392246_count :
    mapChunk_392246.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_392806_count :
    mapChunk_392806.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_392246_001121_count :
    mapNode_392246_001121.count = 1121 :=
  map_count_branch
    mapChunk_392246
    mapChunk_392806
    560 561
    mapChunk_392246_count
    mapChunk_392806_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_393367_count :
    mapChunk_393367.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_393927_count :
    mapChunk_393927.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_393367_001121_count :
    mapNode_393367_001121.count = 1121 :=
  map_count_branch
    mapChunk_393367
    mapChunk_393927
    560 561
    mapChunk_393367_count
    mapChunk_393927_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_392246_002242_count :
    mapNode_392246_002242.count = 2242 :=
  map_count_branch
    mapNode_392246_001121
    mapNode_393367_001121
    1121 1121
    mapNode_392246_001121_count
    mapNode_393367_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_390005_004483_count :
    mapNode_390005_004483.count = 4483 :=
  map_count_branch
    mapNode_390005_002241
    mapNode_392246_002242
    2241 2242
    mapNode_390005_002241_count
    mapNode_392246_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_385522_008966_count :
    mapNode_385522_008966.count = 8966 :=
  map_count_branch
    mapNode_385522_004483
    mapNode_390005_004483
    4483 4483
    mapNode_385522_004483_count
    mapNode_390005_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_376557_017931_count :
    mapNode_376557_017931.count = 17931 :=
  map_count_branch
    mapNode_376557_008965
    mapNode_385522_008966
    8965 8966
    mapNode_376557_008965_count
    mapNode_385522_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_358626_035862_count :
    mapNode_358626_035862.count = 35862 :=
  map_count_branch
    mapNode_358626_017931
    mapNode_376557_017931
    17931 17931
    mapNode_358626_017931_count
    mapNode_376557_017931_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_394488_count :
    mapChunk_394488.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_395048_count :
    mapChunk_395048.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_394488_001120_count :
    mapNode_394488_001120.count = 1120 :=
  map_count_branch
    mapChunk_394488
    mapChunk_395048
    560 560
    mapChunk_394488_count
    mapChunk_395048_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_395608_count :
    mapChunk_395608.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_396168_count :
    mapChunk_396168.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_395608_001121_count :
    mapNode_395608_001121.count = 1121 :=
  map_count_branch
    mapChunk_395608
    mapChunk_396168
    560 561
    mapChunk_395608_count
    mapChunk_396168_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_394488_002241_count :
    mapNode_394488_002241.count = 2241 :=
  map_count_branch
    mapNode_394488_001120
    mapNode_395608_001121
    1120 1121
    mapNode_394488_001120_count
    mapNode_395608_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_396729_count :
    mapChunk_396729.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_397289_count :
    mapChunk_397289.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_396729_001120_count :
    mapNode_396729_001120.count = 1120 :=
  map_count_branch
    mapChunk_396729
    mapChunk_397289
    560 560
    mapChunk_396729_count
    mapChunk_397289_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_397849_count :
    mapChunk_397849.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_398409_count :
    mapChunk_398409.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_397849_001121_count :
    mapNode_397849_001121.count = 1121 :=
  map_count_branch
    mapChunk_397849
    mapChunk_398409
    560 561
    mapChunk_397849_count
    mapChunk_398409_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_396729_002241_count :
    mapNode_396729_002241.count = 2241 :=
  map_count_branch
    mapNode_396729_001120
    mapNode_397849_001121
    1120 1121
    mapNode_396729_001120_count
    mapNode_397849_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_394488_004482_count :
    mapNode_394488_004482.count = 4482 :=
  map_count_branch
    mapNode_394488_002241
    mapNode_396729_002241
    2241 2241
    mapNode_394488_002241_count
    mapNode_396729_002241_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_398970_count :
    mapChunk_398970.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_399530_count :
    mapChunk_399530.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_398970_001120_count :
    mapNode_398970_001120.count = 1120 :=
  map_count_branch
    mapChunk_398970
    mapChunk_399530
    560 560
    mapChunk_398970_count
    mapChunk_399530_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_400090_count :
    mapChunk_400090.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_400650_count :
    mapChunk_400650.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_400090_001121_count :
    mapNode_400090_001121.count = 1121 :=
  map_count_branch
    mapChunk_400090
    mapChunk_400650
    560 561
    mapChunk_400090_count
    mapChunk_400650_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_398970_002241_count :
    mapNode_398970_002241.count = 2241 :=
  map_count_branch
    mapNode_398970_001120
    mapNode_400090_001121
    1120 1121
    mapNode_398970_001120_count
    mapNode_400090_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_401211_count :
    mapChunk_401211.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_401771_count :
    mapChunk_401771.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_401211_001121_count :
    mapNode_401211_001121.count = 1121 :=
  map_count_branch
    mapChunk_401211
    mapChunk_401771
    560 561
    mapChunk_401211_count
    mapChunk_401771_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_402332_count :
    mapChunk_402332.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_402892_count :
    mapChunk_402892.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_402332_001121_count :
    mapNode_402332_001121.count = 1121 :=
  map_count_branch
    mapChunk_402332
    mapChunk_402892
    560 561
    mapChunk_402332_count
    mapChunk_402892_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_401211_002242_count :
    mapNode_401211_002242.count = 2242 :=
  map_count_branch
    mapNode_401211_001121
    mapNode_402332_001121
    1121 1121
    mapNode_401211_001121_count
    mapNode_402332_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_398970_004483_count :
    mapNode_398970_004483.count = 4483 :=
  map_count_branch
    mapNode_398970_002241
    mapNode_401211_002242
    2241 2242
    mapNode_398970_002241_count
    mapNode_401211_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_394488_008965_count :
    mapNode_394488_008965.count = 8965 :=
  map_count_branch
    mapNode_394488_004482
    mapNode_398970_004483
    4482 4483
    mapNode_394488_004482_count
    mapNode_398970_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_403453_count :
    mapChunk_403453.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_404013_count :
    mapChunk_404013.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_403453_001120_count :
    mapNode_403453_001120.count = 1120 :=
  map_count_branch
    mapChunk_403453
    mapChunk_404013
    560 560
    mapChunk_403453_count
    mapChunk_404013_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_404573_count :
    mapChunk_404573.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_405133_count :
    mapChunk_405133.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_404573_001121_count :
    mapNode_404573_001121.count = 1121 :=
  map_count_branch
    mapChunk_404573
    mapChunk_405133
    560 561
    mapChunk_404573_count
    mapChunk_405133_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_403453_002241_count :
    mapNode_403453_002241.count = 2241 :=
  map_count_branch
    mapNode_403453_001120
    mapNode_404573_001121
    1120 1121
    mapNode_403453_001120_count
    mapNode_404573_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_405694_count :
    mapChunk_405694.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_406254_count :
    mapChunk_406254.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_405694_001121_count :
    mapNode_405694_001121.count = 1121 :=
  map_count_branch
    mapChunk_405694
    mapChunk_406254
    560 561
    mapChunk_405694_count
    mapChunk_406254_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_406815_count :
    mapChunk_406815.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_407375_count :
    mapChunk_407375.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_406815_001121_count :
    mapNode_406815_001121.count = 1121 :=
  map_count_branch
    mapChunk_406815
    mapChunk_407375
    560 561
    mapChunk_406815_count
    mapChunk_407375_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_405694_002242_count :
    mapNode_405694_002242.count = 2242 :=
  map_count_branch
    mapNode_405694_001121
    mapNode_406815_001121
    1121 1121
    mapNode_405694_001121_count
    mapNode_406815_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_403453_004483_count :
    mapNode_403453_004483.count = 4483 :=
  map_count_branch
    mapNode_403453_002241
    mapNode_405694_002242
    2241 2242
    mapNode_403453_002241_count
    mapNode_405694_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_407936_count :
    mapChunk_407936.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_408496_count :
    mapChunk_408496.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_407936_001120_count :
    mapNode_407936_001120.count = 1120 :=
  map_count_branch
    mapChunk_407936
    mapChunk_408496
    560 560
    mapChunk_407936_count
    mapChunk_408496_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_409056_count :
    mapChunk_409056.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_409616_count :
    mapChunk_409616.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_409056_001121_count :
    mapNode_409056_001121.count = 1121 :=
  map_count_branch
    mapChunk_409056
    mapChunk_409616
    560 561
    mapChunk_409056_count
    mapChunk_409616_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_407936_002241_count :
    mapNode_407936_002241.count = 2241 :=
  map_count_branch
    mapNode_407936_001120
    mapNode_409056_001121
    1120 1121
    mapNode_407936_001120_count
    mapNode_409056_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_410177_count :
    mapChunk_410177.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_410737_count :
    mapChunk_410737.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_410177_001121_count :
    mapNode_410177_001121.count = 1121 :=
  map_count_branch
    mapChunk_410177
    mapChunk_410737
    560 561
    mapChunk_410177_count
    mapChunk_410737_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_411298_count :
    mapChunk_411298.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_411858_count :
    mapChunk_411858.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_411298_001121_count :
    mapNode_411298_001121.count = 1121 :=
  map_count_branch
    mapChunk_411298
    mapChunk_411858
    560 561
    mapChunk_411298_count
    mapChunk_411858_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_410177_002242_count :
    mapNode_410177_002242.count = 2242 :=
  map_count_branch
    mapNode_410177_001121
    mapNode_411298_001121
    1121 1121
    mapNode_410177_001121_count
    mapNode_411298_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_407936_004483_count :
    mapNode_407936_004483.count = 4483 :=
  map_count_branch
    mapNode_407936_002241
    mapNode_410177_002242
    2241 2242
    mapNode_407936_002241_count
    mapNode_410177_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_403453_008966_count :
    mapNode_403453_008966.count = 8966 :=
  map_count_branch
    mapNode_403453_004483
    mapNode_407936_004483
    4483 4483
    mapNode_403453_004483_count
    mapNode_407936_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_394488_017931_count :
    mapNode_394488_017931.count = 17931 :=
  map_count_branch
    mapNode_394488_008965
    mapNode_403453_008966
    8965 8966
    mapNode_394488_008965_count
    mapNode_403453_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_412419_count :
    mapChunk_412419.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_412979_count :
    mapChunk_412979.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_412419_001120_count :
    mapNode_412419_001120.count = 1120 :=
  map_count_branch
    mapChunk_412419
    mapChunk_412979
    560 560
    mapChunk_412419_count
    mapChunk_412979_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_413539_count :
    mapChunk_413539.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_414099_count :
    mapChunk_414099.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_413539_001121_count :
    mapNode_413539_001121.count = 1121 :=
  map_count_branch
    mapChunk_413539
    mapChunk_414099
    560 561
    mapChunk_413539_count
    mapChunk_414099_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_412419_002241_count :
    mapNode_412419_002241.count = 2241 :=
  map_count_branch
    mapNode_412419_001120
    mapNode_413539_001121
    1120 1121
    mapNode_412419_001120_count
    mapNode_413539_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_414660_count :
    mapChunk_414660.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_415220_count :
    mapChunk_415220.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_414660_001121_count :
    mapNode_414660_001121.count = 1121 :=
  map_count_branch
    mapChunk_414660
    mapChunk_415220
    560 561
    mapChunk_414660_count
    mapChunk_415220_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_415781_count :
    mapChunk_415781.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_416341_count :
    mapChunk_416341.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_415781_001121_count :
    mapNode_415781_001121.count = 1121 :=
  map_count_branch
    mapChunk_415781
    mapChunk_416341
    560 561
    mapChunk_415781_count
    mapChunk_416341_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_414660_002242_count :
    mapNode_414660_002242.count = 2242 :=
  map_count_branch
    mapNode_414660_001121
    mapNode_415781_001121
    1121 1121
    mapNode_414660_001121_count
    mapNode_415781_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_412419_004483_count :
    mapNode_412419_004483.count = 4483 :=
  map_count_branch
    mapNode_412419_002241
    mapNode_414660_002242
    2241 2242
    mapNode_412419_002241_count
    mapNode_414660_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_416902_count :
    mapChunk_416902.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_417462_count :
    mapChunk_417462.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_416902_001120_count :
    mapNode_416902_001120.count = 1120 :=
  map_count_branch
    mapChunk_416902
    mapChunk_417462
    560 560
    mapChunk_416902_count
    mapChunk_417462_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_418022_count :
    mapChunk_418022.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_418582_count :
    mapChunk_418582.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_418022_001121_count :
    mapNode_418022_001121.count = 1121 :=
  map_count_branch
    mapChunk_418022
    mapChunk_418582
    560 561
    mapChunk_418022_count
    mapChunk_418582_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_416902_002241_count :
    mapNode_416902_002241.count = 2241 :=
  map_count_branch
    mapNode_416902_001120
    mapNode_418022_001121
    1120 1121
    mapNode_416902_001120_count
    mapNode_418022_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_419143_count :
    mapChunk_419143.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_419703_count :
    mapChunk_419703.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_419143_001121_count :
    mapNode_419143_001121.count = 1121 :=
  map_count_branch
    mapChunk_419143
    mapChunk_419703
    560 561
    mapChunk_419143_count
    mapChunk_419703_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_420264_count :
    mapChunk_420264.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_420824_count :
    mapChunk_420824.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_420264_001121_count :
    mapNode_420264_001121.count = 1121 :=
  map_count_branch
    mapChunk_420264
    mapChunk_420824
    560 561
    mapChunk_420264_count
    mapChunk_420824_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_419143_002242_count :
    mapNode_419143_002242.count = 2242 :=
  map_count_branch
    mapNode_419143_001121
    mapNode_420264_001121
    1121 1121
    mapNode_419143_001121_count
    mapNode_420264_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_416902_004483_count :
    mapNode_416902_004483.count = 4483 :=
  map_count_branch
    mapNode_416902_002241
    mapNode_419143_002242
    2241 2242
    mapNode_416902_002241_count
    mapNode_419143_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_412419_008966_count :
    mapNode_412419_008966.count = 8966 :=
  map_count_branch
    mapNode_412419_004483
    mapNode_416902_004483
    4483 4483
    mapNode_412419_004483_count
    mapNode_416902_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_421385_count :
    mapChunk_421385.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_421945_count :
    mapChunk_421945.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_421385_001120_count :
    mapNode_421385_001120.count = 1120 :=
  map_count_branch
    mapChunk_421385
    mapChunk_421945
    560 560
    mapChunk_421385_count
    mapChunk_421945_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_422505_count :
    mapChunk_422505.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_423065_count :
    mapChunk_423065.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_422505_001121_count :
    mapNode_422505_001121.count = 1121 :=
  map_count_branch
    mapChunk_422505
    mapChunk_423065
    560 561
    mapChunk_422505_count
    mapChunk_423065_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_421385_002241_count :
    mapNode_421385_002241.count = 2241 :=
  map_count_branch
    mapNode_421385_001120
    mapNode_422505_001121
    1120 1121
    mapNode_421385_001120_count
    mapNode_422505_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_423626_count :
    mapChunk_423626.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_424186_count :
    mapChunk_424186.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_423626_001121_count :
    mapNode_423626_001121.count = 1121 :=
  map_count_branch
    mapChunk_423626
    mapChunk_424186
    560 561
    mapChunk_423626_count
    mapChunk_424186_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_424747_count :
    mapChunk_424747.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_425307_count :
    mapChunk_425307.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_424747_001121_count :
    mapNode_424747_001121.count = 1121 :=
  map_count_branch
    mapChunk_424747
    mapChunk_425307
    560 561
    mapChunk_424747_count
    mapChunk_425307_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_423626_002242_count :
    mapNode_423626_002242.count = 2242 :=
  map_count_branch
    mapNode_423626_001121
    mapNode_424747_001121
    1121 1121
    mapNode_423626_001121_count
    mapNode_424747_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_421385_004483_count :
    mapNode_421385_004483.count = 4483 :=
  map_count_branch
    mapNode_421385_002241
    mapNode_423626_002242
    2241 2242
    mapNode_421385_002241_count
    mapNode_423626_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_425868_count :
    mapChunk_425868.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_426428_count :
    mapChunk_426428.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_425868_001120_count :
    mapNode_425868_001120.count = 1120 :=
  map_count_branch
    mapChunk_425868
    mapChunk_426428
    560 560
    mapChunk_425868_count
    mapChunk_426428_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_426988_count :
    mapChunk_426988.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_427548_count :
    mapChunk_427548.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_426988_001121_count :
    mapNode_426988_001121.count = 1121 :=
  map_count_branch
    mapChunk_426988
    mapChunk_427548
    560 561
    mapChunk_426988_count
    mapChunk_427548_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_425868_002241_count :
    mapNode_425868_002241.count = 2241 :=
  map_count_branch
    mapNode_425868_001120
    mapNode_426988_001121
    1120 1121
    mapNode_425868_001120_count
    mapNode_426988_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_428109_count :
    mapChunk_428109.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_428669_count :
    mapChunk_428669.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_428109_001121_count :
    mapNode_428109_001121.count = 1121 :=
  map_count_branch
    mapChunk_428109
    mapChunk_428669
    560 561
    mapChunk_428109_count
    mapChunk_428669_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_429230_count :
    mapChunk_429230.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_429790_count :
    mapChunk_429790.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_429230_001121_count :
    mapNode_429230_001121.count = 1121 :=
  map_count_branch
    mapChunk_429230
    mapChunk_429790
    560 561
    mapChunk_429230_count
    mapChunk_429790_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_428109_002242_count :
    mapNode_428109_002242.count = 2242 :=
  map_count_branch
    mapNode_428109_001121
    mapNode_429230_001121
    1121 1121
    mapNode_428109_001121_count
    mapNode_429230_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_425868_004483_count :
    mapNode_425868_004483.count = 4483 :=
  map_count_branch
    mapNode_425868_002241
    mapNode_428109_002242
    2241 2242
    mapNode_425868_002241_count
    mapNode_428109_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_421385_008966_count :
    mapNode_421385_008966.count = 8966 :=
  map_count_branch
    mapNode_421385_004483
    mapNode_425868_004483
    4483 4483
    mapNode_421385_004483_count
    mapNode_425868_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_412419_017932_count :
    mapNode_412419_017932.count = 17932 :=
  map_count_branch
    mapNode_412419_008966
    mapNode_421385_008966
    8966 8966
    mapNode_412419_008966_count
    mapNode_421385_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_394488_035863_count :
    mapNode_394488_035863.count = 35863 :=
  map_count_branch
    mapNode_394488_017931
    mapNode_412419_017932
    17931 17932
    mapNode_394488_017931_count
    mapNode_412419_017932_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_358626_071725_count :
    mapNode_358626_071725.count = 71725 :=
  map_count_branch
    mapNode_358626_035862
    mapNode_394488_035863
    35862 35863
    mapNode_358626_035862_count
    mapNode_394488_035863_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_286901_143450_count :
    mapNode_286901_143450.count = 143450 :=
  map_count_branch
    mapNode_286901_071725
    mapNode_358626_071725
    71725 71725
    mapNode_286901_071725_count
    mapNode_358626_071725_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_430351_count :
    mapChunk_430351.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_430911_count :
    mapChunk_430911.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_430351_001120_count :
    mapNode_430351_001120.count = 1120 :=
  map_count_branch
    mapChunk_430351
    mapChunk_430911
    560 560
    mapChunk_430351_count
    mapChunk_430911_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_431471_count :
    mapChunk_431471.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_432031_count :
    mapChunk_432031.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_431471_001121_count :
    mapNode_431471_001121.count = 1121 :=
  map_count_branch
    mapChunk_431471
    mapChunk_432031
    560 561
    mapChunk_431471_count
    mapChunk_432031_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_430351_002241_count :
    mapNode_430351_002241.count = 2241 :=
  map_count_branch
    mapNode_430351_001120
    mapNode_431471_001121
    1120 1121
    mapNode_430351_001120_count
    mapNode_431471_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_432592_count :
    mapChunk_432592.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_433152_count :
    mapChunk_433152.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_432592_001120_count :
    mapNode_432592_001120.count = 1120 :=
  map_count_branch
    mapChunk_432592
    mapChunk_433152
    560 560
    mapChunk_432592_count
    mapChunk_433152_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_433712_count :
    mapChunk_433712.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_434272_count :
    mapChunk_434272.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_433712_001121_count :
    mapNode_433712_001121.count = 1121 :=
  map_count_branch
    mapChunk_433712
    mapChunk_434272
    560 561
    mapChunk_433712_count
    mapChunk_434272_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_432592_002241_count :
    mapNode_432592_002241.count = 2241 :=
  map_count_branch
    mapNode_432592_001120
    mapNode_433712_001121
    1120 1121
    mapNode_432592_001120_count
    mapNode_433712_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_430351_004482_count :
    mapNode_430351_004482.count = 4482 :=
  map_count_branch
    mapNode_430351_002241
    mapNode_432592_002241
    2241 2241
    mapNode_430351_002241_count
    mapNode_432592_002241_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_434833_count :
    mapChunk_434833.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_435393_count :
    mapChunk_435393.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_434833_001120_count :
    mapNode_434833_001120.count = 1120 :=
  map_count_branch
    mapChunk_434833
    mapChunk_435393
    560 560
    mapChunk_434833_count
    mapChunk_435393_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_435953_count :
    mapChunk_435953.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_436513_count :
    mapChunk_436513.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_435953_001121_count :
    mapNode_435953_001121.count = 1121 :=
  map_count_branch
    mapChunk_435953
    mapChunk_436513
    560 561
    mapChunk_435953_count
    mapChunk_436513_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_434833_002241_count :
    mapNode_434833_002241.count = 2241 :=
  map_count_branch
    mapNode_434833_001120
    mapNode_435953_001121
    1120 1121
    mapNode_434833_001120_count
    mapNode_435953_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_437074_count :
    mapChunk_437074.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_437634_count :
    mapChunk_437634.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_437074_001121_count :
    mapNode_437074_001121.count = 1121 :=
  map_count_branch
    mapChunk_437074
    mapChunk_437634
    560 561
    mapChunk_437074_count
    mapChunk_437634_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_438195_count :
    mapChunk_438195.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_438755_count :
    mapChunk_438755.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_438195_001121_count :
    mapNode_438195_001121.count = 1121 :=
  map_count_branch
    mapChunk_438195
    mapChunk_438755
    560 561
    mapChunk_438195_count
    mapChunk_438755_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_437074_002242_count :
    mapNode_437074_002242.count = 2242 :=
  map_count_branch
    mapNode_437074_001121
    mapNode_438195_001121
    1121 1121
    mapNode_437074_001121_count
    mapNode_438195_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_434833_004483_count :
    mapNode_434833_004483.count = 4483 :=
  map_count_branch
    mapNode_434833_002241
    mapNode_437074_002242
    2241 2242
    mapNode_434833_002241_count
    mapNode_437074_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_430351_008965_count :
    mapNode_430351_008965.count = 8965 :=
  map_count_branch
    mapNode_430351_004482
    mapNode_434833_004483
    4482 4483
    mapNode_430351_004482_count
    mapNode_434833_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_439316_count :
    mapChunk_439316.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_439876_count :
    mapChunk_439876.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_439316_001120_count :
    mapNode_439316_001120.count = 1120 :=
  map_count_branch
    mapChunk_439316
    mapChunk_439876
    560 560
    mapChunk_439316_count
    mapChunk_439876_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_440436_count :
    mapChunk_440436.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_440996_count :
    mapChunk_440996.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_440436_001121_count :
    mapNode_440436_001121.count = 1121 :=
  map_count_branch
    mapChunk_440436
    mapChunk_440996
    560 561
    mapChunk_440436_count
    mapChunk_440996_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_439316_002241_count :
    mapNode_439316_002241.count = 2241 :=
  map_count_branch
    mapNode_439316_001120
    mapNode_440436_001121
    1120 1121
    mapNode_439316_001120_count
    mapNode_440436_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_441557_count :
    mapChunk_441557.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_442117_count :
    mapChunk_442117.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_441557_001121_count :
    mapNode_441557_001121.count = 1121 :=
  map_count_branch
    mapChunk_441557
    mapChunk_442117
    560 561
    mapChunk_441557_count
    mapChunk_442117_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_442678_count :
    mapChunk_442678.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_443238_count :
    mapChunk_443238.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_442678_001121_count :
    mapNode_442678_001121.count = 1121 :=
  map_count_branch
    mapChunk_442678
    mapChunk_443238
    560 561
    mapChunk_442678_count
    mapChunk_443238_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_441557_002242_count :
    mapNode_441557_002242.count = 2242 :=
  map_count_branch
    mapNode_441557_001121
    mapNode_442678_001121
    1121 1121
    mapNode_441557_001121_count
    mapNode_442678_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_439316_004483_count :
    mapNode_439316_004483.count = 4483 :=
  map_count_branch
    mapNode_439316_002241
    mapNode_441557_002242
    2241 2242
    mapNode_439316_002241_count
    mapNode_441557_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_443799_count :
    mapChunk_443799.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_444359_count :
    mapChunk_444359.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_443799_001120_count :
    mapNode_443799_001120.count = 1120 :=
  map_count_branch
    mapChunk_443799
    mapChunk_444359
    560 560
    mapChunk_443799_count
    mapChunk_444359_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_444919_count :
    mapChunk_444919.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_445479_count :
    mapChunk_445479.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_444919_001121_count :
    mapNode_444919_001121.count = 1121 :=
  map_count_branch
    mapChunk_444919
    mapChunk_445479
    560 561
    mapChunk_444919_count
    mapChunk_445479_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_443799_002241_count :
    mapNode_443799_002241.count = 2241 :=
  map_count_branch
    mapNode_443799_001120
    mapNode_444919_001121
    1120 1121
    mapNode_443799_001120_count
    mapNode_444919_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_446040_count :
    mapChunk_446040.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_446600_count :
    mapChunk_446600.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_446040_001121_count :
    mapNode_446040_001121.count = 1121 :=
  map_count_branch
    mapChunk_446040
    mapChunk_446600
    560 561
    mapChunk_446040_count
    mapChunk_446600_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_447161_count :
    mapChunk_447161.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_447721_count :
    mapChunk_447721.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_447161_001121_count :
    mapNode_447161_001121.count = 1121 :=
  map_count_branch
    mapChunk_447161
    mapChunk_447721
    560 561
    mapChunk_447161_count
    mapChunk_447721_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_446040_002242_count :
    mapNode_446040_002242.count = 2242 :=
  map_count_branch
    mapNode_446040_001121
    mapNode_447161_001121
    1121 1121
    mapNode_446040_001121_count
    mapNode_447161_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_443799_004483_count :
    mapNode_443799_004483.count = 4483 :=
  map_count_branch
    mapNode_443799_002241
    mapNode_446040_002242
    2241 2242
    mapNode_443799_002241_count
    mapNode_446040_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_439316_008966_count :
    mapNode_439316_008966.count = 8966 :=
  map_count_branch
    mapNode_439316_004483
    mapNode_443799_004483
    4483 4483
    mapNode_439316_004483_count
    mapNode_443799_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_430351_017931_count :
    mapNode_430351_017931.count = 17931 :=
  map_count_branch
    mapNode_430351_008965
    mapNode_439316_008966
    8965 8966
    mapNode_430351_008965_count
    mapNode_439316_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_448282_count :
    mapChunk_448282.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_448842_count :
    mapChunk_448842.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_448282_001120_count :
    mapNode_448282_001120.count = 1120 :=
  map_count_branch
    mapChunk_448282
    mapChunk_448842
    560 560
    mapChunk_448282_count
    mapChunk_448842_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_449402_count :
    mapChunk_449402.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_449962_count :
    mapChunk_449962.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_449402_001121_count :
    mapNode_449402_001121.count = 1121 :=
  map_count_branch
    mapChunk_449402
    mapChunk_449962
    560 561
    mapChunk_449402_count
    mapChunk_449962_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_448282_002241_count :
    mapNode_448282_002241.count = 2241 :=
  map_count_branch
    mapNode_448282_001120
    mapNode_449402_001121
    1120 1121
    mapNode_448282_001120_count
    mapNode_449402_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_450523_count :
    mapChunk_450523.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_451083_count :
    mapChunk_451083.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_450523_001120_count :
    mapNode_450523_001120.count = 1120 :=
  map_count_branch
    mapChunk_450523
    mapChunk_451083
    560 560
    mapChunk_450523_count
    mapChunk_451083_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_451643_count :
    mapChunk_451643.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_452203_count :
    mapChunk_452203.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_451643_001121_count :
    mapNode_451643_001121.count = 1121 :=
  map_count_branch
    mapChunk_451643
    mapChunk_452203
    560 561
    mapChunk_451643_count
    mapChunk_452203_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_450523_002241_count :
    mapNode_450523_002241.count = 2241 :=
  map_count_branch
    mapNode_450523_001120
    mapNode_451643_001121
    1120 1121
    mapNode_450523_001120_count
    mapNode_451643_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_448282_004482_count :
    mapNode_448282_004482.count = 4482 :=
  map_count_branch
    mapNode_448282_002241
    mapNode_450523_002241
    2241 2241
    mapNode_448282_002241_count
    mapNode_450523_002241_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_452764_count :
    mapChunk_452764.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_453324_count :
    mapChunk_453324.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_452764_001120_count :
    mapNode_452764_001120.count = 1120 :=
  map_count_branch
    mapChunk_452764
    mapChunk_453324
    560 560
    mapChunk_452764_count
    mapChunk_453324_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_453884_count :
    mapChunk_453884.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_454444_count :
    mapChunk_454444.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_453884_001121_count :
    mapNode_453884_001121.count = 1121 :=
  map_count_branch
    mapChunk_453884
    mapChunk_454444
    560 561
    mapChunk_453884_count
    mapChunk_454444_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_452764_002241_count :
    mapNode_452764_002241.count = 2241 :=
  map_count_branch
    mapNode_452764_001120
    mapNode_453884_001121
    1120 1121
    mapNode_452764_001120_count
    mapNode_453884_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_455005_count :
    mapChunk_455005.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_455565_count :
    mapChunk_455565.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_455005_001121_count :
    mapNode_455005_001121.count = 1121 :=
  map_count_branch
    mapChunk_455005
    mapChunk_455565
    560 561
    mapChunk_455005_count
    mapChunk_455565_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_456126_count :
    mapChunk_456126.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_456686_count :
    mapChunk_456686.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_456126_001121_count :
    mapNode_456126_001121.count = 1121 :=
  map_count_branch
    mapChunk_456126
    mapChunk_456686
    560 561
    mapChunk_456126_count
    mapChunk_456686_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_455005_002242_count :
    mapNode_455005_002242.count = 2242 :=
  map_count_branch
    mapNode_455005_001121
    mapNode_456126_001121
    1121 1121
    mapNode_455005_001121_count
    mapNode_456126_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_452764_004483_count :
    mapNode_452764_004483.count = 4483 :=
  map_count_branch
    mapNode_452764_002241
    mapNode_455005_002242
    2241 2242
    mapNode_452764_002241_count
    mapNode_455005_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_448282_008965_count :
    mapNode_448282_008965.count = 8965 :=
  map_count_branch
    mapNode_448282_004482
    mapNode_452764_004483
    4482 4483
    mapNode_448282_004482_count
    mapNode_452764_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_457247_count :
    mapChunk_457247.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_457807_count :
    mapChunk_457807.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_457247_001120_count :
    mapNode_457247_001120.count = 1120 :=
  map_count_branch
    mapChunk_457247
    mapChunk_457807
    560 560
    mapChunk_457247_count
    mapChunk_457807_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_458367_count :
    mapChunk_458367.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_458927_count :
    mapChunk_458927.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_458367_001121_count :
    mapNode_458367_001121.count = 1121 :=
  map_count_branch
    mapChunk_458367
    mapChunk_458927
    560 561
    mapChunk_458367_count
    mapChunk_458927_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_457247_002241_count :
    mapNode_457247_002241.count = 2241 :=
  map_count_branch
    mapNode_457247_001120
    mapNode_458367_001121
    1120 1121
    mapNode_457247_001120_count
    mapNode_458367_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_459488_count :
    mapChunk_459488.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_460048_count :
    mapChunk_460048.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_459488_001121_count :
    mapNode_459488_001121.count = 1121 :=
  map_count_branch
    mapChunk_459488
    mapChunk_460048
    560 561
    mapChunk_459488_count
    mapChunk_460048_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_460609_count :
    mapChunk_460609.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_461169_count :
    mapChunk_461169.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_460609_001121_count :
    mapNode_460609_001121.count = 1121 :=
  map_count_branch
    mapChunk_460609
    mapChunk_461169
    560 561
    mapChunk_460609_count
    mapChunk_461169_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_459488_002242_count :
    mapNode_459488_002242.count = 2242 :=
  map_count_branch
    mapNode_459488_001121
    mapNode_460609_001121
    1121 1121
    mapNode_459488_001121_count
    mapNode_460609_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_457247_004483_count :
    mapNode_457247_004483.count = 4483 :=
  map_count_branch
    mapNode_457247_002241
    mapNode_459488_002242
    2241 2242
    mapNode_457247_002241_count
    mapNode_459488_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_461730_count :
    mapChunk_461730.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_462290_count :
    mapChunk_462290.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_461730_001120_count :
    mapNode_461730_001120.count = 1120 :=
  map_count_branch
    mapChunk_461730
    mapChunk_462290
    560 560
    mapChunk_461730_count
    mapChunk_462290_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_462850_count :
    mapChunk_462850.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_463410_count :
    mapChunk_463410.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_462850_001121_count :
    mapNode_462850_001121.count = 1121 :=
  map_count_branch
    mapChunk_462850
    mapChunk_463410
    560 561
    mapChunk_462850_count
    mapChunk_463410_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_461730_002241_count :
    mapNode_461730_002241.count = 2241 :=
  map_count_branch
    mapNode_461730_001120
    mapNode_462850_001121
    1120 1121
    mapNode_461730_001120_count
    mapNode_462850_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_463971_count :
    mapChunk_463971.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_464531_count :
    mapChunk_464531.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_463971_001121_count :
    mapNode_463971_001121.count = 1121 :=
  map_count_branch
    mapChunk_463971
    mapChunk_464531
    560 561
    mapChunk_463971_count
    mapChunk_464531_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_465092_count :
    mapChunk_465092.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_465652_count :
    mapChunk_465652.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_465092_001121_count :
    mapNode_465092_001121.count = 1121 :=
  map_count_branch
    mapChunk_465092
    mapChunk_465652
    560 561
    mapChunk_465092_count
    mapChunk_465652_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_463971_002242_count :
    mapNode_463971_002242.count = 2242 :=
  map_count_branch
    mapNode_463971_001121
    mapNode_465092_001121
    1121 1121
    mapNode_463971_001121_count
    mapNode_465092_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_461730_004483_count :
    mapNode_461730_004483.count = 4483 :=
  map_count_branch
    mapNode_461730_002241
    mapNode_463971_002242
    2241 2242
    mapNode_461730_002241_count
    mapNode_463971_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_457247_008966_count :
    mapNode_457247_008966.count = 8966 :=
  map_count_branch
    mapNode_457247_004483
    mapNode_461730_004483
    4483 4483
    mapNode_457247_004483_count
    mapNode_461730_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_448282_017931_count :
    mapNode_448282_017931.count = 17931 :=
  map_count_branch
    mapNode_448282_008965
    mapNode_457247_008966
    8965 8966
    mapNode_448282_008965_count
    mapNode_457247_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_430351_035862_count :
    mapNode_430351_035862.count = 35862 :=
  map_count_branch
    mapNode_430351_017931
    mapNode_448282_017931
    17931 17931
    mapNode_430351_017931_count
    mapNode_448282_017931_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_466213_count :
    mapChunk_466213.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_466773_count :
    mapChunk_466773.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_466213_001120_count :
    mapNode_466213_001120.count = 1120 :=
  map_count_branch
    mapChunk_466213
    mapChunk_466773
    560 560
    mapChunk_466213_count
    mapChunk_466773_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_467333_count :
    mapChunk_467333.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_467893_count :
    mapChunk_467893.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_467333_001121_count :
    mapNode_467333_001121.count = 1121 :=
  map_count_branch
    mapChunk_467333
    mapChunk_467893
    560 561
    mapChunk_467333_count
    mapChunk_467893_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_466213_002241_count :
    mapNode_466213_002241.count = 2241 :=
  map_count_branch
    mapNode_466213_001120
    mapNode_467333_001121
    1120 1121
    mapNode_466213_001120_count
    mapNode_467333_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_468454_count :
    mapChunk_468454.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_469014_count :
    mapChunk_469014.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_468454_001120_count :
    mapNode_468454_001120.count = 1120 :=
  map_count_branch
    mapChunk_468454
    mapChunk_469014
    560 560
    mapChunk_468454_count
    mapChunk_469014_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_469574_count :
    mapChunk_469574.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_470134_count :
    mapChunk_470134.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_469574_001121_count :
    mapNode_469574_001121.count = 1121 :=
  map_count_branch
    mapChunk_469574
    mapChunk_470134
    560 561
    mapChunk_469574_count
    mapChunk_470134_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_468454_002241_count :
    mapNode_468454_002241.count = 2241 :=
  map_count_branch
    mapNode_468454_001120
    mapNode_469574_001121
    1120 1121
    mapNode_468454_001120_count
    mapNode_469574_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_466213_004482_count :
    mapNode_466213_004482.count = 4482 :=
  map_count_branch
    mapNode_466213_002241
    mapNode_468454_002241
    2241 2241
    mapNode_466213_002241_count
    mapNode_468454_002241_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_470695_count :
    mapChunk_470695.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_471255_count :
    mapChunk_471255.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_470695_001120_count :
    mapNode_470695_001120.count = 1120 :=
  map_count_branch
    mapChunk_470695
    mapChunk_471255
    560 560
    mapChunk_470695_count
    mapChunk_471255_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_471815_count :
    mapChunk_471815.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_472375_count :
    mapChunk_472375.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_471815_001121_count :
    mapNode_471815_001121.count = 1121 :=
  map_count_branch
    mapChunk_471815
    mapChunk_472375
    560 561
    mapChunk_471815_count
    mapChunk_472375_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_470695_002241_count :
    mapNode_470695_002241.count = 2241 :=
  map_count_branch
    mapNode_470695_001120
    mapNode_471815_001121
    1120 1121
    mapNode_470695_001120_count
    mapNode_471815_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_472936_count :
    mapChunk_472936.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_473496_count :
    mapChunk_473496.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_472936_001121_count :
    mapNode_472936_001121.count = 1121 :=
  map_count_branch
    mapChunk_472936
    mapChunk_473496
    560 561
    mapChunk_472936_count
    mapChunk_473496_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_474057_count :
    mapChunk_474057.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_474617_count :
    mapChunk_474617.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_474057_001121_count :
    mapNode_474057_001121.count = 1121 :=
  map_count_branch
    mapChunk_474057
    mapChunk_474617
    560 561
    mapChunk_474057_count
    mapChunk_474617_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_472936_002242_count :
    mapNode_472936_002242.count = 2242 :=
  map_count_branch
    mapNode_472936_001121
    mapNode_474057_001121
    1121 1121
    mapNode_472936_001121_count
    mapNode_474057_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_470695_004483_count :
    mapNode_470695_004483.count = 4483 :=
  map_count_branch
    mapNode_470695_002241
    mapNode_472936_002242
    2241 2242
    mapNode_470695_002241_count
    mapNode_472936_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_466213_008965_count :
    mapNode_466213_008965.count = 8965 :=
  map_count_branch
    mapNode_466213_004482
    mapNode_470695_004483
    4482 4483
    mapNode_466213_004482_count
    mapNode_470695_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_475178_count :
    mapChunk_475178.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_475738_count :
    mapChunk_475738.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_475178_001120_count :
    mapNode_475178_001120.count = 1120 :=
  map_count_branch
    mapChunk_475178
    mapChunk_475738
    560 560
    mapChunk_475178_count
    mapChunk_475738_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_476298_count :
    mapChunk_476298.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_476858_count :
    mapChunk_476858.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_476298_001121_count :
    mapNode_476298_001121.count = 1121 :=
  map_count_branch
    mapChunk_476298
    mapChunk_476858
    560 561
    mapChunk_476298_count
    mapChunk_476858_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_475178_002241_count :
    mapNode_475178_002241.count = 2241 :=
  map_count_branch
    mapNode_475178_001120
    mapNode_476298_001121
    1120 1121
    mapNode_475178_001120_count
    mapNode_476298_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_477419_count :
    mapChunk_477419.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_477979_count :
    mapChunk_477979.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_477419_001121_count :
    mapNode_477419_001121.count = 1121 :=
  map_count_branch
    mapChunk_477419
    mapChunk_477979
    560 561
    mapChunk_477419_count
    mapChunk_477979_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_478540_count :
    mapChunk_478540.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_479100_count :
    mapChunk_479100.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_478540_001121_count :
    mapNode_478540_001121.count = 1121 :=
  map_count_branch
    mapChunk_478540
    mapChunk_479100
    560 561
    mapChunk_478540_count
    mapChunk_479100_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_477419_002242_count :
    mapNode_477419_002242.count = 2242 :=
  map_count_branch
    mapNode_477419_001121
    mapNode_478540_001121
    1121 1121
    mapNode_477419_001121_count
    mapNode_478540_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_475178_004483_count :
    mapNode_475178_004483.count = 4483 :=
  map_count_branch
    mapNode_475178_002241
    mapNode_477419_002242
    2241 2242
    mapNode_475178_002241_count
    mapNode_477419_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_479661_count :
    mapChunk_479661.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_480221_count :
    mapChunk_480221.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_479661_001120_count :
    mapNode_479661_001120.count = 1120 :=
  map_count_branch
    mapChunk_479661
    mapChunk_480221
    560 560
    mapChunk_479661_count
    mapChunk_480221_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_480781_count :
    mapChunk_480781.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_481341_count :
    mapChunk_481341.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_480781_001121_count :
    mapNode_480781_001121.count = 1121 :=
  map_count_branch
    mapChunk_480781
    mapChunk_481341
    560 561
    mapChunk_480781_count
    mapChunk_481341_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_479661_002241_count :
    mapNode_479661_002241.count = 2241 :=
  map_count_branch
    mapNode_479661_001120
    mapNode_480781_001121
    1120 1121
    mapNode_479661_001120_count
    mapNode_480781_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_481902_count :
    mapChunk_481902.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_482462_count :
    mapChunk_482462.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_481902_001121_count :
    mapNode_481902_001121.count = 1121 :=
  map_count_branch
    mapChunk_481902
    mapChunk_482462
    560 561
    mapChunk_481902_count
    mapChunk_482462_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_483023_count :
    mapChunk_483023.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_483583_count :
    mapChunk_483583.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_483023_001121_count :
    mapNode_483023_001121.count = 1121 :=
  map_count_branch
    mapChunk_483023
    mapChunk_483583
    560 561
    mapChunk_483023_count
    mapChunk_483583_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_481902_002242_count :
    mapNode_481902_002242.count = 2242 :=
  map_count_branch
    mapNode_481902_001121
    mapNode_483023_001121
    1121 1121
    mapNode_481902_001121_count
    mapNode_483023_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_479661_004483_count :
    mapNode_479661_004483.count = 4483 :=
  map_count_branch
    mapNode_479661_002241
    mapNode_481902_002242
    2241 2242
    mapNode_479661_002241_count
    mapNode_481902_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_475178_008966_count :
    mapNode_475178_008966.count = 8966 :=
  map_count_branch
    mapNode_475178_004483
    mapNode_479661_004483
    4483 4483
    mapNode_475178_004483_count
    mapNode_479661_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_466213_017931_count :
    mapNode_466213_017931.count = 17931 :=
  map_count_branch
    mapNode_466213_008965
    mapNode_475178_008966
    8965 8966
    mapNode_466213_008965_count
    mapNode_475178_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_484144_count :
    mapChunk_484144.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_484704_count :
    mapChunk_484704.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_484144_001120_count :
    mapNode_484144_001120.count = 1120 :=
  map_count_branch
    mapChunk_484144
    mapChunk_484704
    560 560
    mapChunk_484144_count
    mapChunk_484704_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_485264_count :
    mapChunk_485264.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_485824_count :
    mapChunk_485824.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_485264_001121_count :
    mapNode_485264_001121.count = 1121 :=
  map_count_branch
    mapChunk_485264
    mapChunk_485824
    560 561
    mapChunk_485264_count
    mapChunk_485824_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_484144_002241_count :
    mapNode_484144_002241.count = 2241 :=
  map_count_branch
    mapNode_484144_001120
    mapNode_485264_001121
    1120 1121
    mapNode_484144_001120_count
    mapNode_485264_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_486385_count :
    mapChunk_486385.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_486945_count :
    mapChunk_486945.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_486385_001121_count :
    mapNode_486385_001121.count = 1121 :=
  map_count_branch
    mapChunk_486385
    mapChunk_486945
    560 561
    mapChunk_486385_count
    mapChunk_486945_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_487506_count :
    mapChunk_487506.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_488066_count :
    mapChunk_488066.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_487506_001121_count :
    mapNode_487506_001121.count = 1121 :=
  map_count_branch
    mapChunk_487506
    mapChunk_488066
    560 561
    mapChunk_487506_count
    mapChunk_488066_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_486385_002242_count :
    mapNode_486385_002242.count = 2242 :=
  map_count_branch
    mapNode_486385_001121
    mapNode_487506_001121
    1121 1121
    mapNode_486385_001121_count
    mapNode_487506_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_484144_004483_count :
    mapNode_484144_004483.count = 4483 :=
  map_count_branch
    mapNode_484144_002241
    mapNode_486385_002242
    2241 2242
    mapNode_484144_002241_count
    mapNode_486385_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_488627_count :
    mapChunk_488627.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_489187_count :
    mapChunk_489187.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_488627_001120_count :
    mapNode_488627_001120.count = 1120 :=
  map_count_branch
    mapChunk_488627
    mapChunk_489187
    560 560
    mapChunk_488627_count
    mapChunk_489187_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_489747_count :
    mapChunk_489747.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_490307_count :
    mapChunk_490307.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_489747_001121_count :
    mapNode_489747_001121.count = 1121 :=
  map_count_branch
    mapChunk_489747
    mapChunk_490307
    560 561
    mapChunk_489747_count
    mapChunk_490307_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_488627_002241_count :
    mapNode_488627_002241.count = 2241 :=
  map_count_branch
    mapNode_488627_001120
    mapNode_489747_001121
    1120 1121
    mapNode_488627_001120_count
    mapNode_489747_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_490868_count :
    mapChunk_490868.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_491428_count :
    mapChunk_491428.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_490868_001121_count :
    mapNode_490868_001121.count = 1121 :=
  map_count_branch
    mapChunk_490868
    mapChunk_491428
    560 561
    mapChunk_490868_count
    mapChunk_491428_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_491989_count :
    mapChunk_491989.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_492549_count :
    mapChunk_492549.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_491989_001121_count :
    mapNode_491989_001121.count = 1121 :=
  map_count_branch
    mapChunk_491989
    mapChunk_492549
    560 561
    mapChunk_491989_count
    mapChunk_492549_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_490868_002242_count :
    mapNode_490868_002242.count = 2242 :=
  map_count_branch
    mapNode_490868_001121
    mapNode_491989_001121
    1121 1121
    mapNode_490868_001121_count
    mapNode_491989_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_488627_004483_count :
    mapNode_488627_004483.count = 4483 :=
  map_count_branch
    mapNode_488627_002241
    mapNode_490868_002242
    2241 2242
    mapNode_488627_002241_count
    mapNode_490868_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_484144_008966_count :
    mapNode_484144_008966.count = 8966 :=
  map_count_branch
    mapNode_484144_004483
    mapNode_488627_004483
    4483 4483
    mapNode_484144_004483_count
    mapNode_488627_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_493110_count :
    mapChunk_493110.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_493670_count :
    mapChunk_493670.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_493110_001120_count :
    mapNode_493110_001120.count = 1120 :=
  map_count_branch
    mapChunk_493110
    mapChunk_493670
    560 560
    mapChunk_493110_count
    mapChunk_493670_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_494230_count :
    mapChunk_494230.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_494790_count :
    mapChunk_494790.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_494230_001121_count :
    mapNode_494230_001121.count = 1121 :=
  map_count_branch
    mapChunk_494230
    mapChunk_494790
    560 561
    mapChunk_494230_count
    mapChunk_494790_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_493110_002241_count :
    mapNode_493110_002241.count = 2241 :=
  map_count_branch
    mapNode_493110_001120
    mapNode_494230_001121
    1120 1121
    mapNode_493110_001120_count
    mapNode_494230_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_495351_count :
    mapChunk_495351.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_495911_count :
    mapChunk_495911.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_495351_001121_count :
    mapNode_495351_001121.count = 1121 :=
  map_count_branch
    mapChunk_495351
    mapChunk_495911
    560 561
    mapChunk_495351_count
    mapChunk_495911_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_496472_count :
    mapChunk_496472.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_497032_count :
    mapChunk_497032.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_496472_001121_count :
    mapNode_496472_001121.count = 1121 :=
  map_count_branch
    mapChunk_496472
    mapChunk_497032
    560 561
    mapChunk_496472_count
    mapChunk_497032_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_495351_002242_count :
    mapNode_495351_002242.count = 2242 :=
  map_count_branch
    mapNode_495351_001121
    mapNode_496472_001121
    1121 1121
    mapNode_495351_001121_count
    mapNode_496472_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_493110_004483_count :
    mapNode_493110_004483.count = 4483 :=
  map_count_branch
    mapNode_493110_002241
    mapNode_495351_002242
    2241 2242
    mapNode_493110_002241_count
    mapNode_495351_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_497593_count :
    mapChunk_497593.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_498153_count :
    mapChunk_498153.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_497593_001120_count :
    mapNode_497593_001120.count = 1120 :=
  map_count_branch
    mapChunk_497593
    mapChunk_498153
    560 560
    mapChunk_497593_count
    mapChunk_498153_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_498713_count :
    mapChunk_498713.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_499273_count :
    mapChunk_499273.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_498713_001121_count :
    mapNode_498713_001121.count = 1121 :=
  map_count_branch
    mapChunk_498713
    mapChunk_499273
    560 561
    mapChunk_498713_count
    mapChunk_499273_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_497593_002241_count :
    mapNode_497593_002241.count = 2241 :=
  map_count_branch
    mapNode_497593_001120
    mapNode_498713_001121
    1120 1121
    mapNode_497593_001120_count
    mapNode_498713_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_499834_count :
    mapChunk_499834.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_500394_count :
    mapChunk_500394.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_499834_001121_count :
    mapNode_499834_001121.count = 1121 :=
  map_count_branch
    mapChunk_499834
    mapChunk_500394
    560 561
    mapChunk_499834_count
    mapChunk_500394_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_500955_count :
    mapChunk_500955.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_501515_count :
    mapChunk_501515.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_500955_001121_count :
    mapNode_500955_001121.count = 1121 :=
  map_count_branch
    mapChunk_500955
    mapChunk_501515
    560 561
    mapChunk_500955_count
    mapChunk_501515_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_499834_002242_count :
    mapNode_499834_002242.count = 2242 :=
  map_count_branch
    mapNode_499834_001121
    mapNode_500955_001121
    1121 1121
    mapNode_499834_001121_count
    mapNode_500955_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_497593_004483_count :
    mapNode_497593_004483.count = 4483 :=
  map_count_branch
    mapNode_497593_002241
    mapNode_499834_002242
    2241 2242
    mapNode_497593_002241_count
    mapNode_499834_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_493110_008966_count :
    mapNode_493110_008966.count = 8966 :=
  map_count_branch
    mapNode_493110_004483
    mapNode_497593_004483
    4483 4483
    mapNode_493110_004483_count
    mapNode_497593_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_484144_017932_count :
    mapNode_484144_017932.count = 17932 :=
  map_count_branch
    mapNode_484144_008966
    mapNode_493110_008966
    8966 8966
    mapNode_484144_008966_count
    mapNode_493110_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_466213_035863_count :
    mapNode_466213_035863.count = 35863 :=
  map_count_branch
    mapNode_466213_017931
    mapNode_484144_017932
    17931 17932
    mapNode_466213_017931_count
    mapNode_484144_017932_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_430351_071725_count :
    mapNode_430351_071725.count = 71725 :=
  map_count_branch
    mapNode_430351_035862
    mapNode_466213_035863
    35862 35863
    mapNode_430351_035862_count
    mapNode_466213_035863_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_502076_count :
    mapChunk_502076.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_502636_count :
    mapChunk_502636.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_502076_001120_count :
    mapNode_502076_001120.count = 1120 :=
  map_count_branch
    mapChunk_502076
    mapChunk_502636
    560 560
    mapChunk_502076_count
    mapChunk_502636_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_503196_count :
    mapChunk_503196.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_503756_count :
    mapChunk_503756.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_503196_001121_count :
    mapNode_503196_001121.count = 1121 :=
  map_count_branch
    mapChunk_503196
    mapChunk_503756
    560 561
    mapChunk_503196_count
    mapChunk_503756_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_502076_002241_count :
    mapNode_502076_002241.count = 2241 :=
  map_count_branch
    mapNode_502076_001120
    mapNode_503196_001121
    1120 1121
    mapNode_502076_001120_count
    mapNode_503196_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_504317_count :
    mapChunk_504317.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_504877_count :
    mapChunk_504877.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_504317_001120_count :
    mapNode_504317_001120.count = 1120 :=
  map_count_branch
    mapChunk_504317
    mapChunk_504877
    560 560
    mapChunk_504317_count
    mapChunk_504877_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_505437_count :
    mapChunk_505437.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_505997_count :
    mapChunk_505997.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_505437_001121_count :
    mapNode_505437_001121.count = 1121 :=
  map_count_branch
    mapChunk_505437
    mapChunk_505997
    560 561
    mapChunk_505437_count
    mapChunk_505997_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_504317_002241_count :
    mapNode_504317_002241.count = 2241 :=
  map_count_branch
    mapNode_504317_001120
    mapNode_505437_001121
    1120 1121
    mapNode_504317_001120_count
    mapNode_505437_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_502076_004482_count :
    mapNode_502076_004482.count = 4482 :=
  map_count_branch
    mapNode_502076_002241
    mapNode_504317_002241
    2241 2241
    mapNode_502076_002241_count
    mapNode_504317_002241_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_506558_count :
    mapChunk_506558.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_507118_count :
    mapChunk_507118.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_506558_001120_count :
    mapNode_506558_001120.count = 1120 :=
  map_count_branch
    mapChunk_506558
    mapChunk_507118
    560 560
    mapChunk_506558_count
    mapChunk_507118_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_507678_count :
    mapChunk_507678.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_508238_count :
    mapChunk_508238.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_507678_001121_count :
    mapNode_507678_001121.count = 1121 :=
  map_count_branch
    mapChunk_507678
    mapChunk_508238
    560 561
    mapChunk_507678_count
    mapChunk_508238_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_506558_002241_count :
    mapNode_506558_002241.count = 2241 :=
  map_count_branch
    mapNode_506558_001120
    mapNode_507678_001121
    1120 1121
    mapNode_506558_001120_count
    mapNode_507678_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_508799_count :
    mapChunk_508799.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_509359_count :
    mapChunk_509359.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_508799_001121_count :
    mapNode_508799_001121.count = 1121 :=
  map_count_branch
    mapChunk_508799
    mapChunk_509359
    560 561
    mapChunk_508799_count
    mapChunk_509359_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_509920_count :
    mapChunk_509920.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_510480_count :
    mapChunk_510480.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_509920_001121_count :
    mapNode_509920_001121.count = 1121 :=
  map_count_branch
    mapChunk_509920
    mapChunk_510480
    560 561
    mapChunk_509920_count
    mapChunk_510480_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_508799_002242_count :
    mapNode_508799_002242.count = 2242 :=
  map_count_branch
    mapNode_508799_001121
    mapNode_509920_001121
    1121 1121
    mapNode_508799_001121_count
    mapNode_509920_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_506558_004483_count :
    mapNode_506558_004483.count = 4483 :=
  map_count_branch
    mapNode_506558_002241
    mapNode_508799_002242
    2241 2242
    mapNode_506558_002241_count
    mapNode_508799_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_502076_008965_count :
    mapNode_502076_008965.count = 8965 :=
  map_count_branch
    mapNode_502076_004482
    mapNode_506558_004483
    4482 4483
    mapNode_502076_004482_count
    mapNode_506558_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_511041_count :
    mapChunk_511041.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_511601_count :
    mapChunk_511601.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_511041_001120_count :
    mapNode_511041_001120.count = 1120 :=
  map_count_branch
    mapChunk_511041
    mapChunk_511601
    560 560
    mapChunk_511041_count
    mapChunk_511601_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_512161_count :
    mapChunk_512161.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_512721_count :
    mapChunk_512721.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_512161_001121_count :
    mapNode_512161_001121.count = 1121 :=
  map_count_branch
    mapChunk_512161
    mapChunk_512721
    560 561
    mapChunk_512161_count
    mapChunk_512721_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_511041_002241_count :
    mapNode_511041_002241.count = 2241 :=
  map_count_branch
    mapNode_511041_001120
    mapNode_512161_001121
    1120 1121
    mapNode_511041_001120_count
    mapNode_512161_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_513282_count :
    mapChunk_513282.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_513842_count :
    mapChunk_513842.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_513282_001121_count :
    mapNode_513282_001121.count = 1121 :=
  map_count_branch
    mapChunk_513282
    mapChunk_513842
    560 561
    mapChunk_513282_count
    mapChunk_513842_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_514403_count :
    mapChunk_514403.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_514963_count :
    mapChunk_514963.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_514403_001121_count :
    mapNode_514403_001121.count = 1121 :=
  map_count_branch
    mapChunk_514403
    mapChunk_514963
    560 561
    mapChunk_514403_count
    mapChunk_514963_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_513282_002242_count :
    mapNode_513282_002242.count = 2242 :=
  map_count_branch
    mapNode_513282_001121
    mapNode_514403_001121
    1121 1121
    mapNode_513282_001121_count
    mapNode_514403_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_511041_004483_count :
    mapNode_511041_004483.count = 4483 :=
  map_count_branch
    mapNode_511041_002241
    mapNode_513282_002242
    2241 2242
    mapNode_511041_002241_count
    mapNode_513282_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_515524_count :
    mapChunk_515524.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_516084_count :
    mapChunk_516084.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_515524_001120_count :
    mapNode_515524_001120.count = 1120 :=
  map_count_branch
    mapChunk_515524
    mapChunk_516084
    560 560
    mapChunk_515524_count
    mapChunk_516084_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_516644_count :
    mapChunk_516644.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_517204_count :
    mapChunk_517204.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_516644_001121_count :
    mapNode_516644_001121.count = 1121 :=
  map_count_branch
    mapChunk_516644
    mapChunk_517204
    560 561
    mapChunk_516644_count
    mapChunk_517204_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_515524_002241_count :
    mapNode_515524_002241.count = 2241 :=
  map_count_branch
    mapNode_515524_001120
    mapNode_516644_001121
    1120 1121
    mapNode_515524_001120_count
    mapNode_516644_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_517765_count :
    mapChunk_517765.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_518325_count :
    mapChunk_518325.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_517765_001121_count :
    mapNode_517765_001121.count = 1121 :=
  map_count_branch
    mapChunk_517765
    mapChunk_518325
    560 561
    mapChunk_517765_count
    mapChunk_518325_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_518886_count :
    mapChunk_518886.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_519446_count :
    mapChunk_519446.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_518886_001121_count :
    mapNode_518886_001121.count = 1121 :=
  map_count_branch
    mapChunk_518886
    mapChunk_519446
    560 561
    mapChunk_518886_count
    mapChunk_519446_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_517765_002242_count :
    mapNode_517765_002242.count = 2242 :=
  map_count_branch
    mapNode_517765_001121
    mapNode_518886_001121
    1121 1121
    mapNode_517765_001121_count
    mapNode_518886_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_515524_004483_count :
    mapNode_515524_004483.count = 4483 :=
  map_count_branch
    mapNode_515524_002241
    mapNode_517765_002242
    2241 2242
    mapNode_515524_002241_count
    mapNode_517765_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_511041_008966_count :
    mapNode_511041_008966.count = 8966 :=
  map_count_branch
    mapNode_511041_004483
    mapNode_515524_004483
    4483 4483
    mapNode_511041_004483_count
    mapNode_515524_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_502076_017931_count :
    mapNode_502076_017931.count = 17931 :=
  map_count_branch
    mapNode_502076_008965
    mapNode_511041_008966
    8965 8966
    mapNode_502076_008965_count
    mapNode_511041_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_520007_count :
    mapChunk_520007.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_520567_count :
    mapChunk_520567.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_520007_001120_count :
    mapNode_520007_001120.count = 1120 :=
  map_count_branch
    mapChunk_520007
    mapChunk_520567
    560 560
    mapChunk_520007_count
    mapChunk_520567_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_521127_count :
    mapChunk_521127.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_521687_count :
    mapChunk_521687.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_521127_001121_count :
    mapNode_521127_001121.count = 1121 :=
  map_count_branch
    mapChunk_521127
    mapChunk_521687
    560 561
    mapChunk_521127_count
    mapChunk_521687_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_520007_002241_count :
    mapNode_520007_002241.count = 2241 :=
  map_count_branch
    mapNode_520007_001120
    mapNode_521127_001121
    1120 1121
    mapNode_520007_001120_count
    mapNode_521127_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_522248_count :
    mapChunk_522248.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_522808_count :
    mapChunk_522808.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_522248_001121_count :
    mapNode_522248_001121.count = 1121 :=
  map_count_branch
    mapChunk_522248
    mapChunk_522808
    560 561
    mapChunk_522248_count
    mapChunk_522808_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_523369_count :
    mapChunk_523369.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_523929_count :
    mapChunk_523929.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_523369_001121_count :
    mapNode_523369_001121.count = 1121 :=
  map_count_branch
    mapChunk_523369
    mapChunk_523929
    560 561
    mapChunk_523369_count
    mapChunk_523929_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_522248_002242_count :
    mapNode_522248_002242.count = 2242 :=
  map_count_branch
    mapNode_522248_001121
    mapNode_523369_001121
    1121 1121
    mapNode_522248_001121_count
    mapNode_523369_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_520007_004483_count :
    mapNode_520007_004483.count = 4483 :=
  map_count_branch
    mapNode_520007_002241
    mapNode_522248_002242
    2241 2242
    mapNode_520007_002241_count
    mapNode_522248_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_524490_count :
    mapChunk_524490.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_525050_count :
    mapChunk_525050.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_524490_001120_count :
    mapNode_524490_001120.count = 1120 :=
  map_count_branch
    mapChunk_524490
    mapChunk_525050
    560 560
    mapChunk_524490_count
    mapChunk_525050_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_525610_count :
    mapChunk_525610.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_526170_count :
    mapChunk_526170.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_525610_001121_count :
    mapNode_525610_001121.count = 1121 :=
  map_count_branch
    mapChunk_525610
    mapChunk_526170
    560 561
    mapChunk_525610_count
    mapChunk_526170_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_524490_002241_count :
    mapNode_524490_002241.count = 2241 :=
  map_count_branch
    mapNode_524490_001120
    mapNode_525610_001121
    1120 1121
    mapNode_524490_001120_count
    mapNode_525610_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_526731_count :
    mapChunk_526731.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_527291_count :
    mapChunk_527291.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_526731_001121_count :
    mapNode_526731_001121.count = 1121 :=
  map_count_branch
    mapChunk_526731
    mapChunk_527291
    560 561
    mapChunk_526731_count
    mapChunk_527291_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_527852_count :
    mapChunk_527852.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_528412_count :
    mapChunk_528412.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_527852_001121_count :
    mapNode_527852_001121.count = 1121 :=
  map_count_branch
    mapChunk_527852
    mapChunk_528412
    560 561
    mapChunk_527852_count
    mapChunk_528412_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_526731_002242_count :
    mapNode_526731_002242.count = 2242 :=
  map_count_branch
    mapNode_526731_001121
    mapNode_527852_001121
    1121 1121
    mapNode_526731_001121_count
    mapNode_527852_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_524490_004483_count :
    mapNode_524490_004483.count = 4483 :=
  map_count_branch
    mapNode_524490_002241
    mapNode_526731_002242
    2241 2242
    mapNode_524490_002241_count
    mapNode_526731_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_520007_008966_count :
    mapNode_520007_008966.count = 8966 :=
  map_count_branch
    mapNode_520007_004483
    mapNode_524490_004483
    4483 4483
    mapNode_520007_004483_count
    mapNode_524490_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_528973_count :
    mapChunk_528973.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_529533_count :
    mapChunk_529533.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_528973_001120_count :
    mapNode_528973_001120.count = 1120 :=
  map_count_branch
    mapChunk_528973
    mapChunk_529533
    560 560
    mapChunk_528973_count
    mapChunk_529533_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_530093_count :
    mapChunk_530093.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_530653_count :
    mapChunk_530653.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_530093_001121_count :
    mapNode_530093_001121.count = 1121 :=
  map_count_branch
    mapChunk_530093
    mapChunk_530653
    560 561
    mapChunk_530093_count
    mapChunk_530653_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_528973_002241_count :
    mapNode_528973_002241.count = 2241 :=
  map_count_branch
    mapNode_528973_001120
    mapNode_530093_001121
    1120 1121
    mapNode_528973_001120_count
    mapNode_530093_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_531214_count :
    mapChunk_531214.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_531774_count :
    mapChunk_531774.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_531214_001121_count :
    mapNode_531214_001121.count = 1121 :=
  map_count_branch
    mapChunk_531214
    mapChunk_531774
    560 561
    mapChunk_531214_count
    mapChunk_531774_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_532335_count :
    mapChunk_532335.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_532895_count :
    mapChunk_532895.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_532335_001121_count :
    mapNode_532335_001121.count = 1121 :=
  map_count_branch
    mapChunk_532335
    mapChunk_532895
    560 561
    mapChunk_532335_count
    mapChunk_532895_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_531214_002242_count :
    mapNode_531214_002242.count = 2242 :=
  map_count_branch
    mapNode_531214_001121
    mapNode_532335_001121
    1121 1121
    mapNode_531214_001121_count
    mapNode_532335_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_528973_004483_count :
    mapNode_528973_004483.count = 4483 :=
  map_count_branch
    mapNode_528973_002241
    mapNode_531214_002242
    2241 2242
    mapNode_528973_002241_count
    mapNode_531214_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_533456_count :
    mapChunk_533456.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_534016_count :
    mapChunk_534016.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_533456_001120_count :
    mapNode_533456_001120.count = 1120 :=
  map_count_branch
    mapChunk_533456
    mapChunk_534016
    560 560
    mapChunk_533456_count
    mapChunk_534016_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_534576_count :
    mapChunk_534576.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_535136_count :
    mapChunk_535136.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_534576_001121_count :
    mapNode_534576_001121.count = 1121 :=
  map_count_branch
    mapChunk_534576
    mapChunk_535136
    560 561
    mapChunk_534576_count
    mapChunk_535136_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_533456_002241_count :
    mapNode_533456_002241.count = 2241 :=
  map_count_branch
    mapNode_533456_001120
    mapNode_534576_001121
    1120 1121
    mapNode_533456_001120_count
    mapNode_534576_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_535697_count :
    mapChunk_535697.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_536257_count :
    mapChunk_536257.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_535697_001121_count :
    mapNode_535697_001121.count = 1121 :=
  map_count_branch
    mapChunk_535697
    mapChunk_536257
    560 561
    mapChunk_535697_count
    mapChunk_536257_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_536818_count :
    mapChunk_536818.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_537378_count :
    mapChunk_537378.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_536818_001121_count :
    mapNode_536818_001121.count = 1121 :=
  map_count_branch
    mapChunk_536818
    mapChunk_537378
    560 561
    mapChunk_536818_count
    mapChunk_537378_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_535697_002242_count :
    mapNode_535697_002242.count = 2242 :=
  map_count_branch
    mapNode_535697_001121
    mapNode_536818_001121
    1121 1121
    mapNode_535697_001121_count
    mapNode_536818_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_533456_004483_count :
    mapNode_533456_004483.count = 4483 :=
  map_count_branch
    mapNode_533456_002241
    mapNode_535697_002242
    2241 2242
    mapNode_533456_002241_count
    mapNode_535697_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_528973_008966_count :
    mapNode_528973_008966.count = 8966 :=
  map_count_branch
    mapNode_528973_004483
    mapNode_533456_004483
    4483 4483
    mapNode_528973_004483_count
    mapNode_533456_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_520007_017932_count :
    mapNode_520007_017932.count = 17932 :=
  map_count_branch
    mapNode_520007_008966
    mapNode_528973_008966
    8966 8966
    mapNode_520007_008966_count
    mapNode_528973_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_502076_035863_count :
    mapNode_502076_035863.count = 35863 :=
  map_count_branch
    mapNode_502076_017931
    mapNode_520007_017932
    17931 17932
    mapNode_502076_017931_count
    mapNode_520007_017932_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_537939_count :
    mapChunk_537939.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_538499_count :
    mapChunk_538499.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_537939_001120_count :
    mapNode_537939_001120.count = 1120 :=
  map_count_branch
    mapChunk_537939
    mapChunk_538499
    560 560
    mapChunk_537939_count
    mapChunk_538499_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_539059_count :
    mapChunk_539059.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_539619_count :
    mapChunk_539619.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_539059_001121_count :
    mapNode_539059_001121.count = 1121 :=
  map_count_branch
    mapChunk_539059
    mapChunk_539619
    560 561
    mapChunk_539059_count
    mapChunk_539619_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_537939_002241_count :
    mapNode_537939_002241.count = 2241 :=
  map_count_branch
    mapNode_537939_001120
    mapNode_539059_001121
    1120 1121
    mapNode_537939_001120_count
    mapNode_539059_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_540180_count :
    mapChunk_540180.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_540740_count :
    mapChunk_540740.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_540180_001120_count :
    mapNode_540180_001120.count = 1120 :=
  map_count_branch
    mapChunk_540180
    mapChunk_540740
    560 560
    mapChunk_540180_count
    mapChunk_540740_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_541300_count :
    mapChunk_541300.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_541860_count :
    mapChunk_541860.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_541300_001121_count :
    mapNode_541300_001121.count = 1121 :=
  map_count_branch
    mapChunk_541300
    mapChunk_541860
    560 561
    mapChunk_541300_count
    mapChunk_541860_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_540180_002241_count :
    mapNode_540180_002241.count = 2241 :=
  map_count_branch
    mapNode_540180_001120
    mapNode_541300_001121
    1120 1121
    mapNode_540180_001120_count
    mapNode_541300_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_537939_004482_count :
    mapNode_537939_004482.count = 4482 :=
  map_count_branch
    mapNode_537939_002241
    mapNode_540180_002241
    2241 2241
    mapNode_537939_002241_count
    mapNode_540180_002241_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_542421_count :
    mapChunk_542421.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_542981_count :
    mapChunk_542981.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_542421_001120_count :
    mapNode_542421_001120.count = 1120 :=
  map_count_branch
    mapChunk_542421
    mapChunk_542981
    560 560
    mapChunk_542421_count
    mapChunk_542981_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_543541_count :
    mapChunk_543541.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_544101_count :
    mapChunk_544101.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_543541_001121_count :
    mapNode_543541_001121.count = 1121 :=
  map_count_branch
    mapChunk_543541
    mapChunk_544101
    560 561
    mapChunk_543541_count
    mapChunk_544101_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_542421_002241_count :
    mapNode_542421_002241.count = 2241 :=
  map_count_branch
    mapNode_542421_001120
    mapNode_543541_001121
    1120 1121
    mapNode_542421_001120_count
    mapNode_543541_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_544662_count :
    mapChunk_544662.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_545222_count :
    mapChunk_545222.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_544662_001121_count :
    mapNode_544662_001121.count = 1121 :=
  map_count_branch
    mapChunk_544662
    mapChunk_545222
    560 561
    mapChunk_544662_count
    mapChunk_545222_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_545783_count :
    mapChunk_545783.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_546343_count :
    mapChunk_546343.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_545783_001121_count :
    mapNode_545783_001121.count = 1121 :=
  map_count_branch
    mapChunk_545783
    mapChunk_546343
    560 561
    mapChunk_545783_count
    mapChunk_546343_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_544662_002242_count :
    mapNode_544662_002242.count = 2242 :=
  map_count_branch
    mapNode_544662_001121
    mapNode_545783_001121
    1121 1121
    mapNode_544662_001121_count
    mapNode_545783_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_542421_004483_count :
    mapNode_542421_004483.count = 4483 :=
  map_count_branch
    mapNode_542421_002241
    mapNode_544662_002242
    2241 2242
    mapNode_542421_002241_count
    mapNode_544662_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_537939_008965_count :
    mapNode_537939_008965.count = 8965 :=
  map_count_branch
    mapNode_537939_004482
    mapNode_542421_004483
    4482 4483
    mapNode_537939_004482_count
    mapNode_542421_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_546904_count :
    mapChunk_546904.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_547464_count :
    mapChunk_547464.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_546904_001120_count :
    mapNode_546904_001120.count = 1120 :=
  map_count_branch
    mapChunk_546904
    mapChunk_547464
    560 560
    mapChunk_546904_count
    mapChunk_547464_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_548024_count :
    mapChunk_548024.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_548584_count :
    mapChunk_548584.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_548024_001121_count :
    mapNode_548024_001121.count = 1121 :=
  map_count_branch
    mapChunk_548024
    mapChunk_548584
    560 561
    mapChunk_548024_count
    mapChunk_548584_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_546904_002241_count :
    mapNode_546904_002241.count = 2241 :=
  map_count_branch
    mapNode_546904_001120
    mapNode_548024_001121
    1120 1121
    mapNode_546904_001120_count
    mapNode_548024_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_549145_count :
    mapChunk_549145.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_549705_count :
    mapChunk_549705.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_549145_001121_count :
    mapNode_549145_001121.count = 1121 :=
  map_count_branch
    mapChunk_549145
    mapChunk_549705
    560 561
    mapChunk_549145_count
    mapChunk_549705_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_550266_count :
    mapChunk_550266.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_550826_count :
    mapChunk_550826.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_550266_001121_count :
    mapNode_550266_001121.count = 1121 :=
  map_count_branch
    mapChunk_550266
    mapChunk_550826
    560 561
    mapChunk_550266_count
    mapChunk_550826_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_549145_002242_count :
    mapNode_549145_002242.count = 2242 :=
  map_count_branch
    mapNode_549145_001121
    mapNode_550266_001121
    1121 1121
    mapNode_549145_001121_count
    mapNode_550266_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_546904_004483_count :
    mapNode_546904_004483.count = 4483 :=
  map_count_branch
    mapNode_546904_002241
    mapNode_549145_002242
    2241 2242
    mapNode_546904_002241_count
    mapNode_549145_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_551387_count :
    mapChunk_551387.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_551947_count :
    mapChunk_551947.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_551387_001120_count :
    mapNode_551387_001120.count = 1120 :=
  map_count_branch
    mapChunk_551387
    mapChunk_551947
    560 560
    mapChunk_551387_count
    mapChunk_551947_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_552507_count :
    mapChunk_552507.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_553067_count :
    mapChunk_553067.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_552507_001121_count :
    mapNode_552507_001121.count = 1121 :=
  map_count_branch
    mapChunk_552507
    mapChunk_553067
    560 561
    mapChunk_552507_count
    mapChunk_553067_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_551387_002241_count :
    mapNode_551387_002241.count = 2241 :=
  map_count_branch
    mapNode_551387_001120
    mapNode_552507_001121
    1120 1121
    mapNode_551387_001120_count
    mapNode_552507_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_553628_count :
    mapChunk_553628.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_554188_count :
    mapChunk_554188.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_553628_001121_count :
    mapNode_553628_001121.count = 1121 :=
  map_count_branch
    mapChunk_553628
    mapChunk_554188
    560 561
    mapChunk_553628_count
    mapChunk_554188_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_554749_count :
    mapChunk_554749.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_555309_count :
    mapChunk_555309.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_554749_001121_count :
    mapNode_554749_001121.count = 1121 :=
  map_count_branch
    mapChunk_554749
    mapChunk_555309
    560 561
    mapChunk_554749_count
    mapChunk_555309_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_553628_002242_count :
    mapNode_553628_002242.count = 2242 :=
  map_count_branch
    mapNode_553628_001121
    mapNode_554749_001121
    1121 1121
    mapNode_553628_001121_count
    mapNode_554749_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_551387_004483_count :
    mapNode_551387_004483.count = 4483 :=
  map_count_branch
    mapNode_551387_002241
    mapNode_553628_002242
    2241 2242
    mapNode_551387_002241_count
    mapNode_553628_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_546904_008966_count :
    mapNode_546904_008966.count = 8966 :=
  map_count_branch
    mapNode_546904_004483
    mapNode_551387_004483
    4483 4483
    mapNode_546904_004483_count
    mapNode_551387_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_537939_017931_count :
    mapNode_537939_017931.count = 17931 :=
  map_count_branch
    mapNode_537939_008965
    mapNode_546904_008966
    8965 8966
    mapNode_537939_008965_count
    mapNode_546904_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_555870_count :
    mapChunk_555870.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_556430_count :
    mapChunk_556430.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_555870_001120_count :
    mapNode_555870_001120.count = 1120 :=
  map_count_branch
    mapChunk_555870
    mapChunk_556430
    560 560
    mapChunk_555870_count
    mapChunk_556430_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_556990_count :
    mapChunk_556990.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_557550_count :
    mapChunk_557550.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_556990_001121_count :
    mapNode_556990_001121.count = 1121 :=
  map_count_branch
    mapChunk_556990
    mapChunk_557550
    560 561
    mapChunk_556990_count
    mapChunk_557550_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_555870_002241_count :
    mapNode_555870_002241.count = 2241 :=
  map_count_branch
    mapNode_555870_001120
    mapNode_556990_001121
    1120 1121
    mapNode_555870_001120_count
    mapNode_556990_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_558111_count :
    mapChunk_558111.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_558671_count :
    mapChunk_558671.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_558111_001121_count :
    mapNode_558111_001121.count = 1121 :=
  map_count_branch
    mapChunk_558111
    mapChunk_558671
    560 561
    mapChunk_558111_count
    mapChunk_558671_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_559232_count :
    mapChunk_559232.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_559792_count :
    mapChunk_559792.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_559232_001121_count :
    mapNode_559232_001121.count = 1121 :=
  map_count_branch
    mapChunk_559232
    mapChunk_559792
    560 561
    mapChunk_559232_count
    mapChunk_559792_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_558111_002242_count :
    mapNode_558111_002242.count = 2242 :=
  map_count_branch
    mapNode_558111_001121
    mapNode_559232_001121
    1121 1121
    mapNode_558111_001121_count
    mapNode_559232_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_555870_004483_count :
    mapNode_555870_004483.count = 4483 :=
  map_count_branch
    mapNode_555870_002241
    mapNode_558111_002242
    2241 2242
    mapNode_555870_002241_count
    mapNode_558111_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_560353_count :
    mapChunk_560353.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_560913_count :
    mapChunk_560913.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_560353_001120_count :
    mapNode_560353_001120.count = 1120 :=
  map_count_branch
    mapChunk_560353
    mapChunk_560913
    560 560
    mapChunk_560353_count
    mapChunk_560913_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_561473_count :
    mapChunk_561473.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_562033_count :
    mapChunk_562033.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_561473_001121_count :
    mapNode_561473_001121.count = 1121 :=
  map_count_branch
    mapChunk_561473
    mapChunk_562033
    560 561
    mapChunk_561473_count
    mapChunk_562033_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_560353_002241_count :
    mapNode_560353_002241.count = 2241 :=
  map_count_branch
    mapNode_560353_001120
    mapNode_561473_001121
    1120 1121
    mapNode_560353_001120_count
    mapNode_561473_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_562594_count :
    mapChunk_562594.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_563154_count :
    mapChunk_563154.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_562594_001121_count :
    mapNode_562594_001121.count = 1121 :=
  map_count_branch
    mapChunk_562594
    mapChunk_563154
    560 561
    mapChunk_562594_count
    mapChunk_563154_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_563715_count :
    mapChunk_563715.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_564275_count :
    mapChunk_564275.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_563715_001121_count :
    mapNode_563715_001121.count = 1121 :=
  map_count_branch
    mapChunk_563715
    mapChunk_564275
    560 561
    mapChunk_563715_count
    mapChunk_564275_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_562594_002242_count :
    mapNode_562594_002242.count = 2242 :=
  map_count_branch
    mapNode_562594_001121
    mapNode_563715_001121
    1121 1121
    mapNode_562594_001121_count
    mapNode_563715_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_560353_004483_count :
    mapNode_560353_004483.count = 4483 :=
  map_count_branch
    mapNode_560353_002241
    mapNode_562594_002242
    2241 2242
    mapNode_560353_002241_count
    mapNode_562594_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_555870_008966_count :
    mapNode_555870_008966.count = 8966 :=
  map_count_branch
    mapNode_555870_004483
    mapNode_560353_004483
    4483 4483
    mapNode_555870_004483_count
    mapNode_560353_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_564836_count :
    mapChunk_564836.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_565396_count :
    mapChunk_565396.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_564836_001120_count :
    mapNode_564836_001120.count = 1120 :=
  map_count_branch
    mapChunk_564836
    mapChunk_565396
    560 560
    mapChunk_564836_count
    mapChunk_565396_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_565956_count :
    mapChunk_565956.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_566516_count :
    mapChunk_566516.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_565956_001121_count :
    mapNode_565956_001121.count = 1121 :=
  map_count_branch
    mapChunk_565956
    mapChunk_566516
    560 561
    mapChunk_565956_count
    mapChunk_566516_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_564836_002241_count :
    mapNode_564836_002241.count = 2241 :=
  map_count_branch
    mapNode_564836_001120
    mapNode_565956_001121
    1120 1121
    mapNode_564836_001120_count
    mapNode_565956_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_567077_count :
    mapChunk_567077.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_567637_count :
    mapChunk_567637.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_567077_001121_count :
    mapNode_567077_001121.count = 1121 :=
  map_count_branch
    mapChunk_567077
    mapChunk_567637
    560 561
    mapChunk_567077_count
    mapChunk_567637_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_568198_count :
    mapChunk_568198.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_568758_count :
    mapChunk_568758.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_568198_001121_count :
    mapNode_568198_001121.count = 1121 :=
  map_count_branch
    mapChunk_568198
    mapChunk_568758
    560 561
    mapChunk_568198_count
    mapChunk_568758_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_567077_002242_count :
    mapNode_567077_002242.count = 2242 :=
  map_count_branch
    mapNode_567077_001121
    mapNode_568198_001121
    1121 1121
    mapNode_567077_001121_count
    mapNode_568198_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_564836_004483_count :
    mapNode_564836_004483.count = 4483 :=
  map_count_branch
    mapNode_564836_002241
    mapNode_567077_002242
    2241 2242
    mapNode_564836_002241_count
    mapNode_567077_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_569319_count :
    mapChunk_569319.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_569879_count :
    mapChunk_569879.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_569319_001120_count :
    mapNode_569319_001120.count = 1120 :=
  map_count_branch
    mapChunk_569319
    mapChunk_569879
    560 560
    mapChunk_569319_count
    mapChunk_569879_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_570439_count :
    mapChunk_570439.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_570999_count :
    mapChunk_570999.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_570439_001121_count :
    mapNode_570439_001121.count = 1121 :=
  map_count_branch
    mapChunk_570439
    mapChunk_570999
    560 561
    mapChunk_570439_count
    mapChunk_570999_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_569319_002241_count :
    mapNode_569319_002241.count = 2241 :=
  map_count_branch
    mapNode_569319_001120
    mapNode_570439_001121
    1120 1121
    mapNode_569319_001120_count
    mapNode_570439_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_571560_count :
    mapChunk_571560.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_572120_count :
    mapChunk_572120.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_571560_001121_count :
    mapNode_571560_001121.count = 1121 :=
  map_count_branch
    mapChunk_571560
    mapChunk_572120
    560 561
    mapChunk_571560_count
    mapChunk_572120_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_572681_count :
    mapChunk_572681.count = 560 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapChunk_573241_count :
    mapChunk_573241.count = 561 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_572681_001121_count :
    mapNode_572681_001121.count = 1121 :=
  map_count_branch
    mapChunk_572681
    mapChunk_573241
    560 561
    mapChunk_572681_count
    mapChunk_573241_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_571560_002242_count :
    mapNode_571560_002242.count = 2242 :=
  map_count_branch
    mapNode_571560_001121
    mapNode_572681_001121
    1121 1121
    mapNode_571560_001121_count
    mapNode_572681_001121_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_569319_004483_count :
    mapNode_569319_004483.count = 4483 :=
  map_count_branch
    mapNode_569319_002241
    mapNode_571560_002242
    2241 2242
    mapNode_569319_002241_count
    mapNode_571560_002242_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_564836_008966_count :
    mapNode_564836_008966.count = 8966 :=
  map_count_branch
    mapNode_564836_004483
    mapNode_569319_004483
    4483 4483
    mapNode_564836_004483_count
    mapNode_569319_004483_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_555870_017932_count :
    mapNode_555870_017932.count = 17932 :=
  map_count_branch
    mapNode_555870_008966
    mapNode_564836_008966
    8966 8966
    mapNode_555870_008966_count
    mapNode_564836_008966_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_537939_035863_count :
    mapNode_537939_035863.count = 35863 :=
  map_count_branch
    mapNode_537939_017931
    mapNode_555870_017932
    17931 17932
    mapNode_537939_017931_count
    mapNode_555870_017932_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_502076_071726_count :
    mapNode_502076_071726.count = 71726 :=
  map_count_branch
    mapNode_502076_035863
    mapNode_537939_035863
    35863 35863
    mapNode_502076_035863_count
    mapNode_537939_035863_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_430351_143451_count :
    mapNode_430351_143451.count = 143451 :=
  map_count_branch
    mapNode_430351_071725
    mapNode_502076_071726
    71725 71726
    mapNode_430351_071725_count
    mapNode_502076_071726_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_286901_286901_count :
    mapNode_286901_286901.count = 286901 :=
  map_count_branch
    mapNode_286901_143450
    mapNode_430351_143451
    143450 143451
    mapNode_286901_143450_count
    mapNode_430351_143451_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem mapNode_000000_573802_count :
    mapNode_000000_573802.count = 573802 :=
  map_count_branch
    mapNode_000000_286901
    mapNode_286901_286901
    286901 286901
    mapNode_000000_286901_count
    mapNode_286901_286901_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem map_count :
    mapTree.count = 573802 :=
  mapNode_000000_573802_count

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Complete body class map count checked"
