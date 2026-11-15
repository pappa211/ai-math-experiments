# Triangle-full minimum covers in K2 joins

Status: exact ordinary reconstruction of root's proposed reduction; restricted positive subcubic result; no general Tuza proof. Root assigned this lane after the independent-cone saturation screen. All triangles below are actual graph triangles. No Lean verification or independent review of this complete note is claimed.

Let R be a finite triangle-free graph with n vertices and at least one edge. Let G=K2 join R, with adjacent universal vertices a,b. Write k=OCT(R) for the minimum number of vertices whose deletion makes R bipartite, and

    t=min_{U subset V(R)} [2(n-|U|)+e_R(U)],
    M=max_U [2|U|-e_R(U)]=2n-t,
    b=n-k (maximum order of an induced bipartite subgraph).

Use TF for: every actual triangle is contained in some minimum ordinary triangle cover, equivalently tau(G-E(T))=tau(G)-3 for every actual triangle T.

## Ordinary and odd cover identities

The exact ordinary cover formula is

    tau(G)=min(1+t,n+k).                                      (1)

If ab is selected, the remaining constraints are those of I2 join R. Choose the selected rim-edge set D. Each apex's selected spokes must be a vertex cover of R-D, so the optimum is |D|+2 vc(R-D). Choosing the same minimum vertex cover S for both apices and deleting any unnecessary rim edges gives D=E(R[V-S]), proving the objective t.

If ab is omitted, each vertex v requires at least one of av,bv. Let S be the vertices with both spokes, and let A,B partition the remaining vertices according to the single spoke selected. The rim edges that must be selected are exactly the edges inside A and inside B. Thus the cost is n+|S|+e(A)+e(B). From any such state, delete S and one endpoint of each selected rim edge; this makes R bipartite using at most |S|+e(A)+e(B) vertices. Conversely an OCT S and a bipartition of R-S give this cost k. This proves (1).

Let eta(R) be minimum edge bipartization, and put

    q=min_S [2|S|+e(S)+e(V-S)].

Since a is universal, every odd triangle cover is a complement of a vertex cut: the equations on triangles axy determine every nonspoke edge from the a-spokes, and all other triangle equations follow. Cuts with a,b opposite have cost n+eta(R); cuts with them together have cost 1+q. Hence

    pi(G)=min(n+eta(R),1+q).                                 (2)

In particular q>=t, but equality is not automatic.

## No full triangle in an independent multi-cone minimum cover

More generally, let s>=1 and R be triangle-free. In I_s join R fix the selected rim edges D. An optimal cover uses a minimum vertex cover of R-D at each apex. If uv belongs to D and some minimum vertex cover C of R-D contains u or v, remove uv from D and use C at EVERY apex. This still covers all triangles and decreases total cost by one. Therefore in every global minimum cover, every selected rim edge has both endpoints omitted from every available optimal spoke vertex cover. In particular no minimum cover contains all three edges of an actual triangle.

This is stronger than merely saying some canonical optimum has no full triangle, and is what forces the two modes in (1) to tie under TF.

## Exact TF characterization

For R with at least one edge, G is TF if and only if all three conditions hold:

1. 1+t=n+k.
2. OCT(R-uv)=k-1 for every rim edge uv.
3. For every vertex v, some minimizing U in the definition of t excludes v.

Necessity of the tie: an apex triangle abv can only be contained in a cover selecting ab, whereas a rim triangle auv can only be contained in a cover omitting ab, by the preceding independent-multi-cone lemma.

For condition 3, a minimum cover selecting ab and both av,bv has a selected rim set D and optimal spoke vertex covers containing v. Choose one such vertex cover for both apices and remove unnecessary rim edges. This gives a minimizing U excluding v. The reverse construction contains the whole apex triangle.

For condition 2, a minimum cover omitting ab and containing au,av,uv has the state S,A,B above with uv among the selected internal rim edges. Remove S and one endpoint of every other selected internal edge. This gives an OCT of R-uv of size at most k-1. Deleting a single edge changes OCT by at most one (add an endpoint to any OCT of R-uv), so equality holds. Conversely, take an OCT S of size k-1 in R-uv. Its endpoints u,v are outside S, and in every bipartition of R-uv-S they lie in the same part; otherwise S would already bipartize R. Choose that part to receive the a-spokes, choose both spokes on S, and select the sole internal rim edge uv. The resulting cover has n+k edges and contains au,av,uv. Interchanging a,b handles the other rim triangle. This proves the characterization.

## Structural consequences of the tie

The tie is exactly

    M=b+1.                                                  (3)

If alpha=alpha(R), then 2alpha<=M and b<=2alpha. Thus (3) forces

    b in {2alpha-1,2alpha},  alpha=ceil(b/2).

Every maximum induced bipartite subgraph has a balanced or nearly balanced bipartition. In fact either color class I satisfies 2|I|<=M=b+1, and their sizes sum to b. Since its connected components may be independently flipped, the sum of their absolute part imbalances is at most one.

If b is even, b=2alpha. For any OCT-critical edge uv, choose an induced bipartite set of size b+1 in R-uv. Restoring uv places it inside one part A and leaves the other part B independent. The objective bounds 2|A|-1<=M=b+1 and 2|B|<=M, together with |A|+|B|=b+1, force |A|=alpha+1 and |B|=alpha. Therefore every edge of R is alpha-critical.

If b is odd, b=2alpha-1 and M=2alpha. Then R has no alpha-critical edge: an independent (alpha+1)-set after deleting such an edge would induce only that edge in R, giving M>=2alpha+1.

There is a useful exact simplification of M. If an optimizing U has a vertex of induced degree at least three, removing it increases 2|U|-e(U), impossible. Removing a vertex of induced degree two leaves the objective unchanged. Repeating this shows that M is attained by U inducing only isolated vertices and isolated edges. If there are i isolated vertices and j isolated edges, its objective is 2i+3j.

For the even-b live case, M=2alpha+1 restricts one-vertex exchanges of maximum independent sets. For a maximum independent set I, let W be the outside vertices with exactly one neighbor in I. Two members of W cannot have the same I-neighbor: triangle-freeness would allow replacing that neighbor by both, contradicting maximal cardinality. If two members of W were nonadjacent, I plus them would induce two edges, giving objective 2alpha+2. Thus W is a clique, and triangle-freeness implies |W|<=2. Consequently the graph of maximum independent sets under single-vertex swaps has maximum degree at most two. No connectivity or global classification of that state graph is asserted.

## Complete positive result for subcubic rims

If Delta(R)<=3, then q=t. To see this, put S=V-U and m=|E(R)|. The ordinary objective becomes

    2|S|+e(V-S)=m+sum_{v in S}(2-d_R(v))+e(S).

Removing a vertex of original degree at most two from S cannot increase this expression. Hence an optimum may use only vertices of original degree three. On their induced graph J, minimizing is equivalent to maximizing |S|-e_J(S). The latter maximum is alpha(J): deleting one endpoint per internal edge produces an independent set of size at least |S|-e_J(S), and a maximum independent set attains equality. Thus

    t=m-alpha(J),   J=R[{v:d_R(v)=3}].

Choose S to be such a maximum independent set of J. It is independent in R, so e(S)=0 and the odd objective q equals the ordinary objective t. Therefore if K2 join R is TF and R is subcubic, (1), (2), and the tie give

    pi(G)=tau(G).

This closes subcubic rims as a source of TF graphs with an odd-cover gap. It is a restricted result, not an availability statement for arbitrary graphs.

## Decisive fixed candidates, without a census

Kalbfleisch rim on Z35, distances 1,7,11,16: previously exact verified alpha=8. The two independent8 sets {0,2,...,14} and {1,3,...,15} give b=16 and k=19. But U={0,2,...,18} induces exactly the two edges 0-16 and 2-18, giving M>=18, t<=52. Hence the ab-selected cover has at most53 edges, below the ab-omitted minimum n+k=54. The TF tie fails. Literal witness is evidence/global_routes/k2_join_kalbfleisch_tie.json.

Petersen rim (root and global_routes independently corrected the proposed candidate): cubic n=10,m=15,alpha=4. A maximum independent four-set S leaves six vertices inducing exactly three edges, giving M>=9 and t<=11. Since b=7 and k=3, the ab-selected cover costs at most12, below the omitted-ab minimum13. It is not TF. No packing-deletion census was needed.

The 13-vertex circulant with distances1,5 was screened by complete subset enumeration in a short local read-only command: alpha4,b8,M10, eta6. Again M is strictly larger than b+1=9. This was an exploratory fixed candidate; no separate machine evidence file or independent audit is claimed for its optimum values, and it is not used by any theorem above.

## Remaining exact question

A possible discriminator for the even-b case is:

    If R is connected, triangle-free, alpha-critical and M(R)<=2alpha(R)+1,
    must R be an odd cycle?

This is UNPROVED here. The maximum-independent-set exchange degree bound above is established, but its upgrade to a classification is missing. The general odd-b case (OCT-critical but no alpha-critical edges) also remains open in this lane. No claimed global Tuza implication is obtained from the restricted subcubic result.

## Addendum: maximum-worth criticality and prior terminology

In the even-b case, every edge is also critical for M: its alpha+1 one-edge independent-set witness attains objective 2alpha+1=M, and deleting that edge increases the objective by one. Since deleting an edge changes any fixed objective by at most one, M(R-e)=M(R)+1 for every edge e. This does not by itself prove the unproved classification above.

The objective M is an established parameter, not a new optimization invariant. Doignon, Fiorini and Joret, *Weighted graphs defining facets: a connection between stable set and linear ordering polytopes*, arXiv:0809.3724v1, Section2.2, define the maximum worth beta(G,a)=max_S[a(S)-|E(G[S])|]. Here M=beta(R,2). Their weighted facet/criticality theorems require additional facet hypotheses; none is asserted here. Primary full text read at https://arxiv.org/html/0809.3724 .

A related established structural theorem says a connected alpha-critical graph other than a vertex, an edge or an odd cycle contains a totally odd K4 subdivision: Sewell–Trotter1993, with a simpler proof by Fiorini–Joret, arXiv:0712.3956 (European J. Combin.2009), primary text https://samuel.fiorini.web.ulb.be/papers/Sewell-Trotter.pdf . This theorem was inspected as a possible route, but a subdivision need not be induced or preserve the relevant maximum independent-set witnesses. Consequently it does NOT prove our proposed maximum-worth classification, and no argument here imports it as that missing step.

## Bounded discriminator outcome, 2026-11-15 04:31 UTC

A single exact-CNF test targeted n=11, alpha=4, triangle-free alpha-critical noncycles with M<=9. It fixes a maximum independent four-set and labels a degree-at-least-three member as vertex0 (every vertex in a nontrivial alpha-critical graph belongs to a maximum independent set, by an incident-edge witness). All alpha-critical-edge witnesses are encoded explicitly; six-vertex worth constraints are initially imposed, with exhaustive subset checking and lazy larger constraints planned for any candidate. The initial solver call timed out at20seconds, before producing a candidate. Its status is UNKNOWN, not evidence that the proposed classification is true. No enlarged census was authorized by this outcome. Reproduction: checks/global_routes_worth_critical_sat.py; evidence/global_routes/worth_critical_n11_a4.json. The exact implication and proof gaps above are unchanged.
