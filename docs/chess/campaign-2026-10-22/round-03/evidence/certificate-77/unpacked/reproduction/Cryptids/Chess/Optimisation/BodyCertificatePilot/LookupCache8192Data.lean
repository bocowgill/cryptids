module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LookupCache

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace LookupCache8192Pilot
noncomputable def cache_0_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨0, 426179, 426180⟩)
                  (.leaf ⟨1, 0, 0⟩)
                )
                (.branch 1
                  (.leaf ⟨0, 426179, 426180⟩)
                  (.leaf ⟨0, 426179, 426180⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨0, 426179, 426180⟩)
                  (.leaf ⟨0, 426179, 426180⟩)
                )
                (.branch 1
                  (.leaf ⟨2, 427015, 427016⟩)
                  (.leaf ⟨2, 427015, 427016⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨2, 427015, 427016⟩)
                  (.leaf ⟨2, 427015, 427016⟩)
                )
                (.branch 1
                  (.leaf ⟨2, 427015, 427016⟩)
                  (.leaf ⟨3, 427047, 427048⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨3, 427047, 427048⟩)
                  (.leaf ⟨3, 427047, 427048⟩)
                )
                (.branch 1
                  (.leaf ⟨3, 427047, 427048⟩)
                  (.leaf ⟨3, 427047, 427048⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨4, 426187, 426188⟩)
                  (.leaf ⟨4, 426187, 426188⟩)
                )
                (.branch 1
                  (.leaf ⟨4, 426187, 426188⟩)
                  (.leaf ⟨4, 426187, 426188⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨4, 426187, 426188⟩)
                  (.leaf ⟨5, 426183, 426184⟩)
                )
                (.branch 1
                  (.leaf ⟨5, 426183, 426184⟩)
                  (.leaf ⟨5, 426183, 426184⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨5, 426183, 426184⟩)
                  (.leaf ⟨5, 426183, 426184⟩)
                )
                (.branch 1
                  (.leaf ⟨6, 188435, 188436⟩)
                  (.leaf ⟨6, 188435, 188436⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨6, 188435, 188436⟩)
                  (.leaf ⟨6, 188435, 188436⟩)
                )
                (.branch 1
                  (.leaf ⟨6, 188435, 188436⟩)
                  (.leaf ⟨5, 426183, 426184⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨5, 426183, 426184⟩)
                  (.leaf ⟨5, 426183, 426184⟩)
                )
                (.branch 1
                  (.leaf ⟨5, 426183, 426184⟩)
                  (.leaf ⟨5, 426183, 426184⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨7, 427207, 427208⟩)
                  (.leaf ⟨7, 427207, 427208⟩)
                )
                (.branch 1
                  (.leaf ⟨7, 427207, 427208⟩)
                  (.leaf ⟨7, 427207, 427208⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨7, 427207, 427208⟩)
                  (.leaf ⟨8, 427403, 427404⟩)
                )
                (.branch 1
                  (.leaf ⟨8, 427403, 427404⟩)
                  (.leaf ⟨8, 427403, 427404⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨8, 427403, 427404⟩)
                  (.leaf ⟨8, 427403, 427404⟩)
                )
                (.branch 1
                  (.leaf ⟨9, 427467, 427468⟩)
                  (.leaf ⟨9, 427467, 427468⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨10, 427471, 427472⟩)
                  (.leaf ⟨11, 427475, 427476⟩)
                )
                (.branch 1
                  (.leaf ⟨12, 427479, 427480⟩)
                  (.leaf ⟨13, 426211, 426212⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨13, 426211, 426212⟩)
                  (.leaf ⟨13, 426211, 426212⟩)
                )
                (.branch 1
                  (.leaf ⟨13, 426211, 426212⟩)
                  (.leaf ⟨13, 426211, 426212⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨14, 426195, 426196⟩)
                  (.leaf ⟨14, 426195, 426196⟩)
                )
                (.branch 1
                  (.leaf ⟨15, 426199, 426200⟩)
                  (.leaf ⟨16, 426203, 426204⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨17, 426207, 426208⟩)
                  (.leaf ⟨18, 195923, 195924⟩)
                )
                (.branch 1
                  (.leaf ⟨18, 195923, 195924⟩)
                  (.leaf ⟨18, 195923, 195924⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨18, 195923, 195924⟩)
                  (.leaf ⟨18, 195923, 195924⟩)
                )
                (.branch 1
                  (.leaf ⟨18, 195923, 195924⟩)
                  (.leaf ⟨14, 426195, 426196⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨15, 426199, 426200⟩)
                  (.leaf ⟨16, 426203, 426204⟩)
                )
                (.branch 1
                  (.leaf ⟨17, 426207, 426208⟩)
                  (.leaf ⟨19, 427667, 427668⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨19, 427667, 427668⟩)
                  (.leaf ⟨19, 427667, 427668⟩)
                )
                (.branch 1
                  (.leaf ⟨19, 427667, 427668⟩)
                  (.leaf ⟨19, 427667, 427668⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨20, 427703, 427704⟩)
                  (.leaf ⟨20, 427703, 427704⟩)
                )
                (.branch 1
                  (.leaf ⟨20, 427703, 427704⟩)
                  (.leaf ⟨20, 427703, 427704⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨20, 427703, 427704⟩)
                  (.leaf ⟨21, 427867, 427868⟩)
                )
                (.branch 1
                  (.leaf ⟨21, 427867, 427868⟩)
                  (.leaf ⟨21, 427867, 427868⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨21, 427867, 427868⟩)
                  (.leaf ⟨21, 427867, 427868⟩)
                )
                (.branch 1
                  (.leaf ⟨22, 427899, 427900⟩)
                  (.leaf ⟨22, 427899, 427900⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨22, 427899, 427900⟩)
                  (.leaf ⟨22, 427899, 427900⟩)
                )
                (.branch 1
                  (.leaf ⟨22, 427899, 427900⟩)
                  (.leaf ⟨23, 426227, 426228⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨23, 426227, 426228⟩)
                  (.leaf ⟨23, 426227, 426228⟩)
                )
                (.branch 1
                  (.leaf ⟨23, 426227, 426228⟩)
                  (.leaf ⟨23, 426227, 426228⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨24, 426223, 426224⟩)
                  (.leaf ⟨24, 426223, 426224⟩)
                )
                (.branch 1
                  (.leaf ⟨24, 426223, 426224⟩)
                  (.leaf ⟨24, 426223, 426224⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨24, 426223, 426224⟩)
                  (.leaf ⟨25, 200735, 200736⟩)
                )
                (.branch 1
                  (.leaf ⟨25, 200735, 200736⟩)
                  (.leaf ⟨25, 200735, 200736⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨25, 200735, 200736⟩)
                  (.leaf ⟨25, 200735, 200736⟩)
                )
                (.branch 1
                  (.leaf ⟨24, 426223, 426224⟩)
                  (.leaf ⟨24, 426223, 426224⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨24, 426223, 426224⟩)
                  (.leaf ⟨24, 426223, 426224⟩)
                )
                (.branch 1
                  (.leaf ⟨24, 426223, 426224⟩)
                  (.leaf ⟨26, 428059, 428060⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨26, 428059, 428060⟩)
                  (.leaf ⟨26, 428059, 428060⟩)
                )
                (.branch 1
                  (.leaf ⟨26, 428059, 428060⟩)
                  (.leaf ⟨26, 428059, 428060⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨27, 428091, 428092⟩)
                  (.leaf ⟨27, 428091, 428092⟩)
                )
                (.branch 1
                  (.leaf ⟨27, 428091, 428092⟩)
                  (.leaf ⟨27, 428091, 428092⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨27, 428091, 428092⟩)
                  (.leaf ⟨28, 202203, 202204⟩)
                )
                (.branch 1
                  (.leaf ⟨28, 202203, 202204⟩)
                  (.leaf ⟨28, 202203, 202204⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨28, 202203, 202204⟩)
                  (.leaf ⟨28, 202203, 202204⟩)
                )
                (.branch 1
                  (.leaf ⟨29, 426231, 426232⟩)
                  (.leaf ⟨29, 426231, 426232⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨29, 426231, 426232⟩)
                  (.leaf ⟨29, 426231, 426232⟩)
                )
                (.branch 1
                  (.leaf ⟨29, 426231, 426232⟩)
                  (.leaf ⟨30, 201575, 201576⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨30, 201575, 201576⟩)
                  (.leaf ⟨30, 201575, 201576⟩)
                )
                (.branch 1
                  (.leaf ⟨30, 201575, 201576⟩)
                  (.leaf ⟨30, 201575, 201576⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨29, 426231, 426232⟩)
                  (.leaf ⟨29, 426231, 426232⟩)
                )
                (.branch 1
                  (.leaf ⟨29, 426231, 426232⟩)
                  (.leaf ⟨29, 426231, 426232⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨29, 426231, 426232⟩)
                  (.leaf ⟨31, 201991, 201992⟩)
                )
                (.branch 1
                  (.leaf ⟨31, 201991, 201992⟩)
                  (.leaf ⟨31, 201991, 201992⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨31, 201991, 201992⟩)
                  (.leaf ⟨31, 201991, 201992⟩)
                )
                (.branch 1
                  (.leaf ⟨32, 428123, 428124⟩)
                  (.leaf ⟨32, 428123, 428124⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨32, 428123, 428124⟩)
                  (.leaf ⟨32, 428123, 428124⟩)
                )
                (.branch 1
                  (.leaf ⟨32, 428123, 428124⟩)
                  (.leaf ⟨33, 205131, 205132⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨33, 205131, 205132⟩)
                  (.leaf ⟨33, 205131, 205132⟩)
                )
                (.branch 1
                  (.leaf ⟨33, 205131, 205132⟩)
                  (.leaf ⟨33, 205131, 205132⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨34, 426235, 426236⟩)
                  (.leaf ⟨34, 426235, 426236⟩)
                )
                (.branch 1
                  (.leaf ⟨34, 426235, 426236⟩)
                  (.leaf ⟨34, 426235, 426236⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨34, 426235, 426236⟩)
                  (.leaf ⟨35, 202407, 202408⟩)
                )
                (.branch 1
                  (.leaf ⟨35, 202407, 202408⟩)
                  (.leaf ⟨35, 202407, 202408⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨35, 202407, 202408⟩)
                  (.leaf ⟨35, 202407, 202408⟩)
                )
                (.branch 1
                  (.leaf ⟨34, 426235, 426236⟩)
                  (.leaf ⟨34, 426235, 426236⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨34, 426235, 426236⟩)
                  (.leaf ⟨34, 426235, 426236⟩)
                )
                (.branch 1
                  (.leaf ⟨34, 426235, 426236⟩)
                  (.leaf ⟨36, 426239, 426240⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨36, 426239, 426240⟩)
                  (.leaf ⟨36, 426239, 426240⟩)
                )
                (.branch 1
                  (.leaf ⟨36, 426239, 426240⟩)
                  (.leaf ⟨36, 426239, 426240⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨37, 428299, 428300⟩)
                  (.leaf ⟨37, 428299, 428300⟩)
                )
                (.branch 1
                  (.leaf ⟨37, 428299, 428300⟩)
                  (.leaf ⟨37, 428299, 428300⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨37, 428299, 428300⟩)
                  (.leaf ⟨38, 426283, 426284⟩)
                )
                (.branch 1
                  (.leaf ⟨38, 426283, 426284⟩)
                  (.leaf ⟨38, 426283, 426284⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨38, 426283, 426284⟩)
                  (.leaf ⟨38, 426283, 426284⟩)
                )
                (.branch 1
                  (.leaf ⟨39, 428483, 428484⟩)
                  (.leaf ⟨39, 428483, 428484⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨39, 428483, 428484⟩)
                  (.leaf ⟨39, 428483, 428484⟩)
                )
                (.branch 1
                  (.leaf ⟨39, 428483, 428484⟩)
                  (.leaf ⟨40, 428647, 428648⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨40, 428647, 428648⟩)
                  (.leaf ⟨40, 428647, 428648⟩)
                )
                (.branch 1
                  (.leaf ⟨40, 428647, 428648⟩)
                  (.leaf ⟨40, 428647, 428648⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨41, 428679, 428680⟩)
                  (.leaf ⟨41, 428679, 428680⟩)
                )
                (.branch 1
                  (.leaf ⟨41, 428679, 428680⟩)
                  (.leaf ⟨41, 428679, 428680⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨41, 428679, 428680⟩)
                  (.leaf ⟨42, 426255, 426256⟩)
                )
                (.branch 1
                  (.leaf ⟨42, 426255, 426256⟩)
                  (.leaf ⟨42, 426255, 426256⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨42, 426255, 426256⟩)
                  (.leaf ⟨42, 426255, 426256⟩)
                )
                (.branch 1
                  (.leaf ⟨43, 426251, 426252⟩)
                  (.leaf ⟨43, 426251, 426252⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨43, 426251, 426252⟩)
                  (.leaf ⟨43, 426251, 426252⟩)
                )
                (.branch 1
                  (.leaf ⟨43, 426251, 426252⟩)
                  (.leaf ⟨44, 211759, 211760⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨44, 211759, 211760⟩)
                  (.leaf ⟨44, 211759, 211760⟩)
                )
                (.branch 1
                  (.leaf ⟨44, 211759, 211760⟩)
                  (.leaf ⟨44, 211759, 211760⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨43, 426251, 426252⟩)
                  (.leaf ⟨43, 426251, 426252⟩)
                )
                (.branch 1
                  (.leaf ⟨43, 426251, 426252⟩)
                  (.leaf ⟨43, 426251, 426252⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨43, 426251, 426252⟩)
                  (.leaf ⟨45, 428839, 428840⟩)
                )
                (.branch 1
                  (.leaf ⟨45, 428839, 428840⟩)
                  (.leaf ⟨45, 428839, 428840⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨45, 428839, 428840⟩)
                  (.leaf ⟨45, 428839, 428840⟩)
                )
                (.branch 1
                  (.leaf ⟨46, 429003, 429004⟩)
                  (.leaf ⟨46, 429003, 429004⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨46, 429003, 429004⟩)
                  (.leaf ⟨46, 429003, 429004⟩)
                )
                (.branch 1
                  (.leaf ⟨46, 429003, 429004⟩)
                  (.leaf ⟨47, 429035, 429036⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨47, 429035, 429036⟩)
                  (.leaf ⟨47, 429035, 429036⟩)
                )
                (.branch 1
                  (.leaf ⟨47, 429035, 429036⟩)
                  (.leaf ⟨47, 429035, 429036⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨48, 426267, 426268⟩)
                  (.leaf ⟨48, 426267, 426268⟩)
                )
                (.branch 1
                  (.leaf ⟨48, 426267, 426268⟩)
                  (.leaf ⟨48, 426267, 426268⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨48, 426267, 426268⟩)
                  (.leaf ⟨49, 426263, 426264⟩)
                )
                (.branch 1
                  (.leaf ⟨49, 426263, 426264⟩)
                  (.leaf ⟨49, 426263, 426264⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨49, 426263, 426264⟩)
                  (.leaf ⟨49, 426263, 426264⟩)
                )
                (.branch 1
                  (.leaf ⟨50, 215975, 215976⟩)
                  (.leaf ⟨50, 215975, 215976⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨50, 215975, 215976⟩)
                  (.leaf ⟨50, 215975, 215976⟩)
                )
                (.branch 1
                  (.leaf ⟨50, 215975, 215976⟩)
                  (.leaf ⟨49, 426263, 426264⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨49, 426263, 426264⟩)
                  (.leaf ⟨49, 426263, 426264⟩)
                )
                (.branch 1
                  (.leaf ⟨49, 426263, 426264⟩)
                  (.leaf ⟨49, 426263, 426264⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_256_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨51, 429195, 429196⟩)
                  (.leaf ⟨51, 429195, 429196⟩)
                )
                (.branch 1
                  (.leaf ⟨51, 429195, 429196⟩)
                  (.leaf ⟨51, 429195, 429196⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨51, 429195, 429196⟩)
                  (.leaf ⟨52, 429359, 429360⟩)
                )
                (.branch 1
                  (.leaf ⟨52, 429359, 429360⟩)
                  (.leaf ⟨52, 429359, 429360⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨52, 429359, 429360⟩)
                  (.leaf ⟨52, 429359, 429360⟩)
                )
                (.branch 1
                  (.leaf ⟨53, 429391, 429392⟩)
                  (.leaf ⟨53, 429391, 429392⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨53, 429391, 429392⟩)
                  (.leaf ⟨53, 429391, 429392⟩)
                )
                (.branch 1
                  (.leaf ⟨53, 429391, 429392⟩)
                  (.leaf ⟨54, 426279, 426280⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨54, 426279, 426280⟩)
                  (.leaf ⟨54, 426279, 426280⟩)
                )
                (.branch 1
                  (.leaf ⟨54, 426279, 426280⟩)
                  (.leaf ⟨54, 426279, 426280⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨55, 426275, 426276⟩)
                  (.leaf ⟨55, 426275, 426276⟩)
                )
                (.branch 1
                  (.leaf ⟨55, 426275, 426276⟩)
                  (.leaf ⟨55, 426275, 426276⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨55, 426275, 426276⟩)
                  (.leaf ⟨56, 219983, 219984⟩)
                )
                (.branch 1
                  (.leaf ⟨56, 219983, 219984⟩)
                  (.leaf ⟨56, 219983, 219984⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨56, 219983, 219984⟩)
                  (.leaf ⟨56, 219983, 219984⟩)
                )
                (.branch 1
                  (.leaf ⟨55, 426275, 426276⟩)
                  (.leaf ⟨55, 426275, 426276⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨55, 426275, 426276⟩)
                  (.leaf ⟨55, 426275, 426276⟩)
                )
                (.branch 1
                  (.leaf ⟨55, 426275, 426276⟩)
                  (.leaf ⟨57, 429551, 429552⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨57, 429551, 429552⟩)
                  (.leaf ⟨57, 429551, 429552⟩)
                )
                (.branch 1
                  (.leaf ⟨57, 429551, 429552⟩)
                  (.leaf ⟨57, 429551, 429552⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨58, 429715, 429716⟩)
                  (.leaf ⟨58, 429715, 429716⟩)
                )
                (.branch 1
                  (.leaf ⟨58, 429715, 429716⟩)
                  (.leaf ⟨58, 429715, 429716⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨58, 429715, 429716⟩)
                  (.leaf ⟨59, 429747, 429748⟩)
                )
                (.branch 1
                  (.leaf ⟨59, 429747, 429748⟩)
                  (.leaf ⟨59, 429747, 429748⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨59, 429747, 429748⟩)
                  (.leaf ⟨59, 429747, 429748⟩)
                )
                (.branch 1
                  (.leaf ⟨60, 222827, 222828⟩)
                  (.leaf ⟨60, 222827, 222828⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨60, 222827, 222828⟩)
                  (.leaf ⟨60, 222827, 222828⟩)
                )
                (.branch 1
                  (.leaf ⟨60, 222827, 222828⟩)
                  (.leaf ⟨61, 426287, 426288⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨61, 426287, 426288⟩)
                  (.leaf ⟨61, 426287, 426288⟩)
                )
                (.branch 1
                  (.leaf ⟨61, 426287, 426288⟩)
                  (.leaf ⟨61, 426287, 426288⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨62, 223039, 223040⟩)
                  (.leaf ⟨62, 223039, 223040⟩)
                )
                (.branch 1
                  (.leaf ⟨62, 223039, 223040⟩)
                  (.leaf ⟨62, 223039, 223040⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨62, 223039, 223040⟩)
                  (.leaf ⟨61, 426287, 426288⟩)
                )
                (.branch 1
                  (.leaf ⟨61, 426287, 426288⟩)
                  (.leaf ⟨61, 426287, 426288⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨61, 426287, 426288⟩)
                  (.leaf ⟨61, 426287, 426288⟩)
                )
                (.branch 1
                  (.leaf ⟨63, 429779, 429780⟩)
                  (.leaf ⟨63, 429779, 429780⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨63, 429779, 429780⟩)
                  (.leaf ⟨63, 429779, 429780⟩)
                )
                (.branch 1
                  (.leaf ⟨63, 429779, 429780⟩)
                  (.leaf ⟨64, 426295, 426296⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨64, 426295, 426296⟩)
                  (.leaf ⟨64, 426295, 426296⟩)
                )
                (.branch 1
                  (.leaf ⟨64, 426295, 426296⟩)
                  (.leaf ⟨64, 426295, 426296⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨65, 426291, 426292⟩)
                  (.leaf ⟨65, 426291, 426292⟩)
                )
                (.branch 1
                  (.leaf ⟨65, 426291, 426292⟩)
                  (.leaf ⟨65, 426291, 426292⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨65, 426291, 426292⟩)
                  (.leaf ⟨66, 225859, 225860⟩)
                )
                (.branch 1
                  (.leaf ⟨66, 225859, 225860⟩)
                  (.leaf ⟨66, 225859, 225860⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨66, 225859, 225860⟩)
                  (.leaf ⟨66, 225859, 225860⟩)
                )
                (.branch 1
                  (.leaf ⟨65, 426291, 426292⟩)
                  (.leaf ⟨65, 426291, 426292⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨65, 426291, 426292⟩)
                  (.leaf ⟨65, 426291, 426292⟩)
                )
                (.branch 1
                  (.leaf ⟨65, 426291, 426292⟩)
                  (.leaf ⟨67, 430131, 430132⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨67, 430131, 430132⟩)
                  (.leaf ⟨67, 430131, 430132⟩)
                )
                (.branch 1
                  (.leaf ⟨67, 430131, 430132⟩)
                  (.leaf ⟨67, 430131, 430132⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨68, 430295, 430296⟩)
                  (.leaf ⟨68, 430295, 430296⟩)
                )
                (.branch 1
                  (.leaf ⟨68, 430295, 430296⟩)
                  (.leaf ⟨68, 430295, 430296⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨68, 430295, 430296⟩)
                  (.leaf ⟨69, 430327, 430328⟩)
                )
                (.branch 1
                  (.leaf ⟨69, 430327, 430328⟩)
                  (.leaf ⟨69, 430327, 430328⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨69, 430327, 430328⟩)
                  (.leaf ⟨69, 430327, 430328⟩)
                )
                (.branch 1
                  (.leaf ⟨70, 228703, 228704⟩)
                  (.leaf ⟨70, 228703, 228704⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨70, 228703, 228704⟩)
                  (.leaf ⟨70, 228703, 228704⟩)
                )
                (.branch 1
                  (.leaf ⟨70, 228703, 228704⟩)
                  (.leaf ⟨71, 426303, 426304⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨71, 426303, 426304⟩)
                  (.leaf ⟨71, 426303, 426304⟩)
                )
                (.branch 1
                  (.leaf ⟨71, 426303, 426304⟩)
                  (.leaf ⟨71, 426303, 426304⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨72, 228915, 228916⟩)
                  (.leaf ⟨72, 228915, 228916⟩)
                )
                (.branch 1
                  (.leaf ⟨72, 228915, 228916⟩)
                  (.leaf ⟨72, 228915, 228916⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨72, 228915, 228916⟩)
                  (.leaf ⟨71, 426303, 426304⟩)
                )
                (.branch 1
                  (.leaf ⟨71, 426303, 426304⟩)
                  (.leaf ⟨71, 426303, 426304⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨71, 426303, 426304⟩)
                  (.leaf ⟨71, 426303, 426304⟩)
                )
                (.branch 1
                  (.leaf ⟨73, 430359, 430360⟩)
                  (.leaf ⟨73, 430359, 430360⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨73, 430359, 430360⟩)
                  (.leaf ⟨73, 430359, 430360⟩)
                )
                (.branch 1
                  (.leaf ⟨73, 430359, 430360⟩)
                  (.leaf ⟨74, 426311, 426312⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨74, 426311, 426312⟩)
                  (.leaf ⟨74, 426311, 426312⟩)
                )
                (.branch 1
                  (.leaf ⟨74, 426311, 426312⟩)
                  (.leaf ⟨74, 426311, 426312⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨75, 426307, 426308⟩)
                  (.leaf ⟨75, 426307, 426308⟩)
                )
                (.branch 1
                  (.leaf ⟨75, 426307, 426308⟩)
                  (.leaf ⟨75, 426307, 426308⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨75, 426307, 426308⟩)
                  (.leaf ⟨76, 231735, 231736⟩)
                )
                (.branch 1
                  (.leaf ⟨76, 231735, 231736⟩)
                  (.leaf ⟨76, 231735, 231736⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨76, 231735, 231736⟩)
                  (.leaf ⟨76, 231735, 231736⟩)
                )
                (.branch 1
                  (.leaf ⟨75, 426307, 426308⟩)
                  (.leaf ⟨75, 426307, 426308⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨75, 426307, 426308⟩)
                  (.leaf ⟨75, 426307, 426308⟩)
                )
                (.branch 1
                  (.leaf ⟨75, 426307, 426308⟩)
                  (.leaf ⟨77, 430711, 430712⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨77, 430711, 430712⟩)
                  (.leaf ⟨77, 430711, 430712⟩)
                )
                (.branch 1
                  (.leaf ⟨77, 430711, 430712⟩)
                  (.leaf ⟨77, 430711, 430712⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨78, 430875, 430876⟩)
                  (.leaf ⟨78, 430875, 430876⟩)
                )
                (.branch 1
                  (.leaf ⟨78, 430875, 430876⟩)
                  (.leaf ⟨78, 430875, 430876⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨78, 430875, 430876⟩)
                  (.leaf ⟨79, 430907, 430908⟩)
                )
                (.branch 1
                  (.leaf ⟨79, 430907, 430908⟩)
                  (.leaf ⟨79, 430907, 430908⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨79, 430907, 430908⟩)
                  (.leaf ⟨79, 430907, 430908⟩)
                )
                (.branch 1
                  (.leaf ⟨80, 234579, 234580⟩)
                  (.leaf ⟨80, 234579, 234580⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨80, 234579, 234580⟩)
                  (.leaf ⟨80, 234579, 234580⟩)
                )
                (.branch 1
                  (.leaf ⟨80, 234579, 234580⟩)
                  (.leaf ⟨81, 426319, 426320⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨81, 426319, 426320⟩)
                  (.leaf ⟨81, 426319, 426320⟩)
                )
                (.branch 1
                  (.leaf ⟨81, 426319, 426320⟩)
                  (.leaf ⟨81, 426319, 426320⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨82, 234791, 234792⟩)
                  (.leaf ⟨82, 234791, 234792⟩)
                )
                (.branch 1
                  (.leaf ⟨82, 234791, 234792⟩)
                  (.leaf ⟨82, 234791, 234792⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨82, 234791, 234792⟩)
                  (.leaf ⟨81, 426319, 426320⟩)
                )
                (.branch 1
                  (.leaf ⟨81, 426319, 426320⟩)
                  (.leaf ⟨81, 426319, 426320⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨81, 426319, 426320⟩)
                  (.leaf ⟨81, 426319, 426320⟩)
                )
                (.branch 1
                  (.leaf ⟨83, 430939, 430940⟩)
                  (.leaf ⟨83, 430939, 430940⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨83, 430939, 430940⟩)
                  (.leaf ⟨83, 430939, 430940⟩)
                )
                (.branch 1
                  (.leaf ⟨83, 430939, 430940⟩)
                  (.leaf ⟨84, 426327, 426328⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨84, 426327, 426328⟩)
                  (.leaf ⟨84, 426327, 426328⟩)
                )
                (.branch 1
                  (.leaf ⟨84, 426327, 426328⟩)
                  (.leaf ⟨84, 426327, 426328⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨85, 426323, 426324⟩)
                  (.leaf ⟨85, 426323, 426324⟩)
                )
                (.branch 1
                  (.leaf ⟨85, 426323, 426324⟩)
                  (.leaf ⟨85, 426323, 426324⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨85, 426323, 426324⟩)
                  (.leaf ⟨86, 237623, 237624⟩)
                )
                (.branch 1
                  (.leaf ⟨86, 237623, 237624⟩)
                  (.leaf ⟨86, 237623, 237624⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨86, 237623, 237624⟩)
                  (.leaf ⟨86, 237623, 237624⟩)
                )
                (.branch 1
                  (.leaf ⟨85, 426323, 426324⟩)
                  (.leaf ⟨85, 426323, 426324⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨85, 426323, 426324⟩)
                  (.leaf ⟨85, 426323, 426324⟩)
                )
                (.branch 1
                  (.leaf ⟨85, 426323, 426324⟩)
                  (.leaf ⟨87, 431291, 431292⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨87, 431291, 431292⟩)
                  (.leaf ⟨87, 431291, 431292⟩)
                )
                (.branch 1
                  (.leaf ⟨87, 431291, 431292⟩)
                  (.leaf ⟨87, 431291, 431292⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨88, 426331, 426332⟩)
                  (.leaf ⟨88, 426331, 426332⟩)
                )
                (.branch 1
                  (.leaf ⟨88, 426331, 426332⟩)
                  (.leaf ⟨88, 426331, 426332⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨88, 426331, 426332⟩)
                  (.leaf ⟨89, 431487, 431488⟩)
                )
                (.branch 1
                  (.leaf ⟨89, 431487, 431488⟩)
                  (.leaf ⟨89, 431487, 431488⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨89, 431487, 431488⟩)
                  (.leaf ⟨89, 431487, 431488⟩)
                )
                (.branch 1
                  (.leaf ⟨90, 242063, 242064⟩)
                  (.leaf ⟨91, 426363, 426364⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨92, 242459, 242460⟩)
                  (.leaf ⟨93, 242463, 242464⟩)
                )
                (.branch 1
                  (.leaf ⟨94, 242467, 242468⟩)
                  (.leaf ⟨95, 431555, 431556⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨95, 431555, 431556⟩)
                  (.leaf ⟨96, 431559, 431560⟩)
                )
                (.branch 1
                  (.leaf ⟨97, 431563, 431564⟩)
                  (.leaf ⟨98, 431567, 431568⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨99, 426351, 426352⟩)
                  (.leaf ⟨99, 426351, 426352⟩)
                )
                (.branch 1
                  (.leaf ⟨99, 426351, 426352⟩)
                  (.leaf ⟨99, 426351, 426352⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨99, 426351, 426352⟩)
                  (.leaf ⟨100, 426335, 426336⟩)
                )
                (.branch 1
                  (.leaf ⟨100, 426335, 426336⟩)
                  (.leaf ⟨101, 426339, 426340⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨102, 426343, 426344⟩)
                  (.leaf ⟨103, 426347, 426348⟩)
                )
                (.branch 1
                  (.leaf ⟨104, 245747, 245748⟩)
                  (.leaf ⟨104, 245747, 245748⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨104, 245747, 245748⟩)
                  (.leaf ⟨104, 245747, 245748⟩)
                )
                (.branch 1
                  (.leaf ⟨104, 245747, 245748⟩)
                  (.leaf ⟨104, 245747, 245748⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_0_512 : Balanced.RowTree Cell :=
  .branch 256 cache_0_256 cache_256_256
noncomputable def cache_512_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨100, 426335, 426336⟩)
                  (.leaf ⟨101, 426339, 426340⟩)
                )
                (.branch 1
                  (.leaf ⟨102, 426343, 426344⟩)
                  (.leaf ⟨103, 426347, 426348⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨105, 431719, 431720⟩)
                  (.leaf ⟨105, 431719, 431720⟩)
                )
                (.branch 1
                  (.leaf ⟨105, 431719, 431720⟩)
                  (.leaf ⟨105, 431719, 431720⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨105, 431719, 431720⟩)
                  (.leaf ⟨106, 431751, 431752⟩)
                )
                (.branch 1
                  (.leaf ⟨106, 431751, 431752⟩)
                  (.leaf ⟨106, 431751, 431752⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨106, 431751, 431752⟩)
                  (.leaf ⟨106, 431751, 431752⟩)
                )
                (.branch 1
                  (.leaf ⟨107, 426359, 426360⟩)
                  (.leaf ⟨107, 426359, 426360⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨107, 426359, 426360⟩)
                  (.leaf ⟨107, 426359, 426360⟩)
                )
                (.branch 1
                  (.leaf ⟨107, 426359, 426360⟩)
                  (.leaf ⟨108, 426355, 426356⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨108, 426355, 426356⟩)
                  (.leaf ⟨108, 426355, 426356⟩)
                )
                (.branch 1
                  (.leaf ⟨108, 426355, 426356⟩)
                  (.leaf ⟨108, 426355, 426356⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨109, 247759, 247760⟩)
                  (.leaf ⟨109, 247759, 247760⟩)
                )
                (.branch 1
                  (.leaf ⟨109, 247759, 247760⟩)
                  (.leaf ⟨109, 247759, 247760⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨109, 247759, 247760⟩)
                  (.leaf ⟨108, 426355, 426356⟩)
                )
                (.branch 1
                  (.leaf ⟨108, 426355, 426356⟩)
                  (.leaf ⟨108, 426355, 426356⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨108, 426355, 426356⟩)
                  (.leaf ⟨108, 426355, 426356⟩)
                )
                (.branch 1
                  (.leaf ⟨110, 431895, 431896⟩)
                  (.leaf ⟨110, 431895, 431896⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨110, 431895, 431896⟩)
                  (.leaf ⟨110, 431895, 431896⟩)
                )
                (.branch 1
                  (.leaf ⟨110, 431895, 431896⟩)
                  (.leaf ⟨111, 432059, 432060⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨111, 432059, 432060⟩)
                  (.leaf ⟨111, 432059, 432060⟩)
                )
                (.branch 1
                  (.leaf ⟨111, 432059, 432060⟩)
                  (.leaf ⟨111, 432059, 432060⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨112, 432091, 432092⟩)
                  (.leaf ⟨112, 432091, 432092⟩)
                )
                (.branch 1
                  (.leaf ⟨112, 432091, 432092⟩)
                  (.leaf ⟨112, 432091, 432092⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨112, 432091, 432092⟩)
                  (.leaf ⟨113, 426371, 426372⟩)
                )
                (.branch 1
                  (.leaf ⟨113, 426371, 426372⟩)
                  (.leaf ⟨113, 426371, 426372⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨113, 426371, 426372⟩)
                  (.leaf ⟨113, 426371, 426372⟩)
                )
                (.branch 1
                  (.leaf ⟨114, 426367, 426368⟩)
                  (.leaf ⟨114, 426367, 426368⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨114, 426367, 426368⟩)
                  (.leaf ⟨114, 426367, 426368⟩)
                )
                (.branch 1
                  (.leaf ⟨114, 426367, 426368⟩)
                  (.leaf ⟨115, 252047, 252048⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨115, 252047, 252048⟩)
                  (.leaf ⟨115, 252047, 252048⟩)
                )
                (.branch 1
                  (.leaf ⟨115, 252047, 252048⟩)
                  (.leaf ⟨115, 252047, 252048⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨114, 426367, 426368⟩)
                  (.leaf ⟨114, 426367, 426368⟩)
                )
                (.branch 1
                  (.leaf ⟨114, 426367, 426368⟩)
                  (.leaf ⟨114, 426367, 426368⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨114, 426367, 426368⟩)
                  (.leaf ⟨116, 432251, 432252⟩)
                )
                (.branch 1
                  (.leaf ⟨116, 432251, 432252⟩)
                  (.leaf ⟨116, 432251, 432252⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨116, 432251, 432252⟩)
                  (.leaf ⟨116, 432251, 432252⟩)
                )
                (.branch 1
                  (.leaf ⟨117, 432415, 432416⟩)
                  (.leaf ⟨117, 432415, 432416⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨117, 432415, 432416⟩)
                  (.leaf ⟨117, 432415, 432416⟩)
                )
                (.branch 1
                  (.leaf ⟨117, 432415, 432416⟩)
                  (.leaf ⟨118, 432447, 432448⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨118, 432447, 432448⟩)
                  (.leaf ⟨118, 432447, 432448⟩)
                )
                (.branch 1
                  (.leaf ⟨118, 432447, 432448⟩)
                  (.leaf ⟨118, 432447, 432448⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨119, 426383, 426384⟩)
                  (.leaf ⟨119, 426383, 426384⟩)
                )
                (.branch 1
                  (.leaf ⟨119, 426383, 426384⟩)
                  (.leaf ⟨119, 426383, 426384⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨119, 426383, 426384⟩)
                  (.leaf ⟨120, 426379, 426380⟩)
                )
                (.branch 1
                  (.leaf ⟨120, 426379, 426380⟩)
                  (.leaf ⟨120, 426379, 426380⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨120, 426379, 426380⟩)
                  (.leaf ⟨120, 426379, 426380⟩)
                )
                (.branch 1
                  (.leaf ⟨121, 256347, 256348⟩)
                  (.leaf ⟨121, 256347, 256348⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨121, 256347, 256348⟩)
                  (.leaf ⟨121, 256347, 256348⟩)
                )
                (.branch 1
                  (.leaf ⟨121, 256347, 256348⟩)
                  (.leaf ⟨120, 426379, 426380⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨120, 426379, 426380⟩)
                  (.leaf ⟨120, 426379, 426380⟩)
                )
                (.branch 1
                  (.leaf ⟨120, 426379, 426380⟩)
                  (.leaf ⟨120, 426379, 426380⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨122, 432607, 432608⟩)
                  (.leaf ⟨122, 432607, 432608⟩)
                )
                (.branch 1
                  (.leaf ⟨122, 432607, 432608⟩)
                  (.leaf ⟨122, 432607, 432608⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨122, 432607, 432608⟩)
                  (.leaf ⟨123, 426387, 426388⟩)
                )
                (.branch 1
                  (.leaf ⟨123, 426387, 426388⟩)
                  (.leaf ⟨123, 426387, 426388⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨123, 426387, 426388⟩)
                  (.leaf ⟨123, 426387, 426388⟩)
                )
                (.branch 1
                  (.leaf ⟨124, 432783, 432784⟩)
                  (.leaf ⟨124, 432783, 432784⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨124, 432783, 432784⟩)
                  (.leaf ⟨124, 432783, 432784⟩)
                )
                (.branch 1
                  (.leaf ⟨124, 432783, 432784⟩)
                  (.leaf ⟨125, 426443, 426444⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨125, 426443, 426444⟩)
                  (.leaf ⟨125, 426443, 426444⟩)
                )
                (.branch 1
                  (.leaf ⟨125, 426443, 426444⟩)
                  (.leaf ⟨125, 426443, 426444⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨126, 432967, 432968⟩)
                  (.leaf ⟨126, 432967, 432968⟩)
                )
                (.branch 1
                  (.leaf ⟨126, 432967, 432968⟩)
                  (.leaf ⟨126, 432967, 432968⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨126, 432967, 432968⟩)
                  (.leaf ⟨127, 433143, 433144⟩)
                )
                (.branch 1
                  (.leaf ⟨127, 433143, 433144⟩)
                  (.leaf ⟨127, 433143, 433144⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨127, 433143, 433144⟩)
                  (.leaf ⟨127, 433143, 433144⟩)
                )
                (.branch 1
                  (.leaf ⟨128, 426455, 426456⟩)
                  (.leaf ⟨128, 426455, 426456⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨128, 426455, 426456⟩)
                  (.leaf ⟨128, 426455, 426456⟩)
                )
                (.branch 1
                  (.leaf ⟨128, 426455, 426456⟩)
                  (.leaf ⟨129, 433327, 433328⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨129, 433327, 433328⟩)
                  (.leaf ⟨129, 433327, 433328⟩)
                )
                (.branch 1
                  (.leaf ⟨129, 433327, 433328⟩)
                  (.leaf ⟨129, 433327, 433328⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨130, 433503, 433504⟩)
                  (.leaf ⟨130, 433503, 433504⟩)
                )
                (.branch 1
                  (.leaf ⟨130, 433503, 433504⟩)
                  (.leaf ⟨130, 433503, 433504⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨130, 433503, 433504⟩)
                  (.leaf ⟨131, 426491, 426492⟩)
                )
                (.branch 1
                  (.leaf ⟨131, 426491, 426492⟩)
                  (.leaf ⟨131, 426491, 426492⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨131, 426491, 426492⟩)
                  (.leaf ⟨131, 426491, 426492⟩)
                )
                (.branch 1
                  (.leaf ⟨132, 433687, 433688⟩)
                  (.leaf ⟨132, 433687, 433688⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨132, 433687, 433688⟩)
                  (.leaf ⟨132, 433687, 433688⟩)
                )
                (.branch 1
                  (.leaf ⟨132, 433687, 433688⟩)
                  (.leaf ⟨133, 433863, 433864⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨133, 433863, 433864⟩)
                  (.leaf ⟨133, 433863, 433864⟩)
                )
                (.branch 1
                  (.leaf ⟨133, 433863, 433864⟩)
                  (.leaf ⟨133, 433863, 433864⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨134, 426503, 426504⟩)
                  (.leaf ⟨134, 426503, 426504⟩)
                )
                (.branch 1
                  (.leaf ⟨134, 426503, 426504⟩)
                  (.leaf ⟨134, 426503, 426504⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨134, 426503, 426504⟩)
                  (.leaf ⟨135, 434047, 434048⟩)
                )
                (.branch 1
                  (.leaf ⟨135, 434047, 434048⟩)
                  (.leaf ⟨135, 434047, 434048⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨135, 434047, 434048⟩)
                  (.leaf ⟨135, 434047, 434048⟩)
                )
                (.branch 1
                  (.leaf ⟨136, 434223, 434224⟩)
                  (.leaf ⟨136, 434223, 434224⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨136, 434223, 434224⟩)
                  (.leaf ⟨136, 434223, 434224⟩)
                )
                (.branch 1
                  (.leaf ⟨136, 434223, 434224⟩)
                  (.leaf ⟨137, 426547, 426548⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨137, 426547, 426548⟩)
                  (.leaf ⟨137, 426547, 426548⟩)
                )
                (.branch 1
                  (.leaf ⟨137, 426547, 426548⟩)
                  (.leaf ⟨137, 426547, 426548⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨138, 434407, 434408⟩)
                  (.leaf ⟨138, 434407, 434408⟩)
                )
                (.branch 1
                  (.leaf ⟨138, 434407, 434408⟩)
                  (.leaf ⟨138, 434407, 434408⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨138, 434407, 434408⟩)
                  (.leaf ⟨139, 434583, 434584⟩)
                )
                (.branch 1
                  (.leaf ⟨139, 434583, 434584⟩)
                  (.leaf ⟨139, 434583, 434584⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨139, 434583, 434584⟩)
                  (.leaf ⟨139, 434583, 434584⟩)
                )
                (.branch 1
                  (.leaf ⟨140, 426595, 426596⟩)
                  (.leaf ⟨140, 426595, 426596⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨140, 426595, 426596⟩)
                  (.leaf ⟨140, 426595, 426596⟩)
                )
                (.branch 1
                  (.leaf ⟨140, 426595, 426596⟩)
                  (.leaf ⟨141, 434767, 434768⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨141, 434767, 434768⟩)
                  (.leaf ⟨141, 434767, 434768⟩)
                )
                (.branch 1
                  (.leaf ⟨141, 434767, 434768⟩)
                  (.leaf ⟨141, 434767, 434768⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨142, 434943, 434944⟩)
                  (.leaf ⟨142, 434943, 434944⟩)
                )
                (.branch 1
                  (.leaf ⟨142, 434943, 434944⟩)
                  (.leaf ⟨142, 434943, 434944⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨142, 434943, 434944⟩)
                  (.leaf ⟨143, 426627, 426628⟩)
                )
                (.branch 1
                  (.leaf ⟨143, 426627, 426628⟩)
                  (.leaf ⟨143, 426627, 426628⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨143, 426627, 426628⟩)
                  (.leaf ⟨143, 426627, 426628⟩)
                )
                (.branch 1
                  (.leaf ⟨144, 435127, 435128⟩)
                  (.leaf ⟨144, 435127, 435128⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨144, 435127, 435128⟩)
                  (.leaf ⟨144, 435127, 435128⟩)
                )
                (.branch 1
                  (.leaf ⟨144, 435127, 435128⟩)
                  (.leaf ⟨145, 290347, 290348⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨145, 290347, 290348⟩)
                  (.leaf ⟨145, 290347, 290348⟩)
                )
                (.branch 1
                  (.leaf ⟨145, 290347, 290348⟩)
                  (.leaf ⟨145, 290347, 290348⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨146, 435179, 435180⟩)
                  (.leaf ⟨146, 435179, 435180⟩)
                )
                (.branch 1
                  (.leaf ⟨146, 435179, 435180⟩)
                  (.leaf ⟨146, 435179, 435180⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨146, 435179, 435180⟩)
                  (.leaf ⟨147, 435215, 435216⟩)
                )
                (.branch 1
                  (.leaf ⟨147, 435215, 435216⟩)
                  (.leaf ⟨147, 435215, 435216⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨147, 435215, 435216⟩)
                  (.leaf ⟨147, 435215, 435216⟩)
                )
                (.branch 1
                  (.leaf ⟨148, 435247, 435248⟩)
                  (.leaf ⟨148, 435247, 435248⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨148, 435247, 435248⟩)
                  (.leaf ⟨148, 435247, 435248⟩)
                )
                (.branch 1
                  (.leaf ⟨148, 435247, 435248⟩)
                  (.leaf ⟨149, 362527, 362528⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨149, 362527, 362528⟩)
                  (.leaf ⟨149, 362527, 362528⟩)
                )
                (.branch 1
                  (.leaf ⟨149, 362527, 362528⟩)
                  (.leaf ⟨149, 362527, 362528⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨150, 426451, 426452⟩)
                  (.leaf ⟨150, 426451, 426452⟩)
                )
                (.branch 1
                  (.leaf ⟨150, 426451, 426452⟩)
                  (.leaf ⟨150, 426451, 426452⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨150, 426451, 426452⟩)
                  (.leaf ⟨151, 294179, 294180⟩)
                )
                (.branch 1
                  (.leaf ⟨151, 294179, 294180⟩)
                  (.leaf ⟨151, 294179, 294180⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨151, 294179, 294180⟩)
                  (.leaf ⟨151, 294179, 294180⟩)
                )
                (.branch 1
                  (.leaf ⟨150, 426451, 426452⟩)
                  (.leaf ⟨150, 426451, 426452⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_768_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨150, 426451, 426452⟩)
                  (.leaf ⟨150, 426451, 426452⟩)
                )
                (.branch 1
                  (.leaf ⟨150, 426451, 426452⟩)
                  (.leaf ⟨152, 426675, 426676⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨152, 426675, 426676⟩)
                  (.leaf ⟨152, 426675, 426676⟩)
                )
                (.branch 1
                  (.leaf ⟨152, 426675, 426676⟩)
                  (.leaf ⟨152, 426675, 426676⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨153, 435299, 435300⟩)
                  (.leaf ⟨153, 435299, 435300⟩)
                )
                (.branch 1
                  (.leaf ⟨153, 435299, 435300⟩)
                  (.leaf ⟨153, 435299, 435300⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨153, 435299, 435300⟩)
                  (.leaf ⟨154, 435335, 435336⟩)
                )
                (.branch 1
                  (.leaf ⟨154, 435335, 435336⟩)
                  (.leaf ⟨154, 435335, 435336⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨154, 435335, 435336⟩)
                  (.leaf ⟨154, 435335, 435336⟩)
                )
                (.branch 1
                  (.leaf ⟨155, 435515, 435516⟩)
                  (.leaf ⟨155, 435515, 435516⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨155, 435515, 435516⟩)
                  (.leaf ⟨155, 435515, 435516⟩)
                )
                (.branch 1
                  (.leaf ⟨155, 435515, 435516⟩)
                  (.leaf ⟨156, 435575, 435576⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨157, 435579, 435580⟩)
                  (.leaf ⟨156, 435575, 435576⟩)
                )
                (.branch 1
                  (.leaf ⟨156, 435575, 435576⟩)
                  (.leaf ⟨156, 435575, 435576⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨158, 299523, 299524⟩)
                  (.leaf ⟨159, 301731, 301732⟩)
                )
                (.branch 1
                  (.leaf ⟨158, 299523, 299524⟩)
                  (.leaf ⟨158, 299523, 299524⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨158, 299523, 299524⟩)
                  (.leaf ⟨160, 426467, 426468⟩)
                )
                (.branch 1
                  (.leaf ⟨161, 426471, 426472⟩)
                  (.leaf ⟨160, 426467, 426468⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨160, 426467, 426468⟩)
                  (.leaf ⟨160, 426467, 426468⟩)
                )
                (.branch 1
                  (.leaf ⟨162, 299159, 299160⟩)
                  (.leaf ⟨163, 299163, 299164⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨162, 299159, 299160⟩)
                  (.leaf ⟨162, 299159, 299160⟩)
                )
                (.branch 1
                  (.leaf ⟨162, 299159, 299160⟩)
                  (.leaf ⟨160, 426467, 426468⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨161, 426471, 426472⟩)
                  (.leaf ⟨160, 426467, 426468⟩)
                )
                (.branch 1
                  (.leaf ⟨160, 426467, 426468⟩)
                  (.leaf ⟨160, 426467, 426468⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨164, 426475, 426476⟩)
                  (.leaf ⟨165, 426479, 426480⟩)
                )
                (.branch 1
                  (.leaf ⟨164, 426475, 426476⟩)
                  (.leaf ⟨164, 426475, 426476⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨164, 426475, 426476⟩)
                  (.leaf ⟨166, 435623, 435624⟩)
                )
                (.branch 1
                  (.leaf ⟨166, 435623, 435624⟩)
                  (.leaf ⟨166, 435623, 435624⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨166, 435623, 435624⟩)
                  (.leaf ⟨166, 435623, 435624⟩)
                )
                (.branch 1
                  (.leaf ⟨167, 435819, 435820⟩)
                  (.leaf ⟨167, 435819, 435820⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨167, 435819, 435820⟩)
                  (.leaf ⟨167, 435819, 435820⟩)
                )
                (.branch 1
                  (.leaf ⟨167, 435819, 435820⟩)
                  (.leaf ⟨168, 435995, 435996⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨168, 435995, 435996⟩)
                  (.leaf ⟨168, 435995, 435996⟩)
                )
                (.branch 1
                  (.leaf ⟨168, 435995, 435996⟩)
                  (.leaf ⟨168, 435995, 435996⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨169, 436151, 436152⟩)
                  (.leaf ⟨169, 436151, 436152⟩)
                )
                (.branch 1
                  (.leaf ⟨169, 436151, 436152⟩)
                  (.leaf ⟨169, 436151, 436152⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨169, 436151, 436152⟩)
                  (.leaf ⟨170, 436203, 436204⟩)
                )
                (.branch 1
                  (.leaf ⟨170, 436203, 436204⟩)
                  (.leaf ⟨170, 436203, 436204⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨170, 436203, 436204⟩)
                  (.leaf ⟨170, 436203, 436204⟩)
                )
                (.branch 1
                  (.leaf ⟨171, 436239, 436240⟩)
                  (.leaf ⟨171, 436239, 436240⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨171, 436239, 436240⟩)
                  (.leaf ⟨171, 436239, 436240⟩)
                )
                (.branch 1
                  (.leaf ⟨171, 436239, 436240⟩)
                  (.leaf ⟨172, 436283, 436284⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨172, 436283, 436284⟩)
                  (.leaf ⟨172, 436283, 436284⟩)
                )
                (.branch 1
                  (.leaf ⟨172, 436283, 436284⟩)
                  (.leaf ⟨172, 436283, 436284⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨173, 436447, 436448⟩)
                  (.leaf ⟨173, 436447, 436448⟩)
                )
                (.branch 1
                  (.leaf ⟨173, 436447, 436448⟩)
                  (.leaf ⟨173, 436447, 436448⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨173, 436447, 436448⟩)
                  (.leaf ⟨174, 436479, 436480⟩)
                )
                (.branch 1
                  (.leaf ⟨174, 436479, 436480⟩)
                  (.leaf ⟨174, 436479, 436480⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨174, 436479, 436480⟩)
                  (.leaf ⟨174, 436479, 436480⟩)
                )
                (.branch 1
                  (.leaf ⟨175, 426511, 426512⟩)
                  (.leaf ⟨175, 426511, 426512⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨175, 426511, 426512⟩)
                  (.leaf ⟨175, 426511, 426512⟩)
                )
                (.branch 1
                  (.leaf ⟨175, 426511, 426512⟩)
                  (.leaf ⟨176, 426507, 426508⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨176, 426507, 426508⟩)
                  (.leaf ⟨176, 426507, 426508⟩)
                )
                (.branch 1
                  (.leaf ⟨176, 426507, 426508⟩)
                  (.leaf ⟨176, 426507, 426508⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨177, 310943, 310944⟩)
                  (.leaf ⟨177, 310943, 310944⟩)
                )
                (.branch 1
                  (.leaf ⟨177, 310943, 310944⟩)
                  (.leaf ⟨177, 310943, 310944⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨177, 310943, 310944⟩)
                  (.leaf ⟨176, 426507, 426508⟩)
                )
                (.branch 1
                  (.leaf ⟨176, 426507, 426508⟩)
                  (.leaf ⟨176, 426507, 426508⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨176, 426507, 426508⟩)
                  (.leaf ⟨176, 426507, 426508⟩)
                )
                (.branch 1
                  (.leaf ⟨178, 436639, 436640⟩)
                  (.leaf ⟨178, 436639, 436640⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨178, 436639, 436640⟩)
                  (.leaf ⟨178, 436639, 436640⟩)
                )
                (.branch 1
                  (.leaf ⟨178, 436639, 436640⟩)
                  (.leaf ⟨179, 436671, 436672⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨179, 436671, 436672⟩)
                  (.leaf ⟨179, 436671, 436672⟩)
                )
                (.branch 1
                  (.leaf ⟨179, 436671, 436672⟩)
                  (.leaf ⟨179, 436671, 436672⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨180, 426519, 426520⟩)
                  (.leaf ⟨180, 426519, 426520⟩)
                )
                (.branch 1
                  (.leaf ⟨180, 426519, 426520⟩)
                  (.leaf ⟨180, 426519, 426520⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨180, 426519, 426520⟩)
                  (.leaf ⟨181, 426515, 426516⟩)
                )
                (.branch 1
                  (.leaf ⟨181, 426515, 426516⟩)
                  (.leaf ⟨181, 426515, 426516⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨181, 426515, 426516⟩)
                  (.leaf ⟨181, 426515, 426516⟩)
                )
                (.branch 1
                  (.leaf ⟨182, 313839, 313840⟩)
                  (.leaf ⟨182, 313839, 313840⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨182, 313839, 313840⟩)
                  (.leaf ⟨182, 313839, 313840⟩)
                )
                (.branch 1
                  (.leaf ⟨182, 313839, 313840⟩)
                  (.leaf ⟨181, 426515, 426516⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨181, 426515, 426516⟩)
                  (.leaf ⟨181, 426515, 426516⟩)
                )
                (.branch 1
                  (.leaf ⟨181, 426515, 426516⟩)
                  (.leaf ⟨181, 426515, 426516⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨183, 436855, 436856⟩)
                  (.leaf ⟨183, 436855, 436856⟩)
                )
                (.branch 1
                  (.leaf ⟨183, 436855, 436856⟩)
                  (.leaf ⟨183, 436855, 436856⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨183, 436855, 436856⟩)
                  (.leaf ⟨184, 437243, 437244⟩)
                )
                (.branch 1
                  (.leaf ⟨184, 437243, 437244⟩)
                  (.leaf ⟨184, 437243, 437244⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨184, 437243, 437244⟩)
                  (.leaf ⟨184, 437243, 437244⟩)
                )
                (.branch 1
                  (.leaf ⟨185, 437275, 437276⟩)
                  (.leaf ⟨185, 437275, 437276⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨185, 437275, 437276⟩)
                  (.leaf ⟨185, 437275, 437276⟩)
                )
                (.branch 1
                  (.leaf ⟨185, 437275, 437276⟩)
                  (.leaf ⟨186, 317919, 317920⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨186, 317919, 317920⟩)
                  (.leaf ⟨186, 317919, 317920⟩)
                )
                (.branch 1
                  (.leaf ⟨186, 317919, 317920⟩)
                  (.leaf ⟨186, 317919, 317920⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨187, 426527, 426528⟩)
                  (.leaf ⟨187, 426527, 426528⟩)
                )
                (.branch 1
                  (.leaf ⟨187, 426527, 426528⟩)
                  (.leaf ⟨187, 426527, 426528⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨187, 426527, 426528⟩)
                  (.leaf ⟨188, 318131, 318132⟩)
                )
                (.branch 1
                  (.leaf ⟨188, 318131, 318132⟩)
                  (.leaf ⟨188, 318131, 318132⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨188, 318131, 318132⟩)
                  (.leaf ⟨188, 318131, 318132⟩)
                )
                (.branch 1
                  (.leaf ⟨187, 426527, 426528⟩)
                  (.leaf ⟨187, 426527, 426528⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨187, 426527, 426528⟩)
                  (.leaf ⟨187, 426527, 426528⟩)
                )
                (.branch 1
                  (.leaf ⟨187, 426527, 426528⟩)
                  (.leaf ⟨189, 437307, 437308⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨189, 437307, 437308⟩)
                  (.leaf ⟨189, 437307, 437308⟩)
                )
                (.branch 1
                  (.leaf ⟨189, 437307, 437308⟩)
                  (.leaf ⟨189, 437307, 437308⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨190, 426535, 426536⟩)
                  (.leaf ⟨190, 426535, 426536⟩)
                )
                (.branch 1
                  (.leaf ⟨190, 426535, 426536⟩)
                  (.leaf ⟨190, 426535, 426536⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨190, 426535, 426536⟩)
                  (.leaf ⟨191, 426531, 426532⟩)
                )
                (.branch 1
                  (.leaf ⟨191, 426531, 426532⟩)
                  (.leaf ⟨191, 426531, 426532⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨191, 426531, 426532⟩)
                  (.leaf ⟨191, 426531, 426532⟩)
                )
                (.branch 1
                  (.leaf ⟨192, 319927, 319928⟩)
                  (.leaf ⟨192, 319927, 319928⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨192, 319927, 319928⟩)
                  (.leaf ⟨192, 319927, 319928⟩)
                )
                (.branch 1
                  (.leaf ⟨192, 319927, 319928⟩)
                  (.leaf ⟨191, 426531, 426532⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨191, 426531, 426532⟩)
                  (.leaf ⟨191, 426531, 426532⟩)
                )
                (.branch 1
                  (.leaf ⟨191, 426531, 426532⟩)
                  (.leaf ⟨191, 426531, 426532⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨193, 437459, 437460⟩)
                  (.leaf ⟨193, 437459, 437460⟩)
                )
                (.branch 1
                  (.leaf ⟨193, 437459, 437460⟩)
                  (.leaf ⟨193, 437459, 437460⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨193, 437459, 437460⟩)
                  (.leaf ⟨194, 437491, 437492⟩)
                )
                (.branch 1
                  (.leaf ⟨194, 437491, 437492⟩)
                  (.leaf ⟨194, 437491, 437492⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨194, 437491, 437492⟩)
                  (.leaf ⟨194, 437491, 437492⟩)
                )
                (.branch 1
                  (.leaf ⟨195, 426543, 426544⟩)
                  (.leaf ⟨195, 426543, 426544⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨195, 426543, 426544⟩)
                  (.leaf ⟨195, 426543, 426544⟩)
                )
                (.branch 1
                  (.leaf ⟨195, 426543, 426544⟩)
                  (.leaf ⟨196, 426539, 426540⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨196, 426539, 426540⟩)
                  (.leaf ⟨196, 426539, 426540⟩)
                )
                (.branch 1
                  (.leaf ⟨196, 426539, 426540⟩)
                  (.leaf ⟨196, 426539, 426540⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨197, 322127, 322128⟩)
                  (.leaf ⟨197, 322127, 322128⟩)
                )
                (.branch 1
                  (.leaf ⟨197, 322127, 322128⟩)
                  (.leaf ⟨197, 322127, 322128⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨197, 322127, 322128⟩)
                  (.leaf ⟨196, 426539, 426540⟩)
                )
                (.branch 1
                  (.leaf ⟨196, 426539, 426540⟩)
                  (.leaf ⟨196, 426539, 426540⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨196, 426539, 426540⟩)
                  (.leaf ⟨196, 426539, 426540⟩)
                )
                (.branch 1
                  (.leaf ⟨198, 437651, 437652⟩)
                  (.leaf ⟨198, 437651, 437652⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨198, 437651, 437652⟩)
                  (.leaf ⟨198, 437651, 437652⟩)
                )
                (.branch 1
                  (.leaf ⟨198, 437651, 437652⟩)
                  (.leaf ⟨199, 437815, 437816⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨199, 437815, 437816⟩)
                  (.leaf ⟨199, 437815, 437816⟩)
                )
                (.branch 1
                  (.leaf ⟨199, 437815, 437816⟩)
                  (.leaf ⟨199, 437815, 437816⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨200, 437847, 437848⟩)
                  (.leaf ⟨200, 437847, 437848⟩)
                )
                (.branch 1
                  (.leaf ⟨200, 437847, 437848⟩)
                  (.leaf ⟨200, 437847, 437848⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨200, 437847, 437848⟩)
                  (.leaf ⟨201, 426555, 426556⟩)
                )
                (.branch 1
                  (.leaf ⟨201, 426555, 426556⟩)
                  (.leaf ⟨201, 426555, 426556⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_512_512 : Balanced.RowTree Cell :=
  .branch 256 cache_512_256 cache_768_256
noncomputable def cache_0_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_0_512 cache_512_512
noncomputable def cache_1024_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨201, 426555, 426556⟩)
                  (.leaf ⟨201, 426555, 426556⟩)
                )
                (.branch 1
                  (.leaf ⟨202, 426551, 426552⟩)
                  (.leaf ⟨202, 426551, 426552⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨202, 426551, 426552⟩)
                  (.leaf ⟨202, 426551, 426552⟩)
                )
                (.branch 1
                  (.leaf ⟨202, 426551, 426552⟩)
                  (.leaf ⟨203, 326307, 326308⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨203, 326307, 326308⟩)
                  (.leaf ⟨203, 326307, 326308⟩)
                )
                (.branch 1
                  (.leaf ⟨203, 326307, 326308⟩)
                  (.leaf ⟨203, 326307, 326308⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨202, 426551, 426552⟩)
                  (.leaf ⟨202, 426551, 426552⟩)
                )
                (.branch 1
                  (.leaf ⟨202, 426551, 426552⟩)
                  (.leaf ⟨202, 426551, 426552⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨202, 426551, 426552⟩)
                  (.leaf ⟨204, 438007, 438008⟩)
                )
                (.branch 1
                  (.leaf ⟨204, 438007, 438008⟩)
                  (.leaf ⟨204, 438007, 438008⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨204, 438007, 438008⟩)
                  (.leaf ⟨204, 438007, 438008⟩)
                )
                (.branch 1
                  (.leaf ⟨205, 438171, 438172⟩)
                  (.leaf ⟨205, 438171, 438172⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨205, 438171, 438172⟩)
                  (.leaf ⟨205, 438171, 438172⟩)
                )
                (.branch 1
                  (.leaf ⟨205, 438171, 438172⟩)
                  (.leaf ⟨206, 438203, 438204⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨206, 438203, 438204⟩)
                  (.leaf ⟨206, 438203, 438204⟩)
                )
                (.branch 1
                  (.leaf ⟨206, 438203, 438204⟩)
                  (.leaf ⟨206, 438203, 438204⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨207, 426567, 426568⟩)
                  (.leaf ⟨207, 426567, 426568⟩)
                )
                (.branch 1
                  (.leaf ⟨207, 426567, 426568⟩)
                  (.leaf ⟨207, 426567, 426568⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨207, 426567, 426568⟩)
                  (.leaf ⟨208, 426563, 426564⟩)
                )
                (.branch 1
                  (.leaf ⟨208, 426563, 426564⟩)
                  (.leaf ⟨208, 426563, 426564⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨208, 426563, 426564⟩)
                  (.leaf ⟨208, 426563, 426564⟩)
                )
                (.branch 1
                  (.leaf ⟨209, 330487, 330488⟩)
                  (.leaf ⟨209, 330487, 330488⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨209, 330487, 330488⟩)
                  (.leaf ⟨209, 330487, 330488⟩)
                )
                (.branch 1
                  (.leaf ⟨209, 330487, 330488⟩)
                  (.leaf ⟨208, 426563, 426564⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨208, 426563, 426564⟩)
                  (.leaf ⟨208, 426563, 426564⟩)
                )
                (.branch 1
                  (.leaf ⟨208, 426563, 426564⟩)
                  (.leaf ⟨208, 426563, 426564⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨210, 438363, 438364⟩)
                  (.leaf ⟨210, 438363, 438364⟩)
                )
                (.branch 1
                  (.leaf ⟨210, 438363, 438364⟩)
                  (.leaf ⟨210, 438363, 438364⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨210, 438363, 438364⟩)
                  (.leaf ⟨211, 438527, 438528⟩)
                )
                (.branch 1
                  (.leaf ⟨211, 438527, 438528⟩)
                  (.leaf ⟨211, 438527, 438528⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨211, 438527, 438528⟩)
                  (.leaf ⟨211, 438527, 438528⟩)
                )
                (.branch 1
                  (.leaf ⟨212, 438559, 438560⟩)
                  (.leaf ⟨212, 438559, 438560⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨212, 438559, 438560⟩)
                  (.leaf ⟨212, 438559, 438560⟩)
                )
                (.branch 1
                  (.leaf ⟨212, 438559, 438560⟩)
                  (.leaf ⟨213, 426579, 426580⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨213, 426579, 426580⟩)
                  (.leaf ⟨213, 426579, 426580⟩)
                )
                (.branch 1
                  (.leaf ⟨213, 426579, 426580⟩)
                  (.leaf ⟨213, 426579, 426580⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨214, 426575, 426576⟩)
                  (.leaf ⟨214, 426575, 426576⟩)
                )
                (.branch 1
                  (.leaf ⟨214, 426575, 426576⟩)
                  (.leaf ⟨214, 426575, 426576⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨214, 426575, 426576⟩)
                  (.leaf ⟨215, 334715, 334716⟩)
                )
                (.branch 1
                  (.leaf ⟨215, 334715, 334716⟩)
                  (.leaf ⟨215, 334715, 334716⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨215, 334715, 334716⟩)
                  (.leaf ⟨215, 334715, 334716⟩)
                )
                (.branch 1
                  (.leaf ⟨214, 426575, 426576⟩)
                  (.leaf ⟨214, 426575, 426576⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨214, 426575, 426576⟩)
                  (.leaf ⟨214, 426575, 426576⟩)
                )
                (.branch 1
                  (.leaf ⟨214, 426575, 426576⟩)
                  (.leaf ⟨216, 438719, 438720⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨216, 438719, 438720⟩)
                  (.leaf ⟨216, 438719, 438720⟩)
                )
                (.branch 1
                  (.leaf ⟨216, 438719, 438720⟩)
                  (.leaf ⟨216, 438719, 438720⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨217, 438751, 438752⟩)
                  (.leaf ⟨217, 438751, 438752⟩)
                )
                (.branch 1
                  (.leaf ⟨217, 438751, 438752⟩)
                  (.leaf ⟨217, 438751, 438752⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨217, 438751, 438752⟩)
                  (.leaf ⟨218, 335759, 335760⟩)
                )
                (.branch 1
                  (.leaf ⟨218, 335759, 335760⟩)
                  (.leaf ⟨218, 335759, 335760⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨218, 335759, 335760⟩)
                  (.leaf ⟨218, 335759, 335760⟩)
                )
                (.branch 1
                  (.leaf ⟨219, 426583, 426584⟩)
                  (.leaf ⟨219, 426583, 426584⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨219, 426583, 426584⟩)
                  (.leaf ⟨219, 426583, 426584⟩)
                )
                (.branch 1
                  (.leaf ⟨219, 426583, 426584⟩)
                  (.leaf ⟨220, 335971, 335972⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨220, 335971, 335972⟩)
                  (.leaf ⟨220, 335971, 335972⟩)
                )
                (.branch 1
                  (.leaf ⟨220, 335971, 335972⟩)
                  (.leaf ⟨220, 335971, 335972⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨219, 426583, 426584⟩)
                  (.leaf ⟨219, 426583, 426584⟩)
                )
                (.branch 1
                  (.leaf ⟨219, 426583, 426584⟩)
                  (.leaf ⟨219, 426583, 426584⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨219, 426583, 426584⟩)
                  (.leaf ⟨221, 438783, 438784⟩)
                )
                (.branch 1
                  (.leaf ⟨221, 438783, 438784⟩)
                  (.leaf ⟨221, 438783, 438784⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨221, 438783, 438784⟩)
                  (.leaf ⟨221, 438783, 438784⟩)
                )
                (.branch 1
                  (.leaf ⟨222, 336183, 336184⟩)
                  (.leaf ⟨222, 336183, 336184⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨222, 336183, 336184⟩)
                  (.leaf ⟨222, 336183, 336184⟩)
                )
                (.branch 1
                  (.leaf ⟨222, 336183, 336184⟩)
                  (.leaf ⟨223, 426587, 426588⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨223, 426587, 426588⟩)
                  (.leaf ⟨223, 426587, 426588⟩)
                )
                (.branch 1
                  (.leaf ⟨223, 426587, 426588⟩)
                  (.leaf ⟨223, 426587, 426588⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨224, 336395, 336396⟩)
                  (.leaf ⟨224, 336395, 336396⟩)
                )
                (.branch 1
                  (.leaf ⟨224, 336395, 336396⟩)
                  (.leaf ⟨224, 336395, 336396⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨224, 336395, 336396⟩)
                  (.leaf ⟨223, 426587, 426588⟩)
                )
                (.branch 1
                  (.leaf ⟨223, 426587, 426588⟩)
                  (.leaf ⟨223, 426587, 426588⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨223, 426587, 426588⟩)
                  (.leaf ⟨223, 426587, 426588⟩)
                )
                (.branch 1
                  (.leaf ⟨225, 438803, 438804⟩)
                  (.leaf ⟨225, 438803, 438804⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨225, 438803, 438804⟩)
                  (.leaf ⟨225, 438803, 438804⟩)
                )
                (.branch 1
                  (.leaf ⟨225, 438803, 438804⟩)
                  (.leaf ⟨226, 426591, 426592⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨226, 426591, 426592⟩)
                  (.leaf ⟨226, 426591, 426592⟩)
                )
                (.branch 1
                  (.leaf ⟨226, 426591, 426592⟩)
                  (.leaf ⟨226, 426591, 426592⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨30, 201575, 201576⟩)
                  (.leaf ⟨30, 201575, 201576⟩)
                )
                (.branch 1
                  (.leaf ⟨30, 201575, 201576⟩)
                  (.leaf ⟨30, 201575, 201576⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨30, 201575, 201576⟩)
                  (.leaf ⟨226, 426591, 426592⟩)
                )
                (.branch 1
                  (.leaf ⟨226, 426591, 426592⟩)
                  (.leaf ⟨226, 426591, 426592⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨226, 426591, 426592⟩)
                  (.leaf ⟨226, 426591, 426592⟩)
                )
                (.branch 1
                  (.leaf ⟨227, 438979, 438980⟩)
                  (.leaf ⟨227, 438979, 438980⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨227, 438979, 438980⟩)
                  (.leaf ⟨227, 438979, 438980⟩)
                )
                (.branch 1
                  (.leaf ⟨227, 438979, 438980⟩)
                  (.leaf ⟨228, 439143, 439144⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨228, 439143, 439144⟩)
                  (.leaf ⟨228, 439143, 439144⟩)
                )
                (.branch 1
                  (.leaf ⟨228, 439143, 439144⟩)
                  (.leaf ⟨228, 439143, 439144⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨229, 439175, 439176⟩)
                  (.leaf ⟨229, 439175, 439176⟩)
                )
                (.branch 1
                  (.leaf ⟨229, 439175, 439176⟩)
                  (.leaf ⟨229, 439175, 439176⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨229, 439175, 439176⟩)
                  (.leaf ⟨230, 426607, 426608⟩)
                )
                (.branch 1
                  (.leaf ⟨230, 426607, 426608⟩)
                  (.leaf ⟨230, 426607, 426608⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨230, 426607, 426608⟩)
                  (.leaf ⟨230, 426607, 426608⟩)
                )
                (.branch 1
                  (.leaf ⟨231, 426603, 426604⟩)
                  (.leaf ⟨231, 426603, 426604⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨231, 426603, 426604⟩)
                  (.leaf ⟨231, 426603, 426604⟩)
                )
                (.branch 1
                  (.leaf ⟨231, 426603, 426604⟩)
                  (.leaf ⟨232, 343271, 343272⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨232, 343271, 343272⟩)
                  (.leaf ⟨232, 343271, 343272⟩)
                )
                (.branch 1
                  (.leaf ⟨232, 343271, 343272⟩)
                  (.leaf ⟨232, 343271, 343272⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨231, 426603, 426604⟩)
                  (.leaf ⟨231, 426603, 426604⟩)
                )
                (.branch 1
                  (.leaf ⟨231, 426603, 426604⟩)
                  (.leaf ⟨231, 426603, 426604⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨231, 426603, 426604⟩)
                  (.leaf ⟨233, 439335, 439336⟩)
                )
                (.branch 1
                  (.leaf ⟨233, 439335, 439336⟩)
                  (.leaf ⟨233, 439335, 439336⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨233, 439335, 439336⟩)
                  (.leaf ⟨233, 439335, 439336⟩)
                )
                (.branch 1
                  (.leaf ⟨234, 439383, 439384⟩)
                  (.leaf ⟨234, 439383, 439384⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨234, 439383, 439384⟩)
                  (.leaf ⟨234, 439383, 439384⟩)
                )
                (.branch 1
                  (.leaf ⟨234, 439383, 439384⟩)
                  (.leaf ⟨235, 439567, 439568⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨235, 439567, 439568⟩)
                  (.leaf ⟨235, 439567, 439568⟩)
                )
                (.branch 1
                  (.leaf ⟨235, 439567, 439568⟩)
                  (.leaf ⟨235, 439567, 439568⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨236, 439615, 439616⟩)
                  (.leaf ⟨236, 439615, 439616⟩)
                )
                (.branch 1
                  (.leaf ⟨236, 439615, 439616⟩)
                  (.leaf ⟨236, 439615, 439616⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨236, 439615, 439616⟩)
                  (.leaf ⟨237, 439775, 439776⟩)
                )
                (.branch 1
                  (.leaf ⟨237, 439775, 439776⟩)
                  (.leaf ⟨237, 439775, 439776⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨237, 439775, 439776⟩)
                  (.leaf ⟨237, 439775, 439776⟩)
                )
                (.branch 1
                  (.leaf ⟨238, 439939, 439940⟩)
                  (.leaf ⟨238, 439939, 439940⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨238, 439939, 439940⟩)
                  (.leaf ⟨238, 439939, 439940⟩)
                )
                (.branch 1
                  (.leaf ⟨238, 439939, 439940⟩)
                  (.leaf ⟨239, 439971, 439972⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨239, 439971, 439972⟩)
                  (.leaf ⟨239, 439971, 439972⟩)
                )
                (.branch 1
                  (.leaf ⟨239, 439971, 439972⟩)
                  (.leaf ⟨239, 439971, 439972⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨240, 426635, 426636⟩)
                  (.leaf ⟨240, 426635, 426636⟩)
                )
                (.branch 1
                  (.leaf ⟨240, 426635, 426636⟩)
                  (.leaf ⟨240, 426635, 426636⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨240, 426635, 426636⟩)
                  (.leaf ⟨241, 426631, 426632⟩)
                )
                (.branch 1
                  (.leaf ⟨241, 426631, 426632⟩)
                  (.leaf ⟨241, 426631, 426632⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨241, 426631, 426632⟩)
                  (.leaf ⟨241, 426631, 426632⟩)
                )
                (.branch 1
                  (.leaf ⟨242, 351975, 351976⟩)
                  (.leaf ⟨242, 351975, 351976⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨242, 351975, 351976⟩)
                  (.leaf ⟨242, 351975, 351976⟩)
                )
                (.branch 1
                  (.leaf ⟨242, 351975, 351976⟩)
                  (.leaf ⟨241, 426631, 426632⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨241, 426631, 426632⟩)
                  (.leaf ⟨241, 426631, 426632⟩)
                )
                (.branch 1
                  (.leaf ⟨241, 426631, 426632⟩)
                  (.leaf ⟨241, 426631, 426632⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨243, 440131, 440132⟩)
                  (.leaf ⟨243, 440131, 440132⟩)
                )
                (.branch 1
                  (.leaf ⟨243, 440131, 440132⟩)
                  (.leaf ⟨243, 440131, 440132⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_1280_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨243, 440131, 440132⟩)
                  (.leaf ⟨244, 440179, 440180⟩)
                )
                (.branch 1
                  (.leaf ⟨244, 440179, 440180⟩)
                  (.leaf ⟨244, 440179, 440180⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨244, 440179, 440180⟩)
                  (.leaf ⟨244, 440179, 440180⟩)
                )
                (.branch 1
                  (.leaf ⟨245, 440343, 440344⟩)
                  (.leaf ⟨245, 440343, 440344⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨245, 440343, 440344⟩)
                  (.leaf ⟨245, 440343, 440344⟩)
                )
                (.branch 1
                  (.leaf ⟨245, 440343, 440344⟩)
                  (.leaf ⟨246, 440375, 440376⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨246, 440375, 440376⟩)
                  (.leaf ⟨246, 440375, 440376⟩)
                )
                (.branch 1
                  (.leaf ⟨246, 440375, 440376⟩)
                  (.leaf ⟨246, 440375, 440376⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨247, 355403, 355404⟩)
                  (.leaf ⟨247, 355403, 355404⟩)
                )
                (.branch 1
                  (.leaf ⟨247, 355403, 355404⟩)
                  (.leaf ⟨247, 355403, 355404⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨247, 355403, 355404⟩)
                  (.leaf ⟨248, 426647, 426648⟩)
                )
                (.branch 1
                  (.leaf ⟨248, 426647, 426648⟩)
                  (.leaf ⟨248, 426647, 426648⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨248, 426647, 426648⟩)
                  (.leaf ⟨248, 426647, 426648⟩)
                )
                (.branch 1
                  (.leaf ⟨249, 355615, 355616⟩)
                  (.leaf ⟨249, 355615, 355616⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨249, 355615, 355616⟩)
                  (.leaf ⟨249, 355615, 355616⟩)
                )
                (.branch 1
                  (.leaf ⟨249, 355615, 355616⟩)
                  (.leaf ⟨248, 426647, 426648⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨248, 426647, 426648⟩)
                  (.leaf ⟨248, 426647, 426648⟩)
                )
                (.branch 1
                  (.leaf ⟨248, 426647, 426648⟩)
                  (.leaf ⟨248, 426647, 426648⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨250, 440407, 440408⟩)
                  (.leaf ⟨250, 440407, 440408⟩)
                )
                (.branch 1
                  (.leaf ⟨250, 440407, 440408⟩)
                  (.leaf ⟨250, 440407, 440408⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨250, 440407, 440408⟩)
                  (.leaf ⟨251, 426655, 426656⟩)
                )
                (.branch 1
                  (.leaf ⟨251, 426655, 426656⟩)
                  (.leaf ⟨251, 426655, 426656⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨251, 426655, 426656⟩)
                  (.leaf ⟨251, 426655, 426656⟩)
                )
                (.branch 1
                  (.leaf ⟨252, 426651, 426652⟩)
                  (.leaf ⟨252, 426651, 426652⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨252, 426651, 426652⟩)
                  (.leaf ⟨252, 426651, 426652⟩)
                )
                (.branch 1
                  (.leaf ⟨252, 426651, 426652⟩)
                  (.leaf ⟨253, 358447, 358448⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨253, 358447, 358448⟩)
                  (.leaf ⟨253, 358447, 358448⟩)
                )
                (.branch 1
                  (.leaf ⟨253, 358447, 358448⟩)
                  (.leaf ⟨253, 358447, 358448⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨252, 426651, 426652⟩)
                  (.leaf ⟨252, 426651, 426652⟩)
                )
                (.branch 1
                  (.leaf ⟨252, 426651, 426652⟩)
                  (.leaf ⟨252, 426651, 426652⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨252, 426651, 426652⟩)
                  (.leaf ⟨254, 440759, 440760⟩)
                )
                (.branch 1
                  (.leaf ⟨254, 440759, 440760⟩)
                  (.leaf ⟨254, 440759, 440760⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨254, 440759, 440760⟩)
                  (.leaf ⟨254, 440759, 440760⟩)
                )
                (.branch 1
                  (.leaf ⟨255, 440791, 440792⟩)
                  (.leaf ⟨255, 440791, 440792⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨255, 440791, 440792⟩)
                  (.leaf ⟨255, 440791, 440792⟩)
                )
                (.branch 1
                  (.leaf ⟨255, 440791, 440792⟩)
                  (.leaf ⟨256, 359491, 359492⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨256, 359491, 359492⟩)
                  (.leaf ⟨256, 359491, 359492⟩)
                )
                (.branch 1
                  (.leaf ⟨256, 359491, 359492⟩)
                  (.leaf ⟨256, 359491, 359492⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨257, 426659, 426660⟩)
                  (.leaf ⟨257, 426659, 426660⟩)
                )
                (.branch 1
                  (.leaf ⟨257, 426659, 426660⟩)
                  (.leaf ⟨257, 426659, 426660⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨257, 426659, 426660⟩)
                  (.leaf ⟨258, 359703, 359704⟩)
                )
                (.branch 1
                  (.leaf ⟨258, 359703, 359704⟩)
                  (.leaf ⟨258, 359703, 359704⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨258, 359703, 359704⟩)
                  (.leaf ⟨258, 359703, 359704⟩)
                )
                (.branch 1
                  (.leaf ⟨257, 426659, 426660⟩)
                  (.leaf ⟨257, 426659, 426660⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨257, 426659, 426660⟩)
                  (.leaf ⟨257, 426659, 426660⟩)
                )
                (.branch 1
                  (.leaf ⟨257, 426659, 426660⟩)
                  (.leaf ⟨259, 440823, 440824⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨259, 440823, 440824⟩)
                  (.leaf ⟨259, 440823, 440824⟩)
                )
                (.branch 1
                  (.leaf ⟨259, 440823, 440824⟩)
                  (.leaf ⟨259, 440823, 440824⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨260, 360119, 360120⟩)
                  (.leaf ⟨260, 360119, 360120⟩)
                )
                (.branch 1
                  (.leaf ⟨260, 360119, 360120⟩)
                  (.leaf ⟨260, 360119, 360120⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨260, 360119, 360120⟩)
                  (.leaf ⟨261, 426663, 426664⟩)
                )
                (.branch 1
                  (.leaf ⟨261, 426663, 426664⟩)
                  (.leaf ⟨261, 426663, 426664⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨261, 426663, 426664⟩)
                  (.leaf ⟨261, 426663, 426664⟩)
                )
                (.branch 1
                  (.leaf ⟨262, 360331, 360332⟩)
                  (.leaf ⟨262, 360331, 360332⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨262, 360331, 360332⟩)
                  (.leaf ⟨262, 360331, 360332⟩)
                )
                (.branch 1
                  (.leaf ⟨262, 360331, 360332⟩)
                  (.leaf ⟨261, 426663, 426664⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨261, 426663, 426664⟩)
                  (.leaf ⟨261, 426663, 426664⟩)
                )
                (.branch 1
                  (.leaf ⟨261, 426663, 426664⟩)
                  (.leaf ⟨261, 426663, 426664⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨263, 440855, 440856⟩)
                  (.leaf ⟨263, 440855, 440856⟩)
                )
                (.branch 1
                  (.leaf ⟨263, 440855, 440856⟩)
                  (.leaf ⟨263, 440855, 440856⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨263, 440855, 440856⟩)
                  (.leaf ⟨264, 360543, 360544⟩)
                )
                (.branch 1
                  (.leaf ⟨264, 360543, 360544⟩)
                  (.leaf ⟨264, 360543, 360544⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨264, 360543, 360544⟩)
                  (.leaf ⟨264, 360543, 360544⟩)
                )
                (.branch 1
                  (.leaf ⟨265, 426667, 426668⟩)
                  (.leaf ⟨265, 426667, 426668⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨265, 426667, 426668⟩)
                  (.leaf ⟨265, 426667, 426668⟩)
                )
                (.branch 1
                  (.leaf ⟨265, 426667, 426668⟩)
                  (.leaf ⟨266, 360755, 360756⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨266, 360755, 360756⟩)
                  (.leaf ⟨266, 360755, 360756⟩)
                )
                (.branch 1
                  (.leaf ⟨266, 360755, 360756⟩)
                  (.leaf ⟨266, 360755, 360756⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨265, 426667, 426668⟩)
                  (.leaf ⟨265, 426667, 426668⟩)
                )
                (.branch 1
                  (.leaf ⟨265, 426667, 426668⟩)
                  (.leaf ⟨265, 426667, 426668⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨265, 426667, 426668⟩)
                  (.leaf ⟨267, 440867, 440868⟩)
                )
                (.branch 1
                  (.leaf ⟨267, 440867, 440868⟩)
                  (.leaf ⟨267, 440867, 440868⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨267, 440867, 440868⟩)
                  (.leaf ⟨267, 440867, 440868⟩)
                )
                (.branch 1
                  (.leaf ⟨268, 426671, 426672⟩)
                  (.leaf ⟨268, 426671, 426672⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨268, 426671, 426672⟩)
                  (.leaf ⟨268, 426671, 426672⟩)
                )
                (.branch 1
                  (.leaf ⟨268, 426671, 426672⟩)
                  (.leaf ⟨30, 201575, 201576⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨30, 201575, 201576⟩)
                  (.leaf ⟨30, 201575, 201576⟩)
                )
                (.branch 1
                  (.leaf ⟨30, 201575, 201576⟩)
                  (.leaf ⟨30, 201575, 201576⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨268, 426671, 426672⟩)
                  (.leaf ⟨268, 426671, 426672⟩)
                )
                (.branch 1
                  (.leaf ⟨268, 426671, 426672⟩)
                  (.leaf ⟨268, 426671, 426672⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨268, 426671, 426672⟩)
                  (.leaf ⟨269, 441031, 441032⟩)
                )
                (.branch 1
                  (.leaf ⟨269, 441031, 441032⟩)
                  (.leaf ⟨269, 441031, 441032⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨269, 441031, 441032⟩)
                  (.leaf ⟨269, 441031, 441032⟩)
                )
                (.branch 1
                  (.leaf ⟨270, 441063, 441064⟩)
                  (.leaf ⟨270, 441063, 441064⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨270, 441063, 441064⟩)
                  (.leaf ⟨270, 441063, 441064⟩)
                )
                (.branch 1
                  (.leaf ⟨270, 441063, 441064⟩)
                  (.leaf ⟨271, 426683, 426684⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨271, 426683, 426684⟩)
                  (.leaf ⟨271, 426683, 426684⟩)
                )
                (.branch 1
                  (.leaf ⟨271, 426683, 426684⟩)
                  (.leaf ⟨271, 426683, 426684⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨272, 426679, 426680⟩)
                  (.leaf ⟨272, 426679, 426680⟩)
                )
                (.branch 1
                  (.leaf ⟨272, 426679, 426680⟩)
                  (.leaf ⟨272, 426679, 426680⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨272, 426679, 426680⟩)
                  (.leaf ⟨273, 364935, 364936⟩)
                )
                (.branch 1
                  (.leaf ⟨273, 364935, 364936⟩)
                  (.leaf ⟨273, 364935, 364936⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨273, 364935, 364936⟩)
                  (.leaf ⟨273, 364935, 364936⟩)
                )
                (.branch 1
                  (.leaf ⟨272, 426679, 426680⟩)
                  (.leaf ⟨272, 426679, 426680⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨272, 426679, 426680⟩)
                  (.leaf ⟨272, 426679, 426680⟩)
                )
                (.branch 1
                  (.leaf ⟨272, 426679, 426680⟩)
                  (.leaf ⟨274, 441223, 441224⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨274, 441223, 441224⟩)
                  (.leaf ⟨274, 441223, 441224⟩)
                )
                (.branch 1
                  (.leaf ⟨274, 441223, 441224⟩)
                  (.leaf ⟨274, 441223, 441224⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨275, 441399, 441400⟩)
                  (.leaf ⟨275, 441399, 441400⟩)
                )
                (.branch 1
                  (.leaf ⟨275, 441399, 441400⟩)
                  (.leaf ⟨275, 441399, 441400⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨275, 441399, 441400⟩)
                  (.leaf ⟨276, 426175, 426176⟩)
                )
                (.branch 1
                  (.leaf ⟨276, 426175, 426176⟩)
                  (.leaf ⟨276, 426175, 426176⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨276, 426175, 426176⟩)
                  (.leaf ⟨276, 426175, 426176⟩)
                )
                (.branch 1
                  (.leaf ⟨277, 426691, 426692⟩)
                  (.leaf ⟨277, 426691, 426692⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨277, 426691, 426692⟩)
                  (.leaf ⟨277, 426691, 426692⟩)
                )
                (.branch 1
                  (.leaf ⟨277, 426691, 426692⟩)
                  (.leaf ⟨277, 426691, 426692⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨277, 426691, 426692⟩)
                  (.leaf ⟨277, 426691, 426692⟩)
                )
                (.branch 1
                  (.leaf ⟨277, 426691, 426692⟩)
                  (.leaf ⟨277, 426691, 426692⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨278, 441583, 441584⟩)
                  (.leaf ⟨278, 441583, 441584⟩)
                )
                (.branch 1
                  (.leaf ⟨278, 441583, 441584⟩)
                  (.leaf ⟨278, 441583, 441584⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨278, 441583, 441584⟩)
                  (.leaf ⟨279, 441759, 441760⟩)
                )
                (.branch 1
                  (.leaf ⟨279, 441759, 441760⟩)
                  (.leaf ⟨279, 441759, 441760⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨279, 441759, 441760⟩)
                  (.leaf ⟨279, 441759, 441760⟩)
                )
                (.branch 1
                  (.leaf ⟨280, 426727, 426728⟩)
                  (.leaf ⟨280, 426727, 426728⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨280, 426727, 426728⟩)
                  (.leaf ⟨280, 426727, 426728⟩)
                )
                (.branch 1
                  (.leaf ⟨280, 426727, 426728⟩)
                  (.leaf ⟨281, 441943, 441944⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨281, 441943, 441944⟩)
                  (.leaf ⟨281, 441943, 441944⟩)
                )
                (.branch 1
                  (.leaf ⟨281, 441943, 441944⟩)
                  (.leaf ⟨281, 441943, 441944⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨282, 442119, 442120⟩)
                  (.leaf ⟨282, 442119, 442120⟩)
                )
                (.branch 1
                  (.leaf ⟨282, 442119, 442120⟩)
                  (.leaf ⟨282, 442119, 442120⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨282, 442119, 442120⟩)
                  (.leaf ⟨283, 426819, 426820⟩)
                )
                (.branch 1
                  (.leaf ⟨283, 426819, 426820⟩)
                  (.leaf ⟨283, 426819, 426820⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨283, 426819, 426820⟩)
                  (.leaf ⟨283, 426819, 426820⟩)
                )
                (.branch 1
                  (.leaf ⟨284, 442303, 442304⟩)
                  (.leaf ⟨284, 442303, 442304⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨284, 442303, 442304⟩)
                  (.leaf ⟨284, 442303, 442304⟩)
                )
                (.branch 1
                  (.leaf ⟨284, 442303, 442304⟩)
                  (.leaf ⟨285, 442479, 442480⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨285, 442479, 442480⟩)
                  (.leaf ⟨285, 442479, 442480⟩)
                )
                (.branch 1
                  (.leaf ⟨285, 442479, 442480⟩)
                  (.leaf ⟨285, 442479, 442480⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_1024_512 : Balanced.RowTree Cell :=
  .branch 256 cache_1024_256 cache_1280_256
noncomputable def cache_1536_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨286, 426623, 426624⟩)
                  (.leaf ⟨286, 426623, 426624⟩)
                )
                (.branch 1
                  (.leaf ⟨286, 426623, 426624⟩)
                  (.leaf ⟨286, 426623, 426624⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨286, 426623, 426624⟩)
                  (.leaf ⟨287, 442663, 442664⟩)
                )
                (.branch 1
                  (.leaf ⟨287, 442663, 442664⟩)
                  (.leaf ⟨287, 442663, 442664⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨287, 442663, 442664⟩)
                  (.leaf ⟨287, 442663, 442664⟩)
                )
                (.branch 1
                  (.leaf ⟨288, 442751, 442752⟩)
                  (.leaf ⟨288, 442751, 442752⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨288, 442751, 442752⟩)
                  (.leaf ⟨288, 442751, 442752⟩)
                )
                (.branch 1
                  (.leaf ⟨288, 442751, 442752⟩)
                  (.leaf ⟨289, 426827, 426828⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨289, 426827, 426828⟩)
                  (.leaf ⟨289, 426827, 426828⟩)
                )
                (.branch 1
                  (.leaf ⟨289, 426827, 426828⟩)
                  (.leaf ⟨289, 426827, 426828⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨290, 442931, 442932⟩)
                  (.leaf ⟨290, 442931, 442932⟩)
                )
                (.branch 1
                  (.leaf ⟨290, 442931, 442932⟩)
                  (.leaf ⟨290, 442931, 442932⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨290, 442931, 442932⟩)
                  (.leaf ⟨291, 442991, 442992⟩)
                )
                (.branch 1
                  (.leaf ⟨292, 442995, 442996⟩)
                  (.leaf ⟨291, 442991, 442992⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨291, 442991, 442992⟩)
                  (.leaf ⟨291, 442991, 442992⟩)
                )
                (.branch 1
                  (.leaf ⟨293, 390907, 390908⟩)
                  (.leaf ⟨294, 393115, 393116⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨293, 390907, 390908⟩)
                  (.leaf ⟨293, 390907, 390908⟩)
                )
                (.branch 1
                  (.leaf ⟨293, 390907, 390908⟩)
                  (.leaf ⟨295, 426731, 426732⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨296, 426735, 426736⟩)
                  (.leaf ⟨295, 426731, 426732⟩)
                )
                (.branch 1
                  (.leaf ⟨295, 426731, 426732⟩)
                  (.leaf ⟨295, 426731, 426732⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨297, 390543, 390544⟩)
                  (.leaf ⟨298, 390547, 390548⟩)
                )
                (.branch 1
                  (.leaf ⟨297, 390543, 390544⟩)
                  (.leaf ⟨297, 390543, 390544⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨297, 390543, 390544⟩)
                  (.leaf ⟨295, 426731, 426732⟩)
                )
                (.branch 1
                  (.leaf ⟨296, 426735, 426736⟩)
                  (.leaf ⟨295, 426731, 426732⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨295, 426731, 426732⟩)
                  (.leaf ⟨295, 426731, 426732⟩)
                )
                (.branch 1
                  (.leaf ⟨299, 426739, 426740⟩)
                  (.leaf ⟨300, 426743, 426744⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨299, 426739, 426740⟩)
                  (.leaf ⟨299, 426739, 426740⟩)
                )
                (.branch 1
                  (.leaf ⟨299, 426739, 426740⟩)
                  (.leaf ⟨301, 443039, 443040⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨301, 443039, 443040⟩)
                  (.leaf ⟨301, 443039, 443040⟩)
                )
                (.branch 1
                  (.leaf ⟨301, 443039, 443040⟩)
                  (.leaf ⟨301, 443039, 443040⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨302, 443235, 443236⟩)
                  (.leaf ⟨302, 443235, 443236⟩)
                )
                (.branch 1
                  (.leaf ⟨302, 443235, 443236⟩)
                  (.leaf ⟨302, 443235, 443236⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨302, 443235, 443236⟩)
                  (.leaf ⟨303, 443399, 443400⟩)
                )
                (.branch 1
                  (.leaf ⟨303, 443399, 443400⟩)
                  (.leaf ⟨303, 443399, 443400⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨303, 443399, 443400⟩)
                  (.leaf ⟨303, 443399, 443400⟩)
                )
                (.branch 1
                  (.leaf ⟨304, 443431, 443432⟩)
                  (.leaf ⟨304, 443431, 443432⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨304, 443431, 443432⟩)
                  (.leaf ⟨304, 443431, 443432⟩)
                )
                (.branch 1
                  (.leaf ⟨304, 443431, 443432⟩)
                  (.leaf ⟨305, 426755, 426756⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨305, 426755, 426756⟩)
                  (.leaf ⟨305, 426755, 426756⟩)
                )
                (.branch 1
                  (.leaf ⟨305, 426755, 426756⟩)
                  (.leaf ⟨305, 426755, 426756⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨306, 426751, 426752⟩)
                  (.leaf ⟨306, 426751, 426752⟩)
                )
                (.branch 1
                  (.leaf ⟨306, 426751, 426752⟩)
                  (.leaf ⟨306, 426751, 426752⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨306, 426751, 426752⟩)
                  (.leaf ⟨307, 397403, 397404⟩)
                )
                (.branch 1
                  (.leaf ⟨307, 397403, 397404⟩)
                  (.leaf ⟨307, 397403, 397404⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨307, 397403, 397404⟩)
                  (.leaf ⟨307, 397403, 397404⟩)
                )
                (.branch 1
                  (.leaf ⟨306, 426751, 426752⟩)
                  (.leaf ⟨306, 426751, 426752⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨306, 426751, 426752⟩)
                  (.leaf ⟨306, 426751, 426752⟩)
                )
                (.branch 1
                  (.leaf ⟨306, 426751, 426752⟩)
                  (.leaf ⟨308, 443591, 443592⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨308, 443591, 443592⟩)
                  (.leaf ⟨308, 443591, 443592⟩)
                )
                (.branch 1
                  (.leaf ⟨308, 443591, 443592⟩)
                  (.leaf ⟨308, 443591, 443592⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨309, 443787, 443788⟩)
                  (.leaf ⟨309, 443787, 443788⟩)
                )
                (.branch 1
                  (.leaf ⟨309, 443787, 443788⟩)
                  (.leaf ⟨309, 443787, 443788⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨309, 443787, 443788⟩)
                  (.leaf ⟨310, 443855, 443856⟩)
                )
                (.branch 1
                  (.leaf ⟨310, 443855, 443856⟩)
                  (.leaf ⟨311, 443859, 443860⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨312, 443863, 443864⟩)
                  (.leaf ⟨313, 443867, 443868⟩)
                )
                (.branch 1
                  (.leaf ⟨314, 426779, 426780⟩)
                  (.leaf ⟨314, 426779, 426780⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨314, 426779, 426780⟩)
                  (.leaf ⟨314, 426779, 426780⟩)
                )
                (.branch 1
                  (.leaf ⟨314, 426779, 426780⟩)
                  (.leaf ⟨315, 426763, 426764⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨315, 426763, 426764⟩)
                  (.leaf ⟨316, 426767, 426768⟩)
                )
                (.branch 1
                  (.leaf ⟨317, 426771, 426772⟩)
                  (.leaf ⟨318, 426775, 426776⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨319, 404711, 404712⟩)
                  (.leaf ⟨319, 404711, 404712⟩)
                )
                (.branch 1
                  (.leaf ⟨319, 404711, 404712⟩)
                  (.leaf ⟨319, 404711, 404712⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨319, 404711, 404712⟩)
                  (.leaf ⟨319, 404711, 404712⟩)
                )
                (.branch 1
                  (.leaf ⟨315, 426763, 426764⟩)
                  (.leaf ⟨316, 426767, 426768⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨317, 426771, 426772⟩)
                  (.leaf ⟨318, 426775, 426776⟩)
                )
                (.branch 1
                  (.leaf ⟨320, 444051, 444052⟩)
                  (.leaf ⟨320, 444051, 444052⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨320, 444051, 444052⟩)
                  (.leaf ⟨320, 444051, 444052⟩)
                )
                (.branch 1
                  (.leaf ⟨320, 444051, 444052⟩)
                  (.leaf ⟨321, 444087, 444088⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨321, 444087, 444088⟩)
                  (.leaf ⟨321, 444087, 444088⟩)
                )
                (.branch 1
                  (.leaf ⟨321, 444087, 444088⟩)
                  (.leaf ⟨321, 444087, 444088⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨322, 444251, 444252⟩)
                  (.leaf ⟨322, 444251, 444252⟩)
                )
                (.branch 1
                  (.leaf ⟨322, 444251, 444252⟩)
                  (.leaf ⟨322, 444251, 444252⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨322, 444251, 444252⟩)
                  (.leaf ⟨323, 444283, 444284⟩)
                )
                (.branch 1
                  (.leaf ⟨323, 444283, 444284⟩)
                  (.leaf ⟨323, 444283, 444284⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨323, 444283, 444284⟩)
                  (.leaf ⟨323, 444283, 444284⟩)
                )
                (.branch 1
                  (.leaf ⟨324, 426795, 426796⟩)
                  (.leaf ⟨324, 426795, 426796⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨324, 426795, 426796⟩)
                  (.leaf ⟨324, 426795, 426796⟩)
                )
                (.branch 1
                  (.leaf ⟨324, 426795, 426796⟩)
                  (.leaf ⟨325, 426791, 426792⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨325, 426791, 426792⟩)
                  (.leaf ⟨325, 426791, 426792⟩)
                )
                (.branch 1
                  (.leaf ⟨325, 426791, 426792⟩)
                  (.leaf ⟨325, 426791, 426792⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨326, 409475, 409476⟩)
                  (.leaf ⟨326, 409475, 409476⟩)
                )
                (.branch 1
                  (.leaf ⟨326, 409475, 409476⟩)
                  (.leaf ⟨326, 409475, 409476⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨326, 409475, 409476⟩)
                  (.leaf ⟨325, 426791, 426792⟩)
                )
                (.branch 1
                  (.leaf ⟨325, 426791, 426792⟩)
                  (.leaf ⟨325, 426791, 426792⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨325, 426791, 426792⟩)
                  (.leaf ⟨325, 426791, 426792⟩)
                )
                (.branch 1
                  (.leaf ⟨327, 444443, 444444⟩)
                  (.leaf ⟨327, 444443, 444444⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨327, 444443, 444444⟩)
                  (.leaf ⟨327, 444443, 444444⟩)
                )
                (.branch 1
                  (.leaf ⟨327, 444443, 444444⟩)
                  (.leaf ⟨328, 444607, 444608⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨328, 444607, 444608⟩)
                  (.leaf ⟨328, 444607, 444608⟩)
                )
                (.branch 1
                  (.leaf ⟨328, 444607, 444608⟩)
                  (.leaf ⟨328, 444607, 444608⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨329, 444639, 444640⟩)
                  (.leaf ⟨329, 444639, 444640⟩)
                )
                (.branch 1
                  (.leaf ⟨329, 444639, 444640⟩)
                  (.leaf ⟨329, 444639, 444640⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨329, 444639, 444640⟩)
                  (.leaf ⟨330, 426807, 426808⟩)
                )
                (.branch 1
                  (.leaf ⟨330, 426807, 426808⟩)
                  (.leaf ⟨330, 426807, 426808⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨330, 426807, 426808⟩)
                  (.leaf ⟨330, 426807, 426808⟩)
                )
                (.branch 1
                  (.leaf ⟨331, 426803, 426804⟩)
                  (.leaf ⟨331, 426803, 426804⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨331, 426803, 426804⟩)
                  (.leaf ⟨331, 426803, 426804⟩)
                )
                (.branch 1
                  (.leaf ⟨331, 426803, 426804⟩)
                  (.leaf ⟨332, 413703, 413704⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨332, 413703, 413704⟩)
                  (.leaf ⟨332, 413703, 413704⟩)
                )
                (.branch 1
                  (.leaf ⟨332, 413703, 413704⟩)
                  (.leaf ⟨332, 413703, 413704⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨331, 426803, 426804⟩)
                  (.leaf ⟨331, 426803, 426804⟩)
                )
                (.branch 1
                  (.leaf ⟨331, 426803, 426804⟩)
                  (.leaf ⟨331, 426803, 426804⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨331, 426803, 426804⟩)
                  (.leaf ⟨333, 444799, 444800⟩)
                )
                (.branch 1
                  (.leaf ⟨333, 444799, 444800⟩)
                  (.leaf ⟨333, 444799, 444800⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨333, 444799, 444800⟩)
                  (.leaf ⟨333, 444799, 444800⟩)
                )
                (.branch 1
                  (.leaf ⟨334, 444831, 444832⟩)
                  (.leaf ⟨334, 444831, 444832⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨334, 444831, 444832⟩)
                  (.leaf ⟨334, 444831, 444832⟩)
                )
                (.branch 1
                  (.leaf ⟨334, 444831, 444832⟩)
                  (.leaf ⟨335, 414543, 414544⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨335, 414543, 414544⟩)
                  (.leaf ⟨335, 414543, 414544⟩)
                )
                (.branch 1
                  (.leaf ⟨335, 414543, 414544⟩)
                  (.leaf ⟨335, 414543, 414544⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨336, 426811, 426812⟩)
                  (.leaf ⟨336, 426811, 426812⟩)
                )
                (.branch 1
                  (.leaf ⟨336, 426811, 426812⟩)
                  (.leaf ⟨336, 426811, 426812⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨336, 426811, 426812⟩)
                  (.leaf ⟨337, 414755, 414756⟩)
                )
                (.branch 1
                  (.leaf ⟨337, 414755, 414756⟩)
                  (.leaf ⟨337, 414755, 414756⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨337, 414755, 414756⟩)
                  (.leaf ⟨337, 414755, 414756⟩)
                )
                (.branch 1
                  (.leaf ⟨336, 426811, 426812⟩)
                  (.leaf ⟨336, 426811, 426812⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨336, 426811, 426812⟩)
                  (.leaf ⟨336, 426811, 426812⟩)
                )
                (.branch 1
                  (.leaf ⟨336, 426811, 426812⟩)
                  (.leaf ⟨338, 444851, 444852⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨338, 444851, 444852⟩)
                  (.leaf ⟨338, 444851, 444852⟩)
                )
                (.branch 1
                  (.leaf ⟨338, 444851, 444852⟩)
                  (.leaf ⟨338, 444851, 444852⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨339, 426815, 426816⟩)
                  (.leaf ⟨339, 426815, 426816⟩)
                )
                (.branch 1
                  (.leaf ⟨339, 426815, 426816⟩)
                  (.leaf ⟨339, 426815, 426816⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨339, 426815, 426816⟩)
                  (.leaf ⟨266, 360755, 360756⟩)
                )
                (.branch 1
                  (.leaf ⟨266, 360755, 360756⟩)
                  (.leaf ⟨266, 360755, 360756⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨266, 360755, 360756⟩)
                  (.leaf ⟨266, 360755, 360756⟩)
                )
                (.branch 1
                  (.leaf ⟨339, 426815, 426816⟩)
                  (.leaf ⟨339, 426815, 426816⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨339, 426815, 426816⟩)
                  (.leaf ⟨339, 426815, 426816⟩)
                )
                (.branch 1
                  (.leaf ⟨339, 426815, 426816⟩)
                  (.leaf ⟨340, 445015, 445016⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_1792_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨340, 445015, 445016⟩)
                  (.leaf ⟨340, 445015, 445016⟩)
                )
                (.branch 1
                  (.leaf ⟨340, 445015, 445016⟩)
                  (.leaf ⟨340, 445015, 445016⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨341, 436047, 436048⟩)
                  (.leaf ⟨341, 436047, 436048⟩)
                )
                (.branch 1
                  (.leaf ⟨341, 436047, 436048⟩)
                  (.leaf ⟨341, 436047, 436048⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨341, 436047, 436048⟩)
                  (.leaf ⟨342, 426487, 426488⟩)
                )
                (.branch 1
                  (.leaf ⟨342, 426487, 426488⟩)
                  (.leaf ⟨342, 426487, 426488⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨342, 426487, 426488⟩)
                  (.leaf ⟨342, 426487, 426488⟩)
                )
                (.branch 1
                  (.leaf ⟨343, 426823, 426824⟩)
                  (.leaf ⟨343, 426823, 426824⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨343, 426823, 426824⟩)
                  (.leaf ⟨343, 426823, 426824⟩)
                )
                (.branch 1
                  (.leaf ⟨343, 426823, 426824⟩)
                  (.leaf ⟨344, 305355, 305356⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨344, 305355, 305356⟩)
                  (.leaf ⟨344, 305355, 305356⟩)
                )
                (.branch 1
                  (.leaf ⟨344, 305355, 305356⟩)
                  (.leaf ⟨344, 305355, 305356⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨343, 426823, 426824⟩)
                  (.leaf ⟨343, 426823, 426824⟩)
                )
                (.branch 1
                  (.leaf ⟨343, 426823, 426824⟩)
                  (.leaf ⟨343, 426823, 426824⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨343, 426823, 426824⟩)
                  (.leaf ⟨345, 445191, 445192⟩)
                )
                (.branch 1
                  (.leaf ⟨345, 445191, 445192⟩)
                  (.leaf ⟨345, 445191, 445192⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨345, 445191, 445192⟩)
                  (.leaf ⟨345, 445191, 445192⟩)
                )
                (.branch 1
                  (.leaf ⟨346, 445239, 445240⟩)
                  (.leaf ⟨346, 445239, 445240⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨346, 445239, 445240⟩)
                  (.leaf ⟨346, 445239, 445240⟩)
                )
                (.branch 1
                  (.leaf ⟨346, 445239, 445240⟩)
                  (.leaf ⟨347, 445423, 445424⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨347, 445423, 445424⟩)
                  (.leaf ⟨347, 445423, 445424⟩)
                )
                (.branch 1
                  (.leaf ⟨347, 445423, 445424⟩)
                  (.leaf ⟨347, 445423, 445424⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨348, 445471, 445472⟩)
                  (.leaf ⟨348, 445471, 445472⟩)
                )
                (.branch 1
                  (.leaf ⟨348, 445471, 445472⟩)
                  (.leaf ⟨348, 445471, 445472⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨348, 445471, 445472⟩)
                  (.leaf ⟨349, 445635, 445636⟩)
                )
                (.branch 1
                  (.leaf ⟨349, 445635, 445636⟩)
                  (.leaf ⟨349, 445635, 445636⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨349, 445635, 445636⟩)
                  (.leaf ⟨349, 445635, 445636⟩)
                )
                (.branch 1
                  (.leaf ⟨350, 445667, 445668⟩)
                  (.leaf ⟨350, 445667, 445668⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨350, 445667, 445668⟩)
                  (.leaf ⟨350, 445667, 445668⟩)
                )
                (.branch 1
                  (.leaf ⟨350, 445667, 445668⟩)
                  (.leaf ⟨351, 426851, 426852⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨351, 426851, 426852⟩)
                  (.leaf ⟨351, 426851, 426852⟩)
                )
                (.branch 1
                  (.leaf ⟨351, 426851, 426852⟩)
                  (.leaf ⟨351, 426851, 426852⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨352, 426847, 426848⟩)
                  (.leaf ⟨352, 426847, 426848⟩)
                )
                (.branch 1
                  (.leaf ⟨352, 426847, 426848⟩)
                  (.leaf ⟨352, 426847, 426848⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨352, 426847, 426848⟩)
                  (.leaf ⟨353, 426023, 426024⟩)
                )
                (.branch 1
                  (.leaf ⟨353, 426023, 426024⟩)
                  (.leaf ⟨353, 426023, 426024⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨353, 426023, 426024⟩)
                  (.leaf ⟨353, 426023, 426024⟩)
                )
                (.branch 1
                  (.leaf ⟨352, 426847, 426848⟩)
                  (.leaf ⟨352, 426847, 426848⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨352, 426847, 426848⟩)
                  (.leaf ⟨352, 426847, 426848⟩)
                )
                (.branch 1
                  (.leaf ⟨352, 426847, 426848⟩)
                  (.leaf ⟨354, 445823, 445824⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨354, 445823, 445824⟩)
                  (.leaf ⟨354, 445823, 445824⟩)
                )
                (.branch 1
                  (.leaf ⟨354, 445823, 445824⟩)
                  (.leaf ⟨354, 445823, 445824⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨355, 445831, 445832⟩)
                  (.leaf ⟨355, 445831, 445832⟩)
                )
                (.branch 1
                  (.leaf ⟨355, 445831, 445832⟩)
                  (.leaf ⟨355, 445831, 445832⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨355, 445831, 445832⟩)
                  (.leaf ⟨356, 426855, 426856⟩)
                )
                (.branch 1
                  (.leaf ⟨356, 426855, 426856⟩)
                  (.leaf ⟨356, 426855, 426856⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨356, 426855, 426856⟩)
                  (.leaf ⟨356, 426855, 426856⟩)
                )
                (.branch 1
                  (.leaf ⟨357, 1427, 1428⟩)
                  (.leaf ⟨357, 1427, 1428⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨357, 1427, 1428⟩)
                  (.leaf ⟨357, 1427, 1428⟩)
                )
                (.branch 1
                  (.leaf ⟨357, 1427, 1428⟩)
                  (.leaf ⟨358, 1431, 1432⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨358, 1431, 1432⟩)
                  (.leaf ⟨358, 1431, 1432⟩)
                )
                (.branch 1
                  (.leaf ⟨358, 1431, 1432⟩)
                  (.leaf ⟨358, 1431, 1432⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨359, 1435, 1436⟩)
                  (.leaf ⟨359, 1435, 1436⟩)
                )
                (.branch 1
                  (.leaf ⟨359, 1435, 1436⟩)
                  (.leaf ⟨359, 1435, 1436⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨359, 1435, 1436⟩)
                  (.leaf ⟨360, 1439, 1440⟩)
                )
                (.branch 1
                  (.leaf ⟨360, 1439, 1440⟩)
                  (.leaf ⟨360, 1439, 1440⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨360, 1439, 1440⟩)
                  (.leaf ⟨360, 1439, 1440⟩)
                )
                (.branch 1
                  (.leaf ⟨361, 1443, 1444⟩)
                  (.leaf ⟨361, 1443, 1444⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨361, 1443, 1444⟩)
                  (.leaf ⟨361, 1443, 1444⟩)
                )
                (.branch 1
                  (.leaf ⟨361, 1443, 1444⟩)
                  (.leaf ⟨362, 1447, 1448⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨362, 1447, 1448⟩)
                  (.leaf ⟨362, 1447, 1448⟩)
                )
                (.branch 1
                  (.leaf ⟨362, 1447, 1448⟩)
                  (.leaf ⟨362, 1447, 1448⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨363, 1451, 1452⟩)
                  (.leaf ⟨363, 1451, 1452⟩)
                )
                (.branch 1
                  (.leaf ⟨363, 1451, 1452⟩)
                  (.leaf ⟨363, 1451, 1452⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨363, 1451, 1452⟩)
                  (.leaf ⟨364, 1455, 1456⟩)
                )
                (.branch 1
                  (.leaf ⟨364, 1455, 1456⟩)
                  (.leaf ⟨364, 1455, 1456⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨364, 1455, 1456⟩)
                  (.leaf ⟨364, 1455, 1456⟩)
                )
                (.branch 1
                  (.leaf ⟨365, 1459, 1460⟩)
                  (.leaf ⟨365, 1459, 1460⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨365, 1459, 1460⟩)
                  (.leaf ⟨365, 1459, 1460⟩)
                )
                (.branch 1
                  (.leaf ⟨365, 1459, 1460⟩)
                  (.leaf ⟨366, 1463, 1464⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨366, 1463, 1464⟩)
                  (.leaf ⟨366, 1463, 1464⟩)
                )
                (.branch 1
                  (.leaf ⟨366, 1463, 1464⟩)
                  (.leaf ⟨366, 1463, 1464⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨367, 1467, 1468⟩)
                  (.leaf ⟨367, 1467, 1468⟩)
                )
                (.branch 1
                  (.leaf ⟨367, 1467, 1468⟩)
                  (.leaf ⟨367, 1467, 1468⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨367, 1467, 1468⟩)
                  (.leaf ⟨368, 1471, 1472⟩)
                )
                (.branch 1
                  (.leaf ⟨368, 1471, 1472⟩)
                  (.leaf ⟨368, 1471, 1472⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨368, 1471, 1472⟩)
                  (.leaf ⟨368, 1471, 1472⟩)
                )
                (.branch 1
                  (.leaf ⟨369, 1475, 1476⟩)
                  (.leaf ⟨369, 1475, 1476⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨369, 1475, 1476⟩)
                  (.leaf ⟨369, 1475, 1476⟩)
                )
                (.branch 1
                  (.leaf ⟨369, 1475, 1476⟩)
                  (.leaf ⟨370, 426859, 426860⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨370, 426859, 426860⟩)
                  (.leaf ⟨370, 426859, 426860⟩)
                )
                (.branch 1
                  (.leaf ⟨370, 426859, 426860⟩)
                  (.leaf ⟨370, 426859, 426860⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨371, 1481, 1482⟩)
                  (.leaf ⟨371, 1481, 1482⟩)
                )
                (.branch 1
                  (.leaf ⟨371, 1481, 1482⟩)
                  (.leaf ⟨371, 1481, 1482⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨371, 1481, 1482⟩)
                  (.leaf ⟨372, 1485, 1486⟩)
                )
                (.branch 1
                  (.leaf ⟨372, 1485, 1486⟩)
                  (.leaf ⟨372, 1485, 1486⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨372, 1485, 1486⟩)
                  (.leaf ⟨372, 1485, 1486⟩)
                )
                (.branch 1
                  (.leaf ⟨373, 1489, 1490⟩)
                  (.leaf ⟨373, 1489, 1490⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨373, 1489, 1490⟩)
                  (.leaf ⟨373, 1489, 1490⟩)
                )
                (.branch 1
                  (.leaf ⟨373, 1489, 1490⟩)
                  (.leaf ⟨374, 1493, 1494⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨374, 1493, 1494⟩)
                  (.leaf ⟨374, 1493, 1494⟩)
                )
                (.branch 1
                  (.leaf ⟨374, 1493, 1494⟩)
                  (.leaf ⟨374, 1493, 1494⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨375, 1497, 1498⟩)
                  (.leaf ⟨375, 1497, 1498⟩)
                )
                (.branch 1
                  (.leaf ⟨375, 1497, 1498⟩)
                  (.leaf ⟨375, 1497, 1498⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨375, 1497, 1498⟩)
                  (.leaf ⟨376, 426887, 426887⟩)
                )
                (.branch 1
                  (.leaf ⟨376, 426887, 426887⟩)
                  (.leaf ⟨376, 426887, 426887⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨376, 426887, 426887⟩)
                  (.leaf ⟨376, 426887, 426887⟩)
                )
                (.branch 1
                  (.leaf ⟨377, 1507, 1508⟩)
                  (.leaf ⟨377, 1507, 1508⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨377, 1507, 1508⟩)
                  (.leaf ⟨377, 1507, 1508⟩)
                )
                (.branch 1
                  (.leaf ⟨377, 1507, 1508⟩)
                  (.leaf ⟨378, 426883, 426883⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨378, 426883, 426883⟩)
                  (.leaf ⟨378, 426883, 426883⟩)
                )
                (.branch 1
                  (.leaf ⟨378, 426883, 426883⟩)
                  (.leaf ⟨378, 426883, 426883⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨379, 1515, 1516⟩)
                  (.leaf ⟨379, 1515, 1516⟩)
                )
                (.branch 1
                  (.leaf ⟨379, 1515, 1516⟩)
                  (.leaf ⟨379, 1515, 1516⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨379, 1515, 1516⟩)
                  (.leaf ⟨380, 426880, 426880⟩)
                )
                (.branch 1
                  (.leaf ⟨380, 426880, 426880⟩)
                  (.leaf ⟨380, 426880, 426880⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨380, 426880, 426880⟩)
                  (.leaf ⟨380, 426880, 426880⟩)
                )
                (.branch 1
                  (.leaf ⟨381, 1523, 1524⟩)
                  (.leaf ⟨381, 1523, 1524⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨381, 1523, 1524⟩)
                  (.leaf ⟨381, 1523, 1524⟩)
                )
                (.branch 1
                  (.leaf ⟨381, 1523, 1524⟩)
                  (.leaf ⟨382, 1527, 1528⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨382, 1527, 1528⟩)
                  (.leaf ⟨382, 1527, 1528⟩)
                )
                (.branch 1
                  (.leaf ⟨382, 1527, 1528⟩)
                  (.leaf ⟨382, 1527, 1528⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨383, 1531, 1532⟩)
                  (.leaf ⟨383, 1531, 1532⟩)
                )
                (.branch 1
                  (.leaf ⟨383, 1531, 1532⟩)
                  (.leaf ⟨383, 1531, 1532⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨383, 1531, 1532⟩)
                  (.leaf ⟨370, 426859, 426860⟩)
                )
                (.branch 1
                  (.leaf ⟨370, 426859, 426860⟩)
                  (.leaf ⟨370, 426859, 426860⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨370, 426859, 426860⟩)
                  (.leaf ⟨370, 426859, 426860⟩)
                )
                (.branch 1
                  (.leaf ⟨371, 1481, 1482⟩)
                  (.leaf ⟨371, 1481, 1482⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨371, 1481, 1482⟩)
                  (.leaf ⟨371, 1481, 1482⟩)
                )
                (.branch 1
                  (.leaf ⟨371, 1481, 1482⟩)
                  (.leaf ⟨372, 1485, 1486⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨372, 1485, 1486⟩)
                  (.leaf ⟨372, 1485, 1486⟩)
                )
                (.branch 1
                  (.leaf ⟨372, 1485, 1486⟩)
                  (.leaf ⟨372, 1485, 1486⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨373, 1489, 1490⟩)
                  (.leaf ⟨373, 1489, 1490⟩)
                )
                (.branch 1
                  (.leaf ⟨373, 1489, 1490⟩)
                  (.leaf ⟨373, 1489, 1490⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨373, 1489, 1490⟩)
                  (.leaf ⟨374, 1493, 1494⟩)
                )
                (.branch 1
                  (.leaf ⟨374, 1493, 1494⟩)
                  (.leaf ⟨374, 1493, 1494⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨374, 1493, 1494⟩)
                  (.leaf ⟨374, 1493, 1494⟩)
                )
                (.branch 1
                  (.leaf ⟨375, 1497, 1498⟩)
                  (.leaf ⟨375, 1497, 1498⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_1536_512 : Balanced.RowTree Cell :=
  .branch 256 cache_1536_256 cache_1792_256
noncomputable def cache_1024_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_1024_512 cache_1536_512
noncomputable def cache_0_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_0_1024 cache_1024_1024
noncomputable def cache_2048_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨375, 1497, 1498⟩)
                  (.leaf ⟨375, 1497, 1498⟩)
                )
                (.branch 1
                  (.leaf ⟨375, 1497, 1498⟩)
                  (.leaf ⟨376, 426887, 426887⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨376, 426887, 426887⟩)
                  (.leaf ⟨376, 426887, 426887⟩)
                )
                (.branch 1
                  (.leaf ⟨376, 426887, 426887⟩)
                  (.leaf ⟨376, 426887, 426887⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨377, 1507, 1508⟩)
                  (.leaf ⟨377, 1507, 1508⟩)
                )
                (.branch 1
                  (.leaf ⟨377, 1507, 1508⟩)
                  (.leaf ⟨377, 1507, 1508⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨377, 1507, 1508⟩)
                  (.leaf ⟨378, 426883, 426883⟩)
                )
                (.branch 1
                  (.leaf ⟨378, 426883, 426883⟩)
                  (.leaf ⟨378, 426883, 426883⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨378, 426883, 426883⟩)
                  (.leaf ⟨378, 426883, 426883⟩)
                )
                (.branch 1
                  (.leaf ⟨379, 1515, 1516⟩)
                  (.leaf ⟨379, 1515, 1516⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨379, 1515, 1516⟩)
                  (.leaf ⟨379, 1515, 1516⟩)
                )
                (.branch 1
                  (.leaf ⟨379, 1515, 1516⟩)
                  (.leaf ⟨380, 426880, 426880⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨380, 426880, 426880⟩)
                  (.leaf ⟨380, 426880, 426880⟩)
                )
                (.branch 1
                  (.leaf ⟨380, 426880, 426880⟩)
                  (.leaf ⟨380, 426880, 426880⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨381, 1523, 1524⟩)
                  (.leaf ⟨381, 1523, 1524⟩)
                )
                (.branch 1
                  (.leaf ⟨381, 1523, 1524⟩)
                  (.leaf ⟨381, 1523, 1524⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨381, 1523, 1524⟩)
                  (.leaf ⟨382, 1527, 1528⟩)
                )
                (.branch 1
                  (.leaf ⟨382, 1527, 1528⟩)
                  (.leaf ⟨382, 1527, 1528⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨382, 1527, 1528⟩)
                  (.leaf ⟨382, 1527, 1528⟩)
                )
                (.branch 1
                  (.leaf ⟨383, 1531, 1532⟩)
                  (.leaf ⟨383, 1531, 1532⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨383, 1531, 1532⟩)
                  (.leaf ⟨383, 1531, 1532⟩)
                )
                (.branch 1
                  (.leaf ⟨383, 1531, 1532⟩)
                  (.leaf ⟨370, 426859, 426860⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨370, 426859, 426860⟩)
                  (.leaf ⟨370, 426859, 426860⟩)
                )
                (.branch 1
                  (.leaf ⟨370, 426859, 426860⟩)
                  (.leaf ⟨370, 426859, 426860⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨371, 1481, 1482⟩)
                  (.leaf ⟨371, 1481, 1482⟩)
                )
                (.branch 1
                  (.leaf ⟨371, 1481, 1482⟩)
                  (.leaf ⟨371, 1481, 1482⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨371, 1481, 1482⟩)
                  (.leaf ⟨372, 1485, 1486⟩)
                )
                (.branch 1
                  (.leaf ⟨372, 1485, 1486⟩)
                  (.leaf ⟨372, 1485, 1486⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨372, 1485, 1486⟩)
                  (.leaf ⟨372, 1485, 1486⟩)
                )
                (.branch 1
                  (.leaf ⟨373, 1489, 1490⟩)
                  (.leaf ⟨373, 1489, 1490⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨373, 1489, 1490⟩)
                  (.leaf ⟨373, 1489, 1490⟩)
                )
                (.branch 1
                  (.leaf ⟨373, 1489, 1490⟩)
                  (.leaf ⟨374, 1493, 1494⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨374, 1493, 1494⟩)
                  (.leaf ⟨374, 1493, 1494⟩)
                )
                (.branch 1
                  (.leaf ⟨374, 1493, 1494⟩)
                  (.leaf ⟨374, 1493, 1494⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨375, 1497, 1498⟩)
                  (.leaf ⟨375, 1497, 1498⟩)
                )
                (.branch 1
                  (.leaf ⟨375, 1497, 1498⟩)
                  (.leaf ⟨375, 1497, 1498⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨375, 1497, 1498⟩)
                  (.leaf ⟨376, 426887, 426887⟩)
                )
                (.branch 1
                  (.leaf ⟨376, 426887, 426887⟩)
                  (.leaf ⟨376, 426887, 426887⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨376, 426887, 426887⟩)
                  (.leaf ⟨376, 426887, 426887⟩)
                )
                (.branch 1
                  (.leaf ⟨377, 1507, 1508⟩)
                  (.leaf ⟨377, 1507, 1508⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨377, 1507, 1508⟩)
                  (.leaf ⟨377, 1507, 1508⟩)
                )
                (.branch 1
                  (.leaf ⟨377, 1507, 1508⟩)
                  (.leaf ⟨384, 426884, 426884⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨384, 426884, 426884⟩)
                  (.leaf ⟨384, 426884, 426884⟩)
                )
                (.branch 1
                  (.leaf ⟨384, 426884, 426884⟩)
                  (.leaf ⟨384, 426884, 426884⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨385, 1539, 1540⟩)
                  (.leaf ⟨385, 1539, 1540⟩)
                )
                (.branch 1
                  (.leaf ⟨385, 1539, 1540⟩)
                  (.leaf ⟨385, 1539, 1540⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨385, 1539, 1540⟩)
                  (.leaf ⟨386, 426891, 426891⟩)
                )
                (.branch 1
                  (.leaf ⟨386, 426891, 426891⟩)
                  (.leaf ⟨386, 426891, 426891⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨386, 426891, 426891⟩)
                  (.leaf ⟨386, 426891, 426891⟩)
                )
                (.branch 1
                  (.leaf ⟨387, 1547, 1548⟩)
                  (.leaf ⟨387, 1547, 1548⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨387, 1547, 1548⟩)
                  (.leaf ⟨387, 1547, 1548⟩)
                )
                (.branch 1
                  (.leaf ⟨387, 1547, 1548⟩)
                  (.leaf ⟨388, 1551, 1552⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨388, 1551, 1552⟩)
                  (.leaf ⟨388, 1551, 1552⟩)
                )
                (.branch 1
                  (.leaf ⟨388, 1551, 1552⟩)
                  (.leaf ⟨388, 1551, 1552⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨389, 1555, 1556⟩)
                  (.leaf ⟨389, 1555, 1556⟩)
                )
                (.branch 1
                  (.leaf ⟨389, 1555, 1556⟩)
                  (.leaf ⟨389, 1555, 1556⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨389, 1555, 1556⟩)
                  (.leaf ⟨370, 426859, 426860⟩)
                )
                (.branch 1
                  (.leaf ⟨370, 426859, 426860⟩)
                  (.leaf ⟨370, 426859, 426860⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨370, 426859, 426860⟩)
                  (.leaf ⟨370, 426859, 426860⟩)
                )
                (.branch 1
                  (.leaf ⟨371, 1481, 1482⟩)
                  (.leaf ⟨371, 1481, 1482⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨371, 1481, 1482⟩)
                  (.leaf ⟨371, 1481, 1482⟩)
                )
                (.branch 1
                  (.leaf ⟨371, 1481, 1482⟩)
                  (.leaf ⟨372, 1485, 1486⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨372, 1485, 1486⟩)
                  (.leaf ⟨372, 1485, 1486⟩)
                )
                (.branch 1
                  (.leaf ⟨372, 1485, 1486⟩)
                  (.leaf ⟨372, 1485, 1486⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨373, 1489, 1490⟩)
                  (.leaf ⟨373, 1489, 1490⟩)
                )
                (.branch 1
                  (.leaf ⟨373, 1489, 1490⟩)
                  (.leaf ⟨373, 1489, 1490⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨373, 1489, 1490⟩)
                  (.leaf ⟨374, 1493, 1494⟩)
                )
                (.branch 1
                  (.leaf ⟨374, 1493, 1494⟩)
                  (.leaf ⟨374, 1493, 1494⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨374, 1493, 1494⟩)
                  (.leaf ⟨374, 1493, 1494⟩)
                )
                (.branch 1
                  (.leaf ⟨375, 1497, 1498⟩)
                  (.leaf ⟨375, 1497, 1498⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨375, 1497, 1498⟩)
                  (.leaf ⟨375, 1497, 1498⟩)
                )
                (.branch 1
                  (.leaf ⟨375, 1497, 1498⟩)
                  (.leaf ⟨376, 426887, 426887⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨376, 426887, 426887⟩)
                  (.leaf ⟨376, 426887, 426887⟩)
                )
                (.branch 1
                  (.leaf ⟨376, 426887, 426887⟩)
                  (.leaf ⟨376, 426887, 426887⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨377, 1507, 1508⟩)
                  (.leaf ⟨377, 1507, 1508⟩)
                )
                (.branch 1
                  (.leaf ⟨377, 1507, 1508⟩)
                  (.leaf ⟨377, 1507, 1508⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨377, 1507, 1508⟩)
                  (.leaf ⟨384, 426884, 426884⟩)
                )
                (.branch 1
                  (.leaf ⟨384, 426884, 426884⟩)
                  (.leaf ⟨384, 426884, 426884⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨384, 426884, 426884⟩)
                  (.leaf ⟨384, 426884, 426884⟩)
                )
                (.branch 1
                  (.leaf ⟨385, 1539, 1540⟩)
                  (.leaf ⟨385, 1539, 1540⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨385, 1539, 1540⟩)
                  (.leaf ⟨385, 1539, 1540⟩)
                )
                (.branch 1
                  (.leaf ⟨385, 1539, 1540⟩)
                  (.leaf ⟨390, 426892, 426892⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨390, 426892, 426892⟩)
                  (.leaf ⟨390, 426892, 426892⟩)
                )
                (.branch 1
                  (.leaf ⟨390, 426892, 426892⟩)
                  (.leaf ⟨390, 426892, 426892⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨391, 1563, 1564⟩)
                  (.leaf ⟨391, 1563, 1564⟩)
                )
                (.branch 1
                  (.leaf ⟨391, 1563, 1564⟩)
                  (.leaf ⟨391, 1563, 1564⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨391, 1563, 1564⟩)
                  (.leaf ⟨392, 1567, 1568⟩)
                )
                (.branch 1
                  (.leaf ⟨392, 1567, 1568⟩)
                  (.leaf ⟨392, 1567, 1568⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨392, 1567, 1568⟩)
                  (.leaf ⟨392, 1567, 1568⟩)
                )
                (.branch 1
                  (.leaf ⟨393, 1571, 1572⟩)
                  (.leaf ⟨393, 1571, 1572⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨393, 1571, 1572⟩)
                  (.leaf ⟨393, 1571, 1572⟩)
                )
                (.branch 1
                  (.leaf ⟨393, 1571, 1572⟩)
                  (.leaf ⟨370, 426859, 426860⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨370, 426859, 426860⟩)
                  (.leaf ⟨370, 426859, 426860⟩)
                )
                (.branch 1
                  (.leaf ⟨370, 426859, 426860⟩)
                  (.leaf ⟨370, 426859, 426860⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨371, 1481, 1482⟩)
                  (.leaf ⟨371, 1481, 1482⟩)
                )
                (.branch 1
                  (.leaf ⟨371, 1481, 1482⟩)
                  (.leaf ⟨371, 1481, 1482⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨371, 1481, 1482⟩)
                  (.leaf ⟨372, 1485, 1486⟩)
                )
                (.branch 1
                  (.leaf ⟨372, 1485, 1486⟩)
                  (.leaf ⟨372, 1485, 1486⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨372, 1485, 1486⟩)
                  (.leaf ⟨372, 1485, 1486⟩)
                )
                (.branch 1
                  (.leaf ⟨373, 1489, 1490⟩)
                  (.leaf ⟨373, 1489, 1490⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨373, 1489, 1490⟩)
                  (.leaf ⟨373, 1489, 1490⟩)
                )
                (.branch 1
                  (.leaf ⟨373, 1489, 1490⟩)
                  (.leaf ⟨374, 1493, 1494⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨374, 1493, 1494⟩)
                  (.leaf ⟨374, 1493, 1494⟩)
                )
                (.branch 1
                  (.leaf ⟨374, 1493, 1494⟩)
                  (.leaf ⟨374, 1493, 1494⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨375, 1497, 1498⟩)
                  (.leaf ⟨375, 1497, 1498⟩)
                )
                (.branch 1
                  (.leaf ⟨375, 1497, 1498⟩)
                  (.leaf ⟨375, 1497, 1498⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨375, 1497, 1498⟩)
                  (.leaf ⟨394, 426888, 426888⟩)
                )
                (.branch 1
                  (.leaf ⟨394, 426888, 426888⟩)
                  (.leaf ⟨394, 426888, 426888⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨394, 426888, 426888⟩)
                  (.leaf ⟨394, 426888, 426888⟩)
                )
                (.branch 1
                  (.leaf ⟨395, 1579, 1580⟩)
                  (.leaf ⟨395, 1579, 1580⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨395, 1579, 1580⟩)
                  (.leaf ⟨395, 1579, 1580⟩)
                )
                (.branch 1
                  (.leaf ⟨395, 1579, 1580⟩)
                  (.leaf ⟨396, 426899, 426899⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨396, 426899, 426899⟩)
                  (.leaf ⟨396, 426899, 426899⟩)
                )
                (.branch 1
                  (.leaf ⟨396, 426899, 426899⟩)
                  (.leaf ⟨396, 426899, 426899⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨397, 1587, 1588⟩)
                  (.leaf ⟨397, 1587, 1588⟩)
                )
                (.branch 1
                  (.leaf ⟨397, 1587, 1588⟩)
                  (.leaf ⟨397, 1587, 1588⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨397, 1587, 1588⟩)
                  (.leaf ⟨398, 426895, 426895⟩)
                )
                (.branch 1
                  (.leaf ⟨398, 426895, 426895⟩)
                  (.leaf ⟨398, 426895, 426895⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨398, 426895, 426895⟩)
                  (.leaf ⟨398, 426895, 426895⟩)
                )
                (.branch 1
                  (.leaf ⟨399, 1595, 1596⟩)
                  (.leaf ⟨399, 1595, 1596⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨399, 1595, 1596⟩)
                  (.leaf ⟨399, 1595, 1596⟩)
                )
                (.branch 1
                  (.leaf ⟨399, 1595, 1596⟩)
                  (.leaf ⟨400, 1599, 1600⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨400, 1599, 1600⟩)
                  (.leaf ⟨400, 1599, 1600⟩)
                )
                (.branch 1
                  (.leaf ⟨400, 1599, 1600⟩)
                  (.leaf ⟨400, 1599, 1600⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨401, 1603, 1604⟩)
                  (.leaf ⟨401, 1603, 1604⟩)
                )
                (.branch 1
                  (.leaf ⟨401, 1603, 1604⟩)
                  (.leaf ⟨401, 1603, 1604⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨401, 1603, 1604⟩)
                  (.leaf ⟨401, 1603, 1604⟩)
                )
                (.branch 1
                  (.leaf ⟨401, 1603, 1604⟩)
                  (.leaf ⟨401, 1603, 1604⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_2304_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨393, 1571, 1572⟩)
                  (.leaf ⟨401, 1603, 1604⟩)
                )
                (.branch 1
                  (.leaf ⟨401, 1603, 1604⟩)
                  (.leaf ⟨401, 1603, 1604⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨389, 1555, 1556⟩)
                  (.leaf ⟨393, 1571, 1572⟩)
                )
                (.branch 1
                  (.leaf ⟨401, 1603, 1604⟩)
                  (.leaf ⟨401, 1603, 1604⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨383, 1531, 1532⟩)
                  (.leaf ⟨389, 1555, 1556⟩)
                )
                (.branch 1
                  (.leaf ⟨393, 1571, 1572⟩)
                  (.leaf ⟨401, 1603, 1604⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨383, 1531, 1532⟩)
                  (.leaf ⟨383, 1531, 1532⟩)
                )
                (.branch 1
                  (.leaf ⟨389, 1555, 1556⟩)
                  (.leaf ⟨393, 1571, 1572⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨401, 1603, 1604⟩)
                  (.leaf ⟨402, 426935, 426936⟩)
                )
                (.branch 1
                  (.leaf ⟨402, 426935, 426936⟩)
                  (.leaf ⟨403, 426939, 426940⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨404, 426943, 426944⟩)
                  (.leaf ⟨405, 426947, 426948⟩)
                )
                (.branch 1
                  (.leaf ⟨406, 426903, 426904⟩)
                  (.leaf ⟨406, 426903, 426904⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨407, 426907, 426908⟩)
                  (.leaf ⟨408, 426911, 426912⟩)
                )
                (.branch 1
                  (.leaf ⟨409, 426915, 426916⟩)
                  (.leaf ⟨410, 1627, 1628⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨410, 1627, 1628⟩)
                  (.leaf ⟨411, 1631, 1632⟩)
                )
                (.branch 1
                  (.leaf ⟨412, 1635, 1636⟩)
                  (.leaf ⟨413, 1639, 1640⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨414, 1643, 1644⟩)
                  (.leaf ⟨414, 1643, 1644⟩)
                )
                (.branch 1
                  (.leaf ⟨415, 1647, 1648⟩)
                  (.leaf ⟨416, 1651, 1652⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨417, 1655, 1656⟩)
                  (.leaf ⟨418, 1659, 1660⟩)
                )
                (.branch 1
                  (.leaf ⟨418, 1659, 1660⟩)
                  (.leaf ⟨419, 1663, 1664⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨420, 1667, 1668⟩)
                  (.leaf ⟨421, 1671, 1672⟩)
                )
                (.branch 1
                  (.leaf ⟨422, 1675, 1676⟩)
                  (.leaf ⟨422, 1675, 1676⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨423, 1679, 1680⟩)
                  (.leaf ⟨424, 1683, 1684⟩)
                )
                (.branch 1
                  (.leaf ⟨425, 1687, 1688⟩)
                  (.leaf ⟨426, 1691, 1692⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨426, 1691, 1692⟩)
                  (.leaf ⟨427, 1695, 1696⟩)
                )
                (.branch 1
                  (.leaf ⟨428, 1699, 1700⟩)
                  (.leaf ⟨429, 1703, 1704⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨430, 1707, 1708⟩)
                  (.leaf ⟨430, 1707, 1708⟩)
                )
                (.branch 1
                  (.leaf ⟨431, 1711, 1712⟩)
                  (.leaf ⟨432, 1715, 1716⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨433, 1719, 1720⟩)
                  (.leaf ⟨434, 1723, 1724⟩)
                )
                (.branch 1
                  (.leaf ⟨434, 1723, 1724⟩)
                  (.leaf ⟨435, 1727, 1728⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨436, 1731, 1732⟩)
                  (.leaf ⟨437, 1735, 1736⟩)
                )
                (.branch 1
                  (.leaf ⟨438, 1739, 1740⟩)
                  (.leaf ⟨438, 1739, 1740⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨439, 1743, 1744⟩)
                  (.leaf ⟨440, 1747, 1748⟩)
                )
                (.branch 1
                  (.leaf ⟨441, 1751, 1752⟩)
                  (.leaf ⟨442, 1755, 1756⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨442, 1755, 1756⟩)
                  (.leaf ⟨443, 1759, 1760⟩)
                )
                (.branch 1
                  (.leaf ⟨444, 1763, 1764⟩)
                  (.leaf ⟨445, 1767, 1768⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨446, 1771, 1772⟩)
                  (.leaf ⟨446, 1771, 1772⟩)
                )
                (.branch 1
                  (.leaf ⟨447, 1775, 1776⟩)
                  (.leaf ⟨448, 1779, 1780⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨449, 1783, 1784⟩)
                  (.leaf ⟨450, 1787, 1788⟩)
                )
                (.branch 1
                  (.leaf ⟨450, 1787, 1788⟩)
                  (.leaf ⟨451, 1791, 1792⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨452, 1795, 1796⟩)
                  (.leaf ⟨453, 1799, 1800⟩)
                )
                (.branch 1
                  (.leaf ⟨454, 1803, 1804⟩)
                  (.leaf ⟨454, 1803, 1804⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨455, 1807, 1808⟩)
                  (.leaf ⟨456, 1811, 1812⟩)
                )
                (.branch 1
                  (.leaf ⟨457, 1815, 1816⟩)
                  (.leaf ⟨458, 1819, 1820⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨458, 1819, 1820⟩)
                  (.leaf ⟨459, 1823, 1824⟩)
                )
                (.branch 1
                  (.leaf ⟨460, 1827, 1828⟩)
                  (.leaf ⟨461, 1831, 1832⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨462, 426863, 426864⟩)
                  (.leaf ⟨462, 426863, 426864⟩)
                )
                (.branch 1
                  (.leaf ⟨463, 426867, 426868⟩)
                  (.leaf ⟨464, 426871, 426872⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨465, 426875, 426876⟩)
                  (.leaf ⟨466, 1849, 1850⟩)
                )
                (.branch 1
                  (.leaf ⟨466, 1849, 1850⟩)
                  (.leaf ⟨467, 1853, 1854⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨468, 1857, 1858⟩)
                  (.leaf ⟨469, 1861, 1862⟩)
                )
                (.branch 1
                  (.leaf ⟨470, 1865, 1866⟩)
                  (.leaf ⟨470, 1865, 1866⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨471, 1869, 1870⟩)
                  (.leaf ⟨472, 1873, 1874⟩)
                )
                (.branch 1
                  (.leaf ⟨473, 1877, 1878⟩)
                  (.leaf ⟨474, 1881, 1882⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨474, 1881, 1882⟩)
                  (.leaf ⟨475, 1885, 1886⟩)
                )
                (.branch 1
                  (.leaf ⟨476, 1889, 1890⟩)
                  (.leaf ⟨477, 1893, 1894⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨478, 1897, 1898⟩)
                  (.leaf ⟨478, 1897, 1898⟩)
                )
                (.branch 1
                  (.leaf ⟨479, 1901, 1902⟩)
                  (.leaf ⟨480, 1905, 1906⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨481, 1909, 1910⟩)
                  (.leaf ⟨482, 1913, 1914⟩)
                )
                (.branch 1
                  (.leaf ⟨482, 1913, 1914⟩)
                  (.leaf ⟨483, 1917, 1918⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨484, 1921, 1922⟩)
                  (.leaf ⟨485, 1925, 1926⟩)
                )
                (.branch 1
                  (.leaf ⟨486, 1929, 1930⟩)
                  (.leaf ⟨486, 1929, 1930⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨487, 1933, 1934⟩)
                  (.leaf ⟨488, 1937, 1938⟩)
                )
                (.branch 1
                  (.leaf ⟨489, 1941, 1942⟩)
                  (.leaf ⟨490, 1947, 1948⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨490, 1947, 1948⟩)
                  (.leaf ⟨491, 1951, 1952⟩)
                )
                (.branch 1
                  (.leaf ⟨492, 1955, 1956⟩)
                  (.leaf ⟨493, 1959, 1960⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨494, 426919, 426920⟩)
                  (.leaf ⟨494, 426919, 426920⟩)
                )
                (.branch 1
                  (.leaf ⟨495, 426923, 426924⟩)
                  (.leaf ⟨496, 426927, 426928⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨497, 426931, 426932⟩)
                  (.leaf ⟨498, 1977, 1978⟩)
                )
                (.branch 1
                  (.leaf ⟨498, 1977, 1978⟩)
                  (.leaf ⟨499, 1981, 1982⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨500, 1985, 1986⟩)
                  (.leaf ⟨501, 1989, 1990⟩)
                )
                (.branch 1
                  (.leaf ⟨502, 1993, 1994⟩)
                  (.leaf ⟨502, 1993, 1994⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨503, 1997, 1998⟩)
                  (.leaf ⟨504, 2001, 2002⟩)
                )
                (.branch 1
                  (.leaf ⟨505, 2005, 2006⟩)
                  (.leaf ⟨506, 2009, 2010⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨506, 2009, 2010⟩)
                  (.leaf ⟨507, 2013, 2014⟩)
                )
                (.branch 1
                  (.leaf ⟨508, 2017, 2018⟩)
                  (.leaf ⟨509, 2021, 2022⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨510, 2025, 2026⟩)
                  (.leaf ⟨510, 2025, 2026⟩)
                )
                (.branch 1
                  (.leaf ⟨511, 2029, 2030⟩)
                  (.leaf ⟨512, 2033, 2034⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨513, 2037, 2038⟩)
                  (.leaf ⟨514, 2041, 2042⟩)
                )
                (.branch 1
                  (.leaf ⟨514, 2041, 2042⟩)
                  (.leaf ⟨515, 2045, 2046⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨516, 2049, 2050⟩)
                  (.leaf ⟨517, 2053, 2054⟩)
                )
                (.branch 1
                  (.leaf ⟨518, 2057, 2058⟩)
                  (.leaf ⟨518, 2057, 2058⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨519, 2061, 2062⟩)
                  (.leaf ⟨520, 2065, 2066⟩)
                )
                (.branch 1
                  (.leaf ⟨521, 2069, 2070⟩)
                  (.leaf ⟨522, 2075, 2076⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨522, 2075, 2076⟩)
                  (.leaf ⟨523, 2079, 2080⟩)
                )
                (.branch 1
                  (.leaf ⟨524, 2083, 2084⟩)
                  (.leaf ⟨525, 2087, 2088⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨526, 2075, 1948⟩)
                  (.leaf ⟨526, 2075, 1948⟩)
                )
                (.branch 1
                  (.leaf ⟨527, 2079, 1952⟩)
                  (.leaf ⟨528, 2083, 1956⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨529, 2087, 1960⟩)
                  (.leaf ⟨530, 2107, 2108⟩)
                )
                (.branch 1
                  (.leaf ⟨530, 2107, 2108⟩)
                  (.leaf ⟨531, 2111, 2112⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨532, 2115, 2116⟩)
                  (.leaf ⟨533, 2119, 2120⟩)
                )
                (.branch 1
                  (.leaf ⟨462, 426863, 426864⟩)
                  (.leaf ⟨462, 426863, 426864⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨463, 426867, 426868⟩)
                  (.leaf ⟨464, 426871, 426872⟩)
                )
                (.branch 1
                  (.leaf ⟨465, 426875, 426876⟩)
                  (.leaf ⟨466, 1849, 1850⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨466, 1849, 1850⟩)
                  (.leaf ⟨467, 1853, 1854⟩)
                )
                (.branch 1
                  (.leaf ⟨468, 1857, 1858⟩)
                  (.leaf ⟨469, 1861, 1862⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨470, 1865, 1866⟩)
                  (.leaf ⟨470, 1865, 1866⟩)
                )
                (.branch 1
                  (.leaf ⟨471, 1869, 1870⟩)
                  (.leaf ⟨472, 1873, 1874⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨473, 1877, 1878⟩)
                  (.leaf ⟨474, 1881, 1882⟩)
                )
                (.branch 1
                  (.leaf ⟨474, 1881, 1882⟩)
                  (.leaf ⟨475, 1885, 1886⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨476, 1889, 1890⟩)
                  (.leaf ⟨477, 1893, 1894⟩)
                )
                (.branch 1
                  (.leaf ⟨478, 1897, 1898⟩)
                  (.leaf ⟨478, 1897, 1898⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨479, 1901, 1902⟩)
                  (.leaf ⟨480, 1905, 1906⟩)
                )
                (.branch 1
                  (.leaf ⟨481, 1909, 1910⟩)
                  (.leaf ⟨482, 1913, 1914⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨482, 1913, 1914⟩)
                  (.leaf ⟨483, 1917, 1918⟩)
                )
                (.branch 1
                  (.leaf ⟨484, 1921, 1922⟩)
                  (.leaf ⟨485, 1925, 1926⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨486, 1929, 1930⟩)
                  (.leaf ⟨486, 1929, 1930⟩)
                )
                (.branch 1
                  (.leaf ⟨487, 1933, 1934⟩)
                  (.leaf ⟨488, 1937, 1938⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨489, 1941, 1942⟩)
                  (.leaf ⟨490, 1947, 1948⟩)
                )
                (.branch 1
                  (.leaf ⟨490, 1947, 1948⟩)
                  (.leaf ⟨491, 1951, 1952⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨492, 1955, 1956⟩)
                  (.leaf ⟨493, 1959, 1960⟩)
                )
                (.branch 1
                  (.leaf ⟨494, 426919, 426920⟩)
                  (.leaf ⟨494, 426919, 426920⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨495, 426923, 426924⟩)
                  (.leaf ⟨496, 426927, 426928⟩)
                )
                (.branch 1
                  (.leaf ⟨497, 426931, 426932⟩)
                  (.leaf ⟨498, 1977, 1978⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨498, 1977, 1978⟩)
                  (.leaf ⟨499, 1981, 1982⟩)
                )
                (.branch 1
                  (.leaf ⟨500, 1985, 1986⟩)
                  (.leaf ⟨501, 1989, 1990⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨502, 1993, 1994⟩)
                  (.leaf ⟨502, 1993, 1994⟩)
                )
                (.branch 1
                  (.leaf ⟨503, 1997, 1998⟩)
                  (.leaf ⟨504, 2001, 2002⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨505, 2005, 2006⟩)
                  (.leaf ⟨506, 2009, 2010⟩)
                )
                (.branch 1
                  (.leaf ⟨506, 2009, 2010⟩)
                  (.leaf ⟨507, 2013, 2014⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨508, 2017, 2018⟩)
                  (.leaf ⟨509, 2021, 2022⟩)
                )
                (.branch 1
                  (.leaf ⟨510, 2025, 2026⟩)
                  (.leaf ⟨510, 2025, 2026⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨511, 2029, 2030⟩)
                  (.leaf ⟨512, 2033, 2034⟩)
                )
                (.branch 1
                  (.leaf ⟨513, 2037, 2038⟩)
                  (.leaf ⟨514, 2041, 2042⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨514, 2041, 2042⟩)
                  (.leaf ⟨515, 2045, 2046⟩)
                )
                (.branch 1
                  (.leaf ⟨516, 2049, 2050⟩)
                  (.leaf ⟨517, 2053, 2054⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨518, 2057, 2058⟩)
                  (.leaf ⟨518, 2057, 2058⟩)
                )
                (.branch 1
                  (.leaf ⟨519, 2061, 2062⟩)
                  (.leaf ⟨520, 2065, 2066⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_2048_512 : Balanced.RowTree Cell :=
  .branch 256 cache_2048_256 cache_2304_256
noncomputable def cache_2560_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨521, 2069, 2070⟩)
                  (.leaf ⟨522, 2075, 2076⟩)
                )
                (.branch 1
                  (.leaf ⟨522, 2075, 2076⟩)
                  (.leaf ⟨523, 2079, 2080⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨524, 2083, 2084⟩)
                  (.leaf ⟨525, 2087, 2088⟩)
                )
                (.branch 1
                  (.leaf ⟨526, 2075, 1948⟩)
                  (.leaf ⟨526, 2075, 1948⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨527, 2079, 1952⟩)
                  (.leaf ⟨528, 2083, 1956⟩)
                )
                (.branch 1
                  (.leaf ⟨529, 2087, 1960⟩)
                  (.leaf ⟨530, 2107, 2108⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨530, 2107, 2108⟩)
                  (.leaf ⟨531, 2111, 2112⟩)
                )
                (.branch 1
                  (.leaf ⟨532, 2115, 2116⟩)
                  (.leaf ⟨533, 2119, 2120⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨530, 2107, 2108⟩)
                  (.leaf ⟨530, 2107, 2108⟩)
                )
                (.branch 1
                  (.leaf ⟨531, 2111, 2112⟩)
                  (.leaf ⟨532, 2115, 2116⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨533, 2119, 2120⟩)
                  (.leaf ⟨534, 2123, 2124⟩)
                )
                (.branch 1
                  (.leaf ⟨534, 2123, 2124⟩)
                  (.leaf ⟨535, 2127, 2128⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨536, 2131, 2132⟩)
                  (.leaf ⟨537, 2135, 2136⟩)
                )
                (.branch 1
                  (.leaf ⟨462, 426863, 426864⟩)
                  (.leaf ⟨462, 426863, 426864⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨463, 426867, 426868⟩)
                  (.leaf ⟨464, 426871, 426872⟩)
                )
                (.branch 1
                  (.leaf ⟨465, 426875, 426876⟩)
                  (.leaf ⟨466, 1849, 1850⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨466, 1849, 1850⟩)
                  (.leaf ⟨467, 1853, 1854⟩)
                )
                (.branch 1
                  (.leaf ⟨468, 1857, 1858⟩)
                  (.leaf ⟨469, 1861, 1862⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨470, 1865, 1866⟩)
                  (.leaf ⟨470, 1865, 1866⟩)
                )
                (.branch 1
                  (.leaf ⟨471, 1869, 1870⟩)
                  (.leaf ⟨472, 1873, 1874⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨473, 1877, 1878⟩)
                  (.leaf ⟨474, 1881, 1882⟩)
                )
                (.branch 1
                  (.leaf ⟨474, 1881, 1882⟩)
                  (.leaf ⟨475, 1885, 1886⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨476, 1889, 1890⟩)
                  (.leaf ⟨477, 1893, 1894⟩)
                )
                (.branch 1
                  (.leaf ⟨478, 1897, 1898⟩)
                  (.leaf ⟨478, 1897, 1898⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨479, 1901, 1902⟩)
                  (.leaf ⟨480, 1905, 1906⟩)
                )
                (.branch 1
                  (.leaf ⟨481, 1909, 1910⟩)
                  (.leaf ⟨482, 1913, 1914⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨482, 1913, 1914⟩)
                  (.leaf ⟨483, 1917, 1918⟩)
                )
                (.branch 1
                  (.leaf ⟨484, 1921, 1922⟩)
                  (.leaf ⟨485, 1925, 1926⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨486, 1929, 1930⟩)
                  (.leaf ⟨486, 1929, 1930⟩)
                )
                (.branch 1
                  (.leaf ⟨487, 1933, 1934⟩)
                  (.leaf ⟨488, 1937, 1938⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨489, 1941, 1942⟩)
                  (.leaf ⟨490, 1947, 1948⟩)
                )
                (.branch 1
                  (.leaf ⟨490, 1947, 1948⟩)
                  (.leaf ⟨491, 1951, 1952⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨492, 1955, 1956⟩)
                  (.leaf ⟨493, 1959, 1960⟩)
                )
                (.branch 1
                  (.leaf ⟨494, 426919, 426920⟩)
                  (.leaf ⟨494, 426919, 426920⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨495, 426923, 426924⟩)
                  (.leaf ⟨496, 426927, 426928⟩)
                )
                (.branch 1
                  (.leaf ⟨497, 426931, 426932⟩)
                  (.leaf ⟨498, 1977, 1978⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨498, 1977, 1978⟩)
                  (.leaf ⟨499, 1981, 1982⟩)
                )
                (.branch 1
                  (.leaf ⟨500, 1985, 1986⟩)
                  (.leaf ⟨501, 1989, 1990⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨502, 1993, 1994⟩)
                  (.leaf ⟨502, 1993, 1994⟩)
                )
                (.branch 1
                  (.leaf ⟨503, 1997, 1998⟩)
                  (.leaf ⟨504, 2001, 2002⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨505, 2005, 2006⟩)
                  (.leaf ⟨506, 2009, 2010⟩)
                )
                (.branch 1
                  (.leaf ⟨506, 2009, 2010⟩)
                  (.leaf ⟨507, 2013, 2014⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨508, 2017, 2018⟩)
                  (.leaf ⟨509, 2021, 2022⟩)
                )
                (.branch 1
                  (.leaf ⟨510, 2025, 2026⟩)
                  (.leaf ⟨510, 2025, 2026⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨511, 2029, 2030⟩)
                  (.leaf ⟨512, 2033, 2034⟩)
                )
                (.branch 1
                  (.leaf ⟨513, 2037, 2038⟩)
                  (.leaf ⟨514, 2041, 2042⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨514, 2041, 2042⟩)
                  (.leaf ⟨515, 2045, 2046⟩)
                )
                (.branch 1
                  (.leaf ⟨516, 2049, 2050⟩)
                  (.leaf ⟨517, 2053, 2054⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨518, 2057, 2058⟩)
                  (.leaf ⟨518, 2057, 2058⟩)
                )
                (.branch 1
                  (.leaf ⟨519, 2061, 2062⟩)
                  (.leaf ⟨520, 2065, 2066⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨521, 2069, 2070⟩)
                  (.leaf ⟨522, 2075, 2076⟩)
                )
                (.branch 1
                  (.leaf ⟨522, 2075, 2076⟩)
                  (.leaf ⟨523, 2079, 2080⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨524, 2083, 2084⟩)
                  (.leaf ⟨525, 2087, 2088⟩)
                )
                (.branch 1
                  (.leaf ⟨526, 2075, 1948⟩)
                  (.leaf ⟨526, 2075, 1948⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨527, 2079, 1952⟩)
                  (.leaf ⟨528, 2083, 1956⟩)
                )
                (.branch 1
                  (.leaf ⟨529, 2087, 1960⟩)
                  (.leaf ⟨530, 2107, 2108⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨530, 2107, 2108⟩)
                  (.leaf ⟨531, 2111, 2112⟩)
                )
                (.branch 1
                  (.leaf ⟨532, 2115, 2116⟩)
                  (.leaf ⟨533, 2119, 2120⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨494, 426919, 426920⟩)
                  (.leaf ⟨494, 426919, 426920⟩)
                )
                (.branch 1
                  (.leaf ⟨495, 426923, 426924⟩)
                  (.leaf ⟨496, 426927, 426928⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨497, 426931, 426932⟩)
                  (.leaf ⟨498, 1977, 1978⟩)
                )
                (.branch 1
                  (.leaf ⟨498, 1977, 1978⟩)
                  (.leaf ⟨499, 1981, 1982⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨500, 1985, 1986⟩)
                  (.leaf ⟨501, 1989, 1990⟩)
                )
                (.branch 1
                  (.leaf ⟨502, 1993, 1994⟩)
                  (.leaf ⟨502, 1993, 1994⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨503, 1997, 1998⟩)
                  (.leaf ⟨504, 2001, 2002⟩)
                )
                (.branch 1
                  (.leaf ⟨505, 2005, 2006⟩)
                  (.leaf ⟨506, 2009, 2010⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨506, 2009, 2010⟩)
                  (.leaf ⟨507, 2013, 2014⟩)
                )
                (.branch 1
                  (.leaf ⟨508, 2017, 2018⟩)
                  (.leaf ⟨509, 2021, 2022⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨510, 2025, 2026⟩)
                  (.leaf ⟨510, 2025, 2026⟩)
                )
                (.branch 1
                  (.leaf ⟨511, 2029, 2030⟩)
                  (.leaf ⟨512, 2033, 2034⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨513, 2037, 2038⟩)
                  (.leaf ⟨514, 2041, 2042⟩)
                )
                (.branch 1
                  (.leaf ⟨514, 2041, 2042⟩)
                  (.leaf ⟨515, 2045, 2046⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨516, 2049, 2050⟩)
                  (.leaf ⟨517, 2053, 2054⟩)
                )
                (.branch 1
                  (.leaf ⟨518, 2057, 2058⟩)
                  (.leaf ⟨518, 2057, 2058⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨519, 2061, 2062⟩)
                  (.leaf ⟨520, 2065, 2066⟩)
                )
                (.branch 1
                  (.leaf ⟨521, 2069, 2070⟩)
                  (.leaf ⟨522, 2075, 2076⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨522, 2075, 2076⟩)
                  (.leaf ⟨523, 2079, 2080⟩)
                )
                (.branch 1
                  (.leaf ⟨524, 2083, 2084⟩)
                  (.leaf ⟨525, 2087, 2088⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨462, 426863, 426864⟩)
                  (.leaf ⟨462, 426863, 426864⟩)
                )
                (.branch 1
                  (.leaf ⟨463, 426867, 426868⟩)
                  (.leaf ⟨464, 426871, 426872⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨465, 426875, 426876⟩)
                  (.leaf ⟨466, 1849, 1850⟩)
                )
                (.branch 1
                  (.leaf ⟨466, 1849, 1850⟩)
                  (.leaf ⟨467, 1853, 1854⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨468, 1857, 1858⟩)
                  (.leaf ⟨469, 1861, 1862⟩)
                )
                (.branch 1
                  (.leaf ⟨470, 1865, 1866⟩)
                  (.leaf ⟨470, 1865, 1866⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨471, 1869, 1870⟩)
                  (.leaf ⟨472, 1873, 1874⟩)
                )
                (.branch 1
                  (.leaf ⟨473, 1877, 1878⟩)
                  (.leaf ⟨474, 1881, 1882⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨474, 1881, 1882⟩)
                  (.leaf ⟨475, 1885, 1886⟩)
                )
                (.branch 1
                  (.leaf ⟨476, 1889, 1890⟩)
                  (.leaf ⟨477, 1893, 1894⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨478, 1897, 1898⟩)
                  (.leaf ⟨478, 1897, 1898⟩)
                )
                (.branch 1
                  (.leaf ⟨479, 1901, 1902⟩)
                  (.leaf ⟨480, 1905, 1906⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨481, 1909, 1910⟩)
                  (.leaf ⟨482, 1913, 1914⟩)
                )
                (.branch 1
                  (.leaf ⟨482, 1913, 1914⟩)
                  (.leaf ⟨483, 1917, 1918⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨484, 1921, 1922⟩)
                  (.leaf ⟨485, 1925, 1926⟩)
                )
                (.branch 1
                  (.leaf ⟨486, 1929, 1930⟩)
                  (.leaf ⟨486, 1929, 1930⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨487, 1933, 1934⟩)
                  (.leaf ⟨488, 1937, 1938⟩)
                )
                (.branch 1
                  (.leaf ⟨489, 1941, 1942⟩)
                  (.leaf ⟨490, 1947, 1948⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨490, 1947, 1948⟩)
                  (.leaf ⟨491, 1951, 1952⟩)
                )
                (.branch 1
                  (.leaf ⟨492, 1955, 1956⟩)
                  (.leaf ⟨493, 1959, 1960⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨538, 1947, 2076⟩)
                  (.leaf ⟨538, 1947, 2076⟩)
                )
                (.branch 1
                  (.leaf ⟨539, 1951, 2080⟩)
                  (.leaf ⟨540, 1955, 2084⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨541, 1959, 2088⟩)
                  (.leaf ⟨542, 2155, 2156⟩)
                )
                (.branch 1
                  (.leaf ⟨542, 2155, 2156⟩)
                  (.leaf ⟨543, 2159, 2160⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨544, 2163, 2164⟩)
                  (.leaf ⟨545, 2167, 2168⟩)
                )
                (.branch 1
                  (.leaf ⟨546, 2155, 2108⟩)
                  (.leaf ⟨546, 2155, 2108⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨547, 2159, 2112⟩)
                  (.leaf ⟨548, 2163, 2116⟩)
                )
                (.branch 1
                  (.leaf ⟨549, 2167, 2120⟩)
                  (.leaf ⟨550, 2187, 2188⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨550, 2187, 2188⟩)
                  (.leaf ⟨551, 2191, 2192⟩)
                )
                (.branch 1
                  (.leaf ⟨552, 2195, 2196⟩)
                  (.leaf ⟨553, 2199, 2200⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨554, 2187, 2124⟩)
                  (.leaf ⟨554, 2187, 2124⟩)
                )
                (.branch 1
                  (.leaf ⟨555, 2191, 2128⟩)
                  (.leaf ⟨556, 2195, 2132⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨557, 2199, 2136⟩)
                  (.leaf ⟨558, 2219, 2220⟩)
                )
                (.branch 1
                  (.leaf ⟨558, 2219, 2220⟩)
                  (.leaf ⟨559, 2223, 2224⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨560, 2227, 2228⟩)
                  (.leaf ⟨561, 2231, 2232⟩)
                )
                (.branch 1
                  (.leaf ⟨562, 2235, 2236⟩)
                  (.leaf ⟨562, 2235, 2236⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨563, 2239, 2240⟩)
                  (.leaf ⟨564, 2243, 2244⟩)
                )
                (.branch 1
                  (.leaf ⟨565, 2247, 2248⟩)
                  (.leaf ⟨566, 2251, 2252⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨566, 2251, 2252⟩)
                  (.leaf ⟨567, 2255, 2256⟩)
                )
                (.branch 1
                  (.leaf ⟨568, 2259, 2260⟩)
                  (.leaf ⟨569, 2263, 2264⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨570, 445907, 445908⟩)
                  (.leaf ⟨570, 445907, 445908⟩)
                )
                (.branch 1
                  (.leaf ⟨570, 445907, 445908⟩)
                  (.leaf ⟨571, 445911, 445912⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨572, 445915, 445916⟩)
                  (.leaf ⟨573, 426951, 426952⟩)
                )
                (.branch 1
                  (.leaf ⟨573, 426951, 426952⟩)
                  (.leaf ⟨573, 426951, 426952⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨574, 426955, 426956⟩)
                  (.leaf ⟨575, 426959, 426960⟩)
                )
                (.branch 1
                  (.leaf ⟨573, 426951, 426952⟩)
                  (.leaf ⟨573, 426951, 426952⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨573, 426951, 426952⟩)
                  (.leaf ⟨573, 426951, 426952⟩)
                )
                (.branch 1
                  (.leaf ⟨573, 426951, 426952⟩)
                  (.leaf ⟨573, 426951, 426952⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨573, 426951, 426952⟩)
                  (.leaf ⟨573, 426951, 426952⟩)
                )
                (.branch 1
                  (.leaf ⟨574, 426955, 426956⟩)
                  (.leaf ⟨575, 426959, 426960⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_2816_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨576, 2293, 2294⟩)
                  (.leaf ⟨576, 2293, 2294⟩)
                )
                (.branch 1
                  (.leaf ⟨576, 2293, 2294⟩)
                  (.leaf ⟨577, 2297, 2298⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨578, 2301, 2302⟩)
                  (.leaf ⟨579, 2305, 2306⟩)
                )
                (.branch 1
                  (.leaf ⟨579, 2305, 2306⟩)
                  (.leaf ⟨579, 2305, 2306⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨580, 2309, 2310⟩)
                  (.leaf ⟨581, 2313, 2314⟩)
                )
                (.branch 1
                  (.leaf ⟨582, 185367, 185367⟩)
                  (.leaf ⟨582, 185367, 185367⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨582, 185367, 185367⟩)
                  (.leaf ⟨583, 185371, 185371⟩)
                )
                (.branch 1
                  (.leaf ⟨584, 185375, 185375⟩)
                  (.leaf ⟨585, 2331, 2332⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨585, 2331, 2332⟩)
                  (.leaf ⟨585, 2331, 2332⟩)
                )
                (.branch 1
                  (.leaf ⟨586, 2335, 2336⟩)
                  (.leaf ⟨587, 2339, 2340⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨588, 426987, 426987⟩)
                  (.leaf ⟨588, 426987, 426987⟩)
                )
                (.branch 1
                  (.leaf ⟨588, 426987, 426987⟩)
                  (.leaf ⟨589, 426991, 426991⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨590, 426995, 426995⟩)
                  (.leaf ⟨591, 2355, 2356⟩)
                )
                (.branch 1
                  (.leaf ⟨591, 2355, 2356⟩)
                  (.leaf ⟨591, 2355, 2356⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨592, 2359, 2360⟩)
                  (.leaf ⟨593, 2363, 2364⟩)
                )
                (.branch 1
                  (.leaf ⟨594, 426975, 426975⟩)
                  (.leaf ⟨594, 426975, 426975⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨594, 426975, 426975⟩)
                  (.leaf ⟨595, 426979, 426979⟩)
                )
                (.branch 1
                  (.leaf ⟨596, 426983, 426983⟩)
                  (.leaf ⟨573, 426951, 426952⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨573, 426951, 426952⟩)
                  (.leaf ⟨573, 426951, 426952⟩)
                )
                (.branch 1
                  (.leaf ⟨574, 426955, 426956⟩)
                  (.leaf ⟨575, 426959, 426960⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨576, 2293, 2294⟩)
                  (.leaf ⟨576, 2293, 2294⟩)
                )
                (.branch 1
                  (.leaf ⟨576, 2293, 2294⟩)
                  (.leaf ⟨577, 2297, 2298⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨578, 2301, 2302⟩)
                  (.leaf ⟨579, 2305, 2306⟩)
                )
                (.branch 1
                  (.leaf ⟨579, 2305, 2306⟩)
                  (.leaf ⟨579, 2305, 2306⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨580, 2309, 2310⟩)
                  (.leaf ⟨581, 2313, 2314⟩)
                )
                (.branch 1
                  (.leaf ⟨582, 185367, 185367⟩)
                  (.leaf ⟨582, 185367, 185367⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨582, 185367, 185367⟩)
                  (.leaf ⟨583, 185371, 185371⟩)
                )
                (.branch 1
                  (.leaf ⟨584, 185375, 185375⟩)
                  (.leaf ⟨585, 2331, 2332⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨585, 2331, 2332⟩)
                  (.leaf ⟨585, 2331, 2332⟩)
                )
                (.branch 1
                  (.leaf ⟨586, 2335, 2336⟩)
                  (.leaf ⟨587, 2339, 2340⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨588, 426987, 426987⟩)
                  (.leaf ⟨588, 426987, 426987⟩)
                )
                (.branch 1
                  (.leaf ⟨588, 426987, 426987⟩)
                  (.leaf ⟨589, 426991, 426991⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨590, 426995, 426995⟩)
                  (.leaf ⟨591, 2355, 2356⟩)
                )
                (.branch 1
                  (.leaf ⟨591, 2355, 2356⟩)
                  (.leaf ⟨591, 2355, 2356⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨592, 2359, 2360⟩)
                  (.leaf ⟨593, 2363, 2364⟩)
                )
                (.branch 1
                  (.leaf ⟨594, 426975, 426975⟩)
                  (.leaf ⟨594, 426975, 426975⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨594, 426975, 426975⟩)
                  (.leaf ⟨595, 426979, 426979⟩)
                )
                (.branch 1
                  (.leaf ⟨596, 426983, 426983⟩)
                  (.leaf ⟨573, 426951, 426952⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨573, 426951, 426952⟩)
                  (.leaf ⟨573, 426951, 426952⟩)
                )
                (.branch 1
                  (.leaf ⟨574, 426955, 426956⟩)
                  (.leaf ⟨575, 426959, 426960⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨576, 2293, 2294⟩)
                  (.leaf ⟨576, 2293, 2294⟩)
                )
                (.branch 1
                  (.leaf ⟨576, 2293, 2294⟩)
                  (.leaf ⟨577, 2297, 2298⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨578, 2301, 2302⟩)
                  (.leaf ⟨579, 2305, 2306⟩)
                )
                (.branch 1
                  (.leaf ⟨579, 2305, 2306⟩)
                  (.leaf ⟨579, 2305, 2306⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨580, 2309, 2310⟩)
                  (.leaf ⟨581, 2313, 2314⟩)
                )
                (.branch 1
                  (.leaf ⟨582, 185367, 185367⟩)
                  (.leaf ⟨582, 185367, 185367⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨582, 185367, 185367⟩)
                  (.leaf ⟨583, 185371, 185371⟩)
                )
                (.branch 1
                  (.leaf ⟨584, 185375, 185375⟩)
                  (.leaf ⟨585, 2331, 2332⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨585, 2331, 2332⟩)
                  (.leaf ⟨585, 2331, 2332⟩)
                )
                (.branch 1
                  (.leaf ⟨586, 2335, 2336⟩)
                  (.leaf ⟨587, 2339, 2340⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨588, 426987, 426987⟩)
                  (.leaf ⟨588, 426987, 426987⟩)
                )
                (.branch 1
                  (.leaf ⟨588, 426987, 426987⟩)
                  (.leaf ⟨589, 426991, 426991⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨590, 426995, 426995⟩)
                  (.leaf ⟨591, 2355, 2356⟩)
                )
                (.branch 1
                  (.leaf ⟨591, 2355, 2356⟩)
                  (.leaf ⟨591, 2355, 2356⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨592, 2359, 2360⟩)
                  (.leaf ⟨593, 2363, 2364⟩)
                )
                (.branch 1
                  (.leaf ⟨594, 426975, 426975⟩)
                  (.leaf ⟨594, 426975, 426975⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨594, 426975, 426975⟩)
                  (.leaf ⟨595, 426979, 426979⟩)
                )
                (.branch 1
                  (.leaf ⟨596, 426983, 426983⟩)
                  (.leaf ⟨573, 426951, 426952⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨573, 426951, 426952⟩)
                  (.leaf ⟨573, 426951, 426952⟩)
                )
                (.branch 1
                  (.leaf ⟨574, 426955, 426956⟩)
                  (.leaf ⟨575, 426959, 426960⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨576, 2293, 2294⟩)
                  (.leaf ⟨576, 2293, 2294⟩)
                )
                (.branch 1
                  (.leaf ⟨576, 2293, 2294⟩)
                  (.leaf ⟨577, 2297, 2298⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨578, 2301, 2302⟩)
                  (.leaf ⟨579, 2305, 2306⟩)
                )
                (.branch 1
                  (.leaf ⟨579, 2305, 2306⟩)
                  (.leaf ⟨579, 2305, 2306⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨580, 2309, 2310⟩)
                  (.leaf ⟨581, 2313, 2314⟩)
                )
                (.branch 1
                  (.leaf ⟨582, 185367, 185367⟩)
                  (.leaf ⟨582, 185367, 185367⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨582, 185367, 185367⟩)
                  (.leaf ⟨583, 185371, 185371⟩)
                )
                (.branch 1
                  (.leaf ⟨584, 185375, 185375⟩)
                  (.leaf ⟨585, 2331, 2332⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨585, 2331, 2332⟩)
                  (.leaf ⟨585, 2331, 2332⟩)
                )
                (.branch 1
                  (.leaf ⟨586, 2335, 2336⟩)
                  (.leaf ⟨587, 2339, 2340⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨588, 426987, 426987⟩)
                  (.leaf ⟨588, 426987, 426987⟩)
                )
                (.branch 1
                  (.leaf ⟨588, 426987, 426987⟩)
                  (.leaf ⟨589, 426991, 426991⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨590, 426995, 426995⟩)
                  (.leaf ⟨591, 2355, 2356⟩)
                )
                (.branch 1
                  (.leaf ⟨591, 2355, 2356⟩)
                  (.leaf ⟨591, 2355, 2356⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨592, 2359, 2360⟩)
                  (.leaf ⟨593, 2363, 2364⟩)
                )
                (.branch 1
                  (.leaf ⟨594, 426975, 426975⟩)
                  (.leaf ⟨594, 426975, 426975⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨594, 426975, 426975⟩)
                  (.leaf ⟨595, 426979, 426979⟩)
                )
                (.branch 1
                  (.leaf ⟨596, 426983, 426983⟩)
                  (.leaf ⟨573, 426951, 426952⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨573, 426951, 426952⟩)
                  (.leaf ⟨573, 426951, 426952⟩)
                )
                (.branch 1
                  (.leaf ⟨574, 426955, 426956⟩)
                  (.leaf ⟨575, 426959, 426960⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨576, 2293, 2294⟩)
                  (.leaf ⟨576, 2293, 2294⟩)
                )
                (.branch 1
                  (.leaf ⟨576, 2293, 2294⟩)
                  (.leaf ⟨577, 2297, 2298⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨578, 2301, 2302⟩)
                  (.leaf ⟨579, 2305, 2306⟩)
                )
                (.branch 1
                  (.leaf ⟨579, 2305, 2306⟩)
                  (.leaf ⟨579, 2305, 2306⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨580, 2309, 2310⟩)
                  (.leaf ⟨581, 2313, 2314⟩)
                )
                (.branch 1
                  (.leaf ⟨582, 185367, 185367⟩)
                  (.leaf ⟨582, 185367, 185367⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨582, 185367, 185367⟩)
                  (.leaf ⟨583, 185371, 185371⟩)
                )
                (.branch 1
                  (.leaf ⟨584, 185375, 185375⟩)
                  (.leaf ⟨585, 2331, 2332⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨585, 2331, 2332⟩)
                  (.leaf ⟨585, 2331, 2332⟩)
                )
                (.branch 1
                  (.leaf ⟨586, 2335, 2336⟩)
                  (.leaf ⟨587, 2339, 2340⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨588, 426987, 426987⟩)
                  (.leaf ⟨588, 426987, 426987⟩)
                )
                (.branch 1
                  (.leaf ⟨588, 426987, 426987⟩)
                  (.leaf ⟨589, 426991, 426991⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨590, 426995, 426995⟩)
                  (.leaf ⟨591, 2355, 2356⟩)
                )
                (.branch 1
                  (.leaf ⟨591, 2355, 2356⟩)
                  (.leaf ⟨591, 2355, 2356⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨592, 2359, 2360⟩)
                  (.leaf ⟨593, 2363, 2364⟩)
                )
                (.branch 1
                  (.leaf ⟨594, 426975, 426975⟩)
                  (.leaf ⟨594, 426975, 426975⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨594, 426975, 426975⟩)
                  (.leaf ⟨595, 426979, 426979⟩)
                )
                (.branch 1
                  (.leaf ⟨596, 426983, 426983⟩)
                  (.leaf ⟨594, 426975, 426975⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨594, 426975, 426975⟩)
                  (.leaf ⟨594, 426975, 426975⟩)
                )
                (.branch 1
                  (.leaf ⟨595, 426979, 426979⟩)
                  (.leaf ⟨596, 426983, 426983⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨594, 426975, 426975⟩)
                  (.leaf ⟨594, 426975, 426975⟩)
                )
                (.branch 1
                  (.leaf ⟨594, 426975, 426975⟩)
                  (.leaf ⟨595, 426979, 426979⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨596, 426983, 426983⟩)
                  (.leaf ⟨594, 426975, 426975⟩)
                )
                (.branch 1
                  (.leaf ⟨594, 426975, 426975⟩)
                  (.leaf ⟨594, 426975, 426975⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨595, 426979, 426979⟩)
                  (.leaf ⟨596, 426983, 426983⟩)
                )
                (.branch 1
                  (.leaf ⟨594, 426975, 426975⟩)
                  (.leaf ⟨594, 426975, 426975⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨594, 426975, 426975⟩)
                  (.leaf ⟨595, 426979, 426979⟩)
                )
                (.branch 1
                  (.leaf ⟨596, 426983, 426983⟩)
                  (.leaf ⟨597, 426963, 426964⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨597, 426963, 426964⟩)
                  (.leaf ⟨597, 426963, 426964⟩)
                )
                (.branch 1
                  (.leaf ⟨598, 426967, 426968⟩)
                  (.leaf ⟨599, 426971, 426972⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨597, 426963, 426964⟩)
                  (.leaf ⟨597, 426963, 426964⟩)
                )
                (.branch 1
                  (.leaf ⟨597, 426963, 426964⟩)
                  (.leaf ⟨597, 426963, 426964⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨597, 426963, 426964⟩)
                  (.leaf ⟨600, 2389, 2390⟩)
                )
                (.branch 1
                  (.leaf ⟨600, 2389, 2390⟩)
                  (.leaf ⟨600, 2389, 2390⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨600, 2389, 2390⟩)
                  (.leaf ⟨600, 2389, 2390⟩)
                )
                (.branch 1
                  (.leaf ⟨601, 2401, 2402⟩)
                  (.leaf ⟨601, 2401, 2402⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨601, 2401, 2402⟩)
                  (.leaf ⟨601, 2401, 2402⟩)
                )
                (.branch 1
                  (.leaf ⟨601, 2401, 2402⟩)
                  (.leaf ⟨602, 2405, 2406⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨602, 2405, 2406⟩)
                  (.leaf ⟨602, 2405, 2406⟩)
                )
                (.branch 1
                  (.leaf ⟨602, 2405, 2406⟩)
                  (.leaf ⟨602, 2405, 2406⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨603, 2411, 2412⟩)
                  (.leaf ⟨603, 2411, 2412⟩)
                )
                (.branch 1
                  (.leaf ⟨603, 2411, 2412⟩)
                  (.leaf ⟨603, 2411, 2412⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨603, 2411, 2412⟩)
                  (.leaf ⟨597, 426963, 426964⟩)
                )
                (.branch 1
                  (.leaf ⟨597, 426963, 426964⟩)
                  (.leaf ⟨597, 426963, 426964⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨598, 426967, 426968⟩)
                  (.leaf ⟨599, 426971, 426972⟩)
                )
                (.branch 1
                  (.leaf ⟨598, 426967, 426968⟩)
                  (.leaf ⟨598, 426967, 426968⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨598, 426967, 426968⟩)
                  (.leaf ⟨598, 426967, 426968⟩)
                )
                (.branch 1
                  (.leaf ⟨598, 426967, 426968⟩)
                  (.leaf ⟨604, 2393, 2394⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_2560_512 : Balanced.RowTree Cell :=
  .branch 256 cache_2560_256 cache_2816_256
noncomputable def cache_2048_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_2048_512 cache_2560_512
noncomputable def cache_3072_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨604, 2393, 2394⟩)
                  (.leaf ⟨604, 2393, 2394⟩)
                )
                (.branch 1
                  (.leaf ⟨604, 2393, 2394⟩)
                  (.leaf ⟨604, 2393, 2394⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨605, 2417, 2418⟩)
                  (.leaf ⟨605, 2417, 2418⟩)
                )
                (.branch 1
                  (.leaf ⟨605, 2417, 2418⟩)
                  (.leaf ⟨605, 2417, 2418⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨605, 2417, 2418⟩)
                  (.leaf ⟨606, 2421, 2422⟩)
                )
                (.branch 1
                  (.leaf ⟨606, 2421, 2422⟩)
                  (.leaf ⟨606, 2421, 2422⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨606, 2421, 2422⟩)
                  (.leaf ⟨606, 2421, 2422⟩)
                )
                (.branch 1
                  (.leaf ⟨607, 2427, 2428⟩)
                  (.leaf ⟨607, 2427, 2428⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨607, 2427, 2428⟩)
                  (.leaf ⟨607, 2427, 2428⟩)
                )
                (.branch 1
                  (.leaf ⟨607, 2427, 2428⟩)
                  (.leaf ⟨608, 2427, 2412⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨608, 2427, 2412⟩)
                  (.leaf ⟨608, 2427, 2412⟩)
                )
                (.branch 1
                  (.leaf ⟨608, 2427, 2412⟩)
                  (.leaf ⟨608, 2427, 2412⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨609, 2435, 2436⟩)
                  (.leaf ⟨609, 2435, 2436⟩)
                )
                (.branch 1
                  (.leaf ⟨609, 2435, 2436⟩)
                  (.leaf ⟨609, 2435, 2436⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨609, 2435, 2436⟩)
                  (.leaf ⟨597, 426963, 426964⟩)
                )
                (.branch 1
                  (.leaf ⟨597, 426963, 426964⟩)
                  (.leaf ⟨597, 426963, 426964⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨598, 426967, 426968⟩)
                  (.leaf ⟨599, 426971, 426972⟩)
                )
                (.branch 1
                  (.leaf ⟨597, 426963, 426964⟩)
                  (.leaf ⟨597, 426963, 426964⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨597, 426963, 426964⟩)
                  (.leaf ⟨597, 426963, 426964⟩)
                )
                (.branch 1
                  (.leaf ⟨597, 426963, 426964⟩)
                  (.leaf ⟨600, 2389, 2390⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨600, 2389, 2390⟩)
                  (.leaf ⟨600, 2389, 2390⟩)
                )
                (.branch 1
                  (.leaf ⟨600, 2389, 2390⟩)
                  (.leaf ⟨600, 2389, 2390⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨601, 2401, 2402⟩)
                  (.leaf ⟨601, 2401, 2402⟩)
                )
                (.branch 1
                  (.leaf ⟨601, 2401, 2402⟩)
                  (.leaf ⟨601, 2401, 2402⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨601, 2401, 2402⟩)
                  (.leaf ⟨602, 2405, 2406⟩)
                )
                (.branch 1
                  (.leaf ⟨602, 2405, 2406⟩)
                  (.leaf ⟨602, 2405, 2406⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨602, 2405, 2406⟩)
                  (.leaf ⟨602, 2405, 2406⟩)
                )
                (.branch 1
                  (.leaf ⟨603, 2411, 2412⟩)
                  (.leaf ⟨603, 2411, 2412⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨603, 2411, 2412⟩)
                  (.leaf ⟨603, 2411, 2412⟩)
                )
                (.branch 1
                  (.leaf ⟨603, 2411, 2412⟩)
                  (.leaf ⟨597, 426963, 426964⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨597, 426963, 426964⟩)
                  (.leaf ⟨597, 426963, 426964⟩)
                )
                (.branch 1
                  (.leaf ⟨598, 426967, 426968⟩)
                  (.leaf ⟨599, 426971, 426972⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨597, 426963, 426964⟩)
                  (.leaf ⟨597, 426963, 426964⟩)
                )
                (.branch 1
                  (.leaf ⟨597, 426963, 426964⟩)
                  (.leaf ⟨597, 426963, 426964⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨597, 426963, 426964⟩)
                  (.leaf ⟨600, 2389, 2390⟩)
                )
                (.branch 1
                  (.leaf ⟨600, 2389, 2390⟩)
                  (.leaf ⟨600, 2389, 2390⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨600, 2389, 2390⟩)
                  (.leaf ⟨600, 2389, 2390⟩)
                )
                (.branch 1
                  (.leaf ⟨601, 2401, 2402⟩)
                  (.leaf ⟨601, 2401, 2402⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨601, 2401, 2402⟩)
                  (.leaf ⟨601, 2401, 2402⟩)
                )
                (.branch 1
                  (.leaf ⟨601, 2401, 2402⟩)
                  (.leaf ⟨602, 2405, 2406⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨602, 2405, 2406⟩)
                  (.leaf ⟨602, 2405, 2406⟩)
                )
                (.branch 1
                  (.leaf ⟨602, 2405, 2406⟩)
                  (.leaf ⟨602, 2405, 2406⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨603, 2411, 2412⟩)
                  (.leaf ⟨603, 2411, 2412⟩)
                )
                (.branch 1
                  (.leaf ⟨603, 2411, 2412⟩)
                  (.leaf ⟨603, 2411, 2412⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨603, 2411, 2412⟩)
                  (.leaf ⟨603, 2411, 2412⟩)
                )
                (.branch 1
                  (.leaf ⟨603, 2411, 2412⟩)
                  (.leaf ⟨603, 2411, 2412⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨603, 2411, 2412⟩)
                  (.leaf ⟨603, 2411, 2412⟩)
                )
                (.branch 1
                  (.leaf ⟨610, 2415, 2416⟩)
                  (.leaf ⟨610, 2415, 2416⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨610, 2415, 2416⟩)
                  (.leaf ⟨610, 2415, 2416⟩)
                )
                (.branch 1
                  (.leaf ⟨610, 2415, 2416⟩)
                  (.leaf ⟨611, 2415, 2436⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨611, 2415, 2436⟩)
                  (.leaf ⟨611, 2415, 2436⟩)
                )
                (.branch 1
                  (.leaf ⟨611, 2415, 2436⟩)
                  (.leaf ⟨611, 2415, 2436⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨612, 2447, 2448⟩)
                  (.leaf ⟨612, 2447, 2448⟩)
                )
                (.branch 1
                  (.leaf ⟨612, 2447, 2448⟩)
                  (.leaf ⟨612, 2447, 2448⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨612, 2447, 2448⟩)
                  (.leaf ⟨597, 426963, 426964⟩)
                )
                (.branch 1
                  (.leaf ⟨597, 426963, 426964⟩)
                  (.leaf ⟨597, 426963, 426964⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨598, 426967, 426968⟩)
                  (.leaf ⟨599, 426971, 426972⟩)
                )
                (.branch 1
                  (.leaf ⟨597, 426963, 426964⟩)
                  (.leaf ⟨597, 426963, 426964⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨597, 426963, 426964⟩)
                  (.leaf ⟨597, 426963, 426964⟩)
                )
                (.branch 1
                  (.leaf ⟨597, 426963, 426964⟩)
                  (.leaf ⟨600, 2389, 2390⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨600, 2389, 2390⟩)
                  (.leaf ⟨600, 2389, 2390⟩)
                )
                (.branch 1
                  (.leaf ⟨600, 2389, 2390⟩)
                  (.leaf ⟨600, 2389, 2390⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨601, 2401, 2402⟩)
                  (.leaf ⟨601, 2401, 2402⟩)
                )
                (.branch 1
                  (.leaf ⟨601, 2401, 2402⟩)
                  (.leaf ⟨601, 2401, 2402⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨601, 2401, 2402⟩)
                  (.leaf ⟨602, 2405, 2406⟩)
                )
                (.branch 1
                  (.leaf ⟨602, 2405, 2406⟩)
                  (.leaf ⟨602, 2405, 2406⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨602, 2405, 2406⟩)
                  (.leaf ⟨602, 2405, 2406⟩)
                )
                (.branch 1
                  (.leaf ⟨603, 2411, 2412⟩)
                  (.leaf ⟨603, 2411, 2412⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨603, 2411, 2412⟩)
                  (.leaf ⟨603, 2411, 2412⟩)
                )
                (.branch 1
                  (.leaf ⟨603, 2411, 2412⟩)
                  (.leaf ⟨597, 426963, 426964⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨597, 426963, 426964⟩)
                  (.leaf ⟨597, 426963, 426964⟩)
                )
                (.branch 1
                  (.leaf ⟨598, 426967, 426968⟩)
                  (.leaf ⟨599, 426971, 426972⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨597, 426963, 426964⟩)
                  (.leaf ⟨597, 426963, 426964⟩)
                )
                (.branch 1
                  (.leaf ⟨597, 426963, 426964⟩)
                  (.leaf ⟨597, 426963, 426964⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨597, 426963, 426964⟩)
                  (.leaf ⟨600, 2389, 2390⟩)
                )
                (.branch 1
                  (.leaf ⟨600, 2389, 2390⟩)
                  (.leaf ⟨600, 2389, 2390⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨600, 2389, 2390⟩)
                  (.leaf ⟨600, 2389, 2390⟩)
                )
                (.branch 1
                  (.leaf ⟨601, 2401, 2402⟩)
                  (.leaf ⟨601, 2401, 2402⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨601, 2401, 2402⟩)
                  (.leaf ⟨601, 2401, 2402⟩)
                )
                (.branch 1
                  (.leaf ⟨601, 2401, 2402⟩)
                  (.leaf ⟨602, 2405, 2406⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨602, 2405, 2406⟩)
                  (.leaf ⟨602, 2405, 2406⟩)
                )
                (.branch 1
                  (.leaf ⟨602, 2405, 2406⟩)
                  (.leaf ⟨602, 2405, 2406⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨603, 2411, 2412⟩)
                  (.leaf ⟨603, 2411, 2412⟩)
                )
                (.branch 1
                  (.leaf ⟨603, 2411, 2412⟩)
                  (.leaf ⟨603, 2411, 2412⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨603, 2411, 2412⟩)
                  (.leaf ⟨603, 2411, 2412⟩)
                )
                (.branch 1
                  (.leaf ⟨603, 2411, 2412⟩)
                  (.leaf ⟨603, 2411, 2412⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨603, 2411, 2412⟩)
                  (.leaf ⟨603, 2411, 2412⟩)
                )
                (.branch 1
                  (.leaf ⟨610, 2415, 2416⟩)
                  (.leaf ⟨610, 2415, 2416⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨610, 2415, 2416⟩)
                  (.leaf ⟨610, 2415, 2416⟩)
                )
                (.branch 1
                  (.leaf ⟨610, 2415, 2416⟩)
                  (.leaf ⟨597, 426963, 426964⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨597, 426963, 426964⟩)
                  (.leaf ⟨597, 426963, 426964⟩)
                )
                (.branch 1
                  (.leaf ⟨598, 426967, 426968⟩)
                  (.leaf ⟨599, 426971, 426972⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨599, 426971, 426972⟩)
                  (.leaf ⟨599, 426971, 426972⟩)
                )
                (.branch 1
                  (.leaf ⟨599, 426971, 426972⟩)
                  (.leaf ⟨599, 426971, 426972⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨599, 426971, 426972⟩)
                  (.leaf ⟨613, 2397, 2398⟩)
                )
                (.branch 1
                  (.leaf ⟨613, 2397, 2398⟩)
                  (.leaf ⟨613, 2397, 2398⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨613, 2397, 2398⟩)
                  (.leaf ⟨613, 2397, 2398⟩)
                )
                (.branch 1
                  (.leaf ⟨614, 2453, 2454⟩)
                  (.leaf ⟨614, 2453, 2454⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨614, 2453, 2454⟩)
                  (.leaf ⟨614, 2453, 2454⟩)
                )
                (.branch 1
                  (.leaf ⟨614, 2453, 2454⟩)
                  (.leaf ⟨615, 2457, 2458⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨615, 2457, 2458⟩)
                  (.leaf ⟨615, 2457, 2458⟩)
                )
                (.branch 1
                  (.leaf ⟨615, 2457, 2458⟩)
                  (.leaf ⟨615, 2457, 2458⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨616, 2463, 2464⟩)
                  (.leaf ⟨616, 2463, 2464⟩)
                )
                (.branch 1
                  (.leaf ⟨616, 2463, 2464⟩)
                  (.leaf ⟨616, 2463, 2464⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨616, 2463, 2464⟩)
                  (.leaf ⟨597, 426963, 426964⟩)
                )
                (.branch 1
                  (.leaf ⟨597, 426963, 426964⟩)
                  (.leaf ⟨597, 426963, 426964⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨598, 426967, 426968⟩)
                  (.leaf ⟨599, 426971, 426972⟩)
                )
                (.branch 1
                  (.leaf ⟨597, 426963, 426964⟩)
                  (.leaf ⟨597, 426963, 426964⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨597, 426963, 426964⟩)
                  (.leaf ⟨597, 426963, 426964⟩)
                )
                (.branch 1
                  (.leaf ⟨597, 426963, 426964⟩)
                  (.leaf ⟨600, 2389, 2390⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨600, 2389, 2390⟩)
                  (.leaf ⟨600, 2389, 2390⟩)
                )
                (.branch 1
                  (.leaf ⟨600, 2389, 2390⟩)
                  (.leaf ⟨600, 2389, 2390⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨601, 2401, 2402⟩)
                  (.leaf ⟨601, 2401, 2402⟩)
                )
                (.branch 1
                  (.leaf ⟨601, 2401, 2402⟩)
                  (.leaf ⟨601, 2401, 2402⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨601, 2401, 2402⟩)
                  (.leaf ⟨602, 2405, 2406⟩)
                )
                (.branch 1
                  (.leaf ⟨602, 2405, 2406⟩)
                  (.leaf ⟨602, 2405, 2406⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨602, 2405, 2406⟩)
                  (.leaf ⟨602, 2405, 2406⟩)
                )
                (.branch 1
                  (.leaf ⟨603, 2411, 2412⟩)
                  (.leaf ⟨603, 2411, 2412⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨603, 2411, 2412⟩)
                  (.leaf ⟨603, 2411, 2412⟩)
                )
                (.branch 1
                  (.leaf ⟨603, 2411, 2412⟩)
                  (.leaf ⟨617, 2411, 2464⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨617, 2411, 2464⟩)
                  (.leaf ⟨617, 2411, 2464⟩)
                )
                (.branch 1
                  (.leaf ⟨617, 2411, 2464⟩)
                  (.leaf ⟨617, 2411, 2464⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨618, 2471, 2472⟩)
                  (.leaf ⟨618, 2471, 2472⟩)
                )
                (.branch 1
                  (.leaf ⟨618, 2471, 2472⟩)
                  (.leaf ⟨618, 2471, 2472⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨618, 2471, 2472⟩)
                  (.leaf ⟨619, 2471, 2416⟩)
                )
                (.branch 1
                  (.leaf ⟨619, 2471, 2416⟩)
                  (.leaf ⟨619, 2471, 2416⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨619, 2471, 2416⟩)
                  (.leaf ⟨619, 2471, 2416⟩)
                )
                (.branch 1
                  (.leaf ⟨620, 2479, 2480⟩)
                  (.leaf ⟨620, 2479, 2480⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_3328_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨620, 2479, 2480⟩)
                  (.leaf ⟨620, 2479, 2480⟩)
                )
                (.branch 1
                  (.leaf ⟨620, 2479, 2480⟩)
                  (.leaf ⟨621, 2479, 2448⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨621, 2479, 2448⟩)
                  (.leaf ⟨621, 2479, 2448⟩)
                )
                (.branch 1
                  (.leaf ⟨621, 2479, 2448⟩)
                  (.leaf ⟨621, 2479, 2448⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨622, 426999, 427000⟩)
                  (.leaf ⟨622, 426999, 427000⟩)
                )
                (.branch 1
                  (.leaf ⟨622, 426999, 427000⟩)
                  (.leaf ⟨622, 426999, 427000⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨622, 426999, 427000⟩)
                  (.leaf ⟨623, 2489, 2490⟩)
                )
                (.branch 1
                  (.leaf ⟨623, 2489, 2490⟩)
                  (.leaf ⟨623, 2489, 2490⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨623, 2489, 2490⟩)
                  (.leaf ⟨623, 2489, 2490⟩)
                )
                (.branch 1
                  (.leaf ⟨624, 2493, 2494⟩)
                  (.leaf ⟨624, 2493, 2494⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨624, 2493, 2494⟩)
                  (.leaf ⟨624, 2493, 2494⟩)
                )
                (.branch 1
                  (.leaf ⟨624, 2493, 2494⟩)
                  (.leaf ⟨625, 2497, 2498⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨625, 2497, 2498⟩)
                  (.leaf ⟨625, 2497, 2498⟩)
                )
                (.branch 1
                  (.leaf ⟨625, 2497, 2498⟩)
                  (.leaf ⟨625, 2497, 2498⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨626, 2501, 2502⟩)
                  (.leaf ⟨626, 2501, 2502⟩)
                )
                (.branch 1
                  (.leaf ⟨626, 2501, 2502⟩)
                  (.leaf ⟨626, 2501, 2502⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨626, 2501, 2502⟩)
                  (.leaf ⟨627, 2505, 2506⟩)
                )
                (.branch 1
                  (.leaf ⟨627, 2505, 2506⟩)
                  (.leaf ⟨627, 2505, 2506⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨627, 2505, 2506⟩)
                  (.leaf ⟨627, 2505, 2506⟩)
                )
                (.branch 1
                  (.leaf ⟨628, 2509, 2510⟩)
                  (.leaf ⟨628, 2509, 2510⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨628, 2509, 2510⟩)
                  (.leaf ⟨628, 2509, 2510⟩)
                )
                (.branch 1
                  (.leaf ⟨628, 2509, 2510⟩)
                  (.leaf ⟨629, 2513, 2514⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨629, 2513, 2514⟩)
                  (.leaf ⟨629, 2513, 2514⟩)
                )
                (.branch 1
                  (.leaf ⟨629, 2513, 2514⟩)
                  (.leaf ⟨629, 2513, 2514⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨630, 2517, 2518⟩)
                  (.leaf ⟨630, 2517, 2518⟩)
                )
                (.branch 1
                  (.leaf ⟨630, 2517, 2518⟩)
                  (.leaf ⟨630, 2517, 2518⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨630, 2517, 2518⟩)
                  (.leaf ⟨631, 2521, 2522⟩)
                )
                (.branch 1
                  (.leaf ⟨631, 2521, 2522⟩)
                  (.leaf ⟨631, 2521, 2522⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨631, 2521, 2522⟩)
                  (.leaf ⟨631, 2521, 2522⟩)
                )
                (.branch 1
                  (.leaf ⟨632, 2525, 2526⟩)
                  (.leaf ⟨632, 2525, 2526⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨632, 2525, 2526⟩)
                  (.leaf ⟨632, 2525, 2526⟩)
                )
                (.branch 1
                  (.leaf ⟨632, 2525, 2526⟩)
                  (.leaf ⟨633, 2529, 2530⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨633, 2529, 2530⟩)
                  (.leaf ⟨633, 2529, 2530⟩)
                )
                (.branch 1
                  (.leaf ⟨633, 2529, 2530⟩)
                  (.leaf ⟨633, 2529, 2530⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨634, 2533, 2534⟩)
                  (.leaf ⟨634, 2533, 2534⟩)
                )
                (.branch 1
                  (.leaf ⟨634, 2533, 2534⟩)
                  (.leaf ⟨634, 2533, 2534⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨634, 2533, 2534⟩)
                  (.leaf ⟨635, 2537, 2538⟩)
                )
                (.branch 1
                  (.leaf ⟨635, 2537, 2538⟩)
                  (.leaf ⟨635, 2537, 2538⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨635, 2537, 2538⟩)
                  (.leaf ⟨635, 2537, 2538⟩)
                )
                (.branch 1
                  (.leaf ⟨636, 2307, 2308⟩)
                  (.leaf ⟨636, 2307, 2308⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨636, 2307, 2308⟩)
                  (.leaf ⟨636, 2307, 2308⟩)
                )
                (.branch 1
                  (.leaf ⟨636, 2307, 2308⟩)
                  (.leaf ⟨637, 2545, 2546⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨637, 2545, 2546⟩)
                  (.leaf ⟨637, 2545, 2546⟩)
                )
                (.branch 1
                  (.leaf ⟨637, 2545, 2546⟩)
                  (.leaf ⟨637, 2545, 2546⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨638, 2549, 2550⟩)
                  (.leaf ⟨638, 2549, 2550⟩)
                )
                (.branch 1
                  (.leaf ⟨638, 2549, 2550⟩)
                  (.leaf ⟨638, 2549, 2550⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨638, 2549, 2550⟩)
                  (.leaf ⟨639, 2553, 2554⟩)
                )
                (.branch 1
                  (.leaf ⟨639, 2553, 2554⟩)
                  (.leaf ⟨639, 2553, 2554⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨639, 2553, 2554⟩)
                  (.leaf ⟨639, 2553, 2554⟩)
                )
                (.branch 1
                  (.leaf ⟨640, 2557, 2558⟩)
                  (.leaf ⟨640, 2557, 2558⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨640, 2557, 2558⟩)
                  (.leaf ⟨640, 2557, 2558⟩)
                )
                (.branch 1
                  (.leaf ⟨640, 2557, 2558⟩)
                  (.leaf ⟨641, 2561, 2562⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨641, 2561, 2562⟩)
                  (.leaf ⟨641, 2561, 2562⟩)
                )
                (.branch 1
                  (.leaf ⟨641, 2561, 2562⟩)
                  (.leaf ⟨641, 2561, 2562⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨642, 2565, 2566⟩)
                  (.leaf ⟨642, 2565, 2566⟩)
                )
                (.branch 1
                  (.leaf ⟨642, 2565, 2566⟩)
                  (.leaf ⟨642, 2565, 2566⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨642, 2565, 2566⟩)
                  (.leaf ⟨643, 2569, 2570⟩)
                )
                (.branch 1
                  (.leaf ⟨643, 2569, 2570⟩)
                  (.leaf ⟨643, 2569, 2570⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨643, 2569, 2570⟩)
                  (.leaf ⟨643, 2569, 2570⟩)
                )
                (.branch 1
                  (.leaf ⟨644, 2573, 2574⟩)
                  (.leaf ⟨644, 2573, 2574⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨644, 2573, 2574⟩)
                  (.leaf ⟨644, 2573, 2574⟩)
                )
                (.branch 1
                  (.leaf ⟨644, 2573, 2574⟩)
                  (.leaf ⟨645, 2577, 2578⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨645, 2577, 2578⟩)
                  (.leaf ⟨645, 2577, 2578⟩)
                )
                (.branch 1
                  (.leaf ⟨645, 2577, 2578⟩)
                  (.leaf ⟨645, 2577, 2578⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨646, 2581, 2582⟩)
                  (.leaf ⟨646, 2581, 2582⟩)
                )
                (.branch 1
                  (.leaf ⟨646, 2581, 2582⟩)
                  (.leaf ⟨646, 2581, 2582⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨646, 2581, 2582⟩)
                  (.leaf ⟨647, 2585, 2586⟩)
                )
                (.branch 1
                  (.leaf ⟨647, 2585, 2586⟩)
                  (.leaf ⟨647, 2585, 2586⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨647, 2585, 2586⟩)
                  (.leaf ⟨647, 2585, 2586⟩)
                )
                (.branch 1
                  (.leaf ⟨648, 2589, 2590⟩)
                  (.leaf ⟨648, 2589, 2590⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨648, 2589, 2590⟩)
                  (.leaf ⟨648, 2589, 2590⟩)
                )
                (.branch 1
                  (.leaf ⟨648, 2589, 2590⟩)
                  (.leaf ⟨649, 427003, 427004⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨649, 427003, 427004⟩)
                  (.leaf ⟨649, 427003, 427004⟩)
                )
                (.branch 1
                  (.leaf ⟨649, 427003, 427004⟩)
                  (.leaf ⟨649, 427003, 427004⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨650, 2597, 2598⟩)
                  (.leaf ⟨650, 2597, 2598⟩)
                )
                (.branch 1
                  (.leaf ⟨650, 2597, 2598⟩)
                  (.leaf ⟨650, 2597, 2598⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨650, 2597, 2598⟩)
                  (.leaf ⟨651, 2601, 2602⟩)
                )
                (.branch 1
                  (.leaf ⟨651, 2601, 2602⟩)
                  (.leaf ⟨651, 2601, 2602⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨651, 2601, 2602⟩)
                  (.leaf ⟨651, 2601, 2602⟩)
                )
                (.branch 1
                  (.leaf ⟨652, 2605, 2606⟩)
                  (.leaf ⟨652, 2605, 2606⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨652, 2605, 2606⟩)
                  (.leaf ⟨652, 2605, 2606⟩)
                )
                (.branch 1
                  (.leaf ⟨652, 2605, 2606⟩)
                  (.leaf ⟨653, 2609, 2610⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨653, 2609, 2610⟩)
                  (.leaf ⟨653, 2609, 2610⟩)
                )
                (.branch 1
                  (.leaf ⟨653, 2609, 2610⟩)
                  (.leaf ⟨653, 2609, 2610⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨654, 2613, 2614⟩)
                  (.leaf ⟨654, 2613, 2614⟩)
                )
                (.branch 1
                  (.leaf ⟨654, 2613, 2614⟩)
                  (.leaf ⟨654, 2613, 2614⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨654, 2613, 2614⟩)
                  (.leaf ⟨655, 2617, 2618⟩)
                )
                (.branch 1
                  (.leaf ⟨655, 2617, 2618⟩)
                  (.leaf ⟨655, 2617, 2618⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨655, 2617, 2618⟩)
                  (.leaf ⟨655, 2617, 2618⟩)
                )
                (.branch 1
                  (.leaf ⟨656, 2621, 2622⟩)
                  (.leaf ⟨656, 2621, 2622⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨656, 2621, 2622⟩)
                  (.leaf ⟨656, 2621, 2622⟩)
                )
                (.branch 1
                  (.leaf ⟨656, 2621, 2622⟩)
                  (.leaf ⟨657, 2625, 2626⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨657, 2625, 2626⟩)
                  (.leaf ⟨657, 2625, 2626⟩)
                )
                (.branch 1
                  (.leaf ⟨657, 2625, 2626⟩)
                  (.leaf ⟨657, 2625, 2626⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨658, 2629, 2630⟩)
                  (.leaf ⟨658, 2629, 2630⟩)
                )
                (.branch 1
                  (.leaf ⟨658, 2629, 2630⟩)
                  (.leaf ⟨658, 2629, 2630⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨658, 2629, 2630⟩)
                  (.leaf ⟨659, 2633, 2634⟩)
                )
                (.branch 1
                  (.leaf ⟨659, 2633, 2634⟩)
                  (.leaf ⟨659, 2633, 2634⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨659, 2633, 2634⟩)
                  (.leaf ⟨659, 2633, 2634⟩)
                )
                (.branch 1
                  (.leaf ⟨660, 2637, 2638⟩)
                  (.leaf ⟨660, 2637, 2638⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨660, 2637, 2638⟩)
                  (.leaf ⟨660, 2637, 2638⟩)
                )
                (.branch 1
                  (.leaf ⟨660, 2637, 2638⟩)
                  (.leaf ⟨661, 2641, 2642⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨661, 2641, 2642⟩)
                  (.leaf ⟨661, 2641, 2642⟩)
                )
                (.branch 1
                  (.leaf ⟨661, 2641, 2642⟩)
                  (.leaf ⟨661, 2641, 2642⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨662, 2641, 2590⟩)
                  (.leaf ⟨662, 2641, 2590⟩)
                )
                (.branch 1
                  (.leaf ⟨662, 2641, 2590⟩)
                  (.leaf ⟨662, 2641, 2590⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨662, 2641, 2590⟩)
                  (.leaf ⟨663, 2651, 2652⟩)
                )
                (.branch 1
                  (.leaf ⟨663, 2651, 2652⟩)
                  (.leaf ⟨663, 2651, 2652⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨663, 2651, 2652⟩)
                  (.leaf ⟨663, 2651, 2652⟩)
                )
                (.branch 1
                  (.leaf ⟨664, 2655, 2656⟩)
                  (.leaf ⟨664, 2655, 2656⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨664, 2655, 2656⟩)
                  (.leaf ⟨664, 2655, 2656⟩)
                )
                (.branch 1
                  (.leaf ⟨664, 2655, 2656⟩)
                  (.leaf ⟨665, 2659, 2660⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨665, 2659, 2660⟩)
                  (.leaf ⟨665, 2659, 2660⟩)
                )
                (.branch 1
                  (.leaf ⟨665, 2659, 2660⟩)
                  (.leaf ⟨665, 2659, 2660⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨666, 2663, 2664⟩)
                  (.leaf ⟨666, 2663, 2664⟩)
                )
                (.branch 1
                  (.leaf ⟨666, 2663, 2664⟩)
                  (.leaf ⟨666, 2663, 2664⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨666, 2663, 2664⟩)
                  (.leaf ⟨667, 2667, 2668⟩)
                )
                (.branch 1
                  (.leaf ⟨667, 2667, 2668⟩)
                  (.leaf ⟨667, 2667, 2668⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨667, 2667, 2668⟩)
                  (.leaf ⟨667, 2667, 2668⟩)
                )
                (.branch 1
                  (.leaf ⟨668, 2671, 2672⟩)
                  (.leaf ⟨668, 2671, 2672⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨668, 2671, 2672⟩)
                  (.leaf ⟨668, 2671, 2672⟩)
                )
                (.branch 1
                  (.leaf ⟨668, 2671, 2672⟩)
                  (.leaf ⟨669, 2675, 2676⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨669, 2675, 2676⟩)
                  (.leaf ⟨669, 2675, 2676⟩)
                )
                (.branch 1
                  (.leaf ⟨669, 2675, 2676⟩)
                  (.leaf ⟨669, 2675, 2676⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨670, 2679, 2680⟩)
                  (.leaf ⟨670, 2679, 2680⟩)
                )
                (.branch 1
                  (.leaf ⟨670, 2679, 2680⟩)
                  (.leaf ⟨670, 2679, 2680⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨670, 2679, 2680⟩)
                  (.leaf ⟨671, 2683, 2684⟩)
                )
                (.branch 1
                  (.leaf ⟨671, 2683, 2684⟩)
                  (.leaf ⟨671, 2683, 2684⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_3072_512 : Balanced.RowTree Cell :=
  .branch 256 cache_3072_256 cache_3328_256
noncomputable def cache_3584_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨671, 2683, 2684⟩)
                  (.leaf ⟨671, 2683, 2684⟩)
                )
                (.branch 1
                  (.leaf ⟨672, 2687, 2688⟩)
                  (.leaf ⟨672, 2687, 2688⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨672, 2687, 2688⟩)
                  (.leaf ⟨672, 2687, 2688⟩)
                )
                (.branch 1
                  (.leaf ⟨672, 2687, 2688⟩)
                  (.leaf ⟨673, 2691, 2692⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨673, 2691, 2692⟩)
                  (.leaf ⟨673, 2691, 2692⟩)
                )
                (.branch 1
                  (.leaf ⟨673, 2691, 2692⟩)
                  (.leaf ⟨673, 2691, 2692⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨674, 2695, 2696⟩)
                  (.leaf ⟨674, 2695, 2696⟩)
                )
                (.branch 1
                  (.leaf ⟨674, 2695, 2696⟩)
                  (.leaf ⟨674, 2695, 2696⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨674, 2695, 2696⟩)
                  (.leaf ⟨0, 426179, 426180⟩)
                )
                (.branch 1
                  (.leaf ⟨0, 426179, 426180⟩)
                  (.leaf ⟨0, 426179, 426180⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨0, 426179, 426180⟩)
                  (.leaf ⟨0, 426179, 426180⟩)
                )
                (.branch 1
                  (.leaf ⟨675, 3, 4⟩)
                  (.leaf ⟨675, 3, 4⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨675, 3, 4⟩)
                  (.leaf ⟨675, 3, 4⟩)
                )
                (.branch 1
                  (.leaf ⟨675, 3, 4⟩)
                  (.leaf ⟨676, 2703, 2704⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨676, 2703, 2704⟩)
                  (.leaf ⟨676, 2703, 2704⟩)
                )
                (.branch 1
                  (.leaf ⟨676, 2703, 2704⟩)
                  (.leaf ⟨676, 2703, 2704⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨677, 2707, 2708⟩)
                  (.leaf ⟨677, 2707, 2708⟩)
                )
                (.branch 1
                  (.leaf ⟨677, 2707, 2708⟩)
                  (.leaf ⟨677, 2707, 2708⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨677, 2707, 2708⟩)
                  (.leaf ⟨678, 2711, 2712⟩)
                )
                (.branch 1
                  (.leaf ⟨678, 2711, 2712⟩)
                  (.leaf ⟨678, 2711, 2712⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨678, 2711, 2712⟩)
                  (.leaf ⟨678, 2711, 2712⟩)
                )
                (.branch 1
                  (.leaf ⟨679, 2715, 2716⟩)
                  (.leaf ⟨679, 2715, 2716⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨679, 2715, 2716⟩)
                  (.leaf ⟨679, 2715, 2716⟩)
                )
                (.branch 1
                  (.leaf ⟨679, 2715, 2716⟩)
                  (.leaf ⟨680, 2719, 2720⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨680, 2719, 2720⟩)
                  (.leaf ⟨680, 2719, 2720⟩)
                )
                (.branch 1
                  (.leaf ⟨680, 2719, 2720⟩)
                  (.leaf ⟨680, 2719, 2720⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨681, 2723, 2724⟩)
                  (.leaf ⟨681, 2723, 2724⟩)
                )
                (.branch 1
                  (.leaf ⟨681, 2723, 2724⟩)
                  (.leaf ⟨681, 2723, 2724⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨681, 2723, 2724⟩)
                  (.leaf ⟨682, 2727, 2728⟩)
                )
                (.branch 1
                  (.leaf ⟨682, 2727, 2728⟩)
                  (.leaf ⟨682, 2727, 2728⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨682, 2727, 2728⟩)
                  (.leaf ⟨682, 2727, 2728⟩)
                )
                (.branch 1
                  (.leaf ⟨683, 2731, 2732⟩)
                  (.leaf ⟨683, 2731, 2732⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨683, 2731, 2732⟩)
                  (.leaf ⟨683, 2731, 2732⟩)
                )
                (.branch 1
                  (.leaf ⟨683, 2731, 2732⟩)
                  (.leaf ⟨684, 2735, 2736⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨684, 2735, 2736⟩)
                  (.leaf ⟨684, 2735, 2736⟩)
                )
                (.branch 1
                  (.leaf ⟨684, 2735, 2736⟩)
                  (.leaf ⟨684, 2735, 2736⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨685, 2739, 2740⟩)
                  (.leaf ⟨685, 2739, 2740⟩)
                )
                (.branch 1
                  (.leaf ⟨685, 2739, 2740⟩)
                  (.leaf ⟨685, 2739, 2740⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨685, 2739, 2740⟩)
                  (.leaf ⟨686, 2743, 2744⟩)
                )
                (.branch 1
                  (.leaf ⟨686, 2743, 2744⟩)
                  (.leaf ⟨686, 2743, 2744⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨686, 2743, 2744⟩)
                  (.leaf ⟨686, 2743, 2744⟩)
                )
                (.branch 1
                  (.leaf ⟨687, 2747, 2748⟩)
                  (.leaf ⟨687, 2747, 2748⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨687, 2747, 2748⟩)
                  (.leaf ⟨687, 2747, 2748⟩)
                )
                (.branch 1
                  (.leaf ⟨687, 2747, 2748⟩)
                  (.leaf ⟨688, 427007, 427008⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨688, 427007, 427008⟩)
                  (.leaf ⟨688, 427007, 427008⟩)
                )
                (.branch 1
                  (.leaf ⟨688, 427007, 427008⟩)
                  (.leaf ⟨688, 427007, 427008⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨689, 2753, 2754⟩)
                  (.leaf ⟨689, 2753, 2754⟩)
                )
                (.branch 1
                  (.leaf ⟨689, 2753, 2754⟩)
                  (.leaf ⟨689, 2753, 2754⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨689, 2753, 2754⟩)
                  (.leaf ⟨690, 2757, 2758⟩)
                )
                (.branch 1
                  (.leaf ⟨690, 2757, 2758⟩)
                  (.leaf ⟨690, 2757, 2758⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨690, 2757, 2758⟩)
                  (.leaf ⟨690, 2757, 2758⟩)
                )
                (.branch 1
                  (.leaf ⟨691, 2761, 2762⟩)
                  (.leaf ⟨691, 2761, 2762⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨691, 2761, 2762⟩)
                  (.leaf ⟨691, 2761, 2762⟩)
                )
                (.branch 1
                  (.leaf ⟨691, 2761, 2762⟩)
                  (.leaf ⟨692, 2767, 2768⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨692, 2767, 2768⟩)
                  (.leaf ⟨692, 2767, 2768⟩)
                )
                (.branch 1
                  (.leaf ⟨692, 2767, 2768⟩)
                  (.leaf ⟨692, 2767, 2768⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨693, 427011, 427012⟩)
                  (.leaf ⟨693, 427011, 427012⟩)
                )
                (.branch 1
                  (.leaf ⟨693, 427011, 427012⟩)
                  (.leaf ⟨693, 427011, 427012⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨693, 427011, 427012⟩)
                  (.leaf ⟨694, 2773, 2774⟩)
                )
                (.branch 1
                  (.leaf ⟨694, 2773, 2774⟩)
                  (.leaf ⟨694, 2773, 2774⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨694, 2773, 2774⟩)
                  (.leaf ⟨694, 2773, 2774⟩)
                )
                (.branch 1
                  (.leaf ⟨695, 2777, 2778⟩)
                  (.leaf ⟨695, 2777, 2778⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨695, 2777, 2778⟩)
                  (.leaf ⟨695, 2777, 2778⟩)
                )
                (.branch 1
                  (.leaf ⟨695, 2777, 2778⟩)
                  (.leaf ⟨696, 2781, 2782⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨696, 2781, 2782⟩)
                  (.leaf ⟨696, 2781, 2782⟩)
                )
                (.branch 1
                  (.leaf ⟨696, 2781, 2782⟩)
                  (.leaf ⟨696, 2781, 2782⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨697, 2787, 2788⟩)
                  (.leaf ⟨697, 2787, 2788⟩)
                )
                (.branch 1
                  (.leaf ⟨697, 2787, 2788⟩)
                  (.leaf ⟨697, 2787, 2788⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨697, 2787, 2788⟩)
                  (.leaf ⟨698, 2787, 2768⟩)
                )
                (.branch 1
                  (.leaf ⟨698, 2787, 2768⟩)
                  (.leaf ⟨698, 2787, 2768⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨698, 2787, 2768⟩)
                  (.leaf ⟨698, 2787, 2768⟩)
                )
                (.branch 1
                  (.leaf ⟨699, 2795, 2796⟩)
                  (.leaf ⟨699, 2795, 2796⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨699, 2795, 2796⟩)
                  (.leaf ⟨699, 2795, 2796⟩)
                )
                (.branch 1
                  (.leaf ⟨699, 2795, 2796⟩)
                  (.leaf ⟨688, 427007, 427008⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨688, 427007, 427008⟩)
                  (.leaf ⟨688, 427007, 427008⟩)
                )
                (.branch 1
                  (.leaf ⟨688, 427007, 427008⟩)
                  (.leaf ⟨688, 427007, 427008⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨689, 2753, 2754⟩)
                  (.leaf ⟨689, 2753, 2754⟩)
                )
                (.branch 1
                  (.leaf ⟨689, 2753, 2754⟩)
                  (.leaf ⟨689, 2753, 2754⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨689, 2753, 2754⟩)
                  (.leaf ⟨690, 2757, 2758⟩)
                )
                (.branch 1
                  (.leaf ⟨690, 2757, 2758⟩)
                  (.leaf ⟨690, 2757, 2758⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨690, 2757, 2758⟩)
                  (.leaf ⟨690, 2757, 2758⟩)
                )
                (.branch 1
                  (.leaf ⟨691, 2761, 2762⟩)
                  (.leaf ⟨691, 2761, 2762⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨691, 2761, 2762⟩)
                  (.leaf ⟨691, 2761, 2762⟩)
                )
                (.branch 1
                  (.leaf ⟨691, 2761, 2762⟩)
                  (.leaf ⟨692, 2767, 2768⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨692, 2767, 2768⟩)
                  (.leaf ⟨692, 2767, 2768⟩)
                )
                (.branch 1
                  (.leaf ⟨692, 2767, 2768⟩)
                  (.leaf ⟨692, 2767, 2768⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨693, 427011, 427012⟩)
                  (.leaf ⟨693, 427011, 427012⟩)
                )
                (.branch 1
                  (.leaf ⟨693, 427011, 427012⟩)
                  (.leaf ⟨693, 427011, 427012⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨693, 427011, 427012⟩)
                  (.leaf ⟨694, 2773, 2774⟩)
                )
                (.branch 1
                  (.leaf ⟨694, 2773, 2774⟩)
                  (.leaf ⟨694, 2773, 2774⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨694, 2773, 2774⟩)
                  (.leaf ⟨694, 2773, 2774⟩)
                )
                (.branch 1
                  (.leaf ⟨695, 2777, 2778⟩)
                  (.leaf ⟨695, 2777, 2778⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨695, 2777, 2778⟩)
                  (.leaf ⟨695, 2777, 2778⟩)
                )
                (.branch 1
                  (.leaf ⟨695, 2777, 2778⟩)
                  (.leaf ⟨696, 2781, 2782⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨696, 2781, 2782⟩)
                  (.leaf ⟨696, 2781, 2782⟩)
                )
                (.branch 1
                  (.leaf ⟨696, 2781, 2782⟩)
                  (.leaf ⟨696, 2781, 2782⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨697, 2787, 2788⟩)
                  (.leaf ⟨697, 2787, 2788⟩)
                )
                (.branch 1
                  (.leaf ⟨697, 2787, 2788⟩)
                  (.leaf ⟨697, 2787, 2788⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨697, 2787, 2788⟩)
                  (.leaf ⟨698, 2787, 2768⟩)
                )
                (.branch 1
                  (.leaf ⟨698, 2787, 2768⟩)
                  (.leaf ⟨698, 2787, 2768⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨698, 2787, 2768⟩)
                  (.leaf ⟨698, 2787, 2768⟩)
                )
                (.branch 1
                  (.leaf ⟨699, 2795, 2796⟩)
                  (.leaf ⟨699, 2795, 2796⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨699, 2795, 2796⟩)
                  (.leaf ⟨699, 2795, 2796⟩)
                )
                (.branch 1
                  (.leaf ⟨699, 2795, 2796⟩)
                  (.leaf ⟨699, 2795, 2796⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨699, 2795, 2796⟩)
                  (.leaf ⟨699, 2795, 2796⟩)
                )
                (.branch 1
                  (.leaf ⟨699, 2795, 2796⟩)
                  (.leaf ⟨699, 2795, 2796⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨700, 2799, 2800⟩)
                  (.leaf ⟨700, 2799, 2800⟩)
                )
                (.branch 1
                  (.leaf ⟨700, 2799, 2800⟩)
                  (.leaf ⟨700, 2799, 2800⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨700, 2799, 2800⟩)
                  (.leaf ⟨688, 427007, 427008⟩)
                )
                (.branch 1
                  (.leaf ⟨688, 427007, 427008⟩)
                  (.leaf ⟨688, 427007, 427008⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨688, 427007, 427008⟩)
                  (.leaf ⟨688, 427007, 427008⟩)
                )
                (.branch 1
                  (.leaf ⟨689, 2753, 2754⟩)
                  (.leaf ⟨689, 2753, 2754⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨689, 2753, 2754⟩)
                  (.leaf ⟨689, 2753, 2754⟩)
                )
                (.branch 1
                  (.leaf ⟨689, 2753, 2754⟩)
                  (.leaf ⟨690, 2757, 2758⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨690, 2757, 2758⟩)
                  (.leaf ⟨690, 2757, 2758⟩)
                )
                (.branch 1
                  (.leaf ⟨690, 2757, 2758⟩)
                  (.leaf ⟨690, 2757, 2758⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨691, 2761, 2762⟩)
                  (.leaf ⟨691, 2761, 2762⟩)
                )
                (.branch 1
                  (.leaf ⟨691, 2761, 2762⟩)
                  (.leaf ⟨691, 2761, 2762⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨691, 2761, 2762⟩)
                  (.leaf ⟨692, 2767, 2768⟩)
                )
                (.branch 1
                  (.leaf ⟨692, 2767, 2768⟩)
                  (.leaf ⟨692, 2767, 2768⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨692, 2767, 2768⟩)
                  (.leaf ⟨692, 2767, 2768⟩)
                )
                (.branch 1
                  (.leaf ⟨693, 427011, 427012⟩)
                  (.leaf ⟨693, 427011, 427012⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨693, 427011, 427012⟩)
                  (.leaf ⟨693, 427011, 427012⟩)
                )
                (.branch 1
                  (.leaf ⟨693, 427011, 427012⟩)
                  (.leaf ⟨694, 2773, 2774⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨694, 2773, 2774⟩)
                  (.leaf ⟨694, 2773, 2774⟩)
                )
                (.branch 1
                  (.leaf ⟨694, 2773, 2774⟩)
                  (.leaf ⟨694, 2773, 2774⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨695, 2777, 2778⟩)
                  (.leaf ⟨695, 2777, 2778⟩)
                )
                (.branch 1
                  (.leaf ⟨695, 2777, 2778⟩)
                  (.leaf ⟨695, 2777, 2778⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_3840_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨695, 2777, 2778⟩)
                  (.leaf ⟨696, 2781, 2782⟩)
                )
                (.branch 1
                  (.leaf ⟨696, 2781, 2782⟩)
                  (.leaf ⟨696, 2781, 2782⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨696, 2781, 2782⟩)
                  (.leaf ⟨696, 2781, 2782⟩)
                )
                (.branch 1
                  (.leaf ⟨697, 2787, 2788⟩)
                  (.leaf ⟨697, 2787, 2788⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨697, 2787, 2788⟩)
                  (.leaf ⟨697, 2787, 2788⟩)
                )
                (.branch 1
                  (.leaf ⟨697, 2787, 2788⟩)
                  (.leaf ⟨698, 2787, 2768⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨698, 2787, 2768⟩)
                  (.leaf ⟨698, 2787, 2768⟩)
                )
                (.branch 1
                  (.leaf ⟨698, 2787, 2768⟩)
                  (.leaf ⟨698, 2787, 2768⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨699, 2795, 2796⟩)
                  (.leaf ⟨699, 2795, 2796⟩)
                )
                (.branch 1
                  (.leaf ⟨699, 2795, 2796⟩)
                  (.leaf ⟨699, 2795, 2796⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨699, 2795, 2796⟩)
                  (.leaf ⟨693, 427011, 427012⟩)
                )
                (.branch 1
                  (.leaf ⟨693, 427011, 427012⟩)
                  (.leaf ⟨693, 427011, 427012⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨693, 427011, 427012⟩)
                  (.leaf ⟨693, 427011, 427012⟩)
                )
                (.branch 1
                  (.leaf ⟨694, 2773, 2774⟩)
                  (.leaf ⟨694, 2773, 2774⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨694, 2773, 2774⟩)
                  (.leaf ⟨694, 2773, 2774⟩)
                )
                (.branch 1
                  (.leaf ⟨694, 2773, 2774⟩)
                  (.leaf ⟨695, 2777, 2778⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨695, 2777, 2778⟩)
                  (.leaf ⟨695, 2777, 2778⟩)
                )
                (.branch 1
                  (.leaf ⟨695, 2777, 2778⟩)
                  (.leaf ⟨695, 2777, 2778⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨696, 2781, 2782⟩)
                  (.leaf ⟨696, 2781, 2782⟩)
                )
                (.branch 1
                  (.leaf ⟨696, 2781, 2782⟩)
                  (.leaf ⟨696, 2781, 2782⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨696, 2781, 2782⟩)
                  (.leaf ⟨697, 2787, 2788⟩)
                )
                (.branch 1
                  (.leaf ⟨697, 2787, 2788⟩)
                  (.leaf ⟨697, 2787, 2788⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨697, 2787, 2788⟩)
                  (.leaf ⟨697, 2787, 2788⟩)
                )
                (.branch 1
                  (.leaf ⟨688, 427007, 427008⟩)
                  (.leaf ⟨688, 427007, 427008⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨688, 427007, 427008⟩)
                  (.leaf ⟨688, 427007, 427008⟩)
                )
                (.branch 1
                  (.leaf ⟨688, 427007, 427008⟩)
                  (.leaf ⟨689, 2753, 2754⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨689, 2753, 2754⟩)
                  (.leaf ⟨689, 2753, 2754⟩)
                )
                (.branch 1
                  (.leaf ⟨689, 2753, 2754⟩)
                  (.leaf ⟨689, 2753, 2754⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨690, 2757, 2758⟩)
                  (.leaf ⟨690, 2757, 2758⟩)
                )
                (.branch 1
                  (.leaf ⟨690, 2757, 2758⟩)
                  (.leaf ⟨690, 2757, 2758⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨690, 2757, 2758⟩)
                  (.leaf ⟨691, 2761, 2762⟩)
                )
                (.branch 1
                  (.leaf ⟨691, 2761, 2762⟩)
                  (.leaf ⟨691, 2761, 2762⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨691, 2761, 2762⟩)
                  (.leaf ⟨691, 2761, 2762⟩)
                )
                (.branch 1
                  (.leaf ⟨692, 2767, 2768⟩)
                  (.leaf ⟨692, 2767, 2768⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨692, 2767, 2768⟩)
                  (.leaf ⟨692, 2767, 2768⟩)
                )
                (.branch 1
                  (.leaf ⟨692, 2767, 2768⟩)
                  (.leaf ⟨701, 2767, 2788⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨701, 2767, 2788⟩)
                  (.leaf ⟨701, 2767, 2788⟩)
                )
                (.branch 1
                  (.leaf ⟨701, 2767, 2788⟩)
                  (.leaf ⟨701, 2767, 2788⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨702, 2807, 2808⟩)
                  (.leaf ⟨702, 2807, 2808⟩)
                )
                (.branch 1
                  (.leaf ⟨702, 2807, 2808⟩)
                  (.leaf ⟨702, 2807, 2808⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨702, 2807, 2808⟩)
                  (.leaf ⟨703, 2807, 2796⟩)
                )
                (.branch 1
                  (.leaf ⟨703, 2807, 2796⟩)
                  (.leaf ⟨703, 2807, 2796⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨703, 2807, 2796⟩)
                  (.leaf ⟨703, 2807, 2796⟩)
                )
                (.branch 1
                  (.leaf ⟨704, 2815, 2816⟩)
                  (.leaf ⟨704, 2815, 2816⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨704, 2815, 2816⟩)
                  (.leaf ⟨704, 2815, 2816⟩)
                )
                (.branch 1
                  (.leaf ⟨704, 2815, 2816⟩)
                  (.leaf ⟨705, 2815, 2800⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨705, 2815, 2800⟩)
                  (.leaf ⟨705, 2815, 2800⟩)
                )
                (.branch 1
                  (.leaf ⟨705, 2815, 2800⟩)
                  (.leaf ⟨705, 2815, 2800⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨706, 445935, 445936⟩)
                  (.leaf ⟨706, 445935, 445936⟩)
                )
                (.branch 1
                  (.leaf ⟨706, 445935, 445936⟩)
                  (.leaf ⟨706, 445935, 445936⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨706, 445935, 445936⟩)
                  (.leaf ⟨707, 427019, 427020⟩)
                )
                (.branch 1
                  (.leaf ⟨707, 427019, 427020⟩)
                  (.leaf ⟨707, 427019, 427020⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨707, 427019, 427020⟩)
                  (.leaf ⟨707, 427019, 427020⟩)
                )
                (.branch 1
                  (.leaf ⟨708, 2831, 2832⟩)
                  (.leaf ⟨708, 2831, 2832⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨708, 2831, 2832⟩)
                  (.leaf ⟨708, 2831, 2832⟩)
                )
                (.branch 1
                  (.leaf ⟨708, 2831, 2832⟩)
                  (.leaf ⟨709, 2835, 2836⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨709, 2835, 2836⟩)
                  (.leaf ⟨709, 2835, 2836⟩)
                )
                (.branch 1
                  (.leaf ⟨709, 2835, 2836⟩)
                  (.leaf ⟨709, 2835, 2836⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨710, 2839, 2840⟩)
                  (.leaf ⟨710, 2839, 2840⟩)
                )
                (.branch 1
                  (.leaf ⟨710, 2839, 2840⟩)
                  (.leaf ⟨710, 2839, 2840⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨710, 2839, 2840⟩)
                  (.leaf ⟨711, 2843, 2844⟩)
                )
                (.branch 1
                  (.leaf ⟨711, 2843, 2844⟩)
                  (.leaf ⟨711, 2843, 2844⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨711, 2843, 2844⟩)
                  (.leaf ⟨711, 2843, 2844⟩)
                )
                (.branch 1
                  (.leaf ⟨712, 2847, 2848⟩)
                  (.leaf ⟨712, 2847, 2848⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨712, 2847, 2848⟩)
                  (.leaf ⟨712, 2847, 2848⟩)
                )
                (.branch 1
                  (.leaf ⟨712, 2847, 2848⟩)
                  (.leaf ⟨713, 2851, 2852⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨713, 2851, 2852⟩)
                  (.leaf ⟨713, 2851, 2852⟩)
                )
                (.branch 1
                  (.leaf ⟨713, 2851, 2852⟩)
                  (.leaf ⟨713, 2851, 2852⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨714, 2855, 2856⟩)
                  (.leaf ⟨714, 2855, 2856⟩)
                )
                (.branch 1
                  (.leaf ⟨714, 2855, 2856⟩)
                  (.leaf ⟨714, 2855, 2856⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨714, 2855, 2856⟩)
                  (.leaf ⟨715, 2859, 2860⟩)
                )
                (.branch 1
                  (.leaf ⟨715, 2859, 2860⟩)
                  (.leaf ⟨715, 2859, 2860⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨715, 2859, 2860⟩)
                  (.leaf ⟨715, 2859, 2860⟩)
                )
                (.branch 1
                  (.leaf ⟨716, 2863, 2864⟩)
                  (.leaf ⟨716, 2863, 2864⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨716, 2863, 2864⟩)
                  (.leaf ⟨716, 2863, 2864⟩)
                )
                (.branch 1
                  (.leaf ⟨716, 2863, 2864⟩)
                  (.leaf ⟨717, 2867, 2868⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨717, 2867, 2868⟩)
                  (.leaf ⟨717, 2867, 2868⟩)
                )
                (.branch 1
                  (.leaf ⟨717, 2867, 2868⟩)
                  (.leaf ⟨717, 2867, 2868⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨718, 2871, 2872⟩)
                  (.leaf ⟨718, 2871, 2872⟩)
                )
                (.branch 1
                  (.leaf ⟨718, 2871, 2872⟩)
                  (.leaf ⟨718, 2871, 2872⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨718, 2871, 2872⟩)
                  (.leaf ⟨719, 2875, 2876⟩)
                )
                (.branch 1
                  (.leaf ⟨719, 2875, 2876⟩)
                  (.leaf ⟨719, 2875, 2876⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨719, 2875, 2876⟩)
                  (.leaf ⟨719, 2875, 2876⟩)
                )
                (.branch 1
                  (.leaf ⟨720, 2879, 2880⟩)
                  (.leaf ⟨720, 2879, 2880⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨720, 2879, 2880⟩)
                  (.leaf ⟨720, 2879, 2880⟩)
                )
                (.branch 1
                  (.leaf ⟨720, 2879, 2880⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨721, 427023, 427024⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
                (.branch 1
                  (.leaf ⟨721, 427023, 427024⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨722, 2885, 2886⟩)
                )
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨722, 2885, 2886⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
                (.branch 1
                  (.leaf ⟨723, 2889, 2890⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨723, 2889, 2890⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨724, 2893, 2894⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨724, 2893, 2894⟩)
                )
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨725, 2897, 2898⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
                (.branch 1
                  (.leaf ⟨725, 2897, 2898⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨726, 2901, 2902⟩)
                )
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨726, 2901, 2902⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
                (.branch 1
                  (.leaf ⟨727, 2905, 2906⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨727, 2905, 2906⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨728, 2909, 2910⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨728, 2909, 2910⟩)
                )
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨729, 2913, 2914⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
                (.branch 1
                  (.leaf ⟨729, 2913, 2914⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨730, 2917, 2918⟩)
                )
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨730, 2917, 2918⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
                (.branch 1
                  (.leaf ⟨731, 2921, 2922⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨731, 2921, 2922⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨732, 2925, 2926⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨732, 2925, 2926⟩)
                )
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨733, 427039, 427039⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨733, 427039, 427039⟩)
                  (.leaf ⟨733, 427039, 427039⟩)
                )
                (.branch 1
                  (.leaf ⟨733, 427039, 427039⟩)
                  (.leaf ⟨733, 427039, 427039⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨734, 2935, 2936⟩)
                  (.leaf ⟨734, 2935, 2936⟩)
                )
                (.branch 1
                  (.leaf ⟨734, 2935, 2936⟩)
                  (.leaf ⟨734, 2935, 2936⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨734, 2935, 2936⟩)
                  (.leaf ⟨735, 427036, 427036⟩)
                )
                (.branch 1
                  (.leaf ⟨735, 427036, 427036⟩)
                  (.leaf ⟨735, 427036, 427036⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨735, 427036, 427036⟩)
                  (.leaf ⟨735, 427036, 427036⟩)
                )
                (.branch 1
                  (.leaf ⟨736, 2943, 2944⟩)
                  (.leaf ⟨736, 2943, 2944⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨736, 2943, 2944⟩)
                  (.leaf ⟨736, 2943, 2944⟩)
                )
                (.branch 1
                  (.leaf ⟨736, 2943, 2944⟩)
                  (.leaf ⟨737, 427031, 427031⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨737, 427031, 427031⟩)
                  (.leaf ⟨737, 427031, 427031⟩)
                )
                (.branch 1
                  (.leaf ⟨737, 427031, 427031⟩)
                  (.leaf ⟨737, 427031, 427031⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_3584_512 : Balanced.RowTree Cell :=
  .branch 256 cache_3584_256 cache_3840_256
noncomputable def cache_3072_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_3072_512 cache_3584_512
noncomputable def cache_2048_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_2048_1024 cache_3072_1024
noncomputable def cache_0_4096 : Balanced.RowTree Cell :=
  .branch 2048 cache_0_2048 cache_2048_2048
noncomputable def cache_4096_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨738, 2951, 2952⟩)
                  (.leaf ⟨738, 2951, 2952⟩)
                )
                (.branch 1
                  (.leaf ⟨738, 2951, 2952⟩)
                  (.leaf ⟨738, 2951, 2952⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨738, 2951, 2952⟩)
                  (.leaf ⟨739, 2955, 2956⟩)
                )
                (.branch 1
                  (.leaf ⟨739, 2955, 2956⟩)
                  (.leaf ⟨739, 2955, 2956⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨739, 2955, 2956⟩)
                  (.leaf ⟨739, 2955, 2956⟩)
                )
                (.branch 1
                  (.leaf ⟨740, 2959, 2960⟩)
                  (.leaf ⟨740, 2959, 2960⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨740, 2959, 2960⟩)
                  (.leaf ⟨740, 2959, 2960⟩)
                )
                (.branch 1
                  (.leaf ⟨740, 2959, 2960⟩)
                  (.leaf ⟨741, 2963, 2964⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨741, 2963, 2964⟩)
                  (.leaf ⟨741, 2963, 2964⟩)
                )
                (.branch 1
                  (.leaf ⟨741, 2963, 2964⟩)
                  (.leaf ⟨741, 2963, 2964⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨742, 2967, 2968⟩)
                  (.leaf ⟨742, 2967, 2968⟩)
                )
                (.branch 1
                  (.leaf ⟨742, 2967, 2968⟩)
                  (.leaf ⟨742, 2967, 2968⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨742, 2967, 2968⟩)
                  (.leaf ⟨743, 2971, 2972⟩)
                )
                (.branch 1
                  (.leaf ⟨743, 2971, 2972⟩)
                  (.leaf ⟨743, 2971, 2972⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨743, 2971, 2972⟩)
                  (.leaf ⟨743, 2971, 2972⟩)
                )
                (.branch 1
                  (.leaf ⟨744, 2975, 2976⟩)
                  (.leaf ⟨744, 2975, 2976⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨744, 2975, 2976⟩)
                  (.leaf ⟨744, 2975, 2976⟩)
                )
                (.branch 1
                  (.leaf ⟨744, 2975, 2976⟩)
                  (.leaf ⟨745, 2979, 2980⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨745, 2979, 2980⟩)
                  (.leaf ⟨745, 2979, 2980⟩)
                )
                (.branch 1
                  (.leaf ⟨745, 2979, 2980⟩)
                  (.leaf ⟨745, 2979, 2980⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨746, 2983, 2984⟩)
                )
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨746, 2983, 2984⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
                (.branch 1
                  (.leaf ⟨721, 427023, 427024⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨721, 427023, 427024⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨722, 2885, 2886⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨722, 2885, 2886⟩)
                )
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨723, 2889, 2890⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
                (.branch 1
                  (.leaf ⟨723, 2889, 2890⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨724, 2893, 2894⟩)
                )
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨724, 2893, 2894⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
                (.branch 1
                  (.leaf ⟨725, 2897, 2898⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨725, 2897, 2898⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨726, 2901, 2902⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨726, 2901, 2902⟩)
                )
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨727, 2905, 2906⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
                (.branch 1
                  (.leaf ⟨727, 2905, 2906⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨728, 2909, 2910⟩)
                )
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨728, 2909, 2910⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
                (.branch 1
                  (.leaf ⟨729, 2913, 2914⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨729, 2913, 2914⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨730, 2917, 2918⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨730, 2917, 2918⟩)
                )
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨731, 2921, 2922⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
                (.branch 1
                  (.leaf ⟨731, 2921, 2922⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨732, 2925, 2926⟩)
                )
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨732, 2925, 2926⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨733, 427039, 427039⟩)
                )
                (.branch 1
                  (.leaf ⟨733, 427039, 427039⟩)
                  (.leaf ⟨733, 427039, 427039⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨733, 427039, 427039⟩)
                  (.leaf ⟨733, 427039, 427039⟩)
                )
                (.branch 1
                  (.leaf ⟨734, 2935, 2936⟩)
                  (.leaf ⟨734, 2935, 2936⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨734, 2935, 2936⟩)
                  (.leaf ⟨734, 2935, 2936⟩)
                )
                (.branch 1
                  (.leaf ⟨734, 2935, 2936⟩)
                  (.leaf ⟨735, 427036, 427036⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨735, 427036, 427036⟩)
                  (.leaf ⟨735, 427036, 427036⟩)
                )
                (.branch 1
                  (.leaf ⟨735, 427036, 427036⟩)
                  (.leaf ⟨735, 427036, 427036⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨736, 2943, 2944⟩)
                  (.leaf ⟨736, 2943, 2944⟩)
                )
                (.branch 1
                  (.leaf ⟨736, 2943, 2944⟩)
                  (.leaf ⟨736, 2943, 2944⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨736, 2943, 2944⟩)
                  (.leaf ⟨737, 427031, 427031⟩)
                )
                (.branch 1
                  (.leaf ⟨737, 427031, 427031⟩)
                  (.leaf ⟨737, 427031, 427031⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨737, 427031, 427031⟩)
                  (.leaf ⟨737, 427031, 427031⟩)
                )
                (.branch 1
                  (.leaf ⟨738, 2951, 2952⟩)
                  (.leaf ⟨738, 2951, 2952⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨738, 2951, 2952⟩)
                  (.leaf ⟨738, 2951, 2952⟩)
                )
                (.branch 1
                  (.leaf ⟨738, 2951, 2952⟩)
                  (.leaf ⟨739, 2955, 2956⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨739, 2955, 2956⟩)
                  (.leaf ⟨739, 2955, 2956⟩)
                )
                (.branch 1
                  (.leaf ⟨739, 2955, 2956⟩)
                  (.leaf ⟨739, 2955, 2956⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨740, 2959, 2960⟩)
                  (.leaf ⟨740, 2959, 2960⟩)
                )
                (.branch 1
                  (.leaf ⟨740, 2959, 2960⟩)
                  (.leaf ⟨740, 2959, 2960⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨740, 2959, 2960⟩)
                  (.leaf ⟨741, 2963, 2964⟩)
                )
                (.branch 1
                  (.leaf ⟨741, 2963, 2964⟩)
                  (.leaf ⟨741, 2963, 2964⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨741, 2963, 2964⟩)
                  (.leaf ⟨741, 2963, 2964⟩)
                )
                (.branch 1
                  (.leaf ⟨742, 2967, 2968⟩)
                  (.leaf ⟨742, 2967, 2968⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨742, 2967, 2968⟩)
                  (.leaf ⟨742, 2967, 2968⟩)
                )
                (.branch 1
                  (.leaf ⟨742, 2967, 2968⟩)
                  (.leaf ⟨743, 2971, 2972⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨743, 2971, 2972⟩)
                  (.leaf ⟨743, 2971, 2972⟩)
                )
                (.branch 1
                  (.leaf ⟨743, 2971, 2972⟩)
                  (.leaf ⟨743, 2971, 2972⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨744, 2975, 2976⟩)
                  (.leaf ⟨744, 2975, 2976⟩)
                )
                (.branch 1
                  (.leaf ⟨744, 2975, 2976⟩)
                  (.leaf ⟨744, 2975, 2976⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨744, 2975, 2976⟩)
                  (.leaf ⟨745, 2979, 2980⟩)
                )
                (.branch 1
                  (.leaf ⟨745, 2979, 2980⟩)
                  (.leaf ⟨745, 2979, 2980⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨745, 2979, 2980⟩)
                  (.leaf ⟨745, 2979, 2980⟩)
                )
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨746, 2983, 2984⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨746, 2983, 2984⟩)
                )
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨721, 427023, 427024⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
                (.branch 1
                  (.leaf ⟨721, 427023, 427024⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨722, 2885, 2886⟩)
                )
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨722, 2885, 2886⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
                (.branch 1
                  (.leaf ⟨723, 2889, 2890⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨723, 2889, 2890⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨724, 2893, 2894⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨724, 2893, 2894⟩)
                )
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨725, 2897, 2898⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
                (.branch 1
                  (.leaf ⟨725, 2897, 2898⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨726, 2901, 2902⟩)
                )
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨726, 2901, 2902⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
                (.branch 1
                  (.leaf ⟨727, 2905, 2906⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨727, 2905, 2906⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨728, 2909, 2910⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨728, 2909, 2910⟩)
                )
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨729, 2913, 2914⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
                (.branch 1
                  (.leaf ⟨729, 2913, 2914⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨730, 2917, 2918⟩)
                )
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨730, 2917, 2918⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
                (.branch 1
                  (.leaf ⟨731, 2921, 2922⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨731, 2921, 2922⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨732, 2925, 2926⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨732, 2925, 2926⟩)
                )
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨733, 427039, 427039⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨733, 427039, 427039⟩)
                  (.leaf ⟨733, 427039, 427039⟩)
                )
                (.branch 1
                  (.leaf ⟨733, 427039, 427039⟩)
                  (.leaf ⟨733, 427039, 427039⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨734, 2935, 2936⟩)
                  (.leaf ⟨734, 2935, 2936⟩)
                )
                (.branch 1
                  (.leaf ⟨734, 2935, 2936⟩)
                  (.leaf ⟨734, 2935, 2936⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨734, 2935, 2936⟩)
                  (.leaf ⟨735, 427036, 427036⟩)
                )
                (.branch 1
                  (.leaf ⟨735, 427036, 427036⟩)
                  (.leaf ⟨735, 427036, 427036⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨735, 427036, 427036⟩)
                  (.leaf ⟨735, 427036, 427036⟩)
                )
                (.branch 1
                  (.leaf ⟨736, 2943, 2944⟩)
                  (.leaf ⟨736, 2943, 2944⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨736, 2943, 2944⟩)
                  (.leaf ⟨736, 2943, 2944⟩)
                )
                (.branch 1
                  (.leaf ⟨736, 2943, 2944⟩)
                  (.leaf ⟨737, 427031, 427031⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_4352_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨737, 427031, 427031⟩)
                  (.leaf ⟨737, 427031, 427031⟩)
                )
                (.branch 1
                  (.leaf ⟨737, 427031, 427031⟩)
                  (.leaf ⟨737, 427031, 427031⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨738, 2951, 2952⟩)
                  (.leaf ⟨738, 2951, 2952⟩)
                )
                (.branch 1
                  (.leaf ⟨738, 2951, 2952⟩)
                  (.leaf ⟨738, 2951, 2952⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨738, 2951, 2952⟩)
                  (.leaf ⟨739, 2955, 2956⟩)
                )
                (.branch 1
                  (.leaf ⟨739, 2955, 2956⟩)
                  (.leaf ⟨739, 2955, 2956⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨739, 2955, 2956⟩)
                  (.leaf ⟨739, 2955, 2956⟩)
                )
                (.branch 1
                  (.leaf ⟨740, 2959, 2960⟩)
                  (.leaf ⟨740, 2959, 2960⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨740, 2959, 2960⟩)
                  (.leaf ⟨740, 2959, 2960⟩)
                )
                (.branch 1
                  (.leaf ⟨740, 2959, 2960⟩)
                  (.leaf ⟨741, 2963, 2964⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨741, 2963, 2964⟩)
                  (.leaf ⟨741, 2963, 2964⟩)
                )
                (.branch 1
                  (.leaf ⟨741, 2963, 2964⟩)
                  (.leaf ⟨741, 2963, 2964⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨742, 2967, 2968⟩)
                  (.leaf ⟨742, 2967, 2968⟩)
                )
                (.branch 1
                  (.leaf ⟨742, 2967, 2968⟩)
                  (.leaf ⟨742, 2967, 2968⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨742, 2967, 2968⟩)
                  (.leaf ⟨743, 2971, 2972⟩)
                )
                (.branch 1
                  (.leaf ⟨743, 2971, 2972⟩)
                  (.leaf ⟨743, 2971, 2972⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨743, 2971, 2972⟩)
                  (.leaf ⟨743, 2971, 2972⟩)
                )
                (.branch 1
                  (.leaf ⟨744, 2975, 2976⟩)
                  (.leaf ⟨744, 2975, 2976⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨744, 2975, 2976⟩)
                  (.leaf ⟨744, 2975, 2976⟩)
                )
                (.branch 1
                  (.leaf ⟨744, 2975, 2976⟩)
                  (.leaf ⟨745, 2979, 2980⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨745, 2979, 2980⟩)
                  (.leaf ⟨745, 2979, 2980⟩)
                )
                (.branch 1
                  (.leaf ⟨745, 2979, 2980⟩)
                  (.leaf ⟨745, 2979, 2980⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨746, 2983, 2984⟩)
                )
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨746, 2983, 2984⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
                (.branch 1
                  (.leaf ⟨721, 427023, 427024⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨721, 427023, 427024⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨722, 2885, 2886⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨722, 2885, 2886⟩)
                )
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨723, 2889, 2890⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
                (.branch 1
                  (.leaf ⟨723, 2889, 2890⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨724, 2893, 2894⟩)
                )
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨724, 2893, 2894⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
                (.branch 1
                  (.leaf ⟨725, 2897, 2898⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨725, 2897, 2898⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨726, 2901, 2902⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨726, 2901, 2902⟩)
                )
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨727, 2905, 2906⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
                (.branch 1
                  (.leaf ⟨727, 2905, 2906⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨728, 2909, 2910⟩)
                )
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨728, 2909, 2910⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
                (.branch 1
                  (.leaf ⟨729, 2913, 2914⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨729, 2913, 2914⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨730, 2917, 2918⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨730, 2917, 2918⟩)
                )
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨731, 2921, 2922⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
                (.branch 1
                  (.leaf ⟨731, 2921, 2922⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨732, 2925, 2926⟩)
                )
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨732, 2925, 2926⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨733, 427039, 427039⟩)
                )
                (.branch 1
                  (.leaf ⟨733, 427039, 427039⟩)
                  (.leaf ⟨733, 427039, 427039⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨733, 427039, 427039⟩)
                  (.leaf ⟨733, 427039, 427039⟩)
                )
                (.branch 1
                  (.leaf ⟨734, 2935, 2936⟩)
                  (.leaf ⟨734, 2935, 2936⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨734, 2935, 2936⟩)
                  (.leaf ⟨734, 2935, 2936⟩)
                )
                (.branch 1
                  (.leaf ⟨734, 2935, 2936⟩)
                  (.leaf ⟨735, 427036, 427036⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨735, 427036, 427036⟩)
                  (.leaf ⟨735, 427036, 427036⟩)
                )
                (.branch 1
                  (.leaf ⟨735, 427036, 427036⟩)
                  (.leaf ⟨735, 427036, 427036⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨736, 2943, 2944⟩)
                  (.leaf ⟨736, 2943, 2944⟩)
                )
                (.branch 1
                  (.leaf ⟨736, 2943, 2944⟩)
                  (.leaf ⟨736, 2943, 2944⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨736, 2943, 2944⟩)
                  (.leaf ⟨737, 427031, 427031⟩)
                )
                (.branch 1
                  (.leaf ⟨737, 427031, 427031⟩)
                  (.leaf ⟨737, 427031, 427031⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨737, 427031, 427031⟩)
                  (.leaf ⟨737, 427031, 427031⟩)
                )
                (.branch 1
                  (.leaf ⟨738, 2951, 2952⟩)
                  (.leaf ⟨738, 2951, 2952⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨738, 2951, 2952⟩)
                  (.leaf ⟨738, 2951, 2952⟩)
                )
                (.branch 1
                  (.leaf ⟨738, 2951, 2952⟩)
                  (.leaf ⟨739, 2955, 2956⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨739, 2955, 2956⟩)
                  (.leaf ⟨739, 2955, 2956⟩)
                )
                (.branch 1
                  (.leaf ⟨739, 2955, 2956⟩)
                  (.leaf ⟨739, 2955, 2956⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨740, 2959, 2960⟩)
                  (.leaf ⟨740, 2959, 2960⟩)
                )
                (.branch 1
                  (.leaf ⟨740, 2959, 2960⟩)
                  (.leaf ⟨740, 2959, 2960⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨740, 2959, 2960⟩)
                  (.leaf ⟨741, 2963, 2964⟩)
                )
                (.branch 1
                  (.leaf ⟨741, 2963, 2964⟩)
                  (.leaf ⟨741, 2963, 2964⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨741, 2963, 2964⟩)
                  (.leaf ⟨741, 2963, 2964⟩)
                )
                (.branch 1
                  (.leaf ⟨742, 2967, 2968⟩)
                  (.leaf ⟨742, 2967, 2968⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨742, 2967, 2968⟩)
                  (.leaf ⟨742, 2967, 2968⟩)
                )
                (.branch 1
                  (.leaf ⟨742, 2967, 2968⟩)
                  (.leaf ⟨743, 2971, 2972⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨743, 2971, 2972⟩)
                  (.leaf ⟨743, 2971, 2972⟩)
                )
                (.branch 1
                  (.leaf ⟨743, 2971, 2972⟩)
                  (.leaf ⟨743, 2971, 2972⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨744, 2975, 2976⟩)
                  (.leaf ⟨744, 2975, 2976⟩)
                )
                (.branch 1
                  (.leaf ⟨744, 2975, 2976⟩)
                  (.leaf ⟨744, 2975, 2976⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨744, 2975, 2976⟩)
                  (.leaf ⟨745, 2979, 2980⟩)
                )
                (.branch 1
                  (.leaf ⟨745, 2979, 2980⟩)
                  (.leaf ⟨745, 2979, 2980⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨745, 2979, 2980⟩)
                  (.leaf ⟨745, 2979, 2980⟩)
                )
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨746, 2983, 2984⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨746, 2983, 2984⟩)
                )
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨721, 427023, 427024⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
                (.branch 1
                  (.leaf ⟨721, 427023, 427024⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨722, 2885, 2886⟩)
                )
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨722, 2885, 2886⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
                (.branch 1
                  (.leaf ⟨723, 2889, 2890⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨723, 2889, 2890⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨724, 2893, 2894⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨724, 2893, 2894⟩)
                )
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨725, 2897, 2898⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
                (.branch 1
                  (.leaf ⟨725, 2897, 2898⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨726, 2901, 2902⟩)
                )
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨726, 2901, 2902⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
                (.branch 1
                  (.leaf ⟨727, 2905, 2906⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨727, 2905, 2906⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨728, 2909, 2910⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨728, 2909, 2910⟩)
                )
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨729, 2913, 2914⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
                (.branch 1
                  (.leaf ⟨729, 2913, 2914⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨730, 2917, 2918⟩)
                )
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨730, 2917, 2918⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
                (.branch 1
                  (.leaf ⟨731, 2921, 2922⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨731, 2921, 2922⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨732, 2925, 2926⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨732, 2925, 2926⟩)
                )
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨733, 427039, 427039⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨733, 427039, 427039⟩)
                  (.leaf ⟨733, 427039, 427039⟩)
                )
                (.branch 1
                  (.leaf ⟨733, 427039, 427039⟩)
                  (.leaf ⟨733, 427039, 427039⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨734, 2935, 2936⟩)
                  (.leaf ⟨734, 2935, 2936⟩)
                )
                (.branch 1
                  (.leaf ⟨734, 2935, 2936⟩)
                  (.leaf ⟨734, 2935, 2936⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨734, 2935, 2936⟩)
                  (.leaf ⟨735, 427036, 427036⟩)
                )
                (.branch 1
                  (.leaf ⟨735, 427036, 427036⟩)
                  (.leaf ⟨735, 427036, 427036⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨735, 427036, 427036⟩)
                  (.leaf ⟨735, 427036, 427036⟩)
                )
                (.branch 1
                  (.leaf ⟨736, 2943, 2944⟩)
                  (.leaf ⟨736, 2943, 2944⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_4096_512 : Balanced.RowTree Cell :=
  .branch 256 cache_4096_256 cache_4352_256
noncomputable def cache_4608_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨736, 2943, 2944⟩)
                  (.leaf ⟨736, 2943, 2944⟩)
                )
                (.branch 1
                  (.leaf ⟨736, 2943, 2944⟩)
                  (.leaf ⟨737, 427031, 427031⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨737, 427031, 427031⟩)
                  (.leaf ⟨737, 427031, 427031⟩)
                )
                (.branch 1
                  (.leaf ⟨737, 427031, 427031⟩)
                  (.leaf ⟨737, 427031, 427031⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨738, 2951, 2952⟩)
                  (.leaf ⟨738, 2951, 2952⟩)
                )
                (.branch 1
                  (.leaf ⟨738, 2951, 2952⟩)
                  (.leaf ⟨738, 2951, 2952⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨738, 2951, 2952⟩)
                  (.leaf ⟨739, 2955, 2956⟩)
                )
                (.branch 1
                  (.leaf ⟨739, 2955, 2956⟩)
                  (.leaf ⟨739, 2955, 2956⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨739, 2955, 2956⟩)
                  (.leaf ⟨739, 2955, 2956⟩)
                )
                (.branch 1
                  (.leaf ⟨740, 2959, 2960⟩)
                  (.leaf ⟨740, 2959, 2960⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨740, 2959, 2960⟩)
                  (.leaf ⟨740, 2959, 2960⟩)
                )
                (.branch 1
                  (.leaf ⟨740, 2959, 2960⟩)
                  (.leaf ⟨741, 2963, 2964⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨741, 2963, 2964⟩)
                  (.leaf ⟨741, 2963, 2964⟩)
                )
                (.branch 1
                  (.leaf ⟨741, 2963, 2964⟩)
                  (.leaf ⟨741, 2963, 2964⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨742, 2967, 2968⟩)
                  (.leaf ⟨742, 2967, 2968⟩)
                )
                (.branch 1
                  (.leaf ⟨742, 2967, 2968⟩)
                  (.leaf ⟨742, 2967, 2968⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨742, 2967, 2968⟩)
                  (.leaf ⟨743, 2971, 2972⟩)
                )
                (.branch 1
                  (.leaf ⟨743, 2971, 2972⟩)
                  (.leaf ⟨743, 2971, 2972⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨743, 2971, 2972⟩)
                  (.leaf ⟨743, 2971, 2972⟩)
                )
                (.branch 1
                  (.leaf ⟨744, 2975, 2976⟩)
                  (.leaf ⟨744, 2975, 2976⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨744, 2975, 2976⟩)
                  (.leaf ⟨744, 2975, 2976⟩)
                )
                (.branch 1
                  (.leaf ⟨744, 2975, 2976⟩)
                  (.leaf ⟨745, 2979, 2980⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨745, 2979, 2980⟩)
                  (.leaf ⟨745, 2979, 2980⟩)
                )
                (.branch 1
                  (.leaf ⟨745, 2979, 2980⟩)
                  (.leaf ⟨745, 2979, 2980⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨746, 2983, 2984⟩)
                )
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨746, 2983, 2984⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨746, 2983, 2984⟩)
                )
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨746, 2983, 2984⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨746, 2983, 2984⟩)
                )
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨746, 2983, 2984⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨746, 2983, 2984⟩)
                )
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨746, 2983, 2984⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨746, 2983, 2984⟩)
                )
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨746, 2983, 2984⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨746, 2983, 2984⟩)
                )
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨746, 2983, 2984⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨5, 426183, 426184⟩)
                )
                (.branch 1
                  (.leaf ⟨5, 426183, 426184⟩)
                  (.leaf ⟨5, 426183, 426184⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨5, 426183, 426184⟩)
                  (.leaf ⟨5, 426183, 426184⟩)
                )
                (.branch 1
                  (.leaf ⟨747, 23, 24⟩)
                  (.leaf ⟨747, 23, 24⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨747, 23, 24⟩)
                  (.leaf ⟨747, 23, 24⟩)
                )
                (.branch 1
                  (.leaf ⟨747, 23, 24⟩)
                  (.leaf ⟨748, 2991, 2992⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨748, 2991, 2992⟩)
                  (.leaf ⟨748, 2991, 2992⟩)
                )
                (.branch 1
                  (.leaf ⟨748, 2991, 2992⟩)
                  (.leaf ⟨748, 2991, 2992⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨749, 2995, 2996⟩)
                  (.leaf ⟨749, 2995, 2996⟩)
                )
                (.branch 1
                  (.leaf ⟨749, 2995, 2996⟩)
                  (.leaf ⟨749, 2995, 2996⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨749, 2995, 2996⟩)
                  (.leaf ⟨750, 2999, 3000⟩)
                )
                (.branch 1
                  (.leaf ⟨750, 2999, 3000⟩)
                  (.leaf ⟨750, 2999, 3000⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨750, 2999, 3000⟩)
                  (.leaf ⟨750, 2999, 3000⟩)
                )
                (.branch 1
                  (.leaf ⟨751, 3003, 3004⟩)
                  (.leaf ⟨751, 3003, 3004⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨751, 3003, 3004⟩)
                  (.leaf ⟨751, 3003, 3004⟩)
                )
                (.branch 1
                  (.leaf ⟨751, 3003, 3004⟩)
                  (.leaf ⟨752, 3007, 3008⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨752, 3007, 3008⟩)
                  (.leaf ⟨752, 3007, 3008⟩)
                )
                (.branch 1
                  (.leaf ⟨752, 3007, 3008⟩)
                  (.leaf ⟨752, 3007, 3008⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨753, 3011, 3012⟩)
                  (.leaf ⟨753, 3011, 3012⟩)
                )
                (.branch 1
                  (.leaf ⟨753, 3011, 3012⟩)
                  (.leaf ⟨753, 3011, 3012⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨753, 3011, 3012⟩)
                  (.leaf ⟨754, 3015, 3016⟩)
                )
                (.branch 1
                  (.leaf ⟨754, 3015, 3016⟩)
                  (.leaf ⟨754, 3015, 3016⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨754, 3015, 3016⟩)
                  (.leaf ⟨754, 3015, 3016⟩)
                )
                (.branch 1
                  (.leaf ⟨755, 3019, 3020⟩)
                  (.leaf ⟨755, 3019, 3020⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨755, 3019, 3020⟩)
                  (.leaf ⟨755, 3019, 3020⟩)
                )
                (.branch 1
                  (.leaf ⟨755, 3019, 3020⟩)
                  (.leaf ⟨756, 3023, 3024⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨756, 3023, 3024⟩)
                  (.leaf ⟨756, 3023, 3024⟩)
                )
                (.branch 1
                  (.leaf ⟨756, 3023, 3024⟩)
                  (.leaf ⟨756, 3023, 3024⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨757, 3027, 3028⟩)
                  (.leaf ⟨757, 3027, 3028⟩)
                )
                (.branch 1
                  (.leaf ⟨757, 3027, 3028⟩)
                  (.leaf ⟨757, 3027, 3028⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨757, 3027, 3028⟩)
                  (.leaf ⟨758, 3031, 3032⟩)
                )
                (.branch 1
                  (.leaf ⟨758, 3031, 3032⟩)
                  (.leaf ⟨758, 3031, 3032⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨758, 3031, 3032⟩)
                  (.leaf ⟨758, 3031, 3032⟩)
                )
                (.branch 1
                  (.leaf ⟨759, 3035, 3036⟩)
                  (.leaf ⟨759, 3035, 3036⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨759, 3035, 3036⟩)
                  (.leaf ⟨759, 3035, 3036⟩)
                )
                (.branch 1
                  (.leaf ⟨759, 3035, 3036⟩)
                  (.leaf ⟨760, 427027, 427028⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨760, 427027, 427028⟩)
                  (.leaf ⟨760, 427027, 427028⟩)
                )
                (.branch 1
                  (.leaf ⟨760, 427027, 427028⟩)
                  (.leaf ⟨760, 427027, 427028⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨761, 3041, 3042⟩)
                  (.leaf ⟨761, 3041, 3042⟩)
                )
                (.branch 1
                  (.leaf ⟨761, 3041, 3042⟩)
                  (.leaf ⟨761, 3041, 3042⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨761, 3041, 3042⟩)
                  (.leaf ⟨762, 3045, 3046⟩)
                )
                (.branch 1
                  (.leaf ⟨762, 3045, 3046⟩)
                  (.leaf ⟨762, 3045, 3046⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨762, 3045, 3046⟩)
                  (.leaf ⟨762, 3045, 3046⟩)
                )
                (.branch 1
                  (.leaf ⟨763, 3049, 3050⟩)
                  (.leaf ⟨763, 3049, 3050⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨763, 3049, 3050⟩)
                  (.leaf ⟨763, 3049, 3050⟩)
                )
                (.branch 1
                  (.leaf ⟨763, 3049, 3050⟩)
                  (.leaf ⟨764, 3053, 3054⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨764, 3053, 3054⟩)
                  (.leaf ⟨764, 3053, 3054⟩)
                )
                (.branch 1
                  (.leaf ⟨764, 3053, 3054⟩)
                  (.leaf ⟨764, 3053, 3054⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨765, 3057, 3058⟩)
                  (.leaf ⟨765, 3057, 3058⟩)
                )
                (.branch 1
                  (.leaf ⟨765, 3057, 3058⟩)
                  (.leaf ⟨765, 3057, 3058⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨765, 3057, 3058⟩)
                  (.leaf ⟨766, 3061, 3062⟩)
                )
                (.branch 1
                  (.leaf ⟨766, 3061, 3062⟩)
                  (.leaf ⟨766, 3061, 3062⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨766, 3061, 3062⟩)
                  (.leaf ⟨766, 3061, 3062⟩)
                )
                (.branch 1
                  (.leaf ⟨767, 3065, 3066⟩)
                  (.leaf ⟨767, 3065, 3066⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨767, 3065, 3066⟩)
                  (.leaf ⟨767, 3065, 3066⟩)
                )
                (.branch 1
                  (.leaf ⟨767, 3065, 3066⟩)
                  (.leaf ⟨768, 3069, 3070⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨768, 3069, 3070⟩)
                  (.leaf ⟨768, 3069, 3070⟩)
                )
                (.branch 1
                  (.leaf ⟨768, 3069, 3070⟩)
                  (.leaf ⟨768, 3069, 3070⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨769, 3073, 3074⟩)
                  (.leaf ⟨769, 3073, 3074⟩)
                )
                (.branch 1
                  (.leaf ⟨769, 3073, 3074⟩)
                  (.leaf ⟨769, 3073, 3074⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨769, 3073, 3074⟩)
                  (.leaf ⟨770, 3077, 3078⟩)
                )
                (.branch 1
                  (.leaf ⟨770, 3077, 3078⟩)
                  (.leaf ⟨770, 3077, 3078⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨770, 3077, 3078⟩)
                  (.leaf ⟨770, 3077, 3078⟩)
                )
                (.branch 1
                  (.leaf ⟨771, 3081, 3082⟩)
                  (.leaf ⟨771, 3081, 3082⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨771, 3081, 3082⟩)
                  (.leaf ⟨771, 3081, 3082⟩)
                )
                (.branch 1
                  (.leaf ⟨771, 3081, 3082⟩)
                  (.leaf ⟨772, 3085, 3086⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨772, 3085, 3086⟩)
                  (.leaf ⟨772, 3085, 3086⟩)
                )
                (.branch 1
                  (.leaf ⟨772, 3085, 3086⟩)
                  (.leaf ⟨772, 3085, 3086⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨773, 3091, 3092⟩)
                  (.leaf ⟨773, 3091, 3092⟩)
                )
                (.branch 1
                  (.leaf ⟨773, 3091, 3092⟩)
                  (.leaf ⟨773, 3091, 3092⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨773, 3091, 3092⟩)
                  (.leaf ⟨774, 427043, 427044⟩)
                )
                (.branch 1
                  (.leaf ⟨774, 427043, 427044⟩)
                  (.leaf ⟨774, 427043, 427044⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨774, 427043, 427044⟩)
                  (.leaf ⟨774, 427043, 427044⟩)
                )
                (.branch 1
                  (.leaf ⟨775, 3097, 3098⟩)
                  (.leaf ⟨775, 3097, 3098⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨775, 3097, 3098⟩)
                  (.leaf ⟨775, 3097, 3098⟩)
                )
                (.branch 1
                  (.leaf ⟨775, 3097, 3098⟩)
                  (.leaf ⟨776, 3101, 3102⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨776, 3101, 3102⟩)
                  (.leaf ⟨776, 3101, 3102⟩)
                )
                (.branch 1
                  (.leaf ⟨776, 3101, 3102⟩)
                  (.leaf ⟨776, 3101, 3102⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨777, 3105, 3106⟩)
                  (.leaf ⟨777, 3105, 3106⟩)
                )
                (.branch 1
                  (.leaf ⟨777, 3105, 3106⟩)
                  (.leaf ⟨777, 3105, 3106⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨777, 3105, 3106⟩)
                  (.leaf ⟨778, 3109, 3110⟩)
                )
                (.branch 1
                  (.leaf ⟨778, 3109, 3110⟩)
                  (.leaf ⟨778, 3109, 3110⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨778, 3109, 3110⟩)
                  (.leaf ⟨778, 3109, 3110⟩)
                )
                (.branch 1
                  (.leaf ⟨779, 3113, 3114⟩)
                  (.leaf ⟨779, 3113, 3114⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨779, 3113, 3114⟩)
                  (.leaf ⟨779, 3113, 3114⟩)
                )
                (.branch 1
                  (.leaf ⟨779, 3113, 3114⟩)
                  (.leaf ⟨780, 3117, 3118⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨780, 3117, 3118⟩)
                  (.leaf ⟨780, 3117, 3118⟩)
                )
                (.branch 1
                  (.leaf ⟨780, 3117, 3118⟩)
                  (.leaf ⟨780, 3117, 3118⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨781, 3121, 3122⟩)
                  (.leaf ⟨781, 3121, 3122⟩)
                )
                (.branch 1
                  (.leaf ⟨781, 3121, 3122⟩)
                  (.leaf ⟨781, 3121, 3122⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨781, 3121, 3122⟩)
                  (.leaf ⟨782, 3125, 3126⟩)
                )
                (.branch 1
                  (.leaf ⟨782, 3125, 3126⟩)
                  (.leaf ⟨782, 3125, 3126⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_4864_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨782, 3125, 3126⟩)
                  (.leaf ⟨782, 3125, 3126⟩)
                )
                (.branch 1
                  (.leaf ⟨783, 3129, 3130⟩)
                  (.leaf ⟨783, 3129, 3130⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨783, 3129, 3130⟩)
                  (.leaf ⟨783, 3129, 3130⟩)
                )
                (.branch 1
                  (.leaf ⟨783, 3129, 3130⟩)
                  (.leaf ⟨784, 3133, 3134⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨784, 3133, 3134⟩)
                  (.leaf ⟨784, 3133, 3134⟩)
                )
                (.branch 1
                  (.leaf ⟨784, 3133, 3134⟩)
                  (.leaf ⟨784, 3133, 3134⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨785, 3137, 3138⟩)
                  (.leaf ⟨785, 3137, 3138⟩)
                )
                (.branch 1
                  (.leaf ⟨785, 3137, 3138⟩)
                  (.leaf ⟨785, 3137, 3138⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨785, 3137, 3138⟩)
                  (.leaf ⟨786, 3141, 3142⟩)
                )
                (.branch 1
                  (.leaf ⟨786, 3141, 3142⟩)
                  (.leaf ⟨786, 3141, 3142⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨786, 3141, 3142⟩)
                  (.leaf ⟨786, 3141, 3142⟩)
                )
                (.branch 1
                  (.leaf ⟨787, 3147, 3148⟩)
                  (.leaf ⟨787, 3147, 3148⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨787, 3147, 3148⟩)
                  (.leaf ⟨787, 3147, 3148⟩)
                )
                (.branch 1
                  (.leaf ⟨787, 3147, 3148⟩)
                  (.leaf ⟨788, 3147, 3092⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨788, 3147, 3092⟩)
                  (.leaf ⟨788, 3147, 3092⟩)
                )
                (.branch 1
                  (.leaf ⟨788, 3147, 3092⟩)
                  (.leaf ⟨788, 3147, 3092⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨789, 3155, 3156⟩)
                  (.leaf ⟨789, 3155, 3156⟩)
                )
                (.branch 1
                  (.leaf ⟨789, 3155, 3156⟩)
                  (.leaf ⟨789, 3155, 3156⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨789, 3155, 3156⟩)
                  (.leaf ⟨760, 427027, 427028⟩)
                )
                (.branch 1
                  (.leaf ⟨760, 427027, 427028⟩)
                  (.leaf ⟨760, 427027, 427028⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨760, 427027, 427028⟩)
                  (.leaf ⟨760, 427027, 427028⟩)
                )
                (.branch 1
                  (.leaf ⟨761, 3041, 3042⟩)
                  (.leaf ⟨761, 3041, 3042⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨761, 3041, 3042⟩)
                  (.leaf ⟨761, 3041, 3042⟩)
                )
                (.branch 1
                  (.leaf ⟨761, 3041, 3042⟩)
                  (.leaf ⟨762, 3045, 3046⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨762, 3045, 3046⟩)
                  (.leaf ⟨762, 3045, 3046⟩)
                )
                (.branch 1
                  (.leaf ⟨762, 3045, 3046⟩)
                  (.leaf ⟨762, 3045, 3046⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨763, 3049, 3050⟩)
                  (.leaf ⟨763, 3049, 3050⟩)
                )
                (.branch 1
                  (.leaf ⟨763, 3049, 3050⟩)
                  (.leaf ⟨763, 3049, 3050⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨763, 3049, 3050⟩)
                  (.leaf ⟨764, 3053, 3054⟩)
                )
                (.branch 1
                  (.leaf ⟨764, 3053, 3054⟩)
                  (.leaf ⟨764, 3053, 3054⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨764, 3053, 3054⟩)
                  (.leaf ⟨764, 3053, 3054⟩)
                )
                (.branch 1
                  (.leaf ⟨765, 3057, 3058⟩)
                  (.leaf ⟨765, 3057, 3058⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨765, 3057, 3058⟩)
                  (.leaf ⟨765, 3057, 3058⟩)
                )
                (.branch 1
                  (.leaf ⟨765, 3057, 3058⟩)
                  (.leaf ⟨766, 3061, 3062⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨766, 3061, 3062⟩)
                  (.leaf ⟨766, 3061, 3062⟩)
                )
                (.branch 1
                  (.leaf ⟨766, 3061, 3062⟩)
                  (.leaf ⟨766, 3061, 3062⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨767, 3065, 3066⟩)
                  (.leaf ⟨767, 3065, 3066⟩)
                )
                (.branch 1
                  (.leaf ⟨767, 3065, 3066⟩)
                  (.leaf ⟨767, 3065, 3066⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨767, 3065, 3066⟩)
                  (.leaf ⟨768, 3069, 3070⟩)
                )
                (.branch 1
                  (.leaf ⟨768, 3069, 3070⟩)
                  (.leaf ⟨768, 3069, 3070⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨768, 3069, 3070⟩)
                  (.leaf ⟨768, 3069, 3070⟩)
                )
                (.branch 1
                  (.leaf ⟨769, 3073, 3074⟩)
                  (.leaf ⟨769, 3073, 3074⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨769, 3073, 3074⟩)
                  (.leaf ⟨769, 3073, 3074⟩)
                )
                (.branch 1
                  (.leaf ⟨769, 3073, 3074⟩)
                  (.leaf ⟨770, 3077, 3078⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨770, 3077, 3078⟩)
                  (.leaf ⟨770, 3077, 3078⟩)
                )
                (.branch 1
                  (.leaf ⟨770, 3077, 3078⟩)
                  (.leaf ⟨770, 3077, 3078⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨771, 3081, 3082⟩)
                  (.leaf ⟨771, 3081, 3082⟩)
                )
                (.branch 1
                  (.leaf ⟨771, 3081, 3082⟩)
                  (.leaf ⟨771, 3081, 3082⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨771, 3081, 3082⟩)
                  (.leaf ⟨772, 3085, 3086⟩)
                )
                (.branch 1
                  (.leaf ⟨772, 3085, 3086⟩)
                  (.leaf ⟨772, 3085, 3086⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨772, 3085, 3086⟩)
                  (.leaf ⟨772, 3085, 3086⟩)
                )
                (.branch 1
                  (.leaf ⟨773, 3091, 3092⟩)
                  (.leaf ⟨773, 3091, 3092⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨773, 3091, 3092⟩)
                  (.leaf ⟨773, 3091, 3092⟩)
                )
                (.branch 1
                  (.leaf ⟨773, 3091, 3092⟩)
                  (.leaf ⟨774, 427043, 427044⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨774, 427043, 427044⟩)
                  (.leaf ⟨774, 427043, 427044⟩)
                )
                (.branch 1
                  (.leaf ⟨774, 427043, 427044⟩)
                  (.leaf ⟨774, 427043, 427044⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨775, 3097, 3098⟩)
                  (.leaf ⟨775, 3097, 3098⟩)
                )
                (.branch 1
                  (.leaf ⟨775, 3097, 3098⟩)
                  (.leaf ⟨775, 3097, 3098⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨775, 3097, 3098⟩)
                  (.leaf ⟨776, 3101, 3102⟩)
                )
                (.branch 1
                  (.leaf ⟨776, 3101, 3102⟩)
                  (.leaf ⟨776, 3101, 3102⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨776, 3101, 3102⟩)
                  (.leaf ⟨776, 3101, 3102⟩)
                )
                (.branch 1
                  (.leaf ⟨777, 3105, 3106⟩)
                  (.leaf ⟨777, 3105, 3106⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨777, 3105, 3106⟩)
                  (.leaf ⟨777, 3105, 3106⟩)
                )
                (.branch 1
                  (.leaf ⟨777, 3105, 3106⟩)
                  (.leaf ⟨778, 3109, 3110⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨778, 3109, 3110⟩)
                  (.leaf ⟨778, 3109, 3110⟩)
                )
                (.branch 1
                  (.leaf ⟨778, 3109, 3110⟩)
                  (.leaf ⟨778, 3109, 3110⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨779, 3113, 3114⟩)
                  (.leaf ⟨779, 3113, 3114⟩)
                )
                (.branch 1
                  (.leaf ⟨779, 3113, 3114⟩)
                  (.leaf ⟨779, 3113, 3114⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨779, 3113, 3114⟩)
                  (.leaf ⟨780, 3117, 3118⟩)
                )
                (.branch 1
                  (.leaf ⟨780, 3117, 3118⟩)
                  (.leaf ⟨780, 3117, 3118⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨780, 3117, 3118⟩)
                  (.leaf ⟨780, 3117, 3118⟩)
                )
                (.branch 1
                  (.leaf ⟨781, 3121, 3122⟩)
                  (.leaf ⟨781, 3121, 3122⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨781, 3121, 3122⟩)
                  (.leaf ⟨781, 3121, 3122⟩)
                )
                (.branch 1
                  (.leaf ⟨781, 3121, 3122⟩)
                  (.leaf ⟨782, 3125, 3126⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨782, 3125, 3126⟩)
                  (.leaf ⟨782, 3125, 3126⟩)
                )
                (.branch 1
                  (.leaf ⟨782, 3125, 3126⟩)
                  (.leaf ⟨782, 3125, 3126⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨783, 3129, 3130⟩)
                  (.leaf ⟨783, 3129, 3130⟩)
                )
                (.branch 1
                  (.leaf ⟨783, 3129, 3130⟩)
                  (.leaf ⟨783, 3129, 3130⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨783, 3129, 3130⟩)
                  (.leaf ⟨784, 3133, 3134⟩)
                )
                (.branch 1
                  (.leaf ⟨784, 3133, 3134⟩)
                  (.leaf ⟨784, 3133, 3134⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨784, 3133, 3134⟩)
                  (.leaf ⟨784, 3133, 3134⟩)
                )
                (.branch 1
                  (.leaf ⟨785, 3137, 3138⟩)
                  (.leaf ⟨785, 3137, 3138⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨785, 3137, 3138⟩)
                  (.leaf ⟨785, 3137, 3138⟩)
                )
                (.branch 1
                  (.leaf ⟨785, 3137, 3138⟩)
                  (.leaf ⟨786, 3141, 3142⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨786, 3141, 3142⟩)
                  (.leaf ⟨786, 3141, 3142⟩)
                )
                (.branch 1
                  (.leaf ⟨786, 3141, 3142⟩)
                  (.leaf ⟨786, 3141, 3142⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨787, 3147, 3148⟩)
                  (.leaf ⟨787, 3147, 3148⟩)
                )
                (.branch 1
                  (.leaf ⟨787, 3147, 3148⟩)
                  (.leaf ⟨787, 3147, 3148⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨787, 3147, 3148⟩)
                  (.leaf ⟨788, 3147, 3092⟩)
                )
                (.branch 1
                  (.leaf ⟨788, 3147, 3092⟩)
                  (.leaf ⟨788, 3147, 3092⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨788, 3147, 3092⟩)
                  (.leaf ⟨788, 3147, 3092⟩)
                )
                (.branch 1
                  (.leaf ⟨789, 3155, 3156⟩)
                  (.leaf ⟨789, 3155, 3156⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨789, 3155, 3156⟩)
                  (.leaf ⟨789, 3155, 3156⟩)
                )
                (.branch 1
                  (.leaf ⟨789, 3155, 3156⟩)
                  (.leaf ⟨789, 3155, 3156⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨789, 3155, 3156⟩)
                  (.leaf ⟨789, 3155, 3156⟩)
                )
                (.branch 1
                  (.leaf ⟨789, 3155, 3156⟩)
                  (.leaf ⟨789, 3155, 3156⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨790, 3159, 3160⟩)
                  (.leaf ⟨790, 3159, 3160⟩)
                )
                (.branch 1
                  (.leaf ⟨790, 3159, 3160⟩)
                  (.leaf ⟨790, 3159, 3160⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨790, 3159, 3160⟩)
                  (.leaf ⟨760, 427027, 427028⟩)
                )
                (.branch 1
                  (.leaf ⟨760, 427027, 427028⟩)
                  (.leaf ⟨760, 427027, 427028⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨760, 427027, 427028⟩)
                  (.leaf ⟨760, 427027, 427028⟩)
                )
                (.branch 1
                  (.leaf ⟨761, 3041, 3042⟩)
                  (.leaf ⟨761, 3041, 3042⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨761, 3041, 3042⟩)
                  (.leaf ⟨761, 3041, 3042⟩)
                )
                (.branch 1
                  (.leaf ⟨761, 3041, 3042⟩)
                  (.leaf ⟨762, 3045, 3046⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨762, 3045, 3046⟩)
                  (.leaf ⟨762, 3045, 3046⟩)
                )
                (.branch 1
                  (.leaf ⟨762, 3045, 3046⟩)
                  (.leaf ⟨762, 3045, 3046⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨763, 3049, 3050⟩)
                  (.leaf ⟨763, 3049, 3050⟩)
                )
                (.branch 1
                  (.leaf ⟨763, 3049, 3050⟩)
                  (.leaf ⟨763, 3049, 3050⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨763, 3049, 3050⟩)
                  (.leaf ⟨764, 3053, 3054⟩)
                )
                (.branch 1
                  (.leaf ⟨764, 3053, 3054⟩)
                  (.leaf ⟨764, 3053, 3054⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨764, 3053, 3054⟩)
                  (.leaf ⟨764, 3053, 3054⟩)
                )
                (.branch 1
                  (.leaf ⟨765, 3057, 3058⟩)
                  (.leaf ⟨765, 3057, 3058⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨765, 3057, 3058⟩)
                  (.leaf ⟨765, 3057, 3058⟩)
                )
                (.branch 1
                  (.leaf ⟨765, 3057, 3058⟩)
                  (.leaf ⟨766, 3061, 3062⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨766, 3061, 3062⟩)
                  (.leaf ⟨766, 3061, 3062⟩)
                )
                (.branch 1
                  (.leaf ⟨766, 3061, 3062⟩)
                  (.leaf ⟨766, 3061, 3062⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨767, 3065, 3066⟩)
                  (.leaf ⟨767, 3065, 3066⟩)
                )
                (.branch 1
                  (.leaf ⟨767, 3065, 3066⟩)
                  (.leaf ⟨767, 3065, 3066⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨767, 3065, 3066⟩)
                  (.leaf ⟨768, 3069, 3070⟩)
                )
                (.branch 1
                  (.leaf ⟨768, 3069, 3070⟩)
                  (.leaf ⟨768, 3069, 3070⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨768, 3069, 3070⟩)
                  (.leaf ⟨768, 3069, 3070⟩)
                )
                (.branch 1
                  (.leaf ⟨769, 3073, 3074⟩)
                  (.leaf ⟨769, 3073, 3074⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨769, 3073, 3074⟩)
                  (.leaf ⟨769, 3073, 3074⟩)
                )
                (.branch 1
                  (.leaf ⟨769, 3073, 3074⟩)
                  (.leaf ⟨770, 3077, 3078⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨770, 3077, 3078⟩)
                  (.leaf ⟨770, 3077, 3078⟩)
                )
                (.branch 1
                  (.leaf ⟨770, 3077, 3078⟩)
                  (.leaf ⟨770, 3077, 3078⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨771, 3081, 3082⟩)
                  (.leaf ⟨771, 3081, 3082⟩)
                )
                (.branch 1
                  (.leaf ⟨771, 3081, 3082⟩)
                  (.leaf ⟨771, 3081, 3082⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_4608_512 : Balanced.RowTree Cell :=
  .branch 256 cache_4608_256 cache_4864_256
noncomputable def cache_4096_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_4096_512 cache_4608_512
noncomputable def cache_5120_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨771, 3081, 3082⟩)
                  (.leaf ⟨772, 3085, 3086⟩)
                )
                (.branch 1
                  (.leaf ⟨772, 3085, 3086⟩)
                  (.leaf ⟨772, 3085, 3086⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨772, 3085, 3086⟩)
                  (.leaf ⟨772, 3085, 3086⟩)
                )
                (.branch 1
                  (.leaf ⟨773, 3091, 3092⟩)
                  (.leaf ⟨773, 3091, 3092⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨773, 3091, 3092⟩)
                  (.leaf ⟨773, 3091, 3092⟩)
                )
                (.branch 1
                  (.leaf ⟨773, 3091, 3092⟩)
                  (.leaf ⟨774, 427043, 427044⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨774, 427043, 427044⟩)
                  (.leaf ⟨774, 427043, 427044⟩)
                )
                (.branch 1
                  (.leaf ⟨774, 427043, 427044⟩)
                  (.leaf ⟨774, 427043, 427044⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨775, 3097, 3098⟩)
                  (.leaf ⟨775, 3097, 3098⟩)
                )
                (.branch 1
                  (.leaf ⟨775, 3097, 3098⟩)
                  (.leaf ⟨775, 3097, 3098⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨775, 3097, 3098⟩)
                  (.leaf ⟨776, 3101, 3102⟩)
                )
                (.branch 1
                  (.leaf ⟨776, 3101, 3102⟩)
                  (.leaf ⟨776, 3101, 3102⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨776, 3101, 3102⟩)
                  (.leaf ⟨776, 3101, 3102⟩)
                )
                (.branch 1
                  (.leaf ⟨777, 3105, 3106⟩)
                  (.leaf ⟨777, 3105, 3106⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨777, 3105, 3106⟩)
                  (.leaf ⟨777, 3105, 3106⟩)
                )
                (.branch 1
                  (.leaf ⟨777, 3105, 3106⟩)
                  (.leaf ⟨778, 3109, 3110⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨778, 3109, 3110⟩)
                  (.leaf ⟨778, 3109, 3110⟩)
                )
                (.branch 1
                  (.leaf ⟨778, 3109, 3110⟩)
                  (.leaf ⟨778, 3109, 3110⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨779, 3113, 3114⟩)
                  (.leaf ⟨779, 3113, 3114⟩)
                )
                (.branch 1
                  (.leaf ⟨779, 3113, 3114⟩)
                  (.leaf ⟨779, 3113, 3114⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨779, 3113, 3114⟩)
                  (.leaf ⟨780, 3117, 3118⟩)
                )
                (.branch 1
                  (.leaf ⟨780, 3117, 3118⟩)
                  (.leaf ⟨780, 3117, 3118⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨780, 3117, 3118⟩)
                  (.leaf ⟨780, 3117, 3118⟩)
                )
                (.branch 1
                  (.leaf ⟨781, 3121, 3122⟩)
                  (.leaf ⟨781, 3121, 3122⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨781, 3121, 3122⟩)
                  (.leaf ⟨781, 3121, 3122⟩)
                )
                (.branch 1
                  (.leaf ⟨781, 3121, 3122⟩)
                  (.leaf ⟨782, 3125, 3126⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨782, 3125, 3126⟩)
                  (.leaf ⟨782, 3125, 3126⟩)
                )
                (.branch 1
                  (.leaf ⟨782, 3125, 3126⟩)
                  (.leaf ⟨782, 3125, 3126⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨783, 3129, 3130⟩)
                  (.leaf ⟨783, 3129, 3130⟩)
                )
                (.branch 1
                  (.leaf ⟨783, 3129, 3130⟩)
                  (.leaf ⟨783, 3129, 3130⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨783, 3129, 3130⟩)
                  (.leaf ⟨784, 3133, 3134⟩)
                )
                (.branch 1
                  (.leaf ⟨784, 3133, 3134⟩)
                  (.leaf ⟨784, 3133, 3134⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨784, 3133, 3134⟩)
                  (.leaf ⟨784, 3133, 3134⟩)
                )
                (.branch 1
                  (.leaf ⟨785, 3137, 3138⟩)
                  (.leaf ⟨785, 3137, 3138⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨785, 3137, 3138⟩)
                  (.leaf ⟨785, 3137, 3138⟩)
                )
                (.branch 1
                  (.leaf ⟨785, 3137, 3138⟩)
                  (.leaf ⟨786, 3141, 3142⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨786, 3141, 3142⟩)
                  (.leaf ⟨786, 3141, 3142⟩)
                )
                (.branch 1
                  (.leaf ⟨786, 3141, 3142⟩)
                  (.leaf ⟨786, 3141, 3142⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨787, 3147, 3148⟩)
                  (.leaf ⟨787, 3147, 3148⟩)
                )
                (.branch 1
                  (.leaf ⟨787, 3147, 3148⟩)
                  (.leaf ⟨787, 3147, 3148⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨787, 3147, 3148⟩)
                  (.leaf ⟨788, 3147, 3092⟩)
                )
                (.branch 1
                  (.leaf ⟨788, 3147, 3092⟩)
                  (.leaf ⟨788, 3147, 3092⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨788, 3147, 3092⟩)
                  (.leaf ⟨788, 3147, 3092⟩)
                )
                (.branch 1
                  (.leaf ⟨789, 3155, 3156⟩)
                  (.leaf ⟨789, 3155, 3156⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨789, 3155, 3156⟩)
                  (.leaf ⟨789, 3155, 3156⟩)
                )
                (.branch 1
                  (.leaf ⟨789, 3155, 3156⟩)
                  (.leaf ⟨774, 427043, 427044⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨774, 427043, 427044⟩)
                  (.leaf ⟨774, 427043, 427044⟩)
                )
                (.branch 1
                  (.leaf ⟨774, 427043, 427044⟩)
                  (.leaf ⟨774, 427043, 427044⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨775, 3097, 3098⟩)
                  (.leaf ⟨775, 3097, 3098⟩)
                )
                (.branch 1
                  (.leaf ⟨775, 3097, 3098⟩)
                  (.leaf ⟨775, 3097, 3098⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨775, 3097, 3098⟩)
                  (.leaf ⟨776, 3101, 3102⟩)
                )
                (.branch 1
                  (.leaf ⟨776, 3101, 3102⟩)
                  (.leaf ⟨776, 3101, 3102⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨776, 3101, 3102⟩)
                  (.leaf ⟨776, 3101, 3102⟩)
                )
                (.branch 1
                  (.leaf ⟨777, 3105, 3106⟩)
                  (.leaf ⟨777, 3105, 3106⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨777, 3105, 3106⟩)
                  (.leaf ⟨777, 3105, 3106⟩)
                )
                (.branch 1
                  (.leaf ⟨777, 3105, 3106⟩)
                  (.leaf ⟨778, 3109, 3110⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨778, 3109, 3110⟩)
                  (.leaf ⟨778, 3109, 3110⟩)
                )
                (.branch 1
                  (.leaf ⟨778, 3109, 3110⟩)
                  (.leaf ⟨778, 3109, 3110⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨779, 3113, 3114⟩)
                  (.leaf ⟨779, 3113, 3114⟩)
                )
                (.branch 1
                  (.leaf ⟨779, 3113, 3114⟩)
                  (.leaf ⟨779, 3113, 3114⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨779, 3113, 3114⟩)
                  (.leaf ⟨780, 3117, 3118⟩)
                )
                (.branch 1
                  (.leaf ⟨780, 3117, 3118⟩)
                  (.leaf ⟨780, 3117, 3118⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨780, 3117, 3118⟩)
                  (.leaf ⟨780, 3117, 3118⟩)
                )
                (.branch 1
                  (.leaf ⟨781, 3121, 3122⟩)
                  (.leaf ⟨781, 3121, 3122⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨781, 3121, 3122⟩)
                  (.leaf ⟨781, 3121, 3122⟩)
                )
                (.branch 1
                  (.leaf ⟨781, 3121, 3122⟩)
                  (.leaf ⟨782, 3125, 3126⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨782, 3125, 3126⟩)
                  (.leaf ⟨782, 3125, 3126⟩)
                )
                (.branch 1
                  (.leaf ⟨782, 3125, 3126⟩)
                  (.leaf ⟨782, 3125, 3126⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨783, 3129, 3130⟩)
                  (.leaf ⟨783, 3129, 3130⟩)
                )
                (.branch 1
                  (.leaf ⟨783, 3129, 3130⟩)
                  (.leaf ⟨783, 3129, 3130⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨783, 3129, 3130⟩)
                  (.leaf ⟨784, 3133, 3134⟩)
                )
                (.branch 1
                  (.leaf ⟨784, 3133, 3134⟩)
                  (.leaf ⟨784, 3133, 3134⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨784, 3133, 3134⟩)
                  (.leaf ⟨784, 3133, 3134⟩)
                )
                (.branch 1
                  (.leaf ⟨785, 3137, 3138⟩)
                  (.leaf ⟨785, 3137, 3138⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨785, 3137, 3138⟩)
                  (.leaf ⟨785, 3137, 3138⟩)
                )
                (.branch 1
                  (.leaf ⟨785, 3137, 3138⟩)
                  (.leaf ⟨786, 3141, 3142⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨786, 3141, 3142⟩)
                  (.leaf ⟨786, 3141, 3142⟩)
                )
                (.branch 1
                  (.leaf ⟨786, 3141, 3142⟩)
                  (.leaf ⟨786, 3141, 3142⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨787, 3147, 3148⟩)
                  (.leaf ⟨787, 3147, 3148⟩)
                )
                (.branch 1
                  (.leaf ⟨787, 3147, 3148⟩)
                  (.leaf ⟨787, 3147, 3148⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨787, 3147, 3148⟩)
                  (.leaf ⟨760, 427027, 427028⟩)
                )
                (.branch 1
                  (.leaf ⟨760, 427027, 427028⟩)
                  (.leaf ⟨760, 427027, 427028⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨760, 427027, 427028⟩)
                  (.leaf ⟨760, 427027, 427028⟩)
                )
                (.branch 1
                  (.leaf ⟨761, 3041, 3042⟩)
                  (.leaf ⟨761, 3041, 3042⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨761, 3041, 3042⟩)
                  (.leaf ⟨761, 3041, 3042⟩)
                )
                (.branch 1
                  (.leaf ⟨761, 3041, 3042⟩)
                  (.leaf ⟨762, 3045, 3046⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨762, 3045, 3046⟩)
                  (.leaf ⟨762, 3045, 3046⟩)
                )
                (.branch 1
                  (.leaf ⟨762, 3045, 3046⟩)
                  (.leaf ⟨762, 3045, 3046⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨763, 3049, 3050⟩)
                  (.leaf ⟨763, 3049, 3050⟩)
                )
                (.branch 1
                  (.leaf ⟨763, 3049, 3050⟩)
                  (.leaf ⟨763, 3049, 3050⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨763, 3049, 3050⟩)
                  (.leaf ⟨764, 3053, 3054⟩)
                )
                (.branch 1
                  (.leaf ⟨764, 3053, 3054⟩)
                  (.leaf ⟨764, 3053, 3054⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨764, 3053, 3054⟩)
                  (.leaf ⟨764, 3053, 3054⟩)
                )
                (.branch 1
                  (.leaf ⟨765, 3057, 3058⟩)
                  (.leaf ⟨765, 3057, 3058⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨765, 3057, 3058⟩)
                  (.leaf ⟨765, 3057, 3058⟩)
                )
                (.branch 1
                  (.leaf ⟨765, 3057, 3058⟩)
                  (.leaf ⟨766, 3061, 3062⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨766, 3061, 3062⟩)
                  (.leaf ⟨766, 3061, 3062⟩)
                )
                (.branch 1
                  (.leaf ⟨766, 3061, 3062⟩)
                  (.leaf ⟨766, 3061, 3062⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨767, 3065, 3066⟩)
                  (.leaf ⟨767, 3065, 3066⟩)
                )
                (.branch 1
                  (.leaf ⟨767, 3065, 3066⟩)
                  (.leaf ⟨767, 3065, 3066⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨767, 3065, 3066⟩)
                  (.leaf ⟨768, 3069, 3070⟩)
                )
                (.branch 1
                  (.leaf ⟨768, 3069, 3070⟩)
                  (.leaf ⟨768, 3069, 3070⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨768, 3069, 3070⟩)
                  (.leaf ⟨768, 3069, 3070⟩)
                )
                (.branch 1
                  (.leaf ⟨769, 3073, 3074⟩)
                  (.leaf ⟨769, 3073, 3074⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨769, 3073, 3074⟩)
                  (.leaf ⟨769, 3073, 3074⟩)
                )
                (.branch 1
                  (.leaf ⟨769, 3073, 3074⟩)
                  (.leaf ⟨770, 3077, 3078⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨770, 3077, 3078⟩)
                  (.leaf ⟨770, 3077, 3078⟩)
                )
                (.branch 1
                  (.leaf ⟨770, 3077, 3078⟩)
                  (.leaf ⟨770, 3077, 3078⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨771, 3081, 3082⟩)
                  (.leaf ⟨771, 3081, 3082⟩)
                )
                (.branch 1
                  (.leaf ⟨771, 3081, 3082⟩)
                  (.leaf ⟨771, 3081, 3082⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨771, 3081, 3082⟩)
                  (.leaf ⟨772, 3085, 3086⟩)
                )
                (.branch 1
                  (.leaf ⟨772, 3085, 3086⟩)
                  (.leaf ⟨772, 3085, 3086⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨772, 3085, 3086⟩)
                  (.leaf ⟨772, 3085, 3086⟩)
                )
                (.branch 1
                  (.leaf ⟨773, 3091, 3092⟩)
                  (.leaf ⟨773, 3091, 3092⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨773, 3091, 3092⟩)
                  (.leaf ⟨773, 3091, 3092⟩)
                )
                (.branch 1
                  (.leaf ⟨773, 3091, 3092⟩)
                  (.leaf ⟨791, 3091, 3148⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨791, 3091, 3148⟩)
                  (.leaf ⟨791, 3091, 3148⟩)
                )
                (.branch 1
                  (.leaf ⟨791, 3091, 3148⟩)
                  (.leaf ⟨791, 3091, 3148⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨792, 3167, 3168⟩)
                  (.leaf ⟨792, 3167, 3168⟩)
                )
                (.branch 1
                  (.leaf ⟨792, 3167, 3168⟩)
                  (.leaf ⟨792, 3167, 3168⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨792, 3167, 3168⟩)
                  (.leaf ⟨793, 3167, 3156⟩)
                )
                (.branch 1
                  (.leaf ⟨793, 3167, 3156⟩)
                  (.leaf ⟨793, 3167, 3156⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨793, 3167, 3156⟩)
                  (.leaf ⟨793, 3167, 3156⟩)
                )
                (.branch 1
                  (.leaf ⟨794, 3175, 3176⟩)
                  (.leaf ⟨794, 3175, 3176⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨794, 3175, 3176⟩)
                  (.leaf ⟨794, 3175, 3176⟩)
                )
                (.branch 1
                  (.leaf ⟨794, 3175, 3176⟩)
                  (.leaf ⟨795, 3175, 3160⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨795, 3175, 3160⟩)
                  (.leaf ⟨795, 3175, 3160⟩)
                )
                (.branch 1
                  (.leaf ⟨795, 3175, 3160⟩)
                  (.leaf ⟨795, 3175, 3160⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_5376_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨796, 3183, 3184⟩)
                  (.leaf ⟨796, 3183, 3184⟩)
                )
                (.branch 1
                  (.leaf ⟨796, 3183, 3184⟩)
                  (.leaf ⟨796, 3183, 3184⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨796, 3183, 3184⟩)
                  (.leaf ⟨797, 3187, 3188⟩)
                )
                (.branch 1
                  (.leaf ⟨797, 3187, 3188⟩)
                  (.leaf ⟨797, 3187, 3188⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨797, 3187, 3188⟩)
                  (.leaf ⟨797, 3187, 3188⟩)
                )
                (.branch 1
                  (.leaf ⟨798, 3191, 3192⟩)
                  (.leaf ⟨798, 3191, 3192⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨798, 3191, 3192⟩)
                  (.leaf ⟨798, 3191, 3192⟩)
                )
                (.branch 1
                  (.leaf ⟨798, 3191, 3192⟩)
                  (.leaf ⟨799, 3195, 3196⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨799, 3195, 3196⟩)
                  (.leaf ⟨799, 3195, 3196⟩)
                )
                (.branch 1
                  (.leaf ⟨799, 3195, 3196⟩)
                  (.leaf ⟨799, 3195, 3196⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨800, 3199, 3200⟩)
                  (.leaf ⟨800, 3199, 3200⟩)
                )
                (.branch 1
                  (.leaf ⟨800, 3199, 3200⟩)
                  (.leaf ⟨800, 3199, 3200⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨800, 3199, 3200⟩)
                  (.leaf ⟨801, 3203, 3204⟩)
                )
                (.branch 1
                  (.leaf ⟨801, 3203, 3204⟩)
                  (.leaf ⟨801, 3203, 3204⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨801, 3203, 3204⟩)
                  (.leaf ⟨801, 3203, 3204⟩)
                )
                (.branch 1
                  (.leaf ⟨802, 3207, 3208⟩)
                  (.leaf ⟨802, 3207, 3208⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨802, 3207, 3208⟩)
                  (.leaf ⟨802, 3207, 3208⟩)
                )
                (.branch 1
                  (.leaf ⟨802, 3207, 3208⟩)
                  (.leaf ⟨803, 3211, 3212⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨803, 3211, 3212⟩)
                  (.leaf ⟨803, 3211, 3212⟩)
                )
                (.branch 1
                  (.leaf ⟨803, 3211, 3212⟩)
                  (.leaf ⟨803, 3211, 3212⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨804, 3215, 3216⟩)
                  (.leaf ⟨804, 3215, 3216⟩)
                )
                (.branch 1
                  (.leaf ⟨804, 3215, 3216⟩)
                  (.leaf ⟨804, 3215, 3216⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨804, 3215, 3216⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
                (.branch 1
                  (.leaf ⟨721, 427023, 427024⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨721, 427023, 427024⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨722, 2885, 2886⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨722, 2885, 2886⟩)
                )
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨723, 2889, 2890⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
                (.branch 1
                  (.leaf ⟨723, 2889, 2890⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨724, 2893, 2894⟩)
                )
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨724, 2893, 2894⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
                (.branch 1
                  (.leaf ⟨725, 2897, 2898⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨725, 2897, 2898⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨726, 2901, 2902⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨726, 2901, 2902⟩)
                )
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨727, 2905, 2906⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
                (.branch 1
                  (.leaf ⟨727, 2905, 2906⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨728, 2909, 2910⟩)
                )
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨728, 2909, 2910⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
                (.branch 1
                  (.leaf ⟨729, 2913, 2914⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨729, 2913, 2914⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨730, 2917, 2918⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨730, 2917, 2918⟩)
                )
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨731, 2921, 2922⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
                (.branch 1
                  (.leaf ⟨731, 2921, 2922⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨732, 2925, 2926⟩)
                )
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨732, 2925, 2926⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨733, 427039, 427039⟩)
                )
                (.branch 1
                  (.leaf ⟨733, 427039, 427039⟩)
                  (.leaf ⟨733, 427039, 427039⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨733, 427039, 427039⟩)
                  (.leaf ⟨733, 427039, 427039⟩)
                )
                (.branch 1
                  (.leaf ⟨734, 2935, 2936⟩)
                  (.leaf ⟨734, 2935, 2936⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨734, 2935, 2936⟩)
                  (.leaf ⟨734, 2935, 2936⟩)
                )
                (.branch 1
                  (.leaf ⟨734, 2935, 2936⟩)
                  (.leaf ⟨805, 427035, 427035⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨805, 427035, 427035⟩)
                  (.leaf ⟨805, 427035, 427035⟩)
                )
                (.branch 1
                  (.leaf ⟨805, 427035, 427035⟩)
                  (.leaf ⟨805, 427035, 427035⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨806, 3223, 3224⟩)
                  (.leaf ⟨806, 3223, 3224⟩)
                )
                (.branch 1
                  (.leaf ⟨806, 3223, 3224⟩)
                  (.leaf ⟨806, 3223, 3224⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨806, 3223, 3224⟩)
                  (.leaf ⟨807, 427064, 427064⟩)
                )
                (.branch 1
                  (.leaf ⟨807, 427064, 427064⟩)
                  (.leaf ⟨807, 427064, 427064⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨807, 427064, 427064⟩)
                  (.leaf ⟨807, 427064, 427064⟩)
                )
                (.branch 1
                  (.leaf ⟨808, 3231, 3232⟩)
                  (.leaf ⟨808, 3231, 3232⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨808, 3231, 3232⟩)
                  (.leaf ⟨808, 3231, 3232⟩)
                )
                (.branch 1
                  (.leaf ⟨808, 3231, 3232⟩)
                  (.leaf ⟨809, 3235, 3236⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨809, 3235, 3236⟩)
                  (.leaf ⟨809, 3235, 3236⟩)
                )
                (.branch 1
                  (.leaf ⟨809, 3235, 3236⟩)
                  (.leaf ⟨809, 3235, 3236⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨810, 3239, 3240⟩)
                  (.leaf ⟨810, 3239, 3240⟩)
                )
                (.branch 1
                  (.leaf ⟨810, 3239, 3240⟩)
                  (.leaf ⟨810, 3239, 3240⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨810, 3239, 3240⟩)
                  (.leaf ⟨811, 3243, 3244⟩)
                )
                (.branch 1
                  (.leaf ⟨811, 3243, 3244⟩)
                  (.leaf ⟨811, 3243, 3244⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨811, 3243, 3244⟩)
                  (.leaf ⟨811, 3243, 3244⟩)
                )
                (.branch 1
                  (.leaf ⟨812, 3247, 3248⟩)
                  (.leaf ⟨812, 3247, 3248⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨812, 3247, 3248⟩)
                  (.leaf ⟨812, 3247, 3248⟩)
                )
                (.branch 1
                  (.leaf ⟨812, 3247, 3248⟩)
                  (.leaf ⟨813, 3251, 3252⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨813, 3251, 3252⟩)
                  (.leaf ⟨813, 3251, 3252⟩)
                )
                (.branch 1
                  (.leaf ⟨813, 3251, 3252⟩)
                  (.leaf ⟨813, 3251, 3252⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨814, 3255, 3256⟩)
                  (.leaf ⟨814, 3255, 3256⟩)
                )
                (.branch 1
                  (.leaf ⟨814, 3255, 3256⟩)
                  (.leaf ⟨814, 3255, 3256⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨814, 3255, 3256⟩)
                  (.leaf ⟨815, 3259, 3260⟩)
                )
                (.branch 1
                  (.leaf ⟨815, 3259, 3260⟩)
                  (.leaf ⟨815, 3259, 3260⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨815, 3259, 3260⟩)
                  (.leaf ⟨815, 3259, 3260⟩)
                )
                (.branch 1
                  (.leaf ⟨816, 3263, 3264⟩)
                  (.leaf ⟨816, 3263, 3264⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨816, 3263, 3264⟩)
                  (.leaf ⟨816, 3263, 3264⟩)
                )
                (.branch 1
                  (.leaf ⟨816, 3263, 3264⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨721, 427023, 427024⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
                (.branch 1
                  (.leaf ⟨721, 427023, 427024⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨722, 2885, 2886⟩)
                )
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨722, 2885, 2886⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
                (.branch 1
                  (.leaf ⟨723, 2889, 2890⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨723, 2889, 2890⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨724, 2893, 2894⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨724, 2893, 2894⟩)
                )
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨725, 2897, 2898⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
                (.branch 1
                  (.leaf ⟨725, 2897, 2898⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨726, 2901, 2902⟩)
                )
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨726, 2901, 2902⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
                (.branch 1
                  (.leaf ⟨727, 2905, 2906⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨727, 2905, 2906⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨728, 2909, 2910⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨728, 2909, 2910⟩)
                )
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨729, 2913, 2914⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
                (.branch 1
                  (.leaf ⟨729, 2913, 2914⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨730, 2917, 2918⟩)
                )
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨730, 2917, 2918⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
                (.branch 1
                  (.leaf ⟨731, 2921, 2922⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨731, 2921, 2922⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨732, 2925, 2926⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨732, 2925, 2926⟩)
                )
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨733, 427039, 427039⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨733, 427039, 427039⟩)
                  (.leaf ⟨733, 427039, 427039⟩)
                )
                (.branch 1
                  (.leaf ⟨733, 427039, 427039⟩)
                  (.leaf ⟨733, 427039, 427039⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨734, 2935, 2936⟩)
                  (.leaf ⟨734, 2935, 2936⟩)
                )
                (.branch 1
                  (.leaf ⟨734, 2935, 2936⟩)
                  (.leaf ⟨734, 2935, 2936⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨734, 2935, 2936⟩)
                  (.leaf ⟨805, 427035, 427035⟩)
                )
                (.branch 1
                  (.leaf ⟨805, 427035, 427035⟩)
                  (.leaf ⟨805, 427035, 427035⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨805, 427035, 427035⟩)
                  (.leaf ⟨805, 427035, 427035⟩)
                )
                (.branch 1
                  (.leaf ⟨806, 3223, 3224⟩)
                  (.leaf ⟨806, 3223, 3224⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨806, 3223, 3224⟩)
                  (.leaf ⟨806, 3223, 3224⟩)
                )
                (.branch 1
                  (.leaf ⟨806, 3223, 3224⟩)
                  (.leaf ⟨807, 427064, 427064⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_5120_512 : Balanced.RowTree Cell :=
  .branch 256 cache_5120_256 cache_5376_256
noncomputable def cache_5632_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨807, 427064, 427064⟩)
                  (.leaf ⟨807, 427064, 427064⟩)
                )
                (.branch 1
                  (.leaf ⟨807, 427064, 427064⟩)
                  (.leaf ⟨807, 427064, 427064⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨808, 3231, 3232⟩)
                  (.leaf ⟨808, 3231, 3232⟩)
                )
                (.branch 1
                  (.leaf ⟨808, 3231, 3232⟩)
                  (.leaf ⟨808, 3231, 3232⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨808, 3231, 3232⟩)
                  (.leaf ⟨809, 3235, 3236⟩)
                )
                (.branch 1
                  (.leaf ⟨809, 3235, 3236⟩)
                  (.leaf ⟨809, 3235, 3236⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨809, 3235, 3236⟩)
                  (.leaf ⟨809, 3235, 3236⟩)
                )
                (.branch 1
                  (.leaf ⟨810, 3239, 3240⟩)
                  (.leaf ⟨810, 3239, 3240⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨810, 3239, 3240⟩)
                  (.leaf ⟨810, 3239, 3240⟩)
                )
                (.branch 1
                  (.leaf ⟨810, 3239, 3240⟩)
                  (.leaf ⟨811, 3243, 3244⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨811, 3243, 3244⟩)
                  (.leaf ⟨811, 3243, 3244⟩)
                )
                (.branch 1
                  (.leaf ⟨811, 3243, 3244⟩)
                  (.leaf ⟨811, 3243, 3244⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨812, 3247, 3248⟩)
                  (.leaf ⟨812, 3247, 3248⟩)
                )
                (.branch 1
                  (.leaf ⟨812, 3247, 3248⟩)
                  (.leaf ⟨812, 3247, 3248⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨812, 3247, 3248⟩)
                  (.leaf ⟨813, 3251, 3252⟩)
                )
                (.branch 1
                  (.leaf ⟨813, 3251, 3252⟩)
                  (.leaf ⟨813, 3251, 3252⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨813, 3251, 3252⟩)
                  (.leaf ⟨813, 3251, 3252⟩)
                )
                (.branch 1
                  (.leaf ⟨814, 3255, 3256⟩)
                  (.leaf ⟨814, 3255, 3256⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨814, 3255, 3256⟩)
                  (.leaf ⟨814, 3255, 3256⟩)
                )
                (.branch 1
                  (.leaf ⟨814, 3255, 3256⟩)
                  (.leaf ⟨815, 3259, 3260⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨815, 3259, 3260⟩)
                  (.leaf ⟨815, 3259, 3260⟩)
                )
                (.branch 1
                  (.leaf ⟨815, 3259, 3260⟩)
                  (.leaf ⟨815, 3259, 3260⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨816, 3263, 3264⟩)
                  (.leaf ⟨816, 3263, 3264⟩)
                )
                (.branch 1
                  (.leaf ⟨816, 3263, 3264⟩)
                  (.leaf ⟨816, 3263, 3264⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨816, 3263, 3264⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
                (.branch 1
                  (.leaf ⟨721, 427023, 427024⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨721, 427023, 427024⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨722, 2885, 2886⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨722, 2885, 2886⟩)
                )
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨723, 2889, 2890⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
                (.branch 1
                  (.leaf ⟨723, 2889, 2890⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨724, 2893, 2894⟩)
                )
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨724, 2893, 2894⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
                (.branch 1
                  (.leaf ⟨725, 2897, 2898⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨725, 2897, 2898⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨726, 2901, 2902⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨726, 2901, 2902⟩)
                )
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨727, 2905, 2906⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
                (.branch 1
                  (.leaf ⟨727, 2905, 2906⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨728, 2909, 2910⟩)
                )
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨728, 2909, 2910⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
                (.branch 1
                  (.leaf ⟨729, 2913, 2914⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨729, 2913, 2914⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨730, 2917, 2918⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨730, 2917, 2918⟩)
                )
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨731, 2921, 2922⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
                (.branch 1
                  (.leaf ⟨731, 2921, 2922⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨732, 2925, 2926⟩)
                )
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨732, 2925, 2926⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨733, 427039, 427039⟩)
                )
                (.branch 1
                  (.leaf ⟨733, 427039, 427039⟩)
                  (.leaf ⟨733, 427039, 427039⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨733, 427039, 427039⟩)
                  (.leaf ⟨733, 427039, 427039⟩)
                )
                (.branch 1
                  (.leaf ⟨734, 2935, 2936⟩)
                  (.leaf ⟨734, 2935, 2936⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨734, 2935, 2936⟩)
                  (.leaf ⟨734, 2935, 2936⟩)
                )
                (.branch 1
                  (.leaf ⟨734, 2935, 2936⟩)
                  (.leaf ⟨735, 427036, 427036⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨735, 427036, 427036⟩)
                  (.leaf ⟨735, 427036, 427036⟩)
                )
                (.branch 1
                  (.leaf ⟨735, 427036, 427036⟩)
                  (.leaf ⟨735, 427036, 427036⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨736, 2943, 2944⟩)
                  (.leaf ⟨736, 2943, 2944⟩)
                )
                (.branch 1
                  (.leaf ⟨736, 2943, 2944⟩)
                  (.leaf ⟨736, 2943, 2944⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨736, 2943, 2944⟩)
                  (.leaf ⟨737, 427031, 427031⟩)
                )
                (.branch 1
                  (.leaf ⟨737, 427031, 427031⟩)
                  (.leaf ⟨737, 427031, 427031⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨737, 427031, 427031⟩)
                  (.leaf ⟨737, 427031, 427031⟩)
                )
                (.branch 1
                  (.leaf ⟨738, 2951, 2952⟩)
                  (.leaf ⟨738, 2951, 2952⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨738, 2951, 2952⟩)
                  (.leaf ⟨738, 2951, 2952⟩)
                )
                (.branch 1
                  (.leaf ⟨738, 2951, 2952⟩)
                  (.leaf ⟨739, 2955, 2956⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨739, 2955, 2956⟩)
                  (.leaf ⟨739, 2955, 2956⟩)
                )
                (.branch 1
                  (.leaf ⟨739, 2955, 2956⟩)
                  (.leaf ⟨739, 2955, 2956⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨740, 2959, 2960⟩)
                  (.leaf ⟨740, 2959, 2960⟩)
                )
                (.branch 1
                  (.leaf ⟨740, 2959, 2960⟩)
                  (.leaf ⟨740, 2959, 2960⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨740, 2959, 2960⟩)
                  (.leaf ⟨741, 2963, 2964⟩)
                )
                (.branch 1
                  (.leaf ⟨741, 2963, 2964⟩)
                  (.leaf ⟨741, 2963, 2964⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨741, 2963, 2964⟩)
                  (.leaf ⟨741, 2963, 2964⟩)
                )
                (.branch 1
                  (.leaf ⟨742, 2967, 2968⟩)
                  (.leaf ⟨742, 2967, 2968⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨742, 2967, 2968⟩)
                  (.leaf ⟨742, 2967, 2968⟩)
                )
                (.branch 1
                  (.leaf ⟨742, 2967, 2968⟩)
                  (.leaf ⟨743, 2971, 2972⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨743, 2971, 2972⟩)
                  (.leaf ⟨743, 2971, 2972⟩)
                )
                (.branch 1
                  (.leaf ⟨743, 2971, 2972⟩)
                  (.leaf ⟨743, 2971, 2972⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨744, 2975, 2976⟩)
                  (.leaf ⟨744, 2975, 2976⟩)
                )
                (.branch 1
                  (.leaf ⟨744, 2975, 2976⟩)
                  (.leaf ⟨744, 2975, 2976⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨744, 2975, 2976⟩)
                  (.leaf ⟨745, 2979, 2980⟩)
                )
                (.branch 1
                  (.leaf ⟨745, 2979, 2980⟩)
                  (.leaf ⟨745, 2979, 2980⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨745, 2979, 2980⟩)
                  (.leaf ⟨745, 2979, 2980⟩)
                )
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨746, 2983, 2984⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨746, 2983, 2984⟩)
                )
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨721, 427023, 427024⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
                (.branch 1
                  (.leaf ⟨721, 427023, 427024⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨722, 2885, 2886⟩)
                )
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨722, 2885, 2886⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
                (.branch 1
                  (.leaf ⟨723, 2889, 2890⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨723, 2889, 2890⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨724, 2893, 2894⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨724, 2893, 2894⟩)
                )
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨725, 2897, 2898⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
                (.branch 1
                  (.leaf ⟨725, 2897, 2898⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨726, 2901, 2902⟩)
                )
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨726, 2901, 2902⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
                (.branch 1
                  (.leaf ⟨727, 2905, 2906⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨727, 2905, 2906⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨728, 2909, 2910⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨728, 2909, 2910⟩)
                )
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨729, 2913, 2914⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
                (.branch 1
                  (.leaf ⟨729, 2913, 2914⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨730, 2917, 2918⟩)
                )
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨730, 2917, 2918⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
                (.branch 1
                  (.leaf ⟨731, 2921, 2922⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨731, 2921, 2922⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨732, 2925, 2926⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨732, 2925, 2926⟩)
                )
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨733, 427039, 427039⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨733, 427039, 427039⟩)
                  (.leaf ⟨733, 427039, 427039⟩)
                )
                (.branch 1
                  (.leaf ⟨733, 427039, 427039⟩)
                  (.leaf ⟨733, 427039, 427039⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨734, 2935, 2936⟩)
                  (.leaf ⟨734, 2935, 2936⟩)
                )
                (.branch 1
                  (.leaf ⟨734, 2935, 2936⟩)
                  (.leaf ⟨734, 2935, 2936⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨734, 2935, 2936⟩)
                  (.leaf ⟨735, 427036, 427036⟩)
                )
                (.branch 1
                  (.leaf ⟨735, 427036, 427036⟩)
                  (.leaf ⟨735, 427036, 427036⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨735, 427036, 427036⟩)
                  (.leaf ⟨735, 427036, 427036⟩)
                )
                (.branch 1
                  (.leaf ⟨736, 2943, 2944⟩)
                  (.leaf ⟨736, 2943, 2944⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_5888_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨736, 2943, 2944⟩)
                  (.leaf ⟨736, 2943, 2944⟩)
                )
                (.branch 1
                  (.leaf ⟨736, 2943, 2944⟩)
                  (.leaf ⟨817, 427032, 427032⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨817, 427032, 427032⟩)
                  (.leaf ⟨817, 427032, 427032⟩)
                )
                (.branch 1
                  (.leaf ⟨817, 427032, 427032⟩)
                  (.leaf ⟨817, 427032, 427032⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨818, 3271, 3272⟩)
                  (.leaf ⟨818, 3271, 3272⟩)
                )
                (.branch 1
                  (.leaf ⟨818, 3271, 3272⟩)
                  (.leaf ⟨818, 3271, 3272⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨818, 3271, 3272⟩)
                  (.leaf ⟨819, 3275, 3276⟩)
                )
                (.branch 1
                  (.leaf ⟨819, 3275, 3276⟩)
                  (.leaf ⟨819, 3275, 3276⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨819, 3275, 3276⟩)
                  (.leaf ⟨819, 3275, 3276⟩)
                )
                (.branch 1
                  (.leaf ⟨820, 3279, 3280⟩)
                  (.leaf ⟨820, 3279, 3280⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨820, 3279, 3280⟩)
                  (.leaf ⟨820, 3279, 3280⟩)
                )
                (.branch 1
                  (.leaf ⟨820, 3279, 3280⟩)
                  (.leaf ⟨821, 3283, 3284⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨821, 3283, 3284⟩)
                  (.leaf ⟨821, 3283, 3284⟩)
                )
                (.branch 1
                  (.leaf ⟨821, 3283, 3284⟩)
                  (.leaf ⟨821, 3283, 3284⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨822, 3287, 3288⟩)
                  (.leaf ⟨822, 3287, 3288⟩)
                )
                (.branch 1
                  (.leaf ⟨822, 3287, 3288⟩)
                  (.leaf ⟨822, 3287, 3288⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨822, 3287, 3288⟩)
                  (.leaf ⟨823, 3291, 3292⟩)
                )
                (.branch 1
                  (.leaf ⟨823, 3291, 3292⟩)
                  (.leaf ⟨823, 3291, 3292⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨823, 3291, 3292⟩)
                  (.leaf ⟨823, 3291, 3292⟩)
                )
                (.branch 1
                  (.leaf ⟨824, 3295, 3296⟩)
                  (.leaf ⟨824, 3295, 3296⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨824, 3295, 3296⟩)
                  (.leaf ⟨824, 3295, 3296⟩)
                )
                (.branch 1
                  (.leaf ⟨824, 3295, 3296⟩)
                  (.leaf ⟨825, 3299, 3300⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨825, 3299, 3300⟩)
                  (.leaf ⟨825, 3299, 3300⟩)
                )
                (.branch 1
                  (.leaf ⟨825, 3299, 3300⟩)
                  (.leaf ⟨825, 3299, 3300⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨826, 3303, 3304⟩)
                  (.leaf ⟨826, 3303, 3304⟩)
                )
                (.branch 1
                  (.leaf ⟨826, 3303, 3304⟩)
                  (.leaf ⟨826, 3303, 3304⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨826, 3303, 3304⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
                (.branch 1
                  (.leaf ⟨721, 427023, 427024⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨721, 427023, 427024⟩)
                  (.leaf ⟨721, 427023, 427024⟩)
                )
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨722, 2885, 2886⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨722, 2885, 2886⟩)
                )
                (.branch 1
                  (.leaf ⟨722, 2885, 2886⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨723, 2889, 2890⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
                (.branch 1
                  (.leaf ⟨723, 2889, 2890⟩)
                  (.leaf ⟨723, 2889, 2890⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨724, 2893, 2894⟩)
                )
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨724, 2893, 2894⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨724, 2893, 2894⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
                (.branch 1
                  (.leaf ⟨725, 2897, 2898⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨725, 2897, 2898⟩)
                  (.leaf ⟨725, 2897, 2898⟩)
                )
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨726, 2901, 2902⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨726, 2901, 2902⟩)
                )
                (.branch 1
                  (.leaf ⟨726, 2901, 2902⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨727, 2905, 2906⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
                (.branch 1
                  (.leaf ⟨727, 2905, 2906⟩)
                  (.leaf ⟨727, 2905, 2906⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨728, 2909, 2910⟩)
                )
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨728, 2909, 2910⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨728, 2909, 2910⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
                (.branch 1
                  (.leaf ⟨729, 2913, 2914⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨729, 2913, 2914⟩)
                  (.leaf ⟨729, 2913, 2914⟩)
                )
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨730, 2917, 2918⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨730, 2917, 2918⟩)
                )
                (.branch 1
                  (.leaf ⟨730, 2917, 2918⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨731, 2921, 2922⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
                (.branch 1
                  (.leaf ⟨731, 2921, 2922⟩)
                  (.leaf ⟨731, 2921, 2922⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨732, 2925, 2926⟩)
                )
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨732, 2925, 2926⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨732, 2925, 2926⟩)
                  (.leaf ⟨827, 427040, 427040⟩)
                )
                (.branch 1
                  (.leaf ⟨827, 427040, 427040⟩)
                  (.leaf ⟨827, 427040, 427040⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨827, 427040, 427040⟩)
                  (.leaf ⟨827, 427040, 427040⟩)
                )
                (.branch 1
                  (.leaf ⟨828, 3311, 3312⟩)
                  (.leaf ⟨828, 3311, 3312⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨828, 3311, 3312⟩)
                  (.leaf ⟨828, 3311, 3312⟩)
                )
                (.branch 1
                  (.leaf ⟨828, 3311, 3312⟩)
                  (.leaf ⟨829, 427071, 427071⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨829, 427071, 427071⟩)
                  (.leaf ⟨829, 427071, 427071⟩)
                )
                (.branch 1
                  (.leaf ⟨829, 427071, 427071⟩)
                  (.leaf ⟨829, 427071, 427071⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨830, 3319, 3320⟩)
                  (.leaf ⟨830, 3319, 3320⟩)
                )
                (.branch 1
                  (.leaf ⟨830, 3319, 3320⟩)
                  (.leaf ⟨830, 3319, 3320⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨830, 3319, 3320⟩)
                  (.leaf ⟨831, 427067, 427067⟩)
                )
                (.branch 1
                  (.leaf ⟨831, 427067, 427067⟩)
                  (.leaf ⟨831, 427067, 427067⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨831, 427067, 427067⟩)
                  (.leaf ⟨831, 427067, 427067⟩)
                )
                (.branch 1
                  (.leaf ⟨832, 3327, 3328⟩)
                  (.leaf ⟨832, 3327, 3328⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨832, 3327, 3328⟩)
                  (.leaf ⟨832, 3327, 3328⟩)
                )
                (.branch 1
                  (.leaf ⟨832, 3327, 3328⟩)
                  (.leaf ⟨833, 3331, 3332⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨833, 3331, 3332⟩)
                  (.leaf ⟨833, 3331, 3332⟩)
                )
                (.branch 1
                  (.leaf ⟨833, 3331, 3332⟩)
                  (.leaf ⟨833, 3331, 3332⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨834, 3335, 3336⟩)
                  (.leaf ⟨834, 3335, 3336⟩)
                )
                (.branch 1
                  (.leaf ⟨834, 3335, 3336⟩)
                  (.leaf ⟨834, 3335, 3336⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨834, 3335, 3336⟩)
                  (.leaf ⟨835, 3339, 3340⟩)
                )
                (.branch 1
                  (.leaf ⟨835, 3339, 3340⟩)
                  (.leaf ⟨835, 3339, 3340⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨835, 3339, 3340⟩)
                  (.leaf ⟨835, 3339, 3340⟩)
                )
                (.branch 1
                  (.leaf ⟨836, 3343, 3344⟩)
                  (.leaf ⟨836, 3343, 3344⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨836, 3343, 3344⟩)
                  (.leaf ⟨836, 3343, 3344⟩)
                )
                (.branch 1
                  (.leaf ⟨836, 3343, 3344⟩)
                  (.leaf ⟨837, 3347, 3348⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨837, 3347, 3348⟩)
                  (.leaf ⟨837, 3347, 3348⟩)
                )
                (.branch 1
                  (.leaf ⟨837, 3347, 3348⟩)
                  (.leaf ⟨837, 3347, 3348⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨838, 3351, 3352⟩)
                  (.leaf ⟨838, 3351, 3352⟩)
                )
                (.branch 1
                  (.leaf ⟨838, 3351, 3352⟩)
                  (.leaf ⟨838, 3351, 3352⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨838, 3351, 3352⟩)
                  (.leaf ⟨839, 3355, 3356⟩)
                )
                (.branch 1
                  (.leaf ⟨839, 3355, 3356⟩)
                  (.leaf ⟨839, 3355, 3356⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨839, 3355, 3356⟩)
                  (.leaf ⟨839, 3355, 3356⟩)
                )
                (.branch 1
                  (.leaf ⟨840, 3359, 3360⟩)
                  (.leaf ⟨840, 3359, 3360⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨840, 3359, 3360⟩)
                  (.leaf ⟨840, 3359, 3360⟩)
                )
                (.branch 1
                  (.leaf ⟨840, 3359, 3360⟩)
                  (.leaf ⟨840, 3359, 3360⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨840, 3359, 3360⟩)
                  (.leaf ⟨840, 3359, 3360⟩)
                )
                (.branch 1
                  (.leaf ⟨826, 3303, 3304⟩)
                  (.leaf ⟨840, 3359, 3360⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨840, 3359, 3360⟩)
                  (.leaf ⟨840, 3359, 3360⟩)
                )
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨826, 3303, 3304⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨840, 3359, 3360⟩)
                  (.leaf ⟨840, 3359, 3360⟩)
                )
                (.branch 1
                  (.leaf ⟨816, 3263, 3264⟩)
                  (.leaf ⟨746, 2983, 2984⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨826, 3303, 3304⟩)
                  (.leaf ⟨840, 3359, 3360⟩)
                )
                (.branch 1
                  (.leaf ⟨816, 3263, 3264⟩)
                  (.leaf ⟨816, 3263, 3264⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨746, 2983, 2984⟩)
                  (.leaf ⟨826, 3303, 3304⟩)
                )
                (.branch 1
                  (.leaf ⟨840, 3359, 3360⟩)
                  (.leaf ⟨841, 427099, 427100⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨841, 427099, 427100⟩)
                  (.leaf ⟨3, 427047, 427048⟩)
                )
                (.branch 1
                  (.leaf ⟨842, 427103, 427104⟩)
                  (.leaf ⟨843, 427107, 427108⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨844, 427075, 427076⟩)
                  (.leaf ⟨844, 427075, 427076⟩)
                )
                (.branch 1
                  (.leaf ⟨5, 426183, 426184⟩)
                  (.leaf ⟨845, 427079, 427080⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨846, 427083, 427084⟩)
                  (.leaf ⟨847, 3379, 3380⟩)
                )
                (.branch 1
                  (.leaf ⟨847, 3379, 3380⟩)
                  (.leaf ⟨747, 23, 24⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨848, 3383, 3384⟩)
                  (.leaf ⟨849, 3387, 3388⟩)
                )
                (.branch 1
                  (.leaf ⟨850, 3391, 3392⟩)
                  (.leaf ⟨850, 3391, 3392⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨748, 2991, 2992⟩)
                  (.leaf ⟨851, 3395, 3396⟩)
                )
                (.branch 1
                  (.leaf ⟨852, 3399, 3400⟩)
                  (.leaf ⟨853, 3403, 3404⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨853, 3403, 3404⟩)
                  (.leaf ⟨749, 2995, 2996⟩)
                )
                (.branch 1
                  (.leaf ⟨854, 3407, 3408⟩)
                  (.leaf ⟨855, 3411, 3412⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨856, 3415, 3416⟩)
                  (.leaf ⟨856, 3415, 3416⟩)
                )
                (.branch 1
                  (.leaf ⟨750, 2999, 3000⟩)
                  (.leaf ⟨857, 3419, 3420⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨858, 3423, 3424⟩)
                  (.leaf ⟨859, 3427, 3428⟩)
                )
                (.branch 1
                  (.leaf ⟨859, 3427, 3428⟩)
                  (.leaf ⟨751, 3003, 3004⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨860, 3431, 3432⟩)
                  (.leaf ⟨861, 3435, 3436⟩)
                )
                (.branch 1
                  (.leaf ⟨862, 3439, 3440⟩)
                  (.leaf ⟨862, 3439, 3440⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨752, 3007, 3008⟩)
                  (.leaf ⟨863, 3443, 3444⟩)
                )
                (.branch 1
                  (.leaf ⟨864, 3447, 3448⟩)
                  (.leaf ⟨865, 3451, 3452⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨865, 3451, 3452⟩)
                  (.leaf ⟨753, 3011, 3012⟩)
                )
                (.branch 1
                  (.leaf ⟨866, 3455, 3456⟩)
                  (.leaf ⟨867, 3459, 3460⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨868, 3463, 3464⟩)
                  (.leaf ⟨868, 3463, 3464⟩)
                )
                (.branch 1
                  (.leaf ⟨754, 3015, 3016⟩)
                  (.leaf ⟨869, 3467, 3468⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨870, 3471, 3472⟩)
                  (.leaf ⟨871, 3475, 3476⟩)
                )
                (.branch 1
                  (.leaf ⟨871, 3475, 3476⟩)
                  (.leaf ⟨755, 3019, 3020⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_5632_512 : Balanced.RowTree Cell :=
  .branch 256 cache_5632_256 cache_5888_256
noncomputable def cache_5120_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_5120_512 cache_5632_512
noncomputable def cache_4096_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_4096_1024 cache_5120_1024
noncomputable def cache_6144_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨872, 3479, 3480⟩)
                  (.leaf ⟨873, 3483, 3484⟩)
                )
                (.branch 1
                  (.leaf ⟨874, 3487, 3488⟩)
                  (.leaf ⟨874, 3487, 3488⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨756, 3023, 3024⟩)
                  (.leaf ⟨875, 3491, 3492⟩)
                )
                (.branch 1
                  (.leaf ⟨876, 3495, 3496⟩)
                  (.leaf ⟨877, 3499, 3500⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨877, 3499, 3500⟩)
                  (.leaf ⟨757, 3027, 3028⟩)
                )
                (.branch 1
                  (.leaf ⟨878, 3503, 3504⟩)
                  (.leaf ⟨879, 3507, 3508⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨880, 3511, 3512⟩)
                  (.leaf ⟨880, 3511, 3512⟩)
                )
                (.branch 1
                  (.leaf ⟨758, 3031, 3032⟩)
                  (.leaf ⟨881, 3515, 3516⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨882, 3519, 3520⟩)
                  (.leaf ⟨883, 3523, 3524⟩)
                )
                (.branch 1
                  (.leaf ⟨883, 3523, 3524⟩)
                  (.leaf ⟨759, 3035, 3036⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨884, 3527, 3528⟩)
                  (.leaf ⟨885, 3531, 3532⟩)
                )
                (.branch 1
                  (.leaf ⟨886, 427051, 427052⟩)
                  (.leaf ⟨886, 427051, 427052⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨760, 427027, 427028⟩)
                  (.leaf ⟨887, 427055, 427056⟩)
                )
                (.branch 1
                  (.leaf ⟨888, 427059, 427060⟩)
                  (.leaf ⟨889, 3545, 3546⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨889, 3545, 3546⟩)
                  (.leaf ⟨761, 3041, 3042⟩)
                )
                (.branch 1
                  (.leaf ⟨890, 3549, 3550⟩)
                  (.leaf ⟨891, 3553, 3554⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨892, 3557, 3558⟩)
                  (.leaf ⟨892, 3557, 3558⟩)
                )
                (.branch 1
                  (.leaf ⟨762, 3045, 3046⟩)
                  (.leaf ⟨893, 3561, 3562⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨894, 3565, 3566⟩)
                  (.leaf ⟨895, 3569, 3570⟩)
                )
                (.branch 1
                  (.leaf ⟨895, 3569, 3570⟩)
                  (.leaf ⟨763, 3049, 3050⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨896, 3573, 3574⟩)
                  (.leaf ⟨897, 3577, 3578⟩)
                )
                (.branch 1
                  (.leaf ⟨898, 3581, 3582⟩)
                  (.leaf ⟨898, 3581, 3582⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨764, 3053, 3054⟩)
                  (.leaf ⟨899, 3585, 3586⟩)
                )
                (.branch 1
                  (.leaf ⟨900, 3589, 3590⟩)
                  (.leaf ⟨901, 3593, 3594⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨901, 3593, 3594⟩)
                  (.leaf ⟨765, 3057, 3058⟩)
                )
                (.branch 1
                  (.leaf ⟨902, 3597, 3598⟩)
                  (.leaf ⟨903, 3601, 3602⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨904, 3605, 3606⟩)
                  (.leaf ⟨904, 3605, 3606⟩)
                )
                (.branch 1
                  (.leaf ⟨766, 3061, 3062⟩)
                  (.leaf ⟨905, 3609, 3610⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨906, 3613, 3614⟩)
                  (.leaf ⟨907, 3617, 3618⟩)
                )
                (.branch 1
                  (.leaf ⟨907, 3617, 3618⟩)
                  (.leaf ⟨767, 3065, 3066⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨908, 3621, 3622⟩)
                  (.leaf ⟨909, 3625, 3626⟩)
                )
                (.branch 1
                  (.leaf ⟨910, 3629, 3630⟩)
                  (.leaf ⟨910, 3629, 3630⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨768, 3069, 3070⟩)
                  (.leaf ⟨911, 3633, 3634⟩)
                )
                (.branch 1
                  (.leaf ⟨912, 3637, 3638⟩)
                  (.leaf ⟨913, 3641, 3642⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨913, 3641, 3642⟩)
                  (.leaf ⟨769, 3073, 3074⟩)
                )
                (.branch 1
                  (.leaf ⟨914, 3645, 3646⟩)
                  (.leaf ⟨915, 3649, 3650⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨916, 3653, 3654⟩)
                  (.leaf ⟨916, 3653, 3654⟩)
                )
                (.branch 1
                  (.leaf ⟨770, 3077, 3078⟩)
                  (.leaf ⟨917, 3657, 3658⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨918, 3661, 3662⟩)
                  (.leaf ⟨919, 3665, 3666⟩)
                )
                (.branch 1
                  (.leaf ⟨919, 3665, 3666⟩)
                  (.leaf ⟨771, 3081, 3082⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨920, 3669, 3670⟩)
                  (.leaf ⟨921, 3673, 3674⟩)
                )
                (.branch 1
                  (.leaf ⟨922, 3677, 3678⟩)
                  (.leaf ⟨922, 3677, 3678⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨772, 3085, 3086⟩)
                  (.leaf ⟨923, 3681, 3682⟩)
                )
                (.branch 1
                  (.leaf ⟨924, 3685, 3686⟩)
                  (.leaf ⟨925, 3691, 3692⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨925, 3691, 3692⟩)
                  (.leaf ⟨773, 3091, 3092⟩)
                )
                (.branch 1
                  (.leaf ⟨926, 3695, 3696⟩)
                  (.leaf ⟨927, 3699, 3700⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨928, 427087, 427088⟩)
                  (.leaf ⟨928, 427087, 427088⟩)
                )
                (.branch 1
                  (.leaf ⟨774, 427043, 427044⟩)
                  (.leaf ⟨929, 427091, 427092⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨930, 427095, 427096⟩)
                  (.leaf ⟨931, 3713, 3714⟩)
                )
                (.branch 1
                  (.leaf ⟨931, 3713, 3714⟩)
                  (.leaf ⟨775, 3097, 3098⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨932, 3717, 3718⟩)
                  (.leaf ⟨933, 3721, 3722⟩)
                )
                (.branch 1
                  (.leaf ⟨934, 3725, 3726⟩)
                  (.leaf ⟨934, 3725, 3726⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨776, 3101, 3102⟩)
                  (.leaf ⟨935, 3729, 3730⟩)
                )
                (.branch 1
                  (.leaf ⟨936, 3733, 3734⟩)
                  (.leaf ⟨937, 3737, 3738⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨937, 3737, 3738⟩)
                  (.leaf ⟨777, 3105, 3106⟩)
                )
                (.branch 1
                  (.leaf ⟨938, 3741, 3742⟩)
                  (.leaf ⟨939, 3745, 3746⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨940, 3749, 3750⟩)
                  (.leaf ⟨940, 3749, 3750⟩)
                )
                (.branch 1
                  (.leaf ⟨778, 3109, 3110⟩)
                  (.leaf ⟨941, 3753, 3754⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨942, 3757, 3758⟩)
                  (.leaf ⟨943, 3761, 3762⟩)
                )
                (.branch 1
                  (.leaf ⟨943, 3761, 3762⟩)
                  (.leaf ⟨779, 3113, 3114⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨944, 3765, 3766⟩)
                  (.leaf ⟨945, 3769, 3770⟩)
                )
                (.branch 1
                  (.leaf ⟨946, 3773, 3774⟩)
                  (.leaf ⟨946, 3773, 3774⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨780, 3117, 3118⟩)
                  (.leaf ⟨947, 3777, 3778⟩)
                )
                (.branch 1
                  (.leaf ⟨948, 3781, 3782⟩)
                  (.leaf ⟨949, 3785, 3786⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨949, 3785, 3786⟩)
                  (.leaf ⟨781, 3121, 3122⟩)
                )
                (.branch 1
                  (.leaf ⟨950, 3789, 3790⟩)
                  (.leaf ⟨951, 3793, 3794⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨952, 3797, 3798⟩)
                  (.leaf ⟨952, 3797, 3798⟩)
                )
                (.branch 1
                  (.leaf ⟨782, 3125, 3126⟩)
                  (.leaf ⟨953, 3801, 3802⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨954, 3805, 3806⟩)
                  (.leaf ⟨955, 3809, 3810⟩)
                )
                (.branch 1
                  (.leaf ⟨955, 3809, 3810⟩)
                  (.leaf ⟨783, 3129, 3130⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨956, 3813, 3814⟩)
                  (.leaf ⟨957, 3817, 3818⟩)
                )
                (.branch 1
                  (.leaf ⟨958, 3821, 3822⟩)
                  (.leaf ⟨958, 3821, 3822⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨784, 3133, 3134⟩)
                  (.leaf ⟨959, 3825, 3826⟩)
                )
                (.branch 1
                  (.leaf ⟨960, 3829, 3830⟩)
                  (.leaf ⟨961, 3833, 3834⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨961, 3833, 3834⟩)
                  (.leaf ⟨785, 3137, 3138⟩)
                )
                (.branch 1
                  (.leaf ⟨962, 3837, 3838⟩)
                  (.leaf ⟨963, 3841, 3842⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨964, 3845, 3846⟩)
                  (.leaf ⟨964, 3845, 3846⟩)
                )
                (.branch 1
                  (.leaf ⟨786, 3141, 3142⟩)
                  (.leaf ⟨965, 3849, 3850⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨966, 3853, 3854⟩)
                  (.leaf ⟨967, 3859, 3860⟩)
                )
                (.branch 1
                  (.leaf ⟨967, 3859, 3860⟩)
                  (.leaf ⟨787, 3147, 3148⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨968, 3863, 3864⟩)
                  (.leaf ⟨969, 3867, 3868⟩)
                )
                (.branch 1
                  (.leaf ⟨970, 3859, 3692⟩)
                  (.leaf ⟨970, 3859, 3692⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨788, 3147, 3092⟩)
                  (.leaf ⟨971, 3863, 3696⟩)
                )
                (.branch 1
                  (.leaf ⟨972, 3867, 3700⟩)
                  (.leaf ⟨973, 3883, 3884⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨973, 3883, 3884⟩)
                  (.leaf ⟨789, 3155, 3156⟩)
                )
                (.branch 1
                  (.leaf ⟨974, 3887, 3888⟩)
                  (.leaf ⟨975, 3891, 3892⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨886, 427051, 427052⟩)
                  (.leaf ⟨886, 427051, 427052⟩)
                )
                (.branch 1
                  (.leaf ⟨760, 427027, 427028⟩)
                  (.leaf ⟨887, 427055, 427056⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨888, 427059, 427060⟩)
                  (.leaf ⟨889, 3545, 3546⟩)
                )
                (.branch 1
                  (.leaf ⟨889, 3545, 3546⟩)
                  (.leaf ⟨761, 3041, 3042⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨890, 3549, 3550⟩)
                  (.leaf ⟨891, 3553, 3554⟩)
                )
                (.branch 1
                  (.leaf ⟨892, 3557, 3558⟩)
                  (.leaf ⟨892, 3557, 3558⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨762, 3045, 3046⟩)
                  (.leaf ⟨893, 3561, 3562⟩)
                )
                (.branch 1
                  (.leaf ⟨894, 3565, 3566⟩)
                  (.leaf ⟨895, 3569, 3570⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨895, 3569, 3570⟩)
                  (.leaf ⟨763, 3049, 3050⟩)
                )
                (.branch 1
                  (.leaf ⟨896, 3573, 3574⟩)
                  (.leaf ⟨897, 3577, 3578⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨898, 3581, 3582⟩)
                  (.leaf ⟨898, 3581, 3582⟩)
                )
                (.branch 1
                  (.leaf ⟨764, 3053, 3054⟩)
                  (.leaf ⟨899, 3585, 3586⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨900, 3589, 3590⟩)
                  (.leaf ⟨901, 3593, 3594⟩)
                )
                (.branch 1
                  (.leaf ⟨901, 3593, 3594⟩)
                  (.leaf ⟨765, 3057, 3058⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨902, 3597, 3598⟩)
                  (.leaf ⟨903, 3601, 3602⟩)
                )
                (.branch 1
                  (.leaf ⟨904, 3605, 3606⟩)
                  (.leaf ⟨904, 3605, 3606⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨766, 3061, 3062⟩)
                  (.leaf ⟨905, 3609, 3610⟩)
                )
                (.branch 1
                  (.leaf ⟨906, 3613, 3614⟩)
                  (.leaf ⟨907, 3617, 3618⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨907, 3617, 3618⟩)
                  (.leaf ⟨767, 3065, 3066⟩)
                )
                (.branch 1
                  (.leaf ⟨908, 3621, 3622⟩)
                  (.leaf ⟨909, 3625, 3626⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨910, 3629, 3630⟩)
                  (.leaf ⟨910, 3629, 3630⟩)
                )
                (.branch 1
                  (.leaf ⟨768, 3069, 3070⟩)
                  (.leaf ⟨911, 3633, 3634⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨912, 3637, 3638⟩)
                  (.leaf ⟨913, 3641, 3642⟩)
                )
                (.branch 1
                  (.leaf ⟨913, 3641, 3642⟩)
                  (.leaf ⟨769, 3073, 3074⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨914, 3645, 3646⟩)
                  (.leaf ⟨915, 3649, 3650⟩)
                )
                (.branch 1
                  (.leaf ⟨916, 3653, 3654⟩)
                  (.leaf ⟨916, 3653, 3654⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨770, 3077, 3078⟩)
                  (.leaf ⟨917, 3657, 3658⟩)
                )
                (.branch 1
                  (.leaf ⟨918, 3661, 3662⟩)
                  (.leaf ⟨919, 3665, 3666⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨919, 3665, 3666⟩)
                  (.leaf ⟨771, 3081, 3082⟩)
                )
                (.branch 1
                  (.leaf ⟨920, 3669, 3670⟩)
                  (.leaf ⟨921, 3673, 3674⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨922, 3677, 3678⟩)
                  (.leaf ⟨922, 3677, 3678⟩)
                )
                (.branch 1
                  (.leaf ⟨772, 3085, 3086⟩)
                  (.leaf ⟨923, 3681, 3682⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨924, 3685, 3686⟩)
                  (.leaf ⟨925, 3691, 3692⟩)
                )
                (.branch 1
                  (.leaf ⟨925, 3691, 3692⟩)
                  (.leaf ⟨773, 3091, 3092⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨926, 3695, 3696⟩)
                  (.leaf ⟨927, 3699, 3700⟩)
                )
                (.branch 1
                  (.leaf ⟨928, 427087, 427088⟩)
                  (.leaf ⟨928, 427087, 427088⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨774, 427043, 427044⟩)
                  (.leaf ⟨929, 427091, 427092⟩)
                )
                (.branch 1
                  (.leaf ⟨930, 427095, 427096⟩)
                  (.leaf ⟨931, 3713, 3714⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨931, 3713, 3714⟩)
                  (.leaf ⟨775, 3097, 3098⟩)
                )
                (.branch 1
                  (.leaf ⟨932, 3717, 3718⟩)
                  (.leaf ⟨933, 3721, 3722⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨934, 3725, 3726⟩)
                  (.leaf ⟨934, 3725, 3726⟩)
                )
                (.branch 1
                  (.leaf ⟨776, 3101, 3102⟩)
                  (.leaf ⟨935, 3729, 3730⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_6400_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨936, 3733, 3734⟩)
                  (.leaf ⟨937, 3737, 3738⟩)
                )
                (.branch 1
                  (.leaf ⟨937, 3737, 3738⟩)
                  (.leaf ⟨777, 3105, 3106⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨938, 3741, 3742⟩)
                  (.leaf ⟨939, 3745, 3746⟩)
                )
                (.branch 1
                  (.leaf ⟨940, 3749, 3750⟩)
                  (.leaf ⟨940, 3749, 3750⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨778, 3109, 3110⟩)
                  (.leaf ⟨941, 3753, 3754⟩)
                )
                (.branch 1
                  (.leaf ⟨942, 3757, 3758⟩)
                  (.leaf ⟨943, 3761, 3762⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨943, 3761, 3762⟩)
                  (.leaf ⟨779, 3113, 3114⟩)
                )
                (.branch 1
                  (.leaf ⟨944, 3765, 3766⟩)
                  (.leaf ⟨945, 3769, 3770⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨946, 3773, 3774⟩)
                  (.leaf ⟨946, 3773, 3774⟩)
                )
                (.branch 1
                  (.leaf ⟨780, 3117, 3118⟩)
                  (.leaf ⟨947, 3777, 3778⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨948, 3781, 3782⟩)
                  (.leaf ⟨949, 3785, 3786⟩)
                )
                (.branch 1
                  (.leaf ⟨949, 3785, 3786⟩)
                  (.leaf ⟨781, 3121, 3122⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨950, 3789, 3790⟩)
                  (.leaf ⟨951, 3793, 3794⟩)
                )
                (.branch 1
                  (.leaf ⟨952, 3797, 3798⟩)
                  (.leaf ⟨952, 3797, 3798⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨782, 3125, 3126⟩)
                  (.leaf ⟨953, 3801, 3802⟩)
                )
                (.branch 1
                  (.leaf ⟨954, 3805, 3806⟩)
                  (.leaf ⟨955, 3809, 3810⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨955, 3809, 3810⟩)
                  (.leaf ⟨783, 3129, 3130⟩)
                )
                (.branch 1
                  (.leaf ⟨956, 3813, 3814⟩)
                  (.leaf ⟨957, 3817, 3818⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨958, 3821, 3822⟩)
                  (.leaf ⟨958, 3821, 3822⟩)
                )
                (.branch 1
                  (.leaf ⟨784, 3133, 3134⟩)
                  (.leaf ⟨959, 3825, 3826⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨960, 3829, 3830⟩)
                  (.leaf ⟨961, 3833, 3834⟩)
                )
                (.branch 1
                  (.leaf ⟨961, 3833, 3834⟩)
                  (.leaf ⟨785, 3137, 3138⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨962, 3837, 3838⟩)
                  (.leaf ⟨963, 3841, 3842⟩)
                )
                (.branch 1
                  (.leaf ⟨964, 3845, 3846⟩)
                  (.leaf ⟨964, 3845, 3846⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨786, 3141, 3142⟩)
                  (.leaf ⟨965, 3849, 3850⟩)
                )
                (.branch 1
                  (.leaf ⟨966, 3853, 3854⟩)
                  (.leaf ⟨967, 3859, 3860⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨967, 3859, 3860⟩)
                  (.leaf ⟨787, 3147, 3148⟩)
                )
                (.branch 1
                  (.leaf ⟨968, 3863, 3864⟩)
                  (.leaf ⟨969, 3867, 3868⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨970, 3859, 3692⟩)
                  (.leaf ⟨970, 3859, 3692⟩)
                )
                (.branch 1
                  (.leaf ⟨788, 3147, 3092⟩)
                  (.leaf ⟨971, 3863, 3696⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨972, 3867, 3700⟩)
                  (.leaf ⟨973, 3883, 3884⟩)
                )
                (.branch 1
                  (.leaf ⟨973, 3883, 3884⟩)
                  (.leaf ⟨789, 3155, 3156⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨974, 3887, 3888⟩)
                  (.leaf ⟨975, 3891, 3892⟩)
                )
                (.branch 1
                  (.leaf ⟨973, 3883, 3884⟩)
                  (.leaf ⟨973, 3883, 3884⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨789, 3155, 3156⟩)
                  (.leaf ⟨974, 3887, 3888⟩)
                )
                (.branch 1
                  (.leaf ⟨975, 3891, 3892⟩)
                  (.leaf ⟨976, 3895, 3896⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨976, 3895, 3896⟩)
                  (.leaf ⟨790, 3159, 3160⟩)
                )
                (.branch 1
                  (.leaf ⟨977, 3899, 3900⟩)
                  (.leaf ⟨978, 3903, 3904⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨886, 427051, 427052⟩)
                  (.leaf ⟨886, 427051, 427052⟩)
                )
                (.branch 1
                  (.leaf ⟨760, 427027, 427028⟩)
                  (.leaf ⟨887, 427055, 427056⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨888, 427059, 427060⟩)
                  (.leaf ⟨889, 3545, 3546⟩)
                )
                (.branch 1
                  (.leaf ⟨889, 3545, 3546⟩)
                  (.leaf ⟨761, 3041, 3042⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨890, 3549, 3550⟩)
                  (.leaf ⟨891, 3553, 3554⟩)
                )
                (.branch 1
                  (.leaf ⟨892, 3557, 3558⟩)
                  (.leaf ⟨892, 3557, 3558⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨762, 3045, 3046⟩)
                  (.leaf ⟨893, 3561, 3562⟩)
                )
                (.branch 1
                  (.leaf ⟨894, 3565, 3566⟩)
                  (.leaf ⟨895, 3569, 3570⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨895, 3569, 3570⟩)
                  (.leaf ⟨763, 3049, 3050⟩)
                )
                (.branch 1
                  (.leaf ⟨896, 3573, 3574⟩)
                  (.leaf ⟨897, 3577, 3578⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨898, 3581, 3582⟩)
                  (.leaf ⟨898, 3581, 3582⟩)
                )
                (.branch 1
                  (.leaf ⟨764, 3053, 3054⟩)
                  (.leaf ⟨899, 3585, 3586⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨900, 3589, 3590⟩)
                  (.leaf ⟨901, 3593, 3594⟩)
                )
                (.branch 1
                  (.leaf ⟨901, 3593, 3594⟩)
                  (.leaf ⟨765, 3057, 3058⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨902, 3597, 3598⟩)
                  (.leaf ⟨903, 3601, 3602⟩)
                )
                (.branch 1
                  (.leaf ⟨904, 3605, 3606⟩)
                  (.leaf ⟨904, 3605, 3606⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨766, 3061, 3062⟩)
                  (.leaf ⟨905, 3609, 3610⟩)
                )
                (.branch 1
                  (.leaf ⟨906, 3613, 3614⟩)
                  (.leaf ⟨907, 3617, 3618⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨907, 3617, 3618⟩)
                  (.leaf ⟨767, 3065, 3066⟩)
                )
                (.branch 1
                  (.leaf ⟨908, 3621, 3622⟩)
                  (.leaf ⟨909, 3625, 3626⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨910, 3629, 3630⟩)
                  (.leaf ⟨910, 3629, 3630⟩)
                )
                (.branch 1
                  (.leaf ⟨768, 3069, 3070⟩)
                  (.leaf ⟨911, 3633, 3634⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨912, 3637, 3638⟩)
                  (.leaf ⟨913, 3641, 3642⟩)
                )
                (.branch 1
                  (.leaf ⟨913, 3641, 3642⟩)
                  (.leaf ⟨769, 3073, 3074⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨914, 3645, 3646⟩)
                  (.leaf ⟨915, 3649, 3650⟩)
                )
                (.branch 1
                  (.leaf ⟨916, 3653, 3654⟩)
                  (.leaf ⟨916, 3653, 3654⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨770, 3077, 3078⟩)
                  (.leaf ⟨917, 3657, 3658⟩)
                )
                (.branch 1
                  (.leaf ⟨918, 3661, 3662⟩)
                  (.leaf ⟨919, 3665, 3666⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨919, 3665, 3666⟩)
                  (.leaf ⟨771, 3081, 3082⟩)
                )
                (.branch 1
                  (.leaf ⟨920, 3669, 3670⟩)
                  (.leaf ⟨921, 3673, 3674⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨922, 3677, 3678⟩)
                  (.leaf ⟨922, 3677, 3678⟩)
                )
                (.branch 1
                  (.leaf ⟨772, 3085, 3086⟩)
                  (.leaf ⟨923, 3681, 3682⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨924, 3685, 3686⟩)
                  (.leaf ⟨925, 3691, 3692⟩)
                )
                (.branch 1
                  (.leaf ⟨925, 3691, 3692⟩)
                  (.leaf ⟨773, 3091, 3092⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨926, 3695, 3696⟩)
                  (.leaf ⟨927, 3699, 3700⟩)
                )
                (.branch 1
                  (.leaf ⟨928, 427087, 427088⟩)
                  (.leaf ⟨928, 427087, 427088⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨774, 427043, 427044⟩)
                  (.leaf ⟨929, 427091, 427092⟩)
                )
                (.branch 1
                  (.leaf ⟨930, 427095, 427096⟩)
                  (.leaf ⟨931, 3713, 3714⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨931, 3713, 3714⟩)
                  (.leaf ⟨775, 3097, 3098⟩)
                )
                (.branch 1
                  (.leaf ⟨932, 3717, 3718⟩)
                  (.leaf ⟨933, 3721, 3722⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨934, 3725, 3726⟩)
                  (.leaf ⟨934, 3725, 3726⟩)
                )
                (.branch 1
                  (.leaf ⟨776, 3101, 3102⟩)
                  (.leaf ⟨935, 3729, 3730⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨936, 3733, 3734⟩)
                  (.leaf ⟨937, 3737, 3738⟩)
                )
                (.branch 1
                  (.leaf ⟨937, 3737, 3738⟩)
                  (.leaf ⟨777, 3105, 3106⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨938, 3741, 3742⟩)
                  (.leaf ⟨939, 3745, 3746⟩)
                )
                (.branch 1
                  (.leaf ⟨940, 3749, 3750⟩)
                  (.leaf ⟨940, 3749, 3750⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨778, 3109, 3110⟩)
                  (.leaf ⟨941, 3753, 3754⟩)
                )
                (.branch 1
                  (.leaf ⟨942, 3757, 3758⟩)
                  (.leaf ⟨943, 3761, 3762⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨943, 3761, 3762⟩)
                  (.leaf ⟨779, 3113, 3114⟩)
                )
                (.branch 1
                  (.leaf ⟨944, 3765, 3766⟩)
                  (.leaf ⟨945, 3769, 3770⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨946, 3773, 3774⟩)
                  (.leaf ⟨946, 3773, 3774⟩)
                )
                (.branch 1
                  (.leaf ⟨780, 3117, 3118⟩)
                  (.leaf ⟨947, 3777, 3778⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨948, 3781, 3782⟩)
                  (.leaf ⟨949, 3785, 3786⟩)
                )
                (.branch 1
                  (.leaf ⟨949, 3785, 3786⟩)
                  (.leaf ⟨781, 3121, 3122⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨950, 3789, 3790⟩)
                  (.leaf ⟨951, 3793, 3794⟩)
                )
                (.branch 1
                  (.leaf ⟨952, 3797, 3798⟩)
                  (.leaf ⟨952, 3797, 3798⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨782, 3125, 3126⟩)
                  (.leaf ⟨953, 3801, 3802⟩)
                )
                (.branch 1
                  (.leaf ⟨954, 3805, 3806⟩)
                  (.leaf ⟨955, 3809, 3810⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨955, 3809, 3810⟩)
                  (.leaf ⟨783, 3129, 3130⟩)
                )
                (.branch 1
                  (.leaf ⟨956, 3813, 3814⟩)
                  (.leaf ⟨957, 3817, 3818⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨958, 3821, 3822⟩)
                  (.leaf ⟨958, 3821, 3822⟩)
                )
                (.branch 1
                  (.leaf ⟨784, 3133, 3134⟩)
                  (.leaf ⟨959, 3825, 3826⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨960, 3829, 3830⟩)
                  (.leaf ⟨961, 3833, 3834⟩)
                )
                (.branch 1
                  (.leaf ⟨961, 3833, 3834⟩)
                  (.leaf ⟨785, 3137, 3138⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨962, 3837, 3838⟩)
                  (.leaf ⟨963, 3841, 3842⟩)
                )
                (.branch 1
                  (.leaf ⟨964, 3845, 3846⟩)
                  (.leaf ⟨964, 3845, 3846⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨786, 3141, 3142⟩)
                  (.leaf ⟨965, 3849, 3850⟩)
                )
                (.branch 1
                  (.leaf ⟨966, 3853, 3854⟩)
                  (.leaf ⟨967, 3859, 3860⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨967, 3859, 3860⟩)
                  (.leaf ⟨787, 3147, 3148⟩)
                )
                (.branch 1
                  (.leaf ⟨968, 3863, 3864⟩)
                  (.leaf ⟨969, 3867, 3868⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨970, 3859, 3692⟩)
                  (.leaf ⟨970, 3859, 3692⟩)
                )
                (.branch 1
                  (.leaf ⟨788, 3147, 3092⟩)
                  (.leaf ⟨971, 3863, 3696⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨972, 3867, 3700⟩)
                  (.leaf ⟨973, 3883, 3884⟩)
                )
                (.branch 1
                  (.leaf ⟨973, 3883, 3884⟩)
                  (.leaf ⟨789, 3155, 3156⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨974, 3887, 3888⟩)
                  (.leaf ⟨975, 3891, 3892⟩)
                )
                (.branch 1
                  (.leaf ⟨928, 427087, 427088⟩)
                  (.leaf ⟨928, 427087, 427088⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨774, 427043, 427044⟩)
                  (.leaf ⟨929, 427091, 427092⟩)
                )
                (.branch 1
                  (.leaf ⟨930, 427095, 427096⟩)
                  (.leaf ⟨931, 3713, 3714⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨931, 3713, 3714⟩)
                  (.leaf ⟨775, 3097, 3098⟩)
                )
                (.branch 1
                  (.leaf ⟨932, 3717, 3718⟩)
                  (.leaf ⟨933, 3721, 3722⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨934, 3725, 3726⟩)
                  (.leaf ⟨934, 3725, 3726⟩)
                )
                (.branch 1
                  (.leaf ⟨776, 3101, 3102⟩)
                  (.leaf ⟨935, 3729, 3730⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨936, 3733, 3734⟩)
                  (.leaf ⟨937, 3737, 3738⟩)
                )
                (.branch 1
                  (.leaf ⟨937, 3737, 3738⟩)
                  (.leaf ⟨777, 3105, 3106⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨938, 3741, 3742⟩)
                  (.leaf ⟨939, 3745, 3746⟩)
                )
                (.branch 1
                  (.leaf ⟨940, 3749, 3750⟩)
                  (.leaf ⟨940, 3749, 3750⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨778, 3109, 3110⟩)
                  (.leaf ⟨941, 3753, 3754⟩)
                )
                (.branch 1
                  (.leaf ⟨942, 3757, 3758⟩)
                  (.leaf ⟨943, 3761, 3762⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨943, 3761, 3762⟩)
                  (.leaf ⟨779, 3113, 3114⟩)
                )
                (.branch 1
                  (.leaf ⟨944, 3765, 3766⟩)
                  (.leaf ⟨945, 3769, 3770⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_6144_512 : Balanced.RowTree Cell :=
  .branch 256 cache_6144_256 cache_6400_256
noncomputable def cache_6656_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨946, 3773, 3774⟩)
                  (.leaf ⟨946, 3773, 3774⟩)
                )
                (.branch 1
                  (.leaf ⟨780, 3117, 3118⟩)
                  (.leaf ⟨947, 3777, 3778⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨948, 3781, 3782⟩)
                  (.leaf ⟨949, 3785, 3786⟩)
                )
                (.branch 1
                  (.leaf ⟨949, 3785, 3786⟩)
                  (.leaf ⟨781, 3121, 3122⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨950, 3789, 3790⟩)
                  (.leaf ⟨951, 3793, 3794⟩)
                )
                (.branch 1
                  (.leaf ⟨952, 3797, 3798⟩)
                  (.leaf ⟨952, 3797, 3798⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨782, 3125, 3126⟩)
                  (.leaf ⟨953, 3801, 3802⟩)
                )
                (.branch 1
                  (.leaf ⟨954, 3805, 3806⟩)
                  (.leaf ⟨955, 3809, 3810⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨955, 3809, 3810⟩)
                  (.leaf ⟨783, 3129, 3130⟩)
                )
                (.branch 1
                  (.leaf ⟨956, 3813, 3814⟩)
                  (.leaf ⟨957, 3817, 3818⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨958, 3821, 3822⟩)
                  (.leaf ⟨958, 3821, 3822⟩)
                )
                (.branch 1
                  (.leaf ⟨784, 3133, 3134⟩)
                  (.leaf ⟨959, 3825, 3826⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨960, 3829, 3830⟩)
                  (.leaf ⟨961, 3833, 3834⟩)
                )
                (.branch 1
                  (.leaf ⟨961, 3833, 3834⟩)
                  (.leaf ⟨785, 3137, 3138⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨962, 3837, 3838⟩)
                  (.leaf ⟨963, 3841, 3842⟩)
                )
                (.branch 1
                  (.leaf ⟨964, 3845, 3846⟩)
                  (.leaf ⟨964, 3845, 3846⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨786, 3141, 3142⟩)
                  (.leaf ⟨965, 3849, 3850⟩)
                )
                (.branch 1
                  (.leaf ⟨966, 3853, 3854⟩)
                  (.leaf ⟨967, 3859, 3860⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨967, 3859, 3860⟩)
                  (.leaf ⟨787, 3147, 3148⟩)
                )
                (.branch 1
                  (.leaf ⟨968, 3863, 3864⟩)
                  (.leaf ⟨969, 3867, 3868⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨886, 427051, 427052⟩)
                  (.leaf ⟨886, 427051, 427052⟩)
                )
                (.branch 1
                  (.leaf ⟨760, 427027, 427028⟩)
                  (.leaf ⟨887, 427055, 427056⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨888, 427059, 427060⟩)
                  (.leaf ⟨889, 3545, 3546⟩)
                )
                (.branch 1
                  (.leaf ⟨889, 3545, 3546⟩)
                  (.leaf ⟨761, 3041, 3042⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨890, 3549, 3550⟩)
                  (.leaf ⟨891, 3553, 3554⟩)
                )
                (.branch 1
                  (.leaf ⟨892, 3557, 3558⟩)
                  (.leaf ⟨892, 3557, 3558⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨762, 3045, 3046⟩)
                  (.leaf ⟨893, 3561, 3562⟩)
                )
                (.branch 1
                  (.leaf ⟨894, 3565, 3566⟩)
                  (.leaf ⟨895, 3569, 3570⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨895, 3569, 3570⟩)
                  (.leaf ⟨763, 3049, 3050⟩)
                )
                (.branch 1
                  (.leaf ⟨896, 3573, 3574⟩)
                  (.leaf ⟨897, 3577, 3578⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨898, 3581, 3582⟩)
                  (.leaf ⟨898, 3581, 3582⟩)
                )
                (.branch 1
                  (.leaf ⟨764, 3053, 3054⟩)
                  (.leaf ⟨899, 3585, 3586⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨900, 3589, 3590⟩)
                  (.leaf ⟨901, 3593, 3594⟩)
                )
                (.branch 1
                  (.leaf ⟨901, 3593, 3594⟩)
                  (.leaf ⟨765, 3057, 3058⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨902, 3597, 3598⟩)
                  (.leaf ⟨903, 3601, 3602⟩)
                )
                (.branch 1
                  (.leaf ⟨904, 3605, 3606⟩)
                  (.leaf ⟨904, 3605, 3606⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨766, 3061, 3062⟩)
                  (.leaf ⟨905, 3609, 3610⟩)
                )
                (.branch 1
                  (.leaf ⟨906, 3613, 3614⟩)
                  (.leaf ⟨907, 3617, 3618⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨907, 3617, 3618⟩)
                  (.leaf ⟨767, 3065, 3066⟩)
                )
                (.branch 1
                  (.leaf ⟨908, 3621, 3622⟩)
                  (.leaf ⟨909, 3625, 3626⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨910, 3629, 3630⟩)
                  (.leaf ⟨910, 3629, 3630⟩)
                )
                (.branch 1
                  (.leaf ⟨768, 3069, 3070⟩)
                  (.leaf ⟨911, 3633, 3634⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨912, 3637, 3638⟩)
                  (.leaf ⟨913, 3641, 3642⟩)
                )
                (.branch 1
                  (.leaf ⟨913, 3641, 3642⟩)
                  (.leaf ⟨769, 3073, 3074⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨914, 3645, 3646⟩)
                  (.leaf ⟨915, 3649, 3650⟩)
                )
                (.branch 1
                  (.leaf ⟨916, 3653, 3654⟩)
                  (.leaf ⟨916, 3653, 3654⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨770, 3077, 3078⟩)
                  (.leaf ⟨917, 3657, 3658⟩)
                )
                (.branch 1
                  (.leaf ⟨918, 3661, 3662⟩)
                  (.leaf ⟨919, 3665, 3666⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨919, 3665, 3666⟩)
                  (.leaf ⟨771, 3081, 3082⟩)
                )
                (.branch 1
                  (.leaf ⟨920, 3669, 3670⟩)
                  (.leaf ⟨921, 3673, 3674⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨922, 3677, 3678⟩)
                  (.leaf ⟨922, 3677, 3678⟩)
                )
                (.branch 1
                  (.leaf ⟨772, 3085, 3086⟩)
                  (.leaf ⟨923, 3681, 3682⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨924, 3685, 3686⟩)
                  (.leaf ⟨925, 3691, 3692⟩)
                )
                (.branch 1
                  (.leaf ⟨925, 3691, 3692⟩)
                  (.leaf ⟨773, 3091, 3092⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨926, 3695, 3696⟩)
                  (.leaf ⟨927, 3699, 3700⟩)
                )
                (.branch 1
                  (.leaf ⟨979, 3691, 3860⟩)
                  (.leaf ⟨979, 3691, 3860⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨791, 3091, 3148⟩)
                  (.leaf ⟨980, 3695, 3864⟩)
                )
                (.branch 1
                  (.leaf ⟨981, 3699, 3868⟩)
                  (.leaf ⟨982, 3919, 3920⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨982, 3919, 3920⟩)
                  (.leaf ⟨792, 3167, 3168⟩)
                )
                (.branch 1
                  (.leaf ⟨983, 3923, 3924⟩)
                  (.leaf ⟨984, 3927, 3928⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨985, 3919, 3884⟩)
                  (.leaf ⟨985, 3919, 3884⟩)
                )
                (.branch 1
                  (.leaf ⟨793, 3167, 3156⟩)
                  (.leaf ⟨986, 3923, 3888⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨987, 3927, 3892⟩)
                  (.leaf ⟨988, 3943, 3944⟩)
                )
                (.branch 1
                  (.leaf ⟨988, 3943, 3944⟩)
                  (.leaf ⟨794, 3175, 3176⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨989, 3947, 3948⟩)
                  (.leaf ⟨990, 3951, 3952⟩)
                )
                (.branch 1
                  (.leaf ⟨991, 3943, 3896⟩)
                  (.leaf ⟨991, 3943, 3896⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨795, 3175, 3160⟩)
                  (.leaf ⟨992, 3947, 3900⟩)
                )
                (.branch 1
                  (.leaf ⟨993, 3951, 3904⟩)
                  (.leaf ⟨994, 3967, 3968⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨994, 3967, 3968⟩)
                  (.leaf ⟨796, 3183, 3184⟩)
                )
                (.branch 1
                  (.leaf ⟨995, 3971, 3972⟩)
                  (.leaf ⟨996, 3975, 3976⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨997, 3979, 3980⟩)
                  (.leaf ⟨997, 3979, 3980⟩)
                )
                (.branch 1
                  (.leaf ⟨797, 3187, 3188⟩)
                  (.leaf ⟨998, 3983, 3984⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨999, 3987, 3988⟩)
                  (.leaf ⟨1000, 3991, 3992⟩)
                )
                (.branch 1
                  (.leaf ⟨1000, 3991, 3992⟩)
                  (.leaf ⟨798, 3191, 3192⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1001, 3995, 3996⟩)
                  (.leaf ⟨1002, 3999, 4000⟩)
                )
                (.branch 1
                  (.leaf ⟨1003, 4003, 4004⟩)
                  (.leaf ⟨1003, 4003, 4004⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨799, 3195, 3196⟩)
                  (.leaf ⟨1004, 4007, 4008⟩)
                )
                (.branch 1
                  (.leaf ⟨1005, 4011, 4012⟩)
                  (.leaf ⟨1006, 4015, 4016⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1006, 4015, 4016⟩)
                  (.leaf ⟨800, 3199, 3200⟩)
                )
                (.branch 1
                  (.leaf ⟨1007, 4019, 4020⟩)
                  (.leaf ⟨1008, 4023, 4024⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1009, 4027, 4028⟩)
                  (.leaf ⟨1009, 4027, 4028⟩)
                )
                (.branch 1
                  (.leaf ⟨801, 3203, 3204⟩)
                  (.leaf ⟨1010, 4031, 4032⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1011, 4035, 4036⟩)
                  (.leaf ⟨1012, 4039, 4040⟩)
                )
                (.branch 1
                  (.leaf ⟨1012, 4039, 4040⟩)
                  (.leaf ⟨802, 3207, 3208⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1013, 4043, 4044⟩)
                  (.leaf ⟨1014, 4047, 4048⟩)
                )
                (.branch 1
                  (.leaf ⟨1015, 4051, 4052⟩)
                  (.leaf ⟨1015, 4051, 4052⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨803, 3211, 3212⟩)
                  (.leaf ⟨1016, 4055, 4056⟩)
                )
                (.branch 1
                  (.leaf ⟨1017, 4059, 4060⟩)
                  (.leaf ⟨1018, 4063, 4064⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1018, 4063, 4064⟩)
                  (.leaf ⟨804, 3215, 3216⟩)
                )
                (.branch 1
                  (.leaf ⟨1019, 4067, 4068⟩)
                  (.leaf ⟨1020, 4071, 4072⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1021, 446019, 446020⟩)
                  (.leaf ⟨1022, 446023, 446024⟩)
                )
                (.branch 1
                  (.leaf ⟨1023, 445955, 445956⟩)
                  (.leaf ⟨1024, 446027, 446028⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1025, 446031, 446032⟩)
                  (.leaf ⟨1026, 427111, 427112⟩)
                )
                (.branch 1
                  (.leaf ⟨1027, 427115, 427116⟩)
                  (.leaf ⟨1028, 427119, 427120⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1029, 427123, 427124⟩)
                  (.leaf ⟨1030, 427127, 427128⟩)
                )
                (.branch 1
                  (.leaf ⟨1026, 427111, 427112⟩)
                  (.leaf ⟨1026, 427111, 427112⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1026, 427111, 427112⟩)
                  (.leaf ⟨1026, 427111, 427112⟩)
                )
                (.branch 1
                  (.leaf ⟨1026, 427111, 427112⟩)
                  (.leaf ⟨1026, 427111, 427112⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1027, 427115, 427116⟩)
                  (.leaf ⟨1028, 427119, 427120⟩)
                )
                (.branch 1
                  (.leaf ⟨1029, 427123, 427124⟩)
                  (.leaf ⟨1030, 427127, 427128⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1031, 4105, 4106⟩)
                  (.leaf ⟨1032, 4109, 4110⟩)
                )
                (.branch 1
                  (.leaf ⟨1033, 4113, 4114⟩)
                  (.leaf ⟨1034, 4117, 4118⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1035, 4121, 4122⟩)
                  (.leaf ⟨1036, 4125, 4126⟩)
                )
                (.branch 1
                  (.leaf ⟨1037, 4129, 4130⟩)
                  (.leaf ⟨1038, 4133, 4134⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1039, 4137, 4138⟩)
                  (.leaf ⟨1040, 4141, 4142⟩)
                )
                (.branch 1
                  (.leaf ⟨1041, 4145, 4146⟩)
                  (.leaf ⟨1042, 4149, 4150⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1043, 4153, 4154⟩)
                  (.leaf ⟨1044, 4157, 4158⟩)
                )
                (.branch 1
                  (.leaf ⟨1045, 4161, 4162⟩)
                  (.leaf ⟨1046, 4165, 4166⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1047, 4169, 4170⟩)
                  (.leaf ⟨1048, 4173, 4174⟩)
                )
                (.branch 1
                  (.leaf ⟨1049, 4177, 4178⟩)
                  (.leaf ⟨1050, 4181, 4182⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1051, 4185, 4186⟩)
                  (.leaf ⟨1052, 4189, 4190⟩)
                )
                (.branch 1
                  (.leaf ⟨1053, 4193, 4194⟩)
                  (.leaf ⟨1054, 4197, 4198⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1055, 4201, 4202⟩)
                  (.leaf ⟨1056, 187623, 187623⟩)
                )
                (.branch 1
                  (.leaf ⟨1057, 187627, 187627⟩)
                  (.leaf ⟨1058, 186595, 186595⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1059, 187631, 187631⟩)
                  (.leaf ⟨1060, 187635, 187635⟩)
                )
                (.branch 1
                  (.leaf ⟨1061, 4227, 4228⟩)
                  (.leaf ⟨1062, 4231, 4232⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1063, 4235, 4236⟩)
                  (.leaf ⟨1064, 4239, 4240⟩)
                )
                (.branch 1
                  (.leaf ⟨1065, 4243, 4244⟩)
                  (.leaf ⟨1066, 427171, 427171⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1067, 427175, 427175⟩)
                  (.leaf ⟨1068, 427179, 427179⟩)
                )
                (.branch 1
                  (.leaf ⟨1069, 427183, 427183⟩)
                  (.leaf ⟨1070, 427187, 427187⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1071, 4267, 4268⟩)
                  (.leaf ⟨1072, 4271, 4272⟩)
                )
                (.branch 1
                  (.leaf ⟨1073, 4275, 4276⟩)
                  (.leaf ⟨1074, 4279, 4280⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1075, 4283, 4284⟩)
                  (.leaf ⟨1076, 427151, 427151⟩)
                )
                (.branch 1
                  (.leaf ⟨1077, 427155, 427155⟩)
                  (.leaf ⟨1078, 427159, 427159⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1079, 427163, 427163⟩)
                  (.leaf ⟨1080, 427167, 427167⟩)
                )
                (.branch 1
                  (.leaf ⟨1081, 4307, 4308⟩)
                  (.leaf ⟨1082, 4311, 4312⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1083, 4315, 4316⟩)
                  (.leaf ⟨1084, 4319, 4320⟩)
                )
                (.branch 1
                  (.leaf ⟨1085, 4323, 4324⟩)
                  (.leaf ⟨1086, 4327, 4328⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_6912_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1087, 4331, 4332⟩)
                  (.leaf ⟨1088, 4335, 4336⟩)
                )
                (.branch 1
                  (.leaf ⟨1089, 4339, 4340⟩)
                  (.leaf ⟨1090, 4343, 4344⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1091, 4347, 4348⟩)
                  (.leaf ⟨1092, 4351, 4352⟩)
                )
                (.branch 1
                  (.leaf ⟨1093, 4355, 4356⟩)
                  (.leaf ⟨1094, 4359, 4360⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1095, 4363, 4364⟩)
                  (.leaf ⟨1026, 427111, 427112⟩)
                )
                (.branch 1
                  (.leaf ⟨1027, 427115, 427116⟩)
                  (.leaf ⟨1028, 427119, 427120⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1029, 427123, 427124⟩)
                  (.leaf ⟨1030, 427127, 427128⟩)
                )
                (.branch 1
                  (.leaf ⟨1031, 4105, 4106⟩)
                  (.leaf ⟨1032, 4109, 4110⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1033, 4113, 4114⟩)
                  (.leaf ⟨1034, 4117, 4118⟩)
                )
                (.branch 1
                  (.leaf ⟨1035, 4121, 4122⟩)
                  (.leaf ⟨1036, 4125, 4126⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1037, 4129, 4130⟩)
                  (.leaf ⟨1038, 4133, 4134⟩)
                )
                (.branch 1
                  (.leaf ⟨1039, 4137, 4138⟩)
                  (.leaf ⟨1040, 4141, 4142⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1041, 4145, 4146⟩)
                  (.leaf ⟨1042, 4149, 4150⟩)
                )
                (.branch 1
                  (.leaf ⟨1043, 4153, 4154⟩)
                  (.leaf ⟨1044, 4157, 4158⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1045, 4161, 4162⟩)
                  (.leaf ⟨1046, 4165, 4166⟩)
                )
                (.branch 1
                  (.leaf ⟨1047, 4169, 4170⟩)
                  (.leaf ⟨1048, 4173, 4174⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1049, 4177, 4178⟩)
                  (.leaf ⟨1050, 4181, 4182⟩)
                )
                (.branch 1
                  (.leaf ⟨1051, 4185, 4186⟩)
                  (.leaf ⟨1052, 4189, 4190⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1053, 4193, 4194⟩)
                  (.leaf ⟨1054, 4197, 4198⟩)
                )
                (.branch 1
                  (.leaf ⟨1055, 4201, 4202⟩)
                  (.leaf ⟨1056, 187623, 187623⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1057, 187627, 187627⟩)
                  (.leaf ⟨1058, 186595, 186595⟩)
                )
                (.branch 1
                  (.leaf ⟨1059, 187631, 187631⟩)
                  (.leaf ⟨1060, 187635, 187635⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1061, 4227, 4228⟩)
                  (.leaf ⟨1062, 4231, 4232⟩)
                )
                (.branch 1
                  (.leaf ⟨1063, 4235, 4236⟩)
                  (.leaf ⟨1064, 4239, 4240⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1065, 4243, 4244⟩)
                  (.leaf ⟨1066, 427171, 427171⟩)
                )
                (.branch 1
                  (.leaf ⟨1067, 427175, 427175⟩)
                  (.leaf ⟨1068, 427179, 427179⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1069, 427183, 427183⟩)
                  (.leaf ⟨1070, 427187, 427187⟩)
                )
                (.branch 1
                  (.leaf ⟨1071, 4267, 4268⟩)
                  (.leaf ⟨1072, 4271, 4272⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1073, 4275, 4276⟩)
                  (.leaf ⟨1074, 4279, 4280⟩)
                )
                (.branch 1
                  (.leaf ⟨1075, 4283, 4284⟩)
                  (.leaf ⟨1076, 427151, 427151⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1077, 427155, 427155⟩)
                  (.leaf ⟨1078, 427159, 427159⟩)
                )
                (.branch 1
                  (.leaf ⟨1079, 427163, 427163⟩)
                  (.leaf ⟨1080, 427167, 427167⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1081, 4307, 4308⟩)
                  (.leaf ⟨1082, 4311, 4312⟩)
                )
                (.branch 1
                  (.leaf ⟨1083, 4315, 4316⟩)
                  (.leaf ⟨1084, 4319, 4320⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1085, 4323, 4324⟩)
                  (.leaf ⟨1086, 4327, 4328⟩)
                )
                (.branch 1
                  (.leaf ⟨1087, 4331, 4332⟩)
                  (.leaf ⟨1088, 4335, 4336⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1089, 4339, 4340⟩)
                  (.leaf ⟨1090, 4343, 4344⟩)
                )
                (.branch 1
                  (.leaf ⟨1091, 4347, 4348⟩)
                  (.leaf ⟨1092, 4351, 4352⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1093, 4355, 4356⟩)
                  (.leaf ⟨1094, 4359, 4360⟩)
                )
                (.branch 1
                  (.leaf ⟨1095, 4363, 4364⟩)
                  (.leaf ⟨1026, 427111, 427112⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1027, 427115, 427116⟩)
                  (.leaf ⟨1028, 427119, 427120⟩)
                )
                (.branch 1
                  (.leaf ⟨1029, 427123, 427124⟩)
                  (.leaf ⟨1030, 427127, 427128⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1031, 4105, 4106⟩)
                  (.leaf ⟨1032, 4109, 4110⟩)
                )
                (.branch 1
                  (.leaf ⟨1033, 4113, 4114⟩)
                  (.leaf ⟨1034, 4117, 4118⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1035, 4121, 4122⟩)
                  (.leaf ⟨1036, 4125, 4126⟩)
                )
                (.branch 1
                  (.leaf ⟨1037, 4129, 4130⟩)
                  (.leaf ⟨1038, 4133, 4134⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1039, 4137, 4138⟩)
                  (.leaf ⟨1040, 4141, 4142⟩)
                )
                (.branch 1
                  (.leaf ⟨1041, 4145, 4146⟩)
                  (.leaf ⟨1042, 4149, 4150⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1043, 4153, 4154⟩)
                  (.leaf ⟨1044, 4157, 4158⟩)
                )
                (.branch 1
                  (.leaf ⟨1045, 4161, 4162⟩)
                  (.leaf ⟨1046, 4165, 4166⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1047, 4169, 4170⟩)
                  (.leaf ⟨1048, 4173, 4174⟩)
                )
                (.branch 1
                  (.leaf ⟨1049, 4177, 4178⟩)
                  (.leaf ⟨1050, 4181, 4182⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1051, 4185, 4186⟩)
                  (.leaf ⟨1052, 4189, 4190⟩)
                )
                (.branch 1
                  (.leaf ⟨1053, 4193, 4194⟩)
                  (.leaf ⟨1054, 4197, 4198⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1055, 4201, 4202⟩)
                  (.leaf ⟨1056, 187623, 187623⟩)
                )
                (.branch 1
                  (.leaf ⟨1057, 187627, 187627⟩)
                  (.leaf ⟨1058, 186595, 186595⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1059, 187631, 187631⟩)
                  (.leaf ⟨1060, 187635, 187635⟩)
                )
                (.branch 1
                  (.leaf ⟨1061, 4227, 4228⟩)
                  (.leaf ⟨1062, 4231, 4232⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1063, 4235, 4236⟩)
                  (.leaf ⟨1064, 4239, 4240⟩)
                )
                (.branch 1
                  (.leaf ⟨1065, 4243, 4244⟩)
                  (.leaf ⟨1066, 427171, 427171⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1067, 427175, 427175⟩)
                  (.leaf ⟨1068, 427179, 427179⟩)
                )
                (.branch 1
                  (.leaf ⟨1069, 427183, 427183⟩)
                  (.leaf ⟨1070, 427187, 427187⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1071, 4267, 4268⟩)
                  (.leaf ⟨1072, 4271, 4272⟩)
                )
                (.branch 1
                  (.leaf ⟨1073, 4275, 4276⟩)
                  (.leaf ⟨1074, 4279, 4280⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1075, 4283, 4284⟩)
                  (.leaf ⟨1076, 427151, 427151⟩)
                )
                (.branch 1
                  (.leaf ⟨1077, 427155, 427155⟩)
                  (.leaf ⟨1078, 427159, 427159⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1079, 427163, 427163⟩)
                  (.leaf ⟨1080, 427167, 427167⟩)
                )
                (.branch 1
                  (.leaf ⟨1081, 4307, 4308⟩)
                  (.leaf ⟨1082, 4311, 4312⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1083, 4315, 4316⟩)
                  (.leaf ⟨1084, 4319, 4320⟩)
                )
                (.branch 1
                  (.leaf ⟨1085, 4323, 4324⟩)
                  (.leaf ⟨1086, 4327, 4328⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1087, 4331, 4332⟩)
                  (.leaf ⟨1088, 4335, 4336⟩)
                )
                (.branch 1
                  (.leaf ⟨1089, 4339, 4340⟩)
                  (.leaf ⟨1090, 4343, 4344⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1091, 4347, 4348⟩)
                  (.leaf ⟨1092, 4351, 4352⟩)
                )
                (.branch 1
                  (.leaf ⟨1093, 4355, 4356⟩)
                  (.leaf ⟨1094, 4359, 4360⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1095, 4363, 4364⟩)
                  (.leaf ⟨1026, 427111, 427112⟩)
                )
                (.branch 1
                  (.leaf ⟨1027, 427115, 427116⟩)
                  (.leaf ⟨1028, 427119, 427120⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1029, 427123, 427124⟩)
                  (.leaf ⟨1030, 427127, 427128⟩)
                )
                (.branch 1
                  (.leaf ⟨1031, 4105, 4106⟩)
                  (.leaf ⟨1032, 4109, 4110⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1033, 4113, 4114⟩)
                  (.leaf ⟨1034, 4117, 4118⟩)
                )
                (.branch 1
                  (.leaf ⟨1035, 4121, 4122⟩)
                  (.leaf ⟨1036, 4125, 4126⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1037, 4129, 4130⟩)
                  (.leaf ⟨1038, 4133, 4134⟩)
                )
                (.branch 1
                  (.leaf ⟨1039, 4137, 4138⟩)
                  (.leaf ⟨1040, 4141, 4142⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1041, 4145, 4146⟩)
                  (.leaf ⟨1042, 4149, 4150⟩)
                )
                (.branch 1
                  (.leaf ⟨1043, 4153, 4154⟩)
                  (.leaf ⟨1044, 4157, 4158⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1045, 4161, 4162⟩)
                  (.leaf ⟨1046, 4165, 4166⟩)
                )
                (.branch 1
                  (.leaf ⟨1047, 4169, 4170⟩)
                  (.leaf ⟨1048, 4173, 4174⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1049, 4177, 4178⟩)
                  (.leaf ⟨1050, 4181, 4182⟩)
                )
                (.branch 1
                  (.leaf ⟨1051, 4185, 4186⟩)
                  (.leaf ⟨1052, 4189, 4190⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1053, 4193, 4194⟩)
                  (.leaf ⟨1054, 4197, 4198⟩)
                )
                (.branch 1
                  (.leaf ⟨1055, 4201, 4202⟩)
                  (.leaf ⟨1056, 187623, 187623⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1057, 187627, 187627⟩)
                  (.leaf ⟨1058, 186595, 186595⟩)
                )
                (.branch 1
                  (.leaf ⟨1059, 187631, 187631⟩)
                  (.leaf ⟨1060, 187635, 187635⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1061, 4227, 4228⟩)
                  (.leaf ⟨1062, 4231, 4232⟩)
                )
                (.branch 1
                  (.leaf ⟨1063, 4235, 4236⟩)
                  (.leaf ⟨1064, 4239, 4240⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1065, 4243, 4244⟩)
                  (.leaf ⟨1066, 427171, 427171⟩)
                )
                (.branch 1
                  (.leaf ⟨1067, 427175, 427175⟩)
                  (.leaf ⟨1068, 427179, 427179⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1069, 427183, 427183⟩)
                  (.leaf ⟨1070, 427187, 427187⟩)
                )
                (.branch 1
                  (.leaf ⟨1071, 4267, 4268⟩)
                  (.leaf ⟨1072, 4271, 4272⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1073, 4275, 4276⟩)
                  (.leaf ⟨1074, 4279, 4280⟩)
                )
                (.branch 1
                  (.leaf ⟨1075, 4283, 4284⟩)
                  (.leaf ⟨1076, 427151, 427151⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1077, 427155, 427155⟩)
                  (.leaf ⟨1078, 427159, 427159⟩)
                )
                (.branch 1
                  (.leaf ⟨1079, 427163, 427163⟩)
                  (.leaf ⟨1080, 427167, 427167⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1081, 4307, 4308⟩)
                  (.leaf ⟨1082, 4311, 4312⟩)
                )
                (.branch 1
                  (.leaf ⟨1083, 4315, 4316⟩)
                  (.leaf ⟨1084, 4319, 4320⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1085, 4323, 4324⟩)
                  (.leaf ⟨1086, 4327, 4328⟩)
                )
                (.branch 1
                  (.leaf ⟨1087, 4331, 4332⟩)
                  (.leaf ⟨1088, 4335, 4336⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1089, 4339, 4340⟩)
                  (.leaf ⟨1090, 4343, 4344⟩)
                )
                (.branch 1
                  (.leaf ⟨1091, 4347, 4348⟩)
                  (.leaf ⟨1092, 4351, 4352⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1093, 4355, 4356⟩)
                  (.leaf ⟨1094, 4359, 4360⟩)
                )
                (.branch 1
                  (.leaf ⟨1095, 4363, 4364⟩)
                  (.leaf ⟨1026, 427111, 427112⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1027, 427115, 427116⟩)
                  (.leaf ⟨1028, 427119, 427120⟩)
                )
                (.branch 1
                  (.leaf ⟨1029, 427123, 427124⟩)
                  (.leaf ⟨1030, 427127, 427128⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1031, 4105, 4106⟩)
                  (.leaf ⟨1032, 4109, 4110⟩)
                )
                (.branch 1
                  (.leaf ⟨1033, 4113, 4114⟩)
                  (.leaf ⟨1034, 4117, 4118⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1035, 4121, 4122⟩)
                  (.leaf ⟨1036, 4125, 4126⟩)
                )
                (.branch 1
                  (.leaf ⟨1037, 4129, 4130⟩)
                  (.leaf ⟨1038, 4133, 4134⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1039, 4137, 4138⟩)
                  (.leaf ⟨1040, 4141, 4142⟩)
                )
                (.branch 1
                  (.leaf ⟨1041, 4145, 4146⟩)
                  (.leaf ⟨1042, 4149, 4150⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1043, 4153, 4154⟩)
                  (.leaf ⟨1044, 4157, 4158⟩)
                )
                (.branch 1
                  (.leaf ⟨1045, 4161, 4162⟩)
                  (.leaf ⟨1046, 4165, 4166⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1047, 4169, 4170⟩)
                  (.leaf ⟨1048, 4173, 4174⟩)
                )
                (.branch 1
                  (.leaf ⟨1049, 4177, 4178⟩)
                  (.leaf ⟨1050, 4181, 4182⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1051, 4185, 4186⟩)
                  (.leaf ⟨1052, 4189, 4190⟩)
                )
                (.branch 1
                  (.leaf ⟨1053, 4193, 4194⟩)
                  (.leaf ⟨1054, 4197, 4198⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1055, 4201, 4202⟩)
                  (.leaf ⟨1056, 187623, 187623⟩)
                )
                (.branch 1
                  (.leaf ⟨1057, 187627, 187627⟩)
                  (.leaf ⟨1058, 186595, 186595⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1059, 187631, 187631⟩)
                  (.leaf ⟨1060, 187635, 187635⟩)
                )
                (.branch 1
                  (.leaf ⟨1061, 4227, 4228⟩)
                  (.leaf ⟨1062, 4231, 4232⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_6656_512 : Balanced.RowTree Cell :=
  .branch 256 cache_6656_256 cache_6912_256
noncomputable def cache_6144_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_6144_512 cache_6656_512
noncomputable def cache_7168_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1063, 4235, 4236⟩)
                  (.leaf ⟨1064, 4239, 4240⟩)
                )
                (.branch 1
                  (.leaf ⟨1065, 4243, 4244⟩)
                  (.leaf ⟨1066, 427171, 427171⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1067, 427175, 427175⟩)
                  (.leaf ⟨1068, 427179, 427179⟩)
                )
                (.branch 1
                  (.leaf ⟨1069, 427183, 427183⟩)
                  (.leaf ⟨1070, 427187, 427187⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1071, 4267, 4268⟩)
                  (.leaf ⟨1072, 4271, 4272⟩)
                )
                (.branch 1
                  (.leaf ⟨1073, 4275, 4276⟩)
                  (.leaf ⟨1074, 4279, 4280⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1075, 4283, 4284⟩)
                  (.leaf ⟨1076, 427151, 427151⟩)
                )
                (.branch 1
                  (.leaf ⟨1077, 427155, 427155⟩)
                  (.leaf ⟨1078, 427159, 427159⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1079, 427163, 427163⟩)
                  (.leaf ⟨1080, 427167, 427167⟩)
                )
                (.branch 1
                  (.leaf ⟨1081, 4307, 4308⟩)
                  (.leaf ⟨1082, 4311, 4312⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1083, 4315, 4316⟩)
                  (.leaf ⟨1084, 4319, 4320⟩)
                )
                (.branch 1
                  (.leaf ⟨1085, 4323, 4324⟩)
                  (.leaf ⟨1086, 4327, 4328⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1087, 4331, 4332⟩)
                  (.leaf ⟨1088, 4335, 4336⟩)
                )
                (.branch 1
                  (.leaf ⟨1089, 4339, 4340⟩)
                  (.leaf ⟨1090, 4343, 4344⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1091, 4347, 4348⟩)
                  (.leaf ⟨1092, 4351, 4352⟩)
                )
                (.branch 1
                  (.leaf ⟨1093, 4355, 4356⟩)
                  (.leaf ⟨1094, 4359, 4360⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1095, 4363, 4364⟩)
                  (.leaf ⟨1091, 4347, 4348⟩)
                )
                (.branch 1
                  (.leaf ⟨1092, 4351, 4352⟩)
                  (.leaf ⟨1093, 4355, 4356⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1094, 4359, 4360⟩)
                  (.leaf ⟨1095, 4363, 4364⟩)
                )
                (.branch 1
                  (.leaf ⟨1091, 4347, 4348⟩)
                  (.leaf ⟨1092, 4351, 4352⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1093, 4355, 4356⟩)
                  (.leaf ⟨1094, 4359, 4360⟩)
                )
                (.branch 1
                  (.leaf ⟨1095, 4363, 4364⟩)
                  (.leaf ⟨1091, 4347, 4348⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1092, 4351, 4352⟩)
                  (.leaf ⟨1093, 4355, 4356⟩)
                )
                (.branch 1
                  (.leaf ⟨1094, 4359, 4360⟩)
                  (.leaf ⟨1095, 4363, 4364⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1091, 4347, 4348⟩)
                  (.leaf ⟨1092, 4351, 4352⟩)
                )
                (.branch 1
                  (.leaf ⟨1093, 4355, 4356⟩)
                  (.leaf ⟨1094, 4359, 4360⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1095, 4363, 4364⟩)
                  (.leaf ⟨1096, 427131, 427132⟩)
                )
                (.branch 1
                  (.leaf ⟨1097, 427135, 427136⟩)
                  (.leaf ⟨1098, 427139, 427140⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1099, 427143, 427144⟩)
                  (.leaf ⟨1100, 427147, 427148⟩)
                )
                (.branch 1
                  (.leaf ⟨1096, 427131, 427132⟩)
                  (.leaf ⟨1096, 427131, 427132⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1096, 427131, 427132⟩)
                  (.leaf ⟨1096, 427131, 427132⟩)
                )
                (.branch 1
                  (.leaf ⟨1096, 427131, 427132⟩)
                  (.leaf ⟨1101, 4385, 4386⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1101, 4385, 4386⟩)
                  (.leaf ⟨1101, 4385, 4386⟩)
                )
                (.branch 1
                  (.leaf ⟨1101, 4385, 4386⟩)
                  (.leaf ⟨1101, 4385, 4386⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1102, 4405, 4406⟩)
                  (.leaf ⟨1102, 4405, 4406⟩)
                )
                (.branch 1
                  (.leaf ⟨1102, 4405, 4406⟩)
                  (.leaf ⟨1102, 4405, 4406⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1102, 4405, 4406⟩)
                  (.leaf ⟨1103, 4409, 4410⟩)
                )
                (.branch 1
                  (.leaf ⟨1103, 4409, 4410⟩)
                  (.leaf ⟨1103, 4409, 4410⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1103, 4409, 4410⟩)
                  (.leaf ⟨1103, 4409, 4410⟩)
                )
                (.branch 1
                  (.leaf ⟨1104, 4413, 4414⟩)
                  (.leaf ⟨1104, 4413, 4414⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1104, 4413, 4414⟩)
                  (.leaf ⟨1104, 4413, 4414⟩)
                )
                (.branch 1
                  (.leaf ⟨1104, 4413, 4414⟩)
                  (.leaf ⟨1105, 4417, 4418⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1105, 4417, 4418⟩)
                  (.leaf ⟨1105, 4417, 4418⟩)
                )
                (.branch 1
                  (.leaf ⟨1105, 4417, 4418⟩)
                  (.leaf ⟨1105, 4417, 4418⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1106, 4421, 4422⟩)
                  (.leaf ⟨1106, 4421, 4422⟩)
                )
                (.branch 1
                  (.leaf ⟨1106, 4421, 4422⟩)
                  (.leaf ⟨1106, 4421, 4422⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1106, 4421, 4422⟩)
                  (.leaf ⟨1107, 4427, 4428⟩)
                )
                (.branch 1
                  (.leaf ⟨1107, 4427, 4428⟩)
                  (.leaf ⟨1107, 4427, 4428⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1107, 4427, 4428⟩)
                  (.leaf ⟨1107, 4427, 4428⟩)
                )
                (.branch 1
                  (.leaf ⟨1096, 427131, 427132⟩)
                  (.leaf ⟨1097, 427135, 427136⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1098, 427139, 427140⟩)
                  (.leaf ⟨1099, 427143, 427144⟩)
                )
                (.branch 1
                  (.leaf ⟨1100, 427147, 427148⟩)
                  (.leaf ⟨1099, 427143, 427144⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1099, 427143, 427144⟩)
                  (.leaf ⟨1099, 427143, 427144⟩)
                )
                (.branch 1
                  (.leaf ⟨1099, 427143, 427144⟩)
                  (.leaf ⟨1099, 427143, 427144⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1108, 4397, 4398⟩)
                  (.leaf ⟨1108, 4397, 4398⟩)
                )
                (.branch 1
                  (.leaf ⟨1108, 4397, 4398⟩)
                  (.leaf ⟨1108, 4397, 4398⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1108, 4397, 4398⟩)
                  (.leaf ⟨1109, 4433, 4434⟩)
                )
                (.branch 1
                  (.leaf ⟨1109, 4433, 4434⟩)
                  (.leaf ⟨1109, 4433, 4434⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1109, 4433, 4434⟩)
                  (.leaf ⟨1109, 4433, 4434⟩)
                )
                (.branch 1
                  (.leaf ⟨1110, 4437, 4438⟩)
                  (.leaf ⟨1110, 4437, 4438⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1110, 4437, 4438⟩)
                  (.leaf ⟨1110, 4437, 4438⟩)
                )
                (.branch 1
                  (.leaf ⟨1110, 4437, 4438⟩)
                  (.leaf ⟨1111, 4441, 4442⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1111, 4441, 4442⟩)
                  (.leaf ⟨1111, 4441, 4442⟩)
                )
                (.branch 1
                  (.leaf ⟨1111, 4441, 4442⟩)
                  (.leaf ⟨1111, 4441, 4442⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1112, 4445, 4446⟩)
                  (.leaf ⟨1112, 4445, 4446⟩)
                )
                (.branch 1
                  (.leaf ⟨1112, 4445, 4446⟩)
                  (.leaf ⟨1112, 4445, 4446⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1112, 4445, 4446⟩)
                  (.leaf ⟨1113, 4449, 4450⟩)
                )
                (.branch 1
                  (.leaf ⟨1113, 4449, 4450⟩)
                  (.leaf ⟨1113, 4449, 4450⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1113, 4449, 4450⟩)
                  (.leaf ⟨1113, 4449, 4450⟩)
                )
                (.branch 1
                  (.leaf ⟨1114, 4455, 4456⟩)
                  (.leaf ⟨1114, 4455, 4456⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1114, 4455, 4456⟩)
                  (.leaf ⟨1114, 4455, 4456⟩)
                )
                (.branch 1
                  (.leaf ⟨1114, 4455, 4456⟩)
                  (.leaf ⟨1115, 4455, 4428⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1115, 4455, 4428⟩)
                  (.leaf ⟨1115, 4455, 4428⟩)
                )
                (.branch 1
                  (.leaf ⟨1115, 4455, 4428⟩)
                  (.leaf ⟨1115, 4455, 4428⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1116, 4463, 4464⟩)
                  (.leaf ⟨1116, 4463, 4464⟩)
                )
                (.branch 1
                  (.leaf ⟨1116, 4463, 4464⟩)
                  (.leaf ⟨1116, 4463, 4464⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1116, 4463, 4464⟩)
                  (.leaf ⟨1096, 427131, 427132⟩)
                )
                (.branch 1
                  (.leaf ⟨1097, 427135, 427136⟩)
                  (.leaf ⟨1098, 427139, 427140⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1099, 427143, 427144⟩)
                  (.leaf ⟨1100, 427147, 427148⟩)
                )
                (.branch 1
                  (.leaf ⟨1096, 427131, 427132⟩)
                  (.leaf ⟨1096, 427131, 427132⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1096, 427131, 427132⟩)
                  (.leaf ⟨1096, 427131, 427132⟩)
                )
                (.branch 1
                  (.leaf ⟨1096, 427131, 427132⟩)
                  (.leaf ⟨1101, 4385, 4386⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1101, 4385, 4386⟩)
                  (.leaf ⟨1101, 4385, 4386⟩)
                )
                (.branch 1
                  (.leaf ⟨1101, 4385, 4386⟩)
                  (.leaf ⟨1101, 4385, 4386⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1102, 4405, 4406⟩)
                  (.leaf ⟨1102, 4405, 4406⟩)
                )
                (.branch 1
                  (.leaf ⟨1102, 4405, 4406⟩)
                  (.leaf ⟨1102, 4405, 4406⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1102, 4405, 4406⟩)
                  (.leaf ⟨1103, 4409, 4410⟩)
                )
                (.branch 1
                  (.leaf ⟨1103, 4409, 4410⟩)
                  (.leaf ⟨1103, 4409, 4410⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1103, 4409, 4410⟩)
                  (.leaf ⟨1103, 4409, 4410⟩)
                )
                (.branch 1
                  (.leaf ⟨1104, 4413, 4414⟩)
                  (.leaf ⟨1104, 4413, 4414⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1104, 4413, 4414⟩)
                  (.leaf ⟨1104, 4413, 4414⟩)
                )
                (.branch 1
                  (.leaf ⟨1104, 4413, 4414⟩)
                  (.leaf ⟨1105, 4417, 4418⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1105, 4417, 4418⟩)
                  (.leaf ⟨1105, 4417, 4418⟩)
                )
                (.branch 1
                  (.leaf ⟨1105, 4417, 4418⟩)
                  (.leaf ⟨1105, 4417, 4418⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1106, 4421, 4422⟩)
                  (.leaf ⟨1106, 4421, 4422⟩)
                )
                (.branch 1
                  (.leaf ⟨1106, 4421, 4422⟩)
                  (.leaf ⟨1106, 4421, 4422⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1106, 4421, 4422⟩)
                  (.leaf ⟨1107, 4427, 4428⟩)
                )
                (.branch 1
                  (.leaf ⟨1107, 4427, 4428⟩)
                  (.leaf ⟨1107, 4427, 4428⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1107, 4427, 4428⟩)
                  (.leaf ⟨1107, 4427, 4428⟩)
                )
                (.branch 1
                  (.leaf ⟨1096, 427131, 427132⟩)
                  (.leaf ⟨1097, 427135, 427136⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1098, 427139, 427140⟩)
                  (.leaf ⟨1099, 427143, 427144⟩)
                )
                (.branch 1
                  (.leaf ⟨1100, 427147, 427148⟩)
                  (.leaf ⟨1097, 427135, 427136⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1097, 427135, 427136⟩)
                  (.leaf ⟨1097, 427135, 427136⟩)
                )
                (.branch 1
                  (.leaf ⟨1097, 427135, 427136⟩)
                  (.leaf ⟨1097, 427135, 427136⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1117, 4389, 4390⟩)
                  (.leaf ⟨1117, 4389, 4390⟩)
                )
                (.branch 1
                  (.leaf ⟨1117, 4389, 4390⟩)
                  (.leaf ⟨1117, 4389, 4390⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1117, 4389, 4390⟩)
                  (.leaf ⟨1118, 4469, 4470⟩)
                )
                (.branch 1
                  (.leaf ⟨1118, 4469, 4470⟩)
                  (.leaf ⟨1118, 4469, 4470⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1118, 4469, 4470⟩)
                  (.leaf ⟨1118, 4469, 4470⟩)
                )
                (.branch 1
                  (.leaf ⟨1119, 4473, 4474⟩)
                  (.leaf ⟨1119, 4473, 4474⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1119, 4473, 4474⟩)
                  (.leaf ⟨1119, 4473, 4474⟩)
                )
                (.branch 1
                  (.leaf ⟨1119, 4473, 4474⟩)
                  (.leaf ⟨1120, 4477, 4478⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1120, 4477, 4478⟩)
                  (.leaf ⟨1120, 4477, 4478⟩)
                )
                (.branch 1
                  (.leaf ⟨1120, 4477, 4478⟩)
                  (.leaf ⟨1120, 4477, 4478⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1121, 4481, 4482⟩)
                  (.leaf ⟨1121, 4481, 4482⟩)
                )
                (.branch 1
                  (.leaf ⟨1121, 4481, 4482⟩)
                  (.leaf ⟨1121, 4481, 4482⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1121, 4481, 4482⟩)
                  (.leaf ⟨1122, 4485, 4486⟩)
                )
                (.branch 1
                  (.leaf ⟨1122, 4485, 4486⟩)
                  (.leaf ⟨1122, 4485, 4486⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1122, 4485, 4486⟩)
                  (.leaf ⟨1122, 4485, 4486⟩)
                )
                (.branch 1
                  (.leaf ⟨1123, 4491, 4492⟩)
                  (.leaf ⟨1123, 4491, 4492⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1123, 4491, 4492⟩)
                  (.leaf ⟨1123, 4491, 4492⟩)
                )
                (.branch 1
                  (.leaf ⟨1123, 4491, 4492⟩)
                  (.leaf ⟨1124, 4491, 4428⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1124, 4491, 4428⟩)
                  (.leaf ⟨1124, 4491, 4428⟩)
                )
                (.branch 1
                  (.leaf ⟨1124, 4491, 4428⟩)
                  (.leaf ⟨1124, 4491, 4428⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1125, 4499, 4500⟩)
                  (.leaf ⟨1125, 4499, 4500⟩)
                )
                (.branch 1
                  (.leaf ⟨1125, 4499, 4500⟩)
                  (.leaf ⟨1125, 4499, 4500⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1125, 4499, 4500⟩)
                  (.leaf ⟨1126, 4499, 4464⟩)
                )
                (.branch 1
                  (.leaf ⟨1126, 4499, 4464⟩)
                  (.leaf ⟨1126, 4499, 4464⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_7424_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1126, 4499, 4464⟩)
                  (.leaf ⟨1126, 4499, 4464⟩)
                )
                (.branch 1
                  (.leaf ⟨1127, 4507, 4508⟩)
                  (.leaf ⟨1127, 4507, 4508⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1127, 4507, 4508⟩)
                  (.leaf ⟨1127, 4507, 4508⟩)
                )
                (.branch 1
                  (.leaf ⟨1127, 4507, 4508⟩)
                  (.leaf ⟨1096, 427131, 427132⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1097, 427135, 427136⟩)
                  (.leaf ⟨1098, 427139, 427140⟩)
                )
                (.branch 1
                  (.leaf ⟨1099, 427143, 427144⟩)
                  (.leaf ⟨1100, 427147, 427148⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1096, 427131, 427132⟩)
                  (.leaf ⟨1096, 427131, 427132⟩)
                )
                (.branch 1
                  (.leaf ⟨1096, 427131, 427132⟩)
                  (.leaf ⟨1096, 427131, 427132⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1096, 427131, 427132⟩)
                  (.leaf ⟨1101, 4385, 4386⟩)
                )
                (.branch 1
                  (.leaf ⟨1101, 4385, 4386⟩)
                  (.leaf ⟨1101, 4385, 4386⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1101, 4385, 4386⟩)
                  (.leaf ⟨1101, 4385, 4386⟩)
                )
                (.branch 1
                  (.leaf ⟨1102, 4405, 4406⟩)
                  (.leaf ⟨1102, 4405, 4406⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1102, 4405, 4406⟩)
                  (.leaf ⟨1102, 4405, 4406⟩)
                )
                (.branch 1
                  (.leaf ⟨1102, 4405, 4406⟩)
                  (.leaf ⟨1103, 4409, 4410⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1103, 4409, 4410⟩)
                  (.leaf ⟨1103, 4409, 4410⟩)
                )
                (.branch 1
                  (.leaf ⟨1103, 4409, 4410⟩)
                  (.leaf ⟨1103, 4409, 4410⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1104, 4413, 4414⟩)
                  (.leaf ⟨1104, 4413, 4414⟩)
                )
                (.branch 1
                  (.leaf ⟨1104, 4413, 4414⟩)
                  (.leaf ⟨1104, 4413, 4414⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1104, 4413, 4414⟩)
                  (.leaf ⟨1105, 4417, 4418⟩)
                )
                (.branch 1
                  (.leaf ⟨1105, 4417, 4418⟩)
                  (.leaf ⟨1105, 4417, 4418⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1105, 4417, 4418⟩)
                  (.leaf ⟨1105, 4417, 4418⟩)
                )
                (.branch 1
                  (.leaf ⟨1106, 4421, 4422⟩)
                  (.leaf ⟨1106, 4421, 4422⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1106, 4421, 4422⟩)
                  (.leaf ⟨1106, 4421, 4422⟩)
                )
                (.branch 1
                  (.leaf ⟨1106, 4421, 4422⟩)
                  (.leaf ⟨1107, 4427, 4428⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1107, 4427, 4428⟩)
                  (.leaf ⟨1107, 4427, 4428⟩)
                )
                (.branch 1
                  (.leaf ⟨1107, 4427, 4428⟩)
                  (.leaf ⟨1107, 4427, 4428⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1096, 427131, 427132⟩)
                  (.leaf ⟨1097, 427135, 427136⟩)
                )
                (.branch 1
                  (.leaf ⟨1098, 427139, 427140⟩)
                  (.leaf ⟨1099, 427143, 427144⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1100, 427147, 427148⟩)
                  (.leaf ⟨1098, 427139, 427140⟩)
                )
                (.branch 1
                  (.leaf ⟨1098, 427139, 427140⟩)
                  (.leaf ⟨1098, 427139, 427140⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1098, 427139, 427140⟩)
                  (.leaf ⟨1098, 427139, 427140⟩)
                )
                (.branch 1
                  (.leaf ⟨1128, 4393, 4394⟩)
                  (.leaf ⟨1128, 4393, 4394⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1128, 4393, 4394⟩)
                  (.leaf ⟨1128, 4393, 4394⟩)
                )
                (.branch 1
                  (.leaf ⟨1128, 4393, 4394⟩)
                  (.leaf ⟨1129, 4513, 4514⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1129, 4513, 4514⟩)
                  (.leaf ⟨1129, 4513, 4514⟩)
                )
                (.branch 1
                  (.leaf ⟨1129, 4513, 4514⟩)
                  (.leaf ⟨1129, 4513, 4514⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1130, 4517, 4518⟩)
                  (.leaf ⟨1130, 4517, 4518⟩)
                )
                (.branch 1
                  (.leaf ⟨1130, 4517, 4518⟩)
                  (.leaf ⟨1130, 4517, 4518⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1130, 4517, 4518⟩)
                  (.leaf ⟨1131, 4521, 4522⟩)
                )
                (.branch 1
                  (.leaf ⟨1131, 4521, 4522⟩)
                  (.leaf ⟨1131, 4521, 4522⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1131, 4521, 4522⟩)
                  (.leaf ⟨1131, 4521, 4522⟩)
                )
                (.branch 1
                  (.leaf ⟨1132, 4525, 4526⟩)
                  (.leaf ⟨1132, 4525, 4526⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1132, 4525, 4526⟩)
                  (.leaf ⟨1132, 4525, 4526⟩)
                )
                (.branch 1
                  (.leaf ⟨1132, 4525, 4526⟩)
                  (.leaf ⟨1133, 4529, 4530⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1133, 4529, 4530⟩)
                  (.leaf ⟨1133, 4529, 4530⟩)
                )
                (.branch 1
                  (.leaf ⟨1133, 4529, 4530⟩)
                  (.leaf ⟨1133, 4529, 4530⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1134, 4535, 4536⟩)
                  (.leaf ⟨1134, 4535, 4536⟩)
                )
                (.branch 1
                  (.leaf ⟨1134, 4535, 4536⟩)
                  (.leaf ⟨1134, 4535, 4536⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1134, 4535, 4536⟩)
                  (.leaf ⟨1135, 4535, 4428⟩)
                )
                (.branch 1
                  (.leaf ⟨1135, 4535, 4428⟩)
                  (.leaf ⟨1135, 4535, 4428⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1135, 4535, 4428⟩)
                  (.leaf ⟨1135, 4535, 4428⟩)
                )
                (.branch 1
                  (.leaf ⟨1136, 4543, 4544⟩)
                  (.leaf ⟨1136, 4543, 4544⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1136, 4543, 4544⟩)
                  (.leaf ⟨1136, 4543, 4544⟩)
                )
                (.branch 1
                  (.leaf ⟨1136, 4543, 4544⟩)
                  (.leaf ⟨1096, 427131, 427132⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1097, 427135, 427136⟩)
                  (.leaf ⟨1098, 427139, 427140⟩)
                )
                (.branch 1
                  (.leaf ⟨1099, 427143, 427144⟩)
                  (.leaf ⟨1100, 427147, 427148⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1100, 427147, 427148⟩)
                  (.leaf ⟨1100, 427147, 427148⟩)
                )
                (.branch 1
                  (.leaf ⟨1100, 427147, 427148⟩)
                  (.leaf ⟨1100, 427147, 427148⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1100, 427147, 427148⟩)
                  (.leaf ⟨1137, 4401, 4402⟩)
                )
                (.branch 1
                  (.leaf ⟨1137, 4401, 4402⟩)
                  (.leaf ⟨1137, 4401, 4402⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1137, 4401, 4402⟩)
                  (.leaf ⟨1137, 4401, 4402⟩)
                )
                (.branch 1
                  (.leaf ⟨1138, 4549, 4550⟩)
                  (.leaf ⟨1138, 4549, 4550⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1138, 4549, 4550⟩)
                  (.leaf ⟨1138, 4549, 4550⟩)
                )
                (.branch 1
                  (.leaf ⟨1138, 4549, 4550⟩)
                  (.leaf ⟨1139, 4553, 4554⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1139, 4553, 4554⟩)
                  (.leaf ⟨1139, 4553, 4554⟩)
                )
                (.branch 1
                  (.leaf ⟨1139, 4553, 4554⟩)
                  (.leaf ⟨1139, 4553, 4554⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1140, 4557, 4558⟩)
                  (.leaf ⟨1140, 4557, 4558⟩)
                )
                (.branch 1
                  (.leaf ⟨1140, 4557, 4558⟩)
                  (.leaf ⟨1140, 4557, 4558⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1140, 4557, 4558⟩)
                  (.leaf ⟨1141, 4561, 4562⟩)
                )
                (.branch 1
                  (.leaf ⟨1141, 4561, 4562⟩)
                  (.leaf ⟨1141, 4561, 4562⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1141, 4561, 4562⟩)
                  (.leaf ⟨1141, 4561, 4562⟩)
                )
                (.branch 1
                  (.leaf ⟨1142, 4565, 4566⟩)
                  (.leaf ⟨1142, 4565, 4566⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1142, 4565, 4566⟩)
                  (.leaf ⟨1142, 4565, 4566⟩)
                )
                (.branch 1
                  (.leaf ⟨1142, 4565, 4566⟩)
                  (.leaf ⟨1143, 4571, 4572⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1143, 4571, 4572⟩)
                  (.leaf ⟨1143, 4571, 4572⟩)
                )
                (.branch 1
                  (.leaf ⟨1143, 4571, 4572⟩)
                  (.leaf ⟨1143, 4571, 4572⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1096, 427131, 427132⟩)
                  (.leaf ⟨1097, 427135, 427136⟩)
                )
                (.branch 1
                  (.leaf ⟨1098, 427139, 427140⟩)
                  (.leaf ⟨1099, 427143, 427144⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1100, 427147, 427148⟩)
                  (.leaf ⟨1096, 427131, 427132⟩)
                )
                (.branch 1
                  (.leaf ⟨1096, 427131, 427132⟩)
                  (.leaf ⟨1096, 427131, 427132⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1096, 427131, 427132⟩)
                  (.leaf ⟨1096, 427131, 427132⟩)
                )
                (.branch 1
                  (.leaf ⟨1101, 4385, 4386⟩)
                  (.leaf ⟨1101, 4385, 4386⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1101, 4385, 4386⟩)
                  (.leaf ⟨1101, 4385, 4386⟩)
                )
                (.branch 1
                  (.leaf ⟨1101, 4385, 4386⟩)
                  (.leaf ⟨1102, 4405, 4406⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1102, 4405, 4406⟩)
                  (.leaf ⟨1102, 4405, 4406⟩)
                )
                (.branch 1
                  (.leaf ⟨1102, 4405, 4406⟩)
                  (.leaf ⟨1102, 4405, 4406⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1103, 4409, 4410⟩)
                  (.leaf ⟨1103, 4409, 4410⟩)
                )
                (.branch 1
                  (.leaf ⟨1103, 4409, 4410⟩)
                  (.leaf ⟨1103, 4409, 4410⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1103, 4409, 4410⟩)
                  (.leaf ⟨1104, 4413, 4414⟩)
                )
                (.branch 1
                  (.leaf ⟨1104, 4413, 4414⟩)
                  (.leaf ⟨1104, 4413, 4414⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1104, 4413, 4414⟩)
                  (.leaf ⟨1104, 4413, 4414⟩)
                )
                (.branch 1
                  (.leaf ⟨1105, 4417, 4418⟩)
                  (.leaf ⟨1105, 4417, 4418⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1105, 4417, 4418⟩)
                  (.leaf ⟨1105, 4417, 4418⟩)
                )
                (.branch 1
                  (.leaf ⟨1105, 4417, 4418⟩)
                  (.leaf ⟨1106, 4421, 4422⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1106, 4421, 4422⟩)
                  (.leaf ⟨1106, 4421, 4422⟩)
                )
                (.branch 1
                  (.leaf ⟨1106, 4421, 4422⟩)
                  (.leaf ⟨1106, 4421, 4422⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1107, 4427, 4428⟩)
                  (.leaf ⟨1107, 4427, 4428⟩)
                )
                (.branch 1
                  (.leaf ⟨1107, 4427, 4428⟩)
                  (.leaf ⟨1107, 4427, 4428⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1107, 4427, 4428⟩)
                  (.leaf ⟨1144, 4427, 4572⟩)
                )
                (.branch 1
                  (.leaf ⟨1144, 4427, 4572⟩)
                  (.leaf ⟨1144, 4427, 4572⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1144, 4427, 4572⟩)
                  (.leaf ⟨1144, 4427, 4572⟩)
                )
                (.branch 1
                  (.leaf ⟨1145, 4579, 4580⟩)
                  (.leaf ⟨1145, 4579, 4580⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1145, 4579, 4580⟩)
                  (.leaf ⟨1145, 4579, 4580⟩)
                )
                (.branch 1
                  (.leaf ⟨1145, 4579, 4580⟩)
                  (.leaf ⟨1146, 4579, 4544⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1146, 4579, 4544⟩)
                  (.leaf ⟨1146, 4579, 4544⟩)
                )
                (.branch 1
                  (.leaf ⟨1146, 4579, 4544⟩)
                  (.leaf ⟨1146, 4579, 4544⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1147, 4587, 4588⟩)
                  (.leaf ⟨1147, 4587, 4588⟩)
                )
                (.branch 1
                  (.leaf ⟨1147, 4587, 4588⟩)
                  (.leaf ⟨1147, 4587, 4588⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1147, 4587, 4588⟩)
                  (.leaf ⟨1148, 4587, 4508⟩)
                )
                (.branch 1
                  (.leaf ⟨1148, 4587, 4508⟩)
                  (.leaf ⟨1148, 4587, 4508⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1148, 4587, 4508⟩)
                  (.leaf ⟨1148, 4587, 4508⟩)
                )
                (.branch 1
                  (.leaf ⟨1149, 4595, 4596⟩)
                  (.leaf ⟨1149, 4595, 4596⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1149, 4595, 4596⟩)
                  (.leaf ⟨1149, 4595, 4596⟩)
                )
                (.branch 1
                  (.leaf ⟨1149, 4595, 4596⟩)
                  (.leaf ⟨1150, 4599, 4600⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1150, 4599, 4600⟩)
                  (.leaf ⟨1150, 4599, 4600⟩)
                )
                (.branch 1
                  (.leaf ⟨1150, 4599, 4600⟩)
                  (.leaf ⟨1150, 4599, 4600⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1151, 4603, 4604⟩)
                  (.leaf ⟨1151, 4603, 4604⟩)
                )
                (.branch 1
                  (.leaf ⟨1151, 4603, 4604⟩)
                  (.leaf ⟨1151, 4603, 4604⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1151, 4603, 4604⟩)
                  (.leaf ⟨1152, 427191, 427192⟩)
                )
                (.branch 1
                  (.leaf ⟨1152, 427191, 427192⟩)
                  (.leaf ⟨1152, 427191, 427192⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1152, 427191, 427192⟩)
                  (.leaf ⟨1152, 427191, 427192⟩)
                )
                (.branch 1
                  (.leaf ⟨1153, 4609, 4610⟩)
                  (.leaf ⟨1153, 4609, 4610⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1153, 4609, 4610⟩)
                  (.leaf ⟨1153, 4609, 4610⟩)
                )
                (.branch 1
                  (.leaf ⟨1153, 4609, 4610⟩)
                  (.leaf ⟨1154, 4613, 4614⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1154, 4613, 4614⟩)
                  (.leaf ⟨1154, 4613, 4614⟩)
                )
                (.branch 1
                  (.leaf ⟨1154, 4613, 4614⟩)
                  (.leaf ⟨1154, 4613, 4614⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1155, 4617, 4618⟩)
                  (.leaf ⟨1155, 4617, 4618⟩)
                )
                (.branch 1
                  (.leaf ⟨1155, 4617, 4618⟩)
                  (.leaf ⟨1155, 4617, 4618⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_7168_512 : Balanced.RowTree Cell :=
  .branch 256 cache_7168_256 cache_7424_256
noncomputable def cache_7680_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1155, 4617, 4618⟩)
                  (.leaf ⟨1156, 4621, 4622⟩)
                )
                (.branch 1
                  (.leaf ⟨1156, 4621, 4622⟩)
                  (.leaf ⟨1156, 4621, 4622⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1156, 4621, 4622⟩)
                  (.leaf ⟨1156, 4621, 4622⟩)
                )
                (.branch 1
                  (.leaf ⟨1157, 4625, 4626⟩)
                  (.leaf ⟨1157, 4625, 4626⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1157, 4625, 4626⟩)
                  (.leaf ⟨1157, 4625, 4626⟩)
                )
                (.branch 1
                  (.leaf ⟨1157, 4625, 4626⟩)
                  (.leaf ⟨1158, 4629, 4630⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1158, 4629, 4630⟩)
                  (.leaf ⟨1158, 4629, 4630⟩)
                )
                (.branch 1
                  (.leaf ⟨1158, 4629, 4630⟩)
                  (.leaf ⟨1158, 4629, 4630⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1159, 4633, 4634⟩)
                  (.leaf ⟨1159, 4633, 4634⟩)
                )
                (.branch 1
                  (.leaf ⟨1159, 4633, 4634⟩)
                  (.leaf ⟨1159, 4633, 4634⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1159, 4633, 4634⟩)
                  (.leaf ⟨1160, 4637, 4638⟩)
                )
                (.branch 1
                  (.leaf ⟨1160, 4637, 4638⟩)
                  (.leaf ⟨1160, 4637, 4638⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1160, 4637, 4638⟩)
                  (.leaf ⟨1160, 4637, 4638⟩)
                )
                (.branch 1
                  (.leaf ⟨1161, 4641, 4642⟩)
                  (.leaf ⟨1161, 4641, 4642⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1161, 4641, 4642⟩)
                  (.leaf ⟨1161, 4641, 4642⟩)
                )
                (.branch 1
                  (.leaf ⟨1161, 4641, 4642⟩)
                  (.leaf ⟨1162, 4645, 4646⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1162, 4645, 4646⟩)
                  (.leaf ⟨1162, 4645, 4646⟩)
                )
                (.branch 1
                  (.leaf ⟨1162, 4645, 4646⟩)
                  (.leaf ⟨1162, 4645, 4646⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1163, 4649, 4650⟩)
                  (.leaf ⟨1163, 4649, 4650⟩)
                )
                (.branch 1
                  (.leaf ⟨1163, 4649, 4650⟩)
                  (.leaf ⟨1163, 4649, 4650⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1163, 4649, 4650⟩)
                  (.leaf ⟨1164, 4653, 4654⟩)
                )
                (.branch 1
                  (.leaf ⟨1164, 4653, 4654⟩)
                  (.leaf ⟨1164, 4653, 4654⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1164, 4653, 4654⟩)
                  (.leaf ⟨1164, 4653, 4654⟩)
                )
                (.branch 1
                  (.leaf ⟨1165, 4657, 4658⟩)
                  (.leaf ⟨1165, 4657, 4658⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1165, 4657, 4658⟩)
                  (.leaf ⟨1165, 4657, 4658⟩)
                )
                (.branch 1
                  (.leaf ⟨1165, 4657, 4658⟩)
                  (.leaf ⟨1166, 4127, 4128⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1166, 4127, 4128⟩)
                  (.leaf ⟨1166, 4127, 4128⟩)
                )
                (.branch 1
                  (.leaf ⟨1166, 4127, 4128⟩)
                  (.leaf ⟨1166, 4127, 4128⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1167, 4665, 4666⟩)
                  (.leaf ⟨1167, 4665, 4666⟩)
                )
                (.branch 1
                  (.leaf ⟨1167, 4665, 4666⟩)
                  (.leaf ⟨1167, 4665, 4666⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1167, 4665, 4666⟩)
                  (.leaf ⟨1168, 4669, 4670⟩)
                )
                (.branch 1
                  (.leaf ⟨1168, 4669, 4670⟩)
                  (.leaf ⟨1168, 4669, 4670⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1168, 4669, 4670⟩)
                  (.leaf ⟨1168, 4669, 4670⟩)
                )
                (.branch 1
                  (.leaf ⟨1169, 4673, 4674⟩)
                  (.leaf ⟨1169, 4673, 4674⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1169, 4673, 4674⟩)
                  (.leaf ⟨1169, 4673, 4674⟩)
                )
                (.branch 1
                  (.leaf ⟨1169, 4673, 4674⟩)
                  (.leaf ⟨1170, 4677, 4678⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1170, 4677, 4678⟩)
                  (.leaf ⟨1170, 4677, 4678⟩)
                )
                (.branch 1
                  (.leaf ⟨1170, 4677, 4678⟩)
                  (.leaf ⟨1170, 4677, 4678⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1171, 4681, 4682⟩)
                  (.leaf ⟨1171, 4681, 4682⟩)
                )
                (.branch 1
                  (.leaf ⟨1171, 4681, 4682⟩)
                  (.leaf ⟨1171, 4681, 4682⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1171, 4681, 4682⟩)
                  (.leaf ⟨1172, 4685, 4686⟩)
                )
                (.branch 1
                  (.leaf ⟨1172, 4685, 4686⟩)
                  (.leaf ⟨1172, 4685, 4686⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1172, 4685, 4686⟩)
                  (.leaf ⟨1172, 4685, 4686⟩)
                )
                (.branch 1
                  (.leaf ⟨1173, 4689, 4690⟩)
                  (.leaf ⟨1173, 4689, 4690⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1173, 4689, 4690⟩)
                  (.leaf ⟨1173, 4689, 4690⟩)
                )
                (.branch 1
                  (.leaf ⟨1173, 4689, 4690⟩)
                  (.leaf ⟨1174, 4693, 4694⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1174, 4693, 4694⟩)
                  (.leaf ⟨1174, 4693, 4694⟩)
                )
                (.branch 1
                  (.leaf ⟨1174, 4693, 4694⟩)
                  (.leaf ⟨1174, 4693, 4694⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1175, 4697, 4698⟩)
                  (.leaf ⟨1175, 4697, 4698⟩)
                )
                (.branch 1
                  (.leaf ⟨1175, 4697, 4698⟩)
                  (.leaf ⟨1175, 4697, 4698⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1175, 4697, 4698⟩)
                  (.leaf ⟨1176, 4701, 4702⟩)
                )
                (.branch 1
                  (.leaf ⟨1176, 4701, 4702⟩)
                  (.leaf ⟨1176, 4701, 4702⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1176, 4701, 4702⟩)
                  (.leaf ⟨1176, 4701, 4702⟩)
                )
                (.branch 1
                  (.leaf ⟨1177, 4705, 4706⟩)
                  (.leaf ⟨1177, 4705, 4706⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1177, 4705, 4706⟩)
                  (.leaf ⟨1177, 4705, 4706⟩)
                )
                (.branch 1
                  (.leaf ⟨1177, 4705, 4706⟩)
                  (.leaf ⟨1178, 4709, 4710⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1178, 4709, 4710⟩)
                  (.leaf ⟨1178, 4709, 4710⟩)
                )
                (.branch 1
                  (.leaf ⟨1178, 4709, 4710⟩)
                  (.leaf ⟨1178, 4709, 4710⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1179, 427195, 427196⟩)
                  (.leaf ⟨1179, 427195, 427196⟩)
                )
                (.branch 1
                  (.leaf ⟨1179, 427195, 427196⟩)
                  (.leaf ⟨1179, 427195, 427196⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1179, 427195, 427196⟩)
                  (.leaf ⟨1180, 4717, 4718⟩)
                )
                (.branch 1
                  (.leaf ⟨1180, 4717, 4718⟩)
                  (.leaf ⟨1180, 4717, 4718⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1180, 4717, 4718⟩)
                  (.leaf ⟨1180, 4717, 4718⟩)
                )
                (.branch 1
                  (.leaf ⟨1181, 4721, 4722⟩)
                  (.leaf ⟨1181, 4721, 4722⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1181, 4721, 4722⟩)
                  (.leaf ⟨1181, 4721, 4722⟩)
                )
                (.branch 1
                  (.leaf ⟨1181, 4721, 4722⟩)
                  (.leaf ⟨1182, 4725, 4726⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1182, 4725, 4726⟩)
                  (.leaf ⟨1182, 4725, 4726⟩)
                )
                (.branch 1
                  (.leaf ⟨1182, 4725, 4726⟩)
                  (.leaf ⟨1182, 4725, 4726⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1183, 4729, 4730⟩)
                  (.leaf ⟨1183, 4729, 4730⟩)
                )
                (.branch 1
                  (.leaf ⟨1183, 4729, 4730⟩)
                  (.leaf ⟨1183, 4729, 4730⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1183, 4729, 4730⟩)
                  (.leaf ⟨1184, 4733, 4734⟩)
                )
                (.branch 1
                  (.leaf ⟨1184, 4733, 4734⟩)
                  (.leaf ⟨1184, 4733, 4734⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1184, 4733, 4734⟩)
                  (.leaf ⟨1184, 4733, 4734⟩)
                )
                (.branch 1
                  (.leaf ⟨1185, 4737, 4738⟩)
                  (.leaf ⟨1185, 4737, 4738⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1185, 4737, 4738⟩)
                  (.leaf ⟨1185, 4737, 4738⟩)
                )
                (.branch 1
                  (.leaf ⟨1185, 4737, 4738⟩)
                  (.leaf ⟨1186, 4741, 4742⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1186, 4741, 4742⟩)
                  (.leaf ⟨1186, 4741, 4742⟩)
                )
                (.branch 1
                  (.leaf ⟨1186, 4741, 4742⟩)
                  (.leaf ⟨1186, 4741, 4742⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1187, 4745, 4746⟩)
                  (.leaf ⟨1187, 4745, 4746⟩)
                )
                (.branch 1
                  (.leaf ⟨1187, 4745, 4746⟩)
                  (.leaf ⟨1187, 4745, 4746⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1187, 4745, 4746⟩)
                  (.leaf ⟨1188, 4749, 4750⟩)
                )
                (.branch 1
                  (.leaf ⟨1188, 4749, 4750⟩)
                  (.leaf ⟨1188, 4749, 4750⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1188, 4749, 4750⟩)
                  (.leaf ⟨1188, 4749, 4750⟩)
                )
                (.branch 1
                  (.leaf ⟨1189, 4753, 4754⟩)
                  (.leaf ⟨1189, 4753, 4754⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1189, 4753, 4754⟩)
                  (.leaf ⟨1189, 4753, 4754⟩)
                )
                (.branch 1
                  (.leaf ⟨1189, 4753, 4754⟩)
                  (.leaf ⟨1190, 4757, 4758⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1190, 4757, 4758⟩)
                  (.leaf ⟨1190, 4757, 4758⟩)
                )
                (.branch 1
                  (.leaf ⟨1190, 4757, 4758⟩)
                  (.leaf ⟨1190, 4757, 4758⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1191, 4761, 4762⟩)
                  (.leaf ⟨1191, 4761, 4762⟩)
                )
                (.branch 1
                  (.leaf ⟨1191, 4761, 4762⟩)
                  (.leaf ⟨1191, 4761, 4762⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1191, 4761, 4762⟩)
                  (.leaf ⟨1192, 4761, 4710⟩)
                )
                (.branch 1
                  (.leaf ⟨1192, 4761, 4710⟩)
                  (.leaf ⟨1192, 4761, 4710⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1192, 4761, 4710⟩)
                  (.leaf ⟨1192, 4761, 4710⟩)
                )
                (.branch 1
                  (.leaf ⟨1193, 4771, 4772⟩)
                  (.leaf ⟨1193, 4771, 4772⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1193, 4771, 4772⟩)
                  (.leaf ⟨1193, 4771, 4772⟩)
                )
                (.branch 1
                  (.leaf ⟨1193, 4771, 4772⟩)
                  (.leaf ⟨1194, 4775, 4776⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1194, 4775, 4776⟩)
                  (.leaf ⟨1194, 4775, 4776⟩)
                )
                (.branch 1
                  (.leaf ⟨1194, 4775, 4776⟩)
                  (.leaf ⟨1194, 4775, 4776⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1195, 4779, 4780⟩)
                  (.leaf ⟨1195, 4779, 4780⟩)
                )
                (.branch 1
                  (.leaf ⟨1195, 4779, 4780⟩)
                  (.leaf ⟨1195, 4779, 4780⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1195, 4779, 4780⟩)
                  (.leaf ⟨1196, 4783, 4784⟩)
                )
                (.branch 1
                  (.leaf ⟨1196, 4783, 4784⟩)
                  (.leaf ⟨1196, 4783, 4784⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1196, 4783, 4784⟩)
                  (.leaf ⟨1196, 4783, 4784⟩)
                )
                (.branch 1
                  (.leaf ⟨1197, 4787, 4788⟩)
                  (.leaf ⟨1197, 4787, 4788⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1197, 4787, 4788⟩)
                  (.leaf ⟨1197, 4787, 4788⟩)
                )
                (.branch 1
                  (.leaf ⟨1197, 4787, 4788⟩)
                  (.leaf ⟨1198, 4791, 4792⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1198, 4791, 4792⟩)
                  (.leaf ⟨1198, 4791, 4792⟩)
                )
                (.branch 1
                  (.leaf ⟨1198, 4791, 4792⟩)
                  (.leaf ⟨1198, 4791, 4792⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1199, 4795, 4796⟩)
                  (.leaf ⟨1199, 4795, 4796⟩)
                )
                (.branch 1
                  (.leaf ⟨1199, 4795, 4796⟩)
                  (.leaf ⟨1199, 4795, 4796⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1199, 4795, 4796⟩)
                  (.leaf ⟨1200, 4799, 4800⟩)
                )
                (.branch 1
                  (.leaf ⟨1200, 4799, 4800⟩)
                  (.leaf ⟨1200, 4799, 4800⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1200, 4799, 4800⟩)
                  (.leaf ⟨1200, 4799, 4800⟩)
                )
                (.branch 1
                  (.leaf ⟨1201, 4803, 4804⟩)
                  (.leaf ⟨1201, 4803, 4804⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1201, 4803, 4804⟩)
                  (.leaf ⟨1201, 4803, 4804⟩)
                )
                (.branch 1
                  (.leaf ⟨1201, 4803, 4804⟩)
                  (.leaf ⟨1202, 4807, 4808⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1202, 4807, 4808⟩)
                  (.leaf ⟨1202, 4807, 4808⟩)
                )
                (.branch 1
                  (.leaf ⟨1202, 4807, 4808⟩)
                  (.leaf ⟨1202, 4807, 4808⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1203, 4811, 4812⟩)
                  (.leaf ⟨1203, 4811, 4812⟩)
                )
                (.branch 1
                  (.leaf ⟨1203, 4811, 4812⟩)
                  (.leaf ⟨1203, 4811, 4812⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1203, 4811, 4812⟩)
                  (.leaf ⟨1204, 4815, 4816⟩)
                )
                (.branch 1
                  (.leaf ⟨1204, 4815, 4816⟩)
                  (.leaf ⟨1204, 4815, 4816⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1204, 4815, 4816⟩)
                  (.leaf ⟨1204, 4815, 4816⟩)
                )
                (.branch 1
                  (.leaf ⟨4, 426187, 426188⟩)
                  (.leaf ⟨4, 426187, 426188⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨4, 426187, 426188⟩)
                  (.leaf ⟨4, 426187, 426188⟩)
                )
                (.branch 1
                  (.leaf ⟨4, 426187, 426188⟩)
                  (.leaf ⟨1205, 19, 20⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1205, 19, 20⟩)
                  (.leaf ⟨1205, 19, 20⟩)
                )
                (.branch 1
                  (.leaf ⟨1205, 19, 20⟩)
                  (.leaf ⟨1205, 19, 20⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_7936_256 : Balanced.RowTree Cell :=
  (.branch 128
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1206, 4823, 4824⟩)
                  (.leaf ⟨1206, 4823, 4824⟩)
                )
                (.branch 1
                  (.leaf ⟨1206, 4823, 4824⟩)
                  (.leaf ⟨1206, 4823, 4824⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1206, 4823, 4824⟩)
                  (.leaf ⟨1207, 4827, 4828⟩)
                )
                (.branch 1
                  (.leaf ⟨1207, 4827, 4828⟩)
                  (.leaf ⟨1207, 4827, 4828⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1207, 4827, 4828⟩)
                  (.leaf ⟨1207, 4827, 4828⟩)
                )
                (.branch 1
                  (.leaf ⟨1208, 4831, 4832⟩)
                  (.leaf ⟨1208, 4831, 4832⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1208, 4831, 4832⟩)
                  (.leaf ⟨1208, 4831, 4832⟩)
                )
                (.branch 1
                  (.leaf ⟨1208, 4831, 4832⟩)
                  (.leaf ⟨1209, 4835, 4836⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1209, 4835, 4836⟩)
                  (.leaf ⟨1209, 4835, 4836⟩)
                )
                (.branch 1
                  (.leaf ⟨1209, 4835, 4836⟩)
                  (.leaf ⟨1209, 4835, 4836⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1210, 4839, 4840⟩)
                  (.leaf ⟨1210, 4839, 4840⟩)
                )
                (.branch 1
                  (.leaf ⟨1210, 4839, 4840⟩)
                  (.leaf ⟨1210, 4839, 4840⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1210, 4839, 4840⟩)
                  (.leaf ⟨1211, 4843, 4844⟩)
                )
                (.branch 1
                  (.leaf ⟨1211, 4843, 4844⟩)
                  (.leaf ⟨1211, 4843, 4844⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1211, 4843, 4844⟩)
                  (.leaf ⟨1211, 4843, 4844⟩)
                )
                (.branch 1
                  (.leaf ⟨1212, 4847, 4848⟩)
                  (.leaf ⟨1212, 4847, 4848⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1212, 4847, 4848⟩)
                  (.leaf ⟨1212, 4847, 4848⟩)
                )
                (.branch 1
                  (.leaf ⟨1212, 4847, 4848⟩)
                  (.leaf ⟨1213, 4851, 4852⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1213, 4851, 4852⟩)
                  (.leaf ⟨1213, 4851, 4852⟩)
                )
                (.branch 1
                  (.leaf ⟨1213, 4851, 4852⟩)
                  (.leaf ⟨1213, 4851, 4852⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1214, 4855, 4856⟩)
                  (.leaf ⟨1214, 4855, 4856⟩)
                )
                (.branch 1
                  (.leaf ⟨1214, 4855, 4856⟩)
                  (.leaf ⟨1214, 4855, 4856⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1214, 4855, 4856⟩)
                  (.leaf ⟨1215, 4859, 4860⟩)
                )
                (.branch 1
                  (.leaf ⟨1215, 4859, 4860⟩)
                  (.leaf ⟨1215, 4859, 4860⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1215, 4859, 4860⟩)
                  (.leaf ⟨1215, 4859, 4860⟩)
                )
                (.branch 1
                  (.leaf ⟨1216, 4863, 4864⟩)
                  (.leaf ⟨1216, 4863, 4864⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1216, 4863, 4864⟩)
                  (.leaf ⟨1216, 4863, 4864⟩)
                )
                (.branch 1
                  (.leaf ⟨1216, 4863, 4864⟩)
                  (.leaf ⟨1217, 4867, 4868⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1217, 4867, 4868⟩)
                  (.leaf ⟨1217, 4867, 4868⟩)
                )
                (.branch 1
                  (.leaf ⟨1217, 4867, 4868⟩)
                  (.leaf ⟨1217, 4867, 4868⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1218, 427199, 427200⟩)
                  (.leaf ⟨1218, 427199, 427200⟩)
                )
                (.branch 1
                  (.leaf ⟨1218, 427199, 427200⟩)
                  (.leaf ⟨1218, 427199, 427200⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1218, 427199, 427200⟩)
                  (.leaf ⟨1219, 4873, 4874⟩)
                )
                (.branch 1
                  (.leaf ⟨1219, 4873, 4874⟩)
                  (.leaf ⟨1219, 4873, 4874⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1219, 4873, 4874⟩)
                  (.leaf ⟨1219, 4873, 4874⟩)
                )
                (.branch 1
                  (.leaf ⟨1220, 4877, 4878⟩)
                  (.leaf ⟨1220, 4877, 4878⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1220, 4877, 4878⟩)
                  (.leaf ⟨1220, 4877, 4878⟩)
                )
                (.branch 1
                  (.leaf ⟨1220, 4877, 4878⟩)
                  (.leaf ⟨1221, 4881, 4882⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1221, 4881, 4882⟩)
                  (.leaf ⟨1221, 4881, 4882⟩)
                )
                (.branch 1
                  (.leaf ⟨1221, 4881, 4882⟩)
                  (.leaf ⟨1221, 4881, 4882⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1222, 4885, 4886⟩)
                  (.leaf ⟨1222, 4885, 4886⟩)
                )
                (.branch 1
                  (.leaf ⟨1222, 4885, 4886⟩)
                  (.leaf ⟨1222, 4885, 4886⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1222, 4885, 4886⟩)
                  (.leaf ⟨1223, 4889, 4890⟩)
                )
                (.branch 1
                  (.leaf ⟨1223, 4889, 4890⟩)
                  (.leaf ⟨1223, 4889, 4890⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1223, 4889, 4890⟩)
                  (.leaf ⟨1223, 4889, 4890⟩)
                )
                (.branch 1
                  (.leaf ⟨1224, 4893, 4894⟩)
                  (.leaf ⟨1224, 4893, 4894⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1224, 4893, 4894⟩)
                  (.leaf ⟨1224, 4893, 4894⟩)
                )
                (.branch 1
                  (.leaf ⟨1224, 4893, 4894⟩)
                  (.leaf ⟨1225, 4899, 4900⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1225, 4899, 4900⟩)
                  (.leaf ⟨1225, 4899, 4900⟩)
                )
                (.branch 1
                  (.leaf ⟨1225, 4899, 4900⟩)
                  (.leaf ⟨1225, 4899, 4900⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1226, 427203, 427204⟩)
                  (.leaf ⟨1226, 427203, 427204⟩)
                )
                (.branch 1
                  (.leaf ⟨1226, 427203, 427204⟩)
                  (.leaf ⟨1226, 427203, 427204⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1226, 427203, 427204⟩)
                  (.leaf ⟨1227, 4905, 4906⟩)
                )
                (.branch 1
                  (.leaf ⟨1227, 4905, 4906⟩)
                  (.leaf ⟨1227, 4905, 4906⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1227, 4905, 4906⟩)
                  (.leaf ⟨1227, 4905, 4906⟩)
                )
                (.branch 1
                  (.leaf ⟨1228, 4909, 4910⟩)
                  (.leaf ⟨1228, 4909, 4910⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1228, 4909, 4910⟩)
                  (.leaf ⟨1228, 4909, 4910⟩)
                )
                (.branch 1
                  (.leaf ⟨1228, 4909, 4910⟩)
                  (.leaf ⟨1229, 4913, 4914⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1229, 4913, 4914⟩)
                  (.leaf ⟨1229, 4913, 4914⟩)
                )
                (.branch 1
                  (.leaf ⟨1229, 4913, 4914⟩)
                  (.leaf ⟨1229, 4913, 4914⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1230, 4917, 4918⟩)
                  (.leaf ⟨1230, 4917, 4918⟩)
                )
                (.branch 1
                  (.leaf ⟨1230, 4917, 4918⟩)
                  (.leaf ⟨1230, 4917, 4918⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1230, 4917, 4918⟩)
                  (.leaf ⟨1231, 4921, 4922⟩)
                )
                (.branch 1
                  (.leaf ⟨1231, 4921, 4922⟩)
                  (.leaf ⟨1231, 4921, 4922⟩)
                )
              )
            )
          )
        )
      )
    )
    (.branch 64
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1231, 4921, 4922⟩)
                  (.leaf ⟨1231, 4921, 4922⟩)
                )
                (.branch 1
                  (.leaf ⟨1232, 4925, 4926⟩)
                  (.leaf ⟨1232, 4925, 4926⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1232, 4925, 4926⟩)
                  (.leaf ⟨1232, 4925, 4926⟩)
                )
                (.branch 1
                  (.leaf ⟨1232, 4925, 4926⟩)
                  (.leaf ⟨1233, 4931, 4932⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1233, 4931, 4932⟩)
                  (.leaf ⟨1233, 4931, 4932⟩)
                )
                (.branch 1
                  (.leaf ⟨1233, 4931, 4932⟩)
                  (.leaf ⟨1233, 4931, 4932⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1234, 4931, 4900⟩)
                  (.leaf ⟨1234, 4931, 4900⟩)
                )
                (.branch 1
                  (.leaf ⟨1234, 4931, 4900⟩)
                  (.leaf ⟨1234, 4931, 4900⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1234, 4931, 4900⟩)
                  (.leaf ⟨1235, 4939, 4940⟩)
                )
                (.branch 1
                  (.leaf ⟨1235, 4939, 4940⟩)
                  (.leaf ⟨1235, 4939, 4940⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1235, 4939, 4940⟩)
                  (.leaf ⟨1235, 4939, 4940⟩)
                )
                (.branch 1
                  (.leaf ⟨1218, 427199, 427200⟩)
                  (.leaf ⟨1218, 427199, 427200⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1218, 427199, 427200⟩)
                  (.leaf ⟨1218, 427199, 427200⟩)
                )
                (.branch 1
                  (.leaf ⟨1218, 427199, 427200⟩)
                  (.leaf ⟨1219, 4873, 4874⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1219, 4873, 4874⟩)
                  (.leaf ⟨1219, 4873, 4874⟩)
                )
                (.branch 1
                  (.leaf ⟨1219, 4873, 4874⟩)
                  (.leaf ⟨1219, 4873, 4874⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1220, 4877, 4878⟩)
                  (.leaf ⟨1220, 4877, 4878⟩)
                )
                (.branch 1
                  (.leaf ⟨1220, 4877, 4878⟩)
                  (.leaf ⟨1220, 4877, 4878⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1220, 4877, 4878⟩)
                  (.leaf ⟨1221, 4881, 4882⟩)
                )
                (.branch 1
                  (.leaf ⟨1221, 4881, 4882⟩)
                  (.leaf ⟨1221, 4881, 4882⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1221, 4881, 4882⟩)
                  (.leaf ⟨1221, 4881, 4882⟩)
                )
                (.branch 1
                  (.leaf ⟨1222, 4885, 4886⟩)
                  (.leaf ⟨1222, 4885, 4886⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1222, 4885, 4886⟩)
                  (.leaf ⟨1222, 4885, 4886⟩)
                )
                (.branch 1
                  (.leaf ⟨1222, 4885, 4886⟩)
                  (.leaf ⟨1223, 4889, 4890⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1223, 4889, 4890⟩)
                  (.leaf ⟨1223, 4889, 4890⟩)
                )
                (.branch 1
                  (.leaf ⟨1223, 4889, 4890⟩)
                  (.leaf ⟨1223, 4889, 4890⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1224, 4893, 4894⟩)
                  (.leaf ⟨1224, 4893, 4894⟩)
                )
                (.branch 1
                  (.leaf ⟨1224, 4893, 4894⟩)
                  (.leaf ⟨1224, 4893, 4894⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1224, 4893, 4894⟩)
                  (.leaf ⟨1225, 4899, 4900⟩)
                )
                (.branch 1
                  (.leaf ⟨1225, 4899, 4900⟩)
                  (.leaf ⟨1225, 4899, 4900⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1225, 4899, 4900⟩)
                  (.leaf ⟨1225, 4899, 4900⟩)
                )
                (.branch 1
                  (.leaf ⟨1226, 427203, 427204⟩)
                  (.leaf ⟨1226, 427203, 427204⟩)
                )
              )
            )
          )
        )
      )
      (.branch 32
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1226, 427203, 427204⟩)
                  (.leaf ⟨1226, 427203, 427204⟩)
                )
                (.branch 1
                  (.leaf ⟨1226, 427203, 427204⟩)
                  (.leaf ⟨1227, 4905, 4906⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1227, 4905, 4906⟩)
                  (.leaf ⟨1227, 4905, 4906⟩)
                )
                (.branch 1
                  (.leaf ⟨1227, 4905, 4906⟩)
                  (.leaf ⟨1227, 4905, 4906⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1228, 4909, 4910⟩)
                  (.leaf ⟨1228, 4909, 4910⟩)
                )
                (.branch 1
                  (.leaf ⟨1228, 4909, 4910⟩)
                  (.leaf ⟨1228, 4909, 4910⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1228, 4909, 4910⟩)
                  (.leaf ⟨1229, 4913, 4914⟩)
                )
                (.branch 1
                  (.leaf ⟨1229, 4913, 4914⟩)
                  (.leaf ⟨1229, 4913, 4914⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1229, 4913, 4914⟩)
                  (.leaf ⟨1229, 4913, 4914⟩)
                )
                (.branch 1
                  (.leaf ⟨1230, 4917, 4918⟩)
                  (.leaf ⟨1230, 4917, 4918⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1230, 4917, 4918⟩)
                  (.leaf ⟨1230, 4917, 4918⟩)
                )
                (.branch 1
                  (.leaf ⟨1230, 4917, 4918⟩)
                  (.leaf ⟨1231, 4921, 4922⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1231, 4921, 4922⟩)
                  (.leaf ⟨1231, 4921, 4922⟩)
                )
                (.branch 1
                  (.leaf ⟨1231, 4921, 4922⟩)
                  (.leaf ⟨1231, 4921, 4922⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1232, 4925, 4926⟩)
                  (.leaf ⟨1232, 4925, 4926⟩)
                )
                (.branch 1
                  (.leaf ⟨1232, 4925, 4926⟩)
                  (.leaf ⟨1232, 4925, 4926⟩)
                )
              )
            )
          )
        )
        (.branch 16
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1232, 4925, 4926⟩)
                  (.leaf ⟨1233, 4931, 4932⟩)
                )
                (.branch 1
                  (.leaf ⟨1233, 4931, 4932⟩)
                  (.leaf ⟨1233, 4931, 4932⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1233, 4931, 4932⟩)
                  (.leaf ⟨1233, 4931, 4932⟩)
                )
                (.branch 1
                  (.leaf ⟨1234, 4931, 4900⟩)
                  (.leaf ⟨1234, 4931, 4900⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1234, 4931, 4900⟩)
                  (.leaf ⟨1234, 4931, 4900⟩)
                )
                (.branch 1
                  (.leaf ⟨1234, 4931, 4900⟩)
                  (.leaf ⟨1235, 4939, 4940⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1235, 4939, 4940⟩)
                  (.leaf ⟨1235, 4939, 4940⟩)
                )
                (.branch 1
                  (.leaf ⟨1235, 4939, 4940⟩)
                  (.leaf ⟨1235, 4939, 4940⟩)
                )
              )
            )
          )
          (.branch 8
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1235, 4939, 4940⟩)
                  (.leaf ⟨1235, 4939, 4940⟩)
                )
                (.branch 1
                  (.leaf ⟨1235, 4939, 4940⟩)
                  (.leaf ⟨1235, 4939, 4940⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1235, 4939, 4940⟩)
                  (.leaf ⟨1236, 4943, 4944⟩)
                )
                (.branch 1
                  (.leaf ⟨1236, 4943, 4944⟩)
                  (.leaf ⟨1236, 4943, 4944⟩)
                )
              )
            )
            (.branch 4
              (.branch 2
                (.branch 1
                  (.leaf ⟨1236, 4943, 4944⟩)
                  (.leaf ⟨1236, 4943, 4944⟩)
                )
                (.branch 1
                  (.leaf ⟨1218, 427199, 427200⟩)
                  (.leaf ⟨1218, 427199, 427200⟩)
                )
              )
              (.branch 2
                (.branch 1
                  (.leaf ⟨1218, 427199, 427200⟩)
                  (.leaf ⟨1218, 427199, 427200⟩)
                )
                (.branch 1
                  (.leaf ⟨1218, 427199, 427200⟩)
                  (.leaf ⟨1219, 4873, 4874⟩)
                )
              )
            )
          )
        )
      )
    )
  )
noncomputable def cache_7680_512 : Balanced.RowTree Cell :=
  .branch 256 cache_7680_256 cache_7936_256
noncomputable def cache_7168_1024 : Balanced.RowTree Cell :=
  .branch 512 cache_7168_512 cache_7680_512
noncomputable def cache_6144_2048 : Balanced.RowTree Cell :=
  .branch 1024 cache_6144_1024 cache_7168_1024
noncomputable def cache_4096_4096 : Balanced.RowTree Cell :=
  .branch 2048 cache_4096_2048 cache_6144_2048
noncomputable def cache_0_8192 : Balanced.RowTree Cell :=
  .branch 4096 cache_0_4096 cache_4096_4096
noncomputable def cache : Balanced.RowTree Cell := cache_0_8192
end LookupCache8192Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Numeric observation cache data loaded: 8192"
