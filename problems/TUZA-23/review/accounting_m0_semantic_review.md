> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent semantic audit: page accounting and class-independent M0

Verdict: ACCEPT the reviewed statements and mathematical source reasoning of PageAssembly, InsertionAccounting, BarePages and M0 at the exact scopes below. Source hashes are fixed in accounting_m0_review_hashes.json. This reviewer did not run Lean/Lake; development compilation is coordinator/contributor evidence, and final independent clean build and axiom audit remain pending.

## PageAssembly

The three-vertex extraction is exact: a triangle containing distinct a,b has exactly one other vertex. old_edge_of_single_insertion proves any actual inserted-graph edge different from the inserted unordered pair was already old. Therefore single_new_triangle_is_page obtains both old spokes, rather than allowing a second inserted spoke accidentally.

min_cover_all_nonbare_pages composes the ALL-page spoke footprint with simultaneous block cover choice. Its single C covers old triangles, has exact old tau, lies in old triangle support, and for EVERY actual triangle after one insertion either meets it or proves its entire edge family disjoint from old support. Old triangles go into the covered branch; a supported new triangle edge cannot be the absent base, so it must be a spoke in the prescribed footprint. This is the required global simultaneous cover, not a separately chosen cover per page. Bare is support disjointness, which is equivalent here to both old spokes being background because the inserted base is absent in H.

## InsertionAccounting

independent_nonedge correctly supplies independence of a size-two absent actual edge, including looplessness. insertion_packing_gain has no cardinality bound on F; this stronger helper is valid. Any new actual triangle contains an inserted old nonedge, and one_triangle_augmentation needs only that independent terminal pair, actual triangle, old B and H<=G. Other inserted edges do not invalidate the old-block avoidance argument.

tight_two_insertion_increment uses that gain, exact old B equality, and the F.card cover extension. Under card F<=2 and augmented equality it proves simultaneously F.card=2, nu increment exactly one, and tau increment exactly two. It does not silently assume two distinct edges in a singleton case. B_of_no_new_triangle uses equality of the entire triangle families, so arbitrary added background edges do not affect B. r2_at_most_one is the genuine zero/singleton equality-restoration corollary, not full R2.

## BarePages

triangle_pair_insertion_cases keeps two-new-edge triangles in the branch hit by f; no assumption of ordinary-page completeness is made prematurely. tight_pair_bare_page uses the exact forced tau value, old B and the first absent pair. If no bare page exists, the simultaneous old cover plus f covers every actual triangle, including any two-new-edge triangle. The cardinality contradiction is valid even if insertion degenerates; its hypotheses then simply cannot hold.

max_packing_avoids_single_page is quantified over any size-three vertex set containing an old nonedge. It need not already be an actual graph triangle because old-block geometry alone provides avoidance. page_intersects_bare applies that helper to an actual G triangle and then appends a bare actual G triangle. The proof obtains edge-disjoint unions and exact cardinality increase twice, so it does not confuse maximality with maximum cardinality. Its quantification is stronger than the needed ordinary-page case and includes EVERY first triangle and EVERY bare second triangle. Background edges never become old-packing resources.

## M0: exact semantics and connectedness

TriangleClosed means an actual triangle subfamily closed under actual shared-edge adjacency. supportGraph retains exactly supported actual G edges. triangles_supportGraph proves its complete actual triangle family equals F. This is essential: the code does not assume a chosen subfamily automatically remains exhaustive. Any new triangle of the restriction shares one supported edge with F and closure puts it in F.

Closed complements are closed, and their triangle supports are disjoint. closed_connected_restrict proves every entire shared-edge path starting in F remains in F and exists inside its support graph. closed_component_preserved consequently identifies actual components, not just cardinalities. good_of_closed_split uses exact additive nu/tau, proves tightness of EACH side before invoking its equality classification, and then transports literal component supports to G. There is no use of equality classification before tightness.

supportGraph_strict_of_triangle_outside exhibits an actual omitted edge via a triangle outside F. minimal_triangle_connected applies proper-subgraph Good separately to a component and its nonempty complement, then contradicts a failure of Good. Its conclusion explicitly connects every pair of actual triangles under TriangleConnected. This is the stronger requested shared-edge notion, not ordinary vertex connectivity of the support.

MinimalCS states not CS G and CS H for every strict graph-edge subgraph H<G on the SAME finite vertex type. edgeCount_lt_of_lt and minimalCS_iff_minimalObstruction connect this to the existing finite edge-count notion. exists_minimal_cs uses natural-number edge minimization, not a global well-order of graph types. The hereditary-class variant explicitly requires downward closure and retains all subgraphs on that type; vertex omission is represented by isolates. This is sufficient for the intended class-local uses.

minimal_cs_package proves nonempty triangle family, pairwise shared-edge connectivity, every actual edge supported, tightness, and exact one-edge deletion identities. Nonemptiness is established before selecting a witness edge for tightness. The package's sole mathematical high-level premise is MinimalCS; the proper-subgraph CS premise remains visible. It is therefore a complete conditional reduction at its advertised scope, not universal CS. Its import is GraphAPI, whose used foundations are the authenticated public Critical/MinimalObstruction/component facts; no TUZA-23 R2 or new whole-footprint axiom is assumed. No degree/sparsity assumption is imported.

## Limits

No source correction was exposed by this audit. These results do not complete adjacent/disjoint R2 geometry, prove universal CS, or supply an unrestricted blocker. Final exported theorem types and axiom closures must still be inspected from freshly rebuilt artifacts. Stronger helper scopes are mathematically justified above; they are not implicit promises that a full R2 theorem already exists.
