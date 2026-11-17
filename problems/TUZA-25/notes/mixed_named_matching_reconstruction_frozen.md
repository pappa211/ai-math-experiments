> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Named-core matching reconstruction forces a packing gain

Frozen coordinated ordinary proof for fresh review, 2026-11-16. No enumeration or novelty claim is a premise.

## Statement

Let J have every actual triangle in a literal K4. Let A be a literal K4 in J, and M a matching of two opposite A edges. Put R=J-M. Suppose R has exactly one nonempty triangle component, whose literal triangle support D is one of C12 (the ten classified fresh-edge defect-one models, W5, or K5-minus-an-edge). Arbitrary nontriangular background edges and vertices remain allowed.

Form H by adding a vertex x with precisely A as its triangle-supported neighbours, so its actual new triangles are exactly the six x-pages on A. Background edges may be retained but create no other triangles. Assume H has connected triangle support. Then

    nu(H)=nu(J)+1.

In particular this configuration cannot be the zero-gain K5-on-K4 leaf.

## Two elementary properties of the named supports

Every C12 support has a universal support vertex. In the star models use the central star centre; in the two-K5 model use a shared-edge endpoint; use the hub for W5; K5-e has three universal vertices. Consequently an edge between two support vertices is triangular in R (use the hub, unless one endpoint is the hub, in which case it is already a support edge). There are no extra background edges between support vertices.

Every C12 support is induced-C4-free. The fresh-edge models and K5-e are chordal. In W5 any four-cycle through the hub has a chord, while the five-cycle rim has no induced four-cycle.

## External-page confinement

A restored M-page with apex outside A completes to a K4 in J. That K4 cannot contain both M edges, because the four endpoints of M are exactly A. Its surviving K4-minus-one-edge diamond is entirely in R and triangle-supported. All four vertices, and in particular both endpoints of its restored M edge, therefore belong to D. Thus every external M-page stays within D. This is an argument about actual triangles and excludes hidden pages through background-only vertices.

Write I=A intersect V(D).

## Exhaustion by the size of I

If |I|<=1, no old A edge belongs to D and no external M-page exists (each would require two M endpoints in D). Hence the D triangle component shares no graph edge with the new family supported on A union {x}. This contradicts connected triangle support of H.

If |I|=4, the four old A-crossedges belong to D by the universal-vertex property, while the two M edges are absent. They induce a C4 in D, impossible.

If |I|=2 and the two vertices are adjacent along an old A-crossedge f, neither M edge has both endpoints in D, so no external M-page exists. The triangle families are exactly D plus K4[A] in J, and D plus K5[A union {x}] in H, meeting only in f. A maximum K4 packing avoiding f has size one; a maximum K5 packing avoiding f has size two. Triangle-family partition gives the matching upper bounds, so

    nu(J)=nu(D)+1,  nu(H)=nu(D)+2.

If |I|=2 and the two vertices form an M edge e, let L=D+e. External pages on e are exactly those inside L; the other M edge has no external page. The triangle families are L plus K4[A], and L plus K5[A union {x}], respectively, with common edge e. The same exact edge-gluing packing identity gives nu(H)=nu(J)+1. No assertion about the defect of L is needed.

Finally suppose |I|=3. Let e be the unique M edge whose two endpoints lie in I, and put L=D+e. Then I is a literal triangle of L. The fourth A vertex is outside D and can occur in J triangles only in the central A faces, by external-page confinement. Thus J's triangle family is exactly a K4-on-triangle attachment to L, while H's is a K5-on-the-same-triangle attachment to L. For p=nu(L) and b=max_{f in E(I)}nu(L-f), the already proved exact leaf identities give

    nu(J)=max(p,1+b),
    nu(H)=max(p+1,2+b)=nu(J)+1.

This completes all cases.

The edge/triangle gluing identities here concern the exact actual triangle families. Background edges may already exist on the displayed vertices, but the confinement argument shows that they create no omitted triangle. One may compare packing values to the stated support-union graphs while retaining the full background in the original reconstruction record; no background edge is silently discarded from a future restoration problem.

## Tight components may first be peeled without losing K4 completion

More generally, suppose R has the one named active defect-one component D and other tight literal K4/K5 components. Apply the exact marked-edge deletion of `residual_matching_component_confinement.md`: delete only each tight component's nonboundary edges, retaining its unique A-crossedge boundary, all vertices, and all background. Let the resulting graphs be J' and H', and let r be the sum of the removed component packing numbers. Then

    nu(J)=r+nu(J'),  nu(H)=r+nu(H').

The H' identity is the marked-edge theorem. The J' identity follows by applying the same triangle-family partition after removing the four x-spokes; none of the tight components contains x, and each still has a maximum packing avoiding its retained boundary. Hence zero gain passes from J,H to J',H'. The support of R'=J'-M is exactly D; H' has connected triangle support and still contains the entire K5 on A union {x}.

Every actual triangle of J' remains K4-completed. For an old D triangle, take a J K4 completing it. If that K4 uses no M edge, it lies wholly in the same R triangle component D and is retained. If it uses one M edge, its surviving diamond lies in D and all its edges are retained. It cannot use both M edges: that K4 would be A, every face of which contains an M edge and therefore is not an old R triangle. For a restored M-page with external apex, its completing K4 has a surviving D diamond as already proved, so it is retained. For a page with apex in A, the central K4 A itself is retained: every A-crossedge belonging to a tight component is its retained boundary edge, and the other A-crossedges and both M edges are also retained. These cases exhaust J' triangles.

Thus J',H',R' satisfy the preceding named-core theorem. It gives nu(H')=nu(J')+1, contradicting passed zero gain. **Consequently the zero-gain configuration is impossible whenever its unique active R component is named, even if tight components and arbitrary shared/background vertices are present.** No fresh-vertex inference about those tight components is used.

## Exact place in the noncircular proof chain

For a wider-class minimum unknown resilient defect-one graph H, the zero-gain leaf identities and matching-deletion theorem give a smaller resilient defect-one R. Proper CS and component additivity identify its unique active component D; that connected/resilient/defect-one support is strictly smaller than H and is named by the explicitly stated wider-class minimality, not by CS. The tight-component reduction above and the support-intersection cases then contradict zero gain.

This excludes the identified leaf configuration when its predecessor is K4-completed and the stated local region exists. It does not supply that leaf, does not prove frozen-F membership for an arbitrary resilient residual, and does not prove unrestricted CS/Tuza. Those availability/classification obligations remain separate.
