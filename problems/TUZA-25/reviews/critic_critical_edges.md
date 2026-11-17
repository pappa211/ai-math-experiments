> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent critic: adjacent critical edges and degree-three responses

**PASS at the exact conditional scope.** Reviewed `notes/critical_adjacent_edges_frozen.md`, SHA-256 `3851774a1a4daae047b992de3efbc90ef03de1db0e61a00e565bb30c0ac35c05`. The proofs retain every actual triangle and every background edge. They use proper-edge-subgraph CS explicitly, not presumed resilience of a predecessor. No computational or external matching theorem is a premise, and no historical novelty is certified.

## Adjacent critical-edge lemma

Let e=uv and g=uw be distinct packing-critical edges in a defect-one graph J, with p=nu(J). For R=J-e, cover extension gives tau(R)>=tau(J)-1=2p-2. Proper-subgraph CS and nu(R)=p-1 give the reverse inequality. Hence R is tight and B(R). This is the exact point where the equality classification in CS is needed; ordinary Tuza alone would not identify the old components.

Since deleting e lowers the packing number, e lies in an actual triangle uvx. Suppose x differs from w. The page avoids g. No literal old clique can contain both u and v, because uv is absent from R, so each old clique sees at most one of the page's old spokes ux,vx. If g is supported, its unique triangle component is a literal clique containing u,w and not v. In that component, the edge g and the possible page spoke ux form a star of at most two edges. K4 and K5 maximum packings avoid such a star. If g is background, every R packing already avoids it; choose each clique maximum packing to avoid its at-most-one page spoke. In both cases the component packings combine into a maximum R packing avoiding g and both page spokes.

Appending uvx gives a J packing of size p that avoids g, contradicting criticality of g. Thus all e-pages have apex w; at least one exists, so vw is present and uvw is the unique e-triangle.

If either old spoke uw or vw were triangular in R, choose a minimum cover of its old literal clique containing that edge and combine it with minimum covers of the other components. This minimum R cover also hits the unique new triangle, yielding tau(J)<=2p-2, contradiction. Therefore both spokes are background in R. Adding e creates exactly the single triangle uvw, whose three edges are disjoint from all old triangle support. It is a whole K3 shared-edge triangle component; all other components remain the old literal K4/K5 components. Vertex-sharing and other background edges do not alter this conclusion.

## Degree-three path neighborhood

For a vertex v with precisely three neighbors a,b,c and induced neighbor path a-b-c, the only incident triangles are vab,vbc. Deleting vb leaves exactly the same actual triangle family as deleting v, so single-edge resilience of H gives nu(J)=nu(H)=p for J=H-v. If an optimum J packing avoided ab, appending vab would increase the H packing; hence deleting ab lowers nu(J), and a single edge can lower a triangle-packing optimum by at most one. Thus ab is packing-critical. The same argument applies to bc.

Restricting covers to J and extending by vb gives tau(J)<=tau(H)<=tau(J)+1. Since tau(H)=2p-1, delta(J) is one or two. Every proper edge-subgraph of J is also a proper edge-subgraph of H, so the conditional critical-edge lemma applies if delta(J)=1. It would force the missing edge ac to be present, a contradiction. Consequently delta(J)=2 and tau(H)=tau(J)+1, with both adjacent base edges critical. This is consistent with the wheel example. It gives no resilience or full structural classification of J.

## Simplicial degree-three zero gain

When x has exactly the clique neighborhood A={a,b,c} and nu(H)=nu(H-x)=p, the same append-a-page argument makes all three A edges packing-critical in J=H-x. Every J cover contains some A edge, say ab. Adding the spoke xc covers the two other x-pages, while xab is already hit. Thus tau(H)<=tau(J)+1, and restriction gives the opposite comparison needed for delta(J) in {1,2}.

If delta(J)=1, the adjacent-critical lemma makes A an isolated K3 triangle component and every other component literal K4/K5. Adding x changes exactly that K3 component into a K4: x has no neighbors outside A, so no extra new triangles or merger with other components is possible. Hence B(H). Componentwise K4/K5 packing and cover values then give delta(H)=0 directly, contradicting the stated defect one. Therefore delta(J)=2, tau(H)=tau(J)+1, and all three A edges are packing-critical.

These are exact predecessor responses. The positive-packing-gain simplicial branch, a guaranteed degree-three vertex, a useful replacement, and preservation of the full restoration boundary remain open obligations. The review does not transfer any unsupported resilience property to J and does not derive unrestricted Tuza or CS.
