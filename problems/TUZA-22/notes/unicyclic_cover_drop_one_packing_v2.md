> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Cover-drop-one supplies the full unicyclic component packing interface

Status: ORDINARY_PROOF_CANDIDATE, frozen for fresh review. Source_audit, 2026-11-16 UTC. This strengthens and simplifies the pure-cycle v1 mechanism while preserving that source. It uses the accepted forest anchor and external-forest family minmax, with no finite or external theorem input.

## Hypotheses and conclusions

Let C be a minimum actual triangle-edge cover of G such that:

1. EVERY actual triangle has exactly one selected edge in C.
2. For EVERY actual triangle T, tau(G-E(T))=tau(G)-1.

The strict original-H-D branch satisfies these two statements. The conclusions below do not additionally assume a packing optimum, a no-two-edge-blocker condition, or codegree bounds.

Let C_i be a connected unicyclic component of the selected-edge graph, with m edges and vertex set A. Let F_i be its complete assigned family, consisting of every actual triangle whose unique C-edge lies in C_i. A triangle of F_i is internal if all three vertices lie in A, and external otherwise. Every external member has exactly two vertices in A and its selected base in C_i.

Then F_i has a packing I union P of internal and external triangles with

    2|I|+|P| >= m.                                        (2)

If some actual triangle on a selected cycle edge is internal, the right side can be improved to m+1. If the ENTIRE family is external, it has an ordinary packing of exactly m pages, one on every base of C_i. Arbitrary attached trees in C_i and arbitrary outside apices are allowed.

No simultaneous compatibility with packings of other cover components is asserted here.

## 1. The exact local deletion value

As in the cycle v1 argument, tau(F_i)=m: otherwise replace C_i by a cheaper actual family cover and retain C minus C_i.

For any T in F_i, let e be its unique selected base. The surviving bases C_i minus {e} cover F_i after deleting E(T). Conversely, a family cover of size below m-1, together with C minus C_i, would cover G-E(T) below tau(G)-1. All outside selected edges survive T because T contains exactly one selected edge. Therefore

    tau(F_i after deleting E(T)) = m-1.                   (3)

This does not assume cover additivity across components.

## 2. A literal family graph and the residual forest

The assigned family can be treated as the full actual triangle family of a graph H_i: retain all actual edges of G within A, retain all actual edges from A to V(G) minus A, and discard edges with both endpoints outside A. The outside set is independent in H_i. Every triangle in H_i lies inside A or has exactly two A vertices. Its unique selected edge must belong to C_i, since no selected edge crosses two selected components or joins A to a selected-degree-zero vertex. Thus these are exactly F_i; no abstract replacement or omitted triangle is involved.

Choose a cycle edge e of C_i and an actual T in F_i containing it. Such a triangle exists because every edge of a minimum cover is essential. Delete all three actual edges of T from H_i. Its triangle family is precisely the residual family in (3). Its selected base cover C_i minus {e} is a forest, including all its original attached trees.

## 3. Internal packing and external pages

Apply the accepted existential forest-anchor theorem to the residual induced graph on A, with forest cover C_i minus {e}. It gives an internal triangle packing I and an internal edge cover D with

    (C_i minus {e}) intersect E(I) subset D,
    |D| <= 2|I|.

Consider the surviving external family whose selected bases are not in D. It is an arbitrary complete page subfamily over forest bases, so the accepted external-forest minmax supplies an ordinary cover and packing of equal size q. The union of D with that external cover covers the entire residual family: D covers all internal triangles and all external pages whose bases lie in D. Hence (3) gives

    m-1 <= |D|+q <= 2|I|+q.

The q external pages are disjoint from I. Their only edges internal to A are their selected bases, and the anchoring condition excludes every such base used by I. All these triangles survive deletion of E(T), so they are also edge-disjoint from T.

Append T. If T is external, its weight is one, giving (2). If T is internal, its weight is two, giving the claimed surplus m+1. The chosen packing is existential; no fixed preselected maximum internal packing is imposed.

## 4. Entirely external families

When F_i has no internal triangle, there is an even shorter argument. After deleting T on the cycle base e, the complete residual family is external over a forest. By (3) and the external-forest minmax it has a packing of m-1 pages. Append T to obtain m pages. Every packing uses each selected base at most once, so all m bases are used exactly once and this local packing is maximum.

This proof needs neither the list-coloring classification nor a lower bound on list size. It handles all attached trees and all outside-apex multiplicities. It answers the pure-external unicyclic packing side of the coordinator's H-D question directly from the original deletion equality.

## Remaining scope

With internal triangles, the weighted target is established, but a full m-page packing or an equal-cost bipartite replacement is not claimed. For a selected component with two or more independent cycles, deleting one triangle need not leave forest bases, so the proof does not apply. Global compatibility and the original near-tight relation remain separate obligations. In particular this is not a proof that an unrestricted H-D candidate has only such selected components, and not an unrestricted Tuza or CS conclusion.
