module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LookupCacheLoaders

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace SourceCache444Pilot
noncomputable def cache_33561_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-33561-670/033561-0167.cache"
noncomputable def cache_33728_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-33561-670/033728-0168.cache"
noncomputable def cache_33561_335 : Balanced.RowTree Cell :=
  .branch 167 cache_33561_167 cache_33728_168
noncomputable def cache_33896_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-33561-670/033896-0167.cache"
noncomputable def cache_34063_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-33561-670/034063-0168.cache"
noncomputable def cache_33896_335 : Balanced.RowTree Cell :=
  .branch 167 cache_33896_167 cache_34063_168
noncomputable def cache_33561_670 : Balanced.RowTree Cell :=
  .branch 335 cache_33561_335 cache_33896_335
noncomputable def cache : Balanced.RowTree Cell := cache_33561_670
end SourceCache444Pilot
open LookupCachePilot
namespace SourceCache445Pilot
noncomputable def cache_34231_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-34231-670/034231-0167.cache"
noncomputable def cache_34398_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-34231-670/034398-0168.cache"
noncomputable def cache_34231_335 : Balanced.RowTree Cell :=
  .branch 167 cache_34231_167 cache_34398_168
noncomputable def cache_34566_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-34231-670/034566-0167.cache"
noncomputable def cache_34733_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-34231-670/034733-0168.cache"
noncomputable def cache_34566_335 : Balanced.RowTree Cell :=
  .branch 167 cache_34566_167 cache_34733_168
noncomputable def cache_34231_670 : Balanced.RowTree Cell :=
  .branch 335 cache_34231_335 cache_34566_335
noncomputable def cache : Balanced.RowTree Cell := cache_34231_670
end SourceCache445Pilot
open LookupCachePilot
namespace SourceCache446Pilot
noncomputable def cache_34901_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-34901-5/034901-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_34901_5
end SourceCache446Pilot
open LookupCachePilot
namespace SourceCache447Pilot
noncomputable def cache_34906_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-34906-70/034906-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_34906_70
end SourceCache447Pilot
open LookupCachePilot
namespace SourceCache448Pilot
noncomputable def cache_34976_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-34976-670/034976-0167.cache"
noncomputable def cache_35143_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-34976-670/035143-0168.cache"
noncomputable def cache_34976_335 : Balanced.RowTree Cell :=
  .branch 167 cache_34976_167 cache_35143_168
noncomputable def cache_35311_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-34976-670/035311-0167.cache"
noncomputable def cache_35478_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-34976-670/035478-0168.cache"
noncomputable def cache_35311_335 : Balanced.RowTree Cell :=
  .branch 167 cache_35311_167 cache_35478_168
noncomputable def cache_34976_670 : Balanced.RowTree Cell :=
  .branch 335 cache_34976_335 cache_35311_335
noncomputable def cache : Balanced.RowTree Cell := cache_34976_670
end SourceCache448Pilot
open LookupCachePilot
namespace SourceCache449Pilot
noncomputable def cache_35646_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-35646-5/035646-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_35646_5
end SourceCache449Pilot
open LookupCachePilot
namespace SourceCache450Pilot
noncomputable def cache_35651_10 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-35651-10/035651-0010.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_35651_10
end SourceCache450Pilot
open LookupCachePilot
namespace SourceCache451Pilot
noncomputable def cache_35661_185 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-35661-370/035661-0185.cache"
noncomputable def cache_35846_185 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-35661-370/035846-0185.cache"
noncomputable def cache_35661_370 : Balanced.RowTree Cell :=
  .branch 185 cache_35661_185 cache_35846_185
noncomputable def cache : Balanced.RowTree Cell := cache_35661_370
end SourceCache451Pilot
open LookupCachePilot
namespace SourceCache452Pilot
noncomputable def cache_36031_220 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-36031-440/036031-0220.cache"
noncomputable def cache_36251_220 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-36031-440/036251-0220.cache"
noncomputable def cache_36031_440 : Balanced.RowTree Cell :=
  .branch 220 cache_36031_220 cache_36251_220
noncomputable def cache : Balanced.RowTree Cell := cache_36031_440
end SourceCache452Pilot
open LookupCachePilot
namespace SourceCache453Pilot
noncomputable def cache_36471_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-36471-70/036471-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_36471_70
end SourceCache453Pilot
open LookupCachePilot
namespace SourceCache454Pilot
noncomputable def cache_36541_195 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-36541-195/036541-0195.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_36541_195
end SourceCache454Pilot
open LookupCachePilot
namespace SourceCache455Pilot
noncomputable def cache_36736_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-36736-70/036736-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_36736_70
end SourceCache455Pilot
open LookupCachePilot
namespace SourceCache456Pilot
noncomputable def cache_36806_200 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-36806-400/036806-0200.cache"
noncomputable def cache_37006_200 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-36806-400/037006-0200.cache"
noncomputable def cache_36806_400 : Balanced.RowTree Cell :=
  .branch 200 cache_36806_200 cache_37006_200
noncomputable def cache : Balanced.RowTree Cell := cache_36806_400
end SourceCache456Pilot
open LookupCachePilot
namespace SourceCache457Pilot
noncomputable def cache_37206_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-37206-5/037206-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_37206_5
end SourceCache457Pilot
open LookupCachePilot
namespace SourceCache458Pilot
noncomputable def cache_37211_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-37211-70/037211-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_37211_70
end SourceCache458Pilot
open LookupCachePilot
namespace SourceCache459Pilot
noncomputable def cache_37281_185 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-37281-370/037281-0185.cache"
noncomputable def cache_37466_185 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-37281-370/037466-0185.cache"
noncomputable def cache_37281_370 : Balanced.RowTree Cell :=
  .branch 185 cache_37281_185 cache_37466_185
noncomputable def cache : Balanced.RowTree Cell := cache_37281_370
end SourceCache459Pilot
open LookupCachePilot
namespace SourceCache460Pilot
noncomputable def cache_37651_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-37651-5/037651-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_37651_5
end SourceCache460Pilot
open LookupCachePilot
namespace SourceCache461Pilot
noncomputable def cache_37656_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-37656-70/037656-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_37656_70
end SourceCache461Pilot
open LookupCachePilot
namespace SourceCache462Pilot
noncomputable def cache_37726_200 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-37726-400/037726-0200.cache"
noncomputable def cache_37926_200 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-37726-400/037926-0200.cache"
noncomputable def cache_37726_400 : Balanced.RowTree Cell :=
  .branch 200 cache_37726_200 cache_37926_200
noncomputable def cache : Balanced.RowTree Cell := cache_37726_400
end SourceCache462Pilot
open LookupCachePilot
namespace SourceCache463Pilot
noncomputable def cache_38126_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-38126-5/038126-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_38126_5
end SourceCache463Pilot
open LookupCachePilot
namespace SourceCache464Pilot
noncomputable def cache_38131_10 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-38131-10/038131-0010.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_38131_10
end SourceCache464Pilot
open LookupCachePilot
namespace SourceCache465Pilot
noncomputable def cache_38141_130 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-38141-520/038141-0130.cache"
noncomputable def cache_38271_130 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-38141-520/038271-0130.cache"
noncomputable def cache_38141_260 : Balanced.RowTree Cell :=
  .branch 130 cache_38141_130 cache_38271_130
noncomputable def cache_38401_130 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-38141-520/038401-0130.cache"
noncomputable def cache_38531_130 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-38141-520/038531-0130.cache"
noncomputable def cache_38401_260 : Balanced.RowTree Cell :=
  .branch 130 cache_38401_130 cache_38531_130
noncomputable def cache_38141_520 : Balanced.RowTree Cell :=
  .branch 260 cache_38141_260 cache_38401_260
noncomputable def cache : Balanced.RowTree Cell := cache_38141_520
end SourceCache465Pilot
open LookupCachePilot
namespace SourceCache466Pilot
noncomputable def cache_38661_143 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-38661-575/038661-0143.cache"
noncomputable def cache_38804_144 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-38661-575/038804-0144.cache"
noncomputable def cache_38661_287 : Balanced.RowTree Cell :=
  .branch 143 cache_38661_143 cache_38804_144
noncomputable def cache_38948_144 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-38661-575/038948-0144.cache"
noncomputable def cache_39092_144 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-38661-575/039092-0144.cache"
noncomputable def cache_38948_288 : Balanced.RowTree Cell :=
  .branch 144 cache_38948_144 cache_39092_144
noncomputable def cache_38661_575 : Balanced.RowTree Cell :=
  .branch 287 cache_38661_287 cache_38948_288
noncomputable def cache : Balanced.RowTree Cell := cache_38661_575
end SourceCache466Pilot
open LookupCachePilot
namespace SourceCache467Pilot
noncomputable def cache_39236_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-39236-70/039236-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_39236_70
end SourceCache467Pilot
open LookupCachePilot
namespace SourceCache468Pilot
noncomputable def cache_39306_195 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-39306-195/039306-0195.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_39306_195
end SourceCache468Pilot
open LookupCachePilot
namespace SourceCache469Pilot
noncomputable def cache_39501_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-39501-70/039501-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_39501_70
end SourceCache469Pilot
open LookupCachePilot
namespace SourceCache470Pilot
noncomputable def cache_39571_133 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-39571-535/039571-0133.cache"
noncomputable def cache_39704_134 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-39571-535/039704-0134.cache"
noncomputable def cache_39571_267 : Balanced.RowTree Cell :=
  .branch 133 cache_39571_133 cache_39704_134
noncomputable def cache_39838_134 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-39571-535/039838-0134.cache"
noncomputable def cache_39972_134 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-39571-535/039972-0134.cache"
noncomputable def cache_39838_268 : Balanced.RowTree Cell :=
  .branch 134 cache_39838_134 cache_39972_134
noncomputable def cache_39571_535 : Balanced.RowTree Cell :=
  .branch 267 cache_39571_267 cache_39838_268
noncomputable def cache : Balanced.RowTree Cell := cache_39571_535
end SourceCache470Pilot
open LookupCachePilot
namespace SourceCache471Pilot
noncomputable def cache_40106_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-40106-5/040106-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_40106_5
end SourceCache471Pilot
open LookupCachePilot
namespace SourceCache472Pilot
noncomputable def cache_40111_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-40111-70/040111-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_40111_70
end SourceCache472Pilot
open LookupCachePilot
namespace SourceCache473Pilot
noncomputable def cache_40181_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-40181-670/040181-0167.cache"
noncomputable def cache_40348_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-40181-670/040348-0168.cache"
noncomputable def cache_40181_335 : Balanced.RowTree Cell :=
  .branch 167 cache_40181_167 cache_40348_168
noncomputable def cache_40516_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-40181-670/040516-0167.cache"
noncomputable def cache_40683_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-40181-670/040683-0168.cache"
noncomputable def cache_40516_335 : Balanced.RowTree Cell :=
  .branch 167 cache_40516_167 cache_40683_168
noncomputable def cache_40181_670 : Balanced.RowTree Cell :=
  .branch 335 cache_40181_335 cache_40516_335
noncomputable def cache : Balanced.RowTree Cell := cache_40181_670
end SourceCache473Pilot
open LookupCachePilot
namespace SourceCache474Pilot
noncomputable def cache_40851_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-40851-70/040851-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_40851_70
end SourceCache474Pilot
open LookupCachePilot
namespace SourceCache475Pilot
noncomputable def cache_40921_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-40921-670/040921-0167.cache"
noncomputable def cache_41088_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-40921-670/041088-0168.cache"
noncomputable def cache_40921_335 : Balanced.RowTree Cell :=
  .branch 167 cache_40921_167 cache_41088_168
noncomputable def cache_41256_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-40921-670/041256-0167.cache"
noncomputable def cache_41423_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-40921-670/041423-0168.cache"
noncomputable def cache_41256_335 : Balanced.RowTree Cell :=
  .branch 167 cache_41256_167 cache_41423_168
noncomputable def cache_40921_670 : Balanced.RowTree Cell :=
  .branch 335 cache_40921_335 cache_41256_335
noncomputable def cache : Balanced.RowTree Cell := cache_40921_670
end SourceCache475Pilot
open LookupCachePilot
namespace SourceCache476Pilot
noncomputable def cache_41591_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-41591-670/041591-0167.cache"
noncomputable def cache_41758_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-41591-670/041758-0168.cache"
noncomputable def cache_41591_335 : Balanced.RowTree Cell :=
  .branch 167 cache_41591_167 cache_41758_168
noncomputable def cache_41926_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-41591-670/041926-0167.cache"
noncomputable def cache_42093_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-41591-670/042093-0168.cache"
noncomputable def cache_41926_335 : Balanced.RowTree Cell :=
  .branch 167 cache_41926_167 cache_42093_168
noncomputable def cache_41591_670 : Balanced.RowTree Cell :=
  .branch 335 cache_41591_335 cache_41926_335
noncomputable def cache : Balanced.RowTree Cell := cache_41591_670
end SourceCache476Pilot
open LookupCachePilot
namespace SourceCache477Pilot
noncomputable def cache_42261_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-42261-5/042261-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_42261_5
end SourceCache477Pilot
open LookupCachePilot
namespace SourceCache478Pilot
noncomputable def cache_42266_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-42266-70/042266-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_42266_70
end SourceCache478Pilot
open LookupCachePilot
namespace SourceCache479Pilot
noncomputable def cache_42336_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-42336-670/042336-0167.cache"
noncomputable def cache_42503_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-42336-670/042503-0168.cache"
noncomputable def cache_42336_335 : Balanced.RowTree Cell :=
  .branch 167 cache_42336_167 cache_42503_168
noncomputable def cache_42671_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-42336-670/042671-0167.cache"
noncomputable def cache_42838_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-42336-670/042838-0168.cache"
noncomputable def cache_42671_335 : Balanced.RowTree Cell :=
  .branch 167 cache_42671_167 cache_42838_168
noncomputable def cache_42336_670 : Balanced.RowTree Cell :=
  .branch 335 cache_42336_335 cache_42671_335
noncomputable def cache : Balanced.RowTree Cell := cache_42336_670
end SourceCache479Pilot
open LookupCachePilot
namespace SourceCache480Pilot
noncomputable def cache_43006_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-43006-5/043006-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_43006_5
end SourceCache480Pilot
open LookupCachePilot
namespace SourceCache481Pilot
noncomputable def cache_43011_10 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-43011-10/043011-0010.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_43011_10
end SourceCache481Pilot
open LookupCachePilot
namespace SourceCache482Pilot
noncomputable def cache_43021_185 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-43021-370/043021-0185.cache"
noncomputable def cache_43206_185 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-43021-370/043206-0185.cache"
noncomputable def cache_43021_370 : Balanced.RowTree Cell :=
  .branch 185 cache_43021_185 cache_43206_185
noncomputable def cache : Balanced.RowTree Cell := cache_43021_370
end SourceCache482Pilot
open LookupCachePilot
namespace SourceCache483Pilot
noncomputable def cache_43391_220 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-43391-440/043391-0220.cache"
noncomputable def cache_43611_220 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-43391-440/043611-0220.cache"
noncomputable def cache_43391_440 : Balanced.RowTree Cell :=
  .branch 220 cache_43391_220 cache_43611_220
noncomputable def cache : Balanced.RowTree Cell := cache_43391_440
end SourceCache483Pilot
open LookupCachePilot
namespace SourceCache484Pilot
noncomputable def cache_43831_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-43831-70/043831-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_43831_70
end SourceCache484Pilot
open LookupCachePilot
namespace SourceCache485Pilot
noncomputable def cache_43901_195 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-43901-195/043901-0195.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_43901_195
end SourceCache485Pilot
open LookupCachePilot
namespace SourceCache486Pilot
noncomputable def cache_44096_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-44096-70/044096-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_44096_70
end SourceCache486Pilot
open LookupCachePilot
namespace SourceCache487Pilot
noncomputable def cache_44166_200 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-44166-400/044166-0200.cache"
noncomputable def cache_44366_200 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-44166-400/044366-0200.cache"
noncomputable def cache_44166_400 : Balanced.RowTree Cell :=
  .branch 200 cache_44166_200 cache_44366_200
noncomputable def cache : Balanced.RowTree Cell := cache_44166_400
end SourceCache487Pilot
open LookupCachePilot
namespace SourceCache488Pilot
noncomputable def cache_44566_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-44566-5/044566-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_44566_5
end SourceCache488Pilot
open LookupCachePilot
namespace SourceCache489Pilot
noncomputable def cache_44571_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-44571-70/044571-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_44571_70
end SourceCache489Pilot
open LookupCachePilot
namespace SourceCache490Pilot
noncomputable def cache_44641_185 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-44641-370/044641-0185.cache"
noncomputable def cache_44826_185 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-44641-370/044826-0185.cache"
noncomputable def cache_44641_370 : Balanced.RowTree Cell :=
  .branch 185 cache_44641_185 cache_44826_185
noncomputable def cache : Balanced.RowTree Cell := cache_44641_370
end SourceCache490Pilot
open LookupCachePilot
namespace SourceCache491Pilot
noncomputable def cache_45011_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-45011-5/045011-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_45011_5
end SourceCache491Pilot
open LookupCachePilot
namespace SourceCache492Pilot
noncomputable def cache_45016_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-45016-70/045016-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_45016_70
end SourceCache492Pilot
open LookupCachePilot
namespace SourceCache493Pilot
noncomputable def cache_45086_200 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-45086-400/045086-0200.cache"
noncomputable def cache_45286_200 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-45086-400/045286-0200.cache"
noncomputable def cache_45086_400 : Balanced.RowTree Cell :=
  .branch 200 cache_45086_200 cache_45286_200
noncomputable def cache : Balanced.RowTree Cell := cache_45086_400
end SourceCache493Pilot
open LookupCachePilot
namespace SourceCache494Pilot
noncomputable def cache_45486_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-45486-5/045486-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_45486_5
end SourceCache494Pilot
open LookupCachePilot
namespace SourceCache495Pilot
noncomputable def cache_45491_10 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-45491-10/045491-0010.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_45491_10
end SourceCache495Pilot
open LookupCachePilot
namespace SourceCache496Pilot
noncomputable def cache_45501_130 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-45501-520/045501-0130.cache"
noncomputable def cache_45631_130 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-45501-520/045631-0130.cache"
noncomputable def cache_45501_260 : Balanced.RowTree Cell :=
  .branch 130 cache_45501_130 cache_45631_130
noncomputable def cache_45761_130 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-45501-520/045761-0130.cache"
noncomputable def cache_45891_130 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-45501-520/045891-0130.cache"
noncomputable def cache_45761_260 : Balanced.RowTree Cell :=
  .branch 130 cache_45761_130 cache_45891_130
noncomputable def cache_45501_520 : Balanced.RowTree Cell :=
  .branch 260 cache_45501_260 cache_45761_260
noncomputable def cache : Balanced.RowTree Cell := cache_45501_520
end SourceCache496Pilot
open LookupCachePilot
namespace SourceCache497Pilot
noncomputable def cache_46021_143 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-46021-575/046021-0143.cache"
noncomputable def cache_46164_144 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-46021-575/046164-0144.cache"
noncomputable def cache_46021_287 : Balanced.RowTree Cell :=
  .branch 143 cache_46021_143 cache_46164_144
noncomputable def cache_46308_144 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-46021-575/046308-0144.cache"
noncomputable def cache_46452_144 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-46021-575/046452-0144.cache"
noncomputable def cache_46308_288 : Balanced.RowTree Cell :=
  .branch 144 cache_46308_144 cache_46452_144
noncomputable def cache_46021_575 : Balanced.RowTree Cell :=
  .branch 287 cache_46021_287 cache_46308_288
noncomputable def cache : Balanced.RowTree Cell := cache_46021_575
end SourceCache497Pilot
open LookupCachePilot
namespace SourceCache498Pilot
noncomputable def cache_46596_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-46596-70/046596-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_46596_70
end SourceCache498Pilot
open LookupCachePilot
namespace SourceCache499Pilot
noncomputable def cache_46666_195 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-46666-195/046666-0195.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_46666_195
end SourceCache499Pilot
open LookupCachePilot
namespace SourceCache500Pilot
noncomputable def cache_46861_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-46861-70/046861-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_46861_70
end SourceCache500Pilot
open LookupCachePilot
namespace SourceCache501Pilot
noncomputable def cache_46931_133 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-46931-535/046931-0133.cache"
noncomputable def cache_47064_134 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-46931-535/047064-0134.cache"
noncomputable def cache_46931_267 : Balanced.RowTree Cell :=
  .branch 133 cache_46931_133 cache_47064_134
noncomputable def cache_47198_134 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-46931-535/047198-0134.cache"
noncomputable def cache_47332_134 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-46931-535/047332-0134.cache"
noncomputable def cache_47198_268 : Balanced.RowTree Cell :=
  .branch 134 cache_47198_134 cache_47332_134
noncomputable def cache_46931_535 : Balanced.RowTree Cell :=
  .branch 267 cache_46931_267 cache_47198_268
noncomputable def cache : Balanced.RowTree Cell := cache_46931_535
end SourceCache501Pilot
open LookupCachePilot
namespace SourceCache502Pilot
noncomputable def cache_47466_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-47466-5/047466-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_47466_5
end SourceCache502Pilot
open LookupCachePilot
namespace SourceCache503Pilot
noncomputable def cache_47471_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-47471-70/047471-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_47471_70
end SourceCache503Pilot
open LookupCachePilot
namespace SourceCache504Pilot
noncomputable def cache_47541_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-47541-670/047541-0167.cache"
noncomputable def cache_47708_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-47541-670/047708-0168.cache"
noncomputable def cache_47541_335 : Balanced.RowTree Cell :=
  .branch 167 cache_47541_167 cache_47708_168
noncomputable def cache_47876_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-47541-670/047876-0167.cache"
noncomputable def cache_48043_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-47541-670/048043-0168.cache"
noncomputable def cache_47876_335 : Balanced.RowTree Cell :=
  .branch 167 cache_47876_167 cache_48043_168
noncomputable def cache_47541_670 : Balanced.RowTree Cell :=
  .branch 335 cache_47541_335 cache_47876_335
noncomputable def cache : Balanced.RowTree Cell := cache_47541_670
end SourceCache504Pilot
open LookupCachePilot
namespace SourceCache505Pilot
noncomputable def cache_48211_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-48211-70/048211-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_48211_70
end SourceCache505Pilot
open LookupCachePilot
namespace SourceCache506Pilot
noncomputable def cache_48281_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-48281-670/048281-0167.cache"
noncomputable def cache_48448_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-48281-670/048448-0168.cache"
noncomputable def cache_48281_335 : Balanced.RowTree Cell :=
  .branch 167 cache_48281_167 cache_48448_168
noncomputable def cache_48616_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-48281-670/048616-0167.cache"
noncomputable def cache_48783_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-48281-670/048783-0168.cache"
noncomputable def cache_48616_335 : Balanced.RowTree Cell :=
  .branch 167 cache_48616_167 cache_48783_168
noncomputable def cache_48281_670 : Balanced.RowTree Cell :=
  .branch 335 cache_48281_335 cache_48616_335
noncomputable def cache : Balanced.RowTree Cell := cache_48281_670
end SourceCache506Pilot
open LookupCachePilot
namespace SourceCache507Pilot
noncomputable def cache_48951_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-48951-670/048951-0167.cache"
noncomputable def cache_49118_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-48951-670/049118-0168.cache"
noncomputable def cache_48951_335 : Balanced.RowTree Cell :=
  .branch 167 cache_48951_167 cache_49118_168
noncomputable def cache_49286_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-48951-670/049286-0167.cache"
noncomputable def cache_49453_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-48951-670/049453-0168.cache"
noncomputable def cache_49286_335 : Balanced.RowTree Cell :=
  .branch 167 cache_49286_167 cache_49453_168
noncomputable def cache_48951_670 : Balanced.RowTree Cell :=
  .branch 335 cache_48951_335 cache_49286_335
noncomputable def cache : Balanced.RowTree Cell := cache_48951_670
end SourceCache507Pilot
open LookupCachePilot
namespace SourceCache508Pilot
noncomputable def cache_49621_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-49621-5/049621-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_49621_5
end SourceCache508Pilot
open LookupCachePilot
namespace SourceCache509Pilot
noncomputable def cache_49626_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-49626-70/049626-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_49626_70
end SourceCache509Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Batched operation-local cache data loaded"
