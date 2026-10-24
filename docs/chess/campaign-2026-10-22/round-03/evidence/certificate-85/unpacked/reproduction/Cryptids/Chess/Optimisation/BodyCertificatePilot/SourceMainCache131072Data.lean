module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LookupCacheLoaders

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace SourceMainCache131072Pilot
noncomputable def cache_131072_158 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-131072-2529/131072-0158.cache"
noncomputable def cache_131230_158 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-131072-2529/131230-0158.cache"
noncomputable def cache_131072_316 : Balanced.RowTree Cell :=
  .branch 158 cache_131072_158 cache_131230_158
noncomputable def cache_131388_158 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-131072-2529/131388-0158.cache"
noncomputable def cache_131546_158 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-131072-2529/131546-0158.cache"
noncomputable def cache_131388_316 : Balanced.RowTree Cell :=
  .branch 158 cache_131388_158 cache_131546_158
noncomputable def cache_131072_632 : Balanced.RowTree Cell :=
  .branch 316 cache_131072_316 cache_131388_316
noncomputable def cache_131704_158 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-131072-2529/131704-0158.cache"
noncomputable def cache_131862_158 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-131072-2529/131862-0158.cache"
noncomputable def cache_131704_316 : Balanced.RowTree Cell :=
  .branch 158 cache_131704_158 cache_131862_158
noncomputable def cache_132020_158 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-131072-2529/132020-0158.cache"
noncomputable def cache_132178_158 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-131072-2529/132178-0158.cache"
noncomputable def cache_132020_316 : Balanced.RowTree Cell :=
  .branch 158 cache_132020_158 cache_132178_158
noncomputable def cache_131704_632 : Balanced.RowTree Cell :=
  .branch 316 cache_131704_316 cache_132020_316
noncomputable def cache_131072_1264 : Balanced.RowTree Cell :=
  .branch 632 cache_131072_632 cache_131704_632
noncomputable def cache_132336_158 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-131072-2529/132336-0158.cache"
noncomputable def cache_132494_158 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-131072-2529/132494-0158.cache"
noncomputable def cache_132336_316 : Balanced.RowTree Cell :=
  .branch 158 cache_132336_158 cache_132494_158
noncomputable def cache_132652_158 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-131072-2529/132652-0158.cache"
noncomputable def cache_132810_158 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-131072-2529/132810-0158.cache"
noncomputable def cache_132652_316 : Balanced.RowTree Cell :=
  .branch 158 cache_132652_158 cache_132810_158
noncomputable def cache_132336_632 : Balanced.RowTree Cell :=
  .branch 316 cache_132336_316 cache_132652_316
noncomputable def cache_132968_158 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-131072-2529/132968-0158.cache"
noncomputable def cache_133126_158 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-131072-2529/133126-0158.cache"
noncomputable def cache_132968_316 : Balanced.RowTree Cell :=
  .branch 158 cache_132968_158 cache_133126_158
noncomputable def cache_133284_158 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-131072-2529/133284-0158.cache"
noncomputable def cache_133442_159 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-131072-2529/133442-0159.cache"
noncomputable def cache_133284_317 : Balanced.RowTree Cell :=
  .branch 158 cache_133284_158 cache_133442_159
noncomputable def cache_132968_633 : Balanced.RowTree Cell :=
  .branch 316 cache_132968_316 cache_133284_317
noncomputable def cache_132336_1265 : Balanced.RowTree Cell :=
  .branch 632 cache_132336_632 cache_132968_633
noncomputable def cache_131072_2529 : Balanced.RowTree Cell :=
  .branch 1264 cache_131072_1264 cache_132336_1265
noncomputable def cache : Balanced.RowTree Cell := cache_131072_2529
end SourceMainCache131072Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Numeric observation cache data loaded: 2529"
