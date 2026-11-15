# Tight frontier, forced matching edges, and a cover-critical discriminator

Supplement to the user-requested boundary critique, within the same TUZA-17 mission. The coordinator proposed the tight-frontier face argument; this critic independently checked it and developed the cover-critical consequence below. Collaborative internal AI proof development, not a separately commissioned final verification. Earlier frozen critiques are unchanged.

## Exact scope

Use the literal AC hypotheses: H is a finite simple graph rainbow triangle-edge-3-colourable on its FULL actual triangle family; X is a vertex subset; L=H[X] is triangle-free; G adds apex z with neighborhood exactly X. Let p=nu(G), m=mu(L), b=2p−tau(H). Suppose

    m=b−1.

Let R be the intersection of the edge sets of ALL maximum ordinary matchings of L. Thus R is a matching and R is contained in every chosen maximum matching M.

For any such M, put J=H−M, deleting matching EDGES. The previously proved frontier squeeze gives

    nu(J)=k=p−m,  tau(J) in {2k−1,2k}.

All references to tightness below mean the justified equality tau(J)=2nu(J), not an unrestricted equality assumption.

## Tight residuals require almost every matching edge to be forced

**Theorem.** If J is tight, then every edge of M belonging to an actual H triangle lies in R. Consequently

    |R| ≥ m−1.

**Proof.** Tightness, inherited triangle-edge colouring, and the declared Aharoni/HNS graphical equality consequence supply k edge-disjoint actual K4 blocks containing all J triangles. Since H[X] is induced triangle-free, each block has at most two X vertices; if two, their edge is the block's only possible link edge.

Take an edge e=xy in M supporting an H triangle Q=xyw. Its third vertex w is outside X, since otherwise L would contain a triangle. Suppose some maximum link matching N avoids e.

Q shares at most one edge with any J block. If it shared two, all three Q vertices would lie in that complete block, forcing e into J although it was deleted. Any shared edge is xw or yw: e is absent from J. Thus the shared edge, if present, has one X endpoint and one endpoint outside X.

A block contains at most one N edge. If it contains one, that edge joins its two X vertices. If it also shares an edge with Q, the two forbidden edges are DISTINCT and ADJACENT: the Q edge's X endpoint is one of the block's two X vertices. A K4 has a face avoiding both adjacent edges, namely the face opposite their common endpoint. If just one edge is forbidden, choose any avoiding face; if none, choose any face. This supplies one face from each block avoiding all N edges and all Q edges.

These k faces are mutually edge-disjoint even when block vertices overlap. Q meets none of them. Q contains no N edge: its only link edge is e, which N avoids. Therefore the k faces, Q, and all m apex pages on N are pairwise edge-disjoint. They give k+m+1=p+1 triangles in G, contradiction. Thus every old-supported edge of M lies in every maximum matching, as claimed.

Every H triangle absent from J contains an M edge, and that edge is old-supported, hence in R. Cover the k J blocks with two opposite edges each and add R. This covers all H triangles, so

    tau(H)≤2k+|R|.

But m=b−1 implies tau(H)=2p−b=2(k+m)−(m+1)=2k+m−1. Hence |R|≥m−1. QED.

**Audit points.** The two forbidden block edges are adjacent for a genuine graph-geometric reason; no general hypergraph claim is made. Every triangle family is complete, including the closure faces required by HNS exhaustion. The proof uses no assumption about vertex-disjoint blocks and permits arbitrary outside incidence. It constructs a packing LOWER bound to contradict the known optimum p. The cover is used only as an upper bound on tau(H), not asserted to be minimum.

## Forced matching intersection at the six-budget link parameters

**Lemma.** If a finite triangle-free graph F has mu(F)=5 and vc(F)=7, the intersection R of all its maximum matchings satisfies |R|≤1.

If no vertex is universally covered by maximum matchings, then R is empty: an edge in R would make both endpoints universal.

Otherwise let v be universally covered. Then mu(F−v)=4 and

    6≤vc(F−v)≤6,

where the lower bound is vc(F)≤1+vc(F−v) and the upper bound is the matching-four triangle-free estimate. The classification in BOUNDARY_CRITIC.md gives F−v as exactly two C5 components plus isolated vertices.

Triangle-freeness makes N(v) within each C5 independent, hence of size at most two. Any such subset fits inside a three-vertex minimum cover of C5: its complement has at least three vertices, among which some pair is nonadjacent; take the complement of that pair. If v had no neighbor among the isolated vertices of F−v, these two minimum cycle covers could cover every edge incident with v as well, giving vc(F)≤6. Thus v has an isolated neighbor w in F−v.

Now vw together with arbitrary maximum matchings in the two C5s is a maximum F matching of size five. Every cycle edge can be avoided by some maximum matching of its C5. All other v-incident edges are avoided by every matching in this displayed family. Hence the intersection of the displayed family is contained in {vw}; the intersection of ALL maximum matchings is smaller still. Thus |R|≤1. This explicitly accounts for isolated neighbors; dropping them would yield the incorrect stronger assertion R=empty. QED.

**Corollary.** In an eligible instance with b=6, m=5 and vc(L)=7, NO maximum matching M can give tight J=H−M. The tight theorem would require |R|≥4, contradicting |R|≤1. Therefore every such matching deletion is slack one:

    nu(H−M)=p−5, tau(H−M)=2(p−5)−1.

This is a necessary restriction on an actual numerical realization, not a proof that none exists. If such a deletion has a packing-essential edge, the earlier frontier-essential theorem already proves AC. Thus an AC failure in this stratum would require packing-edge-stable slack-one residuals for EVERY maximum link matching.

## General cover-critical edge discriminator

**Theorem.** In the frontier m=b−1, suppose |R|<m−1 and there is an edge f of L such that

1. f belongs to at least one maximum matching M of L;
2. vc(L−f)≤b.

Then AC holds.

Assume AC fails. Any minimum H cover containing f would leave residual vertex-cover number at most vc(L−f)≤b, so every minimum H cover avoids f. Consequently tau(H−f)=tau(H): if deletion dropped tau by one, a minimum residual cover plus f would be a minimum H cover containing f.

Choose a maximum M containing f. Delete f first at zero cover cost and the other m−1 matching edges at cost at most one each. With k=p−m,

    tau(H−M)≥tau(H)−(m−1)
      =2p−b−m+1=2p−2m=2k.

The usual packing-state bound and Aharoni give tau(H−M)≤2nu(H−M)≤2k. Hence J is tight. The preceding theorem then forces |R|≥m−1, contradiction. QED.

At b=6,m=5,vc(L)=7 the forced-intersection condition always holds by the preceding lemma. Thus it is enough to find one maximum-matching-allowed link edge f whose deletion lowers the ordinary vertex-cover number to six. This is a proved sufficient condition, not a claim that every possible link has such an edge.

## Explicit connected eleven-vertex link

For the verified link on Z/11Z with differences ±1,±4, use f=23. The five-set

    {0,2,3,5,8}

has exactly one edge in L, namely23. Hence it is independent in L−23 and vc(L−23)≤6. The five edges

    {23,45,67,89,(10,0)}

are an actual ordinary matching and therefore maximum, since L has eleven vertices. The independent controls in evidence/critic_boundary.json establish mu(L)=5 and vc(L)=7. All hypotheses of the cover-critical discriminator hold.

Therefore EVERY eligible apex instance having this exact link and budget b=6 satisfies AC. This does not establish whether some eligible H actually realizes b=6 with this link; it rules out AC failure there if such a realization exists.

## Remaining question and status

The first conditional numerical stratum not yet fully settled remains b=6,m=5,vc(L)=lambda=7, now subject to the restrictions above. Full closure by this method would require proving that every possible link in that class has an allowed cover-critical edge, or supplying another argument for a link without one. No passing finite search establishes that universal existence claim. A link-only counterexample to that helper would not itself be an AC counterexample.

Evidence: tight-frontier and general discriminator PROVED_USING_PUBLISHED_INPUT through the scoped Aharoni/HNS equality input; the matching-intersection bound and explicit link certificate PROVED_ORDINARY using the already fully proved matching-four classification. Historical originality UNESTABLISHED. No new computation was needed for the displayed matching and five-set. New Lean and independent_final_verification NOT_RUN.
