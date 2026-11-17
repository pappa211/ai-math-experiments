> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Three- and five-crowns are cone configurations

Frozen v1, 2026-11-16. Status: ORDINARY_PROOF_CANDIDATE; fresh review requested. This sharpens the minimum-CS crown interface by actual endpoint closure. It has no Tutte–Berge, Staton, finite-certificate, or cographic-availability premise.

Use the exact crown definition from `notes/crown_balanced_residual_interface_v1.md`: distinct actual edges e1,...,er,f1,...,fr form triangles Ti={ei,fi,e(i+1)} cyclically, and every ei lies in exactly its two displayed triangles. Arbitrary outside triangles may use the fi.

## Three-crown

The three e edges are pairwise incident, and each pair's triangle is completed by an f edge outside their triple. They cannot themselves form a triangle, because a pair's unique completion would be the third e edge. Hence they form a three-edge star, say ab,ac,ad. The f edges are bc,bd,cd. Actual closure gives the fourth K4 face bcd.

The link at a contains the triangle on b,c,d. Each of its vertices has degree exactly two in that entire link, because the corresponding spoke has triangle codegree two. This link triangle is therefore a CLOSED component, regardless of outside triangles on the f edges. The authenticated closed-link robustness condition excludes it in a minimum CS failure.

## Five-crown

The displayed triangles have intersection graph exactly C5: only consecutive indices share an e edge, and all the named edges are distinct. Relabel them as T0=abc, T1=abx, T4=acy around T0. Here x,y are distinct and outside {a,b,c}. Coincidence x=y would make nonconsecutive T1,T4 share ax.

T2 must continue through either ax or bx, and T3 through either ay or cy. They must share an edge, without intersecting any nonconsecutive displayed triangle.

If T2=axz and T3=ayw, forbidden earlier intersections exclude z∈{b,c,y} and w∈{b,c,x}. Edge intersection therefore forces z=w, a new vertex. The five displayed triangles are exactly the triangles through hub a on the rim b,x,z,y,c,b. This is the 5-wheel.

A mixed choice, ax with cy or bx with ay, cannot share two vertices without repeating a displayed triangle or creating a forbidden nonconsecutive intersection. For example, axz and cyw can share an edge only by w=a (repeating acy) or by w=x together with z=c or y (an already forbidden intersection). The reverse mixed case is symmetric.

For the remaining choice T2=bxz,T3=cyw, their disjoint bases force z∈{c,y} and w∈{b,x}. A choice z=c or w=b creates bc in T2 or T3, an extra intersection with T0. Thus only z=y,w=x survives. But then the five displayed triangles together contain all ten edges of K5. Every e edge would consequently lie in at least three actual triangles, contradicting its stipulated codegree two. This excludes the alternative even when arbitrary outside triangles are allowed.

Thus every five-crown is a 5-wheel on its named support. Its shared e edges are precisely the five hub spokes. Their codegree-two condition says that the rim C5 is a CLOSED component of the hub's entire link. Deleting any rim vertex from that component leaves a path. The accepted apex-forest closed-link exclusion (or the stronger accepted link-vertex-deletion cyclic-component theorem) therefore excludes the five-crown in a minimum CS failure.

## Remaining scope

Together with the reviewed four-crown exclusion by two-triangle restoration, every crown in a minimum CS obstruction would have length at least six. This does not prove that any crown exists, nor that longer crowns are cones. The octahedral six-crown and its triangle-face boundary demonstrate why that latter extrapolation would be false. Outside pages on the fi have been retained throughout; the only exact codegree requirement is on the ei.
