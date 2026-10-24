module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.FuelLookup

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open FuelLookupPilot
namespace FuelHeightsPilot
theorem height_mapChunk_000000 : mapChunk_000000.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_000560 : mapChunk_000560.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_000000_001120 : mapNode_000000_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_000000 mapChunk_000560
    10 10 height_mapChunk_000000 height_mapChunk_000560
theorem height_mapChunk_001120 : mapChunk_001120.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_001680 : mapChunk_001680.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_001120_001121 : mapNode_001120_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_001120 mapChunk_001680
    10 10 height_mapChunk_001120 height_mapChunk_001680
theorem height_mapNode_000000_002241 : mapNode_000000_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_000000_001120 mapNode_001120_001121
    11 11 height_mapNode_000000_001120 height_mapNode_001120_001121
theorem height_mapChunk_002241 : mapChunk_002241.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_002801 : mapChunk_002801.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_002241_001120 : mapNode_002241_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_002241 mapChunk_002801
    10 10 height_mapChunk_002241 height_mapChunk_002801
theorem height_mapChunk_003361 : mapChunk_003361.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_003921 : mapChunk_003921.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_003361_001121 : mapNode_003361_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_003361 mapChunk_003921
    10 10 height_mapChunk_003361 height_mapChunk_003921
theorem height_mapNode_002241_002241 : mapNode_002241_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_002241_001120 mapNode_003361_001121
    11 11 height_mapNode_002241_001120 height_mapNode_003361_001121
theorem height_mapNode_000000_004482 : mapNode_000000_004482.height ≤ 13 := by
  exact height_branch 2241 mapNode_000000_002241 mapNode_002241_002241
    12 12 height_mapNode_000000_002241 height_mapNode_002241_002241
theorem height_mapChunk_004482 : mapChunk_004482.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_005042 : mapChunk_005042.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_004482_001120 : mapNode_004482_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_004482 mapChunk_005042
    10 10 height_mapChunk_004482 height_mapChunk_005042
theorem height_mapChunk_005602 : mapChunk_005602.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_006162 : mapChunk_006162.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_005602_001121 : mapNode_005602_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_005602 mapChunk_006162
    10 10 height_mapChunk_005602 height_mapChunk_006162
theorem height_mapNode_004482_002241 : mapNode_004482_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_004482_001120 mapNode_005602_001121
    11 11 height_mapNode_004482_001120 height_mapNode_005602_001121
theorem height_mapChunk_006723 : mapChunk_006723.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_007283 : mapChunk_007283.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_006723_001121 : mapNode_006723_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_006723 mapChunk_007283
    10 10 height_mapChunk_006723 height_mapChunk_007283
theorem height_mapChunk_007844 : mapChunk_007844.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_008404 : mapChunk_008404.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_007844_001121 : mapNode_007844_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_007844 mapChunk_008404
    10 10 height_mapChunk_007844 height_mapChunk_008404
theorem height_mapNode_006723_002242 : mapNode_006723_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_006723_001121 mapNode_007844_001121
    11 11 height_mapNode_006723_001121 height_mapNode_007844_001121
theorem height_mapNode_004482_004483 : mapNode_004482_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_004482_002241 mapNode_006723_002242
    12 12 height_mapNode_004482_002241 height_mapNode_006723_002242
theorem height_mapNode_000000_008965 : mapNode_000000_008965.height ≤ 14 := by
  exact height_branch 4482 mapNode_000000_004482 mapNode_004482_004483
    13 13 height_mapNode_000000_004482 height_mapNode_004482_004483
theorem height_mapChunk_008965 : mapChunk_008965.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_009525 : mapChunk_009525.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_008965_001120 : mapNode_008965_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_008965 mapChunk_009525
    10 10 height_mapChunk_008965 height_mapChunk_009525
theorem height_mapChunk_010085 : mapChunk_010085.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_010645 : mapChunk_010645.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_010085_001121 : mapNode_010085_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_010085 mapChunk_010645
    10 10 height_mapChunk_010085 height_mapChunk_010645
theorem height_mapNode_008965_002241 : mapNode_008965_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_008965_001120 mapNode_010085_001121
    11 11 height_mapNode_008965_001120 height_mapNode_010085_001121
theorem height_mapChunk_011206 : mapChunk_011206.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_011766 : mapChunk_011766.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_011206_001121 : mapNode_011206_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_011206 mapChunk_011766
    10 10 height_mapChunk_011206 height_mapChunk_011766
theorem height_mapChunk_012327 : mapChunk_012327.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_012887 : mapChunk_012887.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_012327_001121 : mapNode_012327_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_012327 mapChunk_012887
    10 10 height_mapChunk_012327 height_mapChunk_012887
theorem height_mapNode_011206_002242 : mapNode_011206_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_011206_001121 mapNode_012327_001121
    11 11 height_mapNode_011206_001121 height_mapNode_012327_001121
theorem height_mapNode_008965_004483 : mapNode_008965_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_008965_002241 mapNode_011206_002242
    12 12 height_mapNode_008965_002241 height_mapNode_011206_002242
theorem height_mapChunk_013448 : mapChunk_013448.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_014008 : mapChunk_014008.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_013448_001120 : mapNode_013448_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_013448 mapChunk_014008
    10 10 height_mapChunk_013448 height_mapChunk_014008
theorem height_mapChunk_014568 : mapChunk_014568.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_015128 : mapChunk_015128.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_014568_001121 : mapNode_014568_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_014568 mapChunk_015128
    10 10 height_mapChunk_014568 height_mapChunk_015128
theorem height_mapNode_013448_002241 : mapNode_013448_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_013448_001120 mapNode_014568_001121
    11 11 height_mapNode_013448_001120 height_mapNode_014568_001121
theorem height_mapChunk_015689 : mapChunk_015689.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_016249 : mapChunk_016249.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_015689_001121 : mapNode_015689_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_015689 mapChunk_016249
    10 10 height_mapChunk_015689 height_mapChunk_016249
theorem height_mapChunk_016810 : mapChunk_016810.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_017370 : mapChunk_017370.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_016810_001121 : mapNode_016810_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_016810 mapChunk_017370
    10 10 height_mapChunk_016810 height_mapChunk_017370
theorem height_mapNode_015689_002242 : mapNode_015689_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_015689_001121 mapNode_016810_001121
    11 11 height_mapNode_015689_001121 height_mapNode_016810_001121
theorem height_mapNode_013448_004483 : mapNode_013448_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_013448_002241 mapNode_015689_002242
    12 12 height_mapNode_013448_002241 height_mapNode_015689_002242
theorem height_mapNode_008965_008966 : mapNode_008965_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_008965_004483 mapNode_013448_004483
    13 13 height_mapNode_008965_004483 height_mapNode_013448_004483
theorem height_mapNode_000000_017931 : mapNode_000000_017931.height ≤ 15 := by
  exact height_branch 8965 mapNode_000000_008965 mapNode_008965_008966
    14 14 height_mapNode_000000_008965 height_mapNode_008965_008966
theorem height_mapChunk_017931 : mapChunk_017931.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_018491 : mapChunk_018491.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_017931_001120 : mapNode_017931_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_017931 mapChunk_018491
    10 10 height_mapChunk_017931 height_mapChunk_018491
theorem height_mapChunk_019051 : mapChunk_019051.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_019611 : mapChunk_019611.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_019051_001121 : mapNode_019051_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_019051 mapChunk_019611
    10 10 height_mapChunk_019051 height_mapChunk_019611
theorem height_mapNode_017931_002241 : mapNode_017931_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_017931_001120 mapNode_019051_001121
    11 11 height_mapNode_017931_001120 height_mapNode_019051_001121
theorem height_mapChunk_020172 : mapChunk_020172.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_020732 : mapChunk_020732.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_020172_001120 : mapNode_020172_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_020172 mapChunk_020732
    10 10 height_mapChunk_020172 height_mapChunk_020732
theorem height_mapChunk_021292 : mapChunk_021292.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_021852 : mapChunk_021852.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_021292_001121 : mapNode_021292_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_021292 mapChunk_021852
    10 10 height_mapChunk_021292 height_mapChunk_021852
theorem height_mapNode_020172_002241 : mapNode_020172_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_020172_001120 mapNode_021292_001121
    11 11 height_mapNode_020172_001120 height_mapNode_021292_001121
theorem height_mapNode_017931_004482 : mapNode_017931_004482.height ≤ 13 := by
  exact height_branch 2241 mapNode_017931_002241 mapNode_020172_002241
    12 12 height_mapNode_017931_002241 height_mapNode_020172_002241
theorem height_mapChunk_022413 : mapChunk_022413.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_022973 : mapChunk_022973.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_022413_001120 : mapNode_022413_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_022413 mapChunk_022973
    10 10 height_mapChunk_022413 height_mapChunk_022973
theorem height_mapChunk_023533 : mapChunk_023533.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_024093 : mapChunk_024093.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_023533_001121 : mapNode_023533_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_023533 mapChunk_024093
    10 10 height_mapChunk_023533 height_mapChunk_024093
theorem height_mapNode_022413_002241 : mapNode_022413_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_022413_001120 mapNode_023533_001121
    11 11 height_mapNode_022413_001120 height_mapNode_023533_001121
theorem height_mapChunk_024654 : mapChunk_024654.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_025214 : mapChunk_025214.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_024654_001121 : mapNode_024654_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_024654 mapChunk_025214
    10 10 height_mapChunk_024654 height_mapChunk_025214
theorem height_mapChunk_025775 : mapChunk_025775.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_026335 : mapChunk_026335.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_025775_001121 : mapNode_025775_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_025775 mapChunk_026335
    10 10 height_mapChunk_025775 height_mapChunk_026335
theorem height_mapNode_024654_002242 : mapNode_024654_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_024654_001121 mapNode_025775_001121
    11 11 height_mapNode_024654_001121 height_mapNode_025775_001121
theorem height_mapNode_022413_004483 : mapNode_022413_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_022413_002241 mapNode_024654_002242
    12 12 height_mapNode_022413_002241 height_mapNode_024654_002242
theorem height_mapNode_017931_008965 : mapNode_017931_008965.height ≤ 14 := by
  exact height_branch 4482 mapNode_017931_004482 mapNode_022413_004483
    13 13 height_mapNode_017931_004482 height_mapNode_022413_004483
theorem height_mapChunk_026896 : mapChunk_026896.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_027456 : mapChunk_027456.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_026896_001120 : mapNode_026896_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_026896 mapChunk_027456
    10 10 height_mapChunk_026896 height_mapChunk_027456
theorem height_mapChunk_028016 : mapChunk_028016.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_028576 : mapChunk_028576.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_028016_001121 : mapNode_028016_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_028016 mapChunk_028576
    10 10 height_mapChunk_028016 height_mapChunk_028576
theorem height_mapNode_026896_002241 : mapNode_026896_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_026896_001120 mapNode_028016_001121
    11 11 height_mapNode_026896_001120 height_mapNode_028016_001121
theorem height_mapChunk_029137 : mapChunk_029137.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_029697 : mapChunk_029697.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_029137_001121 : mapNode_029137_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_029137 mapChunk_029697
    10 10 height_mapChunk_029137 height_mapChunk_029697
theorem height_mapChunk_030258 : mapChunk_030258.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_030818 : mapChunk_030818.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_030258_001121 : mapNode_030258_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_030258 mapChunk_030818
    10 10 height_mapChunk_030258 height_mapChunk_030818
theorem height_mapNode_029137_002242 : mapNode_029137_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_029137_001121 mapNode_030258_001121
    11 11 height_mapNode_029137_001121 height_mapNode_030258_001121
theorem height_mapNode_026896_004483 : mapNode_026896_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_026896_002241 mapNode_029137_002242
    12 12 height_mapNode_026896_002241 height_mapNode_029137_002242
theorem height_mapChunk_031379 : mapChunk_031379.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_031939 : mapChunk_031939.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_031379_001120 : mapNode_031379_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_031379 mapChunk_031939
    10 10 height_mapChunk_031379 height_mapChunk_031939
theorem height_mapChunk_032499 : mapChunk_032499.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_033059 : mapChunk_033059.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_032499_001121 : mapNode_032499_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_032499 mapChunk_033059
    10 10 height_mapChunk_032499 height_mapChunk_033059
theorem height_mapNode_031379_002241 : mapNode_031379_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_031379_001120 mapNode_032499_001121
    11 11 height_mapNode_031379_001120 height_mapNode_032499_001121
theorem height_mapChunk_033620 : mapChunk_033620.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_034180 : mapChunk_034180.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_033620_001121 : mapNode_033620_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_033620 mapChunk_034180
    10 10 height_mapChunk_033620 height_mapChunk_034180
theorem height_mapChunk_034741 : mapChunk_034741.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_035301 : mapChunk_035301.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_034741_001121 : mapNode_034741_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_034741 mapChunk_035301
    10 10 height_mapChunk_034741 height_mapChunk_035301
theorem height_mapNode_033620_002242 : mapNode_033620_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_033620_001121 mapNode_034741_001121
    11 11 height_mapNode_033620_001121 height_mapNode_034741_001121
theorem height_mapNode_031379_004483 : mapNode_031379_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_031379_002241 mapNode_033620_002242
    12 12 height_mapNode_031379_002241 height_mapNode_033620_002242
theorem height_mapNode_026896_008966 : mapNode_026896_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_026896_004483 mapNode_031379_004483
    13 13 height_mapNode_026896_004483 height_mapNode_031379_004483
theorem height_mapNode_017931_017931 : mapNode_017931_017931.height ≤ 15 := by
  exact height_branch 8965 mapNode_017931_008965 mapNode_026896_008966
    14 14 height_mapNode_017931_008965 height_mapNode_026896_008966
theorem height_mapNode_000000_035862 : mapNode_000000_035862.height ≤ 16 := by
  exact height_branch 17931 mapNode_000000_017931 mapNode_017931_017931
    15 15 height_mapNode_000000_017931 height_mapNode_017931_017931
theorem height_mapChunk_035862 : mapChunk_035862.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_036422 : mapChunk_036422.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_035862_001120 : mapNode_035862_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_035862 mapChunk_036422
    10 10 height_mapChunk_035862 height_mapChunk_036422
theorem height_mapChunk_036982 : mapChunk_036982.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_037542 : mapChunk_037542.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_036982_001121 : mapNode_036982_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_036982 mapChunk_037542
    10 10 height_mapChunk_036982 height_mapChunk_037542
theorem height_mapNode_035862_002241 : mapNode_035862_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_035862_001120 mapNode_036982_001121
    11 11 height_mapNode_035862_001120 height_mapNode_036982_001121
theorem height_mapChunk_038103 : mapChunk_038103.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_038663 : mapChunk_038663.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_038103_001120 : mapNode_038103_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_038103 mapChunk_038663
    10 10 height_mapChunk_038103 height_mapChunk_038663
theorem height_mapChunk_039223 : mapChunk_039223.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_039783 : mapChunk_039783.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_039223_001121 : mapNode_039223_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_039223 mapChunk_039783
    10 10 height_mapChunk_039223 height_mapChunk_039783
theorem height_mapNode_038103_002241 : mapNode_038103_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_038103_001120 mapNode_039223_001121
    11 11 height_mapNode_038103_001120 height_mapNode_039223_001121
theorem height_mapNode_035862_004482 : mapNode_035862_004482.height ≤ 13 := by
  exact height_branch 2241 mapNode_035862_002241 mapNode_038103_002241
    12 12 height_mapNode_035862_002241 height_mapNode_038103_002241
theorem height_mapChunk_040344 : mapChunk_040344.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_040904 : mapChunk_040904.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_040344_001120 : mapNode_040344_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_040344 mapChunk_040904
    10 10 height_mapChunk_040344 height_mapChunk_040904
theorem height_mapChunk_041464 : mapChunk_041464.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_042024 : mapChunk_042024.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_041464_001121 : mapNode_041464_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_041464 mapChunk_042024
    10 10 height_mapChunk_041464 height_mapChunk_042024
theorem height_mapNode_040344_002241 : mapNode_040344_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_040344_001120 mapNode_041464_001121
    11 11 height_mapNode_040344_001120 height_mapNode_041464_001121
theorem height_mapChunk_042585 : mapChunk_042585.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_043145 : mapChunk_043145.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_042585_001121 : mapNode_042585_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_042585 mapChunk_043145
    10 10 height_mapChunk_042585 height_mapChunk_043145
theorem height_mapChunk_043706 : mapChunk_043706.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_044266 : mapChunk_044266.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_043706_001121 : mapNode_043706_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_043706 mapChunk_044266
    10 10 height_mapChunk_043706 height_mapChunk_044266
theorem height_mapNode_042585_002242 : mapNode_042585_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_042585_001121 mapNode_043706_001121
    11 11 height_mapNode_042585_001121 height_mapNode_043706_001121
theorem height_mapNode_040344_004483 : mapNode_040344_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_040344_002241 mapNode_042585_002242
    12 12 height_mapNode_040344_002241 height_mapNode_042585_002242
theorem height_mapNode_035862_008965 : mapNode_035862_008965.height ≤ 14 := by
  exact height_branch 4482 mapNode_035862_004482 mapNode_040344_004483
    13 13 height_mapNode_035862_004482 height_mapNode_040344_004483
theorem height_mapChunk_044827 : mapChunk_044827.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_045387 : mapChunk_045387.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_044827_001120 : mapNode_044827_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_044827 mapChunk_045387
    10 10 height_mapChunk_044827 height_mapChunk_045387
theorem height_mapChunk_045947 : mapChunk_045947.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_046507 : mapChunk_046507.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_045947_001121 : mapNode_045947_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_045947 mapChunk_046507
    10 10 height_mapChunk_045947 height_mapChunk_046507
theorem height_mapNode_044827_002241 : mapNode_044827_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_044827_001120 mapNode_045947_001121
    11 11 height_mapNode_044827_001120 height_mapNode_045947_001121
theorem height_mapChunk_047068 : mapChunk_047068.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_047628 : mapChunk_047628.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_047068_001121 : mapNode_047068_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_047068 mapChunk_047628
    10 10 height_mapChunk_047068 height_mapChunk_047628
theorem height_mapChunk_048189 : mapChunk_048189.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_048749 : mapChunk_048749.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_048189_001121 : mapNode_048189_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_048189 mapChunk_048749
    10 10 height_mapChunk_048189 height_mapChunk_048749
theorem height_mapNode_047068_002242 : mapNode_047068_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_047068_001121 mapNode_048189_001121
    11 11 height_mapNode_047068_001121 height_mapNode_048189_001121
theorem height_mapNode_044827_004483 : mapNode_044827_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_044827_002241 mapNode_047068_002242
    12 12 height_mapNode_044827_002241 height_mapNode_047068_002242
theorem height_mapChunk_049310 : mapChunk_049310.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_049870 : mapChunk_049870.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_049310_001120 : mapNode_049310_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_049310 mapChunk_049870
    10 10 height_mapChunk_049310 height_mapChunk_049870
theorem height_mapChunk_050430 : mapChunk_050430.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_050990 : mapChunk_050990.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_050430_001121 : mapNode_050430_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_050430 mapChunk_050990
    10 10 height_mapChunk_050430 height_mapChunk_050990
theorem height_mapNode_049310_002241 : mapNode_049310_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_049310_001120 mapNode_050430_001121
    11 11 height_mapNode_049310_001120 height_mapNode_050430_001121
theorem height_mapChunk_051551 : mapChunk_051551.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_052111 : mapChunk_052111.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_051551_001121 : mapNode_051551_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_051551 mapChunk_052111
    10 10 height_mapChunk_051551 height_mapChunk_052111
theorem height_mapChunk_052672 : mapChunk_052672.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_053232 : mapChunk_053232.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_052672_001121 : mapNode_052672_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_052672 mapChunk_053232
    10 10 height_mapChunk_052672 height_mapChunk_053232
theorem height_mapNode_051551_002242 : mapNode_051551_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_051551_001121 mapNode_052672_001121
    11 11 height_mapNode_051551_001121 height_mapNode_052672_001121
theorem height_mapNode_049310_004483 : mapNode_049310_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_049310_002241 mapNode_051551_002242
    12 12 height_mapNode_049310_002241 height_mapNode_051551_002242
theorem height_mapNode_044827_008966 : mapNode_044827_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_044827_004483 mapNode_049310_004483
    13 13 height_mapNode_044827_004483 height_mapNode_049310_004483
theorem height_mapNode_035862_017931 : mapNode_035862_017931.height ≤ 15 := by
  exact height_branch 8965 mapNode_035862_008965 mapNode_044827_008966
    14 14 height_mapNode_035862_008965 height_mapNode_044827_008966
theorem height_mapChunk_053793 : mapChunk_053793.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_054353 : mapChunk_054353.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_053793_001120 : mapNode_053793_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_053793 mapChunk_054353
    10 10 height_mapChunk_053793 height_mapChunk_054353
theorem height_mapChunk_054913 : mapChunk_054913.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_055473 : mapChunk_055473.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_054913_001121 : mapNode_054913_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_054913 mapChunk_055473
    10 10 height_mapChunk_054913 height_mapChunk_055473
theorem height_mapNode_053793_002241 : mapNode_053793_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_053793_001120 mapNode_054913_001121
    11 11 height_mapNode_053793_001120 height_mapNode_054913_001121
theorem height_mapChunk_056034 : mapChunk_056034.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_056594 : mapChunk_056594.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_056034_001121 : mapNode_056034_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_056034 mapChunk_056594
    10 10 height_mapChunk_056034 height_mapChunk_056594
theorem height_mapChunk_057155 : mapChunk_057155.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_057715 : mapChunk_057715.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_057155_001121 : mapNode_057155_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_057155 mapChunk_057715
    10 10 height_mapChunk_057155 height_mapChunk_057715
theorem height_mapNode_056034_002242 : mapNode_056034_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_056034_001121 mapNode_057155_001121
    11 11 height_mapNode_056034_001121 height_mapNode_057155_001121
theorem height_mapNode_053793_004483 : mapNode_053793_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_053793_002241 mapNode_056034_002242
    12 12 height_mapNode_053793_002241 height_mapNode_056034_002242
theorem height_mapChunk_058276 : mapChunk_058276.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_058836 : mapChunk_058836.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_058276_001120 : mapNode_058276_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_058276 mapChunk_058836
    10 10 height_mapChunk_058276 height_mapChunk_058836
theorem height_mapChunk_059396 : mapChunk_059396.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_059956 : mapChunk_059956.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_059396_001121 : mapNode_059396_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_059396 mapChunk_059956
    10 10 height_mapChunk_059396 height_mapChunk_059956
theorem height_mapNode_058276_002241 : mapNode_058276_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_058276_001120 mapNode_059396_001121
    11 11 height_mapNode_058276_001120 height_mapNode_059396_001121
theorem height_mapChunk_060517 : mapChunk_060517.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_061077 : mapChunk_061077.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_060517_001121 : mapNode_060517_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_060517 mapChunk_061077
    10 10 height_mapChunk_060517 height_mapChunk_061077
theorem height_mapChunk_061638 : mapChunk_061638.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_062198 : mapChunk_062198.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_061638_001121 : mapNode_061638_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_061638 mapChunk_062198
    10 10 height_mapChunk_061638 height_mapChunk_062198
theorem height_mapNode_060517_002242 : mapNode_060517_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_060517_001121 mapNode_061638_001121
    11 11 height_mapNode_060517_001121 height_mapNode_061638_001121
theorem height_mapNode_058276_004483 : mapNode_058276_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_058276_002241 mapNode_060517_002242
    12 12 height_mapNode_058276_002241 height_mapNode_060517_002242
theorem height_mapNode_053793_008966 : mapNode_053793_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_053793_004483 mapNode_058276_004483
    13 13 height_mapNode_053793_004483 height_mapNode_058276_004483
theorem height_mapChunk_062759 : mapChunk_062759.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_063319 : mapChunk_063319.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_062759_001120 : mapNode_062759_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_062759 mapChunk_063319
    10 10 height_mapChunk_062759 height_mapChunk_063319
theorem height_mapChunk_063879 : mapChunk_063879.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_064439 : mapChunk_064439.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_063879_001121 : mapNode_063879_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_063879 mapChunk_064439
    10 10 height_mapChunk_063879 height_mapChunk_064439
theorem height_mapNode_062759_002241 : mapNode_062759_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_062759_001120 mapNode_063879_001121
    11 11 height_mapNode_062759_001120 height_mapNode_063879_001121
theorem height_mapChunk_065000 : mapChunk_065000.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_065560 : mapChunk_065560.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_065000_001121 : mapNode_065000_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_065000 mapChunk_065560
    10 10 height_mapChunk_065000 height_mapChunk_065560
theorem height_mapChunk_066121 : mapChunk_066121.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_066681 : mapChunk_066681.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_066121_001121 : mapNode_066121_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_066121 mapChunk_066681
    10 10 height_mapChunk_066121 height_mapChunk_066681
theorem height_mapNode_065000_002242 : mapNode_065000_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_065000_001121 mapNode_066121_001121
    11 11 height_mapNode_065000_001121 height_mapNode_066121_001121
theorem height_mapNode_062759_004483 : mapNode_062759_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_062759_002241 mapNode_065000_002242
    12 12 height_mapNode_062759_002241 height_mapNode_065000_002242
theorem height_mapChunk_067242 : mapChunk_067242.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_067802 : mapChunk_067802.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_067242_001120 : mapNode_067242_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_067242 mapChunk_067802
    10 10 height_mapChunk_067242 height_mapChunk_067802
theorem height_mapChunk_068362 : mapChunk_068362.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_068922 : mapChunk_068922.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_068362_001121 : mapNode_068362_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_068362 mapChunk_068922
    10 10 height_mapChunk_068362 height_mapChunk_068922
theorem height_mapNode_067242_002241 : mapNode_067242_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_067242_001120 mapNode_068362_001121
    11 11 height_mapNode_067242_001120 height_mapNode_068362_001121
theorem height_mapChunk_069483 : mapChunk_069483.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_070043 : mapChunk_070043.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_069483_001121 : mapNode_069483_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_069483 mapChunk_070043
    10 10 height_mapChunk_069483 height_mapChunk_070043
theorem height_mapChunk_070604 : mapChunk_070604.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_071164 : mapChunk_071164.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_070604_001121 : mapNode_070604_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_070604 mapChunk_071164
    10 10 height_mapChunk_070604 height_mapChunk_071164
theorem height_mapNode_069483_002242 : mapNode_069483_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_069483_001121 mapNode_070604_001121
    11 11 height_mapNode_069483_001121 height_mapNode_070604_001121
theorem height_mapNode_067242_004483 : mapNode_067242_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_067242_002241 mapNode_069483_002242
    12 12 height_mapNode_067242_002241 height_mapNode_069483_002242
theorem height_mapNode_062759_008966 : mapNode_062759_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_062759_004483 mapNode_067242_004483
    13 13 height_mapNode_062759_004483 height_mapNode_067242_004483
theorem height_mapNode_053793_017932 : mapNode_053793_017932.height ≤ 15 := by
  exact height_branch 8966 mapNode_053793_008966 mapNode_062759_008966
    14 14 height_mapNode_053793_008966 height_mapNode_062759_008966
theorem height_mapNode_035862_035863 : mapNode_035862_035863.height ≤ 16 := by
  exact height_branch 17931 mapNode_035862_017931 mapNode_053793_017932
    15 15 height_mapNode_035862_017931 height_mapNode_053793_017932
theorem height_mapNode_000000_071725 : mapNode_000000_071725.height ≤ 17 := by
  exact height_branch 35862 mapNode_000000_035862 mapNode_035862_035863
    16 16 height_mapNode_000000_035862 height_mapNode_035862_035863
theorem height_mapChunk_071725 : mapChunk_071725.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_072285 : mapChunk_072285.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_071725_001120 : mapNode_071725_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_071725 mapChunk_072285
    10 10 height_mapChunk_071725 height_mapChunk_072285
theorem height_mapChunk_072845 : mapChunk_072845.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_073405 : mapChunk_073405.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_072845_001121 : mapNode_072845_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_072845 mapChunk_073405
    10 10 height_mapChunk_072845 height_mapChunk_073405
theorem height_mapNode_071725_002241 : mapNode_071725_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_071725_001120 mapNode_072845_001121
    11 11 height_mapNode_071725_001120 height_mapNode_072845_001121
theorem height_mapChunk_073966 : mapChunk_073966.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_074526 : mapChunk_074526.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_073966_001120 : mapNode_073966_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_073966 mapChunk_074526
    10 10 height_mapChunk_073966 height_mapChunk_074526
theorem height_mapChunk_075086 : mapChunk_075086.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_075646 : mapChunk_075646.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_075086_001121 : mapNode_075086_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_075086 mapChunk_075646
    10 10 height_mapChunk_075086 height_mapChunk_075646
theorem height_mapNode_073966_002241 : mapNode_073966_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_073966_001120 mapNode_075086_001121
    11 11 height_mapNode_073966_001120 height_mapNode_075086_001121
theorem height_mapNode_071725_004482 : mapNode_071725_004482.height ≤ 13 := by
  exact height_branch 2241 mapNode_071725_002241 mapNode_073966_002241
    12 12 height_mapNode_071725_002241 height_mapNode_073966_002241
theorem height_mapChunk_076207 : mapChunk_076207.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_076767 : mapChunk_076767.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_076207_001120 : mapNode_076207_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_076207 mapChunk_076767
    10 10 height_mapChunk_076207 height_mapChunk_076767
theorem height_mapChunk_077327 : mapChunk_077327.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_077887 : mapChunk_077887.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_077327_001121 : mapNode_077327_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_077327 mapChunk_077887
    10 10 height_mapChunk_077327 height_mapChunk_077887
theorem height_mapNode_076207_002241 : mapNode_076207_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_076207_001120 mapNode_077327_001121
    11 11 height_mapNode_076207_001120 height_mapNode_077327_001121
theorem height_mapChunk_078448 : mapChunk_078448.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_079008 : mapChunk_079008.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_078448_001121 : mapNode_078448_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_078448 mapChunk_079008
    10 10 height_mapChunk_078448 height_mapChunk_079008
theorem height_mapChunk_079569 : mapChunk_079569.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_080129 : mapChunk_080129.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_079569_001121 : mapNode_079569_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_079569 mapChunk_080129
    10 10 height_mapChunk_079569 height_mapChunk_080129
theorem height_mapNode_078448_002242 : mapNode_078448_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_078448_001121 mapNode_079569_001121
    11 11 height_mapNode_078448_001121 height_mapNode_079569_001121
theorem height_mapNode_076207_004483 : mapNode_076207_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_076207_002241 mapNode_078448_002242
    12 12 height_mapNode_076207_002241 height_mapNode_078448_002242
theorem height_mapNode_071725_008965 : mapNode_071725_008965.height ≤ 14 := by
  exact height_branch 4482 mapNode_071725_004482 mapNode_076207_004483
    13 13 height_mapNode_071725_004482 height_mapNode_076207_004483
theorem height_mapChunk_080690 : mapChunk_080690.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_081250 : mapChunk_081250.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_080690_001120 : mapNode_080690_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_080690 mapChunk_081250
    10 10 height_mapChunk_080690 height_mapChunk_081250
theorem height_mapChunk_081810 : mapChunk_081810.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_082370 : mapChunk_082370.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_081810_001121 : mapNode_081810_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_081810 mapChunk_082370
    10 10 height_mapChunk_081810 height_mapChunk_082370
theorem height_mapNode_080690_002241 : mapNode_080690_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_080690_001120 mapNode_081810_001121
    11 11 height_mapNode_080690_001120 height_mapNode_081810_001121
theorem height_mapChunk_082931 : mapChunk_082931.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_083491 : mapChunk_083491.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_082931_001121 : mapNode_082931_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_082931 mapChunk_083491
    10 10 height_mapChunk_082931 height_mapChunk_083491
theorem height_mapChunk_084052 : mapChunk_084052.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_084612 : mapChunk_084612.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_084052_001121 : mapNode_084052_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_084052 mapChunk_084612
    10 10 height_mapChunk_084052 height_mapChunk_084612
theorem height_mapNode_082931_002242 : mapNode_082931_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_082931_001121 mapNode_084052_001121
    11 11 height_mapNode_082931_001121 height_mapNode_084052_001121
theorem height_mapNode_080690_004483 : mapNode_080690_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_080690_002241 mapNode_082931_002242
    12 12 height_mapNode_080690_002241 height_mapNode_082931_002242
theorem height_mapChunk_085173 : mapChunk_085173.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_085733 : mapChunk_085733.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_085173_001120 : mapNode_085173_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_085173 mapChunk_085733
    10 10 height_mapChunk_085173 height_mapChunk_085733
theorem height_mapChunk_086293 : mapChunk_086293.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_086853 : mapChunk_086853.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_086293_001121 : mapNode_086293_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_086293 mapChunk_086853
    10 10 height_mapChunk_086293 height_mapChunk_086853
theorem height_mapNode_085173_002241 : mapNode_085173_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_085173_001120 mapNode_086293_001121
    11 11 height_mapNode_085173_001120 height_mapNode_086293_001121
theorem height_mapChunk_087414 : mapChunk_087414.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_087974 : mapChunk_087974.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_087414_001121 : mapNode_087414_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_087414 mapChunk_087974
    10 10 height_mapChunk_087414 height_mapChunk_087974
theorem height_mapChunk_088535 : mapChunk_088535.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_089095 : mapChunk_089095.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_088535_001121 : mapNode_088535_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_088535 mapChunk_089095
    10 10 height_mapChunk_088535 height_mapChunk_089095
theorem height_mapNode_087414_002242 : mapNode_087414_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_087414_001121 mapNode_088535_001121
    11 11 height_mapNode_087414_001121 height_mapNode_088535_001121
theorem height_mapNode_085173_004483 : mapNode_085173_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_085173_002241 mapNode_087414_002242
    12 12 height_mapNode_085173_002241 height_mapNode_087414_002242
theorem height_mapNode_080690_008966 : mapNode_080690_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_080690_004483 mapNode_085173_004483
    13 13 height_mapNode_080690_004483 height_mapNode_085173_004483
theorem height_mapNode_071725_017931 : mapNode_071725_017931.height ≤ 15 := by
  exact height_branch 8965 mapNode_071725_008965 mapNode_080690_008966
    14 14 height_mapNode_071725_008965 height_mapNode_080690_008966
theorem height_mapChunk_089656 : mapChunk_089656.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_090216 : mapChunk_090216.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_089656_001120 : mapNode_089656_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_089656 mapChunk_090216
    10 10 height_mapChunk_089656 height_mapChunk_090216
theorem height_mapChunk_090776 : mapChunk_090776.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_091336 : mapChunk_091336.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_090776_001121 : mapNode_090776_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_090776 mapChunk_091336
    10 10 height_mapChunk_090776 height_mapChunk_091336
theorem height_mapNode_089656_002241 : mapNode_089656_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_089656_001120 mapNode_090776_001121
    11 11 height_mapNode_089656_001120 height_mapNode_090776_001121
theorem height_mapChunk_091897 : mapChunk_091897.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_092457 : mapChunk_092457.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_091897_001120 : mapNode_091897_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_091897 mapChunk_092457
    10 10 height_mapChunk_091897 height_mapChunk_092457
theorem height_mapChunk_093017 : mapChunk_093017.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_093577 : mapChunk_093577.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_093017_001121 : mapNode_093017_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_093017 mapChunk_093577
    10 10 height_mapChunk_093017 height_mapChunk_093577
theorem height_mapNode_091897_002241 : mapNode_091897_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_091897_001120 mapNode_093017_001121
    11 11 height_mapNode_091897_001120 height_mapNode_093017_001121
theorem height_mapNode_089656_004482 : mapNode_089656_004482.height ≤ 13 := by
  exact height_branch 2241 mapNode_089656_002241 mapNode_091897_002241
    12 12 height_mapNode_089656_002241 height_mapNode_091897_002241
theorem height_mapChunk_094138 : mapChunk_094138.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_094698 : mapChunk_094698.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_094138_001120 : mapNode_094138_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_094138 mapChunk_094698
    10 10 height_mapChunk_094138 height_mapChunk_094698
theorem height_mapChunk_095258 : mapChunk_095258.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_095818 : mapChunk_095818.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_095258_001121 : mapNode_095258_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_095258 mapChunk_095818
    10 10 height_mapChunk_095258 height_mapChunk_095818
theorem height_mapNode_094138_002241 : mapNode_094138_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_094138_001120 mapNode_095258_001121
    11 11 height_mapNode_094138_001120 height_mapNode_095258_001121
theorem height_mapChunk_096379 : mapChunk_096379.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_096939 : mapChunk_096939.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_096379_001121 : mapNode_096379_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_096379 mapChunk_096939
    10 10 height_mapChunk_096379 height_mapChunk_096939
theorem height_mapChunk_097500 : mapChunk_097500.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_098060 : mapChunk_098060.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_097500_001121 : mapNode_097500_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_097500 mapChunk_098060
    10 10 height_mapChunk_097500 height_mapChunk_098060
theorem height_mapNode_096379_002242 : mapNode_096379_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_096379_001121 mapNode_097500_001121
    11 11 height_mapNode_096379_001121 height_mapNode_097500_001121
theorem height_mapNode_094138_004483 : mapNode_094138_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_094138_002241 mapNode_096379_002242
    12 12 height_mapNode_094138_002241 height_mapNode_096379_002242
theorem height_mapNode_089656_008965 : mapNode_089656_008965.height ≤ 14 := by
  exact height_branch 4482 mapNode_089656_004482 mapNode_094138_004483
    13 13 height_mapNode_089656_004482 height_mapNode_094138_004483
theorem height_mapChunk_098621 : mapChunk_098621.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_099181 : mapChunk_099181.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_098621_001120 : mapNode_098621_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_098621 mapChunk_099181
    10 10 height_mapChunk_098621 height_mapChunk_099181
theorem height_mapChunk_099741 : mapChunk_099741.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_100301 : mapChunk_100301.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_099741_001121 : mapNode_099741_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_099741 mapChunk_100301
    10 10 height_mapChunk_099741 height_mapChunk_100301
theorem height_mapNode_098621_002241 : mapNode_098621_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_098621_001120 mapNode_099741_001121
    11 11 height_mapNode_098621_001120 height_mapNode_099741_001121
theorem height_mapChunk_100862 : mapChunk_100862.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_101422 : mapChunk_101422.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_100862_001121 : mapNode_100862_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_100862 mapChunk_101422
    10 10 height_mapChunk_100862 height_mapChunk_101422
theorem height_mapChunk_101983 : mapChunk_101983.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_102543 : mapChunk_102543.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_101983_001121 : mapNode_101983_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_101983 mapChunk_102543
    10 10 height_mapChunk_101983 height_mapChunk_102543
theorem height_mapNode_100862_002242 : mapNode_100862_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_100862_001121 mapNode_101983_001121
    11 11 height_mapNode_100862_001121 height_mapNode_101983_001121
theorem height_mapNode_098621_004483 : mapNode_098621_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_098621_002241 mapNode_100862_002242
    12 12 height_mapNode_098621_002241 height_mapNode_100862_002242
theorem height_mapChunk_103104 : mapChunk_103104.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_103664 : mapChunk_103664.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_103104_001120 : mapNode_103104_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_103104 mapChunk_103664
    10 10 height_mapChunk_103104 height_mapChunk_103664
theorem height_mapChunk_104224 : mapChunk_104224.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_104784 : mapChunk_104784.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_104224_001121 : mapNode_104224_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_104224 mapChunk_104784
    10 10 height_mapChunk_104224 height_mapChunk_104784
theorem height_mapNode_103104_002241 : mapNode_103104_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_103104_001120 mapNode_104224_001121
    11 11 height_mapNode_103104_001120 height_mapNode_104224_001121
theorem height_mapChunk_105345 : mapChunk_105345.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_105905 : mapChunk_105905.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_105345_001121 : mapNode_105345_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_105345 mapChunk_105905
    10 10 height_mapChunk_105345 height_mapChunk_105905
theorem height_mapChunk_106466 : mapChunk_106466.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_107026 : mapChunk_107026.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_106466_001121 : mapNode_106466_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_106466 mapChunk_107026
    10 10 height_mapChunk_106466 height_mapChunk_107026
theorem height_mapNode_105345_002242 : mapNode_105345_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_105345_001121 mapNode_106466_001121
    11 11 height_mapNode_105345_001121 height_mapNode_106466_001121
theorem height_mapNode_103104_004483 : mapNode_103104_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_103104_002241 mapNode_105345_002242
    12 12 height_mapNode_103104_002241 height_mapNode_105345_002242
theorem height_mapNode_098621_008966 : mapNode_098621_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_098621_004483 mapNode_103104_004483
    13 13 height_mapNode_098621_004483 height_mapNode_103104_004483
theorem height_mapNode_089656_017931 : mapNode_089656_017931.height ≤ 15 := by
  exact height_branch 8965 mapNode_089656_008965 mapNode_098621_008966
    14 14 height_mapNode_089656_008965 height_mapNode_098621_008966
theorem height_mapNode_071725_035862 : mapNode_071725_035862.height ≤ 16 := by
  exact height_branch 17931 mapNode_071725_017931 mapNode_089656_017931
    15 15 height_mapNode_071725_017931 height_mapNode_089656_017931
theorem height_mapChunk_107587 : mapChunk_107587.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_108147 : mapChunk_108147.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_107587_001120 : mapNode_107587_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_107587 mapChunk_108147
    10 10 height_mapChunk_107587 height_mapChunk_108147
theorem height_mapChunk_108707 : mapChunk_108707.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_109267 : mapChunk_109267.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_108707_001121 : mapNode_108707_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_108707 mapChunk_109267
    10 10 height_mapChunk_108707 height_mapChunk_109267
theorem height_mapNode_107587_002241 : mapNode_107587_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_107587_001120 mapNode_108707_001121
    11 11 height_mapNode_107587_001120 height_mapNode_108707_001121
theorem height_mapChunk_109828 : mapChunk_109828.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_110388 : mapChunk_110388.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_109828_001120 : mapNode_109828_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_109828 mapChunk_110388
    10 10 height_mapChunk_109828 height_mapChunk_110388
theorem height_mapChunk_110948 : mapChunk_110948.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_111508 : mapChunk_111508.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_110948_001121 : mapNode_110948_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_110948 mapChunk_111508
    10 10 height_mapChunk_110948 height_mapChunk_111508
theorem height_mapNode_109828_002241 : mapNode_109828_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_109828_001120 mapNode_110948_001121
    11 11 height_mapNode_109828_001120 height_mapNode_110948_001121
theorem height_mapNode_107587_004482 : mapNode_107587_004482.height ≤ 13 := by
  exact height_branch 2241 mapNode_107587_002241 mapNode_109828_002241
    12 12 height_mapNode_107587_002241 height_mapNode_109828_002241
theorem height_mapChunk_112069 : mapChunk_112069.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_112629 : mapChunk_112629.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_112069_001120 : mapNode_112069_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_112069 mapChunk_112629
    10 10 height_mapChunk_112069 height_mapChunk_112629
theorem height_mapChunk_113189 : mapChunk_113189.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_113749 : mapChunk_113749.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_113189_001121 : mapNode_113189_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_113189 mapChunk_113749
    10 10 height_mapChunk_113189 height_mapChunk_113749
theorem height_mapNode_112069_002241 : mapNode_112069_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_112069_001120 mapNode_113189_001121
    11 11 height_mapNode_112069_001120 height_mapNode_113189_001121
theorem height_mapChunk_114310 : mapChunk_114310.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_114870 : mapChunk_114870.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_114310_001121 : mapNode_114310_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_114310 mapChunk_114870
    10 10 height_mapChunk_114310 height_mapChunk_114870
theorem height_mapChunk_115431 : mapChunk_115431.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_115991 : mapChunk_115991.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_115431_001121 : mapNode_115431_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_115431 mapChunk_115991
    10 10 height_mapChunk_115431 height_mapChunk_115991
theorem height_mapNode_114310_002242 : mapNode_114310_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_114310_001121 mapNode_115431_001121
    11 11 height_mapNode_114310_001121 height_mapNode_115431_001121
theorem height_mapNode_112069_004483 : mapNode_112069_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_112069_002241 mapNode_114310_002242
    12 12 height_mapNode_112069_002241 height_mapNode_114310_002242
theorem height_mapNode_107587_008965 : mapNode_107587_008965.height ≤ 14 := by
  exact height_branch 4482 mapNode_107587_004482 mapNode_112069_004483
    13 13 height_mapNode_107587_004482 height_mapNode_112069_004483
theorem height_mapChunk_116552 : mapChunk_116552.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_117112 : mapChunk_117112.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_116552_001120 : mapNode_116552_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_116552 mapChunk_117112
    10 10 height_mapChunk_116552 height_mapChunk_117112
theorem height_mapChunk_117672 : mapChunk_117672.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_118232 : mapChunk_118232.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_117672_001121 : mapNode_117672_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_117672 mapChunk_118232
    10 10 height_mapChunk_117672 height_mapChunk_118232
theorem height_mapNode_116552_002241 : mapNode_116552_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_116552_001120 mapNode_117672_001121
    11 11 height_mapNode_116552_001120 height_mapNode_117672_001121
theorem height_mapChunk_118793 : mapChunk_118793.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_119353 : mapChunk_119353.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_118793_001121 : mapNode_118793_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_118793 mapChunk_119353
    10 10 height_mapChunk_118793 height_mapChunk_119353
theorem height_mapChunk_119914 : mapChunk_119914.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_120474 : mapChunk_120474.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_119914_001121 : mapNode_119914_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_119914 mapChunk_120474
    10 10 height_mapChunk_119914 height_mapChunk_120474
theorem height_mapNode_118793_002242 : mapNode_118793_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_118793_001121 mapNode_119914_001121
    11 11 height_mapNode_118793_001121 height_mapNode_119914_001121
theorem height_mapNode_116552_004483 : mapNode_116552_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_116552_002241 mapNode_118793_002242
    12 12 height_mapNode_116552_002241 height_mapNode_118793_002242
theorem height_mapChunk_121035 : mapChunk_121035.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_121595 : mapChunk_121595.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_121035_001120 : mapNode_121035_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_121035 mapChunk_121595
    10 10 height_mapChunk_121035 height_mapChunk_121595
theorem height_mapChunk_122155 : mapChunk_122155.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_122715 : mapChunk_122715.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_122155_001121 : mapNode_122155_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_122155 mapChunk_122715
    10 10 height_mapChunk_122155 height_mapChunk_122715
theorem height_mapNode_121035_002241 : mapNode_121035_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_121035_001120 mapNode_122155_001121
    11 11 height_mapNode_121035_001120 height_mapNode_122155_001121
theorem height_mapChunk_123276 : mapChunk_123276.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_123836 : mapChunk_123836.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_123276_001121 : mapNode_123276_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_123276 mapChunk_123836
    10 10 height_mapChunk_123276 height_mapChunk_123836
theorem height_mapChunk_124397 : mapChunk_124397.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_124957 : mapChunk_124957.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_124397_001121 : mapNode_124397_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_124397 mapChunk_124957
    10 10 height_mapChunk_124397 height_mapChunk_124957
theorem height_mapNode_123276_002242 : mapNode_123276_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_123276_001121 mapNode_124397_001121
    11 11 height_mapNode_123276_001121 height_mapNode_124397_001121
theorem height_mapNode_121035_004483 : mapNode_121035_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_121035_002241 mapNode_123276_002242
    12 12 height_mapNode_121035_002241 height_mapNode_123276_002242
theorem height_mapNode_116552_008966 : mapNode_116552_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_116552_004483 mapNode_121035_004483
    13 13 height_mapNode_116552_004483 height_mapNode_121035_004483
theorem height_mapNode_107587_017931 : mapNode_107587_017931.height ≤ 15 := by
  exact height_branch 8965 mapNode_107587_008965 mapNode_116552_008966
    14 14 height_mapNode_107587_008965 height_mapNode_116552_008966
theorem height_mapChunk_125518 : mapChunk_125518.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_126078 : mapChunk_126078.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_125518_001120 : mapNode_125518_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_125518 mapChunk_126078
    10 10 height_mapChunk_125518 height_mapChunk_126078
theorem height_mapChunk_126638 : mapChunk_126638.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_127198 : mapChunk_127198.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_126638_001121 : mapNode_126638_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_126638 mapChunk_127198
    10 10 height_mapChunk_126638 height_mapChunk_127198
theorem height_mapNode_125518_002241 : mapNode_125518_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_125518_001120 mapNode_126638_001121
    11 11 height_mapNode_125518_001120 height_mapNode_126638_001121
theorem height_mapChunk_127759 : mapChunk_127759.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_128319 : mapChunk_128319.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_127759_001121 : mapNode_127759_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_127759 mapChunk_128319
    10 10 height_mapChunk_127759 height_mapChunk_128319
theorem height_mapChunk_128880 : mapChunk_128880.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_129440 : mapChunk_129440.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_128880_001121 : mapNode_128880_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_128880 mapChunk_129440
    10 10 height_mapChunk_128880 height_mapChunk_129440
theorem height_mapNode_127759_002242 : mapNode_127759_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_127759_001121 mapNode_128880_001121
    11 11 height_mapNode_127759_001121 height_mapNode_128880_001121
theorem height_mapNode_125518_004483 : mapNode_125518_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_125518_002241 mapNode_127759_002242
    12 12 height_mapNode_125518_002241 height_mapNode_127759_002242
theorem height_mapChunk_130001 : mapChunk_130001.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_130561 : mapChunk_130561.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_130001_001120 : mapNode_130001_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_130001 mapChunk_130561
    10 10 height_mapChunk_130001 height_mapChunk_130561
theorem height_mapChunk_131121 : mapChunk_131121.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_131681 : mapChunk_131681.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_131121_001121 : mapNode_131121_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_131121 mapChunk_131681
    10 10 height_mapChunk_131121 height_mapChunk_131681
theorem height_mapNode_130001_002241 : mapNode_130001_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_130001_001120 mapNode_131121_001121
    11 11 height_mapNode_130001_001120 height_mapNode_131121_001121
theorem height_mapChunk_132242 : mapChunk_132242.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_132802 : mapChunk_132802.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_132242_001121 : mapNode_132242_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_132242 mapChunk_132802
    10 10 height_mapChunk_132242 height_mapChunk_132802
theorem height_mapChunk_133363 : mapChunk_133363.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_133923 : mapChunk_133923.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_133363_001121 : mapNode_133363_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_133363 mapChunk_133923
    10 10 height_mapChunk_133363 height_mapChunk_133923
theorem height_mapNode_132242_002242 : mapNode_132242_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_132242_001121 mapNode_133363_001121
    11 11 height_mapNode_132242_001121 height_mapNode_133363_001121
theorem height_mapNode_130001_004483 : mapNode_130001_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_130001_002241 mapNode_132242_002242
    12 12 height_mapNode_130001_002241 height_mapNode_132242_002242
theorem height_mapNode_125518_008966 : mapNode_125518_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_125518_004483 mapNode_130001_004483
    13 13 height_mapNode_125518_004483 height_mapNode_130001_004483
theorem height_mapChunk_134484 : mapChunk_134484.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_135044 : mapChunk_135044.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_134484_001120 : mapNode_134484_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_134484 mapChunk_135044
    10 10 height_mapChunk_134484 height_mapChunk_135044
theorem height_mapChunk_135604 : mapChunk_135604.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_136164 : mapChunk_136164.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_135604_001121 : mapNode_135604_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_135604 mapChunk_136164
    10 10 height_mapChunk_135604 height_mapChunk_136164
theorem height_mapNode_134484_002241 : mapNode_134484_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_134484_001120 mapNode_135604_001121
    11 11 height_mapNode_134484_001120 height_mapNode_135604_001121
theorem height_mapChunk_136725 : mapChunk_136725.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_137285 : mapChunk_137285.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_136725_001121 : mapNode_136725_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_136725 mapChunk_137285
    10 10 height_mapChunk_136725 height_mapChunk_137285
theorem height_mapChunk_137846 : mapChunk_137846.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_138406 : mapChunk_138406.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_137846_001121 : mapNode_137846_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_137846 mapChunk_138406
    10 10 height_mapChunk_137846 height_mapChunk_138406
theorem height_mapNode_136725_002242 : mapNode_136725_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_136725_001121 mapNode_137846_001121
    11 11 height_mapNode_136725_001121 height_mapNode_137846_001121
theorem height_mapNode_134484_004483 : mapNode_134484_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_134484_002241 mapNode_136725_002242
    12 12 height_mapNode_134484_002241 height_mapNode_136725_002242
theorem height_mapChunk_138967 : mapChunk_138967.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_139527 : mapChunk_139527.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_138967_001120 : mapNode_138967_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_138967 mapChunk_139527
    10 10 height_mapChunk_138967 height_mapChunk_139527
theorem height_mapChunk_140087 : mapChunk_140087.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_140647 : mapChunk_140647.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_140087_001121 : mapNode_140087_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_140087 mapChunk_140647
    10 10 height_mapChunk_140087 height_mapChunk_140647
theorem height_mapNode_138967_002241 : mapNode_138967_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_138967_001120 mapNode_140087_001121
    11 11 height_mapNode_138967_001120 height_mapNode_140087_001121
theorem height_mapChunk_141208 : mapChunk_141208.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_141768 : mapChunk_141768.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_141208_001121 : mapNode_141208_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_141208 mapChunk_141768
    10 10 height_mapChunk_141208 height_mapChunk_141768
theorem height_mapChunk_142329 : mapChunk_142329.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_142889 : mapChunk_142889.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_142329_001121 : mapNode_142329_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_142329 mapChunk_142889
    10 10 height_mapChunk_142329 height_mapChunk_142889
theorem height_mapNode_141208_002242 : mapNode_141208_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_141208_001121 mapNode_142329_001121
    11 11 height_mapNode_141208_001121 height_mapNode_142329_001121
theorem height_mapNode_138967_004483 : mapNode_138967_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_138967_002241 mapNode_141208_002242
    12 12 height_mapNode_138967_002241 height_mapNode_141208_002242
theorem height_mapNode_134484_008966 : mapNode_134484_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_134484_004483 mapNode_138967_004483
    13 13 height_mapNode_134484_004483 height_mapNode_138967_004483
theorem height_mapNode_125518_017932 : mapNode_125518_017932.height ≤ 15 := by
  exact height_branch 8966 mapNode_125518_008966 mapNode_134484_008966
    14 14 height_mapNode_125518_008966 height_mapNode_134484_008966
theorem height_mapNode_107587_035863 : mapNode_107587_035863.height ≤ 16 := by
  exact height_branch 17931 mapNode_107587_017931 mapNode_125518_017932
    15 15 height_mapNode_107587_017931 height_mapNode_125518_017932
theorem height_mapNode_071725_071725 : mapNode_071725_071725.height ≤ 17 := by
  exact height_branch 35862 mapNode_071725_035862 mapNode_107587_035863
    16 16 height_mapNode_071725_035862 height_mapNode_107587_035863
theorem height_mapNode_000000_143450 : mapNode_000000_143450.height ≤ 18 := by
  exact height_branch 71725 mapNode_000000_071725 mapNode_071725_071725
    17 17 height_mapNode_000000_071725 height_mapNode_071725_071725
theorem height_mapChunk_143450 : mapChunk_143450.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_144010 : mapChunk_144010.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_143450_001120 : mapNode_143450_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_143450 mapChunk_144010
    10 10 height_mapChunk_143450 height_mapChunk_144010
theorem height_mapChunk_144570 : mapChunk_144570.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_145130 : mapChunk_145130.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_144570_001121 : mapNode_144570_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_144570 mapChunk_145130
    10 10 height_mapChunk_144570 height_mapChunk_145130
theorem height_mapNode_143450_002241 : mapNode_143450_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_143450_001120 mapNode_144570_001121
    11 11 height_mapNode_143450_001120 height_mapNode_144570_001121
theorem height_mapChunk_145691 : mapChunk_145691.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_146251 : mapChunk_146251.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_145691_001120 : mapNode_145691_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_145691 mapChunk_146251
    10 10 height_mapChunk_145691 height_mapChunk_146251
theorem height_mapChunk_146811 : mapChunk_146811.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_147371 : mapChunk_147371.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_146811_001121 : mapNode_146811_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_146811 mapChunk_147371
    10 10 height_mapChunk_146811 height_mapChunk_147371
theorem height_mapNode_145691_002241 : mapNode_145691_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_145691_001120 mapNode_146811_001121
    11 11 height_mapNode_145691_001120 height_mapNode_146811_001121
theorem height_mapNode_143450_004482 : mapNode_143450_004482.height ≤ 13 := by
  exact height_branch 2241 mapNode_143450_002241 mapNode_145691_002241
    12 12 height_mapNode_143450_002241 height_mapNode_145691_002241
theorem height_mapChunk_147932 : mapChunk_147932.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_148492 : mapChunk_148492.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_147932_001120 : mapNode_147932_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_147932 mapChunk_148492
    10 10 height_mapChunk_147932 height_mapChunk_148492
theorem height_mapChunk_149052 : mapChunk_149052.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_149612 : mapChunk_149612.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_149052_001121 : mapNode_149052_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_149052 mapChunk_149612
    10 10 height_mapChunk_149052 height_mapChunk_149612
theorem height_mapNode_147932_002241 : mapNode_147932_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_147932_001120 mapNode_149052_001121
    11 11 height_mapNode_147932_001120 height_mapNode_149052_001121
theorem height_mapChunk_150173 : mapChunk_150173.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_150733 : mapChunk_150733.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_150173_001121 : mapNode_150173_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_150173 mapChunk_150733
    10 10 height_mapChunk_150173 height_mapChunk_150733
theorem height_mapChunk_151294 : mapChunk_151294.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_151854 : mapChunk_151854.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_151294_001121 : mapNode_151294_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_151294 mapChunk_151854
    10 10 height_mapChunk_151294 height_mapChunk_151854
theorem height_mapNode_150173_002242 : mapNode_150173_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_150173_001121 mapNode_151294_001121
    11 11 height_mapNode_150173_001121 height_mapNode_151294_001121
theorem height_mapNode_147932_004483 : mapNode_147932_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_147932_002241 mapNode_150173_002242
    12 12 height_mapNode_147932_002241 height_mapNode_150173_002242
theorem height_mapNode_143450_008965 : mapNode_143450_008965.height ≤ 14 := by
  exact height_branch 4482 mapNode_143450_004482 mapNode_147932_004483
    13 13 height_mapNode_143450_004482 height_mapNode_147932_004483
theorem height_mapChunk_152415 : mapChunk_152415.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_152975 : mapChunk_152975.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_152415_001120 : mapNode_152415_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_152415 mapChunk_152975
    10 10 height_mapChunk_152415 height_mapChunk_152975
theorem height_mapChunk_153535 : mapChunk_153535.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_154095 : mapChunk_154095.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_153535_001121 : mapNode_153535_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_153535 mapChunk_154095
    10 10 height_mapChunk_153535 height_mapChunk_154095
theorem height_mapNode_152415_002241 : mapNode_152415_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_152415_001120 mapNode_153535_001121
    11 11 height_mapNode_152415_001120 height_mapNode_153535_001121
theorem height_mapChunk_154656 : mapChunk_154656.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_155216 : mapChunk_155216.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_154656_001121 : mapNode_154656_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_154656 mapChunk_155216
    10 10 height_mapChunk_154656 height_mapChunk_155216
theorem height_mapChunk_155777 : mapChunk_155777.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_156337 : mapChunk_156337.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_155777_001121 : mapNode_155777_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_155777 mapChunk_156337
    10 10 height_mapChunk_155777 height_mapChunk_156337
theorem height_mapNode_154656_002242 : mapNode_154656_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_154656_001121 mapNode_155777_001121
    11 11 height_mapNode_154656_001121 height_mapNode_155777_001121
theorem height_mapNode_152415_004483 : mapNode_152415_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_152415_002241 mapNode_154656_002242
    12 12 height_mapNode_152415_002241 height_mapNode_154656_002242
theorem height_mapChunk_156898 : mapChunk_156898.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_157458 : mapChunk_157458.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_156898_001120 : mapNode_156898_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_156898 mapChunk_157458
    10 10 height_mapChunk_156898 height_mapChunk_157458
theorem height_mapChunk_158018 : mapChunk_158018.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_158578 : mapChunk_158578.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_158018_001121 : mapNode_158018_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_158018 mapChunk_158578
    10 10 height_mapChunk_158018 height_mapChunk_158578
theorem height_mapNode_156898_002241 : mapNode_156898_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_156898_001120 mapNode_158018_001121
    11 11 height_mapNode_156898_001120 height_mapNode_158018_001121
theorem height_mapChunk_159139 : mapChunk_159139.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_159699 : mapChunk_159699.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_159139_001121 : mapNode_159139_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_159139 mapChunk_159699
    10 10 height_mapChunk_159139 height_mapChunk_159699
theorem height_mapChunk_160260 : mapChunk_160260.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_160820 : mapChunk_160820.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_160260_001121 : mapNode_160260_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_160260 mapChunk_160820
    10 10 height_mapChunk_160260 height_mapChunk_160820
theorem height_mapNode_159139_002242 : mapNode_159139_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_159139_001121 mapNode_160260_001121
    11 11 height_mapNode_159139_001121 height_mapNode_160260_001121
theorem height_mapNode_156898_004483 : mapNode_156898_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_156898_002241 mapNode_159139_002242
    12 12 height_mapNode_156898_002241 height_mapNode_159139_002242
theorem height_mapNode_152415_008966 : mapNode_152415_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_152415_004483 mapNode_156898_004483
    13 13 height_mapNode_152415_004483 height_mapNode_156898_004483
theorem height_mapNode_143450_017931 : mapNode_143450_017931.height ≤ 15 := by
  exact height_branch 8965 mapNode_143450_008965 mapNode_152415_008966
    14 14 height_mapNode_143450_008965 height_mapNode_152415_008966
theorem height_mapChunk_161381 : mapChunk_161381.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_161941 : mapChunk_161941.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_161381_001120 : mapNode_161381_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_161381 mapChunk_161941
    10 10 height_mapChunk_161381 height_mapChunk_161941
theorem height_mapChunk_162501 : mapChunk_162501.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_163061 : mapChunk_163061.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_162501_001121 : mapNode_162501_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_162501 mapChunk_163061
    10 10 height_mapChunk_162501 height_mapChunk_163061
theorem height_mapNode_161381_002241 : mapNode_161381_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_161381_001120 mapNode_162501_001121
    11 11 height_mapNode_161381_001120 height_mapNode_162501_001121
theorem height_mapChunk_163622 : mapChunk_163622.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_164182 : mapChunk_164182.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_163622_001120 : mapNode_163622_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_163622 mapChunk_164182
    10 10 height_mapChunk_163622 height_mapChunk_164182
theorem height_mapChunk_164742 : mapChunk_164742.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_165302 : mapChunk_165302.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_164742_001121 : mapNode_164742_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_164742 mapChunk_165302
    10 10 height_mapChunk_164742 height_mapChunk_165302
theorem height_mapNode_163622_002241 : mapNode_163622_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_163622_001120 mapNode_164742_001121
    11 11 height_mapNode_163622_001120 height_mapNode_164742_001121
theorem height_mapNode_161381_004482 : mapNode_161381_004482.height ≤ 13 := by
  exact height_branch 2241 mapNode_161381_002241 mapNode_163622_002241
    12 12 height_mapNode_161381_002241 height_mapNode_163622_002241
theorem height_mapChunk_165863 : mapChunk_165863.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_166423 : mapChunk_166423.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_165863_001120 : mapNode_165863_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_165863 mapChunk_166423
    10 10 height_mapChunk_165863 height_mapChunk_166423
theorem height_mapChunk_166983 : mapChunk_166983.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_167543 : mapChunk_167543.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_166983_001121 : mapNode_166983_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_166983 mapChunk_167543
    10 10 height_mapChunk_166983 height_mapChunk_167543
theorem height_mapNode_165863_002241 : mapNode_165863_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_165863_001120 mapNode_166983_001121
    11 11 height_mapNode_165863_001120 height_mapNode_166983_001121
theorem height_mapChunk_168104 : mapChunk_168104.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_168664 : mapChunk_168664.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_168104_001121 : mapNode_168104_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_168104 mapChunk_168664
    10 10 height_mapChunk_168104 height_mapChunk_168664
theorem height_mapChunk_169225 : mapChunk_169225.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_169785 : mapChunk_169785.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_169225_001121 : mapNode_169225_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_169225 mapChunk_169785
    10 10 height_mapChunk_169225 height_mapChunk_169785
theorem height_mapNode_168104_002242 : mapNode_168104_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_168104_001121 mapNode_169225_001121
    11 11 height_mapNode_168104_001121 height_mapNode_169225_001121
theorem height_mapNode_165863_004483 : mapNode_165863_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_165863_002241 mapNode_168104_002242
    12 12 height_mapNode_165863_002241 height_mapNode_168104_002242
theorem height_mapNode_161381_008965 : mapNode_161381_008965.height ≤ 14 := by
  exact height_branch 4482 mapNode_161381_004482 mapNode_165863_004483
    13 13 height_mapNode_161381_004482 height_mapNode_165863_004483
theorem height_mapChunk_170346 : mapChunk_170346.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_170906 : mapChunk_170906.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_170346_001120 : mapNode_170346_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_170346 mapChunk_170906
    10 10 height_mapChunk_170346 height_mapChunk_170906
theorem height_mapChunk_171466 : mapChunk_171466.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_172026 : mapChunk_172026.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_171466_001121 : mapNode_171466_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_171466 mapChunk_172026
    10 10 height_mapChunk_171466 height_mapChunk_172026
theorem height_mapNode_170346_002241 : mapNode_170346_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_170346_001120 mapNode_171466_001121
    11 11 height_mapNode_170346_001120 height_mapNode_171466_001121
theorem height_mapChunk_172587 : mapChunk_172587.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_173147 : mapChunk_173147.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_172587_001121 : mapNode_172587_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_172587 mapChunk_173147
    10 10 height_mapChunk_172587 height_mapChunk_173147
theorem height_mapChunk_173708 : mapChunk_173708.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_174268 : mapChunk_174268.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_173708_001121 : mapNode_173708_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_173708 mapChunk_174268
    10 10 height_mapChunk_173708 height_mapChunk_174268
theorem height_mapNode_172587_002242 : mapNode_172587_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_172587_001121 mapNode_173708_001121
    11 11 height_mapNode_172587_001121 height_mapNode_173708_001121
theorem height_mapNode_170346_004483 : mapNode_170346_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_170346_002241 mapNode_172587_002242
    12 12 height_mapNode_170346_002241 height_mapNode_172587_002242
theorem height_mapChunk_174829 : mapChunk_174829.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_175389 : mapChunk_175389.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_174829_001120 : mapNode_174829_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_174829 mapChunk_175389
    10 10 height_mapChunk_174829 height_mapChunk_175389
theorem height_mapChunk_175949 : mapChunk_175949.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_176509 : mapChunk_176509.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_175949_001121 : mapNode_175949_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_175949 mapChunk_176509
    10 10 height_mapChunk_175949 height_mapChunk_176509
theorem height_mapNode_174829_002241 : mapNode_174829_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_174829_001120 mapNode_175949_001121
    11 11 height_mapNode_174829_001120 height_mapNode_175949_001121
theorem height_mapChunk_177070 : mapChunk_177070.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_177630 : mapChunk_177630.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_177070_001121 : mapNode_177070_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_177070 mapChunk_177630
    10 10 height_mapChunk_177070 height_mapChunk_177630
theorem height_mapChunk_178191 : mapChunk_178191.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_178751 : mapChunk_178751.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_178191_001121 : mapNode_178191_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_178191 mapChunk_178751
    10 10 height_mapChunk_178191 height_mapChunk_178751
theorem height_mapNode_177070_002242 : mapNode_177070_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_177070_001121 mapNode_178191_001121
    11 11 height_mapNode_177070_001121 height_mapNode_178191_001121
theorem height_mapNode_174829_004483 : mapNode_174829_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_174829_002241 mapNode_177070_002242
    12 12 height_mapNode_174829_002241 height_mapNode_177070_002242
theorem height_mapNode_170346_008966 : mapNode_170346_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_170346_004483 mapNode_174829_004483
    13 13 height_mapNode_170346_004483 height_mapNode_174829_004483
theorem height_mapNode_161381_017931 : mapNode_161381_017931.height ≤ 15 := by
  exact height_branch 8965 mapNode_161381_008965 mapNode_170346_008966
    14 14 height_mapNode_161381_008965 height_mapNode_170346_008966
theorem height_mapNode_143450_035862 : mapNode_143450_035862.height ≤ 16 := by
  exact height_branch 17931 mapNode_143450_017931 mapNode_161381_017931
    15 15 height_mapNode_143450_017931 height_mapNode_161381_017931
theorem height_mapChunk_179312 : mapChunk_179312.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_179872 : mapChunk_179872.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_179312_001120 : mapNode_179312_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_179312 mapChunk_179872
    10 10 height_mapChunk_179312 height_mapChunk_179872
theorem height_mapChunk_180432 : mapChunk_180432.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_180992 : mapChunk_180992.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_180432_001121 : mapNode_180432_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_180432 mapChunk_180992
    10 10 height_mapChunk_180432 height_mapChunk_180992
theorem height_mapNode_179312_002241 : mapNode_179312_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_179312_001120 mapNode_180432_001121
    11 11 height_mapNode_179312_001120 height_mapNode_180432_001121
theorem height_mapChunk_181553 : mapChunk_181553.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_182113 : mapChunk_182113.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_181553_001120 : mapNode_181553_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_181553 mapChunk_182113
    10 10 height_mapChunk_181553 height_mapChunk_182113
theorem height_mapChunk_182673 : mapChunk_182673.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_183233 : mapChunk_183233.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_182673_001121 : mapNode_182673_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_182673 mapChunk_183233
    10 10 height_mapChunk_182673 height_mapChunk_183233
theorem height_mapNode_181553_002241 : mapNode_181553_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_181553_001120 mapNode_182673_001121
    11 11 height_mapNode_181553_001120 height_mapNode_182673_001121
theorem height_mapNode_179312_004482 : mapNode_179312_004482.height ≤ 13 := by
  exact height_branch 2241 mapNode_179312_002241 mapNode_181553_002241
    12 12 height_mapNode_179312_002241 height_mapNode_181553_002241
theorem height_mapChunk_183794 : mapChunk_183794.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_184354 : mapChunk_184354.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_183794_001120 : mapNode_183794_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_183794 mapChunk_184354
    10 10 height_mapChunk_183794 height_mapChunk_184354
theorem height_mapChunk_184914 : mapChunk_184914.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_185474 : mapChunk_185474.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_184914_001121 : mapNode_184914_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_184914 mapChunk_185474
    10 10 height_mapChunk_184914 height_mapChunk_185474
theorem height_mapNode_183794_002241 : mapNode_183794_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_183794_001120 mapNode_184914_001121
    11 11 height_mapNode_183794_001120 height_mapNode_184914_001121
theorem height_mapChunk_186035 : mapChunk_186035.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_186595 : mapChunk_186595.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_186035_001121 : mapNode_186035_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_186035 mapChunk_186595
    10 10 height_mapChunk_186035 height_mapChunk_186595
theorem height_mapChunk_187156 : mapChunk_187156.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_187716 : mapChunk_187716.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_187156_001121 : mapNode_187156_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_187156 mapChunk_187716
    10 10 height_mapChunk_187156 height_mapChunk_187716
theorem height_mapNode_186035_002242 : mapNode_186035_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_186035_001121 mapNode_187156_001121
    11 11 height_mapNode_186035_001121 height_mapNode_187156_001121
theorem height_mapNode_183794_004483 : mapNode_183794_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_183794_002241 mapNode_186035_002242
    12 12 height_mapNode_183794_002241 height_mapNode_186035_002242
theorem height_mapNode_179312_008965 : mapNode_179312_008965.height ≤ 14 := by
  exact height_branch 4482 mapNode_179312_004482 mapNode_183794_004483
    13 13 height_mapNode_179312_004482 height_mapNode_183794_004483
theorem height_mapChunk_188277 : mapChunk_188277.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_188837 : mapChunk_188837.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_188277_001120 : mapNode_188277_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_188277 mapChunk_188837
    10 10 height_mapChunk_188277 height_mapChunk_188837
theorem height_mapChunk_189397 : mapChunk_189397.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_189957 : mapChunk_189957.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_189397_001121 : mapNode_189397_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_189397 mapChunk_189957
    10 10 height_mapChunk_189397 height_mapChunk_189957
theorem height_mapNode_188277_002241 : mapNode_188277_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_188277_001120 mapNode_189397_001121
    11 11 height_mapNode_188277_001120 height_mapNode_189397_001121
theorem height_mapChunk_190518 : mapChunk_190518.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_191078 : mapChunk_191078.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_190518_001121 : mapNode_190518_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_190518 mapChunk_191078
    10 10 height_mapChunk_190518 height_mapChunk_191078
theorem height_mapChunk_191639 : mapChunk_191639.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_192199 : mapChunk_192199.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_191639_001121 : mapNode_191639_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_191639 mapChunk_192199
    10 10 height_mapChunk_191639 height_mapChunk_192199
theorem height_mapNode_190518_002242 : mapNode_190518_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_190518_001121 mapNode_191639_001121
    11 11 height_mapNode_190518_001121 height_mapNode_191639_001121
theorem height_mapNode_188277_004483 : mapNode_188277_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_188277_002241 mapNode_190518_002242
    12 12 height_mapNode_188277_002241 height_mapNode_190518_002242
theorem height_mapChunk_192760 : mapChunk_192760.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_193320 : mapChunk_193320.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_192760_001120 : mapNode_192760_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_192760 mapChunk_193320
    10 10 height_mapChunk_192760 height_mapChunk_193320
theorem height_mapChunk_193880 : mapChunk_193880.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_194440 : mapChunk_194440.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_193880_001121 : mapNode_193880_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_193880 mapChunk_194440
    10 10 height_mapChunk_193880 height_mapChunk_194440
theorem height_mapNode_192760_002241 : mapNode_192760_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_192760_001120 mapNode_193880_001121
    11 11 height_mapNode_192760_001120 height_mapNode_193880_001121
theorem height_mapChunk_195001 : mapChunk_195001.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_195561 : mapChunk_195561.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_195001_001121 : mapNode_195001_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_195001 mapChunk_195561
    10 10 height_mapChunk_195001 height_mapChunk_195561
theorem height_mapChunk_196122 : mapChunk_196122.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_196682 : mapChunk_196682.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_196122_001121 : mapNode_196122_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_196122 mapChunk_196682
    10 10 height_mapChunk_196122 height_mapChunk_196682
theorem height_mapNode_195001_002242 : mapNode_195001_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_195001_001121 mapNode_196122_001121
    11 11 height_mapNode_195001_001121 height_mapNode_196122_001121
theorem height_mapNode_192760_004483 : mapNode_192760_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_192760_002241 mapNode_195001_002242
    12 12 height_mapNode_192760_002241 height_mapNode_195001_002242
theorem height_mapNode_188277_008966 : mapNode_188277_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_188277_004483 mapNode_192760_004483
    13 13 height_mapNode_188277_004483 height_mapNode_192760_004483
theorem height_mapNode_179312_017931 : mapNode_179312_017931.height ≤ 15 := by
  exact height_branch 8965 mapNode_179312_008965 mapNode_188277_008966
    14 14 height_mapNode_179312_008965 height_mapNode_188277_008966
theorem height_mapChunk_197243 : mapChunk_197243.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_197803 : mapChunk_197803.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_197243_001120 : mapNode_197243_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_197243 mapChunk_197803
    10 10 height_mapChunk_197243 height_mapChunk_197803
theorem height_mapChunk_198363 : mapChunk_198363.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_198923 : mapChunk_198923.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_198363_001121 : mapNode_198363_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_198363 mapChunk_198923
    10 10 height_mapChunk_198363 height_mapChunk_198923
theorem height_mapNode_197243_002241 : mapNode_197243_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_197243_001120 mapNode_198363_001121
    11 11 height_mapNode_197243_001120 height_mapNode_198363_001121
theorem height_mapChunk_199484 : mapChunk_199484.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_200044 : mapChunk_200044.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_199484_001121 : mapNode_199484_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_199484 mapChunk_200044
    10 10 height_mapChunk_199484 height_mapChunk_200044
theorem height_mapChunk_200605 : mapChunk_200605.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_201165 : mapChunk_201165.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_200605_001121 : mapNode_200605_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_200605 mapChunk_201165
    10 10 height_mapChunk_200605 height_mapChunk_201165
theorem height_mapNode_199484_002242 : mapNode_199484_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_199484_001121 mapNode_200605_001121
    11 11 height_mapNode_199484_001121 height_mapNode_200605_001121
theorem height_mapNode_197243_004483 : mapNode_197243_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_197243_002241 mapNode_199484_002242
    12 12 height_mapNode_197243_002241 height_mapNode_199484_002242
theorem height_mapChunk_201726 : mapChunk_201726.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_202286 : mapChunk_202286.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_201726_001120 : mapNode_201726_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_201726 mapChunk_202286
    10 10 height_mapChunk_201726 height_mapChunk_202286
theorem height_mapChunk_202846 : mapChunk_202846.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_203406 : mapChunk_203406.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_202846_001121 : mapNode_202846_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_202846 mapChunk_203406
    10 10 height_mapChunk_202846 height_mapChunk_203406
theorem height_mapNode_201726_002241 : mapNode_201726_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_201726_001120 mapNode_202846_001121
    11 11 height_mapNode_201726_001120 height_mapNode_202846_001121
theorem height_mapChunk_203967 : mapChunk_203967.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_204527 : mapChunk_204527.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_203967_001121 : mapNode_203967_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_203967 mapChunk_204527
    10 10 height_mapChunk_203967 height_mapChunk_204527
theorem height_mapChunk_205088 : mapChunk_205088.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_205648 : mapChunk_205648.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_205088_001121 : mapNode_205088_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_205088 mapChunk_205648
    10 10 height_mapChunk_205088 height_mapChunk_205648
theorem height_mapNode_203967_002242 : mapNode_203967_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_203967_001121 mapNode_205088_001121
    11 11 height_mapNode_203967_001121 height_mapNode_205088_001121
theorem height_mapNode_201726_004483 : mapNode_201726_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_201726_002241 mapNode_203967_002242
    12 12 height_mapNode_201726_002241 height_mapNode_203967_002242
theorem height_mapNode_197243_008966 : mapNode_197243_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_197243_004483 mapNode_201726_004483
    13 13 height_mapNode_197243_004483 height_mapNode_201726_004483
theorem height_mapChunk_206209 : mapChunk_206209.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_206769 : mapChunk_206769.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_206209_001120 : mapNode_206209_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_206209 mapChunk_206769
    10 10 height_mapChunk_206209 height_mapChunk_206769
theorem height_mapChunk_207329 : mapChunk_207329.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_207889 : mapChunk_207889.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_207329_001121 : mapNode_207329_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_207329 mapChunk_207889
    10 10 height_mapChunk_207329 height_mapChunk_207889
theorem height_mapNode_206209_002241 : mapNode_206209_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_206209_001120 mapNode_207329_001121
    11 11 height_mapNode_206209_001120 height_mapNode_207329_001121
theorem height_mapChunk_208450 : mapChunk_208450.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_209010 : mapChunk_209010.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_208450_001121 : mapNode_208450_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_208450 mapChunk_209010
    10 10 height_mapChunk_208450 height_mapChunk_209010
theorem height_mapChunk_209571 : mapChunk_209571.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_210131 : mapChunk_210131.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_209571_001121 : mapNode_209571_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_209571 mapChunk_210131
    10 10 height_mapChunk_209571 height_mapChunk_210131
theorem height_mapNode_208450_002242 : mapNode_208450_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_208450_001121 mapNode_209571_001121
    11 11 height_mapNode_208450_001121 height_mapNode_209571_001121
theorem height_mapNode_206209_004483 : mapNode_206209_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_206209_002241 mapNode_208450_002242
    12 12 height_mapNode_206209_002241 height_mapNode_208450_002242
theorem height_mapChunk_210692 : mapChunk_210692.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_211252 : mapChunk_211252.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_210692_001120 : mapNode_210692_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_210692 mapChunk_211252
    10 10 height_mapChunk_210692 height_mapChunk_211252
theorem height_mapChunk_211812 : mapChunk_211812.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_212372 : mapChunk_212372.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_211812_001121 : mapNode_211812_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_211812 mapChunk_212372
    10 10 height_mapChunk_211812 height_mapChunk_212372
theorem height_mapNode_210692_002241 : mapNode_210692_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_210692_001120 mapNode_211812_001121
    11 11 height_mapNode_210692_001120 height_mapNode_211812_001121
theorem height_mapChunk_212933 : mapChunk_212933.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_213493 : mapChunk_213493.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_212933_001121 : mapNode_212933_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_212933 mapChunk_213493
    10 10 height_mapChunk_212933 height_mapChunk_213493
theorem height_mapChunk_214054 : mapChunk_214054.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_214614 : mapChunk_214614.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_214054_001121 : mapNode_214054_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_214054 mapChunk_214614
    10 10 height_mapChunk_214054 height_mapChunk_214614
theorem height_mapNode_212933_002242 : mapNode_212933_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_212933_001121 mapNode_214054_001121
    11 11 height_mapNode_212933_001121 height_mapNode_214054_001121
theorem height_mapNode_210692_004483 : mapNode_210692_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_210692_002241 mapNode_212933_002242
    12 12 height_mapNode_210692_002241 height_mapNode_212933_002242
theorem height_mapNode_206209_008966 : mapNode_206209_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_206209_004483 mapNode_210692_004483
    13 13 height_mapNode_206209_004483 height_mapNode_210692_004483
theorem height_mapNode_197243_017932 : mapNode_197243_017932.height ≤ 15 := by
  exact height_branch 8966 mapNode_197243_008966 mapNode_206209_008966
    14 14 height_mapNode_197243_008966 height_mapNode_206209_008966
theorem height_mapNode_179312_035863 : mapNode_179312_035863.height ≤ 16 := by
  exact height_branch 17931 mapNode_179312_017931 mapNode_197243_017932
    15 15 height_mapNode_179312_017931 height_mapNode_197243_017932
theorem height_mapNode_143450_071725 : mapNode_143450_071725.height ≤ 17 := by
  exact height_branch 35862 mapNode_143450_035862 mapNode_179312_035863
    16 16 height_mapNode_143450_035862 height_mapNode_179312_035863
theorem height_mapChunk_215175 : mapChunk_215175.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_215735 : mapChunk_215735.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_215175_001120 : mapNode_215175_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_215175 mapChunk_215735
    10 10 height_mapChunk_215175 height_mapChunk_215735
theorem height_mapChunk_216295 : mapChunk_216295.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_216855 : mapChunk_216855.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_216295_001121 : mapNode_216295_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_216295 mapChunk_216855
    10 10 height_mapChunk_216295 height_mapChunk_216855
theorem height_mapNode_215175_002241 : mapNode_215175_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_215175_001120 mapNode_216295_001121
    11 11 height_mapNode_215175_001120 height_mapNode_216295_001121
theorem height_mapChunk_217416 : mapChunk_217416.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_217976 : mapChunk_217976.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_217416_001120 : mapNode_217416_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_217416 mapChunk_217976
    10 10 height_mapChunk_217416 height_mapChunk_217976
theorem height_mapChunk_218536 : mapChunk_218536.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_219096 : mapChunk_219096.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_218536_001121 : mapNode_218536_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_218536 mapChunk_219096
    10 10 height_mapChunk_218536 height_mapChunk_219096
theorem height_mapNode_217416_002241 : mapNode_217416_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_217416_001120 mapNode_218536_001121
    11 11 height_mapNode_217416_001120 height_mapNode_218536_001121
theorem height_mapNode_215175_004482 : mapNode_215175_004482.height ≤ 13 := by
  exact height_branch 2241 mapNode_215175_002241 mapNode_217416_002241
    12 12 height_mapNode_215175_002241 height_mapNode_217416_002241
theorem height_mapChunk_219657 : mapChunk_219657.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_220217 : mapChunk_220217.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_219657_001120 : mapNode_219657_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_219657 mapChunk_220217
    10 10 height_mapChunk_219657 height_mapChunk_220217
theorem height_mapChunk_220777 : mapChunk_220777.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_221337 : mapChunk_221337.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_220777_001121 : mapNode_220777_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_220777 mapChunk_221337
    10 10 height_mapChunk_220777 height_mapChunk_221337
theorem height_mapNode_219657_002241 : mapNode_219657_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_219657_001120 mapNode_220777_001121
    11 11 height_mapNode_219657_001120 height_mapNode_220777_001121
theorem height_mapChunk_221898 : mapChunk_221898.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_222458 : mapChunk_222458.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_221898_001121 : mapNode_221898_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_221898 mapChunk_222458
    10 10 height_mapChunk_221898 height_mapChunk_222458
theorem height_mapChunk_223019 : mapChunk_223019.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_223579 : mapChunk_223579.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_223019_001121 : mapNode_223019_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_223019 mapChunk_223579
    10 10 height_mapChunk_223019 height_mapChunk_223579
theorem height_mapNode_221898_002242 : mapNode_221898_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_221898_001121 mapNode_223019_001121
    11 11 height_mapNode_221898_001121 height_mapNode_223019_001121
theorem height_mapNode_219657_004483 : mapNode_219657_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_219657_002241 mapNode_221898_002242
    12 12 height_mapNode_219657_002241 height_mapNode_221898_002242
theorem height_mapNode_215175_008965 : mapNode_215175_008965.height ≤ 14 := by
  exact height_branch 4482 mapNode_215175_004482 mapNode_219657_004483
    13 13 height_mapNode_215175_004482 height_mapNode_219657_004483
theorem height_mapChunk_224140 : mapChunk_224140.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_224700 : mapChunk_224700.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_224140_001120 : mapNode_224140_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_224140 mapChunk_224700
    10 10 height_mapChunk_224140 height_mapChunk_224700
theorem height_mapChunk_225260 : mapChunk_225260.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_225820 : mapChunk_225820.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_225260_001121 : mapNode_225260_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_225260 mapChunk_225820
    10 10 height_mapChunk_225260 height_mapChunk_225820
theorem height_mapNode_224140_002241 : mapNode_224140_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_224140_001120 mapNode_225260_001121
    11 11 height_mapNode_224140_001120 height_mapNode_225260_001121
theorem height_mapChunk_226381 : mapChunk_226381.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_226941 : mapChunk_226941.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_226381_001121 : mapNode_226381_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_226381 mapChunk_226941
    10 10 height_mapChunk_226381 height_mapChunk_226941
theorem height_mapChunk_227502 : mapChunk_227502.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_228062 : mapChunk_228062.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_227502_001121 : mapNode_227502_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_227502 mapChunk_228062
    10 10 height_mapChunk_227502 height_mapChunk_228062
theorem height_mapNode_226381_002242 : mapNode_226381_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_226381_001121 mapNode_227502_001121
    11 11 height_mapNode_226381_001121 height_mapNode_227502_001121
theorem height_mapNode_224140_004483 : mapNode_224140_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_224140_002241 mapNode_226381_002242
    12 12 height_mapNode_224140_002241 height_mapNode_226381_002242
theorem height_mapChunk_228623 : mapChunk_228623.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_229183 : mapChunk_229183.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_228623_001120 : mapNode_228623_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_228623 mapChunk_229183
    10 10 height_mapChunk_228623 height_mapChunk_229183
theorem height_mapChunk_229743 : mapChunk_229743.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_230303 : mapChunk_230303.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_229743_001121 : mapNode_229743_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_229743 mapChunk_230303
    10 10 height_mapChunk_229743 height_mapChunk_230303
theorem height_mapNode_228623_002241 : mapNode_228623_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_228623_001120 mapNode_229743_001121
    11 11 height_mapNode_228623_001120 height_mapNode_229743_001121
theorem height_mapChunk_230864 : mapChunk_230864.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_231424 : mapChunk_231424.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_230864_001121 : mapNode_230864_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_230864 mapChunk_231424
    10 10 height_mapChunk_230864 height_mapChunk_231424
theorem height_mapChunk_231985 : mapChunk_231985.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_232545 : mapChunk_232545.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_231985_001121 : mapNode_231985_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_231985 mapChunk_232545
    10 10 height_mapChunk_231985 height_mapChunk_232545
theorem height_mapNode_230864_002242 : mapNode_230864_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_230864_001121 mapNode_231985_001121
    11 11 height_mapNode_230864_001121 height_mapNode_231985_001121
theorem height_mapNode_228623_004483 : mapNode_228623_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_228623_002241 mapNode_230864_002242
    12 12 height_mapNode_228623_002241 height_mapNode_230864_002242
theorem height_mapNode_224140_008966 : mapNode_224140_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_224140_004483 mapNode_228623_004483
    13 13 height_mapNode_224140_004483 height_mapNode_228623_004483
theorem height_mapNode_215175_017931 : mapNode_215175_017931.height ≤ 15 := by
  exact height_branch 8965 mapNode_215175_008965 mapNode_224140_008966
    14 14 height_mapNode_215175_008965 height_mapNode_224140_008966
theorem height_mapChunk_233106 : mapChunk_233106.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_233666 : mapChunk_233666.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_233106_001120 : mapNode_233106_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_233106 mapChunk_233666
    10 10 height_mapChunk_233106 height_mapChunk_233666
theorem height_mapChunk_234226 : mapChunk_234226.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_234786 : mapChunk_234786.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_234226_001121 : mapNode_234226_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_234226 mapChunk_234786
    10 10 height_mapChunk_234226 height_mapChunk_234786
theorem height_mapNode_233106_002241 : mapNode_233106_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_233106_001120 mapNode_234226_001121
    11 11 height_mapNode_233106_001120 height_mapNode_234226_001121
theorem height_mapChunk_235347 : mapChunk_235347.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_235907 : mapChunk_235907.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_235347_001121 : mapNode_235347_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_235347 mapChunk_235907
    10 10 height_mapChunk_235347 height_mapChunk_235907
theorem height_mapChunk_236468 : mapChunk_236468.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_237028 : mapChunk_237028.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_236468_001121 : mapNode_236468_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_236468 mapChunk_237028
    10 10 height_mapChunk_236468 height_mapChunk_237028
theorem height_mapNode_235347_002242 : mapNode_235347_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_235347_001121 mapNode_236468_001121
    11 11 height_mapNode_235347_001121 height_mapNode_236468_001121
theorem height_mapNode_233106_004483 : mapNode_233106_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_233106_002241 mapNode_235347_002242
    12 12 height_mapNode_233106_002241 height_mapNode_235347_002242
theorem height_mapChunk_237589 : mapChunk_237589.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_238149 : mapChunk_238149.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_237589_001120 : mapNode_237589_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_237589 mapChunk_238149
    10 10 height_mapChunk_237589 height_mapChunk_238149
theorem height_mapChunk_238709 : mapChunk_238709.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_239269 : mapChunk_239269.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_238709_001121 : mapNode_238709_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_238709 mapChunk_239269
    10 10 height_mapChunk_238709 height_mapChunk_239269
theorem height_mapNode_237589_002241 : mapNode_237589_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_237589_001120 mapNode_238709_001121
    11 11 height_mapNode_237589_001120 height_mapNode_238709_001121
theorem height_mapChunk_239830 : mapChunk_239830.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_240390 : mapChunk_240390.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_239830_001121 : mapNode_239830_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_239830 mapChunk_240390
    10 10 height_mapChunk_239830 height_mapChunk_240390
theorem height_mapChunk_240951 : mapChunk_240951.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_241511 : mapChunk_241511.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_240951_001121 : mapNode_240951_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_240951 mapChunk_241511
    10 10 height_mapChunk_240951 height_mapChunk_241511
theorem height_mapNode_239830_002242 : mapNode_239830_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_239830_001121 mapNode_240951_001121
    11 11 height_mapNode_239830_001121 height_mapNode_240951_001121
theorem height_mapNode_237589_004483 : mapNode_237589_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_237589_002241 mapNode_239830_002242
    12 12 height_mapNode_237589_002241 height_mapNode_239830_002242
theorem height_mapNode_233106_008966 : mapNode_233106_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_233106_004483 mapNode_237589_004483
    13 13 height_mapNode_233106_004483 height_mapNode_237589_004483
theorem height_mapChunk_242072 : mapChunk_242072.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_242632 : mapChunk_242632.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_242072_001120 : mapNode_242072_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_242072 mapChunk_242632
    10 10 height_mapChunk_242072 height_mapChunk_242632
theorem height_mapChunk_243192 : mapChunk_243192.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_243752 : mapChunk_243752.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_243192_001121 : mapNode_243192_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_243192 mapChunk_243752
    10 10 height_mapChunk_243192 height_mapChunk_243752
theorem height_mapNode_242072_002241 : mapNode_242072_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_242072_001120 mapNode_243192_001121
    11 11 height_mapNode_242072_001120 height_mapNode_243192_001121
theorem height_mapChunk_244313 : mapChunk_244313.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_244873 : mapChunk_244873.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_244313_001121 : mapNode_244313_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_244313 mapChunk_244873
    10 10 height_mapChunk_244313 height_mapChunk_244873
theorem height_mapChunk_245434 : mapChunk_245434.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_245994 : mapChunk_245994.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_245434_001121 : mapNode_245434_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_245434 mapChunk_245994
    10 10 height_mapChunk_245434 height_mapChunk_245994
theorem height_mapNode_244313_002242 : mapNode_244313_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_244313_001121 mapNode_245434_001121
    11 11 height_mapNode_244313_001121 height_mapNode_245434_001121
theorem height_mapNode_242072_004483 : mapNode_242072_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_242072_002241 mapNode_244313_002242
    12 12 height_mapNode_242072_002241 height_mapNode_244313_002242
theorem height_mapChunk_246555 : mapChunk_246555.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_247115 : mapChunk_247115.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_246555_001120 : mapNode_246555_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_246555 mapChunk_247115
    10 10 height_mapChunk_246555 height_mapChunk_247115
theorem height_mapChunk_247675 : mapChunk_247675.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_248235 : mapChunk_248235.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_247675_001121 : mapNode_247675_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_247675 mapChunk_248235
    10 10 height_mapChunk_247675 height_mapChunk_248235
theorem height_mapNode_246555_002241 : mapNode_246555_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_246555_001120 mapNode_247675_001121
    11 11 height_mapNode_246555_001120 height_mapNode_247675_001121
theorem height_mapChunk_248796 : mapChunk_248796.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_249356 : mapChunk_249356.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_248796_001121 : mapNode_248796_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_248796 mapChunk_249356
    10 10 height_mapChunk_248796 height_mapChunk_249356
theorem height_mapChunk_249917 : mapChunk_249917.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_250477 : mapChunk_250477.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_249917_001121 : mapNode_249917_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_249917 mapChunk_250477
    10 10 height_mapChunk_249917 height_mapChunk_250477
theorem height_mapNode_248796_002242 : mapNode_248796_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_248796_001121 mapNode_249917_001121
    11 11 height_mapNode_248796_001121 height_mapNode_249917_001121
theorem height_mapNode_246555_004483 : mapNode_246555_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_246555_002241 mapNode_248796_002242
    12 12 height_mapNode_246555_002241 height_mapNode_248796_002242
theorem height_mapNode_242072_008966 : mapNode_242072_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_242072_004483 mapNode_246555_004483
    13 13 height_mapNode_242072_004483 height_mapNode_246555_004483
theorem height_mapNode_233106_017932 : mapNode_233106_017932.height ≤ 15 := by
  exact height_branch 8966 mapNode_233106_008966 mapNode_242072_008966
    14 14 height_mapNode_233106_008966 height_mapNode_242072_008966
theorem height_mapNode_215175_035863 : mapNode_215175_035863.height ≤ 16 := by
  exact height_branch 17931 mapNode_215175_017931 mapNode_233106_017932
    15 15 height_mapNode_215175_017931 height_mapNode_233106_017932
theorem height_mapChunk_251038 : mapChunk_251038.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_251598 : mapChunk_251598.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_251038_001120 : mapNode_251038_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_251038 mapChunk_251598
    10 10 height_mapChunk_251038 height_mapChunk_251598
theorem height_mapChunk_252158 : mapChunk_252158.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_252718 : mapChunk_252718.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_252158_001121 : mapNode_252158_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_252158 mapChunk_252718
    10 10 height_mapChunk_252158 height_mapChunk_252718
theorem height_mapNode_251038_002241 : mapNode_251038_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_251038_001120 mapNode_252158_001121
    11 11 height_mapNode_251038_001120 height_mapNode_252158_001121
theorem height_mapChunk_253279 : mapChunk_253279.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_253839 : mapChunk_253839.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_253279_001120 : mapNode_253279_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_253279 mapChunk_253839
    10 10 height_mapChunk_253279 height_mapChunk_253839
theorem height_mapChunk_254399 : mapChunk_254399.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_254959 : mapChunk_254959.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_254399_001121 : mapNode_254399_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_254399 mapChunk_254959
    10 10 height_mapChunk_254399 height_mapChunk_254959
theorem height_mapNode_253279_002241 : mapNode_253279_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_253279_001120 mapNode_254399_001121
    11 11 height_mapNode_253279_001120 height_mapNode_254399_001121
theorem height_mapNode_251038_004482 : mapNode_251038_004482.height ≤ 13 := by
  exact height_branch 2241 mapNode_251038_002241 mapNode_253279_002241
    12 12 height_mapNode_251038_002241 height_mapNode_253279_002241
theorem height_mapChunk_255520 : mapChunk_255520.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_256080 : mapChunk_256080.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_255520_001120 : mapNode_255520_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_255520 mapChunk_256080
    10 10 height_mapChunk_255520 height_mapChunk_256080
theorem height_mapChunk_256640 : mapChunk_256640.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_257200 : mapChunk_257200.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_256640_001121 : mapNode_256640_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_256640 mapChunk_257200
    10 10 height_mapChunk_256640 height_mapChunk_257200
theorem height_mapNode_255520_002241 : mapNode_255520_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_255520_001120 mapNode_256640_001121
    11 11 height_mapNode_255520_001120 height_mapNode_256640_001121
theorem height_mapChunk_257761 : mapChunk_257761.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_258321 : mapChunk_258321.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_257761_001121 : mapNode_257761_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_257761 mapChunk_258321
    10 10 height_mapChunk_257761 height_mapChunk_258321
theorem height_mapChunk_258882 : mapChunk_258882.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_259442 : mapChunk_259442.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_258882_001121 : mapNode_258882_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_258882 mapChunk_259442
    10 10 height_mapChunk_258882 height_mapChunk_259442
theorem height_mapNode_257761_002242 : mapNode_257761_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_257761_001121 mapNode_258882_001121
    11 11 height_mapNode_257761_001121 height_mapNode_258882_001121
theorem height_mapNode_255520_004483 : mapNode_255520_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_255520_002241 mapNode_257761_002242
    12 12 height_mapNode_255520_002241 height_mapNode_257761_002242
theorem height_mapNode_251038_008965 : mapNode_251038_008965.height ≤ 14 := by
  exact height_branch 4482 mapNode_251038_004482 mapNode_255520_004483
    13 13 height_mapNode_251038_004482 height_mapNode_255520_004483
theorem height_mapChunk_260003 : mapChunk_260003.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_260563 : mapChunk_260563.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_260003_001120 : mapNode_260003_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_260003 mapChunk_260563
    10 10 height_mapChunk_260003 height_mapChunk_260563
theorem height_mapChunk_261123 : mapChunk_261123.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_261683 : mapChunk_261683.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_261123_001121 : mapNode_261123_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_261123 mapChunk_261683
    10 10 height_mapChunk_261123 height_mapChunk_261683
theorem height_mapNode_260003_002241 : mapNode_260003_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_260003_001120 mapNode_261123_001121
    11 11 height_mapNode_260003_001120 height_mapNode_261123_001121
theorem height_mapChunk_262244 : mapChunk_262244.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_262804 : mapChunk_262804.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_262244_001121 : mapNode_262244_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_262244 mapChunk_262804
    10 10 height_mapChunk_262244 height_mapChunk_262804
theorem height_mapChunk_263365 : mapChunk_263365.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_263925 : mapChunk_263925.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_263365_001121 : mapNode_263365_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_263365 mapChunk_263925
    10 10 height_mapChunk_263365 height_mapChunk_263925
theorem height_mapNode_262244_002242 : mapNode_262244_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_262244_001121 mapNode_263365_001121
    11 11 height_mapNode_262244_001121 height_mapNode_263365_001121
theorem height_mapNode_260003_004483 : mapNode_260003_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_260003_002241 mapNode_262244_002242
    12 12 height_mapNode_260003_002241 height_mapNode_262244_002242
theorem height_mapChunk_264486 : mapChunk_264486.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_265046 : mapChunk_265046.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_264486_001120 : mapNode_264486_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_264486 mapChunk_265046
    10 10 height_mapChunk_264486 height_mapChunk_265046
theorem height_mapChunk_265606 : mapChunk_265606.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_266166 : mapChunk_266166.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_265606_001121 : mapNode_265606_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_265606 mapChunk_266166
    10 10 height_mapChunk_265606 height_mapChunk_266166
theorem height_mapNode_264486_002241 : mapNode_264486_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_264486_001120 mapNode_265606_001121
    11 11 height_mapNode_264486_001120 height_mapNode_265606_001121
theorem height_mapChunk_266727 : mapChunk_266727.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_267287 : mapChunk_267287.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_266727_001121 : mapNode_266727_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_266727 mapChunk_267287
    10 10 height_mapChunk_266727 height_mapChunk_267287
theorem height_mapChunk_267848 : mapChunk_267848.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_268408 : mapChunk_268408.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_267848_001121 : mapNode_267848_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_267848 mapChunk_268408
    10 10 height_mapChunk_267848 height_mapChunk_268408
theorem height_mapNode_266727_002242 : mapNode_266727_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_266727_001121 mapNode_267848_001121
    11 11 height_mapNode_266727_001121 height_mapNode_267848_001121
theorem height_mapNode_264486_004483 : mapNode_264486_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_264486_002241 mapNode_266727_002242
    12 12 height_mapNode_264486_002241 height_mapNode_266727_002242
theorem height_mapNode_260003_008966 : mapNode_260003_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_260003_004483 mapNode_264486_004483
    13 13 height_mapNode_260003_004483 height_mapNode_264486_004483
theorem height_mapNode_251038_017931 : mapNode_251038_017931.height ≤ 15 := by
  exact height_branch 8965 mapNode_251038_008965 mapNode_260003_008966
    14 14 height_mapNode_251038_008965 height_mapNode_260003_008966
theorem height_mapChunk_268969 : mapChunk_268969.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_269529 : mapChunk_269529.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_268969_001120 : mapNode_268969_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_268969 mapChunk_269529
    10 10 height_mapChunk_268969 height_mapChunk_269529
theorem height_mapChunk_270089 : mapChunk_270089.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_270649 : mapChunk_270649.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_270089_001121 : mapNode_270089_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_270089 mapChunk_270649
    10 10 height_mapChunk_270089 height_mapChunk_270649
theorem height_mapNode_268969_002241 : mapNode_268969_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_268969_001120 mapNode_270089_001121
    11 11 height_mapNode_268969_001120 height_mapNode_270089_001121
theorem height_mapChunk_271210 : mapChunk_271210.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_271770 : mapChunk_271770.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_271210_001121 : mapNode_271210_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_271210 mapChunk_271770
    10 10 height_mapChunk_271210 height_mapChunk_271770
theorem height_mapChunk_272331 : mapChunk_272331.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_272891 : mapChunk_272891.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_272331_001121 : mapNode_272331_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_272331 mapChunk_272891
    10 10 height_mapChunk_272331 height_mapChunk_272891
theorem height_mapNode_271210_002242 : mapNode_271210_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_271210_001121 mapNode_272331_001121
    11 11 height_mapNode_271210_001121 height_mapNode_272331_001121
theorem height_mapNode_268969_004483 : mapNode_268969_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_268969_002241 mapNode_271210_002242
    12 12 height_mapNode_268969_002241 height_mapNode_271210_002242
theorem height_mapChunk_273452 : mapChunk_273452.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_274012 : mapChunk_274012.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_273452_001120 : mapNode_273452_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_273452 mapChunk_274012
    10 10 height_mapChunk_273452 height_mapChunk_274012
theorem height_mapChunk_274572 : mapChunk_274572.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_275132 : mapChunk_275132.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_274572_001121 : mapNode_274572_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_274572 mapChunk_275132
    10 10 height_mapChunk_274572 height_mapChunk_275132
theorem height_mapNode_273452_002241 : mapNode_273452_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_273452_001120 mapNode_274572_001121
    11 11 height_mapNode_273452_001120 height_mapNode_274572_001121
theorem height_mapChunk_275693 : mapChunk_275693.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_276253 : mapChunk_276253.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_275693_001121 : mapNode_275693_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_275693 mapChunk_276253
    10 10 height_mapChunk_275693 height_mapChunk_276253
theorem height_mapChunk_276814 : mapChunk_276814.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_277374 : mapChunk_277374.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_276814_001121 : mapNode_276814_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_276814 mapChunk_277374
    10 10 height_mapChunk_276814 height_mapChunk_277374
theorem height_mapNode_275693_002242 : mapNode_275693_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_275693_001121 mapNode_276814_001121
    11 11 height_mapNode_275693_001121 height_mapNode_276814_001121
theorem height_mapNode_273452_004483 : mapNode_273452_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_273452_002241 mapNode_275693_002242
    12 12 height_mapNode_273452_002241 height_mapNode_275693_002242
theorem height_mapNode_268969_008966 : mapNode_268969_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_268969_004483 mapNode_273452_004483
    13 13 height_mapNode_268969_004483 height_mapNode_273452_004483
theorem height_mapChunk_277935 : mapChunk_277935.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_278495 : mapChunk_278495.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_277935_001120 : mapNode_277935_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_277935 mapChunk_278495
    10 10 height_mapChunk_277935 height_mapChunk_278495
theorem height_mapChunk_279055 : mapChunk_279055.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_279615 : mapChunk_279615.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_279055_001121 : mapNode_279055_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_279055 mapChunk_279615
    10 10 height_mapChunk_279055 height_mapChunk_279615
theorem height_mapNode_277935_002241 : mapNode_277935_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_277935_001120 mapNode_279055_001121
    11 11 height_mapNode_277935_001120 height_mapNode_279055_001121
theorem height_mapChunk_280176 : mapChunk_280176.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_280736 : mapChunk_280736.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_280176_001121 : mapNode_280176_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_280176 mapChunk_280736
    10 10 height_mapChunk_280176 height_mapChunk_280736
theorem height_mapChunk_281297 : mapChunk_281297.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_281857 : mapChunk_281857.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_281297_001121 : mapNode_281297_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_281297 mapChunk_281857
    10 10 height_mapChunk_281297 height_mapChunk_281857
theorem height_mapNode_280176_002242 : mapNode_280176_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_280176_001121 mapNode_281297_001121
    11 11 height_mapNode_280176_001121 height_mapNode_281297_001121
theorem height_mapNode_277935_004483 : mapNode_277935_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_277935_002241 mapNode_280176_002242
    12 12 height_mapNode_277935_002241 height_mapNode_280176_002242
theorem height_mapChunk_282418 : mapChunk_282418.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_282978 : mapChunk_282978.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_282418_001120 : mapNode_282418_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_282418 mapChunk_282978
    10 10 height_mapChunk_282418 height_mapChunk_282978
theorem height_mapChunk_283538 : mapChunk_283538.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_284098 : mapChunk_284098.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_283538_001121 : mapNode_283538_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_283538 mapChunk_284098
    10 10 height_mapChunk_283538 height_mapChunk_284098
theorem height_mapNode_282418_002241 : mapNode_282418_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_282418_001120 mapNode_283538_001121
    11 11 height_mapNode_282418_001120 height_mapNode_283538_001121
theorem height_mapChunk_284659 : mapChunk_284659.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_285219 : mapChunk_285219.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_284659_001121 : mapNode_284659_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_284659 mapChunk_285219
    10 10 height_mapChunk_284659 height_mapChunk_285219
theorem height_mapChunk_285780 : mapChunk_285780.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_286340 : mapChunk_286340.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_285780_001121 : mapNode_285780_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_285780 mapChunk_286340
    10 10 height_mapChunk_285780 height_mapChunk_286340
theorem height_mapNode_284659_002242 : mapNode_284659_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_284659_001121 mapNode_285780_001121
    11 11 height_mapNode_284659_001121 height_mapNode_285780_001121
theorem height_mapNode_282418_004483 : mapNode_282418_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_282418_002241 mapNode_284659_002242
    12 12 height_mapNode_282418_002241 height_mapNode_284659_002242
theorem height_mapNode_277935_008966 : mapNode_277935_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_277935_004483 mapNode_282418_004483
    13 13 height_mapNode_277935_004483 height_mapNode_282418_004483
theorem height_mapNode_268969_017932 : mapNode_268969_017932.height ≤ 15 := by
  exact height_branch 8966 mapNode_268969_008966 mapNode_277935_008966
    14 14 height_mapNode_268969_008966 height_mapNode_277935_008966
theorem height_mapNode_251038_035863 : mapNode_251038_035863.height ≤ 16 := by
  exact height_branch 17931 mapNode_251038_017931 mapNode_268969_017932
    15 15 height_mapNode_251038_017931 height_mapNode_268969_017932
theorem height_mapNode_215175_071726 : mapNode_215175_071726.height ≤ 17 := by
  exact height_branch 35863 mapNode_215175_035863 mapNode_251038_035863
    16 16 height_mapNode_215175_035863 height_mapNode_251038_035863
theorem height_mapNode_143450_143451 : mapNode_143450_143451.height ≤ 18 := by
  exact height_branch 71725 mapNode_143450_071725 mapNode_215175_071726
    17 17 height_mapNode_143450_071725 height_mapNode_215175_071726
theorem height_mapNode_000000_286901 : mapNode_000000_286901.height ≤ 19 := by
  exact height_branch 143450 mapNode_000000_143450 mapNode_143450_143451
    18 18 height_mapNode_000000_143450 height_mapNode_143450_143451
theorem height_mapChunk_286901 : mapChunk_286901.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_287461 : mapChunk_287461.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_286901_001120 : mapNode_286901_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_286901 mapChunk_287461
    10 10 height_mapChunk_286901 height_mapChunk_287461
theorem height_mapChunk_288021 : mapChunk_288021.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_288581 : mapChunk_288581.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_288021_001121 : mapNode_288021_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_288021 mapChunk_288581
    10 10 height_mapChunk_288021 height_mapChunk_288581
theorem height_mapNode_286901_002241 : mapNode_286901_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_286901_001120 mapNode_288021_001121
    11 11 height_mapNode_286901_001120 height_mapNode_288021_001121
theorem height_mapChunk_289142 : mapChunk_289142.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_289702 : mapChunk_289702.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_289142_001120 : mapNode_289142_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_289142 mapChunk_289702
    10 10 height_mapChunk_289142 height_mapChunk_289702
theorem height_mapChunk_290262 : mapChunk_290262.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_290822 : mapChunk_290822.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_290262_001121 : mapNode_290262_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_290262 mapChunk_290822
    10 10 height_mapChunk_290262 height_mapChunk_290822
theorem height_mapNode_289142_002241 : mapNode_289142_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_289142_001120 mapNode_290262_001121
    11 11 height_mapNode_289142_001120 height_mapNode_290262_001121
theorem height_mapNode_286901_004482 : mapNode_286901_004482.height ≤ 13 := by
  exact height_branch 2241 mapNode_286901_002241 mapNode_289142_002241
    12 12 height_mapNode_286901_002241 height_mapNode_289142_002241
theorem height_mapChunk_291383 : mapChunk_291383.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_291943 : mapChunk_291943.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_291383_001120 : mapNode_291383_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_291383 mapChunk_291943
    10 10 height_mapChunk_291383 height_mapChunk_291943
theorem height_mapChunk_292503 : mapChunk_292503.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_293063 : mapChunk_293063.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_292503_001121 : mapNode_292503_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_292503 mapChunk_293063
    10 10 height_mapChunk_292503 height_mapChunk_293063
theorem height_mapNode_291383_002241 : mapNode_291383_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_291383_001120 mapNode_292503_001121
    11 11 height_mapNode_291383_001120 height_mapNode_292503_001121
theorem height_mapChunk_293624 : mapChunk_293624.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_294184 : mapChunk_294184.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_293624_001121 : mapNode_293624_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_293624 mapChunk_294184
    10 10 height_mapChunk_293624 height_mapChunk_294184
theorem height_mapChunk_294745 : mapChunk_294745.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_295305 : mapChunk_295305.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_294745_001121 : mapNode_294745_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_294745 mapChunk_295305
    10 10 height_mapChunk_294745 height_mapChunk_295305
theorem height_mapNode_293624_002242 : mapNode_293624_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_293624_001121 mapNode_294745_001121
    11 11 height_mapNode_293624_001121 height_mapNode_294745_001121
theorem height_mapNode_291383_004483 : mapNode_291383_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_291383_002241 mapNode_293624_002242
    12 12 height_mapNode_291383_002241 height_mapNode_293624_002242
theorem height_mapNode_286901_008965 : mapNode_286901_008965.height ≤ 14 := by
  exact height_branch 4482 mapNode_286901_004482 mapNode_291383_004483
    13 13 height_mapNode_286901_004482 height_mapNode_291383_004483
theorem height_mapChunk_295866 : mapChunk_295866.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_296426 : mapChunk_296426.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_295866_001120 : mapNode_295866_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_295866 mapChunk_296426
    10 10 height_mapChunk_295866 height_mapChunk_296426
theorem height_mapChunk_296986 : mapChunk_296986.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_297546 : mapChunk_297546.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_296986_001121 : mapNode_296986_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_296986 mapChunk_297546
    10 10 height_mapChunk_296986 height_mapChunk_297546
theorem height_mapNode_295866_002241 : mapNode_295866_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_295866_001120 mapNode_296986_001121
    11 11 height_mapNode_295866_001120 height_mapNode_296986_001121
theorem height_mapChunk_298107 : mapChunk_298107.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_298667 : mapChunk_298667.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_298107_001121 : mapNode_298107_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_298107 mapChunk_298667
    10 10 height_mapChunk_298107 height_mapChunk_298667
theorem height_mapChunk_299228 : mapChunk_299228.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_299788 : mapChunk_299788.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_299228_001121 : mapNode_299228_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_299228 mapChunk_299788
    10 10 height_mapChunk_299228 height_mapChunk_299788
theorem height_mapNode_298107_002242 : mapNode_298107_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_298107_001121 mapNode_299228_001121
    11 11 height_mapNode_298107_001121 height_mapNode_299228_001121
theorem height_mapNode_295866_004483 : mapNode_295866_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_295866_002241 mapNode_298107_002242
    12 12 height_mapNode_295866_002241 height_mapNode_298107_002242
theorem height_mapChunk_300349 : mapChunk_300349.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_300909 : mapChunk_300909.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_300349_001120 : mapNode_300349_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_300349 mapChunk_300909
    10 10 height_mapChunk_300349 height_mapChunk_300909
theorem height_mapChunk_301469 : mapChunk_301469.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_302029 : mapChunk_302029.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_301469_001121 : mapNode_301469_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_301469 mapChunk_302029
    10 10 height_mapChunk_301469 height_mapChunk_302029
theorem height_mapNode_300349_002241 : mapNode_300349_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_300349_001120 mapNode_301469_001121
    11 11 height_mapNode_300349_001120 height_mapNode_301469_001121
theorem height_mapChunk_302590 : mapChunk_302590.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_303150 : mapChunk_303150.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_302590_001121 : mapNode_302590_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_302590 mapChunk_303150
    10 10 height_mapChunk_302590 height_mapChunk_303150
theorem height_mapChunk_303711 : mapChunk_303711.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_304271 : mapChunk_304271.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_303711_001121 : mapNode_303711_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_303711 mapChunk_304271
    10 10 height_mapChunk_303711 height_mapChunk_304271
theorem height_mapNode_302590_002242 : mapNode_302590_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_302590_001121 mapNode_303711_001121
    11 11 height_mapNode_302590_001121 height_mapNode_303711_001121
theorem height_mapNode_300349_004483 : mapNode_300349_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_300349_002241 mapNode_302590_002242
    12 12 height_mapNode_300349_002241 height_mapNode_302590_002242
theorem height_mapNode_295866_008966 : mapNode_295866_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_295866_004483 mapNode_300349_004483
    13 13 height_mapNode_295866_004483 height_mapNode_300349_004483
theorem height_mapNode_286901_017931 : mapNode_286901_017931.height ≤ 15 := by
  exact height_branch 8965 mapNode_286901_008965 mapNode_295866_008966
    14 14 height_mapNode_286901_008965 height_mapNode_295866_008966
theorem height_mapChunk_304832 : mapChunk_304832.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_305392 : mapChunk_305392.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_304832_001120 : mapNode_304832_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_304832 mapChunk_305392
    10 10 height_mapChunk_304832 height_mapChunk_305392
theorem height_mapChunk_305952 : mapChunk_305952.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_306512 : mapChunk_306512.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_305952_001121 : mapNode_305952_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_305952 mapChunk_306512
    10 10 height_mapChunk_305952 height_mapChunk_306512
theorem height_mapNode_304832_002241 : mapNode_304832_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_304832_001120 mapNode_305952_001121
    11 11 height_mapNode_304832_001120 height_mapNode_305952_001121
theorem height_mapChunk_307073 : mapChunk_307073.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_307633 : mapChunk_307633.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_307073_001120 : mapNode_307073_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_307073 mapChunk_307633
    10 10 height_mapChunk_307073 height_mapChunk_307633
theorem height_mapChunk_308193 : mapChunk_308193.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_308753 : mapChunk_308753.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_308193_001121 : mapNode_308193_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_308193 mapChunk_308753
    10 10 height_mapChunk_308193 height_mapChunk_308753
theorem height_mapNode_307073_002241 : mapNode_307073_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_307073_001120 mapNode_308193_001121
    11 11 height_mapNode_307073_001120 height_mapNode_308193_001121
theorem height_mapNode_304832_004482 : mapNode_304832_004482.height ≤ 13 := by
  exact height_branch 2241 mapNode_304832_002241 mapNode_307073_002241
    12 12 height_mapNode_304832_002241 height_mapNode_307073_002241
theorem height_mapChunk_309314 : mapChunk_309314.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_309874 : mapChunk_309874.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_309314_001120 : mapNode_309314_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_309314 mapChunk_309874
    10 10 height_mapChunk_309314 height_mapChunk_309874
theorem height_mapChunk_310434 : mapChunk_310434.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_310994 : mapChunk_310994.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_310434_001121 : mapNode_310434_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_310434 mapChunk_310994
    10 10 height_mapChunk_310434 height_mapChunk_310994
theorem height_mapNode_309314_002241 : mapNode_309314_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_309314_001120 mapNode_310434_001121
    11 11 height_mapNode_309314_001120 height_mapNode_310434_001121
theorem height_mapChunk_311555 : mapChunk_311555.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_312115 : mapChunk_312115.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_311555_001121 : mapNode_311555_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_311555 mapChunk_312115
    10 10 height_mapChunk_311555 height_mapChunk_312115
theorem height_mapChunk_312676 : mapChunk_312676.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_313236 : mapChunk_313236.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_312676_001121 : mapNode_312676_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_312676 mapChunk_313236
    10 10 height_mapChunk_312676 height_mapChunk_313236
theorem height_mapNode_311555_002242 : mapNode_311555_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_311555_001121 mapNode_312676_001121
    11 11 height_mapNode_311555_001121 height_mapNode_312676_001121
theorem height_mapNode_309314_004483 : mapNode_309314_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_309314_002241 mapNode_311555_002242
    12 12 height_mapNode_309314_002241 height_mapNode_311555_002242
theorem height_mapNode_304832_008965 : mapNode_304832_008965.height ≤ 14 := by
  exact height_branch 4482 mapNode_304832_004482 mapNode_309314_004483
    13 13 height_mapNode_304832_004482 height_mapNode_309314_004483
theorem height_mapChunk_313797 : mapChunk_313797.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_314357 : mapChunk_314357.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_313797_001120 : mapNode_313797_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_313797 mapChunk_314357
    10 10 height_mapChunk_313797 height_mapChunk_314357
theorem height_mapChunk_314917 : mapChunk_314917.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_315477 : mapChunk_315477.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_314917_001121 : mapNode_314917_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_314917 mapChunk_315477
    10 10 height_mapChunk_314917 height_mapChunk_315477
theorem height_mapNode_313797_002241 : mapNode_313797_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_313797_001120 mapNode_314917_001121
    11 11 height_mapNode_313797_001120 height_mapNode_314917_001121
theorem height_mapChunk_316038 : mapChunk_316038.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_316598 : mapChunk_316598.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_316038_001121 : mapNode_316038_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_316038 mapChunk_316598
    10 10 height_mapChunk_316038 height_mapChunk_316598
theorem height_mapChunk_317159 : mapChunk_317159.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_317719 : mapChunk_317719.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_317159_001121 : mapNode_317159_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_317159 mapChunk_317719
    10 10 height_mapChunk_317159 height_mapChunk_317719
theorem height_mapNode_316038_002242 : mapNode_316038_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_316038_001121 mapNode_317159_001121
    11 11 height_mapNode_316038_001121 height_mapNode_317159_001121
theorem height_mapNode_313797_004483 : mapNode_313797_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_313797_002241 mapNode_316038_002242
    12 12 height_mapNode_313797_002241 height_mapNode_316038_002242
theorem height_mapChunk_318280 : mapChunk_318280.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_318840 : mapChunk_318840.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_318280_001120 : mapNode_318280_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_318280 mapChunk_318840
    10 10 height_mapChunk_318280 height_mapChunk_318840
theorem height_mapChunk_319400 : mapChunk_319400.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_319960 : mapChunk_319960.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_319400_001121 : mapNode_319400_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_319400 mapChunk_319960
    10 10 height_mapChunk_319400 height_mapChunk_319960
theorem height_mapNode_318280_002241 : mapNode_318280_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_318280_001120 mapNode_319400_001121
    11 11 height_mapNode_318280_001120 height_mapNode_319400_001121
theorem height_mapChunk_320521 : mapChunk_320521.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_321081 : mapChunk_321081.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_320521_001121 : mapNode_320521_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_320521 mapChunk_321081
    10 10 height_mapChunk_320521 height_mapChunk_321081
theorem height_mapChunk_321642 : mapChunk_321642.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_322202 : mapChunk_322202.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_321642_001121 : mapNode_321642_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_321642 mapChunk_322202
    10 10 height_mapChunk_321642 height_mapChunk_322202
theorem height_mapNode_320521_002242 : mapNode_320521_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_320521_001121 mapNode_321642_001121
    11 11 height_mapNode_320521_001121 height_mapNode_321642_001121
theorem height_mapNode_318280_004483 : mapNode_318280_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_318280_002241 mapNode_320521_002242
    12 12 height_mapNode_318280_002241 height_mapNode_320521_002242
theorem height_mapNode_313797_008966 : mapNode_313797_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_313797_004483 mapNode_318280_004483
    13 13 height_mapNode_313797_004483 height_mapNode_318280_004483
theorem height_mapNode_304832_017931 : mapNode_304832_017931.height ≤ 15 := by
  exact height_branch 8965 mapNode_304832_008965 mapNode_313797_008966
    14 14 height_mapNode_304832_008965 height_mapNode_313797_008966
theorem height_mapNode_286901_035862 : mapNode_286901_035862.height ≤ 16 := by
  exact height_branch 17931 mapNode_286901_017931 mapNode_304832_017931
    15 15 height_mapNode_286901_017931 height_mapNode_304832_017931
theorem height_mapChunk_322763 : mapChunk_322763.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_323323 : mapChunk_323323.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_322763_001120 : mapNode_322763_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_322763 mapChunk_323323
    10 10 height_mapChunk_322763 height_mapChunk_323323
theorem height_mapChunk_323883 : mapChunk_323883.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_324443 : mapChunk_324443.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_323883_001121 : mapNode_323883_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_323883 mapChunk_324443
    10 10 height_mapChunk_323883 height_mapChunk_324443
theorem height_mapNode_322763_002241 : mapNode_322763_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_322763_001120 mapNode_323883_001121
    11 11 height_mapNode_322763_001120 height_mapNode_323883_001121
theorem height_mapChunk_325004 : mapChunk_325004.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_325564 : mapChunk_325564.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_325004_001120 : mapNode_325004_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_325004 mapChunk_325564
    10 10 height_mapChunk_325004 height_mapChunk_325564
theorem height_mapChunk_326124 : mapChunk_326124.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_326684 : mapChunk_326684.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_326124_001121 : mapNode_326124_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_326124 mapChunk_326684
    10 10 height_mapChunk_326124 height_mapChunk_326684
theorem height_mapNode_325004_002241 : mapNode_325004_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_325004_001120 mapNode_326124_001121
    11 11 height_mapNode_325004_001120 height_mapNode_326124_001121
theorem height_mapNode_322763_004482 : mapNode_322763_004482.height ≤ 13 := by
  exact height_branch 2241 mapNode_322763_002241 mapNode_325004_002241
    12 12 height_mapNode_322763_002241 height_mapNode_325004_002241
theorem height_mapChunk_327245 : mapChunk_327245.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_327805 : mapChunk_327805.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_327245_001120 : mapNode_327245_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_327245 mapChunk_327805
    10 10 height_mapChunk_327245 height_mapChunk_327805
theorem height_mapChunk_328365 : mapChunk_328365.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_328925 : mapChunk_328925.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_328365_001121 : mapNode_328365_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_328365 mapChunk_328925
    10 10 height_mapChunk_328365 height_mapChunk_328925
theorem height_mapNode_327245_002241 : mapNode_327245_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_327245_001120 mapNode_328365_001121
    11 11 height_mapNode_327245_001120 height_mapNode_328365_001121
theorem height_mapChunk_329486 : mapChunk_329486.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_330046 : mapChunk_330046.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_329486_001121 : mapNode_329486_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_329486 mapChunk_330046
    10 10 height_mapChunk_329486 height_mapChunk_330046
theorem height_mapChunk_330607 : mapChunk_330607.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_331167 : mapChunk_331167.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_330607_001121 : mapNode_330607_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_330607 mapChunk_331167
    10 10 height_mapChunk_330607 height_mapChunk_331167
theorem height_mapNode_329486_002242 : mapNode_329486_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_329486_001121 mapNode_330607_001121
    11 11 height_mapNode_329486_001121 height_mapNode_330607_001121
theorem height_mapNode_327245_004483 : mapNode_327245_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_327245_002241 mapNode_329486_002242
    12 12 height_mapNode_327245_002241 height_mapNode_329486_002242
theorem height_mapNode_322763_008965 : mapNode_322763_008965.height ≤ 14 := by
  exact height_branch 4482 mapNode_322763_004482 mapNode_327245_004483
    13 13 height_mapNode_322763_004482 height_mapNode_327245_004483
theorem height_mapChunk_331728 : mapChunk_331728.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_332288 : mapChunk_332288.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_331728_001120 : mapNode_331728_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_331728 mapChunk_332288
    10 10 height_mapChunk_331728 height_mapChunk_332288
theorem height_mapChunk_332848 : mapChunk_332848.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_333408 : mapChunk_333408.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_332848_001121 : mapNode_332848_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_332848 mapChunk_333408
    10 10 height_mapChunk_332848 height_mapChunk_333408
theorem height_mapNode_331728_002241 : mapNode_331728_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_331728_001120 mapNode_332848_001121
    11 11 height_mapNode_331728_001120 height_mapNode_332848_001121
theorem height_mapChunk_333969 : mapChunk_333969.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_334529 : mapChunk_334529.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_333969_001121 : mapNode_333969_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_333969 mapChunk_334529
    10 10 height_mapChunk_333969 height_mapChunk_334529
theorem height_mapChunk_335090 : mapChunk_335090.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_335650 : mapChunk_335650.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_335090_001121 : mapNode_335090_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_335090 mapChunk_335650
    10 10 height_mapChunk_335090 height_mapChunk_335650
theorem height_mapNode_333969_002242 : mapNode_333969_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_333969_001121 mapNode_335090_001121
    11 11 height_mapNode_333969_001121 height_mapNode_335090_001121
theorem height_mapNode_331728_004483 : mapNode_331728_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_331728_002241 mapNode_333969_002242
    12 12 height_mapNode_331728_002241 height_mapNode_333969_002242
theorem height_mapChunk_336211 : mapChunk_336211.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_336771 : mapChunk_336771.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_336211_001120 : mapNode_336211_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_336211 mapChunk_336771
    10 10 height_mapChunk_336211 height_mapChunk_336771
theorem height_mapChunk_337331 : mapChunk_337331.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_337891 : mapChunk_337891.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_337331_001121 : mapNode_337331_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_337331 mapChunk_337891
    10 10 height_mapChunk_337331 height_mapChunk_337891
theorem height_mapNode_336211_002241 : mapNode_336211_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_336211_001120 mapNode_337331_001121
    11 11 height_mapNode_336211_001120 height_mapNode_337331_001121
theorem height_mapChunk_338452 : mapChunk_338452.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_339012 : mapChunk_339012.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_338452_001121 : mapNode_338452_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_338452 mapChunk_339012
    10 10 height_mapChunk_338452 height_mapChunk_339012
theorem height_mapChunk_339573 : mapChunk_339573.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_340133 : mapChunk_340133.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_339573_001121 : mapNode_339573_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_339573 mapChunk_340133
    10 10 height_mapChunk_339573 height_mapChunk_340133
theorem height_mapNode_338452_002242 : mapNode_338452_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_338452_001121 mapNode_339573_001121
    11 11 height_mapNode_338452_001121 height_mapNode_339573_001121
theorem height_mapNode_336211_004483 : mapNode_336211_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_336211_002241 mapNode_338452_002242
    12 12 height_mapNode_336211_002241 height_mapNode_338452_002242
theorem height_mapNode_331728_008966 : mapNode_331728_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_331728_004483 mapNode_336211_004483
    13 13 height_mapNode_331728_004483 height_mapNode_336211_004483
theorem height_mapNode_322763_017931 : mapNode_322763_017931.height ≤ 15 := by
  exact height_branch 8965 mapNode_322763_008965 mapNode_331728_008966
    14 14 height_mapNode_322763_008965 height_mapNode_331728_008966
theorem height_mapChunk_340694 : mapChunk_340694.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_341254 : mapChunk_341254.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_340694_001120 : mapNode_340694_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_340694 mapChunk_341254
    10 10 height_mapChunk_340694 height_mapChunk_341254
theorem height_mapChunk_341814 : mapChunk_341814.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_342374 : mapChunk_342374.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_341814_001121 : mapNode_341814_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_341814 mapChunk_342374
    10 10 height_mapChunk_341814 height_mapChunk_342374
theorem height_mapNode_340694_002241 : mapNode_340694_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_340694_001120 mapNode_341814_001121
    11 11 height_mapNode_340694_001120 height_mapNode_341814_001121
theorem height_mapChunk_342935 : mapChunk_342935.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_343495 : mapChunk_343495.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_342935_001121 : mapNode_342935_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_342935 mapChunk_343495
    10 10 height_mapChunk_342935 height_mapChunk_343495
theorem height_mapChunk_344056 : mapChunk_344056.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_344616 : mapChunk_344616.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_344056_001121 : mapNode_344056_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_344056 mapChunk_344616
    10 10 height_mapChunk_344056 height_mapChunk_344616
theorem height_mapNode_342935_002242 : mapNode_342935_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_342935_001121 mapNode_344056_001121
    11 11 height_mapNode_342935_001121 height_mapNode_344056_001121
theorem height_mapNode_340694_004483 : mapNode_340694_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_340694_002241 mapNode_342935_002242
    12 12 height_mapNode_340694_002241 height_mapNode_342935_002242
theorem height_mapChunk_345177 : mapChunk_345177.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_345737 : mapChunk_345737.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_345177_001120 : mapNode_345177_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_345177 mapChunk_345737
    10 10 height_mapChunk_345177 height_mapChunk_345737
theorem height_mapChunk_346297 : mapChunk_346297.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_346857 : mapChunk_346857.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_346297_001121 : mapNode_346297_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_346297 mapChunk_346857
    10 10 height_mapChunk_346297 height_mapChunk_346857
theorem height_mapNode_345177_002241 : mapNode_345177_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_345177_001120 mapNode_346297_001121
    11 11 height_mapNode_345177_001120 height_mapNode_346297_001121
theorem height_mapChunk_347418 : mapChunk_347418.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_347978 : mapChunk_347978.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_347418_001121 : mapNode_347418_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_347418 mapChunk_347978
    10 10 height_mapChunk_347418 height_mapChunk_347978
theorem height_mapChunk_348539 : mapChunk_348539.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_349099 : mapChunk_349099.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_348539_001121 : mapNode_348539_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_348539 mapChunk_349099
    10 10 height_mapChunk_348539 height_mapChunk_349099
theorem height_mapNode_347418_002242 : mapNode_347418_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_347418_001121 mapNode_348539_001121
    11 11 height_mapNode_347418_001121 height_mapNode_348539_001121
theorem height_mapNode_345177_004483 : mapNode_345177_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_345177_002241 mapNode_347418_002242
    12 12 height_mapNode_345177_002241 height_mapNode_347418_002242
theorem height_mapNode_340694_008966 : mapNode_340694_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_340694_004483 mapNode_345177_004483
    13 13 height_mapNode_340694_004483 height_mapNode_345177_004483
theorem height_mapChunk_349660 : mapChunk_349660.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_350220 : mapChunk_350220.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_349660_001120 : mapNode_349660_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_349660 mapChunk_350220
    10 10 height_mapChunk_349660 height_mapChunk_350220
theorem height_mapChunk_350780 : mapChunk_350780.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_351340 : mapChunk_351340.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_350780_001121 : mapNode_350780_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_350780 mapChunk_351340
    10 10 height_mapChunk_350780 height_mapChunk_351340
theorem height_mapNode_349660_002241 : mapNode_349660_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_349660_001120 mapNode_350780_001121
    11 11 height_mapNode_349660_001120 height_mapNode_350780_001121
theorem height_mapChunk_351901 : mapChunk_351901.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_352461 : mapChunk_352461.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_351901_001121 : mapNode_351901_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_351901 mapChunk_352461
    10 10 height_mapChunk_351901 height_mapChunk_352461
theorem height_mapChunk_353022 : mapChunk_353022.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_353582 : mapChunk_353582.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_353022_001121 : mapNode_353022_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_353022 mapChunk_353582
    10 10 height_mapChunk_353022 height_mapChunk_353582
theorem height_mapNode_351901_002242 : mapNode_351901_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_351901_001121 mapNode_353022_001121
    11 11 height_mapNode_351901_001121 height_mapNode_353022_001121
theorem height_mapNode_349660_004483 : mapNode_349660_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_349660_002241 mapNode_351901_002242
    12 12 height_mapNode_349660_002241 height_mapNode_351901_002242
theorem height_mapChunk_354143 : mapChunk_354143.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_354703 : mapChunk_354703.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_354143_001120 : mapNode_354143_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_354143 mapChunk_354703
    10 10 height_mapChunk_354143 height_mapChunk_354703
theorem height_mapChunk_355263 : mapChunk_355263.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_355823 : mapChunk_355823.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_355263_001121 : mapNode_355263_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_355263 mapChunk_355823
    10 10 height_mapChunk_355263 height_mapChunk_355823
theorem height_mapNode_354143_002241 : mapNode_354143_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_354143_001120 mapNode_355263_001121
    11 11 height_mapNode_354143_001120 height_mapNode_355263_001121
theorem height_mapChunk_356384 : mapChunk_356384.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_356944 : mapChunk_356944.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_356384_001121 : mapNode_356384_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_356384 mapChunk_356944
    10 10 height_mapChunk_356384 height_mapChunk_356944
theorem height_mapChunk_357505 : mapChunk_357505.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_358065 : mapChunk_358065.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_357505_001121 : mapNode_357505_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_357505 mapChunk_358065
    10 10 height_mapChunk_357505 height_mapChunk_358065
theorem height_mapNode_356384_002242 : mapNode_356384_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_356384_001121 mapNode_357505_001121
    11 11 height_mapNode_356384_001121 height_mapNode_357505_001121
theorem height_mapNode_354143_004483 : mapNode_354143_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_354143_002241 mapNode_356384_002242
    12 12 height_mapNode_354143_002241 height_mapNode_356384_002242
theorem height_mapNode_349660_008966 : mapNode_349660_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_349660_004483 mapNode_354143_004483
    13 13 height_mapNode_349660_004483 height_mapNode_354143_004483
theorem height_mapNode_340694_017932 : mapNode_340694_017932.height ≤ 15 := by
  exact height_branch 8966 mapNode_340694_008966 mapNode_349660_008966
    14 14 height_mapNode_340694_008966 height_mapNode_349660_008966
theorem height_mapNode_322763_035863 : mapNode_322763_035863.height ≤ 16 := by
  exact height_branch 17931 mapNode_322763_017931 mapNode_340694_017932
    15 15 height_mapNode_322763_017931 height_mapNode_340694_017932
theorem height_mapNode_286901_071725 : mapNode_286901_071725.height ≤ 17 := by
  exact height_branch 35862 mapNode_286901_035862 mapNode_322763_035863
    16 16 height_mapNode_286901_035862 height_mapNode_322763_035863
theorem height_mapChunk_358626 : mapChunk_358626.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_359186 : mapChunk_359186.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_358626_001120 : mapNode_358626_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_358626 mapChunk_359186
    10 10 height_mapChunk_358626 height_mapChunk_359186
theorem height_mapChunk_359746 : mapChunk_359746.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_360306 : mapChunk_360306.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_359746_001121 : mapNode_359746_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_359746 mapChunk_360306
    10 10 height_mapChunk_359746 height_mapChunk_360306
theorem height_mapNode_358626_002241 : mapNode_358626_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_358626_001120 mapNode_359746_001121
    11 11 height_mapNode_358626_001120 height_mapNode_359746_001121
theorem height_mapChunk_360867 : mapChunk_360867.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_361427 : mapChunk_361427.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_360867_001120 : mapNode_360867_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_360867 mapChunk_361427
    10 10 height_mapChunk_360867 height_mapChunk_361427
theorem height_mapChunk_361987 : mapChunk_361987.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_362547 : mapChunk_362547.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_361987_001121 : mapNode_361987_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_361987 mapChunk_362547
    10 10 height_mapChunk_361987 height_mapChunk_362547
theorem height_mapNode_360867_002241 : mapNode_360867_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_360867_001120 mapNode_361987_001121
    11 11 height_mapNode_360867_001120 height_mapNode_361987_001121
theorem height_mapNode_358626_004482 : mapNode_358626_004482.height ≤ 13 := by
  exact height_branch 2241 mapNode_358626_002241 mapNode_360867_002241
    12 12 height_mapNode_358626_002241 height_mapNode_360867_002241
theorem height_mapChunk_363108 : mapChunk_363108.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_363668 : mapChunk_363668.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_363108_001120 : mapNode_363108_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_363108 mapChunk_363668
    10 10 height_mapChunk_363108 height_mapChunk_363668
theorem height_mapChunk_364228 : mapChunk_364228.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_364788 : mapChunk_364788.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_364228_001121 : mapNode_364228_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_364228 mapChunk_364788
    10 10 height_mapChunk_364228 height_mapChunk_364788
theorem height_mapNode_363108_002241 : mapNode_363108_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_363108_001120 mapNode_364228_001121
    11 11 height_mapNode_363108_001120 height_mapNode_364228_001121
theorem height_mapChunk_365349 : mapChunk_365349.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_365909 : mapChunk_365909.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_365349_001121 : mapNode_365349_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_365349 mapChunk_365909
    10 10 height_mapChunk_365349 height_mapChunk_365909
theorem height_mapChunk_366470 : mapChunk_366470.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_367030 : mapChunk_367030.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_366470_001121 : mapNode_366470_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_366470 mapChunk_367030
    10 10 height_mapChunk_366470 height_mapChunk_367030
theorem height_mapNode_365349_002242 : mapNode_365349_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_365349_001121 mapNode_366470_001121
    11 11 height_mapNode_365349_001121 height_mapNode_366470_001121
theorem height_mapNode_363108_004483 : mapNode_363108_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_363108_002241 mapNode_365349_002242
    12 12 height_mapNode_363108_002241 height_mapNode_365349_002242
theorem height_mapNode_358626_008965 : mapNode_358626_008965.height ≤ 14 := by
  exact height_branch 4482 mapNode_358626_004482 mapNode_363108_004483
    13 13 height_mapNode_358626_004482 height_mapNode_363108_004483
theorem height_mapChunk_367591 : mapChunk_367591.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_368151 : mapChunk_368151.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_367591_001120 : mapNode_367591_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_367591 mapChunk_368151
    10 10 height_mapChunk_367591 height_mapChunk_368151
theorem height_mapChunk_368711 : mapChunk_368711.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_369271 : mapChunk_369271.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_368711_001121 : mapNode_368711_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_368711 mapChunk_369271
    10 10 height_mapChunk_368711 height_mapChunk_369271
theorem height_mapNode_367591_002241 : mapNode_367591_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_367591_001120 mapNode_368711_001121
    11 11 height_mapNode_367591_001120 height_mapNode_368711_001121
theorem height_mapChunk_369832 : mapChunk_369832.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_370392 : mapChunk_370392.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_369832_001121 : mapNode_369832_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_369832 mapChunk_370392
    10 10 height_mapChunk_369832 height_mapChunk_370392
theorem height_mapChunk_370953 : mapChunk_370953.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_371513 : mapChunk_371513.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_370953_001121 : mapNode_370953_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_370953 mapChunk_371513
    10 10 height_mapChunk_370953 height_mapChunk_371513
theorem height_mapNode_369832_002242 : mapNode_369832_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_369832_001121 mapNode_370953_001121
    11 11 height_mapNode_369832_001121 height_mapNode_370953_001121
theorem height_mapNode_367591_004483 : mapNode_367591_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_367591_002241 mapNode_369832_002242
    12 12 height_mapNode_367591_002241 height_mapNode_369832_002242
theorem height_mapChunk_372074 : mapChunk_372074.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_372634 : mapChunk_372634.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_372074_001120 : mapNode_372074_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_372074 mapChunk_372634
    10 10 height_mapChunk_372074 height_mapChunk_372634
theorem height_mapChunk_373194 : mapChunk_373194.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_373754 : mapChunk_373754.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_373194_001121 : mapNode_373194_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_373194 mapChunk_373754
    10 10 height_mapChunk_373194 height_mapChunk_373754
theorem height_mapNode_372074_002241 : mapNode_372074_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_372074_001120 mapNode_373194_001121
    11 11 height_mapNode_372074_001120 height_mapNode_373194_001121
theorem height_mapChunk_374315 : mapChunk_374315.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_374875 : mapChunk_374875.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_374315_001121 : mapNode_374315_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_374315 mapChunk_374875
    10 10 height_mapChunk_374315 height_mapChunk_374875
theorem height_mapChunk_375436 : mapChunk_375436.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_375996 : mapChunk_375996.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_375436_001121 : mapNode_375436_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_375436 mapChunk_375996
    10 10 height_mapChunk_375436 height_mapChunk_375996
theorem height_mapNode_374315_002242 : mapNode_374315_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_374315_001121 mapNode_375436_001121
    11 11 height_mapNode_374315_001121 height_mapNode_375436_001121
theorem height_mapNode_372074_004483 : mapNode_372074_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_372074_002241 mapNode_374315_002242
    12 12 height_mapNode_372074_002241 height_mapNode_374315_002242
theorem height_mapNode_367591_008966 : mapNode_367591_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_367591_004483 mapNode_372074_004483
    13 13 height_mapNode_367591_004483 height_mapNode_372074_004483
theorem height_mapNode_358626_017931 : mapNode_358626_017931.height ≤ 15 := by
  exact height_branch 8965 mapNode_358626_008965 mapNode_367591_008966
    14 14 height_mapNode_358626_008965 height_mapNode_367591_008966
theorem height_mapChunk_376557 : mapChunk_376557.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_377117 : mapChunk_377117.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_376557_001120 : mapNode_376557_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_376557 mapChunk_377117
    10 10 height_mapChunk_376557 height_mapChunk_377117
theorem height_mapChunk_377677 : mapChunk_377677.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_378237 : mapChunk_378237.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_377677_001121 : mapNode_377677_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_377677 mapChunk_378237
    10 10 height_mapChunk_377677 height_mapChunk_378237
theorem height_mapNode_376557_002241 : mapNode_376557_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_376557_001120 mapNode_377677_001121
    11 11 height_mapNode_376557_001120 height_mapNode_377677_001121
theorem height_mapChunk_378798 : mapChunk_378798.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_379358 : mapChunk_379358.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_378798_001120 : mapNode_378798_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_378798 mapChunk_379358
    10 10 height_mapChunk_378798 height_mapChunk_379358
theorem height_mapChunk_379918 : mapChunk_379918.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_380478 : mapChunk_380478.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_379918_001121 : mapNode_379918_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_379918 mapChunk_380478
    10 10 height_mapChunk_379918 height_mapChunk_380478
theorem height_mapNode_378798_002241 : mapNode_378798_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_378798_001120 mapNode_379918_001121
    11 11 height_mapNode_378798_001120 height_mapNode_379918_001121
theorem height_mapNode_376557_004482 : mapNode_376557_004482.height ≤ 13 := by
  exact height_branch 2241 mapNode_376557_002241 mapNode_378798_002241
    12 12 height_mapNode_376557_002241 height_mapNode_378798_002241
theorem height_mapChunk_381039 : mapChunk_381039.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_381599 : mapChunk_381599.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_381039_001120 : mapNode_381039_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_381039 mapChunk_381599
    10 10 height_mapChunk_381039 height_mapChunk_381599
theorem height_mapChunk_382159 : mapChunk_382159.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_382719 : mapChunk_382719.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_382159_001121 : mapNode_382159_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_382159 mapChunk_382719
    10 10 height_mapChunk_382159 height_mapChunk_382719
theorem height_mapNode_381039_002241 : mapNode_381039_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_381039_001120 mapNode_382159_001121
    11 11 height_mapNode_381039_001120 height_mapNode_382159_001121
theorem height_mapChunk_383280 : mapChunk_383280.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_383840 : mapChunk_383840.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_383280_001121 : mapNode_383280_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_383280 mapChunk_383840
    10 10 height_mapChunk_383280 height_mapChunk_383840
theorem height_mapChunk_384401 : mapChunk_384401.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_384961 : mapChunk_384961.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_384401_001121 : mapNode_384401_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_384401 mapChunk_384961
    10 10 height_mapChunk_384401 height_mapChunk_384961
theorem height_mapNode_383280_002242 : mapNode_383280_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_383280_001121 mapNode_384401_001121
    11 11 height_mapNode_383280_001121 height_mapNode_384401_001121
theorem height_mapNode_381039_004483 : mapNode_381039_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_381039_002241 mapNode_383280_002242
    12 12 height_mapNode_381039_002241 height_mapNode_383280_002242
theorem height_mapNode_376557_008965 : mapNode_376557_008965.height ≤ 14 := by
  exact height_branch 4482 mapNode_376557_004482 mapNode_381039_004483
    13 13 height_mapNode_376557_004482 height_mapNode_381039_004483
theorem height_mapChunk_385522 : mapChunk_385522.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_386082 : mapChunk_386082.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_385522_001120 : mapNode_385522_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_385522 mapChunk_386082
    10 10 height_mapChunk_385522 height_mapChunk_386082
theorem height_mapChunk_386642 : mapChunk_386642.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_387202 : mapChunk_387202.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_386642_001121 : mapNode_386642_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_386642 mapChunk_387202
    10 10 height_mapChunk_386642 height_mapChunk_387202
theorem height_mapNode_385522_002241 : mapNode_385522_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_385522_001120 mapNode_386642_001121
    11 11 height_mapNode_385522_001120 height_mapNode_386642_001121
theorem height_mapChunk_387763 : mapChunk_387763.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_388323 : mapChunk_388323.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_387763_001121 : mapNode_387763_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_387763 mapChunk_388323
    10 10 height_mapChunk_387763 height_mapChunk_388323
theorem height_mapChunk_388884 : mapChunk_388884.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_389444 : mapChunk_389444.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_388884_001121 : mapNode_388884_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_388884 mapChunk_389444
    10 10 height_mapChunk_388884 height_mapChunk_389444
theorem height_mapNode_387763_002242 : mapNode_387763_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_387763_001121 mapNode_388884_001121
    11 11 height_mapNode_387763_001121 height_mapNode_388884_001121
theorem height_mapNode_385522_004483 : mapNode_385522_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_385522_002241 mapNode_387763_002242
    12 12 height_mapNode_385522_002241 height_mapNode_387763_002242
theorem height_mapChunk_390005 : mapChunk_390005.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_390565 : mapChunk_390565.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_390005_001120 : mapNode_390005_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_390005 mapChunk_390565
    10 10 height_mapChunk_390005 height_mapChunk_390565
theorem height_mapChunk_391125 : mapChunk_391125.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_391685 : mapChunk_391685.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_391125_001121 : mapNode_391125_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_391125 mapChunk_391685
    10 10 height_mapChunk_391125 height_mapChunk_391685
theorem height_mapNode_390005_002241 : mapNode_390005_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_390005_001120 mapNode_391125_001121
    11 11 height_mapNode_390005_001120 height_mapNode_391125_001121
theorem height_mapChunk_392246 : mapChunk_392246.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_392806 : mapChunk_392806.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_392246_001121 : mapNode_392246_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_392246 mapChunk_392806
    10 10 height_mapChunk_392246 height_mapChunk_392806
theorem height_mapChunk_393367 : mapChunk_393367.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_393927 : mapChunk_393927.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_393367_001121 : mapNode_393367_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_393367 mapChunk_393927
    10 10 height_mapChunk_393367 height_mapChunk_393927
theorem height_mapNode_392246_002242 : mapNode_392246_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_392246_001121 mapNode_393367_001121
    11 11 height_mapNode_392246_001121 height_mapNode_393367_001121
theorem height_mapNode_390005_004483 : mapNode_390005_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_390005_002241 mapNode_392246_002242
    12 12 height_mapNode_390005_002241 height_mapNode_392246_002242
theorem height_mapNode_385522_008966 : mapNode_385522_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_385522_004483 mapNode_390005_004483
    13 13 height_mapNode_385522_004483 height_mapNode_390005_004483
theorem height_mapNode_376557_017931 : mapNode_376557_017931.height ≤ 15 := by
  exact height_branch 8965 mapNode_376557_008965 mapNode_385522_008966
    14 14 height_mapNode_376557_008965 height_mapNode_385522_008966
theorem height_mapNode_358626_035862 : mapNode_358626_035862.height ≤ 16 := by
  exact height_branch 17931 mapNode_358626_017931 mapNode_376557_017931
    15 15 height_mapNode_358626_017931 height_mapNode_376557_017931
theorem height_mapChunk_394488 : mapChunk_394488.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_395048 : mapChunk_395048.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_394488_001120 : mapNode_394488_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_394488 mapChunk_395048
    10 10 height_mapChunk_394488 height_mapChunk_395048
theorem height_mapChunk_395608 : mapChunk_395608.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_396168 : mapChunk_396168.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_395608_001121 : mapNode_395608_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_395608 mapChunk_396168
    10 10 height_mapChunk_395608 height_mapChunk_396168
theorem height_mapNode_394488_002241 : mapNode_394488_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_394488_001120 mapNode_395608_001121
    11 11 height_mapNode_394488_001120 height_mapNode_395608_001121
theorem height_mapChunk_396729 : mapChunk_396729.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_397289 : mapChunk_397289.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_396729_001120 : mapNode_396729_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_396729 mapChunk_397289
    10 10 height_mapChunk_396729 height_mapChunk_397289
theorem height_mapChunk_397849 : mapChunk_397849.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_398409 : mapChunk_398409.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_397849_001121 : mapNode_397849_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_397849 mapChunk_398409
    10 10 height_mapChunk_397849 height_mapChunk_398409
theorem height_mapNode_396729_002241 : mapNode_396729_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_396729_001120 mapNode_397849_001121
    11 11 height_mapNode_396729_001120 height_mapNode_397849_001121
theorem height_mapNode_394488_004482 : mapNode_394488_004482.height ≤ 13 := by
  exact height_branch 2241 mapNode_394488_002241 mapNode_396729_002241
    12 12 height_mapNode_394488_002241 height_mapNode_396729_002241
theorem height_mapChunk_398970 : mapChunk_398970.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_399530 : mapChunk_399530.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_398970_001120 : mapNode_398970_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_398970 mapChunk_399530
    10 10 height_mapChunk_398970 height_mapChunk_399530
theorem height_mapChunk_400090 : mapChunk_400090.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_400650 : mapChunk_400650.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_400090_001121 : mapNode_400090_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_400090 mapChunk_400650
    10 10 height_mapChunk_400090 height_mapChunk_400650
theorem height_mapNode_398970_002241 : mapNode_398970_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_398970_001120 mapNode_400090_001121
    11 11 height_mapNode_398970_001120 height_mapNode_400090_001121
theorem height_mapChunk_401211 : mapChunk_401211.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_401771 : mapChunk_401771.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_401211_001121 : mapNode_401211_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_401211 mapChunk_401771
    10 10 height_mapChunk_401211 height_mapChunk_401771
theorem height_mapChunk_402332 : mapChunk_402332.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_402892 : mapChunk_402892.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_402332_001121 : mapNode_402332_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_402332 mapChunk_402892
    10 10 height_mapChunk_402332 height_mapChunk_402892
theorem height_mapNode_401211_002242 : mapNode_401211_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_401211_001121 mapNode_402332_001121
    11 11 height_mapNode_401211_001121 height_mapNode_402332_001121
theorem height_mapNode_398970_004483 : mapNode_398970_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_398970_002241 mapNode_401211_002242
    12 12 height_mapNode_398970_002241 height_mapNode_401211_002242
theorem height_mapNode_394488_008965 : mapNode_394488_008965.height ≤ 14 := by
  exact height_branch 4482 mapNode_394488_004482 mapNode_398970_004483
    13 13 height_mapNode_394488_004482 height_mapNode_398970_004483
theorem height_mapChunk_403453 : mapChunk_403453.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_404013 : mapChunk_404013.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_403453_001120 : mapNode_403453_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_403453 mapChunk_404013
    10 10 height_mapChunk_403453 height_mapChunk_404013
theorem height_mapChunk_404573 : mapChunk_404573.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_405133 : mapChunk_405133.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_404573_001121 : mapNode_404573_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_404573 mapChunk_405133
    10 10 height_mapChunk_404573 height_mapChunk_405133
theorem height_mapNode_403453_002241 : mapNode_403453_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_403453_001120 mapNode_404573_001121
    11 11 height_mapNode_403453_001120 height_mapNode_404573_001121
theorem height_mapChunk_405694 : mapChunk_405694.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_406254 : mapChunk_406254.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_405694_001121 : mapNode_405694_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_405694 mapChunk_406254
    10 10 height_mapChunk_405694 height_mapChunk_406254
theorem height_mapChunk_406815 : mapChunk_406815.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_407375 : mapChunk_407375.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_406815_001121 : mapNode_406815_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_406815 mapChunk_407375
    10 10 height_mapChunk_406815 height_mapChunk_407375
theorem height_mapNode_405694_002242 : mapNode_405694_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_405694_001121 mapNode_406815_001121
    11 11 height_mapNode_405694_001121 height_mapNode_406815_001121
theorem height_mapNode_403453_004483 : mapNode_403453_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_403453_002241 mapNode_405694_002242
    12 12 height_mapNode_403453_002241 height_mapNode_405694_002242
theorem height_mapChunk_407936 : mapChunk_407936.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_408496 : mapChunk_408496.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_407936_001120 : mapNode_407936_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_407936 mapChunk_408496
    10 10 height_mapChunk_407936 height_mapChunk_408496
theorem height_mapChunk_409056 : mapChunk_409056.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_409616 : mapChunk_409616.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_409056_001121 : mapNode_409056_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_409056 mapChunk_409616
    10 10 height_mapChunk_409056 height_mapChunk_409616
theorem height_mapNode_407936_002241 : mapNode_407936_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_407936_001120 mapNode_409056_001121
    11 11 height_mapNode_407936_001120 height_mapNode_409056_001121
theorem height_mapChunk_410177 : mapChunk_410177.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_410737 : mapChunk_410737.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_410177_001121 : mapNode_410177_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_410177 mapChunk_410737
    10 10 height_mapChunk_410177 height_mapChunk_410737
theorem height_mapChunk_411298 : mapChunk_411298.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_411858 : mapChunk_411858.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_411298_001121 : mapNode_411298_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_411298 mapChunk_411858
    10 10 height_mapChunk_411298 height_mapChunk_411858
theorem height_mapNode_410177_002242 : mapNode_410177_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_410177_001121 mapNode_411298_001121
    11 11 height_mapNode_410177_001121 height_mapNode_411298_001121
theorem height_mapNode_407936_004483 : mapNode_407936_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_407936_002241 mapNode_410177_002242
    12 12 height_mapNode_407936_002241 height_mapNode_410177_002242
theorem height_mapNode_403453_008966 : mapNode_403453_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_403453_004483 mapNode_407936_004483
    13 13 height_mapNode_403453_004483 height_mapNode_407936_004483
theorem height_mapNode_394488_017931 : mapNode_394488_017931.height ≤ 15 := by
  exact height_branch 8965 mapNode_394488_008965 mapNode_403453_008966
    14 14 height_mapNode_394488_008965 height_mapNode_403453_008966
theorem height_mapChunk_412419 : mapChunk_412419.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_412979 : mapChunk_412979.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_412419_001120 : mapNode_412419_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_412419 mapChunk_412979
    10 10 height_mapChunk_412419 height_mapChunk_412979
theorem height_mapChunk_413539 : mapChunk_413539.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_414099 : mapChunk_414099.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_413539_001121 : mapNode_413539_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_413539 mapChunk_414099
    10 10 height_mapChunk_413539 height_mapChunk_414099
theorem height_mapNode_412419_002241 : mapNode_412419_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_412419_001120 mapNode_413539_001121
    11 11 height_mapNode_412419_001120 height_mapNode_413539_001121
theorem height_mapChunk_414660 : mapChunk_414660.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_415220 : mapChunk_415220.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_414660_001121 : mapNode_414660_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_414660 mapChunk_415220
    10 10 height_mapChunk_414660 height_mapChunk_415220
theorem height_mapChunk_415781 : mapChunk_415781.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_416341 : mapChunk_416341.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_415781_001121 : mapNode_415781_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_415781 mapChunk_416341
    10 10 height_mapChunk_415781 height_mapChunk_416341
theorem height_mapNode_414660_002242 : mapNode_414660_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_414660_001121 mapNode_415781_001121
    11 11 height_mapNode_414660_001121 height_mapNode_415781_001121
theorem height_mapNode_412419_004483 : mapNode_412419_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_412419_002241 mapNode_414660_002242
    12 12 height_mapNode_412419_002241 height_mapNode_414660_002242
theorem height_mapChunk_416902 : mapChunk_416902.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_417462 : mapChunk_417462.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_416902_001120 : mapNode_416902_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_416902 mapChunk_417462
    10 10 height_mapChunk_416902 height_mapChunk_417462
theorem height_mapChunk_418022 : mapChunk_418022.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_418582 : mapChunk_418582.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_418022_001121 : mapNode_418022_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_418022 mapChunk_418582
    10 10 height_mapChunk_418022 height_mapChunk_418582
theorem height_mapNode_416902_002241 : mapNode_416902_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_416902_001120 mapNode_418022_001121
    11 11 height_mapNode_416902_001120 height_mapNode_418022_001121
theorem height_mapChunk_419143 : mapChunk_419143.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_419703 : mapChunk_419703.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_419143_001121 : mapNode_419143_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_419143 mapChunk_419703
    10 10 height_mapChunk_419143 height_mapChunk_419703
theorem height_mapChunk_420264 : mapChunk_420264.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_420824 : mapChunk_420824.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_420264_001121 : mapNode_420264_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_420264 mapChunk_420824
    10 10 height_mapChunk_420264 height_mapChunk_420824
theorem height_mapNode_419143_002242 : mapNode_419143_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_419143_001121 mapNode_420264_001121
    11 11 height_mapNode_419143_001121 height_mapNode_420264_001121
theorem height_mapNode_416902_004483 : mapNode_416902_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_416902_002241 mapNode_419143_002242
    12 12 height_mapNode_416902_002241 height_mapNode_419143_002242
theorem height_mapNode_412419_008966 : mapNode_412419_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_412419_004483 mapNode_416902_004483
    13 13 height_mapNode_412419_004483 height_mapNode_416902_004483
theorem height_mapChunk_421385 : mapChunk_421385.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_421945 : mapChunk_421945.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_421385_001120 : mapNode_421385_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_421385 mapChunk_421945
    10 10 height_mapChunk_421385 height_mapChunk_421945
theorem height_mapChunk_422505 : mapChunk_422505.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_423065 : mapChunk_423065.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_422505_001121 : mapNode_422505_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_422505 mapChunk_423065
    10 10 height_mapChunk_422505 height_mapChunk_423065
theorem height_mapNode_421385_002241 : mapNode_421385_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_421385_001120 mapNode_422505_001121
    11 11 height_mapNode_421385_001120 height_mapNode_422505_001121
theorem height_mapChunk_423626 : mapChunk_423626.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_424186 : mapChunk_424186.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_423626_001121 : mapNode_423626_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_423626 mapChunk_424186
    10 10 height_mapChunk_423626 height_mapChunk_424186
theorem height_mapChunk_424747 : mapChunk_424747.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_425307 : mapChunk_425307.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_424747_001121 : mapNode_424747_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_424747 mapChunk_425307
    10 10 height_mapChunk_424747 height_mapChunk_425307
theorem height_mapNode_423626_002242 : mapNode_423626_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_423626_001121 mapNode_424747_001121
    11 11 height_mapNode_423626_001121 height_mapNode_424747_001121
theorem height_mapNode_421385_004483 : mapNode_421385_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_421385_002241 mapNode_423626_002242
    12 12 height_mapNode_421385_002241 height_mapNode_423626_002242
theorem height_mapChunk_425868 : mapChunk_425868.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_426428 : mapChunk_426428.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_425868_001120 : mapNode_425868_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_425868 mapChunk_426428
    10 10 height_mapChunk_425868 height_mapChunk_426428
theorem height_mapChunk_426988 : mapChunk_426988.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_427548 : mapChunk_427548.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_426988_001121 : mapNode_426988_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_426988 mapChunk_427548
    10 10 height_mapChunk_426988 height_mapChunk_427548
theorem height_mapNode_425868_002241 : mapNode_425868_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_425868_001120 mapNode_426988_001121
    11 11 height_mapNode_425868_001120 height_mapNode_426988_001121
theorem height_mapChunk_428109 : mapChunk_428109.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_428669 : mapChunk_428669.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_428109_001121 : mapNode_428109_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_428109 mapChunk_428669
    10 10 height_mapChunk_428109 height_mapChunk_428669
theorem height_mapChunk_429230 : mapChunk_429230.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_429790 : mapChunk_429790.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_429230_001121 : mapNode_429230_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_429230 mapChunk_429790
    10 10 height_mapChunk_429230 height_mapChunk_429790
theorem height_mapNode_428109_002242 : mapNode_428109_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_428109_001121 mapNode_429230_001121
    11 11 height_mapNode_428109_001121 height_mapNode_429230_001121
theorem height_mapNode_425868_004483 : mapNode_425868_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_425868_002241 mapNode_428109_002242
    12 12 height_mapNode_425868_002241 height_mapNode_428109_002242
theorem height_mapNode_421385_008966 : mapNode_421385_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_421385_004483 mapNode_425868_004483
    13 13 height_mapNode_421385_004483 height_mapNode_425868_004483
theorem height_mapNode_412419_017932 : mapNode_412419_017932.height ≤ 15 := by
  exact height_branch 8966 mapNode_412419_008966 mapNode_421385_008966
    14 14 height_mapNode_412419_008966 height_mapNode_421385_008966
theorem height_mapNode_394488_035863 : mapNode_394488_035863.height ≤ 16 := by
  exact height_branch 17931 mapNode_394488_017931 mapNode_412419_017932
    15 15 height_mapNode_394488_017931 height_mapNode_412419_017932
theorem height_mapNode_358626_071725 : mapNode_358626_071725.height ≤ 17 := by
  exact height_branch 35862 mapNode_358626_035862 mapNode_394488_035863
    16 16 height_mapNode_358626_035862 height_mapNode_394488_035863
theorem height_mapNode_286901_143450 : mapNode_286901_143450.height ≤ 18 := by
  exact height_branch 71725 mapNode_286901_071725 mapNode_358626_071725
    17 17 height_mapNode_286901_071725 height_mapNode_358626_071725
theorem height_mapChunk_430351 : mapChunk_430351.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_430911 : mapChunk_430911.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_430351_001120 : mapNode_430351_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_430351 mapChunk_430911
    10 10 height_mapChunk_430351 height_mapChunk_430911
theorem height_mapChunk_431471 : mapChunk_431471.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_432031 : mapChunk_432031.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_431471_001121 : mapNode_431471_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_431471 mapChunk_432031
    10 10 height_mapChunk_431471 height_mapChunk_432031
theorem height_mapNode_430351_002241 : mapNode_430351_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_430351_001120 mapNode_431471_001121
    11 11 height_mapNode_430351_001120 height_mapNode_431471_001121
theorem height_mapChunk_432592 : mapChunk_432592.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_433152 : mapChunk_433152.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_432592_001120 : mapNode_432592_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_432592 mapChunk_433152
    10 10 height_mapChunk_432592 height_mapChunk_433152
theorem height_mapChunk_433712 : mapChunk_433712.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_434272 : mapChunk_434272.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_433712_001121 : mapNode_433712_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_433712 mapChunk_434272
    10 10 height_mapChunk_433712 height_mapChunk_434272
theorem height_mapNode_432592_002241 : mapNode_432592_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_432592_001120 mapNode_433712_001121
    11 11 height_mapNode_432592_001120 height_mapNode_433712_001121
theorem height_mapNode_430351_004482 : mapNode_430351_004482.height ≤ 13 := by
  exact height_branch 2241 mapNode_430351_002241 mapNode_432592_002241
    12 12 height_mapNode_430351_002241 height_mapNode_432592_002241
theorem height_mapChunk_434833 : mapChunk_434833.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_435393 : mapChunk_435393.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_434833_001120 : mapNode_434833_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_434833 mapChunk_435393
    10 10 height_mapChunk_434833 height_mapChunk_435393
theorem height_mapChunk_435953 : mapChunk_435953.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_436513 : mapChunk_436513.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_435953_001121 : mapNode_435953_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_435953 mapChunk_436513
    10 10 height_mapChunk_435953 height_mapChunk_436513
theorem height_mapNode_434833_002241 : mapNode_434833_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_434833_001120 mapNode_435953_001121
    11 11 height_mapNode_434833_001120 height_mapNode_435953_001121
theorem height_mapChunk_437074 : mapChunk_437074.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_437634 : mapChunk_437634.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_437074_001121 : mapNode_437074_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_437074 mapChunk_437634
    10 10 height_mapChunk_437074 height_mapChunk_437634
theorem height_mapChunk_438195 : mapChunk_438195.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_438755 : mapChunk_438755.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_438195_001121 : mapNode_438195_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_438195 mapChunk_438755
    10 10 height_mapChunk_438195 height_mapChunk_438755
theorem height_mapNode_437074_002242 : mapNode_437074_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_437074_001121 mapNode_438195_001121
    11 11 height_mapNode_437074_001121 height_mapNode_438195_001121
theorem height_mapNode_434833_004483 : mapNode_434833_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_434833_002241 mapNode_437074_002242
    12 12 height_mapNode_434833_002241 height_mapNode_437074_002242
theorem height_mapNode_430351_008965 : mapNode_430351_008965.height ≤ 14 := by
  exact height_branch 4482 mapNode_430351_004482 mapNode_434833_004483
    13 13 height_mapNode_430351_004482 height_mapNode_434833_004483
theorem height_mapChunk_439316 : mapChunk_439316.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_439876 : mapChunk_439876.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_439316_001120 : mapNode_439316_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_439316 mapChunk_439876
    10 10 height_mapChunk_439316 height_mapChunk_439876
theorem height_mapChunk_440436 : mapChunk_440436.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_440996 : mapChunk_440996.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_440436_001121 : mapNode_440436_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_440436 mapChunk_440996
    10 10 height_mapChunk_440436 height_mapChunk_440996
theorem height_mapNode_439316_002241 : mapNode_439316_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_439316_001120 mapNode_440436_001121
    11 11 height_mapNode_439316_001120 height_mapNode_440436_001121
theorem height_mapChunk_441557 : mapChunk_441557.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_442117 : mapChunk_442117.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_441557_001121 : mapNode_441557_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_441557 mapChunk_442117
    10 10 height_mapChunk_441557 height_mapChunk_442117
theorem height_mapChunk_442678 : mapChunk_442678.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_443238 : mapChunk_443238.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_442678_001121 : mapNode_442678_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_442678 mapChunk_443238
    10 10 height_mapChunk_442678 height_mapChunk_443238
theorem height_mapNode_441557_002242 : mapNode_441557_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_441557_001121 mapNode_442678_001121
    11 11 height_mapNode_441557_001121 height_mapNode_442678_001121
theorem height_mapNode_439316_004483 : mapNode_439316_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_439316_002241 mapNode_441557_002242
    12 12 height_mapNode_439316_002241 height_mapNode_441557_002242
theorem height_mapChunk_443799 : mapChunk_443799.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_444359 : mapChunk_444359.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_443799_001120 : mapNode_443799_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_443799 mapChunk_444359
    10 10 height_mapChunk_443799 height_mapChunk_444359
theorem height_mapChunk_444919 : mapChunk_444919.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_445479 : mapChunk_445479.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_444919_001121 : mapNode_444919_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_444919 mapChunk_445479
    10 10 height_mapChunk_444919 height_mapChunk_445479
theorem height_mapNode_443799_002241 : mapNode_443799_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_443799_001120 mapNode_444919_001121
    11 11 height_mapNode_443799_001120 height_mapNode_444919_001121
theorem height_mapChunk_446040 : mapChunk_446040.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_446600 : mapChunk_446600.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_446040_001121 : mapNode_446040_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_446040 mapChunk_446600
    10 10 height_mapChunk_446040 height_mapChunk_446600
theorem height_mapChunk_447161 : mapChunk_447161.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_447721 : mapChunk_447721.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_447161_001121 : mapNode_447161_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_447161 mapChunk_447721
    10 10 height_mapChunk_447161 height_mapChunk_447721
theorem height_mapNode_446040_002242 : mapNode_446040_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_446040_001121 mapNode_447161_001121
    11 11 height_mapNode_446040_001121 height_mapNode_447161_001121
theorem height_mapNode_443799_004483 : mapNode_443799_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_443799_002241 mapNode_446040_002242
    12 12 height_mapNode_443799_002241 height_mapNode_446040_002242
theorem height_mapNode_439316_008966 : mapNode_439316_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_439316_004483 mapNode_443799_004483
    13 13 height_mapNode_439316_004483 height_mapNode_443799_004483
theorem height_mapNode_430351_017931 : mapNode_430351_017931.height ≤ 15 := by
  exact height_branch 8965 mapNode_430351_008965 mapNode_439316_008966
    14 14 height_mapNode_430351_008965 height_mapNode_439316_008966
theorem height_mapChunk_448282 : mapChunk_448282.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_448842 : mapChunk_448842.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_448282_001120 : mapNode_448282_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_448282 mapChunk_448842
    10 10 height_mapChunk_448282 height_mapChunk_448842
theorem height_mapChunk_449402 : mapChunk_449402.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_449962 : mapChunk_449962.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_449402_001121 : mapNode_449402_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_449402 mapChunk_449962
    10 10 height_mapChunk_449402 height_mapChunk_449962
theorem height_mapNode_448282_002241 : mapNode_448282_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_448282_001120 mapNode_449402_001121
    11 11 height_mapNode_448282_001120 height_mapNode_449402_001121
theorem height_mapChunk_450523 : mapChunk_450523.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_451083 : mapChunk_451083.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_450523_001120 : mapNode_450523_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_450523 mapChunk_451083
    10 10 height_mapChunk_450523 height_mapChunk_451083
theorem height_mapChunk_451643 : mapChunk_451643.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_452203 : mapChunk_452203.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_451643_001121 : mapNode_451643_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_451643 mapChunk_452203
    10 10 height_mapChunk_451643 height_mapChunk_452203
theorem height_mapNode_450523_002241 : mapNode_450523_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_450523_001120 mapNode_451643_001121
    11 11 height_mapNode_450523_001120 height_mapNode_451643_001121
theorem height_mapNode_448282_004482 : mapNode_448282_004482.height ≤ 13 := by
  exact height_branch 2241 mapNode_448282_002241 mapNode_450523_002241
    12 12 height_mapNode_448282_002241 height_mapNode_450523_002241
theorem height_mapChunk_452764 : mapChunk_452764.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_453324 : mapChunk_453324.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_452764_001120 : mapNode_452764_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_452764 mapChunk_453324
    10 10 height_mapChunk_452764 height_mapChunk_453324
theorem height_mapChunk_453884 : mapChunk_453884.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_454444 : mapChunk_454444.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_453884_001121 : mapNode_453884_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_453884 mapChunk_454444
    10 10 height_mapChunk_453884 height_mapChunk_454444
theorem height_mapNode_452764_002241 : mapNode_452764_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_452764_001120 mapNode_453884_001121
    11 11 height_mapNode_452764_001120 height_mapNode_453884_001121
theorem height_mapChunk_455005 : mapChunk_455005.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_455565 : mapChunk_455565.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_455005_001121 : mapNode_455005_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_455005 mapChunk_455565
    10 10 height_mapChunk_455005 height_mapChunk_455565
theorem height_mapChunk_456126 : mapChunk_456126.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_456686 : mapChunk_456686.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_456126_001121 : mapNode_456126_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_456126 mapChunk_456686
    10 10 height_mapChunk_456126 height_mapChunk_456686
theorem height_mapNode_455005_002242 : mapNode_455005_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_455005_001121 mapNode_456126_001121
    11 11 height_mapNode_455005_001121 height_mapNode_456126_001121
theorem height_mapNode_452764_004483 : mapNode_452764_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_452764_002241 mapNode_455005_002242
    12 12 height_mapNode_452764_002241 height_mapNode_455005_002242
theorem height_mapNode_448282_008965 : mapNode_448282_008965.height ≤ 14 := by
  exact height_branch 4482 mapNode_448282_004482 mapNode_452764_004483
    13 13 height_mapNode_448282_004482 height_mapNode_452764_004483
theorem height_mapChunk_457247 : mapChunk_457247.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_457807 : mapChunk_457807.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_457247_001120 : mapNode_457247_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_457247 mapChunk_457807
    10 10 height_mapChunk_457247 height_mapChunk_457807
theorem height_mapChunk_458367 : mapChunk_458367.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_458927 : mapChunk_458927.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_458367_001121 : mapNode_458367_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_458367 mapChunk_458927
    10 10 height_mapChunk_458367 height_mapChunk_458927
theorem height_mapNode_457247_002241 : mapNode_457247_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_457247_001120 mapNode_458367_001121
    11 11 height_mapNode_457247_001120 height_mapNode_458367_001121
theorem height_mapChunk_459488 : mapChunk_459488.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_460048 : mapChunk_460048.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_459488_001121 : mapNode_459488_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_459488 mapChunk_460048
    10 10 height_mapChunk_459488 height_mapChunk_460048
theorem height_mapChunk_460609 : mapChunk_460609.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_461169 : mapChunk_461169.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_460609_001121 : mapNode_460609_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_460609 mapChunk_461169
    10 10 height_mapChunk_460609 height_mapChunk_461169
theorem height_mapNode_459488_002242 : mapNode_459488_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_459488_001121 mapNode_460609_001121
    11 11 height_mapNode_459488_001121 height_mapNode_460609_001121
theorem height_mapNode_457247_004483 : mapNode_457247_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_457247_002241 mapNode_459488_002242
    12 12 height_mapNode_457247_002241 height_mapNode_459488_002242
theorem height_mapChunk_461730 : mapChunk_461730.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_462290 : mapChunk_462290.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_461730_001120 : mapNode_461730_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_461730 mapChunk_462290
    10 10 height_mapChunk_461730 height_mapChunk_462290
theorem height_mapChunk_462850 : mapChunk_462850.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_463410 : mapChunk_463410.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_462850_001121 : mapNode_462850_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_462850 mapChunk_463410
    10 10 height_mapChunk_462850 height_mapChunk_463410
theorem height_mapNode_461730_002241 : mapNode_461730_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_461730_001120 mapNode_462850_001121
    11 11 height_mapNode_461730_001120 height_mapNode_462850_001121
theorem height_mapChunk_463971 : mapChunk_463971.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_464531 : mapChunk_464531.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_463971_001121 : mapNode_463971_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_463971 mapChunk_464531
    10 10 height_mapChunk_463971 height_mapChunk_464531
theorem height_mapChunk_465092 : mapChunk_465092.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_465652 : mapChunk_465652.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_465092_001121 : mapNode_465092_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_465092 mapChunk_465652
    10 10 height_mapChunk_465092 height_mapChunk_465652
theorem height_mapNode_463971_002242 : mapNode_463971_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_463971_001121 mapNode_465092_001121
    11 11 height_mapNode_463971_001121 height_mapNode_465092_001121
theorem height_mapNode_461730_004483 : mapNode_461730_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_461730_002241 mapNode_463971_002242
    12 12 height_mapNode_461730_002241 height_mapNode_463971_002242
theorem height_mapNode_457247_008966 : mapNode_457247_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_457247_004483 mapNode_461730_004483
    13 13 height_mapNode_457247_004483 height_mapNode_461730_004483
theorem height_mapNode_448282_017931 : mapNode_448282_017931.height ≤ 15 := by
  exact height_branch 8965 mapNode_448282_008965 mapNode_457247_008966
    14 14 height_mapNode_448282_008965 height_mapNode_457247_008966
theorem height_mapNode_430351_035862 : mapNode_430351_035862.height ≤ 16 := by
  exact height_branch 17931 mapNode_430351_017931 mapNode_448282_017931
    15 15 height_mapNode_430351_017931 height_mapNode_448282_017931
theorem height_mapChunk_466213 : mapChunk_466213.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_466773 : mapChunk_466773.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_466213_001120 : mapNode_466213_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_466213 mapChunk_466773
    10 10 height_mapChunk_466213 height_mapChunk_466773
theorem height_mapChunk_467333 : mapChunk_467333.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_467893 : mapChunk_467893.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_467333_001121 : mapNode_467333_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_467333 mapChunk_467893
    10 10 height_mapChunk_467333 height_mapChunk_467893
theorem height_mapNode_466213_002241 : mapNode_466213_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_466213_001120 mapNode_467333_001121
    11 11 height_mapNode_466213_001120 height_mapNode_467333_001121
theorem height_mapChunk_468454 : mapChunk_468454.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_469014 : mapChunk_469014.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_468454_001120 : mapNode_468454_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_468454 mapChunk_469014
    10 10 height_mapChunk_468454 height_mapChunk_469014
theorem height_mapChunk_469574 : mapChunk_469574.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_470134 : mapChunk_470134.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_469574_001121 : mapNode_469574_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_469574 mapChunk_470134
    10 10 height_mapChunk_469574 height_mapChunk_470134
theorem height_mapNode_468454_002241 : mapNode_468454_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_468454_001120 mapNode_469574_001121
    11 11 height_mapNode_468454_001120 height_mapNode_469574_001121
theorem height_mapNode_466213_004482 : mapNode_466213_004482.height ≤ 13 := by
  exact height_branch 2241 mapNode_466213_002241 mapNode_468454_002241
    12 12 height_mapNode_466213_002241 height_mapNode_468454_002241
theorem height_mapChunk_470695 : mapChunk_470695.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_471255 : mapChunk_471255.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_470695_001120 : mapNode_470695_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_470695 mapChunk_471255
    10 10 height_mapChunk_470695 height_mapChunk_471255
theorem height_mapChunk_471815 : mapChunk_471815.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_472375 : mapChunk_472375.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_471815_001121 : mapNode_471815_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_471815 mapChunk_472375
    10 10 height_mapChunk_471815 height_mapChunk_472375
theorem height_mapNode_470695_002241 : mapNode_470695_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_470695_001120 mapNode_471815_001121
    11 11 height_mapNode_470695_001120 height_mapNode_471815_001121
theorem height_mapChunk_472936 : mapChunk_472936.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_473496 : mapChunk_473496.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_472936_001121 : mapNode_472936_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_472936 mapChunk_473496
    10 10 height_mapChunk_472936 height_mapChunk_473496
theorem height_mapChunk_474057 : mapChunk_474057.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_474617 : mapChunk_474617.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_474057_001121 : mapNode_474057_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_474057 mapChunk_474617
    10 10 height_mapChunk_474057 height_mapChunk_474617
theorem height_mapNode_472936_002242 : mapNode_472936_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_472936_001121 mapNode_474057_001121
    11 11 height_mapNode_472936_001121 height_mapNode_474057_001121
theorem height_mapNode_470695_004483 : mapNode_470695_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_470695_002241 mapNode_472936_002242
    12 12 height_mapNode_470695_002241 height_mapNode_472936_002242
theorem height_mapNode_466213_008965 : mapNode_466213_008965.height ≤ 14 := by
  exact height_branch 4482 mapNode_466213_004482 mapNode_470695_004483
    13 13 height_mapNode_466213_004482 height_mapNode_470695_004483
theorem height_mapChunk_475178 : mapChunk_475178.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_475738 : mapChunk_475738.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_475178_001120 : mapNode_475178_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_475178 mapChunk_475738
    10 10 height_mapChunk_475178 height_mapChunk_475738
theorem height_mapChunk_476298 : mapChunk_476298.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_476858 : mapChunk_476858.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_476298_001121 : mapNode_476298_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_476298 mapChunk_476858
    10 10 height_mapChunk_476298 height_mapChunk_476858
theorem height_mapNode_475178_002241 : mapNode_475178_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_475178_001120 mapNode_476298_001121
    11 11 height_mapNode_475178_001120 height_mapNode_476298_001121
theorem height_mapChunk_477419 : mapChunk_477419.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_477979 : mapChunk_477979.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_477419_001121 : mapNode_477419_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_477419 mapChunk_477979
    10 10 height_mapChunk_477419 height_mapChunk_477979
theorem height_mapChunk_478540 : mapChunk_478540.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_479100 : mapChunk_479100.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_478540_001121 : mapNode_478540_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_478540 mapChunk_479100
    10 10 height_mapChunk_478540 height_mapChunk_479100
theorem height_mapNode_477419_002242 : mapNode_477419_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_477419_001121 mapNode_478540_001121
    11 11 height_mapNode_477419_001121 height_mapNode_478540_001121
theorem height_mapNode_475178_004483 : mapNode_475178_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_475178_002241 mapNode_477419_002242
    12 12 height_mapNode_475178_002241 height_mapNode_477419_002242
theorem height_mapChunk_479661 : mapChunk_479661.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_480221 : mapChunk_480221.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_479661_001120 : mapNode_479661_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_479661 mapChunk_480221
    10 10 height_mapChunk_479661 height_mapChunk_480221
theorem height_mapChunk_480781 : mapChunk_480781.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_481341 : mapChunk_481341.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_480781_001121 : mapNode_480781_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_480781 mapChunk_481341
    10 10 height_mapChunk_480781 height_mapChunk_481341
theorem height_mapNode_479661_002241 : mapNode_479661_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_479661_001120 mapNode_480781_001121
    11 11 height_mapNode_479661_001120 height_mapNode_480781_001121
theorem height_mapChunk_481902 : mapChunk_481902.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_482462 : mapChunk_482462.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_481902_001121 : mapNode_481902_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_481902 mapChunk_482462
    10 10 height_mapChunk_481902 height_mapChunk_482462
theorem height_mapChunk_483023 : mapChunk_483023.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_483583 : mapChunk_483583.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_483023_001121 : mapNode_483023_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_483023 mapChunk_483583
    10 10 height_mapChunk_483023 height_mapChunk_483583
theorem height_mapNode_481902_002242 : mapNode_481902_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_481902_001121 mapNode_483023_001121
    11 11 height_mapNode_481902_001121 height_mapNode_483023_001121
theorem height_mapNode_479661_004483 : mapNode_479661_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_479661_002241 mapNode_481902_002242
    12 12 height_mapNode_479661_002241 height_mapNode_481902_002242
theorem height_mapNode_475178_008966 : mapNode_475178_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_475178_004483 mapNode_479661_004483
    13 13 height_mapNode_475178_004483 height_mapNode_479661_004483
theorem height_mapNode_466213_017931 : mapNode_466213_017931.height ≤ 15 := by
  exact height_branch 8965 mapNode_466213_008965 mapNode_475178_008966
    14 14 height_mapNode_466213_008965 height_mapNode_475178_008966
theorem height_mapChunk_484144 : mapChunk_484144.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_484704 : mapChunk_484704.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_484144_001120 : mapNode_484144_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_484144 mapChunk_484704
    10 10 height_mapChunk_484144 height_mapChunk_484704
theorem height_mapChunk_485264 : mapChunk_485264.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_485824 : mapChunk_485824.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_485264_001121 : mapNode_485264_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_485264 mapChunk_485824
    10 10 height_mapChunk_485264 height_mapChunk_485824
theorem height_mapNode_484144_002241 : mapNode_484144_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_484144_001120 mapNode_485264_001121
    11 11 height_mapNode_484144_001120 height_mapNode_485264_001121
theorem height_mapChunk_486385 : mapChunk_486385.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_486945 : mapChunk_486945.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_486385_001121 : mapNode_486385_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_486385 mapChunk_486945
    10 10 height_mapChunk_486385 height_mapChunk_486945
theorem height_mapChunk_487506 : mapChunk_487506.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_488066 : mapChunk_488066.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_487506_001121 : mapNode_487506_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_487506 mapChunk_488066
    10 10 height_mapChunk_487506 height_mapChunk_488066
theorem height_mapNode_486385_002242 : mapNode_486385_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_486385_001121 mapNode_487506_001121
    11 11 height_mapNode_486385_001121 height_mapNode_487506_001121
theorem height_mapNode_484144_004483 : mapNode_484144_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_484144_002241 mapNode_486385_002242
    12 12 height_mapNode_484144_002241 height_mapNode_486385_002242
theorem height_mapChunk_488627 : mapChunk_488627.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_489187 : mapChunk_489187.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_488627_001120 : mapNode_488627_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_488627 mapChunk_489187
    10 10 height_mapChunk_488627 height_mapChunk_489187
theorem height_mapChunk_489747 : mapChunk_489747.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_490307 : mapChunk_490307.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_489747_001121 : mapNode_489747_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_489747 mapChunk_490307
    10 10 height_mapChunk_489747 height_mapChunk_490307
theorem height_mapNode_488627_002241 : mapNode_488627_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_488627_001120 mapNode_489747_001121
    11 11 height_mapNode_488627_001120 height_mapNode_489747_001121
theorem height_mapChunk_490868 : mapChunk_490868.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_491428 : mapChunk_491428.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_490868_001121 : mapNode_490868_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_490868 mapChunk_491428
    10 10 height_mapChunk_490868 height_mapChunk_491428
theorem height_mapChunk_491989 : mapChunk_491989.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_492549 : mapChunk_492549.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_491989_001121 : mapNode_491989_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_491989 mapChunk_492549
    10 10 height_mapChunk_491989 height_mapChunk_492549
theorem height_mapNode_490868_002242 : mapNode_490868_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_490868_001121 mapNode_491989_001121
    11 11 height_mapNode_490868_001121 height_mapNode_491989_001121
theorem height_mapNode_488627_004483 : mapNode_488627_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_488627_002241 mapNode_490868_002242
    12 12 height_mapNode_488627_002241 height_mapNode_490868_002242
theorem height_mapNode_484144_008966 : mapNode_484144_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_484144_004483 mapNode_488627_004483
    13 13 height_mapNode_484144_004483 height_mapNode_488627_004483
theorem height_mapChunk_493110 : mapChunk_493110.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_493670 : mapChunk_493670.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_493110_001120 : mapNode_493110_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_493110 mapChunk_493670
    10 10 height_mapChunk_493110 height_mapChunk_493670
theorem height_mapChunk_494230 : mapChunk_494230.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_494790 : mapChunk_494790.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_494230_001121 : mapNode_494230_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_494230 mapChunk_494790
    10 10 height_mapChunk_494230 height_mapChunk_494790
theorem height_mapNode_493110_002241 : mapNode_493110_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_493110_001120 mapNode_494230_001121
    11 11 height_mapNode_493110_001120 height_mapNode_494230_001121
theorem height_mapChunk_495351 : mapChunk_495351.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_495911 : mapChunk_495911.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_495351_001121 : mapNode_495351_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_495351 mapChunk_495911
    10 10 height_mapChunk_495351 height_mapChunk_495911
theorem height_mapChunk_496472 : mapChunk_496472.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_497032 : mapChunk_497032.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_496472_001121 : mapNode_496472_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_496472 mapChunk_497032
    10 10 height_mapChunk_496472 height_mapChunk_497032
theorem height_mapNode_495351_002242 : mapNode_495351_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_495351_001121 mapNode_496472_001121
    11 11 height_mapNode_495351_001121 height_mapNode_496472_001121
theorem height_mapNode_493110_004483 : mapNode_493110_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_493110_002241 mapNode_495351_002242
    12 12 height_mapNode_493110_002241 height_mapNode_495351_002242
theorem height_mapChunk_497593 : mapChunk_497593.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_498153 : mapChunk_498153.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_497593_001120 : mapNode_497593_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_497593 mapChunk_498153
    10 10 height_mapChunk_497593 height_mapChunk_498153
theorem height_mapChunk_498713 : mapChunk_498713.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_499273 : mapChunk_499273.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_498713_001121 : mapNode_498713_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_498713 mapChunk_499273
    10 10 height_mapChunk_498713 height_mapChunk_499273
theorem height_mapNode_497593_002241 : mapNode_497593_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_497593_001120 mapNode_498713_001121
    11 11 height_mapNode_497593_001120 height_mapNode_498713_001121
theorem height_mapChunk_499834 : mapChunk_499834.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_500394 : mapChunk_500394.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_499834_001121 : mapNode_499834_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_499834 mapChunk_500394
    10 10 height_mapChunk_499834 height_mapChunk_500394
theorem height_mapChunk_500955 : mapChunk_500955.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_501515 : mapChunk_501515.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_500955_001121 : mapNode_500955_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_500955 mapChunk_501515
    10 10 height_mapChunk_500955 height_mapChunk_501515
theorem height_mapNode_499834_002242 : mapNode_499834_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_499834_001121 mapNode_500955_001121
    11 11 height_mapNode_499834_001121 height_mapNode_500955_001121
theorem height_mapNode_497593_004483 : mapNode_497593_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_497593_002241 mapNode_499834_002242
    12 12 height_mapNode_497593_002241 height_mapNode_499834_002242
theorem height_mapNode_493110_008966 : mapNode_493110_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_493110_004483 mapNode_497593_004483
    13 13 height_mapNode_493110_004483 height_mapNode_497593_004483
theorem height_mapNode_484144_017932 : mapNode_484144_017932.height ≤ 15 := by
  exact height_branch 8966 mapNode_484144_008966 mapNode_493110_008966
    14 14 height_mapNode_484144_008966 height_mapNode_493110_008966
theorem height_mapNode_466213_035863 : mapNode_466213_035863.height ≤ 16 := by
  exact height_branch 17931 mapNode_466213_017931 mapNode_484144_017932
    15 15 height_mapNode_466213_017931 height_mapNode_484144_017932
theorem height_mapNode_430351_071725 : mapNode_430351_071725.height ≤ 17 := by
  exact height_branch 35862 mapNode_430351_035862 mapNode_466213_035863
    16 16 height_mapNode_430351_035862 height_mapNode_466213_035863
theorem height_mapChunk_502076 : mapChunk_502076.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_502636 : mapChunk_502636.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_502076_001120 : mapNode_502076_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_502076 mapChunk_502636
    10 10 height_mapChunk_502076 height_mapChunk_502636
theorem height_mapChunk_503196 : mapChunk_503196.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_503756 : mapChunk_503756.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_503196_001121 : mapNode_503196_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_503196 mapChunk_503756
    10 10 height_mapChunk_503196 height_mapChunk_503756
theorem height_mapNode_502076_002241 : mapNode_502076_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_502076_001120 mapNode_503196_001121
    11 11 height_mapNode_502076_001120 height_mapNode_503196_001121
theorem height_mapChunk_504317 : mapChunk_504317.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_504877 : mapChunk_504877.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_504317_001120 : mapNode_504317_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_504317 mapChunk_504877
    10 10 height_mapChunk_504317 height_mapChunk_504877
theorem height_mapChunk_505437 : mapChunk_505437.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_505997 : mapChunk_505997.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_505437_001121 : mapNode_505437_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_505437 mapChunk_505997
    10 10 height_mapChunk_505437 height_mapChunk_505997
theorem height_mapNode_504317_002241 : mapNode_504317_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_504317_001120 mapNode_505437_001121
    11 11 height_mapNode_504317_001120 height_mapNode_505437_001121
theorem height_mapNode_502076_004482 : mapNode_502076_004482.height ≤ 13 := by
  exact height_branch 2241 mapNode_502076_002241 mapNode_504317_002241
    12 12 height_mapNode_502076_002241 height_mapNode_504317_002241
theorem height_mapChunk_506558 : mapChunk_506558.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_507118 : mapChunk_507118.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_506558_001120 : mapNode_506558_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_506558 mapChunk_507118
    10 10 height_mapChunk_506558 height_mapChunk_507118
theorem height_mapChunk_507678 : mapChunk_507678.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_508238 : mapChunk_508238.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_507678_001121 : mapNode_507678_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_507678 mapChunk_508238
    10 10 height_mapChunk_507678 height_mapChunk_508238
theorem height_mapNode_506558_002241 : mapNode_506558_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_506558_001120 mapNode_507678_001121
    11 11 height_mapNode_506558_001120 height_mapNode_507678_001121
theorem height_mapChunk_508799 : mapChunk_508799.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_509359 : mapChunk_509359.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_508799_001121 : mapNode_508799_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_508799 mapChunk_509359
    10 10 height_mapChunk_508799 height_mapChunk_509359
theorem height_mapChunk_509920 : mapChunk_509920.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_510480 : mapChunk_510480.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_509920_001121 : mapNode_509920_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_509920 mapChunk_510480
    10 10 height_mapChunk_509920 height_mapChunk_510480
theorem height_mapNode_508799_002242 : mapNode_508799_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_508799_001121 mapNode_509920_001121
    11 11 height_mapNode_508799_001121 height_mapNode_509920_001121
theorem height_mapNode_506558_004483 : mapNode_506558_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_506558_002241 mapNode_508799_002242
    12 12 height_mapNode_506558_002241 height_mapNode_508799_002242
theorem height_mapNode_502076_008965 : mapNode_502076_008965.height ≤ 14 := by
  exact height_branch 4482 mapNode_502076_004482 mapNode_506558_004483
    13 13 height_mapNode_502076_004482 height_mapNode_506558_004483
theorem height_mapChunk_511041 : mapChunk_511041.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_511601 : mapChunk_511601.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_511041_001120 : mapNode_511041_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_511041 mapChunk_511601
    10 10 height_mapChunk_511041 height_mapChunk_511601
theorem height_mapChunk_512161 : mapChunk_512161.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_512721 : mapChunk_512721.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_512161_001121 : mapNode_512161_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_512161 mapChunk_512721
    10 10 height_mapChunk_512161 height_mapChunk_512721
theorem height_mapNode_511041_002241 : mapNode_511041_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_511041_001120 mapNode_512161_001121
    11 11 height_mapNode_511041_001120 height_mapNode_512161_001121
theorem height_mapChunk_513282 : mapChunk_513282.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_513842 : mapChunk_513842.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_513282_001121 : mapNode_513282_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_513282 mapChunk_513842
    10 10 height_mapChunk_513282 height_mapChunk_513842
theorem height_mapChunk_514403 : mapChunk_514403.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_514963 : mapChunk_514963.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_514403_001121 : mapNode_514403_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_514403 mapChunk_514963
    10 10 height_mapChunk_514403 height_mapChunk_514963
theorem height_mapNode_513282_002242 : mapNode_513282_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_513282_001121 mapNode_514403_001121
    11 11 height_mapNode_513282_001121 height_mapNode_514403_001121
theorem height_mapNode_511041_004483 : mapNode_511041_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_511041_002241 mapNode_513282_002242
    12 12 height_mapNode_511041_002241 height_mapNode_513282_002242
theorem height_mapChunk_515524 : mapChunk_515524.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_516084 : mapChunk_516084.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_515524_001120 : mapNode_515524_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_515524 mapChunk_516084
    10 10 height_mapChunk_515524 height_mapChunk_516084
theorem height_mapChunk_516644 : mapChunk_516644.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_517204 : mapChunk_517204.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_516644_001121 : mapNode_516644_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_516644 mapChunk_517204
    10 10 height_mapChunk_516644 height_mapChunk_517204
theorem height_mapNode_515524_002241 : mapNode_515524_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_515524_001120 mapNode_516644_001121
    11 11 height_mapNode_515524_001120 height_mapNode_516644_001121
theorem height_mapChunk_517765 : mapChunk_517765.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_518325 : mapChunk_518325.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_517765_001121 : mapNode_517765_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_517765 mapChunk_518325
    10 10 height_mapChunk_517765 height_mapChunk_518325
theorem height_mapChunk_518886 : mapChunk_518886.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_519446 : mapChunk_519446.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_518886_001121 : mapNode_518886_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_518886 mapChunk_519446
    10 10 height_mapChunk_518886 height_mapChunk_519446
theorem height_mapNode_517765_002242 : mapNode_517765_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_517765_001121 mapNode_518886_001121
    11 11 height_mapNode_517765_001121 height_mapNode_518886_001121
theorem height_mapNode_515524_004483 : mapNode_515524_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_515524_002241 mapNode_517765_002242
    12 12 height_mapNode_515524_002241 height_mapNode_517765_002242
theorem height_mapNode_511041_008966 : mapNode_511041_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_511041_004483 mapNode_515524_004483
    13 13 height_mapNode_511041_004483 height_mapNode_515524_004483
theorem height_mapNode_502076_017931 : mapNode_502076_017931.height ≤ 15 := by
  exact height_branch 8965 mapNode_502076_008965 mapNode_511041_008966
    14 14 height_mapNode_502076_008965 height_mapNode_511041_008966
theorem height_mapChunk_520007 : mapChunk_520007.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_520567 : mapChunk_520567.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_520007_001120 : mapNode_520007_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_520007 mapChunk_520567
    10 10 height_mapChunk_520007 height_mapChunk_520567
theorem height_mapChunk_521127 : mapChunk_521127.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_521687 : mapChunk_521687.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_521127_001121 : mapNode_521127_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_521127 mapChunk_521687
    10 10 height_mapChunk_521127 height_mapChunk_521687
theorem height_mapNode_520007_002241 : mapNode_520007_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_520007_001120 mapNode_521127_001121
    11 11 height_mapNode_520007_001120 height_mapNode_521127_001121
theorem height_mapChunk_522248 : mapChunk_522248.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_522808 : mapChunk_522808.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_522248_001121 : mapNode_522248_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_522248 mapChunk_522808
    10 10 height_mapChunk_522248 height_mapChunk_522808
theorem height_mapChunk_523369 : mapChunk_523369.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_523929 : mapChunk_523929.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_523369_001121 : mapNode_523369_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_523369 mapChunk_523929
    10 10 height_mapChunk_523369 height_mapChunk_523929
theorem height_mapNode_522248_002242 : mapNode_522248_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_522248_001121 mapNode_523369_001121
    11 11 height_mapNode_522248_001121 height_mapNode_523369_001121
theorem height_mapNode_520007_004483 : mapNode_520007_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_520007_002241 mapNode_522248_002242
    12 12 height_mapNode_520007_002241 height_mapNode_522248_002242
theorem height_mapChunk_524490 : mapChunk_524490.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_525050 : mapChunk_525050.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_524490_001120 : mapNode_524490_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_524490 mapChunk_525050
    10 10 height_mapChunk_524490 height_mapChunk_525050
theorem height_mapChunk_525610 : mapChunk_525610.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_526170 : mapChunk_526170.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_525610_001121 : mapNode_525610_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_525610 mapChunk_526170
    10 10 height_mapChunk_525610 height_mapChunk_526170
theorem height_mapNode_524490_002241 : mapNode_524490_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_524490_001120 mapNode_525610_001121
    11 11 height_mapNode_524490_001120 height_mapNode_525610_001121
theorem height_mapChunk_526731 : mapChunk_526731.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_527291 : mapChunk_527291.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_526731_001121 : mapNode_526731_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_526731 mapChunk_527291
    10 10 height_mapChunk_526731 height_mapChunk_527291
theorem height_mapChunk_527852 : mapChunk_527852.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_528412 : mapChunk_528412.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_527852_001121 : mapNode_527852_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_527852 mapChunk_528412
    10 10 height_mapChunk_527852 height_mapChunk_528412
theorem height_mapNode_526731_002242 : mapNode_526731_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_526731_001121 mapNode_527852_001121
    11 11 height_mapNode_526731_001121 height_mapNode_527852_001121
theorem height_mapNode_524490_004483 : mapNode_524490_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_524490_002241 mapNode_526731_002242
    12 12 height_mapNode_524490_002241 height_mapNode_526731_002242
theorem height_mapNode_520007_008966 : mapNode_520007_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_520007_004483 mapNode_524490_004483
    13 13 height_mapNode_520007_004483 height_mapNode_524490_004483
theorem height_mapChunk_528973 : mapChunk_528973.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_529533 : mapChunk_529533.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_528973_001120 : mapNode_528973_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_528973 mapChunk_529533
    10 10 height_mapChunk_528973 height_mapChunk_529533
theorem height_mapChunk_530093 : mapChunk_530093.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_530653 : mapChunk_530653.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_530093_001121 : mapNode_530093_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_530093 mapChunk_530653
    10 10 height_mapChunk_530093 height_mapChunk_530653
theorem height_mapNode_528973_002241 : mapNode_528973_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_528973_001120 mapNode_530093_001121
    11 11 height_mapNode_528973_001120 height_mapNode_530093_001121
theorem height_mapChunk_531214 : mapChunk_531214.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_531774 : mapChunk_531774.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_531214_001121 : mapNode_531214_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_531214 mapChunk_531774
    10 10 height_mapChunk_531214 height_mapChunk_531774
theorem height_mapChunk_532335 : mapChunk_532335.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_532895 : mapChunk_532895.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_532335_001121 : mapNode_532335_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_532335 mapChunk_532895
    10 10 height_mapChunk_532335 height_mapChunk_532895
theorem height_mapNode_531214_002242 : mapNode_531214_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_531214_001121 mapNode_532335_001121
    11 11 height_mapNode_531214_001121 height_mapNode_532335_001121
theorem height_mapNode_528973_004483 : mapNode_528973_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_528973_002241 mapNode_531214_002242
    12 12 height_mapNode_528973_002241 height_mapNode_531214_002242
theorem height_mapChunk_533456 : mapChunk_533456.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_534016 : mapChunk_534016.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_533456_001120 : mapNode_533456_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_533456 mapChunk_534016
    10 10 height_mapChunk_533456 height_mapChunk_534016
theorem height_mapChunk_534576 : mapChunk_534576.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_535136 : mapChunk_535136.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_534576_001121 : mapNode_534576_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_534576 mapChunk_535136
    10 10 height_mapChunk_534576 height_mapChunk_535136
theorem height_mapNode_533456_002241 : mapNode_533456_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_533456_001120 mapNode_534576_001121
    11 11 height_mapNode_533456_001120 height_mapNode_534576_001121
theorem height_mapChunk_535697 : mapChunk_535697.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_536257 : mapChunk_536257.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_535697_001121 : mapNode_535697_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_535697 mapChunk_536257
    10 10 height_mapChunk_535697 height_mapChunk_536257
theorem height_mapChunk_536818 : mapChunk_536818.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_537378 : mapChunk_537378.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_536818_001121 : mapNode_536818_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_536818 mapChunk_537378
    10 10 height_mapChunk_536818 height_mapChunk_537378
theorem height_mapNode_535697_002242 : mapNode_535697_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_535697_001121 mapNode_536818_001121
    11 11 height_mapNode_535697_001121 height_mapNode_536818_001121
theorem height_mapNode_533456_004483 : mapNode_533456_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_533456_002241 mapNode_535697_002242
    12 12 height_mapNode_533456_002241 height_mapNode_535697_002242
theorem height_mapNode_528973_008966 : mapNode_528973_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_528973_004483 mapNode_533456_004483
    13 13 height_mapNode_528973_004483 height_mapNode_533456_004483
theorem height_mapNode_520007_017932 : mapNode_520007_017932.height ≤ 15 := by
  exact height_branch 8966 mapNode_520007_008966 mapNode_528973_008966
    14 14 height_mapNode_520007_008966 height_mapNode_528973_008966
theorem height_mapNode_502076_035863 : mapNode_502076_035863.height ≤ 16 := by
  exact height_branch 17931 mapNode_502076_017931 mapNode_520007_017932
    15 15 height_mapNode_502076_017931 height_mapNode_520007_017932
theorem height_mapChunk_537939 : mapChunk_537939.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_538499 : mapChunk_538499.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_537939_001120 : mapNode_537939_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_537939 mapChunk_538499
    10 10 height_mapChunk_537939 height_mapChunk_538499
theorem height_mapChunk_539059 : mapChunk_539059.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_539619 : mapChunk_539619.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_539059_001121 : mapNode_539059_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_539059 mapChunk_539619
    10 10 height_mapChunk_539059 height_mapChunk_539619
theorem height_mapNode_537939_002241 : mapNode_537939_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_537939_001120 mapNode_539059_001121
    11 11 height_mapNode_537939_001120 height_mapNode_539059_001121
theorem height_mapChunk_540180 : mapChunk_540180.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_540740 : mapChunk_540740.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_540180_001120 : mapNode_540180_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_540180 mapChunk_540740
    10 10 height_mapChunk_540180 height_mapChunk_540740
theorem height_mapChunk_541300 : mapChunk_541300.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_541860 : mapChunk_541860.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_541300_001121 : mapNode_541300_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_541300 mapChunk_541860
    10 10 height_mapChunk_541300 height_mapChunk_541860
theorem height_mapNode_540180_002241 : mapNode_540180_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_540180_001120 mapNode_541300_001121
    11 11 height_mapNode_540180_001120 height_mapNode_541300_001121
theorem height_mapNode_537939_004482 : mapNode_537939_004482.height ≤ 13 := by
  exact height_branch 2241 mapNode_537939_002241 mapNode_540180_002241
    12 12 height_mapNode_537939_002241 height_mapNode_540180_002241
theorem height_mapChunk_542421 : mapChunk_542421.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_542981 : mapChunk_542981.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_542421_001120 : mapNode_542421_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_542421 mapChunk_542981
    10 10 height_mapChunk_542421 height_mapChunk_542981
theorem height_mapChunk_543541 : mapChunk_543541.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_544101 : mapChunk_544101.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_543541_001121 : mapNode_543541_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_543541 mapChunk_544101
    10 10 height_mapChunk_543541 height_mapChunk_544101
theorem height_mapNode_542421_002241 : mapNode_542421_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_542421_001120 mapNode_543541_001121
    11 11 height_mapNode_542421_001120 height_mapNode_543541_001121
theorem height_mapChunk_544662 : mapChunk_544662.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_545222 : mapChunk_545222.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_544662_001121 : mapNode_544662_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_544662 mapChunk_545222
    10 10 height_mapChunk_544662 height_mapChunk_545222
theorem height_mapChunk_545783 : mapChunk_545783.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_546343 : mapChunk_546343.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_545783_001121 : mapNode_545783_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_545783 mapChunk_546343
    10 10 height_mapChunk_545783 height_mapChunk_546343
theorem height_mapNode_544662_002242 : mapNode_544662_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_544662_001121 mapNode_545783_001121
    11 11 height_mapNode_544662_001121 height_mapNode_545783_001121
theorem height_mapNode_542421_004483 : mapNode_542421_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_542421_002241 mapNode_544662_002242
    12 12 height_mapNode_542421_002241 height_mapNode_544662_002242
theorem height_mapNode_537939_008965 : mapNode_537939_008965.height ≤ 14 := by
  exact height_branch 4482 mapNode_537939_004482 mapNode_542421_004483
    13 13 height_mapNode_537939_004482 height_mapNode_542421_004483
theorem height_mapChunk_546904 : mapChunk_546904.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_547464 : mapChunk_547464.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_546904_001120 : mapNode_546904_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_546904 mapChunk_547464
    10 10 height_mapChunk_546904 height_mapChunk_547464
theorem height_mapChunk_548024 : mapChunk_548024.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_548584 : mapChunk_548584.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_548024_001121 : mapNode_548024_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_548024 mapChunk_548584
    10 10 height_mapChunk_548024 height_mapChunk_548584
theorem height_mapNode_546904_002241 : mapNode_546904_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_546904_001120 mapNode_548024_001121
    11 11 height_mapNode_546904_001120 height_mapNode_548024_001121
theorem height_mapChunk_549145 : mapChunk_549145.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_549705 : mapChunk_549705.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_549145_001121 : mapNode_549145_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_549145 mapChunk_549705
    10 10 height_mapChunk_549145 height_mapChunk_549705
theorem height_mapChunk_550266 : mapChunk_550266.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_550826 : mapChunk_550826.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_550266_001121 : mapNode_550266_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_550266 mapChunk_550826
    10 10 height_mapChunk_550266 height_mapChunk_550826
theorem height_mapNode_549145_002242 : mapNode_549145_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_549145_001121 mapNode_550266_001121
    11 11 height_mapNode_549145_001121 height_mapNode_550266_001121
theorem height_mapNode_546904_004483 : mapNode_546904_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_546904_002241 mapNode_549145_002242
    12 12 height_mapNode_546904_002241 height_mapNode_549145_002242
theorem height_mapChunk_551387 : mapChunk_551387.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_551947 : mapChunk_551947.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_551387_001120 : mapNode_551387_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_551387 mapChunk_551947
    10 10 height_mapChunk_551387 height_mapChunk_551947
theorem height_mapChunk_552507 : mapChunk_552507.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_553067 : mapChunk_553067.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_552507_001121 : mapNode_552507_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_552507 mapChunk_553067
    10 10 height_mapChunk_552507 height_mapChunk_553067
theorem height_mapNode_551387_002241 : mapNode_551387_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_551387_001120 mapNode_552507_001121
    11 11 height_mapNode_551387_001120 height_mapNode_552507_001121
theorem height_mapChunk_553628 : mapChunk_553628.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_554188 : mapChunk_554188.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_553628_001121 : mapNode_553628_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_553628 mapChunk_554188
    10 10 height_mapChunk_553628 height_mapChunk_554188
theorem height_mapChunk_554749 : mapChunk_554749.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_555309 : mapChunk_555309.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_554749_001121 : mapNode_554749_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_554749 mapChunk_555309
    10 10 height_mapChunk_554749 height_mapChunk_555309
theorem height_mapNode_553628_002242 : mapNode_553628_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_553628_001121 mapNode_554749_001121
    11 11 height_mapNode_553628_001121 height_mapNode_554749_001121
theorem height_mapNode_551387_004483 : mapNode_551387_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_551387_002241 mapNode_553628_002242
    12 12 height_mapNode_551387_002241 height_mapNode_553628_002242
theorem height_mapNode_546904_008966 : mapNode_546904_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_546904_004483 mapNode_551387_004483
    13 13 height_mapNode_546904_004483 height_mapNode_551387_004483
theorem height_mapNode_537939_017931 : mapNode_537939_017931.height ≤ 15 := by
  exact height_branch 8965 mapNode_537939_008965 mapNode_546904_008966
    14 14 height_mapNode_537939_008965 height_mapNode_546904_008966
theorem height_mapChunk_555870 : mapChunk_555870.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_556430 : mapChunk_556430.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_555870_001120 : mapNode_555870_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_555870 mapChunk_556430
    10 10 height_mapChunk_555870 height_mapChunk_556430
theorem height_mapChunk_556990 : mapChunk_556990.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_557550 : mapChunk_557550.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_556990_001121 : mapNode_556990_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_556990 mapChunk_557550
    10 10 height_mapChunk_556990 height_mapChunk_557550
theorem height_mapNode_555870_002241 : mapNode_555870_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_555870_001120 mapNode_556990_001121
    11 11 height_mapNode_555870_001120 height_mapNode_556990_001121
theorem height_mapChunk_558111 : mapChunk_558111.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_558671 : mapChunk_558671.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_558111_001121 : mapNode_558111_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_558111 mapChunk_558671
    10 10 height_mapChunk_558111 height_mapChunk_558671
theorem height_mapChunk_559232 : mapChunk_559232.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_559792 : mapChunk_559792.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_559232_001121 : mapNode_559232_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_559232 mapChunk_559792
    10 10 height_mapChunk_559232 height_mapChunk_559792
theorem height_mapNode_558111_002242 : mapNode_558111_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_558111_001121 mapNode_559232_001121
    11 11 height_mapNode_558111_001121 height_mapNode_559232_001121
theorem height_mapNode_555870_004483 : mapNode_555870_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_555870_002241 mapNode_558111_002242
    12 12 height_mapNode_555870_002241 height_mapNode_558111_002242
theorem height_mapChunk_560353 : mapChunk_560353.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_560913 : mapChunk_560913.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_560353_001120 : mapNode_560353_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_560353 mapChunk_560913
    10 10 height_mapChunk_560353 height_mapChunk_560913
theorem height_mapChunk_561473 : mapChunk_561473.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_562033 : mapChunk_562033.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_561473_001121 : mapNode_561473_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_561473 mapChunk_562033
    10 10 height_mapChunk_561473 height_mapChunk_562033
theorem height_mapNode_560353_002241 : mapNode_560353_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_560353_001120 mapNode_561473_001121
    11 11 height_mapNode_560353_001120 height_mapNode_561473_001121
theorem height_mapChunk_562594 : mapChunk_562594.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_563154 : mapChunk_563154.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_562594_001121 : mapNode_562594_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_562594 mapChunk_563154
    10 10 height_mapChunk_562594 height_mapChunk_563154
theorem height_mapChunk_563715 : mapChunk_563715.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_564275 : mapChunk_564275.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_563715_001121 : mapNode_563715_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_563715 mapChunk_564275
    10 10 height_mapChunk_563715 height_mapChunk_564275
theorem height_mapNode_562594_002242 : mapNode_562594_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_562594_001121 mapNode_563715_001121
    11 11 height_mapNode_562594_001121 height_mapNode_563715_001121
theorem height_mapNode_560353_004483 : mapNode_560353_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_560353_002241 mapNode_562594_002242
    12 12 height_mapNode_560353_002241 height_mapNode_562594_002242
theorem height_mapNode_555870_008966 : mapNode_555870_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_555870_004483 mapNode_560353_004483
    13 13 height_mapNode_555870_004483 height_mapNode_560353_004483
theorem height_mapChunk_564836 : mapChunk_564836.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_565396 : mapChunk_565396.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_564836_001120 : mapNode_564836_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_564836 mapChunk_565396
    10 10 height_mapChunk_564836 height_mapChunk_565396
theorem height_mapChunk_565956 : mapChunk_565956.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_566516 : mapChunk_566516.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_565956_001121 : mapNode_565956_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_565956 mapChunk_566516
    10 10 height_mapChunk_565956 height_mapChunk_566516
theorem height_mapNode_564836_002241 : mapNode_564836_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_564836_001120 mapNode_565956_001121
    11 11 height_mapNode_564836_001120 height_mapNode_565956_001121
theorem height_mapChunk_567077 : mapChunk_567077.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_567637 : mapChunk_567637.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_567077_001121 : mapNode_567077_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_567077 mapChunk_567637
    10 10 height_mapChunk_567077 height_mapChunk_567637
theorem height_mapChunk_568198 : mapChunk_568198.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_568758 : mapChunk_568758.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_568198_001121 : mapNode_568198_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_568198 mapChunk_568758
    10 10 height_mapChunk_568198 height_mapChunk_568758
theorem height_mapNode_567077_002242 : mapNode_567077_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_567077_001121 mapNode_568198_001121
    11 11 height_mapNode_567077_001121 height_mapNode_568198_001121
theorem height_mapNode_564836_004483 : mapNode_564836_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_564836_002241 mapNode_567077_002242
    12 12 height_mapNode_564836_002241 height_mapNode_567077_002242
theorem height_mapChunk_569319 : mapChunk_569319.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_569879 : mapChunk_569879.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_569319_001120 : mapNode_569319_001120.height ≤ 11 := by
  exact height_branch 560 mapChunk_569319 mapChunk_569879
    10 10 height_mapChunk_569319 height_mapChunk_569879
theorem height_mapChunk_570439 : mapChunk_570439.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_570999 : mapChunk_570999.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_570439_001121 : mapNode_570439_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_570439 mapChunk_570999
    10 10 height_mapChunk_570439 height_mapChunk_570999
theorem height_mapNode_569319_002241 : mapNode_569319_002241.height ≤ 12 := by
  exact height_branch 1120 mapNode_569319_001120 mapNode_570439_001121
    11 11 height_mapNode_569319_001120 height_mapNode_570439_001121
theorem height_mapChunk_571560 : mapChunk_571560.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_572120 : mapChunk_572120.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_571560_001121 : mapNode_571560_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_571560 mapChunk_572120
    10 10 height_mapChunk_571560 height_mapChunk_572120
theorem height_mapChunk_572681 : mapChunk_572681.height ≤ 10 := by
  decide +kernel
theorem height_mapChunk_573241 : mapChunk_573241.height ≤ 10 := by
  decide +kernel
theorem height_mapNode_572681_001121 : mapNode_572681_001121.height ≤ 11 := by
  exact height_branch 560 mapChunk_572681 mapChunk_573241
    10 10 height_mapChunk_572681 height_mapChunk_573241
theorem height_mapNode_571560_002242 : mapNode_571560_002242.height ≤ 12 := by
  exact height_branch 1121 mapNode_571560_001121 mapNode_572681_001121
    11 11 height_mapNode_571560_001121 height_mapNode_572681_001121
theorem height_mapNode_569319_004483 : mapNode_569319_004483.height ≤ 13 := by
  exact height_branch 2241 mapNode_569319_002241 mapNode_571560_002242
    12 12 height_mapNode_569319_002241 height_mapNode_571560_002242
theorem height_mapNode_564836_008966 : mapNode_564836_008966.height ≤ 14 := by
  exact height_branch 4483 mapNode_564836_004483 mapNode_569319_004483
    13 13 height_mapNode_564836_004483 height_mapNode_569319_004483
theorem height_mapNode_555870_017932 : mapNode_555870_017932.height ≤ 15 := by
  exact height_branch 8966 mapNode_555870_008966 mapNode_564836_008966
    14 14 height_mapNode_555870_008966 height_mapNode_564836_008966
theorem height_mapNode_537939_035863 : mapNode_537939_035863.height ≤ 16 := by
  exact height_branch 17931 mapNode_537939_017931 mapNode_555870_017932
    15 15 height_mapNode_537939_017931 height_mapNode_555870_017932
theorem height_mapNode_502076_071726 : mapNode_502076_071726.height ≤ 17 := by
  exact height_branch 35863 mapNode_502076_035863 mapNode_537939_035863
    16 16 height_mapNode_502076_035863 height_mapNode_537939_035863
theorem height_mapNode_430351_143451 : mapNode_430351_143451.height ≤ 18 := by
  exact height_branch 71725 mapNode_430351_071725 mapNode_502076_071726
    17 17 height_mapNode_430351_071725 height_mapNode_502076_071726
theorem height_mapNode_286901_286901 : mapNode_286901_286901.height ≤ 19 := by
  exact height_branch 143450 mapNode_286901_143450 mapNode_430351_143451
    18 18 height_mapNode_286901_143450 height_mapNode_430351_143451
theorem height_mapNode_000000_573802 : mapNode_000000_573802.height ≤ 20 := by
  exact height_branch 286901 mapNode_000000_286901 mapNode_286901_286901
    19 19 height_mapNode_000000_286901 height_mapNode_286901_286901
theorem map_height : mapTree.height ≤ 20 :=
  height_mapNode_000000_573802
theorem map_fuel : mapTree.height + 1 ≤ 33 := by
  have bound := map_height
  omega
theorem height_quotientChunk_000000 : quotientChunk_000000.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_000894 : quotientChunk_000894.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_000000_001788 : quotientNode_000000_001788.height ≤ 11 := by
  exact height_branch 894 quotientChunk_000000 quotientChunk_000894
    10 10 height_quotientChunk_000000 height_quotientChunk_000894
theorem height_quotientChunk_001788 : quotientChunk_001788.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_002682 : quotientChunk_002682.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_001788_001789 : quotientNode_001788_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_001788 quotientChunk_002682
    10 10 height_quotientChunk_001788 height_quotientChunk_002682
theorem height_quotientNode_000000_003577 : quotientNode_000000_003577.height ≤ 12 := by
  exact height_branch 1788 quotientNode_000000_001788 quotientNode_001788_001789
    11 11 height_quotientNode_000000_001788 height_quotientNode_001788_001789
theorem height_quotientChunk_003577 : quotientChunk_003577.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_004471 : quotientChunk_004471.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_003577_001789 : quotientNode_003577_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_003577 quotientChunk_004471
    10 10 height_quotientChunk_003577 height_quotientChunk_004471
theorem height_quotientChunk_005366 : quotientChunk_005366.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_006260 : quotientChunk_006260.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_005366_001789 : quotientNode_005366_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_005366 quotientChunk_006260
    10 10 height_quotientChunk_005366 height_quotientChunk_006260
theorem height_quotientNode_003577_003578 : quotientNode_003577_003578.height ≤ 12 := by
  exact height_branch 1789 quotientNode_003577_001789 quotientNode_005366_001789
    11 11 height_quotientNode_003577_001789 height_quotientNode_005366_001789
theorem height_quotientNode_000000_007155 : quotientNode_000000_007155.height ≤ 13 := by
  exact height_branch 3577 quotientNode_000000_003577 quotientNode_003577_003578
    12 12 height_quotientNode_000000_003577 height_quotientNode_003577_003578
theorem height_quotientChunk_007155 : quotientChunk_007155.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_008049 : quotientChunk_008049.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_007155_001788 : quotientNode_007155_001788.height ≤ 11 := by
  exact height_branch 894 quotientChunk_007155 quotientChunk_008049
    10 10 height_quotientChunk_007155 height_quotientChunk_008049
theorem height_quotientChunk_008943 : quotientChunk_008943.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_009837 : quotientChunk_009837.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_008943_001789 : quotientNode_008943_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_008943 quotientChunk_009837
    10 10 height_quotientChunk_008943 height_quotientChunk_009837
theorem height_quotientNode_007155_003577 : quotientNode_007155_003577.height ≤ 12 := by
  exact height_branch 1788 quotientNode_007155_001788 quotientNode_008943_001789
    11 11 height_quotientNode_007155_001788 height_quotientNode_008943_001789
theorem height_quotientChunk_010732 : quotientChunk_010732.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_011626 : quotientChunk_011626.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_010732_001789 : quotientNode_010732_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_010732 quotientChunk_011626
    10 10 height_quotientChunk_010732 height_quotientChunk_011626
theorem height_quotientChunk_012521 : quotientChunk_012521.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_013415 : quotientChunk_013415.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_012521_001789 : quotientNode_012521_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_012521 quotientChunk_013415
    10 10 height_quotientChunk_012521 height_quotientChunk_013415
theorem height_quotientNode_010732_003578 : quotientNode_010732_003578.height ≤ 12 := by
  exact height_branch 1789 quotientNode_010732_001789 quotientNode_012521_001789
    11 11 height_quotientNode_010732_001789 height_quotientNode_012521_001789
theorem height_quotientNode_007155_007155 : quotientNode_007155_007155.height ≤ 13 := by
  exact height_branch 3577 quotientNode_007155_003577 quotientNode_010732_003578
    12 12 height_quotientNode_007155_003577 height_quotientNode_010732_003578
theorem height_quotientNode_000000_014310 : quotientNode_000000_014310.height ≤ 14 := by
  exact height_branch 7155 quotientNode_000000_007155 quotientNode_007155_007155
    13 13 height_quotientNode_000000_007155 height_quotientNode_007155_007155
theorem height_quotientChunk_014310 : quotientChunk_014310.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_015204 : quotientChunk_015204.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_014310_001788 : quotientNode_014310_001788.height ≤ 11 := by
  exact height_branch 894 quotientChunk_014310 quotientChunk_015204
    10 10 height_quotientChunk_014310 height_quotientChunk_015204
theorem height_quotientChunk_016098 : quotientChunk_016098.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_016992 : quotientChunk_016992.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_016098_001789 : quotientNode_016098_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_016098 quotientChunk_016992
    10 10 height_quotientChunk_016098 height_quotientChunk_016992
theorem height_quotientNode_014310_003577 : quotientNode_014310_003577.height ≤ 12 := by
  exact height_branch 1788 quotientNode_014310_001788 quotientNode_016098_001789
    11 11 height_quotientNode_014310_001788 height_quotientNode_016098_001789
theorem height_quotientChunk_017887 : quotientChunk_017887.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_018781 : quotientChunk_018781.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_017887_001789 : quotientNode_017887_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_017887 quotientChunk_018781
    10 10 height_quotientChunk_017887 height_quotientChunk_018781
theorem height_quotientChunk_019676 : quotientChunk_019676.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_020570 : quotientChunk_020570.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_019676_001789 : quotientNode_019676_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_019676 quotientChunk_020570
    10 10 height_quotientChunk_019676 height_quotientChunk_020570
theorem height_quotientNode_017887_003578 : quotientNode_017887_003578.height ≤ 12 := by
  exact height_branch 1789 quotientNode_017887_001789 quotientNode_019676_001789
    11 11 height_quotientNode_017887_001789 height_quotientNode_019676_001789
theorem height_quotientNode_014310_007155 : quotientNode_014310_007155.height ≤ 13 := by
  exact height_branch 3577 quotientNode_014310_003577 quotientNode_017887_003578
    12 12 height_quotientNode_014310_003577 height_quotientNode_017887_003578
theorem height_quotientChunk_021465 : quotientChunk_021465.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_022359 : quotientChunk_022359.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_021465_001789 : quotientNode_021465_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_021465 quotientChunk_022359
    10 10 height_quotientChunk_021465 height_quotientChunk_022359
theorem height_quotientChunk_023254 : quotientChunk_023254.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_024148 : quotientChunk_024148.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_023254_001789 : quotientNode_023254_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_023254 quotientChunk_024148
    10 10 height_quotientChunk_023254 height_quotientChunk_024148
theorem height_quotientNode_021465_003578 : quotientNode_021465_003578.height ≤ 12 := by
  exact height_branch 1789 quotientNode_021465_001789 quotientNode_023254_001789
    11 11 height_quotientNode_021465_001789 height_quotientNode_023254_001789
theorem height_quotientChunk_025043 : quotientChunk_025043.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_025937 : quotientChunk_025937.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_025043_001789 : quotientNode_025043_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_025043 quotientChunk_025937
    10 10 height_quotientChunk_025043 height_quotientChunk_025937
theorem height_quotientChunk_026832 : quotientChunk_026832.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_027726 : quotientChunk_027726.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_026832_001789 : quotientNode_026832_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_026832 quotientChunk_027726
    10 10 height_quotientChunk_026832 height_quotientChunk_027726
theorem height_quotientNode_025043_003578 : quotientNode_025043_003578.height ≤ 12 := by
  exact height_branch 1789 quotientNode_025043_001789 quotientNode_026832_001789
    11 11 height_quotientNode_025043_001789 height_quotientNode_026832_001789
theorem height_quotientNode_021465_007156 : quotientNode_021465_007156.height ≤ 13 := by
  exact height_branch 3578 quotientNode_021465_003578 quotientNode_025043_003578
    12 12 height_quotientNode_021465_003578 height_quotientNode_025043_003578
theorem height_quotientNode_014310_014311 : quotientNode_014310_014311.height ≤ 14 := by
  exact height_branch 7155 quotientNode_014310_007155 quotientNode_021465_007156
    13 13 height_quotientNode_014310_007155 height_quotientNode_021465_007156
theorem height_quotientNode_000000_028621 : quotientNode_000000_028621.height ≤ 15 := by
  exact height_branch 14310 quotientNode_000000_014310 quotientNode_014310_014311
    14 14 height_quotientNode_000000_014310 height_quotientNode_014310_014311
theorem height_quotientChunk_028621 : quotientChunk_028621.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_029515 : quotientChunk_029515.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_028621_001788 : quotientNode_028621_001788.height ≤ 11 := by
  exact height_branch 894 quotientChunk_028621 quotientChunk_029515
    10 10 height_quotientChunk_028621 height_quotientChunk_029515
theorem height_quotientChunk_030409 : quotientChunk_030409.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_031303 : quotientChunk_031303.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_030409_001789 : quotientNode_030409_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_030409 quotientChunk_031303
    10 10 height_quotientChunk_030409 height_quotientChunk_031303
theorem height_quotientNode_028621_003577 : quotientNode_028621_003577.height ≤ 12 := by
  exact height_branch 1788 quotientNode_028621_001788 quotientNode_030409_001789
    11 11 height_quotientNode_028621_001788 height_quotientNode_030409_001789
theorem height_quotientChunk_032198 : quotientChunk_032198.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_033092 : quotientChunk_033092.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_032198_001789 : quotientNode_032198_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_032198 quotientChunk_033092
    10 10 height_quotientChunk_032198 height_quotientChunk_033092
theorem height_quotientChunk_033987 : quotientChunk_033987.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_034881 : quotientChunk_034881.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_033987_001789 : quotientNode_033987_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_033987 quotientChunk_034881
    10 10 height_quotientChunk_033987 height_quotientChunk_034881
theorem height_quotientNode_032198_003578 : quotientNode_032198_003578.height ≤ 12 := by
  exact height_branch 1789 quotientNode_032198_001789 quotientNode_033987_001789
    11 11 height_quotientNode_032198_001789 height_quotientNode_033987_001789
theorem height_quotientNode_028621_007155 : quotientNode_028621_007155.height ≤ 13 := by
  exact height_branch 3577 quotientNode_028621_003577 quotientNode_032198_003578
    12 12 height_quotientNode_028621_003577 height_quotientNode_032198_003578
theorem height_quotientChunk_035776 : quotientChunk_035776.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_036670 : quotientChunk_036670.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_035776_001789 : quotientNode_035776_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_035776 quotientChunk_036670
    10 10 height_quotientChunk_035776 height_quotientChunk_036670
theorem height_quotientChunk_037565 : quotientChunk_037565.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_038459 : quotientChunk_038459.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_037565_001789 : quotientNode_037565_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_037565 quotientChunk_038459
    10 10 height_quotientChunk_037565 height_quotientChunk_038459
theorem height_quotientNode_035776_003578 : quotientNode_035776_003578.height ≤ 12 := by
  exact height_branch 1789 quotientNode_035776_001789 quotientNode_037565_001789
    11 11 height_quotientNode_035776_001789 height_quotientNode_037565_001789
theorem height_quotientChunk_039354 : quotientChunk_039354.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_040248 : quotientChunk_040248.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_039354_001789 : quotientNode_039354_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_039354 quotientChunk_040248
    10 10 height_quotientChunk_039354 height_quotientChunk_040248
theorem height_quotientChunk_041143 : quotientChunk_041143.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_042037 : quotientChunk_042037.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_041143_001789 : quotientNode_041143_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_041143 quotientChunk_042037
    10 10 height_quotientChunk_041143 height_quotientChunk_042037
theorem height_quotientNode_039354_003578 : quotientNode_039354_003578.height ≤ 12 := by
  exact height_branch 1789 quotientNode_039354_001789 quotientNode_041143_001789
    11 11 height_quotientNode_039354_001789 height_quotientNode_041143_001789
theorem height_quotientNode_035776_007156 : quotientNode_035776_007156.height ≤ 13 := by
  exact height_branch 3578 quotientNode_035776_003578 quotientNode_039354_003578
    12 12 height_quotientNode_035776_003578 height_quotientNode_039354_003578
theorem height_quotientNode_028621_014311 : quotientNode_028621_014311.height ≤ 14 := by
  exact height_branch 7155 quotientNode_028621_007155 quotientNode_035776_007156
    13 13 height_quotientNode_028621_007155 height_quotientNode_035776_007156
theorem height_quotientChunk_042932 : quotientChunk_042932.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_043826 : quotientChunk_043826.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_042932_001788 : quotientNode_042932_001788.height ≤ 11 := by
  exact height_branch 894 quotientChunk_042932 quotientChunk_043826
    10 10 height_quotientChunk_042932 height_quotientChunk_043826
theorem height_quotientChunk_044720 : quotientChunk_044720.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_045614 : quotientChunk_045614.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_044720_001789 : quotientNode_044720_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_044720 quotientChunk_045614
    10 10 height_quotientChunk_044720 height_quotientChunk_045614
theorem height_quotientNode_042932_003577 : quotientNode_042932_003577.height ≤ 12 := by
  exact height_branch 1788 quotientNode_042932_001788 quotientNode_044720_001789
    11 11 height_quotientNode_042932_001788 height_quotientNode_044720_001789
theorem height_quotientChunk_046509 : quotientChunk_046509.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_047403 : quotientChunk_047403.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_046509_001789 : quotientNode_046509_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_046509 quotientChunk_047403
    10 10 height_quotientChunk_046509 height_quotientChunk_047403
theorem height_quotientChunk_048298 : quotientChunk_048298.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_049192 : quotientChunk_049192.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_048298_001789 : quotientNode_048298_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_048298 quotientChunk_049192
    10 10 height_quotientChunk_048298 height_quotientChunk_049192
theorem height_quotientNode_046509_003578 : quotientNode_046509_003578.height ≤ 12 := by
  exact height_branch 1789 quotientNode_046509_001789 quotientNode_048298_001789
    11 11 height_quotientNode_046509_001789 height_quotientNode_048298_001789
theorem height_quotientNode_042932_007155 : quotientNode_042932_007155.height ≤ 13 := by
  exact height_branch 3577 quotientNode_042932_003577 quotientNode_046509_003578
    12 12 height_quotientNode_042932_003577 height_quotientNode_046509_003578
theorem height_quotientChunk_050087 : quotientChunk_050087.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_050981 : quotientChunk_050981.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_050087_001789 : quotientNode_050087_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_050087 quotientChunk_050981
    10 10 height_quotientChunk_050087 height_quotientChunk_050981
theorem height_quotientChunk_051876 : quotientChunk_051876.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_052770 : quotientChunk_052770.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_051876_001789 : quotientNode_051876_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_051876 quotientChunk_052770
    10 10 height_quotientChunk_051876 height_quotientChunk_052770
theorem height_quotientNode_050087_003578 : quotientNode_050087_003578.height ≤ 12 := by
  exact height_branch 1789 quotientNode_050087_001789 quotientNode_051876_001789
    11 11 height_quotientNode_050087_001789 height_quotientNode_051876_001789
theorem height_quotientChunk_053665 : quotientChunk_053665.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_054559 : quotientChunk_054559.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_053665_001789 : quotientNode_053665_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_053665 quotientChunk_054559
    10 10 height_quotientChunk_053665 height_quotientChunk_054559
theorem height_quotientChunk_055454 : quotientChunk_055454.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_056348 : quotientChunk_056348.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_055454_001789 : quotientNode_055454_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_055454 quotientChunk_056348
    10 10 height_quotientChunk_055454 height_quotientChunk_056348
theorem height_quotientNode_053665_003578 : quotientNode_053665_003578.height ≤ 12 := by
  exact height_branch 1789 quotientNode_053665_001789 quotientNode_055454_001789
    11 11 height_quotientNode_053665_001789 height_quotientNode_055454_001789
theorem height_quotientNode_050087_007156 : quotientNode_050087_007156.height ≤ 13 := by
  exact height_branch 3578 quotientNode_050087_003578 quotientNode_053665_003578
    12 12 height_quotientNode_050087_003578 height_quotientNode_053665_003578
theorem height_quotientNode_042932_014311 : quotientNode_042932_014311.height ≤ 14 := by
  exact height_branch 7155 quotientNode_042932_007155 quotientNode_050087_007156
    13 13 height_quotientNode_042932_007155 height_quotientNode_050087_007156
theorem height_quotientNode_028621_028622 : quotientNode_028621_028622.height ≤ 15 := by
  exact height_branch 14311 quotientNode_028621_014311 quotientNode_042932_014311
    14 14 height_quotientNode_028621_014311 height_quotientNode_042932_014311
theorem height_quotientNode_000000_057243 : quotientNode_000000_057243.height ≤ 16 := by
  exact height_branch 28621 quotientNode_000000_028621 quotientNode_028621_028622
    15 15 height_quotientNode_000000_028621 height_quotientNode_028621_028622
theorem height_quotientChunk_057243 : quotientChunk_057243.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_058137 : quotientChunk_058137.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_057243_001788 : quotientNode_057243_001788.height ≤ 11 := by
  exact height_branch 894 quotientChunk_057243 quotientChunk_058137
    10 10 height_quotientChunk_057243 height_quotientChunk_058137
theorem height_quotientChunk_059031 : quotientChunk_059031.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_059925 : quotientChunk_059925.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_059031_001789 : quotientNode_059031_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_059031 quotientChunk_059925
    10 10 height_quotientChunk_059031 height_quotientChunk_059925
theorem height_quotientNode_057243_003577 : quotientNode_057243_003577.height ≤ 12 := by
  exact height_branch 1788 quotientNode_057243_001788 quotientNode_059031_001789
    11 11 height_quotientNode_057243_001788 height_quotientNode_059031_001789
theorem height_quotientChunk_060820 : quotientChunk_060820.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_061714 : quotientChunk_061714.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_060820_001789 : quotientNode_060820_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_060820 quotientChunk_061714
    10 10 height_quotientChunk_060820 height_quotientChunk_061714
theorem height_quotientChunk_062609 : quotientChunk_062609.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_063503 : quotientChunk_063503.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_062609_001789 : quotientNode_062609_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_062609 quotientChunk_063503
    10 10 height_quotientChunk_062609 height_quotientChunk_063503
theorem height_quotientNode_060820_003578 : quotientNode_060820_003578.height ≤ 12 := by
  exact height_branch 1789 quotientNode_060820_001789 quotientNode_062609_001789
    11 11 height_quotientNode_060820_001789 height_quotientNode_062609_001789
theorem height_quotientNode_057243_007155 : quotientNode_057243_007155.height ≤ 13 := by
  exact height_branch 3577 quotientNode_057243_003577 quotientNode_060820_003578
    12 12 height_quotientNode_057243_003577 height_quotientNode_060820_003578
theorem height_quotientChunk_064398 : quotientChunk_064398.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_065292 : quotientChunk_065292.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_064398_001789 : quotientNode_064398_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_064398 quotientChunk_065292
    10 10 height_quotientChunk_064398 height_quotientChunk_065292
theorem height_quotientChunk_066187 : quotientChunk_066187.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_067081 : quotientChunk_067081.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_066187_001789 : quotientNode_066187_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_066187 quotientChunk_067081
    10 10 height_quotientChunk_066187 height_quotientChunk_067081
theorem height_quotientNode_064398_003578 : quotientNode_064398_003578.height ≤ 12 := by
  exact height_branch 1789 quotientNode_064398_001789 quotientNode_066187_001789
    11 11 height_quotientNode_064398_001789 height_quotientNode_066187_001789
theorem height_quotientChunk_067976 : quotientChunk_067976.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_068870 : quotientChunk_068870.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_067976_001789 : quotientNode_067976_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_067976 quotientChunk_068870
    10 10 height_quotientChunk_067976 height_quotientChunk_068870
theorem height_quotientChunk_069765 : quotientChunk_069765.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_070659 : quotientChunk_070659.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_069765_001789 : quotientNode_069765_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_069765 quotientChunk_070659
    10 10 height_quotientChunk_069765 height_quotientChunk_070659
theorem height_quotientNode_067976_003578 : quotientNode_067976_003578.height ≤ 12 := by
  exact height_branch 1789 quotientNode_067976_001789 quotientNode_069765_001789
    11 11 height_quotientNode_067976_001789 height_quotientNode_069765_001789
theorem height_quotientNode_064398_007156 : quotientNode_064398_007156.height ≤ 13 := by
  exact height_branch 3578 quotientNode_064398_003578 quotientNode_067976_003578
    12 12 height_quotientNode_064398_003578 height_quotientNode_067976_003578
theorem height_quotientNode_057243_014311 : quotientNode_057243_014311.height ≤ 14 := by
  exact height_branch 7155 quotientNode_057243_007155 quotientNode_064398_007156
    13 13 height_quotientNode_057243_007155 height_quotientNode_064398_007156
theorem height_quotientChunk_071554 : quotientChunk_071554.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_072448 : quotientChunk_072448.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_071554_001788 : quotientNode_071554_001788.height ≤ 11 := by
  exact height_branch 894 quotientChunk_071554 quotientChunk_072448
    10 10 height_quotientChunk_071554 height_quotientChunk_072448
theorem height_quotientChunk_073342 : quotientChunk_073342.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_074236 : quotientChunk_074236.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_073342_001789 : quotientNode_073342_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_073342 quotientChunk_074236
    10 10 height_quotientChunk_073342 height_quotientChunk_074236
theorem height_quotientNode_071554_003577 : quotientNode_071554_003577.height ≤ 12 := by
  exact height_branch 1788 quotientNode_071554_001788 quotientNode_073342_001789
    11 11 height_quotientNode_071554_001788 height_quotientNode_073342_001789
theorem height_quotientChunk_075131 : quotientChunk_075131.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_076025 : quotientChunk_076025.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_075131_001789 : quotientNode_075131_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_075131 quotientChunk_076025
    10 10 height_quotientChunk_075131 height_quotientChunk_076025
theorem height_quotientChunk_076920 : quotientChunk_076920.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_077814 : quotientChunk_077814.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_076920_001789 : quotientNode_076920_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_076920 quotientChunk_077814
    10 10 height_quotientChunk_076920 height_quotientChunk_077814
theorem height_quotientNode_075131_003578 : quotientNode_075131_003578.height ≤ 12 := by
  exact height_branch 1789 quotientNode_075131_001789 quotientNode_076920_001789
    11 11 height_quotientNode_075131_001789 height_quotientNode_076920_001789
theorem height_quotientNode_071554_007155 : quotientNode_071554_007155.height ≤ 13 := by
  exact height_branch 3577 quotientNode_071554_003577 quotientNode_075131_003578
    12 12 height_quotientNode_071554_003577 height_quotientNode_075131_003578
theorem height_quotientChunk_078709 : quotientChunk_078709.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_079603 : quotientChunk_079603.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_078709_001789 : quotientNode_078709_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_078709 quotientChunk_079603
    10 10 height_quotientChunk_078709 height_quotientChunk_079603
theorem height_quotientChunk_080498 : quotientChunk_080498.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_081392 : quotientChunk_081392.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_080498_001789 : quotientNode_080498_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_080498 quotientChunk_081392
    10 10 height_quotientChunk_080498 height_quotientChunk_081392
theorem height_quotientNode_078709_003578 : quotientNode_078709_003578.height ≤ 12 := by
  exact height_branch 1789 quotientNode_078709_001789 quotientNode_080498_001789
    11 11 height_quotientNode_078709_001789 height_quotientNode_080498_001789
theorem height_quotientChunk_082287 : quotientChunk_082287.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_083181 : quotientChunk_083181.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_082287_001789 : quotientNode_082287_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_082287 quotientChunk_083181
    10 10 height_quotientChunk_082287 height_quotientChunk_083181
theorem height_quotientChunk_084076 : quotientChunk_084076.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_084970 : quotientChunk_084970.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_084076_001789 : quotientNode_084076_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_084076 quotientChunk_084970
    10 10 height_quotientChunk_084076 height_quotientChunk_084970
theorem height_quotientNode_082287_003578 : quotientNode_082287_003578.height ≤ 12 := by
  exact height_branch 1789 quotientNode_082287_001789 quotientNode_084076_001789
    11 11 height_quotientNode_082287_001789 height_quotientNode_084076_001789
theorem height_quotientNode_078709_007156 : quotientNode_078709_007156.height ≤ 13 := by
  exact height_branch 3578 quotientNode_078709_003578 quotientNode_082287_003578
    12 12 height_quotientNode_078709_003578 height_quotientNode_082287_003578
theorem height_quotientNode_071554_014311 : quotientNode_071554_014311.height ≤ 14 := by
  exact height_branch 7155 quotientNode_071554_007155 quotientNode_078709_007156
    13 13 height_quotientNode_071554_007155 height_quotientNode_078709_007156
theorem height_quotientNode_057243_028622 : quotientNode_057243_028622.height ≤ 15 := by
  exact height_branch 14311 quotientNode_057243_014311 quotientNode_071554_014311
    14 14 height_quotientNode_057243_014311 height_quotientNode_071554_014311
theorem height_quotientChunk_085865 : quotientChunk_085865.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_086759 : quotientChunk_086759.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_085865_001788 : quotientNode_085865_001788.height ≤ 11 := by
  exact height_branch 894 quotientChunk_085865 quotientChunk_086759
    10 10 height_quotientChunk_085865 height_quotientChunk_086759
theorem height_quotientChunk_087653 : quotientChunk_087653.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_088547 : quotientChunk_088547.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_087653_001789 : quotientNode_087653_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_087653 quotientChunk_088547
    10 10 height_quotientChunk_087653 height_quotientChunk_088547
theorem height_quotientNode_085865_003577 : quotientNode_085865_003577.height ≤ 12 := by
  exact height_branch 1788 quotientNode_085865_001788 quotientNode_087653_001789
    11 11 height_quotientNode_085865_001788 height_quotientNode_087653_001789
theorem height_quotientChunk_089442 : quotientChunk_089442.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_090336 : quotientChunk_090336.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_089442_001789 : quotientNode_089442_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_089442 quotientChunk_090336
    10 10 height_quotientChunk_089442 height_quotientChunk_090336
theorem height_quotientChunk_091231 : quotientChunk_091231.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_092125 : quotientChunk_092125.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_091231_001789 : quotientNode_091231_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_091231 quotientChunk_092125
    10 10 height_quotientChunk_091231 height_quotientChunk_092125
theorem height_quotientNode_089442_003578 : quotientNode_089442_003578.height ≤ 12 := by
  exact height_branch 1789 quotientNode_089442_001789 quotientNode_091231_001789
    11 11 height_quotientNode_089442_001789 height_quotientNode_091231_001789
theorem height_quotientNode_085865_007155 : quotientNode_085865_007155.height ≤ 13 := by
  exact height_branch 3577 quotientNode_085865_003577 quotientNode_089442_003578
    12 12 height_quotientNode_085865_003577 height_quotientNode_089442_003578
theorem height_quotientChunk_093020 : quotientChunk_093020.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_093914 : quotientChunk_093914.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_093020_001789 : quotientNode_093020_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_093020 quotientChunk_093914
    10 10 height_quotientChunk_093020 height_quotientChunk_093914
theorem height_quotientChunk_094809 : quotientChunk_094809.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_095703 : quotientChunk_095703.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_094809_001789 : quotientNode_094809_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_094809 quotientChunk_095703
    10 10 height_quotientChunk_094809 height_quotientChunk_095703
theorem height_quotientNode_093020_003578 : quotientNode_093020_003578.height ≤ 12 := by
  exact height_branch 1789 quotientNode_093020_001789 quotientNode_094809_001789
    11 11 height_quotientNode_093020_001789 height_quotientNode_094809_001789
theorem height_quotientChunk_096598 : quotientChunk_096598.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_097492 : quotientChunk_097492.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_096598_001789 : quotientNode_096598_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_096598 quotientChunk_097492
    10 10 height_quotientChunk_096598 height_quotientChunk_097492
theorem height_quotientChunk_098387 : quotientChunk_098387.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_099281 : quotientChunk_099281.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_098387_001789 : quotientNode_098387_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_098387 quotientChunk_099281
    10 10 height_quotientChunk_098387 height_quotientChunk_099281
theorem height_quotientNode_096598_003578 : quotientNode_096598_003578.height ≤ 12 := by
  exact height_branch 1789 quotientNode_096598_001789 quotientNode_098387_001789
    11 11 height_quotientNode_096598_001789 height_quotientNode_098387_001789
theorem height_quotientNode_093020_007156 : quotientNode_093020_007156.height ≤ 13 := by
  exact height_branch 3578 quotientNode_093020_003578 quotientNode_096598_003578
    12 12 height_quotientNode_093020_003578 height_quotientNode_096598_003578
theorem height_quotientNode_085865_014311 : quotientNode_085865_014311.height ≤ 14 := by
  exact height_branch 7155 quotientNode_085865_007155 quotientNode_093020_007156
    13 13 height_quotientNode_085865_007155 height_quotientNode_093020_007156
theorem height_quotientChunk_100176 : quotientChunk_100176.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_101070 : quotientChunk_101070.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_100176_001788 : quotientNode_100176_001788.height ≤ 11 := by
  exact height_branch 894 quotientChunk_100176 quotientChunk_101070
    10 10 height_quotientChunk_100176 height_quotientChunk_101070
theorem height_quotientChunk_101964 : quotientChunk_101964.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_102858 : quotientChunk_102858.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_101964_001789 : quotientNode_101964_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_101964 quotientChunk_102858
    10 10 height_quotientChunk_101964 height_quotientChunk_102858
theorem height_quotientNode_100176_003577 : quotientNode_100176_003577.height ≤ 12 := by
  exact height_branch 1788 quotientNode_100176_001788 quotientNode_101964_001789
    11 11 height_quotientNode_100176_001788 height_quotientNode_101964_001789
theorem height_quotientChunk_103753 : quotientChunk_103753.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_104647 : quotientChunk_104647.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_103753_001789 : quotientNode_103753_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_103753 quotientChunk_104647
    10 10 height_quotientChunk_103753 height_quotientChunk_104647
theorem height_quotientChunk_105542 : quotientChunk_105542.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_106436 : quotientChunk_106436.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_105542_001789 : quotientNode_105542_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_105542 quotientChunk_106436
    10 10 height_quotientChunk_105542 height_quotientChunk_106436
theorem height_quotientNode_103753_003578 : quotientNode_103753_003578.height ≤ 12 := by
  exact height_branch 1789 quotientNode_103753_001789 quotientNode_105542_001789
    11 11 height_quotientNode_103753_001789 height_quotientNode_105542_001789
theorem height_quotientNode_100176_007155 : quotientNode_100176_007155.height ≤ 13 := by
  exact height_branch 3577 quotientNode_100176_003577 quotientNode_103753_003578
    12 12 height_quotientNode_100176_003577 height_quotientNode_103753_003578
theorem height_quotientChunk_107331 : quotientChunk_107331.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_108225 : quotientChunk_108225.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_107331_001789 : quotientNode_107331_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_107331 quotientChunk_108225
    10 10 height_quotientChunk_107331 height_quotientChunk_108225
theorem height_quotientChunk_109120 : quotientChunk_109120.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_110014 : quotientChunk_110014.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_109120_001789 : quotientNode_109120_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_109120 quotientChunk_110014
    10 10 height_quotientChunk_109120 height_quotientChunk_110014
theorem height_quotientNode_107331_003578 : quotientNode_107331_003578.height ≤ 12 := by
  exact height_branch 1789 quotientNode_107331_001789 quotientNode_109120_001789
    11 11 height_quotientNode_107331_001789 height_quotientNode_109120_001789
theorem height_quotientChunk_110909 : quotientChunk_110909.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_111803 : quotientChunk_111803.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_110909_001789 : quotientNode_110909_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_110909 quotientChunk_111803
    10 10 height_quotientChunk_110909 height_quotientChunk_111803
theorem height_quotientChunk_112698 : quotientChunk_112698.height ≤ 10 := by
  decide +kernel
theorem height_quotientChunk_113592 : quotientChunk_113592.height ≤ 10 := by
  decide +kernel
theorem height_quotientNode_112698_001789 : quotientNode_112698_001789.height ≤ 11 := by
  exact height_branch 894 quotientChunk_112698 quotientChunk_113592
    10 10 height_quotientChunk_112698 height_quotientChunk_113592
theorem height_quotientNode_110909_003578 : quotientNode_110909_003578.height ≤ 12 := by
  exact height_branch 1789 quotientNode_110909_001789 quotientNode_112698_001789
    11 11 height_quotientNode_110909_001789 height_quotientNode_112698_001789
theorem height_quotientNode_107331_007156 : quotientNode_107331_007156.height ≤ 13 := by
  exact height_branch 3578 quotientNode_107331_003578 quotientNode_110909_003578
    12 12 height_quotientNode_107331_003578 height_quotientNode_110909_003578
theorem height_quotientNode_100176_014311 : quotientNode_100176_014311.height ≤ 14 := by
  exact height_branch 7155 quotientNode_100176_007155 quotientNode_107331_007156
    13 13 height_quotientNode_100176_007155 height_quotientNode_107331_007156
theorem height_quotientNode_085865_028622 : quotientNode_085865_028622.height ≤ 15 := by
  exact height_branch 14311 quotientNode_085865_014311 quotientNode_100176_014311
    14 14 height_quotientNode_085865_014311 height_quotientNode_100176_014311
theorem height_quotientNode_057243_057244 : quotientNode_057243_057244.height ≤ 16 := by
  exact height_branch 28622 quotientNode_057243_028622 quotientNode_085865_028622
    15 15 height_quotientNode_057243_028622 height_quotientNode_085865_028622
theorem height_quotientNode_000000_114487 : quotientNode_000000_114487.height ≤ 17 := by
  exact height_branch 57243 quotientNode_000000_057243 quotientNode_057243_057244
    16 16 height_quotientNode_000000_057243 height_quotientNode_057243_057244
theorem quotient_height : quotientTree.height ≤ 17 :=
  height_quotientNode_000000_114487
theorem quotient_fuel : quotientTree.height + 1 ≤ 33 := by
  have bound := quotient_height
  omega
end FuelHeightsPilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Actual map and quotient heights certify sufficient lookup fuel"
