> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A triangle-free WKE residual cannot retain an equally large matching

Frozen ordinary proof candidate for fresh adversarial review, coordinator, 2026-11-16 UTC. No finite enumeration is a premise.

## Exact statement

In a global or edge-subgraph-hereditary class minimum-CS failure, let L be a nonempty closed link at h and let P,Q be WKE, with |P|=r and Q a vertex cover of R=L-P of size at most r. If R is triangle-free, then

    nu_match(R)<=r-1.

In particular R cannot be bipartite: the accepted residual-cover invariance gives vc(R)=r, and ordinary bipartite matching-cover equality would give nu_match(R)=r. The conclusion is conditional on an actual WKE tuple. It asserts neither existence of such a tuple nor exclusion of all triangle-free nonbipartite residuals.

## 1. An equally large residual matching eliminates every outside page

Use the accepted whole-cone interface coordinator_triangle_free_WKE_residual_interface_v1.md. Let A=h+L be the literal cone, and let K be the balanced deletion residual. Then nu(A)=r. Every P base f having a page with apex outside N_G(h) satisfies nu(A-f)<=r-1, with the complete old-block footprint proved there.

Suppose R has a matching N of size r. Its hub triangles give an r-packing of A-f for EVERY f in P, because N is disjoint from P. Hence no P base has an outside page.

Every triangle lost in forming K therefore belongs to A. If A were a proper edge subgraph of G, proper-subgraph CS and the cover union would force tau(A)=2r and B(A). The connected link makes all A triangles one component, so A is K4 or K5, contrary to minimum-CS closed-link robustness. Thus

    G=A=h+L, and nu(G)=r.                                (1)

No induction on A is used after this equality; the rest is direct local reasoning.

## 2. P is perfect and every base has a rim page

If u in L is unmatched by P, all its L-neighbors are its R-neighbors. Since R is triangle-free, these vertices have no R edge among them; their induced L graph is a matching, a subgraph of P. The WHOLE G-link at u is the cone with apex h over that matching (including any isolated vertices). It is connected because h is adjacent to every vertex. Deleting h leaves a forest, contradicting the accepted ordinary apex-forest closed-link exclusion. Therefore P is perfect in L, and |V(L)|=2r. The matching N in R is perfect as well.

Fix any P edge uu'. Minimum-CS codegree at least two supplies a triangle on uu' other than huu'. By (1) its third vertex lies in L. Since P is a matching, the two other edges belong to R. Thus the common R-neighbor set

    W=N_R(u) intersect N_R(u')

is nonempty.

Every perfect matching N0 of R must meet EVERY actual L triangle. Otherwise its r hub triangles together with that rim triangle form r+1 disjoint triangles in G. In particular, for every v in W, N0 must use uv or u'v. Hence every perfect R matching assigns every vertex of W into the two-element set {u,u'}, so

    1<=|W|<=2.                                         (2)

## 3. Exact form of another closed link

Put D=N_R(u). The whole G-link J at u has vertex set {h,u'} union D. Its edges are precisely:

- every edge from h to u' or D;
- the edges u'v for v in W;
- the P edges with both endpoints in D.

There are no R edges within D because R is triangle-free. This description counts every actual link edge. The graph J is connected. Every vertex in D minus W must have its P mate in D, since otherwise it would have only neighbor h in J, contradicting minimum link degree two.

If |W|=1, the only possible branch vertices of J are h and its one W vertex; u' has degree two and every other D vertex has degree two. The accepted ordinary at-most-three-branch exclusion gives a contradiction.

Suppose W={v,w}. Every perfect R matching matches {u,u'} exactly to {v,w}. The four cross edges are all present, so switching those two matching edges reverses the assignments while preserving a perfect R matching.

If v,w are NOT P mates, neither can have its P mate in D. For example, if v has P mate z in D with z!=w, then uvz is an actual L triangle. Choose a perfect R matching assigning u to w and u' to v by the preceding switch. It avoids uv and uz (u is already matched to w), and it avoids vz because that is in P. Thus it avoids this whole rim triangle, contradicting (1). The argument for w is identical. Consequently v,w have degree two in J; only h,u' can branch. The ordinary at-most-three-branch exclusion again contradicts J.

It remains that v,w ARE P mates. Then u',v,w induce a triangle, and D minus {v,w} is a disjoint union of P edges. Therefore

    J = h joined to (K3 disjoint t K2)                  (3)

for some t>=0. If t=0, J is K4 and closed-link robustness excludes it.

If t>=1, choose a matching M consisting of ONE edge of that K3 and all t K2 edges. Let c be the middle vertex of the residual two-edge K3 path. The set {h,c} covers J-M, so |Q0|=2<=|M|=t+1 is WKE. If t>=2 the tuple is strict and immediately contradicts CS equality. If t=1, balanced deletion supplies literal B blocks, but the vertices h and that K3 induce a diamond after its chosen M edge is deleted. Its two triangles share an edge, so they must belong to a single literal K4/K5 block, which would require the deleted edge. This is impossible. This same diamond argument would also apply whenever the tuple were balanced.

All cases contradict the assumed r-matching in R. This proves the stated exclusion.

## Dependencies and limits

The proof uses the independently reviewed whole-cone TF-residual interface, ordinary apex-forest exclusion, ordinary at-most-three-branch exclusion, elementary diamond incompatibility with B, and authenticated class-local robustness/codegree/minimum-link-degree. It uses neither the four-branch finite interface, the374-state apex-unicyclic interface, Gallai–Edmonds nor Kotzig. Bipartite matching-cover equality is needed only for the displayed bipartite corollary. The general surviving WKE case with triangle-free R and vc(R)>nu_match(R) remains open.
