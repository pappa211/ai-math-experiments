# Validation V1 mathematical audit (sanitized extract)

The mathematical reconstruction and density input mapping below are retained from Validation V1. They are internal audits, not external specialist review. Operational records remain private.

## Primary theorem: reconstruction

Let G be finite, simple, and undirected; T a graph triangle; U=V(T); and H=G−E(T). A triangle is identified with its three graph edges. For a triangle family F, nu(F) is its largest edge-disjoint subfamily, and tau(F) is its smallest edge transversal. Empty families have both numbers zero. Write D(J) for the hypergraph with vertex set E(J) and all graph triangles as hyperedges.

### Imported input A: the tripartite inequality

Ron Aharoni, *Ryser's conjecture for tripartite 3-graphs*, Combinatorica 21 (2001), 1–4, DOI https://doi.org/10.1007/s004930170001. A finite 3-partite 3-uniform hypergraph satisfies tau≤2nu. The publisher record was checked; the original PDF is subscription-restricted in the retrieved version, so its original theorem number has not yet been verified. A fully accessible published-source formulation and rederivation is Haxell–Narins–Szabó (HNS), Section 3, Proposition 3.2(iii) and the paragraph immediately following its proof, author-manuscript p. 9. No fractional-to-integral substitution is involved.

### Imported input B: HNS equality characterization

Penny Haxell, Lothar Narins, Tibor Szabó, *Extremal hypergraphs for Ryser's conjecture*, J. Combin. Theory Ser. A 158 (2018), 492–547, DOI https://doi.org/10.1016/j.jcta.2018.04.004. Author manuscript https://page.mi.fu-berlin.de/szabo/PDF/ryser.pdf (18 March 2018), Theorem 1.1, manuscript p. 3; Definitions 7.1–7.4, pp. 19–20; Proposition 7.5 and its proof, p. 21. The earlier arXiv:1401.0171v3 (20 June 2016) has different numbering; do not mix the two.

The imported assertion is: a 3-partite 3-uniform hypergraph with tau=2nu admits a home-base partition. Multiplicities are permitted in HNS, so simple hypergraphs are included. Isolated vertices can be put in W. The zero-matching case is also immediate without the theorem.

### Derived consequence: disjoint loose cycles (verified from formal definitions)

Write the partition as (F,R,W). Definition 7.1 gives |F|+|R|=nu. For each i=1,2,3, choose a matching in the auxiliary bipartite graph B_i saturating R, as required by Definition 7.2. For each R={r1,r2,r3}, let w_i(R)∈W∩V_i be its matched vertex. The hyperedges {r2,r3,w1}, {r1,r3,w2}, {r1,r2,w3} exist. Their six vertices are distinct: W is disjoint from every R, and the three w's lie in distinct parts. Their pairwise intersections are the distinct singleton r's.

For different R's, matched w_i's differ within each i; across i they differ by the partition into V_i. Thus the six-vertex supports are disjoint. They are also disjoint from every F piece. Each truncated multi-Fano piece contains a loose cycle obtained by selecting three of its four underlying distinct hyperedges. Selecting one cycle per F piece and per R piece gives exactly nu vertex-disjoint loose 3-cycles. This is also the specific construction used in the proof of Proposition 7.5. No unproved compatibility among the three auxiliary matchings is required.

### Derived consequence: graph K4's (verified)

Three graph triangles forming a loose cycle have distinct shared edges. Name two of them uvx and uvy, with u,v,x,y all distinct. The third contains an edge in {ux,vx} and one in {uy,vy}, since the pairwise intersections differ from uv. These two edges must intersect, as they are edges of a triangle. The cross choices ux/vy and vx/uy are disjoint and impossible. Therefore the third triangle is uxy or vxy. The union of the three triangles is precisely all six edges of the K4 on {u,v,x,y}. Vertex-disjoint loose cycles in D(H) therefore yield edge-disjoint K4's in H. They need not be vertex-disjoint in H.

This proves the exact equality consequence used: if D(H) is 3-partite and tau(H)=2nu(H), H contains nu(H) pairwise edge-disjoint K4's. No assertion that all triangles decompose into these K4's is needed.

### Independent-set face selection (verified)

U is independent in H because G is simple and all three possible edges within U were deleted. A K4 in H contains at most one element of U. Deleting that vertex from the K4, or choosing any face if there is no such vertex, gives a triangle disjoint from U. Selecting these faces produces a packing P of size nu(H), every edge of which has both endpoints outside U.

### Intersecting-family lemma (verified for arbitrary subfamilies)

This auxiliary statement is already known: Aharoni–Zerbib, *A generalization of Tuza's conjecture*, arXiv:1611.07497v7, Propositions 3.2 and 3.7 (k=3). It is independently proved here for clarity and in Lean; no novelty is claimed for this lemma.

Let F be nonempty and pairwise edge-intersecting. A singleton needs one covering edge. Otherwise choose distinct abc,abd∈F sharing ab. A member avoiding ab must have an edge from {ac,bc} and an edge from {ad,bd}; the disjoint cross pairs cannot belong to one triangle. Such a member must be acd or bcd. If none exists, {ab} covers F. Otherwise cd exists and {ab,cd} covers F. This proof does not assume F includes the fourth face of a K4 or all ambient graph triangles.

### Lifting (verified)

Put h=nu(H), and let F be the triangles of G absent from H. A maximum H-packing together with T gives nu(G)≥h+1. Input A gives tau(H)≤2h. If tau(H)<2h, integrality and the cover E(T) give tau(G)≤tau(H)+3≤2h+2≤2nu(G).

If tau(H)=2h, choose P as above. Each Q∈F contains an edge of T and therefore at least two vertices of U. Since Q has only three vertices, every edge of Q touches U. Consequently P is edge-disjoint from every Q∈F simultaneously. With r=nu(F), this proves nu(G)≥h+r. T∈F, so r≥1. If r=1, the family lemma gives tau(F)≤2. If r≥2, E(T) gives tau(F)≤3≤2r. A cover of H united with a cover of F covers G; hence tau(G)≤2h+2r≤2nu(G). When h=0 the same proof uses the empty P; when nu(G)=0 the theorem's triangle premise cannot hold.

Verdict at this milestone: **CONFIRMED as an ordinary mathematical deduction from the identified published inputs**. This is not an independent formal verification of those inputs. No gap located in the new elementary argument.

## OCT-four: independent derivation

Take S of size at most four with G−S bipartite. If G[S] is bipartite, use two colors on S and two disjoint colors on its complement. If G[S] is nonbipartite, a shortest odd cycle has length three because |S|≤4; let T be that triangle. After deleting E(T), all remaining edges inside S are incident to the possible fourth vertex, hence form a subgraph of a star. Thus H[S] and H−S are bipartite and H is four-colorable.

A proper four-coloring of J induces a rainbow three-coloring of its triangle edges: label vertex colors by F_2^2 and an edge by the nonzero sum of its endpoint colors. The sums in a triangle are nonzero and distinct. Thus D(J) is 3-partite. Apply Input A in the first case and the lifting theorem in the second. This covers all bipartite configurations, triangle plus isolated vertex, paw, diamond, K4, and sets of fewer than four vertices. Verdict: **CONFIRMED**, with the same published inputs.

## Separation from ordinary four-colorability

The primary theorem uses only 3-partiteness of D(H). It has no vertex-coloring premise. K5 satisfies its hypothesis: deleting any triangle leaves a graph with color classes V(T), {d}, {e}. K5 itself is not four-colorable. More strongly, attach a triangle-free graph of chromatic number five by a bridge to a triangle component: its triangle hypergraph remains 3-partite while the ordinary graph is not four-colorable. A concrete bounded example will be retained in the sanity checks.

## Density: separate complete audit

The main audit reconstructed Liu–Zeng arXiv:2610.15539v1 (11 October 2026), Theorem 1.3 and its complete proof, independently of the primary-theorem assessment. A separately delegated reviewer then checked Lemmas 2.4–2.6 and all three cases; its full derivation is in INDEPENDENT_DENSITY_AUDIT.md. Agreement is not the justification: the load-bearing estimates are recorded there explicitly.

The exact supported statement is: for each fixed real c<5/2 there exists N(c) such that every finite simple n-vertex graph with n≥N(c) and e(G)≥n²/4−cn satisfies tau(G)≤2nu(G). The endpoint c=5/2 and a threshold uniform as c approaches 5/2 are not established.

The large-packing case, nu≥10^−5 n², uses finite LP duality and the published fractional-packing approximation nu*−nu=o(n²). Haxell–Rödl's original source is Combinatorica 21 (2001), 13–38, DOI https://doi.org/10.1007/s004930170003; its original theorem number remains inaccessible. An exact accessible alternative is Raphael Yuster, *Integer and fractional packing of families of graphs*, Random Structures & Algorithms 26 (2005), 110–118, author manuscript https://math.haifa.ac.il/raphy/papers/fracpack.pdf, Theorem 1.2, p. 2, with the family {K3}. Its convention excluding isolated vertices is harmless: remove isolates, apply the asymptotic result when the remaining order is large, and absorb bounded-order fractional packings into eta n² otherwise. Theorem 1.1 in Yuster is his restatement of Haxell–Rödl, not an original-source theorem number.

In the intermediate case n^(2/3)<nu<10^−5 n², the triangle-free density deficit is at most 3n+3nu for all c<5/2. The exchange argument and partition produce

    (tau−nu)/nu ≤ 120√3 n^(−1/6) + 120√(3·10^−5)
                 + 7200n^(−2/3) + 7200·10^−5 < 1

eventually; the constant terms total approximately 0.7292670690.

The small case is **nu≤n^(2/3)**. Phase 1's strict wording omitted equality; this boundary belongs in the small case, as in the source. This is the one presentation correction found. After the edge-minimal reduction to G', the construction yields an internal vertex cover of size s≤100 and witnesses totaling at most 10200 vertices. Counting disjoint sets of missing cross edges gives the explicit estimate

    (s/2−c)n ≤ 104,029,803 n^(2/3) + 200√(10n) + 1,034,950.

For each fixed c<5/2 this excludes s≥5 when n is large. OCT-four applies to G', and restoring the removed edges gives tau(G)≤nu(G)+nu(G')≤2nu(G). No use of the density conclusion was made in proving the primary theorem or OCT-four. Negative c follows from c=0.

Verdict: **CONFIRMED as an ordinary mathematical deduction from OCT-four, finite LP duality, and the identified published fractional approximation.** The explicit details, including preparatory lemmas, exchange cases, constants, and a sufficient asymptotic order threshold, are in the independent density note. No Lean proof of density is claimed.
