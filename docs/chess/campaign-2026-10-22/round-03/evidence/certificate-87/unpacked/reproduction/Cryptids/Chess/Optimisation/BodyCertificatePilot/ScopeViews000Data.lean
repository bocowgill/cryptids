module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LookupCacheLoaders

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace SourceCache0Pilot
noncomputable def cache_0_6 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-0-6/000000-0006.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_0_6
end SourceCache0Pilot
open LookupCachePilot
namespace SourceCache1Pilot
noncomputable def cache_6_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-6-5/000006-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_6_5
end SourceCache1Pilot
open LookupCachePilot
namespace SourceCache2Pilot
noncomputable def cache_11_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-11-5/000011-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_11_5
end SourceCache2Pilot
open LookupCachePilot
namespace SourceCache3Pilot
noncomputable def cache_16_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-16-5/000016-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_16_5
end SourceCache3Pilot
open LookupCachePilot
namespace SourceCache4Pilot
noncomputable def cache_21_15 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-21-15/000021-0015.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_21_15
end SourceCache4Pilot
open LookupCachePilot
namespace SourceCache5Pilot
noncomputable def cache_36_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-36-5/000036-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_36_5
end SourceCache5Pilot
open LookupCachePilot
namespace SourceCache6Pilot
noncomputable def cache_41_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-41-5/000041-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_41_5
end SourceCache6Pilot
open LookupCachePilot
namespace SourceCache7Pilot
noncomputable def cache_46_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-46-5/000046-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_46_5
end SourceCache7Pilot
open LookupCachePilot
namespace SourceCache8Pilot
noncomputable def cache_51_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-51-5/000051-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_51_5
end SourceCache8Pilot
open LookupCachePilot
namespace SourceCache9Pilot
noncomputable def cache_56_15 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-56-15/000056-0015.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_56_15
end SourceCache9Pilot
open LookupCachePilot
namespace SourceCache10Pilot
noncomputable def cache_71_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-71-5/000071-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_71_5
end SourceCache10Pilot
open LookupCachePilot
namespace SourceCache11Pilot
noncomputable def cache_76_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-76-5/000076-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_76_5
end SourceCache11Pilot
open LookupCachePilot
namespace SourceCache12Pilot
noncomputable def cache_81_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-81-5/000081-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_81_5
end SourceCache12Pilot
open LookupCachePilot
namespace SourceCache13Pilot
noncomputable def cache_86_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-86-5/000086-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_86_5
end SourceCache13Pilot
open LookupCachePilot
namespace SourceCache14Pilot
noncomputable def cache_91_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-91-5/000091-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_91_5
end SourceCache14Pilot
open LookupCachePilot
namespace SourceCache15Pilot
noncomputable def cache_96_15 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-96-15/000096-0015.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_96_15
end SourceCache15Pilot
open LookupCachePilot
namespace SourceCache16Pilot
noncomputable def cache_111_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-111-5/000111-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_111_5
end SourceCache16Pilot
open LookupCachePilot
namespace SourceCache17Pilot
noncomputable def cache_116_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-116-5/000116-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_116_5
end SourceCache17Pilot
open LookupCachePilot
namespace SourceCache18Pilot
noncomputable def cache_121_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-121-5/000121-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_121_5
end SourceCache18Pilot
open LookupCachePilot
namespace SourceCache19Pilot
noncomputable def cache_126_15 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-126-15/000126-0015.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_126_15
end SourceCache19Pilot
open LookupCachePilot
namespace SourceCache20Pilot
noncomputable def cache_141_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-141-5/000141-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_141_5
end SourceCache20Pilot
open LookupCachePilot
namespace SourceCache21Pilot
noncomputable def cache_146_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-146-5/000146-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_146_5
end SourceCache21Pilot
open LookupCachePilot
namespace SourceCache22Pilot
noncomputable def cache_151_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-151-5/000151-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_151_5
end SourceCache22Pilot
open LookupCachePilot
namespace SourceCache23Pilot
noncomputable def cache_156_15 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-156-15/000156-0015.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_156_15
end SourceCache23Pilot
open LookupCachePilot
namespace SourceCache24Pilot
noncomputable def cache_171_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-171-5/000171-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_171_5
end SourceCache24Pilot
open LookupCachePilot
namespace SourceCache25Pilot
noncomputable def cache_176_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-176-5/000176-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_176_5
end SourceCache25Pilot
open LookupCachePilot
namespace SourceCache26Pilot
noncomputable def cache_181_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-181-5/000181-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_181_5
end SourceCache26Pilot
open LookupCachePilot
namespace SourceCache27Pilot
noncomputable def cache_186_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-186-5/000186-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_186_5
end SourceCache27Pilot
open LookupCachePilot
namespace SourceCache28Pilot
noncomputable def cache_191_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-191-5/000191-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_191_5
end SourceCache28Pilot
open LookupCachePilot
namespace SourceCache29Pilot
noncomputable def cache_196_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-196-5/000196-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_196_5
end SourceCache29Pilot
open LookupCachePilot
namespace SourceCache30Pilot
noncomputable def cache_201_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-201-5/000201-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_201_5
end SourceCache30Pilot
open LookupCachePilot
namespace SourceCache31Pilot
noncomputable def cache_206_15 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-206-15/000206-0015.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_206_15
end SourceCache31Pilot
open LookupCachePilot
namespace SourceCache32Pilot
noncomputable def cache_221_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-221-5/000221-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_221_5
end SourceCache32Pilot
open LookupCachePilot
namespace SourceCache33Pilot
noncomputable def cache_226_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-226-5/000226-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_226_5
end SourceCache33Pilot
open LookupCachePilot
namespace SourceCache34Pilot
noncomputable def cache_231_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-231-5/000231-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_231_5
end SourceCache34Pilot
open LookupCachePilot
namespace SourceCache35Pilot
noncomputable def cache_236_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-236-5/000236-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_236_5
end SourceCache35Pilot
open LookupCachePilot
namespace SourceCache36Pilot
noncomputable def cache_241_15 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-241-15/000241-0015.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_241_15
end SourceCache36Pilot
open LookupCachePilot
namespace SourceCache37Pilot
noncomputable def cache_256_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-256-5/000256-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_256_5
end SourceCache37Pilot
open LookupCachePilot
namespace SourceCache38Pilot
noncomputable def cache_261_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-261-5/000261-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_261_5
end SourceCache38Pilot
open LookupCachePilot
namespace SourceCache39Pilot
noncomputable def cache_266_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-266-5/000266-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_266_5
end SourceCache39Pilot
open LookupCachePilot
namespace SourceCache40Pilot
noncomputable def cache_271_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-271-5/000271-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_271_5
end SourceCache40Pilot
open LookupCachePilot
namespace SourceCache41Pilot
noncomputable def cache_276_15 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-276-15/000276-0015.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_276_15
end SourceCache41Pilot
open LookupCachePilot
namespace SourceCache42Pilot
noncomputable def cache_291_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-291-5/000291-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_291_5
end SourceCache42Pilot
open LookupCachePilot
namespace SourceCache43Pilot
noncomputable def cache_296_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-296-5/000296-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_296_5
end SourceCache43Pilot
open LookupCachePilot
namespace SourceCache44Pilot
noncomputable def cache_301_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-301-5/000301-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_301_5
end SourceCache44Pilot
open LookupCachePilot
namespace SourceCache45Pilot
noncomputable def cache_306_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-306-5/000306-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_306_5
end SourceCache45Pilot
open LookupCachePilot
namespace SourceCache46Pilot
noncomputable def cache_311_15 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-311-15/000311-0015.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_311_15
end SourceCache46Pilot
open LookupCachePilot
namespace SourceCache47Pilot
noncomputable def cache_326_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-326-5/000326-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_326_5
end SourceCache47Pilot
open LookupCachePilot
namespace SourceCache48Pilot
noncomputable def cache_331_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-331-5/000331-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_331_5
end SourceCache48Pilot
open LookupCachePilot
namespace SourceCache49Pilot
noncomputable def cache_336_15 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-336-15/000336-0015.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_336_15
end SourceCache49Pilot
open LookupCachePilot
namespace SourceCache50Pilot
noncomputable def cache_351_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-351-5/000351-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_351_5
end SourceCache50Pilot
open LookupCachePilot
namespace SourceCache51Pilot
noncomputable def cache_356_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-356-5/000356-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_356_5
end SourceCache51Pilot
open LookupCachePilot
namespace SourceCache52Pilot
noncomputable def cache_361_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-361-5/000361-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_361_5
end SourceCache52Pilot
open LookupCachePilot
namespace SourceCache53Pilot
noncomputable def cache_366_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-366-5/000366-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_366_5
end SourceCache53Pilot
open LookupCachePilot
namespace SourceCache54Pilot
noncomputable def cache_371_15 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-371-15/000371-0015.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_371_15
end SourceCache54Pilot
open LookupCachePilot
namespace SourceCache55Pilot
noncomputable def cache_386_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-386-5/000386-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_386_5
end SourceCache55Pilot
open LookupCachePilot
namespace SourceCache56Pilot
noncomputable def cache_391_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-391-5/000391-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_391_5
end SourceCache56Pilot
open LookupCachePilot
namespace SourceCache57Pilot
noncomputable def cache_396_15 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-396-15/000396-0015.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_396_15
end SourceCache57Pilot
open LookupCachePilot
namespace SourceCache58Pilot
noncomputable def cache_411_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-411-5/000411-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_411_5
end SourceCache58Pilot
open LookupCachePilot
namespace SourceCache59Pilot
noncomputable def cache_416_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-416-5/000416-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_416_5
end SourceCache59Pilot
open LookupCachePilot
namespace SourceCache60Pilot
noncomputable def cache_421_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-421-5/000421-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_421_5
end SourceCache60Pilot
open LookupCachePilot
namespace SourceCache61Pilot
noncomputable def cache_426_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-426-5/000426-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_426_5
end SourceCache61Pilot
open LookupCachePilot
namespace SourceCache62Pilot
noncomputable def cache_431_15 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-431-15/000431-0015.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_431_15
end SourceCache62Pilot
open LookupCachePilot
namespace SourceCache63Pilot
noncomputable def cache_446_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-446-5/000446-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_446_5
end SourceCache63Pilot
open LookupCachePilot
namespace SourceCache64Pilot
noncomputable def cache_451_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-451-5/000451-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_451_5
end SourceCache64Pilot
open LookupCachePilot
namespace SourceCache65Pilot
noncomputable def cache_456_15 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-456-15/000456-0015.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_456_15
end SourceCache65Pilot
open LookupCachePilot
namespace SourceCache66Pilot
noncomputable def cache_471_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-471-5/000471-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_471_5
end SourceCache66Pilot
open LookupCachePilot
namespace SourceCache67Pilot
noncomputable def cache_476_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-476-5/000476-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_476_5
end SourceCache67Pilot
open LookupCachePilot
namespace SourceCache68Pilot
noncomputable def cache_481_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-481-5/000481-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_481_5
end SourceCache68Pilot
open LookupCachePilot
namespace SourceCache69Pilot
noncomputable def cache_486_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-486-5/000486-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_486_5
end SourceCache69Pilot
open LookupCachePilot
namespace SourceCache70Pilot
noncomputable def cache_491_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-491-5/000491-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_491_5
end SourceCache70Pilot
open LookupCachePilot
namespace SourceCache71Pilot
noncomputable def cache_496_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-496-5/000496-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_496_5
end SourceCache71Pilot
open LookupCachePilot
namespace SourceCache72Pilot
noncomputable def cache_501_15 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-501-15/000501-0015.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_501_15
end SourceCache72Pilot
open LookupCachePilot
namespace SourceCache73Pilot
noncomputable def cache_516_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-516-5/000516-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_516_5
end SourceCache73Pilot
open LookupCachePilot
namespace SourceCache74Pilot
noncomputable def cache_521_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-521-5/000521-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_521_5
end SourceCache74Pilot
open LookupCachePilot
namespace SourceCache75Pilot
noncomputable def cache_526_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-526-5/000526-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_526_5
end SourceCache75Pilot
open LookupCachePilot
namespace SourceCache76Pilot
noncomputable def cache_531_15 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-531-15/000531-0015.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_531_15
end SourceCache76Pilot
open LookupCachePilot
namespace SourceCache77Pilot
noncomputable def cache_546_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-546-5/000546-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_546_5
end SourceCache77Pilot
open LookupCachePilot
namespace SourceCache78Pilot
noncomputable def cache_551_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-551-5/000551-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_551_5
end SourceCache78Pilot
open LookupCachePilot
namespace SourceCache79Pilot
noncomputable def cache_556_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-556-5/000556-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_556_5
end SourceCache79Pilot
open LookupCachePilot
namespace SourceCache80Pilot
noncomputable def cache_561_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-561-5/000561-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_561_5
end SourceCache80Pilot
open LookupCachePilot
namespace SourceCache81Pilot
noncomputable def cache_566_15 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-566-15/000566-0015.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_566_15
end SourceCache81Pilot
open LookupCachePilot
namespace SourceCache82Pilot
noncomputable def cache_581_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-581-5/000581-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_581_5
end SourceCache82Pilot
open LookupCachePilot
namespace SourceCache83Pilot
noncomputable def cache_586_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-586-5/000586-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_586_5
end SourceCache83Pilot
open LookupCachePilot
namespace SourceCache84Pilot
noncomputable def cache_591_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-591-5/000591-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_591_5
end SourceCache84Pilot
open LookupCachePilot
namespace SourceCache85Pilot
noncomputable def cache_596_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-596-5/000596-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_596_5
end SourceCache85Pilot
open LookupCachePilot
namespace SourceCache86Pilot
noncomputable def cache_601_15 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-601-15/000601-0015.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_601_15
end SourceCache86Pilot
open LookupCachePilot
namespace SourceCache87Pilot
noncomputable def cache_616_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-616-5/000616-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_616_5
end SourceCache87Pilot
open LookupCachePilot
namespace SourceCache88Pilot
noncomputable def cache_621_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-621-5/000621-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_621_5
end SourceCache88Pilot
open LookupCachePilot
namespace SourceCache89Pilot
noncomputable def cache_626_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-626-5/000626-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_626_5
end SourceCache89Pilot
open LookupCachePilot
namespace SourceCache90Pilot
noncomputable def cache_631_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-631-5/000631-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_631_5
end SourceCache90Pilot
open LookupCachePilot
namespace SourceCache91Pilot
noncomputable def cache_636_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-636-5/000636-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_636_5
end SourceCache91Pilot
open LookupCachePilot
namespace SourceCache92Pilot
noncomputable def cache_641_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-641-5/000641-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_641_5
end SourceCache92Pilot
open LookupCachePilot
namespace SourceCache93Pilot
noncomputable def cache_646_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-646-5/000646-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_646_5
end SourceCache93Pilot
open LookupCachePilot
namespace SourceCache94Pilot
noncomputable def cache_651_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-651-5/000651-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_651_5
end SourceCache94Pilot
open LookupCachePilot
namespace SourceCache95Pilot
noncomputable def cache_656_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-656-5/000656-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_656_5
end SourceCache95Pilot
open LookupCachePilot
namespace SourceCache96Pilot
noncomputable def cache_661_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-661-5/000661-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_661_5
end SourceCache96Pilot
open LookupCachePilot
namespace SourceCache97Pilot
noncomputable def cache_666_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-666-5/000666-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_666_5
end SourceCache97Pilot
open LookupCachePilot
namespace SourceCache98Pilot
noncomputable def cache_671_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-671-5/000671-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_671_5
end SourceCache98Pilot
open LookupCachePilot
namespace SourceCache99Pilot
noncomputable def cache_676_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-676-5/000676-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_676_5
end SourceCache99Pilot
open LookupCachePilot
namespace SourceCache100Pilot
noncomputable def cache_681_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-681-5/000681-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_681_5
end SourceCache100Pilot
open LookupCachePilot
namespace SourceCache101Pilot
noncomputable def cache_686_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-686-5/000686-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_686_5
end SourceCache101Pilot
open LookupCachePilot
namespace SourceCache102Pilot
noncomputable def cache_691_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-691-5/000691-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_691_5
end SourceCache102Pilot
open LookupCachePilot
namespace SourceCache103Pilot
noncomputable def cache_696_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-696-5/000696-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_696_5
end SourceCache103Pilot
open LookupCachePilot
namespace SourceCache104Pilot
noncomputable def cache_701_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-701-5/000701-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_701_5
end SourceCache104Pilot
open LookupCachePilot
namespace SourceCache105Pilot
noncomputable def cache_706_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-706-5/000706-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_706_5
end SourceCache105Pilot
open LookupCachePilot
namespace SourceCache106Pilot
noncomputable def cache_711_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-711-5/000711-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_711_5
end SourceCache106Pilot
open LookupCachePilot
namespace SourceCache107Pilot
noncomputable def cache_716_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-716-5/000716-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_716_5
end SourceCache107Pilot
open LookupCachePilot
namespace SourceCache108Pilot
noncomputable def cache_721_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-721-5/000721-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_721_5
end SourceCache108Pilot
open LookupCachePilot
namespace SourceCache109Pilot
noncomputable def cache_726_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-726-5/000726-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_726_5
end SourceCache109Pilot
open LookupCachePilot
namespace SourceCache110Pilot
noncomputable def cache_731_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-731-5/000731-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_731_5
end SourceCache110Pilot
open LookupCachePilot
namespace SourceCache111Pilot
noncomputable def cache_736_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-736-5/000736-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_736_5
end SourceCache111Pilot
open LookupCachePilot
namespace SourceCache112Pilot
noncomputable def cache_741_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-741-5/000741-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_741_5
end SourceCache112Pilot
open LookupCachePilot
namespace SourceCache113Pilot
noncomputable def cache_746_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-746-5/000746-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_746_5
end SourceCache113Pilot
open LookupCachePilot
namespace SourceCache114Pilot
noncomputable def cache_751_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-751-5/000751-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_751_5
end SourceCache114Pilot
open LookupCachePilot
namespace SourceCache115Pilot
noncomputable def cache_756_15 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-756-15/000756-0015.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_756_15
end SourceCache115Pilot
open LookupCachePilot
namespace SourceCache116Pilot
noncomputable def cache_771_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-771-5/000771-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_771_5
end SourceCache116Pilot
open LookupCachePilot
namespace SourceCache117Pilot
noncomputable def cache_776_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-776-5/000776-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_776_5
end SourceCache117Pilot
open LookupCachePilot
namespace SourceCache118Pilot
noncomputable def cache_781_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-781-5/000781-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_781_5
end SourceCache118Pilot
open LookupCachePilot
namespace SourceCache119Pilot
noncomputable def cache_786_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-786-5/000786-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_786_5
end SourceCache119Pilot
open LookupCachePilot
namespace SourceCache120Pilot
noncomputable def cache_791_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-791-5/000791-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_791_5
end SourceCache120Pilot
open LookupCachePilot
namespace SourceCache121Pilot
noncomputable def cache_796_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-796-5/000796-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_796_5
end SourceCache121Pilot
open LookupCachePilot
namespace SourceCache122Pilot
noncomputable def cache_801_15 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-801-15/000801-0015.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_801_15
end SourceCache122Pilot
open LookupCachePilot
namespace SourceCache123Pilot
noncomputable def cache_816_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-816-5/000816-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_816_5
end SourceCache123Pilot
open LookupCachePilot
namespace SourceCache124Pilot
noncomputable def cache_821_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-821-5/000821-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_821_5
end SourceCache124Pilot
open LookupCachePilot
namespace SourceCache125Pilot
noncomputable def cache_826_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-826-5/000826-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_826_5
end SourceCache125Pilot
open LookupCachePilot
namespace SourceCache126Pilot
noncomputable def cache_831_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-831-5/000831-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_831_5
end SourceCache126Pilot
open LookupCachePilot
namespace SourceCache127Pilot
noncomputable def cache_836_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-836-5/000836-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_836_5
end SourceCache127Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Batched operation-local cache data loaded"
