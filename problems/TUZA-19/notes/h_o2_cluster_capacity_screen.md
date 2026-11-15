# H-O2: cluster-capacity refinement of the resilience obstruction

Status: complete ordinary obstruction lemma for the stated join family. H-O2 itself remains unresolved. No counterexample, unrestricted Tuza proof, resilient-envelope construction, census, Lean verification, or novelty claim results from this screen.

Provenance: packing_critic, TUZA-19, local Darwin. Original start 2026-11-15T01:53:58Z, research cutoff 2026-11-15T09:23:58Z, hard deadline 2026-11-15T09:53:58Z. Requested Astra/Ultra; actual serving model and effort are not exposed.

## Exact global gate and reason for this screen

For a finite simple graph G, pi(G) is the least size of an edge set meeting every actual triangle in one or three edges. The open gate H-O2 is

    [tau(G-e)=tau(G)-1 for every edge e]
    AND [nu(G-S)=nu(G) for every edge set S of size at most two]
    ==> pi(G)<=2nu(G).

Its version with the additional TF hypothesis would also suffice for unrestricted Tuza, since an edge-minimal Tuza counterexample has all three premises. No general normalization to odd covers has been proved.

The precise existing route in `notes/global_routes_resilient_envelope.md` would refute H-O2 if an induced critical cone H could be placed in a two-edge-resilient graph B with pi(H)>2nu(B). Selective K5 decorations outside induced H then impose cover-criticality without losing resilience or H's parity objective. The known critical-cone examples have unbounded pi(H)/|V(H)|, so a resilient envelope with linear packing cost would suffice. No such envelope is supplied here.

The new universal/TF/non-WKE equivalence does not retain resilience. The insulated-K5 lemma independently rules out arbitrary spoke-only repairs around its specified K5 face. This screen therefore examines a different proposed escape: make a fixed-apex join genuinely unsaturated at the coarse spoke bound by inserting cluster/boundary parity obstructions. The lemma below shows that a deficit accounted for entirely by such boundary states is still insufficient when the remaining internal capacities are attained.

## 1. Actual graph and boundary states

Let F and R be vertex-disjoint finite simple graphs, with F nonempty and R triangle-free. Form G=F join R, adding all cross edges. The cross edges ar, with a in V(F) and r in V(R), are called spokes.

Fix ANY partition P=(R_1,...,R_t) of V(R) into nonempty clusters; no cluster is assumed independent, connected, or sparse. Put n_i=|R_i|.

An internal triangle for a cell (a,i) is a triangle auv with u,v in R_i and uv in E(R). A boundary triangle is every other actual triangle. Because R is triangle-free, the complete triangle classification is:

* triangles wholly inside F;
* triangles with two F vertices and one R vertex;
* triangles with one F vertex and a rim edge whose ends lie in different clusters;
* the internal triangles just defined.

There are no other triangles. In particular the model does not ignore old rim triangles: they are absent by the stated triangle-free hypothesis.

Let Q range over all edge-disjoint packings consisting of boundary triangles. This is an actual graph packing condition, retaining all conflicts among boundary edges and spokes. Let d_Q(a,i) be the number of spokes from a to R_i used by Q. Define the integer

    score_P(Q)=|Q|+sum_(a in V(F), i) floor((n_i-d_Q(a,i))/2),
    U_P(G)=max_Q score_P(Q).

The only relaxation is that internal triangles are credited by their available-spoke count, without requiring their rim edges to exist or to be compatible across different apices. Thus U_P need not be attainable.

## 2. Upper bound and exact deletion certificate

For every triangle packing P0 in G, take its boundary portion Q. The internal triangles in cell (a,i) use two distinct spokes each, none already used by Q. Hence

    |P0|<=score_P(Q)<=U_P(G),
    nu(G)<=U_P(G).                                      (1)

Now let S be a set of deleted spokes such that, for every cell (a,i), exactly 2t_(a,i) of its spokes belong to S, with t_(a,i) a nonnegative integer. Take ANY packing in G-S and let Q be its boundary portion. This Q is a boundary packing in the original G and avoids S. The number of internal triangles in cell (a,i) is at most

    floor((n_i-2t_(a,i)-d_Q(a,i))/2)
      =floor((n_i-d_Q(a,i))/2)-t_(a,i).

Summing gives the all-packing certificate

    nu(G-S)<=U_P(G)-sum_(a,i)t_(a,i)
            =U_P(G)-|S|/2.                              (2)

The capacities are nonnegative because Q avoids all deleted spokes. The proof uses no existence of internal matchings, no characterization of maximum packings, and no cover property.

In particular, if u,v are any two distinct vertices of one cluster R_i and a is any apex vertex, then

    nu(G-{au,av})<=U_P(G)-1.                            (3)

Consequently, if nu(G)=U_P(G), deleting ANY such pair lowers nu by at least one. More quantitatively, writing g_P=U_P(G)-nu(G)>=0, equation (2) implies

    nu(G)-nu(G-S)>=|S|/2-g_P.

Thus every two-edge-resilient graph in this join family necessarily satisfies

    nu(G)<=U_P(G)-1

for EVERY partition P having a cluster of size at least two. This is a necessary condition, not a sufficient criterion for resilience.

## 3. Why this is stronger than the coarse spoke saturation test

The earlier bound U(F,n) in `notes/parity_gadget_constraints.md` fixes a packing A inside F and a set B of F-edges used by two-F-vertex triangles, then permits

    |A|+|B|+sum_a floor((n-deg_B(a))/2).

For a boundary packing Q, let t_a count its one-apex/inter-cluster triangles at a, and put b_a=deg_B(a). Then sum_i d_Q(a,i)=b_a+2t_a. Therefore

    sum_i floor((n_i-d_Q(a,i))/2)
       <=floor((n-b_a)/2)-t_a.

Adding |Q|=|A|+|B|+sum_a t_a yields score_P(Q)<=U(F,n), and hence

    nu(G)<=U_P(G)<=U(F,n).                              (4)

The refined bound retains actual inter-cluster matching and boundary-spoke compatibility, as well as each cluster's parity. It may be strictly below the coarse bound. It also retains the actual assignment of B-type triangles to rim vertices; the earlier resource relaxation did not require a proper edge-color assignment of B to those vertices.

Thus merely arranging nu(G)<U(F,n) does not escape the blocker. If the entire deficit is explained by boundary choices and cluster parity, so that nu(G)=U_P(G), equation (3) still supplies a two-edge blocker. The amount of that coarse deficit is irrelevant. This covers arbitrary finite apex graphs, arbitrary partitions and boundary patterns, and any attained refined deficit; it is not restricted to a one-unit Petersen parity deficit.

No theorem is asserted that dense or high-chromatic clusters always attain U_P. That attainment is exactly what a proposed construction must establish or avoid. In particular, the lemma does not rule out envelopes whose internal rim-edge compatibility has a further genuine deficit that can be rearranged under all two-edge deletions.

## 4. Relation to earlier controls and remaining gap

The earlier Petersen odd-cluster substitution failure involved a deficit below the total-spoke bound that was forced by unchanged boundary parity. The new statement isolates its general mechanism: deleting two spokes in one cell leaves every boundary parity unchanged but lowers that cell's internal capacity by one. Whenever the boundary relaxation is attained, the obstruction follows without a separate analysis of the skeleton or its deficit size.

The local K5-face blocker concerns a different graph family and does not require a triangle-free rim. The present lemma should not be applied to K5-incidence rims: they have old rim triangles. Conversely, the universal TF/non-WKE construction provides no reason for the internal capacity bound here to be attained or unattained.

The credible construction target remains a resilient envelope with internal edge-compatibility loss beyond EVERY relevant attained cluster-boundary relaxation, while retaining the induced parity objective. No such construction or positive global parity-repair mechanism was found. Enlarging a graph census or repeating spoke-only decorations would not settle that missing availability step, so this lane stops at the exact obstruction (2).

## Research entry

2026-11-15, original mission clock retained: reread the exact parity gate, selective resilient-envelope reduction, prior attachment identities, and fixed-apex saturation bound. No H-O2 proof or actual counterexample emerged. Proved a partition-refined capacity/deletion certificate for F join triangle-free R. It eliminates attained boundary-parity deficits of arbitrary size as resilience repairs, including the conceptual escape left by the coarse global spoke bound. The remaining requirement is a genuinely rearrangeable internal compatibility deficit. No finite search or Lean run was performed.
