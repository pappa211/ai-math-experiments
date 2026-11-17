> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Extremal minimum-cover normalization removes deficient triangle components

Status: ORDINARY_PROOF_CANDIDATE using proper-subgraph CS in the final obstruction step; fresh review required. TUZA-22 challenger, 2026-11-16 local date. This is a cover-choice normalization, not a claim that all cover components are triangles or that arbitrary large components have favorable packing weights.

## 1. Exact local classification

Let C be a minimum triangle-edge cover of G, and suppose one connected component of its edge graph is the literal triangle T=abc. Let F_T be the actual triangles assigned to this component. They are exactly T and pages on its three edges; every such page is private to its base edge. No triangle can have a C-edge in two distinct cover components.

The family F_T has cover number3. Its three T-edges give a cover, and a smaller family cover combined with the rest of C would improve C. Each T-edge has a private page by inclusion-minimality of C. The private packing number q_T is at least2: otherwise the whole F_T family, including T, is pairwise edge-intersecting and hence is a book or lies in a K4, with a two-cover.

Suppose q_T=2. For each T-edge e, let P_e be its nonempty set of page apices. An apex belonging to two such sets is adjacent to all three terminals, and therefore belongs to all three sets. Three distinct representatives of the three sets would give three edge-disjoint private pages. Since none exist, the elementary three-set Hall alternatives give either a pair of page sets whose union has size1, or a union of all three page sets of size at most2.

The first alternative is impossible. If the two page sets on edges sharing terminal a are both {x}, then the third T-edge together with spoke ax covers F_T, contradicting its cover number3. Thus the total page-apex union has at most2 vertices. It has exactly2, say x,y, because q_T>=2. Both must be full apices: one appears on at least two bases and hence all three; if the other appeared on only one base, the other two page sets would again be the same singleton. Hence

    P_ab=P_ac=P_bc={x,y}.

Thus q_T=2 is EXACTLY the terminal family with two distinct full apices and no other pages. The triangle support of this assigned family is K5 minus the apex edge; the actual graph may additionally contain xy, assigned to another cover component. No induced-subgraph absence of xy is asserted.

## 2. A valid minimum-cover exchange

Choose a minimum cover C minimizing t(C), the number of its nonempty connected components that are literally triangles. If a triangle component T=abc has q_T=2 and full apices x,y as above, replace its three edges by

    {ax, ay, bc}.

This hits T through bc; pages on ab or ac use ax or ay; pages on bc use bc. All other assigned families retain their original C-edges. Therefore the resulting cover C' has the same size and is again minimum. No other cover edge, including a possible xy, is removed.

The new edge bc is an isolated single-edge cover component, since b,c had no other incident C-edges. The other two new edges form the path x-a-y, attached to the old cover component(s) containing x andy. Such an attachment creates a literal triangle component only when those two apices were exactly the endpoints of an old isolated single-edge component xy. In every other placement it creates a nontriangle component or enlarges/merges existing components, while T disappears. No untouched component becomes a new triangle. Thus t(C')<t(C) except in that single-edge case.

By extremality, every q_T=2 triangle component must therefore have its two full apices at the endpoints of a separate single-edge C-component xy.

## 3. The exception is a peelable literal K5 patch

Now assume G is a minimum-edge CS failure in a subgraph-closed class, so every proper edge-subgraph satisfies CS. The vertices a,b,c,x,y form a literal K5: T is complete, x,y are full apices, and xy is an actual cover edge.

Its ENTIRE boundary with actual outside triangles is contained in {xy}. Indeed:

- A core edge of T has no outside page by the exact two-apex classification.
- For a spoke, say ax, an outside triangle axz would need a C-edge. The spoke ax is not in C; az cannot lie in C because a's cover neighbors are only b,c; and xz cannot lie in C because x's cover component is the isolated edge xy. For z outside the five vertices, all three possibilities fail. The same argument handles every core-apex spoke.
- Only xy can consequently occur in an outside triangle.

A maximum K5 packing avoids this whole boundary, for example the two triangles abx and acy avoid xy. Apply the safe tight-patch peeling theorem of notes/safe_clique_patch_peeling_v1.md. Its active graph A is the support of all actual outside triangles and is a proper edge-subgraph. Proper-subgraph CS applies to A; the maximum patch packing avoids its entire overlap and gives nu(G)=2+nu(A), while covers give tau(G)<=4+tau(A). If equality holds, A is B; a nonempty shared boundary edge can be included in both minimum covers and saves one, while an empty boundary makes G itself B. Thus CS(A) implies CS(G), a contradiction.

This excludes the sole exceptional placement. Therefore:

    A minimum CS failure has a minimum cover C such that
    every literal triangle component of C has a private packing of size3.

The quantifier is existential over an extremal minimum cover. We do not assert that every minimum cover has this property; ordinary K5 already shows why the isolated-edge exception is natural outside the obstruction setting.

## Role and remaining gap

If such a chosen cover consisted entirely of t disjoint triangle components, selecting three private pages per core and using the exact pairwise conflict decomposition would yield a full packing of size at least ceil(3t/2), proving tau<=2nu at that cover shape. The normalization may instead produce larger cover components. Their local weighted packing bounds remain unproved, and the present theorem does not solve the mixed-component or unrestricted CS problem.

The exchange is deliberately limited to the three T-edges. Removing xy via a different K5 cover would be unsafe if xy had outside private pages; that unproved shortcut is not used. All outside graph vertices and all actual outside triangles are included in the boundary argument.
