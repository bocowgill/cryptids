module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.SourceRecipes

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open ConjectureMachines.Optimisation
open Chess.Optimisation FieldCompiler LocalChunkPilot SourceRecipePilot
namespace RecipeControlsPilot

theorem anchor_recipe : checkRecipe label_278 raw_278
    74 16 = true := by
  decide +kernel

noncomputable def anchor_certificate : SourceScopeToolsPilot.SourceCertificate :=
  fromRaw label_278 raw_278
    74 16 anchor_recipe

theorem wrong_node_count_rejected : checkRecipe label_278 raw_278
    75
    16 = false := by decide +kernel

theorem wrong_return_count_rejected : checkRecipe label_278 raw_278
    74
    17 = false := by decide +kernel

end RecipeControlsPilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Compact recipe actual source and count controls checked"
