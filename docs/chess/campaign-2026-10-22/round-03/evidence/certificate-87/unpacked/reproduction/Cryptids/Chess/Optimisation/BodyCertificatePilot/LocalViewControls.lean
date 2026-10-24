module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.ScopeViews002
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LocalChunk

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open ConjectureMachines.Optimisation
open Chess.Optimisation FieldCompiler LocalChunkPilot
namespace LocalViewControlsPilot

theorem anchor_recipe : LookupWorldPilot.checkRecipe
    (LocalViewPilot.world SourceCache278Pilot.cache 1951 2321)
    label_278 raw_278
    74 16 = true := by decide +kernel

noncomputable def anchor_certificate : SourceScopeToolsPilot.SourceCertificate :=
  ScopeViews002Pilot.fromRaw_278 label_278 raw_278 74 16 anchor_recipe

theorem wrong_node_count_rejected :
    LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache278Pilot.cache 1951 2321)
      label_278 raw_278
      75 16 = false := by decide +kernel

theorem wrong_return_count_rejected :
    LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache278Pilot.cache 1951 2321)
      label_278 raw_278
      74 17 = false := by decide +kernel

end LocalViewControlsPilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Fast coefficients preserve real write and source-count controls"
