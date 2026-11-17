> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Codegree two: an exact cover repair for zero or one outside exchange

Frozen ordinary proof candidate v1, TUZA-26, 2026-11-16. Independent review required. This supplies an actual cover operation on the marked missing-edge interface. It does NOT prove that the operation is available for every remaining minimum Q, and it does not contract vertices or discard outside pages.

## Modular cover statement

Let Q be any finite simple graph, let uv be an edge whose common neighbors are EXACTLY two distinct vertices x,y, and let K=Q-uv. Write

    P_x={ux,vx}, P_y={uy,vy}.

Suppose tau(K)=t and tau(Q)=t+1. Suppose K has minimum covers F_x,F_y with P_x contained in F_x and P_y contained in F_y. Then F_x is disjoint from P_y and F_y is disjoint from P_x: otherwise that size-t K cover would also hit both uv-pages and cover Q.

Define their complete outside parts

    A_x=F_x-P_x, A_y=F_y-P_y.

Both have size t-2 and avoid all four spokes and uv. The theorem is

    |A_x minus A_y|=|A_y minus A_x| >= 2.

More constructively, if the outside parts agree or differ by only one exchange, the proof below produces an explicit Q cover of size at most t. All other graph edges, vertices and triangles are retained; the common outside cover pays for them literally.

No packing, CS, connectivity, degree bound, or named-model hypothesis is needed for this modular cover lemma. In the intended minimum-Q application t=2k-2, and the two covers exist because each Q triangle uvx/uvy is contained in a minimum Q cover: remove uv from that cover. A repaired cover of size t would contradict tau(Q)=2k-1.

## Zero outside exchanges

If A_x=A_y=A, every K triangle missed by A meets BOTH P_x and P_y. Two opposite spokes are disjoint and cannot belong to a triangle. Thus the only possible such triangles are uxy and vxy, present only when xy is an edge.

Either opposite-spoke pair

    M_1={ux,vy}, M_2={vx,uy}

covers BOTH uv-pages uvx,uvy and BOTH possible side triangles uxy,vxy. Therefore A union M_1 covers every actual Q triangle, with size (t-2)+2=t. This is the immediate cover operation; no assumption on xy is needed.

## One outside exchange: complete actual region

Suppose A_x=A union{p} and A_y=A union{q}, where p and q are distinct edges outside all four spokes and uv. Now |A|=t-3.

Every K triangle missed by A meets each of the two DISJOINT edge sets

    P_x union{p},   P_y union{q}.

Consequently it belongs to at least one of the following exhaustive classes:

1. It contains a spoke from P_x and a spoke from P_y: it is uxy or vxy.
2. It contains p and a spoke from P_y.
3. It contains q and a spoke from P_x.
4. It contains both p and q.

The two additional Q triangles are exactly uvx and uvy. Every missed K triangle contains two specified edges from these displayed sets, so its three vertices are among the endpoints of uv,ux,vx,uy,vy,p,q, at most eight vertices. This is an all-size domain deduction, not an assumption that Q is small. Arbitrarily many outside triangles are already hit by A. All endpoint identifications of p,q with u,v,x,y or fresh vertices remain allowed subject to the stated distinct-edge exclusions.

## The codegree-two restriction collapses one triangle class

If q differs from xy, there is at most ONE actual triangle containing q and an edge of P_x.

For two such triangles, q must meet both ux and vx. Their endpoints show that either q=uv, which is forbidden, or q=xz. Because q is distinct from ux,vx, its other endpoint z differs from u,v. The two triangles then require uz and vz. Thus z is a common neighbor of u and v. It cannot equal x in a simple graph, and the exact common-neighbor set is {x,y}; hence z=y and q=xy, contrary to the assumption.

This argument counts actual triangles and required old edges; it does not infer anything from an abstract set-system approximation. It includes arbitrary fresh endpoints for q. The symmetric assertion holds for p and P_y unless p=xy.

## The explicit three-edge repair

First suppose q differs from xy. If the unique possible class3 triangle exists, let s be its P_x edge. Choose the opposite-spoke pair M_1 or M_2 that contains s. If class3 is empty, choose either pair. Then

    A union M union{p}

covers ALL actual Q triangles:

- A covers every triangle outside the listed missed family;
- M covers both uv-pages and both possible side triangles;
- M covers the class3 triangle, if it exists;
- p covers all class2 and class4 triangles.

Its size is (t-3)+2+1=t. This is the desired contradiction.

If q=xy, then p differs from xy because p and q are distinct. Interchange the roles of x,y and p,q. There is at most one class2 triangle; choose the opposite-spoke pair containing its P_y edge and add q instead of p. Again A union M union{q} is an actual cover of size t.

This proves the theorem for both xy-present and xy-absent cases. The selected opposite pair always consists of actual spokes, so no missing xy edge is ever inserted into the cover. No numerical classification is needed.

## Exact missing-edge packing profile retained as context

For the conditional minimum Q, the accepted single-edge result gives K connected, triangle-supported, resilient, with nu(K)=k and tau(K)=2k-2. Every Q triangle is contained in some minimum cover. The marked pairs P_x,P_y satisfy

    nu(K-P_x)=nu(K-P_y)=k-1,
    tau(K-P_x)=tau(K-P_y)=2k-4.

All four CROSS pairs choosing one edge from each P-set are nonblockers in K. Deleting such a pair kills both uv-pages, so Q minus that pair and K minus that pair have identical triangle families; two-edge resilience of Q gives packing k. Thus maximum K packings avoiding the four cross pairs realize all four choices of the remaining two spokes. For opposite remaining spokes, the two spokes must occur in two different packed triangles. This is an exact profile, not an exchange theorem for those packings.

Let L=K-(P_x union P_y), retaining all other edges. In Q-P_x the sole remaining uv-page is uvy. Its packing is k by two-edge resilience, whereas K-P_x has packing k-1. Therefore a maximum Q-P_x packing uses uvy and leaves a size-(k-1) packing avoiding P_y, which lies in L. Conversely L is a subgraph of K-P_x. Hence

    nu(L)=k-1.

The covers A_x,A_y both cover L, giving tau(L)<=2k-4. Restoring all four spokes to a minimum L cover covers Q, since every lost actual triangle uses one of those spokes and uv alone is then background. Therefore tau(L)>=tau(Q)-4=2k-5. Consequently

    tau(L) is 2k-5 or 2k-4,
    delta(L) is 3 or2.

Deleting the four spokes is thus NOT itself a paid reduction of the required kind. The new result is the explicit cover repair when a pair of outside covers has exchange distance at most one, rather than another naming of this unpaid residual.

## Current hard obstruction and exact successor

The operation is now proved at a concrete, reviewable condition: given ANY admissible F_x,F_y whose outside parts differ by at most one edge exchange, construct the size-(2k-2) Q cover above. In a surviving codegree-two minimum-Q interface, EVERY such pair of covers must therefore satisfy outside exchange distance at least two; the full minimum K covers differ on at least eight edges in symmetric difference (four spokes plus at least four outside edges).

What remains OPEN is availability of a close pair, or a different paid operation forced by this persistent outside exchange. Minimum covers of general triangle hypergraphs have no assumed matroid exchange property. Neither their existence, edge eligibility, the four cross-pair packing witnesses, nor the defect-two/three four-spoke residual automatically supplies a one-step cover exchange. A graph contraction of uv would create uncontrolled triangles through the two exclusive neighbor sets and has not been used.

The next precise question is whether the actual common-neighbor geometry and the global minimum-Q constraints force the minimum distance between these two outside-cover families to be at most one, or expose a separate paid region when the distance is at least two. No sequence of higher-distance catalogues, graph census, or unsupported availability assertion is part of this note. The result gives a conditional cover operation, not an unrestricted Tuza conclusion. No numerical job was started for this proof.
