> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Saturating a specified minimum vertex cover, and a weighted star-component packing

Status: PROOF_USING_DECLARED_INPUT_CANDIDATE; fresh review requested. TUZA-22, 2026-11-16 UTC. The general Gallai–Edmonds structure theorem is an explicit classical input. This does not assert the analogous weighted packing statement for arbitrary tree cover components.

## 1. Matching saturation theorem

For every finite simple graph L and EVERY specified minimum vertex cover Q of L, there is a maximum matching saturating all vertices of Q.

Let I=V(L) minus Q, a maximum independent set. Use the Gallai–Edmonds decomposition (D,A,R): D consists of vertices missed by some maximum matching, A=N(D) minus D, and R is the rest. The imported facts are that every D-component is factor-critical, L[R] has a perfect matching, and the bipartite graph between A and the D-components has a matching saturating A. Maximum matchings combine these pieces by matching A into distinct D-components and leaving exactly one vertex exposed in each unmatched D-component.

Call a D-component bad if it has no vertex in I. For every collection S of bad components, its neighbors N(S) in A satisfy |N(S)|>=|S|. Otherwise remove I intersect N(S) from I and add one vertex from each component in S. The result is independent: different D-components have no edges between them, and the only neighbors of D outside D lie in A. It is larger than I, a contradiction. Hall's theorem therefore gives a matching of all bad components into distinct A-vertices.

Extend this bipartite matching to one saturating A while retaining saturation of every bad D-component. Ordinary augmenting paths suffice: a matching saturating A exists by the imported structure theorem, so while the current matching has size less than |A| it has an augmenting path. In a bipartite graph the path starts at an unmatched A-vertex and ends at an unmatched D-component. Flipping it preserves saturation of every previously matched D-component. Thus all bad components remain matched.

Choose actual attachment edges for this final component matching. In each attached D-component take a perfect matching after deleting its attachment vertex, and then include its A-attachment edge. In each unattached D-component choose one vertex of I in that component and take a perfect matching after deleting it. Finally use a perfect matching in R. The only exposed vertices are the chosen I-vertices, so every Q-vertex is saturated. The imported maximum-matching decomposition, or its cardinality formula, shows that this matching is maximum. QED.

This is a statement about saturation, not matching Q injectively into its complement. Edges with both endpoints in Q are allowed and can be necessary.

## 2. Exact weighted packing for a star component of a minimum triangle cover

Let C be a minimum triangle-edge cover of G, and suppose one of its selected-edge components is a star with center h, leaf set Q, and m=|Q| edges. Put A0={h} union Q. Assign each actual triangle to the unique C-component containing all its selected edges, and let G0 be the union of the edges of the triangles assigned to this star.

Every G0-triangle contains h. Indeed, every assigned triangle contains a selected edge hq. Conversely any triangle newly visible in the union G0 is an actual G-triangle, and no selected edge from another component occurs in G0. Thus it is also assigned to this star. Consequently G0 is a cone with apex h over a triangle-free rim graph L. The set Q is a vertex cover of L.

The cone's triangle-cover number equals the rim's vertex-cover number. A rim vertex cover gives a spoke cover. Conversely, replace every selected rim edge in any triangle-edge cover by a spoke to either endpoint; the resulting spoke set is no larger and still meets every cone triangle. Minimum optimality of C gives tau(G0)=m, since a smaller cover of this assigned family would replace the m star edges in C and improve G's ordinary cover. Therefore Q is a minimum vertex cover of L.

By Section1, choose a rim matching M saturating Q, and take the cone triangles on its edges. Give a triangle weight two when all its vertices lie in A0, and weight one otherwise. A matching edge inside Q contributes two matched Q-vertices; one joining Q to its complement contributes one. No rim edge has both endpoints outside Q. Thus this edge-disjoint triangle packing P has

    2|{T in P: V(T) subset A0}| + |{T in P: V(T) not subset A0}| = m.

This proves the proposed local weighted inequality for every star component of a minimum ordinary triangle cover, with arbitrary actual outside pages and arbitrary interaction with other cover components. It does not yet show that these local packings can be combined globally.

## 3. Input authentication and finite discriminator

The original primary source is T. Gallai, *Maximale Systeme unabhängiger Kanten* (1964), pp.401–413, available from the Hungarian Academy repository:
https://real.mtak.hu/189486/
Published PDF: https://real.mtak.hu/189486/1/cut_MATKUTINT_1964_3_pp401_-_413.pdf

An inspected author-hosted primary research-paper restatement is Busch et al., *Packing of Graphic n-tuples* (2011 manuscript), theorem3.6 on PDF page9:
https://dwest.web.illinois.edu/pubs/degpack.pdf
Its decomposition notation (A,B,C) corresponds to this note's (D,A,R). The restatement explicitly supplies factor-critical D-components and the structure of every maximum matching. The complete original proof of Gallai–Edmonds has not been re-proved or formally verified in TUZA-22; it remains a declared classical theorem input. No novelty claim is made for the saturation consequence.

The preliminary exact discriminator scripts/challenger_cover_saturating_matching.py checked all1,253 graphs returned by networkx's graph atlas through seven vertices and all3,726 minimum vertex covers. It found no counterexample or UNKNOWN. Matching weights were computed by an exact vertex-subset recurrence and minimum covers by independent-set enumeration. The monitored run lasted0.368 seconds with peak sampled tree RSS40.875MiB. Its evidence is evidence/challenger_cover_saturating_matching.json. This finite check motivated the proof; it is not a premise of the all-size result.
