> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Exact cone covers: local private saturation and two-vertex matching avoidance

Frozen ordinary conditional interfaces, 2026-11-16. Source_audit. This uses the notation and established actual-family partition of all_minimum_exact_cone_unique_family_v1.md. Let G=h+L, C={hs:s in S} union E(A), where S is independent, B=V(L) minus S, A=L[B] is triangle-free, r=|S| and m=|E(A)|. Let K=L[S,B] be the bipartite cross graph. These are supplied structural hypotheses arising from an exact-one minimum cover; no cone availability is asserted.

## 1. Every individual A-star has a full private packing

Under the ALL-minimum-exact and triangle-codegree hypotheses of the preceding note, its strict induced-neighborhood inequality applies to every nonempty subset F={uv:v in X} of an A-star at u. The hub term is one, and each s term is one exactly when s is adjacent to u and to some vertex of X. Thus

    |{s in S: su exists and N_L(s) intersects X}| >= |X|.

Hall's elementary matching theorem supplies, for every u, an injection phi:N_A(u) -> S with phi(v) adjacent to both u and v. The actual triangles u v phi(v), one per A-edge at u, are pairwise edge-disjoint: their bases are distinct, their u--S edges are distinct, and their remaining B--S edges cannot coincide. This is a full packing on one star at a time. Simultaneous choices at different A vertices are NOT asserted.

## 2. A minimum cross-family cover cannot use an A-active vertex

The star-assigned family is exactly the hub cone on K. Its ordinary triangle-cover number is vc(K)=mu(K), by the literal cone identity and bipartite matching-cover equality. Global minimality of C forces this value to be r, since the other m bases cover the entire other assigned family.

Any minimum vertex cover Q of K gives a global minimum cover E(A) union {hq:q in Q}. Under ALL-minimum exactness, Q cannot contain a vertex u with positive A-degree: the hub page on any A-edge uv would then be hit both by hu and by uv. Therefore no minimum vertex cover of K contains an A-active B vertex.

Equivalently, for every such u there is a maximum K matching of size r avoiding u. For if mu(K-u)<=r-1, bipartite matching-cover equality gives a cover of K-u of size at most r-1; adjoining u gives a minimum K cover containing u, a contradiction. This also follows from the strict Hall replacement condition: if nonempty X subset S has N_K(X) meeting an A-active vertex, then |N_K(X)|>=|X|+1, since equality would let one replace X by N_K(X) in the minimum cover S.

## 3. The original residual-cover condition gives simultaneous avoidance of each A-edge

Now additionally suppose every actual triangle T satisfies

    tau(G-E(T)) = tau(G)-1 = r+m-1.                       (R)

For every A-edge uv, the actual hub triangle T=huv deletes hu,hv,uv. All surviving triangles assigned to A bases are covered by E(A) minus {uv}: every triangle assigned to uv itself is destroyed by deleting uv. The surviving star-assigned family is precisely the hub cone on K-{u,v}. Hence

    tau(G-E(T)) <= m-1 + vc(K-{u,v})
                 = m-1 + mu(K-{u,v}).

Combining with (R), and the upper bound mu(K-{u,v})<=|S|=r, yields

    mu(K-{u,v}) = r for EVERY uv in E(A).                 (1)

Thus some matching saturating S avoids BOTH endpoints of any prescribed A-edge. Its r hub pages are edge-disjoint from huv; appending huv gives

    nu(G) >= r+1 whenever m>0.                           (2)

For strict original H-D, tau(G)=2k-1 and nu(G)=k, so (2) implies r<=k-1 and m>=k. This is a necessary parameter restriction, not a bound on k. No matching simultaneously avoiding endpoints of several A-edges is proved, and no global full m-page packing is obtained from Section 1.

The new content is the actual two-vertex avoidance forced by the exact residual COVER equality. The original residual PACKING equality is not used in these interfaces. All arguments are ordinary; Hall and bipartite matching-cover equality are standard elementary matching inputs. No finite search or abstract rainbow-matching minmax is imported.
