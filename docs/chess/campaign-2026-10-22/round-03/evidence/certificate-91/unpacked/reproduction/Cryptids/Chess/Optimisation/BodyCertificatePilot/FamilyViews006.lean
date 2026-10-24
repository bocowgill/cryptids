module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.FamilyViews006Data
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.FamilyWiring
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.FamilyReturns

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace Family585MainPilot
theorem checked_65566_167 : validate cache_65566_167 65566 =
    some 65733 := by
  decide +kernel
theorem checked_65733_168 : validate cache_65733_168 65733 =
    some 65901 := by
  decide +kernel
theorem checked_65566_335 : validate cache_65566_335 65566 =
    some 65901 := by
  exact validate_branch 167 cache_65566_167 cache_65733_168
    65566 65733 65901
    checked_65566_167 rfl checked_65733_168
theorem checked_65901_167 : validate cache_65901_167 65901 =
    some 66068 := by
  decide +kernel
theorem checked_66068_168 : validate cache_66068_168 66068 =
    some 66236 := by
  decide +kernel
theorem checked_65901_335 : validate cache_65901_335 65901 =
    some 66236 := by
  exact validate_branch 167 cache_65901_167 cache_66068_168
    65901 66068 66236
    checked_65901_167 rfl checked_66068_168
theorem checked_65566_670 : validate cache_65566_670 65566 =
    some 66236 := by
  exact validate_branch 335 cache_65566_335 cache_65901_335
    65566 65901 66236
    checked_65566_335 rfl checked_65901_335
theorem checked : validate cache 65566 = some 66236 :=
  checked_65566_670
end Family585MainPilot
open LookupCachePilot
namespace Family586MainPilot
theorem checked_66236_5 : validate cache_66236_5 66236 =
    some 66241 := by
  decide +kernel
theorem checked : validate cache 66236 = some 66241 :=
  checked_66236_5
end Family586MainPilot
open LookupCachePilot
namespace Family587MainPilot
theorem checked_66241_70 : validate cache_66241_70 66241 =
    some 66311 := by
  decide +kernel
theorem checked : validate cache 66241 = some 66311 :=
  checked_66241_70
end Family587MainPilot
open LookupCachePilot
namespace Family588MainPilot
theorem checked_66311_167 : validate cache_66311_167 66311 =
    some 66478 := by
  decide +kernel
theorem checked_66478_168 : validate cache_66478_168 66478 =
    some 66646 := by
  decide +kernel
theorem checked_66311_335 : validate cache_66311_335 66311 =
    some 66646 := by
  exact validate_branch 167 cache_66311_167 cache_66478_168
    66311 66478 66646
    checked_66311_167 rfl checked_66478_168
theorem checked_66646_167 : validate cache_66646_167 66646 =
    some 66813 := by
  decide +kernel
theorem checked_66813_168 : validate cache_66813_168 66813 =
    some 66981 := by
  decide +kernel
theorem checked_66646_335 : validate cache_66646_335 66646 =
    some 66981 := by
  exact validate_branch 167 cache_66646_167 cache_66813_168
    66646 66813 66981
    checked_66646_167 rfl checked_66813_168
theorem checked_66311_670 : validate cache_66311_670 66311 =
    some 66981 := by
  exact validate_branch 335 cache_66311_335 cache_66646_335
    66311 66646 66981
    checked_66311_335 rfl checked_66646_335
theorem checked : validate cache 66311 = some 66981 :=
  checked_66311_670
end Family588MainPilot
open LookupCachePilot
namespace Family589MainPilot
theorem checked_66981_5 : validate cache_66981_5 66981 =
    some 66986 := by
  decide +kernel
theorem checked : validate cache 66981 = some 66986 :=
  checked_66981_5
end Family589MainPilot
open LookupCachePilot
namespace Family590MainPilot
theorem checked_66986_70 : validate cache_66986_70 66986 =
    some 67056 := by
  decide +kernel
theorem checked : validate cache 66986 = some 67056 :=
  checked_66986_70
end Family590MainPilot
open LookupCachePilot
namespace Family591MainPilot
theorem checked_67056_220 : validate cache_67056_220 67056 =
    some 67276 := by
  decide +kernel
theorem checked : validate cache 67056 = some 67276 :=
  checked_67056_220
end Family591MainPilot
open LookupCachePilot
namespace Family592MainPilot
theorem checked_67276_5 : validate cache_67276_5 67276 =
    some 67281 := by
  decide +kernel
theorem checked : validate cache 67276 = some 67281 :=
  checked_67276_5
end Family592MainPilot
open LookupCachePilot
namespace Family593MainPilot
theorem checked_67281_70 : validate cache_67281_70 67281 =
    some 67351 := by
  decide +kernel
theorem checked : validate cache 67281 = some 67351 :=
  checked_67281_70
end Family593MainPilot
open LookupCachePilot
namespace Family594MainPilot
theorem checked_67351_132 : validate cache_67351_132 67351 =
    some 67483 := by
  decide +kernel
theorem checked_67483_133 : validate cache_67483_133 67483 =
    some 67616 := by
  decide +kernel
theorem checked_67351_265 : validate cache_67351_265 67351 =
    some 67616 := by
  exact validate_branch 132 cache_67351_132 cache_67483_133
    67351 67483 67616
    checked_67351_132 rfl checked_67483_133
theorem checked : validate cache 67351 = some 67616 :=
  checked_67351_265
end Family594MainPilot
open LookupCachePilot
namespace Family595MainPilot
theorem checked_67616_5 : validate cache_67616_5 67616 =
    some 67621 := by
  decide +kernel
theorem checked : validate cache 67616 = some 67621 :=
  checked_67616_5
end Family595MainPilot
open LookupCachePilot
namespace Family596MainPilot
theorem checked_67621_10 : validate cache_67621_10 67621 =
    some 67631 := by
  decide +kernel
theorem checked : validate cache 67621 = some 67631 :=
  checked_67621_10
end Family596MainPilot
open LookupCachePilot
namespace Family597MainPilot
theorem checked_67631_185 : validate cache_67631_185 67631 =
    some 67816 := by
  decide +kernel
theorem checked_67816_185 : validate cache_67816_185 67816 =
    some 68001 := by
  decide +kernel
theorem checked_67631_370 : validate cache_67631_370 67631 =
    some 68001 := by
  exact validate_branch 185 cache_67631_185 cache_67816_185
    67631 67816 68001
    checked_67631_185 rfl checked_67816_185
theorem checked : validate cache 67631 = some 68001 :=
  checked_67631_370
end Family597MainPilot
open LookupCachePilot
namespace Family598MainPilot
theorem checked_68001_220 : validate cache_68001_220 68001 =
    some 68221 := by
  decide +kernel
theorem checked_68221_220 : validate cache_68221_220 68221 =
    some 68441 := by
  decide +kernel
theorem checked_68001_440 : validate cache_68001_440 68001 =
    some 68441 := by
  exact validate_branch 220 cache_68001_220 cache_68221_220
    68001 68221 68441
    checked_68001_220 rfl checked_68221_220
theorem checked : validate cache 68001 = some 68441 :=
  checked_68001_440
end Family598MainPilot
open LookupCachePilot
namespace Family599MainPilot
theorem checked_68441_70 : validate cache_68441_70 68441 =
    some 68511 := by
  decide +kernel
theorem checked : validate cache 68441 = some 68511 :=
  checked_68441_70
end Family599MainPilot
open LookupCachePilot
namespace Family600MainPilot
theorem checked_68511_195 : validate cache_68511_195 68511 =
    some 68706 := by
  decide +kernel
theorem checked : validate cache 68511 = some 68706 :=
  checked_68511_195
end Family600MainPilot
open LookupCachePilot
namespace Family601MainPilot
theorem checked_68706_70 : validate cache_68706_70 68706 =
    some 68776 := by
  decide +kernel
theorem checked : validate cache 68706 = some 68776 :=
  checked_68706_70
end Family601MainPilot
open LookupCachePilot
namespace Family602MainPilot
theorem checked_68776_200 : validate cache_68776_200 68776 =
    some 68976 := by
  decide +kernel
theorem checked_68976_200 : validate cache_68976_200 68976 =
    some 69176 := by
  decide +kernel
theorem checked_68776_400 : validate cache_68776_400 68776 =
    some 69176 := by
  exact validate_branch 200 cache_68776_200 cache_68976_200
    68776 68976 69176
    checked_68776_200 rfl checked_68976_200
theorem checked : validate cache 68776 = some 69176 :=
  checked_68776_400
end Family602MainPilot
open LookupCachePilot
namespace Family603MainPilot
theorem checked_69176_5 : validate cache_69176_5 69176 =
    some 69181 := by
  decide +kernel
theorem checked : validate cache 69176 = some 69181 :=
  checked_69176_5
end Family603MainPilot
open LookupCachePilot
namespace Family604MainPilot
theorem checked_69181_70 : validate cache_69181_70 69181 =
    some 69251 := by
  decide +kernel
theorem checked : validate cache 69181 = some 69251 :=
  checked_69181_70
end Family604MainPilot
open LookupCachePilot
namespace Family605MainPilot
theorem checked_69251_185 : validate cache_69251_185 69251 =
    some 69436 := by
  decide +kernel
theorem checked_69436_185 : validate cache_69436_185 69436 =
    some 69621 := by
  decide +kernel
theorem checked_69251_370 : validate cache_69251_370 69251 =
    some 69621 := by
  exact validate_branch 185 cache_69251_185 cache_69436_185
    69251 69436 69621
    checked_69251_185 rfl checked_69436_185
theorem checked : validate cache 69251 = some 69621 :=
  checked_69251_370
end Family605MainPilot
open LookupCachePilot
namespace Family606MainPilot
theorem checked_69621_5 : validate cache_69621_5 69621 =
    some 69626 := by
  decide +kernel
theorem checked : validate cache 69621 = some 69626 :=
  checked_69621_5
end Family606MainPilot
open LookupCachePilot
namespace Family607MainPilot
theorem checked_69626_70 : validate cache_69626_70 69626 =
    some 69696 := by
  decide +kernel
theorem checked : validate cache 69626 = some 69696 :=
  checked_69626_70
end Family607MainPilot
open LookupCachePilot
namespace Family608MainPilot
theorem checked_69696_200 : validate cache_69696_200 69696 =
    some 69896 := by
  decide +kernel
theorem checked_69896_200 : validate cache_69896_200 69896 =
    some 70096 := by
  decide +kernel
theorem checked_69696_400 : validate cache_69696_400 69696 =
    some 70096 := by
  exact validate_branch 200 cache_69696_200 cache_69896_200
    69696 69896 70096
    checked_69696_200 rfl checked_69896_200
theorem checked : validate cache 69696 = some 70096 :=
  checked_69696_400
end Family608MainPilot
open LookupCachePilot
namespace Family609MainPilot
theorem checked_70096_5 : validate cache_70096_5 70096 =
    some 70101 := by
  decide +kernel
theorem checked : validate cache 70096 = some 70101 :=
  checked_70096_5
end Family609MainPilot
open LookupCachePilot
namespace Family610MainPilot
theorem checked_70101_10 : validate cache_70101_10 70101 =
    some 70111 := by
  decide +kernel
theorem checked : validate cache 70101 = some 70111 :=
  checked_70101_10
end Family610MainPilot
open LookupCachePilot
namespace Family611MainPilot
theorem checked_70111_130 : validate cache_70111_130 70111 =
    some 70241 := by
  decide +kernel
theorem checked_70241_130 : validate cache_70241_130 70241 =
    some 70371 := by
  decide +kernel
theorem checked_70111_260 : validate cache_70111_260 70111 =
    some 70371 := by
  exact validate_branch 130 cache_70111_130 cache_70241_130
    70111 70241 70371
    checked_70111_130 rfl checked_70241_130
theorem checked_70371_130 : validate cache_70371_130 70371 =
    some 70501 := by
  decide +kernel
theorem checked_70501_130 : validate cache_70501_130 70501 =
    some 70631 := by
  decide +kernel
theorem checked_70371_260 : validate cache_70371_260 70371 =
    some 70631 := by
  exact validate_branch 130 cache_70371_130 cache_70501_130
    70371 70501 70631
    checked_70371_130 rfl checked_70501_130
theorem checked_70111_520 : validate cache_70111_520 70111 =
    some 70631 := by
  exact validate_branch 260 cache_70111_260 cache_70371_260
    70111 70371 70631
    checked_70111_260 rfl checked_70371_260
theorem checked : validate cache 70111 = some 70631 :=
  checked_70111_520
end Family611MainPilot
open LookupCachePilot
namespace Family612MainPilot
theorem checked_70631_143 : validate cache_70631_143 70631 =
    some 70774 := by
  decide +kernel
theorem checked_70774_144 : validate cache_70774_144 70774 =
    some 70918 := by
  decide +kernel
theorem checked_70631_287 : validate cache_70631_287 70631 =
    some 70918 := by
  exact validate_branch 143 cache_70631_143 cache_70774_144
    70631 70774 70918
    checked_70631_143 rfl checked_70774_144
theorem checked_70918_144 : validate cache_70918_144 70918 =
    some 71062 := by
  decide +kernel
theorem checked_71062_144 : validate cache_71062_144 71062 =
    some 71206 := by
  decide +kernel
theorem checked_70918_288 : validate cache_70918_288 70918 =
    some 71206 := by
  exact validate_branch 144 cache_70918_144 cache_71062_144
    70918 71062 71206
    checked_70918_144 rfl checked_71062_144
theorem checked_70631_575 : validate cache_70631_575 70631 =
    some 71206 := by
  exact validate_branch 287 cache_70631_287 cache_70918_288
    70631 70918 71206
    checked_70631_287 rfl checked_70918_288
theorem checked : validate cache 70631 = some 71206 :=
  checked_70631_575
end Family612MainPilot
open LookupCachePilot
namespace Family613MainPilot
theorem checked_71206_70 : validate cache_71206_70 71206 =
    some 71276 := by
  decide +kernel
theorem checked : validate cache 71206 = some 71276 :=
  checked_71206_70
end Family613MainPilot
open LookupCachePilot
namespace Family614MainPilot
theorem checked_71276_195 : validate cache_71276_195 71276 =
    some 71471 := by
  decide +kernel
theorem checked : validate cache 71276 = some 71471 :=
  checked_71276_195
end Family614MainPilot
open LookupCachePilot
namespace Family615MainPilot
theorem checked_71471_70 : validate cache_71471_70 71471 =
    some 71541 := by
  decide +kernel
theorem checked : validate cache 71471 = some 71541 :=
  checked_71471_70
end Family615MainPilot
open LookupCachePilot
namespace Family616MainPilot
theorem checked_71541_133 : validate cache_71541_133 71541 =
    some 71674 := by
  decide +kernel
theorem checked_71674_134 : validate cache_71674_134 71674 =
    some 71808 := by
  decide +kernel
theorem checked_71541_267 : validate cache_71541_267 71541 =
    some 71808 := by
  exact validate_branch 133 cache_71541_133 cache_71674_134
    71541 71674 71808
    checked_71541_133 rfl checked_71674_134
theorem checked_71808_134 : validate cache_71808_134 71808 =
    some 71942 := by
  decide +kernel
theorem checked_71942_134 : validate cache_71942_134 71942 =
    some 72076 := by
  decide +kernel
theorem checked_71808_268 : validate cache_71808_268 71808 =
    some 72076 := by
  exact validate_branch 134 cache_71808_134 cache_71942_134
    71808 71942 72076
    checked_71808_134 rfl checked_71942_134
theorem checked_71541_535 : validate cache_71541_535 71541 =
    some 72076 := by
  exact validate_branch 267 cache_71541_267 cache_71808_268
    71541 71808 72076
    checked_71541_267 rfl checked_71808_268
theorem checked : validate cache 71541 = some 72076 :=
  checked_71541_535
end Family616MainPilot
open LookupCachePilot
namespace Family617MainPilot
theorem checked_72076_5 : validate cache_72076_5 72076 =
    some 72081 := by
  decide +kernel
theorem checked : validate cache 72076 = some 72081 :=
  checked_72076_5
end Family617MainPilot
open LookupCachePilot
namespace Family618MainPilot
theorem checked_72081_70 : validate cache_72081_70 72081 =
    some 72151 := by
  decide +kernel
theorem checked : validate cache 72081 = some 72151 :=
  checked_72081_70
end Family618MainPilot
open LookupCachePilot
namespace Family619MainPilot
theorem checked_72151_220 : validate cache_72151_220 72151 =
    some 72371 := by
  decide +kernel
theorem checked : validate cache 72151 = some 72371 :=
  checked_72151_220
end Family619MainPilot
open LookupCachePilot
namespace Family620MainPilot
theorem checked_72371_70 : validate cache_72371_70 72371 =
    some 72441 := by
  decide +kernel
theorem checked : validate cache 72371 = some 72441 :=
  checked_72371_70
end Family620MainPilot
open LookupCachePilot
namespace Family621MainPilot
theorem checked_72441_132 : validate cache_72441_132 72441 =
    some 72573 := by
  decide +kernel
theorem checked_72573_133 : validate cache_72573_133 72573 =
    some 72706 := by
  decide +kernel
theorem checked_72441_265 : validate cache_72441_265 72441 =
    some 72706 := by
  exact validate_branch 132 cache_72441_132 cache_72573_133
    72441 72573 72706
    checked_72441_132 rfl checked_72573_133
theorem checked : validate cache 72441 = some 72706 :=
  checked_72441_265
end Family621MainPilot
open LookupCachePilot
namespace Family622MainPilot
theorem checked_72706_5 : validate cache_72706_5 72706 =
    some 72711 := by
  decide +kernel
theorem checked : validate cache 72706 = some 72711 :=
  checked_72706_5
end Family622MainPilot
open LookupCachePilot
namespace Family623MainPilot
theorem checked_72711_70 : validate cache_72711_70 72711 =
    some 72781 := by
  decide +kernel
theorem checked : validate cache 72711 = some 72781 :=
  checked_72711_70
end Family623MainPilot
open LookupCachePilot
namespace Family624MainPilot
theorem checked_72781_167 : validate cache_72781_167 72781 =
    some 72948 := by
  decide +kernel
theorem checked_72948_168 : validate cache_72948_168 72948 =
    some 73116 := by
  decide +kernel
theorem checked_72781_335 : validate cache_72781_335 72781 =
    some 73116 := by
  exact validate_branch 167 cache_72781_167 cache_72948_168
    72781 72948 73116
    checked_72781_167 rfl checked_72948_168
theorem checked_73116_167 : validate cache_73116_167 73116 =
    some 73283 := by
  decide +kernel
theorem checked_73283_168 : validate cache_73283_168 73283 =
    some 73451 := by
  decide +kernel
theorem checked_73116_335 : validate cache_73116_335 73116 =
    some 73451 := by
  exact validate_branch 167 cache_73116_167 cache_73283_168
    73116 73283 73451
    checked_73116_167 rfl checked_73283_168
theorem checked_72781_670 : validate cache_72781_670 72781 =
    some 73451 := by
  exact validate_branch 335 cache_72781_335 cache_73116_335
    72781 73116 73451
    checked_72781_335 rfl checked_73116_335
theorem checked : validate cache 72781 = some 73451 :=
  checked_72781_670
end Family624MainPilot
open LookupCachePilot
namespace Family625MainPilot
theorem checked_73451_70 : validate cache_73451_70 73451 =
    some 73521 := by
  decide +kernel
theorem checked : validate cache 73451 = some 73521 :=
  checked_73451_70
end Family625MainPilot
open LookupCachePilot
namespace Family626MainPilot
theorem checked_73521_167 : validate cache_73521_167 73521 =
    some 73688 := by
  decide +kernel
theorem checked_73688_168 : validate cache_73688_168 73688 =
    some 73856 := by
  decide +kernel
theorem checked_73521_335 : validate cache_73521_335 73521 =
    some 73856 := by
  exact validate_branch 167 cache_73521_167 cache_73688_168
    73521 73688 73856
    checked_73521_167 rfl checked_73688_168
theorem checked_73856_167 : validate cache_73856_167 73856 =
    some 74023 := by
  decide +kernel
theorem checked_74023_168 : validate cache_74023_168 74023 =
    some 74191 := by
  decide +kernel
theorem checked_73856_335 : validate cache_73856_335 73856 =
    some 74191 := by
  exact validate_branch 167 cache_73856_167 cache_74023_168
    73856 74023 74191
    checked_73856_167 rfl checked_74023_168
theorem checked_73521_670 : validate cache_73521_670 73521 =
    some 74191 := by
  exact validate_branch 335 cache_73521_335 cache_73856_335
    73521 73856 74191
    checked_73521_335 rfl checked_73856_335
theorem checked : validate cache 73521 = some 74191 :=
  checked_73521_670
end Family626MainPilot
open LookupCachePilot
namespace Family627MainPilot
theorem checked_74191_167 : validate cache_74191_167 74191 =
    some 74358 := by
  decide +kernel
theorem checked_74358_168 : validate cache_74358_168 74358 =
    some 74526 := by
  decide +kernel
theorem checked_74191_335 : validate cache_74191_335 74191 =
    some 74526 := by
  exact validate_branch 167 cache_74191_167 cache_74358_168
    74191 74358 74526
    checked_74191_167 rfl checked_74358_168
theorem checked_74526_167 : validate cache_74526_167 74526 =
    some 74693 := by
  decide +kernel
theorem checked_74693_168 : validate cache_74693_168 74693 =
    some 74861 := by
  decide +kernel
theorem checked_74526_335 : validate cache_74526_335 74526 =
    some 74861 := by
  exact validate_branch 167 cache_74526_167 cache_74693_168
    74526 74693 74861
    checked_74526_167 rfl checked_74693_168
theorem checked_74191_670 : validate cache_74191_670 74191 =
    some 74861 := by
  exact validate_branch 335 cache_74191_335 cache_74526_335
    74191 74526 74861
    checked_74191_335 rfl checked_74526_335
theorem checked : validate cache 74191 = some 74861 :=
  checked_74191_670
end Family627MainPilot
open LookupCachePilot
namespace Family628MainPilot
theorem checked_74861_5 : validate cache_74861_5 74861 =
    some 74866 := by
  decide +kernel
theorem checked : validate cache 74861 = some 74866 :=
  checked_74861_5
end Family628MainPilot
open LookupCachePilot
namespace Family629MainPilot
theorem checked_74866_70 : validate cache_74866_70 74866 =
    some 74936 := by
  decide +kernel
theorem checked : validate cache 74866 = some 74936 :=
  checked_74866_70
end Family629MainPilot
open LookupCachePilot
namespace Family630MainPilot
theorem checked_74936_167 : validate cache_74936_167 74936 =
    some 75103 := by
  decide +kernel
theorem checked_75103_168 : validate cache_75103_168 75103 =
    some 75271 := by
  decide +kernel
theorem checked_74936_335 : validate cache_74936_335 74936 =
    some 75271 := by
  exact validate_branch 167 cache_74936_167 cache_75103_168
    74936 75103 75271
    checked_74936_167 rfl checked_75103_168
theorem checked_75271_167 : validate cache_75271_167 75271 =
    some 75438 := by
  decide +kernel
theorem checked_75438_168 : validate cache_75438_168 75438 =
    some 75606 := by
  decide +kernel
theorem checked_75271_335 : validate cache_75271_335 75271 =
    some 75606 := by
  exact validate_branch 167 cache_75271_167 cache_75438_168
    75271 75438 75606
    checked_75271_167 rfl checked_75438_168
theorem checked_74936_670 : validate cache_74936_670 74936 =
    some 75606 := by
  exact validate_branch 335 cache_74936_335 cache_75271_335
    74936 75271 75606
    checked_74936_335 rfl checked_75271_335
theorem checked : validate cache 74936 = some 75606 :=
  checked_74936_670
end Family630MainPilot
open LookupCachePilot
namespace Family631MainPilot
theorem checked_75606_5 : validate cache_75606_5 75606 =
    some 75611 := by
  decide +kernel
theorem checked : validate cache 75606 = some 75611 :=
  checked_75606_5
end Family631MainPilot
open LookupCachePilot
namespace Family632MainPilot
theorem checked_75611_70 : validate cache_75611_70 75611 =
    some 75681 := by
  decide +kernel
theorem checked : validate cache 75611 = some 75681 :=
  checked_75611_70
end Family632MainPilot
open LookupCachePilot
namespace Family633MainPilot
theorem checked_75681_220 : validate cache_75681_220 75681 =
    some 75901 := by
  decide +kernel
theorem checked : validate cache 75681 = some 75901 :=
  checked_75681_220
end Family633MainPilot
open LookupCachePilot
namespace Family634MainPilot
theorem checked_75901_5 : validate cache_75901_5 75901 =
    some 75906 := by
  decide +kernel
theorem checked : validate cache 75901 = some 75906 :=
  checked_75901_5
end Family634MainPilot
open LookupCachePilot
namespace Family635MainPilot
theorem checked_75906_70 : validate cache_75906_70 75906 =
    some 75976 := by
  decide +kernel
theorem checked : validate cache 75906 = some 75976 :=
  checked_75906_70
end Family635MainPilot
open LookupCachePilot
namespace Family636MainPilot
theorem checked_75976_132 : validate cache_75976_132 75976 =
    some 76108 := by
  decide +kernel
theorem checked_76108_133 : validate cache_76108_133 76108 =
    some 76241 := by
  decide +kernel
theorem checked_75976_265 : validate cache_75976_265 75976 =
    some 76241 := by
  exact validate_branch 132 cache_75976_132 cache_76108_133
    75976 76108 76241
    checked_75976_132 rfl checked_76108_133
theorem checked : validate cache 75976 = some 76241 :=
  checked_75976_265
end Family636MainPilot
open LookupCachePilot
namespace Family637MainPilot
theorem checked_76241_5 : validate cache_76241_5 76241 =
    some 76246 := by
  decide +kernel
theorem checked : validate cache 76241 = some 76246 :=
  checked_76241_5
end Family637MainPilot
open LookupCachePilot
namespace Family638MainPilot
theorem checked_76246_10 : validate cache_76246_10 76246 =
    some 76256 := by
  decide +kernel
theorem checked : validate cache 76246 = some 76256 :=
  checked_76246_10
end Family638MainPilot
open LookupCachePilot
namespace Family639MainPilot
theorem checked_76256_185 : validate cache_76256_185 76256 =
    some 76441 := by
  decide +kernel
theorem checked_76441_185 : validate cache_76441_185 76441 =
    some 76626 := by
  decide +kernel
theorem checked_76256_370 : validate cache_76256_370 76256 =
    some 76626 := by
  exact validate_branch 185 cache_76256_185 cache_76441_185
    76256 76441 76626
    checked_76256_185 rfl checked_76441_185
theorem checked : validate cache 76256 = some 76626 :=
  checked_76256_370
end Family639MainPilot
open LookupCachePilot
namespace Family640MainPilot
theorem checked_76626_220 : validate cache_76626_220 76626 =
    some 76846 := by
  decide +kernel
theorem checked_76846_220 : validate cache_76846_220 76846 =
    some 77066 := by
  decide +kernel
theorem checked_76626_440 : validate cache_76626_440 76626 =
    some 77066 := by
  exact validate_branch 220 cache_76626_220 cache_76846_220
    76626 76846 77066
    checked_76626_220 rfl checked_76846_220
theorem checked : validate cache 76626 = some 77066 :=
  checked_76626_440
end Family640MainPilot
open LookupCachePilot
namespace Family641MainPilot
theorem checked_77066_70 : validate cache_77066_70 77066 =
    some 77136 := by
  decide +kernel
theorem checked : validate cache 77066 = some 77136 :=
  checked_77066_70
end Family641MainPilot
open LookupCachePilot
namespace Family642MainPilot
theorem checked_77136_195 : validate cache_77136_195 77136 =
    some 77331 := by
  decide +kernel
theorem checked : validate cache 77136 = some 77331 :=
  checked_77136_195
end Family642MainPilot
open LookupCachePilot
namespace Family643MainPilot
theorem checked_77331_70 : validate cache_77331_70 77331 =
    some 77401 := by
  decide +kernel
theorem checked : validate cache 77331 = some 77401 :=
  checked_77331_70
end Family643MainPilot
open LookupCachePilot
namespace Family644MainPilot
theorem checked_77401_200 : validate cache_77401_200 77401 =
    some 77601 := by
  decide +kernel
theorem checked_77601_200 : validate cache_77601_200 77601 =
    some 77801 := by
  decide +kernel
theorem checked_77401_400 : validate cache_77401_400 77401 =
    some 77801 := by
  exact validate_branch 200 cache_77401_200 cache_77601_200
    77401 77601 77801
    checked_77401_200 rfl checked_77601_200
theorem checked : validate cache 77401 = some 77801 :=
  checked_77401_400
end Family644MainPilot
open LookupCachePilot
namespace Family645MainPilot
theorem checked_77801_5 : validate cache_77801_5 77801 =
    some 77806 := by
  decide +kernel
theorem checked : validate cache 77801 = some 77806 :=
  checked_77801_5
end Family645MainPilot
open LookupCachePilot
namespace Family646MainPilot
theorem checked_77806_70 : validate cache_77806_70 77806 =
    some 77876 := by
  decide +kernel
theorem checked : validate cache 77806 = some 77876 :=
  checked_77806_70
end Family646MainPilot
open LookupCachePilot
namespace Family647MainPilot
theorem checked_77876_185 : validate cache_77876_185 77876 =
    some 78061 := by
  decide +kernel
theorem checked_78061_185 : validate cache_78061_185 78061 =
    some 78246 := by
  decide +kernel
theorem checked_77876_370 : validate cache_77876_370 77876 =
    some 78246 := by
  exact validate_branch 185 cache_77876_185 cache_78061_185
    77876 78061 78246
    checked_77876_185 rfl checked_78061_185
theorem checked : validate cache 77876 = some 78246 :=
  checked_77876_370
end Family647MainPilot
open LookupCachePilot
namespace Family648MainPilot
theorem checked_78246_5 : validate cache_78246_5 78246 =
    some 78251 := by
  decide +kernel
theorem checked : validate cache 78246 = some 78251 :=
  checked_78246_5
end Family648MainPilot
open LookupCachePilot
namespace Family649MainPilot
theorem checked_78251_70 : validate cache_78251_70 78251 =
    some 78321 := by
  decide +kernel
theorem checked : validate cache 78251 = some 78321 :=
  checked_78251_70
end Family649MainPilot
open LookupCachePilot
namespace Family650MainPilot
theorem checked_78321_200 : validate cache_78321_200 78321 =
    some 78521 := by
  decide +kernel
theorem checked_78521_200 : validate cache_78521_200 78521 =
    some 78721 := by
  decide +kernel
theorem checked_78321_400 : validate cache_78321_400 78321 =
    some 78721 := by
  exact validate_branch 200 cache_78321_200 cache_78521_200
    78321 78521 78721
    checked_78321_200 rfl checked_78521_200
theorem checked : validate cache 78321 = some 78721 :=
  checked_78321_400
end Family650MainPilot
open LookupCachePilot
namespace Family651MainPilot
theorem checked_78721_5 : validate cache_78721_5 78721 =
    some 78726 := by
  decide +kernel
theorem checked : validate cache 78721 = some 78726 :=
  checked_78721_5
end Family651MainPilot
open LookupCachePilot
namespace Family652MainPilot
theorem checked_78726_10 : validate cache_78726_10 78726 =
    some 78736 := by
  decide +kernel
theorem checked : validate cache 78726 = some 78736 :=
  checked_78726_10
end Family652MainPilot
open LookupCachePilot
namespace Family653MainPilot
theorem checked_78736_167 : validate cache_78736_167 78736 =
    some 78903 := by
  decide +kernel
theorem checked_78903_168 : validate cache_78903_168 78903 =
    some 79071 := by
  decide +kernel
theorem checked_78736_335 : validate cache_78736_335 78736 =
    some 79071 := by
  exact validate_branch 167 cache_78736_167 cache_78903_168
    78736 78903 79071
    checked_78736_167 rfl checked_78903_168
theorem checked_79071_167 : validate cache_79071_167 79071 =
    some 79238 := by
  decide +kernel
theorem checked_79238_168 : validate cache_79238_168 79238 =
    some 79406 := by
  decide +kernel
theorem checked_79071_335 : validate cache_79071_335 79071 =
    some 79406 := by
  exact validate_branch 167 cache_79071_167 cache_79238_168
    79071 79238 79406
    checked_79071_167 rfl checked_79238_168
theorem checked_78736_670 : validate cache_78736_670 78736 =
    some 79406 := by
  exact validate_branch 335 cache_78736_335 cache_79071_335
    78736 79071 79406
    checked_78736_335 rfl checked_79071_335
theorem checked : validate cache 78736 = some 79406 :=
  checked_78736_670
end Family653MainPilot
open LookupCachePilot
namespace Family654MainPilot
theorem checked_79406_177 : validate cache_79406_177 79406 =
    some 79583 := by
  decide +kernel
theorem checked_79583_178 : validate cache_79583_178 79583 =
    some 79761 := by
  decide +kernel
theorem checked_79406_355 : validate cache_79406_355 79406 =
    some 79761 := by
  exact validate_branch 177 cache_79406_177 cache_79583_178
    79406 79583 79761
    checked_79406_177 rfl checked_79583_178
theorem checked_79761_177 : validate cache_79761_177 79761 =
    some 79938 := by
  decide +kernel
theorem checked_79938_178 : validate cache_79938_178 79938 =
    some 80116 := by
  decide +kernel
theorem checked_79761_355 : validate cache_79761_355 79761 =
    some 80116 := by
  exact validate_branch 177 cache_79761_177 cache_79938_178
    79761 79938 80116
    checked_79761_177 rfl checked_79938_178
theorem checked_79406_710 : validate cache_79406_710 79406 =
    some 80116 := by
  exact validate_branch 355 cache_79406_355 cache_79761_355
    79406 79761 80116
    checked_79406_355 rfl checked_79761_355
theorem checked : validate cache 79406 = some 80116 :=
  checked_79406_710
end Family654MainPilot
open LookupCachePilot
namespace Family655MainPilot
theorem checked_80116_70 : validate cache_80116_70 80116 =
    some 80186 := by
  decide +kernel
theorem checked : validate cache 80116 = some 80186 :=
  checked_80116_70
end Family655MainPilot
open LookupCachePilot
namespace Family656MainPilot
theorem checked_80186_195 : validate cache_80186_195 80186 =
    some 80381 := by
  decide +kernel
theorem checked : validate cache 80186 = some 80381 :=
  checked_80186_195
end Family656MainPilot
open LookupCachePilot
namespace Family657MainPilot
theorem checked_80381_70 : validate cache_80381_70 80381 =
    some 80451 := by
  decide +kernel
theorem checked : validate cache 80381 = some 80451 :=
  checked_80381_70
end Family657MainPilot
open LookupCachePilot
namespace Family658MainPilot
theorem checked_80451_167 : validate cache_80451_167 80451 =
    some 80618 := by
  decide +kernel
theorem checked_80618_168 : validate cache_80618_168 80618 =
    some 80786 := by
  decide +kernel
theorem checked_80451_335 : validate cache_80451_335 80451 =
    some 80786 := by
  exact validate_branch 167 cache_80451_167 cache_80618_168
    80451 80618 80786
    checked_80451_167 rfl checked_80618_168
theorem checked_80786_167 : validate cache_80786_167 80786 =
    some 80953 := by
  decide +kernel
theorem checked_80953_168 : validate cache_80953_168 80953 =
    some 81121 := by
  decide +kernel
theorem checked_80786_335 : validate cache_80786_335 80786 =
    some 81121 := by
  exact validate_branch 167 cache_80786_167 cache_80953_168
    80786 80953 81121
    checked_80786_167 rfl checked_80953_168
theorem checked_80451_670 : validate cache_80451_670 80451 =
    some 81121 := by
  exact validate_branch 335 cache_80451_335 cache_80786_335
    80451 80786 81121
    checked_80451_335 rfl checked_80786_335
theorem checked : validate cache 80451 = some 81121 :=
  checked_80451_670
end Family658MainPilot
open LookupCachePilot
namespace Family659MainPilot
theorem checked_81121_5 : validate cache_81121_5 81121 =
    some 81126 := by
  decide +kernel
theorem checked : validate cache 81121 = some 81126 :=
  checked_81121_5
end Family659MainPilot
open LookupCachePilot
namespace Family660MainPilot
theorem checked_81126_70 : validate cache_81126_70 81126 =
    some 81196 := by
  decide +kernel
theorem checked : validate cache 81126 = some 81196 :=
  checked_81126_70
end Family660MainPilot
open LookupCachePilot
namespace Family661MainPilot
theorem checked_81196_167 : validate cache_81196_167 81196 =
    some 81363 := by
  decide +kernel
theorem checked_81363_168 : validate cache_81363_168 81363 =
    some 81531 := by
  decide +kernel
theorem checked_81196_335 : validate cache_81196_335 81196 =
    some 81531 := by
  exact validate_branch 167 cache_81196_167 cache_81363_168
    81196 81363 81531
    checked_81196_167 rfl checked_81363_168
theorem checked_81531_167 : validate cache_81531_167 81531 =
    some 81698 := by
  decide +kernel
theorem checked_81698_168 : validate cache_81698_168 81698 =
    some 81866 := by
  decide +kernel
theorem checked_81531_335 : validate cache_81531_335 81531 =
    some 81866 := by
  exact validate_branch 167 cache_81531_167 cache_81698_168
    81531 81698 81866
    checked_81531_167 rfl checked_81698_168
theorem checked_81196_670 : validate cache_81196_670 81196 =
    some 81866 := by
  exact validate_branch 335 cache_81196_335 cache_81531_335
    81196 81531 81866
    checked_81196_335 rfl checked_81531_335
theorem checked : validate cache 81196 = some 81866 :=
  checked_81196_670
end Family661MainPilot
open LookupCachePilot
namespace Family662MainPilot
theorem checked_81866_70 : validate cache_81866_70 81866 =
    some 81936 := by
  decide +kernel
theorem checked : validate cache 81866 = some 81936 :=
  checked_81866_70
end Family662MainPilot
namespace FamilyViews006Pilot
noncomputable def windows_585 : List WorkingViewPilot.Window := [
  ⟨65566, 66236, Family585MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_585 : WorkingViewPilot.checks windows_585 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨65566, 66236, Family585MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      65566 66236 Family585MainPilot.cache
      Family585MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_585 : ∀ w ∈ windows_585, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_585 checked_585
noncomputable def fromRaw_585 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_585) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_585 checked_585 q raw nodes returns truth
noncomputable def windows_586 : List WorkingViewPilot.Window := [
  ⟨66236, 66241, Family586MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_586 : WorkingViewPilot.checks windows_586 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨66236, 66241, Family586MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      66236 66241 Family586MainPilot.cache
      Family586MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_586 : ∀ w ∈ windows_586, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_586 checked_586
noncomputable def fromRaw_586 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_586) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_586 checked_586 q raw nodes returns truth
noncomputable def windows_587 : List WorkingViewPilot.Window := [
  ⟨66241, 66311, Family587MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_587 : WorkingViewPilot.checks windows_587 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨66241, 66311, Family587MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      66241 66311 Family587MainPilot.cache
      Family587MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_587 : ∀ w ∈ windows_587, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_587 checked_587
noncomputable def fromRaw_587 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_587) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_587 checked_587 q raw nodes returns truth
noncomputable def windows_588 : List WorkingViewPilot.Window := [
  ⟨66311, 66981, Family588MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_588 : WorkingViewPilot.checks windows_588 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨66311, 66981, Family588MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      66311 66981 Family588MainPilot.cache
      Family588MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_588 : ∀ w ∈ windows_588, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_588 checked_588
noncomputable def fromRaw_588 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_588) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_588 checked_588 q raw nodes returns truth
noncomputable def windows_589 : List WorkingViewPilot.Window := [
  ⟨66981, 66986, Family589MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_589 : WorkingViewPilot.checks windows_589 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨66981, 66986, Family589MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      66981 66986 Family589MainPilot.cache
      Family589MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_589 : ∀ w ∈ windows_589, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_589 checked_589
noncomputable def fromRaw_589 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_589) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_589 checked_589 q raw nodes returns truth
noncomputable def windows_590 : List WorkingViewPilot.Window := [
  ⟨66986, 67056, Family590MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_590 : WorkingViewPilot.checks windows_590 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨66986, 67056, Family590MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      66986 67056 Family590MainPilot.cache
      Family590MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_590 : ∀ w ∈ windows_590, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_590 checked_590
noncomputable def fromRaw_590 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_590) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_590 checked_590 q raw nodes returns truth
noncomputable def windows_591 : List WorkingViewPilot.Window := [
  ⟨67056, 67276, Family591MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_591 : WorkingViewPilot.checks windows_591 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨67056, 67276, Family591MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      67056 67276 Family591MainPilot.cache
      Family591MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_591 : ∀ w ∈ windows_591, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_591 checked_591
noncomputable def fromRaw_591 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_591) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_591 checked_591 q raw nodes returns truth
noncomputable def windows_592 : List WorkingViewPilot.Window := [
  ⟨67276, 67281, Family592MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_592 : WorkingViewPilot.checks windows_592 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨67276, 67281, Family592MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      67276 67281 Family592MainPilot.cache
      Family592MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_592 : ∀ w ∈ windows_592, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_592 checked_592
noncomputable def fromRaw_592 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_592) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_592 checked_592 q raw nodes returns truth
noncomputable def windows_593 : List WorkingViewPilot.Window := [
  ⟨67281, 67351, Family593MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_593 : WorkingViewPilot.checks windows_593 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨67281, 67351, Family593MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      67281 67351 Family593MainPilot.cache
      Family593MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_593 : ∀ w ∈ windows_593, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_593 checked_593
noncomputable def fromRaw_593 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_593) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_593 checked_593 q raw nodes returns truth
noncomputable def windows_594 : List WorkingViewPilot.Window := [
  ⟨67351, 67616, Family594MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_594 : WorkingViewPilot.checks windows_594 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨67351, 67616, Family594MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      67351 67616 Family594MainPilot.cache
      Family594MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_594 : ∀ w ∈ windows_594, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_594 checked_594
noncomputable def fromRaw_594 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_594) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_594 checked_594 q raw nodes returns truth
noncomputable def windows_595 : List WorkingViewPilot.Window := [
  ⟨67616, 67621, Family595MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_595 : WorkingViewPilot.checks windows_595 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨67616, 67621, Family595MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      67616 67621 Family595MainPilot.cache
      Family595MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_595 : ∀ w ∈ windows_595, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_595 checked_595
noncomputable def fromRaw_595 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_595) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_595 checked_595 q raw nodes returns truth
noncomputable def windows_596 : List WorkingViewPilot.Window := [
  ⟨67621, 67631, Family596MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_596 : WorkingViewPilot.checks windows_596 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨67621, 67631, Family596MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      67621 67631 Family596MainPilot.cache
      Family596MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_596 : ∀ w ∈ windows_596, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_596 checked_596
noncomputable def fromRaw_596 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_596) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_596 checked_596 q raw nodes returns truth
noncomputable def windows_597 : List WorkingViewPilot.Window := [
  ⟨67631, 68001, Family597MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_597 : WorkingViewPilot.checks windows_597 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨67631, 68001, Family597MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      67631 68001 Family597MainPilot.cache
      Family597MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_597 : ∀ w ∈ windows_597, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_597 checked_597
noncomputable def fromRaw_597 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_597) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_597 checked_597 q raw nodes returns truth
noncomputable def windows_598 : List WorkingViewPilot.Window := [
  ⟨68001, 68441, Family598MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_598 : WorkingViewPilot.checks windows_598 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨68001, 68441, Family598MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      68001 68441 Family598MainPilot.cache
      Family598MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_598 : ∀ w ∈ windows_598, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_598 checked_598
noncomputable def fromRaw_598 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_598) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_598 checked_598 q raw nodes returns truth
noncomputable def windows_599 : List WorkingViewPilot.Window := [
  ⟨68441, 68511, Family599MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_599 : WorkingViewPilot.checks windows_599 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨68441, 68511, Family599MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      68441 68511 Family599MainPilot.cache
      Family599MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_599 : ∀ w ∈ windows_599, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_599 checked_599
noncomputable def fromRaw_599 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_599) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_599 checked_599 q raw nodes returns truth
noncomputable def windows_600 : List WorkingViewPilot.Window := [
  ⟨68511, 68706, Family600MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_600 : WorkingViewPilot.checks windows_600 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨68511, 68706, Family600MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      68511 68706 Family600MainPilot.cache
      Family600MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_600 : ∀ w ∈ windows_600, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_600 checked_600
noncomputable def fromRaw_600 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_600) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_600 checked_600 q raw nodes returns truth
noncomputable def windows_601 : List WorkingViewPilot.Window := [
  ⟨68706, 68776, Family601MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_601 : WorkingViewPilot.checks windows_601 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨68706, 68776, Family601MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      68706 68776 Family601MainPilot.cache
      Family601MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_601 : ∀ w ∈ windows_601, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_601 checked_601
noncomputable def fromRaw_601 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_601) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_601 checked_601 q raw nodes returns truth
noncomputable def windows_602 : List WorkingViewPilot.Window := [
  ⟨68776, 69176, Family602MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_602 : WorkingViewPilot.checks windows_602 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨68776, 69176, Family602MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      68776 69176 Family602MainPilot.cache
      Family602MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_602 : ∀ w ∈ windows_602, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_602 checked_602
noncomputable def fromRaw_602 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_602) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_602 checked_602 q raw nodes returns truth
noncomputable def windows_603 : List WorkingViewPilot.Window := [
  ⟨69176, 69181, Family603MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_603 : WorkingViewPilot.checks windows_603 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨69176, 69181, Family603MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      69176 69181 Family603MainPilot.cache
      Family603MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_603 : ∀ w ∈ windows_603, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_603 checked_603
noncomputable def fromRaw_603 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_603) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_603 checked_603 q raw nodes returns truth
noncomputable def windows_604 : List WorkingViewPilot.Window := [
  ⟨69181, 69251, Family604MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_604 : WorkingViewPilot.checks windows_604 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨69181, 69251, Family604MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      69181 69251 Family604MainPilot.cache
      Family604MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_604 : ∀ w ∈ windows_604, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_604 checked_604
noncomputable def fromRaw_604 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_604) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_604 checked_604 q raw nodes returns truth
noncomputable def windows_605 : List WorkingViewPilot.Window := [
  ⟨69251, 69621, Family605MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_605 : WorkingViewPilot.checks windows_605 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨69251, 69621, Family605MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      69251 69621 Family605MainPilot.cache
      Family605MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_605 : ∀ w ∈ windows_605, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_605 checked_605
noncomputable def fromRaw_605 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_605) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_605 checked_605 q raw nodes returns truth
noncomputable def windows_606 : List WorkingViewPilot.Window := [
  ⟨69621, 69626, Family606MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_606 : WorkingViewPilot.checks windows_606 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨69621, 69626, Family606MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      69621 69626 Family606MainPilot.cache
      Family606MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_606 : ∀ w ∈ windows_606, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_606 checked_606
noncomputable def fromRaw_606 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_606) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_606 checked_606 q raw nodes returns truth
noncomputable def windows_607 : List WorkingViewPilot.Window := [
  ⟨69626, 69696, Family607MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_607 : WorkingViewPilot.checks windows_607 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨69626, 69696, Family607MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      69626 69696 Family607MainPilot.cache
      Family607MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_607 : ∀ w ∈ windows_607, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_607 checked_607
noncomputable def fromRaw_607 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_607) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_607 checked_607 q raw nodes returns truth
noncomputable def windows_608 : List WorkingViewPilot.Window := [
  ⟨69696, 70096, Family608MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_608 : WorkingViewPilot.checks windows_608 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨69696, 70096, Family608MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      69696 70096 Family608MainPilot.cache
      Family608MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_608 : ∀ w ∈ windows_608, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_608 checked_608
noncomputable def fromRaw_608 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_608) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_608 checked_608 q raw nodes returns truth
noncomputable def windows_609 : List WorkingViewPilot.Window := [
  ⟨70096, 70101, Family609MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_609 : WorkingViewPilot.checks windows_609 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨70096, 70101, Family609MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      70096 70101 Family609MainPilot.cache
      Family609MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_609 : ∀ w ∈ windows_609, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_609 checked_609
noncomputable def fromRaw_609 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_609) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_609 checked_609 q raw nodes returns truth
noncomputable def windows_610 : List WorkingViewPilot.Window := [
  ⟨70101, 70111, Family610MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_610 : WorkingViewPilot.checks windows_610 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨70101, 70111, Family610MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      70101 70111 Family610MainPilot.cache
      Family610MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_610 : ∀ w ∈ windows_610, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_610 checked_610
noncomputable def fromRaw_610 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_610) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_610 checked_610 q raw nodes returns truth
noncomputable def windows_611 : List WorkingViewPilot.Window := [
  ⟨70111, 70631, Family611MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_611 : WorkingViewPilot.checks windows_611 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨70111, 70631, Family611MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      70111 70631 Family611MainPilot.cache
      Family611MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_611 : ∀ w ∈ windows_611, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_611 checked_611
noncomputable def fromRaw_611 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_611) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_611 checked_611 q raw nodes returns truth
noncomputable def windows_612 : List WorkingViewPilot.Window := [
  ⟨70631, 71206, Family612MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_612 : WorkingViewPilot.checks windows_612 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨70631, 71206, Family612MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      70631 71206 Family612MainPilot.cache
      Family612MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_612 : ∀ w ∈ windows_612, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_612 checked_612
noncomputable def fromRaw_612 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_612) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_612 checked_612 q raw nodes returns truth
noncomputable def windows_613 : List WorkingViewPilot.Window := [
  ⟨71206, 71276, Family613MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_613 : WorkingViewPilot.checks windows_613 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨71206, 71276, Family613MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      71206 71276 Family613MainPilot.cache
      Family613MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_613 : ∀ w ∈ windows_613, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_613 checked_613
noncomputable def fromRaw_613 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_613) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_613 checked_613 q raw nodes returns truth
noncomputable def windows_614 : List WorkingViewPilot.Window := [
  ⟨71276, 71471, Family614MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_614 : WorkingViewPilot.checks windows_614 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨71276, 71471, Family614MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      71276 71471 Family614MainPilot.cache
      Family614MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_614 : ∀ w ∈ windows_614, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_614 checked_614
noncomputable def fromRaw_614 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_614) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_614 checked_614 q raw nodes returns truth
noncomputable def windows_615 : List WorkingViewPilot.Window := [
  ⟨71471, 71541, Family615MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_615 : WorkingViewPilot.checks windows_615 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨71471, 71541, Family615MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      71471 71541 Family615MainPilot.cache
      Family615MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_615 : ∀ w ∈ windows_615, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_615 checked_615
noncomputable def fromRaw_615 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_615) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_615 checked_615 q raw nodes returns truth
noncomputable def windows_616 : List WorkingViewPilot.Window := [
  ⟨71541, 72076, Family616MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_616 : WorkingViewPilot.checks windows_616 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨71541, 72076, Family616MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      71541 72076 Family616MainPilot.cache
      Family616MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_616 : ∀ w ∈ windows_616, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_616 checked_616
noncomputable def fromRaw_616 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_616) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_616 checked_616 q raw nodes returns truth
noncomputable def windows_617 : List WorkingViewPilot.Window := [
  ⟨72076, 72081, Family617MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_617 : WorkingViewPilot.checks windows_617 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨72076, 72081, Family617MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      72076 72081 Family617MainPilot.cache
      Family617MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_617 : ∀ w ∈ windows_617, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_617 checked_617
noncomputable def fromRaw_617 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_617) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_617 checked_617 q raw nodes returns truth
noncomputable def windows_618 : List WorkingViewPilot.Window := [
  ⟨72081, 72151, Family618MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_618 : WorkingViewPilot.checks windows_618 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨72081, 72151, Family618MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      72081 72151 Family618MainPilot.cache
      Family618MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_618 : ∀ w ∈ windows_618, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_618 checked_618
noncomputable def fromRaw_618 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_618) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_618 checked_618 q raw nodes returns truth
noncomputable def windows_619 : List WorkingViewPilot.Window := [
  ⟨72151, 72371, Family619MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_619 : WorkingViewPilot.checks windows_619 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨72151, 72371, Family619MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      72151 72371 Family619MainPilot.cache
      Family619MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_619 : ∀ w ∈ windows_619, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_619 checked_619
noncomputable def fromRaw_619 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_619) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_619 checked_619 q raw nodes returns truth
noncomputable def windows_620 : List WorkingViewPilot.Window := [
  ⟨72371, 72441, Family620MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_620 : WorkingViewPilot.checks windows_620 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨72371, 72441, Family620MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      72371 72441 Family620MainPilot.cache
      Family620MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_620 : ∀ w ∈ windows_620, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_620 checked_620
noncomputable def fromRaw_620 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_620) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_620 checked_620 q raw nodes returns truth
noncomputable def windows_621 : List WorkingViewPilot.Window := [
  ⟨72441, 72706, Family621MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_621 : WorkingViewPilot.checks windows_621 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨72441, 72706, Family621MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      72441 72706 Family621MainPilot.cache
      Family621MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_621 : ∀ w ∈ windows_621, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_621 checked_621
noncomputable def fromRaw_621 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_621) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_621 checked_621 q raw nodes returns truth
noncomputable def windows_622 : List WorkingViewPilot.Window := [
  ⟨72706, 72711, Family622MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_622 : WorkingViewPilot.checks windows_622 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨72706, 72711, Family622MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      72706 72711 Family622MainPilot.cache
      Family622MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_622 : ∀ w ∈ windows_622, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_622 checked_622
noncomputable def fromRaw_622 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_622) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_622 checked_622 q raw nodes returns truth
noncomputable def windows_623 : List WorkingViewPilot.Window := [
  ⟨72711, 72781, Family623MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_623 : WorkingViewPilot.checks windows_623 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨72711, 72781, Family623MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      72711 72781 Family623MainPilot.cache
      Family623MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_623 : ∀ w ∈ windows_623, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_623 checked_623
noncomputable def fromRaw_623 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_623) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_623 checked_623 q raw nodes returns truth
noncomputable def windows_624 : List WorkingViewPilot.Window := [
  ⟨72781, 73451, Family624MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_624 : WorkingViewPilot.checks windows_624 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨72781, 73451, Family624MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      72781 73451 Family624MainPilot.cache
      Family624MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_624 : ∀ w ∈ windows_624, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_624 checked_624
noncomputable def fromRaw_624 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_624) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_624 checked_624 q raw nodes returns truth
noncomputable def windows_625 : List WorkingViewPilot.Window := [
  ⟨73451, 73521, Family625MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_625 : WorkingViewPilot.checks windows_625 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨73451, 73521, Family625MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      73451 73521 Family625MainPilot.cache
      Family625MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_625 : ∀ w ∈ windows_625, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_625 checked_625
noncomputable def fromRaw_625 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_625) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_625 checked_625 q raw nodes returns truth
noncomputable def windows_626 : List WorkingViewPilot.Window := [
  ⟨73521, 74191, Family626MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_626 : WorkingViewPilot.checks windows_626 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨73521, 74191, Family626MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      73521 74191 Family626MainPilot.cache
      Family626MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_626 : ∀ w ∈ windows_626, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_626 checked_626
noncomputable def fromRaw_626 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_626) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_626 checked_626 q raw nodes returns truth
noncomputable def windows_627 : List WorkingViewPilot.Window := [
  ⟨74191, 74861, Family627MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_627 : WorkingViewPilot.checks windows_627 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨74191, 74861, Family627MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      74191 74861 Family627MainPilot.cache
      Family627MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_627 : ∀ w ∈ windows_627, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_627 checked_627
noncomputable def fromRaw_627 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_627) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_627 checked_627 q raw nodes returns truth
noncomputable def windows_628 : List WorkingViewPilot.Window := [
  ⟨74861, 74866, Family628MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_628 : WorkingViewPilot.checks windows_628 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨74861, 74866, Family628MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      74861 74866 Family628MainPilot.cache
      Family628MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_628 : ∀ w ∈ windows_628, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_628 checked_628
noncomputable def fromRaw_628 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_628) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_628 checked_628 q raw nodes returns truth
noncomputable def windows_629 : List WorkingViewPilot.Window := [
  ⟨74866, 74936, Family629MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_629 : WorkingViewPilot.checks windows_629 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨74866, 74936, Family629MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      74866 74936 Family629MainPilot.cache
      Family629MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_629 : ∀ w ∈ windows_629, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_629 checked_629
noncomputable def fromRaw_629 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_629) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_629 checked_629 q raw nodes returns truth
noncomputable def windows_630 : List WorkingViewPilot.Window := [
  ⟨74936, 75606, Family630MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_630 : WorkingViewPilot.checks windows_630 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨74936, 75606, Family630MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      74936 75606 Family630MainPilot.cache
      Family630MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_630 : ∀ w ∈ windows_630, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_630 checked_630
noncomputable def fromRaw_630 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_630) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_630 checked_630 q raw nodes returns truth
noncomputable def windows_631 : List WorkingViewPilot.Window := [
  ⟨75606, 75611, Family631MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_631 : WorkingViewPilot.checks windows_631 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨75606, 75611, Family631MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      75606 75611 Family631MainPilot.cache
      Family631MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_631 : ∀ w ∈ windows_631, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_631 checked_631
noncomputable def fromRaw_631 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_631) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_631 checked_631 q raw nodes returns truth
noncomputable def windows_632 : List WorkingViewPilot.Window := [
  ⟨75611, 75681, Family632MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_632 : WorkingViewPilot.checks windows_632 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨75611, 75681, Family632MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      75611 75681 Family632MainPilot.cache
      Family632MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_632 : ∀ w ∈ windows_632, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_632 checked_632
noncomputable def fromRaw_632 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_632) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_632 checked_632 q raw nodes returns truth
noncomputable def windows_633 : List WorkingViewPilot.Window := [
  ⟨75681, 75901, Family633MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_633 : WorkingViewPilot.checks windows_633 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨75681, 75901, Family633MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      75681 75901 Family633MainPilot.cache
      Family633MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_633 : ∀ w ∈ windows_633, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_633 checked_633
noncomputable def fromRaw_633 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_633) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_633 checked_633 q raw nodes returns truth
noncomputable def windows_634 : List WorkingViewPilot.Window := [
  ⟨75901, 75906, Family634MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_634 : WorkingViewPilot.checks windows_634 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨75901, 75906, Family634MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      75901 75906 Family634MainPilot.cache
      Family634MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_634 : ∀ w ∈ windows_634, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_634 checked_634
noncomputable def fromRaw_634 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_634) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_634 checked_634 q raw nodes returns truth
noncomputable def windows_635 : List WorkingViewPilot.Window := [
  ⟨75906, 75976, Family635MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_635 : WorkingViewPilot.checks windows_635 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨75906, 75976, Family635MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      75906 75976 Family635MainPilot.cache
      Family635MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_635 : ∀ w ∈ windows_635, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_635 checked_635
noncomputable def fromRaw_635 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_635) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_635 checked_635 q raw nodes returns truth
noncomputable def windows_636 : List WorkingViewPilot.Window := [
  ⟨75976, 76241, Family636MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_636 : WorkingViewPilot.checks windows_636 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨75976, 76241, Family636MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      75976 76241 Family636MainPilot.cache
      Family636MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_636 : ∀ w ∈ windows_636, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_636 checked_636
noncomputable def fromRaw_636 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_636) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_636 checked_636 q raw nodes returns truth
noncomputable def windows_637 : List WorkingViewPilot.Window := [
  ⟨76241, 76246, Family637MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_637 : WorkingViewPilot.checks windows_637 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨76241, 76246, Family637MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      76241 76246 Family637MainPilot.cache
      Family637MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_637 : ∀ w ∈ windows_637, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_637 checked_637
noncomputable def fromRaw_637 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_637) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_637 checked_637 q raw nodes returns truth
noncomputable def windows_638 : List WorkingViewPilot.Window := [
  ⟨76246, 76256, Family638MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_638 : WorkingViewPilot.checks windows_638 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨76246, 76256, Family638MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      76246 76256 Family638MainPilot.cache
      Family638MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_638 : ∀ w ∈ windows_638, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_638 checked_638
noncomputable def fromRaw_638 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_638) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_638 checked_638 q raw nodes returns truth
noncomputable def windows_639 : List WorkingViewPilot.Window := [
  ⟨76256, 76626, Family639MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_639 : WorkingViewPilot.checks windows_639 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨76256, 76626, Family639MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      76256 76626 Family639MainPilot.cache
      Family639MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_639 : ∀ w ∈ windows_639, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_639 checked_639
noncomputable def fromRaw_639 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_639) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_639 checked_639 q raw nodes returns truth
noncomputable def windows_640 : List WorkingViewPilot.Window := [
  ⟨76626, 77066, Family640MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_640 : WorkingViewPilot.checks windows_640 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨76626, 77066, Family640MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      76626 77066 Family640MainPilot.cache
      Family640MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_640 : ∀ w ∈ windows_640, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_640 checked_640
noncomputable def fromRaw_640 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_640) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_640 checked_640 q raw nodes returns truth
noncomputable def windows_641 : List WorkingViewPilot.Window := [
  ⟨77066, 77136, Family641MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_641 : WorkingViewPilot.checks windows_641 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨77066, 77136, Family641MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      77066 77136 Family641MainPilot.cache
      Family641MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_641 : ∀ w ∈ windows_641, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_641 checked_641
noncomputable def fromRaw_641 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_641) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_641 checked_641 q raw nodes returns truth
noncomputable def windows_642 : List WorkingViewPilot.Window := [
  ⟨77136, 77331, Family642MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_642 : WorkingViewPilot.checks windows_642 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨77136, 77331, Family642MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      77136 77331 Family642MainPilot.cache
      Family642MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_642 : ∀ w ∈ windows_642, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_642 checked_642
noncomputable def fromRaw_642 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_642) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_642 checked_642 q raw nodes returns truth
noncomputable def windows_643 : List WorkingViewPilot.Window := [
  ⟨77331, 77401, Family643MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_643 : WorkingViewPilot.checks windows_643 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨77331, 77401, Family643MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      77331 77401 Family643MainPilot.cache
      Family643MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_643 : ∀ w ∈ windows_643, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_643 checked_643
noncomputable def fromRaw_643 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_643) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_643 checked_643 q raw nodes returns truth
noncomputable def windows_644 : List WorkingViewPilot.Window := [
  ⟨77401, 77801, Family644MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_644 : WorkingViewPilot.checks windows_644 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨77401, 77801, Family644MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      77401 77801 Family644MainPilot.cache
      Family644MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_644 : ∀ w ∈ windows_644, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_644 checked_644
noncomputable def fromRaw_644 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_644) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_644 checked_644 q raw nodes returns truth
noncomputable def windows_645 : List WorkingViewPilot.Window := [
  ⟨77801, 77806, Family645MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_645 : WorkingViewPilot.checks windows_645 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨77801, 77806, Family645MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      77801 77806 Family645MainPilot.cache
      Family645MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_645 : ∀ w ∈ windows_645, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_645 checked_645
noncomputable def fromRaw_645 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_645) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_645 checked_645 q raw nodes returns truth
noncomputable def windows_646 : List WorkingViewPilot.Window := [
  ⟨77806, 77876, Family646MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_646 : WorkingViewPilot.checks windows_646 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨77806, 77876, Family646MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      77806 77876 Family646MainPilot.cache
      Family646MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_646 : ∀ w ∈ windows_646, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_646 checked_646
noncomputable def fromRaw_646 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_646) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_646 checked_646 q raw nodes returns truth
noncomputable def windows_647 : List WorkingViewPilot.Window := [
  ⟨77876, 78246, Family647MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_647 : WorkingViewPilot.checks windows_647 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨77876, 78246, Family647MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      77876 78246 Family647MainPilot.cache
      Family647MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_647 : ∀ w ∈ windows_647, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_647 checked_647
noncomputable def fromRaw_647 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_647) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_647 checked_647 q raw nodes returns truth
noncomputable def windows_648 : List WorkingViewPilot.Window := [
  ⟨78246, 78251, Family648MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_648 : WorkingViewPilot.checks windows_648 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨78246, 78251, Family648MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      78246 78251 Family648MainPilot.cache
      Family648MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_648 : ∀ w ∈ windows_648, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_648 checked_648
noncomputable def fromRaw_648 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_648) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_648 checked_648 q raw nodes returns truth
noncomputable def windows_649 : List WorkingViewPilot.Window := [
  ⟨78251, 78321, Family649MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_649 : WorkingViewPilot.checks windows_649 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨78251, 78321, Family649MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      78251 78321 Family649MainPilot.cache
      Family649MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_649 : ∀ w ∈ windows_649, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_649 checked_649
noncomputable def fromRaw_649 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_649) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_649 checked_649 q raw nodes returns truth
noncomputable def windows_650 : List WorkingViewPilot.Window := [
  ⟨78321, 78721, Family650MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_650 : WorkingViewPilot.checks windows_650 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨78321, 78721, Family650MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      78321 78721 Family650MainPilot.cache
      Family650MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_650 : ∀ w ∈ windows_650, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_650 checked_650
noncomputable def fromRaw_650 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_650) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_650 checked_650 q raw nodes returns truth
noncomputable def windows_651 : List WorkingViewPilot.Window := [
  ⟨78721, 78726, Family651MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_651 : WorkingViewPilot.checks windows_651 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨78721, 78726, Family651MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      78721 78726 Family651MainPilot.cache
      Family651MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_651 : ∀ w ∈ windows_651, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_651 checked_651
noncomputable def fromRaw_651 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_651) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_651 checked_651 q raw nodes returns truth
noncomputable def windows_652 : List WorkingViewPilot.Window := [
  ⟨78726, 78736, Family652MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_652 : WorkingViewPilot.checks windows_652 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨78726, 78736, Family652MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      78726 78736 Family652MainPilot.cache
      Family652MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_652 : ∀ w ∈ windows_652, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_652 checked_652
noncomputable def fromRaw_652 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_652) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_652 checked_652 q raw nodes returns truth
noncomputable def windows_653 : List WorkingViewPilot.Window := [
  ⟨78736, 79406, Family653MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_653 : WorkingViewPilot.checks windows_653 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨78736, 79406, Family653MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      78736 79406 Family653MainPilot.cache
      Family653MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_653 : ∀ w ∈ windows_653, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_653 checked_653
noncomputable def fromRaw_653 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_653) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_653 checked_653 q raw nodes returns truth
noncomputable def windows_654 : List WorkingViewPilot.Window := [
  ⟨79406, 80116, Family654MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_654 : WorkingViewPilot.checks windows_654 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨79406, 80116, Family654MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      79406 80116 Family654MainPilot.cache
      Family654MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_654 : ∀ w ∈ windows_654, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_654 checked_654
noncomputable def fromRaw_654 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_654) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_654 checked_654 q raw nodes returns truth
noncomputable def windows_655 : List WorkingViewPilot.Window := [
  ⟨80116, 80186, Family655MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_655 : WorkingViewPilot.checks windows_655 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨80116, 80186, Family655MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      80116 80186 Family655MainPilot.cache
      Family655MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_655 : ∀ w ∈ windows_655, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_655 checked_655
noncomputable def fromRaw_655 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_655) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_655 checked_655 q raw nodes returns truth
noncomputable def windows_656 : List WorkingViewPilot.Window := [
  ⟨80186, 80381, Family656MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_656 : WorkingViewPilot.checks windows_656 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨80186, 80381, Family656MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      80186 80381 Family656MainPilot.cache
      Family656MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_656 : ∀ w ∈ windows_656, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_656 checked_656
noncomputable def fromRaw_656 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_656) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_656 checked_656 q raw nodes returns truth
noncomputable def windows_657 : List WorkingViewPilot.Window := [
  ⟨80381, 80451, Family657MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_657 : WorkingViewPilot.checks windows_657 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨80381, 80451, Family657MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      80381 80451 Family657MainPilot.cache
      Family657MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_657 : ∀ w ∈ windows_657, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_657 checked_657
noncomputable def fromRaw_657 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_657) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_657 checked_657 q raw nodes returns truth
noncomputable def windows_658 : List WorkingViewPilot.Window := [
  ⟨80451, 81121, Family658MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_658 : WorkingViewPilot.checks windows_658 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨80451, 81121, Family658MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      80451 81121 Family658MainPilot.cache
      Family658MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_658 : ∀ w ∈ windows_658, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_658 checked_658
noncomputable def fromRaw_658 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_658) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_658 checked_658 q raw nodes returns truth
noncomputable def windows_659 : List WorkingViewPilot.Window := [
  ⟨81121, 81126, Family659MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_659 : WorkingViewPilot.checks windows_659 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨81121, 81126, Family659MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      81121 81126 Family659MainPilot.cache
      Family659MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_659 : ∀ w ∈ windows_659, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_659 checked_659
noncomputable def fromRaw_659 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_659) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_659 checked_659 q raw nodes returns truth
noncomputable def windows_660 : List WorkingViewPilot.Window := [
  ⟨81126, 81196, Family660MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_660 : WorkingViewPilot.checks windows_660 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨81126, 81196, Family660MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      81126 81196 Family660MainPilot.cache
      Family660MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_660 : ∀ w ∈ windows_660, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_660 checked_660
noncomputable def fromRaw_660 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_660) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_660 checked_660 q raw nodes returns truth
noncomputable def windows_661 : List WorkingViewPilot.Window := [
  ⟨81196, 81866, Family661MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_661 : WorkingViewPilot.checks windows_661 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨81196, 81866, Family661MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      81196 81866 Family661MainPilot.cache
      Family661MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_661 : ∀ w ∈ windows_661, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_661 checked_661
noncomputable def fromRaw_661 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_661) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_661 checked_661 q raw nodes returns truth
noncomputable def windows_662 : List WorkingViewPilot.Window := [
  ⟨81866, 81936, Family662MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_662 : WorkingViewPilot.checks windows_662 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨81866, 81936, Family662MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      81866 81936 Family662MainPilot.cache
      Family662MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_662 : ∀ w ∈ windows_662, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_662 checked_662
noncomputable def fromRaw_662 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_662) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_662 checked_662 q raw nodes returns truth
end FamilyViews006Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Quantified working-set batch fidelity checked"
