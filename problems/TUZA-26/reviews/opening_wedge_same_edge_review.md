> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: actual-Q exclusion of the same wedge-edge deletion

Verdict: PASS, PROVED_ORDINARY for notes/matching26_critical_wedge_same_edge_v1.md, SHA-256 25f489b38510129da74f2225aa4915ab62802eea2e3d8dbfebe4779d0403e90d. This uses the actual degree-four cap restoration and does not exclude the corresponding local A profile by itself. No computation or Lean verification was needed.

The cover increase two over B forces a bare ordinary xz-page xzw. Its apex is not y, because yz is the other restored base; not u or v, whose x spokes are absent in A; and not c, which was removed. It is therefore outside all six named restoration vertices.

For a literal B clique D avoiding x,y,z, c is absent or isolated and D contains at most one of u,v, since uv is absent. The complete restored edge list is exactly xz,yz,uv,ux,vx,uy,vy,cu,cx,cy,cz. Ordinary xz/yz pages contribute no D edge; ordinary c-edge pages do not exist because c has no old spokes; uv-pages have only apices x,y and are fully restored at their other edges. Of the four remaining bases, only those incident to the possible old terminal u or v can contribute. Each whole family contributes at most one D edge, giving at most two incident edges.

A triangle using two or more restored edges has all its vertices among the six restoration terminals. Its possible old third edge therefore cannot belong to D, which contains at most one such terminal. Old B triangles outside D share no D edge. Thus the boundary calculation includes ALL actual Q triangles and yields the paid at-most-two-adjacent-edge exclusion. Every old clique avoiding x,y,z is removed.

If the bare apex w belonged to a remaining old clique, that clique meets x,y,z. Meeting x or z would support one of its bare spokes. Meeting y would supply yw, and old xy,xw,yw would form an old triangle through bare xw. Thus w lies in no B triangle component. The same old-triangle argument shows yw is absent altogether; it is not one of the restored edges, so it remains absent in Q.

In A the only new triangle through w is xzw: the other base yz would require absent yw, and the mixed triangle xyz does not contain w. Therefore its only A-supported incident edges are xw,zw, though arbitrary other A background edges have not yet been discarded.

No c-triangle can contain w because c's exact four-neighbor list excludes it. Any further Q triangle through w uses one of uv,ux,vx,uy,vy. Since w is outside their endpoint set, it must be an ordinary-page apex. The absent yw rules out the y bases; an uv-page would make w a third common neighbor. Consequently every Q neighbor of w is in{x,z,u,v}. It cannot meet both u,v by codegree two. Triangle-supportedness now forces degree at most three, contradicting the stated minimum degree four.

This derives the necessary isolation of the bare apex from complete boundary and actual triangle support; it does not assume that a bare apex is a private vertex. The local bare-book countercontrol is preserved and is excluded only by these actual-Q premises.

Combined with the independently reviewed background-yz lemma, this leaves exactly f=zt or f=yt, yz background in B and yzt an actual triangle. Payment of those star/path cases and cap availability remain open.

Frozen UTC: 2026-11-17T00:13:29.606519+00:00
