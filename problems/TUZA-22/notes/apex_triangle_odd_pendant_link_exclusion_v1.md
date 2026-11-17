> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Apex triangle with an odd pendant path: full CS link exclusion

Frozen ordinary proof candidate, 2026-11-16. All neighbors of the apex along the pendant path are arbitrary, as are all outside pages in the ambient graph. This is an unbounded equality argument, not a fixed-core census.

## Statement and balanced deletion

A minimum combined-CS failure G, globally or within an edge-subgraph-hereditary class, has no closed link component L at h with a vertex w such that F=L-w consists of a triangle abc and one odd pendant path

    a=x0,x1,x2,...,x_(2t+1)=z,  t>=0.

The only edges of F are the triangle edges and the path edges. Edges from w to vertices of F are arbitrary, subject to the actual minimum degree two of L. In particular wz is present because z is a leaf of F.

Put r=t+2 and choose

    P={bc, ax1, x2x3, x4x5,...,x_(2t)x_(2t+1)},
    Q={w,a,x2,x4,...,x_(2t)}.

Both have size r. The set P is a matching, and Q covers L-P: in F the uncovered matching complement consists of ab,ac and the edges x1x2,x3x4,...,x_(2t-1)x_(2t), while all w-edges meet w in Q.

Delete all h-spokes to L and all P edges, giving K. The r hub triangles on P append to any K packing. The edges P together with the h-spokes to Q cover every triangle lost in this deletion, including arbitrary pages on the deleted rim edges. Minimum-CS accounting therefore gives

    B(K), nu(K)=nu(G)-r.

The only possible K4 subgraph of L is {w,a,b,c}, since deleting w from any K4 would leave a triangle of F, and abc is F's only triangle. Its edge bc is deleted in K. Thus every residual K4/K5 block contains at most THREE vertices of L.

## 1. If w sees b or c, a rim triangle augments

Suppose wb is present (the wc case is symmetric). The matching

    Z=(P-{bc}) union {wb}

has size r and avoids every edge of the actual triangle T=abc. The hub triangles on Z and T are pairwise edge-disjoint.

In an old residual clique block, Z contributes at most one edge because the block has at most three L vertices. The triangle T contributes at most one surviving edge: if both ab and ac belonged to one clique block, its edge bc would also be present, contrary to its deletion. If the two footprint edges were disjoint, the block would contain four L vertices, impossible. Therefore the ENTIRE footprint is at most a two-edge star in each old K4/K5 block. Choose maximum block packings avoiding these stars and append r+1 triangles, contradicting nu(G).

Hence a surviving case would have neither wb nor wc.

## 2. The edge bc has no further page

Suppose bcy is an actual G triangle with y outside {h,a}. Since b,c have no link neighbors except each other and a, the vertex y is outside all of N_G(h): a vertex of N(h) adjacent to b or c would belong to the same closed link component, and w is adjacent to neither. In particular the page spokes by,cy survive in K.

Use the alternate matching

    P'={ab,wz,x1x2,x3x4,...,x_(2t-1)x_(2t)},

which has size r and avoids bc. Its hub triangles are edge-disjoint from bcy.

Each residual block contains at most one P' edge and at most one page spoke, the latter because bc is absent. Suppose a P' edge and a page spoke were disjoint in one block. The block would then contain b (or c) and two further L vertices adjacent to it. But its only two L neighbors are a and c (respectively a and b), and the edge bc is absent in K. Such a residual clique cannot exist. Thus again the entire selected footprint is at most a two-edge star per block. Maximum block packings plus these r+1 new triangles contradict nu(G).

Therefore the only actual triangles on bc are hbc and abc. This conclusion includes every outside page; it was not inferred from the displayed link alone.

## 3. A cover substitution forces old-support overlap

The standard extension cover was

    X=P union {hq:q in Q},   |X|=2r.

Replace its two edges ha,bc by hb,ac, obtaining X'. This still covers every triangle lost in forming K.

To check exactly what changed, a lost triangle previously relying on bc is hbc or abc by Section2, now met by hb or ac. A lost triangle previously relying on ha has its third vertex among a's actual link neighbors b,c,x1,w. The respective triangles hab,hac,hax1,haw are covered by hb,ac,ax1,hw (with haw considered only when aw is present). All other removed rim-edge pages retain their P-edge cover, and every other hub triangle retains its original covering edge. Thus arbitrary outside pages on the OTHER deleted matching edges are still accounted for.

The edge ac survives in K. If it lies in any actual K triangle, it lies in a literal K4/K5 component of B(K), which has a minimum cover containing ac. Choose such a minimum K cover. Its union with X' then has size at most

    2nu(K)+2r-1 = 2nu(G)-1,

contradiction. Symmetrically, replacing ha,bc by hc,ab gives the same contradiction if ab is triangle-supported in K.

Hence neither ab nor ac is triangle-supported in K.

## 4. The final case has a peelable K4 boundary

Consider the literal K4 D=G[{h,a,b,c}]. Its edges hb and hc have no outside page, by closedness and the link-neighbor list of b,c. Its edge bc has no outside page by Section2. An outside page on ab or ac would have its third vertex outside N(h) and outside the pendant path, because b,c have no other F-neighbors and neither sees w. Both of its spokes would survive the deletion defining K, making ab or ac triangle-supported in K, which Section3 excluded.

Thus the ENTIRE actual outside-triangle boundary of D is contained in the single edge ha. This is a star-contained K4 boundary. The accepted `k4_star_boundary_peeling_v1.md` excludes such a patch from a minimum CS failure, contradiction.

All cases are exhausted, proving the theorem.

## Scope and reusable mechanism

The arbitrary w-neighbor set may create unboundedly many additional branch vertices and triangles along the path. Those are handled by the fixed inclusion of w in Q and remain covered throughout the substitution. The proof does not rely on the four-branch finite theorem or on triangle-free WKE/Kotzig.

The new equality mechanism is: an alternate matching first rules out pages on one deleted base; a literal two-edge cover substitution then moves the extension cover onto a surviving residual edge, forcing a shared-edge saving if that edge has old triangle support. If all candidate overlap edges lack support, the complete outside boundary becomes a safe K4 star and peels. Each branch uses all actual triangles.

This removes the one-branch, triangle-cycle case of the perfect unicyclic remainder morphology. It does not classify the remaining even-cycle near-wheel forms, the two-/three-branch perfect forms, or the nonperfect unicyclic branch.

Dependencies: authenticated class-local M0/codegree/clique cover and avoidance facts; `k4_star_boundary_peeling_v1.md` (SHA 26c998ac69fa3a8225fabb96830bf25ecc66f922614186075c7a9370e83039dc). The morphology context is `apex_unicyclic_perfect_remainder_restriction_v1.md` (SHA 64effb6b26ceabbb06b3507282fd6d3e487c6c6c6cf4ad500015d882958461ce), but the present proof stands at its own exact hypotheses.
