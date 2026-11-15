# A precise resilient-envelope route against H-O2

Status: exact reduction from a new construction target to a counterexample of the auxiliary odd-cover gate H-O2. No envelope satisfying the decisive inequality has been constructed. This is not a Tuza counterexample or proof. The operation builds on packing_critic's selective K5 decoration lemma in notes/codegree_two_tf_resilience_counterexample.md; the new purpose here is to preserve an induced critical cone's odd-cover cost while eliminating criticality as a requirement on the envelope itself.

## Reduction

Let B be a finite simple graph which retains its triangle packing number after deletion of ANY set of at most two edges. Let H=B[U] be an induced subgraph which is edge-cover-critical. Put D=E(B)-E(H), d=|D|. Attach a fresh K5 along every edge of D, using three new vertices private to that edge, and call the graph W.

Then

    nu(W)=nu(B)+2d,
    tau(W)=tau(H)+4d,
    W is edge-cover-critical and two-edge packing-resilient,
    pi(W)=4d+ min_{C odd cover of B} |C intersect E(H)|
          >=4d+pi(H).                                      (1)

If H has a minimum odd cover which is the complement of a vertex cut, equality holds in the last inequality. In particular this applies to EVERY cone H, since its universal-apex triangle equations force all odd covers to be cut complements.

Consequently an edge-cover-critical induced cone H in a resilient B with

    pi(H)>2nu(B)                                            (2)

would, by this explicit operation, give a counterexample W to H-O2. Its ordinary Tuza status would still require separate evaluation; a parity-gate counterexample is not itself a Tuza counterexample.

## Complete proof of the reduction

Every actual triangle is either an old B-triangle or wholly in one attached K5. A fresh vertex has no other neighbors, so there is no omitted crossing triangle. The H edge set and the complete K5 edge sets partition E(W). Moreover, every B-triangle outside H has at least two edges in D: if two edges belonged to induced H, all three vertices would be in U and the third edge would also belong to H.

Each K5 requires four cover edges. Thus any cover costs at least tau(H)+4d. Choose a minimum H-cover and, in each K5, a minimum four-cover containing its root edge. All outside B-triangles have at least two selected roots, so this is a cover attaining the lower bound.

Every H-edge can occur in a minimum H-cover by H-criticality. Every specified edge of an attached K5 can occur in a local minimum four-cover. If this choice omits its root, all other roots remain selected, so every outside B-triangle through the omitted root still has another selected root. This yields a global minimum cover containing any prescribed W-edge, proving cover-criticality. This part requires only criticality of H, not TF.

A packing uses at most nu(B) old triangles and two per K5. Conversely, a maximum B-packing extends by choosing two triangles in every K5 avoiding its root. Thus the packing identity holds.

After an arbitrary set S of at most two edge deletions, reserve in B the root of every affected K5, together with every deleted H-edge. This is a set R of at most two B-edges. Take a maximum B-packing avoiding R. Every affected K5 has a two-packing avoiding its locally deleted edges, and its root is available because the B-packing avoided it. Every unaffected K5 uses a two-packing avoiding its root. These are pairwise edge-disjoint and retain nu(B)+2d triangles. This proves resilience for all deletion locations.

Finally, prescribe an odd-cover vector x on B. In each attached K5 both root states occur in minimum odd four-covers (balanced 2+3 cut complements). With root value x_e the new edges therefore cost 4-x_e, cancelling the cost of the decorated root. Summing gives the exact weighted expression in (1). Conversely every W odd cover restricts to an odd B-cover and costs at least four on each attached K5, so equality in that expression is exact. Restriction to H proves the lower bound. If an optimal odd H-cover comes from vertex colors, extend those colors arbitrarily to all B vertices; the resulting B cut complement restricts to that optimum, proving equality.

## Why this targets a different missing condition

The earlier all-edge decoration erased every original parity weight and preserved every old packing blocker. Here only edges OUTSIDE induced H are decorated, so the objective on H survives. Resilience is supplied by the envelope B before decoration; it is not claimed to arise from edge decorations themselves.

The previously proved critical-cone family has pi(H)/|V(H)| unbounded. Thus an envelope construction whose packing cost is O(|V(H)|), with an absolute constant, would suffice for an asymptotic H-O2 refutation. A complete-graph envelope costs quadratically many triangles and does not automatically meet (2). Dense fixed-apex joins usually attain their spoke resource upper bounds and consequently fail resilience. Neither is a solution.

## Failed standard Petersen substitution target

A natural attempt replaces vertices of the Petersen rim by odd triangle-free clusters, retaining exactly its three boundary edges per cluster, and takes K2 join of the resulting rim R'. The parity obstruction to two disjoint perfect matchings survives: if both matching colors saturate every odd cluster, each color crosses its three-edge boundary oddly, forcing one edge of each color at every contracted Petersen vertex. This would give two disjoint Petersen perfect matchings, impossible.

This can create a one-unit deficit below the even-order rim's spoke bound, but it does not supply resilience. Precisely, suppose |V(R')|=n' is even and the join has nu=n'-1. Delete two spokes at the SAME apex at two vertices inside ONE cluster. To retain n'-1 triangles, all 2n'-2 remaining spokes must be used. A triangle using the apex edge ab is impossible in such a saturated packing, because each apex has an even number of remaining spokes and one such triangle would leave odd counts for its matching triangles. Thus two matching colors must saturate the remaining tokens. The affected odd cluster loses two vertices for one color, so its parity remains odd for BOTH colors; all other clusters also remain odd. Contraction again forces two disjoint Petersen perfect matchings. Hence the target packing cannot survive.

This rules out the stated one-defect substitution target when a cluster contains two eligible vertices. It does not rule out envelopes with a larger packing deficit, other interfaces, or unrelated resilient bases. No general existence or nonexistence theorem for (2) has been proved.

Verification level: ordinary reconstruction based on the already explicit K5 local facts and exhaustive triangle ownership. No computation, Lean job, independent fresh review, or originality claim is attached to this new reduction at the time of writing.

## Exact obstruction for selective K5 triangle pages on a cone

Let H=cone(R), with R triangle-free and apex a. Choose ANY set F of rim edges. For each e=uv in F attach a K5 on {a,u,v,d_e,e_e}, where the two new vertices are private to that page. Use at most one page per chosen rim edge. Call this prospective envelope B. Pages may share original apex spokes, and all original H vertices and edges remain induced.

Every actual triangle is either an original apex triangle or belongs to one page; fresh vertices have neighbors only in their own K5. For ANY set U of rim vertices, delete the corresponding original spokes {av:v in U}. Then the exact identity is

    nu(B-{av:v in U})=2|F|+mu((R-F)-U).                    (3)

For the upper bound, old triangles in a packing correspond to a matching N of R-U. A page has at most two triangles. If its original apex triangle is in the old packing, all three base edges are already used, leaving the page at most one triangle (all triangles avoiding the base edges share the private-pair edge). Thus the total packing size is at most

    |N|+2|F|-|N intersect F|
      =2|F|+|N-F| <=2|F|+mu((R-F)-U).

For equality, choose a maximum matching of (R-F)-U. For each decorated rim edge uv take the two page triangles

    u v d_e,   a d_e e_e.

They use the unique decorated rim edge uv and private edges, but NO original apex spoke. Hence they avoid all the specified spoke deletions, do not conflict with the old matching triangles, and do not conflict across pages. This attains (3).

In particular, if xy is ANY residual rim edge outside F, ordinary matching augmentation gives

    mu((R-F)-{x,y}) <= mu(R-F)-1.

Equation(3) then exhibits the two-spoke packing blocker {ax,ay}. Therefore this entire arbitrary-subset triangle-page construction can be two-edge-resilient only when F contains EVERY rim edge. The conclusion is not merely that some natural packing saturates a bound; it is an exact optimum identity for every deleted-spoke state.

Covering every rim edge uses |E(R)| pages, so it does not supply the desired linear-in-vertices envelope for the dense critical-cone obstruction. In that full-coverage case it also lies in the already closed K5 triangle-page family of notes/parity_k5_triangle_overlap.md, which satisfies pi<=2nu. This proof closes the unselected-base-edge escape for this particular cone construction. It does not cover repeated pages on the same base, pages based on other new triangles, or non-cone cores.
