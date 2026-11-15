# Four-port neutral restoration is false

Coordinator experiment completed during the authorized TUZA-12 mission; independently reconstructed by the first critic at 2026-11-02 14:22:46 UTC. Status: **REFUTED** proposed lemma; graph optima **PROVED_ORDINARY** by the elementary certificates below, also FINITE_CHECKED. No novelty or unrestricted Tuza claim.

## Exact graph

Let Q be K4 on {0,1,2,3}. Add vertices 4,5,6,7 as page tips on cycle edges 01,12,23,03 respectively, and add tip edges 45,47,56. Thus

E(G)={01,02,03,04,07,12,13,14,15,23,25,26,36,37,45,47,56}.

The complete triangle family is

{012,013,014,023,037,047,123,125,145,236,256}.

There are no other triangles: the four Q faces, four page triangles, and three triangles on the added tip edges exhaust all possibilities. The tip-edge graph is the path 7–4–5–6. Each added tip edge has exactly its stated common Q-neighbor. Both diagonals 02 and 13 occur only in Q faces, so the externally active Q-edges are EXACTLY its four cycle edges.

Put H=G−{02,13}. Its complete triangle family is {014,037,047,125,145,236,256}.

## Packing certificates and upper bound

The four page triangles {014,125,236,037} are edge-disjoint in H, hence in G. Thus both packing numbers are at least four.

G has 17 edges and six odd-degree vertices, namely 0,1,2,3,6,7. Five edge-disjoint triangles would use fifteen edges and have even degree at every vertex. The two leftover edges can have at most four odd-degree vertices, whereas they would need to reproduce all six odd degrees of G. This is impossible. Therefore nu(G)=4 and, by H subset G, nu(H)=4 as well.

## Cover certificates and lower bound

The set {01,07,15,26} covers all seven H triangles. Its four disjoint page triangles prove tau(H)>=4, hence tau(H)=4.

The set {01,23,07,15,25} covers all eleven G triangles, so tau(G)<=5. For the reverse inequality, Q itself requires at least two Q-edges to cover its four faces. The three triangles 145,047,256 have pairwise disjoint edge sets, all outside E(Q), so they require three additional edges. Thus tau(G)>=2+3=5.

Consequently

(nu(H),tau(H))=(4,4), while (nu(G),tau(G))=(4,5).

This directly refutes the proposed implication nu(G)=nu(H) => tau(G)=tau(H) for restoration of the two inactive diagonals in a C4-port K4. Both graphs comfortably satisfy Tuza. The issue is a positive cover defect with zero packing gain, not failure of the original conjecture.

## Exact test and independent reconstruction

The coordinator tested all 64 graphs obtained by choosing any subset of the six possible tip edges. Six refute the proposed implication. Complete graph/triangle/packing/cover data for all cases are in experiments/C_four_port_probe.json; code is C_four_port_probe.py. The first mask is13, with tip edges45,47,56.

The critic rebuilt this graph from the description with independent code, enumerated all exact optima, checked true port activity, checked odd-degree counts, and additionally ruled out all 3^4=81 possible four-covers choosing one edge per page triangle. The hand lower bound above is simpler and makes exhaustive search unnecessary to the final mathematical proof. Independent files: review/check_four_port_refutation.py and review/four_port_refutation_evidence.json.

The author-completed investigation before this test is preserved byte-for-byte as review/B_AUTHOR_CLOSEOUT.md; its then-untested proposal is now superseded by this note. Do not promote that historical proposal as a surviving follow-on lemma.
