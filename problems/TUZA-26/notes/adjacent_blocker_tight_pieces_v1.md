> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Adjacent blocker restoration has a genuine clique leaf, or no tight piece

Frozen ordinary candidate v1, 2026-11-16. Independent review required. The final no-tight-piece conclusion is conditional on the separately reviewed degree-three and K5 triangle-leaf exclusions. All edges and crossing triangles are retained.

Let Q be the conditional minimum unknown support. Let {ab,ac} be a packing-blocker pair, with a,b,c distinct. Suppose R=Q-{ab,ac} is single-edge resilient. Proper CS and the blocker equations make R defect one with exactly one active component C, named C12 by explicit Q minimality, and otherwise literal tight K4/K5 triangle components. The only new triangles are ordinary pages on ab/ac and possibly abc when bc is old.

## Complete old tight boundary

Fix an old tight component D. Let F be all D edges used in Q triangles outside D. Old R triangles outside D share no D edge. The whole-one-base footprint lemma supplies at most one D edge over the ENTIRE ordinary ab-page family, and at most one over the ac-family. The only additional possible boundary edge is bc from abc. Therefore |F|<=3.

A size-two F cannot consist of opposite edges. If both edges come from ordinary pages, the two adjacent-base footprints are incident: in a D containing a they are an a-star; otherwise hypothetical disjoint bx,cy put x,y in D and old ax,ay yield an old triangle axy sharing xy with D, forcing the absent a into D. If one boundary edge is bc, the ordinary footprint shares b or c with it because a cannot be in D. Hence the accepted tight-boundary theorem excludes every |F|<=2 case, including K4: its only unexcluded opposite-pair case cannot occur here.

Thus |F|=3. It consists of bc and the two distinct ordinary footprints. Since bc lies in D, a does not. Write the ordinary footprints bx and cy, with ax,ay old. If x!=y, the old triangle axy again forces a into D, contradiction. Hence x=y and

    F={bc,bx,cx}, a literal triangle in D,

with x outside {a,b,c}. Both actual pages abx and acx occur. Every old tight component must have this three-edge form and contains the same actual old edge bc. Distinct old triangle components cannot share that edge. Consequently there is at most ONE old tight component D.

## It can share with the named active component only on its boundary triangle

A literal old tight component meets C in at most one vertex. Indeed two shared vertices u,v would give the old edge uv inside D; the universal support vertex of C completes an old triangle through uv (or uv is already a universal spoke), merging D and C, impossible.

Suppose D's possible intersection with C is outside {b,c,x}, including the possibility of empty intersection. Thus b,c,x are not C vertices. Triangle connectivity of Q requires at least one new triangle using a C edge, because C is a distinct old R triangle component. Such a triangle cannot be abc (its only old edge is bc in D), nor one with only outside-C endpoints. It must be, after interchanging b,c if needed, an ordinary page aby with a,y in C and old spoke ay in C.

The apex y cannot lie in D: then the page uses by in D, and because y is not one of b,c,x this would be an additional D boundary edge, contrary to the complete F. Thus y is outside D. The other ordinary page acx is known to exist. The two pages aby and acx are edge-disjoint, since their distinct apices y,x lie outside {a,b,c}. Their old supported footprints are exactly ay in C and cx in D: by and ax are outside both old component supports, hence background. There are no further old triangle components.

Choose a maximum C packing avoiding ay (C is resilient) and a maximum D packing avoiding cx. Append both new pages. This gives nu(R)+2 triangles, contradicting that the restored blocker pair gains exactly one packing unit. Therefore

    D intersect C is contained in {b,c,x}.

In particular no vertex of D outside this boundary triangle belongs to any other old component.

## The private vertices really are private in Q

Let z be a D vertex outside {b,c,x}. It cannot be a restored-base terminal: b,c lie in the boundary and a is outside D. If an outside Q triangle contained z, it would either be old, making z a C vertex (there is no other old component), or a new ordinary page with z as its apex. Such a new page would use bz or cz, an extra D boundary edge, impossible. The two-new triangle abc does not contain z.

Thus every triangle containing z lies entirely in D. Since every Q edge is triangular, z has no edge to a vertex outside D. For D=K4 there is one such vertex of degree three; for D=K5 there are two, each of degree four, adjacent to each other and to exactly the boundary triangle. This is a genuine fresh clique attachment along the triangle {b,c,x}, with a complete verified vertex boundary. It was not inferred solely from having three boundary edges.

## Exact role in the global chain

If the completion-free degree-three exclusions are accepted, the K4 option is impossible in minimum Q. If the K5 triangle-leaf exclusion (notes/apex_k5_triangle_leaf_v2.md) is accepted, the K5 option is also impossible. Therefore, conditional on those named accepted transfers, an ADJACENT blocker-pair residual has no tight component: its entire triangle support is exactly one C12 active support C, with arbitrary retained background.

For a DISJOINT blocker pair, the separately treated opposite-K4 boundary argument supplies the corresponding no-tight-piece conclusion. Neither conclusion supplies a blocker pair in a no-blocker core. The new remaining interface is two-edge restoration over ONE frozen named support, with a proved finite vertex confinement still to be established/checked. Global R and unrestricted Tuza remain OPEN.
