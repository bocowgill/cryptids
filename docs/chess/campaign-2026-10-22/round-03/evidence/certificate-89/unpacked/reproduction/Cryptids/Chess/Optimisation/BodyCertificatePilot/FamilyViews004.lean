module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.FamilyViews004Data
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.WorkingViews
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.FamilyReturns

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace Family444MainPilot
theorem checked_33561_167 : validate cache_33561_167 33561 =
    some 33728 := by
  decide +kernel
theorem checked_33728_168 : validate cache_33728_168 33728 =
    some 33896 := by
  decide +kernel
theorem checked_33561_335 : validate cache_33561_335 33561 =
    some 33896 := by
  exact validate_branch 167 cache_33561_167 cache_33728_168
    33561 33728 33896
    checked_33561_167 rfl checked_33728_168
theorem checked_33896_167 : validate cache_33896_167 33896 =
    some 34063 := by
  decide +kernel
theorem checked_34063_168 : validate cache_34063_168 34063 =
    some 34231 := by
  decide +kernel
theorem checked_33896_335 : validate cache_33896_335 33896 =
    some 34231 := by
  exact validate_branch 167 cache_33896_167 cache_34063_168
    33896 34063 34231
    checked_33896_167 rfl checked_34063_168
theorem checked_33561_670 : validate cache_33561_670 33561 =
    some 34231 := by
  exact validate_branch 335 cache_33561_335 cache_33896_335
    33561 33896 34231
    checked_33561_335 rfl checked_33896_335
theorem checked : validate cache 33561 = some 34231 :=
  checked_33561_670
end Family444MainPilot
open LookupCachePilot
namespace Family445MainPilot
theorem checked_34231_167 : validate cache_34231_167 34231 =
    some 34398 := by
  decide +kernel
theorem checked_34398_168 : validate cache_34398_168 34398 =
    some 34566 := by
  decide +kernel
theorem checked_34231_335 : validate cache_34231_335 34231 =
    some 34566 := by
  exact validate_branch 167 cache_34231_167 cache_34398_168
    34231 34398 34566
    checked_34231_167 rfl checked_34398_168
theorem checked_34566_167 : validate cache_34566_167 34566 =
    some 34733 := by
  decide +kernel
theorem checked_34733_168 : validate cache_34733_168 34733 =
    some 34901 := by
  decide +kernel
theorem checked_34566_335 : validate cache_34566_335 34566 =
    some 34901 := by
  exact validate_branch 167 cache_34566_167 cache_34733_168
    34566 34733 34901
    checked_34566_167 rfl checked_34733_168
theorem checked_34231_670 : validate cache_34231_670 34231 =
    some 34901 := by
  exact validate_branch 335 cache_34231_335 cache_34566_335
    34231 34566 34901
    checked_34231_335 rfl checked_34566_335
theorem checked : validate cache 34231 = some 34901 :=
  checked_34231_670
end Family445MainPilot
open LookupCachePilot
namespace Family446MainPilot
theorem checked_34901_5 : validate cache_34901_5 34901 =
    some 34906 := by
  decide +kernel
theorem checked : validate cache 34901 = some 34906 :=
  checked_34901_5
end Family446MainPilot
open LookupCachePilot
namespace Family447MainPilot
theorem checked_34906_70 : validate cache_34906_70 34906 =
    some 34976 := by
  decide +kernel
theorem checked : validate cache 34906 = some 34976 :=
  checked_34906_70
end Family447MainPilot
open LookupCachePilot
namespace Family448MainPilot
theorem checked_34976_167 : validate cache_34976_167 34976 =
    some 35143 := by
  decide +kernel
theorem checked_35143_168 : validate cache_35143_168 35143 =
    some 35311 := by
  decide +kernel
theorem checked_34976_335 : validate cache_34976_335 34976 =
    some 35311 := by
  exact validate_branch 167 cache_34976_167 cache_35143_168
    34976 35143 35311
    checked_34976_167 rfl checked_35143_168
theorem checked_35311_167 : validate cache_35311_167 35311 =
    some 35478 := by
  decide +kernel
theorem checked_35478_168 : validate cache_35478_168 35478 =
    some 35646 := by
  decide +kernel
theorem checked_35311_335 : validate cache_35311_335 35311 =
    some 35646 := by
  exact validate_branch 167 cache_35311_167 cache_35478_168
    35311 35478 35646
    checked_35311_167 rfl checked_35478_168
theorem checked_34976_670 : validate cache_34976_670 34976 =
    some 35646 := by
  exact validate_branch 335 cache_34976_335 cache_35311_335
    34976 35311 35646
    checked_34976_335 rfl checked_35311_335
theorem checked : validate cache 34976 = some 35646 :=
  checked_34976_670
end Family448MainPilot
open LookupCachePilot
namespace Family449MainPilot
theorem checked_35646_5 : validate cache_35646_5 35646 =
    some 35651 := by
  decide +kernel
theorem checked : validate cache 35646 = some 35651 :=
  checked_35646_5
end Family449MainPilot
open LookupCachePilot
namespace Family450MainPilot
theorem checked_35651_10 : validate cache_35651_10 35651 =
    some 35661 := by
  decide +kernel
theorem checked : validate cache 35651 = some 35661 :=
  checked_35651_10
end Family450MainPilot
open LookupCachePilot
namespace Family451MainPilot
theorem checked_35661_185 : validate cache_35661_185 35661 =
    some 35846 := by
  decide +kernel
theorem checked_35846_185 : validate cache_35846_185 35846 =
    some 36031 := by
  decide +kernel
theorem checked_35661_370 : validate cache_35661_370 35661 =
    some 36031 := by
  exact validate_branch 185 cache_35661_185 cache_35846_185
    35661 35846 36031
    checked_35661_185 rfl checked_35846_185
theorem checked : validate cache 35661 = some 36031 :=
  checked_35661_370
end Family451MainPilot
open LookupCachePilot
namespace Family452MainPilot
theorem checked_36031_220 : validate cache_36031_220 36031 =
    some 36251 := by
  decide +kernel
theorem checked_36251_220 : validate cache_36251_220 36251 =
    some 36471 := by
  decide +kernel
theorem checked_36031_440 : validate cache_36031_440 36031 =
    some 36471 := by
  exact validate_branch 220 cache_36031_220 cache_36251_220
    36031 36251 36471
    checked_36031_220 rfl checked_36251_220
theorem checked : validate cache 36031 = some 36471 :=
  checked_36031_440
end Family452MainPilot
open LookupCachePilot
namespace Family453MainPilot
theorem checked_36471_70 : validate cache_36471_70 36471 =
    some 36541 := by
  decide +kernel
theorem checked : validate cache 36471 = some 36541 :=
  checked_36471_70
end Family453MainPilot
open LookupCachePilot
namespace Family454MainPilot
theorem checked_36541_195 : validate cache_36541_195 36541 =
    some 36736 := by
  decide +kernel
theorem checked : validate cache 36541 = some 36736 :=
  checked_36541_195
end Family454MainPilot
open LookupCachePilot
namespace Family455MainPilot
theorem checked_36736_70 : validate cache_36736_70 36736 =
    some 36806 := by
  decide +kernel
theorem checked : validate cache 36736 = some 36806 :=
  checked_36736_70
end Family455MainPilot
open LookupCachePilot
namespace Family456MainPilot
theorem checked_36806_200 : validate cache_36806_200 36806 =
    some 37006 := by
  decide +kernel
theorem checked_37006_200 : validate cache_37006_200 37006 =
    some 37206 := by
  decide +kernel
theorem checked_36806_400 : validate cache_36806_400 36806 =
    some 37206 := by
  exact validate_branch 200 cache_36806_200 cache_37006_200
    36806 37006 37206
    checked_36806_200 rfl checked_37006_200
theorem checked : validate cache 36806 = some 37206 :=
  checked_36806_400
end Family456MainPilot
open LookupCachePilot
namespace Family457MainPilot
theorem checked_37206_5 : validate cache_37206_5 37206 =
    some 37211 := by
  decide +kernel
theorem checked : validate cache 37206 = some 37211 :=
  checked_37206_5
end Family457MainPilot
open LookupCachePilot
namespace Family458MainPilot
theorem checked_37211_70 : validate cache_37211_70 37211 =
    some 37281 := by
  decide +kernel
theorem checked : validate cache 37211 = some 37281 :=
  checked_37211_70
end Family458MainPilot
open LookupCachePilot
namespace Family459MainPilot
theorem checked_37281_185 : validate cache_37281_185 37281 =
    some 37466 := by
  decide +kernel
theorem checked_37466_185 : validate cache_37466_185 37466 =
    some 37651 := by
  decide +kernel
theorem checked_37281_370 : validate cache_37281_370 37281 =
    some 37651 := by
  exact validate_branch 185 cache_37281_185 cache_37466_185
    37281 37466 37651
    checked_37281_185 rfl checked_37466_185
theorem checked : validate cache 37281 = some 37651 :=
  checked_37281_370
end Family459MainPilot
open LookupCachePilot
namespace Family460MainPilot
theorem checked_37651_5 : validate cache_37651_5 37651 =
    some 37656 := by
  decide +kernel
theorem checked : validate cache 37651 = some 37656 :=
  checked_37651_5
end Family460MainPilot
open LookupCachePilot
namespace Family461MainPilot
theorem checked_37656_70 : validate cache_37656_70 37656 =
    some 37726 := by
  decide +kernel
theorem checked : validate cache 37656 = some 37726 :=
  checked_37656_70
end Family461MainPilot
open LookupCachePilot
namespace Family462MainPilot
theorem checked_37726_200 : validate cache_37726_200 37726 =
    some 37926 := by
  decide +kernel
theorem checked_37926_200 : validate cache_37926_200 37926 =
    some 38126 := by
  decide +kernel
theorem checked_37726_400 : validate cache_37726_400 37726 =
    some 38126 := by
  exact validate_branch 200 cache_37726_200 cache_37926_200
    37726 37926 38126
    checked_37726_200 rfl checked_37926_200
theorem checked : validate cache 37726 = some 38126 :=
  checked_37726_400
end Family462MainPilot
open LookupCachePilot
namespace Family463MainPilot
theorem checked_38126_5 : validate cache_38126_5 38126 =
    some 38131 := by
  decide +kernel
theorem checked : validate cache 38126 = some 38131 :=
  checked_38126_5
end Family463MainPilot
open LookupCachePilot
namespace Family464MainPilot
theorem checked_38131_10 : validate cache_38131_10 38131 =
    some 38141 := by
  decide +kernel
theorem checked : validate cache 38131 = some 38141 :=
  checked_38131_10
end Family464MainPilot
open LookupCachePilot
namespace Family465MainPilot
theorem checked_38141_130 : validate cache_38141_130 38141 =
    some 38271 := by
  decide +kernel
theorem checked_38271_130 : validate cache_38271_130 38271 =
    some 38401 := by
  decide +kernel
theorem checked_38141_260 : validate cache_38141_260 38141 =
    some 38401 := by
  exact validate_branch 130 cache_38141_130 cache_38271_130
    38141 38271 38401
    checked_38141_130 rfl checked_38271_130
theorem checked_38401_130 : validate cache_38401_130 38401 =
    some 38531 := by
  decide +kernel
theorem checked_38531_130 : validate cache_38531_130 38531 =
    some 38661 := by
  decide +kernel
theorem checked_38401_260 : validate cache_38401_260 38401 =
    some 38661 := by
  exact validate_branch 130 cache_38401_130 cache_38531_130
    38401 38531 38661
    checked_38401_130 rfl checked_38531_130
theorem checked_38141_520 : validate cache_38141_520 38141 =
    some 38661 := by
  exact validate_branch 260 cache_38141_260 cache_38401_260
    38141 38401 38661
    checked_38141_260 rfl checked_38401_260
theorem checked : validate cache 38141 = some 38661 :=
  checked_38141_520
end Family465MainPilot
open LookupCachePilot
namespace Family466MainPilot
theorem checked_38661_143 : validate cache_38661_143 38661 =
    some 38804 := by
  decide +kernel
theorem checked_38804_144 : validate cache_38804_144 38804 =
    some 38948 := by
  decide +kernel
theorem checked_38661_287 : validate cache_38661_287 38661 =
    some 38948 := by
  exact validate_branch 143 cache_38661_143 cache_38804_144
    38661 38804 38948
    checked_38661_143 rfl checked_38804_144
theorem checked_38948_144 : validate cache_38948_144 38948 =
    some 39092 := by
  decide +kernel
theorem checked_39092_144 : validate cache_39092_144 39092 =
    some 39236 := by
  decide +kernel
theorem checked_38948_288 : validate cache_38948_288 38948 =
    some 39236 := by
  exact validate_branch 144 cache_38948_144 cache_39092_144
    38948 39092 39236
    checked_38948_144 rfl checked_39092_144
theorem checked_38661_575 : validate cache_38661_575 38661 =
    some 39236 := by
  exact validate_branch 287 cache_38661_287 cache_38948_288
    38661 38948 39236
    checked_38661_287 rfl checked_38948_288
theorem checked : validate cache 38661 = some 39236 :=
  checked_38661_575
end Family466MainPilot
open LookupCachePilot
namespace Family467MainPilot
theorem checked_39236_70 : validate cache_39236_70 39236 =
    some 39306 := by
  decide +kernel
theorem checked : validate cache 39236 = some 39306 :=
  checked_39236_70
end Family467MainPilot
open LookupCachePilot
namespace Family468MainPilot
theorem checked_39306_195 : validate cache_39306_195 39306 =
    some 39501 := by
  decide +kernel
theorem checked : validate cache 39306 = some 39501 :=
  checked_39306_195
end Family468MainPilot
open LookupCachePilot
namespace Family469MainPilot
theorem checked_39501_70 : validate cache_39501_70 39501 =
    some 39571 := by
  decide +kernel
theorem checked : validate cache 39501 = some 39571 :=
  checked_39501_70
end Family469MainPilot
open LookupCachePilot
namespace Family470MainPilot
theorem checked_39571_133 : validate cache_39571_133 39571 =
    some 39704 := by
  decide +kernel
theorem checked_39704_134 : validate cache_39704_134 39704 =
    some 39838 := by
  decide +kernel
theorem checked_39571_267 : validate cache_39571_267 39571 =
    some 39838 := by
  exact validate_branch 133 cache_39571_133 cache_39704_134
    39571 39704 39838
    checked_39571_133 rfl checked_39704_134
theorem checked_39838_134 : validate cache_39838_134 39838 =
    some 39972 := by
  decide +kernel
theorem checked_39972_134 : validate cache_39972_134 39972 =
    some 40106 := by
  decide +kernel
theorem checked_39838_268 : validate cache_39838_268 39838 =
    some 40106 := by
  exact validate_branch 134 cache_39838_134 cache_39972_134
    39838 39972 40106
    checked_39838_134 rfl checked_39972_134
theorem checked_39571_535 : validate cache_39571_535 39571 =
    some 40106 := by
  exact validate_branch 267 cache_39571_267 cache_39838_268
    39571 39838 40106
    checked_39571_267 rfl checked_39838_268
theorem checked : validate cache 39571 = some 40106 :=
  checked_39571_535
end Family470MainPilot
open LookupCachePilot
namespace Family471MainPilot
theorem checked_40106_5 : validate cache_40106_5 40106 =
    some 40111 := by
  decide +kernel
theorem checked : validate cache 40106 = some 40111 :=
  checked_40106_5
end Family471MainPilot
open LookupCachePilot
namespace Family472MainPilot
theorem checked_40111_70 : validate cache_40111_70 40111 =
    some 40181 := by
  decide +kernel
theorem checked : validate cache 40111 = some 40181 :=
  checked_40111_70
end Family472MainPilot
open LookupCachePilot
namespace Family473MainPilot
theorem checked_40181_167 : validate cache_40181_167 40181 =
    some 40348 := by
  decide +kernel
theorem checked_40348_168 : validate cache_40348_168 40348 =
    some 40516 := by
  decide +kernel
theorem checked_40181_335 : validate cache_40181_335 40181 =
    some 40516 := by
  exact validate_branch 167 cache_40181_167 cache_40348_168
    40181 40348 40516
    checked_40181_167 rfl checked_40348_168
theorem checked_40516_167 : validate cache_40516_167 40516 =
    some 40683 := by
  decide +kernel
theorem checked_40683_168 : validate cache_40683_168 40683 =
    some 40851 := by
  decide +kernel
theorem checked_40516_335 : validate cache_40516_335 40516 =
    some 40851 := by
  exact validate_branch 167 cache_40516_167 cache_40683_168
    40516 40683 40851
    checked_40516_167 rfl checked_40683_168
theorem checked_40181_670 : validate cache_40181_670 40181 =
    some 40851 := by
  exact validate_branch 335 cache_40181_335 cache_40516_335
    40181 40516 40851
    checked_40181_335 rfl checked_40516_335
theorem checked : validate cache 40181 = some 40851 :=
  checked_40181_670
end Family473MainPilot
open LookupCachePilot
namespace Family474MainPilot
theorem checked_40851_70 : validate cache_40851_70 40851 =
    some 40921 := by
  decide +kernel
theorem checked : validate cache 40851 = some 40921 :=
  checked_40851_70
end Family474MainPilot
open LookupCachePilot
namespace Family475MainPilot
theorem checked_40921_167 : validate cache_40921_167 40921 =
    some 41088 := by
  decide +kernel
theorem checked_41088_168 : validate cache_41088_168 41088 =
    some 41256 := by
  decide +kernel
theorem checked_40921_335 : validate cache_40921_335 40921 =
    some 41256 := by
  exact validate_branch 167 cache_40921_167 cache_41088_168
    40921 41088 41256
    checked_40921_167 rfl checked_41088_168
theorem checked_41256_167 : validate cache_41256_167 41256 =
    some 41423 := by
  decide +kernel
theorem checked_41423_168 : validate cache_41423_168 41423 =
    some 41591 := by
  decide +kernel
theorem checked_41256_335 : validate cache_41256_335 41256 =
    some 41591 := by
  exact validate_branch 167 cache_41256_167 cache_41423_168
    41256 41423 41591
    checked_41256_167 rfl checked_41423_168
theorem checked_40921_670 : validate cache_40921_670 40921 =
    some 41591 := by
  exact validate_branch 335 cache_40921_335 cache_41256_335
    40921 41256 41591
    checked_40921_335 rfl checked_41256_335
theorem checked : validate cache 40921 = some 41591 :=
  checked_40921_670
end Family475MainPilot
open LookupCachePilot
namespace Family476MainPilot
theorem checked_41591_167 : validate cache_41591_167 41591 =
    some 41758 := by
  decide +kernel
theorem checked_41758_168 : validate cache_41758_168 41758 =
    some 41926 := by
  decide +kernel
theorem checked_41591_335 : validate cache_41591_335 41591 =
    some 41926 := by
  exact validate_branch 167 cache_41591_167 cache_41758_168
    41591 41758 41926
    checked_41591_167 rfl checked_41758_168
theorem checked_41926_167 : validate cache_41926_167 41926 =
    some 42093 := by
  decide +kernel
theorem checked_42093_168 : validate cache_42093_168 42093 =
    some 42261 := by
  decide +kernel
theorem checked_41926_335 : validate cache_41926_335 41926 =
    some 42261 := by
  exact validate_branch 167 cache_41926_167 cache_42093_168
    41926 42093 42261
    checked_41926_167 rfl checked_42093_168
theorem checked_41591_670 : validate cache_41591_670 41591 =
    some 42261 := by
  exact validate_branch 335 cache_41591_335 cache_41926_335
    41591 41926 42261
    checked_41591_335 rfl checked_41926_335
theorem checked : validate cache 41591 = some 42261 :=
  checked_41591_670
end Family476MainPilot
open LookupCachePilot
namespace Family477MainPilot
theorem checked_42261_5 : validate cache_42261_5 42261 =
    some 42266 := by
  decide +kernel
theorem checked : validate cache 42261 = some 42266 :=
  checked_42261_5
end Family477MainPilot
open LookupCachePilot
namespace Family478MainPilot
theorem checked_42266_70 : validate cache_42266_70 42266 =
    some 42336 := by
  decide +kernel
theorem checked : validate cache 42266 = some 42336 :=
  checked_42266_70
end Family478MainPilot
open LookupCachePilot
namespace Family479MainPilot
theorem checked_42336_167 : validate cache_42336_167 42336 =
    some 42503 := by
  decide +kernel
theorem checked_42503_168 : validate cache_42503_168 42503 =
    some 42671 := by
  decide +kernel
theorem checked_42336_335 : validate cache_42336_335 42336 =
    some 42671 := by
  exact validate_branch 167 cache_42336_167 cache_42503_168
    42336 42503 42671
    checked_42336_167 rfl checked_42503_168
theorem checked_42671_167 : validate cache_42671_167 42671 =
    some 42838 := by
  decide +kernel
theorem checked_42838_168 : validate cache_42838_168 42838 =
    some 43006 := by
  decide +kernel
theorem checked_42671_335 : validate cache_42671_335 42671 =
    some 43006 := by
  exact validate_branch 167 cache_42671_167 cache_42838_168
    42671 42838 43006
    checked_42671_167 rfl checked_42838_168
theorem checked_42336_670 : validate cache_42336_670 42336 =
    some 43006 := by
  exact validate_branch 335 cache_42336_335 cache_42671_335
    42336 42671 43006
    checked_42336_335 rfl checked_42671_335
theorem checked : validate cache 42336 = some 43006 :=
  checked_42336_670
end Family479MainPilot
open LookupCachePilot
namespace Family480MainPilot
theorem checked_43006_5 : validate cache_43006_5 43006 =
    some 43011 := by
  decide +kernel
theorem checked : validate cache 43006 = some 43011 :=
  checked_43006_5
end Family480MainPilot
open LookupCachePilot
namespace Family481MainPilot
theorem checked_43011_10 : validate cache_43011_10 43011 =
    some 43021 := by
  decide +kernel
theorem checked : validate cache 43011 = some 43021 :=
  checked_43011_10
end Family481MainPilot
open LookupCachePilot
namespace Family482MainPilot
theorem checked_43021_185 : validate cache_43021_185 43021 =
    some 43206 := by
  decide +kernel
theorem checked_43206_185 : validate cache_43206_185 43206 =
    some 43391 := by
  decide +kernel
theorem checked_43021_370 : validate cache_43021_370 43021 =
    some 43391 := by
  exact validate_branch 185 cache_43021_185 cache_43206_185
    43021 43206 43391
    checked_43021_185 rfl checked_43206_185
theorem checked : validate cache 43021 = some 43391 :=
  checked_43021_370
end Family482MainPilot
open LookupCachePilot
namespace Family483MainPilot
theorem checked_43391_220 : validate cache_43391_220 43391 =
    some 43611 := by
  decide +kernel
theorem checked_43611_220 : validate cache_43611_220 43611 =
    some 43831 := by
  decide +kernel
theorem checked_43391_440 : validate cache_43391_440 43391 =
    some 43831 := by
  exact validate_branch 220 cache_43391_220 cache_43611_220
    43391 43611 43831
    checked_43391_220 rfl checked_43611_220
theorem checked : validate cache 43391 = some 43831 :=
  checked_43391_440
end Family483MainPilot
open LookupCachePilot
namespace Family484MainPilot
theorem checked_43831_70 : validate cache_43831_70 43831 =
    some 43901 := by
  decide +kernel
theorem checked : validate cache 43831 = some 43901 :=
  checked_43831_70
end Family484MainPilot
open LookupCachePilot
namespace Family485MainPilot
theorem checked_43901_195 : validate cache_43901_195 43901 =
    some 44096 := by
  decide +kernel
theorem checked : validate cache 43901 = some 44096 :=
  checked_43901_195
end Family485MainPilot
open LookupCachePilot
namespace Family486MainPilot
theorem checked_44096_70 : validate cache_44096_70 44096 =
    some 44166 := by
  decide +kernel
theorem checked : validate cache 44096 = some 44166 :=
  checked_44096_70
end Family486MainPilot
open LookupCachePilot
namespace Family487MainPilot
theorem checked_44166_200 : validate cache_44166_200 44166 =
    some 44366 := by
  decide +kernel
theorem checked_44366_200 : validate cache_44366_200 44366 =
    some 44566 := by
  decide +kernel
theorem checked_44166_400 : validate cache_44166_400 44166 =
    some 44566 := by
  exact validate_branch 200 cache_44166_200 cache_44366_200
    44166 44366 44566
    checked_44166_200 rfl checked_44366_200
theorem checked : validate cache 44166 = some 44566 :=
  checked_44166_400
end Family487MainPilot
open LookupCachePilot
namespace Family488MainPilot
theorem checked_44566_5 : validate cache_44566_5 44566 =
    some 44571 := by
  decide +kernel
theorem checked : validate cache 44566 = some 44571 :=
  checked_44566_5
end Family488MainPilot
open LookupCachePilot
namespace Family489MainPilot
theorem checked_44571_70 : validate cache_44571_70 44571 =
    some 44641 := by
  decide +kernel
theorem checked : validate cache 44571 = some 44641 :=
  checked_44571_70
end Family489MainPilot
open LookupCachePilot
namespace Family490MainPilot
theorem checked_44641_185 : validate cache_44641_185 44641 =
    some 44826 := by
  decide +kernel
theorem checked_44826_185 : validate cache_44826_185 44826 =
    some 45011 := by
  decide +kernel
theorem checked_44641_370 : validate cache_44641_370 44641 =
    some 45011 := by
  exact validate_branch 185 cache_44641_185 cache_44826_185
    44641 44826 45011
    checked_44641_185 rfl checked_44826_185
theorem checked : validate cache 44641 = some 45011 :=
  checked_44641_370
end Family490MainPilot
open LookupCachePilot
namespace Family491MainPilot
theorem checked_45011_5 : validate cache_45011_5 45011 =
    some 45016 := by
  decide +kernel
theorem checked : validate cache 45011 = some 45016 :=
  checked_45011_5
end Family491MainPilot
open LookupCachePilot
namespace Family492MainPilot
theorem checked_45016_70 : validate cache_45016_70 45016 =
    some 45086 := by
  decide +kernel
theorem checked : validate cache 45016 = some 45086 :=
  checked_45016_70
end Family492MainPilot
open LookupCachePilot
namespace Family493MainPilot
theorem checked_45086_200 : validate cache_45086_200 45086 =
    some 45286 := by
  decide +kernel
theorem checked_45286_200 : validate cache_45286_200 45286 =
    some 45486 := by
  decide +kernel
theorem checked_45086_400 : validate cache_45086_400 45086 =
    some 45486 := by
  exact validate_branch 200 cache_45086_200 cache_45286_200
    45086 45286 45486
    checked_45086_200 rfl checked_45286_200
theorem checked : validate cache 45086 = some 45486 :=
  checked_45086_400
end Family493MainPilot
open LookupCachePilot
namespace Family494MainPilot
theorem checked_45486_5 : validate cache_45486_5 45486 =
    some 45491 := by
  decide +kernel
theorem checked : validate cache 45486 = some 45491 :=
  checked_45486_5
end Family494MainPilot
open LookupCachePilot
namespace Family495MainPilot
theorem checked_45491_10 : validate cache_45491_10 45491 =
    some 45501 := by
  decide +kernel
theorem checked : validate cache 45491 = some 45501 :=
  checked_45491_10
end Family495MainPilot
open LookupCachePilot
namespace Family496MainPilot
theorem checked_45501_130 : validate cache_45501_130 45501 =
    some 45631 := by
  decide +kernel
theorem checked_45631_130 : validate cache_45631_130 45631 =
    some 45761 := by
  decide +kernel
theorem checked_45501_260 : validate cache_45501_260 45501 =
    some 45761 := by
  exact validate_branch 130 cache_45501_130 cache_45631_130
    45501 45631 45761
    checked_45501_130 rfl checked_45631_130
theorem checked_45761_130 : validate cache_45761_130 45761 =
    some 45891 := by
  decide +kernel
theorem checked_45891_130 : validate cache_45891_130 45891 =
    some 46021 := by
  decide +kernel
theorem checked_45761_260 : validate cache_45761_260 45761 =
    some 46021 := by
  exact validate_branch 130 cache_45761_130 cache_45891_130
    45761 45891 46021
    checked_45761_130 rfl checked_45891_130
theorem checked_45501_520 : validate cache_45501_520 45501 =
    some 46021 := by
  exact validate_branch 260 cache_45501_260 cache_45761_260
    45501 45761 46021
    checked_45501_260 rfl checked_45761_260
theorem checked : validate cache 45501 = some 46021 :=
  checked_45501_520
end Family496MainPilot
open LookupCachePilot
namespace Family497MainPilot
theorem checked_46021_143 : validate cache_46021_143 46021 =
    some 46164 := by
  decide +kernel
theorem checked_46164_144 : validate cache_46164_144 46164 =
    some 46308 := by
  decide +kernel
theorem checked_46021_287 : validate cache_46021_287 46021 =
    some 46308 := by
  exact validate_branch 143 cache_46021_143 cache_46164_144
    46021 46164 46308
    checked_46021_143 rfl checked_46164_144
theorem checked_46308_144 : validate cache_46308_144 46308 =
    some 46452 := by
  decide +kernel
theorem checked_46452_144 : validate cache_46452_144 46452 =
    some 46596 := by
  decide +kernel
theorem checked_46308_288 : validate cache_46308_288 46308 =
    some 46596 := by
  exact validate_branch 144 cache_46308_144 cache_46452_144
    46308 46452 46596
    checked_46308_144 rfl checked_46452_144
theorem checked_46021_575 : validate cache_46021_575 46021 =
    some 46596 := by
  exact validate_branch 287 cache_46021_287 cache_46308_288
    46021 46308 46596
    checked_46021_287 rfl checked_46308_288
theorem checked : validate cache 46021 = some 46596 :=
  checked_46021_575
end Family497MainPilot
open LookupCachePilot
namespace Family498MainPilot
theorem checked_46596_70 : validate cache_46596_70 46596 =
    some 46666 := by
  decide +kernel
theorem checked : validate cache 46596 = some 46666 :=
  checked_46596_70
end Family498MainPilot
open LookupCachePilot
namespace Family499MainPilot
theorem checked_46666_195 : validate cache_46666_195 46666 =
    some 46861 := by
  decide +kernel
theorem checked : validate cache 46666 = some 46861 :=
  checked_46666_195
end Family499MainPilot
open LookupCachePilot
namespace Family500MainPilot
theorem checked_46861_70 : validate cache_46861_70 46861 =
    some 46931 := by
  decide +kernel
theorem checked : validate cache 46861 = some 46931 :=
  checked_46861_70
end Family500MainPilot
open LookupCachePilot
namespace Family501MainPilot
theorem checked_46931_133 : validate cache_46931_133 46931 =
    some 47064 := by
  decide +kernel
theorem checked_47064_134 : validate cache_47064_134 47064 =
    some 47198 := by
  decide +kernel
theorem checked_46931_267 : validate cache_46931_267 46931 =
    some 47198 := by
  exact validate_branch 133 cache_46931_133 cache_47064_134
    46931 47064 47198
    checked_46931_133 rfl checked_47064_134
theorem checked_47198_134 : validate cache_47198_134 47198 =
    some 47332 := by
  decide +kernel
theorem checked_47332_134 : validate cache_47332_134 47332 =
    some 47466 := by
  decide +kernel
theorem checked_47198_268 : validate cache_47198_268 47198 =
    some 47466 := by
  exact validate_branch 134 cache_47198_134 cache_47332_134
    47198 47332 47466
    checked_47198_134 rfl checked_47332_134
theorem checked_46931_535 : validate cache_46931_535 46931 =
    some 47466 := by
  exact validate_branch 267 cache_46931_267 cache_47198_268
    46931 47198 47466
    checked_46931_267 rfl checked_47198_268
theorem checked : validate cache 46931 = some 47466 :=
  checked_46931_535
end Family501MainPilot
open LookupCachePilot
namespace Family502MainPilot
theorem checked_47466_5 : validate cache_47466_5 47466 =
    some 47471 := by
  decide +kernel
theorem checked : validate cache 47466 = some 47471 :=
  checked_47466_5
end Family502MainPilot
open LookupCachePilot
namespace Family503MainPilot
theorem checked_47471_70 : validate cache_47471_70 47471 =
    some 47541 := by
  decide +kernel
theorem checked : validate cache 47471 = some 47541 :=
  checked_47471_70
end Family503MainPilot
open LookupCachePilot
namespace Family504MainPilot
theorem checked_47541_167 : validate cache_47541_167 47541 =
    some 47708 := by
  decide +kernel
theorem checked_47708_168 : validate cache_47708_168 47708 =
    some 47876 := by
  decide +kernel
theorem checked_47541_335 : validate cache_47541_335 47541 =
    some 47876 := by
  exact validate_branch 167 cache_47541_167 cache_47708_168
    47541 47708 47876
    checked_47541_167 rfl checked_47708_168
theorem checked_47876_167 : validate cache_47876_167 47876 =
    some 48043 := by
  decide +kernel
theorem checked_48043_168 : validate cache_48043_168 48043 =
    some 48211 := by
  decide +kernel
theorem checked_47876_335 : validate cache_47876_335 47876 =
    some 48211 := by
  exact validate_branch 167 cache_47876_167 cache_48043_168
    47876 48043 48211
    checked_47876_167 rfl checked_48043_168
theorem checked_47541_670 : validate cache_47541_670 47541 =
    some 48211 := by
  exact validate_branch 335 cache_47541_335 cache_47876_335
    47541 47876 48211
    checked_47541_335 rfl checked_47876_335
theorem checked : validate cache 47541 = some 48211 :=
  checked_47541_670
end Family504MainPilot
open LookupCachePilot
namespace Family505MainPilot
theorem checked_48211_70 : validate cache_48211_70 48211 =
    some 48281 := by
  decide +kernel
theorem checked : validate cache 48211 = some 48281 :=
  checked_48211_70
end Family505MainPilot
open LookupCachePilot
namespace Family506MainPilot
theorem checked_48281_167 : validate cache_48281_167 48281 =
    some 48448 := by
  decide +kernel
theorem checked_48448_168 : validate cache_48448_168 48448 =
    some 48616 := by
  decide +kernel
theorem checked_48281_335 : validate cache_48281_335 48281 =
    some 48616 := by
  exact validate_branch 167 cache_48281_167 cache_48448_168
    48281 48448 48616
    checked_48281_167 rfl checked_48448_168
theorem checked_48616_167 : validate cache_48616_167 48616 =
    some 48783 := by
  decide +kernel
theorem checked_48783_168 : validate cache_48783_168 48783 =
    some 48951 := by
  decide +kernel
theorem checked_48616_335 : validate cache_48616_335 48616 =
    some 48951 := by
  exact validate_branch 167 cache_48616_167 cache_48783_168
    48616 48783 48951
    checked_48616_167 rfl checked_48783_168
theorem checked_48281_670 : validate cache_48281_670 48281 =
    some 48951 := by
  exact validate_branch 335 cache_48281_335 cache_48616_335
    48281 48616 48951
    checked_48281_335 rfl checked_48616_335
theorem checked : validate cache 48281 = some 48951 :=
  checked_48281_670
end Family506MainPilot
open LookupCachePilot
namespace Family507MainPilot
theorem checked_48951_167 : validate cache_48951_167 48951 =
    some 49118 := by
  decide +kernel
theorem checked_49118_168 : validate cache_49118_168 49118 =
    some 49286 := by
  decide +kernel
theorem checked_48951_335 : validate cache_48951_335 48951 =
    some 49286 := by
  exact validate_branch 167 cache_48951_167 cache_49118_168
    48951 49118 49286
    checked_48951_167 rfl checked_49118_168
theorem checked_49286_167 : validate cache_49286_167 49286 =
    some 49453 := by
  decide +kernel
theorem checked_49453_168 : validate cache_49453_168 49453 =
    some 49621 := by
  decide +kernel
theorem checked_49286_335 : validate cache_49286_335 49286 =
    some 49621 := by
  exact validate_branch 167 cache_49286_167 cache_49453_168
    49286 49453 49621
    checked_49286_167 rfl checked_49453_168
theorem checked_48951_670 : validate cache_48951_670 48951 =
    some 49621 := by
  exact validate_branch 335 cache_48951_335 cache_49286_335
    48951 49286 49621
    checked_48951_335 rfl checked_49286_335
theorem checked : validate cache 48951 = some 49621 :=
  checked_48951_670
end Family507MainPilot
open LookupCachePilot
namespace Family508MainPilot
theorem checked_49621_5 : validate cache_49621_5 49621 =
    some 49626 := by
  decide +kernel
theorem checked : validate cache 49621 = some 49626 :=
  checked_49621_5
end Family508MainPilot
open LookupCachePilot
namespace Family509MainPilot
theorem checked_49626_70 : validate cache_49626_70 49626 =
    some 49696 := by
  decide +kernel
theorem checked : validate cache 49626 = some 49696 :=
  checked_49626_70
end Family509MainPilot
namespace FamilyViews004Pilot
noncomputable def windows_444 : List WorkingViewPilot.Window := [
  ⟨33561, 34231, Family444MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_444 : WorkingViewPilot.checks windows_444 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨33561, 34231, Family444MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family444MainPilot.cache 33561 =
          some 34231 ∧ 34231 ≤ 573802 from
          ⟨Family444MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_444 : ∀ w ∈ windows_444, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_444 checked_444
noncomputable def fromRaw_444 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_444) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_444 checked_444 q raw nodes returns truth
noncomputable def windows_445 : List WorkingViewPilot.Window := [
  ⟨34231, 34901, Family445MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_445 : WorkingViewPilot.checks windows_445 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨34231, 34901, Family445MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family445MainPilot.cache 34231 =
          some 34901 ∧ 34901 ≤ 573802 from
          ⟨Family445MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_445 : ∀ w ∈ windows_445, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_445 checked_445
noncomputable def fromRaw_445 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_445) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_445 checked_445 q raw nodes returns truth
noncomputable def windows_446 : List WorkingViewPilot.Window := [
  ⟨34901, 34906, Family446MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_446 : WorkingViewPilot.checks windows_446 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨34901, 34906, Family446MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family446MainPilot.cache 34901 =
          some 34906 ∧ 34906 ≤ 573802 from
          ⟨Family446MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_446 : ∀ w ∈ windows_446, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_446 checked_446
noncomputable def fromRaw_446 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_446) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_446 checked_446 q raw nodes returns truth
noncomputable def windows_447 : List WorkingViewPilot.Window := [
  ⟨34906, 34976, Family447MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_447 : WorkingViewPilot.checks windows_447 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨34906, 34976, Family447MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family447MainPilot.cache 34906 =
          some 34976 ∧ 34976 ≤ 573802 from
          ⟨Family447MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_447 : ∀ w ∈ windows_447, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_447 checked_447
noncomputable def fromRaw_447 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_447) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_447 checked_447 q raw nodes returns truth
noncomputable def windows_448 : List WorkingViewPilot.Window := [
  ⟨34976, 35646, Family448MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_448 : WorkingViewPilot.checks windows_448 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨34976, 35646, Family448MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family448MainPilot.cache 34976 =
          some 35646 ∧ 35646 ≤ 573802 from
          ⟨Family448MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_448 : ∀ w ∈ windows_448, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_448 checked_448
noncomputable def fromRaw_448 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_448) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_448 checked_448 q raw nodes returns truth
noncomputable def windows_449 : List WorkingViewPilot.Window := [
  ⟨35646, 35651, Family449MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_449 : WorkingViewPilot.checks windows_449 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨35646, 35651, Family449MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family449MainPilot.cache 35646 =
          some 35651 ∧ 35651 ≤ 573802 from
          ⟨Family449MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_449 : ∀ w ∈ windows_449, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_449 checked_449
noncomputable def fromRaw_449 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_449) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_449 checked_449 q raw nodes returns truth
noncomputable def windows_450 : List WorkingViewPilot.Window := [
  ⟨35651, 35661, Family450MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_450 : WorkingViewPilot.checks windows_450 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨35651, 35661, Family450MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family450MainPilot.cache 35651 =
          some 35661 ∧ 35661 ≤ 573802 from
          ⟨Family450MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_450 : ∀ w ∈ windows_450, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_450 checked_450
noncomputable def fromRaw_450 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_450) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_450 checked_450 q raw nodes returns truth
noncomputable def windows_451 : List WorkingViewPilot.Window := [
  ⟨35661, 36031, Family451MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_451 : WorkingViewPilot.checks windows_451 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨35661, 36031, Family451MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family451MainPilot.cache 35661 =
          some 36031 ∧ 36031 ≤ 573802 from
          ⟨Family451MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_451 : ∀ w ∈ windows_451, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_451 checked_451
noncomputable def fromRaw_451 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_451) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_451 checked_451 q raw nodes returns truth
noncomputable def windows_452 : List WorkingViewPilot.Window := [
  ⟨36031, 36471, Family452MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_452 : WorkingViewPilot.checks windows_452 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨36031, 36471, Family452MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family452MainPilot.cache 36031 =
          some 36471 ∧ 36471 ≤ 573802 from
          ⟨Family452MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_452 : ∀ w ∈ windows_452, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_452 checked_452
noncomputable def fromRaw_452 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_452) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_452 checked_452 q raw nodes returns truth
noncomputable def windows_453 : List WorkingViewPilot.Window := [
  ⟨36471, 36541, Family453MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_453 : WorkingViewPilot.checks windows_453 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨36471, 36541, Family453MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family453MainPilot.cache 36471 =
          some 36541 ∧ 36541 ≤ 573802 from
          ⟨Family453MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_453 : ∀ w ∈ windows_453, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_453 checked_453
noncomputable def fromRaw_453 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_453) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_453 checked_453 q raw nodes returns truth
noncomputable def windows_454 : List WorkingViewPilot.Window := [
  ⟨36541, 36736, Family454MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_454 : WorkingViewPilot.checks windows_454 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨36541, 36736, Family454MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family454MainPilot.cache 36541 =
          some 36736 ∧ 36736 ≤ 573802 from
          ⟨Family454MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_454 : ∀ w ∈ windows_454, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_454 checked_454
noncomputable def fromRaw_454 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_454) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_454 checked_454 q raw nodes returns truth
noncomputable def windows_455 : List WorkingViewPilot.Window := [
  ⟨36736, 36806, Family455MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_455 : WorkingViewPilot.checks windows_455 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨36736, 36806, Family455MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family455MainPilot.cache 36736 =
          some 36806 ∧ 36806 ≤ 573802 from
          ⟨Family455MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_455 : ∀ w ∈ windows_455, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_455 checked_455
noncomputable def fromRaw_455 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_455) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_455 checked_455 q raw nodes returns truth
noncomputable def windows_456 : List WorkingViewPilot.Window := [
  ⟨36806, 37206, Family456MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_456 : WorkingViewPilot.checks windows_456 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨36806, 37206, Family456MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family456MainPilot.cache 36806 =
          some 37206 ∧ 37206 ≤ 573802 from
          ⟨Family456MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_456 : ∀ w ∈ windows_456, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_456 checked_456
noncomputable def fromRaw_456 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_456) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_456 checked_456 q raw nodes returns truth
noncomputable def windows_457 : List WorkingViewPilot.Window := [
  ⟨37206, 37211, Family457MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_457 : WorkingViewPilot.checks windows_457 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨37206, 37211, Family457MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family457MainPilot.cache 37206 =
          some 37211 ∧ 37211 ≤ 573802 from
          ⟨Family457MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_457 : ∀ w ∈ windows_457, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_457 checked_457
noncomputable def fromRaw_457 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_457) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_457 checked_457 q raw nodes returns truth
noncomputable def windows_458 : List WorkingViewPilot.Window := [
  ⟨37211, 37281, Family458MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_458 : WorkingViewPilot.checks windows_458 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨37211, 37281, Family458MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family458MainPilot.cache 37211 =
          some 37281 ∧ 37281 ≤ 573802 from
          ⟨Family458MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_458 : ∀ w ∈ windows_458, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_458 checked_458
noncomputable def fromRaw_458 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_458) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_458 checked_458 q raw nodes returns truth
noncomputable def windows_459 : List WorkingViewPilot.Window := [
  ⟨37281, 37651, Family459MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_459 : WorkingViewPilot.checks windows_459 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨37281, 37651, Family459MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family459MainPilot.cache 37281 =
          some 37651 ∧ 37651 ≤ 573802 from
          ⟨Family459MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_459 : ∀ w ∈ windows_459, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_459 checked_459
noncomputable def fromRaw_459 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_459) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_459 checked_459 q raw nodes returns truth
noncomputable def windows_460 : List WorkingViewPilot.Window := [
  ⟨37651, 37656, Family460MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_460 : WorkingViewPilot.checks windows_460 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨37651, 37656, Family460MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family460MainPilot.cache 37651 =
          some 37656 ∧ 37656 ≤ 573802 from
          ⟨Family460MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_460 : ∀ w ∈ windows_460, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_460 checked_460
noncomputable def fromRaw_460 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_460) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_460 checked_460 q raw nodes returns truth
noncomputable def windows_461 : List WorkingViewPilot.Window := [
  ⟨37656, 37726, Family461MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_461 : WorkingViewPilot.checks windows_461 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨37656, 37726, Family461MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family461MainPilot.cache 37656 =
          some 37726 ∧ 37726 ≤ 573802 from
          ⟨Family461MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_461 : ∀ w ∈ windows_461, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_461 checked_461
noncomputable def fromRaw_461 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_461) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_461 checked_461 q raw nodes returns truth
noncomputable def windows_462 : List WorkingViewPilot.Window := [
  ⟨37726, 38126, Family462MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_462 : WorkingViewPilot.checks windows_462 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨37726, 38126, Family462MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family462MainPilot.cache 37726 =
          some 38126 ∧ 38126 ≤ 573802 from
          ⟨Family462MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_462 : ∀ w ∈ windows_462, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_462 checked_462
noncomputable def fromRaw_462 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_462) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_462 checked_462 q raw nodes returns truth
noncomputable def windows_463 : List WorkingViewPilot.Window := [
  ⟨38126, 38131, Family463MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_463 : WorkingViewPilot.checks windows_463 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨38126, 38131, Family463MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family463MainPilot.cache 38126 =
          some 38131 ∧ 38131 ≤ 573802 from
          ⟨Family463MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_463 : ∀ w ∈ windows_463, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_463 checked_463
noncomputable def fromRaw_463 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_463) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_463 checked_463 q raw nodes returns truth
noncomputable def windows_464 : List WorkingViewPilot.Window := [
  ⟨38131, 38141, Family464MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_464 : WorkingViewPilot.checks windows_464 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨38131, 38141, Family464MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family464MainPilot.cache 38131 =
          some 38141 ∧ 38141 ≤ 573802 from
          ⟨Family464MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_464 : ∀ w ∈ windows_464, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_464 checked_464
noncomputable def fromRaw_464 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_464) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_464 checked_464 q raw nodes returns truth
noncomputable def windows_465 : List WorkingViewPilot.Window := [
  ⟨38141, 38661, Family465MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_465 : WorkingViewPilot.checks windows_465 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨38141, 38661, Family465MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family465MainPilot.cache 38141 =
          some 38661 ∧ 38661 ≤ 573802 from
          ⟨Family465MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_465 : ∀ w ∈ windows_465, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_465 checked_465
noncomputable def fromRaw_465 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_465) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_465 checked_465 q raw nodes returns truth
noncomputable def windows_466 : List WorkingViewPilot.Window := [
  ⟨38661, 39236, Family466MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_466 : WorkingViewPilot.checks windows_466 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨38661, 39236, Family466MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family466MainPilot.cache 38661 =
          some 39236 ∧ 39236 ≤ 573802 from
          ⟨Family466MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_466 : ∀ w ∈ windows_466, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_466 checked_466
noncomputable def fromRaw_466 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_466) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_466 checked_466 q raw nodes returns truth
noncomputable def windows_467 : List WorkingViewPilot.Window := [
  ⟨39236, 39306, Family467MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_467 : WorkingViewPilot.checks windows_467 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨39236, 39306, Family467MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family467MainPilot.cache 39236 =
          some 39306 ∧ 39306 ≤ 573802 from
          ⟨Family467MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_467 : ∀ w ∈ windows_467, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_467 checked_467
noncomputable def fromRaw_467 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_467) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_467 checked_467 q raw nodes returns truth
noncomputable def windows_468 : List WorkingViewPilot.Window := [
  ⟨39306, 39501, Family468MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_468 : WorkingViewPilot.checks windows_468 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨39306, 39501, Family468MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family468MainPilot.cache 39306 =
          some 39501 ∧ 39501 ≤ 573802 from
          ⟨Family468MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_468 : ∀ w ∈ windows_468, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_468 checked_468
noncomputable def fromRaw_468 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_468) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_468 checked_468 q raw nodes returns truth
noncomputable def windows_469 : List WorkingViewPilot.Window := [
  ⟨39501, 39571, Family469MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_469 : WorkingViewPilot.checks windows_469 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨39501, 39571, Family469MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family469MainPilot.cache 39501 =
          some 39571 ∧ 39571 ≤ 573802 from
          ⟨Family469MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_469 : ∀ w ∈ windows_469, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_469 checked_469
noncomputable def fromRaw_469 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_469) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_469 checked_469 q raw nodes returns truth
noncomputable def windows_470 : List WorkingViewPilot.Window := [
  ⟨39571, 40106, Family470MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_470 : WorkingViewPilot.checks windows_470 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨39571, 40106, Family470MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family470MainPilot.cache 39571 =
          some 40106 ∧ 40106 ≤ 573802 from
          ⟨Family470MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_470 : ∀ w ∈ windows_470, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_470 checked_470
noncomputable def fromRaw_470 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_470) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_470 checked_470 q raw nodes returns truth
noncomputable def windows_471 : List WorkingViewPilot.Window := [
  ⟨40106, 40111, Family471MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_471 : WorkingViewPilot.checks windows_471 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨40106, 40111, Family471MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family471MainPilot.cache 40106 =
          some 40111 ∧ 40111 ≤ 573802 from
          ⟨Family471MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_471 : ∀ w ∈ windows_471, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_471 checked_471
noncomputable def fromRaw_471 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_471) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_471 checked_471 q raw nodes returns truth
noncomputable def windows_472 : List WorkingViewPilot.Window := [
  ⟨40111, 40181, Family472MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_472 : WorkingViewPilot.checks windows_472 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨40111, 40181, Family472MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family472MainPilot.cache 40111 =
          some 40181 ∧ 40181 ≤ 573802 from
          ⟨Family472MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_472 : ∀ w ∈ windows_472, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_472 checked_472
noncomputable def fromRaw_472 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_472) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_472 checked_472 q raw nodes returns truth
noncomputable def windows_473 : List WorkingViewPilot.Window := [
  ⟨40181, 40851, Family473MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_473 : WorkingViewPilot.checks windows_473 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨40181, 40851, Family473MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family473MainPilot.cache 40181 =
          some 40851 ∧ 40851 ≤ 573802 from
          ⟨Family473MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_473 : ∀ w ∈ windows_473, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_473 checked_473
noncomputable def fromRaw_473 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_473) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_473 checked_473 q raw nodes returns truth
noncomputable def windows_474 : List WorkingViewPilot.Window := [
  ⟨40851, 40921, Family474MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_474 : WorkingViewPilot.checks windows_474 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨40851, 40921, Family474MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family474MainPilot.cache 40851 =
          some 40921 ∧ 40921 ≤ 573802 from
          ⟨Family474MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_474 : ∀ w ∈ windows_474, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_474 checked_474
noncomputable def fromRaw_474 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_474) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_474 checked_474 q raw nodes returns truth
noncomputable def windows_475 : List WorkingViewPilot.Window := [
  ⟨40921, 41591, Family475MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_475 : WorkingViewPilot.checks windows_475 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨40921, 41591, Family475MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family475MainPilot.cache 40921 =
          some 41591 ∧ 41591 ≤ 573802 from
          ⟨Family475MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_475 : ∀ w ∈ windows_475, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_475 checked_475
noncomputable def fromRaw_475 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_475) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_475 checked_475 q raw nodes returns truth
noncomputable def windows_476 : List WorkingViewPilot.Window := [
  ⟨41591, 42261, Family476MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_476 : WorkingViewPilot.checks windows_476 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨41591, 42261, Family476MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family476MainPilot.cache 41591 =
          some 42261 ∧ 42261 ≤ 573802 from
          ⟨Family476MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_476 : ∀ w ∈ windows_476, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_476 checked_476
noncomputable def fromRaw_476 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_476) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_476 checked_476 q raw nodes returns truth
noncomputable def windows_477 : List WorkingViewPilot.Window := [
  ⟨42261, 42266, Family477MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_477 : WorkingViewPilot.checks windows_477 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨42261, 42266, Family477MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family477MainPilot.cache 42261 =
          some 42266 ∧ 42266 ≤ 573802 from
          ⟨Family477MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_477 : ∀ w ∈ windows_477, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_477 checked_477
noncomputable def fromRaw_477 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_477) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_477 checked_477 q raw nodes returns truth
noncomputable def windows_478 : List WorkingViewPilot.Window := [
  ⟨42266, 42336, Family478MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_478 : WorkingViewPilot.checks windows_478 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨42266, 42336, Family478MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family478MainPilot.cache 42266 =
          some 42336 ∧ 42336 ≤ 573802 from
          ⟨Family478MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_478 : ∀ w ∈ windows_478, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_478 checked_478
noncomputable def fromRaw_478 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_478) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_478 checked_478 q raw nodes returns truth
noncomputable def windows_479 : List WorkingViewPilot.Window := [
  ⟨42336, 43006, Family479MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_479 : WorkingViewPilot.checks windows_479 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨42336, 43006, Family479MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family479MainPilot.cache 42336 =
          some 43006 ∧ 43006 ≤ 573802 from
          ⟨Family479MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_479 : ∀ w ∈ windows_479, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_479 checked_479
noncomputable def fromRaw_479 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_479) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_479 checked_479 q raw nodes returns truth
noncomputable def windows_480 : List WorkingViewPilot.Window := [
  ⟨43006, 43011, Family480MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_480 : WorkingViewPilot.checks windows_480 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨43006, 43011, Family480MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family480MainPilot.cache 43006 =
          some 43011 ∧ 43011 ≤ 573802 from
          ⟨Family480MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_480 : ∀ w ∈ windows_480, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_480 checked_480
noncomputable def fromRaw_480 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_480) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_480 checked_480 q raw nodes returns truth
noncomputable def windows_481 : List WorkingViewPilot.Window := [
  ⟨43011, 43021, Family481MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_481 : WorkingViewPilot.checks windows_481 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨43011, 43021, Family481MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family481MainPilot.cache 43011 =
          some 43021 ∧ 43021 ≤ 573802 from
          ⟨Family481MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_481 : ∀ w ∈ windows_481, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_481 checked_481
noncomputable def fromRaw_481 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_481) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_481 checked_481 q raw nodes returns truth
noncomputable def windows_482 : List WorkingViewPilot.Window := [
  ⟨43021, 43391, Family482MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_482 : WorkingViewPilot.checks windows_482 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨43021, 43391, Family482MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family482MainPilot.cache 43021 =
          some 43391 ∧ 43391 ≤ 573802 from
          ⟨Family482MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_482 : ∀ w ∈ windows_482, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_482 checked_482
noncomputable def fromRaw_482 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_482) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_482 checked_482 q raw nodes returns truth
noncomputable def windows_483 : List WorkingViewPilot.Window := [
  ⟨43391, 43831, Family483MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_483 : WorkingViewPilot.checks windows_483 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨43391, 43831, Family483MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family483MainPilot.cache 43391 =
          some 43831 ∧ 43831 ≤ 573802 from
          ⟨Family483MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_483 : ∀ w ∈ windows_483, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_483 checked_483
noncomputable def fromRaw_483 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_483) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_483 checked_483 q raw nodes returns truth
noncomputable def windows_484 : List WorkingViewPilot.Window := [
  ⟨43831, 43901, Family484MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_484 : WorkingViewPilot.checks windows_484 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨43831, 43901, Family484MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family484MainPilot.cache 43831 =
          some 43901 ∧ 43901 ≤ 573802 from
          ⟨Family484MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_484 : ∀ w ∈ windows_484, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_484 checked_484
noncomputable def fromRaw_484 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_484) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_484 checked_484 q raw nodes returns truth
noncomputable def windows_485 : List WorkingViewPilot.Window := [
  ⟨43901, 44096, Family485MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_485 : WorkingViewPilot.checks windows_485 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨43901, 44096, Family485MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family485MainPilot.cache 43901 =
          some 44096 ∧ 44096 ≤ 573802 from
          ⟨Family485MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_485 : ∀ w ∈ windows_485, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_485 checked_485
noncomputable def fromRaw_485 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_485) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_485 checked_485 q raw nodes returns truth
noncomputable def windows_486 : List WorkingViewPilot.Window := [
  ⟨44096, 44166, Family486MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_486 : WorkingViewPilot.checks windows_486 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨44096, 44166, Family486MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family486MainPilot.cache 44096 =
          some 44166 ∧ 44166 ≤ 573802 from
          ⟨Family486MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_486 : ∀ w ∈ windows_486, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_486 checked_486
noncomputable def fromRaw_486 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_486) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_486 checked_486 q raw nodes returns truth
noncomputable def windows_487 : List WorkingViewPilot.Window := [
  ⟨44166, 44566, Family487MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_487 : WorkingViewPilot.checks windows_487 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨44166, 44566, Family487MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family487MainPilot.cache 44166 =
          some 44566 ∧ 44566 ≤ 573802 from
          ⟨Family487MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_487 : ∀ w ∈ windows_487, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_487 checked_487
noncomputable def fromRaw_487 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_487) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_487 checked_487 q raw nodes returns truth
noncomputable def windows_488 : List WorkingViewPilot.Window := [
  ⟨44566, 44571, Family488MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_488 : WorkingViewPilot.checks windows_488 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨44566, 44571, Family488MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family488MainPilot.cache 44566 =
          some 44571 ∧ 44571 ≤ 573802 from
          ⟨Family488MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_488 : ∀ w ∈ windows_488, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_488 checked_488
noncomputable def fromRaw_488 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_488) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_488 checked_488 q raw nodes returns truth
noncomputable def windows_489 : List WorkingViewPilot.Window := [
  ⟨44571, 44641, Family489MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_489 : WorkingViewPilot.checks windows_489 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨44571, 44641, Family489MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family489MainPilot.cache 44571 =
          some 44641 ∧ 44641 ≤ 573802 from
          ⟨Family489MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_489 : ∀ w ∈ windows_489, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_489 checked_489
noncomputable def fromRaw_489 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_489) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_489 checked_489 q raw nodes returns truth
noncomputable def windows_490 : List WorkingViewPilot.Window := [
  ⟨44641, 45011, Family490MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_490 : WorkingViewPilot.checks windows_490 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨44641, 45011, Family490MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family490MainPilot.cache 44641 =
          some 45011 ∧ 45011 ≤ 573802 from
          ⟨Family490MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_490 : ∀ w ∈ windows_490, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_490 checked_490
noncomputable def fromRaw_490 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_490) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_490 checked_490 q raw nodes returns truth
noncomputable def windows_491 : List WorkingViewPilot.Window := [
  ⟨45011, 45016, Family491MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_491 : WorkingViewPilot.checks windows_491 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨45011, 45016, Family491MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family491MainPilot.cache 45011 =
          some 45016 ∧ 45016 ≤ 573802 from
          ⟨Family491MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_491 : ∀ w ∈ windows_491, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_491 checked_491
noncomputable def fromRaw_491 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_491) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_491 checked_491 q raw nodes returns truth
noncomputable def windows_492 : List WorkingViewPilot.Window := [
  ⟨45016, 45086, Family492MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_492 : WorkingViewPilot.checks windows_492 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨45016, 45086, Family492MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family492MainPilot.cache 45016 =
          some 45086 ∧ 45086 ≤ 573802 from
          ⟨Family492MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_492 : ∀ w ∈ windows_492, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_492 checked_492
noncomputable def fromRaw_492 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_492) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_492 checked_492 q raw nodes returns truth
noncomputable def windows_493 : List WorkingViewPilot.Window := [
  ⟨45086, 45486, Family493MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_493 : WorkingViewPilot.checks windows_493 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨45086, 45486, Family493MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family493MainPilot.cache 45086 =
          some 45486 ∧ 45486 ≤ 573802 from
          ⟨Family493MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_493 : ∀ w ∈ windows_493, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_493 checked_493
noncomputable def fromRaw_493 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_493) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_493 checked_493 q raw nodes returns truth
noncomputable def windows_494 : List WorkingViewPilot.Window := [
  ⟨45486, 45491, Family494MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_494 : WorkingViewPilot.checks windows_494 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨45486, 45491, Family494MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family494MainPilot.cache 45486 =
          some 45491 ∧ 45491 ≤ 573802 from
          ⟨Family494MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_494 : ∀ w ∈ windows_494, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_494 checked_494
noncomputable def fromRaw_494 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_494) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_494 checked_494 q raw nodes returns truth
noncomputable def windows_495 : List WorkingViewPilot.Window := [
  ⟨45491, 45501, Family495MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_495 : WorkingViewPilot.checks windows_495 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨45491, 45501, Family495MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family495MainPilot.cache 45491 =
          some 45501 ∧ 45501 ≤ 573802 from
          ⟨Family495MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_495 : ∀ w ∈ windows_495, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_495 checked_495
noncomputable def fromRaw_495 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_495) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_495 checked_495 q raw nodes returns truth
noncomputable def windows_496 : List WorkingViewPilot.Window := [
  ⟨45501, 46021, Family496MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_496 : WorkingViewPilot.checks windows_496 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨45501, 46021, Family496MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family496MainPilot.cache 45501 =
          some 46021 ∧ 46021 ≤ 573802 from
          ⟨Family496MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_496 : ∀ w ∈ windows_496, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_496 checked_496
noncomputable def fromRaw_496 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_496) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_496 checked_496 q raw nodes returns truth
noncomputable def windows_497 : List WorkingViewPilot.Window := [
  ⟨46021, 46596, Family497MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_497 : WorkingViewPilot.checks windows_497 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨46021, 46596, Family497MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family497MainPilot.cache 46021 =
          some 46596 ∧ 46596 ≤ 573802 from
          ⟨Family497MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_497 : ∀ w ∈ windows_497, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_497 checked_497
noncomputable def fromRaw_497 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_497) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_497 checked_497 q raw nodes returns truth
noncomputable def windows_498 : List WorkingViewPilot.Window := [
  ⟨46596, 46666, Family498MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_498 : WorkingViewPilot.checks windows_498 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨46596, 46666, Family498MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family498MainPilot.cache 46596 =
          some 46666 ∧ 46666 ≤ 573802 from
          ⟨Family498MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_498 : ∀ w ∈ windows_498, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_498 checked_498
noncomputable def fromRaw_498 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_498) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_498 checked_498 q raw nodes returns truth
noncomputable def windows_499 : List WorkingViewPilot.Window := [
  ⟨46666, 46861, Family499MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_499 : WorkingViewPilot.checks windows_499 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨46666, 46861, Family499MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family499MainPilot.cache 46666 =
          some 46861 ∧ 46861 ≤ 573802 from
          ⟨Family499MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_499 : ∀ w ∈ windows_499, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_499 checked_499
noncomputable def fromRaw_499 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_499) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_499 checked_499 q raw nodes returns truth
noncomputable def windows_500 : List WorkingViewPilot.Window := [
  ⟨46861, 46931, Family500MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_500 : WorkingViewPilot.checks windows_500 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨46861, 46931, Family500MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family500MainPilot.cache 46861 =
          some 46931 ∧ 46931 ≤ 573802 from
          ⟨Family500MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_500 : ∀ w ∈ windows_500, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_500 checked_500
noncomputable def fromRaw_500 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_500) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_500 checked_500 q raw nodes returns truth
noncomputable def windows_501 : List WorkingViewPilot.Window := [
  ⟨46931, 47466, Family501MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_501 : WorkingViewPilot.checks windows_501 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨46931, 47466, Family501MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family501MainPilot.cache 46931 =
          some 47466 ∧ 47466 ≤ 573802 from
          ⟨Family501MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_501 : ∀ w ∈ windows_501, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_501 checked_501
noncomputable def fromRaw_501 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_501) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_501 checked_501 q raw nodes returns truth
noncomputable def windows_502 : List WorkingViewPilot.Window := [
  ⟨47466, 47471, Family502MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_502 : WorkingViewPilot.checks windows_502 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨47466, 47471, Family502MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family502MainPilot.cache 47466 =
          some 47471 ∧ 47471 ≤ 573802 from
          ⟨Family502MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_502 : ∀ w ∈ windows_502, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_502 checked_502
noncomputable def fromRaw_502 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_502) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_502 checked_502 q raw nodes returns truth
noncomputable def windows_503 : List WorkingViewPilot.Window := [
  ⟨47471, 47541, Family503MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_503 : WorkingViewPilot.checks windows_503 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨47471, 47541, Family503MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family503MainPilot.cache 47471 =
          some 47541 ∧ 47541 ≤ 573802 from
          ⟨Family503MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_503 : ∀ w ∈ windows_503, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_503 checked_503
noncomputable def fromRaw_503 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_503) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_503 checked_503 q raw nodes returns truth
noncomputable def windows_504 : List WorkingViewPilot.Window := [
  ⟨47541, 48211, Family504MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_504 : WorkingViewPilot.checks windows_504 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨47541, 48211, Family504MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family504MainPilot.cache 47541 =
          some 48211 ∧ 48211 ≤ 573802 from
          ⟨Family504MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_504 : ∀ w ∈ windows_504, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_504 checked_504
noncomputable def fromRaw_504 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_504) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_504 checked_504 q raw nodes returns truth
noncomputable def windows_505 : List WorkingViewPilot.Window := [
  ⟨48211, 48281, Family505MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_505 : WorkingViewPilot.checks windows_505 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨48211, 48281, Family505MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family505MainPilot.cache 48211 =
          some 48281 ∧ 48281 ≤ 573802 from
          ⟨Family505MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_505 : ∀ w ∈ windows_505, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_505 checked_505
noncomputable def fromRaw_505 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_505) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_505 checked_505 q raw nodes returns truth
noncomputable def windows_506 : List WorkingViewPilot.Window := [
  ⟨48281, 48951, Family506MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_506 : WorkingViewPilot.checks windows_506 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨48281, 48951, Family506MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family506MainPilot.cache 48281 =
          some 48951 ∧ 48951 ≤ 573802 from
          ⟨Family506MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_506 : ∀ w ∈ windows_506, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_506 checked_506
noncomputable def fromRaw_506 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_506) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_506 checked_506 q raw nodes returns truth
noncomputable def windows_507 : List WorkingViewPilot.Window := [
  ⟨48951, 49621, Family507MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_507 : WorkingViewPilot.checks windows_507 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨48951, 49621, Family507MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family507MainPilot.cache 48951 =
          some 49621 ∧ 49621 ≤ 573802 from
          ⟨Family507MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_507 : ∀ w ∈ windows_507, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_507 checked_507
noncomputable def fromRaw_507 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_507) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_507 checked_507 q raw nodes returns truth
noncomputable def windows_508 : List WorkingViewPilot.Window := [
  ⟨49621, 49626, Family508MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_508 : WorkingViewPilot.checks windows_508 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨49621, 49626, Family508MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family508MainPilot.cache 49621 =
          some 49626 ∧ 49626 ≤ 573802 from
          ⟨Family508MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_508 : ∀ w ∈ windows_508, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_508 checked_508
noncomputable def fromRaw_508 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_508) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_508 checked_508 q raw nodes returns truth
noncomputable def windows_509 : List WorkingViewPilot.Window := [
  ⟨49626, 49696, Family509MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_509 : WorkingViewPilot.checks windows_509 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨49626, 49696, Family509MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family509MainPilot.cache 49626 =
          some 49696 ∧ 49696 ≤ 573802 from
          ⟨Family509MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_509 : ∀ w ∈ windows_509, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_509 checked_509
noncomputable def fromRaw_509 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_509) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_509 checked_509 q raw nodes returns truth
end FamilyViews004Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Quantified working-set batch fidelity checked"
