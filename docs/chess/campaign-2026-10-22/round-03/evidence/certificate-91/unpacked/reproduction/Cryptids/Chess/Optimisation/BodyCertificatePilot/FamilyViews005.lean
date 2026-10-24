module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.FamilyViews005Data
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.FamilyWiring
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.FamilyReturns

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace Family510MainPilot
theorem checked_49696_167 : validate cache_49696_167 49696 =
    some 49863 := by
  decide +kernel
theorem checked_49863_168 : validate cache_49863_168 49863 =
    some 50031 := by
  decide +kernel
theorem checked_49696_335 : validate cache_49696_335 49696 =
    some 50031 := by
  exact validate_branch 167 cache_49696_167 cache_49863_168
    49696 49863 50031
    checked_49696_167 rfl checked_49863_168
theorem checked_50031_167 : validate cache_50031_167 50031 =
    some 50198 := by
  decide +kernel
theorem checked_50198_168 : validate cache_50198_168 50198 =
    some 50366 := by
  decide +kernel
theorem checked_50031_335 : validate cache_50031_335 50031 =
    some 50366 := by
  exact validate_branch 167 cache_50031_167 cache_50198_168
    50031 50198 50366
    checked_50031_167 rfl checked_50198_168
theorem checked_49696_670 : validate cache_49696_670 49696 =
    some 50366 := by
  exact validate_branch 335 cache_49696_335 cache_50031_335
    49696 50031 50366
    checked_49696_335 rfl checked_50031_335
theorem checked : validate cache 49696 = some 50366 :=
  checked_49696_670
end Family510MainPilot
open LookupCachePilot
namespace Family511MainPilot
theorem checked_50366_5 : validate cache_50366_5 50366 =
    some 50371 := by
  decide +kernel
theorem checked : validate cache 50366 = some 50371 :=
  checked_50366_5
end Family511MainPilot
open LookupCachePilot
namespace Family512MainPilot
theorem checked_50371_10 : validate cache_50371_10 50371 =
    some 50381 := by
  decide +kernel
theorem checked : validate cache 50371 = some 50381 :=
  checked_50371_10
end Family512MainPilot
open LookupCachePilot
namespace Family513MainPilot
theorem checked_50381_185 : validate cache_50381_185 50381 =
    some 50566 := by
  decide +kernel
theorem checked_50566_185 : validate cache_50566_185 50566 =
    some 50751 := by
  decide +kernel
theorem checked_50381_370 : validate cache_50381_370 50381 =
    some 50751 := by
  exact validate_branch 185 cache_50381_185 cache_50566_185
    50381 50566 50751
    checked_50381_185 rfl checked_50566_185
theorem checked : validate cache 50381 = some 50751 :=
  checked_50381_370
end Family513MainPilot
open LookupCachePilot
namespace Family514MainPilot
theorem checked_50751_220 : validate cache_50751_220 50751 =
    some 50971 := by
  decide +kernel
theorem checked_50971_220 : validate cache_50971_220 50971 =
    some 51191 := by
  decide +kernel
theorem checked_50751_440 : validate cache_50751_440 50751 =
    some 51191 := by
  exact validate_branch 220 cache_50751_220 cache_50971_220
    50751 50971 51191
    checked_50751_220 rfl checked_50971_220
theorem checked : validate cache 50751 = some 51191 :=
  checked_50751_440
end Family514MainPilot
open LookupCachePilot
namespace Family515MainPilot
theorem checked_51191_70 : validate cache_51191_70 51191 =
    some 51261 := by
  decide +kernel
theorem checked : validate cache 51191 = some 51261 :=
  checked_51191_70
end Family515MainPilot
open LookupCachePilot
namespace Family516MainPilot
theorem checked_51261_195 : validate cache_51261_195 51261 =
    some 51456 := by
  decide +kernel
theorem checked : validate cache 51261 = some 51456 :=
  checked_51261_195
end Family516MainPilot
open LookupCachePilot
namespace Family517MainPilot
theorem checked_51456_70 : validate cache_51456_70 51456 =
    some 51526 := by
  decide +kernel
theorem checked : validate cache 51456 = some 51526 :=
  checked_51456_70
end Family517MainPilot
open LookupCachePilot
namespace Family518MainPilot
theorem checked_51526_200 : validate cache_51526_200 51526 =
    some 51726 := by
  decide +kernel
theorem checked_51726_200 : validate cache_51726_200 51726 =
    some 51926 := by
  decide +kernel
theorem checked_51526_400 : validate cache_51526_400 51526 =
    some 51926 := by
  exact validate_branch 200 cache_51526_200 cache_51726_200
    51526 51726 51926
    checked_51526_200 rfl checked_51726_200
theorem checked : validate cache 51526 = some 51926 :=
  checked_51526_400
end Family518MainPilot
open LookupCachePilot
namespace Family519MainPilot
theorem checked_51926_5 : validate cache_51926_5 51926 =
    some 51931 := by
  decide +kernel
theorem checked : validate cache 51926 = some 51931 :=
  checked_51926_5
end Family519MainPilot
open LookupCachePilot
namespace Family520MainPilot
theorem checked_51931_70 : validate cache_51931_70 51931 =
    some 52001 := by
  decide +kernel
theorem checked : validate cache 51931 = some 52001 :=
  checked_51931_70
end Family520MainPilot
open LookupCachePilot
namespace Family521MainPilot
theorem checked_52001_185 : validate cache_52001_185 52001 =
    some 52186 := by
  decide +kernel
theorem checked_52186_185 : validate cache_52186_185 52186 =
    some 52371 := by
  decide +kernel
theorem checked_52001_370 : validate cache_52001_370 52001 =
    some 52371 := by
  exact validate_branch 185 cache_52001_185 cache_52186_185
    52001 52186 52371
    checked_52001_185 rfl checked_52186_185
theorem checked : validate cache 52001 = some 52371 :=
  checked_52001_370
end Family521MainPilot
open LookupCachePilot
namespace Family522MainPilot
theorem checked_52371_5 : validate cache_52371_5 52371 =
    some 52376 := by
  decide +kernel
theorem checked : validate cache 52371 = some 52376 :=
  checked_52371_5
end Family522MainPilot
open LookupCachePilot
namespace Family523MainPilot
theorem checked_52376_70 : validate cache_52376_70 52376 =
    some 52446 := by
  decide +kernel
theorem checked : validate cache 52376 = some 52446 :=
  checked_52376_70
end Family523MainPilot
open LookupCachePilot
namespace Family524MainPilot
theorem checked_52446_200 : validate cache_52446_200 52446 =
    some 52646 := by
  decide +kernel
theorem checked_52646_200 : validate cache_52646_200 52646 =
    some 52846 := by
  decide +kernel
theorem checked_52446_400 : validate cache_52446_400 52446 =
    some 52846 := by
  exact validate_branch 200 cache_52446_200 cache_52646_200
    52446 52646 52846
    checked_52446_200 rfl checked_52646_200
theorem checked : validate cache 52446 = some 52846 :=
  checked_52446_400
end Family524MainPilot
open LookupCachePilot
namespace Family525MainPilot
theorem checked_52846_5 : validate cache_52846_5 52846 =
    some 52851 := by
  decide +kernel
theorem checked : validate cache 52846 = some 52851 :=
  checked_52846_5
end Family525MainPilot
open LookupCachePilot
namespace Family526MainPilot
theorem checked_52851_10 : validate cache_52851_10 52851 =
    some 52861 := by
  decide +kernel
theorem checked : validate cache 52851 = some 52861 :=
  checked_52851_10
end Family526MainPilot
open LookupCachePilot
namespace Family527MainPilot
theorem checked_52861_130 : validate cache_52861_130 52861 =
    some 52991 := by
  decide +kernel
theorem checked_52991_130 : validate cache_52991_130 52991 =
    some 53121 := by
  decide +kernel
theorem checked_52861_260 : validate cache_52861_260 52861 =
    some 53121 := by
  exact validate_branch 130 cache_52861_130 cache_52991_130
    52861 52991 53121
    checked_52861_130 rfl checked_52991_130
theorem checked_53121_130 : validate cache_53121_130 53121 =
    some 53251 := by
  decide +kernel
theorem checked_53251_130 : validate cache_53251_130 53251 =
    some 53381 := by
  decide +kernel
theorem checked_53121_260 : validate cache_53121_260 53121 =
    some 53381 := by
  exact validate_branch 130 cache_53121_130 cache_53251_130
    53121 53251 53381
    checked_53121_130 rfl checked_53251_130
theorem checked_52861_520 : validate cache_52861_520 52861 =
    some 53381 := by
  exact validate_branch 260 cache_52861_260 cache_53121_260
    52861 53121 53381
    checked_52861_260 rfl checked_53121_260
theorem checked : validate cache 52861 = some 53381 :=
  checked_52861_520
end Family527MainPilot
open LookupCachePilot
namespace Family528MainPilot
theorem checked_53381_143 : validate cache_53381_143 53381 =
    some 53524 := by
  decide +kernel
theorem checked_53524_144 : validate cache_53524_144 53524 =
    some 53668 := by
  decide +kernel
theorem checked_53381_287 : validate cache_53381_287 53381 =
    some 53668 := by
  exact validate_branch 143 cache_53381_143 cache_53524_144
    53381 53524 53668
    checked_53381_143 rfl checked_53524_144
theorem checked_53668_144 : validate cache_53668_144 53668 =
    some 53812 := by
  decide +kernel
theorem checked_53812_144 : validate cache_53812_144 53812 =
    some 53956 := by
  decide +kernel
theorem checked_53668_288 : validate cache_53668_288 53668 =
    some 53956 := by
  exact validate_branch 144 cache_53668_144 cache_53812_144
    53668 53812 53956
    checked_53668_144 rfl checked_53812_144
theorem checked_53381_575 : validate cache_53381_575 53381 =
    some 53956 := by
  exact validate_branch 287 cache_53381_287 cache_53668_288
    53381 53668 53956
    checked_53381_287 rfl checked_53668_288
theorem checked : validate cache 53381 = some 53956 :=
  checked_53381_575
end Family528MainPilot
open LookupCachePilot
namespace Family529MainPilot
theorem checked_53956_70 : validate cache_53956_70 53956 =
    some 54026 := by
  decide +kernel
theorem checked : validate cache 53956 = some 54026 :=
  checked_53956_70
end Family529MainPilot
open LookupCachePilot
namespace Family530MainPilot
theorem checked_54026_195 : validate cache_54026_195 54026 =
    some 54221 := by
  decide +kernel
theorem checked : validate cache 54026 = some 54221 :=
  checked_54026_195
end Family530MainPilot
open LookupCachePilot
namespace Family531MainPilot
theorem checked_54221_70 : validate cache_54221_70 54221 =
    some 54291 := by
  decide +kernel
theorem checked : validate cache 54221 = some 54291 :=
  checked_54221_70
end Family531MainPilot
open LookupCachePilot
namespace Family532MainPilot
theorem checked_54291_133 : validate cache_54291_133 54291 =
    some 54424 := by
  decide +kernel
theorem checked_54424_134 : validate cache_54424_134 54424 =
    some 54558 := by
  decide +kernel
theorem checked_54291_267 : validate cache_54291_267 54291 =
    some 54558 := by
  exact validate_branch 133 cache_54291_133 cache_54424_134
    54291 54424 54558
    checked_54291_133 rfl checked_54424_134
theorem checked_54558_134 : validate cache_54558_134 54558 =
    some 54692 := by
  decide +kernel
theorem checked_54692_134 : validate cache_54692_134 54692 =
    some 54826 := by
  decide +kernel
theorem checked_54558_268 : validate cache_54558_268 54558 =
    some 54826 := by
  exact validate_branch 134 cache_54558_134 cache_54692_134
    54558 54692 54826
    checked_54558_134 rfl checked_54692_134
theorem checked_54291_535 : validate cache_54291_535 54291 =
    some 54826 := by
  exact validate_branch 267 cache_54291_267 cache_54558_268
    54291 54558 54826
    checked_54291_267 rfl checked_54558_268
theorem checked : validate cache 54291 = some 54826 :=
  checked_54291_535
end Family532MainPilot
open LookupCachePilot
namespace Family533MainPilot
theorem checked_54826_5 : validate cache_54826_5 54826 =
    some 54831 := by
  decide +kernel
theorem checked : validate cache 54826 = some 54831 :=
  checked_54826_5
end Family533MainPilot
open LookupCachePilot
namespace Family534MainPilot
theorem checked_54831_70 : validate cache_54831_70 54831 =
    some 54901 := by
  decide +kernel
theorem checked : validate cache 54831 = some 54901 :=
  checked_54831_70
end Family534MainPilot
open LookupCachePilot
namespace Family535MainPilot
theorem checked_54901_220 : validate cache_54901_220 54901 =
    some 55121 := by
  decide +kernel
theorem checked : validate cache 54901 = some 55121 :=
  checked_54901_220
end Family535MainPilot
open LookupCachePilot
namespace Family536MainPilot
theorem checked_55121_70 : validate cache_55121_70 55121 =
    some 55191 := by
  decide +kernel
theorem checked : validate cache 55121 = some 55191 :=
  checked_55121_70
end Family536MainPilot
open LookupCachePilot
namespace Family537MainPilot
theorem checked_55191_132 : validate cache_55191_132 55191 =
    some 55323 := by
  decide +kernel
theorem checked_55323_133 : validate cache_55323_133 55323 =
    some 55456 := by
  decide +kernel
theorem checked_55191_265 : validate cache_55191_265 55191 =
    some 55456 := by
  exact validate_branch 132 cache_55191_132 cache_55323_133
    55191 55323 55456
    checked_55191_132 rfl checked_55323_133
theorem checked : validate cache 55191 = some 55456 :=
  checked_55191_265
end Family537MainPilot
open LookupCachePilot
namespace Family538MainPilot
theorem checked_55456_5 : validate cache_55456_5 55456 =
    some 55461 := by
  decide +kernel
theorem checked : validate cache 55456 = some 55461 :=
  checked_55456_5
end Family538MainPilot
open LookupCachePilot
namespace Family539MainPilot
theorem checked_55461_70 : validate cache_55461_70 55461 =
    some 55531 := by
  decide +kernel
theorem checked : validate cache 55461 = some 55531 :=
  checked_55461_70
end Family539MainPilot
open LookupCachePilot
namespace Family540MainPilot
theorem checked_55531_167 : validate cache_55531_167 55531 =
    some 55698 := by
  decide +kernel
theorem checked_55698_168 : validate cache_55698_168 55698 =
    some 55866 := by
  decide +kernel
theorem checked_55531_335 : validate cache_55531_335 55531 =
    some 55866 := by
  exact validate_branch 167 cache_55531_167 cache_55698_168
    55531 55698 55866
    checked_55531_167 rfl checked_55698_168
theorem checked_55866_167 : validate cache_55866_167 55866 =
    some 56033 := by
  decide +kernel
theorem checked_56033_168 : validate cache_56033_168 56033 =
    some 56201 := by
  decide +kernel
theorem checked_55866_335 : validate cache_55866_335 55866 =
    some 56201 := by
  exact validate_branch 167 cache_55866_167 cache_56033_168
    55866 56033 56201
    checked_55866_167 rfl checked_56033_168
theorem checked_55531_670 : validate cache_55531_670 55531 =
    some 56201 := by
  exact validate_branch 335 cache_55531_335 cache_55866_335
    55531 55866 56201
    checked_55531_335 rfl checked_55866_335
theorem checked : validate cache 55531 = some 56201 :=
  checked_55531_670
end Family540MainPilot
open LookupCachePilot
namespace Family541MainPilot
theorem checked_56201_70 : validate cache_56201_70 56201 =
    some 56271 := by
  decide +kernel
theorem checked : validate cache 56201 = some 56271 :=
  checked_56201_70
end Family541MainPilot
open LookupCachePilot
namespace Family542MainPilot
theorem checked_56271_167 : validate cache_56271_167 56271 =
    some 56438 := by
  decide +kernel
theorem checked_56438_168 : validate cache_56438_168 56438 =
    some 56606 := by
  decide +kernel
theorem checked_56271_335 : validate cache_56271_335 56271 =
    some 56606 := by
  exact validate_branch 167 cache_56271_167 cache_56438_168
    56271 56438 56606
    checked_56271_167 rfl checked_56438_168
theorem checked_56606_167 : validate cache_56606_167 56606 =
    some 56773 := by
  decide +kernel
theorem checked_56773_168 : validate cache_56773_168 56773 =
    some 56941 := by
  decide +kernel
theorem checked_56606_335 : validate cache_56606_335 56606 =
    some 56941 := by
  exact validate_branch 167 cache_56606_167 cache_56773_168
    56606 56773 56941
    checked_56606_167 rfl checked_56773_168
theorem checked_56271_670 : validate cache_56271_670 56271 =
    some 56941 := by
  exact validate_branch 335 cache_56271_335 cache_56606_335
    56271 56606 56941
    checked_56271_335 rfl checked_56606_335
theorem checked : validate cache 56271 = some 56941 :=
  checked_56271_670
end Family542MainPilot
open LookupCachePilot
namespace Family543MainPilot
theorem checked_56941_167 : validate cache_56941_167 56941 =
    some 57108 := by
  decide +kernel
theorem checked_57108_168 : validate cache_57108_168 57108 =
    some 57276 := by
  decide +kernel
theorem checked_56941_335 : validate cache_56941_335 56941 =
    some 57276 := by
  exact validate_branch 167 cache_56941_167 cache_57108_168
    56941 57108 57276
    checked_56941_167 rfl checked_57108_168
theorem checked_57276_167 : validate cache_57276_167 57276 =
    some 57443 := by
  decide +kernel
theorem checked_57443_168 : validate cache_57443_168 57443 =
    some 57611 := by
  decide +kernel
theorem checked_57276_335 : validate cache_57276_335 57276 =
    some 57611 := by
  exact validate_branch 167 cache_57276_167 cache_57443_168
    57276 57443 57611
    checked_57276_167 rfl checked_57443_168
theorem checked_56941_670 : validate cache_56941_670 56941 =
    some 57611 := by
  exact validate_branch 335 cache_56941_335 cache_57276_335
    56941 57276 57611
    checked_56941_335 rfl checked_57276_335
theorem checked : validate cache 56941 = some 57611 :=
  checked_56941_670
end Family543MainPilot
open LookupCachePilot
namespace Family544MainPilot
theorem checked_57611_5 : validate cache_57611_5 57611 =
    some 57616 := by
  decide +kernel
theorem checked : validate cache 57611 = some 57616 :=
  checked_57611_5
end Family544MainPilot
open LookupCachePilot
namespace Family545MainPilot
theorem checked_57616_70 : validate cache_57616_70 57616 =
    some 57686 := by
  decide +kernel
theorem checked : validate cache 57616 = some 57686 :=
  checked_57616_70
end Family545MainPilot
open LookupCachePilot
namespace Family546MainPilot
theorem checked_57686_167 : validate cache_57686_167 57686 =
    some 57853 := by
  decide +kernel
theorem checked_57853_168 : validate cache_57853_168 57853 =
    some 58021 := by
  decide +kernel
theorem checked_57686_335 : validate cache_57686_335 57686 =
    some 58021 := by
  exact validate_branch 167 cache_57686_167 cache_57853_168
    57686 57853 58021
    checked_57686_167 rfl checked_57853_168
theorem checked_58021_167 : validate cache_58021_167 58021 =
    some 58188 := by
  decide +kernel
theorem checked_58188_168 : validate cache_58188_168 58188 =
    some 58356 := by
  decide +kernel
theorem checked_58021_335 : validate cache_58021_335 58021 =
    some 58356 := by
  exact validate_branch 167 cache_58021_167 cache_58188_168
    58021 58188 58356
    checked_58021_167 rfl checked_58188_168
theorem checked_57686_670 : validate cache_57686_670 57686 =
    some 58356 := by
  exact validate_branch 335 cache_57686_335 cache_58021_335
    57686 58021 58356
    checked_57686_335 rfl checked_58021_335
theorem checked : validate cache 57686 = some 58356 :=
  checked_57686_670
end Family546MainPilot
open LookupCachePilot
namespace Family547MainPilot
theorem checked_58356_5 : validate cache_58356_5 58356 =
    some 58361 := by
  decide +kernel
theorem checked : validate cache 58356 = some 58361 :=
  checked_58356_5
end Family547MainPilot
open LookupCachePilot
namespace Family548MainPilot
theorem checked_58361_70 : validate cache_58361_70 58361 =
    some 58431 := by
  decide +kernel
theorem checked : validate cache 58361 = some 58431 :=
  checked_58361_70
end Family548MainPilot
open LookupCachePilot
namespace Family549MainPilot
theorem checked_58431_220 : validate cache_58431_220 58431 =
    some 58651 := by
  decide +kernel
theorem checked : validate cache 58431 = some 58651 :=
  checked_58431_220
end Family549MainPilot
open LookupCachePilot
namespace Family550MainPilot
theorem checked_58651_5 : validate cache_58651_5 58651 =
    some 58656 := by
  decide +kernel
theorem checked : validate cache 58651 = some 58656 :=
  checked_58651_5
end Family550MainPilot
open LookupCachePilot
namespace Family551MainPilot
theorem checked_58656_70 : validate cache_58656_70 58656 =
    some 58726 := by
  decide +kernel
theorem checked : validate cache 58656 = some 58726 :=
  checked_58656_70
end Family551MainPilot
open LookupCachePilot
namespace Family552MainPilot
theorem checked_58726_132 : validate cache_58726_132 58726 =
    some 58858 := by
  decide +kernel
theorem checked_58858_133 : validate cache_58858_133 58858 =
    some 58991 := by
  decide +kernel
theorem checked_58726_265 : validate cache_58726_265 58726 =
    some 58991 := by
  exact validate_branch 132 cache_58726_132 cache_58858_133
    58726 58858 58991
    checked_58726_132 rfl checked_58858_133
theorem checked : validate cache 58726 = some 58991 :=
  checked_58726_265
end Family552MainPilot
open LookupCachePilot
namespace Family553MainPilot
theorem checked_58991_5 : validate cache_58991_5 58991 =
    some 58996 := by
  decide +kernel
theorem checked : validate cache 58991 = some 58996 :=
  checked_58991_5
end Family553MainPilot
open LookupCachePilot
namespace Family554MainPilot
theorem checked_58996_10 : validate cache_58996_10 58996 =
    some 59006 := by
  decide +kernel
theorem checked : validate cache 58996 = some 59006 :=
  checked_58996_10
end Family554MainPilot
open LookupCachePilot
namespace Family555MainPilot
theorem checked_59006_185 : validate cache_59006_185 59006 =
    some 59191 := by
  decide +kernel
theorem checked_59191_185 : validate cache_59191_185 59191 =
    some 59376 := by
  decide +kernel
theorem checked_59006_370 : validate cache_59006_370 59006 =
    some 59376 := by
  exact validate_branch 185 cache_59006_185 cache_59191_185
    59006 59191 59376
    checked_59006_185 rfl checked_59191_185
theorem checked : validate cache 59006 = some 59376 :=
  checked_59006_370
end Family555MainPilot
open LookupCachePilot
namespace Family556MainPilot
theorem checked_59376_220 : validate cache_59376_220 59376 =
    some 59596 := by
  decide +kernel
theorem checked_59596_220 : validate cache_59596_220 59596 =
    some 59816 := by
  decide +kernel
theorem checked_59376_440 : validate cache_59376_440 59376 =
    some 59816 := by
  exact validate_branch 220 cache_59376_220 cache_59596_220
    59376 59596 59816
    checked_59376_220 rfl checked_59596_220
theorem checked : validate cache 59376 = some 59816 :=
  checked_59376_440
end Family556MainPilot
open LookupCachePilot
namespace Family557MainPilot
theorem checked_59816_70 : validate cache_59816_70 59816 =
    some 59886 := by
  decide +kernel
theorem checked : validate cache 59816 = some 59886 :=
  checked_59816_70
end Family557MainPilot
open LookupCachePilot
namespace Family558MainPilot
theorem checked_59886_195 : validate cache_59886_195 59886 =
    some 60081 := by
  decide +kernel
theorem checked : validate cache 59886 = some 60081 :=
  checked_59886_195
end Family558MainPilot
open LookupCachePilot
namespace Family559MainPilot
theorem checked_60081_70 : validate cache_60081_70 60081 =
    some 60151 := by
  decide +kernel
theorem checked : validate cache 60081 = some 60151 :=
  checked_60081_70
end Family559MainPilot
open LookupCachePilot
namespace Family560MainPilot
theorem checked_60151_200 : validate cache_60151_200 60151 =
    some 60351 := by
  decide +kernel
theorem checked_60351_200 : validate cache_60351_200 60351 =
    some 60551 := by
  decide +kernel
theorem checked_60151_400 : validate cache_60151_400 60151 =
    some 60551 := by
  exact validate_branch 200 cache_60151_200 cache_60351_200
    60151 60351 60551
    checked_60151_200 rfl checked_60351_200
theorem checked : validate cache 60151 = some 60551 :=
  checked_60151_400
end Family560MainPilot
open LookupCachePilot
namespace Family561MainPilot
theorem checked_60551_5 : validate cache_60551_5 60551 =
    some 60556 := by
  decide +kernel
theorem checked : validate cache 60551 = some 60556 :=
  checked_60551_5
end Family561MainPilot
open LookupCachePilot
namespace Family562MainPilot
theorem checked_60556_70 : validate cache_60556_70 60556 =
    some 60626 := by
  decide +kernel
theorem checked : validate cache 60556 = some 60626 :=
  checked_60556_70
end Family562MainPilot
open LookupCachePilot
namespace Family563MainPilot
theorem checked_60626_185 : validate cache_60626_185 60626 =
    some 60811 := by
  decide +kernel
theorem checked_60811_185 : validate cache_60811_185 60811 =
    some 60996 := by
  decide +kernel
theorem checked_60626_370 : validate cache_60626_370 60626 =
    some 60996 := by
  exact validate_branch 185 cache_60626_185 cache_60811_185
    60626 60811 60996
    checked_60626_185 rfl checked_60811_185
theorem checked : validate cache 60626 = some 60996 :=
  checked_60626_370
end Family563MainPilot
open LookupCachePilot
namespace Family564MainPilot
theorem checked_60996_5 : validate cache_60996_5 60996 =
    some 61001 := by
  decide +kernel
theorem checked : validate cache 60996 = some 61001 :=
  checked_60996_5
end Family564MainPilot
open LookupCachePilot
namespace Family565MainPilot
theorem checked_61001_70 : validate cache_61001_70 61001 =
    some 61071 := by
  decide +kernel
theorem checked : validate cache 61001 = some 61071 :=
  checked_61001_70
end Family565MainPilot
open LookupCachePilot
namespace Family566MainPilot
theorem checked_61071_200 : validate cache_61071_200 61071 =
    some 61271 := by
  decide +kernel
theorem checked_61271_200 : validate cache_61271_200 61271 =
    some 61471 := by
  decide +kernel
theorem checked_61071_400 : validate cache_61071_400 61071 =
    some 61471 := by
  exact validate_branch 200 cache_61071_200 cache_61271_200
    61071 61271 61471
    checked_61071_200 rfl checked_61271_200
theorem checked : validate cache 61071 = some 61471 :=
  checked_61071_400
end Family566MainPilot
open LookupCachePilot
namespace Family567MainPilot
theorem checked_61471_5 : validate cache_61471_5 61471 =
    some 61476 := by
  decide +kernel
theorem checked : validate cache 61471 = some 61476 :=
  checked_61471_5
end Family567MainPilot
open LookupCachePilot
namespace Family568MainPilot
theorem checked_61476_10 : validate cache_61476_10 61476 =
    some 61486 := by
  decide +kernel
theorem checked : validate cache 61476 = some 61486 :=
  checked_61476_10
end Family568MainPilot
open LookupCachePilot
namespace Family569MainPilot
theorem checked_61486_130 : validate cache_61486_130 61486 =
    some 61616 := by
  decide +kernel
theorem checked_61616_130 : validate cache_61616_130 61616 =
    some 61746 := by
  decide +kernel
theorem checked_61486_260 : validate cache_61486_260 61486 =
    some 61746 := by
  exact validate_branch 130 cache_61486_130 cache_61616_130
    61486 61616 61746
    checked_61486_130 rfl checked_61616_130
theorem checked_61746_130 : validate cache_61746_130 61746 =
    some 61876 := by
  decide +kernel
theorem checked_61876_130 : validate cache_61876_130 61876 =
    some 62006 := by
  decide +kernel
theorem checked_61746_260 : validate cache_61746_260 61746 =
    some 62006 := by
  exact validate_branch 130 cache_61746_130 cache_61876_130
    61746 61876 62006
    checked_61746_130 rfl checked_61876_130
theorem checked_61486_520 : validate cache_61486_520 61486 =
    some 62006 := by
  exact validate_branch 260 cache_61486_260 cache_61746_260
    61486 61746 62006
    checked_61486_260 rfl checked_61746_260
theorem checked : validate cache 61486 = some 62006 :=
  checked_61486_520
end Family569MainPilot
open LookupCachePilot
namespace Family570MainPilot
theorem checked_62006_143 : validate cache_62006_143 62006 =
    some 62149 := by
  decide +kernel
theorem checked_62149_144 : validate cache_62149_144 62149 =
    some 62293 := by
  decide +kernel
theorem checked_62006_287 : validate cache_62006_287 62006 =
    some 62293 := by
  exact validate_branch 143 cache_62006_143 cache_62149_144
    62006 62149 62293
    checked_62006_143 rfl checked_62149_144
theorem checked_62293_144 : validate cache_62293_144 62293 =
    some 62437 := by
  decide +kernel
theorem checked_62437_144 : validate cache_62437_144 62437 =
    some 62581 := by
  decide +kernel
theorem checked_62293_288 : validate cache_62293_288 62293 =
    some 62581 := by
  exact validate_branch 144 cache_62293_144 cache_62437_144
    62293 62437 62581
    checked_62293_144 rfl checked_62437_144
theorem checked_62006_575 : validate cache_62006_575 62006 =
    some 62581 := by
  exact validate_branch 287 cache_62006_287 cache_62293_288
    62006 62293 62581
    checked_62006_287 rfl checked_62293_288
theorem checked : validate cache 62006 = some 62581 :=
  checked_62006_575
end Family570MainPilot
open LookupCachePilot
namespace Family571MainPilot
theorem checked_62581_70 : validate cache_62581_70 62581 =
    some 62651 := by
  decide +kernel
theorem checked : validate cache 62581 = some 62651 :=
  checked_62581_70
end Family571MainPilot
open LookupCachePilot
namespace Family572MainPilot
theorem checked_62651_195 : validate cache_62651_195 62651 =
    some 62846 := by
  decide +kernel
theorem checked : validate cache 62651 = some 62846 :=
  checked_62651_195
end Family572MainPilot
open LookupCachePilot
namespace Family573MainPilot
theorem checked_62846_70 : validate cache_62846_70 62846 =
    some 62916 := by
  decide +kernel
theorem checked : validate cache 62846 = some 62916 :=
  checked_62846_70
end Family573MainPilot
open LookupCachePilot
namespace Family574MainPilot
theorem checked_62916_133 : validate cache_62916_133 62916 =
    some 63049 := by
  decide +kernel
theorem checked_63049_134 : validate cache_63049_134 63049 =
    some 63183 := by
  decide +kernel
theorem checked_62916_267 : validate cache_62916_267 62916 =
    some 63183 := by
  exact validate_branch 133 cache_62916_133 cache_63049_134
    62916 63049 63183
    checked_62916_133 rfl checked_63049_134
theorem checked_63183_134 : validate cache_63183_134 63183 =
    some 63317 := by
  decide +kernel
theorem checked_63317_134 : validate cache_63317_134 63317 =
    some 63451 := by
  decide +kernel
theorem checked_63183_268 : validate cache_63183_268 63183 =
    some 63451 := by
  exact validate_branch 134 cache_63183_134 cache_63317_134
    63183 63317 63451
    checked_63183_134 rfl checked_63317_134
theorem checked_62916_535 : validate cache_62916_535 62916 =
    some 63451 := by
  exact validate_branch 267 cache_62916_267 cache_63183_268
    62916 63183 63451
    checked_62916_267 rfl checked_63183_268
theorem checked : validate cache 62916 = some 63451 :=
  checked_62916_535
end Family574MainPilot
open LookupCachePilot
namespace Family575MainPilot
theorem checked_63451_5 : validate cache_63451_5 63451 =
    some 63456 := by
  decide +kernel
theorem checked : validate cache 63451 = some 63456 :=
  checked_63451_5
end Family575MainPilot
open LookupCachePilot
namespace Family576MainPilot
theorem checked_63456_70 : validate cache_63456_70 63456 =
    some 63526 := by
  decide +kernel
theorem checked : validate cache 63456 = some 63526 :=
  checked_63456_70
end Family576MainPilot
open LookupCachePilot
namespace Family577MainPilot
theorem checked_63526_220 : validate cache_63526_220 63526 =
    some 63746 := by
  decide +kernel
theorem checked : validate cache 63526 = some 63746 :=
  checked_63526_220
end Family577MainPilot
open LookupCachePilot
namespace Family578MainPilot
theorem checked_63746_70 : validate cache_63746_70 63746 =
    some 63816 := by
  decide +kernel
theorem checked : validate cache 63746 = some 63816 :=
  checked_63746_70
end Family578MainPilot
open LookupCachePilot
namespace Family579MainPilot
theorem checked_63816_132 : validate cache_63816_132 63816 =
    some 63948 := by
  decide +kernel
theorem checked_63948_133 : validate cache_63948_133 63948 =
    some 64081 := by
  decide +kernel
theorem checked_63816_265 : validate cache_63816_265 63816 =
    some 64081 := by
  exact validate_branch 132 cache_63816_132 cache_63948_133
    63816 63948 64081
    checked_63816_132 rfl checked_63948_133
theorem checked : validate cache 63816 = some 64081 :=
  checked_63816_265
end Family579MainPilot
open LookupCachePilot
namespace Family580MainPilot
theorem checked_64081_5 : validate cache_64081_5 64081 =
    some 64086 := by
  decide +kernel
theorem checked : validate cache 64081 = some 64086 :=
  checked_64081_5
end Family580MainPilot
open LookupCachePilot
namespace Family581MainPilot
theorem checked_64086_70 : validate cache_64086_70 64086 =
    some 64156 := by
  decide +kernel
theorem checked : validate cache 64086 = some 64156 :=
  checked_64086_70
end Family581MainPilot
open LookupCachePilot
namespace Family582MainPilot
theorem checked_64156_167 : validate cache_64156_167 64156 =
    some 64323 := by
  decide +kernel
theorem checked_64323_168 : validate cache_64323_168 64323 =
    some 64491 := by
  decide +kernel
theorem checked_64156_335 : validate cache_64156_335 64156 =
    some 64491 := by
  exact validate_branch 167 cache_64156_167 cache_64323_168
    64156 64323 64491
    checked_64156_167 rfl checked_64323_168
theorem checked_64491_167 : validate cache_64491_167 64491 =
    some 64658 := by
  decide +kernel
theorem checked_64658_168 : validate cache_64658_168 64658 =
    some 64826 := by
  decide +kernel
theorem checked_64491_335 : validate cache_64491_335 64491 =
    some 64826 := by
  exact validate_branch 167 cache_64491_167 cache_64658_168
    64491 64658 64826
    checked_64491_167 rfl checked_64658_168
theorem checked_64156_670 : validate cache_64156_670 64156 =
    some 64826 := by
  exact validate_branch 335 cache_64156_335 cache_64491_335
    64156 64491 64826
    checked_64156_335 rfl checked_64491_335
theorem checked : validate cache 64156 = some 64826 :=
  checked_64156_670
end Family582MainPilot
open LookupCachePilot
namespace Family583MainPilot
theorem checked_64826_70 : validate cache_64826_70 64826 =
    some 64896 := by
  decide +kernel
theorem checked : validate cache 64826 = some 64896 :=
  checked_64826_70
end Family583MainPilot
open LookupCachePilot
namespace Family584MainPilot
theorem checked_64896_167 : validate cache_64896_167 64896 =
    some 65063 := by
  decide +kernel
theorem checked_65063_168 : validate cache_65063_168 65063 =
    some 65231 := by
  decide +kernel
theorem checked_64896_335 : validate cache_64896_335 64896 =
    some 65231 := by
  exact validate_branch 167 cache_64896_167 cache_65063_168
    64896 65063 65231
    checked_64896_167 rfl checked_65063_168
theorem checked_65231_167 : validate cache_65231_167 65231 =
    some 65398 := by
  decide +kernel
theorem checked_65398_168 : validate cache_65398_168 65398 =
    some 65566 := by
  decide +kernel
theorem checked_65231_335 : validate cache_65231_335 65231 =
    some 65566 := by
  exact validate_branch 167 cache_65231_167 cache_65398_168
    65231 65398 65566
    checked_65231_167 rfl checked_65398_168
theorem checked_64896_670 : validate cache_64896_670 64896 =
    some 65566 := by
  exact validate_branch 335 cache_64896_335 cache_65231_335
    64896 65231 65566
    checked_64896_335 rfl checked_65231_335
theorem checked : validate cache 64896 = some 65566 :=
  checked_64896_670
end Family584MainPilot
namespace FamilyViews005Pilot
noncomputable def windows_510 : List WorkingViewPilot.Window := [
  ⟨49696, 50366, Family510MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_510 : WorkingViewPilot.checks windows_510 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨49696, 50366, Family510MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      49696 50366 Family510MainPilot.cache
      Family510MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_510 : ∀ w ∈ windows_510, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_510 checked_510
noncomputable def fromRaw_510 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_510) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_510 checked_510 q raw nodes returns truth
noncomputable def windows_511 : List WorkingViewPilot.Window := [
  ⟨50366, 50371, Family511MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_511 : WorkingViewPilot.checks windows_511 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨50366, 50371, Family511MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      50366 50371 Family511MainPilot.cache
      Family511MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_511 : ∀ w ∈ windows_511, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_511 checked_511
noncomputable def fromRaw_511 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_511) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_511 checked_511 q raw nodes returns truth
noncomputable def windows_512 : List WorkingViewPilot.Window := [
  ⟨50371, 50381, Family512MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_512 : WorkingViewPilot.checks windows_512 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨50371, 50381, Family512MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      50371 50381 Family512MainPilot.cache
      Family512MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_512 : ∀ w ∈ windows_512, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_512 checked_512
noncomputable def fromRaw_512 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_512) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_512 checked_512 q raw nodes returns truth
noncomputable def windows_513 : List WorkingViewPilot.Window := [
  ⟨50381, 50751, Family513MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_513 : WorkingViewPilot.checks windows_513 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨50381, 50751, Family513MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      50381 50751 Family513MainPilot.cache
      Family513MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_513 : ∀ w ∈ windows_513, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_513 checked_513
noncomputable def fromRaw_513 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_513) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_513 checked_513 q raw nodes returns truth
noncomputable def windows_514 : List WorkingViewPilot.Window := [
  ⟨50751, 51191, Family514MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_514 : WorkingViewPilot.checks windows_514 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨50751, 51191, Family514MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      50751 51191 Family514MainPilot.cache
      Family514MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_514 : ∀ w ∈ windows_514, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_514 checked_514
noncomputable def fromRaw_514 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_514) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_514 checked_514 q raw nodes returns truth
noncomputable def windows_515 : List WorkingViewPilot.Window := [
  ⟨51191, 51261, Family515MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_515 : WorkingViewPilot.checks windows_515 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨51191, 51261, Family515MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      51191 51261 Family515MainPilot.cache
      Family515MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_515 : ∀ w ∈ windows_515, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_515 checked_515
noncomputable def fromRaw_515 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_515) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_515 checked_515 q raw nodes returns truth
noncomputable def windows_516 : List WorkingViewPilot.Window := [
  ⟨51261, 51456, Family516MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_516 : WorkingViewPilot.checks windows_516 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨51261, 51456, Family516MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      51261 51456 Family516MainPilot.cache
      Family516MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_516 : ∀ w ∈ windows_516, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_516 checked_516
noncomputable def fromRaw_516 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_516) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_516 checked_516 q raw nodes returns truth
noncomputable def windows_517 : List WorkingViewPilot.Window := [
  ⟨51456, 51526, Family517MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_517 : WorkingViewPilot.checks windows_517 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨51456, 51526, Family517MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      51456 51526 Family517MainPilot.cache
      Family517MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_517 : ∀ w ∈ windows_517, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_517 checked_517
noncomputable def fromRaw_517 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_517) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_517 checked_517 q raw nodes returns truth
noncomputable def windows_518 : List WorkingViewPilot.Window := [
  ⟨51526, 51926, Family518MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_518 : WorkingViewPilot.checks windows_518 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨51526, 51926, Family518MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      51526 51926 Family518MainPilot.cache
      Family518MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_518 : ∀ w ∈ windows_518, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_518 checked_518
noncomputable def fromRaw_518 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_518) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_518 checked_518 q raw nodes returns truth
noncomputable def windows_519 : List WorkingViewPilot.Window := [
  ⟨51926, 51931, Family519MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_519 : WorkingViewPilot.checks windows_519 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨51926, 51931, Family519MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      51926 51931 Family519MainPilot.cache
      Family519MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_519 : ∀ w ∈ windows_519, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_519 checked_519
noncomputable def fromRaw_519 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_519) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_519 checked_519 q raw nodes returns truth
noncomputable def windows_520 : List WorkingViewPilot.Window := [
  ⟨51931, 52001, Family520MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_520 : WorkingViewPilot.checks windows_520 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨51931, 52001, Family520MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      51931 52001 Family520MainPilot.cache
      Family520MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_520 : ∀ w ∈ windows_520, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_520 checked_520
noncomputable def fromRaw_520 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_520) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_520 checked_520 q raw nodes returns truth
noncomputable def windows_521 : List WorkingViewPilot.Window := [
  ⟨52001, 52371, Family521MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_521 : WorkingViewPilot.checks windows_521 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨52001, 52371, Family521MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      52001 52371 Family521MainPilot.cache
      Family521MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_521 : ∀ w ∈ windows_521, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_521 checked_521
noncomputable def fromRaw_521 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_521) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_521 checked_521 q raw nodes returns truth
noncomputable def windows_522 : List WorkingViewPilot.Window := [
  ⟨52371, 52376, Family522MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_522 : WorkingViewPilot.checks windows_522 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨52371, 52376, Family522MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      52371 52376 Family522MainPilot.cache
      Family522MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_522 : ∀ w ∈ windows_522, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_522 checked_522
noncomputable def fromRaw_522 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_522) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_522 checked_522 q raw nodes returns truth
noncomputable def windows_523 : List WorkingViewPilot.Window := [
  ⟨52376, 52446, Family523MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_523 : WorkingViewPilot.checks windows_523 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨52376, 52446, Family523MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      52376 52446 Family523MainPilot.cache
      Family523MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_523 : ∀ w ∈ windows_523, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_523 checked_523
noncomputable def fromRaw_523 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_523) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_523 checked_523 q raw nodes returns truth
noncomputable def windows_524 : List WorkingViewPilot.Window := [
  ⟨52446, 52846, Family524MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_524 : WorkingViewPilot.checks windows_524 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨52446, 52846, Family524MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      52446 52846 Family524MainPilot.cache
      Family524MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_524 : ∀ w ∈ windows_524, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_524 checked_524
noncomputable def fromRaw_524 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_524) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_524 checked_524 q raw nodes returns truth
noncomputable def windows_525 : List WorkingViewPilot.Window := [
  ⟨52846, 52851, Family525MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_525 : WorkingViewPilot.checks windows_525 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨52846, 52851, Family525MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      52846 52851 Family525MainPilot.cache
      Family525MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_525 : ∀ w ∈ windows_525, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_525 checked_525
noncomputable def fromRaw_525 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_525) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_525 checked_525 q raw nodes returns truth
noncomputable def windows_526 : List WorkingViewPilot.Window := [
  ⟨52851, 52861, Family526MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_526 : WorkingViewPilot.checks windows_526 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨52851, 52861, Family526MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      52851 52861 Family526MainPilot.cache
      Family526MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_526 : ∀ w ∈ windows_526, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_526 checked_526
noncomputable def fromRaw_526 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_526) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_526 checked_526 q raw nodes returns truth
noncomputable def windows_527 : List WorkingViewPilot.Window := [
  ⟨52861, 53381, Family527MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_527 : WorkingViewPilot.checks windows_527 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨52861, 53381, Family527MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      52861 53381 Family527MainPilot.cache
      Family527MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_527 : ∀ w ∈ windows_527, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_527 checked_527
noncomputable def fromRaw_527 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_527) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_527 checked_527 q raw nodes returns truth
noncomputable def windows_528 : List WorkingViewPilot.Window := [
  ⟨53381, 53956, Family528MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_528 : WorkingViewPilot.checks windows_528 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨53381, 53956, Family528MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      53381 53956 Family528MainPilot.cache
      Family528MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_528 : ∀ w ∈ windows_528, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_528 checked_528
noncomputable def fromRaw_528 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_528) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_528 checked_528 q raw nodes returns truth
noncomputable def windows_529 : List WorkingViewPilot.Window := [
  ⟨53956, 54026, Family529MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_529 : WorkingViewPilot.checks windows_529 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨53956, 54026, Family529MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      53956 54026 Family529MainPilot.cache
      Family529MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_529 : ∀ w ∈ windows_529, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_529 checked_529
noncomputable def fromRaw_529 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_529) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_529 checked_529 q raw nodes returns truth
noncomputable def windows_530 : List WorkingViewPilot.Window := [
  ⟨54026, 54221, Family530MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_530 : WorkingViewPilot.checks windows_530 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨54026, 54221, Family530MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      54026 54221 Family530MainPilot.cache
      Family530MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_530 : ∀ w ∈ windows_530, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_530 checked_530
noncomputable def fromRaw_530 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_530) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_530 checked_530 q raw nodes returns truth
noncomputable def windows_531 : List WorkingViewPilot.Window := [
  ⟨54221, 54291, Family531MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_531 : WorkingViewPilot.checks windows_531 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨54221, 54291, Family531MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      54221 54291 Family531MainPilot.cache
      Family531MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_531 : ∀ w ∈ windows_531, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_531 checked_531
noncomputable def fromRaw_531 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_531) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_531 checked_531 q raw nodes returns truth
noncomputable def windows_532 : List WorkingViewPilot.Window := [
  ⟨54291, 54826, Family532MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_532 : WorkingViewPilot.checks windows_532 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨54291, 54826, Family532MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      54291 54826 Family532MainPilot.cache
      Family532MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_532 : ∀ w ∈ windows_532, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_532 checked_532
noncomputable def fromRaw_532 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_532) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_532 checked_532 q raw nodes returns truth
noncomputable def windows_533 : List WorkingViewPilot.Window := [
  ⟨54826, 54831, Family533MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_533 : WorkingViewPilot.checks windows_533 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨54826, 54831, Family533MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      54826 54831 Family533MainPilot.cache
      Family533MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_533 : ∀ w ∈ windows_533, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_533 checked_533
noncomputable def fromRaw_533 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_533) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_533 checked_533 q raw nodes returns truth
noncomputable def windows_534 : List WorkingViewPilot.Window := [
  ⟨54831, 54901, Family534MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_534 : WorkingViewPilot.checks windows_534 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨54831, 54901, Family534MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      54831 54901 Family534MainPilot.cache
      Family534MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_534 : ∀ w ∈ windows_534, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_534 checked_534
noncomputable def fromRaw_534 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_534) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_534 checked_534 q raw nodes returns truth
noncomputable def windows_535 : List WorkingViewPilot.Window := [
  ⟨54901, 55121, Family535MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_535 : WorkingViewPilot.checks windows_535 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨54901, 55121, Family535MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      54901 55121 Family535MainPilot.cache
      Family535MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_535 : ∀ w ∈ windows_535, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_535 checked_535
noncomputable def fromRaw_535 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_535) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_535 checked_535 q raw nodes returns truth
noncomputable def windows_536 : List WorkingViewPilot.Window := [
  ⟨55121, 55191, Family536MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_536 : WorkingViewPilot.checks windows_536 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨55121, 55191, Family536MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      55121 55191 Family536MainPilot.cache
      Family536MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_536 : ∀ w ∈ windows_536, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_536 checked_536
noncomputable def fromRaw_536 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_536) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_536 checked_536 q raw nodes returns truth
noncomputable def windows_537 : List WorkingViewPilot.Window := [
  ⟨55191, 55456, Family537MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_537 : WorkingViewPilot.checks windows_537 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨55191, 55456, Family537MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      55191 55456 Family537MainPilot.cache
      Family537MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_537 : ∀ w ∈ windows_537, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_537 checked_537
noncomputable def fromRaw_537 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_537) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_537 checked_537 q raw nodes returns truth
noncomputable def windows_538 : List WorkingViewPilot.Window := [
  ⟨55456, 55461, Family538MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_538 : WorkingViewPilot.checks windows_538 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨55456, 55461, Family538MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      55456 55461 Family538MainPilot.cache
      Family538MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_538 : ∀ w ∈ windows_538, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_538 checked_538
noncomputable def fromRaw_538 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_538) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_538 checked_538 q raw nodes returns truth
noncomputable def windows_539 : List WorkingViewPilot.Window := [
  ⟨55461, 55531, Family539MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_539 : WorkingViewPilot.checks windows_539 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨55461, 55531, Family539MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      55461 55531 Family539MainPilot.cache
      Family539MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_539 : ∀ w ∈ windows_539, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_539 checked_539
noncomputable def fromRaw_539 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_539) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_539 checked_539 q raw nodes returns truth
noncomputable def windows_540 : List WorkingViewPilot.Window := [
  ⟨55531, 56201, Family540MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_540 : WorkingViewPilot.checks windows_540 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨55531, 56201, Family540MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      55531 56201 Family540MainPilot.cache
      Family540MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_540 : ∀ w ∈ windows_540, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_540 checked_540
noncomputable def fromRaw_540 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_540) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_540 checked_540 q raw nodes returns truth
noncomputable def windows_541 : List WorkingViewPilot.Window := [
  ⟨56201, 56271, Family541MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_541 : WorkingViewPilot.checks windows_541 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨56201, 56271, Family541MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      56201 56271 Family541MainPilot.cache
      Family541MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_541 : ∀ w ∈ windows_541, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_541 checked_541
noncomputable def fromRaw_541 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_541) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_541 checked_541 q raw nodes returns truth
noncomputable def windows_542 : List WorkingViewPilot.Window := [
  ⟨56271, 56941, Family542MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_542 : WorkingViewPilot.checks windows_542 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨56271, 56941, Family542MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      56271 56941 Family542MainPilot.cache
      Family542MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_542 : ∀ w ∈ windows_542, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_542 checked_542
noncomputable def fromRaw_542 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_542) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_542 checked_542 q raw nodes returns truth
noncomputable def windows_543 : List WorkingViewPilot.Window := [
  ⟨56941, 57611, Family543MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_543 : WorkingViewPilot.checks windows_543 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨56941, 57611, Family543MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      56941 57611 Family543MainPilot.cache
      Family543MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_543 : ∀ w ∈ windows_543, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_543 checked_543
noncomputable def fromRaw_543 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_543) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_543 checked_543 q raw nodes returns truth
noncomputable def windows_544 : List WorkingViewPilot.Window := [
  ⟨57611, 57616, Family544MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_544 : WorkingViewPilot.checks windows_544 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨57611, 57616, Family544MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      57611 57616 Family544MainPilot.cache
      Family544MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_544 : ∀ w ∈ windows_544, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_544 checked_544
noncomputable def fromRaw_544 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_544) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_544 checked_544 q raw nodes returns truth
noncomputable def windows_545 : List WorkingViewPilot.Window := [
  ⟨57616, 57686, Family545MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_545 : WorkingViewPilot.checks windows_545 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨57616, 57686, Family545MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      57616 57686 Family545MainPilot.cache
      Family545MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_545 : ∀ w ∈ windows_545, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_545 checked_545
noncomputable def fromRaw_545 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_545) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_545 checked_545 q raw nodes returns truth
noncomputable def windows_546 : List WorkingViewPilot.Window := [
  ⟨57686, 58356, Family546MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_546 : WorkingViewPilot.checks windows_546 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨57686, 58356, Family546MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      57686 58356 Family546MainPilot.cache
      Family546MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_546 : ∀ w ∈ windows_546, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_546 checked_546
noncomputable def fromRaw_546 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_546) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_546 checked_546 q raw nodes returns truth
noncomputable def windows_547 : List WorkingViewPilot.Window := [
  ⟨58356, 58361, Family547MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_547 : WorkingViewPilot.checks windows_547 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨58356, 58361, Family547MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      58356 58361 Family547MainPilot.cache
      Family547MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_547 : ∀ w ∈ windows_547, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_547 checked_547
noncomputable def fromRaw_547 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_547) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_547 checked_547 q raw nodes returns truth
noncomputable def windows_548 : List WorkingViewPilot.Window := [
  ⟨58361, 58431, Family548MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_548 : WorkingViewPilot.checks windows_548 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨58361, 58431, Family548MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      58361 58431 Family548MainPilot.cache
      Family548MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_548 : ∀ w ∈ windows_548, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_548 checked_548
noncomputable def fromRaw_548 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_548) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_548 checked_548 q raw nodes returns truth
noncomputable def windows_549 : List WorkingViewPilot.Window := [
  ⟨58431, 58651, Family549MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_549 : WorkingViewPilot.checks windows_549 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨58431, 58651, Family549MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      58431 58651 Family549MainPilot.cache
      Family549MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_549 : ∀ w ∈ windows_549, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_549 checked_549
noncomputable def fromRaw_549 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_549) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_549 checked_549 q raw nodes returns truth
noncomputable def windows_550 : List WorkingViewPilot.Window := [
  ⟨58651, 58656, Family550MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_550 : WorkingViewPilot.checks windows_550 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨58651, 58656, Family550MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      58651 58656 Family550MainPilot.cache
      Family550MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_550 : ∀ w ∈ windows_550, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_550 checked_550
noncomputable def fromRaw_550 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_550) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_550 checked_550 q raw nodes returns truth
noncomputable def windows_551 : List WorkingViewPilot.Window := [
  ⟨58656, 58726, Family551MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_551 : WorkingViewPilot.checks windows_551 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨58656, 58726, Family551MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      58656 58726 Family551MainPilot.cache
      Family551MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_551 : ∀ w ∈ windows_551, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_551 checked_551
noncomputable def fromRaw_551 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_551) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_551 checked_551 q raw nodes returns truth
noncomputable def windows_552 : List WorkingViewPilot.Window := [
  ⟨58726, 58991, Family552MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_552 : WorkingViewPilot.checks windows_552 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨58726, 58991, Family552MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      58726 58991 Family552MainPilot.cache
      Family552MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_552 : ∀ w ∈ windows_552, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_552 checked_552
noncomputable def fromRaw_552 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_552) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_552 checked_552 q raw nodes returns truth
noncomputable def windows_553 : List WorkingViewPilot.Window := [
  ⟨58991, 58996, Family553MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_553 : WorkingViewPilot.checks windows_553 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨58991, 58996, Family553MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      58991 58996 Family553MainPilot.cache
      Family553MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_553 : ∀ w ∈ windows_553, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_553 checked_553
noncomputable def fromRaw_553 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_553) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_553 checked_553 q raw nodes returns truth
noncomputable def windows_554 : List WorkingViewPilot.Window := [
  ⟨58996, 59006, Family554MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_554 : WorkingViewPilot.checks windows_554 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨58996, 59006, Family554MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      58996 59006 Family554MainPilot.cache
      Family554MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_554 : ∀ w ∈ windows_554, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_554 checked_554
noncomputable def fromRaw_554 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_554) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_554 checked_554 q raw nodes returns truth
noncomputable def windows_555 : List WorkingViewPilot.Window := [
  ⟨59006, 59376, Family555MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_555 : WorkingViewPilot.checks windows_555 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨59006, 59376, Family555MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      59006 59376 Family555MainPilot.cache
      Family555MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_555 : ∀ w ∈ windows_555, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_555 checked_555
noncomputable def fromRaw_555 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_555) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_555 checked_555 q raw nodes returns truth
noncomputable def windows_556 : List WorkingViewPilot.Window := [
  ⟨59376, 59816, Family556MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_556 : WorkingViewPilot.checks windows_556 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨59376, 59816, Family556MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      59376 59816 Family556MainPilot.cache
      Family556MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_556 : ∀ w ∈ windows_556, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_556 checked_556
noncomputable def fromRaw_556 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_556) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_556 checked_556 q raw nodes returns truth
noncomputable def windows_557 : List WorkingViewPilot.Window := [
  ⟨59816, 59886, Family557MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_557 : WorkingViewPilot.checks windows_557 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨59816, 59886, Family557MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      59816 59886 Family557MainPilot.cache
      Family557MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_557 : ∀ w ∈ windows_557, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_557 checked_557
noncomputable def fromRaw_557 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_557) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_557 checked_557 q raw nodes returns truth
noncomputable def windows_558 : List WorkingViewPilot.Window := [
  ⟨59886, 60081, Family558MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_558 : WorkingViewPilot.checks windows_558 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨59886, 60081, Family558MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      59886 60081 Family558MainPilot.cache
      Family558MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_558 : ∀ w ∈ windows_558, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_558 checked_558
noncomputable def fromRaw_558 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_558) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_558 checked_558 q raw nodes returns truth
noncomputable def windows_559 : List WorkingViewPilot.Window := [
  ⟨60081, 60151, Family559MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_559 : WorkingViewPilot.checks windows_559 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨60081, 60151, Family559MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      60081 60151 Family559MainPilot.cache
      Family559MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_559 : ∀ w ∈ windows_559, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_559 checked_559
noncomputable def fromRaw_559 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_559) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_559 checked_559 q raw nodes returns truth
noncomputable def windows_560 : List WorkingViewPilot.Window := [
  ⟨60151, 60551, Family560MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_560 : WorkingViewPilot.checks windows_560 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨60151, 60551, Family560MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      60151 60551 Family560MainPilot.cache
      Family560MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_560 : ∀ w ∈ windows_560, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_560 checked_560
noncomputable def fromRaw_560 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_560) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_560 checked_560 q raw nodes returns truth
noncomputable def windows_561 : List WorkingViewPilot.Window := [
  ⟨60551, 60556, Family561MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_561 : WorkingViewPilot.checks windows_561 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨60551, 60556, Family561MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      60551 60556 Family561MainPilot.cache
      Family561MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_561 : ∀ w ∈ windows_561, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_561 checked_561
noncomputable def fromRaw_561 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_561) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_561 checked_561 q raw nodes returns truth
noncomputable def windows_562 : List WorkingViewPilot.Window := [
  ⟨60556, 60626, Family562MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_562 : WorkingViewPilot.checks windows_562 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨60556, 60626, Family562MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      60556 60626 Family562MainPilot.cache
      Family562MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_562 : ∀ w ∈ windows_562, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_562 checked_562
noncomputable def fromRaw_562 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_562) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_562 checked_562 q raw nodes returns truth
noncomputable def windows_563 : List WorkingViewPilot.Window := [
  ⟨60626, 60996, Family563MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_563 : WorkingViewPilot.checks windows_563 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨60626, 60996, Family563MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      60626 60996 Family563MainPilot.cache
      Family563MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_563 : ∀ w ∈ windows_563, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_563 checked_563
noncomputable def fromRaw_563 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_563) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_563 checked_563 q raw nodes returns truth
noncomputable def windows_564 : List WorkingViewPilot.Window := [
  ⟨60996, 61001, Family564MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_564 : WorkingViewPilot.checks windows_564 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨60996, 61001, Family564MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      60996 61001 Family564MainPilot.cache
      Family564MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_564 : ∀ w ∈ windows_564, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_564 checked_564
noncomputable def fromRaw_564 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_564) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_564 checked_564 q raw nodes returns truth
noncomputable def windows_565 : List WorkingViewPilot.Window := [
  ⟨61001, 61071, Family565MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_565 : WorkingViewPilot.checks windows_565 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨61001, 61071, Family565MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      61001 61071 Family565MainPilot.cache
      Family565MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_565 : ∀ w ∈ windows_565, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_565 checked_565
noncomputable def fromRaw_565 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_565) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_565 checked_565 q raw nodes returns truth
noncomputable def windows_566 : List WorkingViewPilot.Window := [
  ⟨61071, 61471, Family566MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_566 : WorkingViewPilot.checks windows_566 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨61071, 61471, Family566MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      61071 61471 Family566MainPilot.cache
      Family566MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_566 : ∀ w ∈ windows_566, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_566 checked_566
noncomputable def fromRaw_566 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_566) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_566 checked_566 q raw nodes returns truth
noncomputable def windows_567 : List WorkingViewPilot.Window := [
  ⟨61471, 61476, Family567MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_567 : WorkingViewPilot.checks windows_567 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨61471, 61476, Family567MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      61471 61476 Family567MainPilot.cache
      Family567MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_567 : ∀ w ∈ windows_567, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_567 checked_567
noncomputable def fromRaw_567 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_567) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_567 checked_567 q raw nodes returns truth
noncomputable def windows_568 : List WorkingViewPilot.Window := [
  ⟨61476, 61486, Family568MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_568 : WorkingViewPilot.checks windows_568 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨61476, 61486, Family568MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      61476 61486 Family568MainPilot.cache
      Family568MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_568 : ∀ w ∈ windows_568, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_568 checked_568
noncomputable def fromRaw_568 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_568) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_568 checked_568 q raw nodes returns truth
noncomputable def windows_569 : List WorkingViewPilot.Window := [
  ⟨61486, 62006, Family569MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_569 : WorkingViewPilot.checks windows_569 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨61486, 62006, Family569MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      61486 62006 Family569MainPilot.cache
      Family569MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_569 : ∀ w ∈ windows_569, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_569 checked_569
noncomputable def fromRaw_569 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_569) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_569 checked_569 q raw nodes returns truth
noncomputable def windows_570 : List WorkingViewPilot.Window := [
  ⟨62006, 62581, Family570MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_570 : WorkingViewPilot.checks windows_570 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨62006, 62581, Family570MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      62006 62581 Family570MainPilot.cache
      Family570MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_570 : ∀ w ∈ windows_570, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_570 checked_570
noncomputable def fromRaw_570 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_570) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_570 checked_570 q raw nodes returns truth
noncomputable def windows_571 : List WorkingViewPilot.Window := [
  ⟨62581, 62651, Family571MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_571 : WorkingViewPilot.checks windows_571 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨62581, 62651, Family571MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      62581 62651 Family571MainPilot.cache
      Family571MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_571 : ∀ w ∈ windows_571, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_571 checked_571
noncomputable def fromRaw_571 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_571) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_571 checked_571 q raw nodes returns truth
noncomputable def windows_572 : List WorkingViewPilot.Window := [
  ⟨62651, 62846, Family572MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_572 : WorkingViewPilot.checks windows_572 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨62651, 62846, Family572MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      62651 62846 Family572MainPilot.cache
      Family572MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_572 : ∀ w ∈ windows_572, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_572 checked_572
noncomputable def fromRaw_572 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_572) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_572 checked_572 q raw nodes returns truth
noncomputable def windows_573 : List WorkingViewPilot.Window := [
  ⟨62846, 62916, Family573MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_573 : WorkingViewPilot.checks windows_573 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨62846, 62916, Family573MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      62846 62916 Family573MainPilot.cache
      Family573MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_573 : ∀ w ∈ windows_573, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_573 checked_573
noncomputable def fromRaw_573 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_573) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_573 checked_573 q raw nodes returns truth
noncomputable def windows_574 : List WorkingViewPilot.Window := [
  ⟨62916, 63451, Family574MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_574 : WorkingViewPilot.checks windows_574 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨62916, 63451, Family574MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      62916 63451 Family574MainPilot.cache
      Family574MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_574 : ∀ w ∈ windows_574, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_574 checked_574
noncomputable def fromRaw_574 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_574) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_574 checked_574 q raw nodes returns truth
noncomputable def windows_575 : List WorkingViewPilot.Window := [
  ⟨63451, 63456, Family575MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_575 : WorkingViewPilot.checks windows_575 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨63451, 63456, Family575MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      63451 63456 Family575MainPilot.cache
      Family575MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_575 : ∀ w ∈ windows_575, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_575 checked_575
noncomputable def fromRaw_575 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_575) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_575 checked_575 q raw nodes returns truth
noncomputable def windows_576 : List WorkingViewPilot.Window := [
  ⟨63456, 63526, Family576MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_576 : WorkingViewPilot.checks windows_576 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨63456, 63526, Family576MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      63456 63526 Family576MainPilot.cache
      Family576MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_576 : ∀ w ∈ windows_576, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_576 checked_576
noncomputable def fromRaw_576 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_576) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_576 checked_576 q raw nodes returns truth
noncomputable def windows_577 : List WorkingViewPilot.Window := [
  ⟨63526, 63746, Family577MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_577 : WorkingViewPilot.checks windows_577 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨63526, 63746, Family577MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      63526 63746 Family577MainPilot.cache
      Family577MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_577 : ∀ w ∈ windows_577, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_577 checked_577
noncomputable def fromRaw_577 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_577) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_577 checked_577 q raw nodes returns truth
noncomputable def windows_578 : List WorkingViewPilot.Window := [
  ⟨63746, 63816, Family578MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_578 : WorkingViewPilot.checks windows_578 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨63746, 63816, Family578MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      63746 63816 Family578MainPilot.cache
      Family578MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_578 : ∀ w ∈ windows_578, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_578 checked_578
noncomputable def fromRaw_578 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_578) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_578 checked_578 q raw nodes returns truth
noncomputable def windows_579 : List WorkingViewPilot.Window := [
  ⟨63816, 64081, Family579MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_579 : WorkingViewPilot.checks windows_579 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨63816, 64081, Family579MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      63816 64081 Family579MainPilot.cache
      Family579MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_579 : ∀ w ∈ windows_579, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_579 checked_579
noncomputable def fromRaw_579 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_579) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_579 checked_579 q raw nodes returns truth
noncomputable def windows_580 : List WorkingViewPilot.Window := [
  ⟨64081, 64086, Family580MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_580 : WorkingViewPilot.checks windows_580 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨64081, 64086, Family580MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      64081 64086 Family580MainPilot.cache
      Family580MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_580 : ∀ w ∈ windows_580, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_580 checked_580
noncomputable def fromRaw_580 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_580) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_580 checked_580 q raw nodes returns truth
noncomputable def windows_581 : List WorkingViewPilot.Window := [
  ⟨64086, 64156, Family581MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_581 : WorkingViewPilot.checks windows_581 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨64086, 64156, Family581MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      64086 64156 Family581MainPilot.cache
      Family581MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_581 : ∀ w ∈ windows_581, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_581 checked_581
noncomputable def fromRaw_581 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_581) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_581 checked_581 q raw nodes returns truth
noncomputable def windows_582 : List WorkingViewPilot.Window := [
  ⟨64156, 64826, Family582MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_582 : WorkingViewPilot.checks windows_582 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨64156, 64826, Family582MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      64156 64826 Family582MainPilot.cache
      Family582MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_582 : ∀ w ∈ windows_582, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_582 checked_582
noncomputable def fromRaw_582 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_582) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_582 checked_582 q raw nodes returns truth
noncomputable def windows_583 : List WorkingViewPilot.Window := [
  ⟨64826, 64896, Family583MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_583 : WorkingViewPilot.checks windows_583 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨64826, 64896, Family583MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      64826 64896 Family583MainPilot.cache
      Family583MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_583 : ∀ w ∈ windows_583, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_583 checked_583
noncomputable def fromRaw_583 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_583) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_583 checked_583 q raw nodes returns truth
noncomputable def windows_584 : List WorkingViewPilot.Window := [
  ⟨64896, 65566, Family584MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_584 : WorkingViewPilot.checks windows_584 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨64896, 65566, Family584MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      64896 65566 Family584MainPilot.cache
      Family584MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_584 : ∀ w ∈ windows_584, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_584 checked_584
noncomputable def fromRaw_584 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_584) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_584 checked_584 q raw nodes returns truth
end FamilyViews005Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Quantified working-set batch fidelity checked"
