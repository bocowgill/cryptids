module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.SourceReturnCacheData

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace SourceReturnCachePilot
theorem checked_533341_158 : validate cache_533341_158 533341 =
    some 533499 := by
  decide +kernel
theorem checked_533499_158 : validate cache_533499_158 533499 =
    some 533657 := by
  decide +kernel
theorem checked_533341_316 : validate cache_533341_316 533341 =
    some 533657 := by
  exact validate_branch 158 cache_533341_158 cache_533499_158
    533341 533499 533657
    checked_533341_158 rfl checked_533499_158
theorem checked_533657_158 : validate cache_533657_158 533657 =
    some 533815 := by
  decide +kernel
theorem checked_533815_158 : validate cache_533815_158 533815 =
    some 533973 := by
  decide +kernel
theorem checked_533657_316 : validate cache_533657_316 533657 =
    some 533973 := by
  exact validate_branch 158 cache_533657_158 cache_533815_158
    533657 533815 533973
    checked_533657_158 rfl checked_533815_158
theorem checked_533341_632 : validate cache_533341_632 533341 =
    some 533973 := by
  exact validate_branch 316 cache_533341_316 cache_533657_316
    533341 533657 533973
    checked_533341_316 rfl checked_533657_316
theorem checked_533973_158 : validate cache_533973_158 533973 =
    some 534131 := by
  decide +kernel
theorem checked_534131_158 : validate cache_534131_158 534131 =
    some 534289 := by
  decide +kernel
theorem checked_533973_316 : validate cache_533973_316 533973 =
    some 534289 := by
  exact validate_branch 158 cache_533973_158 cache_534131_158
    533973 534131 534289
    checked_533973_158 rfl checked_534131_158
theorem checked_534289_158 : validate cache_534289_158 534289 =
    some 534447 := by
  decide +kernel
theorem checked_534447_158 : validate cache_534447_158 534447 =
    some 534605 := by
  decide +kernel
theorem checked_534289_316 : validate cache_534289_316 534289 =
    some 534605 := by
  exact validate_branch 158 cache_534289_158 cache_534447_158
    534289 534447 534605
    checked_534289_158 rfl checked_534447_158
theorem checked_533973_632 : validate cache_533973_632 533973 =
    some 534605 := by
  exact validate_branch 316 cache_533973_316 cache_534289_316
    533973 534289 534605
    checked_533973_316 rfl checked_534289_316
theorem checked_533341_1264 : validate cache_533341_1264 533341 =
    some 534605 := by
  exact validate_branch 632 cache_533341_632 cache_533973_632
    533341 533973 534605
    checked_533341_632 rfl checked_533973_632
theorem checked_534605_158 : validate cache_534605_158 534605 =
    some 534763 := by
  decide +kernel
theorem checked_534763_158 : validate cache_534763_158 534763 =
    some 534921 := by
  decide +kernel
theorem checked_534605_316 : validate cache_534605_316 534605 =
    some 534921 := by
  exact validate_branch 158 cache_534605_158 cache_534763_158
    534605 534763 534921
    checked_534605_158 rfl checked_534763_158
theorem checked_534921_158 : validate cache_534921_158 534921 =
    some 535079 := by
  decide +kernel
theorem checked_535079_158 : validate cache_535079_158 535079 =
    some 535237 := by
  decide +kernel
theorem checked_534921_316 : validate cache_534921_316 534921 =
    some 535237 := by
  exact validate_branch 158 cache_534921_158 cache_535079_158
    534921 535079 535237
    checked_534921_158 rfl checked_535079_158
theorem checked_534605_632 : validate cache_534605_632 534605 =
    some 535237 := by
  exact validate_branch 316 cache_534605_316 cache_534921_316
    534605 534921 535237
    checked_534605_316 rfl checked_534921_316
theorem checked_535237_158 : validate cache_535237_158 535237 =
    some 535395 := by
  decide +kernel
theorem checked_535395_158 : validate cache_535395_158 535395 =
    some 535553 := by
  decide +kernel
theorem checked_535237_316 : validate cache_535237_316 535237 =
    some 535553 := by
  exact validate_branch 158 cache_535237_158 cache_535395_158
    535237 535395 535553
    checked_535237_158 rfl checked_535395_158
theorem checked_535553_158 : validate cache_535553_158 535553 =
    some 535711 := by
  decide +kernel
theorem checked_535711_158 : validate cache_535711_158 535711 =
    some 535869 := by
  decide +kernel
theorem checked_535553_316 : validate cache_535553_316 535553 =
    some 535869 := by
  exact validate_branch 158 cache_535553_158 cache_535711_158
    535553 535711 535869
    checked_535553_158 rfl checked_535711_158
theorem checked_535237_632 : validate cache_535237_632 535237 =
    some 535869 := by
  exact validate_branch 316 cache_535237_316 cache_535553_316
    535237 535553 535869
    checked_535237_316 rfl checked_535553_316
theorem checked_534605_1264 : validate cache_534605_1264 534605 =
    some 535869 := by
  exact validate_branch 632 cache_534605_632 cache_535237_632
    534605 535237 535869
    checked_534605_632 rfl checked_535237_632
theorem checked_533341_2528 : validate cache_533341_2528 533341 =
    some 535869 := by
  exact validate_branch 1264 cache_533341_1264 cache_534605_1264
    533341 534605 535869
    checked_533341_1264 rfl checked_534605_1264
theorem checked_535869_158 : validate cache_535869_158 535869 =
    some 536027 := by
  decide +kernel
theorem checked_536027_158 : validate cache_536027_158 536027 =
    some 536185 := by
  decide +kernel
theorem checked_535869_316 : validate cache_535869_316 535869 =
    some 536185 := by
  exact validate_branch 158 cache_535869_158 cache_536027_158
    535869 536027 536185
    checked_535869_158 rfl checked_536027_158
theorem checked_536185_158 : validate cache_536185_158 536185 =
    some 536343 := by
  decide +kernel
theorem checked_536343_158 : validate cache_536343_158 536343 =
    some 536501 := by
  decide +kernel
theorem checked_536185_316 : validate cache_536185_316 536185 =
    some 536501 := by
  exact validate_branch 158 cache_536185_158 cache_536343_158
    536185 536343 536501
    checked_536185_158 rfl checked_536343_158
theorem checked_535869_632 : validate cache_535869_632 535869 =
    some 536501 := by
  exact validate_branch 316 cache_535869_316 cache_536185_316
    535869 536185 536501
    checked_535869_316 rfl checked_536185_316
theorem checked_536501_158 : validate cache_536501_158 536501 =
    some 536659 := by
  decide +kernel
theorem checked_536659_158 : validate cache_536659_158 536659 =
    some 536817 := by
  decide +kernel
theorem checked_536501_316 : validate cache_536501_316 536501 =
    some 536817 := by
  exact validate_branch 158 cache_536501_158 cache_536659_158
    536501 536659 536817
    checked_536501_158 rfl checked_536659_158
theorem checked_536817_158 : validate cache_536817_158 536817 =
    some 536975 := by
  decide +kernel
theorem checked_536975_158 : validate cache_536975_158 536975 =
    some 537133 := by
  decide +kernel
theorem checked_536817_316 : validate cache_536817_316 536817 =
    some 537133 := by
  exact validate_branch 158 cache_536817_158 cache_536975_158
    536817 536975 537133
    checked_536817_158 rfl checked_536975_158
theorem checked_536501_632 : validate cache_536501_632 536501 =
    some 537133 := by
  exact validate_branch 316 cache_536501_316 cache_536817_316
    536501 536817 537133
    checked_536501_316 rfl checked_536817_316
theorem checked_535869_1264 : validate cache_535869_1264 535869 =
    some 537133 := by
  exact validate_branch 632 cache_535869_632 cache_536501_632
    535869 536501 537133
    checked_535869_632 rfl checked_536501_632
theorem checked_537133_158 : validate cache_537133_158 537133 =
    some 537291 := by
  decide +kernel
theorem checked_537291_158 : validate cache_537291_158 537291 =
    some 537449 := by
  decide +kernel
theorem checked_537133_316 : validate cache_537133_316 537133 =
    some 537449 := by
  exact validate_branch 158 cache_537133_158 cache_537291_158
    537133 537291 537449
    checked_537133_158 rfl checked_537291_158
theorem checked_537449_158 : validate cache_537449_158 537449 =
    some 537607 := by
  decide +kernel
theorem checked_537607_158 : validate cache_537607_158 537607 =
    some 537765 := by
  decide +kernel
theorem checked_537449_316 : validate cache_537449_316 537449 =
    some 537765 := by
  exact validate_branch 158 cache_537449_158 cache_537607_158
    537449 537607 537765
    checked_537449_158 rfl checked_537607_158
theorem checked_537133_632 : validate cache_537133_632 537133 =
    some 537765 := by
  exact validate_branch 316 cache_537133_316 cache_537449_316
    537133 537449 537765
    checked_537133_316 rfl checked_537449_316
theorem checked_537765_158 : validate cache_537765_158 537765 =
    some 537923 := by
  decide +kernel
theorem checked_537923_158 : validate cache_537923_158 537923 =
    some 538081 := by
  decide +kernel
theorem checked_537765_316 : validate cache_537765_316 537765 =
    some 538081 := by
  exact validate_branch 158 cache_537765_158 cache_537923_158
    537765 537923 538081
    checked_537765_158 rfl checked_537923_158
theorem checked_538081_158 : validate cache_538081_158 538081 =
    some 538239 := by
  decide +kernel
theorem checked_538239_159 : validate cache_538239_159 538239 =
    some 538398 := by
  decide +kernel
theorem checked_538081_317 : validate cache_538081_317 538081 =
    some 538398 := by
  exact validate_branch 158 cache_538081_158 cache_538239_159
    538081 538239 538398
    checked_538081_158 rfl checked_538239_159
theorem checked_537765_633 : validate cache_537765_633 537765 =
    some 538398 := by
  exact validate_branch 316 cache_537765_316 cache_538081_317
    537765 538081 538398
    checked_537765_316 rfl checked_538081_317
theorem checked_537133_1265 : validate cache_537133_1265 537133 =
    some 538398 := by
  exact validate_branch 632 cache_537133_632 cache_537765_633
    537133 537765 538398
    checked_537133_632 rfl checked_537765_633
theorem checked_535869_2529 : validate cache_535869_2529 535869 =
    some 538398 := by
  exact validate_branch 1264 cache_535869_1264 cache_537133_1265
    535869 537133 538398
    checked_535869_1264 rfl checked_537133_1265
theorem checked_533341_5057 : validate cache_533341_5057 533341 =
    some 538398 := by
  exact validate_branch 2528 cache_533341_2528 cache_535869_2529
    533341 535869 538398
    checked_533341_2528 rfl checked_535869_2529
theorem checked_538398_158 : validate cache_538398_158 538398 =
    some 538556 := by
  decide +kernel
theorem checked_538556_158 : validate cache_538556_158 538556 =
    some 538714 := by
  decide +kernel
theorem checked_538398_316 : validate cache_538398_316 538398 =
    some 538714 := by
  exact validate_branch 158 cache_538398_158 cache_538556_158
    538398 538556 538714
    checked_538398_158 rfl checked_538556_158
theorem checked_538714_158 : validate cache_538714_158 538714 =
    some 538872 := by
  decide +kernel
theorem checked_538872_158 : validate cache_538872_158 538872 =
    some 539030 := by
  decide +kernel
theorem checked_538714_316 : validate cache_538714_316 538714 =
    some 539030 := by
  exact validate_branch 158 cache_538714_158 cache_538872_158
    538714 538872 539030
    checked_538714_158 rfl checked_538872_158
theorem checked_538398_632 : validate cache_538398_632 538398 =
    some 539030 := by
  exact validate_branch 316 cache_538398_316 cache_538714_316
    538398 538714 539030
    checked_538398_316 rfl checked_538714_316
theorem checked_539030_158 : validate cache_539030_158 539030 =
    some 539188 := by
  decide +kernel
theorem checked_539188_158 : validate cache_539188_158 539188 =
    some 539346 := by
  decide +kernel
theorem checked_539030_316 : validate cache_539030_316 539030 =
    some 539346 := by
  exact validate_branch 158 cache_539030_158 cache_539188_158
    539030 539188 539346
    checked_539030_158 rfl checked_539188_158
theorem checked_539346_158 : validate cache_539346_158 539346 =
    some 539504 := by
  decide +kernel
theorem checked_539504_158 : validate cache_539504_158 539504 =
    some 539662 := by
  decide +kernel
theorem checked_539346_316 : validate cache_539346_316 539346 =
    some 539662 := by
  exact validate_branch 158 cache_539346_158 cache_539504_158
    539346 539504 539662
    checked_539346_158 rfl checked_539504_158
theorem checked_539030_632 : validate cache_539030_632 539030 =
    some 539662 := by
  exact validate_branch 316 cache_539030_316 cache_539346_316
    539030 539346 539662
    checked_539030_316 rfl checked_539346_316
theorem checked_538398_1264 : validate cache_538398_1264 538398 =
    some 539662 := by
  exact validate_branch 632 cache_538398_632 cache_539030_632
    538398 539030 539662
    checked_538398_632 rfl checked_539030_632
theorem checked_539662_158 : validate cache_539662_158 539662 =
    some 539820 := by
  decide +kernel
theorem checked_539820_158 : validate cache_539820_158 539820 =
    some 539978 := by
  decide +kernel
theorem checked_539662_316 : validate cache_539662_316 539662 =
    some 539978 := by
  exact validate_branch 158 cache_539662_158 cache_539820_158
    539662 539820 539978
    checked_539662_158 rfl checked_539820_158
theorem checked_539978_158 : validate cache_539978_158 539978 =
    some 540136 := by
  decide +kernel
theorem checked_540136_158 : validate cache_540136_158 540136 =
    some 540294 := by
  decide +kernel
theorem checked_539978_316 : validate cache_539978_316 539978 =
    some 540294 := by
  exact validate_branch 158 cache_539978_158 cache_540136_158
    539978 540136 540294
    checked_539978_158 rfl checked_540136_158
theorem checked_539662_632 : validate cache_539662_632 539662 =
    some 540294 := by
  exact validate_branch 316 cache_539662_316 cache_539978_316
    539662 539978 540294
    checked_539662_316 rfl checked_539978_316
theorem checked_540294_158 : validate cache_540294_158 540294 =
    some 540452 := by
  decide +kernel
theorem checked_540452_158 : validate cache_540452_158 540452 =
    some 540610 := by
  decide +kernel
theorem checked_540294_316 : validate cache_540294_316 540294 =
    some 540610 := by
  exact validate_branch 158 cache_540294_158 cache_540452_158
    540294 540452 540610
    checked_540294_158 rfl checked_540452_158
theorem checked_540610_158 : validate cache_540610_158 540610 =
    some 540768 := by
  decide +kernel
theorem checked_540768_159 : validate cache_540768_159 540768 =
    some 540927 := by
  decide +kernel
theorem checked_540610_317 : validate cache_540610_317 540610 =
    some 540927 := by
  exact validate_branch 158 cache_540610_158 cache_540768_159
    540610 540768 540927
    checked_540610_158 rfl checked_540768_159
theorem checked_540294_633 : validate cache_540294_633 540294 =
    some 540927 := by
  exact validate_branch 316 cache_540294_316 cache_540610_317
    540294 540610 540927
    checked_540294_316 rfl checked_540610_317
theorem checked_539662_1265 : validate cache_539662_1265 539662 =
    some 540927 := by
  exact validate_branch 632 cache_539662_632 cache_540294_633
    539662 540294 540927
    checked_539662_632 rfl checked_540294_633
theorem checked_538398_2529 : validate cache_538398_2529 538398 =
    some 540927 := by
  exact validate_branch 1264 cache_538398_1264 cache_539662_1265
    538398 539662 540927
    checked_538398_1264 rfl checked_539662_1265
theorem checked_540927_158 : validate cache_540927_158 540927 =
    some 541085 := by
  decide +kernel
theorem checked_541085_158 : validate cache_541085_158 541085 =
    some 541243 := by
  decide +kernel
theorem checked_540927_316 : validate cache_540927_316 540927 =
    some 541243 := by
  exact validate_branch 158 cache_540927_158 cache_541085_158
    540927 541085 541243
    checked_540927_158 rfl checked_541085_158
theorem checked_541243_158 : validate cache_541243_158 541243 =
    some 541401 := by
  decide +kernel
theorem checked_541401_158 : validate cache_541401_158 541401 =
    some 541559 := by
  decide +kernel
theorem checked_541243_316 : validate cache_541243_316 541243 =
    some 541559 := by
  exact validate_branch 158 cache_541243_158 cache_541401_158
    541243 541401 541559
    checked_541243_158 rfl checked_541401_158
theorem checked_540927_632 : validate cache_540927_632 540927 =
    some 541559 := by
  exact validate_branch 316 cache_540927_316 cache_541243_316
    540927 541243 541559
    checked_540927_316 rfl checked_541243_316
theorem checked_541559_158 : validate cache_541559_158 541559 =
    some 541717 := by
  decide +kernel
theorem checked_541717_158 : validate cache_541717_158 541717 =
    some 541875 := by
  decide +kernel
theorem checked_541559_316 : validate cache_541559_316 541559 =
    some 541875 := by
  exact validate_branch 158 cache_541559_158 cache_541717_158
    541559 541717 541875
    checked_541559_158 rfl checked_541717_158
theorem checked_541875_158 : validate cache_541875_158 541875 =
    some 542033 := by
  decide +kernel
theorem checked_542033_158 : validate cache_542033_158 542033 =
    some 542191 := by
  decide +kernel
theorem checked_541875_316 : validate cache_541875_316 541875 =
    some 542191 := by
  exact validate_branch 158 cache_541875_158 cache_542033_158
    541875 542033 542191
    checked_541875_158 rfl checked_542033_158
theorem checked_541559_632 : validate cache_541559_632 541559 =
    some 542191 := by
  exact validate_branch 316 cache_541559_316 cache_541875_316
    541559 541875 542191
    checked_541559_316 rfl checked_541875_316
theorem checked_540927_1264 : validate cache_540927_1264 540927 =
    some 542191 := by
  exact validate_branch 632 cache_540927_632 cache_541559_632
    540927 541559 542191
    checked_540927_632 rfl checked_541559_632
theorem checked_542191_158 : validate cache_542191_158 542191 =
    some 542349 := by
  decide +kernel
theorem checked_542349_158 : validate cache_542349_158 542349 =
    some 542507 := by
  decide +kernel
theorem checked_542191_316 : validate cache_542191_316 542191 =
    some 542507 := by
  exact validate_branch 158 cache_542191_158 cache_542349_158
    542191 542349 542507
    checked_542191_158 rfl checked_542349_158
theorem checked_542507_158 : validate cache_542507_158 542507 =
    some 542665 := by
  decide +kernel
theorem checked_542665_158 : validate cache_542665_158 542665 =
    some 542823 := by
  decide +kernel
theorem checked_542507_316 : validate cache_542507_316 542507 =
    some 542823 := by
  exact validate_branch 158 cache_542507_158 cache_542665_158
    542507 542665 542823
    checked_542507_158 rfl checked_542665_158
theorem checked_542191_632 : validate cache_542191_632 542191 =
    some 542823 := by
  exact validate_branch 316 cache_542191_316 cache_542507_316
    542191 542507 542823
    checked_542191_316 rfl checked_542507_316
theorem checked_542823_158 : validate cache_542823_158 542823 =
    some 542981 := by
  decide +kernel
theorem checked_542981_158 : validate cache_542981_158 542981 =
    some 543139 := by
  decide +kernel
theorem checked_542823_316 : validate cache_542823_316 542823 =
    some 543139 := by
  exact validate_branch 158 cache_542823_158 cache_542981_158
    542823 542981 543139
    checked_542823_158 rfl checked_542981_158
theorem checked_543139_158 : validate cache_543139_158 543139 =
    some 543297 := by
  decide +kernel
theorem checked_543297_159 : validate cache_543297_159 543297 =
    some 543456 := by
  decide +kernel
theorem checked_543139_317 : validate cache_543139_317 543139 =
    some 543456 := by
  exact validate_branch 158 cache_543139_158 cache_543297_159
    543139 543297 543456
    checked_543139_158 rfl checked_543297_159
theorem checked_542823_633 : validate cache_542823_633 542823 =
    some 543456 := by
  exact validate_branch 316 cache_542823_316 cache_543139_317
    542823 543139 543456
    checked_542823_316 rfl checked_543139_317
theorem checked_542191_1265 : validate cache_542191_1265 542191 =
    some 543456 := by
  exact validate_branch 632 cache_542191_632 cache_542823_633
    542191 542823 543456
    checked_542191_632 rfl checked_542823_633
theorem checked_540927_2529 : validate cache_540927_2529 540927 =
    some 543456 := by
  exact validate_branch 1264 cache_540927_1264 cache_542191_1265
    540927 542191 543456
    checked_540927_1264 rfl checked_542191_1265
theorem checked_538398_5058 : validate cache_538398_5058 538398 =
    some 543456 := by
  exact validate_branch 2529 cache_538398_2529 cache_540927_2529
    538398 540927 543456
    checked_538398_2529 rfl checked_540927_2529
theorem checked_533341_10115 : validate cache_533341_10115 533341 =
    some 543456 := by
  exact validate_branch 5057 cache_533341_5057 cache_538398_5058
    533341 538398 543456
    checked_533341_5057 rfl checked_538398_5058
theorem checked_543456_158 : validate cache_543456_158 543456 =
    some 543614 := by
  decide +kernel
theorem checked_543614_158 : validate cache_543614_158 543614 =
    some 543772 := by
  decide +kernel
theorem checked_543456_316 : validate cache_543456_316 543456 =
    some 543772 := by
  exact validate_branch 158 cache_543456_158 cache_543614_158
    543456 543614 543772
    checked_543456_158 rfl checked_543614_158
theorem checked_543772_158 : validate cache_543772_158 543772 =
    some 543930 := by
  decide +kernel
theorem checked_543930_158 : validate cache_543930_158 543930 =
    some 544088 := by
  decide +kernel
theorem checked_543772_316 : validate cache_543772_316 543772 =
    some 544088 := by
  exact validate_branch 158 cache_543772_158 cache_543930_158
    543772 543930 544088
    checked_543772_158 rfl checked_543930_158
theorem checked_543456_632 : validate cache_543456_632 543456 =
    some 544088 := by
  exact validate_branch 316 cache_543456_316 cache_543772_316
    543456 543772 544088
    checked_543456_316 rfl checked_543772_316
theorem checked_544088_158 : validate cache_544088_158 544088 =
    some 544246 := by
  decide +kernel
theorem checked_544246_158 : validate cache_544246_158 544246 =
    some 544404 := by
  decide +kernel
theorem checked_544088_316 : validate cache_544088_316 544088 =
    some 544404 := by
  exact validate_branch 158 cache_544088_158 cache_544246_158
    544088 544246 544404
    checked_544088_158 rfl checked_544246_158
theorem checked_544404_158 : validate cache_544404_158 544404 =
    some 544562 := by
  decide +kernel
theorem checked_544562_158 : validate cache_544562_158 544562 =
    some 544720 := by
  decide +kernel
theorem checked_544404_316 : validate cache_544404_316 544404 =
    some 544720 := by
  exact validate_branch 158 cache_544404_158 cache_544562_158
    544404 544562 544720
    checked_544404_158 rfl checked_544562_158
theorem checked_544088_632 : validate cache_544088_632 544088 =
    some 544720 := by
  exact validate_branch 316 cache_544088_316 cache_544404_316
    544088 544404 544720
    checked_544088_316 rfl checked_544404_316
theorem checked_543456_1264 : validate cache_543456_1264 543456 =
    some 544720 := by
  exact validate_branch 632 cache_543456_632 cache_544088_632
    543456 544088 544720
    checked_543456_632 rfl checked_544088_632
theorem checked_544720_158 : validate cache_544720_158 544720 =
    some 544878 := by
  decide +kernel
theorem checked_544878_158 : validate cache_544878_158 544878 =
    some 545036 := by
  decide +kernel
theorem checked_544720_316 : validate cache_544720_316 544720 =
    some 545036 := by
  exact validate_branch 158 cache_544720_158 cache_544878_158
    544720 544878 545036
    checked_544720_158 rfl checked_544878_158
theorem checked_545036_158 : validate cache_545036_158 545036 =
    some 545194 := by
  decide +kernel
theorem checked_545194_158 : validate cache_545194_158 545194 =
    some 545352 := by
  decide +kernel
theorem checked_545036_316 : validate cache_545036_316 545036 =
    some 545352 := by
  exact validate_branch 158 cache_545036_158 cache_545194_158
    545036 545194 545352
    checked_545036_158 rfl checked_545194_158
theorem checked_544720_632 : validate cache_544720_632 544720 =
    some 545352 := by
  exact validate_branch 316 cache_544720_316 cache_545036_316
    544720 545036 545352
    checked_544720_316 rfl checked_545036_316
theorem checked_545352_158 : validate cache_545352_158 545352 =
    some 545510 := by
  decide +kernel
theorem checked_545510_158 : validate cache_545510_158 545510 =
    some 545668 := by
  decide +kernel
theorem checked_545352_316 : validate cache_545352_316 545352 =
    some 545668 := by
  exact validate_branch 158 cache_545352_158 cache_545510_158
    545352 545510 545668
    checked_545352_158 rfl checked_545510_158
theorem checked_545668_158 : validate cache_545668_158 545668 =
    some 545826 := by
  decide +kernel
theorem checked_545826_158 : validate cache_545826_158 545826 =
    some 545984 := by
  decide +kernel
theorem checked_545668_316 : validate cache_545668_316 545668 =
    some 545984 := by
  exact validate_branch 158 cache_545668_158 cache_545826_158
    545668 545826 545984
    checked_545668_158 rfl checked_545826_158
theorem checked_545352_632 : validate cache_545352_632 545352 =
    some 545984 := by
  exact validate_branch 316 cache_545352_316 cache_545668_316
    545352 545668 545984
    checked_545352_316 rfl checked_545668_316
theorem checked_544720_1264 : validate cache_544720_1264 544720 =
    some 545984 := by
  exact validate_branch 632 cache_544720_632 cache_545352_632
    544720 545352 545984
    checked_544720_632 rfl checked_545352_632
theorem checked_543456_2528 : validate cache_543456_2528 543456 =
    some 545984 := by
  exact validate_branch 1264 cache_543456_1264 cache_544720_1264
    543456 544720 545984
    checked_543456_1264 rfl checked_544720_1264
theorem checked_545984_158 : validate cache_545984_158 545984 =
    some 546142 := by
  decide +kernel
theorem checked_546142_158 : validate cache_546142_158 546142 =
    some 546300 := by
  decide +kernel
theorem checked_545984_316 : validate cache_545984_316 545984 =
    some 546300 := by
  exact validate_branch 158 cache_545984_158 cache_546142_158
    545984 546142 546300
    checked_545984_158 rfl checked_546142_158
theorem checked_546300_158 : validate cache_546300_158 546300 =
    some 546458 := by
  decide +kernel
theorem checked_546458_158 : validate cache_546458_158 546458 =
    some 546616 := by
  decide +kernel
theorem checked_546300_316 : validate cache_546300_316 546300 =
    some 546616 := by
  exact validate_branch 158 cache_546300_158 cache_546458_158
    546300 546458 546616
    checked_546300_158 rfl checked_546458_158
theorem checked_545984_632 : validate cache_545984_632 545984 =
    some 546616 := by
  exact validate_branch 316 cache_545984_316 cache_546300_316
    545984 546300 546616
    checked_545984_316 rfl checked_546300_316
theorem checked_546616_158 : validate cache_546616_158 546616 =
    some 546774 := by
  decide +kernel
theorem checked_546774_158 : validate cache_546774_158 546774 =
    some 546932 := by
  decide +kernel
theorem checked_546616_316 : validate cache_546616_316 546616 =
    some 546932 := by
  exact validate_branch 158 cache_546616_158 cache_546774_158
    546616 546774 546932
    checked_546616_158 rfl checked_546774_158
theorem checked_546932_158 : validate cache_546932_158 546932 =
    some 547090 := by
  decide +kernel
theorem checked_547090_158 : validate cache_547090_158 547090 =
    some 547248 := by
  decide +kernel
theorem checked_546932_316 : validate cache_546932_316 546932 =
    some 547248 := by
  exact validate_branch 158 cache_546932_158 cache_547090_158
    546932 547090 547248
    checked_546932_158 rfl checked_547090_158
theorem checked_546616_632 : validate cache_546616_632 546616 =
    some 547248 := by
  exact validate_branch 316 cache_546616_316 cache_546932_316
    546616 546932 547248
    checked_546616_316 rfl checked_546932_316
theorem checked_545984_1264 : validate cache_545984_1264 545984 =
    some 547248 := by
  exact validate_branch 632 cache_545984_632 cache_546616_632
    545984 546616 547248
    checked_545984_632 rfl checked_546616_632
theorem checked_547248_158 : validate cache_547248_158 547248 =
    some 547406 := by
  decide +kernel
theorem checked_547406_158 : validate cache_547406_158 547406 =
    some 547564 := by
  decide +kernel
theorem checked_547248_316 : validate cache_547248_316 547248 =
    some 547564 := by
  exact validate_branch 158 cache_547248_158 cache_547406_158
    547248 547406 547564
    checked_547248_158 rfl checked_547406_158
theorem checked_547564_158 : validate cache_547564_158 547564 =
    some 547722 := by
  decide +kernel
theorem checked_547722_158 : validate cache_547722_158 547722 =
    some 547880 := by
  decide +kernel
theorem checked_547564_316 : validate cache_547564_316 547564 =
    some 547880 := by
  exact validate_branch 158 cache_547564_158 cache_547722_158
    547564 547722 547880
    checked_547564_158 rfl checked_547722_158
theorem checked_547248_632 : validate cache_547248_632 547248 =
    some 547880 := by
  exact validate_branch 316 cache_547248_316 cache_547564_316
    547248 547564 547880
    checked_547248_316 rfl checked_547564_316
theorem checked_547880_158 : validate cache_547880_158 547880 =
    some 548038 := by
  decide +kernel
theorem checked_548038_158 : validate cache_548038_158 548038 =
    some 548196 := by
  decide +kernel
theorem checked_547880_316 : validate cache_547880_316 547880 =
    some 548196 := by
  exact validate_branch 158 cache_547880_158 cache_548038_158
    547880 548038 548196
    checked_547880_158 rfl checked_548038_158
theorem checked_548196_158 : validate cache_548196_158 548196 =
    some 548354 := by
  decide +kernel
theorem checked_548354_159 : validate cache_548354_159 548354 =
    some 548513 := by
  decide +kernel
theorem checked_548196_317 : validate cache_548196_317 548196 =
    some 548513 := by
  exact validate_branch 158 cache_548196_158 cache_548354_159
    548196 548354 548513
    checked_548196_158 rfl checked_548354_159
theorem checked_547880_633 : validate cache_547880_633 547880 =
    some 548513 := by
  exact validate_branch 316 cache_547880_316 cache_548196_317
    547880 548196 548513
    checked_547880_316 rfl checked_548196_317
theorem checked_547248_1265 : validate cache_547248_1265 547248 =
    some 548513 := by
  exact validate_branch 632 cache_547248_632 cache_547880_633
    547248 547880 548513
    checked_547248_632 rfl checked_547880_633
theorem checked_545984_2529 : validate cache_545984_2529 545984 =
    some 548513 := by
  exact validate_branch 1264 cache_545984_1264 cache_547248_1265
    545984 547248 548513
    checked_545984_1264 rfl checked_547248_1265
theorem checked_543456_5057 : validate cache_543456_5057 543456 =
    some 548513 := by
  exact validate_branch 2528 cache_543456_2528 cache_545984_2529
    543456 545984 548513
    checked_543456_2528 rfl checked_545984_2529
theorem checked_548513_158 : validate cache_548513_158 548513 =
    some 548671 := by
  decide +kernel
theorem checked_548671_158 : validate cache_548671_158 548671 =
    some 548829 := by
  decide +kernel
theorem checked_548513_316 : validate cache_548513_316 548513 =
    some 548829 := by
  exact validate_branch 158 cache_548513_158 cache_548671_158
    548513 548671 548829
    checked_548513_158 rfl checked_548671_158
theorem checked_548829_158 : validate cache_548829_158 548829 =
    some 548987 := by
  decide +kernel
theorem checked_548987_158 : validate cache_548987_158 548987 =
    some 549145 := by
  decide +kernel
theorem checked_548829_316 : validate cache_548829_316 548829 =
    some 549145 := by
  exact validate_branch 158 cache_548829_158 cache_548987_158
    548829 548987 549145
    checked_548829_158 rfl checked_548987_158
theorem checked_548513_632 : validate cache_548513_632 548513 =
    some 549145 := by
  exact validate_branch 316 cache_548513_316 cache_548829_316
    548513 548829 549145
    checked_548513_316 rfl checked_548829_316
theorem checked_549145_158 : validate cache_549145_158 549145 =
    some 549303 := by
  decide +kernel
theorem checked_549303_158 : validate cache_549303_158 549303 =
    some 549461 := by
  decide +kernel
theorem checked_549145_316 : validate cache_549145_316 549145 =
    some 549461 := by
  exact validate_branch 158 cache_549145_158 cache_549303_158
    549145 549303 549461
    checked_549145_158 rfl checked_549303_158
theorem checked_549461_158 : validate cache_549461_158 549461 =
    some 549619 := by
  decide +kernel
theorem checked_549619_158 : validate cache_549619_158 549619 =
    some 549777 := by
  decide +kernel
theorem checked_549461_316 : validate cache_549461_316 549461 =
    some 549777 := by
  exact validate_branch 158 cache_549461_158 cache_549619_158
    549461 549619 549777
    checked_549461_158 rfl checked_549619_158
theorem checked_549145_632 : validate cache_549145_632 549145 =
    some 549777 := by
  exact validate_branch 316 cache_549145_316 cache_549461_316
    549145 549461 549777
    checked_549145_316 rfl checked_549461_316
theorem checked_548513_1264 : validate cache_548513_1264 548513 =
    some 549777 := by
  exact validate_branch 632 cache_548513_632 cache_549145_632
    548513 549145 549777
    checked_548513_632 rfl checked_549145_632
theorem checked_549777_158 : validate cache_549777_158 549777 =
    some 549935 := by
  decide +kernel
theorem checked_549935_158 : validate cache_549935_158 549935 =
    some 550093 := by
  decide +kernel
theorem checked_549777_316 : validate cache_549777_316 549777 =
    some 550093 := by
  exact validate_branch 158 cache_549777_158 cache_549935_158
    549777 549935 550093
    checked_549777_158 rfl checked_549935_158
theorem checked_550093_158 : validate cache_550093_158 550093 =
    some 550251 := by
  decide +kernel
theorem checked_550251_158 : validate cache_550251_158 550251 =
    some 550409 := by
  decide +kernel
theorem checked_550093_316 : validate cache_550093_316 550093 =
    some 550409 := by
  exact validate_branch 158 cache_550093_158 cache_550251_158
    550093 550251 550409
    checked_550093_158 rfl checked_550251_158
theorem checked_549777_632 : validate cache_549777_632 549777 =
    some 550409 := by
  exact validate_branch 316 cache_549777_316 cache_550093_316
    549777 550093 550409
    checked_549777_316 rfl checked_550093_316
theorem checked_550409_158 : validate cache_550409_158 550409 =
    some 550567 := by
  decide +kernel
theorem checked_550567_158 : validate cache_550567_158 550567 =
    some 550725 := by
  decide +kernel
theorem checked_550409_316 : validate cache_550409_316 550409 =
    some 550725 := by
  exact validate_branch 158 cache_550409_158 cache_550567_158
    550409 550567 550725
    checked_550409_158 rfl checked_550567_158
theorem checked_550725_158 : validate cache_550725_158 550725 =
    some 550883 := by
  decide +kernel
theorem checked_550883_159 : validate cache_550883_159 550883 =
    some 551042 := by
  decide +kernel
theorem checked_550725_317 : validate cache_550725_317 550725 =
    some 551042 := by
  exact validate_branch 158 cache_550725_158 cache_550883_159
    550725 550883 551042
    checked_550725_158 rfl checked_550883_159
theorem checked_550409_633 : validate cache_550409_633 550409 =
    some 551042 := by
  exact validate_branch 316 cache_550409_316 cache_550725_317
    550409 550725 551042
    checked_550409_316 rfl checked_550725_317
theorem checked_549777_1265 : validate cache_549777_1265 549777 =
    some 551042 := by
  exact validate_branch 632 cache_549777_632 cache_550409_633
    549777 550409 551042
    checked_549777_632 rfl checked_550409_633
theorem checked_548513_2529 : validate cache_548513_2529 548513 =
    some 551042 := by
  exact validate_branch 1264 cache_548513_1264 cache_549777_1265
    548513 549777 551042
    checked_548513_1264 rfl checked_549777_1265
theorem checked_551042_158 : validate cache_551042_158 551042 =
    some 551200 := by
  decide +kernel
theorem checked_551200_158 : validate cache_551200_158 551200 =
    some 551358 := by
  decide +kernel
theorem checked_551042_316 : validate cache_551042_316 551042 =
    some 551358 := by
  exact validate_branch 158 cache_551042_158 cache_551200_158
    551042 551200 551358
    checked_551042_158 rfl checked_551200_158
theorem checked_551358_158 : validate cache_551358_158 551358 =
    some 551516 := by
  decide +kernel
theorem checked_551516_158 : validate cache_551516_158 551516 =
    some 551674 := by
  decide +kernel
theorem checked_551358_316 : validate cache_551358_316 551358 =
    some 551674 := by
  exact validate_branch 158 cache_551358_158 cache_551516_158
    551358 551516 551674
    checked_551358_158 rfl checked_551516_158
theorem checked_551042_632 : validate cache_551042_632 551042 =
    some 551674 := by
  exact validate_branch 316 cache_551042_316 cache_551358_316
    551042 551358 551674
    checked_551042_316 rfl checked_551358_316
theorem checked_551674_158 : validate cache_551674_158 551674 =
    some 551832 := by
  decide +kernel
theorem checked_551832_158 : validate cache_551832_158 551832 =
    some 551990 := by
  decide +kernel
theorem checked_551674_316 : validate cache_551674_316 551674 =
    some 551990 := by
  exact validate_branch 158 cache_551674_158 cache_551832_158
    551674 551832 551990
    checked_551674_158 rfl checked_551832_158
theorem checked_551990_158 : validate cache_551990_158 551990 =
    some 552148 := by
  decide +kernel
theorem checked_552148_158 : validate cache_552148_158 552148 =
    some 552306 := by
  decide +kernel
theorem checked_551990_316 : validate cache_551990_316 551990 =
    some 552306 := by
  exact validate_branch 158 cache_551990_158 cache_552148_158
    551990 552148 552306
    checked_551990_158 rfl checked_552148_158
theorem checked_551674_632 : validate cache_551674_632 551674 =
    some 552306 := by
  exact validate_branch 316 cache_551674_316 cache_551990_316
    551674 551990 552306
    checked_551674_316 rfl checked_551990_316
theorem checked_551042_1264 : validate cache_551042_1264 551042 =
    some 552306 := by
  exact validate_branch 632 cache_551042_632 cache_551674_632
    551042 551674 552306
    checked_551042_632 rfl checked_551674_632
theorem checked_552306_158 : validate cache_552306_158 552306 =
    some 552464 := by
  decide +kernel
theorem checked_552464_158 : validate cache_552464_158 552464 =
    some 552622 := by
  decide +kernel
theorem checked_552306_316 : validate cache_552306_316 552306 =
    some 552622 := by
  exact validate_branch 158 cache_552306_158 cache_552464_158
    552306 552464 552622
    checked_552306_158 rfl checked_552464_158
theorem checked_552622_158 : validate cache_552622_158 552622 =
    some 552780 := by
  decide +kernel
theorem checked_552780_158 : validate cache_552780_158 552780 =
    some 552938 := by
  decide +kernel
theorem checked_552622_316 : validate cache_552622_316 552622 =
    some 552938 := by
  exact validate_branch 158 cache_552622_158 cache_552780_158
    552622 552780 552938
    checked_552622_158 rfl checked_552780_158
theorem checked_552306_632 : validate cache_552306_632 552306 =
    some 552938 := by
  exact validate_branch 316 cache_552306_316 cache_552622_316
    552306 552622 552938
    checked_552306_316 rfl checked_552622_316
theorem checked_552938_158 : validate cache_552938_158 552938 =
    some 553096 := by
  decide +kernel
theorem checked_553096_158 : validate cache_553096_158 553096 =
    some 553254 := by
  decide +kernel
theorem checked_552938_316 : validate cache_552938_316 552938 =
    some 553254 := by
  exact validate_branch 158 cache_552938_158 cache_553096_158
    552938 553096 553254
    checked_552938_158 rfl checked_553096_158
theorem checked_553254_158 : validate cache_553254_158 553254 =
    some 553412 := by
  decide +kernel
theorem checked_553412_159 : validate cache_553412_159 553412 =
    some 553571 := by
  decide +kernel
theorem checked_553254_317 : validate cache_553254_317 553254 =
    some 553571 := by
  exact validate_branch 158 cache_553254_158 cache_553412_159
    553254 553412 553571
    checked_553254_158 rfl checked_553412_159
theorem checked_552938_633 : validate cache_552938_633 552938 =
    some 553571 := by
  exact validate_branch 316 cache_552938_316 cache_553254_317
    552938 553254 553571
    checked_552938_316 rfl checked_553254_317
theorem checked_552306_1265 : validate cache_552306_1265 552306 =
    some 553571 := by
  exact validate_branch 632 cache_552306_632 cache_552938_633
    552306 552938 553571
    checked_552306_632 rfl checked_552938_633
theorem checked_551042_2529 : validate cache_551042_2529 551042 =
    some 553571 := by
  exact validate_branch 1264 cache_551042_1264 cache_552306_1265
    551042 552306 553571
    checked_551042_1264 rfl checked_552306_1265
theorem checked_548513_5058 : validate cache_548513_5058 548513 =
    some 553571 := by
  exact validate_branch 2529 cache_548513_2529 cache_551042_2529
    548513 551042 553571
    checked_548513_2529 rfl checked_551042_2529
theorem checked_543456_10115 : validate cache_543456_10115 543456 =
    some 553571 := by
  exact validate_branch 5057 cache_543456_5057 cache_548513_5058
    543456 548513 553571
    checked_543456_5057 rfl checked_548513_5058
theorem checked_533341_20230 : validate cache_533341_20230 533341 =
    some 553571 := by
  exact validate_branch 10115 cache_533341_10115 cache_543456_10115
    533341 543456 553571
    checked_533341_10115 rfl checked_543456_10115
theorem checked_553571_158 : validate cache_553571_158 553571 =
    some 553729 := by
  decide +kernel
theorem checked_553729_158 : validate cache_553729_158 553729 =
    some 553887 := by
  decide +kernel
theorem checked_553571_316 : validate cache_553571_316 553571 =
    some 553887 := by
  exact validate_branch 158 cache_553571_158 cache_553729_158
    553571 553729 553887
    checked_553571_158 rfl checked_553729_158
theorem checked_553887_158 : validate cache_553887_158 553887 =
    some 554045 := by
  decide +kernel
theorem checked_554045_158 : validate cache_554045_158 554045 =
    some 554203 := by
  decide +kernel
theorem checked_553887_316 : validate cache_553887_316 553887 =
    some 554203 := by
  exact validate_branch 158 cache_553887_158 cache_554045_158
    553887 554045 554203
    checked_553887_158 rfl checked_554045_158
theorem checked_553571_632 : validate cache_553571_632 553571 =
    some 554203 := by
  exact validate_branch 316 cache_553571_316 cache_553887_316
    553571 553887 554203
    checked_553571_316 rfl checked_553887_316
theorem checked_554203_158 : validate cache_554203_158 554203 =
    some 554361 := by
  decide +kernel
theorem checked_554361_158 : validate cache_554361_158 554361 =
    some 554519 := by
  decide +kernel
theorem checked_554203_316 : validate cache_554203_316 554203 =
    some 554519 := by
  exact validate_branch 158 cache_554203_158 cache_554361_158
    554203 554361 554519
    checked_554203_158 rfl checked_554361_158
theorem checked_554519_158 : validate cache_554519_158 554519 =
    some 554677 := by
  decide +kernel
theorem checked_554677_158 : validate cache_554677_158 554677 =
    some 554835 := by
  decide +kernel
theorem checked_554519_316 : validate cache_554519_316 554519 =
    some 554835 := by
  exact validate_branch 158 cache_554519_158 cache_554677_158
    554519 554677 554835
    checked_554519_158 rfl checked_554677_158
theorem checked_554203_632 : validate cache_554203_632 554203 =
    some 554835 := by
  exact validate_branch 316 cache_554203_316 cache_554519_316
    554203 554519 554835
    checked_554203_316 rfl checked_554519_316
theorem checked_553571_1264 : validate cache_553571_1264 553571 =
    some 554835 := by
  exact validate_branch 632 cache_553571_632 cache_554203_632
    553571 554203 554835
    checked_553571_632 rfl checked_554203_632
theorem checked_554835_158 : validate cache_554835_158 554835 =
    some 554993 := by
  decide +kernel
theorem checked_554993_158 : validate cache_554993_158 554993 =
    some 555151 := by
  decide +kernel
theorem checked_554835_316 : validate cache_554835_316 554835 =
    some 555151 := by
  exact validate_branch 158 cache_554835_158 cache_554993_158
    554835 554993 555151
    checked_554835_158 rfl checked_554993_158
theorem checked_555151_158 : validate cache_555151_158 555151 =
    some 555309 := by
  decide +kernel
theorem checked_555309_158 : validate cache_555309_158 555309 =
    some 555467 := by
  decide +kernel
theorem checked_555151_316 : validate cache_555151_316 555151 =
    some 555467 := by
  exact validate_branch 158 cache_555151_158 cache_555309_158
    555151 555309 555467
    checked_555151_158 rfl checked_555309_158
theorem checked_554835_632 : validate cache_554835_632 554835 =
    some 555467 := by
  exact validate_branch 316 cache_554835_316 cache_555151_316
    554835 555151 555467
    checked_554835_316 rfl checked_555151_316
theorem checked_555467_158 : validate cache_555467_158 555467 =
    some 555625 := by
  decide +kernel
theorem checked_555625_158 : validate cache_555625_158 555625 =
    some 555783 := by
  decide +kernel
theorem checked_555467_316 : validate cache_555467_316 555467 =
    some 555783 := by
  exact validate_branch 158 cache_555467_158 cache_555625_158
    555467 555625 555783
    checked_555467_158 rfl checked_555625_158
theorem checked_555783_158 : validate cache_555783_158 555783 =
    some 555941 := by
  decide +kernel
theorem checked_555941_158 : validate cache_555941_158 555941 =
    some 556099 := by
  decide +kernel
theorem checked_555783_316 : validate cache_555783_316 555783 =
    some 556099 := by
  exact validate_branch 158 cache_555783_158 cache_555941_158
    555783 555941 556099
    checked_555783_158 rfl checked_555941_158
theorem checked_555467_632 : validate cache_555467_632 555467 =
    some 556099 := by
  exact validate_branch 316 cache_555467_316 cache_555783_316
    555467 555783 556099
    checked_555467_316 rfl checked_555783_316
theorem checked_554835_1264 : validate cache_554835_1264 554835 =
    some 556099 := by
  exact validate_branch 632 cache_554835_632 cache_555467_632
    554835 555467 556099
    checked_554835_632 rfl checked_555467_632
theorem checked_553571_2528 : validate cache_553571_2528 553571 =
    some 556099 := by
  exact validate_branch 1264 cache_553571_1264 cache_554835_1264
    553571 554835 556099
    checked_553571_1264 rfl checked_554835_1264
theorem checked_556099_158 : validate cache_556099_158 556099 =
    some 556257 := by
  decide +kernel
theorem checked_556257_158 : validate cache_556257_158 556257 =
    some 556415 := by
  decide +kernel
theorem checked_556099_316 : validate cache_556099_316 556099 =
    some 556415 := by
  exact validate_branch 158 cache_556099_158 cache_556257_158
    556099 556257 556415
    checked_556099_158 rfl checked_556257_158
theorem checked_556415_158 : validate cache_556415_158 556415 =
    some 556573 := by
  decide +kernel
theorem checked_556573_158 : validate cache_556573_158 556573 =
    some 556731 := by
  decide +kernel
theorem checked_556415_316 : validate cache_556415_316 556415 =
    some 556731 := by
  exact validate_branch 158 cache_556415_158 cache_556573_158
    556415 556573 556731
    checked_556415_158 rfl checked_556573_158
theorem checked_556099_632 : validate cache_556099_632 556099 =
    some 556731 := by
  exact validate_branch 316 cache_556099_316 cache_556415_316
    556099 556415 556731
    checked_556099_316 rfl checked_556415_316
theorem checked_556731_158 : validate cache_556731_158 556731 =
    some 556889 := by
  decide +kernel
theorem checked_556889_158 : validate cache_556889_158 556889 =
    some 557047 := by
  decide +kernel
theorem checked_556731_316 : validate cache_556731_316 556731 =
    some 557047 := by
  exact validate_branch 158 cache_556731_158 cache_556889_158
    556731 556889 557047
    checked_556731_158 rfl checked_556889_158
theorem checked_557047_158 : validate cache_557047_158 557047 =
    some 557205 := by
  decide +kernel
theorem checked_557205_158 : validate cache_557205_158 557205 =
    some 557363 := by
  decide +kernel
theorem checked_557047_316 : validate cache_557047_316 557047 =
    some 557363 := by
  exact validate_branch 158 cache_557047_158 cache_557205_158
    557047 557205 557363
    checked_557047_158 rfl checked_557205_158
theorem checked_556731_632 : validate cache_556731_632 556731 =
    some 557363 := by
  exact validate_branch 316 cache_556731_316 cache_557047_316
    556731 557047 557363
    checked_556731_316 rfl checked_557047_316
theorem checked_556099_1264 : validate cache_556099_1264 556099 =
    some 557363 := by
  exact validate_branch 632 cache_556099_632 cache_556731_632
    556099 556731 557363
    checked_556099_632 rfl checked_556731_632
theorem checked_557363_158 : validate cache_557363_158 557363 =
    some 557521 := by
  decide +kernel
theorem checked_557521_158 : validate cache_557521_158 557521 =
    some 557679 := by
  decide +kernel
theorem checked_557363_316 : validate cache_557363_316 557363 =
    some 557679 := by
  exact validate_branch 158 cache_557363_158 cache_557521_158
    557363 557521 557679
    checked_557363_158 rfl checked_557521_158
theorem checked_557679_158 : validate cache_557679_158 557679 =
    some 557837 := by
  decide +kernel
theorem checked_557837_158 : validate cache_557837_158 557837 =
    some 557995 := by
  decide +kernel
theorem checked_557679_316 : validate cache_557679_316 557679 =
    some 557995 := by
  exact validate_branch 158 cache_557679_158 cache_557837_158
    557679 557837 557995
    checked_557679_158 rfl checked_557837_158
theorem checked_557363_632 : validate cache_557363_632 557363 =
    some 557995 := by
  exact validate_branch 316 cache_557363_316 cache_557679_316
    557363 557679 557995
    checked_557363_316 rfl checked_557679_316
theorem checked_557995_158 : validate cache_557995_158 557995 =
    some 558153 := by
  decide +kernel
theorem checked_558153_158 : validate cache_558153_158 558153 =
    some 558311 := by
  decide +kernel
theorem checked_557995_316 : validate cache_557995_316 557995 =
    some 558311 := by
  exact validate_branch 158 cache_557995_158 cache_558153_158
    557995 558153 558311
    checked_557995_158 rfl checked_558153_158
theorem checked_558311_158 : validate cache_558311_158 558311 =
    some 558469 := by
  decide +kernel
theorem checked_558469_159 : validate cache_558469_159 558469 =
    some 558628 := by
  decide +kernel
theorem checked_558311_317 : validate cache_558311_317 558311 =
    some 558628 := by
  exact validate_branch 158 cache_558311_158 cache_558469_159
    558311 558469 558628
    checked_558311_158 rfl checked_558469_159
theorem checked_557995_633 : validate cache_557995_633 557995 =
    some 558628 := by
  exact validate_branch 316 cache_557995_316 cache_558311_317
    557995 558311 558628
    checked_557995_316 rfl checked_558311_317
theorem checked_557363_1265 : validate cache_557363_1265 557363 =
    some 558628 := by
  exact validate_branch 632 cache_557363_632 cache_557995_633
    557363 557995 558628
    checked_557363_632 rfl checked_557995_633
theorem checked_556099_2529 : validate cache_556099_2529 556099 =
    some 558628 := by
  exact validate_branch 1264 cache_556099_1264 cache_557363_1265
    556099 557363 558628
    checked_556099_1264 rfl checked_557363_1265
theorem checked_553571_5057 : validate cache_553571_5057 553571 =
    some 558628 := by
  exact validate_branch 2528 cache_553571_2528 cache_556099_2529
    553571 556099 558628
    checked_553571_2528 rfl checked_556099_2529
theorem checked_558628_158 : validate cache_558628_158 558628 =
    some 558786 := by
  decide +kernel
theorem checked_558786_158 : validate cache_558786_158 558786 =
    some 558944 := by
  decide +kernel
theorem checked_558628_316 : validate cache_558628_316 558628 =
    some 558944 := by
  exact validate_branch 158 cache_558628_158 cache_558786_158
    558628 558786 558944
    checked_558628_158 rfl checked_558786_158
theorem checked_558944_158 : validate cache_558944_158 558944 =
    some 559102 := by
  decide +kernel
theorem checked_559102_158 : validate cache_559102_158 559102 =
    some 559260 := by
  decide +kernel
theorem checked_558944_316 : validate cache_558944_316 558944 =
    some 559260 := by
  exact validate_branch 158 cache_558944_158 cache_559102_158
    558944 559102 559260
    checked_558944_158 rfl checked_559102_158
theorem checked_558628_632 : validate cache_558628_632 558628 =
    some 559260 := by
  exact validate_branch 316 cache_558628_316 cache_558944_316
    558628 558944 559260
    checked_558628_316 rfl checked_558944_316
theorem checked_559260_158 : validate cache_559260_158 559260 =
    some 559418 := by
  decide +kernel
theorem checked_559418_158 : validate cache_559418_158 559418 =
    some 559576 := by
  decide +kernel
theorem checked_559260_316 : validate cache_559260_316 559260 =
    some 559576 := by
  exact validate_branch 158 cache_559260_158 cache_559418_158
    559260 559418 559576
    checked_559260_158 rfl checked_559418_158
theorem checked_559576_158 : validate cache_559576_158 559576 =
    some 559734 := by
  decide +kernel
theorem checked_559734_158 : validate cache_559734_158 559734 =
    some 559892 := by
  decide +kernel
theorem checked_559576_316 : validate cache_559576_316 559576 =
    some 559892 := by
  exact validate_branch 158 cache_559576_158 cache_559734_158
    559576 559734 559892
    checked_559576_158 rfl checked_559734_158
theorem checked_559260_632 : validate cache_559260_632 559260 =
    some 559892 := by
  exact validate_branch 316 cache_559260_316 cache_559576_316
    559260 559576 559892
    checked_559260_316 rfl checked_559576_316
theorem checked_558628_1264 : validate cache_558628_1264 558628 =
    some 559892 := by
  exact validate_branch 632 cache_558628_632 cache_559260_632
    558628 559260 559892
    checked_558628_632 rfl checked_559260_632
theorem checked_559892_158 : validate cache_559892_158 559892 =
    some 560050 := by
  decide +kernel
theorem checked_560050_158 : validate cache_560050_158 560050 =
    some 560208 := by
  decide +kernel
theorem checked_559892_316 : validate cache_559892_316 559892 =
    some 560208 := by
  exact validate_branch 158 cache_559892_158 cache_560050_158
    559892 560050 560208
    checked_559892_158 rfl checked_560050_158
theorem checked_560208_158 : validate cache_560208_158 560208 =
    some 560366 := by
  decide +kernel
theorem checked_560366_158 : validate cache_560366_158 560366 =
    some 560524 := by
  decide +kernel
theorem checked_560208_316 : validate cache_560208_316 560208 =
    some 560524 := by
  exact validate_branch 158 cache_560208_158 cache_560366_158
    560208 560366 560524
    checked_560208_158 rfl checked_560366_158
theorem checked_559892_632 : validate cache_559892_632 559892 =
    some 560524 := by
  exact validate_branch 316 cache_559892_316 cache_560208_316
    559892 560208 560524
    checked_559892_316 rfl checked_560208_316
theorem checked_560524_158 : validate cache_560524_158 560524 =
    some 560682 := by
  decide +kernel
theorem checked_560682_158 : validate cache_560682_158 560682 =
    some 560840 := by
  decide +kernel
theorem checked_560524_316 : validate cache_560524_316 560524 =
    some 560840 := by
  exact validate_branch 158 cache_560524_158 cache_560682_158
    560524 560682 560840
    checked_560524_158 rfl checked_560682_158
theorem checked_560840_158 : validate cache_560840_158 560840 =
    some 560998 := by
  decide +kernel
theorem checked_560998_159 : validate cache_560998_159 560998 =
    some 561157 := by
  decide +kernel
theorem checked_560840_317 : validate cache_560840_317 560840 =
    some 561157 := by
  exact validate_branch 158 cache_560840_158 cache_560998_159
    560840 560998 561157
    checked_560840_158 rfl checked_560998_159
theorem checked_560524_633 : validate cache_560524_633 560524 =
    some 561157 := by
  exact validate_branch 316 cache_560524_316 cache_560840_317
    560524 560840 561157
    checked_560524_316 rfl checked_560840_317
theorem checked_559892_1265 : validate cache_559892_1265 559892 =
    some 561157 := by
  exact validate_branch 632 cache_559892_632 cache_560524_633
    559892 560524 561157
    checked_559892_632 rfl checked_560524_633
theorem checked_558628_2529 : validate cache_558628_2529 558628 =
    some 561157 := by
  exact validate_branch 1264 cache_558628_1264 cache_559892_1265
    558628 559892 561157
    checked_558628_1264 rfl checked_559892_1265
theorem checked_561157_158 : validate cache_561157_158 561157 =
    some 561315 := by
  decide +kernel
theorem checked_561315_158 : validate cache_561315_158 561315 =
    some 561473 := by
  decide +kernel
theorem checked_561157_316 : validate cache_561157_316 561157 =
    some 561473 := by
  exact validate_branch 158 cache_561157_158 cache_561315_158
    561157 561315 561473
    checked_561157_158 rfl checked_561315_158
theorem checked_561473_158 : validate cache_561473_158 561473 =
    some 561631 := by
  decide +kernel
theorem checked_561631_158 : validate cache_561631_158 561631 =
    some 561789 := by
  decide +kernel
theorem checked_561473_316 : validate cache_561473_316 561473 =
    some 561789 := by
  exact validate_branch 158 cache_561473_158 cache_561631_158
    561473 561631 561789
    checked_561473_158 rfl checked_561631_158
theorem checked_561157_632 : validate cache_561157_632 561157 =
    some 561789 := by
  exact validate_branch 316 cache_561157_316 cache_561473_316
    561157 561473 561789
    checked_561157_316 rfl checked_561473_316
theorem checked_561789_158 : validate cache_561789_158 561789 =
    some 561947 := by
  decide +kernel
theorem checked_561947_158 : validate cache_561947_158 561947 =
    some 562105 := by
  decide +kernel
theorem checked_561789_316 : validate cache_561789_316 561789 =
    some 562105 := by
  exact validate_branch 158 cache_561789_158 cache_561947_158
    561789 561947 562105
    checked_561789_158 rfl checked_561947_158
theorem checked_562105_158 : validate cache_562105_158 562105 =
    some 562263 := by
  decide +kernel
theorem checked_562263_158 : validate cache_562263_158 562263 =
    some 562421 := by
  decide +kernel
theorem checked_562105_316 : validate cache_562105_316 562105 =
    some 562421 := by
  exact validate_branch 158 cache_562105_158 cache_562263_158
    562105 562263 562421
    checked_562105_158 rfl checked_562263_158
theorem checked_561789_632 : validate cache_561789_632 561789 =
    some 562421 := by
  exact validate_branch 316 cache_561789_316 cache_562105_316
    561789 562105 562421
    checked_561789_316 rfl checked_562105_316
theorem checked_561157_1264 : validate cache_561157_1264 561157 =
    some 562421 := by
  exact validate_branch 632 cache_561157_632 cache_561789_632
    561157 561789 562421
    checked_561157_632 rfl checked_561789_632
theorem checked_562421_158 : validate cache_562421_158 562421 =
    some 562579 := by
  decide +kernel
theorem checked_562579_158 : validate cache_562579_158 562579 =
    some 562737 := by
  decide +kernel
theorem checked_562421_316 : validate cache_562421_316 562421 =
    some 562737 := by
  exact validate_branch 158 cache_562421_158 cache_562579_158
    562421 562579 562737
    checked_562421_158 rfl checked_562579_158
theorem checked_562737_158 : validate cache_562737_158 562737 =
    some 562895 := by
  decide +kernel
theorem checked_562895_158 : validate cache_562895_158 562895 =
    some 563053 := by
  decide +kernel
theorem checked_562737_316 : validate cache_562737_316 562737 =
    some 563053 := by
  exact validate_branch 158 cache_562737_158 cache_562895_158
    562737 562895 563053
    checked_562737_158 rfl checked_562895_158
theorem checked_562421_632 : validate cache_562421_632 562421 =
    some 563053 := by
  exact validate_branch 316 cache_562421_316 cache_562737_316
    562421 562737 563053
    checked_562421_316 rfl checked_562737_316
theorem checked_563053_158 : validate cache_563053_158 563053 =
    some 563211 := by
  decide +kernel
theorem checked_563211_158 : validate cache_563211_158 563211 =
    some 563369 := by
  decide +kernel
theorem checked_563053_316 : validate cache_563053_316 563053 =
    some 563369 := by
  exact validate_branch 158 cache_563053_158 cache_563211_158
    563053 563211 563369
    checked_563053_158 rfl checked_563211_158
theorem checked_563369_158 : validate cache_563369_158 563369 =
    some 563527 := by
  decide +kernel
theorem checked_563527_159 : validate cache_563527_159 563527 =
    some 563686 := by
  decide +kernel
theorem checked_563369_317 : validate cache_563369_317 563369 =
    some 563686 := by
  exact validate_branch 158 cache_563369_158 cache_563527_159
    563369 563527 563686
    checked_563369_158 rfl checked_563527_159
theorem checked_563053_633 : validate cache_563053_633 563053 =
    some 563686 := by
  exact validate_branch 316 cache_563053_316 cache_563369_317
    563053 563369 563686
    checked_563053_316 rfl checked_563369_317
theorem checked_562421_1265 : validate cache_562421_1265 562421 =
    some 563686 := by
  exact validate_branch 632 cache_562421_632 cache_563053_633
    562421 563053 563686
    checked_562421_632 rfl checked_563053_633
theorem checked_561157_2529 : validate cache_561157_2529 561157 =
    some 563686 := by
  exact validate_branch 1264 cache_561157_1264 cache_562421_1265
    561157 562421 563686
    checked_561157_1264 rfl checked_562421_1265
theorem checked_558628_5058 : validate cache_558628_5058 558628 =
    some 563686 := by
  exact validate_branch 2529 cache_558628_2529 cache_561157_2529
    558628 561157 563686
    checked_558628_2529 rfl checked_561157_2529
theorem checked_553571_10115 : validate cache_553571_10115 553571 =
    some 563686 := by
  exact validate_branch 5057 cache_553571_5057 cache_558628_5058
    553571 558628 563686
    checked_553571_5057 rfl checked_558628_5058
theorem checked_563686_158 : validate cache_563686_158 563686 =
    some 563844 := by
  decide +kernel
theorem checked_563844_158 : validate cache_563844_158 563844 =
    some 564002 := by
  decide +kernel
theorem checked_563686_316 : validate cache_563686_316 563686 =
    some 564002 := by
  exact validate_branch 158 cache_563686_158 cache_563844_158
    563686 563844 564002
    checked_563686_158 rfl checked_563844_158
theorem checked_564002_158 : validate cache_564002_158 564002 =
    some 564160 := by
  decide +kernel
theorem checked_564160_158 : validate cache_564160_158 564160 =
    some 564318 := by
  decide +kernel
theorem checked_564002_316 : validate cache_564002_316 564002 =
    some 564318 := by
  exact validate_branch 158 cache_564002_158 cache_564160_158
    564002 564160 564318
    checked_564002_158 rfl checked_564160_158
theorem checked_563686_632 : validate cache_563686_632 563686 =
    some 564318 := by
  exact validate_branch 316 cache_563686_316 cache_564002_316
    563686 564002 564318
    checked_563686_316 rfl checked_564002_316
theorem checked_564318_158 : validate cache_564318_158 564318 =
    some 564476 := by
  decide +kernel
theorem checked_564476_158 : validate cache_564476_158 564476 =
    some 564634 := by
  decide +kernel
theorem checked_564318_316 : validate cache_564318_316 564318 =
    some 564634 := by
  exact validate_branch 158 cache_564318_158 cache_564476_158
    564318 564476 564634
    checked_564318_158 rfl checked_564476_158
theorem checked_564634_158 : validate cache_564634_158 564634 =
    some 564792 := by
  decide +kernel
theorem checked_564792_158 : validate cache_564792_158 564792 =
    some 564950 := by
  decide +kernel
theorem checked_564634_316 : validate cache_564634_316 564634 =
    some 564950 := by
  exact validate_branch 158 cache_564634_158 cache_564792_158
    564634 564792 564950
    checked_564634_158 rfl checked_564792_158
theorem checked_564318_632 : validate cache_564318_632 564318 =
    some 564950 := by
  exact validate_branch 316 cache_564318_316 cache_564634_316
    564318 564634 564950
    checked_564318_316 rfl checked_564634_316
theorem checked_563686_1264 : validate cache_563686_1264 563686 =
    some 564950 := by
  exact validate_branch 632 cache_563686_632 cache_564318_632
    563686 564318 564950
    checked_563686_632 rfl checked_564318_632
theorem checked_564950_158 : validate cache_564950_158 564950 =
    some 565108 := by
  decide +kernel
theorem checked_565108_158 : validate cache_565108_158 565108 =
    some 565266 := by
  decide +kernel
theorem checked_564950_316 : validate cache_564950_316 564950 =
    some 565266 := by
  exact validate_branch 158 cache_564950_158 cache_565108_158
    564950 565108 565266
    checked_564950_158 rfl checked_565108_158
theorem checked_565266_158 : validate cache_565266_158 565266 =
    some 565424 := by
  decide +kernel
theorem checked_565424_158 : validate cache_565424_158 565424 =
    some 565582 := by
  decide +kernel
theorem checked_565266_316 : validate cache_565266_316 565266 =
    some 565582 := by
  exact validate_branch 158 cache_565266_158 cache_565424_158
    565266 565424 565582
    checked_565266_158 rfl checked_565424_158
theorem checked_564950_632 : validate cache_564950_632 564950 =
    some 565582 := by
  exact validate_branch 316 cache_564950_316 cache_565266_316
    564950 565266 565582
    checked_564950_316 rfl checked_565266_316
theorem checked_565582_158 : validate cache_565582_158 565582 =
    some 565740 := by
  decide +kernel
theorem checked_565740_158 : validate cache_565740_158 565740 =
    some 565898 := by
  decide +kernel
theorem checked_565582_316 : validate cache_565582_316 565582 =
    some 565898 := by
  exact validate_branch 158 cache_565582_158 cache_565740_158
    565582 565740 565898
    checked_565582_158 rfl checked_565740_158
theorem checked_565898_158 : validate cache_565898_158 565898 =
    some 566056 := by
  decide +kernel
theorem checked_566056_159 : validate cache_566056_159 566056 =
    some 566215 := by
  decide +kernel
theorem checked_565898_317 : validate cache_565898_317 565898 =
    some 566215 := by
  exact validate_branch 158 cache_565898_158 cache_566056_159
    565898 566056 566215
    checked_565898_158 rfl checked_566056_159
theorem checked_565582_633 : validate cache_565582_633 565582 =
    some 566215 := by
  exact validate_branch 316 cache_565582_316 cache_565898_317
    565582 565898 566215
    checked_565582_316 rfl checked_565898_317
theorem checked_564950_1265 : validate cache_564950_1265 564950 =
    some 566215 := by
  exact validate_branch 632 cache_564950_632 cache_565582_633
    564950 565582 566215
    checked_564950_632 rfl checked_565582_633
theorem checked_563686_2529 : validate cache_563686_2529 563686 =
    some 566215 := by
  exact validate_branch 1264 cache_563686_1264 cache_564950_1265
    563686 564950 566215
    checked_563686_1264 rfl checked_564950_1265
theorem checked_566215_158 : validate cache_566215_158 566215 =
    some 566373 := by
  decide +kernel
theorem checked_566373_158 : validate cache_566373_158 566373 =
    some 566531 := by
  decide +kernel
theorem checked_566215_316 : validate cache_566215_316 566215 =
    some 566531 := by
  exact validate_branch 158 cache_566215_158 cache_566373_158
    566215 566373 566531
    checked_566215_158 rfl checked_566373_158
theorem checked_566531_158 : validate cache_566531_158 566531 =
    some 566689 := by
  decide +kernel
theorem checked_566689_158 : validate cache_566689_158 566689 =
    some 566847 := by
  decide +kernel
theorem checked_566531_316 : validate cache_566531_316 566531 =
    some 566847 := by
  exact validate_branch 158 cache_566531_158 cache_566689_158
    566531 566689 566847
    checked_566531_158 rfl checked_566689_158
theorem checked_566215_632 : validate cache_566215_632 566215 =
    some 566847 := by
  exact validate_branch 316 cache_566215_316 cache_566531_316
    566215 566531 566847
    checked_566215_316 rfl checked_566531_316
theorem checked_566847_158 : validate cache_566847_158 566847 =
    some 567005 := by
  decide +kernel
theorem checked_567005_158 : validate cache_567005_158 567005 =
    some 567163 := by
  decide +kernel
theorem checked_566847_316 : validate cache_566847_316 566847 =
    some 567163 := by
  exact validate_branch 158 cache_566847_158 cache_567005_158
    566847 567005 567163
    checked_566847_158 rfl checked_567005_158
theorem checked_567163_158 : validate cache_567163_158 567163 =
    some 567321 := by
  decide +kernel
theorem checked_567321_158 : validate cache_567321_158 567321 =
    some 567479 := by
  decide +kernel
theorem checked_567163_316 : validate cache_567163_316 567163 =
    some 567479 := by
  exact validate_branch 158 cache_567163_158 cache_567321_158
    567163 567321 567479
    checked_567163_158 rfl checked_567321_158
theorem checked_566847_632 : validate cache_566847_632 566847 =
    some 567479 := by
  exact validate_branch 316 cache_566847_316 cache_567163_316
    566847 567163 567479
    checked_566847_316 rfl checked_567163_316
theorem checked_566215_1264 : validate cache_566215_1264 566215 =
    some 567479 := by
  exact validate_branch 632 cache_566215_632 cache_566847_632
    566215 566847 567479
    checked_566215_632 rfl checked_566847_632
theorem checked_567479_158 : validate cache_567479_158 567479 =
    some 567637 := by
  decide +kernel
theorem checked_567637_158 : validate cache_567637_158 567637 =
    some 567795 := by
  decide +kernel
theorem checked_567479_316 : validate cache_567479_316 567479 =
    some 567795 := by
  exact validate_branch 158 cache_567479_158 cache_567637_158
    567479 567637 567795
    checked_567479_158 rfl checked_567637_158
theorem checked_567795_158 : validate cache_567795_158 567795 =
    some 567953 := by
  decide +kernel
theorem checked_567953_158 : validate cache_567953_158 567953 =
    some 568111 := by
  decide +kernel
theorem checked_567795_316 : validate cache_567795_316 567795 =
    some 568111 := by
  exact validate_branch 158 cache_567795_158 cache_567953_158
    567795 567953 568111
    checked_567795_158 rfl checked_567953_158
theorem checked_567479_632 : validate cache_567479_632 567479 =
    some 568111 := by
  exact validate_branch 316 cache_567479_316 cache_567795_316
    567479 567795 568111
    checked_567479_316 rfl checked_567795_316
theorem checked_568111_158 : validate cache_568111_158 568111 =
    some 568269 := by
  decide +kernel
theorem checked_568269_158 : validate cache_568269_158 568269 =
    some 568427 := by
  decide +kernel
theorem checked_568111_316 : validate cache_568111_316 568111 =
    some 568427 := by
  exact validate_branch 158 cache_568111_158 cache_568269_158
    568111 568269 568427
    checked_568111_158 rfl checked_568269_158
theorem checked_568427_158 : validate cache_568427_158 568427 =
    some 568585 := by
  decide +kernel
theorem checked_568585_159 : validate cache_568585_159 568585 =
    some 568744 := by
  decide +kernel
theorem checked_568427_317 : validate cache_568427_317 568427 =
    some 568744 := by
  exact validate_branch 158 cache_568427_158 cache_568585_159
    568427 568585 568744
    checked_568427_158 rfl checked_568585_159
theorem checked_568111_633 : validate cache_568111_633 568111 =
    some 568744 := by
  exact validate_branch 316 cache_568111_316 cache_568427_317
    568111 568427 568744
    checked_568111_316 rfl checked_568427_317
theorem checked_567479_1265 : validate cache_567479_1265 567479 =
    some 568744 := by
  exact validate_branch 632 cache_567479_632 cache_568111_633
    567479 568111 568744
    checked_567479_632 rfl checked_568111_633
theorem checked_566215_2529 : validate cache_566215_2529 566215 =
    some 568744 := by
  exact validate_branch 1264 cache_566215_1264 cache_567479_1265
    566215 567479 568744
    checked_566215_1264 rfl checked_567479_1265
theorem checked_563686_5058 : validate cache_563686_5058 563686 =
    some 568744 := by
  exact validate_branch 2529 cache_563686_2529 cache_566215_2529
    563686 566215 568744
    checked_563686_2529 rfl checked_566215_2529
theorem checked_568744_158 : validate cache_568744_158 568744 =
    some 568902 := by
  decide +kernel
theorem checked_568902_158 : validate cache_568902_158 568902 =
    some 569060 := by
  decide +kernel
theorem checked_568744_316 : validate cache_568744_316 568744 =
    some 569060 := by
  exact validate_branch 158 cache_568744_158 cache_568902_158
    568744 568902 569060
    checked_568744_158 rfl checked_568902_158
theorem checked_569060_158 : validate cache_569060_158 569060 =
    some 569218 := by
  decide +kernel
theorem checked_569218_158 : validate cache_569218_158 569218 =
    some 569376 := by
  decide +kernel
theorem checked_569060_316 : validate cache_569060_316 569060 =
    some 569376 := by
  exact validate_branch 158 cache_569060_158 cache_569218_158
    569060 569218 569376
    checked_569060_158 rfl checked_569218_158
theorem checked_568744_632 : validate cache_568744_632 568744 =
    some 569376 := by
  exact validate_branch 316 cache_568744_316 cache_569060_316
    568744 569060 569376
    checked_568744_316 rfl checked_569060_316
theorem checked_569376_158 : validate cache_569376_158 569376 =
    some 569534 := by
  decide +kernel
theorem checked_569534_158 : validate cache_569534_158 569534 =
    some 569692 := by
  decide +kernel
theorem checked_569376_316 : validate cache_569376_316 569376 =
    some 569692 := by
  exact validate_branch 158 cache_569376_158 cache_569534_158
    569376 569534 569692
    checked_569376_158 rfl checked_569534_158
theorem checked_569692_158 : validate cache_569692_158 569692 =
    some 569850 := by
  decide +kernel
theorem checked_569850_158 : validate cache_569850_158 569850 =
    some 570008 := by
  decide +kernel
theorem checked_569692_316 : validate cache_569692_316 569692 =
    some 570008 := by
  exact validate_branch 158 cache_569692_158 cache_569850_158
    569692 569850 570008
    checked_569692_158 rfl checked_569850_158
theorem checked_569376_632 : validate cache_569376_632 569376 =
    some 570008 := by
  exact validate_branch 316 cache_569376_316 cache_569692_316
    569376 569692 570008
    checked_569376_316 rfl checked_569692_316
theorem checked_568744_1264 : validate cache_568744_1264 568744 =
    some 570008 := by
  exact validate_branch 632 cache_568744_632 cache_569376_632
    568744 569376 570008
    checked_568744_632 rfl checked_569376_632
theorem checked_570008_158 : validate cache_570008_158 570008 =
    some 570166 := by
  decide +kernel
theorem checked_570166_158 : validate cache_570166_158 570166 =
    some 570324 := by
  decide +kernel
theorem checked_570008_316 : validate cache_570008_316 570008 =
    some 570324 := by
  exact validate_branch 158 cache_570008_158 cache_570166_158
    570008 570166 570324
    checked_570008_158 rfl checked_570166_158
theorem checked_570324_158 : validate cache_570324_158 570324 =
    some 570482 := by
  decide +kernel
theorem checked_570482_158 : validate cache_570482_158 570482 =
    some 570640 := by
  decide +kernel
theorem checked_570324_316 : validate cache_570324_316 570324 =
    some 570640 := by
  exact validate_branch 158 cache_570324_158 cache_570482_158
    570324 570482 570640
    checked_570324_158 rfl checked_570482_158
theorem checked_570008_632 : validate cache_570008_632 570008 =
    some 570640 := by
  exact validate_branch 316 cache_570008_316 cache_570324_316
    570008 570324 570640
    checked_570008_316 rfl checked_570324_316
theorem checked_570640_158 : validate cache_570640_158 570640 =
    some 570798 := by
  decide +kernel
theorem checked_570798_158 : validate cache_570798_158 570798 =
    some 570956 := by
  decide +kernel
theorem checked_570640_316 : validate cache_570640_316 570640 =
    some 570956 := by
  exact validate_branch 158 cache_570640_158 cache_570798_158
    570640 570798 570956
    checked_570640_158 rfl checked_570798_158
theorem checked_570956_158 : validate cache_570956_158 570956 =
    some 571114 := by
  decide +kernel
theorem checked_571114_159 : validate cache_571114_159 571114 =
    some 571273 := by
  decide +kernel
theorem checked_570956_317 : validate cache_570956_317 570956 =
    some 571273 := by
  exact validate_branch 158 cache_570956_158 cache_571114_159
    570956 571114 571273
    checked_570956_158 rfl checked_571114_159
theorem checked_570640_633 : validate cache_570640_633 570640 =
    some 571273 := by
  exact validate_branch 316 cache_570640_316 cache_570956_317
    570640 570956 571273
    checked_570640_316 rfl checked_570956_317
theorem checked_570008_1265 : validate cache_570008_1265 570008 =
    some 571273 := by
  exact validate_branch 632 cache_570008_632 cache_570640_633
    570008 570640 571273
    checked_570008_632 rfl checked_570640_633
theorem checked_568744_2529 : validate cache_568744_2529 568744 =
    some 571273 := by
  exact validate_branch 1264 cache_568744_1264 cache_570008_1265
    568744 570008 571273
    checked_568744_1264 rfl checked_570008_1265
theorem checked_571273_158 : validate cache_571273_158 571273 =
    some 571431 := by
  decide +kernel
theorem checked_571431_158 : validate cache_571431_158 571431 =
    some 571589 := by
  decide +kernel
theorem checked_571273_316 : validate cache_571273_316 571273 =
    some 571589 := by
  exact validate_branch 158 cache_571273_158 cache_571431_158
    571273 571431 571589
    checked_571273_158 rfl checked_571431_158
theorem checked_571589_158 : validate cache_571589_158 571589 =
    some 571747 := by
  decide +kernel
theorem checked_571747_158 : validate cache_571747_158 571747 =
    some 571905 := by
  decide +kernel
theorem checked_571589_316 : validate cache_571589_316 571589 =
    some 571905 := by
  exact validate_branch 158 cache_571589_158 cache_571747_158
    571589 571747 571905
    checked_571589_158 rfl checked_571747_158
theorem checked_571273_632 : validate cache_571273_632 571273 =
    some 571905 := by
  exact validate_branch 316 cache_571273_316 cache_571589_316
    571273 571589 571905
    checked_571273_316 rfl checked_571589_316
theorem checked_571905_158 : validate cache_571905_158 571905 =
    some 572063 := by
  decide +kernel
theorem checked_572063_158 : validate cache_572063_158 572063 =
    some 572221 := by
  decide +kernel
theorem checked_571905_316 : validate cache_571905_316 571905 =
    some 572221 := by
  exact validate_branch 158 cache_571905_158 cache_572063_158
    571905 572063 572221
    checked_571905_158 rfl checked_572063_158
theorem checked_572221_158 : validate cache_572221_158 572221 =
    some 572379 := by
  decide +kernel
theorem checked_572379_158 : validate cache_572379_158 572379 =
    some 572537 := by
  decide +kernel
theorem checked_572221_316 : validate cache_572221_316 572221 =
    some 572537 := by
  exact validate_branch 158 cache_572221_158 cache_572379_158
    572221 572379 572537
    checked_572221_158 rfl checked_572379_158
theorem checked_571905_632 : validate cache_571905_632 571905 =
    some 572537 := by
  exact validate_branch 316 cache_571905_316 cache_572221_316
    571905 572221 572537
    checked_571905_316 rfl checked_572221_316
theorem checked_571273_1264 : validate cache_571273_1264 571273 =
    some 572537 := by
  exact validate_branch 632 cache_571273_632 cache_571905_632
    571273 571905 572537
    checked_571273_632 rfl checked_571905_632
theorem checked_572537_158 : validate cache_572537_158 572537 =
    some 572695 := by
  decide +kernel
theorem checked_572695_158 : validate cache_572695_158 572695 =
    some 572853 := by
  decide +kernel
theorem checked_572537_316 : validate cache_572537_316 572537 =
    some 572853 := by
  exact validate_branch 158 cache_572537_158 cache_572695_158
    572537 572695 572853
    checked_572537_158 rfl checked_572695_158
theorem checked_572853_158 : validate cache_572853_158 572853 =
    some 573011 := by
  decide +kernel
theorem checked_573011_158 : validate cache_573011_158 573011 =
    some 573169 := by
  decide +kernel
theorem checked_572853_316 : validate cache_572853_316 572853 =
    some 573169 := by
  exact validate_branch 158 cache_572853_158 cache_573011_158
    572853 573011 573169
    checked_572853_158 rfl checked_573011_158
theorem checked_572537_632 : validate cache_572537_632 572537 =
    some 573169 := by
  exact validate_branch 316 cache_572537_316 cache_572853_316
    572537 572853 573169
    checked_572537_316 rfl checked_572853_316
theorem checked_573169_158 : validate cache_573169_158 573169 =
    some 573327 := by
  decide +kernel
theorem checked_573327_158 : validate cache_573327_158 573327 =
    some 573485 := by
  decide +kernel
theorem checked_573169_316 : validate cache_573169_316 573169 =
    some 573485 := by
  exact validate_branch 158 cache_573169_158 cache_573327_158
    573169 573327 573485
    checked_573169_158 rfl checked_573327_158
theorem checked_573485_158 : validate cache_573485_158 573485 =
    some 573643 := by
  decide +kernel
theorem checked_573643_159 : validate cache_573643_159 573643 =
    some 573802 := by
  decide +kernel
theorem checked_573485_317 : validate cache_573485_317 573485 =
    some 573802 := by
  exact validate_branch 158 cache_573485_158 cache_573643_159
    573485 573643 573802
    checked_573485_158 rfl checked_573643_159
theorem checked_573169_633 : validate cache_573169_633 573169 =
    some 573802 := by
  exact validate_branch 316 cache_573169_316 cache_573485_317
    573169 573485 573802
    checked_573169_316 rfl checked_573485_317
theorem checked_572537_1265 : validate cache_572537_1265 572537 =
    some 573802 := by
  exact validate_branch 632 cache_572537_632 cache_573169_633
    572537 573169 573802
    checked_572537_632 rfl checked_573169_633
theorem checked_571273_2529 : validate cache_571273_2529 571273 =
    some 573802 := by
  exact validate_branch 1264 cache_571273_1264 cache_572537_1265
    571273 572537 573802
    checked_571273_1264 rfl checked_572537_1265
theorem checked_568744_5058 : validate cache_568744_5058 568744 =
    some 573802 := by
  exact validate_branch 2529 cache_568744_2529 cache_571273_2529
    568744 571273 573802
    checked_568744_2529 rfl checked_571273_2529
theorem checked_563686_10116 : validate cache_563686_10116 563686 =
    some 573802 := by
  exact validate_branch 5058 cache_563686_5058 cache_568744_5058
    563686 568744 573802
    checked_563686_5058 rfl checked_568744_5058
theorem checked_553571_20231 : validate cache_553571_20231 553571 =
    some 573802 := by
  exact validate_branch 10115 cache_553571_10115 cache_563686_10116
    553571 563686 573802
    checked_553571_10115 rfl checked_563686_10116
theorem checked_533341_40461 : validate cache_533341_40461 533341 =
    some 573802 := by
  exact validate_branch 20230 cache_533341_20230 cache_553571_20231
    533341 553571 573802
    checked_533341_20230 rfl checked_553571_20231

theorem checked : validate cache 533341 = some 573802 := checked_533341_40461

theorem count_exact : cache.count = 40461 := by
  have extent := validate_extent cache 533341 573802 checked
  omega

theorem within_body : 573802 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 533341 573802 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 533341 573802 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 533341 573802 address = observedPair address :=
  cachedPair_eq cache 533341 573802 checked address

end SourceReturnCachePilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Numeric observation cache fidelity checked: 40461"
