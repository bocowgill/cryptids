module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LookupCacheLoaders

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace ProfileCache356Pilot
noncomputable def cache_17231_70 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-17231-70/017231-0070.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_17231_70
end ProfileCache356Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Numeric observation cache data loaded: 70"
