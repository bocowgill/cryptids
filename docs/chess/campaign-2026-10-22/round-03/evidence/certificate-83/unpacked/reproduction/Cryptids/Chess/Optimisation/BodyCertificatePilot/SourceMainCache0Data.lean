module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LookupCacheLoaders

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace SourceMainCache0Pilot
noncomputable def cache_0_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/000000-0256.cache"
noncomputable def cache_256_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/000256-0256.cache"
noncomputable def cache_0_512 : Balanced.RowTree Cell :=
  .branch 256 cache_0_256 cache_256_256
noncomputable def cache_512_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/000512-0256.cache"
noncomputable def cache_768_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/000768-0256.cache"
noncomputable def cache_512_512 : Balanced.RowTree Cell :=
  .branch 256 cache_512_256 cache_768_256
noncomputable def cache_0_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_0_512 cache_512_512
noncomputable def cache_1024_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/001024-0256.cache"
noncomputable def cache_1280_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/001280-0256.cache"
noncomputable def cache_1024_512 : Balanced.RowTree Cell :=
  .branch 256 cache_1024_256 cache_1280_256
noncomputable def cache_1536_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/001536-0256.cache"
noncomputable def cache_1792_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/001792-0256.cache"
noncomputable def cache_1536_512 : Balanced.RowTree Cell :=
  .branch 256 cache_1536_256 cache_1792_256
noncomputable def cache_1024_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_1024_512 cache_1536_512
noncomputable def cache_0_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_0_1024 cache_1024_1024
noncomputable def cache_2048_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/002048-0256.cache"
noncomputable def cache_2304_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/002304-0256.cache"
noncomputable def cache_2048_512 : Balanced.RowTree Cell :=
  .branch 256 cache_2048_256 cache_2304_256
noncomputable def cache_2560_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/002560-0256.cache"
noncomputable def cache_2816_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/002816-0256.cache"
noncomputable def cache_2560_512 : Balanced.RowTree Cell :=
  .branch 256 cache_2560_256 cache_2816_256
noncomputable def cache_2048_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_2048_512 cache_2560_512
noncomputable def cache_3072_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/003072-0256.cache"
noncomputable def cache_3328_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/003328-0256.cache"
noncomputable def cache_3072_512 : Balanced.RowTree Cell :=
  .branch 256 cache_3072_256 cache_3328_256
noncomputable def cache_3584_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/003584-0256.cache"
noncomputable def cache_3840_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/003840-0256.cache"
noncomputable def cache_3584_512 : Balanced.RowTree Cell :=
  .branch 256 cache_3584_256 cache_3840_256
noncomputable def cache_3072_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_3072_512 cache_3584_512
noncomputable def cache_2048_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_2048_1024 cache_3072_1024
noncomputable def cache_0_4096 : Balanced.RowTree Cell :=
  .branch 2048 cache_0_2048 cache_2048_2048
noncomputable def cache_4096_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/004096-0256.cache"
noncomputable def cache_4352_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/004352-0256.cache"
noncomputable def cache_4096_512 : Balanced.RowTree Cell :=
  .branch 256 cache_4096_256 cache_4352_256
noncomputable def cache_4608_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/004608-0256.cache"
noncomputable def cache_4864_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/004864-0256.cache"
noncomputable def cache_4608_512 : Balanced.RowTree Cell :=
  .branch 256 cache_4608_256 cache_4864_256
noncomputable def cache_4096_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_4096_512 cache_4608_512
noncomputable def cache_5120_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/005120-0256.cache"
noncomputable def cache_5376_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/005376-0256.cache"
noncomputable def cache_5120_512 : Balanced.RowTree Cell :=
  .branch 256 cache_5120_256 cache_5376_256
noncomputable def cache_5632_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/005632-0256.cache"
noncomputable def cache_5888_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/005888-0256.cache"
noncomputable def cache_5632_512 : Balanced.RowTree Cell :=
  .branch 256 cache_5632_256 cache_5888_256
noncomputable def cache_5120_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_5120_512 cache_5632_512
noncomputable def cache_4096_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_4096_1024 cache_5120_1024
noncomputable def cache_6144_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/006144-0256.cache"
noncomputable def cache_6400_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/006400-0256.cache"
noncomputable def cache_6144_512 : Balanced.RowTree Cell :=
  .branch 256 cache_6144_256 cache_6400_256
noncomputable def cache_6656_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/006656-0256.cache"
noncomputable def cache_6912_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/006912-0256.cache"
noncomputable def cache_6656_512 : Balanced.RowTree Cell :=
  .branch 256 cache_6656_256 cache_6912_256
noncomputable def cache_6144_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_6144_512 cache_6656_512
noncomputable def cache_7168_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/007168-0256.cache"
noncomputable def cache_7424_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/007424-0256.cache"
noncomputable def cache_7168_512 : Balanced.RowTree Cell :=
  .branch 256 cache_7168_256 cache_7424_256
noncomputable def cache_7680_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/007680-0256.cache"
noncomputable def cache_7936_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/007936-0256.cache"
noncomputable def cache_7680_512 : Balanced.RowTree Cell :=
  .branch 256 cache_7680_256 cache_7936_256
noncomputable def cache_7168_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_7168_512 cache_7680_512
noncomputable def cache_6144_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_6144_1024 cache_7168_1024
noncomputable def cache_4096_4096 : Balanced.RowTree Cell :=
  .branch 2048 cache_4096_2048 cache_6144_2048
noncomputable def cache_0_8192 : Balanced.RowTree Cell :=
  .branch 4096 cache_0_4096 cache_4096_4096
noncomputable def cache_8192_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/008192-0256.cache"
noncomputable def cache_8448_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/008448-0256.cache"
noncomputable def cache_8192_512 : Balanced.RowTree Cell :=
  .branch 256 cache_8192_256 cache_8448_256
noncomputable def cache_8704_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/008704-0256.cache"
noncomputable def cache_8960_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/008960-0256.cache"
noncomputable def cache_8704_512 : Balanced.RowTree Cell :=
  .branch 256 cache_8704_256 cache_8960_256
noncomputable def cache_8192_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_8192_512 cache_8704_512
noncomputable def cache_9216_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/009216-0256.cache"
noncomputable def cache_9472_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/009472-0256.cache"
noncomputable def cache_9216_512 : Balanced.RowTree Cell :=
  .branch 256 cache_9216_256 cache_9472_256
noncomputable def cache_9728_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/009728-0256.cache"
noncomputable def cache_9984_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/009984-0256.cache"
noncomputable def cache_9728_512 : Balanced.RowTree Cell :=
  .branch 256 cache_9728_256 cache_9984_256
noncomputable def cache_9216_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_9216_512 cache_9728_512
noncomputable def cache_8192_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_8192_1024 cache_9216_1024
noncomputable def cache_10240_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/010240-0256.cache"
noncomputable def cache_10496_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/010496-0256.cache"
noncomputable def cache_10240_512 : Balanced.RowTree Cell :=
  .branch 256 cache_10240_256 cache_10496_256
noncomputable def cache_10752_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/010752-0256.cache"
noncomputable def cache_11008_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/011008-0256.cache"
noncomputable def cache_10752_512 : Balanced.RowTree Cell :=
  .branch 256 cache_10752_256 cache_11008_256
noncomputable def cache_10240_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_10240_512 cache_10752_512
noncomputable def cache_11264_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/011264-0256.cache"
noncomputable def cache_11520_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/011520-0256.cache"
noncomputable def cache_11264_512 : Balanced.RowTree Cell :=
  .branch 256 cache_11264_256 cache_11520_256
noncomputable def cache_11776_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/011776-0256.cache"
noncomputable def cache_12032_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/012032-0256.cache"
noncomputable def cache_11776_512 : Balanced.RowTree Cell :=
  .branch 256 cache_11776_256 cache_12032_256
noncomputable def cache_11264_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_11264_512 cache_11776_512
noncomputable def cache_10240_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_10240_1024 cache_11264_1024
noncomputable def cache_8192_4096 : Balanced.RowTree Cell :=
  .branch 2048 cache_8192_2048 cache_10240_2048
noncomputable def cache_12288_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/012288-0256.cache"
noncomputable def cache_12544_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/012544-0256.cache"
noncomputable def cache_12288_512 : Balanced.RowTree Cell :=
  .branch 256 cache_12288_256 cache_12544_256
noncomputable def cache_12800_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/012800-0256.cache"
noncomputable def cache_13056_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/013056-0256.cache"
noncomputable def cache_12800_512 : Balanced.RowTree Cell :=
  .branch 256 cache_12800_256 cache_13056_256
noncomputable def cache_12288_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_12288_512 cache_12800_512
noncomputable def cache_13312_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/013312-0256.cache"
noncomputable def cache_13568_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/013568-0256.cache"
noncomputable def cache_13312_512 : Balanced.RowTree Cell :=
  .branch 256 cache_13312_256 cache_13568_256
noncomputable def cache_13824_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/013824-0256.cache"
noncomputable def cache_14080_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/014080-0256.cache"
noncomputable def cache_13824_512 : Balanced.RowTree Cell :=
  .branch 256 cache_13824_256 cache_14080_256
noncomputable def cache_13312_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_13312_512 cache_13824_512
noncomputable def cache_12288_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_12288_1024 cache_13312_1024
noncomputable def cache_14336_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/014336-0256.cache"
noncomputable def cache_14592_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/014592-0256.cache"
noncomputable def cache_14336_512 : Balanced.RowTree Cell :=
  .branch 256 cache_14336_256 cache_14592_256
noncomputable def cache_14848_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/014848-0256.cache"
noncomputable def cache_15104_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/015104-0256.cache"
noncomputable def cache_14848_512 : Balanced.RowTree Cell :=
  .branch 256 cache_14848_256 cache_15104_256
noncomputable def cache_14336_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_14336_512 cache_14848_512
noncomputable def cache_15360_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/015360-0256.cache"
noncomputable def cache_15616_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/015616-0256.cache"
noncomputable def cache_15360_512 : Balanced.RowTree Cell :=
  .branch 256 cache_15360_256 cache_15616_256
noncomputable def cache_15872_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/015872-0256.cache"
noncomputable def cache_16128_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/016128-0256.cache"
noncomputable def cache_15872_512 : Balanced.RowTree Cell :=
  .branch 256 cache_15872_256 cache_16128_256
noncomputable def cache_15360_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_15360_512 cache_15872_512
noncomputable def cache_14336_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_14336_1024 cache_15360_1024
noncomputable def cache_12288_4096 : Balanced.RowTree Cell :=
  .branch 2048 cache_12288_2048 cache_14336_2048
noncomputable def cache_8192_8192 : Balanced.RowTree Cell :=
  .branch 4096 cache_8192_4096 cache_12288_4096
noncomputable def cache_0_16384 : Balanced.RowTree Cell :=
  .branch 8192 cache_0_8192 cache_8192_8192
noncomputable def cache_16384_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/016384-0256.cache"
noncomputable def cache_16640_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/016640-0256.cache"
noncomputable def cache_16384_512 : Balanced.RowTree Cell :=
  .branch 256 cache_16384_256 cache_16640_256
noncomputable def cache_16896_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/016896-0256.cache"
noncomputable def cache_17152_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/017152-0256.cache"
noncomputable def cache_16896_512 : Balanced.RowTree Cell :=
  .branch 256 cache_16896_256 cache_17152_256
noncomputable def cache_16384_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_16384_512 cache_16896_512
noncomputable def cache_17408_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/017408-0256.cache"
noncomputable def cache_17664_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/017664-0256.cache"
noncomputable def cache_17408_512 : Balanced.RowTree Cell :=
  .branch 256 cache_17408_256 cache_17664_256
noncomputable def cache_17920_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/017920-0256.cache"
noncomputable def cache_18176_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/018176-0256.cache"
noncomputable def cache_17920_512 : Balanced.RowTree Cell :=
  .branch 256 cache_17920_256 cache_18176_256
noncomputable def cache_17408_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_17408_512 cache_17920_512
noncomputable def cache_16384_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_16384_1024 cache_17408_1024
noncomputable def cache_18432_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/018432-0256.cache"
noncomputable def cache_18688_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/018688-0256.cache"
noncomputable def cache_18432_512 : Balanced.RowTree Cell :=
  .branch 256 cache_18432_256 cache_18688_256
noncomputable def cache_18944_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/018944-0256.cache"
noncomputable def cache_19200_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/019200-0256.cache"
noncomputable def cache_18944_512 : Balanced.RowTree Cell :=
  .branch 256 cache_18944_256 cache_19200_256
noncomputable def cache_18432_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_18432_512 cache_18944_512
noncomputable def cache_19456_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/019456-0256.cache"
noncomputable def cache_19712_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/019712-0256.cache"
noncomputable def cache_19456_512 : Balanced.RowTree Cell :=
  .branch 256 cache_19456_256 cache_19712_256
noncomputable def cache_19968_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/019968-0256.cache"
noncomputable def cache_20224_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/020224-0256.cache"
noncomputable def cache_19968_512 : Balanced.RowTree Cell :=
  .branch 256 cache_19968_256 cache_20224_256
noncomputable def cache_19456_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_19456_512 cache_19968_512
noncomputable def cache_18432_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_18432_1024 cache_19456_1024
noncomputable def cache_16384_4096 : Balanced.RowTree Cell :=
  .branch 2048 cache_16384_2048 cache_18432_2048
noncomputable def cache_20480_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/020480-0256.cache"
noncomputable def cache_20736_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/020736-0256.cache"
noncomputable def cache_20480_512 : Balanced.RowTree Cell :=
  .branch 256 cache_20480_256 cache_20736_256
noncomputable def cache_20992_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/020992-0256.cache"
noncomputable def cache_21248_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/021248-0256.cache"
noncomputable def cache_20992_512 : Balanced.RowTree Cell :=
  .branch 256 cache_20992_256 cache_21248_256
noncomputable def cache_20480_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_20480_512 cache_20992_512
noncomputable def cache_21504_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/021504-0256.cache"
noncomputable def cache_21760_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/021760-0256.cache"
noncomputable def cache_21504_512 : Balanced.RowTree Cell :=
  .branch 256 cache_21504_256 cache_21760_256
noncomputable def cache_22016_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/022016-0256.cache"
noncomputable def cache_22272_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/022272-0256.cache"
noncomputable def cache_22016_512 : Balanced.RowTree Cell :=
  .branch 256 cache_22016_256 cache_22272_256
noncomputable def cache_21504_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_21504_512 cache_22016_512
noncomputable def cache_20480_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_20480_1024 cache_21504_1024
noncomputable def cache_22528_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/022528-0256.cache"
noncomputable def cache_22784_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/022784-0256.cache"
noncomputable def cache_22528_512 : Balanced.RowTree Cell :=
  .branch 256 cache_22528_256 cache_22784_256
noncomputable def cache_23040_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/023040-0256.cache"
noncomputable def cache_23296_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/023296-0256.cache"
noncomputable def cache_23040_512 : Balanced.RowTree Cell :=
  .branch 256 cache_23040_256 cache_23296_256
noncomputable def cache_22528_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_22528_512 cache_23040_512
noncomputable def cache_23552_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/023552-0256.cache"
noncomputable def cache_23808_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/023808-0256.cache"
noncomputable def cache_23552_512 : Balanced.RowTree Cell :=
  .branch 256 cache_23552_256 cache_23808_256
noncomputable def cache_24064_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/024064-0256.cache"
noncomputable def cache_24320_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/024320-0256.cache"
noncomputable def cache_24064_512 : Balanced.RowTree Cell :=
  .branch 256 cache_24064_256 cache_24320_256
noncomputable def cache_23552_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_23552_512 cache_24064_512
noncomputable def cache_22528_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_22528_1024 cache_23552_1024
noncomputable def cache_20480_4096 : Balanced.RowTree Cell :=
  .branch 2048 cache_20480_2048 cache_22528_2048
noncomputable def cache_16384_8192 : Balanced.RowTree Cell :=
  .branch 4096 cache_16384_4096 cache_20480_4096
noncomputable def cache_24576_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/024576-0256.cache"
noncomputable def cache_24832_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/024832-0256.cache"
noncomputable def cache_24576_512 : Balanced.RowTree Cell :=
  .branch 256 cache_24576_256 cache_24832_256
noncomputable def cache_25088_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/025088-0256.cache"
noncomputable def cache_25344_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/025344-0256.cache"
noncomputable def cache_25088_512 : Balanced.RowTree Cell :=
  .branch 256 cache_25088_256 cache_25344_256
noncomputable def cache_24576_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_24576_512 cache_25088_512
noncomputable def cache_25600_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/025600-0256.cache"
noncomputable def cache_25856_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/025856-0256.cache"
noncomputable def cache_25600_512 : Balanced.RowTree Cell :=
  .branch 256 cache_25600_256 cache_25856_256
noncomputable def cache_26112_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/026112-0256.cache"
noncomputable def cache_26368_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/026368-0256.cache"
noncomputable def cache_26112_512 : Balanced.RowTree Cell :=
  .branch 256 cache_26112_256 cache_26368_256
noncomputable def cache_25600_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_25600_512 cache_26112_512
noncomputable def cache_24576_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_24576_1024 cache_25600_1024
noncomputable def cache_26624_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/026624-0256.cache"
noncomputable def cache_26880_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/026880-0256.cache"
noncomputable def cache_26624_512 : Balanced.RowTree Cell :=
  .branch 256 cache_26624_256 cache_26880_256
noncomputable def cache_27136_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/027136-0256.cache"
noncomputable def cache_27392_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/027392-0256.cache"
noncomputable def cache_27136_512 : Balanced.RowTree Cell :=
  .branch 256 cache_27136_256 cache_27392_256
noncomputable def cache_26624_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_26624_512 cache_27136_512
noncomputable def cache_27648_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/027648-0256.cache"
noncomputable def cache_27904_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/027904-0256.cache"
noncomputable def cache_27648_512 : Balanced.RowTree Cell :=
  .branch 256 cache_27648_256 cache_27904_256
noncomputable def cache_28160_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/028160-0256.cache"
noncomputable def cache_28416_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/028416-0256.cache"
noncomputable def cache_28160_512 : Balanced.RowTree Cell :=
  .branch 256 cache_28160_256 cache_28416_256
noncomputable def cache_27648_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_27648_512 cache_28160_512
noncomputable def cache_26624_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_26624_1024 cache_27648_1024
noncomputable def cache_24576_4096 : Balanced.RowTree Cell :=
  .branch 2048 cache_24576_2048 cache_26624_2048
noncomputable def cache_28672_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/028672-0256.cache"
noncomputable def cache_28928_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/028928-0256.cache"
noncomputable def cache_28672_512 : Balanced.RowTree Cell :=
  .branch 256 cache_28672_256 cache_28928_256
noncomputable def cache_29184_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/029184-0256.cache"
noncomputable def cache_29440_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/029440-0256.cache"
noncomputable def cache_29184_512 : Balanced.RowTree Cell :=
  .branch 256 cache_29184_256 cache_29440_256
noncomputable def cache_28672_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_28672_512 cache_29184_512
noncomputable def cache_29696_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/029696-0256.cache"
noncomputable def cache_29952_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/029952-0256.cache"
noncomputable def cache_29696_512 : Balanced.RowTree Cell :=
  .branch 256 cache_29696_256 cache_29952_256
noncomputable def cache_30208_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/030208-0256.cache"
noncomputable def cache_30464_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/030464-0256.cache"
noncomputable def cache_30208_512 : Balanced.RowTree Cell :=
  .branch 256 cache_30208_256 cache_30464_256
noncomputable def cache_29696_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_29696_512 cache_30208_512
noncomputable def cache_28672_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_28672_1024 cache_29696_1024
noncomputable def cache_30720_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/030720-0256.cache"
noncomputable def cache_30976_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/030976-0256.cache"
noncomputable def cache_30720_512 : Balanced.RowTree Cell :=
  .branch 256 cache_30720_256 cache_30976_256
noncomputable def cache_31232_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/031232-0256.cache"
noncomputable def cache_31488_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/031488-0256.cache"
noncomputable def cache_31232_512 : Balanced.RowTree Cell :=
  .branch 256 cache_31232_256 cache_31488_256
noncomputable def cache_30720_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_30720_512 cache_31232_512
noncomputable def cache_31744_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/031744-0256.cache"
noncomputable def cache_32000_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/032000-0256.cache"
noncomputable def cache_31744_512 : Balanced.RowTree Cell :=
  .branch 256 cache_31744_256 cache_32000_256
noncomputable def cache_32256_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/032256-0256.cache"
noncomputable def cache_32512_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/032512-0256.cache"
noncomputable def cache_32256_512 : Balanced.RowTree Cell :=
  .branch 256 cache_32256_256 cache_32512_256
noncomputable def cache_31744_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_31744_512 cache_32256_512
noncomputable def cache_30720_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_30720_1024 cache_31744_1024
noncomputable def cache_28672_4096 : Balanced.RowTree Cell :=
  .branch 2048 cache_28672_2048 cache_30720_2048
noncomputable def cache_24576_8192 : Balanced.RowTree Cell :=
  .branch 4096 cache_24576_4096 cache_28672_4096
noncomputable def cache_16384_16384 : Balanced.RowTree Cell :=
  .branch 8192 cache_16384_8192 cache_24576_8192
noncomputable def cache_0_32768 : Balanced.RowTree Cell :=
  .branch 16384 cache_0_16384 cache_16384_16384
noncomputable def cache_32768_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/032768-0256.cache"
noncomputable def cache_33024_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/033024-0256.cache"
noncomputable def cache_32768_512 : Balanced.RowTree Cell :=
  .branch 256 cache_32768_256 cache_33024_256
noncomputable def cache_33280_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/033280-0256.cache"
noncomputable def cache_33536_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/033536-0256.cache"
noncomputable def cache_33280_512 : Balanced.RowTree Cell :=
  .branch 256 cache_33280_256 cache_33536_256
noncomputable def cache_32768_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_32768_512 cache_33280_512
noncomputable def cache_33792_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/033792-0256.cache"
noncomputable def cache_34048_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/034048-0256.cache"
noncomputable def cache_33792_512 : Balanced.RowTree Cell :=
  .branch 256 cache_33792_256 cache_34048_256
noncomputable def cache_34304_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/034304-0256.cache"
noncomputable def cache_34560_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/034560-0256.cache"
noncomputable def cache_34304_512 : Balanced.RowTree Cell :=
  .branch 256 cache_34304_256 cache_34560_256
noncomputable def cache_33792_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_33792_512 cache_34304_512
noncomputable def cache_32768_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_32768_1024 cache_33792_1024
noncomputable def cache_34816_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/034816-0256.cache"
noncomputable def cache_35072_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/035072-0256.cache"
noncomputable def cache_34816_512 : Balanced.RowTree Cell :=
  .branch 256 cache_34816_256 cache_35072_256
noncomputable def cache_35328_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/035328-0256.cache"
noncomputable def cache_35584_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/035584-0256.cache"
noncomputable def cache_35328_512 : Balanced.RowTree Cell :=
  .branch 256 cache_35328_256 cache_35584_256
noncomputable def cache_34816_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_34816_512 cache_35328_512
noncomputable def cache_35840_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/035840-0256.cache"
noncomputable def cache_36096_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/036096-0256.cache"
noncomputable def cache_35840_512 : Balanced.RowTree Cell :=
  .branch 256 cache_35840_256 cache_36096_256
noncomputable def cache_36352_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/036352-0256.cache"
noncomputable def cache_36608_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/036608-0256.cache"
noncomputable def cache_36352_512 : Balanced.RowTree Cell :=
  .branch 256 cache_36352_256 cache_36608_256
noncomputable def cache_35840_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_35840_512 cache_36352_512
noncomputable def cache_34816_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_34816_1024 cache_35840_1024
noncomputable def cache_32768_4096 : Balanced.RowTree Cell :=
  .branch 2048 cache_32768_2048 cache_34816_2048
noncomputable def cache_36864_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/036864-0256.cache"
noncomputable def cache_37120_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/037120-0256.cache"
noncomputable def cache_36864_512 : Balanced.RowTree Cell :=
  .branch 256 cache_36864_256 cache_37120_256
noncomputable def cache_37376_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/037376-0256.cache"
noncomputable def cache_37632_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/037632-0256.cache"
noncomputable def cache_37376_512 : Balanced.RowTree Cell :=
  .branch 256 cache_37376_256 cache_37632_256
noncomputable def cache_36864_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_36864_512 cache_37376_512
noncomputable def cache_37888_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/037888-0256.cache"
noncomputable def cache_38144_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/038144-0256.cache"
noncomputable def cache_37888_512 : Balanced.RowTree Cell :=
  .branch 256 cache_37888_256 cache_38144_256
noncomputable def cache_38400_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/038400-0256.cache"
noncomputable def cache_38656_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/038656-0256.cache"
noncomputable def cache_38400_512 : Balanced.RowTree Cell :=
  .branch 256 cache_38400_256 cache_38656_256
noncomputable def cache_37888_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_37888_512 cache_38400_512
noncomputable def cache_36864_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_36864_1024 cache_37888_1024
noncomputable def cache_38912_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/038912-0256.cache"
noncomputable def cache_39168_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/039168-0256.cache"
noncomputable def cache_38912_512 : Balanced.RowTree Cell :=
  .branch 256 cache_38912_256 cache_39168_256
noncomputable def cache_39424_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/039424-0256.cache"
noncomputable def cache_39680_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/039680-0256.cache"
noncomputable def cache_39424_512 : Balanced.RowTree Cell :=
  .branch 256 cache_39424_256 cache_39680_256
noncomputable def cache_38912_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_38912_512 cache_39424_512
noncomputable def cache_39936_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/039936-0256.cache"
noncomputable def cache_40192_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/040192-0256.cache"
noncomputable def cache_39936_512 : Balanced.RowTree Cell :=
  .branch 256 cache_39936_256 cache_40192_256
noncomputable def cache_40448_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/040448-0256.cache"
noncomputable def cache_40704_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/040704-0256.cache"
noncomputable def cache_40448_512 : Balanced.RowTree Cell :=
  .branch 256 cache_40448_256 cache_40704_256
noncomputable def cache_39936_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_39936_512 cache_40448_512
noncomputable def cache_38912_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_38912_1024 cache_39936_1024
noncomputable def cache_36864_4096 : Balanced.RowTree Cell :=
  .branch 2048 cache_36864_2048 cache_38912_2048
noncomputable def cache_32768_8192 : Balanced.RowTree Cell :=
  .branch 4096 cache_32768_4096 cache_36864_4096
noncomputable def cache_40960_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/040960-0256.cache"
noncomputable def cache_41216_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/041216-0256.cache"
noncomputable def cache_40960_512 : Balanced.RowTree Cell :=
  .branch 256 cache_40960_256 cache_41216_256
noncomputable def cache_41472_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/041472-0256.cache"
noncomputable def cache_41728_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/041728-0256.cache"
noncomputable def cache_41472_512 : Balanced.RowTree Cell :=
  .branch 256 cache_41472_256 cache_41728_256
noncomputable def cache_40960_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_40960_512 cache_41472_512
noncomputable def cache_41984_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/041984-0256.cache"
noncomputable def cache_42240_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/042240-0256.cache"
noncomputable def cache_41984_512 : Balanced.RowTree Cell :=
  .branch 256 cache_41984_256 cache_42240_256
noncomputable def cache_42496_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/042496-0256.cache"
noncomputable def cache_42752_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/042752-0256.cache"
noncomputable def cache_42496_512 : Balanced.RowTree Cell :=
  .branch 256 cache_42496_256 cache_42752_256
noncomputable def cache_41984_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_41984_512 cache_42496_512
noncomputable def cache_40960_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_40960_1024 cache_41984_1024
noncomputable def cache_43008_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/043008-0256.cache"
noncomputable def cache_43264_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/043264-0256.cache"
noncomputable def cache_43008_512 : Balanced.RowTree Cell :=
  .branch 256 cache_43008_256 cache_43264_256
noncomputable def cache_43520_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/043520-0256.cache"
noncomputable def cache_43776_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/043776-0256.cache"
noncomputable def cache_43520_512 : Balanced.RowTree Cell :=
  .branch 256 cache_43520_256 cache_43776_256
noncomputable def cache_43008_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_43008_512 cache_43520_512
noncomputable def cache_44032_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/044032-0256.cache"
noncomputable def cache_44288_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/044288-0256.cache"
noncomputable def cache_44032_512 : Balanced.RowTree Cell :=
  .branch 256 cache_44032_256 cache_44288_256
noncomputable def cache_44544_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/044544-0256.cache"
noncomputable def cache_44800_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/044800-0256.cache"
noncomputable def cache_44544_512 : Balanced.RowTree Cell :=
  .branch 256 cache_44544_256 cache_44800_256
noncomputable def cache_44032_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_44032_512 cache_44544_512
noncomputable def cache_43008_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_43008_1024 cache_44032_1024
noncomputable def cache_40960_4096 : Balanced.RowTree Cell :=
  .branch 2048 cache_40960_2048 cache_43008_2048
noncomputable def cache_45056_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/045056-0256.cache"
noncomputable def cache_45312_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/045312-0256.cache"
noncomputable def cache_45056_512 : Balanced.RowTree Cell :=
  .branch 256 cache_45056_256 cache_45312_256
noncomputable def cache_45568_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/045568-0256.cache"
noncomputable def cache_45824_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/045824-0256.cache"
noncomputable def cache_45568_512 : Balanced.RowTree Cell :=
  .branch 256 cache_45568_256 cache_45824_256
noncomputable def cache_45056_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_45056_512 cache_45568_512
noncomputable def cache_46080_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/046080-0256.cache"
noncomputable def cache_46336_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/046336-0256.cache"
noncomputable def cache_46080_512 : Balanced.RowTree Cell :=
  .branch 256 cache_46080_256 cache_46336_256
noncomputable def cache_46592_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/046592-0256.cache"
noncomputable def cache_46848_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/046848-0256.cache"
noncomputable def cache_46592_512 : Balanced.RowTree Cell :=
  .branch 256 cache_46592_256 cache_46848_256
noncomputable def cache_46080_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_46080_512 cache_46592_512
noncomputable def cache_45056_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_45056_1024 cache_46080_1024
noncomputable def cache_47104_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/047104-0256.cache"
noncomputable def cache_47360_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/047360-0256.cache"
noncomputable def cache_47104_512 : Balanced.RowTree Cell :=
  .branch 256 cache_47104_256 cache_47360_256
noncomputable def cache_47616_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/047616-0256.cache"
noncomputable def cache_47872_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/047872-0256.cache"
noncomputable def cache_47616_512 : Balanced.RowTree Cell :=
  .branch 256 cache_47616_256 cache_47872_256
noncomputable def cache_47104_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_47104_512 cache_47616_512
noncomputable def cache_48128_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/048128-0256.cache"
noncomputable def cache_48384_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/048384-0256.cache"
noncomputable def cache_48128_512 : Balanced.RowTree Cell :=
  .branch 256 cache_48128_256 cache_48384_256
noncomputable def cache_48640_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/048640-0256.cache"
noncomputable def cache_48896_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/048896-0256.cache"
noncomputable def cache_48640_512 : Balanced.RowTree Cell :=
  .branch 256 cache_48640_256 cache_48896_256
noncomputable def cache_48128_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_48128_512 cache_48640_512
noncomputable def cache_47104_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_47104_1024 cache_48128_1024
noncomputable def cache_45056_4096 : Balanced.RowTree Cell :=
  .branch 2048 cache_45056_2048 cache_47104_2048
noncomputable def cache_40960_8192 : Balanced.RowTree Cell :=
  .branch 4096 cache_40960_4096 cache_45056_4096
noncomputable def cache_32768_16384 : Balanced.RowTree Cell :=
  .branch 8192 cache_32768_8192 cache_40960_8192
noncomputable def cache_49152_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/049152-0256.cache"
noncomputable def cache_49408_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/049408-0256.cache"
noncomputable def cache_49152_512 : Balanced.RowTree Cell :=
  .branch 256 cache_49152_256 cache_49408_256
noncomputable def cache_49664_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/049664-0256.cache"
noncomputable def cache_49920_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/049920-0256.cache"
noncomputable def cache_49664_512 : Balanced.RowTree Cell :=
  .branch 256 cache_49664_256 cache_49920_256
noncomputable def cache_49152_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_49152_512 cache_49664_512
noncomputable def cache_50176_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/050176-0256.cache"
noncomputable def cache_50432_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/050432-0256.cache"
noncomputable def cache_50176_512 : Balanced.RowTree Cell :=
  .branch 256 cache_50176_256 cache_50432_256
noncomputable def cache_50688_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/050688-0256.cache"
noncomputable def cache_50944_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/050944-0256.cache"
noncomputable def cache_50688_512 : Balanced.RowTree Cell :=
  .branch 256 cache_50688_256 cache_50944_256
noncomputable def cache_50176_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_50176_512 cache_50688_512
noncomputable def cache_49152_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_49152_1024 cache_50176_1024
noncomputable def cache_51200_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/051200-0256.cache"
noncomputable def cache_51456_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/051456-0256.cache"
noncomputable def cache_51200_512 : Balanced.RowTree Cell :=
  .branch 256 cache_51200_256 cache_51456_256
noncomputable def cache_51712_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/051712-0256.cache"
noncomputable def cache_51968_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/051968-0256.cache"
noncomputable def cache_51712_512 : Balanced.RowTree Cell :=
  .branch 256 cache_51712_256 cache_51968_256
noncomputable def cache_51200_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_51200_512 cache_51712_512
noncomputable def cache_52224_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/052224-0256.cache"
noncomputable def cache_52480_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/052480-0256.cache"
noncomputable def cache_52224_512 : Balanced.RowTree Cell :=
  .branch 256 cache_52224_256 cache_52480_256
noncomputable def cache_52736_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/052736-0256.cache"
noncomputable def cache_52992_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/052992-0256.cache"
noncomputable def cache_52736_512 : Balanced.RowTree Cell :=
  .branch 256 cache_52736_256 cache_52992_256
noncomputable def cache_52224_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_52224_512 cache_52736_512
noncomputable def cache_51200_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_51200_1024 cache_52224_1024
noncomputable def cache_49152_4096 : Balanced.RowTree Cell :=
  .branch 2048 cache_49152_2048 cache_51200_2048
noncomputable def cache_53248_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/053248-0256.cache"
noncomputable def cache_53504_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/053504-0256.cache"
noncomputable def cache_53248_512 : Balanced.RowTree Cell :=
  .branch 256 cache_53248_256 cache_53504_256
noncomputable def cache_53760_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/053760-0256.cache"
noncomputable def cache_54016_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/054016-0256.cache"
noncomputable def cache_53760_512 : Balanced.RowTree Cell :=
  .branch 256 cache_53760_256 cache_54016_256
noncomputable def cache_53248_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_53248_512 cache_53760_512
noncomputable def cache_54272_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/054272-0256.cache"
noncomputable def cache_54528_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/054528-0256.cache"
noncomputable def cache_54272_512 : Balanced.RowTree Cell :=
  .branch 256 cache_54272_256 cache_54528_256
noncomputable def cache_54784_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/054784-0256.cache"
noncomputable def cache_55040_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/055040-0256.cache"
noncomputable def cache_54784_512 : Balanced.RowTree Cell :=
  .branch 256 cache_54784_256 cache_55040_256
noncomputable def cache_54272_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_54272_512 cache_54784_512
noncomputable def cache_53248_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_53248_1024 cache_54272_1024
noncomputable def cache_55296_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/055296-0256.cache"
noncomputable def cache_55552_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/055552-0256.cache"
noncomputable def cache_55296_512 : Balanced.RowTree Cell :=
  .branch 256 cache_55296_256 cache_55552_256
noncomputable def cache_55808_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/055808-0256.cache"
noncomputable def cache_56064_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/056064-0256.cache"
noncomputable def cache_55808_512 : Balanced.RowTree Cell :=
  .branch 256 cache_55808_256 cache_56064_256
noncomputable def cache_55296_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_55296_512 cache_55808_512
noncomputable def cache_56320_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/056320-0256.cache"
noncomputable def cache_56576_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/056576-0256.cache"
noncomputable def cache_56320_512 : Balanced.RowTree Cell :=
  .branch 256 cache_56320_256 cache_56576_256
noncomputable def cache_56832_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/056832-0256.cache"
noncomputable def cache_57088_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/057088-0256.cache"
noncomputable def cache_56832_512 : Balanced.RowTree Cell :=
  .branch 256 cache_56832_256 cache_57088_256
noncomputable def cache_56320_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_56320_512 cache_56832_512
noncomputable def cache_55296_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_55296_1024 cache_56320_1024
noncomputable def cache_53248_4096 : Balanced.RowTree Cell :=
  .branch 2048 cache_53248_2048 cache_55296_2048
noncomputable def cache_49152_8192 : Balanced.RowTree Cell :=
  .branch 4096 cache_49152_4096 cache_53248_4096
noncomputable def cache_57344_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/057344-0256.cache"
noncomputable def cache_57600_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/057600-0256.cache"
noncomputable def cache_57344_512 : Balanced.RowTree Cell :=
  .branch 256 cache_57344_256 cache_57600_256
noncomputable def cache_57856_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/057856-0256.cache"
noncomputable def cache_58112_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/058112-0256.cache"
noncomputable def cache_57856_512 : Balanced.RowTree Cell :=
  .branch 256 cache_57856_256 cache_58112_256
noncomputable def cache_57344_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_57344_512 cache_57856_512
noncomputable def cache_58368_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/058368-0256.cache"
noncomputable def cache_58624_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/058624-0256.cache"
noncomputable def cache_58368_512 : Balanced.RowTree Cell :=
  .branch 256 cache_58368_256 cache_58624_256
noncomputable def cache_58880_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/058880-0256.cache"
noncomputable def cache_59136_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/059136-0256.cache"
noncomputable def cache_58880_512 : Balanced.RowTree Cell :=
  .branch 256 cache_58880_256 cache_59136_256
noncomputable def cache_58368_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_58368_512 cache_58880_512
noncomputable def cache_57344_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_57344_1024 cache_58368_1024
noncomputable def cache_59392_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/059392-0256.cache"
noncomputable def cache_59648_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/059648-0256.cache"
noncomputable def cache_59392_512 : Balanced.RowTree Cell :=
  .branch 256 cache_59392_256 cache_59648_256
noncomputable def cache_59904_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/059904-0256.cache"
noncomputable def cache_60160_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/060160-0256.cache"
noncomputable def cache_59904_512 : Balanced.RowTree Cell :=
  .branch 256 cache_59904_256 cache_60160_256
noncomputable def cache_59392_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_59392_512 cache_59904_512
noncomputable def cache_60416_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/060416-0256.cache"
noncomputable def cache_60672_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/060672-0256.cache"
noncomputable def cache_60416_512 : Balanced.RowTree Cell :=
  .branch 256 cache_60416_256 cache_60672_256
noncomputable def cache_60928_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/060928-0256.cache"
noncomputable def cache_61184_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/061184-0256.cache"
noncomputable def cache_60928_512 : Balanced.RowTree Cell :=
  .branch 256 cache_60928_256 cache_61184_256
noncomputable def cache_60416_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_60416_512 cache_60928_512
noncomputable def cache_59392_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_59392_1024 cache_60416_1024
noncomputable def cache_57344_4096 : Balanced.RowTree Cell :=
  .branch 2048 cache_57344_2048 cache_59392_2048
noncomputable def cache_61440_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/061440-0256.cache"
noncomputable def cache_61696_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/061696-0256.cache"
noncomputable def cache_61440_512 : Balanced.RowTree Cell :=
  .branch 256 cache_61440_256 cache_61696_256
noncomputable def cache_61952_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/061952-0256.cache"
noncomputable def cache_62208_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/062208-0256.cache"
noncomputable def cache_61952_512 : Balanced.RowTree Cell :=
  .branch 256 cache_61952_256 cache_62208_256
noncomputable def cache_61440_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_61440_512 cache_61952_512
noncomputable def cache_62464_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/062464-0256.cache"
noncomputable def cache_62720_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/062720-0256.cache"
noncomputable def cache_62464_512 : Balanced.RowTree Cell :=
  .branch 256 cache_62464_256 cache_62720_256
noncomputable def cache_62976_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/062976-0256.cache"
noncomputable def cache_63232_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/063232-0256.cache"
noncomputable def cache_62976_512 : Balanced.RowTree Cell :=
  .branch 256 cache_62976_256 cache_63232_256
noncomputable def cache_62464_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_62464_512 cache_62976_512
noncomputable def cache_61440_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_61440_1024 cache_62464_1024
noncomputable def cache_63488_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/063488-0256.cache"
noncomputable def cache_63744_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/063744-0256.cache"
noncomputable def cache_63488_512 : Balanced.RowTree Cell :=
  .branch 256 cache_63488_256 cache_63744_256
noncomputable def cache_64000_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/064000-0256.cache"
noncomputable def cache_64256_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/064256-0256.cache"
noncomputable def cache_64000_512 : Balanced.RowTree Cell :=
  .branch 256 cache_64000_256 cache_64256_256
noncomputable def cache_63488_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_63488_512 cache_64000_512
noncomputable def cache_64512_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/064512-0256.cache"
noncomputable def cache_64768_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/064768-0256.cache"
noncomputable def cache_64512_512 : Balanced.RowTree Cell :=
  .branch 256 cache_64512_256 cache_64768_256
noncomputable def cache_65024_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/065024-0256.cache"
noncomputable def cache_65280_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-0-65536-chunks/065280-0256.cache"
noncomputable def cache_65024_512 : Balanced.RowTree Cell :=
  .branch 256 cache_65024_256 cache_65280_256
noncomputable def cache_64512_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_64512_512 cache_65024_512
noncomputable def cache_63488_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_63488_1024 cache_64512_1024
noncomputable def cache_61440_4096 : Balanced.RowTree Cell :=
  .branch 2048 cache_61440_2048 cache_63488_2048
noncomputable def cache_57344_8192 : Balanced.RowTree Cell :=
  .branch 4096 cache_57344_4096 cache_61440_4096
noncomputable def cache_49152_16384 : Balanced.RowTree Cell :=
  .branch 8192 cache_49152_8192 cache_57344_8192
noncomputable def cache_32768_32768 : Balanced.RowTree Cell :=
  .branch 16384 cache_32768_16384 cache_49152_16384
noncomputable def cache_0_65536 : Balanced.RowTree Cell :=
  .branch 32768 cache_0_32768 cache_32768_32768
noncomputable def cache : Balanced.RowTree Cell := cache_0_65536
end SourceMainCache0Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Numeric observation cache data loaded: 65536"
