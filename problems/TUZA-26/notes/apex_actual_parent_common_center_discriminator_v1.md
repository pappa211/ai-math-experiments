> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Common-center triple cube: complete core matching and cover discriminator

Status: ordinary paid operations and exact obstruction, for independent review. This note does not prove that either operation is enabled in the remaining actual-parent cube.

## Literal supplied region

Let B be a graph with literal K4/K5 triangle components, nu(B)=m,tau(B)=2m. Restore the three edge-disjoint triangles

    T1=abc, T2=ade, T3=afg,

where a,b,c,d,e,f,g are distinct, and put X=B+T1+T2+T3. Retain every background edge and every triangle with outside vertices. In the actual-parent low-packing tight row, X=G has nu(X)=m+4,tau(X)=2m+8, each individual restoration has gain (2,2), and each pair gain (3,5).

Call bc,de,fg the three opposite bases. Let J be the graph of OLD B edges between different opposite pairs among the six leaves b,c,d,e,f,g. The only triangles using edges from more than one restored triangle are exactly aij with ij in J. There cannot be a triangle using all three restored families: every cross-family restored-edge pair has common endpoint a, so a third restored edge would have to join different leaf pairs, and no such edge is restored.

Every other new triangle belongs to the complete individual family of one Ti. This explicitly accounts for all mixed triangles; outside triangles do not disappear.

## 1. Old footprints of core matchings are automatically avoidable

An old B clique contains at most one vertex from each opposite pair, because bc,de,fg are absent from B. Consequently it contains at most three of the six leaves. It therefore contains at most one edge of any matching on those leaves. A maximum packing of either K4 or K5 can avoid one specified edge. Choosing these packings independently over all old components proves:

    every matching of old core-leaf edges is avoidable by a maximum B packing.

No assumption that the old cliques are vertex-disjoint is needed: their triangle-support edges are disjoint, and every supported old edge belongs to its one component. Background matching edges cause no obstruction.

## 2. A complete five-packing operation

Suppose two ordinary opposite-base pages bcp and deq are B-bare, meaning bp,cp,dq,eq are old background edges, and their apices p,q lie outside the seven core vertices. The apices may coincide. These two triangles are edge-disjoint.

Suppose the actual graph on the six core leaves has a perfect matching M avoiding the two bases bc,de. Its three edges may include fg and otherwise lie in J. For each ij in M take the hub triangle aij. These three triangles are pairwise edge-disjoint. They do not meet bcp or deq in an edge: their hub spokes are at a; their rim edges avoid bc,de and have both endpoints in the core, while each other page edge has an outside endpoint.

The only old footprint of the resulting five triangles is the subset M intersect E(B), because the two opposite pages are bare. By Section1 it is avoided by a maximum B packing. Appending these five triangles gives

    nu(X) >= m+5,

contradicting the cube target m+4. This operation covers arbitrary outside crossings by retaining the entire old packing; it relies on actual outside apices and must not be applied to an internal-apex page without a new collision check.

## 3. A retained-cover alternative when all three families have two-edge covers

Assume all three complete individual families admit two-edge covers D1,D2,D3. Choose any such covers and any minimum B cover F. Their union covers every old triangle and every individual new-family triangle. Let W be the set of core leaves i for which the restored spoke ai is not in D1 union D2 union D3. The uncovered mixed triangles correspond exactly to those edges of J[W] omitted by F and by D1 union D2 union D3. Call this remaining graph J0.

The graph J0 is triangle-free, because it is an old B subgraph disjoint from the old triangle cover F. If its matching number is at most one, it is empty or a star: two intersecting edges share a center, and any edge avoiding that center would either be disjoint from one of them or close a triangle. Thus adding at most one restored a-spoke covers all remaining mixed triangles. The resulting full X cover has size at most

    2m+2+2+2+1 = 2m+7,

contradicting the cube target 2m+8.

Therefore in a surviving cube with three two-coverable families, EVERY choice of old minimum cover F and individual two-covers leaves two vertex-disjoint uncovered mixed rim edges. By Section1 their old matching footprint is avoidable. This last fact alone does not supply three additional edge-disjoint pages; no packing gain is claimed from the two rims alone.

The cover alternative does not apply unchanged when one family is exceptional K5-e: the baseline cost becomes seven, so one more edge reaches the target eight. The independently checked shared-exceptional packing lemma proves at most one family is exceptional, in both surviving intersection patterns.

## 4. A separate exact opposite-page cover obstruction

For any old minimum cover F, if it hits all ordinary pages on two opposite bases, add all six restored a-spokes and the third opposite base. Every individual fan page, central triangle and mixed triangle is hit by an a-spoke; all opposite pages on the two selected bases are hit by F; the remaining opposite pages are hit by the third base. This is a cover of size at most 2m+7.

Hence the cube requires that no minimum B cover simultaneously hits both opposite-page families for any pair of opposite bases. A family containing a B-bare page cannot be hit by old edges at all. If two such families have no bare pages, their old footprints are jointly coverable unless they create an adjacent-edge incompatibility inside an old K4. The latter assertion uses the standard whole-one-base footprint fact: a fixed ordinary base family contributes at most one supported old edge per B component. It supplies a precise old-cover obstruction, not automatic bare-page availability.

## Remaining gap

The two-bare-page/perfect-matching operation is paid when supplied. The two-uncovered-rim conclusion is forced in the three-two-cover branch, but the remaining three compatible pages have not been forced. The ordered actual-parent selection of apex_actual_parent_ordered_selection_v1.md can exclude outside bare pages for selected families and confine some internal pages to a two-by-two cross interface; it does not assert existence of this cube or enable Section2. No defect-two naming, global Tuza claim or new numerical search is made.
