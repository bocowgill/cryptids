# Bounded single-pass map certificate

Trial15 at5b309f5 establishes the first bottleneck: map count takes42.826s;
validity reaches896/1024chunks in61.145marker seconds, then sharedData120s
expires. Peak validity RSS2802655232bytes. This is a time obstruction, with
no complete validity, actual-row or new machine credit. Official evidence and
parent byte/provenance checks are retained in certificate-15.

The next source revision preserves every raw map/quotient leaf, cached midpoint,
global bound, loaded input hash, old root statement, all audits and all caps.
A pure structural checkMap returns an optional exact leaf count, checking each
cached left count and leaf range during that traversal. Its inductive soundness
theorem recovers the exact count, existing RowTree.WellFormed predicate and
existing mapAllBelow=true predicate. None means rejection, never proof credit.

Each small chunk receives an ordinary kernel proof of checkMap=some size;
named parent proofs compose the three facts without rechecking all descendants.
MapCount exports the combined map_facts and the unchanged map_count. MapValid
and MapBounded project the unchanged propositions and retain separate audits.
All eight data stages still share120s, within1200s/6GiB total. No cap increase.

Tiny production-helper smoke tests include empty, valid leaf, out-of-bound leaf,
wrong cache, correct cache and the forced four-chunk composition. The existing
sample and false actual-row checks remain unchanged. Generated Lean width is
checked before builds. New roots: smoke30, MapPrelude10, MapCount2; the final
MapChecks6, QuotientChecks13 and Data19 censuses remain unchanged.

Source review covers exact theorem direction, count/cache/range boundary cases,
all child-proof dependencies, explicit audit coverage and unchanged resource
accounting. Remote compilation and measured savings remain pending. This pilot
only unlocks the existing prospective459315state reduction; it has no separate
accepted physical saving.
