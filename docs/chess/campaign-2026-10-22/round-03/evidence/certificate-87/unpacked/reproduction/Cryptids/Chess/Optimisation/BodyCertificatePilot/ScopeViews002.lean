module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.ScopeViews002Data
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LocalViews

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace SourceCache256Pilot
theorem checked_1726_15 : validate cache_1726_15 1726 =
    some 1741 := by
  decide +kernel

theorem checked : validate cache 1726 = some 1741 := checked_1726_15

theorem count_exact : cache.count = 15 := by
  have extent := validate_extent cache 1726 1741 checked
  omega

theorem within_body : 1741 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 1726 1741 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 1726 1741 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 1726 1741 address = observedPair address :=
  cachedPair_eq cache 1726 1741 checked address

end SourceCache256Pilot
open LookupCachePilot
namespace SourceCache257Pilot
theorem checked_1741_5 : validate cache_1741_5 1741 =
    some 1746 := by
  decide +kernel

theorem checked : validate cache 1741 = some 1746 := checked_1741_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 1741 1746 checked
  omega

theorem within_body : 1746 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 1741 1746 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 1741 1746 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 1741 1746 address = observedPair address :=
  cachedPair_eq cache 1741 1746 checked address

end SourceCache257Pilot
open LookupCachePilot
namespace SourceCache258Pilot
theorem checked_1746_5 : validate cache_1746_5 1746 =
    some 1751 := by
  decide +kernel

theorem checked : validate cache 1746 = some 1751 := checked_1746_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 1746 1751 checked
  omega

theorem within_body : 1751 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 1746 1751 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 1746 1751 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 1746 1751 address = observedPair address :=
  cachedPair_eq cache 1746 1751 checked address

end SourceCache258Pilot
open LookupCachePilot
namespace SourceCache259Pilot
theorem checked_1751_5 : validate cache_1751_5 1751 =
    some 1756 := by
  decide +kernel

theorem checked : validate cache 1751 = some 1756 := checked_1751_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 1751 1756 checked
  omega

theorem within_body : 1756 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 1751 1756 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 1751 1756 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 1751 1756 address = observedPair address :=
  cachedPair_eq cache 1751 1756 checked address

end SourceCache259Pilot
open LookupCachePilot
namespace SourceCache260Pilot
theorem checked_1756_15 : validate cache_1756_15 1756 =
    some 1771 := by
  decide +kernel

theorem checked : validate cache 1756 = some 1771 := checked_1756_15

theorem count_exact : cache.count = 15 := by
  have extent := validate_extent cache 1756 1771 checked
  omega

theorem within_body : 1771 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 1756 1771 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 1756 1771 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 1756 1771 address = observedPair address :=
  cachedPair_eq cache 1756 1771 checked address

end SourceCache260Pilot
open LookupCachePilot
namespace SourceCache261Pilot
theorem checked_1771_5 : validate cache_1771_5 1771 =
    some 1776 := by
  decide +kernel

theorem checked : validate cache 1771 = some 1776 := checked_1771_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 1771 1776 checked
  omega

theorem within_body : 1776 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 1771 1776 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 1771 1776 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 1771 1776 address = observedPair address :=
  cachedPair_eq cache 1771 1776 checked address

end SourceCache261Pilot
open LookupCachePilot
namespace SourceCache262Pilot
theorem checked_1776_15 : validate cache_1776_15 1776 =
    some 1791 := by
  decide +kernel

theorem checked : validate cache 1776 = some 1791 := checked_1776_15

theorem count_exact : cache.count = 15 := by
  have extent := validate_extent cache 1776 1791 checked
  omega

theorem within_body : 1791 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 1776 1791 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 1776 1791 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 1776 1791 address = observedPair address :=
  cachedPair_eq cache 1776 1791 checked address

end SourceCache262Pilot
open LookupCachePilot
namespace SourceCache263Pilot
theorem checked_1791_5 : validate cache_1791_5 1791 =
    some 1796 := by
  decide +kernel

theorem checked : validate cache 1791 = some 1796 := checked_1791_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 1791 1796 checked
  omega

theorem within_body : 1796 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 1791 1796 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 1791 1796 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 1791 1796 address = observedPair address :=
  cachedPair_eq cache 1791 1796 checked address

end SourceCache263Pilot
open LookupCachePilot
namespace SourceCache264Pilot
theorem checked_1796_5 : validate cache_1796_5 1796 =
    some 1801 := by
  decide +kernel

theorem checked : validate cache 1796 = some 1801 := checked_1796_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 1796 1801 checked
  omega

theorem within_body : 1801 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 1796 1801 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 1796 1801 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 1796 1801 address = observedPair address :=
  cachedPair_eq cache 1796 1801 checked address

end SourceCache264Pilot
open LookupCachePilot
namespace SourceCache265Pilot
theorem checked_1801_5 : validate cache_1801_5 1801 =
    some 1806 := by
  decide +kernel

theorem checked : validate cache 1801 = some 1806 := checked_1801_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 1801 1806 checked
  omega

theorem within_body : 1806 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 1801 1806 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 1801 1806 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 1801 1806 address = observedPair address :=
  cachedPair_eq cache 1801 1806 checked address

end SourceCache265Pilot
open LookupCachePilot
namespace SourceCache266Pilot
theorem checked_1806_15 : validate cache_1806_15 1806 =
    some 1821 := by
  decide +kernel

theorem checked : validate cache 1806 = some 1821 := checked_1806_15

theorem count_exact : cache.count = 15 := by
  have extent := validate_extent cache 1806 1821 checked
  omega

theorem within_body : 1821 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 1806 1821 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 1806 1821 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 1806 1821 address = observedPair address :=
  cachedPair_eq cache 1806 1821 checked address

end SourceCache266Pilot
open LookupCachePilot
namespace SourceCache267Pilot
theorem checked_1821_5 : validate cache_1821_5 1821 =
    some 1826 := by
  decide +kernel

theorem checked : validate cache 1821 = some 1826 := checked_1821_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 1821 1826 checked
  omega

theorem within_body : 1826 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 1821 1826 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 1821 1826 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 1821 1826 address = observedPair address :=
  cachedPair_eq cache 1821 1826 checked address

end SourceCache267Pilot
open LookupCachePilot
namespace SourceCache268Pilot
theorem checked_1826_5 : validate cache_1826_5 1826 =
    some 1831 := by
  decide +kernel

theorem checked : validate cache 1826 = some 1831 := checked_1826_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 1826 1831 checked
  omega

theorem within_body : 1831 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 1826 1831 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 1826 1831 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 1826 1831 address = observedPair address :=
  cachedPair_eq cache 1826 1831 checked address

end SourceCache268Pilot
open LookupCachePilot
namespace SourceCache269Pilot
theorem checked_1831_5 : validate cache_1831_5 1831 =
    some 1836 := by
  decide +kernel

theorem checked : validate cache 1831 = some 1836 := checked_1831_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 1831 1836 checked
  omega

theorem within_body : 1836 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 1831 1836 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 1831 1836 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 1831 1836 address = observedPair address :=
  cachedPair_eq cache 1831 1836 checked address

end SourceCache269Pilot
open LookupCachePilot
namespace SourceCache270Pilot
theorem checked_1836_5 : validate cache_1836_5 1836 =
    some 1841 := by
  decide +kernel

theorem checked : validate cache 1836 = some 1841 := checked_1836_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 1836 1841 checked
  omega

theorem within_body : 1841 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 1836 1841 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 1836 1841 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 1836 1841 address = observedPair address :=
  cachedPair_eq cache 1836 1841 checked address

end SourceCache270Pilot
open LookupCachePilot
namespace SourceCache271Pilot
theorem checked_1841_5 : validate cache_1841_5 1841 =
    some 1846 := by
  decide +kernel

theorem checked : validate cache 1841 = some 1846 := checked_1841_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 1841 1846 checked
  omega

theorem within_body : 1846 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 1841 1846 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 1841 1846 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 1841 1846 address = observedPair address :=
  cachedPair_eq cache 1841 1846 checked address

end SourceCache271Pilot
open LookupCachePilot
namespace SourceCache272Pilot
theorem checked_1846_5 : validate cache_1846_5 1846 =
    some 1851 := by
  decide +kernel

theorem checked : validate cache 1846 = some 1851 := checked_1846_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 1846 1851 checked
  omega

theorem within_body : 1851 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 1846 1851 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 1846 1851 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 1846 1851 address = observedPair address :=
  cachedPair_eq cache 1846 1851 checked address

end SourceCache272Pilot
open LookupCachePilot
namespace SourceCache273Pilot
theorem checked_1851_5 : validate cache_1851_5 1851 =
    some 1856 := by
  decide +kernel

theorem checked : validate cache 1851 = some 1856 := checked_1851_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 1851 1856 checked
  omega

theorem within_body : 1856 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 1851 1856 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 1851 1856 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 1851 1856 address = observedPair address :=
  cachedPair_eq cache 1851 1856 checked address

end SourceCache273Pilot
open LookupCachePilot
namespace SourceCache274Pilot
theorem checked_1856_15 : validate cache_1856_15 1856 =
    some 1871 := by
  decide +kernel

theorem checked : validate cache 1856 = some 1871 := checked_1856_15

theorem count_exact : cache.count = 15 := by
  have extent := validate_extent cache 1856 1871 checked
  omega

theorem within_body : 1871 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 1856 1871 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 1856 1871 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 1856 1871 address = observedPair address :=
  cachedPair_eq cache 1856 1871 checked address

end SourceCache274Pilot
open LookupCachePilot
namespace SourceCache275Pilot
theorem checked_1871_5 : validate cache_1871_5 1871 =
    some 1876 := by
  decide +kernel

theorem checked : validate cache 1871 = some 1876 := checked_1871_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 1871 1876 checked
  omega

theorem within_body : 1876 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 1871 1876 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 1871 1876 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 1871 1876 address = observedPair address :=
  cachedPair_eq cache 1871 1876 checked address

end SourceCache275Pilot
open LookupCachePilot
namespace SourceCache276Pilot
theorem checked_1876_5 : validate cache_1876_5 1876 =
    some 1881 := by
  decide +kernel

theorem checked : validate cache 1876 = some 1881 := checked_1876_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 1876 1881 checked
  omega

theorem within_body : 1881 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 1876 1881 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 1876 1881 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 1876 1881 address = observedPair address :=
  cachedPair_eq cache 1876 1881 checked address

end SourceCache276Pilot
open LookupCachePilot
namespace SourceCache277Pilot
theorem checked_1881_70 : validate cache_1881_70 1881 =
    some 1951 := by
  decide +kernel

theorem checked : validate cache 1881 = some 1951 := checked_1881_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 1881 1951 checked
  omega

theorem within_body : 1951 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 1881 1951 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 1881 1951 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 1881 1951 address = observedPair address :=
  cachedPair_eq cache 1881 1951 checked address

end SourceCache277Pilot
open LookupCachePilot
namespace SourceCache278Pilot
theorem checked_1951_185 : validate cache_1951_185 1951 =
    some 2136 := by
  decide +kernel
theorem checked_2136_185 : validate cache_2136_185 2136 =
    some 2321 := by
  decide +kernel
theorem checked_1951_370 : validate cache_1951_370 1951 =
    some 2321 := by
  exact validate_branch 185 cache_1951_185 cache_2136_185
    1951 2136 2321
    checked_1951_185 rfl checked_2136_185

theorem checked : validate cache 1951 = some 2321 := checked_1951_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 1951 2321 checked
  omega

theorem within_body : 2321 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 1951 2321 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 1951 2321 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 1951 2321 address = observedPair address :=
  cachedPair_eq cache 1951 2321 checked address

end SourceCache278Pilot
open LookupCachePilot
namespace SourceCache279Pilot
theorem checked_2321_5 : validate cache_2321_5 2321 =
    some 2326 := by
  decide +kernel

theorem checked : validate cache 2321 = some 2326 := checked_2321_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 2321 2326 checked
  omega

theorem within_body : 2326 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 2321 2326 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 2321 2326 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 2321 2326 address = observedPair address :=
  cachedPair_eq cache 2321 2326 checked address

end SourceCache279Pilot
open LookupCachePilot
namespace SourceCache280Pilot
theorem checked_2326_70 : validate cache_2326_70 2326 =
    some 2396 := by
  decide +kernel

theorem checked : validate cache 2326 = some 2396 := checked_2326_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 2326 2396 checked
  omega

theorem within_body : 2396 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 2326 2396 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 2326 2396 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 2326 2396 address = observedPair address :=
  cachedPair_eq cache 2326 2396 checked address

end SourceCache280Pilot
open LookupCachePilot
namespace SourceCache281Pilot
theorem checked_2396_200 : validate cache_2396_200 2396 =
    some 2596 := by
  decide +kernel
theorem checked_2596_200 : validate cache_2596_200 2596 =
    some 2796 := by
  decide +kernel
theorem checked_2396_400 : validate cache_2396_400 2396 =
    some 2796 := by
  exact validate_branch 200 cache_2396_200 cache_2596_200
    2396 2596 2796
    checked_2396_200 rfl checked_2596_200

theorem checked : validate cache 2396 = some 2796 := checked_2396_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 2396 2796 checked
  omega

theorem within_body : 2796 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 2396 2796 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 2396 2796 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 2396 2796 address = observedPair address :=
  cachedPair_eq cache 2396 2796 checked address

end SourceCache281Pilot
open LookupCachePilot
namespace SourceCache282Pilot
theorem checked_2796_5 : validate cache_2796_5 2796 =
    some 2801 := by
  decide +kernel

theorem checked : validate cache 2796 = some 2801 := checked_2796_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 2796 2801 checked
  omega

theorem within_body : 2801 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 2796 2801 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 2796 2801 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 2796 2801 address = observedPair address :=
  cachedPair_eq cache 2796 2801 checked address

end SourceCache282Pilot
open LookupCachePilot
namespace SourceCache283Pilot
theorem checked_2801_10 : validate cache_2801_10 2801 =
    some 2811 := by
  decide +kernel

theorem checked : validate cache 2801 = some 2811 := checked_2801_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 2801 2811 checked
  omega

theorem within_body : 2811 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 2801 2811 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 2801 2811 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 2801 2811 address = observedPair address :=
  cachedPair_eq cache 2801 2811 checked address

end SourceCache283Pilot
open LookupCachePilot
namespace SourceCache284Pilot
theorem checked_2811_220 : validate cache_2811_220 2811 =
    some 3031 := by
  decide +kernel

theorem checked : validate cache 2811 = some 3031 := checked_2811_220

theorem count_exact : cache.count = 220 := by
  have extent := validate_extent cache 2811 3031 checked
  omega

theorem within_body : 3031 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 2811 3031 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 2811 3031 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 2811 3031 address = observedPair address :=
  cachedPair_eq cache 2811 3031 checked address

end SourceCache284Pilot
open LookupCachePilot
namespace SourceCache285Pilot
theorem checked_3031_152 : validate cache_3031_152 3031 =
    some 3183 := by
  decide +kernel
theorem checked_3183_153 : validate cache_3183_153 3183 =
    some 3336 := by
  decide +kernel
theorem checked_3031_305 : validate cache_3031_305 3031 =
    some 3336 := by
  exact validate_branch 152 cache_3031_152 cache_3183_153
    3031 3183 3336
    checked_3031_152 rfl checked_3183_153

theorem checked : validate cache 3031 = some 3336 := checked_3031_305

theorem count_exact : cache.count = 305 := by
  have extent := validate_extent cache 3031 3336 checked
  omega

theorem within_body : 3336 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 3031 3336 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 3031 3336 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 3031 3336 address = observedPair address :=
  cachedPair_eq cache 3031 3336 checked address

end SourceCache285Pilot
open LookupCachePilot
namespace SourceCache286Pilot
theorem checked_3336_70 : validate cache_3336_70 3336 =
    some 3406 := by
  decide +kernel

theorem checked : validate cache 3336 = some 3406 := checked_3336_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 3336 3406 checked
  omega

theorem within_body : 3406 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 3336 3406 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 3336 3406 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 3336 3406 address = observedPair address :=
  cachedPair_eq cache 3336 3406 checked address

end SourceCache286Pilot
open LookupCachePilot
namespace SourceCache287Pilot
theorem checked_3406_195 : validate cache_3406_195 3406 =
    some 3601 := by
  decide +kernel

theorem checked : validate cache 3406 = some 3601 := checked_3406_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 3406 3601 checked
  omega

theorem within_body : 3601 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 3406 3601 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 3406 3601 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 3406 3601 address = observedPair address :=
  cachedPair_eq cache 3406 3601 checked address

end SourceCache287Pilot
open LookupCachePilot
namespace SourceCache288Pilot
theorem checked_3601_70 : validate cache_3601_70 3601 =
    some 3671 := by
  decide +kernel

theorem checked : validate cache 3601 = some 3671 := checked_3601_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 3601 3671 checked
  omega

theorem within_body : 3671 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 3601 3671 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 3601 3671 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 3601 3671 address = observedPair address :=
  cachedPair_eq cache 3601 3671 checked address

end SourceCache288Pilot
open LookupCachePilot
namespace SourceCache289Pilot
theorem checked_3671_132 : validate cache_3671_132 3671 =
    some 3803 := by
  decide +kernel
theorem checked_3803_133 : validate cache_3803_133 3803 =
    some 3936 := by
  decide +kernel
theorem checked_3671_265 : validate cache_3671_265 3671 =
    some 3936 := by
  exact validate_branch 132 cache_3671_132 cache_3803_133
    3671 3803 3936
    checked_3671_132 rfl checked_3803_133

theorem checked : validate cache 3671 = some 3936 := checked_3671_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 3671 3936 checked
  omega

theorem within_body : 3936 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 3671 3936 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 3671 3936 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 3671 3936 address = observedPair address :=
  cachedPair_eq cache 3671 3936 checked address

end SourceCache289Pilot
open LookupCachePilot
namespace SourceCache290Pilot
theorem checked_3936_5 : validate cache_3936_5 3936 =
    some 3941 := by
  decide +kernel

theorem checked : validate cache 3936 = some 3941 := checked_3936_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 3936 3941 checked
  omega

theorem within_body : 3941 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 3936 3941 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 3936 3941 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 3936 3941 address = observedPair address :=
  cachedPair_eq cache 3936 3941 checked address

end SourceCache290Pilot
open LookupCachePilot
namespace SourceCache291Pilot
theorem checked_3941_70 : validate cache_3941_70 3941 =
    some 4011 := by
  decide +kernel

theorem checked : validate cache 3941 = some 4011 := checked_3941_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 3941 4011 checked
  omega

theorem within_body : 4011 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 3941 4011 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 3941 4011 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 3941 4011 address = observedPair address :=
  cachedPair_eq cache 3941 4011 checked address

end SourceCache291Pilot
open LookupCachePilot
namespace SourceCache292Pilot
theorem checked_4011_167 : validate cache_4011_167 4011 =
    some 4178 := by
  decide +kernel
theorem checked_4178_168 : validate cache_4178_168 4178 =
    some 4346 := by
  decide +kernel
theorem checked_4011_335 : validate cache_4011_335 4011 =
    some 4346 := by
  exact validate_branch 167 cache_4011_167 cache_4178_168
    4011 4178 4346
    checked_4011_167 rfl checked_4178_168
theorem checked_4346_167 : validate cache_4346_167 4346 =
    some 4513 := by
  decide +kernel
theorem checked_4513_168 : validate cache_4513_168 4513 =
    some 4681 := by
  decide +kernel
theorem checked_4346_335 : validate cache_4346_335 4346 =
    some 4681 := by
  exact validate_branch 167 cache_4346_167 cache_4513_168
    4346 4513 4681
    checked_4346_167 rfl checked_4513_168
theorem checked_4011_670 : validate cache_4011_670 4011 =
    some 4681 := by
  exact validate_branch 335 cache_4011_335 cache_4346_335
    4011 4346 4681
    checked_4011_335 rfl checked_4346_335

theorem checked : validate cache 4011 = some 4681 := checked_4011_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 4011 4681 checked
  omega

theorem within_body : 4681 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 4011 4681 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 4011 4681 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 4011 4681 address = observedPair address :=
  cachedPair_eq cache 4011 4681 checked address

end SourceCache292Pilot
open LookupCachePilot
namespace SourceCache293Pilot
theorem checked_4681_70 : validate cache_4681_70 4681 =
    some 4751 := by
  decide +kernel

theorem checked : validate cache 4681 = some 4751 := checked_4681_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 4681 4751 checked
  omega

theorem within_body : 4751 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 4681 4751 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 4681 4751 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 4681 4751 address = observedPair address :=
  cachedPair_eq cache 4681 4751 checked address

end SourceCache293Pilot
open LookupCachePilot
namespace SourceCache294Pilot
theorem checked_4751_167 : validate cache_4751_167 4751 =
    some 4918 := by
  decide +kernel
theorem checked_4918_168 : validate cache_4918_168 4918 =
    some 5086 := by
  decide +kernel
theorem checked_4751_335 : validate cache_4751_335 4751 =
    some 5086 := by
  exact validate_branch 167 cache_4751_167 cache_4918_168
    4751 4918 5086
    checked_4751_167 rfl checked_4918_168
theorem checked_5086_167 : validate cache_5086_167 5086 =
    some 5253 := by
  decide +kernel
theorem checked_5253_168 : validate cache_5253_168 5253 =
    some 5421 := by
  decide +kernel
theorem checked_5086_335 : validate cache_5086_335 5086 =
    some 5421 := by
  exact validate_branch 167 cache_5086_167 cache_5253_168
    5086 5253 5421
    checked_5086_167 rfl checked_5253_168
theorem checked_4751_670 : validate cache_4751_670 4751 =
    some 5421 := by
  exact validate_branch 335 cache_4751_335 cache_5086_335
    4751 5086 5421
    checked_4751_335 rfl checked_5086_335

theorem checked : validate cache 4751 = some 5421 := checked_4751_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 4751 5421 checked
  omega

theorem within_body : 5421 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 4751 5421 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 4751 5421 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 4751 5421 address = observedPair address :=
  cachedPair_eq cache 4751 5421 checked address

end SourceCache294Pilot
open LookupCachePilot
namespace SourceCache295Pilot
theorem checked_5421_167 : validate cache_5421_167 5421 =
    some 5588 := by
  decide +kernel
theorem checked_5588_168 : validate cache_5588_168 5588 =
    some 5756 := by
  decide +kernel
theorem checked_5421_335 : validate cache_5421_335 5421 =
    some 5756 := by
  exact validate_branch 167 cache_5421_167 cache_5588_168
    5421 5588 5756
    checked_5421_167 rfl checked_5588_168
theorem checked_5756_167 : validate cache_5756_167 5756 =
    some 5923 := by
  decide +kernel
theorem checked_5923_168 : validate cache_5923_168 5923 =
    some 6091 := by
  decide +kernel
theorem checked_5756_335 : validate cache_5756_335 5756 =
    some 6091 := by
  exact validate_branch 167 cache_5756_167 cache_5923_168
    5756 5923 6091
    checked_5756_167 rfl checked_5923_168
theorem checked_5421_670 : validate cache_5421_670 5421 =
    some 6091 := by
  exact validate_branch 335 cache_5421_335 cache_5756_335
    5421 5756 6091
    checked_5421_335 rfl checked_5756_335

theorem checked : validate cache 5421 = some 6091 := checked_5421_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 5421 6091 checked
  omega

theorem within_body : 6091 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 5421 6091 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 5421 6091 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 5421 6091 address = observedPair address :=
  cachedPair_eq cache 5421 6091 checked address

end SourceCache295Pilot
open LookupCachePilot
namespace SourceCache296Pilot
theorem checked_6091_5 : validate cache_6091_5 6091 =
    some 6096 := by
  decide +kernel

theorem checked : validate cache 6091 = some 6096 := checked_6091_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 6091 6096 checked
  omega

theorem within_body : 6096 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 6091 6096 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 6091 6096 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 6091 6096 address = observedPair address :=
  cachedPair_eq cache 6091 6096 checked address

end SourceCache296Pilot
open LookupCachePilot
namespace SourceCache297Pilot
theorem checked_6096_70 : validate cache_6096_70 6096 =
    some 6166 := by
  decide +kernel

theorem checked : validate cache 6096 = some 6166 := checked_6096_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 6096 6166 checked
  omega

theorem within_body : 6166 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 6096 6166 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 6096 6166 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 6096 6166 address = observedPair address :=
  cachedPair_eq cache 6096 6166 checked address

end SourceCache297Pilot
open LookupCachePilot
namespace SourceCache298Pilot
theorem checked_6166_167 : validate cache_6166_167 6166 =
    some 6333 := by
  decide +kernel
theorem checked_6333_168 : validate cache_6333_168 6333 =
    some 6501 := by
  decide +kernel
theorem checked_6166_335 : validate cache_6166_335 6166 =
    some 6501 := by
  exact validate_branch 167 cache_6166_167 cache_6333_168
    6166 6333 6501
    checked_6166_167 rfl checked_6333_168
theorem checked_6501_167 : validate cache_6501_167 6501 =
    some 6668 := by
  decide +kernel
theorem checked_6668_168 : validate cache_6668_168 6668 =
    some 6836 := by
  decide +kernel
theorem checked_6501_335 : validate cache_6501_335 6501 =
    some 6836 := by
  exact validate_branch 167 cache_6501_167 cache_6668_168
    6501 6668 6836
    checked_6501_167 rfl checked_6668_168
theorem checked_6166_670 : validate cache_6166_670 6166 =
    some 6836 := by
  exact validate_branch 335 cache_6166_335 cache_6501_335
    6166 6501 6836
    checked_6166_335 rfl checked_6501_335

theorem checked : validate cache 6166 = some 6836 := checked_6166_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 6166 6836 checked
  omega

theorem within_body : 6836 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 6166 6836 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 6166 6836 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 6166 6836 address = observedPair address :=
  cachedPair_eq cache 6166 6836 checked address

end SourceCache298Pilot
open LookupCachePilot
namespace SourceCache299Pilot
theorem checked_6836_5 : validate cache_6836_5 6836 =
    some 6841 := by
  decide +kernel

theorem checked : validate cache 6836 = some 6841 := checked_6836_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 6836 6841 checked
  omega

theorem within_body : 6841 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 6836 6841 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 6836 6841 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 6836 6841 address = observedPair address :=
  cachedPair_eq cache 6836 6841 checked address

end SourceCache299Pilot
open LookupCachePilot
namespace SourceCache300Pilot
theorem checked_6841_10 : validate cache_6841_10 6841 =
    some 6851 := by
  decide +kernel

theorem checked : validate cache 6841 = some 6851 := checked_6841_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 6841 6851 checked
  omega

theorem within_body : 6851 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 6841 6851 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 6841 6851 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 6841 6851 address = observedPair address :=
  cachedPair_eq cache 6841 6851 checked address

end SourceCache300Pilot
open LookupCachePilot
namespace SourceCache301Pilot
theorem checked_6851_185 : validate cache_6851_185 6851 =
    some 7036 := by
  decide +kernel
theorem checked_7036_185 : validate cache_7036_185 7036 =
    some 7221 := by
  decide +kernel
theorem checked_6851_370 : validate cache_6851_370 6851 =
    some 7221 := by
  exact validate_branch 185 cache_6851_185 cache_7036_185
    6851 7036 7221
    checked_6851_185 rfl checked_7036_185

theorem checked : validate cache 6851 = some 7221 := checked_6851_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 6851 7221 checked
  omega

theorem within_body : 7221 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 6851 7221 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 6851 7221 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 6851 7221 address = observedPair address :=
  cachedPair_eq cache 6851 7221 checked address

end SourceCache301Pilot
open LookupCachePilot
namespace SourceCache302Pilot
theorem checked_7221_220 : validate cache_7221_220 7221 =
    some 7441 := by
  decide +kernel
theorem checked_7441_220 : validate cache_7441_220 7441 =
    some 7661 := by
  decide +kernel
theorem checked_7221_440 : validate cache_7221_440 7221 =
    some 7661 := by
  exact validate_branch 220 cache_7221_220 cache_7441_220
    7221 7441 7661
    checked_7221_220 rfl checked_7441_220

theorem checked : validate cache 7221 = some 7661 := checked_7221_440

theorem count_exact : cache.count = 440 := by
  have extent := validate_extent cache 7221 7661 checked
  omega

theorem within_body : 7661 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 7221 7661 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 7221 7661 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 7221 7661 address = observedPair address :=
  cachedPair_eq cache 7221 7661 checked address

end SourceCache302Pilot
open LookupCachePilot
namespace SourceCache303Pilot
theorem checked_7661_70 : validate cache_7661_70 7661 =
    some 7731 := by
  decide +kernel

theorem checked : validate cache 7661 = some 7731 := checked_7661_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 7661 7731 checked
  omega

theorem within_body : 7731 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 7661 7731 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 7661 7731 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 7661 7731 address = observedPair address :=
  cachedPair_eq cache 7661 7731 checked address

end SourceCache303Pilot
open LookupCachePilot
namespace SourceCache304Pilot
theorem checked_7731_195 : validate cache_7731_195 7731 =
    some 7926 := by
  decide +kernel

theorem checked : validate cache 7731 = some 7926 := checked_7731_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 7731 7926 checked
  omega

theorem within_body : 7926 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 7731 7926 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 7731 7926 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 7731 7926 address = observedPair address :=
  cachedPair_eq cache 7731 7926 checked address

end SourceCache304Pilot
open LookupCachePilot
namespace SourceCache305Pilot
theorem checked_7926_70 : validate cache_7926_70 7926 =
    some 7996 := by
  decide +kernel

theorem checked : validate cache 7926 = some 7996 := checked_7926_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 7926 7996 checked
  omega

theorem within_body : 7996 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 7926 7996 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 7926 7996 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 7926 7996 address = observedPair address :=
  cachedPair_eq cache 7926 7996 checked address

end SourceCache305Pilot
open LookupCachePilot
namespace SourceCache306Pilot
theorem checked_7996_200 : validate cache_7996_200 7996 =
    some 8196 := by
  decide +kernel
theorem checked_8196_200 : validate cache_8196_200 8196 =
    some 8396 := by
  decide +kernel
theorem checked_7996_400 : validate cache_7996_400 7996 =
    some 8396 := by
  exact validate_branch 200 cache_7996_200 cache_8196_200
    7996 8196 8396
    checked_7996_200 rfl checked_8196_200

theorem checked : validate cache 7996 = some 8396 := checked_7996_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 7996 8396 checked
  omega

theorem within_body : 8396 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 7996 8396 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 7996 8396 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 7996 8396 address = observedPair address :=
  cachedPair_eq cache 7996 8396 checked address

end SourceCache306Pilot
open LookupCachePilot
namespace SourceCache307Pilot
theorem checked_8396_5 : validate cache_8396_5 8396 =
    some 8401 := by
  decide +kernel

theorem checked : validate cache 8396 = some 8401 := checked_8396_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 8396 8401 checked
  omega

theorem within_body : 8401 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 8396 8401 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 8396 8401 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 8396 8401 address = observedPair address :=
  cachedPair_eq cache 8396 8401 checked address

end SourceCache307Pilot
open LookupCachePilot
namespace SourceCache308Pilot
theorem checked_8401_70 : validate cache_8401_70 8401 =
    some 8471 := by
  decide +kernel

theorem checked : validate cache 8401 = some 8471 := checked_8401_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 8401 8471 checked
  omega

theorem within_body : 8471 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 8401 8471 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 8401 8471 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 8401 8471 address = observedPair address :=
  cachedPair_eq cache 8401 8471 checked address

end SourceCache308Pilot
open LookupCachePilot
namespace SourceCache309Pilot
theorem checked_8471_185 : validate cache_8471_185 8471 =
    some 8656 := by
  decide +kernel
theorem checked_8656_185 : validate cache_8656_185 8656 =
    some 8841 := by
  decide +kernel
theorem checked_8471_370 : validate cache_8471_370 8471 =
    some 8841 := by
  exact validate_branch 185 cache_8471_185 cache_8656_185
    8471 8656 8841
    checked_8471_185 rfl checked_8656_185

theorem checked : validate cache 8471 = some 8841 := checked_8471_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 8471 8841 checked
  omega

theorem within_body : 8841 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 8471 8841 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 8471 8841 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 8471 8841 address = observedPair address :=
  cachedPair_eq cache 8471 8841 checked address

end SourceCache309Pilot
open LookupCachePilot
namespace SourceCache310Pilot
theorem checked_8841_5 : validate cache_8841_5 8841 =
    some 8846 := by
  decide +kernel

theorem checked : validate cache 8841 = some 8846 := checked_8841_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 8841 8846 checked
  omega

theorem within_body : 8846 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 8841 8846 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 8841 8846 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 8841 8846 address = observedPair address :=
  cachedPair_eq cache 8841 8846 checked address

end SourceCache310Pilot
open LookupCachePilot
namespace SourceCache311Pilot
theorem checked_8846_70 : validate cache_8846_70 8846 =
    some 8916 := by
  decide +kernel

theorem checked : validate cache 8846 = some 8916 := checked_8846_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 8846 8916 checked
  omega

theorem within_body : 8916 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 8846 8916 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 8846 8916 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 8846 8916 address = observedPair address :=
  cachedPair_eq cache 8846 8916 checked address

end SourceCache311Pilot
open LookupCachePilot
namespace SourceCache312Pilot
theorem checked_8916_200 : validate cache_8916_200 8916 =
    some 9116 := by
  decide +kernel
theorem checked_9116_200 : validate cache_9116_200 9116 =
    some 9316 := by
  decide +kernel
theorem checked_8916_400 : validate cache_8916_400 8916 =
    some 9316 := by
  exact validate_branch 200 cache_8916_200 cache_9116_200
    8916 9116 9316
    checked_8916_200 rfl checked_9116_200

theorem checked : validate cache 8916 = some 9316 := checked_8916_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 8916 9316 checked
  omega

theorem within_body : 9316 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 8916 9316 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 8916 9316 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 8916 9316 address = observedPair address :=
  cachedPair_eq cache 8916 9316 checked address

end SourceCache312Pilot
open LookupCachePilot
namespace SourceCache313Pilot
theorem checked_9316_5 : validate cache_9316_5 9316 =
    some 9321 := by
  decide +kernel

theorem checked : validate cache 9316 = some 9321 := checked_9316_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 9316 9321 checked
  omega

theorem within_body : 9321 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 9316 9321 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 9316 9321 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 9316 9321 address = observedPair address :=
  cachedPair_eq cache 9316 9321 checked address

end SourceCache313Pilot
open LookupCachePilot
namespace SourceCache314Pilot
theorem checked_9321_10 : validate cache_9321_10 9321 =
    some 9331 := by
  decide +kernel

theorem checked : validate cache 9321 = some 9331 := checked_9321_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 9321 9331 checked
  omega

theorem within_body : 9331 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 9321 9331 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 9321 9331 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 9321 9331 address = observedPair address :=
  cachedPair_eq cache 9321 9331 checked address

end SourceCache314Pilot
open LookupCachePilot
namespace SourceCache315Pilot
theorem checked_9331_220 : validate cache_9331_220 9331 =
    some 9551 := by
  decide +kernel

theorem checked : validate cache 9331 = some 9551 := checked_9331_220

theorem count_exact : cache.count = 220 := by
  have extent := validate_extent cache 9331 9551 checked
  omega

theorem within_body : 9551 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 9331 9551 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 9331 9551 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 9331 9551 address = observedPair address :=
  cachedPair_eq cache 9331 9551 checked address

end SourceCache315Pilot
open LookupCachePilot
namespace SourceCache316Pilot
theorem checked_9551_152 : validate cache_9551_152 9551 =
    some 9703 := by
  decide +kernel
theorem checked_9703_153 : validate cache_9703_153 9703 =
    some 9856 := by
  decide +kernel
theorem checked_9551_305 : validate cache_9551_305 9551 =
    some 9856 := by
  exact validate_branch 152 cache_9551_152 cache_9703_153
    9551 9703 9856
    checked_9551_152 rfl checked_9703_153

theorem checked : validate cache 9551 = some 9856 := checked_9551_305

theorem count_exact : cache.count = 305 := by
  have extent := validate_extent cache 9551 9856 checked
  omega

theorem within_body : 9856 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 9551 9856 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 9551 9856 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 9551 9856 address = observedPair address :=
  cachedPair_eq cache 9551 9856 checked address

end SourceCache316Pilot
open LookupCachePilot
namespace SourceCache317Pilot
theorem checked_9856_70 : validate cache_9856_70 9856 =
    some 9926 := by
  decide +kernel

theorem checked : validate cache 9856 = some 9926 := checked_9856_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 9856 9926 checked
  omega

theorem within_body : 9926 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 9856 9926 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 9856 9926 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 9856 9926 address = observedPair address :=
  cachedPair_eq cache 9856 9926 checked address

end SourceCache317Pilot
open LookupCachePilot
namespace SourceCache318Pilot
theorem checked_9926_195 : validate cache_9926_195 9926 =
    some 10121 := by
  decide +kernel

theorem checked : validate cache 9926 = some 10121 := checked_9926_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 9926 10121 checked
  omega

theorem within_body : 10121 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 9926 10121 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 9926 10121 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 9926 10121 address = observedPair address :=
  cachedPair_eq cache 9926 10121 checked address

end SourceCache318Pilot
open LookupCachePilot
namespace SourceCache319Pilot
theorem checked_10121_70 : validate cache_10121_70 10121 =
    some 10191 := by
  decide +kernel

theorem checked : validate cache 10121 = some 10191 := checked_10121_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 10121 10191 checked
  omega

theorem within_body : 10191 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 10121 10191 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 10121 10191 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 10121 10191 address = observedPair address :=
  cachedPair_eq cache 10121 10191 checked address

end SourceCache319Pilot
open LookupCachePilot
namespace SourceCache320Pilot
theorem checked_10191_132 : validate cache_10191_132 10191 =
    some 10323 := by
  decide +kernel
theorem checked_10323_133 : validate cache_10323_133 10323 =
    some 10456 := by
  decide +kernel
theorem checked_10191_265 : validate cache_10191_265 10191 =
    some 10456 := by
  exact validate_branch 132 cache_10191_132 cache_10323_133
    10191 10323 10456
    checked_10191_132 rfl checked_10323_133

theorem checked : validate cache 10191 = some 10456 := checked_10191_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 10191 10456 checked
  omega

theorem within_body : 10456 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 10191 10456 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 10191 10456 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 10191 10456 address = observedPair address :=
  cachedPair_eq cache 10191 10456 checked address

end SourceCache320Pilot
open LookupCachePilot
namespace SourceCache321Pilot
theorem checked_10456_5 : validate cache_10456_5 10456 =
    some 10461 := by
  decide +kernel

theorem checked : validate cache 10456 = some 10461 := checked_10456_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 10456 10461 checked
  omega

theorem within_body : 10461 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 10456 10461 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 10456 10461 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 10456 10461 address = observedPair address :=
  cachedPair_eq cache 10456 10461 checked address

end SourceCache321Pilot
open LookupCachePilot
namespace SourceCache322Pilot
theorem checked_10461_70 : validate cache_10461_70 10461 =
    some 10531 := by
  decide +kernel

theorem checked : validate cache 10461 = some 10531 := checked_10461_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 10461 10531 checked
  omega

theorem within_body : 10531 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 10461 10531 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 10461 10531 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 10461 10531 address = observedPair address :=
  cachedPair_eq cache 10461 10531 checked address

end SourceCache322Pilot
open LookupCachePilot
namespace SourceCache323Pilot
theorem checked_10531_220 : validate cache_10531_220 10531 =
    some 10751 := by
  decide +kernel

theorem checked : validate cache 10531 = some 10751 := checked_10531_220

theorem count_exact : cache.count = 220 := by
  have extent := validate_extent cache 10531 10751 checked
  omega

theorem within_body : 10751 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 10531 10751 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 10531 10751 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 10531 10751 address = observedPair address :=
  cachedPair_eq cache 10531 10751 checked address

end SourceCache323Pilot
open LookupCachePilot
namespace SourceCache324Pilot
theorem checked_10751_70 : validate cache_10751_70 10751 =
    some 10821 := by
  decide +kernel

theorem checked : validate cache 10751 = some 10821 := checked_10751_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 10751 10821 checked
  omega

theorem within_body : 10821 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 10751 10821 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 10751 10821 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 10751 10821 address = observedPair address :=
  cachedPair_eq cache 10751 10821 checked address

end SourceCache324Pilot
open LookupCachePilot
namespace SourceCache325Pilot
theorem checked_10821_132 : validate cache_10821_132 10821 =
    some 10953 := by
  decide +kernel
theorem checked_10953_133 : validate cache_10953_133 10953 =
    some 11086 := by
  decide +kernel
theorem checked_10821_265 : validate cache_10821_265 10821 =
    some 11086 := by
  exact validate_branch 132 cache_10821_132 cache_10953_133
    10821 10953 11086
    checked_10821_132 rfl checked_10953_133

theorem checked : validate cache 10821 = some 11086 := checked_10821_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 10821 11086 checked
  omega

theorem within_body : 11086 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 10821 11086 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 10821 11086 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 10821 11086 address = observedPair address :=
  cachedPair_eq cache 10821 11086 checked address

end SourceCache325Pilot
open LookupCachePilot
namespace SourceCache326Pilot
theorem checked_11086_130 : validate cache_11086_130 11086 =
    some 11216 := by
  decide +kernel
theorem checked_11216_130 : validate cache_11216_130 11216 =
    some 11346 := by
  decide +kernel
theorem checked_11086_260 : validate cache_11086_260 11086 =
    some 11346 := by
  exact validate_branch 130 cache_11086_130 cache_11216_130
    11086 11216 11346
    checked_11086_130 rfl checked_11216_130
theorem checked_11346_130 : validate cache_11346_130 11346 =
    some 11476 := by
  decide +kernel
theorem checked_11476_130 : validate cache_11476_130 11476 =
    some 11606 := by
  decide +kernel
theorem checked_11346_260 : validate cache_11346_260 11346 =
    some 11606 := by
  exact validate_branch 130 cache_11346_130 cache_11476_130
    11346 11476 11606
    checked_11346_130 rfl checked_11476_130
theorem checked_11086_520 : validate cache_11086_520 11086 =
    some 11606 := by
  exact validate_branch 260 cache_11086_260 cache_11346_260
    11086 11346 11606
    checked_11086_260 rfl checked_11346_260

theorem checked : validate cache 11086 = some 11606 := checked_11086_520

theorem count_exact : cache.count = 520 := by
  have extent := validate_extent cache 11086 11606 checked
  omega

theorem within_body : 11606 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 11086 11606 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 11086 11606 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 11086 11606 address = observedPair address :=
  cachedPair_eq cache 11086 11606 checked address

end SourceCache326Pilot
open LookupCachePilot
namespace SourceCache327Pilot
theorem checked_11606_5 : validate cache_11606_5 11606 =
    some 11611 := by
  decide +kernel

theorem checked : validate cache 11606 = some 11611 := checked_11606_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 11606 11611 checked
  omega

theorem within_body : 11611 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 11606 11611 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 11606 11611 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 11606 11611 address = observedPair address :=
  cachedPair_eq cache 11606 11611 checked address

end SourceCache327Pilot
open LookupCachePilot
namespace SourceCache328Pilot
theorem checked_11611_70 : validate cache_11611_70 11611 =
    some 11681 := by
  decide +kernel

theorem checked : validate cache 11611 = some 11681 := checked_11611_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 11611 11681 checked
  omega

theorem within_body : 11681 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 11611 11681 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 11611 11681 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 11611 11681 address = observedPair address :=
  cachedPair_eq cache 11611 11681 checked address

end SourceCache328Pilot
open LookupCachePilot
namespace SourceCache329Pilot
theorem checked_11681_133 : validate cache_11681_133 11681 =
    some 11814 := by
  decide +kernel
theorem checked_11814_134 : validate cache_11814_134 11814 =
    some 11948 := by
  decide +kernel
theorem checked_11681_267 : validate cache_11681_267 11681 =
    some 11948 := by
  exact validate_branch 133 cache_11681_133 cache_11814_134
    11681 11814 11948
    checked_11681_133 rfl checked_11814_134
theorem checked_11948_134 : validate cache_11948_134 11948 =
    some 12082 := by
  decide +kernel
theorem checked_12082_134 : validate cache_12082_134 12082 =
    some 12216 := by
  decide +kernel
theorem checked_11948_268 : validate cache_11948_268 11948 =
    some 12216 := by
  exact validate_branch 134 cache_11948_134 cache_12082_134
    11948 12082 12216
    checked_11948_134 rfl checked_12082_134
theorem checked_11681_535 : validate cache_11681_535 11681 =
    some 12216 := by
  exact validate_branch 267 cache_11681_267 cache_11948_268
    11681 11948 12216
    checked_11681_267 rfl checked_11948_268

theorem checked : validate cache 11681 = some 12216 := checked_11681_535

theorem count_exact : cache.count = 535 := by
  have extent := validate_extent cache 11681 12216 checked
  omega

theorem within_body : 12216 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 11681 12216 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 11681 12216 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 11681 12216 address = observedPair address :=
  cachedPair_eq cache 11681 12216 checked address

end SourceCache329Pilot
open LookupCachePilot
namespace SourceCache330Pilot
theorem checked_12216_5 : validate cache_12216_5 12216 =
    some 12221 := by
  decide +kernel

theorem checked : validate cache 12216 = some 12221 := checked_12216_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 12216 12221 checked
  omega

theorem within_body : 12221 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 12216 12221 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 12216 12221 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 12216 12221 address = observedPair address :=
  cachedPair_eq cache 12216 12221 checked address

end SourceCache330Pilot
open LookupCachePilot
namespace SourceCache331Pilot
theorem checked_12221_10 : validate cache_12221_10 12221 =
    some 12231 := by
  decide +kernel

theorem checked : validate cache 12221 = some 12231 := checked_12221_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 12221 12231 checked
  omega

theorem within_body : 12231 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 12221 12231 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 12221 12231 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 12221 12231 address = observedPair address :=
  cachedPair_eq cache 12221 12231 checked address

end SourceCache331Pilot
open LookupCachePilot
namespace SourceCache332Pilot
theorem checked_12231_185 : validate cache_12231_185 12231 =
    some 12416 := by
  decide +kernel
theorem checked_12416_185 : validate cache_12416_185 12416 =
    some 12601 := by
  decide +kernel
theorem checked_12231_370 : validate cache_12231_370 12231 =
    some 12601 := by
  exact validate_branch 185 cache_12231_185 cache_12416_185
    12231 12416 12601
    checked_12231_185 rfl checked_12416_185

theorem checked : validate cache 12231 = some 12601 := checked_12231_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 12231 12601 checked
  omega

theorem within_body : 12601 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 12231 12601 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 12231 12601 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 12231 12601 address = observedPair address :=
  cachedPair_eq cache 12231 12601 checked address

end SourceCache332Pilot
open LookupCachePilot
namespace SourceCache333Pilot
theorem checked_12601_220 : validate cache_12601_220 12601 =
    some 12821 := by
  decide +kernel
theorem checked_12821_220 : validate cache_12821_220 12821 =
    some 13041 := by
  decide +kernel
theorem checked_12601_440 : validate cache_12601_440 12601 =
    some 13041 := by
  exact validate_branch 220 cache_12601_220 cache_12821_220
    12601 12821 13041
    checked_12601_220 rfl checked_12821_220

theorem checked : validate cache 12601 = some 13041 := checked_12601_440

theorem count_exact : cache.count = 440 := by
  have extent := validate_extent cache 12601 13041 checked
  omega

theorem within_body : 13041 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 12601 13041 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 12601 13041 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 12601 13041 address = observedPair address :=
  cachedPair_eq cache 12601 13041 checked address

end SourceCache333Pilot
open LookupCachePilot
namespace SourceCache334Pilot
theorem checked_13041_70 : validate cache_13041_70 13041 =
    some 13111 := by
  decide +kernel

theorem checked : validate cache 13041 = some 13111 := checked_13041_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 13041 13111 checked
  omega

theorem within_body : 13111 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 13041 13111 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 13041 13111 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 13041 13111 address = observedPair address :=
  cachedPair_eq cache 13041 13111 checked address

end SourceCache334Pilot
open LookupCachePilot
namespace SourceCache335Pilot
theorem checked_13111_195 : validate cache_13111_195 13111 =
    some 13306 := by
  decide +kernel

theorem checked : validate cache 13111 = some 13306 := checked_13111_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 13111 13306 checked
  omega

theorem within_body : 13306 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 13111 13306 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 13111 13306 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 13111 13306 address = observedPair address :=
  cachedPair_eq cache 13111 13306 checked address

end SourceCache335Pilot
open LookupCachePilot
namespace SourceCache336Pilot
theorem checked_13306_70 : validate cache_13306_70 13306 =
    some 13376 := by
  decide +kernel

theorem checked : validate cache 13306 = some 13376 := checked_13306_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 13306 13376 checked
  omega

theorem within_body : 13376 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 13306 13376 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 13306 13376 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 13306 13376 address = observedPair address :=
  cachedPair_eq cache 13306 13376 checked address

end SourceCache336Pilot
open LookupCachePilot
namespace SourceCache337Pilot
theorem checked_13376_200 : validate cache_13376_200 13376 =
    some 13576 := by
  decide +kernel
theorem checked_13576_200 : validate cache_13576_200 13576 =
    some 13776 := by
  decide +kernel
theorem checked_13376_400 : validate cache_13376_400 13376 =
    some 13776 := by
  exact validate_branch 200 cache_13376_200 cache_13576_200
    13376 13576 13776
    checked_13376_200 rfl checked_13576_200

theorem checked : validate cache 13376 = some 13776 := checked_13376_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 13376 13776 checked
  omega

theorem within_body : 13776 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 13376 13776 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 13376 13776 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 13376 13776 address = observedPair address :=
  cachedPair_eq cache 13376 13776 checked address

end SourceCache337Pilot
open LookupCachePilot
namespace SourceCache338Pilot
theorem checked_13776_5 : validate cache_13776_5 13776 =
    some 13781 := by
  decide +kernel

theorem checked : validate cache 13776 = some 13781 := checked_13776_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 13776 13781 checked
  omega

theorem within_body : 13781 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 13776 13781 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 13776 13781 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 13776 13781 address = observedPair address :=
  cachedPair_eq cache 13776 13781 checked address

end SourceCache338Pilot
open LookupCachePilot
namespace SourceCache339Pilot
theorem checked_13781_10 : validate cache_13781_10 13781 =
    some 13791 := by
  decide +kernel

theorem checked : validate cache 13781 = some 13791 := checked_13781_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 13781 13791 checked
  omega

theorem within_body : 13791 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 13781 13791 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 13781 13791 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 13781 13791 address = observedPair address :=
  cachedPair_eq cache 13781 13791 checked address

end SourceCache339Pilot
open LookupCachePilot
namespace SourceCache340Pilot
theorem checked_13791_220 : validate cache_13791_220 13791 =
    some 14011 := by
  decide +kernel

theorem checked : validate cache 13791 = some 14011 := checked_13791_220

theorem count_exact : cache.count = 220 := by
  have extent := validate_extent cache 13791 14011 checked
  omega

theorem within_body : 14011 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 13791 14011 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 13791 14011 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 13791 14011 address = observedPair address :=
  cachedPair_eq cache 13791 14011 checked address

end SourceCache340Pilot
open LookupCachePilot
namespace SourceCache341Pilot
theorem checked_14011_152 : validate cache_14011_152 14011 =
    some 14163 := by
  decide +kernel
theorem checked_14163_153 : validate cache_14163_153 14163 =
    some 14316 := by
  decide +kernel
theorem checked_14011_305 : validate cache_14011_305 14011 =
    some 14316 := by
  exact validate_branch 152 cache_14011_152 cache_14163_153
    14011 14163 14316
    checked_14011_152 rfl checked_14163_153

theorem checked : validate cache 14011 = some 14316 := checked_14011_305

theorem count_exact : cache.count = 305 := by
  have extent := validate_extent cache 14011 14316 checked
  omega

theorem within_body : 14316 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 14011 14316 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 14011 14316 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 14011 14316 address = observedPair address :=
  cachedPair_eq cache 14011 14316 checked address

end SourceCache341Pilot
open LookupCachePilot
namespace SourceCache342Pilot
theorem checked_14316_70 : validate cache_14316_70 14316 =
    some 14386 := by
  decide +kernel

theorem checked : validate cache 14316 = some 14386 := checked_14316_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 14316 14386 checked
  omega

theorem within_body : 14386 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 14316 14386 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 14316 14386 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 14316 14386 address = observedPair address :=
  cachedPair_eq cache 14316 14386 checked address

end SourceCache342Pilot
open LookupCachePilot
namespace SourceCache343Pilot
theorem checked_14386_195 : validate cache_14386_195 14386 =
    some 14581 := by
  decide +kernel

theorem checked : validate cache 14386 = some 14581 := checked_14386_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 14386 14581 checked
  omega

theorem within_body : 14581 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 14386 14581 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 14386 14581 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 14386 14581 address = observedPair address :=
  cachedPair_eq cache 14386 14581 checked address

end SourceCache343Pilot
open LookupCachePilot
namespace SourceCache344Pilot
theorem checked_14581_70 : validate cache_14581_70 14581 =
    some 14651 := by
  decide +kernel

theorem checked : validate cache 14581 = some 14651 := checked_14581_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 14581 14651 checked
  omega

theorem within_body : 14651 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 14581 14651 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 14581 14651 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 14581 14651 address = observedPair address :=
  cachedPair_eq cache 14581 14651 checked address

end SourceCache344Pilot
open LookupCachePilot
namespace SourceCache345Pilot
theorem checked_14651_132 : validate cache_14651_132 14651 =
    some 14783 := by
  decide +kernel
theorem checked_14783_133 : validate cache_14783_133 14783 =
    some 14916 := by
  decide +kernel
theorem checked_14651_265 : validate cache_14651_265 14651 =
    some 14916 := by
  exact validate_branch 132 cache_14651_132 cache_14783_133
    14651 14783 14916
    checked_14651_132 rfl checked_14783_133

theorem checked : validate cache 14651 = some 14916 := checked_14651_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 14651 14916 checked
  omega

theorem within_body : 14916 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 14651 14916 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 14651 14916 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 14651 14916 address = observedPair address :=
  cachedPair_eq cache 14651 14916 checked address

end SourceCache345Pilot
open LookupCachePilot
namespace SourceCache346Pilot
theorem checked_14916_5 : validate cache_14916_5 14916 =
    some 14921 := by
  decide +kernel

theorem checked : validate cache 14916 = some 14921 := checked_14916_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 14916 14921 checked
  omega

theorem within_body : 14921 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 14916 14921 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 14916 14921 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 14916 14921 address = observedPair address :=
  cachedPair_eq cache 14916 14921 checked address

end SourceCache346Pilot
open LookupCachePilot
namespace SourceCache347Pilot
theorem checked_14921_70 : validate cache_14921_70 14921 =
    some 14991 := by
  decide +kernel

theorem checked : validate cache 14921 = some 14991 := checked_14921_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 14921 14991 checked
  omega

theorem within_body : 14991 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 14921 14991 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 14921 14991 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 14921 14991 address = observedPair address :=
  cachedPair_eq cache 14921 14991 checked address

end SourceCache347Pilot
open LookupCachePilot
namespace SourceCache348Pilot
theorem checked_14991_185 : validate cache_14991_185 14991 =
    some 15176 := by
  decide +kernel
theorem checked_15176_185 : validate cache_15176_185 15176 =
    some 15361 := by
  decide +kernel
theorem checked_14991_370 : validate cache_14991_370 14991 =
    some 15361 := by
  exact validate_branch 185 cache_14991_185 cache_15176_185
    14991 15176 15361
    checked_14991_185 rfl checked_15176_185

theorem checked : validate cache 14991 = some 15361 := checked_14991_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 14991 15361 checked
  omega

theorem within_body : 15361 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 14991 15361 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 14991 15361 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 14991 15361 address = observedPair address :=
  cachedPair_eq cache 14991 15361 checked address

end SourceCache348Pilot
open LookupCachePilot
namespace SourceCache349Pilot
theorem checked_15361_5 : validate cache_15361_5 15361 =
    some 15366 := by
  decide +kernel

theorem checked : validate cache 15361 = some 15366 := checked_15361_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 15361 15366 checked
  omega

theorem within_body : 15366 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 15361 15366 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 15361 15366 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 15361 15366 address = observedPair address :=
  cachedPair_eq cache 15361 15366 checked address

end SourceCache349Pilot
open LookupCachePilot
namespace SourceCache350Pilot
theorem checked_15366_70 : validate cache_15366_70 15366 =
    some 15436 := by
  decide +kernel

theorem checked : validate cache 15366 = some 15436 := checked_15366_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 15366 15436 checked
  omega

theorem within_body : 15436 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 15366 15436 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 15366 15436 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 15366 15436 address = observedPair address :=
  cachedPair_eq cache 15366 15436 checked address

end SourceCache350Pilot
open LookupCachePilot
namespace SourceCache351Pilot
theorem checked_15436_200 : validate cache_15436_200 15436 =
    some 15636 := by
  decide +kernel
theorem checked_15636_200 : validate cache_15636_200 15636 =
    some 15836 := by
  decide +kernel
theorem checked_15436_400 : validate cache_15436_400 15436 =
    some 15836 := by
  exact validate_branch 200 cache_15436_200 cache_15636_200
    15436 15636 15836
    checked_15436_200 rfl checked_15636_200

theorem checked : validate cache 15436 = some 15836 := checked_15436_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 15436 15836 checked
  omega

theorem within_body : 15836 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 15436 15836 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 15436 15836 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 15436 15836 address = observedPair address :=
  cachedPair_eq cache 15436 15836 checked address

end SourceCache351Pilot
open LookupCachePilot
namespace SourceCache352Pilot
theorem checked_15836_5 : validate cache_15836_5 15836 =
    some 15841 := by
  decide +kernel

theorem checked : validate cache 15836 = some 15841 := checked_15836_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 15836 15841 checked
  omega

theorem within_body : 15841 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 15836 15841 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 15836 15841 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 15836 15841 address = observedPair address :=
  cachedPair_eq cache 15836 15841 checked address

end SourceCache352Pilot
open LookupCachePilot
namespace SourceCache353Pilot
theorem checked_15841_10 : validate cache_15841_10 15841 =
    some 15851 := by
  decide +kernel

theorem checked : validate cache 15841 = some 15851 := checked_15841_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 15841 15851 checked
  omega

theorem within_body : 15851 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 15841 15851 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 15841 15851 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 15841 15851 address = observedPair address :=
  cachedPair_eq cache 15841 15851 checked address

end SourceCache353Pilot
open LookupCachePilot
namespace SourceCache354Pilot
theorem checked_15851_167 : validate cache_15851_167 15851 =
    some 16018 := by
  decide +kernel
theorem checked_16018_168 : validate cache_16018_168 16018 =
    some 16186 := by
  decide +kernel
theorem checked_15851_335 : validate cache_15851_335 15851 =
    some 16186 := by
  exact validate_branch 167 cache_15851_167 cache_16018_168
    15851 16018 16186
    checked_15851_167 rfl checked_16018_168
theorem checked_16186_167 : validate cache_16186_167 16186 =
    some 16353 := by
  decide +kernel
theorem checked_16353_168 : validate cache_16353_168 16353 =
    some 16521 := by
  decide +kernel
theorem checked_16186_335 : validate cache_16186_335 16186 =
    some 16521 := by
  exact validate_branch 167 cache_16186_167 cache_16353_168
    16186 16353 16521
    checked_16186_167 rfl checked_16353_168
theorem checked_15851_670 : validate cache_15851_670 15851 =
    some 16521 := by
  exact validate_branch 335 cache_15851_335 cache_16186_335
    15851 16186 16521
    checked_15851_335 rfl checked_16186_335

theorem checked : validate cache 15851 = some 16521 := checked_15851_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 15851 16521 checked
  omega

theorem within_body : 16521 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 15851 16521 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 15851 16521 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 15851 16521 address = observedPair address :=
  cachedPair_eq cache 15851 16521 checked address

end SourceCache354Pilot
open LookupCachePilot
namespace SourceCache355Pilot
theorem checked_16521_177 : validate cache_16521_177 16521 =
    some 16698 := by
  decide +kernel
theorem checked_16698_178 : validate cache_16698_178 16698 =
    some 16876 := by
  decide +kernel
theorem checked_16521_355 : validate cache_16521_355 16521 =
    some 16876 := by
  exact validate_branch 177 cache_16521_177 cache_16698_178
    16521 16698 16876
    checked_16521_177 rfl checked_16698_178
theorem checked_16876_177 : validate cache_16876_177 16876 =
    some 17053 := by
  decide +kernel
theorem checked_17053_178 : validate cache_17053_178 17053 =
    some 17231 := by
  decide +kernel
theorem checked_16876_355 : validate cache_16876_355 16876 =
    some 17231 := by
  exact validate_branch 177 cache_16876_177 cache_17053_178
    16876 17053 17231
    checked_16876_177 rfl checked_17053_178
theorem checked_16521_710 : validate cache_16521_710 16521 =
    some 17231 := by
  exact validate_branch 355 cache_16521_355 cache_16876_355
    16521 16876 17231
    checked_16521_355 rfl checked_16876_355

theorem checked : validate cache 16521 = some 17231 := checked_16521_710

theorem count_exact : cache.count = 710 := by
  have extent := validate_extent cache 16521 17231 checked
  omega

theorem within_body : 17231 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 16521 17231 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 16521 17231 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 16521 17231 address = observedPair address :=
  cachedPair_eq cache 16521 17231 checked address

end SourceCache355Pilot
open LookupCachePilot
namespace SourceCache356Pilot
theorem checked_17231_70 : validate cache_17231_70 17231 =
    some 17301 := by
  decide +kernel

theorem checked : validate cache 17231 = some 17301 := checked_17231_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 17231 17301 checked
  omega

theorem within_body : 17301 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 17231 17301 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 17231 17301 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 17231 17301 address = observedPair address :=
  cachedPair_eq cache 17231 17301 checked address

end SourceCache356Pilot
open LookupCachePilot
namespace SourceCache357Pilot
theorem checked_17301_195 : validate cache_17301_195 17301 =
    some 17496 := by
  decide +kernel

theorem checked : validate cache 17301 = some 17496 := checked_17301_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 17301 17496 checked
  omega

theorem within_body : 17496 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 17301 17496 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 17301 17496 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 17301 17496 address = observedPair address :=
  cachedPair_eq cache 17301 17496 checked address

end SourceCache357Pilot
open LookupCachePilot
namespace SourceCache358Pilot
theorem checked_17496_70 : validate cache_17496_70 17496 =
    some 17566 := by
  decide +kernel

theorem checked : validate cache 17496 = some 17566 := checked_17496_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 17496 17566 checked
  omega

theorem within_body : 17566 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 17496 17566 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 17496 17566 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 17496 17566 address = observedPair address :=
  cachedPair_eq cache 17496 17566 checked address

end SourceCache358Pilot
namespace ScopeViews002Pilot
noncomputable def fromRaw_256 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache256Pilot.cache 1726 1741)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache256Pilot.cache
    1726 1741 SourceCache256Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_257 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache257Pilot.cache 1741 1746)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache257Pilot.cache
    1741 1746 SourceCache257Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_258 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache258Pilot.cache 1746 1751)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache258Pilot.cache
    1746 1751 SourceCache258Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_259 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache259Pilot.cache 1751 1756)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache259Pilot.cache
    1751 1756 SourceCache259Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_260 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache260Pilot.cache 1756 1771)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache260Pilot.cache
    1756 1771 SourceCache260Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_261 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache261Pilot.cache 1771 1776)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache261Pilot.cache
    1771 1776 SourceCache261Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_262 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache262Pilot.cache 1776 1791)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache262Pilot.cache
    1776 1791 SourceCache262Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_263 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache263Pilot.cache 1791 1796)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache263Pilot.cache
    1791 1796 SourceCache263Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_264 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache264Pilot.cache 1796 1801)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache264Pilot.cache
    1796 1801 SourceCache264Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_265 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache265Pilot.cache 1801 1806)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache265Pilot.cache
    1801 1806 SourceCache265Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_266 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache266Pilot.cache 1806 1821)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache266Pilot.cache
    1806 1821 SourceCache266Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_267 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache267Pilot.cache 1821 1826)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache267Pilot.cache
    1821 1826 SourceCache267Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_268 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache268Pilot.cache 1826 1831)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache268Pilot.cache
    1826 1831 SourceCache268Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_269 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache269Pilot.cache 1831 1836)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache269Pilot.cache
    1831 1836 SourceCache269Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_270 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache270Pilot.cache 1836 1841)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache270Pilot.cache
    1836 1841 SourceCache270Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_271 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache271Pilot.cache 1841 1846)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache271Pilot.cache
    1841 1846 SourceCache271Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_272 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache272Pilot.cache 1846 1851)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache272Pilot.cache
    1846 1851 SourceCache272Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_273 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache273Pilot.cache 1851 1856)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache273Pilot.cache
    1851 1856 SourceCache273Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_274 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache274Pilot.cache 1856 1871)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache274Pilot.cache
    1856 1871 SourceCache274Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_275 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache275Pilot.cache 1871 1876)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache275Pilot.cache
    1871 1876 SourceCache275Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_276 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache276Pilot.cache 1876 1881)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache276Pilot.cache
    1876 1881 SourceCache276Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_277 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache277Pilot.cache 1881 1951)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache277Pilot.cache
    1881 1951 SourceCache277Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_278 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache278Pilot.cache 1951 2321)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache278Pilot.cache
    1951 2321 SourceCache278Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_279 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache279Pilot.cache 2321 2326)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache279Pilot.cache
    2321 2326 SourceCache279Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_280 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache280Pilot.cache 2326 2396)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache280Pilot.cache
    2326 2396 SourceCache280Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_281 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache281Pilot.cache 2396 2796)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache281Pilot.cache
    2396 2796 SourceCache281Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_282 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache282Pilot.cache 2796 2801)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache282Pilot.cache
    2796 2801 SourceCache282Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_283 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache283Pilot.cache 2801 2811)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache283Pilot.cache
    2801 2811 SourceCache283Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_284 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache284Pilot.cache 2811 3031)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache284Pilot.cache
    2811 3031 SourceCache284Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_285 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache285Pilot.cache 3031 3336)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache285Pilot.cache
    3031 3336 SourceCache285Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_286 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache286Pilot.cache 3336 3406)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache286Pilot.cache
    3336 3406 SourceCache286Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_287 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache287Pilot.cache 3406 3601)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache287Pilot.cache
    3406 3601 SourceCache287Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_288 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache288Pilot.cache 3601 3671)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache288Pilot.cache
    3601 3671 SourceCache288Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_289 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache289Pilot.cache 3671 3936)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache289Pilot.cache
    3671 3936 SourceCache289Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_290 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache290Pilot.cache 3936 3941)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache290Pilot.cache
    3936 3941 SourceCache290Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_291 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache291Pilot.cache 3941 4011)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache291Pilot.cache
    3941 4011 SourceCache291Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_292 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache292Pilot.cache 4011 4681)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache292Pilot.cache
    4011 4681 SourceCache292Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_293 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache293Pilot.cache 4681 4751)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache293Pilot.cache
    4681 4751 SourceCache293Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_294 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache294Pilot.cache 4751 5421)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache294Pilot.cache
    4751 5421 SourceCache294Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_295 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache295Pilot.cache 5421 6091)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache295Pilot.cache
    5421 6091 SourceCache295Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_296 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache296Pilot.cache 6091 6096)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache296Pilot.cache
    6091 6096 SourceCache296Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_297 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache297Pilot.cache 6096 6166)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache297Pilot.cache
    6096 6166 SourceCache297Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_298 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache298Pilot.cache 6166 6836)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache298Pilot.cache
    6166 6836 SourceCache298Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_299 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache299Pilot.cache 6836 6841)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache299Pilot.cache
    6836 6841 SourceCache299Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_300 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache300Pilot.cache 6841 6851)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache300Pilot.cache
    6841 6851 SourceCache300Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_301 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache301Pilot.cache 6851 7221)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache301Pilot.cache
    6851 7221 SourceCache301Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_302 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache302Pilot.cache 7221 7661)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache302Pilot.cache
    7221 7661 SourceCache302Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_303 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache303Pilot.cache 7661 7731)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache303Pilot.cache
    7661 7731 SourceCache303Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_304 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache304Pilot.cache 7731 7926)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache304Pilot.cache
    7731 7926 SourceCache304Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_305 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache305Pilot.cache 7926 7996)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache305Pilot.cache
    7926 7996 SourceCache305Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_306 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache306Pilot.cache 7996 8396)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache306Pilot.cache
    7996 8396 SourceCache306Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_307 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache307Pilot.cache 8396 8401)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache307Pilot.cache
    8396 8401 SourceCache307Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_308 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache308Pilot.cache 8401 8471)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache308Pilot.cache
    8401 8471 SourceCache308Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_309 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache309Pilot.cache 8471 8841)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache309Pilot.cache
    8471 8841 SourceCache309Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_310 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache310Pilot.cache 8841 8846)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache310Pilot.cache
    8841 8846 SourceCache310Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_311 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache311Pilot.cache 8846 8916)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache311Pilot.cache
    8846 8916 SourceCache311Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_312 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache312Pilot.cache 8916 9316)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache312Pilot.cache
    8916 9316 SourceCache312Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_313 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache313Pilot.cache 9316 9321)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache313Pilot.cache
    9316 9321 SourceCache313Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_314 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache314Pilot.cache 9321 9331)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache314Pilot.cache
    9321 9331 SourceCache314Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_315 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache315Pilot.cache 9331 9551)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache315Pilot.cache
    9331 9551 SourceCache315Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_316 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache316Pilot.cache 9551 9856)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache316Pilot.cache
    9551 9856 SourceCache316Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_317 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache317Pilot.cache 9856 9926)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache317Pilot.cache
    9856 9926 SourceCache317Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_318 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache318Pilot.cache 9926 10121)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache318Pilot.cache
    9926 10121 SourceCache318Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_319 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache319Pilot.cache 10121 10191)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache319Pilot.cache
    10121 10191 SourceCache319Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_320 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache320Pilot.cache 10191 10456)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache320Pilot.cache
    10191 10456 SourceCache320Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_321 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache321Pilot.cache 10456 10461)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache321Pilot.cache
    10456 10461 SourceCache321Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_322 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache322Pilot.cache 10461 10531)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache322Pilot.cache
    10461 10531 SourceCache322Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_323 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache323Pilot.cache 10531 10751)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache323Pilot.cache
    10531 10751 SourceCache323Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_324 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache324Pilot.cache 10751 10821)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache324Pilot.cache
    10751 10821 SourceCache324Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_325 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache325Pilot.cache 10821 11086)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache325Pilot.cache
    10821 11086 SourceCache325Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_326 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache326Pilot.cache 11086 11606)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache326Pilot.cache
    11086 11606 SourceCache326Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_327 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache327Pilot.cache 11606 11611)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache327Pilot.cache
    11606 11611 SourceCache327Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_328 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache328Pilot.cache 11611 11681)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache328Pilot.cache
    11611 11681 SourceCache328Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_329 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache329Pilot.cache 11681 12216)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache329Pilot.cache
    11681 12216 SourceCache329Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_330 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache330Pilot.cache 12216 12221)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache330Pilot.cache
    12216 12221 SourceCache330Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_331 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache331Pilot.cache 12221 12231)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache331Pilot.cache
    12221 12231 SourceCache331Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_332 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache332Pilot.cache 12231 12601)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache332Pilot.cache
    12231 12601 SourceCache332Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_333 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache333Pilot.cache 12601 13041)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache333Pilot.cache
    12601 13041 SourceCache333Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_334 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache334Pilot.cache 13041 13111)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache334Pilot.cache
    13041 13111 SourceCache334Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_335 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache335Pilot.cache 13111 13306)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache335Pilot.cache
    13111 13306 SourceCache335Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_336 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache336Pilot.cache 13306 13376)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache336Pilot.cache
    13306 13376 SourceCache336Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_337 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache337Pilot.cache 13376 13776)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache337Pilot.cache
    13376 13776 SourceCache337Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_338 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache338Pilot.cache 13776 13781)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache338Pilot.cache
    13776 13781 SourceCache338Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_339 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache339Pilot.cache 13781 13791)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache339Pilot.cache
    13781 13791 SourceCache339Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_340 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache340Pilot.cache 13791 14011)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache340Pilot.cache
    13791 14011 SourceCache340Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_341 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache341Pilot.cache 14011 14316)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache341Pilot.cache
    14011 14316 SourceCache341Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_342 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache342Pilot.cache 14316 14386)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache342Pilot.cache
    14316 14386 SourceCache342Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_343 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache343Pilot.cache 14386 14581)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache343Pilot.cache
    14386 14581 SourceCache343Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_344 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache344Pilot.cache 14581 14651)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache344Pilot.cache
    14581 14651 SourceCache344Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_345 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache345Pilot.cache 14651 14916)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache345Pilot.cache
    14651 14916 SourceCache345Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_346 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache346Pilot.cache 14916 14921)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache346Pilot.cache
    14916 14921 SourceCache346Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_347 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache347Pilot.cache 14921 14991)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache347Pilot.cache
    14921 14991 SourceCache347Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_348 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache348Pilot.cache 14991 15361)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache348Pilot.cache
    14991 15361 SourceCache348Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_349 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache349Pilot.cache 15361 15366)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache349Pilot.cache
    15361 15366 SourceCache349Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_350 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache350Pilot.cache 15366 15436)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache350Pilot.cache
    15366 15436 SourceCache350Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_351 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache351Pilot.cache 15436 15836)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache351Pilot.cache
    15436 15836 SourceCache351Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_352 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache352Pilot.cache 15836 15841)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache352Pilot.cache
    15836 15841 SourceCache352Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_353 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache353Pilot.cache 15841 15851)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache353Pilot.cache
    15841 15851 SourceCache353Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_354 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache354Pilot.cache 15851 16521)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache354Pilot.cache
    15851 16521 SourceCache354Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_355 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache355Pilot.cache 16521 17231)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache355Pilot.cache
    16521 17231 SourceCache355Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_356 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache356Pilot.cache 17231 17301)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache356Pilot.cache
    17231 17301 SourceCache356Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_357 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache357Pilot.cache 17301 17496)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache357Pilot.cache
    17301 17496 SourceCache357Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_358 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache358Pilot.cache 17496 17566)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache358Pilot.cache
    17496 17566 SourceCache358Pilot.checked q raw nodes returns truth
end ScopeViews002Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Batched operation-local cache fidelity checked"
