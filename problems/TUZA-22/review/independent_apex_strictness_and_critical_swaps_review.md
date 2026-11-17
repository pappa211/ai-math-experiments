> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent-apex strictness and critical swap identities — fresh review

**ACCEPT both notes at their exact hypotheses.** The first is an ordinary packing theorem; the second is an exact reformulation and explicit unfinished dichotomy. Neither asserts availability in arbitrary minimum obstructions.

## Universal independent apices

The star-cover swap remains valid for all actual triangles, including those internal to A, because an internal triangle through the swapped vertex retains its opposite edge. Complete cross adjacency makes the replacement cost exactly b, so every A-degree is at most b. Nonempty C then forces b>=1.

Sequentially coloring an A-edge avoids at most2b-2 colors used at its endpoints, proving the stated2b-1-color bound without invoking a stronger edge-coloring theorem. The b largest classes contain at least the stated fraction of all m edges. Assigning these matching classes to different universal apices gives actual private triangles, disjoint within each class because their bases form a matching and across classes because both bases and apex spokes differ. The integral ceiling and strict ratio follow for every b>=1,m>0. The asserted conclusion tau=m<2nu is therefore justified at this complete-cross independent-side interface.

## Exact critical spokes

Deleting a cross spoke removes one vertex from precisely one induced apex graph in the global cover formula. Its vertex-cover number decreases by at most one. If the ordinary triangle-cover optimum decreases from m to m-1, an optimizing triangle-free subset S therefore has deleted cost |S|-1 and original cost exactly |S| by the global optimality inequality. Conversely a tight global swap whose optimum per-apex cover contains that spoke is an ordinary minimum cover containing it; after its graph deletion the remaining cover has size m-1. The universal one-edge lower bound gives equality.

The intermediate vertex-cover equivalence is exact: deleting vertex a lowers vertex-cover number by one exactly when some old minimum vertex cover contains a. Removing a from that cover gives one direction, and appending a to a minimum cover of the vertex-deleted graph gives the other. No assertion about every optimum containing a is being made.

## Simultaneous triangle swaps and the continuation boundary

For a minimum ordinary cover containing all three edges of a private triangle acb, its omitted A-edge subset S is triangle-free and retains f=ac outside S. The cover formula and cardinality m force equality in the total spoke cost. Every per-apex spoke set is therefore individually minimum, and the one at b contains both a,c simultaneously. Conversely such a tight swap constructs the required minimum ordinary cover. Separate optima containing one endpoint each would not suffice, and the note correctly avoids that substitution.

If adding f to S leaves it triangle-free, the full global condition forces the total induced vertex-cover cost to increase by at least one. The b-term stays unchanged because its existing optimum already covers f. Only apices adjacent to both endpoints can change, so some other common apex has a one-unit increase. This increase is equivalent to all its previous minimum covers avoiding both endpoints: an optimum containing either would already cover f, and any unchanged optimum after adding f would be such an old optimum. This is the correct quantifier.

If S+f instead creates an internal triangle, the other two edges form an S-path a-x-c. The K4 conclusion requires the further actual adjacency xb, which is not automatic. The note explicitly retains this test. Neither branch currently supplies independent witnesses, a packing augmentation, or an unconditional page-abundance lower bound.

Reviewed `notes/challenger_universal_apex_private_strictness_v1.md` SHA-256: `bb060a79c9c80444ba8cbc04a434fe27efd998dc87ee3f9675b7006069e0b717`.

Reviewed `notes/challenger_independent_side_critical_swaps_v1.md` SHA-256: `0ae9438b585d085c1648122b8f987e35582543542a988332813ae5b177270aba`.

Completed UTC: 2026-11-15T23:30:21.310961+00:00.
