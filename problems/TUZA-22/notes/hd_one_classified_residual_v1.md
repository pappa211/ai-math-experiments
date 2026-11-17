> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Original H-D with one classified residual — frozen v1

TUZA-22 restoration role, 2026-11-15 UTC. Status: ORDINARY_PROOF_CANDIDATE pending fresh AI review. Explicit transfer theorem; it does not import original H-D conclusions into H-D-CS hypotheses.

## Statement

Let G contain a triangle, let k=nu(G), and assume the **original H-D premises** for every actual triangle S:

    nu(G-E(S))=k-1 and tau(G-E(S))=2k-2.

Assume additionally that for at least one actual triangle T, B(G-E(T)) holds. Then G has a one-/two-edge set lowering its packing number. More precisely:

- if k=1, all actual triangles form a book (one common edge) or a literal K4 triangle component;
- if k>=2, all nonempty actual triangle components are literal K4s, exactly k of them.

Thus the added hypothesis provides a complete H-D classification at this scope. In particular, **universal CS implies original H-D**, because the H-D residual tightness plus CS would classify each residual. This is a conditional implication; CS and unrestricted H-D remain unproved by it.

## Proof

Fix T=abc with H=G-E(T) satisfying B. Put m=k-1. Then nu(H)=m and tau(H)=2m. The three terminal vertices a,b,c are independent in H, and the entire new triangle family N consists of T and its ordinary pages.

Because nu(G)=m+1, any two edge-disjoint new pages would contradict packing maximality: in each old block their full old footprint is a star of at most two edges, since a,b,c are independent. K4 star and K5 two-edge avoidance append both to a maximum H-packing. Therefore all pages pairwise intersect. As in R1, the full new family N is either a book on one edge of T or exactly the four triangles of a K4 on abc and one outside apex x. In either case N has a two-edge cover.

If m=0, H has no triangles, so N is the full triangle family of G. A book has a common-edge packing blocker; a K4 has an opposite-edge-pair packing blocker. This proves k=1.

Assume m>=1. First, H has **no K5 triangle component**. If Q were such a component, choose any of its triangles S. Deleting S's three edges leaves a three-page book in Q, whose covering number is1 rather than4. All other old components are unchanged, so tau(H-E(S))=2m-3. Add a two-edge cover of N (discard any deleted cover edge if necessary; deletion cannot create triangles). This gives

    tau(G-E(S)) <= (2m-3)+2 = 2m-1,

contrary to the original H-D requirement 2m. Therefore every old component is K4.

Next, N cannot be a book. Choose a triangle S in any old K4 component, which exists because m>=1. Deleting S destroys all triangles of that old component, so tau(H-E(S))=2m-2. A book has a one-edge cover, giving tau(G-E(S))<=2m-1, again contrary to H-D.

Thus N is exactly a K4 on abc x. Suppose one of its old spokes, say ax, is supported in H. It lies in an old K4 component. Choose an old triangle S containing ax. Deleting S destroys that entire old component's triangles, leaving old cover number2m-2. It also deletes ax from the new K4; the surviving new triangles are covered by the opposite edge bc. Therefore

    tau(G-E(S)) <= (2m-2)+1 = 2m-1,

again a contradiction. The edge bc is restored, not an old H edge, so it survives deletion of S. Any additional destroyed new triangle only improves this bound.

Hence all three new K4 spokes are background edges in H. The new K4 has edge support disjoint from all old triangle support, and there are no other new triangles. The old components are all K4s and exactly one new K4 component is added. Their number is m+1=k. Deleting two opposite edges in any one component lowers total packing by one, by component additivity. QED.

## Conditional transfer to original H-D

Suppose universal CS. In any G satisfying original H-D, every triangle residual has nu=k-1,tau=2k-2=2nu. Apply CS to that residual to get B. The theorem above then gives an H-D blocker. Every hypothesis transfer is explicit; no minimum-CS hypothesis is silently substituted for the original universal triangle-deletion premises.

## Inputs and limits

Inputs are elementary actual-clique parameters/avoidance, component additivity, and the independent-terminal two-page footprint argument already used in reviewed R1. No sparse-class theorem, finite census, or unproved all-size equality classification is used in the first theorem.

This does not prove that a graph satisfying original H-D has a classified residual without extra hypotheses. It also does not prove H-D-CS-min or H-D-CS-broad: a minimum CS failure has defect-one triangle residuals after R1, whereas original H-D requires tight triangle residuals.
