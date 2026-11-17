> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Matching B-restoration: three-connected support exclusion

Frozen proof candidate v1, 2026-11-16. Independent review and independently authored finite checker REQUIRED. The finite step is an exact six-terminal reduction, not a bounded-order census of Q.

## Statement

Let Q be a finite simple, triangle-supported graph with one connected nonempty shared-edge triangle family, single-edge packing resilience, and three-vertex connectivity. Let S={01,23,45} be three vertex-disjoint edges. Put L=Q-S and assume B(L), nu(Q)=m+2, tau(Q)=2m+3, where m=nu(L). Then no such Q exists.

The hypothesis is exactly the matching branch of the fragile-blocker-pair profile in the conditional minimum Q. No proper-subgraph CS or minimum-Q comparison is used after the displayed hypotheses. They are used by the parent argument to supply the profile and three-connectivity.

## All-size preliminary facts

1. Every new triangle is an ordinary page on one base in S. The whole-one-base footprint lemma gives at most one supported old edge per old literal clique for an entire base family. If a base had no B-bare page, choose minimum old covers through that family's footprints and add the other two bases; this gives tau(Q)<=2m+2. Thus each base has a B-bare page.
2. Three disjoint ordinary pages, at least two B-bare, append to a maximum L packing: only the remaining page has supported spokes, at most one per old component. Hence no such triple exists.
3. Every B-bare page has apex among the six terminals, by notes/matching26_terminal_confinement_v1.md. A maximum packing of Q-si comprises exactly m old triangles and one disjoint page on each remaining base, and must meet every B-bare si-page.
4. Two edge-disjoint pages on distinct matching bases are packing-compatible over B whenever the apex of one is a terminal of the other base. To obstruct compatibility an old K4 must contain opposite spokes, one from each page; such a K4 would contain both endpoints of one absent matching base. K5 avoids any two edges, and K4 avoids any two adjacent edges. This is the elementary compatibility argument in archived TUZA22 notes/three_matching_edge_restoration_v1.md, section1. It remains valid without the gain-one assumption used later in that archived proof.

## Exact finite interface and completeness

Let E0 be the union of the old spokes of ALL B-bare pages. By fact3 it is a subset of the twelve crossedges on the six terminals. It is triangle-free: an old triangle containing any E0 edge contradicts B-bareness. Every E0 edge is used by an ordinary page, each base has a page, and there are no three disjoint pages by fact2. Conversely the B-bare page families are precisely the S-pages whose two spokes lie in E0.

The script scripts/matching26_bare_skeletons.py checks all 4096 crossedge subsets and quotients by the 48 permutations preserving S. Exactly147 labeled skeletons, eight quotient types, pass these conditions. This is a claimed exact finite result, currently awaiting independent reconstruction.

For each canonical E0, the script also considers every terminal old-edge supergraph E, rejecting any old triangle with an E0 edge. It allows ordinary terminal pages and a symbolic outside apex6. Such a page is allowed only if it cannot make three disjoint pages with bare pages from the other two bases. For each deleted base, it requires some disjoint pair of allowed pages on the other two bases meeting every bare page of the deleted base. These are necessary conditions only. The test intentionally overapproximates actual packing compatibility and does not assert that every retained extension is realizable. An actual Q must be represented because fact3 supplies the required pair. Outside apices are interchangeable for these tests: a page at an outside apex is disjoint from every page on a different matching base unless the latter's apex is reciprocally outside its base, which is impossible; even two pages at the same outside apex share only a vertex.

After these necessary tests the following table bounds ALL actual page apices. A,B,C mean bases01,23,45. An asterisk allows an arbitrary outside apex. The variable terminal edges listed are the only additional induced L edges allowed by the retained finite overapproximation.

|type|bare A apices|bare B apices|bare C apices|possible additional L terminal edges|bounds for all page apices A / B / C|
|---|---|---|---|---|---|
|0|2|0|0|13,14,15|{2,3,4,5} / {0,1} / {0,1,*}|
|1|2|1|0|03,14,15,34,35|{2,3,4,5} / {0,1} / {0,1,*}|
|2|2,3|0,1|0|14,15|{2,3,4,5} / {0,1} / {0,1,*}|
|3|2,4|0|0|13,15|{2,3,4,5} / {0,1} / {0,1}|
|4|2,4|1|0|03,15,35|{2,3,4,5} / {0,1} / {0,1}|
|5|2,3,4|0,1|0|15|{2,3,4,5} / {0,1} / {0,1}|
|6|2,3,4,5|0,1|0,1|none|{2,3,4,5} / {0,1} / {0,1}|
|7|3|1|0,2|none feasible|excluded by required compatible pair|

Each row's E0 is recovered by joining each listed bare apex to both base endpoints. The listed variable edges are a union; arbitrary simultaneous choices are NOT asserted. Exact retained choices are in evidence/matching26_bare_skeletons.json. For type4, edge35 occurs only when both03,15 are absent. Every retained terminal L graph in types2–6 is triangle-free.

## Types0 and1: whole-family cover savings

For type0 use the two new cover edges {02,45}. Every uncovered A or B page contains a supported edge from {13,14,15}; these edges are supported when present because otherwise their pages, with the other spoke already B-bare, would enlarge E0. Every C page is covered by45. Distinct present edges among13,14,15 lie in distinct old components. A component containing14 and15 would contain missing45. One containing13 and14 would contain34, and old triangle034 would use the B-bare edges03,04; similarly13 and15 would force old triangle035. Thus choose a minimum old cover through each present required edge, independently, and add02,45. Cost2m+2 contradicts the profile.

For type1 use {12,45}. Every uncovered A or B page contains a supported edge from {03,14,15}. No two can lie in one old clique:03 with14 or15 would contain missing01;14 with15 would contain missing45. Choose the old covers through these edges and again obtain2m+2. The possible extra edges34/35 do not create additional A/B pages beyond the table and all C pages are covered by45.

## Type2: exclude outside C apices

All bare pages on A and B form the K4 on0123; every A/B page whose apex stays in the other base intersects every opposite-family page. Resilience after deleting45 supplies two disjoint pages on A,B. By the table B apices are only0,1, so the A page must be01x with x in{4,5}. Any outside C page45y is disjoint from this A page and from either B-bare page230 or231. The A/C pair is packing-compatible by fact4 (x is a C terminal). The B-bare page contributes no old footprint. A maximum old packing therefore appends all three, contradicting gain2. Thus every C page also has apex0 or1. All ordinary pages are now terminal.

## Types2–6: exact old-piece boundary and separator

In these types all ordinary pages lie on the six terminals. Since the triangle family of Q is connected, every old component must share an edge with a new page: follow a triangle-edge-sharing path to its first new triangle. Consequently it contains a supported terminal edge used by a new page.

Every retained induced terminal L graph in these types is triangle-free, so an old clique contains at most two terminals. It therefore contains exactly the endpoints of one such supported terminal edge. The possible attachment edges are:

- type2:14,15;
- type3:13,15;
- type4:03,15;
- type5:15;
- type6:none.

The additional35 possibility in type4 cannot host an old component: that edge is in no ordinary page from the table, and an old clique containing it has exactly those two terminals, so it cannot share another supported terminal edge with a new page. This contradicts triangle connectivity.

At most one old component can use each attachment edge. Components on adjacent attachment edges already share one terminal; they cannot share an additional outside vertex without sharing an old edge and becoming the same component. In type4 the two attachment edges03 and15 are disjoint. If their old components shared a vertex x, then actual old triangle13x would use the B-bare edge13 and the two old spokes3x,1x, impossible. Therefore all old components are literal fresh K4/K5 attachments along their specified terminal edge, with no additional vertex identifications.

Because every Q edge is triangular and every new triangle is terminal, a private vertex of an old component has no edge to another region: such an edge would have to belong to an old triangle (then to that component, or another component sharing that private vertex, already excluded) or a new terminal triangle (impossible). Each nonempty old component therefore supplies a genuine two-vertex separator at its attachment endpoints. This contradicts three-connectivity.

If there are no old components, every triangular edge lies in a terminal new page and every terminal L edge is B-bare. Thus Q is exactly its bare skeleton together with S. In every type2–6, deletion of{0,1} separates the nonempty vertex sets{2,3} and{4,5}; no edge joins these two sets. Again Q is not three-connected.

This exhausts all eight finite patterns and proves the proposed exclusion, conditional only on the exact finite interface being independently verified. No Q-order bound is used; old blocks and background were handled at their complete boundary.

## Implication chain and scope

Conditional minimum Q -> three-connectivity and the blocker-pair profile: parent PROVED_ORDINARY/archived premises. Fragile blocker pair whose three deleted edges form a matching -> hypotheses above: parent ordinary argument. The matching profile is then impossible: CANDIDATE, finite completeness and fresh review pending. The other S shapes, resilient blocker-pair reconstruction, and no-blocker availability remain separate OPEN obligations. Excluding every conditional unknown Q -> universal CS is CONDITIONAL on the archived minimum-counterexample chain; universal CS -> unrestricted Tuza is PROVED. This proof does not establish global R and does not use the original residual's every-triangle-extension property.

## Integrity and reproducibility

Relied sources: this mission's notes/eligibility_saturation_v1.md, reviews/opening_saturation_review.md, notes/matching26_terminal_confinement_v1.md; TUZA22 notes/three_matching_edge_restoration_v1.md and notes/three_edge_restoration_full_cs_v1.md; TUZA25 PROOF_CHAIN.md for the exact minimum-Q scope. Frozen C12 was read as a control, never enlarged. Geometry execution was one local Python process, no installed dependencies/solver; requested Astra/Ultra but observable worker serving metadata not exposed. Independent reviewer must check finite completeness, the whole-family bounds, type2's one-bare augmentation, and the actual old-component boundary argument.
