module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LookupCache

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace LookupCache128Pilot
noncomputable def cache_0_128 : Balanced.RowTree Cell :=
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
noncomputable def cache : Balanced.RowTree Cell := cache_0_128
end LookupCache128Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Numeric observation cache data loaded: 128"
