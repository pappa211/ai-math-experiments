> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent diamond review

Status: ACCEPTED ORDINARY, at the stated conditional minimum-Q scope. No numerical or Lean verification is claimed. The three bound sources are listed below. For the fragile branch this review binds the direct v2 repair, not the longer placement argument of v1 Sections 4-6.

## Positive branch and exact interface

The positive packing-gain proof in v1 Section 1 is valid. Q-cu is resilient by the accepted single-deletion theorem, and its three c-neighbors permit at most one c-triangle; this passes resilience to J. The old diamond prevents B. Every c-page meets that diamond component and no old background edge is activated, so Q triangle connectivity leaves exactly one supported J component, qualifying for fixed-G minimum-Q C12 naming. This names defect one only.

The named cases exhaust C12. For W5 (five-rim wheel) the two neighbors of the marked rim vertex extend to a three-spoke cover, so the extra cy saves one. For K5-e the displayed four triangles have disjoint edge sets. In a fresh clique-star model the two diamond triangles lie in distinct pieces sharing the hub edge; these are the root and its one leaf at that edge (or the two K5 pieces in the remaining model). Full packings avoiding the hub edge and the designated adjacent spoke in each relevant piece compose because all other leaves avoid their attachment. Thus both c-pages append. No simultaneous avoidance of an unproved general edge set is required.

The neutral profile follows exactly: all five old link edges are critical, each opposite matching drops packing by two, and a minimum Q cover containing cxu has exactly cx,cu among c-spokes. Its old part contains xu,yz and has size 2k-3, giving R defect one. The forbidden adjacent pairs follow by the displayed single-spoke Q cover extension.

## Direct fragile repair

Every maximum J packing over S in B consists of a maximum old packing and exactly three ordinary pages: a mixed page would spend two of the three restored edges and prevent the required gain three. The forbidden minimum-cover pairs force the retained cross edges yu,xz to be background and exclude f equal to either.

The marked bare xu-page existence argument is sound, including arbitrary shared old vertices. For a fixed missing base a-b, each old literal clique has at most one ordinary-page footprint; two would force the opposite endpoint into that clique via an old triangle. Minimum clique covers through these footprints hit every nonbare page. If every bare xu-page used yu, adjoining yu,yz,f would cover J at its minimum size with the forbidden pair. The resulting bare page P has external apex and avoids both retained cross edges.

Criticality forces both background cross edges into the three new packed pages. The f-page cannot use both disjoint cross edges; the two internal M-pages are the only M-pages using either and intersect on xy. Exactly one internal M-page occurs. Reflecting labels, retain the external yz-page and all old packed triangles, remove xuy and the f-page, and append cuy,cxz,P. The two c-pages use disjoint c-spokes and background bases; P is bare; two ordinary pages on disjoint bases with external apices share no edge, even with equal apices. This gives k+1 actual Q triangles. Hence no critical deletion R->B exists, and proper CS makes R resilient. No codegree, minimum degree, private-boundary, or C12 hypothesis enters this local repair.

## Resilient named reconstruction

The named note correctly names only the unique active resilient defect-one support of R. The old terminal graph is P4. For each tight old clique, the internal ordinary pages fix the entire footprint of each restored base: xy gives one boundary edge; yu or xz gives at most two adjacent edges; one terminal gives at most one. c-pages and all multiple-restored-edge triangles add no omitted boundary edge. The accepted paid theorem therefore removes every tight component.

An external ordinary-page spoke that remained background could lie in only that one Q triangle: the other restored base is disjoint and c has no external neighbor. Codegree at least two therefore puts both spokes in C. The same reasoning bounds an outside-C terminal's neighbors by A plus c, forcing the peripheral vertices into C by minimum degree four. A maximum J packing has two ordinary M-pages; they cannot both be internal, so some hub is in C. If the other hub were outside, its unique ordinary page and critical background cross edge would force the two intersecting internal pages simultaneously. Thus all four terminals belong to C.

The universal support vertex makes C induced on its vertices in R, so the terminal P4 is literal. All actual Q triangles now lie in C plus M plus the four c-spokes; triangle support removes remaining ambient background and vertices. The end edge uy has neither endpoint universal, hence is eligible by the already independently accepted C12 fact. A minimum C cover through uy plus xu,yz,cx covers every Q triangle and has size 2k-2. This is a literal cover saving.

## Composition and limit

Together with the independently accepted degree-four C4 and K4 link exclusions, this excludes every degree-four vertex: codegree at least two says each link vertex has degree at least two, and the only four-vertex graphs with that property are C4, K4-e, and K4. Thus the conditional minimum unknown Q has minimum support degree at least five. The diamond proof uses only the earlier minimum-degree-four profile; it does not use the pending wheel-rim cap theorem or any unbounded two-hub reconstruction. There is no cycle.

This is a proved conditional reduction, not a degree bound for arbitrary counterexamples without the fixed-G/minimum-Q premises, and not a global availability theorem.

## Bound sources
- `notes/apex_diamond_degree_four_resilience_v1.md` SHA-256 `6244176a604ca91f7e065fa5280cf297909b3c5928c7d05eb6ae1ea3b4ef7259`.
- `notes/apex_diamond_opposite_augmentation_v2.md` SHA-256 `2aae53ccbb6ed3deb32aeddb2fb4f3030dc0eed4ca6a0e2b29aa73a516f08ef9`.
- `notes/matching26_diamond_neutral_named_reconstruction_v1.md` SHA-256 `ad327e82f2e7f54f3c62badc49dde01a0a84b72abe399bec52af1aaeb0ebab64`.
