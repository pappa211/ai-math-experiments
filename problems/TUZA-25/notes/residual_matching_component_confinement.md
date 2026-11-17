> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Matching reconstruction: tight components have a one-edge boundary

Frozen ordinary proposition for fresh review, TUZA-25. This is an actual-region transfer in the remaining zero-gain K5-on-K4 reconstruction. It does not classify the active region or identify shared vertices as fresh.

## Hypotheses and notation

Let A={a,b,c,d} be a literal K4 in J and M={ab,cd}. Every actual triangle of J lies in a literal K4. Form H by adjoining one vertex x with exactly the new triangle-support neighbors A, so the entire new triangle family through x is {xuv: u,v in A}. Any background edges are retained and create no additional actual triangles outside this stated family. Assume H has connected nonempty shared-edge triangle support. Put R=J-M. Assume R has exactly one defect-one triangle component C and all its other nonempty triangle components are literal K4/K5 supports. This component profile follows from the reviewed matching-deletion resilience theorem, proper-subgraph CS, and component additivity; here it is an explicit premise.

Let Q range over those tight K4/K5 components of R. Let D_Q be the edges of Q belonging to any actual H triangle not wholly contained in Q.

Then:

1. D_Q is contained in E(Q) intersect {ac,ad,bc,bd}, and has size at most one.
2. Connected triangle support forces every D_Q to be a single edge. These boundary edges are distinct, so there are at most four tight Q components.
3. Delete only E(Q) minus D_Q for every such Q, retaining all vertices, shared vertices, boundary edges, and all background edges. Call the resulting graph K, and let F be the set of boundary edges. With r=sum_Q nu(Q),

       nu(H)=r+nu(K),
       tau(H)=2r+tau(K-F).

   In particular tau(H)<=2r+tau(K). The active graph K retains every outside triangle, has connected triangle support, and includes the literal K5 on A union{x}.
4. If H is single-edge packing-resilient, so is K. If every H triangle extends to a maximum packing, the same holds for K. If H has defect one and K satisfies CS, then K has defect zero or one. None of these statements says K belongs to a named model family.

## Confinement of all external-apex pages

Every J triangle absent from R uses exactly one M edge, because the two M edges are disjoint. Consider a page abz with z outside A. A K4 completing it in J contains ab. It cannot contain cd: a K4 containing both disjoint edges has precisely vertex set A, which excludes z. Its surviving K4-ab diamond therefore remains entirely in R. All five diamond edges are triangle-supported in one R component, which contains a and b. That component cannot be a tight literal K4/K5 support, because such a support containing both endpoints would contain the absent edge ab. Therefore it is the unique active component C. In particular both old spokes of every external-apex ab-page lie in C. The same holds for cd-pages.

Thus no external-apex restored M-page uses any Q edge. A restored M-page whose apex lies in A uses only old A-crossedges. A new x-page likewise uses at most one old A-crossedge (its base); if its base is in M, that base was absent from R and cannot belong to Q. Old R triangles outside Q share no edge with Q. These cases exhaust every actual H triangle, proving

    D_Q subset E(Q) intersect {ac,ad,bc,bd}.

The clique Q cannot contain both a,b or both c,d, since those pairs are absent in R. Hence it contains at most two vertices of A, one from each missing pair, and at most one A-crossedge. This proves1.

If D_Q were empty, its triangles would remain a separate H triangle component. The active defect-one component of R is nonempty, so H has triangles outside Q; this contradicts H triangle connectivity. Distinct R triangle components have disjoint edge supports. Their single boundary edges are therefore distinct members of the four A-crossedges, proving2.

## Exact packing and cover transfer

By the definition of D_Q, deleting E(Q) minus D_Q removes no outside triangle. A retained Q edge set has only one edge, so it contains no Q triangle. Thus the actual triangles of K are exactly the H triangles outside the selected Q pieces. Vertex sharing is unrestricted in this accounting.

A maximum K4/K5 packing avoids any prescribed edge. Choose a maximum Q packing avoiding its boundary edge f_Q. It is disjoint from K and from all other Q supports. Such packings append to any K packing. Conversely partition any H packing into its Q triangles and its K triangles. This gives nu(H)=r+nu(K).

For the cover identity, fix any K cover D. In Q, a minimum cover has size2nu(Q), can be chosen to contain f_Q, and can also be chosen to omit f_Q. Therefore the least additional cover cost outside K is exactly

    sum_Q [2nu(Q)-1_{f_Q in D}].

The restriction of every H cover to K is a K cover, so minimizing gives

    tau(H)=2r+min_{D covers K} (|D|-|D intersect F|).

All F edges have zero cost in this last objective. They may all be included, after which precisely the triangles of K-F remain to be covered at unit cost. Therefore the minimum is tau(K-F), proving the exact formula. The one-edge cover-eligibility rule is the special case |F|=1; no unproved simultaneous eligibility assumption is used.

For every e in E(K), the same packing partition and Q packings avoiding their entire K boundary give

    nu(H-e)=r+nu(K-e).

This remains valid when e is a boundary edge, because the chosen Q packing already avoids it. Thus H resilience implies K resilience. Exact packing additivity also implies that a maximum H packing containing any prescribed K triangle restricts to a maximum K packing containing it.

Each removed Q meets the outside triangle family through only one edge. It cannot join two different K triangle components. Since H is triangle-connected and some outside triangles exist, K is triangle-connected. Every K5 triangle on A union{x} belongs to the outside family: every old A triangle uses a missing M edge, and every x-triangle is new. Hence that whole K5 remains in K.

Finally, if H has defect one, the cover identity and packing identity give

    tau(K-F)=2nu(K)-1.

Monotonicity and CS(K) yield 2nu(K)-1<=tau(K)<=2nu(K), so K has defect one or zero. If any Q was removed then K is a proper edge-subgraph of H, making proper-edge minimality legitimate for a CS premise. This supplies no named-model classification by itself.

## Boundary and stopping point

The Q pieces may share vertices with K beyond the two endpoints of f_Q; all such vertices and all background edges have been retained. A one-edge triangle boundary is NOT automatically a fresh graph-edge gluing certificate. Likewise the active graph K may retain substantial background and the restored matching interface. Membership in C12/frozen F, a reconstruction theorem eliminating the zero-gain configuration, and a valid classification induction remain additional obligations.

The result reduces any nontrivial tight-component part of this matching reconstruction to an explicit proper active graph with exact packing and cover response. If R has no tight components, no reduction occurs here: K=H, r=0, F is empty. The remaining active defect-one core must still be reconstructed, and this proposition does not replace that obligation.
