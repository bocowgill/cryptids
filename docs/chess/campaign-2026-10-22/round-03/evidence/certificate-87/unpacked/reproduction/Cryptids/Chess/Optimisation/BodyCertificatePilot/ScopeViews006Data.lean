module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LookupCacheLoaders

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace SourceCache585Pilot
noncomputable def cache_65566_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-65566-670/065566-0167.cache"
noncomputable def cache_65733_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-65566-670/065733-0168.cache"
noncomputable def cache_65566_335 : Balanced.RowTree Cell :=
  .branch 167 cache_65566_167 cache_65733_168
noncomputable def cache_65901_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-65566-670/065901-0167.cache"
noncomputable def cache_66068_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-65566-670/066068-0168.cache"
noncomputable def cache_65901_335 : Balanced.RowTree Cell :=
  .branch 167 cache_65901_167 cache_66068_168
noncomputable def cache_65566_670 : Balanced.RowTree Cell :=
  .branch 335 cache_65566_335 cache_65901_335
noncomputable def cache : Balanced.RowTree Cell := cache_65566_670
end SourceCache585Pilot
open LookupCachePilot
namespace SourceCache586Pilot
noncomputable def cache_66236_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-66236-5/066236-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_66236_5
end SourceCache586Pilot
open LookupCachePilot
namespace SourceCache587Pilot
noncomputable def cache_66241_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-66241-70/066241-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_66241_70
end SourceCache587Pilot
open LookupCachePilot
namespace SourceCache588Pilot
noncomputable def cache_66311_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-66311-670/066311-0167.cache"
noncomputable def cache_66478_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-66311-670/066478-0168.cache"
noncomputable def cache_66311_335 : Balanced.RowTree Cell :=
  .branch 167 cache_66311_167 cache_66478_168
noncomputable def cache_66646_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-66311-670/066646-0167.cache"
noncomputable def cache_66813_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-66311-670/066813-0168.cache"
noncomputable def cache_66646_335 : Balanced.RowTree Cell :=
  .branch 167 cache_66646_167 cache_66813_168
noncomputable def cache_66311_670 : Balanced.RowTree Cell :=
  .branch 335 cache_66311_335 cache_66646_335
noncomputable def cache : Balanced.RowTree Cell := cache_66311_670
end SourceCache588Pilot
open LookupCachePilot
namespace SourceCache589Pilot
noncomputable def cache_66981_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-66981-5/066981-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_66981_5
end SourceCache589Pilot
open LookupCachePilot
namespace SourceCache590Pilot
noncomputable def cache_66986_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-66986-70/066986-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_66986_70
end SourceCache590Pilot
open LookupCachePilot
namespace SourceCache591Pilot
noncomputable def cache_67056_220 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-67056-220/067056-0220.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_67056_220
end SourceCache591Pilot
open LookupCachePilot
namespace SourceCache592Pilot
noncomputable def cache_67276_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-67276-5/067276-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_67276_5
end SourceCache592Pilot
open LookupCachePilot
namespace SourceCache593Pilot
noncomputable def cache_67281_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-67281-70/067281-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_67281_70
end SourceCache593Pilot
open LookupCachePilot
namespace SourceCache594Pilot
noncomputable def cache_67351_132 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-67351-265/067351-0132.cache"
noncomputable def cache_67483_133 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-67351-265/067483-0133.cache"
noncomputable def cache_67351_265 : Balanced.RowTree Cell :=
  .branch 132 cache_67351_132 cache_67483_133
noncomputable def cache : Balanced.RowTree Cell := cache_67351_265
end SourceCache594Pilot
open LookupCachePilot
namespace SourceCache595Pilot
noncomputable def cache_67616_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-67616-5/067616-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_67616_5
end SourceCache595Pilot
open LookupCachePilot
namespace SourceCache596Pilot
noncomputable def cache_67621_10 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-67621-10/067621-0010.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_67621_10
end SourceCache596Pilot
open LookupCachePilot
namespace SourceCache597Pilot
noncomputable def cache_67631_185 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-67631-370/067631-0185.cache"
noncomputable def cache_67816_185 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-67631-370/067816-0185.cache"
noncomputable def cache_67631_370 : Balanced.RowTree Cell :=
  .branch 185 cache_67631_185 cache_67816_185
noncomputable def cache : Balanced.RowTree Cell := cache_67631_370
end SourceCache597Pilot
open LookupCachePilot
namespace SourceCache598Pilot
noncomputable def cache_68001_220 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-68001-440/068001-0220.cache"
noncomputable def cache_68221_220 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-68001-440/068221-0220.cache"
noncomputable def cache_68001_440 : Balanced.RowTree Cell :=
  .branch 220 cache_68001_220 cache_68221_220
noncomputable def cache : Balanced.RowTree Cell := cache_68001_440
end SourceCache598Pilot
open LookupCachePilot
namespace SourceCache599Pilot
noncomputable def cache_68441_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-68441-70/068441-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_68441_70
end SourceCache599Pilot
open LookupCachePilot
namespace SourceCache600Pilot
noncomputable def cache_68511_195 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-68511-195/068511-0195.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_68511_195
end SourceCache600Pilot
open LookupCachePilot
namespace SourceCache601Pilot
noncomputable def cache_68706_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-68706-70/068706-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_68706_70
end SourceCache601Pilot
open LookupCachePilot
namespace SourceCache602Pilot
noncomputable def cache_68776_200 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-68776-400/068776-0200.cache"
noncomputable def cache_68976_200 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-68776-400/068976-0200.cache"
noncomputable def cache_68776_400 : Balanced.RowTree Cell :=
  .branch 200 cache_68776_200 cache_68976_200
noncomputable def cache : Balanced.RowTree Cell := cache_68776_400
end SourceCache602Pilot
open LookupCachePilot
namespace SourceCache603Pilot
noncomputable def cache_69176_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-69176-5/069176-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_69176_5
end SourceCache603Pilot
open LookupCachePilot
namespace SourceCache604Pilot
noncomputable def cache_69181_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-69181-70/069181-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_69181_70
end SourceCache604Pilot
open LookupCachePilot
namespace SourceCache605Pilot
noncomputable def cache_69251_185 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-69251-370/069251-0185.cache"
noncomputable def cache_69436_185 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-69251-370/069436-0185.cache"
noncomputable def cache_69251_370 : Balanced.RowTree Cell :=
  .branch 185 cache_69251_185 cache_69436_185
noncomputable def cache : Balanced.RowTree Cell := cache_69251_370
end SourceCache605Pilot
open LookupCachePilot
namespace SourceCache606Pilot
noncomputable def cache_69621_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-69621-5/069621-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_69621_5
end SourceCache606Pilot
open LookupCachePilot
namespace SourceCache607Pilot
noncomputable def cache_69626_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-69626-70/069626-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_69626_70
end SourceCache607Pilot
open LookupCachePilot
namespace SourceCache608Pilot
noncomputable def cache_69696_200 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-69696-400/069696-0200.cache"
noncomputable def cache_69896_200 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-69696-400/069896-0200.cache"
noncomputable def cache_69696_400 : Balanced.RowTree Cell :=
  .branch 200 cache_69696_200 cache_69896_200
noncomputable def cache : Balanced.RowTree Cell := cache_69696_400
end SourceCache608Pilot
open LookupCachePilot
namespace SourceCache609Pilot
noncomputable def cache_70096_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-70096-5/070096-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_70096_5
end SourceCache609Pilot
open LookupCachePilot
namespace SourceCache610Pilot
noncomputable def cache_70101_10 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-70101-10/070101-0010.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_70101_10
end SourceCache610Pilot
open LookupCachePilot
namespace SourceCache611Pilot
noncomputable def cache_70111_130 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-70111-520/070111-0130.cache"
noncomputable def cache_70241_130 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-70111-520/070241-0130.cache"
noncomputable def cache_70111_260 : Balanced.RowTree Cell :=
  .branch 130 cache_70111_130 cache_70241_130
noncomputable def cache_70371_130 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-70111-520/070371-0130.cache"
noncomputable def cache_70501_130 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-70111-520/070501-0130.cache"
noncomputable def cache_70371_260 : Balanced.RowTree Cell :=
  .branch 130 cache_70371_130 cache_70501_130
noncomputable def cache_70111_520 : Balanced.RowTree Cell :=
  .branch 260 cache_70111_260 cache_70371_260
noncomputable def cache : Balanced.RowTree Cell := cache_70111_520
end SourceCache611Pilot
open LookupCachePilot
namespace SourceCache612Pilot
noncomputable def cache_70631_143 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-70631-575/070631-0143.cache"
noncomputable def cache_70774_144 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-70631-575/070774-0144.cache"
noncomputable def cache_70631_287 : Balanced.RowTree Cell :=
  .branch 143 cache_70631_143 cache_70774_144
noncomputable def cache_70918_144 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-70631-575/070918-0144.cache"
noncomputable def cache_71062_144 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-70631-575/071062-0144.cache"
noncomputable def cache_70918_288 : Balanced.RowTree Cell :=
  .branch 144 cache_70918_144 cache_71062_144
noncomputable def cache_70631_575 : Balanced.RowTree Cell :=
  .branch 287 cache_70631_287 cache_70918_288
noncomputable def cache : Balanced.RowTree Cell := cache_70631_575
end SourceCache612Pilot
open LookupCachePilot
namespace SourceCache613Pilot
noncomputable def cache_71206_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-71206-70/071206-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_71206_70
end SourceCache613Pilot
open LookupCachePilot
namespace SourceCache614Pilot
noncomputable def cache_71276_195 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-71276-195/071276-0195.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_71276_195
end SourceCache614Pilot
open LookupCachePilot
namespace SourceCache615Pilot
noncomputable def cache_71471_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-71471-70/071471-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_71471_70
end SourceCache615Pilot
open LookupCachePilot
namespace SourceCache616Pilot
noncomputable def cache_71541_133 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-71541-535/071541-0133.cache"
noncomputable def cache_71674_134 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-71541-535/071674-0134.cache"
noncomputable def cache_71541_267 : Balanced.RowTree Cell :=
  .branch 133 cache_71541_133 cache_71674_134
noncomputable def cache_71808_134 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-71541-535/071808-0134.cache"
noncomputable def cache_71942_134 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-71541-535/071942-0134.cache"
noncomputable def cache_71808_268 : Balanced.RowTree Cell :=
  .branch 134 cache_71808_134 cache_71942_134
noncomputable def cache_71541_535 : Balanced.RowTree Cell :=
  .branch 267 cache_71541_267 cache_71808_268
noncomputable def cache : Balanced.RowTree Cell := cache_71541_535
end SourceCache616Pilot
open LookupCachePilot
namespace SourceCache617Pilot
noncomputable def cache_72076_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-72076-5/072076-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_72076_5
end SourceCache617Pilot
open LookupCachePilot
namespace SourceCache618Pilot
noncomputable def cache_72081_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-72081-70/072081-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_72081_70
end SourceCache618Pilot
open LookupCachePilot
namespace SourceCache619Pilot
noncomputable def cache_72151_220 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-72151-220/072151-0220.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_72151_220
end SourceCache619Pilot
open LookupCachePilot
namespace SourceCache620Pilot
noncomputable def cache_72371_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-72371-70/072371-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_72371_70
end SourceCache620Pilot
open LookupCachePilot
namespace SourceCache621Pilot
noncomputable def cache_72441_132 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-72441-265/072441-0132.cache"
noncomputable def cache_72573_133 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-72441-265/072573-0133.cache"
noncomputable def cache_72441_265 : Balanced.RowTree Cell :=
  .branch 132 cache_72441_132 cache_72573_133
noncomputable def cache : Balanced.RowTree Cell := cache_72441_265
end SourceCache621Pilot
open LookupCachePilot
namespace SourceCache622Pilot
noncomputable def cache_72706_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-72706-5/072706-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_72706_5
end SourceCache622Pilot
open LookupCachePilot
namespace SourceCache623Pilot
noncomputable def cache_72711_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-72711-70/072711-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_72711_70
end SourceCache623Pilot
open LookupCachePilot
namespace SourceCache624Pilot
noncomputable def cache_72781_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-72781-670/072781-0167.cache"
noncomputable def cache_72948_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-72781-670/072948-0168.cache"
noncomputable def cache_72781_335 : Balanced.RowTree Cell :=
  .branch 167 cache_72781_167 cache_72948_168
noncomputable def cache_73116_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-72781-670/073116-0167.cache"
noncomputable def cache_73283_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-72781-670/073283-0168.cache"
noncomputable def cache_73116_335 : Balanced.RowTree Cell :=
  .branch 167 cache_73116_167 cache_73283_168
noncomputable def cache_72781_670 : Balanced.RowTree Cell :=
  .branch 335 cache_72781_335 cache_73116_335
noncomputable def cache : Balanced.RowTree Cell := cache_72781_670
end SourceCache624Pilot
open LookupCachePilot
namespace SourceCache625Pilot
noncomputable def cache_73451_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-73451-70/073451-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_73451_70
end SourceCache625Pilot
open LookupCachePilot
namespace SourceCache626Pilot
noncomputable def cache_73521_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-73521-670/073521-0167.cache"
noncomputable def cache_73688_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-73521-670/073688-0168.cache"
noncomputable def cache_73521_335 : Balanced.RowTree Cell :=
  .branch 167 cache_73521_167 cache_73688_168
noncomputable def cache_73856_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-73521-670/073856-0167.cache"
noncomputable def cache_74023_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-73521-670/074023-0168.cache"
noncomputable def cache_73856_335 : Balanced.RowTree Cell :=
  .branch 167 cache_73856_167 cache_74023_168
noncomputable def cache_73521_670 : Balanced.RowTree Cell :=
  .branch 335 cache_73521_335 cache_73856_335
noncomputable def cache : Balanced.RowTree Cell := cache_73521_670
end SourceCache626Pilot
open LookupCachePilot
namespace SourceCache627Pilot
noncomputable def cache_74191_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-74191-670/074191-0167.cache"
noncomputable def cache_74358_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-74191-670/074358-0168.cache"
noncomputable def cache_74191_335 : Balanced.RowTree Cell :=
  .branch 167 cache_74191_167 cache_74358_168
noncomputable def cache_74526_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-74191-670/074526-0167.cache"
noncomputable def cache_74693_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-74191-670/074693-0168.cache"
noncomputable def cache_74526_335 : Balanced.RowTree Cell :=
  .branch 167 cache_74526_167 cache_74693_168
noncomputable def cache_74191_670 : Balanced.RowTree Cell :=
  .branch 335 cache_74191_335 cache_74526_335
noncomputable def cache : Balanced.RowTree Cell := cache_74191_670
end SourceCache627Pilot
open LookupCachePilot
namespace SourceCache628Pilot
noncomputable def cache_74861_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-74861-5/074861-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_74861_5
end SourceCache628Pilot
open LookupCachePilot
namespace SourceCache629Pilot
noncomputable def cache_74866_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-74866-70/074866-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_74866_70
end SourceCache629Pilot
open LookupCachePilot
namespace SourceCache630Pilot
noncomputable def cache_74936_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-74936-670/074936-0167.cache"
noncomputable def cache_75103_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-74936-670/075103-0168.cache"
noncomputable def cache_74936_335 : Balanced.RowTree Cell :=
  .branch 167 cache_74936_167 cache_75103_168
noncomputable def cache_75271_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-74936-670/075271-0167.cache"
noncomputable def cache_75438_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-74936-670/075438-0168.cache"
noncomputable def cache_75271_335 : Balanced.RowTree Cell :=
  .branch 167 cache_75271_167 cache_75438_168
noncomputable def cache_74936_670 : Balanced.RowTree Cell :=
  .branch 335 cache_74936_335 cache_75271_335
noncomputable def cache : Balanced.RowTree Cell := cache_74936_670
end SourceCache630Pilot
open LookupCachePilot
namespace SourceCache631Pilot
noncomputable def cache_75606_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-75606-5/075606-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_75606_5
end SourceCache631Pilot
open LookupCachePilot
namespace SourceCache632Pilot
noncomputable def cache_75611_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-75611-70/075611-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_75611_70
end SourceCache632Pilot
open LookupCachePilot
namespace SourceCache633Pilot
noncomputable def cache_75681_220 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-75681-220/075681-0220.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_75681_220
end SourceCache633Pilot
open LookupCachePilot
namespace SourceCache634Pilot
noncomputable def cache_75901_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-75901-5/075901-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_75901_5
end SourceCache634Pilot
open LookupCachePilot
namespace SourceCache635Pilot
noncomputable def cache_75906_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-75906-70/075906-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_75906_70
end SourceCache635Pilot
open LookupCachePilot
namespace SourceCache636Pilot
noncomputable def cache_75976_132 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-75976-265/075976-0132.cache"
noncomputable def cache_76108_133 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-75976-265/076108-0133.cache"
noncomputable def cache_75976_265 : Balanced.RowTree Cell :=
  .branch 132 cache_75976_132 cache_76108_133
noncomputable def cache : Balanced.RowTree Cell := cache_75976_265
end SourceCache636Pilot
open LookupCachePilot
namespace SourceCache637Pilot
noncomputable def cache_76241_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-76241-5/076241-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_76241_5
end SourceCache637Pilot
open LookupCachePilot
namespace SourceCache638Pilot
noncomputable def cache_76246_10 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-76246-10/076246-0010.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_76246_10
end SourceCache638Pilot
open LookupCachePilot
namespace SourceCache639Pilot
noncomputable def cache_76256_185 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-76256-370/076256-0185.cache"
noncomputable def cache_76441_185 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-76256-370/076441-0185.cache"
noncomputable def cache_76256_370 : Balanced.RowTree Cell :=
  .branch 185 cache_76256_185 cache_76441_185
noncomputable def cache : Balanced.RowTree Cell := cache_76256_370
end SourceCache639Pilot
open LookupCachePilot
namespace SourceCache640Pilot
noncomputable def cache_76626_220 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-76626-440/076626-0220.cache"
noncomputable def cache_76846_220 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-76626-440/076846-0220.cache"
noncomputable def cache_76626_440 : Balanced.RowTree Cell :=
  .branch 220 cache_76626_220 cache_76846_220
noncomputable def cache : Balanced.RowTree Cell := cache_76626_440
end SourceCache640Pilot
open LookupCachePilot
namespace SourceCache641Pilot
noncomputable def cache_77066_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-77066-70/077066-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_77066_70
end SourceCache641Pilot
open LookupCachePilot
namespace SourceCache642Pilot
noncomputable def cache_77136_195 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-77136-195/077136-0195.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_77136_195
end SourceCache642Pilot
open LookupCachePilot
namespace SourceCache643Pilot
noncomputable def cache_77331_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-77331-70/077331-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_77331_70
end SourceCache643Pilot
open LookupCachePilot
namespace SourceCache644Pilot
noncomputable def cache_77401_200 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-77401-400/077401-0200.cache"
noncomputable def cache_77601_200 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-77401-400/077601-0200.cache"
noncomputable def cache_77401_400 : Balanced.RowTree Cell :=
  .branch 200 cache_77401_200 cache_77601_200
noncomputable def cache : Balanced.RowTree Cell := cache_77401_400
end SourceCache644Pilot
open LookupCachePilot
namespace SourceCache645Pilot
noncomputable def cache_77801_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-77801-5/077801-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_77801_5
end SourceCache645Pilot
open LookupCachePilot
namespace SourceCache646Pilot
noncomputable def cache_77806_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-77806-70/077806-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_77806_70
end SourceCache646Pilot
open LookupCachePilot
namespace SourceCache647Pilot
noncomputable def cache_77876_185 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-77876-370/077876-0185.cache"
noncomputable def cache_78061_185 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-77876-370/078061-0185.cache"
noncomputable def cache_77876_370 : Balanced.RowTree Cell :=
  .branch 185 cache_77876_185 cache_78061_185
noncomputable def cache : Balanced.RowTree Cell := cache_77876_370
end SourceCache647Pilot
open LookupCachePilot
namespace SourceCache648Pilot
noncomputable def cache_78246_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-78246-5/078246-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_78246_5
end SourceCache648Pilot
open LookupCachePilot
namespace SourceCache649Pilot
noncomputable def cache_78251_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-78251-70/078251-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_78251_70
end SourceCache649Pilot
open LookupCachePilot
namespace SourceCache650Pilot
noncomputable def cache_78321_200 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-78321-400/078321-0200.cache"
noncomputable def cache_78521_200 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-78321-400/078521-0200.cache"
noncomputable def cache_78321_400 : Balanced.RowTree Cell :=
  .branch 200 cache_78321_200 cache_78521_200
noncomputable def cache : Balanced.RowTree Cell := cache_78321_400
end SourceCache650Pilot
open LookupCachePilot
namespace SourceCache651Pilot
noncomputable def cache_78721_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-78721-5/078721-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_78721_5
end SourceCache651Pilot
open LookupCachePilot
namespace SourceCache652Pilot
noncomputable def cache_78726_10 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-78726-10/078726-0010.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_78726_10
end SourceCache652Pilot
open LookupCachePilot
namespace SourceCache653Pilot
noncomputable def cache_78736_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-78736-670/078736-0167.cache"
noncomputable def cache_78903_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-78736-670/078903-0168.cache"
noncomputable def cache_78736_335 : Balanced.RowTree Cell :=
  .branch 167 cache_78736_167 cache_78903_168
noncomputable def cache_79071_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-78736-670/079071-0167.cache"
noncomputable def cache_79238_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-78736-670/079238-0168.cache"
noncomputable def cache_79071_335 : Balanced.RowTree Cell :=
  .branch 167 cache_79071_167 cache_79238_168
noncomputable def cache_78736_670 : Balanced.RowTree Cell :=
  .branch 335 cache_78736_335 cache_79071_335
noncomputable def cache : Balanced.RowTree Cell := cache_78736_670
end SourceCache653Pilot
open LookupCachePilot
namespace SourceCache654Pilot
noncomputable def cache_79406_177 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-79406-710/079406-0177.cache"
noncomputable def cache_79583_178 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-79406-710/079583-0178.cache"
noncomputable def cache_79406_355 : Balanced.RowTree Cell :=
  .branch 177 cache_79406_177 cache_79583_178
noncomputable def cache_79761_177 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-79406-710/079761-0177.cache"
noncomputable def cache_79938_178 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-79406-710/079938-0178.cache"
noncomputable def cache_79761_355 : Balanced.RowTree Cell :=
  .branch 177 cache_79761_177 cache_79938_178
noncomputable def cache_79406_710 : Balanced.RowTree Cell :=
  .branch 355 cache_79406_355 cache_79761_355
noncomputable def cache : Balanced.RowTree Cell := cache_79406_710
end SourceCache654Pilot
open LookupCachePilot
namespace SourceCache655Pilot
noncomputable def cache_80116_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-80116-70/080116-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_80116_70
end SourceCache655Pilot
open LookupCachePilot
namespace SourceCache656Pilot
noncomputable def cache_80186_195 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-80186-195/080186-0195.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_80186_195
end SourceCache656Pilot
open LookupCachePilot
namespace SourceCache657Pilot
noncomputable def cache_80381_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-80381-70/080381-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_80381_70
end SourceCache657Pilot
open LookupCachePilot
namespace SourceCache658Pilot
noncomputable def cache_80451_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-80451-670/080451-0167.cache"
noncomputable def cache_80618_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-80451-670/080618-0168.cache"
noncomputable def cache_80451_335 : Balanced.RowTree Cell :=
  .branch 167 cache_80451_167 cache_80618_168
noncomputable def cache_80786_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-80451-670/080786-0167.cache"
noncomputable def cache_80953_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-80451-670/080953-0168.cache"
noncomputable def cache_80786_335 : Balanced.RowTree Cell :=
  .branch 167 cache_80786_167 cache_80953_168
noncomputable def cache_80451_670 : Balanced.RowTree Cell :=
  .branch 335 cache_80451_335 cache_80786_335
noncomputable def cache : Balanced.RowTree Cell := cache_80451_670
end SourceCache658Pilot
open LookupCachePilot
namespace SourceCache659Pilot
noncomputable def cache_81121_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-81121-5/081121-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_81121_5
end SourceCache659Pilot
open LookupCachePilot
namespace SourceCache660Pilot
noncomputable def cache_81126_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-81126-70/081126-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_81126_70
end SourceCache660Pilot
open LookupCachePilot
namespace SourceCache661Pilot
noncomputable def cache_81196_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-81196-670/081196-0167.cache"
noncomputable def cache_81363_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-81196-670/081363-0168.cache"
noncomputable def cache_81196_335 : Balanced.RowTree Cell :=
  .branch 167 cache_81196_167 cache_81363_168
noncomputable def cache_81531_167 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-81196-670/081531-0167.cache"
noncomputable def cache_81698_168 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-81196-670/081698-0168.cache"
noncomputable def cache_81531_335 : Balanced.RowTree Cell :=
  .branch 167 cache_81531_167 cache_81698_168
noncomputable def cache_81196_670 : Balanced.RowTree Cell :=
  .branch 335 cache_81196_335 cache_81531_335
noncomputable def cache : Balanced.RowTree Cell := cache_81196_670
end SourceCache661Pilot
open LookupCachePilot
namespace SourceCache662Pilot
noncomputable def cache_81866_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-81866-70/081866-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_81866_70
end SourceCache662Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Batched operation-local cache data loaded"
