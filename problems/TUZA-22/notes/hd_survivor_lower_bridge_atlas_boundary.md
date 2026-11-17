> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fixed-atlas test of an unproved survivor lower bridge

Status: BOUNDED_FINITE_DISCRIMINATOR_ONLY. Source_audit,2026-11-16 UTC. No all-size inference and no domain expansion.

Candidate: if nu(G)=k>=2, tau(G)=2k-1, and EVERY minimum triangle-edge cover meets EVERY actual triangle exactly once, then SOME minimum C and SOME maximum P have nu(G-B_C(P))>=k-1. A universal version would contradict the new original-H-D strict-branch upper bound <=k-3, but the lower bridge remains UNPROVED.

One explicitly authorized run used the installed NetworkX3.7 fixed graph_atlas_g list of1253 graphs through seven vertices. Literal edges and all actual triangles were reconstructed. Independent mission-owned exact recurrences computed packing/cover optima, enumerated ALL minimum covers for each near-tight graph, and then searched the required existential cover/maximum-packing pairs. The process stopped only after the fixed domain finished; it would have stopped at the first counterexample or UNKNOWN.

Results:
-1253 graphs processed;
-62 had k>=2 and tau=2k-1;
-44 failed the ALL-minimum-cover exact-one condition, with a literal minimum-cover witness saved;
-18 satisfied that condition, and all18 had an explicit qualifying cover, maximum packing and surviving packing;
-0UNKNOWN, no counterexample.

CRUCIAL LIMIT: every one of the18 qualifying graphs has k=2,tau=3. The three atlas graphs with k=3,tau=5 all failed the all-minimum-cover hypothesis. Thus this test supplies no positive instance at k>=3 and cannot support an extrapolation to the unresolved all-size bridge.

The monitored run used0.250205 seconds, peak sampled process-tree RSS41.5MiB, within the authorized30s/2200MiB ceilings. Internal computation0.066230 seconds. The owned process finished normally. No repeat, extension, installation, or historical census reconstruction was performed. This is producer evidence with literal witnesses and reproducible exact code, not a separately independently validated census or formal proof.

Frozen artifacts:
-operations/hd_survivor_lower_bridge_atlas_admission.md SHA b01f3d14b3fb7c8d93507884a9a20f61a7c66020bd507c13639d05b29f0b8517;
-scripts/hd_survivor_lower_bridge_atlas.py SHA 5abeac6434cc8e1505ab550dfe162964ed1c4cfb0a7b38fe41eb272bceb56d16;
-evidence/hd_survivor_lower_bridge_atlas.json SHA 46de31b6cad969f942e74008cf66f0c830f8720e40da3b6267fcb5516352b615;
-operations/hd_survivor_lower_bridge_atlas.json SHA 153fbca9a435da8b68b53074a1ca55d07c340fe26682dfeac2a81adf2fc33df3.

The fixed literal domain hash is0ff2437c8a96bcef8da1e39f45d7a3ab37002d580175129ed2c7f0758a3ef684. Any later all-size argument must supply its own structural proof; the passing counts are not such a proof.
