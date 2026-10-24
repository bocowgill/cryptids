module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LookupCacheLoaders

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace ProfileCache445Pilot
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
end ProfileCache445Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Numeric observation cache data loaded: 670"
