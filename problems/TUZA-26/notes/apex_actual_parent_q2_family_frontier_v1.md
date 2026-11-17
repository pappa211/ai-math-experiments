> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Exact q=2 family frontier inside the selected actual-parent cube

Status: ordinary normal form and two explicit cover payments, for independent review. This records the remaining asymmetric two-triangle obstruction without starting a larger case catalogue.

## 1. Complete individual-family normal form

Restore a missing triangle abc over a literal B graph, and suppose the complete new family has packing number two. Form the bipartite incidence graph whose left vertices are the three restored bases ab,ac,bc and whose right vertices are ordinary page apices. A matching gives edge-disjoint ordinary pages and conversely: distinct bases and distinct outside apices are precisely the needed disjointness. The central triangle cannot occur with an ordinary page in a packing. Thus the incidence matching number is two.

There are exactly the following forms:

* A: exactly two bases have ordinary pages. Their apex sets are nonempty and disjoint. A common apex would create pages on all three bases. The two active bases cover the complete new family.
* B: there is one full apex p, and every additional ordinary page lies on one fixed base, with a nonempty set of other apices. A two-edge cover consists of that base and the old p-spoke at its opposite triangle vertex.
* C: there are two full apices and no other pages: the exceptional seven-triangle K5-e family.

For completeness, if all three bases are active, Hall's theorem and matching number two imply either that all apices lie in a set of size two, or that two bases have a common neighborhood of size one. In the latter case their unique apex is full (two page faces imply all three old spokes), and every other page lies on the third base: form B. In the former case, three active bases on two apices force one apex to appear on two bases and hence be full. The other apex appears on one base (B) or on two and hence all three (C). A single full apex with no extra page would have matching number one and is excluded. These forms preserve arbitrarily many apices in A and B; no finite-order assumption is introduced.

## 2. A type-A omitted-base restriction is paid

In the exact shared-pair interface, let T=hab and U=hcd be missing triangles over B, with single responses (m+2,2m+2), and pair response (m+3,2m+5). If T has form A and its omitted base is ab, its two-edge cover is {ha,hb}. These two edges hit EVERY mixed triangle between T and U. Choose a minimum B cover over which the other individual family costs two additional edges; this is possible from its response and the one-triangle classification, including the supported-spoke overlap when it is exceptional. Adding the two T edges and the two other-family edges then covers the whole pair restoration with at most 2m+4 edges, a contradiction.

Thus a type-A family in a shared-pair cube must omit a base incident with the shared vertex. This is a complete mixed-triangle cover payment, not merely a numerical restriction.

## 3. Three type-A families in the common-center cube are paid

For the common-center cube abc,ade,afg, suppose all three families have form A. By Section2 each omits exactly one a-spoke; choose its two active restored bases as its cover. The six selected edges cover all individual new families. A mixed triangle can remain unhit only when its two leaves are among the three omitted-spoke leaves, one from each opposite pair.

Take any old minimum B cover F. On those three leaves the old mixed rim graph remaining outside F is triangle-free, since F covers every old triangle. A triangle-free graph on three vertices is a star or empty. One further a-spoke covers all its mixed triangles. Hence the complete cube has a cover of size at most

    2m+6+1 = 2m+7,

contrary to the actual-parent cube target 2m+8. Every old triangle, ordinary page and mixed triangle has been accounted for.

Together with the shared-exceptional four-packing lemma, the common-center cube therefore has at most one C family and cannot have three A families. No assertion about the remaining B forms is made here.

## 4. Exact asymmetric obstruction after ordered selection

Under all-double-defect-two, the accepted ordered selection chooses U inside H=G-T so that no ordinary U-page is bare relative to R=H-U. In a conditional common-center low-B cube, H=B+U+V, R=B+V, with U=ade,V=afg.

This does not eliminate form A or B by itself. A B-bare opposite U-page def can have its old spoke df supported in R by the actual V-page dfg when dg is present (or ef by efg when eg is present). A B-bare hub page adp with external apex p can have its old spoke ap supported by an ordinary V-page afp or agp. Thus no-R-bare is strictly different from no-B-bare at the level of this actual activation interface.

The first activation is confined to the exact two-by-two cross graph already proved in apex_actual_parent_ordered_selection_v1.md. Nonbare pages can still meet arbitrary old components, and the hub activation can link outside apex families. No valid complete cover of cost 2m+4 or four-page packing over B has been derived for all remaining A/B-opposite configurations. This is the retained obstruction, not a claim that any such configuration satisfies the full actual-parent cube.

Dependencies: the exact ordinary-page matching interface in TUZA22 two_triangle_restoration_v1.md; the current shared-exceptional lemma and ordered-selection corollary. No computation, minimum-Q transfer, new model or defect-two naming is used.
