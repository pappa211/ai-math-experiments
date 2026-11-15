# Frozen Track B addendum 3: exact minimum-cover-safe K4-ear reduction

Joint coordinator/scout deduction, 4 November2026. This is an ordinary graph-theoretic transfer for the literal AC statement. It has no Aharoni, HNS, unrestricted equality, or solver dependency. No global availability or historical originality claim.

## Exact construction and hypotheses

Start with a finite simple graph H, an actual edge e=uv, and X subset V(H) such that L=H[X] is triangle-free. Assume H is rainbow triangle-edge-3-colourable when membership in the AC class is required. Add two fresh vertices a,b, BOTH OUTSIDE X, with exactly the five new edges ua,ub,va,vb,ab. Thus Q={u,v,a,b} induces a K4. Call the enlarged remainder H'. The new vertices have no other neighbors.

Let G=H+z with N_G(z)=X and G'=H'+z with the SAME apex neighborhood X. Put J=H-e, L_J=J[X]=L-e (when e is not a link edge, this deletion does nothing), and R=J+z=G-e. H' and J are eligible AC remainders: J inherits H's colouring, while H' extends it by coloring ab as e and coloring the opposite spoke pairs with the two remaining colours. Every actual new triangle is a Q face, and all are rainbow. The induced link for H' is still L because a,b are outside X; L_J remains triangle-free.

The inverse operation applies to any pair a,b outside X satisfying

    N_H'(a)={u,v,b},  N_H'(b)={u,v,a},  uv in E(H').

Remove a,b and edge uv to obtain J. Other old vertices and all X vertices are retained. This accounts for every boundary edge and every newly created triangle.

## Exact packing identities

    nu(H')=nu(H)+1,  nu(G')=nu(G)+1.

For either old ambient graph (H or G), all new triangles are the four Q faces. Any two Q faces share an edge, so a packing uses at most one new triangle and at most the old maximum number of old triangles. Conversely a maximum old packing appends the new face uab, which uses only new edges and avoids the sole old Q edge uv. This proves both equalities. The equality for G' uses the condition that z has no edge to a or b; otherwise extra apex triangles would invalidate the classification.

## Exact minimum-cover normalization

    tau(H')=tau(J)+2.

Given ANY H' triangle cover C, its old J-edge part K=C intersect E(J) covers every J triangle. If e is absent from C, the four Q faces require at least two private Q edges: a single private edge lies in only two faces. Replace ALL private Q edges by {e,ab}. This does not increase cardinality and cannot uncover an old triangle, while e and ab cover all Q faces. If e is already in C, replace all private Q edges by {ab}; at least one private edge was necessary to cover the two faces avoiding e. Again cardinality does not increase. In both cases the normalized cover is exactly

    K union {e,ab}.

Its size is |K|+2>=tau(J)+2. Conversely every J cover K lifts by these two edges: old H triangles not in J contain e, and all new Q faces meet e or ab. Thus the displayed cover identity holds, and a normalized MINIMUM H' cover restricts to a MINIMUM J cover.

This is stronger than a scalar cover bound: it specifies a normalization available for every minimum cover and retains the residual link objective in the correct direction.

## Exact lambda identity, both directions

Let lambda(A,B) denote the least vc(B-C) over minimum triangle-edge covers C of A. Then

    lambda(H',L)=lambda(J,L_J).

For the first inequality, take a minimum J cover K attaining lambda(J,L_J). Its lift K union {e,ab} is minimum in H', and

    L-(K union {e,ab})=L_J-K,

because ab is outside L. Hence lambda(H',L)<=lambda(J,L_J).

For the converse, take a minimum H' cover C attaining lambda(H',L) and normalize it as above. The only newly added OLD edge is e; removed private edges have endpoints outside X and are not in L. Normalization therefore only deletes more link edges and cannot increase the residual vertex-cover number. Its J part K is minimum. Consequently

    lambda(J,L_J)<=vc(L_J-K)<=vc(L-C)=lambda(H',L).

Together the inequalities prove equality. This argument does not replace a minimum-cover quantifier by an arbitrary-cover quantifier, and does not assume minimum covers have an exchange property.

## Counterexample-preserving AC reduction

If AC holds for the smaller pair (J,X), then

    tau(H')+lambda(H',L)
      =tau(J)+lambda(J,L_J)+2
      <=2nu(R)+2
      <=2nu(G)+2=2nu(G').

Thus AC holds for (H',X). Equivalently, failure of AC for (H',X) implies failure for (J,X). This is a genuine counterexample-preserving transformation for AC, which may decrease its packing number and preserves the relevant minimum-cover objective exactly.

The operation strictly reduces graph size: it removes two vertices and the six K4 edges relative to J, so |V|+|E| decreases. It may be repeated whenever the explicitly stated configuration exists. A smallest AC counterexample therefore contains no such K4 ear with its two degree-three private vertices outside X. This is a restriction on minimal AC counterexamples, not on the distinct edge-minimal Tuza counterexample object unless a separate implication is stated.

## What is new within this mission, and what remains

The scalar K4 edge-gluing packing/cover accounting is elementary and overlaps familiar local-reduction methods. The useful explicit addition here is the minimum-cover normalization and exact lambda identity, which validate this particular compression for the frozen AC target with arbitrary old incidence and an unchanged apex neighborhood. Historical originality is UNESTABLISHED.

No theorem supplies such an ear in every eligible H or every hypothetical minimal Tuza counterexample. Dense graphs and triangle-free-linked remainders can lack the pair entirely. This operation is a rigorously safe simplification and obstruction to attachment-based counterexample constructions; it is not a complete reduction system or a solution to AC. In particular the packing-edge-stable slack-one first-frontier remainder can remain after all available ears are removed.

Evidence: PROVED_ORDINARY. Finite identity checks, if run, are supplemental. New Lean NOT_RUN; independent_final_verification NOT_RUN. Fresh internal AI criticism is separate from a commissioned final audit.
