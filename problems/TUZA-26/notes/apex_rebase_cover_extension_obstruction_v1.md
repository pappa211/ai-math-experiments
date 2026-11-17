> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# The rebasing cover target: exact crossing constraints and a local obstruction

Frozen bounded-attempt record, TUZA-26. This supplies a literal sufficient cover-extension criterion and identifies why the proposed two-edges-per-packed-triangle argument is not licensed by full-triangle eligibility. The criterion's availability is OPEN; no new global reduction is claimed.

## Exact target from the accepted retention loss

Use apex_compatible_pair_rebasing_v1.md and its accepted review. M has s outside triangles T_1,...,T_s and r endpoint triangles, with k-1=s+r. For a compatible rebase z,w, put

    D=L_{z,w}-union_i E(T_i).

The strict retention theorem gives nu(D)<=r-1. Proper CS inside the fixed G therefore gives an actual D cover F with

    |F|=tau(D)<=2r-2.

An extension of F to a Q cover using at most 2s+2 additional edges would have size at most

    2r-2+2s+2=2k-2,

contradicting tau(Q)=2k-1. The naive extension selects all 3s packed-triangle edges and the five deleted book edges, costing 3s+5. It exceeds the target by s+3. Neither resilience nor the strict packing-retention inequality, by itself, specifies how to pay these edges.

F is a cover of the ACTUAL D graph. Every edge of F lies outside every T_i and outside the five deleted book edges. Arbitrary old background and every crossing triangle are retained.

## A complete-boundary criterion with exactly the target budget

Fix such an actual F. Choose any set B of at most two additional Q edges; these may be background or old D edges and are not restricted to the deleted book set. For each packed triangle T_i choose one edge q_i to omit, and select its other two edges. The proposed extension is

    C=F union B union union_i (E(T_i)-{q_i}).

Its cost is at most |F|+2s+2. The following finite constraint is EXACT for this displayed form of extension and includes ALL actual Q triangles.

Ignore triangles already hit by F or B. Each T_i itself is hit by its two selected edges. Any other triangle A contains at most one edge from each T_i: two edges from one T_i would determine that same triangle. Let

    I(A)={i: E(A) intersects E(T_i)},

and for i in I(A) let a_i(A) be that unique shared physical edge.

* If I(A) is empty, this choice of F,B is impossible: no selected packed-triangle edge can cover A.
* Otherwise impose the clause that NOT ALL equalities q_i=a_i(A), for i in I(A), hold simultaneously.

Every clause has one, two or three actual packed-triangle variables. A satisfying choice of the omitted edges q_i gives the literal Q cover C at the required cost, and therefore a contradiction. Conversely, a cover of this displayed form satisfies every clause. This is a complete physical crossing criterion, not a claim that these ternary choices are automatically satisfiable or form a two-SAT problem.

For example, if B={uv,b}, every uv-page is paid by uv. Before choosing omissions, the remaining triangles using no packed-triangle edge must ALL be hit by the single additional edge b. They are actual endpoint-page triangles over D and may have unrelated rims; they cannot simply be discarded. Other choices of B are allowed, but they must also hit the marked uvz and uvw pages, whose spokes are absent from D and every T_i.

This makes two independent requirements visible: pay the book/endpoint family with B and F, and satisfy every one-, two-, or three-triangle crossing clause. Global canonicality is a packing statement and has not yet forced either requirement for a suitable minimum D cover.

## Sharp local control against a per-triangle budget inference

Consider a literal K5 on vertices a,b,c,d,e. Take the maximum packing

    T_1=abc, T_2=ade.

It has size two. Deleting their six edges leaves the triangle-free K2,2 between {b,c} and {d,e}, together with isolated a; its minimum triangle cover is empty. Every K5 triangle is wholly contained in some minimum cover: take that triangle's three edges and the edge joining its two complementary vertices. Thus BOTH maximum-packing and full-triangle-minimum-cover premises hold in this local control.

Nevertheless, selecting exactly two edges from T_1 and exactly two from T_2 NEVER covers K5. Such a four-edge selection contains no triangle: the only triangles in E(T_1) union E(T_2) are T_1,T_2, and both have an omitted edge. But every four-edge triangle cover of K5 is a triangle plus its complementary edge. Indeed its six-edge complement is triangle-free, hence an extremal K2,3 by the equality case of the elementary five-vertex Mantel bound; taking the complement gives K3 union K2. The displayed two-plus-two selection cannot have that form.

There are valid minimum covers, such as E(T_1) union {de}, which allocate THREE edges to one packed triangle and ONE to the other. Other choices may use residual cross edges. Thus full-triangle eligibility does not provide simultaneous two-edge allocations aligned with a prescribed maximum packing or with a prescribed residual minimum cover.

This K5 is deliberately a LOCAL logical control, not a graph satisfying the entire minimum-Q profile: it has defect zero, no canonical crossing/rebasing loss, and does not refute the numerical target 2s+2. It refutes precisely the proposed implication from the two cited premises to the naive two-per-triangle extension. The extra two edges in B, a different F, or nonuniform allocation may still repair an actual target instance and must be justified separately.

## Exact obstruction and next decision

No forcing proof emerged in this bounded attempt. The accepted strict packing loss yields tau(D)<=2r-2, but gives no extension rule for its covers. Individual full-triangle covers of Q need not restrict to minimum D covers, and the local K5 control shows that their edge allocations cannot be combined triangle by triangle. The five rebasing conflict components can be arbitrarily large and are packing-conflict components, not small complete graph-triangle boundaries.

An enabled next step would have to produce an F and B satisfying the complete crossing clauses, prove a different nonuniform extension of cost at most 2s+2, or directly change the outside packing. Merely selecting two edges of each T_i, treating a ternary crossing as a pairwise constraint, or assuming all full-triangle covers share the same residual restriction would leave an actual gap.

This note freezes the precise conditional operation and obstruction so the six-hour strategy decision can distinguish a proved interface from an available payment. No enumeration, numerical computation, degree catalogue, or further free-edge family was started. Relied sources: notes/apex_compatible_pair_rebasing_v1.md and reviews/opening_rebasing_review.md; the accepted full-triangle cover property; elementary K5 cover and packing facts checked above.
