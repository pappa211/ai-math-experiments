# Universal-clique amplification can force two-edge packing blockers

Status: complete ordinary construction and exact packing identity. This refutes a UNIFORM guarantee over incidence amplifications. It does NOT refute the existential possibility of choosing a specially designed amplification whose join is resilient. No Tuza counterexample is asserted without a hypothetical counterexample seed. No computation, Lean verification, or originality claim.

## Exact quantified result and remaining question

Let G be any fixed finite simple graph on r>=3 vertices, and suppose it has an edge e0 such that

    nu(G-e0)=nu(G).

Then for EVERY fixed q>=1 and EVERY real D>0, there is a finite simple graph H obtained by identifying vertices of b copies of G, on n vertices, such that:

1. the copies have disjoint edge sets and EVERY actual H-triangle belongs to one copy;
2. their underlying r-sets form a linear hypergraph with no Berge triangle;
3. b/n>D;
4. for J=K_q join H,

       nu(J)=b nu(G)+qn/2+nu(K_q);                        (1)

5. deleting ANY two distinct cross edges between the universal clique and H lowers nu(J) by at least one.

The construction has n even, so qn/2 is an integer. If G itself is two-edge packing-resilient, H also has that property, but J loses it. In particular the seed hypothesis holds for an edge-minimal Tuza counterexample, should one exist.

Thus no q depending only on the seed G can guarantee resilience for ALL sufficiently high-ratio triangle-local incidence amplifications. The order of quantifiers is

    for every G,e0,q,D, there exists such a BAD amplification H.

The potentially useful existential gate

    for every hypothetical minimal counterexample G, there exist q(G)
    and specially chosen arbitrarily high-ratio amplifications H
    whose K_q join H is two-edge packing-resilient

remains OPEN. This construction must not be cited as disproving that gate, or as treating all q chosen after one fixed H.

## 1. Explicit linear, Berge-triangle-free translation systems

Use 2r vertex parts, each indexed by the cyclic group Z_M. The ambient vertices are

    (p,z),       p in {0,...,2r-1}, z in Z_M.

Choose a finite collection of F families. For each family f, prescribe any r-element set P_f of part labels. For each incidence (f,p) with p in P_f, assign a distinct positive integer exponent k(f,p), and put

    a(f,p)=10^k(f,p).

Let Amax be the largest shift and choose ANY integer M>6 Amax. For every family f and translate t in Z_M create the r-set

    E(f,t)={ (p,t+a(f,p)) : p in P_f },

with coordinates reduced modulo M.

There are b=FM hyperedges on n=2rM ambient vertices.

### Same-family sets are disjoint

If E(f,t) and E(f,s) share a vertex in any part p, then t+a(f,p)=s+a(f,p) modulo M, so t=s. Distinct translates in one family are therefore disjoint.

### Linearity across families

If E(f,t) and E(g,s), with f!=g, shared vertices in two distinct parts p,p', subtracting the two coordinate equalities would give

    a(f,p)-a(g,p)-a(f,p')+a(g,p') = 0 modulo M.

Its four shift entries are distinct. Their signed integer sum is nonzero: the largest power of10 exceeds the sum of the absolute values of all smaller terms. Its absolute value is less than4 Amax<M, so it is also nonzero modulo M. This is a contradiction. Two hyperedges therefore meet in at most one vertex.

### No Berge triangle

In a Berge triangle every pair of its three hyperedges meets. Their family labels f,g,h are pairwise distinct, since same-family distinct translates are disjoint.

Their three distinct intersection vertices must also lie in three distinct parts p,p',p''. If two intersections had the same part, the hyperedge containing both would have two vertices in that part unless the intersections were the same vertex, which is forbidden in a Berge triangle.

Adding the three intersection equations would now give

    [a(f,p)-a(g,p)]
    +[a(g,p')-a(h,p')]
    +[a(h,p'')-a(f,p'')] = 0 modulo M.

The six family-part entries are distinct. The largest power of10 dominates the other five terms, so the integer sum is nonzero; its absolute value is less than6 Amax<M. Again it cannot vanish modulo M. This contradiction excludes every Berge triangle.

This construction is finite and explicit. The potentially enormous M is harmless for an existence statement. As F is fixed before M, its ratio b/n=F/(2r) can be made any required large constant by choosing enough families. No positive quadratic-density assertion is made.

## 2. Planting q edge-disjoint perfect rim matchings

Partition the 2r part labels into the r fixed pairs

    {0,1}, {2,3}, ..., {2r-2,2r-1}.

For every apex index j in {1,...,q} and every part-pair index k in {0,...,r-1}, create one distinct MARKED family f(j,k). Its part set P_f contains that designated pair, together with any other r-2 distinct parts. These qr families are all distinct, even when their part sets happen to coincide. Add further unmarked families as desired, so that

    F>=qr,       F/(2r)>D.

In each hyperedge E(f,t) place a copy of G using a fixed bijection from V(G) to P_f, then to the translated vertices. For every marked family f(j,k), map the endpoints of the prescribed edge e0 to its designated pair of parts. The other roles can be assigned arbitrarily. Each unmarked family can use any bijection.

By the preceding linearity and no-Berge-triangle properties, the copies have disjoint edge sets and all actual triangles are copy-local. The complete triangle-ownership proof is the same short owner argument as in the frozen universal-clique reduction: two common edge owners force the third owner by linearity, while three distinct owners would form a Berge triangle. Therefore

    nu(H)=b nu(G),       tau(H)=b tau(G).                 (2)

For each apex j, let M_j consist of the images of e0 in all copies from marked families f(j,k), over all k and all translates t. Within one designated part pair, these M translated edges give a perfect matching between the two parts. The part pairs partition all vertices, so M_j is a perfect matching of H.

The q matchings M_j are edge-disjoint because their edges belong to distinct graph copies. More strongly, their union uses AT MOST ONE edge in any copy: exactly the designated image of e0 in a marked copy, and none in an unmarked copy. Every ambient vertex belongs to a marked edge, so no unused-isolate removal is needed and n=2rM exactly.

## 3. Exact saturation after adjoining the universal clique

Let the q universal vertices be a1,...,aq. In every marked copy, choose a maximum triangle packing avoiding its e0 image, possible by the seed hypothesis. In every unmarked copy choose an arbitrary maximum packing. These choices give b nu(G) old triangles avoiding the entire union of the M_j.

For each j and each xy in M_j, add the triangle a_j x y. These qn/2 triangles are pairwise edge-disjoint: within one apex the rim edges form a perfect matching; across apices the spokes differ and the rim matchings are edge-disjoint. They are also disjoint from the old packing. Add an independent maximum packing inside K_q. This proves the lower bound in (1).

For the upper bound, classify ALL actual J-triangles as follows:

* wholly in H, contributing at most b nu(G);
* wholly in the universal clique, contributing at most nu(K_q);
* meeting both sets, each using EXACTLY two cross edges.

There are qn cross edges, so mixed triangles contribute at most qn/2. These classes exhaust all actual triangles, proving equality in (1).

After deletion of ANY two distinct cross edges, the same classification gives

    nu(J-S) <= b nu(G) + (qn-2)/2 + nu(K_q)
             = nu(J)-1.

This includes same-apex, different-apex, adjacent and disjoint cross-edge pairs. No assertion about other deleted edge types is needed to refute two-edge resilience.

## 4. Application to a hypothetical positive-defect seed

An edge-minimal Tuza counterexample G retains nu after deletion of any one or two graph edges. Indeed, if |S|<=2 and nu(G-S)<=nu(G)-1, minimality gives

    tau(G)<=tau(G-S)+|S|
          <=2(nu(G)-1)+2=2nu(G),

a contradiction. Thus any prescribed e0 satisfies the seed hypothesis.

If delta(G)>0, equations(1)-(2) and tau(J)>=tau(H) give

    delta(J)>=b delta(G)-qn-2nu(K_q).

Since F and hence b/n can be chosen arbitrarily large, and M can then be arbitrarily large, this lower bound can be made strictly positive while the two-cross-edge blocker persists. Thus the same amplification freedom that preserves a hypothetical violation can also create complete cross-edge packing saturation. Positive defect and arbitrarily many FIXED universal vertices alone do not enforce two-edge resilience.

If the seed is two-edge resilient, H is too: each deleted graph edge belongs to one copy, and each affected copy receives at most two deletions and retains a maximum packing. Their union retains b nu(G). Consequently the obstruction is genuinely introduced by the universal join, rather than inherited from a nonresilient rim.

The unresolved task is to avoid this saturation through a deliberately different incidence geometry or a new global packing mechanism, while retaining the overhead budget. Neither this result nor the previous spoke-gadget obstructions supplies that construction or proves it impossible.
