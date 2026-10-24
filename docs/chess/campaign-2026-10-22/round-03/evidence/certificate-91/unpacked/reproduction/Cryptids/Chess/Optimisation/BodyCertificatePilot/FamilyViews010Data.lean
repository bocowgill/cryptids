module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LookupCacheLoaders

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace Family941MainPilot
noncomputable def cache_130406_132 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-130406-265/130406-0132.cache"
noncomputable def cache_130538_133 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-130406-265/130538-0133.cache"
noncomputable def cache_130406_265 : Balanced.RowTree Cell :=
  .branch 132 cache_130406_132 cache_130538_133
noncomputable def cache : Balanced.RowTree Cell := cache_130406_265
end Family941MainPilot
open LookupCachePilot
namespace Family942MainPilot
noncomputable def cache_130671_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-130671-5/130671-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_130671_5
end Family942MainPilot
open LookupCachePilot
namespace Family943MainPilot
noncomputable def cache_130676_10 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-130676-10/130676-0010.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_130676_10
end Family943MainPilot
open LookupCachePilot
namespace Family944MainPilot
noncomputable def cache_130686_185 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-130686-370/130686-0185.cache"
noncomputable def cache_130871_185 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-130686-370/130871-0185.cache"
noncomputable def cache_130686_370 : Balanced.RowTree Cell :=
  .branch 185 cache_130686_185 cache_130871_185
noncomputable def cache : Balanced.RowTree Cell := cache_130686_370
end Family944MainPilot
open LookupCachePilot
namespace Family945MainPilot
noncomputable def cache_131056_220 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-131056-440/131056-0220.cache"
noncomputable def cache_131276_220 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-131056-440/131276-0220.cache"
noncomputable def cache_131056_440 : Balanced.RowTree Cell :=
  .branch 220 cache_131056_220 cache_131276_220
noncomputable def cache : Balanced.RowTree Cell := cache_131056_440
end Family945MainPilot
open LookupCachePilot
namespace Family946MainPilot
noncomputable def cache_131496_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-131496-70/131496-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_131496_70
end Family946MainPilot
open LookupCachePilot
namespace Family947MainPilot
noncomputable def cache_131566_195 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-131566-195/131566-0195.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_131566_195
end Family947MainPilot
open LookupCachePilot
namespace Family948MainPilot
noncomputable def cache_131761_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-131761-70/131761-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_131761_70
end Family948MainPilot
open LookupCachePilot
namespace Family949MainPilot
noncomputable def cache_131831_200 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-131831-400/131831-0200.cache"
noncomputable def cache_132031_200 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-131831-400/132031-0200.cache"
noncomputable def cache_131831_400 : Balanced.RowTree Cell :=
  .branch 200 cache_131831_200 cache_132031_200
noncomputable def cache : Balanced.RowTree Cell := cache_131831_400
end Family949MainPilot
open LookupCachePilot
namespace Family950MainPilot
noncomputable def cache_132231_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-132231-5/132231-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_132231_5
end Family950MainPilot
open LookupCachePilot
namespace Family951MainPilot
noncomputable def cache_132236_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-132236-70/132236-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_132236_70
end Family951MainPilot
open LookupCachePilot
namespace Family952MainPilot
noncomputable def cache_132306_185 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-132306-370/132306-0185.cache"
noncomputable def cache_132491_185 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-132306-370/132491-0185.cache"
noncomputable def cache_132306_370 : Balanced.RowTree Cell :=
  .branch 185 cache_132306_185 cache_132491_185
noncomputable def cache : Balanced.RowTree Cell := cache_132306_370
end Family952MainPilot
open LookupCachePilot
namespace Family953MainPilot
noncomputable def cache_132676_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-132676-5/132676-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_132676_5
end Family953MainPilot
open LookupCachePilot
namespace Family954MainPilot
noncomputable def cache_132681_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-132681-70/132681-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_132681_70
end Family954MainPilot
open LookupCachePilot
namespace Family955MainPilot
noncomputable def cache_132751_200 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-132751-400/132751-0200.cache"
noncomputable def cache_132951_200 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-132751-400/132951-0200.cache"
noncomputable def cache_132751_400 : Balanced.RowTree Cell :=
  .branch 200 cache_132751_200 cache_132951_200
noncomputable def cache : Balanced.RowTree Cell := cache_132751_400
end Family955MainPilot
open LookupCachePilot
namespace Family956MainPilot
noncomputable def cache_133151_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-133151-5/133151-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_133151_5
end Family956MainPilot
open LookupCachePilot
namespace Family957MainPilot
noncomputable def cache_133156_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-133156-70/133156-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_133156_70
end Family957MainPilot
open LookupCachePilot
namespace Family958MainPilot
noncomputable def cache_133226_185 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-133226-370/133226-0185.cache"
noncomputable def cache_133411_185 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-133226-370/133411-0185.cache"
noncomputable def cache_133226_370 : Balanced.RowTree Cell :=
  .branch 185 cache_133226_185 cache_133411_185
noncomputable def cache : Balanced.RowTree Cell := cache_133226_370
end Family958MainPilot
open LookupCachePilot
namespace Family959MainPilot
noncomputable def cache_133596_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-133596-5/133596-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_133596_5
end Family959MainPilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Compact working-set batch data loaded"
