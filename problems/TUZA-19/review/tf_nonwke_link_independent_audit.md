# Independent audit: TF with no WKE link component still permits pi > 2nu

Verdict: PASS for the frozen ordinary existence counterconstruction. The exact packing, cover and odd-cover identities, full triangle/link classifications, universal matching/cover bounds, TF extension and retained two-spoke blocker all reconstruct. The incidence existence dependency also reconstructs. No mathematical gap was found.

Reviewed note: `notes/tf_nonwke_link_counterconstruction.md`, SHA256 `02aa09e9ca43458282deff55073580510dcb2204ac3db57e8a88ad2d933f04ce`. I read its statement/proof and the two dependency notes, but not producer code, producer result files or a favorable review. Independent computation was written from scratch using the standard library. This is ordinary AI mathematical review plus a finite local/interface control, not Lean or human verification.

## The finite existence input is sufficient

The frozen incidence input has SHA256 `2ec94c291275ae6d02628ffd227d2acd9bb2c3eee638a1369c40bd8fc053ac1b`; the prior cone-decoration reconstruction has SHA256 `db3a479a74064b0038274cefc0b64bc9356e79d5dfd37706eb89221fb75c7a16`. Exact input bytes are copied into `evidence/tf_nonwke_link_independent/`.

Here is the part of the probabilistic argument needed by this new construction. With p=N^(−15/4) and m0=p*binom(N,5), m0/N tends to infinity. For every fixed coloring, at least one-quarter of all five-sets are unbalanced once N≥13: the displayed exact balanced-set count and its upper bound give this uniformly over all class sizes. If X counts selected unbalanced sets, its mean z is at least m0/4. Exponential Markov at base two yields Pr[X≤z/2]≤exp(−z/8). Since m0/8≤z/2, a union bound over all 2^N colorings gives failure probability at most 2^N exp(−m0/32), tending to zero.

The expected number of Berge2/3 cycle descriptions is at most N^(1/2)+N^(3/4). Restricting descriptions to distinct selected hyperedges justifies the factors p²,p³. Markov gives at most N such cycles with probability tending to one. Deleting a selected edge from each short cycle removes at most N hyperedges and creates no new cycle. Choosing m0>8(L+1)N leaves more than LN unbalanced selected hyperedges for every coloring. The minimum unbalanced count adds over incidence components, so one nontrivial component has minimum greater than L times its own vertex count. Isolated vertices do not obstruct that argument.

For L=6 this supplies a finite connected H with n>0 vertices and b>0 K5 blocks. Linearity makes their edge sets disjoint. A triangle using different block edges would form a Berge3 cycle, so every actual H-triangle is internal to one block. Consequently tau(H)=4b, nu(H)=2b, every edge has codegree three, and H has TF by choosing each targeted triangle as the three-vertex side of a balanced K5 cut. The unavoidable unbalanced blocks give tau_B(H)>4b+12n. This is an ordinary probabilistic existence proof; neither the dependency nor this review produces a literal large H.

## K11 facts and complete triangle ownership

The displayed seventeen local triples are edge-disjoint and leave exactly the four-cycle with edges 45,47,58,78. Relabeling its edge45 to any prescribed root gives a maximum local packing avoiding that root. Eighteen triangles would leave one edge of K11, impossible because K11 and every triangle union have even vertex degrees. Thus nu(K11)=17, including after deletion of any specified root.

A triangle-free graph on eleven vertices has at most thirty edges: triangle-freeness implies d(x)+d(y)≤11 for each edge, and summing gives sum d(v)²≤11m; Cauchy gives 4m²/11≤11m. Hence tau(K11)≥25. The internal edges of a 5+6 partition attain25 and meet each triangle oddly. Both prescribed root values occur. Every specified triangle can be put entirely in one part, yielding a minimum cover containing all its edges. This does not require independent choice of the root value when a triangle is prescribed; the later TF construction correctly tolerates either value.

In W, a fresh vertex has neighbors only in its attached K11, so any triangle containing it lies wholly there. Among old vertices the graph is exactly cone(H). Thus the three triangle types in the note are exhaustive. There are 10b old triangles, 10b cone triangles and165n local triangles. E(H) and the n full attached K11 edge sets partition all graph edges; each root spoke belongs to its one block. Counts are therefore (10n+1,10b+55n,20b+165n).

## Exact ordinary cover and TF

Any cover restricts to a cover of H and of each edge-disjoint K11, giving tau(W)≥4b+25n. A minimum H-cover together with root-containing local minimum covers attains equality and covers every cone triangle.

For an old triangle, choose its containing minimum H-cover. For a cone triangle auv, TF of H and the fact that uv lies in an H-triangle provide a minimum H-cover containing uv; choosing every root also selects au,av. For a local triangle, choose its containing local minimum cover and select every other root. If its own root av is absent, every cone triangle through av still meets the other selected spoke. All other triangles remain covered by their own component restrictions. Thus every target triangle is contained in a cover of size4b+25n, proving TF on the full actual triangle family.

Every W-edge lies in a triangle, so TF also implies edge-cover-criticality: a containing minimum cover loses one edge to cover W−e, while adding e to any cover of W−e gives the reverse inequality. This is an additional necessary condition that the construction satisfies, not a claim that it is a minimal Tuza counterexample.

## Exact odd-cover identity

For any odd cover let x_v be the indicator of root av. The cone triangle equation forces the H-edge indicator c_uv=1+x_u+x_v in F2. These are exactly the monochromatic edges of the coloring x, and their old H-triangle equations hold automatically. Each attached K11 with its prescribed root value needs at least25 selected edges in total and can attain25 for either value. Its nonroot cost is25−x_v. Therefore the total minimum cost for a fixed coloring is

    sum_H c_uv + sum_v x_v + sum_v(25−x_v) = 25n+sum_H c_uv.

The exhaustive triangle classification guarantees independent local extensions. Both lower and upper bounds follow, so pi(W)=25n+tau_B(H). No general assertion that odd covers of an arbitrary graph are complements of cuts is used; the cone enforces precisely the needed relation.

## Exact packing identity and the surviving blocker

A cone packing splits into an old H-packing, of size at most2b, and apex triangles whose bases form an H-matching, of size at most mu(H). Conversely, a maximum H-matching occupies at most two edges in any five-vertex block. The displayed two K5 deletion patterns each retain two disjoint triangles, so independent block packings avoid all matching edges. This proves nu(cone(H))=2b+mu(H).

Every W-packing contains at most17 local triangles per K11 and at most nu(cone(H)) old/cone triangles. Root-avoiding local seventeen-packings attain the sum with any cone packing. Hence nu(W)=17n+2b+mu(H).

Deleting spokes au,av leaves the same local seventeen-packings. The remaining apex bases form a matching in H−{u,v}, while all old H-block packings still attain2b after avoiding its matching edges. Thus

    nu(W−{au,av})=17n+2b+mu(H−{u,v}).

When uv is any H-edge, adjoining uv to a matching of H−{u,v} proves mu(H−{u,v})≤mu(H)−1. The displayed two-spoke set therefore lowers the global packing number. There is no hidden inference of two-edge resilience from the root-avoidance property of individual blocks.

## Every link and every matching

For any matching M of a larger graph, the restriction of M to a clique K_k is a matching. A vertex cover Q of the larger graph minus M leaves at most two vertices of this clique outside Q: three such vertices would require all three mutual edges to lie in M. Therefore |Q∩K_k|≥k−2, regardless of matching edges leaving the clique. Bounds add over vertex-disjoint cliques. This is a universal argument over ALL matchings, not just maximum matchings.

A fresh vertex has link K10, hence |Q|≥8 while |M|≤5. For an old H-vertex v in r blocks, the H-neighbor sets form r disjoint K4s, with no cross edges because such an edge would create a cross-block H-triangle. The other neighbors form K10 on the apex and nine local fresh vertices. The apex joins all K4s to that K10, so the full link is connected, with10+4r vertices. Every matching/cover pair has |Q|≥8+2r>5+2r≥|M|.

At the apex, the link has n disjoint K10s on each old vertex and its nine fresh vertices, joined by the old H-edges between their anchors. H is connected, so this link is connected. Here |Q|≥8n>5n≥|M|. These exhaust the vertex types. Each full link has one connected component and is non-WKE; there is no smaller WKE component hidden inside it.

This only excludes the WKE link-component reduction criterion. It does not establish absence of every other reducible set or every singleton reduction using triangles outside the relevant link matching.

As a further direct check of the claimed distinction from the new core restriction, every old H-edge has W-codegree4, every nonroot K11 edge has codegree9, and root av has codegree9+d_H(v)=9+4r. Thus all W-edges lie in its codegree-at-least-three subgraph, which is W itself. Fresh vertices have degree10, old vertices degree10+4r and the apex degree10n; its5-core is the entire graph. This still does not repair its two-spoke packing blocker.

## Refuted gate and verification boundary

Substitution gives

    pi(W)−2nu(W)>3n−2mu(H)≥2n>0,
    2nu(W)−tau(W)=9n+2mu(H)>0.

So TF plus absence of WKE link components does not force the odd-cover bound, while ordinary Tuza holds for this construction. The stronger gate also requiring two-edge packing resilience is not refuted.

The independent checker `review/tf_nonwke_link_independent_check.py` verifies the K11 packing, all55 root-avoiding relabelings, all462 balanced odd covers and containing covers for all165 local triangles. Its clique tables check representative internal matching sizes in K4 and K10; the universal bound above supplies the all-matching proof.

A separate literal interface control uses two K5s sharing one vertex as H. Its W has91 vertices,515 edges and1525 actual triangles. The checker verifies all triangle ownership, every actual link and clique partition, all1525 containing TF covers, all512 spoke colorings and their odd-cover extensions, a161-triangle packing, a233-edge cover and20 two-spoke blockers. The ordinary formulas plus exact small H matching/cut checks give nu=161 and tau=pi=233. This small H does NOT have the large cut gap, so this graph is expressly not the parity counterexample; it controls the interface claims only.

Full literal receipt: `evidence/tf_nonwke_link_independent/literal_check.json`, initial SHA256 `9ad46819b120cb430aeab65d6d4eb4d1a5c1b4c95c05b56a7f41076f46a3564f`. Checker SHA256 `3b5065d6affd1b0c73ca7863e579e4ee5fd404a10f7c8bbe64b3b9ef6895ac17`.

Reproduce from the workspace with the native mission environment:

    source LOCAL_ENVIRONMENT
    python3 review/tf_nonwke_link_independent_check.py

Rerunning changes the timestamp and receipt hash. The actual large counterexample remains an existence construction supported by the ordinary probabilistic proof. No large incidence search, literal full counterexample, external solver, Lean, human review, remote computation or publication is claimed. All work was local Darwin under the original mission clock. Requested controls Astra/Ultra; precise serving metadata was not exposed.
