module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.Loaders

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_000000 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/000000-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_000560 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/000560-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_000000_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_000000
    mapChunk_000560
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_001120 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/001120-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_001680 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/001680-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_001120_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_001120
    mapChunk_001680
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_000000_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_000000_001120
    mapNode_001120_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_002241 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/002241-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_002801 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/002801-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_002241_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_002241
    mapChunk_002801
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_003361 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/003361-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_003921 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/003921-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_003361_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_003361
    mapChunk_003921
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_002241_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_002241_001120
    mapNode_003361_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_000000_004482 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_000000_002241
    mapNode_002241_002241
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_004482 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/004482-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_005042 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/005042-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_004482_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_004482
    mapChunk_005042
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_005602 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/005602-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_006162 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/006162-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_005602_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_005602
    mapChunk_006162
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_004482_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_004482_001120
    mapNode_005602_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_006723 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/006723-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_007283 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/007283-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_006723_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_006723
    mapChunk_007283
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_007844 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/007844-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_008404 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/008404-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_007844_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_007844
    mapChunk_008404
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_006723_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_006723_001121
    mapNode_007844_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_004482_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_004482_002241
    mapNode_006723_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_000000_008965 :
    Balanced.RowTree Nat :=
  .branch 4482
    mapNode_000000_004482
    mapNode_004482_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_008965 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/008965-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_009525 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/009525-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_008965_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_008965
    mapChunk_009525
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_010085 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/010085-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_010645 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/010645-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_010085_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_010085
    mapChunk_010645
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_008965_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_008965_001120
    mapNode_010085_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_011206 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/011206-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_011766 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/011766-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_011206_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_011206
    mapChunk_011766
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_012327 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/012327-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_012887 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/012887-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_012327_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_012327
    mapChunk_012887
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_011206_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_011206_001121
    mapNode_012327_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_008965_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_008965_002241
    mapNode_011206_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_013448 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/013448-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_014008 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/014008-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_013448_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_013448
    mapChunk_014008
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_014568 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/014568-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_015128 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/015128-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_014568_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_014568
    mapChunk_015128
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_013448_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_013448_001120
    mapNode_014568_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_015689 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/015689-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_016249 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/016249-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_015689_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_015689
    mapChunk_016249
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_016810 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/016810-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_017370 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/017370-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_016810_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_016810
    mapChunk_017370
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_015689_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_015689_001121
    mapNode_016810_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_013448_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_013448_002241
    mapNode_015689_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_008965_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_008965_004483
    mapNode_013448_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_000000_017931 :
    Balanced.RowTree Nat :=
  .branch 8965
    mapNode_000000_008965
    mapNode_008965_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_017931 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/017931-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_018491 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/018491-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_017931_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_017931
    mapChunk_018491
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_019051 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/019051-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_019611 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/019611-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_019051_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_019051
    mapChunk_019611
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_017931_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_017931_001120
    mapNode_019051_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_020172 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/020172-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_020732 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/020732-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_020172_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_020172
    mapChunk_020732
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_021292 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/021292-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_021852 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/021852-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_021292_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_021292
    mapChunk_021852
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_020172_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_020172_001120
    mapNode_021292_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_017931_004482 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_017931_002241
    mapNode_020172_002241
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_022413 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/022413-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_022973 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/022973-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_022413_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_022413
    mapChunk_022973
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_023533 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/023533-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_024093 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/024093-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_023533_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_023533
    mapChunk_024093
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_022413_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_022413_001120
    mapNode_023533_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_024654 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/024654-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_025214 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/025214-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_024654_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_024654
    mapChunk_025214
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_025775 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/025775-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_026335 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/026335-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_025775_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_025775
    mapChunk_026335
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_024654_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_024654_001121
    mapNode_025775_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_022413_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_022413_002241
    mapNode_024654_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_017931_008965 :
    Balanced.RowTree Nat :=
  .branch 4482
    mapNode_017931_004482
    mapNode_022413_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_026896 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/026896-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_027456 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/027456-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_026896_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_026896
    mapChunk_027456
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_028016 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/028016-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_028576 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/028576-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_028016_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_028016
    mapChunk_028576
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_026896_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_026896_001120
    mapNode_028016_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_029137 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/029137-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_029697 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/029697-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_029137_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_029137
    mapChunk_029697
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_030258 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/030258-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_030818 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/030818-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_030258_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_030258
    mapChunk_030818
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_029137_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_029137_001121
    mapNode_030258_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_026896_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_026896_002241
    mapNode_029137_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_031379 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/031379-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_031939 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/031939-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_031379_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_031379
    mapChunk_031939
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_032499 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/032499-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_033059 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/033059-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_032499_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_032499
    mapChunk_033059
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_031379_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_031379_001120
    mapNode_032499_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_033620 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/033620-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_034180 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/034180-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_033620_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_033620
    mapChunk_034180
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_034741 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/034741-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_035301 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/035301-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_034741_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_034741
    mapChunk_035301
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_033620_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_033620_001121
    mapNode_034741_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_031379_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_031379_002241
    mapNode_033620_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_026896_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_026896_004483
    mapNode_031379_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_017931_017931 :
    Balanced.RowTree Nat :=
  .branch 8965
    mapNode_017931_008965
    mapNode_026896_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_000000_035862 :
    Balanced.RowTree Nat :=
  .branch 17931
    mapNode_000000_017931
    mapNode_017931_017931
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_035862 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/035862-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_036422 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/036422-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_035862_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_035862
    mapChunk_036422
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_036982 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/036982-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_037542 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/037542-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_036982_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_036982
    mapChunk_037542
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_035862_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_035862_001120
    mapNode_036982_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_038103 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/038103-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_038663 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/038663-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_038103_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_038103
    mapChunk_038663
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_039223 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/039223-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_039783 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/039783-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_039223_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_039223
    mapChunk_039783
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_038103_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_038103_001120
    mapNode_039223_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_035862_004482 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_035862_002241
    mapNode_038103_002241
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_040344 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/040344-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_040904 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/040904-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_040344_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_040344
    mapChunk_040904
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_041464 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/041464-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_042024 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/042024-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_041464_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_041464
    mapChunk_042024
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_040344_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_040344_001120
    mapNode_041464_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_042585 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/042585-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_043145 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/043145-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_042585_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_042585
    mapChunk_043145
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_043706 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/043706-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_044266 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/044266-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_043706_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_043706
    mapChunk_044266
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_042585_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_042585_001121
    mapNode_043706_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_040344_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_040344_002241
    mapNode_042585_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_035862_008965 :
    Balanced.RowTree Nat :=
  .branch 4482
    mapNode_035862_004482
    mapNode_040344_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_044827 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/044827-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_045387 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/045387-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_044827_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_044827
    mapChunk_045387
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_045947 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/045947-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_046507 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/046507-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_045947_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_045947
    mapChunk_046507
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_044827_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_044827_001120
    mapNode_045947_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_047068 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/047068-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_047628 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/047628-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_047068_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_047068
    mapChunk_047628
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_048189 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/048189-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_048749 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/048749-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_048189_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_048189
    mapChunk_048749
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_047068_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_047068_001121
    mapNode_048189_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_044827_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_044827_002241
    mapNode_047068_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_049310 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/049310-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_049870 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/049870-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_049310_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_049310
    mapChunk_049870
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_050430 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/050430-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_050990 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/050990-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_050430_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_050430
    mapChunk_050990
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_049310_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_049310_001120
    mapNode_050430_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_051551 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/051551-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_052111 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/052111-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_051551_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_051551
    mapChunk_052111
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_052672 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/052672-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_053232 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/053232-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_052672_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_052672
    mapChunk_053232
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_051551_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_051551_001121
    mapNode_052672_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_049310_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_049310_002241
    mapNode_051551_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_044827_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_044827_004483
    mapNode_049310_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_035862_017931 :
    Balanced.RowTree Nat :=
  .branch 8965
    mapNode_035862_008965
    mapNode_044827_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_053793 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/053793-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_054353 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/054353-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_053793_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_053793
    mapChunk_054353
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_054913 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/054913-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_055473 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/055473-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_054913_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_054913
    mapChunk_055473
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_053793_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_053793_001120
    mapNode_054913_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_056034 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/056034-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_056594 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/056594-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_056034_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_056034
    mapChunk_056594
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_057155 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/057155-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_057715 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/057715-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_057155_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_057155
    mapChunk_057715
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_056034_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_056034_001121
    mapNode_057155_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_053793_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_053793_002241
    mapNode_056034_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_058276 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/058276-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_058836 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/058836-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_058276_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_058276
    mapChunk_058836
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_059396 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/059396-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_059956 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/059956-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_059396_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_059396
    mapChunk_059956
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_058276_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_058276_001120
    mapNode_059396_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_060517 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/060517-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_061077 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/061077-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_060517_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_060517
    mapChunk_061077
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_061638 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/061638-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_062198 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/062198-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_061638_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_061638
    mapChunk_062198
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_060517_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_060517_001121
    mapNode_061638_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_058276_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_058276_002241
    mapNode_060517_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_053793_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_053793_004483
    mapNode_058276_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_062759 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/062759-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_063319 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/063319-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_062759_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_062759
    mapChunk_063319
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_063879 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/063879-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_064439 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/064439-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_063879_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_063879
    mapChunk_064439
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_062759_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_062759_001120
    mapNode_063879_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_065000 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/065000-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_065560 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/065560-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_065000_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_065000
    mapChunk_065560
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_066121 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/066121-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_066681 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/066681-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_066121_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_066121
    mapChunk_066681
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_065000_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_065000_001121
    mapNode_066121_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_062759_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_062759_002241
    mapNode_065000_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_067242 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/067242-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_067802 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/067802-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_067242_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_067242
    mapChunk_067802
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_068362 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/068362-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_068922 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/068922-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_068362_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_068362
    mapChunk_068922
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_067242_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_067242_001120
    mapNode_068362_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_069483 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/069483-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_070043 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/070043-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_069483_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_069483
    mapChunk_070043
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_070604 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/070604-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_071164 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/071164-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_070604_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_070604
    mapChunk_071164
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_069483_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_069483_001121
    mapNode_070604_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_067242_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_067242_002241
    mapNode_069483_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_062759_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_062759_004483
    mapNode_067242_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_053793_017932 :
    Balanced.RowTree Nat :=
  .branch 8966
    mapNode_053793_008966
    mapNode_062759_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_035862_035863 :
    Balanced.RowTree Nat :=
  .branch 17931
    mapNode_035862_017931
    mapNode_053793_017932
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_000000_071725 :
    Balanced.RowTree Nat :=
  .branch 35862
    mapNode_000000_035862
    mapNode_035862_035863
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_071725 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/071725-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_072285 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/072285-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_071725_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_071725
    mapChunk_072285
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_072845 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/072845-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_073405 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/073405-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_072845_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_072845
    mapChunk_073405
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_071725_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_071725_001120
    mapNode_072845_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_073966 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/073966-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_074526 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/074526-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_073966_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_073966
    mapChunk_074526
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_075086 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/075086-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_075646 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/075646-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_075086_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_075086
    mapChunk_075646
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_073966_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_073966_001120
    mapNode_075086_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_071725_004482 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_071725_002241
    mapNode_073966_002241
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_076207 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/076207-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_076767 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/076767-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_076207_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_076207
    mapChunk_076767
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_077327 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/077327-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_077887 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/077887-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_077327_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_077327
    mapChunk_077887
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_076207_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_076207_001120
    mapNode_077327_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_078448 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/078448-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_079008 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/079008-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_078448_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_078448
    mapChunk_079008
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_079569 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/079569-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_080129 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/080129-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_079569_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_079569
    mapChunk_080129
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_078448_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_078448_001121
    mapNode_079569_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_076207_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_076207_002241
    mapNode_078448_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_071725_008965 :
    Balanced.RowTree Nat :=
  .branch 4482
    mapNode_071725_004482
    mapNode_076207_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_080690 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/080690-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_081250 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/081250-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_080690_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_080690
    mapChunk_081250
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_081810 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/081810-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_082370 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/082370-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_081810_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_081810
    mapChunk_082370
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_080690_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_080690_001120
    mapNode_081810_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_082931 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/082931-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_083491 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/083491-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_082931_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_082931
    mapChunk_083491
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_084052 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/084052-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_084612 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/084612-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_084052_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_084052
    mapChunk_084612
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_082931_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_082931_001121
    mapNode_084052_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_080690_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_080690_002241
    mapNode_082931_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_085173 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/085173-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_085733 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/085733-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_085173_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_085173
    mapChunk_085733
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_086293 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/086293-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_086853 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/086853-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_086293_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_086293
    mapChunk_086853
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_085173_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_085173_001120
    mapNode_086293_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_087414 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/087414-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_087974 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/087974-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_087414_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_087414
    mapChunk_087974
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_088535 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/088535-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_089095 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/089095-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_088535_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_088535
    mapChunk_089095
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_087414_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_087414_001121
    mapNode_088535_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_085173_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_085173_002241
    mapNode_087414_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_080690_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_080690_004483
    mapNode_085173_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_071725_017931 :
    Balanced.RowTree Nat :=
  .branch 8965
    mapNode_071725_008965
    mapNode_080690_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_089656 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/089656-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_090216 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/090216-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_089656_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_089656
    mapChunk_090216
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_090776 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/090776-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_091336 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/091336-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_090776_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_090776
    mapChunk_091336
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_089656_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_089656_001120
    mapNode_090776_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_091897 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/091897-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_092457 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/092457-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_091897_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_091897
    mapChunk_092457
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_093017 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/093017-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_093577 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/093577-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_093017_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_093017
    mapChunk_093577
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_091897_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_091897_001120
    mapNode_093017_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_089656_004482 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_089656_002241
    mapNode_091897_002241
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_094138 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/094138-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_094698 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/094698-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_094138_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_094138
    mapChunk_094698
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_095258 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/095258-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_095818 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/095818-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_095258_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_095258
    mapChunk_095818
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_094138_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_094138_001120
    mapNode_095258_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_096379 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/096379-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_096939 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/096939-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_096379_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_096379
    mapChunk_096939
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_097500 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/097500-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_098060 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/098060-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_097500_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_097500
    mapChunk_098060
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_096379_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_096379_001121
    mapNode_097500_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_094138_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_094138_002241
    mapNode_096379_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_089656_008965 :
    Balanced.RowTree Nat :=
  .branch 4482
    mapNode_089656_004482
    mapNode_094138_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_098621 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/098621-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_099181 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/099181-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_098621_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_098621
    mapChunk_099181
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_099741 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/099741-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_100301 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/100301-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_099741_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_099741
    mapChunk_100301
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_098621_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_098621_001120
    mapNode_099741_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_100862 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/100862-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_101422 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/101422-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_100862_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_100862
    mapChunk_101422
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_101983 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/101983-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_102543 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/102543-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_101983_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_101983
    mapChunk_102543
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_100862_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_100862_001121
    mapNode_101983_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_098621_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_098621_002241
    mapNode_100862_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_103104 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/103104-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_103664 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/103664-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_103104_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_103104
    mapChunk_103664
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_104224 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/104224-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_104784 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/104784-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_104224_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_104224
    mapChunk_104784
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_103104_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_103104_001120
    mapNode_104224_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_105345 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/105345-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_105905 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/105905-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_105345_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_105345
    mapChunk_105905
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_106466 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/106466-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_107026 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/107026-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_106466_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_106466
    mapChunk_107026
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_105345_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_105345_001121
    mapNode_106466_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_103104_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_103104_002241
    mapNode_105345_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_098621_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_098621_004483
    mapNode_103104_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_089656_017931 :
    Balanced.RowTree Nat :=
  .branch 8965
    mapNode_089656_008965
    mapNode_098621_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_071725_035862 :
    Balanced.RowTree Nat :=
  .branch 17931
    mapNode_071725_017931
    mapNode_089656_017931
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_107587 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/107587-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_108147 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/108147-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_107587_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_107587
    mapChunk_108147
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_108707 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/108707-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_109267 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/109267-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_108707_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_108707
    mapChunk_109267
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_107587_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_107587_001120
    mapNode_108707_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_109828 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/109828-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_110388 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/110388-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_109828_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_109828
    mapChunk_110388
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_110948 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/110948-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_111508 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/111508-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_110948_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_110948
    mapChunk_111508
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_109828_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_109828_001120
    mapNode_110948_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_107587_004482 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_107587_002241
    mapNode_109828_002241
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_112069 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/112069-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_112629 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/112629-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_112069_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_112069
    mapChunk_112629
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_113189 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/113189-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_113749 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/113749-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_113189_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_113189
    mapChunk_113749
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_112069_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_112069_001120
    mapNode_113189_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_114310 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/114310-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_114870 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/114870-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_114310_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_114310
    mapChunk_114870
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_115431 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/115431-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_115991 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/115991-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_115431_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_115431
    mapChunk_115991
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_114310_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_114310_001121
    mapNode_115431_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_112069_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_112069_002241
    mapNode_114310_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_107587_008965 :
    Balanced.RowTree Nat :=
  .branch 4482
    mapNode_107587_004482
    mapNode_112069_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_116552 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/116552-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_117112 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/117112-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_116552_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_116552
    mapChunk_117112
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_117672 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/117672-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_118232 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/118232-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_117672_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_117672
    mapChunk_118232
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_116552_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_116552_001120
    mapNode_117672_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_118793 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/118793-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_119353 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/119353-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_118793_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_118793
    mapChunk_119353
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_119914 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/119914-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_120474 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/120474-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_119914_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_119914
    mapChunk_120474
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_118793_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_118793_001121
    mapNode_119914_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_116552_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_116552_002241
    mapNode_118793_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_121035 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/121035-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_121595 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/121595-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_121035_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_121035
    mapChunk_121595
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_122155 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/122155-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_122715 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/122715-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_122155_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_122155
    mapChunk_122715
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_121035_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_121035_001120
    mapNode_122155_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_123276 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/123276-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_123836 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/123836-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_123276_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_123276
    mapChunk_123836
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_124397 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/124397-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_124957 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/124957-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_124397_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_124397
    mapChunk_124957
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_123276_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_123276_001121
    mapNode_124397_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_121035_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_121035_002241
    mapNode_123276_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_116552_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_116552_004483
    mapNode_121035_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_107587_017931 :
    Balanced.RowTree Nat :=
  .branch 8965
    mapNode_107587_008965
    mapNode_116552_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_125518 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/125518-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_126078 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/126078-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_125518_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_125518
    mapChunk_126078
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_126638 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/126638-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_127198 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/127198-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_126638_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_126638
    mapChunk_127198
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_125518_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_125518_001120
    mapNode_126638_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_127759 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/127759-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_128319 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/128319-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_127759_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_127759
    mapChunk_128319
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_128880 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/128880-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_129440 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/129440-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_128880_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_128880
    mapChunk_129440
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_127759_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_127759_001121
    mapNode_128880_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_125518_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_125518_002241
    mapNode_127759_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_130001 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/130001-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_130561 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/130561-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_130001_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_130001
    mapChunk_130561
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_131121 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/131121-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_131681 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/131681-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_131121_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_131121
    mapChunk_131681
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_130001_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_130001_001120
    mapNode_131121_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_132242 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/132242-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_132802 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/132802-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_132242_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_132242
    mapChunk_132802
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_133363 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/133363-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_133923 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/133923-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_133363_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_133363
    mapChunk_133923
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_132242_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_132242_001121
    mapNode_133363_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_130001_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_130001_002241
    mapNode_132242_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_125518_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_125518_004483
    mapNode_130001_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_134484 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/134484-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_135044 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/135044-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_134484_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_134484
    mapChunk_135044
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_135604 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/135604-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_136164 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/136164-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_135604_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_135604
    mapChunk_136164
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_134484_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_134484_001120
    mapNode_135604_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_136725 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/136725-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_137285 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/137285-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_136725_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_136725
    mapChunk_137285
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_137846 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/137846-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_138406 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/138406-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_137846_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_137846
    mapChunk_138406
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_136725_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_136725_001121
    mapNode_137846_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_134484_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_134484_002241
    mapNode_136725_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_138967 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/138967-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_139527 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/139527-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_138967_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_138967
    mapChunk_139527
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_140087 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/140087-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_140647 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/140647-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_140087_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_140087
    mapChunk_140647
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_138967_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_138967_001120
    mapNode_140087_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_141208 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/141208-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_141768 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/141768-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_141208_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_141208
    mapChunk_141768
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_142329 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/142329-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_142889 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/142889-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_142329_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_142329
    mapChunk_142889
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_141208_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_141208_001121
    mapNode_142329_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_138967_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_138967_002241
    mapNode_141208_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_134484_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_134484_004483
    mapNode_138967_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_125518_017932 :
    Balanced.RowTree Nat :=
  .branch 8966
    mapNode_125518_008966
    mapNode_134484_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_107587_035863 :
    Balanced.RowTree Nat :=
  .branch 17931
    mapNode_107587_017931
    mapNode_125518_017932
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_071725_071725 :
    Balanced.RowTree Nat :=
  .branch 35862
    mapNode_071725_035862
    mapNode_107587_035863
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_000000_143450 :
    Balanced.RowTree Nat :=
  .branch 71725
    mapNode_000000_071725
    mapNode_071725_071725
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_143450 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/143450-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_144010 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/144010-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_143450_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_143450
    mapChunk_144010
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_144570 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/144570-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_145130 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/145130-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_144570_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_144570
    mapChunk_145130
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_143450_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_143450_001120
    mapNode_144570_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_145691 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/145691-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_146251 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/146251-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_145691_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_145691
    mapChunk_146251
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_146811 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/146811-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_147371 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/147371-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_146811_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_146811
    mapChunk_147371
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_145691_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_145691_001120
    mapNode_146811_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_143450_004482 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_143450_002241
    mapNode_145691_002241
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_147932 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/147932-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_148492 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/148492-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_147932_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_147932
    mapChunk_148492
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_149052 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/149052-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_149612 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/149612-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_149052_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_149052
    mapChunk_149612
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_147932_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_147932_001120
    mapNode_149052_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_150173 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/150173-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_150733 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/150733-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_150173_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_150173
    mapChunk_150733
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_151294 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/151294-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_151854 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/151854-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_151294_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_151294
    mapChunk_151854
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_150173_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_150173_001121
    mapNode_151294_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_147932_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_147932_002241
    mapNode_150173_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_143450_008965 :
    Balanced.RowTree Nat :=
  .branch 4482
    mapNode_143450_004482
    mapNode_147932_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_152415 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/152415-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_152975 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/152975-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_152415_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_152415
    mapChunk_152975
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_153535 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/153535-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_154095 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/154095-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_153535_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_153535
    mapChunk_154095
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_152415_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_152415_001120
    mapNode_153535_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_154656 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/154656-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_155216 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/155216-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_154656_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_154656
    mapChunk_155216
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_155777 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/155777-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_156337 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/156337-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_155777_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_155777
    mapChunk_156337
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_154656_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_154656_001121
    mapNode_155777_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_152415_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_152415_002241
    mapNode_154656_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_156898 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/156898-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_157458 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/157458-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_156898_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_156898
    mapChunk_157458
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_158018 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/158018-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_158578 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/158578-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_158018_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_158018
    mapChunk_158578
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_156898_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_156898_001120
    mapNode_158018_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_159139 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/159139-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_159699 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/159699-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_159139_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_159139
    mapChunk_159699
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_160260 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/160260-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_160820 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/160820-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_160260_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_160260
    mapChunk_160820
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_159139_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_159139_001121
    mapNode_160260_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_156898_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_156898_002241
    mapNode_159139_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_152415_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_152415_004483
    mapNode_156898_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_143450_017931 :
    Balanced.RowTree Nat :=
  .branch 8965
    mapNode_143450_008965
    mapNode_152415_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_161381 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/161381-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_161941 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/161941-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_161381_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_161381
    mapChunk_161941
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_162501 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/162501-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_163061 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/163061-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_162501_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_162501
    mapChunk_163061
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_161381_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_161381_001120
    mapNode_162501_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_163622 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/163622-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_164182 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/164182-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_163622_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_163622
    mapChunk_164182
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_164742 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/164742-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_165302 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/165302-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_164742_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_164742
    mapChunk_165302
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_163622_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_163622_001120
    mapNode_164742_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_161381_004482 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_161381_002241
    mapNode_163622_002241
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_165863 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/165863-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_166423 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/166423-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_165863_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_165863
    mapChunk_166423
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_166983 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/166983-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_167543 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/167543-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_166983_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_166983
    mapChunk_167543
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_165863_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_165863_001120
    mapNode_166983_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_168104 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/168104-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_168664 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/168664-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_168104_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_168104
    mapChunk_168664
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_169225 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/169225-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_169785 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/169785-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_169225_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_169225
    mapChunk_169785
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_168104_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_168104_001121
    mapNode_169225_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_165863_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_165863_002241
    mapNode_168104_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_161381_008965 :
    Balanced.RowTree Nat :=
  .branch 4482
    mapNode_161381_004482
    mapNode_165863_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_170346 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/170346-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_170906 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/170906-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_170346_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_170346
    mapChunk_170906
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_171466 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/171466-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_172026 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/172026-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_171466_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_171466
    mapChunk_172026
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_170346_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_170346_001120
    mapNode_171466_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_172587 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/172587-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_173147 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/173147-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_172587_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_172587
    mapChunk_173147
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_173708 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/173708-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_174268 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/174268-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_173708_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_173708
    mapChunk_174268
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_172587_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_172587_001121
    mapNode_173708_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_170346_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_170346_002241
    mapNode_172587_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_174829 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/174829-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_175389 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/175389-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_174829_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_174829
    mapChunk_175389
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_175949 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/175949-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_176509 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/176509-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_175949_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_175949
    mapChunk_176509
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_174829_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_174829_001120
    mapNode_175949_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_177070 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/177070-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_177630 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/177630-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_177070_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_177070
    mapChunk_177630
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_178191 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/178191-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_178751 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/178751-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_178191_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_178191
    mapChunk_178751
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_177070_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_177070_001121
    mapNode_178191_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_174829_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_174829_002241
    mapNode_177070_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_170346_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_170346_004483
    mapNode_174829_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_161381_017931 :
    Balanced.RowTree Nat :=
  .branch 8965
    mapNode_161381_008965
    mapNode_170346_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_143450_035862 :
    Balanced.RowTree Nat :=
  .branch 17931
    mapNode_143450_017931
    mapNode_161381_017931
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_179312 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/179312-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_179872 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/179872-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_179312_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_179312
    mapChunk_179872
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_180432 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/180432-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_180992 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/180992-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_180432_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_180432
    mapChunk_180992
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_179312_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_179312_001120
    mapNode_180432_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_181553 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/181553-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_182113 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/182113-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_181553_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_181553
    mapChunk_182113
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_182673 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/182673-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_183233 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/183233-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_182673_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_182673
    mapChunk_183233
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_181553_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_181553_001120
    mapNode_182673_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_179312_004482 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_179312_002241
    mapNode_181553_002241
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_183794 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/183794-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_184354 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/184354-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_183794_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_183794
    mapChunk_184354
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_184914 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/184914-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_185474 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/185474-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_184914_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_184914
    mapChunk_185474
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_183794_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_183794_001120
    mapNode_184914_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_186035 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/186035-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_186595 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/186595-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_186035_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_186035
    mapChunk_186595
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_187156 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/187156-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_187716 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/187716-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_187156_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_187156
    mapChunk_187716
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_186035_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_186035_001121
    mapNode_187156_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_183794_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_183794_002241
    mapNode_186035_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_179312_008965 :
    Balanced.RowTree Nat :=
  .branch 4482
    mapNode_179312_004482
    mapNode_183794_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_188277 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/188277-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_188837 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/188837-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_188277_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_188277
    mapChunk_188837
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_189397 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/189397-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_189957 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/189957-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_189397_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_189397
    mapChunk_189957
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_188277_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_188277_001120
    mapNode_189397_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_190518 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/190518-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_191078 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/191078-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_190518_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_190518
    mapChunk_191078
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_191639 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/191639-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_192199 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/192199-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_191639_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_191639
    mapChunk_192199
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_190518_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_190518_001121
    mapNode_191639_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_188277_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_188277_002241
    mapNode_190518_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_192760 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/192760-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_193320 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/193320-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_192760_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_192760
    mapChunk_193320
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_193880 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/193880-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_194440 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/194440-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_193880_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_193880
    mapChunk_194440
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_192760_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_192760_001120
    mapNode_193880_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_195001 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/195001-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_195561 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/195561-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_195001_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_195001
    mapChunk_195561
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_196122 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/196122-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_196682 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/196682-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_196122_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_196122
    mapChunk_196682
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_195001_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_195001_001121
    mapNode_196122_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_192760_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_192760_002241
    mapNode_195001_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_188277_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_188277_004483
    mapNode_192760_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_179312_017931 :
    Balanced.RowTree Nat :=
  .branch 8965
    mapNode_179312_008965
    mapNode_188277_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_197243 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/197243-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_197803 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/197803-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_197243_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_197243
    mapChunk_197803
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_198363 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/198363-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_198923 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/198923-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_198363_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_198363
    mapChunk_198923
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_197243_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_197243_001120
    mapNode_198363_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_199484 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/199484-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_200044 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/200044-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_199484_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_199484
    mapChunk_200044
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_200605 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/200605-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_201165 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/201165-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_200605_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_200605
    mapChunk_201165
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_199484_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_199484_001121
    mapNode_200605_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_197243_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_197243_002241
    mapNode_199484_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_201726 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/201726-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_202286 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/202286-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_201726_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_201726
    mapChunk_202286
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_202846 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/202846-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_203406 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/203406-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_202846_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_202846
    mapChunk_203406
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_201726_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_201726_001120
    mapNode_202846_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_203967 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/203967-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_204527 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/204527-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_203967_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_203967
    mapChunk_204527
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_205088 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/205088-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_205648 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/205648-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_205088_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_205088
    mapChunk_205648
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_203967_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_203967_001121
    mapNode_205088_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_201726_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_201726_002241
    mapNode_203967_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_197243_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_197243_004483
    mapNode_201726_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_206209 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/206209-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_206769 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/206769-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_206209_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_206209
    mapChunk_206769
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_207329 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/207329-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_207889 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/207889-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_207329_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_207329
    mapChunk_207889
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_206209_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_206209_001120
    mapNode_207329_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_208450 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/208450-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_209010 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/209010-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_208450_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_208450
    mapChunk_209010
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_209571 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/209571-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_210131 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/210131-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_209571_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_209571
    mapChunk_210131
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_208450_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_208450_001121
    mapNode_209571_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_206209_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_206209_002241
    mapNode_208450_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_210692 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/210692-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_211252 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/211252-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_210692_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_210692
    mapChunk_211252
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_211812 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/211812-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_212372 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/212372-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_211812_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_211812
    mapChunk_212372
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_210692_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_210692_001120
    mapNode_211812_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_212933 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/212933-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_213493 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/213493-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_212933_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_212933
    mapChunk_213493
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_214054 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/214054-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_214614 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/214614-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_214054_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_214054
    mapChunk_214614
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_212933_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_212933_001121
    mapNode_214054_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_210692_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_210692_002241
    mapNode_212933_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_206209_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_206209_004483
    mapNode_210692_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_197243_017932 :
    Balanced.RowTree Nat :=
  .branch 8966
    mapNode_197243_008966
    mapNode_206209_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_179312_035863 :
    Balanced.RowTree Nat :=
  .branch 17931
    mapNode_179312_017931
    mapNode_197243_017932
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_143450_071725 :
    Balanced.RowTree Nat :=
  .branch 35862
    mapNode_143450_035862
    mapNode_179312_035863
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_215175 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/215175-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_215735 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/215735-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_215175_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_215175
    mapChunk_215735
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_216295 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/216295-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_216855 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/216855-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_216295_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_216295
    mapChunk_216855
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_215175_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_215175_001120
    mapNode_216295_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_217416 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/217416-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_217976 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/217976-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_217416_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_217416
    mapChunk_217976
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_218536 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/218536-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_219096 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/219096-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_218536_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_218536
    mapChunk_219096
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_217416_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_217416_001120
    mapNode_218536_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_215175_004482 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_215175_002241
    mapNode_217416_002241
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_219657 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/219657-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_220217 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/220217-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_219657_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_219657
    mapChunk_220217
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_220777 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/220777-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_221337 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/221337-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_220777_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_220777
    mapChunk_221337
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_219657_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_219657_001120
    mapNode_220777_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_221898 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/221898-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_222458 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/222458-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_221898_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_221898
    mapChunk_222458
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_223019 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/223019-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_223579 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/223579-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_223019_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_223019
    mapChunk_223579
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_221898_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_221898_001121
    mapNode_223019_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_219657_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_219657_002241
    mapNode_221898_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_215175_008965 :
    Balanced.RowTree Nat :=
  .branch 4482
    mapNode_215175_004482
    mapNode_219657_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_224140 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/224140-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_224700 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/224700-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_224140_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_224140
    mapChunk_224700
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_225260 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/225260-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_225820 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/225820-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_225260_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_225260
    mapChunk_225820
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_224140_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_224140_001120
    mapNode_225260_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_226381 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/226381-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_226941 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/226941-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_226381_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_226381
    mapChunk_226941
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_227502 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/227502-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_228062 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/228062-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_227502_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_227502
    mapChunk_228062
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_226381_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_226381_001121
    mapNode_227502_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_224140_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_224140_002241
    mapNode_226381_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_228623 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/228623-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_229183 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/229183-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_228623_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_228623
    mapChunk_229183
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_229743 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/229743-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_230303 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/230303-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_229743_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_229743
    mapChunk_230303
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_228623_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_228623_001120
    mapNode_229743_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_230864 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/230864-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_231424 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/231424-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_230864_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_230864
    mapChunk_231424
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_231985 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/231985-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_232545 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/232545-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_231985_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_231985
    mapChunk_232545
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_230864_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_230864_001121
    mapNode_231985_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_228623_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_228623_002241
    mapNode_230864_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_224140_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_224140_004483
    mapNode_228623_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_215175_017931 :
    Balanced.RowTree Nat :=
  .branch 8965
    mapNode_215175_008965
    mapNode_224140_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_233106 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/233106-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_233666 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/233666-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_233106_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_233106
    mapChunk_233666
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_234226 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/234226-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_234786 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/234786-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_234226_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_234226
    mapChunk_234786
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_233106_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_233106_001120
    mapNode_234226_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_235347 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/235347-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_235907 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/235907-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_235347_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_235347
    mapChunk_235907
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_236468 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/236468-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_237028 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/237028-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_236468_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_236468
    mapChunk_237028
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_235347_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_235347_001121
    mapNode_236468_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_233106_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_233106_002241
    mapNode_235347_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_237589 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/237589-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_238149 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/238149-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_237589_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_237589
    mapChunk_238149
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_238709 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/238709-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_239269 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/239269-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_238709_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_238709
    mapChunk_239269
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_237589_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_237589_001120
    mapNode_238709_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_239830 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/239830-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_240390 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/240390-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_239830_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_239830
    mapChunk_240390
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_240951 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/240951-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_241511 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/241511-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_240951_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_240951
    mapChunk_241511
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_239830_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_239830_001121
    mapNode_240951_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_237589_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_237589_002241
    mapNode_239830_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_233106_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_233106_004483
    mapNode_237589_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_242072 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/242072-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_242632 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/242632-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_242072_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_242072
    mapChunk_242632
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_243192 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/243192-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_243752 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/243752-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_243192_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_243192
    mapChunk_243752
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_242072_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_242072_001120
    mapNode_243192_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_244313 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/244313-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_244873 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/244873-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_244313_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_244313
    mapChunk_244873
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_245434 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/245434-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_245994 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/245994-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_245434_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_245434
    mapChunk_245994
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_244313_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_244313_001121
    mapNode_245434_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_242072_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_242072_002241
    mapNode_244313_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_246555 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/246555-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_247115 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/247115-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_246555_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_246555
    mapChunk_247115
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_247675 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/247675-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_248235 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/248235-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_247675_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_247675
    mapChunk_248235
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_246555_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_246555_001120
    mapNode_247675_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_248796 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/248796-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_249356 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/249356-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_248796_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_248796
    mapChunk_249356
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_249917 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/249917-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_250477 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/250477-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_249917_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_249917
    mapChunk_250477
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_248796_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_248796_001121
    mapNode_249917_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_246555_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_246555_002241
    mapNode_248796_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_242072_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_242072_004483
    mapNode_246555_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_233106_017932 :
    Balanced.RowTree Nat :=
  .branch 8966
    mapNode_233106_008966
    mapNode_242072_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_215175_035863 :
    Balanced.RowTree Nat :=
  .branch 17931
    mapNode_215175_017931
    mapNode_233106_017932
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_251038 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/251038-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_251598 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/251598-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_251038_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_251038
    mapChunk_251598
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_252158 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/252158-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_252718 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/252718-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_252158_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_252158
    mapChunk_252718
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_251038_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_251038_001120
    mapNode_252158_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_253279 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/253279-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_253839 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/253839-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_253279_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_253279
    mapChunk_253839
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_254399 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/254399-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_254959 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/254959-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_254399_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_254399
    mapChunk_254959
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_253279_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_253279_001120
    mapNode_254399_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_251038_004482 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_251038_002241
    mapNode_253279_002241
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_255520 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/255520-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_256080 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/256080-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_255520_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_255520
    mapChunk_256080
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_256640 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/256640-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_257200 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/257200-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_256640_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_256640
    mapChunk_257200
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_255520_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_255520_001120
    mapNode_256640_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_257761 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/257761-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_258321 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/258321-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_257761_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_257761
    mapChunk_258321
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_258882 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/258882-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_259442 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/259442-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_258882_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_258882
    mapChunk_259442
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_257761_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_257761_001121
    mapNode_258882_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_255520_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_255520_002241
    mapNode_257761_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_251038_008965 :
    Balanced.RowTree Nat :=
  .branch 4482
    mapNode_251038_004482
    mapNode_255520_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_260003 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/260003-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_260563 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/260563-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_260003_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_260003
    mapChunk_260563
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_261123 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/261123-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_261683 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/261683-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_261123_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_261123
    mapChunk_261683
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_260003_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_260003_001120
    mapNode_261123_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_262244 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/262244-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_262804 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/262804-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_262244_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_262244
    mapChunk_262804
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_263365 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/263365-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_263925 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/263925-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_263365_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_263365
    mapChunk_263925
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_262244_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_262244_001121
    mapNode_263365_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_260003_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_260003_002241
    mapNode_262244_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_264486 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/264486-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_265046 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/265046-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_264486_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_264486
    mapChunk_265046
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_265606 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/265606-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_266166 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/266166-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_265606_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_265606
    mapChunk_266166
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_264486_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_264486_001120
    mapNode_265606_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_266727 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/266727-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_267287 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/267287-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_266727_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_266727
    mapChunk_267287
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_267848 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/267848-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_268408 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/268408-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_267848_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_267848
    mapChunk_268408
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_266727_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_266727_001121
    mapNode_267848_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_264486_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_264486_002241
    mapNode_266727_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_260003_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_260003_004483
    mapNode_264486_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_251038_017931 :
    Balanced.RowTree Nat :=
  .branch 8965
    mapNode_251038_008965
    mapNode_260003_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_268969 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/268969-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_269529 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/269529-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_268969_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_268969
    mapChunk_269529
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_270089 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/270089-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_270649 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/270649-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_270089_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_270089
    mapChunk_270649
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_268969_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_268969_001120
    mapNode_270089_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_271210 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/271210-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_271770 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/271770-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_271210_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_271210
    mapChunk_271770
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_272331 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/272331-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_272891 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/272891-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_272331_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_272331
    mapChunk_272891
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_271210_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_271210_001121
    mapNode_272331_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_268969_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_268969_002241
    mapNode_271210_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_273452 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/273452-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_274012 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/274012-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_273452_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_273452
    mapChunk_274012
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_274572 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/274572-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_275132 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/275132-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_274572_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_274572
    mapChunk_275132
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_273452_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_273452_001120
    mapNode_274572_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_275693 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/275693-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_276253 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/276253-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_275693_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_275693
    mapChunk_276253
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_276814 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/276814-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_277374 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/277374-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_276814_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_276814
    mapChunk_277374
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_275693_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_275693_001121
    mapNode_276814_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_273452_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_273452_002241
    mapNode_275693_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_268969_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_268969_004483
    mapNode_273452_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_277935 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/277935-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_278495 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/278495-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_277935_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_277935
    mapChunk_278495
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_279055 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/279055-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_279615 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/279615-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_279055_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_279055
    mapChunk_279615
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_277935_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_277935_001120
    mapNode_279055_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_280176 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/280176-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_280736 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/280736-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_280176_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_280176
    mapChunk_280736
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_281297 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/281297-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_281857 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/281857-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_281297_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_281297
    mapChunk_281857
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_280176_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_280176_001121
    mapNode_281297_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_277935_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_277935_002241
    mapNode_280176_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_282418 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/282418-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_282978 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/282978-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_282418_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_282418
    mapChunk_282978
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_283538 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/283538-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_284098 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/284098-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_283538_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_283538
    mapChunk_284098
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_282418_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_282418_001120
    mapNode_283538_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_284659 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/284659-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_285219 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/285219-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_284659_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_284659
    mapChunk_285219
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_285780 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/285780-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_286340 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/286340-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_285780_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_285780
    mapChunk_286340
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_284659_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_284659_001121
    mapNode_285780_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_282418_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_282418_002241
    mapNode_284659_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_277935_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_277935_004483
    mapNode_282418_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_268969_017932 :
    Balanced.RowTree Nat :=
  .branch 8966
    mapNode_268969_008966
    mapNode_277935_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_251038_035863 :
    Balanced.RowTree Nat :=
  .branch 17931
    mapNode_251038_017931
    mapNode_268969_017932
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_215175_071726 :
    Balanced.RowTree Nat :=
  .branch 35863
    mapNode_215175_035863
    mapNode_251038_035863
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_143450_143451 :
    Balanced.RowTree Nat :=
  .branch 71725
    mapNode_143450_071725
    mapNode_215175_071726
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_000000_286901 :
    Balanced.RowTree Nat :=
  .branch 143450
    mapNode_000000_143450
    mapNode_143450_143451
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_286901 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/286901-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_287461 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/287461-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_286901_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_286901
    mapChunk_287461
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_288021 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/288021-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_288581 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/288581-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_288021_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_288021
    mapChunk_288581
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_286901_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_286901_001120
    mapNode_288021_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_289142 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/289142-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_289702 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/289702-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_289142_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_289142
    mapChunk_289702
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_290262 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/290262-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_290822 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/290822-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_290262_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_290262
    mapChunk_290822
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_289142_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_289142_001120
    mapNode_290262_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_286901_004482 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_286901_002241
    mapNode_289142_002241
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_291383 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/291383-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_291943 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/291943-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_291383_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_291383
    mapChunk_291943
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_292503 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/292503-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_293063 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/293063-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_292503_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_292503
    mapChunk_293063
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_291383_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_291383_001120
    mapNode_292503_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_293624 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/293624-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_294184 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/294184-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_293624_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_293624
    mapChunk_294184
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_294745 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/294745-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_295305 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/295305-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_294745_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_294745
    mapChunk_295305
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_293624_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_293624_001121
    mapNode_294745_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_291383_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_291383_002241
    mapNode_293624_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_286901_008965 :
    Balanced.RowTree Nat :=
  .branch 4482
    mapNode_286901_004482
    mapNode_291383_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_295866 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/295866-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_296426 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/296426-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_295866_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_295866
    mapChunk_296426
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_296986 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/296986-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_297546 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/297546-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_296986_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_296986
    mapChunk_297546
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_295866_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_295866_001120
    mapNode_296986_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_298107 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/298107-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_298667 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/298667-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_298107_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_298107
    mapChunk_298667
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_299228 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/299228-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_299788 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/299788-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_299228_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_299228
    mapChunk_299788
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_298107_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_298107_001121
    mapNode_299228_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_295866_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_295866_002241
    mapNode_298107_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_300349 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/300349-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_300909 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/300909-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_300349_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_300349
    mapChunk_300909
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_301469 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/301469-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_302029 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/302029-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_301469_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_301469
    mapChunk_302029
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_300349_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_300349_001120
    mapNode_301469_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_302590 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/302590-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_303150 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/303150-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_302590_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_302590
    mapChunk_303150
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_303711 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/303711-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_304271 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/304271-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_303711_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_303711
    mapChunk_304271
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_302590_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_302590_001121
    mapNode_303711_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_300349_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_300349_002241
    mapNode_302590_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_295866_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_295866_004483
    mapNode_300349_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_286901_017931 :
    Balanced.RowTree Nat :=
  .branch 8965
    mapNode_286901_008965
    mapNode_295866_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_304832 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/304832-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_305392 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/305392-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_304832_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_304832
    mapChunk_305392
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_305952 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/305952-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_306512 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/306512-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_305952_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_305952
    mapChunk_306512
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_304832_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_304832_001120
    mapNode_305952_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_307073 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/307073-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_307633 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/307633-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_307073_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_307073
    mapChunk_307633
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_308193 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/308193-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_308753 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/308753-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_308193_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_308193
    mapChunk_308753
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_307073_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_307073_001120
    mapNode_308193_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_304832_004482 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_304832_002241
    mapNode_307073_002241
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_309314 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/309314-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_309874 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/309874-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_309314_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_309314
    mapChunk_309874
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_310434 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/310434-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_310994 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/310994-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_310434_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_310434
    mapChunk_310994
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_309314_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_309314_001120
    mapNode_310434_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_311555 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/311555-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_312115 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/312115-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_311555_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_311555
    mapChunk_312115
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_312676 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/312676-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_313236 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/313236-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_312676_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_312676
    mapChunk_313236
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_311555_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_311555_001121
    mapNode_312676_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_309314_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_309314_002241
    mapNode_311555_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_304832_008965 :
    Balanced.RowTree Nat :=
  .branch 4482
    mapNode_304832_004482
    mapNode_309314_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_313797 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/313797-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_314357 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/314357-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_313797_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_313797
    mapChunk_314357
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_314917 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/314917-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_315477 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/315477-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_314917_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_314917
    mapChunk_315477
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_313797_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_313797_001120
    mapNode_314917_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_316038 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/316038-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_316598 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/316598-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_316038_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_316038
    mapChunk_316598
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_317159 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/317159-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_317719 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/317719-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_317159_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_317159
    mapChunk_317719
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_316038_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_316038_001121
    mapNode_317159_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_313797_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_313797_002241
    mapNode_316038_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_318280 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/318280-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_318840 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/318840-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_318280_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_318280
    mapChunk_318840
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_319400 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/319400-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_319960 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/319960-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_319400_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_319400
    mapChunk_319960
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_318280_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_318280_001120
    mapNode_319400_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_320521 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/320521-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_321081 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/321081-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_320521_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_320521
    mapChunk_321081
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_321642 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/321642-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_322202 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/322202-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_321642_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_321642
    mapChunk_322202
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_320521_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_320521_001121
    mapNode_321642_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_318280_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_318280_002241
    mapNode_320521_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_313797_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_313797_004483
    mapNode_318280_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_304832_017931 :
    Balanced.RowTree Nat :=
  .branch 8965
    mapNode_304832_008965
    mapNode_313797_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_286901_035862 :
    Balanced.RowTree Nat :=
  .branch 17931
    mapNode_286901_017931
    mapNode_304832_017931
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_322763 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/322763-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_323323 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/323323-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_322763_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_322763
    mapChunk_323323
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_323883 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/323883-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_324443 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/324443-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_323883_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_323883
    mapChunk_324443
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_322763_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_322763_001120
    mapNode_323883_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_325004 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/325004-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_325564 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/325564-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_325004_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_325004
    mapChunk_325564
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_326124 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/326124-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_326684 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/326684-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_326124_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_326124
    mapChunk_326684
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_325004_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_325004_001120
    mapNode_326124_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_322763_004482 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_322763_002241
    mapNode_325004_002241
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_327245 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/327245-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_327805 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/327805-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_327245_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_327245
    mapChunk_327805
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_328365 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/328365-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_328925 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/328925-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_328365_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_328365
    mapChunk_328925
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_327245_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_327245_001120
    mapNode_328365_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_329486 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/329486-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_330046 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/330046-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_329486_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_329486
    mapChunk_330046
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_330607 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/330607-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_331167 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/331167-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_330607_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_330607
    mapChunk_331167
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_329486_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_329486_001121
    mapNode_330607_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_327245_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_327245_002241
    mapNode_329486_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_322763_008965 :
    Balanced.RowTree Nat :=
  .branch 4482
    mapNode_322763_004482
    mapNode_327245_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_331728 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/331728-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_332288 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/332288-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_331728_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_331728
    mapChunk_332288
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_332848 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/332848-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_333408 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/333408-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_332848_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_332848
    mapChunk_333408
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_331728_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_331728_001120
    mapNode_332848_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_333969 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/333969-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_334529 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/334529-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_333969_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_333969
    mapChunk_334529
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_335090 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/335090-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_335650 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/335650-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_335090_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_335090
    mapChunk_335650
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_333969_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_333969_001121
    mapNode_335090_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_331728_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_331728_002241
    mapNode_333969_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_336211 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/336211-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_336771 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/336771-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_336211_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_336211
    mapChunk_336771
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_337331 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/337331-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_337891 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/337891-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_337331_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_337331
    mapChunk_337891
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_336211_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_336211_001120
    mapNode_337331_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_338452 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/338452-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_339012 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/339012-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_338452_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_338452
    mapChunk_339012
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_339573 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/339573-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_340133 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/340133-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_339573_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_339573
    mapChunk_340133
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_338452_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_338452_001121
    mapNode_339573_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_336211_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_336211_002241
    mapNode_338452_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_331728_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_331728_004483
    mapNode_336211_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_322763_017931 :
    Balanced.RowTree Nat :=
  .branch 8965
    mapNode_322763_008965
    mapNode_331728_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_340694 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/340694-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_341254 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/341254-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_340694_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_340694
    mapChunk_341254
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_341814 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/341814-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_342374 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/342374-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_341814_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_341814
    mapChunk_342374
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_340694_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_340694_001120
    mapNode_341814_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_342935 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/342935-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_343495 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/343495-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_342935_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_342935
    mapChunk_343495
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_344056 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/344056-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_344616 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/344616-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_344056_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_344056
    mapChunk_344616
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_342935_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_342935_001121
    mapNode_344056_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_340694_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_340694_002241
    mapNode_342935_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_345177 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/345177-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_345737 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/345737-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_345177_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_345177
    mapChunk_345737
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_346297 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/346297-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_346857 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/346857-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_346297_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_346297
    mapChunk_346857
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_345177_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_345177_001120
    mapNode_346297_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_347418 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/347418-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_347978 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/347978-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_347418_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_347418
    mapChunk_347978
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_348539 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/348539-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_349099 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/349099-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_348539_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_348539
    mapChunk_349099
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_347418_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_347418_001121
    mapNode_348539_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_345177_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_345177_002241
    mapNode_347418_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_340694_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_340694_004483
    mapNode_345177_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_349660 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/349660-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_350220 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/350220-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_349660_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_349660
    mapChunk_350220
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_350780 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/350780-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_351340 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/351340-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_350780_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_350780
    mapChunk_351340
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_349660_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_349660_001120
    mapNode_350780_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_351901 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/351901-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_352461 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/352461-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_351901_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_351901
    mapChunk_352461
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_353022 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/353022-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_353582 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/353582-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_353022_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_353022
    mapChunk_353582
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_351901_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_351901_001121
    mapNode_353022_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_349660_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_349660_002241
    mapNode_351901_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_354143 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/354143-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_354703 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/354703-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_354143_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_354143
    mapChunk_354703
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_355263 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/355263-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_355823 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/355823-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_355263_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_355263
    mapChunk_355823
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_354143_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_354143_001120
    mapNode_355263_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_356384 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/356384-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_356944 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/356944-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_356384_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_356384
    mapChunk_356944
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_357505 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/357505-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_358065 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/358065-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_357505_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_357505
    mapChunk_358065
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_356384_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_356384_001121
    mapNode_357505_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_354143_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_354143_002241
    mapNode_356384_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_349660_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_349660_004483
    mapNode_354143_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_340694_017932 :
    Balanced.RowTree Nat :=
  .branch 8966
    mapNode_340694_008966
    mapNode_349660_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_322763_035863 :
    Balanced.RowTree Nat :=
  .branch 17931
    mapNode_322763_017931
    mapNode_340694_017932
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_286901_071725 :
    Balanced.RowTree Nat :=
  .branch 35862
    mapNode_286901_035862
    mapNode_322763_035863
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_358626 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/358626-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_359186 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/359186-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_358626_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_358626
    mapChunk_359186
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_359746 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/359746-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_360306 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/360306-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_359746_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_359746
    mapChunk_360306
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_358626_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_358626_001120
    mapNode_359746_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_360867 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/360867-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_361427 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/361427-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_360867_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_360867
    mapChunk_361427
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_361987 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/361987-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_362547 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/362547-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_361987_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_361987
    mapChunk_362547
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_360867_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_360867_001120
    mapNode_361987_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_358626_004482 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_358626_002241
    mapNode_360867_002241
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_363108 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/363108-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_363668 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/363668-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_363108_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_363108
    mapChunk_363668
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_364228 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/364228-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_364788 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/364788-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_364228_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_364228
    mapChunk_364788
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_363108_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_363108_001120
    mapNode_364228_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_365349 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/365349-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_365909 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/365909-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_365349_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_365349
    mapChunk_365909
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_366470 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/366470-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_367030 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/367030-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_366470_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_366470
    mapChunk_367030
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_365349_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_365349_001121
    mapNode_366470_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_363108_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_363108_002241
    mapNode_365349_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_358626_008965 :
    Balanced.RowTree Nat :=
  .branch 4482
    mapNode_358626_004482
    mapNode_363108_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_367591 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/367591-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_368151 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/368151-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_367591_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_367591
    mapChunk_368151
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_368711 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/368711-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_369271 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/369271-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_368711_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_368711
    mapChunk_369271
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_367591_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_367591_001120
    mapNode_368711_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_369832 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/369832-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_370392 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/370392-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_369832_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_369832
    mapChunk_370392
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_370953 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/370953-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_371513 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/371513-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_370953_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_370953
    mapChunk_371513
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_369832_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_369832_001121
    mapNode_370953_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_367591_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_367591_002241
    mapNode_369832_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_372074 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/372074-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_372634 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/372634-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_372074_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_372074
    mapChunk_372634
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_373194 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/373194-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_373754 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/373754-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_373194_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_373194
    mapChunk_373754
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_372074_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_372074_001120
    mapNode_373194_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_374315 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/374315-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_374875 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/374875-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_374315_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_374315
    mapChunk_374875
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_375436 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/375436-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_375996 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/375996-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_375436_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_375436
    mapChunk_375996
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_374315_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_374315_001121
    mapNode_375436_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_372074_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_372074_002241
    mapNode_374315_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_367591_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_367591_004483
    mapNode_372074_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_358626_017931 :
    Balanced.RowTree Nat :=
  .branch 8965
    mapNode_358626_008965
    mapNode_367591_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_376557 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/376557-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_377117 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/377117-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_376557_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_376557
    mapChunk_377117
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_377677 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/377677-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_378237 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/378237-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_377677_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_377677
    mapChunk_378237
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_376557_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_376557_001120
    mapNode_377677_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_378798 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/378798-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_379358 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/379358-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_378798_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_378798
    mapChunk_379358
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_379918 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/379918-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_380478 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/380478-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_379918_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_379918
    mapChunk_380478
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_378798_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_378798_001120
    mapNode_379918_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_376557_004482 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_376557_002241
    mapNode_378798_002241
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_381039 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/381039-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_381599 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/381599-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_381039_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_381039
    mapChunk_381599
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_382159 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/382159-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_382719 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/382719-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_382159_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_382159
    mapChunk_382719
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_381039_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_381039_001120
    mapNode_382159_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_383280 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/383280-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_383840 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/383840-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_383280_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_383280
    mapChunk_383840
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_384401 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/384401-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_384961 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/384961-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_384401_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_384401
    mapChunk_384961
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_383280_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_383280_001121
    mapNode_384401_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_381039_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_381039_002241
    mapNode_383280_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_376557_008965 :
    Balanced.RowTree Nat :=
  .branch 4482
    mapNode_376557_004482
    mapNode_381039_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_385522 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/385522-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_386082 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/386082-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_385522_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_385522
    mapChunk_386082
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_386642 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/386642-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_387202 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/387202-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_386642_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_386642
    mapChunk_387202
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_385522_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_385522_001120
    mapNode_386642_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_387763 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/387763-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_388323 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/388323-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_387763_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_387763
    mapChunk_388323
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_388884 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/388884-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_389444 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/389444-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_388884_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_388884
    mapChunk_389444
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_387763_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_387763_001121
    mapNode_388884_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_385522_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_385522_002241
    mapNode_387763_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_390005 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/390005-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_390565 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/390565-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_390005_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_390005
    mapChunk_390565
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_391125 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/391125-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_391685 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/391685-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_391125_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_391125
    mapChunk_391685
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_390005_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_390005_001120
    mapNode_391125_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_392246 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/392246-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_392806 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/392806-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_392246_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_392246
    mapChunk_392806
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_393367 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/393367-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_393927 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/393927-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_393367_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_393367
    mapChunk_393927
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_392246_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_392246_001121
    mapNode_393367_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_390005_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_390005_002241
    mapNode_392246_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_385522_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_385522_004483
    mapNode_390005_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_376557_017931 :
    Balanced.RowTree Nat :=
  .branch 8965
    mapNode_376557_008965
    mapNode_385522_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_358626_035862 :
    Balanced.RowTree Nat :=
  .branch 17931
    mapNode_358626_017931
    mapNode_376557_017931
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_394488 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/394488-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_395048 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/395048-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_394488_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_394488
    mapChunk_395048
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_395608 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/395608-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_396168 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/396168-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_395608_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_395608
    mapChunk_396168
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_394488_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_394488_001120
    mapNode_395608_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_396729 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/396729-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_397289 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/397289-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_396729_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_396729
    mapChunk_397289
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_397849 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/397849-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_398409 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/398409-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_397849_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_397849
    mapChunk_398409
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_396729_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_396729_001120
    mapNode_397849_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_394488_004482 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_394488_002241
    mapNode_396729_002241
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_398970 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/398970-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_399530 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/399530-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_398970_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_398970
    mapChunk_399530
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_400090 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/400090-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_400650 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/400650-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_400090_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_400090
    mapChunk_400650
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_398970_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_398970_001120
    mapNode_400090_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_401211 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/401211-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_401771 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/401771-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_401211_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_401211
    mapChunk_401771
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_402332 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/402332-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_402892 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/402892-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_402332_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_402332
    mapChunk_402892
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_401211_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_401211_001121
    mapNode_402332_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_398970_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_398970_002241
    mapNode_401211_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_394488_008965 :
    Balanced.RowTree Nat :=
  .branch 4482
    mapNode_394488_004482
    mapNode_398970_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_403453 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/403453-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_404013 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/404013-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_403453_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_403453
    mapChunk_404013
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_404573 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/404573-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_405133 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/405133-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_404573_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_404573
    mapChunk_405133
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_403453_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_403453_001120
    mapNode_404573_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_405694 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/405694-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_406254 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/406254-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_405694_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_405694
    mapChunk_406254
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_406815 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/406815-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_407375 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/407375-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_406815_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_406815
    mapChunk_407375
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_405694_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_405694_001121
    mapNode_406815_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_403453_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_403453_002241
    mapNode_405694_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_407936 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/407936-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_408496 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/408496-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_407936_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_407936
    mapChunk_408496
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_409056 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/409056-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_409616 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/409616-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_409056_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_409056
    mapChunk_409616
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_407936_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_407936_001120
    mapNode_409056_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_410177 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/410177-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_410737 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/410737-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_410177_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_410177
    mapChunk_410737
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_411298 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/411298-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_411858 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/411858-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_411298_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_411298
    mapChunk_411858
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_410177_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_410177_001121
    mapNode_411298_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_407936_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_407936_002241
    mapNode_410177_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_403453_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_403453_004483
    mapNode_407936_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_394488_017931 :
    Balanced.RowTree Nat :=
  .branch 8965
    mapNode_394488_008965
    mapNode_403453_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_412419 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/412419-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_412979 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/412979-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_412419_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_412419
    mapChunk_412979
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_413539 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/413539-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_414099 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/414099-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_413539_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_413539
    mapChunk_414099
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_412419_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_412419_001120
    mapNode_413539_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_414660 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/414660-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_415220 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/415220-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_414660_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_414660
    mapChunk_415220
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_415781 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/415781-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_416341 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/416341-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_415781_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_415781
    mapChunk_416341
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_414660_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_414660_001121
    mapNode_415781_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_412419_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_412419_002241
    mapNode_414660_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_416902 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/416902-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_417462 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/417462-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_416902_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_416902
    mapChunk_417462
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_418022 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/418022-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_418582 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/418582-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_418022_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_418022
    mapChunk_418582
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_416902_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_416902_001120
    mapNode_418022_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_419143 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/419143-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_419703 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/419703-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_419143_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_419143
    mapChunk_419703
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_420264 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/420264-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_420824 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/420824-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_420264_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_420264
    mapChunk_420824
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_419143_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_419143_001121
    mapNode_420264_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_416902_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_416902_002241
    mapNode_419143_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_412419_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_412419_004483
    mapNode_416902_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_421385 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/421385-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_421945 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/421945-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_421385_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_421385
    mapChunk_421945
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_422505 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/422505-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_423065 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/423065-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_422505_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_422505
    mapChunk_423065
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_421385_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_421385_001120
    mapNode_422505_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_423626 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/423626-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_424186 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/424186-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_423626_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_423626
    mapChunk_424186
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_424747 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/424747-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_425307 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/425307-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_424747_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_424747
    mapChunk_425307
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_423626_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_423626_001121
    mapNode_424747_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_421385_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_421385_002241
    mapNode_423626_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_425868 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/425868-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_426428 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/426428-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_425868_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_425868
    mapChunk_426428
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_426988 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/426988-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_427548 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/427548-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_426988_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_426988
    mapChunk_427548
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_425868_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_425868_001120
    mapNode_426988_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_428109 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/428109-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_428669 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/428669-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_428109_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_428109
    mapChunk_428669
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_429230 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/429230-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_429790 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/429790-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_429230_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_429230
    mapChunk_429790
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_428109_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_428109_001121
    mapNode_429230_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_425868_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_425868_002241
    mapNode_428109_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_421385_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_421385_004483
    mapNode_425868_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_412419_017932 :
    Balanced.RowTree Nat :=
  .branch 8966
    mapNode_412419_008966
    mapNode_421385_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_394488_035863 :
    Balanced.RowTree Nat :=
  .branch 17931
    mapNode_394488_017931
    mapNode_412419_017932
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_358626_071725 :
    Balanced.RowTree Nat :=
  .branch 35862
    mapNode_358626_035862
    mapNode_394488_035863
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_286901_143450 :
    Balanced.RowTree Nat :=
  .branch 71725
    mapNode_286901_071725
    mapNode_358626_071725
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_430351 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/430351-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_430911 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/430911-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_430351_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_430351
    mapChunk_430911
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_431471 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/431471-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_432031 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/432031-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_431471_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_431471
    mapChunk_432031
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_430351_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_430351_001120
    mapNode_431471_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_432592 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/432592-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_433152 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/433152-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_432592_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_432592
    mapChunk_433152
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_433712 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/433712-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_434272 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/434272-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_433712_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_433712
    mapChunk_434272
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_432592_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_432592_001120
    mapNode_433712_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_430351_004482 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_430351_002241
    mapNode_432592_002241
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_434833 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/434833-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_435393 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/435393-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_434833_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_434833
    mapChunk_435393
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_435953 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/435953-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_436513 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/436513-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_435953_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_435953
    mapChunk_436513
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_434833_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_434833_001120
    mapNode_435953_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_437074 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/437074-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_437634 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/437634-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_437074_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_437074
    mapChunk_437634
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_438195 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/438195-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_438755 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/438755-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_438195_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_438195
    mapChunk_438755
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_437074_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_437074_001121
    mapNode_438195_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_434833_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_434833_002241
    mapNode_437074_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_430351_008965 :
    Balanced.RowTree Nat :=
  .branch 4482
    mapNode_430351_004482
    mapNode_434833_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_439316 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/439316-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_439876 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/439876-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_439316_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_439316
    mapChunk_439876
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_440436 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/440436-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_440996 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/440996-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_440436_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_440436
    mapChunk_440996
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_439316_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_439316_001120
    mapNode_440436_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_441557 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/441557-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_442117 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/442117-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_441557_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_441557
    mapChunk_442117
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_442678 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/442678-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_443238 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/443238-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_442678_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_442678
    mapChunk_443238
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_441557_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_441557_001121
    mapNode_442678_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_439316_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_439316_002241
    mapNode_441557_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_443799 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/443799-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_444359 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/444359-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_443799_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_443799
    mapChunk_444359
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_444919 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/444919-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_445479 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/445479-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_444919_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_444919
    mapChunk_445479
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_443799_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_443799_001120
    mapNode_444919_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_446040 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/446040-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_446600 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/446600-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_446040_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_446040
    mapChunk_446600
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_447161 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/447161-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_447721 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/447721-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_447161_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_447161
    mapChunk_447721
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_446040_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_446040_001121
    mapNode_447161_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_443799_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_443799_002241
    mapNode_446040_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_439316_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_439316_004483
    mapNode_443799_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_430351_017931 :
    Balanced.RowTree Nat :=
  .branch 8965
    mapNode_430351_008965
    mapNode_439316_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_448282 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/448282-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_448842 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/448842-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_448282_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_448282
    mapChunk_448842
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_449402 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/449402-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_449962 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/449962-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_449402_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_449402
    mapChunk_449962
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_448282_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_448282_001120
    mapNode_449402_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_450523 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/450523-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_451083 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/451083-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_450523_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_450523
    mapChunk_451083
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_451643 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/451643-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_452203 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/452203-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_451643_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_451643
    mapChunk_452203
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_450523_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_450523_001120
    mapNode_451643_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_448282_004482 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_448282_002241
    mapNode_450523_002241
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_452764 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/452764-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_453324 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/453324-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_452764_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_452764
    mapChunk_453324
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_453884 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/453884-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_454444 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/454444-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_453884_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_453884
    mapChunk_454444
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_452764_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_452764_001120
    mapNode_453884_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_455005 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/455005-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_455565 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/455565-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_455005_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_455005
    mapChunk_455565
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_456126 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/456126-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_456686 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/456686-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_456126_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_456126
    mapChunk_456686
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_455005_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_455005_001121
    mapNode_456126_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_452764_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_452764_002241
    mapNode_455005_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_448282_008965 :
    Balanced.RowTree Nat :=
  .branch 4482
    mapNode_448282_004482
    mapNode_452764_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_457247 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/457247-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_457807 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/457807-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_457247_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_457247
    mapChunk_457807
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_458367 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/458367-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_458927 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/458927-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_458367_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_458367
    mapChunk_458927
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_457247_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_457247_001120
    mapNode_458367_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_459488 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/459488-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_460048 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/460048-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_459488_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_459488
    mapChunk_460048
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_460609 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/460609-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_461169 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/461169-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_460609_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_460609
    mapChunk_461169
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_459488_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_459488_001121
    mapNode_460609_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_457247_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_457247_002241
    mapNode_459488_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_461730 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/461730-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_462290 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/462290-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_461730_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_461730
    mapChunk_462290
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_462850 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/462850-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_463410 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/463410-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_462850_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_462850
    mapChunk_463410
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_461730_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_461730_001120
    mapNode_462850_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_463971 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/463971-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_464531 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/464531-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_463971_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_463971
    mapChunk_464531
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_465092 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/465092-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_465652 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/465652-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_465092_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_465092
    mapChunk_465652
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_463971_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_463971_001121
    mapNode_465092_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_461730_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_461730_002241
    mapNode_463971_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_457247_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_457247_004483
    mapNode_461730_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_448282_017931 :
    Balanced.RowTree Nat :=
  .branch 8965
    mapNode_448282_008965
    mapNode_457247_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_430351_035862 :
    Balanced.RowTree Nat :=
  .branch 17931
    mapNode_430351_017931
    mapNode_448282_017931
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_466213 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/466213-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_466773 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/466773-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_466213_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_466213
    mapChunk_466773
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_467333 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/467333-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_467893 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/467893-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_467333_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_467333
    mapChunk_467893
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_466213_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_466213_001120
    mapNode_467333_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_468454 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/468454-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_469014 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/469014-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_468454_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_468454
    mapChunk_469014
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_469574 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/469574-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_470134 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/470134-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_469574_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_469574
    mapChunk_470134
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_468454_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_468454_001120
    mapNode_469574_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_466213_004482 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_466213_002241
    mapNode_468454_002241
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_470695 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/470695-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_471255 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/471255-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_470695_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_470695
    mapChunk_471255
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_471815 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/471815-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_472375 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/472375-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_471815_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_471815
    mapChunk_472375
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_470695_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_470695_001120
    mapNode_471815_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_472936 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/472936-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_473496 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/473496-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_472936_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_472936
    mapChunk_473496
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_474057 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/474057-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_474617 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/474617-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_474057_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_474057
    mapChunk_474617
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_472936_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_472936_001121
    mapNode_474057_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_470695_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_470695_002241
    mapNode_472936_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_466213_008965 :
    Balanced.RowTree Nat :=
  .branch 4482
    mapNode_466213_004482
    mapNode_470695_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_475178 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/475178-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_475738 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/475738-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_475178_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_475178
    mapChunk_475738
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_476298 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/476298-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_476858 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/476858-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_476298_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_476298
    mapChunk_476858
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_475178_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_475178_001120
    mapNode_476298_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_477419 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/477419-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_477979 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/477979-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_477419_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_477419
    mapChunk_477979
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_478540 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/478540-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_479100 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/479100-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_478540_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_478540
    mapChunk_479100
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_477419_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_477419_001121
    mapNode_478540_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_475178_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_475178_002241
    mapNode_477419_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_479661 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/479661-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_480221 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/480221-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_479661_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_479661
    mapChunk_480221
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_480781 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/480781-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_481341 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/481341-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_480781_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_480781
    mapChunk_481341
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_479661_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_479661_001120
    mapNode_480781_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_481902 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/481902-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_482462 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/482462-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_481902_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_481902
    mapChunk_482462
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_483023 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/483023-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_483583 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/483583-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_483023_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_483023
    mapChunk_483583
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_481902_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_481902_001121
    mapNode_483023_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_479661_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_479661_002241
    mapNode_481902_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_475178_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_475178_004483
    mapNode_479661_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_466213_017931 :
    Balanced.RowTree Nat :=
  .branch 8965
    mapNode_466213_008965
    mapNode_475178_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_484144 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/484144-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_484704 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/484704-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_484144_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_484144
    mapChunk_484704
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_485264 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/485264-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_485824 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/485824-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_485264_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_485264
    mapChunk_485824
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_484144_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_484144_001120
    mapNode_485264_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_486385 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/486385-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_486945 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/486945-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_486385_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_486385
    mapChunk_486945
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_487506 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/487506-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_488066 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/488066-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_487506_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_487506
    mapChunk_488066
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_486385_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_486385_001121
    mapNode_487506_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_484144_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_484144_002241
    mapNode_486385_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_488627 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/488627-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_489187 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/489187-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_488627_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_488627
    mapChunk_489187
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_489747 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/489747-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_490307 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/490307-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_489747_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_489747
    mapChunk_490307
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_488627_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_488627_001120
    mapNode_489747_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_490868 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/490868-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_491428 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/491428-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_490868_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_490868
    mapChunk_491428
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_491989 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/491989-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_492549 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/492549-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_491989_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_491989
    mapChunk_492549
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_490868_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_490868_001121
    mapNode_491989_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_488627_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_488627_002241
    mapNode_490868_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_484144_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_484144_004483
    mapNode_488627_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_493110 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/493110-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_493670 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/493670-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_493110_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_493110
    mapChunk_493670
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_494230 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/494230-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_494790 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/494790-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_494230_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_494230
    mapChunk_494790
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_493110_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_493110_001120
    mapNode_494230_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_495351 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/495351-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_495911 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/495911-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_495351_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_495351
    mapChunk_495911
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_496472 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/496472-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_497032 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/497032-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_496472_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_496472
    mapChunk_497032
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_495351_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_495351_001121
    mapNode_496472_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_493110_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_493110_002241
    mapNode_495351_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_497593 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/497593-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_498153 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/498153-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_497593_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_497593
    mapChunk_498153
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_498713 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/498713-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_499273 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/499273-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_498713_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_498713
    mapChunk_499273
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_497593_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_497593_001120
    mapNode_498713_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_499834 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/499834-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_500394 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/500394-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_499834_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_499834
    mapChunk_500394
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_500955 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/500955-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_501515 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/501515-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_500955_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_500955
    mapChunk_501515
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_499834_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_499834_001121
    mapNode_500955_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_497593_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_497593_002241
    mapNode_499834_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_493110_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_493110_004483
    mapNode_497593_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_484144_017932 :
    Balanced.RowTree Nat :=
  .branch 8966
    mapNode_484144_008966
    mapNode_493110_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_466213_035863 :
    Balanced.RowTree Nat :=
  .branch 17931
    mapNode_466213_017931
    mapNode_484144_017932
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_430351_071725 :
    Balanced.RowTree Nat :=
  .branch 35862
    mapNode_430351_035862
    mapNode_466213_035863
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_502076 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/502076-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_502636 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/502636-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_502076_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_502076
    mapChunk_502636
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_503196 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/503196-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_503756 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/503756-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_503196_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_503196
    mapChunk_503756
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_502076_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_502076_001120
    mapNode_503196_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_504317 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/504317-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_504877 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/504877-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_504317_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_504317
    mapChunk_504877
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_505437 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/505437-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_505997 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/505997-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_505437_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_505437
    mapChunk_505997
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_504317_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_504317_001120
    mapNode_505437_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_502076_004482 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_502076_002241
    mapNode_504317_002241
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_506558 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/506558-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_507118 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/507118-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_506558_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_506558
    mapChunk_507118
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_507678 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/507678-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_508238 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/508238-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_507678_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_507678
    mapChunk_508238
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_506558_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_506558_001120
    mapNode_507678_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_508799 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/508799-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_509359 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/509359-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_508799_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_508799
    mapChunk_509359
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_509920 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/509920-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_510480 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/510480-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_509920_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_509920
    mapChunk_510480
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_508799_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_508799_001121
    mapNode_509920_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_506558_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_506558_002241
    mapNode_508799_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_502076_008965 :
    Balanced.RowTree Nat :=
  .branch 4482
    mapNode_502076_004482
    mapNode_506558_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_511041 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/511041-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_511601 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/511601-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_511041_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_511041
    mapChunk_511601
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_512161 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/512161-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_512721 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/512721-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_512161_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_512161
    mapChunk_512721
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_511041_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_511041_001120
    mapNode_512161_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_513282 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/513282-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_513842 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/513842-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_513282_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_513282
    mapChunk_513842
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_514403 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/514403-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_514963 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/514963-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_514403_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_514403
    mapChunk_514963
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_513282_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_513282_001121
    mapNode_514403_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_511041_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_511041_002241
    mapNode_513282_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_515524 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/515524-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_516084 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/516084-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_515524_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_515524
    mapChunk_516084
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_516644 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/516644-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_517204 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/517204-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_516644_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_516644
    mapChunk_517204
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_515524_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_515524_001120
    mapNode_516644_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_517765 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/517765-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_518325 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/518325-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_517765_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_517765
    mapChunk_518325
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_518886 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/518886-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_519446 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/519446-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_518886_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_518886
    mapChunk_519446
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_517765_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_517765_001121
    mapNode_518886_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_515524_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_515524_002241
    mapNode_517765_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_511041_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_511041_004483
    mapNode_515524_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_502076_017931 :
    Balanced.RowTree Nat :=
  .branch 8965
    mapNode_502076_008965
    mapNode_511041_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_520007 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/520007-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_520567 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/520567-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_520007_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_520007
    mapChunk_520567
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_521127 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/521127-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_521687 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/521687-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_521127_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_521127
    mapChunk_521687
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_520007_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_520007_001120
    mapNode_521127_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_522248 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/522248-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_522808 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/522808-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_522248_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_522248
    mapChunk_522808
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_523369 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/523369-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_523929 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/523929-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_523369_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_523369
    mapChunk_523929
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_522248_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_522248_001121
    mapNode_523369_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_520007_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_520007_002241
    mapNode_522248_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_524490 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/524490-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_525050 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/525050-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_524490_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_524490
    mapChunk_525050
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_525610 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/525610-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_526170 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/526170-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_525610_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_525610
    mapChunk_526170
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_524490_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_524490_001120
    mapNode_525610_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_526731 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/526731-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_527291 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/527291-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_526731_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_526731
    mapChunk_527291
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_527852 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/527852-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_528412 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/528412-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_527852_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_527852
    mapChunk_528412
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_526731_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_526731_001121
    mapNode_527852_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_524490_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_524490_002241
    mapNode_526731_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_520007_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_520007_004483
    mapNode_524490_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_528973 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/528973-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_529533 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/529533-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_528973_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_528973
    mapChunk_529533
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_530093 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/530093-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_530653 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/530653-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_530093_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_530093
    mapChunk_530653
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_528973_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_528973_001120
    mapNode_530093_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_531214 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/531214-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_531774 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/531774-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_531214_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_531214
    mapChunk_531774
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_532335 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/532335-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_532895 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/532895-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_532335_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_532335
    mapChunk_532895
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_531214_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_531214_001121
    mapNode_532335_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_528973_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_528973_002241
    mapNode_531214_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_533456 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/533456-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_534016 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/534016-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_533456_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_533456
    mapChunk_534016
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_534576 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/534576-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_535136 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/535136-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_534576_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_534576
    mapChunk_535136
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_533456_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_533456_001120
    mapNode_534576_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_535697 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/535697-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_536257 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/536257-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_535697_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_535697
    mapChunk_536257
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_536818 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/536818-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_537378 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/537378-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_536818_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_536818
    mapChunk_537378
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_535697_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_535697_001121
    mapNode_536818_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_533456_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_533456_002241
    mapNode_535697_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_528973_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_528973_004483
    mapNode_533456_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_520007_017932 :
    Balanced.RowTree Nat :=
  .branch 8966
    mapNode_520007_008966
    mapNode_528973_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_502076_035863 :
    Balanced.RowTree Nat :=
  .branch 17931
    mapNode_502076_017931
    mapNode_520007_017932
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_537939 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/537939-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_538499 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/538499-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_537939_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_537939
    mapChunk_538499
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_539059 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/539059-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_539619 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/539619-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_539059_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_539059
    mapChunk_539619
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_537939_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_537939_001120
    mapNode_539059_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_540180 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/540180-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_540740 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/540740-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_540180_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_540180
    mapChunk_540740
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_541300 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/541300-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_541860 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/541860-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_541300_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_541300
    mapChunk_541860
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_540180_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_540180_001120
    mapNode_541300_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_537939_004482 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_537939_002241
    mapNode_540180_002241
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_542421 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/542421-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_542981 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/542981-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_542421_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_542421
    mapChunk_542981
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_543541 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/543541-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_544101 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/544101-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_543541_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_543541
    mapChunk_544101
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_542421_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_542421_001120
    mapNode_543541_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_544662 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/544662-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_545222 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/545222-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_544662_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_544662
    mapChunk_545222
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_545783 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/545783-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_546343 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/546343-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_545783_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_545783
    mapChunk_546343
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_544662_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_544662_001121
    mapNode_545783_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_542421_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_542421_002241
    mapNode_544662_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_537939_008965 :
    Balanced.RowTree Nat :=
  .branch 4482
    mapNode_537939_004482
    mapNode_542421_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_546904 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/546904-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_547464 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/547464-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_546904_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_546904
    mapChunk_547464
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_548024 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/548024-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_548584 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/548584-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_548024_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_548024
    mapChunk_548584
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_546904_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_546904_001120
    mapNode_548024_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_549145 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/549145-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_549705 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/549705-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_549145_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_549145
    mapChunk_549705
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_550266 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/550266-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_550826 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/550826-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_550266_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_550266
    mapChunk_550826
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_549145_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_549145_001121
    mapNode_550266_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_546904_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_546904_002241
    mapNode_549145_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_551387 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/551387-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_551947 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/551947-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_551387_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_551387
    mapChunk_551947
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_552507 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/552507-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_553067 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/553067-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_552507_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_552507
    mapChunk_553067
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_551387_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_551387_001120
    mapNode_552507_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_553628 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/553628-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_554188 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/554188-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_553628_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_553628
    mapChunk_554188
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_554749 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/554749-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_555309 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/555309-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_554749_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_554749
    mapChunk_555309
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_553628_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_553628_001121
    mapNode_554749_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_551387_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_551387_002241
    mapNode_553628_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_546904_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_546904_004483
    mapNode_551387_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_537939_017931 :
    Balanced.RowTree Nat :=
  .branch 8965
    mapNode_537939_008965
    mapNode_546904_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_555870 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/555870-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_556430 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/556430-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_555870_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_555870
    mapChunk_556430
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_556990 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/556990-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_557550 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/557550-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_556990_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_556990
    mapChunk_557550
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_555870_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_555870_001120
    mapNode_556990_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_558111 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/558111-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_558671 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/558671-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_558111_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_558111
    mapChunk_558671
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_559232 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/559232-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_559792 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/559792-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_559232_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_559232
    mapChunk_559792
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_558111_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_558111_001121
    mapNode_559232_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_555870_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_555870_002241
    mapNode_558111_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_560353 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/560353-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_560913 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/560913-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_560353_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_560353
    mapChunk_560913
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_561473 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/561473-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_562033 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/562033-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_561473_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_561473
    mapChunk_562033
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_560353_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_560353_001120
    mapNode_561473_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_562594 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/562594-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_563154 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/563154-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_562594_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_562594
    mapChunk_563154
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_563715 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/563715-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_564275 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/564275-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_563715_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_563715
    mapChunk_564275
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_562594_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_562594_001121
    mapNode_563715_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_560353_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_560353_002241
    mapNode_562594_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_555870_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_555870_004483
    mapNode_560353_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_564836 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/564836-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_565396 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/565396-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_564836_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_564836
    mapChunk_565396
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_565956 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/565956-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_566516 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/566516-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_565956_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_565956
    mapChunk_566516
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_564836_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_564836_001120
    mapNode_565956_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_567077 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/567077-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_567637 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/567637-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_567077_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_567077
    mapChunk_567637
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_568198 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/568198-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_568758 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/568758-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_568198_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_568198
    mapChunk_568758
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_567077_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_567077_001121
    mapNode_568198_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_564836_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_564836_002241
    mapNode_567077_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_569319 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/569319-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_569879 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/569879-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_569319_001120 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_569319
    mapChunk_569879
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_570439 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/570439-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_570999 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/570999-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_570439_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_570439
    mapChunk_570999
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_569319_002241 :
    Balanced.RowTree Nat :=
  .branch 1120
    mapNode_569319_001120
    mapNode_570439_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_571560 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/571560-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_572120 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/572120-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_571560_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_571560
    mapChunk_572120
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_572681 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/572681-0560.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapChunk_573241 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/map-chunks/573241-0561.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_572681_001121 :
    Balanced.RowTree Nat :=
  .branch 560
    mapChunk_572681
    mapChunk_573241
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_571560_002242 :
    Balanced.RowTree Nat :=
  .branch 1121
    mapNode_571560_001121
    mapNode_572681_001121
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_569319_004483 :
    Balanced.RowTree Nat :=
  .branch 2241
    mapNode_569319_002241
    mapNode_571560_002242
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_564836_008966 :
    Balanced.RowTree Nat :=
  .branch 4483
    mapNode_564836_004483
    mapNode_569319_004483
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_555870_017932 :
    Balanced.RowTree Nat :=
  .branch 8966
    mapNode_555870_008966
    mapNode_564836_008966
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_537939_035863 :
    Balanced.RowTree Nat :=
  .branch 17931
    mapNode_537939_017931
    mapNode_555870_017932
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_502076_071726 :
    Balanced.RowTree Nat :=
  .branch 35863
    mapNode_502076_035863
    mapNode_537939_035863
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_430351_143451 :
    Balanced.RowTree Nat :=
  .branch 71725
    mapNode_430351_071725
    mapNode_502076_071726
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_286901_286901 :
    Balanced.RowTree Nat :=
  .branch 143450
    mapNode_286901_143450
    mapNode_430351_143451
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapNode_000000_573802 :
    Balanced.RowTree Nat :=
  .branch 286901
    mapNode_000000_286901
    mapNode_286901_286901
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def mapTree :
    Balanced.RowTree Nat :=
  mapNode_000000_573802

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Complete body class map loaded"
