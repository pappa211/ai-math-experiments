> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Adjacent packing-critical edges in a defect-one graph

Frozen ordinary lemma for fresh independent reconstruction. This is a proper-subgraph-CS argument about an intermediate graph, not a claim that resilience descends through arbitrary attachments. All actual triangles count and triangle-free background edges remain.

## Lemma

Let J be finite simple, p=nu(J), tau(J)=2p−1, and assume every proper edge-subgraph of J satisfies CS. If two distinct adjacent edges e=uv and g=uw are each packing-critical (nu(J−e)=nu(J−g)=p−1), then vw is present, uvw is the only triangle containing e, its three-edge support is a whole triangle component of J, and all other triangle components have literal K4/K5 support. In particular these two adjacent critical edges lie in an isolated K3 triangle component, even though background edges and vertex sharing may be present.

Proof. Put R=J−e. Cover extension and proper-subgraph CS give

    2p−2 <= tau(R) <= 2nu(R)=2p−2.

Hence B(R). The packing number increased on adding e, so at least one actual e-page uvx exists. Suppose x differs from w. This page avoids g. If g is background in R, an R maximum packing already avoids it. Otherwise g belongs to a literal old clique Q containing u,w but not v, since uv is absent in R. The page footprint inside Q is either empty or the edge ux, and g together with ux is a star of at most two edges. Maximum K4/K5 packings avoid that star. Every other old clique sees at most one page spoke: it cannot contain both u,v, for uv is absent. Choosing the respective maximum clique packings, and then appending uvx, yields a J maximum packing of size p avoiding g. This contradicts criticality of g.

Thus every e-page has apex w, so uvw is the sole new triangle. If either old spoke uw or vw were triangle-supported in R, choose a minimum R cover containing that spoke (possible in its literal clique component). This cover also meets the sole new triangle, giving tau(J)<=tau(R)=2p−2, contradiction. Both old spokes are therefore background in R. Consequently all three edges of uvw are disjoint from old triangle support, and no other new triangle exists; it is a whole K3 triangle component. The remaining components are the old B components. This proves the lemma.

## Degree-three wedge response

Let H be triangle-supported, single-edge packing-resilient and defect-one, with every proper edge-subgraph satisfying CS. Let v have exactly three neighbors a,b,c, with neighbor graph precisely the path a-b-c. Put J=H−v and p=nu(H). The only triangles through v are vab and vbc. Deleting vb removes both, so resilience gives nu(J)=p. If either ab or bc could be avoided by a J maximum packing, its v-page would append to produce p+1. Hence both are packing-critical in J.

Adding vb to a J cover covers the new family, so tau(J)<=tau(H)<=tau(J)+1. Thus delta(J)=2nu(J)−tau(J) is1 or2. If it were1, the lemma would force the adjacent critical edges ab,bc into the triangle abc, contradicting ac absent. Therefore

    delta(J)=2, nu(J)=p, tau(H)=tau(J)+1,
    ab and bc are both packing-critical in J.

This gives an exact predecessor profile, realized by deleting a rim vertex of W5. It does not classify J or provide a proper replacement preserving every restoration boundary.

## Simplicial degree-three zero-gain response

Let H have a degree-three simplicial vertex x with neighborhood A={a,b,c}, and write J=H−x. Assume H is defect-one and every proper edge-subgraph satisfies CS. Suppose nu(H)=nu(J)=p (zero packing gain). Every A edge is packing-critical in J, since an avoiding J maximum packing could be extended by its x-page. A J cover must hit the triangle A; one additional x-spoke then covers any remaining x-pages, so tau(H)<=tau(J)+1. Thus delta(J) is1 or2.

If delta(J)=1, apply the lemma to two A edges. J has one isolated K3 triangle component A and all other components are literal K4/K5. Adding x turns precisely A into a literal K4; no other new triangle can occur because x has exactly those three neighbors. Hence B(H), giving delta(H)=0, contradiction. Consequently zero-gain simplicial degree-three defect-one H requires

    delta(J)=2 and all three A edges packing-critical in J,
    tau(H)=tau(J)+1.

The positive-gain branch and any assertion that a three-connected core has a degree-three vertex remain separate obligations. These exact responses isolate what an induction must preserve instead of assuming predecessor resilience.

Dependencies: explicit proper-subgraph CS, elementary cover extension, component additivity, minimum K4/K5 covers through a prescribed edge, and maximum clique packing avoidance of a star with at most two edges. No solver, census, or external matching theorem is a premise. Historical-priority status: no novelty claim; not yet compared against every archived lemma.
