# Complete proofs and obstructions

This compilation is the mathematical deliverable for TUZA-17. The controlling final statements are: full AC unresolved; all b≤6 settled using Aharoni/HNS; budget7/vc9 additionally settled using declared McKay catalogue completeness; first remaining conditional window b7,m6,lambda=vc(L)=8, with full eligible H realization UNKNOWN. Private ear reductions and the strengthened limitation/nonsaturation results retain their exact scopes. No global availability or independent final verification is claimed.

The chapters reproduce the specified frozen notes or explicitly selected mathematical sections. Original files and critic hashes are preserved. Early phrases such as “first frontier,” “pending review” and weaker small-budget bounds are historical within those notes; they do not override the final statement above. The preferred ear proof is addendum5, not an unqualified extension of the outside-marking identity. The final nonsaturation proof uses the complete elementary matching argument, not the earlier unproved Tutte–Berge alternative. `evidence/proof_compilation_inputs.json` records exactly which bytes/sections were compiled.

## Dependency map and the equality interface

The ordinary branches use actual graph triangles, edge-disjointness, the known criticality package, and elementary matching arguments supplied below. The AC equality branches additionally use Aharoni's tripartite inequality and the Haxell–Narins–Szabó equality theorem at its exact tripartite hypothesis. For H with a rainbow triangle-edge colouring, graph edges are hypervertices and actual triangles are hyperedges of a tripartite3-uniform hypergraph; its matching/cover numbers are exactly nu(H),tau(H). Deleting graph edges preserves this structure.

Here is the complete graph-specific extraction/exhaustion interface, already present in the authenticated TUZA-01/TUZA-03 sources. HNS supplies a home-base partition at equality tau=2nu=2k. Its truncated-Fano pieces each contain a loose3-cycle on six hypervertices. For each central triple R={r1,r2,r3}, choose one saturating matching in each of the three auxiliary bipartite graphs. If wi(R) is the matched W-vertex in part i, the three hyperedges {r2,r3,w1}, {r1,r3,w2}, {r1,r2,w3} form a loose3-cycle. Different central triples have disjoint supports: same-part choices differ by the matching property, different-part choices by the tripartition, and W is disjoint from all central triples and Fano pieces. Together these yield k loose cycles with disjoint hypervertex supports. This is a consequence of the declared HNS definitions/theorem, not a new proof of that deep theorem.

In a graph triangle hypergraph, name two triangles in one loose cycle uvx and uvy. The third shares one edge other than uv with each. Those two shared graph edges must meet, so the third is uxy or vxy; the cross choices ux/vy and vx/uy are disjoint and impossible. Thus the six support edges form an actual K4. Disjoint hypervertex supports give k edge-disjoint K4s, which may share graph vertices. Finally suppose another actual triangle Q is not a face of one of them. Q shares at most one edge with each K4, since sharing two would put its three vertices in that complete block. Choose a face in each block avoiding that possible shared edge and append Q. This gives k+1 disjoint triangles, contradicting nu=k. Therefore ALL actual triangles are precisely block faces; edges outside the blocks are triangle-free. This exhaustion is essential when choosing covers, and no arbitrary tight graph is assigned this structure.

The budget≤6 proof depends on that interface, but not on any Ramsey catalogue. The budget7/vc9 corollary additionally accepts the explicitly inspected primary catalogue's completeness; only its one record was locally independently verified. Every full proof below retains these dependency boundaries.


---

# A1. Strengthened colour-deletion obstruction and scoped separator reconstruction

Source: `notes/A_RESULTS.md`.

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


---

# A2. Complete ordinary critical nonsaturation proof

Source: `notes/A_ELEMENTARY_MATCHING_BLOCKER.md`.

# Elementary proof supplement to critical apex nonsaturation

This supplement removes the need to leave Tutte–Berge as an unproved dependency for the NS and NS-state deductions in A_CRITICAL_NONSATURATION.md. Those deductions, together with the elementary proof below, are PROVED_ORDINARY. The earlier Tutte–Berge proof is retained as an alternative, not silently rewritten. The matching argument is attributed prior art; NS originality remains UNESTABLISHED. No Lean or separately commissioned final verification was run.

## Attributed elementary matching argument

Reconstructed from Alexander Schrijver's CWI exposition, *The Tutte-Berge formula*, undated one-page author PDF, https://homepages.cwi.nl/~lex/files/tutteb.pdf, inspected 4 November 2026:

Suppose connected F has no vertex covered by every maximum matching. A maximum matching cannot be perfect. If all maximum matchings missed at least two vertices, choose M and unmatched u,v minimizing their distance. They cannot be adjacent. Choose an interior vertex t on a shortest u-v path. Choose a maximum N missing t with |M intersect N| largest. N covers u,v, since otherwise it misses a closer pair. Equal cardinalities imply that at least two M-covered vertices are missed by N; choose one x different from t. Let xy belong to M. Vertex y is N-covered, or xy would augment N. Replace y's N-edge by xy. Cardinality and the omission of t persist, while the intersection with M increases: contradiction. Thus mu(F)=(|V(F)|-1)/2.

For any graph with an edge, select an edge-containing component. If it has a universally covered vertex, delete that vertex. Otherwise the preceding argument applies; delete any two vertices. In both cases its matching number drops, and component additivity gives the required blocker of size at most two.

## Fully explicit bridge to NS

The just-proved blocker lemma holds for every ordinary finite graph with an edge, without any invocation of a classical theorem left unproved in this supplement. In a true edge-minimal Tuza counterexample, every nonisolated v has an edge in its link L. Choose its one/two-vertex blocker U and delete the corresponding one/two spokes from G. Critical deletion resilience preserves nu(G), whereas any packing in the resulting graph has at most nu(G-v) old triangles plus mu(L-U)<=mu(L)-1 apex triangles. Therefore

    nu(G)<=nu(G-v)+mu(L)-1.

Appending the apex pages of any maximum link matching M to a maximum packing of (G-v)-M gives

    mu(L)+nu((G-v)-M)<=nu(G),

so nu((G-v)-M)<=nu(G-v)-1. Matching EDGES are deleted in this last expression. This repeats the short deduction to make the final ordinary dependency chain complete; the substantive new information is the mandatory packing conflict, not the classical matching lemma.

## Limits retained

No true minimal counterexample is known or used in a computation. This condition supplies no cover-saving operation or availability theorem. Our strengthened blow-ups violate it by full apex saturation and hence explicitly fail true criticality despite their other relaxed properties. K4 and K5 satisfy strict apex nonsaturation without being counterexamples; nonsaturation alone is not a sufficient hypothesis for a new positive theorem. The abstract Fano plane has no supplied graph apex/link/matching representation, so no generic hypergraph conclusion is inferred.


---

# A3. Exact supported-link intermediary tested

Source: `notes/A_SLS_PROPOSAL.md`.

# Supported-link slack (SLS): frozen auxiliary assertion

Frozen 2026-11-04T01:08:25Z, before this follow-up's tests. Original TUZA-17 start/deadline remain 00:45:12Z/02:45:12Z; subtask development deadline 01:28Z. This is the same Track A agent with inherited context, not independent criticism and not a new campaign. No earlier frozen A proof is edited.

Let H be a finite simple graph whose actual triangles are rainbow under an edge colouring with three colours. Let X subset V(H), and suppose L=H[X] is triangle-free. Let L_old be the spanning subgraph on X containing exactly those L edges that lie in at least one actual H triangle. Write nu(H), tau(H) for triangle packing/edge cover, and D(H)=2nu(H)-tau(H).

**SLS:** There exists a MINIMUM triangle-edge cover C of H such that

    vc(L_old-C) <= D(H).

C deletes only its edges from L_old, not their endpoints. The quantifier is existence among all minimum covers; one bad minimum cover does not refute it. This is a stronger proposed intermediate lemma, not a replacement or patched definition of AC. Any counterexample must verify eligibility, every minimum-cover obstruction, and exact D.

## Why this would imply AC

Let z be the apex with neighbourhood X and G=H+zX. Every edge of L_new=L-L_old lies in no H triangle. Any matching in L_new therefore appends its apex pages to every H packing, so mu(L_new)<=a=nu(G)-nu(H). The endpoints of a maximum matching cover L_new, giving vc(L_new)<=2a. Combining this vertex cover with the SLS vertex cover gives vc(L-C)<=D(H)+2a, which is AC. This implication assumes SLS, not vice versa.

## First probes and possible obstruction

The assertion spends only existing slack on link edges already supporting old triangles. Tight K4 components and D<=1 packing-essential cases are already being handled elsewhere. Probe colourable H with overlapping old triangles, supported link cycles or matchings, and a genuinely incompatible minimum-cover choice. Full induced-link triangle-freeness must be checked: taking a convenient triangle-free edge subset of H[X] is not eligible. A counterexample to SLS may still satisfy AC through positive apex packing gain.

No heavy computation is authorized for this scout yet. Begin with symbolic constructions and inspect existing raw graph records. Any decisive witness will be independently reconstructed.


---

# A4. All-minimum-cover refutation of that intermediary

Source: `notes/A_SLS_RESULT.md`.

# SLS is false: a complete eligible six-vertex obstruction

Verdict: **REFUTED** for the exact supported-link slack assertion frozen in A_SLS_PROPOSAL.md. **AC is not refuted**: the same graph satisfies AC. The coordinator suggested the wheel seed after this follow-up was assigned; the Track A agent independently reconstructed its triangles, colouring, optima, all minimum covers and state arithmetic. This is a shared-context follow-up, not a blind independent audit. Independent final verification NOT_RUN.

## Exact graph, link and colouring

Let H have vertices 0,1,2,3,4,5. Vertices 0,...,4 form the cycle C5, and 5 is adjacent to all of them. Thus

    E(H) = {01,04,05,12,15,23,25,34,35,45}.
    X = {0,1,2,3,4}.
    L = H[X] = C5.

Every L edge lies in an H triangle, so L_old=L. Its complete actual triangle family is

    015,125,235,345,045.

No other triangle exists, since the rim C5 is triangle-free. An explicit eligible triangle-edge-3-colouring is

    edge: 01 04 05 12 15 23 25 34 35 45
    colour:2  1  0  2  1  2  0  0  1  2.

Every listed triangle has colours {0,1,2}. Thus this is the required triangle-edge colouring, not a substituted vertex-colouring condition. The link is induced and triangle-free, and every link edge genuinely interacts with an old triangle.

## Exact old optima

Every H triangle uses two of the five spokes at vertex5, hence nu(H)<=2. Triangles015 and235 are edge-disjoint, giving nu(H)=2.

Every graph edge belongs to at most two of the five triangles. Two cover edges can therefore hit at most four triangles. Thus tau(H)>=3. The set

    C={05,25,34}

covers all five triangles, proving tau(H)=3. Consequently D(H)=2*2-3=1.

## Every minimum cover fails SLS

Any minimum H cover has three edges. If it contained at least two rim edges, its triangle coverage would be at most 1+1+2=4 (and at most3 for three rim edges). Therefore every minimum cover contains at most one rim edge.

If it contains no rim edge, then L-C=C5 and vc(L-C)=3. If it contains one rim edge, then L-C is the path on five vertices and vc(L-C)=2. Therefore every minimum cover has residual vertex-cover number at least2. The displayed C has exactly one rim edge, and {0,2} covers L-C, attaining2. Hence

    lambda_old(H,L)=2 > D(H)=1.

This defeats the existential quantifier over ALL minimum covers. It does not rely on selecting one poorly chosen minimum cover. More explicitly, there are exactly ten minimum covers: five sets of three spokes whose omitted rim vertices are independent, and five sets comprising two nonadjacent spokes plus the unique remaining uncovered rim edge. The exhaustive certificate lists every one.

## The graph is packing-edge-stable despite slack one

Deleting a rim edge removes one page and leaves a two-page packing, since C5 minus one edge has a matching of size2. Deleting a spoke at rim vertex i removes its two incident pages; the remaining bases form C5-i, a four-vertex path with a matching of size2. Thus

    nu(H-e)=nu(H)=2 for every e in E(H).

So SLS is already false on the packing-edge-stable D=1 class. The additional essential-edge hypothesis in the earlier positive D=1 theorem is absent here, exactly as required. This is an obstruction to that stronger slack-only intermediate rule, not to AC on stable D=1 graphs.

## Exact apex state and why AC survives

Add vertex6 adjacent exactly to X. Then G=I2 join C5. Its complete ten-triangle family consists of the five pages at5 and the five at6.

Each apex can support at most two packing triangles because their bases form a C5 matching. Hence nu(G)<=4. The four triangles

    015,235,126,346

are edge-disjoint, so nu(G)=4 and a=4-2=2. Consequently the AC residual budget is

    D(H)+2a=1+4=5.

The same minimum cover C={05,25,34} leaves residual vertex cover {0,2}, so its compatibility cost is3+2=5<=2nu(G)=8. AC holds comfortably.

In fact tau(G)=5. For any cover let F be its chosen rim edges. At each apex its chosen spokes must cover C5-F, so its size is at least |F|+2vc(C5-F). For |F|=0,1,2,3,4,5 the corresponding lower bounds are respectively6,5,6,5,6,5: a three-edge subgraph of C5 cannot have vertex cover1, while the other bounds follow immediately from the remaining paths. Thus every G cover has size at least5. The set {05,25,34,06,26} attains5. A nonminimum old H cover consisting of all five rim edges also covers G with5 edges, but does not improve on the compatible minimum old cover. No minimum-versus-all-cover discrepancy in the AC inequality is asserted.

## Consequence for the surviving proof task

The supported link cannot generally be paid for from D(H) alone. Apex packing gain can be necessary even when every link edge is old-supported and H is packing-edge-stable with D=1. This is a genuine interaction obstruction to SLS.

The witness does not reach the current difficult AC numerical window: m=mu(L)=2 and b=D+2a=5, while the first remaining frontier requires m=b-1>=4 (after the already proved small-budget cases). In particular it supplies no counterexample to a minimum-cover compatibility theorem for stable slack-one residuals in that frontier. Any future proof must couple old-supported link states with the actual packing gain; separating their budgets as SLS does loses valid instances. We do not introduce a patched SLS statement, enlarge constants until tests pass, or recommend a new campaign on this one counterexample.

## Evidence and reproduction

`checks/a_sls_w5.py` reconstructs every actual H and G triangle, checks the explicit edge colouring and induced-link eligibility, exhaustively computes both packing and cover optima, lists all ten minimum H covers, computes each residual ordinary vertex-cover number, and verifies a two-packing after each of the ten H edge deletions. It imports no historical checker or optimisation library. All arithmetic and set checks are exact.

Saved evidence: `evidence/a_sls_w5.json`, `evidence/a_sls_w5.log`, and `evidence/a_sls_w5.limits.json`. The run applied20s CPU/alarm bounds and the existing inspected watchdog with30s wall and256MiB sampled-RSS bounds. It completed normally; no process remains. The ordinary proof above establishes the finite optimality claims independently of merely trusting the program's conclusion.

From the mission workspace:

    source LOCAL_ENVIRONMENT
    python checks/run_bounded.py 30 256 evidence/a_sls_w5.log python checks/a_sls_w5.py

The exact SLS assertion is REFUTED/FINITE_CHECKED with a complete ordinary witness proof. The literal AC target retains its existing unresolved global status.


---

# B1. Exact identities, saturated-budget theorem and essential-edge cases

Source: `notes/B_FROZEN_v1.md`.

## 1. Definitions and known exact identities

H is finite simple and its actual triangle edges have a three-colouring rainbow on each actual triangle. X is an arbitrary vertex subset with induced L=H[X] triangle-free. G adds z adjacent exactly to X. Let h=nu(H), a=nu(G)-h, D=2h-tau(H), and lambda be the least vc(L-C) over all minimum triangle-edge covers C of H. An edge of L in C is deleted; endpoints are retained.

A cover of G restricts to a triangle-edge cover C of H. The other selected edges are spokes zS, where S covers L-C. Conversely C union zS is a G cover. Thus tau(G)=min_C[|C|+vc(L-C)] over ALL H covers. A packing's apex triangles correspond to a matching M of L. Its old triangles are a packing in H-M, deleting matching EDGES. Conversely these packings combine, so nu(G)=max_M[|M|+nu(H-M)]. Neither identity proves the restriction to minimum covers. AC is exactly lambda<=D+2a. All these identities are KNOWN_INPUT/bookkeeping.

For exact checking, S subset X covers L-C iff every edge F=E(L[X\S]) lies in C. The least H-cover containing F has size |F|+tau(H-F): restriction gives the lower bound, and adding a residual cover gives the upper bound. Hence

    lambda = min {|S| : |F|+tau(H-F)=tau(H), F=E(L[X\S])}.

This is another exact state reduction, not a compatibility theorem.


## 2. Published-input equality structure used, at its exact scope

Aharoni's tripartite 3-uniform theorem supplies tau(J)<=2nu(J) for every edge-subgraph J of H. The HNS equality characterization, through the TUZA-01 graphical extraction and TUZA-03 exhaustion proof, supplies the following when tau(J)=2nu(J)=2k: there are k edge-disjoint actual K4s whose faces are ALL J triangles. Their graph vertices may overlap. Other J edges belong to no triangle.

The exact project proofs read are sources/published/problems/TUZA-01/manuscript/README.md, Lemmas 2.1 and 2.2; and sources/published/problems/TUZA-03/CONSOLIDATED_MANUSCRIPT.md, Section 1.1. The extraction's published dependency is Haxell–Narins–Szabó, *Extremal hypergraphs for Ryser's conjecture*, JCTA158(2018),492–547, Theorem1.1 and the 18March2018 manuscript Definitions7.1–7.4/Proposition7.5. No unrestricted equality theorem is assumed. This track has read the attributed project extraction, not independently re-audited the entire HNS proof. Historical originality of deductions below is UNESTABLISHED.


## 3. Scoped theorem AC-0: all eligible tight H

**Theorem.** AC holds whenever D(H)=0. More precisely, a minimum H cover C can be chosen so vc(L-C)<=2a.

**Proof.** Use the k=h edge-disjoint K4 blocks above. Since L=H[X] is induced and triangle-free, X meets a K4 block in at most two vertices. Consequently that block contains at most one L edge. If there is one, choose it and its opposite K4 edge as the block cover; otherwise choose any opposite pair. The union C has size2h, covers every H triangle, and is minimum. Every L edge belonging to any K4 block is in C. Thus every edge in L-C belongs to no block.

Let M be a maximum matching of L-C, of size m. Its apex triangles are edge-disjoint from any choice of one face per K4, because their rim edges are outside all blocks and their spokes use z. So nu(G)>=h+m, hence a>=m. The endpoints of M cover L-C, giving vc(L-C)<=2m<=2a. This includes empty L-C and h=0. Arbitrary outside edges and vertex sharing are accounted for. QED.

Evidence: **PROVED_USING_PUBLISHED_INPUT** (Aharoni is not needed once the equality-block consequence is supplied). The elementary lemma for graphs explicitly supplied with those blocks is **PROVED_ORDINARY**. This is a scoped deduction, not a general equality classification or full AC.


## 4. Elementary triangle-free vertex-cover saving

**Lemma.** If F is a nonempty triangle-free graph and m=matching(F), then vc(F)<=2m-1.

**Proof.** Choose a maximum matching M and any edge uv in M. If both u and v have neighbors outside V(M), two distinct such neighbors would give a length-three augmenting path, contradicting maximal cardinality. If the two neighbors are the same vertex, it makes a triangle with uv. Thus one endpoint, say u, has no neighbor outside V(M). The set V(M)\{u} is a vertex cover: V(M) already covers every edge by maximality, and every edge incident with u has its other endpoint in the displayed set. Its size is2m-1. QED.

The graph can have isolated vertices; m>=1 is necessary. No probabilistic or floating certificate appears. This standard matching observation is included as a proof ingredient, not claimed original.


## 5. Scoped theorem AC-1e: slack one with a packing-essential edge

**Theorem.** AC holds whenever D(H)=1 and H has an edge e with nu(H-e)=h-1. More precisely, a minimum H cover C can be chosen so vc(L-C)<=1+2a.

**Proof.** Put J=H-e and k=h-1. Since tau(H)=2h-1, edge deletion gives tau(J)>=2h-2. J inherits the rainbow triangle edge-colouring; Aharoni gives tau(J)<=2nu(J)=2h-2. Thus J is tight and its full triangle family consists of k edge-disjoint K4 blocks as above.

Every such block contains at most one L edge, since it is also an H K4 and X is induced triangle-free in H. Cover each block with an opposite pair containing this edge when present. Add e to their union to obtain C. It has size2k+1=2h-1=tau(H) and covers H: old J triangles are covered by their block covers, while every H triangle absent from J contains e. Therefore C is a MINIMUM H cover.

Set F=L-C. No F edge belongs to a J block, and e is absent from F. Let M be a maximum F matching with size m. If m=0, F has no edges and the asserted inequality is immediate. Otherwise take any actual H triangle Q containing e; such Q exists because e is packing-essential. Q shares at most one edge with each J K4 block. Indeed two shared Q edges would put all three Q vertices in the complete block and force e in J, impossible. In each block choose a face avoiding the possible Q edge. These k faces, together with Q, form an h-packing of H. Every block face avoids all M edges because M lies outside the blocks.

An H triangle contains at most one L edge: two would put its three vertices in X and induce a forbidden L triangle. Hence Q meets at most one edge of M. Delete this edge from M if needed. Append the apex triangles of the remaining matching to the displayed h-packing. This gives nu(G)>=h+m-1, so a>=m-1. The triangle-free graph F has vc(F)<=2m-1 by the preceding lemma. Consequently

    vc(F)<=2m-1<=2a+1=D(H)+2a.

The argument allows arbitrary graph order, block vertex sharing, arbitrary nontriangle edges of J, and arbitrarily many triangles through e. It enumerates all H triangles by the exact J-versus-e dichotomy, and all apex triangles by L. QED.

Evidence: **PROVED_USING_PUBLISHED_INPUT**. No statement about stable slack-one H follows. A graph can have D=1 and no packing-essential edge (two K4s sharing one edge already has that property), so the extra premise is substantive. No patched AC claim replaces the literal target; AC-0/AC-1e are scoped cases of it.


## 8. Joint coordinator/scout theorem: a saturated link matching

This is joint development after the initial scout's AC-0/AC-1e proofs. Let p=nu(G), b=2p-tau(H)=D(H)+2a, and m=matching(L). Here b is a nonnegative integer by Aharoni on H and nu(G)>=nu(H).

**Necessary bound.** m<=b. For any maximum matching M of L, appending its m apex triangles gives nu(H-M)<=p-m. On the other hand tau(H-M)>=tau(H)-m. Apply Aharoni to the edge-subgraph H-M:

    tau(H)-m <= tau(H-M) <= 2nu(H-M) <= 2p-2m.

Rearrangement gives m<=2p-tau(H)=b. The proof uses matching EDGE deletion and the full actual triangle family.

**Theorem AC-saturation.** If m=b, AC holds, with a minimum H cover C satisfying vc(L-C)<=2a.

**Proof.** For a maximum L matching M, all inequalities above are equalities. Put J=H-M and k=p-m. Then tau(J)=2nu(J)=2k. Published-input equality exhaustion gives k edge-disjoint K4 blocks containing all J triangles. Each block has at most one L edge, because H[X] is induced triangle-free. Cover each block by an opposite pair including its L edge if present, and let C be their union with M. The sets are edge-disjoint and

    |C|=2k+m=2p-m=2p-b=tau(H).

It covers all H triangles: every J triangle is a block face; every other H triangle contains an edge of M. Thus C is minimum.

Let f be any edge of L-C. It lies outside M and outside the K4 blocks. It cannot belong to an H triangle. Such a triangle, if retained in J, would be a block face. If destroyed, it would contain an M edge in addition to f; both edges lie in L, forcing all three vertices into X and contradicting the triangle-free induced link. Hence every residual link edge belongs to NO H triangle. Any matching in L-C therefore gives apex triangles edge-disjoint from every H packing. Its size is at most a=p-nu(H). A maximum matching's endpoints cover L-C, giving vc(L-C)<=2a<=D+2a=b. QED.

This argument allows arbitrary outside attachments, disconnected H and L, isolated vertices, and vertex sharing among K4 blocks. It relies on equality structure only for the justified tight graph J. If a=0, the constructed C contains every L edge.



## 9. Joint first-frontier reduction, m=b-1

Fix any maximum L matching M and put J=H-M, k=p-m. The same bounds force

    nu(J)=k,  tau(J) in {2k-1,2k}.

Indeed tau(H)-m=2p-b-m=2k-1, tau(J) is at least this, and tau(J)<=2nu(J)<=2k. Thus nu(J)=k.

**Scoped theorem AC-frontier-essential.** If tau(J)=2k-1 and J has a packing-essential edge e, then AC holds.

**Proof.** Deleting e from J gives R with nu(R)=k-1 and, by cover loss plus Aharoni, tau(R)=2k-2. Use equality blocks of R. Let C be M, e, and opposite pairs covering the blocks and containing every block edge in L. Its cardinality is

    m+1+2(k-1)=m+2k-1=tau(H),

so it is minimum once verified as a cover. Every H triangle either uses M, or is a J triangle using e, or is an R block face; hence it is covered.

Take a surviving link edge f. It lies outside M, e, and all blocks. If f belongs to an old H triangle Q, Q cannot contain any M edge because both that edge and f would be in L. Q is thus a J triangle and must contain e. Every Q has exactly one L edge f, so e must have exactly one endpoint x in X; otherwise either no such Q exists (zero endpoints in X) or Q contains two L edges (two endpoints in X). In the one-endpoint case, f is incident with x. Therefore all old-supported edges of L-C form a star at x. The remaining edges U belong to no H triangle; every U matching appends to every H maximum packing, so vc(U)<=2a. Adding x when needed covers all of L-C at cost at most1+2a. If D>=1 this is at most D+2a=b. If D=0, AC-0 already settles the instance. QED.

The case tau(J)=2k with minimum-cover restriction is NOT settled by this argument. Its analogous block cover union M has size tau(H)+1, hence is NOT a minimum H cover. It must not be counted as an AC proof.

**Critical-subcase observation, not AC.** If tau(J)=2k and every L edge belongs to an H triangle, that nonminimum H cover also covers every apex triangle: the saturated-link residual argument shows any uncovered link edge would have been unsupported. Thus it covers G using tau(H)+1=2p-b+1 edges. For b>=1 this is at most2p, excluding a Tuza counterexample in that subcase. It does not produce a minimum H cover and hence does not resolve AC there. If unsupported link edges remain, adding an endpoint cover costs at most2a, giving a G-cover of size2p+1-D; this proves Tuza when D>=1, again not AC.


---

# B2. Safe matched endpoints and elementary small-budget bound

Source: `notes/B_FROZEN_ADDENDUM_1.md`.

# Frozen Track B addendum 1: small-budget bound to four

Joint coordinator/scout deduction, 4 November2026. This supplements, and does not overwrite, B_FROZEN_v1.md. Exact AC is unchanged. No independent-final or Lean verification claim.

**Lemma.** For any triangle-free graph F with matching number m>=3, vc(F)<=2m-2.

**Proof.** Take a maximum matching M and let U be its unmatched vertices. For EVERY matched edge uv, at least one of u,v has no neighbor in U: if both did, two distinct neighbors would form an augmenting path of length3, while a shared neighbor would form a triangle. Choose one such endpoint from each edge of M, producing a set W of m vertices with no neighbor in U. Since F is triangle-free and |W|>=3, some pair x,y in W is nonadjacent. The set V(M)\{x,y} is a vertex cover. Indeed M is maximal, so U is independent; x and y have no neighbors in U and are nonadjacent to each other. This cover has size2m-2. QED.

More precisely, for this W, every independent I subset W gives vc(F)<=2m-|I|. This refinement is recorded only as an elementary bound; no Ramsey or global structural theorem is invoked.

**Corollary.** Exact AC holds whenever b=2nu(G)-tau(H)<=4.

**Proof.** As in the frozen proof, m=matching(L)<=b. If m=b, AC-saturation supplies a minimum cover. If m=0, the link is empty. Otherwise m<b<=4, hence m<=3. For m=1, vc(L)<=1; for m=2, vc(L)<=3; for m=3, the lemma gives vc(L)<=4. In each possible branch the corresponding value is at most b (m<b forces b>=m+1). Thus any minimum H cover works. QED.

**Sharper surviving necessary window.** Every AC counterexample must have b>=5 and m>=3 with

    2m-2 > b,  m <= b-1.

The first numerical possibility is b=5,m=4,vc(L)>=6. This is necessary arithmetic only, not proof such a link instance or AC counterexample exists. A disconnected union of two C5s has m=4 and vc=6, making it a literal link shape for a targeted probe; colourability of the complete H and all-minimum-cover failure would still have to be proved.

Evidence: the matching lemma is PROVED_ORDINARY and standard in spirit, with no originality claim. The AC corollary is PROVED_USING_PUBLISHED_INPUT through the saturated-matching theorem's Aharoni/HNS dependencies. Full AC remains unresolved.


---

# B3. Tight-deletion component transfer with arbitrary outside incidence

Source: `notes/B_FROZEN_ADDENDUM_2.md`.

# Frozen Track B addendum 2: tight matching-deletion separates link components

Joint coordinator/scout structural deduction, 4 November2026. Exact AC is unchanged. This is an unbounded graph-specific transfer statement, with its hypotheses stated independently of any actual Tuza violation. No new Lean or independent-final verification claim.

## Exact lemma

Let H,X,L,G satisfy the original AC hypotheses. Let M be ANY matching of L such that J=H-M is tight: tau(J)=2nu(J). Then the full triangle families of H and G split into edge-disjoint groups indexed by the connected components of L, together with K4 groups disjoint from X. For each link component L_i on X_i, there is an explicit edge-subgraph H_i of H with H_i[X_i]=L_i and inherited rainbow triangle edge-colouring. Adding one apex adjacent exactly to X_i gives G_i. If AC holds for every pair (H_i,X_i), it holds for (H,X).

The deletion is of matching EDGES. No claim is made that arbitrary H separates this way, or that vertex-sharing alone is enough to split triangle optima.

## Full proof and state completeness

By the already declared Aharoni/HNS graphical equality consequence, J's actual triangles are exactly the faces of edge-disjoint K4 blocks. Since H[X] is induced triangle-free, a block contains at most two X vertices; if it contains two, they are adjacent in L and therefore lie in the same connected component of L. Assign a block meeting X to this unique component, and assign each block disjoint from X to a separate background group.

Every H triangle absent from J contains an M edge. It contains EXACTLY one L edge, namely that M edge: two L edges would put all three vertices in X and make an L triangle. Thus such a page has two X vertices in one link component and a third vertex outside X. Assign it to that component. Its two non-M edges each join that component's X set to a vertex outside X.

Groups have disjoint edge supports, for the following exhaustive reasons:
- J blocks have disjoint edges by equality extraction.
- A page assigned to component i can share a J-block edge only with a block containing one of its X vertices, so that block is also assigned to i.
- Two pages assigned to different components cannot share an edge: every page edge meets X, and the X endpoints of the two groups belong to disjoint components.
- Background blocks have no X vertices, so they share no page edge.
- Every L edge belongs only to its own component, and an L edge in a J block assigns that block to the same component.

Define H_i to contain the edges of all blocks and pages assigned to i and ALL edges of L_i. Its vertex set consists of their endpoints together with X_i. It is an actual edge-subgraph of H; hence no new triangles are created. Every H_i triangle is an H triangle, and the preceding complete classification shows it belongs to i. Conversely every assigned triangle has all its edges in H_i. Also H_i[X_i]=L_i, since all L_i edges are included and no other H edges between X_i vertices exist. Restricting H's edge colouring verifies eligibility. Isolated link vertices and their assigned blocks are allowed; their apex contributes no triangles.

All H triangles are now partitioned into these edge-disjoint groups and the background K4s. Triangle-free H edges not in L are irrelevant to minimum triangle covers and packings and may be discarded. Any minimum triangle cover can be assumed to omit such edges, since including one would be redundant. It follows that

    nu(H)=sum_i nu(H_i)+k_0,
    tau(H)=sum_i tau(H_i)+2k_0,

where k_0 counts background blocks. For G, the only additional triangles are apex pages on L edges. Pages from different L components use distinct z-spokes, and each is assigned to its edge's component. The same full edge-disjoint partition therefore gives

    nu(G)=sum_i nu(G_i)+k_0.

These equalities permit graph vertices, including the one global apex z, to be shared between groups. Only edge supports matter. If minimum H_i covers C_i witness AC, their union with an opposite pair per background K4 is a minimum H cover C. The residual link is the disjoint union of L_i-C_i, so its ordinary vertex-cover number is the sum of their vertex-cover numbers. Therefore

    |C|+vc(L-C)
      = sum_i (|C_i|+vc(L_i-C_i))+2k_0
      <= 2sum_i nu(G_i)+2k_0 = 2nu(G).

This proves the asserted transfer. The construction explicitly retains all boundary states needed for scalar cover and packing addition; it does not discard crossing triangles, since the classification covers every old triangle and every apex triangle. QED.

## Corollaries and exact relevance

1. **Small link components.** AC holds under the lemma's tight-J hypothesis whenever each connected component of L has matching number at most3. For any eligible component instance, its budget b_i is at least m_i by the necessary matching bound. If b_i=m_i, use AC-saturation. If b_i>m_i, the elementary bounds vc<=1 for m=1, vc<=3 for m=2, and vc<=4 for m=3 give vc(L_i)<=b_i. The empty case is immediate. This is not a finite table: the matching bounds hold at arbitrary graph order.

2. **Two-C5 targeted shape.** In particular, when L is the disjoint union of two C5s and J=H-M is tight, AC holds. This explains why trying to force a failure merely by coupling the two cycles through arbitrary outside vertices cannot succeed under tight matching deletion: the actual triangle edge supports necessarily separate.

3. **Minimal-critical subcase.** If G were a genuine edge-minimal Tuza counterexample, its nonempty triangle support would have a single shared-edge component by the known criticality package. Under the tight-J hypothesis, two distinct edge-containing components of L would already yield two nonempty edge-disjoint triangle groups in G, with no shared-edge path between them. Therefore that restricted critical subcase forces L to have at most one edge-containing component and admits no background K4 group. This is a necessary structural implication within the stated apex class, not a proof that every hypothetical minimal counterexample belongs to the class.

4. **What remains.** The lemma reduces a tight-J instance to its connected link components; it does not prove AC for a connected component of arbitrarily large matching number. In the first frontier m=b-1, a packing-edge-stable slack-one J is still outside this lemma. There is no automatic iterative global decomposition of an arbitrary G.

Evidence category: PROVED_USING_PUBLISHED_INPUT, with the edge-support separation and transfer elementary once equality blocks are supplied. Historical originality UNESTABLISHED. Independent_final_verification: NOT_RUN.


---

# B4. Stable slack-one core counterexamples and finite stopping point

Source: `notes/B_CORE_LIMITATION.md`.

# Stable slack-one core: a failed small-core candidate and an exact attachment

The independently checkable candidate SMALL-CORE was frozen in B_INITIAL.md before testing: every rainbow-triangle-edge-3-colourable J with tau(J)=2nu(J)-1, all-edge packing stability nu(J-e)=nu(J), and one nonempty shared-edge triangle component has nu(J)<=2. This is **REFUTED**. It is not AC and does not refute a genuine critical-counterexample claim.

## Exact K4 attachment transfer

Let J be any finite simple graph, e=uv an actual J edge, and add two fresh vertices a,b with exactly the five new edges ua,ub,va,vb,ab, so {u,v,a,b} induces a K4. Call the result J'. Every new triangle is one of the four faces of this K4; there are no other new triangles, since each new vertex's old neighbors are exactly u,v.

**Packing.** nu(J')=nu(J)+1. A packing contains at most one new K4 face (any two faces share an edge), and at most nu(J) old triangles. Conversely any J packing appends the new face uab, which avoids the sole old K4 edge e. This equality does not require packing stability.

**Cover states.** Let t_+(e) and t_-(e) be the least sizes of J triangle covers respectively containing and avoiding e. Then

    tau(J')=min(t_+(e)+1, t_-(e)+2).

If a cover includes e, it restricts to an old cover containing e and needs at least one private K4 edge; adding ab realizes the one-edge supplement. If it avoids e, the four K4 faces need at least two of the private edges, and either opposite pair {ua,vb} or {ub,va} achieves this. Restricting to old edges proves the matching lower bounds. These alternatives exhaust all covers; no minimum-cover exchange assumption is used.

In particular, if e belongs to NO minimum J cover, then t_-(e)=tau(J) and t_+(e)=tau(J)+1: the latter lower bound is by the hypothesis and integrality, and the upper bound adds e to a minimum cover. Thus

    tau(J')=tau(J)+2,  D(J')=D(J).

**Packing-edge stability.** If J is packing-edge-stable, so is J'. For an old deleted edge f, take a maximum J-f packing and append a new K4 face avoiding e; this still works when f=e. For a private deleted edge f, take a maximum J packing avoiding e, available by stability, and append any surviving face of K4-f. Such a face exists. The packing has nu(J)+1 triangles; the equality above gives optimality. Therefore every edge deletion preserves nu(J').

**Colour and connectivity.** A rainbow triangle edge-colouring extends: color ab as e, and assign the other two colors to the two opposite spoke pairs. All four K4 triangles are rainbow and old triangles are unchanged. If J has one nonempty shared-edge triangle component and e belongs to an old triangle, the new faces join it through e, so J' remains triangle-connected. These are actual graph-triangle assertions, not abstract hypergraph arithmetic.

## Eight-vertex counterexample to SMALL-CORE

Start with K4 blocks on {0,1,2,3} and {0,1,4,5}, sharing edge01. All eight actual triangles are the two K4 face families. Its packing number is2: one triangle per block is an upper bound and triangles023,145 attain it. Every edge is avoided by a maximum packing: choose a face avoiding it in its own block and a face avoiding the shared edge01 in the other block. Its minimum cover is uniquely

    {01,23,45}.

Each K4 needs two cover edges; a size-three cover must reuse the sole shared edge01, and then must choose the opposite edge of each block. Hence tau=3 and edge02 is in no minimum cover.

Attach a fresh K4 along02, using new vertices6,7. The complete edge list is

    01,02,03,04,05,06,07,12,13,14,15,23,26,27,45,67.

The full triangle family is exactly the faces of the three displayed K4 blocks:

    {0,1,2,3}, {0,1,4,5}, {0,2,6,7}.

The transfer proves nu=3, tau=5, all-edge packing stability, rainbow triangle edge-colourability, and one nonempty shared-edge triangle component. Therefore SMALL-CORE is false at its literal scope. Every one of these hypotheses is independently checkable and does not include a Tuza violation. The graph itself satisfies Tuza strictly.

## Iteration limit, explicitly not an unbounded claim

Exact minimum-cover enumeration gives seven minimum covers of the eight-vertex graph; edge03 is its sole edge excluded from every minimum cover. A second attachment along03 gives a ten-vertex graph with nu=4, tau=7,33 minimum covers and the same stability/connectivity/colourability. However every edge of that ten-vertex graph lies in SOME minimum cover. The proposed forbidden-edge iteration therefore stops on this branch. No unbounded stable slack-one connected family is proved by this experiment, and no patched bound nu<=4 is promoted as a theorem.

The exact evidence is `evidence/b_core_glue.json`: complete edges/triangles/colorings, every minimum cover, and a maximum packing avoiding each edge at all three stages. `checks/b_core_glue.py` reconstructs actual triangles, computes exact integer optima, and separately enumerates all cover subsets of the claimed optimum cardinality to check the complete minimum-cover lists. The ordinary transfer proof supplies the lower bound on cover optima and the upper bound on packing optima. Root's wall/RSS watchdog bounded the0.21second replay by20seconds/512MiB.

The earlier targeted crossedge-attachment batch completed2304 graphs with no timeouts and found no connected stable slack-one graph in that particular family. Those passing probes did not support SMALL-CORE; the subsequent explicit edge-gluing witness refutes it. Both runs are preserved. No heavy job remains from this scout.

## Meaning for AC and unrestricted Tuza

A first-frontier AC analysis can produce a packing-edge-stable slack-one remainder J=H-M. The example shows that one cannot simply replace that case by a two-packing core. The exact attachment could serve as a state-aware simplification only after proving compatible cover/packing transfer in the surrounding apex instance; the scalar identities above do not give that transfer automatically. Its global availability is also unproved.

Status: attachment lemma PROVED_ORDINARY; SMALL-CORE REFUTED by an exact graph witness; finite lists FINITE_CHECKED; historical originality UNESTABLISHED; unbounded iteration NOT_ESTABLISHED; independent_final_verification NOT_RUN; Lean NOT_RUN.


---

# B5. Preferred complete deterministic ear reductions

Source: `notes/B_FROZEN_ADDENDUM_5.md`.

# Frozen Track B addendum 5: final deterministic marked-ear reductions

The fresh internal critic supplied the simplification below. The earlier case-split proof in addendum4 is preserved unchanged as a valid, more complicated predecessor. This file is the final preferred statement: ONE explicitly determined smaller apex instance suffices. No packing-number oracle or two-branch recursion is needed. Exact AC is unchanged.

## Final K4-ear transfer

Let H contain Q=K4 on {u,v,a,b}, with N_H(a)={u,v,b} and N_H(b)={u,v,a}. Let X be any eligible marked apex neighborhood: H is rainbow triangle-edge-3-colourable and H[X] is triangle-free. Let G add z adjacent exactly to X. Put J=H-{a,b}-uv and X0=X intersect V(J).

If X intersects Q in exactly one old endpoint u and exactly one private vertex a (renaming endpoints/tips as needed), define Y=X0\{u}. In every other case define Y=X0. Then (J,Y) is an explicitly determined eligible smaller AC instance, and

    AC(J,Y) implies AC(H,X).

Thus AC failure for (H,X) implies AC failure for (J,Y). The map removes two vertices and six edges from H, and may remove one additional vertex from the marking only; it creates no new graph triangles. Both colourability and triangle-free induced-link eligibility are inherited.

**Minimum-cover identity and lift.** As proved in full in addenda3/4, tau(H)=tau(J)+2, and every minimum J cover C_J lifts to the MINIMUM H cover C=C_J union {uv,ab}. The normalization handles all covers: replace private Q-cover edges by uv and ab at no greater size. This identity is independent of the marking X.

**Nonexceptional marking.** Since H[X] is triangle-free, |X intersect Q|<=2. Outside the one-old/one-private pattern, selecting uv and ab removes every Q link edge; any surviving marked private vertex is isolated in the link. Therefore the residual link cost equals vc(J[Y]-C_J). Every packing in R=J+zY appends a Q face, because all Q-face edges are absent from R. AC(J,Y) consequently gives

    |C|+vc(H[X]-C)<=2nu(R)+2<=2nu(G).

**Exceptional marking.** Now X intersect Q={u,a}, and Y=X0\{u}. Let R=J+zY. Choose a minimum J cover C_J and residual-link vertex cover S supplied by AC(J,Y), so tau(J)+|S|<=2nu(R). The set S union {u} covers H[X]-C: it covers all remaining old link edges incident with u and the new leaf edge ua; S covers all other old residual link edges. Hence

    |C|+vc(H[X]-C)<=tau(J)+2+|S|+1<=2nu(R)+3.

Append the two actual triangles zua and vab to ANY R packing. They are mutually edge-disjoint. All their edges lie outside R: the za spoke and all a/b incident edges are absent since a,b were removed, and zu is absent because u was removed from the apex marking. Thus nu(G)>=nu(R)+2. It follows that the displayed cover cost is at most2nu(G)-1. This completes the deterministic reduction. QED.

The exact finite checks in `b_k4ear_allx.py` include both old-spoke stability cases and therefore also verify the stronger universal lower bound nu(G)>=nu(R)+2 for every exceptional marking: its saved R-without-endpoint-spoke is precisely this final R. The ordinary proof, not the finite run, establishes arbitrary order and outside incidence.

## Companion simplicial degree-two ear

This compact companion is recorded as one additional explicit operation, without starting a degree-by-degree program.

Suppose a is a vertex of H with N_H(a)={u,v} and uv is an edge. Let J=H-a-uv and Y=X\{a}; all old vertices remain. Then AC(J,Y) implies AC(H,X).

Indeed every H cover normalizes to include uv instead of any private ear edge, proving tau(H)=tau(J)+1 and that a minimum J cover C_J lifts to a minimum H cover C=C_J union {uv}. If a is in X, triangle-freeness permits at most one of u,v in X. Thus after selecting uv, the residual link differs from J[Y]-C_J by at most one leaf edge (and an isolated marked vertex otherwise). Its vertex-cover number is at most vc(J[Y]-C_J)+1. The triangle uva appends to every packing of R=J+zY, because its three edges are absent from R. Therefore

    |C|+vc(H[X]-C)<=tau(J)+1+vc(J[Y]-C_J)+1
      <=2nu(R)+2<=2nu(G).

If a is outside X, or has no marked old neighbor, the extra vertex-cover cost is zero. The map removes one vertex and three edges and preserves the AC class by restriction. QED.

## Scope and evidence

These two ordinary implications form a finite explicit reduction catalogue. Repeatedly applying them is well founded, but no theorem guarantees an applicable ear in every eligible remainder. Any smallest AC counterexample must avoid both configurations. No conclusion about arbitrary minimal Tuza counterexamples follows without an independently established eligible apex decomposition and an availability theorem for these or other safe operations.

Evidence: PROVED_ORDINARY for both counterexample-preserving transfer implications, with exact minimum-cover lifts. No Aharoni/HNS or unrestricted equality dependency. Historical originality UNESTABLISHED. New Lean NOT_RUN; independent_final_verification NOT_RUN. The deterministic K4 simplification is credited to fresh internal AI criticism, which is not the separately commissioned final audit.


---

# B6. Complete small-link classification and critical-edge lemma

Source: `notes/BOUNDARY6_FROZEN_LINK_LEMMA.md`.

# Frozen matching-five link lemmas and AC budget-six consequence

Frozen 2026-11-04 after the author sent the complete proof to root and Track B. This is an exact snapshot of the later sections in BOUNDARY_A.md, preserved for criticism. The original TUZA-17 clock/deadline are unchanged.

## Independently checked tight-frontier intersection obstruction

Coordinator proposal independently reconstructed by Track A. Assume m=b-1, choose ANY maximum L matching M, and suppose J=H-M is tight with k=nu(J)=p-m. Let R be the intersection of ALL maximum ordinary matchings of L. Then

    |R|>=m-1.

Proof. The declared graphical equality consequence gives k edge-disjoint K4 blocks containing all J triangles. Suppose f in M lies in an H triangle Q and some maximum L matching N avoids f. The triangle Q contains exactly one L edge, f, because L is induced triangle-free. It shares at most one edge with each J K4: sharing two would put all three Q vertices into that complete block and force f into J, impossible.

Each block contains at most one N edge, since it contains at most two X vertices. If a block sees both an N edge and a Q edge, the former has both endpoints in X and the latter has one endpoint in X and one outside; they share their X endpoint. Thus the two edges are adjacent, and a K4 face avoiding both exists. Pick such a face in every block. These k faces are edge-disjoint and avoid Q and every N edge. The m apex pages of N are mutually edge-disjoint and avoid Q because N omits f. Together with Q they give k+m+1=p+1 triangles, contradiction.

Therefore every old-supported f in M belongs to R. Cover J with2k edges and add only the old-supported M edges. Every H triangle missing from J uses an M edge, necessarily old-supported, so this covers H at cost at most2k+|R|. But frontier arithmetic gives tau(H)=2p-b=2k+m-1. Rearrangement proves |R|>=m-1. QED.

This proof is PROVED_USING_PUBLISHED_INPUT through the exact tight-J equality extraction. It does not replace a minimum cover by an arbitrary one in an AC argument; it supplies only the displayed necessary structural condition.

### R for the complete matching-five link classification

For every triangle-free F with mu(F)=5,vc(F)=7, |R|<=1. More exactly, R is nonempty only when F consists of two C5s and a disjoint K2, plusisolates; then it is the K2 edge.

If no vertex is essential, no edge belongs to every maximum matching, since its endpoints would then be essential. In the essential-vertex representation, a matching formed from one center-leaf edge and maximum matchings in the two C5s avoids every center-cycle edge and can avoid any chosen cycle edge. If there are at least two leaves, alternate the chosen leaf to avoid any center-leaf edge. If there is just one leaf but the center has a cycle neighbour x, match center to x, take a perfect matching of C5-x, and a maximum matching of the other C5; this avoids the sole leaf edge and still has size5. Only the disconnected single K2 case leaves a forced edge. All claims concern exact ordinary matching states of the link.

## Every matching-five, cover-seven link has a cover-critical allowed edge

Call an edge e **cover-critical** here if vc(F-e)=vc(F)-1, and **allowed** if some maximum ordinary F matching contains e. These terms concern the LINK, not triangle covers or triangle packings of H.

**Lemma.** Every finite triangle-free F with mu(F)=5 and vc(F)=7 contains an edge that is both cover-critical and allowed.

For the essential-vertex representation above, choose any C5 edge. Deleting it leaves a five-vertex path with a2-vertex cover. Choose the star center, this2-cover, and a3-cover of the other C5, obtaining6vertices. The chosen edge lies in a maximum matching consisting of a center-leaf edge and suitable two-edge matchings in each C5. Thus it has both properties.

For the no-essential case with two components, choose a C5 edge again; its deletion lowers the total cover number by one, and it is allowed. It remains to handle the11-vertex triangle-free factor-critical component F with independence number4.

### Elementary eleven-vertex lemma

Every triangle-free graph on11vertices with independence number4 has a cover-critical edge.

Choose a maximum independent set A of size4, and let B be the other7vertices. If some x in B has just one neighbour a in A, then A union {x} becomes independent after deleting xa, proving that edge cover-critical. Zero neighbours would already contradict alpha(F)=4. Hence assume every x in B has at least two A-neighbours.

Adjacent B vertices must have disjoint A-neighbourhoods, or they form a triangle with a shared A-neighbour. Consequently every B edge joins vertices whose A-neighbourhoods are complementary2-subsets of A. There are three complementary pairs of2-subsets; write their class sizes as (p_i,q_i), i=1,2,3. Let r count B vertices having three or four A-neighbours. These r vertices are isolated in F[B]. Selecting the larger class from each complementary pair, together with these r vertices, is independent, so

    (7+r+sum_i |p_i-q_i|)/2 <= 4.

The nonnegative integer r+sum_i|p_i-q_i| is odd, since the numerator is even. Therefore it equals1.

If r=0, exactly one pair is unbalanced by one. Select its larger class, whose A-neighbourhood is some2-set S, and fix a in A-S. From each balanced pair select the side whose A-neighbourhood omits a. These choices give an independent4-set C inside B, none of whose vertices is adjacent to a. Thus C union {a} is independent of size5, contradiction.

If r=1, every pair is balanced. Let w be the unique B vertex with three or four A-neighbours, and choose a neighbour a of w in A. From each complementary pair select the side omitting a, and include w. This is an independent4-set C. Its only neighbour of a is w. Deleting edge aw makes C union {a} independent of size5, so aw is cover-critical. This proves the eleven-vertex lemma.

Finally every edge uv of a factor-critical component is allowed: take a perfect matching of F-u, let vw be its edge covering v, and replace vw by uv. The result is a maximum F matching containing uv. Thus the cover-critical edge from the eleven-vertex lemma is also allowed. This completes the classification-based lemma. QED.

All arguments in this subsection are elementary and unbounded in the number of irrelevant isolated vertices; the only finite orders arise from the proved matching decomposition. No graph census or solver was used.

## Consequence: b<=6 is now settled for AC, subject to internal criticism

This is a joint deduction from the preceding shape lemmas and the coordinator's cover-loss observation; it does not assert raw-boundary nonrealizability. Suppose an eligible instance with b=6 failed AC. Matching bounds and the earlier b<=5/saturation results force m=5 and lambda=vc(L)=7. Choose a cover-critical allowed edge e from the lemma and a maximum matching M containing it. Every minimum H cover must omit e, since a cover containing e would leave residual link vertex cover at most vc(L-e)=6. Therefore tau(H-e)=tau(H).

Delete e first and the other four M edges next. Then

    tau(H-M)>=tau(H)-4=2p-10=2(p-5).

Aharoni and the packing identity bound the same quantity above by2nu(H-M)<=2(p-5), forcing J=H-M to be tight. The independently checked intersection obstruction gives |R|>=m-1=4. The complete link classification gives |R|<=1. Contradiction.

Thus every eligible b=6 instance satisfies AC, and together with earlier cases this proves AC whenever b<=6. Evidence category is PROVED_USING_PUBLISHED_INPUT through Aharoni/HNS; the new link classification and cover-critical-edge lemma are PROVED_ORDINARY. Historical originality remains UNESTABLISHED, and independent_final_verification remains NOT_RUN. This proof has been sent for internal AI criticism; no positive status should be inferred beyond its exact hypotheses.

The next numerical AC-obstruction window has b>=7. This does NOT prove that full eligible parameter instances at the earlier raw boundaries cannot exist. Raw realizability and AC failure are different questions; no eligible boundary embedding has been constructed here.


---

# B7. Combined budget-six proof and independent mathematical verification

Source: `notes/CRITIC_BUDGET_SIX.md`.

# Fresh internal check of the budget-six closure

This addition supersedes ONLY the earlier statements that b=6 was an unresolved AC-failure boundary. Earlier frozen reports and their hashes remain unchanged. The original TUZA-17 deadline is unchanged. This is collaborative internal AI mathematics, not a separately commissioned independent final verification.

Track A supplied the universal cover-critical link-edge proof in BOUNDARY_A.md. This critic independently reconstructed its combinatorial argument, checked its use in every matching-five link class, and checked the final contradiction. **Verdict: valid at the literal AC hypotheses. AC is proved whenever b=2nu(G)−tau(H)≤6.** The proof uses Aharoni/HNS only through the scoped matching bounds and tight-residual K4 structure already reviewed; the new link argument is elementary. Full AC remains unresolved.

## 1. The eleven-vertex lemma survives all counting and adjacency checks

**Lemma.** Every triangle-free graph F on eleven vertices with independence number four has an edge f such that alpha(F−f)=5, equivalently vc(F−f)=vc(F)−1.

Choose a maximum independent set A of size four; its complement B has seven vertices. Suppose no such edge exists. A B vertex with no A neighbor would extend A to an independent five-set. A B vertex with exactly one A neighbor would make that incident edge critical, since deleting it makes A plus that vertex independent. Hence every B vertex has at least two A neighbors.

If two B vertices are adjacent, their A-neighborhoods are disjoint, because a common A neighbor would form a triangle. As both neighborhoods have size at least two inside a four-set, both have size exactly two and are complementary. Thus B edges occur only between complementary two-subset label classes. There are three complementary pairs, with class sizes p_i,q_i. Let r count the vertices with three or four A neighbors. Such vertices have NO B neighbors: their label cannot be disjoint from any other label of size at least two.

Selecting the larger class in each complementary pair, and all r remaining vertices, gives an independent set in B. Classes belonging to different complementary pairs cannot have edges between them; vertices within a class share A neighbors and also cannot be adjacent. Therefore

    (7+r+sum_i|p_i−q_i|)/2 ≤ 4.

The nonnegative integer r+sum_i|p_i−q_i| is odd, because sum_i(p_i+q_i)=7−r and each difference has the same parity as its corresponding sum. It is at most one, so it equals one. This step remains valid if some classes are empty.

If r=0, exactly one complementary pair has a one-vertex imbalance. Let S be its larger class's two-element label, and choose a in A outside S. Select that larger class. In each balanced pair select the class whose label omits a; equality of the two class sizes preserves the maximal count. The selected B vertices form an independent four-set with no neighbor a. Adding a gives an independent five-set, contradiction.

If r=1, all pairs are balanced. Let w be the unique three/four-neighbor vertex and choose an A neighbor a of w. Select from each pair its class omitting a and also select w. These are four independent B vertices; among them, a is adjacent only to w. Deleting aw produces an independent five-set, contradiction to the no-critical-edge assumption.

Deleting one graph edge can increase independence number by at most one: from an independent set using both deleted-edge endpoints, remove one endpoint to obtain an old independent set. Thus the constructed increase is exactly one. QED.

No graph census, degree assumption, factor-criticality assumption or uninspected Ramsey theorem enters this lemma. In particular, the proof covers all triangle-free eleven-vertex graphs with alpha=4, not just the checked circulant example.

## 2. Every mu=5, vc=7 link has an allowed critical edge

The complete matching-five link classification was checked in BOUNDARY_CRITIC.md and CRITIC_TIGHT_FRONTIER.md and is restated fully in BOUNDARY_A.md. It gives these cases, up to isolated vertices.

**There is a universally matched vertex v.** Removing v leaves two C5s and isolated vertices, and v has an isolated neighbor w. Choose any edge f of either cycle. A cover of F−f consists of v, a two-cover of the broken five-cycle path, and a three-cover of the other C5; size six. The edge f belongs to a maximum matching: use vw and a two-matching in each C5, choosing the first to contain f. Thus f is both vertex-cover-critical and maximum-matching-allowed.

**No universally matched vertex; two nontrivial components.** These are C5 and a seven-vertex triangle-free factor-critical graph with independence number three. A C5 edge has both required properties by component addition.

**No universally matched vertex; one nontrivial component.** This is an eleven-vertex triangle-free factor-critical graph with independence number four. The preceding lemma supplies a cover-critical edge. Every edge uv of a factor-critical graph is maximum-matching-allowed: take a perfect matching of F−u, write vw for its edge at v, and replace vw by uv. The resulting matching has maximum cardinality and contains uv. This is an edge replacement, not an unsupported assertion about extension of arbitrary matchings.

The cases exhaust matching number five because every nontrivial triangle-free factor-critical component has matching number at least two. Consequently every triangle-free link with mu=5 and vc=7 has an edge f satisfying

    vc(L−f)=6,
    f belongs to some maximum L matching.

The forced-edge-intersection bound |R|≤1 remains valid in all cases, with isolated neighbors explicitly accounted for.

## 3. Exact AC contradiction at b=6

The matching bound m≤b, saturation when m=b, and ordinary vertex-cover bounds reduce a putative b=6 AC failure to

    m=5, vc(L)=lambda=7.

Choose the allowed critical edge f above and a maximum matching M containing f. Every minimum H triangle-edge cover must avoid f. Otherwise its residual link is a subgraph of L−f and has vertex cover at most six, proving AC.

Therefore tau(H−f)=tau(H). If deleting f lowered the old cover optimum by one, adding f to a minimum residual cover would produce a minimum H cover containing f. Delete f first, then the other four matching edges. With p=nu(G) and k=p−5,

    tau(H−M)≥tau(H)−4=2p−10=2k.

Aharoni for the inherited rainbow-coloured residual and the actual apex-page packing bound give

    tau(H−M)≤2nu(H−M)≤2k.

Hence J=H−M is tight. The independently checked tight-frontier theorem in CRITIC_TIGHT_FRONTIER.md forces the intersection R of all maximum link matchings to have at least m−1=4 edges. The complete link classification gives |R|≤1. Contradiction.

Thus AC holds at b=6, and the earlier b≤5 argument proves the full scoped theorem b≤6. It is the original existential minimum-cover AC statement. The proof neither substitutes an arbitrary cover nor claims that every minimum cover works in the critical cases.

## 4. Correct updated boundary and realizability statement

The first remaining conditional numerical AC-failure stratum is now

    b=7, m=6, 8≤lambda≤vc(L)≤9.

Indeed m≤5 gives vc(L)≤7 and every minimum H cover works; m=7 is saturation; m≥8 is impossible. At m=6, choose one safe endpoint from every maximum-matching edge as in the elementary triangle-free bound. The six safe endpoints induce a triangle-free graph and contain an independent triple by the proved six-vertex Ramsey argument. Removing that triple from the twelve matched endpoints leaves a vertex cover of size nine. Failure requires lambda≥8.

This is a conditional parameter window, NOT a claimed realized full apex instance or counterexample. No H satisfying the entire updated tuple, its exact triangle-cover number, its exact apex packing number, and all eligibility hypotheses has been constructed in this review. The theorem b≤6 excludes AC FAILURE at earlier budgets; it does not prove numerical nonrealizability of eligible instances with the earlier raw budget/link parameters. The distinction demanded by the user remains intact.

The proposed universal helper “every matching-five/cover-seven link has an allowed critical edge” is now PROVED, so passing or failing link-only searches are unnecessary to its validity. This does not settle the analogous matching-six question and does not authorize inferring a global AC theorem from the low-budget cases.

## 5. Status and provenance

The new eleven-vertex and allowed-edge lemmas are PROVED_ORDINARY. The b≤6 AC theorem is PROVED_USING_PUBLISHED_INPUT through Aharoni/HNS at the exact eligible tight-residual scope. All face-avoidance, old/apex triangle classification, matching-edge deletion and minimum-cover quantifiers were explicitly checked in the preceding critic notes.

This critic did not write Track A's eleven-vertex proof; it independently checked it after receipt. The overall chain is collaborative internal AI research and criticism. Historical originality UNESTABLISHED; full AC UNRESOLVED; global applicability to arbitrary minimal Tuza counterexamples UNESTABLISHED; new Lean and independent_final_verification NOT_RUN.


---

# B8. General matching certificate and unbounded Petersen limitation

Source: `notes/B_FRONTIER_MATCHING_CERTIFICATE.md`.

# An unbounded link certificate for the first matching frontier

Joint coordinator/scout argument, 4 November2026. This is a structural certificate for AC, not a new version of AC. It packages the low-budget proofs without claiming that the certificate exists for every triangle-free link.

## Theorem

Let (H,X) be eligible for the literal AC target. Let L=H[X], G=H+zX, p=nu(G), b=2p-tau(H), and m=matching(L). Suppose m=b-1. Write R_L for the intersection of ALL maximum ordinary matchings of L. Assume

1. some maximum matching M of L satisfies vc(L-M)<=b; and
2. |R_L|<=m-2.

Then AC holds.

An equivalent usable form of the first hypothesis is an explicitly given F subset M with vc(L-F)<=b. The matching must actually be maximum; no assertion that an arbitrary prescribed graph-edge matching extends is assumed. This is ordinary matching data on the LINK, not a prescribed triangle packing in H.

## Complete proof

Assume AC fails. No minimum H triangle-edge cover can contain M, because such a cover C would leave

    vc(L-C)<=vc(L-M)<=b.

The exact minimum cover containing M has size m+tau(H-M). Indeed its restriction outside M must cover H-M, and M plus any residual cover covers every H triangle. Since this cover is not minimum,

    tau(H-M)+m>=tau(H)+1.

Set J=H-M and k=p-m. Frontier arithmetic b=m+1 gives

    tau(J)>=tau(H)-m+1=2p-b-m+1=2k.

On the other hand J inherits the rainbow triangle edge-colouring, and M's apex pages append to any J packing. Aharoni therefore gives

    tau(J)<=2nu(J)<=2(p-m)=2k.

Equality holds throughout. The declared HNS graphical equality extraction and TUZA-03 exhaustion give k edge-disjoint actual K4 blocks containing every J triangle.

We next show every edge f in M that belongs to an H triangle belongs to R_L. Suppose instead that Q is an H triangle containing f and a maximum L matching N avoids f. Q contains exactly one L edge, f, by induced triangle-freeness. It meets each J K4 in at most one edge: two shared edges would put all Q vertices in that complete block and force f into J. Its possible block edge has exactly one endpoint in X. Each block contains at most one N edge, whose two endpoints are in X. If both edges occur in a block, their X endpoints force them to be adjacent: opposite edges would place three X vertices in the block, contradicting H[X] triangle-free. Select a face in each block avoiding both possible edges. Such a face exists for two adjacent forbidden edges, and certainly for zero or one.

These k faces, Q, and the m apex pages of N form an edge-disjoint G packing: block edges are mutually disjoint; Q avoids N because its sole L edge f is absent from N; all selected faces avoid Q and N; and the new spokes are distinct because N is a matching. This gives p+1 triangles, contradiction. Hence every old-supported M edge is in R_L.

Cover all J block faces with two edges per block and add the old-supported M edges. Every H triangle outside J contains one of those edges, so this covers H at size at most2k+|R_L|. But

    tau(H)=2p-b=2k+m-1,

forcing |R_L|>=m-1, contrary to hypothesis2. Thus AC holds. QED.

The positive theorem uses Aharoni/HNS only for the justified tight J. The final inequality uses an arbitrary H cover only to bound tau(H); it does not silently promote that cover to a minimum compatible cover. The contradiction began with the exact all-minimum-cover failure assertion.

## Example of an application

For L=3C5, m=6 and vc(L)=9. At b=7, choose a maximum matching containing one chosen edge in each of two cycles. Deleting those two edges lowers vc to7; hence deleting the entire matching also has vc at most7. No edge belongs to every maximum L matching, so |R_L|=0. The theorem therefore proves AC for this link shape at b=7, regardless of old outside incidence. A bare3C5 link is consequently not an uncovered AC discriminator at that budget.

## Exact limitation: the link certificate is not universally available

Define P, the Petersen graph, with vertices u_i,v_i for i modulo5 and edges

    u_i u_(i+1),  v_i v_(i+2),  u_i v_i.

It is cubic and triangle-free. It has no4-cycle: a mixed4-cycle would use two spokes and require the same index pair to be adjacent in both the outer5-cycle (difference1) and inner5-cycle (difference2), impossible; a single layer is a5-cycle. The five spokes give a perfect matching, so mu(P)=5.

Every maximum matching M is perfect, and P-M is a2-factor. Girth5 implies it is either a10-cycle or two5-cycles. P has no Hamilton10-cycle, as the following elementary spoke count shows. A Hamilton cycle must use an even positive number of spokes, hence2 or4. With2 spokes, the outer and inner horizontal edges must each form a spanning5-vertex path, whose endpoints must be adjacent in its respective5-cycle; the two spoke indices would have to differ both by1 and by2, impossible. With4 spokes, rotate so the omitted spoke is u_0v_0. Horizontal degrees force outer edges u_4u_0,u_0u_1,u_2u_3 and inner edges v_3v_0,v_0v_2,v_1v_4. Together with spokes1,2,3,4 these form two5-cycles, not a Hamilton cycle. Thus every P-M is exactly2C5 and

    vc(P-M)=6.

No edge is forced in every maximum P matching. The all-spoke matching avoids every horizontal edge. To avoid a prescribed spoke i, choose a different spoke j and perfect matchings of each layer after deleting index j; their union with spoke j is a perfect matching avoiding i.

Now take L to be the disjoint union of q copies of P, q>=2. It is a literal triangle-free graph with m=5q and R_L empty. Every maximum L matching is perfect on each component, so

    vc(L-M)=6q>5q+1=m+1

for every such M. Therefore hypothesis1 of the frontier theorem can fail even though hypothesis2 is as strong as possible.

This is a limitation on the LINK-ONLY certificate. It is NOT an AC counterexample and does not construct an eligible H with budget b=m+1. Taking H=L is eligible but has budget2m, a different regime. The example prevents extending the certificate to all triangle-free links merely because a finite small-link test passed.

Evidence: frontier theorem PROVED_USING_PUBLISHED_INPUT; the Petersen-family limitation PROVED_ORDINARY. Historical originality UNESTABLISHED. Full AC unresolved; independent_final_verification NOT_RUN.

## Supplemental complete finite certificate

`checks/b_petersen.py` independently reconstructs the literal10-vertex graph, enumerates all SIX perfect matchings by pairing the least remaining vertex with each available neighbor, and verifies that every complement has exactly two5-cycle components. This recurrence is complete: every perfect matching has exactly one possible partner for that least vertex and then restricts to a perfect matching on the remaining vertices. The output `evidence/b_petersen.json` lists every matching and complement, verifies empty intersection, and independently enumerates the maximum independent4-sets (hence vc(P)=6). A10-second/128MiB external watchdog bounded the completed tiny check. The ordinary non-Hamilton proof above remains available, so the unbounded disjoint-union conclusion does not depend on an unexplained finite verdict. This is FINITE_CHECKED supplemental evidence, not independent_final_verification.


---

# B9. Budget-seven link shapes and explicit matching certificates

Source: `notes/BOUNDARY7_PROBE.md`.

# Frozen local test for the budget-seven boundary

Same TUZA-17 mission; original deadline unchanged. Frozen before the finite test. Root authorizes this tiny exact link probe with no other heavy computation running. This does not assert a full eligible H,X realization.

## Exact sufficient criterion

Let an eligible AC instance have m=mu(L)=b-1, and let R be the intersection of all maximum L matchings. Suppose |R|<m-1 and there is a maximum matching M of L with

    vc(L-M)<=b.

Then AC holds for this instance. More generally it suffices that F subset M has vc(L-F)<=b.

Proof. Under AC failure no minimum H cover contains F. The exact forced-cover identity gives |F|+tau(H-F)>=tau(H)+1. Deleting the remaining M edges lowers tau by at most their count, so tau(H-M)>=tau(H)-m+1=2(p-m). Aharoni and the apex packing bound force H-M tight. The tight-frontier intersection lemma then gives |R|>=m-1, contradiction. No outside-incidence assumptions are omitted. This criterion depends on the previously declared equality input through that lemma; it is not an identity presented as compatibility.

## Literal finite test

Test L=C13 with edges whose endpoint difference modulo13 is in {1,5,8,12}. Reconstruct its full edge set, verify triangle-freeness, compute exact ordinary matching number and independence/vertex-cover numbers. Determine whether some maximum matching M has vc(L-M)<=7. Equivalently, seek a vertex set I of size at least6 for which L[I] is a matching F that extends to a maximum L matching. Also record the minimum number of induced edges on a6-set and the number of6-sets inducing a matching.

The comparison control is three disjoint C5s (matching6,cover9). This probes the sufficient criterion, not AC itself. If the criterion fails for a link, arbitrary outside H attachments remain unresolved and no AC counterexample is asserted. A full eligible instance still needs b=2nu(G)-tau(H)=7 and the original minimum-cover condition.

Exact algorithms will use finite integer subset recurrences and a separately checkable explicit witness when one exists. Time/RSS watchdogs apply. No broad all-graphs census is permitted or planned.

## Exact matching-six, cover-nine classification

**Lemma.** If a triangle-free graph F has mu(F)=6 and vc(F)=9, then, apart from isolated vertices, it is either three disjoint C5s or one13-vertex triangle-free factor-critical graph of independence number4. In both cases the intersection R of all maximum matchings is empty.

Proof. An essential vertex would leave matching5 and cover number at most7, hence give vc(F)<=8; so no vertex is essential. Gallai's elementary lemma makes all components factor-critical. Each nontrivial triangle-free component has matching number at least2. The partitions of6 are6,4+2,3+3,2+2+2. The middle two possibilities have covers at most5+3=8 and4+4=8, using the9-vertex independent4-set and7-vertex independent3-set bounds. The last possibility is three C5s. The first is a13-vertex factor-critical component, where cover9 means independence4. A forced matching edge would make both endpoints essential, so R is empty. QED.

This classification uses no enumeration or external Ramsey-graph uniqueness claim. Any such completeness input is a separate declared dependency owned by the coordinator.

## Explicit C13 witness for the sufficient criterion — PROVED_ORDINARY

Let L have vertices modulo13 and edges of differences plus/minus1 and plus/minus5. It is triangle-free: the neighbours {1,5,8,12} of0 are independent, as their pair differences are never plus/minus1 or plus/minus5; translation handles every vertex.

The cycle of difference1 gives a maximum matching of size6 and a perfect matching after deletion of any vertex. Hence L is factor-critical, mu(L)=6, and R is empty.

Its independence number is4. The set {0,2,4,6} is independent. If an independent5-set existed, the cyclic gaps between its successive vertices would all be at least2 and sum13. Up to order, their only patterns are

    (5,2,2,2,2), (4,3,2,2,2), (3,3,3,2,2).

The first has an arc of length5, a forbidden edge. In the second, the gap3 has at least one gap2 neighbour because there is only one gap4. In the third, some gap2 and gap3 are consecutive. Their sum5 again gives a forbidden edge. Thus no independent5-set exists, proving vc(L)=9.

Take

    I={0,1,3,4,7,10},
    F={01,34},
    M={01,34,56,78,9-10,11-12}.

The ONLY edges induced by I are01 and34. Both belong to the displayed maximum matching M. Consequently I is independent in L-M and its complement

    S={2,5,6,8,9,11,12}

is a vertex cover of L-M of size7. Thus the sufficient criterion applies: EVERY eligible AC instance with this exact induced link, arbitrary outside incidence, and b=7 satisfies AC. This is an unbounded statement about the possible surrounding H, justified by the exact finite link certificate plus the general transfer. It does not assert that a full eligible H with this link and b=7 exists.

For comparison, when L=3C5, choose one edge from two distinct cycles and extend them to a maximum matching M. Deleting those two edges reduces link vertex-cover number from9 to7. Since R is empty, the same criterion proves AC in the b=7 branch with this link.

## Actual bounded computation

`checks/a_boundary_link_probe.py` reconstructed only the two frozen links. It used exact vertex-subset matching and independence recurrences, then exhaustively considered every vertex subset I to determine whether the induced edge set is a matching that can extend to a maximum link matching. This tests the criterion for ALL maximum matchings without trusting a single greedy choice: I can become independent after deleting a matching exactly when its induced edges form a matching extendable to that matching.

For C13 it obtained matching6, cover9, and minimum residual cover7 over all maximum-matching deletions; there are26six-vertex subsets inducing a matching, and the minimum induced-edge count on six vertices is2. For3C5 it obtained matching6, cover9 and minimum residual cover6. The explicit witnesses are retained in evidence/a_boundary_link_probe.json. The C13 criterion's sufficiency is also checked directly in the ordinary proof above; no exact numerical optimisation verdict is needed for that implication.

Run time was about0.067s in the child and0.214s under the watchdog. CPU/alarm45s and wall50s/sampled-RSS384MiB bounds were applied. Logs and limits are evidence/a_boundary_link_probe.log and .limits.json. No process remains. This was not a broad all-graphs census, and no full H/G boundary search was run by this scout.

## Scope at development closeout

The b=7,matching6,cover8 link branch is not settled by this note. The thirteen-vertex cover9 branch requires either an argument for every graph in that class or a declared complete catalogue plus checked isomorphism; the coordinator is assessing that separate input. The explicit C13 calculation alone does not supply catalogue completeness. No raw boundary realization or AC counterexample has been constructed here. The strongest global obstruction remains lack of an availability theorem placing arbitrary minimal Tuza counterexamples into the eligible apex class.

## Final disposition at Track A handoff

The budget<=6 deduction was accepted by the fresh internal critic (notes/CRITIC_BUDGET_SIX.md). The coordinator authenticated the external thirteen-vertex Ramsey catalogue and its isomorphism to the displayed C13; notes/CRITIC_CATALOGUE_SCOPE.md accepts that separately declared completeness input, not an internally recomputed census. With that input, the budget7,cover9 branch is also settled. The first remaining conditional numerical AC branch is b=7,m=6,lambda=vc(L)=8. A full eligible H,X realization at that boundary is UNKNOWN; none was constructed here. Literal AC remains unresolved. No further search is running or authorized by this handoff, and independent_final_verification remains NOT_RUN. Earlier freezes are preserved as chronology rather than silently promoted.


---

# B10. Exact catalogue-dependent elimination and its audit boundary

Source: `notes/CRITIC_CATALOGUE_SCOPE.md`.

# Final targeted check: matching subsets and the thirteen-vertex catalogue

Same TUZA-17 mission and original deadline. This is an additional internal AI review requested by the coordinator after the user's boundary steering. Prior frozen critiques remain unchanged. No broad graph census was run.

**Verdict:** the generalized matching-subset criterion is valid. The explicit three-C5 and thirteen-vertex circulant witnesses satisfy it. The reduction from all matching-six/cover-nine links to those two shapes is valid **with McKay's catalogue completeness explicitly accepted as an external input**. The b≤6 theorem has no dependence on this new catalogue.

## 1. Generalized sufficient criterion, with the joint minimum-cover constraint retained

Let H,X,L,G satisfy literal AC, write p=nu(G), b=2p−tau(H), m=mu(L), and suppose m=b−1. Let R be the intersection of all maximum ordinary link matchings. Assume |R|<m−1. If there exists a maximum matching M and a subset F of M such that

    vc(L−F)≤b,

then AC holds.

Suppose instead AC fails. No minimum H triangle-edge cover can contain ALL of F, because its residual link would be a subgraph of L−F and would have vertex cover at most b. The exact minimum size of an H cover containing F is

    |F|+tau(H−F).

Indeed restricting such a cover after removing F covers H−F, and conversely a cover of H−F together with F covers every H triangle. Thus integrality gives

    |F|+tau(H−F)≥tau(H)+1.

Delete the remaining m−|F| matching edges to obtain

    tau(H−M)≥tau(H)−m+1=2(p−m).

Aharoni and the actual apex packing bound give tau(H−M)≤2nu(H−M)≤2(p−m), so the residual is tight. The already checked tight-frontier theorem then forces |R|≥m−1, contradiction.

The joint condition matters. For |F|>1, individual edges of F may each belong to some minimum H cover even though no minimum cover contains the entire set. The proof does NOT assume separate zero-cost deletions. It uses the exact forced-cover identity for F as a set. Matching EDGES are deleted, and all triangle families are full actual graph triangle families. The sufficient criterion has no outside-incidence restriction.

## 2. Explicit ordinary witnesses at b=7

### Three disjoint C5s

Label their vertices 0–4, 5–9, and 10–14 cyclically. The link has matching number six and vertex-cover number nine. Choose

    F={01,56},
    M={01,23,56,78,(10,11),(12,13)}.

M is maximum and contains F. The seven vertices {2,4,7,9,10,12,14} cover L−F. The intersection R of all maximum matchings is empty, since a C5 has maximum matchings avoiding each of its edges. Thus the sufficient criterion proves AC for every eligible surrounding instance with this link and b=7, including arbitrary extra isolated link vertices.

### The thirteen-vertex circulant

Let L have vertices Z/13Z and edges of difference ±1 or ±5. Its verified ordinary parameters are mu=6 and vc=9. Let

    I={0,1,3,4,7,10},
    F={01,34},
    M={01,34,56,78,(9,10),(11,12)}.

The graph induced on I has exactly the two edges F. Therefore its seven-vertex complement covers L−F. M is an actual six-edge matching, hence maximum, and contains F. The ordinary 13-cycle is a spanning subgraph. Its thirteen rotated near-perfect matchings are maximum matchings of L and have empty intersection, proving R is empty. The criterion again proves AC for every eligible surrounding instance with this link and b=7.

These are unbounded statements about arbitrary eligible H attachments, obtained from explicit finite LINK certificates. They are not constructions of a surrounding H with budget seven and not AC counterexamples.

## 3. Why matching-six/cover-nine links have only the stated structural possibilities

Let L be triangle-free with mu(L)=6 and vc(L)=9. No vertex can be covered by every maximum matching: deleting such a vertex would give matching number five and vertex cover at most seven by the already proved ordinary bound; adding the vertex back would give vc(L)≤8.

Thus the elementary Gallai argument applies componentwise, making every nontrivial component factor-critical. Such a triangle-free component has matching number at least two. The nonzero component matching numbers partition six as

    6; 4+2; 3+3; or 2+2+2.

For 4+2, the component orders are nine and five, with cover bounds five and three, totaling at most eight. For 3+3, both orders are seven and both covers at most four, again totaling at most eight. The remaining possibilities are:

- three C5 components; or
- one thirteen-vertex triangle-free factor-critical component with independence number four.

Arbitrary isolated vertices are allowed. This reduction is proved ordinarily, using only the previously proved matching decomposition and small triangle-free independent-set bounds. It is NOT itself a classification of all thirteen-vertex Ramsey graphs.

## 4. Exact external catalogue dependency

I directly inspected [Brendan McKay's Ramsey graph catalogue](https://users.cecs.anu.edu.au/~bdm/data/ramsey.html). It defines Ramsey(s,t,n) graphs by absence of the specified clique and independent set, labels the relevant section **All Ramsey(3,5)-graphs**, and lists one graph at thirteen vertices. This section is distinct from later sections explicitly restricted to maximal graphs. The linked [thirteen-vertex graph6 record](https://users.cecs.anu.edu.au/~bdm/data/r35_13.g6) contains one graph. The mission saved both page and record locally.

Accepted external input: this published catalogue is complete up to isomorphism for triangle-free thirteen-vertex graphs with no independent five-set. The catalogue's exhaustive generation and completeness proof were NOT independently reconstructed or rerun in this mission. Inspecting one downloaded record cannot verify that there are no omitted records. The classification-based conclusion below retains that explicit dependency.

New independent code `checks/critic_catalogue.py` reads the downloaded graph6 bytes without importing the coordinator's checker. It decodes adjacency directly, verifies triangle-freeness and independence number four by exact enumeration, constructs an isomorphism to the ±1,±5 circulant, and checks that bijection against every edge. It also independently verifies both displayed matching-subset witnesses and the empty-intersection cycle certificates. Results are in `evidence/critic_catalogue.json`.

The watchdog run completed successfully in 0.213 seconds with a 60-second/512 MiB sampled-RSS limit. This is a check of ONE catalogue record and two explicit witnesses, not a broad graph census or a recomputation of catalogue completeness.

## 5. Conditional scope conclusion and unchanged earlier theorem

With the declared primary catalogue completeness accepted, every thirteen-vertex component in Section3 is isomorphic to the checked circulant. Hence ALL eligible AC instances satisfying

    b=7, mu(L)=6, vc(L)=9

satisfy AC, by the ordinary structural reduction and matching-subset criterion. Evidence category: **PROVED_USING_DECLARED_CATALOGUE_AND_PUBLISHED_INPUT**, the latter including the scoped Aharoni/HNS dependency of the tight-frontier theorem.

Without relying on catalogue completeness, the ordinary proof still settles the explicit three-C5 and circulant link shapes, while the universal thirteen-vertex classification remains an external obligation. This distinction must not be erased by the local isomorphism PASS.

The theorem AC for b≤6 remains exactly as proved in CRITIC_BUDGET_SIX.md and has no McKay catalogue dependency. With the catalogue-supported branch included, the next conditional numerical AC-failure case at budget seven is

    b=7, m=6, vc(L)=lambda=8.

This remaining stratum is unresolved here. No full eligible H realizing it has been supplied by this critic. Proving AC on a parameter stratum excludes failure, not raw numerical realizability of eligible instances. Full AC and unrestricted Tuza remain unresolved; no global apex or ear availability theorem has been established.

Originality UNESTABLISHED. New Lean and separately commissioned independent_final_verification NOT_RUN. Earlier critic notes remain byte-for-byte unchanged.


---

# B11. Full-instance realizability constraints and remaining unknown

Source: `notes/B_BOUNDARY_REALIZABILITY.md`.

# Boundary realizability: symbolic restrictions after the ear freeze

Prepared during the owner-steered boundary investigation. These statements distinguish an arithmetic budget window from an actual eligible graph realization. No AC counterexample or first-boundary realization is asserted here.

## 1. A general lower bound on the old packing size

Let (H,X) be any eligible AC instance, L=H[X], h=nu(H), and a=nu(G)-h. Fix ANY maximum H triangle packing P. Let F be the subgraph of L consisting of link edges unused by P. Every F matching gives apex triangles edge-disjoint from P, hence

    matching(F)<=a.

Every H triangle has at most one L edge: two would put its three vertices in X and contradict induced triangle-freeness. Thus P uses at most h L edges. Define

    rho_a(L)=max {|E(F)| : F is an edge-subgraph of L with matching(F)<=a}.

Then |E(L)|-h<=|E(F)|<=rho_a(L), giving the exact necessary bound

    h>=|E(L)|-rho_a(L).

This uses only actual edge-disjointness and contains no unknown-optimum assumption beyond the mathematical definition of a. It is a pruning theorem, not an existence certificate.

In particular a=0 forces EVERY L edge to appear in every maximum H packing, so h>=|E(L)|. Equivalently every L edge is packing-essential in H. For a=1, F is a triangle-free graph of matching number at most1, hence a star (or empty), giving rho_1(L)=Delta(L) for nonempty L. To see the star claim, a pairwise intersecting graph-edge family is either a star or the three edges of a triangle; the latter is excluded.

## 2. Tight H has more packing gain than the initial AC-0 proof needed

If D(H)=0, published-input equality exhaustion gives edge-disjoint K4 blocks covering all H triangles. Each block has at most one L edge, so choose a face avoiding that edge. These h faces avoid ALL L edges simultaneously, including link edges outside the blocks. Appending a maximum L matching proves

    a>=matching(L)=m,  b=D+2a>=2m.

This is an equality-scope deduction only. It does not classify any non-tight H.

## 3. Saturated budget with zero gain forces a perfect link matching

Suppose m=b and a=0. For any maximum matching M of L, the saturated-matching equality squeeze gives J=H-M with k=nu(G)-m equality K4 blocks. Since a=0, h=nu(G)=k+m.

Every H triangle absent from J contains exactly one M edge; an H packing has at most m such pages and at most k block faces. Therefore any maximum H packing P consists of exactly m M-pages, one for each matching edge, and exactly one face from every block.

Assume an unmatched X vertex x has a link neighbor y. By maximality of M, y is matched. The link edge f=xy must belong to an H triangle, since otherwise its apex page would append to P and force a>=1. A triangle containing f cannot contain an M edge, because that would give two L edges in one H triangle. Thus f lies in a J equality block B.

B contains exactly the two X vertices x,y. The x vertex is unmatched, so no selected M-page has x as an endpoint. Only the selected M-page whose matching edge is incident with y can share a B edge; any shared edge must meet that page's X endpoints. That page shares at most one B edge (two would make it a B face despite its missing M edge). Its possible B edge is incident with y and is therefore adjacent to f.

A K4 has a face avoiding any two adjacent edges: take the face opposite their common endpoint. Replace P's B face by a face avoiding f and this possible page footprint. It remains disjoint from every other page and every other block face. The resulting h-packing avoids f, so the apex page zxy appends, contradicting a=0.

Hence every unmatched X vertex is isolated in L. In particular L's nonisolated vertices have a perfect matching. This is a PROVED_USING_PUBLISHED_INPUT restriction, not a statement that every saturated-budget instance has zero gain.

## 4. A C5 link cannot have budget two

For L=C5, m=2 and the general matching bound gives b>=2. If b=2, the possibilities are (D,a)=(2,0) or (0,1). The first is impossible by Section3 because C5 has an unmatched nonisolated vertex in every maximum matching. The second is impossible by Section2 because tight H would require a>=m=2. Thus

    L=C5 implies b>=3

for every eligible AC instance, with arbitrary outside incidence.

If L is two disjoint C5s and J=H-M is tight for a maximum matching M, the exact link-component separation theorem in B_FROZEN_ADDENDUM_2 applies. Each of the two component instances has budget at least3 by the preceding result, and the budgets add (background K4 groups contribute zero). Therefore b>=6 in this tight-deletion branch. In particular a putative eligible b=5, m=4, L=2C5 realization must have the slack-one residual branch for EVERY maximum matching M; the tight branch is arithmetically impossible, not merely settled for AC.

This does not prove that the slack-one branch is realizable, and it does not replace the coordinator/critic's separate proof settling AC at b<=5.

## 5. Explicit connected link at the next arithmetic window

A literal triangle-free connected graph with m=5 and vc=7 is the circulant L on Z/11 with edges of differences +/-1 and +/-3. Its22 edges are

    01,03,08,0-10,12,14,19,23,25,2-10,34,36,45,47,56,58,67,69,78,7-10,89,9-10.

Triangle-freeness follows because a sum of three signed increments1 or3 is odd and has absolute value at most9, so cannot be0 modulo11. The five cycle edges01,23,45,67,89 form a matching; no matching has more than floor(11/2)=5 edges. The independent set {0,2,4,6} has size4. A five-element independent set would have five cyclic gaps each at least2, summing11; the gaps must be2,2,2,2,3, but a gap3 is a forbidden edge. Hence alpha=4 and vc=11-4=7.

An explicit proper three-vertex-colouring is

    [0,1,0,1,0,1,2,1,2,0,2].

This verifies an admissible LINK shape. It does not construct H, establish the proposed budget b=6, or supply an AC counterexample.

At b=6, a=3 would force D=0 and hence a>=m=5, impossible. Thus a<=2. Here Delta(L)=4 and |E(L)|=22. A triangle-free edge-subgraph with matching at most2 is either bipartite, in which case Konig gives a2-vertex cover and at most8 edges, or nonbipartite, in which case it is C5 plus isolates: any odd cycle has length at most5, and any additional edge touching or outside that C5 extends a2-matching to3. The value8 is attained by the union of the stars of two nonadjacent vertices. Therefore rho_0=0,rho_1=4,rho_2=8 and Section1 gives

    a=0: h>=22, D=6;
    a=1: h>=18, D=4;
    a=2: h>=14, D=2, tau(H)>=26.

Thus even the smallest numerical realization of this connected link at b=6 requires at least14 old edge-disjoint triangles. Small random H probes cannot be advertised as a meaningful test of this boundary.

For comparison, at b=6 the link C5 disjoint union C7 has12 edges and rho_2=5, so the a=2,D=2 case needs h>=7. The link2C5 disjoint union K2 has11 edges and rho_2=5, so it needs h>=6. These are only necessary lower bounds; outside attachments, full triangle colouring and the exact apex packing optimum remain to be supplied.

## 6. Status and source scope

The packing-size bound and explicit circulant facts are PROVED_ORDINARY. Sections2–4 use Aharoni/HNS equality structure only in the justified tight graphs and are PROVED_USING_PUBLISHED_INPUT. Konig is the standard finite bipartite matching theorem. No floating optimization verdict is used.

A targeted primary-literature search also inspected the abstract of Haxell–Narins, *A Stability Theorem for Matchings in Tripartite3-Graphs*, arXiv1701.06451, CPC27(2018),774–793, DOI10.1017/S0963548318000147. Its advertised stability hypothesis is REGULAR tripartite hypergraphs near the n/2 matching bound, not arbitrary tau=2nu-1 triangle hypergraphs. The proof was not inspected and this paper is not an input to any argument here. No general slack-one core theorem or priority claim is inferred from that abstract.

Full AC remains unresolved. No first-uncovered-boundary H realization is proved by this scout. Independent_final_verification: NOT_RUN.


## 7. Complete-edge K4 partitions cannot realize a raw-link deficit

Suppose every H edge belongs to exactly one of k supplied actual K4 blocks; additional closure triangles are allowed. In each K4, a rainbow triangle-edge three-colouring has exactly two edges of each colour: adjacent edges receive distinct colours, so each colour is an opposite pair. Therefore every global colour class contains exactly2k edges and covers EVERY actual H triangle, including closure triangles. Conversely every triangle cover uses at least two edges in each block, whose edge sets are disjoint. Thus tau(H)=2k.

Since L=H[X] is induced triangle-free, each block contains at most one L edge. Pick one face per block avoiding that edge. These k triangles avoid all L edges simultaneously, and a maximum L matching adds m apex triangles. Thus nu(G)>=k+m and b=2nu(G)-tau(H)>=2m>=vc(L). This is PROVED_ORDINARY, using the supplied colouring but no deep equality theorem. It applies only to the displayed complete-edge partition scope. Adding arbitrary extra edges invalidates its cover-count premise.

## 8. Final boundary status after collaborative criticism

The mission's later elementary link classification and critical-edge argument prove AC for ALL b<=6. The general frontier certificate also settles3C5 at b=7. A declared additional finite-classification input — completeness of McKay's R(3,5) catalogue at13 vertices — together with a local exact check of its unique graph settles the other vc9 link shape at b=7. This scout did not re-audit catalogue completeness; the coordinator and critic's source/verification receipts control that separate dependency. The b<=6 theorem is independent of this catalogue input.

The first remaining CONDITIONAL numerical AC-failure stratum in the final report is therefore

    b=7, m=6, vc(L)=lambda(H,L)=8.

No full eligible H,X realizing that stratum has been constructed here. Neither the earlier raw b5/b6 realizability questions nor this new raw stratum are resolved merely by proving AC at lower budgets. The ordinary footprint bounds, C5 budget restriction, and complete-edge K4-partition barrier above remain useful constraints, not nonexistence proofs for arbitrary attachments.

The coordinator's exact broken-K2-join cycle probes have actual eligible link lengths5,7,9 and budgets5,7,9 respectively, with lambda=1 throughout. They are positive controls for genuine old/apex interaction, not hard-boundary realizations. The precise link-only limitation L=q Petersen, q>=2, in B_FRONTIER_MATCHING_CERTIFICATE.md shows that the maximum-matching deletion certificate is not universally available; it does not realize the corresponding surrounding H budget.

No further search was launched by this scout after the coordinator's closeout request. Full AC and boundary realizability remain UNKNOWN. All scout computations are complete; independent_final_verification remains NOT_RUN.


---

# Final scope

These arguments neither construct a full eligible difficult-boundary H,X pair nor prove that such a pair cannot exist. They do not solve full AC or unrestricted Tuza. All finite tests are supplementary to the stated proofs, except explicitly declared complete finite records, whose verification scope is recorded. Historical originality is UNESTABLISHED. New Lean and independently commissioned final verification are NOT_RUN.
