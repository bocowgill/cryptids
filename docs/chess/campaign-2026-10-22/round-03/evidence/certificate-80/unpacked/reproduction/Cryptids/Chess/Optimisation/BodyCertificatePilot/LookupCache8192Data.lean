module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LookupCacheLoaders

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace LookupCache8192Pilot
noncomputable def cache_0_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/000000-0256.cache"
noncomputable def cache_256_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/000256-0256.cache"
noncomputable def cache_0_512 : Balanced.RowTree Cell :=
  .branch 256 cache_0_256 cache_256_256
noncomputable def cache_512_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/000512-0256.cache"
noncomputable def cache_768_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/000768-0256.cache"
noncomputable def cache_512_512 : Balanced.RowTree Cell :=
  .branch 256 cache_512_256 cache_768_256
noncomputable def cache_0_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_0_512 cache_512_512
noncomputable def cache_1024_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/001024-0256.cache"
noncomputable def cache_1280_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/001280-0256.cache"
noncomputable def cache_1024_512 : Balanced.RowTree Cell :=
  .branch 256 cache_1024_256 cache_1280_256
noncomputable def cache_1536_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/001536-0256.cache"
noncomputable def cache_1792_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/001792-0256.cache"
noncomputable def cache_1536_512 : Balanced.RowTree Cell :=
  .branch 256 cache_1536_256 cache_1792_256
noncomputable def cache_1024_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_1024_512 cache_1536_512
noncomputable def cache_0_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_0_1024 cache_1024_1024
noncomputable def cache_2048_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/002048-0256.cache"
noncomputable def cache_2304_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/002304-0256.cache"
noncomputable def cache_2048_512 : Balanced.RowTree Cell :=
  .branch 256 cache_2048_256 cache_2304_256
noncomputable def cache_2560_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/002560-0256.cache"
noncomputable def cache_2816_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/002816-0256.cache"
noncomputable def cache_2560_512 : Balanced.RowTree Cell :=
  .branch 256 cache_2560_256 cache_2816_256
noncomputable def cache_2048_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_2048_512 cache_2560_512
noncomputable def cache_3072_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/003072-0256.cache"
noncomputable def cache_3328_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/003328-0256.cache"
noncomputable def cache_3072_512 : Balanced.RowTree Cell :=
  .branch 256 cache_3072_256 cache_3328_256
noncomputable def cache_3584_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/003584-0256.cache"
noncomputable def cache_3840_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/003840-0256.cache"
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
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/004096-0256.cache"
noncomputable def cache_4352_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/004352-0256.cache"
noncomputable def cache_4096_512 : Balanced.RowTree Cell :=
  .branch 256 cache_4096_256 cache_4352_256
noncomputable def cache_4608_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/004608-0256.cache"
noncomputable def cache_4864_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/004864-0256.cache"
noncomputable def cache_4608_512 : Balanced.RowTree Cell :=
  .branch 256 cache_4608_256 cache_4864_256
noncomputable def cache_4096_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_4096_512 cache_4608_512
noncomputable def cache_5120_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/005120-0256.cache"
noncomputable def cache_5376_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/005376-0256.cache"
noncomputable def cache_5120_512 : Balanced.RowTree Cell :=
  .branch 256 cache_5120_256 cache_5376_256
noncomputable def cache_5632_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/005632-0256.cache"
noncomputable def cache_5888_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/005888-0256.cache"
noncomputable def cache_5632_512 : Balanced.RowTree Cell :=
  .branch 256 cache_5632_256 cache_5888_256
noncomputable def cache_5120_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_5120_512 cache_5632_512
noncomputable def cache_4096_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_4096_1024 cache_5120_1024
noncomputable def cache_6144_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/006144-0256.cache"
noncomputable def cache_6400_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/006400-0256.cache"
noncomputable def cache_6144_512 : Balanced.RowTree Cell :=
  .branch 256 cache_6144_256 cache_6400_256
noncomputable def cache_6656_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/006656-0256.cache"
noncomputable def cache_6912_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/006912-0256.cache"
noncomputable def cache_6656_512 : Balanced.RowTree Cell :=
  .branch 256 cache_6656_256 cache_6912_256
noncomputable def cache_6144_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_6144_512 cache_6656_512
noncomputable def cache_7168_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/007168-0256.cache"
noncomputable def cache_7424_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/007424-0256.cache"
noncomputable def cache_7168_512 : Balanced.RowTree Cell :=
  .branch 256 cache_7168_256 cache_7424_256
noncomputable def cache_7680_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/007680-0256.cache"
noncomputable def cache_7936_256 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lookup-cache-8192-chunks/007936-0256.cache"
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
noncomputable def cache : Balanced.RowTree Cell := cache_0_8192
end LookupCache8192Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Numeric observation cache data loaded: 8192"
