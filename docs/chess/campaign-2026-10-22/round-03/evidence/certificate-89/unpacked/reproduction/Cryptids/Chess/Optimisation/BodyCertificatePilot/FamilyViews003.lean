module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.FamilyViews003Data
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.WorkingViews
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.FamilyReturns

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace Family359MainPilot
theorem checked_17566_167 : validate cache_17566_167 17566 =
    some 17733 := by
  decide +kernel
theorem checked_17733_168 : validate cache_17733_168 17733 =
    some 17901 := by
  decide +kernel
theorem checked_17566_335 : validate cache_17566_335 17566 =
    some 17901 := by
  exact validate_branch 167 cache_17566_167 cache_17733_168
    17566 17733 17901
    checked_17566_167 rfl checked_17733_168
theorem checked_17901_167 : validate cache_17901_167 17901 =
    some 18068 := by
  decide +kernel
theorem checked_18068_168 : validate cache_18068_168 18068 =
    some 18236 := by
  decide +kernel
theorem checked_17901_335 : validate cache_17901_335 17901 =
    some 18236 := by
  exact validate_branch 167 cache_17901_167 cache_18068_168
    17901 18068 18236
    checked_17901_167 rfl checked_18068_168
theorem checked_17566_670 : validate cache_17566_670 17566 =
    some 18236 := by
  exact validate_branch 335 cache_17566_335 cache_17901_335
    17566 17901 18236
    checked_17566_335 rfl checked_17901_335
theorem checked : validate cache 17566 = some 18236 :=
  checked_17566_670
end Family359MainPilot
open LookupCachePilot
namespace Family360MainPilot
theorem checked_18236_5 : validate cache_18236_5 18236 =
    some 18241 := by
  decide +kernel
theorem checked : validate cache 18236 = some 18241 :=
  checked_18236_5
end Family360MainPilot
open LookupCachePilot
namespace Family361MainPilot
theorem checked_18241_70 : validate cache_18241_70 18241 =
    some 18311 := by
  decide +kernel
theorem checked : validate cache 18241 = some 18311 :=
  checked_18241_70
end Family361MainPilot
open LookupCachePilot
namespace Family362MainPilot
theorem checked_18311_220 : validate cache_18311_220 18311 =
    some 18531 := by
  decide +kernel
theorem checked : validate cache 18311 = some 18531 :=
  checked_18311_220
end Family362MainPilot
open LookupCachePilot
namespace Family363MainPilot
theorem checked_18531_70 : validate cache_18531_70 18531 =
    some 18601 := by
  decide +kernel
theorem checked : validate cache 18531 = some 18601 :=
  checked_18531_70
end Family363MainPilot
open LookupCachePilot
namespace Family364MainPilot
theorem checked_18601_132 : validate cache_18601_132 18601 =
    some 18733 := by
  decide +kernel
theorem checked_18733_133 : validate cache_18733_133 18733 =
    some 18866 := by
  decide +kernel
theorem checked_18601_265 : validate cache_18601_265 18601 =
    some 18866 := by
  exact validate_branch 132 cache_18601_132 cache_18733_133
    18601 18733 18866
    checked_18601_132 rfl checked_18733_133
theorem checked : validate cache 18601 = some 18866 :=
  checked_18601_265
end Family364MainPilot
open LookupCachePilot
namespace Family365MainPilot
theorem checked_18866_220 : validate cache_18866_220 18866 =
    some 19086 := by
  decide +kernel
theorem checked : validate cache 18866 = some 19086 :=
  checked_18866_220
end Family365MainPilot
open LookupCachePilot
namespace Family366MainPilot
theorem checked_19086_5 : validate cache_19086_5 19086 =
    some 19091 := by
  decide +kernel
theorem checked : validate cache 19086 = some 19091 :=
  checked_19086_5
end Family366MainPilot
open LookupCachePilot
namespace Family367MainPilot
theorem checked_19091_70 : validate cache_19091_70 19091 =
    some 19161 := by
  decide +kernel
theorem checked : validate cache 19091 = some 19161 :=
  checked_19091_70
end Family367MainPilot
open LookupCachePilot
namespace Family368MainPilot
theorem checked_19161_132 : validate cache_19161_132 19161 =
    some 19293 := by
  decide +kernel
theorem checked_19293_133 : validate cache_19293_133 19293 =
    some 19426 := by
  decide +kernel
theorem checked_19161_265 : validate cache_19161_265 19161 =
    some 19426 := by
  exact validate_branch 132 cache_19161_132 cache_19293_133
    19161 19293 19426
    checked_19161_132 rfl checked_19293_133
theorem checked : validate cache 19161 = some 19426 :=
  checked_19161_265
end Family368MainPilot
open LookupCachePilot
namespace Family369MainPilot
theorem checked_19426_5 : validate cache_19426_5 19426 =
    some 19431 := by
  decide +kernel
theorem checked : validate cache 19426 = some 19431 :=
  checked_19426_5
end Family369MainPilot
open LookupCachePilot
namespace Family370MainPilot
theorem checked_19431_10 : validate cache_19431_10 19431 =
    some 19441 := by
  decide +kernel
theorem checked : validate cache 19431 = some 19441 :=
  checked_19431_10
end Family370MainPilot
open LookupCachePilot
namespace Family371MainPilot
theorem checked_19441_185 : validate cache_19441_185 19441 =
    some 19626 := by
  decide +kernel
theorem checked_19626_185 : validate cache_19626_185 19626 =
    some 19811 := by
  decide +kernel
theorem checked_19441_370 : validate cache_19441_370 19441 =
    some 19811 := by
  exact validate_branch 185 cache_19441_185 cache_19626_185
    19441 19626 19811
    checked_19441_185 rfl checked_19626_185
theorem checked : validate cache 19441 = some 19811 :=
  checked_19441_370
end Family371MainPilot
open LookupCachePilot
namespace Family372MainPilot
theorem checked_19811_220 : validate cache_19811_220 19811 =
    some 20031 := by
  decide +kernel
theorem checked_20031_220 : validate cache_20031_220 20031 =
    some 20251 := by
  decide +kernel
theorem checked_19811_440 : validate cache_19811_440 19811 =
    some 20251 := by
  exact validate_branch 220 cache_19811_220 cache_20031_220
    19811 20031 20251
    checked_19811_220 rfl checked_20031_220
theorem checked : validate cache 19811 = some 20251 :=
  checked_19811_440
end Family372MainPilot
open LookupCachePilot
namespace Family373MainPilot
theorem checked_20251_70 : validate cache_20251_70 20251 =
    some 20321 := by
  decide +kernel
theorem checked : validate cache 20251 = some 20321 :=
  checked_20251_70
end Family373MainPilot
open LookupCachePilot
namespace Family374MainPilot
theorem checked_20321_195 : validate cache_20321_195 20321 =
    some 20516 := by
  decide +kernel
theorem checked : validate cache 20321 = some 20516 :=
  checked_20321_195
end Family374MainPilot
open LookupCachePilot
namespace Family375MainPilot
theorem checked_20516_70 : validate cache_20516_70 20516 =
    some 20586 := by
  decide +kernel
theorem checked : validate cache 20516 = some 20586 :=
  checked_20516_70
end Family375MainPilot
open LookupCachePilot
namespace Family376MainPilot
theorem checked_20586_200 : validate cache_20586_200 20586 =
    some 20786 := by
  decide +kernel
theorem checked_20786_200 : validate cache_20786_200 20786 =
    some 20986 := by
  decide +kernel
theorem checked_20586_400 : validate cache_20586_400 20586 =
    some 20986 := by
  exact validate_branch 200 cache_20586_200 cache_20786_200
    20586 20786 20986
    checked_20586_200 rfl checked_20786_200
theorem checked : validate cache 20586 = some 20986 :=
  checked_20586_400
end Family376MainPilot
open LookupCachePilot
namespace Family377MainPilot
theorem checked_20986_5 : validate cache_20986_5 20986 =
    some 20991 := by
  decide +kernel
theorem checked : validate cache 20986 = some 20991 :=
  checked_20986_5
end Family377MainPilot
open LookupCachePilot
namespace Family378MainPilot
theorem checked_20991_70 : validate cache_20991_70 20991 =
    some 21061 := by
  decide +kernel
theorem checked : validate cache 20991 = some 21061 :=
  checked_20991_70
end Family378MainPilot
open LookupCachePilot
namespace Family379MainPilot
theorem checked_21061_167 : validate cache_21061_167 21061 =
    some 21228 := by
  decide +kernel
theorem checked_21228_168 : validate cache_21228_168 21228 =
    some 21396 := by
  decide +kernel
theorem checked_21061_335 : validate cache_21061_335 21061 =
    some 21396 := by
  exact validate_branch 167 cache_21061_167 cache_21228_168
    21061 21228 21396
    checked_21061_167 rfl checked_21228_168
theorem checked_21396_167 : validate cache_21396_167 21396 =
    some 21563 := by
  decide +kernel
theorem checked_21563_168 : validate cache_21563_168 21563 =
    some 21731 := by
  decide +kernel
theorem checked_21396_335 : validate cache_21396_335 21396 =
    some 21731 := by
  exact validate_branch 167 cache_21396_167 cache_21563_168
    21396 21563 21731
    checked_21396_167 rfl checked_21563_168
theorem checked_21061_670 : validate cache_21061_670 21061 =
    some 21731 := by
  exact validate_branch 335 cache_21061_335 cache_21396_335
    21061 21396 21731
    checked_21061_335 rfl checked_21396_335
theorem checked : validate cache 21061 = some 21731 :=
  checked_21061_670
end Family379MainPilot
open LookupCachePilot
namespace Family380MainPilot
theorem checked_21731_70 : validate cache_21731_70 21731 =
    some 21801 := by
  decide +kernel
theorem checked : validate cache 21731 = some 21801 :=
  checked_21731_70
end Family380MainPilot
open LookupCachePilot
namespace Family381MainPilot
theorem checked_21801_167 : validate cache_21801_167 21801 =
    some 21968 := by
  decide +kernel
theorem checked_21968_168 : validate cache_21968_168 21968 =
    some 22136 := by
  decide +kernel
theorem checked_21801_335 : validate cache_21801_335 21801 =
    some 22136 := by
  exact validate_branch 167 cache_21801_167 cache_21968_168
    21801 21968 22136
    checked_21801_167 rfl checked_21968_168
theorem checked_22136_167 : validate cache_22136_167 22136 =
    some 22303 := by
  decide +kernel
theorem checked_22303_168 : validate cache_22303_168 22303 =
    some 22471 := by
  decide +kernel
theorem checked_22136_335 : validate cache_22136_335 22136 =
    some 22471 := by
  exact validate_branch 167 cache_22136_167 cache_22303_168
    22136 22303 22471
    checked_22136_167 rfl checked_22303_168
theorem checked_21801_670 : validate cache_21801_670 21801 =
    some 22471 := by
  exact validate_branch 335 cache_21801_335 cache_22136_335
    21801 22136 22471
    checked_21801_335 rfl checked_22136_335
theorem checked : validate cache 21801 = some 22471 :=
  checked_21801_670
end Family381MainPilot
open LookupCachePilot
namespace Family382MainPilot
theorem checked_22471_5 : validate cache_22471_5 22471 =
    some 22476 := by
  decide +kernel
theorem checked : validate cache 22471 = some 22476 :=
  checked_22471_5
end Family382MainPilot
open LookupCachePilot
namespace Family383MainPilot
theorem checked_22476_70 : validate cache_22476_70 22476 =
    some 22546 := by
  decide +kernel
theorem checked : validate cache 22476 = some 22546 :=
  checked_22476_70
end Family383MainPilot
open LookupCachePilot
namespace Family384MainPilot
theorem checked_22546_167 : validate cache_22546_167 22546 =
    some 22713 := by
  decide +kernel
theorem checked_22713_168 : validate cache_22713_168 22713 =
    some 22881 := by
  decide +kernel
theorem checked_22546_335 : validate cache_22546_335 22546 =
    some 22881 := by
  exact validate_branch 167 cache_22546_167 cache_22713_168
    22546 22713 22881
    checked_22546_167 rfl checked_22713_168
theorem checked_22881_167 : validate cache_22881_167 22881 =
    some 23048 := by
  decide +kernel
theorem checked_23048_168 : validate cache_23048_168 23048 =
    some 23216 := by
  decide +kernel
theorem checked_22881_335 : validate cache_22881_335 22881 =
    some 23216 := by
  exact validate_branch 167 cache_22881_167 cache_23048_168
    22881 23048 23216
    checked_22881_167 rfl checked_23048_168
theorem checked_22546_670 : validate cache_22546_670 22546 =
    some 23216 := by
  exact validate_branch 335 cache_22546_335 cache_22881_335
    22546 22881 23216
    checked_22546_335 rfl checked_22881_335
theorem checked : validate cache 22546 = some 23216 :=
  checked_22546_670
end Family384MainPilot
open LookupCachePilot
namespace Family385MainPilot
theorem checked_23216_70 : validate cache_23216_70 23216 =
    some 23286 := by
  decide +kernel
theorem checked : validate cache 23216 = some 23286 :=
  checked_23216_70
end Family385MainPilot
open LookupCachePilot
namespace Family386MainPilot
theorem checked_23286_167 : validate cache_23286_167 23286 =
    some 23453 := by
  decide +kernel
theorem checked_23453_168 : validate cache_23453_168 23453 =
    some 23621 := by
  decide +kernel
theorem checked_23286_335 : validate cache_23286_335 23286 =
    some 23621 := by
  exact validate_branch 167 cache_23286_167 cache_23453_168
    23286 23453 23621
    checked_23286_167 rfl checked_23453_168
theorem checked_23621_167 : validate cache_23621_167 23621 =
    some 23788 := by
  decide +kernel
theorem checked_23788_168 : validate cache_23788_168 23788 =
    some 23956 := by
  decide +kernel
theorem checked_23621_335 : validate cache_23621_335 23621 =
    some 23956 := by
  exact validate_branch 167 cache_23621_167 cache_23788_168
    23621 23788 23956
    checked_23621_167 rfl checked_23788_168
theorem checked_23286_670 : validate cache_23286_670 23286 =
    some 23956 := by
  exact validate_branch 335 cache_23286_335 cache_23621_335
    23286 23621 23956
    checked_23286_335 rfl checked_23621_335
theorem checked : validate cache 23286 = some 23956 :=
  checked_23286_670
end Family386MainPilot
open LookupCachePilot
namespace Family387MainPilot
theorem checked_23956_5 : validate cache_23956_5 23956 =
    some 23961 := by
  decide +kernel
theorem checked : validate cache 23956 = some 23961 :=
  checked_23956_5
end Family387MainPilot
open LookupCachePilot
namespace Family388MainPilot
theorem checked_23961_70 : validate cache_23961_70 23961 =
    some 24031 := by
  decide +kernel
theorem checked : validate cache 23961 = some 24031 :=
  checked_23961_70
end Family388MainPilot
open LookupCachePilot
namespace Family389MainPilot
theorem checked_24031_185 : validate cache_24031_185 24031 =
    some 24216 := by
  decide +kernel
theorem checked_24216_185 : validate cache_24216_185 24216 =
    some 24401 := by
  decide +kernel
theorem checked_24031_370 : validate cache_24031_370 24031 =
    some 24401 := by
  exact validate_branch 185 cache_24031_185 cache_24216_185
    24031 24216 24401
    checked_24031_185 rfl checked_24216_185
theorem checked : validate cache 24031 = some 24401 :=
  checked_24031_370
end Family389MainPilot
open LookupCachePilot
namespace Family390MainPilot
theorem checked_24401_5 : validate cache_24401_5 24401 =
    some 24406 := by
  decide +kernel
theorem checked : validate cache 24401 = some 24406 :=
  checked_24401_5
end Family390MainPilot
open LookupCachePilot
namespace Family391MainPilot
theorem checked_24406_70 : validate cache_24406_70 24406 =
    some 24476 := by
  decide +kernel
theorem checked : validate cache 24406 = some 24476 :=
  checked_24406_70
end Family391MainPilot
open LookupCachePilot
namespace Family392MainPilot
theorem checked_24476_200 : validate cache_24476_200 24476 =
    some 24676 := by
  decide +kernel
theorem checked_24676_200 : validate cache_24676_200 24676 =
    some 24876 := by
  decide +kernel
theorem checked_24476_400 : validate cache_24476_400 24476 =
    some 24876 := by
  exact validate_branch 200 cache_24476_200 cache_24676_200
    24476 24676 24876
    checked_24476_200 rfl checked_24676_200
theorem checked : validate cache 24476 = some 24876 :=
  checked_24476_400
end Family392MainPilot
open LookupCachePilot
namespace Family393MainPilot
theorem checked_24876_5 : validate cache_24876_5 24876 =
    some 24881 := by
  decide +kernel
theorem checked : validate cache 24876 = some 24881 :=
  checked_24876_5
end Family393MainPilot
open LookupCachePilot
namespace Family394MainPilot
theorem checked_24881_70 : validate cache_24881_70 24881 =
    some 24951 := by
  decide +kernel
theorem checked : validate cache 24881 = some 24951 :=
  checked_24881_70
end Family394MainPilot
open LookupCachePilot
namespace Family395MainPilot
theorem checked_24951_185 : validate cache_24951_185 24951 =
    some 25136 := by
  decide +kernel
theorem checked_25136_185 : validate cache_25136_185 25136 =
    some 25321 := by
  decide +kernel
theorem checked_24951_370 : validate cache_24951_370 24951 =
    some 25321 := by
  exact validate_branch 185 cache_24951_185 cache_25136_185
    24951 25136 25321
    checked_24951_185 rfl checked_25136_185
theorem checked : validate cache 24951 = some 25321 :=
  checked_24951_370
end Family395MainPilot
open LookupCachePilot
namespace Family396MainPilot
theorem checked_25321_5 : validate cache_25321_5 25321 =
    some 25326 := by
  decide +kernel
theorem checked : validate cache 25321 = some 25326 :=
  checked_25321_5
end Family396MainPilot
open LookupCachePilot
namespace Family397MainPilot
theorem checked_25326_70 : validate cache_25326_70 25326 =
    some 25396 := by
  decide +kernel
theorem checked : validate cache 25326 = some 25396 :=
  checked_25326_70
end Family397MainPilot
open LookupCachePilot
namespace Family398MainPilot
theorem checked_25396_200 : validate cache_25396_200 25396 =
    some 25596 := by
  decide +kernel
theorem checked_25596_200 : validate cache_25596_200 25596 =
    some 25796 := by
  decide +kernel
theorem checked_25396_400 : validate cache_25396_400 25396 =
    some 25796 := by
  exact validate_branch 200 cache_25396_200 cache_25596_200
    25396 25596 25796
    checked_25396_200 rfl checked_25596_200
theorem checked : validate cache 25396 = some 25796 :=
  checked_25396_400
end Family398MainPilot
open LookupCachePilot
namespace Family399MainPilot
theorem checked_25796_5 : validate cache_25796_5 25796 =
    some 25801 := by
  decide +kernel
theorem checked : validate cache 25796 = some 25801 :=
  checked_25796_5
end Family399MainPilot
open LookupCachePilot
namespace Family400MainPilot
theorem checked_25801_70 : validate cache_25801_70 25801 =
    some 25871 := by
  decide +kernel
theorem checked : validate cache 25801 = some 25871 :=
  checked_25801_70
end Family400MainPilot
open LookupCachePilot
namespace Family401MainPilot
theorem checked_25871_152 : validate cache_25871_152 25871 =
    some 26023 := by
  decide +kernel
theorem checked_26023_153 : validate cache_26023_153 26023 =
    some 26176 := by
  decide +kernel
theorem checked_25871_305 : validate cache_25871_305 25871 =
    some 26176 := by
  exact validate_branch 152 cache_25871_152 cache_26023_153
    25871 26023 26176
    checked_25871_152 rfl checked_26023_153
theorem checked : validate cache 25871 = some 26176 :=
  checked_25871_305
end Family401MainPilot
open LookupCachePilot
namespace Family402MainPilot
theorem checked_26176_70 : validate cache_26176_70 26176 =
    some 26246 := by
  decide +kernel
theorem checked : validate cache 26176 = some 26246 :=
  checked_26176_70
end Family402MainPilot
open LookupCachePilot
namespace Family403MainPilot
theorem checked_26246_5 : validate cache_26246_5 26246 =
    some 26251 := by
  decide +kernel
theorem checked : validate cache 26246 = some 26251 :=
  checked_26246_5
end Family403MainPilot
open LookupCachePilot
namespace Family404MainPilot
theorem checked_26251_70 : validate cache_26251_70 26251 =
    some 26321 := by
  decide +kernel
theorem checked : validate cache 26251 = some 26321 :=
  checked_26251_70
end Family404MainPilot
open LookupCachePilot
namespace Family405MainPilot
theorem checked_26321_132 : validate cache_26321_132 26321 =
    some 26453 := by
  decide +kernel
theorem checked_26453_133 : validate cache_26453_133 26453 =
    some 26586 := by
  decide +kernel
theorem checked_26321_265 : validate cache_26321_265 26321 =
    some 26586 := by
  exact validate_branch 132 cache_26321_132 cache_26453_133
    26321 26453 26586
    checked_26321_132 rfl checked_26453_133
theorem checked : validate cache 26321 = some 26586 :=
  checked_26321_265
end Family405MainPilot
open LookupCachePilot
namespace Family406MainPilot
theorem checked_26586_5 : validate cache_26586_5 26586 =
    some 26591 := by
  decide +kernel
theorem checked : validate cache 26586 = some 26591 :=
  checked_26586_5
end Family406MainPilot
open LookupCachePilot
namespace Family407MainPilot
theorem checked_26591_10 : validate cache_26591_10 26591 =
    some 26601 := by
  decide +kernel
theorem checked : validate cache 26591 = some 26601 :=
  checked_26591_10
end Family407MainPilot
open LookupCachePilot
namespace Family408MainPilot
theorem checked_26601_220 : validate cache_26601_220 26601 =
    some 26821 := by
  decide +kernel
theorem checked : validate cache 26601 = some 26821 :=
  checked_26601_220
end Family408MainPilot
open LookupCachePilot
namespace Family409MainPilot
theorem checked_26821_152 : validate cache_26821_152 26821 =
    some 26973 := by
  decide +kernel
theorem checked_26973_153 : validate cache_26973_153 26973 =
    some 27126 := by
  decide +kernel
theorem checked_26821_305 : validate cache_26821_305 26821 =
    some 27126 := by
  exact validate_branch 152 cache_26821_152 cache_26973_153
    26821 26973 27126
    checked_26821_152 rfl checked_26973_153
theorem checked : validate cache 26821 = some 27126 :=
  checked_26821_305
end Family409MainPilot
open LookupCachePilot
namespace Family410MainPilot
theorem checked_27126_70 : validate cache_27126_70 27126 =
    some 27196 := by
  decide +kernel
theorem checked : validate cache 27126 = some 27196 :=
  checked_27126_70
end Family410MainPilot
open LookupCachePilot
namespace Family411MainPilot
theorem checked_27196_195 : validate cache_27196_195 27196 =
    some 27391 := by
  decide +kernel
theorem checked : validate cache 27196 = some 27391 :=
  checked_27196_195
end Family411MainPilot
open LookupCachePilot
namespace Family412MainPilot
theorem checked_27391_70 : validate cache_27391_70 27391 =
    some 27461 := by
  decide +kernel
theorem checked : validate cache 27391 = some 27461 :=
  checked_27391_70
end Family412MainPilot
open LookupCachePilot
namespace Family413MainPilot
theorem checked_27461_132 : validate cache_27461_132 27461 =
    some 27593 := by
  decide +kernel
theorem checked_27593_133 : validate cache_27593_133 27593 =
    some 27726 := by
  decide +kernel
theorem checked_27461_265 : validate cache_27461_265 27461 =
    some 27726 := by
  exact validate_branch 132 cache_27461_132 cache_27593_133
    27461 27593 27726
    checked_27461_132 rfl checked_27593_133
theorem checked : validate cache 27461 = some 27726 :=
  checked_27461_265
end Family413MainPilot
open LookupCachePilot
namespace Family414MainPilot
theorem checked_27726_220 : validate cache_27726_220 27726 =
    some 27946 := by
  decide +kernel
theorem checked : validate cache 27726 = some 27946 :=
  checked_27726_220
end Family414MainPilot
open LookupCachePilot
namespace Family415MainPilot
theorem checked_27946_5 : validate cache_27946_5 27946 =
    some 27951 := by
  decide +kernel
theorem checked : validate cache 27946 = some 27951 :=
  checked_27946_5
end Family415MainPilot
open LookupCachePilot
namespace Family416MainPilot
theorem checked_27951_70 : validate cache_27951_70 27951 =
    some 28021 := by
  decide +kernel
theorem checked : validate cache 27951 = some 28021 :=
  checked_27951_70
end Family416MainPilot
open LookupCachePilot
namespace Family417MainPilot
theorem checked_28021_132 : validate cache_28021_132 28021 =
    some 28153 := by
  decide +kernel
theorem checked_28153_133 : validate cache_28153_133 28153 =
    some 28286 := by
  decide +kernel
theorem checked_28021_265 : validate cache_28021_265 28021 =
    some 28286 := by
  exact validate_branch 132 cache_28021_132 cache_28153_133
    28021 28153 28286
    checked_28021_132 rfl checked_28153_133
theorem checked : validate cache 28021 = some 28286 :=
  checked_28021_265
end Family417MainPilot
open LookupCachePilot
namespace Family418MainPilot
theorem checked_28286_5 : validate cache_28286_5 28286 =
    some 28291 := by
  decide +kernel
theorem checked : validate cache 28286 = some 28291 :=
  checked_28286_5
end Family418MainPilot
open LookupCachePilot
namespace Family419MainPilot
theorem checked_28291_10 : validate cache_28291_10 28291 =
    some 28301 := by
  decide +kernel
theorem checked : validate cache 28291 = some 28301 :=
  checked_28291_10
end Family419MainPilot
open LookupCachePilot
namespace Family420MainPilot
theorem checked_28301_185 : validate cache_28301_185 28301 =
    some 28486 := by
  decide +kernel
theorem checked_28486_185 : validate cache_28486_185 28486 =
    some 28671 := by
  decide +kernel
theorem checked_28301_370 : validate cache_28301_370 28301 =
    some 28671 := by
  exact validate_branch 185 cache_28301_185 cache_28486_185
    28301 28486 28671
    checked_28301_185 rfl checked_28486_185
theorem checked : validate cache 28301 = some 28671 :=
  checked_28301_370
end Family420MainPilot
open LookupCachePilot
namespace Family421MainPilot
theorem checked_28671_220 : validate cache_28671_220 28671 =
    some 28891 := by
  decide +kernel
theorem checked_28891_220 : validate cache_28891_220 28891 =
    some 29111 := by
  decide +kernel
theorem checked_28671_440 : validate cache_28671_440 28671 =
    some 29111 := by
  exact validate_branch 220 cache_28671_220 cache_28891_220
    28671 28891 29111
    checked_28671_220 rfl checked_28891_220
theorem checked : validate cache 28671 = some 29111 :=
  checked_28671_440
end Family421MainPilot
open LookupCachePilot
namespace Family422MainPilot
theorem checked_29111_70 : validate cache_29111_70 29111 =
    some 29181 := by
  decide +kernel
theorem checked : validate cache 29111 = some 29181 :=
  checked_29111_70
end Family422MainPilot
open LookupCachePilot
namespace Family423MainPilot
theorem checked_29181_195 : validate cache_29181_195 29181 =
    some 29376 := by
  decide +kernel
theorem checked : validate cache 29181 = some 29376 :=
  checked_29181_195
end Family423MainPilot
open LookupCachePilot
namespace Family424MainPilot
theorem checked_29376_70 : validate cache_29376_70 29376 =
    some 29446 := by
  decide +kernel
theorem checked : validate cache 29376 = some 29446 :=
  checked_29376_70
end Family424MainPilot
open LookupCachePilot
namespace Family425MainPilot
theorem checked_29446_200 : validate cache_29446_200 29446 =
    some 29646 := by
  decide +kernel
theorem checked_29646_200 : validate cache_29646_200 29646 =
    some 29846 := by
  decide +kernel
theorem checked_29446_400 : validate cache_29446_400 29446 =
    some 29846 := by
  exact validate_branch 200 cache_29446_200 cache_29646_200
    29446 29646 29846
    checked_29446_200 rfl checked_29646_200
theorem checked : validate cache 29446 = some 29846 :=
  checked_29446_400
end Family425MainPilot
open LookupCachePilot
namespace Family426MainPilot
theorem checked_29846_5 : validate cache_29846_5 29846 =
    some 29851 := by
  decide +kernel
theorem checked : validate cache 29846 = some 29851 :=
  checked_29846_5
end Family426MainPilot
open LookupCachePilot
namespace Family427MainPilot
theorem checked_29851_70 : validate cache_29851_70 29851 =
    some 29921 := by
  decide +kernel
theorem checked : validate cache 29851 = some 29921 :=
  checked_29851_70
end Family427MainPilot
open LookupCachePilot
namespace Family428MainPilot
theorem checked_29921_185 : validate cache_29921_185 29921 =
    some 30106 := by
  decide +kernel
theorem checked_30106_185 : validate cache_30106_185 30106 =
    some 30291 := by
  decide +kernel
theorem checked_29921_370 : validate cache_29921_370 29921 =
    some 30291 := by
  exact validate_branch 185 cache_29921_185 cache_30106_185
    29921 30106 30291
    checked_29921_185 rfl checked_30106_185
theorem checked : validate cache 29921 = some 30291 :=
  checked_29921_370
end Family428MainPilot
open LookupCachePilot
namespace Family429MainPilot
theorem checked_30291_5 : validate cache_30291_5 30291 =
    some 30296 := by
  decide +kernel
theorem checked : validate cache 30291 = some 30296 :=
  checked_30291_5
end Family429MainPilot
open LookupCachePilot
namespace Family430MainPilot
theorem checked_30296_70 : validate cache_30296_70 30296 =
    some 30366 := by
  decide +kernel
theorem checked : validate cache 30296 = some 30366 :=
  checked_30296_70
end Family430MainPilot
open LookupCachePilot
namespace Family431MainPilot
theorem checked_30366_200 : validate cache_30366_200 30366 =
    some 30566 := by
  decide +kernel
theorem checked_30566_200 : validate cache_30566_200 30566 =
    some 30766 := by
  decide +kernel
theorem checked_30366_400 : validate cache_30366_400 30366 =
    some 30766 := by
  exact validate_branch 200 cache_30366_200 cache_30566_200
    30366 30566 30766
    checked_30366_200 rfl checked_30566_200
theorem checked : validate cache 30366 = some 30766 :=
  checked_30366_400
end Family431MainPilot
open LookupCachePilot
namespace Family432MainPilot
theorem checked_30766_5 : validate cache_30766_5 30766 =
    some 30771 := by
  decide +kernel
theorem checked : validate cache 30766 = some 30771 :=
  checked_30766_5
end Family432MainPilot
open LookupCachePilot
namespace Family433MainPilot
theorem checked_30771_10 : validate cache_30771_10 30771 =
    some 30781 := by
  decide +kernel
theorem checked : validate cache 30771 = some 30781 :=
  checked_30771_10
end Family433MainPilot
open LookupCachePilot
namespace Family434MainPilot
theorem checked_30781_130 : validate cache_30781_130 30781 =
    some 30911 := by
  decide +kernel
theorem checked_30911_130 : validate cache_30911_130 30911 =
    some 31041 := by
  decide +kernel
theorem checked_30781_260 : validate cache_30781_260 30781 =
    some 31041 := by
  exact validate_branch 130 cache_30781_130 cache_30911_130
    30781 30911 31041
    checked_30781_130 rfl checked_30911_130
theorem checked_31041_130 : validate cache_31041_130 31041 =
    some 31171 := by
  decide +kernel
theorem checked_31171_130 : validate cache_31171_130 31171 =
    some 31301 := by
  decide +kernel
theorem checked_31041_260 : validate cache_31041_260 31041 =
    some 31301 := by
  exact validate_branch 130 cache_31041_130 cache_31171_130
    31041 31171 31301
    checked_31041_130 rfl checked_31171_130
theorem checked_30781_520 : validate cache_30781_520 30781 =
    some 31301 := by
  exact validate_branch 260 cache_30781_260 cache_31041_260
    30781 31041 31301
    checked_30781_260 rfl checked_31041_260
theorem checked : validate cache 30781 = some 31301 :=
  checked_30781_520
end Family434MainPilot
open LookupCachePilot
namespace Family435MainPilot
theorem checked_31301_143 : validate cache_31301_143 31301 =
    some 31444 := by
  decide +kernel
theorem checked_31444_144 : validate cache_31444_144 31444 =
    some 31588 := by
  decide +kernel
theorem checked_31301_287 : validate cache_31301_287 31301 =
    some 31588 := by
  exact validate_branch 143 cache_31301_143 cache_31444_144
    31301 31444 31588
    checked_31301_143 rfl checked_31444_144
theorem checked_31588_144 : validate cache_31588_144 31588 =
    some 31732 := by
  decide +kernel
theorem checked_31732_144 : validate cache_31732_144 31732 =
    some 31876 := by
  decide +kernel
theorem checked_31588_288 : validate cache_31588_288 31588 =
    some 31876 := by
  exact validate_branch 144 cache_31588_144 cache_31732_144
    31588 31732 31876
    checked_31588_144 rfl checked_31732_144
theorem checked_31301_575 : validate cache_31301_575 31301 =
    some 31876 := by
  exact validate_branch 287 cache_31301_287 cache_31588_288
    31301 31588 31876
    checked_31301_287 rfl checked_31588_288
theorem checked : validate cache 31301 = some 31876 :=
  checked_31301_575
end Family435MainPilot
open LookupCachePilot
namespace Family436MainPilot
theorem checked_31876_70 : validate cache_31876_70 31876 =
    some 31946 := by
  decide +kernel
theorem checked : validate cache 31876 = some 31946 :=
  checked_31876_70
end Family436MainPilot
open LookupCachePilot
namespace Family437MainPilot
theorem checked_31946_195 : validate cache_31946_195 31946 =
    some 32141 := by
  decide +kernel
theorem checked : validate cache 31946 = some 32141 :=
  checked_31946_195
end Family437MainPilot
open LookupCachePilot
namespace Family438MainPilot
theorem checked_32141_70 : validate cache_32141_70 32141 =
    some 32211 := by
  decide +kernel
theorem checked : validate cache 32141 = some 32211 :=
  checked_32141_70
end Family438MainPilot
open LookupCachePilot
namespace Family439MainPilot
theorem checked_32211_133 : validate cache_32211_133 32211 =
    some 32344 := by
  decide +kernel
theorem checked_32344_134 : validate cache_32344_134 32344 =
    some 32478 := by
  decide +kernel
theorem checked_32211_267 : validate cache_32211_267 32211 =
    some 32478 := by
  exact validate_branch 133 cache_32211_133 cache_32344_134
    32211 32344 32478
    checked_32211_133 rfl checked_32344_134
theorem checked_32478_134 : validate cache_32478_134 32478 =
    some 32612 := by
  decide +kernel
theorem checked_32612_134 : validate cache_32612_134 32612 =
    some 32746 := by
  decide +kernel
theorem checked_32478_268 : validate cache_32478_268 32478 =
    some 32746 := by
  exact validate_branch 134 cache_32478_134 cache_32612_134
    32478 32612 32746
    checked_32478_134 rfl checked_32612_134
theorem checked_32211_535 : validate cache_32211_535 32211 =
    some 32746 := by
  exact validate_branch 267 cache_32211_267 cache_32478_268
    32211 32478 32746
    checked_32211_267 rfl checked_32478_268
theorem checked : validate cache 32211 = some 32746 :=
  checked_32211_535
end Family439MainPilot
open LookupCachePilot
namespace Family440MainPilot
theorem checked_32746_5 : validate cache_32746_5 32746 =
    some 32751 := by
  decide +kernel
theorem checked : validate cache 32746 = some 32751 :=
  checked_32746_5
end Family440MainPilot
open LookupCachePilot
namespace Family441MainPilot
theorem checked_32751_70 : validate cache_32751_70 32751 =
    some 32821 := by
  decide +kernel
theorem checked : validate cache 32751 = some 32821 :=
  checked_32751_70
end Family441MainPilot
open LookupCachePilot
namespace Family442MainPilot
theorem checked_32821_167 : validate cache_32821_167 32821 =
    some 32988 := by
  decide +kernel
theorem checked_32988_168 : validate cache_32988_168 32988 =
    some 33156 := by
  decide +kernel
theorem checked_32821_335 : validate cache_32821_335 32821 =
    some 33156 := by
  exact validate_branch 167 cache_32821_167 cache_32988_168
    32821 32988 33156
    checked_32821_167 rfl checked_32988_168
theorem checked_33156_167 : validate cache_33156_167 33156 =
    some 33323 := by
  decide +kernel
theorem checked_33323_168 : validate cache_33323_168 33323 =
    some 33491 := by
  decide +kernel
theorem checked_33156_335 : validate cache_33156_335 33156 =
    some 33491 := by
  exact validate_branch 167 cache_33156_167 cache_33323_168
    33156 33323 33491
    checked_33156_167 rfl checked_33323_168
theorem checked_32821_670 : validate cache_32821_670 32821 =
    some 33491 := by
  exact validate_branch 335 cache_32821_335 cache_33156_335
    32821 33156 33491
    checked_32821_335 rfl checked_33156_335
theorem checked : validate cache 32821 = some 33491 :=
  checked_32821_670
end Family442MainPilot
open LookupCachePilot
namespace Family443MainPilot
theorem checked_33491_70 : validate cache_33491_70 33491 =
    some 33561 := by
  decide +kernel
theorem checked : validate cache 33491 = some 33561 :=
  checked_33491_70
end Family443MainPilot
namespace FamilyViews003Pilot
noncomputable def windows_359 : List WorkingViewPilot.Window := [
  ⟨17566, 18236, Family359MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_359 : WorkingViewPilot.checks windows_359 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨17566, 18236, Family359MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family359MainPilot.cache 17566 =
          some 18236 ∧ 18236 ≤ 573802 from
          ⟨Family359MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_359 : ∀ w ∈ windows_359, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_359 checked_359
noncomputable def fromRaw_359 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_359) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_359 checked_359 q raw nodes returns truth
noncomputable def windows_360 : List WorkingViewPilot.Window := [
  ⟨18236, 18241, Family360MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_360 : WorkingViewPilot.checks windows_360 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨18236, 18241, Family360MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family360MainPilot.cache 18236 =
          some 18241 ∧ 18241 ≤ 573802 from
          ⟨Family360MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_360 : ∀ w ∈ windows_360, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_360 checked_360
noncomputable def fromRaw_360 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_360) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_360 checked_360 q raw nodes returns truth
noncomputable def windows_361 : List WorkingViewPilot.Window := [
  ⟨18241, 18311, Family361MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_361 : WorkingViewPilot.checks windows_361 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨18241, 18311, Family361MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family361MainPilot.cache 18241 =
          some 18311 ∧ 18311 ≤ 573802 from
          ⟨Family361MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_361 : ∀ w ∈ windows_361, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_361 checked_361
noncomputable def fromRaw_361 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_361) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_361 checked_361 q raw nodes returns truth
noncomputable def windows_362 : List WorkingViewPilot.Window := [
  ⟨18311, 18531, Family362MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_362 : WorkingViewPilot.checks windows_362 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨18311, 18531, Family362MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family362MainPilot.cache 18311 =
          some 18531 ∧ 18531 ≤ 573802 from
          ⟨Family362MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_362 : ∀ w ∈ windows_362, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_362 checked_362
noncomputable def fromRaw_362 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_362) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_362 checked_362 q raw nodes returns truth
noncomputable def windows_363 : List WorkingViewPilot.Window := [
  ⟨18531, 18601, Family363MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_363 : WorkingViewPilot.checks windows_363 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨18531, 18601, Family363MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family363MainPilot.cache 18531 =
          some 18601 ∧ 18601 ≤ 573802 from
          ⟨Family363MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_363 : ∀ w ∈ windows_363, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_363 checked_363
noncomputable def fromRaw_363 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_363) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_363 checked_363 q raw nodes returns truth
noncomputable def windows_364 : List WorkingViewPilot.Window := [
  ⟨18601, 18866, Family364MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_364 : WorkingViewPilot.checks windows_364 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨18601, 18866, Family364MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family364MainPilot.cache 18601 =
          some 18866 ∧ 18866 ≤ 573802 from
          ⟨Family364MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_364 : ∀ w ∈ windows_364, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_364 checked_364
noncomputable def fromRaw_364 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_364) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_364 checked_364 q raw nodes returns truth
noncomputable def windows_365 : List WorkingViewPilot.Window := [
  ⟨18866, 19086, Family365MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_365 : WorkingViewPilot.checks windows_365 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨18866, 19086, Family365MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family365MainPilot.cache 18866 =
          some 19086 ∧ 19086 ≤ 573802 from
          ⟨Family365MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_365 : ∀ w ∈ windows_365, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_365 checked_365
noncomputable def fromRaw_365 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_365) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_365 checked_365 q raw nodes returns truth
noncomputable def windows_366 : List WorkingViewPilot.Window := [
  ⟨19086, 19091, Family366MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_366 : WorkingViewPilot.checks windows_366 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨19086, 19091, Family366MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family366MainPilot.cache 19086 =
          some 19091 ∧ 19091 ≤ 573802 from
          ⟨Family366MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_366 : ∀ w ∈ windows_366, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_366 checked_366
noncomputable def fromRaw_366 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_366) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_366 checked_366 q raw nodes returns truth
noncomputable def windows_367 : List WorkingViewPilot.Window := [
  ⟨19091, 19161, Family367MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_367 : WorkingViewPilot.checks windows_367 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨19091, 19161, Family367MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family367MainPilot.cache 19091 =
          some 19161 ∧ 19161 ≤ 573802 from
          ⟨Family367MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_367 : ∀ w ∈ windows_367, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_367 checked_367
noncomputable def fromRaw_367 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_367) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_367 checked_367 q raw nodes returns truth
noncomputable def windows_368 : List WorkingViewPilot.Window := [
  ⟨19161, 19426, Family368MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_368 : WorkingViewPilot.checks windows_368 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨19161, 19426, Family368MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family368MainPilot.cache 19161 =
          some 19426 ∧ 19426 ≤ 573802 from
          ⟨Family368MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_368 : ∀ w ∈ windows_368, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_368 checked_368
noncomputable def fromRaw_368 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_368) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_368 checked_368 q raw nodes returns truth
noncomputable def windows_369 : List WorkingViewPilot.Window := [
  ⟨19426, 19431, Family369MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_369 : WorkingViewPilot.checks windows_369 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨19426, 19431, Family369MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family369MainPilot.cache 19426 =
          some 19431 ∧ 19431 ≤ 573802 from
          ⟨Family369MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_369 : ∀ w ∈ windows_369, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_369 checked_369
noncomputable def fromRaw_369 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_369) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_369 checked_369 q raw nodes returns truth
noncomputable def windows_370 : List WorkingViewPilot.Window := [
  ⟨19431, 19441, Family370MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_370 : WorkingViewPilot.checks windows_370 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨19431, 19441, Family370MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family370MainPilot.cache 19431 =
          some 19441 ∧ 19441 ≤ 573802 from
          ⟨Family370MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_370 : ∀ w ∈ windows_370, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_370 checked_370
noncomputable def fromRaw_370 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_370) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_370 checked_370 q raw nodes returns truth
noncomputable def windows_371 : List WorkingViewPilot.Window := [
  ⟨19441, 19811, Family371MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_371 : WorkingViewPilot.checks windows_371 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨19441, 19811, Family371MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family371MainPilot.cache 19441 =
          some 19811 ∧ 19811 ≤ 573802 from
          ⟨Family371MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_371 : ∀ w ∈ windows_371, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_371 checked_371
noncomputable def fromRaw_371 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_371) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_371 checked_371 q raw nodes returns truth
noncomputable def windows_372 : List WorkingViewPilot.Window := [
  ⟨19811, 20251, Family372MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_372 : WorkingViewPilot.checks windows_372 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨19811, 20251, Family372MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family372MainPilot.cache 19811 =
          some 20251 ∧ 20251 ≤ 573802 from
          ⟨Family372MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_372 : ∀ w ∈ windows_372, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_372 checked_372
noncomputable def fromRaw_372 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_372) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_372 checked_372 q raw nodes returns truth
noncomputable def windows_373 : List WorkingViewPilot.Window := [
  ⟨20251, 20321, Family373MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_373 : WorkingViewPilot.checks windows_373 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨20251, 20321, Family373MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family373MainPilot.cache 20251 =
          some 20321 ∧ 20321 ≤ 573802 from
          ⟨Family373MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_373 : ∀ w ∈ windows_373, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_373 checked_373
noncomputable def fromRaw_373 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_373) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_373 checked_373 q raw nodes returns truth
noncomputable def windows_374 : List WorkingViewPilot.Window := [
  ⟨20321, 20516, Family374MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_374 : WorkingViewPilot.checks windows_374 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨20321, 20516, Family374MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family374MainPilot.cache 20321 =
          some 20516 ∧ 20516 ≤ 573802 from
          ⟨Family374MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_374 : ∀ w ∈ windows_374, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_374 checked_374
noncomputable def fromRaw_374 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_374) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_374 checked_374 q raw nodes returns truth
noncomputable def windows_375 : List WorkingViewPilot.Window := [
  ⟨20516, 20586, Family375MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_375 : WorkingViewPilot.checks windows_375 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨20516, 20586, Family375MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family375MainPilot.cache 20516 =
          some 20586 ∧ 20586 ≤ 573802 from
          ⟨Family375MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_375 : ∀ w ∈ windows_375, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_375 checked_375
noncomputable def fromRaw_375 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_375) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_375 checked_375 q raw nodes returns truth
noncomputable def windows_376 : List WorkingViewPilot.Window := [
  ⟨20586, 20986, Family376MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_376 : WorkingViewPilot.checks windows_376 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨20586, 20986, Family376MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family376MainPilot.cache 20586 =
          some 20986 ∧ 20986 ≤ 573802 from
          ⟨Family376MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_376 : ∀ w ∈ windows_376, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_376 checked_376
noncomputable def fromRaw_376 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_376) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_376 checked_376 q raw nodes returns truth
noncomputable def windows_377 : List WorkingViewPilot.Window := [
  ⟨20986, 20991, Family377MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_377 : WorkingViewPilot.checks windows_377 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨20986, 20991, Family377MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family377MainPilot.cache 20986 =
          some 20991 ∧ 20991 ≤ 573802 from
          ⟨Family377MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_377 : ∀ w ∈ windows_377, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_377 checked_377
noncomputable def fromRaw_377 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_377) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_377 checked_377 q raw nodes returns truth
noncomputable def windows_378 : List WorkingViewPilot.Window := [
  ⟨20991, 21061, Family378MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_378 : WorkingViewPilot.checks windows_378 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨20991, 21061, Family378MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family378MainPilot.cache 20991 =
          some 21061 ∧ 21061 ≤ 573802 from
          ⟨Family378MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_378 : ∀ w ∈ windows_378, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_378 checked_378
noncomputable def fromRaw_378 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_378) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_378 checked_378 q raw nodes returns truth
noncomputable def windows_379 : List WorkingViewPilot.Window := [
  ⟨21061, 21731, Family379MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_379 : WorkingViewPilot.checks windows_379 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨21061, 21731, Family379MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family379MainPilot.cache 21061 =
          some 21731 ∧ 21731 ≤ 573802 from
          ⟨Family379MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_379 : ∀ w ∈ windows_379, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_379 checked_379
noncomputable def fromRaw_379 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_379) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_379 checked_379 q raw nodes returns truth
noncomputable def windows_380 : List WorkingViewPilot.Window := [
  ⟨21731, 21801, Family380MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_380 : WorkingViewPilot.checks windows_380 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨21731, 21801, Family380MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family380MainPilot.cache 21731 =
          some 21801 ∧ 21801 ≤ 573802 from
          ⟨Family380MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_380 : ∀ w ∈ windows_380, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_380 checked_380
noncomputable def fromRaw_380 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_380) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_380 checked_380 q raw nodes returns truth
noncomputable def windows_381 : List WorkingViewPilot.Window := [
  ⟨21801, 22471, Family381MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_381 : WorkingViewPilot.checks windows_381 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨21801, 22471, Family381MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family381MainPilot.cache 21801 =
          some 22471 ∧ 22471 ≤ 573802 from
          ⟨Family381MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_381 : ∀ w ∈ windows_381, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_381 checked_381
noncomputable def fromRaw_381 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_381) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_381 checked_381 q raw nodes returns truth
noncomputable def windows_382 : List WorkingViewPilot.Window := [
  ⟨22471, 22476, Family382MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_382 : WorkingViewPilot.checks windows_382 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨22471, 22476, Family382MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family382MainPilot.cache 22471 =
          some 22476 ∧ 22476 ≤ 573802 from
          ⟨Family382MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_382 : ∀ w ∈ windows_382, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_382 checked_382
noncomputable def fromRaw_382 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_382) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_382 checked_382 q raw nodes returns truth
noncomputable def windows_383 : List WorkingViewPilot.Window := [
  ⟨22476, 22546, Family383MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_383 : WorkingViewPilot.checks windows_383 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨22476, 22546, Family383MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family383MainPilot.cache 22476 =
          some 22546 ∧ 22546 ≤ 573802 from
          ⟨Family383MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_383 : ∀ w ∈ windows_383, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_383 checked_383
noncomputable def fromRaw_383 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_383) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_383 checked_383 q raw nodes returns truth
noncomputable def windows_384 : List WorkingViewPilot.Window := [
  ⟨22546, 23216, Family384MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_384 : WorkingViewPilot.checks windows_384 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨22546, 23216, Family384MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family384MainPilot.cache 22546 =
          some 23216 ∧ 23216 ≤ 573802 from
          ⟨Family384MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_384 : ∀ w ∈ windows_384, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_384 checked_384
noncomputable def fromRaw_384 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_384) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_384 checked_384 q raw nodes returns truth
noncomputable def windows_385 : List WorkingViewPilot.Window := [
  ⟨23216, 23286, Family385MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_385 : WorkingViewPilot.checks windows_385 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨23216, 23286, Family385MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family385MainPilot.cache 23216 =
          some 23286 ∧ 23286 ≤ 573802 from
          ⟨Family385MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_385 : ∀ w ∈ windows_385, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_385 checked_385
noncomputable def fromRaw_385 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_385) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_385 checked_385 q raw nodes returns truth
noncomputable def windows_386 : List WorkingViewPilot.Window := [
  ⟨23286, 23956, Family386MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_386 : WorkingViewPilot.checks windows_386 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨23286, 23956, Family386MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family386MainPilot.cache 23286 =
          some 23956 ∧ 23956 ≤ 573802 from
          ⟨Family386MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_386 : ∀ w ∈ windows_386, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_386 checked_386
noncomputable def fromRaw_386 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_386) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_386 checked_386 q raw nodes returns truth
noncomputable def windows_387 : List WorkingViewPilot.Window := [
  ⟨23956, 23961, Family387MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_387 : WorkingViewPilot.checks windows_387 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨23956, 23961, Family387MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family387MainPilot.cache 23956 =
          some 23961 ∧ 23961 ≤ 573802 from
          ⟨Family387MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_387 : ∀ w ∈ windows_387, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_387 checked_387
noncomputable def fromRaw_387 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_387) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_387 checked_387 q raw nodes returns truth
noncomputable def windows_388 : List WorkingViewPilot.Window := [
  ⟨23961, 24031, Family388MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_388 : WorkingViewPilot.checks windows_388 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨23961, 24031, Family388MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family388MainPilot.cache 23961 =
          some 24031 ∧ 24031 ≤ 573802 from
          ⟨Family388MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_388 : ∀ w ∈ windows_388, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_388 checked_388
noncomputable def fromRaw_388 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_388) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_388 checked_388 q raw nodes returns truth
noncomputable def windows_389 : List WorkingViewPilot.Window := [
  ⟨24031, 24401, Family389MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_389 : WorkingViewPilot.checks windows_389 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨24031, 24401, Family389MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family389MainPilot.cache 24031 =
          some 24401 ∧ 24401 ≤ 573802 from
          ⟨Family389MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_389 : ∀ w ∈ windows_389, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_389 checked_389
noncomputable def fromRaw_389 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_389) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_389 checked_389 q raw nodes returns truth
noncomputable def windows_390 : List WorkingViewPilot.Window := [
  ⟨24401, 24406, Family390MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_390 : WorkingViewPilot.checks windows_390 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨24401, 24406, Family390MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family390MainPilot.cache 24401 =
          some 24406 ∧ 24406 ≤ 573802 from
          ⟨Family390MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_390 : ∀ w ∈ windows_390, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_390 checked_390
noncomputable def fromRaw_390 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_390) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_390 checked_390 q raw nodes returns truth
noncomputable def windows_391 : List WorkingViewPilot.Window := [
  ⟨24406, 24476, Family391MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_391 : WorkingViewPilot.checks windows_391 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨24406, 24476, Family391MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family391MainPilot.cache 24406 =
          some 24476 ∧ 24476 ≤ 573802 from
          ⟨Family391MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_391 : ∀ w ∈ windows_391, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_391 checked_391
noncomputable def fromRaw_391 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_391) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_391 checked_391 q raw nodes returns truth
noncomputable def windows_392 : List WorkingViewPilot.Window := [
  ⟨24476, 24876, Family392MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_392 : WorkingViewPilot.checks windows_392 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨24476, 24876, Family392MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family392MainPilot.cache 24476 =
          some 24876 ∧ 24876 ≤ 573802 from
          ⟨Family392MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_392 : ∀ w ∈ windows_392, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_392 checked_392
noncomputable def fromRaw_392 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_392) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_392 checked_392 q raw nodes returns truth
noncomputable def windows_393 : List WorkingViewPilot.Window := [
  ⟨24876, 24881, Family393MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_393 : WorkingViewPilot.checks windows_393 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨24876, 24881, Family393MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family393MainPilot.cache 24876 =
          some 24881 ∧ 24881 ≤ 573802 from
          ⟨Family393MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_393 : ∀ w ∈ windows_393, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_393 checked_393
noncomputable def fromRaw_393 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_393) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_393 checked_393 q raw nodes returns truth
noncomputable def windows_394 : List WorkingViewPilot.Window := [
  ⟨24881, 24951, Family394MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_394 : WorkingViewPilot.checks windows_394 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨24881, 24951, Family394MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family394MainPilot.cache 24881 =
          some 24951 ∧ 24951 ≤ 573802 from
          ⟨Family394MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_394 : ∀ w ∈ windows_394, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_394 checked_394
noncomputable def fromRaw_394 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_394) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_394 checked_394 q raw nodes returns truth
noncomputable def windows_395 : List WorkingViewPilot.Window := [
  ⟨24951, 25321, Family395MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_395 : WorkingViewPilot.checks windows_395 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨24951, 25321, Family395MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family395MainPilot.cache 24951 =
          some 25321 ∧ 25321 ≤ 573802 from
          ⟨Family395MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_395 : ∀ w ∈ windows_395, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_395 checked_395
noncomputable def fromRaw_395 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_395) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_395 checked_395 q raw nodes returns truth
noncomputable def windows_396 : List WorkingViewPilot.Window := [
  ⟨25321, 25326, Family396MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_396 : WorkingViewPilot.checks windows_396 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨25321, 25326, Family396MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family396MainPilot.cache 25321 =
          some 25326 ∧ 25326 ≤ 573802 from
          ⟨Family396MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_396 : ∀ w ∈ windows_396, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_396 checked_396
noncomputable def fromRaw_396 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_396) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_396 checked_396 q raw nodes returns truth
noncomputable def windows_397 : List WorkingViewPilot.Window := [
  ⟨25326, 25396, Family397MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_397 : WorkingViewPilot.checks windows_397 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨25326, 25396, Family397MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family397MainPilot.cache 25326 =
          some 25396 ∧ 25396 ≤ 573802 from
          ⟨Family397MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_397 : ∀ w ∈ windows_397, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_397 checked_397
noncomputable def fromRaw_397 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_397) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_397 checked_397 q raw nodes returns truth
noncomputable def windows_398 : List WorkingViewPilot.Window := [
  ⟨25396, 25796, Family398MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_398 : WorkingViewPilot.checks windows_398 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨25396, 25796, Family398MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family398MainPilot.cache 25396 =
          some 25796 ∧ 25796 ≤ 573802 from
          ⟨Family398MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_398 : ∀ w ∈ windows_398, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_398 checked_398
noncomputable def fromRaw_398 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_398) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_398 checked_398 q raw nodes returns truth
noncomputable def windows_399 : List WorkingViewPilot.Window := [
  ⟨25796, 25801, Family399MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_399 : WorkingViewPilot.checks windows_399 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨25796, 25801, Family399MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family399MainPilot.cache 25796 =
          some 25801 ∧ 25801 ≤ 573802 from
          ⟨Family399MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_399 : ∀ w ∈ windows_399, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_399 checked_399
noncomputable def fromRaw_399 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_399) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_399 checked_399 q raw nodes returns truth
noncomputable def windows_400 : List WorkingViewPilot.Window := [
  ⟨25801, 25871, Family400MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_400 : WorkingViewPilot.checks windows_400 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨25801, 25871, Family400MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family400MainPilot.cache 25801 =
          some 25871 ∧ 25871 ≤ 573802 from
          ⟨Family400MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_400 : ∀ w ∈ windows_400, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_400 checked_400
noncomputable def fromRaw_400 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_400) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_400 checked_400 q raw nodes returns truth
noncomputable def windows_401 : List WorkingViewPilot.Window := [
  ⟨25871, 26176, Family401MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_401 : WorkingViewPilot.checks windows_401 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨25871, 26176, Family401MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family401MainPilot.cache 25871 =
          some 26176 ∧ 26176 ≤ 573802 from
          ⟨Family401MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_401 : ∀ w ∈ windows_401, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_401 checked_401
noncomputable def fromRaw_401 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_401) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_401 checked_401 q raw nodes returns truth
noncomputable def windows_402 : List WorkingViewPilot.Window := [
  ⟨26176, 26246, Family402MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_402 : WorkingViewPilot.checks windows_402 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨26176, 26246, Family402MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family402MainPilot.cache 26176 =
          some 26246 ∧ 26246 ≤ 573802 from
          ⟨Family402MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_402 : ∀ w ∈ windows_402, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_402 checked_402
noncomputable def fromRaw_402 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_402) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_402 checked_402 q raw nodes returns truth
noncomputable def windows_403 : List WorkingViewPilot.Window := [
  ⟨26246, 26251, Family403MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_403 : WorkingViewPilot.checks windows_403 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨26246, 26251, Family403MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family403MainPilot.cache 26246 =
          some 26251 ∧ 26251 ≤ 573802 from
          ⟨Family403MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_403 : ∀ w ∈ windows_403, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_403 checked_403
noncomputable def fromRaw_403 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_403) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_403 checked_403 q raw nodes returns truth
noncomputable def windows_404 : List WorkingViewPilot.Window := [
  ⟨26251, 26321, Family404MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_404 : WorkingViewPilot.checks windows_404 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨26251, 26321, Family404MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family404MainPilot.cache 26251 =
          some 26321 ∧ 26321 ≤ 573802 from
          ⟨Family404MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_404 : ∀ w ∈ windows_404, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_404 checked_404
noncomputable def fromRaw_404 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_404) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_404 checked_404 q raw nodes returns truth
noncomputable def windows_405 : List WorkingViewPilot.Window := [
  ⟨26321, 26586, Family405MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_405 : WorkingViewPilot.checks windows_405 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨26321, 26586, Family405MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family405MainPilot.cache 26321 =
          some 26586 ∧ 26586 ≤ 573802 from
          ⟨Family405MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_405 : ∀ w ∈ windows_405, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_405 checked_405
noncomputable def fromRaw_405 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_405) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_405 checked_405 q raw nodes returns truth
noncomputable def windows_406 : List WorkingViewPilot.Window := [
  ⟨26586, 26591, Family406MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_406 : WorkingViewPilot.checks windows_406 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨26586, 26591, Family406MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family406MainPilot.cache 26586 =
          some 26591 ∧ 26591 ≤ 573802 from
          ⟨Family406MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_406 : ∀ w ∈ windows_406, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_406 checked_406
noncomputable def fromRaw_406 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_406) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_406 checked_406 q raw nodes returns truth
noncomputable def windows_407 : List WorkingViewPilot.Window := [
  ⟨26591, 26601, Family407MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_407 : WorkingViewPilot.checks windows_407 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨26591, 26601, Family407MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family407MainPilot.cache 26591 =
          some 26601 ∧ 26601 ≤ 573802 from
          ⟨Family407MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_407 : ∀ w ∈ windows_407, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_407 checked_407
noncomputable def fromRaw_407 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_407) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_407 checked_407 q raw nodes returns truth
noncomputable def windows_408 : List WorkingViewPilot.Window := [
  ⟨26601, 26821, Family408MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_408 : WorkingViewPilot.checks windows_408 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨26601, 26821, Family408MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family408MainPilot.cache 26601 =
          some 26821 ∧ 26821 ≤ 573802 from
          ⟨Family408MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_408 : ∀ w ∈ windows_408, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_408 checked_408
noncomputable def fromRaw_408 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_408) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_408 checked_408 q raw nodes returns truth
noncomputable def windows_409 : List WorkingViewPilot.Window := [
  ⟨26821, 27126, Family409MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_409 : WorkingViewPilot.checks windows_409 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨26821, 27126, Family409MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family409MainPilot.cache 26821 =
          some 27126 ∧ 27126 ≤ 573802 from
          ⟨Family409MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_409 : ∀ w ∈ windows_409, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_409 checked_409
noncomputable def fromRaw_409 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_409) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_409 checked_409 q raw nodes returns truth
noncomputable def windows_410 : List WorkingViewPilot.Window := [
  ⟨27126, 27196, Family410MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_410 : WorkingViewPilot.checks windows_410 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨27126, 27196, Family410MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family410MainPilot.cache 27126 =
          some 27196 ∧ 27196 ≤ 573802 from
          ⟨Family410MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_410 : ∀ w ∈ windows_410, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_410 checked_410
noncomputable def fromRaw_410 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_410) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_410 checked_410 q raw nodes returns truth
noncomputable def windows_411 : List WorkingViewPilot.Window := [
  ⟨27196, 27391, Family411MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_411 : WorkingViewPilot.checks windows_411 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨27196, 27391, Family411MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family411MainPilot.cache 27196 =
          some 27391 ∧ 27391 ≤ 573802 from
          ⟨Family411MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_411 : ∀ w ∈ windows_411, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_411 checked_411
noncomputable def fromRaw_411 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_411) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_411 checked_411 q raw nodes returns truth
noncomputable def windows_412 : List WorkingViewPilot.Window := [
  ⟨27391, 27461, Family412MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_412 : WorkingViewPilot.checks windows_412 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨27391, 27461, Family412MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family412MainPilot.cache 27391 =
          some 27461 ∧ 27461 ≤ 573802 from
          ⟨Family412MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_412 : ∀ w ∈ windows_412, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_412 checked_412
noncomputable def fromRaw_412 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_412) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_412 checked_412 q raw nodes returns truth
noncomputable def windows_413 : List WorkingViewPilot.Window := [
  ⟨27461, 27726, Family413MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_413 : WorkingViewPilot.checks windows_413 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨27461, 27726, Family413MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family413MainPilot.cache 27461 =
          some 27726 ∧ 27726 ≤ 573802 from
          ⟨Family413MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_413 : ∀ w ∈ windows_413, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_413 checked_413
noncomputable def fromRaw_413 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_413) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_413 checked_413 q raw nodes returns truth
noncomputable def windows_414 : List WorkingViewPilot.Window := [
  ⟨27726, 27946, Family414MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_414 : WorkingViewPilot.checks windows_414 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨27726, 27946, Family414MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family414MainPilot.cache 27726 =
          some 27946 ∧ 27946 ≤ 573802 from
          ⟨Family414MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_414 : ∀ w ∈ windows_414, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_414 checked_414
noncomputable def fromRaw_414 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_414) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_414 checked_414 q raw nodes returns truth
noncomputable def windows_415 : List WorkingViewPilot.Window := [
  ⟨27946, 27951, Family415MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_415 : WorkingViewPilot.checks windows_415 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨27946, 27951, Family415MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family415MainPilot.cache 27946 =
          some 27951 ∧ 27951 ≤ 573802 from
          ⟨Family415MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_415 : ∀ w ∈ windows_415, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_415 checked_415
noncomputable def fromRaw_415 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_415) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_415 checked_415 q raw nodes returns truth
noncomputable def windows_416 : List WorkingViewPilot.Window := [
  ⟨27951, 28021, Family416MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_416 : WorkingViewPilot.checks windows_416 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨27951, 28021, Family416MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family416MainPilot.cache 27951 =
          some 28021 ∧ 28021 ≤ 573802 from
          ⟨Family416MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_416 : ∀ w ∈ windows_416, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_416 checked_416
noncomputable def fromRaw_416 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_416) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_416 checked_416 q raw nodes returns truth
noncomputable def windows_417 : List WorkingViewPilot.Window := [
  ⟨28021, 28286, Family417MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_417 : WorkingViewPilot.checks windows_417 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨28021, 28286, Family417MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family417MainPilot.cache 28021 =
          some 28286 ∧ 28286 ≤ 573802 from
          ⟨Family417MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_417 : ∀ w ∈ windows_417, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_417 checked_417
noncomputable def fromRaw_417 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_417) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_417 checked_417 q raw nodes returns truth
noncomputable def windows_418 : List WorkingViewPilot.Window := [
  ⟨28286, 28291, Family418MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_418 : WorkingViewPilot.checks windows_418 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨28286, 28291, Family418MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family418MainPilot.cache 28286 =
          some 28291 ∧ 28291 ≤ 573802 from
          ⟨Family418MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_418 : ∀ w ∈ windows_418, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_418 checked_418
noncomputable def fromRaw_418 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_418) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_418 checked_418 q raw nodes returns truth
noncomputable def windows_419 : List WorkingViewPilot.Window := [
  ⟨28291, 28301, Family419MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_419 : WorkingViewPilot.checks windows_419 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨28291, 28301, Family419MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family419MainPilot.cache 28291 =
          some 28301 ∧ 28301 ≤ 573802 from
          ⟨Family419MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_419 : ∀ w ∈ windows_419, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_419 checked_419
noncomputable def fromRaw_419 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_419) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_419 checked_419 q raw nodes returns truth
noncomputable def windows_420 : List WorkingViewPilot.Window := [
  ⟨28301, 28671, Family420MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_420 : WorkingViewPilot.checks windows_420 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨28301, 28671, Family420MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family420MainPilot.cache 28301 =
          some 28671 ∧ 28671 ≤ 573802 from
          ⟨Family420MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_420 : ∀ w ∈ windows_420, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_420 checked_420
noncomputable def fromRaw_420 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_420) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_420 checked_420 q raw nodes returns truth
noncomputable def windows_421 : List WorkingViewPilot.Window := [
  ⟨28671, 29111, Family421MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_421 : WorkingViewPilot.checks windows_421 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨28671, 29111, Family421MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family421MainPilot.cache 28671 =
          some 29111 ∧ 29111 ≤ 573802 from
          ⟨Family421MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_421 : ∀ w ∈ windows_421, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_421 checked_421
noncomputable def fromRaw_421 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_421) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_421 checked_421 q raw nodes returns truth
noncomputable def windows_422 : List WorkingViewPilot.Window := [
  ⟨29111, 29181, Family422MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_422 : WorkingViewPilot.checks windows_422 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨29111, 29181, Family422MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family422MainPilot.cache 29111 =
          some 29181 ∧ 29181 ≤ 573802 from
          ⟨Family422MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_422 : ∀ w ∈ windows_422, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_422 checked_422
noncomputable def fromRaw_422 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_422) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_422 checked_422 q raw nodes returns truth
noncomputable def windows_423 : List WorkingViewPilot.Window := [
  ⟨29181, 29376, Family423MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_423 : WorkingViewPilot.checks windows_423 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨29181, 29376, Family423MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family423MainPilot.cache 29181 =
          some 29376 ∧ 29376 ≤ 573802 from
          ⟨Family423MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_423 : ∀ w ∈ windows_423, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_423 checked_423
noncomputable def fromRaw_423 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_423) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_423 checked_423 q raw nodes returns truth
noncomputable def windows_424 : List WorkingViewPilot.Window := [
  ⟨29376, 29446, Family424MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_424 : WorkingViewPilot.checks windows_424 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨29376, 29446, Family424MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family424MainPilot.cache 29376 =
          some 29446 ∧ 29446 ≤ 573802 from
          ⟨Family424MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_424 : ∀ w ∈ windows_424, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_424 checked_424
noncomputable def fromRaw_424 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_424) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_424 checked_424 q raw nodes returns truth
noncomputable def windows_425 : List WorkingViewPilot.Window := [
  ⟨29446, 29846, Family425MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_425 : WorkingViewPilot.checks windows_425 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨29446, 29846, Family425MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family425MainPilot.cache 29446 =
          some 29846 ∧ 29846 ≤ 573802 from
          ⟨Family425MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_425 : ∀ w ∈ windows_425, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_425 checked_425
noncomputable def fromRaw_425 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_425) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_425 checked_425 q raw nodes returns truth
noncomputable def windows_426 : List WorkingViewPilot.Window := [
  ⟨29846, 29851, Family426MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_426 : WorkingViewPilot.checks windows_426 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨29846, 29851, Family426MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family426MainPilot.cache 29846 =
          some 29851 ∧ 29851 ≤ 573802 from
          ⟨Family426MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_426 : ∀ w ∈ windows_426, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_426 checked_426
noncomputable def fromRaw_426 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_426) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_426 checked_426 q raw nodes returns truth
noncomputable def windows_427 : List WorkingViewPilot.Window := [
  ⟨29851, 29921, Family427MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_427 : WorkingViewPilot.checks windows_427 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨29851, 29921, Family427MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family427MainPilot.cache 29851 =
          some 29921 ∧ 29921 ≤ 573802 from
          ⟨Family427MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_427 : ∀ w ∈ windows_427, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_427 checked_427
noncomputable def fromRaw_427 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_427) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_427 checked_427 q raw nodes returns truth
noncomputable def windows_428 : List WorkingViewPilot.Window := [
  ⟨29921, 30291, Family428MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_428 : WorkingViewPilot.checks windows_428 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨29921, 30291, Family428MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family428MainPilot.cache 29921 =
          some 30291 ∧ 30291 ≤ 573802 from
          ⟨Family428MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_428 : ∀ w ∈ windows_428, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_428 checked_428
noncomputable def fromRaw_428 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_428) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_428 checked_428 q raw nodes returns truth
noncomputable def windows_429 : List WorkingViewPilot.Window := [
  ⟨30291, 30296, Family429MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_429 : WorkingViewPilot.checks windows_429 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨30291, 30296, Family429MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family429MainPilot.cache 30291 =
          some 30296 ∧ 30296 ≤ 573802 from
          ⟨Family429MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_429 : ∀ w ∈ windows_429, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_429 checked_429
noncomputable def fromRaw_429 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_429) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_429 checked_429 q raw nodes returns truth
noncomputable def windows_430 : List WorkingViewPilot.Window := [
  ⟨30296, 30366, Family430MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_430 : WorkingViewPilot.checks windows_430 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨30296, 30366, Family430MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family430MainPilot.cache 30296 =
          some 30366 ∧ 30366 ≤ 573802 from
          ⟨Family430MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_430 : ∀ w ∈ windows_430, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_430 checked_430
noncomputable def fromRaw_430 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_430) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_430 checked_430 q raw nodes returns truth
noncomputable def windows_431 : List WorkingViewPilot.Window := [
  ⟨30366, 30766, Family431MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_431 : WorkingViewPilot.checks windows_431 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨30366, 30766, Family431MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family431MainPilot.cache 30366 =
          some 30766 ∧ 30766 ≤ 573802 from
          ⟨Family431MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_431 : ∀ w ∈ windows_431, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_431 checked_431
noncomputable def fromRaw_431 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_431) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_431 checked_431 q raw nodes returns truth
noncomputable def windows_432 : List WorkingViewPilot.Window := [
  ⟨30766, 30771, Family432MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_432 : WorkingViewPilot.checks windows_432 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨30766, 30771, Family432MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family432MainPilot.cache 30766 =
          some 30771 ∧ 30771 ≤ 573802 from
          ⟨Family432MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_432 : ∀ w ∈ windows_432, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_432 checked_432
noncomputable def fromRaw_432 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_432) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_432 checked_432 q raw nodes returns truth
noncomputable def windows_433 : List WorkingViewPilot.Window := [
  ⟨30771, 30781, Family433MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_433 : WorkingViewPilot.checks windows_433 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨30771, 30781, Family433MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family433MainPilot.cache 30771 =
          some 30781 ∧ 30781 ≤ 573802 from
          ⟨Family433MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_433 : ∀ w ∈ windows_433, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_433 checked_433
noncomputable def fromRaw_433 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_433) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_433 checked_433 q raw nodes returns truth
noncomputable def windows_434 : List WorkingViewPilot.Window := [
  ⟨30781, 31301, Family434MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_434 : WorkingViewPilot.checks windows_434 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨30781, 31301, Family434MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family434MainPilot.cache 30781 =
          some 31301 ∧ 31301 ≤ 573802 from
          ⟨Family434MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_434 : ∀ w ∈ windows_434, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_434 checked_434
noncomputable def fromRaw_434 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_434) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_434 checked_434 q raw nodes returns truth
noncomputable def windows_435 : List WorkingViewPilot.Window := [
  ⟨31301, 31876, Family435MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_435 : WorkingViewPilot.checks windows_435 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨31301, 31876, Family435MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family435MainPilot.cache 31301 =
          some 31876 ∧ 31876 ≤ 573802 from
          ⟨Family435MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_435 : ∀ w ∈ windows_435, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_435 checked_435
noncomputable def fromRaw_435 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_435) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_435 checked_435 q raw nodes returns truth
noncomputable def windows_436 : List WorkingViewPilot.Window := [
  ⟨31876, 31946, Family436MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_436 : WorkingViewPilot.checks windows_436 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨31876, 31946, Family436MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family436MainPilot.cache 31876 =
          some 31946 ∧ 31946 ≤ 573802 from
          ⟨Family436MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_436 : ∀ w ∈ windows_436, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_436 checked_436
noncomputable def fromRaw_436 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_436) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_436 checked_436 q raw nodes returns truth
noncomputable def windows_437 : List WorkingViewPilot.Window := [
  ⟨31946, 32141, Family437MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_437 : WorkingViewPilot.checks windows_437 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨31946, 32141, Family437MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family437MainPilot.cache 31946 =
          some 32141 ∧ 32141 ≤ 573802 from
          ⟨Family437MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_437 : ∀ w ∈ windows_437, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_437 checked_437
noncomputable def fromRaw_437 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_437) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_437 checked_437 q raw nodes returns truth
noncomputable def windows_438 : List WorkingViewPilot.Window := [
  ⟨32141, 32211, Family438MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_438 : WorkingViewPilot.checks windows_438 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨32141, 32211, Family438MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family438MainPilot.cache 32141 =
          some 32211 ∧ 32211 ≤ 573802 from
          ⟨Family438MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_438 : ∀ w ∈ windows_438, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_438 checked_438
noncomputable def fromRaw_438 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_438) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_438 checked_438 q raw nodes returns truth
noncomputable def windows_439 : List WorkingViewPilot.Window := [
  ⟨32211, 32746, Family439MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_439 : WorkingViewPilot.checks windows_439 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨32211, 32746, Family439MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family439MainPilot.cache 32211 =
          some 32746 ∧ 32746 ≤ 573802 from
          ⟨Family439MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_439 : ∀ w ∈ windows_439, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_439 checked_439
noncomputable def fromRaw_439 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_439) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_439 checked_439 q raw nodes returns truth
noncomputable def windows_440 : List WorkingViewPilot.Window := [
  ⟨32746, 32751, Family440MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_440 : WorkingViewPilot.checks windows_440 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨32746, 32751, Family440MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family440MainPilot.cache 32746 =
          some 32751 ∧ 32751 ≤ 573802 from
          ⟨Family440MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_440 : ∀ w ∈ windows_440, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_440 checked_440
noncomputable def fromRaw_440 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_440) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_440 checked_440 q raw nodes returns truth
noncomputable def windows_441 : List WorkingViewPilot.Window := [
  ⟨32751, 32821, Family441MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_441 : WorkingViewPilot.checks windows_441 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨32751, 32821, Family441MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family441MainPilot.cache 32751 =
          some 32821 ∧ 32821 ≤ 573802 from
          ⟨Family441MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_441 : ∀ w ∈ windows_441, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_441 checked_441
noncomputable def fromRaw_441 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_441) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_441 checked_441 q raw nodes returns truth
noncomputable def windows_442 : List WorkingViewPilot.Window := [
  ⟨32821, 33491, Family442MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_442 : WorkingViewPilot.checks windows_442 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨32821, 33491, Family442MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family442MainPilot.cache 32821 =
          some 33491 ∧ 33491 ≤ 573802 from
          ⟨Family442MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_442 : ∀ w ∈ windows_442, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_442 checked_442
noncomputable def fromRaw_442 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_442) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_442 checked_442 q raw nodes returns truth
noncomputable def windows_443 : List WorkingViewPilot.Window := [
  ⟨33491, 33561, Family443MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_443 : WorkingViewPilot.checks windows_443 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨33491, 33561, Family443MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family443MainPilot.cache 33491 =
          some 33561 ∧ 33561 ≤ 573802 from
          ⟨Family443MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_443 : ∀ w ∈ windows_443, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_443 checked_443
noncomputable def fromRaw_443 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_443) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_443 checked_443 q raw nodes returns truth
end FamilyViews003Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Quantified working-set batch fidelity checked"
