module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.SourceMainCache65536Data

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace SourceMainCache65536Pilot
theorem checked_65536_256 : validate cache_65536_256 65536 =
    some 65792 := by
  decide +kernel
theorem checked_65792_256 : validate cache_65792_256 65792 =
    some 66048 := by
  decide +kernel
theorem checked_65536_512 : validate cache_65536_512 65536 =
    some 66048 := by
  exact validate_branch 256 cache_65536_256 cache_65792_256
    65536 65792 66048
    checked_65536_256 rfl checked_65792_256
theorem checked_66048_256 : validate cache_66048_256 66048 =
    some 66304 := by
  decide +kernel
theorem checked_66304_256 : validate cache_66304_256 66304 =
    some 66560 := by
  decide +kernel
theorem checked_66048_512 : validate cache_66048_512 66048 =
    some 66560 := by
  exact validate_branch 256 cache_66048_256 cache_66304_256
    66048 66304 66560
    checked_66048_256 rfl checked_66304_256
theorem checked_65536_1024 : validate cache_65536_1024 65536 =
    some 66560 := by
  exact validate_branch 512 cache_65536_512 cache_66048_512
    65536 66048 66560
    checked_65536_512 rfl checked_66048_512
theorem checked_66560_256 : validate cache_66560_256 66560 =
    some 66816 := by
  decide +kernel
theorem checked_66816_256 : validate cache_66816_256 66816 =
    some 67072 := by
  decide +kernel
theorem checked_66560_512 : validate cache_66560_512 66560 =
    some 67072 := by
  exact validate_branch 256 cache_66560_256 cache_66816_256
    66560 66816 67072
    checked_66560_256 rfl checked_66816_256
theorem checked_67072_256 : validate cache_67072_256 67072 =
    some 67328 := by
  decide +kernel
theorem checked_67328_256 : validate cache_67328_256 67328 =
    some 67584 := by
  decide +kernel
theorem checked_67072_512 : validate cache_67072_512 67072 =
    some 67584 := by
  exact validate_branch 256 cache_67072_256 cache_67328_256
    67072 67328 67584
    checked_67072_256 rfl checked_67328_256
theorem checked_66560_1024 : validate cache_66560_1024 66560 =
    some 67584 := by
  exact validate_branch 512 cache_66560_512 cache_67072_512
    66560 67072 67584
    checked_66560_512 rfl checked_67072_512
theorem checked_65536_2048 : validate cache_65536_2048 65536 =
    some 67584 := by
  exact validate_branch 1024 cache_65536_1024 cache_66560_1024
    65536 66560 67584
    checked_65536_1024 rfl checked_66560_1024
theorem checked_67584_256 : validate cache_67584_256 67584 =
    some 67840 := by
  decide +kernel
theorem checked_67840_256 : validate cache_67840_256 67840 =
    some 68096 := by
  decide +kernel
theorem checked_67584_512 : validate cache_67584_512 67584 =
    some 68096 := by
  exact validate_branch 256 cache_67584_256 cache_67840_256
    67584 67840 68096
    checked_67584_256 rfl checked_67840_256
theorem checked_68096_256 : validate cache_68096_256 68096 =
    some 68352 := by
  decide +kernel
theorem checked_68352_256 : validate cache_68352_256 68352 =
    some 68608 := by
  decide +kernel
theorem checked_68096_512 : validate cache_68096_512 68096 =
    some 68608 := by
  exact validate_branch 256 cache_68096_256 cache_68352_256
    68096 68352 68608
    checked_68096_256 rfl checked_68352_256
theorem checked_67584_1024 : validate cache_67584_1024 67584 =
    some 68608 := by
  exact validate_branch 512 cache_67584_512 cache_68096_512
    67584 68096 68608
    checked_67584_512 rfl checked_68096_512
theorem checked_68608_256 : validate cache_68608_256 68608 =
    some 68864 := by
  decide +kernel
theorem checked_68864_256 : validate cache_68864_256 68864 =
    some 69120 := by
  decide +kernel
theorem checked_68608_512 : validate cache_68608_512 68608 =
    some 69120 := by
  exact validate_branch 256 cache_68608_256 cache_68864_256
    68608 68864 69120
    checked_68608_256 rfl checked_68864_256
theorem checked_69120_256 : validate cache_69120_256 69120 =
    some 69376 := by
  decide +kernel
theorem checked_69376_256 : validate cache_69376_256 69376 =
    some 69632 := by
  decide +kernel
theorem checked_69120_512 : validate cache_69120_512 69120 =
    some 69632 := by
  exact validate_branch 256 cache_69120_256 cache_69376_256
    69120 69376 69632
    checked_69120_256 rfl checked_69376_256
theorem checked_68608_1024 : validate cache_68608_1024 68608 =
    some 69632 := by
  exact validate_branch 512 cache_68608_512 cache_69120_512
    68608 69120 69632
    checked_68608_512 rfl checked_69120_512
theorem checked_67584_2048 : validate cache_67584_2048 67584 =
    some 69632 := by
  exact validate_branch 1024 cache_67584_1024 cache_68608_1024
    67584 68608 69632
    checked_67584_1024 rfl checked_68608_1024
theorem checked_65536_4096 : validate cache_65536_4096 65536 =
    some 69632 := by
  exact validate_branch 2048 cache_65536_2048 cache_67584_2048
    65536 67584 69632
    checked_65536_2048 rfl checked_67584_2048
theorem checked_69632_256 : validate cache_69632_256 69632 =
    some 69888 := by
  decide +kernel
theorem checked_69888_256 : validate cache_69888_256 69888 =
    some 70144 := by
  decide +kernel
theorem checked_69632_512 : validate cache_69632_512 69632 =
    some 70144 := by
  exact validate_branch 256 cache_69632_256 cache_69888_256
    69632 69888 70144
    checked_69632_256 rfl checked_69888_256
theorem checked_70144_256 : validate cache_70144_256 70144 =
    some 70400 := by
  decide +kernel
theorem checked_70400_256 : validate cache_70400_256 70400 =
    some 70656 := by
  decide +kernel
theorem checked_70144_512 : validate cache_70144_512 70144 =
    some 70656 := by
  exact validate_branch 256 cache_70144_256 cache_70400_256
    70144 70400 70656
    checked_70144_256 rfl checked_70400_256
theorem checked_69632_1024 : validate cache_69632_1024 69632 =
    some 70656 := by
  exact validate_branch 512 cache_69632_512 cache_70144_512
    69632 70144 70656
    checked_69632_512 rfl checked_70144_512
theorem checked_70656_256 : validate cache_70656_256 70656 =
    some 70912 := by
  decide +kernel
theorem checked_70912_256 : validate cache_70912_256 70912 =
    some 71168 := by
  decide +kernel
theorem checked_70656_512 : validate cache_70656_512 70656 =
    some 71168 := by
  exact validate_branch 256 cache_70656_256 cache_70912_256
    70656 70912 71168
    checked_70656_256 rfl checked_70912_256
theorem checked_71168_256 : validate cache_71168_256 71168 =
    some 71424 := by
  decide +kernel
theorem checked_71424_256 : validate cache_71424_256 71424 =
    some 71680 := by
  decide +kernel
theorem checked_71168_512 : validate cache_71168_512 71168 =
    some 71680 := by
  exact validate_branch 256 cache_71168_256 cache_71424_256
    71168 71424 71680
    checked_71168_256 rfl checked_71424_256
theorem checked_70656_1024 : validate cache_70656_1024 70656 =
    some 71680 := by
  exact validate_branch 512 cache_70656_512 cache_71168_512
    70656 71168 71680
    checked_70656_512 rfl checked_71168_512
theorem checked_69632_2048 : validate cache_69632_2048 69632 =
    some 71680 := by
  exact validate_branch 1024 cache_69632_1024 cache_70656_1024
    69632 70656 71680
    checked_69632_1024 rfl checked_70656_1024
theorem checked_71680_256 : validate cache_71680_256 71680 =
    some 71936 := by
  decide +kernel
theorem checked_71936_256 : validate cache_71936_256 71936 =
    some 72192 := by
  decide +kernel
theorem checked_71680_512 : validate cache_71680_512 71680 =
    some 72192 := by
  exact validate_branch 256 cache_71680_256 cache_71936_256
    71680 71936 72192
    checked_71680_256 rfl checked_71936_256
theorem checked_72192_256 : validate cache_72192_256 72192 =
    some 72448 := by
  decide +kernel
theorem checked_72448_256 : validate cache_72448_256 72448 =
    some 72704 := by
  decide +kernel
theorem checked_72192_512 : validate cache_72192_512 72192 =
    some 72704 := by
  exact validate_branch 256 cache_72192_256 cache_72448_256
    72192 72448 72704
    checked_72192_256 rfl checked_72448_256
theorem checked_71680_1024 : validate cache_71680_1024 71680 =
    some 72704 := by
  exact validate_branch 512 cache_71680_512 cache_72192_512
    71680 72192 72704
    checked_71680_512 rfl checked_72192_512
theorem checked_72704_256 : validate cache_72704_256 72704 =
    some 72960 := by
  decide +kernel
theorem checked_72960_256 : validate cache_72960_256 72960 =
    some 73216 := by
  decide +kernel
theorem checked_72704_512 : validate cache_72704_512 72704 =
    some 73216 := by
  exact validate_branch 256 cache_72704_256 cache_72960_256
    72704 72960 73216
    checked_72704_256 rfl checked_72960_256
theorem checked_73216_256 : validate cache_73216_256 73216 =
    some 73472 := by
  decide +kernel
theorem checked_73472_256 : validate cache_73472_256 73472 =
    some 73728 := by
  decide +kernel
theorem checked_73216_512 : validate cache_73216_512 73216 =
    some 73728 := by
  exact validate_branch 256 cache_73216_256 cache_73472_256
    73216 73472 73728
    checked_73216_256 rfl checked_73472_256
theorem checked_72704_1024 : validate cache_72704_1024 72704 =
    some 73728 := by
  exact validate_branch 512 cache_72704_512 cache_73216_512
    72704 73216 73728
    checked_72704_512 rfl checked_73216_512
theorem checked_71680_2048 : validate cache_71680_2048 71680 =
    some 73728 := by
  exact validate_branch 1024 cache_71680_1024 cache_72704_1024
    71680 72704 73728
    checked_71680_1024 rfl checked_72704_1024
theorem checked_69632_4096 : validate cache_69632_4096 69632 =
    some 73728 := by
  exact validate_branch 2048 cache_69632_2048 cache_71680_2048
    69632 71680 73728
    checked_69632_2048 rfl checked_71680_2048
theorem checked_65536_8192 : validate cache_65536_8192 65536 =
    some 73728 := by
  exact validate_branch 4096 cache_65536_4096 cache_69632_4096
    65536 69632 73728
    checked_65536_4096 rfl checked_69632_4096
theorem checked_73728_256 : validate cache_73728_256 73728 =
    some 73984 := by
  decide +kernel
theorem checked_73984_256 : validate cache_73984_256 73984 =
    some 74240 := by
  decide +kernel
theorem checked_73728_512 : validate cache_73728_512 73728 =
    some 74240 := by
  exact validate_branch 256 cache_73728_256 cache_73984_256
    73728 73984 74240
    checked_73728_256 rfl checked_73984_256
theorem checked_74240_256 : validate cache_74240_256 74240 =
    some 74496 := by
  decide +kernel
theorem checked_74496_256 : validate cache_74496_256 74496 =
    some 74752 := by
  decide +kernel
theorem checked_74240_512 : validate cache_74240_512 74240 =
    some 74752 := by
  exact validate_branch 256 cache_74240_256 cache_74496_256
    74240 74496 74752
    checked_74240_256 rfl checked_74496_256
theorem checked_73728_1024 : validate cache_73728_1024 73728 =
    some 74752 := by
  exact validate_branch 512 cache_73728_512 cache_74240_512
    73728 74240 74752
    checked_73728_512 rfl checked_74240_512
theorem checked_74752_256 : validate cache_74752_256 74752 =
    some 75008 := by
  decide +kernel
theorem checked_75008_256 : validate cache_75008_256 75008 =
    some 75264 := by
  decide +kernel
theorem checked_74752_512 : validate cache_74752_512 74752 =
    some 75264 := by
  exact validate_branch 256 cache_74752_256 cache_75008_256
    74752 75008 75264
    checked_74752_256 rfl checked_75008_256
theorem checked_75264_256 : validate cache_75264_256 75264 =
    some 75520 := by
  decide +kernel
theorem checked_75520_256 : validate cache_75520_256 75520 =
    some 75776 := by
  decide +kernel
theorem checked_75264_512 : validate cache_75264_512 75264 =
    some 75776 := by
  exact validate_branch 256 cache_75264_256 cache_75520_256
    75264 75520 75776
    checked_75264_256 rfl checked_75520_256
theorem checked_74752_1024 : validate cache_74752_1024 74752 =
    some 75776 := by
  exact validate_branch 512 cache_74752_512 cache_75264_512
    74752 75264 75776
    checked_74752_512 rfl checked_75264_512
theorem checked_73728_2048 : validate cache_73728_2048 73728 =
    some 75776 := by
  exact validate_branch 1024 cache_73728_1024 cache_74752_1024
    73728 74752 75776
    checked_73728_1024 rfl checked_74752_1024
theorem checked_75776_256 : validate cache_75776_256 75776 =
    some 76032 := by
  decide +kernel
theorem checked_76032_256 : validate cache_76032_256 76032 =
    some 76288 := by
  decide +kernel
theorem checked_75776_512 : validate cache_75776_512 75776 =
    some 76288 := by
  exact validate_branch 256 cache_75776_256 cache_76032_256
    75776 76032 76288
    checked_75776_256 rfl checked_76032_256
theorem checked_76288_256 : validate cache_76288_256 76288 =
    some 76544 := by
  decide +kernel
theorem checked_76544_256 : validate cache_76544_256 76544 =
    some 76800 := by
  decide +kernel
theorem checked_76288_512 : validate cache_76288_512 76288 =
    some 76800 := by
  exact validate_branch 256 cache_76288_256 cache_76544_256
    76288 76544 76800
    checked_76288_256 rfl checked_76544_256
theorem checked_75776_1024 : validate cache_75776_1024 75776 =
    some 76800 := by
  exact validate_branch 512 cache_75776_512 cache_76288_512
    75776 76288 76800
    checked_75776_512 rfl checked_76288_512
theorem checked_76800_256 : validate cache_76800_256 76800 =
    some 77056 := by
  decide +kernel
theorem checked_77056_256 : validate cache_77056_256 77056 =
    some 77312 := by
  decide +kernel
theorem checked_76800_512 : validate cache_76800_512 76800 =
    some 77312 := by
  exact validate_branch 256 cache_76800_256 cache_77056_256
    76800 77056 77312
    checked_76800_256 rfl checked_77056_256
theorem checked_77312_256 : validate cache_77312_256 77312 =
    some 77568 := by
  decide +kernel
theorem checked_77568_256 : validate cache_77568_256 77568 =
    some 77824 := by
  decide +kernel
theorem checked_77312_512 : validate cache_77312_512 77312 =
    some 77824 := by
  exact validate_branch 256 cache_77312_256 cache_77568_256
    77312 77568 77824
    checked_77312_256 rfl checked_77568_256
theorem checked_76800_1024 : validate cache_76800_1024 76800 =
    some 77824 := by
  exact validate_branch 512 cache_76800_512 cache_77312_512
    76800 77312 77824
    checked_76800_512 rfl checked_77312_512
theorem checked_75776_2048 : validate cache_75776_2048 75776 =
    some 77824 := by
  exact validate_branch 1024 cache_75776_1024 cache_76800_1024
    75776 76800 77824
    checked_75776_1024 rfl checked_76800_1024
theorem checked_73728_4096 : validate cache_73728_4096 73728 =
    some 77824 := by
  exact validate_branch 2048 cache_73728_2048 cache_75776_2048
    73728 75776 77824
    checked_73728_2048 rfl checked_75776_2048
theorem checked_77824_256 : validate cache_77824_256 77824 =
    some 78080 := by
  decide +kernel
theorem checked_78080_256 : validate cache_78080_256 78080 =
    some 78336 := by
  decide +kernel
theorem checked_77824_512 : validate cache_77824_512 77824 =
    some 78336 := by
  exact validate_branch 256 cache_77824_256 cache_78080_256
    77824 78080 78336
    checked_77824_256 rfl checked_78080_256
theorem checked_78336_256 : validate cache_78336_256 78336 =
    some 78592 := by
  decide +kernel
theorem checked_78592_256 : validate cache_78592_256 78592 =
    some 78848 := by
  decide +kernel
theorem checked_78336_512 : validate cache_78336_512 78336 =
    some 78848 := by
  exact validate_branch 256 cache_78336_256 cache_78592_256
    78336 78592 78848
    checked_78336_256 rfl checked_78592_256
theorem checked_77824_1024 : validate cache_77824_1024 77824 =
    some 78848 := by
  exact validate_branch 512 cache_77824_512 cache_78336_512
    77824 78336 78848
    checked_77824_512 rfl checked_78336_512
theorem checked_78848_256 : validate cache_78848_256 78848 =
    some 79104 := by
  decide +kernel
theorem checked_79104_256 : validate cache_79104_256 79104 =
    some 79360 := by
  decide +kernel
theorem checked_78848_512 : validate cache_78848_512 78848 =
    some 79360 := by
  exact validate_branch 256 cache_78848_256 cache_79104_256
    78848 79104 79360
    checked_78848_256 rfl checked_79104_256
theorem checked_79360_256 : validate cache_79360_256 79360 =
    some 79616 := by
  decide +kernel
theorem checked_79616_256 : validate cache_79616_256 79616 =
    some 79872 := by
  decide +kernel
theorem checked_79360_512 : validate cache_79360_512 79360 =
    some 79872 := by
  exact validate_branch 256 cache_79360_256 cache_79616_256
    79360 79616 79872
    checked_79360_256 rfl checked_79616_256
theorem checked_78848_1024 : validate cache_78848_1024 78848 =
    some 79872 := by
  exact validate_branch 512 cache_78848_512 cache_79360_512
    78848 79360 79872
    checked_78848_512 rfl checked_79360_512
theorem checked_77824_2048 : validate cache_77824_2048 77824 =
    some 79872 := by
  exact validate_branch 1024 cache_77824_1024 cache_78848_1024
    77824 78848 79872
    checked_77824_1024 rfl checked_78848_1024
theorem checked_79872_256 : validate cache_79872_256 79872 =
    some 80128 := by
  decide +kernel
theorem checked_80128_256 : validate cache_80128_256 80128 =
    some 80384 := by
  decide +kernel
theorem checked_79872_512 : validate cache_79872_512 79872 =
    some 80384 := by
  exact validate_branch 256 cache_79872_256 cache_80128_256
    79872 80128 80384
    checked_79872_256 rfl checked_80128_256
theorem checked_80384_256 : validate cache_80384_256 80384 =
    some 80640 := by
  decide +kernel
theorem checked_80640_256 : validate cache_80640_256 80640 =
    some 80896 := by
  decide +kernel
theorem checked_80384_512 : validate cache_80384_512 80384 =
    some 80896 := by
  exact validate_branch 256 cache_80384_256 cache_80640_256
    80384 80640 80896
    checked_80384_256 rfl checked_80640_256
theorem checked_79872_1024 : validate cache_79872_1024 79872 =
    some 80896 := by
  exact validate_branch 512 cache_79872_512 cache_80384_512
    79872 80384 80896
    checked_79872_512 rfl checked_80384_512
theorem checked_80896_256 : validate cache_80896_256 80896 =
    some 81152 := by
  decide +kernel
theorem checked_81152_256 : validate cache_81152_256 81152 =
    some 81408 := by
  decide +kernel
theorem checked_80896_512 : validate cache_80896_512 80896 =
    some 81408 := by
  exact validate_branch 256 cache_80896_256 cache_81152_256
    80896 81152 81408
    checked_80896_256 rfl checked_81152_256
theorem checked_81408_256 : validate cache_81408_256 81408 =
    some 81664 := by
  decide +kernel
theorem checked_81664_256 : validate cache_81664_256 81664 =
    some 81920 := by
  decide +kernel
theorem checked_81408_512 : validate cache_81408_512 81408 =
    some 81920 := by
  exact validate_branch 256 cache_81408_256 cache_81664_256
    81408 81664 81920
    checked_81408_256 rfl checked_81664_256
theorem checked_80896_1024 : validate cache_80896_1024 80896 =
    some 81920 := by
  exact validate_branch 512 cache_80896_512 cache_81408_512
    80896 81408 81920
    checked_80896_512 rfl checked_81408_512
theorem checked_79872_2048 : validate cache_79872_2048 79872 =
    some 81920 := by
  exact validate_branch 1024 cache_79872_1024 cache_80896_1024
    79872 80896 81920
    checked_79872_1024 rfl checked_80896_1024
theorem checked_77824_4096 : validate cache_77824_4096 77824 =
    some 81920 := by
  exact validate_branch 2048 cache_77824_2048 cache_79872_2048
    77824 79872 81920
    checked_77824_2048 rfl checked_79872_2048
theorem checked_73728_8192 : validate cache_73728_8192 73728 =
    some 81920 := by
  exact validate_branch 4096 cache_73728_4096 cache_77824_4096
    73728 77824 81920
    checked_73728_4096 rfl checked_77824_4096
theorem checked_65536_16384 : validate cache_65536_16384 65536 =
    some 81920 := by
  exact validate_branch 8192 cache_65536_8192 cache_73728_8192
    65536 73728 81920
    checked_65536_8192 rfl checked_73728_8192
theorem checked_81920_256 : validate cache_81920_256 81920 =
    some 82176 := by
  decide +kernel
theorem checked_82176_256 : validate cache_82176_256 82176 =
    some 82432 := by
  decide +kernel
theorem checked_81920_512 : validate cache_81920_512 81920 =
    some 82432 := by
  exact validate_branch 256 cache_81920_256 cache_82176_256
    81920 82176 82432
    checked_81920_256 rfl checked_82176_256
theorem checked_82432_256 : validate cache_82432_256 82432 =
    some 82688 := by
  decide +kernel
theorem checked_82688_256 : validate cache_82688_256 82688 =
    some 82944 := by
  decide +kernel
theorem checked_82432_512 : validate cache_82432_512 82432 =
    some 82944 := by
  exact validate_branch 256 cache_82432_256 cache_82688_256
    82432 82688 82944
    checked_82432_256 rfl checked_82688_256
theorem checked_81920_1024 : validate cache_81920_1024 81920 =
    some 82944 := by
  exact validate_branch 512 cache_81920_512 cache_82432_512
    81920 82432 82944
    checked_81920_512 rfl checked_82432_512
theorem checked_82944_256 : validate cache_82944_256 82944 =
    some 83200 := by
  decide +kernel
theorem checked_83200_256 : validate cache_83200_256 83200 =
    some 83456 := by
  decide +kernel
theorem checked_82944_512 : validate cache_82944_512 82944 =
    some 83456 := by
  exact validate_branch 256 cache_82944_256 cache_83200_256
    82944 83200 83456
    checked_82944_256 rfl checked_83200_256
theorem checked_83456_256 : validate cache_83456_256 83456 =
    some 83712 := by
  decide +kernel
theorem checked_83712_256 : validate cache_83712_256 83712 =
    some 83968 := by
  decide +kernel
theorem checked_83456_512 : validate cache_83456_512 83456 =
    some 83968 := by
  exact validate_branch 256 cache_83456_256 cache_83712_256
    83456 83712 83968
    checked_83456_256 rfl checked_83712_256
theorem checked_82944_1024 : validate cache_82944_1024 82944 =
    some 83968 := by
  exact validate_branch 512 cache_82944_512 cache_83456_512
    82944 83456 83968
    checked_82944_512 rfl checked_83456_512
theorem checked_81920_2048 : validate cache_81920_2048 81920 =
    some 83968 := by
  exact validate_branch 1024 cache_81920_1024 cache_82944_1024
    81920 82944 83968
    checked_81920_1024 rfl checked_82944_1024
theorem checked_83968_256 : validate cache_83968_256 83968 =
    some 84224 := by
  decide +kernel
theorem checked_84224_256 : validate cache_84224_256 84224 =
    some 84480 := by
  decide +kernel
theorem checked_83968_512 : validate cache_83968_512 83968 =
    some 84480 := by
  exact validate_branch 256 cache_83968_256 cache_84224_256
    83968 84224 84480
    checked_83968_256 rfl checked_84224_256
theorem checked_84480_256 : validate cache_84480_256 84480 =
    some 84736 := by
  decide +kernel
theorem checked_84736_256 : validate cache_84736_256 84736 =
    some 84992 := by
  decide +kernel
theorem checked_84480_512 : validate cache_84480_512 84480 =
    some 84992 := by
  exact validate_branch 256 cache_84480_256 cache_84736_256
    84480 84736 84992
    checked_84480_256 rfl checked_84736_256
theorem checked_83968_1024 : validate cache_83968_1024 83968 =
    some 84992 := by
  exact validate_branch 512 cache_83968_512 cache_84480_512
    83968 84480 84992
    checked_83968_512 rfl checked_84480_512
theorem checked_84992_256 : validate cache_84992_256 84992 =
    some 85248 := by
  decide +kernel
theorem checked_85248_256 : validate cache_85248_256 85248 =
    some 85504 := by
  decide +kernel
theorem checked_84992_512 : validate cache_84992_512 84992 =
    some 85504 := by
  exact validate_branch 256 cache_84992_256 cache_85248_256
    84992 85248 85504
    checked_84992_256 rfl checked_85248_256
theorem checked_85504_256 : validate cache_85504_256 85504 =
    some 85760 := by
  decide +kernel
theorem checked_85760_256 : validate cache_85760_256 85760 =
    some 86016 := by
  decide +kernel
theorem checked_85504_512 : validate cache_85504_512 85504 =
    some 86016 := by
  exact validate_branch 256 cache_85504_256 cache_85760_256
    85504 85760 86016
    checked_85504_256 rfl checked_85760_256
theorem checked_84992_1024 : validate cache_84992_1024 84992 =
    some 86016 := by
  exact validate_branch 512 cache_84992_512 cache_85504_512
    84992 85504 86016
    checked_84992_512 rfl checked_85504_512
theorem checked_83968_2048 : validate cache_83968_2048 83968 =
    some 86016 := by
  exact validate_branch 1024 cache_83968_1024 cache_84992_1024
    83968 84992 86016
    checked_83968_1024 rfl checked_84992_1024
theorem checked_81920_4096 : validate cache_81920_4096 81920 =
    some 86016 := by
  exact validate_branch 2048 cache_81920_2048 cache_83968_2048
    81920 83968 86016
    checked_81920_2048 rfl checked_83968_2048
theorem checked_86016_256 : validate cache_86016_256 86016 =
    some 86272 := by
  decide +kernel
theorem checked_86272_256 : validate cache_86272_256 86272 =
    some 86528 := by
  decide +kernel
theorem checked_86016_512 : validate cache_86016_512 86016 =
    some 86528 := by
  exact validate_branch 256 cache_86016_256 cache_86272_256
    86016 86272 86528
    checked_86016_256 rfl checked_86272_256
theorem checked_86528_256 : validate cache_86528_256 86528 =
    some 86784 := by
  decide +kernel
theorem checked_86784_256 : validate cache_86784_256 86784 =
    some 87040 := by
  decide +kernel
theorem checked_86528_512 : validate cache_86528_512 86528 =
    some 87040 := by
  exact validate_branch 256 cache_86528_256 cache_86784_256
    86528 86784 87040
    checked_86528_256 rfl checked_86784_256
theorem checked_86016_1024 : validate cache_86016_1024 86016 =
    some 87040 := by
  exact validate_branch 512 cache_86016_512 cache_86528_512
    86016 86528 87040
    checked_86016_512 rfl checked_86528_512
theorem checked_87040_256 : validate cache_87040_256 87040 =
    some 87296 := by
  decide +kernel
theorem checked_87296_256 : validate cache_87296_256 87296 =
    some 87552 := by
  decide +kernel
theorem checked_87040_512 : validate cache_87040_512 87040 =
    some 87552 := by
  exact validate_branch 256 cache_87040_256 cache_87296_256
    87040 87296 87552
    checked_87040_256 rfl checked_87296_256
theorem checked_87552_256 : validate cache_87552_256 87552 =
    some 87808 := by
  decide +kernel
theorem checked_87808_256 : validate cache_87808_256 87808 =
    some 88064 := by
  decide +kernel
theorem checked_87552_512 : validate cache_87552_512 87552 =
    some 88064 := by
  exact validate_branch 256 cache_87552_256 cache_87808_256
    87552 87808 88064
    checked_87552_256 rfl checked_87808_256
theorem checked_87040_1024 : validate cache_87040_1024 87040 =
    some 88064 := by
  exact validate_branch 512 cache_87040_512 cache_87552_512
    87040 87552 88064
    checked_87040_512 rfl checked_87552_512
theorem checked_86016_2048 : validate cache_86016_2048 86016 =
    some 88064 := by
  exact validate_branch 1024 cache_86016_1024 cache_87040_1024
    86016 87040 88064
    checked_86016_1024 rfl checked_87040_1024
theorem checked_88064_256 : validate cache_88064_256 88064 =
    some 88320 := by
  decide +kernel
theorem checked_88320_256 : validate cache_88320_256 88320 =
    some 88576 := by
  decide +kernel
theorem checked_88064_512 : validate cache_88064_512 88064 =
    some 88576 := by
  exact validate_branch 256 cache_88064_256 cache_88320_256
    88064 88320 88576
    checked_88064_256 rfl checked_88320_256
theorem checked_88576_256 : validate cache_88576_256 88576 =
    some 88832 := by
  decide +kernel
theorem checked_88832_256 : validate cache_88832_256 88832 =
    some 89088 := by
  decide +kernel
theorem checked_88576_512 : validate cache_88576_512 88576 =
    some 89088 := by
  exact validate_branch 256 cache_88576_256 cache_88832_256
    88576 88832 89088
    checked_88576_256 rfl checked_88832_256
theorem checked_88064_1024 : validate cache_88064_1024 88064 =
    some 89088 := by
  exact validate_branch 512 cache_88064_512 cache_88576_512
    88064 88576 89088
    checked_88064_512 rfl checked_88576_512
theorem checked_89088_256 : validate cache_89088_256 89088 =
    some 89344 := by
  decide +kernel
theorem checked_89344_256 : validate cache_89344_256 89344 =
    some 89600 := by
  decide +kernel
theorem checked_89088_512 : validate cache_89088_512 89088 =
    some 89600 := by
  exact validate_branch 256 cache_89088_256 cache_89344_256
    89088 89344 89600
    checked_89088_256 rfl checked_89344_256
theorem checked_89600_256 : validate cache_89600_256 89600 =
    some 89856 := by
  decide +kernel
theorem checked_89856_256 : validate cache_89856_256 89856 =
    some 90112 := by
  decide +kernel
theorem checked_89600_512 : validate cache_89600_512 89600 =
    some 90112 := by
  exact validate_branch 256 cache_89600_256 cache_89856_256
    89600 89856 90112
    checked_89600_256 rfl checked_89856_256
theorem checked_89088_1024 : validate cache_89088_1024 89088 =
    some 90112 := by
  exact validate_branch 512 cache_89088_512 cache_89600_512
    89088 89600 90112
    checked_89088_512 rfl checked_89600_512
theorem checked_88064_2048 : validate cache_88064_2048 88064 =
    some 90112 := by
  exact validate_branch 1024 cache_88064_1024 cache_89088_1024
    88064 89088 90112
    checked_88064_1024 rfl checked_89088_1024
theorem checked_86016_4096 : validate cache_86016_4096 86016 =
    some 90112 := by
  exact validate_branch 2048 cache_86016_2048 cache_88064_2048
    86016 88064 90112
    checked_86016_2048 rfl checked_88064_2048
theorem checked_81920_8192 : validate cache_81920_8192 81920 =
    some 90112 := by
  exact validate_branch 4096 cache_81920_4096 cache_86016_4096
    81920 86016 90112
    checked_81920_4096 rfl checked_86016_4096
theorem checked_90112_256 : validate cache_90112_256 90112 =
    some 90368 := by
  decide +kernel
theorem checked_90368_256 : validate cache_90368_256 90368 =
    some 90624 := by
  decide +kernel
theorem checked_90112_512 : validate cache_90112_512 90112 =
    some 90624 := by
  exact validate_branch 256 cache_90112_256 cache_90368_256
    90112 90368 90624
    checked_90112_256 rfl checked_90368_256
theorem checked_90624_256 : validate cache_90624_256 90624 =
    some 90880 := by
  decide +kernel
theorem checked_90880_256 : validate cache_90880_256 90880 =
    some 91136 := by
  decide +kernel
theorem checked_90624_512 : validate cache_90624_512 90624 =
    some 91136 := by
  exact validate_branch 256 cache_90624_256 cache_90880_256
    90624 90880 91136
    checked_90624_256 rfl checked_90880_256
theorem checked_90112_1024 : validate cache_90112_1024 90112 =
    some 91136 := by
  exact validate_branch 512 cache_90112_512 cache_90624_512
    90112 90624 91136
    checked_90112_512 rfl checked_90624_512
theorem checked_91136_256 : validate cache_91136_256 91136 =
    some 91392 := by
  decide +kernel
theorem checked_91392_256 : validate cache_91392_256 91392 =
    some 91648 := by
  decide +kernel
theorem checked_91136_512 : validate cache_91136_512 91136 =
    some 91648 := by
  exact validate_branch 256 cache_91136_256 cache_91392_256
    91136 91392 91648
    checked_91136_256 rfl checked_91392_256
theorem checked_91648_256 : validate cache_91648_256 91648 =
    some 91904 := by
  decide +kernel
theorem checked_91904_256 : validate cache_91904_256 91904 =
    some 92160 := by
  decide +kernel
theorem checked_91648_512 : validate cache_91648_512 91648 =
    some 92160 := by
  exact validate_branch 256 cache_91648_256 cache_91904_256
    91648 91904 92160
    checked_91648_256 rfl checked_91904_256
theorem checked_91136_1024 : validate cache_91136_1024 91136 =
    some 92160 := by
  exact validate_branch 512 cache_91136_512 cache_91648_512
    91136 91648 92160
    checked_91136_512 rfl checked_91648_512
theorem checked_90112_2048 : validate cache_90112_2048 90112 =
    some 92160 := by
  exact validate_branch 1024 cache_90112_1024 cache_91136_1024
    90112 91136 92160
    checked_90112_1024 rfl checked_91136_1024
theorem checked_92160_256 : validate cache_92160_256 92160 =
    some 92416 := by
  decide +kernel
theorem checked_92416_256 : validate cache_92416_256 92416 =
    some 92672 := by
  decide +kernel
theorem checked_92160_512 : validate cache_92160_512 92160 =
    some 92672 := by
  exact validate_branch 256 cache_92160_256 cache_92416_256
    92160 92416 92672
    checked_92160_256 rfl checked_92416_256
theorem checked_92672_256 : validate cache_92672_256 92672 =
    some 92928 := by
  decide +kernel
theorem checked_92928_256 : validate cache_92928_256 92928 =
    some 93184 := by
  decide +kernel
theorem checked_92672_512 : validate cache_92672_512 92672 =
    some 93184 := by
  exact validate_branch 256 cache_92672_256 cache_92928_256
    92672 92928 93184
    checked_92672_256 rfl checked_92928_256
theorem checked_92160_1024 : validate cache_92160_1024 92160 =
    some 93184 := by
  exact validate_branch 512 cache_92160_512 cache_92672_512
    92160 92672 93184
    checked_92160_512 rfl checked_92672_512
theorem checked_93184_256 : validate cache_93184_256 93184 =
    some 93440 := by
  decide +kernel
theorem checked_93440_256 : validate cache_93440_256 93440 =
    some 93696 := by
  decide +kernel
theorem checked_93184_512 : validate cache_93184_512 93184 =
    some 93696 := by
  exact validate_branch 256 cache_93184_256 cache_93440_256
    93184 93440 93696
    checked_93184_256 rfl checked_93440_256
theorem checked_93696_256 : validate cache_93696_256 93696 =
    some 93952 := by
  decide +kernel
theorem checked_93952_256 : validate cache_93952_256 93952 =
    some 94208 := by
  decide +kernel
theorem checked_93696_512 : validate cache_93696_512 93696 =
    some 94208 := by
  exact validate_branch 256 cache_93696_256 cache_93952_256
    93696 93952 94208
    checked_93696_256 rfl checked_93952_256
theorem checked_93184_1024 : validate cache_93184_1024 93184 =
    some 94208 := by
  exact validate_branch 512 cache_93184_512 cache_93696_512
    93184 93696 94208
    checked_93184_512 rfl checked_93696_512
theorem checked_92160_2048 : validate cache_92160_2048 92160 =
    some 94208 := by
  exact validate_branch 1024 cache_92160_1024 cache_93184_1024
    92160 93184 94208
    checked_92160_1024 rfl checked_93184_1024
theorem checked_90112_4096 : validate cache_90112_4096 90112 =
    some 94208 := by
  exact validate_branch 2048 cache_90112_2048 cache_92160_2048
    90112 92160 94208
    checked_90112_2048 rfl checked_92160_2048
theorem checked_94208_256 : validate cache_94208_256 94208 =
    some 94464 := by
  decide +kernel
theorem checked_94464_256 : validate cache_94464_256 94464 =
    some 94720 := by
  decide +kernel
theorem checked_94208_512 : validate cache_94208_512 94208 =
    some 94720 := by
  exact validate_branch 256 cache_94208_256 cache_94464_256
    94208 94464 94720
    checked_94208_256 rfl checked_94464_256
theorem checked_94720_256 : validate cache_94720_256 94720 =
    some 94976 := by
  decide +kernel
theorem checked_94976_256 : validate cache_94976_256 94976 =
    some 95232 := by
  decide +kernel
theorem checked_94720_512 : validate cache_94720_512 94720 =
    some 95232 := by
  exact validate_branch 256 cache_94720_256 cache_94976_256
    94720 94976 95232
    checked_94720_256 rfl checked_94976_256
theorem checked_94208_1024 : validate cache_94208_1024 94208 =
    some 95232 := by
  exact validate_branch 512 cache_94208_512 cache_94720_512
    94208 94720 95232
    checked_94208_512 rfl checked_94720_512
theorem checked_95232_256 : validate cache_95232_256 95232 =
    some 95488 := by
  decide +kernel
theorem checked_95488_256 : validate cache_95488_256 95488 =
    some 95744 := by
  decide +kernel
theorem checked_95232_512 : validate cache_95232_512 95232 =
    some 95744 := by
  exact validate_branch 256 cache_95232_256 cache_95488_256
    95232 95488 95744
    checked_95232_256 rfl checked_95488_256
theorem checked_95744_256 : validate cache_95744_256 95744 =
    some 96000 := by
  decide +kernel
theorem checked_96000_256 : validate cache_96000_256 96000 =
    some 96256 := by
  decide +kernel
theorem checked_95744_512 : validate cache_95744_512 95744 =
    some 96256 := by
  exact validate_branch 256 cache_95744_256 cache_96000_256
    95744 96000 96256
    checked_95744_256 rfl checked_96000_256
theorem checked_95232_1024 : validate cache_95232_1024 95232 =
    some 96256 := by
  exact validate_branch 512 cache_95232_512 cache_95744_512
    95232 95744 96256
    checked_95232_512 rfl checked_95744_512
theorem checked_94208_2048 : validate cache_94208_2048 94208 =
    some 96256 := by
  exact validate_branch 1024 cache_94208_1024 cache_95232_1024
    94208 95232 96256
    checked_94208_1024 rfl checked_95232_1024
theorem checked_96256_256 : validate cache_96256_256 96256 =
    some 96512 := by
  decide +kernel
theorem checked_96512_256 : validate cache_96512_256 96512 =
    some 96768 := by
  decide +kernel
theorem checked_96256_512 : validate cache_96256_512 96256 =
    some 96768 := by
  exact validate_branch 256 cache_96256_256 cache_96512_256
    96256 96512 96768
    checked_96256_256 rfl checked_96512_256
theorem checked_96768_256 : validate cache_96768_256 96768 =
    some 97024 := by
  decide +kernel
theorem checked_97024_256 : validate cache_97024_256 97024 =
    some 97280 := by
  decide +kernel
theorem checked_96768_512 : validate cache_96768_512 96768 =
    some 97280 := by
  exact validate_branch 256 cache_96768_256 cache_97024_256
    96768 97024 97280
    checked_96768_256 rfl checked_97024_256
theorem checked_96256_1024 : validate cache_96256_1024 96256 =
    some 97280 := by
  exact validate_branch 512 cache_96256_512 cache_96768_512
    96256 96768 97280
    checked_96256_512 rfl checked_96768_512
theorem checked_97280_256 : validate cache_97280_256 97280 =
    some 97536 := by
  decide +kernel
theorem checked_97536_256 : validate cache_97536_256 97536 =
    some 97792 := by
  decide +kernel
theorem checked_97280_512 : validate cache_97280_512 97280 =
    some 97792 := by
  exact validate_branch 256 cache_97280_256 cache_97536_256
    97280 97536 97792
    checked_97280_256 rfl checked_97536_256
theorem checked_97792_256 : validate cache_97792_256 97792 =
    some 98048 := by
  decide +kernel
theorem checked_98048_256 : validate cache_98048_256 98048 =
    some 98304 := by
  decide +kernel
theorem checked_97792_512 : validate cache_97792_512 97792 =
    some 98304 := by
  exact validate_branch 256 cache_97792_256 cache_98048_256
    97792 98048 98304
    checked_97792_256 rfl checked_98048_256
theorem checked_97280_1024 : validate cache_97280_1024 97280 =
    some 98304 := by
  exact validate_branch 512 cache_97280_512 cache_97792_512
    97280 97792 98304
    checked_97280_512 rfl checked_97792_512
theorem checked_96256_2048 : validate cache_96256_2048 96256 =
    some 98304 := by
  exact validate_branch 1024 cache_96256_1024 cache_97280_1024
    96256 97280 98304
    checked_96256_1024 rfl checked_97280_1024
theorem checked_94208_4096 : validate cache_94208_4096 94208 =
    some 98304 := by
  exact validate_branch 2048 cache_94208_2048 cache_96256_2048
    94208 96256 98304
    checked_94208_2048 rfl checked_96256_2048
theorem checked_90112_8192 : validate cache_90112_8192 90112 =
    some 98304 := by
  exact validate_branch 4096 cache_90112_4096 cache_94208_4096
    90112 94208 98304
    checked_90112_4096 rfl checked_94208_4096
theorem checked_81920_16384 : validate cache_81920_16384 81920 =
    some 98304 := by
  exact validate_branch 8192 cache_81920_8192 cache_90112_8192
    81920 90112 98304
    checked_81920_8192 rfl checked_90112_8192
theorem checked_65536_32768 : validate cache_65536_32768 65536 =
    some 98304 := by
  exact validate_branch 16384 cache_65536_16384 cache_81920_16384
    65536 81920 98304
    checked_65536_16384 rfl checked_81920_16384
theorem checked_98304_256 : validate cache_98304_256 98304 =
    some 98560 := by
  decide +kernel
theorem checked_98560_256 : validate cache_98560_256 98560 =
    some 98816 := by
  decide +kernel
theorem checked_98304_512 : validate cache_98304_512 98304 =
    some 98816 := by
  exact validate_branch 256 cache_98304_256 cache_98560_256
    98304 98560 98816
    checked_98304_256 rfl checked_98560_256
theorem checked_98816_256 : validate cache_98816_256 98816 =
    some 99072 := by
  decide +kernel
theorem checked_99072_256 : validate cache_99072_256 99072 =
    some 99328 := by
  decide +kernel
theorem checked_98816_512 : validate cache_98816_512 98816 =
    some 99328 := by
  exact validate_branch 256 cache_98816_256 cache_99072_256
    98816 99072 99328
    checked_98816_256 rfl checked_99072_256
theorem checked_98304_1024 : validate cache_98304_1024 98304 =
    some 99328 := by
  exact validate_branch 512 cache_98304_512 cache_98816_512
    98304 98816 99328
    checked_98304_512 rfl checked_98816_512
theorem checked_99328_256 : validate cache_99328_256 99328 =
    some 99584 := by
  decide +kernel
theorem checked_99584_256 : validate cache_99584_256 99584 =
    some 99840 := by
  decide +kernel
theorem checked_99328_512 : validate cache_99328_512 99328 =
    some 99840 := by
  exact validate_branch 256 cache_99328_256 cache_99584_256
    99328 99584 99840
    checked_99328_256 rfl checked_99584_256
theorem checked_99840_256 : validate cache_99840_256 99840 =
    some 100096 := by
  decide +kernel
theorem checked_100096_256 : validate cache_100096_256 100096 =
    some 100352 := by
  decide +kernel
theorem checked_99840_512 : validate cache_99840_512 99840 =
    some 100352 := by
  exact validate_branch 256 cache_99840_256 cache_100096_256
    99840 100096 100352
    checked_99840_256 rfl checked_100096_256
theorem checked_99328_1024 : validate cache_99328_1024 99328 =
    some 100352 := by
  exact validate_branch 512 cache_99328_512 cache_99840_512
    99328 99840 100352
    checked_99328_512 rfl checked_99840_512
theorem checked_98304_2048 : validate cache_98304_2048 98304 =
    some 100352 := by
  exact validate_branch 1024 cache_98304_1024 cache_99328_1024
    98304 99328 100352
    checked_98304_1024 rfl checked_99328_1024
theorem checked_100352_256 : validate cache_100352_256 100352 =
    some 100608 := by
  decide +kernel
theorem checked_100608_256 : validate cache_100608_256 100608 =
    some 100864 := by
  decide +kernel
theorem checked_100352_512 : validate cache_100352_512 100352 =
    some 100864 := by
  exact validate_branch 256 cache_100352_256 cache_100608_256
    100352 100608 100864
    checked_100352_256 rfl checked_100608_256
theorem checked_100864_256 : validate cache_100864_256 100864 =
    some 101120 := by
  decide +kernel
theorem checked_101120_256 : validate cache_101120_256 101120 =
    some 101376 := by
  decide +kernel
theorem checked_100864_512 : validate cache_100864_512 100864 =
    some 101376 := by
  exact validate_branch 256 cache_100864_256 cache_101120_256
    100864 101120 101376
    checked_100864_256 rfl checked_101120_256
theorem checked_100352_1024 : validate cache_100352_1024 100352 =
    some 101376 := by
  exact validate_branch 512 cache_100352_512 cache_100864_512
    100352 100864 101376
    checked_100352_512 rfl checked_100864_512
theorem checked_101376_256 : validate cache_101376_256 101376 =
    some 101632 := by
  decide +kernel
theorem checked_101632_256 : validate cache_101632_256 101632 =
    some 101888 := by
  decide +kernel
theorem checked_101376_512 : validate cache_101376_512 101376 =
    some 101888 := by
  exact validate_branch 256 cache_101376_256 cache_101632_256
    101376 101632 101888
    checked_101376_256 rfl checked_101632_256
theorem checked_101888_256 : validate cache_101888_256 101888 =
    some 102144 := by
  decide +kernel
theorem checked_102144_256 : validate cache_102144_256 102144 =
    some 102400 := by
  decide +kernel
theorem checked_101888_512 : validate cache_101888_512 101888 =
    some 102400 := by
  exact validate_branch 256 cache_101888_256 cache_102144_256
    101888 102144 102400
    checked_101888_256 rfl checked_102144_256
theorem checked_101376_1024 : validate cache_101376_1024 101376 =
    some 102400 := by
  exact validate_branch 512 cache_101376_512 cache_101888_512
    101376 101888 102400
    checked_101376_512 rfl checked_101888_512
theorem checked_100352_2048 : validate cache_100352_2048 100352 =
    some 102400 := by
  exact validate_branch 1024 cache_100352_1024 cache_101376_1024
    100352 101376 102400
    checked_100352_1024 rfl checked_101376_1024
theorem checked_98304_4096 : validate cache_98304_4096 98304 =
    some 102400 := by
  exact validate_branch 2048 cache_98304_2048 cache_100352_2048
    98304 100352 102400
    checked_98304_2048 rfl checked_100352_2048
theorem checked_102400_256 : validate cache_102400_256 102400 =
    some 102656 := by
  decide +kernel
theorem checked_102656_256 : validate cache_102656_256 102656 =
    some 102912 := by
  decide +kernel
theorem checked_102400_512 : validate cache_102400_512 102400 =
    some 102912 := by
  exact validate_branch 256 cache_102400_256 cache_102656_256
    102400 102656 102912
    checked_102400_256 rfl checked_102656_256
theorem checked_102912_256 : validate cache_102912_256 102912 =
    some 103168 := by
  decide +kernel
theorem checked_103168_256 : validate cache_103168_256 103168 =
    some 103424 := by
  decide +kernel
theorem checked_102912_512 : validate cache_102912_512 102912 =
    some 103424 := by
  exact validate_branch 256 cache_102912_256 cache_103168_256
    102912 103168 103424
    checked_102912_256 rfl checked_103168_256
theorem checked_102400_1024 : validate cache_102400_1024 102400 =
    some 103424 := by
  exact validate_branch 512 cache_102400_512 cache_102912_512
    102400 102912 103424
    checked_102400_512 rfl checked_102912_512
theorem checked_103424_256 : validate cache_103424_256 103424 =
    some 103680 := by
  decide +kernel
theorem checked_103680_256 : validate cache_103680_256 103680 =
    some 103936 := by
  decide +kernel
theorem checked_103424_512 : validate cache_103424_512 103424 =
    some 103936 := by
  exact validate_branch 256 cache_103424_256 cache_103680_256
    103424 103680 103936
    checked_103424_256 rfl checked_103680_256
theorem checked_103936_256 : validate cache_103936_256 103936 =
    some 104192 := by
  decide +kernel
theorem checked_104192_256 : validate cache_104192_256 104192 =
    some 104448 := by
  decide +kernel
theorem checked_103936_512 : validate cache_103936_512 103936 =
    some 104448 := by
  exact validate_branch 256 cache_103936_256 cache_104192_256
    103936 104192 104448
    checked_103936_256 rfl checked_104192_256
theorem checked_103424_1024 : validate cache_103424_1024 103424 =
    some 104448 := by
  exact validate_branch 512 cache_103424_512 cache_103936_512
    103424 103936 104448
    checked_103424_512 rfl checked_103936_512
theorem checked_102400_2048 : validate cache_102400_2048 102400 =
    some 104448 := by
  exact validate_branch 1024 cache_102400_1024 cache_103424_1024
    102400 103424 104448
    checked_102400_1024 rfl checked_103424_1024
theorem checked_104448_256 : validate cache_104448_256 104448 =
    some 104704 := by
  decide +kernel
theorem checked_104704_256 : validate cache_104704_256 104704 =
    some 104960 := by
  decide +kernel
theorem checked_104448_512 : validate cache_104448_512 104448 =
    some 104960 := by
  exact validate_branch 256 cache_104448_256 cache_104704_256
    104448 104704 104960
    checked_104448_256 rfl checked_104704_256
theorem checked_104960_256 : validate cache_104960_256 104960 =
    some 105216 := by
  decide +kernel
theorem checked_105216_256 : validate cache_105216_256 105216 =
    some 105472 := by
  decide +kernel
theorem checked_104960_512 : validate cache_104960_512 104960 =
    some 105472 := by
  exact validate_branch 256 cache_104960_256 cache_105216_256
    104960 105216 105472
    checked_104960_256 rfl checked_105216_256
theorem checked_104448_1024 : validate cache_104448_1024 104448 =
    some 105472 := by
  exact validate_branch 512 cache_104448_512 cache_104960_512
    104448 104960 105472
    checked_104448_512 rfl checked_104960_512
theorem checked_105472_256 : validate cache_105472_256 105472 =
    some 105728 := by
  decide +kernel
theorem checked_105728_256 : validate cache_105728_256 105728 =
    some 105984 := by
  decide +kernel
theorem checked_105472_512 : validate cache_105472_512 105472 =
    some 105984 := by
  exact validate_branch 256 cache_105472_256 cache_105728_256
    105472 105728 105984
    checked_105472_256 rfl checked_105728_256
theorem checked_105984_256 : validate cache_105984_256 105984 =
    some 106240 := by
  decide +kernel
theorem checked_106240_256 : validate cache_106240_256 106240 =
    some 106496 := by
  decide +kernel
theorem checked_105984_512 : validate cache_105984_512 105984 =
    some 106496 := by
  exact validate_branch 256 cache_105984_256 cache_106240_256
    105984 106240 106496
    checked_105984_256 rfl checked_106240_256
theorem checked_105472_1024 : validate cache_105472_1024 105472 =
    some 106496 := by
  exact validate_branch 512 cache_105472_512 cache_105984_512
    105472 105984 106496
    checked_105472_512 rfl checked_105984_512
theorem checked_104448_2048 : validate cache_104448_2048 104448 =
    some 106496 := by
  exact validate_branch 1024 cache_104448_1024 cache_105472_1024
    104448 105472 106496
    checked_104448_1024 rfl checked_105472_1024
theorem checked_102400_4096 : validate cache_102400_4096 102400 =
    some 106496 := by
  exact validate_branch 2048 cache_102400_2048 cache_104448_2048
    102400 104448 106496
    checked_102400_2048 rfl checked_104448_2048
theorem checked_98304_8192 : validate cache_98304_8192 98304 =
    some 106496 := by
  exact validate_branch 4096 cache_98304_4096 cache_102400_4096
    98304 102400 106496
    checked_98304_4096 rfl checked_102400_4096
theorem checked_106496_256 : validate cache_106496_256 106496 =
    some 106752 := by
  decide +kernel
theorem checked_106752_256 : validate cache_106752_256 106752 =
    some 107008 := by
  decide +kernel
theorem checked_106496_512 : validate cache_106496_512 106496 =
    some 107008 := by
  exact validate_branch 256 cache_106496_256 cache_106752_256
    106496 106752 107008
    checked_106496_256 rfl checked_106752_256
theorem checked_107008_256 : validate cache_107008_256 107008 =
    some 107264 := by
  decide +kernel
theorem checked_107264_256 : validate cache_107264_256 107264 =
    some 107520 := by
  decide +kernel
theorem checked_107008_512 : validate cache_107008_512 107008 =
    some 107520 := by
  exact validate_branch 256 cache_107008_256 cache_107264_256
    107008 107264 107520
    checked_107008_256 rfl checked_107264_256
theorem checked_106496_1024 : validate cache_106496_1024 106496 =
    some 107520 := by
  exact validate_branch 512 cache_106496_512 cache_107008_512
    106496 107008 107520
    checked_106496_512 rfl checked_107008_512
theorem checked_107520_256 : validate cache_107520_256 107520 =
    some 107776 := by
  decide +kernel
theorem checked_107776_256 : validate cache_107776_256 107776 =
    some 108032 := by
  decide +kernel
theorem checked_107520_512 : validate cache_107520_512 107520 =
    some 108032 := by
  exact validate_branch 256 cache_107520_256 cache_107776_256
    107520 107776 108032
    checked_107520_256 rfl checked_107776_256
theorem checked_108032_256 : validate cache_108032_256 108032 =
    some 108288 := by
  decide +kernel
theorem checked_108288_256 : validate cache_108288_256 108288 =
    some 108544 := by
  decide +kernel
theorem checked_108032_512 : validate cache_108032_512 108032 =
    some 108544 := by
  exact validate_branch 256 cache_108032_256 cache_108288_256
    108032 108288 108544
    checked_108032_256 rfl checked_108288_256
theorem checked_107520_1024 : validate cache_107520_1024 107520 =
    some 108544 := by
  exact validate_branch 512 cache_107520_512 cache_108032_512
    107520 108032 108544
    checked_107520_512 rfl checked_108032_512
theorem checked_106496_2048 : validate cache_106496_2048 106496 =
    some 108544 := by
  exact validate_branch 1024 cache_106496_1024 cache_107520_1024
    106496 107520 108544
    checked_106496_1024 rfl checked_107520_1024
theorem checked_108544_256 : validate cache_108544_256 108544 =
    some 108800 := by
  decide +kernel
theorem checked_108800_256 : validate cache_108800_256 108800 =
    some 109056 := by
  decide +kernel
theorem checked_108544_512 : validate cache_108544_512 108544 =
    some 109056 := by
  exact validate_branch 256 cache_108544_256 cache_108800_256
    108544 108800 109056
    checked_108544_256 rfl checked_108800_256
theorem checked_109056_256 : validate cache_109056_256 109056 =
    some 109312 := by
  decide +kernel
theorem checked_109312_256 : validate cache_109312_256 109312 =
    some 109568 := by
  decide +kernel
theorem checked_109056_512 : validate cache_109056_512 109056 =
    some 109568 := by
  exact validate_branch 256 cache_109056_256 cache_109312_256
    109056 109312 109568
    checked_109056_256 rfl checked_109312_256
theorem checked_108544_1024 : validate cache_108544_1024 108544 =
    some 109568 := by
  exact validate_branch 512 cache_108544_512 cache_109056_512
    108544 109056 109568
    checked_108544_512 rfl checked_109056_512
theorem checked_109568_256 : validate cache_109568_256 109568 =
    some 109824 := by
  decide +kernel
theorem checked_109824_256 : validate cache_109824_256 109824 =
    some 110080 := by
  decide +kernel
theorem checked_109568_512 : validate cache_109568_512 109568 =
    some 110080 := by
  exact validate_branch 256 cache_109568_256 cache_109824_256
    109568 109824 110080
    checked_109568_256 rfl checked_109824_256
theorem checked_110080_256 : validate cache_110080_256 110080 =
    some 110336 := by
  decide +kernel
theorem checked_110336_256 : validate cache_110336_256 110336 =
    some 110592 := by
  decide +kernel
theorem checked_110080_512 : validate cache_110080_512 110080 =
    some 110592 := by
  exact validate_branch 256 cache_110080_256 cache_110336_256
    110080 110336 110592
    checked_110080_256 rfl checked_110336_256
theorem checked_109568_1024 : validate cache_109568_1024 109568 =
    some 110592 := by
  exact validate_branch 512 cache_109568_512 cache_110080_512
    109568 110080 110592
    checked_109568_512 rfl checked_110080_512
theorem checked_108544_2048 : validate cache_108544_2048 108544 =
    some 110592 := by
  exact validate_branch 1024 cache_108544_1024 cache_109568_1024
    108544 109568 110592
    checked_108544_1024 rfl checked_109568_1024
theorem checked_106496_4096 : validate cache_106496_4096 106496 =
    some 110592 := by
  exact validate_branch 2048 cache_106496_2048 cache_108544_2048
    106496 108544 110592
    checked_106496_2048 rfl checked_108544_2048
theorem checked_110592_256 : validate cache_110592_256 110592 =
    some 110848 := by
  decide +kernel
theorem checked_110848_256 : validate cache_110848_256 110848 =
    some 111104 := by
  decide +kernel
theorem checked_110592_512 : validate cache_110592_512 110592 =
    some 111104 := by
  exact validate_branch 256 cache_110592_256 cache_110848_256
    110592 110848 111104
    checked_110592_256 rfl checked_110848_256
theorem checked_111104_256 : validate cache_111104_256 111104 =
    some 111360 := by
  decide +kernel
theorem checked_111360_256 : validate cache_111360_256 111360 =
    some 111616 := by
  decide +kernel
theorem checked_111104_512 : validate cache_111104_512 111104 =
    some 111616 := by
  exact validate_branch 256 cache_111104_256 cache_111360_256
    111104 111360 111616
    checked_111104_256 rfl checked_111360_256
theorem checked_110592_1024 : validate cache_110592_1024 110592 =
    some 111616 := by
  exact validate_branch 512 cache_110592_512 cache_111104_512
    110592 111104 111616
    checked_110592_512 rfl checked_111104_512
theorem checked_111616_256 : validate cache_111616_256 111616 =
    some 111872 := by
  decide +kernel
theorem checked_111872_256 : validate cache_111872_256 111872 =
    some 112128 := by
  decide +kernel
theorem checked_111616_512 : validate cache_111616_512 111616 =
    some 112128 := by
  exact validate_branch 256 cache_111616_256 cache_111872_256
    111616 111872 112128
    checked_111616_256 rfl checked_111872_256
theorem checked_112128_256 : validate cache_112128_256 112128 =
    some 112384 := by
  decide +kernel
theorem checked_112384_256 : validate cache_112384_256 112384 =
    some 112640 := by
  decide +kernel
theorem checked_112128_512 : validate cache_112128_512 112128 =
    some 112640 := by
  exact validate_branch 256 cache_112128_256 cache_112384_256
    112128 112384 112640
    checked_112128_256 rfl checked_112384_256
theorem checked_111616_1024 : validate cache_111616_1024 111616 =
    some 112640 := by
  exact validate_branch 512 cache_111616_512 cache_112128_512
    111616 112128 112640
    checked_111616_512 rfl checked_112128_512
theorem checked_110592_2048 : validate cache_110592_2048 110592 =
    some 112640 := by
  exact validate_branch 1024 cache_110592_1024 cache_111616_1024
    110592 111616 112640
    checked_110592_1024 rfl checked_111616_1024
theorem checked_112640_256 : validate cache_112640_256 112640 =
    some 112896 := by
  decide +kernel
theorem checked_112896_256 : validate cache_112896_256 112896 =
    some 113152 := by
  decide +kernel
theorem checked_112640_512 : validate cache_112640_512 112640 =
    some 113152 := by
  exact validate_branch 256 cache_112640_256 cache_112896_256
    112640 112896 113152
    checked_112640_256 rfl checked_112896_256
theorem checked_113152_256 : validate cache_113152_256 113152 =
    some 113408 := by
  decide +kernel
theorem checked_113408_256 : validate cache_113408_256 113408 =
    some 113664 := by
  decide +kernel
theorem checked_113152_512 : validate cache_113152_512 113152 =
    some 113664 := by
  exact validate_branch 256 cache_113152_256 cache_113408_256
    113152 113408 113664
    checked_113152_256 rfl checked_113408_256
theorem checked_112640_1024 : validate cache_112640_1024 112640 =
    some 113664 := by
  exact validate_branch 512 cache_112640_512 cache_113152_512
    112640 113152 113664
    checked_112640_512 rfl checked_113152_512
theorem checked_113664_256 : validate cache_113664_256 113664 =
    some 113920 := by
  decide +kernel
theorem checked_113920_256 : validate cache_113920_256 113920 =
    some 114176 := by
  decide +kernel
theorem checked_113664_512 : validate cache_113664_512 113664 =
    some 114176 := by
  exact validate_branch 256 cache_113664_256 cache_113920_256
    113664 113920 114176
    checked_113664_256 rfl checked_113920_256
theorem checked_114176_256 : validate cache_114176_256 114176 =
    some 114432 := by
  decide +kernel
theorem checked_114432_256 : validate cache_114432_256 114432 =
    some 114688 := by
  decide +kernel
theorem checked_114176_512 : validate cache_114176_512 114176 =
    some 114688 := by
  exact validate_branch 256 cache_114176_256 cache_114432_256
    114176 114432 114688
    checked_114176_256 rfl checked_114432_256
theorem checked_113664_1024 : validate cache_113664_1024 113664 =
    some 114688 := by
  exact validate_branch 512 cache_113664_512 cache_114176_512
    113664 114176 114688
    checked_113664_512 rfl checked_114176_512
theorem checked_112640_2048 : validate cache_112640_2048 112640 =
    some 114688 := by
  exact validate_branch 1024 cache_112640_1024 cache_113664_1024
    112640 113664 114688
    checked_112640_1024 rfl checked_113664_1024
theorem checked_110592_4096 : validate cache_110592_4096 110592 =
    some 114688 := by
  exact validate_branch 2048 cache_110592_2048 cache_112640_2048
    110592 112640 114688
    checked_110592_2048 rfl checked_112640_2048
theorem checked_106496_8192 : validate cache_106496_8192 106496 =
    some 114688 := by
  exact validate_branch 4096 cache_106496_4096 cache_110592_4096
    106496 110592 114688
    checked_106496_4096 rfl checked_110592_4096
theorem checked_98304_16384 : validate cache_98304_16384 98304 =
    some 114688 := by
  exact validate_branch 8192 cache_98304_8192 cache_106496_8192
    98304 106496 114688
    checked_98304_8192 rfl checked_106496_8192
theorem checked_114688_256 : validate cache_114688_256 114688 =
    some 114944 := by
  decide +kernel
theorem checked_114944_256 : validate cache_114944_256 114944 =
    some 115200 := by
  decide +kernel
theorem checked_114688_512 : validate cache_114688_512 114688 =
    some 115200 := by
  exact validate_branch 256 cache_114688_256 cache_114944_256
    114688 114944 115200
    checked_114688_256 rfl checked_114944_256
theorem checked_115200_256 : validate cache_115200_256 115200 =
    some 115456 := by
  decide +kernel
theorem checked_115456_256 : validate cache_115456_256 115456 =
    some 115712 := by
  decide +kernel
theorem checked_115200_512 : validate cache_115200_512 115200 =
    some 115712 := by
  exact validate_branch 256 cache_115200_256 cache_115456_256
    115200 115456 115712
    checked_115200_256 rfl checked_115456_256
theorem checked_114688_1024 : validate cache_114688_1024 114688 =
    some 115712 := by
  exact validate_branch 512 cache_114688_512 cache_115200_512
    114688 115200 115712
    checked_114688_512 rfl checked_115200_512
theorem checked_115712_256 : validate cache_115712_256 115712 =
    some 115968 := by
  decide +kernel
theorem checked_115968_256 : validate cache_115968_256 115968 =
    some 116224 := by
  decide +kernel
theorem checked_115712_512 : validate cache_115712_512 115712 =
    some 116224 := by
  exact validate_branch 256 cache_115712_256 cache_115968_256
    115712 115968 116224
    checked_115712_256 rfl checked_115968_256
theorem checked_116224_256 : validate cache_116224_256 116224 =
    some 116480 := by
  decide +kernel
theorem checked_116480_256 : validate cache_116480_256 116480 =
    some 116736 := by
  decide +kernel
theorem checked_116224_512 : validate cache_116224_512 116224 =
    some 116736 := by
  exact validate_branch 256 cache_116224_256 cache_116480_256
    116224 116480 116736
    checked_116224_256 rfl checked_116480_256
theorem checked_115712_1024 : validate cache_115712_1024 115712 =
    some 116736 := by
  exact validate_branch 512 cache_115712_512 cache_116224_512
    115712 116224 116736
    checked_115712_512 rfl checked_116224_512
theorem checked_114688_2048 : validate cache_114688_2048 114688 =
    some 116736 := by
  exact validate_branch 1024 cache_114688_1024 cache_115712_1024
    114688 115712 116736
    checked_114688_1024 rfl checked_115712_1024
theorem checked_116736_256 : validate cache_116736_256 116736 =
    some 116992 := by
  decide +kernel
theorem checked_116992_256 : validate cache_116992_256 116992 =
    some 117248 := by
  decide +kernel
theorem checked_116736_512 : validate cache_116736_512 116736 =
    some 117248 := by
  exact validate_branch 256 cache_116736_256 cache_116992_256
    116736 116992 117248
    checked_116736_256 rfl checked_116992_256
theorem checked_117248_256 : validate cache_117248_256 117248 =
    some 117504 := by
  decide +kernel
theorem checked_117504_256 : validate cache_117504_256 117504 =
    some 117760 := by
  decide +kernel
theorem checked_117248_512 : validate cache_117248_512 117248 =
    some 117760 := by
  exact validate_branch 256 cache_117248_256 cache_117504_256
    117248 117504 117760
    checked_117248_256 rfl checked_117504_256
theorem checked_116736_1024 : validate cache_116736_1024 116736 =
    some 117760 := by
  exact validate_branch 512 cache_116736_512 cache_117248_512
    116736 117248 117760
    checked_116736_512 rfl checked_117248_512
theorem checked_117760_256 : validate cache_117760_256 117760 =
    some 118016 := by
  decide +kernel
theorem checked_118016_256 : validate cache_118016_256 118016 =
    some 118272 := by
  decide +kernel
theorem checked_117760_512 : validate cache_117760_512 117760 =
    some 118272 := by
  exact validate_branch 256 cache_117760_256 cache_118016_256
    117760 118016 118272
    checked_117760_256 rfl checked_118016_256
theorem checked_118272_256 : validate cache_118272_256 118272 =
    some 118528 := by
  decide +kernel
theorem checked_118528_256 : validate cache_118528_256 118528 =
    some 118784 := by
  decide +kernel
theorem checked_118272_512 : validate cache_118272_512 118272 =
    some 118784 := by
  exact validate_branch 256 cache_118272_256 cache_118528_256
    118272 118528 118784
    checked_118272_256 rfl checked_118528_256
theorem checked_117760_1024 : validate cache_117760_1024 117760 =
    some 118784 := by
  exact validate_branch 512 cache_117760_512 cache_118272_512
    117760 118272 118784
    checked_117760_512 rfl checked_118272_512
theorem checked_116736_2048 : validate cache_116736_2048 116736 =
    some 118784 := by
  exact validate_branch 1024 cache_116736_1024 cache_117760_1024
    116736 117760 118784
    checked_116736_1024 rfl checked_117760_1024
theorem checked_114688_4096 : validate cache_114688_4096 114688 =
    some 118784 := by
  exact validate_branch 2048 cache_114688_2048 cache_116736_2048
    114688 116736 118784
    checked_114688_2048 rfl checked_116736_2048
theorem checked_118784_256 : validate cache_118784_256 118784 =
    some 119040 := by
  decide +kernel
theorem checked_119040_256 : validate cache_119040_256 119040 =
    some 119296 := by
  decide +kernel
theorem checked_118784_512 : validate cache_118784_512 118784 =
    some 119296 := by
  exact validate_branch 256 cache_118784_256 cache_119040_256
    118784 119040 119296
    checked_118784_256 rfl checked_119040_256
theorem checked_119296_256 : validate cache_119296_256 119296 =
    some 119552 := by
  decide +kernel
theorem checked_119552_256 : validate cache_119552_256 119552 =
    some 119808 := by
  decide +kernel
theorem checked_119296_512 : validate cache_119296_512 119296 =
    some 119808 := by
  exact validate_branch 256 cache_119296_256 cache_119552_256
    119296 119552 119808
    checked_119296_256 rfl checked_119552_256
theorem checked_118784_1024 : validate cache_118784_1024 118784 =
    some 119808 := by
  exact validate_branch 512 cache_118784_512 cache_119296_512
    118784 119296 119808
    checked_118784_512 rfl checked_119296_512
theorem checked_119808_256 : validate cache_119808_256 119808 =
    some 120064 := by
  decide +kernel
theorem checked_120064_256 : validate cache_120064_256 120064 =
    some 120320 := by
  decide +kernel
theorem checked_119808_512 : validate cache_119808_512 119808 =
    some 120320 := by
  exact validate_branch 256 cache_119808_256 cache_120064_256
    119808 120064 120320
    checked_119808_256 rfl checked_120064_256
theorem checked_120320_256 : validate cache_120320_256 120320 =
    some 120576 := by
  decide +kernel
theorem checked_120576_256 : validate cache_120576_256 120576 =
    some 120832 := by
  decide +kernel
theorem checked_120320_512 : validate cache_120320_512 120320 =
    some 120832 := by
  exact validate_branch 256 cache_120320_256 cache_120576_256
    120320 120576 120832
    checked_120320_256 rfl checked_120576_256
theorem checked_119808_1024 : validate cache_119808_1024 119808 =
    some 120832 := by
  exact validate_branch 512 cache_119808_512 cache_120320_512
    119808 120320 120832
    checked_119808_512 rfl checked_120320_512
theorem checked_118784_2048 : validate cache_118784_2048 118784 =
    some 120832 := by
  exact validate_branch 1024 cache_118784_1024 cache_119808_1024
    118784 119808 120832
    checked_118784_1024 rfl checked_119808_1024
theorem checked_120832_256 : validate cache_120832_256 120832 =
    some 121088 := by
  decide +kernel
theorem checked_121088_256 : validate cache_121088_256 121088 =
    some 121344 := by
  decide +kernel
theorem checked_120832_512 : validate cache_120832_512 120832 =
    some 121344 := by
  exact validate_branch 256 cache_120832_256 cache_121088_256
    120832 121088 121344
    checked_120832_256 rfl checked_121088_256
theorem checked_121344_256 : validate cache_121344_256 121344 =
    some 121600 := by
  decide +kernel
theorem checked_121600_256 : validate cache_121600_256 121600 =
    some 121856 := by
  decide +kernel
theorem checked_121344_512 : validate cache_121344_512 121344 =
    some 121856 := by
  exact validate_branch 256 cache_121344_256 cache_121600_256
    121344 121600 121856
    checked_121344_256 rfl checked_121600_256
theorem checked_120832_1024 : validate cache_120832_1024 120832 =
    some 121856 := by
  exact validate_branch 512 cache_120832_512 cache_121344_512
    120832 121344 121856
    checked_120832_512 rfl checked_121344_512
theorem checked_121856_256 : validate cache_121856_256 121856 =
    some 122112 := by
  decide +kernel
theorem checked_122112_256 : validate cache_122112_256 122112 =
    some 122368 := by
  decide +kernel
theorem checked_121856_512 : validate cache_121856_512 121856 =
    some 122368 := by
  exact validate_branch 256 cache_121856_256 cache_122112_256
    121856 122112 122368
    checked_121856_256 rfl checked_122112_256
theorem checked_122368_256 : validate cache_122368_256 122368 =
    some 122624 := by
  decide +kernel
theorem checked_122624_256 : validate cache_122624_256 122624 =
    some 122880 := by
  decide +kernel
theorem checked_122368_512 : validate cache_122368_512 122368 =
    some 122880 := by
  exact validate_branch 256 cache_122368_256 cache_122624_256
    122368 122624 122880
    checked_122368_256 rfl checked_122624_256
theorem checked_121856_1024 : validate cache_121856_1024 121856 =
    some 122880 := by
  exact validate_branch 512 cache_121856_512 cache_122368_512
    121856 122368 122880
    checked_121856_512 rfl checked_122368_512
theorem checked_120832_2048 : validate cache_120832_2048 120832 =
    some 122880 := by
  exact validate_branch 1024 cache_120832_1024 cache_121856_1024
    120832 121856 122880
    checked_120832_1024 rfl checked_121856_1024
theorem checked_118784_4096 : validate cache_118784_4096 118784 =
    some 122880 := by
  exact validate_branch 2048 cache_118784_2048 cache_120832_2048
    118784 120832 122880
    checked_118784_2048 rfl checked_120832_2048
theorem checked_114688_8192 : validate cache_114688_8192 114688 =
    some 122880 := by
  exact validate_branch 4096 cache_114688_4096 cache_118784_4096
    114688 118784 122880
    checked_114688_4096 rfl checked_118784_4096
theorem checked_122880_256 : validate cache_122880_256 122880 =
    some 123136 := by
  decide +kernel
theorem checked_123136_256 : validate cache_123136_256 123136 =
    some 123392 := by
  decide +kernel
theorem checked_122880_512 : validate cache_122880_512 122880 =
    some 123392 := by
  exact validate_branch 256 cache_122880_256 cache_123136_256
    122880 123136 123392
    checked_122880_256 rfl checked_123136_256
theorem checked_123392_256 : validate cache_123392_256 123392 =
    some 123648 := by
  decide +kernel
theorem checked_123648_256 : validate cache_123648_256 123648 =
    some 123904 := by
  decide +kernel
theorem checked_123392_512 : validate cache_123392_512 123392 =
    some 123904 := by
  exact validate_branch 256 cache_123392_256 cache_123648_256
    123392 123648 123904
    checked_123392_256 rfl checked_123648_256
theorem checked_122880_1024 : validate cache_122880_1024 122880 =
    some 123904 := by
  exact validate_branch 512 cache_122880_512 cache_123392_512
    122880 123392 123904
    checked_122880_512 rfl checked_123392_512
theorem checked_123904_256 : validate cache_123904_256 123904 =
    some 124160 := by
  decide +kernel
theorem checked_124160_256 : validate cache_124160_256 124160 =
    some 124416 := by
  decide +kernel
theorem checked_123904_512 : validate cache_123904_512 123904 =
    some 124416 := by
  exact validate_branch 256 cache_123904_256 cache_124160_256
    123904 124160 124416
    checked_123904_256 rfl checked_124160_256
theorem checked_124416_256 : validate cache_124416_256 124416 =
    some 124672 := by
  decide +kernel
theorem checked_124672_256 : validate cache_124672_256 124672 =
    some 124928 := by
  decide +kernel
theorem checked_124416_512 : validate cache_124416_512 124416 =
    some 124928 := by
  exact validate_branch 256 cache_124416_256 cache_124672_256
    124416 124672 124928
    checked_124416_256 rfl checked_124672_256
theorem checked_123904_1024 : validate cache_123904_1024 123904 =
    some 124928 := by
  exact validate_branch 512 cache_123904_512 cache_124416_512
    123904 124416 124928
    checked_123904_512 rfl checked_124416_512
theorem checked_122880_2048 : validate cache_122880_2048 122880 =
    some 124928 := by
  exact validate_branch 1024 cache_122880_1024 cache_123904_1024
    122880 123904 124928
    checked_122880_1024 rfl checked_123904_1024
theorem checked_124928_256 : validate cache_124928_256 124928 =
    some 125184 := by
  decide +kernel
theorem checked_125184_256 : validate cache_125184_256 125184 =
    some 125440 := by
  decide +kernel
theorem checked_124928_512 : validate cache_124928_512 124928 =
    some 125440 := by
  exact validate_branch 256 cache_124928_256 cache_125184_256
    124928 125184 125440
    checked_124928_256 rfl checked_125184_256
theorem checked_125440_256 : validate cache_125440_256 125440 =
    some 125696 := by
  decide +kernel
theorem checked_125696_256 : validate cache_125696_256 125696 =
    some 125952 := by
  decide +kernel
theorem checked_125440_512 : validate cache_125440_512 125440 =
    some 125952 := by
  exact validate_branch 256 cache_125440_256 cache_125696_256
    125440 125696 125952
    checked_125440_256 rfl checked_125696_256
theorem checked_124928_1024 : validate cache_124928_1024 124928 =
    some 125952 := by
  exact validate_branch 512 cache_124928_512 cache_125440_512
    124928 125440 125952
    checked_124928_512 rfl checked_125440_512
theorem checked_125952_256 : validate cache_125952_256 125952 =
    some 126208 := by
  decide +kernel
theorem checked_126208_256 : validate cache_126208_256 126208 =
    some 126464 := by
  decide +kernel
theorem checked_125952_512 : validate cache_125952_512 125952 =
    some 126464 := by
  exact validate_branch 256 cache_125952_256 cache_126208_256
    125952 126208 126464
    checked_125952_256 rfl checked_126208_256
theorem checked_126464_256 : validate cache_126464_256 126464 =
    some 126720 := by
  decide +kernel
theorem checked_126720_256 : validate cache_126720_256 126720 =
    some 126976 := by
  decide +kernel
theorem checked_126464_512 : validate cache_126464_512 126464 =
    some 126976 := by
  exact validate_branch 256 cache_126464_256 cache_126720_256
    126464 126720 126976
    checked_126464_256 rfl checked_126720_256
theorem checked_125952_1024 : validate cache_125952_1024 125952 =
    some 126976 := by
  exact validate_branch 512 cache_125952_512 cache_126464_512
    125952 126464 126976
    checked_125952_512 rfl checked_126464_512
theorem checked_124928_2048 : validate cache_124928_2048 124928 =
    some 126976 := by
  exact validate_branch 1024 cache_124928_1024 cache_125952_1024
    124928 125952 126976
    checked_124928_1024 rfl checked_125952_1024
theorem checked_122880_4096 : validate cache_122880_4096 122880 =
    some 126976 := by
  exact validate_branch 2048 cache_122880_2048 cache_124928_2048
    122880 124928 126976
    checked_122880_2048 rfl checked_124928_2048
theorem checked_126976_256 : validate cache_126976_256 126976 =
    some 127232 := by
  decide +kernel
theorem checked_127232_256 : validate cache_127232_256 127232 =
    some 127488 := by
  decide +kernel
theorem checked_126976_512 : validate cache_126976_512 126976 =
    some 127488 := by
  exact validate_branch 256 cache_126976_256 cache_127232_256
    126976 127232 127488
    checked_126976_256 rfl checked_127232_256
theorem checked_127488_256 : validate cache_127488_256 127488 =
    some 127744 := by
  decide +kernel
theorem checked_127744_256 : validate cache_127744_256 127744 =
    some 128000 := by
  decide +kernel
theorem checked_127488_512 : validate cache_127488_512 127488 =
    some 128000 := by
  exact validate_branch 256 cache_127488_256 cache_127744_256
    127488 127744 128000
    checked_127488_256 rfl checked_127744_256
theorem checked_126976_1024 : validate cache_126976_1024 126976 =
    some 128000 := by
  exact validate_branch 512 cache_126976_512 cache_127488_512
    126976 127488 128000
    checked_126976_512 rfl checked_127488_512
theorem checked_128000_256 : validate cache_128000_256 128000 =
    some 128256 := by
  decide +kernel
theorem checked_128256_256 : validate cache_128256_256 128256 =
    some 128512 := by
  decide +kernel
theorem checked_128000_512 : validate cache_128000_512 128000 =
    some 128512 := by
  exact validate_branch 256 cache_128000_256 cache_128256_256
    128000 128256 128512
    checked_128000_256 rfl checked_128256_256
theorem checked_128512_256 : validate cache_128512_256 128512 =
    some 128768 := by
  decide +kernel
theorem checked_128768_256 : validate cache_128768_256 128768 =
    some 129024 := by
  decide +kernel
theorem checked_128512_512 : validate cache_128512_512 128512 =
    some 129024 := by
  exact validate_branch 256 cache_128512_256 cache_128768_256
    128512 128768 129024
    checked_128512_256 rfl checked_128768_256
theorem checked_128000_1024 : validate cache_128000_1024 128000 =
    some 129024 := by
  exact validate_branch 512 cache_128000_512 cache_128512_512
    128000 128512 129024
    checked_128000_512 rfl checked_128512_512
theorem checked_126976_2048 : validate cache_126976_2048 126976 =
    some 129024 := by
  exact validate_branch 1024 cache_126976_1024 cache_128000_1024
    126976 128000 129024
    checked_126976_1024 rfl checked_128000_1024
theorem checked_129024_256 : validate cache_129024_256 129024 =
    some 129280 := by
  decide +kernel
theorem checked_129280_256 : validate cache_129280_256 129280 =
    some 129536 := by
  decide +kernel
theorem checked_129024_512 : validate cache_129024_512 129024 =
    some 129536 := by
  exact validate_branch 256 cache_129024_256 cache_129280_256
    129024 129280 129536
    checked_129024_256 rfl checked_129280_256
theorem checked_129536_256 : validate cache_129536_256 129536 =
    some 129792 := by
  decide +kernel
theorem checked_129792_256 : validate cache_129792_256 129792 =
    some 130048 := by
  decide +kernel
theorem checked_129536_512 : validate cache_129536_512 129536 =
    some 130048 := by
  exact validate_branch 256 cache_129536_256 cache_129792_256
    129536 129792 130048
    checked_129536_256 rfl checked_129792_256
theorem checked_129024_1024 : validate cache_129024_1024 129024 =
    some 130048 := by
  exact validate_branch 512 cache_129024_512 cache_129536_512
    129024 129536 130048
    checked_129024_512 rfl checked_129536_512
theorem checked_130048_256 : validate cache_130048_256 130048 =
    some 130304 := by
  decide +kernel
theorem checked_130304_256 : validate cache_130304_256 130304 =
    some 130560 := by
  decide +kernel
theorem checked_130048_512 : validate cache_130048_512 130048 =
    some 130560 := by
  exact validate_branch 256 cache_130048_256 cache_130304_256
    130048 130304 130560
    checked_130048_256 rfl checked_130304_256
theorem checked_130560_256 : validate cache_130560_256 130560 =
    some 130816 := by
  decide +kernel
theorem checked_130816_256 : validate cache_130816_256 130816 =
    some 131072 := by
  decide +kernel
theorem checked_130560_512 : validate cache_130560_512 130560 =
    some 131072 := by
  exact validate_branch 256 cache_130560_256 cache_130816_256
    130560 130816 131072
    checked_130560_256 rfl checked_130816_256
theorem checked_130048_1024 : validate cache_130048_1024 130048 =
    some 131072 := by
  exact validate_branch 512 cache_130048_512 cache_130560_512
    130048 130560 131072
    checked_130048_512 rfl checked_130560_512
theorem checked_129024_2048 : validate cache_129024_2048 129024 =
    some 131072 := by
  exact validate_branch 1024 cache_129024_1024 cache_130048_1024
    129024 130048 131072
    checked_129024_1024 rfl checked_130048_1024
theorem checked_126976_4096 : validate cache_126976_4096 126976 =
    some 131072 := by
  exact validate_branch 2048 cache_126976_2048 cache_129024_2048
    126976 129024 131072
    checked_126976_2048 rfl checked_129024_2048
theorem checked_122880_8192 : validate cache_122880_8192 122880 =
    some 131072 := by
  exact validate_branch 4096 cache_122880_4096 cache_126976_4096
    122880 126976 131072
    checked_122880_4096 rfl checked_126976_4096
theorem checked_114688_16384 : validate cache_114688_16384 114688 =
    some 131072 := by
  exact validate_branch 8192 cache_114688_8192 cache_122880_8192
    114688 122880 131072
    checked_114688_8192 rfl checked_122880_8192
theorem checked_98304_32768 : validate cache_98304_32768 98304 =
    some 131072 := by
  exact validate_branch 16384 cache_98304_16384 cache_114688_16384
    98304 114688 131072
    checked_98304_16384 rfl checked_114688_16384
theorem checked_65536_65536 : validate cache_65536_65536 65536 =
    some 131072 := by
  exact validate_branch 32768 cache_65536_32768 cache_98304_32768
    65536 98304 131072
    checked_65536_32768 rfl checked_98304_32768

theorem checked : validate cache 65536 = some 131072 := checked_65536_65536

theorem count_exact : cache.count = 65536 := by
  have extent := validate_extent cache 65536 131072 checked
  omega

theorem within_body : 131072 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 65536 131072 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 65536 131072 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 65536 131072 address = observedPair address :=
  cachedPair_eq cache 65536 131072 checked address

end SourceMainCache65536Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Numeric observation cache fidelity checked: 65536"
