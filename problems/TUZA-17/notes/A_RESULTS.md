# Track A — strengthened obstruction and separator reconstruction

Status: ordinary proofs below; originality UNESTABLISHED. This scout inherited the coordinator context and is not an independent blind auditor. No Lean claim. Independent final verification NOT_RUN. All graphs are finite simple, every triangle is actual, and packings are edge-disjoint.

## A. Exact colour cost for independent blow-ups

For an r-colouring f of V(B), let m_r(B) be the minimum number of monochromatic B edges. For positive integer t, replace every B vertex by an independent class of t clones, and every B edge by the complete bipartite graph between its classes. Denote the result B[t]. Then

    min_r-colourings of V(B[t]) (# monochromatic edges) = t^2 m_r(B).

Proof. Given ANY colouring of the clones, independently select a uniformly random representative from each clone class and colour the original B vertex by that representative's colour. If x_vi clones of v have colour i, the expected number of monochromatic B edges is

    sum_{uv in E(B)} sum_i x_ui x_vi / t^2.

Every outcome has at least m_r(B) monochromatic edges, proving the lower bound. Conversely lift an optimal B colouring uniformly to the clones; each monochromatic base edge contributes t^2. This proof does not assume twins receive the same colour; it proves they cannot improve the optimum by mixing colours.

If B is triangle-free and G=I_q join B[t], every actual G triangle has exactly one apex and one rim edge. No triangle has zero apices because B[t] is triangle-free; no triangle has two apices because I_q is independent. Each rim edge has triangle codegree q; a spoke to a clone of v has triangle codegree t deg_B(v). Every triangle uses two spokes, of which there are q|B|t, so

    2nu(G) <= q|B|t.

Consequently t^2 m_r(B)>q|B|t defeats every prescribed within-part r-colour deletion budget, already on rim edges alone. It does not refute Tuza: this deletion rule is only a particular way of choosing a cover/repair.

If B is connected and has an edge, the shared-edge triangle component is connected. Within one apex, triangles over incident rim edges share a spoke; all rim edges of B[t] form a connected line graph. Across different apices, pages of the same rim edge share that rim edge.

## B. Strengthened limitation theorem

Fix r>=2, q>=1, and a connected triangle-free B0 with chi(B0)>r. Construct B=B0 Cartesian-product K2: two copies B0^0,B0^1, with the extra identity edge v^0v^1 for every v in V(B0). Write b0=|V(B0)| and b=2b0. Let

    G = I_q join B[t],  where t >= 2q+8.

Then:

1. B is connected and triangle-free, and chi(B)=chi(B0). Its minimum degree is delta(B0)+1.
2. m_r(B)=2m_r(B0)>=2. Thus the minimum monochromatic rim cost in G is exactly 2t^2 m_r(B0).
3. nu(G)=qbt/2=q b0 t.
4. EVERY prescribed packing of at most two G triangles extends to a maximum G packing.
5. Every edge belongs to at least min(q,t(delta(B0)+1)) triangles, and all triangles are in one shared-edge component.
6. Provided bt>=q, deleting fewer than q graph vertices leaves a connected graph. In particular G has vertex connectivity at least q.
7. tau(G)<=q(b-1)t=2nu(G)-qt<2nu(G).
8. Deleting ANY spoke e lowers nu exactly by one:

       nu(G-e)=nu(G)-1.

Therefore this family simultaneously satisfies arbitrary fixed minimum triangle codegree, arbitrary fixed vertex connectivity, shared-edge triangle connectivity, and the known one/two-triangle extension condition, while refuting the prescribed r-colour deletion budget whenever

    t m_r(B0)>q b0.

It explicitly FAILS the actual critical deletion-resilience condition. It is not a family of Tuza counterexamples, and it does not refute a repair theorem requiring the full critical package.

### Proof of items 1–3 and 5–8

A triangle in B cannot cross layers: the only cross-layer edges are the identity matching. Thus triangle-freeness is inherited. A proper chi(B0)-colouring in layer 0 and a fixed-point-free permutation of those colours in layer 1 is proper on B, proving chi(B)=chi(B0); the reverse inequality follows from either layer. The same derangement, now applied to an optimal r-colouring of B0, gives m_r(B)<=2m_r(B0), with no monochromatic identity edge. Each layer independently contributes at least m_r(B0), so equality holds.

The blown-up identity edges consist of b0 vertex-disjoint K_t,t graphs. Number clones modulo t. For apex a=0,...,q-1, match clone i in layer 0 to clone i+a in layer 1 in each such K_t,t. Since t>=q these are q pairwise edge-disjoint rim perfect matchings. Their apex pages give qbt/2 triangles, meeting the spoke-count upper bound exactly.

The codegree and triangle-component assertions were proved in A. If fewer than q vertices are deleted, an apex remains and, because bt>=q, a rim vertex remains. Every remaining rim vertex joins the remaining apex, and every remaining apex joins the remaining rim vertex. This proves connectivity without assuming anything about deleted rim connectivity.

Choose one base vertex of B and omit all q t spokes to its independent clone class; take every other spoke. Every apex triangle has at least one endpoint outside that independent class, so this is a cover of size q(b-1)t. Thus these graphs have explicit positive Tuza slack.

All maximum packings have qbt/2 triangles and consume all qbt spokes. Removing one spoke leaves at most floor((qbt-1)/2)=qbt/2-1 packing triangles (bt is even). Removing the one triangle containing that spoke from the displayed maximum packing attains that bound. This is an exact failure of the very first deletion-critical identity, not an unchecked condition.

### Complete proof of item 4: prescribed-packing extension

A prescribed packing P of at most two apex triangles specifies a set R of at most two distinct rim edges, each assigned to its apex. For each apex a, the assigned set R_a is a matching: two pages at the same apex would otherwise share a spoke. Distinct apices cannot be assigned the same rim edge because P is edge-disjoint.

We construct rim perfect matchings M_a in apex order, containing R_a and pairwise edge-disjoint. Let F contain every edge already used in previous M's and all prescribed rim edges reserved for later apices. The maximum degree of F is at most

    (q-1)+2=q+1.

By induction no edge of R_a is in F. Start a partial matching Q with R_a. For each prescribed edge within one layer, between clones of distinct base vertices u,v of B0, choose a companion edge between fresh clones of u,v in the opposite layer. Such an edge exists because uv is also a B0 edge in that layer. Require its endpoints to avoid every endpoint of R (at most four total) and all previously chosen companion endpoints (at most two before the second companion), and require the edge itself to avoid F. Each class excludes at most six vertices. Choose the first endpoint arbitrarily among the remaining clones; at most q+1 additional second endpoints are ruled out by F. Since t>=2q+8>6+(q+1), a companion exists. The companions and R_a form a matching Q avoiding F.

A prescribed identity edge removes one clone from each side of its blown-up identity K_t,t. A prescribed within-layer edge together with its mirrored companion does likewise for each of its two corresponding identity class pairs. Therefore after removing endpoints of Q every identity K_t,t has equally many remaining vertices on its two sides. At most two vertices were removed from either side of any pair, because there were at most two prescribed edges in total. Each remaining pair is K_n,n minus forbidden F edges, with

    n>=t-2>=2(q+1).

It has minimum degree at least n-(q+1)>=n/2, hence a perfect matching. For completeness, Hall's condition follows as follows: for a nonempty left subset S with |S|<=n/2, one vertex already has at least n/2>=|S| neighbours; if |S|>n/2 and a right vertex were outside N(S), all of its neighbours would lie in the complement of S of size <n/2, impossible. Thus every S has |N(S)|>=|S|.

Complete Q with these disjoint identity-pair perfect matchings, obtaining M_a. It avoids F, hence preserves all future prescribed edges and never repeats an earlier rim edge. Proceed through every apex. The q matchings give a G packing of size qbt/2 containing P, which is maximum by the spoke bound. QED.

### Explicit r=4 parameter family

Start with C5 and apply Mycielski's construction twice, giving connected triangle-free B0 on 23 vertices with chi(B0)=5. The usual construction/proof is stated below, so no uninspected chromatic-number solver is an input. Take B=B0 square K2, q=4, t=93. Then b=46 and |V(G)|=4+46*93=4282. Every edge has triangle codegree at least four; the graph is at least 4-vertex-connected; every prescribed packing of at most two triangles extends to a maximum. Yet

    monochromatic rim deletion cost >= 2*93^2 = 17298,
    2nu(G) = 4*46*93 = 17112.

The minimum codegree is exactly q=4 on the rim. A constructive packing has 8556 triangles. Any spoke deletion reduces that optimum to 8555. A cover of size 4*45*93=16740 witnesses strict Tuza slack of at least 372. These graph orders and counts are symbolic, not a claim that all 5,708,340 actual triangles of this large graph were enumerated.

For arbitrary fixed codegree/connectivity thresholds choose q at least both thresholds, and choose t>=2q+8 with t>q b0. The same fixed B0 defeats r=4 prescribed deletion. For arbitrary fixed r>=2, iterate Mycielski from C5 enough times to obtain chi(B0)>r and use the same argument.

### Mycielski input reconstructed

Given triangle-free graph J with vertices v_i, form M(J) with old vertices v_i, independent clones u_i, and root w; keep all old edges, add u_i v_j and u_j v_i for each old edge v_i v_j, and join w to all u_i. Any triangle containing w would require an edge between clones, absent. Any other new triangle using one clone would imply a triangle in J. Thus triangle-freeness is preserved. Old J is an induced subgraph, and an optimal k-colouring extends with the old colour of v_i on u_i and a fresh colour on w, giving chi(M(J))<=k+1. If a k-colouring of M(J) existed, name w's colour k. No clone has colour k. Recolour every old vertex with colour k by its clone's colour; adjacent old vertices cannot both originally have colour k, and clone adjacency ensures the recolouring is proper. It yields a (k-1)-colouring of J, contradiction. Hence chi rises by one. Connectedness is immediate for connected nonempty J. Starting with chi(C5)=3 gives orders 5,11,23 and chromatic numbers 3,4,5.

## C. Reconstructed shared-triangle gluing lemma

Let G be a union of graphs G_i, each containing the same actual triangle with edge set B={e1,e2,e3}. Assume pairwise E(G_i) intersections are contained in B and **every actual G triangle lies in some G_i**. Vertices may overlap arbitrarily subject to these explicit edge and triangle-separation conditions. Suppose Tuza holds for every graph G_i-(B minus S), for every S subset B (including empty and full S). Then Tuza holds for G.

Write H_i=G_i-B, a_i=nu(H_i), K=sum a_i. The H_i edge sets are disjoint and no triangle is missed, so their maximum packings combine. Appending the boundary triangle gives nu(G)>=K+1. Covering B and every H_i costs at most 2K+3. Therefore the only case needing proof is nu(G)=K+1.

For each i and S subset B define g_i(S)=nu(H_i+S)-a_i. Under this remaining case every g_i(S) is 0 or 1: any packing in H_i+S combines with base packings in all other pieces. If some edge e has g_i({e})=0 for every i, combine covers of H_i+e of sizes at most 2a_i and add the two other B edges. This covers G at cost at most 2K+2.

Otherwise each of the three boundary edges has a singleton-gain supplier i with g_i({e})=1. Suppliers for two distinct edges cannot lie in distinct pieces: their packings have disjoint boundary occupancies and disjoint private edges, giving a packing of size K+2. It follows that one piece j supplies all three edges, and no other piece supplies any edge. To verify this inference explicitly, choose suppliers for e1 and e2; they coincide, say j. A supplier for e3 must coincide with the e1 supplier. Any additional supplier at any edge would conflict with j's supply at a different edge.

For i!=j and every e in B, g_i(B minus {e})=0. Otherwise combine that piece's gain with j's singleton gain at e, again obtaining K+2 triangles. Choose a cover C_j of G_j of size at most 2a_j+2. Since G_j contains the triangle B, C_j contains some e in B. For i!=j choose a cover of G_i-e of size at most 2a_i; its packing number is a_i by the preceding assertion. These covers together with C_j cover every G triangle: any triangle omitted by a G_i-e cover contains e, and e is in C_j. The total cost is at most 2K+2=2nu(G). QED.

This is a scalar transfer with complete subset accounting; it makes no claim to preserve every forced boundary state or every individual piece cover optimum. It does not assume minimum covers have an exchange axiom.

### Corollary and exact prior status

An edge-minimal actual Tuza counterexample has no vertex separator of order <=3. For a separator S, take each component of G-S with S as a piece. Every actual triangle lies in one piece, and the shared edge boundary is E(G[S]). If |B|<=2 apply the already known TUZA-11 two-edge theorem. If |B|=3, then S has three vertices forming a triangle, so use the preceding lemma. All relevant pieces and their boundary deletions are proper edge-subgraphs and satisfy Tuza by criticality. Every component outside S has an incident edge, so properness is genuine after irrelevant isolates are removed. Graphs of order at most four directly satisfy Tuza. Thus a minimal counterexample is 4-vertex-connected.

This conclusion is PRIOR ART: the coordinator located Lucas Ismaily Bezerra Freitas, 2014 thesis, *A conjectura de Tuza sobre triângulos em grafos*, institutional record https://repositorio.ufc.br/handle/riufc/9599?mode=full, explicitly stating 4-connectivity. The coordinator is inspecting the proof. The exact transfer formulation above was independently reconstructed here, but no priority claim is made. Krivelevich 1995, Lemma 5, already proves the two-vertex separator closure under piece and edge-deletion Tuza assumptions; the primary PDF at https://www.cs.tau.ac.il/~krivelev/2.pdf was inspected on 2026-11-04. TUZA-11 already proves arbitrary triangle-separated edge adhesion of size at most two.

## D. The precise frontier and global relevance

The strengthened blow-up obstruction excludes repair arguments whose only added guarantees are fixed codegree/connectivity thresholds, triangle-component connectivity, and extension of prescribed one/two-triangle packings. It does NOT exclude an argument that substantively exploits one/two-edge deletion resilience, cover criticality, or additional graph-specific structure. Its exact spoke-deletion failure identifies the missing distinction.

The separator lemma does not resolve unrestricted Tuza, and a theorem asserting that every critical graph has a separator of order at most three would contradict an already necessary condition rather than supply a supported route. Dense graphs have no such separator; our strengthened obstruction can have arbitrarily large connectivity. The decomposition mechanism therefore has no demonstrated global availability.

A specific next structural proof task would be a transfer theorem for an actual K4 vertex separator, with all six boundary edges and arbitrary outside incidence retained in the response states. The first unresolved cases have global packing gain one or two over the boundary-deleted pieces. Neither the common-triangle proof nor a scalar deficit controls those states. We have not proved this theorem, tested a complete state system for it, or justified global availability of a K4 separator. Merely requesting that such a separator exist would restate a major missing structural difficulty. This is recorded as a precise possible frontier, not a recommendation for a longer campaign.

The nontriangle three-edge adhesion attempt also has a precise gap. In the singleton-gain localization argument, a dominant piece cover need not meet the boundary if the three boundary edges contain no triangle. The common-triangle proof works because every cover must choose one of its edges. This cannot be silently dropped. No general three-edge nontriangle adhesion theorem is claimed.

Overall Track A verdict: REFUTED_CANDIDATE for codegree-only (and the stated stronger relaxed) colour repair; reconstructed separator statement KNOWN_INPUT/PROVED_ORDINARY with no originality claim; no positive globally available repair mechanism established. The rigorous strengthened limitation is the substantive retained result. A longer global campaign is not justified solely by these outcomes.
