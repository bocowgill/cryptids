module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.CacheWorld

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open ConjectureMachines.Optimisation
open Chess.Optimisation FieldCompiler LocalChunkPilot CacheWorldPilot
namespace CacheWorldControlsPilot

theorem anchor_recipe : LookupWorldPilot.checkRecipe cacheWorld label_278 raw_278
    74 16 = true := by decide +kernel

noncomputable def anchor_certificate : SourceScopeToolsPilot.SourceCertificate :=
  fromCachedRaw label_278 raw_278 74 16 anchor_recipe

theorem wrong_node_count_rejected :
    LookupWorldPilot.checkRecipe cacheWorld label_278 raw_278
      75 16 = false := by decide +kernel

theorem wrong_return_count_rejected :
    LookupWorldPilot.checkRecipe cacheWorld label_278 raw_278
      74 17 = false := by decide +kernel

end CacheWorldControlsPilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Fast coefficients preserve real write and source-count controls"
