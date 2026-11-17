> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent universal apices force a strict private-packing bound

Status: ORDINARY_PROOF_CANDIDATE; fresh review required. TUZA-22 challenger, 2026-11-16 local date.

Let G have a partition A union B where B is independent, every A-B pair is an actual edge, and C=E(G[A]) is a nonempty minimum triangle-edge cover. Put b=|B| and m=|C|. Then the private triangle packing number q satisfies

    q >= ceil(b*m/(2*b−1)) > m/2.

In particular tau(G)<2nu(G). This covers arbitrary internal graphs on A and arbitrary b; it does not require b>=m/2.

Proof. For any v in A, replace all d_A(v) internal cover edges incident to v by its b cross spokes. Mixed triangles using a removed edge are hit by their spoke at v; an all-internal triangle through v retains its opposite edge. Therefore minimum-cover optimality gives d_A(v)<=b. Since C is nonempty, b>=1.

A graph of maximum degree at most b has a proper edge coloring with at most2b−1 colors: in any sequential edge order, a new edge is adjacent to at most2b−2 previously colored edges, so a color is available. Pad with empty classes if needed. Its2b−1 matching classes partition m edges, and the b largest classes contain at least b*m/(2b−1) edges altogether.

Assign those b classes to distinct vertices of B. For each selected internal edge xy in the class assigned to z, use triangle xyz. These triangles are actual and private to xy. Within a class the base edges form a matching, so the spokes at its apex are disjoint; between classes the apices differ, so their cross spokes differ, and all base edges are distinct. This is an edge-disjoint private packing of the stated size. Since b/(2b−1)>1/2 and m>0, the strict inequality follows. QED.

The conclusion diagnoses only this explicit complete-cross, independent-side cover class. It does not prove that a minimum obstruction has such a partition, or that every bipartite-complement minimum cover has abundant pages. The local-Hall counterexample has many missing cross edges and does not satisfy this hypothesis.
