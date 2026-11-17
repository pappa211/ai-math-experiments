> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Coordinated critical-edge deletion lemma at defect two

Frozen for fresh independent review, 2026-11-16. Coordinated derivation by the coordinator and mixed worker. Status: ordinary proof reconstructed by both authors; independent review pending. No unrestricted CS claim.

## Theorem

Let J be a finite simple graph. Suppose every actual triangle of J lies in a literal K4, and CS holds for every proper subgraph used below (in particular J-e, J-{e,f}, and triangle components). Suppose

    tau(J)=2nu(J)-2.

If e is packing-critical, meaning nu(J-e)<nu(J), then R=J-e is defect one and one-edge packing resilient. Without an additional connectivity hypothesis, this theorem does not assert connected triangle support. The conditional strengthening below proves it when J has connected triangle support. No statement here asserts that every R triangle extends to a maximum packing.

## Proof

Put p=nu(J). Deleting an edge lowers packing by at most one, hence nu(R)=p-1. Cover deletion gives

    2p-3 <= tau(R) <= 2p-2.

If tau(R)=2p-2, proper-subgraph CS makes R tight B. The critical edge e lies in a triangle; a literal K4 completing that triangle in J becomes K4-e in R. Its two remaining triangles share an edge, so the same B component contains all four vertices and must contain the absent edge e. Contradiction. Therefore tau(R)=2p-3=2nu(R)-1.

Suppose now that f is packing-critical in R. Let L=J-{e,f}. Then nu(L)=p-2, and

    tau(L)>=tau(R)-1=2p-4=2nu(L).

Proper-subgraph CS therefore gives equality and B(L). Also f is critical already in J: nu(J-f)<=nu(L)+1=p-1, while deleting one edge gives the opposite inequality.

Every literal K4 of J containing e must also contain f. Otherwise it survives in L as a K4-e diamond, forcing e into its B component exactly as above. Symmetrically, every K4 containing f contains e. Since every triangle of J lies in a K4, every triangle lost on passing J to L lies in a K4 containing both e and f.

If e and f are disjoint, their four endpoints specify this K4 uniquely.

If they are adjacent, write e=uv and f=uw. A K4 containing both has vertices u,v,w,x. The triangle vwx and edge ux are old, hence belong to L. If two distinct fourth vertices x,y occur, the old triangles vwx and vwy share vw and therefore lie in one literal B component. That component contains xy. Since ux,uy are also old, uxy is an L triangle sharing xy with the component. The component must then contain u and v, hence the absent edge uv. Contradiction. Thus there is at most one fourth vertex and again only one such K4.

In either case all triangles lost by deleting {e,f} lie in one literal K4. A triangle packing uses at most one triangle from a K4, so

    nu(J)<=nu(L)+1=p-1,

contradicting nu(J)=p. Thus R has no critical edge, proving one-edge resilience.

## Exact consequence for the critical-triangle leaf branch

If a frozen-F predecessor J has defect two and all three edges of a separator triangle A are critical, then for EACH e in E(A), J-e is a strictly smaller resilient defect-one graph. The deletion is by one actual graph edge, so edge-count minimality is legitimate. This is a proved reduction to the primary rigidity class after the connected-component step below, not a proof that such J is impossible.

No claim of triangle-extension, two-edge resilience, or a specific restored-triangle parent is imported into J-e.

## Triangle-component accounting, when connected support is needed

Under the same proper-subgraph CS premises, the actual shared-edge triangle components of R have additive tau and nu; background edges contribute neither. Their nonnegative defects sum to one. Therefore exactly one nonempty triangle component has defect one; every other nonempty component is tight and hence a literal K4 or K5 support. Global one-edge resilience of R implies one-edge resilience of each component by the same additivity.

Consequently the unique defect-one component, taken with its actual triangle-supported edges, is connected through shared graph edges and one-edge resilient. It is an eligible input to the broad frozen rigidity conjecture. If subsequent restoration uses the original R, all background edges and attachment information must still be retained. The component statement does not identify a replacement region or prove the broad rigidity conjecture.

## Connected-support strengthening

If J has connected nonempty triangle support, then R also has connected nonempty triangle support. If every J edge is triangular, every R edge is triangular.

First, any surviving triangular edge g of J lies in a literal K4. If that K4 contains e, all five edges of its K4-e diamond remain triangular; otherwise the K4 is unaffected. Thus deletion of e loses no other edge from triangle support.

For each triangle of J removed by deleting e, choose a literal K4 completing it. The surviving K4-e diamond lies in one triangle component of R and contains both endpoints of e. This component cannot be tight B, since a literal K4/K5 support containing both endpoints would contain the absent edge e. It must therefore be the unique defect-one component established above. In particular both old spokes of every removed e-page belong to that same component.

Any other triangle component of R consequently shares no graph edge with any restored e-page, and it would remain a separate triangle component of J. Connected triangle support of J rules this out. Hence R itself has one connected triangle support component. Background edges, if present, remain retained and do not alter this component argument. Triangle-extension and two-edge resilience are still not claimed.

## Remaining obligation

This leaves a concrete smaller-object loop: classify/exclude the smaller resilient defect-one component, reconstruct how its tight components and the deleted edge can form J, and use the fact that ALL three edges of A are critical. Merely knowing one deletion lies in the rigidity class does not eliminate the critical-triangle branch. The cheap candidate that a K4-completed defect-two graph cannot have a wholly critical triangle remains OPEN; the bounded overlap-only search reached no such state.
