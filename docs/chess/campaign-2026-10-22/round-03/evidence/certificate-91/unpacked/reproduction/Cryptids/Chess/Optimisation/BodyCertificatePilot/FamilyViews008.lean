module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.FamilyViews008Data
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.FamilyWiring
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.FamilyReturns

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace Family737MainPilot
theorem checked_98056_132 : validate cache_98056_132 98056 =
    some 98188 := by
  decide +kernel
theorem checked_98188_133 : validate cache_98188_133 98188 =
    some 98321 := by
  decide +kernel
theorem checked_98056_265 : validate cache_98056_265 98056 =
    some 98321 := by
  exact validate_branch 132 cache_98056_132 cache_98188_133
    98056 98188 98321
    checked_98056_132 rfl checked_98188_133
theorem checked : validate cache 98056 = some 98321 :=
  checked_98056_265
end Family737MainPilot
open LookupCachePilot
namespace Family738MainPilot
theorem checked_98321_5 : validate cache_98321_5 98321 =
    some 98326 := by
  decide +kernel
theorem checked : validate cache 98321 = some 98326 :=
  checked_98321_5
end Family738MainPilot
open LookupCachePilot
namespace Family739MainPilot
theorem checked_98326_70 : validate cache_98326_70 98326 =
    some 98396 := by
  decide +kernel
theorem checked : validate cache 98326 = some 98396 :=
  checked_98326_70
end Family739MainPilot
open LookupCachePilot
namespace Family740MainPilot
theorem checked_98396_167 : validate cache_98396_167 98396 =
    some 98563 := by
  decide +kernel
theorem checked_98563_168 : validate cache_98563_168 98563 =
    some 98731 := by
  decide +kernel
theorem checked_98396_335 : validate cache_98396_335 98396 =
    some 98731 := by
  exact validate_branch 167 cache_98396_167 cache_98563_168
    98396 98563 98731
    checked_98396_167 rfl checked_98563_168
theorem checked_98731_167 : validate cache_98731_167 98731 =
    some 98898 := by
  decide +kernel
theorem checked_98898_168 : validate cache_98898_168 98898 =
    some 99066 := by
  decide +kernel
theorem checked_98731_335 : validate cache_98731_335 98731 =
    some 99066 := by
  exact validate_branch 167 cache_98731_167 cache_98898_168
    98731 98898 99066
    checked_98731_167 rfl checked_98898_168
theorem checked_98396_670 : validate cache_98396_670 98396 =
    some 99066 := by
  exact validate_branch 335 cache_98396_335 cache_98731_335
    98396 98731 99066
    checked_98396_335 rfl checked_98731_335
theorem checked : validate cache 98396 = some 99066 :=
  checked_98396_670
end Family740MainPilot
open LookupCachePilot
namespace Family741MainPilot
theorem checked_99066_70 : validate cache_99066_70 99066 =
    some 99136 := by
  decide +kernel
theorem checked : validate cache 99066 = some 99136 :=
  checked_99066_70
end Family741MainPilot
open LookupCachePilot
namespace Family742MainPilot
theorem checked_99136_167 : validate cache_99136_167 99136 =
    some 99303 := by
  decide +kernel
theorem checked_99303_168 : validate cache_99303_168 99303 =
    some 99471 := by
  decide +kernel
theorem checked_99136_335 : validate cache_99136_335 99136 =
    some 99471 := by
  exact validate_branch 167 cache_99136_167 cache_99303_168
    99136 99303 99471
    checked_99136_167 rfl checked_99303_168
theorem checked_99471_167 : validate cache_99471_167 99471 =
    some 99638 := by
  decide +kernel
theorem checked_99638_168 : validate cache_99638_168 99638 =
    some 99806 := by
  decide +kernel
theorem checked_99471_335 : validate cache_99471_335 99471 =
    some 99806 := by
  exact validate_branch 167 cache_99471_167 cache_99638_168
    99471 99638 99806
    checked_99471_167 rfl checked_99638_168
theorem checked_99136_670 : validate cache_99136_670 99136 =
    some 99806 := by
  exact validate_branch 335 cache_99136_335 cache_99471_335
    99136 99471 99806
    checked_99136_335 rfl checked_99471_335
theorem checked : validate cache 99136 = some 99806 :=
  checked_99136_670
end Family742MainPilot
open LookupCachePilot
namespace Family743MainPilot
theorem checked_99806_167 : validate cache_99806_167 99806 =
    some 99973 := by
  decide +kernel
theorem checked_99973_168 : validate cache_99973_168 99973 =
    some 100141 := by
  decide +kernel
theorem checked_99806_335 : validate cache_99806_335 99806 =
    some 100141 := by
  exact validate_branch 167 cache_99806_167 cache_99973_168
    99806 99973 100141
    checked_99806_167 rfl checked_99973_168
theorem checked_100141_167 : validate cache_100141_167 100141 =
    some 100308 := by
  decide +kernel
theorem checked_100308_168 : validate cache_100308_168 100308 =
    some 100476 := by
  decide +kernel
theorem checked_100141_335 : validate cache_100141_335 100141 =
    some 100476 := by
  exact validate_branch 167 cache_100141_167 cache_100308_168
    100141 100308 100476
    checked_100141_167 rfl checked_100308_168
theorem checked_99806_670 : validate cache_99806_670 99806 =
    some 100476 := by
  exact validate_branch 335 cache_99806_335 cache_100141_335
    99806 100141 100476
    checked_99806_335 rfl checked_100141_335
theorem checked : validate cache 99806 = some 100476 :=
  checked_99806_670
end Family743MainPilot
open LookupCachePilot
namespace Family744MainPilot
theorem checked_100476_5 : validate cache_100476_5 100476 =
    some 100481 := by
  decide +kernel
theorem checked : validate cache 100476 = some 100481 :=
  checked_100476_5
end Family744MainPilot
open LookupCachePilot
namespace Family745MainPilot
theorem checked_100481_70 : validate cache_100481_70 100481 =
    some 100551 := by
  decide +kernel
theorem checked : validate cache 100481 = some 100551 :=
  checked_100481_70
end Family745MainPilot
open LookupCachePilot
namespace Family746MainPilot
theorem checked_100551_167 : validate cache_100551_167 100551 =
    some 100718 := by
  decide +kernel
theorem checked_100718_168 : validate cache_100718_168 100718 =
    some 100886 := by
  decide +kernel
theorem checked_100551_335 : validate cache_100551_335 100551 =
    some 100886 := by
  exact validate_branch 167 cache_100551_167 cache_100718_168
    100551 100718 100886
    checked_100551_167 rfl checked_100718_168
theorem checked_100886_167 : validate cache_100886_167 100886 =
    some 101053 := by
  decide +kernel
theorem checked_101053_168 : validate cache_101053_168 101053 =
    some 101221 := by
  decide +kernel
theorem checked_100886_335 : validate cache_100886_335 100886 =
    some 101221 := by
  exact validate_branch 167 cache_100886_167 cache_101053_168
    100886 101053 101221
    checked_100886_167 rfl checked_101053_168
theorem checked_100551_670 : validate cache_100551_670 100551 =
    some 101221 := by
  exact validate_branch 335 cache_100551_335 cache_100886_335
    100551 100886 101221
    checked_100551_335 rfl checked_100886_335
theorem checked : validate cache 100551 = some 101221 :=
  checked_100551_670
end Family746MainPilot
open LookupCachePilot
namespace Family747MainPilot
theorem checked_101221_5 : validate cache_101221_5 101221 =
    some 101226 := by
  decide +kernel
theorem checked : validate cache 101221 = some 101226 :=
  checked_101221_5
end Family747MainPilot
open LookupCachePilot
namespace Family748MainPilot
theorem checked_101226_10 : validate cache_101226_10 101226 =
    some 101236 := by
  decide +kernel
theorem checked : validate cache 101226 = some 101236 :=
  checked_101226_10
end Family748MainPilot
open LookupCachePilot
namespace Family749MainPilot
theorem checked_101236_185 : validate cache_101236_185 101236 =
    some 101421 := by
  decide +kernel
theorem checked_101421_185 : validate cache_101421_185 101421 =
    some 101606 := by
  decide +kernel
theorem checked_101236_370 : validate cache_101236_370 101236 =
    some 101606 := by
  exact validate_branch 185 cache_101236_185 cache_101421_185
    101236 101421 101606
    checked_101236_185 rfl checked_101421_185
theorem checked : validate cache 101236 = some 101606 :=
  checked_101236_370
end Family749MainPilot
open LookupCachePilot
namespace Family750MainPilot
theorem checked_101606_220 : validate cache_101606_220 101606 =
    some 101826 := by
  decide +kernel
theorem checked_101826_220 : validate cache_101826_220 101826 =
    some 102046 := by
  decide +kernel
theorem checked_101606_440 : validate cache_101606_440 101606 =
    some 102046 := by
  exact validate_branch 220 cache_101606_220 cache_101826_220
    101606 101826 102046
    checked_101606_220 rfl checked_101826_220
theorem checked : validate cache 101606 = some 102046 :=
  checked_101606_440
end Family750MainPilot
open LookupCachePilot
namespace Family751MainPilot
theorem checked_102046_70 : validate cache_102046_70 102046 =
    some 102116 := by
  decide +kernel
theorem checked : validate cache 102046 = some 102116 :=
  checked_102046_70
end Family751MainPilot
open LookupCachePilot
namespace Family752MainPilot
theorem checked_102116_195 : validate cache_102116_195 102116 =
    some 102311 := by
  decide +kernel
theorem checked : validate cache 102116 = some 102311 :=
  checked_102116_195
end Family752MainPilot
open LookupCachePilot
namespace Family753MainPilot
theorem checked_102311_70 : validate cache_102311_70 102311 =
    some 102381 := by
  decide +kernel
theorem checked : validate cache 102311 = some 102381 :=
  checked_102311_70
end Family753MainPilot
open LookupCachePilot
namespace Family754MainPilot
theorem checked_102381_200 : validate cache_102381_200 102381 =
    some 102581 := by
  decide +kernel
theorem checked_102581_200 : validate cache_102581_200 102581 =
    some 102781 := by
  decide +kernel
theorem checked_102381_400 : validate cache_102381_400 102381 =
    some 102781 := by
  exact validate_branch 200 cache_102381_200 cache_102581_200
    102381 102581 102781
    checked_102381_200 rfl checked_102581_200
theorem checked : validate cache 102381 = some 102781 :=
  checked_102381_400
end Family754MainPilot
open LookupCachePilot
namespace Family755MainPilot
theorem checked_102781_5 : validate cache_102781_5 102781 =
    some 102786 := by
  decide +kernel
theorem checked : validate cache 102781 = some 102786 :=
  checked_102781_5
end Family755MainPilot
open LookupCachePilot
namespace Family756MainPilot
theorem checked_102786_70 : validate cache_102786_70 102786 =
    some 102856 := by
  decide +kernel
theorem checked : validate cache 102786 = some 102856 :=
  checked_102786_70
end Family756MainPilot
open LookupCachePilot
namespace Family757MainPilot
theorem checked_102856_185 : validate cache_102856_185 102856 =
    some 103041 := by
  decide +kernel
theorem checked_103041_185 : validate cache_103041_185 103041 =
    some 103226 := by
  decide +kernel
theorem checked_102856_370 : validate cache_102856_370 102856 =
    some 103226 := by
  exact validate_branch 185 cache_102856_185 cache_103041_185
    102856 103041 103226
    checked_102856_185 rfl checked_103041_185
theorem checked : validate cache 102856 = some 103226 :=
  checked_102856_370
end Family757MainPilot
open LookupCachePilot
namespace Family758MainPilot
theorem checked_103226_5 : validate cache_103226_5 103226 =
    some 103231 := by
  decide +kernel
theorem checked : validate cache 103226 = some 103231 :=
  checked_103226_5
end Family758MainPilot
open LookupCachePilot
namespace Family759MainPilot
theorem checked_103231_70 : validate cache_103231_70 103231 =
    some 103301 := by
  decide +kernel
theorem checked : validate cache 103231 = some 103301 :=
  checked_103231_70
end Family759MainPilot
open LookupCachePilot
namespace Family760MainPilot
theorem checked_103301_200 : validate cache_103301_200 103301 =
    some 103501 := by
  decide +kernel
theorem checked_103501_200 : validate cache_103501_200 103501 =
    some 103701 := by
  decide +kernel
theorem checked_103301_400 : validate cache_103301_400 103301 =
    some 103701 := by
  exact validate_branch 200 cache_103301_200 cache_103501_200
    103301 103501 103701
    checked_103301_200 rfl checked_103501_200
theorem checked : validate cache 103301 = some 103701 :=
  checked_103301_400
end Family760MainPilot
open LookupCachePilot
namespace Family761MainPilot
theorem checked_103701_5 : validate cache_103701_5 103701 =
    some 103706 := by
  decide +kernel
theorem checked : validate cache 103701 = some 103706 :=
  checked_103701_5
end Family761MainPilot
open LookupCachePilot
namespace Family762MainPilot
theorem checked_103706_70 : validate cache_103706_70 103706 =
    some 103776 := by
  decide +kernel
theorem checked : validate cache 103706 = some 103776 :=
  checked_103706_70
end Family762MainPilot
open LookupCachePilot
namespace Family763MainPilot
theorem checked_103776_185 : validate cache_103776_185 103776 =
    some 103961 := by
  decide +kernel
theorem checked_103961_185 : validate cache_103961_185 103961 =
    some 104146 := by
  decide +kernel
theorem checked_103776_370 : validate cache_103776_370 103776 =
    some 104146 := by
  exact validate_branch 185 cache_103776_185 cache_103961_185
    103776 103961 104146
    checked_103776_185 rfl checked_103961_185
theorem checked : validate cache 103776 = some 104146 :=
  checked_103776_370
end Family763MainPilot
open LookupCachePilot
namespace Family764MainPilot
theorem checked_104146_5 : validate cache_104146_5 104146 =
    some 104151 := by
  decide +kernel
theorem checked : validate cache 104146 = some 104151 :=
  checked_104146_5
end Family764MainPilot
open LookupCachePilot
namespace Family765MainPilot
theorem checked_104151_70 : validate cache_104151_70 104151 =
    some 104221 := by
  decide +kernel
theorem checked : validate cache 104151 = some 104221 :=
  checked_104151_70
end Family765MainPilot
open LookupCachePilot
namespace Family766MainPilot
theorem checked_104221_200 : validate cache_104221_200 104221 =
    some 104421 := by
  decide +kernel
theorem checked_104421_200 : validate cache_104421_200 104421 =
    some 104621 := by
  decide +kernel
theorem checked_104221_400 : validate cache_104221_400 104221 =
    some 104621 := by
  exact validate_branch 200 cache_104221_200 cache_104421_200
    104221 104421 104621
    checked_104221_200 rfl checked_104421_200
theorem checked : validate cache 104221 = some 104621 :=
  checked_104221_400
end Family766MainPilot
open LookupCachePilot
namespace Family767MainPilot
theorem checked_104621_5 : validate cache_104621_5 104621 =
    some 104626 := by
  decide +kernel
theorem checked : validate cache 104621 = some 104626 :=
  checked_104621_5
end Family767MainPilot
open LookupCachePilot
namespace Family768MainPilot
theorem checked_104626_70 : validate cache_104626_70 104626 =
    some 104696 := by
  decide +kernel
theorem checked : validate cache 104626 = some 104696 :=
  checked_104626_70
end Family768MainPilot
open LookupCachePilot
namespace Family769MainPilot
theorem checked_104696_152 : validate cache_104696_152 104696 =
    some 104848 := by
  decide +kernel
theorem checked_104848_153 : validate cache_104848_153 104848 =
    some 105001 := by
  decide +kernel
theorem checked_104696_305 : validate cache_104696_305 104696 =
    some 105001 := by
  exact validate_branch 152 cache_104696_152 cache_104848_153
    104696 104848 105001
    checked_104696_152 rfl checked_104848_153
theorem checked : validate cache 104696 = some 105001 :=
  checked_104696_305
end Family769MainPilot
open LookupCachePilot
namespace Family770MainPilot
theorem checked_105001_70 : validate cache_105001_70 105001 =
    some 105071 := by
  decide +kernel
theorem checked : validate cache 105001 = some 105071 :=
  checked_105001_70
end Family770MainPilot
open LookupCachePilot
namespace Family771MainPilot
theorem checked_105071_5 : validate cache_105071_5 105071 =
    some 105076 := by
  decide +kernel
theorem checked : validate cache 105071 = some 105076 :=
  checked_105071_5
end Family771MainPilot
open LookupCachePilot
namespace Family772MainPilot
theorem checked_105076_70 : validate cache_105076_70 105076 =
    some 105146 := by
  decide +kernel
theorem checked : validate cache 105076 = some 105146 :=
  checked_105076_70
end Family772MainPilot
open LookupCachePilot
namespace Family773MainPilot
theorem checked_105146_132 : validate cache_105146_132 105146 =
    some 105278 := by
  decide +kernel
theorem checked_105278_133 : validate cache_105278_133 105278 =
    some 105411 := by
  decide +kernel
theorem checked_105146_265 : validate cache_105146_265 105146 =
    some 105411 := by
  exact validate_branch 132 cache_105146_132 cache_105278_133
    105146 105278 105411
    checked_105146_132 rfl checked_105278_133
theorem checked : validate cache 105146 = some 105411 :=
  checked_105146_265
end Family773MainPilot
open LookupCachePilot
namespace Family774MainPilot
theorem checked_105411_5 : validate cache_105411_5 105411 =
    some 105416 := by
  decide +kernel
theorem checked : validate cache 105411 = some 105416 :=
  checked_105411_5
end Family774MainPilot
open LookupCachePilot
namespace Family775MainPilot
theorem checked_105416_10 : validate cache_105416_10 105416 =
    some 105426 := by
  decide +kernel
theorem checked : validate cache 105416 = some 105426 :=
  checked_105416_10
end Family775MainPilot
open LookupCachePilot
namespace Family776MainPilot
theorem checked_105426_220 : validate cache_105426_220 105426 =
    some 105646 := by
  decide +kernel
theorem checked : validate cache 105426 = some 105646 :=
  checked_105426_220
end Family776MainPilot
open LookupCachePilot
namespace Family777MainPilot
theorem checked_105646_152 : validate cache_105646_152 105646 =
    some 105798 := by
  decide +kernel
theorem checked_105798_153 : validate cache_105798_153 105798 =
    some 105951 := by
  decide +kernel
theorem checked_105646_305 : validate cache_105646_305 105646 =
    some 105951 := by
  exact validate_branch 152 cache_105646_152 cache_105798_153
    105646 105798 105951
    checked_105646_152 rfl checked_105798_153
theorem checked : validate cache 105646 = some 105951 :=
  checked_105646_305
end Family777MainPilot
open LookupCachePilot
namespace Family778MainPilot
theorem checked_105951_70 : validate cache_105951_70 105951 =
    some 106021 := by
  decide +kernel
theorem checked : validate cache 105951 = some 106021 :=
  checked_105951_70
end Family778MainPilot
open LookupCachePilot
namespace Family779MainPilot
theorem checked_106021_195 : validate cache_106021_195 106021 =
    some 106216 := by
  decide +kernel
theorem checked : validate cache 106021 = some 106216 :=
  checked_106021_195
end Family779MainPilot
open LookupCachePilot
namespace Family780MainPilot
theorem checked_106216_70 : validate cache_106216_70 106216 =
    some 106286 := by
  decide +kernel
theorem checked : validate cache 106216 = some 106286 :=
  checked_106216_70
end Family780MainPilot
open LookupCachePilot
namespace Family781MainPilot
theorem checked_106286_132 : validate cache_106286_132 106286 =
    some 106418 := by
  decide +kernel
theorem checked_106418_133 : validate cache_106418_133 106418 =
    some 106551 := by
  decide +kernel
theorem checked_106286_265 : validate cache_106286_265 106286 =
    some 106551 := by
  exact validate_branch 132 cache_106286_132 cache_106418_133
    106286 106418 106551
    checked_106286_132 rfl checked_106418_133
theorem checked : validate cache 106286 = some 106551 :=
  checked_106286_265
end Family781MainPilot
open LookupCachePilot
namespace Family782MainPilot
theorem checked_106551_220 : validate cache_106551_220 106551 =
    some 106771 := by
  decide +kernel
theorem checked : validate cache 106551 = some 106771 :=
  checked_106551_220
end Family782MainPilot
open LookupCachePilot
namespace Family783MainPilot
theorem checked_106771_5 : validate cache_106771_5 106771 =
    some 106776 := by
  decide +kernel
theorem checked : validate cache 106771 = some 106776 :=
  checked_106771_5
end Family783MainPilot
open LookupCachePilot
namespace Family784MainPilot
theorem checked_106776_70 : validate cache_106776_70 106776 =
    some 106846 := by
  decide +kernel
theorem checked : validate cache 106776 = some 106846 :=
  checked_106776_70
end Family784MainPilot
open LookupCachePilot
namespace Family785MainPilot
theorem checked_106846_132 : validate cache_106846_132 106846 =
    some 106978 := by
  decide +kernel
theorem checked_106978_133 : validate cache_106978_133 106978 =
    some 107111 := by
  decide +kernel
theorem checked_106846_265 : validate cache_106846_265 106846 =
    some 107111 := by
  exact validate_branch 132 cache_106846_132 cache_106978_133
    106846 106978 107111
    checked_106846_132 rfl checked_106978_133
theorem checked : validate cache 106846 = some 107111 :=
  checked_106846_265
end Family785MainPilot
open LookupCachePilot
namespace Family786MainPilot
theorem checked_107111_5 : validate cache_107111_5 107111 =
    some 107116 := by
  decide +kernel
theorem checked : validate cache 107111 = some 107116 :=
  checked_107111_5
end Family786MainPilot
open LookupCachePilot
namespace Family787MainPilot
theorem checked_107116_10 : validate cache_107116_10 107116 =
    some 107126 := by
  decide +kernel
theorem checked : validate cache 107116 = some 107126 :=
  checked_107116_10
end Family787MainPilot
open LookupCachePilot
namespace Family788MainPilot
theorem checked_107126_185 : validate cache_107126_185 107126 =
    some 107311 := by
  decide +kernel
theorem checked_107311_185 : validate cache_107311_185 107311 =
    some 107496 := by
  decide +kernel
theorem checked_107126_370 : validate cache_107126_370 107126 =
    some 107496 := by
  exact validate_branch 185 cache_107126_185 cache_107311_185
    107126 107311 107496
    checked_107126_185 rfl checked_107311_185
theorem checked : validate cache 107126 = some 107496 :=
  checked_107126_370
end Family788MainPilot
open LookupCachePilot
namespace Family789MainPilot
theorem checked_107496_220 : validate cache_107496_220 107496 =
    some 107716 := by
  decide +kernel
theorem checked_107716_220 : validate cache_107716_220 107716 =
    some 107936 := by
  decide +kernel
theorem checked_107496_440 : validate cache_107496_440 107496 =
    some 107936 := by
  exact validate_branch 220 cache_107496_220 cache_107716_220
    107496 107716 107936
    checked_107496_220 rfl checked_107716_220
theorem checked : validate cache 107496 = some 107936 :=
  checked_107496_440
end Family789MainPilot
open LookupCachePilot
namespace Family790MainPilot
theorem checked_107936_70 : validate cache_107936_70 107936 =
    some 108006 := by
  decide +kernel
theorem checked : validate cache 107936 = some 108006 :=
  checked_107936_70
end Family790MainPilot
open LookupCachePilot
namespace Family791MainPilot
theorem checked_108006_195 : validate cache_108006_195 108006 =
    some 108201 := by
  decide +kernel
theorem checked : validate cache 108006 = some 108201 :=
  checked_108006_195
end Family791MainPilot
open LookupCachePilot
namespace Family792MainPilot
theorem checked_108201_70 : validate cache_108201_70 108201 =
    some 108271 := by
  decide +kernel
theorem checked : validate cache 108201 = some 108271 :=
  checked_108201_70
end Family792MainPilot
open LookupCachePilot
namespace Family793MainPilot
theorem checked_108271_200 : validate cache_108271_200 108271 =
    some 108471 := by
  decide +kernel
theorem checked_108471_200 : validate cache_108471_200 108471 =
    some 108671 := by
  decide +kernel
theorem checked_108271_400 : validate cache_108271_400 108271 =
    some 108671 := by
  exact validate_branch 200 cache_108271_200 cache_108471_200
    108271 108471 108671
    checked_108271_200 rfl checked_108471_200
theorem checked : validate cache 108271 = some 108671 :=
  checked_108271_400
end Family793MainPilot
open LookupCachePilot
namespace Family794MainPilot
theorem checked_108671_5 : validate cache_108671_5 108671 =
    some 108676 := by
  decide +kernel
theorem checked : validate cache 108671 = some 108676 :=
  checked_108671_5
end Family794MainPilot
open LookupCachePilot
namespace Family795MainPilot
theorem checked_108676_70 : validate cache_108676_70 108676 =
    some 108746 := by
  decide +kernel
theorem checked : validate cache 108676 = some 108746 :=
  checked_108676_70
end Family795MainPilot
open LookupCachePilot
namespace Family796MainPilot
theorem checked_108746_185 : validate cache_108746_185 108746 =
    some 108931 := by
  decide +kernel
theorem checked_108931_185 : validate cache_108931_185 108931 =
    some 109116 := by
  decide +kernel
theorem checked_108746_370 : validate cache_108746_370 108746 =
    some 109116 := by
  exact validate_branch 185 cache_108746_185 cache_108931_185
    108746 108931 109116
    checked_108746_185 rfl checked_108931_185
theorem checked : validate cache 108746 = some 109116 :=
  checked_108746_370
end Family796MainPilot
open LookupCachePilot
namespace Family797MainPilot
theorem checked_109116_5 : validate cache_109116_5 109116 =
    some 109121 := by
  decide +kernel
theorem checked : validate cache 109116 = some 109121 :=
  checked_109116_5
end Family797MainPilot
open LookupCachePilot
namespace Family798MainPilot
theorem checked_109121_70 : validate cache_109121_70 109121 =
    some 109191 := by
  decide +kernel
theorem checked : validate cache 109121 = some 109191 :=
  checked_109121_70
end Family798MainPilot
open LookupCachePilot
namespace Family799MainPilot
theorem checked_109191_200 : validate cache_109191_200 109191 =
    some 109391 := by
  decide +kernel
theorem checked_109391_200 : validate cache_109391_200 109391 =
    some 109591 := by
  decide +kernel
theorem checked_109191_400 : validate cache_109191_400 109191 =
    some 109591 := by
  exact validate_branch 200 cache_109191_200 cache_109391_200
    109191 109391 109591
    checked_109191_200 rfl checked_109391_200
theorem checked : validate cache 109191 = some 109591 :=
  checked_109191_400
end Family799MainPilot
open LookupCachePilot
namespace Family800MainPilot
theorem checked_109591_5 : validate cache_109591_5 109591 =
    some 109596 := by
  decide +kernel
theorem checked : validate cache 109591 = some 109596 :=
  checked_109591_5
end Family800MainPilot
open LookupCachePilot
namespace Family801MainPilot
theorem checked_109596_70 : validate cache_109596_70 109596 =
    some 109666 := by
  decide +kernel
theorem checked : validate cache 109596 = some 109666 :=
  checked_109596_70
end Family801MainPilot
open LookupCachePilot
namespace Family802MainPilot
theorem checked_109666_185 : validate cache_109666_185 109666 =
    some 109851 := by
  decide +kernel
theorem checked_109851_185 : validate cache_109851_185 109851 =
    some 110036 := by
  decide +kernel
theorem checked_109666_370 : validate cache_109666_370 109666 =
    some 110036 := by
  exact validate_branch 185 cache_109666_185 cache_109851_185
    109666 109851 110036
    checked_109666_185 rfl checked_109851_185
theorem checked : validate cache 109666 = some 110036 :=
  checked_109666_370
end Family802MainPilot
open LookupCachePilot
namespace Family803MainPilot
theorem checked_110036_5 : validate cache_110036_5 110036 =
    some 110041 := by
  decide +kernel
theorem checked : validate cache 110036 = some 110041 :=
  checked_110036_5
end Family803MainPilot
open LookupCachePilot
namespace Family804MainPilot
theorem checked_110041_70 : validate cache_110041_70 110041 =
    some 110111 := by
  decide +kernel
theorem checked : validate cache 110041 = some 110111 :=
  checked_110041_70
end Family804MainPilot
open LookupCachePilot
namespace Family805MainPilot
theorem checked_110111_200 : validate cache_110111_200 110111 =
    some 110311 := by
  decide +kernel
theorem checked_110311_200 : validate cache_110311_200 110311 =
    some 110511 := by
  decide +kernel
theorem checked_110111_400 : validate cache_110111_400 110111 =
    some 110511 := by
  exact validate_branch 200 cache_110111_200 cache_110311_200
    110111 110311 110511
    checked_110111_200 rfl checked_110311_200
theorem checked : validate cache 110111 = some 110511 :=
  checked_110111_400
end Family805MainPilot
open LookupCachePilot
namespace Family806MainPilot
theorem checked_110511_5 : validate cache_110511_5 110511 =
    some 110516 := by
  decide +kernel
theorem checked : validate cache 110511 = some 110516 :=
  checked_110511_5
end Family806MainPilot
open LookupCachePilot
namespace Family807MainPilot
theorem checked_110516_70 : validate cache_110516_70 110516 =
    some 110586 := by
  decide +kernel
theorem checked : validate cache 110516 = some 110586 :=
  checked_110516_70
end Family807MainPilot
open LookupCachePilot
namespace Family808MainPilot
theorem checked_110586_152 : validate cache_110586_152 110586 =
    some 110738 := by
  decide +kernel
theorem checked_110738_153 : validate cache_110738_153 110738 =
    some 110891 := by
  decide +kernel
theorem checked_110586_305 : validate cache_110586_305 110586 =
    some 110891 := by
  exact validate_branch 152 cache_110586_152 cache_110738_153
    110586 110738 110891
    checked_110586_152 rfl checked_110738_153
theorem checked : validate cache 110586 = some 110891 :=
  checked_110586_305
end Family808MainPilot
open LookupCachePilot
namespace Family809MainPilot
theorem checked_110891_70 : validate cache_110891_70 110891 =
    some 110961 := by
  decide +kernel
theorem checked : validate cache 110891 = some 110961 :=
  checked_110891_70
end Family809MainPilot
open LookupCachePilot
namespace Family810MainPilot
theorem checked_110961_5 : validate cache_110961_5 110961 =
    some 110966 := by
  decide +kernel
theorem checked : validate cache 110961 = some 110966 :=
  checked_110961_5
end Family810MainPilot
open LookupCachePilot
namespace Family811MainPilot
theorem checked_110966_70 : validate cache_110966_70 110966 =
    some 111036 := by
  decide +kernel
theorem checked : validate cache 110966 = some 111036 :=
  checked_110966_70
end Family811MainPilot
open LookupCachePilot
namespace Family812MainPilot
theorem checked_111036_132 : validate cache_111036_132 111036 =
    some 111168 := by
  decide +kernel
theorem checked_111168_133 : validate cache_111168_133 111168 =
    some 111301 := by
  decide +kernel
theorem checked_111036_265 : validate cache_111036_265 111036 =
    some 111301 := by
  exact validate_branch 132 cache_111036_132 cache_111168_133
    111036 111168 111301
    checked_111036_132 rfl checked_111168_133
theorem checked : validate cache 111036 = some 111301 :=
  checked_111036_265
end Family812MainPilot
open LookupCachePilot
namespace Family813MainPilot
theorem checked_111301_5 : validate cache_111301_5 111301 =
    some 111306 := by
  decide +kernel
theorem checked : validate cache 111301 = some 111306 :=
  checked_111301_5
end Family813MainPilot
open LookupCachePilot
namespace Family814MainPilot
theorem checked_111306_10 : validate cache_111306_10 111306 =
    some 111316 := by
  decide +kernel
theorem checked : validate cache 111306 = some 111316 :=
  checked_111306_10
end Family814MainPilot
open LookupCachePilot
namespace Family815MainPilot
theorem checked_111316_220 : validate cache_111316_220 111316 =
    some 111536 := by
  decide +kernel
theorem checked : validate cache 111316 = some 111536 :=
  checked_111316_220
end Family815MainPilot
open LookupCachePilot
namespace Family816MainPilot
theorem checked_111536_152 : validate cache_111536_152 111536 =
    some 111688 := by
  decide +kernel
theorem checked_111688_153 : validate cache_111688_153 111688 =
    some 111841 := by
  decide +kernel
theorem checked_111536_305 : validate cache_111536_305 111536 =
    some 111841 := by
  exact validate_branch 152 cache_111536_152 cache_111688_153
    111536 111688 111841
    checked_111536_152 rfl checked_111688_153
theorem checked : validate cache 111536 = some 111841 :=
  checked_111536_305
end Family816MainPilot
open LookupCachePilot
namespace Family817MainPilot
theorem checked_111841_70 : validate cache_111841_70 111841 =
    some 111911 := by
  decide +kernel
theorem checked : validate cache 111841 = some 111911 :=
  checked_111841_70
end Family817MainPilot
open LookupCachePilot
namespace Family818MainPilot
theorem checked_111911_195 : validate cache_111911_195 111911 =
    some 112106 := by
  decide +kernel
theorem checked : validate cache 111911 = some 112106 :=
  checked_111911_195
end Family818MainPilot
open LookupCachePilot
namespace Family819MainPilot
theorem checked_112106_70 : validate cache_112106_70 112106 =
    some 112176 := by
  decide +kernel
theorem checked : validate cache 112106 = some 112176 :=
  checked_112106_70
end Family819MainPilot
open LookupCachePilot
namespace Family820MainPilot
theorem checked_112176_132 : validate cache_112176_132 112176 =
    some 112308 := by
  decide +kernel
theorem checked_112308_133 : validate cache_112308_133 112308 =
    some 112441 := by
  decide +kernel
theorem checked_112176_265 : validate cache_112176_265 112176 =
    some 112441 := by
  exact validate_branch 132 cache_112176_132 cache_112308_133
    112176 112308 112441
    checked_112176_132 rfl checked_112308_133
theorem checked : validate cache 112176 = some 112441 :=
  checked_112176_265
end Family820MainPilot
open LookupCachePilot
namespace Family821MainPilot
theorem checked_112441_220 : validate cache_112441_220 112441 =
    some 112661 := by
  decide +kernel
theorem checked : validate cache 112441 = some 112661 :=
  checked_112441_220
end Family821MainPilot
open LookupCachePilot
namespace Family822MainPilot
theorem checked_112661_5 : validate cache_112661_5 112661 =
    some 112666 := by
  decide +kernel
theorem checked : validate cache 112661 = some 112666 :=
  checked_112661_5
end Family822MainPilot
open LookupCachePilot
namespace Family823MainPilot
theorem checked_112666_70 : validate cache_112666_70 112666 =
    some 112736 := by
  decide +kernel
theorem checked : validate cache 112666 = some 112736 :=
  checked_112666_70
end Family823MainPilot
open LookupCachePilot
namespace Family824MainPilot
theorem checked_112736_132 : validate cache_112736_132 112736 =
    some 112868 := by
  decide +kernel
theorem checked_112868_133 : validate cache_112868_133 112868 =
    some 113001 := by
  decide +kernel
theorem checked_112736_265 : validate cache_112736_265 112736 =
    some 113001 := by
  exact validate_branch 132 cache_112736_132 cache_112868_133
    112736 112868 113001
    checked_112736_132 rfl checked_112868_133
theorem checked : validate cache 112736 = some 113001 :=
  checked_112736_265
end Family824MainPilot
open LookupCachePilot
namespace Family825MainPilot
theorem checked_113001_5 : validate cache_113001_5 113001 =
    some 113006 := by
  decide +kernel
theorem checked : validate cache 113001 = some 113006 :=
  checked_113001_5
end Family825MainPilot
open LookupCachePilot
namespace Family826MainPilot
theorem checked_113006_10 : validate cache_113006_10 113006 =
    some 113016 := by
  decide +kernel
theorem checked : validate cache 113006 = some 113016 :=
  checked_113006_10
end Family826MainPilot
open LookupCachePilot
namespace Family827MainPilot
theorem checked_113016_185 : validate cache_113016_185 113016 =
    some 113201 := by
  decide +kernel
theorem checked_113201_185 : validate cache_113201_185 113201 =
    some 113386 := by
  decide +kernel
theorem checked_113016_370 : validate cache_113016_370 113016 =
    some 113386 := by
  exact validate_branch 185 cache_113016_185 cache_113201_185
    113016 113201 113386
    checked_113016_185 rfl checked_113201_185
theorem checked : validate cache 113016 = some 113386 :=
  checked_113016_370
end Family827MainPilot
open LookupCachePilot
namespace Family828MainPilot
theorem checked_113386_220 : validate cache_113386_220 113386 =
    some 113606 := by
  decide +kernel
theorem checked_113606_220 : validate cache_113606_220 113606 =
    some 113826 := by
  decide +kernel
theorem checked_113386_440 : validate cache_113386_440 113386 =
    some 113826 := by
  exact validate_branch 220 cache_113386_220 cache_113606_220
    113386 113606 113826
    checked_113386_220 rfl checked_113606_220
theorem checked : validate cache 113386 = some 113826 :=
  checked_113386_440
end Family828MainPilot
open LookupCachePilot
namespace Family829MainPilot
theorem checked_113826_70 : validate cache_113826_70 113826 =
    some 113896 := by
  decide +kernel
theorem checked : validate cache 113826 = some 113896 :=
  checked_113826_70
end Family829MainPilot
open LookupCachePilot
namespace Family830MainPilot
theorem checked_113896_195 : validate cache_113896_195 113896 =
    some 114091 := by
  decide +kernel
theorem checked : validate cache 113896 = some 114091 :=
  checked_113896_195
end Family830MainPilot
open LookupCachePilot
namespace Family831MainPilot
theorem checked_114091_70 : validate cache_114091_70 114091 =
    some 114161 := by
  decide +kernel
theorem checked : validate cache 114091 = some 114161 :=
  checked_114091_70
end Family831MainPilot
namespace FamilyViews008Pilot
noncomputable def windows_737 : List WorkingViewPilot.Window := [
  ⟨98056, 98321, Family737MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_737 : WorkingViewPilot.checks windows_737 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨98056, 98321, Family737MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      98056 98321 Family737MainPilot.cache
      Family737MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_737 : ∀ w ∈ windows_737, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_737 checked_737
noncomputable def fromRaw_737 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_737) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_737 checked_737 q raw nodes returns truth
noncomputable def windows_738 : List WorkingViewPilot.Window := [
  ⟨98321, 98326, Family738MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_738 : WorkingViewPilot.checks windows_738 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨98321, 98326, Family738MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      98321 98326 Family738MainPilot.cache
      Family738MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_738 : ∀ w ∈ windows_738, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_738 checked_738
noncomputable def fromRaw_738 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_738) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_738 checked_738 q raw nodes returns truth
noncomputable def windows_739 : List WorkingViewPilot.Window := [
  ⟨98326, 98396, Family739MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_739 : WorkingViewPilot.checks windows_739 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨98326, 98396, Family739MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      98326 98396 Family739MainPilot.cache
      Family739MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_739 : ∀ w ∈ windows_739, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_739 checked_739
noncomputable def fromRaw_739 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_739) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_739 checked_739 q raw nodes returns truth
noncomputable def windows_740 : List WorkingViewPilot.Window := [
  ⟨98396, 99066, Family740MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_740 : WorkingViewPilot.checks windows_740 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨98396, 99066, Family740MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      98396 99066 Family740MainPilot.cache
      Family740MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_740 : ∀ w ∈ windows_740, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_740 checked_740
noncomputable def fromRaw_740 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_740) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_740 checked_740 q raw nodes returns truth
noncomputable def windows_741 : List WorkingViewPilot.Window := [
  ⟨99066, 99136, Family741MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_741 : WorkingViewPilot.checks windows_741 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨99066, 99136, Family741MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      99066 99136 Family741MainPilot.cache
      Family741MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_741 : ∀ w ∈ windows_741, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_741 checked_741
noncomputable def fromRaw_741 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_741) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_741 checked_741 q raw nodes returns truth
noncomputable def windows_742 : List WorkingViewPilot.Window := [
  ⟨99136, 99806, Family742MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_742 : WorkingViewPilot.checks windows_742 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨99136, 99806, Family742MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      99136 99806 Family742MainPilot.cache
      Family742MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_742 : ∀ w ∈ windows_742, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_742 checked_742
noncomputable def fromRaw_742 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_742) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_742 checked_742 q raw nodes returns truth
noncomputable def windows_743 : List WorkingViewPilot.Window := [
  ⟨99806, 100476, Family743MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_743 : WorkingViewPilot.checks windows_743 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨99806, 100476, Family743MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      99806 100476 Family743MainPilot.cache
      Family743MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_743 : ∀ w ∈ windows_743, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_743 checked_743
noncomputable def fromRaw_743 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_743) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_743 checked_743 q raw nodes returns truth
noncomputable def windows_744 : List WorkingViewPilot.Window := [
  ⟨100476, 100481, Family744MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_744 : WorkingViewPilot.checks windows_744 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨100476, 100481, Family744MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      100476 100481 Family744MainPilot.cache
      Family744MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_744 : ∀ w ∈ windows_744, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_744 checked_744
noncomputable def fromRaw_744 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_744) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_744 checked_744 q raw nodes returns truth
noncomputable def windows_745 : List WorkingViewPilot.Window := [
  ⟨100481, 100551, Family745MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_745 : WorkingViewPilot.checks windows_745 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨100481, 100551, Family745MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      100481 100551 Family745MainPilot.cache
      Family745MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_745 : ∀ w ∈ windows_745, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_745 checked_745
noncomputable def fromRaw_745 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_745) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_745 checked_745 q raw nodes returns truth
noncomputable def windows_746 : List WorkingViewPilot.Window := [
  ⟨100551, 101221, Family746MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_746 : WorkingViewPilot.checks windows_746 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨100551, 101221, Family746MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      100551 101221 Family746MainPilot.cache
      Family746MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_746 : ∀ w ∈ windows_746, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_746 checked_746
noncomputable def fromRaw_746 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_746) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_746 checked_746 q raw nodes returns truth
noncomputable def windows_747 : List WorkingViewPilot.Window := [
  ⟨101221, 101226, Family747MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_747 : WorkingViewPilot.checks windows_747 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨101221, 101226, Family747MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      101221 101226 Family747MainPilot.cache
      Family747MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_747 : ∀ w ∈ windows_747, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_747 checked_747
noncomputable def fromRaw_747 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_747) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_747 checked_747 q raw nodes returns truth
noncomputable def windows_748 : List WorkingViewPilot.Window := [
  ⟨101226, 101236, Family748MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_748 : WorkingViewPilot.checks windows_748 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨101226, 101236, Family748MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      101226 101236 Family748MainPilot.cache
      Family748MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_748 : ∀ w ∈ windows_748, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_748 checked_748
noncomputable def fromRaw_748 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_748) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_748 checked_748 q raw nodes returns truth
noncomputable def windows_749 : List WorkingViewPilot.Window := [
  ⟨101236, 101606, Family749MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_749 : WorkingViewPilot.checks windows_749 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨101236, 101606, Family749MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      101236 101606 Family749MainPilot.cache
      Family749MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_749 : ∀ w ∈ windows_749, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_749 checked_749
noncomputable def fromRaw_749 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_749) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_749 checked_749 q raw nodes returns truth
noncomputable def windows_750 : List WorkingViewPilot.Window := [
  ⟨101606, 102046, Family750MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_750 : WorkingViewPilot.checks windows_750 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨101606, 102046, Family750MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      101606 102046 Family750MainPilot.cache
      Family750MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_750 : ∀ w ∈ windows_750, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_750 checked_750
noncomputable def fromRaw_750 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_750) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_750 checked_750 q raw nodes returns truth
noncomputable def windows_751 : List WorkingViewPilot.Window := [
  ⟨102046, 102116, Family751MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_751 : WorkingViewPilot.checks windows_751 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨102046, 102116, Family751MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      102046 102116 Family751MainPilot.cache
      Family751MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_751 : ∀ w ∈ windows_751, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_751 checked_751
noncomputable def fromRaw_751 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_751) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_751 checked_751 q raw nodes returns truth
noncomputable def windows_752 : List WorkingViewPilot.Window := [
  ⟨102116, 102311, Family752MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_752 : WorkingViewPilot.checks windows_752 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨102116, 102311, Family752MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      102116 102311 Family752MainPilot.cache
      Family752MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_752 : ∀ w ∈ windows_752, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_752 checked_752
noncomputable def fromRaw_752 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_752) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_752 checked_752 q raw nodes returns truth
noncomputable def windows_753 : List WorkingViewPilot.Window := [
  ⟨102311, 102381, Family753MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_753 : WorkingViewPilot.checks windows_753 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨102311, 102381, Family753MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      102311 102381 Family753MainPilot.cache
      Family753MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_753 : ∀ w ∈ windows_753, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_753 checked_753
noncomputable def fromRaw_753 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_753) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_753 checked_753 q raw nodes returns truth
noncomputable def windows_754 : List WorkingViewPilot.Window := [
  ⟨102381, 102781, Family754MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_754 : WorkingViewPilot.checks windows_754 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨102381, 102781, Family754MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      102381 102781 Family754MainPilot.cache
      Family754MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_754 : ∀ w ∈ windows_754, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_754 checked_754
noncomputable def fromRaw_754 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_754) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_754 checked_754 q raw nodes returns truth
noncomputable def windows_755 : List WorkingViewPilot.Window := [
  ⟨102781, 102786, Family755MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_755 : WorkingViewPilot.checks windows_755 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨102781, 102786, Family755MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      102781 102786 Family755MainPilot.cache
      Family755MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_755 : ∀ w ∈ windows_755, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_755 checked_755
noncomputable def fromRaw_755 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_755) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_755 checked_755 q raw nodes returns truth
noncomputable def windows_756 : List WorkingViewPilot.Window := [
  ⟨102786, 102856, Family756MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_756 : WorkingViewPilot.checks windows_756 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨102786, 102856, Family756MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      102786 102856 Family756MainPilot.cache
      Family756MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_756 : ∀ w ∈ windows_756, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_756 checked_756
noncomputable def fromRaw_756 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_756) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_756 checked_756 q raw nodes returns truth
noncomputable def windows_757 : List WorkingViewPilot.Window := [
  ⟨102856, 103226, Family757MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_757 : WorkingViewPilot.checks windows_757 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨102856, 103226, Family757MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      102856 103226 Family757MainPilot.cache
      Family757MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_757 : ∀ w ∈ windows_757, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_757 checked_757
noncomputable def fromRaw_757 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_757) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_757 checked_757 q raw nodes returns truth
noncomputable def windows_758 : List WorkingViewPilot.Window := [
  ⟨103226, 103231, Family758MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_758 : WorkingViewPilot.checks windows_758 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨103226, 103231, Family758MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      103226 103231 Family758MainPilot.cache
      Family758MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_758 : ∀ w ∈ windows_758, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_758 checked_758
noncomputable def fromRaw_758 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_758) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_758 checked_758 q raw nodes returns truth
noncomputable def windows_759 : List WorkingViewPilot.Window := [
  ⟨103231, 103301, Family759MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_759 : WorkingViewPilot.checks windows_759 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨103231, 103301, Family759MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      103231 103301 Family759MainPilot.cache
      Family759MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_759 : ∀ w ∈ windows_759, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_759 checked_759
noncomputable def fromRaw_759 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_759) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_759 checked_759 q raw nodes returns truth
noncomputable def windows_760 : List WorkingViewPilot.Window := [
  ⟨103301, 103701, Family760MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_760 : WorkingViewPilot.checks windows_760 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨103301, 103701, Family760MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      103301 103701 Family760MainPilot.cache
      Family760MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_760 : ∀ w ∈ windows_760, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_760 checked_760
noncomputable def fromRaw_760 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_760) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_760 checked_760 q raw nodes returns truth
noncomputable def windows_761 : List WorkingViewPilot.Window := [
  ⟨103701, 103706, Family761MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_761 : WorkingViewPilot.checks windows_761 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨103701, 103706, Family761MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      103701 103706 Family761MainPilot.cache
      Family761MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_761 : ∀ w ∈ windows_761, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_761 checked_761
noncomputable def fromRaw_761 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_761) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_761 checked_761 q raw nodes returns truth
noncomputable def windows_762 : List WorkingViewPilot.Window := [
  ⟨103706, 103776, Family762MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_762 : WorkingViewPilot.checks windows_762 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨103706, 103776, Family762MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      103706 103776 Family762MainPilot.cache
      Family762MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_762 : ∀ w ∈ windows_762, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_762 checked_762
noncomputable def fromRaw_762 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_762) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_762 checked_762 q raw nodes returns truth
noncomputable def windows_763 : List WorkingViewPilot.Window := [
  ⟨103776, 104146, Family763MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_763 : WorkingViewPilot.checks windows_763 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨103776, 104146, Family763MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      103776 104146 Family763MainPilot.cache
      Family763MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_763 : ∀ w ∈ windows_763, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_763 checked_763
noncomputable def fromRaw_763 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_763) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_763 checked_763 q raw nodes returns truth
noncomputable def windows_764 : List WorkingViewPilot.Window := [
  ⟨104146, 104151, Family764MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_764 : WorkingViewPilot.checks windows_764 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨104146, 104151, Family764MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      104146 104151 Family764MainPilot.cache
      Family764MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_764 : ∀ w ∈ windows_764, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_764 checked_764
noncomputable def fromRaw_764 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_764) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_764 checked_764 q raw nodes returns truth
noncomputable def windows_765 : List WorkingViewPilot.Window := [
  ⟨104151, 104221, Family765MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_765 : WorkingViewPilot.checks windows_765 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨104151, 104221, Family765MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      104151 104221 Family765MainPilot.cache
      Family765MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_765 : ∀ w ∈ windows_765, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_765 checked_765
noncomputable def fromRaw_765 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_765) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_765 checked_765 q raw nodes returns truth
noncomputable def windows_766 : List WorkingViewPilot.Window := [
  ⟨104221, 104621, Family766MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_766 : WorkingViewPilot.checks windows_766 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨104221, 104621, Family766MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      104221 104621 Family766MainPilot.cache
      Family766MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_766 : ∀ w ∈ windows_766, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_766 checked_766
noncomputable def fromRaw_766 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_766) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_766 checked_766 q raw nodes returns truth
noncomputable def windows_767 : List WorkingViewPilot.Window := [
  ⟨104621, 104626, Family767MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_767 : WorkingViewPilot.checks windows_767 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨104621, 104626, Family767MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      104621 104626 Family767MainPilot.cache
      Family767MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_767 : ∀ w ∈ windows_767, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_767 checked_767
noncomputable def fromRaw_767 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_767) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_767 checked_767 q raw nodes returns truth
noncomputable def windows_768 : List WorkingViewPilot.Window := [
  ⟨104626, 104696, Family768MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_768 : WorkingViewPilot.checks windows_768 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨104626, 104696, Family768MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      104626 104696 Family768MainPilot.cache
      Family768MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_768 : ∀ w ∈ windows_768, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_768 checked_768
noncomputable def fromRaw_768 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_768) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_768 checked_768 q raw nodes returns truth
noncomputable def windows_769 : List WorkingViewPilot.Window := [
  ⟨104696, 105001, Family769MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_769 : WorkingViewPilot.checks windows_769 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨104696, 105001, Family769MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      104696 105001 Family769MainPilot.cache
      Family769MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_769 : ∀ w ∈ windows_769, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_769 checked_769
noncomputable def fromRaw_769 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_769) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_769 checked_769 q raw nodes returns truth
noncomputable def windows_770 : List WorkingViewPilot.Window := [
  ⟨105001, 105071, Family770MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_770 : WorkingViewPilot.checks windows_770 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨105001, 105071, Family770MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      105001 105071 Family770MainPilot.cache
      Family770MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_770 : ∀ w ∈ windows_770, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_770 checked_770
noncomputable def fromRaw_770 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_770) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_770 checked_770 q raw nodes returns truth
noncomputable def windows_771 : List WorkingViewPilot.Window := [
  ⟨105071, 105076, Family771MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_771 : WorkingViewPilot.checks windows_771 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨105071, 105076, Family771MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      105071 105076 Family771MainPilot.cache
      Family771MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_771 : ∀ w ∈ windows_771, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_771 checked_771
noncomputable def fromRaw_771 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_771) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_771 checked_771 q raw nodes returns truth
noncomputable def windows_772 : List WorkingViewPilot.Window := [
  ⟨105076, 105146, Family772MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_772 : WorkingViewPilot.checks windows_772 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨105076, 105146, Family772MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      105076 105146 Family772MainPilot.cache
      Family772MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_772 : ∀ w ∈ windows_772, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_772 checked_772
noncomputable def fromRaw_772 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_772) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_772 checked_772 q raw nodes returns truth
noncomputable def windows_773 : List WorkingViewPilot.Window := [
  ⟨105146, 105411, Family773MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_773 : WorkingViewPilot.checks windows_773 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨105146, 105411, Family773MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      105146 105411 Family773MainPilot.cache
      Family773MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_773 : ∀ w ∈ windows_773, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_773 checked_773
noncomputable def fromRaw_773 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_773) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_773 checked_773 q raw nodes returns truth
noncomputable def windows_774 : List WorkingViewPilot.Window := [
  ⟨105411, 105416, Family774MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_774 : WorkingViewPilot.checks windows_774 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨105411, 105416, Family774MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      105411 105416 Family774MainPilot.cache
      Family774MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_774 : ∀ w ∈ windows_774, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_774 checked_774
noncomputable def fromRaw_774 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_774) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_774 checked_774 q raw nodes returns truth
noncomputable def windows_775 : List WorkingViewPilot.Window := [
  ⟨105416, 105426, Family775MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_775 : WorkingViewPilot.checks windows_775 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨105416, 105426, Family775MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      105416 105426 Family775MainPilot.cache
      Family775MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_775 : ∀ w ∈ windows_775, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_775 checked_775
noncomputable def fromRaw_775 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_775) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_775 checked_775 q raw nodes returns truth
noncomputable def windows_776 : List WorkingViewPilot.Window := [
  ⟨105426, 105646, Family776MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_776 : WorkingViewPilot.checks windows_776 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨105426, 105646, Family776MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      105426 105646 Family776MainPilot.cache
      Family776MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_776 : ∀ w ∈ windows_776, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_776 checked_776
noncomputable def fromRaw_776 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_776) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_776 checked_776 q raw nodes returns truth
noncomputable def windows_777 : List WorkingViewPilot.Window := [
  ⟨105646, 105951, Family777MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_777 : WorkingViewPilot.checks windows_777 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨105646, 105951, Family777MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      105646 105951 Family777MainPilot.cache
      Family777MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_777 : ∀ w ∈ windows_777, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_777 checked_777
noncomputable def fromRaw_777 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_777) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_777 checked_777 q raw nodes returns truth
noncomputable def windows_778 : List WorkingViewPilot.Window := [
  ⟨105951, 106021, Family778MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_778 : WorkingViewPilot.checks windows_778 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨105951, 106021, Family778MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      105951 106021 Family778MainPilot.cache
      Family778MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_778 : ∀ w ∈ windows_778, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_778 checked_778
noncomputable def fromRaw_778 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_778) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_778 checked_778 q raw nodes returns truth
noncomputable def windows_779 : List WorkingViewPilot.Window := [
  ⟨106021, 106216, Family779MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_779 : WorkingViewPilot.checks windows_779 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨106021, 106216, Family779MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      106021 106216 Family779MainPilot.cache
      Family779MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_779 : ∀ w ∈ windows_779, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_779 checked_779
noncomputable def fromRaw_779 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_779) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_779 checked_779 q raw nodes returns truth
noncomputable def windows_780 : List WorkingViewPilot.Window := [
  ⟨106216, 106286, Family780MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_780 : WorkingViewPilot.checks windows_780 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨106216, 106286, Family780MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      106216 106286 Family780MainPilot.cache
      Family780MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_780 : ∀ w ∈ windows_780, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_780 checked_780
noncomputable def fromRaw_780 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_780) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_780 checked_780 q raw nodes returns truth
noncomputable def windows_781 : List WorkingViewPilot.Window := [
  ⟨106286, 106551, Family781MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_781 : WorkingViewPilot.checks windows_781 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨106286, 106551, Family781MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      106286 106551 Family781MainPilot.cache
      Family781MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_781 : ∀ w ∈ windows_781, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_781 checked_781
noncomputable def fromRaw_781 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_781) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_781 checked_781 q raw nodes returns truth
noncomputable def windows_782 : List WorkingViewPilot.Window := [
  ⟨106551, 106771, Family782MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_782 : WorkingViewPilot.checks windows_782 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨106551, 106771, Family782MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      106551 106771 Family782MainPilot.cache
      Family782MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_782 : ∀ w ∈ windows_782, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_782 checked_782
noncomputable def fromRaw_782 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_782) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_782 checked_782 q raw nodes returns truth
noncomputable def windows_783 : List WorkingViewPilot.Window := [
  ⟨106771, 106776, Family783MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_783 : WorkingViewPilot.checks windows_783 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨106771, 106776, Family783MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      106771 106776 Family783MainPilot.cache
      Family783MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_783 : ∀ w ∈ windows_783, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_783 checked_783
noncomputable def fromRaw_783 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_783) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_783 checked_783 q raw nodes returns truth
noncomputable def windows_784 : List WorkingViewPilot.Window := [
  ⟨106776, 106846, Family784MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_784 : WorkingViewPilot.checks windows_784 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨106776, 106846, Family784MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      106776 106846 Family784MainPilot.cache
      Family784MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_784 : ∀ w ∈ windows_784, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_784 checked_784
noncomputable def fromRaw_784 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_784) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_784 checked_784 q raw nodes returns truth
noncomputable def windows_785 : List WorkingViewPilot.Window := [
  ⟨106846, 107111, Family785MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_785 : WorkingViewPilot.checks windows_785 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨106846, 107111, Family785MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      106846 107111 Family785MainPilot.cache
      Family785MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_785 : ∀ w ∈ windows_785, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_785 checked_785
noncomputable def fromRaw_785 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_785) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_785 checked_785 q raw nodes returns truth
noncomputable def windows_786 : List WorkingViewPilot.Window := [
  ⟨107111, 107116, Family786MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_786 : WorkingViewPilot.checks windows_786 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨107111, 107116, Family786MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      107111 107116 Family786MainPilot.cache
      Family786MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_786 : ∀ w ∈ windows_786, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_786 checked_786
noncomputable def fromRaw_786 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_786) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_786 checked_786 q raw nodes returns truth
noncomputable def windows_787 : List WorkingViewPilot.Window := [
  ⟨107116, 107126, Family787MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_787 : WorkingViewPilot.checks windows_787 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨107116, 107126, Family787MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      107116 107126 Family787MainPilot.cache
      Family787MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_787 : ∀ w ∈ windows_787, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_787 checked_787
noncomputable def fromRaw_787 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_787) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_787 checked_787 q raw nodes returns truth
noncomputable def windows_788 : List WorkingViewPilot.Window := [
  ⟨107126, 107496, Family788MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_788 : WorkingViewPilot.checks windows_788 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨107126, 107496, Family788MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      107126 107496 Family788MainPilot.cache
      Family788MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_788 : ∀ w ∈ windows_788, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_788 checked_788
noncomputable def fromRaw_788 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_788) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_788 checked_788 q raw nodes returns truth
noncomputable def windows_789 : List WorkingViewPilot.Window := [
  ⟨107496, 107936, Family789MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_789 : WorkingViewPilot.checks windows_789 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨107496, 107936, Family789MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      107496 107936 Family789MainPilot.cache
      Family789MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_789 : ∀ w ∈ windows_789, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_789 checked_789
noncomputable def fromRaw_789 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_789) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_789 checked_789 q raw nodes returns truth
noncomputable def windows_790 : List WorkingViewPilot.Window := [
  ⟨107936, 108006, Family790MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_790 : WorkingViewPilot.checks windows_790 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨107936, 108006, Family790MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      107936 108006 Family790MainPilot.cache
      Family790MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_790 : ∀ w ∈ windows_790, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_790 checked_790
noncomputable def fromRaw_790 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_790) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_790 checked_790 q raw nodes returns truth
noncomputable def windows_791 : List WorkingViewPilot.Window := [
  ⟨108006, 108201, Family791MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_791 : WorkingViewPilot.checks windows_791 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨108006, 108201, Family791MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      108006 108201 Family791MainPilot.cache
      Family791MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_791 : ∀ w ∈ windows_791, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_791 checked_791
noncomputable def fromRaw_791 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_791) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_791 checked_791 q raw nodes returns truth
noncomputable def windows_792 : List WorkingViewPilot.Window := [
  ⟨108201, 108271, Family792MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_792 : WorkingViewPilot.checks windows_792 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨108201, 108271, Family792MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      108201 108271 Family792MainPilot.cache
      Family792MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_792 : ∀ w ∈ windows_792, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_792 checked_792
noncomputable def fromRaw_792 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_792) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_792 checked_792 q raw nodes returns truth
noncomputable def windows_793 : List WorkingViewPilot.Window := [
  ⟨108271, 108671, Family793MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_793 : WorkingViewPilot.checks windows_793 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨108271, 108671, Family793MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      108271 108671 Family793MainPilot.cache
      Family793MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_793 : ∀ w ∈ windows_793, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_793 checked_793
noncomputable def fromRaw_793 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_793) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_793 checked_793 q raw nodes returns truth
noncomputable def windows_794 : List WorkingViewPilot.Window := [
  ⟨108671, 108676, Family794MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_794 : WorkingViewPilot.checks windows_794 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨108671, 108676, Family794MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      108671 108676 Family794MainPilot.cache
      Family794MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_794 : ∀ w ∈ windows_794, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_794 checked_794
noncomputable def fromRaw_794 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_794) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_794 checked_794 q raw nodes returns truth
noncomputable def windows_795 : List WorkingViewPilot.Window := [
  ⟨108676, 108746, Family795MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_795 : WorkingViewPilot.checks windows_795 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨108676, 108746, Family795MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      108676 108746 Family795MainPilot.cache
      Family795MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_795 : ∀ w ∈ windows_795, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_795 checked_795
noncomputable def fromRaw_795 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_795) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_795 checked_795 q raw nodes returns truth
noncomputable def windows_796 : List WorkingViewPilot.Window := [
  ⟨108746, 109116, Family796MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_796 : WorkingViewPilot.checks windows_796 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨108746, 109116, Family796MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      108746 109116 Family796MainPilot.cache
      Family796MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_796 : ∀ w ∈ windows_796, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_796 checked_796
noncomputable def fromRaw_796 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_796) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_796 checked_796 q raw nodes returns truth
noncomputable def windows_797 : List WorkingViewPilot.Window := [
  ⟨109116, 109121, Family797MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_797 : WorkingViewPilot.checks windows_797 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨109116, 109121, Family797MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      109116 109121 Family797MainPilot.cache
      Family797MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_797 : ∀ w ∈ windows_797, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_797 checked_797
noncomputable def fromRaw_797 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_797) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_797 checked_797 q raw nodes returns truth
noncomputable def windows_798 : List WorkingViewPilot.Window := [
  ⟨109121, 109191, Family798MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_798 : WorkingViewPilot.checks windows_798 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨109121, 109191, Family798MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      109121 109191 Family798MainPilot.cache
      Family798MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_798 : ∀ w ∈ windows_798, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_798 checked_798
noncomputable def fromRaw_798 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_798) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_798 checked_798 q raw nodes returns truth
noncomputable def windows_799 : List WorkingViewPilot.Window := [
  ⟨109191, 109591, Family799MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_799 : WorkingViewPilot.checks windows_799 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨109191, 109591, Family799MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      109191 109591 Family799MainPilot.cache
      Family799MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_799 : ∀ w ∈ windows_799, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_799 checked_799
noncomputable def fromRaw_799 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_799) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_799 checked_799 q raw nodes returns truth
noncomputable def windows_800 : List WorkingViewPilot.Window := [
  ⟨109591, 109596, Family800MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_800 : WorkingViewPilot.checks windows_800 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨109591, 109596, Family800MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      109591 109596 Family800MainPilot.cache
      Family800MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_800 : ∀ w ∈ windows_800, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_800 checked_800
noncomputable def fromRaw_800 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_800) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_800 checked_800 q raw nodes returns truth
noncomputable def windows_801 : List WorkingViewPilot.Window := [
  ⟨109596, 109666, Family801MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_801 : WorkingViewPilot.checks windows_801 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨109596, 109666, Family801MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      109596 109666 Family801MainPilot.cache
      Family801MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_801 : ∀ w ∈ windows_801, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_801 checked_801
noncomputable def fromRaw_801 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_801) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_801 checked_801 q raw nodes returns truth
noncomputable def windows_802 : List WorkingViewPilot.Window := [
  ⟨109666, 110036, Family802MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_802 : WorkingViewPilot.checks windows_802 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨109666, 110036, Family802MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      109666 110036 Family802MainPilot.cache
      Family802MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_802 : ∀ w ∈ windows_802, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_802 checked_802
noncomputable def fromRaw_802 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_802) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_802 checked_802 q raw nodes returns truth
noncomputable def windows_803 : List WorkingViewPilot.Window := [
  ⟨110036, 110041, Family803MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_803 : WorkingViewPilot.checks windows_803 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨110036, 110041, Family803MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      110036 110041 Family803MainPilot.cache
      Family803MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_803 : ∀ w ∈ windows_803, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_803 checked_803
noncomputable def fromRaw_803 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_803) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_803 checked_803 q raw nodes returns truth
noncomputable def windows_804 : List WorkingViewPilot.Window := [
  ⟨110041, 110111, Family804MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_804 : WorkingViewPilot.checks windows_804 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨110041, 110111, Family804MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      110041 110111 Family804MainPilot.cache
      Family804MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_804 : ∀ w ∈ windows_804, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_804 checked_804
noncomputable def fromRaw_804 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_804) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_804 checked_804 q raw nodes returns truth
noncomputable def windows_805 : List WorkingViewPilot.Window := [
  ⟨110111, 110511, Family805MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_805 : WorkingViewPilot.checks windows_805 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨110111, 110511, Family805MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      110111 110511 Family805MainPilot.cache
      Family805MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_805 : ∀ w ∈ windows_805, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_805 checked_805
noncomputable def fromRaw_805 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_805) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_805 checked_805 q raw nodes returns truth
noncomputable def windows_806 : List WorkingViewPilot.Window := [
  ⟨110511, 110516, Family806MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_806 : WorkingViewPilot.checks windows_806 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨110511, 110516, Family806MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      110511 110516 Family806MainPilot.cache
      Family806MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_806 : ∀ w ∈ windows_806, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_806 checked_806
noncomputable def fromRaw_806 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_806) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_806 checked_806 q raw nodes returns truth
noncomputable def windows_807 : List WorkingViewPilot.Window := [
  ⟨110516, 110586, Family807MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_807 : WorkingViewPilot.checks windows_807 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨110516, 110586, Family807MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      110516 110586 Family807MainPilot.cache
      Family807MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_807 : ∀ w ∈ windows_807, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_807 checked_807
noncomputable def fromRaw_807 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_807) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_807 checked_807 q raw nodes returns truth
noncomputable def windows_808 : List WorkingViewPilot.Window := [
  ⟨110586, 110891, Family808MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_808 : WorkingViewPilot.checks windows_808 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨110586, 110891, Family808MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      110586 110891 Family808MainPilot.cache
      Family808MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_808 : ∀ w ∈ windows_808, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_808 checked_808
noncomputable def fromRaw_808 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_808) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_808 checked_808 q raw nodes returns truth
noncomputable def windows_809 : List WorkingViewPilot.Window := [
  ⟨110891, 110961, Family809MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_809 : WorkingViewPilot.checks windows_809 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨110891, 110961, Family809MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      110891 110961 Family809MainPilot.cache
      Family809MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_809 : ∀ w ∈ windows_809, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_809 checked_809
noncomputable def fromRaw_809 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_809) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_809 checked_809 q raw nodes returns truth
noncomputable def windows_810 : List WorkingViewPilot.Window := [
  ⟨110961, 110966, Family810MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_810 : WorkingViewPilot.checks windows_810 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨110961, 110966, Family810MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      110961 110966 Family810MainPilot.cache
      Family810MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_810 : ∀ w ∈ windows_810, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_810 checked_810
noncomputable def fromRaw_810 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_810) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_810 checked_810 q raw nodes returns truth
noncomputable def windows_811 : List WorkingViewPilot.Window := [
  ⟨110966, 111036, Family811MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_811 : WorkingViewPilot.checks windows_811 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨110966, 111036, Family811MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      110966 111036 Family811MainPilot.cache
      Family811MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_811 : ∀ w ∈ windows_811, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_811 checked_811
noncomputable def fromRaw_811 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_811) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_811 checked_811 q raw nodes returns truth
noncomputable def windows_812 : List WorkingViewPilot.Window := [
  ⟨111036, 111301, Family812MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_812 : WorkingViewPilot.checks windows_812 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨111036, 111301, Family812MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      111036 111301 Family812MainPilot.cache
      Family812MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_812 : ∀ w ∈ windows_812, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_812 checked_812
noncomputable def fromRaw_812 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_812) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_812 checked_812 q raw nodes returns truth
noncomputable def windows_813 : List WorkingViewPilot.Window := [
  ⟨111301, 111306, Family813MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_813 : WorkingViewPilot.checks windows_813 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨111301, 111306, Family813MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      111301 111306 Family813MainPilot.cache
      Family813MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_813 : ∀ w ∈ windows_813, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_813 checked_813
noncomputable def fromRaw_813 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_813) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_813 checked_813 q raw nodes returns truth
noncomputable def windows_814 : List WorkingViewPilot.Window := [
  ⟨111306, 111316, Family814MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_814 : WorkingViewPilot.checks windows_814 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨111306, 111316, Family814MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      111306 111316 Family814MainPilot.cache
      Family814MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_814 : ∀ w ∈ windows_814, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_814 checked_814
noncomputable def fromRaw_814 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_814) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_814 checked_814 q raw nodes returns truth
noncomputable def windows_815 : List WorkingViewPilot.Window := [
  ⟨111316, 111536, Family815MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_815 : WorkingViewPilot.checks windows_815 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨111316, 111536, Family815MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      111316 111536 Family815MainPilot.cache
      Family815MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_815 : ∀ w ∈ windows_815, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_815 checked_815
noncomputable def fromRaw_815 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_815) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_815 checked_815 q raw nodes returns truth
noncomputable def windows_816 : List WorkingViewPilot.Window := [
  ⟨111536, 111841, Family816MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_816 : WorkingViewPilot.checks windows_816 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨111536, 111841, Family816MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      111536 111841 Family816MainPilot.cache
      Family816MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_816 : ∀ w ∈ windows_816, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_816 checked_816
noncomputable def fromRaw_816 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_816) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_816 checked_816 q raw nodes returns truth
noncomputable def windows_817 : List WorkingViewPilot.Window := [
  ⟨111841, 111911, Family817MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_817 : WorkingViewPilot.checks windows_817 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨111841, 111911, Family817MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      111841 111911 Family817MainPilot.cache
      Family817MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_817 : ∀ w ∈ windows_817, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_817 checked_817
noncomputable def fromRaw_817 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_817) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_817 checked_817 q raw nodes returns truth
noncomputable def windows_818 : List WorkingViewPilot.Window := [
  ⟨111911, 112106, Family818MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_818 : WorkingViewPilot.checks windows_818 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨111911, 112106, Family818MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      111911 112106 Family818MainPilot.cache
      Family818MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_818 : ∀ w ∈ windows_818, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_818 checked_818
noncomputable def fromRaw_818 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_818) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_818 checked_818 q raw nodes returns truth
noncomputable def windows_819 : List WorkingViewPilot.Window := [
  ⟨112106, 112176, Family819MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_819 : WorkingViewPilot.checks windows_819 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨112106, 112176, Family819MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      112106 112176 Family819MainPilot.cache
      Family819MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_819 : ∀ w ∈ windows_819, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_819 checked_819
noncomputable def fromRaw_819 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_819) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_819 checked_819 q raw nodes returns truth
noncomputable def windows_820 : List WorkingViewPilot.Window := [
  ⟨112176, 112441, Family820MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_820 : WorkingViewPilot.checks windows_820 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨112176, 112441, Family820MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      112176 112441 Family820MainPilot.cache
      Family820MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_820 : ∀ w ∈ windows_820, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_820 checked_820
noncomputable def fromRaw_820 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_820) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_820 checked_820 q raw nodes returns truth
noncomputable def windows_821 : List WorkingViewPilot.Window := [
  ⟨112441, 112661, Family821MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_821 : WorkingViewPilot.checks windows_821 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨112441, 112661, Family821MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      112441 112661 Family821MainPilot.cache
      Family821MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_821 : ∀ w ∈ windows_821, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_821 checked_821
noncomputable def fromRaw_821 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_821) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_821 checked_821 q raw nodes returns truth
noncomputable def windows_822 : List WorkingViewPilot.Window := [
  ⟨112661, 112666, Family822MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_822 : WorkingViewPilot.checks windows_822 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨112661, 112666, Family822MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      112661 112666 Family822MainPilot.cache
      Family822MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_822 : ∀ w ∈ windows_822, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_822 checked_822
noncomputable def fromRaw_822 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_822) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_822 checked_822 q raw nodes returns truth
noncomputable def windows_823 : List WorkingViewPilot.Window := [
  ⟨112666, 112736, Family823MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_823 : WorkingViewPilot.checks windows_823 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨112666, 112736, Family823MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      112666 112736 Family823MainPilot.cache
      Family823MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_823 : ∀ w ∈ windows_823, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_823 checked_823
noncomputable def fromRaw_823 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_823) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_823 checked_823 q raw nodes returns truth
noncomputable def windows_824 : List WorkingViewPilot.Window := [
  ⟨112736, 113001, Family824MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_824 : WorkingViewPilot.checks windows_824 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨112736, 113001, Family824MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      112736 113001 Family824MainPilot.cache
      Family824MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_824 : ∀ w ∈ windows_824, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_824 checked_824
noncomputable def fromRaw_824 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_824) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_824 checked_824 q raw nodes returns truth
noncomputable def windows_825 : List WorkingViewPilot.Window := [
  ⟨113001, 113006, Family825MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_825 : WorkingViewPilot.checks windows_825 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨113001, 113006, Family825MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      113001 113006 Family825MainPilot.cache
      Family825MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_825 : ∀ w ∈ windows_825, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_825 checked_825
noncomputable def fromRaw_825 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_825) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_825 checked_825 q raw nodes returns truth
noncomputable def windows_826 : List WorkingViewPilot.Window := [
  ⟨113006, 113016, Family826MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_826 : WorkingViewPilot.checks windows_826 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨113006, 113016, Family826MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      113006 113016 Family826MainPilot.cache
      Family826MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_826 : ∀ w ∈ windows_826, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_826 checked_826
noncomputable def fromRaw_826 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_826) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_826 checked_826 q raw nodes returns truth
noncomputable def windows_827 : List WorkingViewPilot.Window := [
  ⟨113016, 113386, Family827MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_827 : WorkingViewPilot.checks windows_827 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨113016, 113386, Family827MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      113016 113386 Family827MainPilot.cache
      Family827MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_827 : ∀ w ∈ windows_827, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_827 checked_827
noncomputable def fromRaw_827 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_827) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_827 checked_827 q raw nodes returns truth
noncomputable def windows_828 : List WorkingViewPilot.Window := [
  ⟨113386, 113826, Family828MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_828 : WorkingViewPilot.checks windows_828 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨113386, 113826, Family828MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      113386 113826 Family828MainPilot.cache
      Family828MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_828 : ∀ w ∈ windows_828, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_828 checked_828
noncomputable def fromRaw_828 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_828) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_828 checked_828 q raw nodes returns truth
noncomputable def windows_829 : List WorkingViewPilot.Window := [
  ⟨113826, 113896, Family829MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_829 : WorkingViewPilot.checks windows_829 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨113826, 113896, Family829MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      113826 113896 Family829MainPilot.cache
      Family829MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_829 : ∀ w ∈ windows_829, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_829 checked_829
noncomputable def fromRaw_829 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_829) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_829 checked_829 q raw nodes returns truth
noncomputable def windows_830 : List WorkingViewPilot.Window := [
  ⟨113896, 114091, Family830MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_830 : WorkingViewPilot.checks windows_830 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨113896, 114091, Family830MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      113896 114091 Family830MainPilot.cache
      Family830MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_830 : ∀ w ∈ windows_830, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_830 checked_830
noncomputable def fromRaw_830 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_830) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_830 checked_830 q raw nodes returns truth
noncomputable def windows_831 : List WorkingViewPilot.Window := [
  ⟨114091, 114161, Family831MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_831 : WorkingViewPilot.checks windows_831 = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨114091, 114161, Family831MainPilot.cache⟩
    (⟨533341, 573802, FamilyReturnsPilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      114091 114161 Family831MainPilot.cache
      Family831MainPilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨533341, 573802, FamilyReturnsPilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      533341 573802 FamilyReturnsPilot.cache
      FamilyReturnsPilot.checked (by decide +kernel))
    (rfl))
theorem fidelity_831 : ∀ w ∈ windows_831, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_831 checked_831
noncomputable def fromRaw_831 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_831) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_831 checked_831 q raw nodes returns truth
end FamilyViews008Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Quantified working-set batch fidelity checked"
