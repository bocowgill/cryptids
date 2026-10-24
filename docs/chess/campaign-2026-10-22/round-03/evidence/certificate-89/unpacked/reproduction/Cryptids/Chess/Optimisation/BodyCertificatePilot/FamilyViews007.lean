module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.FamilyViews007Data
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.WorkingViews
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.FamilyReturns

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace Family663MainPilot
theorem checked_81936_167 : validate cache_81936_167 81936 =
    some 82103 := by
  decide +kernel
theorem checked_82103_168 : validate cache_82103_168 82103 =
    some 82271 := by
  decide +kernel
theorem checked_81936_335 : validate cache_81936_335 81936 =
    some 82271 := by
  exact validate_branch 167 cache_81936_167 cache_82103_168
    81936 82103 82271
    checked_81936_167 rfl checked_82103_168
theorem checked_82271_167 : validate cache_82271_167 82271 =
    some 82438 := by
  decide +kernel
theorem checked_82438_168 : validate cache_82438_168 82438 =
    some 82606 := by
  decide +kernel
theorem checked_82271_335 : validate cache_82271_335 82271 =
    some 82606 := by
  exact validate_branch 167 cache_82271_167 cache_82438_168
    82271 82438 82606
    checked_82271_167 rfl checked_82438_168
theorem checked_81936_670 : validate cache_81936_670 81936 =
    some 82606 := by
  exact validate_branch 335 cache_81936_335 cache_82271_335
    81936 82271 82606
    checked_81936_335 rfl checked_82271_335
theorem checked : validate cache 81936 = some 82606 :=
  checked_81936_670
end Family663MainPilot
open LookupCachePilot
namespace Family664MainPilot
theorem checked_82606_185 : validate cache_82606_185 82606 =
    some 82791 := by
  decide +kernel
theorem checked_82791_185 : validate cache_82791_185 82791 =
    some 82976 := by
  decide +kernel
theorem checked_82606_370 : validate cache_82606_370 82606 =
    some 82976 := by
  exact validate_branch 185 cache_82606_185 cache_82791_185
    82606 82791 82976
    checked_82606_185 rfl checked_82791_185
theorem checked : validate cache 82606 = some 82976 :=
  checked_82606_370
end Family664MainPilot
open LookupCachePilot
namespace Family665MainPilot
theorem checked_82976_5 : validate cache_82976_5 82976 =
    some 82981 := by
  decide +kernel
theorem checked : validate cache 82976 = some 82981 :=
  checked_82976_5
end Family665MainPilot
open LookupCachePilot
namespace Family666MainPilot
theorem checked_82981_70 : validate cache_82981_70 82981 =
    some 83051 := by
  decide +kernel
theorem checked : validate cache 82981 = some 83051 :=
  checked_82981_70
end Family666MainPilot
open LookupCachePilot
namespace Family667MainPilot
theorem checked_83051_200 : validate cache_83051_200 83051 =
    some 83251 := by
  decide +kernel
theorem checked_83251_200 : validate cache_83251_200 83251 =
    some 83451 := by
  decide +kernel
theorem checked_83051_400 : validate cache_83051_400 83051 =
    some 83451 := by
  exact validate_branch 200 cache_83051_200 cache_83251_200
    83051 83251 83451
    checked_83051_200 rfl checked_83251_200
theorem checked : validate cache 83051 = some 83451 :=
  checked_83051_400
end Family667MainPilot
open LookupCachePilot
namespace Family668MainPilot
theorem checked_83451_5 : validate cache_83451_5 83451 =
    some 83456 := by
  decide +kernel
theorem checked : validate cache 83451 = some 83456 :=
  checked_83451_5
end Family668MainPilot
open LookupCachePilot
namespace Family669MainPilot
theorem checked_83456_10 : validate cache_83456_10 83456 =
    some 83466 := by
  decide +kernel
theorem checked : validate cache 83456 = some 83466 :=
  checked_83456_10
end Family669MainPilot
open LookupCachePilot
namespace Family670MainPilot
theorem checked_83466_167 : validate cache_83466_167 83466 =
    some 83633 := by
  decide +kernel
theorem checked_83633_168 : validate cache_83633_168 83633 =
    some 83801 := by
  decide +kernel
theorem checked_83466_335 : validate cache_83466_335 83466 =
    some 83801 := by
  exact validate_branch 167 cache_83466_167 cache_83633_168
    83466 83633 83801
    checked_83466_167 rfl checked_83633_168
theorem checked_83801_167 : validate cache_83801_167 83801 =
    some 83968 := by
  decide +kernel
theorem checked_83968_168 : validate cache_83968_168 83968 =
    some 84136 := by
  decide +kernel
theorem checked_83801_335 : validate cache_83801_335 83801 =
    some 84136 := by
  exact validate_branch 167 cache_83801_167 cache_83968_168
    83801 83968 84136
    checked_83801_167 rfl checked_83968_168
theorem checked_83466_670 : validate cache_83466_670 83466 =
    some 84136 := by
  exact validate_branch 335 cache_83466_335 cache_83801_335
    83466 83801 84136
    checked_83466_335 rfl checked_83801_335
theorem checked : validate cache 83466 = some 84136 :=
  checked_83466_670
end Family670MainPilot
open LookupCachePilot
namespace Family671MainPilot
theorem checked_84136_177 : validate cache_84136_177 84136 =
    some 84313 := by
  decide +kernel
theorem checked_84313_178 : validate cache_84313_178 84313 =
    some 84491 := by
  decide +kernel
theorem checked_84136_355 : validate cache_84136_355 84136 =
    some 84491 := by
  exact validate_branch 177 cache_84136_177 cache_84313_178
    84136 84313 84491
    checked_84136_177 rfl checked_84313_178
theorem checked_84491_177 : validate cache_84491_177 84491 =
    some 84668 := by
  decide +kernel
theorem checked_84668_178 : validate cache_84668_178 84668 =
    some 84846 := by
  decide +kernel
theorem checked_84491_355 : validate cache_84491_355 84491 =
    some 84846 := by
  exact validate_branch 177 cache_84491_177 cache_84668_178
    84491 84668 84846
    checked_84491_177 rfl checked_84668_178
theorem checked_84136_710 : validate cache_84136_710 84136 =
    some 84846 := by
  exact validate_branch 355 cache_84136_355 cache_84491_355
    84136 84491 84846
    checked_84136_355 rfl checked_84491_355
theorem checked : validate cache 84136 = some 84846 :=
  checked_84136_710
end Family671MainPilot
open LookupCachePilot
namespace Family672MainPilot
theorem checked_84846_70 : validate cache_84846_70 84846 =
    some 84916 := by
  decide +kernel
theorem checked : validate cache 84846 = some 84916 :=
  checked_84846_70
end Family672MainPilot
open LookupCachePilot
namespace Family673MainPilot
theorem checked_84916_195 : validate cache_84916_195 84916 =
    some 85111 := by
  decide +kernel
theorem checked : validate cache 84916 = some 85111 :=
  checked_84916_195
end Family673MainPilot
open LookupCachePilot
namespace Family674MainPilot
theorem checked_85111_70 : validate cache_85111_70 85111 =
    some 85181 := by
  decide +kernel
theorem checked : validate cache 85111 = some 85181 :=
  checked_85111_70
end Family674MainPilot
open LookupCachePilot
namespace Family675MainPilot
theorem checked_85181_167 : validate cache_85181_167 85181 =
    some 85348 := by
  decide +kernel
theorem checked_85348_168 : validate cache_85348_168 85348 =
    some 85516 := by
  decide +kernel
theorem checked_85181_335 : validate cache_85181_335 85181 =
    some 85516 := by
  exact validate_branch 167 cache_85181_167 cache_85348_168
    85181 85348 85516
    checked_85181_167 rfl checked_85348_168
theorem checked_85516_167 : validate cache_85516_167 85516 =
    some 85683 := by
  decide +kernel
theorem checked_85683_168 : validate cache_85683_168 85683 =
    some 85851 := by
  decide +kernel
theorem checked_85516_335 : validate cache_85516_335 85516 =
    some 85851 := by
  exact validate_branch 167 cache_85516_167 cache_85683_168
    85516 85683 85851
    checked_85516_167 rfl checked_85683_168
theorem checked_85181_670 : validate cache_85181_670 85181 =
    some 85851 := by
  exact validate_branch 335 cache_85181_335 cache_85516_335
    85181 85516 85851
    checked_85181_335 rfl checked_85516_335
theorem checked : validate cache 85181 = some 85851 :=
  checked_85181_670
end Family675MainPilot
open LookupCachePilot
namespace Family676MainPilot
theorem checked_85851_5 : validate cache_85851_5 85851 =
    some 85856 := by
  decide +kernel
theorem checked : validate cache 85851 = some 85856 :=
  checked_85851_5
end Family676MainPilot
open LookupCachePilot
namespace Family677MainPilot
theorem checked_85856_70 : validate cache_85856_70 85856 =
    some 85926 := by
  decide +kernel
theorem checked : validate cache 85856 = some 85926 :=
  checked_85856_70
end Family677MainPilot
open LookupCachePilot
namespace Family678MainPilot
theorem checked_85926_130 : validate cache_85926_130 85926 =
    some 86056 := by
  decide +kernel
theorem checked_86056_130 : validate cache_86056_130 86056 =
    some 86186 := by
  decide +kernel
theorem checked_85926_260 : validate cache_85926_260 85926 =
    some 86186 := by
  exact validate_branch 130 cache_85926_130 cache_86056_130
    85926 86056 86186
    checked_85926_130 rfl checked_86056_130
theorem checked_86186_130 : validate cache_86186_130 86186 =
    some 86316 := by
  decide +kernel
theorem checked_86316_130 : validate cache_86316_130 86316 =
    some 86446 := by
  decide +kernel
theorem checked_86186_260 : validate cache_86186_260 86186 =
    some 86446 := by
  exact validate_branch 130 cache_86186_130 cache_86316_130
    86186 86316 86446
    checked_86186_130 rfl checked_86316_130
theorem checked_85926_520 : validate cache_85926_520 85926 =
    some 86446 := by
  exact validate_branch 260 cache_85926_260 cache_86186_260
    85926 86186 86446
    checked_85926_260 rfl checked_86186_260
theorem checked : validate cache 85926 = some 86446 :=
  checked_85926_520
end Family678MainPilot
open LookupCachePilot
namespace Family679MainPilot
theorem checked_86446_70 : validate cache_86446_70 86446 =
    some 86516 := by
  decide +kernel
theorem checked : validate cache 86446 = some 86516 :=
  checked_86446_70
end Family679MainPilot
open LookupCachePilot
namespace Family680MainPilot
theorem checked_86516_133 : validate cache_86516_133 86516 =
    some 86649 := by
  decide +kernel
theorem checked_86649_134 : validate cache_86649_134 86649 =
    some 86783 := by
  decide +kernel
theorem checked_86516_267 : validate cache_86516_267 86516 =
    some 86783 := by
  exact validate_branch 133 cache_86516_133 cache_86649_134
    86516 86649 86783
    checked_86516_133 rfl checked_86649_134
theorem checked_86783_134 : validate cache_86783_134 86783 =
    some 86917 := by
  decide +kernel
theorem checked_86917_134 : validate cache_86917_134 86917 =
    some 87051 := by
  decide +kernel
theorem checked_86783_268 : validate cache_86783_268 86783 =
    some 87051 := by
  exact validate_branch 134 cache_86783_134 cache_86917_134
    86783 86917 87051
    checked_86783_134 rfl checked_86917_134
theorem checked_86516_535 : validate cache_86516_535 86516 =
    some 87051 := by
  exact validate_branch 267 cache_86516_267 cache_86783_268
    86516 86783 87051
    checked_86516_267 rfl checked_86783_268
theorem checked : validate cache 86516 = some 87051 :=
  checked_86516_535
end Family680MainPilot
open LookupCachePilot
namespace Family681MainPilot
theorem checked_87051_130 : validate cache_87051_130 87051 =
    some 87181 := by
  decide +kernel
theorem checked_87181_130 : validate cache_87181_130 87181 =
    some 87311 := by
  decide +kernel
theorem checked_87051_260 : validate cache_87051_260 87051 =
    some 87311 := by
  exact validate_branch 130 cache_87051_130 cache_87181_130
    87051 87181 87311
    checked_87051_130 rfl checked_87181_130
theorem checked_87311_130 : validate cache_87311_130 87311 =
    some 87441 := by
  decide +kernel
theorem checked_87441_130 : validate cache_87441_130 87441 =
    some 87571 := by
  decide +kernel
theorem checked_87311_260 : validate cache_87311_260 87311 =
    some 87571 := by
  exact validate_branch 130 cache_87311_130 cache_87441_130
    87311 87441 87571
    checked_87311_130 rfl checked_87441_130
theorem checked_87051_520 : validate cache_87051_520 87051 =
    some 87571 := by
  exact validate_branch 260 cache_87051_260 cache_87311_260
    87051 87311 87571
    checked_87051_260 rfl checked_87311_260
theorem checked : validate cache 87051 = some 87571 :=
  checked_87051_520
end Family681MainPilot
open LookupCachePilot
namespace Family682MainPilot
theorem checked_87571_5 : validate cache_87571_5 87571 =
    some 87576 := by
  decide +kernel
theorem checked : validate cache 87571 = some 87576 :=
  checked_87571_5
end Family682MainPilot
open LookupCachePilot
namespace Family683MainPilot
theorem checked_87576_70 : validate cache_87576_70 87576 =
    some 87646 := by
  decide +kernel
theorem checked : validate cache 87576 = some 87646 :=
  checked_87576_70
end Family683MainPilot
open LookupCachePilot
namespace Family684MainPilot
theorem checked_87646_133 : validate cache_87646_133 87646 =
    some 87779 := by
  decide +kernel
theorem checked_87779_134 : validate cache_87779_134 87779 =
    some 87913 := by
  decide +kernel
theorem checked_87646_267 : validate cache_87646_267 87646 =
    some 87913 := by
  exact validate_branch 133 cache_87646_133 cache_87779_134
    87646 87779 87913
    checked_87646_133 rfl checked_87779_134
theorem checked_87913_134 : validate cache_87913_134 87913 =
    some 88047 := by
  decide +kernel
theorem checked_88047_134 : validate cache_88047_134 88047 =
    some 88181 := by
  decide +kernel
theorem checked_87913_268 : validate cache_87913_268 87913 =
    some 88181 := by
  exact validate_branch 134 cache_87913_134 cache_88047_134
    87913 88047 88181
    checked_87913_134 rfl checked_88047_134
theorem checked_87646_535 : validate cache_87646_535 87646 =
    some 88181 := by
  exact validate_branch 267 cache_87646_267 cache_87913_268
    87646 87913 88181
    checked_87646_267 rfl checked_87913_268
theorem checked : validate cache 87646 = some 88181 :=
  checked_87646_535
end Family684MainPilot
open LookupCachePilot
namespace Family685MainPilot
theorem checked_88181_5 : validate cache_88181_5 88181 =
    some 88186 := by
  decide +kernel
theorem checked : validate cache 88181 = some 88186 :=
  checked_88181_5
end Family685MainPilot
open LookupCachePilot
namespace Family686MainPilot
theorem checked_88186_10 : validate cache_88186_10 88186 =
    some 88196 := by
  decide +kernel
theorem checked : validate cache 88186 = some 88196 :=
  checked_88186_10
end Family686MainPilot
open LookupCachePilot
namespace Family687MainPilot
theorem checked_88196_185 : validate cache_88196_185 88196 =
    some 88381 := by
  decide +kernel
theorem checked_88381_185 : validate cache_88381_185 88381 =
    some 88566 := by
  decide +kernel
theorem checked_88196_370 : validate cache_88196_370 88196 =
    some 88566 := by
  exact validate_branch 185 cache_88196_185 cache_88381_185
    88196 88381 88566
    checked_88196_185 rfl checked_88381_185
theorem checked : validate cache 88196 = some 88566 :=
  checked_88196_370
end Family687MainPilot
open LookupCachePilot
namespace Family688MainPilot
theorem checked_88566_220 : validate cache_88566_220 88566 =
    some 88786 := by
  decide +kernel
theorem checked_88786_220 : validate cache_88786_220 88786 =
    some 89006 := by
  decide +kernel
theorem checked_88566_440 : validate cache_88566_440 88566 =
    some 89006 := by
  exact validate_branch 220 cache_88566_220 cache_88786_220
    88566 88786 89006
    checked_88566_220 rfl checked_88786_220
theorem checked : validate cache 88566 = some 89006 :=
  checked_88566_440
end Family688MainPilot
open LookupCachePilot
namespace Family689MainPilot
theorem checked_89006_70 : validate cache_89006_70 89006 =
    some 89076 := by
  decide +kernel
theorem checked : validate cache 89006 = some 89076 :=
  checked_89006_70
end Family689MainPilot
open LookupCachePilot
namespace Family690MainPilot
theorem checked_89076_195 : validate cache_89076_195 89076 =
    some 89271 := by
  decide +kernel
theorem checked : validate cache 89076 = some 89271 :=
  checked_89076_195
end Family690MainPilot
open LookupCachePilot
namespace Family691MainPilot
theorem checked_89271_70 : validate cache_89271_70 89271 =
    some 89341 := by
  decide +kernel
theorem checked : validate cache 89271 = some 89341 :=
  checked_89271_70
end Family691MainPilot
open LookupCachePilot
namespace Family692MainPilot
theorem checked_89341_200 : validate cache_89341_200 89341 =
    some 89541 := by
  decide +kernel
theorem checked_89541_200 : validate cache_89541_200 89541 =
    some 89741 := by
  decide +kernel
theorem checked_89341_400 : validate cache_89341_400 89341 =
    some 89741 := by
  exact validate_branch 200 cache_89341_200 cache_89541_200
    89341 89541 89741
    checked_89341_200 rfl checked_89541_200
theorem checked : validate cache 89341 = some 89741 :=
  checked_89341_400
end Family692MainPilot
open LookupCachePilot
namespace Family693MainPilot
theorem checked_89741_5 : validate cache_89741_5 89741 =
    some 89746 := by
  decide +kernel
theorem checked : validate cache 89741 = some 89746 :=
  checked_89741_5
end Family693MainPilot
open LookupCachePilot
namespace Family694MainPilot
theorem checked_89746_70 : validate cache_89746_70 89746 =
    some 89816 := by
  decide +kernel
theorem checked : validate cache 89746 = some 89816 :=
  checked_89746_70
end Family694MainPilot
open LookupCachePilot
namespace Family695MainPilot
theorem checked_89816_185 : validate cache_89816_185 89816 =
    some 90001 := by
  decide +kernel
theorem checked_90001_185 : validate cache_90001_185 90001 =
    some 90186 := by
  decide +kernel
theorem checked_89816_370 : validate cache_89816_370 89816 =
    some 90186 := by
  exact validate_branch 185 cache_89816_185 cache_90001_185
    89816 90001 90186
    checked_89816_185 rfl checked_90001_185
theorem checked : validate cache 89816 = some 90186 :=
  checked_89816_370
end Family695MainPilot
open LookupCachePilot
namespace Family696MainPilot
theorem checked_90186_5 : validate cache_90186_5 90186 =
    some 90191 := by
  decide +kernel
theorem checked : validate cache 90186 = some 90191 :=
  checked_90186_5
end Family696MainPilot
open LookupCachePilot
namespace Family697MainPilot
theorem checked_90191_70 : validate cache_90191_70 90191 =
    some 90261 := by
  decide +kernel
theorem checked : validate cache 90191 = some 90261 :=
  checked_90191_70
end Family697MainPilot
open LookupCachePilot
namespace Family698MainPilot
theorem checked_90261_200 : validate cache_90261_200 90261 =
    some 90461 := by
  decide +kernel
theorem checked_90461_200 : validate cache_90461_200 90461 =
    some 90661 := by
  decide +kernel
theorem checked_90261_400 : validate cache_90261_400 90261 =
    some 90661 := by
  exact validate_branch 200 cache_90261_200 cache_90461_200
    90261 90461 90661
    checked_90261_200 rfl checked_90461_200
theorem checked : validate cache 90261 = some 90661 :=
  checked_90261_400
end Family698MainPilot
open LookupCachePilot
namespace Family699MainPilot
theorem checked_90661_5 : validate cache_90661_5 90661 =
    some 90666 := by
  decide +kernel
theorem checked : validate cache 90661 = some 90666 :=
  checked_90661_5
end Family699MainPilot
open LookupCachePilot
namespace Family700MainPilot
theorem checked_90666_10 : validate cache_90666_10 90666 =
    some 90676 := by
  decide +kernel
theorem checked : validate cache 90666 = some 90676 :=
  checked_90666_10
end Family700MainPilot
open LookupCachePilot
namespace Family701MainPilot
theorem checked_90676_220 : validate cache_90676_220 90676 =
    some 90896 := by
  decide +kernel
theorem checked : validate cache 90676 = some 90896 :=
  checked_90676_220
end Family701MainPilot
open LookupCachePilot
namespace Family702MainPilot
theorem checked_90896_152 : validate cache_90896_152 90896 =
    some 91048 := by
  decide +kernel
theorem checked_91048_153 : validate cache_91048_153 91048 =
    some 91201 := by
  decide +kernel
theorem checked_90896_305 : validate cache_90896_305 90896 =
    some 91201 := by
  exact validate_branch 152 cache_90896_152 cache_91048_153
    90896 91048 91201
    checked_90896_152 rfl checked_91048_153
theorem checked : validate cache 90896 = some 91201 :=
  checked_90896_305
end Family702MainPilot
open LookupCachePilot
namespace Family703MainPilot
theorem checked_91201_70 : validate cache_91201_70 91201 =
    some 91271 := by
  decide +kernel
theorem checked : validate cache 91201 = some 91271 :=
  checked_91201_70
end Family703MainPilot
open LookupCachePilot
namespace Family704MainPilot
theorem checked_91271_195 : validate cache_91271_195 91271 =
    some 91466 := by
  decide +kernel
theorem checked : validate cache 91271 = some 91466 :=
  checked_91271_195
end Family704MainPilot
open LookupCachePilot
namespace Family705MainPilot
theorem checked_91466_70 : validate cache_91466_70 91466 =
    some 91536 := by
  decide +kernel
theorem checked : validate cache 91466 = some 91536 :=
  checked_91466_70
end Family705MainPilot
open LookupCachePilot
namespace Family706MainPilot
theorem checked_91536_132 : validate cache_91536_132 91536 =
    some 91668 := by
  decide +kernel
theorem checked_91668_133 : validate cache_91668_133 91668 =
    some 91801 := by
  decide +kernel
theorem checked_91536_265 : validate cache_91536_265 91536 =
    some 91801 := by
  exact validate_branch 132 cache_91536_132 cache_91668_133
    91536 91668 91801
    checked_91536_132 rfl checked_91668_133
theorem checked : validate cache 91536 = some 91801 :=
  checked_91536_265
end Family706MainPilot
open LookupCachePilot
namespace Family707MainPilot
theorem checked_91801_5 : validate cache_91801_5 91801 =
    some 91806 := by
  decide +kernel
theorem checked : validate cache 91801 = some 91806 :=
  checked_91801_5
end Family707MainPilot
open LookupCachePilot
namespace Family708MainPilot
theorem checked_91806_70 : validate cache_91806_70 91806 =
    some 91876 := by
  decide +kernel
theorem checked : validate cache 91806 = some 91876 :=
  checked_91806_70
end Family708MainPilot
open LookupCachePilot
namespace Family709MainPilot
theorem checked_91876_167 : validate cache_91876_167 91876 =
    some 92043 := by
  decide +kernel
theorem checked_92043_168 : validate cache_92043_168 92043 =
    some 92211 := by
  decide +kernel
theorem checked_91876_335 : validate cache_91876_335 91876 =
    some 92211 := by
  exact validate_branch 167 cache_91876_167 cache_92043_168
    91876 92043 92211
    checked_91876_167 rfl checked_92043_168
theorem checked_92211_167 : validate cache_92211_167 92211 =
    some 92378 := by
  decide +kernel
theorem checked_92378_168 : validate cache_92378_168 92378 =
    some 92546 := by
  decide +kernel
theorem checked_92211_335 : validate cache_92211_335 92211 =
    some 92546 := by
  exact validate_branch 167 cache_92211_167 cache_92378_168
    92211 92378 92546
    checked_92211_167 rfl checked_92378_168
theorem checked_91876_670 : validate cache_91876_670 91876 =
    some 92546 := by
  exact validate_branch 335 cache_91876_335 cache_92211_335
    91876 92211 92546
    checked_91876_335 rfl checked_92211_335
theorem checked : validate cache 91876 = some 92546 :=
  checked_91876_670
end Family709MainPilot
open LookupCachePilot
namespace Family710MainPilot
theorem checked_92546_70 : validate cache_92546_70 92546 =
    some 92616 := by
  decide +kernel
theorem checked : validate cache 92546 = some 92616 :=
  checked_92546_70
end Family710MainPilot
open LookupCachePilot
namespace Family711MainPilot
theorem checked_92616_167 : validate cache_92616_167 92616 =
    some 92783 := by
  decide +kernel
theorem checked_92783_168 : validate cache_92783_168 92783 =
    some 92951 := by
  decide +kernel
theorem checked_92616_335 : validate cache_92616_335 92616 =
    some 92951 := by
  exact validate_branch 167 cache_92616_167 cache_92783_168
    92616 92783 92951
    checked_92616_167 rfl checked_92783_168
theorem checked_92951_167 : validate cache_92951_167 92951 =
    some 93118 := by
  decide +kernel
theorem checked_93118_168 : validate cache_93118_168 93118 =
    some 93286 := by
  decide +kernel
theorem checked_92951_335 : validate cache_92951_335 92951 =
    some 93286 := by
  exact validate_branch 167 cache_92951_167 cache_93118_168
    92951 93118 93286
    checked_92951_167 rfl checked_93118_168
theorem checked_92616_670 : validate cache_92616_670 92616 =
    some 93286 := by
  exact validate_branch 335 cache_92616_335 cache_92951_335
    92616 92951 93286
    checked_92616_335 rfl checked_92951_335
theorem checked : validate cache 92616 = some 93286 :=
  checked_92616_670
end Family711MainPilot
open LookupCachePilot
namespace Family712MainPilot
theorem checked_93286_167 : validate cache_93286_167 93286 =
    some 93453 := by
  decide +kernel
theorem checked_93453_168 : validate cache_93453_168 93453 =
    some 93621 := by
  decide +kernel
theorem checked_93286_335 : validate cache_93286_335 93286 =
    some 93621 := by
  exact validate_branch 167 cache_93286_167 cache_93453_168
    93286 93453 93621
    checked_93286_167 rfl checked_93453_168
theorem checked_93621_167 : validate cache_93621_167 93621 =
    some 93788 := by
  decide +kernel
theorem checked_93788_168 : validate cache_93788_168 93788 =
    some 93956 := by
  decide +kernel
theorem checked_93621_335 : validate cache_93621_335 93621 =
    some 93956 := by
  exact validate_branch 167 cache_93621_167 cache_93788_168
    93621 93788 93956
    checked_93621_167 rfl checked_93788_168
theorem checked_93286_670 : validate cache_93286_670 93286 =
    some 93956 := by
  exact validate_branch 335 cache_93286_335 cache_93621_335
    93286 93621 93956
    checked_93286_335 rfl checked_93621_335
theorem checked : validate cache 93286 = some 93956 :=
  checked_93286_670
end Family712MainPilot
open LookupCachePilot
namespace Family713MainPilot
theorem checked_93956_5 : validate cache_93956_5 93956 =
    some 93961 := by
  decide +kernel
theorem checked : validate cache 93956 = some 93961 :=
  checked_93956_5
end Family713MainPilot
open LookupCachePilot
namespace Family714MainPilot
theorem checked_93961_70 : validate cache_93961_70 93961 =
    some 94031 := by
  decide +kernel
theorem checked : validate cache 93961 = some 94031 :=
  checked_93961_70
end Family714MainPilot
open LookupCachePilot
namespace Family715MainPilot
theorem checked_94031_167 : validate cache_94031_167 94031 =
    some 94198 := by
  decide +kernel
theorem checked_94198_168 : validate cache_94198_168 94198 =
    some 94366 := by
  decide +kernel
theorem checked_94031_335 : validate cache_94031_335 94031 =
    some 94366 := by
  exact validate_branch 167 cache_94031_167 cache_94198_168
    94031 94198 94366
    checked_94031_167 rfl checked_94198_168
theorem checked_94366_167 : validate cache_94366_167 94366 =
    some 94533 := by
  decide +kernel
theorem checked_94533_168 : validate cache_94533_168 94533 =
    some 94701 := by
  decide +kernel
theorem checked_94366_335 : validate cache_94366_335 94366 =
    some 94701 := by
  exact validate_branch 167 cache_94366_167 cache_94533_168
    94366 94533 94701
    checked_94366_167 rfl checked_94533_168
theorem checked_94031_670 : validate cache_94031_670 94031 =
    some 94701 := by
  exact validate_branch 335 cache_94031_335 cache_94366_335
    94031 94366 94701
    checked_94031_335 rfl checked_94366_335
theorem checked : validate cache 94031 = some 94701 :=
  checked_94031_670
end Family715MainPilot
open LookupCachePilot
namespace Family716MainPilot
theorem checked_94701_5 : validate cache_94701_5 94701 =
    some 94706 := by
  decide +kernel
theorem checked : validate cache 94701 = some 94706 :=
  checked_94701_5
end Family716MainPilot
open LookupCachePilot
namespace Family717MainPilot
theorem checked_94706_10 : validate cache_94706_10 94706 =
    some 94716 := by
  decide +kernel
theorem checked : validate cache 94706 = some 94716 :=
  checked_94706_10
end Family717MainPilot
open LookupCachePilot
namespace Family718MainPilot
theorem checked_94716_185 : validate cache_94716_185 94716 =
    some 94901 := by
  decide +kernel
theorem checked_94901_185 : validate cache_94901_185 94901 =
    some 95086 := by
  decide +kernel
theorem checked_94716_370 : validate cache_94716_370 94716 =
    some 95086 := by
  exact validate_branch 185 cache_94716_185 cache_94901_185
    94716 94901 95086
    checked_94716_185 rfl checked_94901_185
theorem checked : validate cache 94716 = some 95086 :=
  checked_94716_370
end Family718MainPilot
open LookupCachePilot
namespace Family719MainPilot
theorem checked_95086_220 : validate cache_95086_220 95086 =
    some 95306 := by
  decide +kernel
theorem checked_95306_220 : validate cache_95306_220 95306 =
    some 95526 := by
  decide +kernel
theorem checked_95086_440 : validate cache_95086_440 95086 =
    some 95526 := by
  exact validate_branch 220 cache_95086_220 cache_95306_220
    95086 95306 95526
    checked_95086_220 rfl checked_95306_220
theorem checked : validate cache 95086 = some 95526 :=
  checked_95086_440
end Family719MainPilot
open LookupCachePilot
namespace Family720MainPilot
theorem checked_95526_70 : validate cache_95526_70 95526 =
    some 95596 := by
  decide +kernel
theorem checked : validate cache 95526 = some 95596 :=
  checked_95526_70
end Family720MainPilot
open LookupCachePilot
namespace Family721MainPilot
theorem checked_95596_195 : validate cache_95596_195 95596 =
    some 95791 := by
  decide +kernel
theorem checked : validate cache 95596 = some 95791 :=
  checked_95596_195
end Family721MainPilot
open LookupCachePilot
namespace Family722MainPilot
theorem checked_95791_70 : validate cache_95791_70 95791 =
    some 95861 := by
  decide +kernel
theorem checked : validate cache 95791 = some 95861 :=
  checked_95791_70
end Family722MainPilot
open LookupCachePilot
namespace Family723MainPilot
theorem checked_95861_200 : validate cache_95861_200 95861 =
    some 96061 := by
  decide +kernel
theorem checked_96061_200 : validate cache_96061_200 96061 =
    some 96261 := by
  decide +kernel
theorem checked_95861_400 : validate cache_95861_400 95861 =
    some 96261 := by
  exact validate_branch 200 cache_95861_200 cache_96061_200
    95861 96061 96261
    checked_95861_200 rfl checked_96061_200
theorem checked : validate cache 95861 = some 96261 :=
  checked_95861_400
end Family723MainPilot
open LookupCachePilot
namespace Family724MainPilot
theorem checked_96261_5 : validate cache_96261_5 96261 =
    some 96266 := by
  decide +kernel
theorem checked : validate cache 96261 = some 96266 :=
  checked_96261_5
end Family724MainPilot
open LookupCachePilot
namespace Family725MainPilot
theorem checked_96266_70 : validate cache_96266_70 96266 =
    some 96336 := by
  decide +kernel
theorem checked : validate cache 96266 = some 96336 :=
  checked_96266_70
end Family725MainPilot
open LookupCachePilot
namespace Family726MainPilot
theorem checked_96336_185 : validate cache_96336_185 96336 =
    some 96521 := by
  decide +kernel
theorem checked_96521_185 : validate cache_96521_185 96521 =
    some 96706 := by
  decide +kernel
theorem checked_96336_370 : validate cache_96336_370 96336 =
    some 96706 := by
  exact validate_branch 185 cache_96336_185 cache_96521_185
    96336 96521 96706
    checked_96336_185 rfl checked_96521_185
theorem checked : validate cache 96336 = some 96706 :=
  checked_96336_370
end Family726MainPilot
open LookupCachePilot
namespace Family727MainPilot
theorem checked_96706_5 : validate cache_96706_5 96706 =
    some 96711 := by
  decide +kernel
theorem checked : validate cache 96706 = some 96711 :=
  checked_96706_5
end Family727MainPilot
open LookupCachePilot
namespace Family728MainPilot
theorem checked_96711_70 : validate cache_96711_70 96711 =
    some 96781 := by
  decide +kernel
theorem checked : validate cache 96711 = some 96781 :=
  checked_96711_70
end Family728MainPilot
open LookupCachePilot
namespace Family729MainPilot
theorem checked_96781_200 : validate cache_96781_200 96781 =
    some 96981 := by
  decide +kernel
theorem checked_96981_200 : validate cache_96981_200 96981 =
    some 97181 := by
  decide +kernel
theorem checked_96781_400 : validate cache_96781_400 96781 =
    some 97181 := by
  exact validate_branch 200 cache_96781_200 cache_96981_200
    96781 96981 97181
    checked_96781_200 rfl checked_96981_200
theorem checked : validate cache 96781 = some 97181 :=
  checked_96781_400
end Family729MainPilot
open LookupCachePilot
namespace Family730MainPilot
theorem checked_97181_5 : validate cache_97181_5 97181 =
    some 97186 := by
  decide +kernel
theorem checked : validate cache 97181 = some 97186 :=
  checked_97181_5
end Family730MainPilot
open LookupCachePilot
namespace Family731MainPilot
theorem checked_97186_10 : validate cache_97186_10 97186 =
    some 97196 := by
  decide +kernel
theorem checked : validate cache 97186 = some 97196 :=
  checked_97186_10
end Family731MainPilot
open LookupCachePilot
namespace Family732MainPilot
theorem checked_97196_220 : validate cache_97196_220 97196 =
    some 97416 := by
  decide +kernel
theorem checked : validate cache 97196 = some 97416 :=
  checked_97196_220
end Family732MainPilot
open LookupCachePilot
namespace Family733MainPilot
theorem checked_97416_152 : validate cache_97416_152 97416 =
    some 97568 := by
  decide +kernel
theorem checked_97568_153 : validate cache_97568_153 97568 =
    some 97721 := by
  decide +kernel
theorem checked_97416_305 : validate cache_97416_305 97416 =
    some 97721 := by
  exact validate_branch 152 cache_97416_152 cache_97568_153
    97416 97568 97721
    checked_97416_152 rfl checked_97568_153
theorem checked : validate cache 97416 = some 97721 :=
  checked_97416_305
end Family733MainPilot
open LookupCachePilot
namespace Family734MainPilot
theorem checked_97721_70 : validate cache_97721_70 97721 =
    some 97791 := by
  decide +kernel
theorem checked : validate cache 97721 = some 97791 :=
  checked_97721_70
end Family734MainPilot
open LookupCachePilot
namespace Family735MainPilot
theorem checked_97791_195 : validate cache_97791_195 97791 =
    some 97986 := by
  decide +kernel
theorem checked : validate cache 97791 = some 97986 :=
  checked_97791_195
end Family735MainPilot
open LookupCachePilot
namespace Family736MainPilot
theorem checked_97986_70 : validate cache_97986_70 97986 =
    some 98056 := by
  decide +kernel
theorem checked : validate cache 97986 = some 98056 :=
  checked_97986_70
end Family736MainPilot
namespace FamilyViews007Pilot
noncomputable def windows_663 : List WorkingViewPilot.Window := [
  ⟨81936, 82606, Family663MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_663 : WorkingViewPilot.checks windows_663 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨81936, 82606, Family663MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family663MainPilot.cache 81936 =
          some 82606 ∧ 82606 ≤ 573802 from
          ⟨Family663MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_663 : ∀ w ∈ windows_663, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_663 checked_663
noncomputable def fromRaw_663 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_663) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_663 checked_663 q raw nodes returns truth
noncomputable def windows_664 : List WorkingViewPilot.Window := [
  ⟨82606, 82976, Family664MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_664 : WorkingViewPilot.checks windows_664 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨82606, 82976, Family664MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family664MainPilot.cache 82606 =
          some 82976 ∧ 82976 ≤ 573802 from
          ⟨Family664MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_664 : ∀ w ∈ windows_664, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_664 checked_664
noncomputable def fromRaw_664 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_664) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_664 checked_664 q raw nodes returns truth
noncomputable def windows_665 : List WorkingViewPilot.Window := [
  ⟨82976, 82981, Family665MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_665 : WorkingViewPilot.checks windows_665 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨82976, 82981, Family665MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family665MainPilot.cache 82976 =
          some 82981 ∧ 82981 ≤ 573802 from
          ⟨Family665MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_665 : ∀ w ∈ windows_665, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_665 checked_665
noncomputable def fromRaw_665 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_665) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_665 checked_665 q raw nodes returns truth
noncomputable def windows_666 : List WorkingViewPilot.Window := [
  ⟨82981, 83051, Family666MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_666 : WorkingViewPilot.checks windows_666 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨82981, 83051, Family666MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family666MainPilot.cache 82981 =
          some 83051 ∧ 83051 ≤ 573802 from
          ⟨Family666MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_666 : ∀ w ∈ windows_666, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_666 checked_666
noncomputable def fromRaw_666 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_666) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_666 checked_666 q raw nodes returns truth
noncomputable def windows_667 : List WorkingViewPilot.Window := [
  ⟨83051, 83451, Family667MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_667 : WorkingViewPilot.checks windows_667 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨83051, 83451, Family667MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family667MainPilot.cache 83051 =
          some 83451 ∧ 83451 ≤ 573802 from
          ⟨Family667MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_667 : ∀ w ∈ windows_667, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_667 checked_667
noncomputable def fromRaw_667 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_667) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_667 checked_667 q raw nodes returns truth
noncomputable def windows_668 : List WorkingViewPilot.Window := [
  ⟨83451, 83456, Family668MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_668 : WorkingViewPilot.checks windows_668 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨83451, 83456, Family668MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family668MainPilot.cache 83451 =
          some 83456 ∧ 83456 ≤ 573802 from
          ⟨Family668MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_668 : ∀ w ∈ windows_668, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_668 checked_668
noncomputable def fromRaw_668 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_668) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_668 checked_668 q raw nodes returns truth
noncomputable def windows_669 : List WorkingViewPilot.Window := [
  ⟨83456, 83466, Family669MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_669 : WorkingViewPilot.checks windows_669 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨83456, 83466, Family669MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family669MainPilot.cache 83456 =
          some 83466 ∧ 83466 ≤ 573802 from
          ⟨Family669MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_669 : ∀ w ∈ windows_669, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_669 checked_669
noncomputable def fromRaw_669 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_669) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_669 checked_669 q raw nodes returns truth
noncomputable def windows_670 : List WorkingViewPilot.Window := [
  ⟨83466, 84136, Family670MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_670 : WorkingViewPilot.checks windows_670 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨83466, 84136, Family670MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family670MainPilot.cache 83466 =
          some 84136 ∧ 84136 ≤ 573802 from
          ⟨Family670MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_670 : ∀ w ∈ windows_670, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_670 checked_670
noncomputable def fromRaw_670 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_670) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_670 checked_670 q raw nodes returns truth
noncomputable def windows_671 : List WorkingViewPilot.Window := [
  ⟨84136, 84846, Family671MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_671 : WorkingViewPilot.checks windows_671 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨84136, 84846, Family671MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family671MainPilot.cache 84136 =
          some 84846 ∧ 84846 ≤ 573802 from
          ⟨Family671MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_671 : ∀ w ∈ windows_671, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_671 checked_671
noncomputable def fromRaw_671 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_671) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_671 checked_671 q raw nodes returns truth
noncomputable def windows_672 : List WorkingViewPilot.Window := [
  ⟨84846, 84916, Family672MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_672 : WorkingViewPilot.checks windows_672 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨84846, 84916, Family672MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family672MainPilot.cache 84846 =
          some 84916 ∧ 84916 ≤ 573802 from
          ⟨Family672MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_672 : ∀ w ∈ windows_672, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_672 checked_672
noncomputable def fromRaw_672 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_672) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_672 checked_672 q raw nodes returns truth
noncomputable def windows_673 : List WorkingViewPilot.Window := [
  ⟨84916, 85111, Family673MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_673 : WorkingViewPilot.checks windows_673 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨84916, 85111, Family673MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family673MainPilot.cache 84916 =
          some 85111 ∧ 85111 ≤ 573802 from
          ⟨Family673MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_673 : ∀ w ∈ windows_673, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_673 checked_673
noncomputable def fromRaw_673 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_673) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_673 checked_673 q raw nodes returns truth
noncomputable def windows_674 : List WorkingViewPilot.Window := [
  ⟨85111, 85181, Family674MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_674 : WorkingViewPilot.checks windows_674 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨85111, 85181, Family674MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family674MainPilot.cache 85111 =
          some 85181 ∧ 85181 ≤ 573802 from
          ⟨Family674MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_674 : ∀ w ∈ windows_674, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_674 checked_674
noncomputable def fromRaw_674 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_674) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_674 checked_674 q raw nodes returns truth
noncomputable def windows_675 : List WorkingViewPilot.Window := [
  ⟨85181, 85851, Family675MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_675 : WorkingViewPilot.checks windows_675 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨85181, 85851, Family675MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family675MainPilot.cache 85181 =
          some 85851 ∧ 85851 ≤ 573802 from
          ⟨Family675MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_675 : ∀ w ∈ windows_675, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_675 checked_675
noncomputable def fromRaw_675 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_675) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_675 checked_675 q raw nodes returns truth
noncomputable def windows_676 : List WorkingViewPilot.Window := [
  ⟨85851, 85856, Family676MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_676 : WorkingViewPilot.checks windows_676 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨85851, 85856, Family676MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family676MainPilot.cache 85851 =
          some 85856 ∧ 85856 ≤ 573802 from
          ⟨Family676MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_676 : ∀ w ∈ windows_676, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_676 checked_676
noncomputable def fromRaw_676 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_676) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_676 checked_676 q raw nodes returns truth
noncomputable def windows_677 : List WorkingViewPilot.Window := [
  ⟨85856, 85926, Family677MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_677 : WorkingViewPilot.checks windows_677 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨85856, 85926, Family677MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family677MainPilot.cache 85856 =
          some 85926 ∧ 85926 ≤ 573802 from
          ⟨Family677MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_677 : ∀ w ∈ windows_677, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_677 checked_677
noncomputable def fromRaw_677 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_677) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_677 checked_677 q raw nodes returns truth
noncomputable def windows_678 : List WorkingViewPilot.Window := [
  ⟨85926, 86446, Family678MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_678 : WorkingViewPilot.checks windows_678 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨85926, 86446, Family678MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family678MainPilot.cache 85926 =
          some 86446 ∧ 86446 ≤ 573802 from
          ⟨Family678MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_678 : ∀ w ∈ windows_678, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_678 checked_678
noncomputable def fromRaw_678 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_678) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_678 checked_678 q raw nodes returns truth
noncomputable def windows_679 : List WorkingViewPilot.Window := [
  ⟨86446, 86516, Family679MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_679 : WorkingViewPilot.checks windows_679 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨86446, 86516, Family679MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family679MainPilot.cache 86446 =
          some 86516 ∧ 86516 ≤ 573802 from
          ⟨Family679MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_679 : ∀ w ∈ windows_679, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_679 checked_679
noncomputable def fromRaw_679 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_679) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_679 checked_679 q raw nodes returns truth
noncomputable def windows_680 : List WorkingViewPilot.Window := [
  ⟨86516, 87051, Family680MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_680 : WorkingViewPilot.checks windows_680 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨86516, 87051, Family680MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family680MainPilot.cache 86516 =
          some 87051 ∧ 87051 ≤ 573802 from
          ⟨Family680MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_680 : ∀ w ∈ windows_680, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_680 checked_680
noncomputable def fromRaw_680 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_680) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_680 checked_680 q raw nodes returns truth
noncomputable def windows_681 : List WorkingViewPilot.Window := [
  ⟨87051, 87571, Family681MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_681 : WorkingViewPilot.checks windows_681 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨87051, 87571, Family681MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family681MainPilot.cache 87051 =
          some 87571 ∧ 87571 ≤ 573802 from
          ⟨Family681MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_681 : ∀ w ∈ windows_681, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_681 checked_681
noncomputable def fromRaw_681 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_681) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_681 checked_681 q raw nodes returns truth
noncomputable def windows_682 : List WorkingViewPilot.Window := [
  ⟨87571, 87576, Family682MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_682 : WorkingViewPilot.checks windows_682 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨87571, 87576, Family682MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family682MainPilot.cache 87571 =
          some 87576 ∧ 87576 ≤ 573802 from
          ⟨Family682MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_682 : ∀ w ∈ windows_682, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_682 checked_682
noncomputable def fromRaw_682 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_682) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_682 checked_682 q raw nodes returns truth
noncomputable def windows_683 : List WorkingViewPilot.Window := [
  ⟨87576, 87646, Family683MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_683 : WorkingViewPilot.checks windows_683 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨87576, 87646, Family683MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family683MainPilot.cache 87576 =
          some 87646 ∧ 87646 ≤ 573802 from
          ⟨Family683MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_683 : ∀ w ∈ windows_683, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_683 checked_683
noncomputable def fromRaw_683 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_683) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_683 checked_683 q raw nodes returns truth
noncomputable def windows_684 : List WorkingViewPilot.Window := [
  ⟨87646, 88181, Family684MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_684 : WorkingViewPilot.checks windows_684 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨87646, 88181, Family684MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family684MainPilot.cache 87646 =
          some 88181 ∧ 88181 ≤ 573802 from
          ⟨Family684MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_684 : ∀ w ∈ windows_684, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_684 checked_684
noncomputable def fromRaw_684 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_684) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_684 checked_684 q raw nodes returns truth
noncomputable def windows_685 : List WorkingViewPilot.Window := [
  ⟨88181, 88186, Family685MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_685 : WorkingViewPilot.checks windows_685 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨88181, 88186, Family685MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family685MainPilot.cache 88181 =
          some 88186 ∧ 88186 ≤ 573802 from
          ⟨Family685MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_685 : ∀ w ∈ windows_685, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_685 checked_685
noncomputable def fromRaw_685 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_685) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_685 checked_685 q raw nodes returns truth
noncomputable def windows_686 : List WorkingViewPilot.Window := [
  ⟨88186, 88196, Family686MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_686 : WorkingViewPilot.checks windows_686 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨88186, 88196, Family686MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family686MainPilot.cache 88186 =
          some 88196 ∧ 88196 ≤ 573802 from
          ⟨Family686MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_686 : ∀ w ∈ windows_686, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_686 checked_686
noncomputable def fromRaw_686 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_686) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_686 checked_686 q raw nodes returns truth
noncomputable def windows_687 : List WorkingViewPilot.Window := [
  ⟨88196, 88566, Family687MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_687 : WorkingViewPilot.checks windows_687 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨88196, 88566, Family687MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family687MainPilot.cache 88196 =
          some 88566 ∧ 88566 ≤ 573802 from
          ⟨Family687MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_687 : ∀ w ∈ windows_687, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_687 checked_687
noncomputable def fromRaw_687 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_687) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_687 checked_687 q raw nodes returns truth
noncomputable def windows_688 : List WorkingViewPilot.Window := [
  ⟨88566, 89006, Family688MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_688 : WorkingViewPilot.checks windows_688 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨88566, 89006, Family688MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family688MainPilot.cache 88566 =
          some 89006 ∧ 89006 ≤ 573802 from
          ⟨Family688MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_688 : ∀ w ∈ windows_688, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_688 checked_688
noncomputable def fromRaw_688 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_688) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_688 checked_688 q raw nodes returns truth
noncomputable def windows_689 : List WorkingViewPilot.Window := [
  ⟨89006, 89076, Family689MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_689 : WorkingViewPilot.checks windows_689 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨89006, 89076, Family689MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family689MainPilot.cache 89006 =
          some 89076 ∧ 89076 ≤ 573802 from
          ⟨Family689MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_689 : ∀ w ∈ windows_689, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_689 checked_689
noncomputable def fromRaw_689 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_689) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_689 checked_689 q raw nodes returns truth
noncomputable def windows_690 : List WorkingViewPilot.Window := [
  ⟨89076, 89271, Family690MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_690 : WorkingViewPilot.checks windows_690 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨89076, 89271, Family690MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family690MainPilot.cache 89076 =
          some 89271 ∧ 89271 ≤ 573802 from
          ⟨Family690MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_690 : ∀ w ∈ windows_690, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_690 checked_690
noncomputable def fromRaw_690 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_690) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_690 checked_690 q raw nodes returns truth
noncomputable def windows_691 : List WorkingViewPilot.Window := [
  ⟨89271, 89341, Family691MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_691 : WorkingViewPilot.checks windows_691 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨89271, 89341, Family691MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family691MainPilot.cache 89271 =
          some 89341 ∧ 89341 ≤ 573802 from
          ⟨Family691MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_691 : ∀ w ∈ windows_691, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_691 checked_691
noncomputable def fromRaw_691 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_691) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_691 checked_691 q raw nodes returns truth
noncomputable def windows_692 : List WorkingViewPilot.Window := [
  ⟨89341, 89741, Family692MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_692 : WorkingViewPilot.checks windows_692 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨89341, 89741, Family692MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family692MainPilot.cache 89341 =
          some 89741 ∧ 89741 ≤ 573802 from
          ⟨Family692MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_692 : ∀ w ∈ windows_692, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_692 checked_692
noncomputable def fromRaw_692 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_692) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_692 checked_692 q raw nodes returns truth
noncomputable def windows_693 : List WorkingViewPilot.Window := [
  ⟨89741, 89746, Family693MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_693 : WorkingViewPilot.checks windows_693 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨89741, 89746, Family693MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family693MainPilot.cache 89741 =
          some 89746 ∧ 89746 ≤ 573802 from
          ⟨Family693MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_693 : ∀ w ∈ windows_693, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_693 checked_693
noncomputable def fromRaw_693 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_693) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_693 checked_693 q raw nodes returns truth
noncomputable def windows_694 : List WorkingViewPilot.Window := [
  ⟨89746, 89816, Family694MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_694 : WorkingViewPilot.checks windows_694 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨89746, 89816, Family694MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family694MainPilot.cache 89746 =
          some 89816 ∧ 89816 ≤ 573802 from
          ⟨Family694MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_694 : ∀ w ∈ windows_694, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_694 checked_694
noncomputable def fromRaw_694 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_694) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_694 checked_694 q raw nodes returns truth
noncomputable def windows_695 : List WorkingViewPilot.Window := [
  ⟨89816, 90186, Family695MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_695 : WorkingViewPilot.checks windows_695 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨89816, 90186, Family695MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family695MainPilot.cache 89816 =
          some 90186 ∧ 90186 ≤ 573802 from
          ⟨Family695MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_695 : ∀ w ∈ windows_695, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_695 checked_695
noncomputable def fromRaw_695 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_695) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_695 checked_695 q raw nodes returns truth
noncomputable def windows_696 : List WorkingViewPilot.Window := [
  ⟨90186, 90191, Family696MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_696 : WorkingViewPilot.checks windows_696 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨90186, 90191, Family696MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family696MainPilot.cache 90186 =
          some 90191 ∧ 90191 ≤ 573802 from
          ⟨Family696MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_696 : ∀ w ∈ windows_696, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_696 checked_696
noncomputable def fromRaw_696 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_696) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_696 checked_696 q raw nodes returns truth
noncomputable def windows_697 : List WorkingViewPilot.Window := [
  ⟨90191, 90261, Family697MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_697 : WorkingViewPilot.checks windows_697 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨90191, 90261, Family697MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family697MainPilot.cache 90191 =
          some 90261 ∧ 90261 ≤ 573802 from
          ⟨Family697MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_697 : ∀ w ∈ windows_697, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_697 checked_697
noncomputable def fromRaw_697 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_697) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_697 checked_697 q raw nodes returns truth
noncomputable def windows_698 : List WorkingViewPilot.Window := [
  ⟨90261, 90661, Family698MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_698 : WorkingViewPilot.checks windows_698 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨90261, 90661, Family698MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family698MainPilot.cache 90261 =
          some 90661 ∧ 90661 ≤ 573802 from
          ⟨Family698MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_698 : ∀ w ∈ windows_698, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_698 checked_698
noncomputable def fromRaw_698 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_698) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_698 checked_698 q raw nodes returns truth
noncomputable def windows_699 : List WorkingViewPilot.Window := [
  ⟨90661, 90666, Family699MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_699 : WorkingViewPilot.checks windows_699 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨90661, 90666, Family699MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family699MainPilot.cache 90661 =
          some 90666 ∧ 90666 ≤ 573802 from
          ⟨Family699MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_699 : ∀ w ∈ windows_699, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_699 checked_699
noncomputable def fromRaw_699 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_699) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_699 checked_699 q raw nodes returns truth
noncomputable def windows_700 : List WorkingViewPilot.Window := [
  ⟨90666, 90676, Family700MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_700 : WorkingViewPilot.checks windows_700 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨90666, 90676, Family700MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family700MainPilot.cache 90666 =
          some 90676 ∧ 90676 ≤ 573802 from
          ⟨Family700MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_700 : ∀ w ∈ windows_700, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_700 checked_700
noncomputable def fromRaw_700 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_700) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_700 checked_700 q raw nodes returns truth
noncomputable def windows_701 : List WorkingViewPilot.Window := [
  ⟨90676, 90896, Family701MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_701 : WorkingViewPilot.checks windows_701 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨90676, 90896, Family701MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family701MainPilot.cache 90676 =
          some 90896 ∧ 90896 ≤ 573802 from
          ⟨Family701MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_701 : ∀ w ∈ windows_701, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_701 checked_701
noncomputable def fromRaw_701 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_701) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_701 checked_701 q raw nodes returns truth
noncomputable def windows_702 : List WorkingViewPilot.Window := [
  ⟨90896, 91201, Family702MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_702 : WorkingViewPilot.checks windows_702 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨90896, 91201, Family702MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family702MainPilot.cache 90896 =
          some 91201 ∧ 91201 ≤ 573802 from
          ⟨Family702MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_702 : ∀ w ∈ windows_702, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_702 checked_702
noncomputable def fromRaw_702 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_702) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_702 checked_702 q raw nodes returns truth
noncomputable def windows_703 : List WorkingViewPilot.Window := [
  ⟨91201, 91271, Family703MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_703 : WorkingViewPilot.checks windows_703 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨91201, 91271, Family703MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family703MainPilot.cache 91201 =
          some 91271 ∧ 91271 ≤ 573802 from
          ⟨Family703MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_703 : ∀ w ∈ windows_703, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_703 checked_703
noncomputable def fromRaw_703 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_703) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_703 checked_703 q raw nodes returns truth
noncomputable def windows_704 : List WorkingViewPilot.Window := [
  ⟨91271, 91466, Family704MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_704 : WorkingViewPilot.checks windows_704 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨91271, 91466, Family704MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family704MainPilot.cache 91271 =
          some 91466 ∧ 91466 ≤ 573802 from
          ⟨Family704MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_704 : ∀ w ∈ windows_704, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_704 checked_704
noncomputable def fromRaw_704 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_704) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_704 checked_704 q raw nodes returns truth
noncomputable def windows_705 : List WorkingViewPilot.Window := [
  ⟨91466, 91536, Family705MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_705 : WorkingViewPilot.checks windows_705 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨91466, 91536, Family705MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family705MainPilot.cache 91466 =
          some 91536 ∧ 91536 ≤ 573802 from
          ⟨Family705MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_705 : ∀ w ∈ windows_705, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_705 checked_705
noncomputable def fromRaw_705 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_705) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_705 checked_705 q raw nodes returns truth
noncomputable def windows_706 : List WorkingViewPilot.Window := [
  ⟨91536, 91801, Family706MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_706 : WorkingViewPilot.checks windows_706 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨91536, 91801, Family706MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family706MainPilot.cache 91536 =
          some 91801 ∧ 91801 ≤ 573802 from
          ⟨Family706MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_706 : ∀ w ∈ windows_706, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_706 checked_706
noncomputable def fromRaw_706 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_706) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_706 checked_706 q raw nodes returns truth
noncomputable def windows_707 : List WorkingViewPilot.Window := [
  ⟨91801, 91806, Family707MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_707 : WorkingViewPilot.checks windows_707 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨91801, 91806, Family707MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family707MainPilot.cache 91801 =
          some 91806 ∧ 91806 ≤ 573802 from
          ⟨Family707MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_707 : ∀ w ∈ windows_707, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_707 checked_707
noncomputable def fromRaw_707 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_707) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_707 checked_707 q raw nodes returns truth
noncomputable def windows_708 : List WorkingViewPilot.Window := [
  ⟨91806, 91876, Family708MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_708 : WorkingViewPilot.checks windows_708 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨91806, 91876, Family708MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family708MainPilot.cache 91806 =
          some 91876 ∧ 91876 ≤ 573802 from
          ⟨Family708MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_708 : ∀ w ∈ windows_708, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_708 checked_708
noncomputable def fromRaw_708 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_708) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_708 checked_708 q raw nodes returns truth
noncomputable def windows_709 : List WorkingViewPilot.Window := [
  ⟨91876, 92546, Family709MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_709 : WorkingViewPilot.checks windows_709 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨91876, 92546, Family709MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family709MainPilot.cache 91876 =
          some 92546 ∧ 92546 ≤ 573802 from
          ⟨Family709MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_709 : ∀ w ∈ windows_709, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_709 checked_709
noncomputable def fromRaw_709 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_709) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_709 checked_709 q raw nodes returns truth
noncomputable def windows_710 : List WorkingViewPilot.Window := [
  ⟨92546, 92616, Family710MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_710 : WorkingViewPilot.checks windows_710 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨92546, 92616, Family710MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family710MainPilot.cache 92546 =
          some 92616 ∧ 92616 ≤ 573802 from
          ⟨Family710MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_710 : ∀ w ∈ windows_710, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_710 checked_710
noncomputable def fromRaw_710 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_710) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_710 checked_710 q raw nodes returns truth
noncomputable def windows_711 : List WorkingViewPilot.Window := [
  ⟨92616, 93286, Family711MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_711 : WorkingViewPilot.checks windows_711 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨92616, 93286, Family711MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family711MainPilot.cache 92616 =
          some 93286 ∧ 93286 ≤ 573802 from
          ⟨Family711MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_711 : ∀ w ∈ windows_711, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_711 checked_711
noncomputable def fromRaw_711 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_711) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_711 checked_711 q raw nodes returns truth
noncomputable def windows_712 : List WorkingViewPilot.Window := [
  ⟨93286, 93956, Family712MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_712 : WorkingViewPilot.checks windows_712 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨93286, 93956, Family712MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family712MainPilot.cache 93286 =
          some 93956 ∧ 93956 ≤ 573802 from
          ⟨Family712MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_712 : ∀ w ∈ windows_712, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_712 checked_712
noncomputable def fromRaw_712 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_712) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_712 checked_712 q raw nodes returns truth
noncomputable def windows_713 : List WorkingViewPilot.Window := [
  ⟨93956, 93961, Family713MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_713 : WorkingViewPilot.checks windows_713 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨93956, 93961, Family713MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family713MainPilot.cache 93956 =
          some 93961 ∧ 93961 ≤ 573802 from
          ⟨Family713MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_713 : ∀ w ∈ windows_713, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_713 checked_713
noncomputable def fromRaw_713 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_713) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_713 checked_713 q raw nodes returns truth
noncomputable def windows_714 : List WorkingViewPilot.Window := [
  ⟨93961, 94031, Family714MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_714 : WorkingViewPilot.checks windows_714 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨93961, 94031, Family714MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family714MainPilot.cache 93961 =
          some 94031 ∧ 94031 ≤ 573802 from
          ⟨Family714MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_714 : ∀ w ∈ windows_714, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_714 checked_714
noncomputable def fromRaw_714 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_714) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_714 checked_714 q raw nodes returns truth
noncomputable def windows_715 : List WorkingViewPilot.Window := [
  ⟨94031, 94701, Family715MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_715 : WorkingViewPilot.checks windows_715 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨94031, 94701, Family715MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family715MainPilot.cache 94031 =
          some 94701 ∧ 94701 ≤ 573802 from
          ⟨Family715MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_715 : ∀ w ∈ windows_715, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_715 checked_715
noncomputable def fromRaw_715 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_715) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_715 checked_715 q raw nodes returns truth
noncomputable def windows_716 : List WorkingViewPilot.Window := [
  ⟨94701, 94706, Family716MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_716 : WorkingViewPilot.checks windows_716 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨94701, 94706, Family716MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family716MainPilot.cache 94701 =
          some 94706 ∧ 94706 ≤ 573802 from
          ⟨Family716MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_716 : ∀ w ∈ windows_716, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_716 checked_716
noncomputable def fromRaw_716 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_716) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_716 checked_716 q raw nodes returns truth
noncomputable def windows_717 : List WorkingViewPilot.Window := [
  ⟨94706, 94716, Family717MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_717 : WorkingViewPilot.checks windows_717 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨94706, 94716, Family717MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family717MainPilot.cache 94706 =
          some 94716 ∧ 94716 ≤ 573802 from
          ⟨Family717MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_717 : ∀ w ∈ windows_717, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_717 checked_717
noncomputable def fromRaw_717 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_717) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_717 checked_717 q raw nodes returns truth
noncomputable def windows_718 : List WorkingViewPilot.Window := [
  ⟨94716, 95086, Family718MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_718 : WorkingViewPilot.checks windows_718 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨94716, 95086, Family718MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family718MainPilot.cache 94716 =
          some 95086 ∧ 95086 ≤ 573802 from
          ⟨Family718MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_718 : ∀ w ∈ windows_718, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_718 checked_718
noncomputable def fromRaw_718 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_718) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_718 checked_718 q raw nodes returns truth
noncomputable def windows_719 : List WorkingViewPilot.Window := [
  ⟨95086, 95526, Family719MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_719 : WorkingViewPilot.checks windows_719 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨95086, 95526, Family719MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family719MainPilot.cache 95086 =
          some 95526 ∧ 95526 ≤ 573802 from
          ⟨Family719MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_719 : ∀ w ∈ windows_719, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_719 checked_719
noncomputable def fromRaw_719 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_719) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_719 checked_719 q raw nodes returns truth
noncomputable def windows_720 : List WorkingViewPilot.Window := [
  ⟨95526, 95596, Family720MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_720 : WorkingViewPilot.checks windows_720 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨95526, 95596, Family720MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family720MainPilot.cache 95526 =
          some 95596 ∧ 95596 ≤ 573802 from
          ⟨Family720MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_720 : ∀ w ∈ windows_720, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_720 checked_720
noncomputable def fromRaw_720 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_720) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_720 checked_720 q raw nodes returns truth
noncomputable def windows_721 : List WorkingViewPilot.Window := [
  ⟨95596, 95791, Family721MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_721 : WorkingViewPilot.checks windows_721 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨95596, 95791, Family721MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family721MainPilot.cache 95596 =
          some 95791 ∧ 95791 ≤ 573802 from
          ⟨Family721MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_721 : ∀ w ∈ windows_721, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_721 checked_721
noncomputable def fromRaw_721 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_721) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_721 checked_721 q raw nodes returns truth
noncomputable def windows_722 : List WorkingViewPilot.Window := [
  ⟨95791, 95861, Family722MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_722 : WorkingViewPilot.checks windows_722 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨95791, 95861, Family722MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family722MainPilot.cache 95791 =
          some 95861 ∧ 95861 ≤ 573802 from
          ⟨Family722MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_722 : ∀ w ∈ windows_722, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_722 checked_722
noncomputable def fromRaw_722 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_722) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_722 checked_722 q raw nodes returns truth
noncomputable def windows_723 : List WorkingViewPilot.Window := [
  ⟨95861, 96261, Family723MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_723 : WorkingViewPilot.checks windows_723 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨95861, 96261, Family723MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family723MainPilot.cache 95861 =
          some 96261 ∧ 96261 ≤ 573802 from
          ⟨Family723MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_723 : ∀ w ∈ windows_723, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_723 checked_723
noncomputable def fromRaw_723 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_723) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_723 checked_723 q raw nodes returns truth
noncomputable def windows_724 : List WorkingViewPilot.Window := [
  ⟨96261, 96266, Family724MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_724 : WorkingViewPilot.checks windows_724 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨96261, 96266, Family724MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family724MainPilot.cache 96261 =
          some 96266 ∧ 96266 ≤ 573802 from
          ⟨Family724MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_724 : ∀ w ∈ windows_724, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_724 checked_724
noncomputable def fromRaw_724 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_724) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_724 checked_724 q raw nodes returns truth
noncomputable def windows_725 : List WorkingViewPilot.Window := [
  ⟨96266, 96336, Family725MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_725 : WorkingViewPilot.checks windows_725 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨96266, 96336, Family725MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family725MainPilot.cache 96266 =
          some 96336 ∧ 96336 ≤ 573802 from
          ⟨Family725MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_725 : ∀ w ∈ windows_725, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_725 checked_725
noncomputable def fromRaw_725 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_725) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_725 checked_725 q raw nodes returns truth
noncomputable def windows_726 : List WorkingViewPilot.Window := [
  ⟨96336, 96706, Family726MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_726 : WorkingViewPilot.checks windows_726 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨96336, 96706, Family726MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family726MainPilot.cache 96336 =
          some 96706 ∧ 96706 ≤ 573802 from
          ⟨Family726MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_726 : ∀ w ∈ windows_726, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_726 checked_726
noncomputable def fromRaw_726 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_726) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_726 checked_726 q raw nodes returns truth
noncomputable def windows_727 : List WorkingViewPilot.Window := [
  ⟨96706, 96711, Family727MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_727 : WorkingViewPilot.checks windows_727 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨96706, 96711, Family727MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family727MainPilot.cache 96706 =
          some 96711 ∧ 96711 ≤ 573802 from
          ⟨Family727MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_727 : ∀ w ∈ windows_727, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_727 checked_727
noncomputable def fromRaw_727 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_727) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_727 checked_727 q raw nodes returns truth
noncomputable def windows_728 : List WorkingViewPilot.Window := [
  ⟨96711, 96781, Family728MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_728 : WorkingViewPilot.checks windows_728 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨96711, 96781, Family728MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family728MainPilot.cache 96711 =
          some 96781 ∧ 96781 ≤ 573802 from
          ⟨Family728MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_728 : ∀ w ∈ windows_728, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_728 checked_728
noncomputable def fromRaw_728 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_728) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_728 checked_728 q raw nodes returns truth
noncomputable def windows_729 : List WorkingViewPilot.Window := [
  ⟨96781, 97181, Family729MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_729 : WorkingViewPilot.checks windows_729 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨96781, 97181, Family729MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family729MainPilot.cache 96781 =
          some 97181 ∧ 97181 ≤ 573802 from
          ⟨Family729MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_729 : ∀ w ∈ windows_729, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_729 checked_729
noncomputable def fromRaw_729 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_729) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_729 checked_729 q raw nodes returns truth
noncomputable def windows_730 : List WorkingViewPilot.Window := [
  ⟨97181, 97186, Family730MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_730 : WorkingViewPilot.checks windows_730 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨97181, 97186, Family730MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family730MainPilot.cache 97181 =
          some 97186 ∧ 97186 ≤ 573802 from
          ⟨Family730MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_730 : ∀ w ∈ windows_730, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_730 checked_730
noncomputable def fromRaw_730 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_730) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_730 checked_730 q raw nodes returns truth
noncomputable def windows_731 : List WorkingViewPilot.Window := [
  ⟨97186, 97196, Family731MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_731 : WorkingViewPilot.checks windows_731 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨97186, 97196, Family731MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family731MainPilot.cache 97186 =
          some 97196 ∧ 97196 ≤ 573802 from
          ⟨Family731MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_731 : ∀ w ∈ windows_731, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_731 checked_731
noncomputable def fromRaw_731 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_731) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_731 checked_731 q raw nodes returns truth
noncomputable def windows_732 : List WorkingViewPilot.Window := [
  ⟨97196, 97416, Family732MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_732 : WorkingViewPilot.checks windows_732 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨97196, 97416, Family732MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family732MainPilot.cache 97196 =
          some 97416 ∧ 97416 ≤ 573802 from
          ⟨Family732MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_732 : ∀ w ∈ windows_732, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_732 checked_732
noncomputable def fromRaw_732 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_732) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_732 checked_732 q raw nodes returns truth
noncomputable def windows_733 : List WorkingViewPilot.Window := [
  ⟨97416, 97721, Family733MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_733 : WorkingViewPilot.checks windows_733 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨97416, 97721, Family733MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family733MainPilot.cache 97416 =
          some 97721 ∧ 97721 ≤ 573802 from
          ⟨Family733MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_733 : ∀ w ∈ windows_733, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_733 checked_733
noncomputable def fromRaw_733 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_733) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_733 checked_733 q raw nodes returns truth
noncomputable def windows_734 : List WorkingViewPilot.Window := [
  ⟨97721, 97791, Family734MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_734 : WorkingViewPilot.checks windows_734 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨97721, 97791, Family734MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family734MainPilot.cache 97721 =
          some 97791 ∧ 97791 ≤ 573802 from
          ⟨Family734MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_734 : ∀ w ∈ windows_734, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_734 checked_734
noncomputable def fromRaw_734 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_734) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_734 checked_734 q raw nodes returns truth
noncomputable def windows_735 : List WorkingViewPilot.Window := [
  ⟨97791, 97986, Family735MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_735 : WorkingViewPilot.checks windows_735 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨97791, 97986, Family735MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family735MainPilot.cache 97791 =
          some 97986 ∧ 97986 ≤ 573802 from
          ⟨Family735MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_735 : ∀ w ∈ windows_735, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_735 checked_735
noncomputable def fromRaw_735 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_735) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_735 checked_735 q raw nodes returns truth
noncomputable def windows_736 : List WorkingViewPilot.Window := [
  ⟨97986, 98056, Family736MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_736 : WorkingViewPilot.checks windows_736 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨97986, 98056, Family736MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family736MainPilot.cache 97986 =
          some 98056 ∧ 98056 ≤ 573802 from
          ⟨Family736MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_736 : ∀ w ∈ windows_736, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_736 checked_736
noncomputable def fromRaw_736 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_736) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_736 checked_736 q raw nodes returns truth
end FamilyViews007Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Quantified working-set batch fidelity checked"
