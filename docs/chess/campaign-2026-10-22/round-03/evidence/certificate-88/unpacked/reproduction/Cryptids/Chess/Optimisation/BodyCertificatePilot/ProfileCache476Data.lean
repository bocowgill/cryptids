module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LookupCacheLoaders

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace ProfileCache476Pilot
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
end ProfileCache476Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Numeric observation cache data loaded: 670"
