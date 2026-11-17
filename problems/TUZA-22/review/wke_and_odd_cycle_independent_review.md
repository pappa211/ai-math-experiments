> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Triangle-free WKE and odd-cycle link exclusions — independent review

Reviewed `notes/triangle_free_wke_link_exclusion_v1.md` and `notes/odd_cycle_link_exclusion_v1.md`; source hashes below. **Verdict: ACCEPT both arguments at their stated scopes.** The odd-cycle theorem is an ordinary proof from the reconstructed internal reduction package. The general WKE theorem and its unique-perfect-matching lemma are **PROOF_USING_DECLARED_INPUT**, with Kotzig's bridge theorem the explicit external input. Neither is Lean verified.

## Primary-source authentication and scope

Puleo's Definition4.1 in [arXiv:1308.2211v3, Section4](https://arxiv.org/html/1308.2211v3#S4) defines WKE by a matching M and a vertex cover Q of the graph after deleting M, with |Q|<=|M|. Lemma4.4 supplies the corresponding edge-reduction for a union of link components. I inspected these precise passages. They establish the inequality reduction and do not by themselves provide the strict combined-CS contradiction now being reviewed. The publisher DOI endpoint was unavailable through the web tool; the primary arXivv3 text was accessible.

Kotzig's input was independently checked in [Nenashev, *A short proof of Kotzig's theorem*, arXiv:1402.0949v1, Theorem1](https://arxiv.org/pdf/1402.0949): a connected graph with a unique perfect matching has a bridge in that matching. Its proof occupies pages1–2. The local primary PDF was inspected and its SHA-256 matches `207d4fdf17085c1452b1881040b131a012f175a0ba4404e8559f29fcb315ad08`. Kotzig's1959 original paper was not separately inspected. No novelty attribution is made for the consequence derived here.

## Unique-perfect-matching lemma

The induction establishing alpha(X-M)>=r+1 for a nonempty graph with unique perfect matching M of size r is correct. In a disconnected graph, every component has its own unique perfect matching, so the inductive independent-set bounds sum to at least r plus the component count. In the connected case, deleting the Kotzig matching bridge uv produces two sides A,B. Because M uses uv, every other matching edge lies wholly in one side, giving unique perfect matchings on A-u and B-v. Each nonempty side remainder has smaller matching size and satisfies the inductive bound. If a remainder is empty, its bridge endpoint alone supplies the required one vertex. The bridge deletion removes every edge between the sides, so the chosen independent sets combine. Their total is(r_A+1)+(r_B+1)=r+1. Taking complements in the2r vertices gives a vertex cover of X-M of size at most r-1.

This remains valid when either remainder is disconnected. Uniqueness of its perfect matching follows by combining any hypothetical alternative with uv and the fixed matching on the other side. The induction never requires the independent set to contain a bridge endpoint when that side remainder is nonempty.

## General triangle-free WKE component

For a closed triangle-free component L of a hub link, codegree at least two gives minimum degree at least two in L. A WKE pair M,Q yields r hub triangles using only deleted spokes and matching rims, and a lost-triangle cover X=M union{vq:q in Q}. Closedness is exactly what ensures that every triangle through a deleted spoke corresponds to a rim edge within L; arbitrary other link components and outside rim pages are retained correctly.

A strict |Q|<r tuple contradicts combined minimality immediately. In the balanced case, the existing accounting gives B(K) and nu(K)=k-r. Because L is triangle-free, any residual literal clique block contains at most two L vertices and hence at most one surviving L edge. Its maximum packing can avoid all surviving L edges simultaneously. This shows the displayed M must be maximum; a larger link matching would otherwise append too many hub triangles.

If another maximum matching M' exists, choose f=ab in M but not M'. Edge codegree supplies a second triangle abx besides vab. Its apex x is outside L because L is triangle-free. The M' hub triangles and abx are edge-disjoint: the hub triangles avoid f, use only L rim endpoints, and x is neither the hub nor an L vertex. Each residual clique contains at most one surviving matching rim and at most one page spoke; both page spokes would require deleted ab. Coexistence with a rim forces a common L endpoint, otherwise the block would contain three L vertices. Thus the full footprint is a star of at most two edges, giving a compatible residual packing and a k+1 contradiction.

If M is the unique maximum matching, it is perfect: an unmatched nonisolated vertex w has a matched neighbor u, and replacing u's matched edge by wu gives a different matching of the same cardinality. Minimum degree excludes isolated unmatched vertices. The reviewed Kotzig-based lemma then supplies a cover of L-M with size at most r-1, which makes the original reduction strict. This closes every branch without assuming that all triangle-free graphs are WKE.

## Direct odd-cycle proof

For C_(2r+1), r>=2, the displayed alternating matching M and r-vertex set Q cover all nonmatching cycle edges. The balanced deletion therefore produces B(K) and nu(K)=k-r. Codegree gives an outside page on rim01. The rotated matching M' avoids01 and has r edges. Its hub triangles plus that outside page are edge-disjoint. A residual clique contains at most two cycle vertices, so at most one matching rim and at most one page spoke; if both occur they are incident. The K4 star/K5 two-edge compatibility supplies the required k+1 packing contradiction.

The formula for Q works at r=2 as well as arbitrary larger r. No unique-matching theorem or census is needed. Closedness of the link component is essential to the lost-triangle cover and is explicitly present; arbitrary incidence outside that closed component is otherwise allowed. The exact cycle must be chordless as stated.

## Remaining global gap

The results exclude precise all-size link classes. They do not prove that every possible minimum CS obstruction contains a triangle-free WKE component, and they say nothing universal about dense triangle-free non-WKE links. Nor does the inequality-only published WKE reduction replace the combined-minimality equality argument. The two evidence labels should remain separate in the main status ledger.

Reviewed notes/triangle_free_wke_link_exclusion_v1.md SHA-256: `32a847bf9d8514b514d7f7f3cee7e193a8387528137ad678697d5a4238763a65`.

Reviewed notes/odd_cycle_link_exclusion_v1.md SHA-256: `c79a96d39cfbcc7723c36b7a60aa9656c190f36b681dc45a187b675d45a8e204`.

Review completed UTC: 2026-11-15T22:32:22.133142+00:00.
