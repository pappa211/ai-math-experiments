> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Vertex avoidance in fresh K4 edge-gluing graphs

Status: ordinary all-size proof candidate, frozen for independent review. The arbitrary background-edge extension below is explicit; it does not permit additional actual triangles.

## 1. A general insertion interface

Let H satisfy tau(H)<=2nu(H). Suppose uv is absent, H+uv has a new triangle uvx, and

    nu(H-x)=nu(H).

A maximum packing in H-x is edge-disjoint from uvx: it contains neither spoke at x and cannot contain the absent edge uv. Therefore

    nu(H+uv)>=nu(H)+1,
    tau(H+uv)<=tau(H)+1<=2nu(H+uv)-1.                       (1)

Thus vertex avoidance at just ONE new-page apex gives strict insertion. This is a scoped sufficient condition, not an assertion that such an apex always exists.

## 2. Fresh K4 edge gluing has vertex avoidance everywhere

Start with one K4 and repeatedly attach a fresh K4 along an existing edge, with its other two vertices new and with no other edges added. If there are b clique pieces, then

    nu(H)=b, and nu(H-v)=b for every vertex v.               (2)

Every actual triangle is within a clique piece, by the fresh-vertex attachment rule. A packing therefore has at most one triangle per K4. Exact additivity follows inductively by choosing the new K4 triangle to avoid its attachment edge.

We prove the vertex-deletion assertion by induction. It holds for one K4, whose deletion of any vertex leaves a triangle. Attach Q on vertices a,b,c,d along old edge ab, with c,d new.

- If v is an old vertex other than a,b, take an old maximum packing avoiding v and a Q-triangle avoiding ab. They are disjoint.
- If v=a or b, take an old maximum packing avoiding v and the sole triangle Q-v. Their only possible shared old edge would be ab, which is absent from Q-v.
- If v=c or d, take an old maximum packing avoiding a (available by induction), and the triangle Q-v. The old packing avoids ab, so these combine.

Each case gives b triangles after deleting v, proving(2). Vertices outside the literal support can of course also be deleted without changing its packing.

The argument applies componentwise to a disjoint union of such triangle-support components, even if their graph vertices are shared: within each component use a maximum packing avoiding v; edge supports of distinct actual triangle components are disjoint. Add arbitrary background edges that belong to no actual triangle. The triangle family and both parameters remain unchanged, and the maximum packing can still avoid any specified vertex.

## 3. Strict one-edge insertion and the remaining residual

Let H have exactly the triangle family described in Section2, allowing the explicit vertex sharing and triangle-free background. It satisfies Tuza: choosing two covering edges in every clique piece gives tau(H)<=2b=2nu(H). Any added edge that creates an actual triangle therefore satisfies the strict bound(1), using any apex of a new page.

For completeness, the underlying H also satisfies combined CS. A support component with at least two K4 pieces has deficit at least one: its first gluing saves one cover edge, and each later gluing cannot decrease deficit, by the ordinary attachment identities. A one-piece component is K4. Additivity over actual triangle components then gives equality exactly for B(H). Consequently adding an edge creates strict inequality if it creates a triangle; if it creates none, CS is unchanged.

In particular, no minimum-CS edge residual G-e can have this entire triangle-support representation. Such a residual preserves nu(G), while restoring e creates a triangle and would increase packing by(1). For the one-cycle-cover equality question, a forest-cover residual cannot contain K5; hence the exact fresh K4/K5 defect-one classification, if this literal representation is available, reduces to the K4-only class excluded here.

The remaining bridge is the representation itself. An arbitrary connected, edge-resilient, defect-one forest-cover graph has not been shown to arise by fresh K4 edge gluings. This theorem does not bound or classify that unrestricted residual.

## Dependencies

Only elementary K4 packing/cover facts, the literal fresh attachment rule, and actual triangle-component additivity are used. The deficit monotonicity statement is proved in `notes/defect_one_fresh_clique_tree_classification_v1.md`, Section1, but the main strict insertion and vertex-avoidance proof above are independent of the finer classification. No computation is a premise.
