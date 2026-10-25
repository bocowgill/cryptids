# Prepared exporter correction; not remotely checked

Final run 40236839275 checked Cleanup.olean, then PrinterModel.lean failed at its
new root-level `def main`: AllWords already exports a root-level main. The
model_extension and printer_rows roots printed standard foundations, but no
PrinterModel.olean exists and no rows were exported. Do not accept that module.

The mutable generator now names its IO function exportCompletePrinterRows20261025
and evaluates it with #eval. The driver compiles this module without --run, so it
will not invoke the old imported AllWords.main. Row export is an external
byte-for-byte binding check, never a kernel proof oracle. No theorem statement,
physical row, checked object, frozen source or resource cap changed.

THIS CORRECTION HAS NOT BEEN COMPILED OR RUN. The three-attempt budget is
exhausted. Do not launch a fourth job without new authorization. All 53 new scan
modules and Complete.lean also remain unchecked. Retained complete-03 contains
the exact failed tested source; the mutable generator contains this proposed fix.

A future bounded phase should reuse the newly checked Cleanup object, old 53
packet modules and output wrapper. First validate the exporter fix and complete
row correspondence, then the 53 backward-scan summaries and final composition.
Only a successful exported complete_printer with standard foundations and its
paired controls satisfies the full-printer deliverable.
