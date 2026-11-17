> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Targeted overlap probe: a finite defect transfer, no iterative mechanism

This is targeted finite evidence and a construction diagnosis, not an exhaustive classification or an unbounded theorem.

The coordinator authorized at most300 seconds of local computation with a2200MiB process-tree ceiling. Two externally monitored runs completed in13.480 and15.301 seconds, with sampled peaks31.49 and33.82MiB respectively. No worker remains. The first attempted monitor invocation stopped at argparse before starting any worker; the corrected invocations and completed workers have receipts in `operations/resilient_neartight_gluings.json` and `operations/resilient_neartight_gluings_v2.json`.

The literal optimizer rebuilds every graph triangle, then uses exact cached deletion recurrences for maximum triangle packing and minimum triangle cover. For defect-one candidates it checks every edge-deletion packing number and determines whether each edge belongs to a minimum cover. The per-instance wall cap was0.9 seconds, with timeouts explicitly UNKNOWN. The completed runs had zero UNKNOWN instances.

Run1 examined798 distinct labeled candidates from six specified connected edge-resilient defect-one seeds, completing a K4 orK5 on2–4 existing vertices and fresh remaining vertices. It stopped at the first positive-packing neutral attachment with a new cover-ineligible edge. The hit starts from K5 minus01 and completes a fresh K4 on{0,1,5,6}. The result is simply a K5 and K4 glued along01, with nu3,tau5 and four ineligible K4 spokes05,06,15,16. It transfers the single defect from a missing K5 edge to a shared-edge clique pair. It does not yet provide an operation that can repeat.

Two explicitly bounded tiny follow-ups completed a crossedge25 or26 of that graph and attached a fresh K4 along it. Each gives nu5,tau7,defect3. Their exact literal results are retained in `evidence/neartight_interface_followup.json`; the obvious continuation therefore fails to preserve defect one.

Run2 added W5 as a seed and excluded shared-two-vertex cases. It completed its finite target list of893 distinct labeled candidates with shared3/4 vertices. No candidate both increased packing, preserved defect one and edge resilience, and created a fresh cover-ineligible edge. The six neutral positive-packing survivors all upgrade an existing literal K4 bag to K5 by adding one universal vertex to that bag. This is a bounded bag upgrade, not a regenerative attachment.

The seed/operation domain is deliberately narrow. These outcomes do not prove that connected edge-resilient defect-one graphs have bounded packing number. They only reject the specified regenerative mechanism on the recorded literal seeds. The next step should change the representation or find a symbolic construction, not extend this census by inertia.

Exact artifacts:

- `scripts/resilient_neartight_gluings.py` and `evidence/resilient_neartight_gluings.json`;
- `scripts/resilient_neartight_gluings_v2.py` and `evidence/resilient_neartight_gluings_v2.json`;
- both external monitor receipts named above;
- `evidence/neartight_interface_followup.json`.

No independent checker has yet replayed these finite recurrences. They are exploratory evidence, not used as a proof premise in the accepted all-size theorems.
