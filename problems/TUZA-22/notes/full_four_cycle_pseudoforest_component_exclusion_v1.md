> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A full four-cycle component is excluded while retaining the boundary edge

Frozen ordinary proof candidate, 2026-11-16. This localizes the historical five-wheel good-page argument across the retained edge hw. It allows arbitrary other components of L-w and arbitrary outside attachments.

Let L be a closed link component at h in a minimum combined-CS failure. Suppose a component of L-w is a four-cycle, and w is adjacent to all its vertices. Then this configuration is impossible.

Label its opposite pairs a,b and c,d, so its cycle edges are ac,ad,bc,bd. Put U={h,w,a,b,c,d}. The actual core B on U is K6 minus ab,cd. No C4 vertex has an L-neighbor outside U.

## 1. A balanced reduction retaining hw

Delete the twelve edges of B OTHER THAN hw, obtaining K. The four triangles

    hac, hbd, wad, wbc

are edge-disjoint and use exactly those twelve deleted edges. Thus every K packing extends by four triangles. Every lost triangle is either a B triangle or a page with an apex outside U on one of the eight rim bases

    ac,ad,bc,bd,wa,wb,wc,wd.

To justify completeness, any triangle on a deleted h-spoke has its other vertex in the h-link and adjacent to a C4 vertex; it therefore stays inside this same C4+w component. A triangle on hw with an outside apex survives, since hw was retained. Every other deleted edge is a displayed rim base.

The eight rim edges cover all lost triangles. Proper-subgraph CS and minimum-CS equality force

    nu(K)=nu(G)-4, tau(K)=2nu(K), B(K).

In K the only possible edge among U vertices is hw. Consequently every old block meets U in at most one vertex, except that it may meet U in exactly the pair {h,w}.

## 2. Outside page apices cannot be h-neighbors

Every outside rim page has a base containing a C4 vertex, say a. If its outside apex x were adjacent to h, then x would belong to the same h-link component L. The edge ax would put x in the same component of L-w as a, namely the four-cycle, unless x=w. Both alternatives contradict x outside U. Hence

    every outside rim-page apex lies outside N_G(h).

This is the new retained-boundary compatibility fact. An old clique block containing both h and w cannot contain any such apex x. It therefore receives NO surviving spoke from any outside rim page: its only possible base endpoint is w, and its other endpoint x cannot be in that block.

## 3. A good disjoint page pair exists

The core B has the four-edge cover {ha,hb,wc,wd}. Let F_ext be the complete outside rim-page family. A cover of K, that core cover and any cover of F_ext cover G. Equality therefore forces tau(F_ext)>=4.

Apply the ordinary endpoint argument from pinned TUZA-15 main.md section5.3. The only bad pairs of rim bases are

    {ac,bd}, {ad,bc}, {wa,wb}, {wc,wd}.

They form a perfect matching on the eight bases. Every other pair is good, and B minus that pair has a three-triangle packing. The four representative good pairs and packings, with h,w in the source's hub/apex roles, are:

| good pair | three triangles avoiding it |
|---|---|
|ac,ad|haw, bcw, hbd|
|wa,wc|bdw, had, hbc|
|ac,wa|bdw, had, hbc|
|ac,wb|adw, hbd, hcw|

Swapping the two vertices within an opposite pair and exchanging the pairs covers every other good pair. The source's explicit endpoint/apex argument proves: if an outside-page family has no edge-disjoint pair on good bases, it has an edge cover of size at most two. This uses only actual pages on these eight bases and outside apices; it does not require hw to have been deleted. For adjacent bad partners, disjoint pages have distinct apices and no third base can occur. For disjoint bad partners with a common apex, any third-base page forces all pages onto the corresponding four-cycle at that apex, covered by two spokes; with distinct apices or no third base, the original two bases cover the family. An intersecting page family likewise has a two-edge cover.

Since tau(F_ext)>=4, select two edge-disjoint pages on good bases f,g and a displayed/symmetric local three-packing avoiding f,g. The five triangles are pairwise edge-disjoint.

## 4. The ENTIRE old footprint is avoidable

The local three-packing has no surviving edge other than possibly hw. If an old block contains hw, Section2 shows that neither outside page contributes any surviving spoke there. Its entire footprint is therefore at most the single edge hw.

Every other old block meets U at most once. Each outside page contributes at most one spoke, and if both contribute, the spokes share that unique U vertex. The local three-packing contributes no edge there. Thus its whole footprint is a star of at most two edges.

Maximum K4/K5 block packings avoid these entire footprints simultaneously. Appending the five selected triangles gives nu(K)+5=nu(G)+1, contradiction.

## Consequence and remaining scope

Combined with the ordinary apex-pseudoforest boundary theorem, any remaining apex-pseudoforest link must have AT LEAST TWO C4 components after deleting w, and w must see EXACTLY THREE vertices in EVERY component. A full-neighbor component is no longer a survivor.

The three-neighbor C4 has a different local count: its cone has packing number three and seven rim bases, leaving a one-unit deficit in the analogous deletion. This proof does not classify that near-tight residual or exclude the all-three-neighbor bouquet.

Dependencies: class-local minimum-CS accounting and elementary clique avoidance; the explicit good-pair page argument in `sources/public/papers/tuza-five-degenerate/main.md` section5.3, SHA6f89ec20ce3d954a5912cd19e5e2156fbcab87460bdc6eeb4d09b9bcdc55d59f. The retained-hw footprint extension is proved above and is not silently imported from the historical closed-component proof. No computation is used.
