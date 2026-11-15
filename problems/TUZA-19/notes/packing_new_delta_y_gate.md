# Simultaneous Delta-Y: exact encoding and failure of the closed-boundary T-join gate

Status: ordinary exact encoding and auxiliary counterexample, with a standalone literal verifier. Independent review pending. No unrestricted Tuza proof or counterexample is claimed. The original TUZA-19 start and deadlines remain01:53:58Z,09:23:58Z,09:53:58Z; this reactivated lane first read the clock at04:32:20Z. All computation is local Darwin.

## Exact operation, proposed availability, and implication

Fix a maximum triangle packing P of size k in a finite simple graph G. Let B=E(P) and N=E(G) minus B. Simultaneously replace each packed triangle abc by a fresh degree-three vertex t joined to a,b,c; remove its three old edges. Keep N. Call the resulting graph H.

There is a ground-set bijection phi from E(G) to E(H): an old packed edge ab maps to the OPPOSITE spoke tc, and an N edge maps to itself. There is no cost change under this bijection. The new vertices form a set T of size k.

A natural parity-factor gate DY-J was proposed: for every CONNECTED G with even nu(G), there is some maximum P and an edge set F in H such that

    odd-degree vertices of (V(H),F) are exactly T,
    |F| <= 2|P|,
    phi^{-1}(F) is an actual triangle cover of G.

The first condition says F is a T-join: all original vertices have even degree, all new degree-three centres have odd degree. Connectedness and even k remove trivial component-parity infeasibility. The intended computational mechanism was to start from a minimum T-join and repair uncovered lifted triangle constraints by alternating cycles, allowing arbitrarily long neutral moves. The independent availability obligation is that some repair stays within2k; it is not assumed from existence of a T-join.

DY-J would imply unrestricted Tuza. For any connected G, join two disjoint copies at one vertex. No triangle crosses that one-vertex interface, so both nu and tau add; the resulting connected graph has even packing number2nu(G). A DY-J cover of size4nu(G) then gives2tau(G)<=4nu(G). Disconnected G follows componentwise. Vertex gluing, rather than merely taking a disconnected double, avoids the trivial odd-terminal count in separate components.

**The gate is false.** K5 satisfies both edge-cover-criticality and two-edge packing resilience, yet for EVERY maximum packing its least inverse-covering T-join has size6>4=2nu. A connected bouquet amplifies this to6m versus4m. Changing P or allowing longer neutral moves inside the same parity class cannot repair this availability failure.

## What Delta-Y preserves exactly

H is triangle-free. Its old-only induced graph is N, which is triangle-free by maximality of P. A triangle with one new centre would require an N edge between two vertices of its packed triangle, but all three such edges were removed. There are no edges between new centres.

H is connected whenever G is connected: an original packed edge ab can be replaced along a path by a-t-b. The operation therefore really produces an ordinary connected triangle-free graph, not an abstract incidence object.

For a nonpacked actual triangle Q, let r be the number of its B edges. Maximality gives r>=1; Q uses at most one edge of any packed member, so r distinct packed members occur. Starting with phi(E(Q)), take symmetric difference with all three spokes at each of those r new centres. The result is a simple cycle L_Q of length3+r. It is precisely the cycle obtained by replacing each B edge of Q by its two-spoke path.

Give each retained N edge weight1 and each star spoke weight1/2. Then L_Q has weighted length3. Conversely every simple H cycle of weighted length3 compresses to an actual nonpacked G triangle: its three original vertices are distinct, and its visited new centres replace distinct packed edges. Thus the nonpacked triangles correspond exactly to weighted-length-three cycles, of ordinary lengths4,5,6. Packed triangles themselves become the three-spoke cuts at the new centres.

However a triangle COVER is not an ordinary cycle transversal in H. For L_Q, the original B edge of Q maps to the UNIQUE spoke at its visited centre that lies OUTSIDE L_Q. Consequently C=phi^{-1}(F) covers G exactly when:

1. F contains at least one spoke at every new centre, covering each member of P;
2. for every weighted-length-three cycle L, F contains either an N edge ON L or the unused third spoke at one of L's new centres.

Selected spokes ON the lifted cycle do not themselves cover the corresponding original triangle. This distinction is the main obstruction to importing a graphic cycle-matroid argument without an additional transfer theorem.

For example, with K5 packing(vab,vcd), F={t1v,t2v} is a minimum T-join. Its inverse is {ab,cd}, which misses each of vac,vad,vbc,vbd. The lift of vac contains BOTH selected spokes, but the original triangle is uncovered. Merely meeting the lifted cycles is therefore the wrong constraint.

## Exact K5 calculation over all T-join states

Every maximum K5 packing consists of two triangles sharing exactly one vertex. All15 such packings are equivalent under automorphisms, so fix P=(vab,vcd). Its four N edges are ac,ad,bc,bd. Write their selected indicators as p,q,r,s in F2. Original-vertex evenness and new-centre oddness force

    c_ab = c_cd = t = 1+p+q+r+s,
    c_vb = p+q,   c_va = r+s,
    c_vd = p+r,   c_vc = q+s.

Every addition here is modulo2. Conversely these formulas give a T-join for each of the16 choices of p,q,r,s. Thus this list is exhaustive, not a sampling assumption.

The resulting states classify as follows:

| Number of selected N edges | Shape when needed | Total size | Is the inverse a cover? |
|---|---|---:|---|
|0|—|2|No: all four mixed apex triangles are missed.|
|1|—|3|No.|
|2|The two N edges share an endpoint.|6|Yes.|
|2|The two N edges are disjoint.|8|Yes.|
|3|—|5|No.|
|4|—|6|Yes.|

For one N edge, symmetry permits p=1 and q=r=s=0. The inverse set is {ac,vb,vd}, missing abd and bcd. For three N edges, symmetry permits p=q=r=1,s=0. The inverse set is {va,vc,ac,ad,bc}, missing vbd. These prove the only remaining noncover cases. The two-edge and four-edge rows are verified directly from the displayed formulas; for the lower bound it suffices that none of the rows below six is a cover.

A size-six covering T-join is explicit: take all six edges among a,b,c,d in G. Every triangle has an edge among these four vertices. Its image consists of the four N edges and the spokes t1v,t2v; all original degrees are even and both new centres have degree one. Hence the exact constrained optimum is6.

The finite verifier reconstructs all10 graph triangles, all15 maximum packings, and all16 T-join states for each. Exactly seven of the16 states are inverse covers: five have size6 and two have size8. This supports the calculation; the equations and automorphism argument prove completeness ordinarily.

## This control satisfies the exact criticality and resilience assumptions

K5 has nu=2. Three edge-disjoint triangles would leave one edge of its ten, but both K5 and the edge union of triangles have even vertex degrees, whereas a single leftover edge does not. Two packed triangles are explicit.

Its cover number is4: three edges meet at most nine of the ten triangles, while the edges within a2+3 partition form a four-cover. Every edge belongs to some such minimum cover, so deleting any edge lowers tau by exactly one.

Deleting any two edges preserves a two-packing. There are two automorphism orbits. For deleted adjacent edges01,02, use triangles034 and123. For deleted disjoint edges01,23, use triangles024 and134. The assertions for zero or one deleted edge follow by extending that deletion set to two edges. Therefore K5 meets BOTH current parity-gate hypotheses. Its ordinary odd-cover number is also4, attained by the same2+3 partition; the failure here concerns the extra Delta-Y degree-boundary constraint, not the existing odd-transversal gate.

## Connected amplification and unbounded terminal demand

Let G_m be m copies of K5 sharing exactly one vertex w, with all other vertices private to their block. Every actual triangle belongs uniquely to one block. Thus

    |V|=4m+1, |E|=10m, number of triangles=10m,
    nu=2m, tau=pi=4m.

Both criticality and two-edge resilience persist blockwise. Every maximum packing has two triangles in each block, although the common vertex of those two triangles need not be w.

For a T-join whose original vertices are all even, all private original vertices of each block are even. Its two new centres are odd. Handshaking WITHIN THAT BLOCK then forces even degree at its copy of w too. Hence its restriction is one of the K5 T-joins above, and any inverse cover costs at least6 in each block. These minima unite, so the exact global constrained optimum is6m for every maximum P. The gap above2nu is2m.

Allowing a bounded number of exceptional original odd-degree vertices cannot fix this family. For any original cover C that is odd on each packed member, direct degree accounting gives, at an original vertex u,

    degree_H(phi(C))(u) = degree_G(C)(u) + d_P(u)  (mod2).

Every cover of size at most4m is locally a minimum four-cover in each K5. Such covers are exactly the edges within2+3 partitions. To verify this classification without importing an extremal theorem: their six-edge triangle-free complements have maximum degree3 (degree4 would leave only the four star edges), and a degree-three vertex has three independent neighbors; the sixth edge count forces the fifth vertex adjacent to all three, giving K2,3.

For a local maximum packing with common vertex v, d_P(v)=2 and all four other local incidences are1. The displayed parity identity shows that a minimum four-cover has exactly two old boundary vertices when v lies in the part of size3, and exactly four when v lies in the part of size2. In either case at least one boundary vertex is private to the block, because only w is shared. Therefore every factor-two cover produces at least m original boundary vertices globally; the total number must be even, because the number of new odd centres is2m. The lower bound is2ceil(m/2).

It is attained while choosing P and C simultaneously. In each block choose a private common packing vertex v_i and another private vertex u_i. Use the minimum cover associated with the part of size3 equal to {v_i,w,u_i}; its old boundary is exactly {w,u_i}. Globally the m private u_i remain odd and w is odd exactly when m is odd. Thus

    min_(maximum P, cover |C|<=2nu) |old boundary of phi(C)|
        = m+(m mod2) = 2ceil(m/2).

This does not rule out a method that chooses a linearly large boundary together with its cover. It rules out restoring the proposed closed-boundary matching model by only a fixed number of extra original terminals.

## Further exact limitation of the naive graphic-matroid substitution

The admissible retained-original-edge sets (those containing no actual triangle) do not form a matroid independence family. In K4, the three-edge star at one vertex is triangle-free and inclusion-maximal; a four-edge cycle is triangle-free and larger. Adding either of the cycle edges absent from the star creates a triangle, violating the matroid augmentation axiom. Applying the Delta-Y ground-set bijection cannot change that violation.

This only rejects IDENTIFYING admissibility with graphic-matroid independence on the same ground set. It does not refute every possible matroid-parity encoding with additional gadgets or constraints. Such an encoding would still need to prove its exact solution transfer, preserve all weighted-length-three constraints, and allow the necessary original parity boundary.

## Decision, evidence, and unresolved obligation

The simultaneous Delta-Y construction is exact and retains endpoint geometry. The specific T-join availability lemma is decisively false, even with genuine maximum packing, both stated criticality assumptions, optimized packing choice, and unrestricted-length moves inside the T-join parity class. Symmetric-differencing longer cycles cannot change its fixed boundary, so neutral moves alone do not remove this obstruction.

No alternative global transfer emerged in this pass. With arbitrary old boundary allowed, the required short-cycle/off-cycle-spoke compatibility is still the original integral cover obligation; it must not be renamed a proved parity-factor theorem. The earlier private-page rotation ledger remains compatible with this encoding, but no paid correspondence from rotations to a sufficient family of blossom exchanges was established.

Reproduce locally:

```sh
source LOCAL_ENVIRONMENT
python checks/packing_new_delta_y.py
```

The checker and full literal evidence are checks/packing_new_delta_y.py and evidence/packing_routes/packing_new_delta_y.json. It checks all15 K5 maximum packings, all16 states each, all56 deletion sets of size at most2, the exact cycle lifts, and five explicit bouquet controls. Optimality for all m is the ordinary block argument, not a claim of an unbounded computation. No Lean, human review, or originality claim is made.
