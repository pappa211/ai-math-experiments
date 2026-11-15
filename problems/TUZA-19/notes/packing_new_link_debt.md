# Link reductions: exact debt, large groups, and the splitting trap

Status: ordinary derivations and fixed-control verification; independent review pending. This pass does not supply a global reduction or a proof of Tuza. It uses the original TUZA-19 clock, with research cutoff 2026-11-15 09:23:58 UTC. No Lean, remote computation, publication, or originality claim.

## 1. Imported framework and the exact missing payment

Puleo's primary paper, *Tuza's Conjecture for Graphs with Maximum Average Degree less than 7*, arXiv:1308.2211v3, Definition 2.1, Lemma 2.2, Definition 4.1 and Lemma 4.4, supplies reducible sets and the WKE-link reduction. The primary PDF was read at https://arxiv.org/pdf/1308.2211v3 on this pass. These are existing mechanisms, not discoveries here.

For a vertex v, let L=G[N(v)], let M be ANY matching in L, put m=|M|, let Q be a minimum vertex cover of L-M, and write q=|Q|. Set H=G-v-M. The m triangles vxy, xy in M, append to every H-packing. The edge set M together with the q spokes vQ extends every H-cover. Therefore

    nu(G) >= nu(H)+m,
    tau(G) <= tau(H)+m+q.

Define the local deficit d=q-m, the residual slack sigma=2nu(H)-tau(H), and the extra packing gain g=nu(G)-nu(H)-m>=0. Then

    tau(G)-2nu(G) <= d-sigma-2g.                 (1)

Thus an explicitly PAID link reduction closes if sigma+2g>=d. WKE is the special case d<=0, paid by induction's sigma>=0. The choice of M need not be maximum; all quantifiers in (1) hold for every matching.

For an edge-minimal Tuza violation, k=nu(G) and tau(G)=2k+1, every proper edge subgraph obeys Tuza. Consequently every v incident with an edge and every M satisfy

    0 <= sigma+2g <= d-1.                       (2)

This forces d>=1 at every link witness, but does not give a lower bound large enough to pay d. The weakest useful new availability assertion in this architecture is that the full minimal-counterexample structure forces SOME v,M violating (2). A stronger, more easily tested version asks whether TF plus two-edge packing resilience alone forces sigma+2g>=d somewhere. Neither version is proved or refuted here. Merely introducing sigma does not provide its required payment.

For a general grouped certificate, take nonempty U, an edge-disjoint triangle family S, and an edge set X such that G-X has no triangle meeting U and X contains every S-edge wholly outside U. Put H=(G-X)-U, b=|X|-2|S|, and g=nu(G)-nu(H)-|S|. The same accounting gives

    tau(G)-2nu(G) <= b-[2nu(H)-tau(H)]-2g.       (3)

The ordinary reducible-set definition has b<=0. Allowing a positive b is legitimate only when a residual slack or extra packing gain is actually certified. Taking U=V(G) without a new certificate simply reinstates the original problem.

## 2. General reducible groups can be linearly large in actual controls

**Theorem.** If a nonempty U of size r is a Puleo reducible set in K_n, then

    2n <= 13r+1.

More generally, if the same covering and compatibility conditions hold with |X|<=2|S|+b, then

    2n <= 13r+1+6b/r.                          (4)

In particular a small group in a large complete graph must borrow a quantifiable amount: b>=r(2n-13r-1)/6. The packing S is allowed anywhere in K_n; the theorem does NOT restrict it to triangles meeting U.

**Proof.** Write q=n-r, d=|X intersect E(K_n-U)|, and i=|X|-d. Let s_j count members of S containing exactly j vertices in U. Compatibility, cross-edge disjointness, and internal-edge disjointness give

    d >= 3s_0+s_1,
    2(s_1+s_2) <= rq,
    s_2+3s_3 <= binom(r,2).

Since d+i<=2 sum(s_j)+b,

    d+3i <= 6 sum(s_j)+3b-2d
           <= 4s_1+6s_2+6s_3+3b
           <= 2rq+r(r-1)+3b.                  (5)

For u in U let A_u be its neighbors outside U whose spokes are not in X. Each A_u spans a clique wholly in X: otherwise u and an unselected edge of that clique form an uncovered triangle. Let a=max|A_u|. Thus d>=binom(a,2). At least r(q-a) cross edges belong to X, so i>=r(q-a). Substitution in (5) yields

    rq <= 3ra-binom(a,2)+r(r-1)+3b.

For every nonnegative integer a, the quadratic 3ra-binom(a,2) is at most (9r^2+3r)/2, attained at a=3r or3r+1. Therefore q<=(11r+1)/2+3b/r, proving (4) and its b=0 case. No abstract incidence object or omitted triangle is used.

## 3. An explicit infinite TF and two-edge-resilient family

Let n_j=6*2^j-1 for j>=0. There is a triangle packing of K_(n_j) leaving exactly a four-cycle. Start in K5 with triangles 012 and034, leaving edges13,14,23,24. To pass from odd n to2n+1, retain the old packing and add n+1 new vertices identified with {infinity} union Z_n. Factor their complete graph into the n perfect matchings

    F_j={(infinity,j)} union {(j+t,j-t):1<=t<=(n-1)/2},

with residues modulo n. For every old vertex j, add triangle jxy for every xy in F_j. Each new-new and old-new edge is used exactly once, so the old four-cycle is the complete leave.

All actual triangles of each resulting graph are the triples of its complete vertex set. Since n_j is5 modulo6, its edge count is1 modulo3. A larger packing than the displayed one would leave exactly one edge. This is impossible because K_(n_j) has even degrees and removal of edge-disjoint triangles preserves even degrees. Hence

    nu(K_n)=(n(n-1)-8)/6.

Every pair of edges, adjacent or disjoint, belongs to some four-cycle. An automorphism sending the displayed leave to that cycle gives a maximum packing avoiding the pair. Empty and single deletions follow by extension to a pair. Thus these graphs are two-edge packing resilient.

A triangle-free graph on n vertices has at most floor(n^2/4) edges: summing d(x)+d(y)<=n over edges and applying Cauchy gives the standard bound. Balanced complete bipartite graphs attain it. Therefore, for odd n,

    tau(K_n)=(n-1)^2/4.

Any specified triangle fits in one part of a balanced partition, since n>=5. Its three edges therefore lie in a minimum cover, proving TF; the same argument puts every specified edge in a minimum cover, proving edge-cover-criticality.

Combining this family with Section2 refutes every assertion that TF plus two-edge resilience guarantees a reducible vertex set of some fixed size. The lower bound tends to infinity even though the graphs have large Tuza slack. This does NOT refute an assertion using tau=2nu+1 or simultaneous triangle-deletion tightness. It also does not exclude large or explicitly paid groups.

## 4. The complete controls do pay their link debt

For a nonempty matching M in the link K_(n-1), the remaining graph has independence number two, so its vertex-cover number is n-3. A perfect M has size (n-1)/2. Thus its local deficit is (n-5)/2. For n>5 no matching is WKE; smaller matchings only increase the deficit, and the empty matching has vertex-cover number n-2.

For n=n_j>=11, choose a vertex v outside the displayed four-cycle leave. The packed triangles through v have perfect-matching bases M. Removing those triangles leaves a packing in H=K_(n-1)-M with the same four-cycle leave. The parity upper bound proves its optimality. Write q=n-1; then

    nu(H)=(q(q-2)-8)/6,
    tau(H)=(q/2-1)^2,
    sigma(H)=(q^2+4q-44)/12,
    g=0,  d=(q-4)/2.

For the cover formula, q/2 is odd. A triangle-free spanning subgraph with q^2/4 edges would have to be K_(q/2,q/2): equality in the preceding degree/Cauchy argument makes every degree q/2, and the neighborhoods of the ends of an edge are the two independent parts. But every missing matching pair must lie in one part, impossible when both parts have odd size. A partition into q/2-1 andq/2+1 vertices, each a union of matching pairs, attains q^2/4-1 surviving edges. This proves the cover formula. The displayed sigma is at least d for q>=10.

In particular K11 has m=5, q_link=8, d=3, nu(H)=12, tau(H)=16, sigma=8, g=0. The lifted cover has at most16+5+8=29 edges, within2nu(K11)=34. K11's actual cover optimum25 is smaller; no optimality of this local extension is asserted. For K5, the perfect-matching link reduction has d=0 and H=C4, with sigma=g=0.

The retained 72-vertex TF-decorated graph W in notes/codegree_two_tf_resilience_counterexample.md is a different control. Every fresh K5 vertex has link exactly K4. It therefore has a genuine d=0 WKE reduction, regardless of the complexity of its original core. The checker reconstructs its full graph and all240 triangles from the retained literal evidence and checks this link fact for every fresh vertex. It does not rerun or replace the earlier TF/resilience audit. Thus that decoration family cannot itself force all links to be irreducible; its new vertices explicitly supply reductions.

## 5. Vertex splitting and why unspecified slack is circular

Partition N(v) into nonempty parts and replace v by one clone per part, joining a clone exactly to its assigned neighbors. Original edges are in bijection with split edges. The lost triangles are precisely vxy with x,y in different parts. Let h be the minimum number of original edges meeting all these lost triangles. Every split-graph cover pulls back and extends at cost at most h; every split-graph packing pulls back without edge collisions. An independent repair would therefore work if

    h <= 2[nu(G)-nu(G_split)].                  (6)

For induction, a nontrivial split that actually destroys triangles requires either a secondary minimum-triangle-count choice among edge-minimal violations or removal of the newly triangle-free edges; splitting is not automatically a proper edge subgraph.

**Exact failure on K5.** For any chosen v the four neighbor partitions have the following nontrivial size types:

| Parts | nu(G_split) | h | 2[nu(K5)-nu(G_split)] |
|---|---:|---:|---:|
| 3+1 | 2 | 1 | 0 |
| 2+2 | 2 | 2 | 0 |
| 2+1+1 | 2 | 2 | 0 |
| 1+1+1+1 | 1 | 3 | 2 |

For the first three rows a two-packing consists respectively of one allowed hub triangle plus a rim triangle, two allowed hub triangles, or one allowed hub triangle plus a rim triangle. In the last row only the rim K4 supplies triangles. The lost-triangle hitting numbers are respectively a shared spoke, two spokes, two spokes, and three spokes; fewer edges cannot cover their respective cross-link edge families. The fixed checker enumerates all15 neighbor partitions, not a graph census, and confirms every actual split triangle and value. Thus no nontrivial partition of the tight TF/resilient control K5 satisfies (6).

Residual slack can pay this debt, but is not a free theorem. A split separating one neighbor w from all others destroys exactly the triangles on edge vw. After discarding its leaf edge, the split graph is triangle-equivalent to G-vw, and h=1 whenever vw lies in a triangle. Under edge-cover-criticality and two-edge resilience,

    nu(G_split)=nu(G),
    tau(G_split)=tau(G)-1.

Consequently the paid condition h<=2[nu(G)-nu(G_split)]+[2nu(G_split)-tau(G_split)] is EXACTLY tau(G)<=2nu(G). Claiming that this unspecified residual slack is available would rename the original target. The K5 split controls do have actual slack: the first three split types have (nu,tau)=(2,3),(2,2),(2,2), so their independent debts can be paid. A true minimal violation has no such one-edge slack.

## 6. Decision and scope

The available local transfer is precise, but its global payment remains missing. TF and two-edge resilience do not force WKE links, do not force bounded-size general reducible groups, and do not rescue independent vertex-split repair. Dense complete controls carry enough actual residual slack, while the TF decoration controls have explicit WKE vertices. Neither observation explains how an arbitrary minimal violation must produce a paid group. No argument extracting the needed residual-slack lower bound from TF, resilience, or triangle-deletion tightness emerged. The pass stops here rather than treating the algebraic debt ledger as an availability theorem.

Producer verification: source LOCAL_ENVIRONMENT and run python checks/packing_new_link_debt.py. Its receipt is evidence/packing_routes/packing_new_link_debt.json. It checks the literal K5 splitting controls, complete-family constructions through K23, K11's residual certificate, and every fresh link in the one retained TF-decorated graph. All-size group and doubling assertions are ordinary proofs, not inferred from these finite checks. Independent review remains pending.
