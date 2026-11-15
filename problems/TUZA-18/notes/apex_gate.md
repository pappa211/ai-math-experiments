# Apex global gate (2026-11-14)

## Claim, quantifiers, implication

UAC: for every finite simple H and every X⊆V(H), let G add z adjacent precisely to X, and let λmin=min vc(H[X]−C) over minimum triangle-edge covers C of H. Assert τ(H)+λmin≤2ν(G). This implies unrestricted Tuza by the exact cover identity (indeed X empty already contains Tuza). For an inductive attack, assume every proper subgraph of G obeys Tuza; proving UAC for at least one vertex of each hypothetical minimal violation would suffice. No coloring, triangle-free-link or equality-structure hypothesis is allowed silently.

Stronger technical assertion E: τ(G)=τ(H)+λmin. A failure of E explains the artificial minimum-cover restriction but is NOT a failure of UAC.

First decisive test: enumerate the installed NetworkX graph atlas, all graphs through order seven, all vertex-deletion apex instances, every actual triangle. Compute exact cover and packing by integer subset recurrences; compute λmin independently from the forced-cover identity. This finite domain is a falsification probe, never evidence of a general proof. Next and final bounded extension: at most 180 seconds of seeded random/structured graphs through order twelve, biased toward K4/K5 clique attachments and close cover/packing ratios, with individual-case timeouts recorded UNKNOWN. If no failure or structural proof appears, stop this stronger-than-Tuza route and retain only the exact obstruction to E.

## Dependencies

The exact identities are elementary and valid on arbitrary finite simple graphs:

τ(G)=min_C(|C|+vc(L−C)), over ALL H triangle covers C;
ν(G)=max_M(|M|+ν(H−M)), over all link matchings M;
min_{C⊇F}|C|=|F|+τ(H−F), where C covers H.

All deletions are graph-edge deletions, with all actual triangles retained/recomputed. The installed atlas is used as a concrete finite list; no independent verification of its isomorphism-class completeness is claimed. Exact witnesses do not depend on that completeness. No Aharoni/HNS equality theorem is used in this probe.
