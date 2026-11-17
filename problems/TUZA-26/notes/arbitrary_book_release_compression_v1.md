> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Arbitrary-book release compression with coupled endpoint fans

Ordinary operation candidate, TUZA-26, 2026-11-17. This extends the accepted codegree-two singleton theorem. It does not assert an available augmentation, name a defect-two support, or replace physical triangle disjointness by a cover-edge matching.

## Actual setup and coupled fan optimum

Let Q be finite simple, uv an edge, X=N(u) intersect N(v), and x,y distinct elements of X. Put L=Q-{uv,ux,vx,uy,vy}. Assume nu(Q)=k and an actual maximum L packing M has size k-1. Partition it as M0, Mu, Mv according as its triangles contain neither endpoint, u, or v. No L triangle contains both endpoints. Write r=|Mu|+|Mv|. Fix the reserved page apex h in {x,y}.

For S subset M0, retain M0-S. A feasible pair of endpoint fans consists of actual Q triangles containing u but not v, and containing v but not u, subject to ALL the following conditions:

1. no selected triangle uses the spoke uh or vh;
2. each fan is internally edge-disjoint (its actual rim edges form a matching);
3. the two fans are mutually edge-disjoint, including their physical rim edges;
4. every selected triangle avoids every edge of the retained M0-S.

Since M0 has neither endpoint, only its rim edges can cause the fourth obstruction. Let f(S) be the maximum total number of selected fan triangles. This is a COUPLED actual packing problem. It need not be the sum of two separate matching numbers: common rims at additional book apices are forbidden physical collisions.

The old Mu,Mv give f(empty)>=r. If f(empty)>=r+1, retaining M0 and appending uvh would give at least (k-1)+2=k+1 actual Q triangles. Therefore f(empty)=r. More generally, any S with

    f(S) >= r+|S|+1

would yield the actual packing (M0-S) union the selected fans union {uvh}, of size at least k+1. Call such S profitable. The theorem below is a valid compression of this conditional operation; it does not prove that a profitable S exists.

## Compression theorem

If S is profitable, it contains a profitable subset D of size at most |X|-1, with every T in D supplying one selected new rim to EACH endpoint fan. In particular |D|>=1. At codegree two this recovers the single-triangle conclusion, while for larger books a multi-triangle obstruction remains.

Choose fans attaining f(S). A selected rim is new when it belongs to a triangle in S. Its label is unique because M0 is edge-disjoint. A fixed label T supplies at most one rim to the u fan and at most one to the v fan: any two edges of a triangle share a vertex and cannot both lie in one rim matching. The same physical rim cannot be selected in both fans by condition3.

Let D consist of labels supplying one rim to each fan. Delete from the selected fans all rims labelled by S-D, and retain the other selected triangles. Each removed label costs at most one fan triangle; labels supplying no rim cost zero. The resulting coupled fans avoid every edge of M0-D, so

    f(D) >= f(S)-|S-D| >= r+|D|+1.

Thus D is profitable. If D were empty this would contradict f(empty)=r.

For each T in D the two distinct selected rims meet at a vertex g(T). As one rim belongs to a u triangle and the other to a v triangle, g(T) is a common neighbor of u,v. It is not h, since both fans avoid the reserved spokes. Distinct labels have distinct g(T): otherwise the u rim matching would use that vertex twice. Hence T -> g(T) injects D into X-{h}, and |D|<=|X|-1.

The proof counts actual selected triangles and explicitly preserves common-rim disjointness. It requires neither separate matching-rank additivity nor submodularity of released-label rank. It also does not require canonicality of M0. No graph-order bound enters.

## A literal three-page example showing why singleton compression stops

The rank phenomenon at three pages already occurs in an actual simple graph. It is a control for the OPERATION, not a graph satisfying the target minimum-Q profile.

Use vertices u,v,h,g1,g2,a1,b1,a2,b2. Its complete edge set is:

* uv and both endpoint spokes to h,g1,g2;
* the three edges of each T_i=g_i a_i b_i, i=1,2;
* ua1,ua2,vb1,vb2;
* b1b2.

The complete actual triangle list is

    uvh, uvg1, uvg2,
    ug1a1, vg1b1, ug2a2, vg2b2,
    T1, T2, vb1b2.

Take M0={T1,T2}, Mu=empty, Mv={vb1b2}, and reserve h. Then r=1 and f(empty)=1. Releasing only T_i gives one u-fan edge and a v-link consisting of the old edge b1b2 together with g_i b_i. Those two v-link edges meet, so f({T_i})=2=r+1: neither singleton is profitable. Releasing BOTH labels gives two disjoint u rims and two disjoint v rims, hence f({T1,T2})=4=r+3. This is profitable and the actual five-packing is

    ug1a1, ug2a2, vg1b1, vg2b2, uvh.

There are no common physical rims between these two fans. The old three-packing is maximum in L=Q-{uv,uh,vh,ug1,vg1}: T1 is separate, and among the four remaining triangles T2,ug2a2,vg2b2,vb1b2 at most two can be packed. The displayed five-packing is maximum in Q: its three uv-pages share uv, while deleting those pages leaves a family with packing at most4. This last upper bound follows from the two triples {T_i,ug_i a_i,vg_i b_i} (at most2 each), together with vb1b2, which prevents choosing both v triangles if it is used. Thus nu(Q)=5, nu(L)=3. In particular this control FAILS the required target equation nu(L)=nu(Q)-1 and is not a counterexample to the main theorem.

It shows precisely that after codegree increases, a jointly profitable pair can exist without a profitable singleton. The extra power comes from the second fan's ordinary matching complementarity, while all triangle and edge identities remain literal.

## What this enables and what it does not

For each actual compatible pair in the conditional minimum Q and either reserved page, it is enough to rule in a profitable set of at most |X|-1 doubly supplying outside triangles; if none exists, releasing ANY larger subset while only replacing endpoint fans cannot help. This is an exact reduction of the arbitrary-codegree operation, not universal availability. Outside-packing switches can still add power, as in the separately reviewed third-hub and four-for-two operations.

Sources: accepted matching26_release_set_compression_v1.md, matching26_endpoint_link_operations_v1.md and matching26_book_exchange_v2.md. Root derived the coupled-fan compression. No numerical search was used.
