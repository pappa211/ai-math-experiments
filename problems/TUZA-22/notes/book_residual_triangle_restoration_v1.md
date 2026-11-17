> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Triangle restoration from a classified defect-one book residual

TUZA-22 restoration role, 2026-11-15 UTC. Frozen ORDINARY_PROOF_CANDIDATE for fresh review. This is a near-tight residual theorem, not an assertion that arbitrary defect-one graphs have this structure.

## Statement

Let H be a finite simple graph whose nonempty actual triangle components are literal K4s, literal K5s, and books. A book means all of its actual triangles have one common spine edge uv, with literal support consisting of uv and the spokes ux,vx for its nonempty set of page apices x. Background edges and shared vertices of different components are unrestricted, with every actual triangle counted.

Let T=abc have all three edges absent from H and put G=H+E(T). Then G satisfies CS: tau(G)<=2nu(G), with equality exactly when B(G).

The only new near-tight case is when H has exactly one book component and any number of K4/K5 components. In that case equality forces the book to have exactly three pages with apices a,b,c, and T completes it to a K5. All old K4/K5 components remain unchanged in the actual triangle decomposition.

## Dependencies

- Reviewed R1, covering the case with no book components.
- Elementary component additivity, clique parameters and K4 star/K5 two-edge avoidance.
- The page-incidence classification from `two_triangle_restoration_v1.md` §1: new triangles from one independent terminal triple have bipartite page matching number q; if q<=2, their new family has a cover<=2 unless it is exactly K5-e with two full apices.
- CS for graphs with packing number<=2, a direct corollary of the independently reviewed two-triangle restoration theorem: delete a maximum packing to leave triangle-free B, then restore its one or two triangles.

No sparsity theorem, arbitrary near-tight classification, or unrestricted CS is used.

## Proof

Let the union of the old K4/K5 components have packing number m and cover number2m. Let b be the number of book components; each contributes nu1,tau1. Hence

    nu(H)=m+b, tau(H)=2m+b.

The restored triangle T is edge-disjoint from H, so nu(G)>=m+b+1. Its three edges extend an H-cover, giving tau(G)<=2m+b+3. If b>=2, then

    tau(G)<=2m+b+3 <= 2(m+b+1)-1 <= 2nu(G)-1,

so CS holds strictly. If b=0, reviewed R1 supplies full CS.

It remains b=1. The same elementary bounds already give Tuza:

    tau(G)<=2m+4 <=2nu(G).

Assume equality. Then nu(G)=m+2 and tau(G)=2m+4. Let N be the full new triangle family, consisting of T and ordinary pages on its three bases.

First, the page incidence graph has no matching of size3. Such a matching gives three edge-disjoint new pages, one on each base with distinct apices. Their old footprint within each old K4/K5 component is a star of at most two edges: the component meets the independent terminal triple in at most one vertex, and each terminal lies in only two of the three bases. Thus these pages append to a packing of size m from the old K4/K5 components, **without using any old book triangle**, and give m+3 in G, contradiction.

Next, N cannot have a cover of size at most2: combining it with an H minimum cover of size2m+1 would give tau(G)<=2m+3. The page-incidence classification therefore forces N to be exactly the seven-triangle K5-e family on {a,b,c,x,y}, with x,y two full apices and no other new pages. The three bases cover this family; every old spoke belongs to a three-edge cover, e.g. {bc,ax,ay} contains ax.

No such spoke can lie in an old K4/K5 triangle component. If a spoke s did, choose a minimum cover of the old clique-component union containing s, and add the old book's spine. This is a minimum H-cover of size2m+1 containing s. A three-edge cover of N containing s then adds at most two new edges, giving tau(G)<=2m+3, contradiction.

Consequently all new triangles have edge support disjoint from all old K4/K5 components. The remaining triangle family consists exactly of the old book and N. Let J be its literal edge-support subgraph. Every actual triangle of J is one of these triangles: if its support shared an edge with an old K4/K5 component, that would contradict the disjointness just proved; no new triangle has been omitted from N. Component additivity gives

    nu(J)=2, tau(J)=4.

Apply the reviewed CS theorem at nu<=2 to J. Therefore B(J). The seven-triangle family N is shared-edge connected and spans five vertices, so its component in J must be the literal K5 on {a,b,c,x,y}, not K4. It follows that xy is an actual edge of J and hence of H, since xy is not one of the restored triangle edges.

The old triangles axy,bxy,cxy then exist in H and belong to its one book component. They have common spine xy. No other old book page is possible, since it would lie in the same component of J but add a sixth vertex beyond the literal K5. Thus the old book has precisely these three pages, and T completes it to that K5. The old clique components are untouched, so B(G).

This completes all values of b and proves full CS. QED.

## Exact implication for the minimum-CS obstruction

Reviewed R1 forces every triangle residual of a minimum CS failure to have defect one. The present theorem excludes those residuals whose actual triangle components are all K4/K5/book components: defect one would mean exactly one book, and restoration would give CS for G.

It leaves, explicitly, defect-one residuals with a more complicated connected component, such as K5-e or other non-book configurations. No claim that this remaining class is empty or bounded is made.
