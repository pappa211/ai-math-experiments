> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Cost-two triangle cores and minimum-CS normalization in the mixed cover class

Status: ORDINARY_PROOF_CANDIDATE, frozen for fresh review. Challenger reconstruction of the coordinator's cost-two extension, 2026-11-16 UTC. The strictness statement is ordinary and unconditional within the cover class; the final minimum-CS exclusion uses the explicitly stated class-local minimality and K4 peeling inputs.

## 1. Strictness from a cost-two core with two private pages

Let C be ANY triangle cover of G with tree or literal-triangle components. If a triangle component T has assigned-family cover number2 and admits two edge-disjoint private pages, then

    tau(G) < 2nu(G).

Choose those two pages as the local packing at T, instead of its internal triangle. Their weight2 still pays its family cover cost2. At every other core use the ordinary local choices of challenger_tree_triangle_cover_tuza_v2.md.

Suppose toward contradiction that tau(G)=2nu(G). The stronger sum-of-local-costs inequality forces tau(G)=sum_i tau_i. As proved directly in challenger_tight_mixed_cover_q2_k5_v1.md Section2, the potential mutual-target graph J on q2 cost-three triangle cores is edgeless: a reciprocal target would give a private spoke eligible in minimum covers of two distinct families, producing a global cover saving.

The coherent averaging construction consequently has an independent fair sign for each q2 core. To omit BOTH chosen T-pages, orient every actual cross-conflict component incident with T to its opposite family. If that family is q2, require its sign to be1. All these requirements are consistent because J is edgeless; multiple requirements on one q2 core ask for the same sign. Components with no q2 core have an independent free orientation, and isolated T-pages can be omitted by choosing their empty side.

Every external page still has marginal selection probability one half in the full fair construction, with the usual internal substitution at omitted q2 cores. Its expected size is at least half the summed local costs, which equals nu(G). Since every outcome is a packing, every positive-probability outcome must attain nu(G). Choose the positive-probability outcome just described. No T-page remains, so append the internal triangle T. It is disjoint from every other assigned family, whose triangles have at most one vertex in T. This contradicts maximality of nu(G), proving strictness.

The proof does not require a minimum selected cover, codegree, CS, or a hereditary-class assumption. It is the same exact internal-triangle augmentation that underlies q3 strictness, with the smaller local cost paid by two external pages.

## 2. Minimum-CS normalization

Let H be the hereditary class of graphs admitting ANY triangle cover with tree or literal-triangle components. Heredity follows by restricting such a cover after edge deletion. Suppose G is a minimum-edge failure of combined CS within H, and fix any such selected cover C.

The accepted inequality theorem already establishes Tuza throughout H. Thus this failure is tight, and authenticated class-local M0 supplies the usual minimum-CS codegree and proper-subgraph CS consequences. In particular every actual edge lies in at least two triangles.

Consider a triangle component T=abc of C. Its assigned-family cover number is at most3.

- If it is1, selecting the internal T gives weight2 for cost1 in the mixed compatibility proof, producing strictness. Hence this cannot occur.
- If it is3 and has three private pages, q3 strictness excludes it. Otherwise the exact two-apex classification and the accepted q2-to-K5 normalization force exactly two full apices which are the endpoints of a selected edge in a TREE component.
- If it is2 and has a private two-packing, Section1 excludes it.

The only remaining cost-two possibility has maximum private packing number1. Each base of T has at least one private page: its second actual triangle under codegree at least two has an apex outside T, since T has only three vertices. Pages on distinct bases with different outside apices would be edge-disjoint. Therefore all three nonempty page sets are the same singleton {x}, with x adjacent to all three core vertices, and no other page exists on a T-base.

The four vertices T union {x} form a literal K4. No edge of T has any outside triangle beyond this K4, by the just established complete page classification. Hence the ENTIRE actual outside-triangle boundary of the K4 is contained in its three spokes at x. A maximum K4 packing consisting of T avoids that whole star. The accepted star-boundary K4 peeling theorem, using proper-subgraph CS inside the hereditary class H, excludes this patch from a minimum CS failure.

Consequently, in such a minimum CS failure, EVERY triangle component of ANY chosen tree/triangle cover has exact q2 family type and sits in a literal K5 whose two apices are joined by a selected TREE edge.

## 3. Exact remaining gap

This normalization does not isolate those K5 triangle supports. Outside pages on their apex spokes may be based on other edges of the same larger tree cover component. The K5 outside boundary is not automatically contained in an avoidable C4, so the K5 peeling theorem cannot yet be invoked. Resolving those interfaces, or finding another contradiction, is still required for CS throughout H.

The strict cost-two lemma is an ordinary all-size theorem. The minimum-CS normalization is an ordinary argument using declared authenticated class-local M0/codegree and K4 star-boundary peeling, together with the separately frozen arbitrary-cover inequality, q3 strictness, and q2-to-K5 result. No finite computation or outside theorem is used. No unrestricted cover-shape availability or full equality classification is asserted.
