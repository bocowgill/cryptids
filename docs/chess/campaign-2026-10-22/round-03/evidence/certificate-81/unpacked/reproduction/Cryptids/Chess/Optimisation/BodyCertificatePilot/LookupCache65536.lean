module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LookupCache65536Data

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace LookupCache65536Pilot
theorem checked_0_256 : validate cache_0_256 0 =
    some 256 := by
  decide +kernel
theorem checked_256_256 : validate cache_256_256 256 =
    some 512 := by
  decide +kernel
theorem checked_0_512 : validate cache_0_512 0 =
    some 512 := by
  exact validate_branch 256 cache_0_256 cache_256_256
    0 256 512
    checked_0_256 rfl checked_256_256
theorem checked_512_256 : validate cache_512_256 512 =
    some 768 := by
  decide +kernel
theorem checked_768_256 : validate cache_768_256 768 =
    some 1024 := by
  decide +kernel
theorem checked_512_512 : validate cache_512_512 512 =
    some 1024 := by
  exact validate_branch 256 cache_512_256 cache_768_256
    512 768 1024
    checked_512_256 rfl checked_768_256
theorem checked_0_1024 : validate cache_0_1024 0 =
    some 1024 := by
  exact validate_branch 512 cache_0_512 cache_512_512
    0 512 1024
    checked_0_512 rfl checked_512_512
theorem checked_1024_256 : validate cache_1024_256 1024 =
    some 1280 := by
  decide +kernel
theorem checked_1280_256 : validate cache_1280_256 1280 =
    some 1536 := by
  decide +kernel
theorem checked_1024_512 : validate cache_1024_512 1024 =
    some 1536 := by
  exact validate_branch 256 cache_1024_256 cache_1280_256
    1024 1280 1536
    checked_1024_256 rfl checked_1280_256
theorem checked_1536_256 : validate cache_1536_256 1536 =
    some 1792 := by
  decide +kernel
theorem checked_1792_256 : validate cache_1792_256 1792 =
    some 2048 := by
  decide +kernel
theorem checked_1536_512 : validate cache_1536_512 1536 =
    some 2048 := by
  exact validate_branch 256 cache_1536_256 cache_1792_256
    1536 1792 2048
    checked_1536_256 rfl checked_1792_256
theorem checked_1024_1024 : validate cache_1024_1024 1024 =
    some 2048 := by
  exact validate_branch 512 cache_1024_512 cache_1536_512
    1024 1536 2048
    checked_1024_512 rfl checked_1536_512
theorem checked_0_2048 : validate cache_0_2048 0 =
    some 2048 := by
  exact validate_branch 1024 cache_0_1024 cache_1024_1024
    0 1024 2048
    checked_0_1024 rfl checked_1024_1024
theorem checked_2048_256 : validate cache_2048_256 2048 =
    some 2304 := by
  decide +kernel
theorem checked_2304_256 : validate cache_2304_256 2304 =
    some 2560 := by
  decide +kernel
theorem checked_2048_512 : validate cache_2048_512 2048 =
    some 2560 := by
  exact validate_branch 256 cache_2048_256 cache_2304_256
    2048 2304 2560
    checked_2048_256 rfl checked_2304_256
theorem checked_2560_256 : validate cache_2560_256 2560 =
    some 2816 := by
  decide +kernel
theorem checked_2816_256 : validate cache_2816_256 2816 =
    some 3072 := by
  decide +kernel
theorem checked_2560_512 : validate cache_2560_512 2560 =
    some 3072 := by
  exact validate_branch 256 cache_2560_256 cache_2816_256
    2560 2816 3072
    checked_2560_256 rfl checked_2816_256
theorem checked_2048_1024 : validate cache_2048_1024 2048 =
    some 3072 := by
  exact validate_branch 512 cache_2048_512 cache_2560_512
    2048 2560 3072
    checked_2048_512 rfl checked_2560_512
theorem checked_3072_256 : validate cache_3072_256 3072 =
    some 3328 := by
  decide +kernel
theorem checked_3328_256 : validate cache_3328_256 3328 =
    some 3584 := by
  decide +kernel
theorem checked_3072_512 : validate cache_3072_512 3072 =
    some 3584 := by
  exact validate_branch 256 cache_3072_256 cache_3328_256
    3072 3328 3584
    checked_3072_256 rfl checked_3328_256
theorem checked_3584_256 : validate cache_3584_256 3584 =
    some 3840 := by
  decide +kernel
theorem checked_3840_256 : validate cache_3840_256 3840 =
    some 4096 := by
  decide +kernel
theorem checked_3584_512 : validate cache_3584_512 3584 =
    some 4096 := by
  exact validate_branch 256 cache_3584_256 cache_3840_256
    3584 3840 4096
    checked_3584_256 rfl checked_3840_256
theorem checked_3072_1024 : validate cache_3072_1024 3072 =
    some 4096 := by
  exact validate_branch 512 cache_3072_512 cache_3584_512
    3072 3584 4096
    checked_3072_512 rfl checked_3584_512
theorem checked_2048_2048 : validate cache_2048_2048 2048 =
    some 4096 := by
  exact validate_branch 1024 cache_2048_1024 cache_3072_1024
    2048 3072 4096
    checked_2048_1024 rfl checked_3072_1024
theorem checked_0_4096 : validate cache_0_4096 0 =
    some 4096 := by
  exact validate_branch 2048 cache_0_2048 cache_2048_2048
    0 2048 4096
    checked_0_2048 rfl checked_2048_2048
theorem checked_4096_256 : validate cache_4096_256 4096 =
    some 4352 := by
  decide +kernel
theorem checked_4352_256 : validate cache_4352_256 4352 =
    some 4608 := by
  decide +kernel
theorem checked_4096_512 : validate cache_4096_512 4096 =
    some 4608 := by
  exact validate_branch 256 cache_4096_256 cache_4352_256
    4096 4352 4608
    checked_4096_256 rfl checked_4352_256
theorem checked_4608_256 : validate cache_4608_256 4608 =
    some 4864 := by
  decide +kernel
theorem checked_4864_256 : validate cache_4864_256 4864 =
    some 5120 := by
  decide +kernel
theorem checked_4608_512 : validate cache_4608_512 4608 =
    some 5120 := by
  exact validate_branch 256 cache_4608_256 cache_4864_256
    4608 4864 5120
    checked_4608_256 rfl checked_4864_256
theorem checked_4096_1024 : validate cache_4096_1024 4096 =
    some 5120 := by
  exact validate_branch 512 cache_4096_512 cache_4608_512
    4096 4608 5120
    checked_4096_512 rfl checked_4608_512
theorem checked_5120_256 : validate cache_5120_256 5120 =
    some 5376 := by
  decide +kernel
theorem checked_5376_256 : validate cache_5376_256 5376 =
    some 5632 := by
  decide +kernel
theorem checked_5120_512 : validate cache_5120_512 5120 =
    some 5632 := by
  exact validate_branch 256 cache_5120_256 cache_5376_256
    5120 5376 5632
    checked_5120_256 rfl checked_5376_256
theorem checked_5632_256 : validate cache_5632_256 5632 =
    some 5888 := by
  decide +kernel
theorem checked_5888_256 : validate cache_5888_256 5888 =
    some 6144 := by
  decide +kernel
theorem checked_5632_512 : validate cache_5632_512 5632 =
    some 6144 := by
  exact validate_branch 256 cache_5632_256 cache_5888_256
    5632 5888 6144
    checked_5632_256 rfl checked_5888_256
theorem checked_5120_1024 : validate cache_5120_1024 5120 =
    some 6144 := by
  exact validate_branch 512 cache_5120_512 cache_5632_512
    5120 5632 6144
    checked_5120_512 rfl checked_5632_512
theorem checked_4096_2048 : validate cache_4096_2048 4096 =
    some 6144 := by
  exact validate_branch 1024 cache_4096_1024 cache_5120_1024
    4096 5120 6144
    checked_4096_1024 rfl checked_5120_1024
theorem checked_6144_256 : validate cache_6144_256 6144 =
    some 6400 := by
  decide +kernel
theorem checked_6400_256 : validate cache_6400_256 6400 =
    some 6656 := by
  decide +kernel
theorem checked_6144_512 : validate cache_6144_512 6144 =
    some 6656 := by
  exact validate_branch 256 cache_6144_256 cache_6400_256
    6144 6400 6656
    checked_6144_256 rfl checked_6400_256
theorem checked_6656_256 : validate cache_6656_256 6656 =
    some 6912 := by
  decide +kernel
theorem checked_6912_256 : validate cache_6912_256 6912 =
    some 7168 := by
  decide +kernel
theorem checked_6656_512 : validate cache_6656_512 6656 =
    some 7168 := by
  exact validate_branch 256 cache_6656_256 cache_6912_256
    6656 6912 7168
    checked_6656_256 rfl checked_6912_256
theorem checked_6144_1024 : validate cache_6144_1024 6144 =
    some 7168 := by
  exact validate_branch 512 cache_6144_512 cache_6656_512
    6144 6656 7168
    checked_6144_512 rfl checked_6656_512
theorem checked_7168_256 : validate cache_7168_256 7168 =
    some 7424 := by
  decide +kernel
theorem checked_7424_256 : validate cache_7424_256 7424 =
    some 7680 := by
  decide +kernel
theorem checked_7168_512 : validate cache_7168_512 7168 =
    some 7680 := by
  exact validate_branch 256 cache_7168_256 cache_7424_256
    7168 7424 7680
    checked_7168_256 rfl checked_7424_256
theorem checked_7680_256 : validate cache_7680_256 7680 =
    some 7936 := by
  decide +kernel
theorem checked_7936_256 : validate cache_7936_256 7936 =
    some 8192 := by
  decide +kernel
theorem checked_7680_512 : validate cache_7680_512 7680 =
    some 8192 := by
  exact validate_branch 256 cache_7680_256 cache_7936_256
    7680 7936 8192
    checked_7680_256 rfl checked_7936_256
theorem checked_7168_1024 : validate cache_7168_1024 7168 =
    some 8192 := by
  exact validate_branch 512 cache_7168_512 cache_7680_512
    7168 7680 8192
    checked_7168_512 rfl checked_7680_512
theorem checked_6144_2048 : validate cache_6144_2048 6144 =
    some 8192 := by
  exact validate_branch 1024 cache_6144_1024 cache_7168_1024
    6144 7168 8192
    checked_6144_1024 rfl checked_7168_1024
theorem checked_4096_4096 : validate cache_4096_4096 4096 =
    some 8192 := by
  exact validate_branch 2048 cache_4096_2048 cache_6144_2048
    4096 6144 8192
    checked_4096_2048 rfl checked_6144_2048
theorem checked_0_8192 : validate cache_0_8192 0 =
    some 8192 := by
  exact validate_branch 4096 cache_0_4096 cache_4096_4096
    0 4096 8192
    checked_0_4096 rfl checked_4096_4096
theorem checked_8192_256 : validate cache_8192_256 8192 =
    some 8448 := by
  decide +kernel
theorem checked_8448_256 : validate cache_8448_256 8448 =
    some 8704 := by
  decide +kernel
theorem checked_8192_512 : validate cache_8192_512 8192 =
    some 8704 := by
  exact validate_branch 256 cache_8192_256 cache_8448_256
    8192 8448 8704
    checked_8192_256 rfl checked_8448_256
theorem checked_8704_256 : validate cache_8704_256 8704 =
    some 8960 := by
  decide +kernel
theorem checked_8960_256 : validate cache_8960_256 8960 =
    some 9216 := by
  decide +kernel
theorem checked_8704_512 : validate cache_8704_512 8704 =
    some 9216 := by
  exact validate_branch 256 cache_8704_256 cache_8960_256
    8704 8960 9216
    checked_8704_256 rfl checked_8960_256
theorem checked_8192_1024 : validate cache_8192_1024 8192 =
    some 9216 := by
  exact validate_branch 512 cache_8192_512 cache_8704_512
    8192 8704 9216
    checked_8192_512 rfl checked_8704_512
theorem checked_9216_256 : validate cache_9216_256 9216 =
    some 9472 := by
  decide +kernel
theorem checked_9472_256 : validate cache_9472_256 9472 =
    some 9728 := by
  decide +kernel
theorem checked_9216_512 : validate cache_9216_512 9216 =
    some 9728 := by
  exact validate_branch 256 cache_9216_256 cache_9472_256
    9216 9472 9728
    checked_9216_256 rfl checked_9472_256
theorem checked_9728_256 : validate cache_9728_256 9728 =
    some 9984 := by
  decide +kernel
theorem checked_9984_256 : validate cache_9984_256 9984 =
    some 10240 := by
  decide +kernel
theorem checked_9728_512 : validate cache_9728_512 9728 =
    some 10240 := by
  exact validate_branch 256 cache_9728_256 cache_9984_256
    9728 9984 10240
    checked_9728_256 rfl checked_9984_256
theorem checked_9216_1024 : validate cache_9216_1024 9216 =
    some 10240 := by
  exact validate_branch 512 cache_9216_512 cache_9728_512
    9216 9728 10240
    checked_9216_512 rfl checked_9728_512
theorem checked_8192_2048 : validate cache_8192_2048 8192 =
    some 10240 := by
  exact validate_branch 1024 cache_8192_1024 cache_9216_1024
    8192 9216 10240
    checked_8192_1024 rfl checked_9216_1024
theorem checked_10240_256 : validate cache_10240_256 10240 =
    some 10496 := by
  decide +kernel
theorem checked_10496_256 : validate cache_10496_256 10496 =
    some 10752 := by
  decide +kernel
theorem checked_10240_512 : validate cache_10240_512 10240 =
    some 10752 := by
  exact validate_branch 256 cache_10240_256 cache_10496_256
    10240 10496 10752
    checked_10240_256 rfl checked_10496_256
theorem checked_10752_256 : validate cache_10752_256 10752 =
    some 11008 := by
  decide +kernel
theorem checked_11008_256 : validate cache_11008_256 11008 =
    some 11264 := by
  decide +kernel
theorem checked_10752_512 : validate cache_10752_512 10752 =
    some 11264 := by
  exact validate_branch 256 cache_10752_256 cache_11008_256
    10752 11008 11264
    checked_10752_256 rfl checked_11008_256
theorem checked_10240_1024 : validate cache_10240_1024 10240 =
    some 11264 := by
  exact validate_branch 512 cache_10240_512 cache_10752_512
    10240 10752 11264
    checked_10240_512 rfl checked_10752_512
theorem checked_11264_256 : validate cache_11264_256 11264 =
    some 11520 := by
  decide +kernel
theorem checked_11520_256 : validate cache_11520_256 11520 =
    some 11776 := by
  decide +kernel
theorem checked_11264_512 : validate cache_11264_512 11264 =
    some 11776 := by
  exact validate_branch 256 cache_11264_256 cache_11520_256
    11264 11520 11776
    checked_11264_256 rfl checked_11520_256
theorem checked_11776_256 : validate cache_11776_256 11776 =
    some 12032 := by
  decide +kernel
theorem checked_12032_256 : validate cache_12032_256 12032 =
    some 12288 := by
  decide +kernel
theorem checked_11776_512 : validate cache_11776_512 11776 =
    some 12288 := by
  exact validate_branch 256 cache_11776_256 cache_12032_256
    11776 12032 12288
    checked_11776_256 rfl checked_12032_256
theorem checked_11264_1024 : validate cache_11264_1024 11264 =
    some 12288 := by
  exact validate_branch 512 cache_11264_512 cache_11776_512
    11264 11776 12288
    checked_11264_512 rfl checked_11776_512
theorem checked_10240_2048 : validate cache_10240_2048 10240 =
    some 12288 := by
  exact validate_branch 1024 cache_10240_1024 cache_11264_1024
    10240 11264 12288
    checked_10240_1024 rfl checked_11264_1024
theorem checked_8192_4096 : validate cache_8192_4096 8192 =
    some 12288 := by
  exact validate_branch 2048 cache_8192_2048 cache_10240_2048
    8192 10240 12288
    checked_8192_2048 rfl checked_10240_2048
theorem checked_12288_256 : validate cache_12288_256 12288 =
    some 12544 := by
  decide +kernel
theorem checked_12544_256 : validate cache_12544_256 12544 =
    some 12800 := by
  decide +kernel
theorem checked_12288_512 : validate cache_12288_512 12288 =
    some 12800 := by
  exact validate_branch 256 cache_12288_256 cache_12544_256
    12288 12544 12800
    checked_12288_256 rfl checked_12544_256
theorem checked_12800_256 : validate cache_12800_256 12800 =
    some 13056 := by
  decide +kernel
theorem checked_13056_256 : validate cache_13056_256 13056 =
    some 13312 := by
  decide +kernel
theorem checked_12800_512 : validate cache_12800_512 12800 =
    some 13312 := by
  exact validate_branch 256 cache_12800_256 cache_13056_256
    12800 13056 13312
    checked_12800_256 rfl checked_13056_256
theorem checked_12288_1024 : validate cache_12288_1024 12288 =
    some 13312 := by
  exact validate_branch 512 cache_12288_512 cache_12800_512
    12288 12800 13312
    checked_12288_512 rfl checked_12800_512
theorem checked_13312_256 : validate cache_13312_256 13312 =
    some 13568 := by
  decide +kernel
theorem checked_13568_256 : validate cache_13568_256 13568 =
    some 13824 := by
  decide +kernel
theorem checked_13312_512 : validate cache_13312_512 13312 =
    some 13824 := by
  exact validate_branch 256 cache_13312_256 cache_13568_256
    13312 13568 13824
    checked_13312_256 rfl checked_13568_256
theorem checked_13824_256 : validate cache_13824_256 13824 =
    some 14080 := by
  decide +kernel
theorem checked_14080_256 : validate cache_14080_256 14080 =
    some 14336 := by
  decide +kernel
theorem checked_13824_512 : validate cache_13824_512 13824 =
    some 14336 := by
  exact validate_branch 256 cache_13824_256 cache_14080_256
    13824 14080 14336
    checked_13824_256 rfl checked_14080_256
theorem checked_13312_1024 : validate cache_13312_1024 13312 =
    some 14336 := by
  exact validate_branch 512 cache_13312_512 cache_13824_512
    13312 13824 14336
    checked_13312_512 rfl checked_13824_512
theorem checked_12288_2048 : validate cache_12288_2048 12288 =
    some 14336 := by
  exact validate_branch 1024 cache_12288_1024 cache_13312_1024
    12288 13312 14336
    checked_12288_1024 rfl checked_13312_1024
theorem checked_14336_256 : validate cache_14336_256 14336 =
    some 14592 := by
  decide +kernel
theorem checked_14592_256 : validate cache_14592_256 14592 =
    some 14848 := by
  decide +kernel
theorem checked_14336_512 : validate cache_14336_512 14336 =
    some 14848 := by
  exact validate_branch 256 cache_14336_256 cache_14592_256
    14336 14592 14848
    checked_14336_256 rfl checked_14592_256
theorem checked_14848_256 : validate cache_14848_256 14848 =
    some 15104 := by
  decide +kernel
theorem checked_15104_256 : validate cache_15104_256 15104 =
    some 15360 := by
  decide +kernel
theorem checked_14848_512 : validate cache_14848_512 14848 =
    some 15360 := by
  exact validate_branch 256 cache_14848_256 cache_15104_256
    14848 15104 15360
    checked_14848_256 rfl checked_15104_256
theorem checked_14336_1024 : validate cache_14336_1024 14336 =
    some 15360 := by
  exact validate_branch 512 cache_14336_512 cache_14848_512
    14336 14848 15360
    checked_14336_512 rfl checked_14848_512
theorem checked_15360_256 : validate cache_15360_256 15360 =
    some 15616 := by
  decide +kernel
theorem checked_15616_256 : validate cache_15616_256 15616 =
    some 15872 := by
  decide +kernel
theorem checked_15360_512 : validate cache_15360_512 15360 =
    some 15872 := by
  exact validate_branch 256 cache_15360_256 cache_15616_256
    15360 15616 15872
    checked_15360_256 rfl checked_15616_256
theorem checked_15872_256 : validate cache_15872_256 15872 =
    some 16128 := by
  decide +kernel
theorem checked_16128_256 : validate cache_16128_256 16128 =
    some 16384 := by
  decide +kernel
theorem checked_15872_512 : validate cache_15872_512 15872 =
    some 16384 := by
  exact validate_branch 256 cache_15872_256 cache_16128_256
    15872 16128 16384
    checked_15872_256 rfl checked_16128_256
theorem checked_15360_1024 : validate cache_15360_1024 15360 =
    some 16384 := by
  exact validate_branch 512 cache_15360_512 cache_15872_512
    15360 15872 16384
    checked_15360_512 rfl checked_15872_512
theorem checked_14336_2048 : validate cache_14336_2048 14336 =
    some 16384 := by
  exact validate_branch 1024 cache_14336_1024 cache_15360_1024
    14336 15360 16384
    checked_14336_1024 rfl checked_15360_1024
theorem checked_12288_4096 : validate cache_12288_4096 12288 =
    some 16384 := by
  exact validate_branch 2048 cache_12288_2048 cache_14336_2048
    12288 14336 16384
    checked_12288_2048 rfl checked_14336_2048
theorem checked_8192_8192 : validate cache_8192_8192 8192 =
    some 16384 := by
  exact validate_branch 4096 cache_8192_4096 cache_12288_4096
    8192 12288 16384
    checked_8192_4096 rfl checked_12288_4096
theorem checked_0_16384 : validate cache_0_16384 0 =
    some 16384 := by
  exact validate_branch 8192 cache_0_8192 cache_8192_8192
    0 8192 16384
    checked_0_8192 rfl checked_8192_8192
theorem checked_16384_256 : validate cache_16384_256 16384 =
    some 16640 := by
  decide +kernel
theorem checked_16640_256 : validate cache_16640_256 16640 =
    some 16896 := by
  decide +kernel
theorem checked_16384_512 : validate cache_16384_512 16384 =
    some 16896 := by
  exact validate_branch 256 cache_16384_256 cache_16640_256
    16384 16640 16896
    checked_16384_256 rfl checked_16640_256
theorem checked_16896_256 : validate cache_16896_256 16896 =
    some 17152 := by
  decide +kernel
theorem checked_17152_256 : validate cache_17152_256 17152 =
    some 17408 := by
  decide +kernel
theorem checked_16896_512 : validate cache_16896_512 16896 =
    some 17408 := by
  exact validate_branch 256 cache_16896_256 cache_17152_256
    16896 17152 17408
    checked_16896_256 rfl checked_17152_256
theorem checked_16384_1024 : validate cache_16384_1024 16384 =
    some 17408 := by
  exact validate_branch 512 cache_16384_512 cache_16896_512
    16384 16896 17408
    checked_16384_512 rfl checked_16896_512
theorem checked_17408_256 : validate cache_17408_256 17408 =
    some 17664 := by
  decide +kernel
theorem checked_17664_256 : validate cache_17664_256 17664 =
    some 17920 := by
  decide +kernel
theorem checked_17408_512 : validate cache_17408_512 17408 =
    some 17920 := by
  exact validate_branch 256 cache_17408_256 cache_17664_256
    17408 17664 17920
    checked_17408_256 rfl checked_17664_256
theorem checked_17920_256 : validate cache_17920_256 17920 =
    some 18176 := by
  decide +kernel
theorem checked_18176_256 : validate cache_18176_256 18176 =
    some 18432 := by
  decide +kernel
theorem checked_17920_512 : validate cache_17920_512 17920 =
    some 18432 := by
  exact validate_branch 256 cache_17920_256 cache_18176_256
    17920 18176 18432
    checked_17920_256 rfl checked_18176_256
theorem checked_17408_1024 : validate cache_17408_1024 17408 =
    some 18432 := by
  exact validate_branch 512 cache_17408_512 cache_17920_512
    17408 17920 18432
    checked_17408_512 rfl checked_17920_512
theorem checked_16384_2048 : validate cache_16384_2048 16384 =
    some 18432 := by
  exact validate_branch 1024 cache_16384_1024 cache_17408_1024
    16384 17408 18432
    checked_16384_1024 rfl checked_17408_1024
theorem checked_18432_256 : validate cache_18432_256 18432 =
    some 18688 := by
  decide +kernel
theorem checked_18688_256 : validate cache_18688_256 18688 =
    some 18944 := by
  decide +kernel
theorem checked_18432_512 : validate cache_18432_512 18432 =
    some 18944 := by
  exact validate_branch 256 cache_18432_256 cache_18688_256
    18432 18688 18944
    checked_18432_256 rfl checked_18688_256
theorem checked_18944_256 : validate cache_18944_256 18944 =
    some 19200 := by
  decide +kernel
theorem checked_19200_256 : validate cache_19200_256 19200 =
    some 19456 := by
  decide +kernel
theorem checked_18944_512 : validate cache_18944_512 18944 =
    some 19456 := by
  exact validate_branch 256 cache_18944_256 cache_19200_256
    18944 19200 19456
    checked_18944_256 rfl checked_19200_256
theorem checked_18432_1024 : validate cache_18432_1024 18432 =
    some 19456 := by
  exact validate_branch 512 cache_18432_512 cache_18944_512
    18432 18944 19456
    checked_18432_512 rfl checked_18944_512
theorem checked_19456_256 : validate cache_19456_256 19456 =
    some 19712 := by
  decide +kernel
theorem checked_19712_256 : validate cache_19712_256 19712 =
    some 19968 := by
  decide +kernel
theorem checked_19456_512 : validate cache_19456_512 19456 =
    some 19968 := by
  exact validate_branch 256 cache_19456_256 cache_19712_256
    19456 19712 19968
    checked_19456_256 rfl checked_19712_256
theorem checked_19968_256 : validate cache_19968_256 19968 =
    some 20224 := by
  decide +kernel
theorem checked_20224_256 : validate cache_20224_256 20224 =
    some 20480 := by
  decide +kernel
theorem checked_19968_512 : validate cache_19968_512 19968 =
    some 20480 := by
  exact validate_branch 256 cache_19968_256 cache_20224_256
    19968 20224 20480
    checked_19968_256 rfl checked_20224_256
theorem checked_19456_1024 : validate cache_19456_1024 19456 =
    some 20480 := by
  exact validate_branch 512 cache_19456_512 cache_19968_512
    19456 19968 20480
    checked_19456_512 rfl checked_19968_512
theorem checked_18432_2048 : validate cache_18432_2048 18432 =
    some 20480 := by
  exact validate_branch 1024 cache_18432_1024 cache_19456_1024
    18432 19456 20480
    checked_18432_1024 rfl checked_19456_1024
theorem checked_16384_4096 : validate cache_16384_4096 16384 =
    some 20480 := by
  exact validate_branch 2048 cache_16384_2048 cache_18432_2048
    16384 18432 20480
    checked_16384_2048 rfl checked_18432_2048
theorem checked_20480_256 : validate cache_20480_256 20480 =
    some 20736 := by
  decide +kernel
theorem checked_20736_256 : validate cache_20736_256 20736 =
    some 20992 := by
  decide +kernel
theorem checked_20480_512 : validate cache_20480_512 20480 =
    some 20992 := by
  exact validate_branch 256 cache_20480_256 cache_20736_256
    20480 20736 20992
    checked_20480_256 rfl checked_20736_256
theorem checked_20992_256 : validate cache_20992_256 20992 =
    some 21248 := by
  decide +kernel
theorem checked_21248_256 : validate cache_21248_256 21248 =
    some 21504 := by
  decide +kernel
theorem checked_20992_512 : validate cache_20992_512 20992 =
    some 21504 := by
  exact validate_branch 256 cache_20992_256 cache_21248_256
    20992 21248 21504
    checked_20992_256 rfl checked_21248_256
theorem checked_20480_1024 : validate cache_20480_1024 20480 =
    some 21504 := by
  exact validate_branch 512 cache_20480_512 cache_20992_512
    20480 20992 21504
    checked_20480_512 rfl checked_20992_512
theorem checked_21504_256 : validate cache_21504_256 21504 =
    some 21760 := by
  decide +kernel
theorem checked_21760_256 : validate cache_21760_256 21760 =
    some 22016 := by
  decide +kernel
theorem checked_21504_512 : validate cache_21504_512 21504 =
    some 22016 := by
  exact validate_branch 256 cache_21504_256 cache_21760_256
    21504 21760 22016
    checked_21504_256 rfl checked_21760_256
theorem checked_22016_256 : validate cache_22016_256 22016 =
    some 22272 := by
  decide +kernel
theorem checked_22272_256 : validate cache_22272_256 22272 =
    some 22528 := by
  decide +kernel
theorem checked_22016_512 : validate cache_22016_512 22016 =
    some 22528 := by
  exact validate_branch 256 cache_22016_256 cache_22272_256
    22016 22272 22528
    checked_22016_256 rfl checked_22272_256
theorem checked_21504_1024 : validate cache_21504_1024 21504 =
    some 22528 := by
  exact validate_branch 512 cache_21504_512 cache_22016_512
    21504 22016 22528
    checked_21504_512 rfl checked_22016_512
theorem checked_20480_2048 : validate cache_20480_2048 20480 =
    some 22528 := by
  exact validate_branch 1024 cache_20480_1024 cache_21504_1024
    20480 21504 22528
    checked_20480_1024 rfl checked_21504_1024
theorem checked_22528_256 : validate cache_22528_256 22528 =
    some 22784 := by
  decide +kernel
theorem checked_22784_256 : validate cache_22784_256 22784 =
    some 23040 := by
  decide +kernel
theorem checked_22528_512 : validate cache_22528_512 22528 =
    some 23040 := by
  exact validate_branch 256 cache_22528_256 cache_22784_256
    22528 22784 23040
    checked_22528_256 rfl checked_22784_256
theorem checked_23040_256 : validate cache_23040_256 23040 =
    some 23296 := by
  decide +kernel
theorem checked_23296_256 : validate cache_23296_256 23296 =
    some 23552 := by
  decide +kernel
theorem checked_23040_512 : validate cache_23040_512 23040 =
    some 23552 := by
  exact validate_branch 256 cache_23040_256 cache_23296_256
    23040 23296 23552
    checked_23040_256 rfl checked_23296_256
theorem checked_22528_1024 : validate cache_22528_1024 22528 =
    some 23552 := by
  exact validate_branch 512 cache_22528_512 cache_23040_512
    22528 23040 23552
    checked_22528_512 rfl checked_23040_512
theorem checked_23552_256 : validate cache_23552_256 23552 =
    some 23808 := by
  decide +kernel
theorem checked_23808_256 : validate cache_23808_256 23808 =
    some 24064 := by
  decide +kernel
theorem checked_23552_512 : validate cache_23552_512 23552 =
    some 24064 := by
  exact validate_branch 256 cache_23552_256 cache_23808_256
    23552 23808 24064
    checked_23552_256 rfl checked_23808_256
theorem checked_24064_256 : validate cache_24064_256 24064 =
    some 24320 := by
  decide +kernel
theorem checked_24320_256 : validate cache_24320_256 24320 =
    some 24576 := by
  decide +kernel
theorem checked_24064_512 : validate cache_24064_512 24064 =
    some 24576 := by
  exact validate_branch 256 cache_24064_256 cache_24320_256
    24064 24320 24576
    checked_24064_256 rfl checked_24320_256
theorem checked_23552_1024 : validate cache_23552_1024 23552 =
    some 24576 := by
  exact validate_branch 512 cache_23552_512 cache_24064_512
    23552 24064 24576
    checked_23552_512 rfl checked_24064_512
theorem checked_22528_2048 : validate cache_22528_2048 22528 =
    some 24576 := by
  exact validate_branch 1024 cache_22528_1024 cache_23552_1024
    22528 23552 24576
    checked_22528_1024 rfl checked_23552_1024
theorem checked_20480_4096 : validate cache_20480_4096 20480 =
    some 24576 := by
  exact validate_branch 2048 cache_20480_2048 cache_22528_2048
    20480 22528 24576
    checked_20480_2048 rfl checked_22528_2048
theorem checked_16384_8192 : validate cache_16384_8192 16384 =
    some 24576 := by
  exact validate_branch 4096 cache_16384_4096 cache_20480_4096
    16384 20480 24576
    checked_16384_4096 rfl checked_20480_4096
theorem checked_24576_256 : validate cache_24576_256 24576 =
    some 24832 := by
  decide +kernel
theorem checked_24832_256 : validate cache_24832_256 24832 =
    some 25088 := by
  decide +kernel
theorem checked_24576_512 : validate cache_24576_512 24576 =
    some 25088 := by
  exact validate_branch 256 cache_24576_256 cache_24832_256
    24576 24832 25088
    checked_24576_256 rfl checked_24832_256
theorem checked_25088_256 : validate cache_25088_256 25088 =
    some 25344 := by
  decide +kernel
theorem checked_25344_256 : validate cache_25344_256 25344 =
    some 25600 := by
  decide +kernel
theorem checked_25088_512 : validate cache_25088_512 25088 =
    some 25600 := by
  exact validate_branch 256 cache_25088_256 cache_25344_256
    25088 25344 25600
    checked_25088_256 rfl checked_25344_256
theorem checked_24576_1024 : validate cache_24576_1024 24576 =
    some 25600 := by
  exact validate_branch 512 cache_24576_512 cache_25088_512
    24576 25088 25600
    checked_24576_512 rfl checked_25088_512
theorem checked_25600_256 : validate cache_25600_256 25600 =
    some 25856 := by
  decide +kernel
theorem checked_25856_256 : validate cache_25856_256 25856 =
    some 26112 := by
  decide +kernel
theorem checked_25600_512 : validate cache_25600_512 25600 =
    some 26112 := by
  exact validate_branch 256 cache_25600_256 cache_25856_256
    25600 25856 26112
    checked_25600_256 rfl checked_25856_256
theorem checked_26112_256 : validate cache_26112_256 26112 =
    some 26368 := by
  decide +kernel
theorem checked_26368_256 : validate cache_26368_256 26368 =
    some 26624 := by
  decide +kernel
theorem checked_26112_512 : validate cache_26112_512 26112 =
    some 26624 := by
  exact validate_branch 256 cache_26112_256 cache_26368_256
    26112 26368 26624
    checked_26112_256 rfl checked_26368_256
theorem checked_25600_1024 : validate cache_25600_1024 25600 =
    some 26624 := by
  exact validate_branch 512 cache_25600_512 cache_26112_512
    25600 26112 26624
    checked_25600_512 rfl checked_26112_512
theorem checked_24576_2048 : validate cache_24576_2048 24576 =
    some 26624 := by
  exact validate_branch 1024 cache_24576_1024 cache_25600_1024
    24576 25600 26624
    checked_24576_1024 rfl checked_25600_1024
theorem checked_26624_256 : validate cache_26624_256 26624 =
    some 26880 := by
  decide +kernel
theorem checked_26880_256 : validate cache_26880_256 26880 =
    some 27136 := by
  decide +kernel
theorem checked_26624_512 : validate cache_26624_512 26624 =
    some 27136 := by
  exact validate_branch 256 cache_26624_256 cache_26880_256
    26624 26880 27136
    checked_26624_256 rfl checked_26880_256
theorem checked_27136_256 : validate cache_27136_256 27136 =
    some 27392 := by
  decide +kernel
theorem checked_27392_256 : validate cache_27392_256 27392 =
    some 27648 := by
  decide +kernel
theorem checked_27136_512 : validate cache_27136_512 27136 =
    some 27648 := by
  exact validate_branch 256 cache_27136_256 cache_27392_256
    27136 27392 27648
    checked_27136_256 rfl checked_27392_256
theorem checked_26624_1024 : validate cache_26624_1024 26624 =
    some 27648 := by
  exact validate_branch 512 cache_26624_512 cache_27136_512
    26624 27136 27648
    checked_26624_512 rfl checked_27136_512
theorem checked_27648_256 : validate cache_27648_256 27648 =
    some 27904 := by
  decide +kernel
theorem checked_27904_256 : validate cache_27904_256 27904 =
    some 28160 := by
  decide +kernel
theorem checked_27648_512 : validate cache_27648_512 27648 =
    some 28160 := by
  exact validate_branch 256 cache_27648_256 cache_27904_256
    27648 27904 28160
    checked_27648_256 rfl checked_27904_256
theorem checked_28160_256 : validate cache_28160_256 28160 =
    some 28416 := by
  decide +kernel
theorem checked_28416_256 : validate cache_28416_256 28416 =
    some 28672 := by
  decide +kernel
theorem checked_28160_512 : validate cache_28160_512 28160 =
    some 28672 := by
  exact validate_branch 256 cache_28160_256 cache_28416_256
    28160 28416 28672
    checked_28160_256 rfl checked_28416_256
theorem checked_27648_1024 : validate cache_27648_1024 27648 =
    some 28672 := by
  exact validate_branch 512 cache_27648_512 cache_28160_512
    27648 28160 28672
    checked_27648_512 rfl checked_28160_512
theorem checked_26624_2048 : validate cache_26624_2048 26624 =
    some 28672 := by
  exact validate_branch 1024 cache_26624_1024 cache_27648_1024
    26624 27648 28672
    checked_26624_1024 rfl checked_27648_1024
theorem checked_24576_4096 : validate cache_24576_4096 24576 =
    some 28672 := by
  exact validate_branch 2048 cache_24576_2048 cache_26624_2048
    24576 26624 28672
    checked_24576_2048 rfl checked_26624_2048
theorem checked_28672_256 : validate cache_28672_256 28672 =
    some 28928 := by
  decide +kernel
theorem checked_28928_256 : validate cache_28928_256 28928 =
    some 29184 := by
  decide +kernel
theorem checked_28672_512 : validate cache_28672_512 28672 =
    some 29184 := by
  exact validate_branch 256 cache_28672_256 cache_28928_256
    28672 28928 29184
    checked_28672_256 rfl checked_28928_256
theorem checked_29184_256 : validate cache_29184_256 29184 =
    some 29440 := by
  decide +kernel
theorem checked_29440_256 : validate cache_29440_256 29440 =
    some 29696 := by
  decide +kernel
theorem checked_29184_512 : validate cache_29184_512 29184 =
    some 29696 := by
  exact validate_branch 256 cache_29184_256 cache_29440_256
    29184 29440 29696
    checked_29184_256 rfl checked_29440_256
theorem checked_28672_1024 : validate cache_28672_1024 28672 =
    some 29696 := by
  exact validate_branch 512 cache_28672_512 cache_29184_512
    28672 29184 29696
    checked_28672_512 rfl checked_29184_512
theorem checked_29696_256 : validate cache_29696_256 29696 =
    some 29952 := by
  decide +kernel
theorem checked_29952_256 : validate cache_29952_256 29952 =
    some 30208 := by
  decide +kernel
theorem checked_29696_512 : validate cache_29696_512 29696 =
    some 30208 := by
  exact validate_branch 256 cache_29696_256 cache_29952_256
    29696 29952 30208
    checked_29696_256 rfl checked_29952_256
theorem checked_30208_256 : validate cache_30208_256 30208 =
    some 30464 := by
  decide +kernel
theorem checked_30464_256 : validate cache_30464_256 30464 =
    some 30720 := by
  decide +kernel
theorem checked_30208_512 : validate cache_30208_512 30208 =
    some 30720 := by
  exact validate_branch 256 cache_30208_256 cache_30464_256
    30208 30464 30720
    checked_30208_256 rfl checked_30464_256
theorem checked_29696_1024 : validate cache_29696_1024 29696 =
    some 30720 := by
  exact validate_branch 512 cache_29696_512 cache_30208_512
    29696 30208 30720
    checked_29696_512 rfl checked_30208_512
theorem checked_28672_2048 : validate cache_28672_2048 28672 =
    some 30720 := by
  exact validate_branch 1024 cache_28672_1024 cache_29696_1024
    28672 29696 30720
    checked_28672_1024 rfl checked_29696_1024
theorem checked_30720_256 : validate cache_30720_256 30720 =
    some 30976 := by
  decide +kernel
theorem checked_30976_256 : validate cache_30976_256 30976 =
    some 31232 := by
  decide +kernel
theorem checked_30720_512 : validate cache_30720_512 30720 =
    some 31232 := by
  exact validate_branch 256 cache_30720_256 cache_30976_256
    30720 30976 31232
    checked_30720_256 rfl checked_30976_256
theorem checked_31232_256 : validate cache_31232_256 31232 =
    some 31488 := by
  decide +kernel
theorem checked_31488_256 : validate cache_31488_256 31488 =
    some 31744 := by
  decide +kernel
theorem checked_31232_512 : validate cache_31232_512 31232 =
    some 31744 := by
  exact validate_branch 256 cache_31232_256 cache_31488_256
    31232 31488 31744
    checked_31232_256 rfl checked_31488_256
theorem checked_30720_1024 : validate cache_30720_1024 30720 =
    some 31744 := by
  exact validate_branch 512 cache_30720_512 cache_31232_512
    30720 31232 31744
    checked_30720_512 rfl checked_31232_512
theorem checked_31744_256 : validate cache_31744_256 31744 =
    some 32000 := by
  decide +kernel
theorem checked_32000_256 : validate cache_32000_256 32000 =
    some 32256 := by
  decide +kernel
theorem checked_31744_512 : validate cache_31744_512 31744 =
    some 32256 := by
  exact validate_branch 256 cache_31744_256 cache_32000_256
    31744 32000 32256
    checked_31744_256 rfl checked_32000_256
theorem checked_32256_256 : validate cache_32256_256 32256 =
    some 32512 := by
  decide +kernel
theorem checked_32512_256 : validate cache_32512_256 32512 =
    some 32768 := by
  decide +kernel
theorem checked_32256_512 : validate cache_32256_512 32256 =
    some 32768 := by
  exact validate_branch 256 cache_32256_256 cache_32512_256
    32256 32512 32768
    checked_32256_256 rfl checked_32512_256
theorem checked_31744_1024 : validate cache_31744_1024 31744 =
    some 32768 := by
  exact validate_branch 512 cache_31744_512 cache_32256_512
    31744 32256 32768
    checked_31744_512 rfl checked_32256_512
theorem checked_30720_2048 : validate cache_30720_2048 30720 =
    some 32768 := by
  exact validate_branch 1024 cache_30720_1024 cache_31744_1024
    30720 31744 32768
    checked_30720_1024 rfl checked_31744_1024
theorem checked_28672_4096 : validate cache_28672_4096 28672 =
    some 32768 := by
  exact validate_branch 2048 cache_28672_2048 cache_30720_2048
    28672 30720 32768
    checked_28672_2048 rfl checked_30720_2048
theorem checked_24576_8192 : validate cache_24576_8192 24576 =
    some 32768 := by
  exact validate_branch 4096 cache_24576_4096 cache_28672_4096
    24576 28672 32768
    checked_24576_4096 rfl checked_28672_4096
theorem checked_16384_16384 : validate cache_16384_16384 16384 =
    some 32768 := by
  exact validate_branch 8192 cache_16384_8192 cache_24576_8192
    16384 24576 32768
    checked_16384_8192 rfl checked_24576_8192
theorem checked_0_32768 : validate cache_0_32768 0 =
    some 32768 := by
  exact validate_branch 16384 cache_0_16384 cache_16384_16384
    0 16384 32768
    checked_0_16384 rfl checked_16384_16384
theorem checked_32768_256 : validate cache_32768_256 32768 =
    some 33024 := by
  decide +kernel
theorem checked_33024_256 : validate cache_33024_256 33024 =
    some 33280 := by
  decide +kernel
theorem checked_32768_512 : validate cache_32768_512 32768 =
    some 33280 := by
  exact validate_branch 256 cache_32768_256 cache_33024_256
    32768 33024 33280
    checked_32768_256 rfl checked_33024_256
theorem checked_33280_256 : validate cache_33280_256 33280 =
    some 33536 := by
  decide +kernel
theorem checked_33536_256 : validate cache_33536_256 33536 =
    some 33792 := by
  decide +kernel
theorem checked_33280_512 : validate cache_33280_512 33280 =
    some 33792 := by
  exact validate_branch 256 cache_33280_256 cache_33536_256
    33280 33536 33792
    checked_33280_256 rfl checked_33536_256
theorem checked_32768_1024 : validate cache_32768_1024 32768 =
    some 33792 := by
  exact validate_branch 512 cache_32768_512 cache_33280_512
    32768 33280 33792
    checked_32768_512 rfl checked_33280_512
theorem checked_33792_256 : validate cache_33792_256 33792 =
    some 34048 := by
  decide +kernel
theorem checked_34048_256 : validate cache_34048_256 34048 =
    some 34304 := by
  decide +kernel
theorem checked_33792_512 : validate cache_33792_512 33792 =
    some 34304 := by
  exact validate_branch 256 cache_33792_256 cache_34048_256
    33792 34048 34304
    checked_33792_256 rfl checked_34048_256
theorem checked_34304_256 : validate cache_34304_256 34304 =
    some 34560 := by
  decide +kernel
theorem checked_34560_256 : validate cache_34560_256 34560 =
    some 34816 := by
  decide +kernel
theorem checked_34304_512 : validate cache_34304_512 34304 =
    some 34816 := by
  exact validate_branch 256 cache_34304_256 cache_34560_256
    34304 34560 34816
    checked_34304_256 rfl checked_34560_256
theorem checked_33792_1024 : validate cache_33792_1024 33792 =
    some 34816 := by
  exact validate_branch 512 cache_33792_512 cache_34304_512
    33792 34304 34816
    checked_33792_512 rfl checked_34304_512
theorem checked_32768_2048 : validate cache_32768_2048 32768 =
    some 34816 := by
  exact validate_branch 1024 cache_32768_1024 cache_33792_1024
    32768 33792 34816
    checked_32768_1024 rfl checked_33792_1024
theorem checked_34816_256 : validate cache_34816_256 34816 =
    some 35072 := by
  decide +kernel
theorem checked_35072_256 : validate cache_35072_256 35072 =
    some 35328 := by
  decide +kernel
theorem checked_34816_512 : validate cache_34816_512 34816 =
    some 35328 := by
  exact validate_branch 256 cache_34816_256 cache_35072_256
    34816 35072 35328
    checked_34816_256 rfl checked_35072_256
theorem checked_35328_256 : validate cache_35328_256 35328 =
    some 35584 := by
  decide +kernel
theorem checked_35584_256 : validate cache_35584_256 35584 =
    some 35840 := by
  decide +kernel
theorem checked_35328_512 : validate cache_35328_512 35328 =
    some 35840 := by
  exact validate_branch 256 cache_35328_256 cache_35584_256
    35328 35584 35840
    checked_35328_256 rfl checked_35584_256
theorem checked_34816_1024 : validate cache_34816_1024 34816 =
    some 35840 := by
  exact validate_branch 512 cache_34816_512 cache_35328_512
    34816 35328 35840
    checked_34816_512 rfl checked_35328_512
theorem checked_35840_256 : validate cache_35840_256 35840 =
    some 36096 := by
  decide +kernel
theorem checked_36096_256 : validate cache_36096_256 36096 =
    some 36352 := by
  decide +kernel
theorem checked_35840_512 : validate cache_35840_512 35840 =
    some 36352 := by
  exact validate_branch 256 cache_35840_256 cache_36096_256
    35840 36096 36352
    checked_35840_256 rfl checked_36096_256
theorem checked_36352_256 : validate cache_36352_256 36352 =
    some 36608 := by
  decide +kernel
theorem checked_36608_256 : validate cache_36608_256 36608 =
    some 36864 := by
  decide +kernel
theorem checked_36352_512 : validate cache_36352_512 36352 =
    some 36864 := by
  exact validate_branch 256 cache_36352_256 cache_36608_256
    36352 36608 36864
    checked_36352_256 rfl checked_36608_256
theorem checked_35840_1024 : validate cache_35840_1024 35840 =
    some 36864 := by
  exact validate_branch 512 cache_35840_512 cache_36352_512
    35840 36352 36864
    checked_35840_512 rfl checked_36352_512
theorem checked_34816_2048 : validate cache_34816_2048 34816 =
    some 36864 := by
  exact validate_branch 1024 cache_34816_1024 cache_35840_1024
    34816 35840 36864
    checked_34816_1024 rfl checked_35840_1024
theorem checked_32768_4096 : validate cache_32768_4096 32768 =
    some 36864 := by
  exact validate_branch 2048 cache_32768_2048 cache_34816_2048
    32768 34816 36864
    checked_32768_2048 rfl checked_34816_2048
theorem checked_36864_256 : validate cache_36864_256 36864 =
    some 37120 := by
  decide +kernel
theorem checked_37120_256 : validate cache_37120_256 37120 =
    some 37376 := by
  decide +kernel
theorem checked_36864_512 : validate cache_36864_512 36864 =
    some 37376 := by
  exact validate_branch 256 cache_36864_256 cache_37120_256
    36864 37120 37376
    checked_36864_256 rfl checked_37120_256
theorem checked_37376_256 : validate cache_37376_256 37376 =
    some 37632 := by
  decide +kernel
theorem checked_37632_256 : validate cache_37632_256 37632 =
    some 37888 := by
  decide +kernel
theorem checked_37376_512 : validate cache_37376_512 37376 =
    some 37888 := by
  exact validate_branch 256 cache_37376_256 cache_37632_256
    37376 37632 37888
    checked_37376_256 rfl checked_37632_256
theorem checked_36864_1024 : validate cache_36864_1024 36864 =
    some 37888 := by
  exact validate_branch 512 cache_36864_512 cache_37376_512
    36864 37376 37888
    checked_36864_512 rfl checked_37376_512
theorem checked_37888_256 : validate cache_37888_256 37888 =
    some 38144 := by
  decide +kernel
theorem checked_38144_256 : validate cache_38144_256 38144 =
    some 38400 := by
  decide +kernel
theorem checked_37888_512 : validate cache_37888_512 37888 =
    some 38400 := by
  exact validate_branch 256 cache_37888_256 cache_38144_256
    37888 38144 38400
    checked_37888_256 rfl checked_38144_256
theorem checked_38400_256 : validate cache_38400_256 38400 =
    some 38656 := by
  decide +kernel
theorem checked_38656_256 : validate cache_38656_256 38656 =
    some 38912 := by
  decide +kernel
theorem checked_38400_512 : validate cache_38400_512 38400 =
    some 38912 := by
  exact validate_branch 256 cache_38400_256 cache_38656_256
    38400 38656 38912
    checked_38400_256 rfl checked_38656_256
theorem checked_37888_1024 : validate cache_37888_1024 37888 =
    some 38912 := by
  exact validate_branch 512 cache_37888_512 cache_38400_512
    37888 38400 38912
    checked_37888_512 rfl checked_38400_512
theorem checked_36864_2048 : validate cache_36864_2048 36864 =
    some 38912 := by
  exact validate_branch 1024 cache_36864_1024 cache_37888_1024
    36864 37888 38912
    checked_36864_1024 rfl checked_37888_1024
theorem checked_38912_256 : validate cache_38912_256 38912 =
    some 39168 := by
  decide +kernel
theorem checked_39168_256 : validate cache_39168_256 39168 =
    some 39424 := by
  decide +kernel
theorem checked_38912_512 : validate cache_38912_512 38912 =
    some 39424 := by
  exact validate_branch 256 cache_38912_256 cache_39168_256
    38912 39168 39424
    checked_38912_256 rfl checked_39168_256
theorem checked_39424_256 : validate cache_39424_256 39424 =
    some 39680 := by
  decide +kernel
theorem checked_39680_256 : validate cache_39680_256 39680 =
    some 39936 := by
  decide +kernel
theorem checked_39424_512 : validate cache_39424_512 39424 =
    some 39936 := by
  exact validate_branch 256 cache_39424_256 cache_39680_256
    39424 39680 39936
    checked_39424_256 rfl checked_39680_256
theorem checked_38912_1024 : validate cache_38912_1024 38912 =
    some 39936 := by
  exact validate_branch 512 cache_38912_512 cache_39424_512
    38912 39424 39936
    checked_38912_512 rfl checked_39424_512
theorem checked_39936_256 : validate cache_39936_256 39936 =
    some 40192 := by
  decide +kernel
theorem checked_40192_256 : validate cache_40192_256 40192 =
    some 40448 := by
  decide +kernel
theorem checked_39936_512 : validate cache_39936_512 39936 =
    some 40448 := by
  exact validate_branch 256 cache_39936_256 cache_40192_256
    39936 40192 40448
    checked_39936_256 rfl checked_40192_256
theorem checked_40448_256 : validate cache_40448_256 40448 =
    some 40704 := by
  decide +kernel
theorem checked_40704_256 : validate cache_40704_256 40704 =
    some 40960 := by
  decide +kernel
theorem checked_40448_512 : validate cache_40448_512 40448 =
    some 40960 := by
  exact validate_branch 256 cache_40448_256 cache_40704_256
    40448 40704 40960
    checked_40448_256 rfl checked_40704_256
theorem checked_39936_1024 : validate cache_39936_1024 39936 =
    some 40960 := by
  exact validate_branch 512 cache_39936_512 cache_40448_512
    39936 40448 40960
    checked_39936_512 rfl checked_40448_512
theorem checked_38912_2048 : validate cache_38912_2048 38912 =
    some 40960 := by
  exact validate_branch 1024 cache_38912_1024 cache_39936_1024
    38912 39936 40960
    checked_38912_1024 rfl checked_39936_1024
theorem checked_36864_4096 : validate cache_36864_4096 36864 =
    some 40960 := by
  exact validate_branch 2048 cache_36864_2048 cache_38912_2048
    36864 38912 40960
    checked_36864_2048 rfl checked_38912_2048
theorem checked_32768_8192 : validate cache_32768_8192 32768 =
    some 40960 := by
  exact validate_branch 4096 cache_32768_4096 cache_36864_4096
    32768 36864 40960
    checked_32768_4096 rfl checked_36864_4096
theorem checked_40960_256 : validate cache_40960_256 40960 =
    some 41216 := by
  decide +kernel
theorem checked_41216_256 : validate cache_41216_256 41216 =
    some 41472 := by
  decide +kernel
theorem checked_40960_512 : validate cache_40960_512 40960 =
    some 41472 := by
  exact validate_branch 256 cache_40960_256 cache_41216_256
    40960 41216 41472
    checked_40960_256 rfl checked_41216_256
theorem checked_41472_256 : validate cache_41472_256 41472 =
    some 41728 := by
  decide +kernel
theorem checked_41728_256 : validate cache_41728_256 41728 =
    some 41984 := by
  decide +kernel
theorem checked_41472_512 : validate cache_41472_512 41472 =
    some 41984 := by
  exact validate_branch 256 cache_41472_256 cache_41728_256
    41472 41728 41984
    checked_41472_256 rfl checked_41728_256
theorem checked_40960_1024 : validate cache_40960_1024 40960 =
    some 41984 := by
  exact validate_branch 512 cache_40960_512 cache_41472_512
    40960 41472 41984
    checked_40960_512 rfl checked_41472_512
theorem checked_41984_256 : validate cache_41984_256 41984 =
    some 42240 := by
  decide +kernel
theorem checked_42240_256 : validate cache_42240_256 42240 =
    some 42496 := by
  decide +kernel
theorem checked_41984_512 : validate cache_41984_512 41984 =
    some 42496 := by
  exact validate_branch 256 cache_41984_256 cache_42240_256
    41984 42240 42496
    checked_41984_256 rfl checked_42240_256
theorem checked_42496_256 : validate cache_42496_256 42496 =
    some 42752 := by
  decide +kernel
theorem checked_42752_256 : validate cache_42752_256 42752 =
    some 43008 := by
  decide +kernel
theorem checked_42496_512 : validate cache_42496_512 42496 =
    some 43008 := by
  exact validate_branch 256 cache_42496_256 cache_42752_256
    42496 42752 43008
    checked_42496_256 rfl checked_42752_256
theorem checked_41984_1024 : validate cache_41984_1024 41984 =
    some 43008 := by
  exact validate_branch 512 cache_41984_512 cache_42496_512
    41984 42496 43008
    checked_41984_512 rfl checked_42496_512
theorem checked_40960_2048 : validate cache_40960_2048 40960 =
    some 43008 := by
  exact validate_branch 1024 cache_40960_1024 cache_41984_1024
    40960 41984 43008
    checked_40960_1024 rfl checked_41984_1024
theorem checked_43008_256 : validate cache_43008_256 43008 =
    some 43264 := by
  decide +kernel
theorem checked_43264_256 : validate cache_43264_256 43264 =
    some 43520 := by
  decide +kernel
theorem checked_43008_512 : validate cache_43008_512 43008 =
    some 43520 := by
  exact validate_branch 256 cache_43008_256 cache_43264_256
    43008 43264 43520
    checked_43008_256 rfl checked_43264_256
theorem checked_43520_256 : validate cache_43520_256 43520 =
    some 43776 := by
  decide +kernel
theorem checked_43776_256 : validate cache_43776_256 43776 =
    some 44032 := by
  decide +kernel
theorem checked_43520_512 : validate cache_43520_512 43520 =
    some 44032 := by
  exact validate_branch 256 cache_43520_256 cache_43776_256
    43520 43776 44032
    checked_43520_256 rfl checked_43776_256
theorem checked_43008_1024 : validate cache_43008_1024 43008 =
    some 44032 := by
  exact validate_branch 512 cache_43008_512 cache_43520_512
    43008 43520 44032
    checked_43008_512 rfl checked_43520_512
theorem checked_44032_256 : validate cache_44032_256 44032 =
    some 44288 := by
  decide +kernel
theorem checked_44288_256 : validate cache_44288_256 44288 =
    some 44544 := by
  decide +kernel
theorem checked_44032_512 : validate cache_44032_512 44032 =
    some 44544 := by
  exact validate_branch 256 cache_44032_256 cache_44288_256
    44032 44288 44544
    checked_44032_256 rfl checked_44288_256
theorem checked_44544_256 : validate cache_44544_256 44544 =
    some 44800 := by
  decide +kernel
theorem checked_44800_256 : validate cache_44800_256 44800 =
    some 45056 := by
  decide +kernel
theorem checked_44544_512 : validate cache_44544_512 44544 =
    some 45056 := by
  exact validate_branch 256 cache_44544_256 cache_44800_256
    44544 44800 45056
    checked_44544_256 rfl checked_44800_256
theorem checked_44032_1024 : validate cache_44032_1024 44032 =
    some 45056 := by
  exact validate_branch 512 cache_44032_512 cache_44544_512
    44032 44544 45056
    checked_44032_512 rfl checked_44544_512
theorem checked_43008_2048 : validate cache_43008_2048 43008 =
    some 45056 := by
  exact validate_branch 1024 cache_43008_1024 cache_44032_1024
    43008 44032 45056
    checked_43008_1024 rfl checked_44032_1024
theorem checked_40960_4096 : validate cache_40960_4096 40960 =
    some 45056 := by
  exact validate_branch 2048 cache_40960_2048 cache_43008_2048
    40960 43008 45056
    checked_40960_2048 rfl checked_43008_2048
theorem checked_45056_256 : validate cache_45056_256 45056 =
    some 45312 := by
  decide +kernel
theorem checked_45312_256 : validate cache_45312_256 45312 =
    some 45568 := by
  decide +kernel
theorem checked_45056_512 : validate cache_45056_512 45056 =
    some 45568 := by
  exact validate_branch 256 cache_45056_256 cache_45312_256
    45056 45312 45568
    checked_45056_256 rfl checked_45312_256
theorem checked_45568_256 : validate cache_45568_256 45568 =
    some 45824 := by
  decide +kernel
theorem checked_45824_256 : validate cache_45824_256 45824 =
    some 46080 := by
  decide +kernel
theorem checked_45568_512 : validate cache_45568_512 45568 =
    some 46080 := by
  exact validate_branch 256 cache_45568_256 cache_45824_256
    45568 45824 46080
    checked_45568_256 rfl checked_45824_256
theorem checked_45056_1024 : validate cache_45056_1024 45056 =
    some 46080 := by
  exact validate_branch 512 cache_45056_512 cache_45568_512
    45056 45568 46080
    checked_45056_512 rfl checked_45568_512
theorem checked_46080_256 : validate cache_46080_256 46080 =
    some 46336 := by
  decide +kernel
theorem checked_46336_256 : validate cache_46336_256 46336 =
    some 46592 := by
  decide +kernel
theorem checked_46080_512 : validate cache_46080_512 46080 =
    some 46592 := by
  exact validate_branch 256 cache_46080_256 cache_46336_256
    46080 46336 46592
    checked_46080_256 rfl checked_46336_256
theorem checked_46592_256 : validate cache_46592_256 46592 =
    some 46848 := by
  decide +kernel
theorem checked_46848_256 : validate cache_46848_256 46848 =
    some 47104 := by
  decide +kernel
theorem checked_46592_512 : validate cache_46592_512 46592 =
    some 47104 := by
  exact validate_branch 256 cache_46592_256 cache_46848_256
    46592 46848 47104
    checked_46592_256 rfl checked_46848_256
theorem checked_46080_1024 : validate cache_46080_1024 46080 =
    some 47104 := by
  exact validate_branch 512 cache_46080_512 cache_46592_512
    46080 46592 47104
    checked_46080_512 rfl checked_46592_512
theorem checked_45056_2048 : validate cache_45056_2048 45056 =
    some 47104 := by
  exact validate_branch 1024 cache_45056_1024 cache_46080_1024
    45056 46080 47104
    checked_45056_1024 rfl checked_46080_1024
theorem checked_47104_256 : validate cache_47104_256 47104 =
    some 47360 := by
  decide +kernel
theorem checked_47360_256 : validate cache_47360_256 47360 =
    some 47616 := by
  decide +kernel
theorem checked_47104_512 : validate cache_47104_512 47104 =
    some 47616 := by
  exact validate_branch 256 cache_47104_256 cache_47360_256
    47104 47360 47616
    checked_47104_256 rfl checked_47360_256
theorem checked_47616_256 : validate cache_47616_256 47616 =
    some 47872 := by
  decide +kernel
theorem checked_47872_256 : validate cache_47872_256 47872 =
    some 48128 := by
  decide +kernel
theorem checked_47616_512 : validate cache_47616_512 47616 =
    some 48128 := by
  exact validate_branch 256 cache_47616_256 cache_47872_256
    47616 47872 48128
    checked_47616_256 rfl checked_47872_256
theorem checked_47104_1024 : validate cache_47104_1024 47104 =
    some 48128 := by
  exact validate_branch 512 cache_47104_512 cache_47616_512
    47104 47616 48128
    checked_47104_512 rfl checked_47616_512
theorem checked_48128_256 : validate cache_48128_256 48128 =
    some 48384 := by
  decide +kernel
theorem checked_48384_256 : validate cache_48384_256 48384 =
    some 48640 := by
  decide +kernel
theorem checked_48128_512 : validate cache_48128_512 48128 =
    some 48640 := by
  exact validate_branch 256 cache_48128_256 cache_48384_256
    48128 48384 48640
    checked_48128_256 rfl checked_48384_256
theorem checked_48640_256 : validate cache_48640_256 48640 =
    some 48896 := by
  decide +kernel
theorem checked_48896_256 : validate cache_48896_256 48896 =
    some 49152 := by
  decide +kernel
theorem checked_48640_512 : validate cache_48640_512 48640 =
    some 49152 := by
  exact validate_branch 256 cache_48640_256 cache_48896_256
    48640 48896 49152
    checked_48640_256 rfl checked_48896_256
theorem checked_48128_1024 : validate cache_48128_1024 48128 =
    some 49152 := by
  exact validate_branch 512 cache_48128_512 cache_48640_512
    48128 48640 49152
    checked_48128_512 rfl checked_48640_512
theorem checked_47104_2048 : validate cache_47104_2048 47104 =
    some 49152 := by
  exact validate_branch 1024 cache_47104_1024 cache_48128_1024
    47104 48128 49152
    checked_47104_1024 rfl checked_48128_1024
theorem checked_45056_4096 : validate cache_45056_4096 45056 =
    some 49152 := by
  exact validate_branch 2048 cache_45056_2048 cache_47104_2048
    45056 47104 49152
    checked_45056_2048 rfl checked_47104_2048
theorem checked_40960_8192 : validate cache_40960_8192 40960 =
    some 49152 := by
  exact validate_branch 4096 cache_40960_4096 cache_45056_4096
    40960 45056 49152
    checked_40960_4096 rfl checked_45056_4096
theorem checked_32768_16384 : validate cache_32768_16384 32768 =
    some 49152 := by
  exact validate_branch 8192 cache_32768_8192 cache_40960_8192
    32768 40960 49152
    checked_32768_8192 rfl checked_40960_8192
theorem checked_49152_256 : validate cache_49152_256 49152 =
    some 49408 := by
  decide +kernel
theorem checked_49408_256 : validate cache_49408_256 49408 =
    some 49664 := by
  decide +kernel
theorem checked_49152_512 : validate cache_49152_512 49152 =
    some 49664 := by
  exact validate_branch 256 cache_49152_256 cache_49408_256
    49152 49408 49664
    checked_49152_256 rfl checked_49408_256
theorem checked_49664_256 : validate cache_49664_256 49664 =
    some 49920 := by
  decide +kernel
theorem checked_49920_256 : validate cache_49920_256 49920 =
    some 50176 := by
  decide +kernel
theorem checked_49664_512 : validate cache_49664_512 49664 =
    some 50176 := by
  exact validate_branch 256 cache_49664_256 cache_49920_256
    49664 49920 50176
    checked_49664_256 rfl checked_49920_256
theorem checked_49152_1024 : validate cache_49152_1024 49152 =
    some 50176 := by
  exact validate_branch 512 cache_49152_512 cache_49664_512
    49152 49664 50176
    checked_49152_512 rfl checked_49664_512
theorem checked_50176_256 : validate cache_50176_256 50176 =
    some 50432 := by
  decide +kernel
theorem checked_50432_256 : validate cache_50432_256 50432 =
    some 50688 := by
  decide +kernel
theorem checked_50176_512 : validate cache_50176_512 50176 =
    some 50688 := by
  exact validate_branch 256 cache_50176_256 cache_50432_256
    50176 50432 50688
    checked_50176_256 rfl checked_50432_256
theorem checked_50688_256 : validate cache_50688_256 50688 =
    some 50944 := by
  decide +kernel
theorem checked_50944_256 : validate cache_50944_256 50944 =
    some 51200 := by
  decide +kernel
theorem checked_50688_512 : validate cache_50688_512 50688 =
    some 51200 := by
  exact validate_branch 256 cache_50688_256 cache_50944_256
    50688 50944 51200
    checked_50688_256 rfl checked_50944_256
theorem checked_50176_1024 : validate cache_50176_1024 50176 =
    some 51200 := by
  exact validate_branch 512 cache_50176_512 cache_50688_512
    50176 50688 51200
    checked_50176_512 rfl checked_50688_512
theorem checked_49152_2048 : validate cache_49152_2048 49152 =
    some 51200 := by
  exact validate_branch 1024 cache_49152_1024 cache_50176_1024
    49152 50176 51200
    checked_49152_1024 rfl checked_50176_1024
theorem checked_51200_256 : validate cache_51200_256 51200 =
    some 51456 := by
  decide +kernel
theorem checked_51456_256 : validate cache_51456_256 51456 =
    some 51712 := by
  decide +kernel
theorem checked_51200_512 : validate cache_51200_512 51200 =
    some 51712 := by
  exact validate_branch 256 cache_51200_256 cache_51456_256
    51200 51456 51712
    checked_51200_256 rfl checked_51456_256
theorem checked_51712_256 : validate cache_51712_256 51712 =
    some 51968 := by
  decide +kernel
theorem checked_51968_256 : validate cache_51968_256 51968 =
    some 52224 := by
  decide +kernel
theorem checked_51712_512 : validate cache_51712_512 51712 =
    some 52224 := by
  exact validate_branch 256 cache_51712_256 cache_51968_256
    51712 51968 52224
    checked_51712_256 rfl checked_51968_256
theorem checked_51200_1024 : validate cache_51200_1024 51200 =
    some 52224 := by
  exact validate_branch 512 cache_51200_512 cache_51712_512
    51200 51712 52224
    checked_51200_512 rfl checked_51712_512
theorem checked_52224_256 : validate cache_52224_256 52224 =
    some 52480 := by
  decide +kernel
theorem checked_52480_256 : validate cache_52480_256 52480 =
    some 52736 := by
  decide +kernel
theorem checked_52224_512 : validate cache_52224_512 52224 =
    some 52736 := by
  exact validate_branch 256 cache_52224_256 cache_52480_256
    52224 52480 52736
    checked_52224_256 rfl checked_52480_256
theorem checked_52736_256 : validate cache_52736_256 52736 =
    some 52992 := by
  decide +kernel
theorem checked_52992_256 : validate cache_52992_256 52992 =
    some 53248 := by
  decide +kernel
theorem checked_52736_512 : validate cache_52736_512 52736 =
    some 53248 := by
  exact validate_branch 256 cache_52736_256 cache_52992_256
    52736 52992 53248
    checked_52736_256 rfl checked_52992_256
theorem checked_52224_1024 : validate cache_52224_1024 52224 =
    some 53248 := by
  exact validate_branch 512 cache_52224_512 cache_52736_512
    52224 52736 53248
    checked_52224_512 rfl checked_52736_512
theorem checked_51200_2048 : validate cache_51200_2048 51200 =
    some 53248 := by
  exact validate_branch 1024 cache_51200_1024 cache_52224_1024
    51200 52224 53248
    checked_51200_1024 rfl checked_52224_1024
theorem checked_49152_4096 : validate cache_49152_4096 49152 =
    some 53248 := by
  exact validate_branch 2048 cache_49152_2048 cache_51200_2048
    49152 51200 53248
    checked_49152_2048 rfl checked_51200_2048
theorem checked_53248_256 : validate cache_53248_256 53248 =
    some 53504 := by
  decide +kernel
theorem checked_53504_256 : validate cache_53504_256 53504 =
    some 53760 := by
  decide +kernel
theorem checked_53248_512 : validate cache_53248_512 53248 =
    some 53760 := by
  exact validate_branch 256 cache_53248_256 cache_53504_256
    53248 53504 53760
    checked_53248_256 rfl checked_53504_256
theorem checked_53760_256 : validate cache_53760_256 53760 =
    some 54016 := by
  decide +kernel
theorem checked_54016_256 : validate cache_54016_256 54016 =
    some 54272 := by
  decide +kernel
theorem checked_53760_512 : validate cache_53760_512 53760 =
    some 54272 := by
  exact validate_branch 256 cache_53760_256 cache_54016_256
    53760 54016 54272
    checked_53760_256 rfl checked_54016_256
theorem checked_53248_1024 : validate cache_53248_1024 53248 =
    some 54272 := by
  exact validate_branch 512 cache_53248_512 cache_53760_512
    53248 53760 54272
    checked_53248_512 rfl checked_53760_512
theorem checked_54272_256 : validate cache_54272_256 54272 =
    some 54528 := by
  decide +kernel
theorem checked_54528_256 : validate cache_54528_256 54528 =
    some 54784 := by
  decide +kernel
theorem checked_54272_512 : validate cache_54272_512 54272 =
    some 54784 := by
  exact validate_branch 256 cache_54272_256 cache_54528_256
    54272 54528 54784
    checked_54272_256 rfl checked_54528_256
theorem checked_54784_256 : validate cache_54784_256 54784 =
    some 55040 := by
  decide +kernel
theorem checked_55040_256 : validate cache_55040_256 55040 =
    some 55296 := by
  decide +kernel
theorem checked_54784_512 : validate cache_54784_512 54784 =
    some 55296 := by
  exact validate_branch 256 cache_54784_256 cache_55040_256
    54784 55040 55296
    checked_54784_256 rfl checked_55040_256
theorem checked_54272_1024 : validate cache_54272_1024 54272 =
    some 55296 := by
  exact validate_branch 512 cache_54272_512 cache_54784_512
    54272 54784 55296
    checked_54272_512 rfl checked_54784_512
theorem checked_53248_2048 : validate cache_53248_2048 53248 =
    some 55296 := by
  exact validate_branch 1024 cache_53248_1024 cache_54272_1024
    53248 54272 55296
    checked_53248_1024 rfl checked_54272_1024
theorem checked_55296_256 : validate cache_55296_256 55296 =
    some 55552 := by
  decide +kernel
theorem checked_55552_256 : validate cache_55552_256 55552 =
    some 55808 := by
  decide +kernel
theorem checked_55296_512 : validate cache_55296_512 55296 =
    some 55808 := by
  exact validate_branch 256 cache_55296_256 cache_55552_256
    55296 55552 55808
    checked_55296_256 rfl checked_55552_256
theorem checked_55808_256 : validate cache_55808_256 55808 =
    some 56064 := by
  decide +kernel
theorem checked_56064_256 : validate cache_56064_256 56064 =
    some 56320 := by
  decide +kernel
theorem checked_55808_512 : validate cache_55808_512 55808 =
    some 56320 := by
  exact validate_branch 256 cache_55808_256 cache_56064_256
    55808 56064 56320
    checked_55808_256 rfl checked_56064_256
theorem checked_55296_1024 : validate cache_55296_1024 55296 =
    some 56320 := by
  exact validate_branch 512 cache_55296_512 cache_55808_512
    55296 55808 56320
    checked_55296_512 rfl checked_55808_512
theorem checked_56320_256 : validate cache_56320_256 56320 =
    some 56576 := by
  decide +kernel
theorem checked_56576_256 : validate cache_56576_256 56576 =
    some 56832 := by
  decide +kernel
theorem checked_56320_512 : validate cache_56320_512 56320 =
    some 56832 := by
  exact validate_branch 256 cache_56320_256 cache_56576_256
    56320 56576 56832
    checked_56320_256 rfl checked_56576_256
theorem checked_56832_256 : validate cache_56832_256 56832 =
    some 57088 := by
  decide +kernel
theorem checked_57088_256 : validate cache_57088_256 57088 =
    some 57344 := by
  decide +kernel
theorem checked_56832_512 : validate cache_56832_512 56832 =
    some 57344 := by
  exact validate_branch 256 cache_56832_256 cache_57088_256
    56832 57088 57344
    checked_56832_256 rfl checked_57088_256
theorem checked_56320_1024 : validate cache_56320_1024 56320 =
    some 57344 := by
  exact validate_branch 512 cache_56320_512 cache_56832_512
    56320 56832 57344
    checked_56320_512 rfl checked_56832_512
theorem checked_55296_2048 : validate cache_55296_2048 55296 =
    some 57344 := by
  exact validate_branch 1024 cache_55296_1024 cache_56320_1024
    55296 56320 57344
    checked_55296_1024 rfl checked_56320_1024
theorem checked_53248_4096 : validate cache_53248_4096 53248 =
    some 57344 := by
  exact validate_branch 2048 cache_53248_2048 cache_55296_2048
    53248 55296 57344
    checked_53248_2048 rfl checked_55296_2048
theorem checked_49152_8192 : validate cache_49152_8192 49152 =
    some 57344 := by
  exact validate_branch 4096 cache_49152_4096 cache_53248_4096
    49152 53248 57344
    checked_49152_4096 rfl checked_53248_4096
theorem checked_57344_256 : validate cache_57344_256 57344 =
    some 57600 := by
  decide +kernel
theorem checked_57600_256 : validate cache_57600_256 57600 =
    some 57856 := by
  decide +kernel
theorem checked_57344_512 : validate cache_57344_512 57344 =
    some 57856 := by
  exact validate_branch 256 cache_57344_256 cache_57600_256
    57344 57600 57856
    checked_57344_256 rfl checked_57600_256
theorem checked_57856_256 : validate cache_57856_256 57856 =
    some 58112 := by
  decide +kernel
theorem checked_58112_256 : validate cache_58112_256 58112 =
    some 58368 := by
  decide +kernel
theorem checked_57856_512 : validate cache_57856_512 57856 =
    some 58368 := by
  exact validate_branch 256 cache_57856_256 cache_58112_256
    57856 58112 58368
    checked_57856_256 rfl checked_58112_256
theorem checked_57344_1024 : validate cache_57344_1024 57344 =
    some 58368 := by
  exact validate_branch 512 cache_57344_512 cache_57856_512
    57344 57856 58368
    checked_57344_512 rfl checked_57856_512
theorem checked_58368_256 : validate cache_58368_256 58368 =
    some 58624 := by
  decide +kernel
theorem checked_58624_256 : validate cache_58624_256 58624 =
    some 58880 := by
  decide +kernel
theorem checked_58368_512 : validate cache_58368_512 58368 =
    some 58880 := by
  exact validate_branch 256 cache_58368_256 cache_58624_256
    58368 58624 58880
    checked_58368_256 rfl checked_58624_256
theorem checked_58880_256 : validate cache_58880_256 58880 =
    some 59136 := by
  decide +kernel
theorem checked_59136_256 : validate cache_59136_256 59136 =
    some 59392 := by
  decide +kernel
theorem checked_58880_512 : validate cache_58880_512 58880 =
    some 59392 := by
  exact validate_branch 256 cache_58880_256 cache_59136_256
    58880 59136 59392
    checked_58880_256 rfl checked_59136_256
theorem checked_58368_1024 : validate cache_58368_1024 58368 =
    some 59392 := by
  exact validate_branch 512 cache_58368_512 cache_58880_512
    58368 58880 59392
    checked_58368_512 rfl checked_58880_512
theorem checked_57344_2048 : validate cache_57344_2048 57344 =
    some 59392 := by
  exact validate_branch 1024 cache_57344_1024 cache_58368_1024
    57344 58368 59392
    checked_57344_1024 rfl checked_58368_1024
theorem checked_59392_256 : validate cache_59392_256 59392 =
    some 59648 := by
  decide +kernel
theorem checked_59648_256 : validate cache_59648_256 59648 =
    some 59904 := by
  decide +kernel
theorem checked_59392_512 : validate cache_59392_512 59392 =
    some 59904 := by
  exact validate_branch 256 cache_59392_256 cache_59648_256
    59392 59648 59904
    checked_59392_256 rfl checked_59648_256
theorem checked_59904_256 : validate cache_59904_256 59904 =
    some 60160 := by
  decide +kernel
theorem checked_60160_256 : validate cache_60160_256 60160 =
    some 60416 := by
  decide +kernel
theorem checked_59904_512 : validate cache_59904_512 59904 =
    some 60416 := by
  exact validate_branch 256 cache_59904_256 cache_60160_256
    59904 60160 60416
    checked_59904_256 rfl checked_60160_256
theorem checked_59392_1024 : validate cache_59392_1024 59392 =
    some 60416 := by
  exact validate_branch 512 cache_59392_512 cache_59904_512
    59392 59904 60416
    checked_59392_512 rfl checked_59904_512
theorem checked_60416_256 : validate cache_60416_256 60416 =
    some 60672 := by
  decide +kernel
theorem checked_60672_256 : validate cache_60672_256 60672 =
    some 60928 := by
  decide +kernel
theorem checked_60416_512 : validate cache_60416_512 60416 =
    some 60928 := by
  exact validate_branch 256 cache_60416_256 cache_60672_256
    60416 60672 60928
    checked_60416_256 rfl checked_60672_256
theorem checked_60928_256 : validate cache_60928_256 60928 =
    some 61184 := by
  decide +kernel
theorem checked_61184_256 : validate cache_61184_256 61184 =
    some 61440 := by
  decide +kernel
theorem checked_60928_512 : validate cache_60928_512 60928 =
    some 61440 := by
  exact validate_branch 256 cache_60928_256 cache_61184_256
    60928 61184 61440
    checked_60928_256 rfl checked_61184_256
theorem checked_60416_1024 : validate cache_60416_1024 60416 =
    some 61440 := by
  exact validate_branch 512 cache_60416_512 cache_60928_512
    60416 60928 61440
    checked_60416_512 rfl checked_60928_512
theorem checked_59392_2048 : validate cache_59392_2048 59392 =
    some 61440 := by
  exact validate_branch 1024 cache_59392_1024 cache_60416_1024
    59392 60416 61440
    checked_59392_1024 rfl checked_60416_1024
theorem checked_57344_4096 : validate cache_57344_4096 57344 =
    some 61440 := by
  exact validate_branch 2048 cache_57344_2048 cache_59392_2048
    57344 59392 61440
    checked_57344_2048 rfl checked_59392_2048
theorem checked_61440_256 : validate cache_61440_256 61440 =
    some 61696 := by
  decide +kernel
theorem checked_61696_256 : validate cache_61696_256 61696 =
    some 61952 := by
  decide +kernel
theorem checked_61440_512 : validate cache_61440_512 61440 =
    some 61952 := by
  exact validate_branch 256 cache_61440_256 cache_61696_256
    61440 61696 61952
    checked_61440_256 rfl checked_61696_256
theorem checked_61952_256 : validate cache_61952_256 61952 =
    some 62208 := by
  decide +kernel
theorem checked_62208_256 : validate cache_62208_256 62208 =
    some 62464 := by
  decide +kernel
theorem checked_61952_512 : validate cache_61952_512 61952 =
    some 62464 := by
  exact validate_branch 256 cache_61952_256 cache_62208_256
    61952 62208 62464
    checked_61952_256 rfl checked_62208_256
theorem checked_61440_1024 : validate cache_61440_1024 61440 =
    some 62464 := by
  exact validate_branch 512 cache_61440_512 cache_61952_512
    61440 61952 62464
    checked_61440_512 rfl checked_61952_512
theorem checked_62464_256 : validate cache_62464_256 62464 =
    some 62720 := by
  decide +kernel
theorem checked_62720_256 : validate cache_62720_256 62720 =
    some 62976 := by
  decide +kernel
theorem checked_62464_512 : validate cache_62464_512 62464 =
    some 62976 := by
  exact validate_branch 256 cache_62464_256 cache_62720_256
    62464 62720 62976
    checked_62464_256 rfl checked_62720_256
theorem checked_62976_256 : validate cache_62976_256 62976 =
    some 63232 := by
  decide +kernel
theorem checked_63232_256 : validate cache_63232_256 63232 =
    some 63488 := by
  decide +kernel
theorem checked_62976_512 : validate cache_62976_512 62976 =
    some 63488 := by
  exact validate_branch 256 cache_62976_256 cache_63232_256
    62976 63232 63488
    checked_62976_256 rfl checked_63232_256
theorem checked_62464_1024 : validate cache_62464_1024 62464 =
    some 63488 := by
  exact validate_branch 512 cache_62464_512 cache_62976_512
    62464 62976 63488
    checked_62464_512 rfl checked_62976_512
theorem checked_61440_2048 : validate cache_61440_2048 61440 =
    some 63488 := by
  exact validate_branch 1024 cache_61440_1024 cache_62464_1024
    61440 62464 63488
    checked_61440_1024 rfl checked_62464_1024
theorem checked_63488_256 : validate cache_63488_256 63488 =
    some 63744 := by
  decide +kernel
theorem checked_63744_256 : validate cache_63744_256 63744 =
    some 64000 := by
  decide +kernel
theorem checked_63488_512 : validate cache_63488_512 63488 =
    some 64000 := by
  exact validate_branch 256 cache_63488_256 cache_63744_256
    63488 63744 64000
    checked_63488_256 rfl checked_63744_256
theorem checked_64000_256 : validate cache_64000_256 64000 =
    some 64256 := by
  decide +kernel
theorem checked_64256_256 : validate cache_64256_256 64256 =
    some 64512 := by
  decide +kernel
theorem checked_64000_512 : validate cache_64000_512 64000 =
    some 64512 := by
  exact validate_branch 256 cache_64000_256 cache_64256_256
    64000 64256 64512
    checked_64000_256 rfl checked_64256_256
theorem checked_63488_1024 : validate cache_63488_1024 63488 =
    some 64512 := by
  exact validate_branch 512 cache_63488_512 cache_64000_512
    63488 64000 64512
    checked_63488_512 rfl checked_64000_512
theorem checked_64512_256 : validate cache_64512_256 64512 =
    some 64768 := by
  decide +kernel
theorem checked_64768_256 : validate cache_64768_256 64768 =
    some 65024 := by
  decide +kernel
theorem checked_64512_512 : validate cache_64512_512 64512 =
    some 65024 := by
  exact validate_branch 256 cache_64512_256 cache_64768_256
    64512 64768 65024
    checked_64512_256 rfl checked_64768_256
theorem checked_65024_256 : validate cache_65024_256 65024 =
    some 65280 := by
  decide +kernel
theorem checked_65280_256 : validate cache_65280_256 65280 =
    some 65536 := by
  decide +kernel
theorem checked_65024_512 : validate cache_65024_512 65024 =
    some 65536 := by
  exact validate_branch 256 cache_65024_256 cache_65280_256
    65024 65280 65536
    checked_65024_256 rfl checked_65280_256
theorem checked_64512_1024 : validate cache_64512_1024 64512 =
    some 65536 := by
  exact validate_branch 512 cache_64512_512 cache_65024_512
    64512 65024 65536
    checked_64512_512 rfl checked_65024_512
theorem checked_63488_2048 : validate cache_63488_2048 63488 =
    some 65536 := by
  exact validate_branch 1024 cache_63488_1024 cache_64512_1024
    63488 64512 65536
    checked_63488_1024 rfl checked_64512_1024
theorem checked_61440_4096 : validate cache_61440_4096 61440 =
    some 65536 := by
  exact validate_branch 2048 cache_61440_2048 cache_63488_2048
    61440 63488 65536
    checked_61440_2048 rfl checked_63488_2048
theorem checked_57344_8192 : validate cache_57344_8192 57344 =
    some 65536 := by
  exact validate_branch 4096 cache_57344_4096 cache_61440_4096
    57344 61440 65536
    checked_57344_4096 rfl checked_61440_4096
theorem checked_49152_16384 : validate cache_49152_16384 49152 =
    some 65536 := by
  exact validate_branch 8192 cache_49152_8192 cache_57344_8192
    49152 57344 65536
    checked_49152_8192 rfl checked_57344_8192
theorem checked_32768_32768 : validate cache_32768_32768 32768 =
    some 65536 := by
  exact validate_branch 16384 cache_32768_16384 cache_49152_16384
    32768 49152 65536
    checked_32768_16384 rfl checked_49152_16384
theorem checked_0_65536 : validate cache_0_65536 0 =
    some 65536 := by
  exact validate_branch 32768 cache_0_32768 cache_32768_32768
    0 32768 65536
    checked_0_32768 rfl checked_32768_32768

theorem checked : validate cache 0 = some 65536 := checked_0_65536

theorem count_exact : cache.count = 65536 := by
  have extent := validate_extent cache 0 65536 checked
  simpa only [Nat.zero_add] using extent.symm

theorem within_body : 65536 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 0 65536 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 0 65536 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 0 65536 address = observedPair address :=
  cachedPair_eq cache 0 65536 checked address

end LookupCache65536Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Numeric observation cache fidelity checked: 65536"
