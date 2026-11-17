> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Coordinator review: full R3, resilient defect-one representation, and isolate transport

Fresh ordinary reconstruction, 2026-11-16 04:31 UTC. Internal AI review only.

## Full R3

ACCEPT notes/three_edge_restoration_full_cs_v1.md, together with all five shape proofs and the final P3+K2 proof. Previous coordinator receipt records star, P4 and matching. For the last disconnected shape, a two-new triangle and an ordinary page on the disjoint base force an old K4 opposite-pair obstruction; actual old-triangle closure excludes adjacent ordinary pages. Without the two-new triangle, two active adjacent bases have one common apex; the disjoint family then either shares one covering edge or is covered by an old opposite pair. Inactive-edge reduction invokes R2 at its exact scope.

The full inequality audit is essential and passes: after elementary insertion only nu=m+1 and tau>=2m+2 are assumed; every strict-cover contradiction is <=2m+1, and every packing contradiction gives m+2. A literal B conclusion excludes tau=2m+3 as well as classifying equality. This proves CS for B plus at most three arbitrary missing edges. It supplies neither a global B residual nor a two-edge packing blocker. Three-edge packing resilience is explicitly NOT claimed.

## Resilient defect-one representation

ACCEPT notes/resilient_defect_one_two_edge_B_classification_v2.md. The ENTIRE triangle family must be one shared-edge component; vertex connectivity alone is insufficient. Adjacent restored bases force singleton ordinary families with one apex. Old bcx lies in K4, since a K5 cover through the entire triangle gives strict overlap; an old ay would merge via axy, and supported ax gives a further cover overlap. Thus the whole support is K5-e. For disjoint bases, every-disjoint page pairs force singleton families already covered at old minimum cost. An intersecting pair confines all pages to four terminals; resilience forces the full K4. Its old supported cross edges are nonempty, cannot contain an opposite pair, and lie in distinct old blocks. Shared-edge connectivity therefore leaves one or two adjacent-edge attachments, giving nu<=5. The two fresh K5 attachments attain nu5,tau9 and preserve packing after every single-edge deletion. No finite computation or CS induction is used. Availability of the two-edge B deletion remains open.

## One-isolate finite subdomain and ordinary transport

ACCEPT independent validator evidence/coordinator_cycle_cover_isolate_validation.json: 26944 raw states, 2422 eligible, 24522 degree/connectivity exclusions, zero K4-filter exclusions, zero UNKNOWN; all five damaged controls rejected. The checker independently generates seven path partitions and rebuilds every literal graph; it imports no producer code. It reuses the separately authored P6 literal-certificate kernel generalized to variable order. This is a finite certificate, not an ordinary enumeration-free proof.

ACCEPT the conditional ordinary bridge notes/challenger_cycle_cover_two_link_isolate_bridge_v1.md. An internal selected-path vertex v with deg_F(v)=deg_Lh(v)=2 has precisely its selected cycle neighbors u,w as common neighbors with h. Therefore h is an isolate in the FULL neighboring link L_v-{u,w}, and uw is absent. Outside vertices are retained by the full-link identity. The independently validated isolate theorem excludes this configuration only in the hereditary one-cycle-cover minimum-CS context, with the separate finite P6 matching bound. This does not fabricate a WKE tuple for the non-WKE P5 boundary. Complete original-domain enumeration is still a separate obligation.
