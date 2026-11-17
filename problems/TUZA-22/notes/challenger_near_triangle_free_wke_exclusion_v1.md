> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Every WKE closed link with a triangle-free vertex deletion is excluded

Status: ORDINARY_PROOF_CANDIDATE_USING_DECLARED_LOCAL_INPUTS, frozen for fresh review. Challenger's ordinary matching-two boundary proof, combined with restoration's simultaneous-cover collapse, 2026-11-16 UTC. No general matching-structure theorem, finite census or Kotzig premise is used.

## Theorem

Let L be a closed link component in a global or hereditary-class minimum combined-CS failure. If some vertex w has L-w triangle-free, then L is NOT WKE.

Equivalently, a closed link with a triangle-free vertex deletion and a WKE certificate is excluded. This does not assert that every graph with a triangle-free vertex deletion is WKE.

The term triangle-free is exact: the deletion need not be bipartite.

## 1. The accepted simultaneous-cover reduction leaves matching number at most two

The independently reviewed near_bipartite_wke_cover_collapse_v1.md proves that such a link admits no WKE tuple of size at least3, and no tuple of size at least2 leaving w unmatched. Its complete support audit places every unsupported surviving F-edge in at most the star at the matched neighbor z of w. Since each residual clique block contains at most one F-edge, all supported F-edges can be placed in a minimum residual cover simultaneously. Only the hub spokes to {w,z}, or {w} in the unmatched case, need be added.

The same note proves that a WKE tuple in a surviving link must be maximum: a larger matching contributes at most one old edge per residual block, so it can append after avoiding those edges. Therefore if L were WKE, its ordinary graph matching number would be at most2.

We close that small matching-number boundary by the following elementary lemma.

## 2. Connected minimum-degree-two graphs with matching number two

**Lemma.** Let X be a connected finite simple graph with minimum degree at least2, order n>=6, and matching number2. Then X is K_(2,n-2), possibly with the additional edge joining the two vertices in its size-two part.

Fix a maximum matching {ab,cd}, and let U consist of the remaining n-4 vertices. It is independent, or an edge within U would enlarge the matching to3. Every u in U has at least two neighbors among {a,b,c,d}.

For any distinct u,v in U, their incident edges cannot match them to distinct endpoints a,b: those two edges together with cd would give a three-matching. The analogous prohibition holds for c,d.

Suppose some u sees both a,b. Every other v in U must avoid a,b by that prohibition, and must therefore see both c,d. The same prohibition then forces u to avoid c,d. If U has at least three vertices, two vertices other than u can be matched to c,d, together with ab, contradiction. Hence U={u,v} and n=6. The graph consists of the two triangles abu and cdv, with possible edges between them. Connectedness forces a cross edge; that edge together with the opposite edge inside each of the two triangles is a three-matching, contradiction.

Thus no U vertex sees both endpoints of either matched edge. Minimum degree now forces each U vertex to see exactly one endpoint of ab and one endpoint of cd. For two different U vertices, the same prohibition forces those choices to agree. Relabeling if necessary, every U vertex has neighbor set exactly {a,c}.

If bd were an edge, choose distinct u,v in U; edges au,cv,bd would form a three-matching. Hence bd is absent. All vertices outside {a,c} are consequently independent, so {a,c} is a vertex cover. Minimum degree2 forces b and d also to be adjacent to both a and c. This is precisely the complete bipartite K_(2,n-2), with ac optional. QED.

For completeness, a connected graph of minimum degree2 and matching number1 is K3. Choose an edge ab. Every other edge meets it. Any third vertex must have both a,b as neighbors to have degree at least2, producing a triangle; a fourth vertex would then provide an edge disjoint from the opposite edge of that triangle. Matching number0 is incompatible with minimum degree2.

## 3. Apply the boundary classification to the actual link

Authenticated class-local codegree and robustness give delta(L)>=2 and |V(L)|>=5. The preceding observation excludes matching number at most1.

If |V(L)|>=6, the lemma gives K_(2,n-2) with an optional edge on its size-two side. Deleting either vertex of that side leaves a star, hence a forest. The accepted ordinary apex-forest closed-link exclusion (perfect and nonperfect v2 branches) now contradicts minimum CS. This uses neither triangle-free WKE/Kotzig nor a finite table.

If |V(L)|=5, the hypothesis L-w triangle-free implies L is K4-free: a K4 containing w would leave a triangle, and a K4 not containing w already contains a triangle in L-w. Every K4-free five-vertex graph is3-colorable. To see this, if it has a vertex of degree at most2, three-color its K4-free four-vertex deletion and extend; otherwise its complement is a matching. Zero or one missing edge leaves a K4, while two missing independent edges give K_(2,2,1), which is3-colorable.

The pinned historical local proof sources/public/papers/tuza-five-degenerate/main.md Section5 excludes every3-colorable FIVE-VERTEX CLOSED LINK COMPONENT. Its reduction scope, including all outside pages, is class-local and does not require ambient five-degeneracy or that the hub has only one link component. The full W5=K_(2,2,1) case was freshly reconstructed in challenger_apex_cycle_full_review.md; the other seven types are the explicit ordinary matching/cover and footprint cases in the authenticated pinned Section5. Thus this final small case is excluded as well.

All possibilities contradict WKE, proving the theorem. QED.

## Scope and dependencies

The new matching-two classification is ordinary and self-contained. The assembled exclusion uses:

- near_bipartite_wke_cover_collapse_v1.md, SHAaec8d88dba77cc18895810e77ad27a626722ac68d381073709959ea851043fb3;
- accepted apex_forest_perfect_link_exclusion_v2.md and apex_forest_nonperfect_branch_v2.md;
- pinned sources/public/papers/tuza-five-degenerate/main.md, SHA6f89ec20ce3d954a5912cd19e5e2156fbcab87460bdc6eeb4d09b9bcdc55d59f, class-local robustness/codegree/clique facts and complete ordinary five-vertex Section5 cases.

No Gallai--Edmonds, Kotzig, finite WKE census, new solver run or unrestricted WKE availability is used. The proof removes the matching-number-two boundary from the simultaneous-cover theorem, and applies to arbitrary order and arbitrary outside attachments at the exact stated premise.
