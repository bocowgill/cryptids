module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LookupCacheLoaders

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace Working445OwnPilot
noncomputable def cache_537517_80 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-537517-80/537517-0080.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_537517_80
end Working445OwnPilot
open LookupCachePilot
namespace Working445D441Pilot
noncomputable def cache_537422_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-537422-5/537422-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_537422_5
end Working445D441Pilot
open LookupCachePilot
namespace Working445HaltPilot
noncomputable def cache_533341_1 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-533341-1/533341-0001.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_533341_1
end Working445HaltPilot
open LookupCachePilot
namespace Working476OwnPilot
noncomputable def cache_538047_80 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-538047-80/538047-0080.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_538047_80
end Working476OwnPilot
open LookupCachePilot
namespace Working476D472Pilot
noncomputable def cache_537952_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-537952-5/537952-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_537952_5
end Working476D472Pilot
open LookupCachePilot
namespace Working476HaltPilot
noncomputable def cache_533341_1 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-533341-1/533341-0001.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_533341_1
end Working476HaltPilot
open LookupCachePilot
namespace Working356OwnPilot
noncomputable def cache_536097_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-536097-5/536097-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_536097_5
end Working356OwnPilot
open LookupCachePilot
namespace Working356D355Pilot
noncomputable def cache_536092_5 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-536092-5/536092-0005.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_536092_5
end Working356D355Pilot
open LookupCachePilot
namespace Working356HaltPilot
noncomputable def cache_533341_1 : Balanced.RowTree Cell :=
  load_observation_cache%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/lc-533341-1/533341-0001.cache"
noncomputable def cache : Balanced.RowTree Cell := cache_533341_1
end Working356HaltPilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Working-set return and target data loaded"
