> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent critic: wheel restoration and codegree consequence

**PASS for the direct strict-restoration theorem with arbitrary triangle-free background.** The corresponding codegree-two corollary follows from the declared archived classification and the minimum-CS residual profile, with the external-input boundary retained. Neither a classification of all residuals nor a novelty claim follows.

Reviewed frozen note: `notes/residual_wheel_restoration.md`, SHA-256 `9c2bf84ccff14048c225d97684ad958d4640be7a97f90329cf398fbda232f118`. I also read the snapshotted ordinary C6-or-ineligible-spokes argument and reconstructed its page classification below, rather than accepting it as an opaque theorem. The direct W5/K5-e proof requires no numerical search, external matching theorem, or Lean premise.

## Values, eligibility, and the six-edge footprint

For the wheel with C5 rim, every actual supported triangle is the hub plus a rim edge. Edge-disjoint triangle packings correspond exactly to rim matchings, giving nu=2. A cover edge meets at most two of the five triangles, so tau>=3; the three alternating listed spokes cover all five, giving tau=3. Rotating a three-spoke cover includes any prescribed spoke. A prescribed rim edge i(i+1), together with spokes at i+2 and i+4, covers all five triangles. Thus every supported edge occurs in some minimum cover. Triangle-free background edges cannot lower this minimum or contribute to a packing.

For literal K5-e, the support has nine edges and seven actual triangles. Every edge belongs to at most three triangles, so two cover edges cannot suffice. The central triangle covers all seven. The stated three-edge covers through any spoke are also valid. Two edge-disjoint triangles exist; three would use all nine edges, but the missing-edge endpoints have odd degree three, whereas a union of edge-disjoint triangles has even degrees. Thus nu=2,tau=3 and every supported edge is eligible for a minimum cover.

For three pages on distinct restored bases with distinct outside apices, their old edges form a simple six-cycle whose independent alternating terminals are the restored triangle vertices I. Each terminal has exactly two incident footprint edges, and every footprint edge in the old support touches I.

If the wheel hub belongs to I, no rim vertex does, so the footprint meets the wheel in at most two spokes. Those meet at most four of the five old triangles, leaving one. If the hub does not belong to I, at most two independent rim vertices belong to I. They do not cover all C5 edges; choose a rim edge with neither endpoint in I. Its hub triangle contains no terminal and avoids the entire footprint. This remains true when other terminals or apices lie outside the supported wheel.

For K5-e, an independent terminal set containing a degree-four supported vertex contains no other supported vertex; the four remaining supported vertices contain a triangle. Otherwise the terminals meet the support only in a subset of the missing-edge pair, and the central triangle avoids them. Again an old triangle avoids the footprint. Background spokes never belong to that old triangle.

## Entire new family and strictness

Restoring an independent triple creates only its central triangle and pages on its three restored bases: a triangle with two restored edges must be the central triangle. An outside apex adjacent to two terminals gives one page; adjacency to all three gives three pages. Thus the base/apex incidence graph has right degrees one or three, never two. Pages on distinct bases and distinct apices are edge-disjoint.

If this incidence graph has a three-matching, its three pages append to the old triangle just found, giving four packed triangles. If its matching number is at most two, the complete page classification is elementary:

- Two full apices exclude any third occupied apex, which otherwise matches one base while the full apices match the other two. This is exactly the exceptional seven-triangle K5-e new family.
- With one full apex, singleton apices can occupy only one base; otherwise two singleton pages and the remaining full-apex page form a three-matching. That base plus the opposite full-apex spoke cover the whole new family.
- With no full apex, at most two bases are occupied. Those bases cover the pages and central triangle; if no base is occupied, one restored edge suffices.

This classification counts every actual page, regardless of other background edges or edges between apices. The term "K5-e new family" describes the seven new triangles and their nine-edge support; it does not assume that the ambient graph induced on those five vertices has no further old edges.

Since the old graph has nu=2,tau=3, restoring the triangle gives nu>=3 and tau<=6. A failure of strictness forces nu=3,tau=6. The three-matching branch contradicts nu=3. A two-edge cover of the new family, combined with an old minimum cover, contradicts tau=6.

In the exceptional family, each old spoke occurs in a three-edge cover of the new family. If such a spoke is supported in H, its old-cover eligibility gives two three-edge covers with overlap, yielding a cover of size at most five. Otherwise every exceptional spoke is triangle-free in H. An old maximum two-packing avoids them, and the new family's two-packing appends to it, again giving four triangles. Both branches contradict the forced non-strict values. Therefore the stated strict restoration holds for both old support types, with arbitrary permissible background retained.

## Declared-input codegree-two consequence

I read `sources/residual_codegree/0_codegree_two_defect_one_classification_v1.md` (source SHA-256 `3f47b24d0a9ea5fe6d78500fd26166f4f2a3b301dd14ba8941c5cebf84be7517`) and the snapshotted TUZA-22 status ledger. The ledger classifies this result as **PROOF_USING_DECLARED_INPUT**, citing its coordinator review, with two explicit inputs: Tutte–Berge and Staton's independence bound via Heckman–Thomas. I subsequently read `sources/root_codegree_review/0_coordinator_codegree_two_review.md`: it explicitly accepts the classification with the declared inputs and says their full external proof suites were not newly certified. The original frozen note's candidate header must not be silently mistaken for its later accepted-with-inputs status. No fresh verification of the full proofs of those external theorems was performed here.

The internal reduction is coherent: when every graph edge belongs to at most two actual triangles, the triangle-intersection graph X is subcubic, nu=alpha(X), and tau=|V(X)|-mu(X). A triangle in X closes to an isolated literal K4 component; remaining components are triangle-free subcubic graphs. Tutte–Berge and the displayed odd-component counting argument give mu>=2n/5 at minimum degree two. Together with declared Staton alpha>=5n/14, this gives positive defect at least 4n/35. Exact leaf/isolated-vertex reductions then restrict a connected defect-one component to K1,K2,C5. The note's actual-graph realization of C5 forces the five-wheel; K1 and K2 give K3 and the diamond. I independently checked these internal arithmetic, reduction, and realization steps.

An actual minimum-CS triangle residual has connected nonempty support, defect one, and one-edge packing resilience. Under codegree at most two, the archived classification therefore leaves only wheel support: K3 and diamond have a packing-critical edge. The direct restoration theorem excludes that wheel residual. Hence every such actual residual has an edge in at least three actual residual triangles, conditional on the archived profile and declared-input classification. No two-edge resilience of the residual is assumed or inferred.

**Historical scope:** the snapshotted TUZA-22 ledger already records this high-codegree residual consequence. The archived coordinator review obtains it using its cited minimum-CS packing bound k>=5 and connected residual support, since the classified exceptional component has packing at most two. That historical packing bound was not re-proved in this review. The current direct W5 restoration proof provides another route, but the corollary must not be advertised as newly obtained here. The K5-e restoration case is also expressly archival. The separately cited fresh edge-gluing restoration theorem remains at its exact construction scope; the broader frozen family allowing triangle/K4 overlaps is not covered by this review.

No unrestricted Tuza/CS conclusion or full rigidity classification follows. The remaining gap is availability of a supported residual structure to which a proved restoration theorem applies.
