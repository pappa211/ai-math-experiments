> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Book blockers: exact cover exchange and a connected control

TUZA-26, frozen ordinary lemma and prescribed witness check, 2026-11-16. This is a local operation criterion and an explicit limitation; it does not close the minimum-Q problem or classify defect-two supports.

## Current scope

Write e=uv, K=Q-e, X=N_Q(u) intersect N_Q(v), and P_x={ux,vx}. The accepted main profile supplies

    nu(Q)=nu(K)=k, tau(Q)=2k-1, tau(K)=2k-2;
    K is triangle-connected, supported and single-edge resilient;
    nu(K-P_x)=k-1, tau(K-P_x)=2k-4 for every x in X.

Each P_x is contained in a minimum K cover. No minimum K cover hits all P_x: such a cover would cover every old triangle and every new uv-page, contradicting tau(Q)=tau(K)+1. All graph triangles below are actual; background edges and triangles outside the book are retained. The minimum-Q convention names smaller resilient defect-one supports only, not K or its defect-two page residuals.

## A balanced-component exchange operation

Let F and F' be ANY two minimum triangle covers of K. Put D=F intersect F', A=F minus D, B=F' minus D. For every actual K triangle t not hit by D, join every a in A intersect E(t) to every b in B intersect E(t). This gives a bipartite graph H on A and B. Both intersections are nonempty, because F and F' cover t. They lie in one connected component of H.

For each component H_i, let A_i and B_i be its sides. For ANY choices of one entire side per component,

    D union (the chosen A_i or B_i)

covers K. A triangle hit by D is already covered. Otherwise its nonempty A and B intersections belong to one component, and either chosen side meets it.

Every component is balanced: |A_i|=|B_i|. Indeed replacing A_i in F by B_i is a cover, so minimality of F gives |B_i|>=|A_i|; the reverse replacement in F' gives the opposite inequality. In particular there are no isolated vertices in H. Therefore EVERY such component choice is a minimum K cover.

Introduce one Boolean variable z_i: true selects A_i, false selects B_i. Each book page P_x is already hit if D meets it. Otherwise each spoke in A contributes its positive component literal and each spoke in B its negative component literal; spokes outside F union F' contribute no literal. Requiring every page to be hit is precisely a conjunction of clauses of length at most two. An empty clause means that F union F' misses that page. A satisfying assignment gives an ACTUAL cover of Q with tau(K) edges, an explicit saving of one. No additional triangle inspection is needed after the construction, because H included every actual triangle unhit by D.

Thus this is a valid conditional paid operation: any pair of minimum covers whose component clauses are satisfiable excludes the proposed Q. It is not yet a proof that a suitable pair exists.

For exactly two common neighbors x,y, choose F containing P_x and F' containing P_y. Since no minimum cover hits both pages, F misses P_y and F' misses P_x; hence P_x is contained in A and P_y in B. The two clauses are satisfiable unless all four spokes belong to a single H component. Indeed if an x-spoke and a y-spoke lie in different components, select A at the former and B at the latter. Conversely, if every such pair has the same component, all four spokes have that component and the clauses demand both choices. Consequently the remaining codegree-two case forces one balanced exchange component containing all four spokes. This is a precise obstruction, not a triangle-packing contradiction.

## A consequence of the global no-blocker condition

Assume additionally Q is two-edge packing resilient. Define a graph J on X by

    xy in E(J) iff nu(K-P_x-P_y)=k-1.

Then J has no isolated vertex. Fix x. Q-P_x has a k-packing. K-P_x has packing number k-1, so that packing must use a triangle uv y with y different from x. Remove this triangle. The remaining k-1 triangles avoid P_x and P_y and belong to K, proving the required equality. For codegree two, this forces the single possible J edge.

This argument is ordinary and retains all crossing triangles. It supplies a concrete compatibility fact for the exchange problem; it does not by itself give a cheaper cover.

## Why a matching of cover edges is not a triangle packing

The even smaller relaxed example K=K5-uv has common neighbors x,y,z, nu(K)=2 and tau(K)=3. Minimum covers

    F_x={ux,vx,yz}, F_y={uy,vy,xz}

give a six-cycle plus one chord H. In addition to the six cross edges arising from uxy, uxz, vxy, vxz, uyz, vyz, the actual triangle xyz contributes the cross edge yz--xz. The FULL disagreement graph therefore has THREE perfect matchings. Their selected actual triangles are:

* uxy, vxz, vyz: the latter two share their third edge vz.
* uxz, vxy, uyz: the first and third share their third edge uz.
* uxy, vxy, xyz: all three share their third edge xy.

The page z is missed by both covers. Hence no perfect matching in this full graph can be promoted to an edge-disjoint triangle packing. This example has defect one, so it is a warning about the exchange inference, not the prescribed defect-two control. Version 2 corrects the omission of xyz in the illustrative example in version 1; the balanced-component, Boolean-clause, and compatibility proofs are unchanged.

## Connected defect-two control

Let Q be the frozen central_K4_star_555: central K4 on 0123 and K5 leaves 01456, 02789, and 03(10)(11)(12). Set e=45. The prescribed certificate gives

    nu(Q)=7, tau(Q)=13, minimum degree(Q)=4;
    nu(K)=7, tau(K)=12, delta(K)=2.

K is supported and has ONE triangle component. It is single-edge resilient: the evidence contains an actual seven-triangle packing after deleting every individual K edge. The book apices are exactly 0,1,6. For every apex x,

    nu(K-P_x)=6, tau(K-P_x)=10, delta(K-P_x)=2,

and an explicit minimum K cover contains P_x. Nevertheless no minimum K cover hits all pages, since tau(Q)=13>12.

This verifies that connectedness, support, resilience, minimum degree four for Q, all local book pair equations, and joint cover eligibility are insufficient for the desired paid operation. The control is excluded by global hypotheses already available in the actual minimum-Q problem:

* Q has the blocker pair {01,23}; deletion leaves packing number six.
* Q-E(123) consists of the three literal K5 leaf supports, meeting only at vertex 0. Thus it has nu=6, tau=12, defect zero, contradicting the universal triangle-residual defect-two condition.
* The leaf attachment {0,1} is a two-vertex separator.

The second prescribed control is two K5s sharing edge 01, followed by deleting 01. It has (nu(Q),tau(Q))=(4,7), (nu(K),tau(K))=(4,6), and every book-pair residual (3,4). K has two triangle components. It isolates why ordinary graph connectedness alone is even weaker than connected triangle support.

## Certificate method and remaining step

`scripts/matching26_book_controls.py` checks exactly these two prescribed frozen models; it does not enumerate a graph class or invoke an optimizer. Each actual triangle belongs to exactly one literal clique piece. Summing the local K4/K5 packing bounds gives the global upper bound, and products of local maximum packings supply the stored lower witnesses. For covers, enumerate the root clique cover and condition each leaf on whether its shared parent edge is selected. A K4 leaf costs two edges total and a K5 leaf four; the already-selected parent edge reduces the required new edges by one. The private leaf edges are disjoint, so this gives an exact additive lower bound and complete feasible minimum-cover response pool. Every saved cover and packing is checked against actual graph triangles. Edge and page residual optima then follow from explicit witnesses and the standard deletion/append inequalities.

The script examined 4,995 maximum packings and 1,488 minimum covers of star555, and 144 maximum packings and 16 minimum covers of two_K5_edge. Every numerical process has exited. The only frozen input is inputs/C12_frozen.json, hashed in the evidence.

What remains open is an operation forced by the GLOBAL no-blocker, three-connectivity, and universal triangle-cover/residual constraints. The cheapest justified next step is the codegree-two balanced-component obstruction: use the forced k-1 packing avoiding all four spokes together with the single exchange component containing them, while tracking third-edge collisions explicitly. For general books, an exchange that only invokes the displayed local profile is blocked by the connected star555 control. No broader defect-two classification or census is justified by this attempt.

Dependency chain: conditional minimum-CS framework -> accepted minimum-Q/global single-edge and triangle profiles -> balanced-component paid operation criterion (ordinary, above) -> availability of a satisfiable exchange or other paid reduction (OPEN) -> exclusion of the final core (OPEN) -> Tuza. The last implications have not been completed here.
