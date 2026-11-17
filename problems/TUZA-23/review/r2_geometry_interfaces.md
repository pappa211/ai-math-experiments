> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Proposed faithful R2 geometry interfaces

This is an implementation architecture proposal, not checked code. It preserves the exact frozen R2 statement. The generic four-vertex cover lemmas below compress the source's casework without changing its mathematical conclusion or assumptions.

## Keep graph semantics outside pure finite-set geometry

Use `page a b x := {a,b,x}` only with endpoint/apex distinctness derived from actual adjacency. Let an ordinary page predicate mean H.Adj a x and H.Adj b x, with ab absent. Bare additionally means neither old spoke belongs to support(triangles H). Do not define bare as absence from a chosen packing or chosen decomposition.

Useful first helpers:

- `edges_disjoint_iff_inter_card_le_one`: for arbitrary finite vertex sets s,t, Disjoint(edges s)(edges t) iff (s intersect t).card<=1. This isolates unordered-edge reasoning.
- `triangle_containing_pair`: if t.card=3 and {a,b} subset t with a!=b, there exists unique x outside {a,b} with t={a,b,x}.
- `ordinary_page_triangle`: old common-neighbor x gives an actual triangle in H+{ab} and hence H+{ab,f}.
- `new_triangle_cases_two`: every new actual triangle for two inserted edges either is an ordinary page for one edge, or contains both inserted edges. The latter is impossible for disjoint inserted edges and is exactly abc for adjacent ab,ac.

## Accounting bridges before endpoint casework

- `old_min_cover_hits_nonbare_pages`: B H and absent ab give a minimum H-cover meeting every ordinary non-bare ab-page; compose full pageSpokes footprint with blocks_min_cover_footprint.
- `old_max_packing_avoids_new_triangle`: any new triangle under <=2 insertions can be avoided by an old maximum packing. A new triangle is not contained in an old clique, so triple_edge_overlap gives <=1 old edge in every block; use blocks_max_packing_footprint. This even avoids separate one-/two-new-edge cases at this stage.
- `tight_two_increment`: existence of a new triangle plus tightness gives nu(G)=nu(H)+1 and tau(G)=2nu(H)+2, after excluding <=1 insertions.
- `tight_each_edge_has_bare_page`: otherwise compose the simultaneous old cover with the other inserted edge, covering all actual new triangles.
- `ordinary_page_meets_opposite_bare_page`: if an ordinary e-page and a bare f-page were edge-disjoint, choose an old maximum packing avoiding the first; background spokes make the second automatically disjoint from all old triangles; append both and contradict exact increment.

These statements should expose actual witnesses and the source quantifiers. In particular, it is EVERY ordinary page against EVERY opposite bare page.

## Adjacent case

Assume a,b,c pairwise distinct and inserted edges ab,ac. Ordinary ab-page apices are outside {a,b,c}, because an apex c would require old ac. Likewise for ac pages. Prove the pure set lemma:

`adjacent_pages_meet_iff`: under these distinctness constraints, not Disjoint(edges {a,b,x})(edges {a,c,y}) iff x=y.

Two fixed bare pages give their common apex x. Applying the universal intersection consequence to each fixed bare page and any opposite ordinary page proves both entire apex sets equal {x}. If H.Adj b c, old triangle bcx supports both bare spokes bx,cx, contradiction. Thus abc cannot be a two-new-edge triangle. The new family is exactly the two ordinary pages, both met by {a,x}; old minimum cover plus this edge contradicts the forced cover value. No assumed absence of two-new-edge triangles may enter before this argument.

## Disjoint case

Assume a,b,c,d all distinct and inserted ab,cd. Prove:

`disjoint_pages_meet_iff`: for ordinary pages abx,cdy, their edge supports meet iff x belongs to {c,d} and y belongs to {a,b}.

Fixed opposite bare pages therefore force EVERY ordinary page apex into the opposite pair. A triangle cannot contain both disjoint edges because it has only three vertices. Thus every new triangle is contained in S={a,b,c,d}.

Now use two generic four-set cover lemmas instead of enumerating cross-edge presence patterns:

1. `four_set_triangle_contains_opposite_of_missing`: S.card=4, s in edges S, not G.IsNClique 2 s, t in triangles G, t subset S imply (S minus s) in edges t. A size-three subset omits one of S's four vertices; since it cannot contain both endpoints of missing s, its omitted vertex is in s and it contains the opposite pair. Therefore if any S-edge is absent in G, the opposite pair covers EVERY new triangle. Adding this one pair to an old minimum cover contradicts tau(G)=2m+2. Consequently S is an actual K4. This subsumes the source's exactly-three-cross-edge diamond case; it neither adds a hypothesis nor requires a new census.
2. `opposite_pair_covers_four_set`: S.card=4 and s in edges S imply Covers(cliqueFamily S) {s,S minus s}. If s is also in old triangle support, choose an old minimum cover containing s. Adding the opposite pair covers every new triangle with at most one extra edge, contradiction. Hence edges S and old triangle support are disjoint.

To obtain the old cover containing supported s, use blocks_min_cover_footprint with D={s}; no component identifier needs to be exposed externally.

Finally use the existing B/decomposition equivalence. If K decomposes H, then insert S K decomposes G: each old clique remains actual; S is a K4; support-disjointness gives independence from every old block; and each actual G triangle is either old and already covered by K, or new and contained in S. Conclude B(G) using decomposition_componentCliques. This construction automatically counts every crossing triangle and permits arbitrary vertex overlap.

## Zero/no-new cases and exported theorem

When triangle families agree, use componentCliques_of_triangles_eq. Split F.card<=2 into empty/singleton/distinct pair using finite-set cardinal lemmas, and split a distinct pair into adjacent/disjoint unordered edges. Nonedges supplies size-two elements, absent adjacency, and pair distinctness. No ambient vertex enumeration is needed. The exact final theorem must retain only Nonedges, card<=2, old B and augmented tightness.
