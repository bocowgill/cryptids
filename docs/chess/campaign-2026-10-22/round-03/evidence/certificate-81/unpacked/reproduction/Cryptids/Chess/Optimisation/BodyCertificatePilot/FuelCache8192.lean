module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.FuelObservation
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LookupCache8192Data

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCache8192Pilot FuelObservationPilot
namespace FuelCache8192Pilot
theorem checked_0_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_0_256 0 = some 256 := by
  decide +kernel
theorem checked_256_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_256_256 256 = some 512 := by
  decide +kernel
theorem checked_0_512 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_0_512 0 = some 512 := by
  exact FuelObservationPilot.validate_branch 256
    LookupCache8192Pilot.cache_0_256 LookupCache8192Pilot.cache_256_256
    0 256 512
    checked_0_256 rfl checked_256_256
theorem checked_512_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_512_256 512 = some 768 := by
  decide +kernel
theorem checked_768_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_768_256 768 = some 1024 := by
  decide +kernel
theorem checked_512_512 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_512_512 512 = some 1024 := by
  exact FuelObservationPilot.validate_branch 256
    LookupCache8192Pilot.cache_512_256 LookupCache8192Pilot.cache_768_256
    512 768 1024
    checked_512_256 rfl checked_768_256
theorem checked_0_1024 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_0_1024 0 = some 1024 := by
  exact FuelObservationPilot.validate_branch 512
    LookupCache8192Pilot.cache_0_512 LookupCache8192Pilot.cache_512_512
    0 512 1024
    checked_0_512 rfl checked_512_512
theorem checked_1024_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_1024_256 1024 = some 1280 := by
  decide +kernel
theorem checked_1280_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_1280_256 1280 = some 1536 := by
  decide +kernel
theorem checked_1024_512 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_1024_512 1024 = some 1536 := by
  exact FuelObservationPilot.validate_branch 256
    LookupCache8192Pilot.cache_1024_256 LookupCache8192Pilot.cache_1280_256
    1024 1280 1536
    checked_1024_256 rfl checked_1280_256
theorem checked_1536_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_1536_256 1536 = some 1792 := by
  decide +kernel
theorem checked_1792_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_1792_256 1792 = some 2048 := by
  decide +kernel
theorem checked_1536_512 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_1536_512 1536 = some 2048 := by
  exact FuelObservationPilot.validate_branch 256
    LookupCache8192Pilot.cache_1536_256 LookupCache8192Pilot.cache_1792_256
    1536 1792 2048
    checked_1536_256 rfl checked_1792_256
theorem checked_1024_1024 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_1024_1024 1024 = some 2048 := by
  exact FuelObservationPilot.validate_branch 512
    LookupCache8192Pilot.cache_1024_512 LookupCache8192Pilot.cache_1536_512
    1024 1536 2048
    checked_1024_512 rfl checked_1536_512
theorem checked_0_2048 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_0_2048 0 = some 2048 := by
  exact FuelObservationPilot.validate_branch 1024
    LookupCache8192Pilot.cache_0_1024 LookupCache8192Pilot.cache_1024_1024
    0 1024 2048
    checked_0_1024 rfl checked_1024_1024
theorem checked_2048_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_2048_256 2048 = some 2304 := by
  decide +kernel
theorem checked_2304_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_2304_256 2304 = some 2560 := by
  decide +kernel
theorem checked_2048_512 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_2048_512 2048 = some 2560 := by
  exact FuelObservationPilot.validate_branch 256
    LookupCache8192Pilot.cache_2048_256 LookupCache8192Pilot.cache_2304_256
    2048 2304 2560
    checked_2048_256 rfl checked_2304_256
theorem checked_2560_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_2560_256 2560 = some 2816 := by
  decide +kernel
theorem checked_2816_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_2816_256 2816 = some 3072 := by
  decide +kernel
theorem checked_2560_512 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_2560_512 2560 = some 3072 := by
  exact FuelObservationPilot.validate_branch 256
    LookupCache8192Pilot.cache_2560_256 LookupCache8192Pilot.cache_2816_256
    2560 2816 3072
    checked_2560_256 rfl checked_2816_256
theorem checked_2048_1024 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_2048_1024 2048 = some 3072 := by
  exact FuelObservationPilot.validate_branch 512
    LookupCache8192Pilot.cache_2048_512 LookupCache8192Pilot.cache_2560_512
    2048 2560 3072
    checked_2048_512 rfl checked_2560_512
theorem checked_3072_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_3072_256 3072 = some 3328 := by
  decide +kernel
theorem checked_3328_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_3328_256 3328 = some 3584 := by
  decide +kernel
theorem checked_3072_512 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_3072_512 3072 = some 3584 := by
  exact FuelObservationPilot.validate_branch 256
    LookupCache8192Pilot.cache_3072_256 LookupCache8192Pilot.cache_3328_256
    3072 3328 3584
    checked_3072_256 rfl checked_3328_256
theorem checked_3584_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_3584_256 3584 = some 3840 := by
  decide +kernel
theorem checked_3840_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_3840_256 3840 = some 4096 := by
  decide +kernel
theorem checked_3584_512 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_3584_512 3584 = some 4096 := by
  exact FuelObservationPilot.validate_branch 256
    LookupCache8192Pilot.cache_3584_256 LookupCache8192Pilot.cache_3840_256
    3584 3840 4096
    checked_3584_256 rfl checked_3840_256
theorem checked_3072_1024 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_3072_1024 3072 = some 4096 := by
  exact FuelObservationPilot.validate_branch 512
    LookupCache8192Pilot.cache_3072_512 LookupCache8192Pilot.cache_3584_512
    3072 3584 4096
    checked_3072_512 rfl checked_3584_512
theorem checked_2048_2048 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_2048_2048 2048 = some 4096 := by
  exact FuelObservationPilot.validate_branch 1024
    LookupCache8192Pilot.cache_2048_1024 LookupCache8192Pilot.cache_3072_1024
    2048 3072 4096
    checked_2048_1024 rfl checked_3072_1024
theorem checked_0_4096 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_0_4096 0 = some 4096 := by
  exact FuelObservationPilot.validate_branch 2048
    LookupCache8192Pilot.cache_0_2048 LookupCache8192Pilot.cache_2048_2048
    0 2048 4096
    checked_0_2048 rfl checked_2048_2048
theorem checked_4096_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_4096_256 4096 = some 4352 := by
  decide +kernel
theorem checked_4352_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_4352_256 4352 = some 4608 := by
  decide +kernel
theorem checked_4096_512 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_4096_512 4096 = some 4608 := by
  exact FuelObservationPilot.validate_branch 256
    LookupCache8192Pilot.cache_4096_256 LookupCache8192Pilot.cache_4352_256
    4096 4352 4608
    checked_4096_256 rfl checked_4352_256
theorem checked_4608_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_4608_256 4608 = some 4864 := by
  decide +kernel
theorem checked_4864_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_4864_256 4864 = some 5120 := by
  decide +kernel
theorem checked_4608_512 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_4608_512 4608 = some 5120 := by
  exact FuelObservationPilot.validate_branch 256
    LookupCache8192Pilot.cache_4608_256 LookupCache8192Pilot.cache_4864_256
    4608 4864 5120
    checked_4608_256 rfl checked_4864_256
theorem checked_4096_1024 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_4096_1024 4096 = some 5120 := by
  exact FuelObservationPilot.validate_branch 512
    LookupCache8192Pilot.cache_4096_512 LookupCache8192Pilot.cache_4608_512
    4096 4608 5120
    checked_4096_512 rfl checked_4608_512
theorem checked_5120_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_5120_256 5120 = some 5376 := by
  decide +kernel
theorem checked_5376_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_5376_256 5376 = some 5632 := by
  decide +kernel
theorem checked_5120_512 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_5120_512 5120 = some 5632 := by
  exact FuelObservationPilot.validate_branch 256
    LookupCache8192Pilot.cache_5120_256 LookupCache8192Pilot.cache_5376_256
    5120 5376 5632
    checked_5120_256 rfl checked_5376_256
theorem checked_5632_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_5632_256 5632 = some 5888 := by
  decide +kernel
theorem checked_5888_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_5888_256 5888 = some 6144 := by
  decide +kernel
theorem checked_5632_512 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_5632_512 5632 = some 6144 := by
  exact FuelObservationPilot.validate_branch 256
    LookupCache8192Pilot.cache_5632_256 LookupCache8192Pilot.cache_5888_256
    5632 5888 6144
    checked_5632_256 rfl checked_5888_256
theorem checked_5120_1024 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_5120_1024 5120 = some 6144 := by
  exact FuelObservationPilot.validate_branch 512
    LookupCache8192Pilot.cache_5120_512 LookupCache8192Pilot.cache_5632_512
    5120 5632 6144
    checked_5120_512 rfl checked_5632_512
theorem checked_4096_2048 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_4096_2048 4096 = some 6144 := by
  exact FuelObservationPilot.validate_branch 1024
    LookupCache8192Pilot.cache_4096_1024 LookupCache8192Pilot.cache_5120_1024
    4096 5120 6144
    checked_4096_1024 rfl checked_5120_1024
theorem checked_6144_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_6144_256 6144 = some 6400 := by
  decide +kernel
theorem checked_6400_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_6400_256 6400 = some 6656 := by
  decide +kernel
theorem checked_6144_512 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_6144_512 6144 = some 6656 := by
  exact FuelObservationPilot.validate_branch 256
    LookupCache8192Pilot.cache_6144_256 LookupCache8192Pilot.cache_6400_256
    6144 6400 6656
    checked_6144_256 rfl checked_6400_256
theorem checked_6656_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_6656_256 6656 = some 6912 := by
  decide +kernel
theorem checked_6912_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_6912_256 6912 = some 7168 := by
  decide +kernel
theorem checked_6656_512 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_6656_512 6656 = some 7168 := by
  exact FuelObservationPilot.validate_branch 256
    LookupCache8192Pilot.cache_6656_256 LookupCache8192Pilot.cache_6912_256
    6656 6912 7168
    checked_6656_256 rfl checked_6912_256
theorem checked_6144_1024 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_6144_1024 6144 = some 7168 := by
  exact FuelObservationPilot.validate_branch 512
    LookupCache8192Pilot.cache_6144_512 LookupCache8192Pilot.cache_6656_512
    6144 6656 7168
    checked_6144_512 rfl checked_6656_512
theorem checked_7168_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_7168_256 7168 = some 7424 := by
  decide +kernel
theorem checked_7424_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_7424_256 7424 = some 7680 := by
  decide +kernel
theorem checked_7168_512 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_7168_512 7168 = some 7680 := by
  exact FuelObservationPilot.validate_branch 256
    LookupCache8192Pilot.cache_7168_256 LookupCache8192Pilot.cache_7424_256
    7168 7424 7680
    checked_7168_256 rfl checked_7424_256
theorem checked_7680_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_7680_256 7680 = some 7936 := by
  decide +kernel
theorem checked_7936_256 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_7936_256 7936 = some 8192 := by
  decide +kernel
theorem checked_7680_512 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_7680_512 7680 = some 8192 := by
  exact FuelObservationPilot.validate_branch 256
    LookupCache8192Pilot.cache_7680_256 LookupCache8192Pilot.cache_7936_256
    7680 7936 8192
    checked_7680_256 rfl checked_7936_256
theorem checked_7168_1024 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_7168_1024 7168 = some 8192 := by
  exact FuelObservationPilot.validate_branch 512
    LookupCache8192Pilot.cache_7168_512 LookupCache8192Pilot.cache_7680_512
    7168 7680 8192
    checked_7168_512 rfl checked_7680_512
theorem checked_6144_2048 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_6144_2048 6144 = some 8192 := by
  exact FuelObservationPilot.validate_branch 1024
    LookupCache8192Pilot.cache_6144_1024 LookupCache8192Pilot.cache_7168_1024
    6144 7168 8192
    checked_6144_1024 rfl checked_7168_1024
theorem checked_4096_4096 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_4096_4096 4096 = some 8192 := by
  exact FuelObservationPilot.validate_branch 2048
    LookupCache8192Pilot.cache_4096_2048 LookupCache8192Pilot.cache_6144_2048
    4096 6144 8192
    checked_4096_2048 rfl checked_6144_2048
theorem checked_0_8192 : FuelObservationPilot.validate
    LookupCache8192Pilot.cache_0_8192 0 = some 8192 := by
  exact FuelObservationPilot.validate_branch 4096
    LookupCache8192Pilot.cache_0_4096 LookupCache8192Pilot.cache_4096_4096
    0 4096 8192
    checked_0_4096 rfl checked_4096_4096
theorem checked : FuelObservationPilot.validate LookupCache8192Pilot.cache 0 =
    some 8192 := checked_0_8192
theorem original_checked : LookupCachePilot.validate
    LookupCache8192Pilot.cache 0 = some 8192 :=
  (FuelObservationPilot.validate_eq LookupCache8192Pilot.cache 0).symm.trans checked
end FuelCache8192Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Fuel lookup comparison preserves all 8192 expected observations"
