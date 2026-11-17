> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Accepted version: three-star v2

**PASS — PROVED_ORDINARY at the stated hypotheses.** The isolated-vertex wording issue is resolved in notes/apex_three_star_defect_one_v2.md, SHA-256 `18b04ab57c8b15c0ef8d9b81db051bc01fb6ea60d6e4e6305b582e0f3462a354`, independently read and checked 2026-11-16T21:05:54.126419+00:00. Its conclusion is the literal triangle support W5, and Q itself when no isolates are present. No mathematical argument changed. The detailed reconstruction and v1 review history follow.

# Independent review: three-star defect-one restoration

Frozen 2026-11-16T21:03:25.567804+00:00. Reviewed notes/apex_three_star_defect_one_v1.md, SHA-256 `b2a2c1624b7494cc7a65afc56fbc2a857c677b526c19c106286daa467ec8a386`.

**PASS for the mathematical conclusion that the entire triangle support is W5; PASS for literal Q=W5 when its vertex set consists of support endpoints.** If “triangle-supported” only means every edge lies in a triangle, isolated vertices remain possible and the displayed literal conclusion needs this qualification. The conditional minimum-Q application already uses support graphs without isolates. No substantive mathematical gap was found. This is ordinary independent reconstruction; the author's finite controls are separate and are not a premise of this review. No Lean check was run.

## Scope and first cover-saturation consequence

The premises are B(L) for L=Q-S with S={ab,ac,ad}, connected nonempty shared-edge triangle support of Q, nu(Q)=r+2 and tau(Q)=2r+3 where r=nu(L). Single-edge resilience is not required. This is the strict defect-one regime, not the archived R3 equality regime with packing gain one.

An ordinary page aux uses exactly one restored edge au; ax,ux are old. Its apex is outside the star terminals because all a-spokes to the other three terminals were deleted. An old literal clique cannot contain a and u. The union of all au-page spokes meets each old clique in at most one edge: two distinct spokes at one endpoint force an actual old triangle through the other endpoint and hence force missing au. If au had no bare page, minimum old clique covers through their unique page spokes would cover every ordinary au-page. Adding the other two restored edges then covers every new triangle, including every two-restored-edge triangle. This contradicts the exact cover increase three. Thus each base has a bare page. Every claim retains arbitrary background and arbitrary vertex sharing of old components.

## Marked matching rotation and whole-footprint packing

The bipartite ordinary-page incidence graph has three left vertices and at least one marked (bare) neighbor at each. Any left-saturating matching can be replaced by one containing a mark. Starting from an unmarked matching, a chosen marked neighbor outside the matched right set permits direct replacement. Otherwise each left vertex points to the owner of its chosen marked right neighbor. There are no loops, so a directed cycle exists. Rotation along the cycle replaces its distinct matched rights by the corresponding marked edges and preserves saturation. This is a valid elementary matching argument, with no hidden requirement that the marked edges themselves form a full matching.

Three distinct bases and three distinct ordinary apices produce three edge-disjoint pages. At least one is bare. The other two use adjacent restored bases, and their whole old footprint in each old clique is avoidable. A component containing a sees only spokes at a; one not containing a can see only the two opposite spokes. If those are disjoint, old edges between their apices make an old triangle through a, forcing a into the component and forcing a missing star edge. Thus only a two-edge star, one edge, or no edge can occur. K4 avoids such a star with its opposite triangle; K5 has a maximum two-packing avoiding it. These choices combine over edge-disjoint old triangle components and are disjoint from all three pages. The resulting r+3 packing is forbidden. Hence no left-saturating incidence matching exists.

## Hall alternatives and link exhaustion

For three positive left degrees, Hall failure means either two rows have union of size one, hence identical singleton apex sets, or all three rows have union of size at most two. The first case forces their unique pages bare. Their two leaf endpoints cannot be joined by an old edge, because that would create an old triangle containing the bare spokes. The common old a-apex spoke plus the third restored base cover the entire new family, contradicting cover gain three. Thus there are exactly two ordinary apices x,y.

In the new link K on b,c,d,x,y, an old leaf edge uv forces the ordinary-apex sets of u,v to be the opposite singletons {x},{y}. Choose their bare pages: a common apex would make an old triangle using bare rim spokes. With distinct chosen apices, either opposite incidence would likewise make a bare spoke old-supported. Therefore adjacent leaves have disjoint singleton apex sets. It follows that K has no triangle through x or y, and the three leaves cannot form a triangle because three nonempty pairwise-disjoint apex sets cannot fit inside {x,y}. The edge xy is absent from the *new* link by definition: axy, if present, would be an old triangle.

A two-vertex cover of K would give two actual a-spokes covering every new triangle, so vc(K)>=3 and alpha(K)<=2. A triangle-free five-vertex graph with alpha<=2 has neither degree>=3 (three independent neighbors) nor degree<=1 (the vertex plus a nonadjacent pair among at least three nonneighbors). Thus all degrees are two; triangle-freeness forces the single cycle C5. This exhaustion does not assume a missing crossing triangle or invoke a finite census.

## Cover saving removes the old components

If any rim edge e of K is old-supported, an old minimum cover can contain e. The remaining P5=K-e has a two-vertex cover. Its two a-spokes cover every new triangle except the one based at e, which is already covered. This yields cover size at most2r+2, contradiction. Hence every K edge is background in L.

There is exactly one leaf-leaf edge in K: x,y each have degree two and no xy edge, accounting for four of the five cycle edges. Its endpoints have distinct singleton apex sets. Those unique pages are bare, forcing both old hub spokes ax,ay to be background too. All other hub spokes are exactly the restored edges. Consequently the entire wheel triangle family is edge-disjoint from every old triangle support, even if vertices are shared. Connected shared-edge support of Q implies there is no old triangle component. Every Q edge is triangular, so no extra nonisolated graph part remains. This proves the claimed support exactly W5. Only possible isolated vertices require the initial wording qualification.

## Strategic implication and boundaries

The theorem excludes a star-shaped three-edge B residual in the conditional unknown Q outside C12. If a blocker-pair residual has a further critical edge and their union forms a star, proper-subgraph CS supplies precisely the displayed numerical profile; the theorem then contradicts Q outside C12. This applies at all minimum degrees and needs no predecessor K4-completion, a real improvement in the available structural constraints.

It does not prove a blocker pair exists, that every blocker residual is resilient, or that a fragile triple has star shape. Triangle, P4, P3 plus an isolated edge, and three matching-edge shapes need their own gain-two proofs. The no-blocker all-eligible two-edge-resilient core remains untreated. The result is an all-size configuration exclusion with a concrete place in the combined blocker analysis, not a complete availability theorem.
