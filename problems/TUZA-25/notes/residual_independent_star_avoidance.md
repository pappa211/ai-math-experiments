> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent-star avoidance in fresh edge-glued clique graphs

Frozen ordinary lemma for independent review. This is for the archived literal F_edge construction, not all chordal graphs or all of frozen F. It may be useful for the critical-edge reconstruction; no availability or novelty claim is made.

Let S be obtained from one K4 or K5 by repeatedly attaching a fresh K4/K5 along an existing edge, adding no other edges. Let H have exactly S as its actual triangle support, with arbitrary triangle-free background retained. Let x be any vertex and I any independent set of H not containing x. Then a maximum H triangle packing avoids every edge from x to I.

Proof. The case x outside S is immediate. Choose a construction tree of clique pieces: each newly attached piece selects as its parent any earlier piece containing its attachment edge. Adjacent pieces intersect exactly in that edge. For each graph vertex z, the pieces containing z form a connected subtree: a newly attached piece can contain an old z only if z belongs to its attachment edge, hence to its parent. This running-intersection property persists inductively.

Root this tree at any piece containing x. Reorienting the tree still gives a fresh edge-gluing order. Indeed, in a traversal away from the root, any vertex of a new piece already present in an earlier piece must occur along their tree path, hence in its parent separator; the reverse containment is automatic. Thus its entire intersection with all previously added pieces is exactly its parent edge.

A piece contains at most one vertex of I, since it is complete. Hence it contains at most one forbidden spoke at x. If a non-root piece contains x, the parent edge contains x: the path to the root lies in the connected x-subtree. Its forbidden spoke and parent edge therefore form a star with at most two edges. A maximum K4 packing avoids that star; a maximum K5 packing avoids any two prescribed edges. A piece not containing x need only avoid its parent edge. The root need avoid at most one forbidden spoke.

Choose these maximum piece packings in tree order. Every non-root packing avoids its entire edge intersection with all earlier pieces, so the choices are globally edge-disjoint. Every actual triangle of S lies in exactly one piece, giving the upper bound that any packing has size at most the sum of the piece packing numbers. The chosen union attains that bound and avoids the whole specified star. Background edges occur in no old triangle and are automatically avoided. This proves the lemma.

## One-edge insertion consequence

If uv is absent from H and H+uv contains any new page uvx, the old spokes ux,vx form a star whose outer set {u,v} is independent. The lemma supplies an H maximum packing avoiding both spokes. Appending uvx gives

    nu(H+uv)=nu(H)+1.

The reverse bound follows by removing the at-most-one packing triangle using uv. Thus EVERY particular new page extends to a packing of this size. This is stronger than existence of one useful page, and it uses all actual graph semantics.

For defect-one H in this construction class, cover extension gives tau(H+uv)<=tau(H)+1=2nu(H), so the added graph has defect at least two. A triangle-bearing neutral edge insertion (unchanged nu and tau) is impossible in this entire construction class, including arbitrary retained background.

This conclusion does not hold for all resilient defect-one graphs: K5-e becomes K5 on insertion of its missing edge, without increasing packing. It does not assert anything about non-edge fresh clique overlaps, unknown three-connected cores, or restoration of three independent pages simultaneously.
